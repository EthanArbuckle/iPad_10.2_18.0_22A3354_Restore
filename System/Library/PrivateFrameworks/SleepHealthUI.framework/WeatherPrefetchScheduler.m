@implementation WeatherPrefetchScheduler

- (void)dealloc
{
  _TtC13SleepHealthUI24WeatherPrefetchScheduler *v2;
  objc_super v3;

  v2 = self;
  sub_1A9C5FD60();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for WeatherPrefetchScheduler();
  -[WeatherPrefetchScheduler dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  sub_1A9BD5744((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI24WeatherPrefetchScheduler_lastWakeUp);
}

- (_TtC13SleepHealthUI24WeatherPrefetchScheduler)init
{
  _TtC13SleepHealthUI24WeatherPrefetchScheduler *result;

  result = (_TtC13SleepHealthUI24WeatherPrefetchScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI24WeatherPrefetchScheduler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s13SleepHealthUI24WeatherPrefetchSchedulerC10sleepStore_0G22ScheduleModelDidChangeySo09HKSPSleepH0C_So0miJ0CtF_0();

}

- (void)sleepStore:(id)a3 sleepScheduleStateDidChange:(unint64_t)a4
{
  id v6;
  _TtC13SleepHealthUI24WeatherPrefetchScheduler *v7;

  v6 = a3;
  v7 = self;
  sub_1A9C604C4(a4);

}

- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI24WeatherPrefetchScheduler *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9C6078C(v7);

}

@end
