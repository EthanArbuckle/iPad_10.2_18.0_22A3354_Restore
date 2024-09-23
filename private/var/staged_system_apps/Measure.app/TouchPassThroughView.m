@implementation TouchPassThroughView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TouchPassThroughView();
  v7 = v12.receiver;
  v8 = a4;
  v9 = -[TouchPassThroughView hitTest:withEvent:](&v12, "hitTest:withEvent:", v8, x, y);
  if (!v9 || (v10 = v9, v8, v8 = v7, v10 == v7))
  {

    v10 = 0;
  }

  return v10;
}

- (_TtC7Measure20TouchPassThroughView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for TouchPassThroughView();
  return -[TouchPassThroughView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure20TouchPassThroughView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TouchPassThroughView();
  return -[TouchPassThroughView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
