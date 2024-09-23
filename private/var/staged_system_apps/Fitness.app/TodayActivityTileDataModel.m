@implementation TodayActivityTileDataModel

- (void)dealloc
{
  _TtC10FitnessApp26TodayActivityTileDataModel *v2;

  v2 = self;
  sub_1002B81F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_activityDataProvider));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_todayCell);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_activitySummary));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC10FitnessApp26TodayActivityTileDataModel_observers));
}

- (_TtC10FitnessApp26TodayActivityTileDataModel)init
{
  _TtC10FitnessApp26TodayActivityTileDataModel *result;

  result = (_TtC10FitnessApp26TodayActivityTileDataModel *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.TodayActivityTileDataModel", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
