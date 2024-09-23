@implementation CALayer(TSDRenderableSubclassing)

+ (uint64_t)tsd_renderableClass
{
  return objc_opt_class();
}

@end
