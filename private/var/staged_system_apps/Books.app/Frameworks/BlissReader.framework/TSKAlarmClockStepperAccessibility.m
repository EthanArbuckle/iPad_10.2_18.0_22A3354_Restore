@implementation TSKAlarmClockStepperAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKAlarmClockStepper");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKAlarmClockStepperAccessibility;
  result = -[TSKAlarmClockStepperAccessibility accessibilityLabel](&v4, "accessibilityLabel");
  if (!result)
    return objc_msgSend(objc_msgSend(-[TSKAlarmClockStepperAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", objc_opt_class(UITableViewCell)), "textLabel"), "text");
  return result;
}

- (id)accessibilityValue
{
  return objc_msgSend(-[TSKAlarmClockStepperAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mValueLabel")), "accessibilityLabel");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitAdjustable;
}

- (void)accessibilityIncrement
{
  -[TSKAlarmClockStepperAccessibility handleUpButtonTouchDownEvent:](self, "handleUpButtonTouchDownEvent:", 0);
  -[TSKAlarmClockStepperAccessibility handleUpButtonTouchUpInsideEvent:](self, "handleUpButtonTouchUpInsideEvent:", 0);
}

- (void)accessibilityDecrement
{
  -[TSKAlarmClockStepperAccessibility handleDownButtonTouchDownEvent:](self, "handleDownButtonTouchDownEvent:", 0);
  -[TSKAlarmClockStepperAccessibility handleDownButtonTouchUpInsideEvent:](self, "handleDownButtonTouchUpInsideEvent:", 0);
}

@end
