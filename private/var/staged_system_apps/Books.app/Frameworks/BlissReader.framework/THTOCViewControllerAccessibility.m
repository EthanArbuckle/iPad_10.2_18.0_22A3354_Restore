@implementation THTOCViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THTOCViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (double)_thaxLastTimestampForPerformingBlockAffectingMediaControllerState
{
  double result;

  __TSAccessibilityGetAssociatedTimeInterval(self, &unk_543A2C);
  return result;
}

- (void)_thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:(double)a3
{
  __TSAccessibilitySetAssociatedTimeInterval(self, &unk_543A2C, a3);
}

- (THBookViewControllerAccessibility)thaxDelegate
{
  void *v3;
  THBookViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THBookViewControllerAccessibility);
  result = (THBookViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THTOCViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)thaxIntroMediaControllerIsActive
{
  return -[THTOCViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("introMediaControllerIsActive"));
}

- (id)thaxDocumentViewController
{
  id result;

  result = -[THTOCViewControllerAccessibility thaxDelegate](self, "thaxDelegate");
  if (result)
    return objc_msgSend(result, "tsaxValueForKey:", CFSTR("documentViewController"));
  return result;
}

- (void)_axShowToolbar
{
  id v3;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = -[THTOCViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
    if ((objc_opt_respondsToSelector(v3, "showToolbarAnimated:") & 1) != 0)
      objc_msgSend(v3, "showToolbarAnimated:", 0);
  }
}

- (void)_axHideToolbar
{
  id v3;
  _QWORD v4[5];

  if (UIAccessibilityIsVoiceOverRunning())
  {
    v3 = -[THTOCViewControllerAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
    if ((objc_opt_respondsToSelector(v3, "hideToolbarAnimated:") & 1) != 0)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_265508;
      v4[3] = &unk_426DD0;
      v4[4] = v3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
        abort();
    }
  }
}

- (void)_axPerformBlockAffectingMediaControllerState:(id)a3
{
  double v5;
  double v6;
  double v7;

  -[THTOCViewControllerAccessibility _thaxLastTimestampForPerformingBlockAffectingMediaControllerState](self, "_thaxLastTimestampForPerformingBlockAffectingMediaControllerState");
  v6 = v5;
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  if (v7 - v6 <= 1.0)
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[THTOCViewControllerAccessibility _thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:](self, "_thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:");
    (*((void (**)(id))a3 + 2))(a3);
    if (-[THTOCViewControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("introMediaControllerIsActive")))-[THTOCViewControllerAccessibility _axHideToolbar](self, "_axHideToolbar");
    else
      -[THTOCViewControllerAccessibility _axShowToolbar](self, "_axShowToolbar");
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_265660;
  v3[3] = &unk_427268;
  v4 = a3;
  v3[4] = self;
  -[THTOCViewControllerAccessibility _axPerformBlockAffectingMediaControllerState:](self, "_axPerformBlockAffectingMediaControllerState:", v3);
}

@end
