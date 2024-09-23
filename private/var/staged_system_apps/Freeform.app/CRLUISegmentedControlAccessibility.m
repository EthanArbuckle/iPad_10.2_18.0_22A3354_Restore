@implementation CRLUISegmentedControlAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UISegmentedControl");
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
  v5 = (void *)objc_opt_class(CRLUISegmentedControlAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)crlaxSetSegmentDescriptions:(id)a3
{
  id v4;
  CRLUISegmentedControlAccessibility *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;

  v4 = a3;
  v5 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUISegmentedControlAccessibility valueForKey:](v5, "valueForKey:", CFSTR("_segments")));
  v7 = objc_msgSend(v6, "count");
  v8 = objc_msgSend(v4, "count");
  if (v8 == v7)
  {
    if (v7)
    {
      v9 = 0;
      while (1)
      {
        v30 = 0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v9));
        v12 = (objc_class *)objc_opt_class(UIImageView, v11);
        v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v30);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (v30)
          break;
        v15 = (void *)v14;

        v29 = 0;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", v9));
        v18 = (objc_class *)objc_opt_class(NSString, v17);
        v19 = __CRLAccessibilityCastAsClass(v18, (uint64_t)v16, 1, &v29);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (v29)
          break;
        v21 = (void *)v20;

        objc_msgSend(v15, "setAccessibilityLabel:", v21);
        if (v7 == (id)++v9)
          goto LABEL_10;
      }
LABEL_11:
      abort();
    }
  }
  else
  {
    v22 = (uint64_t)v8;
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Number of segments have changed from %lu to %lu"), v24, v25, v26, v27, v28, v22))goto LABEL_11;
    }
  }
LABEL_10:

}

@end
