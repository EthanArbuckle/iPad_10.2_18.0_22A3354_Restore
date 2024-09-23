@implementation FriendsSetupCoordinator

- (void)applicationDidBecomeActive
{
  _TtC10FitnessApp23FriendsSetupCoordinator *v2;

  v2 = self;
  sub_100008CD0();

}

- (_TtC10FitnessApp23FriendsSetupCoordinator)initWithFriendManager:(id)a3 friendListSectionManager:(id)a4
{
  _TtC10FitnessApp23FriendsSetupCoordinator *result;

  sub_10001FAA4(a3, a4);
  return result;
}

- (void)dealloc
{
  _TtC10FitnessApp23FriendsSetupCoordinator *v2;
  __CFNotificationCenter *v3;
  id v4;
  objc_super v5;

  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v4, "removeObserver:", v2);

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for FriendsSetupCoordinator(0);
  -[FriendsSetupCoordinator dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_friendListSectionManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_nanoSystemSettingsManager));
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_lastPhoneCloudKitAccountFetchTimestamp, (uint64_t *)&unk_100828370);
  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator_lastWatchCloudKitAccountFetchTimestamp, (uint64_t *)&unk_100828370);
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator__activitySharingIsSetup;
  v4 = sub_100047110(&qword_10083B500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp23FriendsSetupCoordinator__setupPhase;
  v6 = sub_100047110(&qword_10083B4F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (_TtC10FitnessApp23FriendsSetupCoordinator)init
{
  _TtC10FitnessApp23FriendsSetupCoordinator *result;

  result = (_TtC10FitnessApp23FriendsSetupCoordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.FriendsSetupCoordinator", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (BOOL)friendsSetupViewControllerShouldTransitionToCloudKitSignInPhase:(id)a3
{
  id v4;
  _TtC10FitnessApp23FriendsSetupCoordinator *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100581FD0((uint64_t)v5);

  return (self & 1) == 0;
}

- (void)friendsSetupViewController:(id)a3 didCompletePhase:(int64_t)a4
{
  id v6;
  _TtC10FitnessApp23FriendsSetupCoordinator *v7;

  v6 = a3;
  v7 = self;
  sub_10058294C(a4);

}

- (void)friendsSetupViewControllerDidCompleteSetup:(id)a3
{
  uint64_t KeyPath;
  uint64_t v5;
  char v6;

  KeyPath = swift_getKeyPath(&unk_1006473B0);
  v5 = swift_getKeyPath(&unk_1006473D8);
  v6 = 1;
  static Published.subscript.setter(&v6, self, KeyPath, v5);
}

@end
