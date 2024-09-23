@implementation RadialGradientSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC5TeaUI35RadialGradientSectionDecorationView *v6;

  v5 = a3;
  v6 = self;
  RadialGradientSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);

}

- (void)didMoveToSuperview
{
  _TtC5TeaUI35RadialGradientSectionDecorationView *v2;

  v2 = self;
  RadialGradientSectionDecorationView.didMoveToSuperview()();

}

- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI35RadialGradientSectionDecorationView *)RadialGradientSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI35RadialGradientSectionDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  RadialGradientSectionDecorationView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC5TeaUI35RadialGradientSectionDecorationView *v2;

  v2 = self;
  RadialGradientSectionDecorationView.layoutSubviews()();

}

- (void)applyLayoutAttributes:(id)a3
{
  UICollectionViewLayoutAttributes *v4;
  _TtC5TeaUI35RadialGradientSectionDecorationView *v5;

  v4 = (UICollectionViewLayoutAttributes *)a3;
  v5 = self;
  RadialGradientSectionDecorationView.apply(_:)(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI35RadialGradientSectionDecorationView_gradientView));
}

@end
