@implementation TICoreAnalyticsEventController

- (TICoreAnalyticsEventController)init
{
  TICoreAnalyticsEventController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TICoreAnalyticsEventController;
  v2 = -[TICoreAnalyticsEventController init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.keyboard.analytics.scheduledEventsWorkerQueue", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)queueScheduledEventsWithCompletionHandler:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  TIDispatchAsync();

}

- (void)dispatchScheduledEventsWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  TIPreferencesAnalyzer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  TIPreferencesAnalyzer *v32;
  void (**v33)(_QWORD);
  uint64_t v34;
  int v35;
  void *v36;
  id obj;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[4];
  void (**v42)(_QWORD);
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  IXADefaultLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dispatching scheduled events."), "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v55 = v6;
    _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v7 = objc_alloc_init(TIPreferencesAnalyzer);
  -[TIPreferencesAnalyzer analyzeRegisteredPreferences](v7, "analyzeRegisteredPreferences");
  +[TIEventDescriptorRegistry registry](TIEventDescriptorRegistry, "registry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[TIMetricDescriptorRegistry registry](TIMetricDescriptorRegistry, "registry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DBDDC0], "sharedUserModelDataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.keyboard"));
  v13 = objc_msgSend(v12, "BOOLForKey:", CFSTR("ignoreLastMigrationDate"));
  v36 = v12;
  v35 = objc_msgSend(v12, "BOOLForKey:", CFSTR("typingSessionNotificationsEnabled"));
  if (objc_msgSend(v10, "isValid"))
  {
    objc_msgSend(v10, "transientLastMigrationDate");
    v34 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v11, -((double)(int)*MEMORY[0x1E0DBEB28] * (double)(unint64_t)*MEMORY[0x1E0DBEAB8]));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v13 & 1) == 0 && objc_msgSend(v14, "compare:", v34) == -1)
    {
      IXADefaultLogFacility();
      v28 = objc_claimAutoreleasedReturnValue();
      v25 = 1;
      obj = v28;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduled events cannot be dispatched because insufficient data has been collected since last database migration."), "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v55 = v29;
        _os_log_impl(&dword_1DA6F2000, v28, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    else
    {
      v32 = v7;
      v33 = v4;
      v31 = v15;
      objc_msgSend(v10, "getAllKnownInputModesSinceDate:", v15);
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v40)
      {
        v38 = *(_QWORD *)v49;
        v39 = v10;
        do
        {
          for (i = 0; i != v40; ++i)
          {
            if (*(_QWORD *)v49 != v38)
              objc_enumerationMutation(obj);
            v17 = v11;
            +[TIKBUserModel userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:](TIKBUserModel, "userModelWithInputMode:userModelDataStore:metricDescriptorRegistry:fromDate:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i), v10, v9, v11);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "kbContexts");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v45;
              do
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v45 != v22)
                    objc_enumerationMutation(v19);
                  -[TICoreAnalyticsEventController dispatchEventsFromRegistry:withProvider:andContext:andMetrics:completionHandler:](self, "dispatchEventsFromRegistry:withProvider:andContext:andMetrics:completionHandler:", v8, v18, *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v9, 0);
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              }
              while (v21);
            }

            v10 = v39;
            v11 = v17;
          }
          v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v40);
      }
      objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __79__TICoreAnalyticsEventController_dispatchScheduledEventsWithCompletionHandler___block_invoke;
      v41[3] = &unk_1EA0FF0E0;
      v4 = v33;
      v42 = v33;
      v43 = v35;
      objc_msgSend(v24, "queueCompletionHandler:", v41);

      v25 = 0;
      v15 = v31;
      v7 = v32;
    }
    v26 = v34;

  }
  else
  {
    IXADefaultLogFacility();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduled events cannot be dispatched because an error occurred while opening the database."), "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v55 = v30;
      _os_log_error_impl(&dword_1DA6F2000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
    v25 = 1;
  }

  if (v4 && v25)
  {
    if (TI_IS_INTERNAL_INSTALL::once_token != -1)
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
    if (TI_IS_INTERNAL_INSTALL::is_internal_install && v35)
    {
      objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.keyboard.inputAnalytics.scheduledEventsDidComplete"), 0, 0, 1);

    }
    v4[2](v4);
  }

}

- (void)dispatchEventsFromRegistry:(id)a3 withProvider:(id)a4 andContext:(id)a5 andMetrics:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v28 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = v15;
  v17 = v12;
  if (v12 && v14)
  {
    v26 = v15;
    objc_msgSend(v12, "allEventDescriptors");
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v22, "eventName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventSpecWithName:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[TICoreAnalyticsEventController dispatchEventWithDescriptor:andSpec:withProvider:andContext:andMetrics:completionHandler:](self, "dispatchEventWithDescriptor:andSpec:withProvider:andContext:andMetrics:completionHandler:", v22, v24, v28, v13, v14, 0);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }
    v16 = v26;
    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "queueCompletionHandler:", v26);

    }
  }
  else if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
  }

}

- (void)dispatchEventWithDescriptor:(id)a3 andSpec:(id)a4 withProvider:(id)a5 andContext:(id)a6 andMetrics:(id)a7 completionHandler:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  int v18;
  char v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  char v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void (**v59)(_QWORD);
  id v60;
  id v61;
  void *v62;
  id obj;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(_QWORD))a8;
  v62 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  objc_msgSend(v12, "fieldDescriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v13;
  v70 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
  v60 = v12;
  v61 = v15;
  v68 = v14;
  v59 = v16;
  if (v70)
  {
    obj = v17;
    v18 = 0;
    v19 = 0;
    v67 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v85 != v67)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        objc_msgSend(v21, "inactiveValue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = v22 != 0;

        objc_msgSend(v21, "fieldName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "fieldSpecWithName:", v23);
        v71 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "metricType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("bucketedWordLength"));

        objc_msgSend(v21, "metricName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(v68, "valuesByBucketedWordLengthForMetricWithName:withContext:", v26, v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "inactiveValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            v64 = v27;
            v65 = v23;
            v82 = 0u;
            v83 = 0u;
            v80 = 0u;
            v81 = 0u;
            v29 = v27;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v81;
              do
              {
                for (j = 0; j != v31; ++j)
                {
                  if (*(_QWORD *)v81 != v32)
                    objc_enumerationMutation(v29);
                  v34 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * j);
                  objc_msgSend(v21, "inactiveValue");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v34) = objc_msgSend(v34, "isEqual:", v35);

                  v18 |= v34 ^ 1;
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v80, v89, 16);
              }
              while (v31);
            }

            v23 = v65;
            v13 = v66;
            v15 = v61;
            v27 = v64;
          }
          v36 = (void *)v71;
          -[TICoreAnalyticsEventController adjustValues:forFieldSpec:](self, "adjustValues:forFieldSpec:", v27, v71);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "setObject:forKey:", v37, v23);
          v38 = v73;
        }
        else
        {
          v39 = v23;
          objc_msgSend(v68, "valueForMetricWithName:withContext:", v26, v15);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v21, "inactiveValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v21, "inactiveValue");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v27, "isEqual:", v41) ^ 1;

          }
          else
          {
            v42 = 0;
          }
          v38 = v73;

          v18 |= v42;
          v36 = (void *)v71;
          -[TICoreAnalyticsEventController adjustValue:forFieldSpec:](self, "adjustValue:forFieldSpec:", v27, v71);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v39;
          objc_msgSend(v62, "setObject:forKey:", v37, v39);
          v13 = v66;
        }
        v19 |= v38;

      }
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v90, 16);
    }
    while (v70);

    v43 = v18 | ~v19;
    v44 = v59;
    v12 = v60;
    v45 = v68;
    if ((v43 & 1) == 0)
    {
      if (v59)
        v59[2](v59);
      goto LABEL_46;
    }
  }
  else
  {

  }
  if (objc_msgSend(v12, "includeTestingParameters"))
  {
    objc_msgSend(v15, "testingParameters");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = 0;
  }
  objc_msgSend(v12, "eventName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v75, "count"))
  {
    v72 = *MEMORY[0x1E0DBEB38];
    if (*MEMORY[0x1E0DBEB38])
    {
      v47 = 0;
      do
      {
        v48 = v46;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v62);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v75, "allKeys");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v52; ++k)
            {
              if (*(_QWORD *)v77 != v53)
                objc_enumerationMutation(v50);
              v55 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k);
              objc_msgSend(v75, "objectForKey:", v55);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "objectAtIndexedSubscript:", v47);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "setObject:forKey:", v57, v55);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
          }
          while (v52);
        }

        v46 = v48;
        v13 = v66;
        -[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:](self, "dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:", v48, v49, v74, v66, 0);

        ++v47;
      }
      while (v47 != v72);
    }
  }
  else
  {
    -[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:](self, "dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:", v46, v62, v74, v13, 0);
  }
  v44 = v59;
  if (v59)
  {
    objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "queueCompletionHandler:", v59);

  }
  v12 = v60;
  v15 = v61;
  v45 = v68;
LABEL_46:

}

- (id)adjustValues:(id)a3 forFieldSpec:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  TICoreAnalyticsEventController *v17;
  id v18;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  objc_msgSend(v7, "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__TICoreAnalyticsEventController_adjustValues_forFieldSpec___block_invoke;
  v15[3] = &unk_1EA0FF108;
  v10 = v9;
  v16 = v10;
  v17 = self;
  v18 = v6;
  v11 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);

  v12 = v18;
  v13 = v10;

  return v13;
}

- (id)adjustValue:(id)a3 forFieldSpec:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0DBDB38], "isNumber:", v5)
    && objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0DBDB38];
    objc_msgSend(v7, "significantDigits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "roundNumber:toSignificantDigits:", v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isInteger") && objc_msgSend(MEMORY[0x1E0DBDB38], "isFloat:", v10))
    {
      objc_msgSend(MEMORY[0x1E0DBDB38], "toInteger:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      objc_msgSend(v10, "doubleValue");
      if (v13 == v14)
      {
        v11 = v11;

        v10 = v11;
      }
    }
    else
    {
      if ((objc_msgSend(v7, "isInteger") & 1) != 0
        || !objc_msgSend(MEMORY[0x1E0DBDB38], "isInteger:", v10))
      {
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0DBDB38], "toFloat:", v10);
      v11 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

LABEL_11:
    v5 = v10;
  }

  return v5;
}

- (void)dispatchEventWithName:(id)a3 payload:(id)a4 testingParameters:(id)a5 eventSpec:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  IXADefaultLogFacility();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Dispatching event: %@"), "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v17;
    _os_log_impl(&dword_1DA6F2000, v16, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "registerEventSpec:", v13);

  objc_msgSend(MEMORY[0x1E0DBDB30], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __110__TICoreAnalyticsEventController_dispatchEventWithName_payload_testingParameters_eventSpec_completionHandler___block_invoke;
  v22[3] = &unk_1EA100CE0;
  v23 = v11;
  v24 = v12;
  v20 = v12;
  v21 = v11;
  objc_msgSend(v19, "dispatchEventWithName:payload:testingParameters:allowSparsePayload:withCompletionHandler:", v21, v15, v14, 0, v22);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
}

uint64_t __110__TICoreAnalyticsEventController_dispatchEventWithName_payload_testingParameters_eventSpec_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t result;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(a2, "count");
  IXADefaultLogFacility();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (!v5)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Event dispatch failed: %@"), "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]_block_invoke", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
  }
  else
  {
    if (!v5)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Event dispatched: %@"), "-[TICoreAnalyticsEventController dispatchEventWithName:payload:testingParameters:eventSpec:completionHandler:]_block_invoke", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v9 = v6;
  }
  _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

LABEL_7:
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__TICoreAnalyticsEventController_adjustValues_forFieldSpec___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "adjustValue:forFieldSpec:", a2, *(_QWORD *)(a1 + 48));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, a3);

}

void __79__TICoreAnalyticsEventController_dispatchScheduledEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduled events dispatched."), "-[TICoreAnalyticsEventController dispatchScheduledEventsWithCompletionHandler:]_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    if (TI_IS_INTERNAL_INSTALL::once_token != -1)
      dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
    if (TI_IS_INTERNAL_INSTALL::is_internal_install)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.keyboard.inputAnalytics.scheduledEventsDidComplete"), 0, 0, 1);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

uint64_t __76__TICoreAnalyticsEventController_queueScheduledEventsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dispatchScheduledEventsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

+ (void)registerScheduledEventsActivity
{
  NSObject *v2;
  void *v3;
  const char *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  IXADefaultLogFacility();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Preparing for %@ activity"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]", kScheduledEventsActivity);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  v4 = (const char *)objc_msgSend((id)kScheduledEventsActivity, "UTF8String");
  xpc_activity_register(v4, (xpc_object_t)*MEMORY[0x1E0C80748], &__block_literal_global_5600);
}

void __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  xpc_activity_state_t state;
  NSObject *v4;
  void *v5;
  xpc_object_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  _xpc_activity_s *v11;
  uint8_t v12[4];
  void *v13;
  __int128 buf;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x2020000000;
    v16 = 0;
    v16 = xpc_activity_set_state(v2, 4);
    IXADefaultLogFacility();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Running activity %@, extended=%d"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity, *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_INFO, "%@", v12, 0xCu);

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.keyboard.analytics.scheduledEventsQueue", v9);

    v11 = v2;
    TIDispatchAsync();

    _Block_object_dispose(&buf, 8);
  }
  else if (!state)
  {
    IXADefaultLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Checking in activity %@"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&buf, 0xCu);

    }
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C80898], 1);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80760], *MEMORY[0x1E0C807B0]);
    xpc_dictionary_set_int64(v6, (const char *)*MEMORY[0x1E0C80790], *MEMORY[0x1E0C807C0]);
    xpc_dictionary_set_string(v6, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80888]);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808D8], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x1E0C808B8], 1);
    xpc_activity_set_criteria(v2, v6);

  }
}

void __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_37(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  intptr_t (*v14)(uint64_t);
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    IXADefaultLogFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s xpc activity should be defered, defering %@"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v3;
      _os_log_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

    }
  }
  else
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)MEMORY[0x1DF0A2708]();
    v6 = (void *)objc_opt_new();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_41;
    v15 = &unk_1EA106A98;
    v2 = v4;
    v16 = v2;
    objc_msgSend(v6, "queueScheduledEventsWithCompletionHandler:", &v12);

    v7 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v2, v7))
    {
      IXADefaultLogFacility();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Scheduled sync task timed out"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke_2");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v9;
        _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
      IXADefaultLogFacility();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Done running activity %@, extended=%d"), "+[TICoreAnalyticsEventController registerScheduledEventsActivity]_block_invoke", kScheduledEventsActivity, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v12, v13, v14, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v11;
        _os_log_impl(&dword_1DA6F2000, v10, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }

    objc_autoreleasePoolPop(v5);
  }

}

intptr_t __65__TICoreAnalyticsEventController_registerScheduledEventsActivity__block_invoke_41(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
