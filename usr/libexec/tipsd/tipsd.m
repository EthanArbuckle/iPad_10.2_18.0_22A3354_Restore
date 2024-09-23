void sub_10000578C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v6 && !v5)
    objc_msgSend(*(id *)(a1 + 32), "indexContentPackage:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_1000058E8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_1000058FC(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100014BBC();

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appConnections"));
  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));

}

void sub_100005C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006338(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10001481C();

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TPSSearchItemIndexer default](TPSSearchItemIndexer, "default"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tipMap"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allValues"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000ABEC;
  v9[3] = &unk_100020BB0;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v5, "indexTips:qualityOfService:completionHandler:", v7, 9, v9);

}

void sub_1000068D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000070C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;
  id *v30;
  uint64_t v31;

  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v31 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_100007150(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007160(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appConnections"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

void sub_10000758C(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  xpc_object_t v6;
  void *v7;
  void *v8;
  int64_t int64;
  int64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int64_t v17;
  __int16 v18;
  int64_t v19;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "xpc_activity to show welcome notification \"run\" received", (uint8_t *)&v14, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setWelcomeXPCActivityScheduleInProgress:", 0);
    objc_msgSend(*(id *)(a1 + 32), "registerToNotifyWelcome");
  }
  else if (!state)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "xpc activity check in state received.", (uint8_t *)&v14, 2u);
    }

    v6 = xpc_activity_copy_criteria(v3);
    v7 = v6;
    if (!v6 || xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY) <= 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getCurrentWelcomeActivityCriteria"));

      xpc_activity_set_criteria(v3, v8);
      int64 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_DELAY);
      v10 = xpc_dictionary_get_int64(v8, XPC_ACTIVITY_GRACE_PERIOD);
      v11 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 40);
        v14 = 138412802;
        v15 = v12;
        v16 = 2048;
        v17 = int64;
        v18 = 2048;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification with identifier %@, delay %lld, grace period %lld", (uint8_t *)&v14, 0x20u);
      }

      v7 = v8;
    }

  }
}

void sub_100007BDC(id *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  int64_t int64;
  int64_t v11;
  NSObject *v12;
  id v13;
  _QWORD handler[5];
  uint8_t buf[4];
  id v16;
  __int16 v17;
  int64_t v18;
  __int16 v19;
  int64_t v20;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a1[4], "setObject:forKey:", a1[5], CFSTR("TPSCurrentWelcomeXPCActivityIdentifier"));
    objc_msgSend(a1[4], "synchronize");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "getCurrentWelcomeActivityCriteria"));
    v7 = a1[4];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("TPSWelcomeNotificationStartDate"));

    objc_msgSend(a1[4], "synchronize");
    v9 = (const char *)objc_msgSend(objc_retainAutorelease(a1[5]), "UTF8String");
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007DE4;
    handler[3] = &unk_100020990;
    handler[4] = a1[6];
    xpc_activity_register(v9, v6, handler);
    int64 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_DELAY);
    v11 = xpc_dictionary_get_int64(v6, XPC_ACTIVITY_GRACE_PERIOD);
    v12 = objc_claimAutoreleasedReturnValue(+[TPSLogger welcome](TPSLogger, "welcome"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = a1[5];
      *(_DWORD *)buf = 138412802;
      v16 = v13;
      v17 = 2048;
      v18 = int64;
      v19 = 2048;
      v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Schedule welcome notification with identifier %@, delay %lld, grace period %lld", buf, 0x20u);
    }

  }
  else
  {
    if ((+[TPSUserTypesValidation isBetaBuild](TPSUserTypesValidation, "isBetaBuild") & 1) == 0
      && (+[TPSUserTypesValidation isInternalBuild](TPSUserTypesValidation, "isInternalBuild") & 1) == 0&& objc_msgSend(v5, "code") != (id)-1009)
    {
      objc_msgSend(a1[6], "stopWelcomeNotification");
    }
    objc_msgSend(a1[6], "setWelcomeXPCActivityScheduleInProgress:", 0);
  }

}

id sub_100007DE4(uint64_t a1, xpc_activity_t activity)
{
  id result;

  result = (id)xpc_activity_get_state(activity);
  if (result == (id)2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setWelcomeXPCActivityScheduleInProgress:", 0);
    return objc_msgSend(*(id *)(a1 + 32), "registerToNotifyWelcome");
  }
  return result;
}

id sub_10000866C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "registerXPCEventHandlers");
}

void sub_100008BB8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100008BD4(uint64_t a1, int a2)
{
  id WeakRetained;
  NSObject *v6;
  unsigned __int8 v7;
  _DWORD v8[2];

  if ((int)MKBDeviceUnlockedSinceBoot() >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    while (!__ldaxr(byte_1000261B0))
    {
      if (!__stlxr(1u, byte_1000261B0))
        goto LABEL_7;
    }
    __clrex();
LABEL_7:
    v6 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = atomic_load(byte_1000261B0);
      v8[0] = 67109120;
      v8[1] = v7 & 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "First unlock received %d", (uint8_t *)v8, 8u);
    }

    objc_msgSend(WeakRetained, "initialize");
    notify_cancel(a2);

  }
}

BOOL sub_100008D58(uint64_t a1, void *a2, xpc_activity_state_t a3)
{
  _xpc_activity_s *v5;
  xpc_activity_state_t state;
  NSObject *v7;
  uint64_t v8;
  _BOOL8 v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  xpc_activity_state_t v20;
  __int16 v21;
  xpc_activity_state_t v22;

  v5 = a2;
  state = xpc_activity_get_state(v5);
  v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v17 = 138412802;
    v18 = v8;
    v19 = 2048;
    v20 = state;
    v21 = 2048;
    v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Transitioning activity (%@) from state %ld to state %ld.", (uint8_t *)&v17, 0x20u);
  }

  v9 = state == a3;
  if (state == a3)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v17 = 138412546;
      v18 = v11;
      v19 = 2048;
      v20 = a3;
      v12 = "Activity (%@) state is already %ld. No change necessary.";
      v13 = v10;
      v14 = 22;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v17, v14);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!xpc_activity_set_state(v5, a3))
  {
    v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v17 = 138412802;
      v18 = v15;
      v19 = 2048;
      v20 = state;
      v21 = 2048;
      v22 = a3;
      v12 = "Failed to transition activity (%@) from state %ld to state %ld.";
      v13 = v10;
      v14 = 32;
      goto LABEL_10;
    }
LABEL_11:

    goto LABEL_12;
  }
  v9 = 1;
LABEL_12:

  return v9;
}

uint64_t sub_100008FD0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
    goto LABEL_4;
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
LABEL_4:
    *(_BYTE *)(v2 + 24) = 1;
  }
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

void sub_1000092EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_100009310(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;

  v5 = (id *)(a1 + 56);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  LODWORD(v5) = objc_msgSend(WeakRetained, "contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:", v7, *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), v6);

  if ((_DWORD)v5)
    v8 = 3;
  else
    v8 = 5;
  (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v8);

}

void sub_100009730(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  id *v5;
  uint64_t v6;

  objc_destroyWeak(v5);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v6 - 112));
  _Unwind_Resume(a1);
}

void sub_100009798()
{
  JUMPOUT(0x100009788);
}

void sub_1000097A0(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  id WeakRetained;
  uint64_t (**v6)(_QWORD);
  void (**v7)(_QWORD, _QWORD, _QWORD);
  NSObject *v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint8_t buf[4];
  const __CFString *v13;

  v3 = a2;
  state = xpc_activity_get_state(v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (state == 2)
  {
    v6 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shouldDeferBlockForXPCActivity:", v3));
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "xpcActivitySetStateBlockForIdentifier:", CFSTR("com.apple.tipsd.postInstall-utility")));
    v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = CFSTR("com.apple.tipsd.postInstall-utility");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "1 to 5 minutes post install load event received: %@", buf, 0xCu);
    }

    if ((v6[2](v6) & 1) == 0)
      objc_msgSend(WeakRetained, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonUpgrade);
    if ((v6[2](v6) & 1) != 0)
    {
      v9 = 3;
    }
    else if (!*(_BYTE *)(a1 + 48)
           && (v10 = atomic_load(byte_1000261B0), (v10 & 1) != 0)
           && objc_msgSend(WeakRetained, "setupCompleted"))
    {
      LOBYTE(v11) = 0;
      objc_msgSend(WeakRetained, "updateContentWithActivity:identifier:preferredNotificationIdentifiers:multiuserModeOn:contextualEligibility:widgetEligibility:notificationEligibility:", v3, CFSTR("com.apple.tipsd.postInstall-utility"), 0, *(unsigned __int8 *)(a1 + 48), 1, 1, v11);
      if (v6[2](v6))
        v9 = 3;
      else
        v9 = 5;
    }
    else
    {
      v9 = 5;
    }
    ((void (**)(_QWORD, _xpc_activity_s *, uint64_t))v7)[2](v7, v3, v9);

  }
}

void sub_100009980(uint64_t a1, void *a2)
{
  xpc_activity_state_t state;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  _xpc_activity_s *v7;

  v7 = a2;
  state = xpc_activity_get_state(v7);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (state == 2)
  {
    objc_msgSend(WeakRetained, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonContentCheck);
    LOBYTE(v6) = 1;
    objc_msgSend(v5, "updateContentWithActivity:identifier:preferredNotificationIdentifiers:multiuserModeOn:contextualEligibility:widgetEligibility:notificationEligibility:", v7, CFSTR("com.apple.tipsd.update-content"), 0, *(unsigned __int8 *)(a1 + 40), 1, 1, v6);
  }

}

void sub_100009A18(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  id *WeakRetained;
  id *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint8_t v18[16];

  v3 = a2;
  state = xpc_activity_get_state(v3);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (state == 2)
  {
    if (!*(_BYTE *)(a1 + 40))
    {
      if (WeakRetained)
      {
        v7 = atomic_load(byte_1000261B0);
        if ((v7 & 1) != 0)
        {
          objc_msgSend(WeakRetained, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonAnalyticsMaintenance);
          if (objc_msgSend(v6, "setupCompleted"))
          {
            v8 = objc_alloc((Class)TPSAnalyticsProcessingController);
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[14], "tipStatusMap"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextualInfoMap"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[15], "eventsHistoryController"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextualEventsForIdentifiers"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tipsManager"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "experiment"));
            v16 = objc_msgSend(v8, "initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:", v10, v11, v13, v15);

            objc_msgSend(v16, "processAnalytics");
          }
        }
      }
    }
    if (!xpc_activity_set_state(v3, 5))
    {
      v17 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed setting activity state to done", v18, 2u);
      }

    }
  }

}

void sub_100009BD8(id a1, OS_xpc_object *a2)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;

  v2 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", kNSURLSessionLaunchOnDemandNotificationName));
    v4 = 138412290;
    v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ launch event received", (uint8_t *)&v4, 0xCu);

  }
}

void sub_100009CA0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  unsigned __int8 v8;
  const char *string;
  void *v10;
  unsigned int v11;
  NSObject *v12;
  int v13;
  void *v14;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.coreduetcontext.client_event_stream"));
    v13 = 138412290;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ launch event received", (uint8_t *)&v13, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (!*(_BYTE *)(a1 + 40))
  {
    if (WeakRetained)
    {
      v8 = atomic_load(byte_1000261B0);
      if ((v8 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "logDaemonActiveEventWithReason:", TPSAnalyticsDaemonActiveReasonDuet);
        string = xpc_dictionary_get_string(v3, "msgtype");
        if (string)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("notification"));

          if (v11)
          {
            if (xpc_dictionary_get_string(v3, "id"))
            {
              v12 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
                sub_1000147B8();

            }
          }
        }
      }
    }
  }

}

void sub_100009E50(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  BOOL v6;
  unsigned __int8 v7;
  NSString *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  NSObject *v24;
  _QWORD v25[2];
  uint8_t buf[4];
  void *v27;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (*(_BYTE *)(a1 + 48))
    v6 = 1;
  else
    v6 = WeakRetained == 0;
  if (!v6)
  {
    v7 = atomic_load(byte_1000261B0);
    if ((v7 & 1) != 0)
    {
      v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v3, _xpc_event_key_name));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "notifyd.matching event received %@", buf, 0xCu);
      }

      if (!objc_msgSend(v5, "tipsInValidState"))
        goto LABEL_29;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationTimingDarwinKey"));
      v12 = objc_msgSend(v9, "isEqualToString:", v11);

      if (v12)
      {
        if (objc_msgSend(v5, "setupCompleted"))
          objc_msgSend(v5, "showNewTipNotification");
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", BYSetupAssistantExitedDarwinNotification))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.language.changed")))
          {
            objc_msgSend(v5, "handleLanguageDidChangeNotification");
          }
          else
          {
            if (!objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobile.keybagd.first_unlock")))
            {
              if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.bluetooth.pairing")))
              {
                v18 = objc_claimAutoreleasedReturnValue(+[TPSTipsManager immediateNotificationIdentifierForType:](TPSTipsManager, "immediateNotificationIdentifierForType:", 0));
                v19 = (void *)objc_claimAutoreleasedReturnValue(+[TPSTipsManager immediateNotificationIdentifierForType:](TPSTipsManager, "immediateNotificationIdentifierForType:", 1));
                v25[0] = v19;
                v25[1] = v18;
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));

              }
              else
              {
                v21 = TPSHMManagerSpeakersConfiguredChangedNotificationString();
                v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
                v23 = objc_msgSend(v9, "isEqualToString:", v22);

                if (v23)
                {
                  v18 = objc_claimAutoreleasedReturnValue(+[TPSTipsManager immediateNotificationIdentifierForType:](TPSTipsManager, "immediateNotificationIdentifierForType:", 2));
                  v24 = v18;
                  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
                }
                else
                {
                  v18 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v27 = v9;
                    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Event %@ not handled", buf, 0xCu);
                  }
                  v20 = 0;
                }
              }

              objc_msgSend(v5, "immediateNotificationForIdentifiers:", v20);
              goto LABEL_29;
            }
            objc_msgSend(v5, "handleDeviceFirstUnlockNotification");
          }
LABEL_30:

          goto LABEL_31;
        }
        if (*(_BYTE *)(a1 + 48))
          exit(0);
        v13 = +[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines clientBundleIdentifier](TPSCommonDefines, "clientBundleIdentifier"));
        v15 = +[TPSCommonDefines isAppValidWithBundleIdentifier:](TPSCommonDefines, "isAppValidWithBundleIdentifier:", v14);

        v16 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v27) = v15;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "App state valid: %d", buf, 8u);
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "welcome"));
        objc_msgSend(v17, "createWelcomeXPCActivity");

      }
LABEL_29:
      objc_msgSend(v5, "unregisterDarwinNotification:", v9);
      goto LABEL_30;
    }
  }
LABEL_31:

}

void sub_10000A718(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "document"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notification image for %@ cache at %@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "prepareForNotifications");

}

void sub_10000A92C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_10000A950(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;

  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "correlationID"));

  v12 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v13)
    {
      v19 = 138413058;
      v20 = v10;
      v21 = 2112;
      v22 = v11;
      v23 = 2048;
      v24 = a3;
      v25 = 2112;
      v26 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to send a notification with identifier: %@ correlation id: %@, type: %ld with error: %@", (uint8_t *)&v19, 0x2Au);
    }

    if (objc_msgSend(v7, "code") == (id)4)
    {
      v14 = objc_msgSend(objc_alloc((Class)TPSAnalyticsEventTipNotDisplayed), "initWithTipID:correlationID:reason:context:", v10, v11, 5, 0);
      objc_msgSend(v14, "log");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "notificationController"));
      objc_msgSend(WeakRetained, "notificationController:markIdentifier:type:ineligibleWithReason:", v15, v10, a3, 5);

    }
    if (a3 != 3)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (v13)
  {
    v19 = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    v23 = 2048;
    v24 = a3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Sent a notification with identifier: %@ correlation id: %@, type: %ld", (uint8_t *)&v19, 0x20u);
  }

  switch(a3)
  {
    case 3:
      +[TPSTipsManager removeWelcomeDocumentCache](TPSTipsManager, "removeWelcomeDocumentCache");
LABEL_15:
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "welcome"));
      objc_msgSend(v16, "welcomeNotificationDisplayed");
LABEL_16:

      break;
    case 2:
      if (v11)
        v17 = v11;
      else
        v17 = v10;
      v18 = v17;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance"));
      objc_msgSend(v16, "hintDisplayedForContentID:", v18);

      goto LABEL_16;
    case 1:
      objc_msgSend(WeakRetained, "hintDisplayedForIdentifier:correlationID:context:", v10, v11, 0);
      break;
  }
LABEL_17:

}

void sub_10000ABE4(uint64_t a1)
{

}

void sub_10000ABEC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100014848();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Tips indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000ACA0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000148A8();

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userGuides"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSSearchItemIndexer default](TPSSearchItemIndexer, "default"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AD88;
  v8[3] = &unk_100020BB0;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v6, "indexUserGuides:qualityOfService:completionHandler:", v5, 9, v8);

}

void sub_10000AD88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger indexing](TPSLogger, "indexing"));
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000148D4();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "User Guide indexing completed successfully.", v6, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000B5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B600(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  unsigned int v9;
  id v10;

  v7 = a2;
  v8 = v7;
  if (a3)
  {
    v10 = v7;
    v9 = objc_msgSend(v7, "intValue");
    v8 = v10;
    if (v9)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      *a4 = 1;
    }
  }

}

void sub_10000B95C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assistantConnections"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

void sub_10000BA60(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "assistantConnections"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void sub_10000BB64(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "assistantConnections"));
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assistantConnections"));
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

      WeakRetained = v6;
    }
  }

}

void sub_10000BCA0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assistantConnections"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

}

void sub_10000BDA4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoverabilityConnections"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));

}

void sub_10000BEA8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "discoverabilityConnections"));
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "discoverabilityConnections"));
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

      WeakRetained = v6;
    }
  }

}

void sub_10000BFEC(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 32))
  {
    v6 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "appConnections"));
    v4 = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "invalidate");
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appConnections"));
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

      WeakRetained = v6;
    }
  }

}

void sub_10000C078(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAssistantXPCConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device Expert xpc connection invalidated", v5, 2u);
  }

}

void sub_10000C114(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeAppXPCConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "App xpc connection invalidated", v5, 2u);
  }

}

void sub_10000C1B0(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "standard access connection invalidated", v2, 2u);
  }

}

void sub_10000C21C(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_removeDiscoverabilityXPCConnection:", v3);

  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Discoverability xpc connection invalidated", v5, 2u);
  }

}

void sub_10000C2B8(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "xpc connection from client interrupted!", v2, 2u);
  }

}

void sub_10000CB70(id a1, TPSContentPackage *a2, NSError *a3)
{
  NSError *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSError *v12;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "Failed to update content for language change. Error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "Successfully updated content for language change";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean(v9, v10);
}

void sub_10000CD14(id a1, TPSContentPackage *a2, NSError *a3)
{
  NSError *v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  NSError *v12;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "Failed to reregister event registration. Error: %@";
      v7 = v4;
      v8 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, v8);
    }
  }
  else if (v5)
  {
    LOWORD(v11) = 0;
    v6 = "Successfully registered events from first unlock notification";
    v7 = v4;
    v8 = 2;
    goto LABEL_6;
  }

  xpc_transaction_exit_clean(v9, v10);
}

void sub_10000D084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D0A8(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[16];
  _BYTE v28[128];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "notificationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "notificationCache"));

  if (!v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No document found to notify.", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionMap"));
    v21 = v3;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tipMap"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v14));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
            objc_msgSend(v16, "activatedCollections:", v17);

            v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCloudController sharedInstance](TPSCloudController, "sharedInstance"));
            objc_msgSend(v18, "hintDisplayedForContentID:", v14);
          }
          else
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v14));
            v18 = v19;
            if (v19)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "correlationID"));
              objc_msgSend(WeakRetained, "hintDisplayedForIdentifier:correlationID:context:", v14, v20, 0);

            }
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    v3 = v21;
    v6 = 0;
  }
  objc_msgSend(WeakRetained, "updateNotificationStatus");

}

void sub_10000D4FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D518(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tipsManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "processUserGuidesFromContentPackage:", v6));

  if (v5)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "User guide map may be missing items due to %@", (uint8_t *)&v11, 0xCu);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10000D748(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  if (v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100014CA8(a1, v5, v7);
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    v7 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v16 = 138412290;
        v17 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Downloaded remote tip %@", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      sub_100014C40(a1, v7, v10, v11, v12, v13, v14, v15);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000DB0C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "error"));
  v3 = 32;
  if (!v2)
    v3 = 40;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + v3), "error"));

  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100014DBC(a1, v5, v6, v7, v8, v9, v10, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v12 = objc_alloc((Class)TPSAssetsInfo);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "assetIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadedURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assetIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadedURL"));
    v17 = objc_msgSend(v12, "initWithVideoIdentifier:videoURL:imageIdentifier:imageURL:", v13, v14, v15, v16);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_10000ED60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10000ED8C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12);
        if (v6)
        {
          v14 = 0;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "miniTipMetadataForContent:bundleID:context:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v21));
          v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
          if (v15)
            v16 = 1;
          else
            v16 = v14 == 0;
          if (v16)
          {
            v6 = (id)v15;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "addObject:", v14);
            v6 = 0;
          }
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier", (_QWORD)v21));
        objc_msgSend(WeakRetained, "donateContentRetrieved:bundleID:context:error:", v17, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v6);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18 = *(void **)(a1 + 56);
  v19 = *(_QWORD *)(a1 + 64);
  if (v18)
  {
    v20 = objc_msgSend(v18, "copy");
    (*(void (**)(uint64_t, id, id))(v19 + 16))(v19, v20, v6);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, id))(v19 + 16))(*(_QWORD *)(a1 + 64), 0, v6);
  }

}

void sub_10000F188(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000F244;
  v10[3] = &unk_100020E50;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

}

void sub_10000F244(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tipsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "welcomeCollectionFromContentPackage:", *(_QWORD *)(a1 + 40)));

  if (v3
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "notification")), v4, v4)
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "language")),
        v6 = +[TPSTipsManager deviceLocalesContainLanguage:](TPSTipsManager, "deviceLocalesContainLanguage:", v5), v5, (v6 & 1) == 0))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No proper translated content found for the device.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger daemon](TPSLogger, "daemon"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "collectionMap"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSCommonDefines sharedInstance](TPSCommonDefines, "sharedInstance"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionIdentifierForCurrentUserType"));
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to display welcome notification because collection map %@ does not contain proper notification for collection %@", (uint8_t *)&v12, 0x16u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void sub_10001007C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100010094(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000100B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1000100D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;

  qword_100026860 = 0;
  qword_100026868 = 0;
  qword_100026870 = 0;
  v3 = objc_autoreleasePoolPush();
  sub_100010260();
  objc_autoreleasePoolPop(v3);
  v4 = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  objc_msgSend(v4, "run");

  return 0;
}

id sub_100010260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSString *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  NSString v12;
  id v13;
  void *v14;
  id result;
  id v16;
  NSString v17;
  id v18;
  void *v19;
  Swift::String v20;
  Swift::String v21;
  void *object;
  unint64_t v23;
  _DWORD v24[4];
  uint64_t v25;
  unint64_t v26;

  v0 = type metadata accessor for TipsLog(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin();
  v3 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!_set_user_dir_suffix("com.apple.tipsd"))
  {
    static TipsLog.default.getter();
    v25 = 0;
    v26 = 0xE000000000000000;
    _StringGuts.grow(_:)(59);
    v20._countAndFlagsBits = 0xD000000000000039;
    v20._object = (void *)0x8000000100019160;
    String.append(_:)(v20);
    v24[3] = errno.getter();
    v21._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int32, &protocol witness table for Int32);
    object = v21._object;
    String.append(_:)(v21);
    swift_bridgeObjectRelease(object);
    v23 = v26;
    logError(_:_:)(v3, v25, v26);
    swift_bridgeObjectRelease(v23);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    abort();
  }
  v4 = NSTemporaryDirectory();
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  swift_bridgeObjectRelease(v7);
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  if (!v8
    || objc_msgSend((id)objc_opt_self(TPSCommonDefines), "isInternalDevice")
    && (objc_msgSend((id)objc_opt_self(TPSDaemonCLIHandler), "run") & 1) != 0)
  {
    exit(0);
  }
  v9 = objc_msgSend(objc_allocWithZone((Class)TPSDaemon), "init");
  v10 = (void *)qword_100026860;
  qword_100026860 = (uint64_t)v9;

  v11 = objc_allocWithZone((Class)NSXPCListener);
  v12 = String._bridgeToObjectiveC()();
  v13 = objc_msgSend(v11, "initWithMachServiceName:", v12);

  v14 = (void *)qword_100026868;
  qword_100026868 = (uint64_t)v13;

  if (qword_100026868)
  {
    objc_msgSend((id)qword_100026868, "setDelegate:", qword_100026860);
    if (qword_100026868)
      objc_msgSend((id)qword_100026868, "resume");
  }
  result = objc_msgSend((id)objc_opt_self(TPSFeatureFlags), "allowsDE");
  if ((_DWORD)result)
  {
    v16 = objc_allocWithZone((Class)NSXPCListener);
    v17 = String._bridgeToObjectiveC()();
    v18 = objc_msgSend(v16, "initWithMachServiceName:", v17);

    v19 = (void *)qword_100026870;
    qword_100026870 = (uint64_t)v18;

    result = (id)qword_100026870;
    if (qword_100026870)
    {
      objc_msgSend((id)qword_100026870, "setDelegate:", qword_100026860);
      result = (id)qword_100026870;
      if (qword_100026870)
        return objc_msgSend((id)qword_100026870, "resume");
    }
  }
  return result;
}

BOOL sub_100010558(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001056C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000105B0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000105D8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t TPSDaemon.findMatchingResultId(from:reply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  Swift::String v16;
  void *object;
  unint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  unint64_t v30;
  unint64_t v31;

  v29[0] = a2;
  sub_1000108E8(&qword_1000267C0);
  ((void (*)(void))__chkstk_darwin)();
  v6 = (char *)v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TipsLog(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))__chkstk_darwin)();
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __chkstk_darwin(v9);
  v14 = (char *)v29 - v13;
  static TipsLog.default.getter(v12);
  v30 = 0;
  v31 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease(v31);
  v30 = 0xD00000000000001ELL;
  v31 = 0x80000001000191C0;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v28 = a1;
    else
      v28 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v15 = _CocoaArrayWrapper.endIndex.getter(v28);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v29[1] = v15;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  v18 = v31;
  logDebug(_:_:)(v14, v30, v31);
  swift_bridgeObjectRelease(v18);
  v19 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
  v20 = v19(v14, v7);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v26 = a1;
    else
      v26 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v27 = _CocoaArrayWrapper.endIndex.getter(v26);
    v20 = swift_bridgeObjectRelease(a1);
    if (v27)
      goto LABEL_5;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    v21 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v6, 1, 1, v21);
    v22 = (_QWORD *)swift_allocObject(&unk_100020F88, 56, 7);
    v22[2] = 0;
    v22[3] = 0;
    v23 = v29[0];
    v22[4] = a1;
    v22[5] = v23;
    v22[6] = a3;
    swift_bridgeObjectRetain(a1);
    swift_retain(a3);
    v24 = sub_100012434((uint64_t)v6, (uint64_t)&unk_1000267D0, (uint64_t)v22);
    return swift_release(v24);
  }
  static TipsLog.targeting.getter(v20);
  log(_:_:)(v11, 0xD000000000000028, 0x80000001000191E0);
  v19(v11, v7);
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v29[0])(0, 0, 0);
}

uint64_t sub_1000108E8(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_100010928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v6[34] = a5;
  v6[35] = a6;
  v6[33] = a4;
  v7 = type metadata accessor for TipsLog(0);
  v6[36] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[37] = v8;
  v9 = (*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v6[38] = swift_task_alloc(v9);
  v6[39] = swift_task_alloc(v9);
  return swift_task_switch(sub_10001099C, 0, 0);
}

uint64_t sub_10001099C()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  Swift::String v16;
  Swift::String v17;
  void *object;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  id v22;
  Class isa;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  Swift::String v30;
  void *v31;
  Swift::String v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  Swift::String v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  Class v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  NSString v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v1 = *(_QWORD *)(v0 + 264);
  *(_QWORD *)(v0 + 320) = objc_msgSend(objc_allocWithZone((Class)TPSTargetingCache), "init");
  v2 = *(id *)(v0 + 264);
  if (!(v1 >> 62))
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v2);
    *(_QWORD *)(v0 + 328) = v3;
    if (v3)
      goto LABEL_3;
LABEL_21:
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
    v43 = 0;
    v45 = 0;
    v46 = 0;
LABEL_22:
    v65 = *(_QWORD *)(v0 + 312);
    v66 = *(void **)(v0 + 320);
    v67 = *(_QWORD *)(v0 + 304);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 272))(v43, v45, 0);

    swift_bridgeObjectRelease(v45);
    swift_task_dealloc(v65);
    swift_task_dealloc(v67);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
LABEL_17:
  if ((uint64_t)v2 < 0)
    v63 = (uint64_t)v2;
  else
    v63 = v1 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v64 = _CocoaArrayWrapper.endIndex.getter(v63);
  *(_QWORD *)(v0 + 328) = v64;
  if (!v64)
    goto LABEL_21;
LABEL_3:
  v1 = 0;
  while (1)
  {
    v4 = *(_QWORD *)(v0 + 264);
    if ((v4 & 0xC000000000000001) != 0)
      v2 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v1);
    else
      v2 = *(id *)(v4 + 8 * v1 + 32);
    v5 = v2;
    *(_QWORD *)(v0 + 336) = v2;
    *(_QWORD *)(v0 + 344) = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
      goto LABEL_17;
    }
    v6 = ResultContext.conditions.getter();
    *(_QWORD *)(v0 + 352) = 0;
    v7 = v6;
    v8 = *(_QWORD *)(v0 + 312);
    v10 = *(_QWORD *)(v0 + 288);
    v9 = *(_QWORD *)(v0 + 296);
    static TipsLog.targeting.getter(v6);
    *(_QWORD *)(v0 + 176) = 0;
    *(_QWORD *)(v0 + 184) = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    v11 = *(_QWORD *)(v0 + 184);
    v13 = ResultContext.resultId.getter(v12);
    v15 = v14;
    swift_bridgeObjectRelease(v11);
    *(_QWORD *)(v0 + 160) = v13;
    *(_QWORD *)(v0 + 168) = v15;
    v16._countAndFlagsBits = 0xD000000000000022;
    v16._object = (void *)0x8000000100019310;
    String.append(_:)(v16);
    v17._countAndFlagsBits = Dictionary.description.getter(v7, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    object = v17._object;
    String.append(_:)(v17);
    swift_bridgeObjectRelease(object);
    v19 = *(_QWORD *)(v0 + 168);
    logDebug(_:_:)(v8, *(_QWORD *)(v0 + 160), v19);
    swift_bridgeObjectRelease(v19);
    v20 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    *(_QWORD *)(v0 + 360) = v20;
    v20(v8, v10);
    if (!*(_QWORD *)(v7 + 16))
    {
      v34 = *(_QWORD *)(v0 + 312);
      v35 = *(_QWORD *)(v0 + 288);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
      v36 = swift_bridgeObjectRelease(v7);
      static TipsLog.targeting.getter(v36);
      _StringGuts.grow(_:)(29);
      v38 = ResultContext.resultId.getter(v37);
      v40 = v39;
      swift_bridgeObjectRelease(0xE000000000000000);
      v41._object = (void *)0x80000001000193A0;
      v41._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v41);
      log(_:_:)(v34, v38, v40);
      swift_bridgeObjectRelease(v40);
      v20(v34, v35);
      v42 = *(id *)(v0 + 336);
      v43 = ResultContext.resultId.getter(v42);
      v45 = v44;

      v46 = *(void **)(v0 + 336);
      goto LABEL_22;
    }
    v21 = sub_100011FF0(v7);
    swift_bridgeObjectRelease(v7);
    v22 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v21);
    v24 = objc_msgSend(v22, "initWithDictionary:", isa);
    *(_QWORD *)(v0 + 368) = v24;

    if (v24)
      break;
    v26 = *(_QWORD *)(v0 + 312);
    v27 = *(_QWORD *)(v0 + 288);
    static TipsLog.targeting.getter(v25);
    *(_QWORD *)(v0 + 208) = 0;
    *(_QWORD *)(v0 + 216) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v28 = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(v0 + 208);
    *(_QWORD *)(v0 + 152) = v28;
    v30._countAndFlagsBits = ResultContext.resultId.getter(v29);
    v31 = v30._object;
    String.append(_:)(v30);
    swift_bridgeObjectRelease(v31);
    v32._countAndFlagsBits = 0xD000000000000038;
    v32._object = (void *)0x8000000100019340;
    String.append(_:)(v32);
    v33 = *(_QWORD *)(v0 + 152);
    logError(_:_:)(v26, *(_QWORD *)(v0 + 144), v33);

    swift_bridgeObjectRelease(v33);
    v20(v26, v27);
    v1 = *(_QWORD *)(v0 + 344);
    if (v1 == *(_QWORD *)(v0 + 328))
      goto LABEL_21;
  }
  v47 = objc_msgSend(v24, "conditions");
  v48 = sub_100014594(0, &qword_100026838, TPSCondition_ptr);
  v49 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v47, v48);

  if ((unint64_t)v49 >> 62)
  {
    if (v49 < 0)
      v68 = v49;
    else
      v68 = v49 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v49);
    v69 = sub_1000108E8(&qword_100026840);
    v51 = _bridgeCocoaArray<A>(_:)(v68, v69);
    swift_bridgeObjectRelease(v49);
  }
  else
  {
    v50 = swift_bridgeObjectRetain(v49);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v50);
    v51 = v49;
  }
  v52 = v0 + 16;
  v53 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v49);
  v54 = (void *)objc_opt_self(TPSTargetingValidator);
  sub_1000108E8(&qword_100026840);
  v55 = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 376) = v55;
  swift_bridgeObjectRelease(v51);
  v56 = objc_msgSend(v24, "joinType");
  ResultContext.resultId.getter(v56);
  v58 = v57;
  v59 = String._bridgeToObjectiveC()();
  *(_QWORD *)(v0 + 384) = v59;
  swift_bridgeObjectRelease(v58);
  *(_QWORD *)(v0 + 56) = v0 + 400;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_1000110A0;
  v60 = swift_continuation_init(v0 + 16, 1);
  *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
  v61 = (_QWORD *)(v0 + 80);
  v61[1] = 0x40000000;
  v61[2] = sub_1000123B4;
  v61[3] = &unk_1000210F8;
  v61[4] = v60;
  objc_msgSend(v54, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v55, v56, v59, v53, 0, v61);
  return swift_continuation_await(v52);
}

uint64_t sub_1000110A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 392) = v1;
  if (v1)
    v2 = sub_100011884;
  else
    v2 = sub_100011100;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100011100()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Swift::String v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::String v32;
  void *object;
  Swift::String v34;
  Swift::String v35;
  void *v36;
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  Swift::String v52;
  Swift::String v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  Class isa;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  Swift::String v64;
  void *v65;
  Swift::String v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  Swift::String v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  Class v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  NSString v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;

  v2 = *(void **)(v0 + 376);
  v1 = *(void **)(v0 + 384);
  v3 = *(_QWORD *)(v0 + 360);
  v4 = *(void **)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 304);
  v6 = *(_QWORD *)(v0 + 288);
  v7 = *(unsigned __int8 *)(v0 + 400);

  v9 = static TipsLog.targeting.getter(v8);
  *(_QWORD *)(v0 + 224) = ResultContext.resultId.getter(v9);
  *(_QWORD *)(v0 + 232) = v10;
  v11._countAndFlagsBits = 32;
  v11._object = (void *)0xE100000000000000;
  String.append(_:)(v11);
  if (v7)
    v12 = 0x6465686374616DLL;
  else
    v12 = 0x6374616D20746F6ELL;
  if (v7)
    v13 = 0xE700000000000000;
  else
    v13 = 0xEB00000000646568;
  v14 = v13;
  String.append(_:)(*(Swift::String *)&v12);
  swift_bridgeObjectRelease(v13);
  v15 = *(_QWORD *)(v0 + 232);
  log(_:_:)(v5, *(_QWORD *)(v0 + 224), v15);
  swift_bridgeObjectRelease(v15);

  ((void (*)(uint64_t, uint64_t))v3)(v5, v6);
  if ((v7 & 1) != 0)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
LABEL_9:
    v16 = *(id *)(v0 + 336);
    v17 = ResultContext.resultId.getter(v16);
    v19 = v18;

    v20 = *(void **)(v0 + 336);
    goto LABEL_12;
  }

  v21 = *(_QWORD *)(v0 + 344);
  if (v21 == *(_QWORD *)(v0 + 328))
  {
LABEL_11:
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
    v17 = 0;
    v19 = 0;
    v20 = 0;
LABEL_12:
    v22 = *(_QWORD *)(v0 + 312);
    v23 = *(void **)(v0 + 320);
    v24 = *(_QWORD *)(v0 + 304);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 272))(v17, v19, 0);

    swift_bridgeObjectRelease(v19);
    swift_task_dealloc(v22);
    swift_task_dealloc(v24);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v26 = *(id *)(v0 + 352);
  while (1)
  {
    v39 = *(_QWORD *)(v0 + 264);
    if ((v39 & 0xC000000000000001) != 0)
      v40 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v21);
    else
      v40 = *(id *)(v39 + 8 * v21 + 32);
    v41 = v40;
    *(_QWORD *)(v0 + 336) = v40;
    *(_QWORD *)(v0 + 344) = v21 + 1;
    if (__OFADD__(v21, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    v42 = ResultContext.conditions.getter();
    *(_QWORD *)(v0 + 352) = v26;
    if (!v26)
      break;
    v27 = *(void **)(v0 + 336);
    v28 = *(_QWORD *)(v0 + 312);
    v29 = *(_QWORD *)(v0 + 288);
    v3 = *(_QWORD *)(v0 + 296);
    static TipsLog.targeting.getter(v42);
    *(_QWORD *)(v0 + 240) = 0;
    *(_QWORD *)(v0 + 248) = 0xE000000000000000;
    _StringGuts.grow(_:)(53);
    v30 = *(_QWORD *)(v0 + 248);
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 240);
    *(_QWORD *)(v0 + 200) = v30;
    v32._countAndFlagsBits = ResultContext.resultId.getter(v31);
    object = v32._object;
    String.append(_:)(v32);
    swift_bridgeObjectRelease(object);
    v34._countAndFlagsBits = 0xD000000000000026;
    v34._object = (void *)0x80000001000192E0;
    String.append(_:)(v34);
    swift_getErrorValue(v26, v0 + 256, v0 + 120);
    v35._countAndFlagsBits = Error.localizedDescription.getter(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
    v36 = v35._object;
    String.append(_:)(v35);
    swift_bridgeObjectRelease(v36);
    v37._countAndFlagsBits = 0x697070696B53202ELL;
    v37._object = (void *)0xEB000000002E676ELL;
    String.append(_:)(v37);
    v38 = *(_QWORD *)(v0 + 200);
    logError(_:_:)(v28, *(_QWORD *)(v0 + 192), v38);

    swift_bridgeObjectRelease(v38);
    swift_errorRelease(v26);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v28, v29);
LABEL_15:
    v26 = 0;
    v21 = *(_QWORD *)(v0 + 344);
    if (v21 == *(_QWORD *)(v0 + 328))
      goto LABEL_11;
  }
  v43 = v42;
  v44 = *(_QWORD *)(v0 + 312);
  v46 = *(_QWORD *)(v0 + 288);
  v45 = *(_QWORD *)(v0 + 296);
  static TipsLog.targeting.getter(v42);
  *(_QWORD *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = 0xE000000000000000;
  _StringGuts.grow(_:)(38);
  v47 = *(_QWORD *)(v0 + 184);
  v49 = ResultContext.resultId.getter(v48);
  v51 = v50;
  swift_bridgeObjectRelease(v47);
  *(_QWORD *)(v0 + 160) = v49;
  *(_QWORD *)(v0 + 168) = v51;
  v52._countAndFlagsBits = 0xD000000000000022;
  v52._object = (void *)0x8000000100019310;
  String.append(_:)(v52);
  v53._countAndFlagsBits = Dictionary.description.getter(v43, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v54 = v53._object;
  String.append(_:)(v53);
  swift_bridgeObjectRelease(v54);
  v55 = *(_QWORD *)(v0 + 168);
  logDebug(_:_:)(v44, *(_QWORD *)(v0 + 160), v55);
  swift_bridgeObjectRelease(v55);
  v3 = *(_QWORD *)(v45 + 8);
  *(_QWORD *)(v0 + 360) = v3;
  ((void (*)(uint64_t, uint64_t))v3)(v44, v46);
  if (!*(_QWORD *)(v43 + 16))
  {
    v68 = *(_QWORD *)(v0 + 312);
    v69 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
    v70 = swift_bridgeObjectRelease(v43);
    static TipsLog.targeting.getter(v70);
    _StringGuts.grow(_:)(29);
    v72 = ResultContext.resultId.getter(v71);
    v74 = v73;
    swift_bridgeObjectRelease(0xE000000000000000);
    v75._object = (void *)0x80000001000193A0;
    v75._countAndFlagsBits = 0xD00000000000001BLL;
    String.append(_:)(v75);
    log(_:_:)(v68, v72, v74);
    swift_bridgeObjectRelease(v74);
    ((void (*)(uint64_t, uint64_t))v3)(v68, v69);
    goto LABEL_9;
  }
  v56 = sub_100011FF0(v43);
  swift_bridgeObjectRelease(v43);
  v57 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v56);
  v26 = objc_msgSend(v57, "initWithDictionary:", isa);
  *(_QWORD *)(v0 + 368) = v26;

  if (!v26)
  {
    v60 = *(_QWORD *)(v0 + 312);
    v61 = *(_QWORD *)(v0 + 288);
    static TipsLog.targeting.getter(v59);
    *(_QWORD *)(v0 + 208) = 0;
    *(_QWORD *)(v0 + 216) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v62 = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(v0 + 208);
    *(_QWORD *)(v0 + 152) = v62;
    v64._countAndFlagsBits = ResultContext.resultId.getter(v63);
    v65 = v64._object;
    String.append(_:)(v64);
    swift_bridgeObjectRelease(v65);
    v66._countAndFlagsBits = 0xD000000000000038;
    v66._object = (void *)0x8000000100019340;
    String.append(_:)(v66);
    v67 = *(_QWORD *)(v0 + 152);
    logError(_:_:)(v60, *(_QWORD *)(v0 + 144), v67);

    swift_bridgeObjectRelease(v67);
    ((void (*)(uint64_t, uint64_t))v3)(v60, v61);
    goto LABEL_15;
  }
  v76 = objc_msgSend(v26, "conditions");
  v77 = sub_100014594(0, &qword_100026838, TPSCondition_ptr);
  v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v76, v77);

  if (!((unint64_t)v3 >> 62))
  {
    v78 = swift_bridgeObjectRetain(v3);
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v78);
    v79 = v3;
    goto LABEL_27;
  }
LABEL_29:
  if (v3 < 0)
    v90 = v3;
  else
    v90 = v3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v3);
  v91 = sub_1000108E8(&qword_100026840);
  v79 = _bridgeCocoaArray<A>(_:)(v90, v91);
  swift_bridgeObjectRelease(v3);
LABEL_27:
  v80 = v0 + 16;
  v81 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v3);
  v82 = (void *)objc_opt_self(TPSTargetingValidator);
  sub_1000108E8(&qword_100026840);
  v83 = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 376) = v83;
  swift_bridgeObjectRelease(v79);
  v84 = objc_msgSend(v26, "joinType");
  ResultContext.resultId.getter(v84);
  v86 = v85;
  v87 = String._bridgeToObjectiveC()();
  *(_QWORD *)(v0 + 384) = v87;
  swift_bridgeObjectRelease(v86);
  *(_QWORD *)(v0 + 56) = v0 + 400;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_1000110A0;
  v88 = swift_continuation_init(v0 + 16, 1);
  *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
  v89 = (_QWORD *)(v0 + 80);
  v89[1] = 0x40000000;
  v89[2] = sub_1000123B4;
  v89[3] = &unk_1000210F8;
  v89[4] = v88;
  objc_msgSend(v82, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v83, v84, v87, v81, 0, v89);
  return swift_continuation_await(v80);
}

uint64_t sub_100011884()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::String v13;
  void *object;
  Swift::String v15;
  Swift::String v16;
  void *v17;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  Swift::String v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, id);
  uint64_t v40;
  id v41;
  Class isa;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  Swift::String v47;
  void *v48;
  Swift::String v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  Swift::String v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  Class v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  NSString v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;

  v1 = *(void **)(v0 + 384);
  v3 = *(void **)(v0 + 368);
  v2 = *(void **)(v0 + 376);
  v4 = *(void **)(v0 + 320);
  swift_willThrow();

  v5 = v0 + 120;
  v6 = *(id *)(v0 + 392);
  v7 = *(void **)(v0 + 336);
  v8 = *(_QWORD *)(v0 + 312);
  v9 = *(_QWORD *)(v0 + 296);
  v84 = *(_QWORD *)(v0 + 288);
  static TipsLog.targeting.getter(v10);
  *(_QWORD *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = 0xE000000000000000;
  _StringGuts.grow(_:)(53);
  v11 = *(_QWORD *)(v0 + 248);
  *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 240);
  *(_QWORD *)(v0 + 200) = v11;
  v13._countAndFlagsBits = ResultContext.resultId.getter(v12);
  object = v13._object;
  String.append(_:)(v13);
  swift_bridgeObjectRelease(object);
  v15._countAndFlagsBits = 0xD000000000000026;
  v15._object = (void *)0x80000001000192E0;
  String.append(_:)(v15);
  swift_getErrorValue(v6, v0 + 256, v0 + 120);
  v16._countAndFlagsBits = Error.localizedDescription.getter(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  v17 = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(v17);
  v18._countAndFlagsBits = 0x697070696B53202ELL;
  v18._object = (void *)0xEB000000002E676ELL;
  String.append(_:)(v18);
  v19 = *(_QWORD *)(v0 + 200);
  logError(_:_:)(v8, *(_QWORD *)(v0 + 192), v19);

  swift_bridgeObjectRelease(v19);
  swift_errorRelease(v6);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v84);
  while (1)
  {
    v20 = *(_QWORD *)(v0 + 344);
    if (v20 == *(_QWORD *)(v0 + 328))
    {
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
      v51 = 0;
      v52 = 0;
      v53 = 0;
LABEL_12:
      v64 = *(_QWORD *)(v0 + 312);
      v65 = *(void **)(v0 + 320);
      v66 = *(_QWORD *)(v0 + 304);
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 272))(v51, v52, 0);

      swift_bridgeObjectRelease(v52);
      swift_task_dealloc(v64);
      swift_task_dealloc(v66);
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v21 = *(_QWORD *)(v0 + 264);
    v22 = (v21 & 0xC000000000000001) != 0
        ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(*(_QWORD *)(v0 + 344))
        : *(id *)(v21 + 8 * v20 + 32);
    v23 = v22;
    *(_QWORD *)(v0 + 336) = v22;
    *(_QWORD *)(v0 + 344) = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    v24 = ResultContext.conditions.getter();
    *(_QWORD *)(v0 + 352) = 0;
    v25 = v24;
    v26 = *(_QWORD *)(v0 + 312);
    v27 = v23;
    v28 = *(void **)(v0 + 288);
    v29 = *(_QWORD *)(v0 + 296);
    static TipsLog.targeting.getter(v24);
    *(_QWORD *)(v0 + 176) = 0;
    *(_QWORD *)(v0 + 184) = 0xE000000000000000;
    _StringGuts.grow(_:)(38);
    v30 = *(_QWORD *)(v0 + 184);
    v85 = v27;
    v32 = ResultContext.resultId.getter(v31);
    v34 = v33;
    swift_bridgeObjectRelease(v30);
    *(_QWORD *)(v0 + 160) = v32;
    *(_QWORD *)(v0 + 168) = v34;
    v35._countAndFlagsBits = 0xD000000000000022;
    v35._object = (void *)0x8000000100019310;
    String.append(_:)(v35);
    v36._countAndFlagsBits = Dictionary.description.getter(v25, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v37 = v36._object;
    String.append(_:)(v36);
    swift_bridgeObjectRelease(v37);
    v38 = *(_QWORD *)(v0 + 168);
    logDebug(_:_:)(v26, *(_QWORD *)(v0 + 160), v38);
    swift_bridgeObjectRelease(v38);
    v39 = *(void (**)(uint64_t, id))(v29 + 8);
    *(_QWORD *)(v0 + 360) = v39;
    v39(v26, v28);
    if (!*(_QWORD *)(v25 + 16))
    {
      v54 = *(_QWORD *)(v0 + 312);
      v55 = *(void **)(v0 + 288);
      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 264));
      v56 = swift_bridgeObjectRelease(v25);
      static TipsLog.targeting.getter(v56);
      _StringGuts.grow(_:)(29);
      v58 = ResultContext.resultId.getter(v57);
      v60 = v59;
      swift_bridgeObjectRelease(0xE000000000000000);
      v61._object = (void *)0x80000001000193A0;
      v61._countAndFlagsBits = 0xD00000000000001BLL;
      String.append(_:)(v61);
      log(_:_:)(v54, v58, v60);
      swift_bridgeObjectRelease(v60);
      v39(v54, v55);
      v62 = *(id *)(v0 + 336);
      v51 = ResultContext.resultId.getter(v62);
      v52 = v63;

      v53 = *(void **)(v0 + 336);
      goto LABEL_12;
    }
    v40 = sub_100011FF0(v25);
    swift_bridgeObjectRelease(v25);
    v41 = objc_allocWithZone((Class)TPSDeliveryPrecondition);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v40);
    v6 = objc_msgSend(v41, "initWithDictionary:", isa);
    *(_QWORD *)(v0 + 368) = v6;

    if (v6)
    {
      v68 = objc_msgSend(v6, "conditions");
      v69 = sub_100014594(0, &qword_100026838, TPSCondition_ptr);
      v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v68, v69);

      if ((unint64_t)v5 >> 62)
        goto LABEL_17;
      v70 = swift_bridgeObjectRetain(v5);
      dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v70);
      v71 = v5;
      goto LABEL_15;
    }
    v44 = *(_QWORD *)(v0 + 312);
    v6 = *(id *)(v0 + 288);
    static TipsLog.targeting.getter(v43);
    *(_QWORD *)(v0 + 208) = 0;
    *(_QWORD *)(v0 + 216) = 0xE000000000000000;
    _StringGuts.grow(_:)(58);
    v45 = *(_QWORD *)(v0 + 216);
    *(_QWORD *)(v0 + 144) = *(_QWORD *)(v0 + 208);
    *(_QWORD *)(v0 + 152) = v45;
    v47._countAndFlagsBits = ResultContext.resultId.getter(v46);
    v48 = v47._object;
    String.append(_:)(v47);
    swift_bridgeObjectRelease(v48);
    v49._countAndFlagsBits = 0xD000000000000038;
    v49._object = (void *)0x8000000100019340;
    String.append(_:)(v49);
    v50 = *(_QWORD *)(v0 + 152);
    logError(_:_:)(v44, *(_QWORD *)(v0 + 144), v50);

    swift_bridgeObjectRelease(v50);
    v39(v44, v6);
  }
  __break(1u);
LABEL_17:
  if (v5 < 0)
    v82 = v5;
  else
    v82 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v83 = sub_1000108E8(&qword_100026840);
  v71 = _bridgeCocoaArray<A>(_:)(v82, v83);
  swift_bridgeObjectRelease(v5);
LABEL_15:
  v72 = v0 + 16;
  v73 = *(void **)(v0 + 320);
  swift_bridgeObjectRelease(v5);
  v74 = (void *)objc_opt_self(TPSTargetingValidator);
  sub_1000108E8(&qword_100026840);
  v75 = Array._bridgeToObjectiveC()().super.isa;
  *(_QWORD *)(v0 + 376) = v75;
  swift_bridgeObjectRelease(v71);
  v76 = objc_msgSend(v6, "joinType");
  ResultContext.resultId.getter(v76);
  v78 = v77;
  v79 = String._bridgeToObjectiveC()();
  *(_QWORD *)(v0 + 384) = v79;
  swift_bridgeObjectRelease(v78);
  *(_QWORD *)(v0 + 56) = v0 + 400;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_1000110A0;
  v80 = swift_continuation_init(v0 + 16, 1);
  *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
  v81 = (_QWORD *)(v0 + 80);
  v81[1] = 0x40000000;
  v81[2] = sub_1000123B4;
  v81[3] = &unk_1000210F8;
  v81[4] = v80;
  objc_msgSend(v74, "validateConditions:joinType:context:cache:completionQueue:completionHandler:", v75, v76, v79, v73, 0, v81);
  return swift_continuation_await(v72);
}

uint64_t sub_100011F70(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_1000267CC);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1000147B0;
  return sub_100010928(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100011FF0(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000108E8(&qword_100026848);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_100014480(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_1000145CC(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_1000145CC(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_1000145CC(v37, v38);
    sub_1000145CC(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_1000145CC(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_1000145DC(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000123B4(uint64_t a1, char a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_1000108E8(&qword_100026810);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_100012434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000144C0(a1);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_1000210E0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100026830, v16);
}

void sub_1000125F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSString v6;
  uint64_t v7;
  id v8;

  if (!a2)
  {
    v6 = 0;
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = String._bridgeToObjectiveC()();
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = _convertErrorToNSError(_:)(a3);
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, NSString))(a4 + 16))(a4, v6);

}

uint64_t TPSDaemon.availableUserGuideIdentifiers(reply:)(uint64_t (*a1)(void *))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *);

  if (!objc_msgSend((id)objc_opt_self(TPSCommonDefines), "supportsUserGuide"))
    return a1(&_swiftEmptyArrayStorage);
  type metadata accessor for UserGuideManager(0);
  v2 = static UserGuideManager.userGuides()();
  v3 = v2;
  if (!((unint64_t)v2 >> 62))
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain(v2);
    v17 = (void (*)(char *))a1;
    if (v4)
      goto LABEL_4;
LABEL_20:
    v7 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v3, 2);
    v17(v7);
    return swift_bridgeObjectRelease(v7);
  }
  if (v2 < 0)
    v16 = v2;
  else
    v16 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  result = _CocoaArrayWrapper.endIndex.getter(v16);
  v4 = result;
  v17 = (void (*)(char *))a1;
  if (!result)
    goto LABEL_20;
LABEL_4:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v6);
      else
        v8 = *(id *)(v3 + 8 * v6 + 32);
      v9 = v8;
      v10 = UserGuide.identifier.getter();
      v12 = v11;

      if ((swift_isUniquelyReferenced_nonNull_native(v7) & 1) == 0)
        v7 = sub_10001392C(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v14 = *((_QWORD *)v7 + 2);
      v13 = *((_QWORD *)v7 + 3);
      if (v14 >= v13 >> 1)
        v7 = sub_10001392C((char *)(v13 > 1), v14 + 1, 1, v7);
      ++v6;
      *((_QWORD *)v7 + 2) = v14 + 1;
      v15 = &v7[16 * v14];
      *((_QWORD *)v15 + 4) = v10;
      *((_QWORD *)v15 + 5) = v12;
    }
    while (v4 != v6);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t TPSDaemon.fetchDocument(identifier:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;

  v9 = sub_1000108E8(&qword_1000267C0);
  __chkstk_darwin(v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100020FB0, 72, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a1;
  v13[8] = a2;
  v14 = v4;
  swift_retain(a4);
  swift_bridgeObjectRetain(a2);
  v15 = sub_100012434((uint64_t)v11, (uint64_t)&unk_1000267E0, (uint64_t)v13);
  return swift_release(v15);
}

uint64_t sub_10001299C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v8[23] = a7;
  v8[24] = a8;
  v8[21] = a5;
  v8[22] = a6;
  v8[20] = a4;
  v9 = type metadata accessor for TipsLog(0);
  v8[25] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[26] = v10;
  v8[27] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedThrowingContinuation<A>(isolation:function:_:)[1]);
  v8[28] = v11;
  *v11 = v8;
  v11[1] = sub_100012A58;
  return withCheckedThrowingContinuation<A>(isolation:function:_:)(v8 + 32, 0, 0, 0xD000000000000023, 0x8000000100019230, sub_100013468, 0, &type metadata for Bool);
}

uint64_t sub_100012A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 224);
  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc(v2);
  if (v0)
    v3 = sub_100012C00;
  else
    v3 = sub_100012ABC;
  return swift_task_switch(v3, 0, 0);
}

id sub_100012ABC()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD, uint64_t);
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;

  if (*(_BYTE *)(v0 + 256) == 1)
  {
    result = objc_msgSend(*(id *)(v0 + 160), "tipsManager");
    *(_QWORD *)(v0 + 240) = result;
    if (result)
    {
      v2 = result;
      v3 = v0 + 16;
      *(_QWORD *)(v0 + 56) = v0 + 152;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_100012D28;
      v4 = swift_continuation_init(v0 + 16, 1);
      *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
      v5 = (_QWORD *)(v0 + 80);
      v5[1] = 0x40000000;
      v5[2] = sub_100013238;
      v5[3] = &unk_100021068;
      v5[4] = v4;
      objc_msgSend(v2, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:", 0, 0, 0, 0, 0, 0, 0, v5);
      return (id)swift_continuation_await(v3);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v6 = *(void (**)(_QWORD, uint64_t))(v0 + 168);
    v7 = sub_100014124();
    v8 = swift_allocError(&_s12ServiceErrorON, v7, 0, 0);
    *v9 = 2;
    v6(0, v8);
    swift_errorRelease(v8);
    swift_task_dealloc(*(_QWORD *)(v0 + 216));
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_100012C00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD, uint64_t);
  Swift::String v6;
  void *object;

  v1 = *(_QWORD *)(v0 + 232);
  v3 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 200);
  v5 = *(void (**)(_QWORD, uint64_t))(v0 + 168);
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease(0xE000000000000000);
  swift_getErrorValue(v1, v0 + 144, v0 + 120);
  v6._countAndFlagsBits = Error.localizedDescription.getter(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  object = v6._object;
  String.append(_:)(v6);
  swift_bridgeObjectRelease(object);
  logError(_:_:)(v2, 0xD000000000000020, 0x8000000100019260);
  swift_bridgeObjectRelease(0x8000000100019260);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_errorRetain(v1);
  v5(0, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 248) = v1;
  if (v1)
    v2 = sub_100013104;
  else
    v2 = sub_100012D88;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_100012D88()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  void (*v23)(id, _QWORD);
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void (*v33)(_QWORD, uint64_t);
  Swift::String v34;
  Swift::String v35;
  unint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  _QWORD v40[2];

  v1 = *(void **)(v0 + 152);

  v2 = objc_msgSend(v1, "collectionMap");
  if (v2)
  {
    v3 = v2;
    v4 = sub_100014594(0, &qword_100026808, TPSCollection_ptr);
    v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v3, &type metadata for String, v4, &protocol witness table for String);

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v1, "tipMap");
  if (v6)
  {
    v7 = v6;
    v8 = sub_100014594(0, &qword_100026800, TPSTip_ptr);
    v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v7, &type metadata for String, v8, &protocol witness table for String);

    if (!v5)
      goto LABEL_16;
  }
  else
  {
    v9 = 0;
    if (!v5)
      goto LABEL_16;
  }
  if (*(_QWORD *)(v5 + 16))
  {
    v11 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 192);
    swift_bridgeObjectRetain(v10);
    v12 = sub_1000137E8(v11, v10);
    v13 = *(_QWORD *)(v0 + 192);
    if ((v14 & 1) != 0)
    {
      v15 = *(id *)(*(_QWORD *)(v5 + 56) + 8 * v12);
      swift_bridgeObjectRelease(v5);
      v6 = (id)swift_bridgeObjectRelease(v13);
      if (v9)
        goto LABEL_17;
LABEL_11:
      if (v15)
      {
        v9 = 0;
LABEL_22:
        swift_bridgeObjectRelease(v9);
        goto LABEL_23;
      }
LABEL_25:
      v29 = *(_QWORD *)(v0 + 208);
      v28 = *(_QWORD *)(v0 + 216);
      v31 = *(void **)(v0 + 192);
      v30 = *(_QWORD *)(v0 + 200);
      v32 = *(_QWORD *)(v0 + 184);
      v33 = *(void (**)(_QWORD, uint64_t))(v0 + 168);
      static TipsLog.data.getter(v6);
      _StringGuts.grow(_:)(27);
      swift_bridgeObjectRelease(0xE000000000000000);
      strcpy((char *)v40, "Document with ");
      HIBYTE(v40[1]) = -18;
      v34._countAndFlagsBits = v32;
      v34._object = v31;
      String.append(_:)(v34);
      v35._countAndFlagsBits = 0x756F6620746F6E20;
      v35._object = (void *)0xEB000000002E646ELL;
      String.append(_:)(v35);
      logDebug(_:_:)(v28, v40[0], v40[1]);
      swift_bridgeObjectRelease(v40[1]);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      v36 = sub_100014124();
      v37 = swift_allocError(&_s12ServiceErrorON, v36, 0, 0);
      *v38 = 0;
      v33(0, v37);
      swift_errorRelease(v37);
      goto LABEL_26;
    }
    swift_bridgeObjectRelease(v5);
    v16 = v13;
  }
  else
  {
    v16 = v5;
  }
  v6 = (id)swift_bridgeObjectRelease(v16);
LABEL_16:
  v15 = 0;
  if (!v9)
    goto LABEL_11;
LABEL_17:
  if (!*(_QWORD *)(v9 + 16))
  {
LABEL_21:
    if (v15)
      goto LABEL_22;
    v26 = *(_QWORD *)(v0 + 184);
    v25 = *(_QWORD *)(v0 + 192);
    swift_bridgeObjectRetain(v25);
    sub_100014168(v9, v26, v25);
    v15 = v27;
    swift_bridgeObjectRelease(v25);
    v6 = (id)swift_bridgeObjectRelease(v9);
    if (v15)
      goto LABEL_23;
    goto LABEL_25;
  }
  v18 = *(_QWORD *)(v0 + 184);
  v17 = *(_QWORD *)(v0 + 192);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v9);
  v19 = sub_1000137E8(v18, v17);
  v20 = *(_QWORD *)(v0 + 192);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease(v9);
    swift_bridgeObjectRelease(v20);
    goto LABEL_21;
  }
  v22 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v19);
  swift_bridgeObjectRelease_n(v9, 2);
  swift_bridgeObjectRelease(v20);

  v15 = v22;
LABEL_23:
  v23 = *(void (**)(id, _QWORD))(v0 + 168);
  v24 = v15;
  v23(v15, 0);

LABEL_26:
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013104()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, uint64_t);
  Swift::String v7;
  void *object;

  v1 = *(void **)(v0 + 240);
  swift_willThrow();

  v2 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 200);
  v6 = *(void (**)(_QWORD, uint64_t))(v0 + 168);
  static TipsLog.data.getter();
  _StringGuts.grow(_:)(34);
  swift_bridgeObjectRelease(0xE000000000000000);
  swift_getErrorValue(v2, v0 + 144, v0 + 120);
  v7._countAndFlagsBits = Error.localizedDescription.getter(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
  object = v7._object;
  String.append(_:)(v7);
  swift_bridgeObjectRelease(object);
  logError(_:_:)(v3, 0xD000000000000020, 0x8000000100019260);
  swift_bridgeObjectRelease(0x8000000100019260);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_errorRetain(v2);
  v6(0, v2);
  swift_errorRelease(v2);
  swift_errorRelease(v2);
  swift_task_dealloc(*(_QWORD *)(v0 + 216));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100013238(uint64_t result, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;

  v3 = *(_QWORD *)(result + 32);
  if (a3)
  {
    v5 = sub_1000108E8(&qword_100026810);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = a2;
    v9 = a2;
    return swift_continuation_throwingResume(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100013410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = _convertErrorToNSError(_:)(a2);
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_100013468(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[5];
  uint64_t v13;

  v2 = sub_1000108E8(&qword_100026818);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = objc_msgSend(objc_allocWithZone((Class)TPSDeviceCapability), "init");
  objc_msgSend(v5, "setType:", 2);
  objc_msgSend(v5, "setKey:", kTPSCapabilitySiriLanguageMatchesSystemLanguageEnabled);
  v6 = objc_msgSend((id)objc_opt_self(TPSCustomCapabilityValidationBuilder), "targetValidationForCapability:", v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v7 = *(unsigned __int8 *)(v3 + 80);
  v8 = (v7 + 16) & ~v7;
  v9 = swift_allocObject(&unk_100021090, v8 + v4, v7 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v9 + v8, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_1000143F8;
  v13 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000136B0;
  aBlock[3] = &unk_1000210A8;
  v10 = _Block_copy(aBlock);
  swift_release(v13);
  objc_msgSend(v6, "getCurrentStateWithCompletion:", v10);
  _Block_release(v10);

  return swift_unknownObjectRelease(v6);
}

uint64_t sub_100013610(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  char v6;
  _QWORD v7[4];

  if (a2)
  {
    v7[0] = a2;
    swift_errorRetain(a2);
    v2 = sub_1000108E8(&qword_100026818);
    return CheckedContinuation.resume(throwing:)(v7, v2);
  }
  else
  {
    sub_100014480(a1, (uint64_t)v7);
    v4 = swift_dynamicCast(&v6, v7, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
    LOBYTE(v7[0]) = v4 & v6;
    v5 = sub_1000108E8(&qword_100026818);
    return CheckedContinuation.resume(returning:)(v7, v5);
  }
}

uint64_t sub_1000136B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void (*v6)(_QWORD *, void *);
  id v7;
  _QWORD v9[4];

  v6 = *(void (**)(_QWORD *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[3] = swift_getObjectType(a2);
  v9[0] = a2;
  swift_retain(v5);
  swift_unknownObjectRetain(a2);
  v7 = a3;
  v6(v9, a3);
  swift_release(v5);

  return sub_100014460(v9);
}

uint64_t sub_100013738(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001379C;
  return v6(a1);
}

uint64_t sub_10001379C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_1000137E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10001384C(a1, a2, v5);
}

unint64_t sub_10001384C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

char *sub_10001392C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000108E8(&qword_100026820);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy(v14, v15, v8, &type metadata for String);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

uint64_t sub_100013A30(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_1000267DC);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1000147B0;
  return sub_10001299C(a1, v4, v5, v6, v7, v8, v9, v10);
}

void sub_100013AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_100013410(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_100013AD0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100013B0C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc(dword_1000267DC);
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_100013BA0;
  return sub_10001299C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_100013BA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100013BE8(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  Swift::String v16;
  void *object;
  unint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _QWORD v30[2];
  unint64_t v31;
  unint64_t v32;

  v4 = sub_1000108E8(&qword_1000267C0);
  __chkstk_darwin(v4);
  v30[0] = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TipsLog(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)v30 - v11;
  v13 = swift_allocObject(&unk_100021028, 24, 7);
  *(_QWORD *)(v13 + 16) = a2;
  v14 = _Block_copy(a2);
  static TipsLog.default.getter(v14);
  v31 = 0;
  v32 = 0xE000000000000000;
  _StringGuts.grow(_:)(32);
  swift_bridgeObjectRelease(v32);
  v31 = 0xD00000000000001ELL;
  v32 = 0x80000001000191C0;
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v29 = a1;
    else
      v29 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v15 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v30[1] = v15;
  v16._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v16._object;
  String.append(_:)(v16);
  swift_bridgeObjectRelease(object);
  v18 = v32;
  logDebug(_:_:)(v12, v31, v32);
  swift_bridgeObjectRelease(v18);
  v19 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v20 = v19(v12, v6);
  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v26 = a1;
    else
      v26 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v27 = _CocoaArrayWrapper.endIndex.getter(v26);
    v20 = swift_bridgeObjectRelease(a1);
    if (v27)
      goto LABEL_5;
LABEL_10:
    static TipsLog.targeting.getter(v20);
    log(_:_:)(v10, 0xD000000000000028, 0x80000001000191E0);
    v19(v10, v6);
    a2[2](a2, 0, 0);
    v25 = v13;
    return swift_release(v25);
  }
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_5:
  v21 = type metadata accessor for TaskPriority(0);
  v22 = v30[0];
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v30[0], 1, 1, v21);
  v23 = (_QWORD *)swift_allocObject(&unk_100021050, 56, 7);
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = a1;
  v23[5] = sub_1000140E4;
  v23[6] = v13;
  swift_bridgeObjectRetain(a1);
  swift_retain(v13);
  v24 = sub_100012434(v22, (uint64_t)&unk_1000267F0, (uint64_t)v23);
  swift_release(v13);
  v25 = v24;
  return swift_release(v25);
}

void sub_100013ED4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  Class isa;

  if (!objc_msgSend((id)objc_opt_self(TPSCommonDefines), "supportsUserGuide"))
  {
    isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
LABEL_22:

    return;
  }
  type metadata accessor for UserGuideManager(0);
  v2 = static UserGuideManager.userGuides()();
  v3 = v2;
  if (!((unint64_t)v2 >> 62))
  {
    v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v2);
    if (v4)
      goto LABEL_4;
LABEL_20:
    v6 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
    swift_bridgeObjectRelease_n(v3, 2);
    isa = Array._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t))(a1 + 16))(a1);
    swift_bridgeObjectRelease(v6);
    goto LABEL_22;
  }
  if (v2 < 0)
    v15 = v2;
  else
    v15 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v4 = _CocoaArrayWrapper.endIndex.getter(v15);
  if (!v4)
    goto LABEL_20;
LABEL_4:
  if (v4 >= 1)
  {
    v5 = 0;
    v6 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5);
      else
        v7 = *(id *)(v3 + 8 * v5 + 32);
      v8 = v7;
      v9 = UserGuide.identifier.getter();
      v11 = v10;

      if ((swift_isUniquelyReferenced_nonNull_native(v6) & 1) == 0)
        v6 = sub_10001392C(0, *((_QWORD *)v6 + 2) + 1, 1, v6);
      v13 = *((_QWORD *)v6 + 2);
      v12 = *((_QWORD *)v6 + 3);
      if (v13 >= v12 >> 1)
        v6 = sub_10001392C((char *)(v12 > 1), v13 + 1, 1, v6);
      ++v5;
      *((_QWORD *)v6 + 2) = v13 + 1;
      v14 = &v6[16 * v13];
      *((_QWORD *)v14 + 4) = v9;
      *((_QWORD *)v14 + 5) = v11;
    }
    while (v4 != v5);
    goto LABEL_21;
  }
  __break(1u);
}

uint64_t sub_1000140C0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_1000140E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1000125F8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1000140F0()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

unint64_t sub_100014124()
{
  unint64_t result;

  result = qword_1000267F8;
  if (!qword_1000267F8)
  {
    result = swift_getWitnessTable(&unk_100018848, &_s12ServiceErrorON);
    atomic_store(result, (unint64_t *)&qword_1000267F8);
  }
  return result;
}

void sub_100014168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  int64_t v24;

  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v24 = (unint64_t)(v6 + 63) >> 6;
  swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_22;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v12 >= v24)
      goto LABEL_28;
    v13 = *(_QWORD *)(v23 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v24)
        goto LABEL_28;
      v13 = *(_QWORD *)(v23 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v24)
          goto LABEL_28;
        v13 = *(_QWORD *)(v23 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v24)
            goto LABEL_28;
          v13 = *(_QWORD *)(v23 + 8 * v9);
          if (!v13)
          {
            v14 = v12 + 4;
            if (v14 >= v24)
              goto LABEL_28;
            v13 = *(_QWORD *)(v23 + 8 * v14);
            v9 = v14;
            if (!v13)
              break;
          }
        }
      }
    }
LABEL_21:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_22:
    v15 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * v11);
    v16 = objc_msgSend(v15, "correlationID");
    if (v16)
    {
      v17 = v16;
      v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v20 = v19;

      if (v18 == a2 && v20 == a3)
      {
        swift_release(a1);
        swift_bridgeObjectRelease(a3);
        return;
      }
      v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, a2, a3, 0);
      swift_bridgeObjectRelease(v20);
      if ((v22 & 1) != 0)
      {
LABEL_28:
        swift_release(a1);
        return;
      }
    }

  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v24)
      goto LABEL_28;
    v13 = *(_QWORD *)(v23 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_21;
  }
LABEL_32:
  __break(1u);
}

uint64_t sub_100014394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_1000108E8(&qword_100026818);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000143F8(uint64_t a1, uint64_t a2)
{
  sub_1000108E8(&qword_100026818);
  return sub_100013610(a1, a2);
}

uint64_t sub_100014448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014458(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100014460(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100014480(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000144C0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000108E8(&qword_1000267C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100014500()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014524(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10002682C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100013BA0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100026828 + dword_100026828))(a1, v4);
}

uint64_t sub_100014594(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

_OWORD *sub_1000145CC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000145DC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

_BYTE *_s12ServiceErrorOwCP(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s12ServiceErrorOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s12ServiceErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1000146D0 + 4 * byte_100018775[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100014704 + 4 * byte_100018770[v4]))();
}

uint64_t sub_100014704(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001470C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100014714);
  return result;
}

uint64_t sub_100014720(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100014728);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001472C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100014734(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100014740(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10001474C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s12ServiceErrorOMa()
{
  return &_s12ServiceErrorON;
}

unint64_t sub_10001476C()
{
  unint64_t result;

  result = qword_100026850;
  if (!qword_100026850)
  {
    result = swift_getWitnessTable(&unk_100018820, &_s12ServiceErrorON);
    atomic_store(result, (unint64_t *)&qword_100026850);
  }
  return result;
}

void sub_1000147B8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000100C4();
  sub_1000100B8((void *)&_mh_execute_header, v0, v1, "Received context value change notification for registration %s", v2);
  sub_1000100B0();
}

void sub_10001481C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "Tips indexing started.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014848()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100C4();
  sub_100010094((void *)&_mh_execute_header, v0, v1, "Tips indexing completed with error: %@", v2, v3, v4, v5, v6);
  sub_1000100B0();
}

void sub_1000148A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "User Guide indexing started.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_1000148D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100C4();
  sub_100010094((void *)&_mh_execute_header, v0, v1, "User Guide indexing completed with error: %@", v2, v3, v4, v5, v6);
  sub_1000100B0();
}

void sub_100014934(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URL"));
  sub_1000100C4();
  sub_1000100B8((void *)&_mh_execute_header, a2, v4, "discretionary task with URL %@", v5);

}

void sub_1000149BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "User is on a major release beta.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_1000149E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000100D0((void *)&_mh_execute_header, a2, a3, "User is under seed build, current needsResetOnMajorGM status: %d", a5, a6, a7, a8, 0);
  sub_10001008C();
}

void sub_100014A50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "User went from major release beta to GM, reset notifications.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "User is on a GM build.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "GM reset not needed.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014AD4()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_1000100C4();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "VersionTokens %@, minor version %ld", v2, 0x16u);
  sub_1000100B0();
}

void sub_100014B50(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000100D0((void *)&_mh_execute_header, a2, a3, "Contains connection: %d", a5, a6, a7, a8, 0);
  sub_10001008C();
}

void sub_100014BBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "Adding app XPC Connection. ", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014BE8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "Standard access connection.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014C14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000100A4();
  sub_10001007C((void *)&_mh_execute_header, v0, v1, "xpc connection event tipsAppActive received.", v2, v3, v4, v5, v6);
  sub_10001008C();
}

void sub_100014C40(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010094((void *)&_mh_execute_header, a2, a3, "Error downloading remote tip %@", a5, a6, a7, a8, 2u);
  sub_1000100B0();
}

void sub_100014CA8(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"));
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error downloading remote tip %@, %@", (uint8_t *)&v6, 0x16u);

}

void sub_100014D58()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_1000100C4();
  sub_1000100B8((void *)&_mh_execute_header, v0, v1, "fetchAssetsWithAssetsConfiguration - assetConfiguration: %@", v2);
  sub_1000100B0();
}

void sub_100014DBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100010094((void *)&_mh_execute_header, a2, a3, "Error downloading assetConfiguration: %@", a5, a6, a7, a8, 2u);
  sub_1000100B0();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__addAppXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAppXPCConnection:");
}

id objc_msgSend__addAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAssistantXPCConnection:");
}

id objc_msgSend__addDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addDiscoverabilityXPCConnection:");
}

id objc_msgSend__adoptPersonaForContainerLookupIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_adoptPersonaForContainerLookupIfNeeded");
}

id objc_msgSend__appXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appXPCConnectionContainsConnection:");
}

id objc_msgSend__assistantXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assistantXPCConnectionContainsConnection:");
}

id objc_msgSend__clearDisplayedContentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearDisplayedContentIDs");
}

id objc_msgSend__discoverabilityXPCConnectionContainsConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discoverabilityXPCConnectionContainsConnection:");
}

id objc_msgSend__errorForHintIneligibleReason_contentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorForHintIneligibleReason:contentID:");
}

id objc_msgSend__listDisplayContentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_listDisplayContentIDs");
}

id objc_msgSend__removeAppXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAppXPCConnection:");
}

id objc_msgSend__removeAssistantXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAssistantXPCConnection:");
}

id objc_msgSend__removeDiscoverabilityXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeDiscoverabilityXPCConnection:");
}

id objc_msgSend_activatedCollections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedCollections:");
}

id objc_msgSend_addBarrierBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBarrierBlock:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addHintDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addHintDisplayedForIdentifier:context:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_analyticsExperiment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsExperiment");
}

id objc_msgSend_appConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appConnections");
}

id objc_msgSend_appGroupDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appGroupDefaults");
}

id objc_msgSend_appRemovalCleanupIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appRemovalCleanupIfNeeded");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetIdentifier");
}

id objc_msgSend_assetPathFromAssetConfiguration_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetPathFromAssetConfiguration:type:");
}

id objc_msgSend_assistantConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assistantConnections");
}

id objc_msgSend_assistantSupportInterface(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assistantSupportInterface");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_bodyContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyContent");
}

id objc_msgSend_bodyText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bodyText");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cacheIdentifierForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheIdentifierForType:");
}

id objc_msgSend_cachedUserGuideMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedUserGuideMap");
}

id objc_msgSend_camp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "camp");
}

id objc_msgSend_cancelLegacyBackgroundTaskIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelLegacyBackgroundTaskIfNeeded");
}

id objc_msgSend_cancelQueryWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelQueryWithIdentifier:");
}

id objc_msgSend_clearCachedUserGuides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCachedUserGuides");
}

id objc_msgSend_clearDataCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearDataCache");
}

id objc_msgSend_clearNotificationCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNotificationCache");
}

id objc_msgSend_clearNotificationCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNotificationCount");
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientBundleIdentifier");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_collectionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionIdentifier");
}

id objc_msgSend_collectionIdentifierForCurrentUserType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionIdentifierForCurrentUserType");
}

id objc_msgSend_collectionMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionMap");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentForVariantIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentForVariantIdentifiers:completionHandler:");
}

id objc_msgSend_contentFromOrigin_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentFromOrigin:processTipKitContent:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:");
}

id objc_msgSend_contentUpdatePostProcessingContentPackage_shouldUpdateNotification_shouldDeferBlock_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUpdatePostProcessingContentPackage:shouldUpdateNotification:shouldDeferBlock:error:");
}

id objc_msgSend_contextualEligibilityWithTipIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_experimentCampChangesToAll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualEligibilityWithTipIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:experimentCampChangesToAll:");
}

id objc_msgSend_contextualEventsForIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualEventsForIdentifiers");
}

id objc_msgSend_contextualInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualInfoForIdentifier:");
}

id objc_msgSend_contextualInfoMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualInfoMap");
}

id objc_msgSend_contextualTipsInactive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualTipsInactive");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_correlationID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correlationID");
}

id objc_msgSend_correlationIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "correlationIdentifierForIdentifier:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createWelcomeXPCActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWelcomeXPCActivity");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUser");
}

id objc_msgSend_customizationIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customizationIDForContentID:");
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemon");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_default(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "default");
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultContext");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllSearchableItemsWithCompletionHandler:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_deviceLocalesContainLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLocalesContainLanguage:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_discoverability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverability");
}

id objc_msgSend_discoverabilityConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverabilityConnections");
}

id objc_msgSend_discoverabilityController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discoverabilityController");
}

id objc_msgSend_displayBundleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayBundleID");
}

id objc_msgSend_displayDarwinNotificationKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayDarwinNotificationKey");
}

id objc_msgSend_displayStatusCheckForHintIneligibleReasonWithContent_context_bypassExperiment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayStatusCheckForHintIneligibleReasonWithContent:context:bypassExperiment:");
}

id objc_msgSend_displayType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayType");
}

id objc_msgSend_displayTypeStringForDisplayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayTypeStringForDisplayType:");
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "document");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_donateContentRetrieved_bundleID_context_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateContentRetrieved:bundleID:context:error:");
}

id objc_msgSend_donateHintIneligibleReason_contentID_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateHintIneligibleReason:contentID:bundleID:context:");
}

id objc_msgSend_downloadedURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadedURL");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "event");
}

id objc_msgSend_eventWithReason_alreadyRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithReason:alreadyRunning:");
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_displayType_reason_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:displayType:reason:date:");
}

id objc_msgSend_eventWithTipID_correlationID_bundleID_context_serviceError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithTipID:correlationID:bundleID:context:serviceError:");
}

id objc_msgSend_eventsHistoryController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsHistoryController");
}

id objc_msgSend_experiment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experiment");
}

id objc_msgSend_experimentCampIDStringForCamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "experimentCampIDStringForCamp:");
}

id objc_msgSend_fetchNotificationAssetIfNeededCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchNotificationAssetIfNeededCompletionHandler:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getCurrentWelcomeActivityCriteria(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentWelcomeActivityCriteria");
}

id objc_msgSend_handleDeviceFirstUnlockNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleDeviceFirstUnlockNotification");
}

id objc_msgSend_handleLanguageDidChangeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLanguageDidChangeNotification");
}

id objc_msgSend_hasWidgetDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasWidgetDocument");
}

id objc_msgSend_hintDisplayedDates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintDisplayedDates");
}

id objc_msgSend_hintDisplayedForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintDisplayedForContentID:");
}

id objc_msgSend_hintDisplayedForIdentifier_correlationID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintDisplayedForIdentifier:correlationID:context:");
}

id objc_msgSend_hintInelgibileReasonForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hintInelgibileReasonForIdentifier:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_ignoreCloud(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoreCloud");
}

id objc_msgSend_immediateNotificationForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "immediateNotificationForIdentifiers:");
}

id objc_msgSend_immediateNotificationIdentifierForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "immediateNotificationIdentifierForType:");
}

id objc_msgSend_indexContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexContentPackage:");
}

id objc_msgSend_indexTips_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexTips:qualityOfService:completionHandler:");
}

id objc_msgSend_indexUserGuides_qualityOfService_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexUserGuides:qualityOfService:completionHandler:");
}

id objc_msgSend_indexing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexing");
}

id objc_msgSend_ineligibleReasonStringForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ineligibleReasonStringForReason:");
}

id objc_msgSend_initWithAllTipStatus_contextualInfoMap_eventHistoryMap_experiment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAllTipStatus:contextualInfoMap:eventHistoryMap:experiment:");
}

id objc_msgSend_initWithAssetIdentifier_assetURLPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetIdentifier:assetURLPath:");
}

id objc_msgSend_initWithAsyncBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAsyncBlock:");
}

id objc_msgSend_initWithAuthenticationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAuthenticationContext:");
}

id objc_msgSend_initWithContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContent:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithDelegate_tipsManager_notificationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:tipsManager:notificationController:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithTipID_correlationID_bundleID_reason_context_date_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipID:correlationID:bundleID:reason:context:date:");
}

id objc_msgSend_initWithTipID_correlationID_reason_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipID:correlationID:reason:context:");
}

id objc_msgSend_initWithTipStatusController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTipStatusController:");
}

id objc_msgSend_initWithVideoIdentifier_videoURL_imageIdentifier_imageURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVideoIdentifier:videoURL:imageIdentifier:imageURL:");
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialize");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isAppRestrictedWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppRestrictedWithBundleIdentifier:");
}

id objc_msgSend_isAppValidWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppValidWithBundleIdentifier:");
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBetaBuild");
}

id objc_msgSend_isContentHintDisplayMaxDisplayedCountExceededForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentHintDisplayMaxDisplayedCountExceededForIdentifier:");
}

id objc_msgSend_isContentIdentifierHoldoutCamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentIdentifierHoldoutCamp:");
}

id objc_msgSend_isContentIneligibleDueToViewOnOtherDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContentIneligibleDueToViewOnOtherDevices:");
}

id objc_msgSend_isContextualInfoExistForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isContextualInfoExistForIdentifier:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHintDisplayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHintDisplayed");
}

id objc_msgSend_isHintDisplayedOnCloudDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHintDisplayedOnCloudDevices");
}

id objc_msgSend_isHintInelgibileForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHintInelgibileForIdentifier:");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isInternalDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalDevice");
}

id objc_msgSend_isLocalContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalContent");
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMultiUser");
}

id objc_msgSend_isNotificationSettingValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotificationSettingValid");
}

id objc_msgSend_isPreconditionMatchedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreconditionMatchedForIdentifier:");
}

id objc_msgSend_isPreconditionValidForIdentifier_preconditionDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreconditionValidForIdentifier:preconditionDictionary:");
}

id objc_msgSend_isReminderCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isReminderCompleted");
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "language");
}

id objc_msgSend_lastDisplayContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastDisplayContext");
}

id objc_msgSend_lastFetchedLanguage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastFetchedLanguage");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "log");
}

id objc_msgSend_logAnalyticsEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAnalyticsEvent:");
}

id objc_msgSend_logAnalyticsEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logAnalyticsEvents:");
}

id objc_msgSend_logDaemonActiveEventWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logDaemonActiveEventWithReason:");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "majorVersion");
}

id objc_msgSend_markHintIneligibleForIdentifiers_bundleID_context_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHintIneligibleForIdentifiers:bundleID:context:reason:");
}

id objc_msgSend_markHintIneligibleForIdentifiers_context_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markHintIneligibleForIdentifiers:context:reason:");
}

id objc_msgSend_miniContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "miniContent");
}

id objc_msgSend_miniTipMetadataForContent_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "miniTipMetadataForContent:bundleID:context:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_monitoringEventsForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoringEventsForContentID:");
}

id objc_msgSend_multiuserModeOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "multiuserModeOn");
}

id objc_msgSend_needImmediateNotificationForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needImmediateNotificationForType:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCache");
}

id objc_msgSend_notificationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationController");
}

id objc_msgSend_notificationController_markIdentifier_type_ineligibleWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationController:markIdentifier:type:ineligibleWithReason:");
}

id objc_msgSend_notificationDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDocument");
}

id objc_msgSend_notificationTimingDarwinKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationTimingDarwinKey");
}

id objc_msgSend_notifiedCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifiedCollection:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigrationIfNeeded");
}

id objc_msgSend_performQuery_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performQuery:completion:");
}

id objc_msgSend_preconditions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preconditions");
}

id objc_msgSend_prepareForNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForNotifications");
}

id objc_msgSend_processAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAnalytics");
}

id objc_msgSend_processAppInteractedByUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAppInteractedByUser");
}

id objc_msgSend_processUserGuidesFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processUserGuidesFromContentPackage:");
}

id objc_msgSend_reconnectWelcomeIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reconnectWelcomeIfNeeded:");
}

id objc_msgSend_registerDarwinNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDarwinNotification:");
}

id objc_msgSend_registerForMobileKeyBagLockStatusNotify(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerForMobileKeyBagLockStatusNotify");
}

id objc_msgSend_registerImmediateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerImmediateNotifications");
}

id objc_msgSend_registerToNotifyWelcome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerToNotifyWelcome");
}

id objc_msgSend_reindexAllSearchableItemsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexAllSearchableItemsWithCompletionHandler:");
}

id objc_msgSend_reindexSearchableItemsWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reindexSearchableItemsWithIdentifiers:completionHandler:");
}

id objc_msgSend_reloadAppGroupDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAppGroupDefaults");
}

id objc_msgSend_reminderState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reminderState");
}

id objc_msgSend_removeAllNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllNotifications");
}

id objc_msgSend_removeAssetCacheDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetCacheDirectory");
}

id objc_msgSend_removeContextualInfoCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContextualInfoCache");
}

id objc_msgSend_removeExperimentCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeExperimentCache");
}

id objc_msgSend_removeNotificationCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationCache");
}

id objc_msgSend_removeNotificationForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationForIdentifier:");
}

id objc_msgSend_removeNotificationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationWithIdentifier:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeWelcomeDocumentCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWelcomeDocumentCache");
}

id objc_msgSend_removeWidgetUpdateDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeWidgetUpdateDate");
}

id objc_msgSend_resetAllDataIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAllDataIfNeeded");
}

id objc_msgSend_resetAnalytics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetAnalytics");
}

id objc_msgSend_resetBasicDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetBasicDefaults");
}

id objc_msgSend_resetDaemonData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDaemonData");
}

id objc_msgSend_resetWelcomeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWelcomeNotifications");
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartTriggerTrackingIfNotDisplayedForIdentifier:");
}

id objc_msgSend_restartTriggerTrackingIfNotDisplayedForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restartTriggerTrackingIfNotDisplayedForIdentifiers:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_revertTipStatusArchivalIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revertTipStatusArchivalIfNeeded");
}

id objc_msgSend_rulesVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rulesVersion");
}

id objc_msgSend_scheduleWelcomeNotificationActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleWelcomeNotificationActivity");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAuthenticationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationHandler:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCustomizationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCustomizationID:");
}

id objc_msgSend_setDataProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProvider:");
}

id objc_msgSend_setDefaultSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSessionDelegate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExcludeCachingDataTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExcludeCachingDataTypes:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setInteractivityMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractivityMode:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastMajorVersionUpdateDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMajorVersionUpdateDate:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMonitoringEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoringEvents:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotificationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationController:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTipsFeedURLSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTipsFeedURLSession:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserLanguage:");
}

id objc_msgSend_setWelcomeXPCActivityScheduleInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWelcomeXPCActivityScheduleInProgress:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_setupCompleted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCompleted");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_shouldDeferBlockForXPCActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldDeferBlockForXPCActivity:");
}

id objc_msgSend_shouldShowWelcomeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowWelcomeNotification");
}

id objc_msgSend_showNewTipNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNewTipNotification");
}

id objc_msgSend_showNotificationWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNotificationWithCompletionHandler:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_statusCheckForHintIneligibleReasonWithContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCheckForHintIneligibleReasonWithContentID:");
}

id objc_msgSend_statusForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusForIdentifier:");
}

id objc_msgSend_stopWelcomeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWelcomeNotification");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsRemoteIcon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsRemoteIcon");
}

id objc_msgSend_supportsWelcomeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsWelcomeNotification");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_tipMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipMap");
}

id objc_msgSend_tipStatusController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipStatusController");
}

id objc_msgSend_tipStatusForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipStatusForIdentifier:");
}

id objc_msgSend_tipStatusMap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipStatusMap");
}

id objc_msgSend_tipsAppInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipsAppInstalled");
}

id objc_msgSend_tipsFeedURLSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipsFeedURLSession");
}

id objc_msgSend_tipsInValidState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipsInValidState");
}

id objc_msgSend_tipsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tipsManager");
}

id objc_msgSend_tps_userLanguageCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tps_userLanguageCode");
}

id objc_msgSend_transactionWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionWithName:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unregisterDarwinNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDarwinNotification:");
}

id objc_msgSend_unregisterImmediateNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterImmediateNotifications");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateContentFromOrigin_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_shouldDeferBlock_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentFromOrigin:contextualEligibility:widgetEligibility:notificationEligibility:preferredNotificationIdentifiers:shouldDeferBlock:completionHandler:");
}

id objc_msgSend_updateContentIfOverrideImmediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentIfOverrideImmediately:");
}

id objc_msgSend_updateContentViewedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentViewedForIdentifier:");
}

id objc_msgSend_updateContentWithActivity_identifier_preferredNotificationIdentifiers_multiuserModeOn_contextualEligibility_widgetEligibility_notificationEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContentWithActivity:identifier:preferredNotificationIdentifiers:multiuserModeOn:contextualEligibility:widgetEligibility:notificationEligibility:");
}

id objc_msgSend_updateContextualInfoForIdentifiers_tipsDeliveryInfoMap_deliveryInfoMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateContextualInfoForIdentifiers:tipsDeliveryInfoMap:deliveryInfoMap:");
}

id objc_msgSend_updateHintDismissedForIdentifier_dismissType_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHintDismissedForIdentifier:dismissType:context:");
}

id objc_msgSend_updateHintWouldHaveBeenDisplayedForIdentifier_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHintWouldHaveBeenDisplayedForIdentifier:context:");
}

id objc_msgSend_updateNotificationCacheWithCollectionIdentifier_document_type_extensionPayload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationCacheWithCollectionIdentifier:document:type:extensionPayload:");
}

id objc_msgSend_updateNotificationStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNotificationStatus");
}

id objc_msgSend_usageEventManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usageEventManager");
}

id objc_msgSend_userGuides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userGuides");
}

id objc_msgSend_userInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfoForIdentifier:");
}

id objc_msgSend_userLanguage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userLanguage");
}

id objc_msgSend_userLanguageCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userLanguageCode");
}

id objc_msgSend_userType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userType");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_variantIdentifierForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "variantIdentifierForIdentifier:");
}

id objc_msgSend_welcome(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcome");
}

id objc_msgSend_welcome_contentAvailableRemotelyWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcome:contentAvailableRemotelyWithCompletionHandler:");
}

id objc_msgSend_welcome_notifyWelcomeDocument_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcome:notifyWelcomeDocument:");
}

id objc_msgSend_welcomeCollectionFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeCollectionFromContentPackage:");
}

id objc_msgSend_welcomeDocumentFromContentPackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeDocumentFromContentPackage:");
}

id objc_msgSend_welcomeNotificationDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeNotificationDelay");
}

id objc_msgSend_welcomeNotificationDisplayed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeNotificationDisplayed");
}

id objc_msgSend_welcomeNotificationGracePeriod(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeNotificationGracePeriod");
}

id objc_msgSend_welcomeXPCActivityScheduleInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "welcomeXPCActivityScheduleInProgress");
}

id objc_msgSend_xpcActivitySetStateBlockForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcActivitySetStateBlockForIdentifier:");
}
