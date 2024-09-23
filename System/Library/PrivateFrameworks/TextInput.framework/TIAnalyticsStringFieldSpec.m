@implementation TIAnalyticsStringFieldSpec

- (TIAnalyticsStringFieldSpec)initWithName:(id)a3 allowedValues:(id)a4
{
  id v6;
  TIAnalyticsStringFieldSpec *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)TIAnalyticsStringFieldSpec;
  v7 = -[TIAnalyticsFieldSpec initWithName:](&v10, sel_initWithName_, a3);
  if (v7)
  {
    if (v6)
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
    else
      v8 = 0;
    objc_storeStrong((id *)&v7->_allowedValues, v8);
    if (v6)

  }
  return v7;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  void *v12;

  v6 = a3;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v6, "length"))
      {
        -[TIAnalyticsStringFieldSpec allowedValues](self, "allowedValues");
        v7 = objc_claimAutoreleasedReturnValue();
        if (!v7
          || (v8 = (void *)v7,
              -[TIAnalyticsStringFieldSpec allowedValues](self, "allowedValues"),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v10 = objc_msgSend(v9, "containsObject:", v6),
              v9,
              v8,
              (v10 & 1) != 0))
        {
          v11 = 0;
          goto LABEL_15;
        }
        -[TIAnalyticsFieldSpec name](self, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIAnalyticsFieldSpec errorFromValue:code:message:](self, "errorFromValue:code:message:", v6, 13, CFSTR("Field '%@' must be one of the allowed values."), v12);
      }
      else
      {
        -[TIAnalyticsFieldSpec name](self, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[TIAnalyticsFieldSpec errorFromValue:code:message:](self, "errorFromValue:code:message:", v6, 12, CFSTR("Field '%@' cannot be an empty string."), v12);
      }
    }
    else
    {
      -[TIAnalyticsFieldSpec name](self, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TIAnalyticsFieldSpec errorFromValue:code:message:](self, "errorFromValue:code:message:", v6, 10, CFSTR("Field '%@' must be a string."), v12);
    }
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_15;
  }
  else
  {
    -[TIAnalyticsFieldSpec errorFromNil](self, "errorFromNil");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_15;
  }
  if (v11)
  {
    v11 = objc_retainAutorelease(v11);
    *a4 = v11;
  }
LABEL_15:

  return v11 == 0;
}

- (NSArray)allowedValues
{
  return self->_allowedValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedValues, 0);
}

@end
