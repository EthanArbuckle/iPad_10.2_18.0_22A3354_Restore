@implementation PMNotificationManager

- (_TtC17PasswordManagerUI21PMNotificationManager)init
{
  return (_TtC17PasswordManagerUI21PMNotificationManager *)PMNotificationManager.init()();
}

- (void)notificationManager:(id)a3 didReceiveResponseOfType:(int64_t)a4 toNotificationOfType:(int64_t)a5 withUserInfo:(id)a6
{
  uint64_t v10;
  id v11;
  _TtC17PasswordManagerUI21PMNotificationManager *v12;

  v10 = sub_243850180();
  v11 = a3;
  v12 = self;
  sub_2437362AC(a4, a5, v10);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager_notificationManager));
  sub_2435381CC((uint64_t)self + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager__accountForGuidedAccountSavingFlow, &qword_2572B3850);
  sub_2435381CC((uint64_t)self + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager__accountWithRecentlyCreatedPasskey, &qword_2572B3850);
  v3 = (char *)self + OBJC_IVAR____TtC17PasswordManagerUI21PMNotificationManager___observationRegistrar;
  v4 = sub_24384DA5C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
