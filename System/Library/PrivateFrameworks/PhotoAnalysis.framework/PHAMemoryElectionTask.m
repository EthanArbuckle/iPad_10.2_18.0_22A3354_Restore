@implementation PHAMemoryElectionTask

- (void)handleNotificationsForMemories:(id)a3 graphManager:(id)a4 userFeedbackCalculator:(id)a5 loggingConnection:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  char v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PHANotificationController *v27;
  PHANotificationController *v28;
  char v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (objc_msgSend(MEMORY[0x1E0D76298], "isMemoriesNotificationDisabled"))
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = "[PHAMemoryElectionTask] Not firing memories notification: disabled in settings";
LABEL_11:
      _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
    }
  }
  else if ((PLIsFeaturedContentAllowed() & 1) != 0)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0D76200]);
    v31 = v11;
    if ((objc_msgSend(v30, "BOOLValueForKey:withFallbackValue:", CFSTR("com.apple.photos.graphservice.forcedailynotifications"), 0) & 1) != 0|| -[PHAMemoryElectionTask forceNotification](self, "forceNotification"))
    {
      v15 = 1;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v39 = 1;
        _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Memory notifications will be forced: %d", buf, 8u);
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Handling notifications for memories", buf, 2u);
      }
      v15 = 0;
    }
    v29 = v15;
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = v10;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v23, "score");
          objc_msgSend(v24, "numberWithDouble:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v25);

          objc_msgSend(v23, "localIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v26);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v20);
    }

    v11 = v31;
    v27 = -[PHANotificationController initWithGraphManager:userFeedbackCalculator:]([PHANotificationController alloc], "initWithGraphManager:userFeedbackCalculator:", v31, v12);
    v28 = v27;
    if ((v29 & 1) != 0
      || -[PHANotificationController shouldFireNotificationForMemoriesWithScores:withCreationReason:](v27, "shouldFireNotificationForMemoriesWithScores:withCreationReason:", v16, 2))
    {
      -[PHANotificationController fireNotificationForMemoryIdentifiers:withCreationReason:](v28, "fireNotificationForMemoryIdentifiers:withCreationReason:", v17, 2);
    }

    v10 = v32;
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v14 = "[PHAMemoryElectionTask] Not firing memories notification: featured content is disabled in settings";
    goto LABEL_11;
  }

}

- (PHAMemoryElectionTask)init
{
  PHAMemoryElectionTask *v2;
  uint64_t v3;
  NSDate *universalDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAMemoryElectionTask;
  v2 = -[PHAMemoryElectionTask init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    universalDate = v2->_universalDate;
    v2->_universalDate = (NSDate *)v3;

    *(_DWORD *)&v2->_userInitiated = 0;
    v2->_requestedCategory = 0;
    v2->_requestedTriggerType = 0;
    v2->_featureCode = 101;
  }
  return v2;
}

- (NSString)name
{
  return (NSString *)CFSTR("PHAMemoryElectionTask");
}

- (double)period
{
  return -2.0;
}

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (id)incrementalKey
{
  return 0;
}

- (id)taskClassDependencies
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)priority
{
  return 1;
}

- (BOOL)shouldRunWithGraphManager:(id)a3
{
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NSDate *universalDate;
  void *v23;
  uint64_t v24;
  NSDate *v25;
  NSObject *oslog;
  id v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  NSDate *v37;
  _BYTE v38[128];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35 = 0;
  v5 = objc_msgSend(v4, "isReadyWithError:", &v35);
  v6 = v35;
  if (v5)
  {
    objc_msgSend(v4, "workingContextForMemories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D76298], "isMemoryElectionDisabled"))
    {
      v10 = 0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "PHAMemoryElectionTask is disabled via user defaults";
LABEL_19:
        _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 2u);
        v10 = 0;
      }
    }
    else
    {
      if ((PLIsFeaturedContentAllowed() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "librarySpecificFetchOptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 1;
        objc_msgSend(v13, "setIncludePendingMemories:", 1);
        objc_msgSend(v13, "setFetchLimit:", 10);
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
        v30 = v8;
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setSortDescriptors:", v15);

        v29 = v13;
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13);
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v34 = 0u;
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        if (v17)
        {
          v18 = v17;
          oslog = v9;
          v28 = v6;
          v19 = *(_QWORD *)v32;
          while (2)
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v32 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
              objc_msgSend(v21, "photosGraphVersion", oslog);
              if (PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() >= 0x301)
              {
                universalDate = self->_universalDate;
                objc_msgSend(v21, "creationDate");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v12, "compareDate:toDate:toUnitGranularity:", universalDate, v23, 16);

                if (v24 != 1)
                {
                  v9 = oslog;
                  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
                  {
                    v25 = self->_universalDate;
                    *(_DWORD *)buf = 138412290;
                    v37 = v25;
                    _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Already generated memories for universal date %@", buf, 0xCu);
                  }
                  v10 = 0;
                  v6 = v28;
                  goto LABEL_23;
                }
              }
            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
            if (v18)
              continue;
            break;
          }
          v10 = 1;
          v9 = oslog;
          v6 = v28;
LABEL_23:
          v8 = v30;
          v13 = v29;
        }
        else
        {
          v8 = v30;
        }

        goto LABEL_26;
      }
      v10 = 0;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "[PHAMemoryElectionTask] featured content is disabled in settings";
        goto LABEL_19;
      }
    }
LABEL_26:

    goto LABEL_27;
  }
  v10 = 0;
LABEL_27:

  return v10;
}

- (BOOL)runWithGraphManager:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2151;
  v17 = __Block_byref_object_dispose__2152;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_error___block_invoke;
  v12[3] = &unk_1E851FEA0;
  v12[4] = &v19;
  v12[5] = &v13;
  -[PHAMemoryElectionTask runWithGraphManager:progressReporter:reply:](self, "runWithGraphManager:progressReporter:reply:", v8, v9, v12);
  if (a5)
    *a5 = objc_retainAutorelease((id)v14[5]);
  v10 = *((_BYTE *)v20 + 24);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)runWithGraphManager:(id)a3 progressReporter:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  PHAMemoryElectionTask *v16;
  BOOL userInitiated;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  id v24;
  NSObject *v25;
  BOOL v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  PHAMemoryElectionTask *v59;
  id v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  uint64_t *v67;
  uint8_t *v68;
  uint64_t *v69;
  BOOL v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  _QWORD v81[2];
  _QWORD v82[2];
  uint8_t v83[4];
  _BYTE v84[14];
  uint8_t buf[8];
  uint8_t *v86;
  uint64_t v87;
  uint64_t (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t);
  id v90;
  _QWORD v91[4];

  v91[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v48 = a5;
  objc_msgSend(v7, "analytics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v8);
  objc_msgSend(v9, "childProgressReporterToCheckpoint:", 0.25);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childProgressReporterToCheckpoint:", 0.5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childProgressReporterToCheckpoint:", 0.75);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "childProgressReporterToCheckpoint:", 1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "workingContextForMemories");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "photoLibrary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v13);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fetchedObjects");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v15 = v10;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v49, "count");
    _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Found %d existing memories.", buf, 8u);

  }
  if (objc_msgSend(v8, "isCancelled"))
  {
    (*((void (**)(id, _QWORD, _QWORD))v48 + 2))(v48, MEMORY[0x1E0C9AA70], 0);
  }
  else
  {
    v16 = self;
    userInitiated = self->_userInitiated;
    if (!userInitiated)
    {
      -[PHAMemoryElectionTask collectMetricsOnExistingMemories:loggingConnection:analytics:](self, "collectMetricsOnExistingMemories:loggingConnection:analytics:", v49, v10, v42);
      objc_msgSend(v7, "workingContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHAMemoryElectionTask collectMetricsOnMemoriesInGraphWithWorkingContext:loggingConnection:analytics:](self, "collectMetricsOnMemoriesInGraphWithWorkingContext:loggingConnection:analytics:", v18, v10, v42);

      v16 = self;
    }
    -[PHAMemoryElectionTask _electorConfigurationForExistingMemories:graphManager:loggingConnection:](v16, "_electorConfigurationForExistingMemories:graphManager:loggingConnection:", v49, v7, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v86 = buf;
    v87 = 0x3032000000;
    v88 = __Block_byref_object_copy__2151;
    v89 = __Block_byref_object_dispose__2152;
    v90 = 0;
    v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v75 = 0;
    v76 = &v75;
    v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__2151;
    v79 = __Block_byref_object_dispose__2152;
    v80 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x2020000000;
    v74 = 1;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v50);
    objc_msgSend(v7, "workingContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = !userInitiated;
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke;
    v53[3] = &unk_1E851FF18;
    v37 = v7;
    v54 = v37;
    v23 = v20;
    v55 = v23;
    v38 = v19;
    v56 = v38;
    v57 = v44;
    v58 = v8;
    v39 = v48;
    v66 = v39;
    v59 = self;
    v24 = v50;
    v60 = v24;
    v61 = v43;
    v25 = v10;
    v62 = v25;
    v63 = v46;
    v67 = &v75;
    v68 = buf;
    v64 = v45;
    v69 = &v71;
    v41 = v40;
    v65 = v41;
    v70 = v22;
    objc_msgSend(v21, "performSynchronousConcurrentGraphReadUsingBlock:", v53);

    if (*((_BYTE *)v72 + 24))
    {
      if (objc_msgSend(*((id *)v86 + 5), "count"))
      {
        v52 = 0;
        v26 = +[PHAMemoryElectionTask reloadForYouWidgetTimelineWithLoggingConnection:error:](PHAMemoryElectionTask, "reloadForYouWidgetTimelineWithLoggingConnection:error:", v25, &v52);
        v36 = v52;
        if (!v26 && os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v83 = 138412290;
          *(_QWORD *)v84 = v36;
          _os_log_error_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] Error calling reloadForYouWidgetTimelineWithLoggingConnection (%@)", v83, 0xCu);
        }
        objc_msgSend(v24, "librarySpecificFetchOptions");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setIncludePendingMemories:", 1);
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:localIdentifiers:options:", 4, *((_QWORD *)v86 + 5), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "fetchedObjects");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PHAMemoryElectionTask handleNotificationsForMemories:graphManager:userFeedbackCalculator:loggingConnection:](self, "handleNotificationsForMemories:graphManager:userFeedbackCalculator:loggingConnection:", v29, v37, v23, v25);

      }
      v30 = v25;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = objc_msgSend(v41, "count");
        objc_msgSend(v41, "description");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v83 = 67109378;
        *(_DWORD *)v84 = v31;
        *(_WORD *)&v84[4] = 2112;
        *(_QWORD *)&v84[6] = v32;
        _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "Persisted %d memories: %@", v83, 0x12u);

      }
      v33 = *((_QWORD *)v86 + 5);
      if (!v33)
        v33 = MEMORY[0x1E0C9AA60];
      v81[0] = CFSTR("PHMemoryIdentifiersKey");
      v81[1] = CFSTR("PHMemoryDescriptionsKey");
      v82[0] = v33;
      v82[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v39 + 2))(v39, v34, 0);

    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v35 = v76[5];
        *(_DWORD *)v83 = 138412290;
        *(_QWORD *)v84 = v35;
        _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] memoryLocalIdentifiersFromPersistingEnrichedMemories failed (%@)", v83, 0xCu);
      }
      (*((void (**)(id, _QWORD, uint64_t))v39 + 2))(v39, 0, v76[5]);
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(&v75, 8);

    _Block_object_dispose(buf, 8);
  }

}

- (id)_recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      if ((unint64_t)objc_msgSend(v4, "count") > 9)
        break;
      if (objc_msgSend(v10, "pendingState") != 1)
      {
        objc_msgSend(v10, "photosGraphProperties");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("suggestedMood"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = PHMemoryMoodForString();

          if (v14 != 16)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v15);

          }
        }

      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  return v4;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHAMemoryElectionTask timeoutFatal:]", "PHAMemoryElectionTask.m", 353, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHAMemoryElectionTask is stuck", v3, 2u);
  }
}

- (id)_electorConfigurationForExistingMemories:(id)a3 graphManager:(id)a4 loggingConnection:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PHASuggestionController *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0D760C0]);
  objc_msgSend(v11, "setRequestedMemoryCategory:", self->_requestedCategory);
  objc_msgSend(v11, "setRequestedTriggerType:", self->_requestedTriggerType);
  if (self->_requestedFeature)
    objc_msgSend(v11, "setRequestedFeature:");
  if (self->_requestedUniqueMemoryIdentifier)
    objc_msgSend(v11, "setRequestedUniqueMemoryIdentifier:");
  if (self->_universalDate)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLocalDate:", v12);

  }
  if (self->_location)
  {
    objc_msgSend(MEMORY[0x1E0D4B130], "timeZoneFromLocation:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeZone:", v13);

  }
  objc_msgSend(v11, "setShouldPersist:", 0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76200]), "initWithTrialNamespace:onDiskResourceFile:", 1, 0);
  v15 = objc_msgSend(v14, "longValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.election.minimumTargetNumberOfMemories"), 3);
  v16 = objc_msgSend(v14, "longValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.election.maximumTargetNumberOfMemories"), 5);
  v17 = objc_msgSend(v14, "BOOLValueForKey:withFallbackValue:", CFSTR("com.apple.photos.memories.election.useMaximumTargetNumberOfMemories"), 0);
  objc_msgSend(v11, "setMinimumTargetNumberOfMemories:", v15);
  objc_msgSend(v11, "setMaximumTargetNumberOfMemories:", v16);
  objc_msgSend(v11, "setUseMaximumTargetNumberOfMemories:", v17);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v24 = 134217984;
    v25 = v15;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: minimumTargetNumberOfMemories:%lu", (uint8_t *)&v24, 0xCu);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v24 = 134217984;
    v25 = v16;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: maximumTargetNumberOfMemories:%lu", (uint8_t *)&v24, 0xCu);
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v24 = 67109120;
    LODWORD(v25) = v17;
    _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] ElectionConfiguration: useMaximumTargetNumberOfMemories:%d", (uint8_t *)&v24, 8u);
  }
  if (self->_requestedCategory)
  {
    v18 = -[PHASuggestionController initWithGraphManager:]([PHASuggestionController alloc], "initWithGraphManager:", v9);
    v19 = objc_alloc_init(MEMORY[0x1E0D76250]);
    objc_msgSend(MEMORY[0x1E0D4B130], "localDateFromUniversalDate:", self->_universalDate);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLocalToday:", v20);

    objc_msgSend(v19, "setDefaultStartAndEndDatesIfNeeded");
    -[PHASuggestionController ingestExistingSuggestionsWithOptions:](v18, "ingestExistingSuggestionsWithOptions:", v19);
    -[PHASuggestionController collidableSuggestionsWithOptions:](v18, "collidableSuggestionsWithOptions:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCollidableSuggestions:", v21);

  }
  -[PHAMemoryElectionTask _recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:](self, "_recentlySuggestedMoodsFromExistingMemoriesSortedByCreationDate:", v8);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setMoodHistory:", v22);

  return v11;
}

- (NSDate)universalDate
{
  return self->_universalDate;
}

- (void)setUniversalDate:(id)a3
{
  objc_storeStrong((id *)&self->_universalDate, a3);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)createTransientMemories
{
  return self->_createTransientMemories;
}

- (void)setCreateTransientMemories:(BOOL)a3
{
  self->_createTransientMemories = a3;
}

- (BOOL)forceNotification
{
  return self->_forceNotification;
}

- (void)setForceNotification:(BOOL)a3
{
  self->_forceNotification = a3;
}

- (unint64_t)requestedCategory
{
  return self->_requestedCategory;
}

- (void)setRequestedCategory:(unint64_t)a3
{
  self->_requestedCategory = a3;
}

- (unint64_t)requestedTriggerType
{
  return self->_requestedTriggerType;
}

- (void)setRequestedTriggerType:(unint64_t)a3
{
  self->_requestedTriggerType = a3;
}

- (PGFeature)requestedFeature
{
  return self->_requestedFeature;
}

- (void)setRequestedFeature:(id)a3
{
  objc_storeStrong((id *)&self->_requestedFeature, a3);
}

- (NSString)requestedUniqueMemoryIdentifier
{
  return self->_requestedUniqueMemoryIdentifier;
}

- (void)setRequestedUniqueMemoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, a3);
}

- (BOOL)featureAvailable
{
  return self->_featureAvailable;
}

- (unint64_t)featureCode
{
  return self->_featureCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedUniqueMemoryIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedFeature, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_universalDate, 0);
}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  NSObject *v36;
  int v37;
  BOOL v38;
  unint64_t v39;
  NSObject *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  id obj;
  _QWORD v66[4];
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint8_t v71[128];
  uint8_t buf[4];
  id v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D760B8]);
  objc_msgSend(*(id *)(a1 + 32), "workingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithWorkingContext:userFeedbackCalculator:", v5, *(_QWORD *)(a1 + 40));

  v7 = (void *)v3;
  objc_msgSend(v6, "generateEnrichedMemoriesWithConfiguration:graph:progressReporter:", *(_QWORD *)(a1 + 48), v3, *(_QWORD *)(a1 + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 64), "isCancelled"))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();
  }
  else
  {
    v9 = objc_msgSend(v8, "count");
    v10 = v9;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 72) + 9))
      v11 = 1;
    else
      v11 = v9 == 0;
    if (!v11)
    {
      v56 = v6;
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76120]), "initForMemoryEnrichment");
      v13 = *(void **)(a1 + 32);
      v70 = 0;
      objc_msgSend(v13, "musicCuratorContextWithCurationOptions:error:", v12, &v70);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v70;
      v58 = v8;
      v15 = (void *)MEMORY[0x1E0D75CF0];
      v16 = MEMORY[0x1E0C809B0];
      v18 = *(_QWORD *)(a1 + 80);
      v17 = *(_QWORD *)(a1 + 88);
      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_2;
      v68[3] = &unk_1E851FEC8;
      v69 = *(id *)(a1 + 96);
      v19 = v15;
      v8 = v58;
      objc_msgSend(v19, "requestFlexMusicCurationForEnrichedMemories:context:photoLibrary:graph:progressReporter:resultHandler:", v58, v14, v18, v3, v17, v68);
      if ((objc_msgSend(*(id *)(a1 + 64), "isCancelled") & 1) != 0)
        goto LABEL_13;
      if (v14)
      {
        v20 = (void *)MEMORY[0x1E0D75CF0];
        v66[0] = v16;
        v66[1] = 3221225472;
        v66[2] = __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_167;
        v66[3] = &unk_1E851FEF0;
        v21 = *(_QWORD *)(a1 + 104);
        v67 = *(id *)(a1 + 96);
        objc_msgSend(v20, "requestMusicCurationForEnrichedMemories:context:graph:progressReporter:resultHandler:", v58, v14, v3, v21, v66);

      }
      else
      {
        v22 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v53 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v73 = v53;
          _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to build music curation context with error: %@", buf, 0xCu);
        }
      }
      v8 = v58;
      if ((objc_msgSend(*(id *)(a1 + 64), "isCancelled") & 1) != 0)
      {
LABEL_13:
        (*(void (**)(void))(*(_QWORD *)(a1 + 128) + 16))();

        v6 = v56;
        goto LABEL_49;
      }
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760E0]), "initWithPhotoLibrary:", *(_QWORD *)(a1 + 80));
      if (*(_BYTE *)(*(_QWORD *)(a1 + 72) + 8))
      {
        v24 = 0;
      }
      else if (objc_msgSend(MEMORY[0x1E0D76298], "isMemoriesLivingOnFeedbackEnabled"))
      {
        v25 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask] Forcing memories to be non pending since user default isMemoriesLivingOnFeedbackEnabled is enabled", buf, 2u);
        }
        v24 = 0;
        v8 = v58;
      }
      else
      {
        v24 = 1;
      }
      v26 = *(_QWORD *)(a1 + 112);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 136) + 8);
      obj = *(id *)(v27 + 40);
      objc_msgSend(v23, "memoryLocalIdentifiersFromPersistingEnrichedMemories:withPendingState:graph:progressReporter:error:", v8, v24, v7, v26, &obj);
      v28 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v27 + 40), obj);
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 144) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8)
                                                                              + 40) != 0;
      *(_BYTE *)(*(_QWORD *)(a1 + 72) + 11) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
      {
        v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76118]), "initWithInflationActionSource:", 0);
        v32 = *(void **)(a1 + 32);
        v64 = 0;
        objc_msgSend(v32, "musicCurationInflationContextWithInflationOptions:error:", v31, &v64);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v64;
        if (v33)
        {
          v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D760E0]), "initWithPhotoLibrary:", *(_QWORD *)(a1 + 80));
          objc_msgSend(v35, "cacheMusicAudioAndArtworkForEnrichedMemories:inflationContext:photoLibrary:", v58, v33, *(_QWORD *)(a1 + 80));

        }
        else
        {
          v36 = *(NSObject **)(a1 + 96);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v73 = v34;
            _os_log_error_impl(&dword_1CAC16000, v36, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] Failed to generate inflationContextError, error: %{public}@", buf, 0xCu);
          }
        }

      }
      v6 = v56;
      v8 = v58;
    }
    v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24))
      v38 = v10 == 0;
    else
      v38 = 1;
    if (!v38)
    {
      v55 = v7;
      v57 = v6;
      v39 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "count");
      if (!*(_BYTE *)(*(_QWORD *)(a1 + 72) + 9) && v39 != objc_msgSend(v8, "count"))
      {
        v40 = *(NSObject **)(a1 + 96);
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] persistedMemoryLocalIdentifiers.count is expected to be equal to electedEnrichedMemories.count when _createTransientMemories == NO", buf, 2u);
        }
      }
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v59 = v8;
      v41 = v8;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      if (v42)
      {
        v43 = v42;
        v44 = 0;
        v45 = *(_QWORD *)v61;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v61 != v45)
              objc_enumerationMutation(v41);
            objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "enrichedDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v44 + i < v39)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 144) + 8) + 40), "objectAtIndexedSubscript:", v44 + i);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v48, v47);
              v49 = objc_claimAutoreleasedReturnValue();

              v47 = (void *)v49;
            }
            objc_msgSend(*(id *)(a1 + 120), "addObject:", v47);

          }
          v44 += i;
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        }
        while (v43);
      }

      v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 152) + 8) + 24);
      v7 = v55;
      v6 = v57;
      v8 = v59;
    }
    if (v37 && *(_BYTE *)(a1 + 160))
    {
      v50 = *(void **)(a1 + 72);
      v51 = *(_QWORD *)(a1 + 96);
      objc_msgSend(*(id *)(a1 + 32), "analytics");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "collectMetricsOnElectedEnrichedMemories:loggingConnection:analytics:", v8, v51, v52);

    }
  }
LABEL_49:

}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v7, "setFlexMusicCuration:", v8);
  }
  else
  {
    v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to curate flex music for enriched memory with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_reply___block_invoke_167(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v7, "setMusicCuration:", v8);
  }
  else
  {
    v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v9;
      _os_log_error_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask] (MemoriesMusic) Failed to curate apple music for enriched memory with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __68__PHAMemoryElectionTask_runWithGraphManager_progressReporter_error___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2 != 0;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

+ (BOOL)reloadForYouWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10110]), "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+ForYouWidgetTimeline] Calling reloadTimeline on CHSTimelineController", (uint8_t *)&v9, 2u);
  }
  objc_msgSend(v6, "reloadTimelineWithReason:", CFSTR("WidgetAssetChanged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+ForYouWidgetTimeline] CHSTimelineController reloadTimeline error: %@", (uint8_t *)&v9, 0xCu);
      if (!a4)
        goto LABEL_9;
      goto LABEL_6;
    }
    if (a4)
LABEL_6:
      *a4 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+ForYouWidgetTimeline] CHSTimelineController reloadTimeline completed", (uint8_t *)&v9, 2u);
  }
LABEL_9:

  return v7 == 0;
}

+ (BOOL)reloadAlbumWidgetTimelineWithLoggingConnection:(id)a3 error:(id *)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10110]), "initWithExtensionBundleIdentifier:kind:", CFSTR("com.apple.mobileslideshow.PhotosReliveWidget"), CFSTR("com.apple.mobileslideshow.PhotosReliveWidget.collections"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+AlbumWidgetTimeline] Calling reloadTimeline on CHSTimelineController", (uint8_t *)&v9, 2u);
  }
  objc_msgSend(v6, "reloadTimelineWithReason:", CFSTR("WidgetAssetChanged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v7;
      _os_log_error_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+AlbumWidgetTimeline] CHSTimelineController reloadTimeline error: %@", (uint8_t *)&v9, 0xCu);
      if (!a4)
        goto LABEL_9;
      goto LABEL_6;
    }
    if (a4)
LABEL_6:
      *a4 = objc_retainAutorelease(v7);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1CAC16000, v5, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+AlbumWidgetTimeline] CHSTimelineController reloadTimeline completed", (uint8_t *)&v9, 2u);
  }
LABEL_9:

  return v7 == 0;
}

+ (void)findAndSetFeaturedStateForMemoriesAndSuggestionsIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  NSObject *v6;
  id v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint32_t denom;
  uint32_t numer;
  NSObject *v15;
  NSObject *v16;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = os_signpost_id_generate(v6);
  info = 0;
  mach_timebase_info(&info);
  v9 = v6;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FindAndSetFeaturedStateForMemoriesAndSuggestions", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  objc_msgSend(a1, "findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary:loggingConnection:", v7, v10);
  objc_msgSend(a1, "findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary:loggingConnection:", v7, v10);
  objc_msgSend(a1, "findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary:loggingConnection:", v7, v10);

  v12 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v15 = v10;
  v16 = v15;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v16, OS_SIGNPOST_INTERVAL_END, v8, "FindAndSetFeaturedStateForMemoriesAndSuggestions", ", buf, 2u);
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "FindAndSetFeaturedStateForMemoriesAndSuggestions";
    v20 = 2048;
    v21 = (float)((float)((float)((float)(v12 - v11) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

+ (void)findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  char v24;
  char *v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint32_t v32;
  uint32_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  uint32_t v37;
  uint32_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  os_signpost_id_t spid;
  void *v43;
  uint64_t v44;
  id v45;
  _QWORD v46[4];
  id v47;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  double v52;
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "FindMemoriesAndSetNeverFeatureState", ", buf, 2u);
  }

  v44 = mach_absolute_time();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFetchLimit:", 13);
  objc_msgSend(v12, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected == NO AND userCreated == NO AND featuredState != %d"), -1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSortDescriptors:", v16);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchedObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    spid = v8;
    objc_msgSend(a1, "_filterMemoriesWithAcceptableUserFeedback:allMemoriesFetchResult:photoLibrary:", v18, v17, v6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v20;
    objc_msgSend(v21, "minusSet:", v20);
    if (objc_msgSend(v21, "count"))
    {
      v41 = v19;
      v22 = v10;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v21, "count");
        *(_DWORD *)buf = 134217984;
        v50 = (const char *)v23;
        _os_log_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - add: %zd", buf, 0xCu);
      }

      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __117__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
      v46[3] = &unk_1E8521740;
      v47 = v21;
      v45 = 0;
      v24 = objc_msgSend(v6, "performChangesAndWait:error:", v46, &v45);
      v25 = (char *)v45;
      if ((v24 & 1) == 0 && os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v50 = v25;
        _os_log_error_impl(&dword_1CAC16000, v22, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - failed: %@", buf, 0xCu);
      }
      v26 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v29 = v22;
      v30 = v29;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v30, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetNeverFeatureState", ", buf, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "FindMemoriesAndSetNeverFeatureState";
        v51 = 2048;
        v52 = (float)((float)((float)((float)(v26 - v44) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }

      v19 = v41;
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update never feature memories - up to date", buf, 2u);
      }
      v36 = mach_absolute_time();
      v38 = info.numer;
      v37 = info.denom;
      v39 = v10;
      v40 = v39;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v40, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetNeverFeatureState", ", buf, 2u);
      }

      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v50 = "FindMemoriesAndSetNeverFeatureState";
        v51 = 2048;
        v52 = (float)((float)((float)((float)(v36 - v44) * (float)v38) / (float)v37) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
    }

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update never featured memories - found 0 memories", buf, 2u);
    }
    v31 = mach_absolute_time();
    v33 = info.numer;
    v32 = info.denom;
    v34 = v10;
    v35 = v34;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v35, OS_SIGNPOST_INTERVAL_END, v8, "FindMemoriesAndSetNeverFeatureState", ", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "FindMemoriesAndSetNeverFeatureState";
      v51 = 2048;
      v52 = (float)((float)((float)((float)(v31 - v44) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

+ (void)findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  id v35;
  double v36;
  uint64_t v37;
  uint32_t v38;
  uint32_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  double v46;
  unint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint32_t denom;
  uint32_t numer;
  NSObject *v53;
  NSObject *v54;
  NSObject *oslog;
  os_signpost_id_t spid;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  mach_timebase_info info;
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  double v80;
  _QWORD v81[4];

  v81[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_signpost_id_generate(v6);
  info = 0;
  mach_timebase_info(&info);
  v8 = v6;
  v9 = v8;
  v64 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FindMemoriesAndSetFeaturedState", ", buf, 2u);
  }
  spid = v7;

  v62 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "dateByAddingTimeInterval:", -60.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(v14, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(creationDate > %@ OR featuredState == %d) AND userCreated == NO AND featuredState != %d"), v13, 1, -1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v17);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v57 = v14;
    v58 = v13;
    objc_msgSend(v18, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "creationDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startOfDayForDate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v12;
    v24 = v22;
    v59 = v23;
    v60 = v10;
    if (objc_msgSend(v22, "compare:") == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v25 = v18;
      v26 = objc_claimAutoreleasedReturnValue();

      v20 = 0;
      v24 = (void *)v26;
      v18 = v25;
    }
    oslog = v9;
    v61 = v5;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v27 = v18;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (!v28)
    {
      v30 = 0;
      goto LABEL_35;
    }
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v72;
    while (1)
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v72 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        if (objc_msgSend(v33, "featuredState") == 1)
          ++v30;
        objc_msgSend(v33, "creationDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "compare:", v24) == -1
          && (!v20 || (objc_msgSend(v20, "timeIntervalSinceDate:", v34), v36 >= 2.0))
          || (objc_msgSend(v33, "photosGraphVersion"),
              PLMemoriesAlgorithmsVersionFromPhotosGraphVersion() < 0x301))
        {
          if (objc_msgSend(v33, "featuredState") != 1)
            goto LABEL_24;
          objc_msgSend(v21, "addObject:", v33);
          v35 = 0;
        }
        else
        {
          if (!objc_msgSend(v33, "featuredState"))
            objc_msgSend(v66, "addObject:", v33);
          v35 = v34;
        }

        v20 = v35;
LABEL_24:

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      if (!v29)
      {
LABEL_35:

        v5 = v61;
        objc_msgSend(a1, "_filterMemoriesWithAcceptableUserFeedback:allMemoriesFetchResult:photoLibrary:", v66, v27, v61);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = objc_msgSend(v42, "count");
        v44 = objc_msgSend(v21, "count");
        v45 = v44 <= 0 && v43 <= 0;
        if (v45 || (v46 = *(double *)&v44, v43 + v30 - v44 < 1))
        {
          v9 = oslog;
          v47 = v64;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - up to date", buf, 2u);
          }
        }
        else
        {
          v9 = oslog;
          v47 = v64;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            v78 = (const char *)v43;
            v79 = 2048;
            v80 = v46;
            _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - add: %zd, remove: %zd", buf, 0x16u);
          }
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v42;
            _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Memories to add featured state: %@", buf, 0xCu);
          }
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v78 = (const char *)v21;
            _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Memories to remove featured state: %@", buf, 0xCu);
          }
          v68[0] = MEMORY[0x1E0C809B0];
          v68[1] = 3221225472;
          v68[2] = __113__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
          v68[3] = &unk_1E85211E0;
          v69 = v42;
          v70 = v21;
          v67 = 0;
          v48 = objc_msgSend(v61, "performChangesAndWait:error:", v68, &v67);
          v49 = (char *)v67;
          if ((v48 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v49;
            _os_log_error_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - failed: %@", buf, 0xCu);
          }

        }
        v50 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v53 = v9;
        v54 = v53;
        if (v47 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CAC16000, v54, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetFeaturedState", ", buf, 2u);
        }

        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v78 = "FindMemoriesAndSetFeaturedState";
          v79 = 2048;
          v80 = (float)((float)((float)((float)(v50 - v62) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CAC16000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }

        v12 = v59;
        v10 = v60;
        v14 = v57;
        v13 = v58;
        goto LABEL_58;
      }
    }
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured memories - found 0 memories", buf, 2u);
  }
  v37 = mach_absolute_time();
  v39 = info.numer;
  v38 = info.denom;
  v40 = v9;
  v41 = v40;
  if (v64 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v41, OS_SIGNPOST_INTERVAL_END, spid, "FindMemoriesAndSetFeaturedState", ", buf, 2u);
  }

  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v78 = "FindMemoriesAndSetFeaturedState";
    v79 = 2048;
    v80 = (float)((float)((float)((float)(v37 - v62) * (float)v39) / (float)v38) / 1000000.0);
    _os_log_impl(&dword_1CAC16000, v41, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
LABEL_58:

}

+ (id)_filterMemoriesWithAcceptableUserFeedback:(id)a3 allMemoriesFetchResult:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id obj;
  void *v55;
  __int128 v56;
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
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v8, "count"))
  {
    v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v50 = v8;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v65 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
          if (objc_msgSend(v17, "isUserCreated"))
          {
            objc_msgSend(v11, "addObject:", v17);
          }
          else
          {
            objc_msgSend(v17, "objectID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v18);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v14);
    }
    v52 = v11;

    v49 = v9;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD1580]), "initWithExistingFetchResult:filteredObjectIDs:", v9, v53);
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setIncludedDetectionTypes:", &unk_1E8540CE0);
    v51 = v20;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetByMemoryUUIDForMemories:options:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v23 = v21;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v61 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(v23, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      }
      while (v25);
    }

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v22, v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v10;
    objc_msgSend(a1, "_userFeedbackCalculatorWithPhotoLibrary:", v10);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v19;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v57;
      v34 = *MEMORY[0x1E0CD1E58];
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v57 != v33)
            objc_enumerationMutation(obj);
          v36 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * k);
          objc_msgSend(v36, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          if (v39)
          {
            objc_msgSend(v55, "objectForKeyedSubscript:", v39);
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = (void *)v40;
            v42 = (void *)MEMORY[0x1E0C9AA60];
            if (v40)
              v42 = (void *)v40;
            v43 = v42;

            objc_msgSend(v36, "blockableFeatures");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v39, v43, v44);
            v46 = v45;

            if (objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v46, v34))
              objc_msgSend(v52, "addObject:", v36);
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
      }
      while (v32);
    }

    v9 = v49;
    v8 = v50;
    v11 = v52;
    v10 = v48;
  }

  return v11;
}

+ (void)findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary:(id)a3 loggingConnection:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  double v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  uint32_t v44;
  uint32_t v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  double v54;
  unint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  uint32_t numer;
  uint32_t denom;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  NSObject *oslog;
  os_signpost_id_t spid;
  void *v66;
  uint64_t v67;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  mach_timebase_info info;
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  double v91;
  _QWORD v92[3];
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = os_signpost_id_generate(v6);
  info = 0;
  mach_timebase_info(&info);
  v8 = v6;
  v9 = v8;
  v69 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "FindSuggestionsAndSetFeaturedState", ", buf, 2u);
  }
  spid = v7;

  v67 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = v12;
  objc_msgSend(v12, "dateByAddingTimeInterval:", -60.0);
  v13 = objc_claimAutoreleasedReturnValue();
  v75 = v5;
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSortDescriptors:", v16);

  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWidget");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(state == %d || state == %d)"), 1, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v70 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate > %@ OR featuredState == %d"), v13, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3528];
  v72 = (void *)v18;
  v73 = (void *)v17;
  v92[0] = v17;
  v92[1] = v18;
  v92[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "andPredicateWithSubpredicates:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v22);

  v74 = v14;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v23;
  if (objc_msgSend(v23, "count"))
  {
    v24 = v9;
    objc_msgSend(v23, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "creationDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startOfDayForDate:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v10;
    if (objc_msgSend(v28, "compare:", v12) == -1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v29 = objc_claimAutoreleasedReturnValue();

      v26 = 0;
      v28 = (void *)v29;
    }
    v63 = v19;
    oslog = v24;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v30 = v23;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    if (v31)
    {
      v32 = v31;
      v33 = 0;
      v34 = *(_QWORD *)v83;
      while (1)
      {
        v35 = 0;
        do
        {
          if (*(_QWORD *)v83 != v34)
            objc_enumerationMutation(v30);
          v36 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v35);
          if (objc_msgSend(v36, "featuredState") == 1)
            ++v33;
          objc_msgSend(v36, "creationDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "compare:", v28) != -1
            || v26 && (objc_msgSend(v26, "timeIntervalSinceDate:", v37), v39 < 2.0))
          {
            if (!objc_msgSend(v36, "featuredState"))
              objc_msgSend(v27, "addObject:", v36);
            v38 = v37;
            goto LABEL_18;
          }
          if (objc_msgSend(v36, "featuredState") == 1)
          {
            objc_msgSend(v77, "addObject:", v36);
            v38 = 0;
LABEL_18:

            v26 = v38;
          }

          ++v35;
        }
        while (v32 != v35);
        v40 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
        v32 = v40;
        if (!v40)
          goto LABEL_35;
      }
    }
    v33 = 0;
LABEL_35:

    v49 = v75;
    objc_msgSend(a1, "_filterSuggestionsToFeatureBasedOnUserFeedbackForSuggestionsToFeature:sugestionsFetchResult:photoLibrary:", v27, v30, v75);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v51 = objc_msgSend(v50, "count");
    v52 = objc_msgSend(v77, "count");
    v53 = v52 <= 0 && v51 <= 0;
    if (v53 || (v54 = *(double *)&v52, v51 + v33 - v52 < 1))
    {
      v42 = oslog;
      v55 = v69;
      v48 = v70;
      v19 = v63;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - up to date", buf, 2u);
      }
    }
    else
    {
      v42 = oslog;
      v48 = v70;
      v19 = v63;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v89 = (const char *)v51;
        v90 = 2048;
        v91 = v54;
        _os_log_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - add: %zd, remove: %zd", buf, 0x16u);
      }
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v89 = (const char *)v50;
        _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Suggestions to add featured state: %@", buf, 0xCu);
      }
      v55 = v69;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v89 = (const char *)v77;
        _os_log_debug_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_DEBUG, "[PHAMemoryElectionTask+WidgetTimeline] Suggestions to remove featured state: %@", buf, 0xCu);
      }
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __116__PHAMemoryElectionTask_WidgetTimeline__findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke;
      v79[3] = &unk_1E85211E0;
      v80 = v50;
      v81 = v77;
      v78 = 0;
      v56 = objc_msgSend(v75, "performChangesAndWait:error:", v79, &v78);
      v57 = (char *)v78;
      if ((v56 & 1) == 0 && os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v89 = v57;
        _os_log_error_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - failed: %@", buf, 0xCu);
      }

    }
    v58 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v61 = v42;
    v62 = v61;
    if (v55 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v62, OS_SIGNPOST_INTERVAL_END, spid, "FindSuggestionsAndSetFeaturedState", ", buf, 2u);
    }

    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "FindSuggestionsAndSetFeaturedState";
      v90 = 2048;
      v91 = (float)((float)((float)((float)(v58 - v67) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v62, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v10 = v66;
    v41 = v76;
  }
  else
  {
    v41 = v12;
    v42 = v9;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_INFO, "[PHAMemoryElectionTask+WidgetTimeline] Update featured suggestions - found 0 suggestions", buf, 2u);
    }
    v43 = mach_absolute_time();
    v44 = info.numer;
    v45 = info.denom;
    v46 = v9;
    v47 = v46;
    v48 = v70;
    v49 = v75;
    if (v69 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CAC16000, v47, OS_SIGNPOST_INTERVAL_END, spid, "FindSuggestionsAndSetFeaturedState", ", buf, 2u);
    }

    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v89 = "FindSuggestionsAndSetFeaturedState";
      v90 = 2048;
      v91 = (float)((float)((float)((float)(v43 - v67) * (float)v44) / (float)v45) / 1000000.0);
      _os_log_impl(&dword_1CAC16000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

+ (id)_filterSuggestionsToFeatureBasedOnUserFeedbackForSuggestionsToFeature:(id)a3 sugestionsFetchResult:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  double v41;
  double v42;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v8, "count"))
  {
    v11 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v9;
    objc_msgSend(v11, "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v9, v12);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v47 = v8;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v56 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v19, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            objc_msgSend(v21, "uuid");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v23);

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v16);
    }

    objc_msgSend(v10, "librarySpecificFetchOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setIncludedDetectionTypes:", &unk_1E8540CF8);
    v25 = (void *)MEMORY[0x1E0CD16C0];
    objc_msgSend(v13, "allValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v24;
    objc_msgSend(v25, "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v26, v24);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v10;
    objc_msgSend(a1, "_userFeedbackCalculatorWithPhotoLibrary:", v10);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v28 = v14;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v52;
      v32 = *MEMORY[0x1E0CD1E58];
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v52 != v31)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
          objc_msgSend(v34, "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v36)
          {
            objc_msgSend(v49, "objectForKeyedSubscript:", v36);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v37;
            v39 = (void *)MEMORY[0x1E0C9AA60];
            if (v37)
              v39 = (void *)v37;
            v40 = v39;

            objc_msgSend(v27, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v36, v40, 0);
            v42 = v41;

            if (objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v42, v32))
              objc_msgSend(v48, "addObject:", v34);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v30);
    }

    v9 = v46;
    v8 = v47;
    v10 = v45;
  }

  return v48;
}

+ (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CD17F8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithPhotoLibrary:", v4);

  return v5;
}

void __116__PHAMemoryElectionTask_WidgetTimeline__findSuggestionsAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFeaturedState:", 1);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFeaturedState:", 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

void __113__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetFeaturedStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFeaturedState:", 1);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setFeaturedState:", 0);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

void __117__PHAMemoryElectionTask_WidgetTimeline__findMemoriesAndSetNeverFeatureStateIfNeededInPhotoLibrary_loggingConnection___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setFeaturedState:", -1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)collectMetricsOnExistingMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __CFString **v18;
  uint64_t v19;
  char v20;
  __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  PHAMemoryElectionTask *v74;
  id v75;
  id obj;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  __CFString *v85;
  unsigned int v86;
  void *v87;
  void *context;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  NSObject *oslog;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t v107[128];
  uint8_t buf[4];
  uint64_t v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v74 = self;
  v112 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  oslog = a4;
  v75 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v94 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PHAMetricsHelper memoryCategoryValueToDataAggregationKeyLookup](PHAMetricsHelper, "memoryCategoryValueToDataAggregationKeyLookup");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAMetricsHelper memoryBlockableFeatureTypeValueToDataAggregationKeyLookup](PHAMetricsHelper, "memoryBlockableFeatureTypeValueToDataAggregationKeyLookup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHAMetricsHelper memoryBlockedFeatureTypeValueToDataAggregationKeyLookup](PHAMetricsHelper, "memoryBlockedFeatureTypeValueToDataAggregationKeyLookup");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v7;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
  v11 = 0;
  if (v81)
  {
    v78 = *(_QWORD *)v104;
    v79 = v10;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v104 != v78)
          objc_enumerationMutation(obj);
        v89 = v12;
        v13 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * v12);
        context = (void *)MEMORY[0x1D1798448]();
        v86 = objc_msgSend(v13, "isFavorite");
        objc_msgSend(v13, "photosGraphProperties");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("triggerTypes"));
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        v16 = (void *)MEMORY[0x1E0C9AA60];
        if (v14)
          v16 = (void *)v14;
        v17 = v16;

        if ((unint64_t)objc_msgSend(v17, "count") > 1
          || (v19 = objc_msgSend(v17, "count"), v18 = PHAMetrics_MemoriesFeed_RandomMemoriesCount, v19 == 1)
          && (v20 = objc_msgSend(v17, "containsObject:", &unk_1E85409E8),
              v18 = PHAMetrics_MemoriesFeed_RandomMemoriesCount,
              (v20 & 1) == 0))
        {
          v18 = PHAMetrics_MemoriesFeed_TriggeredMemoriesCount;
        }
        v21 = *v18;
        objc_msgSend(v8, "objectForKey:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = v22;
        if (v22)
          v23 = objc_msgSend(v22, "unsignedIntegerValue") + 1;
        else
          v23 = 1;
        v87 = v17;
        v90 = v11;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v23, v74);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v21;
        objc_msgSend(v8, "setValue:forKey:", v24, v21);

        +[PHAMetricsHelper dataAggregationKeyForCategory:subCategory:lookupTable:](PHAMetricsHelper, "dataAggregationKeyForCategory:subCategory:lookupTable:", objc_msgSend(v13, "category"), 0, v80);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v8, "objectForKey:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
            v28 = objc_msgSend(v26, "unsignedIntegerValue") + 1;
          else
            v28 = 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setValue:forKey:", v29, v25);

        }
        v82 = v13;
        v83 = (void *)v25;
        v30 = v8;
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        objc_msgSend(v13, "blockableFeatures");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v100;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v100 != v34)
                objc_enumerationMutation(v31);
              v36 = objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "type");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (v38)
              {
                objc_msgSend(v30, "objectForKey:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = v39;
                if (v39)
                  v41 = objc_msgSend(v39, "unsignedIntegerValue") + 1;
                else
                  v41 = 1;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "setValue:forKey:", v42, v38);

              }
              else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v109 = v36;
                _os_log_error_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryGenerationTask] Not logging aggregate stats for existing memory blockable feature type %lu", buf, 0xCu);
              }

            }
            v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
          }
          while (v33);
        }

        objc_msgSend(v82, "blacklistedFeature");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        v8 = v30;
        v10 = v79;
        if (v43)
        {
          v45 = objc_msgSend(v43, "type");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v8, "objectForKey:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v48;
            if (v48)
              v50 = objc_msgSend(v48, "unsignedIntegerValue") + 1;
            else
              v50 = 1;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v94, "setValue:forKey:", v51, v47);

          }
          else if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            v109 = v45;
            _os_log_error_impl(&dword_1CAC16000, oslog, OS_LOG_TYPE_ERROR, "[PHAMemoryGenerationTask] Not logging aggregate stats for existing memory blocked feature type %lu", buf, 0xCu);
          }

        }
        objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("moodKeywords"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v52, "count"))
        {
          v97 = 0u;
          v98 = 0u;
          v95 = 0u;
          v96 = 0u;
          v53 = v52;
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
          if (v54)
          {
            v55 = v54;
            v56 = *(_QWORD *)v96;
            do
            {
              for (j = 0; j != v55; ++j)
              {
                if (*(_QWORD *)v96 != v56)
                  objc_enumerationMutation(v53);
                objc_msgSend(v79, "addObject:", *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j));
              }
              v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
            }
            while (v55);
          }

        }
        else
        {
          objc_msgSend(v79, "addObject:", CFSTR("None"));
        }
        v11 = v90 + v86;

        objc_autoreleasePoolPop(context);
        v12 = v89 + 1;
      }
      while (v89 + 1 != v81);
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v111, 16);
    }
    while (v81);
  }

  objc_msgSend(obj, "lastObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v91 = v11;
    v59 = v8;
    v60 = objc_alloc(MEMORY[0x1E0C99D48]);
    v61 = (void *)objc_msgSend(v60, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    v62 = v58;
    objc_msgSend(v58, "creationDate");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "startOfDayForDate:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[PHAMemoryElectionTask universalDate](v74, "universalDate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "startOfDayForDate:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v61, "components:fromDate:toDate:options:", 16, v64, v66, 0);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(v67, "day");
    if (v68 >= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setValue:forKey:", v69, CFSTR("numberOfDaysSinceLastMemoryWasCreated"));

    }
    v8 = v59;
    v11 = v91;
    v58 = v62;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(obj, "count", v74));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v70, CFSTR("totalMemoriesCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v71, CFSTR("totalFavoritedMemoriesCount"));

  v72 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PHAMetricsHelper aggregatedStatsForMoodKeywordCountedSet:](PHAMetricsHelper, "aggregatedStatsForMoodKeywordCountedSet:", v10);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addEntriesFromDictionary:", v73);

  objc_msgSend(v75, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.feed"), v8);
  objc_msgSend(v75, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.mood"), v72);
  objc_msgSend(v75, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.blacklist"), v94);

}

- (void)collectMetricsOnMemoriesInGraphWithWorkingContext:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0CB3550];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke;
  v13[3] = &unk_1E8520F70;
  v14 = v11;
  v12 = v11;
  objc_msgSend(v10, "performSynchronousConcurrentGraphReadUsingBlock:", v13);

  objc_msgSend((id)objc_opt_class(), "sendGeneratedMemoriesPipelineAnalyticsEventWithCountsOfMemories:loggingConnection:analytics:", v12, v9, v8);
}

- (void)collectMetricsOnElectedEnrichedMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v34 = a4;
  v33 = a5;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v31 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v44 != v14)
          objc_enumerationMutation(v10);
        v13 += objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "featuresGuestAssets");
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("numberOfMemoriesWithGuestAsset"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v17, CFSTR("newMemoriesCount"));

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v18 = v10;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v40 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        v24 = objc_msgSend(v23, "memoryCategorySubcategory");
        v25 = (void *)MEMORY[0x1E0D75FB8];
        objc_msgSend(v23, "memoryFeatureNodes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "fullMemoryTypeStringWithMemoryCategorySubcategory:featureNodes:", v24, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "addObject:", v27);
        objc_msgSend(v23, "triggerTypes");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "count");

        if (v29)
        {
          objc_msgSend(v31, "addObject:", v27);
          objc_msgSend(v23, "triggerTypes");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __102__PHAMemoryElectionTask_Metrics__collectMetricsOnElectedEnrichedMemories_loggingConnection_analytics___block_invoke;
          v35[3] = &unk_1E8520FA8;
          v35[4] = self;
          v36 = v27;
          v37 = v34;
          v38 = v33;
          objc_msgSend(v30, "enumerateIndexesUsingBlock:", v35);

        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v20);
  }

  objc_msgSend(v33, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.generation"), v8);
  objc_msgSend((id)objc_opt_class(), "sendElectedMemoriesPipelineAnalyticsEventWithCountsOfMemories:loggingConnection:analytics:", v9, v34, v33);
  objc_msgSend((id)objc_opt_class(), "sendTriggeredMemoriesPipelineAnalyticsEventWithCountsOfMemories:loggingConnection:analytics:", v31, v34, v33);

}

void __102__PHAMemoryElectionTask_Metrics__collectMetricsOnElectedEnrichedMemories_loggingConnection_analytics___block_invoke(_QWORD *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD1630], "stringForTriggerType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sendMemoryTriggersAnalyticsEventWithElectedMemoryType:triggerType:loggingConnection:analytics:", a1[5], v3, a1[6], a1[7]);

}

void __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D75FC0], "nodesInGraph:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke_2;
  v6[3] = &unk_1E8520F48;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "enumerateMemoryCategorySubcategoriesUsingBlock:", v6);

}

void __112__PHAMemoryElectionTask_Metrics__collectMetricsOnMemoriesInGraphWithWorkingContext_loggingConnection_analytics___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = objc_alloc(MEMORY[0x1E0D75FC0]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
  v12 = (id)objc_msgSend(v6, "initWithGraph:elementIdentifiers:", v7, v8);

  v9 = (void *)MEMORY[0x1E0D75FB8];
  objc_msgSend(v12, "featureNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fullMemoryTypeStringWithMemoryCategorySubcategory:featureNodes:", a3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
}

+ (void)sendGeneratedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[3];
  _QWORD v32[3];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v6 = a5;
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D75FB8], "allMemoryTypeStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  objc_msgSend(v9, "pha_shuffle");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v9;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v24)
  {
    v10 = CFSTR("fullMemoryType");
    v11 = CFSTR("memoryCount");
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v26 != v22)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        v14 = objc_msgSend(v23, "countForObject:", v13);
        if (v14)
        {
          v31[0] = CFSTR("pipelineStage");
          v31[1] = v10;
          v32[0] = CFSTR("generated");
          v32[1] = v13;
          v31[2] = v11;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v15 = v11;
          v16 = v10;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v32[2] = v17;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v16;
          v11 = v15;
          objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.pipeline"), v18);

        }
        v29[1] = v11;
        v30[0] = v13;
        v29[0] = v10;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v30[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.generationByType"), v20);
      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v24);
  }

}

+ (void)sendElectedMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = a4;
  v8 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D1798448]();
        v23[0] = CFSTR("pipelineStage");
        v23[1] = CFSTR("fullMemoryType");
        v24[0] = CFSTR("elected");
        v24[1] = v14;
        v23[2] = CFSTR("memoryCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "countForObject:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.pipeline"), v17);
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

}

+ (void)sendTriggeredMemoriesPipelineAnalyticsEventWithCountsOfMemories:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  _QWORD v24[3];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = a4;
  v8 = a5;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1D1798448]();
        v23[0] = CFSTR("pipelineStage");
        v23[1] = CFSTR("fullMemoryType");
        v24[0] = CFSTR("triggered");
        v24[1] = v14;
        v23[2] = CFSTR("memoryCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v9, "countForObject:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v24[2] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.pipeline"), v17);
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v11);
  }

}

+ (void)sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:(id)a3 loggingConnection:(id)a4 analytics:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("pipelineStage");
  v10[1] = CFSTR("fullMemoryType");
  v11[0] = CFSTR("notified");
  v11[1] = a3;
  v10[2] = CFSTR("memoryCount");
  v11[2] = &unk_1E8540A00;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a5;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.pipeline"), v9);
}

+ (void)sendMemoryTriggersAnalyticsEventWithElectedMemoryType:(id)a3 triggerType:(id)a4 loggingConnection:(id)a5 analytics:(id)a6
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("triggerType");
  v13[1] = CFSTR("triggerCount");
  v14[0] = a4;
  v14[1] = &unk_1E8540A00;
  v13[2] = CFSTR("fullMemoryType");
  v13[3] = CFSTR("memoryElected");
  v14[2] = a3;
  v14[3] = &unk_1E8540A00;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a6;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.triggers"), v12);
}

@end
