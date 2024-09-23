@implementation NoIntrinsicButton

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = *MEMORY[0x24BEBE9C8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC9SeymourUI17NoIntrinsicButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for NoIntrinsicButton();
  return -[NoIntrinsicButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI17NoIntrinsicButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoIntrinsicButton();
  return -[NoIntrinsicButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
