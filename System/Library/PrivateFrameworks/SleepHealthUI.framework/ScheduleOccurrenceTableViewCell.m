@implementation ScheduleOccurrenceTableViewCell

- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1A9CE82E0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell *)sub_1A9C50838(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell)initWithCoder:(id)a3
{
  char *v5;
  char *v6;
  uint64_t v7;
  id v8;
  _TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell_viewModelProviding;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell____lazy_storage___occurrenceView;
  v7 = type metadata accessor for ScheduleOccurrenceView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = a3;

  result = (_TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell *)sub_1A9CE8A84();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9C0F26C((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell_viewModelProviding, &qword_1EEB47C58, (void (*)(uint64_t))sub_1A9C50FC0);
  sub_1A9C0F26C((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI31ScheduleOccurrenceTableViewCell____lazy_storage___occurrenceView, &qword_1EEB47F08, (void (*)(uint64_t))type metadata accessor for ScheduleOccurrenceView);
}

@end
