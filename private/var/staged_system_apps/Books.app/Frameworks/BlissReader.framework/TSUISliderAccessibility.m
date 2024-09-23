@implementation TSUISliderAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSUISliderAccessibilityDelegateForFrame)tsaxDelegateForFrame
{
  return (TSUISliderAccessibilityDelegateForFrame *)__TSAccessibilityGetAssociatedObject(self, &unk_5438AA);
}

- (void)tsaxSetDelegateForFrame:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_5438AA, a3);
}

- (BOOL)_tsaxShouldForceIsTracking
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5438AB);
}

- (void)_tsaxSetShouldForceIsTracking:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_5438AB, a3);
}

- (UITableViewCell)tsaxParentTableViewCell
{
  UITableViewCell *result;
  UITableViewCell *v3;
  uint64_t v4;
  objc_class *v5;
  char v6;

  result = (UITableViewCell *)-[TSUISliderAccessibility superview](self, "superview");
  if (result)
  {
    v3 = result;
    while (1)
    {
      v4 = objc_opt_class(UITableViewCell);
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
        break;
      result = (UITableViewCell *)-[UITableViewCell superview](v3, "superview");
      v3 = result;
      if (!result)
        return result;
    }
    v6 = 0;
    v5 = (objc_class *)objc_opt_class(UITableViewCell);
    result = (UITableViewCell *)__TSAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v6);
    if (v6)
      abort();
  }
  return result;
}

- (void)tsaxSetValue:(float)a3 andSendActions:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v7[5];
  float v8;
  BOOL v9;

  v4 = a4;
  if (a4)
    -[TSUISliderAccessibility _tsaxInteractionDidStart](self, "_tsaxInteractionDidStart");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_23E800;
  v7[3] = &unk_43BEF8;
  v7[4] = self;
  v8 = a3;
  v9 = v4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  if (v4)
    -[TSUISliderAccessibility _tsaxInteractionDidStop](self, "_tsaxInteractionDidStop");
}

- (id)accessibilityLabel
{
  id v3;
  UITableViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUISliderAccessibility;
  v3 = -[TSUISliderAccessibility accessibilityLabel](&v6, "accessibilityLabel");
  if (!objc_msgSend(v3, "length"))
  {
    v4 = -[TSUISliderAccessibility tsaxParentTableViewCell](self, "tsaxParentTableViewCell");
    if (v4)
      return -[UITableViewCell accessibilityLabel](v4, "accessibilityLabel");
  }
  return v3;
}

- (void)accessibilityIncrement
{
  objc_super v3;

  -[TSUISliderAccessibility _tsaxInteractionDidStart](self, "_tsaxInteractionDidStart");
  v3.receiver = self;
  v3.super_class = (Class)TSUISliderAccessibility;
  -[TSUISliderAccessibility accessibilityIncrement](&v3, "accessibilityIncrement");
  -[TSUISliderAccessibility _tsaxInteractionDidStop](self, "_tsaxInteractionDidStop");
}

- (void)accessibilityDecrement
{
  objc_super v3;

  -[TSUISliderAccessibility _tsaxInteractionDidStart](self, "_tsaxInteractionDidStart");
  v3.receiver = self;
  v3.super_class = (Class)TSUISliderAccessibility;
  -[TSUISliderAccessibility accessibilityDecrement](&v3, "accessibilityDecrement");
  -[TSUISliderAccessibility _tsaxInteractionDidStop](self, "_tsaxInteractionDidStop");
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  if (-[TSUISliderAccessibility tsaxDelegateForFrame](self, "tsaxDelegateForFrame"))
  {
    -[TSUISliderAccessibilityDelegateForFrame tsaxAccessibilityFrameForSlider:](-[TSUISliderAccessibility tsaxDelegateForFrame](self, "tsaxDelegateForFrame"), "tsaxAccessibilityFrameForSlider:", self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUISliderAccessibility;
    -[TSUISliderAccessibility accessibilityFrame](&v7, "accessibilityFrame");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)isTracking
{
  objc_super v4;

  if (-[TSUISliderAccessibility _tsaxShouldForceIsTracking](self, "_tsaxShouldForceIsTracking"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSUISliderAccessibility;
  return -[TSUISliderAccessibility isTracking](&v4, "isTracking");
}

- (void)_tsaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  void *i;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *j;
  void *v11;
  unsigned int v12;
  SEL v13;
  id obj;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = -[TSUISliderAccessibility allTargets](self, "allTargets");
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v17)
  {
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = -[TSUISliderAccessibility actionsForTarget:forControlEvent:](self, "actionsForTarget:forControlEvent:", v5, a3);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v8; j = (char *)j + 1)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
              v12 = objc_msgSend(v11, "hasSuffix:", CFSTR(":"));
              v13 = NSSelectorFromString((NSString *)v11);
              if (v12)
                objc_msgSend(v5, "performSelector:withObject:", v13, self);
              else
                objc_msgSend(v5, "performSelector:", v13);
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v8);
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v17);
  }
}

- (void)_tsaxInteractionDidStart
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[TSUISliderAccessibility _tsaxShouldForceIsTracking](self, "_tsaxShouldForceIsTracking"))
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Mismatched calls to tsaxM<Start|End>SliderInteraction"), v4, v5, v6, v7, v8, v9))abort();
    }
  }
  else
  {
    -[TSUISliderAccessibility _tsaxSetShouldForceIsTracking:](self, "_tsaxSetShouldForceIsTracking:", 1);
    -[TSUISliderAccessibility _tsaxPerformTargetActionsForControlEvents:](self, "_tsaxPerformTargetActionsForControlEvents:", 1);
  }
}

- (void)_tsaxInteractionDidStop
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[TSUISliderAccessibility _tsaxShouldForceIsTracking](self, "_tsaxShouldForceIsTracking"))
  {
    -[TSUISliderAccessibility _tsaxSetShouldForceIsTracking:](self, "_tsaxSetShouldForceIsTracking:", 0);
    -[TSUISliderAccessibility _tsaxPerformTargetActionsForControlEvents:](self, "_tsaxPerformTargetActionsForControlEvents:", 64);
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Mismatched calls to tsaxM<Start|End>SliderInteraction"), v4, v5, v6, v7, v8, v9))abort();
  }
}

@end
