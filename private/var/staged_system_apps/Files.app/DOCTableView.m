@implementation DOCTableView

- (_TtC5Files12DOCTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCTableView();
  return -[DOCTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

@end
