@implementation CRLLineSpacingAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPLineSpacing");
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
  objc_opt_class(CRLLineSpacingAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (int64_t)crlaxMode
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineSpacingAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "mode");

  return (int64_t)v3;
}

- (double)crlaxAmount
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineSpacingAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "amount");
  v4 = v3;

  return v4;
}

- (NSString)crlaxLineSpacingDescription
{
  unint64_t v3;
  __CFString *v4;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v3 = -[CRLLineSpacingAccessibility crlaxMode](self, "crlaxMode");
  if (v3 >= 5)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unknown line spacing, treat as relative format multiplier."), v6, v7, v8, v9, v10, v16))abort();
    }
    v4 = CFSTR("line.spacing.relative");
  }
  else
  {
    v4 = *(&off_101261C20 + v3);
  }
  v11 = CRLAccessibilityStringsDictKey(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    -[CRLLineSpacingAccessibility crlaxAmount](self, "crlaxAmount");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));
  }
  else
  {
    v14 = 0;
  }

  return (NSString *)v14;
}

@end
