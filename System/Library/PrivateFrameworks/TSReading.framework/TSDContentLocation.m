@implementation TSDContentLocation

+ (id)contentLocation
{
  return objc_alloc_init(TSDContentLocation);
}

+ (id)contentLocationWithUnscaledPoint:(CGPoint)a3 viewScale:(double)a4
{
  double y;
  double x;
  TSDContentLocation *v7;

  y = a3.y;
  x = a3.x;
  v7 = objc_alloc_init(TSDContentLocation);
  -[TSDContentLocation setUnscaledPoint:](v7, "setUnscaledPoint:", x, y);
  -[TSDContentLocation setViewScale:](v7, "setViewScale:", a4);
  return v7;
}

+ (id)contentLocationInterpolatingFromLocation:(id)a3 toLocation:(id)a4 fraction:(double)a5
{
  TSDContentLocation *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v8 = objc_alloc_init(TSDContentLocation);
  objc_msgSend(a3, "unscaledPoint");
  v10 = v9;
  v12 = v11;
  objc_msgSend(a4, "unscaledPoint");
  -[TSDContentLocation setUnscaledPoint:](v8, "setUnscaledPoint:", TSDInterpolatePoints(v10, v12, v13, v14, a5));
  objc_msgSend(a3, "viewScale");
  v16 = v15;
  objc_msgSend(a4, "viewScale");
  -[TSDContentLocation setViewScale:](v8, "setViewScale:", TSDInterpolateFloats(v16, v17, a5));
  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSDContentLocation *v4;

  v4 = -[TSDContentLocation init](+[TSDContentLocation allocWithZone:](TSDContentLocation, "allocWithZone:", a3), "init");
  -[TSDContentLocation setUnscaledPoint:](v4, "setUnscaledPoint:", self->_unscaledPoint.x, self->_unscaledPoint.y);
  -[TSDContentLocation setViewScale:](v4, "setViewScale:", self->_viewScale);
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p unscaledPoint=%@ viewScale=%f>"), v5, self, NSStringFromCGPoint(self->_unscaledPoint), *(_QWORD *)&self->_viewScale);
}

- (CGPoint)unscaledPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unscaledPoint.x;
  y = self->_unscaledPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnscaledPoint:(CGPoint)a3
{
  self->_unscaledPoint = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

@end
