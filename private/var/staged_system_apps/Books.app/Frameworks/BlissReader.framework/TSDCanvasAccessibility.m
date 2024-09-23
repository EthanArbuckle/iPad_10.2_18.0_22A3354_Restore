@implementation TSDCanvasAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDCanvas");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDCanvasAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxIsDoingLayout
{
  return -[TSDCanvasAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("mInLayout"));
}

- (NSArray)tsaxTopLevelReps
{
  NSArray *result;
  objc_class *v4;
  char v5;

  if (-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](-[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    return 0;
  }
  v5 = 0;
  v4 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v4, (uint64_t)-[TSDCanvasAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("topLevelReps")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSSet)tsaxAllReps
{
  NSSet *result;
  objc_class *v4;
  char v5;

  if (-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](-[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    return 0;
  }
  v5 = 0;
  v4 = (objc_class *)objc_opt_class(NSSet);
  result = (NSSet *)__TSAccessibilityCastAsClass(v4, (uint64_t)-[TSDCanvasAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("allReps")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxCanvasContainerView
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](-[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvasView");
}

- (CALayer)tsaxCanvasHostingLayer
{
  objc_class *v3;
  CALayer *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(CALayer);
  result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)objc_msgSend(-[TSDCanvasAccessibility tsaxCanvasContainerView](self, "tsaxCanvasContainerView"), "tsaxValueForKey:", CFSTR("layer")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (CGRect)tsaxScreenFrameFromUnscaledCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TSDInteractiveCanvasControllerAccessibility *v7;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  TSDCanvasViewAccessibility *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if (!v7)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Failed to convert unscaled rect to screen rect, this canvas has no ICC."), v9, v10, v11, v12, v13, v19))abort();
    }
  }
  v14 = -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](v7, "tsaxCanvasView");
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:](v7, "tsaxConvertUnscaledToBoundsRect:", x, y, width, height);
  -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](v14, "tsaxFrameFromBounds:");
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)tsaxScreenFrameFromLayerFrameInScaledCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  objc_class *v9;
  uint64_t v10;
  CALayer *v11;
  CALayer *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  char v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[TSDCanvasAccessibility tsaxCanvasContainerView](self, "tsaxCanvasContainerView");
  v21 = 0;
  v9 = (objc_class *)objc_opt_class(CALayer);
  v10 = __TSAccessibilityCastAsClass(v9, (uint64_t)objc_msgSend(v8, "tsaxValueForKey:", CFSTR("layer")), 1, &v21);
  if (v21)
    abort();
  v11 = (CALayer *)v10;
  v12 = -[TSDCanvasAccessibility tsaxCanvasHostingLayer](self, "tsaxCanvasHostingLayer");
  if (v11 != v12)
  {
    -[CALayer convertRect:fromLayer:](v11, "convertRect:fromLayer:", v12, x, y, width, height);
    x = v13;
    y = v14;
    width = v15;
    height = v16;
  }
  objc_msgSend(v8, "tsaxFrameFromBounds:", x, y, width, height);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGPoint)tsaxScreenPointFromUnscaledCanvas:(CGPoint)a3
{
  double y;
  double x;
  TSDInteractiveCanvasControllerAccessibility *v5;
  TSDCanvasViewAccessibility *v6;
  double v7;
  double v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = -[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  v6 = -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](v5, "tsaxCanvasView");
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsPoint:](v5, "tsaxConvertUnscaledToBoundsPoint:", x, y);
  -[TSDCanvasViewAccessibility tsaxFramePointFromBoundsPoint:](v6, "tsaxFramePointFromBoundsPoint:");
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = "";
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_243FFC;
  v11[3] = &unk_43B958;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (double)tsaxViewScale
{
  double result;

  -[TSDCanvasAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("viewScale"));
  return result;
}

- (void)_tsaxInvalidateViewChildrenEventually
{
  -[TSDCanvasViewAccessibility tsaxInvalidateChildrenEventually](-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](-[TSDCanvasAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvasView"), "tsaxInvalidateChildrenEventually");
}

- (void)i_registerRep:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasAccessibility;
  -[TSDCanvasAccessibility i_registerRep:](&v4, "i_registerRep:", a3);
  -[TSDCanvasAccessibility _tsaxInvalidateViewChildrenEventually](self, "_tsaxInvalidateViewChildrenEventually");
}

- (void)i_unregisterRep:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDCanvasAccessibility;
  -[TSDCanvasAccessibility i_unregisterRep:](&v4, "i_unregisterRep:", a3);
  -[TSDCanvasAccessibility _tsaxInvalidateViewChildrenEventually](self, "_tsaxInvalidateViewChildrenEventually");
}

- (BOOL)p_updateRepsFromLayouts
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDCanvasAccessibility;
  v3 = -[TSDCanvasAccessibility p_updateRepsFromLayouts](&v5, "p_updateRepsFromLayouts");
  -[TSDCanvasAccessibility _tsaxInvalidateViewChildrenEventually](self, "_tsaxInvalidateViewChildrenEventually");
  return v3;
}

@end
