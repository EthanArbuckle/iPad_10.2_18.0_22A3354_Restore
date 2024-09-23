void sub_1000033F4(uint64_t a1, int a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = objc_alloc((Class)RecordVoiceMemoIntentResponse);
  if (a2)
  {
    v5 = objc_msgSend(v4, "_initWithCode:userActivity:", 1, 0);
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10000369C(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v5 = objc_msgSend(v4, "_initWithCode:userActivity:", 6, 0);
    v15 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10000370C(v7, v16, v17, v18, v19, v20, v21, v22);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000035B4(uint64_t a1, int a2)
{
  id v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = objc_alloc((Class)PlaybackVoiceMemoIntentResponse);
  if (a2)
  {
    v5 = objc_msgSend(v4, "_initWithCode:userActivity:", 1, 0);
    v6 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10000377C(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v5 = objc_msgSend(v4, "_initWithCode:userActivity:", 6, 0);
    v15 = OSLogForCategory(kVMLogCategoryDefault);
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_1000037EC(v7, v16, v17, v18, v19, v20, v21, v22);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100003684(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000369C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003684((void *)&_mh_execute_header, a1, a3, "%s -- Recording available, sending intent response ready.", a5, a6, a7, a8, 2u);
  sub_100003694();
}

void sub_10000370C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003684((void *)&_mh_execute_header, a1, a3, "%s -- Recording unavailable, sending intent requires app launch.", a5, a6, a7, a8, 2u);
  sub_100003694();
}

void sub_10000377C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003684((void *)&_mh_execute_header, a1, a3, "%s -- Recording available, sending playback intent response ready.", a5, a6, a7, a8, 2u);
  sub_100003694();
}

void sub_1000037EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003684((void *)&_mh_execute_header, a1, a3, "%s -- Recording unavailable, sending playback intent requires app launch.", a5, a6, a7, a8, 2u);
  sub_100003694();
}

id objc_msgSend__initWithCode_userActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithCode:userActivity:");
}

id objc_msgSend_checkRecordingAvailability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkRecordingAvailability:");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}
