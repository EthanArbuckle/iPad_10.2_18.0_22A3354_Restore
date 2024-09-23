@implementation FMCardTransition

- (double)transitionDuration:(id)a3
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_duration);
}

- (void)animateTransition:(id)a3
{
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003BLL, 0x80000001004B4630, "FindMy/FMCardTransition.swift", 29, 2, 36, 0);
  __break(1u);
}

- (_TtC6FindMy16FMCardTransition)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_duration) = (Class)0x3FE0000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_delay) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_springDamping) = (Class)0x3FECCCCCCCCCCCCDLL;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_initialSpringVelocity) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6FindMy16FMCardTransition_animationOptions) = (Class)0x20000;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMCardTransition();
  return -[FMCardTransition init](&v3, "init");
}

@end
