void sub_100004A94(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("CmCl")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRPropertySupported:](CRFDRBaseDeviceHandler, "isFDRPropertySupported:", CFSTR("RCSn")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EA00;
    qword_10001EA00 = (uint64_t)v2;

  }
}

void sub_100004D0C(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("FSCl")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("MSRk")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EA10;
    qword_10001EA10 = (uint64_t)v2;

  }
}

void sub_100004FEC(uint64_t a1)
{
  id v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_10001EA20;
  qword_10001EA20 = (uint64_t)v2;

}

void sub_1000052D0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EA30;
  qword_10001EA30 = (uint64_t)v1;

}

void sub_1000055F0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EA40;
  qword_10001EA40 = (uint64_t)v1;

}

void sub_10000582C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EA50;
  qword_10001EA50 = (uint64_t)v1;

}

void sub_100005E04(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("tcrt")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("dCfg")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EA60;
    qword_10001EA60 = (uint64_t)v2;

  }
}

void sub_10000608C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EA70;
  qword_10001EA70 = (uint64_t)v1;

}

void sub_100006EF0(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_object_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;

  v3 = a2;
  if (xpc_activity_get_state(v3))
  {
    v4 = (xpc_object_t)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"));
    v28 = 0;
    v6 = objc_msgSend(v5, "copyPathForPersistentData:error:", 100, &v28);
    v7 = v28;

    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("datapath"));
      v11 = objc_msgSend(objc_alloc((Class)CRFDRSeal), "initForRegisterChangeWithParameters:", v4);
      if (!v11)
      {
        v18 = handleForCategory(1);
        v7 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10000FAC8(a1);
        goto LABEL_24;
      }
      v7 = v11;
      if (xpc_activity_should_defer(v3))
      {
        v12 = xpc_activity_set_state(v3, 3);
        v13 = handleForCategory(0);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        v10 = v14;
        if (v12)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
            v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Successfully deferred activity %@ to state: %lu"), v3, xpc_activity_get_state(v3));
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            *(_DWORD *)buf = 138412546;
            v30 = v15;
            v31 = 2112;
            v32 = v17;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

          }
        }
        else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          sub_10000FB7C(a1, v3);
        }
      }
      else
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
        v27 = 0;
        v20 = -[NSObject registerChangeForComponent:fdrError:](v7, "registerChangeForComponent:fdrError:", v19, &v27);
        v10 = v27;

        if (!v20)
        {
          v21 = handleForCategory(0);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] register change was successful"), "-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke"));
            *(_DWORD *)buf = 138412546;
            v30 = v23;
            v31 = 2112;
            v32 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

          }
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentHasNotifiedServerKey"));
          objc_msgSend(v25, "setBool:forKey:", 1, v26);

          objc_msgSend(v25, "synchronize");
        }
        xpc_activity_set_state(v3, 5);
      }
    }
    else
    {
      v9 = handleForCategory(1);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10000FA14(a1);
    }

LABEL_24:
    goto LABEL_25;
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v4, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_BOOL(v4, XPC_ACTIVITY_NETWORK_TRANSFER_DIRECTION_DOWNLOAD, 1);
  xpc_activity_set_criteria(v3, v4);
LABEL_25:

}

void sub_100008290(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  void *v4;
  void *v5;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    objc_msgSend(v4, "unlockCheckerActivityBodyForFinishRepair");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createCriteriaForUnlockCheckerWithInterval:", *(double *)(a1 + 40)));
    xpc_activity_set_criteria(activity, v5);

  }
}

void sub_1000082F8(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  void *v4;
  void *v5;
  _xpc_activity_s *activity;

  activity = a2;
  state = xpc_activity_get_state(activity);
  v4 = *(void **)(a1 + 32);
  if (state)
  {
    objc_msgSend(v4, "unlockCheckerActivityBody");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createCriteriaForUnlockCheckerWithInterval:", *(double *)(a1 + 40)));
    xpc_activity_set_criteria(activity, v5);

  }
}

void sub_100008A88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009058(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000090AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v2) = -1;
  do
  {
    v2 = (v2 + 1);
    v3 = handleForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] Retry Count:%d"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke", v2));
      *(_DWORD *)buf = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    sleep(0xAu);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentAuthHandler"));
    v8 = objc_msgSend(v7, "copyComponentStatus");

  }
  while (!v8 && v2 < 9);
  if (v2 <= 8 && v8 == (id)1)
  {
    v9 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] cleaning up corefollowup finally"), "-[MRBaseComponentHandler checkInAndHandleAuthStatus]_block_invoke"));
      *(_DWORD *)buf = 138412546;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "clearRepairFollowUp");
    objc_msgSend(WeakRetained, "sendAnalyticsForCount:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(WeakRetained, "clearNSUserDefaults");
  }

}

id sub_10000953C(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _QWORD v28[6];
  _QWORD v29[6];

  v28[0] = CFSTR("EventType");
  v2 = *(void **)(a1 + 32);
  v3 = v2;
  if (!v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v29[0] = v3;
  v28[1] = CFSTR("isSUCase");
  v4 = objc_msgSend(*(id *)(a1 + 40), "isSUCaseForComponent");
  v5 = &__kCFBooleanFalse;
  if (v4)
    v5 = &__kCFBooleanTrue;
  v29[1] = v5;
  v28[2] = CFSTR("ModuleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentName"));
  v29[2] = v6;
  v28[3] = CFSTR("AuthStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentAuthHandler"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v7, "copyComponentStatus")));
  v29[3] = v8;
  v28[4] = CFSTR("UICoreFollowUpShownDuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 48)));
  v29[4] = v9;
  v28[5] = CFSTR("UILockscreenNotification");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 56)));
  v29[5] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 6));

  if (!v2)
  v12 = handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] send event: %@"), "-[MRBaseComponentHandler sendAnalyticsForCount:]_block_invoke", v11));
    *(_DWORD *)buf = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);

  }
  v16 = handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "componentName"));
    v20 = *(void **)(a1 + 32);
    v21 = v20;
    if (!v20)
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CoreAnalyticsEvent: ModuleType(%@), EventType(%@)"), v19, v21));
    *(_DWORD *)buf = 138412546;
    v25 = v18;
    v26 = 2112;
    v27 = v22;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[%@][%@]", buf, 0x16u);
    if (!v20)

  }
  return v11;
}

void sub_10000A368(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0x16u);
}

void sub_10000A37C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_10000A3A8(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void sub_10000A3C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A520(uint64_t a1)
{
  id v2;
  void *v3;

  if (+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("NBCl")))
  {
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EA80;
    qword_10001EA80 = (uint64_t)v2;

  }
}

void sub_10000A6F0(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("bCfg")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("LCfg")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EA90;
    qword_10001EA90 = (uint64_t)v2;

  }
}

void sub_10000A9A4(id a1)
{
  id v1;
  void *v2;

  v1 = -[MRComponentHealthHandler _init]([MRComponentHealthHandler alloc], "_init");
  v2 = (void *)qword_10001EAA0;
  qword_10001EAA0 = (uint64_t)v1;

}

id sub_10000AE68(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v14[0] = CFSTR("EventType");
  v14[1] = CFSTR("ModuleType");
  v2 = *(_QWORD *)(a1 + 32);
  v15[0] = CFSTR("DailyFailure");
  v15[1] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[MRComponentHealthHandler sendDailyAnalyticsForModuleType:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%s] send event: %@", (uint8_t *)&v10, 0x16u);
  }

  v6 = handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(const char **)(a1 + 32);
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CoreAnalyticsEvent: ModuleType(%@), Event(%@)", (uint8_t *)&v10, 0x16u);
  }

  return v3;
}

void sub_10000B218(uint64_t a1)
{
  id v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_10001EAB0;
  qword_10001EAB0 = (uint64_t)v2;

}

void sub_10000B4D4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EAC0;
  qword_10001EAC0 = (uint64_t)v1;

}

void sub_10000BAD4(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("bcrt")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("vcrt")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EAD0;
    qword_10001EAD0 = (uint64_t)v2;

  }
}

void sub_10000BCF0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_10001EAE8;
  qword_10001EAE8 = (uint64_t)v1;

}

void sub_10000BE40(uint64_t a1)
{
  id v2;
  MRLocalization *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v27 = objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  v2 = objc_alloc_init((Class)NSMutableArray);
  v3 = objc_opt_new(MRLocalization);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FLFollowUpAction actionWithLabel:url:](FLFollowUpAction, "actionWithLabel:url:", v4, *(_QWORD *)(a1 + 32)));

  objc_msgSend(v2, "addObject:", v5);
  v6 = objc_alloc_init((Class)FLFollowUpNotification);
  v7 = v6;
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(v6, "setFrequency:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40)));
    objc_msgSend(v7, "setTitle:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48)));
    objc_msgSend(v7, "setInformativeText:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE")));
    objc_msgSend(v7, "setUnlockActionLabel:", v10);

    objc_msgSend(v7, "setFirstNotificationDelay:", 0.0);
    objc_msgSend(v7, "setActivateAction:", v5);
    objc_msgSend(v7, "setClearAction:", 0);
    v31 = FLNotificationOptionLockscreen;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
    objc_msgSend(v7, "setOptions:", v12);

  }
  v13 = objc_alloc_init((Class)FLFollowUpItem);
  objc_msgSend(v13, "setUniqueIdentifier:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v13, "setGroupIdentifier:", FLGroupIdentifierDevice);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40)));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64)));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15));
  objc_msgSend(v13, "setTitle:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 48)));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v3, "localizedStringWithKey:defaultString:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 64)));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v18));
  objc_msgSend(v13, "setInformativeText:", v19);

  objc_msgSend(v13, "setDisplayStyle:", 2);
  objc_msgSend(v13, "setActions:", v2);
  if (*(_BYTE *)(a1 + 80))
    v20 = v7;
  else
    v20 = 0;
  objc_msgSend(v13, "setNotification:", v20);
  objc_msgSend(v13, "setTargetBundleIdentifier:", FLFollowUpPreferencesBundleIdentifier);
  notify_post("com.apple.mobilerepairui.reload");
  v21 = handleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Posting item: %@", buf, 0xCu);
  }

  v28 = 0;
  v23 = objc_msgSend(v27, "postFollowUpItem:error:", v13, &v28);
  v24 = v28;
  if ((v23 & 1) == 0)
  {
    v25 = handleForCategory(1);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_10000FDA0(v24);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 72) + 16), "setObject:forKeyedSubscript:", v13, *(_QWORD *)(a1 + 56));

}

void sub_10000C538(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C564(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  MRLocalization *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const __CFDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __CFUserNotification *v24;
  __CFUserNotification *v25;
  uint64_t v26;
  const __CFDictionary *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unsigned __int8 v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  MRLocalization *v42;
  uint64_t v43;
  id v44;
  SInt32 error;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  uint64_t v48;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("settingsView"));

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v48) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, " value is:%d", buf, 8u);
  }

  if (v3 && !*(_BYTE *)(a1 + 64))
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    responseFlags = 0;
    error = 0;
    v6 = objc_opt_new(MRLocalization);
    v43 = a1;
    v8 = *(_QWORD *)(a1 + 40);
    v7 = a1 + 40;
    v9 = *(unsigned __int8 *)(v7 + 24);
    v41 = objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v6, "localizedStringWithKey:defaultString:", v8, v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v6, "localizedStringWithKey:defaultString:", *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@\n"), v10));
    v42 = v6;
    if (v9)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v6, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v14 = SBUserNotificationDismissOnLock;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v16 = SBUserNotificationDontDismissOnUnlock;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v39 = v14;
      v18 = (void *)v41;
      v19 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v41, kCFUserNotificationAlertHeaderKey, v11, kCFUserNotificationAlertMessageKey, v12, kCFUserNotificationDefaultButtonTitleKey, v13, v39, v15, v16, v17, SBUserNotificationBehavesSuperModally, &off_10001AD38, SBUserNotificationSystemSoundIDKey, 0));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v6, "localizedStringWithKey:defaultString:", CFSTR("OK"), CFSTR("OK")));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v6, "localizedStringWithKey:defaultString:", CFSTR("SETTINGS"), CFSTR("SETTINGS")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
      v20 = SBUserNotificationDismissOnLock;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v21 = SBUserNotificationDontDismissOnUnlock;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
      v40 = v20;
      v18 = (void *)v41;
      v23 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v41, kCFUserNotificationAlertHeaderKey, v11, kCFUserNotificationAlertMessageKey, v12, kCFUserNotificationDefaultButtonTitleKey, v13, kCFUserNotificationAlternateButtonTitleKey, v15, v40, v17, v21, v22, SBUserNotificationBehavesSuperModally, &off_10001AD38, SBUserNotificationSystemSoundIDKey,
                0));

      v19 = (const __CFDictionary *)v23;
    }

    v24 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, &error, v19);
    if (v24)
    {
      v25 = v24;
      CFUserNotificationReceiveResponse(v24, 0.0, &responseFlags);
      v26 = v43;
      if (responseFlags == 1)
      {
        v27 = v19;
        v28 = handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = *(_QWORD *)v7;
          *(_DWORD *)buf = 138412290;
          v48 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%@ User pressed button", buf, 0xCu);
        }

        v31 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
        v32 = *(_QWORD *)(v43 + 56);
        v44 = 0;
        v33 = objc_msgSend(v31, "openSensitiveURL:withOptions:error:", v32, 0, &v44);
        v34 = v44;

        v19 = v27;
        if ((v33 & 1) == 0)
        {
          v35 = handleForCategory(1);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            sub_10000FEA8((uint64_t *)(v43 + 56), v34, v36);

        }
      }
      CFRelease(v25);
    }
    else
    {
      v37 = handleForCategory(1);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      v26 = v43;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        sub_10000FE1C((uint64_t *)v7, &error, v38);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v26 + 32));

  }
}

void sub_10000CC08(id a1)
{
  id v1;
  _QWORD v2[4];
  id v3;

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000CC8C;
  v2[3] = &unk_1000187E8;
  v3 = objc_msgSend(objc_alloc((Class)FLFollowUpController), "initWithClientIdentifier:", CFSTR("com.apple.mobilerepair"));
  v1 = v3;
  objc_msgSend(v1, "pendingFollowUpItemsWithCompletion:", v2);

}

void sub_10000CC8C(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  _UNKNOWN **v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  __objc2_class **v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  unsigned int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  id v46;
  MRLocalization *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  unsigned __int8 v64;
  MRLocalization *v65;
  void *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  id v72;
  id obj;
  void *v75;
  void *v76;
  MRLocalization *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  char v89[16];
  char v90[16];
  uint8_t buf[4];
  id v92;
  _BYTE v93[128];

  v4 = a2;
  v82 = a3;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
  if (v5)
  {
    v6 = v5;
    v7 = &AnalyticsSendEventLazy_ptr;
    v81 = *(_QWORD *)v86;
    v80 = FLGroupIdentifierDevice;
    v71 = FLFollowUpPreferencesBundleIdentifier;
    do
    {
      v8 = 0;
      v72 = v6;
      do
      {
        if (*(_QWORD *)v86 != v81)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v8);
        v10 = objc_alloc_init((Class)v7[42]);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        objc_msgSend(v10, "setUniqueIdentifier:", v11);

        objc_msgSend(v10, "setGroupIdentifier:", v80);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v13 = objc_msgSend(CFSTR("com.apple.mobilerepair.DisplayRepair"), "isEqualToString:", v12);

        v14 = off_100018198;
        if ((v13 & 1) != 0)
          goto LABEL_18;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v16 = objc_msgSend(CFSTR("com.apple.mobilerepair.BatteryRepair"), "isEqualToString:", v15);

        v14 = off_100018180;
        if ((v16 & 1) != 0)
          goto LABEL_18;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v18 = objc_msgSend(CFSTR("com.apple.mobilerepair.CameraRepair"), "isEqualToString:", v17);

        v14 = off_100018190;
        if ((v18 & 1) != 0)
          goto LABEL_18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v20 = objc_msgSend(CFSTR("com.apple.mobilerepair.BluetoothRepair"), "isEqualToString:", v19);

        v14 = off_100018188;
        if ((v20 & 1) != 0)
          goto LABEL_18;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v22 = objc_msgSend(CFSTR("com.apple.mobilerepair.WifiRepair"), "isEqualToString:", v21);

        v14 = &off_1000181C8;
        if ((v22 & 1) != 0)
          goto LABEL_18;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v24 = objc_msgSend(CFSTR("com.apple.mobilerepair.BasebandRepair"), "isEqualToString:", v23);

        v14 = off_100018178;
        if ((v24 & 1) != 0)
          goto LABEL_18;
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v26 = objc_msgSend(CFSTR("com.apple.mobilerepair.BasebandRepair"), "isEqualToString:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_18;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v28 = objc_msgSend(CFSTR("com.apple.mobilerepair.NFCRepair"), "isEqualToString:", v27);

        v14 = off_1000181A8;
        if ((v28 & 1) != 0)
          goto LABEL_18;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v30 = objc_msgSend(CFSTR("com.apple.mobilerepair.UWBRepair"), "isEqualToString:", v29);

        v14 = off_1000181C0;
        if ((v30 & 1) != 0)
          goto LABEL_18;
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v32 = objc_msgSend(CFSTR("com.apple.mobilerepair.AudioRepair"), "isEqualToString:", v31);

        v14 = off_100018170;
        if ((v32 & 1) != 0)
          goto LABEL_18;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
        v34 = objc_msgSend(CFSTR("com.apple.mobilerepair.FaceIDRepair"), "isEqualToString:", v33);

        v14 = off_1000181A0;
        if ((v34 & 1) != 0
          || (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier")),
              v36 = objc_msgSend(CFSTR("com.apple.mobilerepair.TouchIDRepair"), "isEqualToString:", v35),
              v35,
              v14 = off_1000181B8,
              v36))
        {
LABEL_18:
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedSingleton](*v14, "sharedSingleton"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "popUpNotificationTitle"));

          v39 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedSingleton](*v14, "sharedSingleton"));
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "followUpInfoMessage"));

        }
        else
        {
          v40 = 0;
          v38 = 0;
        }
        v41 = handleForCategory(0);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v38;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Title key :%@", buf, 0xCu);
        }

        v43 = handleForCategory(0);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v92 = v40;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "infotext key:%@", buf, 0xCu);
        }

        if (v38 && v40)
        {
          v78 = v8;
          v45 = v9;
          v75 = v9;
          v46 = objc_alloc_init((Class)NSMutableArray);
          v47 = objc_opt_new(MRLocalization);
          v48 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v47, "localizedStringWithKey:defaultString:", CFSTR("LEARN_MORE"), CFSTR("LEARN_MORE")));
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "actions"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "firstObject"));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "url"));
          v52 = objc_claimAutoreleasedReturnValue(+[FLFollowUpAction actionWithLabel:url:](FLFollowUpAction, "actionWithLabel:url:", v48, v51));

          v76 = (void *)v52;
          objc_msgSend(v46, "addObject:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v47, "localizedStringWithKey:defaultString:", v38, v38));
          objc_msgSend(v10, "setTitle:", v53);

          v77 = v47;
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[MRLocalization localizedStringWithKey:defaultString:](v47, "localizedStringWithKey:defaultString:", v40, v40));
          objc_msgSend(v10, "setInformativeText:", v54);

          objc_msgSend(v10, "setDisplayStyle:", 2);
          v79 = v46;
          objc_msgSend(v10, "setActions:", v46);
          objc_msgSend(v10, "setTargetBundleIdentifier:", v71);
          v55 = *(void **)(a1 + 32);
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "uniqueIdentifier"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v56, 0));
          v84 = v82;
          LOBYTE(v55) = objc_msgSend(v55, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:", v57, &v84);
          v58 = v84;

          if ((v55 & 1) != 0)
          {
            v59 = handleForCategory(0);
            v60 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "Successfully deleted the followup", buf, 2u);
            }

            v61 = handleForCategory(0);
            v62 = objc_claimAutoreleasedReturnValue(v61);
            v8 = v78;
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v92 = v10;
              _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Re Posting item: %@", buf, 0xCu);
            }

            v63 = *(void **)(a1 + 32);
            v83 = v58;
            v64 = objc_msgSend(v63, "postFollowUpItem:error:", v10, &v83);
            v82 = v83;

            v65 = v77;
            if ((v64 & 1) != 0)
            {
              v6 = v72;
              v7 = &AnalyticsSendEventLazy_ptr;
              v66 = v79;
LABEL_39:

              goto LABEL_40;
            }
            v69 = handleForCategory(1);
            v68 = objc_claimAutoreleasedReturnValue(v69);
            v6 = v72;
            v7 = &AnalyticsSendEventLazy_ptr;
            v58 = v82;
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              sub_100010050((uint64_t)v89, (uint64_t)v82);
            v66 = v79;
          }
          else
          {
            v67 = handleForCategory(1);
            v68 = objc_claimAutoreleasedReturnValue(v67);
            if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              sub_1000100A0((uint64_t)v90, (uint64_t)v58);
            v6 = v72;
            v7 = &AnalyticsSendEventLazy_ptr;
            v66 = v79;
            v65 = v47;
            v8 = v78;
          }

          v82 = v58;
          goto LABEL_39;
        }
LABEL_40:

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
      v6 = v70;
    }
    while (v70);
  }

}

void sub_10000D4D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000D4F4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_10000D514(uint64_t a1, uint64_t a2)
{
  return a2;
}

id sub_10000DC34(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "checkInAndHandleAuthStatus");
}

uint64_t start()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t state;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  ServiceDelegate *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  _QWORD v43[5];
  _QWORD v44[5];
  _QWORD handler[5];
  uint64_t state64;
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  _UNKNOWN **v52;
  uint8_t v53[4];
  uint64_t v54;

  v0 = objc_autoreleasePoolPush();
  v1 = handleForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "mobilerepaird started", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v48 = buf;
  v49 = 0x3032000000;
  v50 = sub_10000E418;
  v51 = sub_10000E428;
  v52 = &off_10001AD50;
  state64 = 0;
  v3 = notify_register_check("com.apple.system.console_mode_changed", &dword_10001E998);
  if ((_DWORD)v3)
  {
    v4 = handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100010190(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    state = notify_get_state(dword_10001E998, &state64);
    if (!(_DWORD)state)
      goto LABEL_10;
    v13 = handleForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10001012C(state, v5, v14, v15, v16, v17, v18, v19);
  }

LABEL_10:
  v20 = handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v53 = 134217984;
    v54 = state64;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Game mode at launch:%llu", v53, 0xCu);
  }

  v22 = *((id *)v48 + 5);
  objc_sync_enter(v22);
  v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", state64));
  v24 = (void *)*((_QWORD *)v48 + 5);
  *((_QWORD *)v48 + 5) = v23;

  objc_sync_exit(v22);
  v25 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000E430;
  handler[3] = &unk_100018838;
  handler[4] = buf;
  notify_register_dispatch("com.apple.system.console_mode_changed", &dword_10001E99C, (dispatch_queue_t)&_dispatch_main_q, handler);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000E58C;
  v44[3] = &unk_100018860;
  v44[4] = buf;
  xpc_activity_register("com.apple.mobilerepaird.post_install", XPC_ACTIVITY_CHECK_IN, v44);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10000E82C;
  v43[3] = &unk_100018860;
  v43[4] = buf;
  xpc_activity_register("com.apple.mobilerepaird.daily_stats", XPC_ACTIVITY_CHECK_IN, v43);
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188A0);

  xpc_set_event_stream_handler("com.apple.fsevents.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188C0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000188E0);

  v26 = objc_opt_new(ServiceDelegate);
  v27 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.mobilerepaird"));
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "setDelegate:", v26);
    objc_msgSend(v28, "resume");
    v30 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), v29);
    if ((v30 & 1) == 0)
    {
      v32 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair.intentControl"), 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairBootIntentProtocol));
      objc_msgSend(v32, "setRemoteObjectInterface:", v33);

      objc_msgSend(v32, "resume");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "remoteObjectProxyWithErrorHandler:", &stru_100018920));
      objc_msgSend(v34, "clearBootIntent:", &stru_100018960);

      v35 = objc_msgSend(objc_alloc((Class)NSXPCConnection), "initWithMachServiceName:options:", CFSTR("com.apple.corerepair.intentControl"), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___CoreRepairBootIntentProtocol));
      objc_msgSend(v35, "setRemoteObjectInterface:", v36);

      objc_msgSend(v35, "resume");
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "remoteObjectProxyWithErrorHandler:", &stru_100018980));
      objc_msgSend(v37, "clearRepairBackup:", &stru_1000189A0);

    }
    sub_10000EB34(v30, v31);
    v38 = 0;
  }
  else
  {
    v39 = handleForCategory(1);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_1000100F0(v40);

    v38 = 0xFFFFFFFFLL;
  }
  _Block_object_dispose(buf, 8);

  objc_autoreleasePoolPop(v0);
  if (v28)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v41, "run");

    v38 = 0;
  }

  return v38;
}

void sub_10000E3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E418(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000E428(uint64_t a1)
{

}

void sub_10000E430(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t state64;
  uint8_t buf[4];
  uint64_t v13;

  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GAME MODE notification", buf, 2u);
  }

  state64 = 0;
  if (!notify_get_state(a2, &state64))
  {
    v6 = handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = state64;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GAME MODE get state:%llu", buf, 0xCu);
    }

    if (state64 == 1)
    {
      v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v8);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = &off_10001AD68;

      objc_sync_exit(v8);
    }
  }
}

void sub_10000E58C(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  xpc_activity_state_t state;
  id v15;
  int v16;
  _xpc_activity_s *v17;
  __int16 v18;
  xpc_activity_state_t v19;

  v3 = a2;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received xpc post install", (uint8_t *)&v16, 2u);
  }

  if (xpc_activity_get_state(v3) == 2)
  {
    v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v6);
    v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_sync_exit(v6);

    if (!xpc_activity_should_defer(v3)
      && (objc_msgSend(v7, "isEqualToNumber:", &__kCFBooleanTrue) & 1) == 0)
    {
      +[MRBatteryComponentHandler handleSUCase](MRBatteryComponentHandler, "handleSUCase");
      v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_sync_enter(v8);
      v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

      objc_sync_exit(v8);
      if (xpc_activity_should_defer(v3)
        || (objc_msgSend(v9, "isEqualToNumber:", &__kCFBooleanTrue) & 1) != 0)
      {
        v7 = v9;
      }
      else
      {
        +[MRDisplayComponentHandler handleSUCase](MRDisplayComponentHandler, "handleSUCase");
        v15 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_sync_enter(v15);
        v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);

        objc_sync_exit(v15);
        if (!xpc_activity_should_defer(v3)
          && (objc_msgSend(v7, "isEqualToNumber:", &__kCFBooleanTrue) & 1) == 0)
        {
          +[MRCameraComponentHandler handleSUCase](MRCameraComponentHandler, "handleSUCase");
LABEL_15:

          goto LABEL_16;
        }
      }
    }
    v10 = xpc_activity_set_state(v3, 3);
    v11 = handleForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        state = xpc_activity_get_state(v3);
        v16 = 138412546;
        v17 = v3;
        v18 = 2048;
        v19 = state;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Successfully deferred activity %@ to state: %lu", (uint8_t *)&v16, 0x16u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      sub_1000101F4(v3);
    }

    goto LABEL_15;
  }
LABEL_16:

}

void sub_10000E82C(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  xpc_activity_state_t state;
  int v13;
  _xpc_activity_s *v14;
  __int16 v15;
  xpc_activity_state_t v16;

  v3 = a2;
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received daily stats activity", (uint8_t *)&v13, 2u);
  }

  if (xpc_activity_get_state(v3) == 2)
  {
    v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_sync_enter(v6);
    v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_sync_exit(v6);

    if (xpc_activity_should_defer(v3)
      || (objc_msgSend(v7, "isEqualToNumber:", &__kCFBooleanTrue) & 1) != 0)
    {
      v8 = xpc_activity_set_state(v3, 3);
      v9 = handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          state = xpc_activity_get_state(v3);
          v13 = 138412546;
          v14 = v3;
          v15 = 2048;
          v16 = state;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Successfully deferred activity %@ to state: %lu", (uint8_t *)&v13, 0x16u);
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_1000101F4(v3);
      }
    }
    else
    {
      v11 = objc_claimAutoreleasedReturnValue(+[MRComponentHealthHandler sharedInstance](MRComponentHealthHandler, "sharedInstance"));
      -[NSObject sendFailedComponentStats](v11, "sendFailedComponentStats");
    }

  }
}

void sub_10000E9F8(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  uint64_t v3;
  NSObject *v4;
  NSString *v5;
  OS_xpc_object *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  OS_xpc_object *v12;

  v2 = a2;
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received IOKit matching event:%@", (uint8_t *)&v11, 0xCu);
  }

  v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v2, _xpc_event_key_name));
  v6 = (OS_xpc_object *)objc_claimAutoreleasedReturnValue(v5);
  v7 = handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "XPC Event: %@ (iokit)", (uint8_t *)&v11, 0xCu);
  }

  sub_10000EB34(v9, v10);
}

void sub_10000EB34(uint64_t a1, uint64_t a2)
{
  int v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
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
  _DWORD v19[2];
  __int16 v20;
  unsigned int v21;

  v2 = MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), a2);
  v3 = (void *)MGCopyAnswer(CFSTR("DeviceClassNumber"), 0);
  v4 = objc_msgSend(v3, "intValue");

  if ((v2 & 1) == 0 && v4 == 3)
  {
    v5 = handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Enabling Parts and Service History for supported iPads", (uint8_t *)v19, 2u);
    }

    goto LABEL_12;
  }
  if (v4 == 1)
    v7 = v2;
  else
    v7 = 1;
  if (v7 != 1)
  {
LABEL_12:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MRBatteryComponentHandler sharedSingleton](MRBatteryComponentHandler, "sharedSingleton"));
    objc_msgSend(v10, "checkInAndHandleAuthStatus");

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MRDisplayComponentHandler sharedSingleton](MRDisplayComponentHandler, "sharedSingleton"));
    objc_msgSend(v11, "checkInAndHandleAuthStatus");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MRCameraComponentHandler sharedSingleton](MRCameraComponentHandler, "sharedSingleton"));
    objc_msgSend(v12, "checkInAndHandleAuthStatus");

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MRFaceIDComponentHandler sharedSingleton](MRFaceIDComponentHandler, "sharedSingleton"));
    objc_msgSend(v13, "checkInAndHandleAuthStatus");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MRTouchIDComponentHandler sharedSingleton](MRTouchIDComponentHandler, "sharedSingleton"));
    objc_msgSend(v14, "checkInAndHandleAuthStatus");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRBackGlassComponentHandler sharedSingleton](MRBackGlassComponentHandler, "sharedSingleton"));
    objc_msgSend(v15, "checkInAndHandleAuthStatus");

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MREnclosureComponentHandler sharedSingleton](MREnclosureComponentHandler, "sharedSingleton"));
    objc_msgSend(v16, "checkInAndHandleAuthStatus");

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MRRCamComponentHandler sharedSingleton](MRRCamComponentHandler, "sharedSingleton"));
    objc_msgSend(v17, "checkInAndHandleAuthStatus");

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MRAudioComponentHandler sharedSingleton](MRAudioComponentHandler, "sharedSingleton"));
    objc_msgSend(v18, "checkInAndHandleAuthStatus");

    v9 = objc_claimAutoreleasedReturnValue(+[MRAudioCodecComponentHandler sharedSingleton](MRAudioCodecComponentHandler, "sharedSingleton"));
    -[NSObject checkInAndHandleAuthStatus](v9, "checkInAndHandleAuthStatus");
    goto LABEL_13;
  }
  v8 = handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109376;
    v19[1] = v2;
    v20 = 1024;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "exiting Diagnostics mode:%d::deviceClass:%d", (uint8_t *)v19, 0xEu);
  }
LABEL_13:

}

void sub_10000ED98(id a1, OS_xpc_object *a2)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "received a com.apple.fsevents.matching notification", v4, 2u);
  }

}

void sub_10000EE00(id a1, OS_xpc_object *a2)
{
  NSString *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;

  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(a2, _xpc_event_key_name));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received:%@", (uint8_t *)&v13, 0xCu);
  }

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AppleLanguagePreferencesChangedNotification")))
  {
    v6 = handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received a AppleLanguagePreferencesChangedNotification", (uint8_t *)&v13, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MRUINotificationHelper sharedSingleton](MRUINotificationHelper, "sharedSingleton"));
    objc_msgSend(v8, "updateFollowupsToNewLocale");

  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.mobilerepair.refreshui")))
  {
    v9 = handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "received com.apple.mobilerepair.refreshui", (uint8_t *)&v13, 2u);
    }

    sub_10000EB34(v11, v12);
  }

}

void sub_10000EFAC(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100010264((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

void sub_10000F000(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  NSError *v9;

  v3 = a2;
  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clearBootIntent status:%d:error:%@", (uint8_t *)v7, 0x12u);
  }

}

void sub_10000F0C4(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a2;
  v3 = handleForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000102CC((uint64_t)v2, v4, v5, v6, v7, v8, v9, v10);

}

void sub_10000F118(id a1, BOOL a2, NSError *a3)
{
  _BOOL4 v3;
  NSError *v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  NSError *v9;

  v3 = a2;
  v4 = a3;
  v5 = handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "clearRepairBackup status: %d error: %@", (uint8_t *)v7, 0x12u);
  }

}

void sub_10000F1DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000F208(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000F218(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10000F49C(uint64_t a1)
{
  id v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
  v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v3 = (void *)qword_10001EAF8;
  qword_10001EAF8 = (uint64_t)v2;

}

void sub_10000F930(uint64_t a1)
{
  id v2;
  void *v3;

  if ((+[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("psd2")) & 1) != 0|| +[CRFDRBaseDeviceHandler isFDRDataClassSupported:](CRFDRBaseDeviceHandler, "isFDRDataClassSupported:", CFSTR("prpc")))
  {
    objc_msgSend(*(id *)(a1 + 32), "handleSUCase");
    v2 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
    v3 = (void *)qword_10001EB08;
    qword_10001EB08 = (uint64_t)v2;

  }
}

void sub_10000FA14(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s]Unable to get FDR path")));
  sub_10000A398();
  sub_10000A368((void *)&_mh_execute_header, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);

  sub_10000A388();
}

void sub_10000FAC8(uint64_t a1)
{
  void *v1;
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] unable to create sealer")));
  sub_10000A398();
  sub_10000A368((void *)&_mh_execute_header, v3, v4, "[%@][%@]", v5, v6, v7, v8, (uint64_t)"-[MRBaseComponentHandler scheduleNetworkActivity]_block_invoke", v9, 2u);

  sub_10000A388();
}

void sub_10000FB7C(uint64_t a1, _xpc_activity_s *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  xpc_activity_state_t state;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "componentName"));
  v11 = (uint64_t)a2;
  state = xpc_activity_get_state(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set state to DEFER for activity %@ current state: %lu")));
  sub_10000A398();
  sub_10000A368((void *)&_mh_execute_header, v5, v6, "[%@][%@]", v7, v8, v9, v10, v11, state, 2u);

  sub_10000A388();
}

void sub_10000FC38()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;

  sub_10000A3D0();
  sub_10000A3A8(v2, v3, v4, 5.778e-34);
  sub_10000A37C((void *)&_mh_execute_header, v7, v5, "[%@][%@]", v6);

}

void sub_10000FC84(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "componentName"));
  v11 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%s] ignoring rogue event with unlock countL: %ld")));
  sub_10000A398();
  sub_10000A368((void *)&_mh_execute_header, v5, v6, "[%@][%@]", v7, v8, v9, v10, (uint64_t)"-[MRBaseComponentHandler sendAnalyticsForCount:]", v11, 2u);

  sub_10000A388();
}

void sub_10000FD38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A3C0((void *)&_mh_execute_header, a1, a3, "Cannot find matching service to IOPlatformExpertDevice", a5, a6, a7, a8, 0);
}

void sub_10000FD6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A3C0((void *)&_mh_execute_header, a1, a3, "Cannot find property \"config-number\"", a5, a6, a7, a8, 0);
}

void sub_10000FDA0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_10000D4D4((void *)&_mh_execute_header, v2, v3, "failed to post followup error:%@", v4, v5, v6, v7, 2u);

  sub_10000D4E8();
}

void sub_10000FE1C(uint64_t *a1, int *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;

  v3 = *a1;
  v4 = *a2;
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to display %@ notification ERROR:%d", (uint8_t *)&v5, 0x12u);
}

void sub_10000FEA8(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v4 = *a1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to open sensitive url:%@ :: error:%@", (uint8_t *)&v6, 0x16u);

}

void sub_10000FF58(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_10000D4D4((void *)&_mh_execute_header, v2, v3, "failed to clear Followup error:%@", v4, v5, v6, v7, 2u);

  sub_10000D4E8();
}

void sub_10000FFD4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_10000D4D4((void *)&_mh_execute_header, v2, v3, "failed to clear Followup notification:%@", v4, v5, v6, v7, 2u);

  sub_10000D4E8();
}

void sub_100010050(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_10000D514(a1, a2), "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  sub_10000D4F4((void *)&_mh_execute_header, v6, v7, "failed to post followup error:%@");

  sub_10000D508();
}

void sub_1000100A0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_10000D514(a1, a2), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  sub_10000D4F4((void *)&_mh_execute_header, v6, v7, "failed to clear Followup error:%@");

  sub_10000D508();
}

void sub_1000100F0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot create listener", v1, 2u);
  sub_10000F228();
}

void sub_10001012C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F218((void *)&_mh_execute_header, a2, a3, "GameMode notification check failed:%d", a5, a6, a7, a8, 0);
  sub_10000F228();
}

void sub_100010190(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F218((void *)&_mh_execute_header, a2, a3, "GameMode notification register failed:%d", a5, a6, a7, a8, 0);
  sub_10000F228();
}

void sub_1000101F4(_xpc_activity_s *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  xpc_activity_get_state(a1);
  sub_10000F1F0();
  sub_10000F1DC((void *)&_mh_execute_header, v1, v2, "Failed to set state to DEFER for activity %@ current state: %lu", v3, v4, v5, v6, v7);
  sub_10000D4E8();
}

void sub_100010264(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F208((void *)&_mh_execute_header, a2, a3, "Error:%@", a5, a6, a7, a8, 2u);
}

void sub_1000102CC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000F208((void *)&_mh_execute_header, a2, a3, "Error: %@", a5, a6, a7, a8, 2u);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_init");
}

id objc_msgSend_actionWithLabel_url_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithLabel:url:");
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actions");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_checkInAndHandleAuthStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInAndHandleAuthStatus");
}

id objc_msgSend_clearBootIntent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearBootIntent:");
}

id objc_msgSend_clearNSUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearNSUserDefaults");
}

id objc_msgSend_clearNotificationForItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearNotificationForItem:error:");
}

id objc_msgSend_clearPendingFollowUpItemsWithUniqueIdentifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPendingFollowUpItemsWithUniqueIdentifiers:error:");
}

id objc_msgSend_clearRepairBackup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRepairBackup:");
}

id objc_msgSend_clearRepairFollowUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRepairFollowUp");
}

id objc_msgSend_clearRepairFollowUpForClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearRepairFollowUpForClientID:");
}

id objc_msgSend_clearStateFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearStateFile:");
}

id objc_msgSend_compareBuildVersionString_withPrecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareBuildVersionString:withPrecision:");
}

id objc_msgSend_componentAuthHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentAuthHandler");
}

id objc_msgSend_componentEventQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentEventQueue");
}

id objc_msgSend_componentFollowupClientID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentFollowupClientID");
}

id objc_msgSend_componentFollowupRetriggerdays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentFollowupRetriggerdays");
}

id objc_msgSend_componentHasNotifiedServerKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentHasNotifiedServerKey");
}

id objc_msgSend_componentLastCheckTimeKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentLastCheckTimeKey");
}

id objc_msgSend_componentName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentName");
}

id objc_msgSend_componentRetriggerCountKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentRetriggerCountKey");
}

id objc_msgSend_componentSUCaseKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentSUCaseKey");
}

id objc_msgSend_componentStatusKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentStatusKey");
}

id objc_msgSend_componentUnLockCheckCountKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentUnLockCheckCountKey");
}

id objc_msgSend_componentUnlockCheckerActivityName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentUnlockCheckerActivityName");
}

id objc_msgSend_componentfollowUpDisplaydays(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentfollowUpDisplaydays");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyComponentStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyComponentStatus");
}

id objc_msgSend_copyPathForPersistentData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPathForPersistentData:error:");
}

id objc_msgSend_copySealingManifestDataInstanceForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copySealingManifestDataInstanceForComponent:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCriteriaForUnlockCheckerWithInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createCriteriaForUnlockCheckerWithInterval:");
}

id objc_msgSend_createFinishRepairFollowUpWithNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFinishRepairFollowUpWithNotification:");
}

id objc_msgSend_createRepairFollowUp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRepairFollowUp");
}

id objc_msgSend_createRepairFollowUpWithNotification_actionURL_repairTitle_infoText_itemID_timeInterval_componentName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRepairFollowUpWithNotification:actionURL:repairTitle:infoText:itemID:timeInterval:componentName:");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceClass");
}

id objc_msgSend_deviceSupportsRepairBootIntent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportsRepairBootIntent");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_displayModalPopup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayModalPopup");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_finishRepairMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishRepairMessage");
}

id objc_msgSend_finishRepairTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishRepairTitle");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_followUpInfoMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "followUpInfoMessage");
}

id objc_msgSend_getHwRevision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHwRevision");
}

id objc_msgSend_handleComponentSUCase_lastAUthCheckBuildVersion_followUpItemID_queryString_suCasekey_startBuildVersion_componentAuth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleComponentSUCase:lastAUthCheckBuildVersion:followUpItemID:queryString:suCasekey:startBuildVersion:componentAuth:");
}

id objc_msgSend_handleSUCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleSUCase");
}

id objc_msgSend_initForRegisterChangeWithParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForRegisterChangeWithParameters:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientIdentifier:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFDRDataClassSupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFDRDataClassSupported:");
}

id objc_msgSend_isFDRPropertySupported_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFDRPropertySupported:");
}

id objc_msgSend_isSUCaseForComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSUCaseForComponent");
}

id objc_msgSend_isSupportedIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSupportedIPad");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_localizedStringWithKey_defaultString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithKey:defaultString:");
}

id objc_msgSend_mainNonAuthRepairFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainNonAuthRepairFlow");
}

id objc_msgSend_notifyServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyServer");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_pendingFollowUpItemsWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingFollowUpItemsWithCompletion:");
}

id objc_msgSend_popUpNotificationNowWithMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popUpNotificationNowWithMessage");
}

id objc_msgSend_popUpNotificationNowWithMessage_title_openSensitiveURL_componentName_legacyPopup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popUpNotificationNowWithMessage:title:openSensitiveURL:componentName:legacyPopup:");
}

id objc_msgSend_popUpNotificationTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popUpNotificationTitle");
}

id objc_msgSend_postComponentStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postComponentStatus:");
}

id objc_msgSend_postFollowUpItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postFollowUpItem:error:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLanguages");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_registerChangeForComponent_fdrError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerChangeForComponent:fdrError:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_scheduleNetworkActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNetworkActivity");
}

id objc_msgSend_scheduleUnlockCheckerActivity_forFinishRepair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleUnlockCheckerActivity:forFinishRepair:");
}

id objc_msgSend_sendAnalyticsForCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnalyticsForCount:");
}

id objc_msgSend_sendDailyAnalyticsForModuleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDailyAnalyticsForModuleType:");
}

id objc_msgSend_sendFailedComponentStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFailedComponentStats");
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActions:");
}

id objc_msgSend_setActivateAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivateAction:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setClearAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClearAction:");
}

id objc_msgSend_setComponentAuthHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentAuthHandler:");
}

id objc_msgSend_setComponentDataCollectionPresentedKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentDataCollectionPresentedKey:");
}

id objc_msgSend_setComponentEventQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentEventQueue:");
}

id objc_msgSend_setComponentFirstUIDisplayedTimeKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentFirstUIDisplayedTimeKey:");
}

id objc_msgSend_setComponentFollowupClientID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentFollowupClientID:");
}

id objc_msgSend_setComponentForceKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentForceKey:");
}

id objc_msgSend_setComponentHasDisplayedFollowUpKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentHasDisplayedFollowUpKey:");
}

id objc_msgSend_setComponentHasNotifiedServerKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentHasNotifiedServerKey:");
}

id objc_msgSend_setComponentId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentId:");
}

id objc_msgSend_setComponentLastCheckTimeKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentLastCheckTimeKey:");
}

id objc_msgSend_setComponentName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentName:");
}

id objc_msgSend_setComponentNtwkActivityName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentNtwkActivityName:");
}

id objc_msgSend_setComponentRetriggerCountKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentRetriggerCountKey:");
}

id objc_msgSend_setComponentSUCaseKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentSUCaseKey:");
}

id objc_msgSend_setComponentStatusKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentStatusKey:");
}

id objc_msgSend_setComponentUnLockCheckCountKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentUnLockCheckCountKey:");
}

id objc_msgSend_setComponentUnlockCheckerActivityName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponentUnlockCheckerActivityName:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDisableUIForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableUIForComponent:");
}

id objc_msgSend_setDisplayFollowup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayFollowup:");
}

id objc_msgSend_setDisplayModalPopup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayModalPopup:");
}

id objc_msgSend_setDisplayNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayNotification:");
}

id objc_msgSend_setDisplayStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayStyle:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFinishRepairKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishRepairKey:");
}

id objc_msgSend_setFinishRepairMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishRepairMessage:");
}

id objc_msgSend_setFinishRepairTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishRepairTitle:");
}

id objc_msgSend_setFirstNotificationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFirstNotificationDelay:");
}

id objc_msgSend_setFollowUpInfoMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFollowUpInfoMessage:");
}

id objc_msgSend_setFrequency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrequency:");
}

id objc_msgSend_setGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGroupIdentifier:");
}

id objc_msgSend_setInformativeText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInformativeText:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIsSUCaseForComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsSUCaseForComponent:");
}

id objc_msgSend_setLastKnownComponentIdentifierKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownComponentIdentifierKey:");
}

id objc_msgSend_setLastKnownComponentIdentifierValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastKnownComponentIdentifierValue:");
}

id objc_msgSend_setLinkedSensitiveURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLinkedSensitiveURL:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotifyServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotifyServer:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setPopUpNotificationMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPopUpNotificationMessage:");
}

id objc_msgSend_setPopUpNotificationTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPopUpNotificationTitle:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setStateFilePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateFilePath:");
}

id objc_msgSend_setSupportsRepair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSupportsRepair:");
}

id objc_msgSend_setTargetBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetBundleIdentifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUnlockActionLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnlockActionLabel:");
}

id objc_msgSend_setUnlockCheckActivityRequired_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnlockCheckActivityRequired:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedSingleton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedSingleton");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_synchronouslycopyAuthStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronouslycopyAuthStatus");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_unlockCheckActivityRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockCheckActivityRequired");
}

id objc_msgSend_unlockCheckerActivityBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockCheckerActivityBody");
}

id objc_msgSend_unlockCheckerActivityBodyForFinishRepair(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockCheckerActivityBodyForFinishRepair");
}

id objc_msgSend_updateFollowupsToNewLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFollowupsToNewLocale");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
