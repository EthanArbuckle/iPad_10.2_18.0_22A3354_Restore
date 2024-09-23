@implementation MiniMastheadBarCompressionAnimator

- (BOOL)shouldCompressAtTop
{
  return 1;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4;
  _TtC5TeaUI34MiniMastheadBarCompressionAnimator *v5;
  double v6;

  v4 = a3;
  v5 = self;
  v6 = MiniMastheadBarCompressionAnimator.maximumBarHeight(for:)();

  return v6;
}

- (double)topOffset
{
  return MiniMastheadBarCompressionAnimator.topOffset.getter();
}

- (void)updateWithPercentage:(double)a3
{
  _TtC5TeaUI34MiniMastheadBarCompressionAnimator *v4;

  v4 = self;
  MiniMastheadBarCompressionAnimator.update(withPercentage:)(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI34MiniMastheadBarCompressionAnimator_navigationBar));
}

- (void)setTopOffset:(double)a3
{
  MiniMastheadBarCompressionAnimator.topOffset.setter(a3);
}

- (BOOL)shouldCloseGapOnScroll
{
  return 0;
}

- (void)detached
{
  _TtC5TeaUI34MiniMastheadBarCompressionAnimator *v2;

  v2 = self;
  MiniMastheadBarCompressionAnimator.detached()();

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  UIScrollView *v6;
  _TtC5TeaUI34MiniMastheadBarCompressionAnimator *v7;
  Swift::Bool v8;

  v6 = (UIScrollView *)a3;
  v7 = self;
  v8 = MiniMastheadBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v6, a4);

  return v8;
}

- (_TtC5TeaUI34MiniMastheadBarCompressionAnimator)init
{
  MiniMastheadBarCompressionAnimator.init()();
}

@end
