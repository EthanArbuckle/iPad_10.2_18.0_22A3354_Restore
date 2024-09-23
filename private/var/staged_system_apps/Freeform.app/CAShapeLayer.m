@implementation CAShapeLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLCanvasShapeRenderable, a2);
}

@end
