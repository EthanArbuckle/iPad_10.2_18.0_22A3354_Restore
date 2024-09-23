@implementation MKTransitInfoLabelView

+ (int64_t)clusteredShieldSizeForContentSizeCategory:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryExtraExtraExtraLarge) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryAccessibilityMedium) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryAccessibilityLarge) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraLarge) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraLarge) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", UIContentSizeCategoryAccessibilityExtraExtraExtraLarge))
  {
    v4 = 6;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

@end
