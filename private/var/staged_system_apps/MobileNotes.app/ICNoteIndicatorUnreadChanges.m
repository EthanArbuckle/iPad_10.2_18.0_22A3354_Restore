@implementation ICNoteIndicatorUnreadChanges

- (NSString)imageName
{
  return (NSString *)CFSTR("circle.fill");
}

- (UIColor)tintColor
{
  void *v2;

  if (UIAccessibilityDarkerSystemColorsEnabled())
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICDarkenedTintColor](UIColor, "ICDarkenedTintColor"));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor ICListStatusIndicatorColor](UIColor, "ICListStatusIndicatorColor"));
  return (UIColor *)v2;
}

@end
