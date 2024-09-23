@implementation UINavigationItem(PUAbstractNavigationBanner)

- (id)pu_banner
{
  return objc_getAssociatedObject(a1, "com.apple.photosui.banner");
}

- (void)pu_setBanner:()PUAbstractNavigationBanner
{
  objc_setAssociatedObject(a1, "com.apple.photosui.banner", a3, (void *)1);
}

@end
