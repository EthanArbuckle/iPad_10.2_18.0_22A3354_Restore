@implementation _UITouchVisualizationView

- (BOOL)_shouldInformFocusAboutBecomingVisible
{
  return 0;
}

- (BOOL)isTransparentFocusItem
{
  return 1;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  return 0;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)_supportsInvalidatingFocusCache
{
  return 1;
}

@end
