@implementation SupplementalContentButton

- (void)layoutSubviews
{
  _TtC5Books25SupplementalContentButton *v2;

  v2 = self;
  sub_1005D1898();

}

- (CGSize)intrinsicContentSize
{
  _TtC5Books25SupplementalContentButton *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = self;
  sub_1005D1BFC();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC5Books25SupplementalContentButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books25SupplementalContentButton_compactMode) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SupplementalContentButton();
  return -[SupplementalContentButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books25SupplementalContentButton)initWithCoder:(id)a3
{
  objc_super v5;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books25SupplementalContentButton_compactMode) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SupplementalContentButton();
  return -[SupplementalContentButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
