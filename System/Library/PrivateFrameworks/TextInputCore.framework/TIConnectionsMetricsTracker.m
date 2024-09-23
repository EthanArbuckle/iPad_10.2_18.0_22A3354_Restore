@implementation TIConnectionsMetricsTracker

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11118 != -1)
    dispatch_once(&sharedInstance_onceToken_11118, &__block_literal_global_11119);
  return (id)sharedInstance_sharedInstance;
}

- (void)setInputContextDidChange:(BOOL)a3
{
  self->_inputContextDidChange = a3;
}

- (TIConnectionsMetricsTracker)init
{
  TIConnectionsMetricsTracker *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  PETScalarEventTracker *textFieldEntryTracker;
  id v11;
  void *v12;
  uint64_t v13;
  PETGoalConversionEventTracker *predictionEngagementTracker;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[6];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)TIConnectionsMetricsTracker;
  v2 = -[TIConnectionsMetricsTracker init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("empty"), &unk_1EA140018);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("field"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:possibleValues:", CFSTR("trigger"), &unk_1EA140030);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("request"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "propertyWithName:range:clampValues:", CFSTR("age"), 0, 31536000, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("response"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("fromBundleId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D80F20], "freeValuedPropertyWithName:", CFSTR("targetApp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D80F38]);
    v22[0] = v19;
    v22[1] = v3;
    v22[2] = v4;
    v22[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFeatureId:event:registerProperties:", CFSTR("kbd_textcontainer"), CFSTR("reentry"), v8);
    textFieldEntryTracker = v2->_textFieldEntryTracker;
    v2->_textFieldEntryTracker = (PETScalarEventTracker *)v9;

    v11 = objc_alloc(MEMORY[0x1E0D80F30]);
    v21[0] = v17;
    v21[1] = v3;
    v21[2] = v16;
    v21[3] = v5;
    v21[4] = v6;
    v21[5] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("kbd_proactive"), CFSTR("shown"), CFSTR("engaged"), v12);
    predictionEngagementTracker = v2->_predictionEngagementTracker;
    v2->_predictionEngagementTracker = (PETGoalConversionEventTracker *)v13;

    v2->_inputContextDidChange = 0;
  }
  return v2;
}

- (BOOL)isIgnoredTrigger:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  if (!a3)
    return 0;
  objc_msgSend(a3, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0D432C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 linguistic:(BOOL)a5 semantic:(BOOL)a6 requestType:(id)a7
{
  PETScalarEventTracker *textFieldEntryTracker;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  textFieldEntryTracker = self->_textFieldEntryTracker;
  v9 = CFSTR("0");
  if (a3)
    v9 = CFSTR("1");
  v10 = CFSTR("null");
  if (a4)
    v11 = (const __CFString *)a4;
  else
    v11 = CFSTR("null");
  v17[0] = v9;
  v17[1] = v11;
  v12 = CFSTR("semantic");
  if (!a6)
    v12 = CFSTR("null");
  if (a5)
    v12 = CFSTR("linguistic");
  if (a7)
    v10 = (const __CFString *)a7;
  v17[2] = v12;
  v17[3] = v10;
  v13 = (void *)MEMORY[0x1E0C99D20];
  v14 = a7;
  v15 = a4;
  objc_msgSend(v13, "arrayWithObjects:count:", v17, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PETScalarEventTracker trackEventWithPropertyValues:](textFieldEntryTracker, "trackEventWithPropertyValues:", v16);

}

- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 trigger:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  TIConnectionsMetricsTracker *v13;
  _BOOL8 v14;
  const __CFString *v15;
  uint64_t v16;
  __CFString *v17;

  v6 = a3;
  v17 = (__CFString *)a4;
  v8 = a5;
  if (-[TIConnectionsMetricsTracker isIgnoredTrigger:](self, "isIgnoredTrigger:", v8))
  {

    v8 = 0;
  }
  if (-[TIConnectionsMetricsTracker inputContextDidChange](self, "inputContextDidChange"))
  {
    -[TIConnectionsMetricsTracker setInputContextDidChange:](self, "setInputContextDidChange:", 0);
    if (v8)
    {
      if (!objc_msgSend(v8, "triggerSourceType")
        || objc_msgSend(v8, "triggerSourceType") == 1)
      {
        objc_msgSend(v8, "attributes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("field"));
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (const __CFString *)v10;
        else
          v12 = CFSTR("null");
        -[TIConnectionsMetricsTracker trackTextFieldEntryWithEmpty:fieldType:linguistic:semantic:requestType:](self, "trackTextFieldEntryWithEmpty:fieldType:linguistic:semantic:requestType:", v6, v17, 1, 0, v12);

        goto LABEL_14;
      }
      v15 = CFSTR("null");
      v13 = self;
      v14 = v6;
      v16 = 1;
    }
    else
    {
      v13 = self;
      v14 = v6;
      v15 = v17;
      v16 = 0;
    }
    -[TIConnectionsMetricsTracker trackTextFieldEntryWithEmpty:fieldType:linguistic:semantic:requestType:](v13, "trackTextFieldEntryWithEmpty:fieldType:linguistic:semantic:requestType:", v14, v15, 0, v16, CFSTR("null"));
  }
LABEL_14:

}

- (void)trackPredictionEngagmentWithConversion:(BOOL)a3 age:(unint64_t)a4 fieldType:(id)a5 resultType:(id)a6 fromBundleId:(id)a7 targetApp:(id)a8 linguistic:(BOOL)a9 semantic:(BOOL)a10
{
  _BOOL4 v14;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  void *v28;
  PETGoalConversionEventTracker *predictionEngagementTracker;
  _QWORD v30[7];

  v14 = a3;
  v30[6] = *MEMORY[0x1E0C80C00];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = (__CFString *)a8;
  v18 = (__CFString *)a7;
  v19 = (__CFString *)a6;
  v20 = (__CFString *)a5;
  objc_msgSend(v16, "numberWithUnsignedInteger:", a4);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = CFSTR("null");
  if (v20)
    v24 = v20;
  else
    v24 = CFSTR("null");
  v30[0] = v21;
  v30[1] = v24;
  if (v19)
    v25 = v19;
  else
    v25 = CFSTR("null");
  if (v18)
    v26 = v18;
  else
    v26 = CFSTR("null");
  v30[2] = v25;
  v30[3] = v26;
  if (v17)
    v27 = v17;
  else
    v27 = CFSTR("null");
  if (a10)
    v23 = CFSTR("semantic");
  if (a9)
    v23 = CFSTR("linguistic");
  v30[4] = v27;
  v30[5] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  predictionEngagementTracker = self->_predictionEngagementTracker;
  if (v14)
    -[PETGoalConversionEventTracker trackGoalConversionEventWithPropertyValues:](predictionEngagementTracker, "trackGoalConversionEventWithPropertyValues:", v28);
  else
    -[PETGoalConversionEventTracker trackGoalOpportunityEventWithPropertyValues:](predictionEngagementTracker, "trackGoalOpportunityEventWithPropertyValues:", v28);

}

- (BOOL)inputContextDidChange
{
  return self->_inputContextDidChange;
}

- (PETScalarEventTracker)textFieldEntryTracker
{
  return self->_textFieldEntryTracker;
}

- (void)setTextFieldEntryTracker:(id)a3
{
  objc_storeStrong((id *)&self->_textFieldEntryTracker, a3);
}

- (PETGoalConversionEventTracker)predictionEngagementTracker
{
  return self->_predictionEngagementTracker;
}

- (void)setPredictionEngagementTracker:(id)a3
{
  objc_storeStrong((id *)&self->_predictionEngagementTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionEngagementTracker, 0);
  objc_storeStrong((id *)&self->_textFieldEntryTracker, 0);
}

void __45__TIConnectionsMetricsTracker_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

@end
