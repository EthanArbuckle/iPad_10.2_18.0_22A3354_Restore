@implementation MoveModeSettingsCell

- (_TtC10FitnessApp20MoveModeSettingsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CHWorkoutDetailHeartRateTableViewCell *v5;
  CHWorkoutDetailHeartRateTableViewCell *v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC10FitnessApp20MoveModeSettingsCell *)sub_100307F84(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MoveModeSettingsCell();
  v2 = (char *)v4.receiver;
  -[MoveModeSettingsCell prepareForReuse](&v4, "prepareForReuse");
  v3 = &v2[OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate];
  *((_QWORD *)v3 + 1) = 0;
  swift_unknownObjectWeakAssign(v3, 0);

}

- (_TtC10FitnessApp20MoveModeSettingsCell)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC10FitnessApp20MoveModeSettingsCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_moveTimeSwitch) = 0;
  v6 = a3;

  result = (_TtC10FitnessApp20MoveModeSettingsCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100689100, "FitnessApp/MoveModeSettingsCell.swift", 37, 2, 48, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000F61B4((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_moveTimeSwitch));
}

@end
