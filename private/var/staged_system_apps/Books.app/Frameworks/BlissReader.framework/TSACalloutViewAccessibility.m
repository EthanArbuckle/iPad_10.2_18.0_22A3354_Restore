@implementation TSACalloutViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSACalloutView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)setExcludeTitlesFromButtons:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    v5.receiver = self;
    v5.super_class = (Class)TSACalloutViewAccessibility;
    -[TSACalloutViewAccessibility setExcludeTitlesFromButtons:](&v5, "setExcludeTitlesFromButtons:", v3);
  }
}

- (TSACalloutViewAccessibility)init
{
  TSACalloutViewAccessibility *v2;
  TSACalloutViewAccessibility *v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSACalloutViewAccessibility;
  v2 = -[TSACalloutViewAccessibility init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v5.receiver = v2;
    v5.super_class = (Class)TSACalloutViewAccessibility;
    -[TSACalloutViewAccessibility setExcludeTitlesFromButtons:](&v5, "setExcludeTitlesFromButtons:", 1);
  }
  return v3;
}

@end
