@implementation DurationPickerView

- (_TtC14WorkflowEditor18DurationPickerView)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditor18DurationPickerView *)sub_22672AA74();
}

- (_TtC14WorkflowEditor18DurationPickerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22672ABC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_timePicker));
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_hoursLabel);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_minutesLabel);
  OUTLINED_FUNCTION_9_17(OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_secondsLabel);
  sub_22666DCBC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC14WorkflowEditor18DurationPickerView_onDurationChange));
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 3;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return sub_22672ACFC((uint64_t)self, a4);
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id v10;
  id v11;
  _TtC14WorkflowEditor18DurationPickerView *v12;
  id v13;

  v10 = a3;
  v11 = a6;
  v12 = self;
  v13 = sub_22672AD70((uint64_t)v12, a4, a5, a6);

  return v13;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  id v6;
  _TtC14WorkflowEditor18DurationPickerView *v7;

  v6 = a3;
  v7 = self;
  sub_22672B0F4();

}

- (double)pickerView:(id)a3 widthForComponent:(int64_t)a4
{
  id v5;
  _TtC14WorkflowEditor18DurationPickerView *v6;
  double v7;

  v5 = a3;
  v6 = self;
  v7 = sub_22672B374();

  return v7;
}

- (double)pickerView:(id)a3 rowHeightForComponent:(int64_t)a4
{
  id v5;
  _TtC14WorkflowEditor18DurationPickerView *v6;
  double v7;

  v5 = a3;
  v6 = self;
  v7 = sub_22672B3C8();

  return v7;
}

@end
