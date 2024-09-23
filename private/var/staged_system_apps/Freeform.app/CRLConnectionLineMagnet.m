@implementation CRLConnectionLineMagnet

- (CRLConnectionLineMagnet)initWithType:(unint64_t)a3 normalizedPosition:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CRLConnectionLineMagnet *result;
  objc_super v8;

  y = a4.y;
  x = a4.x;
  v8.receiver = self;
  v8.super_class = (Class)CRLConnectionLineMagnet;
  result = -[CRLConnectionLineMagnet init](&v8, "init");
  if (result)
  {
    result->mMagnetType = a3;
    result->mMagnetNormalizedPosition.x = x;
    result->mMagnetNormalizedPosition.y = y;
  }
  return result;
}

- (unint64_t)magnetType
{
  return self->mMagnetType;
}

- (void)setMagnetType:(unint64_t)a3
{
  self->mMagnetType = a3;
}

- (CGPoint)magnetNormalizedPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->mMagnetNormalizedPosition.x;
  y = self->mMagnetNormalizedPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setMagnetNormalizedPosition:(CGPoint)a3
{
  self->mMagnetNormalizedPosition = a3;
}

@end
