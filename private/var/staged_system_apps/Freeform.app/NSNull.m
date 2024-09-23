@implementation NSNull

- (void)paintPath:(CGPath *)a3 inContext:(CGContext *)a4
{
  CGRect PathBoundingBox;

  PathBoundingBox = CGPathGetPathBoundingBox(a3);
  sub_1002C398C(a4, PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);
}

- (void)drawSwatchInRect:(CGRect)a3 inContext:(CGContext *)a4
{
  sub_1002C398C(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

@end
