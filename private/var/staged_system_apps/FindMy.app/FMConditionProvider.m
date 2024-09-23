@implementation FMConditionProvider

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC6FindMy19FMConditionProvider *v5;

  v4 = a3;
  v5 = self;
  sub_10001CE40(v4);

}

- (void)checkNetworkState
{
  void *v2;
  unsigned __int8 v3;
  _TtC6FindMy19FMConditionProvider *v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy19FMConditionProvider_networkMonitor);
  v4 = self;
  v3 = objc_msgSend(v2, "isNetworkUp");
  *((_BYTE *)&v4->super.isa + OBJC_IVAR____TtC6FindMy19FMConditionProvider_isNetworkUp) = v3;
  sub_100023C30();

}

- (_TtC6FindMy19FMConditionProvider)init
{
  return (_TtC6FindMy19FMConditionProvider *)sub_10001ECCC();
}

- (void)refreshRestrictions
{
  _TtC6FindMy19FMConditionProvider *v2;

  v2 = self;
  sub_10000C24C();

}

- (void)accountChangedNotificationReceivedWithNotification:(id)a3
{
  id v4;
  _TtC6FindMy19FMConditionProvider *v5;

  v4 = a3;
  v5 = self;
  sub_100377A70(v4);

}

- (void)airplaneModeChanged
{
  _TtC6FindMy19FMConditionProvider *v2;

  v2 = self;
  sub_100378198();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC6FindMy19FMConditionProvider_subscriptions));

  swift_bridgeObjectRelease(*(_QWORD *)&self->subscriptions[OBJC_IVAR____TtC6FindMy19FMConditionProvider_fmfAccountIdentifier]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->subscriptions[OBJC_IVAR____TtC6FindMy19FMConditionProvider_fmipAccountIdentifier]);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC6FindMy19FMConditionProvider_notificationSettingsObserver));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy19FMConditionProvider_areFriendsInitializedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy19FMConditionProvider_areDevicesInitializedSubject));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy19FMConditionProvider_areFriendsInitializedPublisher));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC6FindMy19FMConditionProvider_areDevicesInitializedPublisher));
}

@end
