@implementation ScheduleOccurrenceComponentsEditTableViewCell

- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell *)sub_1A9C5841C(v4, v5);
}

- (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell *result;

  result = (_TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (id)accessibilityComponentsEditView
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell_editView);
  swift_beginAccess();
  return *v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI45ScheduleOccurrenceComponentsEditTableViewCell_editView));
}

@end
