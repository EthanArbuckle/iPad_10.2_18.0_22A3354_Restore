@implementation UserNotificationMonitor

- (_TtC7Weather23UserNotificationMonitor)init
{
  UserNotificationMonitor.init()();
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->dispatcher[OBJC_IVAR____TtC7Weather23UserNotificationMonitor_dispatcher]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7Weather23UserNotificationMonitor_userNotificationCenter));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7Weather23UserNotificationMonitor_store));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  sub_10081E550(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_10081C5E8);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  sub_10081E550(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_10081E4F0);
}

- (void)userNotificationCenter:(id)a3 openSettingsForNotification:(id)a4
{
  id v6;
  id v7;
  _TtC7Weather23UserNotificationMonitor *v8;
  UNNotification_optional v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  UserNotificationMonitor.userNotificationCenter(_:openSettingsFor:)((UNUserNotificationCenter)v8, v9);

}

@end
