@implementation SteppingSignSizeAttributes

- (SteppingSignSizeAttributes)initWithSize:(CGSize)a3 signToPageControlDistance:(double)a4
{
  CGFloat height;
  CGFloat width;
  SteppingSignSizeAttributes *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)SteppingSignSizeAttributes;
  result = -[SteppingSignSizeAttributes init](&v8, "init");
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_signToPageControlDistance = a4;
  }
  return result;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)signToPageControlDistance
{
  return self->_signToPageControlDistance;
}

@end
