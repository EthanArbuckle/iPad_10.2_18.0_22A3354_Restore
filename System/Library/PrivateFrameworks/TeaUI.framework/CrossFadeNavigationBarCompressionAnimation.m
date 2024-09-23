@implementation CrossFadeNavigationBarCompressionAnimation

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (double)topOffset
{
  return 0.0;
}

- (BOOL)shouldAlwaysScrollToTopOnTap
{
  return 1;
}

- (void)attached
{
  _TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation *v2;

  v2 = self;
  CrossFadeNavigationBarCompressionAnimation.attached()();

}

- (void)detached
{
  _TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation *v2;

  v2 = self;
  CrossFadeNavigationBarCompressionAnimation.detached()();

}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  _TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation *v4;

  v4 = self;
  CrossFadeNavigationBarCompressionAnimation.scrollViewIs(atTop:offset:)(0);

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4;
  _TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation *v5;
  double v6;

  v4 = a3;
  v5 = self;
  v6 = CrossFadeNavigationBarCompressionAnimation.maximumBarHeight(for:)();

  return v6;
}

- (_TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation)init
{
  CrossFadeNavigationBarCompressionAnimation.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_navigationItem));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_navigationBar));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_scrollView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI42CrossFadeNavigationBarCompressionAnimation_backgroundColor));
}

@end
