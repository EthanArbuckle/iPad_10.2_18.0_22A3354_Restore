@implementation CRLCalligraphyStrokeAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCalligraphyStroke");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLSmartStrokeAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLCalligraphyStrokeAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (id)crlaxKnownStrokePatternLocalizationStrings
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v8;
  void *v9;

  v2 = (void *)qword_101415770;
  if (!qword_101415770)
  {
    v8 = CFSTR("Calligraphy");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Calligraphy"), 0, 0));
    v9 = v4;
    v5 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    v6 = (void *)qword_101415770;
    qword_101415770 = v5;

    v2 = (void *)qword_101415770;
  }
  return v2;
}

@end
