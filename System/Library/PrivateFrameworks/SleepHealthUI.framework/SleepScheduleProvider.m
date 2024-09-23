@implementation SleepScheduleProvider

- (void)dealloc
{
  void *v2;
  _TtC13SleepHealthUI21SleepScheduleProvider *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC13SleepHealthUI21SleepScheduleProvider_sleepStore);
  v3 = self;
  objc_msgSend(v2, sel_removeObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for SleepScheduleProvider();
  -[SleepScheduleProvider dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

- (_TtC13SleepHealthUI21SleepScheduleProvider)init
{
  _TtC13SleepHealthUI21SleepScheduleProvider *result;

  result = (_TtC13SleepHealthUI21SleepScheduleProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)sleepStore:(id)a3 sleepScheduleDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI21SleepScheduleProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9C8C9EC(a4);

}

- (void)sleepStore:(id)a3 sleepEventRecordDidChange:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI21SleepScheduleProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9C8CDB4(v7, "[%{public}s] Observed sleep event record change to %{public}s");

}

- (void)sleepStore:(id)a3 sleepEventDidOccur:(id)a4
{
  id v6;
  id v7;
  _TtC13SleepHealthUI21SleepScheduleProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A9C8CDB4(v7, "[%{public}s] Observed sleep event %{public}s");

}

@end
