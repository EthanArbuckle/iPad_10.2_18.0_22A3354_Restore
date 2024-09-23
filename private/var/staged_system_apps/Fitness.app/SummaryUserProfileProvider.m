@implementation SummaryUserProfileProvider

- (void)dealloc
{
  _TtC10FitnessApp26SummaryUserProfileProvider *v2;

  v2 = self;
  sub_1001525E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_activityDataProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_fitnessPlusSubscriptionProvider));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_seymourAvailabilityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_trendsAvailabilityManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_wheelchairCache));
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_notificationCenterObservers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_fetchRequests));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC10FitnessApp26SummaryUserProfileProvider_protectedState));
}

- (_TtC10FitnessApp26SummaryUserProfileProvider)init
{
  _TtC10FitnessApp26SummaryUserProfileProvider *result;

  result = (_TtC10FitnessApp26SummaryUserProfileProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.SummaryUserProfileProvider", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _TtC10FitnessApp26SummaryUserProfileProvider *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_100153F7C(v4);

}

@end
