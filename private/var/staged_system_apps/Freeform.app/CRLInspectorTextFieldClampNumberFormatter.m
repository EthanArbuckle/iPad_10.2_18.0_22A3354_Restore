@implementation CRLInspectorTextFieldClampNumberFormatter

+ (id)formatterWithMinValue:(id)a3 maxValue:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "formatter"));
  objc_msgSend(v8, "setMinimum:", v7);

  objc_msgSend(v8, "setMaximum:", v6);
  return v8;
}

- (void)p_commonInitClampNumberFormatter
{
  -[CRLInspectorTextFieldClampNumberFormatter setLenient:](self, "setLenient:", 1);
  -[CRLInspectorTextFieldAbstractNumberFormatter setCrlaxRulerUnitType:](self, "setCrlaxRulerUnitType:", 5);
}

- (CRLInspectorTextFieldClampNumberFormatter)initWithCoder:(id)a3
{
  CRLInspectorTextFieldClampNumberFormatter *v3;
  CRLInspectorTextFieldClampNumberFormatter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v3 = -[CRLInspectorTextFieldClampNumberFormatter initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLInspectorTextFieldClampNumberFormatter p_commonInitClampNumberFormatter](v3, "p_commonInitClampNumberFormatter");
  return v4;
}

- (CRLInspectorTextFieldClampNumberFormatter)init
{
  CRLInspectorTextFieldClampNumberFormatter *v2;
  CRLInspectorTextFieldClampNumberFormatter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v2 = -[CRLInspectorTextFieldAbstractNumberFormatter init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CRLInspectorTextFieldClampNumberFormatter p_commonInitClampNumberFormatter](v2, "p_commonInitClampNumberFormatter");
  return v3;
}

- (id)p_clampNumber:(id)a3 toMinimum:(id)a4 andMaximum:(id)a5 wasNumberClamped:(BOOL *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  id v20;
  uint8_t buf[4];
  unsigned int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  if (v10 && v11)
  {
    if (objc_msgSend(v10, "compare:", v11) != (id)-1 && objc_msgSend(v10, "compare:", v11))
    {
      v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D0C8);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67110402;
        v23 = v13;
        v24 = 2082;
        v25 = "-[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:]";
        v26 = 2082;
        v27 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m";
        v28 = 1024;
        v29 = 135;
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v11;
        _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid minimum %@ and maximum %@", buf, 0x36u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D0E8);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 135, 0, "invalid minimum %@ and maximum %@", v10, v11);

    }
  }
  else if (!v10)
  {
    goto LABEL_16;
  }
  if (objc_msgSend(v12, "compare:", v10) != (id)-1)
  {
LABEL_16:
    v18 = 0;
    v19 = v12;
    if (!v11)
      goto LABEL_21;
    goto LABEL_19;
  }
  v19 = v10;

  v18 = 1;
  if (!v11)
    goto LABEL_21;
LABEL_19:
  if (objc_msgSend(v19, "compare:", v11) == (id)1)
  {
    v20 = v11;

    v18 = 1;
    v19 = v20;
  }
LABEL_21:
  if (a6)
    *a6 = v18;

  return v19;
}

- (id)stringForObjectValue:(id)a3 originalValue:(id)a4
{
  __CFString *v6;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v6 = (__CFString *)a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v7 = -[CRLPositiveZeroNumberFormatter stringForObjectValue:](&v11, "stringForObjectValue:", a3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)v8;
  if (a3 && !v8)
  {
    if (!v6)
      v6 = &stru_1012A72B0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString description](v6, "description"));
  }

  return v9;
}

- (id)stringForObjectValue:(id)a3
{
  return -[CRLInspectorTextFieldClampNumberFormatter stringForObjectValue:originalValue:](self, "stringForObjectValue:originalValue:", a3, self->mValueBeforeEditing);
}

- (BOOL)p_getObjectValue:(id *)a3 forString:(id)a4 withMinimum:(id)a5 andMaximum:(id)a6 originalValue:(id)a7 errorDescription:(id *)a8 valueObjectWasAdjusted:(BOOL *)a9
{
  BOOL *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  char isKindOfClass;
  id v29;
  char v31;
  objc_super v32;
  id v33;

  v14 = a9;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter minimum](self, "minimum"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter maximum](self, "maximum"));
  -[CRLInspectorTextFieldClampNumberFormatter setMinimum:](self, "setMinimum:", 0);
  -[CRLInspectorTextFieldClampNumberFormatter setMaximum:](self, "setMaximum:", 0);
  v32.receiver = self;
  v32.super_class = (Class)CRLInspectorTextFieldClampNumberFormatter;
  v33 = 0;
  v21 = -[CRLInspectorTextFieldClampNumberFormatter getObjectValue:forString:errorDescription:](&v32, "getObjectValue:forString:errorDescription:", a3, v18, &v33);

  v22 = v33;
  -[CRLInspectorTextFieldClampNumberFormatter setMinimum:](self, "setMinimum:", v19);
  -[CRLInspectorTextFieldClampNumberFormatter setMaximum:](self, "setMaximum:", v20);
  v31 = 0;
  if (a3)
  {
    v24 = v17;
    v25 = v15;
    v26 = *a3;
    objc_opt_class(NSNumber, v23);
    isKindOfClass = objc_opt_isKindOfClass(v26, v27);
    v29 = *a3;
    if ((isKindOfClass & 1) != 0)
    {
      v15 = v25;
      *a3 = (id)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter p_clampNumber:toMinimum:andMaximum:wasNumberClamped:](self, "p_clampNumber:toMinimum:andMaximum:wasNumberClamped:", v29, v25, v16, &v31));
      v17 = v24;
      v14 = a9;
    }
    else
    {
      v15 = v25;
      v17 = v24;
      v14 = a9;
      if (!v29
        && (!v21
         || !-[CRLInspectorTextFieldAbstractNumberFormatter inspectorTextFieldAllowsNilObjectValue](self, "inspectorTextFieldAllowsNilObjectValue")))
      {
        *a3 = objc_retainAutorelease(v17);
        v31 = 1;
      }
    }
  }
  if (v14)
    *v14 = v31;

  return v21;
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 errorDescription:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter minimum](self, "minimum"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLInspectorTextFieldClampNumberFormatter maximum](self, "maximum"));
  -[CRLInspectorTextFieldClampNumberFormatter p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:](self, "p_getObjectValue:forString:withMinimum:andMaximum:originalValue:errorDescription:valueObjectWasAdjusted:", a3, v8, v9, v10, self->mValueBeforeEditing, a5, 0);

  return 1;
}

- (BOOL)p_textShouldBeginEditingWithContent:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id mValueBeforeEditing;
  id v14;

  v4 = a3;
  v14 = 0;
  v5 = -[CRLInspectorTextFieldClampNumberFormatter getObjectValue:forString:errorDescription:](self, "getObjectValue:forString:errorDescription:", &v14, v4, 0);
  v6 = v14;
  if ((v5 & 1) == 0)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D108);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E32FF0((uint64_t)v4, v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D128);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLInspectorTextFieldClampNumberFormatter p_textShouldBeginEditingWithContent:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLInspectorFieldFormatters.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 221, 0, "invalid initial string %@", v4);

  }
  mValueBeforeEditing = self->mValueBeforeEditing;
  self->mValueBeforeEditing = v6;

  return 1;
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  LOBYTE(self) = -[CRLInspectorTextFieldClampNumberFormatter p_textShouldBeginEditingWithContent:](self, "p_textShouldBeginEditingWithContent:", v4);

  return (char)self;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (id)valueBeforeEditing
{
  return self->mValueBeforeEditing;
}

- (void)setValueBeforeEditing:(id)a3
{
  objc_storeStrong(&self->mValueBeforeEditing, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mValueBeforeEditing, 0);
}

@end
