@implementation WFStepperParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFStepperParameter)initWithDefinition:(id)a3
{
  id v4;
  WFStepperParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *stepperPrefix;
  uint64_t v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *stepperDescription;
  uint64_t v24;
  WFStepperParameter *v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFStepperParameter;
  v5 = -[WFParameter initWithDefinition:](&v27, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MinimumValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = &unk_1E7B8B8C0;
    objc_storeStrong((id *)&v5->_minimumValue, v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("MaximumValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E7B8E058;
    objc_storeStrong((id *)&v5->_maximumValue, v15);

    objc_msgSend(v4, "objectForKey:", CFSTR("StepperPrefix"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v16;
      stepperPrefix = v5->_stepperPrefix;
      v5->_stepperPrefix = v17;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_13;
      objc_msgSend(v16, "localize");
      v19 = objc_claimAutoreleasedReturnValue();
      stepperPrefix = v5->_stepperPrefix;
      v5->_stepperPrefix = (NSString *)v19;
    }

LABEL_13:
    -[WFParameter definition](v5, "definition");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("StepperDescription"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v21;
      stepperDescription = v5->_stepperDescription;
      v5->_stepperDescription = v22;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_18:
        v25 = v5;

        goto LABEL_19;
      }
      objc_msgSend(v21, "localize");
      v24 = objc_claimAutoreleasedReturnValue();
      stepperDescription = v5->_stepperDescription;
      v5->_stepperDescription = (NSString *)v24;
    }

    goto LABEL_18;
  }
LABEL_19:

  return v5;
}

- (id)localizedLabelFormatString
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[WFStepperParameter stepperPrefix](self, "stepperPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFStepperParameter stepperPrefix](self, "stepperPrefix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(" %@"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("%@");
  }
  return v5;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFStepperParameter;
  -[WFParameter defaultSerializedRepresentation](&v8, sel_defaultSerializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFStepperParameter minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFNumberSubstitutableState serializedRepresentationFromNumber:](WFNumberSubstitutableState, "serializedRepresentationFromNumber:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)localizedLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[WFStepperParameter stepperDescription](self, "stepperDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)WFStepperParameter;
    -[WFParameter localizedLabel](&v8, sel_localizedLabel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)localizedLabelWithState:(id)a3 includingPrefix:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  objc_msgSend(v6, "variable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "number");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "integerValue");
    }
    else
    {
      -[WFStepperParameter minimumValue](self, "minimumValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v12, "integerValue");

    }
    -[WFParameter definition](self, "definition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("StepperNoun"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = 0;
        v8 = 0;
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v14, "localize");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v15, v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a4)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[WFStepperParameter localizedLabelFormatString](self, "localizedLabelFormatString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v20, v18);
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = v17;
    }

    goto LABEL_15;
  }
  -[WFStepperParameter localizedLabel](self, "localizedLabel");
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v8;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (NSString)stepperPrefix
{
  return self->_stepperPrefix;
}

- (NSString)stepperDescription
{
  return self->_stepperDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepperDescription, 0);
  objc_storeStrong((id *)&self->_stepperPrefix, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
