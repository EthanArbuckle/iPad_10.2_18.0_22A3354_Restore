@implementation SleepScheduleClockCaption

- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithCoder:(id)a3
{
  id v4;
  _TtC13SleepHealthUI25SleepScheduleClockCaption *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleClockCaption_message) = 6;
  v4 = a3;

  result = (_TtC13SleepHealthUI25SleepScheduleClockCaption *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)accessibilityClockCaptionMessage
{
  int v2;
  void *v3;

  v2 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC13SleepHealthUI25SleepScheduleClockCaption_message);
  if (v2 == 6)
  {
    v3 = 0;
  }
  else
  {
    sub_1A9BEEED8(v2);
    v3 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  return v3;
}

- (_TtC13SleepHealthUI25SleepScheduleClockCaption)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI25SleepScheduleClockCaption *result;

  result = (_TtC13SleepHealthUI25SleepScheduleClockCaption *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
