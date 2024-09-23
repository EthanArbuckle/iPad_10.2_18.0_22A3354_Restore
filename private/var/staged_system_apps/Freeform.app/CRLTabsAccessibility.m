@implementation CRLTabsAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPTabs");
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
  objc_opt_class(CRLTabsAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (unint64_t)crlaxCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTabsAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

@end
