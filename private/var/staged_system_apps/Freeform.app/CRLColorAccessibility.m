@implementation CRLColorAccessibility

- (UIColor)crlaxUIColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "UIColor"));

  return (UIColor *)v3;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLColor");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLColorAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)_crlaxCachedApproximateColorDescription
{
  return __CRLAccessibilityGetAssociatedObject(self, &unk_1014157B1);
}

- (void)_crlaxSetCachedApproximateColorDescription:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_1014157B1, a3);
}

- (double)crlaxHue
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "hueComponent");
  v4 = v3;

  return v4;
}

- (double)crlaxSaturation
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v2, "saturationComponent");
  v4 = v3;

  return v4;
}

- (double)crlaxLuminance
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
  v4[2] = sub_1003C72F0;
  v4[3] = &unk_10122C6A0;
  v4[4] = self;
  v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSString)crlaxApproximateColorDescription
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility _crlaxCachedApproximateColorDescription](self, "_crlaxCachedApproximateColorDescription"));
  if (!v3)
  {
    -[CRLColorAccessibility crlaxHue](self, "crlaxHue");
    v5 = v4;
    -[CRLColorAccessibility crlaxSaturation](self, "crlaxSaturation");
    v7 = v6;
    -[CRLColorAccessibility crlaxLuminance](self, "crlaxLuminance");
    v9 = v8;
    if (v8 > 0.99000001)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("White");
LABEL_6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, 0, 0));
LABEL_16:

      -[CRLColorAccessibility _crlaxSetCachedApproximateColorDescription:](self, "_crlaxSetCachedApproximateColorDescription:", v3);
      return (NSString *)v3;
    }
    if (v8 < 0.00999999978)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Black");
      goto LABEL_6;
    }
    if (v7 >= 0.0500000007)
    {
      v17 = objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxLightnessModifier](self, "crlaxLightnessModifier"));
      v11 = (void *)v17;
      if (v5 > 0.0560000017 && v5 < 0.111000001 && v9 < 0.430000007)
      {
        v22[0] = v17;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxSaturationModifier](self, "crlaxSaturationModifier"));
        v22[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Brown"), 0, 0));
        v22[2] = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 3));
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility _crlaxColorDescriptionForAttributes:](self, "_crlaxColorDescriptionForAttributes:", v19));

LABEL_15:
        goto LABEL_16;
      }
      v21[0] = v17;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxSaturationModifier](self, "crlaxSaturationModifier"));
      v21[1] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxHueName](self, "crlaxHueName"));
      v21[2] = v14;
      v15 = v21;
      v16 = 3;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxLightnessModifier](self, "crlaxLightnessModifier"));
      v23[0] = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Gray"), 0, 0));
      v23[1] = v14;
      v15 = v23;
      v16 = 2;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, v16));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility _crlaxColorDescriptionForAttributes:](self, "_crlaxColorDescriptionForAttributes:", v18));
    goto LABEL_15;
  }
  return (NSString *)v3;
}

- (NSString)crlaxApproximateColorDescriptionWithOpacity
{
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = objc_msgSend(v3, "isClear");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Clear"), 0, 0));
LABEL_5:

    v5 = (void *)v6;
    return (NSString *)v5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
  v8 = objc_msgSend(v7, "isOpaque");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxApproximateColorDescription](self, "crlaxApproximateColorDescription"));
  if ((v8 & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxTarget](self, "crlaxTarget"));
    objc_msgSend(v9, "alphaComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColorAccessibility crlaxOpacityDescriptionStringForAlphaComponent:](CRLColorAccessibility, "crlaxOpacityDescriptionStringForAlphaComponent:"));
    v17 = __CRLAccessibilityStringForVariables(1, v5, v11, v12, v13, v14, v15, v16, (uint64_t)v10);
    v6 = objc_claimAutoreleasedReturnValue(v17);

    goto LABEL_5;
  }
  return (NSString *)v5;
}

- (NSString)crlaxHueName
{
  double v3;
  void *v4;
  void *v5;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = v4;
  -[CRLColorAccessibility crlaxHue](self, "crlaxHue", v3);
  return (NSString *)_objc_msgSend(v5, "crlaxHueNameForValue:");
}

- (NSString)crlaxLightnessModifier
{
  double v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  -[CRLColorAccessibility crlaxLuminance](self, "crlaxLuminance");
  if (v2 >= 0.349999994)
  {
    if (v2 <= 0.850000024)
    {
      v6 = &stru_1012A72B0;
      return (NSString *)v6;
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("light");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = v3;
    v5 = CFSTR("dark");
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return (NSString *)v6;
}

- (NSString)crlaxSaturationModifier
{
  double v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  double v7;
  __CFString *v8;

  -[CRLColorAccessibility crlaxSaturation](self, "crlaxSaturation");
  if (v3 >= 0.200000003)
  {
    if (v3 <= 0.899999976 || (-[CRLColorAccessibility crlaxLuminance](self, "crlaxLuminance"), v7 <= 0.699999988))
    {
      v8 = &stru_1012A72B0;
      return (NSString *)v8;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("vibrant");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("grayish");
  }
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return (NSString *)v8;
}

+ (id)crlaxHueNameForValue:(double)a3
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;

  if (a3 < 0.0 || a3 > 1.0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Hue value should be in range [0..1f], got %f"), v6, v7, v8, v9, v10, *(uint64_t *)&a3))abort();
    }
    v11 = 0;
  }
  else
  {
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
                                  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                                  v13 = v12;
                                  if (a3 >= 0.986000001)
                                    v14 = CFSTR("red");
                                  else
                                    v14 = CFSTR("pink red");
                                }
                                else
                                {
                                  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                                  v13 = v12;
                                  v14 = CFSTR("pink");
                                }
                              }
                              else
                              {
                                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                                v13 = v12;
                                v14 = CFSTR("magenta pink");
                              }
                            }
                            else
                            {
                              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                              v13 = v12;
                              v14 = CFSTR("magenta");
                            }
                          }
                          else
                          {
                            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                            v13 = v12;
                            v14 = CFSTR("purple");
                          }
                        }
                        else
                        {
                          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                          v13 = v12;
                          v14 = CFSTR("blue");
                        }
                      }
                      else
                      {
                        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                        v13 = v12;
                        v14 = CFSTR("cyan blue");
                      }
                    }
                    else
                    {
                      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                      v13 = v12;
                      v14 = CFSTR("cyan");
                    }
                  }
                  else
                  {
                    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                    v13 = v12;
                    v14 = CFSTR("blue green");
                  }
                }
                else
                {
                  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                  v13 = v12;
                  v14 = CFSTR("green");
                }
              }
              else
              {
                v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v13 = v12;
                v14 = CFSTR("yellow green");
              }
            }
            else
            {
              v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v13 = v12;
              v14 = CFSTR("yellow");
            }
          }
          else
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v13 = v12;
            v14 = CFSTR("yellow orange");
          }
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v13 = v12;
          v14 = CFSTR("orange");
        }
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("red orange");
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v13 = v12;
      v14 = CFSTR("red");
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, 0, 0));

  }
  return v11;
}

+ (id)crlaxOpacityDescriptionStringForAlphaComponent:(double)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%d percent opaque"), 0, 0));

  v6 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, (int)sub_1003C65A0(a3 * 100.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (NSString)crlaxStyleInfoDescription
{
  double v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  -[CRLColorAccessibility crlaxLuminance](self, "crlaxLuminance");
  v4 = vcvtad_u64_f64(v3 * 100.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLColorAccessibility crlaxApproximateColorDescription](self, "crlaxApproximateColorDescription"));
  v6 = CRLAccessibilityLocalizedUnsignedInteger(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v5, v7));

  return (NSString *)v8;
}

- (id)_crlaxColorDescriptionForAttributes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        if (objc_msgSend(v4, "length"))
        {
          if (objc_msgSend(v10, "length"))
            objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v10);
        }
        else
        {
          objc_msgSend(v4, "appendString:", v10);
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));
  return v11;
}

@end
