@implementation CRLiOSBoardViewControllerAnimatedTransition

- (void)animateTransition:(id)a3
{
  _TtC8Freeform43CRLiOSBoardViewControllerAnimatedTransition *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1006783A0(a3);
  swift_unknownObjectRelease(a3);

}

- (double)transitionDuration:(id)a3
{
  uint64_t v5;
  _TtC8Freeform43CRLiOSBoardViewControllerAnimatedTransition *v6;
  double v7;

  v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8Freeform40CRLBoardViewControllerAnimatedTransition_animationGroup);
  swift_unknownObjectRetain(a3);
  v6 = self;
  v7 = sub_10060CA54(v5);
  swift_unknownObjectRelease(a3);

  return v7;
}

@end
