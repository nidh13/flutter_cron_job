import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifcationApi {
  // instance
  static final _notifications = FlutterLocalNotificationsPlugin();

  // show notification
  static Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static Future init({bool initSheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final ios = IOSInitializationSettings();
    final Settings = InitializationSettings(android: android, iOS: ios);
    await _notifications.initialize(Settings);
  }

  //notificaiton details
  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
            'channel id', 'channel name', 'chanel description',
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }
}