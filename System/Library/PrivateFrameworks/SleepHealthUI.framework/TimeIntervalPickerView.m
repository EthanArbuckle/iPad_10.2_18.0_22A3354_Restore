@implementation TimeIntervalPickerView

- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithCoder:(id)a3
{
  return (_TtC13SleepHealthUI22TimeIntervalPickerView *)sub_1A9C2FCB8(a3);
}

- (_TtC13SleepHealthUI22TimeIntervalPickerView)initWithFrame:(CGRect)a3
{
  _TtC13SleepHealthUI22TimeIntervalPickerView *result;

  result = (_TtC13SleepHealthUI22TimeIntervalPickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView____lazy_storage___hourFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView____lazy_storage___minuteFormatter));
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  if (*((_BYTE *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
       + OBJC_IVAR____TtC13SleepHealthUI22TimeIntervalPickerView_configuration))
    return 1;
  else
    return 2;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_1A9C30808(a4);
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v8;
  _TtC13SleepHealthUI22TimeIntervalPickerView *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = self;
  sub_1A9C30AD4(a4, a5);
  v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v8;
  __n128 v9;
  _TtC13SleepHealthUI22TimeIntervalPickerView *v10;

  v8 = a3;
  v10 = self;
  sub_1A9C30308((char *)a4, a5, 1, v9);

}

@end
