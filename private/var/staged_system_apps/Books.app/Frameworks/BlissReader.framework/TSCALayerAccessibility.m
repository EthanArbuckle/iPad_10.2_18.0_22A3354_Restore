@implementation TSCALayerAccessibility

- (id)accessibilityLabel
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v3 = objc_opt_class(CATextLayer);
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
  {
    v4 = -[TSCALayerAccessibility string](self, "string");
    v5 = objc_opt_class(NSAttributedString);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      return objc_msgSend(v4, "string");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)TSCALayerAccessibility;
    return -[TSCALayerAccessibility accessibilityLabel](&v7, "accessibilityLabel");
  }
  return v4;
}

- (CGRect)accessibilityFrame
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v3 = -[TSCALayerAccessibility tsaxAncestorOfType:](self, "tsaxAncestorOfType:", NSClassFromString(CFSTR("TSDCanvasView")));
  if (v3)
  {
    v4 = v3;
    -[TSCALayerAccessibility bounds](self, "bounds");
    -[TSCALayerAccessibility convertRect:toLayer:](self, "convertRect:toLayer:", objc_msgSend(v4, "layer"), v5, v6, v7, v8);
    objc_msgSend(v4, "tsaxFrameFromBounds:");
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)TSCALayerAccessibility;
    -[TSCALayerAccessibility accessibilityFrame](&v13, "accessibilityFrame");
  }
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("CALayer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

@end
