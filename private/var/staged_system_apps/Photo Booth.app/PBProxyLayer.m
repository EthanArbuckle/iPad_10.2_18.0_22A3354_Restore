@implementation PBProxyLayer

- (PBProxyLayer)initWithLayer:(id)a3
{
  PBProxyLayer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBProxyLayer;
  v4 = -[PBProxyLayer initWithLayer:](&v6, "initWithLayer:");
  -[PBProxyLayer setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", CFSTR("inputPoint")), CFSTR("inputPoint"));
  -[PBProxyLayer setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", CFSTR("inputAmount")), CFSTR("inputAmount"));
  -[PBProxyLayer setValue:forKey:](v4, "setValue:forKey:", objc_msgSend(a3, "valueForKey:", CFSTR("inputRotation")), CFSTR("inputRotation"));
  return v4;
}

- (CGPoint)inputPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->inputPoint.x;
  y = self->inputPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInputPoint:(CGPoint)a3
{
  self->inputPoint = a3;
}

- (float)inputAmount
{
  return self->inputAmount;
}

- (void)setInputAmount:(float)a3
{
  self->inputAmount = a3;
}

- (float)inputRotation
{
  return self->inputRotation;
}

- (void)setInputRotation:(float)a3
{
  self->inputRotation = a3;
}

@end
