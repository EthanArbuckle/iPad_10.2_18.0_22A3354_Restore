SecTaskRef sub_100004178(uint64_t a1, const __CFString *a2)
{
  SecTaskRef result;
  const void *v4;
  CFTypeRef v5;
  audit_token_t v6;
  audit_token_t v7;

  memset(&v7, 0, sizeof(v7));
  xpc_connection_get_audit_token(a1, &v7);
  v6 = v7;
  result = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v6);
  if (result)
  {
    v4 = result;
    v5 = SecTaskCopyValueForEntitlement(result, a2, 0);
    CFRelease(v4);
    if (v5)
    {
      CFRelease(v5);
      return (SecTaskRef)1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100004200(void *a1, void *a2)
{
  _xpc_connection_s *v3;
  xpc_object_t reply;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = a1;
  reply = xpc_dictionary_create_reply(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsManager sharedLTSStatsManager](LTSStatsManager, "sharedLTSStatsManager"));
  if ((sub_100004178((uint64_t)v3, CFSTR("com.apple.private.LTSStats-read")) & 1) != 0)
  {
    v6 = MKBDeviceUnlockedSinceBoot();
    v7 = qword_100014B08;
    if (v6 == 1)
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received message for LTSStats type", buf, 2u);
      }
      if (v5)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getLifetimeStats"));
        v9 = (void *)((uint64_t (*)(void))_CFXPCCreateXPCObjectFromCFObject)();
        xpc_dictionary_set_value(reply, "LTSStats", v9);

        v10 = 0;
      }
      else
      {
        v11 = qword_100014B08;
        if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "LTSStats are not supported", v14, 2u);
        }
        v8 = 0;
        v10 = 45;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
        sub_10000A5F0();
      v8 = 0;
      v10 = 35;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
      sub_10000A61C();
    v8 = 0;
    v10 = 1;
  }
  xpc_dictionary_set_int64(reply, "errno", v10);
  v12 = (void *)_CFXPCCreateXPCObjectFromCFObject(v8);
  xpc_dictionary_set_value(reply, "LTSStats", v12);

  xpc_connection_send_message(v3, reply);
  return v10;
}

void start()
{
  char v0;
  int v1;
  os_log_t v2;
  void *v3;
  _xpc_connection_s *mach_service;
  void *v5;

  v0 = sub_100004A24();
  v1 = sub_100004B10();
  v2 = os_log_create("com.apple.powerdatad", "main");
  v3 = (void *)qword_100014B08;
  qword_100014B08 = (uint64_t)v2;

  mach_service = xpc_connection_create_mach_service("com.apple.powerdatad", 0, 1uLL);
  v5 = objc_autoreleasePoolPush();
  xpc_activity_register("com.apple.powerdatad.3hourlyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010498);
  xpc_connection_set_event_handler(mach_service, &stru_1000104B8);
  xpc_connection_activate(mach_service);
  if ((v0 & 1) != 0 || v1)
  {
    xpc_activity_register("com.apple.powerdatad.15minTask", XPC_ACTIVITY_CHECK_IN, &stru_100010500);
    xpc_activity_register("com.apple.powerdatad.DailyTask", XPC_ACTIVITY_CHECK_IN, &stru_100010520);
  }
  else
  {
    xpc_activity_unregister("com.apple.powerdatad.DailyTask");
    xpc_activity_unregister("com.apple.powerdatad.15minTask");
    xpc_transaction_exit_clean();
  }
  objc_autoreleasePoolPop(v5);
  CFRunLoopRun();
  exit(1);
}

void sub_1000044FC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v2 = a2;
  v3 = objc_autoreleasePoolPush();
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "LTS Activity Run!", v11, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[LTSStatsManager sharedLTSStatsManager](LTSStatsManager, "sharedLTSStatsManager"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "updateLifetimeStats");
    }
    else
    {
      xpc_activity_unregister("com.apple.powerdatad.3hourlyTask");
      v9 = qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to instantiate LTS stats manager. LTS data collection is not supported!!", v10, 2u);
      }
      xpc_transaction_exit_clean();
    }

  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LTS Activity checking in!", buf, 2u);
    }
  }
  objc_autoreleasePoolPop(v3);

}

void sub_10000464C(id a1, OS_xpc_object *a2)
{
  _xpc_connection_s *v2;
  _QWORD handler[4];
  OS_xpc_object *v4;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000046C4;
  handler[3] = &unk_1000104E0;
  v4 = a2;
  v2 = v4;
  xpc_connection_set_event_handler(v2, handler);
  xpc_connection_activate(v2);

}

void sub_1000046C4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(v3, "LTSStats"))
    {
      if (sub_100004200(*(void **)(a1 + 32), v3) == 45)
        xpc_transaction_exit_clean();
    }
    else
    {
      v5 = qword_100014B08;
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
        sub_10000A648((uint64_t)v3, v5);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
  {
    sub_10000A6BC();
  }
  objc_autoreleasePoolPop(v4);

}

void sub_100004798(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = a2;
  v3 = objc_autoreleasePoolPush();
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "15 min Activity Run!", v8, 2u);
    }
    if (sub_100004C0C())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EnergyTelemetry sharedInstance](EnergyTelemetry, "sharedInstance"));
      objc_msgSend(v7, "getEnergyTelemetry");

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
        sub_10000A6E8();
      xpc_activity_unregister("com.apple.powerdatad.15minTask");
      xpc_transaction_exit_clean();
    }
  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "15 min Activity checking in!", buf, 2u);
    }
  }
  objc_autoreleasePoolPop(v3);

}

void sub_1000048CC(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v2 = a2;
  v3 = objc_autoreleasePoolPush();
  state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    v6 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Daily Activity Run!", v8, 2u);
    }
    if (sub_100004C0C())
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[EnergyTelemetry sharedInstance](EnergyTelemetry, "sharedInstance"));
      objc_msgSend(v7, "calculateEnergyAndPublishTelemetry");

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_ERROR))
        sub_10000A6E8();
      xpc_activity_unregister("com.apple.powerdatad.DailyTask");
      xpc_transaction_exit_clean();
    }
  }
  else if (!state)
  {
    v5 = qword_100014B08;
    if (os_log_type_enabled((os_log_t)qword_100014B08, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daily Activity checking in!", buf, 2u);
    }
  }
  objc_autoreleasePoolPop(v3);

}

void sub_100004A00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_100004A24()
{
  void *v0;
  unsigned __int8 v1;
  uint64_t result;
  _BOOL4 v3;
  const char *v4;
  uint8_t *v5;
  _BOOL4 v6;
  __int16 v7;
  __int16 v8;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v1 = objc_msgSend(v0, "optInApple");

  if ((v1 & 1) == 0)
  {
    v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v3)
      return result;
    v8 = 0;
    v4 = "No opt-in for D&U.";
    v5 = (uint8_t *)&v8;
    goto LABEL_8;
  }
  if ((_os_feature_enabled_impl("EnergyTelemetry", "EnergyTelemetry") & 1) != 0)
    return 1;
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v6)
  {
    v7 = 0;
    v4 = "Feature flag for ET not enabled.";
    v5 = (uint8_t *)&v7;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    return 0;
  }
  return result;
}

uint64_t sub_100004B10()
{
  char v0;
  void *v1;
  unsigned __int8 v2;
  uint64_t result;
  _BOOL4 v4;
  const char *v5;
  uint8_t *v6;
  _BOOL4 v7;
  __int16 v8;
  __int16 v9;

  v0 = _os_feature_enabled_impl("CarbonEmissionsAwareness", "CarbonEnergyAccounting");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v2 = objc_msgSend(v1, "optInApple");

  if ((v2 & 1) == 0)
  {
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v4)
      return result;
    v9 = 0;
    v5 = "No opt-in for D&U.";
    v6 = (uint8_t *)&v9;
    goto LABEL_8;
  }
  if ((v0 & 1) != 0)
    return 1;
  v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v7)
  {
    v8 = 0;
    v5 = "Feature flag for CEA not enabled.";
    v6 = (uint8_t *)&v8;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    return 0;
  }
  return result;
}

BOOL sub_100004C0C()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  CFTypeRef CFProperty;
  _BOOL8 v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v0 = IOServiceMatching("AppleSmartBattery");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("PowerTelemetryData"), kCFAllocatorDefault, 0);
    v4 = CFProperty != 0;
    if (CFProperty)
    {
      CFRelease(CFProperty);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PowerTelemetryData key not found", buf, 2u);
    }
    IOObjectRelease(v2);
  }
  else
  {
    v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No match for AppleSmartBattery IOService.", v6, 2u);
      return 0;
    }
  }
  return v4;
}

id sub_100004F88()
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
  v0 = (void *)qword_100014B28;
  v7 = qword_100014B28;
  if (!qword_100014B28)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008870;
    v3[3] = &unk_1000106A0;
    v3[4] = &v4;
    sub_100008870((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100005028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005080(id a1)
{
  EnergyTelemetry *v1;
  void *v2;

  v1 = objc_alloc_init(EnergyTelemetry);
  v2 = (void *)qword_100014B10;
  qword_100014B10 = (uint64_t)v1;

}

void sub_10000528C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000052F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000535C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000053D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000055A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_100006334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id sub_100007DE8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100008004(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 6));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("average_intensity"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("domain"));
  if (*(_BYTE *)(a1 + 80))
    v3 = &__kCFBooleanTrue;
  else
    v3 = &__kCFBooleanFalse;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("is_intensity_static"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "stringFromDate:", *(_QWORD *)(a1 + 56)));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("date"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 64), CFSTR("slot"));
  v5 = *(void **)(a1 + 48);
  v6 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calcSlotValueFromEnergy:withIntensity:", v6, v7));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("slot_value"));

  return v2;
}

int64_t sub_100008804(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

void sub_100008870(uint64_t a1)
{
  sub_1000088C4();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_GDSManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100014B28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000AE68();
    sub_1000088C4();
  }
}

void sub_1000088C4()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_100014B20)
  {
    v2 = off_100010680;
    v3 = 0;
    qword_100014B20 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_100014B20)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

void sub_100008970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  sub_1000088C4();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("_GDSBalancingAuthorityOutput");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_100014B30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)sub_10000AE8C();
    sub_1000089C4(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_1000089C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000089E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000089F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009898(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100014B40;
  qword_100014B40 = (uint64_t)v1;

}

int sub_100009B9C(id a1, __CFDictionary *a2)
{
  const __CFString *Group;
  const __CFString *SubGroup;
  CFComparisonResult v5;

  Group = (const __CFString *)IOReportChannelGetGroup(a2);
  SubGroup = (const __CFString *)IOReportChannelGetSubGroup(a2);
  if (CFStringCompare(Group, CFSTR("PMP"), 0)
    || (v5 = CFStringCompare(SubGroup, CFSTR("Volt-Temp HM"), 0)) != kCFCompareEqualTo)
  {
    LODWORD(v5) = 16;
  }
  return v5;
}

id sub_10000A258(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLifetimeStatsForChannel:", a2);
}

id sub_10000A2BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLifetimeStatsGated");
}

uint64_t sub_10000A3A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000A3B0(uint64_t a1)
{

}

void sub_10000A3B8(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  id v7;
  void *v8;
  NSObject *v9;
  __CFString *v10;
  __int128 v11;
  uint8_t buf[4];
  __CFString *v13;

  objc_msgSend(*(id *)(a1 + 32), "updateLifetimeStatsGated");
  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = 0;
  *(_QWORD *)&v6 = 138543362;
  v11 = v6;
  do
  {
    if (LOBYTE(off_100014940[v5 + 3]))
    {
      v7 = -[LTSStatsStore initForChannel:]([LTSStatsStore alloc], "initForChannel:", off_100014940[v5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "getLifetimeStats"));
      v9 = off_100014B00;
      if (os_log_type_enabled((os_log_t)off_100014B00, OS_LOG_TYPE_INFO))
      {
        v10 = off_100014940[v5 + 2];
        *(_DWORD *)buf = v11;
        v13 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Returning lifetime stats for report %{public}@\n", buf, 0xCu);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setValue:forKey:", v8, off_100014940[v5 + 2], v11);

    }
    v5 += 4;
  }
  while (v5 != 56);
}

void sub_10000A598(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A5C4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000A5E4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10000A5F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Stats request before first unlock", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A61C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Sender not entitled to read LTS Stats", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A648(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received unexpected message %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A6BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Received a non-dictionary type", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A6E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Energy telemetry unsupported. De-registering xpc activity", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004A00((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to allocate logger", a5, a6, a7, a8, 0);
  sub_100004A10();
}

void sub_10000A748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to allocate defaults", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A774()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to allocate UTC calendar", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A7A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get utc midnight", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A7CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Nil date sent in", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A7F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000089C4((void *)&_mh_execute_header, a2, a3, "Updated utc midnight to %@", a5, a6, a7, a8, 2u);
  sub_1000089D4();
}

void sub_10000A860()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "Nil utcMidNight for date %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000A8C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "Record count already at max slots. Dropping %@ energy telemetry.", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000A920()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_1000089E8((void *)&_mh_execute_header, v0, v1, "Unable to fetch new telemetry", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A94C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Recreating baseline as last accumulation was too far in the past", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000A978()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000089DC();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Num slots needed %ld would take records beyond max count, available: %ld", v2, 0x16u);
  sub_1000089D4();
}

void sub_10000A9F4(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Last accum telemetry: %@, timeDelta: %f", (uint8_t *)&v3, 0x16u);
  sub_1000089D4();
}

void sub_10000AA70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "Current accum telemetry %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000AAD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_1000089E8((void *)&_mh_execute_header, v0, v1, "Incremental energy record missing slot timestamps, starting fresh.", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AAFC(int a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Num elements in incremental array %u", buf, 8u);
}

void sub_10000AB40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "ASBM service null", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AB6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "PowerTelemetryData null", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AB98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get BA ID from GDS", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000ABC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get incremental energy telemetry record.", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000ABF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "Look-back date %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000AC50(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Total emissions slots fetched %lu", buf, 0xCu);
}

void sub_10000AC94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Incremental energy telemetry record in old format, nothing to calculate.", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000ACC0(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "lastUpdatedDate"));
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "@Name %@, ID %@, Date %@!", (uint8_t *)&v7, 0x20u);

}

void sub_10000ADA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "Payload %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000AE08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "CA daily summary: %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

uint64_t sub_10000AE68()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "_GDSManager");
  return sub_10000AE8C(v0);
}

uint64_t sub_10000AE8C()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "_GDSBalancingAuthorityOutput");
  return sub_10000AEB0(v0);
}

void sub_10000AEB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get device serial number", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AEDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Device serial is empty", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AF08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "Failed to get domain name for chName: %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000AF68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "Failed to allocate defaults for chName: %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000AFC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "On disk serial number doesn't match device serial number", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000AFF4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A5AC();
  sub_10000A598((void *)&_mh_execute_header, v0, v1, "Failed to write to file %{public}@ err:%{public}@");
  sub_1000089D4();
}

void sub_10000B054(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  sub_10000A5C4((void *)&_mh_execute_header, a2, a3, "Wrote %ld bytes to file %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1000089D4();
}

void sub_10000B0C4()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A5AC();
  sub_10000A598((void *)&_mh_execute_header, v0, v1, "Failed to set protection attribute on file %{public}@. Err:%{public}@");
  sub_1000089D4();
}

void sub_10000B124()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A5AC();
  sub_10000A598((void *)&_mh_execute_header, v0, v1, "Failed to write to file %{public}@. Parent directory doesn't exist. err:%{public}@");
  sub_1000089D4();
}

void sub_10000B184()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A5AC();
  sub_10000A598((void *)&_mh_execute_header, v0, v1, "Failed to read from file %{public}@. err: %{public}@");
  sub_1000089D4();
}

void sub_10000B1E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "Successfully Read from file %{public}@.", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B244()
{
  uint64_t v0;
  os_log_t v1;

  sub_10000A5D8();
  sub_10000A5C4((void *)&_mh_execute_header, v0, v1, "Life time stats for domain %@: %@");
  sub_1000089D4();
}

void sub_10000B2B4(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get boot UUID. rc:0x%x", (uint8_t *)v2, 8u);
  sub_100004A10();
}

void sub_10000B324()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to read boot UUID", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get boot UUID in previous stats", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B37C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to initialize LTSStats", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B3A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A5E4(__stack_chk_guard);
  sub_10000A5D8();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "IOReportCreateSubscription error: %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B408()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "No channel subscription", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A5E4(__stack_chk_guard);
  sub_10000A5D8();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "IOReportCreateSamples error: %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to get channel name", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B4C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "Failed to allocate LTSStatsStore for channel %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B520()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000089DC();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "On-disk lifetimeStats: %@\n", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B580()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004A18();
  sub_100004A00((void *)&_mh_execute_header, v0, v1, "Failed to read LTS stats since boot", v2, v3, v4, v5, v6);
  sub_100004A10();
}

void sub_10000B5AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A5E4(__stack_chk_guard);
  sub_10000A5D8();
  sub_1000089F8((void *)&_mh_execute_header, v0, v1, "IOReportCreateSamplesDelta error: %{public}@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

void sub_10000B60C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A5E4(__stack_chk_guard);
  sub_10000A5D8();
  sub_1000089C4((void *)&_mh_execute_header, v0, v1, "Returning lifetime stats: %@", v2, v3, v4, v5, v6);
  sub_1000089D4();
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndexesInRange:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appendIncrementalData_toRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendIncrementalData:toRecords:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_calcSlotValueFromEnergy_withIntensity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcSlotValueFromEnergy:withIntensity:");
}

id objc_msgSend_calculateEnergyAndPublishTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculateEnergyAndPublishTelemetry");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_carbonIntensityHistoryForBA_from_to_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carbonIntensityHistoryForBA:from:to:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_copyAccumulatedEnergyTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAccumulatedEnergyTelemetry");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateBySettingHour_minute_second_ofDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateBySettingHour:minute:second:ofDate:options:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
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

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_fetchEmissionHistoriesForDays_fromRecords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchEmissionHistoriesForDays:fromRecords:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_findDayStarts_returnMidnights_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findDayStarts:returnMidnights:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_getBalancingAuthority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBalancingAuthority");
}

id objc_msgSend_getBootUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBootUUID");
}

id objc_msgSend_getDateFrom_alignedToMinutes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDateFrom:alignedToMinutes:");
}

id objc_msgSend_getDeviceSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceSerialNumber");
}

id objc_msgSend_getEnergyTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnergyTelemetry");
}

id objc_msgSend_getIncrementalEnergyRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIncrementalEnergyRecord");
}

id objc_msgSend_getLastAccumulatedEnergyTelemetry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLastAccumulatedEnergyTelemetry");
}

id objc_msgSend_getLifetimeStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLifetimeStats");
}

id objc_msgSend_getLifetimeStatsForVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLifetimeStatsForVersion:");
}

id objc_msgSend_getPrevStatsSinceBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPrevStatsSinceBoot");
}

id objc_msgSend_getSlotWithDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSlotWithDate:");
}

id objc_msgSend_getStatsSinceBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStatsSinceBoot");
}

id objc_msgSend_getUTCMidnightFor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUTCMidnightFor:");
}

id objc_msgSend_getfileNameForChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getfileNameForChannel:");
}

id objc_msgSend_historicalMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "historicalMap");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_indexGreaterThanIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexGreaterThanIndex:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_initForChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForChannel:");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_isBAInfoAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBAInfoAvailable");
}

id objc_msgSend_isDate_inSameDayAsDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDate:inSameDayAsDate:");
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDate:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_keysSortedByValueUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keysSortedByValueUsingComparator:");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastUpdatedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUpdatedDate");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_latestBalancingAuthority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestBalancingAuthority");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_managerWithID_locationBundlePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managerWithID:locationBundlePath:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
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

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_optInApple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optInApple");
}

id objc_msgSend_outputStreamToFileAtPath_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputStreamToFileAtPath:append:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_readFromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFromFile:");
}

id objc_msgSend_recordLastAccumulatedEnergyTelemetry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordLastAccumulatedEnergyTelemetry:");
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllIndexes");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_saveLifetimeStats_forVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveLifetimeStats:forVersion:");
}

id objc_msgSend_saveStatsSinceBoot_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveStatsSinceBoot:");
}

id objc_msgSend_sendDailySummaryToCoreAnalyticsForDate_withLocation_withCarbon_withEnergy_withSystem_missingIntensity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDailySummaryToCoreAnalyticsForDate:withLocation:withCarbon:withEnergy:withSystem:missingIntensity:");
}

id objc_msgSend_sendDayToCoreAnalytics_ofRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDayToCoreAnalytics:ofRecord:");
}

id objc_msgSend_sendDayToPowerlog_ofRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDayToPowerlog:ofRecord:");
}

id objc_msgSend_sendSlotEventToCoreAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSlotEventToCoreAnalytics:");
}

id objc_msgSend_sendTypedEventToCoreAnalyticsWithDate_withEnergy_andIntensity_forSlot_atLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTypedEventToCoreAnalyticsWithDate:withEnergy:andIntensity:forSlot:atLocation:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setChannelExistsForChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannelExistsForChannel:");
}

id objc_msgSend_setIncrementalEnergyRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncrementalEnergyRecord:");
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

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLTSStatsManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLTSStatsManager");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateLifetimeStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLifetimeStats");
}

id objc_msgSend_updateLifetimeStatsGated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLifetimeStatsGated");
}

id objc_msgSend_writeDictionary_toFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDictionary:toFile:");
}

id objc_msgSend_writePropertyList_toStream_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writePropertyList:toStream:format:options:error:");
}
