@implementation CHFitnessAppBadgeAggregator

- (CHFitnessAppBadgeAggregator)initWithFitnessAppContext:(id)a3 activitySharingClient:(id)a4
{
  char *v5;
  id v6;

  v5 = (char *)a3;
  v6 = a4;
  return (CHFitnessAppBadgeAggregator *)sub_100025DE4(v5, a4);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR___CHFitnessAppBadgeAggregator_delegate, a3);
}

- (void)triggerFetch
{
  CHFitnessAppBadgeAggregator *v2;

  v2 = self;
  sub_100010160();
  sub_100017444();
  sub_10001ADE4();

}

- (BOOL)hasAmeliaBadge
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_hasAmeliaBadge);
}

- (CHFitnessAppBadgeAggregatorDelegate)delegate
{
  return (CHFitnessAppBadgeAggregatorDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR___CHFitnessAppBadgeAggregator_delegate);
}

- (void)setHasAmeliaBadge:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_hasAmeliaBadge) = a3;
}

- (void)onAvailabilityChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  CHFitnessAppBadgeAggregator *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_10002A828(0, 0);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (CHFitnessAppBadgeAggregator)init
{
  CHFitnessAppBadgeAggregator *result;

  result = (CHFitnessAppBadgeAggregator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.FitnessAppBadgeAggregator", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F61B4((uint64_t)self + OBJC_IVAR___CHFitnessAppBadgeAggregator_delegate);

  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppBadgeAggregator_contentAvailabilityClient));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_engagementAppBadgeProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_eventHub));
  _s10FitnessApp24HistoryViewActionContextVwxx_0((Class *)((char *)&self->super.isa
                                                         + OBJC_IVAR___CHFitnessAppBadgeAggregator_privacyPreferenceClient));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___CHFitnessAppBadgeAggregator_fetchedEngagementBadges));
}

- (void)refreshBadgeCount
{
  CHFitnessAppBadgeAggregator *v2;

  v2 = self;
  sub_100010160();
  sub_100017444();
  sub_10001ADE4();

}

@end
