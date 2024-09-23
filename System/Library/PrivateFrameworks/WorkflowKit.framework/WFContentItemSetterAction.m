@implementation WFContentItemSetterAction

- (NSArray)properties
{
  void *v2;
  void *v3;
  void *v4;

  -[objc_class allProperties](-[WFAction contentItemClass](self, "contentItemClass"), "allProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = YES"), CFSTR("settable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredArrayUsingPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  -[WFAction definition](self, "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentItemSetterAction;
    -[WFAction localizedNameWithContext:](&v13, sel_localizedNameWithContext_, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLocalizedStringResourceWithKey(CFSTR("WFContentItemSetterAction - Action Name"), CFSTR("Edit %@"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "localize:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)parameterSummary
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  int v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  WFActionParameterSummaryValue *v26;
  WFActionParameterSummaryValue *v27;
  void *v28;
  WFActionParameterSummaryValue *v29;
  WFActionParameterSummaryValue *v30;
  void *v31;
  WFActionParameterSummaryValue *v32;
  WFActionParameterSummaryValue *v33;
  void *v34;
  WFActionParameterSummaryValue *v35;
  WFActionParameterSummaryValue *v36;
  void *v37;
  WFActionParameterSummaryValue *v38;
  WFActionParameterSummary *v39;
  id obj;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _QWORD v63[2];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__}"), CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__}"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__} as ${ValueLabel}"), CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput} to ${__PARAMETER__} as ${ValueLabel}"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput}"), CFSTR("${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput}"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput} as ${ValueLabel}"), CFSTR("${Mode} ${WFContentItemPropertyName} ${__PARAMETER__} to ${WFInput} as ${ValueLabel}"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_opt_new();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v51 = *MEMORY[0x1E0D14198];
  v2 = *MEMORY[0x1E0D14198];
  v52 = *MEMORY[0x1E0D141B0];
  v63[0] = *MEMORY[0x1E0D141B0];
  v63[1] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v59;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v59 != v42)
          objc_enumerationMutation(obj);
        v44 = v3;
        v4 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v3);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        -[WFContentItemSetterAction properties](self, "properties");
        v53 = (id)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v6; ++i)
            {
              if (*(_QWORD *)v55 != v7)
                objc_enumerationMutation(v53);
              v9 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_msgSend(v9, "allowedTransactionModes");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "containsObject:", v4);

              if (v11)
              {
                if (objc_msgSend(v9, "isLabeledValue") && (objc_msgSend(v4, "isEqual:", v51) & 1) != 0
                  || objc_msgSend((id)objc_msgSend(v9, "propertyClass"), "isEqual:", objc_opt_class()))
                {
                  v12 = 1;
                  v13 = CFSTR(",ValueLabel");
                }
                else
                {
                  v12 = 0;
                  v13 = &stru_1E7AFA810;
                }
                if (objc_msgSend(v4, "isEqual:", v52))
                {
                  v14 = (void *)MEMORY[0x1E0CB3940];
                  -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v9);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v14, "stringWithFormat:", CFSTR("Mode(Set),WFContentItemPropertyName,WFInput,%@%@"), v15, v13);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v12)
                    v17 = v47;
                  else
                    v17 = v48;
                  objc_msgSend(v17, "localize");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v9);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__PARAMETER__"), v19);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  if (!objc_msgSend(v4, "isEqual:", v51))
                    continue;
                  v21 = (void *)MEMORY[0x1E0CB3940];
                  -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v9);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "stringWithFormat:", CFSTR("Mode(Append),WFInput,WFContentItemPropertyName,%@%@"), v22, v13);
                  v16 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v12)
                    v23 = v45;
                  else
                    v23 = v46;
                  objc_msgSend(v23, "localize");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v9);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__PARAMETER__"), v25);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();

                }
                v26 = -[WFActionParameterSummaryValue initWithKey:localizedSummaryString:]([WFActionParameterSummaryValue alloc], "initWithKey:localizedSummaryString:", v16, v20);
                objc_msgSend(v49, "addObject:", v26);

              }
            }
            v6 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
          }
          while (v6);
        }

        v3 = v44 + 1;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    }
    while (v43);
  }

  v27 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput}"), CFSTR("${Mode} ${WFContentItemPropertyName} of ${WFInput}"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v27, "initWithKey:summaryString:", CFSTR("Mode,WFContentItemPropertyName,WFInput"), v28);
  objc_msgSend(v49, "addObject:", v29);

  v30 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${RemoveSpecifiedValue} ${WFContentItemPropertyName} from ${WFInput}"), CFSTR("${Mode} ${RemoveSpecifiedValue} ${WFContentItemPropertyName} from ${WFInput}"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v30, "initWithKey:summaryString:", CFSTR("Mode(Remove),RemoveSpecifiedValue,WFContentItemPropertyName,WFInput"), v31);
  objc_msgSend(v49, "addObject:", v32);

  v33 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} from ${WFInput}"), CFSTR("${Mode} ${WFContentItemPropertyName} from ${WFInput}"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v33, "initWithKey:summaryString:", CFSTR("Mode(Remove),WFContentItemPropertyName,WFInput"), v34);
  objc_msgSend(v49, "addObject:", v35);

  v36 = [WFActionParameterSummaryValue alloc];
  WFLocalizedStringResourceWithKey(CFSTR("${Mode} ${WFContentItemPropertyName} from ${WFInput}"), CFSTR("${Mode} ${WFContentItemPropertyName} from ${WFInput}"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[WFActionParameterSummaryValue initWithKey:summaryString:](v36, "initWithKey:summaryString:", CFSTR("Mode(RemoveAll),WFContentItemPropertyName,WFInput"), v37);
  objc_msgSend(v49, "addObject:", v38);

  v39 = -[WFActionParameterSummary initWithValues:]([WFActionParameterSummary alloc], "initWithValues:", v49);
  return v39;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v5, "lowercaseString");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedStringResourceWithKey(CFSTR("Sets a specific field of the %@ passed into the action."), CFSTR("Sets a specific field of the %@ passed into the action."));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localize:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFContentItemSetterAction;
  v3 = a3;
  -[WFAction localizedKeywordsWithContext:](&v10, sel_localizedKeywordsWithContext_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedStringResourceWithKey(CFSTR("property|properties|add|update"), CFSTR("property|properties|add|update"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v5, v10.receiver, v10.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)inputParameterKey
{
  return CFSTR("WFInput");
}

- (id)outputContentClasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = -[WFAction contentItemClass](self, "contentItemClass");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WFContentProperty)selectedProperty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[WFAction isRunning](self, "isRunning")
    && (-[WFAction processedParameters](self, "processedParameters"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFContentItemPropertyName"), objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemPropertyName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[objc_class propertyForName:](-[WFAction contentItemClass](self, "contentItemClass"), "propertyForName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (WFContentProperty *)v6;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Edited %@"), CFSTR("Edited %@"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localize:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)inputsMultipleItems
{
  return 0;
}

- (BOOL)outputsMultipleItems
{
  return 0;
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFContentItemSetterAction;
  -[WFAction initializeParameters](&v6, sel_initializeParameters);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("Mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("WFContentItemPropertyName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDataSource:", self);
  -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ValueLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setDataSource:", self);
  }

  -[WFContentItemSetterAction setPromptForSelectedParameter](self, "setPromptForSelectedParameter");
}

- (id)parameterKeyForProperty:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[objc_class description](-[WFAction contentItemClass](self, "contentItemClass"), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E7AFA810);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)requiredResourceForProperty:(id)a3
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v18[0] = CFSTR("WFContentItemPropertyName");
  v17[0] = CFSTR("WFParameterKey");
  v17[1] = CFSTR("WFParameterValue");
  objc_msgSend(a3, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v3;
  v17[2] = CFSTR("WFResourceClass");
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  v16[0] = CFSTR("Mode");
  v15[0] = CFSTR("WFParameterKey");
  v15[1] = CFSTR("WFParameterValues");
  v7 = *MEMORY[0x1E0D14198];
  v14[0] = *MEMORY[0x1E0D141B0];
  v14[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("WFResourceClass");
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  WFStringSubstitutableState *v11;
  WFAskEachTimeVariable *v12;
  WFStringSubstitutableState *v13;
  void *v14;
  void *v15;
  WFStringSubstitutableState *v16;
  void *v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)WFContentItemSetterAction;
  v7 = -[WFAction setParameterState:forKey:](&v19, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFContentItemPropertyName")))
  {
    -[WFAction outputDetailsUpdated](self, "outputDetailsUpdated");
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Mode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "variable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v11 = [WFStringSubstitutableState alloc];
      v12 = objc_alloc_init(WFAskEachTimeVariable);
      v13 = -[WFVariableSubstitutableParameterState initWithVariable:](v11, "initWithVariable:", v12);
    }
    else
    {
      -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredTransactionModeWithCurrentMode:", v15);
      v12 = (WFAskEachTimeVariable *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[WFContentItemSetterAction setParameterState:forKey:](self, "setParameterState:forKey:", 0, CFSTR("Mode"));
        goto LABEL_8;
      }
      v13 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v12);
    }
    v16 = v13;
    -[WFContentItemSetterAction setParameterState:forKey:](self, "setParameterState:forKey:", v13, CFSTR("Mode"));

LABEL_8:
    -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("Mode"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "reloadPossibleStates");

  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WFContentItemPropertyName")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("Mode")))
  {
    -[WFContentItemSetterAction setPromptForSelectedParameter](self, "setPromptForSelectedParameter");
  }

  return v7;
}

- (id)parameterDefinitions
{
  void *v3;
  uint64_t v4;
  void *v5;
  WFParameterDefinition *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WFParameterDefinition *v15;
  WFParameterDefinition *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  WFParameterDefinition *v27;
  WFParameterDefinition *v28;
  objc_class *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  WFParameterDefinition *v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  objc_class *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  WFParameterDefinition *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  WFParameterDefinition *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t *v72;
  WFParameterDefinition *v73;
  objc_class *v74;
  void *v75;
  uint64_t v76;
  objc_class *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  objc_class *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  WFParameterDefinition *v86;
  void *v87;
  objc_class *v88;
  void *v89;
  objc_class *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  objc_class *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  WFParameterDefinition *v100;
  void *v102;
  void *v103;
  WFParameterDefinition *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  WFParameterDefinition *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _QWORD v125[2];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[2];
  _QWORD v131[7];
  _QWORD v132[7];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[2];
  _QWORD v138[5];
  _QWORD v139[5];
  _BYTE v140[128];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[2];
  _QWORD v146[5];
  _QWORD v147[5];
  _QWORD v148[4];
  _QWORD v149[4];
  const __CFString *v150;
  _QWORD v151[6];
  _QWORD v152[6];
  const __CFString *v153;
  _QWORD v154[5];
  _QWORD v155[7];

  v155[5] = *MEMORY[0x1E0C80C00];
  -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v3, "lowercaseString");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = (void *)objc_opt_new();
  v6 = [WFParameterDefinition alloc];
  v154[0] = CFSTR("Class");
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v155[0] = v8;
  v155[1] = CFSTR("WFContentItemPropertyName");
  v154[1] = CFSTR("Key");
  v154[2] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Detail (ContentItemSetter)"), CFSTR("Detail"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v155[2] = v9;
  v154[3] = CFSTR("DisallowedVariableTypes");
  v153 = CFSTR("Variable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v153, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v155[3] = v10;
  v154[4] = CFSTR("Description");
  v11 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The property of the %@ to edit."));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v12, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v155[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, v154, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[WFParameterDefinition initWithDictionary:](v6, "initWithDictionary:", v14);
  objc_msgSend(v5, "addObject:", v15);

  v16 = [WFParameterDefinition alloc];
  v151[0] = CFSTR("Class");
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v152[0] = v18;
  v152[1] = CFSTR("Mode");
  v151[1] = CFSTR("Key");
  v151[2] = CFSTR("Description");
  v19 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The operation to perform on the selected property of the %@."));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v113 = v3;
  v102 = v3;
  v21 = v5;
  objc_msgSend(v19, "localizedStringWithFormat:", v20, v102);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v152[2] = v22;
  v151[3] = CFSTR("DisallowedVariableTypes");
  v150 = CFSTR("Variable");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v150, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v152[3] = v23;
  v151[4] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Edit (ContentItemSetter)"), CFSTR("Edit"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v151[5] = CFSTR("DefaultValue");
  v25 = *MEMORY[0x1E0D141B0];
  v152[4] = v24;
  v152[5] = v25;
  v105 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[WFParameterDefinition initWithDictionary:](v16, "initWithDictionary:", v26);
  objc_msgSend(v5, "addObject:", v27);

  -[WFContentItemSetterAction inputParameterKey](self, "inputParameterKey");
  v120 = objc_claimAutoreleasedReturnValue();
  if (v120)
  {
    v28 = [WFParameterDefinition alloc];
    v148[0] = CFSTR("Class");
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v149[0] = v30;
    v149[1] = v120;
    v148[1] = CFSTR("Key");
    v148[2] = CFSTR("Label");
    -[objc_class localizedFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedFilterDescription");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (v31)
      v33 = (const __CFString *)v31;
    else
      v33 = &stru_1E7AFA810;
    v149[2] = v33;
    v148[3] = CFSTR("Placeholder");
    -[objc_class localizedFilterDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedFilterDescription");
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = (void *)v34;
    if (v34)
      v36 = (const __CFString *)v34;
    else
      v36 = &stru_1E7AFA810;
    v149[3] = v36;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v149, v148, 4);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = -[WFParameterDefinition initWithDictionary:](v28, "initWithDictionary:", v37);
    objc_msgSend(v5, "addObject:", v38);

  }
  v114 = [WFParameterDefinition alloc];
  v146[0] = CFSTR("Class");
  v39 = (objc_class *)objc_opt_class();
  NSStringFromClass(v39);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v118;
  v147[1] = CFSTR("RemoveSpecifiedValue");
  v146[1] = CFSTR("Key");
  v146[2] = CFSTR("Label");
  WFLocalizedStringResourceWithKey(CFSTR("Specified (ContentItemSetter)"), CFSTR("Specified"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v147[2] = v116;
  v146[3] = CFSTR("Description");
  v40 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("The value to remove from the selected property of the %@. If no value is provided, one will be requested when run."));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "localizedStringWithFormat:", v110, v113);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v147[3] = v108;
  v146[4] = CFSTR("RequiredResources");
  v143[0] = CFSTR("WFParameterKey");
  v143[1] = CFSTR("WFParameterValue");
  v41 = *MEMORY[0x1E0D141A0];
  v144[0] = CFSTR("Mode");
  v144[1] = v41;
  v143[2] = CFSTR("WFResourceClass");
  v42 = (objc_class *)objc_opt_class();
  NSStringFromClass(v42);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v106;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v43;
  v142[0] = CFSTR("WFContentItemPropertyName");
  v141[0] = CFSTR("WFParameterKey");
  v141[1] = CFSTR("WFParameterValues");
  -[WFContentItemSetterAction properties](self, "properties");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "if_compactMap:", &__block_literal_global_29611);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v45;
  v141[2] = CFSTR("WFResourceClass");
  v46 = (objc_class *)objc_opt_class();
  NSStringFromClass(v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v145, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v147[4] = v49;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v147, v146, 5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = -[WFParameterDefinition initWithDictionary:](v114, "initWithDictionary:", v50);
  v115 = v21;
  objc_msgSend(v21, "addObject:", v51);

  v52 = (void *)objc_opt_new();
  v119 = (void *)objc_opt_new();
  v117 = (void *)objc_opt_new();
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  -[WFContentItemSetterAction properties](self, "properties");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
  v55 = (void *)v120;
  if (v54)
  {
    v56 = v54;
    v57 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v122 != v57)
          objc_enumerationMutation(v53);
        v59 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * i);
        -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "valueForKey:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v61)
        {
          v62 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v59, "parameterDefinition");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "dictionaryWithDictionary:", v63);
          v64 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "setObject:forKeyedSubscript:", v60, CFSTR("Key"));
          -[WFContentItemSetterAction requiredResourceForProperty:](self, "requiredResourceForProperty:", v59);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKeyedSubscript:", v65, CFSTR("RequiredResources"));

          v66 = -[WFParameterDefinition initWithDictionary:]([WFParameterDefinition alloc], "initWithDictionary:", v64);
          objc_msgSend(v52, "setObject:forKeyedSubscript:", v66, v60);

          if (objc_msgSend(v59, "isLabeledValue"))
          {
            objc_msgSend(v59, "name");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v119, "addObject:", v67);

          }
          if (objc_msgSend((id)objc_msgSend(v59, "propertyClass"), "isEqual:", objc_opt_class()))
          {
            objc_msgSend(v59, "name");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "addObject:", v68);

          }
          v55 = (void *)v120;
        }

      }
      v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v121, v140, 16);
    }
    while (v56);
  }

  objc_msgSend(v52, "allValues");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v115, "addObjectsFromArray:", v69);

  v70 = v119;
  v71 = objc_msgSend(v119, "count");
  v72 = (uint64_t *)MEMORY[0x1E0D14198];
  if (v71)
  {
    v73 = [WFParameterDefinition alloc];
    v138[0] = CFSTR("Class");
    v74 = (objc_class *)objc_opt_class();
    NSStringFromClass(v74);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v139[0] = v111;
    v139[1] = CFSTR("ValueLabel");
    v138[1] = CFSTR("Key");
    v138[2] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("Label (ContentItemSetter)"), CFSTR("Label"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *MEMORY[0x1E0DC8320];
    v139[2] = v75;
    v139[3] = v76;
    v138[3] = CFSTR("AutocapitalizationType");
    v138[4] = CFSTR("RequiredResources");
    v135[0] = CFSTR("WFParameterKey");
    v135[1] = CFSTR("WFParameterValues");
    v136[0] = CFSTR("WFContentItemPropertyName");
    v136[1] = v119;
    v135[2] = CFSTR("WFResourceClass");
    v77 = (objc_class *)objc_opt_class();
    NSStringFromClass(v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v136[2] = v78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 3);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v137[0] = v79;
    v133[0] = CFSTR("WFParameterKey");
    v133[1] = CFSTR("WFParameterValue");
    v80 = *MEMORY[0x1E0D14198];
    v134[0] = CFSTR("Mode");
    v134[1] = v80;
    v133[2] = CFSTR("WFResourceClass");
    v81 = (objc_class *)objc_opt_class();
    NSStringFromClass(v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v134[2] = v82;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 3);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v137[1] = v83;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v137, 2);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v139[4] = v84;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v139, v138, 5);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = -[WFParameterDefinition initWithDictionary:](v73, "initWithDictionary:", v85);
    objc_msgSend(v115, "addObject:", v86);

    v72 = (uint64_t *)MEMORY[0x1E0D14198];
    v55 = (void *)v120;

    v70 = v119;
  }
  v87 = v117;
  if (objc_msgSend(v117, "count"))
  {
    v104 = [WFParameterDefinition alloc];
    v131[0] = CFSTR("Class");
    v88 = (objc_class *)objc_opt_class();
    NSStringFromClass(v88);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v132[0] = v112;
    v132[1] = CFSTR("ValueLabel");
    v131[1] = CFSTR("Key");
    v131[2] = CFSTR("Label");
    WFLocalizedStringResourceWithKey(CFSTR("Role (ContentItemSetter)"), CFSTR("Role"));
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v132[2] = v109;
    v131[3] = CFSTR("OnDisplayName");
    WFLocalizedStringResourceWithKey(CFSTR("Required (ContentItemSetterRole)"), CFSTR("Required"));
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v132[3] = v107;
    v131[4] = CFSTR("OffDisplayName");
    WFLocalizedStringResourceWithKey(CFSTR("Optional (ContentItemSetterRole)"), CFSTR("Optional"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v132[4] = v103;
    v131[5] = CFSTR("DefaultValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v132[5] = v89;
    v131[6] = CFSTR("RequiredResources");
    v128[0] = CFSTR("WFParameterKey");
    v128[1] = CFSTR("WFParameterValues");
    v129[0] = CFSTR("WFContentItemPropertyName");
    v129[1] = v117;
    v128[2] = CFSTR("WFResourceClass");
    v90 = (objc_class *)objc_opt_class();
    NSStringFromClass(v90);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v129[2] = v91;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v130[0] = v92;
    v127[0] = CFSTR("Mode");
    v126[0] = CFSTR("WFParameterKey");
    v126[1] = CFSTR("WFParameterValues");
    v93 = *v72;
    v125[0] = v105;
    v125[1] = v93;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v125, 2);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v127[1] = v94;
    v126[2] = CFSTR("WFResourceClass");
    v95 = (objc_class *)objc_opt_class();
    NSStringFromClass(v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v127[2] = v96;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 3);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v130[1] = v97;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v130, 2);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v132[6] = v98;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 7);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = -[WFParameterDefinition initWithDictionary:](v104, "initWithDictionary:", v99);
    objc_msgSend(v115, "addObject:", v100);

    v87 = v117;
    v55 = (void *)v120;

    v70 = v119;
  }

  return v115;
}

- (void)setPromptForSelectedParameter
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Mode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v24 = v3;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v3 = v24;
    if ((isKindOfClass & 1) != 0)
    {
      -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction parameterForKey:](self, "parameterForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", *MEMORY[0x1E0D14198]);

      if (v9)
      {
        objc_msgSend(v5, "singularItemName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v5, "localizedSingularItemName");
        else
          objc_msgSend(v5, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v5, "canLowercaseName"))
        {
          objc_msgSend(v11, "localizedLowercaseString");
          v18 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v18;
        }
        v19 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("What %@ do you want to add?"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringWithFormat:", v20, v11);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLocalizedPrompt:", v21);

        -[WFAction parameterForKey:](self, "parameterForKey:", CFSTR("ValueLabel"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v16)
          goto LABEL_18;
        v22 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("What label do you want for the %@?"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "localizedStringWithFormat:", v17, v11);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setLocalizedPrompt:", v23);

      }
      else
      {
        objc_msgSend(v5, "localizedName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "canLowercaseName"))
        {
          objc_msgSend(v11, "localizedLowercaseString");
          v12 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v12;
        }
        v13 = objc_msgSend(v5, "multipleValues");
        v14 = (void *)MEMORY[0x1E0CB3940];
        if (v13)
          v15 = CFSTR("What %@ do you want to set? (Plural)");
        else
          v15 = CFSTR("What %@ do you want to set? (Singular)");
        WFLocalizedStringWithKey(v15, CFSTR("What %@ do you want to set?"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "localizedStringWithFormat:", v16, v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLocalizedPrompt:", v17);
      }

LABEL_18:
      v3 = v24;
    }
  }

}

- (id)displayStringForTransactionModeState:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  void *v10;
  int v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0D14198]);

  if (v5)
  {
    WFLocalizedStringWithKey(CFSTR("Add (WFContentItemChangeTransactionMode)"), CFSTR("Add"));
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *MEMORY[0x1E0D141A0]);

    if (v8)
    {
      v9 = CFSTR("Remove");
    }
    else
    {
      objc_msgSend(v3, "value");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqual:", *MEMORY[0x1E0D141A8]);

      if (v11)
        v9 = CFSTR("Remove All");
      else
        v9 = CFSTR("Set");
    }
    WFLocalizedString(v9);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v6;

  return v12;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("WFContentItemPropertyName"));

  if (!v6)
  {
    objc_msgSend(v4, "key");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", CFSTR("ValueLabel"));

    if (v10)
    {
      -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "possibleLabels");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "if_map:", &__block_literal_global_304);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFContentItemPropertyName"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "variable");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v8 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_9;
      }
      -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allowedTransactionModes");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allObjects");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "if_map:", &__block_literal_global_306);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_9;
  }
  -[WFContentItemSetterAction properties](self, "properties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_302);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("WFContentItemPropertyName"));

  if (v9)
  {
    -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Mode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFAction contentItemClass](self, "contentItemClass");
    objc_msgSend(v7, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class propertyForName:](v11, "propertyForName:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v22 = 0;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v10, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0D14198]) & 1) != 0)
    {
      objc_msgSend(v13, "singularItemName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v13, "localizedSingularItemName");
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v22 = (void *)v16;
        goto LABEL_14;
      }
    }
    else
    {

    }
    objc_msgSend(v13, "localizedName");
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(v6, "key");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", CFSTR("ValueLabel"));

  if (v18)
  {
    objc_msgSend(v7, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      v20 = (void *)MEMORY[0x1E0D13E80];
      objc_msgSend(v7, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForLabel:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    -[WFContentItemSetterAction displayStringForTransactionModeState:](self, "displayStringForTransactionModeState:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_15:

  return v22;
}

- (BOOL)enumerationShouldProvideValuesForParameterSummaryLocalization:(id)a3
{
  return 0;
}

- (id)changeTransactionWithInput:(id)a3
{
  return (id)objc_msgSend(a3, "changeTransaction");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD aBlock[5];
  id v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    goto LABEL_17;
  }
  objc_msgSend(v4, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFAction contentItemClass](self, "contentItemClass");
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
      {
        objc_msgSend(v8, "localizedLowercaseString");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
      }
      -[WFContentItemSetterAction changeTransactionWithInput:](self, "changeTransactionWithInput:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v22 = (void *)MEMORY[0x1E0C99E08];
        v40 = *MEMORY[0x1E0CB2D68];
        v23 = (void *)MEMORY[0x1E0CB3940];
        WFLocalizedString(CFSTR("The provided %@ cannot be edited."));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v24, v8);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "dictionaryWithDictionary:", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[objc_class isEqual:](-[WFAction contentItemClass](self, "contentItemClass"), "isEqual:", objc_opt_class()))
        {
          WFLocalizedString(CFSTR("Please use the Select Contact or Find Contacts action instead to provide a contact."));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CB2D50]);

        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 6, v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v28);

        goto LABEL_26;
      }
      -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Mode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMode:", v12);

      v13 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke;
      aBlock[3] = &unk_1E7AF0B88;
      aBlock[4] = self;
      v14 = v10;
      v39 = v14;
      v15 = _Block_copy(aBlock);
      objc_msgSend(v14, "mode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "isEqual:", *MEMORY[0x1E0D141A0]) & 1) != 0)
      {
        -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "multipleValues");

        v13 = MEMORY[0x1E0C809B0];
        if (v18)
        {
          -[WFAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("RemoveSpecifiedValue"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("RemoveSpecifiedValue"), objc_opt_class());
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_10;
            v33[3] = &unk_1E7AF0C10;
            v34 = v15;
            -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "getObjectRepresentations:forClass:", v33, objc_msgSend(v21, "propertyClass"));

          }
          else
          {
            -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_4;
            v35[3] = &unk_1E7AF0C38;
            v35[4] = self;
            v36 = v8;
            v37 = v15;
            objc_msgSend(v29, "getValuesForObject:completionHandler:", v7, v35);

          }
          goto LABEL_25;
        }
      }
      else
      {

      }
      v30[0] = v13;
      v30[1] = 3221225472;
      v30[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_11;
      v30[3] = &unk_1E7AF1568;
      v30[4] = self;
      v32 = v15;
      v31 = v7;
      -[WFContentItemSetterAction userValueForSelectedPropertyWithCompletion:](self, "userValueForSelectedPropertyWithCompletion:", v30);

LABEL_25:
LABEL_26:

      goto LABEL_15;
    }
  }
  else
  {

    v7 = 0;
  }
  -[WFAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_15:

LABEL_17:
}

- (void)userValueForSelectedPropertyWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  WFContentItemSetterAction *v19;
  id v20;

  v4 = a3;
  -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAction parameterForKey:](self, "parameterForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAction processedParameters](self, "processedParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v9, "wf_isEmpty"))
    && (objc_msgSend(v7, "supportedVariableTypes"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "containsObject:", CFSTR("Ask")),
        v10,
        (v11 & 1) != 0))
  {
    -[WFAction userInterface](self, "userInterface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isRunningWithSiriUI");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "wfUnsupportedUserInterfaceError");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction finishRunningWithError:](self, "finishRunningWithError:", v14);

    }
    else
    {
      -[WFContentItemSetterAction setParameterState:forKey:](self, "setParameterState:forKey:", 0, v6);
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithObject:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__WFContentItemSetterAction_userValueForSelectedPropertyWithCompletion___block_invoke;
      v17[3] = &unk_1E7AF0C88;
      v18 = v6;
      v19 = self;
      v20 = v4;
      -[WFAction askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:](self, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v15, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], 0, v16, v17);

    }
  }
  else
  {
    (*((void (**)(id, void *))v4 + 2))(v4, v9);
  }

}

- (void)presentAlertWithUserInterface:(id)a3 input:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v34 = v8;
  objc_msgSend(v8, "items");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class localizedTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "localizedTypeDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[objc_class canLowercaseTypeDescription](-[WFAction contentItemClass](self, "contentItemClass"), "canLowercaseTypeDescription"))
  {
    objc_msgSend(v11, "localizedLowercaseString");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0D13DE0], "alertWithPreferredStyle:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  WFLocalizedString(CFSTR("Choose the %@ to remove from the %@."));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lowercaseString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v18, v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v19);

  v20 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke;
  v44[3] = &unk_1E7AF0CB0;
  v21 = v10;
  v45 = v21;
  v22 = v13;
  v46 = v22;
  objc_msgSend(v36, "if_compactMap:", v44);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v41;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v41 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v22, "addButton:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v27++));
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v25);
  }
  objc_msgSend(MEMORY[0x1E0D13DE8], "cancelButtonWithTarget:action:", self, sel_cancel);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", v28);

  v29 = (void *)MEMORY[0x1E0D13DE8];
  WFLocalizedString(CFSTR("Done"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v20;
  v37[1] = 3221225472;
  v37[2] = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_3;
  v37[3] = &unk_1E7AF76F0;
  v38 = v23;
  v39 = v9;
  v31 = v9;
  v32 = v23;
  objc_msgSend(v29, "buttonWithTitle:style:preferred:handler:", v30, 0, 1, v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addButton:", v33);

  objc_msgSend(v35, "presentAlert:", v22);
}

- (id)setAdditionalPropertyIfNecessaryForValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (void *)MEMORY[0x1E0D14048];
    v6 = v4;
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFAction processedParameters](self, "processedParameters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("ValueLabel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumberWithPhoneNumberString:contactName:label:", v7, v8, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0D13F58];
      objc_msgSend(v4, "address");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAction processedParameters](self, "processedParameters");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("ValueLabel"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addressWithEmailAddress:label:", v13, v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v4;
          -[WFAction processedParameters](self, "processedParameters");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectForKey:", CFSTR("ValueLabel"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "BOOLValue");
          v22 = 1;
          if (!v21)
            v22 = 2;
          v42 = v22;

          v41 = objc_alloc(MEMORY[0x1E0D14038]);
          objc_msgSend(v18, "URL");
          v40 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "emailAddress");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v18, "status");
          v26 = objc_msgSend(v18, "type");
          objc_msgSend(v18, "sourceIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v18, "isManaged");
          v29 = objc_msgSend(v18, "isCurrentUser");
          objc_msgSend(v18, "contactPredicate");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          BYTE1(v39) = v29;
          LOBYTE(v39) = v28;
          v31 = (void *)v40;
          v11 = (id)objc_msgSend(v41, "initWithURL:name:emailAddress:status:role:type:sourceIdentifier:isManaged:isCurrentUser:contactPredicate:", v40, v23, v24, v25, v42, v26, v27, v39, v30);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_17;
          -[WFContentItemSetterAction selectedProperty](self, "selectedProperty");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContentItemSetterAction parameterKeyForProperty:](self, "parameterKeyForProperty:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v33, objc_opt_class());
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
LABEL_17:
            v11 = v4;
            goto LABEL_8;
          }
          objc_msgSend(MEMORY[0x1E0D13F28], "detectedDatesInString:error:", v31, 0);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v34) = objc_msgSend(v35, "timeIsSignificant");
          objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v36;
          if ((_DWORD)v34)
          {
            objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "componentsInTimeZone:fromDate:", v38, v4);
            v11 = (id)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v36, "components:fromDate:", 30, v4);
            v11 = (id)objc_claimAutoreleasedReturnValue();
          }

        }
        goto LABEL_8;
      }
      v16 = v4;
      -[WFAction processedParameters](self, "processedParameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("ValueLabel"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "streetAddressWithLabel:", v14);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_8:

  return v11;
}

- (id)appContentDestinationForSystemAppBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CBD728];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resolvedAppMatchingDescriptor:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D13E00], "locationWithAppDescriptor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  _QWORD *v4;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (-[objc_class isEqual:](-[WFAction contentItemClass](self, "contentItemClass", a3), "isEqual:", objc_opt_class()))
  {
    v4 = (_QWORD *)MEMORY[0x1E0DC7EA0];
LABEL_7:
    -[WFContentItemSetterAction appContentDestinationForSystemAppBundleIdentifier:](self, "appContentDestinationForSystemAppBundleIdentifier:", *v4);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (-[objc_class isEqual:](-[WFAction contentItemClass](self, "contentItemClass"), "isEqual:", objc_opt_class()))
  {
    v4 = (_QWORD *)MEMORY[0x1E0DC7E90];
    goto LABEL_7;
  }
  if (-[objc_class isEqual:](-[WFAction contentItemClass](self, "contentItemClass"), "isEqual:", objc_opt_class()))
  {
    v4 = (_QWORD *)MEMORY[0x1E0DC7F38];
    goto LABEL_7;
  }
  getWFSecurityLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    NSStringFromClass(-[WFAction contentItemClass](self, "contentItemClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[WFContentItemSetterAction contentDestinationWithError:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1C15B3000, v6, OS_LOG_TYPE_FAULT, "%s Missing a contentDestination for %@", (uint8_t *)&v8, 0x16u);

  }
  return 0;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to edit %2$@?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t v16;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "containsIndex:", a3);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_2;
  v14 = &unk_1E7AF7440;
  v15 = *(id *)(a1 + 40);
  v16 = a3;
  v8 = _Block_copy(&v11);
  objc_msgSend(MEMORY[0x1E0D13E90], "buttonWithContentItem:selected:stickySelection:handler:", v6, v7, 1, v8, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSelected", (_QWORD)v12))
        {
          objc_msgSend(v8, "contentItem");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

}

void __76__WFContentItemSetterAction_presentAlertWithUserInterface_input_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v9 = 136315906;
      v10 = "WFEnforceClass";
      v11 = 2114;
      v12 = v5;
      v13 = 2114;
      v14 = (id)objc_opt_class();
      v15 = 2114;
      v16 = v4;
      v8 = v14;
      _os_log_impl(&dword_1C15B3000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v9, 0x2Au);

    }
    v6 = 0;
  }
  else
  {
    v6 = v5;
  }

  objc_msgSend(v6, "setSelected:", objc_msgSend(v6, "isSelected") ^ 1);
}

void __72__WFContentItemSetterAction_userValueForSelectedPropertyWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(*(id *)(a1 + 40), "processedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setProcessedParameters:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "selectedProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_1E7AF5958;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  objc_msgSend(v5, "updateWithValue:withTransaction:completion:", v4, v8, v7);

}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D13EA8];
  objc_msgSend(a2, "if_compactMap:", &__block_literal_global_324);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionWithItems:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "selectedProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend((id)objc_msgSend(v6, "propertyClass"), "isEqual:", objc_opt_class());

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0D13EA8];
    objc_msgSend(v5, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_objectsPassingTest:", &__block_literal_global_327);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionWithItems:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
  }
  objc_msgSend(v5, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  v14 = *(void **)(a1 + 32);
  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_7;
    v25[3] = &unk_1E7AF5120;
    v25[4] = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 48);
    objc_msgSend(v14, "presentAlertWithUserInterface:input:completion:", v15, v5, v25);

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2D50];
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "selectedProperty");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedLowercaseString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("There are no %@ to remove from the %@."), v20, *(_QWORD *)(a1 + 40));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("WFActionErrorDomain"), 6, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "finishRunningWithError:", v24);

  }
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_11(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v3);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = (void *)v4;
        if (v4)
          v6 = (void *)v4;
        else
          v6 = v3;
        v7 = v6;

        v3 = v7;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1[4], "selectedProperty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend((id)objc_msgSend(v8, "propertyClass"), "isEqual:", objc_opt_class());

    if (v9)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_12;
      v32[3] = &unk_1E7AF6C78;
      v33 = a1[6];
      objc_msgSend(v3, "getFileRepresentations:forType:", v32, 0);
      v10 = v33;
    }
    else
    {
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_13;
      v29[3] = &unk_1E7AF3258;
      v13 = a1[6];
      v30 = a1[4];
      v31 = v13;
      objc_msgSend(v30, "selectedProperty");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "getObjectRepresentations:forClass:", v29, objc_msgSend(v14, "propertyClass"));

      v10 = v31;
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_15;
    v26[3] = &unk_1E7AF0C60;
    v11 = a1[6];
    v27 = a1[4];
    v28 = v11;
    objc_msgSend(v27, "selectedProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getObjectRepresentation:forClass:", v26, objc_msgSend(v12, "propertyClass"));

    v10 = v28;
LABEL_14:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1[4], "selectedProperty");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend((id)objc_msgSend(v15, "propertyClass"), "isEqual:", objc_opt_class());

    if (v16)
    {
      objc_msgSend(v3, "unitString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = +[WFDurationQuantityFieldParameter calendarUnitFromUnitString:](WFDurationQuantityFieldParameter, "calendarUnitFromUnitString:", v17);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1[5], "event");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "magnitude");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateByAddingUnit:value:toDate:options:", v18, objc_msgSend(v22, "integerValue"), v20, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v23, "timeIntervalSinceDate:", v20);
      objc_msgSend(v24, "numberWithDouble:");
      v25 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v25;
    }
  }
  (*((void (**)(void))a1[6] + 2))();
LABEL_22:

}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_14;
  v4[3] = &unk_1E7AF7718;
  v2 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "if_map:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "setAdditionalPropertyIfNecessaryForValue:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_14(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdditionalPropertyIfNecessaryForValue:", a2);
}

void __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "selectedProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)objc_msgSend(v4, "propertyClass"), "isEqual:", objc_opt_class());

  if (v5)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_8;
    v10[3] = &unk_1E7AF6C78;
    v6 = &v11;
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v3, "getFileRepresentations:forType:", v10, 0);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9;
    v8[3] = &unk_1E7AF0C10;
    v6 = &v9;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "selectedProperty", v8[0], 3221225472, __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9, &unk_1E7AF0C10, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getObjectRepresentations:forClass:", v8, objc_msgSend(v7, "propertyClass"));

  }
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "participant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCurrentUser") ^ 1;

  return v3;
}

id __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithFile:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D13EC0], "itemWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v4[5];

  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_3;
  v4[3] = &unk_1E7AF0B60;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "saveWithCompletionHandler:isNew:", v4, 0);
}

uint64_t __56__WFContentItemSetterAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "output");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addItem:", v4);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;

  v2 = a2;
  v3 = -[WFVariableSubstitutableParameterState initWithValue:]([WFStringSubstitutableState alloc], "initWithValue:", v2);

  return v3;
}

WFStringSubstitutableState *__58__WFContentItemSetterAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WFStringSubstitutableState *v3;
  void *v4;
  WFStringSubstitutableState *v5;

  v2 = a2;
  v3 = [WFStringSubstitutableState alloc];
  objc_msgSend(v2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[WFVariableSubstitutableParameterState initWithValue:](v3, "initWithValue:", v4);
  return v5;
}

id __49__WFContentItemSetterAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "multipleValues"))
  {
    objc_msgSend(v2, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
