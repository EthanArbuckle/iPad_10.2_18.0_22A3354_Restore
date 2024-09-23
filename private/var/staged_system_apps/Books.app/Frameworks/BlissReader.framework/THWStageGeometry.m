@implementation THWStageGeometry

- (THWStageGeometry)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  THWStageGeometry *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)THWStageGeometry;
  result = -[THWStageGeometry init](&v10, "init");
  if (result)
  {
    result->_frame.origin.y = y;
    result->_frame.size.width = width;
    result->_frame.size.height = height;
    result->_cornerRadius = a4;
    result->_frame.origin.x = x;
  }
  return result;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
