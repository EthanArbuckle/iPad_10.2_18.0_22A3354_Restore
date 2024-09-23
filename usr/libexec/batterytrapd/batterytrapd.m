void sub_100001900(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002120(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002130(uint64_t a1)
{

}

void sub_100002138(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG))
    sub_100002748();
  objc_msgSend(*(id *)(a1 + 32), "_updateLocaleChange");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = 0;

}

void start()
{
  void *v0;

  v0 = objc_autoreleasePoolPush();
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004280);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000042A0);

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_10000231C(id a1, OS_xpc_object *a2)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDaemon *v10;
  void *v11;

  v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v2)
    sub_100002774(v2, v3, v4, v5, v6, v7, v8, v9);
  v10 = objc_alloc_init(CFDaemon);
  v11 = (void *)qword_100008550;
  qword_100008550 = (uint64_t)v10;

  byte_100008548 = 1;
}

void sub_100002370(id a1, OS_xpc_object *a2)
{
  const char *string;
  const char *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (byte_100008548 == 1 && qword_100008550 != 0)
  {
    string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
    if (string)
    {
      v4 = string;
      if (!strcmp("TimezoneNotification", string))
      {
        v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v13)
          sub_1000027A8(v13, v14, v15, v16, v17, v18, v19, v20);
        objc_msgSend((id)qword_100008550, "_handleTimeZoneChange");
      }
      else if (!strcmp("AppleTimePreferencesChangedNotification", v4))
      {
        v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v5)
          sub_1000027DC(v5, v6, v7, v8, v9, v10, v11, v12);
        objc_msgSend((id)qword_100008550, "_handleLocaleChange");
      }
    }
  }
}

void sub_100002438(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002448()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100001900((void *)&_mh_execute_header, v0, v1, "NVRAM variable name cannot be null", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_100002474(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't write nvram for variable: %@, error:0x%x", (uint8_t *)&v3, 0x12u);
}

void sub_1000024F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100001900((void *)&_mh_execute_header, v0, v1, "Couldn't sync nvram to device", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_100002524()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100001900((void *)&_mh_execute_header, v0, v1, "NVRAM is not supported on this system", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_100002550()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100001900((void *)&_mh_execute_header, v0, v1, "Couldn't find entry IODeviceTree:/product", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_10000257C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100001918();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Did not find property lpm-clock", v1, 2u);
  sub_100001910();
}

void sub_1000025B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100001900((void *)&_mh_execute_header, v0, v1, "lpm-clock isn't of type data", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_1000025E0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to change timezone", v1, 2u);
}

void sub_100002620(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "dateFormat"));
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Time format: %@", (uint8_t *)&v5, 0xCu);

}

void sub_1000026C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100002438((void *)&_mh_execute_header, v0, v1, "Writing all variables\n", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_1000026F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100002438((void *)&_mh_execute_header, v0, v1, "com.apple.notifyd.matching notification from com.apple.system.timezone", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_10000271C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100002438((void *)&_mh_execute_header, v0, v1, "com.apple.notifyd.matching notification from AppleTimePreferencesChangedNotification", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_100002748()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100001918();
  sub_100002438((void *)&_mh_execute_header, v0, v1, "NSCurrentLocaleDidChangeNotification", v2, v3, v4, v5, v6);
  sub_100001910();
}

void sub_100002774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002438((void *)&_mh_execute_header, &_os_log_default, a3, "Received XPC launch event com.apple.iokit.matching for batterytrapd", a5, a6, a7, a8, 0);
  sub_100001910();
}

void sub_1000027A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002438((void *)&_mh_execute_header, &_os_log_default, a3, "Received XPC launch event com.apple.notifyd.matching com.apple.system.timezone for batterytrapd", a5, a6, a7, a8, 0);
  sub_100001910();
}

void sub_1000027DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002438((void *)&_mh_execute_header, &_os_log_default, a3, "Received XPC launch event com.apple.notifyd.matching AppleTimePreferencesChangedNotification for batterytrapd", a5, a6, a7, a8, 0);
  sub_100001910();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__handleLocaleChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleLocaleChange");
}

id objc_msgSend__handleTimeZoneChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleTimeZoneChange");
}

id objc_msgSend__updateLocaleChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateLocaleChange");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_createOptionsRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOptionsRef");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dateFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFormat");
}

id objc_msgSend_daylightSavingTimeOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daylightSavingTimeOffset");
}

id objc_msgSend_daylightSavingTimeOffsetForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daylightSavingTimeOffsetForDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_initWithLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLog:");
}

id objc_msgSend_isDaylightSavingTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDaylightSavingTime");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nextDaylightSavingTimeTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextDaylightSavingTimeTransition");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_read24HrMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "read24HrMode");
}

id objc_msgSend_readDST::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDST::");
}

id objc_msgSend_readNVRAM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readNVRAM:");
}

id objc_msgSend_readUTCOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readUTCOffset");
}

id objc_msgSend_releaseOptionsRef_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseOptionsRef:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_resetSystemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetSystemTimeZone");
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMT");
}

id objc_msgSend_set24hMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set24hMode");
}

id objc_msgSend_setDST(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDST");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocalizedDateFormatFromTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalizedDateFormatFromTemplate:");
}

id objc_msgSend_setUTCOffset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUTCOffset");
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

id objc_msgSend_syncNVRAM(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncNVRAM");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_writeAllVariables(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeAllVariables");
}

id objc_msgSend_writeNVRAM::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeNVRAM::");
}
