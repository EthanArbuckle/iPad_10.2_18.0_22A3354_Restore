@implementation CRLColorFillAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLColorFill");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLFillAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLColorFillAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxColorFillName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxColor](self, "crlaxColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxStyleInfoDescription"));

  return (NSString *)v3;
}

- (NSString)crlaxColorFillNameWithOpacity
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxColor](self, "crlaxColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  v5 = objc_msgSend(v4, "isClear");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Clear"), 0, 0));
LABEL_5:

    v6 = (void *)v7;
    return (NSString *)v6;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxColor](self, "crlaxColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxTarget"));
  v10 = objc_msgSend(v9, "isOpaque");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxColorFillName](self, "crlaxColorFillName"));
  if ((v10 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxColor](self, "crlaxColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));
    objc_msgSend(v12, "alphaComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorAccessibility crlaxOpacityDescriptionStringForAlphaComponent:](CRLColorAccessibility, "crlaxOpacityDescriptionStringForAlphaComponent:"));
    v20 = __CRLAccessibilityStringForVariables(1, v6, v14, v15, v16, v17, v18, v19, (uint64_t)v13);
    v7 = objc_claimAutoreleasedReturnValue(v20);

    goto LABEL_5;
  }
  return (NSString *)v6;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorFillAccessibility crlaxTarget](self, "crlaxTarget"));
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
