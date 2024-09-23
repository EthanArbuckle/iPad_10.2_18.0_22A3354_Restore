@implementation PlatterShadowView

- (_TtC7Measure17PlatterShadowView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7Measure17PlatterShadowView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self);
  v7 = -[PlatterShadowView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  sub_10008F250();

  return v7;
}

- (_TtC7Measure17PlatterShadowView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[PlatterShadowView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
