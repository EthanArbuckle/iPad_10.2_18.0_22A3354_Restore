@implementation VCMetricSubmitter

- (VCMetricSubmitter)initWithDatabaseProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  VCMetricSubmitter *v7;

  v4 = a3;
  +[VCMetricCheckIn recentCheckInWithMode:](VCMetricCheckIn, "recentCheckInWithMode:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0DD9DE0]);
  v7 = -[VCMetricSubmitter initWithCheckIn:event:databaseProvider:](self, "initWithCheckIn:event:databaseProvider:", v5, v6, v4);

  return v7;
}

- (VCMetricSubmitter)initWithCheckIn:(id)a3 event:(id)a4 databaseProvider:(id)a5
{
  id v10;
  id v11;
  id v12;
  VCMetricSubmitter *v13;
  VCMetricSubmitter *v14;
  VCMetricSubmitter *v15;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCMetricSubmitter.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCMetricSubmitter.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("checkIn"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCMetricSubmitter.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

LABEL_4:
  v20.receiver = self;
  v20.super_class = (Class)VCMetricSubmitter;
  v13 = -[VCMetricSubmitter init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_checkIn, a3);
    objc_storeStrong((id *)&v14->_event, a4);
    objc_storeStrong((id *)&v14->_databaseProvider, a5);
    v15 = v14;
  }

  return v14;
}

- (void)perform
{
  NSObject *v3;
  void *v4;
  char v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  NSObject *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  getWFEventTrackerLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[VCMetricSubmitter perform]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Attempting to perform checkin", buf, 0xCu);
  }

  -[VCMetricSubmitter checkIn](self, "checkIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCheckInAllowed");

  if ((v5 & 1) != 0)
  {
    -[VCMetricSubmitter databaseProvider](self, "databaseProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v6, "databaseWithError:", &v24);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v24;

    if (!v7)
    {
      getWFEventTrackerLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[VCMetricSubmitter perform]";
        v27 = 2114;
        v28 = v8;
        _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Checkin is not possible because no database is available; %{public}@",
          buf,
          0x16u);
      }
      goto LABEL_16;
    }
    -[VCMetricSubmitter event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInstalled:", -[VCMetricSubmitter isAppInstalled](self, "isAppInstalled"));
    objc_msgSend(v9, "setSharingEnabled:", -[VCMetricSubmitter isSharingEnabled](self, "isSharingEnabled"));
    objc_msgSend(v9, "setPersonalAutomationsEnabled:", -[VCMetricSubmitter personalAutomationsEnabled:](self, "personalAutomationsEnabled:", v7));
    objc_msgSend(v9, "setSleepEnabled:", -[VCMetricSubmitter isSleepEnabled](self, "isSleepEnabled"));
    v23 = 0;
    v10 = -[VCMetricSubmitter homeAutomationsPresent:](self, "homeAutomationsPresent:", &v23);
    v11 = v23;
    objc_msgSend(v9, "setHomeAutomationsEnabled:", v10);
    objc_msgSend(v9, "setAverageShortcutCountPerFolder:", -[VCMetricSubmitter averageShortcutCountPerFolder:](self, "averageShortcutCountPerFolder:", v7));
    objc_msgSend(v9, "setShortcutsCount:", -[VCMetricSubmitter shortcutsCount:](self, "shortcutsCount:", v7));
    objc_msgSend(v9, "setUncategorizedShortcutCount:", -[VCMetricSubmitter uncategorizedShortcutCount:](self, "uncategorizedShortcutCount:", v7));
    objc_msgSend(v9, "setWatchShortcutCount:", -[VCMetricSubmitter watchShortcutCount:](self, "watchShortcutCount:", v7));
    objc_msgSend(v9, "setFolderCount:", -[VCMetricSubmitter folderCount:](self, "folderCount:", v7));
    objc_msgSend(v9, "setNumberOfPersonalAutomationsEnabled:", -[VCMetricSubmitter numberOfPersonalAutomationsEnabled:](self, "numberOfPersonalAutomationsEnabled:", v7));
    objc_msgSend(v9, "setAppComplicationSlotsUsed:", objc_msgSend(MEMORY[0x1E0DD9CD8], "appComplicationSlotsUsed"));
    objc_msgSend(v9, "setShortcutComplicationSlotsUsed:", objc_msgSend(MEMORY[0x1E0DD9CD8], "shortcutComplicationSlotsUsed"));
    objc_msgSend(v9, "setShortcutRunCount:", -[VCMetricSubmitter numberOfShortcutRuns:](self, "numberOfShortcutRuns:", v7));
    v22 = v11;
    v12 = -[VCMetricSubmitter numberOfAppSessions:](self, "numberOfAppSessions:", &v22);
    v13 = v22;

    objc_msgSend(v9, "setAppSessionCount:", v12);
    objc_msgSend(v9, "setSleepShortcutsCount:", -[VCMetricSubmitter sleepShortcutCount:](self, "sleepShortcutCount:", v7));
    objc_msgSend(v9, "setAutoShortcutsSectionsViewed:", -[VCMetricSubmitter hasSeenAutoShortcutsSections](self, "hasSeenAutoShortcutsSections"));
    v21 = v13;
    -[VCMetricSubmitter addWidgetMetricsToEvent:error:](self, "addWidgetMetricsToEvent:error:", v9, &v21);
    v14 = v21;

    if (v14)
    {
      getWFEventTrackerLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v26 = "-[VCMetricSubmitter perform]";
        v27 = 2114;
        v28 = v14;
        v16 = "%s Checkin is not possible because of an error: %{public}@";
        v17 = v15;
        v18 = OS_LOG_TYPE_FAULT;
        v19 = 22;
LABEL_14:
        _os_log_impl(&dword_1C146A000, v17, v18, v16, buf, v19);
      }
    }
    else
    {
      objc_msgSend(v9, "track");
      -[VCMetricSubmitter checkIn](self, "checkIn");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "updateCheckInToNow");

      getWFEventTrackerLogObject();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[VCMetricSubmitter perform]";
        v16 = "%s Checkin completed successfully";
        v17 = v15;
        v18 = OS_LOG_TYPE_INFO;
        v19 = 12;
        goto LABEL_14;
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  getWFEventTrackerLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v26 = "-[VCMetricSubmitter perform]";
    v27 = 2112;
    v28 = v7;
    _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_INFO, "%s Checkin is not allowed at this time: %@", buf, 0x16u);
LABEL_17:

  }
}

- (BOOL)isAppInstalled
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  char v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CA5870]);
  v3 = *MEMORY[0x1E0DC7FD8];
  v9 = 0;
  v4 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v9);
  v5 = v9;
  if (v5)
  {
    getWFEventTrackerLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[VCMetricSubmitter isAppInstalled]";
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_1C146A000, v6, OS_LOG_TYPE_FAULT, "%s Error accessing LSApplicationRecord for Shortcuts: %@", buf, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "applicationState");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject isInstalled](v6, "isInstalled");
  }

  return v7;
}

- (BOOL)isSharingEnabled
{
  return objc_msgSend(MEMORY[0x1E0DD9E50], "sharingEnabled");
}

- (BOOL)isSleepEnabled
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9D60]), "initWithSleepFeature:", 1);
  v3 = objc_msgSend(v2, "sleepOnboardingStatus") == 1;

  return v3;
}

- (BOOL)personalAutomationsEnabled:(id)a3
{
  return -[VCMetricSubmitter numberOfPersonalAutomationsEnabled:](self, "numberOfPersonalAutomationsEnabled:", a3) != 0;
}

- (BOOL)hasSeenAutoShortcutsSections
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "workflowUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0DD9FD0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = 0;
    goto LABEL_6;
  }
  -[VCMetricCheckIn intervalStartDate](self->_checkIn, "intervalStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "compare:", v4);

  if (v6 != -1)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (BOOL)homeAutomationsPresent:(id *)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DD9D68], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "status") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC8058], 90210, 0);
    v5 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v26 = v4;
    objc_msgSend(v4, "homesToWhichWeCanAddHomeAutomations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v23)
    {
      v7 = *(_QWORD *)v32;
      v25 = v6;
      v22 = *(_QWORD *)v32;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v32 != v7)
            objc_enumerationMutation(v6);
          v24 = v8;
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v9, "triggers");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v28;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v28 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * i);
                v16 = v15;
                if (v15)
                {
                  if (objc_msgSend(v15, "conformsToProtocol:", &unk_1EF716D50))
                    v17 = v16;
                  else
                    v17 = 0;
                }
                else
                {
                  v17 = 0;
                }
                v18 = v17;

                v19 = objc_msgSend(v18, "hf_triggerType");
                if (v19 != 7 && v19)
                {

                  v5 = 1;
                  goto LABEL_28;
                }
                getWFEventTrackerLogObject();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  v36 = "-[VCMetricSubmitter homeAutomationsPresent:]";
                  v37 = 2114;
                  v38 = v16;
                  _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_ERROR, "%s Ignoring trigger of unknown or placeholder type: %{public}@", buf, 0x16u);
                }

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
              if (v12)
                continue;
              break;
            }
          }

          v8 = v24 + 1;
          v6 = v25;
          v7 = v22;
        }
        while (v24 + 1 != v23);
        v23 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v23);
    }

    v5 = 0;
LABEL_28:
    v4 = v26;
  }

  return v5;
}

- (unsigned)averageShortcutCountPerFolder:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "sortedVisibleFolders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    v5 = objc_msgSend(v3, "countOfWorkflowsInAFolder") / v5;

  return v5;
}

- (unsigned)shortcutsCount:(id)a3
{
  return objc_msgSend(a3, "countOfAllVisibleWorkflows");
}

- (unsigned)uncategorizedShortcutCount:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0DC7E58];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithLocation:", 1);
  objc_msgSend(v4, "sortedWorkflowsWithQuery:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v6, "count");
  return v4;
}

- (unsigned)watchShortcutCount:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0DC7E58];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithWorkflowType:", *MEMORY[0x1E0DC8510]);
  objc_msgSend(v4, "sortedWorkflowsWithQuery:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "count");
  return v4;
}

- (unsigned)folderCount:(id)a3
{
  void *v3;
  unsigned int v4;

  objc_msgSend(a3, "sortedVisibleFolders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unsigned)numberOfPersonalAutomationsEnabled:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DD9EC0]), "initWithDatabase:", v3);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  objc_msgSend(v4, "allConfiguredTriggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__VCMetricSubmitter_numberOfPersonalAutomationsEnabled___block_invoke;
  v7[3] = &unk_1E7AA6420;
  v7[4] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  LODWORD(v5) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (unsigned)numberOfShortcutRuns:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[VCMetricSubmitter checkIn](self, "checkIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intervalStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedRunEventsWithSource:startDate:endDate:", 0, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v8, "count");
  return v4;
}

- (unsigned)numberOfAppSessions:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  id v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[VCMetricSubmitter checkIn](self, "checkIn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3528];
  v6 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(v4, "intervalStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForEventsWithStartOrEndInDateRangeWithFrom:to:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v9;
  v10 = (void *)MEMORY[0x1E0D15AD0];
  objc_msgSend(MEMORY[0x1E0D159C0], "withBundle:", *MEMORY[0x1E0DC7FD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateForEventsWithIdentifierValue:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0D15AF8], "appInFocusStream");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v14, v17, 0, 0, MEMORY[0x1E0C9AA60]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setResultType:", 1);
  objc_msgSend(v18, "setReadMetadata:", 0);
  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v19, "executeQuery:error:", v18, &v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v27;

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v25 = objc_msgSend(v24, "unsignedIntValue");

  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:", 1296357, v21);
    v25 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (unsigned)sleepShortcutCount:(id)a3
{
  void *v3;
  unsigned int v4;

  objc_msgSend(a3, "sortedVisibleWorkflowsWithType:", *MEMORY[0x1E0DC8508]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)addWidgetMetricsToEvent:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(getATXHomeScreenConfigCacheClass());
  v53 = 0;
  objc_msgSend(v6, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v53);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v53;
  v9 = v8;
  if (v7)
  {
    v26 = v8;
    v27 = v7;
    v28 = v6;
    v29 = v5;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v7;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    v10 = 0;
    if (v32)
    {
      v39 = 0;
      v40 = 0;
      v38 = 0;
      v31 = *(_QWORD *)v50;
      v11 = *MEMORY[0x1E0DC7FD8];
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v50 != v31)
            objc_enumerationMutation(obj);
          v33 = v12;
          v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v12);
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v48 = 0u;
          objc_msgSend(v13, "stacks");
          v34 = (id)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
          if (v36)
          {
            v35 = *(_QWORD *)v46;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v46 != v35)
                  objc_enumerationMutation(v34);
                v37 = v14;
                v15 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v14);
                v41 = 0u;
                v42 = 0u;
                v43 = 0u;
                v44 = 0u;
                objc_msgSend(v15, "widgets");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                if (v17)
                {
                  v18 = v17;
                  v19 = *(_QWORD *)v42;
                  do
                  {
                    for (i = 0; i != v18; ++i)
                    {
                      if (*(_QWORD *)v42 != v19)
                        objc_enumerationMutation(v16);
                      v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
                      objc_msgSend(v21, "appBundleId");
                      v22 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v21, "extensionBundleId");
                      v23 = objc_claimAutoreleasedReturnValue();
                      if (v22 | v23
                        && ((objc_msgSend((id)v22, "isEqualToString:", v11) & 1) != 0
                         || objc_msgSend((id)v23, "isEqualToString:", CFSTR("Shortcuts"))))
                      {
                        v24 = objc_msgSend(v15, "stackLayoutSize");
                        switch(v24)
                        {
                          case 2:
                            ++v40;
                            break;
                          case 1:
                            ++v39;
                            break;
                          case 0:
                            ++v38;
                            break;
                        }
                        if (objc_msgSend(v13, "pageIndex") == 20000)
                          ++v10;
                      }

                    }
                    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
                  }
                  while (v18);
                }

                v14 = v37 + 1;
              }
              while (v37 + 1 != v36);
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
            }
            while (v36);
          }

          v12 = v33 + 1;
        }
        while (v33 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v32);
    }
    else
    {
      v39 = 0;
      v40 = 0;
      v38 = 0;
    }

    v5 = v29;
    objc_msgSend(v29, "setNumberOfSmallWidgets:");
    objc_msgSend(v29, "setNumberOfMediumWidgets:", v39);
    objc_msgSend(v29, "setNumberOfLargeWidgets:", v40);
    objc_msgSend(v29, "setNumberOfWidgetsOnHomeScreen:", (v40 - v10 + v39 + v38));
    objc_msgSend(v29, "setNumberOfWidgetsOnLoL:", v10);
    v7 = v27;
    v6 = v28;
    v9 = v26;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "vc_voiceShortcutErrorWithCode:underlyingError:", 213456, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7 != 0;
}

- (WFMetricStatusEvent)event
{
  return self->_event;
}

- (VCMetricCheckIn)checkIn
{
  return self->_checkIn;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_checkIn, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

uint64_t __56__VCMetricSubmitter_numberOfPersonalAutomationsEnabled___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEnabled");
  if ((_DWORD)result)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

+ (id)activityIdentifier
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("+[VCMetricSubmitter activityIdentifier] must be overridden"));
  __break(1u);
  return result;
}

+ (void)scheduleWithDatabaseProvider:(id)a3
{
  id v4;
  WFXPCActivityScheduler *v5;
  void *v6;
  WFXPCActivityScheduler *v7;

  v4 = a3;
  v5 = [WFXPCActivityScheduler alloc];
  objc_msgSend(a1, "activityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFXPCActivityScheduler initWithActivityIdentifier:](v5, "initWithActivityIdentifier:", v6);

  objc_msgSend(a1, "scheduleWithScheduler:databaseProvider:", v7, v4);
}

+ (void)scheduleWithScheduler:(id)a3 databaseProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCMetricSubmitter.m"), 339, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scheduler"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("VCMetricSubmitter.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("provider"));

LABEL_3:
  getWFEventTrackerLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(a1, "activityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "+[VCMetricSubmitter scheduleWithScheduler:databaseProvider:]";
    v20 = 2114;
    v21 = v11;
    _os_log_impl(&dword_1C146A000, v10, OS_LOG_TYPE_DEBUG, "%s Scheduling metric check in activity: (%{public}@)", buf, 0x16u);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke;
  v15[3] = &unk_1E7AA6730;
  v16 = v9;
  v17 = a1;
  v12 = v9;
  objc_msgSend(v7, "scheduleWithRunHandler:", v15);

}

+ (void)performWithDatabaseProvider:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseProvider:", v3);

  objc_msgSend(v4, "perform");
}

uint64_t __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;

  v4 = a3;
  dispatch_get_global_queue(17, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke_2;
  block[3] = &unk_1E7AA6448;
  v6 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v4;
  v7 = v4;
  dispatch_async(v5, block);

  return 0;
}

uint64_t __60__VCMetricSubmitter_scheduleWithScheduler_databaseProvider___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  getWFEventTrackerLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "activityIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 136315394;
    v6 = "+[VCMetricSubmitter scheduleWithScheduler:databaseProvider:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Scheduling metric checkin activity invoked: (%{public}@)", (uint8_t *)&v5, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "performWithDatabaseProvider:", *(_QWORD *)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
