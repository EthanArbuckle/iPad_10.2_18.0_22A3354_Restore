void sub_100002884(uint64_t a1)
{
  NSObject *v1;
  _QWORD *val;
  _QWORD block[4];
  id v4;
  id location;

  val = objc_loadWeakRetained((id *)(a1 + 32));
  if (val)
  {
    objc_initWeak(&location, val);
    v1 = val[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100002928;
    block[3] = &unk_100018558;
    objc_copyWeak(&v4, &location);
    dispatch_async(v1, block);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }

}

void sub_100002928(uint64_t a1)
{
  dispatch_queue_t *WeakRetained;
  dispatch_queue_t *v2;
  NSObject *v3;
  intptr_t v4;
  dispatch_object_t v5;
  dispatch_source_t v6;
  dispatch_object_t v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_time_t v10;
  dispatch_object_t *val;
  _QWORD handler[4];
  id v13;
  id location;

  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[2];
    val = WeakRetained;
    if (v3)
    {
      v4 = dispatch_source_testcancel(v3);
      v2 = val;
      if (!v4)
      {
        dispatch_source_cancel(v3);
        v5 = val[2];
        val[2] = 0;

        v2 = val;
      }
    }
    v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v2[1]);
    v7 = val[2];
    val[2] = v6;

    objc_initWeak(&location, val);
    v8 = val[2];
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002A6C;
    handler[3] = &unk_100018558;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v8, handler);
    v9 = val[2];
    v10 = dispatch_time(0, 3000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(val[2]);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    v2 = val;
  }

}

void sub_100002A6C(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  dispatch_source_t *v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const __CFString *v28;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v15 = WeakRetained;
    dispatch_source_cancel(WeakRetained[2]);
    v2 = v15[2];
    v15[2] = 0;

    v3 = AFSupportPreferencesSynchronize();
    v4 = AFPreferencesAssistantEnabled(v3);
    v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("enabled");
      if (!v4)
        v6 = CFSTR("disabled");
      *(_DWORD *)buf = 136315394;
      v26 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]";
      v27 = 2112;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Siri Assistant is now %@", buf, 0x16u);
    }
    if (!v4)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v7 = objc_msgSend(&off_1000194C8, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v18 != v9)
              objc_enumerationMutation(&off_1000194C8);
            v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
            v12 = objc_autoreleasePoolPush();
            v13 = CKLogContextDaemon;
            if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v21 = 136315394;
              v22 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]";
              v23 = 2112;
              v24 = v11;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Deleting all values from store with identifier %@", v21, 0x16u);
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
            v16[0] = _NSConcreteStackBlock;
            v16[1] = 3221225472;
            v16[2] = sub_100002CF4;
            v16[3] = &unk_100018798;
            v16[4] = v11;
            objc_msgSend(v14, "removeAllValuesFromStoreWithIdentifier:completionHandler:", v11, v16);

            objc_autoreleasePoolPop(v12);
          }
          v8 = objc_msgSend(&off_1000194C8, "countByEnumeratingWithState:objects:count:", &v17, buf, 16);
        }
        while (v8);
      }
    }
    WeakRetained = v15;
  }

}

void sub_100002CF4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      v8 = 136315650;
      v9 = "-[CKSiriSettingsMonitor _setAssistantEnabledStatus:]_block_invoke";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error deleting values from store %@ on Siri deactivation. %@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void sub_100002E64(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10001DE98;
  qword_10001DE98 = (uint64_t)v1;

}

void sub_100002E88(void *a1, uint64_t a2)
{
  id v3;
  __CFString *v4;
  const __CFDictionary *v5;
  __CFNotificationCenter *DistributedCenter;
  const __CFString *v7;
  id v8;

  v3 = a1;
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CKPersistentStorageKeysRemoved."), "stringByAppendingString:", a2));
  v7 = CFSTR("removed");
  v8 = v3;
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));

  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotification(DistributedCenter, v4, 0, v5, 1u);

}

void sub_100003368(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  uint64_t v10;
  void *v11;

  v1 = objc_opt_class(NSDictionary);
  v2 = objc_opt_class(NSArray);
  v3 = objc_opt_class(NSData);
  v4 = objc_opt_class(NSDate);
  v5 = objc_opt_class(NSNumber);
  v6 = objc_opt_class(NSSet);
  v7 = objc_opt_class(NSString);
  v8 = objc_opt_class(NSURL);
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(NSUUID), 0);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)qword_10001DEA0;
  qword_10001DEA0 = v10;

}

void sub_100003624(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v16 = 2112;
      v17 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  v8 = objc_opt_new(NSMutableArray);
  v9 = v8;
  if (v6)
    -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v6);
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v10, "saveKeysAndValues:toStoreWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 32), CFSTR("synched"), &stru_100018598);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys"));
    -[NSMutableArray removeObjectsInArray:](v9, "removeObjectsInArray:", v11);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v12, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), CFSTR("synched"), &stru_1000185B8);

    -[NSMutableArray removeObjectsInArray:](v9, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));
  }
  if (-[NSMutableArray count](v9, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKDaemon sharedDaemon](CKDaemon, "sharedDaemon"));
    objc_msgSend(v13, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:", v9, CFSTR("synched"), &stru_1000185D8);

  }
}

void sub_100003808(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_1000038CC(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_100003990(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_100003A54(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_100003B18(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKNCloudKitDataStore mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_100003EA8(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKAlarmInteractionProcessor processInteraction:bundleId:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

void sub_1000056D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1000074AC(uint64_t a1, int a2)
{
  void *v3;
  id v4;

  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 9) != a2)
    {
      *(_BYTE *)(a1 + 9) = a2;
      v4 = (id)objc_claimAutoreleasedReturnValue(+[CKKnowledgeStore userDefaultsKnowledgeStore](CKKnowledgeStore, "userDefaultsKnowledgeStore"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 9)));
      objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("HasSetUpRecordZoneSubscription"));

    }
  }
}

uint64_t sub_10000753C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100007550(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disableSyncAndDeleteCloudDataWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void sub_10000755C(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_100007620;
  block[3] = &unk_100018978;
  v8 = a1[4];
  v9 = (void *)a1[5];
  v10 = *(NSObject **)(v8 + 32);
  block[1] = 3221225472;
  block[4] = v8;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v17 = a1[6];
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void sub_100007620(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  dispatch_source_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  dispatch_time_t v13;
  double v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[6];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  double v25;

  objc_msgSend(*(id *)(a1 + 32), "_cancelSubscriptionSetupTimer");
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldSync") & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", *(_QWORD *)(a1 + 48)))
    {
      v2 = (void *)CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v3 = *(void **)(a1 + 48);
        v4 = v2;
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscriptionID"));
        *(_DWORD *)buf = 136315394;
        v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke";
        v22 = 2112;
        v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Subscription created: (%@)", buf, 0x16u);

      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 48));
      sub_1000074AC(*(_QWORD *)(a1 + 32), 1);
      objc_msgSend(*(id *)(a1 + 32), "_fetchChanges");
    }
    else
    {
      v7 = sub_100007970(*(void **)(a1 + 56));
      v8 = *(_QWORD *)(a1 + 32);
      if (v7)
      {
        if (*(_QWORD *)(v8 + 56))
          objc_msgSend((id)v8, "_resetZone");
        else
          sub_1000074AC(v8, 0);
      }
      else
      {
        v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(v8 + 32));
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(void **)(v10 + 80);
        *(_QWORD *)(v10 + 80) = v9;

        v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
        v13 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
        dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
        if (*(double *)(a1 + 64) + *(double *)(a1 + 64) <= 86400.0)
          v14 = *(double *)(a1 + 64) + *(double *)(a1 + 64);
        else
          v14 = 86400.0;
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(NSObject **)(v15 + 80);
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100007B08;
        v19[3] = &unk_100018928;
        v19[4] = v15;
        *(double *)&v19[5] = v14;
        dispatch_source_set_event_handler(v16, v19);
        dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 80));
        v17 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v18 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 136315650;
          v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
          v22 = 2112;
          v23 = v18;
          v24 = 2048;
          v25 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Subscription creation failed with error (%@). Retrying in %f seconds", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v6 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v21 = "-[CKNCloudKitManager _setupRecordZoneSubscriptionWithRetryInterval:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Will not retry creating zone subscription", buf, 0xCu);
    }
  }
}

uint64_t sub_100007970(void *a1)
{
  id v1;
  NSString *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v1 = a1;
  v2 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));

  if (v2 != CKErrorDomain)
    goto LABEL_2;
  if (objc_msgSend(v1, "code") == (id)26)
  {
    v3 = 1;
    goto LABEL_17;
  }
  if (objc_msgSend(v1, "code") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CKPartialErrorsByItemIDKey));

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues", 0));
    v3 = (uint64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "code") == (id)26)
          {
            v3 = 1;
            goto LABEL_16;
          }
        }
        v3 = (uint64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_16:

  }
  else
  {
LABEL_2:
    v3 = 0;
  }
LABEL_17:

  return v3;
}

id sub_100007B08(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupRecordZoneSubscriptionWithRetryInterval:", *(double *)(a1 + 40));
}

void sub_100007B18(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_createRecordsIDsForKeys:", *(_QWORD *)(a1 + 40)));
  v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007BBC;
  v5[3] = &unk_1000189F0;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "_saveRecords:recordIDsToDelete:savePolicy:completion:", 0, v2, 1, v5);

}

void sub_100007BBC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007C9C;
    v12[3] = &unk_100018B58;
    v16 = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t sub_100007C9C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

void sub_100007CB0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_createRecordsWithDictionary:", *(_QWORD *)(a1 + 40)));
  v3 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007D54;
  v5[3] = &unk_1000189F0;
  v4 = *(id *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "_saveRecords:recordIDsToDelete:savePolicy:completion:", v2, 0, 1, v5);

}

void sub_100007D54(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(void **)(a1 + 40);
  if (v10)
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007E34;
    v12[3] = &unk_100018B58;
    v16 = v10;
    v13 = v7;
    v14 = v8;
    v15 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t sub_100007E34(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

id sub_100007E48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_saveRecords:recordIDsToDelete:savePolicy:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1, *(_QWORD *)(a1 + 56));
}

void sub_100007E5C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  dispatch_group_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD block[5];
  dispatch_group_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = CKLogContextDaemon;
  if (v9)
  {
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke";
      v23 = 2112;
      v24 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to save records into database with error: (%@)", buf, 0x16u);
    }
    if ((sub_1000080A8(v9) & 1) != 0)
    {
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(NSObject **)(v12 + 32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008274;
      block[3] = &unk_1000187C0;
      block[4] = v12;
      v14 = v11;
      v20 = v14;
      dispatch_async(v13, block);

    }
    else
    {
      if (!sub_100007970(v9))
        goto LABEL_12;
      v14 = dispatch_group_create();
    }
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000831C;
    v18[3] = &unk_100018AA8;
    v18[4] = v15;
    dispatch_group_notify(v14, v16, v18);
  }
  else
  {
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
      goto LABEL_12;
    v14 = v10;
    *(_DWORD *)buf = 136315394;
    v22 = "-[CKNCloudKitManager _saveRecords:recordIDsToDelete:savePolicy:completion:]_block_invoke_4";
    v23 = 2048;
    v24 = objc_msgSend(v7, "count");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s Saved %ld records into database", buf, 0x16u);
  }

LABEL_12:
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, id, id, id))(v17 + 16))(v17, v9, v7, v8);

}

uint64_t sub_1000080A8(void *a1)
{
  id v1;
  NSString *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSString *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v1 = a1;
  v2 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domain"));

  if (v2 != CKErrorDomain)
    goto LABEL_2;
  if (objc_msgSend(v1, "code") == (id)112)
  {
    v3 = 1;
    goto LABEL_19;
  }
  if (objc_msgSend(v1, "code") == (id)2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "userInfo"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CKPartialErrorsByItemIDKey));

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
          if (v12 == v2)
          {
            v13 = objc_msgSend(v11, "code");

            if (v13 == (id)112)
            {
              v3 = 1;
              goto LABEL_18;
            }
          }
          else
          {

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_18:

  }
  else
  {
LABEL_2:
    v3 = 0;
  }
LABEL_19:

  return v3;
}

void sub_100008274(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "zoneID"));
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100008334;
    v4[3] = &unk_100018798;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_deleteRecordZoneWithID:qualityOfService:completion:", v2, 17, v4);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void sub_10000831C(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[7])
    objc_msgSend(v1, "_resetZone");
  else
    sub_1000074AC((uint64_t)v1, 0);
}

void sub_100008334(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10000833C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v12 = *(void **)(a1 + 32);
      v13 = v10;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "zoneName"));
      v15 = 136315650;
      v16 = "-[CKNCloudKitManager _deleteRecordZoneWithID:qualityOfService:completion:]_block_invoke";
      v17 = 2112;
      v18 = v14;
      v19 = 2112;
      v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Error deleting zone (%@): (%@)", (uint8_t *)&v15, 0x20u);

    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v9);

}

void sub_100008474(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v10 = (void *)CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "zoneName"));
      v16 = 136315650;
      v17 = "-[CKNCloudKitManager _createRecordZoneWithID:completion:]_block_invoke";
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s Error creating zone (%@): (%@)", (uint8_t *)&v16, 0x20u);

    }
  }
  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    (*(void (**)(uint64_t, id, void *))(v11 + 16))(v11, v9, v12);

  }
}

void sub_1000085C8(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = (void *)a1[5];
  v9 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008690;
  block[3] = &unk_100018978;
  block[4] = v7;
  v13 = v8;
  v14 = v5;
  v15 = v6;
  v16 = a1[6];
  v10 = v6;
  v11 = v5;
  dispatch_async(v9, block);

}

void sub_100008690(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;

  objc_msgSend(*(id *)(a1 + 32), "_cancelRecordZoneSetupTimer");
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldSync") & 1) != 0)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v2 + 48))
    {
      v3 = *(void **)(a1 + 48);
      if (!v3)
      {
        v14 = *(void **)(a1 + 56);
        if (v14)
        {
          v15 = (void *)CKLogContextDaemon;
          if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
          {
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "zoneID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "zoneName"));
            *(_DWORD *)buf = 136315394;
            v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
            v27 = 2112;
            v28 = v18;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Zone created: (%@)", buf, 0x16u);

            v14 = *(void **)(a1 + 56);
            v2 = *(_QWORD *)(a1 + 32);
          }
          if ((objc_msgSend(v14, "isEqual:", *(_QWORD *)(v2 + 56)) & 1) == 0)
          {
            objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 56));
            sub_1000089CC(*(_QWORD *)(a1 + 32), 0);
          }
          v19 = *(_QWORD *)(a1 + 32);
          if (*(_QWORD *)(v19 + 72) && !*(_BYTE *)(v19 + 9))
            objc_msgSend((id)v19, "_fetchChanges");
          else
            objc_msgSend((id)v19, "_setupRecordZoneSubscription");
          return;
        }
      }
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100008B48;
      v22[3] = &unk_100018950;
      v22[4] = v2;
      v24 = *(_QWORD *)(a1 + 64);
      v23 = v3;
      v4 = objc_retainBlock(v22);
      v5 = *(void **)(a1 + 48);
      if (v5 && sub_1000080A8(v5))
      {
        v7 = *(void **)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100008CE8;
        v20[3] = &unk_100018C70;
        v20[4] = v7;
        v21 = v4;
        objc_msgSend(v7, "_deleteRecordZoneWithID:qualityOfService:completion:", v6, 17, v20);

      }
      else
      {
        ((void (*)(_QWORD *))v4[2])(v4);
      }

      v13 = v23;
    }
    else
    {
      v12 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_3";
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Zone creation error - container no longer exists", buf, 0xCu);
        v2 = *(_QWORD *)(a1 + 32);
      }
      v13 = *(void **)(v2 + 56);
      *(_QWORD *)(v2 + 56) = 0;
    }

    return;
  }
  v8 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v9 = *(void **)(a1 + 40);
    v10 = v8;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "zoneName"));
    *(_DWORD *)buf = 136315394;
    v26 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke_2";
    v27 = 2112;
    v28 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s iCloud sync is disabled. Will not attempt retry creating zone: (%@)", buf, 0x16u);

  }
}

void sub_1000089CC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  void *v17;

  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v7 = *(id *)(a1 + 88);
    v6 = (id *)(a1 + 88);
    if (v7 != v4)
    {
      objc_storeStrong(v6, a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKnowledgeStore userDefaultsKnowledgeStore](CKKnowledgeStore, "userDefaultsKnowledgeStore"));
      if (v5)
      {
        v13 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v13));
        v10 = v13;
        if (!v10)
        {
          objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("ServerChangeToken"));

          goto LABEL_10;
        }
        v11 = v10;
        v12 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v15 = "-[CKNCloudKitManager setServerChangeToken:]";
          v16 = 2112;
          v17 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Error unarchihving server change token %@", buf, 0x16u);
        }

      }
      objc_msgSend(v8, "setValue:forKey:", 0, CFSTR("ServerChangeToken"));
LABEL_10:

    }
  }

}

void sub_100008B48(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  double v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  double v18;

  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 32));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  if (*(double *)(a1 + 48) + *(double *)(a1 + 48) <= 86400.0)
    v7 = *(double *)(a1 + 48) + *(double *)(a1 + 48);
  else
    v7 = 86400.0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(NSObject **)(v8 + 64);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008D94;
  v12[3] = &unk_100018928;
  v12[4] = v8;
  *(double *)&v12[5] = v7;
  dispatch_source_set_event_handler(v9, v12);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 64));
  v10 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    v14 = "-[CKNCloudKitManager _setupRecordZoneWithRetryInterval:]_block_invoke";
    v15 = 2112;
    v16 = v11;
    v17 = 2048;
    v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Zone creation failed: (%@) Retrying in %f seconds", buf, 0x20u);
  }
}

void sub_100008CE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008D5C;
  v4[3] = &unk_1000188B0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t sub_100008D5C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cancelRecordZoneSetupTimer");
  sub_1000074AC(*(_QWORD *)(a1 + 32), 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100008D94(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupRecordZoneWithRetryInterval:", *(double *)(a1 + 40));
}

void sub_100008DA4(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008E1C;
  v4[3] = &unk_100018900;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "_fetchChangesFrom:completion:", 0, v4);

}

void sub_100008E1C(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = *(void **)(a1 + 40);
  if (v12)
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008F0C;
    block[3] = &unk_1000188D8;
    v18 = v12;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v19 = a5;
    dispatch_async(v13, block);

  }
}

uint64_t sub_100008F0C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
}

void sub_100008F24(uint64_t a1)
{
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[5];
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = v2[11];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008F9C;
  v4[3] = &unk_100018900;
  v4[4] = v2;
  v5 = v1;
  objc_msgSend(v2, "_fetchChangesFrom:completion:", v3, v4);

}

void sub_100008F9C(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v17 = *(NSObject **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000090B0;
  block[3] = &unk_100018888;
  v23 = v11;
  v24 = v15;
  v25 = v14;
  v27 = v13;
  v28 = v16;
  v26 = v12;
  v29 = a5;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  v21 = v11;
  dispatch_async(v17, block);

}

uint64_t sub_1000090B0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  id v8;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_shouldSync") & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 40);
      v4 = *(void **)(a1 + 48);
LABEL_9:
      sub_1000089CC(v3, v4);
      goto LABEL_10;
    }
    v2 = *(void **)(a1 + 32);
  }
  v5 = v2;
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
  v7 = v6;
  if (v6 != CKErrorDomain)
  {

    goto LABEL_10;
  }
  v8 = objc_msgSend(v5, "code");

  if (v8 == (id)21)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 0;
    goto LABEL_9;
  }
LABEL_10:
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
  return result;
}

void sub_100009178(uint64_t a1, void *a2, void *a3, void *a4, char a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD block[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v17 = *(NSObject **)(v15 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000927C;
  block[3] = &unk_100018838;
  v23 = v11;
  v24 = v15;
  v29 = a5;
  v25 = v14;
  v26 = v12;
  v27 = v13;
  v28 = v16;
  v18 = v13;
  v19 = v12;
  v20 = v14;
  v21 = v11;
  dispatch_async(v17, block);

}

void sub_10000927C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;

  v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "_shouldSync") & 1) != 0)
    {
      sub_1000089CC(*(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
      if (*(_BYTE *)(a1 + 80) || objc_msgSend(*(id *)(a1 + 56), "count") || objc_msgSend(*(id *)(a1 + 64), "count"))
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createDictionaryFromRecords:", *(_QWORD *)(a1 + 56)));
        v4 = (void *)CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          v5 = v4;
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
          *(_DWORD *)buf = 136315394;
          v16 = "-[CKNCloudKitManager _fetchChangesWithRetryCount:]_block_invoke_2";
          v17 = 2112;
          v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received keys=[%@]", buf, 0x16u);

        }
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createKeysForRecordsIDs:", *(_QWORD *)(a1 + 64)));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:", v3, v7, *(unsigned __int8 *)(a1 + 80));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[AFAnalytics sharedAnalytics](AFAnalytics, "sharedAnalytics"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100009518;
        v13[3] = &unk_100018810;
        v14 = *(id *)(a1 + 56);
        objc_msgSend(v8, "logEventWithType:contextProvider:", 4102, v13);

      }
      return;
    }
    v2 = *(void **)(a1 + 32);
  }
  v12 = v2;
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
  v10 = v9;
  if (v9 == CKErrorDomain)
  {
    v11 = objc_msgSend(v12, "code");

    if (v11 == (id)21)
    {
      sub_1000089CC(*(_QWORD *)(a1 + 40), 0);
      if (objc_msgSend(*(id *)(a1 + 40), "_shouldSync"))
        objc_msgSend(*(id *)(a1 + 40), "_fetchChangesWithRetryCount:", *(_QWORD *)(a1 + 72) + 1);
    }
  }
  else
  {

  }
}

id sub_100009518(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3)
  {
    v21 = v2;
    v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v3);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v23;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v9);
          v11 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 4);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "recordName"));

          if (v13)
            objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("record name"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "modificationDate"));
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "timeIntervalSince1970");
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
            objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("modification date"));

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "recordChangeTag"));
          if (v17)
            objc_msgSend(v11, "setObject:forKey:", v17, CFSTR("tag"));
          objc_msgSend(v4, "addObject:", v11);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v7);
    }

    v2 = v21;
    if (objc_msgSend(v4, "count"))
      objc_msgSend(v21, "setObject:forKey:", v4, CFSTR("changes"));

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v18, "timeIntervalSince1970");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v2, "setObject:forKey:", v19, CFSTR("now"));

  return v2;
}

uint64_t sub_1000097A4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000097B4(uint64_t a1)
{

}

id sub_1000097BC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

id sub_1000097C8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_1000097D4(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

void sub_1000097E8(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  uint64_t v31;
  int v32;
  const char *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = v13;
  if (v13)
  {
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v16 = v15;
    if (v15 == CKErrorDomain)
    {
      v23 = objc_msgSend(v14, "code");

      if (v23 == (id)21)
      {
        v24 = (void *)CKLogContextDaemon;
        if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
LABEL_11:
          v31 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v22 = *(void **)(v31 + 40);
          *(_QWORD *)(v31 + 40) = 0;
          goto LABEL_12;
        }
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
        v32 = 136315394;
        v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke_4";
        v34 = 2112;
        v35 = v26;
        v27 = "%s Change token expired for zone (%@)";
        v28 = v25;
        v29 = 22;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v32, v29);

        goto LABEL_11;
      }
    }
    else
    {

    }
    v30 = (void *)CKLogContextDaemon;
    if (!os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v25 = v30;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
    v32 = 136315650;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    v34 = 2112;
    v35 = v26;
    v36 = 2112;
    v37 = v14;
    v27 = "%s Failed to fetch changes in zone (%@) with error (%@)";
    v28 = v25;
    v29 = 32;
    goto LABEL_14;
  }
  v17 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "zoneName"));
    v32 = 136315394;
    v33 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    v34 = 2112;
    v35 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Fetched changes successfully in zone (%@)", (uint8_t *)&v32, 0x16u);

  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v21 = v11;
  v22 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v21;
LABEL_12:

}

void sub_100009A90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  _BOOL8 v19;
  _QWORD v20[5];
  _QWORD block[5];
  NSObject *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;

  v3 = a2;
  v4 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v5 = *(void **)(a1 + 32);
    v6 = v4;
    v7 = CKDatabaseScopeString(objc_msgSend(v5, "databaseScope"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 136315650;
    v24 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
    v25 = 2112;
    v26 = v8;
    v27 = 2048;
    v28 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Finished fetching changes in database (%@), %ld records", buf, 0x20u);

  }
  if (v3)
  {
    v10 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[CKNCloudKitManager _fetchChangesFrom:completion:]_block_invoke";
      v25 = 2112;
      v26 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Failed to fetch changes with error (%@)", buf, 0x16u);
    }
    v11 = sub_1000080A8(v3);
    if ((sub_100007970(v3) & 1) != 0 || v11)
    {
      v12 = dispatch_group_create();
      v13 = v12;
      if (v11)
      {
        dispatch_group_enter(v12);
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(NSObject **)(v14 + 32);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100009D04;
        block[3] = &unk_1000187C0;
        block[4] = v14;
        v22 = v13;
        dispatch_async(v15, block);

      }
      v16 = *(_QWORD *)(a1 + 48);
      v17 = *(NSObject **)(v16 + 32);
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100009DAC;
      v20[3] = &unk_100018AA8;
      v20[4] = v16;
      dispatch_group_notify(v13, v17, v20);

    }
    v18 = *(_QWORD *)(a1 + 64);
    if (v18)
    {
      v19 = 0;
LABEL_15:
      (*(void (**)(uint64_t, id, _QWORD, _QWORD, _BOOL8, _QWORD))(v18 + 16))(v18, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v19, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    }
  }
  else
  {
    v18 = *(_QWORD *)(a1 + 64);
    if (v18)
    {
      v19 = *(_BYTE *)(a1 + 80) != 0;
      goto LABEL_15;
    }
  }

}

void sub_100009D04(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "zoneID"));
  if (v2)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100009DC4;
    v4[3] = &unk_100018798;
    v3 = *(void **)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_deleteRecordZoneWithID:qualityOfService:completion:", v2, 17, v4);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void sub_100009DAC(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[7])
    objc_msgSend(v1, "_resetZone");
  else
    sub_1000074AC((uint64_t)v1, 0);
}

void sub_100009DC4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100009DCC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009E7C;
  block[3] = &unk_1000186A8;
  v12 = v6;
  v13 = v5;
  v14 = v7;
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, block);

}

void sub_100009E7C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke_2";
      v11 = 2112;
      v12 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Error while retrieving account status: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  v4 = *(void **)(a1 + 40);
  if (v4 && objc_msgSend(v4, "supportsDeviceToDeviceEncryption"))
  {
    objc_msgSend(*(id *)(a1 + 48), "_handleAccountStatusChange:", *(_QWORD *)(a1 + 40));
    return;
  }
  v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315138;
    v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s Account status change cannot be handled", (uint8_t *)&v9, 0xCu);
    v5 = CKLogContextDaemon;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v7)
    {
      v9 = 136315138;
      v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
      v8 = "%s AccountInfo DOES NOT supportsDeviceToDeviceEncryption";
LABEL_15:
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 136315138;
    v10 = "-[CKNCloudKitManager _setupAccount]_block_invoke";
    v8 = "%s AccountInfo is nil";
    goto LABEL_15;
  }
}

void sub_10000A040(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  _BYTE *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AFPreferences sharedPreferences](AFPreferences, "sharedPreferences"));
  v3 = objc_msgSend(v2, "cloudSyncEnabled");

  v4 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v4 + 8) != v3)
  {
    *(_BYTE *)(v4 + 8) = v3;
    v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
        v6 = CFSTR("enabled");
      else
        v6 = CFSTR("disabled");
      v8 = 136315394;
      v9 = "-[CKNCloudKitManager _cloudSyncPreferenceDidChange]_block_invoke";
      v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Cloud synch is now %@", (uint8_t *)&v8, 0x16u);
    }
    v7 = *(_BYTE **)(a1 + 32);
    if (v7[8])
    {
      objc_msgSend(v7, "_initializeZone");
      objc_msgSend(*(id *)(a1 + 32), "_setupAccountState");
    }
    else
    {
      objc_msgSend(v7, "_cleanUpRecordZonesAndSubscriptions");
    }
  }
}

id sub_10000A170(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupAccount");
}

_QWORD *sub_10000A178(_QWORD *a1)
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      v3 = objc_alloc((Class)APSConnection);
      v4 = objc_msgSend(v3, "initWithEnvironmentName:namedDelegatePort:queue:", APSEnvironmentProduction, CFSTR("com.apple.siriknowledged.aps"), v1[4]);
      v5 = (void *)v1[3];
      v1[3] = v4;

      objc_msgSend((id)v1[3], "setDelegate:", v1);
      v2 = (void *)v1[3];
      if (!v2)
      {
        v6 = CKLogContextDaemon;
        if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
        {
          v8 = 136315138;
          v9 = "-[CKNCloudKitManager pushConnection]";
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Failed to create push connection", (uint8_t *)&v8, 0xCu);
          v2 = (void *)v1[3];
        }
        else
        {
          v2 = 0;
        }
      }
    }
    a1 = v2;
  }
  return a1;
}

id sub_10000A284(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_disablePush");
}

id sub_10000A28C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enablePush");
}

id sub_10000A294(uint64_t a1)
{
  CKNCloudKitDataStore *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(CKNCloudKitDataStore);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 96);
  *(_QWORD *)(v3 + 96) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_initializeZone");
  return objc_msgSend(*(id *)(a1 + 32), "_setupAccount");
}

id sub_10000A2D8(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v5;
  const char *v6;

  v3 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "_CKNCloudKitPreferenceDidChangeCallback";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s CloudKit preferences changed handler called", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(a2, "_cloudSyncPreferenceDidChange");
}

void sub_10000A478(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_10001DEB8;
  qword_10001DEB8 = (uint64_t)v1;

}

void sub_10000A708(uint64_t a1)
{
  if (a1)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", *(dispatch_queue_t *)(a1 + 8), &stru_100018A80);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", *(dispatch_queue_t *)(a1 + 8), &stru_100018AC8);
  }
}

void sub_10000A758(id a1, OS_xpc_object *a2)
{
  const char *string;
  const char *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    v4 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[CKEventHandler setupNotifyHandlers]_block_invoke_2";
      v9 = 2080;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Received XPC event from distnoted: %s", (uint8_t *)&v7, 0x16u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](CKVDispatcher, "sharedInstance"));
    objc_msgSend(v6, "handleDistributedNotificationEventWithName:completion:", v5, 0);

  }
}

void sub_10000A864(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  const char *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  OS_xpc_object *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;

  v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    v4 = string;
    v5 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[CKEventHandler setupNotifyHandlers]_block_invoke";
      v13 = 2080;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Received XPC event from notifyd: %s", buf, 0x16u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
    if (objc_msgSend(v6, "isEqualToString:", kAFPreferencesDidChangeDarwinNotification))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKSiriSettingsMonitor sharedInstance](CKSiriSettingsMonitor, "sharedInstance"));
      objc_msgSend(v7, "siriSettingsDidChange");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](CKVDispatcher, "sharedInstance"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000A9F0;
    v9[3] = &unk_100018AA8;
    v10 = v2;
    objc_msgSend(v8, "handleDarwinNotificationEventWithName:completion:", v6, v9);

  }
}

void sub_10000A9F0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SEMDispatcher sharedInstance](SEMDispatcher, "sharedInstance"));
  objc_msgSend(v2, "handleXPCEvent:", *(_QWORD *)(a1 + 32));

}

void start()
{
  NSObject *v0;
  CKServiceDelegate *v1;
  void *v2;
  id v3;
  CKEventHandler *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;

  if ((_set_user_dir_suffix("com.apple.siriknowledged") & 1) != 0)
  {
    CKLogInit(objc_autoreleasePoolPush());
    v0 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "main";
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s Starting up siriknowledged...", (uint8_t *)&v16, 0xCu);
    }
    +[NSXPCListener enableTransactions](NSXPCListener, "enableTransactions");
    v1 = objc_alloc_init(CKServiceDelegate);
    v2 = (void *)qword_10001DEC0;
    qword_10001DEC0 = (uint64_t)v1;

    v3 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.siriknowledged"));
    objc_msgSend(v3, "setDelegate:", qword_10001DEC0);
    objc_msgSend(v3, "resume");
    v4 = objc_alloc_init(CKEventHandler);
    v5 = (void *)qword_10001DEC8;
    qword_10001DEC8 = (uint64_t)v4;

    sub_10000A708(qword_10001DEC8);
    v6 = objc_claimAutoreleasedReturnValue(+[CKVDispatcher sharedInstance](CKVDispatcher, "sharedInstance"));
    v7 = (void *)qword_10001DED0;
    qword_10001DED0 = v6;

    objc_msgSend((id)qword_10001DED0, "setupXPCListeners");
    objc_msgSend((id)qword_10001DED0, "registerXPCActivities");
    v8 = objc_claimAutoreleasedReturnValue(+[SEMDispatcher sharedInstance](SEMDispatcher, "sharedInstance"));
    v9 = (void *)qword_10001DED8;
    qword_10001DED8 = v8;

    objc_msgSend((id)qword_10001DED8, "setupXPCListeners");
    objc_msgSend((id)qword_10001DED8, "registerXPCActivities");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
    objc_msgSend(v10, "enablePushNotifications");

    v11 = objc_alloc_init((Class)UAFXPCService);
    v12 = (void *)qword_10001DEE0;
    qword_10001DEE0 = (uint64_t)v11;

    UAFRegisterXPCActivities(objc_msgSend((id)qword_10001DEE0, "startAsync"));
    dispatch_main();
  }
  v13 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v14 = v13;
    v15 = *__error();
    v16 = 136315394;
    v17 = "main";
    v18 = 1024;
    v19 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s _set_user_dir_suffix failed with: %d", (uint8_t *)&v16, 0x12u);

  }
  exit(1);
}

void sub_10000C90C(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v10 = 0;
  v4 = sub_10000C99C(v2, v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v10;
  if (!v6)
  {
    v7 = a1[6];
    v8 = a1[7];
    v9 = 0;
    objc_msgSend(v5, "dropLinksBetween:and:error:", v7, v8, &v9);
    v6 = v9;
  }
  (*(void (**)(void))(a1[8] + 16))();

}

id sub_10000C99C(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;

  v5 = a2;
  if (!a1)
    goto LABEL_20;
  v6 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v13 = 136315394;
    v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
    v15 = 2112;
    v16 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Looking for store with identifier %@", (uint8_t *)&v13, 0x16u);
  }
  if (!objc_msgSend(v5, "length"))
  {
    v10 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315394;
      v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      v15 = 2112;
      v16 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s identifier is invalid: %@", (uint8_t *)&v13, 0x16u);
      if (a3)
        goto LABEL_10;
    }
    else if (a3)
    {
LABEL_10:
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siriknowledged"), 101, &off_1000194F8));
      goto LABEL_18;
    }
LABEL_20:
    v8 = 0;
    goto LABEL_18;
  }
  v7 = *(id *)(a1 + 24);
  objc_sync_enter(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v5));
  if (v8)
  {
    v9 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Found in cache", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v8 = objc_msgSend(objc_alloc((Class)CKPersistentStoreHandler), "initWithName:", v5);
    if (v8)
    {
      v11 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
      {
        v13 = 136315394;
        v14 = "-[CKDaemon handlerForPersistentStoreWithIdentifier:error:]";
        v15 = 2112;
        v16 = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Created new store with identifier %@ and updating cache", (uint8_t *)&v13, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v8, v5);
    }
    else
    {
      v8 = 0;
      if (a3)
        *a3 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siriknowledged"), 102, &off_100019520));
    }
  }
  objc_sync_exit(v7);

LABEL_18:
  return v8;
}

void sub_10000CC7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000CC98(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v10 = 0;
  v4 = sub_10000C99C(v2, v3, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v10;
  if (!v6)
  {
    v7 = a1[6];
    v8 = a1[7];
    v9 = 0;
    objc_msgSend(v5, "dropLinksWithLabel:from:error:", v7, v8, &v9);
    v6 = v9;
  }
  (*(void (**)(void))(a1[8] + 16))();

}

void sub_10000CD28(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v11 = 0;
  v4 = sub_10000C99C(v2, v3, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v11;
  if (!v6)
  {
    v7 = a1[6];
    v8 = a1[7];
    v9 = a1[8];
    v10 = 0;
    objc_msgSend(v5, "dropLinkWithLabel:between:and:error:", v7, v8, v9, &v10);
    v6 = v10;
  }
  (*(void (**)(void))(a1[9] + 16))();

}

void sub_10000CDBC(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v2 = a1[4];
  v3 = (void *)a1[5];
  v12 = 0;
  v4 = sub_10000C99C(v2, v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v12;
  if (v6)
  {
    v7 = v6;
  }
  else if (objc_msgSend(v5, "decreaseWeightForLinkWithLabel:between:and:", a1[6], a1[7], a1[8]) == (id)-1)
  {
    v13[0] = CFSTR("localizedDescription");
    v13[1] = CFSTR("subject");
    v8 = a1[7];
    v9 = a1[8];
    v14[0] = CFSTR("Error decreasing link weight");
    v14[1] = v8;
    v13[2] = CFSTR("predicate");
    v13[3] = CFSTR("object");
    v10 = a1[5];
    v14[2] = a1[6];
    v14[3] = v9;
    v13[4] = CFSTR("storeIdentifier");
    v14[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siriknowledged"), 102, v11));

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(a1[9] + 16))();

}

void sub_10000CF20(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v2 = a1[4];
  v3 = (void *)a1[5];
  v12 = 0;
  v4 = sub_10000C99C(v2, v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v12;
  if (v6)
  {
    v7 = v6;
  }
  else if (objc_msgSend(v5, "increaseWeightForLinkWithLabel:between:and:", a1[6], a1[7], a1[8]) == (id)-1)
  {
    v13[0] = CFSTR("localizedDescription");
    v13[1] = CFSTR("subject");
    v8 = a1[7];
    v9 = a1[8];
    v14[0] = CFSTR("Error increasing link weight");
    v14[1] = v8;
    v13[2] = CFSTR("predicate");
    v13[3] = CFSTR("object");
    v10 = a1[5];
    v14[2] = a1[6];
    v14[3] = v9;
    v13[4] = CFSTR("storeIdentifier");
    v14[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siriknowledged"), 102, v11));

  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(void))(a1[9] + 16))();

}

void sub_10000D084(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v2 = a1[4];
  v3 = (void *)a1[5];
  v12 = 0;
  v4 = sub_10000C99C(v2, v3, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v12;
  if (!v6)
  {
    v7 = a1[6];
    v8 = a1[7];
    v9 = a1[8];
    v10 = a1[10];
    v11 = 0;
    objc_msgSend(v5, "setWeightForLinkWithLabel:between:and:toValue:error:", v7, v8, v9, v10, &v11);
    v6 = v11;
  }
  (*(void (**)(void))(a1[9] + 16))();

}

void sub_10000D11C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000D1D8;
    v7[3] = &unk_100018C70;
    v8 = v5;
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:", a3, v8, v7);

  }
}

void sub_10000D1D8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v3 = a2;
  v4 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[CKDaemon removeAllValuesFromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_2";
    v8 = 2112;
    v9 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s Finished removing ALL values in synched store %@", (uint8_t *)&v6, 0x16u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000D2B8(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v9 = a1[4];
    *(_DWORD *)buf = 136315394;
    v14 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing ALL values in store %@", buf, 0x16u);
  }
  v4 = (void *)a1[4];
  v3 = a1[5];
  v12 = 0;
  v5 = sub_10000C99C(v3, v4, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v12;
  if (!v7)
  {
    v11 = 0;
    objc_msgSend(v6, "removeAllValuesAndReturnError:", &v11);
    v7 = v11;
  }
  v8 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    v14 = "-[CKDaemon removeAllValuesFromStoreWithIdentifier:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%s Finished removing ALL values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();
  if (!v7)
    sub_100002E88(&__NSArray0__struct, a1[4]);

}

void sub_10000D450(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000D544;
    v11[3] = &unk_100018C48;
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(id *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v15 = v9;
    v11[4] = v10;
    v12 = *(id *)(a1 + 48);
    v13 = v5;
    v14 = *(id *)(a1 + 40);
    objc_msgSend(v6, "removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:", v7, v8, v11);

  }
}

void sub_10000D544(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000D628;
    v5[3] = &unk_100018C20;
    v9 = *(id *)(a1 + 64);
    v6 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v3, "keysInStoreWithIdentifier:completionHandler:", v4, v5);
    sub_100002E88(*(void **)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

void sub_10000D628(id *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v5 = a3;
  if (a2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v6 = objc_msgSend(a1[4], "mutableCopy");
    objc_msgSend(v6, "removeObjectsInArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000D724;
    v8[3] = &unk_100018BF8;
    v9 = a1[5];
    v10 = a1[6];
    v11 = a1[7];
    objc_msgSend(v7, "removeValuesForKeys:completion:", v6, v8);

  }
}

void sub_10000D724(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = CKLogContextDaemon;
  if (v7 && os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke_4";
    v17 = 2112;
    v18 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Could not remove values for keys with error %@", (uint8_t *)&v15, 0x16u);
    v10 = CKLogContextDaemon;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (void *)a1[4];
    v12 = v10;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "description"));
    v14 = a1[5];
    v15 = 136315650;
    v16 = "-[CKDaemon removeValuesMatchingCondition:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s Finished removing values matching condition %@ in synched store %@", (uint8_t *)&v15, 0x20u);

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000D8BC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)a1[4];
    v11 = v2;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
    *(_DWORD *)buf = 136315394;
    v19 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s Removing values matching condition %@", buf, 0x16u);

  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v17 = 0;
  v5 = sub_10000C99C(v3, v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v17;
  if (!v7)
  {
    v8 = a1[4];
    v16 = 0;
    objc_msgSend(v6, "removeValuesMatching:error:", v8, &v16);
    v7 = v16;
  }
  v9 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v13 = (void *)a1[4];
    v14 = v9;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
    *(_DWORD *)buf = 136315394;
    v19 = "-[CKDaemon removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s Finished removing values matching condition %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v7)
    sub_100002E88(&__NSArray0__struct, a1[6]);

}

void sub_10000DAA0(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
    objc_msgSend(v4, "removeValuesForKeys:completion:", a1[4], 0);

  }
  v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[4];
    v7 = a1[5];
    v8 = 136315650;
    v9 = "-[CKDaemon removeValuesForKeys:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Finished removing values for keys %@ in synched store %@", (uint8_t *)&v8, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000DBB0(uint64_t *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v10 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v16 = 2112;
    v17 = v10;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing values for keys %@", buf, 0x16u);
  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v13 = 0;
  v5 = sub_10000C99C(v3, v4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v13;
  if (!v7)
  {
    v8 = a1[4];
    v12 = 0;
    objc_msgSend(v6, "removeValuesForKeys:error:", v8, &v12);
    v7 = v12;
  }
  v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v15 = "-[CKDaemon removeValuesForKeys:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v16 = 2112;
    v17 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished removing values for keys %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v7)
    sub_100002E88((void *)a1[4], a1[6]);

}

void sub_10000DD48(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
    v15 = a1[4];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v4, "removeValuesForKeys:completion:", v5, 0);

  }
  v6 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v7 = a1[4];
    v8 = a1[5];
    v9 = 136315650;
    v10 = "-[CKDaemon removeValueForKey:fromSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    v11 = 2112;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s Finished removing value for key %@ in synched store %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000DE84(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v17 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Removing value for key %@", buf, 0x16u);
  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v14 = 0;
  v5 = sub_10000C99C(v3, v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v14;
  if (!v7)
  {
    v8 = a1[4];
    v13 = 0;
    objc_msgSend(v6, "removeValueForKey:error:", v8, &v13);
    v7 = v13;
  }
  v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    v17 = "-[CKDaemon removeValueForKey:fromStoreWithIdentifier:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished removing value for key %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v7)
  {
    v15 = a1[4];
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    sub_100002E88(v10, a1[6]);

  }
}

void sub_10000E040(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      v18 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Could not retrieve value for key %@. %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v8 = objc_opt_class(CKHistoricEvent);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      v9 = v6;
    }
    else
    {
      v10 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v18 = "-[CKDaemon recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:]_block_invoke";
        v19 = 2112;
        v20 = v15;
        v21 = 2112;
        v22 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s value for key %@ in store %@ is not a CKHistoricEvent", buf, 0x20u);
      }
      v9 = 0;
    }
    v11 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKPermanentEventStore createEventWithIdentifier:dateInterval:metadata:fromEvent:](CKPermanentEventStore, "createEventWithIdentifier:dateInterval:metadata:fromEvent:", *(_QWORD *)(a1 + 32), v11, *(_QWORD *)(a1 + 64), v9));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v12, *(_QWORD *)(a1 + 32), 0));
    objc_msgSend(*(id *)(a1 + 72), "saveKeysAndValues:toStoreWithIdentifier:completionHandler:", v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));

  }
}

void sub_10000E264(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v3 = a2;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKNCloudKitManager sharedManager](CKNCloudKitManager, "sharedManager"));
    objc_msgSend(v4, "saveRecordsWithDictionary:completion:", a1[4], 0);

  }
  v5 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v6 = a1[5];
    v7 = 136315394;
    v8 = "-[CKDaemon saveKeysAndValues:toSynchedStoreWithIdentifier:completionHandler:]_block_invoke";
    v9 = 2112;
    v10 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Finished setting all values for keys in synched store %@", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000E36C(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  __CFString *v13;
  const __CFDictionary *v14;
  __CFNotificationCenter *DistributedCenter;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _BYTE buf[12];
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  const __CFString *v28;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v16 = (void *)a1[4];
    v17 = v2;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
    v19 = a1[5];
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    v24 = 2112;
    v25 = v18;
    v26 = 2112;
    v27 = v19;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s Setting all values for keys=[%@] in store %@", buf, 0x20u);

  }
  v4 = (void *)a1[5];
  v3 = a1[6];
  v22 = 0;
  v5 = sub_10000C99C(v3, v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v22;
  if (!v7)
  {
    v8 = a1[4];
    v21 = 0;
    objc_msgSend(v6, "saveKeysAndValues:error:", v8, &v21);
    v7 = v21;
  }
  v9 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v20 = (void *)a1[5];
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[CKDaemon saveKeysAndValues:toStoreWithIdentifier:completionHandler:]_block_invoke";
    v24 = 2112;
    v25 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s Finished setting all values for keys in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();
  if (!v7)
  {
    v10 = (void *)a1[4];
    v11 = a1[5];
    v12 = v10;
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CKPersistentStorageKeysAndValuesUpdated."), "stringByAppendingString:", v11));
    v28 = CFSTR("updated");
    *(_QWORD *)buf = v12;
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v28, 1));

    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, v13, 0, v14, 1u);

  }
}

void sub_10000E5A4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = v2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Getting triplets matching condition %@", buf, 0x16u);

  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v19 = 0;
  v5 = sub_10000C99C(v3, v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v19;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSArray0__struct;
  }
  else
  {
    v10 = a1[4];
    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tripleComponentsMatching:error:", v10, &v18));
    v8 = v18;
  }
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)a1[4];
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon triplesComponentsMatching:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Finished getting triplets matching condition %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_10000E790(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = v2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Getting all keys and values matching condition %@", buf, 0x16u);

  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v19 = 0;
  v5 = sub_10000C99C(v3, v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v19;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSDictionary0__struct;
  }
  else
  {
    v10 = a1[4];
    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysAndValuesForKeysMatching:error:", v10, &v18));
    v8 = v18;
  }
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)a1[4];
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon keysAndValuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys and values matching condition %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_10000E97C(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all keys and values in store %@", buf, 0x16u);
  }
  v4 = (void *)a1[4];
  v3 = a1[5];
  v14 = 0;
  v5 = sub_10000C99C(v3, v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v14;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSDictionary0__struct;
  }
  else
  {
    v13 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysAndValuesAndReturnError:", &v13));
    v8 = v13;
  }
  v10 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon keysAndValuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys and values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000EB24(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = v2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Getting values for keys matching condition %@", buf, 0x16u);

  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v19 = 0;
  v5 = sub_10000C99C(v3, v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v19;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSArray0__struct;
  }
  else
  {
    v10 = a1[4];
    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valuesForKeysMatching:error:", v10, &v18));
    v8 = v18;
  }
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)a1[4];
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon valuesForKeysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Finished getting values for keys matching condition %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

uint64_t sub_10000ED10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000ED20(uint64_t a1)
{

}

void sub_10000ED28(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id obj;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v16 = a1[4];
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting values for keys %@", buf, 0x16u);
  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = sub_10000C99C(v3, v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_storeStrong((id *)(v5 + 40), obj);
  v8 = *(_QWORD *)(a1[8] + 8);
  v10 = *(_QWORD *)(v8 + 40);
  v9 = (id *)(v8 + 40);
  if (!v10)
  {
    v11 = a1[4];
    v18 = 0;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_valuesForKeys:error:", v11, &v18));
    objc_storeStrong(v9, v18);
    v13 = *(_QWORD *)(a1[9] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  v15 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v17 = a1[4];
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon valuesForKeys:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Finished getting values for keys %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_10000EEF8(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all values in store %@", buf, 0x16u);
  }
  v4 = (void *)a1[4];
  v3 = a1[5];
  v14 = 0;
  v5 = sub_10000C99C(v3, v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v14;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSArray0__struct;
  }
  else
  {
    v13 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valuesAndReturnError:", &v13));
    v8 = v13;
  }
  v10 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon valuesInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Finished getting all values in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000F0A0(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v14 = a1[4];
    *(_DWORD *)buf = 136315394;
    v20 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v21 = 2112;
    v22 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting value for key %@", buf, 0x16u);
  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v17 = 0;
  v5 = sub_10000C99C(v3, v4, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v17;
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v18 = a1[4];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    v16 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_valuesForKeys:error:", v9, &v16));
    v8 = v16;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    LODWORD(v10) = objc_msgSend(v11, "isEqual:", v12);

    if (!(_DWORD)v10)
      goto LABEL_8;

  }
  v11 = 0;
LABEL_8:
  v13 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = a1[4];
    *(_DWORD *)buf = 136315394;
    v20 = "-[CKDaemon valueForKey:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v21 = 2112;
    v22 = v15;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Finished getting value for key %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_10000F2BC(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;

  v2 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = (void *)a1[4];
    v13 = v2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v14;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%s Getting all keys matching condition %@", buf, 0x16u);

  }
  v3 = a1[5];
  v4 = (void *)a1[6];
  v19 = 0;
  v5 = sub_10000C99C(v3, v4, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v19;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSArray0__struct;
  }
  else
  {
    v10 = a1[4];
    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysMatching:error:", v10, &v18));
    v8 = v18;
  }
  v11 = (void *)CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v15 = (void *)a1[4];
    v16 = v11;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "description"));
    *(_DWORD *)buf = 136315394;
    v21 = "-[CKDaemon keysMatchingCondition:inStoreWithIdentifier:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys matching condition %@", buf, 0x16u);

  }
  (*(void (**)(void))(a1[7] + 16))();

}

void sub_10000F4A8(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  uint64_t v18;

  v2 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v11;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s Getting all keys in store %@", buf, 0x16u);
  }
  v4 = (void *)a1[4];
  v3 = a1[5];
  v14 = 0;
  v5 = sub_10000C99C(v3, v4, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v14;
  if (v7)
  {
    v8 = v7;
    v9 = &__NSArray0__struct;
  }
  else
  {
    v13 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keysAndReturnError:", &v13));
    v8 = v13;
  }
  v10 = CKLogContextDaemon;
  if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    v12 = a1[4];
    *(_DWORD *)buf = 136315394;
    v16 = "-[CKDaemon keysInStoreWithIdentifier:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s Finished getting all keys in store %@", buf, 0x16u);
  }
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_10000F690(id a1)
{
  CKDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(CKDaemon);
  v2 = (void *)qword_10001DEF0;
  qword_10001DEF0 = (uint64_t)v1;

}

void sub_10000F814(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  NSError *v7;

  v2 = a2;
  if (v2)
  {
    v3 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315394;
      v5 = "-[CKGenericAppInteractionProcessor processInteraction:bundleId:]_block_invoke";
      v6 = 2112;
      v7 = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Could not update app interaction donation count %@", (uint8_t *)&v4, 0x16u);
    }
  }

}

id objc_msgSend_CKServiceXPCInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CKServiceXPCInterface");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__cancelRecordZoneSetupTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelRecordZoneSetupTimer");
}

id objc_msgSend__cancelSubscriptionSetupTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cancelSubscriptionSetupTimer");
}

id objc_msgSend__cleanUpRecordZoneSubscriptionsTimers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpRecordZoneSubscriptionsTimers");
}

id objc_msgSend__cleanUpRecordZonesAndSubscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanUpRecordZonesAndSubscriptions");
}

id objc_msgSend__cloudSyncPreferenceDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cloudSyncPreferenceDidChange");
}

id objc_msgSend__createCloudKitContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createCloudKitContainer");
}

id objc_msgSend__createDictionaryFromRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDictionaryFromRecords:");
}

id objc_msgSend__createKeysForRecordsIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createKeysForRecordsIDs:");
}

id objc_msgSend__createRecordZoneWithID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createRecordZoneWithID:completion:");
}

id objc_msgSend__createRecordsIDsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createRecordsIDsForKeys:");
}

id objc_msgSend__createRecordsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createRecordsWithDictionary:");
}

id objc_msgSend__deleteRecordZoneWithID_qualityOfService_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteRecordZoneWithID:qualityOfService:completion:");
}

id objc_msgSend__fetchChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchChanges");
}

id objc_msgSend__fetchChangesFrom_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchChangesFrom:completion:");
}

id objc_msgSend__handleAccountStatusChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleAccountStatusChange:");
}

id objc_msgSend__handleCloudKitNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleCloudKitNotification:");
}

id objc_msgSend__initializeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeZone");
}

id objc_msgSend__saveRecords_recordIDsToDelete_savePolicy_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_saveRecords:recordIDsToDelete:savePolicy:completion:");
}

id objc_msgSend__setEnabledTopics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setEnabledTopics:");
}

id objc_msgSend__setupAccountState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupAccountState");
}

id objc_msgSend__setupRecordZoneSubscription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupRecordZoneSubscription");
}

id objc_msgSend__shouldSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldSync");
}

id objc_msgSend__valuesForKeys_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_valuesForKeys:error:");
}

id objc_msgSend_acceptedClasses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acceptedClasses");
}

id objc_msgSend_accountInfoWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountInfoWithCompletionHandler:");
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountStatus");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cloudSyncEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudSyncEnabled");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containerWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEventWithIdentifier_dateInterval_metadata_fromEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEventWithIdentifier:dateInterval:metadata:fromEvent:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseScope");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateInterval");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_decreaseWeightForLinkWithLabel_between_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decreaseWeightForLinkWithLabel:between:and:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_disableSyncAndDeleteCloudDataWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableSyncAndDeleteCloudDataWithCompletionHandler:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_dropLinkWithLabel_between_and_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropLinkWithLabel:between:and:error:");
}

id objc_msgSend_dropLinksBetween_and_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropLinksBetween:and:error:");
}

id objc_msgSend_dropLinksWithLabel_from_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropLinksWithLabel:from:error:");
}

id objc_msgSend_enablePushNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enablePushNotifications");
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableTransactions");
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptedValuesByKey");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getApplicationIdentifierFromEntitlements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getApplicationIdentifierFromEntitlements");
}

id objc_msgSend_handleDarwinNotificationEventWithName_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDarwinNotificationEventWithName:completion:");
}

id objc_msgSend_handleDistributedNotificationEventWithName_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDistributedNotificationEventWithName:completion:");
}

id objc_msgSend_handleXPCEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleXPCEvent:");
}

id objc_msgSend_increaseWeightForLinkWithLabel_between_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseWeightForLinkWithLabel:between:and:");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZoneIDs_configurationsByRecordZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZoneIDs:configurationsByRecordZoneID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithRecordsToSave_recordIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordsToSave:recordIDsToDelete:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithSubscriptionsToSave_subscriptionIDsToDelete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSubscriptionsToSave:subscriptionIDsToDelete:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneID_subscriptionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneID:subscriptionID:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intent");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keysAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysAndReturnError:");
}

id objc_msgSend_keysAndValuesAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysAndValuesAndReturnError:");
}

id objc_msgSend_keysAndValuesForKeysMatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysAndValuesForKeysMatching:error:");
}

id objc_msgSend_keysInStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysInStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_keysMatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysMatching:error:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_logEventWithType_contextProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logEventWithType:contextProvider:");
}

id objc_msgSend_mergeRecordsWithDictionary_deletedRecordKeys_containsAllChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeRecordsWithDictionary:deletedRecordKeys:containsAllChanges:");
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modificationDate");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_notificationFromRemoteNotificationDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationFromRemoteNotificationDictionary:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_parametersByName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parametersByName");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordChangeTag");
}

id objc_msgSend_recordEventWithIdentifier_startDate_endDate_metadata_toStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordEventWithIdentifier:startDate:endDate:metadata:toStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordID");
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordName");
}

id objc_msgSend_recordZoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordZoneID");
}

id objc_msgSend_registerXPCActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerXPCActivities");
}

id objc_msgSend_removeAllValuesAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllValuesAndReturnError:");
}

id objc_msgSend_removeAllValuesFromStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllValuesFromStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeValueForKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValueForKey:error:");
}

id objc_msgSend_removeValueForKey_fromStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValueForKey:fromStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_removeValuesForKeys_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValuesForKeys:completion:");
}

id objc_msgSend_removeValuesForKeys_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValuesForKeys:error:");
}

id objc_msgSend_removeValuesForKeys_fromStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValuesForKeys:fromStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_removeValuesMatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValuesMatching:error:");
}

id objc_msgSend_removeValuesMatchingCondition_fromStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeValuesMatchingCondition:fromStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_saveKeysAndValues_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveKeysAndValues:error:");
}

id objc_msgSend_saveKeysAndValues_toStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveKeysAndValues:toStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_saveRecordsWithDictionary_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveRecordsWithDictionary:completion:");
}

id objc_msgSend_setAccountPartition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountPartition:");
}

id objc_msgSend_setAccountStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccountStatus:");
}

id objc_msgSend_setAtomic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAtomic:");
}

id objc_msgSend_setCapabilities_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapabilities:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchAllChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchAllChanges:");
}

id objc_msgSend_setFetchRecordZoneChangesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchRecordZoneChangesCompletionBlock:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setModifyRecordsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifyRecordsCompletionBlock:");
}

id objc_msgSend_setModifySubscriptionsCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifySubscriptionsCompletionBlock:");
}

id objc_msgSend_setNotificationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationInfo:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPreviousServerChangeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreviousServerChangeToken:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setRecordChangedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordChangedBlock:");
}

id objc_msgSend_setRecordType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordType:");
}

id objc_msgSend_setRecordWithIDWasDeletedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordWithIDWasDeletedBlock:");
}

id objc_msgSend_setRecordZoneChangeTokensUpdatedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneChangeTokensUpdatedBlock:");
}

id objc_msgSend_setRecordZoneFetchCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordZoneFetchCompletionBlock:");
}

id objc_msgSend_setSavePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSavePolicy:");
}

id objc_msgSend_setShouldSendContentAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSendContentAvailable:");
}

id objc_msgSend_setSupportsDeviceToDeviceEncryption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsDeviceToDeviceEncryption:");
}

id objc_msgSend_setUseZoneWidePCS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseZoneWidePCS:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWeightForLinkWithLabel_between_and_toValue_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWeightForLinkWithLabel:between:and:toValue:error:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupXPCListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupXPCListeners");
}

id objc_msgSend_sharedAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAnalytics");
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemon");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPreferences");
}

id objc_msgSend_siriSettingsDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "siriSettingsDidChange");
}

id objc_msgSend_startAsync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAsync");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscriptionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionID");
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsDeviceToDeviceEncryption");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topic");
}

id objc_msgSend_tripleComponentsMatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tripleComponentsMatching:error:");
}

id objc_msgSend_userDefaultsKnowledgeStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDefaultsKnowledgeStore");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKey_inStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:inStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_valuesAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valuesAndReturnError:");
}

id objc_msgSend_valuesForKeysMatching_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valuesForKeysMatching:error:");
}

id objc_msgSend_verb(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verb");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneID");
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneName");
}
