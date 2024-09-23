NSString *sub_100003FD0(uint64_t a1, uint64_t a2)
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), a2, a1);
}

id sub_100004004(const __CFString *a1, void *a2, uint64_t a3)
{
  __CFString *v5;
  void *v6;
  id v7;
  const __CFArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@."), a3));
  v7 = objc_alloc_init((Class)NSMutableArray);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v13, "hasPrefix:", v6))
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

void sub_100004458(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void start()
{
  id v0;
  NSObject *v1;
  id v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  v0 = sub_10000DFC0();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: launched", buf, 2u);
  }

  xpc_activity_register("com.apple.perfdiagsselfenabled", XPC_ACTIVITY_CHECK_IN, &stru_1000183D8);
  v2 = sub_10000DFC0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: setup prefs", v5, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  objc_msgSend(v4, "setupPrefsWithQueue:", &_dispatch_main_q);

  dispatch_main();
}

void sub_100004558(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  if (!xpc_activity_get_state(v2))
  {
    v21 = sub_10000DFC0();
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10000EADC(v13, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_9;
  }
  if (xpc_activity_get_state(v2) == 2)
  {
    v3 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_10000EB3C(v4, v5, v6, v7, v8, v9, v10, v11);

    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1000183F8);
    v12 = sub_10000DFC0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_10000EB0C(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_9:

  }
}

void sub_10000461C(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  v1 = sub_10000DFC0();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "perfdiagsselfenabled: begin evaluateSelfEnablement", buf, 2u);
  }

  +[PerfDiagsSelfEnablementController evaluateSelfEnablement](PerfDiagsSelfEnablementController, "evaluateSelfEnablement");
  v3 = sub_10000DFC0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: finished evaluateSelfEnablement", v8, 2u);
  }

  v5 = sub_10000DFC0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: exit cleanly", v7, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100004718(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_100004D00(_QWORD *a1, char a2)
{
  _QWORD v3[7];
  char v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004D70;
  v3[3] = &unk_100018418;
  v4 = a2;
  v3[4] = a1[4];
  v3[5] = a1[5];
  v3[6] = a1[6];
  return AnalyticsSendEventLazy(CFSTR("com.apple.perfdiagsselfenable.badDayEnablement"), v3);
}

id sub_100004D70(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v9[0] = CFSTR("enable");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v10[0] = v2;
  v9[1] = CFSTR("last_enablement");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 32)));
  v10[1] = v3;
  v9[2] = CFSTR("log_count_threshold");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48)));
  v10[2] = v4;
  v9[3] = CFSTR("duration_threshold_ms");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40)));
  v10[3] = v5;
  v9[4] = CFSTR("minimum_break_days");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 52)));
  v10[4] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 5));

  return v7;
}

uint64_t sub_100004EC0(uint64_t a1, void *a2)
{
  id v3;
  float v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "durationSeconds");
  if (v4 >= *(float *)(a1 + 40))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "beginEvent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BundleIdOverride")));

    if (v7 && objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple.")))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  }
  return 1;
}

void sub_1000054EC(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[8];

  v3[0] = objc_opt_class(PDSEHangTracer);
  v3[1] = objc_opt_class(PDSEHangTracerBadDay);
  v3[2] = objc_opt_class(PDSEHangTracerThirdParty);
  v3[3] = objc_opt_class(PDSEWorkflowResponsiveness);
  v3[4] = objc_opt_class(PDSEHangTracerRateOnly);
  v3[5] = objc_opt_class(PDSESentry);
  v3[6] = objc_opt_class(PDSECATailspin);
  v3[7] = objc_opt_class(PDSEAppLaunch);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 8));
  v2 = (void *)qword_10001E518;
  qword_10001E518 = v1;

}

id sub_1000065B8(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("client");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

id sub_100006628(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("client");
  v3[1] = CFSTR("transitionType");
  v4[0] = v1;
  v4[1] = CFSTR("DisableToDisable");
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

id sub_1000066AC(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[3];

  v1 = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("client");
  v5[1] = CFSTR("transitionType");
  v6[0] = v1;
  v6[1] = CFSTR("DisableToEnable");
  v5[2] = CFSTR("success");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v6[2] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 3));

  return v3;
}

id sub_100006770(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v5[3];
  _QWORD v6[3];

  v1 = *(_QWORD *)(a1 + 32);
  v5[0] = CFSTR("client");
  v5[1] = CFSTR("transitionType");
  v6[0] = v1;
  v6[1] = CFSTR("EnableToDisable");
  v5[2] = CFSTR("success");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v6[2] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 3));

  return v3;
}

id sub_100006834(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 32);
  v3[0] = CFSTR("client");
  v3[1] = CFSTR("transitionType");
  v4[0] = v1;
  v4[1] = CFSTR("EnableToEnable");
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 2));
}

id sub_1000068B8(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  _QWORD v8[4];

  v8[0] = *(_QWORD *)(a1 + 32);
  v7[0] = CFSTR("client");
  v7[1] = CFSTR("enabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 40)));
  v8[1] = v1;
  v7[2] = CFSTR("hasMetricKitClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MXSourceUtilities anyClientsAvailable](MXSourceUtilities, "anyClientsAvailable")));
  v8[2] = v2;
  v7[3] = CFSTR("thirdPartyLogUploadEnabled");
  if (DiagnosticLogSubmissionEnabled())
    v3 = AppAnalyticsEnabled();
  else
    v3 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v8[3] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 4));

  return v5;
}

BOOL sub_100006FA0(void *a1, void *a2, float *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  float v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v19;
  rusage v20;
  rusage v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;

  v7 = a4;
  v8 = a2;
  v9 = a1;
  v10 = (void *)objc_opt_new(SignpostSupportObjectExtractor);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100007260;
  v22[3] = &unk_100018898;
  v11 = v7;
  v23 = v11;
  objc_msgSend(v10, "setIntervalCompletionProcessingBlock:", v22);
  v12 = (void *)objc_opt_new(SignpostSupportSubsystemCategoryAllowlist);
  objc_msgSend(v12, "addSubsystem:category:", CFSTR("com.apple.hangtracer"), CFSTR("always_on_hang"));
  objc_msgSend(v10, "setSubsystemCategoryFilter:", v12);
  memset(&v20, 0, sizeof(v20));
  memset(&v21, 0, sizeof(v21));
  getrusage(0, &v21);
  v19 = 0;
  objc_msgSend(v10, "processLogArchiveWithPath:startDate:endDate:errorOut:", 0, v9, v8, &v19);

  v13 = v19;
  getrusage(0, &v20);
  if (a3)
  {
    v14 = (float)((float)((float)v20.ru_stime.tv_usec / 1000000.0) + (float)v20.ru_stime.tv_sec)
        - (float)((float)((float)v21.ru_stime.tv_usec / 1000000.0) + (float)v21.ru_stime.tv_sec)
        + (float)((float)((float)v20.ru_utime.tv_usec / 1000000.0) + (float)v20.ru_utime.tv_sec)
        - (float)((float)((float)v21.ru_utime.tv_usec / 1000000.0) + (float)v21.ru_utime.tv_sec);
    *a3 = v14;
  }
  if (v13)
  {
    v15 = sub_10000DFC0();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      *(_DWORD *)buf = 136315394;
      v25 = "enumerateHangIntervalsInTimeRange";
      v26 = 2112;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s completed with error: %@\n", buf, 0x16u);

    }
  }

  return v13 == 0;
}

uint64_t sub_100007260(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000078A4()
{
  uint64_t v0;

  return v0;
}

void sub_1000080F4(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[12];

  v3[0] = CFSTR("HTProfile");
  v3[1] = CFSTR("HTEPL");
  v3[2] = CFSTR("HTThirdPartyDevSupport");
  v3[3] = CFSTR("PLTasking");
  v3[4] = &stru_1000189E8;
  v3[5] = CFSTR("PDSEHangTracer");
  v3[6] = CFSTR("PDSEHTBadDay");
  v3[7] = CFSTR("PDSEHTThirdParty");
  v3[8] = CFSTR("PDSEWorkflowResponsiveness");
  v3[9] = CFSTR("PDSEHTRateOnly");
  v3[10] = CFSTR("PDSESentry");
  v3[11] = CFSTR("PDSEAppLaunch");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 12));
  v2 = (void *)qword_10001E530;
  qword_10001E530 = v1;

}

void sub_100009EEC(id a1)
{
  HTPrefs *v1;
  void *v2;

  v1 = objc_alloc_init(HTPrefs);
  v2 = (void *)qword_10001E538;
  qword_10001E538 = (uint64_t)v1;

}

void sub_10000C078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;
  uint64_t v34;

  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

void sub_10000C0DC(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id *v10;
  id WeakRetained;
  unsigned int v12;
  id v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == a2)
  {
    v3 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) == a2)
  {
    v6 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == a2)
  {
    v7 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) == a2)
  {
    v8 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) != a2)
      goto LABEL_18;
    v9 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v5 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  v10 = (id *)(a1 + 80);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v12 = objc_msgSend(WeakRetained, "hangtracerDaemonEnabled");

  objc_msgSend(*(id *)(a1 + 32), "refreshHTPrefs");
  v13 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = objc_msgSend(v13, "hangtracerDaemonEnabled");

  if (v12 != (_DWORD)WeakRetained)
  {
    v14 = sub_10000DFC0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v12)
        v16 = CFSTR("ON");
      else
        v16 = CFSTR("OFF");
      v17 = objc_loadWeakRetained(v10);
      if (objc_msgSend(v17, "hangtracerDaemonEnabled"))
        v18 = CFSTR("ON");
      else
        v18 = CFSTR("OFF");
      *(_DWORD *)buf = 138412546;
      v27 = v16;
      v28 = 2112;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);

    }
    v19 = objc_loadWeakRetained(v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "hangtracerDaemonEnabled", CFSTR("Enabled"))));
    v25 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v23 = objc_loadWeakRetained(v10);
    objc_msgSend(v22, "postNotificationName:object:userInfo:", CFSTR("com.apple.hangtracer.daemonstate"), v23, v21);

  }
}

void sub_10000C42C(uint64_t a1, int a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == a2)
  {
    v2 = sub_10000DFC0();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v4, 2u);
    }

  }
}

void sub_10000CE90(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_10000CEC8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v2 = sub_10000DFC0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync(a1);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v6, 2u);
    }

    return 0;
  }
}

uint64_t sub_10000CF74(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  uint64_t v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v2 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("HTEPL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (unint64_t)objc_msgSend(v3, "count");

  v5 = sub_100004004(CFSTR("com.apple.da"), CFSTR("mobile"), (uint64_t)CFSTR("HTThirdPartyDevSupport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v4 | (unint64_t)objc_msgSend(v6, "count");

  v8 = sub_10000DFC0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are ACTIVE, do not attempt to configure tailspin", v14, 2u);
    }

    if (!v4)
      return 0;
    v11 = CFSTR("com.apple.pdse.NoConfigureTailspinDueToEPL");
LABEL_10:
    j__ADClientAddValueForScalarKey(v11, 1);
    return 0;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are NOT active, attempt to configure tailspin", buf, 2u);
  }

  v12 = 1;
  j__ADClientAddValueForScalarKey(CFSTR("com.apple.pdse.AttemptConfigureTailspin"), 1);
  if ((sub_10000CEC8(a1) & 1) == 0)
  {
    v11 = CFSTR("com.apple.pdse.FailConfigureTailspin");
    goto LABEL_10;
  }
  return v12;
}

id sub_10000D0E0()
{
  if (qword_10001E550 != -1)
    dispatch_once(&qword_10001E550, &stru_100018948);
  return (id)qword_10001E548;
}

void sub_10000D120(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", "hangtracer_enablement");
  v2 = (void *)qword_10001E548;
  qword_10001E548 = (uint64_t)v1;

}

uint64_t sub_10000D9A8(void *a1)
{
  id v1;
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v3 = objc_msgSend(v2, "enableLoggingForWidgetRenderer");

  if ((v3 & 1) != 0 || (objc_msgSend(v1, "containsString:", CFSTR("WidgetRenderer-Default")) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
    v6 = objc_msgSend(v5, "enableLoggingForPoster");

    if ((v6 & 1) != 0 || (objc_msgSend(v1, "containsString:", CFSTR("PosterBoard")) & 1) != 0)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      v7 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v1, 0);
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "extensionPointRecord"));
        v4 = v9;
        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

          LODWORD(v4) = (int)(v11 << 31) >> 31;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

id sub_10000DFC0()
{
  if (qword_10001E560 != -1)
    dispatch_once(&qword_10001E560, &stru_100018968);
  return (id)qword_10001E558;
}

void sub_10000E000(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", "");
  v2 = (void *)qword_10001E558;
  qword_10001E558 = (uint64_t)v1;

}

double sub_10000E528()
{
  if (qword_10001E570 != -1)
    dispatch_once(&qword_10001E570, &stru_100018988);
  return *(double *)&qword_10001E568;
}

void sub_10000E568(id a1)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_10001E568 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

BOOL sub_10000E5B4(int a1, int a2, int a3)
{
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  void *v15;
  double v16;
  int v17;
  int v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  unsigned int v25;
  uint8_t buf[4];
  __int128 v27;
  int v28;

  v6 = sub_10000DFC0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v27) = a1;
    WORD2(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 6) = a2;
    WORD5(v27) = 1024;
    HIDWORD(v27) = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: repeatPeriod = %i, enableDurationLengthInDays = %i, CRKeyOffset = %i", buf, 0x14u);
  }

  v8 = a1 / a2;
  v9 = (void *)MGCopyAnswer(CFSTR("InverseDeviceID"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", a3, 8));
  v25 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v10));
  objc_msgSend(v11, "scanHexInt:", &v25);

  v12 = v25 % v8;
  v13 = sub_10000DFC0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    LODWORD(v27) = v12;
    WORD2(v27) = 2112;
    *(_QWORD *)((char *)&v27 + 6) = v9;
    HIWORD(v27) = 1024;
    v28 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: targetEnableDurationNum based off crKey = %i (crKey string = %@ numerical = %u)", buf, 0x18u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = (int)(v16 / ((double)a2 * 86400.0));

  v18 = v17 % v8;
  v19 = sub_10000DFC0();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    sub_10000F7E4(v17 % v8, v17, v20);

  v21 = sub_10000DFC0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("Disable");
    *(_DWORD *)buf = 138412802;
    if (v12 == v18)
      v23 = CFSTR("Enable");
    *(_QWORD *)&v27 = v23;
    WORD4(v27) = 1024;
    *(_DWORD *)((char *)&v27 + 10) = v12;
    HIWORD(v27) = 1024;
    v28 = v18;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PDSE: determineTodayEnablement: Should %@ Today, since TargetEnableDurationNum = %i and TodayEnableDurationNum = %i", buf, 0x18u);
  }

  return v12 == v18;
}

uint64_t sub_10000E858(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  int v6;
  id v7;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSEHangTracer")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSESentry")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSECATailspin")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSEHTRateOnly")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSEHTThirdParty")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSEAppLaunch")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PDSEWorkflowResponsiveness")) & 1) != 0)
  {
    v2 = 6;
  }
  else
  {
    v3 = sub_10000DFC0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PDSE: getCRKeyOffsetForPrefix: Unknown prefix \"%@\"", (uint8_t *)&v6, 0xCu);
    }

    v2 = 10;
  }

  return v2;
}

void sub_10000E9E4(uint64_t a1, uint64_t a2)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_100003FD0(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004458((void *)&_mh_execute_header, v4, v5, "PDSE: Enable CA Tailspin collection: set setting %@ to TRUE", v6, v7, v8, v9, 2u);

  sub_10000446C();
}

void sub_10000EA60(uint64_t a1, uint64_t a2)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_100003FD0(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004458((void *)&_mh_execute_header, v4, v5, "PDSE: Enable CA Tailspin collection: Delete setting %@", v6, v7, v8, v9, 2u);

  sub_10000446C();
}

void sub_10000EADC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004718((void *)&_mh_execute_header, a1, a3, "perfdiagsselfenabled: XPC ACTIVITY CHECK-IN", a5, a6, a7, a8, 0);
  sub_100004728();
}

void sub_10000EB0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004718((void *)&_mh_execute_header, a1, a3, "perfdiagsselfenabled: exiting XPC ACTIVITY RUN", a5, a6, a7, a8, 0);
  sub_100004728();
}

void sub_10000EB3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004718((void *)&_mh_execute_header, a1, a3, "perfdiagsselfenabled: XPC ACTIVITY RUN", a5, a6, a7, a8, 0);
  sub_100004728();
}

void sub_10000EB6C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: bad day enablement is still valid", v1, 2u);
}

void sub_10000EBAC(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  NSString *v6;
  void *v7;
  int v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v6 = sub_100003FD0(a2, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = 138412290;
  v9 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "PDSE: Enable HangTracer: set setting %@ to TRUE", (uint8_t *)&v8, 0xCu);

}

void sub_10000EC64(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: PDSEHTThirdParty: determining enabling HT 3rd Party mode with these device settings: (enableForMetricKit=%{BOOL}d enableForLogUpload=%{BOOL}d", (uint8_t *)v3, 0xEu);
}

void sub_10000ECF0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable Third Party HangTracer: set setting %@ to 0", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000ED7C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable Third Party HangTracer: set setting %@ to FALSE", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000EE08()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable Third Party HangTracer: set setting %@ to TRUE", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000EE94()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable Third Party HangTracer: set setting %@ to 3600", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000EF20(uint64_t a1, uint64_t a2)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_100003FD0(a1, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100004458((void *)&_mh_execute_header, v4, v5, "PDSE: Enable App Launch Monitoring: setting %@ to TRUE", v6, v7, v8, v9, 2u);

  sub_10000446C();
}

void sub_10000EF9C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer Rate Only: set setting %@ to FALSE", v8, v9, v10, v11, 2u);

  sub_100007894();
}

void sub_10000F030(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer Rate Only: set setting %@ to 3600", v8, v9, v10, v11, 2u);

  sub_100007894();
}

void sub_10000F0C4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer Rate Only: set setting %@ to TRUE", v8, v9, v10, v11, 2u);

  sub_100007894();
}

void sub_10000F158(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_10000F1DC(uint64_t a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412802;
  *(_QWORD *)&v3[4] = CFSTR("enablementPrefix");
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_10000CE90((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *a2);
  sub_10000CEB4();
}

void sub_10000F260()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000CEA4();
  sub_10000CEBC();
  sub_10000CE90((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_10000CEB4();
}

void sub_10000F2F4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000CEA4();
  sub_10000CEBC();
  sub_10000CE90((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_10000CEB4();
}

void sub_10000F388()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000CEA4();
  sub_10000CEBC();
  sub_10000CE90((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_10000CEB4();
}

void sub_10000F41C()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000CEA4();
  sub_10000CEBC();
  sub_10000CE90((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
  sub_10000CEB4();
}

void sub_10000F4B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000F4F0()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000F518()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer: set setting %@ to TRUE", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000F5A4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer: set setting %@ to 0", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000F630()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  sub_1000078B4();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "prefixForDefaults"));
  v2 = sub_1000078A4();
  v4 = sub_100003FD0(v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_1000078C0();
  sub_100004458((void *)&_mh_execute_header, v6, v7, "PDSE: Enable HangTracer: set setting %@ to 3600", v8, v9, v10, v11, v12);

  sub_100007894();
}

void sub_10000F6BC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;

  v4 = sub_100003FD0(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "HTSTYE: Enable HTSTYE: set setting %@ to TRUE", (uint8_t *)&v6, 0xCu);

}

void sub_10000F750(uint64_t a1, uint64_t a2, NSObject *a3)
{
  NSString *v4;
  void *v5;
  int v6;
  void *v7;

  v4 = sub_100003FD0(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "HTWRE: Enable HTWRE: set setting %@ to TRUE", (uint8_t *)&v6, 0xCu);

}

void sub_10000F7E4(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: Today's EnableDurationNum Within Period = %i (total EnableDurationsSinceRef = %i)", (uint8_t *)v3, 0xEu);
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "__createInternalSettings");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addSubsystem_category_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubsystem:category:");
}

id objc_msgSend_anyClientsAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyClientsAvailable");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributes");
}

id objc_msgSend_badDayEnablementDurationDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDayEnablementDurationDays");
}

id objc_msgSend_badDayEnablementForHangDurationMSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDayEnablementForHangDurationMSec");
}

id objc_msgSend_badDayEnablementForLogCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDayEnablementForLogCount");
}

id objc_msgSend_badDayEnablementForPreviousDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDayEnablementForPreviousDays");
}

id objc_msgSend_badDayEnablementMinimumBreakDurationDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDayEnablementMinimumBreakDurationDays");
}

id objc_msgSend_badDaySecondsBetweenLastEnablementAndReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badDaySecondsBetweenLastEnablementAndReferenceDate");
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginEvent");
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLProperty:contextPrefixOut:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_clientClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientClasses");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_desiredTailspinConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredTailspinConfig");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDisableDiagnostics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDisableDiagnostics");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleProperty:contextPrefixOut:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationSeconds");
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlyInitNecessaryPrefs");
}

id objc_msgSend_enableLoggingForPoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableLoggingForPoster");
}

id objc_msgSend_enableLoggingForWidgetRenderer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableLoggingForWidgetRenderer");
}

id objc_msgSend_evaluateSelfEnablement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateSelfEnablement");
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extensionPointRecord");
}

id objc_msgSend_getKillSwitchSettingForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getKillSwitchSettingForPrefix:");
}

id objc_msgSend_getTimeoutForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getTimeoutForPrefix:");
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hangtracerDaemonEnabled");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasTimeoutExpiredForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTimeoutExpiredForPrefix:");
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hudEnabled");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intProperty:contextPrefixOut:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternal");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectProperty:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_pdseAllowEnableTailspin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseAllowEnableTailspin");
}

id objc_msgSend_pdseAppLaunchKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseAppLaunchKillSwitch");
}

id objc_msgSend_pdseAppLaunchPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseAppLaunchPeriodDays");
}

id objc_msgSend_pdseCATailspinKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseCATailspinKillSwitch");
}

id objc_msgSend_pdseCATailspinPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseCATailspinPeriodDays");
}

id objc_msgSend_pdseHTBadDayKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTBadDayKillSwitch");
}

id objc_msgSend_pdseHTPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTPeriodDays");
}

id objc_msgSend_pdseHTRateOnlyKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTRateOnlyKillSwitch");
}

id objc_msgSend_pdseHTRateOnlyPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTRateOnlyPeriodDays");
}

id objc_msgSend_pdseHTThirdPartyKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTThirdPartyKillSwitch");
}

id objc_msgSend_pdseHTThirdPartyNoLogUploadPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTThirdPartyNoLogUploadPeriodDays");
}

id objc_msgSend_pdseHTThirdPartyPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHTThirdPartyPeriodDays");
}

id objc_msgSend_pdseHangTracerKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseHangTracerKillSwitch");
}

id objc_msgSend_pdseSentryKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseSentryKillSwitch");
}

id objc_msgSend_pdseSentryPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseSentryPeriodDays");
}

id objc_msgSend_pdseWorkflowResponsivenessKillSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseWorkflowResponsivenessKillSwitch");
}

id objc_msgSend_pdseWorkflowResponsivenessPeriodDays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pdseWorkflowResponsivenessPeriodDays");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefContextPrefixPriorityOrder");
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefInitList");
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefNamed:domain:profile:matchingSelector:contextPrefixOut:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_prefixForDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefixForDefaults");
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processLogArchiveWithPath:startDate:endDate:errorOut:");
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshHTPrefs");
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanHexInt:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntervalCompletionProcessingBlock:");
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMemoryLoggingIntervalSec:");
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldPostHTPrefsChangedNotification:");
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubsystemCategoryFilter:");
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:");
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedPrefs");
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldPostHTPrefsChangedNotification");
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringProperty:contextPrefixOut:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeoutDurationSec(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutDurationSec");
}

id objc_msgSend_timeoutPrefNameForPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutPrefNameForPrefix:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongProperty:contextPrefixOut:");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_wantsEnablement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wantsEnablement");
}

id objc_msgSend_willEnableDiagnostics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willEnableDiagnostics");
}

id objc_msgSend_writeEnablementSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeEnablementSettings");
}
