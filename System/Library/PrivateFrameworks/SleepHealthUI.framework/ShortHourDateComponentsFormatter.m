@implementation ShortHourDateComponentsFormatter

- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI32ShortHourDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)stringFromTimeInterval:(double)a3
{
  _TtC13SleepHealthUI32ShortHourDateComponentsFormatter *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = self;
  sub_1A9C0E838(a3);
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter)init
{
  _TtC13SleepHealthUI32ShortHourDateComponentsFormatter *result;

  result = (_TtC13SleepHealthUI32ShortHourDateComponentsFormatter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)stringFromDateComponents:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v0 = sub_1A9CE60C0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0, v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE6024();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return 0;
}

@end
