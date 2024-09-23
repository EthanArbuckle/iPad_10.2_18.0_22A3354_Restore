@implementation LockScreenContentModel

- (void)dealloc
{
  _TtC13SleepHealthUI22LockScreenContentModel *v2;

  v2 = self;
  LockScreenContentModel.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  char *v6;
  uint64_t v7;

  swift_bridgeObjectRelease();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel__state;
  v4 = MEMORY[0x1E0C96198];
  sub_1A9B94CA0(0, &qword_1EEB456D8, (uint64_t)&type metadata for LockScreenContentState, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
  v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel__alarmButtonPressed;
  sub_1A9B94CA0(0, (unint64_t *)&qword_1EEB456F0, MEMORY[0x1E0DEAFA0], (uint64_t (*)(_QWORD, uint64_t))v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  swift_release();
  sub_1A9B97190((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel____lazy_storage___gregorianCalendar, (uint64_t (*)(_QWORD))sub_1A9BE9F04);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22LockScreenContentModel_sleepScheduleModel));
}

- (void)sleepStore:(id)a3 sleepScheduleModelDidChange:(id)a4
{
  id v6;
  _TtC13SleepHealthUI22LockScreenContentModel *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_1A9BE9628(v6);

}

- (_TtC13SleepHealthUI22LockScreenContentModel)init
{
  _TtC13SleepHealthUI22LockScreenContentModel *result;

  result = (_TtC13SleepHealthUI22LockScreenContentModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
