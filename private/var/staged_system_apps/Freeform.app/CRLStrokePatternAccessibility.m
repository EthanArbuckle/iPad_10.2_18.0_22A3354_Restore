@implementation CRLStrokePatternAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLStrokePattern");
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
  objc_opt_class(CRLStrokePatternAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)crlaxIsDefaultStroke
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101415948);
}

- (void)crlaxSetDefaultStroke:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101415948, a3);
}

- (NSString)crlaxStyleInfoDescription
{
  return (NSString *)-[CRLStrokePatternAccessibility _crlaxStyleInfoDescription:](self, "_crlaxStyleInfoDescription:", 0);
}

- (NSString)crlaxStyleInfoDescriptionOmittingStroke
{
  return (NSString *)-[CRLStrokePatternAccessibility _crlaxStyleInfoDescription:](self, "_crlaxStyleInfoDescription:", 1);
}

- (id)_crlaxStyleInfoDescription:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  if (-[CRLStrokePatternAccessibility crlaxIsDefaultStroke](self, "crlaxIsDefaultStroke"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = v5;
    if (v3)
      v7 = CFSTR("Default");
    else
      v7 = CFSTR("Default stroke");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, 0, 0));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokePatternAccessibility _crlaxStrokePatternName](self, "_crlaxStrokePatternName"));
    if (!v6)
    {
      v9 = 0;
      goto LABEL_10;
    }
    v8 = objc_claimAutoreleasedReturnValue(-[CRLStrokePatternAccessibility _crlaxLocalizedDescriptionForPattern:omittingStroke:](self, "_crlaxLocalizedDescriptionForPattern:omittingStroke:", v6, v3));
  }
  v9 = (void *)v8;
LABEL_10:

  return v9;
}

- (id)_crlaxStrokePatternName
{
  void *v3;
  unsigned __int8 v4;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned int v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern solidPattern](CRLStrokePattern, "solidPattern"));
  v4 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v3);

  if ((v4 & 1) != 0)
    return CFSTR("solidPattern");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern emptyPattern](CRLStrokePattern, "emptyPattern"));
  v7 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v6);

  if ((v7 & 1) != 0)
    return CFSTR("emptyPattern");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern shortDashPattern](CRLStrokePattern, "shortDashPattern"));
  v9 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v8);

  if ((v9 & 1) != 0)
    return CFSTR("shortDashPattern");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern mediumDashPattern](CRLStrokePattern, "mediumDashPattern"));
  v11 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v10);

  if ((v11 & 1) != 0)
    return CFSTR("mediumDashPattern");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern longDashPattern](CRLStrokePattern, "longDashPattern"));
  v13 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v12);

  if ((v13 & 1) != 0)
    return CFSTR("longDashPattern");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStrokePattern roundDashPattern](CRLStrokePattern, "roundDashPattern"));
  v15 = -[CRLStrokePatternAccessibility isEqual:](self, "isEqual:", v14);

  if (v15)
    return CFSTR("roundDashPattern");
  else
    return 0;
}

- (id)_crlaxLocalizedDescriptionForPattern:(id)a3 omittingStroke:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  void *v30;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD v48[6];
  _QWORD v49[6];
  _QWORD v50[6];
  _QWORD v51[6];

  v4 = a4;
  v5 = a3;
  if (qword_101415958)
    v6 = 1;
  else
    v6 = !v4;
  if (!v6)
  {
    v50[0] = CFSTR("solidPattern");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("Solid"), 0, 0));
    v51[0] = v44;
    v50[1] = CFSTR("emptyPattern");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Empty"), 0, 0));
    v51[1] = v40;
    v50[2] = CFSTR("shortDashPattern");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Short dash"), 0, 0));
    v51[2] = v7;
    v50[3] = CFSTR("mediumDashPattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Medium dash"), 0, 0));
    v51[3] = v9;
    v50[4] = CFSTR("longDashPattern");
    v10 = v4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Long dash"), 0, 0));
    v51[4] = v12;
    v50[5] = CFSTR("roundDashPattern");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = v5;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Rounded dash"), 0, 0));
    v51[5] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v51, v50, 6));
    v17 = (void *)qword_101415958;
    qword_101415958 = v16;

    v5 = v14;
    v4 = v10;

  }
  if (!qword_101415950 && !v4)
  {
    v48[0] = CFSTR("solidPattern");
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Solid stroke"), 0, 0));
    v49[0] = v45;
    v48[1] = CFSTR("emptyPattern");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("Empty stroke"), 0, 0));
    v49[1] = v41;
    v48[2] = CFSTR("shortDashPattern");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Short dash stroke"), 0, 0));
    v49[2] = v18;
    v48[3] = CFSTR("mediumDashPattern");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Medium dash stroke"), 0, 0));
    v49[3] = v20;
    v48[4] = CFSTR("longDashPattern");
    v21 = v4;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = v5;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Long dash stroke"), 0, 0));
    v49[4] = v24;
    v48[5] = CFSTR("roundDashPattern");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Rounded dash stroke"), 0, 0));
    v49[5] = v26;
    v27 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v49, v48, 6));
    v28 = (void *)qword_101415950;
    qword_101415950 = v27;

    v5 = v23;
    v4 = v21;

  }
  v29 = &qword_101415958;
  if (!v4)
    v29 = &qword_101415950;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v29, "objectForKeyedSubscript:", v5));
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (!objc_msgSend(v30, "length"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Unrecognized pattern %@, could not get localization key"), v32, v33, v34, v35, v36, (uint64_t)v5))abort();
    }
  }

  return v30;
}

- (int64_t)_crlaxStrokePattern
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStrokePatternAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "patternType");

  return (int64_t)v3;
}

@end
