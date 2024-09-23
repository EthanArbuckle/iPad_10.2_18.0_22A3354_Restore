@implementation TIAnalyticsNumberFieldSpec

- (TIAnalyticsNumberFieldSpec)initWithName:(id)a3 isInteger:(BOOL)a4 minValue:(id)a5 maxValue:(id)a6 significantDigits:(id)a7
{
  id v12;
  id v13;
  id v14;
  TIAnalyticsNumberFieldSpec *v15;
  TIAnalyticsNumberFieldSpec *v16;
  uint64_t v17;
  NSNumber *minValue;
  uint64_t v19;
  NSNumber *maxValue;
  uint64_t v21;
  NSNumber *significantDigits;
  objc_super v24;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v24.receiver = self;
  v24.super_class = (Class)TIAnalyticsNumberFieldSpec;
  v15 = -[TIAnalyticsFieldSpec initWithName:](&v24, sel_initWithName_, a3);
  v16 = v15;
  if (v15)
  {
    v15->_isInteger = a4;
    v17 = objc_msgSend(v12, "copy");
    minValue = v16->_minValue;
    v16->_minValue = (NSNumber *)v17;

    v19 = objc_msgSend(v13, "copy");
    maxValue = v16->_maxValue;
    v16->_maxValue = (NSNumber *)v19;

    v21 = objc_msgSend(v14, "copy");
    significantDigits = v16->_significantDigits;
    v16->_significantDigits = (NSNumber *)v21;

  }
  return v16;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  void *v4;
  id v7;
  void *v8;
  id v9;
  void *v10;
  const __CFString *v11;
  TIAnalyticsNumberFieldSpec *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;

  v7 = a3;
  if (v7)
  {
    if (self->_isInteger)
    {
      if (!+[TIAnalyticsUtil isInteger:](TIAnalyticsUtil, "isInteger:", v7))
      {
        -[TIAnalyticsFieldSpec name](self, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v10;
        v11 = CFSTR("Field '%@' must be an integer.");
        goto LABEL_13;
      }
      if (self->_isInteger)
        goto LABEL_6;
    }
    if (+[TIAnalyticsUtil isFloat:](TIAnalyticsUtil, "isFloat:", v7))
    {
LABEL_6:
      -[TIAnalyticsNumberFieldSpec minValue](self, "minValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[TIAnalyticsNumberFieldSpec minValue](self, "minValue");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "compare:", v4) == -1)
        {

LABEL_18:
          -[TIAnalyticsFieldSpec name](self, "name");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[TIAnalyticsFieldSpec errorFromValue:code:message:](self, "errorFromValue:code:message:", v7, 14, CFSTR("Field '%@' is out of range."), v10);
          goto LABEL_24;
        }
      }
      -[TIAnalyticsNumberFieldSpec maxValue](self, "maxValue");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[TIAnalyticsNumberFieldSpec maxValue](self, "maxValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v7, "compare:", v17);

        if (v8)
        {

        }
        if (v18 == 1)
          goto LABEL_18;
      }
      else if (v8)
      {

      }
      +[TIAnalyticsUtil roundNumber:toSignificantDigits:](TIAnalyticsUtil, "roundNumber:toSignificantDigits:", v7, self->_significantDigits);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
      objc_msgSend(v7, "doubleValue");
      v23 = v22;

      if (v21 == v23)
      {
        v9 = 0;
        goto LABEL_27;
      }
      -[TIAnalyticsFieldSpec name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v10;
      v11 = CFSTR("Field '%@' has too many significant digits.");
      v12 = self;
      v13 = v7;
      v14 = 15;
LABEL_23:
      -[TIAnalyticsFieldSpec errorFromValue:code:message:](v12, "errorFromValue:code:message:", v13, v14, v11, v25);
LABEL_24:
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (!a4)
        goto LABEL_27;
      goto LABEL_25;
    }
    -[TIAnalyticsFieldSpec name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v11 = CFSTR("Field '%@' must be a double.");
LABEL_13:
    v12 = self;
    v13 = v7;
    v14 = 10;
    goto LABEL_23;
  }
  -[TIAnalyticsFieldSpec errorFromNil](self, "errorFromNil");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_27;
LABEL_25:
  if (v9)
  {
    v9 = objc_retainAutorelease(v9);
    *a4 = v9;
  }
LABEL_27:

  return v9 == 0;
}

- (BOOL)isInteger
{
  return self->_isInteger;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (NSNumber)significantDigits
{
  return self->_significantDigits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantDigits, 0);
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

@end
