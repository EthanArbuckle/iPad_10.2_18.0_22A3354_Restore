@implementation CRLInspectorTextFieldPrecisePointLengthFormatter

+ (CRLInspectorTextFieldPrecisePointLengthFormatter)sharedFormatter
{
  return (CRLInspectorTextFieldPrecisePointLengthFormatter *)+[CRLInspectorTextFieldNumberFormatter precisePointsFormatter](CRLInspectorTextFieldNumberFormatter, "precisePointsFormatter");
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  BOOL v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[4];

  v24 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30[0] = qword_1014159B8;
  v30[1] = qword_1014159C8;
  v30[2] = qword_1014159D0;
  v30[3] = qword_1014159D8;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 4));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:", a3, v24, v14, v15, v16, a8, a9) & 1) != 0)
        {
          v22 = 1;
          goto LABEL_11;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v19)
        continue;
      break;
    }
  }
  v22 = 0;
LABEL_11:

  return v22;
}

- (id)stringForObjectValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)qword_1014159B8;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter valueBeforeEditing](self, "valueBeforeEditing"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringForObjectValue:originalValue:", v5, v6));

  return v7;
}

- (id)crl_numberFormatterForAnalysis
{
  return (id)qword_1014159B8;
}

- (id)crlaxLocalizedDescriptionFromValue:(id)a3
{
  return objc_msgSend((id)qword_1014159B8, "crlaxLocalizedDescriptionFromValue:", a3);
}

@end
