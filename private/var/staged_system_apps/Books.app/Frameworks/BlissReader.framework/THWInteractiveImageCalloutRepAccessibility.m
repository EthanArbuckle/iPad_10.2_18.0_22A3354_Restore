@implementation THWInteractiveImageCalloutRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWInteractiveImageCalloutRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSDContainerRepAccessibility, a2);
}

- (NSString)thaxTitle
{
  id v2;
  objc_class *v3;
  NSString *result;
  char v5;

  v2 = objc_msgSend(-[THWInteractiveImageCalloutRepAccessibility _thaxCalloutInfo](self, "_thaxCalloutInfo"), "tsaxValueForKey:", CFSTR("titleStorage"));
  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("string")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSString)thaxDescription
{
  id v2;
  objc_class *v3;
  NSString *result;
  char v5;

  v2 = objc_msgSend(-[THWInteractiveImageCalloutRepAccessibility _thaxCalloutInfo](self, "_thaxCalloutInfo"), "tsaxValueForKey:", CFSTR("descriptionStorage"));
  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("string")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIsAnimatingCallouts
{
  return -[THWInteractiveImageCalloutRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("p_animatingCallouts"));
}

- (BOOL)thaxAnyCalloutIsSelected
{
  return -[THWInteractiveImageWidgetRepAccessibility thaxCalloutInfoForDisplay](-[THWInteractiveImageCalloutRepAccessibility _thaxHost](self, "_thaxHost"), "thaxCalloutInfoForDisplay") != 0;
}

- (BOOL)thaxIsVisibleOnPage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v16;
  CGRect v17;

  -[TSDRepAccessibility tsaxFrameInScreenSpace](self, "tsaxFrameInScreenSpace");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](-[THWInteractiveImageWidgetRepAccessibility thaxScrollContentCanvasView](-[THWInteractiveImageCalloutRepAccessibility _thaxHost](self, "_thaxHost"), "thaxScrollContentCanvasView"), "tsaxEnclosingScrollView"), "accessibilityFrame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  return CGRectIntersectsRect(v16, v17);
}

- (BOOL)thaxShouldHideChildReps
{
  return 1;
}

- (BOOL)tsaxIsSelected
{
  id v3;

  v3 = -[THWInteractiveImageWidgetRepAccessibility thaxCalloutInfoForDisplay](-[THWInteractiveImageCalloutRepAccessibility _thaxHost](self, "_thaxHost"), "thaxCalloutInfoForDisplay");
  return v3 == -[THWInteractiveImageCalloutRepAccessibility tsaxInfo](self, "tsaxInfo");
}

- (BOOL)tsaxSelect
{
  -[THWInteractiveImageWidgetRepAccessibility thaxSelectCallout:](-[THWInteractiveImageCalloutRepAccessibility _thaxHost](self, "_thaxHost"), "thaxSelectCallout:", self);
  return 1;
}

- (BOOL)tsaxIsSelectable
{
  return 1;
}

- (id)tsaxInfo
{
  return -[TSDLayoutAccessibility tsaxValueForKey:](-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxValueForKey:", CFSTR("calloutInfo"));
}

- (THWInteractiveImageWidgetRepAccessibility)_thaxHost
{
  void *v3;
  THWInteractiveImageWidgetRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWInteractiveImageWidgetRepAccessibility);
  result = (THWInteractiveImageWidgetRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_host")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxCalloutInfo
{
  return objc_msgSend(-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layout")), "tsaxValueForKey:", CFSTR("calloutInfo"));
}

- (BOOL)_thaxWasSelectedPriorToAccessibilityActivate
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A37);
}

- (void)_thaxSetWasSelectedPriorToAccessibilityActivate:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A37, a3);
}

- (void)updateFromLayout
{
  unsigned __int8 v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageCalloutRepAccessibility;
  -[THWInteractiveImageCalloutRepAccessibility updateFromLayout](&v4, "updateFromLayout");
  if (!-[THWInteractiveImageCalloutRepAccessibility thaxIsAnimatingCallouts](self, "thaxIsAnimatingCallouts"))
  {
    if (-[THWInteractiveImageCalloutRepAccessibility thaxAnyCalloutIsSelected](self, "thaxAnyCalloutIsSelected")
      || !-[THWInteractiveImageCalloutRepAccessibility _thaxWasSelectedPriorToAccessibilityActivate](self, "_thaxWasSelectedPriorToAccessibilityActivate"))
    {
      v3 = -[THWInteractiveImageCalloutRepAccessibility tsaxIsSelected](self, "tsaxIsSelected");
      if (!self || (v3 & 1) == 0)
        goto LABEL_9;
    }
    else if (!self)
    {
      goto LABEL_9;
    }
    TSAccessibilityPostLayoutChangedNotification(self);
LABEL_9:
    -[THWInteractiveImageCalloutRepAccessibility _thaxSetWasSelectedPriorToAccessibilityActivate:](self, "_thaxSetWasSelectedPriorToAccessibilityActivate:", 0);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unsigned int v3;
  id result;
  id v5;
  NSString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = -[THWInteractiveImageCalloutRepAccessibility tsaxIsSelected](self, "tsaxIsSelected");
  result = -[THWInteractiveImageCalloutRepAccessibility thaxTitle](self, "thaxTitle");
  v5 = result;
  if (v3)
  {
    v6 = -[THWInteractiveImageCalloutRepAccessibility thaxDescription](self, "thaxDescription");
    return __TSAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  }
  return result;
}

- (id)accessibilityHint
{
  if (-[THWInteractiveImageCalloutRepAccessibility tsaxIsSelected](self, "tsaxIsSelected"))
    return THAccessibilityLocalizedString((uint64_t)CFSTR("interactive.image.callout.hint.selected.ios"));
  else
    return THAccessibilityLocalizedString((uint64_t)CFSTR("interactive.image.callout.hint.unselected.ios"));
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  -[THWInteractiveImageCalloutRepAccessibility _thaxSetWasSelectedPriorToAccessibilityActivate:](self, "_thaxSetWasSelectedPriorToAccessibilityActivate:", -[THWInteractiveImageCalloutRepAccessibility tsaxIsSelected](self, "tsaxIsSelected"));
  -[THWInteractiveImageCalloutRepAccessibility tsaxSelect](self, "tsaxSelect");
  return 1;
}

@end
