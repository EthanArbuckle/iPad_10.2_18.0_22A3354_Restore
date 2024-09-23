@implementation RoundedPlatterView

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedPlatterView();
  v2 = v5.receiver;
  -[RoundedPlatterView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);

}

- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithFrame:(CGRect)a3
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
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RoundedPlatterView();
  return -[RoundedPlatterView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUIP33_C666C579EAAF2160522BD5D4777B64BB18RoundedPlatterView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedPlatterView();
  return -[RoundedPlatterView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
