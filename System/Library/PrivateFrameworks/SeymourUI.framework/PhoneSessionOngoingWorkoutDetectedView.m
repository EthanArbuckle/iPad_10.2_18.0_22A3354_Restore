@implementation PhoneSessionOngoingWorkoutDetectedView

- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B9E1CD0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for PhoneSessionOngoingWorkoutDetectedView();
  v4 = a3;
  v5 = v12.receiver;
  -[PhoneSessionOngoingWorkoutDetectedView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  v6 = objc_msgSend(v5, sel_traitCollection, v12.receiver, v12.super_class);
  objc_msgSend(v5, sel_bounds);
  v11 = sub_22B90A08C(v6, v7, v8, v9, v10);
  sub_22B9E0D78(v11, MEMORY[0x24BEE4AF8], a3, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_previousBounds, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_landscapeConstraints, &OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_portraitConstraints);

  objc_msgSend(v5, sel_setNeedsUpdateConstraints);
}

- (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView *result;

  result = (_TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_stackView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI38PhoneSessionOngoingWorkoutDetectedView_descriptionLabel));
}

@end
