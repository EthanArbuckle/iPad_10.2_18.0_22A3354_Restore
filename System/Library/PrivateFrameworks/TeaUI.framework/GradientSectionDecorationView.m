@implementation GradientSectionDecorationView

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC5TeaUI29GradientSectionDecorationView *v6;

  v5 = a3;
  v6 = self;
  GradientSectionDecorationView.willMove(toSuperview:)((UIView_optional *)a3);

}

- (void)applyLayoutAttributes:(id)a3
{
  UICollectionViewLayoutAttributes *v4;
  _TtC5TeaUI29GradientSectionDecorationView *v5;

  v4 = (UICollectionViewLayoutAttributes *)a3;
  v5 = self;
  GradientSectionDecorationView.apply(_:)(v4);

}

- (_TtC5TeaUI29GradientSectionDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI29GradientSectionDecorationView *)GradientSectionDecorationView.init(frame:)();
}

- (void)didMoveToSuperview
{
  _TtC5TeaUI29GradientSectionDecorationView *v2;

  v2 = self;
  GradientSectionDecorationView.didMoveToSuperview()();

}

- (void)layoutSubviews
{
  _TtC5TeaUI29GradientSectionDecorationView *v2;

  v2 = self;
  GradientSectionDecorationView.layoutSubviews()();

}

- (_TtC5TeaUI29GradientSectionDecorationView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  GradientSectionDecorationView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI29GradientSectionDecorationView_gradientView));
}

@end
