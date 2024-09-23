@implementation PPLocalEventStore

- (PPLocalEventStore)initWithTrialWrapper:(id)a3 eventStorage:(id)a4
{
  id v8;
  id v9;
  PPLocalEventStore *v10;
  PPLocalEventStore *v11;
  PPEventCache *v12;
  PPEventCache *eventCache;
  id v14;
  void *v15;
  uint64_t v16;
  _PASLock *lock;
  void *v18;
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  _PASLock *v27;
  void *v28;
  id v29;
  _PASLock *v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id *v37;
  SEL v38;
  id location;
  objc_super v40;
  id from;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  _PASLock *v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v40.receiver = self;
  v40.super_class = (Class)PPLocalEventStore;
  v10 = -[PPLocalEventStore init](&v40, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_storage, a4);
    v12 = -[PPEventCache initWithEventStorage:]([PPEventCache alloc], "initWithEventStorage:", v11->_storage);
    eventCache = v11->_eventCache;
    v11->_eventCache = v12;

    objc_storeStrong((id *)&v11->_trialWrapper, a3);
    v14 = objc_alloc(MEMORY[0x1E0D815F0]);
    v15 = (void *)objc_opt_new();
    v16 = objc_msgSend(v14, "initWithGuardedData:", v15);
    lock = v11->_lock;
    v11->_lock = (_PASLock *)v16;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "PPLocalEventStore-bufferedChanges", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, v11);
    v19 = objc_alloc(MEMORY[0x1E0D81558]);
    v20 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke;
    v36[3] = &unk_1E7E1ABA8;
    v38 = a2;
    v21 = v11;
    v37 = v21;
    v34[0] = v20;
    v34[1] = 3221225472;
    v34[2] = __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_2;
    v34[3] = &unk_1E7E1AC10;
    objc_copyWeak(&v35, &location);
    v22 = objc_msgSend(v19, "initWithQueue:leewaySeconds:coalesceData:operation:", v18, v36, v34, 10.0);
    v23 = v21[6];
    v21[6] = (id)v22;

    from = 0;
    objc_initWeak(&from, v21);
    v24 = (void *)MEMORY[0x1E0D70BF0];
    v42 = v20;
    v43 = 3221225472;
    v44 = __52__PPLocalEventStore__setupCalendarVisibilityManager__block_invoke;
    v45 = &unk_1E7E1ACF0;
    objc_copyWeak((id *)&v46, &from);
    objc_msgSend(v24, "addCalendarVisibilityObserverForLifetimeOfObject:block:", v21, &v42);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPEventStorage setInvisibleCalendarIdentifiers:](v11->_storage, "setInvisibleCalendarIdentifiers:", v25);
    objc_destroyWeak((id *)&v46);

    objc_destroyWeak(&from);
    v26 = v21[6];
    v27 = v11->_lock;
    v28 = (void *)MEMORY[0x1E0D70BF0];
    v42 = v20;
    v43 = 3221225472;
    v44 = __46__PPLocalEventStore__registerForNotifications__block_invoke;
    v45 = &unk_1E7E1ACA8;
    v46 = v27;
    v47 = v26;
    v29 = v26;
    v30 = v27;
    objc_msgSend(v28, "addEventKitObserverForLifetimeOfObject:block:", v21, &v42);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (id)objc_msgSend(v31, "addUpdateHandlerForNamespaceName:block:", CFSTR("PERSONALIZATION_PORTRAIT_EVENTS"), &__block_literal_global_104);

    -[PPLocalEventStore _preloadEvents](v21);
    objc_destroyWeak(&v35);

    objc_destroyWeak(&location);
  }

  return v11;
}

- (PPLocalEventStore)init
{
  void *v3;
  void *v4;
  PPLocalEventStore *v5;

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPEventStorage defaultStorage](PPEventStorage, "defaultStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PPLocalEventStore initWithTrialWrapper:eventStorage:](self, "initWithTrialWrapper:eventStorage:", v3, v4);

  return v5;
}

- (void)runBlockWithPurgerDisabled:(id)a3
{
  -[PPEventStorage runBlockWithPurgerDisabled:](self->_storage, "runBlockWithPurgerDisabled:", a3);
}

- (BOOL)iterEventNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  void (**v8)(id, uint64_t, char *);
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, uint64_t, char *))a5;
  -[PPLocalEventStore eventNameRecordsForClient:error:](self, "eventNameRecordsForClient:error:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        v18 = 0;
        v8[2](v8, v16, &v18);
        if (v18)
          break;
        if (v13 == ++v15)
        {
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v13)
            goto LABEL_4;
          break;
        }
      }
    }

  }
  return v10 != 0;
}

- (id)eventNameRecordsForClient:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  id v40;
  id obj;
  uint64_t v42;
  PPLocalEventStore *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -7200.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  objc_msgSend(v5, "dateByAddingTimeInterval:", 43200.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = self;
  -[PPLocalEventStore eventsFromDate:toDate:](self, "eventsFromDate:toDate:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v45)
  {
    v42 = *(_QWORD *)v51;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v51 != v42)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD6630]();
        v12 = v10;
        if (v43)
        {
          v48 = v11;
          v49 = v9;
          v13 = objc_opt_new();
          objc_msgSend(v12, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)v13;
          objc_msgSend(v14, "timeIntervalSinceDate:", v13);
          v16 = -[PPLocalEventStore _scoreForSecondsRelativeToNow:](v15);

          v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v12, "attendees");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));

          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v47 = v12;
          objc_msgSend(v12, "attendees");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v55;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v55 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                v26 = (void *)MEMORY[0x1C3BD6630]();
                objc_msgSend(v25, "name");
                v27 = objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  v28 = (void *)v27;
                  objc_msgSend(v25, "name");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v29, "length");

                  if (v30)
                  {
                    objc_msgSend(v25, "name");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "addObject:", v31);

                  }
                }
                objc_autoreleasePoolPop(v26);
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
            }
            while (v22);
          }

          v32 = (void *)MEMORY[0x1E0D70B40];
          v12 = v47;
          objc_msgSend(v47, "eventIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "title");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "location");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "eventNameRecordWithScore:eventIdentifier:changeType:title:location:participantNames:", v33, 0, v34, v35, v19, v16);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = v48;
          v9 = v49;
        }
        else
        {
          v36 = 0;
        }

        objc_msgSend(v44, "addObject:", v36);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v9 != v45);
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      v45 = v37;
    }
    while (v37);
  }

  return v44;
}

- (id)resolveEventNameRecordChanges:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  PPEventStorage *storage;
  NSObject *v17;
  id v19;
  _QWORD v20[6];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v19 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1C3BD6630]();
        if (-[PPEventStorage eventKitChangeIsEvent:](self->_storage, "eventKitChangeIsEvent:", v14))
        {
          storage = self->_storage;
          v20[0] = MEMORY[0x1E0C809B0];
          v20[1] = 3221225472;
          v20[2] = __64__PPLocalEventStore_resolveEventNameRecordChanges_client_error___block_invoke;
          v20[3] = &unk_1E7E1AC58;
          v20[4] = self;
          v20[5] = v14;
          v21 = v8;
          -[PPEventStorage runBlockWithPurgerDisabled:](storage, "runBlockWithPurgerDisabled:", v20);

        }
        else
        {
          pp_events_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_debug_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEBUG, "skipping non-event change: %@", buf, 0xCu);
          }

        }
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

  return v8;
}

- (id)eventWithExternalID:(id)a3
{
  return -[PPEventStorage eventWithExternalID:](self->_storage, "eventWithExternalID:", a3);
}

- (id)eventWithIdentifier:(id)a3
{
  return -[PPEventStorage eventWithIdentifier:](self->_storage, "eventWithIdentifier:", a3);
}

- (id)customObjectForKey:(id)a3 eventIdentifier:(id)a4
{
  id v6;
  id v7;
  PPEventStorage *storage;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14454;
  v21 = __Block_byref_object_dispose__14455;
  v22 = 0;
  storage = self->_storage;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__PPLocalEventStore_customObjectForKey_eventIdentifier___block_invoke;
  v13[3] = &unk_1E7E1BAE0;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  v16 = &v17;
  v10 = v6;
  v15 = v10;
  -[PPEventStorage runBlockWithPurgerDisabled:](storage, "runBlockWithPurgerDisabled:", v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (BOOL)attemptToPurgeImmediately
{
  return -[PPEventStorage attemptToPurgeImmediately](self->_storage, "attemptToPurgeImmediately");
}

- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PPEventStorage *storage;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  storage = self->_storage;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __91__PPLocalEventStore_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_usingBlock___block_invoke;
  v15[3] = &unk_1E7E1D000;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  -[PPEventStorage runBlockWithPurgerDisabled:](storage, "runBlockWithPurgerDisabled:", v15);

}

- (id)eventHighlightsFrom:(id)a3 to:(id)a4 options:(int)a5
{
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  PPEventScorer *v16;
  _BYTE *v17;
  _QWORD *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  _BYTE *v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  PPEventScorer *v39;
  void *v40;
  double v41;
  double v42;
  unint64_t v43;
  _BOOL8 v44;
  NSObject *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  PPEventScorer *v54;
  id v55;
  void *v56;
  void *v57;
  PPEventStorage *storage;
  id v59;
  id v60;
  uint64_t v61;
  PPLocalEventStore *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  id obj;
  NSObject *obja;
  id v74;
  PPEventScorer *v75;
  id v76;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[8];
  uint64_t v84;
  void *v85;
  void *v86;
  PPLocalEventStore *v87;
  id v88;
  PPEventScorer *v89;
  PPLocalEventStore *v90;
  _BYTE *v91;
  uint64_t *v92;
  id v93;
  id v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  _QWORD aBlock[4];
  id v113;
  uint8_t v114[128];
  _BYTE buf[24];
  uint64_t (*v116)(uint64_t, uint64_t);
  _BYTE v117[20];
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  uint64_t v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v70 = a3;
  v69 = a4;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70DC0]);

  if ((v7 & 1) != 0)
  {
    -[PPLocalEventStore eventsFromDate:toDate:](self, "eventsFromDate:toDate:", v70, v69);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = (void *)objc_opt_new();
    +[PPEventRankerDateUtils dateTwoWeeksPriorToDate:](PPEventRankerDateUtils, "dateTwoWeeksPriorToDate:", v70);
    v68 = (id)objc_claimAutoreleasedReturnValue();
    v76 = v70;
    if (self)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", 1800.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      objc_msgSend(v10, "setFormatOptions:", 275);
      v11 = (void *)objc_opt_new();
      if (eventMetaDataFromDate_toDate__onceToken != -1)
        dispatch_once(&eventMetaDataFromDate_toDate__onceToken, &__block_literal_global_114);
      objc_msgSend((id)eventMetaDataFromDate_toDate__invalidationTimer, "runAfterDelaySeconds:coalescingBehavior:", 1, 1800.0);
      +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", MEMORY[0x1E0C9AA70], 0, 0, -1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_4;
      aBlock[3] = &unk_1E7E1AE00;
      v13 = v12;
      v113 = v13;
      v14 = _Block_copy(aBlock);
      v106 = 0;
      v107 = &v106;
      v108 = 0x3032000000;
      v109 = __Block_byref_object_copy__14454;
      v110 = __Block_byref_object_dispose__14455;
      v66 = v13;
      v111 = v66;
      v102 = 0;
      v103 = &v102;
      v104 = 0x2020000000;
      v105 = 0;
      v98 = 0;
      v99 = &v98;
      v100 = 0x2020000000;
      v101 = 0;
      v15 = (void *)eventMetaDataFromDate_toDate__cacheLock;
      *(_QWORD *)v83 = MEMORY[0x1E0C809B0];
      v84 = 3221225472;
      v85 = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_5;
      v86 = &unk_1E7E1AEB8;
      v63 = v8;
      v87 = v63;
      v74 = v68;
      v88 = v74;
      v16 = (PPEventScorer *)v76;
      v95 = &v102;
      v96 = &v98;
      v89 = v16;
      v90 = self;
      obj = v14;
      v94 = obj;
      v17 = v9;
      v91 = v17;
      v18 = v11;
      v92 = v18;
      v64 = v10;
      v93 = v64;
      v97 = &v106;
      objc_msgSend(v15, "runWithLockAcquired:", v83);
      objc_msgSend((id)v107[5], "earliestStartTime");
      if (v19 != -1.0)
      {
        v20 = objc_alloc(MEMORY[0x1E0C99D48]);
        v21 = (void *)objc_msgSend(v20, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8], v63);
        objc_msgSend(v21, "components:fromDate:toDate:options:", 16, v74, v16, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "day");
        if ((unint64_t)objc_msgSend(v18, "count") < 2
          || v23 < 9
          || (double)(unint64_t)objc_msgSend(v18, "count") / (double)(v23 + 1) < 0.55)
        {
          objc_msgSend((id)v107[5], "titlesAndParticipants");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend((id)v107[5], "eventCount");
          +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v24, v25, objc_msgSend((id)v107[5], "eventHasAlarmCount"), -1.0);
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = (void *)v107[5];
          v107[5] = v26;

        }
      }
      pp_events_log_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v17;
        v30 = (uint64_t (*)(uint64_t, uint64_t))v103[3];
        v31 = v99[3];
        objc_msgSend((id)v107[5], "earliestStartTime");
        v33 = v32;
        v34 = objc_msgSend((id)v107[5], "eventCount");
        v35 = objc_msgSend((id)v107[5], "eventHasAlarmCount");
        objc_msgSend((id)v107[5], "titlesAndParticipants");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v36, "count");
        v38 = v107[5];
        *(_DWORD *)buf = 138545411;
        *(_QWORD *)&buf[4] = v74;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v16;
        *(_WORD *)&buf[22] = 2048;
        v116 = v30;
        *(_WORD *)v117 = 2048;
        *(_QWORD *)&v117[2] = v31;
        *(_WORD *)&v117[10] = 2048;
        *(_QWORD *)&v117[12] = v33;
        v118 = 2048;
        v119 = v34;
        v120 = 2048;
        v121 = v35;
        v122 = 2048;
        v123 = v37;
        v124 = 2117;
        v125 = v38;
        _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "eventMetaDataFromDate:%{public}@ toDate:%{public}@ (cached chunks %tu, misses %tu) = earliestStartTime:%f, eventCount:%tu, eventHasAlarmCount:%tu, titlesAndParticipants.count:%tu, %{sensitive}@", buf, 0x5Cu);

        v17 = v29;
      }

      v67 = (id)v107[5];
      _Block_object_dispose(&v98, 8);
      _Block_object_dispose(&v102, 8);
      _Block_object_dispose(&v106, 8);

    }
    else
    {
      v67 = 0;
    }

    v39 = [PPEventScorer alloc];
    objc_msgSend(v67, "titlesAndParticipants");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "earliestStartTime");
    v42 = v41;
    if (v67)
    {
      if (objc_msgSend(v67, "eventHasAlarmCount") && objc_msgSend(v67, "eventCount"))
      {
        v43 = objc_msgSend(v67, "eventHasAlarmCount");
        v44 = objc_msgSend(v67, "eventCount") > v43;
      }
      else
      {
        v44 = 1;
      }
    }
    else
    {
      v44 = 0;
    }
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance", v63);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = -[PPEventScorer initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:](v39, "initWithPastEventTitlesAndParticipants:andEarliestStartTime:shouldConsiderAlarms:withOptions:trialWrapper:", v40, v44, a5, v47, v42);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obja = v65;
    v48 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v114, 16);
    if (v48)
    {
      v49 = *(_QWORD *)v80;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v80 != v49)
            objc_enumerationMutation(obja);
          v51 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v50);
          v52 = (void *)MEMORY[0x1C3BD6630]();
          LOBYTE(v106) = 0;
          v53 = v51;
          v54 = v75;
          v55 = v76;
          if (self)
          {
            LOBYTE(v106) = 0;
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x3032000000;
            v116 = __Block_byref_object_copy__14454;
            *(_QWORD *)v117 = __Block_byref_object_dispose__14455;
            *(_QWORD *)&v117[8] = 0;
            -[PPEventCache cachedEventHighlightForEvent:rankingOptions:trialWrapper:](self->_eventCache, "cachedEventHighlightForEvent:rankingOptions:trialWrapper:", v53, a5, self->_trialWrapper);
            *(_QWORD *)&v117[8] = objc_claimAutoreleasedReturnValue();
            v56 = *(void **)(*(_QWORD *)&buf[8] + 40);
            if (!v56)
            {
              v57 = (void *)MEMORY[0x1C3BD6630]();
              storage = self->_storage;
              *(_QWORD *)v83 = MEMORY[0x1E0C809B0];
              v84 = 3221225472;
              v85 = __95__PPLocalEventStore_eventHighlightForEvent_usingScorer_date_rankingOptions_loadedFromEventKit___block_invoke;
              v86 = &unk_1E7E1AD58;
              v87 = self;
              v59 = v53;
              v91 = buf;
              v92 = &v106;
              v88 = v59;
              v89 = v54;
              v90 = (PPLocalEventStore *)v55;
              -[PPEventStorage runBlockWithPurgerDisabled:](storage, "runBlockWithPurgerDisabled:", v83);

              objc_autoreleasePoolPop(v57);
              v56 = *(void **)(*(_QWORD *)&buf[8] + 40);
            }
            v60 = v56;
            _Block_object_dispose(buf, 8);

          }
          else
          {
            v60 = 0;
          }

          if (v60 && ((a5 & 1) != 0 || objc_msgSend(v60, "isExtraordinary")))
            objc_msgSend(v71, "addObject:", v60);

          objc_autoreleasePoolPop(v52);
          ++v50;
        }
        while (v48 != v50);
        v61 = -[NSObject countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v79, v114, 16);
        v48 = v61;
      }
      while (v61);
    }

    objc_msgSend(v71, "sortedArrayUsingComparator:", &__block_literal_global_109);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = obja;
  }
  else
  {
    pp_events_log_handle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v83 = 0;
      _os_log_impl(&dword_1C392E000, v45, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: EventHighlights disabled due to settings", v83, 2u);
    }
    v46 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v46;
}

- (id)eventsFromDate:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  int v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v11 = v10;

  if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v9, v11))
  {
    if (self)
    {
      pp_events_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 134218240;
        v21 = (unint64_t)v9;
        v22 = 2048;
        v23 = (unint64_t)v11;
        _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore queried for range: %tu - %tu", (uint8_t *)&v20, 0x16u);
      }

      pp_events_signpost_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_signpost_id_generate(v13);

      pp_events_signpost_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C392E000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PPLocalEventStore.eventsInRange", ", (uint8_t *)&v20, 2u);
      }

      -[PPEventCache objectForRange:](self->_eventCache, "objectForRange:", (unint64_t)v9, (unint64_t)v11);
      self = (PPLocalEventStore *)objc_claimAutoreleasedReturnValue();
      pp_events_signpost_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        LOWORD(v20) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C392E000, v18, OS_SIGNPOST_INTERVAL_END, v14, "PPLocalEventStore.eventsInRange", ", (uint8_t *)&v20, 2u);
      }

    }
  }
  else
  {
    self = (PPLocalEventStore *)MEMORY[0x1E0C9AA60];
  }
  return self;
}

- (id)nlEventsFromDate:(id)a3 toDate:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PPEventStorage *storage;
  id v13;
  _QWORD v15[8];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  v11 = v10;
  if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v9, v10))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__14454;
    v20 = __Block_byref_object_dispose__14455;
    v21 = 0;
    storage = self->_storage;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__PPLocalEventStore_nlEventsFromDate_toDate___block_invoke;
    v15[3] = &unk_1E7E1BE70;
    v15[6] = (unint64_t)v9;
    v15[7] = (unint64_t)v11;
    v15[4] = self;
    v15[5] = &v16;
    -[PPEventStorage runBlockWithPurgerDisabled:](storage, "runBlockWithPurgerDisabled:", v15);
    v13 = (id)v17[5];
    _Block_object_dispose(&v16, 8);

  }
  else
  {
    v13 = (id)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (id)scoredEventsWithQuery:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  uint8_t buf[4];
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  pp_events_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v72 = (uint64_t)v4;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: scoredEventsWithQuery: %@", buf, 0xCu);
  }

  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70DC0]);

  if ((v7 & 1) == 0)
  {
    pp_events_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: ScoredEvents disabled due to settings", buf, 2u);
    }
LABEL_10:

    v65 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_49;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v4;
    v64 = v4;
    if (self)
    {
      v65 = (id)objc_opt_new();
      objc_msgSend(v8, "fromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "toDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v9;
      v12 = v10;
      objc_msgSend(v11, "timeIntervalSinceReferenceDate");
      v14 = v13;
      objc_msgSend(v12, "timeIntervalSinceDate:", v11);
      v16 = v15;
      if (-[PPLocalEventStore _isEventQueryRangeValidWithInterval:andDuration:]((uint64_t)self, v14, v15))
      {
        PPNewEKEventStore();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPEventStorage suggestedEventsInRange:ekStore:](self->_storage, "suggestedEventsInRange:ekStore:", (unint64_t)v14, (unint64_t)v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0D70B30], "convertBatchOfEKEvents:calendarInternPool:", v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = (void *)MEMORY[0x1E0C9AA60];
      }

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v23 = v20;
      v47 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v67;
        do
        {
          for (i = 0; i != v48; ++i)
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v23);
            v51 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
            if (objc_msgSend(v51, "suggestedEventCategory"))
            {
              objc_msgSend(v8, "matchingCategories");
              v52 = objc_claimAutoreleasedReturnValue();
              if (!v52)
                goto LABEL_41;
              v53 = (void *)v52;
              objc_msgSend(v8, "matchingCategories");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v51, "suggestedEventCategory"));
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = objc_msgSend(v54, "containsObject:", v55);

              if (v56)
              {
LABEL_41:
                v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C90]), "initWithPPEvent:", v51);
                if (v57)
                  objc_msgSend(v65, "addObject:", v57);

              }
            }
          }
          v48 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
        }
        while (v48);
      }

LABEL_47:
LABEL_48:

      v4 = v64;
      goto LABEL_49;
    }
    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v4;
      v64 = v4;
      if (self)
      {
        v23 = (id)objc_opt_new();
        objc_msgSend(v8, "fromDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dateByAddingTimeInterval:", -10368000.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = v8;
        objc_msgSend(v8, "toDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dateByAddingTimeInterval:", 10368000.0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v25, "timeIntervalSinceReferenceDate");
        v29 = (unint64_t)v28;
        v62 = v27;
        objc_msgSend(v27, "timeIntervalSinceDate:", v25);
        v31 = (unint64_t)v30;
        PPNewEKEventStore();
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPEventStorage suggestedEventsInRange:ekStore:](self->_storage, "suggestedEventsInRange:ekStore:", v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        pp_events_log_handle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = objc_msgSend(v32, "count");
          *(_DWORD *)buf = 134217984;
          v72 = v34;
          _os_log_impl(&dword_1C392E000, v33, OS_LOG_TYPE_DEFAULT, "[PPLocalEventStore tripEventsWithQuery] Found %lu suggested events in the given range", buf, 0xCu);
        }

        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v35 = v32;
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v67;
          do
          {
            for (j = 0; j != v37; ++j)
            {
              if (*(_QWORD *)v67 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
              +[PPTripAggregator keyForCategory:](PPTripAggregator, "keyForCategory:", objc_msgSend(v40, "pp_suggestedCategory"));
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();

                if (v42)
                {
                  objc_msgSend(v23, "objectForKeyedSubscript:", v41);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "arrayByAddingObject:", v40);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "setObject:forKey:", v44, v41);

                }
                else
                {
                  v70 = v40;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "setObject:forKey:", v43, v41);
                }

              }
            }
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v66, buf, 16);
          }
          while (v37);
        }

        v8 = v63;
        objc_msgSend(v63, "fromDate");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "toDate");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[PPTripAggregator tripEventsWithEvents:from:to:](PPTripAggregator, "tripEventsWithEvents:from:to:", v23, v45, v46);
        v65 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_47;
      }
LABEL_52:
      v65 = 0;
      goto LABEL_48;
    }
    pp_events_log_handle();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v72 = (uint64_t)v60;
      _os_log_impl(&dword_1C392E000, v21, OS_LOG_TYPE_DEFAULT, "Unsupport event query object of class: %@", buf, 0xCu);

    }
    goto LABEL_10;
  }
  v22 = (void *)MEMORY[0x1E0C9AA60];
  if (!self)
    v22 = 0;
  v65 = v22;
LABEL_49:

  return v65;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "Event feedback received: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v5, "feedbackItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v5, 3, 2, 0);
  if (v6)
    v6[2](v6, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferedChanges, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_trialWrapper, 0);
  objc_storeStrong((id *)&self->_assetUpdateNotificationToken, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_eventCache, 0);
}

- (uint64_t)_isEventQueryRangeValidWithInterval:(double)a3 andDuration:
{
  NSObject *v4;
  const char *v5;
  int v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (a2 < 0.0)
    {
      pp_events_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = a2;
        v5 = "PPLocalEventStore: from date appears to be before the reference date(interval = %f) which is unsupported.";
LABEL_11:
        _os_log_error_impl(&dword_1C392E000, v4, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v7, 0xCu);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    if (a3 < 0.0)
    {
      pp_events_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v7 = 134217984;
        v8 = a3;
        v5 = "PPLocalEventStore: to date appears to be before from date(duration = %f) which is unsupported.";
        goto LABEL_11;
      }
LABEL_7:

      return 0;
    }
    return 1;
  }
  return result;
}

void __45__PPLocalEventStore_nlEventsFromDate_toDate___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 16), "nlEventsInRange:", a1[6], a1[7]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D70B30], "convertBatchOfEKEvents:calendarInternPool:", v6, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __52__PPLocalEventStore_eventHighlightsFrom_to_options___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  v9 = v8;

  return objc_msgSend(v4, "reverseCompareDouble:withDouble:", v7, v9);
}

void __95__PPLocalEventStore_eventHighlightForEvent_usingScorer_date_rankingOptions_loadedFromEventKit___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "eventIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(_BYTE **)(a1 + 72);
    if (v5)
      *v5 = 1;
    objc_msgSend(*(id *)(a1 + 48), "scoreEvent:usingDate:", v4, *(_QWORD *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setEventHighlight:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isExtraordinary"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "timeIntervalSinceNow");
      v11 = v10;

      if (v11 <= 0.0)
      {
        pp_events_log_handle();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v14 = 0;
          _os_log_debug_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEBUG, "Suppressing metrics logging of past event", v14, 2u);
        }

      }
      else
      {
        +[PPEventMetricsLogger defaultLogger](PPEventMetricsLogger, "defaultLogger");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logEventInteractionForEventHighlight:interface:actionType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0, 0);

      }
    }
  }

}

id __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", v3);
  v5 = v3;
  if (v4)
    v5 = *(void **)(a1 + 32);
  v6 = v5;

  return v6;
}

void __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  int v45;
  double v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  unint64_t v58;
  void *v59;
  unint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  __int128 *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  double *v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_6;
  v76[3] = &unk_1E7E1AE28;
  v61 = a1;
  v77 = *(id *)(a1 + 32);
  v59 = v3;
  objc_msgSend(v3, "indexesOfObjectsPassingTest:", v76);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsAtIndexes:", v56);
  v57 = (void *)objc_opt_new();
  v4 = a1;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v6 = vcvtmd_u64_f64(v5 / 14400.0);
  objc_msgSend(*(id *)(v4 + 48), "timeIntervalSinceReferenceDate");
  v60 = v6;
  v58 = vcvtpd_u64_f64(v7 / 14400.0);
  if (v6 <= v58)
  {
    do
    {
      v62 = (void *)objc_opt_new();
      objc_msgSend(v62, "setChunkIndex:", v60);
      v8 = objc_msgSend(v59, "indexOfObject:inSortedRange:options:usingComparator:", v62, 0, objc_msgSend(v59, "count"), 1024, &__block_literal_global_124);
      if (v8 < objc_msgSend(v59, "count")
        && (objc_msgSend(v59, "objectAtIndexedSubscript:", v8),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10 = objc_msgSend(v9, "chunkIndex") == v60,
            v9,
            v10))
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 96) + 8) + 24);
        objc_msgSend(v59, "objectAtIndexedSubscript:", v8);
        v11 = v62;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v61 + 104) + 8) + 24);
        v12 = (void *)objc_opt_new();
        v82 = 0;
        v83 = (double *)&v82;
        v84 = 0x2020000000;
        v85 = 0xBFF0000000000000;
        *(_QWORD *)&v78 = 0;
        *((_QWORD *)&v78 + 1) = &v78;
        v79 = 0x2020000000uLL;
        v72 = 0;
        v73 = &v72;
        v74 = 0x2020000000;
        v75 = 0;
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v60 * 14400.0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", 14400.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(*(_QWORD *)(v61 + 56) + 16);
        v65[0] = MEMORY[0x1E0C809B0];
        v65[1] = 3221225472;
        v65[2] = __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_8;
        v65[3] = &unk_1E7E1AE90;
        v16 = v13;
        v66 = v16;
        v11 = v12;
        v67 = v11;
        v68 = v57;
        v69 = &v82;
        v70 = &v78;
        v71 = &v72;
        objc_msgSend(v15, "iterateEventsFrom:to:inChunks:withBlock:", v16, v14, 1, v65);
        if (v73[3])
          objc_msgSend(*(id *)(*(_QWORD *)(v61 + 56) + 16), "attemptToPurgeImmediately");
        v17 = *(_QWORD *)(v61 + 88);
        v18 = (void *)objc_msgSend(v11, "copy");
        +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v18, v73[3], *(_QWORD *)(*((_QWORD *)&v78 + 1) + 24), v83[3]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setMetadata:", v20);

        objc_msgSend(v62, "setExpiration:", *(_QWORD *)(v61 + 64));
        objc_msgSend(v59, "insertObject:atIndex:", v62, v8);

        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(&v78, 8);
        _Block_object_dispose(&v82, 8);
      }

      objc_msgSend(v62, "metadata");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "eventCount") == 0;

      if (!v22)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v60 * 14400.0 + 7200.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(v61 + 72);
        objc_msgSend(*(id *)(v61 + 80), "stringFromDate:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v25);

      }
      v63 = *(void **)(*(_QWORD *)(*(_QWORD *)(v61 + 112) + 8) + 40);
      objc_msgSend(v62, "metadata");
      v26 = (id)objc_claimAutoreleasedReturnValue();
      v64 = v26;
      if (v63)
      {
        objc_msgSend(v26, "titlesAndParticipants");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count") == 0;

        objc_msgSend(v63, "titlesAndParticipants");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (!v28)
        {
          v31 = objc_msgSend(v29, "count") == 0;

          if (v31)
          {
            objc_msgSend(v64, "titlesAndParticipants");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v63, "titlesAndParticipants");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = (void *)objc_msgSend(v32, "mutableCopy");

            v80 = 0u;
            v81 = 0u;
            v78 = 0u;
            v79 = 0u;
            objc_msgSend(v64, "titlesAndParticipants");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, &v82, 16);
            if (v35)
            {
              v36 = *(_QWORD *)v79;
              do
              {
                for (i = 0; i != v35; ++i)
                {
                  if (*(_QWORD *)v79 != v36)
                    objc_enumerationMutation(v34);
                  v38 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * i);
                  objc_msgSend(v63, "titlesAndParticipants");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "objectForKeyedSubscript:", v38);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v64, "titlesAndParticipants");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "objectForKeyedSubscript:", v38);
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v40)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v42, "unsignedIntegerValue") + objc_msgSend(v40, "unsignedIntegerValue"));
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v33, "setObject:forKeyedSubscript:", v43, v38);

                  }
                  else
                  {
                    objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, v38);
                  }

                }
                v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v78, &v82, 16);
              }
              while (v35);
            }

            v30 = (void *)objc_msgSend(v33, "copy");
          }
        }
        objc_msgSend(v63, "earliestStartTime");
        v45 = v44 != -1.0;
        objc_msgSend(v64, "earliestStartTime");
        v47 = v46 == -1.0;
        objc_msgSend(v63, "earliestStartTime");
        v49 = v48;
        objc_msgSend(v64, "earliestStartTime");
        if (v49 >= v50)
          v51 = v49;
        else
          v51 = v50;
        if (v49 < v50)
          v50 = v49;
        if (v45 != v47)
          v52 = v50;
        else
          v52 = v51;
        +[PPEventMetadata eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:](PPEventMetadata, "eventMetadataWithTitlesAndParticipants:earliestStartTime:eventCount:eventHasAlarmCount:", v30, objc_msgSend(v64, "eventCount") + objc_msgSend(v63, "eventCount"), objc_msgSend(v64, "eventHasAlarmCount") + objc_msgSend(v63, "eventHasAlarmCount"), v52);
        v53 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v53 = 0;
      }

      v54 = *(_QWORD *)(*(_QWORD *)(v61 + 112) + 8);
      v55 = *(void **)(v54 + 40);
      *(_QWORD *)(v54 + 40) = v53;

      ++v60;
    }
    while (v60 <= v58);
  }

}

BOOL __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "expiration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) != -1;

  return v4;
}

void __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_8(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  id v13;

  v13 = a2;
  v3 = (void *)a1[4];
  objc_msgSend(v13, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  v6 = v13;
  if (v5 != 1)
  {
    +[PPEventScorer enrichDictionary:withEvent:interningSet:](PPEventScorer, "enrichDictionary:withEvent:interningSet:", a1[5], v13, a1[6]);
    if ((objc_msgSend(v13, "isAllDay") & 1) == 0)
    {
      objc_msgSend(v13, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPEventRankerDateUtils secondsFromMidnight:](PPEventRankerDateUtils, "secondsFromMidnight:", v7);
      v9 = v8;

      v10 = *(_QWORD *)(a1[7] + 8);
      v11 = *(double *)(v10 + 24);
      if (v9 < v11 || v11 == -1.0)
        *(double *)(v10 + 24) = v9;
    }
    if (objc_msgSend(v13, "hasAlarms"))
      ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    ++*(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24);
    v6 = v13;
  }

}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "chunkIndex");
  if (v6 == objc_msgSend(v5, "chunkIndex"))
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "chunkIndex");
    if (v8 < objc_msgSend(v5, "chunkIndex"))
      v7 = -1;
    else
      v7 = 1;
  }

  return v7;
}

void __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v0 = objc_alloc(MEMORY[0x1E0D815F0]);
  v1 = (void *)objc_opt_new();
  v2 = objc_msgSend(v0, "initWithGuardedData:", v1);
  v3 = (void *)eventMetaDataFromDate_toDate__cacheLock;
  eventMetaDataFromDate_toDate__cacheLock = v2;

  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "eventMetaDataFromDate:toDate: cache clearing queue", 9);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81618]), "initWithQueue:leewaySeconds:operation:", v6, &__block_literal_global_117, 60.0);
  v5 = (void *)eventMetaDataFromDate_toDate__invalidationTimer;
  eventMetaDataFromDate_toDate__invalidationTimer = v4;

}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_2()
{
  return objc_msgSend((id)eventMetaDataFromDate_toDate__cacheLock, "tryWithLockAcquired:", &__block_literal_global_119_14486);
}

uint64_t __50__PPLocalEventStore_eventMetaDataFromDate_toDate___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeAllObjects");
}

uint64_t __91__PPLocalEventStore_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_usingBlock___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:usingBlock:", a1[5], a1[6], a1[7]);
}

void __56__PPLocalEventStore_customObjectForKey_eventIdentifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1[4] + 16), "eventWithIdentifier:", a1[5]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v2 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v6, "customObjectForKey:", a1[6]);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[7] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_autoreleasePoolPop(v2);
  }

}

void __64__PPLocalEventStore_resolveEventNameRecordChanges_client_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v1 = a1;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "resolveEventFromEKChange:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    pp_events_log_handle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v33 = *(void **)(v1 + 40);
      *(_DWORD *)buf = 138412290;
      v44 = v33;
      _os_log_debug_impl(&dword_1C392E000, v30, OS_LOG_TYPE_DEBUG, "deleted event: %@", buf, 0xCu);
    }

    if (*(_QWORD *)(v1 + 32))
    {
      v31 = (void *)MEMORY[0x1E0D70B40];
      objc_msgSend(*(id *)(v1 + 40), "stringRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "eventNameRecordWithScore:eventIdentifier:changeType:title:location:participantNames:", v32, 3, &stru_1E7E221D0, &stru_1E7E221D0, MEMORY[0x1E0C9AA60], 0.0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
    }
    goto LABEL_24;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "shouldIngestEvent:", v2))
  {
    pp_events_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v2, "eventIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v34;
      _os_log_debug_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEBUG, "modified event: %@", buf, 0xCu);

    }
    v37 = v1;
    v38 = v2;
    v4 = *(_QWORD *)(v1 + 32);
    v5 = v2;
    if (v4)
    {
      v6 = objc_opt_new();
      objc_msgSend(v5, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)v6;
      objc_msgSend(v7, "timeIntervalSinceDate:", v6);
      v9 = -[PPLocalEventStore _scoreForSecondsRelativeToNow:](v8);

      v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v5, "attendees");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithCapacity:", objc_msgSend(v11, "count"));

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v36 = v5;
      objc_msgSend(v5, "attendees");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v40 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x1C3BD6630]();
            objc_msgSend(v18, "name");
            v20 = objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              v21 = (void *)v20;
              objc_msgSend(v18, "name");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "length");

              if (v23)
              {
                objc_msgSend(v18, "name");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "addObject:", v24);

              }
            }
            objc_autoreleasePoolPop(v19);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, buf, 16);
        }
        while (v15);
      }

      v5 = v36;
      objc_msgSend(v36, "locationWithoutPrediction");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v25, "length"))
      {

        v25 = 0;
      }
      v1 = v37;
      v2 = v38;
      v26 = (void *)MEMORY[0x1E0D70B40];
      objc_msgSend(v36, "eventIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "title");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "eventNameRecordWithScore:eventIdentifier:changeType:title:location:participantNames:", v27, 0, v28, v25, v12, v9);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v29 = 0;
      v1 = v37;
    }

    objc_msgSend(v29, "setChangeType:", 1);
LABEL_24:
    objc_msgSend(*(id *)(v1 + 48), "addObject:", v29);

  }
}

- (double)_scoreForSecondsRelativeToNow:(double)a1
{
  double v1;
  double result;

  v1 = a1 / 3600.0;
  if (a1 / 3600.0 <= -3.0)
    return 0.3;
  if (v1 <= -2.0)
    return 0.4;
  result = 0.5;
  if (v1 > -1.0)
  {
    result = 0.7;
    if (v1 > 0.0)
    {
      if (v1 <= 1.0)
      {
        return 0.9;
      }
      else if (v1 <= 2.0)
      {
        return 0.85;
      }
      else if (v1 <= 3.0)
      {
        return 0.8;
      }
      else if (v1 > 4.0)
      {
        if (v1 <= 5.0)
        {
          return 0.6;
        }
        else
        {
          result = 0.5;
          if (v1 > 6.0)
          {
            result = 0.4;
            if (v1 > 7.0)
            {
              result = 0.3;
              if (v1 > 8.0)
              {
                if (v1 <= 9.0)
                {
                  return 0.2;
                }
                else if (v1 <= 10.0)
                {
                  return 0.15;
                }
                else if (v1 <= 11.0)
                {
                  return 0.12;
                }
                else
                {
                  return dbl_1C3AE5620[v1 > 12.0];
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

id __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v5, "removeObjectsInArray:", v6);
        objc_msgSend(v5, "addObjectsFromArray:", v6);
      }
      else
      {
        objc_msgSend(v5, "removeAllObjects");
      }
    }
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", v6);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PPLocalEventStore.m"), 179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accumulatedData"));

      v5 = 0;
    }
  }

  return v5;
}

void __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(*((id *)WeakRetained + 5), "runWithLockAcquired:", &__block_literal_global_14513);
      pp_events_log_handle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 134217984;
        v20 = objc_msgSend(v3, "count");
        _os_log_impl(&dword_1C392E000, v6, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: processing %tu EventKit changes", (uint8_t *)&v19, 0xCu);
      }

      v7 = objc_msgSend(v3, "count");
      v8 = (void *)MEMORY[0x1C3BD6630]();
      if (v7)
      {
        v9 = (void *)v5[1];
        objc_msgSend(v3, "array");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "refreshCacheWithChanges:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        pp_events_log_handle();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");
          v19 = 134217984;
          v20 = v14;
          _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: changed event count is %tu", (uint8_t *)&v19, 0xCu);

        }
        +[PPEventKitImporter defaultInstance](PPEventKitImporter, "defaultInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "importChangedEvents:", v11);

      }
      else
      {
        -[PPLocalEventStore _clearAndReloadAllCachesAndData](v5);
      }
      objc_autoreleasePoolPop(v8);
      pp_events_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v3, "count");
        v19 = 134217984;
        v20 = v18;
        _os_log_impl(&dword_1C392E000, v17, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: finished processing %tu EventKit changes", (uint8_t *)&v19, 0xCu);
      }

    }
  }
  else
  {
    pp_events_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v19) = 0;
      _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, "accumulatedData was unexpectedly nil", (uint8_t *)&v19, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria())
      abort();
  }

}

- (void)_preloadEvents
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  pp_events_signpost_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  pp_events_signpost_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PPLocalEventStore.preloadEvents", ", buf, 2u);
  }

  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", 176400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(a1, "eventsFromDate:toDate:", v7, v8);

  pp_events_signpost_handle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C392E000, v11, OS_SIGNPOST_INTERVAL_END, v3, "PPLocalEventStore.preloadEvents", ", v12, 2u);
  }

}

void __46__PPLocalEventStore__registerForNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__14454;
  v16 = __Block_byref_object_dispose__14455;
  v17 = 0;
  v4 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__PPLocalEventStore__registerForNotifications__block_invoke_2;
  v11[3] = &unk_1E7E1AC80;
  v11[4] = &v12;
  objc_msgSend(v4, "runWithLockAcquired:", v11);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v13[5]);
  v7 = v6;

  v8 = objc_msgSend(v3, "count") != 0;
  v9 = v7 <= 300.0;
  v10 = 120.0;
  if (!v8 || !v9)
    v10 = 1.0;
  objc_msgSend(*(id *)(a1 + 40), "processData:afterDelaySeconds:coalescingBehavior:", v3, v8 & v9, v10);
  _Block_object_dispose(&v12, 8);

}

uint64_t __46__PPLocalEventStore__registerForNotifications__block_invoke_3()
{
  return +[PPEventScorer clearAssetCache](PPEventScorer, "clearAssetCache");
}

void __46__PPLocalEventStore__registerForNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD *v5;

  v5 = a2;
  v3 = (void *)v5[1];
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v4);
  if (!v3)

}

void __52__PPLocalEventStore__setupCalendarVisibilityManager__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    pp_events_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPLocalEventStore: reloading events due to EKCalendarVisibilityManager visibilityChanged (%tu invisible calendars)", (uint8_t *)&v6, 0xCu);
    }

    objc_msgSend(WeakRetained[2], "setInvisibleCalendarIdentifiers:", v3);
    -[PPLocalEventStore _clearAndReloadAllCachesAndData](WeakRetained);
  }

}

- (void)_clearAndReloadAllCachesAndData
{
  id v2;

  objc_msgSend(a1, "clearCaches");
  -[PPLocalEventStore _preloadEvents](a1);
  +[PPEventKitImporter defaultInstance](PPEventKitImporter, "defaultInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteAndReimportAllData");

}

void __55__PPLocalEventStore_initWithTrialWrapper_eventStorage___block_invoke_86(uint64_t a1, void *a2)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0C99D68];
  v3 = a2;
  objc_msgSend(v2, "now");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3[1];
  v3[1] = v4;

}

+ (id)defaultStore
{
  if (defaultStore__pasOnceToken10 != -1)
    dispatch_once(&defaultStore__pasOnceToken10, &__block_literal_global_94_14527);
  return (id)defaultStore__pasExprOnceResult_14528;
}

void __33__PPLocalEventStore_defaultStore__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStore__pasExprOnceResult_14528;
  defaultStore__pasExprOnceResult_14528 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)clearCaches
{
  -[PPEventCache removeAllObjects](self->_eventCache, "removeAllObjects");
  -[PPEventStorage clearCaches](self->_storage, "clearCaches");
}

@end
