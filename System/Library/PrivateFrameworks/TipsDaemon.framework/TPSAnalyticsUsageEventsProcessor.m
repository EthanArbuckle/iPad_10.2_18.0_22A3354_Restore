@implementation TPSAnalyticsUsageEventsProcessor

- (TPSAnalyticsUsageEventsProcessor)init
{
  TPSAnalyticsUsageEventsProcessor *v2;
  uint64_t v3;
  NSDate *currentDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsUsageEventsProcessor;
  v2 = -[TPSAnalyticsProcessor init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    currentDate = v2->_currentDate;
    v2->_currentDate = (NSDate *)v3;

  }
  return v2;
}

- (void)processAnalytics:(id)a3
{
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  TPSAnalyticsUsageInfo *v16;
  NSObject *v17;
  void *v18;
  void (**v19)(_QWORD);
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void (**v42)(void);
  id v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  _QWORD v48[6];
  id v49;
  id v50;
  id v51;
  void (**v52)(_QWORD);
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD aBlock[4];
  void (**v58)(void);
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v42 = (void (**)(void))a3;
  -[TPSAnalyticsProcessor dateLastRun](self, "dateLastRun");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[TPSAnalyticsProcessor dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allTipStatus");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v46)
  {
    v45 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v46; ++i)
      {
        if (*(_QWORD *)v65 != v45)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v6, "identifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPSAnalyticsProcessor dataSource](self, "dataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contextualInfoForIdentifier:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)objc_opt_class(), "_firstShownDateForTipStatus:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "_notifiedDateForTipStatus:", v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)objc_opt_class(), "_tipStatusValidForLiftProcessing:contextualInfo:firstShownDate:", v6, v9, v10))
        {
          objc_msgSend(v9, "usageEvents");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "desiredOutcomePerformedDates");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          v16 = objc_alloc_init(TPSAnalyticsUsageInfo);
          -[TPSAnalyticsUsageInfo setOverrideHoldout:](v16, "setOverrideHoldout:", objc_msgSend(v6, "overrideHoldout"));
          -[TPSAnalyticsUsageInfo setFirstShownDate:](v16, "setFirstShownDate:", v10);
          -[TPSAnalyticsUsageInfo setNotifiedDate:](v16, "setNotifiedDate:", v11);
          -[TPSAnalyticsUsageInfo setUsageEvent:](v16, "setUsageEvent:", v13);
          -[TPSAnalyticsUsageInfo setIdentifier:](v16, "setIdentifier:", v7);
          -[TPSAnalyticsUsageInfo setDesiredOutcomeCount:](v16, "setDesiredOutcomeCount:", v15);
          objc_msgSend(v43, "addObject:", v16);

        }
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v46);
  }

  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v63 = objc_msgSend(v43, "count");
  objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)v61[3];
    *(_DWORD *)buf = 134217984;
    v70 = v18;
    _os_log_impl(&dword_1DAC2F000, v17, OS_LOG_TYPE_INFO, "Valid tips for usage event processing: %lu", buf, 0xCu);
  }

  if (v61[3])
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke;
    aBlock[3] = &unk_1EA1E0BE8;
    v59 = &v60;
    v58 = v42;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateByAddingUnit:value:toDate:options:", 16, -5, self->_currentDate, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v22 = v43;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v54;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v54 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v25);
          if (v47
            && (objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v25), "firstShownDate"),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v27, "compare:", v47) == 1,
                v27,
                !v28))
          {
            if (-[TPSAnalyticsUsageEventsProcessor _shouldCalculateLift:](self, "_shouldCalculateLift:", v26))
            {
              objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
              v34 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v26, "identifier");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v70 = v35;
                _os_log_impl(&dword_1DAC2F000, v34, OS_LOG_TYPE_INFO, "Lift threshold hit, calculating lift for: %@", buf, 0xCu);

              }
              -[TPSAnalyticsProcessor dataSource](self, "dataSource");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "experiment");
              v37 = (void *)objc_claimAutoreleasedReturnValue();

              v48[0] = MEMORY[0x1E0C809B0];
              v48[1] = 3221225472;
              v48[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_6;
              v48[3] = &unk_1EA1E0C10;
              v48[4] = self;
              v48[5] = v26;
              v49 = v47;
              v50 = v21;
              v38 = v37;
              v51 = v38;
              v52 = v19;
              -[TPSAnalyticsUsageEventsProcessor _calculateLift:completion:](self, "_calculateLift:completion:", v26, v48);

            }
            else
            {
              objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v26, "identifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v70 = v40;
                _os_log_impl(&dword_1DAC2F000, v39, OS_LOG_TYPE_INFO, "Lift threshold not yet hit for: %@", buf, 0xCu);

              }
              v19[2](v19);
            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v26, "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v70 = v30;
              _os_log_impl(&dword_1DAC2F000, v29, OS_LOG_TYPE_INFO, "Tip shown since last run, saving historical usage: %@", buf, 0xCu);

            }
            objc_msgSend(v26, "firstShownDate");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "compare:", v21) == -1;

            if (v32)
            {
              objc_msgSend(v26, "identifier");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              -[TPSAnalyticsUsageEventsProcessor _savePreHintRangeOutOfBounds:forIdentifier:](self, "_savePreHintRangeOutOfBounds:forIdentifier:", 1, v33);

            }
            -[TPSAnalyticsUsageEventsProcessor _saveHistoricalUsage:completion:](self, "_saveHistoricalUsage:completion:", v26, v19);
          }
          ++v25;
        }
        while (v23 != v25);
        v41 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v68, 16);
        v23 = v41;
      }
      while (v41);
    }

  }
  else
  {
    v42[2]();
  }
  _Block_object_dispose(&v60, 8);

}

void __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[4];
  __int128 v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_2;
  block[3] = &unk_1EA1E0BE8;
  v2 = *(_OWORD *)(a1 + 32);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_2(uint64_t result)
{
  if (!--*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __53__TPSAnalyticsUsageEventsProcessor_processAnalytics___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  TPSAnalyticsEventProcessedUsageEvents *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TPSAnalyticsEventProcessedUsageEvents *v22;

  v6 = (void *)objc_opt_class();
  v7 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_preHintRangeOutOfBoundsForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "loadValueForKey:class:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = objc_msgSend(*(id *)(a1 + 48), "compare:", *(_QWORD *)(a1 + 56)) == -1;
  v13 = [TPSAnalyticsEventProcessedUsageEvents alloc];
  v14 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[TPSAnalyticsEventProcessedUsageEvents initWithUsageInfo:experiment:preHintUsageCount:postHintUsageCount:preHintRangeOutOfBounds:postHintRangeOutOfBounds:date:](v13, "initWithUsageInfo:experiment:preHintUsageCount:postHintUsageCount:preHintRangeOutOfBounds:postHintRangeOutOfBounds:date:", v14, v15, a2, a3, v11, v12, v16);

  objc_msgSend(MEMORY[0x1E0DBF2D0], "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "logAnalyticsEvent:", v22);

  v18 = (void *)objc_opt_class();
  v19 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_usageEventsProcessedKeyForIdentifier:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "saveValue:forKey:", MEMORY[0x1E0C9AAB0], v21);

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

- (void)resetAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TPSAnalyticsUsageEventsProcessor;
  -[TPSAnalyticsProcessor resetAnalytics](&v7, sel_resetAnalytics);
  -[TPSAnalyticsProcessor setDateLastRun:](self, "setDateLastRun:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__TPSAnalyticsUsageEventsProcessor_resetAnalytics__block_invoke;
  v6[3] = &unk_1EA1E0C38;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __50__TPSAnalyticsUsageEventsProcessor_resetAnalytics__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("TPSAnalyticsUsageEvents")))
    objc_msgSend((id)objc_opt_class(), "saveValue:forKey:", 0, v2);

}

- (BOOL)_shouldCalculateLift:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0DBF3A0], "crunchingIntervalInDays");
  if (v5)
  {
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 20;
    else
      v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 16, -v6, self->_currentDate, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "firstShownDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "compare:", v8) == -1;

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)_calculateLift:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstShownDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, 19, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v6, "firstShownDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithStartDate:endDate:", v12, v10);

  objc_msgSend(v6, "usageEvent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __62__TPSAnalyticsUsageEventsProcessor__calculateLift_completion___block_invoke;
  v17[3] = &unk_1EA1E0C60;
  v17[4] = self;
  v18 = v6;
  v19 = v7;
  v15 = v7;
  v16 = v6;
  -[TPSAnalyticsUsageEventsProcessor _countsForEvent:interval:completion:](self, "_countsForEvent:interval:completion:", v14, v13, v17);

}

uint64_t __62__TPSAnalyticsUsageEventsProcessor__calculateLift_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_opt_class();
  v3 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_preHintUsageKeyForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadValueForKey:class:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "integerValue");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_savePreHintRangeOutOfBounds:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a4;
  objc_msgSend((id)objc_opt_class(), "_preHintRangeOutOfBoundsForIdentifier:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveValue:forKey:", v7, v8);

}

- (void)_saveHistoricalUsage:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstShownDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", 16, -20, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstShownDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, -1, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v13);
  objc_msgSend(v6, "usageEvent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__TPSAnalyticsUsageEventsProcessor__saveHistoricalUsage_completion___block_invoke;
  v18[3] = &unk_1EA1E0C60;
  v18[4] = self;
  v19 = v6;
  v20 = v7;
  v16 = v7;
  v17 = v6;
  -[TPSAnalyticsUsageEventsProcessor _countsForEvent:interval:completion:](self, "_countsForEvent:interval:completion:", v15, v14, v18);

}

void __68__TPSAnalyticsUsageEventsProcessor__saveHistoricalUsage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_preHintUsageKeyForIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1DAC2F000, v7, OS_LOG_TYPE_INFO, "Saving value: %@ for key: %@", (uint8_t *)&v11, 0x16u);

  }
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveValue:forKey:", v10, v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_countsForEvent:(id)a3 interval:(id)a4 completion:(id)a5
{
  void *v7;
  void (**v8)(id, uint64_t);

  v7 = (void *)MEMORY[0x1E0DBF328];
  v8 = (void (**)(id, uint64_t))a5;
  v8[2](v8, objc_msgSend(v7, "countsForEvent:interval:", a3, a4));

}

+ (id)_preHintUsageKeyForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_PreHintUsage"), CFSTR("TPSAnalyticsUsageEvents"), a3);
}

+ (id)_preHintRangeOutOfBoundsForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_PreHintRangeOutOfBounds"), CFSTR("TPSAnalyticsUsageEvents"), a3);
}

+ (id)_usageEventsProcessedKeyForIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_UsageEventsProcessed"), CFSTR("TPSAnalyticsUsageEvents"), a3);
}

+ (id)_firstShownDateForTipStatus:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") && objc_msgSend(v3, "displayType") != 1)
  {
    objc_msgSend(v3, "hintWouldHaveBeenDisplayedDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v4 = v5;
    }
    else
    {
      objc_msgSend(v3, "hintDisplayedDates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v3, "contentViewedDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

+ (id)_notifiedDateForTipStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "displayType") && objc_msgSend(v3, "displayType") != 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "hintWouldHaveBeenDisplayedDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(v3, "hintDisplayedDates");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

+ (BOOL)_tipStatusValidForLiftProcessing:(id)a3 contextualInfo:(id)a4 firstShownDate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  char v17;
  char v18;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_usageEventsProcessedKeyForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadValueForKey:class:", v12, objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  v15 = (void *)objc_opt_class();
  v16 = objc_msgSend(v9, "displayType");

  v17 = objc_msgSend(v15, "_validateContextualInfo:forDisplayType:", v8, v16);
  if (a5)
    v18 = v17;
  else
    v18 = 0;
  return v18 & (v14 ^ 1);
}

+ (BOOL)_validateContextualInfo:(id)a3 forDisplayType:(unint64_t)a4
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = v5 != 0;
  }
  else
  {
    objc_msgSend(v5, "usageEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v6, "desiredOutcomeCondition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "rules");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v10, "count") != 0;

    }
  }

  return v7;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end
