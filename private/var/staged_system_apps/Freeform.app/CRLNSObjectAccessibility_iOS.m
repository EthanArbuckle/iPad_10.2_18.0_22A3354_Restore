@implementation CRLNSObjectAccessibility_iOS

+ (id)crlaxTargetClassName
{
  return CFSTR("NSObject");
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
  objc_opt_class(CRLNSObjectAccessibility_iOS, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  void *v3;
  CRLNSObjectAccessibility_iOS *v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v4 = (CRLNSObjectAccessibility_iOS *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_firstElementForUpcomingScreenChange"));

  if (v4 == self)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)CRLNSObjectAccessibility_iOS;
  return -[CRLNSObjectAccessibility_iOS _accessibilityServesAsFirstElement](&v6, "_accessibilityServesAsFirstElement");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLNSObjectAccessibility_iOS;
  -[CRLNSObjectAccessibility_iOS _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[CRLNSObjectAccessibility_iOS crlaxLoadAccessibilityInformation](self, "crlaxLoadAccessibilityInformation");
}

@end
