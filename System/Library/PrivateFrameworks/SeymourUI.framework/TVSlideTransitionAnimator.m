@implementation TVSlideTransitionAnimator

- (_TtC9SeymourUI25TVSlideTransitionAnimator)init
{
  char *v2;
  objc_super v4;

  v2 = (char *)self + OBJC_IVAR____TtC9SeymourUI25TVSlideTransitionAnimator_configuration;
  *(_OWORD *)v2 = xmmword_22BAAD710;
  *((_OWORD *)v2 + 1) = xmmword_22BAAD720;
  *((_QWORD *)v2 + 4) = 0x4056800000000000;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVSlideTransitionAnimator();
  return -[TVSlideTransitionAnimator init](&v4, sel_init);
}

- (double)transitionDuration:(id)a3
{
  _TtC9SeymourUI25TVSlideTransitionAnimator *v3;
  double v4;

  if (!a3)
    return 0.0;
  v3 = self;
  v4 = 0.0;
  if (objc_msgSend((id)swift_unknownObjectRetain(), sel_isAnimated))
    v4 = *(double *)((char *)&v3->super.isa + OBJC_IVAR____TtC9SeymourUI25TVSlideTransitionAnimator_configuration);
  swift_unknownObjectRelease();

  return v4;
}

- (void)animateTransition:(id)a3
{
  _TtC9SeymourUI25TVSlideTransitionAnimator *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_22B644210(a3);
  swift_unknownObjectRelease();

}

@end
