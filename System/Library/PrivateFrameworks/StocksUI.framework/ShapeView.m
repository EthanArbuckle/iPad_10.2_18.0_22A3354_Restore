@implementation ShapeView

+ (Class)layerClass
{
  sub_1DC2C2130();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8StocksUI9ShapeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC8StocksUI9ShapeView *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = -[ShapeView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v8 = -[ShapeView layer](v7, sel_layer);
  v9 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v9, sel_scale);
  v11 = v10;

  objc_msgSend(v8, sel_setContentsScale_, v11);
  return v7;
}

- (_TtC8StocksUI9ShapeView)initWithCoder:(id)a3
{
  _TtC8StocksUI9ShapeView *result;

  result = (_TtC8StocksUI9ShapeView *)sub_1DC409838();
  __break(1u);
  return result;
}

@end
