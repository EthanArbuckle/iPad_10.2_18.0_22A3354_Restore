@implementation FMR1Transition

- (double)transitionDuration:(id)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_duration);
}

- (void)animateTransition:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003BLL, 0x80000001004B4630, "FindMy/FMR1FindingTransition.swift", 34, 2, 27, 0);
  __break(1u);
}

- (_TtC6FindMy14FMR1Transition)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_delay) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_springDamping) = (Class)0x407F400000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_initialSpringVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_animationOptions) = (Class)0x20000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_mass) = (Class)0x4008000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy14FMR1Transition_stiffness) = (Class)0x408F400000000000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMR1Transition();
  return -[FMR1Transition init](&v3, "init");
}

@end
