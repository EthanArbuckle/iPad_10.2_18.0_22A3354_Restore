@implementation DimmerView

- (_TtC17PromotedContentUI10DimmerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17PromotedContentUI10DimmerView *v7;
  void *v8;
  _TtC17PromotedContentUI10DimmerView *v9;
  id v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC17PromotedContentUI10DimmerView_dimmed) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DimmerView();
  v7 = -[DimmerView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_clearColor);
  -[DimmerView setBackgroundColor:](v9, sel_setBackgroundColor_, v10);

  -[DimmerView setAlpha:](v9, sel_setAlpha_, 0.2);
  -[DimmerView setIsAccessibilityElement:](v9, sel_setIsAccessibilityElement_, 0);
  -[DimmerView setUserInteractionEnabled:](v9, sel_setUserInteractionEnabled_, 0);

  return v9;
}

- (_TtC17PromotedContentUI10DimmerView)initWithCoder:(id)a3
{
  return (_TtC17PromotedContentUI10DimmerView *)sub_1B13535BC(a3);
}

@end
