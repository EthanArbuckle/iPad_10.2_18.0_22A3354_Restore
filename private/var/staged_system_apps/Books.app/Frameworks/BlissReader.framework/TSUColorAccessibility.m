@implementation TSUColorAccessibility

- (id)tsaxUIColor
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIColor);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSUColorAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("UIColor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

+ (id)tsaxTargetClassName
{
  return CFSTR("TSUColor");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_tsaxCachedApproximateColorDescription
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_54399B);
}

- (void)_tsaxSetCachedApproximateColorDescription:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54399B, a3);
}

- (double)tsaxHue
{
  double result;

  -[TSUColorAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("hueComponent"));
  return result;
}

- (double)tsaxSaturation
{
  double result;

  -[TSUColorAccessibility tsaxCGFloatValueForKey:](self, "tsaxCGFloatValueForKey:", CFSTR("saturationComponent"));
  return result;
}

- (double)tsaxLuminance
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_241790;
  v4[3] = &unk_427768;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)tsaxApproximateColorDescription
{
  NSString *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  NSString *v11;
  _QWORD *v12;
  uint64_t v13;
  NSString *v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[2];

  v3 = -[TSUColorAccessibility _tsaxCachedApproximateColorDescription](self, "_tsaxCachedApproximateColorDescription");
  if (!v3)
  {
    -[TSUColorAccessibility tsaxHue](self, "tsaxHue");
    v5 = v4;
    -[TSUColorAccessibility tsaxSaturation](self, "tsaxSaturation");
    v7 = v6;
    -[TSUColorAccessibility tsaxLuminance](self, "tsaxLuminance");
    v9 = v8;
    if (v8 <= 0.99000001)
    {
      if (v8 >= 0.00999999978)
      {
        if (v7 >= 0.0500000007)
        {
          v14 = -[TSUColorAccessibility tsaxLightnessModifier](self, "tsaxLightnessModifier");
          if (v5 <= 0.0560000017 || v5 >= 0.111000001 || v9 >= 0.430000007)
          {
            v16[0] = v14;
            v16[1] = -[TSUColorAccessibility tsaxSaturationModifier](self, "tsaxSaturationModifier");
            v16[2] = -[TSUColorAccessibility tsaxHueName](self, "tsaxHueName");
            v12 = v16;
          }
          else
          {
            v17[0] = v14;
            v17[1] = -[TSUColorAccessibility tsaxSaturationModifier](self, "tsaxSaturationModifier");
            v17[2] = TSAccessibilityLocalizedString((uint64_t)CFSTR("color.brown"));
            v12 = v17;
          }
          v13 = 3;
        }
        else
        {
          v18[0] = -[TSUColorAccessibility tsaxLightnessModifier](self, "tsaxLightnessModifier");
          v18[1] = TSAccessibilityLocalizedString((uint64_t)CFSTR("color.gray"));
          v12 = v18;
          v13 = 2;
        }
        v11 = -[TSUColorAccessibility _tsaxColorDescriptionForAttributes:](self, "_tsaxColorDescriptionForAttributes:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, v13));
        goto LABEL_16;
      }
      v10 = CFSTR("color.black");
    }
    else
    {
      v10 = CFSTR("color.white");
    }
    v11 = TSAccessibilityLocalizedString((uint64_t)v10);
LABEL_16:
    v3 = v11;
    -[TSUColorAccessibility _tsaxSetCachedApproximateColorDescription:](self, "_tsaxSetCachedApproximateColorDescription:", v11);
  }
  return v3;
}

- (NSString)tsaxHueName
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  -[TSUColorAccessibility tsaxHue](self, "tsaxHue");
  return (NSString *)objc_msgSend(v3, "tsaxHueNameForValue:");
}

- (NSString)tsaxLightnessModifier
{
  double v2;

  -[TSUColorAccessibility tsaxLuminance](self, "tsaxLuminance");
  if (v2 < 0.349999994)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("color.lightness.low"));
  if (v2 <= 0.850000024)
    return (NSString *)&stru_43D7D8;
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("color.lightness.high"));
}

- (NSString)tsaxSaturationModifier
{
  double v3;
  const __CFString *v4;
  double v5;

  -[TSUColorAccessibility tsaxSaturation](self, "tsaxSaturation");
  if (v3 < 0.200000003)
  {
    v4 = CFSTR("color.saturation.low");
    return TSAccessibilityLocalizedString((uint64_t)v4);
  }
  if (v3 > 0.899999976)
  {
    -[TSUColorAccessibility tsaxLuminance](self, "tsaxLuminance");
    if (v5 > 0.699999988)
    {
      v4 = CFSTR("color.saturation.high");
      return TSAccessibilityLocalizedString((uint64_t)v4);
    }
  }
  return (NSString *)&stru_43D7D8;
}

+ (id)tsaxHueNameForValue:(double)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v12;

  if (a3 < 0.0 || a3 > 1.0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Hue value should be in range [0..1f], got %f"), v6, v7, v8, v9, v10, *(uint64_t *)&a3))abort();
    }
    return 0;
  }
  else
  {
    v12 = CFSTR("color.hue.red");
    if (a3 >= 0.0280000009)
    {
      if (a3 >= 0.0560000017)
      {
        if (a3 >= 0.111000001)
        {
          if (a3 >= 0.128999993)
          {
            if (a3 >= 0.166999996)
            {
              if (a3 >= 0.222000003)
              {
                if (a3 >= 0.388999999)
                {
                  if (a3 >= 0.469000012)
                  {
                    if (a3 >= 0.540000021)
                    {
                      if (a3 >= 0.611000001)
                      {
                        if (a3 >= 0.666999996)
                        {
                          if (a3 >= 0.800000012)
                          {
                            if (a3 >= 0.888999999)
                            {
                              if (a3 >= 0.916999996)
                              {
                                if (a3 >= 0.958000004)
                                {
                                  if (a3 < 0.986000001)
                                    v12 = CFSTR("color.hue.pink.red");
                                }
                                else
                                {
                                  v12 = CFSTR("color.hue.pink");
                                }
                              }
                              else
                              {
                                v12 = CFSTR("color.hue.magenta.pink");
                              }
                            }
                            else
                            {
                              v12 = CFSTR("color.hue.magenta");
                            }
                          }
                          else
                          {
                            v12 = CFSTR("color.hue.blue.magenta");
                          }
                        }
                        else
                        {
                          v12 = CFSTR("color.hue.blue");
                        }
                      }
                      else
                      {
                        v12 = CFSTR("color.hue.cyan.blue");
                      }
                    }
                    else
                    {
                      v12 = CFSTR("color.hue.cyan");
                    }
                  }
                  else
                  {
                    v12 = CFSTR("color.hue.green.cyan");
                  }
                }
                else
                {
                  v12 = CFSTR("color.hue.green");
                }
              }
              else
              {
                v12 = CFSTR("color.hue.yellow.green");
              }
            }
            else
            {
              v12 = CFSTR("color.hue.yellow");
            }
          }
          else
          {
            v12 = CFSTR("color.hue.orange.yellow");
          }
        }
        else
        {
          v12 = CFSTR("color.hue.orange");
        }
      }
      else
      {
        v12 = CFSTR("color.hue.red.orange");
      }
    }
    return TSAccessibilityLocalizedString((uint64_t)v12);
  }
}

- (NSString)tsaxStyleInfoDescription
{
  double v3;

  -[TSUColorAccessibility tsaxLuminance](self, "tsaxLuminance");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[TSUColorAccessibility tsaxApproximateColorDescription](self, "tsaxApproximateColorDescription"), TSAccessibilityLocalizedUnsignedInteger(vcvtad_u64_f64(v3 * 100.0)));
}

- (id)_tsaxColorDescriptionForAttributes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = +[NSMutableString string](NSMutableString, "string");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v4, "length"))
        {
          if (objc_msgSend(v9, "length"))
            objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v9);
        }
        else
        {
          objc_msgSend(v4, "appendString:", v9);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return +[NSString stringWithString:](NSString, "stringWithString:", v4);
}

@end
