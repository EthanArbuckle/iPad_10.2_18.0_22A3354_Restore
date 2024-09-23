@implementation TrendsAvailabilityManager

- (_TtC10FitnessApp25TrendsAvailabilityManager)initWithDataProvider:(id)a3 healthStore:(id)a4
{
  return (_TtC10FitnessApp25TrendsAvailabilityManager *)sub_100018848(a3, a4);
}

- (void)activitySummaryDidChangeWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10FitnessApp25TrendsAvailabilityManager *v10;
  uint64_t v11;

  v5 = sub_100047110((uint64_t *)&unk_100832590);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Notification(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Notification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_10000CEAC((uint64_t)v7);

  sub_10001BE90((uint64_t)v7, (uint64_t *)&unk_100832590);
}

- (int64_t)trendsAvailability
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC10FitnessApp25TrendsAvailabilityManager_trendsAvailability);
}

+ (NSString)trendsAvailabilityDidChangeNotification
{
  if (qword_10081DE28 != -1)
    swift_once(&qword_10081DE28, sub_10004E610);
  return (NSString *)(id)qword_10086AC40;
}

- (void)setTrendsAvailability:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp25TrendsAvailabilityManager_trendsAvailability) = (Class)a3;
}

- (void)updateWithNote:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC10FitnessApp25TrendsAvailabilityManager *v10;
  uint64_t v11;

  v5 = sub_100047110((uint64_t *)&unk_100832590);
  __chkstk_darwin(v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for Notification(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Notification(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  sub_10001D350();

  sub_10001BE90((uint64_t)v7, (uint64_t *)&unk_100832590);
}

- (_TtC10FitnessApp25TrendsAvailabilityManager)init
{
  _TtC10FitnessApp25TrendsAvailabilityManager *result;

  result = (_TtC10FitnessApp25TrendsAvailabilityManager *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TrendsAvailabilityManager", 36, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
