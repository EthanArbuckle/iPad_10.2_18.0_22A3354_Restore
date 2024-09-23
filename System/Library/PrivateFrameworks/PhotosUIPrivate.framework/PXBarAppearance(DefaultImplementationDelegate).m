@implementation PXBarAppearance(DefaultImplementationDelegate)

+ (PUPXBarAppearanceImplementationDelegate)defaultImplementationDelegate
{
  return objc_alloc_init(PUPXBarAppearanceImplementationDelegate);
}

@end
