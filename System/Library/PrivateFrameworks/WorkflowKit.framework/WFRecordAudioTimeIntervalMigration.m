@implementation WFRecordAudioTimeIntervalMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5;
  char HasActionsWithIdentifier;

  v5 = a3;
  if ((WFCompareBundleVersions(a4, CFSTR("1113.1")) & 1) != 0)
    HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(CFSTR("is.workflow.actions.recordaudio"), v5);
  else
    HasActionsWithIdentifier = 0;

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  -[WFWorkflowMigration enumerateActionsWithIdentifier:usingBlock:](self, "enumerateActionsWithIdentifier:usingBlock:", CFSTR("is.workflow.actions.recordaudio"), &__block_literal_global_30890);
  -[WFWorkflowMigration finish](self, "finish");
}

void __53__WFRecordAudioTimeIntervalMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  WFQuantityParameterState *v5;
  WFNumberStringSubstitutableState *v6;
  uint64_t v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WFRecordingTimeInterval"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = [WFQuantityParameterState alloc];
    v6 = -[WFNumberStringSubstitutableState initWithValue:]([WFNumberStringSubstitutableState alloc], "initWithValue:", &stru_1E7AFA810);
    v7 = -[WFQuantityParameterState initWithMagnitudeState:unitString:](v5, "initWithMagnitudeState:unitString:", v6, CFSTR("sec"));
LABEL_5:
    v10 = (id)v7;

    objc_msgSend(v10, "serializedRepresentation");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("WFRecordingTimeInterval"));
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "doubleValue");
    v9 = v8;
    v23[0] = CFSTR("sec");
    v23[1] = CFSTR("min");
    v23[2] = CFSTR("hr");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v6 = (WFNumberStringSubstitutableState *)objc_claimAutoreleasedReturnValue();
    +[WFDurationQuantityFieldParameter stateForDuration:possibleUnits:](WFDurationQuantityFieldParameter, "stateForDuration:possibleUnits:", v6, v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v12 = v4;
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v10 = v13;

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WFSerializationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;
  }
  else
  {
    v15 = 0;
  }
  v11 = v15;

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("WFQuantityFieldValue")) & 1) == 0
    && objc_msgSend(v11, "isEqualToString:", CFSTR("WFTextTokenAttachment")))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Value"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    v18 = v17;

    v19 = (void *)objc_opt_new();
    objc_msgSend(v19, "setValue:forKey:", v18, CFSTR("Magnitude"));

    objc_msgSend(v19, "setValue:forKey:", CFSTR("sec"), CFSTR("Unit"));
    v21[0] = CFSTR("WFSerializationType");
    v21[1] = CFSTR("Value");
    v22[0] = CFSTR("WFQuantityFieldValue");
    v22[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("WFRecordingTimeInterval"));

  }
LABEL_6:

}

@end
