@implementation IMADropTarget

- (IMADropTarget)initWithScreenCoordinate:(CGPoint)a3 initialSize:(CGSize)a4 scale:(double)a5 meshScaleFactor:(double)a6 rotation:(double)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  IMADropTarget *result;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)IMADropTarget;
  result = -[IMADropTarget init](&v15, sel_init);
  if (result)
  {
    result->_screenCoordinate.y = y;
    result->_initialSize.width = width;
    result->_initialSize.height = height;
    result->_scale = a5;
    result->_meshScaleFactor = a6;
    result->_rotation = a7;
    result->_screenCoordinate.x = x;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  CGPoint v11;
  CGSize v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[IMADropTarget screenCoordinate](self, "screenCoordinate");
  NSStringFromCGPoint(v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMADropTarget initialSize](self, "initialSize");
  NSStringFromCGSize(v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMADropTarget scale](self, "scale");
  v7 = v6;
  -[IMADropTarget rotation](self, "rotation");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("IMADropTarget coord: %@ size %@ scale %f rotation %f"), v4, v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGPoint)screenCoordinate
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenCoordinate.x;
  y = self->_screenCoordinate.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)initialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialSize.width;
  height = self->_initialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)meshScaleFactor
{
  return self->_meshScaleFactor;
}

- (double)rotation
{
  return self->_rotation;
}

@end
