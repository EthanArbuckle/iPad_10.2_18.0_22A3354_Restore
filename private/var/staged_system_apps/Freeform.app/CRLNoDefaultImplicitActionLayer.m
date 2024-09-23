@implementation CRLNoDefaultImplicitActionLayer

+ (id)defaultActionForKey:(id)a3
{
  return kCFNull;
}

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLNoDefaultImplicitActionRenderable, a2);
}

@end
