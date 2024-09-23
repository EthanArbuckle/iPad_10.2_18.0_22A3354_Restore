@implementation CRLScalarPathSourceAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLScalarPathSource");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLPathSourceAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_class(CRLScalarPathSourceAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxHint
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScalarPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("A polygon with %@ sides"), 0, 0));
    v7 = CRLAccessibilityLocalizedUnsignedInteger(-[CRLScalarPathSourceAccessibility _crlaxNumberOfSides](self, "_crlaxNumberOfSides"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)_crlaxNumberOfSides
{
  void *v2;
  double v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLScalarPathSourceAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "scalar");
  v4 = llround(v3);

  return v4;
}

@end
