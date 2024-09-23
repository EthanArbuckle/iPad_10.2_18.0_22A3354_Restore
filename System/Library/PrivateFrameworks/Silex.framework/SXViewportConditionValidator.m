@implementation SXViewportConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGAffineTransform v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "viewportSize");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "contentScaleFactor");
  v12 = 1.0 / v11;
  objc_msgSend(v6, "contentScaleFactor");
  v14 = v13;

  CGAffineTransformMakeScale(&v29, v12, 1.0 / v14);
  v15 = round(v10 * v29.c + v29.a * v8);
  v16 = 1;
  if (v15 > 0.0)
  {
    v17 = round(v10 * v29.d + v29.b * v8);
    if (v17 > 0.0)
    {
      objc_msgSend(v5, "minViewportWidth");
      if (v18 < 0.0)
        goto LABEL_12;
      objc_msgSend(v5, "minViewportWidth");
      if (v19 > 0.0)
      {
        objc_msgSend(v5, "minViewportWidth");
        if (v20 > v15)
          goto LABEL_12;
      }
      if ((objc_msgSend(v5, "maxViewportWidth"), v21 != 1.79769313e308)
        && (objc_msgSend(v5, "maxViewportWidth"), v22 < v15)
        || (v23 = v15 / v17, objc_msgSend(v5, "minViewportAspectRatio"), v24 > 0.0)
        && (objc_msgSend(v5, "minViewportAspectRatio"), v25 > v23)
        || (objc_msgSend(v5, "maxViewportAspectRatio"), v26 != 1.79769313e308)
        && (objc_msgSend(v5, "maxViewportAspectRatio"), v27 < v23))
      {
LABEL_12:
        v16 = 0;
      }
    }
  }

  return v16;
}

@end
