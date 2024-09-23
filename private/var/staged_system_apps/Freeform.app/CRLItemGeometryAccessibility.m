@implementation CRLItemGeometryAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasInfoGeometry");
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
  v5 = (void *)objc_opt_class(CRLItemGeometryAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CGPoint)crlaxPosition
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLItemGeometryAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "position");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (int64_t)crlaxCompareToInfoGeometry:(id)a3
{
  id v4;
  double v5;
  double v6;
  int64_t v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  -[CRLItemGeometryAccessibility crlaxPosition](self, "crlaxPosition");
  v6 = v5;
  objc_msgSend(v4, "crlaxPosition");
  v7 = -[CRLItemGeometryAccessibility _crlaxCompareCGFloat:toCGFloat:](self, "_crlaxCompareCGFloat:toCGFloat:", v6);
  if (!v7)
  {
    -[CRLItemGeometryAccessibility crlaxPosition](self, "crlaxPosition");
    v9 = v8;
    objc_msgSend(v4, "crlaxPosition");
    v7 = -[CRLItemGeometryAccessibility _crlaxCompareCGFloat:toCGFloat:](self, "_crlaxCompareCGFloat:toCGFloat:", v9, v10);
  }

  return v7;
}

- (int64_t)_crlaxCompareCGFloat:(double)a3 toCGFloat:(double)a4
{
  if (a3 < a4)
    return -1;
  else
    return a3 != a4;
}

@end
