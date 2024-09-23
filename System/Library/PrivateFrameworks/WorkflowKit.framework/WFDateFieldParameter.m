@implementation WFDateFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFDateFieldParameter)initWithDefinition:(id)a3
{
  id v4;
  WFDateFieldParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSString *hintDateMode;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *reactiveParameterKey;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *dateFormatterTemplateString;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  __CFString *v38;
  WFDateFieldParameter *v39;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)WFDateFieldParameter;
  v5 = -[WFTextInputParameter initWithDefinition:](&v41, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("HintDateMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    hintDateMode = v5->_hintDateMode;
    v5->_hintDateMode = (NSString *)v9;

    objc_msgSend(v4, "objectForKey:", CFSTR("ReactiveParameterKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    reactiveParameterKey = v5->_reactiveParameterKey;
    v5->_reactiveParameterKey = (NSString *)v14;

    objc_msgSend(v4, "objectForKey:", CFSTR("DetectsAllDayDates"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_class();
    WFEnforceClass(v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_detectsAllDayDates = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("DisplaysAllDayString"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_class();
    WFEnforceClass(v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_displaysAllDayString = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("DateFormatterDateStyle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_class();
    v5->_dateFormatterDateStyleNumber = (NSNumber *)WFEnforceClass(v22, v23);

    objc_msgSend(v4, "objectForKey:", CFSTR("DateFormatterTimeStyle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    v5->_dateFormatterTimeStyleNumber = (NSNumber *)WFEnforceClass(v24, v25);

    objc_msgSend(v4, "objectForKey:", CFSTR("DateFormatterAllowsRelative"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v5->_dateFormatterRelativeDateFormattingNumber = (NSNumber *)WFEnforceClass(v26, v27);

    objc_msgSend(v4, "objectForKey:", CFSTR("DateFormatterTemplate"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_opt_class();
    WFEnforceClass(v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "copy");
    dateFormatterTemplateString = v5->_dateFormatterTemplateString;
    v5->_dateFormatterTemplateString = (NSString *)v31;

    objc_msgSend(v4, "objectForKey:", CFSTR("ResultType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_class();
    WFEnforceClass(v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    v37 = (void *)v36;
    if (v36)
      v38 = (__CFString *)v36;
    else
      v38 = CFSTR("Date");
    objc_storeStrong((id *)&v5->_resultType, v38);

    v39 = v5;
  }

  return v5;
}

- (BOOL)timeOnlyMode
{
  void *v2;
  char v3;

  -[WFDateFieldParameter hintDateMode](self, "hintDateMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Time"));

  return v3;
}

- (BOOL)dateOnlyMode
{
  void *v2;
  char v3;

  -[WFDateFieldParameter hintDateMode](self, "hintDateMode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Date"));

  return v3;
}

- (NSDateFormatter)hintDateFormatter
{
  NSDateFormatter *hintDateFormatter;
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDateFormatter *v15;
  NSDateFormatter *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSDateFormatter *v20;

  hintDateFormatter = self->_hintDateFormatter;
  if (!hintDateFormatter)
  {
    v4 = -[WFDateFieldParameter timeOnlyMode](self, "timeOnlyMode");
    v5 = -[WFDateFieldParameter dateOnlyMode](self, "dateOnlyMode");
    -[WFDateFieldParameter dateFormatterDateStyleNumber](self, "dateFormatterDateStyleNumber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[WFDateFieldParameter dateFormatterDateStyleNumber](self, "dateFormatterDateStyleNumber");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

    }
    else
    {
      v8 = 1;
    }

    -[WFDateFieldParameter dateFormatterTimeStyleNumber](self, "dateFormatterTimeStyleNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WFDateFieldParameter dateFormatterTimeStyleNumber](self, "dateFormatterTimeStyleNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "integerValue");

    }
    else
    {
      v11 = 1;
    }

    -[WFDateFieldParameter dateFormatterRelativeDateFormattingNumber](self, "dateFormatterRelativeDateFormattingNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[WFDateFieldParameter dateFormatterRelativeDateFormattingNumber](self, "dateFormatterRelativeDateFormattingNumber");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "BOOLValue");

    }
    else
    {
      v14 = 1;
    }

    v15 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    v16 = v15;
    if (v5)
      v17 = 0;
    else
      v17 = v11;
    -[NSDateFormatter setTimeStyle:](v15, "setTimeStyle:", v17);
    if (v4)
      v18 = 0;
    else
      v18 = v8;
    -[NSDateFormatter setDateStyle:](v16, "setDateStyle:", v18);
    -[NSDateFormatter setDoesRelativeDateFormatting:](v16, "setDoesRelativeDateFormatting:", v14);
    -[WFDateFieldParameter dateFormatterTemplateString](self, "dateFormatterTemplateString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setDateFormat:](v16, "setDateFormat:", v19);

    v20 = self->_hintDateFormatter;
    self->_hintDateFormatter = v16;

    hintDateFormatter = self->_hintDateFormatter;
  }
  return hintDateFormatter;
}

- (id)hintForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(v4, "variableString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "variables");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "variableString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByRemovingVariables");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (!v11)
    {
      v7 = 0;
      goto LABEL_4;
    }
    v12 = (void *)MEMORY[0x1E0D13F28];
    objc_msgSend(v4, "variableString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingVariables");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "datesInString:error:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFDateFieldParameter hintDateFormatter](self, "hintDateFormatter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[WFDateFieldParameter localizedIncompleteHintString](self, "localizedIncompleteHintString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_4:
  return v7;
}

- (NSString)localizedIncompleteHintString
{
  __CFString *v2;

  if (-[WFDateFieldParameter timeOnlyMode](self, "timeOnlyMode"))
    v2 = CFSTR("Incomplete time");
  else
    v2 = CFSTR("Incomplete date");
  WFLocalizedString(v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setForcesAllDayDates:(BOOL)a3
{
  if (self->_forcesAllDayDates != a3)
  {
    self->_forcesAllDayDates = a3;
    -[WFParameter attributesDidChange](self, "attributesDidChange");
  }
}

- (id)datePickerConfiguration
{
  id v3;
  id v4;
  id *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x1E0DC7AB8]);
  v4 = (id)*MEMORY[0x1E0DC80A0];
  if (-[WFDateFieldParameter timeOnlyMode](self, "timeOnlyMode"))
  {
    v5 = (id *)MEMORY[0x1E0DC80A8];
LABEL_6:
    v6 = *v5;

    v4 = v6;
    goto LABEL_7;
  }
  if (-[WFDateFieldParameter dateOnlyMode](self, "dateOnlyMode")
    || -[WFDateFieldParameter forcesAllDayDates](self, "forcesAllDayDates"))
  {
    v5 = (id *)MEMORY[0x1E0DC8098];
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v3, "setDatePickerMode:", v4);

  return v3;
}

- (id)dateFormatterForConfiguration:(id)a3
{
  id v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  objc_msgSend(v3, "datePickerMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != (void *)*MEMORY[0x1E0DC80A8];

  objc_msgSend(v3, "datePickerMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)*MEMORY[0x1E0DC8098];
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = v8;
  if (v6 == v7)
    v10 = 0;
  else
    v10 = 3;
  objc_msgSend(v8, "setTimeStyle:", v10);
  objc_msgSend(v9, "setDateStyle:", 4 * v5);
  return v9;
}

- (void)createDialogRequestWithAttribution:(id)a3 defaultState:(id)a4 prompt:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  char v15;
  void *v16;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  if (v11
    && (objc_msgSend(v11, "variableString"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEmpty"),
        v14,
        (v15 & 1) == 0))
  {
    v18.receiver = self;
    v18.super_class = (Class)WFDateFieldParameter;
    -[WFTextInputParameter createDialogRequestWithAttribution:defaultState:prompt:completionHandler:](&v18, sel_createDialogRequestWithAttribution_defaultState_prompt_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    -[WFDateFieldParameter datePickerConfiguration](self, "datePickerConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7B88]), "initWithDatePickerConfiguration:message:attribution:prompt:", v16, 0, v10, v12);
    v13[2](v13, v17);

  }
}

- (id)createDialogTextFieldConfigurationWithDefaultState:(id)a3
{
  id v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v5 = -[WFDateFieldParameter timeOnlyMode](self, "timeOnlyMode");
  v6 = -[WFDateFieldParameter dateOnlyMode](self, "dateOnlyMode");
  v11.receiver = self;
  v11.super_class = (Class)WFDateFieldParameter;
  -[WFTextInputParameter createDialogTextFieldConfigurationWithDefaultState:](&v11, sel_createDialogTextFieldConfigurationWithDefaultState_, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setShowsDateFormattingHint:", 1);
  objc_msgSend(v7, "setTimeFormatStyle:", !v6);
  objc_msgSend(v7, "setDateFormatStyle:", !v5);
  if (-[WFDateFieldParameter detectsAllDayDates](self, "detectsAllDayDates"))
    v8 = -[WFDateFieldParameter displaysAllDayString](self, "displaysAllDayString") ^ 1;
  else
    v8 = 0;
  objc_msgSend(v7, "setDateHintPrefersDateOnly:", v8);
  objc_msgSend(v7, "setDoesRelativeDateFormatting:", 1);
  -[WFDateFieldParameter localizedIncompleteHintString](self, "localizedIncompleteHintString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocalizedIncompleteHintString:", v9);

  return v7;
}

- (id)parameterStateFromDialogResponse:(id)a3
{
  id v4;
  id v5;
  WFDateFieldParameterState *v6;
  void *v7;
  void *v8;
  WFVariableString *v9;
  void *v10;
  void *v11;
  WFVariableString *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "inputtedDate");
    v6 = (WFDateFieldParameterState *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[WFDateFieldParameter datePickerConfiguration](self, "datePickerConfiguration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDateFieldParameter dateFormatterForConfiguration:](self, "dateFormatterForConfiguration:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = [WFVariableString alloc];
      objc_msgSend(v5, "inputtedDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WFVariableString initWithString:](v9, "initWithString:", v11);

      v6 = -[WFVariableStringParameterState initWithVariableString:]([WFDateFieldParameterState alloc], "initWithVariableString:", v12);
      objc_msgSend(v5, "inputtedDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDateFieldParameterState setPreprocessedDate:](v6, "setPreprocessedDate:", v13);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15.receiver = self;
      v15.super_class = (Class)WFDateFieldParameter;
      -[WFTextInputParameter parameterStateFromDialogResponse:](&v15, sel_parameterStateFromDialogResponse_, v4);
      v6 = (WFDateFieldParameterState *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)resultType
{
  return self->_resultType;
}

- (NSString)reactiveParameterKey
{
  return self->_reactiveParameterKey;
}

- (BOOL)detectsAllDayDates
{
  return self->_detectsAllDayDates;
}

- (BOOL)displaysAllDayString
{
  return self->_displaysAllDayString;
}

- (BOOL)forcesAllDayDates
{
  return self->_forcesAllDayDates;
}

- (NSString)hintDateMode
{
  return self->_hintDateMode;
}

- (NSNumber)dateFormatterDateStyleNumber
{
  return self->_dateFormatterDateStyleNumber;
}

- (NSNumber)dateFormatterTimeStyleNumber
{
  return self->_dateFormatterTimeStyleNumber;
}

- (NSNumber)dateFormatterRelativeDateFormattingNumber
{
  return self->_dateFormatterRelativeDateFormattingNumber;
}

- (NSString)dateFormatterTemplateString
{
  return self->_dateFormatterTemplateString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterTemplateString, 0);
  objc_storeStrong((id *)&self->_hintDateMode, 0);
  objc_storeStrong((id *)&self->_reactiveParameterKey, 0);
  objc_storeStrong((id *)&self->_resultType, 0);
  objc_storeStrong((id *)&self->_hintDateFormatter, 0);
}

@end
