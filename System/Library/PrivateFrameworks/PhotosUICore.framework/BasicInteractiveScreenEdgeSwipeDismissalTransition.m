@implementation BasicInteractiveScreenEdgeSwipeDismissalTransition

- (double)transitionDuration:(id)a3
{
  _TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition *v4;
  double v5;
  double v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A7ADF8B8();
  v6 = v5;
  swift_unknownObjectRelease();

  return v6;
}

- (void)animateTransition:(id)a3
{
  _TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A70110F8(a3);
  swift_unknownObjectRelease();

}

- (_TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition)init
{
  _TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition *result;

  result = (_TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_interactiveTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_slideTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore50BasicInteractiveScreenEdgeSwipeDismissalTransition_foregroundView));
}

@end
