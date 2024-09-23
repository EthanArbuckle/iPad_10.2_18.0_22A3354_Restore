@implementation _PSTrialClient

- (_PSTrialClient)init
{
  _PSTrialClient *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  id v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _PASLock *lock;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  objc_super v23;
  id location[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v23.receiver = self;
  v23.super_class = (Class)_PSTrialClient;
  v2 = -[_PSTrialClient init](&v23, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    v5 = objc_alloc(MEMORY[0x1E0D815F0]);
    v6 = (_QWORD *)objc_opt_new();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v7 = (void *)getTRIClientClass_softClass_0;
    v28 = getTRIClientClass_softClass_0;
    v8 = MEMORY[0x1E0C809B0];
    if (!getTRIClientClass_softClass_0)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getTRIClientClass_block_invoke_0;
      location[3] = &unk_1E43FEA00;
      location[4] = &v25;
      __getTRIClientClass_block_invoke_0((uint64_t)location);
      v7 = (void *)v26[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v25, 8);
    objc_msgSend(v9, "clientWithIdentifier:", 210);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v6[1];
    v6[1] = v10;

    objc_initWeak(location, v2);
    v12 = (void *)v6[1];
    v18 = v8;
    v19 = 3221225472;
    v20 = __22___PSTrialClient_init__block_invoke;
    v21 = &unk_1E43FEE38;
    objc_copyWeak(&v22, location);
    objc_msgSend(v12, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREML_SYSTEMS_PEOPLE_SUGGESTER"), &v18);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v6[5];
    v6[5] = v13;

    objc_destroyWeak(&v22);
    objc_destroyWeak(location);
    v15 = objc_msgSend(v5, "initWithGuardedData:", v6, v18, v19, v20, v21);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v15;

    -[_PSTrialClient updateFactors](v2, "updateFactors");
  }
  return v2;
}

- (void)updateFactors
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31___PSTrialClient_updateFactors__block_invoke;
  v3[3] = &unk_1E43FF748;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (id)rankingModel
{
  _PASLock *lock;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30___PSTrialClient_rankingModel__block_invoke;
  v5[3] = &unk_1E43FF770;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)recipe
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24___PSTrialClient_recipe__block_invoke;
  v5[3] = &unk_1E43FF798;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)shouldActivatePSR
{
  return -[_PSTrialClient BOOLForKey:withDefaultValue:](self, "BOOLForKey:withDefaultValue:", CFSTR("shouldActivePSR"), 1);
}

- (BOOL)shouldComputePhotoBasedFeatures
{
  return -[_PSTrialClient BOOLForKey:withDefaultValue:](self, "BOOLForKey:withDefaultValue:", CFSTR("shouldComputePhotoBasedFeatures"), 0);
}

- (int)dataCollectionTimeToWaitInSeconds
{
  return -[_PSTrialClient integerForKey:withDefaultValue:](self, "integerForKey:withDefaultValue:", CFSTR("dataCollectionTimeToWaitInSeconds"), 15);
}

- (double)maxComputationTime
{
  double result;

  -[_PSTrialClient doubleForKey:withDefaultValue:](self, "doubleForKey:withDefaultValue:", CFSTR("maxComputationTime"), 0.2);
  return result;
}

- (BOOL)shouldEnableDataCollection
{
  return -[_PSTrialClient BOOLForKey:withDefaultValue:](self, "BOOLForKey:withDefaultValue:", CFSTR("shouldEnableDataCollection"), 1);
}

- (id)getTrialExperiment
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36___PSTrialClient_getTrialExperiment__block_invoke;
  v5[3] = &unk_1E43FF798;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)additionalFeaturesToCompute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
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
  void *v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[4];
  _QWORD v42[4];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[4];
  _QWORD v46[4];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[21];

  v49[19] = *MEMORY[0x1E0C80C00];
  v48[0] = CFSTR("copy:to:");
  v48[1] = CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation");
  v48[2] = CFSTR("count1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v28;
  v47[0] = CFSTR("impute:withConstant:");
  v47[1] = CFSTR("count1");
  v47[2] = &unk_1E442A940;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v27;
  v46[0] = CFSTR("laplaceProbability:withAlpha:");
  v46[1] = CFSTR("count1");
  v46[2] = &unk_1E442A958;
  v46[3] = CFSTR("P1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v25;
  v45[0] = CFSTR("log:withBase:");
  v45[1] = CFSTR("P1");
  v45[2] = &unk_1E442A970;
  v45[3] = CFSTR("log_P1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v24;
  v44[0] = CFSTR("copy:to:");
  v44[1] = CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation");
  v44[2] = CFSTR("count2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v23;
  v43[0] = CFSTR("impute:withConstant:");
  v43[1] = CFSTR("count2");
  v43[2] = &unk_1E442A940;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v22;
  v42[0] = CFSTR("laplaceProbability:withAlpha:");
  v42[1] = CFSTR("count2");
  v42[2] = &unk_1E442A958;
  v42[3] = CFSTR("P2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v21;
  v41[0] = CFSTR("log:withBase:");
  v41[1] = CFSTR("P2");
  v41[2] = &unk_1E442A970;
  v41[3] = CFSTR("log_P2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v20;
  v40[0] = CFSTR("copy:to:");
  v40[1] = CFSTR("numberOfSharesOfTopDomainURLWithConversation");
  v40[2] = CFSTR("count3");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v19;
  v39[0] = CFSTR("impute:withConstant:");
  v39[1] = CFSTR("count3");
  v39[2] = &unk_1E442A940;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v18;
  v38[0] = CFSTR("laplaceProbability:withAlpha:");
  v38[1] = CFSTR("count3");
  v38[2] = &unk_1E442A958;
  v38[3] = CFSTR("P3");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v17;
  v37[0] = CFSTR("log:withBase:");
  v37[1] = CFSTR("P3");
  v37[2] = &unk_1E442A970;
  v37[3] = CFSTR("log_P3");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v16;
  v36[0] = CFSTR("copy:to:");
  v36[1] = CFSTR("numberOfSharesFromCurrentAppWithConversation");
  v36[2] = CFSTR("count4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v15;
  v35[0] = CFSTR("impute:withConstant:");
  v35[1] = CFSTR("count4");
  v35[2] = &unk_1E442A940;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v2;
  v34[0] = CFSTR("laplaceProbability:withAlpha:");
  v34[1] = CFSTR("count4");
  v34[2] = &unk_1E442A958;
  v34[3] = CFSTR("P4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v49[14] = v3;
  v33[0] = CFSTR("log:withBase:");
  v33[1] = CFSTR("P4");
  v33[2] = &unk_1E442A970;
  v33[3] = CFSTR("log_P4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v49[15] = v4;
  v32[0] = CFSTR("sum:with:");
  v32[1] = CFSTR("log_P1");
  v32[2] = CFSTR("log_P2");
  v32[3] = CFSTR("partialSum1");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[16] = v5;
  v31[0] = CFSTR("sum:with:");
  v31[1] = CFSTR("log_P3");
  v31[2] = CFSTR("log_P4");
  v31[3] = CFSTR("partialSum2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49[17] = v6;
  v30[0] = CFSTR("sum:with:");
  v30[1] = CFSTR("partialSum1");
  v30[2] = CFSTR("partialSum2");
  v30[3] = CFSTR("logJointProbability");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSTrialClient arrayOfArraysForKey:withDefaultValue:](self, "arrayOfArraysForKey:withDefaultValue:", CFSTR("additionalFeaturesToCompute"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("additionalFeaturesToCompute"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v29);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }

  }
  -[_PSTrialClient arrayOfArraysForKey:withDefaultValue:](self, "arrayOfArraysForKey:withDefaultValue:", CFSTR("additionalFeaturesToCompute"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)configWithAnchorDate:(id)a3
{
  void *v4;
  double v5;
  double v6;
  unint64_t v7;
  void *v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  _BOOL8 v16;
  _BOOL8 v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  objc_class *v25;
  id v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE buf[24];
  void *v37;
  _BYTE v38[10];
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[17];
  _QWORD v44[17];
  _QWORD v45[9];

  v45[7] = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v45[0] = CFSTR("logJointProbability");
  v45[1] = CFSTR("timeSinceOutgoingInteractionNumber10");
  v45[2] = CFSTR("numberOfEngagedSuggestionsWithConversation");
  v45[3] = CFSTR("numberOfSharesWithConversation");
  v45[4] = CFSTR("numberOfOutgoingInteractionsWithConversation");
  v45[5] = CFSTR("timeSinceLastOutgoingInteraction");
  v45[6] = CFSTR("timeSinceLastIncomingInteraction");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 7);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = CFSTR("timeSinceLastOutgoingInteraction");
  v43[1] = CFSTR("timeSinceOutgoingInteractionNumber10");
  v44[0] = &unk_1E442CF88;
  v44[1] = &unk_1E442CF88;
  v43[2] = CFSTR("timeSinceLastIncomingInteraction");
  v43[3] = CFSTR("numberOfSharesWithConversation");
  v44[2] = &unk_1E442CF88;
  v44[3] = &unk_1E442A940;
  v43[4] = CFSTR("numberOfSharesFromCurrentAppWithConversation");
  v43[5] = CFSTR("numberOfSharesOfTopDomainURLWithConversation");
  v44[4] = &unk_1E442A940;
  v44[5] = &unk_1E442A940;
  v43[6] = CFSTR("numberOfSharesOfDetectedPeopleWithConversation");
  v43[7] = CFSTR("numberOfSharesOfPeopleInPhotoWithConversation");
  v44[6] = &unk_1E442A940;
  v44[7] = &unk_1E442A940;
  v43[8] = CFSTR("numberOfIncomingInteractionsWithConversation");
  v43[9] = CFSTR("numberOfOutgoingInteractionsWithConversation");
  v44[8] = &unk_1E442A940;
  v44[9] = &unk_1E442A940;
  v43[10] = CFSTR("numberOfInteractionsDuringTimePeriodWithConversation");
  v43[11] = CFSTR("hasEverSharePlayedWithConversation");
  v44[10] = &unk_1E442A940;
  v44[11] = &unk_1E442A940;
  v43[12] = CFSTR("numberOfEngagedSuggestionsWithConversation");
  v43[13] = CFSTR("numberOfEngagedSuggestionsFromCurrentAppWithConversation");
  v44[12] = &unk_1E442A940;
  v44[13] = &unk_1E442A940;
  v43[14] = CFSTR("numberOfEngagedSuggestionsOfTopDomainURLWithConversation");
  v43[15] = CFSTR("numberOfEngagedSuggestionsOfDetectedPeopleWithConversation");
  v44[14] = &unk_1E442A940;
  v44[15] = &unk_1E442A940;
  v43[16] = CFSTR("numberOfEngagedSuggestionsOfPeopleInPhotoWithConversation");
  v44[16] = &unk_1E442A940;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSTrialClient doubleForKey:withDefaultValue:](self, "doubleForKey:withDefaultValue:", CFSTR("timeInterval"), 5184000.0);
  v6 = v5;
  v7 = -[_PSTrialClient integerForKey:withDefaultValue:](self, "integerForKey:withDefaultValue:", CFSTR("fetchLimit"), 4000);
  -[_PSTrialClient arrayForKey:withDefaultValue:](self, "arrayForKey:withDefaultValue:", CFSTR("featureNamesToSortWith"), v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSTrialClient BOOLForKey:withDefaultValue:](self, "BOOLForKey:withDefaultValue:", CFSTR("shouldSortAscending"), 1);
  v10 = -[_PSTrialClient BOOLForKey:withDefaultValue:](self, "BOOLForKey:withDefaultValue:", CFSTR("shouldUseSuggestionEngaged"), 1);
  -[_PSTrialClient mutableDictionaryForKey:withDefaultValue:](self, "mutableDictionaryForKey:withDefaultValue:", CFSTR("statsDefaultValues"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSTrialClient userDefaultDoubleValueForKey:defaultToValue:](self, "userDefaultDoubleValueForKey:defaultToValue:", CFSTR("timeInterval"), v6);
  v13 = v12;
  v14 = -[_PSTrialClient userDefaultIntegerValueForKey:defaultToValue:](self, "userDefaultIntegerValueForKey:defaultToValue:", CFSTR("fetchLimit"), v7);
  -[_PSTrialClient userDefaultArrayValueForKey:defaultToValue:](self, "userDefaultArrayValueForKey:defaultToValue:", CFSTR("featureNamesToSortWith"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[_PSTrialClient userDefaultBoolValueForKey:defaultToValue:](self, "userDefaultBoolValueForKey:defaultToValue:", CFSTR("shouldSortAscending"), v9);
  v17 = -[_PSTrialClient userDefaultBoolValueForKey:defaultToValue:](self, "userDefaultBoolValueForKey:defaultToValue:", CFSTR("shouldUseSuggestionEngaged"), v10);
  -[_PSTrialClient userDefaultMutableDictionaryForKey:defaultToValue:](self, "userDefaultMutableDictionaryForKey:defaultToValue:", CFSTR("statsDefaultValues"), v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    *(double *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v37 = v15;
    *(_WORD *)v38 = 2112;
    *(_QWORD *)&v38[2] = v20;
    v39 = 2112;
    v40 = v21;
    v41 = 2112;
    v42 = v18;
    _os_log_impl(&dword_1A07F4000, v19, OS_LOG_TYPE_DEFAULT, "_PSTrialClient: Final configuration is: timeInterval %f, fetchLimit %lu, featureNamesToSortWith %@, shouldSortAscending %@, shouldUseSuggestionEngaged %@, statsDefaultValues %@", buf, 0x3Eu);

  }
  v22 = v30;
  objc_msgSend(v22, "dateByAddingTimeInterval:", -v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2050000000;
  v24 = (void *)get_CDInteractionsStatisticsConfigClass_softClass;
  v35 = get_CDInteractionsStatisticsConfigClass_softClass;
  if (!get_CDInteractionsStatisticsConfigClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __get_CDInteractionsStatisticsConfigClass_block_invoke;
    v37 = &unk_1E43FEA00;
    *(_QWORD *)v38 = &v32;
    __get_CDInteractionsStatisticsConfigClass_block_invoke((uint64_t)buf);
    v24 = (void *)v33[3];
  }
  v25 = objc_retainAutorelease(v24);
  _Block_object_dispose(&v32, 8);
  v26 = [v25 alloc];
  -[_PSTrialClient maxComputationTime](self, "maxComputationTime");
  LOBYTE(v29) = v17;
  v27 = (void *)objc_msgSend(v26, "initWithAnchorDate:leftBoundDate:rightBoundDate:fetchLimit:maxComputationTime:featureNamesToSortWith:shouldSortAscending:shouldUseSuggestionEngaged:statsDefaultValues:", v22, v23, v22, v14, v15, v16, v29, v18);

  return v27;
}

- (id)suggestionProxyOrder
{
  void *v3;
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  _QWORD v9[9];

  v9[8] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("SuggestionProxyTypeInCall");
  v9[1] = CFSTR("SuggestionProxyTypeReturnToSender");
  v9[2] = CFSTR("SuggestionProxyTypeHyperRecencyRewrite");
  v9[3] = CFSTR("SuggestionProxyTypePASS");
  v9[4] = CFSTR("SuggestionProxyTypeFrequencyOfTopDomainURL");
  v9[5] = CFSTR("SuggestionProxyTypeFrequencyOfSharesFromCurrentApp");
  v9[6] = CFSTR("SuggestionProxyTypeFrequencyOfShares");
  v9[7] = CFSTR("SuggestionProxyTypeFromStats");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSTrialClient arrayForKey:withDefaultValue:](self, "arrayForKey:withDefaultValue:", CFSTR("suggestionProxyOrder"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "Heuristic order used: %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (id)loadCoreMLModel:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint64_t v26;
  uint64_t v27;
  Class (*v28)(uint64_t);
  void *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x2050000000;
    v10 = (void *)getMLModelConfigurationClass_softClass;
    v34 = getMLModelConfigurationClass_softClass;
    if (!getMLModelConfigurationClass_softClass)
    {
      v26 = MEMORY[0x1E0C809B0];
      v27 = 3221225472;
      v28 = __getMLModelConfigurationClass_block_invoke;
      v29 = &unk_1E43FEA00;
      v30 = &v31;
      __getMLModelConfigurationClass_block_invoke((uint64_t)&v26);
      v10 = (void *)v32[3];
    }
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v31, 8);
    v9 = (id)objc_opt_new();
  }
  v12 = v9;

  objc_msgSend(v12, "setComputeUnits:", 0);
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v13 = (void *)getMLModelClass_softClass_1;
  v34 = getMLModelClass_softClass_1;
  if (!getMLModelClass_softClass_1)
  {
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __getMLModelClass_block_invoke_1;
    v29 = &unk_1E43FEA00;
    v30 = &v31;
    __getMLModelClass_block_invoke_1((uint64_t)&v26);
    v13 = (void *)v32[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v31, 8);
  v25 = 0;
  objc_msgSend(v14, "modelWithContentsOfURL:configuration:error:", v5, v12, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v16)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_PSTrialClient loadCoreMLModel:config:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

  }
  return v15;
}

- (id)objectForKey:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __31___PSTrialClient_objectForKey___block_invoke;
  v9[3] = &unk_1E43FF770;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)doubleForKey:(id)a3 withDefaultValue:(double)a4
{
  void *v5;
  void *v6;
  double v7;

  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    a4 = v7;
  }

  return a4;
}

- (unint64_t)integerForKey:(id)a3 withDefaultValue:(unint64_t)a4
{
  void *v5;
  void *v6;

  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

- (BOOL)BOOLForKey:(id)a3 withDefaultValue:(BOOL)a4
{
  void *v5;
  void *v6;

  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)stringForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (id)mutableDictionaryForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_msgSend(v6, "mutableCopy");
  v10 = v9;

  return v10;
}

- (id)arrayOfArraysForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (id)arrayForKey:(id)a3 withDefaultValue:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  -[_PSTrialClient objectForKey:](self, "objectForKey:", a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v6;
  v10 = v9;

  return v10;
}

- (double)userDefaultDoubleValueForKey:(id)a3 defaultToValue:(double)a4
{
  id v6;
  void *v7;
  double v8;

  v6 = a3;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[NSUserDefaults doubleForKey:](self->_userDefaults, "doubleForKey:", v6);
    a4 = v8;
  }

  return a4;
}

- (unint64_t)userDefaultIntegerValueForKey:(id)a3 defaultToValue:(unint64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = -[NSUserDefaults integerForKey:](self->_userDefaults, "integerForKey:", v6);

  return a4;
}

- (BOOL)userDefaultBoolValueForKey:(id)a3 defaultToValue:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = -[NSUserDefaults BOOLForKey:](self->_userDefaults, "BOOLForKey:", v6);

  return a4;
}

- (id)userDefaultStringValueForKey:(id)a3 defaultToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSUserDefaults stringForKey:](self->_userDefaults, "stringForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)userDefaultArrayValueForKey:(id)a3 defaultToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSUserDefaults arrayForKey:](self->_userDefaults, "arrayForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

- (id)userDefaultMutableDictionaryForKey:(id)a3 defaultToValue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(v7, "mutableCopy");
  }
  v10 = (void *)v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)loadCoreMLModel:(uint64_t)a3 config:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, a2, a3, "Couldn't load ML model, error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
