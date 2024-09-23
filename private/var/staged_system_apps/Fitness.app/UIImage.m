@implementation UIImage

- (id)resizedImageWithNewSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *v5;
  void *v6;
  void *v7;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_10011DDAC(width, height);
  v7 = v6;

  return v7;
}

@end
