@implementation WFConditionalOperatorParameter

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)allowsMultipleValues
{
  return 0;
}

- (id)importQuestionBehavior
{
  __CFString *v2;

  v2 = CFSTR("NotSupported");
  return CFSTR("NotSupported");
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (void)setPossibleContentOperators:(id)a3 withContentType:(int64_t)a4 displayableTimeUnits:(unint64_t)a5 usingLegacyOperatorBehavior:(BOOL)a6
{
  NSArray *v10;
  NSArray *possibleContentOperators;

  v10 = (NSArray *)objc_msgSend(a3, "copy");
  possibleContentOperators = self->_possibleContentOperators;
  self->_possibleContentOperators = v10;

  self->_contentType = a4;
  self->_displayableTimeUnits = a5;
  self->_usingLegacyOperatorBehavior = a6;
  -[WFConditionalOperatorParameter possibleStatesDidChange](self, "possibleStatesDidChange");
}

- (void)possibleStatesDidChange
{
  NSArray *possibleStates;
  objc_super v4;

  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFConditionalOperatorParameter;
  -[WFEnumerationParameter possibleStatesDidChange](&v4, sel_possibleStatesDidChange);
}

- (NSArray)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    -[WFConditionalOperatorParameter possibleContentOperators](self, "possibleContentOperators");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "if_map:", &__block_literal_global_27335);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  __CFString *v20;

  v4 = a3;
  v5 = -[WFConditionalOperatorParameter contentType](self, "contentType");
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "number");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = -[WFConditionalOperatorParameter displayableTimeUnits](self, "displayableTimeUnits");
  v10 = 0;
  if (v8 > 99)
  {
    switch(v8)
    {
      case 999:
        v14 = CFSTR("does not contain");
        break;
      case 1000:
        v14 = CFSTR("is in the next");
        break;
      case 1001:
        v14 = CFSTR("is in the last");
        break;
      case 1002:
        v14 = CFSTR("is today");
        break;
      case 1003:
        v14 = CFSTR("is between");
        break;
      default:
        if (v8 == 100)
        {
          v14 = CFSTR("has any value");
        }
        else
        {
          if (v8 != 101)
            return v10;
          v14 = CFSTR("does not have any value");
        }
        break;
    }
  }
  else
  {
    switch(v8)
    {
      case 0:
        v11 = CFSTR("is before");
        v12 = CFSTR("is less than");
        if (v5 == 6)
          v12 = CFSTR("is smaller than");
        v13 = CFSTR("is shorter than");
        goto LABEL_24;
      case 1:
        v15 = CFSTR("is less than or equal to");
        if (v5 == 6)
          v15 = CFSTR("is smaller than or equal to");
        v16 = CFSTR("is shorter than or equal to");
        goto LABEL_32;
      case 2:
        v11 = CFSTR("is after");
        v12 = CFSTR("is greater than");
        if (v5 == 6)
          v12 = CFSTR("is larger than");
        v13 = CFSTR("is longer than");
LABEL_24:
        if (v5 == 7)
          v12 = v13;
        if (v5 == 4)
          v14 = (__CFString *)v11;
        else
          v14 = (__CFString *)v12;
        break;
      case 3:
        v15 = CFSTR("is greater than or equal to");
        if (v5 == 6)
          v15 = CFSTR("is larger than or equal to");
        v16 = CFSTR("is longer than or equal to");
LABEL_32:
        if (v5 == 7)
          v14 = (__CFString *)v16;
        else
          v14 = (__CFString *)v15;
        break;
      case 4:
        v17 = CFSTR("is");
        v18 = CFSTR("is exactly");
        if (v5 == 6)
          v17 = CFSTR("is exactly");
        v19 = CFSTR("is on");
        goto LABEL_41;
      case 5:
        v17 = CFSTR("is not");
        v18 = CFSTR("is not exactly");
        if (v5 == 6)
          v17 = CFSTR("is not exactly");
        v19 = CFSTR("is not on");
LABEL_41:
        if ((v9 & 0xE0) != 0)
          v20 = (__CFString *)v18;
        else
          v20 = (__CFString *)v19;
        if (v5 == 4)
          v14 = v20;
        else
          v14 = (__CFString *)v17;
        break;
      case 6:
      case 7:
        return v10;
      case 8:
        v14 = CFSTR("begins with");
        break;
      case 9:
        v14 = CFSTR("ends with");
        break;
      default:
        if (v8 != 99)
          return v10;
        v14 = CFSTR("contains");
        break;
    }
  }
  WFLocalizedString(v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

- (BOOL)parameterStateIsValid:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)WFConditionalOperatorParameter;
    v6 = -[WFEnumerationParameter parameterStateIsValid:](&v10, sel_parameterStateIsValid_, v4);
  }
  else
  {
    WFAllPossibleContentOperators();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "number");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8);

  }
  return v6;
}

- (NSArray)possibleContentOperators
{
  return self->_possibleContentOperators;
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (unint64_t)displayableTimeUnits
{
  return self->_displayableTimeUnits;
}

- (BOOL)usingLegacyOperatorBehavior
{
  return self->_usingLegacyOperatorBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleContentOperators, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

WFNumberSubstitutableState *__48__WFConditionalOperatorParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFNumberSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFNumberSubstitutableState initWithNumber:]([WFNumberSubstitutableState alloc], "initWithNumber:", v2);

  return v3;
}

@end
