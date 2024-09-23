@implementation CRLShapeRepAccessibility

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityHint
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CRLShapeRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityHint](&v18, "accessibilityHint");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxShapeInfo](self, "crlaxShapeInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxShapeStyleName"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxShapeInfo](self, "crlaxShapeInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxShapeTypeHint"));

  v15 = __CRLAccessibilityStringForVariables(1, v8, v9, v10, v11, v12, v13, v14, (uint64_t)v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 1;
}

- (id)crlaxSummaryDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxShapeInfo](self, "crlaxShapeInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxShapeStyleName"));

  return v3;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLShapeRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLCanvasRepAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLShapeRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxLabel
{
  void *v2;
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
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shapeInfo"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityDescription"));
  v12 = __CRLAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return (NSString *)v13;
}

- (CRLShapeItemAccessibility)crlaxShapeInfo
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shapeInfo"));

  objc_opt_class(CRLShapeItemAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLShapeItemAccessibility *)v8;
}

- (id)crlaxKnobLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Shape"), 0, 0));

  return v3;
}

- (BOOL)crlaxIsIgnored
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v3 = objc_msgSend(v2, "crlaxShapeRepsAreIgnored");

  return v3;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  unsigned int v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v9 = objc_msgSend(v8, "needsAccessibilityElements");

  if (v9)
  {
    -[CRLCanvasRepAccessibility crlaxNaturalBounds](self, "crlaxNaturalBounds");
    v12.x = x;
    v12.y = y;
    return CGRectContainsPoint(v13, v12);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLShapeRepAccessibility;
    return -[CRLShapeRepAccessibility containsPoint:withPrecision:](&v11, "containsPoint:withPrecision:", v4, x, y);
  }
}

@end
