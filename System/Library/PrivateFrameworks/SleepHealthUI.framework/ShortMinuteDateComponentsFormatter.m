@implementation ShortMinuteDateComponentsFormatter

- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  id v5;
  _TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *v6;
  id v7;
  id v8;
  id result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initWithDouble_, a3);
  swift_beginAccess();
  v8 = (id)HKTimePeriodString();

  if (v8)
  {
    v10 = sub_1A9CE82E0();
    v12 = v11;

    sub_1A9C0D818(v10, v12);
    swift_bridgeObjectRelease();
    v13 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter)init
{
  _TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI34ShortMinuteDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
