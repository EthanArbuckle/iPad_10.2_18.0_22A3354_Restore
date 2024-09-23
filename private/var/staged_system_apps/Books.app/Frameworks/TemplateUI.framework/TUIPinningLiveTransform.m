@implementation TUIPinningLiveTransform

- (TUIPinningLiveTransform)initWithCenter:(CGPoint)a3 size:(CGSize)a4 transform:(CGAffineTransform *)a5 pinPosition:(unint64_t)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  TUIPinningLiveTransform *result;
  __int128 v13;
  __int128 v14;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  y = a3.y;
  x = a3.x;
  v15.receiver = self;
  v15.super_class = (Class)TUIPinningLiveTransform;
  result = -[TUIPinningLiveTransform init](&v15, "init");
  if (result)
  {
    result->_center.x = x;
    result->_center.y = y;
    result->_size.width = width;
    result->_size.height = height;
    v13 = *(_OWORD *)&a5->a;
    v14 = *(_OWORD *)&a5->tx;
    *(_OWORD *)&result->_transform.c = *(_OWORD *)&a5->c;
    *(_OWORD *)&result->_transform.tx = v14;
    *(_OWORD *)&result->_transform.a = v13;
    result->_pinPosition = a6;
  }
  return result;
}

- (Class)kind
{
  return (Class)objc_opt_class(TUIPinningLiveTransform, a2);
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

  v3 = *(_OWORD *)&self[1].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[1].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].tx;
  return self;
}

- (unint64_t)pinPosition
{
  return self->_pinPosition;
}

@end
