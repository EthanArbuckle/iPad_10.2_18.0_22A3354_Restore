@implementation ScheduleOccurrenceAlarmVolumeTableViewCell

- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell *)sub_1A9C6B304(v4, v5);
}

- (_TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9C6B484();
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_configuration);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_configuration));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI42ScheduleOccurrenceAlarmVolumeTableViewCell_slider));
}

@end
