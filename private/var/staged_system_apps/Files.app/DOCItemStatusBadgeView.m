@implementation DOCItemStatusBadgeView

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits);
  if ((self->layoutTraits[OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits + 24] & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
    -[DOCItemStatusBadgeView intrinsicContentSize](&v5, "intrinsicContentSize");
  }
  else
  {
    v3 = *v2;
    v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC5Files22DOCItemStatusBadgeView)initWithImage:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return -[DOCItemStatusBadgeView initWithImage:](&v6, "initWithImage:", a3);
}

- (_TtC5Files22DOCItemStatusBadgeView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  char *v6;
  objc_super v8;

  v6 = (char *)self + OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v6[32] = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return -[DOCItemStatusBadgeView initWithImage:highlightedImage:](&v8, "initWithImage:highlightedImage:", a3, a4);
}

- (_TtC5Files22DOCItemStatusBadgeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  v7[32] = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return -[DOCItemStatusBadgeView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files22DOCItemStatusBadgeView)initWithCoder:(id)a3
{
  char *v4;
  objc_super v6;

  v4 = (char *)self + OBJC_IVAR____TtC5Files22DOCItemStatusBadgeView_layoutTraits;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCItemStatusBadgeView();
  return -[DOCItemStatusBadgeView initWithCoder:](&v6, "initWithCoder:", a3);
}

@end
