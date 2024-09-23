@implementation CRLAngleGradientFillAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLAngleGradientFill");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLGradientFillAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLAngleGradientFillAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (double)crlaxGradientAngleInDegrees
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAngleGradientFillAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "gradientAngleInDegrees");
  v4 = v3;

  return v4;
}

- (NSString)crlaxStyleInfoDescription
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  -[CRLAngleGradientFillAccessibility crlaxGradientAngleInDegrees](self, "crlaxGradientAngleInDegrees");
  if (v3 == 0.0)
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLAngleGradientFillAccessibility;
    v10 = -[CRLGradientFillAccessibility crlaxStyleInfoDescription](&v13, "crlaxStyleInfoDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%1$@, %2$.0f degrees"), 0, 0));

    v14.receiver = self;
    v14.super_class = (Class)CRLAngleGradientFillAccessibility;
    v7 = -[CRLGradientFillAccessibility crlaxStyleInfoDescription](&v14, "crlaxStyleInfoDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8, *(_QWORD *)&v4));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "capitalizedString"));

  return (NSString *)v11;
}

@end
