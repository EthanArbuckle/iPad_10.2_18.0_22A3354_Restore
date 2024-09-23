@implementation CRLShadowAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLShadow");
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
  objc_opt_class(CRLShadowAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsShadowEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (NSString)crlaxShadowTypeDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Shadow"), 0, 0));

  return (NSString *)v3;
}

- (NSString)crlaxShadowAngleDescription
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRLShadowAccessibility _crlaxShadowAngle](self, "_crlaxShadowAngle");
  if (v2 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v3 = v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%.0f degrees"), 0, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, *(_QWORD *)&v3));

  }
  return (NSString *)v6;
}

- (NSString)crlaxShadowColorDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility _crlaxShadowColor](self, "_crlaxShadowColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxStyleInfoDescription"));

  return (NSString *)v3;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v14;

  if (-[CRLShadowAccessibility crlaxIsShadowEnabled](self, "crlaxIsShadowEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxShadowTypeDescription](self, "crlaxShadowTypeDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxShadowAngleDescription](self, "crlaxShadowAngleDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxShadowColorDescription](self, "crlaxShadowColorDescription"));
    v11 = __CRLAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No shadow"), 0, 0));
  }

  return (NSString *)v12;
}

- (double)_crlaxShadowAngle
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "angle");
  v4 = v3;

  return v4;
}

- (CRLColorAccessibility)_crlaxShadowColor
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShadowAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "color"));

  objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLColorAccessibility *)v8;
}

@end
