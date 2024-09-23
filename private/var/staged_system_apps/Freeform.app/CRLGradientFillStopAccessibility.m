@implementation CRLGradientFillStopAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLGradientFillStop");
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
  v5 = (void *)objc_opt_class(CRLGradientFillStopAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLColorAccessibility)crlaxColor
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillStopAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "color"));

  v5 = (void *)objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLColorAccessibility *)v8;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGradientFillStopAccessibility crlaxColor](self, "crlaxColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxStyleInfoDescription"));

  return (NSString *)v3;
}

@end
