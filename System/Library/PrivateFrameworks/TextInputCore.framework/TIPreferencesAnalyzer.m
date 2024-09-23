@implementation TIPreferencesAnalyzer

- (void)analyzeRegisteredPreferences
{
  uint64_t v3;
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD aBlock[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7664;
  v19 = __Block_byref_object_dispose__7665;
  v3 = MEMORY[0x1E0C809B0];
  v20 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___getSystemActiveInputModes_block_invoke;
  aBlock[3] = &unk_1EA107058;
  aBlock[4] = &v15;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v4[2](v4);
  else
    TIDispatchSync();
  v5 = (void *)v16[5];
  if (v5 && objc_msgSend(v5, "count"))
  {
    +[TIPreferencesAnalyzer normalizedInputModeIdentifierGroupsFromInputModes:](TIPreferencesAnalyzer, "normalizedInputModeIdentifierGroupsFromInputModes:", v16[5]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:", CFSTR("self"), 1);
    v21[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingDescriptors:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = &unk_1EA13FFB8;
  }

  _Block_object_dispose(&v15, 8);
  -[TIPreferencesAnalyzer registry](self, "registry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __53__TIPreferencesAnalyzer_analyzeRegisteredPreferences__block_invoke;
  v12[3] = &unk_1EA0FFDC0;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateRegisteredPreferencesUsingBlock:", v12);

}

- (TIPreferencesAnalyzer)init
{
  TIPreferencesAnalyzerRegistry *v3;
  TIPreferencesAnalyzer *v4;

  v3 = objc_alloc_init(TIPreferencesAnalyzerRegistry);
  v4 = -[TIPreferencesAnalyzer initWithRegistry:](self, "initWithRegistry:", v3);

  return v4;
}

- (TIPreferencesAnalyzer)initWithRegistry:(id)a3
{
  id v5;
  TIPreferencesAnalyzer *v6;
  TIPreferencesAnalyzer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIPreferencesAnalyzer;
  v6 = -[TIPreferencesAnalyzer init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[TIPreferencesAnalyzer _registerAnalyticsEventSpecWithAnalyticsService](v6, "_registerAnalyticsEventSpecWithAnalyticsService");
    objc_storeStrong((id *)&v7->_registry, a3);
  }

  return v7;
}

- (void)_recordAnalysisOfPreferenceKey:(id)a3 inDomain:(id)a4
{
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *key;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_analyzedAt"), a3);
  key = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(key, v7, v6);

}

- (void)_updateApproxBuildAtLastAnalysisWithBuild:(id)a3 andApproxDateOfInstall:(id)a4 ForPreferenceKey:(id)a5 inDomain:(id)a6
{
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  __CFString *key;

  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = (__CFString *)a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_approxDateOfBuildInstall"), v11);
  key = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_buildAtLastAnalysis"), v11);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  CFPreferencesSetAppValue(v14, v13, v10);
  CFPreferencesSetAppValue(key, v12, v10);

}

- (void)_resetChangedAtForPreferenceKey:(id)a3 inDomain:(id)a4
{
  void *v5;
  __CFString *v6;
  __CFString *v7;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (__CFString *)a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@_changedAt"), a3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(v7, 0, v6);

}

- (void)_dispatchEventPayloadWithPreferenceNameToChangesEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5 previousValue:(id)a6 changedAt:(id)a7 analyzedAt:(id)a8 buildAtChange:(id)a9 isFreshInstall:(BOOL)a10 approxDateOfBuildInstall:(id)a11 buildAtLastAnalysis:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  unint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  id v37;
  int v38;
  double v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  BOOL v44;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a11;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55 = v16;
  objc_msgSend(v23, "setObject:forKey:", v16, CFSTR("preferenceName"));
  objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", "));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v24, CFSTR("activeInputModes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v25, CFSTR("isNewUser"));

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v26, CFSTR("currentValue"));

  }
  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v27, CFSTR("previousValue"));

    if (!v20)
      goto LABEL_18;
  }
  else
  {
    objc_msgSend(v23, "setObject:forKey:", CFSTR("previousValueNotSet"), CFSTR("previousValue"));
    if (!v20)
      goto LABEL_18;
  }
  v28 = v20;
  objc_msgSend(v28, "timeIntervalSinceNow");
  v30 = v29;
  if (v29 <= 0.0)
  {
    v31 = (unint64_t)(v29 / -86400.0);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v28, "description");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateByAddingTimeInterval:", -v30);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "description");
      *(_DWORD *)buf = 136315650;
      v57 = "_daysSinceChangedAtDate";
      v58 = 2112;
      v59 = v52;
      v60 = 2112;
      v61 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v61;
      _os_log_fault_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s:Preference changes saved with a timestamp in the future. Refer rdar://98151099. changedAt:%@, now:%@", buf, 0x20u);

    }
    v31 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v32, CFSTR("daysSinceLastChange"));

  v33 = 0;
  v34 = 5;
  while (1)
  {
    v35 = _bucketizeDaysSinceChangedAtDate_bucketMaxBoundingRanges[v33++];
    if (v35 >= v31)
      break;
    if (v33 == 4)
      goto LABEL_17;
  }
  v34 = v33;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v36, CFSTR("daysSinceLastChangeBucket"));

LABEL_18:
  if (v21)
    objc_msgSend(v23, "setObject:forKey:", v21, CFSTR("buildAtChange"));
  v37 = v18;
  v38 = objc_msgSend(v37, "BOOLValue");
  if (v20 && v22 && !v38)
  {
    objc_msgSend(v20, "timeIntervalSinceDate:", v22);
    if (v39 >= 0.0)
    {
      v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v22, v20);
      objc_msgSend(v41, "duration");
      v40 = (uint64_t)(v42 / 86400.0);

      if (v40 < 0)
        goto LABEL_29;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v20, "description");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "description");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v57 = "-[TIPreferencesAnalyzer _dispatchEventPayloadWithPreferenceNameToChangesEvent:activeInputModes:currentValu"
              "e:previousValue:changedAt:analyzedAt:buildAtChange:isFreshInstall:approxDateOfBuildInstall:buildAtLastAnalysis:]";
        v58 = 2112;
        v59 = v50;
        v60 = 2112;
        v61 = (uint64_t)v51;
        _os_log_fault_impl(&dword_1DA6F2000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%s:Preference changes saved with a timestamp in the future relative to date of BuildInstall. Refer rdar://98151099. changedAt:%@, approxDateOfBuildInstall:%@", buf, 0x20u);

      }
      v40 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v40);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKey:", v43, CFSTR("daysSinceUpgradeToOff"));

  }
LABEL_29:
  if (a8)
    v44 = 1;
  else
    v44 = v37 == v19;
  v46 = !v44 && v20 != 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKey:", v47, CFSTR("valueDidChange"));

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("textInputUserPreferenceChanges"), v23, 0, 1);

}

- (void)_dispatchEventPayloadWithPreferenceNameToStateEvent:(id)a3 activeInputModes:(id)a4 currentValue:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a5;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("preferenceName"));

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("activeInputModes"));
  if (v17)
  {
    v12 = v17;
    if (objc_msgSend(MEMORY[0x1E0DBDB38], "isBoolean:", v12))
    {
      v13 = objc_msgSend(v12, "BOOLValue");
      v14 = &unk_1EA140450;
      if (v13)
        v14 = &unk_1EA140438;
      v15 = v14;

      v12 = v15;
    }
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("currentValue"));

  }
  else
  {
    objc_msgSend(v10, "setObject:forKey:", &unk_1EA140450, CFSTR("currentValue"));
  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:", CFSTR("textInputUserPreferenceState"), v10, 0, 1);

}

- (void)_registerAnalyticsEventSpecWithAnalyticsService
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TIPreferencesAnalyzer _createEventSpecForTextInputUserPreferenceChanges](self, "_createEventSpecForTextInputUserPreferenceChanges");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerEventSpec:", v6);

  -[TIPreferencesAnalyzer _createEventSpecForTextInputUserPreferenceState](self, "_createEventSpecForTextInputUserPreferenceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerEventSpec:", v4);

}

- (id)_createEventSpecForTextInputUserPreferenceChanges
{
  if (_createEventSpecForTextInputUserPreferenceChanges_onceToken != -1)
    dispatch_once(&_createEventSpecForTextInputUserPreferenceChanges_onceToken, &__block_literal_global_7635);
  return (id)_createEventSpecForTextInputUserPreferenceChanges___eventSpec;
}

- (id)_createEventSpecForTextInputUserPreferenceState
{
  if (_createEventSpecForTextInputUserPreferenceState_onceToken != -1)
    dispatch_once(&_createEventSpecForTextInputUserPreferenceState_onceToken, &__block_literal_global_33_7631);
  return (id)_createEventSpecForTextInputUserPreferenceState___eventSpec;
}

- (TIPreferencesAnalyzerRegistry)registry
{
  return (TIPreferencesAnalyzerRegistry *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegistry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registry, 0);
}

void __72__TIPreferencesAnalyzer__createEventSpecForTextInputUserPreferenceState__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("preferenceName"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("activeInputModes"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:", CFSTR("currentValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB18], "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("textInputUserPreferenceState"), 0, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_createEventSpecForTextInputUserPreferenceState___eventSpec;
  _createEventSpecForTextInputUserPreferenceState___eventSpec = v4;

}

void __74__TIPreferencesAnalyzer__createEventSpecForTextInputUserPreferenceChanges__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[11];

  v16[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("preferenceName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("activeInputModes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v14;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("previousValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("currentValue"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v0;
  v1 = (void *)MEMORY[0x1E0DBDB20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("daysSinceLastChangeBucket"), v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v4;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("daysSinceUpgradeToOff"), &unk_1EA140450, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v5;
  objc_msgSend(MEMORY[0x1E0DBDB20], "integerFieldSpecWithName:minValue:maxValue:significantDigits:", CFSTR("daysSinceLastChange"), &unk_1EA140450, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v6;
  objc_msgSend(MEMORY[0x1E0DBDB20], "stringFieldSpecWithName:", CFSTR("buildAtChange"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v7;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("valueDidChange"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v8;
  objc_msgSend(MEMORY[0x1E0DBDB20], "BOOLeanFieldSpecWithName:", CFSTR("isNewUser"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBDB18], "eventSpecWithName:inputModeRequired:fieldSpecs:", CFSTR("textInputUserPreferenceChanges"), 0, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_createEventSpecForTextInputUserPreferenceChanges___eventSpec;
  _createEventSpecForTextInputUserPreferenceChanges___eventSpec = v11;

}

void __53__TIPreferencesAnalyzer_analyzeRegisteredPreferences__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  id v14;
  void *v15;
  id v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  __CFString *v43;
  id v44;
  void *v45;
  _QWORD aBlock[4];
  id v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = v10;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__7664;
  v53 = __Block_byref_object_dispose__7665;
  v54 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = ___getCurrentValueFromPreferenceController_block_invoke;
  aBlock[3] = &unk_1EA106F40;
  v47 = v12;
  v48 = &v49;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v13[2](v13);
  else
    TIDispatchSync();
  v14 = (id)v50[5];

  _Block_object_dispose(&v49, 8);
  if (v14)
    v15 = v14;
  else
    v15 = v11;
  v16 = v15;

  if ((a5 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "_dispatchEventPayloadWithPreferenceNameToStateEvent:activeInputModes:currentValue:", v12, *(_QWORD *)(a1 + 40), v16);
  if ((a5 & 2) != 0)
  {
    v41 = v11;
    v17 = (void *)MEMORY[0x1E0CB3940];
    v18 = (__CFString *)v9;
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@_previousValue"), v12);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v20 = (__CFString *)CFPreferencesCopyAppValue(v19, v18);

    v21 = CFSTR("previousValueNotSet");
    if (v20)
      v21 = v20;
    v43 = v21;

    v22 = (void *)MEMORY[0x1E0CB3940];
    v23 = v18;
    objc_msgSend(v22, "stringWithFormat:", CFSTR("%@_changedAt"), v12);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)CFPreferencesCopyAppValue(v24, v23);

    _getPreferenceAnalyzedAtDateForKeyInDomain((uint64_t)v12, v23);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = v23;
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@_buildAtChange"), v12);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)CFPreferencesCopyAppValue(v27, v26);

    v29 = (void *)MEMORY[0x1E0CB3940];
    v30 = v26;
    objc_msgSend(v29, "stringWithFormat:", CFSTR("%@_approxDateOfBuildInstall"), v12);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)CFPreferencesCopyAppValue(v31, v30);

    v33 = (void *)MEMORY[0x1E0CB3940];
    v34 = v30;
    objc_msgSend(v33, "stringWithFormat:", CFSTR("%@_buildAtLastAnalysis"), v12);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)CFPreferencesCopyAppValue(v35, v34);

    v37 = (void *)MGGetStringAnswer();
    v44 = v9;
    if (!objc_msgSend(v36, "isEqualToString:", v37) || !v32)
    {
      v38 = v37;

      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v39 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_updateApproxBuildAtLastAnalysisWithBuild:andApproxDateOfInstall:ForPreferenceKey:inDomain:", v38, v39, v12, v34);
      v36 = v38;
      v32 = (void *)v39;
    }
    v11 = v41;
    if ((objc_msgSend(v36, "isEqualToString:", v37) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "_resetChangedAtForPreferenceKey:inDomain:", v12, v34);
    LOBYTE(v40) = DMGetUserDataDisposition() & 1;
    objc_msgSend(*(id *)(a1 + 32), "_dispatchEventPayloadWithPreferenceNameToChangesEvent:activeInputModes:currentValue:previousValue:changedAt:analyzedAt:buildAtChange:isFreshInstall:approxDateOfBuildInstall:buildAtLastAnalysis:", v12, *(_QWORD *)(a1 + 40), v16, v43, v45, v42, v28, v40, v32, v36);

    objc_msgSend(*(id *)(a1 + 32), "_recordAnalysisOfPreferenceKey:inDomain:", v12, v34);
    v9 = v44;
  }

}

+ (id)normalizedInputModeIdentifierGroupsFromInputModes:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    v25 = *(_QWORD *)v33;
    v26 = v4;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        TIInputModeGetMultilingualID();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if ((objc_msgSend(v4, "containsObject:", v10) & 1) != 0)
            goto LABEL_21;
          objc_msgSend(v4, "addObject:", v10);
          v11 = v5;
          TIInputModeGetMultilingualSetFromInputModesWithPreferredLanguages();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v14 = v12;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v29;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v29 != v17)
                  objc_enumerationMutation(v14);
                TIInputModeGetNormalizedIdentifier();
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if (v19)
                  objc_msgSend(v13, "addObject:", v19);

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v16);
          }

          v20 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "stringWithFormat:", CFSTR("(%@)"), v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v22);

          v8 = v25;
          v4 = v26;
          v5 = v11;
        }
        else
        {
          TIInputModeGetNormalizedIdentifier();
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v27, "addObject:", v14);
        }

LABEL_21:
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }

  objc_msgSend(v27, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
