@implementation CRLImageLayoutAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLImageLayout");
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
  objc_opt_class(CRLImageLayoutAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsInMaskEditMode
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLImageLayoutAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isInMaskEditMode");

  return v3;
}

@end
