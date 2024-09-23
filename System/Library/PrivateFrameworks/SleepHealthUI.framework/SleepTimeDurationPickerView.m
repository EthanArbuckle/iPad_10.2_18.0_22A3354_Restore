@implementation SleepTimeDurationPickerView

- (_TtC13SleepHealthUI27SleepTimeDurationPickerView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC13SleepHealthUI27SleepTimeDurationPickerView *result;

  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC13SleepHealthUI27SleepTimeDurationPickerView_viewModel);
  *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v5 = a3;

  result = (_TtC13SleepHealthUI27SleepTimeDurationPickerView *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI27SleepTimeDurationPickerView)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI27SleepTimeDurationPickerView *result;

  result = (_TtC13SleepHealthUI27SleepTimeDurationPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI27SleepTimeDurationPickerView_picker));
  objc_release(*(id *)((char *)&self->super._animationInfo
                     + OBJC_IVAR____TtC13SleepHealthUI27SleepTimeDurationPickerView_viewModel));
}

@end
