@implementation CRLLineEndAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLLineEnd");
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
  objc_opt_class(CRLLineEndAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsTypeNone
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEndAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (id)+[CRLLineEnd lineEndTypeFromLineEnd:](CRLLineEnd, "lineEndTypeFromLineEnd:", v2) == (id)10;

  return v3;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLineEndAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityDescription"));

  return (NSString *)v3;
}

@end
