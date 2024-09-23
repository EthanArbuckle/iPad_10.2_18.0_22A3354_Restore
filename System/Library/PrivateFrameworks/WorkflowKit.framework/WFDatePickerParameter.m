@implementation WFDatePickerParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFDatePickerParameter)initWithDefinition:(id)a3
{
  id v4;
  WFDatePickerParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSString *datePickerMode;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *minimumDate;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSDate *maximumDate;
  WFDatePickerParameter *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WFDatePickerParameter;
  v5 = -[WFParameter initWithDefinition:](&v20, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("DatePickerMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    datePickerMode = v5->_datePickerMode;
    v5->_datePickerMode = (NSString *)v8;

    objc_msgSend(v4, "objectForKey:", CFSTR("MinimumValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    WFEnforceClass(v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    minimumDate = v5->_minimumDate;
    v5->_minimumDate = (NSDate *)v12;

    objc_msgSend(v4, "objectForKey:", CFSTR("MaximumValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_class();
    WFEnforceClass(v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    maximumDate = v5->_maximumDate;
    v5->_maximumDate = (NSDate *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)setDatePickerMode:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  BOOL v7;
  NSString *v8;
  NSString *datePickerMode;
  NSString *v10;

  v4 = a3;
  v5 = self->_datePickerMode;
  v6 = (NSString *)v4;
  v10 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v6 && v5)
    {
      v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

      if (v7)
        goto LABEL_9;
    }
    else
    {

    }
    v8 = (NSString *)-[NSString copy](v10, "copy");
    datePickerMode = self->_datePickerMode;
    self->_datePickerMode = v8;

    -[WFParameter attributesDidChange](self, "attributesDidChange");
  }
LABEL_9:

}

- (void)setMinimumDate:(id)a3
{
  NSDate *v5;
  NSDate *minimumDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  minimumDate = self->_minimumDate;
  v8 = v5;
  if (minimumDate == v5)
  {
    objc_storeStrong((id *)&self->_minimumDate, a3);
  }
  else
  {
    v7 = -[NSDate isEqualToDate:](minimumDate, "isEqualToDate:", v5);
    objc_storeStrong((id *)&self->_minimumDate, a3);
    if (!v7)
      -[WFParameter attributesDidChange](self, "attributesDidChange");
  }

}

- (void)setMaximumDate:(id)a3
{
  NSDate *v5;
  NSDate *maximumDate;
  BOOL v7;
  NSDate *v8;

  v5 = (NSDate *)a3;
  maximumDate = self->_maximumDate;
  v8 = v5;
  if (maximumDate == v5)
  {
    objc_storeStrong((id *)&self->_maximumDate, a3);
  }
  else
  {
    v7 = -[NSDate isEqualToDate:](maximumDate, "isEqualToDate:", v5);
    objc_storeStrong((id *)&self->_maximumDate, a3);
    if (!v7)
      -[WFParameter attributesDidChange](self, "attributesDidChange");
  }

}

- (id)defaultSupportedVariableTypes
{
  return (id)objc_msgSend((id)objc_opt_class(), "allInsertableVariableTypes");
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  objc_class *v10;
  void (**v11)(id, void *);
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v10 = (objc_class *)MEMORY[0x1E0DC7AB8];
  v11 = (void (**)(id, void *))a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v20 = objc_alloc_init(v10);
  objc_msgSend(v13, "value");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setDefaultDate:", v15);
  -[WFDatePickerParameter datePickerMode](self, "datePickerMode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDatePickerMode:", v16);

  -[WFDatePickerParameter minimumDate](self, "minimumDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMinimumDate:", v17);

  -[WFDatePickerParameter maximumDate](self, "maximumDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMaximumDate:", v18);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B88]), "initWithDatePickerConfiguration:message:attribution:prompt:", v20, 0, v14, v12);
  v11[2](v11, v19);

}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v3;
  void *v4;
  WFDateSubstitutableState *v5;
  void *v6;
  WFDateSubstitutableState *v7;

  v3 = a3;
  objc_msgSend(v3, "inputtedDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [WFDateSubstitutableState alloc];
    objc_msgSend(v3, "inputtedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[WFVariableSubstitutableParameterState initWithValue:](v5, "initWithValue:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)datePickerMode
{
  return self->_datePickerMode;
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_datePickerMode, 0);
}

@end
