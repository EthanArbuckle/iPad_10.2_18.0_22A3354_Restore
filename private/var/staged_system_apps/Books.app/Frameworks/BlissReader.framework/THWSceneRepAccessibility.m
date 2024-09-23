@implementation THWSceneRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWSceneRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (THWSceneControllerAccessibility)thaxSceneController
{
  void *v3;
  THWSceneControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWSceneControllerAccessibility);
  result = (THWSceneControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_sceneController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)thaxExpandedRepController
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("expandedRepController"));
}

- (BOOL)thaxIsExpanded
{
  return -[THWSceneRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isExpanded"));
}

- (void)thaxSetInsetsNeedUpdate
{
  if (-[THWSceneRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxUpdateInsets", &OBJC_PROTOCOL___THWSceneRepAccessibilityExtras))-[THWSceneRepAccessibility thaxUpdateInsets](self, "thaxUpdateInsets");
}

- (void)p_setupSceneControllerIfNecessary:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWSceneRepAccessibility;
  -[THWSceneRepAccessibility p_setupSceneControllerIfNecessary:](&v4, "p_setupSceneControllerIfNecessary:", a3);
  -[THWSceneRepAccessibility thaxSetInsetsNeedUpdate](self, "thaxSetInsetsNeedUpdate");
}

- (void)replaceContentsFromRep:(id)a3
{
  objc_super v5;

  if (!-[THWSceneRepAccessibility thaxIsExpanded](self, "thaxIsExpanded")
    && -[THWSceneRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "thaxRemoveInsets", &OBJC_PROTOCOL___THWSceneRepAccessibilityExtras))
  {
    objc_msgSend(a3, "thaxRemoveInsets");
  }
  v5.receiver = self;
  v5.super_class = (Class)THWSceneRepAccessibility;
  -[THWSceneRepAccessibility replaceContentsFromRep:](&v5, "replaceContentsFromRep:", a3);
}

- (void)thaxUpdateInsets
{
  THWSceneViewAccessibility *v3;
  THWiOSExpandedViewControllerAccessibility *v4;
  id v5;
  id v6;
  double Height;
  CGRect v8;
  CGRect v9;

  v3 = -[THWSceneControllerAccessibility thaxSceneView](-[THWSceneRepAccessibility thaxSceneController](self, "thaxSceneController"), "thaxSceneView");
  v4 = -[THWSceneRepAccessibility thaxExpandedViewController](self, "thaxExpandedViewController");
  v5 = -[THWAdornmentPanelAccessibility thaxView](-[THWAdornmentControllerAccessibility thaxTopPanel](-[THWiOSExpandedViewControllerAccessibility thaxAdornmentController](v4, "thaxAdornmentController"), "thaxTopPanel"), "thaxView");
  v6 = -[THWAdornmentPanelAccessibility thaxView](-[THWAdornmentControllerAccessibility thaxBottomPanel](-[THWiOSExpandedViewControllerAccessibility thaxAdornmentController](v4, "thaxAdornmentController"), "thaxBottomPanel"), "thaxView");
  Height = 0.0;
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameLeftInset:](v3, "thaxSetAccessibilityFrameLeftInset:", 0.0);
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameRightInset:](v3, "thaxSetAccessibilityFrameRightInset:", 0.0);
  if (-[THWiOSExpandedViewControllerAccessibility thaxExpandedRepControllerState](v4, "thaxExpandedRepControllerState") == 2)
  {
    objc_msgSend(v5, "frame");
    -[THWSceneViewAccessibility thaxSetAccessibilityFrameTopInset:](v3, "thaxSetAccessibilityFrameTopInset:", CGRectGetHeight(v8));
    objc_msgSend(v6, "frame");
    Height = CGRectGetHeight(v9);
  }
  else
  {
    -[THWSceneViewAccessibility thaxSetAccessibilityFrameTopInset:](v3, "thaxSetAccessibilityFrameTopInset:", 0.0);
  }
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameBottomInset:](v3, "thaxSetAccessibilityFrameBottomInset:", Height);
}

- (void)thaxRemoveInsets
{
  THWSceneViewAccessibility *v2;

  v2 = -[THWSceneControllerAccessibility thaxSceneView](-[THWSceneRepAccessibility thaxSceneController](self, "thaxSceneController"), "thaxSceneView");
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameLeftInset:](v2, "thaxSetAccessibilityFrameLeftInset:", 0.0);
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameRightInset:](v2, "thaxSetAccessibilityFrameRightInset:", 0.0);
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameTopInset:](v2, "thaxSetAccessibilityFrameTopInset:", 0.0);
  -[THWSceneViewAccessibility thaxSetAccessibilityFrameBottomInset:](v2, "thaxSetAccessibilityFrameBottomInset:", 0.0);
}

- (THWiOSExpandedViewControllerAccessibility)thaxExpandedViewController
{
  void *v3;
  THWiOSExpandedViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWiOSExpandedViewControllerAccessibility);
  result = (THWiOSExpandedViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWSceneRepAccessibility thaxExpandedRepController](self, "thaxExpandedRepController"), 1, &v5);
  if (v5)
    abort();
  return result;
}

@end
