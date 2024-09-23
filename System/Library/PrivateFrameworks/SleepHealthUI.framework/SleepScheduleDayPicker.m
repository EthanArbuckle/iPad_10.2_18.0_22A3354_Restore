@implementation SleepScheduleDayPicker

- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithCoder:(id)a3
{
  id v5;
  _TtC13SleepHealthUI22SleepScheduleDayPicker *result;

  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_days) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = a3;

  result = (_TtC13SleepHealthUI22SleepScheduleDayPicker *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)accessibilityPickerDays
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for SleepScheduleDayPickerDay();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A9CE83D0();
  swift_bridgeObjectRelease();
  return v2;
}

- (_TtC13SleepHealthUI22SleepScheduleDayPicker)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI22SleepScheduleDayPicker *result;

  result = (_TtC13SleepHealthUI22SleepScheduleDayPicker *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9B94894((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_alertPresenter);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22SleepScheduleDayPicker_model));
  swift_bridgeObjectRelease();
}

- (void)didTapDay:(id)a3
{
  id v4;
  _TtC13SleepHealthUI22SleepScheduleDayPicker *v5;

  v4 = a3;
  v5 = self;
  sub_1A9CBEBFC(v4);

}

@end
