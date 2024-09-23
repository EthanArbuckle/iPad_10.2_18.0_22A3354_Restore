@implementation ColorSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC5TeaUI26ColorSectionDecorationView *v6;

  v5 = a3;
  v6 = self;
  ColorSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);

}

- (void)didMoveToSuperview
{
  _TtC5TeaUI26ColorSectionDecorationView *v2;

  v2 = self;
  ColorSectionDecorationView.didMoveToSuperview()();

}

- (void)applyLayoutAttributes:(id)a3
{
  UICollectionViewLayoutAttributes *v4;
  _TtC5TeaUI26ColorSectionDecorationView *v5;

  v4 = (UICollectionViewLayoutAttributes *)a3;
  v5 = self;
  ColorSectionDecorationView.apply(_:)(v4);

}

- (_TtC5TeaUI26ColorSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI26ColorSectionDecorationView *)ColorSectionDecorationView.init(frame:)();
}

- (_TtC5TeaUI26ColorSectionDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC5TeaUI26ColorSectionDecorationView *)ColorSectionDecorationView.init(coder:)();
}

@end
