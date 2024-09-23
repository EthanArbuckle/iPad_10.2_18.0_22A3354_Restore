@implementation TUIGeometryAttributes

- (TUIGeometryAttributes)initWithSize:(CGSize)a3 center:(CGPoint)a4 transform:(CGAffineTransform *)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  TUIGeometryAttributes *result;
  CGSize size;
  __int128 v12;
  __int128 v13;
  objc_super v14;

  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)TUIGeometryAttributes;
  result = -[TUIGeometryAttributes init](&v14, "init");
  if (result)
  {
    size = CGRectNull.size;
    result->_frame.origin = CGRectNull.origin;
    result->_frame.size = size;
    result->_size.width = width;
    result->_size.height = height;
    result->_center.x = x;
    result->_center.y = y;
    v13 = *(_OWORD *)&a5->a;
    v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.a = v13;
    *(_OWORD *)&result->_transform.c = v12;
  }
  return result;
}

- (CGRect)frame
{
  double width;
  double height;
  __int128 v5;
  CGAffineTransform v6;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGRect v11;
  CGRect result;

  if (CGRectIsNull(self->_frame))
  {
    width = self->_size.width;
    height = self->_size.height;
    memset(&v10, 0, sizeof(v10));
    CGAffineTransformMakeTranslation(&v10, width * -0.5, height * -0.5);
    t1 = v10;
    v5 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t2.c = v5;
    *(_OWORD *)&t2.tx = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v9, &t1, &t2);
    v10 = v9;
    CGAffineTransformMakeTranslation(&v6, self->_center.x, self->_center.y);
    t1 = v10;
    CGAffineTransformConcat(&v9, &t1, &v6);
    v10 = v9;
    v11.origin.x = 0.0;
    v11.origin.y = 0.0;
    v11.size.width = width;
    v11.size.height = height;
    result = CGRectApplyAffineTransform(v11, &v9);
    self->_frame = result;
  }
  else
  {
    return self->_frame;
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

- (CGPoint)center
{
  double x;
  double y;
  CGPoint result;

  x = self->_center.x;
  y = self->_center.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].b;
  return self;
}

@end
