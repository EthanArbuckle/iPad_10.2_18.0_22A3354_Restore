@implementation ShorterDateComponentsFormatter

- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI30ShorterDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI30ShorterDateComponentsFormatter *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  id v5;
  _TtC13SleepHealthUI30ShorterDateComponentsFormatter *v6;
  id v7;
  id v8;
  void *v9;

  v5 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  v6 = self;
  v7 = objc_msgSend(v5, sel_initWithDouble_, a3);
  swift_beginAccess();
  v8 = (id)HKTimePeriodString();

  if (v8)
  {
    sub_1A9CE82E0();

    v9 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {

    v9 = 0;
  }
  return v9;
}

- (id)stringFromDateComponents:(id)a3
{
  return sub_1A9C0E4E8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1A9C0E420);
}

- (_TtC13SleepHealthUI30ShorterDateComponentsFormatter)init
{
  _TtC13SleepHealthUI30ShorterDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI30ShorterDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
