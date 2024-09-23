@implementation UITraitCollection(VideosUICore)

+ (uint64_t)current
{
  return objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
}

- (unint64_t)vuiPreferredContentSizeCategory
{
  void *v1;
  unint64_t v2;

  objc_msgSend(a1, "preferredContentSizeCategory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[VUICoreUtilities vuiContentSizeCategoryFor:](VUICoreUtilities, "vuiContentSizeCategoryFor:", v1);

  return v2;
}

- (BOOL)isAXSmallEnabled
{
  return +[VUIAccessibility isAXSmallEnabled:](VUIAccessibility, "isAXSmallEnabled:", objc_msgSend(a1, "vuiPreferredContentSizeCategory"));
}

- (BOOL)isAXLargeEnabled
{
  return +[VUIAccessibility isAXLargeEnabled:](VUIAccessibility, "isAXLargeEnabled:", objc_msgSend(a1, "vuiPreferredContentSizeCategory"));
}

- (BOOL)isAXEnabled
{
  return +[VUIAccessibility contentSizeCategoryIsAccessibility:](VUIAccessibility, "contentSizeCategoryIsAccessibility:", objc_msgSend(a1, "vuiPreferredContentSizeCategory"));
}

- (uint64_t)vuiUserInterfaceStyle
{
  if (objc_msgSend(a1, "userInterfaceStyle") == 1)
    return 1;
  else
    return 2;
}

@end
