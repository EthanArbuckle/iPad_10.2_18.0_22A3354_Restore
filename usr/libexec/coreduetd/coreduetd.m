void sub_100004B04(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  uint64_t v4;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_100022404(v4);
    }
  }

}

id sub_100005194(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

void sub_100005338(id a1)
{
  CDServiceManager *v1;
  void *v2;

  v1 = objc_alloc_init(CDServiceManager);
  v2 = (void *)qword_100040E30;
  qword_100040E30 = (uint64_t)v1;

}

void sub_100005624(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  uint64_t v4;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, "Notification");
    if (string)
    {
      v4 = (uint64_t)string;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_100022490(v4);
    }
  }

}

void sub_1000056FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000570C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100005890(uint64_t a1, void *a2, const void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v7 = v4;
    v6 = CFEqual(a3, CFSTR("SignificantTimeChangeNotification"));
    v5 = v7;
    if (v6)
    {
      objc_msgSend(v7, "timeZoneOrTimeChanged:", 0);
      v5 = v7;
    }
  }

}

void sub_1000059B4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.coreduetd", "WatchUpdate");
  v2 = (void *)qword_100040E40;
  qword_100040E40 = (uint64_t)v1;

  if (!qword_100040E40)
    objc_storeStrong((id *)&qword_100040E40, &_os_log_default);
}

void sub_100005F94(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextResetTime"));
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "formatDate:", v6));
    v15 = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TZ or time changed: now %@\n", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setupNextResetTimer:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", CFSTR("lastResetDate")));
  if (v8)
  {
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v9;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "formatDate:", v8));
      v15 = 138412290;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Last reset time: %@\n", (uint8_t *)&v15, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    if ((uint64_t)objc_msgSend(*(id *)(a1 + 32), "hoursBetween:and:", v8, v13) >= 25)
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "More than 24 hours since last push limit reset => forcing now.\n", (uint8_t *)&v15, 2u);
      }
      objc_msgSend(*(id *)(a1 + 32), "resetPushLimits");
    }

  }
}

id sub_100006338(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dailyResetTimer");
}

void sub_100006410(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Daily complication push limit reset timer fired.\n", v5, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "resetPushLimits");
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextResetTime"));
  objc_msgSend(v3, "setupNextResetTimer:", v4);

}

id sub_100006724(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Watch charged above 90%% => resetting complication push limits now.\n", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "resetPushLimits");
}

uint64_t sub_1000067FC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100006858(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  CDDCommunicatorHelper *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[6];

  v9[0] = &off_10003B0C8;
  v9[1] = &off_10003B0E0;
  v10[0] = &off_10003B0C8;
  v10[1] = &off_10003B0C8;
  v9[2] = &off_10003B0F8;
  v9[3] = &off_10003B128;
  v10[2] = &off_10003B110;
  v10[3] = &off_10003B140;
  v9[4] = &off_10003B158;
  v9[5] = &off_10003B188;
  v10[4] = &off_10003B170;
  v10[5] = &off_10003B1A0;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 6));
  v2 = (void *)qword_100040E50;
  qword_100040E50 = v1;

  v7[0] = &off_10003B0C8;
  v7[1] = &off_10003B110;
  v8[0] = &off_10003B0C8;
  v8[1] = &off_10003B0F8;
  v7[2] = &off_10003B140;
  v7[3] = &off_10003B170;
  v8[2] = &off_10003B128;
  v8[3] = &off_10003B158;
  v7[4] = &off_10003B1A0;
  v8[4] = &off_10003B188;
  v3 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 5));
  v4 = (void *)qword_100040E58;
  qword_100040E58 = v3;

  v5 = objc_alloc_init(CDDCommunicatorHelper);
  v6 = (void *)qword_100040E60;
  qword_100040E60 = (uint64_t)v5;

}

void sub_100008B78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  uint64_t v25;

  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Unwind_Resume(a1);
}

id sub_100008BB4()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100040E78;
  v7 = qword_100040E78;
  if (!qword_100040E78)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000EF9C;
    v3[3] = &unk_100038BF8;
    v3[4] = &v4;
    sub_10000EF9C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100008C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008C6C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100040E88;
  v7 = qword_100040E88;
  if (!qword_100040E88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000F050;
    v3[3] = &unk_100038BF8;
    v3[4] = &v4;
    sub_10000F050((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100008D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008D24(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  NSObject *v4;
  os_activity_scope_state_s v5;

  v2 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v4, &v5);
  os_activity_scope_leave(&v5);

  objc_msgSend(WeakRetained, "maintainPrivacy");
  objc_autoreleasePoolPop(v2);
}

void sub_100008DB4(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  os_activity_scope_state_s v5;

  v2 = objc_autoreleasePoolPush();
  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.refreshPeopleSuggesterCaches", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  os_activity_scope_leave(&v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "refreshPeopleSuggesterCaches");

  objc_autoreleasePoolPop(v2);
}

void sub_100008EE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100008F00(uint64_t a1, void *a2, int a3)
{
  id v5;
  BOOL v6;
  id *v7;
  id WeakRetained;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD block[4];
  id v17;
  id v18;

  v5 = a2;
  if (objc_msgSend(v5, "isEqualToString:", NSFileProtectionCompleteUntilFirstUserAuthentication))
    v6 = a3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v7 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "workQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009058;
    v14[3] = &unk_100038AE0;
    objc_copyWeak(&v15, v7);
    v10 = v14;
    v11 = v9;
    v12 = (void *)os_transaction_create("cd_dispatch_async_tx");
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F1B8;
    block[3] = &unk_100038A98;
    v17 = v12;
    v18 = v10;
    v13 = v12;
    dispatch_async(v11, block);

    objc_destroyWeak(&v15);
  }

}

void sub_100009044(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009058(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "versionCheckAndUpgradeIfNecessaryAndPossible");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "populatePeopleSuggesterCaches");

}

void sub_1000091AC(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Populating caches", buf, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "ensembleModel"));
  objc_msgSend(v3, "populateCaches");

  objc_msgSend(*(id *)(a1 + 32), "populateAppSharesCache");
  objc_msgSend(*(id *)(a1 + 32), "populateAppUsageCache");
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finished populating caches", v5, 2u);
  }

}

void sub_1000093F4(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;

  +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.deletedDB.people.corrupted"));
  v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%@\nDetected interaction database corruption. Deleting Storage", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "deleteStorage");
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Exiting process", (uint8_t *)&v5, 2u);
  }

  exit(1);
}

void sub_100009684(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;

  v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_1000227C4();

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "queryVersionNumber");
  v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3 == (id)1)
  {
    if (v5)
      sub_100022638(v4, v6, v7);

  }
  else
  {
    if (v5)
      sub_100022744((uint64_t)v3, v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "deleteStorage");
    +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", 1, CFSTR("com.apple.coreduet.deletedDB.people.versionMismatched"));
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000226D4(v8, v9, v10);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "recordVersionNumber:", 1);
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000226A8();

    objc_msgSend(*(id *)(a1 + 32), "requestInteractionRepopulation");
  }
}

void sub_100009F2C(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  void *v5;
  void *v6;
  xpc_object_t v7;
  NSObject *v8;
  uint64_t i;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  __int128 v34;
  void *v35;
  void *v36;
  id v37;
  xpc_object_t values[6];
  _BYTE keys[24];
  const char *v40;
  uint64_t v41;
  uint64_t v42;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  v5 = objc_autoreleasePoolPush();
  v6 = v5;
  if (state == 2)
  {
    v36 = v5;
    v10 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.repopulate", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)keys = 0;
    *(_QWORD *)&keys[8] = 0;
    os_activity_scope_enter(v10, (os_activity_scope_state_t)keys);
    os_activity_scope_leave((os_activity_scope_state_t)keys);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CDPeopleDaemon readRepopulationCheckpoint](CDPeopleDaemon, "readRepopulationCheckpoint"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -14515200.0));
    v13 = objc_alloc_init((Class)_CDInteractionHarvester);
    v14 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_100022A20(v11, v14);

    v15 = os_transaction_create("com.apple.coreduet.people.repopulate-interactions");
    v17 = (void *)v15;
    if (v11)
    {
      v35 = (void *)v15;
      *(_QWORD *)&v16 = 134218240;
      v34 = v16;
      while (1)
      {
        objc_msgSend(v11, "timeIntervalSinceReferenceDate", v34);
        v19 = v18;
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        if (v19 <= v20)
        {
LABEL_22:

          v17 = v35;
          goto LABEL_23;
        }
        v21 = getpid();
        proc_set_cpumon_params(v21, 95, 15);
        v22 = v11;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dateByAddingTimeInterval:", -172800.0));
        v24 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v23, "timeIntervalSinceNow");
          v31 = v30 / -86400.0;
          objc_msgSend(v22, "timeIntervalSinceNow");
          *(_DWORD *)keys = v34;
          *(double *)&keys[4] = v31;
          *(_WORD *)&keys[12] = 2048;
          *(double *)&keys[14] = v32 / -86400.0;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Harvesting data betweeen %2.1f and %2.1f  days ago", keys, 0x16u);
        }

        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "harvestInteractionsBetweenStartDate:endDate:", v23, v22));
        v26 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_1000229B8((uint8_t *)values, v25, (xpc_object_t *)((char *)values + 4), v26);

        if (v25 && objc_msgSend(v25, "count"))
        {
          v27 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
          v37 = 0;
          objc_msgSend(v27, "recordInteractions:error:", v25, &v37);
          v28 = v37;
          objc_msgSend(*(id *)(a1 + 32), "handleError:", v28);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dateByAddingTimeInterval:", -1.0));

        +[CDPeopleDaemon writeRepopulationCheckpoint:](CDPeopleDaemon, "writeRepopulationCheckpoint:", v11);
        v29 = getpid();
        proc_set_cpumon_defaults(v29);
        if (xpc_activity_should_defer(v3))
          break;

        if (!v11)
          goto LABEL_22;
      }
      xpc_activity_set_state(v3, 3);

    }
    else
    {
LABEL_23:
      v33 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        sub_10002298C();

      xpc_activity_set_state(v3, 5);
    }
    v6 = v36;
  }
  else if (!state)
  {
    *(_QWORD *)keys = XPC_ACTIVITY_INTERVAL;
    *(_QWORD *)&keys[8] = XPC_ACTIVITY_GRACE_PERIOD;
    *(_QWORD *)&keys[16] = XPC_ACTIVITY_PRIORITY;
    v40 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v41 = XPC_ACTIVITY_POWER_NAP;
    v42 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_MIN);
    values[1] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_HOUR);
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_UTILITY);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_BOOL_create(1);
    values[5] = xpc_BOOL_create(1);
    v7 = xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging interactionChannel](_CDLogging, "interactionChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_100022960();

    xpc_activity_set_criteria(v3, v7);
    for (i = 5; i != -1; --i)

  }
  objc_autoreleasePoolPop(v6);

}

void sub_10000A910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A934(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000AB88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000ABAC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, id, void *))(v5 + 16))(v5, v7, v8);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000ADDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AE00(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000B024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B048(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000B2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B2FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000B520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B544(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000B77C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B7A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000B9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B9FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000BC34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BC58(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:", v6));
  (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, a2, v7);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleError:", v6);

}

void sub_10000BEB0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "suggester"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "shareSheetInteractionsFromContext:maximumNumberOfSuggestions:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "integerValue")));

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

id sub_10000E3C0(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
  objc_msgSend(v2, "enterMaintenanceMode");

  objc_msgSend(*(id *)(a1 + 32), "_maintainPrivacy");
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
  objc_msgSend(v3, "exitMaintenanceMode");

  objc_msgSend(*(id *)(a1 + 32), "populateAppSharesCache");
  return objc_msgSend(*(id *)(a1 + 32), "populateAppUsageCache");
}

id sub_10000E858()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_100040E98;
  v7 = qword_100040E98;
  if (!qword_100040E98)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000F1C4;
    v3[3] = &unk_100038BF8;
    v3[4] = &v4;
    sub_10000F1C4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000E8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000EF9C(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100040E80)
  {
    v3 = off_100038C18;
    v4 = 0;
    qword_100040E80 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("_PSSuggesterConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100040E78 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000F050(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100040E80)
  {
    v3 = off_100038C18;
    v4 = 0;
    qword_100040E80 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("_PSEnsembleModel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100040E88 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000F104(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100040E80)
  {
    v3 = off_100038C18;
    v4 = 0;
    qword_100040E80 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("_PSFamilyRecommender");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100040E90 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000F1B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

Class sub_10000F1C4(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100040E80)
  {
    v3 = off_100038C18;
    v4 = 0;
    qword_100040E80 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("_PSAppUsageUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100040E98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000F28C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000F2A0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000F2B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000F2CC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_10000F508(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  os_activity_scope_state_s state;
  _QWORD v21[2];
  _BYTE v22[128];

  v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.communication.triggerSync", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "devices", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isDefaultPairedDevice"))
        {
          v10 = (void *)IDSCopyIDForDevice(v9);
          objc_msgSend(v3, "addObject:", v10);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  if (objc_msgSend(v3, "count"))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v12 = *(void **)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v11, "dateByAddingTimeInterval:", -86400.0));
    v21[0] = v13;
    v21[1] = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2));
    v15 = objc_msgSend(v12, "synchronize:interval:withForecasts:", v3, v14, 1);

  }
  else
  {
    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(state.opaque[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to find devices to which to sync", (uint8_t *)&state, 2u);
    }
  }

}

void sub_10000F9D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = v5;
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "config"));
  if (v9 >= (double)(int)objc_msgSend(v11, "commSyncBoundarySeconds"))
  {

  }
  else
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v13 = v12;

    if (v13 > 0.0)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:", v7, v14);
  }

}

void sub_10000FDF8(uint64_t a1)
{
  id *v1;
  id v2;

  v1 = *(id **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1[8], "devices"));
  objc_msgSend(v1, "checkDevices:", v2);

}

void sub_10000FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010128(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  unsigned __int8 v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  id v29;
  uint8_t v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[2];
  _BYTE v36[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v4 = objc_msgSend(WeakRetained, "classCLocked");

  if ((v4 & 1) == 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
    {
      objc_msgSend(v2, "timeIntervalSinceDate:");
      v6 = v5;
      v7 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "config"));
      if (v6 >= (double)(int)objc_msgSend(v8, "commSyncBoundarySeconds"))
      {

      }
      else
      {
        objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
        v10 = v9;

        if (v10 >= 0.0)
          goto LABEL_25;
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "devices"));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = 0;
      v16 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v18, "isDefaultPairedDevice"))
          {
            v19 = (void *)IDSCopyIDForDevice(v18);
            objc_msgSend(v11, "addObject:", v19);

            v20 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uniqueIDOverride"));
            objc_msgSend(v20, "setObject:forKey:", v2, v21);

            v15 = 1;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v14);

      if ((v15 & 1) != 0)
      {
        v22 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "CDDCommunicator: **** exchange forecasts *****", v30, 2u);
        }

        if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) || (objc_msgSend(v2, "timeIntervalSinceDate:"), v23 <= 0.0))
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", -86400.0));
          v25 = *(_QWORD *)(a1 + 32);
          v26 = *(void **)(v25 + 72);
          *(_QWORD *)(v25 + 72) = v24;

        }
        v27 = *(_QWORD **)(a1 + 32);
        v35[0] = v27[9];
        v35[1] = v2;
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 2));
        v29 = objc_msgSend(v27, "synchronize:interval:withForecasts:", v11, v28, 1);

        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), v2);
        objc_msgSend(*(id *)(a1 + 32), "saveLastDate");
      }
    }
    else
    {

    }
  }
LABEL_25:

}

id sub_1000113F0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveData:context:device:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_1000118B8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id WeakRetained;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const char *v38;
  _BYTE v39[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "devices"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isDefaultPairedDevice"))
        {
          v9 = (void *)IDSCopyIDForDevice(v8);
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v2, "count");
  v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(*(id *)(a1 + 40), "length");
      v14 = "YES";
      if (!*(_BYTE *)(a1 + 64))
        v14 = "NO";
      *(_DWORD *)buf = 134218242;
      v36 = v13;
      v37 = 2080;
      v38 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "CDDCommunicator: performing immediate exchange (%lu bytes) opportunistically: %s.", buf, 0x16u);
    }

    v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = v15;
    if (*(_BYTE *)(a1 + 65))
      v17 = &__kCFBooleanFalse;
    else
      v17 = &__kCFBooleanTrue;
    if (*(_BYTE *)(a1 + 65))
      v18 = 300;
    else
      v18 = 200;
    objc_msgSend(v15, "setObject:forKey:", v17, IDSSendMessageOptionForceLocalDeliveryKey);
    objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, IDSSendMessageOptionExpectsPeerResponseKey);
    objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, IDSSendMessageOptionBypassDuetKey);
    objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey);
    objc_msgSend(v16, "setObject:forKey:", *(_QWORD *)(a1 + 48), IDSSendMessageOptionTimeoutKey);
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(v16, "setObject:forKey:", &__kCFBooleanTrue, IDSSendMessageOptionOpportunisticDuetKey);
    v19 = *(_QWORD *)(a1 + 56);
    if (v19)
      objc_msgSend(v16, "setObject:forKey:", v19, IDSSendMessageOptionQueueOneIdentifierKey);
    v20 = *(_QWORD *)(a1 + 40);
    v21 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    v29 = 0;
    v30 = 0;
    v22 = objc_msgSend(v21, "sendData:toDestinations:priority:options:identifier:error:", v20, v2, v18, v16, &v30, &v29);
    v23 = v30;
    v24 = v29;
    if ((v22 & 1) == 0)
    {
      v25 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "description")));
        v27 = objc_msgSend(v26, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v36 = v27;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "CDDCommunicator: triggeredExchange: send error %s.", buf, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
      objc_msgSend(WeakRetained, "informCommunicationError");

    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "CDDCommunicator: No device paired - Data will not be send out", buf, 2u);
    }

    v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(v23, "informCommunicationError");
  }

}

void sub_100011FC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000124E8(uint64_t a1)
{
  id WeakRetained;
  unsigned __int8 v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  void *v30;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _BYTE v37[128];

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  v3 = objc_msgSend(WeakRetained, "classCLocked");

  if ((v3 & 1) != 0)
    goto LABEL_22;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = *(id *)(a1 + 40);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (!v5)
    goto LABEL_21;
  v6 = v5;
  v29 = 0;
  v7 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v33 != v7)
        objc_enumerationMutation(v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceFromDeviceDescription:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i)));
      if (objc_msgSend(v9, "isDefaultPairedDevice"))
      {
        v10 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIDOverride"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v14 = v13;
        if (v12)
        {
          objc_msgSend(v13, "timeIntervalSinceDate:", v12);
          v16 = v15;
          v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "config"));
          if (v16 >= (double)(int)objc_msgSend(v18, "commSyncBoundarySeconds"))
          {

          }
          else
          {
            objc_msgSend(v14, "timeIntervalSinceDate:", v12);
            v20 = v19;

            if (v20 >= 0.0)
              goto LABEL_14;
          }
        }
        v21 = (void *)IDSCopyIDForDevice(v9);
        objc_msgSend(v30, "addObject:", v21);

        v22 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIDOverride"));
        objc_msgSend(v22, "setObject:forKey:", v14, v23);

        v29 = 1;
LABEL_14:

      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  }
  while (v6);

  if ((v29 & 1) != 0)
  {
    v24 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "CDDCommunicator: **** exchange forecasts on new device *****", buf, 2u);
    }

    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -86400.0));
    v26 = *(void **)(a1 + 32);
    v36[0] = v25;
    v36[1] = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 2));
    v28 = objc_msgSend(v26, "synchronize:interval:withForecasts:", v30, v27, 1);

    objc_msgSend(*(id *)(a1 + 32), "saveLastDate");
LABEL_21:

  }
LABEL_22:

}

void sub_100012DEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100013498(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

Class sub_1000134A4(uint64_t a1)
{
  Class result;
  __int128 v3;
  uint64_t v4;

  if (!qword_100040EA8)
  {
    v3 = off_100038CD0;
    v4 = 0;
    qword_100040EA8 = _sl_dlopen(&v3, 0);
  }
  result = objc_getClass("PSYSyncCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  qword_100040EA0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t start()
{
  void *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)os_transaction_create("coreduetd main");
  v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "coreduetdStartup", " enableTelemetry=YES ", buf, 2u);
  }

  v3 = objc_claimAutoreleasedReturnValue(+[CDD sharedInstance](CDD, "sharedInstance"));
  v4 = (void *)qword_100040EB0;
  qword_100040EB0 = v3;

  v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "main: creating CDDaemonManager...", v10, 2u);
  }

  v6 = +[CDServiceManager sharedInstance](CDServiceManager, "sharedInstance");
  v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeSignpost](_CDLogging, "knowledgeSignpost"));
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "coreduetdStartup", "", v9, 2u);
  }

  objc_autoreleasePoolPop(v0);
  CFRunLoopRun();
  return 1;
}

id sub_100013B9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setupPairedSyncClient");
}

unsigned __int8 *sub_100013FA8(uint64_t a1)
{
  unsigned int v2;
  unsigned __int8 *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isPluggedIn");
  result = *(unsigned __int8 **)(a1 + 32);
  if (result[136] != v2)
    return (unsigned __int8 *)objc_msgSend(result, "triggerSystemDataExchange:wakeRemote:", 1, 1);
  return result;
}

void sub_100013FF4(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "currentBatteryLevel");
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(double *)(v2 + 128) - v3;
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = -v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 8), "config"));
  v7 = (double)(int)objc_msgSend(v6, "batteryMonitorExchangeBattDelta");

  if (v5 > v7)
    objc_msgSend(*(id *)(a1 + 32), "triggerSystemDataExchange:wakeRemote:", 1, 0);
}

_DWORD *sub_100014078(uint64_t a1)
{
  unsigned int v2;
  _DWORD *result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "thermalPressureLevel");
  result = *(_DWORD **)(a1 + 32);
  if (v2 != result[35])
    return objc_msgSend(result, "triggerSystemDataExchange:wakeRemote:", 1, 0);
  return result;
}

id sub_1000140C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleAppStateChanged");
}

id sub_1000140CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNetworkChanged");
}

void sub_1000146B0(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4;

  v4 = objc_msgSend(a2, "pointerValue", a3, a4);
  if (v4)
    free(v4);
}

void sub_1000150E0(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(v1, "addObject:", v2);

}

void sub_1000152D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000152F8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100015308(uint64_t a1)
{

}

intptr_t sub_100015310(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (!a2)
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "elements", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "isSpringBoardElement")
          && objc_msgSend(v8, "layoutRole") == (id)1
          && objc_msgSend(v8, "isUIApplicationElement"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));

          if (v9)
          {
            v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v12 = *(void **)(v11 + 40);
            *(_QWORD *)(v11 + 40) = v10;

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_1000158A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _QWORD *v8;
  id v9;
  _QWORD v11[7];
  _QWORD applier[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v7 = a1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1000152F8;
  v17 = sub_100015308;
  v18 = objc_alloc_init((Class)NSMutableDictionary);
  if (a3)
    __assert_rtn("processForecastXPCObject", "CDDCommunicator.m", 751, "0");
  if (a4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100015BF8;
    v11[3] = &unk_100038E20;
    v11[4] = &v13;
    v11[5] = a2;
    v11[6] = a4;
    v8 = v11;
  }
  else
  {
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_1000159FC;
    applier[3] = &unk_100038DD0;
    applier[4] = &v13;
    v8 = applier;
  }
  xpc_dictionary_apply(v7, v8);
  v9 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v9;
}

void sub_1000159E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000159FC(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSNumber *v10;
  const __CFString *v11;
  NSNumber *v12;
  _QWORD applier[4];
  id v15;

  v5 = a3;
  if (!strcmp(a2, "itemsInForecast"))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_uint64_get_value(v5));
    v6 = (id)objc_claimAutoreleasedReturnValue(v10);
    v11 = CFSTR("itemsInForecast");
LABEL_6:
    objc_msgSend(v9, "setObject:forKey:", v6, v11);
    goto LABEL_7;
  }
  if (!strcmp(a2, "databaseEpochSeconds"))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_uint64_get_value(v5));
    v6 = (id)objc_claimAutoreleasedReturnValue(v12);
    v11 = CFSTR("databaseEpochSeconds");
    goto LABEL_6;
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_100015B7C;
  applier[3] = &unk_100038DA8;
  v15 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = v15;
  xpc_dictionary_apply(v5, applier);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

LABEL_7:
  return 1;
}

uint64_t sub_100015B7C(uint64_t a1, uint64_t a2, xpc_object_t xdouble)
{
  void *v4;
  NSNumber *v5;
  void *v6;
  void *v7;

  v4 = *(void **)(a1 + 32);
  v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(xdouble));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  objc_msgSend(v4, "setObject:forKey:", v6, v7);

  return 1;
}

uint64_t sub_100015BF8(_QWORD *a1, const char *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  const __CFString *v13;
  NSNumber *v14;
  _QWORD applier[4];
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  if (!strcmp(a2, "itemsInForecast"))
  {
    v11 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_int64_get_value(v5));
    v8 = (id)objc_claimAutoreleasedReturnValue(v12);
    v13 = CFSTR("itemsInForecast");
LABEL_6:
    objc_msgSend(v11, "setObject:forKey:", v8, v13);
    goto LABEL_7;
  }
  if (!strcmp(a2, "databaseEpochSeconds"))
  {
    v11 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
    v14 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", xpc_uint64_get_value(v5));
    v8 = (id)objc_claimAutoreleasedReturnValue(v14);
    v13 = CFSTR("databaseEpochSeconds");
    goto LABEL_6;
  }
  v6 = objc_alloc_init((Class)NSMutableDictionary);
  applier[0] = _NSConcreteStackBlock;
  applier[2] = sub_100015D80;
  applier[3] = &unk_100038DF8;
  v7 = a1[6];
  v18 = a1[5];
  v19 = v7;
  applier[1] = 3221225472;
  v17 = v6;
  v8 = v6;
  xpc_dictionary_apply(v5, applier);
  v9 = *(void **)(*(_QWORD *)(a1[4] + 8) + 40);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  objc_msgSend(v9, "setObject:forKey:", v8, v10);

LABEL_7:
  return 1;
}

uint64_t sub_100015D80(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSNumber *v11;
  void *v12;
  void *v13;
  double v15;
  void *v16;
  double v17;
  double v18;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 == 2)
  {
    if (strcmp(**(const char ***)(a1 + 48), a2))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v15 = **(float **)(a1 + 48);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v18 != v15)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v6)
    sub_100022DBC();
  v7 = **(id **)(a1 + 48);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  v9 = objc_msgSend(v8, "longLongValue");

  if (v7 == v9)
  {
LABEL_5:
    v10 = *(void **)(a1 + 32);
    v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", xpc_double_get_value(v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
    objc_msgSend(v10, "setObject:forKey:", v12, v13);

  }
LABEL_6:

  return 1;
}

void sub_10001612C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (!qword_100040EB8)
  {
    v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getVersionsDictFromMaxVersion:minVersion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232)));
    v2 = (void *)qword_100040EB8;
    qword_100040EB8 = v1;

  }
}

void sub_1000162E0(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 80);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001635C;
  v6[3] = &unk_100038E48;
  v4 = v2;
  v5 = a1[4];
  v7 = v4;
  v8 = v5;
  v9 = a1[6];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);

}

void sub_10001635C(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  __int16 v9[8];
  uint8_t buf[16];

  v3 = objc_msgSend(a2, "pointerValue");
  if (v3)
  {
    v4 = v3;
    v5 = (char *)(v3 + 2);
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
    v4[5] = (unint64_t)v6 - *v4;
    v4[6] = (unint64_t)v6;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "makeForecastMessage:", v5));
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v7);
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: getForecasts: failed to get forecasts.", (uint8_t *)v9, 2u);
      }

    }
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CDDCommunicator: bad forecast parameters.", buf, 2u);
    }
  }

}

uint64_t sub_1000169C4(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;

  v3 = a1;
  v4 = a2;
  if (v3 && objc_msgSend(v3, "count"))
    v5 = (uint64_t)objc_msgSend(v3, "containsObject:", v4);
  else
    v5 = 1;

  return v5;
}

_QWORD *sub_100017518(void *a1)
{
  id v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = a1;
  v2 = malloc_type_calloc(1uLL, 0x78uLL, 0x10100401C9C3943uLL);
  if (!v2)
    sub_100022E98();
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B260));
  v3[8] = objc_msgSend(v4, "unsignedLongLongValue");

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B278));
  v3[9] = objc_msgSend(v5, "unsignedLongLongValue");

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B290));
  v3[3] = objc_msgSend(v6, "unsignedLongLongValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B2A8));
  v3[4] = objc_msgSend(v7, "unsignedLongLongValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B248));
  v3[5] = objc_msgSend(v8, "unsignedLongLongValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B2C0));
  v3[6] = objc_msgSend(v9, "unsignedLongLongValue");

  v3[7] = -1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B230));
  v3[13] = objc_msgSend(v10, "unsignedLongLongValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKey:", &off_10003B308));
  v12 = v11;
  if (v11)
  {
    v13 = v3[8];
    v14 = 1;
    if ((v13 & 0x800) == 0)
      v14 = 2;
    if ((v13 & 0x400) != 0)
      v15 = 0;
    else
      v15 = v14;
    if (v15 == 2)
    {
      v3[2] = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    }
    else if (v15 == 1)
    {
      objc_msgSend(v11, "doubleValue");
      v3[1] = v16;
    }
    else
    {
      *v3 = objc_msgSend(v11, "longLongValue");
    }
  }

  return v3;
}

id sub_100017F14(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 112), "setObject:forKey:", a1[5], a1[6]);
}

id sub_100018138(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  v1 = *(void **)(a1 + 32);
  if (*(_DWORD *)(a1 + 48))
    v2 = objc_msgSend(*(id *)(a1 + 40), "count") != 0;
  else
    v2 = 1;
  return objc_msgSend(v1, "exchangeSystemComboMessage:", v2);
}

void sub_1000182B8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(a1 + 48))
  {
    v3 = *(void **)(v2 + 88);
    if (!v3)
      return;
    if (!objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40)))
      return;
    v4 = sub_1000169C4(*(void **)(*(_QWORD *)(a1 + 32) + 104), *(void **)(*(_QWORD *)(a1 + 32) + 88));
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = 0;

    if (!v4)
      return;
  }
  else
  {
    if ((sub_1000169C4(*(void **)(v2 + 104), *(void **)(v2 + 88)) & 1) == 0
      && !sub_1000169C4(*(void **)(*(_QWORD *)(a1 + 32) + 104), *(void **)(a1 + 40)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
      return;
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 88), *(id *)(a1 + 40));
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v7 + 88) && (objc_msgSend(*(id *)(v7 + 184), "containsObject:") & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "UTF8String");
      v11 = 136315138;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting focal app (%s).", (uint8_t *)&v11, 0xCu);
    }
    v9 = 0;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    v9 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting focal app NIL.", (uint8_t *)&v11, 2u);
    }
  }

  if (*(_BYTE *)(a1 + 52))
    objc_msgSend(*(id *)(a1 + 32), "exchangeSystemComboMessage:", v9);
}

void sub_10001852C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018544(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsJoinedByString:", CFSTR(",")));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  v11 = v4;
  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(",%@"), v4, v4));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    v10 = v4;
    v9 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v10;
  }

}

id sub_100018670(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:");
}

id sub_100018748(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  return result;
}

void sub_100018AB4(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[168])
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "makeSystemComboMessage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateFocalNonAppFocalMutableSet"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0));
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    v6 = *(unsigned __int8 *)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
    objc_msgSend(v5, "triggeredExchange:opportunistic:queue:timeout:urgent:", v4, v6, 0, v7, 0);

    v8 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 120);
    *(_QWORD *)(v9 + 120) = v8;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "setSet:", v3);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 168) = 0;

  }
}

void sub_100018CE8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  id v24;
  void *v25;
  int v26;
  int v27;
  id v28;
  __int16 v29;
  id v30;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", v3));

  v5 = *(void **)(a1 + 40);
  if (v5 && objc_msgSend(v5, "count"))
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToArray:", v4) & 1) != 0)
      goto LABEL_27;
    if (*(_QWORD *)(a1 + 48) == 28
      && objc_msgSend(*(id *)(a1 + 40), "containsObject:", CFSTR("com.apple.Siri")))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForSiriActiveStatus](_CDContextQueries, "keyPathForSiriActiveStatus"));
      objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, v7);

    }
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v9, "setObject:forKey:", v8, v10);

    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(void **)(a1 + 48);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "description")));
      v27 = 134218242;
      v28 = v12;
      v29 = 2080;
      v30 = objc_msgSend(v13, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: client %lld set focal nonapp (%s).", (uint8_t *)&v27, 0x16u);

    }
    v14 = 0;
  }
  else
  {
    if (!objc_msgSend(v4, "count"))
      goto LABEL_27;
    if (*(_QWORD *)(a1 + 48) == 28
      && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", CFSTR("com.apple.Siri")) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[_CDClientContext userContext](_CDClientContext, "userContext"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[_CDContextQueries keyPathForSiriActiveStatus](_CDContextQueries, "keyPathForSiriActiveStatus"));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, v16);

    }
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48)));
    objc_msgSend(v17, "removeObjectForKey:", v18);

    v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    v14 = 1;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v19 = *(void **)(a1 + 48);
      v27 = 134217984;
      v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CDDCommunicator: client %lld set focal nonapp NIL.", (uint8_t *)&v27, 0xCu);
    }
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateNonAppFocalString"));
  v21 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
  if (v20)
  {
    if (v22)
    {
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "description")));
      v24 = objc_msgSend(v23, "UTF8String");
      v27 = 136315138;
      v28 = v24;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting non-app focal state (%s).", (uint8_t *)&v27, 0xCu);

    }
  }
  else if (v22)
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "CDDCommunicator: Attempting to broadcasting non-app focal state NIL.", (uint8_t *)&v27, 2u);
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "config"));
  if (objc_msgSend(v25, "commEnabled") && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200))
  {
    v26 = *(unsigned __int8 *)(a1 + 56);

    if (v26)
      objc_msgSend(*(id *)(a1 + 32), "exchangeSystemComboMessage:", v14);
  }
  else
  {

  }
LABEL_27:

}

void sub_1000191F0(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v3 = v2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120)
    || (objc_msgSend(v2, "timeIntervalSinceDate:"),
        v5 = v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "config")),
        v7 = (double)(int)objc_msgSend(v6, "batteryMonitorExchangeTimerDelta"),
        v6,
        v5 >= v7)
    || *(_BYTE *)(a1 + 40))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CDDCommunicator: broadcasting system data.", v16, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "makeSystemComboMessage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, 0));
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(_BYTE *)(a1 + 41) == 0;
    v13 = *(void **)(v11 + 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v11 + 8), "config"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "batteryMonitorExchangeTimerDelta")));
    objc_msgSend(v13, "triggeredExchange:opportunistic:queue:timeout:urgent:", v10, v12, 0, v15, 0);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), v3);
  }

}

void sub_10001945C(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "makeRemoteDeviceSyncMessage"));
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, 0));
    v4 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CDDCommunicator: Requesting remote device to sync states", v7, 2u);
      }

      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v4 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout));
      objc_msgSend(v6, "triggeredExchange:opportunistic:queue:timeout:urgent:", v3, 0, CFSTR("DuetRemoteDeviceSyncRequest"), v4, 1);
    }
    else if (v5)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CDDCommunicator: requestRemoteDeviceSync: failed to archive message, bail.", v8, 2u);
    }

  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CDDCommunicator: requestRemoteDeviceSync: failed to make request message, bail.", buf, 2u);
    }
  }

}

uint64_t sub_100019820(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100019F78(id a1)
{
  CDKnowledgeDaemon *v1;
  uint64_t v2;
  void *v3;
  CDKnowledgeDaemon *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  +[_DKCloudUtilities setCloudKitEnabled:](_DKCloudUtilities, "setCloudKitEnabled:", 1);
  v1 = [CDKnowledgeDaemon alloc];
  v2 = _DKMachServiceName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths knowledgeDatabaseDirectory](CDDPaths, "knowledgeDatabaseDirectory"));
  v4 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](v1, "initWithMachServiceName:storePath:", v2, v3);
  v5 = (void *)qword_100040ED0;
  qword_100040ED0 = (uint64_t)v4;

  v6 = objc_alloc((Class)_CDIntentSpotlightIndex);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040ED0, "storage"));
  v8 = objc_msgSend(v6, "initWithKnowledgeStorage:", v7);
  objc_msgSend((id)qword_100040ED0, "setIntentSpotlightIndex:", v8);

  objc_msgSend((id)qword_100040ED0, "registerARPHomeControlNotificationTask");
  objc_msgSend((id)qword_100040ED0, "registerCloudFamilyPredictionTask");
  objc_msgSend((id)qword_100040ED0, "registerContactsAutocompleteFeedbackProcessingTask");
  objc_msgSend((id)qword_100040ED0, "registerDataCollectionTasks");
  objc_msgSend((id)qword_100040ED0, "registerPeopleSuggesterTasks");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040ED0, "storage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directory"));
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreduet.system.sync.coordinator.context:%@"), v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040ED0, "storage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "databaseName"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingPathComponent:", v14));

  v16 = objc_msgSend(objc_alloc((Class)_DKSyncContext), "initWithName:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040ED0, "storage"));
  objc_msgSend(v16, "setStorage:", v17);

  v18 = objc_claimAutoreleasedReturnValue(+[_DKSyncCoordinatorFactory syncCoordinatorWithContext:](_DKSyncCoordinatorFactory, "syncCoordinatorWithContext:", v16));
  v19 = (void *)qword_100040EC8;
  qword_100040EC8 = v18;

  objc_msgSend((id)qword_100040ED0, "setSyncCoordinator:", qword_100040EC8);
}

void sub_10001A1CC(id a1)
{
  CDKnowledgeDaemon *v1;
  uint64_t v2;
  void *v3;
  CDKnowledgeDaemon *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  +[_DKCloudUtilities setCloudKitEnabled:](_DKCloudUtilities, "setCloudKitEnabled:", 1);
  v1 = [CDKnowledgeDaemon alloc];
  v2 = _DKUserLocalMachServiceName;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths userLocalKnowledgeDatabaseDirectory](CDDPaths, "userLocalKnowledgeDatabaseDirectory"));
  v4 = -[CDKnowledgeDaemon initWithMachServiceName:storePath:](v1, "initWithMachServiceName:storePath:", v2, v3);
  v5 = (void *)qword_100040EE8;
  qword_100040EE8 = (uint64_t)v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040EE8, "storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storage"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "directory"));
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.coreduet.user.sync.coordinator.context:%@"), v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040EE8, "storage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "databaseName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingPathComponent:", v11));

  v13 = objc_msgSend(objc_alloc((Class)_DKSyncContext), "initWithName:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100040EE8, "storage"));
  objc_msgSend(v13, "setStorage:", v14);

  v15 = objc_claimAutoreleasedReturnValue(+[_DKSyncCoordinatorFactory syncCoordinatorWithContext:](_DKSyncCoordinatorFactory, "syncCoordinatorWithContext:", v13));
  v16 = (void *)qword_100040EE0;
  qword_100040EE0 = v15;

  objc_msgSend((id)qword_100040EE8, "setSyncCoordinator:", qword_100040EE0);
}

void sub_10001AA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AAAC(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _xpc_activity_s *v4;
  id WeakRetained;
  NSObject *v6;
  os_activity_scope_state_s v7;

  v2 = objc_autoreleasePoolPush();
  v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v3, &v7);
  os_activity_scope_leave(&v7);

  v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activity"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "maintainPrivacyWithActivity:", v4);

  if (v4 && xpc_activity_should_defer(v4) && !xpc_activity_set_state(v4, 3))
  {
    v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100022FCC(v6);

  }
  objc_autoreleasePoolPop(v2);
}

void sub_10001B6F4(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "closeStorage");
  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", _DKKnowledgeStorageDidAgeOutEventsNotification, 0);

}

void sub_10001BFCC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t v14;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.cdinteraction.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_alloc((Class)_CDInteractionDataCollectionTask);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v6, 0));
      v8 = objc_msgSend(v5, "initWithStore:activity:", v7, v2);

      objc_msgSend(v8, "execute");
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v18 = XPC_ACTIVITY_PRIORITY;
    v19 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v20 = XPC_ACTIVITY_POWER_NAP;
    v21 = XPC_ACTIVITY_ALLOW_BATTERY;
    v22 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v9 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v10 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v11 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v12 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v13 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v14 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v14);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001C208(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  xpc_object_t v14;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.cdftcpinteraction.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_alloc((Class)_CDFTCPInteractionDataCollectionTask);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v6, 0));
      v8 = objc_msgSend(v5, "initWithStore:activity:", v7, v2);

      objc_msgSend(v8, "execute");
    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v18 = XPC_ACTIVITY_PRIORITY;
    v19 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v20 = XPC_ACTIVITY_POWER_NAP;
    v21 = XPC_ACTIVITY_ALLOW_BATTERY;
    v22 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v9 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v10 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v11 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v12 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v13 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v14 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v14);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001C4D8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.PersonLinking", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_msgSend(objc_alloc((Class)_CDPersonLinkingDataCollectionTask), "initWithFile:activity:", CFSTR("/var/mobile/Library/CoreDuet/DataCollection/person_pairs_pet.json"), v2);
      objc_msgSend(v5, "execute");

    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v15 = XPC_ACTIVITY_PRIORITY;
    v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v17 = XPC_ACTIVITY_POWER_NAP;
    v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v10 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001C6D4(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.datacollection.VisionSignalGrading", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_msgSend(objc_alloc((Class)_CDVisionSignalGradingDataCollectionTask), "initWithFile:activity:", CFSTR("/var/mobile/Library/CoreDuet/DataCollection/vision_grades_pet.json"), v2);
      objc_msgSend(v5, "execute");

    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v15 = XPC_ACTIVITY_PRIORITY;
    v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v17 = XPC_ACTIVITY_POWER_NAP;
    v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v10 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001C8D0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.cloudfamily.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_alloc_init((Class)_PSFamilyMLPredictionTask);
      objc_msgSend(v5, "execute:", v2);

    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v15 = XPC_ACTIVITY_PRIORITY;
    v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v17 = XPC_ACTIVITY_POWER_NAP;
    v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v10 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001CAC0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t v3;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  xpc_object_t v11;
  uint64_t i;
  xpc_object_t values[7];
  os_activity_scope_state_s state;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v2 = a2;
  v3 = xpc_activity_get_state(v2);
  if (v3)
  {
    if (v3 == 2)
    {
      v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.feedback.cna.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v4, &state);
      os_activity_scope_leave(&state);

      v5 = objc_alloc_init((Class)_PSCNAutocompleteFeedbackProcessingTask);
      objc_msgSend(v5, "execute");

    }
  }
  else
  {
    state.opaque[0] = (uint64_t)XPC_ACTIVITY_INTERVAL;
    state.opaque[1] = (uint64_t)XPC_ACTIVITY_REPEATING;
    v15 = XPC_ACTIVITY_PRIORITY;
    v16 = XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP;
    v17 = XPC_ACTIVITY_POWER_NAP;
    v18 = XPC_ACTIVITY_ALLOW_BATTERY;
    v19 = XPC_ACTIVITY_REQUIRES_CLASS_C;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    v6 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    v7 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v8 = &_xpc_BOOL_true;
    values[4] = &_xpc_BOOL_true;
    v9 = &_xpc_BOOL_false;
    values[5] = &_xpc_BOOL_false;
    v10 = &_xpc_BOOL_true;
    values[6] = &_xpc_BOOL_true;
    v11 = xpc_dictionary_create((const char *const *)&state, values, 7uLL);
    xpc_activity_set_criteria(v2, v11);

    for (i = 6; i != -1; --i)
  }

}

void sub_10001CCF4(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_activity_state_t state;
  id v4;
  id v5;
  xpc_object_t v6;
  uint64_t i;
  xpc_object_t values[4];
  char *keys[4];

  v2 = a2;
  state = xpc_activity_get_state(v2);
  if (state)
  {
    if (state == 2)
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.AirPlayRoutePrediction.ARPHomeControlSuggester.ReQuery"), "UTF8String"));
  }
  else
  {
    keys[0] = (char *)XPC_ACTIVITY_INTERVAL;
    keys[1] = (char *)XPC_ACTIVITY_REPEATING;
    keys[2] = (char *)XPC_ACTIVITY_PRIORITY;
    keys[3] = (char *)XPC_ACTIVITY_ALLOW_BATTERY;
    values[0] = xpc_int64_create(XPC_ACTIVITY_INTERVAL_30_MIN);
    v4 = &_xpc_BOOL_true;
    values[1] = &_xpc_BOOL_true;
    values[2] = xpc_string_create(XPC_ACTIVITY_PRIORITY_UTILITY);
    v5 = &_xpc_BOOL_true;
    values[3] = &_xpc_BOOL_true;
    v6 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
    xpc_activity_set_criteria(v2, v6);

    for (i = 3; i != -1; --i)
  }

}

void sub_10001CED4(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  xpc_object_t empty;
  xpc_object_t v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  os_activity_scope_state_s state;

  v3 = a2;
  v4 = xpc_activity_get_state(v3);
  if (v4)
  {
    if (v4 == 2)
    {
      v5 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.mediaanalysis.proc.task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(v5, &state);
      os_activity_scope_leave(&state);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDPaths peopleDirectory](_CDPaths, "peopleDirectory"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("MediaAnalysisProcessing")));
      v8 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", v7);
      if (v8)
      {
        v22 = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v8, 0, 0, &v22));
        v10 = v22;
        if (v10)
        {
          v11 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            sub_100023264(v10, v11);

        }
        if (v9)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_PSMediaAnalysisProcessing")));
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BookmarkDate")));
          if (v13)
          {
            v14 = *(_QWORD *)(a1 + 32);
            v15 = *(void **)(v14 + 32);
            *(_QWORD *)(v14 + 32) = v13;

LABEL_15:
            v21 = objc_msgSend(objc_alloc((Class)_PSMediaAnalysisProcessingTask), "initWithBookmark:interactionStore:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), 0);
            objc_msgSend(v21, "executeTaskWithCompletionHandler:", &stru_1000390F0);

            goto LABEL_16;
          }

        }
      }
      v19 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
      v20 = *(_QWORD *)(a1 + 32);
      v10 = *(id *)(v20 + 32);
      *(_QWORD *)(v20 + 32) = v19;
      goto LABEL_15;
    }
  }
  else
  {
    empty = xpc_dictionary_create_empty();
    v17 = xpc_int64_create(XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_INTERVAL, v17);

    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REPEATING, &_xpc_BOOL_true);
    v18 = xpc_string_create(XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_PRIORITY, v18);

    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, &_xpc_BOOL_true);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_POWER_NAP, &_xpc_BOOL_true);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_ALLOW_BATTERY, &_xpc_BOOL_false);
    xpc_dictionary_set_value(empty, XPC_ACTIVITY_REQUIRES_CLASS_C, &_xpc_BOOL_true);
    xpc_activity_set_criteria(v3, empty);

  }
LABEL_16:

}

void sub_10001D2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);

}

void sub_10001D420(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);

}

void sub_10001D550(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(+[_CDErrorUtilities transformErrorForNSSecureCoding:](_CDErrorUtilities, "transformErrorForNSSecureCoding:"));
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a2, v4);

}

id sub_10001D870(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D884(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D898(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D8AC(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D8C0(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D8D4(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D8E8(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D8FC(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D910(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D924(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D938(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D94C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D960(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D974(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D988(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D99C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D9B0(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D9C4(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D9D8(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001D9EC(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA00(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA14(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA28(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA3C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA50(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA64(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA78(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DA8C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DAA0(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DAB4(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DAC8(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DADC(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DAF0(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB04(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB18(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB2C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB40(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB54(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB68(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB7C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DB90(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DBA4(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DBB8(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DBCC(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DBE0(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DBF4(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DC08(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DC1C(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DC30(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

id sub_10001DC44(void *a1)
{
  return objc_msgSend(a1, "invoke");
}

void sub_10001DC58(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001DC78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10001DC88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10001E100(id a1)
{
  CDDataMigrator *v1;
  void *v2;

  v1 = objc_alloc_init(CDDataMigrator);
  v2 = (void *)qword_100040EF8;
  qword_100040EF8 = (uint64_t)v1;

}

void sub_10001E1EC(id a1, int a2)
{
  notify_cancel(a2);
  +[CDDataMigrator performMigration](CDDataMigrator, "performMigration");
}

uint64_t sub_10001E94C(uint64_t a1, int a2, const char **a3, const char **a4)
{
  void *v7;
  uint64_t v8;
  int v9;

  v7 = objc_autoreleasePoolPush();
  if (a2 == 1 && !strcmp(*a4, "ZINTEGERID"))
  {
    v9 = atoi(*a3);
    v8 = 0;
    qword_100040F08 = v9;
  }
  else
  {
    v8 = 1;
  }
  objc_autoreleasePoolPop(v7);
  return v8;
}

uint64_t sub_10001E9C8(void *a1, int a2, const char **a3, const char **a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v25;
  void *v26;
  id v27;

  v8 = objc_autoreleasePoolPush();
  v9 = v8;
  if (a2 < 1)
  {
    v10 = 0;
    v11 = 0;
    goto LABEL_24;
  }
  v25 = a1;
  v26 = v8;
  v10 = 0;
  v11 = 0;
  v12 = a2;
  do
  {
    v13 = *a4;
    if (!strcmp(*a4, "ZCREATIONDATE"))
    {
      v16 = strtod(*a3, 0);
      if (v16 <= 0.0)
        goto LABEL_9;
      v17 = objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -v16));
      v15 = v10;
      v10 = (id)v17;
    }
    else
    {
      if (strcmp(v13, "ZVALUE"))
        goto LABEL_9;
      v14 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *a3));
      v15 = v11;
      v11 = (id)v14;
    }

LABEL_9:
    ++a3;
    ++a4;
    --v12;
  }
  while (v12);
  if (v10)
  {
    v9 = v26;
    if (v11)
    {
      v18 = v25;
      v11 = v11;
      v10 = v10;
      v19 = objc_autoreleasePoolPush();
      if (qword_100040F10 != -1)
        dispatch_once(&qword_100040F10, &stru_100039310);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[_DKEvent eventWithStream:startDate:endDate:identifierStringValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", qword_100040F18, v10, v10, v11, 0));
      objc_autoreleasePoolPop(v19);

      objc_msgSend(v18, "addObject:", v20);
      if ((unint64_t)objc_msgSend(v18, "count") >= 0x101)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[_DKKnowledgeStore knowledgeStore](_DKKnowledgeStore, "knowledgeStore"));
        v27 = 0;
        objc_msgSend(v21, "saveObjects:error:", v18, &v27);
        v22 = v27;
        if (v22)
        {
          v23 = objc_claimAutoreleasedReturnValue(+[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel"));
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            sub_100023498();

        }
        else
        {
          objc_msgSend(v18, "removeAllObjects");
        }

      }
    }
  }
  else
  {
    v9 = v26;
  }
LABEL_24:

  objc_autoreleasePoolPop(v9);
  return 0;
}

void sub_10001F324(id a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_DKAnyStringIdentifier type](_DKAnyStringIdentifier, "type"));
  v1 = objc_claimAutoreleasedReturnValue(+[_DKEventStream eventStreamWithName:valueType:](_DKEventStream, "eventStreamWithName:valueType:", CFSTR("com.apple.spotlightviewer.events"), v3));
  v2 = (void *)qword_100040F18;
  qword_100040F18 = v1;

}

void sub_10001F38C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001F3DC(id a1)
{
  CDD *v1;
  void *v2;

  v1 = objc_alloc_init(CDD);
  v2 = (void *)qword_100040F20;
  qword_100040F20 = (uint64_t)v1;

}

uint64_t sub_10001F8F0(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isClassCLocked") & 1) == 0)
  {
    v2 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Class C unlocked...", v4, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
  return notify_cancel(*(_DWORD *)(a1 + 40));
}

id sub_10001F97C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isLocked");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 57) = (_BYTE)result;
  return result;
}

id sub_10001FA54(uint64_t a1)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v6 = 0u;
  v10 = 0u;
  v9 = 0u;
  v4 = 0u;
  v5 = 0u;
  v3 = 1814400;
  v7 = 0uLL;
  v8 = xmmword_100031E40;
  v11 = 0uLL;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerScheduledExchange:", &v3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setupCommControl");
}

void sub_100020740(id a1, id a2)
{
  (*((void (**)(id))a2 + 2))(a2);
}

id sub_10002075C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%s"), v2, "XQW90"));
  v5 = objc_msgSend(v3, "hasPrefix:", v4);

  return v5;
}

void sub_100020AFC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  v4 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100020B94;
    v6[3] = &unk_1000396E8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

  }
}

id sub_100020B94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &off_10003B800, a2);
}

void sub_100021008(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_CDLogging communicatorChannel](_CDLogging, "communicatorChannel"));
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100023560((uint64_t)v5, v7);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 40);
    v10 = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Saved histogram: %@", (uint8_t *)&v10, 0xCu);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[CDKnowledgeDaemon defaultDaemon](CDKnowledgeDaemon, "defaultDaemon"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject storage](v7, "storage"));
    objc_msgSend(v9, "deleteHistogram:", *(_QWORD *)(a1 + 48));

LABEL_9:
  }

}

void sub_1000213B8(id a1, id a2)
{
  (*((void (**)(id))a2 + 2))(a2);
}

void sub_100022164(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "privacyCloak");
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cdd"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "communicator"));
  objc_msgSend(v3, "triggerSystemDataExchange:wakeRemote:", 1, 0);

}

_BYTE *sub_100022220(uint64_t a1)
{
  _BYTE *result;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "isManagedConfigurationSettingOn") & 1) != 0)
  {
    result = *(_BYTE **)(a1 + 32);
    if (!result[24])
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(result, "cdd"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v3, "setDatabaseAge:", v4);

      result = *(_BYTE **)(a1 + 32);
    }
    result[24] = 1;
  }
  else
  {
    v5 = objc_claimAutoreleasedReturnValue(+[_CDLogging admissionCheckChannel](_CDLogging, "admissionCheckChannel"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting All Sensitive Entries in DB.", v6, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    return objc_msgSend(*(id *)(a1 + 32), "deletePrivacySensitiveDBEntries");
  }
  return result;
}

void sub_100022394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000570C((void *)&_mh_execute_header, &_os_log_default, a3, "Registering xpc_set_event_stream_handler(\"com.apple.distnoted.matching\"", a5, a6, a7, a8, 0);
}

void sub_1000223CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000570C((void *)&_mh_execute_header, &_os_log_default, a3, "Registering xpc_set_event_stream_handler(\"com.apple.notifyd.matching\"", a5, a6, a7, a8, 0);
}

void sub_100022404(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  sub_1000056FC((void *)&_mh_execute_header, &_os_log_default, v2, "Received notifyd xpc notification: %@", v3, v4, v5, v6, 2u);

  sub_10000571C();
}

void sub_100022490(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  sub_1000056FC((void *)&_mh_execute_header, &_os_log_default, v2, "Received distnoted xpc notification: %@", v3, v4, v5, v6, 2u);

  sub_10000571C();
}

void sub_10002251C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CRITICAL error: failed to access push limit defaults", v1, 2u);
}

void sub_10002255C(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection from PID %d rejected for lacking entitlement", (uint8_t *)v3, 8u);
  sub_10000F2B0();
}

void sub_1000225E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000F2A0((void *)&_mh_execute_header, v0, v1, "Could not populate caches, device is class C locked", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_10002260C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Storing version number into defaults", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022638(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = 1;
  sub_10000F2CC((void *)&_mh_execute_header, a1, a3, "Interaction store version %ld is current", (uint8_t *)&v3);
  sub_10000F2B0();
}

void sub_1000226A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Requesting interaction repopulation", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_1000226D4(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = 1;
  sub_10000F2CC((void *)&_mh_execute_header, a1, a3, "Recording current interaction store version %ld", (uint8_t *)&v3);
  sub_10000F2B0();
}

void sub_100022744(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Interaction store version mismatch (current %ld != desired %ld). Deleting storage.", (uint8_t *)&v2, 0x16u);
  sub_10000F2B0();
}

void sub_1000227C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Checking interaction store version", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_1000227F0()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000F2F0();
  sub_10000F2B8((void *)&_mh_execute_header, v0, v1, "Could not list file attributes of %@. Error: %@.");
  sub_10000F2B0();
}

void sub_100022850()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000F2F0();
  sub_10000F2B8((void *)&_mh_execute_header, v0, v1, "Could not change POSIX permissions of %@ to 0644. Error: %@.");
  sub_10000F2B0();
}

void sub_1000228B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Repopulation date did synchronize.", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_1000228DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Defaults did synchronize.", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Repopulation is off by default, enable it with (iOS as mobile, OSX as root):\ndefaults write com.apple.coreduetd EnableInteractionRepopulation YES", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Interaction repopulation defaults did synchronize.", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Checking in repopulation job", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_10002298C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Done with repopulation", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_1000229B8(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  id v7;

  v7 = objc_msgSend(a2, "count");
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_DEBUG, "Harvested %lu interactions", a1, 0xCu);
}

void sub_100022A20(void *a1, NSObject *a2)
{
  double v3;
  uint64_t v4;
  int v5;
  double v6;

  objc_msgSend(a1, "timeIntervalSinceNow");
  v5 = 134217984;
  v6 = v3 / -86400.0;
  sub_10000F2CC((void *)&_mh_execute_header, a2, v4, "Starting batch repopulation with checkpoint = %2.1f days ago", (uint8_t *)&v5);
  sub_10000571C();
}

void sub_100022AA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000F2A0((void *)&_mh_execute_header, v0, v1, "Device is Class C locked", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022AD0(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*a1, "maxNumberOfInteractionsStored");
  sub_10000F28C((void *)&_mh_execute_header, v1, v2, "Deleted %lu interactions to keep max count at %lu", v3, v4, v5, v6, 0);
  sub_10000571C();
}

void sub_100022B54(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "dateOfOldestAllowedInteraction"));
  sub_10000F2D8();
  sub_10000F28C((void *)&_mh_execute_header, v2, v3, "Deleted %lu Non first-party whitelisted interations older than %@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100022BD8(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds"));
  sub_10000F2D8();
  sub_10000F28C((void *)&_mh_execute_header, v2, v3, "Deleted %lu first-party allowlisted interations older than %@", v4, v5, v6, v7, v8);

  sub_10000F308();
}

void sub_100022C5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000F280();
  sub_10000570C((void *)&_mh_execute_header, v0, v1, "Performing privacy maintenance for interactions", v2, v3, v4, v5, v6);
  sub_10000F278();
}

void sub_100022C88(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error registering token to post conditions changed notifications!", v1, 2u);
}

void sub_100022CC8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Saved date did synchronize.", v1, 2u);
}

void sub_100022D08(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error unarchiving object %@", (uint8_t *)&v2, 0xCu);
}

void sub_100022D7C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Restore defaults did synchronize.", v1, 2u);
}

void sub_100022DBC()
{
  __assert_rtn("processForecastXPCObject_block_invoke_4", "CDDCommunicator.m", 732, "0");
}

void sub_100022DE4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v5 = 138412290;
  v6 = v3;
  sub_10000F2CC((void *)&_mh_execute_header, a2, v4, "send sysdata: %@", (uint8_t *)&v5);

}

void sub_100022E70()
{
  __assert_rtn("-[CDDCommunicator makeForecastMessage:]", "CDDCommunicator.m", 1112, "0");
}

void sub_100022E98()
{
  __assert_rtn("createQueryParamsFromParameterDict", "CDDCommunicator.m", 765, "0");
}

void sub_100022EC0(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_10000F2CC((void *)&_mh_execute_header, a2, a3, "received sysdata: %@", (uint8_t *)&v3);
}

void sub_100022F2C()
{
  __assert_rtn("-[CDDCommunicator getAckMessage]", "CDDCommunicator.m", 1347, "0");
}

void sub_100022F54()
{
  __assert_rtn("-[CDDCommunicator getAckMessage]", "CDDCommunicator.m", 1354, "0");
}

void sub_100022F7C()
{
  __assert_rtn("-[CDDCommunicator getScheduledMessage:withForecasts:]", "CDDCommunicator.m", 1372, "0");
}

void sub_100022FA4()
{
  __assert_rtn("-[CDDCommunicator getScheduledMessage:withForecasts:]", "CDDCommunicator.m", 1379, "0");
}

void sub_100022FCC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set defer state for privacy maintenance activity.", v1, 2u);
  sub_10000F278();
}

void sub_100023008()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10001DC6C();
  sub_10001DC88((void *)&_mh_execute_header, v0, v1, "%@\nDetected knowledge database corruption. Deleting Storage", v2);
  sub_10000F2B0();
}

void sub_10002306C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  sub_10001DC6C();
  sub_10001DC58((void *)&_mh_execute_header, v1, v2, "Attempting to save %lu objects to knowledge store", v3, v4, v5, v6, v7);
  sub_10000571C();
}

void sub_1000230D8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  sub_10001DC6C();
  sub_10001DC58((void *)&_mh_execute_header, v1, v2, "Attempting to delete %lu objects from knowledge store", v3, v4, v5, v6, v7);
  sub_10000571C();
}

void sub_100023144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001DC6C();
  sub_10001DC78((void *)&_mh_execute_header, v0, v1, "Client provided invalid predicate %@", v2, v3, v4, v5, v6);
  sub_10000F2B0();
}

void sub_1000231A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001DC6C();
  sub_10001DC78((void *)&_mh_execute_header, v0, v1, "Storage appears to be invalid: %@", v2, v3, v4, v5, v6);
  sub_10000F2B0();
}

void sub_100023204(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000570C((void *)&_mh_execute_header, a1, a3, "ARPHomeControl Suggester Notification", a5, a6, a7, a8, 0);
  sub_10000F278();
}

void sub_100023234(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000570C((void *)&_mh_execute_header, a1, a3, "Media Analysis Processing Task", a5, a6, a7, a8, 0);
  sub_10000F278();
}

void sub_100023264(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10001DC6C();
  sub_10001DC88((void *)&_mh_execute_header, a2, v4, "Error encountered while reading from plist: %@", v5);

  sub_10000571C();
}

void sub_1000232E4(int a1)
{
  _DWORD v1[2];

  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Notification registration failed for data migration with status %d.", (uint8_t *)v1, 8u);
}

void sub_100023360()
{
  uint8_t v0[24];

  sub_10001DC6C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Successfully removed file %@", v0, 0xCu);
  sub_10000F2B0();
}

void sub_1000233D4()
{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;

  sub_10001DC6C();
  v2 = 2112;
  v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to remove file at path %@ with error %@", v1, 0x16u);
  sub_10000F2B0();
}

void sub_100023454()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Database migration was not successful.", v0, 2u);
}

void sub_100023498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001DC6C();
  sub_10001F38C((void *)&_mh_execute_header, v0, v1, "Unable to migrate spotlight events: %@", v2, v3, v4, v5, v6);
  sub_10000F2B0();
}

void sub_1000234F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2A0((void *)&_mh_execute_header, a1, a3, "Initialization of one of the daemon's modules failed", a5, a6, a7, a8, 0);
}

void sub_10002352C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F2A0((void *)&_mh_execute_header, a1, a3, "IDS Framework not available. Communicator not instantiated.", a5, a6, a7, a8, 0);
}

void sub_100023560(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error saving histogram: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000235D4(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = objc_opt_class(v5);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error obtaining DB age: %@ last event class: %@", (uint8_t *)&v6, 0x16u);

}

void sub_100023688(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Privacy setting did synchronize.", v1, 2u);
}

id objc_msgSend_CDDConfigurationBundlePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CDDConfigurationBundlePath");
}

id objc_msgSend_CDDConfigurationBundlePathDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CDDConfigurationBundlePathDefault");
}

id objc_msgSend_CDDDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CDDDatabaseDirectory");
}

id objc_msgSend_CDDUserDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CDDUserDatabaseDirectory");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__maintainPrivacy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maintainPrivacy");
}

id objc_msgSend__migrateSpotlightEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_migrateSpotlightEvents");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activity");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDevice:");
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

id objc_msgSend_addValue_forScalarKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValue:forScalarKey:");
}

id objc_msgSend_addWatchfaceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addWatchfaceInfo:");
}

id objc_msgSend_admissionCheckChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "admissionCheckChannel");
}

id objc_msgSend_adviseInteractionsForDate_usingSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsForDate:usingSettings:");
}

id objc_msgSend_adviseInteractionsForDate_usingSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsForDate:usingSettings:reply:");
}

id objc_msgSend_adviseInteractionsForKeywordsInString_usingSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsForKeywordsInString:usingSettings:");
}

id objc_msgSend_adviseInteractionsForKeywordsInString_usingSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsForKeywordsInString:usingSettings:reply:");
}

id objc_msgSend_adviseInteractionsUsingSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsUsingSettings:");
}

id objc_msgSend_adviseInteractionsUsingSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseInteractionsUsingSettings:reply:");
}

id objc_msgSend_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:");
}

id objc_msgSend_adviseSocialInteractionsForDate_andSeedContacts_usingSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adviseSocialInteractionsForDate:andSeedContacts:usingSettings:reply:");
}

id objc_msgSend_ageOfDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ageOfDatabase");
}

id objc_msgSend_airplayTaskScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airplayTaskScheduler");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allowEvaluation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowEvaluation");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appExtensionSuggestionsFromContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appExtensionSuggestionsFromContext:");
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appInFocusStream");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationExtensionRecords");
}

id objc_msgSend_appsDifferBetween_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appsDifferBetween:and:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authorizedEventStreamsToRead(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizedEventStreamsToRead");
}

id objc_msgSend_autocompleteSearchResultsWithPredictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autocompleteSearchResultsWithPredictionContext:");
}

id objc_msgSend_autocompleteSearchResultsWithPredictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autocompleteSearchResultsWithPredictionContext:reply:");
}

id objc_msgSend_batteryMonitorExchangeBattDelta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryMonitorExchangeBattDelta");
}

id objc_msgSend_batteryMonitorExchangeTimerDelta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryMonitorExchangeTimerDelta");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_cacheAppUsageDurations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheAppUsageDurations:");
}

id objc_msgSend_cacheSharesForEachApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheSharesForEachApp");
}

id objc_msgSend_calculateActualStartEpoch_endepoch_recurrenceInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateActualStartEpoch:endepoch:recurrenceInterval:");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_candidatesForShareSheetRanking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "candidatesForShareSheetRanking:");
}

id objc_msgSend_candidatesForShareSheetRankingCompute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "candidatesForShareSheetRankingCompute");
}

id objc_msgSend_cdd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cdd");
}

id objc_msgSend_chatGuidsForPinningHeuristicApproachWithMaxSuggestions_forReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chatGuidsForPinningHeuristicApproachWithMaxSuggestions:forReferenceDate:");
}

id objc_msgSend_checkDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkDevices:");
}

id objc_msgSend_checkForecastSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForecastSync");
}

id objc_msgSend_classCAndPasscodeCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classCAndPasscodeCheck");
}

id objc_msgSend_classCError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classCError");
}

id objc_msgSend_classCLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classCLocked");
}

id objc_msgSend_closeStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeStorage");
}

id objc_msgSend_commEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commEnabled");
}

id objc_msgSend_commMinClientGranularity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commMinClientGranularity");
}

id objc_msgSend_commSyncBoundarySeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commSyncBoundarySeconds");
}

id objc_msgSend_communicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "communicator");
}

id objc_msgSend_communicatorChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "communicatorChannel");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computeDatabaseAge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeDatabaseAge");
}

id objc_msgSend_computeEphemeralFeaturesWithPredictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeEphemeralFeaturesWithPredictionContext:");
}

id objc_msgSend_computeShareSheetEphemeralFeaturesWithPredictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeShareSheetEphemeralFeaturesWithPredictionContext:reply:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "config");
}

id objc_msgSend_confirmDatabaseConnectionError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmDatabaseConnectionError");
}

id objc_msgSend_confirmDatabaseConnectionFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmDatabaseConnectionFor:");
}

id objc_msgSend_confirmDatabaseConnectionWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "confirmDatabaseConnectionWithReply:");
}

id objc_msgSend_contactSuggester(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactSuggester");
}

id objc_msgSend_contactSuggestionsWithMaxSuggestions_excludeContactsByIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:");
}

id objc_msgSend_contactSuggestionsWithMaxSuggestions_excludedContactIds_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactSuggestionsWithMaxSuggestions:excludedContactIds:reply:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_convertMessage_fromVersion_toVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertMessage:fromVersion:toVersion:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countContactsUsingPredicate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countContactsUsingPredicate:completionHandler:");
}

id objc_msgSend_countContactsUsingPredicate_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countContactsUsingPredicate:reply:");
}

id objc_msgSend_countInteractionsUsingPredicate_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countInteractionsUsingPredicate:completionHandler:");
}

id objc_msgSend_countInteractionsUsingPredicate_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countInteractionsUsingPredicate:reply:");
}

id objc_msgSend_creditForDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creditForDeletion:");
}

id objc_msgSend_currentBatteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentBatteryLevel");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentCellQuality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCellQuality");
}

id objc_msgSend_currentFocalApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFocalApplication");
}

id objc_msgSend_currentFocalNonApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFocalNonApps");
}

id objc_msgSend_currentWiFiWiredQuality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentWiFiWiredQuality");
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemon");
}

id objc_msgSend_databaseName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseName");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateOfOldestAllowedInteraction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateOfOldestAllowedInteraction");
}

id objc_msgSend_dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDaemon");
}

id objc_msgSend_defaultDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultDatabaseDirectory");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_deleteAllEventsInEventStreamNamed_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllEventsInEventStreamNamed:reply:");
}

id objc_msgSend_deleteAllEventsMatchingPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllEventsMatchingPredicate:error:");
}

id objc_msgSend_deleteAllEventsMatchingPredicate_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllEventsMatchingPredicate:reply:");
}

id objc_msgSend_deleteHistogram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteHistogram:");
}

id objc_msgSend_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:completionHandler:");
}

id objc_msgSend_deleteInteractionsMatchingPredicate_sortDescriptors_limit_debuggingReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:debuggingReason:error:");
}

id objc_msgSend_deleteInteractionsMatchingPredicate_sortDescriptors_limit_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsMatchingPredicate:sortDescriptors:limit:reply:");
}

id objc_msgSend_deleteInteractionsWithBundleId_account_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:account:completionHandler:");
}

id objc_msgSend_deleteInteractionsWithBundleId_account_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:account:reply:");
}

id objc_msgSend_deleteInteractionsWithBundleId_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:completionHandler:");
}

id objc_msgSend_deleteInteractionsWithBundleId_domainIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:domainIdentifier:completionHandler:");
}

id objc_msgSend_deleteInteractionsWithBundleId_domainIdentifier_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:domainIdentifier:reply:");
}

id objc_msgSend_deleteInteractionsWithBundleId_domainIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:domainIdentifiers:completionHandler:");
}

id objc_msgSend_deleteInteractionsWithBundleId_domainIdentifiers_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:domainIdentifiers:reply:");
}

id objc_msgSend_deleteInteractionsWithBundleId_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteInteractionsWithBundleId:reply:");
}

id objc_msgSend_deleteObjects_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObjects:error:");
}

id objc_msgSend_deleteObjects_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObjects:reply:");
}

id objc_msgSend_deleteObjectsInContext_entityName_predicate_sortDescriptors_fetchLimit_includeSubentities_includePendingChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteObjectsInContext:entityName:predicate:sortDescriptors:fetchLimit:includeSubentities:includePendingChanges:");
}

id objc_msgSend_deleteOldInteractionsIfNeededToLimitTotalNumber_limit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteOldInteractionsIfNeededToLimitTotalNumber:limit:");
}

id objc_msgSend_deletePrivacySensitiveDBEntries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletePrivacySensitiveDBEntries");
}

id objc_msgSend_deleteRemoteState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRemoteState:");
}

id objc_msgSend_deleteRemoteStateWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteRemoteStateWithReply:");
}

id objc_msgSend_deleteStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteStorage");
}

id objc_msgSend_deregisterCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterCallback:");
}

id objc_msgSend_deregisterForSystemConditionChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterForSystemConditionChanges");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceBatteryPercentageStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceBatteryPercentageStream");
}

id objc_msgSend_deviceDescriptionFromDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceDescriptionFromDevice:");
}

id objc_msgSend_deviceForFromID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceForFromID:");
}

id objc_msgSend_deviceFromDeviceDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceFromDeviceDescription:");
}

id objc_msgSend_deviceIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifiers");
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUUID");
}

id objc_msgSend_deviceUUIDWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceUUIDWithReply:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directory");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_dkcMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dkcMigration");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dumpAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpAll");
}

id objc_msgSend_effectiveBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveBundleIdentifier");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enforcePrivacy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforcePrivacy:");
}

id objc_msgSend_ensembleModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensembleModel");
}

id objc_msgSend_enterMaintenanceMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enterMaintenanceMode");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "environment");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventCountPerStreamName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventCountPerStreamName");
}

id objc_msgSend_eventQueryWithPredicate_eventStreams_offset_limit_sortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:");
}

id objc_msgSend_eventStreamWithName_valueType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStreamWithName:valueType:");
}

id objc_msgSend_eventStreams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventStreams");
}

id objc_msgSend_eventWithStream_startDate_endDate_categoryIntegerValue_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:");
}

id objc_msgSend_eventWithStream_startDate_endDate_identifierStringValue_metadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventWithStream:startDate:endDate:identifierStringValue:metadata:");
}

id objc_msgSend_exchangeSystemComboMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exchangeSystemComboMessage:");
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeAllStandingQueriesWithStorage_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeAllStandingQueriesWithStorage:activity:");
}

id objc_msgSend_executeCorrelationTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeCorrelationTask");
}

id objc_msgSend_executeQuery_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:error:");
}

id objc_msgSend_executeQuery_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQuery:reply:");
}

id objc_msgSend_executeTaskWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeTaskWithCompletionHandler:");
}

id objc_msgSend_exitMaintenanceMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitMaintenanceMode");
}

id objc_msgSend_exportedObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exportedObject");
}

id objc_msgSend_extensionHostIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionHostIdentifier");
}

id objc_msgSend_familyRecommendationSuggestionsForShareSheetWithPredictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyRecommendationSuggestionsForShareSheetWithPredictionContext:");
}

id objc_msgSend_familyRecommendations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyRecommendations");
}

id objc_msgSend_familyRecommendedSuggestionsWithPredictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyRecommendedSuggestionsWithPredictionContext:reply:");
}

id objc_msgSend_familyRecommender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "familyRecommender");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_filePosixPermissions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePosixPermissions");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_filterAndModifyInteractionsWithPolicies_enforceDataLimits_enforcePrivacy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterAndModifyInteractionsWithPolicies:enforceDataLimits:enforcePrivacy:");
}

id objc_msgSend_filterObjectsByEnforcingRateLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterObjectsByEnforcingRateLimit:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formatDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatDate:");
}

id objc_msgSend_generateFocalNonAppFocalMutableSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateFocalNonAppFocalMutableSet");
}

id objc_msgSend_generateNonAppFocalString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateNonAppFocalString");
}

id objc_msgSend_getAckMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAckMessage");
}

id objc_msgSend_getCurrrentSupportedVersions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrrentSupportedVersions");
}

id objc_msgSend_getNewThermalValueForOldValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNewThermalValueForOldValue:");
}

id objc_msgSend_getOldThermalValueForNewValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOldThermalValueForNewValue:");
}

id objc_msgSend_getOutgoingVersionForIncomingVersions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOutgoingVersionForIncomingVersions:");
}

id objc_msgSend_getScheduledForecasts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getScheduledForecasts");
}

id objc_msgSend_getScheduledMessage_withForecasts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getScheduledMessage:withForecasts:");
}

id objc_msgSend_getStringArrayFromConfigurationPlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStringArrayFromConfigurationPlist:");
}

id objc_msgSend_getVersionsDictFromMaxVersion_minVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getVersionsDictFromMaxVersion:minVersion:");
}

id objc_msgSend_handleError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleError:");
}

id objc_msgSend_handleMessageVersioning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleMessageVersioning:");
}

id objc_msgSend_harvestInteractionsBetweenStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "harvestInteractionsBetweenStartDate:endDate:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_highestCommonVersionFor_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highestCommonVersionFor:and:");
}

id objc_msgSend_histogramOfCountsFromForecast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "histogramOfCountsFromForecast:");
}

id objc_msgSend_histogramQueryForStream_interval_withPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "histogramQueryForStream:interval:withPredicate:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_hoursBetween_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hoursBetween:and:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierFromDeviceDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierFromDeviceDescription:");
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingResponseIdentifier");
}

id objc_msgSend_informCommunicationError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "informCommunicationError");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBookmark_interactionStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBookmark:interactionStore:");
}

id objc_msgSend_initWithCDDinstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCDDinstance:");
}

id objc_msgSend_initWithCommInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCommInstance:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_feedbackRecording_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:feedbackRecording:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithDisplayType_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayType:handler:");
}

id objc_msgSend_initWithFile_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFile:activity:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithHistogram_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHistogram:");
}

id objc_msgSend_initWithKnowledgeStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKnowledgeStorage:");
}

id objc_msgSend_initWithKnowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKnowledgeStore:");
}

id objc_msgSend_initWithKnowledgeStore_interactionStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKnowledgeStore:interactionStore:");
}

id objc_msgSend_initWithMachServiceName_storePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:storePath:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithStartDate_endDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:endDate:");
}

id objc_msgSend_initWithStore_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStore:activity:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithUseCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUseCase:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_instrumentationChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "instrumentationChannel");
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

id objc_msgSend_intentSpotlightIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intentSpotlightIndex");
}

id objc_msgSend_interactionAdviceEngineWithStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionAdviceEngineWithStore:");
}

id objc_msgSend_interactionChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionChannel");
}

id objc_msgSend_interactionCountPerMechanism(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionCountPerMechanism");
}

id objc_msgSend_interactionPolicies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionPolicies");
}

id objc_msgSend_interactionSignpost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interactionSignpost");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invoke(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invoke");
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticAppUpdatesAllowed");
}

id objc_msgSend_isClassCLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isClassCLocked");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isConversionRequiredForMessage_fromVersion_toVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConversionRequiredForMessage:fromVersion:toVersion:");
}

id objc_msgSend_isCoreDataFatalError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoreDataFatalError:");
}

id objc_msgSend_isDataAvailableFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDataAvailableFor:");
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPairedDevice");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isKnowledgeAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKnowledgeAgent");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isManagedConfigurationSettingOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedConfigurationSettingOn");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearby");
}

id objc_msgSend_isPluggedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPluggedIn");
}

id objc_msgSend_isRunningOnInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningOnInternalBuild");
}

id objc_msgSend_isSpringBoardElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSpringBoardElement");
}

id objc_msgSend_isSubsetOfSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubsetOfSet:");
}

id objc_msgSend_isUIApplicationElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUIApplicationElement");
}

id objc_msgSend_itemsDifferIn_and_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemsDifferIn:and:");
}

id objc_msgSend_jobWithInterval_schedulerJobName_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobWithInterval:schedulerJobName:handler:");
}

id objc_msgSend_jobWithPeriod_schedulerJobName_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobWithPeriod:schedulerJobName:handler:");
}

id objc_msgSend_keyPathForBatteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForBatteryLevel");
}

id objc_msgSend_keyPathForCellConnectionQuality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForCellConnectionQuality");
}

id objc_msgSend_keyPathForDefaultPairedDeviceBatteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForDefaultPairedDeviceBatteryLevel");
}

id objc_msgSend_keyPathForDefaultPairedDeviceForegroundApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForDefaultPairedDeviceForegroundApp");
}

id objc_msgSend_keyPathForDefaultPairedDevicePluginStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForDefaultPairedDevicePluginStatus");
}

id objc_msgSend_keyPathForDefaultPairedDeviceThermalPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForDefaultPairedDeviceThermalPressureLevel");
}

id objc_msgSend_keyPathForDefaultPairedServicesAppearingForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForDefaultPairedServicesAppearingForeground");
}

id objc_msgSend_keyPathForForegroundApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForForegroundApp");
}

id objc_msgSend_keyPathForPluginStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForPluginStatus");
}

id objc_msgSend_keyPathForServicesAppearingForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForServicesAppearingForeground");
}

id objc_msgSend_keyPathForSiriActiveStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForSiriActiveStatus");
}

id objc_msgSend_keyPathForThermalPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForThermalPressureLevel");
}

id objc_msgSend_keyPathForWiFiConnectionQuality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForWiFiConnectionQuality");
}

id objc_msgSend_keyPathForWiredConnectionQuality(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyPathForWiredConnectionQuality");
}

id objc_msgSend_knowledgeChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knowledgeChannel");
}

id objc_msgSend_knowledgeDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knowledgeDatabaseDirectory");
}

id objc_msgSend_knowledgeSignpost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knowledgeSignpost");
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knowledgeStore");
}

id objc_msgSend_knowledgeStoreWithDirectReadOnlyAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "knowledgeStoreWithDirectReadOnlyAccess");
}

id objc_msgSend_lastFocalApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastFocalApp");
}

id objc_msgSend_lastFocalNonApps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastFocalNonApps");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutRole");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadDefaults");
}

id objc_msgSend_loadParamsFromDict_userDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadParamsFromDict:userDefaults:");
}

id objc_msgSend_loadSavedDateIfExist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadSavedDateIfExist");
}

id objc_msgSend_localInBedPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localInBedPeriod");
}

id objc_msgSend_localMaxSupportedVersionNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localMaxSupportedVersionNumber");
}

id objc_msgSend_localWakingRegistrationWithIdentifier_contextualPredicate_clientIdentifier_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localWakingRegistrationWithIdentifier:contextualPredicate:clientIdentifier:callback:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_logMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logMigration");
}

id objc_msgSend_logSizeOfStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logSizeOfStorage:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_macSleepModelingDataCollectionTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "macSleepModelingDataCollectionTasks");
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machServiceName");
}

id objc_msgSend_maintainPrivacy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maintainPrivacy");
}

id objc_msgSend_maintainPrivacyWithActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maintainPrivacyWithActivity:");
}

id objc_msgSend_maintainPrivacyWithKnowledgeStorage_installedApps_installedAppExtensions_deleteMaxCount_objectMaxCount_objectMaxLifespan_activity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maintainPrivacyWithKnowledgeStorage:installedApps:installedAppExtensions:deleteMaxCount:objectMaxCount:objectMaxLifespan:activity:");
}

id objc_msgSend_makeAckMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeAckMessage");
}

id objc_msgSend_makeForecastMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeForecastMessage:");
}

id objc_msgSend_makeRemoteDeviceSyncMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeRemoteDeviceSyncMessage");
}

id objc_msgSend_makeScheduledMessage_withForecasts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeScheduledMessage:withForecasts:");
}

id objc_msgSend_makeSystemComboMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeSystemComboMessage");
}

id objc_msgSend_managedObjectContextFor_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectContextFor:identifier:");
}

id objc_msgSend_mapsSuggestionsFromContext_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapsSuggestionsFromContext:maxSuggestions:reply:");
}

id objc_msgSend_maxNumberOfInteractionsDeleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNumberOfInteractionsDeleted");
}

id objc_msgSend_maxNumberOfInteractionsStored(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxNumberOfInteractionsStored");
}

id objc_msgSend_messagesPinningSuggester(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messagesPinningSuggester");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelIdentifier");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nextResetTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextResetTime");
}

id objc_msgSend_notPredicateWithSubpredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notPredicateWithSubpredicate:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsPassingTest:");
}

id objc_msgSend_obtainForegroundApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "obtainForegroundApplication");
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingResponseIdentifier");
}

id objc_msgSend_pairedDeviceForecastStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDeviceForecastStream");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_peopleDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peopleDatabaseDirectory");
}

id objc_msgSend_peopleDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peopleDirectory");
}

id objc_msgSend_photosContactInferencesSuggestionsWithPredictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photosContactInferencesSuggestionsWithPredictionContext:reply:");
}

id objc_msgSend_photosRelationshipSuggestionsWithPredictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photosRelationshipSuggestionsWithPredictionContext:reply:");
}

id objc_msgSend_pmfOverHourOfDayWithParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pmfOverHourOfDayWithParams:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_populateAppSharesCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAppSharesCache");
}

id objc_msgSend_populateAppUsageCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAppUsageCache");
}

id objc_msgSend_populateCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateCaches");
}

id objc_msgSend_populatePeopleSuggesterCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populatePeopleSuggesterCaches");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicateForChangeAtKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForChangeAtKeyPath:");
}

id objc_msgSend_predicateForChangeAtKeyPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForChangeAtKeyPaths:");
}

id objc_msgSend_predicateForEventsWithStartInDateRangeFrom_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEventsWithStartInDateRangeFrom:to:");
}

id objc_msgSend_predicateForEventsWithStreamName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEventsWithStreamName:");
}

id objc_msgSend_predicateForEventsWithStringValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEventsWithStringValue:");
}

id objc_msgSend_predicateForObjectsWithMetadataKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForObjectsWithMetadataKey:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_predicateWithValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithValue:");
}

id objc_msgSend_predictWithMapsPredictionContext_maxSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictWithMapsPredictionContext:maxSuggestions:");
}

id objc_msgSend_predictorWithKnowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictorWithKnowledgeStore:");
}

id objc_msgSend_privacyCloak(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyCloak");
}

id objc_msgSend_privacyMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyMonitor");
}

id objc_msgSend_privacyPolicyEnforcer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privacyPolicyEnforcer");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_provideFeedbackForContactsAutocompleteSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideFeedbackForContactsAutocompleteSuggestions:");
}

id objc_msgSend_provideMessagesPinningFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "provideMessagesPinningFeedback:");
}

id objc_msgSend_queryContactsUsingPredicate_sortDescriptors_limit_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryContactsUsingPredicate:sortDescriptors:limit:completionHandler:");
}

id objc_msgSend_queryContactsUsingPredicate_sortDescriptors_limit_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryContactsUsingPredicate:sortDescriptors:limit:reply:");
}

id objc_msgSend_queryInteractionsOnlyAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryInteractionsOnlyAuthorization");
}

id objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryInteractionsUsingPredicate:sortDescriptors:limit:completionHandler:");
}

id objc_msgSend_queryInteractionsUsingPredicate_sortDescriptors_limit_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryInteractionsUsingPredicate:sortDescriptors:limit:reply:");
}

id objc_msgSend_queryVersionNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryVersionNumber");
}

id objc_msgSend_rankCandidateContacts_usingSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankCandidateContacts:usingSettings:");
}

id objc_msgSend_rankCandidateContacts_usingSettings_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankCandidateContacts:usingSettings:reply:");
}

id objc_msgSend_rankedAutocompleteSuggestionsFromContext_candidates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedAutocompleteSuggestionsFromContext:candidates:");
}

id objc_msgSend_rankedAutocompleteSuggestionsFromContext_candidates_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedAutocompleteSuggestionsFromContext:candidates:reply:");
}

id objc_msgSend_rankedFamilySuggestionsWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedFamilySuggestionsWithReply:");
}

id objc_msgSend_rankedGlobalSuggestionsForSiriNLWithPredictionContext_maxSuggestions_interactionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsForSiriNLWithPredictionContext:maxSuggestions:interactionId:");
}

id objc_msgSend_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:reply:");
}

id objc_msgSend_rankedGlobalSuggestionsFromContext_contactsOnly_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsFromContext:contactsOnly:maxSuggestions:reply:");
}

id objc_msgSend_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:");
}

id objc_msgSend_rankedGlobalSuggestionsWithPredictionContext_contactsOnly_maxSuggestions_excludeBackfillSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedGlobalSuggestionsWithPredictionContext:contactsOnly:maxSuggestions:excludeBackfillSuggestions:");
}

id objc_msgSend_rankedHandlesFromCandidateHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedHandlesFromCandidateHandles:");
}

id objc_msgSend_rankedHandlesFromCandidateHandles_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedHandlesFromCandidateHandles:reply:");
}

id objc_msgSend_rankedMessagesPinsWithMaxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedMessagesPinsWithMaxSuggestions:reply:");
}

id objc_msgSend_rankedNameSuggestionsFromContext_name_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedNameSuggestionsFromContext:name:reply:");
}

id objc_msgSend_rankedNameSuggestionsWithPredictionContext_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedNameSuggestionsWithPredictionContext:name:");
}

id objc_msgSend_rankedSiriMLCRHandles_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedSiriMLCRHandles:context:");
}

id objc_msgSend_rankedSiriMLCRHandlesFromContext_handles_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedSiriMLCRHandlesFromContext:handles:reply:");
}

id objc_msgSend_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:reply:");
}

id objc_msgSend_rateLimitPolicyEnforcer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rateLimitPolicyEnforcer");
}

id objc_msgSend_readConfigParamsFromPlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readConfigParamsFromPlist");
}

id objc_msgSend_readRepopulationCheckpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readRepopulationCheckpoint");
}

id objc_msgSend_readVersionNumberFromDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readVersionNumberFromDefaults");
}

id objc_msgSend_receiveData_context_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveData:context:device:");
}

id objc_msgSend_receiveForecast_paramDict_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveForecast:paramDict:device:");
}

id objc_msgSend_receiveRequestedForecast_paramDict_transactionId_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveRequestedForecast:paramDict:transactionId:device:");
}

id objc_msgSend_receiveSystemData_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveSystemData:device:");
}

id objc_msgSend_receiveWatchfaceInfo_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveWatchfaceInfo:device:");
}

id objc_msgSend_recordInteractions_enforceDataLimits_enforcePrivacy_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordInteractions:enforceDataLimits:enforcePrivacy:reply:");
}

id objc_msgSend_recordInteractions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordInteractions:error:");
}

id objc_msgSend_recordVersionNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordVersionNumber:");
}

id objc_msgSend_refreshCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshCaches");
}

id objc_msgSend_refreshPeopleSuggesterCaches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshPeopleSuggesterCaches");
}

id objc_msgSend_registerARPHomeControlNotificationTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerARPHomeControlNotificationTask");
}

id objc_msgSend_registerAirPlayTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAirPlayTasks");
}

id objc_msgSend_registerCDFTCPInteractionDataCollectionTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCDFTCPInteractionDataCollectionTask");
}

id objc_msgSend_registerCDInteractionDataCollectionTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCDInteractionDataCollectionTask");
}

id objc_msgSend_registerCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCallback:");
}

id objc_msgSend_registerCloudFamilyPredictionTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCloudFamilyPredictionTask");
}

id objc_msgSend_registerContactsAutocompleteFeedbackProcessingTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerContactsAutocompleteFeedbackProcessingTask");
}

id objc_msgSend_registerDataCollectionTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDataCollectionTasks");
}

id objc_msgSend_registerForSystemConditionChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForSystemConditionChanges");
}

id objc_msgSend_registerJob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerJob:");
}

id objc_msgSend_registerPeopleSuggesterTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPeopleSuggesterTasks");
}

id objc_msgSend_registerPersonLinkingDataCollectionTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerPersonLinkingDataCollectionTask");
}

id objc_msgSend_registerScheduledExchange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerScheduledExchange:");
}

id objc_msgSend_registerSpotlightRecorderWithServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerSpotlightRecorderWithServiceName:");
}

id objc_msgSend_registerVisionSignalGradingDataCollectionTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerVisionSignalGradingDataCollectionTask");
}

id objc_msgSend_registerWithTrial(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWithTrial");
}

id objc_msgSend_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_knowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:knowledgeStore:");
}

id objc_msgSend_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:reply:");
}

id objc_msgSend_remoteDeviceInBedTimesStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteDeviceInBedTimesStream");
}

id objc_msgSend_remoteHistogramMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteHistogramMigration");
}

id objc_msgSend_remoteVersionNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteVersionNumber");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDevice:");
}

id objc_msgSend_removeFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFileAtPath:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reportPeopleStatistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportPeopleStatistics");
}

id objc_msgSend_requestBiomeEndpoint_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestBiomeEndpoint:reply:");
}

id objc_msgSend_requestEndpointForDomain_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestEndpointForDomain:error:");
}

id objc_msgSend_requestInteractionRepopulation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInteractionRepopulation");
}

id objc_msgSend_requestRemoteDeviceSync(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestRemoteDeviceSync");
}

id objc_msgSend_resetPushLimits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetPushLimits");
}

id objc_msgSend_resultType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultType");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrieveHistogram(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveHistogram");
}

id objc_msgSend_satisfyForecastDataRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "satisfyForecastDataRequest:");
}

id objc_msgSend_saveCurrentPrivacySetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCurrentPrivacySetting:");
}

id objc_msgSend_saveFeedback_forSessionId_feedbackActionType_isFallbackFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveFeedback:forSessionId:feedbackActionType:isFallbackFetch:");
}

id objc_msgSend_saveFeedbackInCoreDuetd_forSessionId_feedbackActionType_isFallbackFetch_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveFeedbackInCoreDuetd:forSessionId:feedbackActionType:isFallbackFetch:reply:");
}

id objc_msgSend_saveForecast_queryParameters_deviceIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveForecast:queryParameters:deviceIdentifier:error:");
}

id objc_msgSend_saveHistogram_responseQueue_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveHistogram:responseQueue:withCompletion:");
}

id objc_msgSend_saveLastDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveLastDate");
}

id objc_msgSend_saveObjects_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveObjects:error:");
}

id objc_msgSend_saveObjects_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveObjects:reply:");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMTForDate:");
}

id objc_msgSend_sendData_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAgeOfDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAgeOfDatabase:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAuthorizedEventStreamsToRead_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAuthorizedEventStreamsToRead:");
}

id objc_msgSend_setBatteryMonitorExchangeBattDelta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryMonitorExchangeBattDelta:");
}

id objc_msgSend_setBatteryMonitorExchangeTimerDelta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBatteryMonitorExchangeTimerDelta:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCdd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCdd:");
}

id objc_msgSend_setChangeHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeHandler:");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setCloudKitEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCloudKitEnabled:");
}

id objc_msgSend_setCommEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommEnabled:");
}

id objc_msgSend_setCommMinClientGranularity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommMinClientGranularity:");
}

id objc_msgSend_setCommSyncBoundarySeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCommSyncBoundarySeconds:");
}

id objc_msgSend_setDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDaemon:");
}

id objc_msgSend_setDatabaseAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabaseAge:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDefaultConfigParams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultConfigParams");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:queue:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setExecutionCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExecutionCriteria:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setIncludeLocalResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeLocalResults:");
}

id objc_msgSend_setIncludeRemoteResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeRemoteResults:");
}

id objc_msgSend_setInitialized_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialized:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIntentSpotlightIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIntentSpotlightIndex:");
}

id objc_msgSend_setInteractionStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteractionStore:");
}

id objc_msgSend_setInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterval:");
}

id objc_msgSend_setKnowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKnowledgeStore:");
}

id objc_msgSend_setLastFocalApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastFocalApp:");
}

id objc_msgSend_setLastFocalNonApps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastFocalNonApps:");
}

id objc_msgSend_setLastForecastSent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastForecastSent:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProcessName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessName:");
}

id objc_msgSend_setQueryInteractionsOnlyAuthorization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryInteractionsOnlyAuthorization:");
}

id objc_msgSend_setReadConcurrently_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReadConcurrently:");
}

id objc_msgSend_setRemoteHistogramLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteHistogramLimit:");
}

id objc_msgSend_setRemoteVersionNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteVersionNumber:");
}

id objc_msgSend_setSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSet:");
}

id objc_msgSend_setStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStorage:");
}

id objc_msgSend_setStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStream:");
}

id objc_msgSend_setSuggestionModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuggestionModel:");
}

id objc_msgSend_setSuggestionPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuggestionPath:");
}

id objc_msgSend_setSyncCoordinator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncCoordinator:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTracker_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTracker:");
}

id objc_msgSend_setValue_forScalarKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forScalarKey:");
}

id objc_msgSend_setValue_forScalarKey_limitingSigDigs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forScalarKey:limitingSigDigs:");
}

id objc_msgSend_setVerbose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVerbose:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupCommControl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCommControl");
}

id objc_msgSend_setupCommunicator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCommunicator");
}

id objc_msgSend_setupDataProtectionChangeHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDataProtectionChangeHandler");
}

id objc_msgSend_setupIDSLink(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupIDSLink");
}

id objc_msgSend_setupNextResetTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNextResetTimer:");
}

id objc_msgSend_setupServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupServices");
}

id objc_msgSend_shareExtensionSuggestionsFromContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareExtensionSuggestionsFromContext:reply:");
}

id objc_msgSend_shareSheetInteractionsFromContext_maximumNumberOfSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shareSheetInteractionsFromContext:maximumNumberOfSuggestions:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sourceDeviceIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceDeviceIdentity");
}

id objc_msgSend_sourceDeviceIdentityWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceDeviceIdentityWithReply:");
}

id objc_msgSend_spotlightItemRecorderWithInteractionRecorder_knowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spotlightItemRecorderWithInteractionRecorder:knowledgeStore:");
}

id objc_msgSend_spotlightViewerEventsMigration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spotlightViewerEventsMigration");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startIntentDeletionForContactDeletions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startIntentDeletionForContactDeletions");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startSanitizingInteractionStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSanitizingInteractionStore:");
}

id objc_msgSend_startSanitizingKnowledgeStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSanitizingKnowledgeStore:");
}

id objc_msgSend_storage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storage");
}

id objc_msgSend_storageWithDirectory_readOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageWithDirectory:readOnly:");
}

id objc_msgSend_storageWithShallowCopyFromStorage_clientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageWithShallowCopyFromStorage:clientIdentifier:");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_storeWithDirectory_knowledgeStore_readOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeWithDirectory:knowledgeStore:readOnly:");
}

id objc_msgSend_storeWithDirectory_readOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeWithDirectory:readOnly:");
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stream");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_submitMessagesPinningFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitMessagesPinningFeedback:");
}

id objc_msgSend_suggestInteractionsFromContext_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestInteractionsFromContext:maxSuggestions:reply:");
}

id objc_msgSend_suggestZKWSuggestionsWithPredictionContext_maxSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestZKWSuggestionsWithPredictionContext:maxSuggestions:");
}

id objc_msgSend_suggester(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggester");
}

id objc_msgSend_suggestionsForPhotosContactInferencesWithPredictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestionsForPhotosContactInferencesWithPredictionContext:");
}

id objc_msgSend_suggestionsForPhotosRelationshipsWithPredictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestionsForPhotosRelationshipsWithPredictionContext:");
}

id objc_msgSend_syncCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCoordinator");
}

id objc_msgSend_syncCoordinatorWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCoordinatorWithContext:");
}

id objc_msgSend_syncCoordinatorWithServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncCoordinatorWithServiceName:");
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDidComplete");
}

id objc_msgSend_syncStateWithActiveRemote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncStateWithActiveRemote");
}

id objc_msgSend_syncStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncStorage");
}

id objc_msgSend_syncWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncWithReply:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronize_interval_withForecasts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize:interval:withForecasts:");
}

id objc_msgSend_synchronizeWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeWithReply:");
}

id objc_msgSend_synchronizeWithUrgency_client_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeWithUrgency:client:reply:");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_thermalPressureLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thermalPressureLevel");
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

id objc_msgSend_timeZoneOrTimeChanged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneOrTimeChanged:");
}

id objc_msgSend_transformErrorForNSSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transformErrorForNSSecureCoding:");
}

id objc_msgSend_triggerExchangeForFocalApp_inState_withNonApps_byClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerExchangeForFocalApp:inState:withNonApps:byClient:");
}

id objc_msgSend_triggerFocalAppExchange_inState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerFocalAppExchange:inState:");
}

id objc_msgSend_triggerFocalAppExchange_inState_shouldSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerFocalAppExchange:inState:shouldSendMessage:");
}

id objc_msgSend_triggerIndexIncludingAdditions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerIndexIncludingAdditions:completion:");
}

id objc_msgSend_triggerNonAppFocalExchange_byClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerNonAppFocalExchange:byClient:");
}

id objc_msgSend_triggerNonAppFocalExchange_byClient_shouldSendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerNonAppFocalExchange:byClient:shouldSendMessage:");
}

id objc_msgSend_triggerSystemDataExchange_wakeRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerSystemDataExchange:wakeRemote:");
}

id objc_msgSend_triggeredExchange_opportunistic_queue_timeout_urgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggeredExchange:opportunistic:queue:timeout:urgent:");
}

id objc_msgSend_tuneSocialAdvisorUsingSettings_heartBeatHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuneSocialAdvisorUsingSettings:heartBeatHandler:");
}

id objc_msgSend_tuneSocialAdvisorUsingSettings_heartBeatHandler_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tuneSocialAdvisorUsingSettings:heartBeatHandler:reply:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unauthorizedClientError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unauthorizedClientError");
}

id objc_msgSend_unavailableForCurrentUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unavailableForCurrentUser");
}

id objc_msgSend_uniqueIDOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIDOverride");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAllowed");
}

id objc_msgSend_updateInteractions_enforceDataLimits_enforcePrivacy_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateInteractions:enforceDataLimits:enforcePrivacy:reply:");
}

id objc_msgSend_updateInteractions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateInteractions:error:");
}

id objc_msgSend_updateOutgoingVersionNumberAndSyncState_forIncomingSupportedVersions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateOutgoingVersionNumberAndSyncState:forIncomingSupportedVersions:");
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userContext");
}

id objc_msgSend_userLocalKnowledgeDatabaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userLocalKnowledgeDatabaseDirectory");
}

id objc_msgSend_validateCoreMLModelWithRawInput_predictionContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateCoreMLModelWithRawInput:predictionContext:");
}

id objc_msgSend_validateCoreMLScoringModelWithRawInput_predictionContext_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateCoreMLScoringModelWithRawInput:predictionContext:reply:");
}

id objc_msgSend_validatePredicate_allowedKeys_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validatePredicate:allowedKeys:error:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verbose");
}

id objc_msgSend_versionCheckAndUpgradeIfNecessaryAndPossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "versionCheckAndUpgradeIfNecessaryAndPossible");
}

id objc_msgSend_watchUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchUpdate");
}

id objc_msgSend_watchUpdateLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchUpdateLog");
}

id objc_msgSend_whitelistedFirstPartyBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitelistedFirstPartyBundleIds");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_writeFeedbackForContactsAutocompleteSuggestions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFeedbackForContactsAutocompleteSuggestions:");
}

id objc_msgSend_writeRepopulationCheckpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeRepopulationCheckpoint:");
}

id objc_msgSend_writeVersionNumberToDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeVersionNumberToDefaults:");
}

id objc_msgSend_zkwSuggestionsFromContext_maxSuggestions_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zkwSuggestionsFromContext:maxSuggestions:reply:");
}
