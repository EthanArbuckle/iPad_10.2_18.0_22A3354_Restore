void sub_100003540(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000767E8;
  qword_1000767E8 = (uint64_t)v1;

}

void sub_1000040E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  _QWORD v42[3];
  _QWORD v43[3];
  _BYTE v44[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  if (v7)
  {
    v8 = (uint64_t)v7;
    v9 = (double)(uint64_t)v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5));
    objc_msgSend(v10, "doubleValue");
    v12 = v9 / v11;

    if (v12 >= 0.02)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v13 = v6;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      v15 = 0.0;
      v16 = 0.0;
      v17 = 0.0;
      if (v14)
      {
        v18 = v14;
        v19 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v19)
              objc_enumerationMutation(v13);
            v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDate", (_QWORD)v34));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "startDate"));
            objc_msgSend(v22, "timeIntervalSinceDate:", v23);
            v25 = v24;

            v16 = v16 + v25;
            v17 = v17 + v25 * v25;
          }
          v18 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v18);
      }

      if (v8 >= 2)
        v15 = sqrt((v17 - v16 * v16 / v9) / (double)(v8 - 1));
      v42[0] = CFSTR("pctLong");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12, (_QWORD)v34));
      v43[0] = v26;
      v42[1] = CFSTR("average");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16 / v9));
      v43[1] = v27;
      v42[2] = CFSTR("stdDev");
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
      v43[2] = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 3));
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v29, v5);

      v30 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = *(void **)(a1 + 40);
        v32 = v30;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v5));
        *(_DWORD *)buf = 138412546;
        v39 = v5;
        v40 = 2112;
        v41 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Backup hour (%@) is %@", buf, 0x16u);

      }
    }
  }

}

void sub_1000045AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = *(_DWORD *)(a1 + 40);
  if (v6 == 1)
  {
    v7 = objc_alloc_init((Class)_OSInactivityPredictorBackupHourEntry_v1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count")));
    objc_msgSend(v7, "setCount:", objc_msgSend(v8, "intValue"));
  }
  else
  {
    if (v6 != 2)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v7 = objc_alloc_init((Class)_OSInactivityPredictorBackupHourEntry_v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pctLong")));
    objc_msgSend(v8, "doubleValue");
    objc_msgSend(v7, "setPctLong:");
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("average")));
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v7, "setAverageDuration:", v10 / 3600.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stdDev")));
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v7, "setStdDev:");

LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v12);

}

void sub_1000047F8(id a1)
{
  OSInactivityPredictionService *v1;
  void *v2;

  v1 = objc_alloc_init(OSInactivityPredictionService);
  v2 = (void *)qword_100076800;
  qword_100076800 = (uint64_t)v1;

}

void sub_100004C84(uint64_t a1, void *a2, int a3)
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (a3)
  {
    v4 = a2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[_OSDataProtectionStateMonitor dataProtectionClassC](_OSDataProtectionStateMonitor, "dataProtectionClassC"));
    v6 = objc_msgSend(v4, "isEqualToString:", v5);

    if (v6)
    {
      v7 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Re-attempting to load lock history from underlying data source...", buf, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[_OSLockHistory sharedInstance](_OSLockHistory, "sharedInstance"));
      objc_msgSend(v8, "loadHistoryFromUnderlyingDataSource");

      v9 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-attempting to initialize predictor...", v11, 2u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor predictor](_OSInactivityPredictor, "predictor"));
      objc_msgSend(*(id *)(a1 + 32), "setPredictor:", v10);

    }
  }
}

void sub_100004DAC(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  v2 = qword_1000767F8;
  if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Re-initializing predictor", v4, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor predictor](_OSInactivityPredictor, "predictor"));
  objc_msgSend(*(id *)(a1 + 32), "setPredictor:", v3);

}

void sub_100004F1C(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  _xpc_activity_s *v4;
  _OSInactivityPredictionBackupManager *v5;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    v5 = objc_alloc_init(_OSInactivityPredictionBackupManager);
    -[_OSInactivityPredictionBackupManager backupData](v5, "backupData");
LABEL_6:

    v4 = activity;
    goto LABEL_7;
  }
  v4 = activity;
  if (!state)
  {
    v5 = (_OSInactivityPredictionBackupManager *)xpc_activity_copy_criteria(activity);
    if (!xpc_equal(v5, *(xpc_object_t *)(a1 + 32)))
      xpc_activity_set_criteria(activity, *(xpc_object_t *)(a1 + 32));
    goto LABEL_6;
  }
LABEL_7:

}

void sub_1000056EC(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  xpc_object_t v5;
  void *v6;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "writeEvaluatedPredictorTypeToDefaults:", objc_msgSend(*(id *)(a1 + 40), "evaluatePredictorTypeWithLookahead:withIncrement:withActivity:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56)));
    if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently](_OSInactivityPredictor, "isDeviceRarelyUsedRecently"))
    {
      v6 = (void *)qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_ERROR))
        sub_10003D1FC(v6);
    }
  }
  else if (!state)
  {
    v5 = xpc_activity_copy_criteria(v3);
    if (!xpc_equal(v5, *(xpc_object_t *)(a1 + 32)))
      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));

  }
}

void sub_100006AE8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "upgradePredictorIfNeeded") & 1) == 0)
    {
      objc_msgSend(v2, "scheduleModelUpgradeAfterInterval:", 604800.0);
      v3 = qword_1000767F8;
      if (os_log_type_enabled((os_log_t)qword_1000767F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Model upgrade failed. Will try again in 7 days.", v4, 2u);
      }
    }
  }

}

void sub_100007010(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100007024(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100007034(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007080(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100007440(uint64_t a1, int token)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t state64;

  state64 = 0;
  notify_get_state(token, &state64);
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 21600.0));
  v5 = objc_msgSend(v3, "postEngagedUntilDate:inactivityOptions:", v4, state64);

}

void sub_100007FAC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  void *v27;
  _BYTE v28[128];

  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if (*(_QWORD *)(a1 + 40) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "request"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-"), v10));
          v12 = objc_msgSend(v9, "hasPrefix:", v11);

          if (!v12)
            continue;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "unCenter"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
          v27 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v27, 1));
          objc_msgSend(v13, "removeDeliveredNotificationsWithIdentifiers:", v16);

        }
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
          *(_DWORD *)buf = 138412290;
          v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v4);
  }

}

void sub_10000821C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  _BYTE v25[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          *(_DWORD *)buf = 138412290;
          v24 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing pending notification %@", buf, 0xCu);

        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 40)));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-"), v11));
        v13 = objc_msgSend(v10, "hasPrefix:", v12);

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "unCenter"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
          v22 = v15;
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
          objc_msgSend(v14, "removeDeliveredNotificationsWithIdentifiers:", v16);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
    }
    while (v4);
  }

}

void sub_10000850C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008524(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100008534(uint64_t a1)
{

}

void sub_10000853C(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "request"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "categoryIdentifier"));
        v11 = objc_msgSend(v10, "isEqual:", CFSTR("fullChargeCategory"));

        if (v11)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void sub_100008874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008890(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "loadTrialFactors");
    WeakRetained = v2;
  }

}

BOOL sub_10000A6E8(uint64_t a1, uint64_t a2)
{
  return +[OSIntelligenceUtilities pastEventInQuestion:containsTimeOfReferenceDate:](OSIntelligenceUtilities, "pastEventInQuestion:containsTimeOfReferenceDate:", a2, *(_QWORD *)(a1 + 32));
}

id sub_10000A700(uint64_t a1, uint64_t a2)
{
  return (id)+[OSIntelligenceUtilities pastEventInQuestion:startsAfterTimeOfReferenceDate:](OSIntelligenceUtilities, "pastEventInQuestion:startsAfterTimeOfReferenceDate:", a2, *(_QWORD *)(a1 + 32));
}

void sub_10000AE78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void start()
{
  os_log_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  v0 = os_log_create("com.apple.osintelligence", "");
  v1 = (void *)qword_100076830;
  qword_100076830 = (uint64_t)v0;

  v2 = objc_autoreleasePoolPush();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100060958);
  v3 = qword_100076830;
  if (os_log_type_enabled((os_log_t)qword_100076830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing OSInactivityPredictionService\n", buf, 2u);
  }
  v4 = objc_claimAutoreleasedReturnValue(+[OSInactivityPredictionService sharedInstance](OSInactivityPredictionService, "sharedInstance"));
  v5 = (void *)qword_100076818;
  qword_100076818 = v4;

  v6 = qword_100076830;
  if (os_log_type_enabled((os_log_t)qword_100076830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Init Charge prediction", v13, 2u);
  }
  v7 = objc_claimAutoreleasedReturnValue(+[OSChargingPredictorService sharedInstance](OSChargingPredictorService, "sharedInstance"));
  v8 = (void *)qword_100076820;
  qword_100076820 = v7;

  v9 = qword_100076830;
  if (os_log_type_enabled((os_log_t)qword_100076830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Init Battery prediction", v12, 2u);
  }
  v10 = objc_claimAutoreleasedReturnValue(+[OSBatteryPredictorService sharedInstance](OSBatteryPredictorService, "sharedInstance"));
  v11 = (void *)qword_100076828;
  qword_100076828 = v10;

  objc_autoreleasePoolPop(v2);
  dispatch_main();
}

void sub_10000B004(id a1, OS_xpc_object *a2)
{
  const char *string;
  NSObject *v3;
  int v4;
  const char *v5;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  v3 = qword_100076830;
  if (os_log_type_enabled((os_log_t)qword_100076830, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000B36C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100076838;
  qword_100076838 = (uint64_t)v1;

}

void sub_10000B83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10000B878(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  BMStoreEvent *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[BMStoreEvent timestamp](a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[BMStoreEvent timestamp](v4, "timestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = objc_msgSend(v5, "compare:", v8);

  return (int64_t)v9;
}

BOOL sub_10000B910(id a1, BMStoreEvent *a2)
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = v2 != 0;

  return v3;
}

BPSTuple *__cdecl sub_10000B944(id a1, BPSTuple *a2, BMStoreEvent *a3)
{
  BPSTuple *v4;
  BMStoreEvent *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  v7 = objc_opt_class(BMDeviceTimeZone);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = objc_alloc((Class)BPSTuple);
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = objc_msgSend(v9, "initWithFirst:second:", v5, 0);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BPSTuple first](v4, "first"));
    v11 = objc_msgSend(v10, "initWithFirst:second:", v12, v5);

    v5 = (BMStoreEvent *)v12;
  }

  return (BPSTuple *)v11;
}

BOOL sub_10000BA08(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "second"));

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10003DD88(v4);

  }
  return v3 != 0;
}

uint64_t sub_10000BA70(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000BA80(uint64_t a1)
{

}

BOOL sub_10000BA88(id a1, BPSTuple *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BPSTuple second](a2, "second"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "eventBody"));
  v4 = objc_msgSend(v3, "hasInUseStatus");

  return v4;
}

void sub_10000BAD8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003DDC8(v3, v4);

  }
}

void sub_10000BB38(uint64_t a1, void *a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  _OSActivityInterval *v25;
  _OSActivityInterval *v26;
  double v27;
  double v28;
  double v29;
  _OSActivityInterval *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint8_t buf[16];

  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v6 + 40);
  v7 = (id *)(v6 + 40);
  v8 = v9;
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "second"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "second"));
    v34 = +[OSIntelligenceUtilities isActiveBiomeActivityLevelEvent:](OSIntelligenceUtilities, "isActiveBiomeActivityLevelEvent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "first"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "first"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v15 = objc_msgSend(v14, "secondsFromGMT");
    if (v12)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "eventBody"));
      objc_msgSend(v2, "secondsFromGMT");
      if (v16 != (double)(uint64_t)v15)
      {

LABEL_12:
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Interval might be in different timezone; dropping interval",
            buf,
            2u);
        }

        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v24 = v5;
        v25 = *(_OSActivityInterval **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v24;
LABEL_25:

        goto LABEL_26;
      }
      if (!v13)
      {

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_16;
    }
    v32 = v14;
    v17 = v10;
    v18 = v11;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventBody", v32));
    objc_msgSend(v19, "secondsFromGMT");
    v21 = v20;

    if (v12)
    v11 = v18;
    v10 = v17;
    v14 = v33;
    if (v21 != (double)(uint64_t)v15)
      goto LABEL_12;
LABEL_16:
    v26 = [_OSActivityInterval alloc];
    objc_msgSend(v10, "timestamp");
    v28 = v27;
    objc_msgSend(v11, "timestamp");
    v30 = -[_OSActivityInterval initWithStartTime:andEndTime:andActiveStatus:](v26, "initWithStartTime:andEndTime:andActiveStatus:", v34, v28, v29);
    v25 = v30;
    if (v30 && -[_OSIInterval isValidInterval](v30, "isValidInterval"))
    {
      if (-[_OSActivityInterval hasReasonableDuration](v25, "hasReasonableDuration") && v34)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v25);
    }
    else
    {
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        sub_10003DE4C(v25, v31);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_25;
  }
  objc_storeStrong(v7, a2);
LABEL_26:

}

BOOL sub_10000C0DC(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  v5 = v4 > 0.0;

  return v5;
}

id sub_10000CABC(uint64_t a1, uint64_t a2)
{
  return (id)+[OSIntelligenceUtilities isIntervalTouchingTimewiseSlice:definedByReferenceDate:leftBoundary:rightBoundary:](OSIntelligenceUtilities, "isIntervalTouchingTimewiseSlice:definedByReferenceDate:leftBoundary:rightBoundary:", a2, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_10000CEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CEFC(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateTrialParameters");
    WeakRetained = v2;
  }

}

id sub_10000DCB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relevantEventDeadline");
}

void sub_10000E0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E100(uint64_t a1, int a2)
{
  id WeakRetained;
  double v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    state64 = 0;
    notify_get_state(a2, &state64);
    v4 = (double)state64;
    if (!state64)
      v4 = 300.0;
    objc_msgSend(WeakRetained, "percentStationaryOverDuration:", v4);
    v6 = v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v10 = v6;
      v11 = 2048;
      v12 = state64;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recent stationary duration: %.2f (%llu seconds)", buf, 0x16u);
    }

  }
}

void sub_10000E868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000E884(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "percentageStationaryWithActivity:untilDate:", a2, *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000EC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EC80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000EC90(uint64_t a1)
{

}

void sub_10000EC98(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a2;
  if (v5)
  {
    if (!a3)
    {
      v6 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v7 = v5;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
              v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "nextFireDate", (_QWORD)v20));
              v14 = (void *)v13;
              if (v12)
              {
                v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "earlierDate:", v13));
                v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v17 = *(void **)(v16 + 40);
                *(_QWORD *)(v16 + 40) = v15;

              }
              else
              {
                v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                v19 = *(void **)(v18 + 40);
                *(_QWORD *)(v18 + 40) = v13;
                v14 = v19;
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v9);
        }

      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000EF5C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100076850;
  qword_100076850 = (uint64_t)v1;

}

void sub_10000F6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F6F0(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "updateHandlers"));
    v4 = objc_msgSend(v3, "copy");

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "loadTrialUpdates");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) + 16))(*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9));
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

  }
}

void sub_10000F8A4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100076868;
  qword_100076868 = (uint64_t)v1;

}

void sub_100010B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010B78(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateTrialParameters");
    WeakRetained = v2;
  }

}

id sub_10001264C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000145DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000145FC(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updateTrialParameters:", *(unsigned __int8 *)(a1 + 40));
    WeakRetained = v3;
  }

}

void sub_100014C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014C8C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100014C9C(uint64_t a1)
{

}

void sub_100014CA4(uint64_t a1)
{
  double v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128));
  if (v2 < 900.0 && v2 > 0.0)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 112);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128);
      v14 = 134218754;
      v15 = v4;
      v16 = 2112;
      v17 = v5;
      v18 = 2048;
      v19 = 0x408C200000000000;
      v20 = 2112;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%ld) Input query for time %@ is within %f seconds for last query for %@", (uint8_t *)&v14, 0x2Au);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "timeIntervalSinceNow");
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(_QWORD *)(v8 + 136);
    if (v9 && v7 > -180.0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(v8 + 144));
    }
    else if (v9 && v7 > -1200.0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[OSIntelligenceUtilities lastLockDate](OSIntelligenceUtilities, "lastLockDate"));
      v11 = v10;
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 136))
        v12 = v10 == 0;
      else
        v12 = 1;
      if (!v12)
      {
        objc_msgSend(v10, "timeIntervalSinceDate:");
        if (v13 < 0.0)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 40) + 144));
      }

    }
  }
}

void sub_100014FC0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  double v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  id v52;
  double v53;
  double v54;
  double v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id obj;
  _QWORD v67[4];
  id v68;
  const __CFString *v69;
  void *v70;
  uint8_t buf[4];
  _BYTE v72[18];

  v2 = (void *)os_transaction_create("com.apple.osintelligence.inactivityprediction.twostage.predictionWithLockHistory");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  if (v4 && *(_QWORD *)(v3 + 80))
  {
    v64 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "modelDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputDescriptionsByName"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys"));

    v63 = (void *)v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityFeatureFactory inputFeaturesWithNames:atDate:withIntervalHistory:withContext:](_OSInactivityFeatureFactory, "inputFeaturesWithNames:atDate:withIntervalHistory:withContext:", v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionary"));
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 72);
      v12 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v11;
      *(_WORD *)&v72[4] = 2112;
      *(_QWORD *)&v72[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Engage features (%u), %@", buf, 0x12u);

    }
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
    if (v14 <= 0.0)
    {
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_1000155F8;
      v67[3] = &unk_100060C88;
      v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v68 = v15;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v67);
      v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)v72 = v17;
        *(_WORD *)&v72[8] = 2112;
        *(_QWORD *)&v72[10] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(%ld) Logging to Power Log: %@", buf, 0x16u);
      }
      v18 = objc_msgSend(v15, "copy");
      PLLogRegisteredEvent(24, CFSTR("InactivityFeatures"), v18, 0);

    }
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v20 + 40);
    v62 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "predictionFromFeatures:error:", v8, &obj));
    objc_storeStrong((id *)(v20 + 40), obj);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "featureValueForName:", CFSTR("classProbability")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dictionaryValue"));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKeyedSubscript:", &off_100064D30));
    objc_msgSend(v24, "doubleValue");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "modelDescription"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "inputDescriptionsByName"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "allKeys"));

    v61 = v9;
    if (objc_msgSend(v29, "containsObject:", CFSTR("engage_prob")))
    {
      v69 = CFSTR("engage_prob");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v26));
      v70 = v30;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));

    }
    else
    {
      v31 = 0;
    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityFeatureFactory inputFeaturesWithNames:atDate:withIntervalHistory:withContext:](_OSInactivityFeatureFactory, "inputFeaturesWithNames:atDate:withIntervalHistory:withContext:", v29, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v31));
    v39 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 112);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v60 = v29;
      v40 = v23;
      v41 = v21;
      v42 = *(_QWORD *)(a1 + 72);
      v43 = v39;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dictionary"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "description"));
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v42;
      v21 = v41;
      v23 = v40;
      *(_WORD *)&v72[4] = 2112;
      *(_QWORD *)&v72[6] = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Duration features (%u): %@", buf, 0x12u);

    }
    v46 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
    v47 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v65 = *(id *)(v47 + 40);
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "predictionFromFeatures:error:", v38, &v65, v60));
    objc_storeStrong((id *)(v47 + 40), v65);
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "featureValueForName:", CFSTR("predicted_duration")));
    objc_msgSend(v49, "doubleValue");
    v51 = v50;

    v52 = objc_alloc((Class)_OSInactivityPredictorOutput);
    objc_msgSend(*(id *)(a1 + 32), "confidenceThresholdRelaxed");
    v54 = v53;
    objc_msgSend(*(id *)(a1 + 32), "confidenceThresholdStrict");
    v56 = objc_msgSend(v52, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:", 1, v26, v54, v55, v51);
    v57 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v58 = *(void **)(v57 + 40);
    *(_QWORD *)(v57 + 40) = v56;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "adjustedPredictedDurationWithStrictLeeway:andRelaxedLeeway:andMaxPredictionCap:", *(double *)(*(_QWORD *)(a1 + 32) + 88), *(double *)(*(_QWORD *)(a1 + 32) + 96), 10.0);
    objc_msgSend(*(id *)(a1 + 32), "setLastInputDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setPredictionOutput:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(*(id *)(a1 + 32), "setLastPredictedDate:", v59);

    v2 = v64;
  }
  else
  {
    v32 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.OSIntelligence.InactivityPredictorTwoStage"), 404, &off_100065868));
    v33 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    v35 = objc_msgSend(objc_alloc((Class)_OSInactivityPredictorOutput), "initInvalidOutput");
    v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v37 = *(void **)(v36 + 40);
    *(_QWORD *)(v36 + 40) = v35;

  }
}

void sub_1000155F8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("recent_q95_1")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("recent_q95_2")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("recent_q75_1")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("recent_q75_2")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("recent_dur_med_1")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("woo_q95_1")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("woo_q95_2")) & 1) != 0
    || objc_msgSend(v9, "isEqualToString:", CFSTR("woo_q50_1")))
  {
    objc_msgSend(v5, "doubleValue");
    LODWORD(v7) = llround(v6 * 10.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v7));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

void sub_100015C68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100015CA0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015CB0(uint64_t a1)
{

}

void sub_100015CBC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  double v10;
  int v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "playbackState") == (id)1;
  v7 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v8 = *(NSObject **)(a1 + 32);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9)
      sub_10003E604(v8, (uint64_t)v3, v5);
  }
  else if (v9)
  {
    sub_10003E558(v8, (uint64_t)v3, v5);
  }
  objc_msgSend(v3, "timestamp");
  if (v10 >= *(double *)(a1 + 64))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
      && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24)
      && objc_msgSend(v6, "playbackState") == (id)1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
      v15 = v14;
      v16 = *(double *)(a1 + 64);
      objc_msgSend(v3, "timestamp");
      v18 = v17;
      if (v15 >= v16)
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
      else
        v19 = *(double *)(a1 + 64);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v18
                                                                  - v19
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    goto LABEL_17;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (v11)
  {
LABEL_17:
    v20 = v3;
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v20;
    goto LABEL_18;
  }
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = 0;
LABEL_18:

  objc_autoreleasePoolPop(v4);
}

void sub_10001612C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001615C(uint64_t a1, void *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "isEventNextSongPlaying:fromPreviousEvent:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if (v4)
    v7 = v6 - 1;
  else
    v7 = v6 + 1;
  *(_QWORD *)(v5 + 24) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v3;

}

void sub_100016268(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id sub_100016294()
{
  void *v0;

  return objc_msgSend(v0, "timestamp");
}

void sub_1000178B0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_100076870;
  qword_100076870 = (uint64_t)v1;

}

void sub_1000186D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000186F0(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateTrialParameters");
    WeakRetained = v2;
  }

}

void sub_1000196B4(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "location"));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", v2);

  v3 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "setRequestLocationSemaphore:", v3);

}

id sub_100019718(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRequestLocationSemaphore:", 0);
}

void sub_100019AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019AF0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100019B00(uint64_t a1)
{

}

void sub_100019B08(uint64_t a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  __CFString *v12;
  int v13;
  const __CFString *v14;

  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (v7 || !objc_msgSend(v6, "count"))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("No nearby LOI");
      if (v7)
        v9 = v7;
      v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No LOIs nearby: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = v10;
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count")));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ nearby LOIs", (uint8_t *)&v13, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100019CA8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  char v8;
  int v9;
  id v10;

  v3 = a2;
  v4 = objc_msgSend(v3, "count");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 72);
  if (v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v9 = 134217984;
      v10 = objc_msgSend(v3, "count");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No LoIs, but did see visits in the past. (%lu)", (uint8_t *)&v9, 0xCu);

    }
    v8 = 1;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_FAULT))
      sub_10003ECCC();
    v8 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_10001A2A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001A2C8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003ED04(v3);

  }
}

void sub_10001A328(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  double v19;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = *(double *)(a1 + 56);
  objc_msgSend(v3, "timestamp");
  v6 = v4 - v5;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = *(double *)(a1 + 56);
    v11 = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v10));
    objc_msgSend(v3, "timestamp");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v14 = 138412802;
    v15 = v12;
    v16 = 2112;
    v17 = v13;
    v18 = 2048;
    v19 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "working on event - plugin: %@ - event timestamp: %@ - diff: %f", (uint8_t *)&v14, 0x20u);

  }
  if (v6 > -60.0 && v6 < 60.0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time %@", (uint8_t *)&v14, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void sub_10001A958(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10001A9CC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003EDF8(v3);

  }
}

void sub_10001AA2C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

int64_t sub_10001AA64(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  BMStoreEvent *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[BMStoreEvent timestamp](a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[BMStoreEvent timestamp](v4, "timestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = objc_msgSend(v5, "compare:", v8);

  return (int64_t)v9;
}

uint64_t sub_10001AAFC(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  id *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v6 = objc_opt_class(BMDeviceTimeZone);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong(v8, a2);
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if (!*v8)
    goto LABEL_11;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v10 = objc_opt_class(BMDevicePluggedIn);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {

    goto LABEL_11;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v12 = objc_msgSend(v11, "hasStarting");

  if (!v12)
    goto LABEL_11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v14 = objc_msgSend(v13, "starting");

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(_DWORD *)(v15 + 24);
  if (v16 != -1 && v16 == v14)
    goto LABEL_11;
  *(_DWORD *)(v15 + 24) = v14;
  if ((v14 & 1) == 0)
    goto LABEL_11;
  v17 = 1;
LABEL_12:

  return v17;
}

void sub_10001AC2C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "log"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10003EE88(v3);

  }
  else
  {
    v7 = v5[9];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sink completed", v8, 2u);
    }
  }

}

void sub_10001ACD8(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "eventBody"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timeZone"));

  v6 = *(NSObject **)(a1[4] + 72);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      v8 = v6;
      objc_msgSend(v7, "timestamp");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v3, "timestamp");
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "working on event with timezone timestamp: %@ - plugin timestamp: %@", (uint8_t *)&v15, 0x16u);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "timeZone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "eventBody"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timeZone"));

    if (v11 == v13)
      v14 = a1[8];
    else
      v14 = a1[9];
    ++*(_DWORD *)(*(_QWORD *)(v14 + 8) + 24);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_10003EF18();
  }

}

void sub_10001B088(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "lastObject"));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestLocationSemaphore"));
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestLocationSemaphore"));
    dispatch_semaphore_signal(v4);

  }
}

void sub_10001B2D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10001B2EC(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

void sub_10001B2F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10001B49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B4B8(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("TrustedLux")))
  {
    v5 = objc_msgSend(v6, "intValue");
    if ((v5 & 0x80000000) == 0)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }

}

void sub_10001BFB4(id a1)
{
  OSChargingSignals *v1;
  void *v2;

  v1 = objc_alloc_init(OSChargingSignals);
  v2 = (void *)qword_100076888;
  qword_100076888 = (uint64_t)v1;

}

void sub_10001E8E8(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dictionaryForKey:", CFSTR("currentData")));
  v3 = objc_msgSend(v2, "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v3;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "dictionaryForKey:", CFSTR("analytics")));
  v7 = objc_msgSend(v6, "mutableCopy");
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 16);
  *(_QWORD *)(v8 + 16) = v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 24);
      *(_QWORD *)(v11 + 24) = v10;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", CFSTR("currentData"));
    }
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 24);
    *(_QWORD *)(v14 + 24) = v13;

  }
  v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v16)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("enabledDate")));
      if (v17)
      {
        v18 = (void *)v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", CFSTR("disabledDate")));

        if (!v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v21, CFSTR("disabledDate"));

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("analytics"));
        }
      }
    }
  }
  else
  {
    v22 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(void **)(v23 + 16);
    *(_QWORD *)(v23 + 16) = v22;

  }
  v25 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
    v27 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(v27 + 16);
    v28 = *(_QWORD *)(v27 + 24);
    v30 = 138412802;
    v31 = v26;
    v32 = 2112;
    v33 = v29;
    v34 = 2112;
    v35 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Restart = %@, Analytics is %@, Current Data is %@", (uint8_t *)&v30, 0x20u);

  }
}

void sub_10001EB80(uint64_t a1, int token)
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  uint64_t state64;
  uint8_t buf[4];
  void *v11;

  state64 = 0;
  notify_get_state(token, &state64);
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ECBC;
  block[3] = &unk_100060F30;
  v7 = *(id *)(a1 + 32);
  v8 = state64;
  dispatch_sync(v3, block);

  v4 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", state64));
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SPN State Change %@", buf, 0xCu);

  }
}

id sub_10001ECBC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewSPNState:", *(_QWORD *)(a1 + 40));
}

void sub_10001ECC8(uint64_t a1, int token)
{
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  BOOL v9;
  uint64_t state64;
  uint8_t buf[4];
  void *v12;

  state64 = 0;
  notify_get_state(token, &state64);
  v3 = state64 != 0;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EE18;
  block[3] = &unk_100060F08;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  dispatch_sync(v4, block);

  v5 = objc_claimAutoreleasedReturnValue(+[OSIntelligenceAnalyticsManager log](OSIntelligenceAnalyticsManager, "log"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", state64));
    *(_DWORD *)buf = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Interrupt State Change %@", buf, 0xCu);

  }
}

id sub_10001EE18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewInterruptNotificationStart:", *(unsigned __int8 *)(a1 + 40));
}

void sub_10001EEF8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 48)), "initWithTrialClient:withNamespace:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)qword_100076898;
  qword_100076898 = (uint64_t)v1;

}

id sub_100020858(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100020FE4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100021DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100021DDC(id a1, BMStoreEvent *a2)
{
  return 1;
}

void sub_100021DE4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F1F4(v3);

  }
}

uint64_t sub_100021E44(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  objc_msgSend(v3, "batteryPercentage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

  return 0;
}

void sub_1000220BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000220EC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000220FC(uint64_t a1)
{

}

void sub_100022104(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F2CC(v3);

  }
}

void sub_100022164(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  unint64_t v13;
  NSObject *v14;

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v6 + 40))
    goto LABEL_4;
  objc_msgSend(v4, "timestamp");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timestamp");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody"));
  objc_msgSend(v11, "batteryPercentage");
  v13 = (uint64_t)v12;

  if (v13 < 0x65)
  {
    *(double *)(*(_QWORD *)(a1 + 48) + 8 * v13) = v8 - v10 + *(double *)(*(_QWORD *)(a1 + 48) + 8 * v13);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v6 + 40), a2);
    goto LABEL_8;
  }
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "log"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_10003F35C(v13);

LABEL_8:
}

void sub_100022A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100022A80(id a1, BMStoreEvent *a2)
{
  return 1;
}

void sub_100022A88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F4A8(v3);

  }
}

BOOL sub_100022AE8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));
  v5 = objc_msgSend(v4, "starting");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "timestamp");
    v6 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = 1;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == 0;
  }

  return v9;
}

void sub_100022DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100022DE0(id a1, BMStoreEvent *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = objc_msgSend(v2, "hasInUseStatus");

  return v3;
}

void sub_100022E18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F534(v3);

  }
}

BOOL sub_100022E78(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "eventBody"));
  v4 = objc_msgSend(v3, "inUseStatus") & 5;

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v4 == 0;
}

void sub_1000233A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

int64_t sub_1000233E4(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  BMStoreEvent *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[BMStoreEvent timestamp](a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[BMStoreEvent timestamp](v4, "timestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = objc_msgSend(v5, "compare:", v8);

  return (int64_t)v9;
}

void sub_10002347C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F5C4(v3);

  }
}

void sub_1000234DC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  _OSIntelligenceChargeSession *v29;
  uint64_t v30;
  void *v31;
  double v32;
  uint64_t v33;
  void *v34;
  id v35;

  v35 = a2;
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventBody"));
  v5 = objc_opt_class(BMDeviceTimeZone);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) == 0)
  {
    v9 = v35;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventBody"));
    if (objc_msgSend(v10, "starting"))
    {
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

      if (!v11)
      {
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v13 = v9;
        v14 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v13;
        goto LABEL_17;
      }
    }
    else
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventBody"));
    if ((objc_msgSend(v14, "starting") & 1) == 0)
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

      if (!v15)
        goto LABEL_18;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody"));
      v17 = 0.0;
      if (objc_msgSend(v16, "hasSecondsFromGMT"))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 40), "eventBody"));
        objc_msgSend(v18, "secondsFromGMT");
        v17 = v19;

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v17 + v20));
      objc_msgSend(v9, "timestamp");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v17 + v21));
      v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "endDate"));
        objc_msgSend(v14, "timeIntervalSinceDate:", v24);
        v26 = v25;
        v27 = *(double *)(a1 + 64);

        if (v26 < v27)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate"));

          v14 = (void *)v28;
        }
      }
      v29 = -[_OSIntelligenceChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:]([_OSIntelligenceChargeSession alloc], "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v14, v22, 0, 0);
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      objc_msgSend(v22, "timeIntervalSinceDate:", v14);
      if (v32 >= *(double *)(a1 + 72))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = 0;

    }
LABEL_17:

    goto LABEL_18;
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = v35;
  v9 = *(id *)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v8;
LABEL_18:

  objc_autoreleasePoolPop(v3);
}

void sub_100023BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Block_object_dispose((const void *)(v55 - 192), 8);
  _Unwind_Resume(a1);
}

int64_t sub_100023C24(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  BMStoreEvent *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[BMStoreEvent timestamp](a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[BMStoreEvent timestamp](v4, "timestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = objc_msgSend(v5, "compare:", v8);

  return (int64_t)v9;
}

void sub_100023CBC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003F5C4(v3);

  }
}

void sub_100023D1C(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  uint64_t v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  _OSIntelligenceChargeSession *v34;
  void *v35;
  void *v36;
  void *v37;
  _OSIntelligenceChargeSession *v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;

  v4 = a2;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
  v7 = objc_opt_class(BMDeviceBatteryLevel);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "eventBody"));
    v11 = objc_opt_class(BMDeviceTimeZone);
    v12 = objc_opt_isKindOfClass(v10, v11);

    if ((v12 & 1) != 0)
    {
      v9 = *(_QWORD *)(a1 + 40);
      goto LABEL_5;
    }
    v13 = v4;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventBody"));
    if (objc_msgSend(v14, "starting"))
    {
      v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (!v15)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 40), "eventBody"));
        objc_msgSend(v16, "batteryPercentage");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)v17;
        goto LABEL_11;
      }
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventBody"));
    if ((objc_msgSend(v16, "starting") & 1) == 0)
    {
      v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (v18)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 40), "eventBody"));
        v20 = 0.0;
        if (objc_msgSend(v19, "hasSecondsFromGMT"))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 40), "eventBody"));
          objc_msgSend(v21, "secondsFromGMT");
          v20 = v22;

        }
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v20 + v23));
        objc_msgSend(v13, "timestamp");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v20 + v25));
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "endDate"));
          objc_msgSend(v24, "timeIntervalSinceDate:", v28);
          v30 = v29;
          v31 = *(double *)(a1 + 80);

          if (v30 < v31)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "startDate"));

            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                               + 40), "startSoC"));
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v33, "intValue");

            v24 = (void *)v32;
          }
        }
        v34 = [_OSIntelligenceChargeSession alloc];
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 40), "eventBody"));
        objc_msgSend(v36, "batteryPercentage");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        v38 = -[_OSIntelligenceChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:](v34, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v24, v26, v35, v37);
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v40 = *(void **)(v39 + 40);
        *(_QWORD *)(v39 + 40) = v38;

        objc_msgSend(v26, "timeIntervalSinceDate:", v24);
        if (v41 >= *(double *)(a1 + 88))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                             + 40), "eventBody"));
          objc_msgSend(v42, "batteryPercentage");
          v44 = v43;
          v45 = *(double *)(a1 + 96);

          if (v44 >= v45)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 104), "log"));
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
              sub_10003F654(a1 + 64, v46, v47, v48, v49, v50, v51, v52);

          }
        }
        v53 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v54 = *(void **)(v53 + 40);
        *(_QWORD *)(v53 + 40) = 0;

        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -1;
      }
      goto LABEL_24;
    }
LABEL_11:

LABEL_24:
    goto LABEL_25;
  }
  v9 = *(_QWORD *)(a1 + 32);
LABEL_5:
  objc_storeStrong((id *)(*(_QWORD *)(v9 + 8) + 40), a2);
LABEL_25:
  objc_autoreleasePoolPop(v5);

}

int64_t sub_100025AD8(id a1, _OSIIntervalProtocol *a2, _OSIIntervalProtocol *a3)
{
  _OSIIntervalProtocol *v4;
  _OSIIntervalProtocol *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v4 = a3;
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIIntervalProtocol endDate](v5, "endDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIIntervalProtocol startDate](v5, "startDate"));

  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIIntervalProtocol endDate](v4, "endDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_OSIIntervalProtocol startDate](v4, "startDate"));

  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  if (v9 > v13)
    return -1;
  else
    return v9 < v13;
}

void sub_10002613C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10002616C(id a1, BMStoreEvent *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = objc_msgSend(v2, "starting");

  return v3;
}

uint64_t sub_1000261A8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "timestamp");
  v3 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

void sub_100026598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000265D8(id a1, BMStoreEvent *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = objc_msgSend(v2, "hasInUseStatus");

  return v3;
}

uint64_t sub_100026614(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

void sub_100029B20(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100029B48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

double sub_100029B54@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D0>, float a4@<S1>)
{
  double result;

  result = -a3;
  *(float *)a1 = a4;
  *(double *)(a1 + 4) = result;
  *(_WORD *)(a1 + 12) = 2112;
  *(_QWORD *)(a1 + 14) = a2;
  return result;
}

void sub_100029B70(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_100029F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100029FA4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "updateTrialParameters");
    WeakRetained = v2;
  }

}

void sub_10002A540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_10002A570(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  BOOL v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  double v23;
  int v24;
  double v25;
  __int16 v26;
  id v27;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "showsSignificantInactivity:", v6))
  {
    objc_msgSend(*(id *)(a1 + 40), "setHour:", (int)objc_msgSend(v5, "intValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "dateFromComponents:", *(_QWORD *)(a1 + 40)));
    objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    if (v8 == 0.0)
    {
      objc_msgSend(v6, "averageDuration");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                              + 24);
      v21 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = v21;
        objc_msgSend(v6, "averageDuration");
        v24 = 134218242;
        v25 = v23;
        v26 = 2112;
        v27 = v5;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, " Using %.1fh from hour %@", (uint8_t *)&v24, 0x16u);

      }
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    }
    else
    {
      objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      if (v9 > 0.0)
      {
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0));

        v7 = (void *)v10;
      }
      objc_msgSend(v6, "averageDuration");
      v12 = v11 * 3600.0;
      v13 = v11 < 8.0;
      v14 = 28800.0;
      if (v13)
        v14 = v12;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", v14));
      objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      v17 = v16;

      if (v17 > 0.0)
      {
        v18 = v17 / 3600.0;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v18
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
        v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 80);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 134218242;
          v25 = v18;
          v26 = 2112;
          v27 = v5;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " Using %.1fh from hour %@", (uint8_t *)&v24, 0x16u);
        }
      }
    }

  }
}

void sub_10002B78C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSDateFormatter);
  v2 = (void *)qword_1000768B0;
  qword_1000768B0 = (uint64_t)v1;

  objc_msgSend((id)qword_1000768B0, "setDateStyle:", 1);
  objc_msgSend((id)qword_1000768B0, "setTimeStyle:", 1);
}

void sub_10002E184(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10002E46C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)objc_opt_class(*(_QWORD *)(a1 + 32)));
  v2 = (void *)qword_1000768B8;
  qword_1000768B8 = (uint64_t)v1;

}

void sub_10002E9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Unwind_Resume(a1);
}

int64_t sub_10002E9FC(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  BMStoreEvent *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  -[BMStoreEvent timestamp](a2, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[BMStoreEvent timestamp](v4, "timestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v9 = objc_msgSend(v5, "compare:", v8);

  return (int64_t)v9;
}

BOOL sub_10002EA94(id a1, BMStoreEvent *a2)
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](a2, "eventBody"));
  v3 = v2 != 0;

  return v3;
}

BPSTuple *__cdecl sub_10002EAC8(id a1, BPSTuple *a2, BMStoreEvent *a3)
{
  BPSTuple *v4;
  BMStoreEvent *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMStoreEvent eventBody](v5, "eventBody"));
  v7 = objc_opt_class(BMDeviceTimeZone);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = objc_alloc((Class)BPSTuple);
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v11 = objc_msgSend(v9, "initWithFirst:second:", v5, 0);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BPSTuple first](v4, "first"));
    v11 = objc_msgSend(v10, "initWithFirst:second:", v12, v5);

    v5 = (BMStoreEvent *)v12;
  }

  return (BPSTuple *)v11;
}

BOOL sub_10002EB8C(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "second"));

  if (!v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10003DD88(v4);

  }
  return v3 != 0;
}

uint64_t sub_10002EBF4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002EC04(uint64_t a1)
{

}

BOOL sub_10002EC0C(id a1, BPSTuple *a2)
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BPSTuple second](a2, "second"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "eventBody"));
  v4 = objc_msgSend(v3, "hasStarting");

  return v4;
}

void sub_10002EC5C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003FE70(v3, v4);

  }
}

void sub_10002ECBC(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  _OSLockInterval *v25;
  _OSLockInterval *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t v32[16];
  uint8_t buf[16];

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v7 = v8;
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "second"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "second"));
    v11 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "isLockedBiomeScreenLockedEvent:", v9);
    if ((_DWORD)v11 == objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "isLockedBiomeScreenLockedEvent:", v10))
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Duplicate lock state; stitching by caching last state",
          buf,
          2u);
      }
      goto LABEL_29;
    }
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                           + 40), "first"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "first"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone systemTimeZone](NSTimeZone, "systemTimeZone"));
    v15 = objc_msgSend(v14, "secondsFromGMT");
    v31 = v14;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject eventBody](v12, "eventBody"));
      objc_msgSend(v14, "secondsFromGMT");
      if (v16 != (double)(uint64_t)v15)
      {

LABEL_15:
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Interval might be in different timezone; dropping interval",
            v32,
            2u);
        }

        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v23 = v4;
        v24 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v23;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      if (!v13)
      {

        goto LABEL_19;
      }
    }
    else if (!v13)
    {
      goto LABEL_19;
    }
    v29 = v9;
    v17 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "eventBody"));
    objc_msgSend(v18, "secondsFromGMT");
    v20 = v19;

    if (v12)
    v13 = v17;
    v9 = v29;
    if (v20 != (double)(uint64_t)v15)
      goto LABEL_15;
LABEL_19:
    objc_msgSend(v9, "timestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v10, "timestamp");
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    v25 = -[_OSLockInterval initWithStartDate:andEndDate:andIsLocked:]([_OSLockInterval alloc], "initWithStartDate:andEndDate:andIsLocked:", v24, v30, v11);
    v26 = v25;
    if (v25 && -[_OSIInterval isValidInterval](v25, "isValidInterval"))
    {
      if (-[_OSLockInterval hasReasonableDuration](v26, "hasReasonableDuration"))
      {
        if ((_DWORD)v11)
          v27 = *(_QWORD *)(a1 + 48);
        else
          v27 = *(_QWORD *)(a1 + 56);
        objc_msgSend(*(id *)(*(_QWORD *)(v27 + 8) + 40), "addObject:", v26);
      }
    }
    else
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        sub_10003DE4C(v26, v28);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

    goto LABEL_28;
  }
  objc_storeStrong(v6, a2);
LABEL_30:

}

void sub_10002FF30(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.osintelligence.inactivity"));
  v2 = (void *)qword_1000768C8;
  qword_1000768C8 = (uint64_t)v1;

}

void sub_10002FFA4(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.osintelligence.chargingpredictor"));
  v2 = (void *)qword_1000768D8;
  qword_1000768D8 = (uint64_t)v1;

}

void sub_100030FB0(uint64_t a1, void *a2)
{
  _OSHighBatteryDrainHighChargeDurationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[_OSHighBatteryDrainHighChargeDurationModel initWithMLModel:]([_OSHighBatteryDrainHighChargeDurationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100031248(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, _OSHighBatteryDrainHighChargeDurationModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("label")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[_OSHighBatteryDrainHighChargeDurationModelOutput initWithLabel:classProbability:](v6, "initWithLabel:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, _OSHighBatteryDrainHighChargeDurationModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100031418(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _OSHighBatteryDrainHighChargeDurationModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, _OSHighBatteryDrainHighChargeDurationModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("label")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[_OSHighBatteryDrainHighChargeDurationModelOutput initWithLabel:classProbability:](v6, "initWithLabel:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, _OSHighBatteryDrainHighChargeDurationModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100032164(uint64_t a1, void *a2)
{
  _OSHighBatteryDrainLowChargeDurationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[_OSHighBatteryDrainLowChargeDurationModel initWithMLModel:]([_OSHighBatteryDrainLowChargeDurationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1000323FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, _OSHighBatteryDrainLowChargeDurationModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [_OSHighBatteryDrainLowChargeDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("label")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[_OSHighBatteryDrainLowChargeDurationModelOutput initWithLabel:classProbability:](v6, "initWithLabel:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, _OSHighBatteryDrainLowChargeDurationModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_1000325CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _OSHighBatteryDrainLowChargeDurationModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, _OSHighBatteryDrainLowChargeDurationModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [_OSHighBatteryDrainLowChargeDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("label")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[_OSHighBatteryDrainLowChargeDurationModelOutput initWithLabel:classProbability:](v6, "initWithLabel:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, _OSHighBatteryDrainLowChargeDurationModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100033314(uint64_t a1, void *a2)
{
  base_duration *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[base_duration initWithMLModel:]([base_duration alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10003356C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_durationOutput *v6;
  void *v7;
  base_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, base_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [base_durationOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, base_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_1000336F4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_durationOutput *v6;
  void *v7;
  base_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, base_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [base_durationOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, base_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_100034470(uint64_t a1, void *a2)
{
  base_engage *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[base_engage initWithMLModel:]([base_engage alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100034708(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_engageOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  base_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, base_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [base_engageOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[base_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, base_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_1000348D8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  base_engageOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  base_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, base_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [base_engageOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[base_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, base_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100035808(uint64_t a1, void *a2)
{
  durationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[durationModel initWithMLModel:]([durationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100035A60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  durationModelOutput *v6;
  void *v7;
  durationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, durationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [durationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_100035BE8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  durationModelOutput *v6;
  void *v7;
  durationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, durationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [durationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, durationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_100036B84(uint64_t a1, void *a2)
{
  engageOnPlugin *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[engageOnPlugin initWithMLModel:]([engageOnPlugin alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100036E1C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageOnPluginOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  engageOnPluginOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageOnPluginOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageOnPluginOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[engageOnPluginOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageOnPluginOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100036FEC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageOnPluginOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  engageOnPluginOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageOnPluginOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageOnPluginOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[engageOnPluginOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageOnPluginOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100037E30(uint64_t a1, void *a2)
{
  easy_engage *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[easy_engage initWithMLModel:]([easy_engage alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_1000380C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  easy_engageOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  easy_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, easy_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [easy_engageOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[easy_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, easy_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100038298(uint64_t a1, void *a2, void *a3)
{
  id v5;
  easy_engageOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  easy_engageOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, easy_engageOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [easy_engageOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[easy_engageOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, easy_engageOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_100038FE8(uint64_t a1, void *a2)
{
  long_duration *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[long_duration initWithMLModel:]([long_duration alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_100039240(uint64_t a1, void *a2, void *a3)
{
  id v5;
  long_durationOutput *v6;
  void *v7;
  long_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, long_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [long_durationOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, long_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_1000393C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  long_durationOutput *v6;
  void *v7;
  long_durationOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, long_durationOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [long_durationOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, long_durationOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_10003A270(uint64_t a1, void *a2)
{
  longDurationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[longDurationModel initWithMLModel:]([longDurationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10003A4C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  longDurationModelOutput *v6;
  void *v7;
  longDurationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, longDurationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [longDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[longDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, longDurationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_10003A650(uint64_t a1, void *a2, void *a3)
{
  id v5;
  longDurationModelOutput *v6;
  void *v7;
  longDurationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, longDurationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [longDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[longDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, longDurationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_10003B538(uint64_t a1, void *a2)
{
  shortDurationModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[shortDurationModel initWithMLModel:]([shortDurationModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10003B790(uint64_t a1, void *a2, void *a3)
{
  id v5;
  shortDurationModelOutput *v6;
  void *v7;
  shortDurationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, shortDurationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [shortDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[shortDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, shortDurationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_10003B918(uint64_t a1, void *a2, void *a3)
{
  id v5;
  shortDurationModelOutput *v6;
  void *v7;
  shortDurationModelOutput *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, shortDurationModelOutput *);
  id v11;

  v11 = a2;
  if (v11)
  {
    v5 = a3;
    v6 = [shortDurationModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "featureValueForName:", CFSTR("duration_pred")));
    objc_msgSend(v7, "doubleValue");
    v8 = -[shortDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void (**)(uint64_t, _QWORD, shortDurationModelOutput *))(v9 + 16);
    v8 = a3;
    v10(v9, 0, v8);
  }

}

void sub_10003C8B4(uint64_t a1, void *a2)
{
  engageModel *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[engageModel initWithMLModel:]([engageModel alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void sub_10003CB4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  engageModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[engageModelOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_10003CD1C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  engageModelOutput *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  engageModelOutput *v11;
  uint64_t v12;
  void (*v13)(uint64_t, _QWORD, engageModelOutput *);
  id v14;

  v14 = a2;
  if (v14)
  {
    v5 = a3;
    v6 = [engageModelOutput alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("engage")));
    v8 = objc_msgSend(v7, "int64Value");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "featureValueForName:", CFSTR("classProbability")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dictionaryValue"));
    v11 = -[engageModelOutput initWithEngage:classProbability:](v6, "initWithEngage:classProbability:", v8, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void (**)(uint64_t, _QWORD, engageModelOutput *))(v12 + 16);
    v11 = a3;
    v13(v12, 0, v11);
  }

}

void sub_10003D140()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100007044();
  sub_100007010((void *)&_mh_execute_header, v0, v1, "Error projecting date of history sufficiency: %@. Default to 7 days since now", v2);
  sub_10000701C();
}

void sub_10003D1A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Failed to set activity state to done", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003D1D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Asked to defer activity. Ending evaluation task. Model type unknown", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003D1FC(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[_OSInactivityPredictor deviceUsageDiagnosis](_OSInactivityPredictor, "deviceUsageDiagnosis"));
  sub_100007044();
  sub_100007010((void *)&_mh_execute_header, v1, v3, "[WARNING] DEVICE RARELY USED\n%@", v4);

  sub_10000708C();
}

void sub_10003D290()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Client is not entitled for query.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003D2BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a1, a3, "Wait time overridden to %.2f sec", a5, a6, a7, a8, 0);
  sub_10000701C();
}

void sub_10003D324(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  sub_100007080((void *)&_mh_execute_header, a3, (uint64_t)a3, "(%ld) Model output overridden to %@", (uint8_t *)&v3);
  sub_10000701C();
}

void sub_10003D39C(void *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  v6 = 134218242;
  v7 = a2;
  v8 = 2112;
  v9 = v4;
  sub_100007080((void *)&_mh_execute_header, v3, v5, "(%ld) %@ is out of time range; returning low confidence prediction",
    (uint8_t *)&v6);

  sub_100007070();
}

void sub_10003D448()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100007044();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error querying model at date %@: %@", v2, 0x16u);
  sub_10000701C();
}

void sub_10003D4C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "Model output overridden to %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003D524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "%@ is out of time range; returning low confidence prediction",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_10000701C();
}

void sub_10003D584()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100007058();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "User has overridden to use time restriction during (%d, %d)", v1, 0xEu);
  sub_10000701C();
}

void sub_10003D5FC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100007044();
  sub_100007010((void *)&_mh_execute_header, v0, v1, "Error unarchiving overridden output: %@", v2);
  sub_10000701C();
}

void sub_10003D660()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007098();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Desired Output is nil; deleting overriden model output from user defaults...",
    v1,
    2u);
  sub_100007050();
}

void sub_10003D698()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100007058();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid input range (%d,%d).\nBedtime and wakeup time cannot be the same and must be in range [0, 23]", v1, 0xEu);
  sub_10000701C();
}

void sub_10003D710(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "predictor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "predictorType"));
  sub_100007044();
  sub_100007010((void *)&_mh_execute_header, v3, v6, "Upgraded model but model is still model-independent: %@. Upgrade failed.", v7);

  sub_100007070();
}

void sub_10003D7B4(os_log_t log)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = 293;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating Trial Client for Project %d", (uint8_t *)v1, 8u);
}

void sub_10003D830(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Loading primative factors", v1, 2u);
}

void sub_10003D870(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a2, a3, "Loading compiled model from %@", a5, a6, a7, a8, 2u);
}

void sub_10003D8D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a1, a3, "Extracting model paths from Namespace %@", a5, a6, a7, a8, 2u);
}

void sub_10003D94C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error creating MLDictionaryFeatureProvider: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003D9AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Empty feature name!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003D9D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Empty query date!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003DA04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Empty historical events!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003DA30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Feature name %@ is not recognized.", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DA90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Empty inactivity history!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003DABC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Requested history subset \"%@\" is not recognized", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DB1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Unknown strata type from feature %@. Defaulting to ALL.", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DB7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error building regex to extract prefix string: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DBDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error building regex to extract suffix number: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DC3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Trying to extract percentile number from empty feature name; returning nil",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_100007050();
}

void sub_10003DC68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error building regex to extract percentile number: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DCC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error building regex to extract quantile number: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DD28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error building regex to extract watershed tuple: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003DD88(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "<tz event, nil> occurs because timezone updated; ignoring tuple...",
    v1,
    2u);
}

void sub_10003DDC8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v5 = 138412290;
  v6 = v3;
  sub_100007010((void *)&_mh_execute_header, a2, v4, "Error reading activity levels from Biome: %@", (uint8_t *)&v5);

  sub_10000708C();
}

void sub_10003DE4C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Dropping nil or invalid interval: %@", (uint8_t *)&v4, 0xCu);

  sub_10000708C();
}

void sub_10003DED8(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "allIntervalsSortByStartAsc"));
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "intervalsSameDayOfWeekAsQuery"));
  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "intervalsSameWorkOrOffAsQuery"));
  v11 = objc_msgSend(v10, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "intervalsRecentFromQuery"));
  v13 = 138413314;
  v14 = a1;
  v15 = 2048;
  v16 = v7;
  v17 = 2048;
  v18 = v9;
  v19 = 2048;
  v20 = v11;
  v21 = 2048;
  v22 = objc_msgSend(v12, "count");
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Updated strata sizes with date %@: all=%lu | dow=%lu | woo=%lu | recent=%lu", (uint8_t *)&v13, 0x34u);

}

void sub_10003E014(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100007010((void *)&_mh_execute_header, a2, a3, "Unknown strata type %lu; default to all", (uint8_t *)&v3);
}

void sub_10003E080(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;

  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid boundary arguments: (%.2f, %.2f)", (uint8_t *)&v3, 0x16u);
}

void sub_10003E104(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Activities: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003E178(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timeout! Took too long to query motion activity. Return 100%% stationary.", v1, 2u);
}

void sub_10003E1B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007034((void *)&_mh_execute_header, a1, a3, "Low SOC prediction is currently not supported!", a5, a6, a7, a8, 0);
}

void sub_10003E1EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007034((void *)&_mh_execute_header, a1, a3, "Client is not entitled for query.", a5, a6, a7, a8, 0);
}

void sub_10003E220(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reporting sleep suppression query event to CA: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003E294(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, " In schedule but next sleep event not found -> in sleep window", v1, 2u);
}

void sub_10003E2D4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Is %@ in sleep window?", (uint8_t *)&v2, 0xCu);
}

void sub_10003E348(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "User chose model type %lu which is not supported; instantiating normally...",
    (uint8_t *)&v2,
    0xCu);
}

void sub_10003E3BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a2, a3, "Creating %@ inactivity predictor", a5, a6, a7, a8, 2u);
  sub_10000701C();
}

void sub_10003E438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a1, a3, "Extracting thresholds and leeways from Namespace %@", a5, a6, a7, a8, 2u);
  sub_10000701C();
}

void sub_10003E4A8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Reading metadata from models", v1, 2u);
}

void sub_10003E4E8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a1, a3, "Extracting model paths from Namespace %@", a5, a6, a7, a8, 2u);
  sub_10000701C();
}

void sub_10003E558(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = a1;
  sub_100016294();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "title"));
  sub_10001627C();
  sub_100016268((void *)&_mh_execute_header, v8, v9, "Playback ended at %@ (%@)", v10, v11, v12, v13, v14);

  sub_100007070();
}

void sub_10003E604(void *a1, uint64_t a2, void *a3)
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = a1;
  sub_100016294();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "title"));
  sub_10001627C();
  sub_100016268((void *)&_mh_execute_header, v8, v9, "Playback started at %@ (%@)", v10, v11, v12, v13, v14);

  sub_100007070();
}

void sub_10003E6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "weekday24 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E710()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "weekday8 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E770()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "weekday4 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E7D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "weekday2 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E830()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "weekday1 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E890()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin24 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E8F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin16 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E950()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin8 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003E9B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin4 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003EA10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin2 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003EA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "hourBin1 events: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003EAD0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Model output overridden to %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EB44(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Client is not entitled for query.", v1, 2u);
}

void sub_10003EB84(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error unarchiving overridden output: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EBF8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Desired Output is nil; deleting overriden model output from user defaults...",
    v1,
    2u);
}

void sub_10003EC38()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100007044();
  sub_10001B2F4((void *)&_mh_execute_header, v0, v1, "likelyToBeInKnownArea result %@", v2);
}

void sub_10003ECA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Error: Timeout occurred to obtain LsOI", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003ECCC()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007098();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "No LoI visists in three days", v1, 2u);
  sub_100007050();
}

void sub_10003ED04(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting KML in signalMonitor: %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003ED94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "ERROR: Couldn't get current time zone in signal monitor", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003EDC0(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  *(_DWORD *)a1 = 134217984;
  *(double *)(a1 + 4) = a4;
  sub_10001B2F4((void *)&_mh_execute_header, a2, a3, "current time zone: %f", (uint8_t *)a1);
}

void sub_10003EDF8(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting TimeZone biome events in signal monitor: %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003EE88(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting Timezone/plugin biome events in signal monitor: %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003EF18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "No timezone in event!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003EF44()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100007098();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Location manager: didUpdateLocations", v1, 2u);
  sub_100007050();
}

void sub_10003EF7C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003EFF0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100007044();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", v1, 0xCu);
  sub_10000701C();
}

void sub_10003F05C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007034((void *)&_mh_execute_header, a1, a3, "Error! End interrupt without start", a5, a6, a7, a8, 0);
}

void sub_10003F090(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Negative progress for interrupt with %@", (uint8_t *)&v3, 0xCu);
}

void sub_10003F108(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007034((void *)&_mh_execute_header, a1, a3, "Error: Can't log overpredict without start date!", a5, a6, a7, a8, 0);
}

void sub_10003F13C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "loadHistoryFromUnderlyingDataSource() must be overridden in a subclass!", v1, 2u);
}

void sub_10003F17C()
{
  uint64_t v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;

  sub_100007044();
  v4 = 2048;
  v5 = v0;
  sub_100029B20((void *)&_mh_execute_header, v1, v2, "Battery level at %@ is %lf", v3);
  sub_10000701C();
}

void sub_10003F1F4(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v3, v4, "Error getting battery level biome events in batteryLevelAtDate %@", v5, v6, v7, v8, v9);

  sub_100007070();
}

void sub_10003F280(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  sub_100007010((void *)&_mh_execute_header, a3, (uint64_t)a3, "Skipping battery level %@", (uint8_t *)a2);

}

void sub_10003F2CC(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting battery stream in batteryLevelDurations: %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003F35C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1));
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v2, v3, "Skipping battery level %@", v4, v5, v6, v7, v8);

}

void sub_10003F3E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "ERROR: No battery events!", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F414()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Error getting Biome plugged-in events. Returning current time.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F440()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Last plugged-in date is in the future. Returning current time.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F46C(uint64_t a1, uint64_t a2, double a3)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100029B54(a2, *(_QWORD *)(*(_QWORD *)a1 + 40), a3, 3.8521e-34);
  sub_100029B20((void *)&_mh_execute_header, v3, v4, "Last plug-in was %.2f seconds ago at %@", v5);
}

void sub_10003F4A8(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v3, v4, "Error getting plugged in biome events in lastPluggedInDate %@", v5, v6, v7, v8, v9);

  sub_100007070();
}

void sub_10003F534(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting plugin biome events in deviceWasActive - %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003F5C4(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
  sub_10001B2EC(v3, v4);
  sub_100007044();
  sub_10001B2D8((void *)&_mh_execute_header, v5, v6, "Error getting plugin biome events in pluginEventsBefore - %s", v7, v8, v9, v10, v11);

  sub_100007070();
}

void sub_10003F654(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007024((void *)&_mh_execute_header, a2, a3, "  %@", a5, a6, a7, a8, 2u);
  sub_10000701C();
}

void sub_10003F6C4()
{
  int v0;
  os_log_t v1;
  uint8_t v2[24];

  sub_100029B30();
  sub_100029B20((void *)&_mh_execute_header, v0, v1, "Timeline event '%@' exists %@", v2);
  sub_10000701C();
}

void sub_10003F728()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Input interval is nil", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F754()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100029B84();
  sub_100029B48((void *)&_mh_execute_header, v0, v1, "Invalid arguments: (%.2f, %.2f)", v2);
  sub_10000701C();
}

void sub_10003F7BC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100029B30();
  sub_100029B48((void *)&_mh_execute_header, v0, (uint64_t)v0, "Bad input point(s): Points should be arrays of length 2. PointA = %@. PointB = %@", v1);
  sub_10000701C();
}

void sub_10003F824(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "startDate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "endDate"));
  sub_100029B9C();
  sub_100029B70((void *)&_mh_execute_header, v4, v5, "Invalid event in question (%@, %@) has negative duration of %.2f sec", v6, v7, v8, v9, v10);

}

void sub_10003F8E0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "endDate"));
  sub_100029B9C();
  sub_100029B70((void *)&_mh_execute_header, v5, v6, "Error calculating intersected duration for a date %@ out of bounds of event(%@, %@)", v7, v8, v9, v10, v11);

}

void sub_10003F994()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Error getting Biome lock events. Returning nil.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Last lock date is in the future. Returning nil.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003F9EC(uint64_t a1, uint64_t a2, double a3)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100029B54(a2, *(_QWORD *)(*(_QWORD *)a1 + 40), a3, 3.8521e-34);
  sub_100029B20((void *)&_mh_execute_header, v3, v4, "Last lock was %.2f seconds ago at %@", v5);
}

void sub_10003FA28()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100007044();
  sub_100007010((void *)&_mh_execute_header, v0, v1, "Cannot find any activity event with endDate %@!", v2);
  sub_10000701C();
}

void sub_10003FA8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007098();
  sub_100007034((void *)&_mh_execute_header, v0, v1, "Found event in the future. Returning 0 second.", v2, v3, v4, v5, v6);
  sub_100007050();
}

void sub_10003FAB8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100029B30();
  sub_100029B48((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error loading model content from %@: %@", v1);
  sub_10000701C();
}

void sub_10003FB20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_100007024((void *)&_mh_execute_header, v0, v1, "Loading compiled model from %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003FB80(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Computing for hour %ld", buf, 0xCu);
}

void sub_10003FBC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error loading model from path: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003FC24()
{
  uint64_t v0;
  os_log_t v1;

  sub_100029B30();
  sub_10002E184((void *)&_mh_execute_header, v0, v1, "Error loading updated model from path (%@): %@");
  sub_10000701C();
}

void sub_10003FC84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003FCE4(void *a1, uint64_t a2)
{
  NSObject *v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  uint8_t v7[24];

  v3 = a1;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
  sub_100007044();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "nil model for class: %@", v7, 0xCu);

}

void sub_10003FDB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "Compile model error: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003FE10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007044();
  sub_10000AE78((void *)&_mh_execute_header, v0, v1, "model url reachability error: %@", v2, v3, v4, v5, v6);
  sub_10000701C();
}

void sub_10003FE70(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading screen tz-lock tuples from Biome: %@", (uint8_t *)&v4, 0xCu);

  sub_10000708C();
}

void sub_10003FEFC()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load _OSHighBatteryDrainHighChargeDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_10003FF40()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load _OSHighBatteryDrainLowChargeDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_10003FF84()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load base_duration.mlmodelc in the bundle resource", v0, 2u);
}

void sub_10003FFC8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load base_engage.mlmodelc in the bundle resource", v0, 2u);
}

void sub_10004000C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load durationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100040050()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load engageOnPlugin.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100040094()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load easy_engage.mlmodelc in the bundle resource", v0, 2u);
}

void sub_1000400D8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load long_duration.mlmodelc in the bundle resource", v0, 2u);
}

void sub_10004011C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load longDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100040160()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load shortDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_1000401A4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load engageModel.mlmodelc in the bundle resource", v0, 2u);
}

id objc_msgSend_Activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Activity");
}

id objc_msgSend_BatteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BatteryLevel");
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Device");
}

id objc_msgSend_Level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Level");
}

id objc_msgSend_Location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Location");
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Media");
}

id objc_msgSend_MicroLocationVisit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MicroLocationVisit");
}

id objc_msgSend_NowPlaying(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "NowPlaying");
}

id objc_msgSend_PluggedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "PluggedIn");
}

id objc_msgSend_Power(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Power");
}

id objc_msgSend_ScreenLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ScreenLocked");
}

id objc_msgSend_TimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "TimeZone");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLOfModelInThisBundle");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteTimestamp");
}

id objc_msgSend_accumulativelyBinKLongestIntervals_endAfter_startBefore_longerThan_fromIntervals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accumulativelyBinKLongestIntervals:endAfter:startBefore:longerThan:fromIntervals:");
}

id objc_msgSend_activeModeConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeModeConfiguration");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activity");
}

id objc_msgSend_activityFeatureValueWithName_atDate_withActivityHistory_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityFeatureValueWithName:atDate:withActivityHistory:withContext:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_addLockIntervalsAndSortAscendingByStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLockIntervalsAndSortAscendingByStartDate:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
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

id objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUpdateHandlerForNamespaceName:usingBlock:");
}

id objc_msgSend_adjustedChargingDecision_withPluginDate_withPluginBatteryLevel_forDate_forStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedChargingDecision:withPluginDate:withPluginBatteryLevel:forDate:forStatus:");
}

id objc_msgSend_adjustedPredictedDurationWithStrictLeeway_andRelaxedLeeway_andMaxPredictionCap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedPredictedDurationWithStrictLeeway:andRelaxedLeeway:andMaxPredictionCap:");
}

id objc_msgSend_allIntervalsSortByStartAsc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allIntervalsSortByStartAsc");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allUnlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUnlocks");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_alternatePredictor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternatePredictor");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_aodOffOrSuppressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aodOffOrSuppressed");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_areEntryConditionsMetWithLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areEntryConditionsMetWithLog:");
}

id objc_msgSend_areSleepHeuristicsMet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areSleepHeuristicsMet");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_averageDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "averageDuration");
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backlightState");
}

id objc_msgSend_backupData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backupData");
}

id objc_msgSend_baseModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseModel");
}

id objc_msgSend_batt_weekday_percentile_prior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batt_weekday_percentile_prior");
}

id objc_msgSend_batteryAdapterIsWirelessKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryAdapterIsWirelessKey");
}

id objc_msgSend_batteryExternalConnectedChangeDateKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryExternalConnectedChangeDateKey");
}

id objc_msgSend_batteryExternalConnectedKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryExternalConnectedKey");
}

id objc_msgSend_batteryLevelAtDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevelAtDate:");
}

id objc_msgSend_batteryPercentage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryPercentage");
}

id objc_msgSend_batteryPercentageKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryPercentageKey");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLeanValue");
}

id objc_msgSend_bucketLuxValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bucketLuxValue:");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendar");
}

id objc_msgSend_calendarMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarMonitor");
}

id objc_msgSend_categoryDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryDescription");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_chargingDecision_withPluginDate_withPluginBatteryLevel_forDate_withLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:");
}

id objc_msgSend_chargingDecisionWithLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargingDecisionWithLog:");
}

id objc_msgSend_chargingSignals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargingSignals");
}

id objc_msgSend_chargingUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chargingUserDefaults");
}

id objc_msgSend_checkInactivitySignalsWithTimeSinceInactive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInactivitySignalsWithTimeSinceInactive:");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_checkSleepSignalsWithTimeSinceInactive_andPredictorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkSleepSignalsWithTimeSinceInactive:andPredictorType:");
}

id objc_msgSend_classProbability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classProbability");
}

id objc_msgSend_classic_time_between_uses_med_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_med_dur_1");
}

id objc_msgSend_classic_time_between_uses_med_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_med_dur_2");
}

id objc_msgSend_classic_time_between_uses_med_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_med_dur_24");
}

id objc_msgSend_classic_time_between_uses_med_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_med_dur_4");
}

id objc_msgSend_classic_time_between_uses_std_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_std_dur_1");
}

id objc_msgSend_classic_time_between_uses_std_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_std_dur_2");
}

id objc_msgSend_classic_time_between_uses_std_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_std_dur_24");
}

id objc_msgSend_classic_time_between_uses_std_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classic_time_between_uses_std_dur_4");
}

id objc_msgSend_clientWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientWithIdentifier:");
}

id objc_msgSend_clipInterval_withTimewiseSliceDefineBy_leftBoundary_rightBoundary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clipInterval:withTimewiseSliceDefineBy:leftBoundary:rightBoundary:");
}

id objc_msgSend_clockwiseAngleFromPoint_toPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockwiseAngleFromPoint:toPoint:");
}

id objc_msgSend_cnt_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_1");
}

id objc_msgSend_cnt_dur_16(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_16");
}

id objc_msgSend_cnt_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_2");
}

id objc_msgSend_cnt_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_24");
}

id objc_msgSend_cnt_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_4");
}

id objc_msgSend_cnt_dur_8(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cnt_dur_8");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compileModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compileModel:");
}

id objc_msgSend_compileModelAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compileModelAtURL:error:");
}

id objc_msgSend_compileSpecificationAtURL_toURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compileSpecificationAtURL:toURL:options:error:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeInactivityHoursFromBackupForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeInactivityHoursFromBackupForDate:");
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidence");
}

id objc_msgSend_confidenceLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidenceLevel");
}

id objc_msgSend_confidenceThresholdRelaxed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidenceThresholdRelaxed");
}

id objc_msgSend_confidenceThresholdStrict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidenceThresholdStrict");
}

id objc_msgSend_confidenceValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confidenceValue");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_convertInputFeaturesToNeuralFeatures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertInputFeaturesToNeuralFeatures:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPropertyForKey:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countIntervalsWithDateDecay_fromDate_withDecayDegree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countIntervalsWithDateDecay:fromDate:withDecayDegree:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentAmbientLightLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentAmbientLightLevel");
}

id objc_msgSend_currentBatteryLevelWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBatteryLevelWithContext:");
}

id objc_msgSend_currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBootSessionUUID");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocation");
}

id objc_msgSend_currentSleepScheduleStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSleepScheduleStateWithError:");
}

id objc_msgSend_currentSleepScheduleWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSleepScheduleWithError:");
}

id objc_msgSend_currentlyInCar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentlyInCar");
}

id objc_msgSend_dailyAverageActiveDurationsInHours_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dailyAverageActiveDurationsInHours:");
}

id objc_msgSend_dataProtectionClassC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataProtectionClassC");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_date_coveredByAnyWeekdayWithOccurrences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date:coveredByAnyWeekdayWithOccurrences:");
}

id objc_msgSend_date_inSleepWindowWithSecondsBeforeStart_secondsBeforeEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date:inSleepWindowWithSecondsBeforeStart:secondsBeforeEnd:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateForPreferenceKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateForPreferenceKey:inDomain:");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_datewiseDistanceBetweenDate_andDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "datewiseDistanceBetweenDate:andDate:");
}

id objc_msgSend_deadlineSetter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deadlineSetter");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultOptions");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionWithLocale:");
}

id objc_msgSend_determineNextEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineNextEvent");
}

id objc_msgSend_determineTimeSinceInactiveWithInputDate_andInputTimeSinceInactive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineTimeSinceInactiveWithInputDate:andInputTimeSinceInactive:");
}

id objc_msgSend_deviceUsageDiagnosis(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUsageDiagnosis");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryValue");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDateTakePlaceDuringRecentLongLocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDateTakePlaceDuringRecentLongLocks:");
}

id objc_msgSend_dimsLockScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dimsLockScreen");
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directoryValue");
}

id objc_msgSend_dist_from_total_mean(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dist_from_total_mean");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drain_since_last_plugin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain_since_last_plugin");
}

id objc_msgSend_dueDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dueDate");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_durationModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationModel");
}

id objc_msgSend_duration_pred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration_pred");
}

id objc_msgSend_dynamicDurationFromEvent_withAnchorDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicDurationFromEvent:withAnchorDate:");
}

id objc_msgSend_dynamicDurationsFromEvents_withAnchorDate_withUnit_cappedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicDurationsFromEvents:withAnchorDate:withUnit:cappedAt:");
}

id objc_msgSend_dynamicMaxDarkLuxThresholdSinceWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicMaxDarkLuxThresholdSinceWait:");
}

id objc_msgSend_dynamicMinPctStationaryThresholdSinceWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicMinPctStationaryThresholdSinceWait:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_encodeTimeAsPointFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeTimeAsPointFromDate:");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_endSoC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSoC");
}

id objc_msgSend_engage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engage");
}

id objc_msgSend_engageModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engageModel");
}

id objc_msgSend_engageOnPluginModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engageOnPluginModel");
}

id objc_msgSend_engagedUntilDateRequest_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "engagedUntilDateRequest:inactivityOptions:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluatePredictorTypeWithLookahead_withIncrement_withActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePredictorTypeWithLookahead:withIncrement:withActivity:");
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluator");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_eventMetadataFromEKEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventMetadataFromEKEvent:");
}

id objc_msgSend_eventObjectIDsMatchingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventObjectIDsMatchingPredicate:");
}

id objc_msgSend_events_forHourBin_date_withMaxDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "events:forHourBin:date:withMaxDuration:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_experimentIdentifiersWithNamespaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "experimentIdentifiersWithNamespaceName:");
}

id objc_msgSend_exponentialDecayByDateDistance_withDegree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exponentialDecayByDateDistance:withDegree:");
}

id objc_msgSend_extractLeftWatershed_andRight_fromFeatureName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractLeftWatershed:andRight:fromFeatureName:");
}

id objc_msgSend_extractPercentileOrQuantileNumberIfAnyFromFeatureName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractPercentileOrQuantileNumberIfAnyFromFeatureName:");
}

id objc_msgSend_extrapolatedWaitdDurationsAtDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extrapolatedWaitdDurationsAtDate:");
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureNames");
}

id objc_msgSend_featureValueForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueForName:");
}

id objc_msgSend_featureValueWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueWithDictionary:error:");
}

id objc_msgSend_featureValueWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueWithDouble:");
}

id objc_msgSend_featureValueWithInt64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featureValueWithInt64:");
}

id objc_msgSend_featuresAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featuresAtIndex:");
}

id objc_msgSend_fetchLocationsOfInterestVisitedSinceDate_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLocationsOfInterestVisitedSinceDate:withHandler:");
}

id objc_msgSend_fetchLocationsOfInterestWithinDistance_ofLocation_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileValue");
}

id objc_msgSend_filterEvents_isRecentForDate_goingDaysBack_useEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:isRecentForDate:goingDaysBack:useEndDate:");
}

id objc_msgSend_filterEvents_startOnSameWeekdayAs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:startOnSameWeekdayAs:");
}

id objc_msgSend_filterEvents_startOnSameWeekdayAs_withHourBinWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:startOnSameWeekdayAs:withHourBinWidth:");
}

id objc_msgSend_filterEvents_withDateDistance_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:withDateDistance:fromDate:");
}

id objc_msgSend_filterEvents_withMinimumDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:withMinimumDuration:");
}

id objc_msgSend_filterEvents_withSameWorkOrOffStatusAs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEvents:withSameWorkOrOffStatusAs:");
}

id objc_msgSend_filterEventsSortedByStartDateAscending_startsBefore_dynamicallyAroundDate_withHourBinWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterEventsSortedByStartDateAscending:startsBefore:dynamicallyAroundDate:withHourBinWidth:");
}

id objc_msgSend_filterInactiveEvents_beforeDate_whichHistorySubset_withHourBinWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterInactiveEvents:beforeDate:whichHistorySubset:withHourBinWidth:");
}

id objc_msgSend_filterWithIsIncluded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithIsIncluded:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredDurationsFromIntervals_beforeDate_whichHistorySubset_withBinWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filteredDurationsFromIntervals:beforeDate:whichHistorySubset:withBinWidth:");
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "first");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getAllLockIntervalsEndingBefore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllLockIntervalsEndingBefore:");
}

id objc_msgSend_getAnchorOfDate_onTheDayOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAnchorOfDate:onTheDayOf:");
}

id objc_msgSend_getBatteryLevelDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBatteryLevelDurations:");
}

id objc_msgSend_getDailyAnchorsForDate_whichStrata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDailyAnchorsForDate:whichStrata:");
}

id objc_msgSend_getDeliveredNotificationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeliveredNotificationsWithCompletionHandler:");
}

id objc_msgSend_getDurationsFromEvents_withUnit_cappedAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDurationsFromEvents:withUnit:cappedAt:");
}

id objc_msgSend_getHistoryStrata_endsBefore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHistoryStrata:endsBefore:");
}

id objc_msgSend_getHourBinID_forHourBin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHourBinID:forHourBin:");
}

id objc_msgSend_getInputFeatures_events_pluginBatteryLevel_timeFromPlugin_pluginDate_withLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInputFeatures:events:pluginBatteryLevel:timeFromPlugin:pluginDate:withLog:");
}

id objc_msgSend_getInputFeaturesWithPluginDate_withPluginBatteryLevel_forDate_withLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInputFeaturesWithPluginDate:withPluginBatteryLevel:forDate:withLog:");
}

id objc_msgSend_getMultiArrayForFeatureDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMultiArrayForFeatureDict:");
}

id objc_msgSend_getPastSliceTimewiseNearDate_whichStrata_earlyBoundaryInSeconds_laterBoundaryInSeconds_clipIntervals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPastSliceTimewiseNearDate:whichStrata:earlyBoundaryInSeconds:laterBoundaryInSeconds:clipIntervals:");
}

id objc_msgSend_getPendingNotificationRequestsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPendingNotificationRequestsWithCompletionHandler:");
}

id objc_msgSend_getUsageBucketsForEvents_forDate_withLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUsageBucketsForEvents:forDate:withLog:");
}

id objc_msgSend_handleNewExitState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNewExitState");
}

id objc_msgSend_handleSpecialHistoryAgnosticFeaturesWithName_atDate_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSpecialHistoryAgnosticFeaturesWithName:atDate:withContext:");
}

id objc_msgSend_hasBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasBackup");
}

id objc_msgSend_hasEnoughHistoryForInactivityPrediction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEnoughHistoryForInactivityPrediction");
}

id objc_msgSend_hasEnoughInactivityHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasEnoughInactivityHistory");
}

id objc_msgSend_hasInUseStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasInUseStatus");
}

id objc_msgSend_hasPlaybackStateChangeRecently_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPlaybackStateChangeRecently:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasReasonableDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasReasonableDuration");
}

id objc_msgSend_hasRecentPlaybackChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRecentPlaybackChange");
}

id objc_msgSend_hasSecondsFromGMT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSecondsFromGMT");
}

id objc_msgSend_hasStarting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStarting");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_historicalSecondsSinceInactiveAtDate_whichStrata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "historicalSecondsSinceInactiveAtDate:whichStrata:");
}

id objc_msgSend_historicalTimesUntilNextActivityAtDate_whichStrata_useDecay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "historicalTimesUntilNextActivityAtDate:whichStrata:useDecay:");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_hourBinsOfLongestLocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hourBinsOfLongestLocks");
}

id objc_msgSend_hourFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hourFromDate:");
}

id objc_msgSend_hour_plus_0(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_0");
}

id objc_msgSend_hour_plus_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_1");
}

id objc_msgSend_hour_plus_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_2");
}

id objc_msgSend_hour_plus_3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_3");
}

id objc_msgSend_hour_plus_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_4");
}

id objc_msgSend_hour_plus_5(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour_plus_5");
}

id objc_msgSend_hoursUntilNextActivityAtDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hoursUntilNextActivityAtDate:");
}

id objc_msgSend_hoursUntilUseFromBucketedUsage_withCurrentHour_withComponentsMinutes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:");
}

id objc_msgSend_hours_until_use(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hours_until_use");
}

id objc_msgSend_hydrateBackup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hydrateBackup");
}

id objc_msgSend_iconForOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconForOptions:");
}

id objc_msgSend_iconForSystemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconForSystemImageNamed:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_immediateMaxDarkLuxThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "immediateMaxDarkLuxThreshold");
}

id objc_msgSend_inKnownMicrolocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inKnownMicrolocation");
}

id objc_msgSend_inTypicalLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inTypicalLocation");
}

id objc_msgSend_inTypicalLocationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inTypicalLocationWithError:");
}

id objc_msgSend_inUseStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inUseStatus");
}

id objc_msgSend_inactivityEngagedContentUntil_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactivityEngagedContentUntil:inactivityOptions:");
}

id objc_msgSend_inactivityPreviouslyEngagedContentFrom_until_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactivityPreviouslyEngagedContentFrom:until:inactivityOptions:");
}

id objc_msgSend_inactivityUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactivityUserDefaults");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_inferInputDateAndWaitTimeToQueryModelWithOptions_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inferInputDateAndWaitTimeToQueryModelWithOptions:withError:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initInvalidOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initInvalidOutput");
}

id objc_msgSend_initWithActivity_n_events_prior_batt_weekday_percentile_prior_dist_from_total_mean_drain_since_last_plugin_max_batt_12_mean_activity_mean_daily_plugins_net_drain_since_max_recent_drain_1_recent_drain_15min_recent_drain_3_start_time_secs_user_mean_drain_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithActivity:n_events_prior:batt_weekday_percentile_prior:dist_from_total_mean:drain_since_last_plugin:max_batt_12:mean_activity:mean_daily_plugins:net_drain_since_max:recent_drain_1:recent_drain_15min:recent_drain_3:start_time_secs:user_mean_drain:value:");
}

id objc_msgSend_initWithAlternateModel_inEvaluationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAlternateModel:inEvaluationMode:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithClassic_time_between_uses_med_dur_1_classic_time_between_uses_med_dur_2_classic_time_between_uses_med_dur_4_classic_time_between_uses_med_dur_24_classic_time_between_uses_std_dur_1_classic_time_between_uses_std_dur_2_classic_time_between_uses_std_dur_4_classic_time_between_uses_std_dur_24_hour_is_weekend_hour_plus_0_hour_plus_1_hour_plus_2_hour_plus_3_hour_plus_4_hour_plus_5_hours_until_use_meaningful_undercharge_rolling_average_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClassic_time_between_uses_med_dur_1:classic_time_between_uses_med_dur_2:classic_time_between_uses_med_dur_4:classic_time_between_uses_med_dur_24:classic_time_between_uses_std_dur_1:classic_time_between_uses_std_dur_2:classic_time_between_uses_std_dur_4:classic_time_between_uses_std_dur_24:hour:is_weekend:hour_plus_0:hour_plus_1:hour_plus_2:hour_plus_3:hour_plus_4:hour_plus_5:hours_until_use:meaningful_undercharge_rolling_average:");
}

id objc_msgSend_initWithConfidenceLevel_andConfidenceValue_andPredictedDuration_andReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfidenceLevel:andConfidenceValue:andPredictedDuration:andReason:");
}

id objc_msgSend_initWithConfidenceValue_andRelaxedThreshold_andStrictThreshold_andPredictedDuration_andReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfidenceValue:andRelaxedThreshold:andStrictThreshold:andPredictedDuration:andReason:");
}

id objc_msgSend_initWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:configuration:error:");
}

id objc_msgSend_initWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:error:");
}

id objc_msgSend_initWithDefaultsDomain_withContextStore_withTrialManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDefaultsDomain:withContextStore:withTrialManager:");
}

id objc_msgSend_initWithDictionary_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:error:");
}

id objc_msgSend_initWithDuration_pred_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDuration_pred:");
}

id objc_msgSend_initWithEKOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEKOptions:");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithEngage_classProbability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEngage:classProbability:");
}

id objc_msgSend_initWithFeatureProviderArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFeatureProviderArray:");
}

id objc_msgSend_initWithFirst_second_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFirst:second:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKey:ascending:");
}

id objc_msgSend_initWithLabel_classProbability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLabel:classProbability:");
}

id objc_msgSend_initWithMLModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMLModel:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObserver:");
}

id objc_msgSend_initWithPlugin_battery_level_time_from_plugin_med_dur_1_med_dur_2_med_dur_4_med_dur_8_med_dur_16_med_dur_24_cnt_dur_1_cnt_dur_2_cnt_dur_4_cnt_dur_8_cnt_dur_16_cnt_dur_24_std_dur_1_std_dur_2_std_dur_4_std_dur_8_std_dur_16_std_dur_24_weekday_med_dur_1_weekday_med_dur_2_weekday_med_dur_4_weekday_med_dur_8_weekday_med_dur_24_weekday_std_dur_4_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPlugin_battery_level:time_from_plugin:med_dur_1:med_dur_2:med_dur_4:med_dur_8:med_dur_16:med_dur_24:cnt_dur_1:cnt_dur_2:cnt_dur_4:cnt_dur_8:cnt_dur_16:cnt_dur_24:std_dur_1:std_dur_2:std_dur_4:std_dur_8:std_dur_16:std_dur_24:weekday_med_dur_1:weekday_med_dur_2:weekday_med_dur_4:weekday_med_dur_8:weekday_med_dur_24:weekday_std_dur_4:");
}

id objc_msgSend_initWithPredictor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPredictor:");
}

id objc_msgSend_initWithProtocolConformer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtocolConformer:");
}

id objc_msgSend_initWithShape_dataType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithShape:dataType:error:");
}

id objc_msgSend_initWithStartDate_andEndDate_andActiveStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:andEndDate:andActiveStatus:");
}

id objc_msgSend_initWithStartDate_andEndDate_andIsLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:andEndDate:andIsLocked:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStartDate_endDate_maxEvents_lastN_reversed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:maxEvents:lastN:reversed:");
}

id objc_msgSend_initWithStartDate_withEndDate_withStartSoC_withEndSoC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:");
}

id objc_msgSend_initWithStartTime_andEndTime_andActiveStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartTime:andEndTime:andActiveStatus:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTrialClient_withNamespace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTrialClient:withNamespace:");
}

id objc_msgSend_inputDescriptionsByName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputDescriptionsByName");
}

id objc_msgSend_inputFeaturesWithNames_atDate_withIntervalHistory_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputFeaturesWithNames:atDate:withIntervalHistory:withContext:");
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "int64Value");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectedDurationOfPastEvent_withDateOfIntersection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectedDurationOfPastEvent:withDateOfIntersection:");
}

id objc_msgSend_intervalsRecentFromQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalsRecentFromQuery");
}

id objc_msgSend_intervalsSameDayOfWeekAsQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalsSameDayOfWeekAsQuery");
}

id objc_msgSend_intervalsSameWorkOrOffAsQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intervalsSameWorkOrOffAsQuery");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAbsolutePath");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isActiveBiomeActivityLevelEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActiveBiomeActivityLevelEvent:");
}

id objc_msgSend_isActivityAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActivityAvailable");
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAllDay");
}

id objc_msgSend_isDNDModeConsidered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDNDModeConsidered:");
}

id objc_msgSend_isDataAvailableFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataAvailableFor:");
}

id objc_msgSend_isDate_inSameDayAsDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDate:inSameDayAsDate:");
}

id objc_msgSend_isDateInWeekend_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDateInWeekend:");
}

id objc_msgSend_isDeviceRarelyUsedRecently(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceRarelyUsedRecently");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isEventNextSongPlaying_fromPreviousEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEventNextSongPlaying:fromPreviousEvent:");
}

id objc_msgSend_isInSameTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInSameTimeZone");
}

id objc_msgSend_isInputDateInTimeRange_withEarlyTimeOfDay_andLateTimeOfDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInputDateInTimeRange:withEarlyTimeOfDay:andLateTimeOfDay:");
}

id objc_msgSend_isIntervalOnRestDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIntervalOnRestDay:");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isLockedBiomeScreenLockedEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLockedBiomeScreenLockedEvent:");
}

id objc_msgSend_isPluggedInWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPluggedInWithContext:");
}

id objc_msgSend_isRestDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRestDay:");
}

id objc_msgSend_isSufficientDataAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSufficientDataAvailable");
}

id objc_msgSend_isUpdatable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUpdatable");
}

id objc_msgSend_isValidInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidInterval");
}

id objc_msgSend_is_weekend(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_weekend");
}

id objc_msgSend_keyPathForBatteryStateDataDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForBatteryStateDataDictionary");
}

id objc_msgSend_keyPathForCarConnectedStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForCarConnectedStatus");
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForInUseStatus");
}

id objc_msgSend_keyPathForNavigationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForNavigationStatus");
}

id objc_msgSend_keyPathForPluginStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForPluginStatus");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_last(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "last");
}

id objc_msgSend_lastLockDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastLockDate");
}

id objc_msgSend_lastModifiedDateForContextualKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastModifiedDateForContextualKeyPath:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPluggedInDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPluggedInDate");
}

id objc_msgSend_lastQueryDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastQueryDate");
}

id objc_msgSend_lastRefreshDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRefreshDate");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_levelForFactor_withNamespaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "levelForFactor:withNamespaceName:");
}

id objc_msgSend_likelyToBeInKnownArea(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "likelyToBeInKnownArea");
}

id objc_msgSend_loadAdjustedHoursForModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadAdjustedHoursForModel:");
}

id objc_msgSend_loadCompiledModelFromPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadCompiledModelFromPath:");
}

id objc_msgSend_loadContentsOfURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:");
}

id objc_msgSend_loadHistoryFromUnderlyingDataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadHistoryFromUnderlyingDataSource");
}

id objc_msgSend_loadMinInputChargeDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadMinInputChargeDuration");
}

id objc_msgSend_loadModelFromPath_deleteExistingFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadModelFromPath:deleteExistingFiles:");
}

id objc_msgSend_loadModelWithModelNameString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadModelWithModelNameString:");
}

id objc_msgSend_loadThresholdForModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadThresholdForModel:");
}

id objc_msgSend_loadTrialAdjustedHours(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialAdjustedHours");
}

id objc_msgSend_loadTrialDurationModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialDurationModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialEngageModelByDeletingExistingModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialEngageModelByDeletingExistingModel:");
}

id objc_msgSend_loadTrialFactors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialFactors");
}

id objc_msgSend_loadTrialMinInputChargeDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialMinInputChargeDuration");
}

id objc_msgSend_loadTrialThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialThreshold");
}

id objc_msgSend_loadTrialUpdates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadTrialUpdates");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_localizedCaseInsensitiveContainsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedCaseInsensitiveContainsString:");
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedName");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "location");
}

id objc_msgSend_locationIsUncertain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationIsUncertain:");
}

id objc_msgSend_locationMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationMonitor");
}

id objc_msgSend_locationOfInterestFoundNear_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locationOfInterestFoundNear:withError:");
}

id objc_msgSend_lockFeatureValueWithName_atDate_withLockHistory_withContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockFeatureValueWithName:atDate:withLockHistory:withContext:");
}

id objc_msgSend_lockedIntervalsQueryWithPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockedIntervalsQueryWithPredicate:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logWithCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logWithCategory:");
}

id objc_msgSend_longDurationModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longDurationModel");
}

id objc_msgSend_longFactorForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longFactorForName:");
}

id objc_msgSend_longInactivityPredictionResultAtDate_withLockHistory_withOptions_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longInactivityPredictionResultAtDate:withLockHistory:withOptions:withError:");
}

id objc_msgSend_longInactivityPredictionResultAtDate_withTimeSinceInactive_withOptions_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longInactivityPredictionResultAtDate:withTimeSinceInactive:withOptions:withError:");
}

id objc_msgSend_longInactivityPredictionResultWithOptions_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longInactivityPredictionResultWithOptions:withError:");
}

id objc_msgSend_longThreshold(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longThreshold");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_longestK_intervalsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longestK:intervalsInArray:");
}

id objc_msgSend_longestKIntervals_endAfter_startBefore_fromIntervals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longestKIntervals:endAfter:startBefore:fromIntervals:");
}

id objc_msgSend_lux(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lux");
}

id objc_msgSend_max_batt_12(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "max_batt_12");
}

id objc_msgSend_meanAbsoluteDeviationOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meanAbsoluteDeviationOf:");
}

id objc_msgSend_meanOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meanOf:");
}

id objc_msgSend_mean_activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mean_activity");
}

id objc_msgSend_mean_daily_plugins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mean_daily_plugins");
}

id objc_msgSend_meaningful_undercharge_rolling_average(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meaningful_undercharge_rolling_average");
}

id objc_msgSend_med_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_1");
}

id objc_msgSend_med_dur_16(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_16");
}

id objc_msgSend_med_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_2");
}

id objc_msgSend_med_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_24");
}

id objc_msgSend_med_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_4");
}

id objc_msgSend_med_dur_8(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "med_dur_8");
}

id objc_msgSend_medianOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "medianOf:");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mode");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelDescription");
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelVersion");
}

id objc_msgSend_modelWithContentsOfURL_configuration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelWithContentsOfURL:configuration:error:");
}

id objc_msgSend_modelWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelWithContentsOfURL:error:");
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiArrayValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_n_events_prior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "n_events_prior");
}

id objc_msgSend_namespaceNameFromId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "namespaceNameFromId:");
}

id objc_msgSend_net_drain_since_max(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "net_drain_since_max");
}

id objc_msgSend_newTrackingId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTrackingId");
}

id objc_msgSend_newestIntervalInHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newestIntervalInHistory");
}

id objc_msgSend_nextAlarmFireDateBetweenDate_andDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextAlarmFireDateBetweenDate:andDate:");
}

id objc_msgSend_nextAlarmsInRange_maxCount_includeSleepAlarm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextAlarmsInRange:maxCount:includeSleepAlarm:");
}

id objc_msgSend_nextEventDueAfterDate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextEventDueAfterDate:error:");
}

id objc_msgSend_nextFireDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextFireDate");
}

id objc_msgSend_nextFlightEventWithEventIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextFlightEventWithEventIDs:");
}

id objc_msgSend_notAuthorizedForLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notAuthorizedForLocation");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberForPreferenceKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberForPreferenceKey:inDomain:");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRanges");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_oldestIntervalInHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldestIntervalInHistory");
}

id objc_msgSend_orderedMergeWithOther_comparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedMergeWithOther:comparator:");
}

id objc_msgSend_orderedMergeWithOthers_comparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedMergeWithOthers:comparator:");
}

id objc_msgSend_outputReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputReason");
}

id objc_msgSend_overriddenToUseTimeRestrictionFromHour_toHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overriddenToUseTimeRestrictionFromHour:toHour:");
}

id objc_msgSend_pandasWeekdayOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pandasWeekdayOf:");
}

id objc_msgSend_parseStrataTypeFromFeatureName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseStrataTypeFromFeatureName:");
}

id objc_msgSend_passesOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "passesOfType:");
}

id objc_msgSend_pastEventInQuestion_containsTimeOfReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pastEventInQuestion:containsTimeOfReferenceDate:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pctLong(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pctLong");
}

id objc_msgSend_pctStationary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pctStationary");
}

id objc_msgSend_percentOfLongDurationsIn_withLongThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentOfLongDurationsIn:withLongThreshold:");
}

id objc_msgSend_percentStationaryOverDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentStationaryOverDuration:");
}

id objc_msgSend_percentageOfTimeForBatteryLevels_withLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentageOfTimeForBatteryLevels:withLog:");
}

id objc_msgSend_percentageStationaryWithActivity_untilDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentageStationaryWithActivity:untilDate:");
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackState");
}

id objc_msgSend_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginEventsBefore:withMinimumDuration:withMinimumPlugoutBatteryLevel:");
}

id objc_msgSend_plugin_battery_level(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "plugin_battery_level");
}

id objc_msgSend_postEngagedUntilDate_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEngagedUntilDate:inactivityOptions:");
}

id objc_msgSend_predicateForEventsWithStartDate_endDate_calendars_loadDefaultProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predictedDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictedDuration");
}

id objc_msgSend_predictionFromFeatures_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:error:");
}

id objc_msgSend_predictionFromFeatures_options_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:options:completionHandler:");
}

id objc_msgSend_predictionFromFeatures_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionFromFeatures:options:error:");
}

id objc_msgSend_predictionsFromBatch_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictionsFromBatch:options:error:");
}

id objc_msgSend_predictor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictor");
}

id objc_msgSend_predictorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictorType");
}

id objc_msgSend_predictorWithPredictor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictorWithPredictor:");
}

id objc_msgSend_prefixStringFromFeatureName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefixStringFromFeatureName:");
}

id objc_msgSend_previouslyEngagedFrom_until_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previouslyEngagedFrom:until:inactivityOptions:");
}

id objc_msgSend_projectedDateOfHistorySufficiency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "projectedDateOfHistorySufficiency");
}

id objc_msgSend_projectedDateOfHistorySufficiencyWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "projectedDateOfHistorySufficiencyWithError:");
}

id objc_msgSend_publicObjectWithObjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicObjectWithObjectID:");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisher");
}

id objc_msgSend_publisherWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisherWithOptions:");
}

id objc_msgSend_qthPercentileOf_withQ_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "qthPercentileOf:withQ:");
}

id objc_msgSend_queryActivityStartingFromDate_toDate_toQueue_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryActivityStartingFromDate:toDate:toQueue:withHandler:");
}

id objc_msgSend_queryCurrentStateWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCurrentStateWithError:");
}

id objc_msgSend_queryHistoricalInactivityState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryHistoricalInactivityState");
}

id objc_msgSend_queryingMechanism(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryingMechanism");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_readEvaluatedPredictorTypeFromDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readEvaluatedPredictorTypeFromDefaults");
}

id objc_msgSend_readOverriddenModelOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readOverriddenModelOutput");
}

id objc_msgSend_readOverriddenWaitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readOverriddenWaitTime");
}

id objc_msgSend_readOverridenModelScheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readOverridenModelScheme");
}

id objc_msgSend_recent_drain_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recent_drain_1");
}

id objc_msgSend_recent_drain_15min(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recent_drain_15min");
}

id objc_msgSend_recent_drain_3(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recent_drain_3");
}

id objc_msgSend_recommendedDecayDegree(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recommendedDecayDegree");
}

id objc_msgSend_recommendedWaitTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recommendedWaitTime");
}

id objc_msgSend_refreshCacheIfStaleWithQueryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshCacheIfStaleWithQueryDate:");
}

id objc_msgSend_registerBackupTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerBackupTask");
}

id objc_msgSend_registerDeviceTypeEvalution_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDeviceTypeEvalution:");
}

id objc_msgSend_registerNotificationBlock_forProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerNotificationBlock:forProperties:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_relevantDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relevantDate");
}

id objc_msgSend_relevantEventDeadline(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relevantEventDeadline");
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllDeliveredNotifications");
}

id objc_msgSend_removeAllNotificationsForInactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllNotificationsForInactivityOptions:");
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllPendingNotificationRequests");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestLocationSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocationSemaphore");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_requireEnoughHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireEnoughHistory");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rolloutIdentifiersWithNamespaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rolloutIdentifiersWithNamespaceName:");
}

id objc_msgSend_safeSubtractWaitTimeFromPredictedDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeSubtractWaitTimeFromPredictedDuration:");
}

id objc_msgSend_saveNextAlarmInterval_nextDNDInterval_predictionInterval_recommendedWait_deadlineSetter_modelConfidenceLevel_withPredictor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:");
}

id objc_msgSend_scanWithInitial_nextPartialResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanWithInitial:nextPartialResult:");
}

id objc_msgSend_scheduleModelUpgradeAfterInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleModelUpgradeAfterInterval:");
}

id objc_msgSend_scheduledDNDEndDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledDNDEndDate");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_secondsSinceBecomingInactiveAtDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsSinceBecomingInactiveAtDate:");
}

id objc_msgSend_secondsSinceWait(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsSinceWait");
}

id objc_msgSend_secondsUntilHour_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsUntilHour:fromDate:");
}

id objc_msgSend_semanticType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semanticType");
}

id objc_msgSend_serviceForClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForClientIdentifier:");
}

id objc_msgSend_setAllIntervalsSortByStartAsc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllIntervalsSortByStartAsc:");
}

id objc_msgSend_setAllUnlocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllUnlocks:");
}

id objc_msgSend_setAverageDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAverageDuration:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setChangeHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeHandler:");
}

id objc_msgSend_setChargingDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChargingDuration:");
}

id objc_msgSend_setChunkEngageDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChunkEngageDuration:");
}

id objc_msgSend_setClassifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassifier:");
}

id objc_msgSend_setConfidence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfidence:");
}

id objc_msgSend_setConfidenceThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfidenceThreshold:");
}

id objc_msgSend_setConfidenceThresholdRelaxed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfidenceThresholdRelaxed:");
}

id objc_msgSend_setConfidenceThresholdStrict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfidenceThresholdStrict:");
}

id objc_msgSend_setCooldownDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCooldownDuration:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCurrentLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentLocation:");
}

id objc_msgSend_setDate_forPreferenceKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDate:forPreferenceKey:inDomain:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDestinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinations:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setHourBinsOfLongestLocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHourBinsOfLongestLocks:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIntervalsRecentFromQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntervalsRecentFromQuery:");
}

id objc_msgSend_setIntervalsSameDayOfWeekAsQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntervalsSameDayOfWeekAsQuery:");
}

id objc_msgSend_setIntervalsSameWorkOrOffAsQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntervalsSameWorkOrOffAsQuery:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsLocked_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsLocked:");
}

id objc_msgSend_setIsRarelyUsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRarelyUsed:");
}

id objc_msgSend_setLastInputDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastInputDate:");
}

id objc_msgSend_setLastPredictedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPredictedDate:");
}

id objc_msgSend_setLastQueryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastQueryDate:");
}

id objc_msgSend_setLastRefreshDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastRefreshDate:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLongThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLongThreshold:");
}

id objc_msgSend_setLowSOCPredicted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLowSOCPredicted:");
}

id objc_msgSend_setMaxChunksPerSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxChunksPerSession:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMeetsSystemConfidenceThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMeetsSystemConfidenceThreshold:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setModelName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModelName:");
}

id objc_msgSend_setModelVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModelVersion:");
}

id objc_msgSend_setNumber_forPreferenceKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumber:forPreferenceKey:inDomain:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPctLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPctLong:");
}

id objc_msgSend_setPredictedDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictedDuration:");
}

id objc_msgSend_setPredictionOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictionOutput:");
}

id objc_msgSend_setPredictor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictor:");
}

id objc_msgSend_setPredictorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictorType:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueryingMechanism_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryingMechanism:");
}

id objc_msgSend_setRecommendedWaitTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecommendedWaitTime:");
}

id objc_msgSend_setRequeryInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequeryInterval:");
}

id objc_msgSend_setRequestLocationSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestLocationSemaphore:");
}

id objc_msgSend_setRequireEnoughHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequireEnoughHistory:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setShouldHideDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldHideDate:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldIgnoreDowntime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldIgnoreDowntime:");
}

id objc_msgSend_setShouldSuppressScreenLightUp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldSuppressScreenLightUp:");
}

id objc_msgSend_setSignals_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSignals:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStdDev_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStdDev:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBacklight");
}

id objc_msgSend_sharedChargePredictionInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedChargePredictionInstance");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedInstanceWithTrialClient_withNamespace_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstanceWithTrialClient:withNamespace:");
}

id objc_msgSend_shortDurationModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortDurationModel");
}

id objc_msgSend_showsSignificantInactivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showsSignificantInactivity:");
}

id objc_msgSend_signals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signals");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_sinkWithCompletion_shouldContinue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:shouldContinue:");
}

id objc_msgSend_sleepLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepLog");
}

id objc_msgSend_sleepSuppresionPredictionResultWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepSuppresionPredictionResultWithError:");
}

id objc_msgSend_sleepSuppressionPredictionResultAtDate_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sleepSuppressionPredictionResultAtDate:withError:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardDeviationOf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardDeviationOf:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startSoC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSoC");
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUpdatingLocation");
}

id objc_msgSend_start_time_secs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start_time_secs");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starting");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stationary");
}

id objc_msgSend_std_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_1");
}

id objc_msgSend_std_dur_16(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_16");
}

id objc_msgSend_std_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_2");
}

id objc_msgSend_std_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_24");
}

id objc_msgSend_std_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_4");
}

id objc_msgSend_std_dur_8(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "std_dur_8");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithContentsOfURL_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfURL:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_suffixNumberFromFeatureName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suffixNumberFromFeatureName:");
}

id objc_msgSend_suggestionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestionInfo");
}

id objc_msgSend_sumDurationsOfEvents_intersectingDateRangeFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sumDurationsOfEvents:intersectingDateRangeFrom:to:");
}

id objc_msgSend_sumIntervalsWithDateDecay_fromDate_withDecayDegree_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sumIntervalsWithDateDecay:fromDate:withDecayDegree:");
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLocale");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temporaryDirectory");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeOfDayWithDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeOfDayWithDate:");
}

id objc_msgSend_timeStringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeStringFromDate:");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZone");
}

id objc_msgSend_time_from_plugin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "time_from_plugin");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleForOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleForOptions:");
}

id objc_msgSend_trackingId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trackingId");
}

id objc_msgSend_treatmentIdWithNamespaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "treatmentIdWithNamespaceName:");
}

id objc_msgSend_trialFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trialFactor:");
}

id objc_msgSend_trialIdentifiersWithNamespaceName_experimentId_deploymentId_treatmentId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trialIdentifiersWithNamespaceName:experimentId:deploymentId:treatmentId:");
}

id objc_msgSend_triggerWithTimeInterval_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerWithTimeInterval:repeats:");
}

id objc_msgSend_ttrURLforEnagedFrom_until_interrupted_inactivityOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ttrURLforEnagedFrom:until:interrupted:inactivityOptions:");
}

id objc_msgSend_ultraLongInactiveDurationsInHours_withThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ultraLongInactiveDurationsInHours:withThreshold:");
}

id objc_msgSend_unCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unCenter");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknown");
}

id objc_msgSend_unlockEventsIntersectingDateRangeFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockEventsIntersectingDateRangeFrom:to:");
}

id objc_msgSend_unlockedIntervalsQueryWithPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockedIntervalsQueryWithPredicate:");
}

id objc_msgSend_unregisterNotificationForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterNotificationForKey:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_upcomingEventIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upcomingEventIDs");
}

id objc_msgSend_updateHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateHandlers");
}

id objc_msgSend_updateStratasWithQueryDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStratasWithQueryDate:");
}

id objc_msgSend_updateTrialParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTrialParameters");
}

id objc_msgSend_updateTrialParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTrialParameters:");
}

id objc_msgSend_upgradePredictorIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upgradePredictorIfNeeded");
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userContext");
}

id objc_msgSend_userHistoryDiagnosis(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userHistoryDiagnosis");
}

id objc_msgSend_userVisibleTransitionDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userVisibleTransitionDate");
}

id objc_msgSend_userVisibleTransitionLifetimeType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userVisibleTransitionLifetimeType");
}

id objc_msgSend_user_mean_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "user_mean_drain");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_visualizationFromLongLockHourBinsAtDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visualizationFromLongLockHourBinsAtDate:");
}

id objc_msgSend_waitedDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitedDuration");
}

id objc_msgSend_wallet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallet");
}

id objc_msgSend_walletMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walletMonitor");
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday");
}

id objc_msgSend_weekday_med_dur_1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_med_dur_1");
}

id objc_msgSend_weekday_med_dur_2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_med_dur_2");
}

id objc_msgSend_weekday_med_dur_24(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_med_dur_24");
}

id objc_msgSend_weekday_med_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_med_dur_4");
}

id objc_msgSend_weekday_med_dur_8(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_med_dur_8");
}

id objc_msgSend_weekday_std_dur_4(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekday_std_dur_4");
}

id objc_msgSend_weekdaysWithOccurrences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weekdaysWithOccurrences");
}

id objc_msgSend_writeEvaluatedPredictorTypeToDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeEvaluatedPredictorTypeToDefaults:");
}

id objc_msgSend_writeOverriddenModelOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeOverriddenModelOutput:");
}

id objc_msgSend_writeOverriddenWaitTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeOverriddenWaitTime:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
