@implementation BasicInteractiveSwipeDownTransition

- (double)transitionDuration:(id)a3
{
  _TtC12PhotosUICore35BasicInteractiveSwipeDownTransition *v4;
  double v5;
  double v6;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A7ADF4B0();
  v6 = v5;
  swift_unknownObjectRelease();

  return v6;
}

- (void)animateTransition:(id)a3
{
  _TtC12PhotosUICore35BasicInteractiveSwipeDownTransition *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1A6C1A114(a3);
  swift_unknownObjectRelease();

}

- (_TtC12PhotosUICore35BasicInteractiveSwipeDownTransition)init
{
  _TtC12PhotosUICore35BasicInteractiveSwipeDownTransition *result;

  result = (_TtC12PhotosUICore35BasicInteractiveSwipeDownTransition *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_grabAffordanceView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_interactiveTransition));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35BasicInteractiveSwipeDownTransition_slideTransition));
}

@end
