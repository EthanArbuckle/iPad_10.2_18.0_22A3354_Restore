@implementation ScheduleDaysOfWeekCell

- (void)dayButtonPressed:(id)a3
{
  id v4;
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *v5;

  v4 = a3;
  v5 = self;
  sub_100096054((uint64_t)v4);

}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *)sub_1000967A4(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell)initWithCoder:(id)a3
{
  id v5;
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *result;

  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_isEditable) = 1;
  v5 = a3;

  result = (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMLocationAlertViewController.swift", 42, 2, 2036, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_dayButtons));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_buttonsContainerView));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleDaysOfWeekCell_daysOfWeek;
  v4 = type metadata accessor for FMFSchedule.DaysOfWeek(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
