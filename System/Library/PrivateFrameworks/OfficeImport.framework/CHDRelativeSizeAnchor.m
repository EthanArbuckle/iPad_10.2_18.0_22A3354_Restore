@implementation CHDRelativeSizeAnchor

- (void)setFrom:(CGPoint)a3
{
  self->mFrom = a3;
}

- (void)setTo:(CGPoint)a3
{
  self->mTo = a3;
}

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

- (CGPoint)to
{
  double x;
  double y;
  CGPoint result;

  x = self->mTo.x;
  y = self->mTo.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
