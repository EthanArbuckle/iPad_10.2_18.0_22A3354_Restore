@implementation BarCompressionManager

- (void)dynamicBarAnimatorOutputsDidChange:(id)a3
{
  TUDynamicBarAnimator *v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = (TUDynamicBarAnimator *)a3;
  v5 = self;
  BarCompressionManager.dynamicBarAnimatorOutputsDidChange(_:)(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  BarCompressionManager.scrollViewDidScroll(_:)(v4);

}

- (void)voiceOverStatusDidChange
{
  _TtC5TeaUI21BarCompressionManager *v2;

  v2 = self;
  sub_1B150C684();

}

- (_TtC5TeaUI21BarCompressionManager)init
{
  BarCompressionManager.init()();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_delegate);

  sub_1B13F77F4((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_proxyMultiDelegate);
  OUTLINED_FUNCTION_27_19();
  OUTLINED_FUNCTION_27_19();
  OUTLINED_FUNCTION_27_19();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI21BarCompressionManager_sceneStateManager);
  OUTLINED_FUNCTION_27_19();
  swift_release();
  swift_release();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  BarCompressionManager.scrollViewWillBeginDragging(_:)(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  id v7;
  double v8;
  _TtC5TeaUI21BarCompressionManager *v9;

  y = a4.y;
  v7 = a3;
  v9 = self;
  BarCompressionManager.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, y);

}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = a3;
  v5 = self;
  BarCompressionManager.scrollViewDidScrollToTop(_:)((UIScrollView *)v5);

}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  LOBYTE(self) = BarCompressionManager.scrollViewShouldScrollToTop(_:)(v4);

  return self & 1;
}

- (BOOL)dynamicBarAnimator:(id)a3 canHideBarsByDraggingWithOffset:(double)a4
{
  id v5;
  _TtC5TeaUI21BarCompressionManager *v6;

  v5 = a3;
  v6 = self;
  LOBYTE(self) = BarCompressionManager.dynamicBarAnimator(_:canHideBarsByDraggingWithOffset:)();

  return self & 1;
}

- (void)dynamicBarAnimatorWillEnterSteadyState:(id)a3
{
  TUDynamicBarAnimator *v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = (TUDynamicBarAnimator *)a3;
  v5 = self;
  BarCompressionManager.dynamicBarAnimatorWillEnterSteadyState(_:)(v4);

}

- (void)dynamicBarAnimatorWillLeaveSteadyState:(id)a3
{
  id v4;
  _TtC5TeaUI21BarCompressionManager *v5;

  v4 = a3;
  v5 = self;
  BarCompressionManager.dynamicBarAnimatorWillLeaveSteadyState(_:)((TUDynamicBarAnimator *)v5);

}

@end
