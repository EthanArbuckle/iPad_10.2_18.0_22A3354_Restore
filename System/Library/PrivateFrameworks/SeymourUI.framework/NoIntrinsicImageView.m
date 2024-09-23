@implementation NoIntrinsicImageView

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

- (_TtC9SeymourUI20NoIntrinsicImageView)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for NoIntrinsicImageView();
  return -[NoIntrinsicImageView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9SeymourUI20NoIntrinsicImageView)initWithImage:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoIntrinsicImageView();
  return -[NoIntrinsicImageView initWithImage:](&v5, sel_initWithImage_, a3);
}

- (_TtC9SeymourUI20NoIntrinsicImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NoIntrinsicImageView();
  return -[NoIntrinsicImageView initWithImage:highlightedImage:](&v7, sel_initWithImage_highlightedImage_, a3, a4);
}

- (_TtC9SeymourUI20NoIntrinsicImageView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NoIntrinsicImageView();
  return -[NoIntrinsicImageView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
