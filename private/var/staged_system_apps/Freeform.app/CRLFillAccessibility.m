@implementation CRLFillAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLFill");
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
  v5 = (void *)objc_opt_class(CRLFillAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (int64_t)crlaxFillType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "fillType");

  return (int64_t)v3;
}

- (CRLColorAccessibility)crlaxReferenceColor
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFillAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "referenceColor"));

  v5 = (void *)objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLColorAccessibility *)v8;
}

+ (id)crlaxDescriptionForFill:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v14;

  v3 = a3;
  if (!v3
    || (v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null")),
        v4,
        v4 == v3))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("No fill"), 0, 0));
  }
  else
  {
    if ((objc_opt_isKindOfClass(v3, +[CRLAccessibilitySafeCategory crlaxTargetClass](CRLFillAccessibility, "crlaxTargetClass")) & 1) == 0)
    {
      v12 = 0;
      goto LABEL_8;
    }
    v14 = 0;
    v5 = v3;
    v7 = (void *)objc_opt_class(CRLFillAccessibility, v6);
    v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v5, 1, &v14);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (v14)
      abort();
    v10 = (void *)v9;

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxStyleInfoDescription"));
  }
  v12 = (void *)v11;

LABEL_8:
  return v12;
}

- (NSString)crlaxStyleInfoDescription
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v5 = objc_opt_class(self, v4);
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("-[CRLFillAccessibility crlaxStyleInfoDescription] is abstract. Please implement crlaxStyleInfoDescription in %@."), v6, v7, v8, v9, v10, v5))abort();
  }
  return 0;
}

@end
