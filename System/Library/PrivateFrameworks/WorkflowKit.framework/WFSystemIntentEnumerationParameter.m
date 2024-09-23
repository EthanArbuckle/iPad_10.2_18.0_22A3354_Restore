@implementation WFSystemIntentEnumerationParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFSystemIntentEnumerationParameter)initWithDefinition:(id)a3
{
  id v4;
  WFSystemIntentEnumerationParameter *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  INIntentSlotDescription *slotDescription;
  WFSystemIntentEnumerationParameter *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WFSystemIntentEnumerationParameter;
  v5 = -[WFEnumerationParameter initWithDefinition:](&v17, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("IntentType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("SlotName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    WFEnforceClass(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    INIntentSchemaGetIntentDescriptionWithType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "slotByName:", v11);
    v13 = objc_claimAutoreleasedReturnValue();
    slotDescription = v5->_slotDescription;
    v5->_slotDescription = (INIntentSlotDescription *)v13;

    v15 = v5;
  }

  return v5;
}

- (id)possibleStates
{
  NSArray *possibleStates;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  WFNumberSubstitutableState *v8;
  NSArray *v9;
  NSArray *v10;

  possibleStates = self->_possibleStates;
  if (!possibleStates)
  {
    v4 = (void *)objc_opt_new();
    v5 = 0;
    while (1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ++v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentSlotDescription localizeValue:forLanguage:](self->_slotDescription, "localizeValue:forLanguage:", v6, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "length"))
        break;
      v8 = -[WFNumberSubstitutableState initWithNumber:]([WFNumberSubstitutableState alloc], "initWithNumber:", v6);
      objc_msgSend(v4, "addObject:", v8);

      if (v5 == 0x7FFFFFFFFFFFFFFELL)
        goto LABEL_7;
    }

LABEL_7:
    v9 = (NSArray *)objc_msgSend(v4, "copy");
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "number");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[INIntentSlotDescription localizeValue:forLanguage:](self->_slotDescription, "localizeValue:forLanguage:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)alwaysShowsButton
{
  return 1;
}

- (INIntentSlotDescription)slotDescription
{
  return self->_slotDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotDescription, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

@end
