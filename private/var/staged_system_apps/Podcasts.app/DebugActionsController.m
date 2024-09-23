@implementation DebugActionsController

- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122DebugActionsController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DebugActionsController();
  return -[DebugActionsController init](&v3, "init");
}

- (void)sendRandomNotification
{
  sub_10022410C(self, (uint64_t)a2, (Class *)&off_1004A4480, (SEL *)&selRef_sendRandomNotification);
}

- (void)sendMostRecentNotification
{
  sub_10022410C(self, (uint64_t)a2, (Class *)&off_1004A4480, (SEL *)&selRef_sendMostRecentNotification);
}

- (void)sendOldestNoticication
{
  sub_10022410C(self, (uint64_t)a2, (Class *)&off_1004A4480, (SEL *)&selRef_sendOldestNotification);
}

- (void)clearAll
{
  sub_10022410C(self, (uint64_t)a2, (Class *)&off_1004A4480, (SEL *)&selRef_clearAllLocalNotifications);
}

- (void)showiOSDebugMenu
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122DebugActionsController *v2;

  v2 = self;
  sub_100224174();

}

@end
