@implementation TPSAnalyticsHistoricTipsDataProcessor

- (TPSAnalyticsHistoricTipsDataProcessor)init
{
  TPSAnalyticsHistoricTipsDataProcessor *v2;
  uint64_t v3;
  NSDate *currentDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSAnalyticsHistoricTipsDataProcessor;
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
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  TPSAnalyticsHistoricTipsDataProcessor *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  void *v46;
  unsigned int v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void (**v54)(_QWORD);
  void *v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BYTE v73[128];
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (!-[TPSAnalyticsHistoricTipsDataProcessor _shouldProceedWithCrunching](self, "_shouldProceedWithCrunching"))
    goto LABEL_37;
  -[TPSAnalyticsProcessor setDateLastRun:](self, "setDateLastRun:", self->_currentDate);
  -[TPSAnalyticsHistoricTipsDataProcessor _furthestLookbackDate](self, "_furthestLookbackDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v72 = 0;
  v69 = 0;
  v70 = 0;
  -[TPSAnalyticsProcessor dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allTipStatus");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v8;
  if (!objc_msgSend(v8, "count"))
    goto LABEL_16;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  if (!v10)
    goto LABEL_15;
  v11 = v10;
  v12 = *(_QWORD *)v66;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v66 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
      if (objc_msgSend(v14, "displayType") == 2)
      {
        v15 = &v72;
        v16 = &v71;
      }
      else
      {
        if (objc_msgSend(v14, "displayType") != 1)
          continue;
        v15 = &v70;
        v16 = &v69;
      }
      -[TPSAnalyticsHistoricTipsDataProcessor updateDisplayedCount:andFrequencyControlCount:forTipStatus:andLookbackDate:](self, "updateDisplayedCount:andFrequencyControlCount:forTipStatus:andLookbackDate:", v15, v16, v14, v5);
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v65, v79, 16);
  }
  while (v11);
LABEL_15:

  v17 = objc_alloc(MEMORY[0x1E0DBF2D8]);
  v18 = *MEMORY[0x1E0DBF4D8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v72);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v71);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v17, "initWithDisplayType:displayCount:notDisplayedDueToFrequencyControlCount:", v18, v19, v20);

  objc_msgSend(v6, "addObject:", v21);
  v22 = objc_alloc(MEMORY[0x1E0DBF2D8]);
  v23 = *MEMORY[0x1E0DBF4D0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v70);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v69);
  v25 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v22, "initWithDisplayType:displayCount:notDisplayedDueToFrequencyControlCount:", v23, v24, v26);

  v6 = v25;
  objc_msgSend(v25, "addObject:", v27);

  v8 = v55;
LABEL_16:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "analytics");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v76 = v72;
    v77 = 2048;
    v78 = v70;
    _os_log_impl(&dword_1DAC2F000, v28, OS_LOG_TYPE_INFO, "countDisplayedEmbeeded: %ld countDisplayedOnLockScreen: %ld", buf, 0x16u);
  }

  if (!(v72 | v70))
  {
    v52 = v6;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    -[TPSAnalyticsProcessor dataSource](self, "dataSource");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allContextualInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v62;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v62 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
          objc_msgSend(v36, "triggerEventIdentifiers");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObjectsFromArray:", v37);

          objc_msgSend(v36, "desiredOutcomeEventIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObjectsFromArray:", v38);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      }
      while (v33);
    }
    v39 = self;
    v53 = v5;
    v54 = v4;

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v29;
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v58;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v58 != v42)
            objc_enumerationMutation(obj);
          v44 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
          -[TPSAnalyticsProcessor dataSource](v39, "dataSource");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "contextualEventForIdentifier:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v47 = objc_msgSend(v46, "currentObservationCount");
          v48 = (void *)MEMORY[0x1E0DBF300];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v47);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "eventWithEventID:eventCount:", v44, v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "log");

        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
      }
      while (v41);
    }

    v5 = v53;
    v4 = v54;
    v6 = v52;
    v8 = v55;
  }
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DBF2D0], "sharedInstance");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "logAnalyticsEvents:", v6);

  }
LABEL_37:
  v4[2](v4);

}

- (void)resetAnalytics
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSAnalyticsHistoricTipsDataProcessor;
  -[TPSAnalyticsProcessor resetAnalytics](&v3, sel_resetAnalytics);
  -[TPSAnalyticsProcessor setDateLastRun:](self, "setDateLastRun:", 0);
}

- (void)updateDisplayedCount:(int64_t *)a3 andFrequencyControlCount:(int64_t *)a4 forTipStatus:(id)a5 andLookbackDate:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if ((objc_msgSend(v9, "overrideHoldout") & 1) == 0)
  {
    objc_msgSend(v9, "hintDisplayedDates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "compare:", v10);

    if (v13 == 1)
      ++*a3;
    objc_msgSend(v9, "hintNotDisplayedDueToFrequencyControlDates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v9, "hintNotDisplayedDueToFrequencyControlDates", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "reverseObjectEnumerator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v23;
LABEL_7:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21), "compare:", v10) != 1)
            break;
          ++*a4;
          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v19)
              goto LABEL_7;
            break;
          }
        }
      }

    }
  }

}

- (unint64_t)_daysBetweenDate:(id)a3 andOtherDate:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 120, v7, v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "day");
  return v10;
}

- (BOOL)_shouldProceedWithCrunching
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  BOOL v6;

  v3 = objc_msgSend(MEMORY[0x1E0DBF3A0], "crunchingIntervalInDays");
  if (!v3)
    return 1;
  v4 = v3;
  -[TPSAnalyticsProcessor dateLastRun](self, "dateLastRun");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = 20;
    v6 = -[TPSAnalyticsHistoricTipsDataProcessor _daysBetweenDate:andOtherDate:](self, "_daysBetweenDate:andOtherDate:", v5, self->_currentDate) >= v4;
  }
  else
  {
    -[TPSAnalyticsProcessor setDateLastRun:](self, "setDateLastRun:", self->_currentDate);
    v6 = 0;
  }

  return v6;
}

- (id)_furthestLookbackDate
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v3, "setDay:", -20);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingComponents:toDate:options:", v3, self->_currentDate, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
}

@end
