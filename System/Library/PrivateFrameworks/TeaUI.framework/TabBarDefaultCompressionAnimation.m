@implementation TabBarDefaultCompressionAnimation

- (double)topOffset
{
  return 0.0;
}

- (BOOL)shouldCompressAtTop
{
  return 0;
}

- (BOOL)shouldCloseGapOnScroll
{
  return 1;
}

- (void)updateWithPercentage:(double)a3
{
  _TtC5TeaUI33TabBarDefaultCompressionAnimation *v3;

  v3 = self;
  TabBarDefaultCompressionAnimation.update(withPercentage:)();

}

- (BOOL)animationShouldBeginForScrollView:(id)a3 currentlyFullyCompressed:(BOOL)a4
{
  return 1;
}

- (double)maximumBarHeightForTraitCollection:(id)a3
{
  id v4;
  _TtC5TeaUI33TabBarDefaultCompressionAnimation *v5;
  double v6;

  v4 = a3;
  v5 = self;
  v6 = TabBarDefaultCompressionAnimation.maximumBarHeight(for:)();

  return v6;
}

- (double)minimumBarHeightForTraitCollection:(id)a3
{
  return 0.0;
}

- (void)reloadWithTraitCollection:(id)a3
{
  id v4;
  Class isa;
  UITraitCollection_optional v6;

  v4 = a3;
  v6.value.super.isa = (Class)self;
  isa = v6.value.super.isa;
  TabBarDefaultCompressionAnimation.reload(with:)(v6);

}

- (_TtC5TeaUI33TabBarDefaultCompressionAnimation)init
{
  TabBarDefaultCompressionAnimation.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5TeaUI33TabBarDefaultCompressionAnimation_tabBarController));
}

@end
