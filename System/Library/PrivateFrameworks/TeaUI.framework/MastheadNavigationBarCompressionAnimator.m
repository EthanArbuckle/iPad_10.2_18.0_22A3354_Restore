@implementation MastheadNavigationBarCompressionAnimator

- (BOOL)shouldCloseGapOnScroll
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MastheadNavigationBarCompressionAnimator.shouldCloseGapOnScroll.getter();

  return v3 & 1;
}

- (BOOL)shouldCompressAtTop
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = MastheadNavigationBarCompressionAnimator.shouldCompressAtTop.getter();

  return v3 & 1;
}

- (double)topOffset
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v2;
  double v3;
  double v4;

  v2 = self;
  MastheadNavigationBarCompressionAnimator.topOffset.getter();
  v4 = v3;

  return v4;
}

- (void)prepareForUpdates
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v2;

  v2 = self;
  MastheadNavigationBarCompressionAnimator.prepareForUpdates()();

}

- (void)updateWithPercentage:(double)a3
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v4;

  v4 = self;
  MastheadNavigationBarCompressionAnimator.update(withPercentage:)(a3);

}

- (void)scrollViewIsAtTop:(BOOL)a3 offset:(double)a4
{
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v5;

  v5 = self;
  MastheadNavigationBarCompressionAnimator.scrollViewIs(atTop:offset:)(a3);

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  UIScrollView *v6;
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v7;
  Swift::Bool v8;

  v6 = (UIScrollView *)a3;
  v7 = self;
  v8 = MastheadNavigationBarCompressionAnimator.animationShouldBegin(for:currentlyFullyCompressed:)(v6, a4);

  return v8;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v5;
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = self;
  MastheadNavigationBarCompressionAnimator.maximumBarHeight(for:)((uint64_t)a3);
  v8 = v7;

  return v8;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  id v5;
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v6;
  double v7;
  double v8;

  v5 = a3;
  v6 = self;
  MastheadNavigationBarCompressionAnimator.minimumBarHeight(for:)((uint64_t)a3);
  v8 = v7;

  return v8;
}

- (void)reloadWithTraitCollection:(id)a3
{
  id v5;
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v6;
  _TtC5TeaUI40MastheadNavigationBarCompressionAnimator *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  MastheadNavigationBarCompressionAnimator.reload(with:)(v8);

}

- (_TtC5TeaUI40MastheadNavigationBarCompressionAnimator)init
{
  MastheadNavigationBarCompressionAnimator.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI40MastheadNavigationBarCompressionAnimator_barCompressionAnimator));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI40MastheadNavigationBarCompressionAnimator_scrollView));
}

@end
