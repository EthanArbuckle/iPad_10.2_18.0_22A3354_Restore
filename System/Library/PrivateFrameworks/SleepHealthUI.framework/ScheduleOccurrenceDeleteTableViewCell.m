@implementation ScheduleOccurrenceDeleteTableViewCell

- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  void *v5;
  _TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell *v6;
  _TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell *v7;
  objc_super v9;

  if (a4)
  {
    sub_1A9CE82E0();
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
    v5 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
    *((_BYTE *)&self->super.super.super.super.isa
    + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ScheduleOccurrenceDeleteTableViewCell();
  v6 = -[ScheduleOccurrenceDeleteTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, 0, v5);

  v7 = v6;
  sub_1A9CAAF4C();
  sub_1A9CAB094();
  sub_1A9CAB1EC();

  return v7;
}

- (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell)initWithCoder:(id)a3
{
  id v4;
  _TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell_model) = 0;
  v4 = a3;

  result = (_TtC13SleepHealthUI37ScheduleOccurrenceDeleteTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

@end
