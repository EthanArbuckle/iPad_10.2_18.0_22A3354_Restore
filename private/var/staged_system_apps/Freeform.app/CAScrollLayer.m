@implementation CAScrollLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLCanvasScrollRenderable, a2);
}

@end
