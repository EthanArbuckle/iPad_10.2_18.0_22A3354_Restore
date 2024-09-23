void sub_10000774C(id a1)
{
  SystemDiagnosticBT *v1;
  void *v2;

  v1 = objc_alloc_init(SystemDiagnosticBT);
  v2 = (void *)qword_1000B9728;
  qword_1000B9728 = (uint64_t)v1;

}

id sub_10000796C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forceDeregisterBTSession");
}

void sub_100007A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007A6C(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "btSession");
  if (result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_100007D38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007D50(uint64_t a1)
{
  id v2;
  void *v3;
  id result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "btSession");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "triggerExposureNotificationLogs");
  result = objc_msgSend(v3, "setWaitingToCaptureExposureNotificationLogs:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

id sub_100008158(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markExposureNotificationLogsDone:", 1);
}

void sub_100008600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008618(uint64_t a1)
{
  id v2;
  void *v3;
  id result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "btSession");
  v3 = *(void **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "triggerAirPodLogsIfConnected");
  result = objc_msgSend(v3, "setWaitingToCaptureAirPodLogs:", 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_100008930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000894C(uint64_t a1)
{
  id v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;

  v2 = objc_alloc_init((Class)CBUserController);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000089E4;
  v5[3] = &unk_100098FD8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "appleAudioAccessoryLimitedLoggingWithCompletion:", v5);

}

void sub_1000089E4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accessoryLogSubsystem"));
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBUserController returned error for limited logging check, assuming not enabled: %@", buf, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v9, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    objc_msgSend(v10, "stdoutWrite:", CFSTR("CBUserController returned error for limited logging check, assuming not enabled: %@"), v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
    objc_msgSend(v12, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("CBUserController returned error for limited logging check, assuming not enabled: %@"), v13);

  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CBUserController returned limited logging value: %d", buf, 8u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v14, "stdoutWrite:", CFSTR("Subsystem: %s; Category: %s; Log: "),
      "remoteSysdiagnose",
      "AccessoryLogSubsystem");

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v15, "stdoutWrite:", CFSTR("CBUserController returned limited logging value: %d"), a2);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v16, "logWithSubsystem:category:msg:", "remoteSysdiagnose", "AccessoryLogSubsystem", CFSTR("CBUserController returned limited logging value: %d"), a2);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id sub_100009508(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "markAirpodLogsDone:", 1);
}

id sub_10000984C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attachToBTSession");
}

void sub_10000A130(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
  objc_msgSend(v6, "sessionEvent:event:result:", a1, a2, a3);

}

void sub_10000A18C(id a1)
{
  BOOL v1;

  if (&_BTAccessoryManagerDeregisterCustomMessageClient)
    v1 = &_BTSessionDetachWithQueue == 0;
  else
    v1 = 1;
  if (!v1
    && &_BTSessionAttachWithQueue != 0
    && &_BTLocalDeviceDumpExposureNotificationDatabase != 0
    && &_BTAccessoryManagerRegisterCustomMessageClient != 0
    && &_BTLocalDeviceGetDefault != 0
    && &_BTAccessoryManagerGetDefault != 0)
  {
    byte_1000B9738 = 1;
  }
}

void sub_10000A1F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
  objc_msgSend(v7, "logCompletionHandler:size:", a4, a5);

}

void sub_10000A240(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A258(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL sub_10000A3D8(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  objc_msgSend(v5, "log:", CFSTR("%@\n"), v6);

  return 1;
}

BOOL sub_10000C774(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v11;

  v3 = a3;
  v4 = sub_100026C34();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Error expanding user home directories: %@\n", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  objc_msgSend(v7, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error expanding user home directories: %@\n"), v8);

  return 1;
}

int sub_10000DB48(id a1, const char *a2, int a3)
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;

  v3 = *(_QWORD *)&a3;
  v5 = sub_100026C34();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = v3;
    v11 = 2080;
    v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Glob Error (%d) %s ", buf, 0x12u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Glob Error (%d) %s "), v3, a2);

  return v3;
}

void sub_10000EA10(id a1)
{
  SDResourceManager *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[16];

  v1 = objc_alloc_init(SDResourceManager);
  v2 = (void *)qword_1000B9748;
  qword_1000B9748 = (uint64_t)v1;

  if (qword_1000B9748)
  {
    v3 = sub_100045D38();
    objc_msgSend((id)qword_1000B9748, "setIsDaemon:", v3);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create SDResourceManager singleton.", v4, 2u);
  }
}

void sub_10000EC68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000ECE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000EF3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F2B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F364(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F3B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F4EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F59C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F7D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000F8DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FB04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FCC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000FEB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000100EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010204(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010608(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001089C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010A04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010B2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010C30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010D98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010E3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011100(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001123C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011340(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000113F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001163C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011770(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011964(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011A08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSArray *__cdecl sub_100012EB4(id a1, NSDate *a2)
{
  NSDate *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/root/Library/Caches/hangtracerd/spool/*.tailspin*"), v2, 0, 0, CFSTR("spool"), 0));
  v7[0] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/HangTracer/*.tailspin*"), v2, 0, 0, CFSTR("HangTracer"), 0));

  v7[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 2));

  return (NSArray *)v5;
}

void sub_100016490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000164A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000164B8(uint64_t a1)
{

}

char *sub_1000164C0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  char *result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", *(_QWORD *)(a1 + 32), a2);
  result = (char *)objc_msgSend(*(id *)(a1 + 40), "count");
  if ((unint64_t)(result - 1) > a3)
    return (char *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR(" AND "));
  return result;
}

void sub_100016644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_10001665C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  char *result;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendFormat:", *(_QWORD *)(a1 + 32), a2);
  result = (char *)objc_msgSend(*(id *)(a1 + 40), "count");
  if ((unint64_t)(result - 1) > a3)
    return (char *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "appendString:", CFSTR(" OR "));
  return result;
}

void sub_1000169DC(id a1)
{
  CSCoordinator *v1;
  void *v2;

  v1 = objc_alloc_init(CSCoordinator);
  v2 = (void *)qword_1000B9758;
  qword_1000B9758 = (uint64_t)v1;

}

void sub_100016C64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016DD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016F18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001706C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000171B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017318(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001745C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000175B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001767C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017728(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017B50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100017F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100017FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10001874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001877C(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getProxiesForDiagnosticID:", *(_QWORD *)(a1 + 40)));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logSubsystem"));

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting on proxies. Skipping remaining", v9, 2u);
          }

          goto LABEL_13;
        }
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "waitToReceiveCoSysdiagnose");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

}

void sub_100018E3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100018E4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_10001A4C0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[16];
  _BYTE v24[128];
  NSURLResourceKey v25;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting ExposureNotification DB", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("Collecting ExposureNotification DB"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("Collecting ExposureNotification DB"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "diagnosticID"));
  objc_msgSend(v4, "startBTSessionAndTriggerExposureNotificationLogs:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "waitForExposureNotificationLogsIfAvailable:", 5000000000));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v25 = NSURLNameKey;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v9, 0, &stru_100099210));

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "path", (_QWORD)v19));
          objc_msgSend(v7, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v7, "count"))
      v17 = v7;
    else
      v17 = 0;

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Did not get any URL to collect from ExposureNotification API", buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", CFSTR("Did not get any URL to collect from ExposureNotification API"));
    v17 = 0;
  }

  return v17;
}

BOOL sub_10001A7BC(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  NSURL *v11;
  __int16 v12;
  void *v13;

  v4 = a2;
  v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v5, "localizedDescription"));
    *(_DWORD *)buf = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ExposureNotification enumeration error for URL %@ : %@", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v5, "localizedDescription"));
  objc_msgSend(v7, "log:", CFSTR("ExposureNotification enumeration error for URL %@ : %@"), v4, v8);

  return 1;
}

void sub_10001AA64(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  void *v20;
  unsigned int v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
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
  void *v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];
  _QWORD v43[4];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  const char *v47;
  _QWORD v48[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputDirectory"));
  v48[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "destination"));
  v48[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stdoutPath"));
  v48[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v48, 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v5));

  if (objc_msgSend(*(id *)(a1 + 40), "terminationStatus"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(*(id *)(a1 + 40), "terminationStatus");
      *(_DWORD *)buf = 67109120;
      LODWORD(v45) = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: exited with termination status %d", buf, 8u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("Baseband: exited with termination status %d"), objc_msgSend(*(id *)(a1 + 40), "terminationStatus"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    if (objc_msgSend(v8, "fileExistsAtPath:", v6)
      && (objc_msgSend(v8, "isReadableFileAtPath:", v6) & 1) != 0)
    {
      v40 = 0;
      v41 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:usedEncoding:error:](NSString, "stringWithContentsOfFile:usedEncoding:error:", v6, &v41, &v40));
      v10 = v40;
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("\n")));
        v12 = v11;
        if (v11)
        {
          if ((unint64_t)objc_msgSend(v11, "count") >= 3)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
            v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("Path ="));

            if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringFromIndex:", (char *)objc_msgSend(v16, "rangeOfString:", CFSTR("=")) + 1));

              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByRemovingWhitespace"));
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                if (objc_msgSend(v18, "isAbsolutePath"))
                  v19 = "YES";
                else
                  v19 = "NO";
                *(_DWORD *)buf = 138412546;
                v45 = v18;
                v46 = 2080;
                v47 = v19;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: File found at location %@? %s", buf, 0x16u);
              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              v21 = objc_msgSend(v18, "isAbsolutePath");
              v22 = "YES";
              if (!v21)
                v22 = "NO";
              objc_msgSend(v20, "log:", CFSTR("Baseband: File found at location %@? %s"), v18, v22);

              if (v18)
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("index.plist")));
                v43[0] = v37;
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("info.csv")));
                v43[1] = v35;
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("info.txt")));
                v43[2] = v23;
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Default.dmc")));
                v43[3] = v24;
                v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v43, 4));

                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "destination"));
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
                v36 = v18;
                v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingPathComponent:", v26));

                v38 = (void *)v27;
                v28 = v27;
                v18 = v36;
                v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("basebandMeta collection"), v28, *(_QWORD *)(a1 + 32)));
                v30 = v29;
                if (v29)
                {
                  objc_msgSend(v29, "setRuntimeChecks:", 0);
                  objc_msgSend(v30, "setMaximumSizeMB:", 128);
                  v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v39));
                  v42[0] = v34;
                  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", v36));
                  v42[1] = v31;
                  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
                  objc_msgSend(v30, "addRules:", v32);

                  objc_msgSend(v30, "execute");
                }

              }
            }
          }
        }
      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v45 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Baseband: File %@ was not generated or unreadable", buf, 0xCu);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v33, "log:", CFSTR("Baseband: File %@ was not generated or unreadable"), v6);

    }
  }

}

NSMutableArray *__cdecl sub_10001B158(id a1)
{
  CFPropertyListRef v1;

  v1 = CFPreferencesCopyAppValue(CFSTR("StateDumpFrequency"), CFSTR("com.apple.soundautoconfig"));
  CFPreferencesSetAppValue(CFSTR("StateDumpFrequency"), CFSTR("1"), CFSTR("com.apple.soundautoconfig"));
  sleep(3u);
  if (v1)
  {
    CFPreferencesSetAppValue(CFSTR("StateDumpFrequency"), v1, CFSTR("com.apple.soundautoconfig"));
    CFRelease(v1);
  }
  else
  {
    CFPreferencesSetAppValue(CFSTR("StateDumpFrequency"), 0, CFSTR("com.apple.soundautoconfig"));
  }
  return 0;
}

void sub_10001FCF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10001FD20(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;

  value = xpc_dictionary_get_value(xdict, "replyDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  if (xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F2C4(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "log:", CFSTR("CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@"), xpc_get_type(v4), v10);
LABEL_9:

    goto LABEL_10;
  }
  if (xpc_dictionary_get_BOOL(v4, "wiFiVelocityMegaProfile"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskContainer"));
    objc_msgSend(v6, "setTimeout:", 36.0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionContainer"));
    objc_msgSend(v7, "setMaximumSizeMB:", 100);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      *(_DWORD *)buf = 134218240;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB", buf, 0x16u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "log:", CFSTR("Received WiFiVelocity MegaProfile Enabled. New timeout: %.2f seconds and max size: %luMB"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "executeFromCallback");

}

void sub_1000213B8(id a1)
{
  void *v1;

  v1 = (void *)qword_1000B9768;
  qword_1000B9768 = (uint64_t)&off_1000ACAE8;

}

id sub_100021638()
{
  if (qword_1000B9778 != -1)
    dispatch_once(&qword_1000B9778, &stru_100099328);
  return (id)qword_1000B9780;
}

BOOL sub_100021678(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = sub_100021638();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10005F344(v3, v5);

  return 1;
}

void sub_100021E18(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");
  v2 = (void *)qword_1000B9780;
  qword_1000B9780 = (uint64_t)v1;

}

void sub_100021E88(id a1)
{
  char v1;

  if ((sub_100046438() & 1) != 0)
    v1 = 1;
  else
    v1 = sub_1000463D4();
  byte_1000B9788 = v1;
}

void sub_100022138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100022170(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Found device %@", (uint8_t *)&v11, 0xCu);
  }

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v5)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getService:forDevice:](CSRemoteXPCProxy, "getService:forDevice:", "com.apple.sysdiagnose.remote", v5));

    if (v8)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005F45C(v10);

  }
}

void sub_10002244C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100022470(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_100022694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000226BC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000226CC(uint64_t a1)
{

}

void sub_1000226D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  void *v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getUUIDStrForRemoteDevice:](CSRemoteXPCProxy, "getUUIDStrForRemoteDevice:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getRemoteUUIDsForDiagnosticID:", *(_QWORD *)(a1 + 32)));

  if (objc_msgSend(v6, "containsObject:", v4))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "logSubsystem"));

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "CSDisplayProxy: Found valid display with uuid %@, but already manually requested from client - skipping", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    v9 = -[CSRemoteXPCProxy _initWithDevice:forDiagnosticID:]([CSDisplayProxy alloc], "_initWithDevice:forDiagnosticID:", v3, *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v9);

  }
}

void start()
{
  void *v0;
  int v1;
  int v2;
  const char *v3;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v2) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching daemon not from DDCSI", (uint8_t *)&v2, 2u);
  }
  v0 = objc_autoreleasePoolPush();
  if ((sub_100045D38() & 1) != 0)
  {
    v1 = setiopolicy_np(0, 0, 2);
    if (v1)
      _os_assumes_log(v1);
    sub_1000229E8();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = 136315138;
    v3 = "Error: sysdiagnosed should only be invoked by launchd";
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v2, 0xCu);
  }
  puts("Error: sysdiagnosed should only be invoked by launchd");
  exit(1);
}

void sub_1000229E8()
{
  void *v0;
  void *v1;
  dispatch_queue_global_t global_queue;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting server", buf, 2u);
  }
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v0, "stdoutWrite:", CFSTR("Starting server"));

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v1, "log:", CFSTR("Starting server"));

  global_queue = dispatch_get_global_queue(0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  sub_100027CE8(v3, &stru_1000993E0);

  sub_100027EB8();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  objc_msgSend(v4, "initRemoteServers");

  if (sub_1000324C8())
  {
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v6 = 3;
    else
      v6 = 2;
    v7 = _os_log_send_and_compose_impl(v6, &v15, buf, 80, &_mh_execute_header, &_os_log_default, 16);
    _os_crash_msg(v15, v7);
    __break(1u);
  }
  else if (!sub_100035A7C())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    objc_msgSend(v5, "sendMessage:", 0);

    +[SDCacheDeleter registerCallbacks](SDCacheDeleter, "registerCallbacks");
    dispatch_main();
  }
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  *(_OWORD *)buf = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v8 = 3;
  else
    v8 = 2;
  v9 = _os_log_send_and_compose_impl(v8, &v15, buf, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(v15, v9);
  __break(1u);
}

void sub_100022C2C(id a1)
{
  void *v1;
  unsigned int v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v2 = objc_msgSend(v1, "areDiagnosticsInFlight");

  if (v2)
    sub_100027EB8();
}

const __CFString *sub_100022C74(unint64_t a1)
{
  if (a1 > 0xF)
    return CFSTR("Unknown server error");
  else
    return off_100099778[a1];
}

BOOL sub_100022C98()
{
  uid_t v0;
  passwd *v1;
  uid_t pw_uid;
  int *v3;
  char *v4;
  void *v5;
  int *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  int *v21;
  char *v22;
  int *v23;
  uid_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  BOOL v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int buf;
  void *v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v0 = geteuid();
  v1 = getpwnam("mobile");
  if (v1)
    pw_uid = v1->pw_uid;
  else
    pw_uid = 501;
  if (seteuid(pw_uid))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = __error();
      v4 = strerror(*v3);
      buf = 136315138;
      v39 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not drop to mobile with error: %s", (uint8_t *)&buf, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v6 = __error();
    objc_msgSend(v5, "log:", CFSTR("Could not drop to mobile with error: %s"), strerror(*v6));
LABEL_38:

    return 0;
  }
  v25 = v0;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v27 = objc_msgSend(&off_1000AD040, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  v7 = 0;
  if (v27)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(&off_1000AD040);
        v28 = v8;
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AD040, "objectForKeyedSubscript:", v9));
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v31 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
              v29 = 0;
              if (sub_10004602C(v15, v9, &v29))
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  buf = 138412546;
                  v39 = v9;
                  v40 = 2112;
                  v41 = v15;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "A preference was found! Domain %@ with variable %@", (uint8_t *)&buf, 0x16u);
                }
                v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v16, "log:", CFSTR("A preference was found! Domain %@ with variable %@"), v9, v15);

                v7 = v29 || v7;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v12);
        }

        v8 = v28 + 1;
      }
      while ((id)(v28 + 1) != v27);
      v27 = objc_msgSend(&off_1000AD040, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v27);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (v7)
      v17 = "YES";
    else
      v17 = "NO";
    buf = 136315138;
    v39 = (void *)v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nShould run full idstool dump: %s\n\n", (uint8_t *)&buf, 0xCu);
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v19 = v18;
  if (v7)
    v20 = "YES";
  else
    v20 = "NO";
  objc_msgSend(v18, "log:", CFSTR("\nShould run full idstool dump: %s\n\n"), v20);

  if (seteuid(v25))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = __error();
      v22 = strerror(*v21);
      buf = 136315138;
      v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not return to original euid with error: %s", (uint8_t *)&buf, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v23 = __error();
    objc_msgSend(v5, "log:", CFSTR("Could not return to original euid with error: %s"), strerror(*v23));
    goto LABEL_38;
  }
  return v7;
}

uint64_t sub_1000230D8()
{
  passwd *v0;

  v0 = getpwnam("mobile");
  if (v0)
    return v0->pw_uid;
  else
    return 501;
}

void sub_100023104()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  __CFString *v3;
  const void *v4;
  __CFString *v5;
  const void *v6;
  uint64_t v7;
  __CFString *v8;
  BOOL v9;
  BOOL v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;

  v0 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v0)
  {
    v1 = v0;
    Value = CFDictionaryGetValue(v0, _kCFSystemVersionProductNameKey);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
    v4 = CFDictionaryGetValue(v1, _kCFSystemVersionProductVersionKey);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
    v6 = CFDictionaryGetValue(v1, _kCFSystemVersionBuildVersionKey);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = (__CFString *)v7;
    if (v3)
      v9 = 0;
    else
      v9 = v5 == 0;
    if (!v9 || v7 != 0)
    {
      v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v3)
        v12 = v3;
      else
        v12 = CFSTR("UNKNOWN");
      if (v11)
      {
        if (v5)
          v13 = v5;
        else
          v13 = CFSTR("UNKNOWN");
        *(_DWORD *)buf = 138412802;
        v20 = v12;
        v21 = 2112;
        v22 = v13;
        if (v8)
          v14 = v8;
        else
          v14 = CFSTR("UNKNOWN");
        v23 = 2112;
        v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ %@ (Build %@)", buf, 0x20u);
      }
      else
      {
        if (v5)
          v13 = v5;
        else
          v13 = CFSTR("UNKNOWN");
        if (v8)
          v14 = v8;
        else
          v14 = CFSTR("UNKNOWN");
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v15, "log:", CFSTR("%@ %@ (Build %@)"), v12, v13, v14);

    }
    CFRelease(v1);

  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (sub_100045E60())
      v16 = CFSTR("Internal");
    else
      v16 = CFSTR("Customer");
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose mode: %@", buf, 0xCu);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  if (sub_100045E60())
    v18 = CFSTR("Internal");
  else
    v18 = CFSTR("Customer");
  objc_msgSend(v17, "log:", CFSTR("Sysdiagnose mode: %@"), v18);

}

id sub_10002334C(uint64_t a1, uint64_t a2)
{
  id v2;
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v21;
  uint8_t buf[4];
  int v23;

  if (!objc_opt_class(SDBetaManager, a2))
  {
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4)
      sub_10005F49C(v4, v5, v6, v7, v8, v9, v10, v11);
    return 0;
  }
  if ((objc_opt_respondsToSelector(SDBetaManager, "canFileFeedbackOnThisDevice:") & 1) == 0)
  {
    v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12)
      sub_10005F554(v12, v13, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  v21 = 0;
  v2 = +[SDBetaManager canFileFeedbackOnThisDevice:](SDBetaManager, "canFileFeedbackOnThisDevice:", &v21);
  v3 = v21;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F4D0(v3);
    v2 = 0;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = (int)v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Seed check: canFileFeedbackOnThisDevice: %d", buf, 8u);
  }

  return v2;
}

uint64_t sub_10002349C()
{
  if (qword_1000B97A0 != -1)
    dispatch_once(&qword_1000B97A0, &stru_100099400);
  return byte_1000B9798;
}

void sub_1000234DC(id a1)
{
  byte_1000B9798 = os_variant_is_darwinos("com.apple.sysdiagnose");
}

BOOL sub_100023500()
{
  if (qword_1000B97A0 != -1)
    dispatch_once(&qword_1000B97A0, &stru_100099400);
  if (!byte_1000B9798)
    return 0;
  if (qword_1000B97B0 != -1)
    dispatch_once(&qword_1000B97B0, &stru_100099420);
  return byte_1000B97A8 != 0;
}

void sub_100023584(id a1)
{
  byte_1000B97A8 = MGGetBoolAnswer(CFSTR("IsVirtualDevice"));
}

uint64_t sub_1000235A8()
{
  if (qword_1000B97C0 != -1)
    dispatch_once(&qword_1000B97C0, &stru_100099440);
  return byte_1000B97B8;
}

void sub_1000235E8(id a1)
{
  byte_1000B97B8 = os_variant_has_factory_content("com.apple.sysdiagnose");
}

uint64_t sub_10002360C()
{
  if (qword_1000B97D0 != -1)
    dispatch_once(&qword_1000B97D0, &stru_100099460);
  return byte_1000B97C8;
}

void sub_10002364C(id a1)
{
  const void *v1;
  const void *v2;

  v1 = (const void *)MGCopyAnswer(CFSTR("ReleaseType"), 0);
  if (v1)
  {
    v2 = v1;
    byte_1000B97C8 = CFEqual(v1, CFSTR("Desense")) != 0;
    CFRelease(v2);
  }
}

uint64_t sub_1000236A8()
{
  if (qword_1000B97E0 != -1)
    dispatch_once(&qword_1000B97E0, &stru_100099480);
  return byte_1000B97D8;
}

void sub_1000236E8(id a1)
{
  byte_1000B97D8 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0) == 7;
}

id sub_100023718()
{
  if (qword_1000B97F0 != -1)
    dispatch_once(&qword_1000B97F0, &stru_1000994A0);
  return (id)qword_1000B97E8;
}

void sub_100023758(id a1)
{
  void *v1;

  v1 = (void *)MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
  if (v1)
    objc_storeStrong((id *)&qword_1000B97E8, v1);
}

void sub_100023790()
{
  void *v0;
  dispatch_queue_global_t global_queue;
  NSObject *v2;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Screen flash requested", v3, 2u);
  }
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v0, "log:", CFSTR("Screen flash requested"));

  global_queue = dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v2, &stru_1000994C0);

}

const __CFString *sub_10002383C(int a1)
{
  const __CFString *result;

  if (a1 > 11)
  {
    switch(a1)
    {
      case '0':
        return CFSTR("PlayPause + Volume Down");
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
        return CFSTR("?");
      case '6':
        return CFSTR("Cmd-Opt-Ctrl-Shift-Comma");
      case '7':
        return CFSTR("Cmd-Opt-Ctrl-Shift-Period");
      case '8':
        return CFSTR("Cmd-Opt-Ctrl-Shift-Slash");
      default:
        if (a1 == 12)
        {
          result = CFSTR("Crown + Pill");
        }
        else
        {
          if (a1 != 36)
            return CFSTR("?");
          result = CFSTR("Legacy: Menu + Volume Down");
        }
        break;
    }
  }
  else
  {
    if (a1 <= -2147483637)
    {
      if (a1 == 0x80000000)
        return CFSTR("Full Diagnostic from Driver");
      if (a1 == -2147483641)
        return CFSTR("Power + Volume Up + Volume Down");
    }
    else
    {
      switch(a1)
      {
        case -2147483636:
          return CFSTR("Hold Crown + Pill");
        case 3:
          return CFSTR("Power + Volume Up");
        case 6:
          return CFSTR("Legacy: Menu + Volume Up");
      }
    }
    return CFSTR("?");
  }
  return result;
}

const __CFString *sub_100023950(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("?");
  else
    return off_1000997F8[(__int16)(a1 - 1)];
}

const __CFString *sub_10002397C(unsigned int a1)
{
  if (a1 > 0xC)
    return CFSTR("?");
  else
    return off_100099820[(__int16)a1];
}

const __CFString *sub_1000239A4(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("?");
  else
    return off_100099888[(__int16)a1];
}

id sub_1000239CC()
{
  passwd *v0;

  v0 = getpwnam("mobile");
  if (v0)
    return sub_1000239F8(v0->pw_uid);
  else
    return sub_1000239F8(501);
}

id sub_1000239F8(uint64_t a1)
{
  void *v2;
  passwd *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int *v8;
  char *v9;
  int *v10;
  uint8_t buf[4];
  char *v13;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v13) = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting home dir for uid %d", buf, 8u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", CFSTR("Getting home dir for uid %d"), a1);

  v3 = getpwuid(a1);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3->pw_dir));
    if (!v4)
    {
      v7 = 0;
      return v7;
    }
    v5 = v4;
    v6 = sub_1000537E8(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = __error();
      v9 = strerror(*v8);
      *(_DWORD *)buf = 136315138;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getpwuid failed, err: %s", buf, 0xCu);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v10 = __error();
    objc_msgSend(v5, "log:", CFSTR("getpwuid failed, err: %s"), strerror(*v10));
    v7 = 0;
  }

  return v7;
}

id sub_100023B9C()
{
  char v1[1024];

  sub_100045A80(v1, 0x400uLL, "sysdiagnose", 0, 0);
  return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v1));
}

void sub_100023C18(void *a1, void *a2)
{
  id v3;
  id v4;
  FILE *v5;
  FILE *v6;
  void *v7;
  uint8_t buf[4];
  id v9;

  v3 = a1;
  v4 = objc_retainAutorelease(a2);
  v5 = fopen((const char *)objc_msgSend(v4, "fileSystemRepresentation"), "wx");
  if (v5)
  {
    v6 = v5;
    fputs((const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), v5);
    fclose(v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File %@ could not be created", buf, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", CFSTR("File %@ could not be created"), v4);

  }
}

id sub_100023D38(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSURLResourceKey v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  BOOL v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = a1;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLNameKey, NSURLPathKey, NSURLCreationDateKey, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v6, v7, 7, &stru_1000994E0));

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v9)
    {
      v10 = v9;
      v26 = v4;
      v28 = *(_QWORD *)v31;
      v11 = NSURLIsDirectoryKey;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          v14 = objc_autoreleasePoolPush();
          v29 = 0;
          objc_msgSend(v13, "getResourceValue:forKey:error:", &v29, v11, 0);
          v15 = v29;
          if (objc_msgSend(v15, "BOOLValue") == (_DWORD)a2)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
            v17 = objc_msgSend(v16, "rangeOfString:", v3);

            if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ((a2 & 1) != 0)
                goto LABEL_16;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
              v20 = a2;
              v21 = v3;
              v22 = objc_msgSend(v19, "rangeOfString:", CFSTR(".tar"));

              v23 = v22 == (id)0x7FFFFFFFFFFFFFFFLL;
              v3 = v21;
              a2 = v20;
              v11 = NSURLIsDirectoryKey;
              if (!v23)
              {
LABEL_16:
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));

                objc_autoreleasePoolPop(v14);
                goto LABEL_17;
              }
            }
          }

          objc_autoreleasePoolPop(v14);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
          continue;
        break;
      }
      v24 = 0;
LABEL_17:
      v4 = v26;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

BOOL sub_100024024(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  uint8_t buf[4];
  NSError *v7;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", CFSTR("%@\n"), v3);

  return 1;
}

id sub_1000240F4(void *a1)
{
  id v1;
  void *v2;
  size_t v3;
  const char *string;
  void *v5;
  void *v6;
  uint8_t v8[16];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (v1)
  {
    if (xpc_array_get_count(v1))
    {
      v3 = 0;
      do
      {
        string = xpc_array_get_string(v1, v3);
        if (string)
        {
          v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
          objc_msgSend(v2, "addObject:", v5);

        }
        ++v3;
      }
      while (xpc_array_get_count(v1) > v3);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not a valid xpc array", v8, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Not a valid xpc array"));

  }
  return v2;
}

uint64_t sub_100024210(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t i;
  __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[8];
  _BYTE v24[128];

  v1 = sub_1000244F4(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    for (i = 0; i != 216; i += 8)
    {
      v4 = *(__CFString **)((char *)&off_100099500 + i);
      if ((-[__CFString containsString:](v4, "containsString:", v2) & 1) != 0
        || objc_msgSend(v2, "containsString:", v4))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Matched approved path", buf, 2u);
        }
        v7 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v7, "log:", CFSTR("Matched approved path"));
LABEL_21:
        v16 = 1;
        goto LABEL_22;
      }

    }
    if (!NSClassFromString(CFSTR("DEExtensionManager")))
      goto LABEL_17;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[DEExtensionManager sharedInstance](DEExtensionManager, "sharedInstance"));
    objc_msgSend(v5, "loadExtensions");

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[DEExtensionManager sharedInstance](DEExtensionManager, "sharedInstance"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "extensionsWithFilter:", 0));

    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue(-[__CFString valueForKeyPath:](v4, "valueForKeyPath:", CFSTR("identifier")));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      while (2)
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent", (_QWORD)v19));
          if (objc_msgSend(v12, "containsString:", v13))
          {

LABEL_25:
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Encountered diagnostic extension, approving request", buf, 2u);
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v18, "log:", CFSTR("Encountered diagnostic extension, approving request"));

            goto LABEL_21;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
          v15 = objc_msgSend(v14, "containsString:", v12);

          if (v15)
            goto LABEL_25;
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v9)
          continue;
        break;
      }
    }

    v16 = 0;
LABEL_22:

  }
  else
  {
LABEL_17:
    v16 = 0;
  }

  return v16;
}

id sub_1000244F4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint8_t buf[4];
  void *v6;
  __int16 v7;
  int v8;
  _BYTE buffer[1024];

  proc_pidpath(a1, buffer, 0x400u);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buffer, 4));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v6) = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get client proc path for pid %d", buf, 8u);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v3, "log:", CFSTR("Failed to get client proc path for pid %d"), a1);

  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v6 = v2;
    v7 = 1024;
    v8 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got path %@ for pid %d", buf, 0x12u);
  }
  return v2;
}

id sub_100024648(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = sub_1000244F4(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
    v3 = objc_msgSend(CFSTR("/AppleInternal/Library/Frameworks/TapToRadarDaemon.framework/Support/taptoradard"), "isEqualToString:", v2);
  else
    v3 = 0;

  return v3;
}

uint64_t sub_100024694(void *a1)
{
  id v1;
  int *v2;
  char *v3;
  void *v4;
  int *v5;
  uint64_t v6;
  _QWORD v8[2];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  char *v12;

  v8[0] = 0;
  v8[1] = 0;
  v1 = objc_retainAutorelease(a1);
  if ((dirstat_np(objc_msgSend(v1, "fileSystemRepresentation"), 0, v8, 16) & 0x80000000) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v2 = __error();
      v3 = strerror(*v2);
      *(_DWORD *)buf = 138412546;
      v10 = v1;
      v11 = 2080;
      v12 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Directory sizing for %@ failed with error %s", buf, 0x16u);
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v5 = __error();
    objc_msgSend(v4, "log:", CFSTR("Directory sizing for %@ failed with error %s"), v1, strerror(*v5));

  }
  v6 = v8[0];

  return v6;
}

_xpc_connection_s *sub_1000247B0(void *a1)
{
  Block_layout *v1;
  void *v2;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v4;
  xpc_object_t v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  _xpc_connection_s *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  uint8_t v16[16];
  uint8_t buf[8];
  uint64_t v18;

  v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Trying to create a sysdiagnose_helper connection", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", CFSTR("Trying to create a sysdiagnose_helper connection"));

  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose_helper", 0, 2uLL);
  v4 = mach_service;
  if (mach_service)
  {
    if (!v1)
      v1 = &stru_1000995F8;
    xpc_connection_set_event_handler(mach_service, v1);
    *(_QWORD *)buf = 0;
    v18 = 0;
    uuid_generate_random(buf);
    xpc_connection_set_oneshot_instance(v4, buf);
    xpc_connection_activate(v4);
    v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v5, "taskType", 24);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending HANDSHAKE to sysdiagnose_helper", v16, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Sending HANDSHAKE to sysdiagnose_helper"));

    v7 = xpc_connection_send_message_with_reply_sync(v4, v5);
    v8 = v7;
    if (v7)
    {
      if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary && xpc_dictionary_get_BOOL(v8, "result"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose_helper connection success", v16, 2u);
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v9, "log:", CFSTR("sysdiagnose_helper connection success"));

        v10 = v4;
        goto LABEL_24;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't connect to sysdiagnose_helper", v16, 2u);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v13 = v12;
      v14 = CFSTR("Couldn't connect to sysdiagnose_helper");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose_helper returned empty for a HANDSHAKE", v16, 2u);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v13 = v12;
      v14 = CFSTR("sysdiagnose_helper returned empty for a HANDSHAKE");
    }
    objc_msgSend(v12, "log:", v14);

    v10 = 0;
LABEL_24:

    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No connection with sysdiagnose_helper", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", CFSTR("No connection with sysdiagnose_helper"));

  v10 = 0;
LABEL_25:

  return v10;
}

void sub_100024B40(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 134217984;
    v5 = 5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dumping stackshot with timeout of %ld seconds", (uint8_t *)&v4, 0xCu);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v2, a1, 0, 0, 0, 5.0));

  if (v3)
  {
    objc_msgSend(v3, "setName:", CFSTR("standalone-stackshot"));
    objc_msgSend(v3, "setRuntimeChecks:", 0);
    objc_msgSend(v3, "setBlockUntilFinished:", 1);
    objc_msgSend(v3, "execute");
  }

}

void sub_100024C68(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;
  CFIndex AppIntegerValue;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  uint8_t v13[4];
  uint64_t v14;
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tailspin key chord pressed", (uint8_t *)&buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", CFSTR("tailspin key chord pressed"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v4 = objc_msgSend(v3, "setUpDiagnosticID:", v1);

  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set up tailspinDiagnosticID with SDResourceManager.", (uint8_t *)&buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "log:", CFSTR("Failed to set up tailspinDiagnosticID with SDResourceManager."));

  }
  CFPreferencesAddSuitePreferencesToApp(kCFPreferencesCurrentApplication, CFSTR("com.apple.tailspin"));
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("TailspinKeychordTimeoutSeconds"), kCFPreferencesCurrentApplication, 0);
  if (AppIntegerValue)
    v7 = AppIntegerValue;
  else
    v7 = 40;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Dumping tailspin with timeout of %ld seconds", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v16 = 0x3032000000;
  v17 = sub_100025050;
  v18 = sub_100025060;
  v19 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100025068;
  v12[3] = &unk_100099620;
  v12[4] = &buf;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v8, 47, 0, 0, v12, (double)v7));

  if (v9)
  {
    objc_msgSend(v9, "setName:", CFSTR("tailspin-keychord"));
    objc_msgSend(v9, "setBlockUntilFinished:", 1);
    objc_msgSend(v9, "setRuntimeChecks:", 0);
    objc_msgSend(v9, "execute");
  }
  if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      *(_DWORD *)v13 = 138412290;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Done dumping tailspin to path '%@'", v13, 0xCu);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Done dumping tailspin to path '%@'"), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
LABEL_22:

    goto LABEL_23;
  }
  unlink((const char *)objc_msgSend(0, "fileSystemRepresentation"));
  if (sub_100045E60())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin keychord failed", v13, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Tailspin keychord failed"));
    goto LABEL_22;
  }
LABEL_23:

  _Block_object_dispose(&buf, 8);
}

void sub_100025030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025050(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100025060(uint64_t a1)
{

}

void sub_100025068(uint64_t a1, xpc_object_t xdict)
{
  xpc_object_t value;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  id v14;

  value = xpc_dictionary_get_value(xdict, "resultPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue(value);
  v5 = v4;
  if (v4)
  {
    v6 = sub_1000240F4(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_msgSend(v7, "count");
    if (v8 == (id)1)
    {
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

    }
    else
    {
      v12 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "tailspin keychord task returned wrong number of paths (%ld)", (uint8_t *)&v13, 0xCu);
      }
    }

  }
}

unint64_t sub_100025178(unint64_t a1)
{
  unint64_t v1;
  int v3;
  unint64_t v4;
  __int16 v5;
  uint64_t v6;

  v1 = a1;
  if (!a1)
    v1 = sub_100025290();
  if (v1 <= 0xC7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 134218240;
      v4 = v1;
      v5 = 2048;
      v1 = 200;
      v6 = 200;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin buffer size is %lu. Rounding up to minimum size cap of %lu", (uint8_t *)&v3, 0x16u);
    }
    else
    {
      v1 = 200;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 134217984;
    v4 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tailspin save size cap requested. Returning %lu", (uint8_t *)&v3, 0xCu);
  }
  return v1;
}

uint64_t sub_100025290()
{
  BOOL v0;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  dispatch_time_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD block[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  if (&_tailspin_config_free)
    v0 = &_tailspin_buffer_size_get == 0;
  else
    v0 = 1;
  if (v0 || &_tailspin_config_create_with_current_state == 0)
  {
    v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v2)
      sub_10005F588(v2, v3, v4, v5, v6, v7, v8, v9);
    v10 = v26[3];
  }
  else
  {
    v11 = dispatch_group_create();
    global_queue = dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100027720;
    block[3] = &unk_100099758;
    block[4] = &v25;
    dispatch_group_async(v11, v13, block);

    v14 = dispatch_time(0, 1000000000);
    if (dispatch_group_wait(v11, v14))
    {
      v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v15)
        sub_10005F5BC(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    v10 = v26[3];

  }
  _Block_object_dispose(&v25, 8);
  return v10;
}

unint64_t sub_1000253D8(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;

  v2 = a2;
  if (!a2)
  {
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4)
      sub_10005F62C(v4, v5, v6, v7, v8, v9, v10, v11);
    v2 = 1;
  }
  if (v2 <= a1)
  {
    v12 = a1;
  }
  else
  {
    v12 = v2;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134218240;
      v15 = a1;
      v16 = 2048;
      v17 = v2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got small tailspin buffer size of %lu. Rounding to minimum %lu", (uint8_t *)&v14, 0x16u);
      v12 = v2;
    }
  }
  if (!(v12 % v2))
    return v12;
  if (v2 + v2 * (v12 / v2) >= v12)
    v2 += v2 * (v12 / v2);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 134218240;
    v15 = v12;
    v16 = 2048;
    v17 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got non-standard tailspin buffer size of %lu. Rounding up to %lu", (uint8_t *)&v14, 0x16u);
  }
  return v2;
}

unint64_t sub_100025544(unint64_t a1)
{
  if (!a1)
    a1 = sub_100025290();
  return 10 * (sub_1000253D8(a1, 0x32uLL) / 0x32);
}

SDArchive *sub_10002558C(uint64_t a1, void *a2, void *a3, int a4, int a5)
{
  id v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  SDArchive *v14;
  SDArchive *v15;
  SDArchive *v16;

  v9 = a2;
  if (a5)
    v10 = 3;
  else
    v10 = 1;
  if (a5)
    v11 = 2;
  else
    v11 = 0;
  if (a4)
    v12 = v10;
  else
    v12 = v11;
  v13 = a3;
  v14 = [SDArchive alloc];
  if ((a1 & 0x80000000) != 0)
    v15 = -[SDArchive initWithPath:withOptions:withName:](v14, "initWithPath:withOptions:withName:", v9, v12, v13);
  else
    v15 = -[SDArchive initWithFD:withOptions:withName:](v14, "initWithFD:withOptions:withName:", a1, v12, v13);
  v16 = v15;

  return v16;
}

id sub_100025654(int a1)
{
  void *v2;
  int v3;
  void *v4;
  _BYTE v6[1024];

  if (a1 < 0)
  {
LABEL_7:
    v2 = 0;
    return v2;
  }
  bzero(v6, 0x400uLL);
  if (fcntl(a1, 50, v6) == -1)
  {
    v3 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F660(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v4, "log:", CFSTR("Failed to get path from FD: %s"), strerror(v3));

    goto LABEL_7;
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
  return v2;
}

uint64_t sub_100025750(int a1)
{
  if (a1 < 0)
    return 0xFFFFFFFFLL;
  else
    return fcntl(a1, 63);
}

uint64_t sub_100025764(int a1, int a2)
{
  id v4;
  id v5;
  const char *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  int v16;
  uint8_t buf[4];
  id v18;

  v4 = sub_100025654(a1);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v4));
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");

  v7 = sub_100025654(a2);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
  v9 = objc_msgSend(v8, "fileSystemRepresentation");

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Falling back to creating new tarball at final location '%s'", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "log:", CFSTR("Falling back to creating new tarball at final location '%s'"), v9);

  if (lseek(a1, 0, 0) == -1)
  {
    v12 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F6CC((uint64_t)v6, (uint64_t)v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Failed to copy tarball '%s' to final location '%s'. Unable to lseek to start: %s"), v6, v9, strerror(v12));
    goto LABEL_13;
  }
  if (fcopyfile(a1, a2, 0, 0xFu) < 0)
  {
    v14 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F740((uint64_t)v6, (uint64_t)v9, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Failed to copy tarball '%s' to final location '%s': %s"), v6, v9, strerror(v14));
LABEL_13:
    v11 = 0;
LABEL_14:

    goto LABEL_15;
  }
  if (unlink(v6) == -1)
  {
    v16 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F7B4((int)v6, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Failed to unlink tarball '%s' after copy': %s"), v6, strerror(v16));
    v11 = 1;
    goto LABEL_14;
  }
  v11 = 1;
LABEL_15:
  close(a2);
  return v11;
}

uint64_t sub_1000259F0(const char *a1, int a2)
{
  uint64_t v4;
  const char *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;

  if (a2)
    v4 = 3;
  else
    v4 = 2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v5 = "YES";
    else
      v5 = "NO";
    *(_DWORD *)buf = 136315394;
    v14 = v5;
    v15 = 1024;
    v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device unlocked since boot? %s. Will use protection class %d", buf, 0x12u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v7 = v6;
  if (a2)
    v8 = "YES";
  else
    v8 = "NO";
  objc_msgSend(v6, "log:", CFSTR("Device unlocked since boot? %s. Will use protection class %d"), v8, v4);

  v9 = open_dprotected_np(a1, 536873474, v4, 0, 416);
  if ((_DWORD)v9 == -1)
  {
    v10 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F834((uint64_t)a1, v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Opening tarball file descriptor at %s with protection class %d failed: %s"), a1, v4, strerror(v10));

  }
  return v9;
}

uint64_t sub_100025B9C(void *a1, void *a2, unsigned int a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  SDArchive *v13;
  NSObject *v14;
  BOOL v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[4];
  id v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int v35;
  char v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v36 = 0;
  objc_msgSend(v10, "fileExistsAtPath:isDirectory:", v7, &v36);
  if (v36
    && ((v11 = v9, (v12 = v11) != 0)
     || (v13 = sub_10002558C(0xFFFFFFFFLL, v8, &stru_10009DC10, a3 & 1, (a3 >> 2) & 1),
         (v12 = (void *)objc_claimAutoreleasedReturnValue(v13)) != 0)))
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x2020000000;
    v35 = 0;
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tarQueue"));
    v15 = v11 == 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025F7C;
    block[3] = &unk_100099648;
    v16 = v12;
    v28 = v16;
    v17 = v7;
    v29 = v17;
    v30 = &v32;
    v31 = v15;
    dispatch_sync(v14, block);

    if (objc_msgSend(v16, "archiveStatus") == (id)1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Results written to %@", buf, 0xCu);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v18, "log:", CFSTR("Results written to %@"), v8);

      if ((a3 & 0x10) != 0)
        objc_msgSend(v10, "removeItemAtPath:error:", v17, 0);
    }
    else
    {
      v20 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v16, "archiveStatus");
        *(_DWORD *)buf = 134218242;
        v38 = v21;
        v39 = 2112;
        v40 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive failed with status %zd, output at %@", buf, 0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v22, "stdoutWrite:", CFSTR("SDArchive failed with status %zd, output at %@"), objc_msgSend(v16, "archiveStatus"), v17);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v23, "log:", CFSTR("SDArchive failed with status %zd, output at %@"), objc_msgSend(v16, "archiveStatus"), v17);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 436));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", NSFileOwnerAccountName, CFSTR("mobile"), NSFileGroupOwnerAccountName, v24, NSFilePosixPermissions, 0));

    objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v25, v8, 0);
    v19 = *((unsigned int *)v33 + 6);

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    v19 = 0xFFFFFFFFLL;
  }

  return v19;
}

void sub_100025F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100025F7C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  objc_msgSend(v2, "addDirectoryToArchive:withDirName:", v3, v4);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "getProtectionClass");
  return objc_msgSend(*(id *)(a1 + 32), "finalizeArchiveAndClose:", *(unsigned __int8 *)(a1 + 56));
}

off_t sub_100025FE4(uint64_t a1)
{
  stat *v2;
  int *v3;
  uint64_t v4;
  int *v5;
  int v6;
  void *v7;
  off_t st_size;
  int v9;
  void *v10;
  uint8_t buf[4];
  _BYTE v13[10];
  __int16 v14;
  char *v15;

  v2 = (stat *)malloc_type_malloc(0x90uLL, 0x1000040B72DA15FuLL);
  v3 = __error();
  if (v2)
  {
    v4 = fstat(a1, v2);
    v5 = __error();
    if ((_DWORD)v4)
    {
      v6 = *v5;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v13 = a1;
        *(_WORD *)&v13[4] = 1024;
        *(_DWORD *)&v13[6] = v4;
        v14 = 2080;
        v15 = strerror(v6);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to stat %d with return code: %d, errno: %s", buf, 0x18u);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v7, "log:", CFSTR("Failed to stat %d with return code: %d, errno: %s"), a1, v4, strerror(v6));

      st_size = 0;
    }
    else
    {
      st_size = v2->st_size;
    }
    free(v2);
  }
  else
  {
    v9 = *v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v13 = strerror(v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to malloc stat struct with errno: %s", buf, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "log:", CFSTR("Failed to malloc stat struct with errno: %s"), strerror(v9));

    return 0;
  }
  return st_size;
}

BOOL sub_1000261D4(FILE *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _BOOL8 v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v9 = a3;
  v10 = sub_100026438(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = sub_100026438(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", v14));

  v16 = objc_msgSend(v15, "count");
  v17 = (unint64_t)v16 > 1;
  if ((unint64_t)v16 < 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      v25 = 2112;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Non-matching paths passed to addFileToOutputSummary %@ - %@", buf, 0x16u);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v19, "log:", CFSTR("Non-matching paths passed to addFileToOutputSummary %@ - %@"), v11, v13);
  }
  else
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
    if (!v18)
    {
      v17 = 0;
      goto LABEL_9;
    }
    v19 = (void *)v18;
    if (a1)
    {
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File: %@ -- size: %lld -- compressed: %lld\n"), v18, a4, a5)));
      fputs((const char *)objc_msgSend(v20, "UTF8String"), a1);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218498;
        v24 = a4;
        v25 = 2048;
        v26 = a5;
        v27 = 2112;
        v28 = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage: %lld bytes original and %lld compressed for '%@'", buf, 0x20u);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v22, "log:", CFSTR("Resource Usage: %lld bytes original and %lld compressed for '%@'"), a4, a5, v19);

    }
  }

LABEL_9:
  return v17;
}

id sub_100026438(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "containsString:", CFSTR("IN_PROGRESS_")))
    v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("IN_PROGRESS_"), &stru_10009DC10));
  else
    v2 = v1;
  v3 = v2;

  return v3;
}

void sub_100026498(CFTimeInterval a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  IOPMAssertionID AssertionID;
  uint8_t buf[4];
  CFTimeInterval v10;
  __int16 v11;
  int v12;

  if (dword_1000B97F8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Attempting to take sysdiagnose power assertion but an assertion is already held.", buf, 2u);
    }
    v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v1, "log:", CFSTR("Attempting to take sysdiagnose power assertion but an assertion is already held."));

  }
  else
  {
    AssertionID = 0;
    v3 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("com.apple.sysdiagnose"), CFSTR("sysdiagnose gathering diagnostics"), 0, 0, a1, CFSTR("TimeoutActionTurnOff"), &AssertionID);
    if ((_DWORD)v3)
    {
      v4 = v3;
      dword_1000B97F8 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v10 = a1;
        v11 = 1024;
        v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d", buf, 0x12u);
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v5, "stdoutWrite:", CFSTR("Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d"), *(_QWORD *)&a1, v4);

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "log:", CFSTR("Failed attempt to take sysdiagnose power assertion for %.0f secs with reason %d"), *(_QWORD *)&a1, v4);
    }
    else
    {
      dword_1000B97F8 = AssertionID;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v10 = a1;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Took power assertion for %.0f secs", buf, 0xCu);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "log:", CFSTR("Took power assertion for %.0f secs"), *(_QWORD *)&a1, v7);
    }

  }
}

void sub_1000266D0(double a1)
{
  _QWORD block[5];

  if (qword_1000B9800 != -1)
    dispatch_once(&qword_1000B9800, &stru_100099668);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026788;
  block[3] = &unk_100099688;
  *(double *)&block[4] = a1;
  dispatch_async((dispatch_queue_t)qword_1000B9808, block);
}

void sub_10002675C(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.sysdiagnose.power-assertions-queue", 0);
  v2 = (void *)qword_1000B9808;
  qword_1000B9808 = (uint64_t)v1;

}

void sub_100026788(uint64_t a1)
{
  sub_100026498(*(CFTimeInterval *)(a1 + 32));
}

void sub_100026790()
{
  void *v0;
  uint8_t buf[4];
  int v2;

  if (dword_1000B97F8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v2 = dword_1000B97F8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Releasing sysdiagnose power assertion %u", buf, 8u);
    }
    v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v0, "log:", CFSTR("Releasing sysdiagnose power assertion %u"), dword_1000B97F8);

    IOPMAssertionRelease(dword_1000B97F8);
    dword_1000B97F8 = 0;
  }
}

uint64_t sub_100026870(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataUsingEncoding:", 4));
  objc_msgSend(v7, "writeData:", v11);

  return 1;
}

void sub_100026948(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;

  if (a2 == 1)
  {
    v15 = objc_begin_catch(a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reason"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Hit exception %@ %@. Error was %@.")));

    v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v18)
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v19, "log:", CFSTR("%@"));

    }
    else if (v18)
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }
    if (v13)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataUsingEncoding:", 4));
      objc_msgSend(v13, "writeData:", v20);

    }
    objc_end_catch();
    JUMPOUT(0x1000268F4);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100026AF8()
{
  if (qword_1000B9818 != -1)
    dispatch_once(&qword_1000B9818, &stru_1000996A8);
  return byte_1000B9810;
}

void sub_100026B38(id a1)
{
  byte_1000B9810 = OSAInMultiUserMode(a1);
}

id sub_100026B54(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pathSubmission"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v1));

  return v4;
}

void *sub_100026BC4()
{
  if (qword_1000B9820 != -1)
    dispatch_once(&qword_1000B9820, &stru_1000996C8);
  return off_1000B9460;
}

void sub_100026C04(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sysdiagnose", "signpost");
  v2 = off_1000B9460;
  off_1000B9460 = v1;

}

void *sub_100026C34()
{
  if (qword_1000B9828 != -1)
    dispatch_once(&qword_1000B9828, &stru_1000996E8);
  return off_1000B9468;
}

void sub_100026C74(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sysdiagnose", "containers");
  v2 = off_1000B9468;
  off_1000B9468 = v1;

}

uint64_t sub_100026CA4()
{
  return 0;
}

id sub_100026CAC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  __CFString *v8;
  char *v9;
  char *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int *v25;
  void *v26;
  int *v27;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v4)
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("sysdiagnose_temp.XXXXXX")));
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = CFSTR("sysdiagnose_temp.XXXXXX");
  if (v3)
  {
LABEL_3:
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v6));

    v6 = (__CFString *)v7;
  }
LABEL_4:
  v8 = objc_retainAutorelease(v6);
  v9 = strndup((const char *)-[__CFString UTF8String](v8, "UTF8String"), (size_t)-[__CFString length](v8, "length"));
  if (!v9)
  {
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14)
      sub_10005F8D8(v14, v15, v16, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v22, "stderrWrite:", CFSTR("Unable to allocate temporary directory template"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v23, "log:", CFSTR("Unable to allocate temporary directory template"));

    goto LABEL_15;
  }
  v10 = v9;
  if (!mkdtemp(v9))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F90C();
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v25 = __error();
    objc_msgSend(v24, "stderrWrite:", CFSTR("Unable to create user temporary directory %@: %s"), v8, strerror(*v25));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v27 = __error();
    objc_msgSend(v26, "log:", CFSTR("Unable to create user temporary directory %@: %s"), v8, strerror(*v27));

    free(v10);
LABEL_15:
    v13 = 0;
    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", v10, strlen(v10));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  free(v10);
LABEL_16:

  return v13;
}

id sub_100026ECC(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 1;
  v1 = objc_retainAutorelease(a1);
  v2 = container_system_group_path_for_identifier(0, objc_msgSend(v1, "UTF8String"), &v6);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v2));
    free(v3);
  }
  else
  {
    container_get_error_description(v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F990();
    v4 = 0;
  }

  return v4;
}

id sub_100026F84(void *a1, int a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  xpc_object_t v7;
  passwd *v8;
  uint64_t pw_uid;
  uint64_t path;
  void *v11;
  uint64_t last_error;
  void *v13;
  uint64_t v14;

  v3 = a1;
  v4 = container_query_create();
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005F9F8();
    goto LABEL_20;
  }
  container_query_set_class(v4, 7);
  container_query_operation_set_flags(v5, 0x100000002);
  v6 = objc_retainAutorelease(v3);
  v7 = xpc_string_create((const char *)objc_msgSend(v6, "UTF8String"));
  container_query_set_group_identifiers(v5, v7);

  if (a2)
  {
    v8 = getpwnam("mobile");
    if (v8)
      pw_uid = v8->pw_uid;
    else
      pw_uid = 501;
    if (!getpwuid(pw_uid))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10005FA60((uint64_t)v6, pw_uid);
      goto LABEL_20;
    }
    container_query_set_uid(v5, pw_uid);
  }
  if (!container_query_get_single_result(v5))
  {
    last_error = container_query_get_last_error(v5);
    v13 = (void *)container_error_copy_unlocalized_description(last_error);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FAE4();
    goto LABEL_17;
  }
  path = container_get_path();
  if (!path)
  {
    v14 = container_query_get_last_error(v5);
    v13 = (void *)container_error_copy_unlocalized_description(v14);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FB4C();
LABEL_17:
    free(v13);
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", path));
LABEL_21:
  container_query_free(v5);

  return v11;
}

uint64_t sub_10002713C(uint64_t a1)
{
  if (qword_1000B9830 != -1)
    dispatch_once(&qword_1000B9830, &stru_100099708);
  return qword_1000B9838 * a1;
}

void sub_10002718C(id a1)
{
  mach_timebase_info info;

  info = 0;
  if (!mach_timebase_info(&info))
    qword_1000B9838 = info.numer / info.denom;
}

uint64_t sub_1000271C4(int a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (a1 == -1)
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  v2 = 0u;
  proc_pid_rusage(a1, 5, (rusage_info_t *)&v2);
  return *((_QWORD *)&v3 + 1) + v3;
}

unint64_t sub_100027260(uint64_t a1, uint64_t a2)
{
  unint64_t result;
  uint64_t v4;
  int v5;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)a2 + *(_QWORD *)a1;
    v5 = *(_DWORD *)(a2 + 8) + *(_DWORD *)(a1 + 8);
    if (v5 > 0xF423F)
    {
      ++v4;
      v5 -= 1000000;
    }
    return (unint64_t)(float)((float)(unint64_t)(1000000000 * v4) + (float)(unint64_t)(1000 * v5));
  }
  return result;
}

double sub_1000272CC(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  double v4;
  double v5;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v1[2](v1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v2);
  v5 = v4;

  return v5;
}

NSObject *sub_10002734C(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD handler[4];
  id v9;

  v3 = a1;
  v4 = a2;
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, (int)objc_msgSend(v3, "processIdentifier"), 0x80000000uLL, v4);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100027404;
  handler[3] = &unk_100098F88;
  v9 = v3;
  v6 = v3;
  dispatch_source_set_registration_handler(v5, handler);

  return v5;
}

void sub_100027404(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resuming process", (uint8_t *)&v8, 2u);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "resume") & 1) != 0)
  {
    v2 = sub_100026BC4();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    v4 = v3;
    v5 = *(void **)(a1 + 32);
    if ((unint64_t)v5 + 1 >= 2 && os_signpost_enabled(v3))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executionLine"));
      v8 = 138412290;
      v9 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v5, "CLI Task", "%@", (uint8_t *)&v8, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "executionLine"));
    v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error resuming process %@", (uint8_t *)&v8, 0xCu);

  }
}

id sub_100027590(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_task_failures.txt"), v4));

  v9[0] = v3;
  v9[1] = CFSTR("errors");
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v6));

  return v7;
}

id sub_10002768C(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (v3 && objc_msgSend(v3, "length") && (objc_msgSend(v3, "isEqualToString:", CFSTR(".")) & 1) == 0)
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  else
    v5 = v4;
  v6 = v5;

  return v6;
}

id sub_100027708(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByAppendingString:", CFSTR(" task"));
}

id sub_100027714(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByAppendingString:", CFSTR(" collection"));
}

void sub_100027720(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = tailspin_config_create_with_current_state();
  if (v2)
  {
    v3 = v2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = tailspin_buffer_size_get();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v5 = 134217984;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stored system tailspin buffer size is %lu", (uint8_t *)&v5, 0xCu);
    }
    tailspin_config_free(v3);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10005FBB4();
  }
}

void sub_10002786C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

char *sub_10002787C@<X0>(int __errnum@<W2>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 24) = a2;
  return strerror(__errnum);
}

void sub_100027B48()
{
  atomic_store(byte_1000B9470, byte_1000B9840);
}

void sub_100027B60(char a1)
{
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  _QWORD block[4];
  char v5;

  global_queue = dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100027BD4;
  block[3] = &unk_1000998A0;
  v5 = a1;
  dispatch_async(v3, block);

}

void sub_100027BD4(uint64_t a1)
{
  void *v2;
  _UNKNOWN **v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObject:forKey:](NSMutableDictionary, "dictionaryWithObject:forKey:", &off_1000ACD88, kAudioServicesPlaySystemSoundOptionFlagsKey));
  if (*(_BYTE *)(a1 + 32))
    v3 = &off_1000ACB48;
  else
    v3 = &off_1000ACB60;
  v6[0] = CFSTR("Intensity");
  v6[1] = CFSTR("VibePattern");
  v7[0] = &off_1000AD068;
  v7[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  objc_msgSend(v2, "setObject:forKey:", v4, kAudioServicesPlaySystemSoundOptionVibrationPatternKey);

  v5 = objc_msgSend(v2, "copy");
  AudioServicesPlaySystemSoundWithOptions(1352, v5, 0);

}

void sub_100027CE8(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  const char *v6;
  uint32_t v7;
  void *v8;
  void *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027E5C;
  v11[3] = &unk_1000998C8;
  v3 = a2;
  v12 = v3;
  v4 = a1;
  v5 = objc_retainBlock(v11);
  if (sub_100046370())
    v6 = "com.apple.appletv.backgroundstate";
  else
    v6 = "com.apple.springboard.lockstate";
  v7 = notify_register_dispatch(v6, &dword_1000B9844, v4, v5);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to register lock notification", v10, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "stdoutWrite:", CFSTR("failed to register lock notification"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v9, "log:", CFSTR("failed to register lock notification"));

  }
  byte_1000B9470 = 1;
  ((void (*)(_QWORD *, _QWORD))v5[2])(v5, dword_1000B9844);

}

uint64_t sub_100027E5C(uint64_t a1, int token)
{
  uint64_t result;
  uint64_t state64;

  state64 = 0;
  result = notify_get_state(token, &state64);
  if (!(_DWORD)result)
  {
    byte_1000B9470 = state64 != 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_100027EB8()
{
  const char *v0;
  void *v1;
  void *v2;
  const char *v3;
  void *v4;
  void *v5;
  const char *v6;
  uint8_t buf[4];
  const char *v9;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000B9470)
      v0 = "LOCKED!";
    else
      v0 = "unlocked";
    *(_DWORD *)buf = 136315138;
    v9 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device %s", buf, 0xCu);
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v2 = v1;
  if (byte_1000B9470)
    v3 = "LOCKED!";
  else
    v3 = "unlocked";
  objc_msgSend(v1, "stdoutWrite:", CFSTR("Device %s"), v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v5 = v4;
  if (byte_1000B9470)
    v6 = "LOCKED!";
  else
    v6 = "unlocked";
  objc_msgSend(v4, "log:", CFSTR("Device %s"), v6);

  return byte_1000B9470;
}

void sub_100027FE8(uint64_t a1, uint64_t a2)
{
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  void *v5;
  _QWORD block[5];

  if (objc_opt_class(SBSBackgroundActivityAssertion, a2))
  {
    global_queue = dispatch_get_global_queue(25, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100028088;
    block[3] = &unk_100099688;
    block[4] = a1;
    dispatch_async(v4, block);

  }
  else
  {
    v5 = (void *)qword_1000B9848;
    qword_1000B9848 = 0;

  }
}

void sub_100028088(uint64_t a1)
{
  id v2;
  SBSBackgroundActivityAssertion *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  __CFString *v9;
  uint8_t buf[16];

  v2 = STBackgroundActivityIdentifierSysdiagnose;
  if (!*(_QWORD *)(a1 + 32))
    _os_assumes_log(0);
  v3 = +[SBSBackgroundActivityAssertion assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:](SBSBackgroundActivityAssertion, "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:", v2, getpid(), 1, 1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)qword_1000B9848;
  qword_1000B9848 = v4;

  if (!qword_1000B9848)
    _os_assumes_log(0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Acquiring status bar assertion", buf, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v6, "stdoutWrite:", CFSTR("Acquiring status bar assertion"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "log:", CFSTR("Acquiring status bar assertion"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002820C;
  v8[3] = &unk_1000998F0;
  v9 = CFSTR("Gathering diagnostics...");
  objc_msgSend((id)qword_1000B9848, "acquireWithHandler:invalidationHandler:", v8, &stru_100099910);

}

void sub_10002820C(uint64_t a1, int a2)
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully acquired status bar assertion", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "stdoutWrite:", CFSTR("Successfully acquired status bar assertion"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Successfully acquired status bar assertion"));

    sub_100028344(*(void **)(a1 + 32));
  }
  else
  {
    if (v4)
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to acquire status bar assertion", v9, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "stdoutWrite:", CFSTR("Unable to acquire status bar assertion"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("Unable to acquire status bar assertion"));

  }
}

void sub_100028344(void *a1)
{
  id v1;
  dispatch_queue_global_t global_queue;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v1 = a1;
  if (!v1)
    _os_assumes_log(0);
  global_queue = dispatch_get_global_queue(25, 0);
  v3 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100028498;
  block[3] = &unk_100098F88;
  v6 = v1;
  v4 = v1;
  dispatch_async(v3, block);

}

void sub_1000283E0(id a1)
{
  void *v1;
  void *v2;
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Status bar assertion released", v3, 2u);
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v1, "stdoutWrite:", CFSTR("Status bar assertion released"));

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", CFSTR("Status bar assertion released"));

  objc_msgSend((id)qword_1000B9848, "invalidate");
}

_QWORD *sub_100028498(_QWORD *result)
{
  if (qword_1000B9848)
    return objc_msgSend((id)qword_1000B9848, "setStatusString:", result[4]);
  return result;
}

void sub_1000284B4(int a1, uint64_t a2)
{
  if (a1)
    sub_100027B60(0);
  if (a2)
    sub_100027FE8(a2, a2);
}

void sub_1000284F0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;

  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching FBA ...", buf, 2u);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v5, "stdoutWrite:", CFSTR("Launching FBA ..."));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v6, "log:", CFSTR("Launching FBA ..."));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("applefeedback://new?bundleID?=%@&extension=com.apple.DiagnosticExtensions.sysdiagnose&com.apple.DiagnosticExtensions.sysdiagnose%%5BshouldCreateTarBall=0%%5D&com.apple.DiagnosticExtensions.sysdiagnose%%5BdiagnosticID%%5D=%@&com.apple.DiagnosticExtensions.sysdiagnose[fbaKeychord]=1"), v4, v3));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "FBA Params %{public}@", buf, 0xCu);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v8, "log:", CFSTR("FBA Params %{public}@"), v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v10, "openURL:configuration:completionHandler:", v9, 0, 0);

}

void sub_1000286C4(void *a1, int a2, void *a3, void *a4)
{
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  id v28;
  void *v29;
  NSMutableArray *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *j;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __CFString *v46;
  __CFString *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  size_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _OWORD v59[2];
  uint8_t buf[16];
  __int128 v61;
  _BYTE v62[128];

  v47 = a1;
  v48 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching TTR ...", buf, 2u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v8, "stdoutWrite:", CFSTR("Launching TTR ..."));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v9, "log:", CFSTR("Launching TTR ..."));

  v46 = (__CFString *)v7;
  if (v7)
    v10 = v7;
  else
    v10 = CFSTR("tap-to-radar://new");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "queryItems"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v15);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Keywords")));
  if (!v21)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("579886"), CFSTR("Keywords"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Title")));

  if (!v22)
  {
    *(_OWORD *)buf = 0u;
    v61 = 0u;
    memset(v59, 0, sizeof(v59));
    v53 = 32;
    sysctlbyname("hw.targettype", v59, &v53, 0, 0);
    v53 = 32;
    sysctlbyname("kern.osversion", buf, &v53, 0, 0);
    if (LOBYTE(v59[0]))
    {
      if (buf[0])
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%s: "), v59, buf));
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("Title"));

      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("BundleID")));

  if (v48 && !v24)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v48, CFSTR("BundleID"));
  if (a2)
  {
    v25 = CFSTR("diagnosticID");
    v26 = v12;
    v27 = v47;
  }
  else
  {
    v28 = sub_100023D38(v47, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v29, CFSTR("Attachments"));

    v27 = CFSTR("0");
    v25 = CFSTR("AutoDiagnostics");
    v26 = v12;
  }
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v27, v25);
  v30 = objc_opt_new(NSMutableArray);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v31 = v12;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v50 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)j);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v36));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v36, v37));
        -[NSMutableArray addObject:](v30, "addObject:", v38);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    }
    while (v33);
  }

  objc_msgSend(v11, "setQueryItems:", v30);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "absoluteString"));
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v40;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TTR Params %{public}@", buf, 0xCu);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "absoluteString"));
  objc_msgSend(v41, "log:", CFSTR("TTR Params %{public}@"), v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));
  objc_msgSend(v44, "openURL:configuration:completionHandler:", v45, 0, 0);

}

void sub_100028C74(void *a1)
{
  int v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a1;
  if (qword_1000B9848)
    objc_msgSend((id)qword_1000B9848, "invalidate");
  v1 = sub_100045E60();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "diagnosticID"));
  if (v1)
  {
    v3 = objc_msgSend(v6, "isEarlyPrompt");
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ttrOverrideURLStr"));
    sub_1000286C4(v2, v3, v4, v5);

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleID"));
    sub_1000284F0(v2, v4);
  }

}

void sub_100028D40(void *a1)
{
  id v1;
  uint8_t v2[16];

  v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting prompting logic", v2, 2u);
  }
  if (objc_msgSend(v1, "openIssueFiler") == (id)1)
    objc_msgSend(v1, "setOpenIssueFiler:", sub_100028DD8(v1));
  sub_1000291A8(v1);

}

uint64_t sub_100028DD8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  CFStringRef otherButtonTitle;
  uint8_t v19[8];
  uint8_t buf[4];
  int v21;

  v1 = a1;
  v2 = sub_100045E60();
  if ((v2 & 1) == 0 && (sub_10002334C(v2, v3) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt disabled on non-seed customer builds.", v19, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v15 = v14;
    v16 = CFSTR("Prompt disabled on non-seed customer builds.");
    goto LABEL_37;
  }
  if ((objc_msgSend(v1, "isCoSysdiagnoseResponse") & 1) == 0)
  {
    if (byte_1000B9470)
    {
      v4 = atomic_load(byte_1000B9840);
      if ((v4 & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt disabled since device is currently locked and was locked at beginning of diagnostics.", v19, 2u);
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v15 = v14;
        v16 = CFSTR("Prompt disabled since device is currently locked and was locked at beginning of diagnostics.");
LABEL_37:
        objc_msgSend(v14, "log:", v16);

        v13 = 0;
        goto LABEL_38;
      }
    }
  }
  *(_QWORD *)v19 = 0;
  if (objc_msgSend(v1, "didPartnerTimeout"))
  {
    if (sub_100045E60())
      v5 = CFSTR("Only the local diagnostics will be available, file radar anyways?");
    else
      v5 = CFSTR("Only the local diagnostics will be available, send feedback anyways?");
    v6 = CFSTR("Watch diagnostics did not complete in time.");
  }
  else
  {
    if (objc_msgSend(v1, "isEarlyPrompt"))
      v6 = CFSTR("Diagnostics are in flight");
    else
      v6 = CFSTR("Diagnostics complete.");
    if (objc_msgSend(v1, "isEarlyPrompt"))
      v5 = CFSTR("Perform the following:");
    else
      v5 = CFSTR("Sharing options:");
  }
  if (sub_100045E60())
    v7 = CFSTR("Open with Tap-to-Radar");
  else
    v7 = CFSTR("Send Feedback");
  v8 = (const __CFString *)CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v6, v5, v7, CFSTR("Ignore"), 0, (CFOptionFlags *)v19);
  if ((_DWORD)v8)
  {
    v9 = v8;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = (int)v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CFUserNotificationDisplayAlert for prompt failed with value %d", buf, 8u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = v10;
    otherButtonTitle = v9;
    v12 = CFSTR("CFUserNotificationDisplayAlert for prompt failed with value %d");
  }
  else if (*(_QWORD *)v19 == 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User selected to ignore the prompt.", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = v10;
    v12 = CFSTR("User selected to ignore the prompt.");
  }
  else
  {
    if (!*(_QWORD *)v19)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User selected to create radar", buf, 2u);
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v11, "log:", CFSTR("User selected to create radar"));
      v13 = 2;
      goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "End of promptPostAction", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = v10;
    v12 = CFSTR("End of promptPostAction");
  }
  objc_msgSend(v10, "log:", v12, otherButtonTitle);
  v13 = 0;
LABEL_25:

LABEL_38:
  return v13;
}

void sub_1000291A8(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  uint8_t buf[2];

  v1 = a1;
  if (!objc_msgSend(v1, "openIssueFiler")
    || (v2 = sub_100045E60(), (v2 & 1) == 0) && (sub_10002334C(v2, v3) & 1) == 0)
  {
    v4 = objc_msgSend(v1, "openIssueFiler");
    v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (!v5)
        goto LABEL_12;
      v8 = 0;
      v6 = "Current install does not permit prompting";
      v7 = (uint8_t *)&v8;
    }
    else
    {
      if (!v5)
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v6 = "Not prompting due to openIssueFiler = Do Nothing";
      v7 = buf;
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_12;
  }
  if (objc_msgSend(v1, "openIssueFiler") == (id)2)
    sub_100028C74(v1);
LABEL_12:

}

void sub_100029280(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v1 = a1;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Prompt Status %{public}@", (uint8_t *)&buf, 0xCu);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "description"));
  objc_msgSend(v3, "log:", CFSTR("Prompt Status %{public}@"), v4);

  if (objc_msgSend(v1, "openIssueFiler"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v13 = 0x3032000000;
    v14 = sub_10002947C;
    v15 = sub_10002948C;
    v16 = objc_msgSend(v1, "copy");
    v5 = (void *)os_transaction_create("com.apple.sysdiagnose-prompt");
    global_queue = dispatch_get_global_queue(33, 0);
    v7 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100029494;
    block[3] = &unk_100098FB0;
    v10 = v5;
    p_buf = &buf;
    v8 = v5;
    dispatch_async(v7, block);

    _Block_object_dispose(&buf, 8);
  }

}

void sub_10002945C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002947C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002948C(uint64_t a1)
{

}

void sub_100029494(uint64_t a1)
{
  sub_100028D40(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

const __CFString *sub_1000294A4()
{
  return &stru_10009DC10;
}

id sub_1000294B0(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithFileAtPath:](NSInputStream, "inputStreamWithFileAtPath:", a1));
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "open");
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithStream:options:format:error:](NSPropertyListSerialization, "propertyListWithStream:options:format:error:", v2, 0, 0, 0));
    objc_msgSend(v2, "close");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id sub_100029528()
{
  return sub_1000294B0((uint64_t)CFSTR("/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist"));
}

uint64_t sub_100029534()
{
  if (qword_1000B9850 != -1)
    dispatch_once(&qword_1000B9850, &stru_100099930);
  return byte_1000B9858;
}

void sub_100029574(id a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  uint8_t v9[16];

  if (byte_1000B9858)
  {
    v1 = 0;
    v2 = 0;
  }
  else
  {
    v3 = sub_1000294B0((uint64_t)CFSTR("/private/var/mobile/Library/Preferences/com.apple.sysdiagnose.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v2 = v4;
    if (v4)
    {
      v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sysdiagnoseIgnoreKeychords")));
      if (v1)
      {
        v6 = objc_opt_class(NSNumber, v5);
        if ((objc_opt_isKindOfClass(v1, v6) & 1) != 0)
        {
          v7 = objc_msgSend(v1, "BOOLValue");
          byte_1000B9858 = v7;
          if (v7)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v9 = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnoseIgnoreKeychords is on", v9, 2u);
            }
            v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v8, "log:", CFSTR("sysdiagnoseIgnoreKeychords is on"));

          }
        }
      }
    }
    else
    {
      v1 = 0;
    }
  }

}

uint64_t sub_100029688()
{
  uint64_t result;
  BOOL v1;

  result = sub_1000235A8();
  if ((_DWORD)result)
  {
    v1 = 0;
    sub_10004602C(CFSTR("factoryDisable"), CFSTR("com.apple.sysdiagnose"), &v1);
    return v1;
  }
  return result;
}

void sub_1000296D0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = a1;
  if (v1)
  {
    v9 = v1;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localGroupDictionary"));
    objc_msgSend(v3, "removeObjectForKey:", v9);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "executionGroupDictionary"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v9));

    if (v6)
    {
      dispatch_group_leave(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executionGroupDictionary"));
      objc_msgSend(v8, "removeObjectForKey:", v9);

    }
    v1 = v9;
  }

}

void sub_1000297AC(void *a1)
{
  void *v1;
  id v2;

  v2 = a1;
  if (qword_1000B9848)
    objc_msgSend((id)qword_1000B9848, "invalidate");
  sub_100026790();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "diagnosticID"));
  sub_1000296D0(v1);

}

id sub_100029B00(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  NSFileAttributeKey v30;
  _UNKNOWN **v31;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmpOutputDirectory"));

    if (v5)
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmpOutputDirectory"));
  }
  else
  {
    v5 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("_")));
  v7 = sub_100026CAC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_retainAutorelease(v8);
  if (sub_100053B70((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x1EDu))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FD3C((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "stderrWrite:", CFSTR("Unable to set attributes on task temporary directory %@"), v9);

    v18 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v18, "log:", CFSTR("Unable to set attributes on task temporary directory %@"), v9);
    v19 = 0;
  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v4));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v30 = NSFilePosixPermissions;
    v31 = &off_1000ACE00;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1));
    v29 = 0;
    v23 = objc_msgSend(v21, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, v22, &v29);
    v18 = v29;

    if ((v23 & 1) != 0)
    {
      v9 = v20;
      v19 = v9;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_10005FC94((uint64_t)v20, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
      objc_msgSend(v24, "stderrWrite:", CFSTR("Could not create target location %@ with error %@"), v20, v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedDescription"));
      objc_msgSend(v26, "log:", CFSTR("Could not create target location %@ with error %@"), v20, v27);

      v19 = 0;
      v9 = v20;
    }
  }

  return v19;
}

id sub_100029DDC(uint64_t a1)
{
  id result;

  result = *(id *)(a1 + 32);
  if (result)
    return objc_msgSend(result, "execute");
  return result;
}

id sub_10002A0BC(uint64_t a1, uint64_t a2)
{
  id result;

  result = *(id *)(a1 + 32);
  if (result)
  {
    objc_msgSend(result, "addRulesFromHelperReply:", a2);
    return objc_msgSend(*(id *)(a1 + 32), "execute");
  }
  return result;
}

_QWORD *sub_10002A374(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a2)
  {
    v2 = result;
    v3 = (void *)result[4];
    if (v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithMutablePaths:](SDUnitLogPathArray, "logRuleWithMutablePaths:", a2));
      v6 = v4;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
      objc_msgSend(v3, "addRules:", v5);

      return objc_msgSend((id)v2[4], "execute");
    }
  }
  return result;
}

id sub_10002BCD0(uint64_t a1)
{
  void *v2;
  void *v3;
  MultiTouchDiagnostic *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[8];
  _BYTE v36[128];
  NSURLResourceKey v37;
  _BYTE v38[128];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting MultiTouch diagnostics", buf, 2u);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("Collecting MultiTouch diagnostics"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("Collecting MultiTouch diagnostics"));

  if (objc_msgSend(*(id *)(a1 + 32), "pidForProcessName:", CFSTR("mtrecorder.internal")) != -1
    || objc_msgSend(*(id *)(a1 + 32), "pidForProcessName:", CFSTR("mtrecorder")) != -1)
  {
    v4 = objc_alloc_init(MultiTouchDiagnostic);
    if (!-[MultiTouchDiagnostic runWithTimeout:](v4, "runWithTimeout:", 5.0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out.", buf, 2u);
      }
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v5, "stdoutWrite:", CFSTR("Timed out."));

      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "log:", CFSTR("Timed out."));

    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = objc_msgSend(&off_1000ACCB0, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v25)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(&off_1000ACCB0);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v9, 1));
        v37 = NSURLNameKey;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v37, 1));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v11, v12, 6, &stru_1000999D8));

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = v13;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v28;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v28 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v18);
              v20 = objc_autoreleasePoolPush();
              v26 = 0;
              objc_msgSend(v19, "getResourceValue:forKey:error:", &v26, NSURLNameKey, 0);
              if (v26)
              {
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:"));
                objc_msgSend(v7, "addObject:", v21);

              }
              objc_autoreleasePoolPop(v20);
              v18 = (char *)v18 + 1;
            }
            while (v16 != v18);
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
          }
          while (v16);
        }

        v8 = (char *)v8 + 1;
      }
      while (v8 != v25);
      v25 = objc_msgSend(&off_1000ACCB0, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v25);
  }
  if (objc_msgSend(v7, "count"))
    v22 = v7;
  else
    v22 = 0;

  return v22;
}

BOOL sub_10002C0C4(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MultiTouch error %@", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  objc_msgSend(v5, "log:", CFSTR("MultiTouch error %@"), v6);

  return 1;
}

void sub_10002C8B0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("tailspin-save-ts-collection"), &stru_10009DC10, *(_QWORD *)(a1 + 32)));
  if (v2)
  {
    objc_msgSend(v2, "setMaximumSizeMB:", sub_100025178(0));
    v6 = *(_QWORD *)(a1 + 40);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v3));
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    objc_msgSend(v2, "addRules:", v5);

    objc_msgSend(v2, "execute");
  }

}

void sub_10002CD88(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("spindump-meta-collection"), &stru_10009DC10, *(_QWORD *)(a1 + 32)));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setMaximumSizeMB:", 200);
    v7 = *(_QWORD *)(a1 + 40);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v4));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v3, "addRules:", v6);

    objc_msgSend(v3, "execute");
  }

}

void sub_10002D270(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002DD28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;

  v7 = xpc_dictionary_create(0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "gatherLocalSysdiagnoseForMsg:withReply:", *(_QWORD *)(a1 + 32), v7));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_msgSend(v4, "isHost");

  if ((v5 & 1) == 0)
  {
    if (v3)
      +[CSRemoteXPCProxy remoteSendFile:toPeer:withTimeoutTarget:](CSRemoteXPCProxy, "remoteSendFile:toPeer:withTimeoutTarget:", v3, *(_QWORD *)(a1 + 40), 0);
    else
      xpc_remote_connection_send_message(*(_QWORD *)(a1 + 40), v7);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  objc_msgSend(v6, "endRemoteInitiatedFlow");

}

void sub_10002E054(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  objc_msgSend(v1, "safeLeaveHostWaitGroup");

}

void sub_10002E15C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  OS_xpc_object *v9;
  uint8_t buf[16];

  v2 = a2;
  if ((sub_100045E60() & 1) != 0
    || (sub_10004649C() & 1) != 0
    || (sub_100046500() & 1) != 0
    || (sub_100046900() & 1) != 0
    || sub_100023500())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002E2DC;
    v8[3] = &unk_100099990;
    v3 = v2;
    v9 = v3;
    xpc_remote_connection_set_event_handler(v3, v8);
    xpc_remote_connection_activate(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Connection started.", buf, 2u);
    }

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Current configuration prevents device from accepting RemoteXPC requests. Cancelling remote connection", buf, 2u);
    }

    xpc_remote_connection_cancel(v2);
  }

}

void sub_10002E2DC(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a2;
  type = xpc_get_type(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logSubsystem"));

  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Initiating remote connection", buf, 2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:forMsg:isTrusted:](CSRemoteXPCProxy, "handleRemoteConnection:forMsg:isTrusted:", *(_QWORD *)(a1 + 32), v3, 0);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSRemoteXPCProxy: Cancelling remote connection", v8, 2u);
    }

    xpc_remote_connection_cancel(*(_QWORD *)(a1 + 32));
  }

}

BOOL sub_10002EAB0(void *a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "lowercaseString"));
  v2 = objc_msgSend(v1, "rangeOfString:", CFSTR("bridge"));

  return v2 != (id)0x7FFFFFFFFFFFFFFFLL;
}

uint64_t sub_10002EAF4(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v7 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
      v16 = 136315650;
      v17 = v7;
      v18 = 1024;
      v19 = a2;
      v20 = 2080;
      v21 = strerror(a2);
      v8 = "CSRemoteXPCProxy: File transfer failed to \"%s\" with error %d:%s";
      v9 = v5;
      v10 = 28;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v16, v10);
    }
  }
  else if (v6)
  {
    v11 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
    v16 = 136315138;
    v17 = v11;
    v8 = "CSRemoteXPCProxy: File transfer succeeded to \"%s\"";
    v9 = v5;
    v10 = 12;
    goto LABEL_6;
  }

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v12, v13, v14);
}

void sub_10002EF68(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  _DWORD v10[2];
  __int16 v11;
  char *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logSubsystem"));

  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      v10[0] = 67109378;
      v10[1] = a2;
      v11 = 2080;
      v12 = strerror(a2);
      v7 = "CSRemoteXPCProxy: File transfer failed with error %d:%s";
      v8 = v5;
      v9 = 18;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v10, v9);
    }
  }
  else if (v6)
  {
    LOWORD(v10[0]) = 0;
    v7 = "CSRemoteXPCProxy: File transfer succeeded";
    v8 = v5;
    v9 = 2;
    goto LABEL_6;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10002F680(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  const _xpc_type_s *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const char *string;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    v5 = type;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v5 == (const _xpc_type_s *)&_xpc_type_error)
    {
      if (v8)
      {
        v11 = *(_QWORD *)(a1 + 40);
        v12 = 136315394;
        v13 = v11;
        v14 = 2080;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with error: %s";
        goto LABEL_8;
      }
    }
    else if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 136315394;
      v13 = v9;
      v14 = 2080;
      string = xpc_type_get_name(v5);
      v10 = "CSRemoteXPCProxy: Connection to '%s' terminated with event type: %s";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "safeLeaveRemoteGroup");
    objc_msgSend(*(id *)(a1 + 32), "cancelConnection");
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 32), "handleRemoteResponse:", v3);
LABEL_10:

}

id sub_10002FB14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safeLeaveRemoteGroup");
}

void sub_10002FE38(id a1)
{
  dword_1000B9860 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

void sub_1000304DC(void *a1)
{
  unsigned __int8 v1;
  id v2;
  id v3;

  v3 = 0;
  v1 = objc_msgSend(a1, "seekToOffset:error:", 0, &v3);
  v2 = v3;
  if ((v1 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100060258();

}

void sub_100030BC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 248), 8);
  _Unwind_Resume(a1);
}

void sub_100030C08(uint64_t a1, char *a2)
{
  FILE *v3;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = *(FILE **)(a1 + 32);
  if (v3)
  {
    fputs(a2, v3);
    fputc(10, *(FILE **)(a1 + 32));
  }
  else
  {
    v5 = sub_100026C34();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_100060350();

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("OSLOGCREATE Error: %s"), a2);

  }
}

uint64_t sub_100030CBC(uint64_t a1, uint64_t a2, const char *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v30;
  int *v31;
  const __CFString *v32;
  int *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  int v41;
  int v42;
  int v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  NSString *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  NSString *v52;
  int *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  _QWORD block[5];
  id v58;
  id v59;
  id v60;
  int v61;
  stat v62;
  _BYTE v63[1024];

  v6 = objc_autoreleasePoolPush();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/"), "stringByAppendingString:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", v8));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v10 = sub_100026C34();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000604BC(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v19, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("logarchive block timedout."));

    LODWORD(v20) = 60;
    goto LABEL_16;
  }
  memset(&v62, 0, sizeof(v62));
  bzero(v63, 0x400uLL);
  if (fstat(a2, &v62))
  {
    v20 = *__error();
    if (fcntl(a2, 50, v63) == -1)
      sub_100060418();
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("unable to stat temp fd: %s: %s (%d)"), v63, strerror(v20), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = *(_QWORD *)(a1 + 56);
    goto LABEL_15;
  }
  if (sub_100053984((uint64_t)&v62))
  {
    LODWORD(v20) = *__error();
    if (fcntl(a2, 50, v63) == -1)
      sub_100060418();
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to construct archive block for suspicious file: %s"), v63));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000603B0();
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v25, "stderrWrite:", CFSTR("%@"), v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v26, "log:", CFSTR("%@"), v24);

    v23 = *(_QWORD *)(a1 + 56);
    v22 = (void *)v24;
    goto LABEL_15;
  }
  if (!strcmp(a3, "."))
  {
    if (fcopyfile(a2, *(_DWORD *)(a1 + 72), 0, 4u))
    {
      v30 = *(_QWORD *)(a1 + 56);
      v33 = __error();
      v54 = strerror(*v33);
      v55 = (char *)*__error();
      v32 = CFSTR("failed to copyfile on root node: %s (%d)");
      goto LABEL_26;
    }
    if (*(_QWORD *)(a1 + 76) && fchown(*(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1)
      sub_100060418();
    goto LABEL_51;
  }
  if ((v62.st_mode & 0xF000) == 0x4000)
  {
    if (mkdirat(*(_DWORD *)(a1 + 72), a3, 0x1FFu))
    {
      v30 = *(_QWORD *)(a1 + 56);
      v31 = __error();
      v55 = strerror(*v31);
      v56 = *__error();
      v54 = (char *)a3;
      v32 = CFSTR("failed to mkdir: %s: %s (%d)");
LABEL_26:
      v20 = (uint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v32, v54, v55, v56)));
      (*(void (**)(uint64_t, id))(v30 + 16))(v30, objc_msgSend((id)v20, "UTF8String"));

      LODWORD(v20) = *__error();
      goto LABEL_16;
    }
    v42 = sub_100053AC0(*(_DWORD *)(a1 + 72), a3, 0);
    if (v42 == -1)
    {
      v30 = *(_QWORD *)(a1 + 56);
      v53 = __error();
      v55 = strerror(*v53);
      v56 = *__error();
      v54 = (char *)a3;
      v32 = CFSTR("failed to open: %s: %s (%d)");
      goto LABEL_26;
    }
    v43 = v42;
    if (fcopyfile(a2, v42, 0, 4u))
    {
      v44 = __error();
      v45 = *v44;
      v46 = *(_QWORD *)(a1 + 56);
      v47 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to copyfile: %s: %s (%d)"), a3, strerror(*v44), v45);
      v20 = (uint64_t)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v47));
      (*(void (**)(uint64_t, id))(v46 + 16))(v46, objc_msgSend((id)v20, "UTF8String"));

      close(v43);
      v28 = 1;
      LODWORD(v20) = v45;
      goto LABEL_17;
    }
    if (*(_QWORD *)(a1 + 76) && fchown(v43, *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 80)) == -1)
      sub_100060418();
    close(v43);
LABEL_51:
    LODWORD(v20) = 0;
    goto LABEL_16;
  }
  if (!strcmp(a3, "Info.plist"))
    objc_msgSend(*(id *)(a1 + 40), "extractMetricsFromInfoPlist:", a2);
  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "archive"));
  if (v34
    && (v35 = (void *)v34,
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "archive")),
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "tarQueue")),
        v37,
        v36,
        v35,
        v37))
  {
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "archive"));
    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v20, "tarQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000313F8;
    block[3] = &unk_100099B20;
    v39 = *(void **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 40);
    v58 = v39;
    v59 = v8;
    v60 = v9;
    v61 = a2;
    dispatch_sync(v38, block);

  }
  else
  {
    v40 = objc_retainAutorelease(v9);
    v41 = sub_100053A44((const char *)objc_msgSend(v40, "fileSystemRepresentation"), 2, 0x1B6u);
    if (v41 == -1)
    {
      LODWORD(v20) = *__error();
      v48 = *(_QWORD *)(a1 + 56);
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to open %@"), v40)));
      (*(void (**)(uint64_t, id))(v48 + 16))(v48, objc_msgSend(v49, "UTF8String"));

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100060430((uint64_t)v40, v20);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v50, "stderrWrite:", CFSTR("Unable to create file %@: %s"), v40, strerror(v20));

      v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v51, "log:", CFSTR("Unable to create file %@: %s"), v40, strerror(v20));

      goto LABEL_16;
    }
    LODWORD(v20) = v41;
    if (fcopyfile(a2, v41, 0, 0xEu) < 0)
    {
      LODWORD(v20) = *__error();
      v23 = *(_QWORD *)(a1 + 56);
      v52 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error writing file %@ - %s"), v40, strerror(v20));
      v22 = (void *)objc_claimAutoreleasedReturnValue(v52);
LABEL_15:
      v27 = objc_retainAutorelease(v22);
      (*(void (**)(uint64_t, id))(v23 + 16))(v23, objc_msgSend(v27, "UTF8String"));

LABEL_16:
      v28 = 1;
      goto LABEL_17;
    }
    close(v20);
  }
  v28 = 0;
LABEL_17:

  objc_autoreleasePoolPop(v6);
  if (v28)
    return v20;
  else
    return 0;
}

void sub_1000313F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  SDArchiveFile *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "destination"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 40)));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 48)));
  v5 = -[SDArchiveFile initWithPath:target:ofType:]([SDArchiveFile alloc], "initWithPath:target:ofType:", *(_QWORD *)(a1 + 56), v4, NSFileTypeRegular);
  -[SDArchiveFile setFd:](v5, "setFd:", *(unsigned int *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "archive"));
  objc_msgSend(v6, "addArchiveFile:", v5);

}

uint64_t sub_1000314C4(_QWORD *a1)
{
  uint64_t result;

  result = OSLogConstructArchive(a1[5], a1[6], a1[7]);
  *(_DWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

uint64_t sub_1000314F8(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_1000317B0(int *a1)
{
  return _os_assumes_log(*a1);
}

void sub_1000317B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t sub_1000317C4(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  int v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  dispatch_queue_global_t global_queue;
  NSObject *v39;
  _BYTE buf[24];
  void *v42;
  id v43;
  int v44;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = sub_10002383C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = a1;
    *(_WORD *)&buf[8] = 2112;
    *(_QWORD *)&buf[10] = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received keycode: %x with name: %@", buf, 0x12u);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v5 = sub_10002383C(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "stdoutWrite:", CFSTR("Received keycode: %x with name: %@"), a1, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = sub_10002383C(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "log:", CFSTR("Received keycode: %x with name: %@"), a1, v9);

  kdebug_trace(27525122, 0, 0, 0, 0);
  if ((int)a1 > 5)
  {
    if ((_DWORD)a1 == 6 || (_DWORD)a1 == 36)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v22 = sub_10002383C(-2147483641);
        v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Legacy keychord support has been dropped. Use %@.", buf, 0xCu);

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v25 = sub_10002383C(-2147483641);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(v24, "stdoutWrite:", CFSTR("Legacy keychord support has been dropped. Use %@."), v26);

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v28 = sub_10002383C(-2147483641);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
      objc_msgSend(v27, "log:", CFSTR("Legacy keychord support has been dropped. Use %@."), v29);

      return 4;
    }
  }
  else
  {
    if ((_DWORD)a1 == -2147483641)
    {
      v30 = -2147483641;
      return sub_100031DD8(v30);
    }
    if ((_DWORD)a1 == 3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v10 = sub_10002383C(3);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "sysdiagnose (stackshot only)";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "request: %s keychord: %@", buf, 0x16u);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v13 = sub_10002383C(3);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(v12, "stdoutWrite:", CFSTR("request: %s keychord: %@"), "sysdiagnose (stackshot only)", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v16 = sub_10002383C(3);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(v15, "log:", CFSTR("request: %s keychord: %@"), "sysdiagnose (stackshot only)", v17);

      if (sub_100029534())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord ignored due to settings.", buf, 2u);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v18, "stdoutWrite:", CFSTR("Keychord ignored due to settings."));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v20 = v19;
        v21 = CFSTR("Keychord ignored due to settings.");
      }
      else
      {
        if (!sub_100029688())
        {
          v37 = (void *)os_transaction_create("sysdiagnose (stackshot only)");
          global_queue = dispatch_get_global_queue(25, 0);
          v39 = objc_claimAutoreleasedReturnValue(global_queue);
          *(_QWORD *)buf = _NSConcreteStackBlock;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = sub_100036148;
          v42 = &unk_100099C00;
          v43 = v37;
          v44 = 3;
          v20 = v37;
          dispatch_async(v39, buf);

          v34 = 0;
          goto LABEL_33;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE", buf, 2u);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v20 = v19;
        v21 = CFSTR("Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE");
      }
      objc_msgSend(v19, "log:", v21);
      v34 = 5;
LABEL_33:

      return v34;
    }
  }
  v31 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((a1 & 0x80000000) != 0)
  {
    if (v31)
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "default case hit for keycode: %x. Running full diagnostic", buf, 8u);
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v35, "stdoutWrite:", CFSTR("default case hit for keycode: %x. Running full diagnostic"), a1);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v36, "log:", CFSTR("default case hit for keycode: %x. Running full diagnostic"), a1);

    v30 = a1;
    return sub_100031DD8(v30);
  }
  if (v31)
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected keycode: %x. Not running full diagnostic", buf, 8u);
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v32, "stdoutWrite:", CFSTR("unexpected keycode: %x. Not running full diagnostic"), a1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v33, "log:", CFSTR("unexpected keycode: %x. Not running full diagnostic"), a1);

  return 4;
}

uint64_t sub_100031DD8(int a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  SystemDiagnosticiOS *v11;
  uint64_t v12;
  uint64_t v13;
  dispatch_semaphore_t v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  void *v28;
  dispatch_queue_global_t global_queue;
  NSObject *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  _QWORD block[4];
  void *v41;
  SystemDiagnosticiOS *v42;
  uint8_t v43[16];
  uint8_t v44[8];
  uint8_t *v45;
  uint64_t v46;
  char v47;
  _BYTE buf[24];
  void *v49;
  NSObject *v50;
  uint8_t *v51;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = sub_10002383C(a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "sysdiagnose (full)";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "request: %s keychord: %@", buf, 0x16u);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v5 = sub_10002383C(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "stdoutWrite:", CFSTR("request: %s keychord: %@"), "sysdiagnose (full)", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = sub_10002383C(a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "log:", CFSTR("request: %s keychord: %@"), "sysdiagnose (full)", v9);

  if (sub_100029534())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord ignored due to settings.", buf, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "stdoutWrite:", CFSTR("Keychord ignored due to settings."));

    v11 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    -[SystemDiagnosticiOS log:](v11, "log:", CFSTR("Keychord ignored due to settings."));
LABEL_11:
    v12 = 5;
    goto LABEL_31;
  }
  if (sub_100029688())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE", buf, 2u);
    }
    v11 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    -[SystemDiagnosticiOS log:](v11, "log:", CFSTR("Sysdiagnose ignored due to factory settings: com.apple.sysdiagnose factoryDisable -BOOL is TRUE"));
    goto LABEL_11;
  }
  sub_100035E38();
  if (sub_100045E60())
  {
    if (objc_opt_class(TapToRadarService, v13))
    {
      *(_QWORD *)v44 = 0;
      v45 = v44;
      v46 = 0x2020000000;
      v47 = 0;
      v14 = dispatch_semaphore_create(0);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_100035FE0;
      v49 = &unk_100099BD8;
      v51 = v44;
      v16 = v14;
      v50 = v16;
      objc_msgSend(v15, "performSysdiagnoseKeychordEventWithCompletionHandler:", buf);

      v17 = dispatch_time(0, 3500000000);
      if (dispatch_semaphore_wait(v16, v17))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord", v43, 2u);
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v18, "stdoutWrite:", CFSTR("Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v19, "log:", CFSTR("Timed out waiting for Tap-to-Radar. Assuming we should handle this keychord"));

      }
      v20 = v45[24] == 0;

      _Block_object_dispose(v44, 8);
      if (!v20)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Keychord is being handled by ttr. Terminating and waiting to be invoked through DE", buf, 2u);
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v21, "stdoutWrite:", CFSTR("Keychord is being handled by ttr. Terminating and waiting to be invoked through DE"));

        v11 = (SystemDiagnosticiOS *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        -[SystemDiagnosticiOS log:](v11, "log:", CFSTR("Keychord is being handled by ttr. Terminating and waiting to be invoked through DE"));
        v12 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "TapToRadarKit framework is not available", v44, 2u);
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v22, "stdoutWrite:", CFSTR("TapToRadarKit framework is not available"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v23, "log:", CFSTR("TapToRadarKit framework is not available"));

    }
  }
  v11 = objc_alloc_init(SystemDiagnosticiOS);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v11, "diagnosticID"));
  v26 = objc_msgSend(v24, "checkAndIncreaseDiagnosticCountForDiagnosticID:collectingLocalLogs:", v25, 1);

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v27, "setCurrentClient:", CFSTR("KEYCHORD"));

    v28 = (void *)os_transaction_create("sysdiagnose (full)");
    global_queue = dispatch_get_global_queue(25, 0);
    v30 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100035ED0;
    block[3] = &unk_100099260;
    v41 = v28;
    v42 = v11;
    v31 = v28;
    dispatch_async(v30, block);

    v12 = 0;
    v32 = v41;
  }
  else
  {
    sub_100027B60(1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v33 = sub_10002383C(a1);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose already in progress - ignoring keychord %@", buf, 0xCu);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v36 = sub_10002383C(a1);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    objc_msgSend(v35, "stdoutWrite:", CFSTR("sysdiagnose already in progress - ignoring keychord %@"), v37);

    v31 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v38 = sub_10002383C(a1);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v38);
    objc_msgSend(v31, "log:", CFSTR("sysdiagnose already in progress - ignoring keychord %@"), v32);
    v12 = 5;
  }

LABEL_31:
  return v12;
}

void sub_100032478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100032498(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 | a3[1] | a3[2] | a3[3])
    return 5;
  else
    return sub_1000317C4(a2);
}

uint64_t sub_1000324C0()
{
  return 46;
}

uint64_t sub_1000324C8()
{
  kern_return_t v0;
  dispatch_queue_attr_t v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  integer_t port_info[20];

  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port))
    sub_10006056C(&v9, port_info);
  if (bootstrap_check_in(bootstrap_port, "com.apple.sysdiagnose.kernel.ipc", (mach_port_t *)&dword_1000B9878))
    sub_1000604F0(&v9, port_info);
  port_info[0] = 16;
  v0 = mach_port_set_attributes(mach_task_self_, dword_1000B9878, 1, port_info, 1u);
  if (v0)
    _os_assumes_log(v0);
  v1 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = dispatch_queue_create("Sysdiagnose MIG RECV Queue", v2);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, dword_1000B9878, 0, v3);
  v5 = (void *)qword_1000B9870;
  qword_1000B9870 = (uint64_t)v4;

  dispatch_source_set_cancel_handler((dispatch_source_t)qword_1000B9870, &stru_100099B90);
  dispatch_source_set_event_handler((dispatch_source_t)qword_1000B9870, &stru_100099BB0);
  dispatch_resume((dispatch_object_t)qword_1000B9870);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MIG server initialized.", (uint8_t *)&v9, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v6, "stdoutWrite:", CFSTR("MIG server initialized."));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "log:", CFSTR("MIG server initialized."));

  return 0;
}

void sub_1000326C4(id a1)
{
  kern_return_t v1;

  v1 = mach_port_mod_refs(mach_task_self_, dword_1000B9878, 1u, -1);
  if (v1)
    _os_assumes_log(v1);
}

void sub_100032704(id a1)
{
  int v1;

  v1 = dispatch_mig_server(qword_1000B9870, 36, sub_10005E160);
  if (v1)
    _os_assumes_log(v1);
}

id sub_10003273C(void *a1, _QWORD *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  id v19;
  int v21;
  id v22;

  v3 = a1;
  v4 = dispatch_group_create();
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("remote:")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote archive request for %@", (uint8_t *)&v21, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive already exists", (uint8_t *)&v21, 2u);
    }
    goto LABEL_12;
  }
  if (!v4)
  {
LABEL_15:
    v19 = 0;
    *a2 = 4;
    goto LABEL_16;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executionGroupDictionary"));
  objc_msgSend(v12, "setObject:forKey:", v4, v6);

  dispatch_group_enter(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  objc_msgSend(v13, "sendRemoteArchiveMessage:", v6);

  v14 = dispatch_time(0, 1801000000000);
  if (dispatch_group_wait(v4, v14) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138412290;
    v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for file transfer from watch for %@", (uint8_t *)&v21, 0xCu);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v16 = objc_msgSend(v15, "fileExistsAtPath:", v8);

  if ((v16 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Archive not received", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_15;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionGroupDictionary"));
  objc_msgSend(v18, "removeObjectForKey:", v6);

LABEL_12:
  *a2 = 0;
  v19 = v8;
LABEL_16:

  return v19;
}

void sub_100032A5C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  intptr_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  _BOOL4 v25;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "executionGroupDictionary"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v1));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v1;
      v24 = 1024;
      v25 = v4 != 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Looking for dispatch_group for diagnostic id %@. Found ? %d", buf, 0x12u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "log:", CFSTR("Looking for dispatch_group for diagnostic id %@. Found ? %d"), v1, v4 != 0);

    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for the execution group.", buf, 2u);
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "stdoutWrite:", CFSTR("Waiting for the execution group."));

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v7, "log:", CFSTR("Waiting for the execution group."));

      v8 = dispatch_time(0, 1801000000000);
      v9 = dispatch_group_wait(v4, v8);
      v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v10)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executionGroupDictionary"));
          *(_DWORD *)buf = 138412290;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for execution group. Available: %@", buf, 0xCu);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "executionGroupDictionary"));
        objc_msgSend(v13, "stdoutWrite:", CFSTR("Timed out waiting for execution group. Available: %@"), v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionGroupDictionary"));
        objc_msgSend(v16, "log:", CFSTR("Timed out waiting for execution group. Available: %@"), v18);

      }
      else
      {
        if (v10)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Execution group has returned successfully", buf, 2u);
        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v19, "stdoutWrite:", CFSTR("Execution group has returned successfully"));

        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v16, "log:", CFSTR("Execution group has returned successfully"));
      }

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "diagnosticObjectForDiagnosticID:", v1));

    objc_msgSend(v21, "waitUntilComplete:", 2400);
  }

}

uint64_t sub_100032DF4(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  int v8;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v5 = objc_msgSend(v4, "isAutomaticCoSysdiagnosePossible");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v7 = objc_msgSend(v6, "getCollectAllTrustedForDiagnosticID:", v3);

  if (a2)
    v8 = 1;
  else
    v8 = v5;
  return v8 | v7;
}

void sub_100032E7C(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v5 = a1;
  v6 = a2;
  v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Remote XPC Stackshot: stackshot only", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = CFSTR("Remote XPC Stackshot: stackshot only");
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC: stackshot only", v12, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = CFSTR("XPC: stackshot only");
  }
  objc_msgSend(v8, "stdoutWrite:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", v10);

  sub_100024B40(40);
  xpc_dictionary_set_uint64(v6, "RESPONSE_TYPE", 1uLL);

}

id sub_100032FC0(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unsigned __int16 uint64;
  const __CFString *v9;
  void *v10;
  char *v11;
  void *v12;
  _xpc_connection_s *v13;
  id v14;
  id v15;
  unsigned __int16 v16;
  uint64_t pid;
  unsigned int v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  _xpc_connection_s *v24;
  id v25;
  void *v26;
  unsigned __int8 v27;
  uint64_t v28;
  int v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  _BOOL4 v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  unsigned int v47;
  const char *v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSSet *v61;
  void *v62;
  const void *data;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  unsigned __int8 v75;
  _BOOL4 v76;
  id v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  dispatch_time_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSSet *v95;
  uint64_t v96;
  const void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  _BOOL4 v127;
  id v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  NSString *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  void *v137;
  unsigned int v138;
  const __CFString *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  id v154;
  void *v155;
  void *v156;
  _BOOL4 v157;
  id *v158;
  id v159;
  void *v160;
  id v161;
  id v162;
  id v163;
  unint64_t v164;
  void *v165;
  const __CFString *v166;
  id v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSSet *v172;
  void *v173;
  const void *v174;
  uint64_t v175;
  void *v176;
  void *v177;
  id v178;
  void *v179;
  uint64_t v180;
  uint64_t v181;
  id v182;
  void *v183;
  NSMutableDictionary *v184;
  id v185;
  id v186;
  id v187;
  uint64_t v188;
  void *k;
  uint64_t v190;
  void *v191;
  id v192;
  void *v193;
  id v194;
  id v195;
  void *v196;
  unsigned int v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  _BOOL4 v208;
  void *v209;
  id v210;
  id v211;
  uint64_t v212;
  void *i;
  void *v214;
  void *v215;
  const char *v216;
  double v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  xpc_object_t v230;
  id v231;
  id v232;
  id v233;
  uint64_t v234;
  void *j;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  id v245;
  id v246;
  id v247;
  void *v248;
  uint64_t v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  id v255;
  id v256;
  void *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  const __CFString *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  id v269;
  id v270;
  id v271;
  id v272;
  char v273;
  void *v274;
  void *v275;
  uint64_t v276;
  void *v277;
  unsigned __int8 v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  id v293;
  void *v294;
  id v295;
  id v296;
  id v297;
  id v298;
  id v299;
  id v300;
  id v301;
  id v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  id v309;
  id v310;
  id v311;
  id v312;
  id v313;
  id v314;
  id v315;
  id obj;
  id obja;
  id objb;
  _xpc_connection_s *v319;
  NSObject *v320;
  id v321;
  uint64_t v322;
  void *xdict;
  id xdicta;
  void *xdictb;
  void *xdictc;
  id v327;
  id v328;
  uint8_t buf[32];
  __int128 v330;
  __int128 v331;
  _OWORD v332[4];
  uint64_t v333;
  _BYTE v334[12];
  __int16 v335;
  void *v336;
  uint8_t v337[32];
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  uint8_t v344[16];
  __int128 v345;
  __int128 v346;
  __int128 v347;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (xpc_get_type(v6) != (xpc_type_t)&_xpc_type_dictionary)
    sub_100060740(v337, buf);
  uint64 = xpc_dictionary_get_uint64(v6, "REQUEST_TYPE");
  v9 = sub_10002397C(uint64);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received request of type '%@'", buf, 0xCu);
  }
  if (!v5)
  {
    v11 = xpc_copy_description(v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received Remote request: %s", buf, 0xCu);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "log:", CFSTR("Received Remote request: %s"), v11);

    free(v11);
  }
  xpc_dictionary_set_uint64(v7, "REQUEST_TYPE", uint64);
  xpc_dictionary_set_uint64(v7, "MSG_TYPE", 2uLL);
  switch(uint64)
  {
    case 1u:
      v13 = (_xpc_connection_s *)v5;
      v296 = v6;
      v14 = v6;
      v15 = v7;
      v300 = v5;
      xdict = v14;
      v319 = v13;
      if (!v5)
      {
        v144 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v144, "setPossibleClient:", CFSTR("REMOTE"));

        v16 = 5;
        goto LABEL_139;
      }
      if (xpc_dictionary_get_BOOL(v14, "SDRequestSourceShell"))
        v16 = 2;
      else
        v16 = 3;
      pid = xpc_connection_get_pid(v13);
      v333 = 0;
      memset(v332, 0, sizeof(v332));
      v330 = 0u;
      v331 = 0u;
      memset(buf, 0, sizeof(buf));
      v18 = proc_pidinfo(pid, 3, 0, buf, 136);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v332));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v20, "setPossibleClient:", v19);

      v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v18 > 0x87)
      {
        if (v21)
        {
          *(_DWORD *)v337 = 136446466;
          *(_QWORD *)&v337[4] = v332;
          *(_WORD *)&v337[12] = 1024;
          *(_DWORD *)&v337[14] = pid;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose request from %{public}s (%d)", v337, 0x12u);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v22, "log:", CFSTR("Sysdiagnose request from %{public}s (%d)"), v332, pid);
      }
      else
      {
        if (v21)
        {
          *(_DWORD *)v337 = 67109120;
          *(_DWORD *)&v337[4] = pid;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to obtain requestor process name. Pid is %d", v337, 8u);
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v22, "log:", CFSTR("Failed to obtain requestor process name. Pid is %d"), pid, v292);
      }

      v152 = xdict;
      xpc_dictionary_set_int64(xdict, "clientPID", (int)pid);
      if ((sub_100024210(pid) & 1) != 0
        || (sub_100045BC0(v319, CFSTR("com.apple.private.sysdiagnose.internal")) & 1) != 0)
      {
        goto LABEL_139;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v337 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Peer is not allowed", v337, 2u);
      }
      v153 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v153, "log:", CFSTR("Peer is not allowed"));

      xpc_dictionary_set_string(xdict, "warnProcAllowlist", (const char *)v332);
      if (sub_100045E60())
      {
LABEL_139:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v154 = objc_msgSend(CFSTR("XPC: sysdiagnose (full)"), "UTF8String");
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v154;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
        }
        v155 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v155, "stdoutWrite:", CFSTR("%s"), objc_msgSend(CFSTR("XPC: sysdiagnose (full)"), "UTF8String"));

        v156 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v156, "log:", CFSTR("%s"), objc_msgSend(CFSTR("XPC: sysdiagnose (full)"), "UTF8String"));

        v157 = xpc_dictionary_get_BOOL(xdict, "getMetrics");
        *(_QWORD *)v344 = 0;
        *(_QWORD *)&v340 = 0;
        if (v157)
        {
          *(_QWORD *)v334 = 0;
          v158 = (id *)v334;
          v159 = sub_100036338(v16, xdict, (id *)&v340, v344, v334);
          v160 = (void *)objc_claimAutoreleasedReturnValue(v159);
          v161 = (id)v340;
        }
        else
        {
          v158 = (id *)&v340;
          v162 = sub_100036338(v16, xdict, 0, v344, &v340);
          v160 = (void *)objc_claimAutoreleasedReturnValue(v162);
          v161 = 0;
        }
        v163 = *v158;
        v164 = *(_QWORD *)v344;
        if (*(_QWORD *)v344 <= 0xEuLL)
        {
          if (((1 << v344[0]) & 0x7252) != 0)
          {
            v165 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v165, "decreaseDiagnosticCountForDiagnosticID:", v163);

          }
          else if (!*(_QWORD *)v344)
          {
            v168 = objc_retainAutorelease(v160);
            xpc_dictionary_set_string(v15, "path", (const char *)objc_msgSend(v168, "cStringUsingEncoding:", 4));
            if (v161)
              v208 = v157;
            else
              v208 = 0;
            if (v208)
            {
              v306 = v10;
              v312 = v7;
              v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "allKeys"));
              memset(v337, 0, sizeof(v337));
              v338 = 0u;
              v339 = 0u;
              v210 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
              if (v210)
              {
                v211 = v210;
                v212 = **(_QWORD **)&v337[16];
                do
                {
                  for (i = 0; i != v211; i = (char *)i + 1)
                  {
                    if (**(_QWORD **)&v337[16] != v212)
                      objc_enumerationMutation(v209);
                    v214 = *(void **)(*(_QWORD *)&v337[8] + 8 * (_QWORD)i);
                    v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "objectForKey:", v214));
                    v216 = (const char *)objc_msgSend(objc_retainAutorelease(v214), "UTF8String");
                    objc_msgSend(v215, "doubleValue");
                    xpc_dictionary_set_double(v15, v216, v217);

                  }
                  v211 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
                }
                while (v211);
              }

              v10 = v306;
              v7 = v312;
            }
            xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 1uLL);

            goto LABEL_148;
          }
        }
        xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 2uLL);
        v166 = sub_100022C74(v164);
        v167 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v166));
        xpc_dictionary_set_string(v15, "error", (const char *)objc_msgSend(v167, "UTF8String"));

        v168 = 0;
LABEL_148:
        v152 = xdict;
        goto LABEL_149;
      }
      v262 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v262, "decreaseDiagnosticCount");

      xpc_dictionary_set_uint64(v15, "RESPONSE_TYPE", 2uLL);
      v263 = sub_100022C74(0xFuLL);
      v163 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v263));
      xpc_dictionary_set_string(v15, "error", (const char *)objc_msgSend(v163, "UTF8String"));
      v168 = 0;
LABEL_149:

      v6 = v296;
      v5 = v300;
      goto LABEL_256;
    case 2u:
      sub_100032E7C(v6, v7, v5 == 0);
      goto LABEL_255;
    case 4u:
      v303 = v10;
      v24 = (_xpc_connection_s *)v5;
      v309 = v7;
      v25 = v7;
      if (v5)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v27 = objc_msgSend(v26, "areDiagnosticsInFlight");

        if ((v27 & 1) != 0)
        {
          v28 = xpc_connection_get_pid(v24);
          v29 = v28;
          v30 = sub_100024648(v28);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v29;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received programmatic cancel request from peer with pid %d.", buf, 8u);
          }
          if ((v30 & 1) != 0)
          {
            if (sub_100045E60())
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "getCurrentInflightLocalDiagnostic"));

              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v32;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Peer is TTR - using in-flight diagnostic with ID %@", buf, 0xCu);
              }
LABEL_180:
              if (v32)
              {
                v201 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v201, "registerActivityWithID:", v32);

                v202 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v202, "cancelAll:", v32);

                +[SDTaskDepot signalStopTasks](SDTaskDepot, "signalStopTasks");
                v203 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v203, "closeSysdiagnoseLog");

                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Waiting for sysdiagnose to cleanup", buf, 2u);
                }
                v204 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v204, "stdoutWrite:", CFSTR("Waiting for sysdiagnose to cleanup"));

                v205 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v205, "log:", CFSTR("Waiting for sysdiagnose to cleanup"));

                v206 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                v207 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v206, "diagnosticObjectForDiagnosticID:", v32));

                if (objc_msgSend(v207, "waitUntilComplete:", 60))
                {
                  xpc_dictionary_set_uint64(v25, "RESPONSE_TYPE", 1uLL);
                }
                else
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose took too long to cancel.", buf, 2u);
                  }
                  v237 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v237, "stdoutWrite:", CFSTR("Sysdiagnose took too long to cancel."));

                  v238 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v238, "log:", CFSTR("Sysdiagnose took too long to cancel."));

                  sub_100035A28(v25, 8uLL);
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Goodbye!", buf, 2u);
                }
                v239 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v239, "stdoutWrite:", CFSTR("Goodbye!"));

                v240 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v240, "log:", CFSTR("Goodbye!"));

              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No diagnostic is associated with client - abort cancellation.", buf, 2u);
                }
                sub_100035A28(v25, 0xAuLL);
              }

LABEL_224:
              v168 = 0;
              v10 = v303;
              v7 = v309;
              goto LABEL_256;
            }
          }
          else
          {
            v196 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
            v197 = objc_msgSend(v196, "isPaired");

            if (v197)
            {
              v198 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
              objc_msgSend(v198, "sendMessage:", 2);

            }
          }
          v199 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v29));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "getDiagnosticIDForPid:", v200));

          goto LABEL_180;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received programmatic cancel request when no sysdiagnose in flight.", buf, 2u);
        }
        v146 = v25;
        v147 = 7;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancel operation not implemented", buf, 2u);
        }
        v145 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v145, "log:", CFSTR("Cancel operation not implemented"));

        v146 = v25;
        v147 = 9;
      }
      sub_100035A28(v146, v147);
      goto LABEL_224;
    case 5u:
      v33 = v10;
      v34 = v7;
      v35 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (!v5)
      {
        if (v35)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "CancelAll operation not implemented", buf, 2u);
        }
        v148 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v148, "log:", CFSTR("CancelAll operation not implemented"));

        v42 = v34;
        v43 = 9;
        goto LABEL_113;
      }
      if (v35)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received cancelAll request.", buf, 2u);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
      v37 = objc_msgSend(v36, "isPaired");

      if (v37)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
        objc_msgSend(v38, "sendMessage:", 2);

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v39, "clearAllResources");

      +[SDTaskDepot signalStopTasks](SDTaskDepot, "signalStopTasks");
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v41 = objc_msgSend(v40, "numberDiagnosticsInflight");

      if (v41)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There are still sysdiagnoses in-flight after cancellation.", buf, 2u);
        }
        v42 = v34;
        v43 = 3;
LABEL_113:
        sub_100035A28(v42, v43);
        goto LABEL_171;
      }
      xpc_dictionary_set_uint64(v34, "RESPONSE_TYPE", 1uLL);
LABEL_171:

      v168 = 0;
      v10 = v33;
      goto LABEL_256;
    case 6u:
      v44 = v7;
      v45 = v44;
      if (v5)
      {
        xpc_dictionary_set_uint64(v44, "RESPONSE_TYPE", 1uLL);
        +[SDTaskDepot signalInterrupt](SDTaskDepot, "signalInterrupt");
        goto LABEL_120;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "UserInterrupt operation not implemented", buf, 2u);
      }
      v149 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v149, "log:", CFSTR("UserInterrupt operation not implemented"));

      goto LABEL_119;
    case 7u:
      v45 = v7;
      if (v5)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v47 = objc_msgSend(v46, "areDiagnosticsInFlight");

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v47;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Polling sysdiagnose status: %d", buf, 8u);
        }
        xpc_dictionary_set_uint64(v45, "RESPONSE_TYPE", 1uLL);
        if (v47)
          v48 = "Running";
        else
          v48 = "Idle";
        xpc_dictionary_set_string(v45, "status", v48);
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Status Poll not implemented", buf, 2u);
        }
LABEL_119:
        sub_100035A28(v45, 9uLL);
      }
LABEL_120:

      goto LABEL_255;
    case 8u:
      v49 = v6;
      v50 = v7;
      if (objc_opt_class(SBSRemoteAlertDefinition, v51))
      {
        xdicta = v50;
        v297 = v6;
        v301 = v5;
        v53 = objc_opt_class(NSMutableArray, v52);
        v55 = objc_opt_class(NSArray, v54);
        v57 = objc_opt_class(NSString, v56);
        v59 = objc_opt_class(NSNull, v58);
        v61 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v53, v55, v57, v59, objc_opt_class(NSNumber, v60), 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        *(_QWORD *)v337 = 0;
        data = xpc_dictionary_get_data(v49, "detail", (size_t *)v337);
        if (data)
        {
          v64 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, *(_QWORD *)v337));
          if (v64)
          {
            v65 = (void *)v64;
            *(_QWORD *)v344 = 0;
            v66 = (id)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v62, v64, v344));
            v67 = *(id *)v344;
            v68 = v67;
            if (v66)
            {

              v70 = objc_opt_class(NSArray, v69);
              if ((objc_opt_isKindOfClass(v66, v70) & 1) != 0)
              {
                v66 = v66;
                v50 = xdicta;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "detail";
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v66;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
                }
                v71 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v71, "log:", CFSTR("Setting %s to %@"), "detail", v66);

                v72 = v66;
                goto LABEL_230;
              }
LABEL_229:
              v72 = 0;
              v50 = xdicta;
LABEL_230:

              v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
              memset(v337, 0, sizeof(v337));
              v338 = 0u;
              v339 = 0u;
              v245 = v72;
              v246 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
              if (v246)
              {
                v247 = v246;
                v321 = v49;
                v308 = v10;
                v314 = v7;
                v248 = 0;
                v249 = **(_QWORD **)&v337[16];
                do
                {
                  v250 = 0;
                  v251 = v248;
                  do
                  {
                    if (**(_QWORD **)&v337[16] != v249)
                      objc_enumerationMutation(v245);
                    v252 = *(void **)(*(_QWORD *)&v337[8] + 8 * (_QWORD)v250);
                    v253 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
                    v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v252, "lastPathComponent"));
                    v248 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v253, "stringByAppendingPathComponent:", v254));

                    objc_msgSend(v244, "addObject:", v248);
                    v250 = (char *)v250 + 1;
                    v251 = v248;
                  }
                  while (v247 != v250);
                  v247 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
                }
                while (v247);

                v10 = v308;
                v7 = v314;
                v49 = v321;
                v50 = xdicta;
              }

              v255 = objc_msgSend(objc_alloc((Class)SBSRemoteAlertDefinition), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SysViewService"), CFSTR("ShareSheetViewControllerProxy"));
              v256 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
              *(_QWORD *)v334 = CFSTR("Path");
              *(_QWORD *)&v340 = v244;
              v257 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v340, v334, 1));
              objc_msgSend(v256, "setUserInfo:", v257);

              v258 = +[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v255, v256);
              objc_msgSend(v258, "activateWithContext:", 0);
              xpc_dictionary_set_uint64(v50, "RESPONSE_TYPE", 1uLL);

              v6 = v297;
              v5 = v301;
              goto LABEL_239;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v241 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedDescription"));
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "detail";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v241;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);

            }
            v242 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedDescription"));
            objc_msgSend(v242, "log:", CFSTR("Error fetching key '%s': %@"), "detail", v243);

          }
        }
        v66 = 0;
        goto LABEL_229;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Airdrop not implemented", buf, 2u);
      }
      v150 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v150, "log:", CFSTR("Airdrop not implemented"));

      sub_100035A28(v50, 9uLL);
LABEL_239:

      goto LABEL_240;
    case 9u:
      v73 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "watch archivelist", buf, 2u);
      }
      v74 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
      v75 = objc_msgSend(v74, "isPaired");

      v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v75 & 1) != 0)
      {
        if (v76)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device is paired", buf, 2u);
        }
        v77 = sub_100023B9C();
        v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
        v79 = dispatch_group_create();
        if (v79)
        {
          v80 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "executionGroupDictionary"));
          objc_msgSend(v81, "setObject:forKey:", v79, v78);

          dispatch_group_enter(v79);
          v82 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          objc_msgSend(v82, "sendWatchListWithDiagnosticId:", v78);

          v83 = dispatch_time(0, 5000000000);
          if (dispatch_group_wait(v79, v83))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out waiting for the list of watch archives", buf, 2u);
            }
          }
          else
          {
            v320 = v79;
            v225 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
            v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "executionGroupDictionary"));
            v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "objectForKey:", v78));

            if (v227)
            {
              v228 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
              v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v228, "executionGroupDictionary"));
              objc_msgSend(v229, "removeObjectForKey:", v78);

              if (objc_msgSend(v227, "count"))
              {
                objb = v73;
                v307 = v10;
                v313 = v7;
                v230 = xpc_array_create(0, 0);
                memset(v337, 0, sizeof(v337));
                v338 = 0u;
                v339 = 0u;
                v231 = v227;
                v232 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
                if (v232)
                {
                  v233 = v232;
                  v234 = **(_QWORD **)&v337[16];
                  do
                  {
                    for (j = 0; j != v233; j = (char *)j + 1)
                    {
                      if (**(_QWORD **)&v337[16] != v234)
                        objc_enumerationMutation(v231);
                      v236 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("remote:"), "stringByAppendingString:", *(_QWORD *)(*(_QWORD *)&v337[8] + 8 * (_QWORD)j))));
                      xpc_array_set_string(v230, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v236, "UTF8String"));
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)v344 = 138412290;
                        *(_QWORD *)&v344[4] = v236;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Adding path %@", v344, 0xCu);
                      }

                    }
                    v233 = objc_msgSend(v231, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
                  }
                  while (v233);
                }

                v73 = objb;
                xpc_dictionary_set_value(objb, "archive_list", v230);
                xpc_dictionary_set_uint64(objb, "RESPONSE_TYPE", 1uLL);

                v10 = v307;
                v7 = v313;
                v79 = v320;
                goto LABEL_253;
              }
            }
            else
            {
              xpc_dictionary_set_uint64(v73, "RESPONSE_TYPE", 1uLL);
              v264 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
              v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "executionGroupDictionary"));
              objc_msgSend(v265, "removeObjectForKey:", v78);

            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No archives present on the watch", buf, 2u);
            }

            v79 = v320;
          }
          v266 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS sharedInstance](SystemDiagnosticIDS, "sharedInstance"));
          v267 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v266, "executionGroupDictionary"));
          objc_msgSend(v267, "removeObjectForKey:", v78);

        }
        xpc_dictionary_set_uint64(v73, "RESPONSE_TYPE", 2uLL);
LABEL_253:

        goto LABEL_254;
      }
      if (v76)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device not paired", buf, 2u);
      }
      xpc_dictionary_set_uint64(v73, "RESPONSE_TYPE", 2uLL);
LABEL_254:

      goto LABEL_255;
    case 0xAu:
      v49 = v6;
      v84 = v7;
      v86 = v84;
      if (!v5)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delete Archive not implemented", buf, 2u);
        }
        v151 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v151, "log:", CFSTR("Delete Archive not implemented"));

        sub_100035A28(v86, 9uLL);
LABEL_127:

LABEL_240:
LABEL_255:
        v168 = 0;
        goto LABEL_256;
      }
      v295 = v84;
      v304 = v10;
      v310 = v7;
      v87 = objc_opt_class(NSMutableArray, v85);
      v89 = objc_opt_class(NSArray, v88);
      v91 = objc_opt_class(NSString, v90);
      v93 = objc_opt_class(NSNull, v92);
      v95 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v87, v89, v91, v93, objc_opt_class(NSNumber, v94), 0);
      v96 = objc_claimAutoreleasedReturnValue(v95);
      *(_QWORD *)v337 = 0;
      v97 = xpc_dictionary_get_data(v49, "detail", (size_t *)v337);
      v294 = (void *)v96;
      if (v97
        && (v98 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v97, *(_QWORD *)v337))) != 0)
      {
        v99 = (void *)v98;
        v327 = 0;
        v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v96, v98, &v327));
        v101 = v327;
        v102 = v101;
        if (v100)
        {

          v104 = objc_opt_class(NSArray, v103);
          v10 = v304;
          if ((objc_opt_isKindOfClass(v100, v104) & 1) != 0)
          {
            v105 = v100;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "detail";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v105;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
            }
            v293 = v49;
            v298 = v6;
            v302 = v5;
            v106 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v106, "log:", CFSTR("Setting %s to %@"), "detail", v105);

            v107 = v105;
            xdictb = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v108 = objc_alloc_init((Class)NSMutableArray);
            *(_OWORD *)v344 = 0u;
            v345 = 0u;
            v346 = 0u;
            v347 = 0u;
            v109 = v107;
            v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", v344, buf, 16);
            obj = v109;
            if (v110)
            {
              v111 = v110;
              v112 = 0;
              v113 = *(_QWORD *)v345;
              do
              {
                v114 = 0;
                v115 = v112;
                do
                {
                  if (*(_QWORD *)v345 != v113)
                    objc_enumerationMutation(obj);
                  v116 = *(void **)(*(_QWORD *)&v344[8] + 8 * (_QWORD)v114);
                  v117 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
                  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "lastPathComponent"));
                  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "stringByAppendingPathComponent:", v118));

                  objc_msgSend(v108, "addObject:", v112);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v334 = 138412290;
                    *(_QWORD *)&v334[4] = v112;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "File to delete: %@", v334, 0xCu);
                  }
                  v119 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v119, "log:", CFSTR("File to delete: %@"), v112);

                  v114 = (char *)v114 + 1;
                  v115 = v112;
                }
                while (v111 != v114);
                v109 = obj;
                v111 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v344, buf, 16);
              }
              while (v111);
            }
            else
            {
              v112 = 0;
            }

            v342 = 0u;
            v343 = 0u;
            v340 = 0u;
            v341 = 0u;
            v269 = v108;
            v270 = objc_msgSend(v269, "countByEnumeratingWithState:objects:count:", &v340, v337, 16);
            if (v270)
            {
              v271 = v270;
              v272 = 0;
              v322 = *(_QWORD *)v341;
              v273 = 1;
              v315 = v269;
              do
              {
                v274 = 0;
                v275 = v272;
                do
                {
                  if (*(_QWORD *)v341 != v322)
                    objc_enumerationMutation(v315);
                  v276 = *(_QWORD *)(*((_QWORD *)&v340 + 1) + 8 * (_QWORD)v274);
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v334 = 138412290;
                    *(_QWORD *)&v334[4] = v276;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deleting element: %@", v334, 0xCu);
                  }
                  v277 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v277, "log:", CFSTR("Deleting element: %@"), v276);

                  v328 = v275;
                  v278 = objc_msgSend(xdictb, "removeItemAtPath:error:", v276, &v328);
                  v272 = v328;

                  if ((v278 & 1) == 0)
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      v279 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "localizedDescription"));
                      *(_DWORD *)v334 = 138412546;
                      *(_QWORD *)&v334[4] = v276;
                      v335 = 2112;
                      v336 = v279;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error deleting element at %@ for reason %@", v334, 0x16u);

                    }
                    v280 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                    v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v272, "localizedDescription"));
                    objc_msgSend(v280, "log:", CFSTR("Error deleting element at %@ for reason %@"), v276, v281);

                  }
                  v273 &= v278;
                  v274 = (char *)v274 + 1;
                  v275 = v272;
                }
                while (v271 != v274);
                v271 = objc_msgSend(v315, "countByEnumeratingWithState:objects:count:", &v340, v337, 16);
              }
              while (v271);

              v49 = v293;
              if ((v273 & 1) == 0)
              {
                v6 = v298;
                v5 = v302;
                v10 = v304;
                v7 = v310;
                v141 = v294;
                v86 = v295;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deletion failed", buf, 2u);
                }
                v142 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                objc_msgSend(v142, "log:", CFSTR("Deletion failed"));
                v143 = 2;
                goto LABEL_105;
              }
              v6 = v298;
              v5 = v302;
              v10 = v304;
              v7 = v310;
            }
            else
            {

              v6 = v298;
              v5 = v302;
              v10 = v304;
              v7 = v310;
              v49 = v293;
            }
LABEL_102:
            v141 = v294;
            v86 = v295;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Deletion succeeded", buf, 2u);
            }
            v142 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v142, "log:", CFSTR("Deletion succeeded"));
            v143 = 1;
LABEL_105:

            xpc_dictionary_set_uint64(v86, "RESPONSE_TYPE", v143);
            goto LABEL_127;
          }
LABEL_101:

          obj = 0;
          goto LABEL_102;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "localizedDescription"));
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "detail";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v259;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);

        }
        v260 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "localizedDescription"));
        objc_msgSend(v260, "log:", CFSTR("Error fetching key '%s': %@"), "detail", v261);

        v100 = 0;
      }
      else
      {
        v100 = 0;
      }
      v10 = v304;
      goto LABEL_101;
    case 0xBu:
      v120 = v10;
      v121 = v6;
      v122 = v7;
      v123 = v7;
      if (v5)
      {
        v124 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v125 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "getCurrentInflightLocalDiagnostic"));

        if (v125)
        {
          v126 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v126, "registerActivityWithID:", v125);

          sub_100032A5C(v125);
          v127 = xpc_dictionary_get_BOOL(v121, "compress");
          v128 = sub_100023D38(v125, !v127);
          v129 = (void *)objc_claimAutoreleasedReturnValue(v128);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v129;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting in-progress archive %@", buf, 0xCu);
          }
          xpc_dictionary_set_uint64(v123, "RESPONSE_TYPE", 1uLL);
          if (v129)
          {
            v130 = objc_retainAutorelease(v129);
            xpc_dictionary_set_string(v123, "path", (const char *)objc_msgSend(v130, "UTF8String"));

          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No in-progress archive found", buf, 2u);
          }
          xpc_dictionary_set_uint64(v123, "RESPONSE_TYPE", 1uLL);
        }

      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Get in-progress archive not implemented", buf, 2u);
        }
        sub_100035A28(v123, 9uLL);
      }

      v168 = 0;
      v7 = v122;
      v10 = v120;
      goto LABEL_256;
    case 0xCu:
      v131 = v6;
      v311 = v7;
      v132 = v7;
      if ((sub_100045BC0(v5, CFSTR("com.apple.private.sysdiagnose.cli")) & 1) != 0)
      {
        v133 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v131, "CLI_REQUEST_TYPE"));
        v134 = (void *)objc_claimAutoreleasedReturnValue(v133);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v135 = sub_10002397C(0xCu);
          v136 = (void *)objc_claimAutoreleasedReturnValue(v135);
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v134;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v136;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Handling '%@' for '%@'", buf, 0x16u);

        }
        if (objc_msgSend(CFSTR("isAutomaticCoSysdiagnosePossible"), "isEqualToString:", v134))
        {
          v137 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v138 = objc_msgSend(v137, "isAutomaticCoSysdiagnosePossible");

          xpc_dictionary_set_uint64(v132, "RESPONSE_DATA", v138);
LABEL_92:
          xpc_dictionary_set_uint64(v132, "RESPONSE_TYPE", 1uLL);
LABEL_284:

          goto LABEL_285;
        }
        if (!objc_msgSend(CFSTR("validateRemoteUUIDs"), "isEqualToString:", v134))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_1000606D4((uint64_t)v134, v218, v219, v220, v221, v222, v223, v224);
          sub_100035A28(v132, 0xBuLL);
          goto LABEL_284;
        }
        v299 = v6;
        v170 = objc_opt_class(NSSet, v169);
        v172 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v170, objc_opt_class(NSString, v171), 0);
        v173 = (void *)objc_claimAutoreleasedReturnValue(v172);
        *(_QWORD *)v337 = 0;
        v174 = xpc_dictionary_get_data(v131, "REQUEST_DATA", (size_t *)v337);
        if (v174
          && (v175 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v174, *(_QWORD *)v337))) != 0)
        {
          v176 = (void *)v175;
          *(_QWORD *)v344 = 0;
          xdictc = v173;
          v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v173, v175, v344));
          v178 = *(id *)v344;
          v179 = v178;
          if (v177)
          {

            v181 = objc_opt_class(NSSet, v180);
            if ((objc_opt_isKindOfClass(v177, v181) & 1) != 0)
            {
              obja = v134;
              v305 = v10;
              v182 = v177;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "REQUEST_DATA";
                *(_WORD *)&buf[12] = 2112;
                *(_QWORD *)&buf[14] = v182;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
              }
              v183 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v183, "log:", CFSTR("Setting %s to %@"), "REQUEST_DATA", v182);

              v184 = objc_opt_new(NSMutableDictionary);
              memset(v337, 0, sizeof(v337));
              v338 = 0u;
              v339 = 0u;
              v185 = v182;
              v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
              if (v186)
              {
                v187 = v186;
                v188 = **(_QWORD **)&v337[16];
                do
                {
                  for (k = 0; k != v187; k = (char *)k + 1)
                  {
                    if (**(_QWORD **)&v337[16] != v188)
                      objc_enumerationMutation(v185);
                    v190 = *(_QWORD *)(*(_QWORD *)&v337[8] + 8 * (_QWORD)k);
                    v191 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[CSRemoteXPCProxy isDeviceWithUUIDAvailable:](CSRemoteXPCProxy, "isDeviceWithUUIDAvailable:", v190)));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v184, "setObject:forKeyedSubscript:", v191, v190);

                  }
                  v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", v337, buf, 16);
                }
                while (v187);
              }

              v192 = -[NSMutableDictionary copy](v184, "copy");
              *(_QWORD *)&v340 = 0;
              v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v192, 1, &v340));
              v194 = (id)v340;

              if (v193)
              {
                v195 = objc_retainAutorelease(v193);
                xpc_dictionary_set_data(v132, "RESPONSE_DATA", objc_msgSend(v195, "bytes"), (size_t)objc_msgSend(v195, "length"));
                v10 = v305;
              }
              else
              {
                v10 = v305;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  sub_100060654(v194);
                sub_100035A28(v132, 4uLL);
              }

              v6 = v299;
              v134 = obja;
              if (!v193)
                goto LABEL_284;
              goto LABEL_92;
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v282 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "localizedDescription"));
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "REQUEST_DATA";
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v282;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);

            }
            v283 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "localizedDescription"));
            objc_msgSend(v283, "log:", CFSTR("Error fetching key '%s': %@"), "REQUEST_DATA", v284);

            v177 = 0;
          }
          v6 = v299;
          v173 = xdictc;
        }
        else
        {
          v177 = 0;
        }

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_1000605E8((uint64_t)v134, v285, v286, v287, v288, v289, v290, v291);
        sub_100035A28(v132, 0xBuLL);

        goto LABEL_284;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v139 = sub_10002397C(0xCu);
        v140 = (void *)objc_claimAutoreleasedReturnValue(v139);
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v140;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: %@ invoked by unentitled client", buf, 0xCu);

      }
      sub_100035A28(v132, 0xFuLL);
LABEL_285:

      v168 = 0;
      v7 = v311;
LABEL_256:

      return v168;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request not implemented", buf, 2u);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v23, "log:", CFSTR("Request not implemented"));

      sub_100035A28(v7, 0xBuLL);
      goto LABEL_255;
  }
}

void sub_100035A28(void *a1, uint64_t a2)
{
  xpc_object_t xdict;

  xdict = a1;
  xpc_dictionary_set_uint64(xdict, "RESPONSE_TYPE", 2uLL);
  xpc_dictionary_set_uint64(xdict, "FAILURE_REASON", a2);

}

uint64_t sub_100035A7C()
{
  dispatch_queue_global_t global_queue;
  NSObject *v1;
  xpc_connection_t mach_service;
  void *v3;
  _xpc_connection_s *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __int16 v9;
  _QWORD handler[4];
  NSObject *v11;

  global_queue = dispatch_get_global_queue(25, 0);
  v1 = objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v1, 1uLL);
  v3 = (void *)qword_1000B9880;
  qword_1000B9880 = (uint64_t)mach_service;

  v4 = (_xpc_connection_s *)qword_1000B9880;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100035BC0;
  handler[3] = &unk_100099990;
  v5 = v1;
  v11 = v5;
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume((xpc_connection_t)qword_1000B9880);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "XPC server initialized.", (uint8_t *)&v9, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v6, "stdoutWrite:", CFSTR("XPC server initialized."));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "log:", CFSTR("XPC server initialized."));

  return 0;
}

void sub_100035BC0(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  xpc_type_t v5;
  _BOOL4 v6;
  void *v7;
  _xpc_connection_s *v8;
  void *v9;
  _xpc_connection_s *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 buf;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  _xpc_connection_s *v20;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    v9 = *(void **)(a1 + 32);
    v10 = (_xpc_connection_s *)v3;
    v11 = v9;
    v12 = (void *)os_transaction_create("incoming xpc request");
    xpc_connection_set_target_queue(v10, v11);

    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v17 = sub_10003C098;
    v18 = &unk_100099A00;
    v19 = v12;
    v20 = v10;
    v13 = v12;
    v8 = v10;
    xpc_connection_set_event_handler(v8, &buf);
    xpc_connection_resume(v8);

LABEL_7:
    goto LABEL_11;
  }
  v5 = type;
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v5 != (xpc_type_t)&_xpc_type_error)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unrecognized connection event", (uint8_t *)&buf, 2u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "stdoutWrite:", CFSTR("unrecognized connection event"));

    v8 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    -[_xpc_connection_s log:](v8, "log:", CFSTR("unrecognized connection event"));
    goto LABEL_7;
  }
  if (v6)
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "connection error: %s", (uint8_t *)&buf, 0xCu);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v14, "stdoutWrite:", CFSTR("connection error: %s"), xpc_dictionary_get_string(v3, _xpc_error_key_description));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v15, "log:", CFSTR("connection error: %s"), xpc_dictionary_get_string(v3, _xpc_error_key_description));

LABEL_11:
}

void sub_100035E38()
{
  void *v0;
  id v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v1 = (id)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v0, 59, 0, 0, 0, 1.0));

  if (v1)
  {
    objc_msgSend(v1, "setName:", CFSTR("SpringBoardStateDump"));
    objc_msgSend(v1, "setRuntimeChecks:", 0);
    objc_msgSend(v1, "execute");
  }

}

void sub_100035ED0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint8_t buf[4];
  const char *v5;

  objc_msgSend(*(id *)(a1 + 40), "setRequestSource:", 1);
  sub_100023790();
  objc_msgSend(*(id *)(a1 + 40), "run");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v5 = "sysdiagnose (full)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "stdoutWrite:", CFSTR("%s complete"), "sysdiagnose (full)");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "log:", CFSTR("%s complete"), "sysdiagnose (full)");

}

void sub_100035FE0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;

  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tap-to-Radar failed to handle the keychord event with error: %@", buf, 0xCu);

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    objc_msgSend(v5, "stdoutWrite:", CFSTR("Tap-to-Radar failed to handle the keychord event with error: %@"), v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
    objc_msgSend(v7, "log:", CFSTR("Tap-to-Radar failed to handle the keychord event with error: %@"), v8);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100036148(uint64_t a1)
{
  const __CFString *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;

  sub_100023790();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v2 = sub_10002383C(*(_DWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    *(_DWORD *)buf = 136315394;
    v13 = "sysdiagnose (stackshot only)";
    v14 = 2112;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s trigger: %@", buf, 0x16u);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v5 = sub_10002383C(*(_DWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v4, "stdoutWrite:", CFSTR("%s trigger: %@"), "sysdiagnose (stackshot only)", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v8 = sub_10002383C(*(_DWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "log:", CFSTR("%s trigger: %@"), "sysdiagnose (stackshot only)", v9);

  sub_100024B40(41);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "sysdiagnose (stackshot only)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s complete", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "stdoutWrite:", CFSTR("%s complete"), "sysdiagnose (stackshot only)");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", CFSTR("%s complete"), "sysdiagnose (stackshot only)");

}

id sub_100036338(uint64_t a1, void *a2, id *a3, _QWORD *a4, _QWORD *a5)
{
  id v8;
  id v9;
  xpc_object_t value;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  SystemDiagnosticiOS *v35;
  SystemDiagnosticiOS *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  xpc_object_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  SystemDiagnosticiOS *v63;
  _QWORD *v64;
  void *v65;
  xpc_object_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  unsigned int v75;
  xpc_connection_t remote_connection;
  void *v77;
  void *v78;
  void *v79;
  unsigned __int8 v80;
  id v81;
  uint64_t v82;
  uint64_t *v83;
  NSString *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  id v108;
  void *v109;
  void *v110;
  unsigned __int8 v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  NSObject *v116;
  id v117;
  id v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  xpc_object_t v125;
  void *v126;
  void *v127;
  char **v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  NSString *v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  SystemDiagnosticiOS *v140;
  void *v141;
  xpc_object_t v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  NSString *v148;
  id v149;
  id v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  SystemDiagnosticiOS *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  unsigned __int8 v167;
  void *v168;
  void *v169;
  unsigned int v170;
  int v171;
  unsigned int v172;
  xpc_object_t v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  id v179;
  unsigned int v180;
  void *v181;
  void *v182;
  void *v183;
  id v184;
  unsigned int v185;
  void *v186;
  void *v187;
  xpc_object_t v188;
  void *v189;
  void *v190;
  id v191;
  void *v192;
  void *v193;
  NSString *v194;
  id v195;
  id v196;
  id v197;
  void *v198;
  id v199;
  void *v200;
  id v201;
  SystemDiagnosticiOS *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  xpc_object_t v207;
  void *v208;
  void *v209;
  id v210;
  void *v211;
  void *v212;
  NSString *v213;
  id v214;
  id v215;
  id v216;
  void *v217;
  id v218;
  void *v219;
  id v220;
  SystemDiagnosticiOS *v221;
  void *v222;
  void *v223;
  void *v224;
  xpc_object_t v225;
  void *v226;
  uint64_t v227;
  _BOOL8 v228;
  void *v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  NSSet *v233;
  uint64_t v234;
  const void *data;
  uint64_t v236;
  void *v237;
  void *v238;
  id v239;
  void *v240;
  uint64_t v241;
  uint64_t v242;
  id v243;
  id v244;
  void *v245;
  void *v246;
  void *v247;
  xpc_object_t v248;
  void *v249;
  _BOOL8 v250;
  void *v251;
  char v252;
  id v253;
  void *v254;
  void *v255;
  xpc_object_t v256;
  void *v257;
  uint64_t v258;
  id v259;
  int64_t v260;
  void *v261;
  void *v262;
  unsigned int v263;
  xpc_object_t v264;
  void *v265;
  void *v266;
  id v267;
  void *v268;
  void *v269;
  id v270;
  unsigned int v271;
  void *v272;
  void *v273;
  void *v274;
  unsigned int v275;
  xpc_object_t v276;
  void *v277;
  void *v278;
  id v279;
  void *v280;
  void *v281;
  id v282;
  unsigned int v283;
  void *v284;
  void *v285;
  void *v286;
  unsigned int v287;
  xpc_object_t v288;
  void *v289;
  void *v290;
  id v291;
  void *v292;
  void *v293;
  id v294;
  unsigned int v295;
  void *v296;
  void *v297;
  void *v298;
  unsigned int v299;
  xpc_object_t v300;
  void *v301;
  void *v302;
  id v303;
  void *v304;
  void *v305;
  id v306;
  unsigned int v307;
  void *v308;
  void *v309;
  void *v310;
  unsigned int v311;
  xpc_object_t v312;
  void *v313;
  void *v314;
  id v315;
  void *v316;
  void *v317;
  id v318;
  unsigned int v319;
  void *v320;
  void *v321;
  void *v322;
  unsigned int v323;
  xpc_object_t v324;
  void *v325;
  void *v326;
  id v327;
  void *v328;
  void *v329;
  id v330;
  unsigned int v331;
  void *v332;
  void *v333;
  void *v334;
  unsigned int v335;
  xpc_object_t v336;
  void *v337;
  void *v338;
  id v339;
  void *v340;
  void *v341;
  id v342;
  unsigned int v343;
  void *v344;
  void *v345;
  void *v346;
  unsigned int v347;
  xpc_object_t v348;
  void *v349;
  void *v350;
  id v351;
  void *v352;
  void *v353;
  id v354;
  unsigned int v355;
  void *v356;
  void *v357;
  void *v358;
  unsigned int v359;
  xpc_object_t v360;
  void *v361;
  void *v362;
  id v363;
  void *v364;
  void *v365;
  id v366;
  unsigned int v367;
  void *v368;
  void *v369;
  void *v370;
  unsigned int v371;
  xpc_object_t v372;
  void *v373;
  void *v374;
  id v375;
  void *v376;
  void *v377;
  id v378;
  unsigned int v379;
  void *v380;
  void *v381;
  void *v382;
  unsigned int v383;
  xpc_object_t v384;
  void *v385;
  void *v386;
  id v387;
  void *v388;
  void *v389;
  id v390;
  unsigned int v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  unsigned int v396;
  xpc_object_t v397;
  void *v398;
  void *v399;
  id v400;
  void *v401;
  void *v402;
  _BOOL8 v403;
  id v404;
  void *v405;
  unsigned int v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  const char *string;
  SystemDiagnosticiOS *v415;
  const char *v416;
  void *v417;
  id v418;
  void *v419;
  void *v420;
  id v421;
  void *v422;
  unsigned int v423;
  xpc_object_t v424;
  void *v425;
  void *v426;
  id v427;
  void *v428;
  void *v429;
  id v430;
  unsigned int v431;
  void *v432;
  void *v433;
  void *v434;
  unsigned int v435;
  xpc_object_t v436;
  void *v437;
  void *v438;
  id v439;
  void *v440;
  void *v441;
  id v442;
  unsigned int v443;
  void *v444;
  void *v445;
  void *v446;
  unsigned int v447;
  xpc_object_t v448;
  void *v449;
  void *v450;
  id v451;
  void *v452;
  void *v453;
  id v454;
  unsigned int v455;
  void *v456;
  void *v457;
  void *v458;
  void *v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  NSSet *v473;
  void *v474;
  const void *v475;
  uint64_t v476;
  void *v477;
  void *v478;
  id v479;
  void *v480;
  uint64_t v481;
  uint64_t v482;
  id v483;
  id v484;
  void *v485;
  void *v486;
  void *v487;
  NSObject *v488;
  id v489;
  void *v490;
  void *v491;
  NSObject *v492;
  id v493;
  void *v494;
  void *v495;
  void *v496;
  id v497;
  void *v498;
  void *v499;
  void *v500;
  xpc_object_t v501;
  void *v502;
  void *v503;
  id v504;
  void *v505;
  void *v506;
  _BOOL8 v507;
  id v508;
  void *v509;
  void *v510;
  void *v511;
  void *v512;
  void *v513;
  NSMutableDictionary *v514;
  void *v515;
  id v516;
  SystemDiagnosticiOS *v517;
  void *v518;
  xpc_object_t v519;
  void *v520;
  void *v521;
  id v522;
  void *v523;
  void *v524;
  NSString *v525;
  id v526;
  id v527;
  id v528;
  void *v529;
  id v530;
  void *v531;
  id v532;
  void *v533;
  void *v534;
  void *v535;
  void *v536;
  int int64;
  void *v538;
  void *v539;
  void *v540;
  void *v541;
  unsigned int v542;
  xpc_object_t v543;
  void *v544;
  void *v545;
  id v546;
  void *v547;
  void *v548;
  id v549;
  unsigned int v550;
  void *v551;
  void *v552;
  void *v553;
  unsigned int v554;
  xpc_object_t v555;
  void *v556;
  void *v557;
  id v558;
  void *v559;
  void *v560;
  id v561;
  unsigned int v562;
  void *v563;
  void *v564;
  void *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  id v569;
  void *v570;
  void *v571;
  void *v572;
  unsigned __int8 v573;
  id v574;
  void *v575;
  void *v576;
  void *v577;
  xpc_connection_t v578;
  void *v579;
  void *v580;
  void *v581;
  void *v582;
  NSObject *v583;
  unsigned int v584;
  id v585;
  void *v586;
  void *v587;
  void *v588;
  id v589;
  id v590;
  uint64_t v591;
  void *i;
  void *v593;
  id v594;
  id v595;
  id v596;
  void *v597;
  void *v598;
  void *v599;
  id v600;
  id v601;
  void *v602;
  uint64_t v603;
  void *v604;
  id v605;
  id v606;
  void *v607;
  uint64_t v608;
  void *v609;
  void *v611;
  id v612;
  _QWORD *v613;
  void *v614;
  void *v615;
  SystemDiagnosticiOS *v616;
  void *v617;
  id obj;
  id obja;
  __int128 v621;
  __int128 v622;
  __int128 v623;
  __int128 v624;
  id v625;
  id v626;
  size_t length;
  __int128 v628;
  __int128 v629;
  __int128 v630;
  __int128 v631;
  uint8_t v632[128];
  uint8_t buf[4];
  _BYTE v634[10];
  id v635;
  _QWORD v636[10];
  _QWORD v637[10];
  _BYTE v638[128];

  v8 = a2;
  *a4 = 0;
  if (!sub_100029688())
  {
    if ((_DWORD)a1 == 2)
      sub_100035E38();
    v615 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    if (!v8)
    {
      v16 = 0;
      goto LABEL_15;
    }
    value = xpc_dictionary_get_value(v8, "diagnosticID");
    v11 = (void *)objc_claimAutoreleasedReturnValue(value);
    v12 = v11;
    if (v11)
    {
      if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_string)
      {
        v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "diagnosticID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(v17);
        goto LABEL_14;
      }
      v13 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v14, "stdoutWrite:", CFSTR("Invalid flag argument type."));

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v15, "log:", CFSTR("Invalid flag argument type."));

    }
    v16 = 0;
LABEL_14:

LABEL_15:
    v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v19 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v634 = "diagnosticID";
      *(_WORD *)&v634[8] = 2080;
      v635 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v21 = objc_retainAutorelease(v16);
    objc_msgSend(v20, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "diagnosticID", objc_msgSend(v21, "UTF8String"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v23 = objc_retainAutorelease(v21);
    objc_msgSend(v22, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "diagnosticID", objc_msgSend(v23, "UTF8String"));

    v614 = v23;
    objc_msgSend(0, "isEqualToString:", v23);
    v613 = a4;
    if (!v8)
    {
      v30 = 1;
      goto LABEL_27;
    }
    v24 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (v25)
    {
      if (xpc_get_type(v25) == (xpc_type_t)&_xpc_type_BOOL)
      {
        v30 = xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall");
        goto LABEL_26;
      }
      v27 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v28, "stdoutWrite:", CFSTR("Invalid flag argument type."));

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v29, "log:", CFSTR("Invalid flag argument type."));

    }
    v30 = 1;
LABEL_26:

LABEL_27:
    v31 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v634 = "shouldCreateTarBall";
      *(_WORD *)&v634[8] = 1024;
      LODWORD(v635) = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v32, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldCreateTarBall", v30);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v33, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldCreateTarBall", v30);

    if (!v30)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldCreateTarBall", 1, 0));
      objc_msgSend(v615, "appendString:", v34);

    }
    v35 = objc_alloc_init(SystemDiagnosticiOS);
    v36 = v35;
    if (!v35)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000607E4();
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v49, "stderrWrite:", CFSTR("Failed to allocate diagnostic object. Failing early from do_sysdiagnose"));

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v50, "log:", CFSTR("Failed to allocate diagnostic object. Failing early from do_sysdiagnose"));

      v9 = 0;
      v45 = v614;
      goto LABEL_487;
    }
    v616 = v35;
    if (a5
      && (v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v35, "diagnosticID")),
          v37,
          v37))
    {
      *a5 = (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v36, "diagnosticID"));
    }
    else
    {
      v38 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100060824((uint64_t)a5, v36);

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v36, "diagnosticID"));
      objc_msgSend(v39, "stderrWrite:", CFSTR("Error setting diagnosticIDOut: trying to set '%p' to '%@'"), a5, v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v36, "diagnosticID"));
      objc_msgSend(v41, "log:", CFSTR("Error setting diagnosticIDOut: trying to set '%p' to '%@'"), a5, v42);

    }
    v43 = xpc_dictionary_get_value(v8, "coSysdiagnoseOnly");
    v44 = objc_claimAutoreleasedReturnValue(v43);
    v45 = v614;
    if (v44)
    {
      v46 = (void *)v44;
      v47 = xpc_dictionary_get_BOOL(v8, "coSysdiagnoseOnly");

      v48 = !v47;
    }
    else
    {
      v48 = 1;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
    v53 = objc_msgSend(v51, "checkAndIncreaseDiagnosticCountForDiagnosticID:collectingLocalLogs:", v52, v48);

    if (v614)
    {
      if ((objc_msgSend(v614, "isEqualToString:", CFSTR("waitIfAny")) & v53 & 1) == 0)
      {
        if (!objc_msgSend(v614, "hasPrefix:", CFSTR("remote:")))
        {
          v54 = objc_msgSend(v614, "isEqualToString:", CFSTR("waitIfAny"));
          v36 = v616;
          if (v54)
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "getCurrentInflightLocalDiagnostic"));

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v634 = v56;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Selected the following diagnostic %@", buf, 0xCu);
            }
            v57 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v57, "log:", CFSTR("Selected the following diagnostic %@"), v56);

          }
          else
          {
            v56 = v614;
          }
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v75 = objc_msgSend(v74, "registerActivityWithID:", v56);

          if (((v54 | v75 ^ 1) & 1) == 0)
          {
            remote_connection = xpc_dictionary_get_remote_connection(v8);
            v77 = (void *)objc_claimAutoreleasedReturnValue(remote_connection);
            v78 = v77;
            if (v77)
            {
              if (xpc_get_type(v77) == (xpc_type_t)&_xpc_type_connection)
              {
                v79 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                v80 = objc_msgSend(v79, "initConnectionWithPeer:forDiagnosticID:", v78, v56);

                if ((v80 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v634 = v56;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't set progressHandler for sysdiagnose with the diagnostcID %@", buf, 0xCu);
                }
              }
            }

          }
          sub_100032A5C(v56);
          v81 = sub_100023D38(v56, v30 ^ 1);
          v73 = (id)objc_claimAutoreleasedReturnValue(v81);
          if (v73)
          {
            v82 = 0;
            v83 = a4;
          }
          else
          {
            v83 = a4;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v634 = v56;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get an archive with the diagnostcID %@", buf, 0xCu);
            }
            v112 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v112, "log:", CFSTR("Couldn't get an archive with the diagnostcID %@"), v56);

            v82 = 2;
          }
          *v83 = v82;
          v45 = v56;
          goto LABEL_94;
        }
LABEL_61:
        v72 = sub_10003273C(v614, a4);
        v73 = (id)objc_claimAutoreleasedReturnValue(v72);
        v36 = v616;
LABEL_94:
        v113 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v114 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v36, "diagnosticID"));
        objc_msgSend(v113, "decreaseDiagnosticCountForDiagnosticID:", v114);

        goto LABEL_486;
      }
    }
    else if (!v53)
    {
      if ((objc_msgSend(0, "hasPrefix:", CFSTR("remote:")) & 1) == 0)
      {
        v73 = 0;
        v45 = 0;
        *a4 = 3;
        v36 = v616;
LABEL_486:
        v9 = v73;
        goto LABEL_487;
      }
      goto LABEL_61;
    }
    v58 = sub_100026BC4();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_signpost_enabled(v59))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] Setup/Parsing begins", buf, 2u);
    }

    v60 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "possibleClient"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v62, "setCurrentClient:", v61);

    v63 = v616;
    -[SystemDiagnostic setRequestSource:](v616, "setRequestSource:", a1);
    v64 = a4;
    if (!v8)
    {
LABEL_421:
      v536 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v63, "diagnosticID"));

      if (v8 && v536)
      {
        int64 = xpc_dictionary_get_int64(v8, "clientPID");
        v538 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v539 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v63, "diagnosticID"));
        v540 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", int64));
        objc_msgSend(v538, "setUpSysdiagnoseSession:clientPid:", v539, v540);

        v63 = v616;
        proc_pidpath(int64, buf, 0x400u);
        v541 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", buf, 4));
        -[SystemDiagnostic setIsTestingMode:](v616, "setIsTestingMode:", objc_msgSend(v541, "rangeOfString:", CFSTR("dt_sysdiagnose")) != (id)0x7FFFFFFFFFFFFFFFLL);

        v542 = -[SystemDiagnostic tconNvmDump](v616, "tconNvmDump");
      }
      else
      {
        v542 = -[SystemDiagnostic tconNvmDump](v63, "tconNvmDump");
        if (!v8)
        {
LABEL_432:
          v549 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v550 = -[SystemDiagnostic tconNvmDump](v63, "tconNvmDump");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v634 = "tconNvmDump";
            *(_WORD *)&v634[8] = 1024;
            LODWORD(v635) = v550;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
          }

          v551 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v551, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "tconNvmDump", -[SystemDiagnostic tconNvmDump](v616, "tconNvmDump"));

          v36 = v616;
          v552 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v552, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "tconNvmDump", -[SystemDiagnostic tconNvmDump](v616, "tconNvmDump"));

          if (v542 != -[SystemDiagnostic tconNvmDump](v616, "tconNvmDump"))
          {
            v553 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "tconNvmDump", v542, -[SystemDiagnostic tconNvmDump](v616, "tconNvmDump")));
            objc_msgSend(v615, "appendString:", v553);

          }
          if (sub_100045E60())
          {
            v554 = -[SystemDiagnostic collectWifiDextCoreFiles](v616, "collectWifiDextCoreFiles");
            if (v8)
            {
              v555 = xpc_dictionary_get_value(v8, "collectWifiDextCoreFiles");
              v556 = (void *)objc_claimAutoreleasedReturnValue(v555);
              v557 = v556;
              if (v556)
              {
                if (xpc_get_type(v556) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setCollectWifiDextCoreFiles:](v616, "setCollectWifiDextCoreFiles:", xpc_dictionary_get_BOOL(v8, "collectWifiDextCoreFiles"));
                }
                else
                {
                  v558 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v559 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v559, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v560 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  objc_msgSend(v560, "log:", CFSTR("Invalid flag argument type."));

                  v36 = v616;
                }
              }

            }
            v561 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v562 = -[SystemDiagnostic collectWifiDextCoreFiles](v36, "collectWifiDextCoreFiles");
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v634 = "collectWifiDextCoreFiles";
              *(_WORD *)&v634[8] = 1024;
              LODWORD(v635) = v562;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
            }

            v563 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v563, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "collectWifiDextCoreFiles", -[SystemDiagnostic collectWifiDextCoreFiles](v616, "collectWifiDextCoreFiles"));

            v36 = v616;
            v564 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v564, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "collectWifiDextCoreFiles", -[SystemDiagnostic collectWifiDextCoreFiles](v616, "collectWifiDextCoreFiles"));

            if (v554 != -[SystemDiagnostic collectWifiDextCoreFiles](v616, "collectWifiDextCoreFiles"))
            {
              v565 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "collectWifiDextCoreFiles", v554, -[SystemDiagnostic collectWifiDextCoreFiles](v616, "collectWifiDextCoreFiles")));
              objc_msgSend(v615, "appendString:", v565);

            }
          }
          if (-[SystemDiagnostic requestSource](v36, "requestSource") == 2)
          {
            v566 = xpc_dictionary_dup_fd(v8, "stdout");
            v567 = xpc_dictionary_dup_fd(v8, "stderr");
            v568 = v567;
            if ((_DWORD)v566 == -1 || (_DWORD)v567 == -1)
            {
              v569 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)v634 = v566;
                *(_WORD *)&v634[4] = 1024;
                *(_DWORD *)&v634[6] = v568;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Server received invalid CLI descriptors: stdout %d, stderr %d", buf, 0xEu);
              }

              v570 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v570, "log:", CFSTR("Server received invalid CLI descriptors: stdout %d, stderr %d"), v566, v568);

            }
            v571 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v572 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
            v573 = objc_msgSend(v571, "setUpCLI:stdoutfd:stderrfd:", v572, v566, v568);

            v36 = v616;
            if ((v573 & 1) == 0)
            {
              v574 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v575 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v634 = v575;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setUpCli failed for diagnostic ID :%@.", buf, 0xCu);

              }
              v576 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              v577 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
              objc_msgSend(v576, "log:", CFSTR("setUpCli failed for diagnostic ID :%@."), v577);

            }
          }
          if (!-[SystemDiagnostic verbose](v36, "verbose"))
          {
            v578 = xpc_dictionary_get_remote_connection(v8);
            v579 = (void *)objc_claimAutoreleasedReturnValue(v578);
            v580 = v579;
            if (v579 && xpc_get_type(v579) == (xpc_type_t)&_xpc_type_connection)
            {
              v581 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v581, "initProgressTrackerWithConnection:", v580);

            }
          }
          -[SystemDiagnostic setChangedDiagnosticProperties:](v36, "setChangedDiagnosticProperties:", v615);
          v582 = sub_100026BC4();
          v583 = objc_claimAutoreleasedReturnValue(v582);
          if (os_signpost_enabled(v583))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v583, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
          }

          -[SystemDiagnosticiOS run](v36, "run");
          v584 = -[SystemDiagnostic requestSource](v36, "requestSource");
          if (a3 && v584 == 3)
          {
            v612 = v8;
            v585 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Getting a copy of metrics", buf, 2u);
            }

            v586 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v586, "stdoutWrite:", CFSTR("Getting a copy of metrics"));

            v587 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v587, "log:", CFSTR("Getting a copy of metrics"));

            v588 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](v36, "metricsDict"));
            *a3 = objc_msgSend(v588, "copy");

            v623 = 0u;
            v624 = 0u;
            v621 = 0u;
            v622 = 0u;
            obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "allKeys"));
            v589 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v621, v632, 16);
            if (v589)
            {
              v590 = v589;
              v591 = *(_QWORD *)v622;
              do
              {
                for (i = 0; i != v590; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v622 != v591)
                    objc_enumerationMutation(obja);
                  v593 = *(void **)(*((_QWORD *)&v621 + 1) + 8 * (_QWORD)i);
                  v594 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v595 = objc_retainAutorelease(v593);
                    v596 = objc_msgSend(v595, "UTF8String");
                    v597 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKey:", v595));
                    objc_msgSend(v597, "doubleValue");
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v634 = v596;
                    *(_WORD *)&v634[8] = 2048;
                    v635 = v598;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Key: %s, Val: %f", buf, 0x16u);

                  }
                  v599 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  v600 = objc_retainAutorelease(v593);
                  v601 = objc_msgSend(v600, "UTF8String");
                  v602 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKey:", v600));
                  objc_msgSend(v602, "doubleValue");
                  objc_msgSend(v599, "stdoutWrite:", CFSTR("Key: %s, Val: %f"), v601, v603);

                  v604 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  v605 = objc_retainAutorelease(v600);
                  v606 = objc_msgSend(v605, "UTF8String");
                  v607 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a3, "objectForKey:", v605));
                  objc_msgSend(v607, "doubleValue");
                  objc_msgSend(v604, "log:", CFSTR("Key: %s, Val: %f"), v606, v608);

                }
                v590 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v621, v632, 16);
              }
              while (v590);
            }

            v8 = v612;
            v64 = v613;
            v45 = v614;
            v36 = v616;
          }
          if (-[SystemDiagnostic didComplete](v36, "didComplete"))
          {
            if (-[SystemDiagnostic shouldCreateTarBall](v36, "shouldCreateTarBall"))
              v609 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](v36, "tarballPath"));
            else
              v609 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](v36, "outputDirectory"));
            v73 = v609;

          }
          else
          {
            v73 = 0;
            *v64 = 6;
          }
          goto LABEL_486;
        }
      }
      v543 = xpc_dictionary_get_value(v8, "tconNvmDump");
      v544 = (void *)objc_claimAutoreleasedReturnValue(v543);
      v545 = v544;
      if (v544)
      {
        if (xpc_get_type(v544) == (xpc_type_t)&_xpc_type_BOOL)
        {
          -[SystemDiagnostic setTconNvmDump:](v63, "setTconNvmDump:", xpc_dictionary_get_BOOL(v8, "tconNvmDump"));
        }
        else
        {
          v546 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
          }

          v547 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v547, "stdoutWrite:", CFSTR("Invalid flag argument type."));

          v548 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v548, "log:", CFSTR("Invalid flag argument type."));

          v63 = v616;
        }
      }

      goto LABEL_432;
    }
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
    v66 = xpc_dictionary_get_value(v8, "pidOrProcess");
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v68 = v67;
    if (v67)
    {
      if (xpc_get_type(v67) == (xpc_type_t)&_xpc_type_string)
      {
        v84 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "pidOrProcess"));
        v71 = (void *)objc_claimAutoreleasedReturnValue(v84);
        -[SystemDiagnostic setProvidedPIDorProcess:](v616, "setProvidedPIDorProcess:", v71);
      }
      else
      {
        v69 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v70 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v70, "stdoutWrite:", CFSTR("Invalid flag argument type."));

        v71 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v71, "log:", CFSTR("Invalid flag argument type."));
        v63 = v616;
      }

    }
    v85 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v63, "providedPIDorProcess")));
      v87 = objc_msgSend(v86, "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v634 = "pidOrProcess";
      *(_WORD *)&v634[8] = 2080;
      v635 = v87;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);

    }
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v89 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v63, "providedPIDorProcess")));
    objc_msgSend(v88, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "pidOrProcess", objc_msgSend(v89, "UTF8String"));

    v90 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess")));
    objc_msgSend(v90, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "pidOrProcess", objc_msgSend(v91, "UTF8String"));

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
    if ((objc_msgSend(v65, "isEqualToString:", v92) & 1) == 0 && v65)
    {
      v93 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));

      if (!v93)
        goto LABEL_82;
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %@ to %@\n"), "pidOrProcess", v65, v94));

      objc_msgSend(v615, "appendString:", v92);
    }

LABEL_82:
    v95 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
    v45 = v614;
    if (!v95)
      goto LABEL_112;
    v96 = (void *)v95;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
    if (objc_msgSend(v97, "rangeOfString:options:", CFSTR("Mail"), 1) == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
      v99 = objc_msgSend(v98, "rangeOfString:options:", CFSTR("Safari"), 1);

      if (v99 != (id)0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_112;
      -[SystemDiagnostic populateProcessInfoForInput](v616, "populateProcessInfoForInput");
      v100 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v616, "targetPIDs"));
      if (!v100
        || (v101 = (void *)v100,
            v102 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v616, "targetPIDs")),
            v103 = objc_msgSend(v102, "count"),
            v102,
            v101,
            !v103))
      {
        *a4 = 12;
        v115 = sub_100026BC4();
        v116 = objc_claimAutoreleasedReturnValue(v115);
        if (os_signpost_enabled(v116))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v116, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
        }

        goto LABEL_378;
      }
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "invertedSet"));

      v105 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
      v106 = objc_msgSend(v105, "rangeOfCharacterFromSet:", v96);

      if (v106 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v107 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
        v108 = objc_msgSend(v107, "intValue");

        v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v108));
        v110 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v616, "targetPIDs"));
        v111 = objc_msgSend(v110, "containsObject:", v109);

        if ((v111 & 1) != 0)
          goto LABEL_111;
LABEL_107:
        *v613 = 12;
        v123 = sub_100026BC4();
        v124 = objc_claimAutoreleasedReturnValue(v123);
        if (os_signpost_enabled(v124))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v124, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
        }

        goto LABEL_378;
      }
      v630 = 0u;
      v631 = 0u;
      v628 = 0u;
      v629 = 0u;
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](v616, "targetPIDs"));
      v117 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v628, v638, 16);
      if (!v117)
      {
LABEL_106:

        goto LABEL_107;
      }
      v118 = v117;
      v119 = *(_QWORD *)v629;
LABEL_100:
      v120 = 0;
      while (1)
      {
        if (*(_QWORD *)v629 != v119)
          objc_enumerationMutation(v97);
        v121 = *(void **)(*((_QWORD *)&v628 + 1) + 8 * (_QWORD)v120);
        v122 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](v616, "providedPIDorProcess"));
        LOBYTE(v121) = sub_100046230(v121, v122);

        if ((v121 & 1) != 0)
          break;
        v120 = (char *)v120 + 1;
        v45 = v614;
        if (v118 == v120)
        {
          v118 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v628, v638, 16);
          if (v118)
            goto LABEL_100;
          goto LABEL_106;
        }
      }
    }

LABEL_111:
LABEL_112:
    v125 = xpc_dictionary_get_value(v8, "commandLineArgs");
    v126 = (void *)objc_claimAutoreleasedReturnValue(v125);
    v127 = v126;
    if (v126)
    {
      v128 = &selRef_vibrateStart;
      if (xpc_get_type(v126) == (xpc_type_t)&_xpc_type_string)
      {
        v133 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "commandLineArgs"));
        v132 = (void *)objc_claimAutoreleasedReturnValue(v133);
      }
      else
      {
        v129 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v130 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v130, "stdoutWrite:", CFSTR("Invalid flag argument type."));

        v131 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v131, "log:", CFSTR("Invalid flag argument type."));

        v132 = 0;
      }
    }
    else
    {
      v132 = 0;
      v128 = &selRef_vibrateStart;
    }

    v134 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v135 = objc_msgSend(objc_retainAutorelease(v132), "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v634 = "commandLineArgs";
      *(_WORD *)&v634[8] = 2080;
      v635 = v135;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);
    }

    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
    v137 = objc_retainAutorelease(v132);
    objc_msgSend(v136, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "commandLineArgs", objc_msgSend(v137, "UTF8String"));

    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
    v139 = objc_retainAutorelease(v137);
    objc_msgSend(v138, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "commandLineArgs", objc_msgSend(v139, "UTF8String"));

    obj = v139;
    objc_msgSend(0, "isEqualToString:", v139);
    v140 = v616;
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory"));
    v142 = xpc_dictionary_get_value(v8, "baseDirectory");
    v143 = (void *)objc_claimAutoreleasedReturnValue(v142);
    v144 = v143;
    if (v143)
    {
      if (xpc_get_type(v143) == (xpc_type_t)&_xpc_type_string)
      {
        v148 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "baseDirectory"));
        v147 = (void *)objc_claimAutoreleasedReturnValue(v148);
        -[SystemDiagnostic setBaseDirectory:](v616, "setBaseDirectory:", v147);
      }
      else
      {
        v145 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
        }

        v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
        objc_msgSend(v146, "stdoutWrite:", CFSTR("Invalid flag argument type."));

        v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
        objc_msgSend(v147, "log:", CFSTR("Invalid flag argument type."));
        v140 = v616;
      }

    }
    v149 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v150 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v140, "baseDirectory")));
      v151 = objc_msgSend(v150, "UTF8String");
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v634 = "baseDirectory";
      *(_WORD *)&v634[8] = 2080;
      v635 = v151;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);

    }
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
    v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v140, "baseDirectory")));
    objc_msgSend(v152, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "baseDirectory", objc_msgSend(v153, "UTF8String"));

    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
    v155 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory")));
    v156 = v616;
    objc_msgSend(v154, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "baseDirectory", objc_msgSend(v155, "UTF8String"));

    v157 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory"));
    if ((objc_msgSend(v141, "isEqualToString:", v157) & 1) == 0 && v141)
    {
      v158 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory"));

      if (!v158)
      {
LABEL_135:

        if (!xpc_dictionary_get_string(v8, "baseDirectory"))
          goto LABEL_141;
        v160 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnosticiOS defaultBaseDirectory](v616, "defaultBaseDirectory"));
        v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v160, 1));

        v162 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory"));
        v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v162, 1));
        v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "URLByResolvingSymlinksInPath"));

        v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "absoluteString"));
        v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "absoluteString"));
        v167 = objc_msgSend(v165, "isEqualToString:", v166);

        if ((v167 & 1) != 0)
        {
LABEL_140:

          v156 = v616;
LABEL_141:
          v172 = -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback");
          v173 = xpc_dictionary_get_value(v8, "shouldDisplayBannerUI");
          v174 = (void *)objc_claimAutoreleasedReturnValue(v173);
          v175 = v174;
          if (v174)
          {
            if (xpc_get_type(v174) == (xpc_type_t)&_xpc_type_BOOL)
            {
              -[SystemDiagnostic setDeShowFeedback:](v156, "setDeShowFeedback:", xpc_dictionary_get_BOOL(v8, "shouldDisplayBannerUI"));
            }
            else
            {
              v176 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
              }

              v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v177, "stdoutWrite:", CFSTR("Invalid flag argument type."));

              v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v178, "log:", CFSTR("Invalid flag argument type."));

              v156 = v616;
            }
          }

          v179 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v180 = -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v634 = "shouldDisplayBannerUI";
            *(_WORD *)&v634[8] = 1024;
            LODWORD(v635) = v180;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
          }

          v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          objc_msgSend(v181, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldDisplayBannerUI", -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback"));

          v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          objc_msgSend(v182, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldDisplayBannerUI", -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback"));

          if (v172 != -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback"))
          {
            v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldDisplayBannerUI", v172, -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback")));
            objc_msgSend(v615, "appendString:", v183);

          }
          v184 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v185 = -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback");
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v634 = v185;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "should show UI banner? %d", buf, 8u);
          }

          v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          objc_msgSend(v186, "log:", CFSTR("should show UI banner? %d"), -[SystemDiagnostic deShowFeedback](v156, "deShowFeedback"));

          v187 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v156, "rootPath"));
          v188 = xpc_dictionary_get_value(v8, "rootPath");
          v189 = (void *)objc_claimAutoreleasedReturnValue(v188);
          v190 = v189;
          if (v189)
          {
            if (xpc_get_type(v189) == (xpc_type_t)&_xpc_type_string)
            {
              v194 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "rootPath"));
              v193 = (void *)objc_claimAutoreleasedReturnValue(v194);
              -[SystemDiagnostic setRootPath:](v156, "setRootPath:", v193);
            }
            else
            {
              v191 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
              }

              v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v192, "stdoutWrite:", CFSTR("Invalid flag argument type."));

              v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v193, "log:", CFSTR("Invalid flag argument type."));
              v156 = v616;
            }

          }
          v195 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v196 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v156, "rootPath")));
            v197 = objc_msgSend(v196, "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v634 = "rootPath";
            *(_WORD *)&v634[8] = 2080;
            v635 = v197;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);

          }
          v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          v199 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v156, "rootPath")));
          objc_msgSend(v198, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "rootPath", objc_msgSend(v199, "UTF8String"));

          v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          v201 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v616, "rootPath")));
          v202 = v616;
          objc_msgSend(v200, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "rootPath", objc_msgSend(v201, "UTF8String"));

          v203 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v616, "rootPath"));
          if ((objc_msgSend(v187, "isEqualToString:", v203) & 1) == 0 && v187)
          {
            v204 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v616, "rootPath"));

            if (!v204)
              goto LABEL_167;
            v205 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic rootPath](v616, "rootPath"));
            v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %@ to %@\n"), "rootPath", v187, v205));

            objc_msgSend(v615, "appendString:", v203);
          }

LABEL_167:
          v206 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v616, "archiveName"));
          v207 = xpc_dictionary_get_value(v8, "archiveName");
          v208 = (void *)objc_claimAutoreleasedReturnValue(v207);
          v209 = v208;
          if (v208)
          {
            if (xpc_get_type(v208) == (xpc_type_t)&_xpc_type_string)
            {
              v213 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "archiveName"));
              v212 = (void *)objc_claimAutoreleasedReturnValue(v213);
              -[SystemDiagnostic setArchiveName:](v616, "setArchiveName:", v212);
            }
            else
            {
              v210 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
              }

              v211 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v211, "stdoutWrite:", CFSTR("Invalid flag argument type."));

              v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v212, "log:", CFSTR("Invalid flag argument type."));
              v202 = v616;
            }

          }
          v214 = &_os_log_default;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v215 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v202, "archiveName")));
            v216 = objc_msgSend(v215, "UTF8String");
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v634 = "archiveName";
            *(_WORD *)&v634[8] = 2080;
            v635 = v216;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);

          }
          v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          v218 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v202, "archiveName")));
          objc_msgSend(v217, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "archiveName", objc_msgSend(v218, "UTF8String"));

          v219 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
          v220 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v616, "archiveName")));
          v221 = v616;
          objc_msgSend(v219, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "archiveName", objc_msgSend(v220, "UTF8String"));

          v222 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v616, "archiveName"));
          if ((objc_msgSend(v206, "isEqualToString:", v222) & 1) == 0 && v206)
          {
            v223 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v616, "archiveName"));

            if (!v223)
              goto LABEL_181;
            v224 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](v616, "archiveName"));
            v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %@ to %@\n"), "archiveName", v206, v224));

            objc_msgSend(v615, "appendString:", v222);
          }

LABEL_181:
          v225 = xpc_dictionary_get_value(v8, "shouldCollectAllTrusted");
          v226 = (void *)objc_claimAutoreleasedReturnValue(v225);

          if (v226)
          {
            v228 = xpc_dictionary_get_BOOL(v8, "shouldCollectAllTrusted");
            v229 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
            v230 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
            objc_msgSend(v229, "setCollectAllTrusted:forDiagnosticID:", v228, v230);

            v221 = v616;
          }
          v231 = objc_opt_class(NSSet, v227);
          v233 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v231, objc_opt_class(NSString, v232), 0);
          v234 = objc_claimAutoreleasedReturnValue(v233);
          length = 0;
          data = xpc_dictionary_get_data(v8, "remoteUUIDs", &length);
          v617 = (void *)v234;
          if (data
            && (v236 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, length))) != 0)
          {
            v237 = (void *)v236;
            v626 = 0;
            v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v234, v236, &v626));
            v239 = v626;
            v240 = v239;
            if (!v238)
            {
              v493 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v494 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "localizedDescription"));
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "remoteUUIDs";
                *(_WORD *)&v634[8] = 2112;
                v635 = v494;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);

              }
              v495 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              v496 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "localizedDescription"));
              objc_msgSend(v495, "log:", CFSTR("Error fetching key '%s': %@"), "remoteUUIDs", v496);

              v238 = 0;
              v247 = 0;
              v221 = v616;
LABEL_192:

              v248 = xpc_dictionary_get_value(v8, "coSysdiagnoseOnly");
              v249 = (void *)objc_claimAutoreleasedReturnValue(v248);

              v45 = v614;
              if (v249)
              {
                v250 = xpc_dictionary_get_BOOL(v8, "coSysdiagnoseOnly");
                if (v250)
                {
                  v251 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v616, "diagnosticID"));
                  v252 = sub_100032DF4(v251, (uint64_t)v247);

                  if ((v252 & 1) == 0)
                  {
                    v489 = &_os_log_default;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "coSysdiagnoseOnly requested, but no co-sysdiagnoses available to collect - terminating", buf, 2u);
                    }

                    v490 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                    objc_msgSend(v490, "log:", CFSTR("coSysdiagnoseOnly requested, but no co-sysdiagnoses available to collect - terminating"));

                    *v613 = 4;
                    v491 = sub_100026BC4();
                    v492 = objc_claimAutoreleasedReturnValue(v491);
                    v36 = v616;
                    if (os_signpost_enabled(v492))
                    {
                      *(_WORD *)buf = 0;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v492, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
                    }

                    v9 = 0;
                    goto LABEL_487;
                  }
                }
                -[SystemDiagnostic setCoSysdiagnoseOnly:](v616, "setCoSysdiagnoseOnly:", v250);
                v253 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v634 = v250;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d", buf, 8u);
                }

                v254 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v254, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d"), v250);

                v255 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v255, "log:", CFSTR("sysdiagnose XPC dictionary: Set coSysdiagnoseOnly to value %d"), v250);

                v221 = v616;
              }
              v256 = xpc_dictionary_get_value(v8, "coSysdiagnose");
              v257 = (void *)objc_claimAutoreleasedReturnValue(v256);

              if (v257)
              {
                if (xpc_dictionary_get_BOOL(v8, "coSysdiagnose"))
                  v258 = 2;
                else
                  v258 = 1;
                -[SystemDiagnostic setCoSysdiagnose:](v221, "setCoSysdiagnose:", v258);
                v259 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v260 = -[SystemDiagnostic coSysdiagnose](v221, "coSysdiagnose");
                  *(_DWORD *)buf = 134217984;
                  *(_QWORD *)v634 = v260;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld", buf, 0xCu);
                }

                v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v261, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld"), -[SystemDiagnostic coSysdiagnose](v221, "coSysdiagnose"));

                v262 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v262, "log:", CFSTR("sysdiagnose XPC dictionary: Set coSysdiagnose to value %ld"), -[SystemDiagnostic coSysdiagnose](v221, "coSysdiagnose"));

              }
              v611 = v247;
              v263 = -[SystemDiagnostic generatePlist](v221, "generatePlist");
              v264 = xpc_dictionary_get_value(v8, "generatePlist");
              v265 = (void *)objc_claimAutoreleasedReturnValue(v264);
              v266 = v265;
              if (v265)
              {
                if (xpc_get_type(v265) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setGeneratePlist:](v221, "setGeneratePlist:", xpc_dictionary_get_BOOL(v8, "generatePlist"));
                }
                else
                {
                  v267 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v268 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v268, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v269 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v269, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v270 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v271 = -[SystemDiagnostic generatePlist](v221, "generatePlist");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "generatePlist";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v271;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v272 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v272, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "generatePlist", -[SystemDiagnostic generatePlist](v221, "generatePlist"));

              v273 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v273, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "generatePlist", -[SystemDiagnostic generatePlist](v221, "generatePlist"));

              if (v263 != -[SystemDiagnostic generatePlist](v221, "generatePlist"))
              {
                v274 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "generatePlist", v263, -[SystemDiagnostic generatePlist](v221, "generatePlist")));
                objc_msgSend(v615, "appendString:", v274);

              }
              v275 = -[SystemDiagnostic quickMode](v221, "quickMode");
              v276 = xpc_dictionary_get_value(v8, "quickMode");
              v277 = (void *)objc_claimAutoreleasedReturnValue(v276);
              v278 = v277;
              if (v277)
              {
                if (xpc_get_type(v277) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setQuickMode:](v221, "setQuickMode:", xpc_dictionary_get_BOOL(v8, "quickMode"));
                }
                else
                {
                  v279 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v280 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v280, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v281, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v282 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v283 = -[SystemDiagnostic quickMode](v221, "quickMode");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "quickMode";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v283;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v284 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v284, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "quickMode", -[SystemDiagnostic quickMode](v221, "quickMode"));

              v285 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v285, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "quickMode", -[SystemDiagnostic quickMode](v221, "quickMode"));

              if (v275 != -[SystemDiagnostic quickMode](v221, "quickMode"))
              {
                v286 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "quickMode", v275, -[SystemDiagnostic quickMode](v221, "quickMode")));
                objc_msgSend(v615, "appendString:", v286);

              }
              v287 = -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall");
              v288 = xpc_dictionary_get_value(v8, "shouldDisplayTarBall");
              v289 = (void *)objc_claimAutoreleasedReturnValue(v288);
              v290 = v289;
              if (v289)
              {
                if (xpc_get_type(v289) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldDisplayTarBall:](v221, "setShouldDisplayTarBall:", xpc_dictionary_get_BOOL(v8, "shouldDisplayTarBall"));
                }
                else
                {
                  v291 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v292 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v292, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v293 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v293, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v294 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v295 = -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldDisplayTarBall";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v295;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v296 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v296, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldDisplayTarBall", -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall"));

              v297 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v297, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldDisplayTarBall", -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall"));

              if (v287 != -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall"))
              {
                v298 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldDisplayTarBall", v287, -[SystemDiagnostic shouldDisplayTarBall](v221, "shouldDisplayTarBall")));
                objc_msgSend(v615, "appendString:", v298);

              }
              v299 = -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall");
              v300 = xpc_dictionary_get_value(v8, "shouldCreateTarBall");
              v301 = (void *)objc_claimAutoreleasedReturnValue(v300);
              v302 = v301;
              if (v301)
              {
                if (xpc_get_type(v301) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldCreateTarBall:](v221, "setShouldCreateTarBall:", xpc_dictionary_get_BOOL(v8, "shouldCreateTarBall"));
                }
                else
                {
                  v303 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v304 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v304, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v305 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v305, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v306 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v307 = -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldCreateTarBall";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v307;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v308 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v308, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldCreateTarBall", -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall"));

              v309 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v309, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldCreateTarBall", -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall"));

              if (v299 != -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall"))
              {
                v310 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldCreateTarBall", v299, -[SystemDiagnostic shouldCreateTarBall](v221, "shouldCreateTarBall")));
                objc_msgSend(v615, "appendString:", v310);

              }
              v311 = -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks");
              v312 = xpc_dictionary_get_value(v8, "shouldRunLogCopyTasks");
              v313 = (void *)objc_claimAutoreleasedReturnValue(v312);
              v314 = v313;
              if (v313)
              {
                if (xpc_get_type(v313) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldRunLogCopyTasks:](v221, "setShouldRunLogCopyTasks:", xpc_dictionary_get_BOOL(v8, "shouldRunLogCopyTasks"));
                }
                else
                {
                  v315 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v316 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v316, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v317 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v317, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v318 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v319 = -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldRunLogCopyTasks";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v319;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v320 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v320, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunLogCopyTasks", -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks"));

              v321 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v321, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunLogCopyTasks", -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks"));

              if (v311 != -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks"))
              {
                v322 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldRunLogCopyTasks", v311, -[SystemDiagnostic shouldRunLogCopyTasks](v221, "shouldRunLogCopyTasks")));
                objc_msgSend(v615, "appendString:", v322);

              }
              v323 = -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks");
              v324 = xpc_dictionary_get_value(v8, "shouldRunLogGenerationTasks");
              v325 = (void *)objc_claimAutoreleasedReturnValue(v324);
              v326 = v325;
              if (v325)
              {
                if (xpc_get_type(v325) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldRunLogGenerationTasks:](v221, "setShouldRunLogGenerationTasks:", xpc_dictionary_get_BOOL(v8, "shouldRunLogGenerationTasks"));
                }
                else
                {
                  v327 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v328 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v328, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v329 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v329, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v330 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v331 = -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldRunLogGenerationTasks";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v331;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v332 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v332, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunLogGenerationTasks", -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks"));

              v333 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v333, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunLogGenerationTasks", -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks"));

              if (v323 != -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks"))
              {
                v334 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldRunLogGenerationTasks", v323, -[SystemDiagnostic shouldRunLogGenerationTasks](v221, "shouldRunLogGenerationTasks")));
                objc_msgSend(v615, "appendString:", v334);

              }
              v335 = -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks");
              v336 = xpc_dictionary_get_value(v8, "shouldRunTimeSensitiveTasks");
              v337 = (void *)objc_claimAutoreleasedReturnValue(v336);
              v338 = v337;
              if (v337)
              {
                if (xpc_get_type(v337) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldRunTimeSensitiveTasks:](v221, "setShouldRunTimeSensitiveTasks:", xpc_dictionary_get_BOOL(v8, "shouldRunTimeSensitiveTasks"));
                }
                else
                {
                  v339 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v340 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v340, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v341 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v341, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v342 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v343 = -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldRunTimeSensitiveTasks";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v343;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v344 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v344, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunTimeSensitiveTasks", -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks"));

              v345 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v345, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunTimeSensitiveTasks", -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks"));

              if (v335 != -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks"))
              {
                v346 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldRunTimeSensitiveTasks", v335, -[SystemDiagnostic shouldRunTimeSensitiveTasks](v221, "shouldRunTimeSensitiveTasks")));
                objc_msgSend(v615, "appendString:", v346);

              }
              v347 = -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive");
              v348 = xpc_dictionary_get_value(v8, "shouldRunOSLogArchive");
              v349 = (void *)objc_claimAutoreleasedReturnValue(v348);
              v350 = v349;
              if (v349)
              {
                if (xpc_get_type(v349) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldRunOSLogArchive:](v221, "setShouldRunOSLogArchive:", xpc_dictionary_get_BOOL(v8, "shouldRunOSLogArchive"));
                }
                else
                {
                  v351 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v352 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v352, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v353 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v353, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v354 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v355 = -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldRunOSLogArchive";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v355;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v356 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v356, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunOSLogArchive", -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive"));

              v357 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v357, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRunOSLogArchive", -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive"));

              if (v347 != -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive"))
              {
                v358 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldRunOSLogArchive", v347, -[SystemDiagnostic shouldRunOSLogArchive](v221, "shouldRunOSLogArchive")));
                objc_msgSend(v615, "appendString:", v358);

              }
              v359 = -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory");
              v360 = xpc_dictionary_get_value(v8, "shouldRemoveTemporaryDirectory");
              v361 = (void *)objc_claimAutoreleasedReturnValue(v360);
              v362 = v361;
              if (v361)
              {
                if (xpc_get_type(v361) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldRemoveTemporaryDirectory:](v221, "setShouldRemoveTemporaryDirectory:", xpc_dictionary_get_BOOL(v8, "shouldRemoveTemporaryDirectory"));
                }
                else
                {
                  v363 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v364 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v364, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v365 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v365, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v366 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v367 = -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldRemoveTemporaryDirectory";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v367;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v368 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v368, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRemoveTemporaryDirectory", -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory"));

              v369 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v369, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldRemoveTemporaryDirectory", -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory"));

              if (v359 != -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory"))
              {
                v370 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldRemoveTemporaryDirectory", v359, -[SystemDiagnostic shouldRemoveTemporaryDirectory](v221, "shouldRemoveTemporaryDirectory")));
                objc_msgSend(v615, "appendString:", v370);

              }
              v371 = -[SystemDiagnostic verbose](v221, "verbose");
              v372 = xpc_dictionary_get_value(v8, "verbose");
              v373 = (void *)objc_claimAutoreleasedReturnValue(v372);
              v374 = v373;
              if (v373)
              {
                if (xpc_get_type(v373) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setVerbose:](v221, "setVerbose:", xpc_dictionary_get_BOOL(v8, "verbose"));
                }
                else
                {
                  v375 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v376 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v376, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v377 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v377, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v378 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v379 = -[SystemDiagnostic verbose](v221, "verbose");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "verbose";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v379;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v380 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v380, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "verbose", -[SystemDiagnostic verbose](v221, "verbose"));

              v381 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v381, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "verbose", -[SystemDiagnostic verbose](v221, "verbose"));

              if (v371 != -[SystemDiagnostic verbose](v221, "verbose"))
              {
                v382 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "verbose", v371, -[SystemDiagnostic verbose](v221, "verbose")));
                objc_msgSend(v615, "appendString:", v382);

              }
              v383 = -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression");
              v384 = xpc_dictionary_get_value(v8, "useParallelCompression");
              v385 = (void *)objc_claimAutoreleasedReturnValue(v384);
              v386 = v385;
              if (v385)
              {
                if (xpc_get_type(v385) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setUseParallelCompression:](v221, "setUseParallelCompression:", xpc_dictionary_get_BOOL(v8, "useParallelCompression"));
                }
                else
                {
                  v387 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v388 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v388, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v389 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v389, "log:", CFSTR("Invalid flag argument type."));

                  v221 = v616;
                }
              }

              v390 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v391 = -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "useParallelCompression";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v391;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v392 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v392, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "useParallelCompression", -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression"));

              v393 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v393, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "useParallelCompression", -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression"));

              if (v383 != -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression"))
              {
                v394 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "useParallelCompression", v383, -[SystemDiagnostic useParallelCompression](v221, "useParallelCompression")));
                objc_msgSend(v615, "appendString:", v394);

              }
              v395 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
              v396 = objc_msgSend(v395, "shouldGatherBTLogs");

              v397 = xpc_dictionary_get_value(v8, "shouldGatherBTLogs");
              v398 = (void *)objc_claimAutoreleasedReturnValue(v397);
              v399 = v398;
              if (v398)
              {
                if (xpc_get_type(v398) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  v403 = xpc_dictionary_get_BOOL(v8, "shouldGatherBTLogs");
                  v402 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
                  objc_msgSend(v402, "setShouldGatherBTLogs:", v403);
                }
                else
                {
                  v400 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v401 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v401, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v402 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v402, "log:", CFSTR("Invalid flag argument type."));
                }

              }
              v404 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v405 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
                v406 = objc_msgSend(v405, "shouldGatherBTLogs");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldGatherBTLogs";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v406;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);

              }
              v407 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              v408 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
              objc_msgSend(v407, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldGatherBTLogs", objc_msgSend(v408, "shouldGatherBTLogs"));

              v409 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              v410 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
              objc_msgSend(v409, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldGatherBTLogs", objc_msgSend(v410, "shouldGatherBTLogs"));

              v411 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
              LODWORD(v410) = objc_msgSend(v411, "shouldGatherBTLogs");

              if (v396 != (_DWORD)v410)
              {
                v412 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
                v413 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldGatherBTLogs", v396, objc_msgSend(v412, "shouldGatherBTLogs")));

                objc_msgSend(v615, "appendString:", v413);
              }
              string = xpc_dictionary_get_string(v8, "onlyRunContainersWithNames");
              v415 = v616;
              if (string)
              {
                v416 = string;
                v417 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
                -[SystemDiagnostic createOnlyRunContainersWithNamesArray:](v616, "createOnlyRunContainersWithNamesArray:", v417);

                v418 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)v634 = v416;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s", buf, 0xCu);
                }

                v419 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v419, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s"), v416);

                v420 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v420, "log:", CFSTR("sysdiagnose XPC dictionary: Set onlyRunContainersWithNames array from string %s"), v416);

                v415 = v616;
              }
              if (!-[SystemDiagnostic shouldRemoveTemporaryDirectory](v415, "shouldRemoveTemporaryDirectory"))
              {
                v421 = &_os_log_default;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling streaming as we are not removing the temporary directory", buf, 2u);
                }

                v422 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                objc_msgSend(v422, "log:", CFSTR("Disabling streaming as we are not removing the temporary directory"));

                -[SystemDiagnostic setDisableStreamTar:](v415, "setDisableStreamTar:", 1);
              }
              v423 = -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData");
              v424 = xpc_dictionary_get_value(v8, "shouldGetFeedbackData");
              v425 = (void *)objc_claimAutoreleasedReturnValue(v424);
              v426 = v425;
              if (v425)
              {
                if (xpc_get_type(v425) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setShouldGetFeedbackData:](v415, "setShouldGetFeedbackData:", xpc_dictionary_get_BOOL(v8, "shouldGetFeedbackData"));
                }
                else
                {
                  v427 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v428 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v428, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v429 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v429, "log:", CFSTR("Invalid flag argument type."));

                  v415 = v616;
                }
              }

              v430 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v431 = -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "shouldGetFeedbackData";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v431;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v432 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v432, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldGetFeedbackData", -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData"));

              v433 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v433, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "shouldGetFeedbackData", -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData"));

              if (v423 != -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData"))
              {
                v434 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "shouldGetFeedbackData", v423, -[SystemDiagnostic shouldGetFeedbackData](v415, "shouldGetFeedbackData")));
                objc_msgSend(v615, "appendString:", v434);

              }
              v435 = -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar");
              v436 = xpc_dictionary_get_value(v8, "disableStreamTar");
              v437 = (void *)objc_claimAutoreleasedReturnValue(v436);
              v438 = v437;
              if (v437)
              {
                if (xpc_get_type(v437) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setDisableStreamTar:](v415, "setDisableStreamTar:", xpc_dictionary_get_BOOL(v8, "disableStreamTar"));
                }
                else
                {
                  v439 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v440 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v440, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v441 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v441, "log:", CFSTR("Invalid flag argument type."));

                  v415 = v616;
                }
              }

              v442 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v443 = -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "disableStreamTar";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v443;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v444 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v444, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "disableStreamTar", -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar"));

              v445 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v445, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "disableStreamTar", -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar"));

              if (v435 != -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar"))
              {
                v446 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "disableStreamTar", v435, -[SystemDiagnostic disableStreamTar](v415, "disableStreamTar")));
                objc_msgSend(v615, "appendString:", v446);

              }
              v447 = -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback");
              v448 = xpc_dictionary_get_value(v8, "disableUIFeedback");
              v449 = (void *)objc_claimAutoreleasedReturnValue(v448);
              v450 = v449;
              if (v449)
              {
                if (xpc_get_type(v449) == (xpc_type_t)&_xpc_type_BOOL)
                {
                  -[SystemDiagnostic setDisableUIFeedback:](v415, "setDisableUIFeedback:", xpc_dictionary_get_BOOL(v8, "disableUIFeedback"));
                }
                else
                {
                  v451 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                  }

                  v452 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v452, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                  v453 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
                  objc_msgSend(v453, "log:", CFSTR("Invalid flag argument type."));

                  v415 = v616;
                }
              }

              v454 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v455 = -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback");
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "disableUIFeedback";
                *(_WORD *)&v634[8] = 1024;
                LODWORD(v635) = v455;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
              }

              v456 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v456, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "disableUIFeedback", -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback"));

              v457 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v457, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "disableUIFeedback", -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback"));

              if (v447 != -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback"))
              {
                v458 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "disableUIFeedback", v447, -[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback")));
                objc_msgSend(v615, "appendString:", v458);

              }
              if (-[SystemDiagnostic disableUIFeedback](v415, "disableUIFeedback"))
                -[SystemDiagnostic setShouldDisplayTarBall:](v415, "setShouldDisplayTarBall:", 0);
              v459 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
              objc_msgSend(v459, "setNoTimeout:", xpc_dictionary_get_BOOL(v8, "setNoTimeOut"));

              v461 = objc_opt_class(NSMutableArray, v460);
              v463 = objc_opt_class(NSArray, v462);
              v465 = objc_opt_class(NSString, v464);
              v467 = objc_opt_class(NSMutableDictionary, v466);
              v469 = objc_opt_class(NSDictionary, v468);
              v471 = objc_opt_class(NSNumber, v470);
              v473 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v461, v463, v465, v467, v469, v471, objc_opt_class(NSNull, v472), 0);
              v474 = (void *)objc_claimAutoreleasedReturnValue(v473);

              length = 0;
              v475 = xpc_dictionary_get_data(v8, "capOverride", &length);
              if (v475)
              {
                v476 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v475, length));
                if (v476)
                {
                  v477 = (void *)v476;
                  v625 = 0;
                  v478 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v474, v476, &v625));
                  v479 = v625;
                  v480 = v479;
                  if (v478)
                  {

                    v482 = objc_opt_class(NSDictionary, v481);
                    if ((objc_opt_isKindOfClass(v478, v482) & 1) != 0)
                    {
                      v483 = v478;
                      v484 = &_os_log_default;
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 136315394;
                        *(_QWORD *)v634 = "capOverride";
                        *(_WORD *)&v634[8] = 2112;
                        v635 = v483;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
                      }

                      v485 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                      objc_msgSend(v485, "log:", CFSTR("Setting %s to %@"), "capOverride", v483);

                      -[SystemDiagnostic setCapOverride:](v616, "setCapOverride:", v483);
LABEL_392:
                      v501 = xpc_dictionary_get_value(v8, "capOverrideFullLogarchive");
                      v502 = (void *)objc_claimAutoreleasedReturnValue(v501);
                      v503 = v502;
                      if (v502)
                      {
                        if (xpc_get_type(v502) == (xpc_type_t)&_xpc_type_BOOL)
                        {
                          v507 = xpc_dictionary_get_BOOL(v8, "capOverrideFullLogarchive");
LABEL_399:

                          v508 = &_os_log_default;
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 136315394;
                            *(_QWORD *)v634 = "capOverrideFullLogarchive";
                            *(_WORD *)&v634[8] = 1024;
                            LODWORD(v635) = v507;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to BOOL %d", buf, 0x12u);
                          }

                          v509 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                          objc_msgSend(v509, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "capOverrideFullLogarchive", v507);

                          v510 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                          objc_msgSend(v510, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to BOOL %d"), "capOverrideFullLogarchive", v507);

                          if (v507)
                          {
                            v511 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %d to %d\n"), "capOverrideFullLogarchive", 0, 1));
                            objc_msgSend(v615, "appendString:", v511);

                            v512 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic capOverride](v616, "capOverride"));
                            if (v512)
                            {
                              v513 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic capOverride](v616, "capOverride"));
                              v514 = (NSMutableDictionary *)objc_msgSend(v513, "mutableCopy");

                            }
                            else
                            {
                              v514 = objc_opt_new(NSMutableDictionary);
                            }
                            v636[0] = CFSTR("filename");
                            v636[1] = OSLogConstructPersistSizeLimit;
                            v637[0] = CFSTR("system_logs_full.logarchive");
                            v637[1] = &off_1000ACE48;
                            v636[2] = OSLogConstructSpecialSizeLimit;
                            v636[3] = OSLogConstructSignpostSizeLimit;
                            v637[2] = &off_1000ACE48;
                            v637[3] = &off_1000ACE48;
                            v636[4] = OSLogConstructHighVolumeSizeLimit;
                            v636[5] = OSLogConstructPersistAgeLimit;
                            v637[4] = &off_1000ACE48;
                            v637[5] = &off_1000ACE48;
                            v636[6] = OSLogConstructSpecialAgeLimit;
                            v636[7] = OSLogConstructSignpostAgeLimit;
                            v637[6] = &off_1000ACE48;
                            v637[7] = &off_1000ACE48;
                            v636[8] = OSLogConstructHighVolumeAgeLimit;
                            v636[9] = CFSTR("timeout");
                            v637[8] = &off_1000ACE48;
                            v637[9] = &off_1000ACE60;
                            v515 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v637, v636, 10));
                            -[NSMutableDictionary setObject:forKeyedSubscript:](v514, "setObject:forKeyedSubscript:", v515, CFSTR("logarchive"));
                            v516 = -[NSMutableDictionary copy](v514, "copy");
                            -[SystemDiagnostic setCapOverride:](v616, "setCapOverride:", v516);

                          }
                          v517 = v616;
                          v518 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v616, "warnProcessAllowlist"));
                          v519 = xpc_dictionary_get_value(v8, "warnProcAllowlist");
                          v520 = (void *)objc_claimAutoreleasedReturnValue(v519);
                          v521 = v520;
                          if (v520)
                          {
                            if (xpc_get_type(v520) == (xpc_type_t)&_xpc_type_string)
                            {
                              v525 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_dictionary_get_string(v8, "warnProcAllowlist"));
                              v524 = (void *)objc_claimAutoreleasedReturnValue(v525);
                              -[SystemDiagnostic setWarnProcessAllowlist:](v616, "setWarnProcessAllowlist:", v524);
                            }
                            else
                            {
                              v522 = &_os_log_default;
                              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                              }

                              v523 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                              objc_msgSend(v523, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                              v524 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                              objc_msgSend(v524, "log:", CFSTR("Invalid flag argument type."));
                              v517 = v616;
                            }

                          }
                          v526 = &_os_log_default;
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                          {
                            v527 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v517, "warnProcessAllowlist")));
                            v528 = objc_msgSend(v527, "UTF8String");
                            *(_DWORD *)buf = 136315394;
                            *(_QWORD *)v634 = "warnProcAllowlist";
                            *(_WORD *)&v634[8] = 2080;
                            v635 = v528;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sysdiagnose XPC dictionary: Set %s to string %s", buf, 0x16u);

                          }
                          v529 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                          v530 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v517, "warnProcessAllowlist")));
                          objc_msgSend(v529, "stdoutWrite:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "warnProcAllowlist", objc_msgSend(v530, "UTF8String"));

                          v531 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                          v532 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v616, "warnProcessAllowlist")));
                          v63 = v616;
                          objc_msgSend(v531, "log:", CFSTR("sysdiagnose XPC dictionary: Set %s to string %s"), "warnProcAllowlist", objc_msgSend(v532, "UTF8String"));

                          v533 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v616, "warnProcessAllowlist"));
                          if ((objc_msgSend(v518, "isEqualToString:", v533) & 1) == 0 && v518)
                          {
                            v534 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v616, "warnProcessAllowlist"));

                            if (!v534)
                            {
LABEL_420:

                              v64 = v613;
                              v45 = v614;
                              goto LABEL_421;
                            }
                            v535 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](v616, "warnProcessAllowlist"));
                            v533 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %@ to %@\n"), "warnProcAllowlist", v518, v535));

                            objc_msgSend(v615, "appendString:", v533);
                          }

                          goto LABEL_420;
                        }
                        v504 = &_os_log_default;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid flag argument type.", buf, 2u);
                        }

                        v505 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                        objc_msgSend(v505, "stdoutWrite:", CFSTR("Invalid flag argument type."));

                        v506 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                        objc_msgSend(v506, "log:", CFSTR("Invalid flag argument type."));

                      }
                      v507 = 0;
                      goto LABEL_399;
                    }
LABEL_391:

                    v483 = 0;
                    goto LABEL_392;
                  }
                  v497 = &_os_log_default;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v498 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480, "localizedDescription"));
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)v634 = "capOverride";
                    *(_WORD *)&v634[8] = 2112;
                    v635 = v498;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error fetching key '%s': %@", buf, 0x16u);

                  }
                  v499 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
                  v500 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v480, "localizedDescription"));
                  objc_msgSend(v499, "log:", CFSTR("Error fetching key '%s': %@"), "capOverride", v500);

                }
              }
              v478 = 0;
              goto LABEL_391;
            }

            v242 = objc_opt_class(NSSet, v241);
            if ((objc_opt_isKindOfClass(v238, v242) & 1) != 0)
            {
              v243 = v238;
              v244 = &_os_log_default;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v634 = "remoteUUIDs";
                *(_WORD *)&v634[8] = 2112;
                v635 = v243;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Setting %s to %@", buf, 0x16u);
              }

              v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
              objc_msgSend(v245, "log:", CFSTR("Setting %s to %@"), "remoteUUIDs", v243);

              v238 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
              v246 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v221, "diagnosticID"));
              objc_msgSend(v238, "setRemoteUUIDs:forDiagnosticID:", v243, v246);

              v247 = v243;
              goto LABEL_192;
            }
          }
          else
          {
            v238 = 0;
          }
          v247 = 0;
          goto LABEL_192;
        }
        v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        LOBYTE(length) = 0;
        v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "path"));
        v170 = objc_msgSend(v168, "fileExistsAtPath:isDirectory:", v169, &length);
        v171 = length;

        if (v170 && v171)
        {

          goto LABEL_140;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Specified output directory does not exist.", buf, 2u);
        }
        v486 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128 + 372, "sharedResourceManager"));
        objc_msgSend(v486, "log:", CFSTR("Specified output directory does not exist."));

        *v613 = 1;
        v487 = sub_100026BC4();
        v488 = objc_claimAutoreleasedReturnValue(v487);
        v45 = v614;
        if (os_signpost_enabled(v488))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v488, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "doSDSetup", "[do_sysdiagnose] setup/parse input ended!", buf, 2u);
        }

LABEL_378:
        v9 = 0;
        v36 = v616;
LABEL_487:

        goto LABEL_488;
      }
      v159 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](v616, "baseDirectory"));
      v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Property %s changed from default %@ to %@\n"), "baseDirectory", v141, v159));

      objc_msgSend(v615, "appendString:", v157);
    }

    goto LABEL_135;
  }
  v9 = 0;
  *a4 = 5;
LABEL_488:

  return v9;
}

void sub_10003C098(uint64_t a1, void *a2)
{
  id v3;
  pid_t pid;
  unsigned int v5;
  _BOOL4 v6;
  xpc_type_t type;
  void *v8;
  void *v9;
  const __CFString *v10;
  xpc_object_t reply;
  void *v12;
  id v13;
  const char *string;
  void *v15;
  uint64_t v16;
  _OWORD buffer[8];
  uint64_t v18;

  v3 = a2;
  if ((sub_100045BC0(*(void **)(a1 + 40), CFSTR("com.apple.private.sysdiagnose")) & 1) != 0)
    goto LABEL_8;
  pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  v18 = 0;
  memset(buffer, 0, sizeof(buffer));
  v5 = proc_pidinfo(pid, 3, 0, buffer, 136);
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v5 > 0x87)
  {
    if (v6)
      sub_100060938();
  }
  else if (v6)
  {
    sub_1000608C0();
  }
  if ((sub_100045E60() & 1) != 0)
  {
LABEL_8:
    type = xpc_get_type(v3);
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      reply = xpc_dictionary_create_reply(v3);
      if (reply)
      {
        v12 = reply;
        v13 = sub_100032FC0(*(void **)(a1 + 40), v3, reply);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v12);
LABEL_24:

        goto LABEL_25;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ignoring message: unable to create reply", (uint8_t *)buffer, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v9 = v8;
      v10 = CFSTR("Ignoring message: unable to create reply");
LABEL_23:
      objc_msgSend(v8, "stdoutWrite:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v12, "log:", v10, v16);
      goto LABEL_24;
    }
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buffer[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "unexpected peer event", (uint8_t *)buffer, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v9 = v8;
      v10 = CFSTR("unexpected peer event");
      goto LABEL_23;
    }
    if (v3 != &_xpc_error_connection_invalid)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        LODWORD(buffer[0]) = 136315138;
        *(_QWORD *)((char *)buffer + 4) = string;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "peer error: %s", (uint8_t *)buffer, 0xCu);
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v15, "stdoutWrite:", CFSTR("peer error: %s"), xpc_dictionary_get_string(v3, _xpc_error_key_description));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v12, "log:", CFSTR("peer error: %s"), xpc_dictionary_get_string(v3, _xpc_error_key_description));
      goto LABEL_24;
    }
  }
  else
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
  }
LABEL_25:

}

uint64_t sub_10003C3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

BOOL sub_10003C3D8(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

double sub_10003C3EC(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10003C410(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

void sub_10003C45C(id a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v10 = 0;
  v1 = objc_claimAutoreleasedReturnValue(+[LWCR withVersion:withConstraintCategory:withRequirements:withError:](LWCR, "withVersion:withConstraintCategory:withRequirements:withError:", 1, 17, 0, &v10));
  v2 = v10;
  v3 = (void *)qword_1000B9888;
  qword_1000B9888 = v1;

  if (!qword_1000B9888)
  {
    v4 = sub_100026C34();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
      v7 = objc_msgSend(v6, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to generate launch constraint: %s", buf, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description")));
    objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to generate launch constraint: %s"), objc_msgSend(v9, "UTF8String"));

    if (!qword_1000B9888)
      sub_1000609BC();
  }

}

void sub_10003CB0C(id a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = open("/dev/null", 2);
  if ((_DWORD)v1 == -1)
    sub_1000609E4();
  v2 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:", v1);
  v3 = (void *)qword_1000B98A0;
  qword_1000B98A0 = (uint64_t)v2;

  if (!qword_1000B98A0)
    sub_100060A0C();
}

void sub_10003E350(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf, int a14, __int16 a15, __int16 a16, void *a17)
{
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if (a2 == 1)
  {
    v18 = objc_begin_catch(a1);
    v19 = sub_100026C34();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionLine"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reason"));
      LODWORD(buf) = 138412802;
      *(_QWORD *)((char *)&buf + 4) = v23;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v24;
      a16 = 2112;
      a17 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Error '%@' while attempting to run '%@': '%@'", (uint8_t *)&buf, 0x20u);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionLine"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "reason"));
    objc_msgSend(v21, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error '%@' while attempting to run '%@': '%@'"));

    objc_end_catch();
    JUMPOUT(0x10003E344);
  }
  _Unwind_Resume(a1);
}

void sub_10003F2AC(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 buf,int a22,__int16 a23,__int16 a24,id a25,__int128 a26)
{
  void *v26;
  void *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  if (a2 == 1)
  {
    v42 = objc_begin_catch(a1);
    v27 = sub_100026C34();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchPath"));
      v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "lastPathComponent"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stdoutPath"));
      v33 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lastPathComponent"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "reason"));
      LODWORD(buf) = 138413058;
      *(_QWORD *)((char *)&buf + 4) = v29;
      WORD6(buf) = 2112;
      *(_QWORD *)((char *)&buf + 14) = v31;
      a24 = 2112;
      a25 = v33;
      LOWORD(a26) = 2112;
      *(_QWORD *)((char *)&a26 + 2) = v34;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Error '%@' while attempting to terminate '%@|%@': %@'", (uint8_t *)&buf, 0x2Au);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "launchPath"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastPathComponent"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stdoutPath"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "reason"));
    objc_msgSend(v35, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Error '%@' while attempting to terminate '%@|%@': %@'"));

    objc_end_catch();
    JUMPOUT(0x10003F1E4);
  }
  _Unwind_Resume(a1);
}

id sub_10003F4A4(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "stop:", (*(_DWORD *)(a1 + 40) + 1));
  return result;
}

void sub_10003FA40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10003FA54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10003FA60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10003FA9C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10003FAF0(id a1)
{
  SDTaskDepot *v1;
  void *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;

  v1 = objc_alloc_init(SDTaskDepot);
  v2 = (void *)qword_1000B98A8;
  qword_1000B98A8 = (uint64_t)v1;

  objc_msgSend((id)qword_1000B98A8, "setOutputDirectory:", 0);
  objc_msgSend((id)qword_1000B98A8, "setMayStartExecuting:", 1);
  objc_msgSend((id)qword_1000B98A8, "setNoTimeout:", 0);
  objc_msgSend((id)qword_1000B98A8, "setTotalTasks:", 0);
  objc_msgSend((id)qword_1000B98A8, "setTotalFailedTasks:", 0);
  objc_msgSend((id)qword_1000B98A8, "setTotalTimeouts:", 0);
  objc_msgSend((id)qword_1000B98A8, "setPushBufferDelegate:", 0);
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = dispatch_queue_create("com.apple.sysdiagnose.SDTaskDepot.taskQueue", v4);
  objc_msgSend((id)qword_1000B98A8, "setTaskQueue:", v5);

  v6 = dispatch_semaphore_create(0);
  objc_msgSend((id)qword_1000B98A8, "setDefaultAllTasksFinishedSemaphore:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend((id)qword_1000B98A8, "setAllTasksFinishedSemaphoresArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend((id)qword_1000B98A8, "setRunningTaskContainers:", v8);

  objc_msgSend((id)qword_1000B98A8, "setNumRunningBlocks:", 0);
  objc_msgSend((id)qword_1000B98A8, "setNumRunningTaskContainers:", 0);
  objc_msgSend((id)qword_1000B98A8, "setMinimumTimeBeforeTimeouts:", 0.0);
  objc_msgSend((id)qword_1000B98A8, "setTaskCompletionBlock:", 0);
}

void sub_100040078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000403FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10004043C(uint64_t a1)
{
  intptr_t result;

  result = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

void sub_1000406D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100040700(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "reapTasks");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += result;
  return result;
}

id sub_100040888(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMayStartExecuting:", 0);
}

void sub_1000411B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000411E4(uint64_t a1)
{
  id result;

  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_execute");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_10004121C(uint64_t a1)
{
  id result;

  objc_msgSend(*(id *)(a1 + 32), "setStartDate:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_execute");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10004140C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100041424(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(void);
  void *v18;
  NSObject *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setBlockUntilFinished:", objc_msgSend(*(id *)(a1 + 32), "runByItself") | objc_msgSend(*(id *)(a1 + 32), "blockUntilFinished"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(*v2, "updateContainerWithOverride");
  if ((objc_msgSend(*v2, "evaluateCollectionFlags") & 1) == 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskCompletionBlock"));

    if (!v16)
      goto LABEL_19;
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "taskCompletionBlock"));
    v17[2]();
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(*v2, "runByItself"))
  {
    v4 = sub_100026C34();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "name"));
      *(_DWORD *)buf = 138412290;
      v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Waiting for other containers to finish before starting %@", buf, 0xCu);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "name"));
    objc_msgSend(v7, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Waiting for other containers to finish before starting %@"), v8);

    objc_msgSend(v3, "waitUntilAllTasksComplete:", 0);
  }
  v9 = *v2;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  LOBYTE(v9) = objc_msgSend(v9, "setStartDate:AndExecuteFromCallback:", v10, 0);

  if ((v9 & 1) == 0)
  {
    v18 = sub_100026C34();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10006148C(v2);

    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "name"));
    objc_msgSend(v17, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Failed to execute %@"), v20);

    goto LABEL_18;
  }
  if (objc_msgSend(*v2, "blockUntilFinished") && objc_msgSend(v3, "mayStartExecuting"))
  {
    v11 = sub_100026C34();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "name"));
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Waiting for container %@ to finish", buf, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v2, "name"));
    objc_msgSend(v14, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Waiting for container %@ to finish"), v15);

    objc_msgSend(v3, "waitUntilAllTasksComplete:", 0);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_19:

}

void sub_100042080(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100042104;
  v5[3] = &unk_100099260;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  os_activity_apply(v2, v5);

}

id sub_100042104(uint64_t a1)
{
  NSObject *v2;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exitSource"));
  dispatch_source_cancel(v2);

  objc_msgSend(*(id *)(a1 + 32), "childExitHandler");
  return objc_msgSend(*(id *)(a1 + 40), "markTaskAsDone:", *(_QWORD *)(a1 + 32));
}

void sub_100042144(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "executionActivity"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000421C8;
  v5[3] = &unk_100099260;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  os_activity_apply(v2, v5);

}

id sub_1000421C8(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRunning");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishChild");
    return objc_msgSend(*(id *)(a1 + 40), "markTaskAsDone:", *(_QWORD *)(a1 + 32));
  }
  return result;
}

void sub_100042678(uint64_t a1)
{
  void (**v1)(void);

  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  v1[2]();

}

void sub_100042C60(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "executionActivity"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100042CD4;
  block[3] = &unk_100098F88;
  block[4] = *(_QWORD *)(a1 + 32);
  os_activity_apply(v2, block);

}

void sub_100042CD4(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setNumTimeouts:", (char *)objc_msgSend(*(id *)(a1 + 32), "numTimeouts") + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v3 = objc_msgSend(*v1, "countCPUTimeUsedNS");
  if ((objc_msgSend(*v1, "isRunningAlone") & 1) != 0
    || (objc_msgSend(*v1, "ranForMaximumTime") & 1) != 0
    || objc_msgSend(*v1, "ranForMinimumTime")
    && objc_msgSend(*v1, "exceededAllowedCPUTime:", v3))
  {
    v4 = sub_100026C34();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100061588(v1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "timeoutMetricsString"));
    objc_msgSend(v6, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("[%@ container] Task(s) timed out: %@"), v7, v8);

    objc_msgSend(*v1, "setNumReapedTasks:", (char *)objc_msgSend(*v1, "reapTasks") + (_QWORD)objc_msgSend(*v1, "numReapedTasks"));
    objc_msgSend(v2, "setTotalTimeouts:", objc_msgSend(v2, "totalTimeouts") + 1);
  }
  else
  {
    objc_msgSend(*v1, "timeout");
    if (v9 > 5.0)
      v9 = 5.0;
    v10 = v9;
    v11 = sub_100026C34();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "timeoutMetricsString"));
      *(_DWORD *)buf = 138412802;
      v19 = v13;
      v20 = 1024;
      v21 = v10;
      v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@", buf, 0x1Cu);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "timeoutMetricsString"));
    objc_msgSend(v15, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("[%@ container] Giving another %us timeout because it hasn't exceeded its minimum CPU and/or wall time: %@"), v16, v10, v17);

    objc_msgSend(*v1, "resetTimeout:", v10);
  }

}

id sub_1000437FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endExecution");
}

void sub_100043804(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "runningTasks"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

id sub_100043844(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endExecution");
}

id sub_100043920(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTasks");
}

id sub_100044024(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  v2 = sub_100026C34();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1000617BC(a1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
  objc_msgSend(v4, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing."), v5);

  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void sub_100044168(uint64_t a1)
{
  id *v1;
  double v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[5];
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;

  v1 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "startTimeout");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100044404;
  v18[3] = &unk_100098F88;
  v18[4] = *v1;
  v2 = sub_1000272CC(v18);
  v3 = sub_100026C34();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2048;
    v22 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ block container executed in %.1f seconds", buf, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
  objc_msgSend(v6, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("%@ block container executed in %.1f seconds"), v7, *(_QWORD *)&v2);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "completionBlock"));
  if (v8)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004445C;
    v17[3] = &unk_100098F88;
    v17[4] = *v1;
    v9 = sub_1000272CC(v17);
    if (v9 > 1.0)
    {
      v10 = sub_100026C34();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100061838(v1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "name"));
      objc_msgSend(v12, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Completion block for %@ took too long: %.1fs (allowed: %.1fs)"), v13, *(_QWORD *)&v9, 0x3FF0000000000000);

    }
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "taskQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000444B8;
  block[3] = &unk_100098F88;
  block[4] = *v1;
  dispatch_sync(v15, block);

}

void sub_100044404(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t (**v4)(void);

  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "block"));
  v2 = v4[2]();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(*(id *)(a1 + 32), "setPaths:", v3);

}

void sub_10004445C(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "completionBlock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "paths"));
  v3[2](v3, v2);

}

id sub_1000444B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "end");
}

void sub_100044768(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  const _xpc_type_s *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  xpc_object_t v31;
  void *v32;
  _xpc_connection_s *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[5];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  const char *string;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    v10 = sub_100026C34();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
      v12 = _xpc_error_key_description;
      *(_DWORD *)buf = 138412546;
      v39 = v34;
      v40 = 2080;
      string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Helper connection error for task %@: %s", buf, 0x16u);

    }
    else
    {
      v12 = _xpc_error_key_description;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
    objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Helper connection error for task %@: %s"), v9, xpc_dictionary_get_string(v3, v12));
  }
  else
  {
    v5 = type;
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      if (xpc_dictionary_get_BOOL(v3, "result"))
      {
        v13 = 1;
        goto LABEL_15;
      }
      v14 = sub_100026C34();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1000619BC(a1);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
      objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Helper connection error for task %@: failure while running task."), v9, v35);
    }
    else
    {
      v6 = sub_100026C34();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100061A38(a1, v5);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
      objc_msgSend(v8, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Helper connection error for task %@: Received unexpected reply with type: %s"), v9, xpc_type_get_name(v5));
    }
  }

  v13 = 0;
LABEL_15:
  v17 = *(void **)(a1 + 32);
  v16 = (id *)(a1 + 32);
  objc_msgSend(v17, "setReply:", v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v16, "replyBlock"));

  if (v18)
  {
    if (!v13)
    {
      v24 = sub_100026C34();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_100061940(v16);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v16, "taskName"));
      objc_msgSend(v22, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Helper connection error for task %@: not calling reply block due to failure"), v23, v35, v36);
      goto LABEL_24;
    }
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100044C40;
    v37[3] = &unk_100098F88;
    v37[4] = *v16;
    v19 = sub_1000272CC(v37);
    if (v19 > 1.0)
    {
      v20 = sub_100026C34();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000618BC(v16);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v16, "taskName"));
      objc_msgSend(v22, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)"), v23, *(_QWORD *)&v19, 0x3FF0000000000000);
LABEL_24:

    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v26, "recordHelperTaskEnd");

  v27 = sub_100026BC4();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  v29 = v28;
  v30 = *v16;
  if ((unint64_t)*v16 + 1 >= 2 && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v30, "Helper Task", "", buf, 2u);
  }

  v31 = xpc_dictionary_create(0, 0, 0);
  v32 = v31;
  if (v31)
  {
    xpc_dictionary_set_int64(v31, "taskType", -1);
    v33 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v16, "logAgentConnection"));
    xpc_connection_send_message(v33, v32);

  }
}

void sub_100044C40(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "replyBlock"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "reply"));
  v3[2](v3, v2);

}

void sub_1000450C0(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  const char *string;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = sub_100026C34();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC connection with sysdiagnose_helper failed with error: %s", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "logWithSubsystem:category:msg:", "com.apple.sysdiagnose", "containers", CFSTR("XPC connection with sysdiagnose_helper failed with error: %s"), xpc_dictionary_get_string(v2, _xpc_error_key_description));

  }
}

void sub_10004536C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100045380(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

__CFString *sub_1000453A4(int a1)
{
  void *v2;
  id v4;
  __CFString *v5;

  v2 = 0;
  switch(a1)
  {
    case -1:
      return CFSTR("END_HELPER");
    case 1:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ACCESSIBILITY_PREFERENCES");
      goto LABEL_63;
    case 2:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_AC_LOGS");
      goto LABEL_63;
    case 3:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ASPTOOL");
      goto LABEL_63;
    case 4:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ASPTOOL_MAGAZINE");
      goto LABEL_63;
    case 5:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ASPTOOL_SNAP");
      goto LABEL_63;
    case 6:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ASPTOOL_TRACE");
      goto LABEL_63;
    case 7:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_AWD");
      goto LABEL_63;
    case 8:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_BACKGROUND_POWER_LOGS");
      goto LABEL_63;
    case 9:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_BATTERY_HEALTH");
      goto LABEL_63;
    case 10:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_BATTERY_UI");
      goto LABEL_63;
    case 11:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_BTPHY");
      goto LABEL_63;
    case 12:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_CLOUDKIT_PREFERENCES");
      goto LABEL_63;
    case 13:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_CORECAPTURE_BT");
      goto LABEL_63;
    case 14:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_CORECAPTURE_CONFIG");
      goto LABEL_63;
    case 15:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_CORECAPTURE_WIFI");
      goto LABEL_63;
    case 16:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_COREREPAIR_DIAGNOSTIC");
      goto LABEL_63;
    case 17:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_DATACACHE");
      goto LABEL_63;
    case 18:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_DSCSYM");
      goto LABEL_63;
    case 19:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_ENDPOINT_SECURITY");
      goto LABEL_63;
    case 20:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_EXC_RESOURCE");
      goto LABEL_63;
    case 21:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_FDR_DIAGNOSTIC");
      goto LABEL_63;
    case 22:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_FILE_COORDINATION");
      goto LABEL_63;
    case 23:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_GE_AVAILABILITY");
      goto LABEL_63;
    case 24:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_HANDSHAKE");
      goto LABEL_63;
    case 25:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_HID_CRASHLOGS");
      goto LABEL_63;
    case 26:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_KEYBOARD_PREFERENCES");
      goto LABEL_63;
    case 27:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_LIBNOTIFY");
      goto LABEL_63;
    case 28:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_MEMORY_EXCEPTIONS");
      goto LABEL_63;
    case 29:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_MEMORY_EXCEPTIONS_LIST_LOGS");
      goto LABEL_63;
    case 30:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_NETWORK_RELAY");
      goto LABEL_63;
    case 31:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_OS_ELIGIBILITY");
      goto LABEL_63;
    case 32:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PERSONALIZATION");
      goto LABEL_63;
    case 33:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_POWER_LOGS");
      goto LABEL_63;
    case 34:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PREFERENCES");
      goto LABEL_63;
    case 35:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PREFERENCES_INTERNAL");
      goto LABEL_63;
    case 36:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PROACTIVE_INPUT");
      goto LABEL_63;
    case 37:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PROMPT");
      goto LABEL_63;
    case 38:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_PROXIMITY");
      goto LABEL_63;
    case 39:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_RUNNING_BOARD");
      goto LABEL_63;
    case 40:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_STACKSHOT_TAKE_AND_RETRIEVE");
      goto LABEL_63;
    case 41:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_STACKSHOT_RETRIEVE_EXISTING");
      goto LABEL_63;
    case 42:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_SYSMON");
      goto LABEL_63;
    case 43:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_SYSTEM_EXP");
      goto LABEL_63;
    case 44:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_SYSTEM_STATS");
      goto LABEL_63;
    case 45:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_AUGMENT_LG");
      goto LABEL_63;
    case 46:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_INFO");
      goto LABEL_63;
    case 47:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_KEYCHORD");
      goto LABEL_63;
    case 48:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_LOGARCHIVE_TIMEOUT");
      goto LABEL_63;
    case 49:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_OUTPUTDIR_TIMEOUT");
      goto LABEL_63;
    case 50:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TAILSPIN_SAVE_NO_SYMBOLICATE_TS");
      goto LABEL_63;
    case 51:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TIMEZONE");
      goto LABEL_63;
    case 52:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TRIAL");
      goto LABEL_63;
    case 53:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_TRIGGER_CORETHREAD_TOPOLOGY");
      goto LABEL_63;
    case 54:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_UNIFIED_ASSET");
      goto LABEL_63;
    case 55:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_INTELLIGENCE_PLATFORM");
      goto LABEL_63;
    case 56:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_POLARIS");
      goto LABEL_63;
    case 57:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_BASEBAND_TS_TRIGGER");
      goto LABEL_63;
    case 58:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_UID");
      goto LABEL_63;
    case 59:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_SPRING_BOARD_STATE_DUMP");
      goto LABEL_63;
    case 60:
      v4 = objc_msgSend(CFSTR("TASK_TYPE_"), "length");
      v5 = CFSTR("TASK_TYPE_APPLECV3D");
LABEL_63:
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringFromIndex:](v5, "substringFromIndex:", v4));
      break;
    default:
      return (__CFString *)v2;
  }
  return (__CFString *)v2;
}

uint64_t sub_100045A80(char *a1, size_t a2, const char *a3, const char *a4, const char *a5)
{
  uint32_t v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  tm v18;
  time_t v19;
  char __str[64];

  memset(&v18, 0, sizeof(v18));
  v19 = time(0);
  if (!localtime_r(&v19, &v18) || !strftime(__str, 0x40uLL, "%Y.%m.%d_%H-%M-%S%z", &v18))
  {
    v10 = arc4random();
    snprintf(__str, 0x40uLL, "UNKNOWN-%u", v10);
  }
  v11 = "";
  v12 = "_";
  if (a3)
    v13 = a3;
  else
    v13 = "";
  if (!a3)
    v12 = "";
  v14 = "-";
  if (a4)
  {
    v15 = a4;
  }
  else
  {
    v14 = "";
    v15 = "";
  }
  v16 = ".";
  if (a5)
    v11 = a5;
  else
    v16 = "";
  return snprintf(a1, a2, "%s%s%s%s%s%s%s", v13, v12, __str, v14, v15, v16, v11);
}

uint64_t sub_100045BC0(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint32_t v8;
  int v10;
  id v11;
  __int16 v12;
  int v13;

  v3 = objc_retainAutorelease(a2);
  v4 = a1;
  v5 = (void *)xpc_connection_copy_entitlement_value(v4, objc_msgSend(v3, "UTF8String"));

  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v5))
    {
      v6 = 1;
      goto LABEL_10;
    }
    v6 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v10 = 138412546;
    v11 = v3;
    v12 = 1024;
    v13 = 0;
    v7 = "Peer has entitlement '%@' set, but value is %d";
    v8 = 18;
    goto LABEL_5;
  }
  v6 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v3;
    v7 = "Peer does not have entitlement '%@' set, returning default NO for check";
    v8 = 12;
LABEL_5:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
    v6 = 0;
  }
LABEL_10:

  return v6;
}

uint64_t sub_100045D38()
{
  const char *v0;
  int v2;
  const char *v3;

  if (qword_1000B98C0 != -1)
    dispatch_once(&qword_1000B98C0, &stru_100099CF0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000B98B8)
      v0 = "launchd";
    else
      v0 = "shell";
    v2 = 136315138;
    v3 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "started by %s", (uint8_t *)&v2, 0xCu);
  }
  return byte_1000B98B8;
}

void sub_100045E1C(id a1)
{
  uint64_t v1;

  v1 = 0;
  vproc_swap_integer(0, 5, 0, &v1);
  byte_1000B98B8 = v1 != 0;
}

uint64_t sub_100045E60()
{
  if (qword_1000B98D0 != -1)
    dispatch_once(&qword_1000B98D0, &stru_100099D10);
  return byte_1000B98C8;
}

void sub_100045EA0(id a1)
{
  char has_internal_content;
  const char *v2;
  BOOL v3;
  uint8_t buf[4];
  const char *v5;

  if ((os_variant_has_internal_diagnostics("com.apple.sysdiagnose") & 1) != 0)
    has_internal_content = 1;
  else
    has_internal_content = os_variant_has_internal_content("com.apple.sysdiagnose");
  byte_1000B98C8 = has_internal_content;
  v3 = 0;
  if (sub_10004602C(CFSTR("customer-mode"), CFSTR("com.apple.sysdiagnose"), &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Customer-mode enabled. Forcing external behavior.", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }
    byte_1000B98C8 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000B98C8)
      v2 = "YES";
    else
      v2 = "NO";
    *(_DWORD *)buf = 136315138;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Internal: %s", buf, 0xCu);
  }
}

BOOL sub_10004602C(void *a1, void *a2, BOOL *a3)
{
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  int AppBooleanValue;
  int v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Boolean keyExistsAndHasValidFormat;

  v5 = a1;
  v6 = a2;
  v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat)
      *a3 = AppBooleanValue != 0;
    v10 = v9 != 0;
  }
  else
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
      sub_100061B4C(v11, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

uint64_t sub_1000460D8(void *a1, void *a2, void *a3, _QWORD *a4)
{
  __CFString *v7;
  __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  CFPropertyListRef v11;
  void *v12;
  CFTypeID v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = (__CFString *)v9;
  if (!v7 || !v8 || !v9 || !a4)
  {
    v15 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v15)
      sub_100061BC0(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_11;
  }
  v11 = CFPreferencesCopyValue(v7, v8, v9, kCFPreferencesAnyHost);
  if (!v11)
  {
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v12 = (void *)v11;
  v13 = CFGetTypeID(v11);
  if (v13 != CFNumberGetTypeID())
  {
    CFRelease(v12);
    goto LABEL_11;
  }
  *a4 = objc_msgSend(v12, "longValue");

  v14 = 1;
LABEL_12:

  return v14;
}

BOOL sub_1000461BC(const char *a1, const char *a2)
{
  size_t v4;
  size_t v5;
  size_t v6;
  size_t v7;
  const char *v8;
  const char *v9;

  v4 = strlen(a1);
  v5 = strlen(a2);
  v6 = v5;
  if (v5 >= v4)
    v7 = v4;
  else
    v7 = v5;
  if (!strncasecmp(a2, a1, v7))
    return 1;
  if (v6 <= v4)
    v8 = a1;
  else
    v8 = a2;
  if (v6 <= v4)
    v9 = a2;
  else
    v9 = a1;
  return strcasestr(v8, v9) != 0;
}

BOOL sub_100046230(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  _BYTE buffer[4096];

  v3 = a2;
  if (proc_pidpath((int)objc_msgSend(a1, "intValue"), buffer, 0x1000u) < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer)));
    v5 = sub_1000461BC((const char *)objc_msgSend(v4, "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));

  }
  return v5;
}

BOOL sub_100046318(const void *a1)
{
  const void *v2;
  const void *v3;
  _BOOL8 v4;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFEqual(v2, a1) != 0;
  CFRelease(v3);
  return v4;
}

uint64_t sub_100046370()
{
  if (qword_1000B98E0 != -1)
    dispatch_once(&qword_1000B98E0, &stru_100099D30);
  return byte_1000B98D8;
}

void sub_1000463B0(id a1)
{
  byte_1000B98D8 = sub_100046318(CFSTR("AppleTV"));
}

uint64_t sub_1000463D4()
{
  if (qword_1000B98F0 != -1)
    dispatch_once(&qword_1000B98F0, &stru_100099D50);
  return byte_1000B98E8;
}

void sub_100046414(id a1)
{
  byte_1000B98E8 = sub_100046318(CFSTR("iPad"));
}

uint64_t sub_100046438()
{
  if (qword_1000B9900 != -1)
    dispatch_once(&qword_1000B9900, &stru_100099D70);
  return byte_1000B98F8;
}

void sub_100046478(id a1)
{
  byte_1000B98F8 = sub_100046318(CFSTR("iPhone"));
}

uint64_t sub_10004649C()
{
  if (qword_1000B9910 != -1)
    dispatch_once(&qword_1000B9910, &stru_100099D90);
  return byte_1000B9908;
}

void sub_1000464DC(id a1)
{
  byte_1000B9908 = sub_100046318(CFSTR("AppleDisplay"));
}

uint64_t sub_100046500()
{
  _DWORD v1[2];

  if (qword_1000B9920 != -1)
    dispatch_once(&qword_1000B9920, &stru_100099DB0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000B9918;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleB check", (uint8_t *)v1, 8u);
  }
  return byte_1000B9918;
}

void sub_1000465CC(id a1)
{
  byte_1000B9918 = sub_1000465F0("manta-b");
}

uint64_t sub_1000465F0(const char *a1)
{
  io_iterator_t v2;
  io_object_t v3;
  kern_return_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  kern_return_t v16;
  io_registry_entry_t v18;
  kern_return_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  io_iterator_t iterator[2];
  uint8_t v27[4];
  _DWORD v28[3];
  io_name_t name;
  _BYTE v30[12];
  uint64_t v31;

  *(_QWORD *)iterator = 0;
  if (!a1)
  {
    v31 = 0;
    memset(name, 0, 80);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v20 = 3;
    else
      v20 = 2;
    *(_DWORD *)v30 = 134217984;
    *(_QWORD *)&v30[4] = 0;
    v21 = _os_log_send_and_compose_impl(v20, &v31, name, 80, &_mh_execute_header, &_os_log_default, 16);
    v22 = _os_crash_msg(v31, v21);
    sub_100061C34(v22);
  }
  v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
  v3 = v2;
  iterator[1] = v2;
  if (v2)
  {
    v4 = IORegistryEntryCreateIterator(v2, "IODeviceTree", 0, iterator);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100061D90(v4, v5, v6);
    }
    else
    {
      while (1)
      {
        v18 = IOIteratorNext(iterator[0]);
        if (!v18)
          break;
        memset(name, 0, sizeof(name));
        v19 = IORegistryEntryGetName(v18, name);
        if (v19)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100061D50(v27, v19, v28);
        }
        else if (!strcmp(a1, name))
        {
          v15 = 1;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
      sub_100061CDC(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = 0;
LABEL_9:
  if (iterator[0])
  {
    v16 = IOObjectRelease(iterator[0]);
    if (v16)
    {
      *(_QWORD *)v30 = 0;
      memset(name, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      LODWORD(v31) = 67109120;
      HIDWORD(v31) = v16;
      v24 = _os_log_send_and_compose_impl(v23, v30, name, 80, &_mh_execute_header, &_os_log_default, 16);
      v25 = _os_crash_msg(*(_QWORD *)v30, v24);
      sub_100061C34(v25);
    }
  }
  if (v3 && IOObjectRelease(v3))
    sub_100061C38(v30, name);
  return v15;
}

void sub_1000468C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  sub_100046A24(&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_100046900()
{
  _DWORD v1[2];

  if (qword_1000B9930 != -1)
    dispatch_once(&qword_1000B9930, &stru_100099DD0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000B9928;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleC check", (uint8_t *)v1, 8u);
  }
  return byte_1000B9928;
}

void sub_1000469CC(id a1)
{
  byte_1000B9928 = sub_1000465F0("manta-c");
}

NSString *sub_1000469F0()
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sysdiagnose version %d.%d"), 3, 0);
}

uint64_t sub_100046A24(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_100061E04(&v2, v3);
  }
  return result;
}

void sub_100046A88(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL sub_100046A94()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_100047C9C(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  xpc_object_t v9;
  uint8_t buf[4];
  const char *v12;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2));
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping forwarding %s key", buf, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", CFSTR("Skipping forwarding %s key"), a2);

  }
  else
  {
    v8 = *(void **)(a1 + 40);
    v9 = xpc_copy(v5);
    xpc_dictionary_set_value(v8, a2, v9);

  }
  return 1;
}

void sub_100049C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  _Block_object_dispose(&a17, 8);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_100049C50(uint64_t a1)
{
  void *v2;
  void *v3;
  uint8_t v4[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "prepareOutput") & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create the output directory.", v4, 2u);
    }
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v2, "stdoutWrite:", CFSTR("Unable to create the output directory."));

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v3, "log:", CFSTR("Unable to create the output directory."));

  }
}

uint64_t sub_10004B7B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10004B898(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004C2E0(uint64_t a1, void *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = objc_opt_class(SDLogArchiveContainer, v5);
  isKindOfClass = objc_opt_isKindOfClass(v14, v6);
  if ((a3 & 1) != 0)
  {
    if ((isKindOfClass & 1) != 0)
    {
      v8 = v14;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "durationMetrics"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "metricsDict"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "durationMetrics"));
        objc_msgSend(v10, "addEntriesFromDictionary:", v11);

      }
LABEL_8:

    }
  }
  else if ((isKindOfClass & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 48, &stru_10009DC10, *(_QWORD *)(a1 + 32), 10.0));
    v8 = v12;
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionContainer"));
      objc_msgSend(v13, "setMaximumSizeMB:", 200);

      objc_msgSend(v8, "setRuntimeChecks:", 64);
      objc_msgSend(v8, "setName:", CFSTR("tailspin-save-logarchive-timeout"));
      objc_msgSend(v8, "execute");
    }
    goto LABEL_8;
  }

}

id sub_10004C924(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10004DAD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004DC08(uint64_t a1)
{
  void *v2;
  void *v3;
  os_activity_scope_state_s v4;

  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v4);
  v2 = *(void **)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "diagnosticID"));
  objc_msgSend(v2, "registerActivityWithID:", v3);

  objc_msgSend(*(id *)(a1 + 40), "finishedItemForPhaseAndUpdatePeer:", *(unsigned int *)(a1 + 56));
  os_activity_scope_leave(&v4);
}

void sub_10004DC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

id sub_10004EFA8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prompt");
}

void sub_100050708(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "archive"));
  objc_msgSend(v2, "addArchiveFile:", *(_QWORD *)(a1 + 40));

}

void sub_100050F80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void sub_10005109C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  void *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD v6[4];
  OS_xpc_object *v7;

  v2 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005117C;
  v6[3] = &unk_100099990;
  v7 = v2;
  xpc_remote_connection_set_event_handler(v2, v6);
  xpc_remote_connection_activate(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "logSubsystem"));

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Connection started.", v5, 2u);
  }

}

void sub_10005117C(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v3 = a2;
  type = xpc_get_type(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logSubsystem"));

  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Initiating remote connection", buf, 2u);
    }

    +[CSRemoteXPCProxy handleRemoteConnection:forMsg:isTrusted:](CSRemoteXPCProxy, "handleRemoteConnection:forMsg:isTrusted:", *(_QWORD *)(a1 + 32), v3, 1);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Cancelling remote connection", v8, 2u);
    }

    xpc_remote_connection_cancel(*(_QWORD *)(a1 + 32));
  }

}

void sub_100051634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10005166C(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSCoreDeviceProxy: Found device %@", (uint8_t *)&v12, 0xCu);
  }

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else if (v5)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getService:forDevice:](CSRemoteXPCProxy, "getService:forDevice:", "com.apple.sysdiagnose.remote.trusted", v5));

    if (v8)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v9 = -[CSRemoteXPCProxy _initWithDevice:forDiagnosticID:]([CSCoreDeviceProxy alloc], "_initWithDevice:forDiagnosticID:", v5, *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "logSubsystem"));

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000626F8(v11);

  }
}

void sub_100051C3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051C54(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  objc_msgSend(*(id *)(a1 + 32), "prepareSummary");
  objc_msgSend(*(id *)(a1 + 32), "updateContainerWithOverride");
  if (objc_msgSend(*(id *)(a1 + 32), "evaluateCollectionFlags"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));

    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      v4 = objc_msgSend(v3, "shouldStreamToTar");

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outputDirectory"));

    }
    else
    {
      v4 = 0;
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "units", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(*(id *)(a1 + 32), "applyRule:", v11);
          if (objc_msgSend(v11, "pipelineFlush"))
          {
            objc_msgSend(*(id *)(a1 + 32), "writeToSummary:", CFSTR("Flushing the LogCollection Pipeline\n"));
            objc_msgSend(*(id *)(a1 + 32), "enforceContainerSizeLimit");
            objc_msgSend(*(id *)(a1 + 32), "copyFilesForDirectory:withStreaming:", v2, v4);
            objc_msgSend(*(id *)(a1 + 32), "clearLogs");
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(*(id *)(a1 + 32), "enforceContainerSizeLimit");
    objc_msgSend(*(id *)(a1 + 32), "copyFilesForDirectory:withStreaming:", v2, v4);
    objc_msgSend(*(id *)(a1 + 32), "closeSummary");
    objc_msgSend(*(id *)(a1 + 32), "clearLogs");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "units"));
    objc_msgSend(v12, "removeAllObjects");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

id sub_1000537E8(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _BYTE v17[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var"), CFSTR("/tmp"), CFSTR("/etc"), 0));
  v3 = v1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    v5 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v2);
        if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)))
        {
          v16[0] = CFSTR("/private");
          v16[1] = v3;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
          v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v9));

          v5 = (void *)v10;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

  return v5;
}

uint64_t sub_100053984(uint64_t a1)
{
  if (!a1)
    return 1;
  if ((*(_WORD *)(a1 + 4) & 0xF000) != 0x8000 || *(unsigned __int16 *)(a1 + 6) < 2u)
    return 0;
  *__error() = 9;
  return 1;
}

uint64_t sub_1000539D4(int a1)
{
  stat v3;

  memset(&v3, 0, sizeof(v3));
  if (fstat(a1, &v3) != -1)
  {
    if ((v3.st_mode & 0xF000) != 0x8000 || v3.st_nlink < 2u)
      return 0;
    *__error() = 9;
  }
  return 1;
}

uint64_t sub_100053A44(const char *a1, int a2, unsigned int a3)
{
  return open(a1, a2 | 0x20000A00, a3);
}

uint64_t sub_100053A74(const char *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a2 & 0x200) != 0)
    return 0xFFFFFFFFLL;
  v2 = open(a1, a2 | 0x20000000);
  v3 = v2;
  if ((_DWORD)v2 != -1 && sub_1000539D4(v2))
  {
    close(v3);
    return 0xFFFFFFFFLL;
  }
  return v3;
}

uint64_t sub_100053AC0(int a1, const char *a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x200) != 0)
    return 0xFFFFFFFFLL;
  v3 = openat(a1, a2, a3 | 0x20000000);
  v4 = v3;
  if ((_DWORD)v3 != -1 && sub_1000539D4(v3))
  {
    close(v4);
    return 0xFFFFFFFFLL;
  }
  return v4;
}

uint64_t sub_100053B0C(const char *a1, uid_t a2, gid_t a3)
{
  int v5;
  int v6;
  uint64_t v7;

  v5 = sub_100053A74(a1, 0);
  if (v5 == -1)
    return 0xFFFFFFFFLL;
  v6 = v5;
  if (fchown(v5, a2, a3) == -1)
    v7 = 0xFFFFFFFFLL;
  else
    v7 = 0;
  close(v6);
  return v7;
}

uint64_t sub_100053B70(const char *a1, mode_t a2)
{
  int v3;
  int v4;
  uint64_t v5;

  v3 = sub_100053A74(a1, 0);
  if (v3 == -1)
    return 0xFFFFFFFFLL;
  v4 = v3;
  if (fchmod(v3, a2) == -1)
    v5 = 0xFFFFFFFFLL;
  else
    v5 = 0;
  close(v4);
  return v5;
}

uint64_t sub_100053BC4(const char *a1, const char *a2, copyfile_flags_t a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;

  v5 = sub_100053A74(a1, 0);
  if (v5 == -1)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v7 = open(a2, 536873473, 420);
  if (v7 == -1)
  {
    v9 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = v7;
    v9 = fcopyfile(v6, v7, 0, a3);
    close(v6);
    v6 = v8;
  }
  close(v6);
  return v9;
}

id sub_1000540D8()
{
  if (qword_1000B9938 != -1)
    dispatch_once(&qword_1000B9938, &stru_10009A028);
  return (id)qword_1000B9940;
}

void sub_100054230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100054248(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100054258(uint64_t a1)
{

}

__CFDictionary *__cdecl sub_100054260(id a1, int a2, __CFDictionary *a3)
{
  void *v3;
  id v4;
  NSObject *v5;
  int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v4 = sub_1000540D8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to report purgeable for volume '%{public}@. Skipping", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

__CFDictionary *__cdecl sub_10005431C(id a1, int a2, __CFDictionary *a3)
{
  void *v3;
  id v4;
  NSObject *v5;
  int v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v4 = sub_1000540D8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received purge request for volume '%{public}@. Skipping", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

void sub_1000543D8(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_1000540D8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received purge cancel request. Skipping", v3, 2u);
  }

}

id sub_10005443C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  int v9;
  void *v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_VOLUME")));
  v5 = sub_1000540D8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received periodic purge request for volume '%{public}@", (uint8_t *)&v9, 0xCu);
  }

  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "periodicAPFSMarkAsPurgeable:", v4);
  return v7;
}

void sub_10005453C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "deleter");
  v2 = (void *)qword_1000B9940;
  qword_1000B9940 = (uint64_t)v1;

}

int64_t sub_100054BD8(id a1, NSURL *a2, NSURL *a3)
{
  NSURL *v4;
  id v5;
  id v6;
  id v8;
  id v9;

  v9 = 0;
  v4 = a3;
  -[NSURL getResourceValue:forKey:error:](a2, "getResourceValue:forKey:error:", &v9, NSURLCreationDateKey, 0);
  v8 = 0;
  v5 = v9;
  -[NSURL getResourceValue:forKey:error:](v4, "getResourceValue:forKey:error:", &v8, NSURLCreationDateKey, 0);

  v6 = objc_msgSend(v8, "compare:", v5);
  return (int64_t)v6;
}

void sub_1000558FC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  id v10;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Device assertion failed, %@", buf, 0xCu);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("Device assertion failed, %@"), v5);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 320), a3);
  }

}

void sub_100055C98(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Launching Settings ...", v5, 2u);
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v1, "stdoutWrite:", CFSTR("Launching Settings ..."));

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v2, "log:", CFSTR("Launching Settings ..."));

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=INTERNAL_SETTINGS&path=sysdiagnose")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

void sub_100057B8C(id a1)
{
  void *v1;
  uint8_t v2[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out in transferring watch archive", v2, 2u);
  }
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v1, "log:", CFSTR("Timed out in transferring watch archive"));

  sub_1000297AC(0);
}

void sub_100058220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100058240(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100058250(uint64_t a1)
{

}

void sub_100058258(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v13;
  _QWORD v14[4];
  __int128 v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v17 = v7;
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current User Activity UUID %{public}@; BundleId: %{public}@; Error: %{public}@",
      buf,
      0x20u);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "stdoutWrite:", CFSTR("Current User Activity UUID %{public}@; BundleId: %{public}@; Error: %{public}@"),
    v7,
    v8,
    v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", CFSTR("Current User Activity UUID %{public}@; BundleId: %{public}@; Error: %{public}@"),
    v7,
    v8,
    v9);

  if (v7)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100058414;
    v14[3] = &unk_10009A0D8;
    v13 = *(_OWORD *)(a1 + 32);
    v12 = (id)v13;
    v15 = v13;
    +[UAUserActivity fetchUserActivityWithUUID:completionHandler:](UAUserActivity, "fetchUserActivityWithUUID:completionHandler:", v7, v14);

  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void sub_100058414(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User activity: %@; error: %@",
      buf,
      0x16u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "stdoutWrite:", CFSTR("User activity: %@; error: %@"), v5, v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v8, "log:", CFSTR("User activity: %@; error: %@"), v5, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("tap-to-radar")));
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100058858(int *a1, char *a2, size_t a3)
{
  size_t v3;
  char *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = a3;
  v4 = a2;
  v5 = *a1;
  v6 = write(*a1, a2, a3);
  v7 = 0;
  if (v6)
  {
    while (v6 != v3)
    {
      if (v6 >= v3)
        v8 = 0;
      else
        v8 = v6;
      v4 += v8;
      v3 -= v8;
      v7 += v8;
      v6 = write(v5, v4, v3);
      if (!v6)
        return v7;
    }
    v7 += v6;
  }
  return v7;
}

BOOL sub_10005A5F0(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive error %@", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  objc_msgSend(v5, "log:", CFSTR("SDArchive error %@"), v6);

  return 1;
}

void sub_10005AE9C(id a1)
{
  SystemDiagnosticIDS *v1;
  void *v2;

  v1 = objc_alloc_init(SystemDiagnosticIDS);
  v2 = (void *)qword_1000B9950;
  qword_1000B9950 = (uint64_t)v1;

  objc_msgSend((id)qword_1000B9950, "setTransferIdentifier:", &stru_10009DC10);
}

void sub_10005B10C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v2, "setProtobufAction:forIncomingRequestsOfType:", "SDStart:", 1);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v3, "setProtobufAction:forIncomingResponsesOfType:", "SDStart:", 1);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v4, "setProtobufAction:forIncomingRequestsOfType:", "SDStop", 2);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v5, "setProtobufAction:forIncomingResponsesOfType:", "SDStop", 2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", "SDComplete:", 3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v7, "setProtobufAction:forIncomingResponsesOfType:", "SDComplete:", 3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", "SDTargetFilename:", 5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v9, "setProtobufAction:forIncomingResponsesOfType:", "SDTargetFilename:", 5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v10, "setProtobufAction:forIncomingRequestsOfType:", "SDTransfer_Size:", 4);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v11, "setProtobufAction:forIncomingResponsesOfType:", "SDTransfer_Size:", 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v12, "setProtobufAction:forIncomingRequestsOfType:", "SDWatch_List:", 6);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v13, "setProtobufAction:forIncomingResponsesOfType:", "SDWatch_List:", 6);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v14, "setProtobufAction:forIncomingRequestsOfType:", "SDList_Complete:", 7);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v15, "setProtobufAction:forIncomingResponsesOfType:", "SDList_Complete:", 7);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v16, "setProtobufAction:forIncomingRequestsOfType:", "SDTransfer_Remote:", 8);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v17, "setProtobufAction:forIncomingResponsesOfType:", "SDTransfer_Remote:", 8);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v18, "setProtobufAction:forIncomingRequestsOfType:", "SDRemote_Complete:", 9);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  objc_msgSend(v19, "setProtobufAction:forIncomingResponsesOfType:", "SDRemote_Complete:", 9);

  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v20 = *(void **)(a1 + 32);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "run_queue"));
  objc_msgSend(v22, "addDelegate:queue:", v20, v21);

}

void sub_10005B988(uint64_t a1)
{
  void *v2;
  void *v3;
  SystemDiagnosticiOS *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  uint8_t buf[4];
  void *v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringFromProtobuf:", *(_QWORD *)(a1 + 48)));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v4 = objc_alloc_init(SystemDiagnosticiOS);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000628C8();
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v12, "stderrWrite:", CFSTR("Failed to allocate diagnostic object. Failing early from SDStart"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Failed to allocate diagnostic object. Failing early from SDStart"));
    goto LABEL_16;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](v4, "diagnosticID"));
  v7 = objc_msgSend(v5, "checkAndIncreaseDiagnosticCountForDiagnosticID:collectingLocalLogs:", v6, 1);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "setCurrentClient:", CFSTR("IDS"));

    objc_msgSend(*(id *)(a1 + 40), "setTransfer_size:", 0);
    -[SystemDiagnostic setRequestSource:](v4, "setRequestSource:", 4);
    -[SystemDiagnosticiOS setIdsCase:](v4, "setIdsCase:", 4);
    -[SystemDiagnostic setShouldCreateTarBall:](v4, "setShouldCreateTarBall:", 1);
    -[SystemDiagnostic setShouldRemoveTemporaryDirectory:](v4, "setShouldRemoveTemporaryDirectory:", 1);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](v4, "idsCase")));
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IDS SDStart idsCase: %@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticIDS getIDSCaseString:](SystemDiagnosticIDS, "getIDSCaseString:", -[SystemDiagnosticiOS idsCase](v4, "idsCase")));
    objc_msgSend(v10, "log:", CFSTR("IDS SDStart idsCase: %@"), v11);

    if (v2)
      -[SystemDiagnostic setRemoteSysdiagnoseID:](v4, "setRemoteSysdiagnoseID:", v2);
    -[SystemDiagnosticiOS run](v4, "run");
    goto LABEL_17;
  }
  if (!v2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("no-location.log")));
    sub_100023C18(CFSTR("Incoming co-sysdiagnose request with no target location specified."), v13);
LABEL_16:

    goto LABEL_17;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("error"), "stringByAppendingString:", CFSTR("-")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v2));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathExtension:", CFSTR("log")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v16));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Current request %@ could not be completed because there is an inflight sysdiagnose.\n"), v2));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error %@", buf, 0xCu);
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v19, "log:", CFSTR("Error %@"), v18);

  sub_100023C18(v18, v17);
  v20 = *(void **)(a1 + 40);
  v22[0] = v15;
  v22[1] = v2;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 2));
  objc_msgSend(v20, "sendFilenamePair:", v21);

LABEL_17:
}

BOOL sub_10005DC84(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;

  v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", buf, 0xCu);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
  objc_msgSend(v5, "log:", CFSTR("%@\n"), v6);

  return 1;
}

BOOL sub_10005DD88(id a1, NSURL *a2, NSError *a3)
{
  void *v4;
  int v6;
  void *v7;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](a3, "localizedDescription"));
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@\n", (uint8_t *)&v6, 0xCu);

  }
  return 1;
}

uint64_t sub_10005E02C(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 31339) >= 0xFFFFFFFE)
    return (uint64_t)*(&off_10009A220 + 5 * (v1 - 31337) + 5);
  else
    return 0;
}

_DWORD *sub_10005E068(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_1000324C0();
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t sub_10005E0C8(uint64_t result, uint64_t a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 36) && *(_DWORD *)(result + 40) > 0x1Fu)
    {
      v4 = *(unsigned int *)(result + 12);
      v5 = *(unsigned int *)(result + 32);
      v6 = *(_OWORD *)(result + 72);
      v7[0] = *(_OWORD *)(result + 56);
      v7[1] = v6;
      result = sub_100032498(v4, v5, v7);
      *(_DWORD *)(a2 + 32) = result;
      return result;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10005E160(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 31339) >= 0xFFFFFFFE
    && (v5 = (void (*)(void))*(&off_10009A220 + 5 * (v4 - 31337) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_10005E1F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A274();
  sub_10000A258((void *)&_mh_execute_header, v0, v1, "Failed to attach to bluetoothd with error %d", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E250()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Timed out waiting for ExposureNotification db collection.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E27C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A274();
  sub_10000A258((void *)&_mh_execute_header, v0, v1, "Failed to get default local device from bluetoothd with error %d", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E2DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Timed out waiting for AirPod logs collection.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E308(void *a1, NSObject *a2)
{
  uint8_t v3[8];
  __int16 v4;
  int v5;

  objc_msgSend(a1, "numAttachTries");
  sub_10000A274();
  v4 = 1024;
  v5 = 3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Attempt (%d/%d) to attach to BTSession failed. Giving up.", v3, 0xEu);
}

void sub_10005E39C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A274();
  sub_10000A258((void *)&_mh_execute_header, v0, v1, "Registration for AirPod logs trigger callback with bluetooth returned error %d", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E3FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "AirPods not supported, or the logs are already dumped to other paired device's sysdiagnose", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E428()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "AirPods are already logging to a different connected device.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E454()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "AirPods are not connected.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E480()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Tried to trigger logs from AirPods V1 on iOS -- abort.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E4AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A274();
  sub_10000A258((void *)&_mh_execute_header, v0, v1, "BTAccessoryManagerGetDefault() failed while triggering AirPod logs with error: %d", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E50C()
{
  os_log_t v0;
  uint8_t v1[8];

  sub_10000A274();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Received unexpected event value (%d) in BTSession event callback.", v1, 8u);
  sub_10000A250();
}

void sub_10005E578()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A274();
  sub_10000A258((void *)&_mh_execute_header, v0, v1, "Received BT_SESSION_ATTACHED (error %d) event in BTSession event callback.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E5D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Received BT_SESSION_TERMINATED event in BTSession event callback. Cleaning up.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E604()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10000A268();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Received unexpected BT_SESSION_FAILED in BTSession event callback.", v1, 2u);
  sub_10000A250();
}

void sub_10005E63C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: Received callback without dispatch group in SystemDiagnosticBT, reporting AirPod logs %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005E6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Error: Received unexpected AirPod log name, stopping.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E6DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A268();
  sub_10000A240((void *)&_mh_execute_header, v0, v1, "Found existing accessory logs in AirPod logs callback -- ignoring.", v2, v3, v4, v5, v6);
  sub_10000A250();
}

void sub_10005E708(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Count is 0 but local log collection ID is: %@ - resetting to nil for caller: %@", buf, 0x16u);

}

void sub_10005E76C(uint8_t *buf, uint64_t a2)
{
  *(_DWORD *)buf = 134217984;
  *(_QWORD *)(buf + 4) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Atomic count did not match. Resetting to dictionary count %ld", buf, 0xCu);
}

void sub_10005E7B4()
{
  __assert_rtn("-[SDResourceManager setUpFH:]", "SDResourceManager.m", 442, "fd != -1");
}

void sub_10005E7DC()
{
  __assert_rtn("-[SDResourceManager setUpFH:]", "SDResourceManager.m", 447, "fh");
}

void sub_10005E804(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Peers not available", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005E838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "DiagnosticID not available", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005E86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Peer not available for progress reporting.", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005E8A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005E910()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005E97C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005E9EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EA58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005EAC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EB34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005EBA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EC10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005EC80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005ECEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005ED5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EDC8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005EE38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EEA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005EF14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005EF80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: Failed to allocate CSSessionConfig object", a5, a6, a7, a8, 0);
}

void sub_10005EFB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E4C((void *)&_mh_execute_header, a2, a3, "Error: CSCoordinator: %s: found %lu configs (>1). Configs found for:", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005F02C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100018E5C();
  sub_100018E4C((void *)&_mh_execute_header, v0, v1, "Error: CSCoordinator: %s: config not found for '%@', returning default result", v2, v3, v4, v5, 2u);
  sub_100018E70();
}

void sub_10005F098(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005F108(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: failed to create hostWaitGroup. Failing to startRemoteInitiatedFlow", a5, a6, a7, a8, 0);
}

void sub_10005F13C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005F1AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, a1, a3, "Error: CSCoordinator: nil diagnosticID passed to %s - returning default result", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005F21C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10005F2C4(void *a1)
{
  int v1;
  xpc_type_t type;

  v1 = 138412290;
  type = xpc_get_type(a1);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CoreCaptureConfig unxpected reply. Expected XPC_TYPE_DICTIONARY. Received %@", (uint8_t *)&v1, 0xCu);
}

void sub_10005F344(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription")));
  v4 = 136446210;
  v5 = objc_msgSend(v3, "UTF8String");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CacheEnumerator error: %{public}s", (uint8_t *)&v4, 0xCu);

}

void sub_10005F3E0(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 134217984;
  v2 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSDisplayProxy: timed out (%lus) waiting for browsing to finish", (uint8_t *)&v1, 0xCu);
}

void sub_10005F45C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSDisplayProxy: got nil device from from browsing SPI with canceling == false", v1, 2u);
}

void sub_10005F49C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "SDBetaManager class not found. Assuming not on seed", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005F4D0(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription")));
  objc_msgSend(v1, "UTF8String");
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "canFileFeedbackOnThisDevice returned error: '%s'. Assuming not on seed", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_10005F554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "canFileFeedbackOnThisDevice: selector not found in SDBetaManager. Assuming not on seed", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005F588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "libtailspin not available on this platform. Returning 0 for buffer size", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005F5BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Timed out fetching tailspin config after %lu seconds. Returning default val", a5, a6, a7, a8, 0);
  sub_100018E70();
}

void sub_10005F62C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Programmer error: trying to round with minimum size of 0. Using 1 instead", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005F660(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  strerror(a1);
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v1, "Failed to get path from FD: %s", v2, v3, v4, v5, v6);
  sub_100018E70();
}

void sub_10005F6CC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10002787C(a3, __stack_chk_guard);
  sub_100027830();
  sub_10002786C((void *)&_mh_execute_header, &_os_log_default, v3, "Failed to copy tarball '%s' to final location '%s'. Unable to lseek to start: %s", v4, v5, v6, v7, v8);
  sub_100027860();
}

void sub_10005F740(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10002787C(a3, __stack_chk_guard);
  sub_100027830();
  sub_10002786C((void *)&_mh_execute_header, &_os_log_default, v3, "Failed to copy tarball '%s' to final location '%s': %s", v4, v5, v6, v7, v8);
  sub_100027860();
}

void sub_10005F7B4(int a1, int __errnum)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  strerror(__errnum);
  sub_100027850();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to unlink tarball '%s' after copy': %s", v3, v4, v5, v6, 2u);
  sub_10002780C();
}

void sub_10005F834(uint64_t a1, int __errnum, int a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  char *v8;

  v3 = 136315650;
  v4 = a1;
  v5 = 1024;
  v6 = a3;
  v7 = 2080;
  v8 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Opening tarball file descriptor at %s with protection class %d failed: %s", (uint8_t *)&v3, 0x1Cu);
  sub_100027860();
}

void sub_10005F8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Unable to allocate temporary directory template", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005F90C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  sub_100027850();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v1, "Unable to create user temporary directory %@: %s", v2, v3, v4, v5, 2u);
  sub_10002780C();
}

void sub_10005F990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027818();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to get system group container for identifier '%@' (error: %s)", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_10005F9F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to create container query for identifier '%@'", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_10005FA60(uint64_t a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 67109378;
  v2[1] = a2;
  v3 = 2112;
  v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Active UID '%d' user doesn't exist. Returning nil for container path '%@'", (uint8_t *)v2, 0x12u);
  sub_100018E70();
}

void sub_10005FAE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027818();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Error executing query for identifier '%@': %s", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_10005FB4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027818();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Error fetching path for identifier '%@': %s", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_10005FBB4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = __error();
  strerror(*v0);
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v1, "Error: failed to fetch tailspin config with error: '%s'. Returning 0 for buffer size", v2, v3, v4, v5, v6);
  sub_100018E70();
}

void sub_10005FC28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Tasks container %@ has invalid temporary directory", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005FC94(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not create target location %@ with error %@", (uint8_t *)&v4, 0x16u);

}

void sub_10005FD3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Unable to set attributes on task temporary directory %@", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005FDA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Task %@ has invalid temporary directory", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_10005FE14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002CE98();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create intermediate tailspin save directory %@: %@", v1, v2, v3, v4, v5);
}

void sub_10005FE80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_10002CE98();
  sub_100018E4C((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create intermediate spindump directory %@: %@", v1, v2, v3, v4, v5);
}

void sub_10005FEEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Error: CSRemoteXPCProxy: nil device passed into _initWithDevice", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005FF1C(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create co-sysdiagnose directory at: %@ with error: %@", (uint8_t *)&v4, 0x16u);

}

void sub_10005FFC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Error: CSRemoteXPCProxy: No srcPath sent from remote", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_10005FFF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Error: CSRemoteXPCProxy: Failed to get path basename. Not sending file to remote", a5, a6, a7, a8, 0);
  sub_10000A250();
}

void sub_100060024(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "Could not intialize a file handle from Info plist fd.", a5, a6, a7, a8, 0);
}

void sub_100060058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, v0, v1, "Could not create a plist object from the file: %@", v2, v3, v4, v5, v6);
  sub_100018E70();
}

void sub_1000600B8(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "durationMetrics"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", metricPersistLookback));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "durationMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", metricSpecialLookback));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "durationMetrics"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", metricSignpostLookback));
  v10 = 138412802;
  v11 = v5;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Log archive metrics: Persist %@ Special %@ Signpost %@", (uint8_t *)&v10, 0x20u);

}

void sub_1000601F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, v0, v1, "Could not read the log archive Info plist: %@", v2, v3, v4, v5, v6);
  sub_100018E70();
}

void sub_100060258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "Could not set the offset of the log archive Info plist to 0: %@", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_1000602C0(uint64_t a1, int __errnum, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  char *v8;

  v5 = 138412546;
  v6 = a1;
  v7 = 2080;
  v8 = strerror(__errnum);
  sub_1000317B8((void *)&_mh_execute_header, a3, v4, "Failed to open log archive %@: %s", (uint8_t *)&v5);
  sub_10002780C();
}

void sub_100060350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, v0, v1, "OSLOGCREATE Error: %s", v2, v3, v4, v5, v6);
  sub_100018E70();
}

void sub_1000603B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "%@", v1, v2, v3, v4, v5);
  sub_100018E70();
}

uint64_t sub_100060418()
{
  int *v0;

  v0 = __error();
  return sub_1000317B0(v0);
}

void sub_100060430(uint64_t a1, int __errnum)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  char *v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2080;
  v6 = strerror(__errnum);
  sub_1000317B8((void *)&_mh_execute_header, &_os_log_default, v2, "Unable to create file %@: %s", (uint8_t *)&v3);
  sub_10002780C();
}

void sub_1000604BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, a1, a3, "logarchive block timedout.", a5, a6, a7, a8, 0);
}

void sub_1000604F0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10003C3EC(a1, a2);
  if (sub_10003C3D8(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10003C3C0(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10003C410(v6);
  __break(1u);
}

void sub_10006056C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10003C3EC(a1, a2);
  if (sub_10003C3D8(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_10003C3C0(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_10003C410(v6);
  __break(1u);
}

void sub_1000605E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Error: cli request (%@) received invalid data", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_100060654(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Error writing remote UUIDs to response dict: %@", v3, v4, v5, v6, 2u);

  sub_10002780C();
}

void sub_1000606D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "Error: cli request given invalid request type of %@", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_100060740(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10003C3D8(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_1000607E4()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10003C3E0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 2u);
}

void sub_100060824(uint64_t a1, void *a2)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "diagnosticID"));
  sub_10003C3E0();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x16u);

  sub_10002780C();
}

void sub_1000608C0()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10003C3E0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 8u);
}

void sub_100060938()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  sub_10003C3E0();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  sub_100018E70();
}

void sub_1000609BC()
{
  __assert_rtn("+[SDTask createLaunchConstraintData]_block_invoke", "SDTask.m", 62, "launchConstraint != nil");
}

void sub_1000609E4()
{
  __assert_rtn("-[SDTask init]_block_invoke", "SDTask.m", 140, "fd != -1");
}

void sub_100060A0C()
{
  __assert_rtn("-[SDTask init]_block_invoke", "SDTask.m", 143, "devnull");
}

void sub_100060A34()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027888();
  sub_10003FA54((void *)&_mh_execute_header, v0, v1, "Failed to create file for writing at path: %@", v2);
  sub_100018E70();
}

void sub_100060A98()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002CE98();
  sub_10003FA9C((void *)&_mh_execute_header, v0, v1, "Failed to create dir at %@, err: %@");
  sub_100018E70();
}

void sub_100060AF8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stderrPath"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Failed to create error file for writing at path: %@", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_100060B70(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100060C18(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndex:", 1));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "File '%@' does not exist; will not execute %@.",
    (uint8_t *)&v6,
    0x16u);

  sub_10003FA74();
}

void sub_100060CC0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027888();
  sub_10003FA54((void *)&_mh_execute_header, v0, v1, "File '%@' does not exist; will not execute.", v2);
  sub_100018E70();
}

void sub_100060D24()
{
  uint64_t v0;
  os_log_t v1;

  sub_10002CE98();
  sub_10003FA9C((void *)&_mh_execute_header, v0, v1, "Error: Blocked launchctl %@ %@ on this build.");
  sub_100018E70();
}

void sub_100060D84()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027888();
  sub_10003FA54((void *)&_mh_execute_header, v0, v1, "Error: Blocked launching %@ on this build.", v2);
  sub_100018E70();
}

void sub_100060DE8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027888();
  sub_10003FA54((void *)&_mh_execute_header, v0, v1, "Launch path '%@' not accessible", v2);
  sub_100018E70();
}

void sub_100060E4C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = __error();
  strerror(*v0);
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v1, v2, "Failed to malloc arg array with errno: %s", v3, v4, v5, v6, v7);
  sub_10002780C();
}

void sub_100060EC0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not get spawn attributes. Skipping this task", v1, 2u);
}

void sub_100060F00(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  strerror(a1);
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v1, v2, "posix_spawn failed: %s", v3, v4, v5, v6, v7);
  sub_10002780C();
}

void sub_100060F6C(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  strerror(a1);
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v1, v2, "Failed to posix_spawn_file_actions_init with error: %s. Skipping this task", v3, v4, v5, v6, v7);
  sub_10002780C();
}

void sub_100060FD8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "executionLine"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Task '%@' has already been started; will not execute",
    v4,
    v5,
    v6,
    v7,
    v8);

  sub_10002780C();
}

void sub_100061054(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "launchPath"));
  sub_10003FA84();
  sub_10003FA60((void *)&_mh_execute_header, v2, v3, "Child process '%@' terminated due to signal %d", v4, v5, v6, v7, v8);

  sub_10003FA74();
}

void sub_1000610D4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "launchPath"));
  sub_100027888();
  sub_10003FA60((void *)&_mh_execute_header, v2, v3, "Child process '%@' exited with nonzero status %d", v4, v5, v6, v7, v8);

  sub_10003FA74();
}

void sub_100061164(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "launchPath"));
  sub_10003FA84();
  sub_10003FA60((void *)&_mh_execute_header, v2, v3, "Unknown state of child process '%@' with wstatus %04x", v4, v5, v6, v7, v8);

  sub_10003FA74();
}

void sub_1000611E4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "launchPath"));
  sub_10003FA84();
  sub_10003FA60((void *)&_mh_execute_header, v2, v3, "Child process '%@' stopped (but did not terminate) due to signal %d", v4, v5, v6, v7, v8);

  sub_10003FA74();
}

void sub_100061264()
{
  __assert_rtn("-[SDTask stop:]", "SDTask.m", 562, "_processIdentifier > -1");
}

void sub_10006128C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown task stop state: %u", (uint8_t *)v2, 8u);
}

void sub_100061300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Semaphore to wait for tasks to complete is nil", a5, a6, a7, a8, 0);
}

void sub_100061338(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timed out waiting for all tasks to complete. Timeout: %llus", (uint8_t *)&v1, 0xCu);
}

void sub_1000613B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A240((void *)&_mh_execute_header, &_os_log_default, a3, "Attempted to block multiple threads on the same task semaphore. Different threads should use different semaphores.", a5, a6, a7, a8, 0);
}

void sub_1000613EC()
{
  __assert_rtn("-[SDTaskContainer executeFromCallback]", "SDTaskContainer.m", 72, "!(self.blockUntilFinished | self.runByItself)");
}

void sub_100061414(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_10006148C(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "name"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Failed to execute %@", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_100061508(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_100045348();
  sub_100045380((void *)&_mh_execute_header, v2, v3, "Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);

  sub_100045394();
}

void sub_100061588(id *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "timeoutMetricsString"));
  sub_10004536C((void *)&_mh_execute_header, v3, v4, "[%@ container] Task(s) timed out: %@", v5, v6, v7, v8, 2u);

  sub_10003FA74();
}

void sub_100061630(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "No tasks were created for %@", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_1000616A8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  sub_10004536C((void *)&_mh_execute_header, v2, v3, "Container %@ shouldn't be marked as not concurrent because it only has %lu task", v4, v5, v6, v7, 2u);

  sub_10003FA74();
}

void sub_100061738()
{
  uint8_t v0[12];
  __int16 v1;
  uint64_t v2;

  sub_100027888();
  v1 = 2112;
  v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't create a block container with nil block %@, block : %@", v0, 0x16u);
}

void sub_1000617BC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Block timed out for %@. It will continue to run, but sysdiagnose will not wait for it to finish. Logs may be missing.", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_100061838(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "name"));
  sub_100045348();
  sub_100045380((void *)&_mh_execute_header, v2, v3, "Completion block for %@ took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);

  sub_100045394();
}

void sub_1000618BC(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "taskName"));
  sub_100045348();
  sub_100045380((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: reply took too long: %.1fs (allowed: %.1fs)", v4, v5, v6, v7, v8);

  sub_100045394();
}

void sub_100061940(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "taskName"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: not calling reply block due to failure", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_1000619BC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "Helper connection error for task %@: failure while running task.", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_100061A38(uint64_t a1, const _xpc_type_s *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "taskName"));
  xpc_type_get_name(a2);
  sub_10004536C((void *)&_mh_execute_header, v4, v5, "Helper connection error for task %@: Received unexpected reply with type: %s", v6, v7, v8, v9, 2u);

  sub_10003FA74();
}

void sub_100061AD4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "taskName"));
  sub_100027888();
  sub_10003FA40((void *)&_mh_execute_header, v2, v3, "No connection with sysdiagnose_helper. Cannot execute task: %@", v4, v5, v6, v7, v8);

  sub_10002780C();
}

void sub_100061B4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "%s called with invalid args", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_100061BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "%s called with invalid args", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_100061C38(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100046A94())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_10003C3C0(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100061CDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, a3, "failed to find ioreg path: %{public}s", a5, a6, a7, a8, 2u);
  sub_100018E70();
}

void sub_100061D50(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_100046A88((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "IORegistryEntryGetName: %d", a1);
}

void sub_100061D90(int a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_100046A88((void *)&_mh_execute_header, &_os_log_default, a3, "failed to create IORegistryEntryCreateIterator: %d", (uint8_t *)v3);
}

void sub_100061E04(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_100046A94())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_10003C3C0(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100061E94(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "tarballPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "completedTarballPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v7 = 138412802;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to move tarball '%@' to final location '%@': %@", (uint8_t *)&v7, 0x20u);

}

void sub_100061F74(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "archiveName"));
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Archive name invalid: %@", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_100061FF0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "outputDirectory"));
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Internal output directory already exists: %@\n", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_10006206C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "completedTarballPath"));
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Output archive already exists: %@\n", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_1000620E8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "baseDirectory"));
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to set attributes on %@", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_100062164()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create summaries directory: %@", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_1000621CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to create errors directory: %@", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_100062234(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "completedOutputDirectory"));
  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v2, "Output directory already exists: %@\n", v3, v4, v5, v6, v7);

  sub_10002780C();
}

void sub_1000622B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "Timed out waiting for sysdiagnose to complete. Timeout: %llus", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_100062318(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100050F80((void *)&_mh_execute_header, &_os_log_default, a3, "Nil names string passed to setOnlyRunContainersWithNames", v3);
}

void sub_100062354(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100050F80((void *)&_mh_execute_header, &_os_log_default, a3, "Invalid name passed to onlyRunContainersWithNames", a1);
}

void sub_10006238C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100050F80((void *)&_mh_execute_header, &_os_log_default, a3, "Resetting only run containers with names array", v3);
}

void sub_1000623C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase.", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_100062430()
{
  int v0;
  int *v1;
  char *v2;
  _DWORD v3[2];
  __int16 v4;
  char *v5;

  v0 = *__error();
  v1 = __error();
  v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  v4 = 2080;
  v5 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Got return value of 0 from clock_gettime_nsec_np with error (%d): %s", (uint8_t *)v3, 0x12u);
  sub_10002780C();
}

void sub_1000624CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100027888();
  sub_100018E3C((void *)&_mh_execute_header, &_os_log_default, v0, "%lu tasks were still running after the generation phases ended.", v1, v2, v3, v4, v5);
  sub_100018E70();
}

void sub_100062534(uint64_t a1)
{
  int *v2;
  char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  char *v7;

  v2 = __error();
  v3 = strerror(*v2);
  v4 = 138412546;
  v5 = a1;
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create %@: %s", (uint8_t *)&v4, 0x16u);
  sub_10002780C();
}

void sub_1000625CC(void *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  __int16 v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourcePath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "targetPath"));
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Tar streaming from: %@, to: %@", (uint8_t *)&v4, 0x16u);

  sub_10002780C();
}

void sub_10006267C(os_log_t log)
{
  int v1;
  uint64_t v2;

  v1 = 134217984;
  v2 = 5;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoreDeviceProxy: timed out (%lus) waiting for browsing to finish", (uint8_t *)&v1, 0xCu);
}

void sub_1000626F8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: CSCoreDeviceProxy: got nil device from from browsing SPI with canceling == false", v1, 2u);
}

void sub_100062738(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_1000627E0()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SDArchive: not going to add file to archive, as its source path is nil", v0, 2u);
}

void sub_100062824(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "SDArchive: not going to add source file %@ to archive, as its target path is nil", (uint8_t *)&v1, 0xCu);
}

void sub_1000628A0()
{
  __assert_rtn("-[SystemDiagnosticIDS init]", "SystemDiagnosticIDS.m", 106, "_service");
}

void sub_1000628C8()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to allocate diagnostic object. Failing early from SDStart", v0, 2u);
}

void sub_10006290C(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
    *(_DWORD *)buf = 138412546;
    v8 = a1;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not create directory %@ with error %@", buf, 0x16u);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  objc_msgSend(v5, "log:", CFSTR("Could not create directory %@ with error %@"), a1, v6);

  __assert_rtn("-[SystemDiagnosticIDS service:account:incomingResourceAtURL:metadata:fromID:context:]", "SystemDiagnosticIDS.m", 816, "0");
}

id objc_msgSend_BFSDirectoryWithURL_withDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BFSDirectoryWithURL:withDepth:");
}

id objc_msgSend_BFSEnumeratorWithPath_withDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BFSEnumeratorWithPath:withDepth:");
}

id objc_msgSend_SDTaskPOSIXSpawnAttributes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SDTaskPOSIXSpawnAttributes");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByResolvingSymlinksInPath");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__closeSysdiagnoseSessionHelper_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_closeSysdiagnoseSessionHelper:");
}

id objc_msgSend__copyAccessibilityPreferences(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAccessibilityPreferences");
}

id objc_msgSend__copyAppInstallationLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAppInstallationLogsContainer");
}

id objc_msgSend__copyAstroLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAstroLogsContainer");
}

id objc_msgSend__copyBTLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyBTLogsContainer");
}

id objc_msgSend__copyCompanionSyncContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyCompanionSyncContainer");
}

id objc_msgSend__copyCoreCaptureBTLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyCoreCaptureBTLogsContainer");
}

id objc_msgSend__copyHIDFWCrashLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyHIDFWCrashLogs");
}

id objc_msgSend__copyHangTracerTailspinsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyHangTracerTailspinsContainer");
}

id objc_msgSend__copyMCLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyMCLogs");
}

id objc_msgSend__copyMobileActivationLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyMobileActivationLogsContainer");
}

id objc_msgSend__copyMobileAssetHistoryLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyMobileAssetHistoryLogs");
}

id objc_msgSend__copyMobileInstallationLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyMobileInstallationLogsContainer");
}

id objc_msgSend__copyNanoPreferencesSyncLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyNanoPreferencesSyncLogs");
}

id objc_msgSend__copyOnDemandDaemonLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyOnDemandDaemonLogsContainer");
}

id objc_msgSend__copyParsecdBagLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyParsecdBagLogs");
}

id objc_msgSend__copyProxiedDeviceCrashLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyProxiedDeviceCrashLogsContainer");
}

id objc_msgSend__copySentryPlistsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySentryPlistsContainer");
}

id objc_msgSend__copySiriAnalyticsDB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySiriAnalyticsDB");
}

id objc_msgSend__copySiriLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySiriLogsContainer");
}

id objc_msgSend__copySplatVersioningLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySplatVersioningLogs");
}

id objc_msgSend__copySplunkHistoryLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copySplunkHistoryLogs");
}

id objc_msgSend__copyTCCLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyTCCLogs");
}

id objc_msgSend__copyThermalLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyThermalLogs");
}

id objc_msgSend__copyVideoProcessingLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyVideoProcessingLogs");
}

id objc_msgSend__copyWatchdogTailspins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyWatchdogTailspins");
}

id objc_msgSend__copyWatchdogdDDTs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyWatchdogdDDTs");
}

id objc_msgSend__createHeaderEntrywithFile_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createHeaderEntrywithFile:attributes:");
}

id objc_msgSend__createTailspinContainerHelper_isRecent_withSizeMB_forGlobsBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:");
}

id objc_msgSend__disposeEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_disposeEntry:");
}

id objc_msgSend__execute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_execute");
}

id objc_msgSend__getAGXMTLCompilerCrashLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getAGXMTLCompilerCrashLogs");
}

id objc_msgSend__getCalendarPrefLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCalendarPrefLogs");
}

id objc_msgSend__getCloudKitBookmarksContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCloudKitBookmarksContainer");
}

id objc_msgSend__getCompressionParameters_forAlgo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCompressionParameters:forAlgo:");
}

id objc_msgSend__getCrashesAndSpinsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getCrashesAndSpinsContainer");
}

id objc_msgSend__getFscklogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getFscklogs");
}

id objc_msgSend__getMapsSyncJournalContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMapsSyncJournalContainer");
}

id objc_msgSend__getNextVariedSet_withLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getNextVariedSet:withLogs:");
}

id objc_msgSend__getSocialLayerPlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSocialLayerPlist");
}

id objc_msgSend__getSpindumpMetaContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getSpindumpMetaContainer:");
}

id objc_msgSend__iOSGetTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iOSGetTimeSensitiveContainers");
}

id objc_msgSend__iOSgetLogCopyingContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iOSgetLogCopyingContainers");
}

id objc_msgSend__iOSgetLogGenerationContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_iOSgetLogGenerationContainers");
}

id objc_msgSend__initWithDevice_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initWithDevice:forDiagnosticID:");
}

id objc_msgSend__initlibArchiveshouldCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initlibArchiveshouldCompress:");
}

id objc_msgSend__initlibParallelCompressionWithOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initlibParallelCompressionWithOption:");
}

id objc_msgSend__internalSpindumpContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_internalSpindumpContainers");
}

id objc_msgSend__localUserHomeDirectories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localUserHomeDirectories");
}

id objc_msgSend__log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_log:");
}

id objc_msgSend__reapTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reapTasks");
}

id objc_msgSend__runBlock_withTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_runBlock:withTimeout:");
}

id objc_msgSend__sizeOutputDirectoryAndGenerateDiagnosticSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sizeOutputDirectoryAndGenerateDiagnosticSummary");
}

id objc_msgSend__writeArchiveHeader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeArchiveHeader:");
}

id objc_msgSend__writeChunk_maxSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeChunk:maxSize:");
}

id objc_msgSend__writeEntryData_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeEntryData:size:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accessoryLogSubsystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryLogSubsystem");
}

id objc_msgSend_accessoryLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryLogs");
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryManager");
}

id objc_msgSend_acquireWithHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithHandler:invalidationHandler:");
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithContext:");
}

id objc_msgSend_activeLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeLimit");
}

id objc_msgSend_addArchiveFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArchiveFile:");
}

id objc_msgSend_addArchiveObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addArchiveObject:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addDirectoryToArchive_withDirName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDirectoryToArchive:withDirName:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFileToArchive_withFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFileToArchive:withFileName:");
}

id objc_msgSend_addGlobContents_toURLArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGlobContents:toURLArray:");
}

id objc_msgSend_addMetricsFromInfoPlist_forBook_withCurrentTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMetricsFromInfoPlist:forBook:withCurrentTime:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPathsToArray_withHighPriority_withMaxVariety_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPathsToArray:withHighPriority:withMaxVariety:");
}

id objc_msgSend_addRules_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRules:");
}

id objc_msgSend_addRulesFromHelperReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRulesFromHelperReply:");
}

id objc_msgSend_addSDTasksToContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSDTasksToContainer:");
}

id objc_msgSend_addSDTasksToContainer_withTmpOutputDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSDTasksToContainer:withTmpOutputDir:");
}

id objc_msgSend_addSessionConfig_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSessionConfig:forDiagnosticID:");
}

id objc_msgSend_advanceMatchEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advanceMatchEnumerator");
}

id objc_msgSend_airpodsGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "airpodsGroup");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allTasksComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allTasksComplete");
}

id objc_msgSend_allTasksFinishedSemaphoresArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allTasksFinishedSemaphoresArray");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleAudioAccessoryLimitedLoggingWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleAudioAccessoryLimitedLoggingWithCompletion:");
}

id objc_msgSend_applyContainerOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyContainerOverride:");
}

id objc_msgSend_applyFilters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyFilters");
}

id objc_msgSend_applyRule_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyRule:");
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive");
}

id objc_msgSend_archiveFD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveFD");
}

id objc_msgSend_archiveName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveName");
}

id objc_msgSend_archiveStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveStatus");
}

id objc_msgSend_archive_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archive_arguments");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_archivesDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivesDirectory");
}

id objc_msgSend_areDiagnosticsInFlight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areDiagnosticsInFlight");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionWithBackgroundActivityIdentifier_forPID_exclusive_showsWhenForeground_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assertionWithBackgroundActivityIdentifier:forPID:exclusive:showsWhenForeground:");
}

id objc_msgSend_attachToBTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachToBTSession");
}

id objc_msgSend_attachedToBTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachedToBTSession");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_baseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baseDirectory");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "block");
}

id objc_msgSend_blockUntilFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockUntilFinished");
}

id objc_msgSend_bluetoothQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothQueue");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_brctl_dir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "brctl_dir");
}

id objc_msgSend_browseDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browseDevices:");
}

id objc_msgSend_btSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btSession");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canAddToCandidateList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canAddToCandidateList");
}

id objc_msgSend_canFileFeedbackOnThisDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canFileFeedbackOnThisDevice:");
}

id objc_msgSend_canLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canLaunch");
}

id objc_msgSend_cancelAll_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAll:");
}

id objc_msgSend_cancelConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelConnection");
}

id objc_msgSend_capOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capOverride");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_changedDiagnosticProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changedDiagnosticProperties");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkAndIncreaseDiagnosticCountForDiagnosticID_collectingLocalLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkAndIncreaseDiagnosticCountForDiagnosticID:collectingLocalLogs:");
}

id objc_msgSend_childExitHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childExitHandler");
}

id objc_msgSend_clearAllResources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllResources");
}

id objc_msgSend_clearHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearHistory");
}

id objc_msgSend_clearLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearLogs");
}

id objc_msgSend_cliWrite_logStr_withParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cliWrite:logStr:withParameters:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_closeArchive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeArchive");
}

id objc_msgSend_closeCLI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeCLI");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_closeFileHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFileHandles");
}

id objc_msgSend_closeSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSummary");
}

id objc_msgSend_closeSysdiagnoseLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSysdiagnoseLog");
}

id objc_msgSend_closeSysdiagnoseSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeSysdiagnoseSession");
}

id objc_msgSend_closeTaskSummaryHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeTaskSummaryHandle");
}

id objc_msgSend_coSysdiagnose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coSysdiagnose");
}

id objc_msgSend_coSysdiagnoseOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coSysdiagnoseOnly");
}

id objc_msgSend_coSysdiagnoseParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coSysdiagnoseParameters");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_collectWifiDextCoreFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectWifiDextCoreFiles");
}

id objc_msgSend_collectionContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionContainer");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_completeTarball(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeTarball");
}

id objc_msgSend_completedOutputDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedOutputDirectory");
}

id objc_msgSend_completedTarballPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedTarballPath");
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionBlock");
}

id objc_msgSend_completionDispatchGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionDispatchGroup");
}

id objc_msgSend_complexContainerWithBlock_withTimeout_atDestination_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithBlock:withTimeout:atDestination:withDelegate:");
}

id objc_msgSend_complexContainerWithSPITask_withTimeout_atDestination_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:");
}

id objc_msgSend_complexContainerWithSPITask_withTimeout_atDestination_withDelegate_withIntermediateDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:withIntermediateDirectory:");
}

id objc_msgSend_complexContainerWithTasks_withTimeout_withRules_atDestination_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:");
}

id objc_msgSend_complexContainerWithTasks_withTimeout_withRules_atDestination_withDelegate_isConcurrent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_componentsWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithString:");
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_configureDefaultSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configureDefaultSettings");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_considerURL_forRejection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "considerURL:forRejection:");
}

id objc_msgSend_containerAtLocation_forTaskType_withTimeout_withDelegate_withMsgContents_withReplyBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:");
}

id objc_msgSend_containerWithName_destination_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withDelegate:");
}

id objc_msgSend_containerWithName_destination_withTimeout_withConcurrency_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:");
}

id objc_msgSend_containerWithName_destination_withTimeout_withConcurrency_withDelegate_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:");
}

id objc_msgSend_containerWithName_destination_withTimeout_withTargetArchive_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:destination:withTimeout:withTargetArchive:withDelegate:");
}

id objc_msgSend_containerWithName_forBlock_withTimeout_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:forBlock:withTimeout:withDelegate:");
}

id objc_msgSend_containerWithName_forBlock_withTimeout_withDelegate_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerWithName:forBlock:withTimeout:withDelegate:withCompletionBlock:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCoreaudioReportingLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCoreaudioReportingLogs");
}

id objc_msgSend_copyFilesForDirectory_withStreaming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFilesForDirectory:withStreaming:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countCPUTimeUsedNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countCPUTimeUsedNS");
}

id objc_msgSend_cpuTimeUsedNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuTimeUsedNS");
}

id objc_msgSend_createChild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createChild");
}

id objc_msgSend_createChildProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createChildProcess");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createFileAndTransfer_atLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAndTransfer:atLocation:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createFileHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileHandles");
}

id objc_msgSend_createLaunchConstraintData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createLaunchConstraintData");
}

id objc_msgSend_createOnlyRunContainersWithNamesArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOnlyRunContainersWithNamesArray:");
}

id objc_msgSend_createRulesFromPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createRulesFromPaths:");
}

id objc_msgSend_createTailspinContainer_withSizeMB_forGlobsBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTailspinContainer:withSizeMB:forGlobsBlock:");
}

id objc_msgSend_createTaskHandlers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTaskHandlers:");
}

id objc_msgSend_createdSince(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createdSince");
}

id objc_msgSend_createdUntil(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createdUntil");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "creationDate");
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentClient");
}

id objc_msgSend_currentUserActivityUUIDWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUserActivityUUIDWithOptions:completionHandler:");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_deShowFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deShowFeedback");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_decreaseDiagnosticCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decreaseDiagnosticCount");
}

id objc_msgSend_decreaseDiagnosticCountForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decreaseDiagnosticCountForDiagnosticID:");
}

id objc_msgSend_defaultAirpodTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAirpodTimeout");
}

id objc_msgSend_defaultAllTasksFinishedSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultAllTasksFinishedSemaphore");
}

id objc_msgSend_defaultBaseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultBaseDirectory");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_depth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "depth");
}

id objc_msgSend_deregisterBTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deregisterBTSession");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destination");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_diagnosticID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticID");
}

id objc_msgSend_diagnosticIDExists_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticIDExists:");
}

id objc_msgSend_diagnosticObjectForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticObjectForDiagnosticID:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didComplete");
}

id objc_msgSend_didPartnerTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didPartnerTimeout");
}

id objc_msgSend_directory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directory");
}

id objc_msgSend_directoryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "directoryQueue");
}

id objc_msgSend_disableStreamTar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableStreamTar");
}

id objc_msgSend_disableUIFeedback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUIFeedback");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dpClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dpClass");
}

id objc_msgSend_dropCoSysdiagnoseError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropCoSysdiagnoseError:");
}

id objc_msgSend_durationMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "durationMetrics");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earlyPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlyPrompt");
}

id objc_msgSend_elapsedMetricForPhaseID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elapsedMetricForPhaseID:");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elapsedTime");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elements");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "end");
}

id objc_msgSend_endDiagnostics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDiagnostics");
}

id objc_msgSend_endExecution(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endExecution");
}

id objc_msgSend_endRemoteInitiatedFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endRemoteInitiatedFlow");
}

id objc_msgSend_endStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endStatus");
}

id objc_msgSend_endTaskDepotForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTaskDepotForPhase:");
}

id objc_msgSend_enforceContainerSizeLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforceContainerSizeLimit");
}

id objc_msgSend_enforceSizeOnLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enforceSizeOnLogs:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumerators(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerators");
}

id objc_msgSend_evaluateCollectionFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateCollectionFlags");
}

id objc_msgSend_evaluateCollectionFlagsWithOverlay_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateCollectionFlagsWithOverlay:withName:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_exceededAllowedCPUTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceededAllowedCPUTime:");
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute");
}

id objc_msgSend_executeContainers_inPhase_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeContainers:inPhase:withCompletionBlock:");
}

id objc_msgSend_executeContainersInPhase_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeContainersInPhase:withCompletionBlock:");
}

id objc_msgSend_executeDiagnosticContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeDiagnosticContainers");
}

id objc_msgSend_executeFromCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeFromCallback");
}

id objc_msgSend_executeOSLogArchiveContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeOSLogArchiveContainers");
}

id objc_msgSend_executedContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executedContainers");
}

id objc_msgSend_executionActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionActivity");
}

id objc_msgSend_executionGroupDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionGroupDictionary");
}

id objc_msgSend_executionLine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionLine");
}

id objc_msgSend_executionTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executionTime");
}

id objc_msgSend_exitSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitSource");
}

id objc_msgSend_expandHomeDirectoriesAtPath_andAddToURLArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expandHomeDirectoriesAtPath:andAddToURLArray:");
}

id objc_msgSend_expandHomeDirectoriesForGlob_andAddToURLArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expandHomeDirectoriesForGlob:andAddToURLArray:");
}

id objc_msgSend_exposureNotificationDBURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exposureNotificationDBURL");
}

id objc_msgSend_exposureNotificationGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exposureNotificationGroup");
}

id objc_msgSend_extensionsWithFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithFilter:");
}

id objc_msgSend_extractMetricsFromInfoPlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extractMetricsFromInfoPlist:");
}

id objc_msgSend_fd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fd");
}

id objc_msgSend_fdManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fdManager");
}

id objc_msgSend_fetchUserActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserActivity");
}

id objc_msgSend_fetchUserActivityWithUUID_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchUserActivityWithUUID:completionHandler:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandleForError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForError");
}

id objc_msgSend_fileHandleForOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForOutput");
}

id objc_msgSend_fileHandleForUpdatingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForUpdatingAtPath:");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileModificationDate");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filename");
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filter");
}

id objc_msgSend_filterDiagnosticContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterDiagnosticContainers:");
}

id objc_msgSend_finishChild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishChild");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finished");
}

id objc_msgSend_finishedItemForPhaseAndUpdatePeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedItemForPhaseAndUpdatePeer:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flattenReturnedDirectoryPaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flattenReturnedDirectoryPaths");
}

id objc_msgSend_forceDeregisterBTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDeregisterBTSession");
}

id objc_msgSend_frontmostBundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontmostBundleID");
}

id objc_msgSend_gatherDiagnostic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherDiagnostic");
}

id objc_msgSend_gatherLocalSysdiagnoseForMsg_withReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gatherLocalSysdiagnoseForMsg:withReply:");
}

id objc_msgSend_generateMaxVariety_withLogs_withHighPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateMaxVariety:withLogs:withHighPriority:");
}

id objc_msgSend_generatePlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePlist");
}

id objc_msgSend_generateSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSummary");
}

id objc_msgSend_getACLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getACLogsContainer");
}

id objc_msgSend_getACMToolContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getACMToolContainer");
}

id objc_msgSend_getAHSToolContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAHSToolContainer");
}

id objc_msgSend_getAOPFirmwareStateContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAOPFirmwareStateContainer");
}

id objc_msgSend_getASPMagazineContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getASPMagazineContainer");
}

id objc_msgSend_getASPSnapshotContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getASPSnapshotContainer");
}

id objc_msgSend_getASPSnapshotsContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getASPSnapshotsContainers");
}

id objc_msgSend_getASPTraceContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getASPTraceContainers");
}

id objc_msgSend_getAccessibilityPrefContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAccessibilityPrefContainer");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivePairedDevice");
}

id objc_msgSend_getActivityID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getActivityID");
}

id objc_msgSend_getAirPlayContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAirPlayContainer");
}

id objc_msgSend_getAirpodsTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAirpodsTimeout");
}

id objc_msgSend_getAopaudctlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAopaudctlContainer");
}

id objc_msgSend_getApfsStatsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getApfsStatsContainer");
}

id objc_msgSend_getAppleInternalPreferencesLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAppleInternalPreferencesLogs");
}

id objc_msgSend_getArchiveExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getArchiveExtension");
}

id objc_msgSend_getArkitctlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getArkitctlContainer");
}

id objc_msgSend_getAutogenLogCopyingContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAutogenLogCopyingContainers");
}

id objc_msgSend_getAutogenLogGenerationContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAutogenLogGenerationContainers");
}

id objc_msgSend_getAutogenTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAutogenTimeSensitiveContainers");
}

id objc_msgSend_getBTPHYLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBTPHYLogsContainer");
}

id objc_msgSend_getBaseBandContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBaseBandContainer");
}

id objc_msgSend_getBatteryUIContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBatteryUIContainer");
}

id objc_msgSend_getBrctlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBrctlContainer");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCADebugContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCADebugContainer");
}

id objc_msgSend_getCKKSCTLContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCKKSCTLContainer");
}

id objc_msgSend_getCaseInsensitiveMatches_forString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCaseInsensitiveMatches:forString:");
}

id objc_msgSend_getCollectAllTrustedForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCollectAllTrustedForDiagnosticID:");
}

id objc_msgSend_getContainersMetricForPhaseId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getContainersMetricForPhaseId:");
}

id objc_msgSend_getCoreCaptureSPIContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreCaptureSPIContainer");
}

id objc_msgSend_getCoreDuetLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreDuetLogs");
}

id objc_msgSend_getCurrentInflightLocalDiagnostic(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentInflightLocalDiagnostic");
}

id objc_msgSend_getDSCSYMContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDSCSYMContainer");
}

id objc_msgSend_getDefaultArchiveName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDefaultArchiveName");
}

id objc_msgSend_getDiagnosticContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiagnosticContainers:");
}

id objc_msgSend_getDiagnosticID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiagnosticID");
}

id objc_msgSend_getDiagnosticIDForPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiagnosticIDForPid:");
}

id objc_msgSend_getDiagnosticIDSimple(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiagnosticIDSimple");
}

id objc_msgSend_getDiskTasksContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDiskTasksContainer");
}

id objc_msgSend_getDispatchGroupForDiagnostic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDispatchGroupForDiagnostic:");
}

id objc_msgSend_getDisplaytoolContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDisplaytoolContainer");
}

id objc_msgSend_getEnumerateCrashReporterContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnumerateCrashReporterContainer");
}

id objc_msgSend_getEnumeratorForVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnumeratorForVolume:");
}

id objc_msgSend_getExcResourceContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExcResourceContainer");
}

id objc_msgSend_getExposureNotificationContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExposureNotificationContainer");
}

id objc_msgSend_getFDRDiagnosticContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFDRDiagnosticContainer");
}

id objc_msgSend_getFileProviderCTLContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileProviderCTLContainer");
}

id objc_msgSend_getFreezerctlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFreezerctlContainer");
}

id objc_msgSend_getGNIContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGNIContainer");
}

id objc_msgSend_getGestaltQueryContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGestaltQueryContainer");
}

id objc_msgSend_getHIDRecorderdContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHIDRecorderdContainer");
}

id objc_msgSend_getHIDReportContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHIDReportContainers");
}

id objc_msgSend_getHomeUtilAccessoryStateContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHomeUtilAccessoryStateContainer");
}

id objc_msgSend_getHomeUtilDumpAllContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHomeUtilDumpAllContainer");
}

id objc_msgSend_getHostOutputDirForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHostOutputDirForDiagnosticID:");
}

id objc_msgSend_getIDSCaseString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIDSCaseString:");
}

id objc_msgSend_getIDSCommandString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIDSCommandString:");
}

id objc_msgSend_getIDSContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIDSContainer");
}

id objc_msgSend_getIOLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIOLogsContainer");
}

id objc_msgSend_getIOREGContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIOREGContainer");
}

id objc_msgSend_getInternalLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInternalLogsContainer");
}

id objc_msgSend_getKCSharingContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKCSharingContainer");
}

id objc_msgSend_getKeyboardPrefContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKeyboardPrefContainer");
}

id objc_msgSend_getLGSystemInfoContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLGSystemInfoContainer");
}

id objc_msgSend_getLGUtilitiesContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLGUtilitiesContainer");
}

id objc_msgSend_getLibnotifyContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLibnotifyContainer");
}

id objc_msgSend_getLibtraceContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLibtraceContainers");
}

id objc_msgSend_getLogCopyingContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogCopyingContainers");
}

id objc_msgSend_getLogGenerationContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogGenerationContainers");
}

id objc_msgSend_getLogStreamFilterContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogStreamFilterContainer");
}

id objc_msgSend_getLogarchiveCollectionContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogarchiveCollectionContainer");
}

id objc_msgSend_getLogarchiveSummaryContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getLogarchiveSummaryContainer");
}

id objc_msgSend_getMediaContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMediaContainer");
}

id objc_msgSend_getMicrostackshotsWithPostContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMicrostackshotsWithPostContainers");
}

id objc_msgSend_getMinimumTimeBeforeTimeoutsForPhaseID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMinimumTimeBeforeTimeoutsForPhaseID:");
}

id objc_msgSend_getMultiTouchContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMultiTouchContainer");
}

id objc_msgSend_getNextMatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNextMatch");
}

id objc_msgSend_getOTCTLContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOTCTLContainer");
}

id objc_msgSend_getPersonalizationLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPersonalizationLogs");
}

id objc_msgSend_getPommesStatusContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPommesStatusContainer");
}

id objc_msgSend_getPowerLogContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowerLogContainer");
}

id objc_msgSend_getPowermetricsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPowermetricsContainer");
}

id objc_msgSend_getPredicateForFileTypes_withExcludedPrefixes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPredicateForFileTypes:withExcludedPrefixes:");
}

id objc_msgSend_getPreferencesLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPreferencesLogs");
}

id objc_msgSend_getProcessesInfoContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProcessesInfoContainer");
}

id objc_msgSend_getProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProgress");
}

id objc_msgSend_getProtectionClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProtectionClass");
}

id objc_msgSend_getProxiesForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProxiesForDiagnosticID:");
}

id objc_msgSend_getProximityContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getProximityContainers");
}

id objc_msgSend_getReceiveFileSemaForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReceiveFileSemaForDiagnosticID:");
}

id objc_msgSend_getRemoteDeviceForUUIDStr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemoteDeviceForUUIDStr:");
}

id objc_msgSend_getRemoteUUIDsForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemoteUUIDsForDiagnosticID:");
}

id objc_msgSend_getRemotectlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRemotectlContainer");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getRmdContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRmdContainer");
}

id objc_msgSend_getRunningBoardLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRunningBoardLogs");
}

id objc_msgSend_getSPIContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSPIContainers");
}

id objc_msgSend_getSWTransparencyContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSWTransparencyContainer");
}

id objc_msgSend_getSampleContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSampleContainer");
}

id objc_msgSend_getSelfCtlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSelfCtlContainer");
}

id objc_msgSend_getService_forDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getService:forDevice:");
}

id objc_msgSend_getSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSettings");
}

id objc_msgSend_getSimplePathArrayContainer_withContainerName_andDestination_withOffsets_sizes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:");
}

id objc_msgSend_getSoundAutoConfigContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSoundAutoConfigContainer");
}

id objc_msgSend_getSoundBoardContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSoundBoardContainer");
}

id objc_msgSend_getSpindumpContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpindumpContainers");
}

id objc_msgSend_getSpuctlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpuctlContainer");
}

id objc_msgSend_getStackshotContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStackshotContainer");
}

id objc_msgSend_getStoreServicesContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStoreServicesContainer");
}

id objc_msgSend_getStspContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStspContainer");
}

id objc_msgSend_getSubPredicateForFileTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubPredicateForFileTypes:");
}

id objc_msgSend_getSubPredicateForPrefixes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubPredicateForPrefixes:");
}

id objc_msgSend_getSysCfgContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSysCfgContainer");
}

id objc_msgSend_getTSProcessSpecificContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTSProcessSpecificContainers");
}

id objc_msgSend_getTSSystemInfoContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTSSystemInfoContainer");
}

id objc_msgSend_getTailspinContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTailspinContainers");
}

id objc_msgSend_getThermHIDContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getThermHIDContainers");
}

id objc_msgSend_getTimeSensitiveContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeSensitiveContainers");
}

id objc_msgSend_getTimeoutSec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeoutSec");
}

id objc_msgSend_getTimeoutTarget(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimeoutTarget");
}

id objc_msgSend_getTimezoneDBLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTimezoneDBLogs");
}

id objc_msgSend_getTransparencyContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTransparencyContainer");
}

id objc_msgSend_getTrialRolloutsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTrialRolloutsContainer");
}

id objc_msgSend_getTriggerBasebandDumpContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTriggerBasebandDumpContainer");
}

id objc_msgSend_getUUIDStrForRemoteDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDStrForRemoteDevice:");
}

id objc_msgSend_getUncompressedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUncompressedSize");
}

id objc_msgSend_getUptimeContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUptimeContainer");
}

id objc_msgSend_getUserSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUserSettings");
}

id objc_msgSend_getWallTimeFromMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWallTimeFromMetadata:");
}

id objc_msgSend_getWifiDextCorefilesContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getWifiDextCorefilesContainer");
}

id objc_msgSend_getaccountsInternalLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getaccountsInternalLogsContainer");
}

id objc_msgSend_getc26ToolContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getc26ToolContainer");
}

id objc_msgSend_getclpcContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getclpcContainer");
}

id objc_msgSend_getclpcctrlContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getclpcctrlContainer");
}

id objc_msgSend_getcontrolbitsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getcontrolbitsContainer");
}

id objc_msgSend_getlaunchdAndCTSContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getlaunchdAndCTSContainers");
}

id objc_msgSend_getlaunchdContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getlaunchdContainer");
}

id objc_msgSend_getmiscInternalLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getmiscInternalLogsContainer");
}

id objc_msgSend_getosvariantUtilContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getosvariantUtilContainer");
}

id objc_msgSend_getsmcDiagnoseContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getsmcDiagnoseContainer");
}

id objc_msgSend_getswcutilContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getswcutilContainer");
}

id objc_msgSend_getsysconfigInternalLogsContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getsysconfigInternalLogsContainer");
}

id objc_msgSend_glob(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "glob");
}

id objc_msgSend_handleClientEvent_forMsg_isTrusted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleClientEvent:forMsg:isTrusted:");
}

id objc_msgSend_handleRemoteConnection_forMsg_isTrusted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRemoteConnection:forMsg:isTrusted:");
}

id objc_msgSend_handleRemoteResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleRemoteResponse:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_headDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headDir");
}

id objc_msgSend_helperRepliedHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "helperRepliedHandler");
}

id objc_msgSend_highPriorityLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "highPriorityLogs");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_hostOutputDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostOutputDir");
}

id objc_msgSend_hostWaitGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hostWaitGroup");
}

id objc_msgSend_idsCase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsCase");
}

id objc_msgSend_inactiveLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactiveLimit");
}

id objc_msgSend_includeSyncedExtensionForFileTypes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "includeSyncedExtensionForFileTypes:");
}

id objc_msgSend_increaseCountForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseCountForPhase:");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initCacheEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumerator");
}

id objc_msgSend_initCacheEnumeratorWithVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumeratorWithVolume:");
}

id objc_msgSend_initCacheEnumeratorWithVolume_WithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumeratorWithVolume:WithFlags:");
}

id objc_msgSend_initConnectionWithPeer_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initConnectionWithPeer:forDiagnosticID:");
}

id objc_msgSend_initPeerProgressHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPeerProgressHandler");
}

id objc_msgSend_initProgressTrackerWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initProgressTrackerWithConnection:");
}

id objc_msgSend_initProxiesForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initProxiesForDiagnosticID:");
}

id objc_msgSend_initRemoteServers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRemoteServers");
}

id objc_msgSend_initStreaming(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initStreaming");
}

id objc_msgSend_initWithArchivesDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArchivesDirectory:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_initWithDisplayType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDisplayType:");
}

id objc_msgSend_initWithFD_withOptions_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFD:withOptions:withName:");
}

id objc_msgSend_initWithFileDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithName_andDestination_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:andDestination:withDelegate:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPath_subdirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:subdirectory:error:");
}

id objc_msgSend_initWithPath_target_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:target:ofType:");
}

id objc_msgSend_initWithPath_withOptions_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:withOptions:withName:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithServiceName_viewControllerClassName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServiceName:viewControllerClassName:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initiatedByRemoteHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiatedByRemoteHost");
}

id objc_msgSend_inputStreamWithFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inputStreamWithFileAtPath:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAbsolutePath");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAutomaticCoSysdiagnosePossible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticCoSysdiagnosePossible");
}

id objc_msgSend_isCoSysdiagnoseResponse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoSysdiagnoseResponse");
}

id objc_msgSend_isConcurrent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConcurrent");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDaemon");
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPairedDevice");
}

id objc_msgSend_isDeviceUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceUnlockedSinceBoot");
}

id objc_msgSend_isDeviceWithUUIDAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDeviceWithUUIDAvailable:");
}

id objc_msgSend_isEarlyPrompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEarlyPrompt");
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

id objc_msgSend_isExecutableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExecutableFileAtPath:");
}

id objc_msgSend_isHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHost");
}

id objc_msgSend_isLimitedLoggingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLimitedLoggingEnabled");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPaired");
}

id objc_msgSend_isPromptEligible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPromptEligible");
}

id objc_msgSend_isReadableFileAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReadableFileAtPath:");
}

id objc_msgSend_isRemoteInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRemoteInitiated");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningAlone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRunningAlone");
}

id objc_msgSend_isSysdiagnoseFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSysdiagnoseFile:");
}

id objc_msgSend_isTestingMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTestingMode");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_launchPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchPath");
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutRole");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_loadExtensions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadExtensions");
}

id objc_msgSend_localGroupDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localGroupDictionary");
}

id objc_msgSend_localLogCollectionDiagnosticID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localLogCollectionDiagnosticID");
}

id objc_msgSend_localTupleDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTupleDictionary");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log:");
}

id objc_msgSend_logAgentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAgentConnection");
}

id objc_msgSend_logArchiveOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logArchiveOverride:");
}

id objc_msgSend_logArchiveUnitWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logArchiveUnitWithDictionary:");
}

id objc_msgSend_logArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logArray");
}

id objc_msgSend_logChildExitReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logChildExitReason:");
}

id objc_msgSend_logCollectionContainer_didRejectFile_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCollectionContainer:didRejectFile:forReason:");
}

id objc_msgSend_logCollectionContainerDidCopyFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCollectionContainerDidCopyFile:");
}

id objc_msgSend_logCompletionHandler_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logCompletionHandler:size:");
}

id objc_msgSend_logContainerAsExecuted_inPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logContainerAsExecuted:inPhase:");
}

id objc_msgSend_logDates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logDates");
}

id objc_msgSend_logFileToSummary_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logFileToSummary:description:");
}

id objc_msgSend_logRuleWithDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithDirectory:");
}

id objc_msgSend_logRuleWithDirectory_atInternalDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithDirectory:atInternalDirectory:");
}

id objc_msgSend_logRuleWithDirectory_withDepth_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logRuleWithGlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithGlob:");
}

id objc_msgSend_logRuleWithGlob_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logRuleWithMutablePaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithMutablePaths:");
}

id objc_msgSend_logRuleWithPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithPaths:");
}

id objc_msgSend_logRuleWithPaths_withDate_withFilter_newestFileCount_atInternalDirectory_withRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:");
}

id objc_msgSend_logSubsystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logSubsystem");
}

id objc_msgSend_logWithSubsystem_category_msg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logWithSubsystem:category:msg:");
}

id objc_msgSend_logs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logs");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_makeOutputDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeOutputDirectory");
}

id objc_msgSend_makeTargetDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeTargetDirectory:");
}

id objc_msgSend_markAirpodLogsDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markAirpodLogsDone:");
}

id objc_msgSend_markExposureNotificationLogsDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markExposureNotificationLogsDone:");
}

id objc_msgSend_markFoldersAsComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markFoldersAsComplete");
}

id objc_msgSend_matchEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchEnumerator");
}

id objc_msgSend_maxDepth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxDepth");
}

id objc_msgSend_maxHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxHistory");
}

id objc_msgSend_maxVariety(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxVariety");
}

id objc_msgSend_maximumSizeMB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumSizeMB");
}

id objc_msgSend_mayStartExecuting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mayStartExecuting");
}

id objc_msgSend_metricsDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsDict");
}

id objc_msgSend_minimumTimeBeforeTimeouts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumTimeBeforeTimeouts");
}

id objc_msgSend_mobileContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileContainer");
}

id objc_msgSend_mobileContainerClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mobileContainerClass");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_msgContents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "msgContents");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_newestFileLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newestFileLimit");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextSysdiagnoseFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextSysdiagnoseFile");
}

id objc_msgSend_nextValidURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextValidURL");
}

id objc_msgSend_noTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "noTimeout");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_numAttachTries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numAttachTries");
}

id objc_msgSend_numExitedTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numExitedTasks");
}

id objc_msgSend_numReapedTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numReapedTasks");
}

id objc_msgSend_numRunningBlocks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numRunningBlocks");
}

id objc_msgSend_numRunningHelperTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numRunningHelperTasks");
}

id objc_msgSend_numRunningTaskContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numRunningTaskContainers");
}

id objc_msgSend_numTimeouts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numTimeouts");
}

id objc_msgSend_numberDiagnosticsInflight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberDiagnosticsInflight");
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

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
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

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsets");
}

id objc_msgSend_onlyRunContainersWithNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onlyRunContainersWithNames");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openIssueFiler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openIssueFiler");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_outputDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDir");
}

id objc_msgSend_outputDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputDirectory");
}

id objc_msgSend_outputMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputMetrics");
}

id objc_msgSend_overrideContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideContainers");
}

id objc_msgSend_parseSizeToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseSizeToString:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathSubmission");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paths");
}

id objc_msgSend_peerManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerManager");
}

id objc_msgSend_performSysdiagnoseKeychordEventWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSysdiagnoseKeychordEventWithCompletionHandler:");
}

id objc_msgSend_periodicAPFSMarkAsPurgeable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodicAPFSMarkAsPurgeable:");
}

id objc_msgSend_phaseTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "phaseTracker");
}

id objc_msgSend_pidForProcessName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidForProcessName:");
}

id objc_msgSend_pidIndices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pidIndices");
}

id objc_msgSend_pipelineFlush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pipelineFlush");
}

id objc_msgSend_populateProcessInfoForInput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateProcessInfoForInput");
}

id objc_msgSend_populateProcesses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateProcesses");
}

id objc_msgSend_possibleClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "possibleClient");
}

id objc_msgSend_postNotificationName_object_userInfo_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:options:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prepareCoSysdiagnoseParams(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareCoSysdiagnoseParams");
}

id objc_msgSend_prepareOutput(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareOutput");
}

id objc_msgSend_prepareOutputDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareOutputDirectory");
}

id objc_msgSend_preparePaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preparePaths");
}

id objc_msgSend_prepareSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareSummary");
}

id objc_msgSend_processCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCount");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processes");
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productBuildVersion");
}

id objc_msgSend_progressManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressManager");
}

id objc_msgSend_prompt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prompt");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_providedPIDorProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "providedPIDorProcess");
}

id objc_msgSend_proxies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxies");
}

id objc_msgSend_pushBufferDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pushBufferDelegate");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_quickMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "quickMode");
}

id objc_msgSend_ranForMaximumTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ranForMaximumTime");
}

id objc_msgSend_ranForMinimumTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ranForMinimumTime");
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfCharacterFromSet:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_readCoSysdiagnoseSetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readCoSysdiagnoseSetting");
}

id objc_msgSend_readDataUpToLength_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataUpToLength:error:");
}

id objc_msgSend_readyToReceiveCoSysdiagnosesAtDir_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readyToReceiveCoSysdiagnosesAtDir:forDiagnosticID:");
}

id objc_msgSend_reapTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reapTasks");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_receiveFileFromRemote_forDiagnosticID_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveFileFromRemote:forDiagnosticID:withCompletionBlock:");
}

id objc_msgSend_receiveFileSema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveFileSema");
}

id objc_msgSend_recordBlockTaskEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordBlockTaskEnd");
}

id objc_msgSend_recordBlockTaskStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordBlockTaskStart");
}

id objc_msgSend_recordDiagnosticsMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordDiagnosticsMetrics:");
}

id objc_msgSend_recordHelperTaskEnd(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordHelperTaskEnd");
}

id objc_msgSend_recordHelperTaskStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordHelperTaskStart");
}

id objc_msgSend_recordTaskContainerEnd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordTaskContainerEnd:");
}

id objc_msgSend_recordTaskContainerStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordTaskContainerStart:");
}

id objc_msgSend_registerActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerActivity");
}

id objc_msgSend_registerActivityWithID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerActivityWithID:");
}

id objc_msgSend_registerCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerCallbacks");
}

id objc_msgSend_registerDiagnosticObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDiagnosticObject:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_rejectFile_forReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rejectFile:forReason:");
}

id objc_msgSend_rejectionReasonToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rejectionReasonToString:");
}

id objc_msgSend_relative(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relative");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePath");
}

id objc_msgSend_remainingDepth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remainingDepth");
}

id objc_msgSend_remoteGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteGroup");
}

id objc_msgSend_remoteSendFile_toPeer_withTimeoutTarget_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteSendFile:toPeer:withTimeoutTarget:");
}

id objc_msgSend_remoteSysdiagnoseID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteSysdiagnoseID");
}

id objc_msgSend_remoteUUIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteUUIDs");
}

id objc_msgSend_removeActivityIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeActivityIDs:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCLI_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeCLI:");
}

id objc_msgSend_removeDiagnosticObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDiagnosticObject:");
}

id objc_msgSend_removeFds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFds:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeLibClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLibClient:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeProgressTracking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeProgressTracking:");
}

id objc_msgSend_removeSessionConfigForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSessionConfigForDiagnosticID:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceObjectsAtIndexes_withObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectsAtIndexes:withObjects:");
}

id objc_msgSend_replaceTaskArguments_withSubstitutionKey_withSubstitutionString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceTaskArguments:withSubstitutionKey:withSubstitutionString:");
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reply");
}

id objc_msgSend_replyBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyBlock");
}

id objc_msgSend_requestSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestSource");
}

id objc_msgSend_resetTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetTimeout:");
}

id objc_msgSend_resolveCrashReporterPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveCrashReporterPath:");
}

id objc_msgSend_resolveHomeDirs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolveHomeDirs");
}

id objc_msgSend_resolvePathToMobileContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvePathToMobileContainer:");
}

id objc_msgSend_resolvePaths(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvePaths");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retryAttachToBTSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retryAttachToBTSession");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rootPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootPath");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runByItself(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runByItself");
}

id objc_msgSend_runWithTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithTimeout:");
}

id objc_msgSend_run_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run_queue");
}

id objc_msgSend_runningTaskContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningTaskContainers");
}

id objc_msgSend_runningTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runningTasks");
}

id objc_msgSend_runtimeChecks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runtimeChecks");
}

id objc_msgSend_runtimeFlagDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runtimeFlagDelegate");
}

id objc_msgSend_rusage_details(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rusage_details");
}

id objc_msgSend_safeLeaveHostWaitGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeLeaveHostWaitGroup");
}

id objc_msgSend_safeLeaveRemoteGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "safeLeaveRemoteGroup");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_searchForTransfer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchForTransfer:");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndOfFile");
}

id objc_msgSend_seekToOffset_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToOffset:error:");
}

id objc_msgSend_sendCoreAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCoreAnalytics");
}

id objc_msgSend_sendDefaultsInstructions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDefaultsInstructions");
}

id objc_msgSend_sendFailedInstructions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFailedInstructions");
}

id objc_msgSend_sendFileAtPath_forDiagnosticID_withCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFileAtPath:forDiagnosticID:withCase:");
}

id objc_msgSend_sendFilenamePair_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendFilenamePair:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_sendMessage_WithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:WithData:");
}

id objc_msgSend_sendMessage_WithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:WithString:");
}

id objc_msgSend_sendPathToArchive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPathToArchive");
}

id objc_msgSend_sendProgress_phase_toPeers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProgress:phase:toPeers:");
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendRemoteArchiveMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRemoteArchiveMessage:");
}

id objc_msgSend_sendUnableToCreateMsg(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendUnableToCreateMsg");
}

id objc_msgSend_sendWatchListWithDiagnosticId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendWatchListWithDiagnosticId:");
}

id objc_msgSend_sequentialTasksQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequentialTasksQueue");
}

id objc_msgSend_sequentialTasksSem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequentialTasksSem");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_sessionConfigs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionConfigs");
}

id objc_msgSend_sessionEvent_event_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionEvent:event:result:");
}

id objc_msgSend_setAccessoryLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryLogs:");
}

id objc_msgSend_setAccessoryManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAccessoryManager:");
}

id objc_msgSend_setActivePairedDevice_withActiveDeviceAssertionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivePairedDevice:withActiveDeviceAssertionHandler:");
}

id objc_msgSend_setAirpodsGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAirpodsGroup:");
}

id objc_msgSend_setAllTasksFinishedSemaphoresArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllTasksFinishedSemaphoresArray:");
}

id objc_msgSend_setArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchive:");
}

id objc_msgSend_setArchiveName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchiveName:");
}

id objc_msgSend_setArchive_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArchive_arguments:");
}

id objc_msgSend_setArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArguments:");
}

id objc_msgSend_setAttachedToBTSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachedToBTSession:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setBaseDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaseDirectory:");
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlock:");
}

id objc_msgSend_setBlockUntilFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBlockUntilFinished:");
}

id objc_msgSend_setBtSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtSession:");
}

id objc_msgSend_setBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBundleID:");
}

id objc_msgSend_setCanDisplayTarBall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanDisplayTarBall:");
}

id objc_msgSend_setCapOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCapOverride:");
}

id objc_msgSend_setChangedDiagnosticProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChangedDiagnosticProperties:");
}

id objc_msgSend_setCoSysdiagnose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoSysdiagnose:");
}

id objc_msgSend_setCoSysdiagnoseOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCoSysdiagnoseOnly:");
}

id objc_msgSend_setCollectAllTrusted_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectAllTrusted:forDiagnosticID:");
}

id objc_msgSend_setCollectWifiDextCoreFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectWifiDextCoreFiles:");
}

id objc_msgSend_setCollectionContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCollectionContainer:");
}

id objc_msgSend_setCompletedOutputDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedOutputDirectory:");
}

id objc_msgSend_setCompletedTarballPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletedTarballPath:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCount:");
}

id objc_msgSend_setCpuTimeUsedNS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCpuTimeUsedNS:");
}

id objc_msgSend_setCreatedSince_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreatedSince:");
}

id objc_msgSend_setCreatedUntil_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCreatedUntil:");
}

id objc_msgSend_setCurrentClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentClient:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDeShowFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeShowFeedback:");
}

id objc_msgSend_setDefaultAllTasksFinishedSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultAllTasksFinishedSemaphore:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDepth:");
}

id objc_msgSend_setDestination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestination:");
}

id objc_msgSend_setDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiagnosticID:");
}

id objc_msgSend_setDidComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidComplete:");
}

id objc_msgSend_setDidPartnerTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidPartnerTimeout:");
}

id objc_msgSend_setDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirectory:");
}

id objc_msgSend_setDirectoryQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDirectoryQueue:");
}

id objc_msgSend_setDisableStreamTar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableStreamTar:");
}

id objc_msgSend_setDisableUIFeedback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisableUIFeedback:");
}

id objc_msgSend_setDpClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDpClass:");
}

id objc_msgSend_setDurationMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDurationMetrics:");
}

id objc_msgSend_setEarlyPrompt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEarlyPrompt:");
}

id objc_msgSend_setExecutionLine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExecutionLine:");
}

id objc_msgSend_setExitSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExitSource:");
}

id objc_msgSend_setExposureNotificationDBURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExposureNotificationDBURL:");
}

id objc_msgSend_setExposureNotificationGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExposureNotificationGroup:");
}

id objc_msgSend_setFd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFd:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFlattenReturnedDirectoryPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlattenReturnedDirectoryPaths:");
}

id objc_msgSend_setFrontmostBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrontmostBundleID:");
}

id objc_msgSend_setGeneratePlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGeneratePlist:");
}

id objc_msgSend_setGenerateSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGenerateSummary:");
}

id objc_msgSend_setGlob_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGlob:");
}

id objc_msgSend_setHeadDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeadDir:");
}

id objc_msgSend_setHighPriorityLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHighPriorityLogs:");
}

id objc_msgSend_setHostOutputDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostOutputDir:");
}

id objc_msgSend_setHostOutputDir_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostOutputDir:forDiagnosticID:");
}

id objc_msgSend_setHostWaitGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHostWaitGroup:");
}

id objc_msgSend_setIdsCase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsCase:");
}

id objc_msgSend_setInitiatedByRemoteHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitiatedByRemoteHost:");
}

id objc_msgSend_setIsCoSysdiagnoseResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsCoSysdiagnoseResponse:");
}

id objc_msgSend_setIsConcurrent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsConcurrent:");
}

id objc_msgSend_setIsEarlyPrompt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsEarlyPrompt:");
}

id objc_msgSend_setIsRemoteInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsRemoteInitiated:");
}

id objc_msgSend_setIsTestingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsTestingMode:");
}

id objc_msgSend_setLaunchPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchPath:");
}

id objc_msgSend_setLocalLogCollectionDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalLogCollectionDiagnosticID:");
}

id objc_msgSend_setLogAgentConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogAgentConnection:");
}

id objc_msgSend_setLogArchiveUnit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogArchiveUnit:");
}

id objc_msgSend_setLogArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogArray:");
}

id objc_msgSend_setLogDates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogDates:");
}

id objc_msgSend_setLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLogs:");
}

id objc_msgSend_setMatchEnumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMatchEnumerator:");
}

id objc_msgSend_setMaxDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxDepth:");
}

id objc_msgSend_setMaxHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxHistory:");
}

id objc_msgSend_setMaxVariety_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxVariety:");
}

id objc_msgSend_setMaximumSizeMB_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumSizeMB:");
}

id objc_msgSend_setMayStartExecuting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMayStartExecuting:");
}

id objc_msgSend_setMinimumTimeBeforeTimeouts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumTimeBeforeTimeouts:");
}

id objc_msgSend_setMobileContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMobileContainer:");
}

id objc_msgSend_setMobileContainerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMobileContainerClass:");
}

id objc_msgSend_setMsgContents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMsgContents:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNewestFileLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNewestFileLimit:");
}

id objc_msgSend_setNoTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNoTimeout:");
}

id objc_msgSend_setNumAttachTries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumAttachTries:");
}

id objc_msgSend_setNumExitedTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumExitedTasks:");
}

id objc_msgSend_setNumReapedTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumReapedTasks:");
}

id objc_msgSend_setNumRunningBlocks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumRunningBlocks:");
}

id objc_msgSend_setNumRunningHelperTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumRunningHelperTasks:");
}

id objc_msgSend_setNumRunningTaskContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumRunningTaskContainers:");
}

id objc_msgSend_setNumTimeouts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumTimeouts:");
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

id objc_msgSend_setOffsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOffsets:");
}

id objc_msgSend_setOldestDateCreatedCutoff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOldestDateCreatedCutoff:");
}

id objc_msgSend_setOnlyRunContainersWithNames_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnlyRunContainersWithNames:");
}

id objc_msgSend_setOpenIssueFiler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOpenIssueFiler:");
}

id objc_msgSend_setOutputDir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputDir:");
}

id objc_msgSend_setOutputDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutputDirectory:");
}

id objc_msgSend_setPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPaths:");
}

id objc_msgSend_setPidIndices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPidIndices:");
}

id objc_msgSend_setPipelineFlush_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPipelineFlush:");
}

id objc_msgSend_setPossibleClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPossibleClient:");
}

id objc_msgSend_setPreferredWifi_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredWifi:");
}

id objc_msgSend_setProcessCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcessCount:");
}

id objc_msgSend_setProcesses_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProcesses:");
}

id objc_msgSend_setProtobufAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtobufAction:forIncomingRequestsOfType:");
}

id objc_msgSend_setProtobufAction_forIncomingResponsesOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtobufAction:forIncomingResponsesOfType:");
}

id objc_msgSend_setProvidedPIDorProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProvidedPIDorProcess:");
}

id objc_msgSend_setProxies_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxies:");
}

id objc_msgSend_setProxies_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProxies:forDiagnosticID:");
}

id objc_msgSend_setPushBufferDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPushBufferDelegate:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQuickMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuickMode:");
}

id objc_msgSend_setRelative_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRelative:");
}

id objc_msgSend_setRemainingDepth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemainingDepth:");
}

id objc_msgSend_setRemoteGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteGroup:");
}

id objc_msgSend_setRemoteSysdiagnoseID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteSysdiagnoseID:");
}

id objc_msgSend_setRemoteUUIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteUUIDs:");
}

id objc_msgSend_setRemoteUUIDs_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteUUIDs:forDiagnosticID:");
}

id objc_msgSend_setReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReply:");
}

id objc_msgSend_setReplyBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReplyBlock:");
}

id objc_msgSend_setRequestSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestSource:");
}

id objc_msgSend_setResolveHomeDirs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResolveHomeDirs:");
}

id objc_msgSend_setRootPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootPath:");
}

id objc_msgSend_setRunByItself_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunByItself:");
}

id objc_msgSend_setRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunning:");
}

id objc_msgSend_setRunningTaskContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningTaskContainers:");
}

id objc_msgSend_setRunningTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRunningTasks:");
}

id objc_msgSend_setRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRuntimeChecks:");
}

id objc_msgSend_setRusage_details_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRusage_details:");
}

id objc_msgSend_setSequentialTasksQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSequentialTasksQueue:");
}

id objc_msgSend_setSequentialTasksSem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSequentialTasksSem:");
}

id objc_msgSend_setSessionConfigs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionConfigs:");
}

id objc_msgSend_setShouldCollectAllTrusted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCollectAllTrusted:");
}

id objc_msgSend_setShouldCreateTarBall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldCreateTarBall:");
}

id objc_msgSend_setShouldDisplayTarBall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisplayTarBall:");
}

id objc_msgSend_setShouldGatherBTLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldGatherBTLogs:");
}

id objc_msgSend_setShouldGetFeedbackData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldGetFeedbackData:");
}

id objc_msgSend_setShouldPostProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldPostProcess:");
}

id objc_msgSend_setShouldRemoveTemporaryDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRemoveTemporaryDirectory:");
}

id objc_msgSend_setShouldRunIDSDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRunIDSDump:");
}

id objc_msgSend_setShouldRunLogCopyTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRunLogCopyTasks:");
}

id objc_msgSend_setShouldRunLogGenerationTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRunLogGenerationTasks:");
}

id objc_msgSend_setShouldRunOSLogArchive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRunOSLogArchive:");
}

id objc_msgSend_setShouldRunTimeSensitiveTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRunTimeSensitiveTasks:");
}

id objc_msgSend_setShouldStreamToTar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldStreamToTar:");
}

id objc_msgSend_setSizes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSizes:");
}

id objc_msgSend_setSlowTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSlowTimeout:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStartDate_AndExecuteFromCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:AndExecuteFromCallback:");
}

id objc_msgSend_setStartDiagnosticTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDiagnosticTime:");
}

id objc_msgSend_setStartDiagnosticTimeClockNS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDiagnosticTimeClockNS:");
}

id objc_msgSend_setStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStarted:");
}

id objc_msgSend_setStatusBar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusBar:");
}

id objc_msgSend_setStderrPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStderrPath:");
}

id objc_msgSend_setStdoutPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStdoutPath:");
}

id objc_msgSend_setStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopped:");
}

id objc_msgSend_setSummaryHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSummaryHandle:");
}

id objc_msgSend_setTailspinOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTailspinOnly:");
}

id objc_msgSend_setTarballPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTarballPath:");
}

id objc_msgSend_setTargetPIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetPIDs:");
}

id objc_msgSend_setTargetUid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTargetUid:");
}

id objc_msgSend_setTaskCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskCompletionBlock:");
}

id objc_msgSend_setTaskContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskContainer:");
}

id objc_msgSend_setTaskName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskName:");
}

id objc_msgSend_setTaskQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskQueue:");
}

id objc_msgSend_setTaskType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskType:");
}

id objc_msgSend_setTconNvmDump_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTconNvmDump:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimeoutSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutSource:");
}

id objc_msgSend_setTmpOutputDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTmpOutputDirectory:");
}

id objc_msgSend_setTotalFailedTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalFailedTasks:");
}

id objc_msgSend_setTotalTaskContainers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalTaskContainers:");
}

id objc_msgSend_setTotalTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalTasks:");
}

id objc_msgSend_setTotalTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalTime:");
}

id objc_msgSend_setTotalTimeouts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalTimeouts:");
}

id objc_msgSend_setTransfer_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransfer_size:");
}

id objc_msgSend_setTtrOverrideURLStr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTtrOverrideURLStr:");
}

id objc_msgSend_setUnit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnit:");
}

id objc_msgSend_setUpCLI_stdoutfd_stderrfd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpCLI:stdoutfd:stderrfd:");
}

id objc_msgSend_setUpDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpDiagnosticID:");
}

id objc_msgSend_setUpFH_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpFH:");
}

id objc_msgSend_setUpLibClient_clientPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpLibClient:clientPid:");
}

id objc_msgSend_setUpSysdiagnoseLog_withID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpSysdiagnoseLog:withID:");
}

id objc_msgSend_setUpSysdiagnoseSession_clientPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpSysdiagnoseSession:clientPid:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_setUrlEnumerator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrlEnumerator:");
}

id objc_msgSend_setUseParallelCompression_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseParallelCompression:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVerbose_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVerbose:");
}

id objc_msgSend_setVibrateStart_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVibrateStart:");
}

id objc_msgSend_setWaitingToCaptureAirPodLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingToCaptureAirPodLogs:");
}

id objc_msgSend_setWaitingToCaptureExposureNotificationLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitingToCaptureExposureNotificationLogs:");
}

id objc_msgSend_setWallTimeUsedNS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWallTimeUsedNS:");
}

id objc_msgSend_setWarnProcessAllowlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWarnProcessAllowlist:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupProgressTotal_forPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupProgressTotal:forPhase:");
}

id objc_msgSend_setupTaskDepotForPhase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTaskDepotForPhase:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedResourceManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedResourceManager");
}

id objc_msgSend_sharedTaskDepot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedTaskDepot");
}

id objc_msgSend_shellTaskWithCommand_outputFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shellTaskWithCommand:outputFile:");
}

id objc_msgSend_shouldCollectAllTrusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCollectAllTrusted");
}

id objc_msgSend_shouldCreateTarBall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldCreateTarBall");
}

id objc_msgSend_shouldDisplayTarBall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDisplayTarBall");
}

id objc_msgSend_shouldGatherBTLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldGatherBTLogs");
}

id objc_msgSend_shouldGatherCoSysdiagnoses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldGatherCoSysdiagnoses");
}

id objc_msgSend_shouldGetFeedbackData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldGetFeedbackData");
}

id objc_msgSend_shouldParallelCompress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldParallelCompress:");
}

id objc_msgSend_shouldPostProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldPostProcess");
}

id objc_msgSend_shouldRemoveTemporaryDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRemoveTemporaryDirectory");
}

id objc_msgSend_shouldRunIDSDump(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunIDSDump");
}

id objc_msgSend_shouldRunLogCopyTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunLogCopyTasks");
}

id objc_msgSend_shouldRunLogGenerationTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunLogGenerationTasks");
}

id objc_msgSend_shouldRunOSLogArchive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunOSLogArchive");
}

id objc_msgSend_shouldRunTimeSensitiveTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunTimeSensitiveTasks");
}

id objc_msgSend_shouldRunWifiDextCoreFilesCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldRunWifiDextCoreFilesCollection");
}

id objc_msgSend_shouldStreamToTar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldStreamToTar");
}

id objc_msgSend_signalInterrupt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signalInterrupt");
}

id objc_msgSend_signalRunningTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signalRunningTask:");
}

id objc_msgSend_signalStopTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signalStopTasks");
}

id objc_msgSend_sizeBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeBytes");
}

id objc_msgSend_sizes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizes");
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDescendants");
}

id objc_msgSend_slowTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slowTimeout");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourcePath");
}

id objc_msgSend_standardizedURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardizedURL");
}

id objc_msgSend_startBTSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBTSession:");
}

id objc_msgSend_startBTSessionAndTriggerAirPodLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBTSessionAndTriggerAirPodLogs:");
}

id objc_msgSend_startBTSessionAndTriggerExposureNotificationLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBTSessionAndTriggerExposureNotificationLogs:");
}

id objc_msgSend_startCoSysdiagnoseForFilename_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCoSysdiagnoseForFilename:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDiagnosticTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiagnosticTime");
}

id objc_msgSend_startDiagnosticTimeClockNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDiagnosticTimeClockNS");
}

id objc_msgSend_startIDSConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startIDSConnection");
}

id objc_msgSend_startTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTasks");
}

id objc_msgSend_startTasksSequentially(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTasksSequentially");
}

id objc_msgSend_startTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimeout");
}

id objc_msgSend_startTimeout_withHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimeout:withHandler:");
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "started");
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBar");
}

id objc_msgSend_stderrPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stderrPath");
}

id objc_msgSend_stderrWrite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stderrWrite:");
}

id objc_msgSend_stdoutPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stdoutPath");
}

id objc_msgSend_stdoutWrite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stdoutWrite:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stop_withStateString_withSignal_withWaitMS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop:withStateString:withSignal:withWaitMS:");
}

id objc_msgSend_stopTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTasks");
}

id objc_msgSend_stopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopped");
}

id objc_msgSend_streamArchiveFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamArchiveFile:");
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

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringByRemovingWhitespace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByRemovingWhitespace");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForPhaseID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForPhaseID:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromProtobuf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromProtobuf:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithContentsOfFile_usedEncoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithContentsOfFile:usedEncoding:error:");
}

id objc_msgSend_stringWithFileSystemRepresentation_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFileSystemRepresentation:length:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subdirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdirectory");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_summarizeErrorsAcrossSDTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summarizeErrorsAcrossSDTasks:");
}

id objc_msgSend_summarizeErrorsForExecutedContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summarizeErrorsForExecutedContainers");
}

id objc_msgSend_summarizeErrorsWithinSDTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summarizeErrorsWithinSDTask:");
}

id objc_msgSend_summaryFD(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summaryFD");
}

id objc_msgSend_summaryHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summaryHandle");
}

id objc_msgSend_supportsPartialCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsPartialCollection");
}

id objc_msgSend_sysdiagnoseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseDirectory");
}

id objc_msgSend_sysdiagnoseEnumerator_WithVolume_WithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseEnumerator:WithVolume:WithFlags:");
}

id objc_msgSend_sysdiagnoseInternalDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseInternalDirectory");
}

id objc_msgSend_tailspinOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tailspinOnly");
}

id objc_msgSend_tarQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tarQueue");
}

id objc_msgSend_tarballPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tarballPath");
}

id objc_msgSend_targetPIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetPIDs");
}

id objc_msgSend_targetPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetPath");
}

id objc_msgSend_taskCompletionBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskCompletionBlock");
}

id objc_msgSend_taskContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskContainer");
}

id objc_msgSend_taskFileHandleArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskFileHandleArray");
}

id objc_msgSend_taskName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskName");
}

id objc_msgSend_taskQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskQueue");
}

id objc_msgSend_taskType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskType");
}

id objc_msgSend_taskWithCommand_arguments_asUID_outputFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommand:arguments:asUID:outputFile:");
}

id objc_msgSend_taskWithCommand_arguments_inBootstrapDomainOfUID_outputFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:");
}

id objc_msgSend_taskWithCommand_arguments_outputFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommand:arguments:outputFile:");
}

id objc_msgSend_taskWithCommand_arguments_outputFile_withRuntimeChecks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithCommand:arguments:outputFile:withRuntimeChecks:");
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tasks");
}

id objc_msgSend_tconNvmDump(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tconNvmDump");
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationStatus");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeoutMetricsString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutMetricsString");
}

id objc_msgSend_timeoutSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutSource");
}

id objc_msgSend_tmpOutputDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tmpOutputDirectory");
}

id objc_msgSend_totalFailedTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalFailedTasks");
}

id objc_msgSend_totalTaskContainers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTaskContainers");
}

id objc_msgSend_totalTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTasks");
}

id objc_msgSend_totalTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTime");
}

id objc_msgSend_totalTimeouts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalTimeouts");
}

id objc_msgSend_transferFileToHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferFileToHost:");
}

id objc_msgSend_transferFileToHostIfNecessary_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transferFileToHostIfNecessary:forDiagnosticID:");
}

id objc_msgSend_transfer_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transfer_size");
}

id objc_msgSend_triggerAirPodLogs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerAirPodLogs:");
}

id objc_msgSend_triggerAirPodLogsIfConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerAirPodLogsIfConnected");
}

id objc_msgSend_triggerCoSysdiagnoseWithParams_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerCoSysdiagnoseWithParams:");
}

id objc_msgSend_triggerCoSysdiagnosesWithParams_forDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerCoSysdiagnosesWithParams:forDiagnosticID:");
}

id objc_msgSend_triggerExposureNotificationLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerExposureNotificationLogs");
}

id objc_msgSend_triggerRemoteSysdiagnoses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerRemoteSysdiagnoses");
}

id objc_msgSend_triggerWatchCoSysdiagnose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerWatchCoSysdiagnose");
}

id objc_msgSend_tryCreateSessionConfigForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryCreateSessionConfigForDiagnosticID:");
}

id objc_msgSend_tryStartRemoteInitiatedFlowForMsg_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tryStartRemoteInitiatedFlowForMsg:");
}

id objc_msgSend_ttrOverrideURLStr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ttrOverrideURLStr");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unit");
}

id objc_msgSend_units(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "units");
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

id objc_msgSend_updateContainerWithOverride(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateContainerWithOverride");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_urlEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlEnumerator");
}

id objc_msgSend_useParallelCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useParallelCompression");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validFileSubstrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validFileSubstrings");
}

id objc_msgSend_validateTTRString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateTTRString:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_verbose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verbose");
}

id objc_msgSend_vibrateStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vibrateStart");
}

id objc_msgSend_waitForAirPodLogsIfAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForAirPodLogsIfAvailable");
}

id objc_msgSend_waitForCoSysdiagnosesForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForCoSysdiagnosesForDiagnosticID:");
}

id objc_msgSend_waitForExposureNotificationLogsIfAvailable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForExposureNotificationLogsIfAvailable:");
}

id objc_msgSend_waitForHostOutputDirForDiagnosticID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForHostOutputDirForDiagnosticID:");
}

id objc_msgSend_waitForRemoteLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForRemoteLogs");
}

id objc_msgSend_waitToReceiveCoSysdiagnose(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitToReceiveCoSysdiagnose");
}

id objc_msgSend_waitUntilAllTasksComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllTasksComplete:");
}

id objc_msgSend_waitUntilAllTasksComplete_withSemaphore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilAllTasksComplete:withSemaphore:");
}

id objc_msgSend_waitUntilComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilComplete:");
}

id objc_msgSend_waitingToCaptureAirPodLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingToCaptureAirPodLogs");
}

id objc_msgSend_waitingToCaptureExposureNotificationLogs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitingToCaptureExposureNotificationLogs");
}

id objc_msgSend_wallTimeUsedNS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wallTimeUsedNS");
}

id objc_msgSend_warnProcessAllowlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "warnProcessAllowlist");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_withVersion_withConstraintCategory_withRequirements_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withVersion:withConstraintCategory:withRequirements:withError:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeReportForTasks_withTimeout_concurrently_withDepotName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeReportForTasks:withTimeout:concurrently:withDepotName:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeToSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToSummary:");
}
