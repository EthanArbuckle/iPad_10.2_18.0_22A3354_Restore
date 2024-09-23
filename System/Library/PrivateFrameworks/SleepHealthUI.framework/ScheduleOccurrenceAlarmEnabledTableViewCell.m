@implementation ScheduleOccurrenceAlarmEnabledTableViewCell

- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  _TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell *v6;
  _TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_1A9CE82E0();
    v5 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScheduleOccurrenceAlarmEnabledTableViewCell();
  v6 = -[HKSwitchTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 1, v5);

  v7 = v6;
  sub_1A9CC5A7C();

  return v7;
}

- (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell)initWithCoder:(id)a3
{
  _TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell *result;

  result = (_TtC13SleepHealthUI43ScheduleOccurrenceAlarmEnabledTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

@end
