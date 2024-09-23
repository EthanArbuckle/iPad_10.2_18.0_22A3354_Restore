@implementation NotificationController

- (_TtC13appleaccountd22NotificationController)init
{
  return (_TtC13appleaccountd22NotificationController *)sub_1001B4C30();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd22NotificationController_notificationCenter));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC13appleaccountd22NotificationController *v11;

  v8 = _Block_copy(a5);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1001B5778(v10);
  _Block_release(v8);

}

@end
