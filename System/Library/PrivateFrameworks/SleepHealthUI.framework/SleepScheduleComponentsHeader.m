@implementation SleepScheduleComponentsHeader

- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9C54ED8();
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[SleepScheduleComponentsHeader tintColorDidChange](&v3, sel_tintColorDidChange);
  sub_1A9C51DE8();

}

- (id)accessibilityBedtimeTimeLabel
{
  _TtC13SleepHealthUI29SleepScheduleComponentsHeader *v2;
  id v3;

  v2 = self;
  v3 = sub_1A9C52664(&OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTimeLabel, (uint64_t (*)(uint64_t))sub_1A9C52B88);

  return v3;
}

- (id)accessibilityWakeUpTimeLabel
{
  _TtC13SleepHealthUI29SleepScheduleComponentsHeader *v2;
  id v3;

  v2 = self;
  v3 = sub_1A9C5286C(&OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTimeLabel, (uint64_t (*)(void))sub_1A9C52C84);

  return v3;
}

- (_TtC13SleepHealthUI29SleepScheduleComponentsHeader)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI29SleepScheduleComponentsHeader *result;

  result = (_TtC13SleepHealthUI29SleepScheduleComponentsHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9BD9114((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader_model);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpTimeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___bedtimeDayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader____lazy_storage___wakeUpDayLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI29SleepScheduleComponentsHeader_sizingTimeLabel));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
