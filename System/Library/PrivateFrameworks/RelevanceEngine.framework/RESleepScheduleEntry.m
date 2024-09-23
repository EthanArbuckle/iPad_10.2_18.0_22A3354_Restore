@implementation RESleepScheduleEntry

- (NSDate)wakeupTime
{
  return (NSDate *)sub_2133CCC80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
}

- (void)setWakeupTime:(id)a3
{
  sub_2133CCDC0(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
}

- (NSDate)bedtime
{
  return (NSDate *)sub_2133CCC80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

- (void)setBedtime:(id)a3
{
  sub_2133CCDC0(self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

- (_TtC15RelevanceEngine20RESleepScheduleEntry)initWithWakeupTime:(id)a3 bedtime:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  char *v17;
  _TtC15RelevanceEngine20RESleepScheduleEntry *v18;
  objc_class *v19;
  _TtC15RelevanceEngine20RESleepScheduleEntry *v20;
  uint64_t v22;
  objc_super v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9A980);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - v10;
  if (a3)
  {
    sub_2133D4520();
    v12 = sub_2133D452C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = sub_2133D452C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  if (a4)
  {
    sub_2133D4520();
    v14 = sub_2133D452C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 0, 1, v14);
  }
  else
  {
    v14 = sub_2133D452C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = (char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime;
  sub_2133D452C();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v16(v15, 1, 1, v14);
  v17 = (char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime;
  v16((char *)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime, 1, 1, v14);
  swift_beginAccess();
  v18 = self;
  sub_2133CD158((uint64_t)v11, (uint64_t)v15);
  swift_endAccess();
  swift_beginAccess();
  sub_2133CD158((uint64_t)v9, (uint64_t)v17);
  swift_endAccess();

  v19 = (objc_class *)type metadata accessor for RESleepScheduleEntry();
  v23.receiver = v18;
  v23.super_class = v19;
  v20 = -[RESleepScheduleEntry init](&v23, sel_init);
  sub_2133CD1A0((uint64_t)v9);
  sub_2133CD1A0((uint64_t)v11);
  return v20;
}

+ (id)sleepEntryForDatesWithCurrent:(id)a3 next:(id)a4 schedule:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  _QWORD *v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v6 = sub_2133D452C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v17 - v11;
  sub_2133D4520();
  sub_2133D4520();
  v13 = a5;
  v14 = _s15RelevanceEngine20RESleepScheduleEntryC05sleepE8ForDates7current4next8scheduleAC10Foundation4DateV_AJSo09HKSPSleepD0CtFZ_0(v12, v10, v13);

  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  v15(v10, v6);
  v15(v12, v6);
  return v14;
}

- (_TtC15RelevanceEngine20RESleepScheduleEntry)init
{
  _TtC15RelevanceEngine20RESleepScheduleEntry *result;

  result = (_TtC15RelevanceEngine20RESleepScheduleEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2133CD1A0((uint64_t)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_wakeupTime);
  sub_2133CD1A0((uint64_t)self + OBJC_IVAR____TtC15RelevanceEngine20RESleepScheduleEntry_bedtime);
}

@end
