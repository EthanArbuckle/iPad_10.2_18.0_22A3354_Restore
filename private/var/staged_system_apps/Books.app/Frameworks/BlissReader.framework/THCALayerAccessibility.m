@implementation THCALayerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("CALayer");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (void)tsaxAddSafeCategoryDependenciesToCollection:(id)a3
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___THCALayerAccessibility;
  objc_msgSendSuper2(&v4, "tsaxAddSafeCategoryDependenciesToCollection:");
  objc_msgSend(a3, "addObject:", CFSTR("THCALayerAccessibility"));
}

- (THCachedAnnotationAccessibility)thaxAssociatedAnnotation
{
  return (THCachedAnnotationAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543A3D);
}

- (void)thaxSetAssociatedAnnotation:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A3D, a3);
}

- (CGRect)_axMarginNoteBoundsInCanvasView
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  THCachedAnnotationAccessibility *v7;
  THCachedAnnotationAccessibility *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CGSize size;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinY;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[9];
  uint64_t v28;
  CGRect *v29;
  uint64_t v30;
  const char *v31;
  CGPoint origin;
  CGSize v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v7 = -[THCALayerAccessibility thaxAssociatedAnnotation](self, "thaxAssociatedAnnotation");
  if (v7)
  {
    v8 = v7;
    v9 = -[THCachedAnnotationAccessibility thaxParentHighlightController](v7, "thaxParentHighlightController");
    v10 = objc_msgSend(v9, "tsaxValueForKey:", CFSTR("parentRep"));
    v11 = objc_msgSend(objc_msgSend(v10, "tsaxValueForKey:", CFSTR("canvas")), "tsaxValueForKey:", CFSTR("canvasController"));
    v12 = objc_msgSend(objc_msgSend(v11, "tsaxValueForKey:", CFSTR("canvasView")), "tsaxValueForKey:", CFSTR("layer"));
    if (v12)
    {
      v13 = v12;
      v28 = 0;
      v29 = (CGRect *)&v28;
      v30 = 0x4010000000;
      v31 = "";
      size = CGRectZero.size;
      origin = CGRectZero.origin;
      v33 = size;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_26D030;
      v27[3] = &unk_43C8F0;
      v27[7] = v11;
      v27[8] = &v28;
      v27[4] = v9;
      v27[5] = v8;
      v27[6] = v10;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v27))
        abort();
      -[THCALayerAccessibility bounds](self, "bounds");
      -[THCALayerAccessibility convertRect:toLayer:](self, "convertRect:toLayer:", v13);
      x = v15;
      y = v16;
      width = v17;
      height = v18;
      MinY = CGRectGetMinY(v29[1]);
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      if (MinY < CGRectGetMinY(v34))
      {
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = width;
        v35.size.height = height;
        v20 = CGRectGetMinY(v35);
        if (v20 < CGRectGetMaxY(v29[1]))
          y = CGRectGetMinY(v29[1]);
      }
      v36.origin.x = x;
      v36.origin.y = y;
      v36.size.width = width;
      v36.size.height = height;
      MaxY = CGRectGetMaxY(v36);
      if (MaxY < CGRectGetMaxY(v29[1]))
      {
        v22 = CGRectGetMaxY(v29[1]);
        v37.origin.x = x;
        v37.origin.y = y;
        v37.size.width = width;
        v37.size.height = height;
        height = height + v22 - CGRectGetMaxY(v37);
      }
      _Block_object_dispose(&v28, 8);
    }
  }
  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)accessibilityFrame
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGRect v12;
  CGRect result;

  -[THCALayerAccessibility _axMarginNoteBoundsInCanvasView](self, "_axMarginNoteBoundsInCanvasView");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsEmpty(v12))
  {
    v11.receiver = self;
    v11.super_class = (Class)THCALayerAccessibility;
    -[THCALayerAccessibility accessibilityFrame](&v11, "accessibilityFrame");
  }
  else
  {
    objc_msgSend(-[THCALayerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("accessibilityContainer")), "tsaxFrameFromBounds:", x, y, width, height);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  double MidY;
  double v8;
  objc_super v9;
  CGPoint result;
  CGRect v11;
  CGRect v12;

  v9.receiver = self;
  v9.super_class = (Class)THCALayerAccessibility;
  -[THCALayerAccessibility accessibilityFrame](&v9, "accessibilityFrame");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MidX = CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MidY = CGRectGetMidY(v12);
  v8 = MidX;
  result.y = MidY;
  result.x = v8;
  return result;
}

- (id)_axParentRep
{
  return objc_msgSend(-[THCachedAnnotationAccessibility tsaxValueForKey:](-[THCALayerAccessibility thaxAssociatedAnnotation](self, "thaxAssociatedAnnotation"), "tsaxValueForKey:", CFSTR("thaxParentHighlightController")), "tsaxValueForKey:", CFSTR("parentRep"));
}

- (id)_accessibilityContainingParentForOrdering
{
  id result;
  objc_super v4;

  result = objc_msgSend(-[THCALayerAccessibility _axParentRep](self, "_axParentRep"), "tsaxValueForKey:", CFSTR("thaxTextAndMarginNotesLayersContainer"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THCALayerAccessibility;
    return -[THCALayerAccessibility _accessibilityContainingParentForOrdering](&v4, "_accessibilityContainingParentForOrdering");
  }
  return result;
}

- (id)_accessibilityTouchContainer
{
  id result;
  objc_super v4;

  result = objc_msgSend(-[THCALayerAccessibility _axParentRep](self, "_axParentRep"), "tsaxValueForKey:", CFSTR("thaxMarginNotesLayersTouchContainer"));
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THCALayerAccessibility;
    return -[THCALayerAccessibility _accessibilityTouchContainer](&v4, "_accessibilityTouchContainer");
  }
  return result;
}

@end
