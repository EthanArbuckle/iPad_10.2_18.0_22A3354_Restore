@implementation _PSSuggestionFromTextPredictor

- (_PSSuggestionFromTextPredictor)initWithEventStore:(id)a3 interactionStore:(id)a4
{
  id v7;
  id v8;
  _PSSuggestionFromTextPredictor *v9;
  _PSSuggestionFromTextPredictor *v10;
  void *v11;
  id v12;
  uint64_t v13;
  CNContactFormatter *contactFormatter;
  void *v15;
  id v16;
  uint64_t v17;
  REMStore *remStore;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  Class (*v23)(uint64_t);
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_PSSuggestionFromTextPredictor;
  v9 = -[_PSSuggestionFromTextPredictor init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_interactionStore, a4);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v11 = (void *)getCNContactFormatterClass_softClass_2;
    v29 = getCNContactFormatterClass_softClass_2;
    if (!getCNContactFormatterClass_softClass_2)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getCNContactFormatterClass_block_invoke_2;
      v24 = &unk_1E43FEA00;
      v25 = &v26;
      __getCNContactFormatterClass_block_invoke_2((uint64_t)&v21);
      v11 = (void *)v27[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v26, 8);
    v13 = objc_opt_new();
    contactFormatter = v10->_contactFormatter;
    v10->_contactFormatter = (CNContactFormatter *)v13;

    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v15 = (void *)getREMStoreClass_softClass;
    v29 = getREMStoreClass_softClass;
    if (!getREMStoreClass_softClass)
    {
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __getREMStoreClass_block_invoke;
      v24 = &unk_1E43FEA00;
      v25 = &v26;
      __getREMStoreClass_block_invoke((uint64_t)&v21);
      v15 = (void *)v27[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v26, 8);
    v17 = objc_opt_new();
    remStore = v10->_remStore;
    v10->_remStore = (REMStore *)v17;

  }
  return v10;
}

- (id)suggestionFromContactPriors:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  _PSSuggestion *v29;
  id v31;
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[4];
  float v38;
  _QWORD v39[9];

  v39[7] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke;
  v37[3] = &__block_descriptor_36_e25_B16__0___PSContactPrior_8l;
  v38 = a4;
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", v37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_PSSuggestionFromTextPredictor suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:].cold.1();

  if (objc_msgSend(v12, "count"))
  {
    v31 = v11;
    v32 = v10;
    +[_PSConstants mobileFacetimeBundleId](_PSConstants, "mobileFacetimeBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v14;
    +[_PSConstants macFacetimeBundleId](_PSConstants, "macFacetimeBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v15;
    +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v16;
    +[_PSConstants macMessagesBundleId](_PSConstants, "macMessagesBundleId");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v17;
    +[_PSConstants mobilePhoneBundleId](_PSConstants, "mobilePhoneBundleId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v39[4] = v18;
    +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v39[5] = v19;
    +[_PSConstants macMailBundleId](_PSConstants, "macMailBundleId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = MEMORY[0x1E0C809B0];
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dateByAddingTimeInterval:", -1209600.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v22;
    v34[1] = 3221225472;
    v34[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_51;
    v34[3] = &unk_1E4400A10;
    v34[4] = self;
    v25 = v21;
    v35 = v25;
    v26 = v24;
    v36 = v26;
    objc_msgSend(v12, "_pas_filteredArrayWithTest:", v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "count"))
    {
      v33[0] = v22;
      v33[1] = 3221225472;
      v33[2] = __98___PSSuggestionFromTextPredictor_suggestionFromContactPriors_priorScoreThreshold_bundleID_reason___block_invoke_53;
      v33[3] = &unk_1E4400A38;
      v33[4] = self;
      objc_msgSend(v27, "_pas_mappedArrayWithTransform:", v33);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v31;
      v10 = v32;
      if (objc_msgSend(v28, "count"))
        v29 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:]([_PSSuggestion alloc], "initWithBundleID:conversationIdentifier:groupName:recipients:reason:reasonType:", v32, 0, 0, v28, v31, 0);
      else
        v29 = 0;

    }
    else
    {
      v29 = 0;
      v11 = v31;
      v10 = v32;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)suggestionFromText:(id)a3 priorScoreThreshold:(float)a4 bundleID:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  double v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    +[_PSContactSuggester contactPriorSuggestionsForText:](_PSContactSuggester, "contactPriorSuggestionsForText:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_DEFAULT, "For text %@ found contacts %@", (uint8_t *)&v18, 0x16u);
    }

    if (objc_msgSend(v13, "count"))
    {
      *(float *)&v15 = a4;
      -[_PSSuggestionFromTextPredictor suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:](self, "suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:", v13, v11, v12, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)isEligibleUnstructuredEvent:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isAllDay"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    else if (objc_msgSend(v4, "status") == 3)
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
    }
    else
    {
      objc_msgSend(v4, "attendees");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (!v21)
      {
        v29 = 1;
        goto LABEL_13;
      }
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        +[_PSSuggestionFromTextPredictor isEligibleUnstructuredEvent:].cold.3(v5, v22, v23, v24, v25, v26, v27, v28);
    }

  }
  v29 = 0;
LABEL_13:

  return v29;
}

- (id)suggestionsFromIncompleteRemindersWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6
{
  id v10;
  id v11;
  id v12;
  REMStore *remStore;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  REMStore *v18;
  void *v19;
  NSObject *v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v24[5];
  id v25;
  float v26;
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  remStore = self->_remStore;
  v28 = 0;
  -[REMStore fetchListsForEventKitBridgingWithError:](remStore, "fetchListsForEventKitBridgingWithError:", &v28);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  if (v15 || !objc_msgSend(v14, "count"))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_PSSuggestionFromTextPredictor suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:].cold.1();
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_23);
    v16 = objc_claimAutoreleasedReturnValue();
    v18 = self->_remStore;
    v27 = 0;
    -[REMStore fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:to:withListIDs:error:](v18, "fetchIncompleteRemindersForEventKitBridgingWithDueDateFrom:to:withListIDs:error:", v11, v12, v16, &v27);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v27;
    if (v15 || !objc_msgSend(v19, "count"))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[_PSSuggestionFromTextPredictor suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:].cold.2();
      v17 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v21 = objc_msgSend(v19, "count");
      if (v21 >= 2)
        v22 = 2;
      else
        v22 = v21;
      objc_msgSend(v19, "subarrayWithRange:", 0, v22);
      v20 = objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __118___PSSuggestionFromTextPredictor_suggestionsFromIncompleteRemindersWithContext_startDate_endDate_priorScoreThreshold___block_invoke_61;
      v24[3] = &unk_1E4400A80;
      v24[4] = self;
      v26 = a6;
      v25 = v10;
      -[NSObject _pas_mappedArrayWithTransform:](v20, "_pas_mappedArrayWithTransform:", v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v17;
}

- (id)suggestionsFromPortraitExtractionsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6 reason:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  float v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  Class (*v39)(uint64_t);
  void *v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];

  v46[2] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v15 = (void *)getPPFuzzyContactQueryClass_softClass;
  v45 = getPPFuzzyContactQueryClass_softClass;
  if (!getPPFuzzyContactQueryClass_softClass)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getPPFuzzyContactQueryClass_block_invoke;
    v40 = &unk_1E43FEA00;
    v41 = &v42;
    __getPPFuzzyContactQueryClass_block_invoke((uint64_t)&v37);
    v15 = (void *)v43[3];
  }
  v16 = objc_retainAutorelease(v15);
  _Block_object_dispose(&v42, 8);
  v17 = (void *)objc_opt_new();
  v18 = (void *)MEMORY[0x1E0C99E60];
  +[_PSConstants mobileCalendarBundleId](_PSConstants, "mobileCalendarBundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v19;
  +[_PSConstants macCalendarBundleId](_PSConstants, "macCalendarBundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSourceBundleIds:", v22);

  objc_msgSend(v17, "setStartDate:", v12);
  objc_msgSend(v17, "setEndDate:", v13);
  objc_msgSend(v17, "setOnlyAddressBook:", 1);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2050000000;
  v23 = (void *)getPPContactStoreClass_softClass_0;
  v45 = getPPContactStoreClass_softClass_0;
  if (!getPPContactStoreClass_softClass_0)
  {
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __getPPContactStoreClass_block_invoke_0;
    v40 = &unk_1E43FEA00;
    v41 = &v42;
    __getPPContactStoreClass_block_invoke_0((uint64_t)&v37);
    v23 = (void *)v43[3];
  }
  v24 = objc_retainAutorelease(v23);
  _Block_object_dispose(&v42, 8);
  v25 = (void *)objc_opt_new();
  v36 = 0;
  objc_msgSend(v25, "upcomingRelevantContactsForQuery:error:", v17, &v36);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v36;
  if (v27 || !objc_msgSend(v26, "count"))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[_PSSuggestionFromTextPredictor suggestionsFromPortraitExtractionsWithContext:startDate:endDate:priorScoreThreshold:reason:].cold.1();
    v29 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v26, "_pas_mappedArrayWithTransform:", &__block_literal_global_67);
    v28 = objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromPortraitExtractionsWithContext_startDate_endDate_priorScoreThreshold_reason___block_invoke_2;
    v32[3] = &unk_1E4400AE8;
    v32[4] = self;
    v35 = a6;
    v33 = v31;
    v34 = v14;
    -[NSObject _pas_mappedArrayWithTransform:](v28, "_pas_mappedArrayWithTransform:", v32);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v29;
}

- (id)suggestionsFromUnstructuredCalendarEventsWithContext:(id)a3 startDate:(id)a4 endDate:(id)a5 priorScoreThreshold:(float)a6
{
  id v10;
  EKEventStore *eventStore;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  EKEventStore *v17;
  uint64_t v18;
  id v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  float v27;
  _QWORD v28[4];
  id v29;

  v10 = a3;
  eventStore = self->_eventStore;
  v12 = a5;
  v13 = a4;
  -[EKEventStore calendarsForEntityType:](eventStore, "calendarsForEntityType:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:](self->_eventStore, "predicateForEventsWithStartDate:endDate:calendars:", v13, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v17 = self->_eventStore;
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke;
  v28[3] = &unk_1E4400B10;
  v19 = v16;
  v29 = v19;
  -[EKEventStore enumerateEventsMatchingPredicate:usingBlock:](v17, "enumerateEventsMatchingPredicate:usingBlock:", v15, v28);
  if (objc_msgSend(v19, "count"))
  {
    v20 = objc_msgSend(v19, "count");
    if (v20 >= 2)
      v21 = 2;
    else
      v21 = v20;
    objc_msgSend(v19, "subarrayWithRange:", 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v18;
    v25[1] = 3221225472;
    v25[2] = __125___PSSuggestionFromTextPredictor_suggestionsFromUnstructuredCalendarEventsWithContext_startDate_endDate_priorScoreThreshold___block_invoke_2;
    v25[3] = &unk_1E4400B38;
    v25[4] = self;
    v27 = a6;
    v26 = v10;
    objc_msgSend(v22, "_pas_mappedArrayWithTransform:", v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remStore, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (void)suggestionFromContactPriors:priorScoreThreshold:bundleID:reason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Filtering over all contact priors %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "All-day event. Skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "Cancelled event. Skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

+ (void)isEligibleUnstructuredEvent:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1A07F4000, a1, a3, "Calendar event has attendees. Skipping", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

- (void)suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Unable to find reminders lists w/ error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)suggestionsFromIncompleteRemindersWithContext:startDate:endDate:priorScoreThreshold:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Unable to find reminders w/ error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)suggestionsFromPortraitExtractionsWithContext:startDate:endDate:priorScoreThreshold:reason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "Unable to find any fuzzy contacts matching with Portrait w/ error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
