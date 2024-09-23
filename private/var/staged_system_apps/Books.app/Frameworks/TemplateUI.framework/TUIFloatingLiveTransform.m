@implementation TUIFloatingLiveTransform

- (TUIFloatingLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TUIFloatingLiveTransform *result;
  __int128 v11;
  __int128 v12;
  objc_super v13;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)TUIFloatingLiveTransform;
  result = -[TUIFloatingLiveTransform init](&v13, "init");
  if (result)
  {
    result->_center.x = x;
    result->_center.y = y;
    result->_size.width = width;
    result->_size.height = height;
    v11 = *(_OWORD *)&a5->a;
    v12 = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tx = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.c = v12;
    *(_OWORD *)&result->_transform.a = v11;
  }
  return result;
}

- (Class)kind
{
  return (Class)objc_opt_class(TUIFloatingLiveTransform, a2);
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

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

@end
