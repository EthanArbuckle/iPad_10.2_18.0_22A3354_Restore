void sub_100004648(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_autoreleasePoolPush();
  if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](TSDgPTPPort, "gPTPPortWithService:", v5));
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  objc_autoreleasePoolPop(v3);

}

void sub_100004C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000080B8(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getObject:", a1));

  v10 = objc_opt_class(TSDClockSync);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = v11;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v11, "_handleRefreshConnection");
    }
    else if (a4 >= 5)
    {
      objc_msgSend(v11, "_handleNotification:withArgs:ofCount:", *a3, a3 + 2, a4 - 1);
    }

  }
  objc_autoreleasePoolPop(v7);
}

void sub_100008184(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getObject:", a1));

  v10 = objc_opt_class(TSDgPTPNetworkPort);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = v11;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v11, "_handleRefreshConnection");
    }
    else if (a4 >= 7)
    {
      objc_msgSend(v11, "_handleNotification:withArg1:arg2:arg3:arg4:arg5:arg6:", *a3, *((_QWORD *)a3 + 1), *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 3), *((_QWORD *)a3 + 4), *((_QWORD *)a3 + 5), *((_QWORD *)a3 + 6));
    }

  }
  objc_autoreleasePoolPop(v7);
}

void sub_100008264(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v8 = objc_autoreleasePoolPush();
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getObject:", a1));

  v11 = objc_opt_class(TSDDaemonService);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && a4 >= 3)
    objc_msgSend(v10, "handleNotification:clientID:result:withArgs:ofCount:", *a3, a3[2], a2, a3 + 4, a4 - 2);

  objc_autoreleasePoolPop(v8);
}

void sub_100008314(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = objc_autoreleasePoolPush();
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "getObject:", a1));

  v10 = objc_opt_class(TSDKernelClock);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = v11;
    if (a4 == 1)
    {
      if (*(_QWORD *)a3 == 1000)
        objc_msgSend(v11, "_handleRefreshConnection");
    }
    else if (a4 >= 3)
    {
      objc_msgSend(v11, "_handleNotification:withArgs:ofCount:", *a3, a3 + 2, a4 - 1);
    }

  }
  objc_autoreleasePoolPop(v7);
}

void sub_100008B1C(id a1, unsigned int a2, int a3, const unint64_t *a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a3;
  v8 = *(_QWORD *)&a2;
  v9 = objc_autoreleasePoolPush();
  +[IODConnection dispatchNotificationForClientID:ioResult:args:numArgs:](IODConnection, "dispatchNotificationForClientID:ioResult:args:numArgs:", v8, v7, a4, v5);
  objc_autoreleasePoolPop(v9);
}

uint64_t sub_100008EBC(__int128 *a1, unint64_t *a2)
{
  int v3;
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = *a1;
  v11 = 0uLL;
  v3 = 128;
  do
  {
    sub_100008F44(&v10, 1, (uint64_t)&v8);
    v11 = v9;
    result = v8;
    v10 = v8;
    v5 = *a2;
    v6 = a2[1];
    if (*((_QWORD *)&v9 + 1) > v6 || (*((_QWORD *)&v9 + 1) == v6 ? (v7 = (unint64_t)v9 >= v5) : (v7 = 0), v7))
    {
      v11 = v9 - __PAIR128__(v6, v5);
      result = v8 | 1;
      *(_QWORD *)&v10 = v8 | 1;
    }
    --v3;
  }
  while (v3);
  return result;
}

_OWORD *sub_100008F44@<X0>(_OWORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  __int128 v3;
  int v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = result[1];
  *(_OWORD *)a3 = *result;
  *(_OWORD *)(a3 + 16) = v3;
  if (a2)
  {
    v6 = a2 - 128;
    if (v6)
    {
      if (a2 <= 127)
      {
        v7 = sub_100009038((_QWORD *)a3, 128 - a2);
        v9 = v8;
        *(_QWORD *)(a3 + 16) = sub_100008FF4(a3 + 16, a2) | v7;
        *(_QWORD *)(a3 + 24) = v10 | v9;
        result = (_OWORD *)sub_100008FF4(a3, a2);
        *(_QWORD *)a3 = result;
        *(_QWORD *)(a3 + 8) = v11;
        return result;
      }
      result = (_OWORD *)sub_100008FF4(a3, v6);
      *(_QWORD *)(a3 + 16) = result;
      *(_QWORD *)(a3 + 24) = v12;
    }
    else
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)a3;
    }
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t sub_100008FF4(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)a1 << a2;
  if (a2 > 63)
    v2 = 0;
  if (a2 == 64)
    v3 = 0;
  else
    v3 = v2;
  if (a2)
    return v3;
  else
    return *(_QWORD *)a1;
}

unint64_t sub_100009038(_QWORD *a1, int a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = a1[1];
  v3 = v2 >> a2;
  if (a2 <= 63)
    v3 = (v2 << -(char)a2) | (*a1 >> a2);
  if (a2 == 64)
    v3 = a1[1];
  if (a2)
    return v3;
  else
    return *a1;
}

uint64_t sub_10000907C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, *(unsigned int *)(a1 + 60));
}

void sub_100009280(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  if (!qword_100047CC0)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clockManager"));
    v4 = (void *)qword_100047CC0;
    qword_100047CC0 = v3;

  }
  objc_autoreleasePoolPop(v2);
}

void sub_1000092D4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  if (!qword_100047CA0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
    objc_msgSend(v3, "addgPTPServicesWithError:", 0);
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gPTPManager"));
    v5 = (void *)qword_100047CA0;
    qword_100047CA0 = v4;

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100009348(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

void start()
{
  void *v0;
  TSDDaemon *v1;
  void *v2;
  _BYTE v3[12];
  __int16 v4;
  const char *v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v3 = 136315394;
    *(_QWORD *)&v3[4] = "audioclocksyncd";
    v4 = 2080;
    v5 = "1300.51";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s %s\n\n", v3, 0x16u);
  }
  *(_QWORD *)v3 = 0xFE000100FF0001;
  task_policy_set(mach_task_self_, 9u, (task_policy_t)v3, 2u);
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc_init(TSDDaemon);
  v2 = (void *)qword_100047BE8;
  qword_100047BE8 = (uint64_t)v1;

  dispatch_main();
}

void sub_100009FE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v13 - 192));
  _Unwind_Resume(a1);
}

void sub_10000A06C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "strongSelf != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 73;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    goto LABEL_5;
  }
  v6 = objc_opt_class(IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 74;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertyForKey:", CFSTR("ClockIdentifier")));
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "clockIdenfierObj != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 77;
    goto LABEL_12;
  }
  v8 = v7;
  objc_msgSend(WeakRetained, "addStatisticsWithIdentifier:", objc_msgSend(v7, "unsignedLongLongValue"));

LABEL_5:
  objc_autoreleasePoolPop(v4);

}

void sub_10000A300(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "strongSelf != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 94;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v9, 0x3Au);
    goto LABEL_5;
  }
  v6 = objc_opt_class(IOKRegistryEntry);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "[object isKindOfClass:[IOKRegistryEntry class]]";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 95;
    goto LABEL_12;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertyForKey:", CFSTR("ClockIdentifier")));
  if (!v7)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    v9 = 136316418;
    v10 = "clockIdenfierObj != nil";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v19 = 1024;
    v20 = 98;
    goto LABEL_12;
  }
  v8 = v7;
  objc_msgSend(WeakRetained, "removeStatisticsWithIdentifier:", objc_msgSend(v7, "unsignedLongLongValue"));

LABEL_5:
  objc_autoreleasePoolPop(v4);

}

void sub_10000A594(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v7 = 136316418;
    v8 = "strongSelf != nil";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v17 = 1024;
    v18 = 113;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    goto LABEL_4;
  }
  v6 = objc_opt_class(IOKService);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v7 = 136316418;
    v8 = "[object isKindOfClass:[IOKService class]]";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v17 = 1024;
    v18 = 114;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "addNetworkPortWithService:", v3);
LABEL_4:

  objc_autoreleasePoolPop(v4);
}

void sub_10000A774(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v3 = a2;
  v4 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v7 = 136316418;
    v8 = "strongSelf != nil";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v17 = 1024;
    v18 = 127;
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    goto LABEL_4;
  }
  v6 = objc_opt_class(IOKService);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) == 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_4;
    v7 = 136316418;
    v8 = "[object isKindOfClass:[IOKService class]]";
    v9 = 2048;
    v10 = 0;
    v11 = 2048;
    v12 = 0;
    v13 = 2080;
    v14 = "";
    v15 = 2080;
    v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v17 = 1024;
    v18 = 128;
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "removeNetworkPortWithService:", v3);
LABEL_4:

  objc_autoreleasePoolPop(v4);
}

void sub_10000A954(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;

  v2 = objc_autoreleasePoolPush();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPManager sharedgPTPManager](TSDgPTPManager, "sharedgPTPManager"));
    objc_msgSend(v4, "logInterfaceStatisticsWithError:", 0);

    if (objc_msgSend(WeakRetained[3], "count") && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "==========================================\n", buf, 2u);
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = WeakRetained[3];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[3], "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), (_QWORD)v11));
          objc_msgSend(v10, "logStatistics");

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v17 = "strongSelf != nil";
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = 0;
    v22 = 2080;
    v23 = "";
    v24 = 2080;
    v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/Diagnostics/TSDClockDiagnosticsManager.m";
    v26 = 1024;
    v27 = 141;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10000AB90(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "primeNotification");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "primeNotification");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "primeNotification");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "primeNotification");
  objc_autoreleasePoolPop(v2);
}

void sub_10000B5E0(id a1)
{
  void *v1;
  TSDCallbackRefconMap *v2;
  void *v3;

  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(TSDCallbackRefconMap);
  v3 = (void *)qword_100047BF0;
  qword_100047BF0 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

void sub_10000B96C(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint8_t v5[16];

  dword_100047C10 = getpid();
  dword_100047CE8 = 0;
  v1 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v2 = (void *)qword_100047C18;
  qword_100047C18 = v1;

  v3 = objc_claimAutoreleasedReturnValue(+[TSDDaemonService sharedDaemonService](TSDDaemonService, "sharedDaemonService"));
  v4 = (void *)qword_100047C00;
  qword_100047C00 = v3;

  if (!objc_msgSend((id)qword_100047C00, "registerProcess:withCallback:error:", dword_100047C10, &stru_10003C550, 0)&& os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IODConnection registerProcess failed\n", v5, 2u);
  }
}

void sub_10000C1A4(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;

  v1 = dispatch_queue_create("com.apple.TimeSync.TSIOKServiceMatcherClassNotifier.sharedNotificationsQueue", 0);
  v2 = (void *)qword_100047C20;
  qword_100047C20 = (uint64_t)v1;

  v3 = objc_alloc((Class)IOKNotificationPort);
  v4 = objc_msgSend(v3, "initOnDispatchQueue:", qword_100047C20);
  v5 = (void *)qword_100047C28;
  qword_100047C28 = (uint64_t)v4;

}

void sub_10000C5D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C608(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        v7 = objc_opt_class(IOKService);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
          objc_msgSend(WeakRetained, "handleServiceMatched:", v6);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

        v6 = (void *)v8;
      }
      while (v8);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10000C6C4(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v3 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        v7 = objc_opt_class(IOKService);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
          objc_msgSend(WeakRetained, "handleServiceTerminated:", v6);
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));

        v6 = (void *)v8;
      }
      while (v8);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void sub_10000C780(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "primeNotification");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "primeNotification");
  objc_autoreleasePoolPop(v2);
}

void sub_10000D028(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL4 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "getMatchedCount");
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3 < 1)
  {
    if (v4)
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v6;
      v13 = 1024;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = objc_msgSend(v7, "copy");
    v10 = objc_retainBlock(v9);
    objc_msgSend(v8, "addObject:", v10);

  }
  else
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v5;
      v13 = 1024;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10000D300(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  unsigned int v14;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "getMatchedCount");
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v5;
      v13 = 1024;
      v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v8 = objc_msgSend(v6, "copy");
    v9 = objc_retainBlock(v8);
    objc_msgSend(v7, "addObject:", v9);

  }
  else
  {
    if (v4)
    {
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v10;
      v13 = 1024;
      v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

void sub_10000D550(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];

  v2 = objc_autoreleasePoolPush();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v7) + 16))();
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10000E578(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPPort.sharedNotificationsQueue", 0);
  v2 = (void *)qword_100047C38;
  qword_100047C38 = (uint64_t)v1;

}

void sub_10000E5A4(uint64_t a1, void *a2, int a3)
{
  void *v5;
  _BYTE *WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == -536870608)
    {
      if (WeakRetained[32])
        objc_msgSend(WeakRetained, "updateProperties");
    }
    else if (a3 == -536870896)
    {
      objc_msgSend(WeakRetained, "serviceTerminated");
    }
  }

  objc_autoreleasePoolPop(v5);
}

void sub_10000E6D0(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "portRole") != *(_DWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setPortRole:");
  if (objc_msgSend(*(id *)(a1 + 32), "clockIdentifier") != *(id *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setClockIdentifier:");
  objc_autoreleasePoolPop(v2);
}

void sub_10000F9E0(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  int v4;
  unsigned int v5;
  int v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 v9;
  int v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  int v30;
  void *v31;
  unsigned __int8 v32;
  void *v33;
  unsigned __int8 v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;

  v2 = objc_autoreleasePoolPush();
  if (objc_msgSend(*(id *)(a1 + 32), "remoteClockIdentity") != *(id *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteClockIdentity:");
  if (objc_msgSend(*(id *)(a1 + 32), "remotePortNumber") != *(unsigned __int16 *)(a1 + 124))
    objc_msgSend(*(id *)(a1 + 32), "setRemotePortNumber:");
  v3 = objc_msgSend(*(id *)(a1 + 32), "remoteIsSameDevice");
  v4 = *(unsigned __int8 *)(a1 + 128);
  if (v4 != v3)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteIsSameDevice:", v4 != 0);
  v5 = objc_msgSend(*(id *)(a1 + 32), "isASCapable");
  v6 = *(unsigned __int8 *)(a1 + 129);
  if (v6 != v5)
    objc_msgSend(*(id *)(a1 + 32), "setAsCapable:", v6 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "propagationDelay") != *(_DWORD *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "maximumPropagationDelay") != *(_DWORD *)(a1 + 76))
    objc_msgSend(*(id *)(a1 + 32), "setMaximumPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "minimumPropagationDelay") != *(_DWORD *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "setMinimumPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "maximumRawDelay") != *(_DWORD *)(a1 + 84))
    objc_msgSend(*(id *)(a1 + 32), "setMaximumRawDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "minimumRawDelay") != *(_DWORD *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 32), "setMinimumRawDelay:");
  v7 = objc_msgSend(*(id *)(a1 + 32), "localSyncLogMeanInterval");
  v8 = *(unsigned __int8 *)(a1 + 130);
  if (v8 != v7)
    objc_msgSend(*(id *)(a1 + 32), "setLocalSyncLogMeanInterval:", (char)v8);
  v9 = objc_msgSend(*(id *)(a1 + 32), "remoteSyncLogMeanInterval");
  v10 = *(unsigned __int8 *)(a1 + 131);
  if (v10 != v9)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteSyncLogMeanInterval:", (char)v10);
  v11 = objc_msgSend(*(id *)(a1 + 32), "localAnnounceLogMeanInterval");
  v12 = *(unsigned __int8 *)(a1 + 132);
  if (v12 != v11)
    objc_msgSend(*(id *)(a1 + 32), "setLocalAnnounceLogMeanInterval:", (char)v12);
  v13 = objc_msgSend(*(id *)(a1 + 32), "remoteAnnounceLogMeanInterval");
  v14 = *(unsigned __int8 *)(a1 + 133);
  if (v14 != v13)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteAnnounceLogMeanInterval:", (char)v14);
  if (objc_msgSend(*(id *)(a1 + 32), "localLinkType") != *(unsigned __int8 *)(a1 + 134))
    objc_msgSend(*(id *)(a1 + 32), "setLocalLinkType:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteLinkType") != *(unsigned __int8 *)(a1 + 135))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteLinkType:");
  if (objc_msgSend(*(id *)(a1 + 32), "localTimestampingMode") != *(unsigned __int8 *)(a1 + 136))
    objc_msgSend(*(id *)(a1 + 32), "setLocalTimestampingMode:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteTimestampingMode") != *(unsigned __int8 *)(a1 + 137))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteTimestampingMode:");
  if (objc_msgSend(*(id *)(a1 + 32), "localOscillatorType") != *(unsigned __int8 *)(a1 + 138))
    objc_msgSend(*(id *)(a1 + 32), "setLocalOscillatorType:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteOscillatorType") != *(unsigned __int8 *)(a1 + 139))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteOscillatorType:");
  v15 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyToleranceLower");
  v16 = *(unsigned __int8 *)(a1 + 140);
  if (v16 != v15)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyToleranceLower:", v16 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyToleranceLower") != *(_DWORD *)(a1 + 92))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceLower:");
  v17 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyToleranceUpper");
  v18 = *(unsigned __int8 *)(a1 + 141);
  if (v18 != v17)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyToleranceUpper:", v18 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyToleranceUpper") != *(_DWORD *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceUpper:");
  v19 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyToleranceLower");
  v20 = *(unsigned __int8 *)(a1 + 142);
  if (v20 != v19)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyToleranceLower:", v20 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyToleranceLower") != *(_DWORD *)(a1 + 100))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceLower:");
  v21 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyToleranceUpper");
  v22 = *(unsigned __int8 *)(a1 + 143);
  if (v22 != v21)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyToleranceUpper:", v22 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyToleranceUpper") != *(_DWORD *)(a1 + 104))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceUpper:");
  v23 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyStabilityLower");
  v24 = *(unsigned __int8 *)(a1 + 144);
  if (v24 != v23)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyStabilityLower:", v24 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyStabilityLower") != *(_DWORD *)(a1 + 108))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityLower:");
  v25 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyStabilityUpper");
  v26 = *(unsigned __int8 *)(a1 + 145);
  if (v26 != v25)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyStabilityUpper:", v26 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyStabilityUpper") != *(_DWORD *)(a1 + 112))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityUpper:");
  v27 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyStabilityLower");
  v28 = *(unsigned __int8 *)(a1 + 146);
  if (v28 != v27)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyStabilityLower:", v28 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyStabilityLower") != *(_DWORD *)(a1 + 116))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityLower:");
  v29 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyStabilityUpper");
  v30 = *(unsigned __int8 *)(a1 + 147);
  if (v30 != v29)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyStabilityUpper:", v30 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyStabilityUpper") != *(_DWORD *)(a1 + 120))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityUpper:");
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sourceAddressString"));
  v32 = objc_msgSend(v31, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v32 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setSourceAddressString:", *(_QWORD *)(a1 + 40));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destinationAddressString"));
  v34 = objc_msgSend(v33, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v34 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setDestinationAddressString:", *(_QWORD *)(a1 + 48));
  v35 = objc_msgSend(*(id *)(a1 + 32), "overridenReceiveMatching");
  v36 = *(unsigned __int8 *)(a1 + 148);
  if (v36 != v35)
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveMatching:", v36 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "overridenReceiveClockIdentity") != *(id *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveClockIdentity:");
  if (objc_msgSend(*(id *)(a1 + 32), "overridenReceivePortNumber") != *(unsigned __int16 *)(a1 + 126))
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceivePortNumber:");
  v37 = objc_msgSend(*(id *)(a1 + 32), "enabled");
  v38 = *(unsigned __int8 *)(a1 + 149);
  if (v38 != v37)
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", v38 != 0);
  objc_autoreleasePoolPop(v2);
}

id sub_100011400(uint64_t a1)
{
  id result;

  **(_DWORD **)(a1 + 40) = objc_msgSend(*(id *)(a1 + 32), "portRole");
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4) = objc_msgSend(*(id *)(a1 + 32), "portType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = objc_msgSend(*(id *)(a1 + 32), "localLinkType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = objc_msgSend(*(id *)(a1 + 32), "remoteLinkType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 10) = objc_msgSend(*(id *)(a1 + 32), "localTimestampingMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 11) = objc_msgSend(*(id *)(a1 + 32), "remoteTimestampingMode");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = objc_msgSend(*(id *)(a1 + 32), "remoteClockIdentity");
  result = objc_msgSend(*(id *)(a1 + 32), "remotePortNumber");
  *(_WORD *)(*(_QWORD *)(a1 + 40) + 24) = (_WORD)result;
  return result;
}

void sub_100011638(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "didChangeASCapable:forPort:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100011B30(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "didChangeASCapable:forPort:", *(_QWORD *)(a1 + 48) != 0, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_1000123B0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_autoreleasePoolPush();
  if ((objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOEthernetInterface")) & 1) != 0
    || objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncInterfaceAdapter")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("BSD Name")));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("BSD Name"));

  }
  objc_autoreleasePoolPop(v3);

}

void sub_100012BD8(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  int v4;
  unsigned __int8 v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;
  int v10;

  v2 = objc_autoreleasePoolPush();
  v3 = objc_msgSend(*(id *)(a1 + 32), "localPDelayLogMeanInterval");
  v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v3)
    objc_msgSend(*(id *)(a1 + 32), "setLocalPDelayLogMeanInterval:", (char)v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "remotePDelayLogMeanInterval");
  v6 = *(unsigned __int8 *)(a1 + 49);
  if (v6 != v5)
    objc_msgSend(*(id *)(a1 + 32), "setRemotePDelayLogMeanInterval:", (char)v6);
  v7 = objc_msgSend(*(id *)(a1 + 32), "multipleRemotes");
  v8 = *(unsigned __int8 *)(a1 + 50);
  if (v8 != v7)
    objc_msgSend(*(id *)(a1 + 32), "setMultipleRemotes:", v8 != 0);
  v9 = objc_msgSend(*(id *)(a1 + 32), "measuringPDelay");
  v10 = *(unsigned __int8 *)(a1 + 51);
  if (v10 != v9)
    objc_msgSend(*(id *)(a1 + 32), "setMeasuringPDelay:", v10 != 0);
  objc_msgSend(*(id *)(a1 + 32), "setStatistics:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100014458(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  objc_msgSend(*(id *)(a1 + 32), "setStatistics:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100016628(id a1)
{
  TSTimeConverter *v1;
  void *v2;

  v1 = objc_alloc_init(TSTimeConverter);
  v2 = (void *)qword_100047C48;
  qword_100047C48 = (uint64_t)v1;

}

void sub_100017178(id a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = objc_alloc_init((Class)NSISO8601DateFormatter);
  v2 = (void *)qword_100047C58;
  qword_100047C58 = (uint64_t)v1;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", CFSTR("UTC")));
  objc_msgSend((id)qword_100047C58, "setTimeZone:", v3);

  objc_msgSend((id)qword_100047C58, "setFormatOptions:", 3955);
}

void sub_100017EAC(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.TimeSync.TSDDaemonService.shared", 0);
  v2 = (void *)qword_100047C70;
  qword_100047C70 = (uint64_t)v1;

}

void sub_100017ED8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  if (!qword_100047C68)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "daemonService"));
    v4 = (void *)qword_100047C68;
    qword_100047C68 = v3;

  }
  objc_autoreleasePoolPop(v2);
}

_DWORD *sub_100019238(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _DWORD *v8;
  void *v9;
  void *v10;
  id v11;

  if (*(_DWORD *)(a2 + 16) != 3)
    return 0;
  v3 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 32)), "diagnosticInfoForClockIdentifier:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v4, 200, 0, 0));
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "length");
    v8 = malloc_type_calloc(1uLL, (size_t)v7 + 200, 0x92284479uLL);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clockName"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ State:"), v9));

      *v8 = 1;
      v8[1] = (_DWORD)v7;
      v11 = objc_retainAutorelease(v10);
      __strlcpy_chk(v8 + 34, objc_msgSend(v11, "UTF8String"), 64, 64);
      memcpy(v8 + 50, objc_msgSend(objc_retainAutorelease(v6), "bytes"), (size_t)v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

unint64_t sub_100019390(int a1)
{
  uint64_t v1;

  if (a1 < 4)
  {
    if (a1 > -7)
    {
      if (a1 < 0)
        return 0x3B9ACA00uLL >> -(char)a1;
      else
        return 1000000000 << a1;
    }
    else
    {
      v1 = 15625000;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_100027EB4();
    }
  }
  else
  {
    v1 = 8000000000;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_100027E48();
  }
  return v1;
}

void sub_100019C58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x14u);
}

void sub_100019D34(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("ClockIdentifier")));
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void sub_10001A490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A4B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v7 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterestNotification:withArgument:", a3, a4);

  objc_autoreleasePoolPop(v7);
}

void sub_10001C198(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "lockState"))
    objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10001C4B8(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "lockState"))
    objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_10001CEFC(id a1)
{
  uint64_t v1;
  void *v2;
  os_log_t v3;
  void *v4;

  v1 = objc_claimAutoreleasedReturnValue(+[TSDDaemonService sharedDaemonService](TSDDaemonService, "sharedDaemonService"));
  v2 = (void *)qword_100047CF0;
  qword_100047CF0 = v1;

  v3 = os_log_create("TimeSync", "iokit_get_property_proxy_server");
  v4 = (void *)qword_100047C80;
  qword_100047C80 = (uint64_t)v3;

}

void sub_10001D130(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001D154(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained[2];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D208;
  v5[3] = &unk_10003CD48;
  objc_copyWeak(&v7, v2);
  v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v7);
}

void sub_10001D208(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  id *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = objc_autoreleasePoolPush();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    v6 = WeakRetained[3];
    v7 = v5;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (*(id *)(v12 + 8) == v7)
          {
            v13 = *(void **)(v12 + 16);
            *(_QWORD *)(v12 + 16) = 0;

            v14 = *(void **)(v12 + 8);
            *(_QWORD *)(v12 + 8) = 0;

            objc_msgSend(v6, "removeObject:", v12);
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

    objc_msgSend((id)qword_100047CF0, "deregisterProcess:error:", objc_msgSend(*(id *)(a1 + 32), "processIdentifier"), 0);
    if (!objc_msgSend(v4[3], "count"))
    {
      v15 = v4[4];
      v4[4] = 0;

    }
  }

  objc_autoreleasePoolPop(v2);
}

void sub_10001D3A4(uint64_t a1)
{
  void *v2;
  NSXPCConnection *v3;
  id v4;
  ConnectionData *v5;
  NSXPCConnection *clientConnection;
  NSXPCConnection *v7;
  uint64_t v8;
  BarrierBlockTimout *barrierBlockTimout;
  void *v10;
  id v11;
  unsigned int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int16 v18[8];
  _QWORD v19[4];
  id v20;
  id v21;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = (NSXPCConnection *)*(id *)(a1 + 40);
  v4 = v2;
  v5 = objc_alloc_init(ConnectionData);
  clientConnection = v5->clientConnection;
  v5->clientConnection = v3;
  v7 = v3;

  v8 = objc_claimAutoreleasedReturnValue(+[BarrierBlockTimout create](BarrierBlockTimout, "create"));
  barrierBlockTimout = v5->barrierBlockTimout;
  v5->barrierBlockTimout = (BarrierBlockTimout *)v8;

  objc_msgSend(v4, "addObject:", v5);
  v10 = (void *)qword_100047CF0;
  if (qword_100047CF0)
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "processIdentifier");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10001D5B4;
    v19[3] = &unk_10003CD70;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    v20 = *(id *)(a1 + 40);
    v12 = objc_msgSend(v10, "registerProcess:withCallback:error:", v11, v19, 0);
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 40), "resume");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteObjectProxy"));
      v14 = v13;
      if (v12 == 2)
        objc_msgSend(v13, "daemonClientRefresh");

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v18[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonServiceServer registerProcess failed\n", (uint8_t *)v18, 2u);
      }
      objc_msgSend((id)qword_100047CF0, "deregisterProcess:error:", objc_msgSend(*(id *)(a1 + 40), "processIdentifier"), 0);
    }

    objc_destroyWeak(&v21);
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") == (id)1)
  {
    v15 = os_transaction_create("TSDDaemonServiceServer keepalive");
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 32);
    *(_QWORD *)(v16 + 32) = v15;

  }
}

void sub_10001D598(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001D5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  id WeakRetained;

  v10 = objc_autoreleasePoolPush();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "dispatchDaemonServiceCallbackForProcess:clientID:ioResult:args:numArgs:", objc_msgSend(*(id *)(a1 + 32), "processIdentifier"), a2, a3, a4, a5);

  objc_autoreleasePoolPop(v10);
}

void sub_10001D69C(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  id *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  int v15;
  _OWORD v16[8];
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id location;
  __int16 v23;
  int v24;
  __int16 v25;
  _QWORD *v26;
  _BYTE v27[128];

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v2);
        v6 = *(id **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6[1], "processIdentifier") == *(_DWORD *)(a1 + 48)
          && *(_QWORD *)(a1 + 40)
          && *(_DWORD *)(a1 + 52) <= 0x10u)
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6[1], "remoteObjectProxy"));
          v17 = 0;
          memset(v16, 0, sizeof(v16));
          __memmove_chk(v16, *(_QWORD *)(a1 + 40), 8 * *(unsigned int *)(a1 + 52), 136);
          LODWORD(v17) = *(_DWORD *)(a1 + 52);
          if ((objc_msgSend(v6[2], "armAndTestIfExpired") & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v8 = *(_DWORD *)(a1 + 48);
              v9 = *(_DWORD *)(a1 + 56);
              v10 = *(_QWORD **)(a1 + 40);
              if (v10)
              {
                if (*(_DWORD *)(a1 + 52))
                  v10 = (_QWORD *)*v10;
                else
                  v10 = 0;
              }
              LODWORD(location) = 67109632;
              HIDWORD(location) = v8;
              v23 = 1024;
              v24 = v9;
              v25 = 2048;
              v26 = v10;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "dispatchDaemonServiceCallbackForProcess process %u appears suspended, dropping message to client %u arg0 %llu\n", (uint8_t *)&location, 0x18u);
            }
          }
          else
          {
            objc_msgSend(v7, "daemonClientNotification:ioResult:arguments:", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60), v16);
            objc_initWeak(&location, v6);
            v11 = v6[1];
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10001D960;
            v12[3] = &unk_10003CDC0;
            objc_copyWeak(&v14, &location);
            v15 = *(_DWORD *)(a1 + 48);
            v13 = v7;
            objc_msgSend(v11, "scheduleSendBarrierBlock:", v12);

            objc_destroyWeak(&v14);
            objc_destroyWeak(&location);
          }

          goto LABEL_21;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_21:

}

void sub_10001D93C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_10001D960(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  int v4;
  _DWORD v5[2];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained[2], "disarmAndTestIfWasExpired"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 48);
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemonServiceServer process %d resumed\n", (uint8_t *)v5, 8u);
    }
    objc_msgSend(*(id *)(a1 + 32), "daemonClientRefresh");
  }

}

void sub_10001E3E8(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  v2 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon clock manager is available\n", buf, 2u);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
  objc_msgSend(v3, "addgPTPServicesWithError:", 0);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon waiting for gPTP manager to become available\n", buf, 2u);
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E508;
  v4[3] = &unk_10003C4B0;
  v4[4] = *(_QWORD *)(a1 + 32);
  +[TSDgPTPManager notifyWhengPTPManagerIsAvailable:](TSDgPTPManager, "notifyWhengPTPManagerIsAvailable:", v4);
  objc_autoreleasePoolPop(v2);
}

void sub_10001E508(uint64_t a1)
{
  void *v2;
  TSDClockDiagnosticsManager *v3;
  uint64_t v4;
  void *v5;
  TSDDaemonServiceServer *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TSDDaemon gPTP manager is available\n", v9, 2u);
  }
  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(TSDClockDiagnosticsManager);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v6 = objc_alloc_init(TSDDaemonServiceServer);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v6;

  }
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_10001EEC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001EF4C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001EF58(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  id v3;

  v1 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.shared", 0);
  v2 = (void *)qword_100047CA8;
  qword_100047CA8 = (uint64_t)v1;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[TSDClockManager sharedClockManager](TSDClockManager, "sharedClockManager"));
  objc_msgSend(v3, "addgPTPServicesWithError:", 0);

}

intptr_t sub_10001F0B8(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10001F440(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001F450(uint64_t a1)
{

}

void sub_10001F458(uint64_t a1)
{
  void *v2;
  TSDgPTPClock *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = -[TSDKernelClock initWithClockIdentifier:]([TSDgPTPClock alloc], "initWithClockIdentifier:", objc_msgSend(*(id *)(a1 + 32), "systemDomainClockIdentifier"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void sub_100020610(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_autoreleasePoolPush();
  if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncDomain")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDgPTPClock diagnosticInfoForService:](TSDgPTPClock, "diagnosticInfoForService:", v5));
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  objc_autoreleasePoolPop(v3);

}

void sub_100020840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1000208D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_1000208EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100020974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

uint64_t sub_10002098C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000209C8(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.TimeSync.TSDClockManager.shared", 0);
  v2 = (void *)qword_100047CC8;
  qword_100047CC8 = (uint64_t)v1;

}

void sub_100020C04(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_100020F18(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100021B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100021E20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_100022064(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100022618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100022818(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1000229AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100022B04(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iodPropertyForKey:", CFSTR("ClockIdentifier")));
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void sub_100024A78(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = objc_autoreleasePoolPush();
  v3 = *(id *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "grandmasterIdentity"))
    objc_msgSend(*(id *)(a1 + 32), "setGrandmasterIdentity:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100024AC0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = *(void **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "gptpPath"));
  LOBYTE(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setGptpPath:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void sub_100024D84(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(id *)(a1 + 48);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "grandmasterIdentity"))
    objc_msgSend(*(id *)(a1 + 32), "setGrandmasterIdentity:", *(_QWORD *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gptpPath"));
  LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setGptpPath:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void sub_100026FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026FDC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100026FEC(uint64_t a1)
{

}

void sub_100026FF4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_autoreleasePoolPush();
  if (objc_msgSend(v9, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "iodPropertyForKey:", CFSTR("PortNumber")));
    v5 = v4;
    if (v4 && objc_msgSend(v4, "unsignedShortValue") == *(unsigned __int16 *)(a1 + 40))
    {
      v6 = objc_claimAutoreleasedReturnValue(+[TSDgPTPPort gPTPPortWithService:](TSDgPTPPort, "gPTPPortWithService:", v9));
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  objc_autoreleasePoolPop(v3);

}

void sub_100027260(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  __objc2_class *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_autoreleasePoolPush();
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPEthernetPort;
LABEL_19:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class diagnosticInfoForService:](v5, "diagnosticInfoForService:", v7));
    objc_msgSend(v4, "addObject:", v6);

    goto LABEL_20;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastLinkLayerPtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastLinkLayerEtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastUDPv4PtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastUDPv6PtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastUDPv4EtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPUnicastUDPv6EtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPLocalClockPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = TSDgPTPPort;
    goto LABEL_19;
  }
LABEL_20:
  objc_autoreleasePoolPop(v3);

}

uint64_t sub_100027A10(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 sub_100027A28@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  __n128 v16;
  __n128 result;
  __int128 v18;
  __n128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28[4];

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v5 = *a1;
  v4 = a1[1];
  v7 = *a2;
  v6 = a2[1];
  v8 = sub_100009348(v4, v6);
  v10 = v9;
  v11 = sub_100009348(v5, v7);
  v13 = v12;
  v24 = sub_100009348(v4, v7);
  v25 = v14;
  v26 = 0;
  v27 = 0;
  *(_QWORD *)&v22 = sub_100009348(v5, v6);
  *((_QWORD *)&v22 + 1) = v15;
  v23 = 0uLL;
  sub_100027B3C((unint64_t *)&v24, (unint64_t *)&v22, v28);
  v26 = v8;
  v27 = v10;
  v24 = 0;
  v25 = 0;
  sub_100008F44(v28, 64, (uint64_t)&v20);
  v22 = v20;
  v23 = v21;
  v21 = 0uLL;
  *(_QWORD *)&v20 = v11;
  *((_QWORD *)&v20 + 1) = v13;
  sub_100027B3C((unint64_t *)&v24, (unint64_t *)&v22, (unint64_t *)&v18);
  v16 = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = v16;
  sub_100027B3C((unint64_t *)a3, (unint64_t *)&v20, (unint64_t *)&v18);
  result = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

unint64_t *sub_100027B3C@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  int v16;
  BOOL v17;
  BOOL v18;
  BOOL v19;

  v3 = result[2];
  v4 = a2[2];
  v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4)
    v6 = 1;
  else
    v6 = v6;
  v7 = a2[3] + result[3] + v6;
  v9 = *result;
  v8 = result[1];
  v11 = *a2;
  v10 = a2[1];
  v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11)
    v13 = 1;
  else
    v13 = v13;
  v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (v15 = v12 >= v9) : (v15 = 1),
        v15 ? (v16 = 0) : (v16 = 1),
        v12 < v11 ? (v17 = v10 == v14) : (v17 = 0),
        !v17 ? (v18 = v8 > v14) : (v18 = 1),
        !v18 ? (v19 = v16 == 0) : (v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1)
      a3[3] = v7 + 1;
  }
  return result;
}

double sub_100027BC4@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v4[2];

  v4[0] = a2;
  v4[1] = 0;
  *(_QWORD *)&result = sub_100027A28(a1, v4, a3).n128_u64[0];
  return result;
}

double sub_100027BE8@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  double result;
  uint64_t v4[2];

  v4[0] = a1;
  v4[1] = 0;
  *(_QWORD *)&result = sub_100027A28(v4, a2, a3).n128_u64[0];
  return result;
}

void sub_100027C4C(id a1)
{
  void *v1;
  TSDClockSyncManager *v2;
  void *v3;

  v1 = objc_autoreleasePoolPush();
  v2 = objc_alloc_init(TSDClockSyncManager);
  v3 = (void *)qword_100047CE0;
  qword_100047CE0 = (uint64_t)v2;

  objc_autoreleasePoolPop(v1);
}

void sub_100027E48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100019C34();
  sub_100019C58((void *)&_mh_execute_header, &_os_log_default, v0, "logMeanInterval %hhd is larger than %d, capping at %d\n", v1, v2, v3, v4, v5);
}

void sub_100027EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100019C34();
  sub_100019C58((void *)&_mh_execute_header, &_os_log_default, v0, "logMeanInterval %hhd is smaller than %d, capping at %d\n", v1, v2, v3, v4, v5);
}

void sub_100027F20()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "DaemonServiceMatcher failed waiting for daemon service\n", v0, 2u);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__clockIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clockIdentifier");
}

id objc_msgSend__destinationAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destinationAddressString");
}

id objc_msgSend__destinationIPv4Address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destinationIPv4Address");
}

id objc_msgSend__destinationIPv6Address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destinationIPv6Address");
}

id objc_msgSend__destinationMACAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_destinationMACAddress");
}

id objc_msgSend__enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enabled");
}

id objc_msgSend__gptpPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gptpPath");
}

id objc_msgSend__grandmasterIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_grandmasterIdentity");
}

id objc_msgSend__handleInterestNotification_withArgument_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleInterestNotification:withArgument:");
}

id objc_msgSend__handleNotification_withArg1_arg2_arg3_arg4_arg5_arg6_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleNotification:withArg1:arg2:arg3:arg4:arg5:arg6:");
}

id objc_msgSend__handleNotification_withArgs_ofCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleNotification:withArgs:ofCount:");
}

id objc_msgSend__handleRefreshConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleRefreshConnection");
}

id objc_msgSend__hasLocalFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasLocalFrequencyStabilityLower");
}

id objc_msgSend__hasLocalFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasLocalFrequencyStabilityUpper");
}

id objc_msgSend__hasLocalFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasLocalFrequencyToleranceLower");
}

id objc_msgSend__hasLocalFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasLocalFrequencyToleranceUpper");
}

id objc_msgSend__hasRemoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasRemoteFrequencyStabilityLower");
}

id objc_msgSend__hasRemoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasRemoteFrequencyStabilityUpper");
}

id objc_msgSend__hasRemoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasRemoteFrequencyToleranceLower");
}

id objc_msgSend__hasRemoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasRemoteFrequencyToleranceUpper");
}

id objc_msgSend__interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_interfaceName");
}

id objc_msgSend__isASCapable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isASCapable");
}

id objc_msgSend__localAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localAnnounceLogMeanInterval");
}

id objc_msgSend__localFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localFrequencyStabilityLower");
}

id objc_msgSend__localFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localFrequencyStabilityUpper");
}

id objc_msgSend__localFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localFrequencyToleranceLower");
}

id objc_msgSend__localFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localFrequencyToleranceUpper");
}

id objc_msgSend__localLinkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localLinkType");
}

id objc_msgSend__localOscillatorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localOscillatorType");
}

id objc_msgSend__localPDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localPDelayLogMeanInterval");
}

id objc_msgSend__localSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localSyncLogMeanInterval");
}

id objc_msgSend__localTimestampingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localTimestampingMode");
}

id objc_msgSend__lockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lockState");
}

id objc_msgSend__maximumPropagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maximumPropagationDelay");
}

id objc_msgSend__maximumRawDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maximumRawDelay");
}

id objc_msgSend__measuringPDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_measuringPDelay");
}

id objc_msgSend__minimumPropagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_minimumPropagationDelay");
}

id objc_msgSend__minimumRawDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_minimumRawDelay");
}

id objc_msgSend__multipleRemotes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_multipleRemotes");
}

id objc_msgSend__overridenReceiveClockIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_overridenReceiveClockIdentity");
}

id objc_msgSend__overridenReceiveMatching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_overridenReceiveMatching");
}

id objc_msgSend__overridenReceivePortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_overridenReceivePortNumber");
}

id objc_msgSend__portNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_portNumber");
}

id objc_msgSend__portRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_portRole");
}

id objc_msgSend__propagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_propagationDelay");
}

id objc_msgSend__propagationDelayLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_propagationDelayLimit");
}

id objc_msgSend__refreshGrandmasterIdentityOnNotificationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshGrandmasterIdentityOnNotificationQueue");
}

id objc_msgSend__remoteAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteAnnounceLogMeanInterval");
}

id objc_msgSend__remoteClockIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteClockIdentity");
}

id objc_msgSend__remoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteFrequencyStabilityLower");
}

id objc_msgSend__remoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteFrequencyStabilityUpper");
}

id objc_msgSend__remoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteFrequencyToleranceLower");
}

id objc_msgSend__remoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteFrequencyToleranceUpper");
}

id objc_msgSend__remoteIsSameDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteIsSameDevice");
}

id objc_msgSend__remoteLinkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteLinkType");
}

id objc_msgSend__remoteOscillatorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteOscillatorType");
}

id objc_msgSend__remotePDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remotePDelayLogMeanInterval");
}

id objc_msgSend__remotePortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remotePortNumber");
}

id objc_msgSend__remoteSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteSyncLogMeanInterval");
}

id objc_msgSend__remoteTimestampingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteTimestampingMode");
}

id objc_msgSend__sourceAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sourceAddressString");
}

id objc_msgSend__statistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_statistics");
}

id objc_msgSend_addClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addClient:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addInterestNotifcationOfType_usingNotificationPort_error_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInterestNotifcationOfType:usingNotificationPort:error:withHandler:");
}

id objc_msgSend_addNetworkPortWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNetworkPortWithService:");
}

id objc_msgSend_addNotificationOfType_forMatching_usingNotificationPort_error_withEnumerationBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:");
}

id objc_msgSend_addNotificationOfType_forMatching_usingNotificationPort_error_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationOfType:forMatching:usingNotificationPort:error:withHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_addReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addReference");
}

id objc_msgSend_addStatisticsWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addStatisticsWithIdentifier:");
}

id objc_msgSend_addgPTPServicesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addgPTPServicesWithError:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allocateRefcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocateRefcon:");
}

id objc_msgSend_allowedLostResponsesExceededCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedLostResponsesExceededCounter");
}

id objc_msgSend_announceReceiptTimeoutCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "announceReceiptTimeoutCounter");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_armAndTestIfExpired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "armAndTestIfExpired");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithContentsOfURL:");
}

id objc_msgSend_attemptedAnnounceCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedAnnounceCounter");
}

id objc_msgSend_attemptedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedDelayRequestCounter");
}

id objc_msgSend_attemptedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedDelayResponseCounter");
}

id objc_msgSend_attemptedFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedFollowUpCounter");
}

id objc_msgSend_attemptedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedPDelayRequestCounter");
}

id objc_msgSend_attemptedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedPDelayResponseCounter");
}

id objc_msgSend_attemptedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedPDelayResponseFollowUpCounter");
}

id objc_msgSend_attemptedSignalCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedSignalCounter");
}

id objc_msgSend_attemptedSyncCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attemptedSyncCounter");
}

id objc_msgSend_availableKernelClockIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableKernelClockIdentifiers");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calculatePercentages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calculatePercentages");
}

id objc_msgSend_callAsyncMethodWithSelector_wakePort_reference_referenceCount_scalarInputs_scalarInputCount_scalarOutputs_scalarOutputCount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callAsyncMethodWithSelector:wakePort:reference:referenceCount:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodForDaemonClient_clientMethodSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodForDaemonClient:clientMethodSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_scalarOutputs_scalarOutputCount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:error:");
}

id objc_msgSend_callMethodWithSelector_scalarInputs_scalarInputCount_structInput_structInputSize_scalarOutputs_scalarOutputCount_structOutput_structOutputSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodWithSelector:scalarInputs:scalarInputCount:structInput:structInputSize:scalarOutputs:scalarOutputCount:structOutput:structOutputSize:error:");
}

id objc_msgSend_callMethodWithSelector_structInput_structInputSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callMethodWithSelector:structInput:structInputSize:error:");
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "charValue");
}

id objc_msgSend_childIteratorInServicePlaneWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childIteratorInServicePlaneWithError:");
}

id objc_msgSend_classNameForClockService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classNameForClockService:");
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clients");
}

id objc_msgSend_clockIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockIdentifier");
}

id objc_msgSend_clockIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockIdentity");
}

id objc_msgSend_clockManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockManager");
}

id objc_msgSend_clockName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockName");
}

id objc_msgSend_clockNameForClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockNameForClockIdentifier:");
}

id objc_msgSend_clockWithClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clockWithClockIdentifier:");
}

id objc_msgSend_closeDaemonClient_daemonClientID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeDaemonClient:daemonClientID:error:");
}

id objc_msgSend_coefficient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coefficient");
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compact");
}

id objc_msgSend_conformsToIOClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToIOClassName:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constant");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_coreAudioReanchors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreAudioReanchors");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "create");
}

id objc_msgSend_daemonClientNotification_ioResult_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonClientNotification:ioResult:arguments:");
}

id objc_msgSend_daemonClientRefresh(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonClientRefresh");
}

id objc_msgSend_daemonService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemonService");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_defaultClockPersonalities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultClockPersonalities");
}

id objc_msgSend_deregisterAsyncCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterAsyncCallback");
}

id objc_msgSend_deregisterAsyncCallbackError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterAsyncCallbackError:");
}

id objc_msgSend_deregisterAsyncNotificationsWithSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterAsyncNotificationsWithSelector:");
}

id objc_msgSend_deregisterProcess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterProcess:error:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destinationAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationAddressString");
}

id objc_msgSend_diagnosticInfoForClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticInfoForClockIdentifier:");
}

id objc_msgSend_diagnosticInfoForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticInfoForService:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAnnounceTimeoutForPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didAnnounceTimeoutForPort:");
}

id objc_msgSend_didBeginClockGrandmasterChangeForClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didBeginClockGrandmasterChangeForClock:");
}

id objc_msgSend_didBeginClockGrandmasterChangeWithGrandmasterID_localPort_forClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didBeginClockGrandmasterChangeWithGrandmasterID:localPort:forClock:");
}

id objc_msgSend_didChangeASCapable_forPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeASCapable:forPort:");
}

id objc_msgSend_didChangeAdministrativeEnable_forPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeAdministrativeEnable:forPort:");
}

id objc_msgSend_didChangeClockMasterForClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeClockMasterForClock:");
}

id objc_msgSend_didChangeLocalPortWithGrandmasterID_localPort_forClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeLocalPortWithGrandmasterID:localPort:forClock:");
}

id objc_msgSend_didChangeLockStateTo_forClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeLockStateTo:forClock:");
}

id objc_msgSend_didEndClockGrandmasterChangeForClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEndClockGrandmasterChangeForClock:");
}

id objc_msgSend_didEndClockGrandmasterChangeWithGrandmasterID_localPort_forClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didEndClockGrandmasterChangeWithGrandmasterID:localPort:forClock:");
}

id objc_msgSend_didGetStatsOfLocalPortNumber_mean_median_stddev_min_max_numberOfSamples_forClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didGetStatsOfLocalPortNumber:mean:median:stddev:min:max:numberOfSamples:forClock:");
}

id objc_msgSend_didProcessSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didProcessSync:");
}

id objc_msgSend_didResetClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didResetClock:");
}

id objc_msgSend_didSyncTimeoutForPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSyncTimeoutForPort:");
}

id objc_msgSend_didSyncTimeoutWithMean_median_standardDeviation_minimum_maximum_numberOfSamples_forPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:");
}

id objc_msgSend_didTerminateServiceForPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didTerminateServiceForPort:");
}

id objc_msgSend_didTimeoutOnMACLookupForPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didTimeoutOnMACLookupForPort:");
}

id objc_msgSend_disarmAndTestIfWasExpired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disarmAndTestIfWasExpired");
}

id objc_msgSend_discardedDelayLimitExceededMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discardedDelayLimitExceededMeasurements");
}

id objc_msgSend_discardedOutOfBoundsMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discardedOutOfBoundsMeasurements");
}

id objc_msgSend_discardedPpmLimitMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discardedPpmLimitMeasurements");
}

id objc_msgSend_discardedTimestampsOutOfOrderMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "discardedTimestampsOutOfOrderMeasurements");
}

id objc_msgSend_dispatchDaemonServiceCallbackForProcess_clientID_ioResult_args_numArgs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchDaemonServiceCallbackForProcess:clientID:ioResult:args:numArgs:");
}

id objc_msgSend_dispatchNotificationForClientID_ioResult_args_numArgs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchNotificationForClientID:ioResult:args:numArgs:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_droppedMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "droppedMeasurements");
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enabled");
}

id objc_msgSend_entryID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryID");
}

id objc_msgSend_entryIDMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entryIDMatching:");
}

id objc_msgSend_enumerateWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateWithBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_extendedWeek(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendedWeek");
}

id objc_msgSend_filterResetsDroppedLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterResetsDroppedLimit");
}

id objc_msgSend_filterResetsOutOfBounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterResetsOutOfBounds");
}

id objc_msgSend_finalizeClock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeClock");
}

id objc_msgSend_finalizeNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeNotifications");
}

id objc_msgSend_gPTPManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gPTPManager");
}

id objc_msgSend_gPTPPortWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gPTPPortWithService:");
}

id objc_msgSend_getDelta_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDelta:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_forGrandmasterIdentity_portNumber_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:");
}

id objc_msgSend_getMachAbsoluteRateRatioNumerator_denominator_machAnchor_andDomainAnchor_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMachAbsoluteRateRatioNumerator:denominator:machAnchor:andDomainAnchor:withError:");
}

id objc_msgSend_getMatchedCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMatchedCount");
}

id objc_msgSend_getMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMetrics");
}

id objc_msgSend_getObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getObject:");
}

id objc_msgSend_getTimeSyncTimeClockID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSyncTimeClockID:error:");
}

id objc_msgSend_getTimeSyncTimeIsMachAbsolute_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSyncTimeIsMachAbsolute:error:");
}

id objc_msgSend_getTimeSyncTimeRateRatioNumerator_denominator_timeSyncAnchor_andDomainAnchor_forGrandmasterIdentity_portNumber_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:forGrandmasterIdentity:portNumber:withError:");
}

id objc_msgSend_getTimeSyncTimeRateRatioNumerator_denominator_timeSyncAnchor_andDomainAnchor_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSyncTimeRateRatioNumerator:denominator:timeSyncAnchor:andDomainAnchor:withError:");
}

id objc_msgSend_gmChangesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gmChangesCount");
}

id objc_msgSend_gptpPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gptpPath");
}

id objc_msgSend_grandmasterIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "grandmasterIdentity");
}

id objc_msgSend_handleNotification_clientID_result_withArgs_ofCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNotification:clientID:result:withArgs:ofCount:");
}

id objc_msgSend_handleServiceMatched_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleServiceMatched:");
}

id objc_msgSend_handleServiceTerminated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleServiceTerminated:");
}

id objc_msgSend_hasLocalFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocalFrequencyStabilityLower");
}

id objc_msgSend_hasLocalFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocalFrequencyStabilityUpper");
}

id objc_msgSend_hasLocalFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocalFrequencyToleranceLower");
}

id objc_msgSend_hasLocalFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLocalFrequencyToleranceUpper");
}

id objc_msgSend_hasRemoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRemoteFrequencyStabilityLower");
}

id objc_msgSend_hasRemoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRemoteFrequencyStabilityUpper");
}

id objc_msgSend_hasRemoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRemoteFrequencyToleranceLower");
}

id objc_msgSend_hasRemoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRemoteFrequencyToleranceUpper");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initOnDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initOnDispatchQueue:");
}

id objc_msgSend_initWithClock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClock:");
}

id objc_msgSend_initWithClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClockIdentifier:");
}

id objc_msgSend_initWithClockIdentifier_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClockIdentifier:pid:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithNanosecondsSinceEpoch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNanosecondsSinceEpoch:");
}

id objc_msgSend_initWithNanosecondsSinceEpoch_onGrandmaster_withLocalPortNumber_ptpTimescale_timeTraceable_frequencyTraceable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNanosecondsSinceEpoch:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:");
}

id objc_msgSend_initWithPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPort:");
}

id objc_msgSend_initWithSeconds_nanoseconds_onGrandmaster_withLocalPortNumber_ptpTimescale_timeTraceable_frequencyTraceable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSeconds:nanoseconds:onGrandmaster:withLocalPortNumber:ptpTimescale:timeTraceable:frequencyTraceable:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithService_andType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:andType:");
}

id objc_msgSend_initWithTAIDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTAIDate:");
}

id objc_msgSend_initWithTAIUTCArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTAIUTCArray:");
}

id objc_msgSend_initWithUTCDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTCDate:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_ioClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioClassName");
}

id objc_msgSend_iodProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iodProperties");
}

id objc_msgSend_iodPropertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iodPropertyForKey:");
}

id objc_msgSend_iokitMatchingDictionaryForClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:");
}

id objc_msgSend_iokitMatchingDictionaryForClockIdentifier_andPortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iokitMatchingDictionaryForClockIdentifier:andPortNumber:");
}

id objc_msgSend_isASCapable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isASCapable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFrequencyTraceable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFrequencyTraceable");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isPTPTimescale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPTPTimescale");
}

id objc_msgSend_isTimeTraceable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTimeTraceable");
}

id objc_msgSend_leapSecondForTAIDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leapSecondForTAIDate:");
}

id objc_msgSend_leapSecondForUTCDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leapSecondForUTCDate:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localAnnounceLogMeanInterval");
}

id objc_msgSend_localFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localFrequencyStabilityLower");
}

id objc_msgSend_localFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localFrequencyStabilityUpper");
}

id objc_msgSend_localFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localFrequencyToleranceLower");
}

id objc_msgSend_localFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localFrequencyToleranceUpper");
}

id objc_msgSend_localLinkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localLinkType");
}

id objc_msgSend_localOscillatorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localOscillatorType");
}

id objc_msgSend_localPDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localPDelayLogMeanInterval");
}

id objc_msgSend_localPortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localPortNumber");
}

id objc_msgSend_localSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSyncLogMeanInterval");
}

id objc_msgSend_localTimestampingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTimestampingMode");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockState");
}

id objc_msgSend_logInterfaceStatisticsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logInterfaceStatisticsWithError:");
}

id objc_msgSend_logStatistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logStatistics");
}

id objc_msgSend_machAbsoluteTicksToNanoseconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machAbsoluteTicksToNanoseconds:");
}

id objc_msgSend_machPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "machPort");
}

id objc_msgSend_matchingService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchingService:");
}

id objc_msgSend_matchingServices_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchingServices:error:");
}

id objc_msgSend_maximumPropagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumPropagationDelay");
}

id objc_msgSend_maximumRawDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumRawDelay");
}

id objc_msgSend_measuringPDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "measuringPDelay");
}

id objc_msgSend_minimumPropagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumPropagationDelay");
}

id objc_msgSend_minimumRawDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumRawDelay");
}

id objc_msgSend_modifiedJulianDay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifiedJulianDay");
}

id objc_msgSend_multipleRemotes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multipleRemotes");
}

id objc_msgSend_nanoseconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nanoseconds");
}

id objc_msgSend_nanosecondsSinceEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nanosecondsSinceEpoch");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_notificationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationQueue");
}

id objc_msgSend_notifyWhenClockManagerIsAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhenClockManagerIsAvailable:");
}

id objc_msgSend_notifyWhenServiceIsAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhenServiceIsAvailable:");
}

id objc_msgSend_notifyWhenServiceIsUnavailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhenServiceIsUnavailable:");
}

id objc_msgSend_notifyWhengPTPManagerIsAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyWhengPTPManagerIsAvailable:");
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

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
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

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offset");
}

id objc_msgSend_openDaemonClient_withRegistryEntryID_clientType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openDaemonClient:withRegistryEntryID:clientType:error:");
}

id objc_msgSend_overridenReceiveClockIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridenReceiveClockIdentity");
}

id objc_msgSend_overridenReceiveMatching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridenReceiveMatching");
}

id objc_msgSend_overridenReceivePortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridenReceivePortNumber");
}

id objc_msgSend_parentIteratorInServicePlaneWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentIteratorInServicePlaneWithError:");
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerAtIndex:");
}

id objc_msgSend_portIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portIdentifier");
}

id objc_msgSend_portNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portNumber");
}

id objc_msgSend_portRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portRole");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portType");
}

id objc_msgSend_portWithPortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portWithPortNumber:");
}

id objc_msgSend_ports(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ports");
}

id objc_msgSend_primeNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primeNotification");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_propagationDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propagationDelay");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "properties");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_propertyUpdateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyUpdateQueue");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rawDelayExceededCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawDelayExceededCounter");
}

id objc_msgSend_rawDelayMeasurementCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawDelayMeasurementCounter");
}

id objc_msgSend_receivedAnnounceCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedAnnounceCounter");
}

id objc_msgSend_receivedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedDelayRequestCounter");
}

id objc_msgSend_receivedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedDelayResponseCounter");
}

id objc_msgSend_receivedFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedFollowUpCounter");
}

id objc_msgSend_receivedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPDelayRequestCounter");
}

id objc_msgSend_receivedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPDelayResponseCounter");
}

id objc_msgSend_receivedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPDelayResponseFollowUpCounter");
}

id objc_msgSend_receivedPacketDiscardCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedPacketDiscardCounter");
}

id objc_msgSend_receivedSignalCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedSignalCounter");
}

id objc_msgSend_receivedSyncCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedSyncCounter");
}

id objc_msgSend_registerAsyncCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAsyncCallback");
}

id objc_msgSend_registerAsyncCallbackError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAsyncCallbackError:");
}

id objc_msgSend_registerAsyncNotificationsWithSelector_callBack_refcon_callbackQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:");
}

id objc_msgSend_registerProcess_withCallback_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerProcess:withCallback:error:");
}

id objc_msgSend_releaseRefcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseRefcon:");
}

id objc_msgSend_releaseReference(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseReference");
}

id objc_msgSend_remoteAnnounceLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteAnnounceLogMeanInterval");
}

id objc_msgSend_remoteClockIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteClockIdentity");
}

id objc_msgSend_remoteFrequencyStabilityLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteFrequencyStabilityLower");
}

id objc_msgSend_remoteFrequencyStabilityUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteFrequencyStabilityUpper");
}

id objc_msgSend_remoteFrequencyToleranceLower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteFrequencyToleranceLower");
}

id objc_msgSend_remoteFrequencyToleranceUpper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteFrequencyToleranceUpper");
}

id objc_msgSend_remoteIsSameDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteIsSameDevice");
}

id objc_msgSend_remoteLinkType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteLinkType");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxy");
}

id objc_msgSend_remoteOscillatorType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteOscillatorType");
}

id objc_msgSend_remotePDelayLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePDelayLogMeanInterval");
}

id objc_msgSend_remotePortNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePortNumber");
}

id objc_msgSend_remoteSyncLogMeanInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteSyncLogMeanInterval");
}

id objc_msgSend_remoteTimestampingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteTimestampingMode");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeClient:");
}

id objc_msgSend_removeNetworkPortWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeNetworkPortWithService:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removePointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePointerAtIndex:");
}

id objc_msgSend_removeStatisticsWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeStatisticsWithIdentifier:");
}

id objc_msgSend_removegPTPServicesWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removegPTPServicesWithError:");
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourceURL");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_scheduleSendBarrierBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleSendBarrierBlock:");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seconds");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceForClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceForClockIdentifier:");
}

id objc_msgSend_serviceMatched_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceMatched:");
}

id objc_msgSend_serviceMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceMatching:");
}

id objc_msgSend_serviceTerminated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTerminated");
}

id objc_msgSend_serviceTerminated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceTerminated:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setAsCapable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsCapable:");
}

id objc_msgSend_setClockIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClockIdentifier:");
}

id objc_msgSend_setClockIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClockIdentity:");
}

id objc_msgSend_setCoefficient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoefficient:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setCoreAudioReanchors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoreAudioReanchors:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationAddressString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationAddressString:");
}

id objc_msgSend_setDiscardedDelayLimitExceededMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscardedDelayLimitExceededMeasurements:");
}

id objc_msgSend_setDiscardedOutOfBoundsMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscardedOutOfBoundsMeasurements:");
}

id objc_msgSend_setDiscardedPpmLimitMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscardedPpmLimitMeasurements:");
}

id objc_msgSend_setDiscardedTimestampsOutOfOrderMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscardedTimestampsOutOfOrderMeasurements:");
}

id objc_msgSend_setDroppedMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDroppedMeasurements:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFilterResetsDroppedLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterResetsDroppedLimit:");
}

id objc_msgSend_setFilterResetsOutOfBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterResetsOutOfBounds:");
}

id objc_msgSend_setGmChangesCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGmChangesCount:");
}

id objc_msgSend_setGptpPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGptpPath:");
}

id objc_msgSend_setGrandmasterIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGrandmasterIdentity:");
}

id objc_msgSend_setHasLocalFrequencyStabilityLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLocalFrequencyStabilityLower:");
}

id objc_msgSend_setHasLocalFrequencyStabilityUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLocalFrequencyStabilityUpper:");
}

id objc_msgSend_setHasLocalFrequencyToleranceLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLocalFrequencyToleranceLower:");
}

id objc_msgSend_setHasLocalFrequencyToleranceUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLocalFrequencyToleranceUpper:");
}

id objc_msgSend_setHasRemoteFrequencyStabilityLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasRemoteFrequencyStabilityLower:");
}

id objc_msgSend_setHasRemoteFrequencyStabilityUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasRemoteFrequencyStabilityUpper:");
}

id objc_msgSend_setHasRemoteFrequencyToleranceLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasRemoteFrequencyToleranceLower:");
}

id objc_msgSend_setHasRemoteFrequencyToleranceUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasRemoteFrequencyToleranceUpper:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLocalAnnounceLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalAnnounceLogMeanInterval:");
}

id objc_msgSend_setLocalFrequencyStabilityLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalFrequencyStabilityLower:");
}

id objc_msgSend_setLocalFrequencyStabilityUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalFrequencyStabilityUpper:");
}

id objc_msgSend_setLocalFrequencyToleranceLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalFrequencyToleranceLower:");
}

id objc_msgSend_setLocalFrequencyToleranceUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalFrequencyToleranceUpper:");
}

id objc_msgSend_setLocalLinkType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalLinkType:");
}

id objc_msgSend_setLocalOscillatorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalOscillatorType:");
}

id objc_msgSend_setLocalPDelayLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalPDelayLogMeanInterval:");
}

id objc_msgSend_setLocalSyncLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalSyncLogMeanInterval:");
}

id objc_msgSend_setLocalTimestampingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalTimestampingMode:");
}

id objc_msgSend_setLockState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockState:");
}

id objc_msgSend_setMaximumPropagationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumPropagationDelay:");
}

id objc_msgSend_setMaximumRawDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumRawDelay:");
}

id objc_msgSend_setMeasuringPDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMeasuringPDelay:");
}

id objc_msgSend_setMinimumPropagationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumPropagationDelay:");
}

id objc_msgSend_setMinimumRawDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumRawDelay:");
}

id objc_msgSend_setModifiedJulianDay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifiedJulianDay:");
}

id objc_msgSend_setMultipleRemotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMultipleRemotes:");
}

id objc_msgSend_setObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOffset:");
}

id objc_msgSend_setOverridenReceiveClockIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverridenReceiveClockIdentity:");
}

id objc_msgSend_setOverridenReceiveMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverridenReceiveMatching:");
}

id objc_msgSend_setOverridenReceivePortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOverridenReceivePortNumber:");
}

id objc_msgSend_setPortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPortNumber:");
}

id objc_msgSend_setPortRole_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPortRole:");
}

id objc_msgSend_setProcessID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessID:");
}

id objc_msgSend_setPropagationDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPropagationDelay:");
}

id objc_msgSend_setRemoteAnnounceLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteAnnounceLogMeanInterval:");
}

id objc_msgSend_setRemoteClockIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteClockIdentity:");
}

id objc_msgSend_setRemoteFrequencyStabilityLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteFrequencyStabilityLower:");
}

id objc_msgSend_setRemoteFrequencyStabilityUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteFrequencyStabilityUpper:");
}

id objc_msgSend_setRemoteFrequencyToleranceLower_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteFrequencyToleranceLower:");
}

id objc_msgSend_setRemoteFrequencyToleranceUpper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteFrequencyToleranceUpper:");
}

id objc_msgSend_setRemoteIsSameDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteIsSameDevice:");
}

id objc_msgSend_setRemoteLinkType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteLinkType:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRemoteOscillatorType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteOscillatorType:");
}

id objc_msgSend_setRemotePDelayLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemotePDelayLogMeanInterval:");
}

id objc_msgSend_setRemotePortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemotePortNumber:");
}

id objc_msgSend_setRemoteSyncLogMeanInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteSyncLogMeanInterval:");
}

id objc_msgSend_setRemoteTimestampingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteTimestampingMode:");
}

id objc_msgSend_setSourceAddressString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceAddressString:");
}

id objc_msgSend_setStatistics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatistics:");
}

id objc_msgSend_setSuccessfulMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuccessfulMeasurements:");
}

id objc_msgSend_setSyncTimeouts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncTimeouts:");
}

id objc_msgSend_setTaiDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaiDate:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTotalMeasurements_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalMeasurements:");
}

id objc_msgSend_setUtcDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtcDate:");
}

id objc_msgSend_sharedClockManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedClockManager");
}

id objc_msgSend_sharedDaemonService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDaemonService");
}

id objc_msgSend_sharedTSDCallbackRefconMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedTSDCallbackRefconMap");
}

id objc_msgSend_sharedgPTPManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedgPTPManager");
}

id objc_msgSend_sourceAddressString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceAddressString");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startNotificationsWithMatchingDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startNotificationsWithMatchingDictionary:");
}

id objc_msgSend_statistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statistics");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_successfulMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successfulMeasurements");
}

id objc_msgSend_supersededDelayCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supersededDelayCounter");
}

id objc_msgSend_supersededSyncCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supersededSyncCounter");
}

id objc_msgSend_syncReceiptTimeoutCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncReceiptTimeoutCounter");
}

id objc_msgSend_syncTimeouts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncTimeouts");
}

id objc_msgSend_systemDomainClockIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemDomainClockIdentifier");
}

id objc_msgSend_taiDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taiDate");
}

id objc_msgSend_taiDateFromUTCDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taiDateFromUTCDate:");
}

id objc_msgSend_timeConverter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeConverter");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeSyncTimeClockIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeSyncTimeClockIdentifier");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_totalMeasurements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalMeasurements");
}

id objc_msgSend_translationClock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translationClock");
}

id objc_msgSend_translationClockIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "translationClockIdentifier");
}

id objc_msgSend_transmittedAnnounceCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedAnnounceCounter");
}

id objc_msgSend_transmittedDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedDelayRequestCounter");
}

id objc_msgSend_transmittedDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedDelayResponseCounter");
}

id objc_msgSend_transmittedFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedFollowUpCounter");
}

id objc_msgSend_transmittedPDelayRequestCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedPDelayRequestCounter");
}

id objc_msgSend_transmittedPDelayResponseCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedPDelayResponseCounter");
}

id objc_msgSend_transmittedPDelayResponseFollowUpCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedPDelayResponseFollowUpCounter");
}

id objc_msgSend_transmittedPacketDiscardCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedPacketDiscardCounter");
}

id objc_msgSend_transmittedSignalCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedSignalCounter");
}

id objc_msgSend_transmittedSyncCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transmittedSyncCounter");
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedCharValue");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedShortValue");
}

id objc_msgSend_updateGrandmasterIdentity_andgPTPPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateGrandmasterIdentity:andgPTPPath:");
}

id objc_msgSend_updateProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateProperties");
}

id objc_msgSend_updateTimeSyncTime_timeSyncInterval_domainTime_domainInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTimeSyncTime:timeSyncInterval:domainTime:domainInterval:");
}

id objc_msgSend_updateWithSyncInfoValid_syncFlags_timeSyncTime_domainTimeHi_domainTimeLo_cumulativeScaledRate_inverseCumulativeScaledRate_grandmasterID_localPortNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithSyncInfoValid:syncFlags:timeSyncTime:domainTimeHi:domainTimeLo:cumulativeScaledRate:inverseCumulativeScaledRate:grandmasterID:localPortNumber:");
}

id objc_msgSend_utcDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utcDate");
}

id objc_msgSend_utcDateFromTAIDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "utcDateFromTAIDate:");
}

id objc_msgSend_waitForService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForService");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsPointerArray");
}
