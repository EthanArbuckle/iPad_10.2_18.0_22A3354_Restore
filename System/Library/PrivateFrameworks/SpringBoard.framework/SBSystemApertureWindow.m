@implementation SBSystemApertureWindow

- (BOOL)_accessibilityInvertColorsIsDarkWindow
{
  return 0;
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (BOOL)_allowsOcclusionDetectionOverride
{
  return 1;
}

- (void)setAutorotates:(BOOL)a3 forceUpdateInterfaceOrientation:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSystemApertureWindow;
  -[SBSystemApertureWindow setAutorotates:forceUpdateInterfaceOrientation:](&v4, sel_setAutorotates_forceUpdateInterfaceOrientation_, 0, a4);
}

@end
