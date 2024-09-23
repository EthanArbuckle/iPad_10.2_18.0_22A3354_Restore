__CFString *sub_100004370(unint64_t a1)
{
  if (a1 >= 6)
    return (__CFString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Missing string for CBManagerState: (%ld)"), a1));
  else
    return off_100018498[a1];
}

void sub_1000059AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000059D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "highDutyCycleTimerFired");

}

void sub_1000062C0(uint64_t a1)
{
  InitialSyncCompletionMonitor *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  dispatch_source_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_alloc_init(InitialSyncCompletionMonitor);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(a1 + 32), "registerNanoRegistryObservers");
  objc_msgSend(*(id *)(a1 + 32), "updateState");
  signal(15, (void (__cdecl *)(int))1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workQueue"));
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  dispatch_source_set_event_handler(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 40), &stru_100018510);
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
}

void sub_100006398(id a1)
{
  NSObject *v1;
  uint64_t v2;
  id v3;
  uint8_t v4[16];

  v1 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Got SIGTERM; Exiting when clean.",
      v4,
      2u);
  }
  v3 = objc_msgSend((id)objc_opt_class(KeepAliveManager, v2), "deleteMagicSwitchPathFile");
  xpc_transaction_exit_clean(v3);
}

id sub_100006708(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v2 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "valueForProperty:", NRDevicePropertyPairingID));
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received notification (%@) for device: (%@)", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 48), "updateState");
}

void sub_100007240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000727C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007358;
    block[3] = &unk_100018560;
    block[4] = WeakRetained;
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    dispatch_async(v6, block);

  }
}

id sub_100007358(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activePairedDeviceSwitchForDevice:completedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100007520(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received active device assertion state did change callback", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "updateState");
}

void sub_100007E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007E58(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "activeWatchAssertionTimerFired");

}

void sub_100008840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008864(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  char v12;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "workQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008948;
    v9[3] = &unk_1000185B0;
    v9[4] = WeakRetained;
    v10 = *(id *)(a1 + 32);
    v12 = a2;
    v11 = v5;
    dispatch_async(v8, v9);

  }
}

id sub_100008948(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleInitialSyncStateForPairingID:hasCompleted:error:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

id sub_10000915C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forgetPairingID:", *(_QWORD *)(a1 + 40));
}

void sub_10000925C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009270(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Initial sync completed for pairingID: (%@)", (uint8_t *)&v6, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "cachedInitialSyncStateByPairingID"));
    objc_msgSend(v5, "setObject:forKey:", &__kCFBooleanTrue, *(_QWORD *)(a1 + 32));

    objc_msgSend(WeakRetained, "notifyObserversInitialSyncDidCompleteForPairingID:", *(_QWORD *)(a1 + 32));
  }

}

void sub_100009428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000943C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "retryPendingRequests");

}

id sub_100009884(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Dispatch timer fired", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "evaluateTimers");
}

id sub_1000098F4(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Received time zone notification: (com.apple.system.timezone)", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleTimeEvent");
}

id sub_100009964(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Received clock set notification: (com.apple.system.clock_set)", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "handleTimeEvent");
}

void sub_100009A4C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100021A30;
  qword_100021A30 = (uint64_t)v1;

}

void sub_10000A0E4(uint64_t a1)
{
  id v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v4 = 134217984;
    v10 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = qword_100021A50;
        if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Firing timer (%p)", buf, 0xCu);
        }
        objc_msgSend(v8, "fireTimer", v10, (_QWORD)v11);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  sub_10000BDA0(*(_DWORD *)(a1 + 40));
}

void sub_10000AC04(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fireTimer");

}

void start()
{
  +[MagicSwitchEnabler run](MagicSwitchEnabler, "run");
  sub_10000AD20();
}

void sub_10000AD20()
{
  if (qword_100021A40 != -1)
    dispatch_once(&qword_100021A40, &stru_1000186B8);
}

void sub_10000AD48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.NanoRegistry", "MagicSwitch");
  v2 = (void *)qword_100021A50;
  qword_100021A50 = (uint64_t)v1;

}

uint64_t sub_10000BBE0(uint64_t a1)
{
  void *v2;
  const __CFDictionary *v3;
  IOReturn v4;
  NSObject *v5;
  IOReturn v6;
  uint64_t v7;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  _BYTE v11[14];
  _QWORD v12[4];
  _QWORD v13[4];

  AssertionID = 0;
  v12[0] = CFSTR("AssertName");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v13[0] = v2;
  v13[1] = CFSTR("com.apple.MagicSwitch");
  v12[1] = CFSTR("PlugInBundleID");
  v12[2] = CFSTR("AssertType");
  v12[3] = CFSTR("AssertLevel");
  v13[2] = CFSTR("PreventUserIdleSystemSleep");
  v13[3] = &off_100018BA8;
  v3 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));

  v4 = IOPMAssertionCreateWithProperties(v3, &AssertionID);
  v5 = qword_100021A50;
  if (v4)
  {
    v6 = v4;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v11 = a1;
      *(_WORD *)&v11[8] = 1024;
      *(_DWORD *)&v11[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PowerAssertion --- Failed to take power assertion for (%s) with error: (%d)", buf, 0x12u);
    }
    v7 = 0;
    AssertionID = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v11 = AssertionID;
      *(_WORD *)&v11[4] = 2080;
      *(_QWORD *)&v11[6] = a1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "PowerAssertion --- Taking power assertion (%u) for (%s)", buf, 0x12u);
    }
    v7 = AssertionID;
  }

  return v7;
}

void sub_10000BDA0(IOPMAssertionID a1)
{
  NSObject *v2;
  _DWORD v3[2];

  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "PowerAssertion --- Releasing power assertion: (%u)", (uint8_t *)v3, 8u);
  }
  if (a1)
    IOPMAssertionRelease(a1);
}

id sub_10000C30C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateState");
}

void sub_10000C314(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_type_t type;
  NSObject *v4;
  const char *string;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v2 = a2;
  type = xpc_get_type(v2);
  if (qword_100021A48)
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(v2, "Notification");
      v6 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315138;
        v9 = (void *)string;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received notification: %s", (uint8_t *)&v8, 0xCu);
      }
      if (string)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MagicSwitchEnabler sharedInstance](MagicSwitchEnabler, "sharedInstance"));
        objc_msgSend(v7, "handleLaunchEventDarwinNotification:", string);

      }
    }
    else
    {
      v4 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received unexpected non-dictionary type event: (%@)", (uint8_t *)&v8, 0xCu);
      }
    }
  }

}

uint64_t sub_10000D874(void *a1)
{
  id v1;
  __CFWriteStream *v2;
  const __CFData *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  UInt8 buffer[4];
  uint8_t buf[4];
  _QWORD v15[2];
  CFRange v16;

  v1 = a1;
  v2 = (__CFWriteStream *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "output"));
  v3 = (const __CFData *)CFWriteStreamCopyProperty(v2, kCFStreamPropertySocketNativeHandle);

  if (!v3)
  {
    v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15[0] = v1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to extract socket from pipe: (%@)", buf, 0xCu);
    }
    goto LABEL_11;
  }
  *(_DWORD *)buffer = -1;
  v16.location = 0;
  v16.length = 4;
  CFDataGetBytes(v3, v16, buffer);
  CFRelease(v3);
  v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v15[0]) = *(_DWORD *)buffer;
    WORD2(v15[0]) = 2112;
    *(_QWORD *)((char *)v15 + 6) = v1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MessageManager --- Extracted socket (%d) from pipe: (%@)", buf, 0x12u);
  }
  v5 = fcntl(*(int *)buffer, 3, 0);
  if (v5 == -1 || fcntl(*(int *)buffer, 4, v5 | 4u) == -1)
  {
    v7 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)buffer;
      v9 = v7;
      v10 = *__error();
      *(_DWORD *)buf = 67109376;
      LODWORD(v15[0]) = v8;
      WORD2(v15[0]) = 1024;
      *(_DWORD *)((char *)v15 + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to set socket (%d) as non-blocking: %d", buf, 0xEu);

    }
LABEL_11:
    v6 = 0xFFFFFFFFLL;
    goto LABEL_12;
  }
  v6 = *(unsigned int *)buffer;
LABEL_12:

  return v6;
}

_BYTE *sub_10000DF90(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[8])
    return objc_msgSend(result, "readIncomingMessages");
  return result;
}

_BYTE *sub_10000DFA4(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[8])
    return objc_msgSend(result, "writePendingMessages");
  return result;
}

void sub_10000EB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EB50(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "significantTimeChangeHandler");

}

void sub_10000EE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EE58(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "rollingTimerFired");

}

id objc_msgSend_HMACWithKey_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HMACWithKey:data:");
}

id objc_msgSend_HMACWithSeed_timeSlice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HMACWithSeed:timeSlice:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_activeWatchAssertionTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeWatchAssertionTimerFired");
}

id objc_msgSend_activeWatchDidChangeConnectionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeWatchDidChangeConnectionState");
}

id objc_msgSend_activeWatchDidChangeWristStateWithPreviousWristState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeWatchDidChangeWristStateWithPreviousWristState:");
}

id objc_msgSend_activeWatchWristState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeWatchWristState");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_advertisingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advertisingIdentifier");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cachedInitialSyncStateByPairingID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachedInitialSyncStateByPairingID");
}

id objc_msgSend_cancelPeripheralConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelPeripheralConnection:");
}

id objc_msgSend_cancelScheduledWake(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelScheduledWake");
}

id objc_msgSend_cancelScheduledWake_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelScheduledWake:");
}

id objc_msgSend_cancelTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelTimer:");
}

id objc_msgSend_clearDispatchTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearDispatchTimer");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_companionSeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionSeed");
}

id objc_msgSend_compatibilityState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compatibilityState");
}

id objc_msgSend_computeCurrentTimeSlice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeCurrentTimeSlice");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect");
}

id objc_msgSend_connectPeripheral_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectPeripheral:options:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_createMagicSwitchPathFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createMagicSwitchPathFile");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_deadline(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deadline");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delay");
}

id objc_msgSend_deleteMagicSwitchPathFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteMagicSwitchPathFile");
}

id objc_msgSend_deviceForBluetoothID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceForBluetoothID:");
}

id objc_msgSend_deviceForPairingID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceForPairingID:");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDiscoverInactiveWatch_withWristState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didDiscoverInactiveWatch:withWristState:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnect");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_earliestFireTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earliestFireTime");
}

id objc_msgSend_evaluateTimers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateTimers");
}

id objc_msgSend_evaluateTimers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateTimers:");
}

id objc_msgSend_fireTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireTimer");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:range:");
}

id objc_msgSend_getSetupCompletedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSetupCompletedDevices");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gracePeriod");
}

id objc_msgSend_handleLaunchEventDarwinNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleLaunchEventDarwinNotification:");
}

id objc_msgSend_handleTimeEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleTimeEvent");
}

id objc_msgSend_hasActiveAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasActiveAssertion");
}

id objc_msgSend_hasCachedInitialSyncCompletionStateForDevice_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasCachedInitialSyncCompletionStateForDevice:state:");
}

id objc_msgSend_highDutyCycleTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highDutyCycleTimerFired");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_inactiveWatches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactiveWatches");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_activeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:activeDevice:");
}

id objc_msgSend_initWithDelegate_isServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:isServer:");
}

id objc_msgSend_initWithDelegate_pipe_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:pipe:");
}

id objc_msgSend_initWithDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:queue:");
}

id objc_msgSend_initWithDelegate_seed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:seed:");
}

id objc_msgSend_initWithIdentifier_delay_gracePeriod_handlerBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:delay:gracePeriod:handlerBlock:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initialSyncDidCompleteForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialSyncDidCompleteForDevice:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnecting");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPoweredOn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPoweredOn");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isScanning");
}

id objc_msgSend_isSettingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSettingEnabled");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_magicSwitchManager_requestActiveDeviceSwitch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magicSwitchManager:requestActiveDeviceSwitch:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notifyObserversInitialSyncDidCompleteForPairingID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyObserversInitialSyncDidCompleteForPairingID:");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peer");
}

id objc_msgSend_pipe_didConnectToPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipe:didConnectToPeer:");
}

id objc_msgSend_pipe_didDisconnectFromPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipe:didDisconnectFromPeer:");
}

id objc_msgSend_registerEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEndpoint");
}

id objc_msgSend_registerEndpoint_type_priority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEndpoint:type:priority:");
}

id objc_msgSend_registerNanoRegistryObservers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerNanoRegistryObservers");
}

id objc_msgSend_registerObserver_device_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerObserver:device:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
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

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_requestInitialNonMigrationSyncStateForPairingIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInitialNonMigrationSyncStateForPairingIdentifier:completion:");
}

id objc_msgSend_requestInitialSyncStateForPairingID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestInitialSyncStateForPairingID:");
}

id objc_msgSend_retrievePeripheralsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePeripheralsWithIdentifiers:");
}

id objc_msgSend_retryPendingRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryPendingRequests");
}

id objc_msgSend_rollingTimerFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rollingTimerFired");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_scheduleHighDutyCycleScanningTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleHighDutyCycleScanningTimer");
}

id objc_msgSend_scheduleRollingTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleRollingTimer");
}

id objc_msgSend_scheduleTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleTimer");
}

id objc_msgSend_scheduleTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleTimer:");
}

id objc_msgSend_scheduleTimerWithEarliestDeadline_now_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleTimerWithEarliestDeadline:now:");
}

id objc_msgSend_scheduleWakeWithDelayBeforeFireTime_gracePeriod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleWakeWithDelayBeforeFireTime:gracePeriod:");
}

id objc_msgSend_setActivePairedDevice_isMagicSwitch_operationHasCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivePairedDevice:isMagicSwitch:operationHasCompleted:");
}

id objc_msgSend_setDeadline_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeadline:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEarliestFireTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEarliestFireTime:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setupReadWriteSources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupReadWriteSources");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldRollAdvertisingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRollAdvertisingIdentifier");
}

id objc_msgSend_significantTimeChangeHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "significantTimeChangeHandler");
}

id objc_msgSend_startRunningWithInactiveWatches_activeWatchWristState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRunningWithInactiveWatches:activeWatchWristState:");
}

id objc_msgSend_startScanningWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanningWithData:");
}

id objc_msgSend_startScanningWithHighDutyCycle_filteredPeers_filteringBlob_filteringMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startScanningWithHighDutyCycle:filteredPeers:filteringBlob:filteringMask:");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTime");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateAsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateAsString:");
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRunning");
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopScanning");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_systemPowerChanged_notificationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemPowerChanged:notificationID:");
}

id objc_msgSend_takeActiveWatchAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "takeActiveWatchAssertion");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timerWithIdentifier_delay_gracePeriod_waking_handlerBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timerWithIdentifier:delay:gracePeriod:waking:handlerBlock:");
}

id objc_msgSend_unregisterEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterEndpoint:");
}

id objc_msgSend_updateAdvertisingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAdvertisingIdentifier");
}

id objc_msgSend_updatePairedDeviceList_activeDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePairedDeviceList:activeDevice:");
}

id objc_msgSend_updateScanningState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateScanningState");
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_watchDidChangeWristState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchDidChangeWristState:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_wiProxScannerChangedState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiProxScannerChangedState");
}

id objc_msgSend_wiProxScannerFoundDevice_withData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wiProxScannerFoundDevice:withData:");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_wristState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wristState");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
