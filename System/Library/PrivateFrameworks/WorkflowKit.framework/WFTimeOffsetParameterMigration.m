@implementation WFTimeOffsetParameterMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  return WFCompareBundleVersions(a4, CFSTR("900")) & 1;
}

- (void)migrateWorkflow
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  __CFString **v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  int v24;
  __CFString *v25;
  void *v26;
  WFVariable *v27;
  WFNumberStringSubstitutableState *v28;
  WFQuantityParameterState *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[WFWorkflowMigration actions](self, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v31 = *(_QWORD *)v35;
    do
    {
      v6 = 0;
      v32 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
        -[WFWorkflowMigration actionIdentifierKey](self, "actionIdentifierKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("is.workflow.actions.adjustdate"));

        if (v10)
        {
          -[WFWorkflowMigration actionParametersKey](self, "actionParametersKey");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFAdjustOffsetPicker"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKey:", CFSTR("Value"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Operation"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Unit"));
          v16 = (id)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("Second"));
          v18 = WFDurationQuantityFieldUnitSeconds;
          if ((v17 & 1) == 0)
          {
            v19 = objc_msgSend(v16, "isEqualToString:", CFSTR("Minute"));
            v18 = WFDurationQuantityFieldUnitMinutes;
            if ((v19 & 1) == 0)
            {
              v20 = objc_msgSend(v16, "isEqualToString:", CFSTR("Hour"));
              v18 = WFDurationQuantityFieldUnitHours;
              if ((v20 & 1) == 0)
              {
                v21 = objc_msgSend(v16, "isEqualToString:", CFSTR("Day"));
                v18 = WFDurationQuantityFieldUnitDays;
                if ((v21 & 1) == 0)
                {
                  v22 = objc_msgSend(v16, "isEqualToString:", CFSTR("Week"));
                  v18 = WFDurationQuantityFieldUnitWeeks;
                  if ((v22 & 1) == 0)
                  {
                    v23 = objc_msgSend(v16, "isEqualToString:", CFSTR("Month"));
                    v18 = WFDurationQuantityFieldUnitMonths;
                    if ((v23 & 1) == 0)
                    {
                      v24 = objc_msgSend(v16, "isEqualToString:", CFSTR("Year"));
                      v18 = WFDurationQuantityFieldUnitDays;
                      if (v24)
                        v18 = WFDurationQuantityFieldUnitYears;
                    }
                  }
                }
              }
            }
          }
          v25 = *v18;

          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Value"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = -[WFVariable initWithDictionary:variableProvider:]([WFVariable alloc], "initWithDictionary:variableProvider:", v26, 0);
            if (v27)
              v28 = -[WFVariableSubstitutableParameterState initWithVariable:]([WFNumberStringSubstitutableState alloc], "initWithVariable:", v27);
            else
              v28 = 0;

          }
          else
          {
            v28 = -[WFVariableSubstitutableParameterState initWithSerializedRepresentation:variableProvider:parameter:]([WFNumberStringSubstitutableState alloc], "initWithSerializedRepresentation:variableProvider:parameter:", v26, 0, 0);
          }
          v29 = -[WFQuantityParameterState initWithMagnitudeState:unitString:]([WFQuantityParameterState alloc], "initWithMagnitudeState:unitString:", v28, v25);

          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("WFAdjustOperation"));
          -[WFQuantityParameterState serializedRepresentation](v29, "serializedRepresentation");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("WFDuration"));

          v5 = v31;
          v4 = v32;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v4);
  }

  -[WFWorkflowMigration finish](self, "finish");
}

@end
