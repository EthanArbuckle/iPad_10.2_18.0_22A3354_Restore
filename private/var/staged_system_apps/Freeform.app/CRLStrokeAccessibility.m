@implementation CRLStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLStroke");
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
  objc_opt_class(CRLStrokeAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLStrokePatternAccessibility)crlaxStrokePattern
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pattern"));

  objc_opt_class(CRLStrokePatternAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLStrokePatternAccessibility *)v8;
}

- (BOOL)crlaxStrokeIsEmpty
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isNullStroke");

  return v3;
}

- (NSString)crlaxStrokePatternDescription
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (-[CRLStrokeAccessibility crlaxStrokeIsEmpty](self, "crlaxStrokeIsEmpty"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Empty stroke"), 0, 0));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokePattern](self, "crlaxStrokePattern"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxStyleInfoDescription"));
  }
  v5 = (void *)v4;

  return (NSString *)v5;
}

- (NSString)crlaxStrokeWidthDescription
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  -[CRLStrokeAccessibility crlaxStrokeWidth](self, "crlaxStrokeWidth");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%.2f points wide"), 0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v3));

  return (NSString *)v6;
}

- (NSString)crlaxStrokeColorDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeColor](self, "crlaxStrokeColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxStyleInfoDescription"));

  return (NSString *)v3;
}

- (NSString)crlaxStrokeFullDescription
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v17;

  if (-[CRLStrokeAccessibility crlaxStrokeIsEmpty](self, "crlaxStrokeIsEmpty")
    || (-[CRLStrokeAccessibility crlaxStrokeWidth](self, "crlaxStrokeWidth"), v3 <= 0.0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("None"), 0, 0));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeColor](self, "crlaxStrokeColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxApproximateColorDescriptionWithOpacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeWidthDescription](self, "crlaxStrokeWidthDescription"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokePattern](self, "crlaxStrokePattern"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxStyleInfoDescriptionOmittingStroke"));
    v14 = __CRLAccessibilityStringForVariables(1, v5, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  return (NSString *)v15;
}

- (CRLColorAccessibility)crlaxStrokeColor
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "color"));

  objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLColorAccessibility *)v8;
}

- (double)crlaxStrokeWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

- (NSString)crlaxStyleInfoDescription
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v14;

  if (-[CRLStrokeAccessibility crlaxStrokeIsEmpty](self, "crlaxStrokeIsEmpty"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("No stroke"), 0, 0));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokePatternDescription](self, "crlaxStrokePatternDescription"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeWidthDescription](self, "crlaxStrokeWidthDescription"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokeAccessibility crlaxStrokeColorDescription](self, "crlaxStrokeColorDescription"));
    v12 = __CRLAccessibilityStringForVariables(1, v3, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  return (NSString *)v4;
}

@end
