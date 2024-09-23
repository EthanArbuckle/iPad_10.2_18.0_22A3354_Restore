@implementation EmptyActivityPlaceholderView

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for EmptyActivityPlaceholderView();
  return -[EmptyActivityPlaceholderView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17SequoiaTranslator28EmptyActivityPlaceholderView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmptyActivityPlaceholderView();
  return -[EmptyActivityPlaceholderView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
