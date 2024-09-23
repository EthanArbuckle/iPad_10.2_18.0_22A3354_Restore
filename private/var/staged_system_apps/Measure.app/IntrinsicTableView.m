@implementation IntrinsicTableView

- (CGSize)contentSize
{
  double v2;
  double v3;
  objc_super v4;
  CGSize result;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self);
  -[IntrinsicTableView contentSize](&v4, "contentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType(self);
  v5 = v6.receiver;
  -[IntrinsicTableView setContentSize:](&v6, "setContentSize:", width, height);
  objc_msgSend(v5, "invalidateIntrinsicContentSize", v6.receiver, v6.super_class);

}

- (CGSize)intrinsicContentSize
{
  objc_class *ObjectType;
  _TtC7Measure18IntrinsicTableView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGSize result;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  -[IntrinsicTableView layoutIfNeeded](v4, "layoutIfNeeded");
  v9.receiver = v4;
  v9.super_class = ObjectType;
  -[IntrinsicTableView contentSize](&v9, "contentSize");
  v6 = v5;

  v7 = UIViewNoIntrinsicMetric;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC7Measure18IntrinsicTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
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
  v10.super_class = (Class)swift_getObjectType(self);
  return -[IntrinsicTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC7Measure18IntrinsicTableView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[IntrinsicTableView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
