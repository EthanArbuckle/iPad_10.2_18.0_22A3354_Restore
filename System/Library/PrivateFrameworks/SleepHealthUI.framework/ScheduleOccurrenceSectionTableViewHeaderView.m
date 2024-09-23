@implementation ScheduleOccurrenceSectionTableViewHeaderView

- (UILabel)textLabel
{
  return (UILabel *)0;
}

- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = sub_1A9CE82E0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView *)ScheduleOccurrenceSectionTableViewHeaderView.init(reuseIdentifier:)(v3, v4);
}

- (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView *result;

  result = (_TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI44ScheduleOccurrenceSectionTableViewHeaderView_headerView));
}

@end
