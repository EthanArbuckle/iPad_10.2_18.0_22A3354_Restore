@implementation ExpandedContentAnimator

- (double)duration
{
  return 0.4;
}

- (_TtC8BookEPUB23ExpandedContentAnimator)init
{
  _TtC8BookEPUB23ExpandedContentAnimator *result;

  result = (_TtC8BookEPUB23ExpandedContentAnimator *)_swift_stdlib_reportUnimplementedInitializer("BookEPUB.ExpandedContentAnimator", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8BookEPUB23ExpandedContentAnimator_image);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ExpandedContentAnimator_viewForAnimation));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8BookEPUB23ExpandedContentAnimator_landingShimView));
}

- (double)transitionDuration:(id)a3
{
  return 0.4;
}

- (void)animateTransition:(id)a3
{
  _TtC8BookEPUB23ExpandedContentAnimator *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  ExpandedContentAnimator.animateTransition(using:)(a3);
  swift_unknownObjectRelease(a3);

}

@end
