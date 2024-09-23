@implementation THWDetailSliderAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWDetailSlider");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THUISliderAccessibility, a2);
}

- (float)thaxDuration
{
  double v2;

  -[THWDetailSliderAccessibility tsaxDoubleValueForKey:](self, "tsaxDoubleValueForKey:", CFSTR("availableDuration"));
  return v2;
}

- (id)accessibilityValue
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWDetailSliderAccessibility;
  return -[THUISliderAccessibility accessibilityValue](&v3, "accessibilityValue");
}

- (void)accessibilityIncrement
{
  float v3;
  float v4;
  float v5;
  double v6;

  -[THUISliderAccessibility thaxValue](self, "thaxValue");
  v4 = v3;
  -[THWDetailSliderAccessibility _thaxStepValue](self, "_thaxStepValue");
  *(float *)&v6 = v4 + v5;
  -[THWDetailSliderAccessibility _thaxUpdateValuePercent:](self, "_thaxUpdateValuePercent:", v6);
}

- (void)accessibilityDecrement
{
  float v3;
  float v4;
  float v5;
  double v6;

  -[THUISliderAccessibility thaxValue](self, "thaxValue");
  v4 = v3;
  -[THWDetailSliderAccessibility _thaxStepValue](self, "_thaxStepValue");
  *(float *)&v6 = v4 - v5;
  -[THWDetailSliderAccessibility _thaxUpdateValuePercent:](self, "_thaxUpdateValuePercent:", v6);
}

- (void)_thaxUpdateValuePercent:(float)a3
{
  float v5;
  float v6;
  _QWORD v7[5];
  float v8;

  -[THUISliderAccessibility thaxMaximumValue](self, "thaxMaximumValue");
  if (v5 < a3)
    a3 = v5;
  -[THUISliderAccessibility thaxMinimumValue](self, "thaxMinimumValue");
  if (v6 < a3)
    v6 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_25CD40;
  v7[3] = &unk_43C468;
  v7[4] = self;
  v8 = v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
}

- (float)_thaxStepValue
{
  float v3;
  float v4;
  float v5;

  -[THUISliderAccessibility thaxMaximumValue](self, "thaxMaximumValue");
  v4 = v3;
  -[THUISliderAccessibility thaxMinimumValue](self, "thaxMinimumValue");
  return (float)(v4 - v5) * 0.05;
}

@end
