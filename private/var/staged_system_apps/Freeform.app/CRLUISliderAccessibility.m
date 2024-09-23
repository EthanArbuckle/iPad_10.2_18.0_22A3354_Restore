@implementation CRLUISliderAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UISlider");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLUISliderAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLUISliderAccessibilityDelegateForFrame)crlaxDelegateForFrame
{
  return (CRLUISliderAccessibilityDelegateForFrame *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_101415AA1);
}

- (void)crlaxSetDelegateForFrame:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_101415AA1, (uint64_t)a3);
}

- (BOOL)_crlaxShouldForceIsTracking
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415AA2);
}

- (void)_crlaxSetShouldForceIsTracking:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415AA2, a3);
}

- (UITableViewCell)crlaxParentTableViewCell
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility superview](self, "superview"));
  if (v3)
  {
    while (1)
    {
      objc_opt_class(UITableViewCell, v2);
      if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
        break;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

      v3 = v5;
      if (!v5)
        goto LABEL_8;
    }
    v11 = 0;
    v3 = v3;
    objc_opt_class(UITableViewCell, v6);
    v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v3, 1, &v11);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v11)
      abort();
    v5 = (void *)v9;

  }
  else
  {
    v5 = 0;
  }
LABEL_8:

  return (UITableViewCell *)v5;
}

- (void)crlaxSetValue:(float)a3 andSendAction:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v7[5];
  float v8;
  BOOL v9;

  v4 = a4;
  if (a4)
    -[CRLUISliderAccessibility _crlaxInteractionDidStart](self, "_crlaxInteractionDidStart");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10046F3A8;
  v7[3] = &unk_101260578;
  v7[4] = self;
  v8 = a3;
  v9 = v4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  if (v4)
    -[CRLUISliderAccessibility _crlaxInteractionDidStop](self, "_crlaxInteractionDidStop");
}

- (id)accessibilityLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLUISliderAccessibility;
  v3 = -[CRLUISliderAccessibility accessibilityLabel](&v9, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility crlaxParentTableViewCell](self, "crlaxParentTableViewCell"));
    v6 = v5;
    if (v5)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));

      v4 = (void *)v7;
    }

  }
  return v4;
}

- (void)accessibilityIncrement
{
  objc_super v3;

  -[CRLUISliderAccessibility _crlaxInteractionDidStart](self, "_crlaxInteractionDidStart");
  v3.receiver = self;
  v3.super_class = (Class)CRLUISliderAccessibility;
  -[CRLUISliderAccessibility accessibilityIncrement](&v3, "accessibilityIncrement");
  -[CRLUISliderAccessibility _crlaxInteractionDidStop](self, "_crlaxInteractionDidStop");
}

- (void)accessibilityDecrement
{
  objc_super v3;

  -[CRLUISliderAccessibility _crlaxInteractionDidStart](self, "_crlaxInteractionDidStart");
  v3.receiver = self;
  v3.super_class = (Class)CRLUISliderAccessibility;
  -[CRLUISliderAccessibility accessibilityDecrement](&v3, "accessibilityDecrement");
  -[CRLUISliderAccessibility _crlaxInteractionDidStop](self, "_crlaxInteractionDidStop");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility crlaxDelegateForFrame](self, "crlaxDelegateForFrame"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility crlaxDelegateForFrame](self, "crlaxDelegateForFrame"));
    objc_msgSend(v4, "crlaxAccessibilityFrameForSlider:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)CRLUISliderAccessibility;
    -[CRLUISliderAccessibility accessibilityFrame](&v21, "accessibilityFrame");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }
  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)isTracking
{
  objc_super v4;

  if (-[CRLUISliderAccessibility _crlaxShouldForceIsTracking](self, "_crlaxShouldForceIsTracking"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)CRLUISliderAccessibility;
  return -[CRLUISliderAccessibility isTracking](&v4, "isTracking");
}

- (void)_crlaxPerformTargetActionsForControlEvents:(unint64_t)a3
{
  CRLUISliderAccessibility *v3;
  void *i;
  void *v5;
  void *v6;
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

  v3 = self;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility allTargets](v3, "allTargets"));
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
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUISliderAccessibility actionsForTarget:forControlEvent:](v3, "actionsForTarget:forControlEvent:", v5, a3));
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
                objc_msgSend(v5, "performSelector:withObject:", v13, v3);
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

- (void)_crlaxInteractionDidStart
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[CRLUISliderAccessibility _crlaxShouldForceIsTracking](self, "_crlaxShouldForceIsTracking"))
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Mismatched calls to crlaxM<Start|End>SliderInteraction"), v4, v5, v6, v7, v8, v9))abort();
    }
  }
  else
  {
    -[CRLUISliderAccessibility _crlaxSetShouldForceIsTracking:](self, "_crlaxSetShouldForceIsTracking:", 1);
    -[CRLUISliderAccessibility _crlaxPerformTargetActionsForControlEvents:](self, "_crlaxPerformTargetActionsForControlEvents:", 1);
  }
}

- (void)_crlaxInteractionDidStop
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[CRLUISliderAccessibility _crlaxShouldForceIsTracking](self, "_crlaxShouldForceIsTracking"))
  {
    -[CRLUISliderAccessibility _crlaxSetShouldForceIsTracking:](self, "_crlaxSetShouldForceIsTracking:", 0);
    -[CRLUISliderAccessibility _crlaxPerformTargetActionsForControlEvents:](self, "_crlaxPerformTargetActionsForControlEvents:", 64);
  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Mismatched calls to crlaxM<Start|End>SliderInteraction"), v4, v5, v6, v7, v8, v9))abort();
  }
}

@end
