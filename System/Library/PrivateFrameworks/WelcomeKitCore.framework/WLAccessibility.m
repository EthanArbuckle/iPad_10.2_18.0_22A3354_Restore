@implementation WLAccessibility

- (void)reset
{
  _AXSInvertColorsSetEnabled();
  _AXSSetPreferredContentSizeCategoryName();
}

- (BOOL)invertColorsEnabled
{
  return _AXSInvertColorsEnabled() != 0;
}

- (id)preferredContentSizeCategoryName
{
  return (id)_AXSCopyPreferredContentSizeCategoryName();
}

@end
