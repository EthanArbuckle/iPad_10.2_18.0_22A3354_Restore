@implementation CRLBoardItemAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLBoardItem");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (NSString)crlaxUserProvidedDescription
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("accessibilityDescription")));
  v4 = (objc_class *)objc_opt_class(NSString, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return (NSString *)v7;
}

- (NSString)crlaxTypeDescription
{
  return (NSString *)-[CRLBoardItemAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("localizedName"));
}

- (CRLItemGeometryAccessibility)crlaxGeometry
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("geometry")));
  v4 = (void *)objc_opt_class(CRLItemGeometryAccessibility, v3);
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return (CRLItemGeometryAccessibility *)v7;
}

- (NSString)crlaxUserProvidedTitle
{
  return self->_crlaxUserProvidedTitle;
}

- (NSString)crlaxUserProvidedCaption
{
  return self->_crlaxUserProvidedCaption;
}

- (NSString)crlaxUserProvidedTitleLabel
{
  return self->_crlaxUserProvidedTitleLabel;
}

- (NSString)crlaxUserProvidedCaptionLabel
{
  return self->_crlaxUserProvidedCaptionLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxUserProvidedCaptionLabel, 0);
  objc_storeStrong((id *)&self->_crlaxUserProvidedTitleLabel, 0);
  objc_storeStrong((id *)&self->_crlaxUserProvidedCaption, 0);
  objc_storeStrong((id *)&self->_crlaxUserProvidedTitle, 0);
}

@end
