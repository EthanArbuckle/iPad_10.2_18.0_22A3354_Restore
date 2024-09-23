@implementation CHDAbsoluteSizeAnchor

- (CGPoint)from
{
  double x;
  double y;
  CGPoint result;

  x = self->mFrom.x;
  y = self->mFrom.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFrom:(CGPoint)a3
{
  self->mFrom = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->mSize.width;
  height = self->mSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

@end
