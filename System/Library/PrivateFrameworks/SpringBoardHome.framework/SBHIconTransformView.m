@implementation SBHIconTransformView

+ (Class)contentContainerViewClass
{
  return (Class)objc_opt_self();
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end
