@implementation MastheadTitleViewBarCompressionAnimator

- (double)topOffset
{
  return MastheadTitleViewBarCompressionAnimator.topOffset.getter();
}

- (void)setTopOffset:(double)a3
{
  MastheadTitleViewBarCompressionAnimator.topOffset.setter(a3);
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (void)prepareForUpdates
{
  _TtC5TeaUI39MastheadTitleViewBarCompressionAnimator *v2;

  v2 = self;
  MastheadTitleViewBarCompressionAnimator.prepareForUpdates()();

}

- (void)updateWithPercentage:(double)a3
{
  _TtC5TeaUI39MastheadTitleViewBarCompressionAnimator *v3;

  v3 = self;
  MastheadTitleViewBarCompressionAnimator.update(withPercentage:)();

}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  _TtC5TeaUI39MastheadTitleViewBarCompressionAnimator *v5;

  v5 = self;
  MastheadTitleViewBarCompressionAnimator.scrollViewIs(atTop:offset:)(a3);

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  UIScrollView *v5;
  _TtC5TeaUI39MastheadTitleViewBarCompressionAnimator *v6;

  v5 = (UIScrollView *)a3;
  v6 = self;
  LOBYTE(self) = MastheadTitleViewBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v5, 0);

  return self & 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4;
  _TtC5TeaUI39MastheadTitleViewBarCompressionAnimator *v5;
  double v6;

  v4 = a3;
  v5 = self;
  v6 = MastheadTitleViewBarCompressionAnimator.maximumBarHeight(for:)();

  return v6;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (_TtC5TeaUI39MastheadTitleViewBarCompressionAnimator)init
{
  MastheadTitleViewBarCompressionAnimator.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI39MastheadTitleViewBarCompressionAnimator_navigationBar));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI39MastheadTitleViewBarCompressionAnimator_compressibleTitleView));
}

@end
