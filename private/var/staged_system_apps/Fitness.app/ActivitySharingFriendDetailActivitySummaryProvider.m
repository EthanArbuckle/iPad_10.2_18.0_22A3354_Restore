@implementation ActivitySharingFriendDetailActivitySummaryProvider

- (id)activitySummaryForCacheIndex:(int64_t)a3
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v4;
  id v5;

  v4 = self;
  v5 = sub_100462FD4(a3);

  return v5;
}

- (int64_t)numberOfActivitySummaries
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v2;
  id v3;

  v2 = self;
  v3 = sub_100463190();

  return (int64_t)v3;
}

- (int64_t)earliestActivitySummaryIndex
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_100463294();
  v4 = v3;

  return v4;
}

- (int64_t)latestActivitySummaryIndex
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1004632D0();
  v4 = v3;

  return v4;
}

- (int64_t)fitnessStartOfWeekOffset
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_100463494();

  return v3;
}

- (BOOL)isStandaloneForCacheIndex:(int64_t)a3
{
  id v5;
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *v6;
  id v7;

  v5 = objc_allocWithZone((Class)NSNumber);
  v6 = self;
  v7 = objc_msgSend(v5, "initWithLongLong:", a3);
  LOBYTE(v5) = objc_msgSend(*(id *)((char *)&v6->super.isa+ OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_friend), "estimatedIsStandaloneForSnapshotIndex:", v7);

  return (char)v5;
}

- (_TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider)init
{
  _TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *result;

  result = (_TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivitySharingFriendDetailActivitySummaryProvider", 61, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_friend));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp50ActivitySharingFriendDetailActivitySummaryProvider_pauseRingsCoordinator));
}

@end
