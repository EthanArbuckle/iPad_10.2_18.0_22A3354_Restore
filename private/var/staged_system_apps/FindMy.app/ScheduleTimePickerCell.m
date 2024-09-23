@implementation ScheduleTimePickerCell

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell *)sub_1000998A4(v4, v5);
}

- (_TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100099ACC();
}

- (void)timeChanged
{
  uint64_t Strong;
  uint64_t v4;
  _TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = self;
    sub_10008B238((uint64_t)v5);

    swift_unknownObjectRelease(v4);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_timePicker));
  v3 = (char *)self + OBJC_IVAR____TtC6FindMyP33_E1D0B8A6ADDE9504767060C8F9C7ED2F22ScheduleTimePickerCell_gregorian;
  v4 = type metadata accessor for Calendar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
