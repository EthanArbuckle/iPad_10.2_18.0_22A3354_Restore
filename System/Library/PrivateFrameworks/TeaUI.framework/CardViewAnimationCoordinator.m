@implementation CardViewAnimationCoordinator

- (void)handleWithRecognizer:(id)a3
{
  id v4;
  _TtC5TeaUI28CardViewAnimationCoordinator *v5;

  v4 = a3;
  v5 = self;
  sub_1B15E6988(v4);

}

- (_TtC5TeaUI28CardViewAnimationCoordinator)init
{
  CardViewAnimationCoordinator.init()();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_delegate);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_parentDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_rootView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_panView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_contentView);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_dimmingView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI28CardViewAnimationCoordinator_panGestureRecoginzer));
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  _TtC5TeaUI28CardViewAnimationCoordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CardViewAnimationCoordinator.gestureRecognizer(_:shouldRecognizeSimultaneouslyWith:)((UIGestureRecognizer)v8, (UIGestureRecognizer)v7);

  return 1;
}

@end
