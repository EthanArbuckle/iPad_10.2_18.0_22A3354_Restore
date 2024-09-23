@implementation RoundedContainerView

- (void)layoutSubviews
{
  id v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedContainerView();
  v2 = v5.receiver;
  -[RoundedContainerView layoutSubviews](&v5, "layoutSubviews");
  v3 = objc_msgSend(v2, "layer", v5.receiver, v5.super_class);
  objc_msgSend(v2, "frame");
  objc_msgSend(v3, "setCornerRadius:", v4 * 0.5);

}

- (_TtC8BookEPUB20RoundedContainerView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for RoundedContainerView();
  return -[RoundedContainerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8BookEPUB20RoundedContainerView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RoundedContainerView();
  return -[RoundedContainerView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
