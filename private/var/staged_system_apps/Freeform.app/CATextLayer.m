@implementation CATextLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLCanvasTextRenderable, a2);
}

@end
