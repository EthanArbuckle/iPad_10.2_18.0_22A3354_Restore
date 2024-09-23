@implementation ScheduleOccurrenceDayPickerTableViewCell

- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_1A9CE82E0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell *)sub_1A9CD951C(v4, v5);
}

- (_TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9CD96A8();
}

- (id)accessibilityDayPicker
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI40ScheduleOccurrenceDayPickerTableViewCell_picker));
}

@end
