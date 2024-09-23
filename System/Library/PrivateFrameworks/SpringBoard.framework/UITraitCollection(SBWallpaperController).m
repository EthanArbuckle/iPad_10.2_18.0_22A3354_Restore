@implementation UITraitCollection(SBWallpaperController)

- (uint64_t)prs_interfaceStyle
{
  uint64_t result;

  result = objc_msgSend(a1, "userInterfaceStyle");
  if (result != 2)
    return result == 1;
  return result;
}

- (uint64_t)prs_accessibilityContrast
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityContrast");
  if (v1 == 1)
    return 2;
  else
    return v1 == 0;
}

@end
