@implementation TSDKnobAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDKnob");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (Class)tsaxKnobTrackerClass
{
  return (Class)objc_opt_class(TSDResizeKnobTrackerAccessibility, a2);
}

- (NSString)tsaxLabel
{
  const __CFString *v3;
  TSDRepAccessibility *v4;
  const __CFString *v5;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;

  v3 = CFSTR("knob.sizing.upperleft");
  switch(-[TSDKnobAccessibility tsaxKnobTag](self, "tsaxKnobTag"))
  {
    case 1uLL:
      goto LABEL_11;
    case 2uLL:
      v3 = CFSTR("knob.sizing.uppermiddle");
      goto LABEL_11;
    case 3uLL:
      v3 = CFSTR("knob.sizing.upperright");
      goto LABEL_11;
    case 4uLL:
      v3 = CFSTR("knob.sizing.middleleft");
      goto LABEL_11;
    case 5uLL:
      v3 = CFSTR("knob.sizing.middlemiddle");
      goto LABEL_11;
    case 6uLL:
      v3 = CFSTR("knob.sizing.middleright");
      goto LABEL_11;
    case 7uLL:
      v3 = CFSTR("knob.sizing.lowerleft");
      goto LABEL_11;
    case 8uLL:
      v3 = CFSTR("knob.sizing.lowermiddle");
      goto LABEL_11;
    case 9uLL:
      v3 = CFSTR("knob.sizing.lowerright");
      goto LABEL_11;
    case 0xCuLL:
      return TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.shape.control"));
    default:
      v3 = CFSTR("knob.control");
LABEL_11:
      v4 = -[TSDKnobAccessibility tsaxParentRepForKnob](self, "tsaxParentRepForKnob");
      v5 = -[TSDRepAccessibility tsaxKnobLabel](v4, "tsaxKnobLabel");
      if (TSAccessibilityShouldPerformValidationChecks())
      {
        if (!v5)
        {
          ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
          if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("No handle label for: %@"), v7, v8, v9, v10, v11, (uint64_t)v4))abort();
        }
      }
      if (v5)
        v12 = v5;
      else
        v12 = &stru_43D7D8;
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)v3), v12);
  }
}

- (NSString)tsaxValue
{
  return (NSString *)objc_msgSend(-[TSDKnobAccessibility tsaxCreateKnobTracker](self, "tsaxCreateKnobTracker"), "tsaxHUDDisplayString");
}

- (CALayer)tsaxLayer
{
  objc_class *v3;
  CALayer *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(CALayer);
  result = (CALayer *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDKnobAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layer")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (unint64_t)tsaxKnobTag
{
  return (unint64_t)-[TSDKnobAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("tag"));
}

- (TSDRepAccessibility)tsaxParentRepForKnob
{
  void *v3;
  TSDRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDRepAccessibility);
  result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDKnobAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (CGPoint)tsaxPosition
{
  double v2;
  double v3;
  CGPoint result;

  -[TSDKnobAccessibility tsaxCGPointValueForKey:](self, "tsaxCGPointValueForKey:", CFSTR("position"));
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)tsaxFrame
{
  CGFloat y;
  CGFloat x;
  TSDRepAccessibility *v5;
  TSDRepAccessibility *v6;
  TSDCanvasViewAccessibility *v7;
  CALayer *v8;
  CALayer *v9;
  CALayer *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double width;
  double height;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  v5 = -[TSDKnobAccessibility tsaxParentRepForKnob](self, "tsaxParentRepForKnob");
  if (v5)
  {
    v6 = v5;
    v7 = -[TSDRepAccessibility tsaxCanvasView](v5, "tsaxCanvasView");
    v8 = -[TSDKnobAccessibility tsaxLayer](self, "tsaxLayer");
    if (v8)
    {
      v9 = v8;
      v10 = -[TSDCanvasViewAccessibility tsaxCanvasLayer](v7, "tsaxCanvasLayer");
      -[CALayer bounds](v9, "bounds");
      -[CALayer convertRect:toLayer:](v9, "convertRect:toLayer:", v10);
    }
    else
    {
      objc_msgSend(-[TSDKnobAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("knobImage")), "tsaxCGSizeValueForKey:", CFSTR("size"));
      v18 = v17;
      v20 = v19;
      -[TSDKnobAccessibility tsaxPosition](self, "tsaxPosition");
      v22 = v21;
      v24 = v23;
      v30.origin.x = CGRectZero.origin.x;
      v30.origin.y = y;
      v30.size.width = v18;
      v30.size.height = v20;
      v25 = v22 - CGRectGetWidth(v30) * 0.5;
      v31.origin.x = CGRectZero.origin.x;
      v31.origin.y = y;
      v31.size.width = v18;
      v31.size.height = v20;
      -[TSDRepAccessibility tsaxConvertNaturalPointToUnscaledCanvas:](v6, "tsaxConvertNaturalPointToUnscaledCanvas:", v25, v24 - CGRectGetHeight(v31) * 0.5);
      v32.size.width = v18;
      v32.size.height = v20;
      *(CGRect *)&v11 = CGRectInset(v32, -5.0, -5.0);
    }
    -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](v7, "tsaxFrameFromBounds:", v11, v12, v13, v14);
    x = v26;
    y = v27;
  }
  else
  {
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v28 = x;
  v29 = y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)tsaxCreateKnobTracker
{
  id v3;

  v3 = objc_msgSend((id)objc_opt_class(self), "tsaxKnobTrackerClass");
  return objc_msgSend(v3, "tsaxKnobTrackerWithRep:knob:", -[TSDKnobAccessibility tsaxParentRepForKnob](self, "tsaxParentRepForKnob"), self);
}

- (BOOL)tsaxIsAdjustable
{
  return (char *)-[TSDKnobAccessibility tsaxKnobTag](self, "tsaxKnobTag") - 1 < (_BYTE *)&dword_8 + 1;
}

- (CGPoint)tsaxCalculatedNextPositionInRepForAdjustable:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double y;
  unint64_t v12;
  double x;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  v3 = a3;
  -[TSDKnobAccessibility tsaxPosition](self, "tsaxPosition");
  v6 = v5;
  v8 = v7;
  v9 = -[TSDKnobAccessibility tsaxKnobTag](self, "tsaxKnobTag");
  v10 = v9;
  y = CGPointZero.y;
  v12 = v9 - 7;
  if (v9 > 7 || (x = -1.0, ((1 << v9) & 0x92) == 0))
  {
    x = CGPointZero.x;
    if (v9 <= 9 && ((1 << v9) & 0x248) != 0)
      x = 1.0;
  }
  objc_msgSend(-[TSDKnobAccessibility tsaxCreateKnobTracker](self, "tsaxCreateKnobTracker"), "tsaxCurrentBoundsForStandardKnobs");
  v16 = v15 / v14 * 10.0;
  if (v14 <= 0.0)
    v16 = 10.0;
  v17 = 1.0;
  if (v12 >= 3)
    v18 = y;
  else
    v18 = 1.0;
  if (v10 - 1 < 3)
    v18 = -1.0;
  if (!v3)
    v17 = -1.0;
  v19 = v6 + v17 * x * 10.0;
  v20 = v8 + v17 * v18 * v16;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)tsaxAllowsHUDWhileResizing
{
  return 0;
}

@end
