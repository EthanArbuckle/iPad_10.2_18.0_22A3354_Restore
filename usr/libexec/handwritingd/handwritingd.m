void sub_100004858(id a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.UIKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("PKUIPencilHoverPreviewEnabledKey")));

  if (!v1)
  {
    objc_msgSend(v2, "setValue:forKey:", &__kCFBooleanTrue, CFSTR("PKUIPencilHoverPreviewEnabledKey"));
    objc_msgSend(v2, "setValue:forKey:", &__kCFBooleanFalse, CFSTR("PKHasUserChangedHoverPreviewEnabledSettingKey"));
  }

}

void sub_100004944(id a1)
{
  CHPKSettingsServer *v1;
  void *v2;

  v1 = objc_alloc_init(CHPKSettingsServer);
  v2 = (void *)qword_10002ADA0;
  qword_10002ADA0 = (uint64_t)v1;

}

void sub_100004CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005354(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100005368(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queuedTimestampDate"));

  objc_msgSend(WeakRetained, "setQueuedTimestampDate:", *(_QWORD *)(a1 + 32));
  if (v3)
  {

  }
  else
  {
    v4 = dispatch_time(0, 5000000000);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005430;
    block[3] = &unk_100024750;
    block[4] = WeakRetained;
    dispatch_after(v4, v5, block);

  }
}

id sub_100005430(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_touchLastSessionTimestampIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "setQueuedTimestampDate:", 0);
}

Class sub_100005634(uint64_t a1)
{
  const char *v2;
  char *v3;
  Class result;
  char *v5;
  __int128 v6;
  uint64_t v7;

  v5 = 0;
  v2 = (const char *)&selRef_precedingSeparatorForTopTranscriptionPath;
  if (!qword_10002ADB8)
  {
    v6 = off_1000247C0;
    v7 = 0;
    qword_10002ADB8 = _sl_dlopen(&v6, &v5);
    v3 = v5;
    if (!qword_10002ADB8)
    {
      abort_report_np("%s", v5);
      goto LABEL_7;
    }
    if (v5)
      goto LABEL_8;
  }
  while (1)
  {
    v2 = "LSApplicationWorkspace";
    result = objc_getClass("LSApplicationWorkspace");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_7:
    v3 = (char *)abort_report_np("Unable to find class %s", v2);
LABEL_8:
    free(v3);
  }
  qword_10002ADB0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005BA0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10002ADC0;
  qword_10002ADC0 = v1;

}

void sub_100005F3C(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  xpc_object_t v6;
  NSObject *v7;
  int v8;
  NSObject *v9;
  _xpc_activity_s *v10;
  uint64_t v11;
  _QWORD block[4];
  _xpc_activity_s *v13;
  __int128 *p_buf;
  uint64_t v15;
  uint8_t v16[4];
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int128 buf;
  uint64_t v21;
  BOOL v22;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v21 = 0x2020000000;
    v22 = 0;
    v22 = xpc_activity_set_state(v3, 4);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v7 = (id)qword_10002AE58;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
      *(_DWORD *)v16 = 138412546;
      v17 = CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity");
      v18 = 1024;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Running activity %@, extended=%d", v16, 0x12u);
    }

    if (qword_10002ADD8 != -1)
      dispatch_once(&qword_10002ADD8, &stru_1000247F8);
    v9 = qword_10002ADD0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000062C8;
    block[3] = &unk_100024848;
    v10 = v3;
    v11 = *(_QWORD *)(a1 + 32);
    v13 = v10;
    p_buf = &buf;
    v15 = v11;
    dispatch_async(v9, block);

    _Block_object_dispose(&buf, 8);
  }
  else if (!state)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v5 = (id)qword_10002AE58;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking in activity %@", (uint8_t *)&buf, 0xCu);
    }

    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_15_MIN);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_activity_set_criteria(v3, v6);

  }
}

void sub_100006278(id a1)
{
  dispatch_queue_attr_t v1;
  dispatch_queue_t v2;
  void *v3;
  NSObject *v4;

  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v1);
  v2 = dispatch_queue_create("com.apple.handwritingd.analytics.scheduledEventsQueue", v4);
  v3 = (void *)qword_10002ADD0;
  qword_10002ADD0 = (uint64_t)v2;

}

void sub_1000062C8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint8_t buf[4];
  const __CFString *v9;

  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v2 = (id)qword_10002AE58;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity");
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "xpc activity should be defered, defering %@", buf, 0xCu);
    }
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "sharedInstance"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100006420;
    v6[3] = &unk_100024820;
    v5 = *(_OWORD *)(a1 + 32);
    v4 = (id)v5;
    v7 = v5;
    objc_msgSend(v3, "dispatchScheduledEventsWithCompletionBlock:", v6);

    v2 = v7;
  }

}

void sub_100006420(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  int v7;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v2 = (id)qword_10002AE58;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v4 = 138412546;
      v5 = CFSTR("com.apple.handwritingd.analytics.scheduledEventsActivity");
      v6 = 1024;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Done running activity %@, extended=%d", (uint8_t *)&v4, 0x12u);
    }

  }
}

void sub_100006930(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:"));
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

uint64_t sub_100006B98(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dispatchSettingsEvents");
  objc_msgSend(*(id *)(a1 + 32), "dispatchLifecycleEvents");
  objc_msgSend(*(id *)(a1 + 32), "dispatchDailyUsageEvents");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_100006C60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsDictionary");
}

void sub_100006FDC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _UNKNOWN **v10;
  id v11;

  v11 = a2;
  v3 = kCommonMetricQueryTimeFrame;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "loadedDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:", v11, v3, v5));

  v7 = objc_msgSend(v6, "intValue");
  v8 = *(void **)(a1 + 48);
  if (v7 < 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v11));
    if (objc_msgSend(v9, "intValue") == 1)
      v10 = &off_100025DC8;
    else
      v10 = &off_100025DB0;
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v11);

  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_100025DC8, v11);
  }

}

id sub_1000070BC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100007350(_QWORD *a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = (void *)a1[7];
  v8 = a3;
  v9 = a2;
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "loadedDate"));
  objc_msgSend(v4, "dispatchLifecycleEventForFeature:denominatorKey:inputModeIdentifier:values:sinceDate:", v9, v8, v5, v6, v10);

}

id sub_10000765C(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[2];

  v3[0] = CFSTR("inputMode");
  v3[1] = CFSTR("lifecycleValue");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

int main(int argc, const char **argv, const char **envp)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  int v14;
  uint8_t buf[4];
  int v16;
  char v17[1024];

  bzero(v17, 0x400uLL);
  if (!_set_user_dir_suffix("com.apple.handwritingd") || !confstr(65537, v17, 0x400uLL))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v12 = *__error();
    *(_DWORD *)buf = 67109120;
    v16 = v12;
    v13 = "failed to initialize temporary directory: %{darwin.errno}d";
    goto LABEL_18;
  }
  if (!realpath_DARWIN_EXTSN(v17, 0))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    v14 = *__error();
    *(_DWORD *)buf = 67109120;
    v16 = v14;
    v13 = "failed to resolve temporary directory: %{darwin.errno}d";
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v13, buf, 8u);
LABEL_19:
    exit(1);
  }
  v5 = MGGetBoolAnswer(CFSTR("InternalBuild"));
  if (argc >= 2 && v5)
  {
    if (argc != 2)
    {
      puts("Usage: ./handwritingd");
      puts("\t--clear-inventory");
      return 0;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", argv[1], 4));
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("--clear-inventory")))
    {
      printf("Clearing inventory status: %d\n", +[CHSynthesisStyleInventory clear](CHSynthesisStyleInventory, "clear"));
    }
    else
    {
      puts("Usage: ./handwritingd");
      puts("\t--clear-inventory");
    }
  }
  else
  {
    v7 = objc_autoreleasePoolPush();
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CHRemoteRecognitionServer sharedRemoteRecognitionServer](CHRemoteRecognitionServer, "sharedRemoteRecognitionServer"));
    objc_msgSend(v8, "resumeConnectionIfIdle");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CHPKSettingsServer sharedSettingsServer](CHPKSettingsServer, "sharedSettingsServer"));
    objc_msgSend(v9, "resumeConnectionIfIdle");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CHPKAnalyticsServer sharedAnalyticsServer](CHPKAnalyticsServer, "sharedAnalyticsServer"));
    objc_msgSend(v10, "resumeConnectionIfIdle");
    +[CHPKPersistentAnalyticsController registerScheduledEventsActivity](CHPKPersistentAnalyticsController, "registerScheduledEventsActivity");

    objc_autoreleasePoolPop(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    objc_msgSend(v6, "run");
  }

  return 0;
}

void sub_100007E78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100008050(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008098(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008144(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_100008168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000817C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000818C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000081E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000083DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t sub_100008430(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_cleanupCachedRecognizersTargetLifetime:", 0);
  result = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_hasCachedRecognizers");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void sub_1000084F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100008504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100008654(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100008AE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100008EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  void *v29;

  _Unwind_Resume(a1);
}

void sub_100008F4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  double v17;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    objc_msgSend(v6, "targetIdleLifetime");
  v9 = v8;
  v10 = *(double *)(a1 + 48);
  objc_msgSend(v6, "lastActiveTimestamp");
  v12 = v11;
  if (!objc_msgSend(v6, "activeRequestCount") && v10 - v12 >= v9 + -2.0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v13 = (id)qword_10002AE38;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412546;
      v15 = v5;
      v16 = 2048;
      v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Staging recognizer for eviction with key: %@, idle lifetime = %fs", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

void sub_1000090B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_1000091BC(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 48)));
  objc_msgSend(v2, "_cleanupCachedRecognizersTargetLifetime:", v3);

  result = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "_hasCachedRecognizers");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void sub_100009230(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_10000949C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000959C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

id CHOSLogForCategory(int a1)
{
  if (qword_10002AE88 == -1)
    return (id)qword_10002AE18[a1];
  dispatch_once(&qword_10002AE88, &stru_1000249F0);
  return (id)qword_10002AE18[a1];
}

void sub_100009654(id a1)
{
  os_log_t v1;
  void *v2;
  os_log_t v3;
  void *v4;
  os_log_t v5;
  void *v6;
  os_log_t v7;
  void *v8;
  os_log_t v9;
  void *v10;
  os_log_t v11;
  void *v12;
  os_log_t v13;
  void *v14;
  os_log_t v15;
  void *v16;
  os_log_t v17;
  void *v18;
  os_log_t v19;
  void *v20;
  os_log_t v21;
  void *v22;
  os_log_t v23;
  void *v24;
  os_log_t v25;
  void *v26;

  v1 = os_log_create("com.apple.corehandwriting", "General");
  v2 = (void *)qword_10002AE18[0];
  qword_10002AE18[0] = (uint64_t)v1;

  v3 = os_log_create("com.apple.corehandwriting", "Recognizer");
  v4 = (void *)qword_10002AE20;
  qword_10002AE20 = (uint64_t)v3;

  v5 = os_log_create("com.apple.corehandwriting", "RecognitionSession");
  v6 = (void *)qword_10002AE28;
  qword_10002AE28 = (uint64_t)v5;

  v7 = os_log_create("com.apple.corehandwriting", "StrokeGrouping");
  v8 = (void *)qword_10002AE30;
  qword_10002AE30 = (uint64_t)v7;

  v9 = os_log_create("com.apple.corehandwriting", "ClutterFiltering");
  v10 = (void *)qword_10002AE40;
  qword_10002AE40 = (uint64_t)v9;

  v11 = os_log_create("com.apple.corehandwriting", "RemoteRecognizer");
  v12 = (void *)qword_10002AE38;
  qword_10002AE38 = (uint64_t)v11;

  v13 = os_log_create("com.apple.corehandwriting", "TextCorrectionRecognizer");
  v14 = (void *)qword_10002AE48;
  qword_10002AE48 = (uint64_t)v13;

  v15 = os_log_create("com.apple.corehandwriting", "CoreHandwritingSignPosts");
  v16 = (void *)qword_10002AE50;
  qword_10002AE50 = (uint64_t)v15;

  v17 = os_log_create("com.apple.corehandwriting", "Synthesizer");
  v18 = (void *)qword_10002AE60;
  qword_10002AE60 = (uint64_t)v17;

  v19 = os_log_create("com.apple.corehandwriting", "TextTransform");
  v20 = (void *)qword_10002AE68;
  qword_10002AE68 = (uint64_t)v19;

  v21 = os_log_create("com.apple.corehandwriting", "LineWrapping");
  v22 = (void *)qword_10002AE70;
  qword_10002AE70 = (uint64_t)v21;

  v23 = os_log_create("com.apple.corehandwriting", "StrokeClassification");
  v24 = (void *)qword_10002AE78;
  qword_10002AE78 = (uint64_t)v23;

  v25 = os_log_create("com.apple.corehandwriting", "SessionTracker");
  v26 = (void *)qword_10002AE80;
  qword_10002AE80 = (uint64_t)v25;

}

id sub_1000097E4(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", objc_msgSend(v1, "processIdentifier")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForIdentifier:error:](RBSProcessHandle, "handleForIdentifier:error:", v2, 0));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  return v5;
}

void sub_10000987C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1000098A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1000098B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000994C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_10002ADE8;
  qword_10002ADE8 = v1;

}

void sub_100009C20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100009C34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100009CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CHRemoteRecognitionServer;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_100009D04(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100009E14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100009E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000A290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000A3A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v13 = v12;

  _Unwind_Resume(a1);
}

void sub_10000A3D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_10000A3E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_10000A554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_10000A578(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000A58C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000A71C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_10000A9D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000AC88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000ACD0(id a1)
{
  NSSet *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  if (os_variant_has_internal_diagnostics("com.apple.corehandwriting.handwritingd"))
    v1 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.freeform"), CFSTR("com.apple.LiveInk"), 0);
  else
    v1 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.freeform"), 0, v4);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_10002ADF8;
  qword_10002ADF8 = v2;

}

void sub_10000AEF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000AF14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000AF24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000B090(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_10000B0B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000B0C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000B238(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v3;

  _Unwind_Resume(a1);
}

void sub_10000B25C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000B270(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000B38C(uint64_t a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  int v6;
  id v7;

  if (objc_msgSend(*(id *)(a1 + 32), "intValue") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "increment");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "intValue"))
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v2 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      v3 = objc_msgSend(*(id *)(a1 + 32), "integerValue");
      v6 = 134217984;
      v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "handleSessionStateUpdate got unknown state=%li", (uint8_t *)&v6, 0xCu);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "decrement");
    if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "hasActiveSessions") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "optimizeResourceUsage");
  }
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v4 = (id)qword_10002AE80;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "counter");
    v6 = 67109120;
    LODWORD(v7) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of active sessions: %i", (uint8_t *)&v6, 8u);
  }

}

void sub_10000B540(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000B550(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000B5DC(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  _BOOL4 v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD v8[2];

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "hasActiveSessions");
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v3 = (id)qword_10002AE80;
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "counter");
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not triggering optimizeResourceUsage. There are %i active sessions.", (uint8_t *)v8, 8u);
    }

  }
  else
  {
    if (v4)
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Triggering optimizeResourceUsage", (uint8_t *)v8, 2u);
    }

    v7 = *(_QWORD *)(a1 + 32);
    v6 = a1 + 32;
    objc_msgSend(*(id *)(v7 + 64), "optimizeResourceUsage");
    objc_msgSend(*(id *)(*(_QWORD *)v6 + 104), "optimizeResourceUsage");
    objc_msgSend(*(id *)(*(_QWORD *)v6 + 72), "optimizeResourceUsage");
  }
}

void sub_10000B728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000B7F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000B804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000B928(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000BAA0(id a1)
{
  CHPKAnalyticsServer *v1;
  void *v2;

  v1 = objc_alloc_init(CHPKAnalyticsServer);
  v2 = (void *)qword_10002AE08;
  qword_10002AE08 = (uint64_t)v1;

}

void sub_10000BD20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000BE94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10000BEA4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000C080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000C21C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000C310(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000C328(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = 0;
  v5 = objc_msgSend(v2, "isValidRemoteRequest:bundleIdentifier:error:", v3, v4, &v7);
  v6 = v7;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_handleValidRecognitionRequest:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10000C3A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000C4C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000C6D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000CAFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CB10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000CB2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000CB44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000CB5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CB70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CB84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000CB94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000CBB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000CBC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000CBE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CBF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CC08(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000CC18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000CCE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000CCFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000CD0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,void *a37)
{
  void *v37;
  void *v38;

  _Unwind_Resume(a1);
}

id sub_10000DCCC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v6 = a3;
  v18 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "transientLexicon");
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "transientPhraseLexicon");
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "vocabulary");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "textReplacements"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "addressBookLexicon"));
  +[CHCachedRecognizerManager configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:](CHCachedRecognizerManager, "configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:", v7, v8, v6, v9, v10, v11, v12, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CHPostProcessingStepOptionAdjustColumns);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_postprocessingMergedRecognitionResult:options:", v18, v15));

  return v16;
}

void sub_10000DE48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10000DE68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

id sub_10000DEEC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v6 = a3;
  v17 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6));
  v8 = *(_QWORD *)(a1 + 40);
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "transientLexicon");
  v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "transientPhraseLexicon");
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "vocabulary");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "textReplacements"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "addressBookLexicon"));
  +[CHCachedRecognizerManager configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:](CHCachedRecognizerManager, "configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:", v7, v8, v6, v9, v10, v11, v12, v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_changeableColumnCountUpdatedResult:options:", v17, v14));

  return v15;
}

void sub_10000E02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_10000E04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_10000E078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000E090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_10000E1EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000E64C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_10000E724(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_buildMultiLingualResultForRequest:recognitionLocales:recognizersByLocale:statisticsByLocale:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E81C;
  block[3] = &unk_100024B88;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 72);
  v9 = v2;
  v10 = v4;
  v5 = v2;
  dispatch_async(v3, block);

}

void sub_10000E80C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10000E81C(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id obj;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 80))
    objc_msgSend(*(id *)(v2 + 64), "clearCache");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(a1 + 40);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v5);
        v7 = *(_QWORD **)(a1 + 32);
        v8 = (void *)v7[5];
        v9 = *(_QWORD *)(a1 + 48);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serverQueue"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000EA04;
        v13[3] = &unk_100024AA0;
        v13[4] = *(_QWORD *)(a1 + 32);
        objc_msgSend(v8, "checkInRecognizerForRequest:locale:onQueue:idleCallbackBlock:", v9, v6, v10, v13);

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void sub_10000E9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

id sub_10000EA04(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdle");
}

void sub_10000EB94(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000EBB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000EBC4(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  int8x16_t v19;
  _QWORD block[4];
  int8x16_t v21;
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "drawing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mathRecognitionResultForDrawing:options:shouldCancel:", v5, v6, 0));

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v24[0] = CFSTR("inputStrokeCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "drawing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "strokeCount")));
  v24[1] = CFSTR("outputStringLength");
  v25[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topTranscription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v12, "length")));
  v25[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v25, v24, 2));

  +[CHPowerLogging logModelInference:startTimestamp:endTimestamp:data:](CHPowerLogging, "logModelInference:startTimestamp:endTimestamp:data:", 2, v14, v3, v9);
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EE8C;
  block[3] = &unk_100024B60;
  v19 = *(int8x16_t *)(a1 + 40);
  v16 = (id)v19.i64[0];
  v21 = vextq_s8(v19, v19, 8uLL);
  v17 = *(id *)(a1 + 56);
  v22 = v7;
  v23 = v17;
  v18 = v7;
  dispatch_async(v15, block);

}

void sub_10000EE0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t sub_10000EE8C(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  --*(_QWORD *)(a1[4] + 80);
  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 80))
  {
    objc_msgSend(*(id *)(v2 + 64), "clearCache");
    v2 = a1[4];
  }
  v3 = *(void **)(v2 + 40);
  v4 = a1[5];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v2, "serverQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EF80;
  v7[3] = &unk_100024AA0;
  v7[4] = a1[4];
  objc_msgSend(v3, "checkInRecognizerForRequest:locale:onQueue:idleCallbackBlock:", v4, 0, v5, v7);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_10000EF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_10000EF80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdle");
}

void sub_10000F23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_10000F664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
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

  _Unwind_Resume(a1);
}

void sub_10000F930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000F948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_10000F97C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000F99C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000F9B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000F9D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000F9E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000FA00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000FA14(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FA24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000FBE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_10000FC04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10000FC20(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v22 = 0;
  v5 = objc_msgSend(v2, "isValidRemoteRequest:bundleIdentifier:error:", v3, v4, &v22);
  v6 = v22;
  if (v5)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "locales"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "checkOutRecognizerForTextRequest:locale:", v7, v10));

    objc_msgSend(*(id *)(a1 + 32), "setDirty");
    v12 = *(NSObject **)(a1 + 56);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000FDE8;
    v16[3] = &unk_100024B88;
    v17 = v11;
    v18 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 64);
    v14 = *(_QWORD *)(a1 + 32);
    v19 = v13;
    v20 = v14;
    v21 = *(id *)(a1 + 72);
    v15 = v11;
    dispatch_async(v12, v16);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

void sub_10000FD88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000FD9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000FDB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000FDC8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FDD8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FDE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "locales"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  +[CHCachedRecognizerManager configureRecognizer:forRequest:locale:](CHCachedRecognizerManager, "configureRecognizer:forRequest:locale:", v2, v3, v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CHRecognitionOptionTextBefore));

  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestTranscriptionPathsForTokenizedResult:scores:history:", v9, &v21, v7));
  v11 = v21;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "serverQueue"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000FFBC;
  v16[3] = &unk_100024B88;
  v16[4] = *(_QWORD *)(a1 + 56);
  v17 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 64);
  v19 = v11;
  v20 = v13;
  v18 = v10;
  v14 = v11;
  v15 = v10;
  dispatch_async(v12, v16);

}

void sub_10000FF70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FF80(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10000FF94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10000FFA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_10000FFBC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "locales"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000100D8;
  v8[3] = &unk_100024AA0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "checkInRecognizerForRequest:locale:onQueue:idleCallbackBlock:", v2, v5, v6, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void sub_10001009C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000100B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000100C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000100D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdle");
}

void sub_1000101C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000101DC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = 0;
  v5 = objc_msgSend(v2, "isValidRemoteRequest:bundleIdentifier:error:", v3, v4, &v7);
  v6 = v7;
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "_handleValidSketchRecognitionRequest:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10001025C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000103E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000103FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100010410(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  int8x16_t v17;
  _QWORD block[4];
  int8x16_t v19;
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "drawing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sketchRecognitionResultsForDrawing:options:shouldCancel:", v5, v6, 0));

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v22 = CFSTR("inputPointCount");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "drawing"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "pointCount")));
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));

  +[CHPowerLogging logModelInference:startTimestamp:endTimestamp:data:](CHPowerLogging, "logModelInference:startTimestamp:endTimestamp:data:", 12, v12, v3, v9);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010678;
  block[3] = &unk_100024B60;
  v17 = *(int8x16_t *)(a1 + 40);
  v14 = (id)v17.i64[0];
  v19 = vextq_s8(v17, v17, 8uLL);
  v15 = *(id *)(a1 + 56);
  v20 = v7;
  v21 = v15;
  v16 = v7;
  dispatch_async(v13, block);

}

void sub_100010610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t sub_100010678(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = (void *)v2[5];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100010738;
  v7[3] = &unk_100024AA0;
  v7[4] = a1[4];
  objc_msgSend(v4, "checkInRecognizerForRequest:locale:onQueue:idleCallbackBlock:", v3, 0, v5, v7);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_100010728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100010738(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdle");
}

void sub_1000107AC(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[5];
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100010850;
  v5[3] = &unk_100024AA0;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "optimizeResourceUsageWithTimeout:onQueue:idleCallbackBlock:", v4, v5, 5.0);

}

void sub_100010840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100010850(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIdle");
}

void sub_1000109CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100010D2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_100010D4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100010D68(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100010EAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100010EC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100010EDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100010F10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000112F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100011538(uint64_t a1)
{
  unsigned int v2;
  uint64_t *v3;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  unsigned int v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasIdleLifetimeElapsed:", *(double *)(a1 + 40));
  v3 = *(uint64_t **)(a1 + 32);
  if (v3[7] > 0 || v2 == 0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v5 = (id)qword_10002AE60;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
      v7 = 134218240;
      v8 = v6;
      v9 = 1024;
      v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did not evict synthesizer. activeRequestCount=%lu, hasIdleLifetimeElapsed=%i", (uint8_t *)&v7, 0x12u);
    }

  }
  else
  {
    objc_msgSend(v3, "evictTextSynthesizer");
  }
}

void sub_100011B04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100011B5C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = objc_alloc_init((Class)CHSynthesisStyleInventory);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v5 = (id)qword_10002AE60;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Loaded style inventory", v6, 2u);
  }

}

void sub_100011E4C(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  unsigned int v14;

  v2 = objc_msgSend(*(id *)(a1 + 32), "hasStyleInventoryIdleLifetimeElapsed:", *(double *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v3 + 88) > 0 || v2 == 0)
  {
    v5 = v2;
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v6 = (id)qword_10002AE60;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
      v11 = 134218240;
      v12 = v7;
      v13 = 1024;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Did not evict style inventory. activeStyleInventoryRequestCount=%lu, hasIdleLifetimeElapsed=%i", (uint8_t *)&v11, 0x12u);
    }

  }
  else
  {
    *(_QWORD *)(v3 + 88) = 0;
    objc_msgSend(*(id *)(a1 + 32), "saveStyleInventoryIfNeeded");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 80);
    if (v9)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v10 = (id)qword_10002AE60;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Evicted style inventory", (uint8_t *)&v11, 2u);
      }

      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 80);
    }
    *(_QWORD *)(v8 + 80) = 0;

    objc_msgSend(*(id *)(a1 + 32), "evictTextSynthesizer");
  }
}

void sub_100012078(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "lastSavedDate"));
  objc_msgSend(v2, "timeIntervalSinceNow");
  v4 = v3;

  if (v4 <= -60.0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v5 = (id)qword_10002AE60;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending message to save the style inventory if needed", v6, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "saveIfNeeded");
  }
}

void sub_100012160(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_1000121DC(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v2 = (id)qword_10002AE60;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending message to save the style inventory if needed", v4, 2u);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "saveIfNeeded");
}

void sub_1000123C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000123D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100012924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  void *v25;

  _Unwind_Resume(a1);
}

void sub_1000129B8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 40))
    *a4 = 1;

}

void sub_100012A14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100012AA8(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "checkOutTextSynthesizer");
  objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lowPriorityQueue"));
  if (!v2)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v3 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "A valid queue is required to run style inventory requests", buf, 2u);
    }

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012BAC;
  block[3] = &unk_100024AA0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v2, block);

}

void sub_100012BAC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "samplesWithoutStylePrediction"));
  v3 = objc_msgSend(v2, "count");

  v4 = vcvtps_s32_f32((float)(uint64_t)v3 / 10.0);
  if (v4 >= 1)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateStylePredictionsSingleBatch:", 10);
      --v4;
    }
    while (v4);
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012C8C;
  block[3] = &unk_100024AA0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, block);

}

void sub_100012C7C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100012C8C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "checkInTextSynthesizer");
  return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
}

void sub_100012D54(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100012D74(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100013100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33)
{
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;

  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Block_object_dispose((const void *)(v36 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_100013168(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id sub_100013180(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  __int16 v18;
  const __CFString *v19;

  objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80))
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v7 = (id)qword_10002AE60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: not triggering character synthesis. Inventory is not available.", (uint8_t *)&v16, 2u);
    }
LABEL_14:

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
    goto LABEL_15;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v5 = objc_msgSend(v4, "synthesizeCharacterInventoryBehavior");

  v6 = *(_QWORD *)(a1 + 32);
  if (v5 == (id)2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend((id)v6, "_isReadyForCharacterInventorySynthesis");
    if (v3 - *(double *)(*(_QWORD *)(a1 + 32) + 104) <= 600.0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v7 = (id)qword_10002AE60;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v13 = v3 - *(double *)(*(_QWORD *)(a1 + 32) + 104);
        v16 = 134217984;
        v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CHRemoteSynthesisRequestHandler: forced character synthesis is not triggering. We have in flight synthesis right now. Last run was triggered %f seconds ago", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cleanupFastPathCharacters");
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v7 = (id)qword_10002AE60;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
          *(double *)&v8 = COERCE_DOUBLE(CFSTR("triggering"));
        else
          *(double *)&v8 = COERCE_DOUBLE(CFSTR("not triggering due to insufficent coverage in style inventory"));
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
          v9 = CFSTR("YES");
        else
          v9 = CFSTR("NO");
        v16 = 138412546;
        v17 = *(double *)&v8;
        v18 = 2112;
        v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: forced character synthesis is %@. Resynthesize all = %@. Cleanup character inventory.", (uint8_t *)&v16, 0x16u);
      }
    }
    goto LABEL_14;
  }
  if (v3 - *(double *)(v6 + 104) <= 600.0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v7 = (id)qword_10002AE60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = v3 - *(double *)(*(_QWORD *)(a1 + 32) + 104);
      v16 = 134217984;
      v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not triggering character synthesis. Last run was triggered %f seconds ago", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(v6 + 80), "getLastCharacterStyleTimestamp");
  if (v3 - v12 <= 600.0)
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v7 = (id)qword_10002AE60;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getLastCharacterStyleTimestamp");
      v16 = 134217984;
      v17 = v3 - v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not triggering character synthesis, last update was %f seconds ago", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_isReadyForCharacterInventorySynthesis");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
LABEL_15:
  *(double *)(*(_QWORD *)(a1 + 32) + 104) = v3;
  objc_msgSend(*(id *)(a1 + 32), "checkOutTextSynthesizer");
  objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "getLastCharacterStyleTimestamp");
  if (v3 - v10 > 604800.0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
}

void sub_100013658(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100013668(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_10001367C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001368C(uint64_t a1)
{

}

uint64_t sub_100013694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t (**v29)(id, void *);
  void *v30;
  id obj;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  id v44;

  v32 = a5;
  v29 = a6;
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "styleSamplesForInputSample:prompt:samplingAlgorithm:maxNumOfSamples:", 0, a2, a3, a4));
  if (!objc_msgSend(v30, "count"))
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v11
      || (v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "styleSampleForInputSample:prompt:samplingAlgorithm:", 0, CFSTR("qwertyuioplikjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM"), a3)), v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), v14 = *(void **)(v13 + 40), *(_QWORD *)(v13 + 40) = v12, v14, (v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)) != 0))
    {
      v15 = objc_msgSend(v11, "copy");
      v44 = v15;
      v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));

      v30 = (void *)v16;
    }
  }
  v17 = v29[2](v29, v30);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(v17);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(obj);
        v21 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "options"));
        objc_msgSend(v22, "setSynthesizeCharacterInventoryBehavior:", 0);

        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v23 = (id)qword_10002AE60;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "string"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "options"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "styleContent"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "drawing"));
          *(_DWORD *)buf = 138740483;
          v38 = v24;
          v39 = 2117;
          v40 = v26;
          v41 = 2112;
          v42 = v27;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: Synthesise content %{sensitive}@ with style %{sensitive}@ with initial drawing %@", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 32), "handleRequest:withReply:bundleIdentifier:", v21, v32, *(_QWORD *)(a1 + 40));

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v18);
  }

  return 0;
}

void sub_1000139C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

id sub_100013A78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "checkInTextSynthesizer");
  return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
}

void sub_100013CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  void *v35;
  uint64_t v36;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v36 - 208), 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);

  _Block_object_dispose((const void *)(v36 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100013D4C(_QWORD *a1, void *a2, int a3, double a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  CGFloat Width;
  void *v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v7 = a2;
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "drawingScaledByFactor:", a4));

  objc_msgSend(v22, "bounds");
  v9 = v8;
  v11 = *(double *)(*(_QWORD *)(a1[4] + 8) + 24) + 20.0 - v10;
  v12 = 25.0;
  if (!a3)
    goto LABEL_5;
  v13 = *(_QWORD *)(a1[5] + 8);
  v14 = v22;
  if (*(double *)(v13 + 24) >= 0.0)
  {
    v15 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24);
    objc_msgSend(v22, "bounds");
    Width = CGRectGetWidth(v23);
    v13 = *(_QWORD *)(a1[5] + 8);
    if (v15 + 25.0 + Width < 300.0)
    {
      v11 = *(double *)(v13 + 24);
      v12 = *(double *)(*(_QWORD *)(a1[6] + 8) + 24) + 25.0;
LABEL_5:
      v14 = v22;
      goto LABEL_8;
    }
    v14 = v22;
  }
  *(double *)(v13 + 24) = v11;
LABEL_8:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "drawingTransformedWithTranslation:scaleFactor:", v12 - v9, v11, 1.0));
  objc_msgSend(v17, "bounds");
  *(CGFloat *)(*(_QWORD *)(a1[4] + 8) + 24) = CGRectGetMaxY(v24);
  objc_msgSend(v17, "bounds");
  *(CGFloat *)(*(_QWORD *)(a1[6] + 8) + 24) = CGRectGetMaxX(v25);
  v18 = *(_QWORD *)(a1[7] + 8);
  v21 = *(void **)(v18 + 40);
  v19 = (id *)(v18 + 40);
  v20 = v21;
  if (v21)
    objc_msgSend(v20, "appendDrawing:", v17);
  else
    objc_storeStrong(v19, v17);

}

void sub_100013EC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100013EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100013EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100013F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100013F1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100013F34(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id obj;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "fastPathCharacterStylesWithVariations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allKeys"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortedArrayUsingSelector:", "compare:"));

  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v28 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i)));
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v25;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(a1 + 40);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1)
                                                                                 + 8 * (_QWORD)j), "drawing"));
              (*(void (**)(uint64_t, void *, uint64_t, double))(v12 + 16))(v12, v13, 1, 15.0);

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v9);
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + 20.0;
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  v20[0] = _NSConcreteStackBlock;
  v20[2] = sub_100014258;
  v20[3] = &unk_100024C78;
  v22 = *(_QWORD *)(a1 + 56);
  v20[1] = 3221225472;
  v16 = v14;
  v17 = *(_QWORD *)(a1 + 64);
  v21 = v16;
  v23 = v17;
  objc_msgSend(v15, "enumerateStyleSamplesUsingBlock:", v20);
  objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");

}

void sub_1000141D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{

  _Unwind_Resume(a1);
}

void sub_100014258(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;

  v3 = a2;
  if (qword_10002AE88 != -1)
    dispatch_once(&qword_10002AE88, &stru_1000249F0);
  v4 = (id)qword_10002AE60;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = *(_QWORD *)(a1[5] + 8);
    v6 = *(_QWORD *)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v6 + 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transcription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "drawing"));
    *(_DWORD *)buf = 134218499;
    v14 = v6;
    v15 = 2117;
    v16 = v7;
    v17 = 2048;
    v18 = objc_msgSend(v8, "strokeCount");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Sample [%lu] \"%{sensitive}@\" numStrokes=%lu", buf, 0x20u);

  }
  v9 = a1[4];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "drawing"));
  (*(void (**)(uint64_t, void *, _QWORD, double))(v9 + 16))(v9, v10, 0, 1.0);

  v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "transcription"));
  objc_msgSend(v11, "appendFormat:", CFSTR("%@\n"), v12);

}

void sub_1000143FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_10001467C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_1000146AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000146C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000146E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000146FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

BOOL sub_100014718(id a1, NSString *a2, NSString *a3)
{
  NSString *v4;
  NSString *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](v4, "lowercaseString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](v5, "lowercaseString"));
  v8 = (objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0
    || -[NSString isEqualToString:](v4, "isEqualToString:", CFSTR("0"))
    && (objc_msgSend(v7, "isEqualToString:", CFSTR("o")) & 1) != 0;

  return v8;
}

void sub_1000147CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000147E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000147F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100014814(uint64_t a1)
{
  unint64_t i;
  void *v3;
  BOOL v4;
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
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  unsigned int v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  dispatch_semaphore_t v27;
  _QWORD v28[4];
  id v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t buf[4];
  unsigned int v35;
  void *v36;

  v27 = dispatch_semaphore_create(0);
  for (i = 0; ; ++i)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "segmentStrokeIndexes", v27));
    v4 = i < (unint64_t)objc_msgSend(v3, "count");

    if (!v4)
      break;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "segmentStrokeIndexes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", i));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawing"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "drawingWithStrokesFromIndexSet:", v6));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "segmentContents"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", i));

    if ((uint64_t)objc_msgSend(v10, "countCodepoints") <= 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", CFSTR("en_US")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
      v13 = objc_alloc((Class)CHRemoteRecognitionTextRequest);
      v36 = v11;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      v15 = objc_msgSend(v13, "initWithLocales:recognitionMode:drawing:options:priority:", v14, 4, v8, v12, 2);

      objc_msgSend(v15, "setAutoCorrectionMode:", 2);
      objc_msgSend(v15, "setAutoCapitalizationMode:", 0);
      v16 = *(void **)(*(_QWORD *)(a1 + 40) + 112);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100014CC8;
      v28[3] = &unk_100024D08;
      v31 = *(id *)(a1 + 64);
      v17 = v10;
      v18 = *(_QWORD *)(a1 + 80);
      v29 = v17;
      v32 = v18;
      v33 = i;
      v19 = v27;
      v30 = v19;
      objc_msgSend(v16, "handleRequest:withReply:bundleIdentifier:", v15, v28, *(_QWORD *)(a1 + 48));
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
  {
    v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setContractViolations:", v20);

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v21 = (id)qword_10002AE60;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
      *(_DWORD *)buf = 67109120;
      v35 = v22;
      v23 = "Synthesizer contract violations found, total %d";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEFAULT;
      v26 = 8;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v21 = (id)qword_10002AE60;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v23 = "Synthesizer contract violations not found";
      v24 = v21;
      v25 = OS_LOG_TYPE_DEBUG;
      v26 = 2;
      goto LABEL_15;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
}

void sub_100014BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;

  _Unwind_Resume(a1);
}

void sub_100014CC8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unsigned int v20;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topTranscription"));
  v5 = objc_opt_class(CHTokenizedTextResult);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topModelTranscription"));

    v4 = (void *)v6;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))() & 1) == 0)
  {
    v7 = objc_msgSend(objc_alloc((Class)CHSynthesisContractViolation), "initWithLocationRange:comment:kind:", *(_QWORD *)(a1 + 64), 1, &stru_100025708, 1);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v7);
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE60;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "score");
      v11 = v10;
      v12 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
      v13 = 138740739;
      v14 = v4;
      v15 = 2117;
      v16 = v9;
      v17 = 2048;
      v18 = v11;
      v19 = 1024;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Synthesizer contract violation found, result %{sensitive}@, expected %{sensitive}@ score %f totalViolations %d", (uint8_t *)&v13, 0x26u);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_100014EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100014EBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100014ED4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100014EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100014EFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000151C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100015208(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100015244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10001525C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  char v24;
  char v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v26 = 0;
  v5 = objc_msgSend(v2, "_isValidRemoteSynthesisRequest:bundleIdentifier:error:", v3, v4, &v26);
  v6 = v26;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "checkOutTextSynthesizer");
    objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
    v25 = 1;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_queueForRequest:outIsSynchronizedSynthesisQueue:", *(_QWORD *)(a1 + 40), &v25));
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v8 = (id)qword_10002AE60;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (v25)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Remote request handled on synchronized synthesis queue=%@", buf, 0xCu);
    }

    if (!v7)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v11 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "A valid queue is required to run synthesis", buf, 2u);
      }

    }
    v12 = (void *)os_transaction_create("com.apple.handwritingd.ongoingSynthesis", v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015520;
    block[3] = &unk_100024D58;
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v13;
    v19 = v14;
    v23 = *(_OWORD *)(a1 + 64);
    v24 = v25;
    v20 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v21 = v12;
    v22 = v15;
    v16 = v12;
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_1000154F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015520(uint64_t a1)
{
  double v2;
  double v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned __int8 v60;
  NSObject *v61;
  _QWORD block[5];
  id v63;
  id v64;
  uint8_t buf[8];
  id v66;
  id obj;
  _QWORD v68[2];
  _QWORD v69[2];

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "requestType");
  if (!v4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
    v15 = objc_msgSend(v14, "skipStyleInventoryLookup");

    if (v15)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v16 = (id)qword_10002AE60;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Skipping style inventory lookup", buf, 2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
      v18 = objc_msgSend(v17, "copy");
    }
    else
    {
      if (*(_BYTE *)(a1 + 88))
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "needsStylePredictionUpdate"))
          objc_msgSend(*(id *)(a1 + 40), "_updateStylePredictionsSingleBatch:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "minimumNumberOfSamplesWithStylePrediction"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "styleDrawing"));
        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "styleContent"));

          if (v32)
          {
            v33 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "styleContent"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "styleDrawing"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "stylePredictionResultForTranscription:drawing:shouldCancel:", v35, v37, 0));

            if (!v38)
            {
              v39 = CHOSLogForCategory(0);
              v40 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_FAULT, "CHRemoteSynthesisRequestTypeGeneration: style prediction from the textSynthesizer is nil for input style sample", buf, 2u);
              }

            }
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
            objc_msgSend(v41, "setStylePrediction:", v38);

          }
        }
        else
        {

        }
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "styleSampleOptionsForRequest:", *(_QWORD *)(a1 + 32)));
        goto LABEL_36;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
      v43 = objc_msgSend(v42, "isFastPath");

      if ((v43 & 1) == 0)
      {
        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v44 = (id)qword_10002AE18[0];
        if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_FAULT, "Only fast path queries should end up on non-synchronized synthesis queues", buf, 2u);
        }

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
      v18 = objc_msgSend(v17, "copy");
    }
    v6 = v18;

LABEL_36:
    v45 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "string"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dictionary](v6, "dictionary"));
    v48 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v64 = *(id *)(v48 + 40);
    v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "synthesizeDrawingForString:options:shouldCancel:error:", v46, v47, 0, &v64));
    objc_storeStrong((id *)(v48 + 40), v64);
    v50 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v51 = *(void **)(v50 + 40);
    *(_QWORD *)(v50 + 40) = v49;

    goto LABEL_37;
  }
  if (v4 == (id)2)
  {
    v19 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawing"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "styleContent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "string"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "dictionary"));
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v66 = *(id *)(v25 + 40);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "replaceDrawing:originalTranscription:replacementTranscription:options:shouldCancel:error:", v6, v21, v22, v24, 0, &v66));
    objc_storeStrong((id *)(v25 + 40), v66);
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

  }
  else if (v4 == (id)1)
  {
    v5 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "string"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dictionary"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "refineDrawing:transcription:options:shouldCancel:error:", v6, v7, v9, 0, &obj));
    objc_storeStrong((id *)(v10 + 40), obj);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

  }
  else
  {
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v6 = (id)qword_10002AE18[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Invalid synthesis request type specified", buf, 2u);
    }
  }
LABEL_37:

  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  v53 = v52;
  v68[0] = CFSTR("inputStringLength");
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "string"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v54, "length")));
  v68[1] = CFSTR("outputStrokeCount");
  v69[0] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "drawing"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v56, "strokeCount")));
  v69[1] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 2));

  +[CHPowerLogging logModelInference:startTimestamp:endTimestamp:data:](CHPowerLogging, "logModelInference:startTimestamp:endTimestamp:data:", 3, v58, v3, v53);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
    || (v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "options")),
        v60 = objc_msgSend(v59, "validateSegments"),
        v59,
        (v60 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "checkSegmentsAndDrawingConsistencyForSynthesisResult:bundleIdentifier:withReply:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  }
  v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015EBC;
  block[3] = &unk_100024A78;
  block[4] = *(_QWORD *)(a1 + 40);
  v63 = *(id *)(a1 + 56);
  dispatch_async(v61, block);

}

void sub_100015CF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_100015EBC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "checkInTextSynthesizer");
  return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
}

void sub_100015FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_100015FD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100015FEC(id *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "checkOutStyleInventory");
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "lowPriorityQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016090;
  block[3] = &unk_100024DA8;
  v3 = a1[5];
  v4 = a1[4];
  v6 = v3;
  v7 = v4;
  v8 = a1[6];
  dispatch_async(v2, block);

}

void sub_100016090(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[16];

  if (!objc_msgSend(*(id *)(a1 + 32), "shouldResetInventory"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "removedStrokeIdentifiers"));

    if (v2)
    {
      v3 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "removedStrokeIdentifiers"));
      objc_msgSend(v3, "removeSamplesContainingStrokeIdentifiers:", v4);

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenizedResult"));
      if (!v5)
        goto LABEL_20;
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v6 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Inventory request can't have both removedStrokeIdentifiers and tokenizedResult non-nil", buf, 2u);
      }
LABEL_19:

      goto LABEL_20;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenizedResult"));
    v8 = objc_opt_class(CHTokenizedTextResult);
    isKindOfClass = objc_opt_isKindOfClass(v7, v8);

    if ((isKindOfClass & 1) != 0)
    {
      v10 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenizedResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawing"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "strokeIdentifiers"));
      objc_msgSend(v10, "addSamplesIfNeededWithTokenizedTextResult:drawing:strokeIdentifiers:", v11, v12, v13);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenizedResult"));
      v15 = objc_opt_class(CHTokenizedMathResult);
      v16 = objc_opt_isKindOfClass(v14, v15);

      if ((v16 & 1) == 0)
      {
        if (qword_10002AE88 != -1)
          dispatch_once(&qword_10002AE88, &stru_1000249F0);
        v6 = (id)qword_10002AE18[0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Invalid tokenized result type provided", buf, 2u);
        }
        goto LABEL_19;
      }
      v17 = *(void **)(*(_QWORD *)(a1 + 40) + 80);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tokenizedResult"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "drawing"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "strokeIdentifiers"));
      objc_msgSend(v17, "addSamplesIfNeededWithTokenizedMathResult:drawing:strokeIdentifiers:", v11, v12, v13);
    }

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "reset");
LABEL_20:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CHSynthesisStyleInventory statusWithInventory:](CHSynthesisStyleInventory, "statusWithInventory:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80)));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "serverQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100016488;
  block[3] = &unk_100024AA0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(v19, block);

}

void sub_1000163D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1000163E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000163FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_10001640C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100016424(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100016438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016448(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016458(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016478(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100016488(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
}

void sub_100016528(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016538(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "checkOutStyleInventory");
  v2 = (id)objc_claimAutoreleasedReturnValue(+[CHSynthesisStyleInventory statusWithInventory:](CHSynthesisStyleInventory, "statusWithInventory:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)));
  objc_msgSend(*(id *)(a1 + 32), "checkInStyleInventory");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000165A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_100016724(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100016884(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  unsigned int v16;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hasIdleLifetimeElapsed:", *(double *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (*(uint64_t *)(v3 + 48) > 0 || v2 == 0)
  {
    v5 = v2;
    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v6 = (id)qword_10002AE70;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v13 = 134218240;
      v14 = v7;
      v15 = 1024;
      v16 = v5;
      v8 = "Did not evict line wrapper. activeRequestCount=%lu, hasIdleLifetimeElapsed=%i";
      v9 = v6;
      v10 = 18;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    *(_QWORD *)(v3 + 48) = 0;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;

    if (qword_10002AE88 != -1)
      dispatch_once(&qword_10002AE88, &stru_1000249F0);
    v6 = (id)qword_10002AE70;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      v8 = "Evicted line wrapper";
      v9 = v6;
      v10 = 2;
      goto LABEL_14;
    }
  }

}

void sub_100016E0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100016E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100016E40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100016E58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100016E6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100016E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100016E90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_100016F90(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_100016FA8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[8];
  id v14;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v14 = 0;
  v5 = objc_msgSend(v2, "_isValidRemoteLineWrappingRequest:bundleIdentifier:error:", v3, v4, &v14);
  v6 = v14;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_checkOutLineWrapper");
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "highPriorityQueue"));
    if (!v7)
    {
      if (qword_10002AE88 != -1)
        dispatch_once(&qword_10002AE88, &stru_1000249F0);
      v8 = (id)qword_10002AE18[0];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "A valid queue is required to run line wrapping", buf, 2u);
      }

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017144;
    block[3] = &unk_100024DA8;
    v9 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v11 = v9;
    v12 = *(id *)(a1 + 56);
    dispatch_async(v7, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void sub_100017124(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100017134(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_100017144(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "lineWrappableGroups"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "options"));
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lineWrappingResultForGroups:options:error:", v3, v4, &v9));
  v6 = v9;

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017288;
  v8[3] = &unk_100024AA0;
  v8[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v7, v8);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100017244(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_10001725C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100017274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id sub_100017288(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkInLineWrapper");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__asyncUpdateInventoryStylePredictions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_asyncUpdateInventoryStylePredictions");
}

id objc_msgSend__buildMultiLingualResultForRequest_recognitionLocales_recognizersByLocale_statisticsByLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_buildMultiLingualResultForRequest:recognitionLocales:recognizersByLocale:statisticsByLocale:");
}

id objc_msgSend__changeableColumnCountUpdatedResult_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_changeableColumnCountUpdatedResult:options:");
}

id objc_msgSend__checkOutLineWrapper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkOutLineWrapper");
}

id objc_msgSend__cleanupCachedRecognizersTargetLifetime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanupCachedRecognizersTargetLifetime:");
}

id objc_msgSend__computeTextRecognitionResultsForRequest_recognizer_recognizerCachingKey_isTopLocale_writingStatistics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_computeTextRecognitionResultsForRequest:recognizer:recognizerCachingKey:isTopLocale:writingStatistics:");
}

id objc_msgSend__createDebugViewOfInventory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createDebugViewOfInventory");
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deviceLanguage");
}

id objc_msgSend__handleCharacterInventoryRequest_withReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleCharacterInventoryRequest:withReply:bundleIdentifier:");
}

id objc_msgSend__handleValidRecognitionMathRequest_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleValidRecognitionMathRequest:withReply:");
}

id objc_msgSend__handleValidRecognitionRequest_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleValidRecognitionRequest:withReply:");
}

id objc_msgSend__handleValidRecognitionTextRequest_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleValidRecognitionTextRequest:withReply:");
}

id objc_msgSend__handleValidSketchRecognitionRequest_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleValidSketchRecognitionRequest:withReply:");
}

id objc_msgSend__hasCachedRecognizers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasCachedRecognizers");
}

id objc_msgSend__hasEntitlement_connection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasEntitlement:connection:");
}

id objc_msgSend__hasIdleLifetimeElapsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasIdleLifetimeElapsed:");
}

id objc_msgSend__invalidInputErrorWithDescription_failureReason_recoverySuggestion_errorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_invalidInputErrorWithDescription:failureReason:recoverySuggestion:errorCode:");
}

id objc_msgSend__isReadyForCharacterInventorySynthesis(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isReadyForCharacterInventorySynthesis");
}

id objc_msgSend__isValidRemoteLineWrappingRequest_bundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isValidRemoteLineWrappingRequest:bundleIdentifier:error:");
}

id objc_msgSend__isValidRemoteSynthesisRequest_bundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isValidRemoteSynthesisRequest:bundleIdentifier:error:");
}

id objc_msgSend__maxStrokeLimitErrorWithInputDrawingStrokeCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maxStrokeLimitErrorWithInputDrawingStrokeCount:");
}

id objc_msgSend__postprocessingMergedRecognitionResult_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_postprocessingMergedRecognitionResult:options:");
}

id objc_msgSend__queueForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueForRequest:");
}

id objc_msgSend__queueForRequest_outIsSynchronizedSynthesisQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_queueForRequest:outIsSynchronizedSynthesisQueue:");
}

id objc_msgSend__recognizerConfigurationKeyForRequest_locale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recognizerConfigurationKeyForRequest:locale:");
}

id objc_msgSend__recognizerWrapperForRequest_locale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recognizerWrapperForRequest:locale:");
}

id objc_msgSend__shouldFreezeCharacterInventory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldFreezeCharacterInventory");
}

id objc_msgSend__shouldFulfillRemoteRequestForConnection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shouldFulfillRemoteRequestForConnection:error:");
}

id objc_msgSend__stageEvictionOfLineWrapperWithTargetIdleLifetime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageEvictionOfLineWrapperWithTargetIdleLifetime:");
}

id objc_msgSend__stageEvictionOfResourceWithTargetLifetime_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stageEvictionOfResourceWithTargetLifetime:block:");
}

id objc_msgSend__synthesizeStyleInventoryIfNeededWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_synthesizeStyleInventoryIfNeededWithConnection:");
}

id objc_msgSend__touchLastSessionTimestampIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_touchLastSessionTimestampIfNecessary");
}

id objc_msgSend__unableToProcessRequestErrorWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unableToProcessRequestErrorWithBundleIdentifier:");
}

id objc_msgSend__updateStylePredictionsSingleBatch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStylePredictionsSingleBatch:");
}

id objc_msgSend_absoluteMaxStrokeCountPerRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteMaxStrokeCountPerRequest");
}

id objc_msgSend_activeCharacterSetPerLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeCharacterSetPerLocale");
}

id objc_msgSend_activeRequestCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeRequestCount");
}

id objc_msgSend_addIntegerToTransientCounter_forKey_andCandidateLength_andContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIntegerToTransientCounter:forKey:andCandidateLength:andContext:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSamplesIfNeededWithTokenizedMathResult_drawing_strokeIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSamplesIfNeededWithTokenizedMathResult:drawing:strokeIdentifiers:");
}

id objc_msgSend_addSamplesIfNeededWithTokenizedTextResult_drawing_strokeIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSamplesIfNeededWithTokenizedTextResult:drawing:strokeIdentifiers:");
}

id objc_msgSend_addressBookLexicon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressBookLexicon");
}

id objc_msgSend_adjustColumns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustColumns");
}

id objc_msgSend_aggregatedCountFromTransientCounterWithName_forNumberOfDays_fromLoadedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aggregatedCountFromTransientCounterWithName:forNumberOfDays:fromLoadedDate:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_appendDrawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendDrawing:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_autoCapitalizationMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoCapitalizationMode");
}

id objc_msgSend_autoCorrectionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "autoCorrectionMode");
}

id objc_msgSend_baseWritingDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseWritingDirection");
}

id objc_msgSend_bestTranscriptionPathsForTokenizedResult_scores_history_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestTranscriptionPathsForTokenizedResult:scores:history:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bucketNumber_bucketThresholds_bucketValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bucketNumber:bucketThresholds:bucketValues:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_cacheTextResult_drawing_recognitionEngineCachingKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheTextResult:drawing:recognitionEngineCachingKey:");
}

id objc_msgSend_cachedSettingsBoolForKey_userModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedSettingsBoolForKey:userModel:");
}

id objc_msgSend_cachedSettingsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedSettingsDictionary");
}

id objc_msgSend_checkInRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInRecognizer");
}

id objc_msgSend_checkInRecognizerForRequest_locale_onQueue_idleCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInRecognizerForRequest:locale:onQueue:idleCallbackBlock:");
}

id objc_msgSend_checkInStyleInventory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInStyleInventory");
}

id objc_msgSend_checkInTextSynthesizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInTextSynthesizer");
}

id objc_msgSend_checkOutRecognizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutRecognizer");
}

id objc_msgSend_checkOutRecognizerForMathRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutRecognizerForMathRequest:");
}

id objc_msgSend_checkOutRecognizerForSketchRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutRecognizerForSketchRequest:");
}

id objc_msgSend_checkOutRecognizerForTextRequest_locale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutRecognizerForTextRequest:locale:");
}

id objc_msgSend_checkOutStyleInventory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutStyleInventory");
}

id objc_msgSend_checkOutTextSynthesizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkOutTextSynthesizer");
}

id objc_msgSend_checkSegmentsAndDrawingConsistencyForSynthesisResult_bundleIdentifier_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkSegmentsAndDrawingConsistencyForSynthesisResult:bundleIdentifier:withReply:");
}

id objc_msgSend_cleanupFastPathCharacters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cleanupFastPathCharacters");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clear");
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCache");
}

id objc_msgSend_combineMultiLocaleResults_locales_topLocaleIndex_mergedResultPostprocessingBlock_changeableColumnCountBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "combineMultiLocaleResults:locales:topLocaleIndex:mergedResultPostprocessingBlock:changeableColumnCountBlock:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_configureRecognizer_forRequest_locale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureRecognizer:forRequest:locale:");
}

id objc_msgSend_configureRecognizer_forRequest_locale_transientLexicon_transientPhraseLexicon_vocabulary_textReplacements_addressBookLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureRecognizer:forRequest:locale:transientLexicon:transientPhraseLexicon:vocabulary:textReplacements:addressBookLexicon:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentType");
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contexts");
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

id objc_msgSend_countCodepoints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countCodepoints");
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "counter");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_declaredVariables(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "declaredVariables");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decrement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decrement");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_diffusionModelHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diffusionModelHash");
}

id objc_msgSend_dispatchDailyUsageEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchDailyUsageEvents");
}

id objc_msgSend_dispatchLifecycleEventForFeature_denominatorKey_inputModeIdentifier_values_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchLifecycleEventForFeature:denominatorKey:inputModeIdentifier:values:sinceDate:");
}

id objc_msgSend_dispatchLifecycleEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchLifecycleEvents");
}

id objc_msgSend_dispatchScheduledEventsWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchScheduledEventsWithCompletionBlock:");
}

id objc_msgSend_dispatchSettingsEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchSettingsEvents");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawing");
}

id objc_msgSend_drawingScaledByFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingScaledByFactor:");
}

id objc_msgSend_drawingTransformedWithTranslation_scaleFactor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingTransformedWithTranslation:scaleFactor:");
}

id objc_msgSend_drawingWithStrokesFromIndexSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drawingWithStrokesFromIndexSet:");
}

id objc_msgSend_effectiveRecognitionLocales_recognitionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveRecognitionLocales:recognitionMode:");
}

id objc_msgSend_enableCachingIfAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCachingIfAvailable");
}

id objc_msgSend_enableGen2CharacterLMIfAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableGen2CharacterLMIfAvailable");
}

id objc_msgSend_enableGen2ModelIfAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableGen2ModelIfAvailable");
}

id objc_msgSend_enableStrokeReordering(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableStrokeReordering");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateStyleSamplesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateStyleSamplesUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evictTextSynthesizer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evictTextSynthesizer");
}

id objc_msgSend_fastPathCharacterStylesWithVariations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fastPathCharacterStylesWithVariations");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fingerDrawingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fingerDrawingEnabled");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_generateRecognitionOptionsFromRequest_isTopLocale_cachedPrefixResult_cachedPrefixColumnRangeToKeep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateRecognitionOptionsFromRequest:isTopLocale:cachedPrefixResult:cachedPrefixColumnRangeToKeep:");
}

id objc_msgSend_getAllKnownInputModes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAllKnownInputModes");
}

id objc_msgSend_getLastCharacterStyleTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLastCharacterStyleTimestamp");
}

id objc_msgSend_handleForIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForIdentifier:error:");
}

id objc_msgSend_handleInventoryRequest_withReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInventoryRequest:withReply:bundleIdentifier:");
}

id objc_msgSend_handleInventoryStatusRequestWithReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleInventoryStatusRequestWithReply:bundleIdentifier:");
}

id objc_msgSend_handleRequest_withReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRequest:withReply:bundleIdentifier:");
}

id objc_msgSend_handleSketchRequest_withReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSketchRequest:withReply:bundleIdentifier:");
}

id objc_msgSend_hasActiveSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasActiveSessions");
}

id objc_msgSend_hasAllDigits(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasAllDigits");
}

id objc_msgSend_hasIdleLifetimeElapsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasIdleLifetimeElapsed:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasStyleInventoryIdleLifetimeElapsed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasStyleInventoryIdleLifetimeElapsed:");
}

id objc_msgSend_highPriorityQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highPriorityQueue");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierWithPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierWithPid:");
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increment");
}

id objc_msgSend_indexSetWithIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndexesInRange:");
}

id objc_msgSend_initWithContent_drawing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContent:drawing:");
}

id objc_msgSend_initWithInputLanguage_inputRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInputLanguage:inputRegion:");
}

id objc_msgSend_initWithInputMode_userModelDataStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInputMode:userModelDataStore:");
}

id objc_msgSend_initWithLocales_recognitionMode_drawing_options_priority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocales:recognitionMode:drawing:options:priority:");
}

id objc_msgSend_initWithLocationRange_comment_kind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocationRange:comment:kind:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMode_locale_recognizerOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMode:locale:recognizerOptions:");
}

id objc_msgSend_initWithRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecognizer:");
}

id objc_msgSend_initWithServerQueue_lowPriorityQueue_highPriorityQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerQueue:lowPriorityQueue:highPriorityQueue:");
}

id objc_msgSend_initWithServerQueue_lowPriorityQueue_highPriorityQueue_recognitionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerQueue:lowPriorityQueue:highPriorityQueue:recognitionHandler:");
}

id objc_msgSend_initWithString_drawing_options_requestType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:drawing:options:requestType:");
}

id objc_msgSend_initWithStyleInventory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyleInventory:");
}

id objc_msgSend_initWithStyleInventory_characterSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyleInventory:characterSet:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initializeDataStoreAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initializeDataStoreAtPath:");
}

id objc_msgSend_inputLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputLanguage");
}

id objc_msgSend_inputModeIdentifierIsValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputModeIdentifierIsValid:");
}

id objc_msgSend_inputRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputRegion");
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

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFastPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFastPath");
}

id objc_msgSend_isListening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isListening");
}

id objc_msgSend_isLocaleSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocaleSupported:");
}

id objc_msgSend_isMinimalDrawingResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMinimalDrawingResult");
}

id objc_msgSend_isPersonalizedSynthesisModelReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPersonalizedSynthesisModelReady");
}

id objc_msgSend_isScribbleActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScribbleActive");
}

id objc_msgSend_isSupportedLatinScriptLocale_withMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupportedLatinScriptLocale:withMode:");
}

id objc_msgSend_isValidRemoteRequest_bundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidRemoteRequest:bundleIdentifier:error:");
}

id objc_msgSend_lastActiveTimestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastActiveTimestamp");
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastIndex");
}

id objc_msgSend_lastSavedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSavedDate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lineWrappableGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineWrappableGroups");
}

id objc_msgSend_lineWrappingResultForGroups_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineWrappingResultForGroups:options:error:");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_liveTextSupportedByPrimaryLanguage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveTextSupportedByPrimaryLanguage");
}

id objc_msgSend_liveTextToggleEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveTextToggleEnabled");
}

id objc_msgSend_loadedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadedDate");
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_locales(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "locales");
}

id objc_msgSend_localesForScriptClassification_selectedScriptCodepoints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localesForScriptClassification:selectedScriptCodepoints:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_logModelInference_startTimestamp_endTimestamp_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logModelInference:startTimestamp:endTimestamp:data:");
}

id objc_msgSend_logModelLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logModelLoaded:");
}

id objc_msgSend_logModelUnloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logModelUnloaded:");
}

id objc_msgSend_lowPriorityQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowPriorityQueue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_matchedLanguagesFromAvailableLanguages_forPreferredLanguages_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:");
}

id objc_msgSend_mathRecognitionResultForDrawing_options_shouldCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mathRecognitionResultForDrawing:options:shouldCancel:");
}

id objc_msgSend_maxRecognitionResultCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxRecognitionResultCount");
}

id objc_msgSend_minimumDrawingSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumDrawingSize");
}

id objc_msgSend_minimumNumberOfSamplesWithStylePrediction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumNumberOfSamplesWithStylePrediction");
}

id objc_msgSend_modelWithModelName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelWithModelName:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_needsStylePredictionUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsStylePredictionUpdate");
}

id objc_msgSend_newContextForAnalyticsWithUserModel_language_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newContextForAnalyticsWithUserModel:language:");
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

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:inDomain:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetAllStrokeIndexesBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetAllStrokeIndexesBy:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_optimizeResourceUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimizeResourceUsage");
}

id objc_msgSend_optimizeResourceUsageWithTimeout_onQueue_idleCallbackBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optimizeResourceUsageWithTimeout:onQueue:idleCallbackBlock:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_pointCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointCount");
}

id objc_msgSend_precedingSeparatorForTopTranscriptionPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "precedingSeparatorForTopTranscriptionPath");
}

id objc_msgSend_predictedScriptsForDrawing_maxNumberOfLocales_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictedScriptsForDrawing:maxNumberOfLocales:");
}

id objc_msgSend_prependTokenColumns_prefixTopPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prependTokenColumns:prefixTopPath:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priority");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_queuedTimestampDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queuedTimestampDate");
}

id objc_msgSend_recognitionEngineCachingKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recognitionEngineCachingKey");
}

id objc_msgSend_recognitionMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recognitionMode");
}

id objc_msgSend_recognizerConfigurationKeyWithLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recognizerConfigurationKeyWithLocale:");
}

id objc_msgSend_refineDrawing_transcription_options_shouldCancel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refineDrawing:transcription:options:shouldCancel:error:");
}

id objc_msgSend_registerScheduledEventsActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerScheduledEventsActivity");
}

id objc_msgSend_remapAllStrokeIndexesWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remapAllStrokeIndexesWithArray:");
}

id objc_msgSend_removeIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeIndexes:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeSamplesContainingStrokeIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSamplesContainingStrokeIdentifiers:");
}

id objc_msgSend_removedStrokeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removedStrokeIdentifiers");
}

id objc_msgSend_replaceDrawing_originalTranscription_replacementTranscription_options_shouldCancel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceDrawing:originalTranscription:replacementTranscription:options:shouldCancel:error:");
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestType");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resultRestoringRawPathInResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resultRestoringRawPathInResult:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeConnectionIfIdle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeConnectionIfIdle");
}

id objc_msgSend_retrieveActivationMatrixForDrawing_recognitionEngineCachingKey_outStrokeIndexMapping_outStrokeEndings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveActivationMatrixForDrawing:recognitionEngineCachingKey:outStrokeIndexMapping:outStrokeEndings:");
}

id objc_msgSend_retrievePartialResultsForDrawing_recognitionEngineCachingKey_matchingColumnRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRange:");
}

id objc_msgSend_retrievePartialResultsForDrawing_recognitionEngineCachingKey_matchingColumnRangeToKeep_strokesToRecognize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePartialResultsForDrawing:recognitionEngineCachingKey:matchingColumnRangeToKeep:strokesToRecognize:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runPersonalizationWithBlock_resynthesizeAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runPersonalizationWithBlock:resynthesizeAll:");
}

id objc_msgSend_samplesWithoutStylePrediction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samplesWithoutStylePrediction");
}

id objc_msgSend_saveIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveIfNeeded");
}

id objc_msgSend_saveStyleInventoryIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveStyleInventoryIfNeeded");
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "score");
}

id objc_msgSend_scribbleEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scribbleEnabled");
}

id objc_msgSend_segmentContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segmentContents");
}

id objc_msgSend_segmentStrokeIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "segmentStrokeIndexes");
}

id objc_msgSend_serverQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverQueue");
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDelegate");
}

id objc_msgSend_sessionDidBegin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDidBegin");
}

id objc_msgSend_sessionDidEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionDidEnd");
}

id objc_msgSend_setActiveCharacterSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveCharacterSet:");
}

id objc_msgSend_setAutoCapitalizationMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoCapitalizationMode:");
}

id objc_msgSend_setAutoCorrectionMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoCorrectionMode:");
}

id objc_msgSend_setBaseWritingDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseWritingDirection:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setChangeableTokenColumnCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangeableTokenColumnCount:");
}

id objc_msgSend_setConfigurationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfigurationDelegate:");
}

id objc_msgSend_setContentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentType:");
}

id objc_msgSend_setContractViolations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContractViolations:");
}

id objc_msgSend_setCustomLexicon_customVocabulary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomLexicon:customVocabulary:");
}

id objc_msgSend_setCustomPhraseLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCustomPhraseLexicon:");
}

id objc_msgSend_setDeclaredVariables_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeclaredVariables:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDirty(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirty");
}

id objc_msgSend_setEnableCachingIfAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableCachingIfAvailable:");
}

id objc_msgSend_setEnableGen2CharacterLMIfAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableGen2CharacterLMIfAvailable:");
}

id objc_msgSend_setEnableGen2ModelIfAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableGen2ModelIfAvailable:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFingerDrawingEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFingerDrawingEnabled:");
}

id objc_msgSend_setIdle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdle");
}

id objc_msgSend_setLocales_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocales:");
}

id objc_msgSend_setMaxRecognitionResultCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxRecognitionResultCount:");
}

id objc_msgSend_setMinimumDrawingSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumDrawingSize:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setQueuedTimestampDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueuedTimestampDate:");
}

id objc_msgSend_setScribbleEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScribbleEnabled:");
}

id objc_msgSend_setStylePrediction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStylePrediction:");
}

id objc_msgSend_setSynthesizeCharacterInventoryBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSynthesizeCharacterInventoryBehavior:");
}

id objc_msgSend_setTextReplacements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextReplacements:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDefaults");
}

id objc_msgSend_sharedAnalyticsServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAnalyticsServer");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedRemoteRecognitionServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedRemoteRecognitionServer");
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSettings");
}

id objc_msgSend_sharedSettingsServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSettingsServer");
}

id objc_msgSend_shouldResetInventory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldResetInventory");
}

id objc_msgSend_shouldUseTextReplacements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUseTextReplacements");
}

id objc_msgSend_sketchRecognitionResultsForDrawing_options_shouldCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sketchRecognitionResultsForDrawing:options:shouldCancel:");
}

id objc_msgSend_skipStyleInventoryLookup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipStyleInventoryLookup");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedDrawingUsingStrokeMidPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedDrawingUsingStrokeMidPoint:");
}

id objc_msgSend_stageEvictionOfStyleInventoryWithTargetIdleLifetime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageEvictionOfStyleInventoryWithTargetIdleLifetime:");
}

id objc_msgSend_stageEvictionOfTextSynthesizerWithTargetIdleLifetime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stageEvictionOfTextSynthesizerWithTargetIdleLifetime:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_statusWithInventory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusWithInventory:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
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

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_strokeCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeCount");
}

id objc_msgSend_strokeIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeIdentifiers");
}

id objc_msgSend_strokeIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "strokeIndexes");
}

id objc_msgSend_styleContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleContent");
}

id objc_msgSend_styleDrawing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleDrawing");
}

id objc_msgSend_styleInventoryQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleInventoryQuery");
}

id objc_msgSend_stylePredictionResultForTranscription_drawing_shouldCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stylePredictionResultForTranscription:drawing:shouldCancel:");
}

id objc_msgSend_styleSampleForInputSample_prompt_samplingAlgorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleSampleForInputSample:prompt:samplingAlgorithm:");
}

id objc_msgSend_styleSampleOptionsForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleSampleOptionsForRequest:");
}

id objc_msgSend_styleSamplesForInputSample_prompt_samplingAlgorithm_maxNumOfSamples_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "styleSamplesForInputSample:prompt:samplingAlgorithm:maxNumOfSamples:");
}

id objc_msgSend_subResultWithColumnRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subResultWithColumnRange:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_supportedCharactersForPersonalizedSynthesis(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportedCharactersForPersonalizedSynthesis");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synthesisModelHash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesisModelHash");
}

id objc_msgSend_synthesisOptionsWithSynthesizeCharacterInventoryBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesisOptionsWithSynthesizeCharacterInventoryBehavior:");
}

id objc_msgSend_synthesizeCharacterInventoryBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesizeCharacterInventoryBehavior");
}

id objc_msgSend_synthesizeDrawingForString_options_shouldCancel_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synthesizeDrawingForString:options:shouldCancel:error:");
}

id objc_msgSend_targetIdleLifetime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetIdleLifetime");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_textRecognitionResultForDrawing_options_writingStatistics_shouldCancel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textRecognitionResultForDrawing:options:writingStatistics:shouldCancel:");
}

id objc_msgSend_textReplacements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textReplacements");
}

id objc_msgSend_throttledSaveStyleInventoryIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "throttledSaveStyleInventoryIfNeeded");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_tokenColumnCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenColumnCount");
}

id objc_msgSend_tokenColumns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenColumns");
}

id objc_msgSend_tokenizedResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tokenizedResult");
}

id objc_msgSend_topModelTranscription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModelTranscription");
}

id objc_msgSend_topTranscription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topTranscription");
}

id objc_msgSend_transcription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcription");
}

id objc_msgSend_transcriptionPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcriptionPaths");
}

id objc_msgSend_transcriptionPathsForTokenizedTextResult_recognitionRequest_withReply_bundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcriptionPathsForTokenizedTextResult:recognitionRequest:withReply:bundleIdentifier:");
}

id objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transcriptionWithPath:columnRange:filterLowConfidence:");
}

id objc_msgSend_transientLexicon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transientLexicon");
}

id objc_msgSend_transientPhraseLexicon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transientPhraseLexicon");
}

id objc_msgSend_unlikelyHasLatinContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlikelyHasLatinContents");
}

id objc_msgSend_updateAddressBookLexicon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAddressBookLexicon:");
}

id objc_msgSend_updateStyleEmbedding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStyleEmbedding:");
}

id objc_msgSend_updateStylePredictionsWithSamples_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStylePredictionsWithSamples:");
}

id objc_msgSend_updateSynthesisModelHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSynthesisModelHash:");
}

id objc_msgSend_userModelDataStorePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userModelDataStorePath");
}

id objc_msgSend_validateSegments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSegments");
}

id objc_msgSend_valuesFromContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valuesFromContext:");
}

id objc_msgSend_vocabulary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vocabulary");
}

id objc_msgSend_writingStatsForRequest_locale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writingStatsForRequest:locale:");
}
