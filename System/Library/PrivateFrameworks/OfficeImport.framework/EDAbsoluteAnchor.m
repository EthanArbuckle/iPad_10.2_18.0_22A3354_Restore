@implementation EDAbsoluteAnchor

- (void)setPosition:(CGPoint)a3
{
  self->mPosition = a3;
}

- (void)setSize:(CGSize)a3
{
  self->mSize = a3;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  result.y = y;
  result.x = x;
  return result;
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

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mPosition.x;
  y = self->mPosition.y;
  width = self->mSize.width;
  height = self->mSize.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  self->mPosition.x = a3.origin.x;
  self->mPosition.y = a3.origin.y;
  self->mSize.width = a3.size.width;
  self->mSize.height = a3.size.height;
}

@end
