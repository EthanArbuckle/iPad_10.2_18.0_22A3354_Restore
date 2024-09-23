@implementation THWAdornmentControllerAccessibility

- (THWAdornmentCloseButtonAccessibility)thaxCloseButton
{
  void *v3;
  THWAdornmentCloseButtonAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWAdornmentCloseButtonAccessibility);
  result = (THWAdornmentCloseButtonAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAdornmentControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("closeButton")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THWAdornmentPanelAccessibility)thaxTopPanel
{
  void *v3;
  Class v4;
  THWAdornmentPanelAccessibility *v5;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THWAdornmentPanelAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAdornmentControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("topPanel")), 1, &v7);
  if (v7)
    abort();
  v5 = (THWAdornmentPanelAccessibility *)v4;
  objc_msgSend(-[objc_class thaxCanvasView](v4, "thaxCanvasView"), "thaxSetUsesChildrenFramesForSorting:", 1);
  return v5;
}

- (THWAdornmentPanelAccessibility)thaxBottomPanel
{
  void *v3;
  Class v4;
  THWAdornmentPanelAccessibility *v5;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THWAdornmentPanelAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAdornmentControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("bottomPanel")), 1, &v7);
  if (v7)
    abort();
  v5 = (THWAdornmentPanelAccessibility *)v4;
  objc_msgSend(-[objc_class thaxCanvasView](v4, "thaxCanvasView"), "thaxSetUsesChildrenFramesForSorting:", 1);
  return v5;
}

- (THWAdornmentPanelAccessibility)thaxControlPanel
{
  void *v3;
  Class v4;
  THWAdornmentPanelAccessibility *v5;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THWAdornmentPanelAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAdornmentControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("controlPanel")), 1, &v7);
  if (v7)
    abort();
  v5 = (THWAdornmentPanelAccessibility *)v4;
  objc_msgSend(-[objc_class thaxCanvasView](v4, "thaxCanvasView"), "thaxSetUsesChildrenFramesForSorting:", 1);
  return v5;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWAdornmentController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)thaxAlwaysShowPanels
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A1A);
}

- (void)thaxSetAlwaysShowPanels:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A1A, a3);
}

- (BOOL)thaxIsShowingAlternateUI
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A1B);
}

- (void)thaxSetShowingAlternateUI:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A1B, a3);
}

- (void)thaxShow
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_25A09C;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)thaxHide
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_25A130;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)p_updateAdornmentVisibilityAnimated:(BOOL)a3 forced:(BOOL)a4 completionBlock:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWAdornmentControllerAccessibility;
  -[THWAdornmentControllerAccessibility p_updateAdornmentVisibilityAnimated:forced:completionBlock:](&v6, "p_updateAdornmentVisibilityAnimated:forced:completionBlock:", a3, a4, a5);
  -[THWAdornmentControllerAccessibility thaxSetInsetsNeedUpdate](self, "thaxSetInsetsNeedUpdate");
}

- (void)setAdornmentsVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  if (-[THWAdornmentControllerAccessibility thaxAlwaysShowPanels](self, "thaxAlwaysShowPanels"))
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:](&v6, "setAdornmentsVisible:", 1, v5.receiver, v5.super_class, self, THWAdornmentControllerAccessibility);
  }
  else if (!-[THWAdornmentControllerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"))
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:](&v5, "setAdornmentsVisible:", v3, self, THWAdornmentControllerAccessibility, v6.receiver, v6.super_class);
  }
}

- (void)setAdornmentsVisible:(BOOL)a3 buttonVisible:(BOOL)a4 controlsVisible:(BOOL)a5 forceVisibility:(BOOL)a6 animated:(BOOL)a7 completionBlock:(id)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  objc_super v15;
  objc_super v16;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  if (-[THWAdornmentControllerAccessibility thaxAlwaysShowPanels](self, "thaxAlwaysShowPanels"))
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](&v16, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", 1, 1, v11, v10, 0, a8, v15.receiver, v15.super_class, self, THWAdornmentControllerAccessibility);
  }
  else if (!-[THWAdornmentControllerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"))
  {
    -[THWAdornmentControllerAccessibility setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](&v15, "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", v13, v12, v11, v10, v9, a8, self, THWAdornmentControllerAccessibility, v16.receiver, v16.super_class);
  }
}

- (THTSDRepAccessibility)thaxExpandedRep
{
  void *v3;
  THTSDRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDRepAccessibility);
  result = (THTSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWAdornmentControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)thaxSetInsetsNeedUpdate
{
  THTSDRepAccessibility *v2;
  void *v3;
  Class v4;
  char v5;

  v2 = -[THWAdornmentControllerAccessibility thaxExpandedRep](self, "thaxExpandedRep");
  if ((objc_opt_isKindOfClass(v2, +[TSAccessibilitySafeCategory tsaxTargetClass](THWSceneRepAccessibility, "tsaxTargetClass")) & 1) != 0)
  {
    v5 = 0;
    v3 = (void *)objc_opt_class(THWSceneRepAccessibility);
    v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
    if (v5)
      abort();
    -[objc_class thaxSetInsetsNeedUpdate](v4, "thaxSetInsetsNeedUpdate");
  }
}

@end
