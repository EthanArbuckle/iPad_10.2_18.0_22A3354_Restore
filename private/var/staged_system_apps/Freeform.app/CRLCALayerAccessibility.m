@implementation CRLCALayerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CALayer");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (id)description
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLCALayerAccessibility;
  v2 = -[CRLCALayerAccessibility description](&v4, "description");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

- (id)accessibilityLabel
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v10;
  objc_super v11;

  objc_opt_class(CATextLayer, a2);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCALayerAccessibility string](self, "string"));
    objc_opt_class(NSAttributedString, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "string"));
    else
      v7 = v4;
    v10 = v7;

    return v10;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CRLCALayerAccessibility;
    v8 = -[CRLCALayerAccessibility accessibilityLabel](&v11, "accessibilityLabel");
    return (id)objc_claimAutoreleasedReturnValue(v8);
  }
}

- (CGRect)accessibilityFrame
{
  id v3;
  void *v4;
  CRLCALayerAccessibility *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect result;

  v3 = -[CRLCALayerAccessibility crlaxAncestorOfType:](self, "crlaxAncestorOfType:", NSClassFromString(CFSTR("CRLCanvasView")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = self;
    -[CRLCALayerAccessibility bounds](v5, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
    -[CRLCALayerAccessibility convertRect:toLayer:](v5, "convertRect:toLayer:", v14, v7, v9, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;

    objc_msgSend(v4, "crlaxFrameFromBounds:", v16, v18, v20, v22);
  }
  else
  {
    v35.receiver = self;
    v35.super_class = (Class)CRLCALayerAccessibility;
    -[CRLCALayerAccessibility accessibilityFrame](&v35, "accessibilityFrame");
  }
  v27 = v23;
  v28 = v24;
  v29 = v25;
  v30 = v26;

  v31 = v27;
  v32 = v28;
  v33 = v29;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

@end
