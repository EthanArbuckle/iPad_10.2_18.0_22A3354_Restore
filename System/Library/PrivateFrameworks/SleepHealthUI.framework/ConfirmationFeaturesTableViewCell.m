@implementation ConfirmationFeaturesTableViewCell

- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell *)sub_1A9CA1A64(a3, (uint64_t)a4, v6);
}

- (_TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9CA33E8();
}

- (void).cxx_destruct
{
  sub_1A9BEDB34((uint64_t)self + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_item, (unint64_t *)&qword_1EEB44998, (unint64_t *)&qword_1EEB449A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepFocusModeView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepScreenView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_windDownView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_sleepTrackingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SleepHealthUI33ConfirmationFeaturesTableViewCell_healthStatusView));
  swift_bridgeObjectRelease();
}

@end
