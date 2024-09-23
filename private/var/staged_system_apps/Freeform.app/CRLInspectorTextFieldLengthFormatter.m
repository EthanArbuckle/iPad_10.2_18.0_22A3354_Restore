@implementation CRLInspectorTextFieldLengthFormatter

+ (CRLInspectorTextFieldLengthFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldLengthFormatter *)+[CRLInspectorTextFieldNumberFormatter rulerLengthFormatter](CRLInspectorTextFieldNumberFormatter, "rulerLengthFormatter");
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  BOOL v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v31 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v18 = objc_msgSend(v17, "rulerUnits");

  if (v18 == (id)4)
  {
    v19 = &qword_1014159D0;
    v38 = qword_1014159C0;
    v20 = &qword_1014159D8;
    v21 = &qword_1014159B0;
    v22 = &v38;
  }
  else if (v18 == (id)1)
  {
    v19 = &qword_1014159D0;
    v39 = qword_1014159D8;
    v20 = &qword_1014159C0;
    v21 = &qword_1014159B0;
    v22 = &v39;
  }
  else
  {
    v19 = &qword_1014159D8;
    if (v18)
    {
      v37 = qword_1014159B0;
      v20 = &qword_1014159C0;
      v21 = &qword_1014159D0;
      v22 = &v37;
    }
    else
    {
      v40 = qword_1014159D0;
      v20 = &qword_1014159C0;
      v21 = &qword_1014159B0;
      v22 = &v40;
    }
  }
  v23 = *v20;
  v22[1] = *v21;
  v22[2] = v23;
  v22[3] = *v19;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(v24);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:", a3, v31, v14, v15, v16, a8, a9) & 1) != 0)
        {
          v29 = 1;
          goto LABEL_18;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v26)
        continue;
      break;
    }
  }
  v29 = 0;
LABEL_18:

  return v29;
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v6 = (unint64_t)objc_msgSend(v5, "rulerUnits");

  objc_opt_class(NSNumber, v7);
  v9 = sub_100221D0C(v8, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (v10)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    v4 = (id)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter valueBeforeEditing](self, "valueBeforeEditing"));
  if (v6 > 4)
    v13 = &qword_1014159B0;
  else
    v13 = (&off_10125D188)[v6];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v13, "stringForObjectValue:originalValue:", v4, v12));

  return v14;
}

- (id)crl_numberFormatterForAnalysis
{
  void *v2;
  unint64_t v3;
  uint64_t *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLRulerUnits instance](CRLRulerUnits, "instance"));
  v3 = (unint64_t)objc_msgSend(v2, "rulerUnits");

  if (v3 > 4)
    v4 = &qword_1014159B0;
  else
    v4 = (&off_10125D188)[v3];
  return (id)*v4;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  CRLInspectorTextFieldLengthFormatter *v12;
  void *v13;
  BOOL v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLInspectorTextFieldAbstractNumberFormatter, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldLengthFormatter crl_numberFormatterForAnalysis](self, "crl_numberFormatterForAnalysis", v6));
  v10 = objc_msgSend(v9, "copy");
  v11 = sub_100221D0C(v8, v10);
  v12 = (CRLInspectorTextFieldLengthFormatter *)objc_claimAutoreleasedReturnValue(v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldAbstractNumberFormatter crlaxValueFormat](v12, "crlaxValueFormat"));
  if (v13)
    v14 = v12 == self;
  else
    v14 = 1;
  if (v14)
  {
    v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D148);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E330A8(v15, v16);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D168);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldLengthFormatter crlaxLocalizedDescriptionFromValue:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 586, 0, "Did not find a valid number formatter for accessible description.");

    v24.receiver = self;
    v24.super_class = (Class)CRLInspectorTextFieldLengthFormatter;
    v20 = -[CRLInspectorTextFieldAbstractNumberFormatter crlaxLocalizedDescriptionFromValue:](&v24, "crlaxLocalizedDescriptionFromValue:", v4);
    v21 = objc_claimAutoreleasedReturnValue(v20);
  }
  else
  {
    v21 = objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldLengthFormatter crlaxLocalizedDescriptionFromValue:](v12, "crlaxLocalizedDescriptionFromValue:", v4));
  }
  v22 = (void *)v21;

  return v22;
}

@end
