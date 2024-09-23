@implementation TSDDrawableEffectsInspectorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDDrawableEffectsInspectorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)p_cellsForReflectionSection
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDDrawableEffectsInspectorControllerAccessibility;
  v3 = -[TSDDrawableEffectsInspectorControllerAccessibility p_cellsForReflectionSection](&v5, "p_cellsForReflectionSection");
  objc_msgSend(-[TSDDrawableEffectsInspectorControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mReflectionOpacitySlider")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("reflection.slider")));
  return v3;
}

- (id)p_cellsForOpacitySection
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDDrawableEffectsInspectorControllerAccessibility;
  v2 = -[TSDDrawableEffectsInspectorControllerAccessibility p_cellsForOpacitySection](&v4, "p_cellsForOpacitySection");
  objc_msgSend(objc_msgSend(objc_msgSend(v2, "lastObject"), "tsaxValueForKey:", CFSTR("slider")), "setAccessibilityLabel:", TSAccessibilityLocalizedString((uint64_t)CFSTR("opacity.slider")));
  return v2;
}

@end
