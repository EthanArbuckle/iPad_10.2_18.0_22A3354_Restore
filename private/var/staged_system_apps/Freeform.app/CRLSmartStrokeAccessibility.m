@implementation CRLSmartStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLSmartStroke");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLStrokeAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLSmartStrokeAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxStrokePatternDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStrokeAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "strokeName"));

  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStrokeAccessibility crlaxKnownStrokePatternLocalizationStrings](self, "crlaxKnownStrokePatternLocalizationStrings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      if (!objc_msgSend(v6, "length"))
      {
        ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        v9 = objc_msgSend((id)objc_opt_class(self, v8), "crlaxTargetClassName");
        v17 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v15 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unknown stroke pattern %@. Please add an entry in crlaxKnownStrokePatternLocalizationStrings in %@Accessibility."), v10, v11, v12, v13, v14, (uint64_t)v4);

        if (v15)
          abort();
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSDictionary)crlaxKnownStrokePatternLocalizationStrings
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v5 = objc_msgSend((id)objc_opt_class(self, v4), "crlaxTargetClassName");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v12 = __CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("crlaxKnownStrokePatternLocalizationStrings is abstract, please implement on %@Accessibility"), v7, v8, v9, v10, v11, (uint64_t)v6);

    if (v12)
      abort();
  }
  return 0;
}

- (id)crlaxStrokeFullDescription
{
  CRLSmartStrokeAccessibility *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v21;
  char v22;

  v22 = 0;
  v2 = self;
  v4 = (void *)objc_opt_class(CRLStrokeAccessibility, v3);
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v2, 1, &v22);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v22)
    abort();
  v7 = (void *)v6;

  if ((objc_msgSend(v7, "crlaxStrokeIsEmpty") & 1) != 0
    || (objc_msgSend(v7, "crlaxStrokeWidth"), v8 <= 0.0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("None"), 0, 0));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeColor](v2, "crlaxStrokeColor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxApproximateColorDescriptionWithOpacity"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeWidthDescription](v2, "crlaxStrokeWidthDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLSmartStrokeAccessibility crlaxStrokePatternDescription](v2, "crlaxStrokePatternDescription"));
    v18 = __CRLAccessibilityStringForVariables(1, v10, v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  }
  return v19;
}

@end
