@implementation PHANotificationController

- (PHANotificationController)initWithGraphManager:(id)a3 userFeedbackCalculator:(id)a4
{
  id v7;
  PHANotificationController *v8;
  PHANotificationController *v9;

  v7 = a4;
  v8 = -[PHANotificationController initWithGraphManager:](self, "initWithGraphManager:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_userFeedbackCalculator, a4);

  return v9;
}

- (PHANotificationController)initWithGraphManager:(id)a3
{
  id v5;
  PHANotificationController *v6;
  PHANotificationController *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  uint64_t v10;
  CPAnalytics *analytics;
  os_log_t v12;
  OS_os_log *loggingConnection;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHANotificationController;
  v6 = -[PHANotificationController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    objc_msgSend(v5, "analytics");
    v10 = objc_claimAutoreleasedReturnValue();
    analytics = v7->_analytics;
    v7->_analytics = (CPAnalytics *)v10;

    v12 = os_log_create("com.apple.photoanalysisd", "notifications");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v12;

  }
  return v7;
}

- (BOOL)userIsActivelyUsingPhotos
{
  return +[PHANotificationCoreDuetHelper userIsActivelyUsingAppWithName:error:](PHANotificationCoreDuetHelper, "userIsActivelyUsingAppWithName:error:", CFSTR("com.apple.mobileslideshow"), 0)|| +[PHANotificationCoreDuetHelper userIsActivelyUsingAppWithName:error:](PHANotificationCoreDuetHelper, "userIsActivelyUsingAppWithName:error:", CFSTR("com.apple.camera"), 0);
}

- (id)bestDateForDeliveringNotification
{
  return (id)objc_msgSend(MEMORY[0x1E0D71908], "_notificationDeliveryDate");
}

- (BOOL)shouldFireNotificationForMemoriesWithScores:(id)a3 withCreationReason:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t i;
  double v25;
  void *v26;
  int v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "count"))
  {
    if (__PXLoggraph_workerOnceToken != -1)
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_7094);
    v15 = __PXLoggraph_workerOSLog;
    if (!os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v16 = "[Memories Notification] Not firing: No memories";
    goto LABEL_18;
  }
  if (a4 == 1 && objc_msgSend(MEMORY[0x1E0D76298], "isMemoriesLivingOnFeedbackEnabled"))
  {
    if (__PXLoggraph_workerOnceToken != -1)
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_169);
    v7 = __PXLoggraph_workerOSLog;
    v8 = 1;
    if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v9 = "[Memories Notification] Forcing notification trigger because of memories living on feedback is enabled.";
      v10 = v7;
      v11 = 2;
LABEL_13:
      _os_log_impl(&dword_1CAC16000, v10, OS_LOG_TYPE_INFO, v9, buf, v11);
      goto LABEL_52;
    }
    goto LABEL_52;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("PhotoAnalysisShouldForceTriggerNotification"));

  if (!v13)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = v6;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v38;
      v22 = *MEMORY[0x1E0CD1D08];
      v23 = *MEMORY[0x1E0CD1CF8];
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "doubleValue", (_QWORD)v37);
          if (v25 > v22)
          {

            goto LABEL_43;
          }
          v20 |= v25 > v23;
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v19)
          continue;
        break;
      }
    }
    else
    {
      v20 = 0;
    }

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("PhotoAnalysisShouldTriggerNotificationEveryDay"));

    if (v27)
    {
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_174);
      v28 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = CFSTR("PhotoAnalysisShouldTriggerNotificationEveryDay");
        _os_log_impl(&dword_1CAC16000, v28, OS_LOG_TYPE_INFO, "[Memories Notification] Not checking time interval because of user defaults %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D760D8], "nextPossibleNotificationDateWithPhotoLibrary:", self->_photoLibrary);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "compare:", v29) == -1)
      {
        if (__PXLoggraph_workerOnceToken != -1)
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_178);
        v36 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v29;
          _os_log_impl(&dword_1CAC16000, v36, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing: Too soon to trigger, will be available on %@", buf, 0xCu);
        }

        goto LABEL_19;
      }
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_180);
      v31 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v29;
        _os_log_impl(&dword_1CAC16000, v31, OS_LOG_TYPE_INFO, "[Memories Notification] Next possible date is %@", buf, 0xCu);
      }

    }
    if ((a4 == 3) | v20 & 1)
    {
LABEL_43:
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar", (_QWORD)v37);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D760D8], "lastTriggeredNotificationDateWithPhotoLibrary:", self->_photoLibrary);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33 && objc_msgSend(v32, "isDateInToday:", v33))
      {
        if (__PXLoggraph_workerOnceToken != -1)
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_185);
        v34 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_INFO, "[Memories Notification] Not firing: User already had a notification today", buf, 2u);
        }
        v8 = 0;
      }
      else
      {
        v8 = 1;
      }

      goto LABEL_52;
    }
    if (__PXLoggraph_workerOnceToken != -1)
      dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_182);
    v15 = __PXLoggraph_workerOSLog;
    if (!os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      v8 = 0;
      goto LABEL_52;
    }
    *(_WORD *)buf = 0;
    v16 = "[Memories Notification] Not firing: Generated memories are not worth a notification";
LABEL_18:
    _os_log_impl(&dword_1CAC16000, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
    goto LABEL_19;
  }
  if (__PXLoggraph_workerOnceToken != -1)
    dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_172);
  v14 = __PXLoggraph_workerOSLog;
  v8 = 1;
  if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v43 = CFSTR("PhotoAnalysisShouldForceTriggerNotification");
    v9 = "[Memories Notification] Forcing notification trigger because of user defaults %@";
    v10 = v14;
    v11 = 12;
    goto LABEL_13;
  }
LABEL_52:

  return v8;
}

- (id)_userFeedbackCalculatorWithPhotoLibrary:(id)a3
{
  PHUserFeedbackCalculator *userFeedbackCalculator;
  objc_class *v5;
  id v6;
  PHUserFeedbackCalculator *v7;
  PHUserFeedbackCalculator *v8;

  userFeedbackCalculator = self->_userFeedbackCalculator;
  if (!userFeedbackCalculator)
  {
    v5 = (objc_class *)MEMORY[0x1E0CD17F8];
    v6 = a3;
    v7 = (PHUserFeedbackCalculator *)objc_msgSend([v5 alloc], "initWithPhotoLibrary:", v6);

    v8 = self->_userFeedbackCalculator;
    self->_userFeedbackCalculator = v7;

    userFeedbackCalculator = self->_userFeedbackCalculator;
  }
  return userFeedbackCalculator;
}

- (void)fireNotificationForMemoryIdentifiers:(id)a3 withCreationReason:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  BOOL v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  PHPhotoLibrary *photoLibrary;
  id v29;
  id v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v34 = a4;
    -[PHANotificationController _userFeedbackCalculatorWithPhotoLibrary:](self, "_userFeedbackCalculatorWithPhotoLibrary:", self->_photoLibrary);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludePendingMemories:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v11);

    v36 = v8;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v6, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    if (!v13)
      goto LABEL_20;
    v14 = v13;
    v35 = v6;
    v15 = 0;
    v16 = *(_QWORD *)v42;
    v17 = 0.0;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v42 != v16)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v18);
        objc_msgSend(v19, "score");
        v21 = v20;
        if (!v15 || v20 > v17)
        {
          objc_msgSend(v19, "blockableFeatures");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[PHANotificationController userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:](self, "userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:", v19, v22, v7);

          if (v23)
          {
            v24 = v19;

            v17 = v21;
            v15 = v24;
          }
          else
          {
            if (__PXLoggraph_workerOnceToken != -1)
              dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_190);
            v25 = (void *)__PXLoggraph_workerOSLog;
            if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v26 = v25;
              objc_msgSend(v19, "localIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v46 = v27;
              _os_log_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Skipping notification for memory %@: user feedback score is lower than acceptable.", buf, 0xCu);

            }
          }
        }
        ++v18;
      }
      while (v14 != v18);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
    }
    while (v14);
    v6 = v35;
    if (v15)
    {
      photoLibrary = self->_photoLibrary;
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_193;
      v38[3] = &unk_1E85211E0;
      v39 = v12;
      v29 = v15;
      v40 = v29;
      v37 = 0;
      LOBYTE(photoLibrary) = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v38, &v37);
      v30 = v37;
      if ((photoLibrary & 1) != 0)
      {
        -[PHANotificationController postNotificationForMemory:withCreationReason:forceImmediateDelivery:](self, "postNotificationForMemory:withCreationReason:forceImmediateDelivery:", v29, v34, 0);
        v31 = v36;
      }
      else
      {
        if (__PXLoggraph_workerOnceToken != -1)
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_195);
        v31 = v36;
        v33 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v30;
          _os_log_error_impl(&dword_1CAC16000, v33, OS_LOG_TYPE_ERROR, "[Memories Notification] Failed to persist memories, not firing any notifications: %@", buf, 0xCu);
        }
      }

    }
    else
    {
LABEL_20:
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_192);
      v31 = v36;
      v32 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v6;
        _os_log_impl(&dword_1CAC16000, v32, OS_LOG_TYPE_DEFAULT, "[Memories Notification] Failed to fire, bestMemoryToPersist is nil. %@", buf, 0xCu);
      }
    }

  }
}

- (void)postNotificationForMemory:(id)a3 withCreationReason:(unint64_t)a4 forceImmediateDelivery:(BOOL)a5
{
  id v8;
  void *v9;
  PHANotificationOptions *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;

  v8 = a3;
  +[PHALocalNotificationInterface localNotificationInterface](PHALocalNotificationInterface, "localNotificationInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHANotificationOptions initWithType:]([PHANotificationOptions alloc], "initWithType:", 0);
  v11 = (void *)MEMORY[0x1E0CD1630];
  objc_msgSend(v8, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uuidFromLocalIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHANotificationOptions setCollectionUUID:](v10, "setCollectionUUID:", v13);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions setDeliveryDate:](v10, "setDeliveryDate:", v14);

  if (a4 == 1)
    v15 = objc_msgSend(MEMORY[0x1E0D76298], "isMemoriesLivingOnFeedbackEnabled") ^ 1;
  else
    v15 = 1;
  if (a4 != 3 && v15 && !a5)
  {
    -[PHANotificationController bestDateForDeliveringNotification](self, "bestDateForDeliveringNotification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHANotificationOptions setDeliveryDate:](v10, "setDeliveryDate:", v16);

  }
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v8, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions setKeyAsset:](v10, "setKeyAsset:", v18);

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__PHANotificationController_postNotificationForMemory_withCreationReason_forceImmediateDelivery___block_invoke;
  v20[3] = &unk_1E8521230;
  v20[4] = self;
  v21 = v8;
  v19 = v8;
  objc_msgSend(v9, "fireLocalNotificationWithOptions:completionHandler:", v10, v20);

}

- (void)fireNotificationForSuggestionIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  PHPhotoLibrary *photoLibrary;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  id v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PHANotificationController _userFeedbackCalculatorWithPhotoLibrary:](self, "_userFeedbackCalculatorWithPhotoLibrary:", self->_photoLibrary);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSortDescriptors:", v8);

    v28 = v4;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier in %@"), v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v9);

    v27 = v6;
    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v6);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v34;
      v14 = MEMORY[0x1E0C9AA60];
LABEL_4:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v15);
        if (-[PHANotificationController userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:](self, "userFeedbackScoreIsAcceptableForAssetCollection:memoryFeatures:userFeedbackCalculator:", v16, v14, v5))
        {
          break;
        }
        if (__PXLoggraph_workerOnceToken != -1)
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_207);
        v17 = (void *)__PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v18 = v17;
          objc_msgSend(v16, "localIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v38 = v19;
          _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_DEFAULT, "[Suggestions Notification] Skipping notification for suggestion %@: user feedback score is lower than acceptable.", buf, 0xCu);

        }
        if (v12 == ++v15)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_14;
        }
      }
      v20 = v16;

      if (!v20)
        goto LABEL_18;
      photoLibrary = self->_photoLibrary;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_210;
      v30[3] = &unk_1E85211E0;
      v31 = v10;
      v22 = v20;
      v32 = v22;
      v29 = 0;
      LOBYTE(photoLibrary) = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v30, &v29);
      v23 = v29;
      if ((photoLibrary & 1) != 0)
      {
        -[PHANotificationController postNotificationForSuggestion:deliveryDate:](self, "postNotificationForSuggestion:deliveryDate:", v22, 0);
        v24 = v27;
        v4 = v28;
      }
      else
      {
        if (__PXLoggraph_workerOnceToken != -1)
          dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_212);
        v24 = v27;
        v4 = v28;
        v26 = __PXLoggraph_workerOSLog;
        if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v23;
          _os_log_error_impl(&dword_1CAC16000, v26, OS_LOG_TYPE_ERROR, "[Suggestions Notification] Failed to persist suggestions, not firing any notifications: %@", buf, 0xCu);
        }
      }

    }
    else
    {
LABEL_14:

LABEL_18:
      if (__PXLoggraph_workerOnceToken != -1)
        dispatch_once(&__PXLoggraph_workerOnceToken, &__block_literal_global_209);
      v24 = v27;
      v4 = v28;
      v25 = __PXLoggraph_workerOSLog;
      if (os_log_type_enabled((os_log_t)__PXLoggraph_workerOSLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        _os_log_impl(&dword_1CAC16000, v25, OS_LOG_TYPE_DEFAULT, "[Suggestions Notification] Won't fire notification, bestSuggestionToNotify is nil. %@", buf, 0xCu);
      }
    }

  }
}

- (void)postNotificationForSuggestion:(id)a3 deliveryDate:(id)a4
{
  id v5;
  void *v6;
  PHANotificationOptions *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v5 = a3;
  +[PHALocalNotificationInterface localNotificationInterface](PHALocalNotificationInterface, "localNotificationInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PHANotificationOptions initWithType:]([PHANotificationOptions alloc], "initWithType:", 1);
  v8 = (void *)MEMORY[0x1E0CD17D0];
  objc_msgSend(v5, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuidFromLocalIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHANotificationOptions setCollectionUUID:](v7, "setCollectionUUID:", v10);
  -[PHANotificationController bestDateForDeliveringNotification](self, "bestDateForDeliveringNotification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions setDeliveryDate:](v7, "setDeliveryDate:", v11);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHANotificationOptions setKeyAsset:](v7, "setKeyAsset:", v13);

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72__PHANotificationController_postNotificationForSuggestion_deliveryDate___block_invoke;
  v14[3] = &unk_1E85212C0;
  v14[4] = self;
  objc_msgSend(v6, "fireLocalNotificationWithOptions:completionHandler:", v7, v14);

}

- (BOOL)userFeedbackScoreIsAcceptableForAssetCollection:(id)a3 memoryFeatures:(id)a4 userFeedbackCalculator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t j;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  double v34;
  double v35;
  char v36;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v42 = a4;
  v9 = a5;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v11);

  v40 = v10;
  v41 = v8;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v8, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v48 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v16);
  }
  v39 = v14;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIncludedDetectionTypes:", &unk_1E8540D10);
  v38 = v20;
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v13, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0CD1E68];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = v13;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v44;
    v27 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v23);
        v29 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
        objc_msgSend(v21, "objectForKeyedSubscript:", v29);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v30;
        if (v30)
          v32 = (void *)v30;
        else
          v32 = v27;
        v33 = v32;

        objc_msgSend(v9, "scoreForKeyAssetUUID:personsUUIDsInKeyAsset:memoryFeatures:", v29, v33, v42);
        v35 = v34;

        if (v35 < v22)
          v22 = v35;
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v25);
  }

  v36 = objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v22, *MEMORY[0x1E0CD1E58]);
  return v36;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

uint64_t __72__PHANotificationController_postNotificationForSuggestion_deliveryDate___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(*(_QWORD *)(result + 32) + 24), "sendEvent:withPayload:", CFSTR("com.apple.Photos.suggestion.notificationSent"), MEMORY[0x1E0C9AA70]);
  return result;
}

void __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_210(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "markActive");
        if (v7 == *(_QWORD *)(a1 + 40))
          objc_msgSend(v8, "setNotificationState:", 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke_208()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __70__PHANotificationController_fireNotificationForSuggestionIdentifiers___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __97__PHANotificationController_postNotificationForMemory_withCreationReason_forceImmediateDelivery___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sendEvent:withPayload:", CFSTR("com.apple.Photos.memories.notificationSent"), MEMORY[0x1E0C9AA70]);
    v3 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "workingContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAMetricsHelper fullMemoryTypeStringForMemory:withWorkingContext:](PHAMetricsHelper, "fullMemoryTypeStringForMemory:withWorkingContext:", v3, v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    +[PHAMemoryElectionTask sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:loggingConnection:analytics:](PHAMemoryElectionTask, "sendNotifiedMemoriesPipelineAnalyticsEventWithMemoryType:loggingConnection:analytics:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

void __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_193(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CD1640], "changeRequestForMemory:", v7, (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setPendingState:", 0);
        if (v7 == *(_QWORD *)(a1 + 40))
          objc_msgSend(v8, "setNotificationState:", 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke_191()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __85__PHANotificationController_fireNotificationForMemoryIdentifiers_withCreationReason___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_184()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_181()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_179()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_177()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_173()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_171()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke_168()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

void __92__PHANotificationController_shouldFireNotificationForMemoriesWithScores_withCreationReason___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd.graph", "worker");
  v1 = (void *)__PXLoggraph_workerOSLog;
  __PXLoggraph_workerOSLog = (uint64_t)v0;

}

@end
