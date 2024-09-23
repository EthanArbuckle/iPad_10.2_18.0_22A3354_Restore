@implementation CRLRulerUnitsAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLRulerUnits");
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
  objc_opt_class(CRLRulerUnitsAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

+ (unint64_t)crlaxMeasurementUnitsForCurrentLocale
{
  void *v2;
  void *v3;
  unsigned int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", NSLocaleUsesMetricSystem));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (double)crlaxConvertPoints:(double)a3 toMeasurementUnits:(unint64_t)a4
{
  uint64_t *v5;
  double v6;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a4 == 1)
  {
    v5 = &qword_100EEC6A0;
    goto LABEL_5;
  }
  if (!a4)
  {
    v5 = &qword_100EEC698;
LABEL_5:
    v6 = *(double *)v5;
    return a3 / v6;
  }
  v6 = 1.0;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Measurement units must be CRLRulerUnitTypeCentimeters or CRLRulerUnitTypeInches."), v9, v10, v11, v12, v13, v14))abort();
  }
  return a3 / v6;
}

+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("inches");
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("centimeters");
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("points");
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("picas");
      goto LABEL_7;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("pixels");
LABEL_7:
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

      break;
    default:
      if (CRLAccessibilityShouldPerformValidationChecks())
      {
        ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
        if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unknown CRLRulerUnitType"), v9, v10, v11, v12, v13, v14))abort();
      }
      v6 = 0;
      break;
  }
  return v6;
}

+ (id)crlaxLocalizedDescriptionForUnits:(unint64_t)a3 value:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  if (a3 >= 5)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unknown CRLRulerUnitType"), v9, v10, v11, v12, v13, v15))abort();
    }
    v6 = 0;
    goto LABEL_7;
  }
  v5 = CRLAccessibilityStringsDictKey(*(&off_10123F308 + a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, *(_QWORD *)&a4));
LABEL_8:

  return v7;
}

- (double)crlaxConvertPointsToRulerUnits:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRulerUnitsAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v4, "convertPointsToRulerUnits:", a3);
  v6 = v5;

  return v6;
}

- (NSString)crlaxLocalizedCompatibleRulerUnitsForCanvas
{
  double v3;
  id v4;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  return (NSString *)_objc_msgSend(v4, "crlaxLocalizedDescriptionForUnits:", -[CRLRulerUnitsAccessibility crlaxRulerUnits](self, "crlaxRulerUnits", v3));
}

- (unint64_t)crlaxRulerUnits
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRulerUnitsAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "rulerUnits");

  return (unint64_t)v3;
}

@end
