@implementation TSDKnobAccessibilityElement

- (BOOL)isAccessibilityElement
{
  BOOL result;
  unint64_t v4;
  float v5;

  if (-[TSDInteractiveCanvasControllerAccessibility tsaxInPrintPreviewMode](-[TSDRepAccessibility tsaxInteractiveCanvasController](-[TSDKnobAccessibilityElement parentRep](self, "parentRep"), "tsaxInteractiveCanvasController"), "tsaxInPrintPreviewMode"))
  {
    return 0;
  }
  v4 = -[TSDKnobAccessibilityElement knobTag](self, "knobTag");
  result = 0;
  if (v4 <= 0xC && ((1 << v4) & 0x13DE) != 0)
  {
    -[CALayer opacity](-[TSDKnobAccessibility tsaxLayer](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxLayer"), "opacity");
    return v5 > 0.00000011921;
  }
  return result;
}

- (id)accessibilityLabel
{
  return -[TSDKnobAccessibility tsaxLabel](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxLabel");
}

- (id)accessibilityHint
{
  if (-[TSDKnobAccessibility tsaxIsAdjustable](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxIsAdjustable"))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("knob.sizing.hint.ios"));
  else
    return 0;
}

- (id)accessibilityValue
{
  return -[TSDKnobAccessibility tsaxValue](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxValue");
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v3;
  UIAccessibilityTraits *v4;

  v3 = UIAccessibilityTraitNone;
  if (-[TSDRepAccessibility tsaxIsLocked](-[TSDKnobAccessibilityElement parentRep](self, "parentRep"), "tsaxIsLocked"))
  {
    v4 = &UIAccessibilityTraitNotEnabled;
LABEL_5:
    v3 |= *v4;
    return v3;
  }
  if (-[TSDKnobAccessibility tsaxIsAdjustable](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxIsAdjustable"))
  {
    v4 = &UIAccessibilityTraitAdjustable;
    goto LABEL_5;
  }
  return v3;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDKnobAccessibility tsaxFrame](-[TSDKnobAccessibilityElement knob](self, "knob"), "tsaxFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return 1;
}

- (void)accessibilityIncrement
{
  TSDKnobAccessibility *v3;

  v3 = -[TSDKnobAccessibilityElement knob](self, "knob");
  -[TSDKnobAccessibility tsaxCalculatedNextPositionInRepForAdjustable:](v3, "tsaxCalculatedNextPositionInRepForAdjustable:", 1);
  -[TSDKnobAccessibility tsaxMoveKnobToRepPositionInNaturalSpace:](v3, "tsaxMoveKnobToRepPositionInNaturalSpace:");
  TSAccessibilityPostLayoutChangedNotification(self);
}

- (void)accessibilityDecrement
{
  TSDKnobAccessibility *v3;

  v3 = -[TSDKnobAccessibilityElement knob](self, "knob");
  -[TSDKnobAccessibility tsaxCalculatedNextPositionInRepForAdjustable:](v3, "tsaxCalculatedNextPositionInRepForAdjustable:", 0);
  -[TSDKnobAccessibility tsaxMoveKnobToRepPositionInNaturalSpace:](v3, "tsaxMoveKnobToRepPositionInNaturalSpace:");
  TSAccessibilityPostLayoutChangedNotification(self);
}

- (TSDKnobAccessibilityElement)initWithKnobTag:(unint64_t)a3 parentRep:(id)a4
{
  TSDKnobAccessibilityElement *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDKnobAccessibilityElement;
  result = -[TSAccessibilityElement initWithAccessibilityParent:](&v7, "initWithAccessibilityParent:", a4);
  if (result)
  {
    result->_parentRep = (TSDRepAccessibility *)a4;
    result->_knobTag = a3;
  }
  return result;
}

- (TSDKnobAccessibilityElement)initWithAccessibilityParent:(id)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Use designated initializer!"), v5, v6, v7, v8, v9, v11))abort();
  }
  return -[TSDKnobAccessibilityElement initWithKnobTag:parentRep:](self, "initWithKnobTag:parentRep:", 0, 0);
}

- (BOOL)isEqualToKnob:(id)a3
{
  id v4;

  v4 = -[TSDKnobAccessibilityElement knobTag](self, "knobTag");
  return v4 == objc_msgSend(a3, "tsaxKnobTag");
}

- (TSDKnobAccessibility)knob
{
  return (TSDKnobAccessibility *)-[TSDRepAccessibility tsaxKnobForTag:](self->_parentRep, "tsaxKnobForTag:", self->_knobTag);
}

- (TSDRepAccessibility)parentRep
{
  return self->_parentRep;
}

- (void)setParentRep:(id)a3
{
  self->_parentRep = (TSDRepAccessibility *)a3;
}

- (unint64_t)knobTag
{
  return self->_knobTag;
}

- (void)setKnobTag:(unint64_t)a3
{
  self->_knobTag = a3;
}

@end
