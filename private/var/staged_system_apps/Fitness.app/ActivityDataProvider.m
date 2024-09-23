@implementation ActivityDataProvider

- (void)updateWidgets
{
  _TtC10FitnessApp20ActivityDataProvider *v3;
  uint64_t v4;

  type metadata accessor for WidgetCenter(0);
  v3 = self;
  v4 = static WidgetCenter.shared.getter();
  dispatch thunk of WidgetCenter.reloadAllTimelines()();

  swift_release(v4);
}

- (_TtC10FitnessApp20ActivityDataProvider)initWithHealthStore:(id)a3 wheelchairUseCache:(id)a4 workoutDataProvider:(id)a5 achievementsDataProvider:(id)a6
{
  return (_TtC10FitnessApp20ActivityDataProvider *)sub_100015D60(a3, a4, a5, a6);
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore));
}

- (void)setHealthStore:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_healthStore) = (Class)a3;
  v3 = a3;

}

- (CHWorkoutDataProvider)workoutDataProvider
{
  return (CHWorkoutDataProvider *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider));
}

- (void)setWorkoutDataProvider:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_workoutDataProvider) = (Class)a3;
  v3 = a3;

}

- (_TtC10FitnessApp29ActivitySummaryChangeListener)activitySummaryListener
{
  return (_TtC10FitnessApp29ActivitySummaryChangeListener *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_activitySummaryListener);
}

- (BOOL)isWheelchairUser
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_isWheelchairUser);
}

- (void)setIsWheelchairUser:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_isWheelchairUser) = a3;
}

- (void)dealloc
{
  void *v2;
  _TtC10FitnessApp20ActivityDataProvider *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_wheelchairCache);
  v3 = self;
  objc_msgSend(v2, "removeObserver:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ActivityDataProvider(0);
  -[ActivityDataProvider dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_activitySummaryListener));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider_achievementsDataProvider));

  sub_10001BE90((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20ActivityDataProvider____lazy_storage___currentCalendar, (uint64_t *)&unk_100827450);
}

- (_TtC10FitnessApp20ActivityDataProvider)init
{
  _TtC10FitnessApp20ActivityDataProvider *result;

  result = (_TtC10FitnessApp20ActivityDataProvider *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.ActivityDataProvider", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  id v6;
  _TtC10FitnessApp20ActivityDataProvider *v7;

  v6 = a3;
  v7 = self;
  sub_1001973FC(a4);

}

@end
