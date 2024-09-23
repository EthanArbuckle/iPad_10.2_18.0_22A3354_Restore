@implementation ScheduleOccurrenceComponentsAccessibilityTableViewCell

- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell *)sub_1A9C4B734(v4, v5);
}

- (void)datePickerDidChange
{
  _TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell *v2;

  v2 = self;
  sub_1A9C48774();

}

- (void)datePickerDidEndEditing
{
  _TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell *v2;

  v2 = self;
  sub_1A9C48D88();

}

- (_TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9C4BEEC();
}

- (void).cxx_destruct
{
  sub_1A9B94894((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_delegate);
  sub_1A9BD9114((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_model);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell____lazy_storage___alertImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI54ScheduleOccurrenceComponentsAccessibilityTableViewCell_datePicker));
}

@end
