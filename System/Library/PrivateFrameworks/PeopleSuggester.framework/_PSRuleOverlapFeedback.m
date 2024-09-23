@implementation _PSRuleOverlapFeedback

- (_PSRuleOverlapFeedback)init
{
  _PSRuleOverlapFeedback *v2;
  void *v3;
  objc_class *v4;
  BMBehaviorRetriever *v5;
  BMBehaviorRetriever *behaviorRetriever;
  void *v7;
  void *v8;
  uint64_t v9;
  _CDInteractionStore *interactionStore;
  uint64_t v11;
  _DKKnowledgeQuerying *knowledgeStore;
  void *v13;
  objc_class *v14;
  CNContactStore *v15;
  CNContactStore *contactStore;
  uint64_t v17;
  NSUserDefaults *ruleOverlapFeedbackDefaults;
  _PSConfidenceModelForSharing *v19;
  _PSConfidenceModelForSharing *confidenceModelForSharing;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  Class (*v25)(uint64_t);
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v22.receiver = self;
  v22.super_class = (Class)_PSRuleOverlapFeedback;
  v2 = -[_PSRuleOverlapFeedback init](&v22, sel_init);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v3 = (void *)getBMBehaviorRetrieverClass_softClass_0;
  v31 = getBMBehaviorRetrieverClass_softClass_0;
  if (!getBMBehaviorRetrieverClass_softClass_0)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getBMBehaviorRetrieverClass_block_invoke_0;
    v26 = &unk_1E43FEA00;
    v27 = &v28;
    __getBMBehaviorRetrieverClass_block_invoke_0((uint64_t)&v23);
    v3 = (void *)v29[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v28, 8);
  v5 = (BMBehaviorRetriever *)objc_alloc_init(v4);
  behaviorRetriever = v2->_behaviorRetriever;
  v2->_behaviorRetriever = v5;

  v7 = (void *)MEMORY[0x1E0D158E0];
  objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storeWithDirectory:readOnly:", v8, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  interactionStore = v2->_interactionStore;
  v2->_interactionStore = (_CDInteractionStore *)v9;

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v11 = objc_claimAutoreleasedReturnValue();
  knowledgeStore = v2->_knowledgeStore;
  v2->_knowledgeStore = (_DKKnowledgeQuerying *)v11;

  v28 = 0;
  v29 = &v28;
  v30 = 0x2050000000;
  v13 = (void *)getCNContactStoreClass_softClass_6;
  v31 = getCNContactStoreClass_softClass_6;
  if (!getCNContactStoreClass_softClass_6)
  {
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __getCNContactStoreClass_block_invoke_6;
    v26 = &unk_1E43FEA00;
    v27 = &v28;
    __getCNContactStoreClass_block_invoke_6((uint64_t)&v23);
    v13 = (void *)v29[3];
  }
  v14 = objc_retainAutorelease(v13);
  _Block_object_dispose(&v28, 8);
  v15 = (CNContactStore *)objc_alloc_init(v14);
  contactStore = v2->_contactStore;
  v2->_contactStore = v15;

  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreBehaviorRuleFeedback"));
  ruleOverlapFeedbackDefaults = v2->_ruleOverlapFeedbackDefaults;
  v2->_ruleOverlapFeedbackDefaults = (NSUserDefaults *)v17;

  v19 = objc_alloc_init(_PSConfidenceModelForSharing);
  confidenceModelForSharing = v2->_confidenceModelForSharing;
  v2->_confidenceModelForSharing = v19;

  return v2;
}

- (void)writeRecordObjcWithData:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getDESRecordStoreClass_softClass;
  v11 = getDESRecordStoreClass_softClass;
  if (!getDESRecordStoreClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getDESRecordStoreClass_block_invoke;
    v7[3] = &unk_1E43FEA00;
    v7[4] = &v8;
    __getDESRecordStoreClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithBundleIdentifier:", CFSTR("com.apple.PeopleSuggester.ProactiveShareSheetLighthousePFLPlugin"));
  objc_msgSend(v6, "saveRecordWithData:recordInfo:completion:", v3, &unk_1E442D118, &__block_literal_global_32);

}

- (void)reviewLastDayOfShares
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, v0, v1, "Initiating rule overlap logging.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (id)getSessionID
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    -[NSUserDefaults objectForKey:](self->_ruleOverlapFeedbackDefaults, "objectForKey:", CFSTR("SessionId"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[NSUserDefaults objectForKey:](self->_ruleOverlapFeedbackDefaults, "objectForKey:", CFSTR("SessionIdDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "dateByAddingTimeInterval:", -7776000.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "compare:", v7) == -1)
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "UUIDString");
        v9 = objc_claimAutoreleasedReturnValue();

        -[NSUserDefaults setObject:forKey:](self->_ruleOverlapFeedbackDefaults, "setObject:forKey:", v9, CFSTR("SessionId"));
        -[NSUserDefaults setObject:forKey:](self->_ruleOverlapFeedbackDefaults, "setObject:forKey:", v3, CFSTR("SessionIdDate"));
        v5 = (void *)v9;
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "UUIDString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSUserDefaults setObject:forKey:](self->_ruleOverlapFeedbackDefaults, "setObject:forKey:", v5, CFSTR("SessionId"));
      -[NSUserDefaults setObject:forKey:](self->_ruleOverlapFeedbackDefaults, "setObject:forKey:", v3, CFSTR("SessionIdDate"));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)matchFeedbackEvent:(id)a3 WithInteractions:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v8)
  {
    v9 = v8;
    v23 = 0;
    v10 = *(_QWORD *)v26;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v5, "source", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundleId");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          objc_msgSend(v13, "endDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "timeIntervalSinceDate:", v24);
          if (v19 >= 0.0)
          {
            v20 = v19;
            if (v19 <= 180.0 && (!v23 || v19 < v11))
            {
              v21 = v13;

              v11 = v20;
              v23 = v21;
            }
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)loggingTrainDataForContactFillerModel:(id)a3 withMatchingInteraction:(id)a4 interactionRecipients:(id)a5 ruleRankingModel:(id)a6 contactPropertyCache:(id)a7 interactionCache:(id)a8
{
  id v14;
  id v15;
  CAPContactFillerShareEvent *v16;
  CAPContactFillerUserEvent *v17;
  _PSContactFillerNormalizationConstants *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  CAPContactFillerContactEvent *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  void *v50;
  _PSRuleOverlapFeedback *v51;
  _PSContactFillerNormalizationConstants *v52;
  id v53;
  id v54;
  CAPContactFillerShareEvent *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id obj;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v56 = a4;
  v15 = a5;
  v48 = a6;
  v54 = a7;
  v53 = a8;
  v16 = objc_alloc_init(CAPContactFillerShareEvent);
  v17 = objc_alloc_init(CAPContactFillerUserEvent);
  -[CAPContactFillerShareEvent setUserEvent:](v16, "setUserEvent:", v17);

  v18 = objc_alloc_init(_PSContactFillerNormalizationConstants);
  v19 = 0x1E43FC000uLL;
  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSContactFillerDataCollectionUtilities calculateNormContantsGivenInteractionStore:normConstants:](_PSContactFillerDataCollectionUtilities, "calculateNormContantsGivenInteractionStore:normConstants:", v20, v18);

  v55 = v16;
  -[CAPContactFillerShareEvent userEvent](v16, "userEvent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleOverlapFeedback behaviorRetriever](self, "behaviorRetriever");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  +[_PSContactFillerDataCollectionUtilities extractUserFeaturesIntoPETMessage:normConstants:behaviorRetriever:](_PSContactFillerDataCollectionUtilities, "extractUserFeaturesIntoPETMessage:normConstants:behaviorRetriever:", v21, v18, v22);

  -[_PSRuleOverlapFeedback contextItemsFromEvent:](self, "contextItemsFromEvent:", v14);
  v23 = objc_claimAutoreleasedReturnValue();
  v51 = self;
  -[_PSRuleOverlapFeedback behaviorRetriever](self, "behaviorRetriever");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)v23;
  +[_PSContactFillerDataCollectionUtilities getBehaviorRulesGivenContext:behaviorRetriever:](_PSContactFillerDataCollectionUtilities, "getBehaviorRulesGivenContext:behaviorRetriever:", v23, v24);
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[_PSRuleOverlapFeedback loggingTrainDataForContactFillerModel:withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:].cold.2(v57, v25);

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[_PSRuleOverlapFeedback loggingTrainDataForContactFillerModel:withMatchingInteraction:interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:].cold.1(v15, v26);

  v46 = v14;
  +[_PSContactFillerDataCollectionUtilities getInteractionModelScoreForEvent:forInteractionRecipients:](_PSContactFillerDataCollectionUtilities, "getInteractionModelScoreForEvent:forInteractionRecipients:", v14, v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v15;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v58)
  {
    v49 = *(_QWORD *)v62;
    v50 = v27;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v62 != v49)
          objc_enumerationMutation(obj);
        v60 = v28;
        v29 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v28);
        v30 = objc_alloc_init(CAPContactFillerContactEvent);
        v31 = *(void **)(v19 + 3800);
        objc_msgSend(obj, "objectForKeyedSubscript:", v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "firstObject");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSRuleOverlapFeedback interactionStore](v51, "interactionStore");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "startDate");
        v35 = v19;
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "extractFrequencyRecencyFeaturesIntoPETMessage:recipientID:interaction:normConstants:numberOfDaysToLookBack:interactionStore:timeOfShareInteraction:contactPropertyCache:interactionCache:", v30, v29, v33, v52, 28, v34, v36, v54, v53);

        v19 = v35;
        v37 = *(void **)(v35 + 3800);
        objc_msgSend(obj, "objectForKeyedSubscript:", v29);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "firstObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAPContactFillerContactEvent setWasShareRecipient:](v30, "setWasShareRecipient:", objc_msgSend(v37, "doesTheRecipientsMatchInInteraction1:interaction2:", v39, v56));

        v40 = *(void **)(v35 + 3800);
        objc_msgSend(obj, "objectForKeyedSubscript:", v29);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "firstObject");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "filterRulesBasedOnInteractionGivenRuleList:interaction:", v57, v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[CAPContactFillerContactEvent setNumberOfBehavioralRulesAdvocating:](v30, "setNumberOfBehavioralRulesAdvocating:", objc_msgSend(*(id *)(v35 + 3800), "contactFillerBucketedValue:", objc_msgSend(v43, "count")));
        if (objc_msgSend(v57, "count"))
          objc_msgSend(*(id *)(v35 + 3800), "extractFeaturesFromBehaviorRulesIntoPETMessage:behaviorRules:contextItems:ruleRankingModel:", v30, v43, v47, v48);
        v27 = v50;
        if (v50)
        {
          objc_msgSend(v50, "objectForKeyedSubscript:", v29);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "doubleValue");
          -[CAPContactFillerContactEvent setInteractionModelScore:](v30, "setInteractionModelScore:");

        }
        -[CAPContactFillerShareEvent addContactEvent:](v55, "addContactEvent:", v30);

        v28 = v60 + 1;
      }
      while (v58 != v60 + 1);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v58);
  }

  return v55;
}

- (void)scoreRanking:(int64_t)a3 forModelKey:(id)a4
{
  id v6;
  double v7;
  int64_t v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  if (a3 != -1)
  {
    v11 = v6;
    v7 = 0.0;
    if (a3)
    {
      v8 = 12;
      if (a3 < 12)
        v8 = a3;
      v7 = (double)(13 - v8) / 12.0;
    }
    -[_PSRuleOverlapFeedback confidenceModelForSharing](self, "confidenceModelForSharing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addEventForModel:event:", v11, v10);

    v6 = v11;
  }

}

- (void)modelAccuracyLogging:(id)a3 WithMatchingInteraction:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  _BOOL4 v25;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  id v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "modelSuggestionProxies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_61;
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v14, v9, &v73);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v73;
  v17 = v16;
  if (!v15)
    goto LABEL_60;
  v59 = v16;
  v60 = v15;
  v61 = v14;
  v62 = v7;
  v63 = v5;
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v15;
  v18 = v64;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (!v67)
    goto LABEL_59;
  v19 = CFSTR("hyperRecentSuggestionProxies");
  v65 = *(_QWORD *)v70;
  do
  {
    v20 = 0;
    do
    {
      if (*(_QWORD *)v70 != v65)
        objc_enumerationMutation(obj);
      v21 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v20);
      objc_msgSend(obj, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        v23 = 1;
        while (1)
        {
          objc_msgSend(v22, "objectAtIndexedSubscript:", v23 - 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = +[_PSContactFillerDataCollectionUtilities doesSuggestionProxyMatch:withInteraction:](_PSContactFillerDataCollectionUtilities, "doesSuggestionProxyMatch:withInteraction:", v24, v6);

          if (v25)
            break;
          if (objc_msgSend(v22, "count") <= v23++)
          {
            v27 = 0;
            goto LABEL_15;
          }
        }
        v27 = v23;
LABEL_15:
        v18 = v64;
        v19 = CFSTR("hyperRecentSuggestionProxies");
      }
      else
      {
        v27 = 0;
      }
      if (!objc_msgSend(v22, "count"))
        v27 = -1;
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("hyperRecentSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("hyperRecencyHeuristicPredictedInteractionRank"));
LABEL_53:

        -[_PSRuleOverlapFeedback scoreRanking:forModelKey:](self, "scoreRanking:forModelKey:", v27, v19);
        v19 = CFSTR("hyperRecentSuggestionProxies");
        goto LABEL_54;
      }
      v29 = CFSTR("inPhoneCallSuggestionProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("inPhoneCallSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("inPhoneCallHeuristicPredictedInteractionRank");
LABEL_52:
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v31, v32);
        v19 = v29;
        goto LABEL_53;
      }
      v29 = CFSTR("photosGroupSuggestionProxiesAssetPresence");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("photosGroupSuggestionProxiesAssetPresence")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("photoAssetHeuristicPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("photoSuggestionProxiesFilteredByAssetOrMomentPresence");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("photoSuggestionProxiesFilteredByAssetOrMomentPresence")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("photoAssetOrMomentHeuristicPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("photosGroupSuggestionProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("photosGroupSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("photoGroupHeuristicPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("miningSuggestionProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("miningSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("miningPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("portraitContactSuggestionProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("portraitContactSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("topicHeuristicPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnSharesAllProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnSharesAllProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnSharesAllPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnSharesTopProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnSharesTopProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnSharesTopPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnSharesAllAndAppFilterOnProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnSharesAllAndAppFilterOnProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnSharesAllAndAppFilterOnPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnSharesTopAndAppFilterOnProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnSharesTopAndAppFilterOnProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnSharesTopAndAppFilterOnPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnExpanseSessionsTopAndAppFilterOnProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnExpanseSessionsTopAndAppFilterOnProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnExpanseSessionsTopAndAppFilterOnPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnExpanseSessionsAllAndAppFilterOnProxiesKey");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnExpanseSessionsAllAndAppFilterOnProxiesKey")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnExpanseSessionsAllAndAppFilterOnPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnExpanseSessionsTopProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnExpanseSessionsTopProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnExpanseSessionsTopPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnExpanseSessionsAllProxiesKey");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnExpanseSessionsAllProxiesKey")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnExpanseSessionsAllPredictedInteractionRank");
        goto LABEL_52;
      }
      v29 = CFSTR("knnSuggestionBasedOnInteractionsProxies");
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("knnSuggestionBasedOnInteractionsProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v18;
        v31 = v28;
        v32 = CFSTR("knnNonShareInteractionsInteractionRank");
        goto LABEL_52;
      }
      if (objc_msgSend(v21, "isEqualToString:", CFSTR("sharingContactRankerModelSuggestionProxies")))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v28, CFSTR("sharingContactRankerInteractionRank"));
        v19 = CFSTR("sharingContactRankerModelSuggestionProxies");
        goto LABEL_53;
      }
LABEL_54:

      ++v20;
    }
    while (v20 != v67);
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    v67 = v33;
  }
  while (v33);
LABEL_59:

  v7 = v62;
  v5 = v63;
  v14 = v61;
  v17 = v59;
  v15 = v60;
LABEL_60:

LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_PSRuleOverlapFeedback wasInteractionAmongSuggestLess:](self, "wasInteractionAmongSuggestLess:", v6));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v34, CFSTR("wasInteractionRecipientAmongSuggestLess"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "peopleSuggestionsDisabled");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v36, CFSTR("peopleSuggestionsDisabled"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "adaptedModelRecipeID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v38, CFSTR("adaptedModelRecipeID"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "engagementType");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v40, CFSTR("engagementType"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "iCloudFamilyInvocation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v42, CFSTR("iCloudFamilyInvocation"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "isAdaptedModelCreated");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v44, CFSTR("isAdaptedModelCreated"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "isAdaptedModelUsed");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v46, CFSTR("isAdaptedModelUsed"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "reasonType");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v48, CFSTR("reasonType"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "trackingID");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v50, CFSTR("trackingID"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "transportBundleID");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v52, CFSTR("transportBundleID"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "sourceBundleID");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v54, CFSTR("sourceBundleID"));

  objc_msgSend(MEMORY[0x1E0D15AE0], "supportedBundleIDs");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setObject:forKeyedSubscript:", v56, CFSTR("supportedBundleIDs"));

  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    -[_PSRuleOverlapFeedback modelAccuracyLogging:WithMatchingInteraction:].cold.1();

  v58 = v64;
  AnalyticsSendEventLazy();

}

- (BOOL)wasInteractionAmongSuggestLess:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15;
  v38 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PeopleSuggester");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SuggestLessFeedback");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "publisherWithUseCase:", CFSTR("PeopleSuggesterSuggestLessFeedback"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __57___PSRuleOverlapFeedback_wasInteractionAmongSuggestLess___block_invoke_238;
  v33[3] = &unk_1E43FECB8;
  v33[4] = &v34;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_237, v33);
  v25 = v6;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = (id)v35[5];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (v8)
  {
    v28 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v28)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[_PSContactFillerDataCollectionUtilities getInteractionRecipientFromInteraction:](_PSContactFillerDataCollectionUtilities, "getInteractionRecipientFromInteraction:", v3, v25);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v10, "derivedIntentId");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v11);

          if ((v13 & 1) != 0)
            goto LABEL_16;
        }
        objc_msgSend(v3, "recipients");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v3, "recipients");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count") == 1;

          if (v16)
          {
            objc_msgSend(v3, "recipients");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v10, "contactId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "personId");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v19, "isEqualToString:", v20))
            {

LABEL_16:
              LOBYTE(v8) = 1;
              goto LABEL_17;
            }
            objc_msgSend(v10, "contactId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "identifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v21, "isEqualToString:", v22);

            if ((v23 & 1) != 0)
              goto LABEL_16;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:

  _Block_object_dispose(&v34, 8);
  return v8;
}

- (void)loggingForKnowledgeStoreEvent:(id)a3 WithMatchingInteraction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
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
  _BOOL8 v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  char v46;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  _BOOL8 v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id obj;
  _PSRuleOverlapFeedback *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  void *v88;
  void *v89;
  uint8_t buf[8];
  uint64_t v91;
  uint64_t v92;
  id (*v93)(uint64_t);
  void *v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  void *v100;
  void *v101;
  id v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v85 = v6;
  -[_PSRuleOverlapFeedback contextItemsFromEvent:](self, "contextItemsFromEvent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMRetrievalFilterClass_0(), "filterWithOperand:inclusionOperator:items:", 1, 0, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionRecipients");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)v10;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v10, v72, 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getBMRetrievalFilterClass_0(), "filterWithOperand:inclusionOperator:types:", 2, 2, v71);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v9, v70, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  -[_PSRuleOverlapFeedback behaviorRetriever](self, "behaviorRetriever");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)v11;
  objc_msgSend(v12, "retrieveRulesWithSupport:confidence:filters:", v11, 0.0, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSRuleOverlapFeedback constantFeaturesFromContextItems:](self, "constantFeaturesFromContextItems:", v8);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSRuleOverlapFeedback constantPETFeaturesFromContextItems:](self, "constantPETFeaturesFromContextItems:", v8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  if (os_variant_has_internal_content())
  {
    -[NSUserDefaults objectForKey:](self->_ruleOverlapFeedbackDefaults, "objectForKey:", CFSTR("SessionId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
      -[NSUserDefaults setObject:forKey:](self->_ruleOverlapFeedbackDefaults, "setObject:forKey:", v17, CFSTR("SessionId"));
    }
  }
  v80 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v75 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v75, "addObject:", &unk_1E442B3C0);
  v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  obj = v13;
  v82 = v15;
  v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
  if (v87)
  {
    v18 = 0x1E0CB3000uLL;
    v81 = *(_QWORD *)v97;
    v78 = v8;
    v79 = v7;
    v77 = self;
    do
    {
      for (i = 0; i != v87; ++i)
      {
        if (*(_QWORD *)v97 != v81)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
        -[_PSRuleOverlapFeedback feedbackPayloadForRule:ForInteraction:ForContextItems:WithConstantFeatures:](self, "feedbackPayloadForRule:ForInteraction:ForContextItems:WithConstantFeatures:", v20, v7, v8, v84);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "consequent");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "valueForKey:", CFSTR("type"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = *(void **)(v18 + 2024);
        objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = v23;
        objc_msgSend(v24, "numberWithBool:", objc_msgSend(v23, "containsObject:", v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("targetBundleIDInConsequent"));

        objc_msgSend(v21, "setObject:forKeyedSubscript:", v88, CFSTR("uniqueShareEventIdentifier"));
        objc_msgSend(v85, "metadata");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D15AE0], "targetBundleID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          v30 = +[_PSContactFillerDataCollectionUtilities recipientPredictedCorrectlyByRule:interaction:bundleId:](_PSContactFillerDataCollectionUtilities, "recipientPredictedCorrectlyByRule:interaction:bundleId:", v20, v7, v29);
          v31 = -[_PSRuleOverlapFeedback targetAppPredictedCorrectlyByRule:bundleId:](self, "targetAppPredictedCorrectlyByRule:bundleId:", v20, v29);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v32, CFSTR("personMatched"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30 & v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, CFSTR("personAndAppMatched"));

          objc_msgSend(v20, "consequent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectsPassingTest:", &__block_literal_global_255);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "valueForKey:", CFSTR("value"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "consequent");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectsPassingTest:", &__block_literal_global_258);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "valueForKey:", CFSTR("value"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = &stru_1E4402490;
          if (objc_msgSend(v36, "count") == 1)
          {
            objc_msgSend(v36, "anyObject");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&stru_1E4402490, "stringByAppendingString:", v41);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          if (objc_msgSend(v39, "count") == 1)
          {
            objc_msgSend(v39, "anyObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[__CFString stringByAppendingString:](v40, "stringByAppendingString:", v42);
            v43 = objc_claimAutoreleasedReturnValue();

            v40 = (__CFString *)v43;
          }
          v44 = v80;
          objc_msgSend(v80, "allKeys");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "containsObject:", v40);

          if ((v46 & 1) == 0)
          {
            v47 = arc4random();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v75, "containsObject:", v48);

            if (v49)
            {
              do
              {
                v47 = arc4random();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = objc_msgSend(v75, "containsObject:", v50);

              }
              while ((v51 & 1) != 0);
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v47);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = v80;
            objc_msgSend(v80, "setValue:forKey:", v52, v40);

          }
          objc_msgSend(v44, "valueForKey:", v40);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v53, CFSTR("recipientAndBundleIDAsInteger"));

          v8 = v78;
          v7 = v79;
          self = v77;
        }
        v91 = MEMORY[0x1E0C809B0];
        v92 = 3221225472;
        v93 = __80___PSRuleOverlapFeedback_loggingForKnowledgeStoreEvent_WithMatchingInteraction___block_invoke_3;
        v94 = &unk_1E4401480;
        v54 = v21;
        v95 = v54;
        AnalyticsSendEventLazy();
        objc_msgSend(getPETEventTracker2Class(), "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSRuleOverlapFeedback feedbackPETPayloadForRule:ForInteraction:ForContextItems:WithConstantFeatures:](self, "feedbackPETPayloadForRule:ForInteraction:ForContextItems:WithConstantFeatures:", v20, v7, v8, v83);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setTargetBundleIDInConsequent:", objc_msgSend(v89, "containsObject:", v57));

        objc_msgSend(v56, "setUniqueShareEventIdentifier:", v88);
        if (v29)
        {
          v58 = +[_PSContactFillerDataCollectionUtilities recipientPredictedCorrectlyByRule:interaction:bundleId:](_PSContactFillerDataCollectionUtilities, "recipientPredictedCorrectlyByRule:interaction:bundleId:", v20, v7, v29);
          v59 = -[_PSRuleOverlapFeedback targetAppPredictedCorrectlyByRule:bundleId:](self, "targetAppPredictedCorrectlyByRule:bundleId:", v20, v29);
          objc_msgSend(v56, "setPersonMatched:", v58);
          objc_msgSend(v56, "setPersonAndAppMatched:", v58 & v59);
        }
        v15 = v82;
        if (v82)
          objc_msgSend(v56, "setSessionId:", v82);
        objc_msgSend(v55, "logMessage:", v56);
        objc_msgSend(v86, "addObject:", v54);

        v18 = 0x1E0CB3000;
      }
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v103, 16);
    }
    while (v87);
  }

  if (v86)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D159B0], "featureDict");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v61;
    v102 = v86;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = (void *)MEMORY[0x1E0D159F8];
    objc_msgSend(MEMORY[0x1E0D15AF8], "behavioralRuleFeaturesStream");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v64, v60, v60, &stru_1E4402490, v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
      v66 = objc_claimAutoreleasedReturnValue();
      v100 = v65;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject saveObjects:tracker:responseQueue:withCompletion:](v66, "saveObjects:tracker:responseQueue:withCompletion:", v67, &__block_literal_global_265_0, 0, &__block_literal_global_267_0);

    }
    else
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        -[_PSRuleOverlapFeedback loggingForKnowledgeStoreEvent:WithMatchingInteraction:].cold.1();
    }
    v15 = v82;

  }
  +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v68, OS_LOG_TYPE_INFO, "Done with persisting featureDict in Knowledge store.", buf, 2u);
  }

}

- (id)feedbackPETPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6
{
  id v8;
  id v9;
  id v10;
  CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *v11;
  void *v12;
  void *v13;
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
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  uint64_t v51;
  void *v52;
  int v53;
  void *v54;
  uint64_t v55;
  void *v56;
  int v57;
  void *v58;
  int v59;
  _BOOL8 v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;

  v8 = a3;
  v9 = a6;
  v10 = a5;
  v11 = objc_alloc_init(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent);
  objc_msgSend(v9, "copyTo:", v11);

  objc_msgSend(v8, "antecedent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKey:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  objc_msgSend(getBMItemTypeClass_0(), "isWeekend");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setIsWeekendInRule:](v11, "setIsWeekendInRule:", objc_msgSend(v14, "containsObject:", v15));

  objc_msgSend(getBMItemTypeClass_0(), "hourOfDaySlot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTimeOfDaySlotInRule:](v11, "setTimeOfDaySlotInRule:", objc_msgSend(v14, "containsObject:", v16));

  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeInRule:](v11, "setUtiTypeInRule:", objc_msgSend(v14, "containsObject:", v17));

  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlInRule:](v11, "setContentUrlInRule:", objc_msgSend(v14, "containsObject:", v18));

  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdInRule:](v11, "setSourceBundleIdInRule:", objc_msgSend(v14, "containsObject:", v19));

  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdInRule:](v11, "setTargetBundleIdInRule:", objc_msgSend(v14, "containsObject:", v20));

  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIInRule:](v11, "setLOIInRule:", objc_msgSend(v14, "containsObject:", v21));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = objc_msgSend(v14, "containsObject:", v22);

  if ((_DWORD)v13)
  {
    objc_msgSend(v8, "antecedent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectsPassingTest:", &__block_literal_global_269_0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

  }
  else
  {
    v25 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactInRule:](v11, "setPhotoContactInRule:", v25);
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v14, "containsObject:", v26);

  if (v27)
  {
    objc_msgSend(v8, "antecedent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectsPassingTest:", &__block_literal_global_270_0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

  }
  else
  {
    v30 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneInRule:](v11, "setPhotoSceneInRule:", v30);
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v14, "containsObject:", v31);

  if (v32)
  {
    objc_msgSend(v8, "antecedent");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectsPassingTest:", &__block_literal_global_271_1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    v36 = v35 != 0;
  }
  else
  {
    v36 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicInRule:](v11, "setTopicInRule:", v36);
  objc_msgSend(v8, "antecedent");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "mutableCopy");

  objc_msgSend(v38, "intersectSet:", v10);
  objc_msgSend(v38, "valueForKey:", CFSTR("type"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "mutableCopy");

  objc_msgSend(getBMItemTypeClass_0(), "isWeekend");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setIsWeekendOverlap:](v11, "setIsWeekendOverlap:", objc_msgSend(v40, "containsObject:", v41));

  objc_msgSend(getBMItemTypeClass_0(), "hourOfDaySlot");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTimeOfDaySlotOverlap:](v11, "setTimeOfDaySlotOverlap:", objc_msgSend(v40, "containsObject:", v42));

  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeOverlap:](v11, "setUtiTypeOverlap:", objc_msgSend(v40, "containsObject:", v43));

  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlOverlap:](v11, "setContentUrlOverlap:", objc_msgSend(v40, "containsObject:", v44));

  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdOverlap:](v11, "setSourceBundleIdOverlap:", objc_msgSend(v40, "containsObject:", v45));

  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdOverlap:](v11, "setTargetBundleIdOverlap:", objc_msgSend(v40, "containsObject:", v46));

  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIOverlap:](v11, "setLOIOverlap:", objc_msgSend(v40, "containsObject:", v47));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v40, "containsObject:", v48);

  if (v49)
  {
    objc_msgSend(v38, "objectsPassingTest:", &__block_literal_global_272);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "count");

  }
  else
  {
    v51 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactOverlap:](v11, "setPhotoContactOverlap:", v51);
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v40, "containsObject:", v52);

  if (v53)
  {
    objc_msgSend(v38, "objectsPassingTest:", &__block_literal_global_273_0);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "count");

  }
  else
  {
    v55 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneOverlap:](v11, "setPhotoSceneOverlap:", v55);
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v40, "containsObject:", v56);

  if (v57)
  {
    objc_msgSend(v38, "objectsPassingTest:", &__block_literal_global_274_0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "count");

    v60 = v59 != 0;
  }
  else
  {
    v60 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicOverlap:](v11, "setTopicOverlap:", v60);
  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "support");
  objc_msgSend(v61, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "stringValue");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSupport:](v11, "setSupport:", v63);

  v64 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "confidence");
  objc_msgSend(v64, "numberWithDouble:");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringValue");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setConfidence:](v11, "setConfidence:", v66);

  return v11;
}

- (id)feedbackPayloadForRule:(id)a3 ForInteraction:(id)a4 ForContextItems:(id)a5 WithConstantFeatures:(id)a6
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0C99E08];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "antecedent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("type"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "isWeekend");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "numberWithBool:", objc_msgSend(v15, "containsObject:", v17));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("isWeekendInRule"));

  v19 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "hourOfDaySlot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithBool:", objc_msgSend(v15, "containsObject:", v20));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("timeOfDaySlotInRule"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithBool:", objc_msgSend(v15, "containsObject:", v23));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("utiTypeInRule"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithBool:", objc_msgSend(v15, "containsObject:", v26));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("contentUrlInRule"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithBool:", objc_msgSend(v15, "containsObject:", v29));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v30, CFSTR("sourceBundleIdInRule"));

  v31 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "numberWithBool:", objc_msgSend(v15, "containsObject:", v32));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v33, CFSTR("targetBundleIdInRule"));

  v34 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithBool:", objc_msgSend(v15, "containsObject:", v35));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("LOIInRule"));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v35) = objc_msgSend(v15, "containsObject:", v37);

  if ((_DWORD)v35)
  {
    objc_msgSend(v8, "antecedent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectsPassingTest:", &__block_literal_global_289_0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v41, CFSTR("photoContactInRule"));

  }
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v15, "containsObject:", v42);

  if (v43)
  {
    objc_msgSend(v8, "antecedent");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectsPassingTest:", &__block_literal_global_292);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v47, CFSTR("photoSceneInRule"));

  }
  objc_msgSend(v8, "antecedent");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "mutableCopy");

  objc_msgSend(v49, "intersectSet:", v11);
  objc_msgSend(v49, "valueForKey:", CFSTR("type"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)objc_msgSend(v50, "mutableCopy");

  v52 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "isWeekend");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "numberWithBool:", objc_msgSend(v51, "containsObject:", v53));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v54, CFSTR("isWeekendOverlap"));

  v55 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "hourOfDaySlot");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "numberWithBool:", objc_msgSend(v51, "containsObject:", v56));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v57, CFSTR("timeOfDaySlotOverlap"));

  v58 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "numberWithBool:", objc_msgSend(v51, "containsObject:", v59));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v60, CFSTR("utiTypeOverlap"));

  v61 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "numberWithBool:", objc_msgSend(v51, "containsObject:", v62));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v63, CFSTR("contentUrlOverlap"));

  v64 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "numberWithBool:", objc_msgSend(v51, "containsObject:", v65));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v66, CFSTR("sourceBundleIdOverlap"));

  v67 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "numberWithBool:", objc_msgSend(v51, "containsObject:", v68));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v69, CFSTR("targetBundleIdOverlap"));

  v70 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "numberWithBool:", objc_msgSend(v51, "containsObject:", v71));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v72, CFSTR("LOIOverlap"));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v71) = objc_msgSend(v51, "containsObject:", v73);

  if ((_DWORD)v71)
  {
    objc_msgSend(v49, "objectsPassingTest:", &__block_literal_global_309_0);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend(v74, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v76, CFSTR("photoContactOverlap"));

  }
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v51, "containsObject:", v77);

  if (v78)
  {
    objc_msgSend(v49, "objectsPassingTest:", &__block_literal_global_312);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v81, CFSTR("photoSceneOverlap"));

  }
  v82 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "support");
  objc_msgSend(v82, "numberWithDouble:");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v83, CFSTR("support"));

  v84 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "confidence");
  objc_msgSend(v84, "numberWithDouble:");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v85, CFSTR("confidence"));

  objc_msgSend(v12, "addEntriesFromDictionary:", v10);
  return v12;
}

- (BOOL)targetAppPredictedCorrectlyByRule:(id)a3 bundleId:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(a3, "consequent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsPassingTest:", &__block_literal_global_319);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v8, "containsObject:", v5);
  return (char)v6;
}

- (id)constantFeaturesFromContextItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  int v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  _PSRuleOverlapFeedback *v104;
  id obj;
  uint64_t v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  unsigned int v112;
  void *v113;
  unsigned int v114;
  void *v115;
  unsigned int v116;
  void *v117;
  void *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  id v127;
  id v128;
  id v129;
  _BYTE v130[128];
  uint8_t v131[128];
  uint8_t buf[4];
  id v133;
  __int16 v134;
  id v135;
  __int16 v136;
  id v137;
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v100 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3D8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("direction IN %@"), v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3F0, &unk_1E442B408, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("direction IN %@"), v9);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3F0, &unk_1E442B408, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism == %@"), v12, &unk_1E442B420);
  v13 = objc_claimAutoreleasedReturnValue();

  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = 0;
  v98 = (void *)v10;
  v15 = objc_msgSend(v14, "countInteractionsUsingPredicate:error:", v10, &v129);
  v16 = v129;

  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = 0;
  v99 = (void *)v7;
  v18 = objc_msgSend(v17, "countInteractionsUsingPredicate:error:", v7, &v128);
  v103 = v128;

  v104 = self;
  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = 0;
  v97 = (void *)v13;
  v20 = objc_msgSend(v19, "countInteractionsUsingPredicate:error:", v13, &v127);
  v21 = v127;

  v102 = v16;
  if (__PAIR128__((unint64_t)v103, (unint64_t)v16) != 0 || v21)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v133 = v16;
      v134 = 2112;
      v135 = v103;
      v136 = 2112;
      v137 = v21;
      _os_log_error_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_ERROR, "Interaction store retrieval error. Sent messages query: %@, Recieved messages query: %@, Shares query: %@", buf, 0x20u);
    }

  }
  v96 = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v15));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("totalMessagesSent"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v18));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("totalMessagesRecieved"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v20));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v4;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v25, CFSTR("totalShares"));

  -[BMBehaviorRetriever retrieveRulesWithFilters:](self->_behaviorRetriever, "retrieveRulesWithFilters:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  v126 = 0u;
  obj = v26;
  v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
  if (v109)
  {
    v114 = 0;
    v112 = 0;
    v108 = 0;
    v107 = 0;
    v116 = 0;
    v27 = 0;
    v28 = 0;
    v106 = *(_QWORD *)v124;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v124 != v106)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v29);
        objc_msgSend(v30, "confidence");
        v110 = v29;
        if (v31 <= 0.75)
        {
          objc_msgSend(v30, "confidence");
          if (v32 <= 0.25)
            v33 = v108;
          else
            v33 = v108 + 1;
          if (v32 > 0.25)
            v34 = v107;
          else
            v34 = v107 + 1;
          v107 = v34;
          LODWORD(v108) = v33;
        }
        else
        {
          ++HIDWORD(v108);
        }
        v121 = 0u;
        v122 = 0u;
        v119 = 0u;
        v120 = 0u;
        objc_msgSend(v30, "antecedent");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v120;
          do
          {
            for (i = 0; i != v37; ++i)
            {
              if (*(_QWORD *)v120 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
              objc_msgSend(v40, "type");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v41, "isEqual:", v42);

              if (v43)
              {
                objc_msgSend(v118, "addObject:", v40);
                v28 = (v28 + 1);
              }
              else
              {
                objc_msgSend(v40, "type");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                v46 = objc_msgSend(v44, "isEqual:", v45);

                if (v46)
                {
                  objc_msgSend(v117, "addObject:", v40);
                  v27 = (v27 + 1);
                }
                else
                {
                  objc_msgSend(v40, "type");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  v49 = objc_msgSend(v47, "isEqual:", v48);

                  if (v49)
                  {
                    objc_msgSend(v115, "addObject:", v40);
                    ++v116;
                  }
                  else
                  {
                    objc_msgSend(v40, "type");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    v52 = objc_msgSend(v50, "isEqual:", v51);

                    if (v52)
                    {
                      objc_msgSend(v113, "addObject:", v40);
                      ++v114;
                    }
                    else
                    {
                      objc_msgSend(v40, "type");
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = objc_msgSend(v53, "isEqual:", v54);

                      if (v55)
                      {
                        objc_msgSend(v111, "addObject:", v40);
                        ++v112;
                      }
                    }
                  }
                }
              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v119, v130, 16);
          }
          while (v37);
        }

        v29 = v110 + 1;
      }
      while (v110 + 1 != v109);
      v109 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v131, 16);
    }
    while (v109);
  }
  else
  {
    v114 = 0;
    v112 = 0;
    v108 = 0;
    v107 = 0;
    v116 = 0;
    v27 = 0;
    v28 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v107));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v56, CFSTR("lowConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v108));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v57, CFSTR("mediumConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", HIDWORD(v108)));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v58, CFSTR("highConfidenceRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v28));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v59, CFSTR("photoContactContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v27));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v60, CFSTR("photoSceneContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v116));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v61, CFSTR("sourceBundleIdContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v114));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v62, CFSTR("targetBundleIdContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", v112));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v63, CFSTR("locationOfInterestContainingRuleCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v118, "count")));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v64, CFSTR("photoContactRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v117, "count")));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v65, CFSTR("photoSceneRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v115, "count")));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v66, CFSTR("sourceBundleIdRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v113, "count")));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v67, CFSTR("targetBundleIdRulesCardinality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[_PSRuleOverlapFeedback bucketedValue:](v104, "bucketedValue:", objc_msgSend(v111, "count")));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v68, CFSTR("locationOfInterestRulesCardinality"));

  objc_msgSend(v100, "valueForKey:", CFSTR("type"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "mutableCopy");

  v71 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "numberWithBool:", objc_msgSend(v70, "containsObject:", v72));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v73, CFSTR("utiTypeInContext"));

  v74 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "numberWithBool:", objc_msgSend(v70, "containsObject:", v75));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v76, CFSTR("contentUrlInContext"));

  v77 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "numberWithBool:", objc_msgSend(v70, "containsObject:", v78));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v79, CFSTR("sourceBundleIdInContext"));

  v80 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "numberWithBool:", objc_msgSend(v70, "containsObject:", v81));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v82, CFSTR("targetBundleIdInContext"));

  v83 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "numberWithBool:", objc_msgSend(v70, "containsObject:", v84));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "setObject:forKeyedSubscript:", v85, CFSTR("LOIInContext"));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v84) = objc_msgSend(v70, "containsObject:", v86);

  if ((_DWORD)v84)
  {
    objc_msgSend(v100, "objectsPassingTest:", &__block_literal_global_372);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(v87, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setObject:forKeyedSubscript:", v89, CFSTR("photoContactInContext"));

  }
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v70, "containsObject:", v90);

  if (v91)
  {
    objc_msgSend(v100, "objectsPassingTest:", &__block_literal_global_375);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "count");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setObject:forKeyedSubscript:", v94, CFSTR("photoSceneInContext"));

  }
  return v101;
}

- (id)constantPETFeaturesFromContextItems:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  int v29;
  unsigned int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  void *v68;
  uint64_t v69;
  void *v70;
  int v71;
  void *v72;
  int v73;
  _BOOL8 v74;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  _PSRuleOverlapFeedback *v83;
  CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent *v84;
  id obj;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  unsigned int v92;
  void *v93;
  unsigned int v94;
  void *v95;
  unsigned int v96;
  void *v97;
  unsigned int v98;
  void *v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  id v110;
  id v111;
  _BYTE v112[128];
  uint8_t v113[128];
  uint8_t buf[4];
  id v115;
  __int16 v116;
  id v117;
  __int16 v118;
  id v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v84 = objc_alloc_init(CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent);
  v4 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3D8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("direction IN %@"), v5);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3F0, &unk_1E442B408, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("direction IN %@"), v8);
  v9 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E442B3F0, &unk_1E442B408, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("direction IN %@ && mechanism == %@"), v11, &unk_1E442B420);
  v12 = objc_claimAutoreleasedReturnValue();

  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0;
  v79 = (void *)v9;
  v14 = objc_msgSend(v13, "countInteractionsUsingPredicate:error:", v9, &v111);
  v15 = v111;

  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = 0;
  v80 = (void *)v6;
  v17 = objc_msgSend(v16, "countInteractionsUsingPredicate:error:", v6, &v110);
  v82 = v110;

  v83 = self;
  -[_PSRuleOverlapFeedback interactionStore](self, "interactionStore");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0;
  v78 = (void *)v12;
  v19 = objc_msgSend(v18, "countInteractionsUsingPredicate:error:", v12, &v109);
  v20 = v109;

  if (v15 || v82 || v20)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v115 = v15;
      v116 = 2112;
      v117 = v82;
      v118 = 2112;
      v119 = v20;
      _os_log_error_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_ERROR, "Interaction store retrieval error. Sent messages query: %@, Recieved messages query: %@, Shares query: %@", buf, 0x20u);
    }

  }
  v76 = v20;
  v77 = v15;
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTotalMessagesSent:](v84, "setTotalMessagesSent:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v14));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTotalMessagesRecieved:](v84, "setTotalMessagesRecieved:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v17));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTotalShares:](v84, "setTotalShares:", -[_PSRuleOverlapFeedback bucketedValue:](self, "bucketedValue:", v19));
  -[BMBehaviorRetriever retrieveRulesWithFilters:](self->_behaviorRetriever, "retrieveRulesWithFilters:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = v22;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
  if (v89)
  {
    v92 = 0;
    v88 = 0;
    v87 = 0;
    v94 = 0;
    v96 = 0;
    v98 = 0;
    v23 = 0;
    v24 = 0;
    v86 = *(_QWORD *)v106;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v106 != v86)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v25);
        objc_msgSend(v26, "confidence");
        v90 = v25;
        if (v27 <= 0.75)
        {
          objc_msgSend(v26, "confidence");
          if (v28 <= 0.25)
            v29 = v88;
          else
            v29 = v88 + 1;
          if (v28 > 0.25)
            v30 = v87;
          else
            v30 = v87 + 1;
          v87 = v30;
          LODWORD(v88) = v29;
        }
        else
        {
          ++HIDWORD(v88);
        }
        v103 = 0u;
        v104 = 0u;
        v101 = 0u;
        v102 = 0u;
        objc_msgSend(v26, "antecedent");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v102;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v102 != v34)
                objc_enumerationMutation(v31);
              v36 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
              objc_msgSend(v36, "type");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v37, "isEqual:", v38);

              if (v39)
              {
                objc_msgSend(v100, "addObject:", v36);
                v24 = (v24 + 1);
              }
              else
              {
                objc_msgSend(v36, "type");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v40, "isEqual:", v41);

                if (v42)
                {
                  objc_msgSend(v99, "addObject:", v36);
                  v23 = (v23 + 1);
                }
                else
                {
                  objc_msgSend(v36, "type");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v43, "isEqual:", v44);

                  if (v45)
                  {
                    objc_msgSend(v97, "addObject:", v36);
                    ++v98;
                  }
                  else
                  {
                    objc_msgSend(v36, "type");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    v48 = objc_msgSend(v46, "isEqual:", v47);

                    if (v48)
                    {
                      objc_msgSend(v95, "addObject:", v36);
                      ++v96;
                    }
                    else
                    {
                      objc_msgSend(v36, "type");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      v51 = objc_msgSend(v49, "isEqual:", v50);

                      if (v51)
                      {
                        objc_msgSend(v93, "addObject:", v36);
                        ++v94;
                      }
                      else
                      {
                        objc_msgSend(v36, "type");
                        v52 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
                        v53 = (void *)objc_claimAutoreleasedReturnValue();
                        v54 = objc_msgSend(v52, "isEqual:", v53);

                        if (v54)
                        {
                          objc_msgSend(v91, "addObject:", v36);
                          ++v92;
                        }
                      }
                    }
                  }
                }
              }
            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
          }
          while (v33);
        }

        v25 = v90 + 1;
      }
      while (v90 + 1 != v89);
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v113, 16);
    }
    while (v89);
  }
  else
  {
    v92 = 0;
    v88 = 0;
    v87 = 0;
    v94 = 0;
    v96 = 0;
    v98 = 0;
    v23 = 0;
    v24 = 0;
  }

  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLowConfidenceRuleCount:](v84, "setLowConfidenceRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v87));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setMediumConfidenceRuleCount:](v84, "setMediumConfidenceRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v88));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setHighConfidenceRuleCount:](v84, "setHighConfidenceRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", HIDWORD(v88)));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactContainingRuleCount:](v84, "setPhotoContactContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v24));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneContainingRuleCount:](v84, "setPhotoSceneContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v23));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdContainingRuleCount:](v84, "setSourceBundleIdContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v98));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdContainingRuleCount:](v84, "setTargetBundleIdContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v96));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLocationOfInterestContainingRuleCount:](v84, "setLocationOfInterestContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v94));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicContainingRuleCount:](v84, "setTopicContainingRuleCount:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", v92));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactRulesCardinality:](v84, "setPhotoContactRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v100, "count")));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneRulesCardinality:](v84, "setPhotoSceneRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v99, "count")));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdRulesCardinality:](v84, "setSourceBundleIdRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v97, "count")));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdRulesCardinality:](v84, "setTargetBundleIdRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v95, "count")));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLocationOfInterestRulesCardinality:](v84, "setLocationOfInterestRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v93, "count")));
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicRulesCardinality:](v84, "setTopicRulesCardinality:", -[_PSRuleOverlapFeedback bucketedValue:](v83, "bucketedValue:", objc_msgSend(v91, "count")));
  objc_msgSend(v81, "valueForKey:", CFSTR("type"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "mutableCopy");

  objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setUtiTypeInContext:](v84, "setUtiTypeInContext:", objc_msgSend(v56, "containsObject:", v57));

  objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setContentUrlInContext:](v84, "setContentUrlInContext:", objc_msgSend(v56, "containsObject:", v58));

  objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setSourceBundleIdInContext:](v84, "setSourceBundleIdInContext:", objc_msgSend(v56, "containsObject:", v59));

  objc_msgSend(getBMItemTypeClass_0(), "interactionTargetBundleID");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTargetBundleIdInContext:](v84, "setTargetBundleIdInContext:", objc_msgSend(v56, "containsObject:", v60));

  objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setLOIInContext:](v84, "setLOIInContext:", objc_msgSend(v56, "containsObject:", v61));

  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v56, "containsObject:", v62);

  if (v63)
  {
    objc_msgSend(v81, "objectsPassingTest:", &__block_literal_global_378_0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "count");

  }
  else
  {
    v65 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoContactInContext:](v84, "setPhotoContactInContext:", v65);
  objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoScene");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v56, "containsObject:", v66);

  if (v67)
  {
    objc_msgSend(v81, "objectsPassingTest:", &__block_literal_global_379);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "count");

  }
  else
  {
    v69 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setPhotoSceneInContext:](v84, "setPhotoSceneInContext:", v69);
  objc_msgSend(getBMItemTypeClass_0(), "interactionExtractedTopicFromAttachment");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v56, "containsObject:", v70);

  if (v71)
  {
    objc_msgSend(v81, "objectsPassingTest:", &__block_literal_global_380);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v72, "count");

    v74 = v73 != 0;
  }
  else
  {
    v74 = 0;
  }
  -[CoreBehaviorAnalysisPETCoreBehaviorAnalysisEvent setTopicInContext:](v84, "setTopicInContext:", v74);

  return v84;
}

- (id)contextItemsFromEvent:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id BMItemClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  uint64_t v67;
  id v68;
  void *v69;
  void *v70;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  void *v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v77 = v3;
  objc_msgSend(v3, "metadata");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AE0], "locationUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKeyedSubscript:", v5);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v7 = v75;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v88;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v88 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
          BMItemClass = getBMItemClass();
          objc_msgSend(getBMItemTypeClass_0(), "locationIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "UUIDString");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(BMItemClass, "itemWithType:stringValue:", v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v6, "addObject:", v15);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v87, v98, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "unionSet:", v6);
  }
  objc_msgSend(v77, "source");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (!v18)
  {
    v19 = getBMItemClass();
    objc_msgSend(getBMItemTypeClass_0(), "interactionSharingSourceBundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "source");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "itemWithType:stringValue:", v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
      objc_msgSend(v4, "addObject:", v23);

  }
  objc_msgSend(v77, "startDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "components:fromDate:", 32, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = getBMItemClass();
    objc_msgSend(getBMItemTypeClass_0(), "hourOfDaySlot");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB37E8];
    v32 = objc_msgSend(v28, "hour");
    v92 = 0;
    v93 = &v92;
    v94 = 0x2020000000;
    v33 = (uint64_t (*)(uint64_t))getBMHourSlotForHourOfDaySymbolLoc_ptr;
    v95 = getBMHourSlotForHourOfDaySymbolLoc_ptr;
    if (!getBMHourSlotForHourOfDaySymbolLoc_ptr)
    {
      v91[0] = MEMORY[0x1E0C809B0];
      v91[1] = 3221225472;
      v91[2] = __getBMHourSlotForHourOfDaySymbolLoc_block_invoke;
      v91[3] = &unk_1E43FEA00;
      v91[4] = &v92;
      __getBMHourSlotForHourOfDaySymbolLoc_block_invoke((uint64_t)v91);
      v33 = (uint64_t (*)(uint64_t))v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v33)
    {
      -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
      __break(1u);
    }
    objc_msgSend(v31, "numberWithInteger:", v33(v32));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "itemWithType:numberValue:", v30, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v35);
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v77, "startDate");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "numberWithBool:", objc_msgSend(v26, "isDateInWeekend:", v37));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = getBMItemClass();
    objc_msgSend(getBMItemTypeClass_0(), "isWeekend");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "itemWithType:numberValue:", v40, v38);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "addObject:", v41);

    }
  }
  objc_msgSend(MEMORY[0x1E0D15AE0], "attachments");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKeyedSubscript:", v42);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v73, v74, &v86);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v86;
    if (v45)
    {
      if (!objc_msgSend(v45, "count"))
      {
LABEL_46:

        goto LABEL_47;
      }
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v46 = v45;
      v47 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v83;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v83 != v48)
              objc_enumerationMutation(v46);
            v50 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
            objc_msgSend(v50, "contentURL");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "host");
            v52 = (void *)objc_claimAutoreleasedReturnValue();

            if (v52 && objc_msgSend(v52, "length"))
            {
              v53 = getBMItemClass();
              objc_msgSend(getBMItemTypeClass_0(), "interactionContentURL");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "itemWithType:stringValue:", v54, v52);
              v55 = (void *)objc_claimAutoreleasedReturnValue();

              if (v55)
                objc_msgSend(v4, "addObject:", v55);

            }
            objc_msgSend(v50, "UTI");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = v56;
            if (v56 && objc_msgSend(v56, "length"))
            {
              v58 = getBMItemClass();
              objc_msgSend(getBMItemTypeClass_0(), "interactionUTIType");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v58, "itemWithType:stringValue:", v59, v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();

              if (v60)
                objc_msgSend(v4, "addObject:", v60);

            }
          }
          v47 = -[NSObject countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
        }
        while (v47);
      }
    }
    else
    {
      +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[_PSRuleOverlapFeedback contextItemsFromEvent:].cold.1();
    }

    goto LABEL_46;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0D15AE0], "photoSuggestedContacts");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKeyedSubscript:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  if (v62)
  {
    +[_PSPhotoUtils candidateLocalIdentifiersFromPhotoSuggestedPeople:](_PSPhotoUtils, "candidateLocalIdentifiersFromPhotoSuggestedPeople:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
    if (v64)
    {
      v65 = *(_QWORD *)v79;
      do
      {
        for (k = 0; k != v64; ++k)
        {
          if (*(_QWORD *)v79 != v65)
            objc_enumerationMutation(v63);
          v67 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * k);
          v68 = getBMItemClass();
          objc_msgSend(getBMItemTypeClass_0(), "interactionPhotoContact");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "itemWithType:stringValue:", v69, v67);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
            objc_msgSend(v4, "addObject:", v70);

        }
        v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v96, 16);
      }
      while (v64);
    }

  }
  return v4;
}

- (int)bucketedValue:(int)a3
{
  int result;

  result = a3;
  if (a3 >= 11)
  {
    if (a3 > 0x64)
    {
      if (a3 > 0x3E7)
        return 1000;
      else
        return a3 - (unsigned __int16)a3 % 0x64u;
    }
    else
    {
      return a3 - a3 % 0xAu;
    }
  }
  return result;
}

- (id)sharesheetFeedbackEventsSinceDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ShareSheet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Feedback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "publisherWithUseCase:", CFSTR("ShareSheetFeedback"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __60___PSRuleOverlapFeedback_sharesheetFeedbackEventsSinceDate___block_invoke_387;
  v17 = &unk_1E44015E8;
  v18 = v3;
  v19 = v4;
  v9 = v4;
  v10 = v3;
  v11 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", &__block_literal_global_386, &v14);
  objc_msgSend(v9, "allObjects", v14, v15, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)interactionStoreEventsSinceDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _CDInteractionStore *interactionStore;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(startDate > %@)"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(direction IN %@)"), &unk_1E442CD48);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(mechanism == %@)"), &unk_1E442B420);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  interactionStore = self->_interactionStore;
  objc_msgSend(MEMORY[0x1E0D15AD0], "startDateSortDescriptorAscending:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[_CDInteractionStore queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:](interactionStore, "queryInteractionsUsingPredicate:sortDescriptors:limit:offset:error:", v10, v13, 100, 0, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v18;

  if (v15)
  {
    +[_PSLogging feedbackChannel](_PSLogging, "feedbackChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[_PSRuleOverlapFeedback interactionStoreEventsSinceDate:].cold.1();

  }
  return v14;
}

- (BMBehaviorRetriever)behaviorRetriever
{
  return self->_behaviorRetriever;
}

- (_PSConfidenceModelForSharing)confidenceModelForSharing
{
  return self->_confidenceModelForSharing;
}

- (void)setConfidenceModelForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_confidenceModelForSharing, a3);
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (NSUserDefaults)ruleOverlapFeedbackDefaults
{
  return self->_ruleOverlapFeedbackDefaults;
}

- (void)setRuleOverlapFeedbackDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_ruleOverlapFeedbackDefaults, a3);
}

- (_PSRuleRankingMLModel)ruleRankingModel
{
  return (_PSRuleRankingMLModel *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRuleRankingModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleRankingModel, 0);
  objc_storeStrong((id *)&self->_ruleOverlapFeedbackDefaults, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_confidenceModelForSharing, 0);
  objc_storeStrong((id *)&self->_behaviorRetriever, 0);
}

- (void)loggingTrainDataForContactFillerModel:(void *)a1 withMatchingInteraction:(NSObject *)a2 interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Number of recipients considering: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)loggingTrainDataForContactFillerModel:(void *)a1 withMatchingInteraction:(NSObject *)a2 interactionRecipients:ruleRankingModel:contactPropertyCache:interactionCache:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, a2, v4, "Number of behavior rules to consider for this share event: %@", v5);

  OUTLINED_FUNCTION_9_0();
}

- (void)modelAccuracyLogging:WithMatchingInteraction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_1A07F4000, v0, v1, "About to log accuracy CA feedback dictionary: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)loggingForKnowledgeStoreEvent:WithMatchingInteraction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "Knowledge event creation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)contextItemsFromEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0_0(&dword_1A07F4000, v0, v1, "No attachments for event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)interactionStoreEventsSinceDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, v0, v1, "Unable to query interaction store: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
