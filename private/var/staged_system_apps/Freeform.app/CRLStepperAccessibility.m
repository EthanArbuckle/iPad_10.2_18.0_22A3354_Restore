@implementation CRLStepperAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLStepper");
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
  objc_opt_class(CRLStepperAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLStepperAccessibilityDelegate)crlaxDelegate
{
  return (CRLStepperAccessibilityDelegate *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_1014157D0);
}

- (void)crlaxSetDelegate:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_1014157D0, (uint64_t)a3);
}

- (void)crlaxPerformFocusAfterDelay:(double)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003DE7D8;
  v3[3] = &unk_10122D110;
  v3[4] = self;
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v3, a3);
}

- (BOOL)isAccessibilityElement
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_upButton"));
  objc_msgSend(v4, "sendActionsForControlEvents:", 1);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "i_upButton"));
  objc_msgSend(v5, "sendActionsForControlEvents:", 64);

}

- (void)accessibilityDecrement
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "i_downButton"));
  objc_msgSend(v4, "sendActionsForControlEvents:", 1);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "i_downButton"));
  objc_msgSend(v5, "sendActionsForControlEvents:", 64);

}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate")),
        v6 = objc_opt_respondsToSelector(v5, "crlaxValueDescriptionForStepper:"),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxValueDescriptionForStepper:", self));
  }
  else
  {
    v9 = CRLAccessibilityStringsDictKey(CFSTR("stroke.width.points"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
    objc_msgSend(v10, "currentValue");
    v12 = (uint64_t)v11;

    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v12));
  }
  v13 = (void *)v8;

  return v13;
}

- (BOOL)accessibilityPerformEscape
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate"));
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate"));
  v6 = objc_opt_respondsToSelector(v5, "crlaxPerformEscapeForStepper:");

  if ((v6 & 1) == 0)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxDelegate](self, "crlaxDelegate"));
  v8 = objc_msgSend(v7, "crlaxPerformEscapeForStepper:", self);

  return v8;
}

- (id)automationElements
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "i_upButton"));
  -[NSMutableArray crlaxAddObjectIfNotNilWithAssert:](v3, "crlaxAddObjectIfNotNilWithAssert:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStepperAccessibility crlaxTarget](self, "crlaxTarget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "i_downButton"));
  -[NSMutableArray crlaxAddObjectIfNotNilWithAssert:](v3, "crlaxAddObjectIfNotNilWithAssert:", v7);

  v8 = -[NSMutableArray copy](v3, "copy");
  return v8;
}

@end
