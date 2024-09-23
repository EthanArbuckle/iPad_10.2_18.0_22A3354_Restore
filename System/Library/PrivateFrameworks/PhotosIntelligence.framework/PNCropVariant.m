@implementation PNCropVariant

- (PNCropVariant)initWithAspectRatio:(double)a3 scaleFactor:(double)a4 cropScore:(double)a5 cropType:(int64_t)a6 cropRect:(CGRect)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PNCropVariant *result;
  objc_super v16;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)PNCropVariant;
  result = -[PNCropVariant init](&v16, sel_init);
  if (result)
  {
    result->_cropRect.origin.x = x;
    result->_cropRect.origin.y = y;
    result->_cropRect.size.width = width;
    result->_cropRect.size.height = height;
    result->_cropType = a6;
    result->_scaleFactor = a4;
    result->_cropScore = a5;
    result->_aspectRatio = a3;
  }
  return result;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (int64_t)cropType
{
  return self->_cropType;
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
