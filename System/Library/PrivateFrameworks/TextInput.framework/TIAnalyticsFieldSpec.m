@implementation TIAnalyticsFieldSpec

+ (id)BOOLeanFieldSpecWithName:(id)a3
{
  id v3;
  TIAnalyticsBooleanFieldSpec *v4;

  v3 = a3;
  v4 = -[TIAnalyticsBooleanFieldSpec initWithName:]([TIAnalyticsBooleanFieldSpec alloc], "initWithName:", v3);

  return v4;
}

+ (id)integerFieldSpecWithName:(id)a3
{
  id v3;
  TIAnalyticsNumberFieldSpec *v4;

  v3 = a3;
  v4 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:]([TIAnalyticsNumberFieldSpec alloc], "initWithName:isInteger:minValue:maxValue:significantDigits:", v3, 1, 0, 0, 0);

  return v4;
}

- (NSString)name
{
  return self->_name;
}

+ (id)stringFieldSpecWithName:(id)a3 allowedValues:(id)a4
{
  id v5;
  id v6;
  TIAnalyticsStringFieldSpec *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[TIAnalyticsStringFieldSpec initWithName:allowedValues:]([TIAnalyticsStringFieldSpec alloc], "initWithName:allowedValues:", v6, v5);

  return v7;
}

+ (id)stringFieldSpecWithName:(id)a3
{
  id v3;
  TIAnalyticsStringFieldSpec *v4;

  v3 = a3;
  v4 = -[TIAnalyticsStringFieldSpec initWithName:allowedValues:]([TIAnalyticsStringFieldSpec alloc], "initWithName:allowedValues:", v3, 0);

  return v4;
}

+ (id)integerFieldSpecWithName:(id)a3 minValue:(id)a4 maxValue:(id)a5 significantDigits:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TIAnalyticsNumberFieldSpec *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:]([TIAnalyticsNumberFieldSpec alloc], "initWithName:isInteger:minValue:maxValue:significantDigits:", v12, 1, v11, v10, v9);

  return v13;
}

- (TIAnalyticsFieldSpec)initWithName:(id)a3
{
  id v4;
  TIAnalyticsFieldSpec *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIAnalyticsFieldSpec;
  v5 = -[TIAnalyticsFieldSpec init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

+ (id)enumFieldSpecWithName:(id)a3
{
  id v3;
  TIAnalyticsNumberFieldSpec *v4;

  v3 = a3;
  v4 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:]([TIAnalyticsNumberFieldSpec alloc], "initWithName:isInteger:minValue:maxValue:significantDigits:", v3, 1, &unk_1E24C0508, 0, 0);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)errorFromNil
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v9 = CFSTR("message");
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TIAnalyticsFieldSpec name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Field '%@' cannot be nil."), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("TIAnalyticsErrorDomain"), 11, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)errorFromValue:(id)a3 code:(int64_t)a4 message:(id)a5
{
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];
  uint64_t v18;

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (objc_class *)MEMORY[0x1E0CB3940];
  v9 = a5;
  v10 = (void *)objc_msgSend([v8 alloc], "initWithFormat:arguments:", v9, &v18);

  v11 = (void *)MEMORY[0x1E0CB35C8];
  v16[0] = CFSTR("message");
  v16[1] = CFSTR("value");
  v17[0] = v10;
  v12 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("TIAnalyticsErrorDomain"), a4, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)integerFieldSpecWithName:(id)a3 minValue:(int64_t)a4
{
  id v5;
  TIAnalyticsNumberFieldSpec *v6;
  void *v7;
  TIAnalyticsNumberFieldSpec *v8;

  v5 = a3;
  v6 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v6, "initWithName:isInteger:minValue:maxValue:significantDigits:", v5, 1, v7, 0, 0);

  return v8;
}

+ (id)integerFieldSpecWithName:(id)a3 maxValue:(int64_t)a4
{
  id v5;
  TIAnalyticsNumberFieldSpec *v6;
  void *v7;
  TIAnalyticsNumberFieldSpec *v8;

  v5 = a3;
  v6 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v6, "initWithName:isInteger:minValue:maxValue:significantDigits:", v5, 1, 0, v7, 0);

  return v8;
}

+ (id)integerFieldSpecWithName:(id)a3 minValue:(int64_t)a4 maxValue:(int64_t)a5
{
  id v7;
  TIAnalyticsNumberFieldSpec *v8;
  void *v9;
  void *v10;
  TIAnalyticsNumberFieldSpec *v11;

  v7 = a3;
  v8 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v8, "initWithName:isInteger:minValue:maxValue:significantDigits:", v7, 1, v9, v10, 0);

  return v11;
}

+ (id)floatFieldSpecWithName:(id)a3
{
  id v3;
  TIAnalyticsNumberFieldSpec *v4;

  v3 = a3;
  v4 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:]([TIAnalyticsNumberFieldSpec alloc], "initWithName:isInteger:minValue:maxValue:significantDigits:", v3, 0, 0, 0, 0);

  return v4;
}

+ (id)floatFieldSpecWithName:(id)a3 minValue:(double)a4
{
  id v5;
  TIAnalyticsNumberFieldSpec *v6;
  void *v7;
  TIAnalyticsNumberFieldSpec *v8;

  v5 = a3;
  v6 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v6, "initWithName:isInteger:minValue:maxValue:significantDigits:", v5, 0, v7, 0, 0);

  return v8;
}

+ (id)floatFieldSpecWithName:(id)a3 maxValue:(double)a4
{
  id v5;
  TIAnalyticsNumberFieldSpec *v6;
  void *v7;
  TIAnalyticsNumberFieldSpec *v8;

  v5 = a3;
  v6 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v6, "initWithName:isInteger:minValue:maxValue:significantDigits:", v5, 0, 0, v7, 0);

  return v8;
}

+ (id)floatFieldSpecWithName:(id)a3 minValue:(double)a4 maxValue:(double)a5
{
  id v7;
  TIAnalyticsNumberFieldSpec *v8;
  void *v9;
  void *v10;
  TIAnalyticsNumberFieldSpec *v11;

  v7 = a3;
  v8 = [TIAnalyticsNumberFieldSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:](v8, "initWithName:isInteger:minValue:maxValue:significantDigits:", v7, 0, v9, v10, 0);

  return v11;
}

+ (id)floatFieldSpecWithName:(id)a3 minValue:(id)a4 maxValue:(id)a5 significantDigits:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  TIAnalyticsNumberFieldSpec *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[TIAnalyticsNumberFieldSpec initWithName:isInteger:minValue:maxValue:significantDigits:]([TIAnalyticsNumberFieldSpec alloc], "initWithName:isInteger:minValue:maxValue:significantDigits:", v12, 0, v11, v10, v9);

  return v13;
}

@end
