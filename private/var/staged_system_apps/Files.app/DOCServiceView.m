@implementation DOCServiceView

- (_TtC5Files14DOCServiceView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for DOCServiceView();
  return -[DOCServiceView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC5Files14DOCServiceView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceView();
  return -[DOCServiceView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
