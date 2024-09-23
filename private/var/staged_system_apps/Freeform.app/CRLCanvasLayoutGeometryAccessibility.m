@implementation CRLCanvasLayoutGeometryAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasLayoutGeometry");
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
  objc_opt_class(CRLCanvasLayoutGeometryAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (double)crlaxAngleInDegrees
{
  void *v2;
  void *v3;
  double v4;
  double result;
  _OWORD v6[3];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometryAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "transform");
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = 0u;
  }

  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v4 = sub_1000791B0(v6);
  sub_1000618C4(-v4);
  return result;
}

- (double)crlaxAngleInRadians
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  _OWORD v8[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometryAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "transform");
  else
    memset(v8, 0, sizeof(v8));
  v4 = sub_1000791EC((double *)v8);
  sub_100062084(-v4);
  v6 = v5;

  return v6;
}

- (CGSize)crlaxSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CRLCanvasLayoutGeometryAccessibility _crlaxFrame](self, "_crlaxFrame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (CGRect)_crlaxFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayoutGeometryAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

@end
