@implementation TSKRulerUnitsAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSKRulerUnits");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (double)tsaxConvertPointsToRulerUnits:(double)a3
{
  double v3;
  _QWORD v5[7];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22F304;
  v5[3] = &unk_428E60;
  v5[4] = self;
  v5[5] = &v6;
  *(double *)&v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)tsaxLocalizedCompatibleRulerUnitsForCanvas
{
  unsigned int v2;

  v2 = -[TSKRulerUnitsAccessibility tsaxRulerUnits](self, "tsaxRulerUnits");
  if (v2 > 4)
    return (NSString *)&stru_43D7D8;
  else
    return TSAccessibilityLocalizedString((uint64_t)off_43BA10[v2]);
}

- (int)tsaxRulerUnits
{
  return objc_msgSend(-[TSKRulerUnitsAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("rulerUnits")), "longLongValue");
}

@end
