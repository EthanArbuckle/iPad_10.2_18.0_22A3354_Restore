void sub_100004D2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  dispatch_source_t v8;
  void *v9;

  v0 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    sub_100010278(v0, v1, v2, v3, v4, v5, v6, v7);

  signal(15, (void (__cdecl *)(int))1);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  v9 = (void *)qword_10001F618;
  qword_10001F618 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10001F618, &stru_1000185F0);
  dispatch_activate((dispatch_object_t)qword_10001F618);
}

void sub_100004DC0(id a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
    sub_1000102AC(v1, v2, v3, v4, v5, v6, v7, v8);

  xpc_transaction_exit_clean();
}

void start()
{
  id v0;
  void *v1;
  MLRXPCActivityManager *v2;
  MLRListenerDelegate *v3;
  id v4;
  id v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int v9;
  MLRXPCActivityManager *v10;
  __int16 v11;
  MLRListenerDelegate *v12;
  __int16 v13;
  id v14;

  if ((_set_user_dir_suffix("com.apple.siri-distributed-evaluation") & 1) != 0)
  {
    v0 = NSTemporaryDirectory();
    v1 = objc_autoreleasePoolPush();
    v2 = objc_opt_new(MLRXPCActivityManager);
    -[MLRXPCActivityManager registerIfNeeded](v2, "registerIfNeeded");
    v3 = -[MLRListenerDelegate initWithXPCActivityManager:]([MLRListenerDelegate alloc], "initWithXPCActivityManager:", v2);
    v4 = objc_alloc((Class)NSXPCListener);
    v5 = objc_msgSend(v4, "initWithMachServiceName:", DESFullServiceName);
    objc_msgSend(v5, "setDelegate:", v3);
    objc_msgSend(v5, "resume");
    if (v2 && v3 && v5)
    {
      sub_100004D2C();
      objc_autoreleasePoolPop(v1);
      dispatch_main();
    }
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = 134218496;
      v10 = v2;
      v11 = 2048;
      v12 = v3;
      v13 = 2048;
      v14 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Fail to allocate activityManager=%p, listenerDelegate=%p, listener=%p", (uint8_t *)&v9, 0x20u);
    }

  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v7 = *__error();
      v9 = 67109120;
      LODWORD(v10) = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed™: %{darwin.errno}d", (uint8_t *)&v9, 8u);
    }

  }
  exit(1);
}

void sub_100004FA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_100005288(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100005A58(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pluginId"));
  v10 = (void *)v9;
  if (v8 && v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v10;
      v19 = 2112;
      v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Shadow evaluation task for pluginId=%@, evaluation=%@", (uint8_t *)&v17, 0x16u);
    }

    v12 = *(id *)(a1 + 32);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));

    if (!v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, v10);

    }
    v15 = objc_msgSend(objc_alloc((Class)MLRInternalTrialTask), "initWithEvaluationState:runtimeEvaluation:", v8, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v10));
    objc_msgSend(v16, "addObject:", v15);

    if (a4)
      *a4 = 0;

  }
}

void sub_100005C80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005C90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "Trial Framework is not loaded.", a5, a6, a7, a8, 0);
}

void sub_100005CC4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fail to enumerate all shadow evaluation tasks with error=%@.", (uint8_t *)&v2, 0xCu);
}

void sub_100005D38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "Fail to get TRIEvaluationStatusProvider.", a5, a6, a7, a8, 0);
}

void sub_100006198(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 8))
    GarbageCollectAllRecords();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t sub_100006558(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100006B34(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100006B60(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *WeakRetained;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  _QWORD *v16;
  id v17;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100008D30(v4, v5, v6, v7, v8, v9, v10, v11);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained[3];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100006C38;
    v15[3] = &unk_100018698;
    v16 = WeakRetained;
    v17 = v3;
    dispatch_async(v14, v15);

  }
}

void sub_100006C38(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

  }
}

void sub_100006C7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  _QWORD *v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100008D60();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained[3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100006D68;
    v11[3] = &unk_100018698;
    v12 = WeakRetained;
    v13 = v5;
    dispatch_async(v10, v11);

  }
}

void sub_100006D68(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

  }
}

id sub_1000070C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_kill:", 9);
}

void sub_100007168(id a1, MLRExtensionRemoteProtocol *a2)
{
  -[MLRExtensionRemoteProtocol simulateCrash](a2, "simulateCrash");
}

void sub_100007170(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100008F8C(a1);

}

id sub_1000072C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unload");
}

void sub_100007DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007DCC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007DDC(uint64_t a1)
{

}

void sub_100007DE4(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[5];
  id v10;
  __int128 v11;
  _QWORD block[6];

  v2 = a1[4];
  v3 = *(NSObject **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007EE4;
  block[3] = &unk_1000187A0;
  v4 = a1[6];
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = a1[4];
    v6 = (void *)a1[5];
    v7 = *(void **)(v5 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007F4C;
    v9[3] = &unk_1000187F0;
    v9[4] = v5;
    v10 = v6;
    v11 = *((_OWORD *)a1 + 3);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000081C4;
    v8[3] = &unk_100018818;
    v8[5] = v11;
    v8[4] = a1[4];
    objc_msgSend(v7, "performOnRemoteObjectSynchronouslyWithBlock:errorHandler:", v9, v8);

  }
}

void sub_100007EE4(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[48])
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_skipTaskError"));
LABEL_3:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return;
  }
  objc_msgSend(v2, "_activateExtensionIfNecessary");
  v6 = *(_QWORD **)(a1 + 32);
  if (!v6[5])
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_failToGetHostError"));
    goto LABEL_3;
  }
}

void sub_100007F4C(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  __int128 v16;
  id obj;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1[4] + 8), "identifier"));
    v6 = *(_QWORD *)(a1[4] + 16);
    *(_DWORD *)buf = 138412802;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reaching out to plugin=%@ to start compute, sessionID=%@, remoteObjectProxy=%@.", buf, 0x20u);

  }
  v8 = a1 + 5;
  v7 = a1[5];
  v9 = (void *)a1[4];
  v10 = (uint64_t)(a1 + 6);
  v11 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v11 + 40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sandboxExtensionsForTask:error:", v7, &obj));
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100008114;
    v15[3] = &unk_1000187C8;
    v13 = a1[5];
    v15[4] = a1[4];
    v16 = *((_OWORD *)a1 + 3);
    objc_msgSend(v3, "performTask:sandBoxExtensions:completion:", v13, v12, v15);
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000092C8(v8, v10, v14);

  }
}

void sub_100008114(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  id *v9;
  void *v10;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100009358(a1);

    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v10 = a3;
  }
  else
  {
    v9 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = a2;
  }
  objc_storeStrong(v9, v10);

}

void sub_1000081C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_failToPerformErrorWithError:", a2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100008338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000835C(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  __int128 v13;
  _QWORD block[6];

  v2 = a1[4];
  v3 = *(NSObject **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008458;
  block[3] = &unk_1000187A0;
  v4 = a1[6];
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    v5 = (void *)a1[5];
    v6 = *(void **)(a1[4] + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000084C0;
    v10[3] = &unk_1000187F0;
    v7 = v5;
    v8 = a1[4];
    v11 = v7;
    v12 = v8;
    v13 = *((_OWORD *)a1 + 3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100008728;
    v9[3] = &unk_100018818;
    v9[5] = v13;
    v9[4] = v8;
    objc_msgSend(v6, "performOnRemoteObjectSynchronouslyWithBlock:errorHandler:", v10, v9);

  }
}

void sub_100008458(uint64_t a1)
{
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = *(_BYTE **)(a1 + 32);
  if (v2[48])
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_skipTaskError"));
LABEL_3:
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    return;
  }
  objc_msgSend(v2, "_activateExtensionIfNecessary");
  v6 = *(_QWORD **)(a1 + 32);
  if (!v6[5])
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_failToGetHostError"));
    goto LABEL_3;
  }
}

void sub_1000084C0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reaching out to plugin to start compute, task=%@.", buf, 0xCu);
  }

  v6 = *(_QWORD *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000085D0;
  v7[3] = &unk_100018868;
  v8 = *(_OWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v3, "performTrialTask:completion:", v6, v7);

}

void sub_1000085D0(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100009358(a1);

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v7;
    v11 = *(NSObject **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    v11 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionName"));
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ return results=%@.", (uint8_t *)&v13, 0x16u);

    }
  }

}

void sub_100008728(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_failToPerformErrorWithError:", a2));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1000087F0(uint64_t a1)
{
  _QWORD *v2;
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD block[5];
  id v11;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    v3 = dispatch_time(0, (int64_t)objc_msgSend(v2, "_graceIntervalBeforeUnloading"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v6 = *(NSObject **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008904;
    block[3] = &unk_100018890;
    block[4] = v4;
    v11 = v5;
    dispatch_after(v3, v6, block);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000089B4;
    v9[3] = &unk_1000188B8;
    v9[4] = v7;
    objc_msgSend(v8, "performOnRemoteObjectWithBlock:errorHandler:", v9, &stru_1000188F8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100008904(uint64_t a1)
{
  _QWORD *v2;
  id *v3;
  NSObject *v4;

  v3 = (id *)(a1 + 32);
  v2 = *(_QWORD **)(a1 + 32);
  if (v2[2])
  {
    if (objc_msgSend(v2, "shouldTriggerSimulatedCrash"))
      objc_msgSend(*v3, "_triggerSimulatedCrash");
    objc_msgSend(*v3, "_unload");
  }
  v4 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000093DC(v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "_killExtension:afterInterval:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(*(id *)(a1 + 32), "_graceIntervalBeforeKilling"));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000089B4(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;

  objc_msgSend(a2, "stop");
  v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionName"));
    v5 = objc_msgSend(*(id *)(a1 + 32), "_graceIntervalBeforeUnloading");
    v6 = 138412546;
    v7 = v4;
    v8 = 2048;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting to kill plugin=%@ with %lld", (uint8_t *)&v6, 0x16u);

  }
}

void sub_100008A94(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100009460();

}

void sub_100008B54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100008B84(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100008BB0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100008BD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "Nil identifier", a5, a6, a7, a8, 0);
  sub_100008BC8();
}

void sub_100008C00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "Nil extensionPoint", a5, a6, a7, a8, 0);
  sub_100008BC8();
}

void sub_100008C30(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Found >1 extensions for identifier=%@ extension point=%@", (uint8_t *)&v3, 0x16u);
  sub_100008B7C();
}

void sub_100008CB0(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "firstObject"));
  sub_100008B60();
  sub_100008BB0((void *)&_mh_execute_header, a2, v4, "Discovered extension=%@", v5);

  sub_100008BBC();
}

void sub_100008D30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "In requestInterruptionBlock", a5, a6, a7, a8, 0);
  sub_100008BC8();
}

void sub_100008D60()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "In requestCancellationBlock with error: %@", v2);
  sub_100008B7C();
}

void sub_100008DC4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "Failed to beginExtensionRequestWithOptions with error=%@", v2);
  sub_100008B7C();
}

void sub_100008E28(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];

  objc_opt_class(a1);
  sub_100008B60();
  v4 = v3;
  sub_100008B54((void *)&_mh_execute_header, a2, v5, "Failed to get correct host context with class = %@", v6);

  sub_100008BBC();
}

void sub_100008EA8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008BB0((void *)&_mh_execute_header, v0, v1, "Requesting activation after stopped for plugin %@", v2);
  sub_100008B7C();
}

void sub_100008F0C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "extensionName"));
  sub_100008B60();
  sub_100008BB0((void *)&_mh_execute_header, a2, v4, "Simulating crash for extension %@", v5);

  sub_100008BBC();
}

void sub_100008F8C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionName"));
  sub_100008B98();
  sub_100008B84((void *)&_mh_execute_header, v2, v3, "Failed to simulate crash for extension=%@ with error=%@", v4, v5, v6, v7, v8);

  sub_100008B6C();
}

void sub_100009010()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008BB0((void *)&_mh_execute_header, v0, v1, "Unloading plugin %@", v2);
  sub_100008B7C();
}

void sub_100009074(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recipe"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, a2, v5, "No DES Record Directory extensions returned for %@.", v6);

  sub_100008B6C();
}

void sub_100009108()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "Unexpected sandbox extensions returned for submission log (%@).", v2);
  sub_100008B7C();
}

void sub_10000916C(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "recipe"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attachments"));
  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, a2, v5, "Fail to issue sandbox extensions for downloaded attachment %@.", v6);

  sub_100008B6C();
}

void sub_100009200()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "%{public}@", v2);
  sub_100008B7C();
}

void sub_100009264()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "Fail to perform with error=%{public}@", v2);
  sub_100008B7C();
}

void sub_1000092C8(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to create Sandbox extensions for task=%@ with error=%@.", (uint8_t *)&v5, 0x16u);
  sub_100008B7C();
}

void sub_100009358(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionName"));
  sub_100008B98();
  sub_100008B84((void *)&_mh_execute_header, v2, v3, "%@ fail to return result with error=%@.", v4, v5, v6, v7, v8);

  sub_100008B6C();
}

void sub_1000093DC(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "extensionName"));
  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, a2, v4, "Extension=%@ is being killed.", v5);

  sub_100008BBC();
}

void sub_100009460()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "Failed to stop with error=%@", v2);
  sub_100008B7C();
}

void sub_10000A494(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  NSObject *v31;
  id v32;
  id v33;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;

  v2 = *(void **)(a1 + 32);
  v44 = 0;
  v3 = objc_msgSend(v2, "_pluginSupportTrialTask:", &v44);
  v4 = v44;
  if ((v3 & 1) != 0)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "bundleIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "shadowExperimentTasksForPluginID:"));
    if (objc_msgSend(v5, "count"))
    {
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = v5;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v6)
      {
        v7 = v6;
        v36 = *(_QWORD *)v41;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v36)
              objc_enumerationMutation(obj);
            v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            v10 = v37;
            v11 = sub_10000A96C(v9);
            v12 = objc_claimAutoreleasedReturnValue(v11);
            +[DESBitacoraEventManager sendEventTaskFetchedForBundleID:identifiers:](DESBitacoraEventManager, "sendEventTaskFetchedForBundleID:identifiers:", v10, v12);

            v13 = *(void **)(a1 + 32);
            v39 = v4;
            LOBYTE(v12) = objc_msgSend(v13, "_DASAllowTask:error:", v9, &v39);
            v14 = v39;

            if ((v12 & 1) == 0)
            {
              v32 = v10;
              v4 = v14;
              v33 = sub_10000A96C(v9);
              v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:identifiers:error:](DESBitacoraEventManager, "sendEventTaskSchedulingFailedForBundleID:identifiers:error:", v32, v34, v4);

              goto LABEL_21;
            }
            v15 = v10;
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evaluationID"));
            +[DESCoreAnalyticsEventManager sendEventRecipeFetchedForBundleID:evaluationID:error:](DESCoreAnalyticsEventManager, "sendEventRecipeFetchedForBundleID:evaluationID:error:", v15, v16, 0);

            v17 = *(void **)(a1 + 32);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "policy"));
            v19 = objc_msgSend(v17, "canRunTask:", v18);

            v20 = v15;
            v21 = sub_10000A96C(v9);
            v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
            if ((v19 & 1) != 0)
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingSucceededForBundleID:identifiers:](DESBitacoraEventManager, "sendEventTaskSchedulingSucceededForBundleID:identifiers:", v20, v22);

              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
              objc_msgSend(v23, "systemUptime");
              v25 = v24;

              v26 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
              v38 = v14;
              v27 = objc_msgSend(v26, "performTrialTask:outError:", v9, &v38);
              v4 = v38;

              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
              objc_msgSend(v28, "systemUptime");
              v30 = v29 - v25;

              objc_msgSend(*(id *)(a1 + 32), "_performAfterTask:duration:error:", v9, v4, v30);
              if (v4)
                goto LABEL_21;
            }
            else
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:identifiers:error:](DESBitacoraEventManager, "sendEventTaskSchedulingFailedForBundleID:identifiers:error:", v20, v22, 0);

              v4 = v14;
            }
          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v7)
            continue;
          break;
        }
      }
LABEL_21:

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      v31 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v47 = v37;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "No Shadow Evaluation tasks for %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void sub_10000A8B0(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10000ABA8();

  }
}

id sub_10000A96C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = a1;
  if (objc_opt_class(LBFTrialIdentifiers))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "evaluationState"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "experimentIdentifiers"));

    v4 = objc_alloc((Class)LBFTrialIdentifiers);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "experimentId"));
    v6 = objc_msgSend(v3, "deploymentId");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "treatmentId"));
    v8 = objc_msgSend(v4, "initWithExperimentID:deploymentID:treatmentID:", v5, v6, v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_10000AA38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "PluginManager should not be nil", a5, a6, a7, a8, 0);
}

void sub_10000AA6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C80((void *)&_mh_execute_header, a1, a3, "TrialManager should not be nil", a5, a6, a7, a8, 0);
}

void sub_10000AAA0()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100008B60();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Fail to update task record with task=%@, error=%@", v2, 0x16u);
  sub_100008B7C();
}

void sub_10000AB1C(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "bundleIdentifier"));
  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, a2, v4, "Plugin=%@ doesn't support Trial task.", v5);

}

void sub_10000ABA8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100008B60();
  sub_100008B54((void *)&_mh_execute_header, v0, v1, "Fail to stop with error=%@", v2);
  sub_100008B7C();
}

void sub_10000B244(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_queue_global_t global_queue;
  NSObject *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_xpcConnection"));
    v5 = (void *)xpc_connection_copy_invalidation_reason();

  }
  else
  {
    v5 = 0;
  }
  v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v10 = 138412546;
    v11 = v7;
    v12 = 2082;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ invalidated, reason: %{public}s", (uint8_t *)&v10, 0x16u);
  }

  if (v5)
    free(v5);
  objc_msgSend(v3, "invalidate");
  global_queue = dispatch_get_global_queue(9, 0);
  v9 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async_f(v9, 0, (dispatch_function_t)sub_10000B37C);

}

void sub_10000B37C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
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
  unsigned __int8 v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  id obj;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  _QWORD v50[2];

  v0 = objc_alloc_init((Class)NSFileManager);
  v1 = DESTemporaryDownloadDirectoryURL();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v50[0] = NSURLIsDirectoryKey;
  v50[1] = NSURLCreationDateKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v50, 2));
  v32 = v0;
  v28 = (void *)v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v2, v3, 1, &stru_1000189D0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 32, -1, v6, 0));

  v29 = objc_alloc_init((Class)NSMutableArray);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v41;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v11);
        v14 = objc_autoreleasePoolPush();
        if (objc_msgSend(v13, "hasDirectoryPath"))
        {
          v38 = 0;
          v39 = 0;
          v15 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v39, NSURLCreationDateKey, &v38);
          v16 = v39;
          v9 = v38;

          if ((v15 & 1) != 0)
          {
            if (objc_msgSend(v16, "compare:", v30) == (id)-1)
              objc_msgSend(v29, "addObject:", v13);
          }
          else
          {
            v17 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v13;
              v47 = 2112;
              v48 = v9;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not read creation date of attachment %@: %@", buf, 0x16u);
            }

          }
          v12 = v9;
        }
        else
        {
          v9 = v12;
        }
        objc_autoreleasePoolPop(v14);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v18 = v29;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        v23 = v9;
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        v33 = v9;
        v25 = objc_msgSend(v32, "removeItemAtURL:error:", v24, &v33);
        v9 = v33;

        v26 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        v27 = v26;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v24;
            _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Garbage collected old recipe attachement at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v46 = v24;
          v47 = 2112;
          v48 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Could not garbage collect old recipe attachment: %@: %@", buf, 0x16u);
        }

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    }
    while (v20);
  }

}

void sub_10000BBA4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BC34;
  v7[3] = &unk_100018940;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_10000BC34(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000BD60(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000BDF0;
  v7[3] = &unk_100018940;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t sub_10000BDF0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000C2E0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000C39C;
  block[3] = &unk_100018990;
  v13 = v6;
  v14 = v7;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t sub_10000C39C(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_10000C580(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL sub_10000CAAC(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  NSObject *v6;
  int v8;
  NSURL *v9;
  __int16 v10;
  NSError *v11;

  v4 = a2;
  v5 = a3;
  if ((id)-[NSError code](v5, "code") != (id)260)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trouble enumerating %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  return 1;
}

void sub_10000CB90(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "start donating result=%@, identifier=%@", (uint8_t *)&v3, 0x16u);
}

void sub_10000D040(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  double v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  double v20;
  dispatch_time_t v21;
  NSObject *v22;
  void *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD block[4];
  id v33;
  uint64_t v34;
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  uint64_t v39;

  v5 = a2;
  v6 = a3;
  v7 = objc_autoreleasePoolPush();
  if (v5)
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v8 + 120))
    {
      v9 = *(NSObject **)(v8 + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000D3F8;
      block[3] = &unk_100018698;
      v10 = *(id *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      v33 = v10;
      v34 = v11;
      dispatch_async(v9, block);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "maxTimeLimit");
      if (v16 > 0.0)
      {
        v17 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
          objc_msgSend(*(id *)(a1 + 32), "maxTimeLimit");
          *(_DWORD *)buf = 138412546;
          v37 = v18;
          v38 = 2048;
          v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will start plugin=%@ with maxTimeLimit=%f seconds", buf, 0x16u);

        }
        objc_initWeak((id *)buf, v5);
        objc_msgSend(*(id *)(a1 + 32), "maxTimeLimit");
        v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
        v22 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 48);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000D4CC;
        v29[3] = &unk_1000189F8;
        objc_copyWeak(&v31, (id *)buf);
        v30 = *(id *)(a1 + 32);
        dispatch_after(v21, v22, v29);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "addObject:", v5);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      +[DESCoreAnalyticsEventManager sendEventEvaluationSessionStartForBundleID:](DESCoreAnalyticsEventManager, "sendEventEvaluationSessionStartForBundleID:", v23);

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000D5AC;
      v26[3] = &unk_100018A48;
      v24 = *(id *)(a1 + 32);
      v25 = *(_QWORD *)(a1 + 40);
      v27 = v24;
      v28 = v25;
      objc_msgSend(v5, "runWithCompletion:", v26);

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:error:](DESCoreAnalyticsEventManager, "sendEventErrorForBundleID:error:", v12, v6);

    v13 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10000E70C((id *)(a1 + 32), (uint64_t)v6, v13);

    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(NSObject **)(v14 + 40);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000D3E0;
    v35[3] = &unk_100018710;
    v35[4] = v14;
    dispatch_async(v15, v35);
  }
  objc_autoreleasePoolPop(v7);

}

void sub_10000D3C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

id sub_10000D3E0(uint64_t a1)
{
  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextTask");
}

void sub_10000D3F8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Task %@ is deferred by DAS.", (uint8_t *)&v6, 0xCu);
  }

  v4 = *(void **)(a1 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_requestedToStopError"));
  objc_msgSend(v4, "_completeTaskRunWithResult:error:", 0, v5);

}

void sub_10000D4CC(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
      v5 = 138412290;
      v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request plugin=%@ to stop", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(WeakRetained, "stop");
  }

}

void sub_10000D5AC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
  +[DESCoreAnalyticsEventManager sendEventEvaluationSessionFinishForBundleID:success:](DESCoreAnalyticsEventManager, "sendEventEvaluationSessionFinishForBundleID:success:", v7, v6 == 0);

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:error:](DESCoreAnalyticsEventManager, "sendEventErrorForBundleID:error:", v8, v6);

    v9 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10000E7B8((uint64_t *)(a1 + 32), (uint64_t)v6, v9);

  }
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(NSObject **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D704;
  block[3] = &unk_100018A20;
  block[4] = v10;
  v15 = v5;
  v16 = v6;
  v12 = v6;
  v13 = v5;
  dispatch_async(v11, block);

}

id sub_10000D704(uint64_t a1)
{
  if (++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112))
    return objc_msgSend(*(id *)(a1 + 32), "_completeTaskRunWithResult:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  else
    return objc_msgSend(*(id *)(a1 + 32), "_scheduleNextTask");
}

id sub_10000DE7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startTasks:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void sub_10000E428(uint64_t a1)
{
  void *v2;
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

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "allObjects"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v12;
    *(_QWORD *)&v4 = 138412290;
    v10 = v4;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel", v10));
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Stopping task worker: %@.", buf, 0xCu);
        }

        objc_msgSend(v8, "stop");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");

}

void sub_10000E654(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000E660(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;

  v3 = *(_QWORD *)(a1 + 104);
  v4 = *(_QWORD *)(a1 + 112);
  v5 = objc_msgSend(*(id *)(a1 + 80), "count");
  v6 = 134218496;
  v7 = v3;
  v8 = 2048;
  v9 = v4;
  v10 = 2048;
  v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "completed=%ld, expected=%ld, to be scheduled=%ld.", (uint8_t *)&v6, 0x20u);
}

void sub_10000E70C(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "bundleIdentifier"));
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  sub_10000E654((void *)&_mh_execute_header, a3, v6, "Fail to create worker for bundle=%@, with error=%@.", (uint8_t *)&v7);

}

void sub_10000E7B8(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_10000E654((void *)&_mh_execute_header, a3, (uint64_t)a3, "Fail to run task=%@ with error=%@.", (uint8_t *)&v4);
}

void sub_10000E838(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown plugin type for %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000EF84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_10000EFC0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "shouldDeferForXPCActivity:", v3))
      objc_msgSend(v5, "handleDeferActivityTask:withStartTime:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000F774(v6);

  }
}

id sub_10000F058(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCompleteActivityTask:withError:", *(_QWORD *)(a1 + 40), a2);
}

void sub_10000F31C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "getStateForForXPCActivity:", v3);
  if (!v4)
  {
    v7 = *(void **)(a1 + 32);
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "criteria"));
    objc_msgSend(v7, "setCriteriaForXPCActivityIfNeeded:criteria:", v3, v6);
LABEL_7:

    goto LABEL_8;
  }
  if (v4 == (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "activity"));

    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setActivity:", v3);
      objc_msgSend(*(id *)(a1 + 32), "runActivityTask:", *(_QWORD *)(a1 + 40));
      goto LABEL_8;
    }
    v6 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      sub_10000F7B4(v6);
    goto LABEL_7;
  }
LABEL_8:

}

void sub_10000F774(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "eligibilityChangedHandler is called when self is nil.", v1, 2u);
}

void sub_10000F7B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "XPC activity handler is invoked again with RUN state", v1, 2u);
}

void sub_10000F7F4(_xpc_activity_s *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  xpc_activity_state_t state;

  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  state = xpc_activity_get_state(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to set activity state to %ld. Current state = %lu.", (uint8_t *)&v4, 0x16u);
}

void sub_10000F8CC(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MLRExtensionHostProtocol));
  v2 = (void *)qword_10001F628;
  qword_10001F628 = v1;

}

void sub_10000F940(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___MLRExtensionRemoteProtocol));
  v2 = (void *)qword_10001F638;
  qword_10001F638 = v1;

}

void sub_10000FC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FC68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000FC78(uint64_t a1)
{

}

void sub_10000FC80(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000FE70((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);

}

void sub_10000FD10(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](DESLogging, "coreChannel"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000FED8((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v4);

}

void sub_10000FE20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000FE30(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to create remote object proxy", v1, 2u);
}

void sub_10000FE70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000FE20((void *)&_mh_execute_header, a2, a3, "Error performing block synchronously with error=%@", a5, a6, a7, a8, 2u);
}

void sub_10000FED8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000FE20((void *)&_mh_execute_header, a2, a3, "Error performing block asynchronously with error=%@", a5, a6, a7, a8, 2u);
}

void sub_100010204(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized bundle=%@.", (uint8_t *)&v2, 0xCu);
}

void sub_100010278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004FA8((void *)&_mh_execute_header, a1, a3, "Setting up handler for SIGTERM.", a5, a6, a7, a8, 0);
}

void sub_1000102AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004FA8((void *)&_mh_execute_header, a1, a3, "Receiving SIGTERM.", a5, a6, a7, a8, 0);
}

id objc_msgSend_MLRSandboxExtensionRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MLRSandboxExtensionRequests");
}

id objc_msgSend_URLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLs");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__DASAllowTask_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_DASAllowTask:error:");
}

id objc_msgSend__activateExtensionIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateExtensionIfNecessary");
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_auxiliaryConnection");
}

id objc_msgSend__completeTaskRunWithResult_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_completeTaskRunWithResult:error:");
}

id objc_msgSend__extensionContextForUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_extensionContextForUUID:");
}

id objc_msgSend__failToGetHostError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_failToGetHostError");
}

id objc_msgSend__failToPerformErrorWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_failToPerformErrorWithError:");
}

id objc_msgSend__fides_shuffledArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fides_shuffledArray");
}

id objc_msgSend__graceIntervalBeforeKilling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_graceIntervalBeforeKilling");
}

id objc_msgSend__graceIntervalBeforeUnloading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_graceIntervalBeforeUnloading");
}

id objc_msgSend__kill_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_kill:");
}

id objc_msgSend__killExtension_afterInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_killExtension:afterInterval:");
}

id objc_msgSend__maxTimeLimitForBundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maxTimeLimitForBundle:");
}

id objc_msgSend__performAfterTask_duration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performAfterTask:duration:error:");
}

id objc_msgSend__pluginSupportTrialTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pluginSupportTrialTask:");
}

id objc_msgSend__recordDirectoriesForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_recordDirectoriesForIdentifier:");
}

id objc_msgSend__registerXPCActivityTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerXPCActivityTasks:");
}

id objc_msgSend__requestedToStopError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestedToStopError");
}

id objc_msgSend__scheduleNextTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleNextTask");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setupExtensionHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupExtensionHandlers");
}

id objc_msgSend__skipTaskError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipTaskError");
}

id objc_msgSend__triggerSimulatedCrash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_triggerSimulatedCrash");
}

id objc_msgSend__unload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unload");
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_xpcConnection");
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activity");
}

id objc_msgSend_activityDeferred(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityDeferred");
}

id objc_msgSend_addEligibilityChangedHandlerForActivity_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEligibilityChangedHandlerForActivity:handler:");
}

id objc_msgSend_addForTaskID_result_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addForTaskID:result:description:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allBundleIds");
}

id objc_msgSend_allFedStatsUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allFedStatsUnrestrictedBundleIds");
}

id objc_msgSend_allNonFedStatsUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allNonFedStatsUnrestrictedBundleIds");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allUnrestrictedBundleIds");
}

id objc_msgSend_allowBypassDiagnosticsUsage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowBypassDiagnosticsUsage:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_beginExtensionRequestWithOptions_inputItems_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginExtensionRequestWithOptions:inputItems:error:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bypassDiagnosticsUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bypassDiagnosticsUsage");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canRunTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canRunTask:");
}

id objc_msgSend_cancelExtensionRequestWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelExtensionRequestWithIdentifier:");
}

id objc_msgSend_clientWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientWithIdentifier:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_commitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitWithError:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_consumeExtensionsWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumeExtensionsWithError:");
}

id objc_msgSend_containsBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsBundleId:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_coreChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreChannel");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createTaskScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTaskScheduler");
}

id objc_msgSend_createTaskWorkerForShadowEvaluationTask_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTaskWorkerForShadowEvaluationTask:completion:");
}

id objc_msgSend_createTaskWorkerForTask_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTaskWorkerForTask:completion:");
}

id objc_msgSend_createXPCActivityTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createXPCActivityTasks");
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criteria");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingUnit_value_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingUnit:value:toDate:options:");
}

id objc_msgSend_deleteAllSavedRecordsForBundleId_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteAllSavedRecordsForBundleId:completion:");
}

id objc_msgSend_deleteSavedRecordForBundleId_identfier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSavedRecordForBundleId:identfier:completion:");
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deploymentId");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_diagnosticsUsageAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsUsageAllowed");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dynamicallyRegistered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicallyRegistered");
}

id objc_msgSend_eligibilityHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eligibilityHandler");
}

id objc_msgSend_endAtDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endAtDate");
}

id objc_msgSend_enumerateActiveEvaluationsForMLRuntimeWithError_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateActiveEvaluationsForMLRuntimeWithError:block:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluationID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluationID");
}

id objc_msgSend_evaluationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluationState");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "experimentId");
}

id objc_msgSend_experimentIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "experimentIdentifiers");
}

id objc_msgSend_extensionName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionName");
}

id objc_msgSend_extensionsWithMatchingAttributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsWithMatchingAttributes:error:");
}

id objc_msgSend_fetchAllPluginIDs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchAllPluginIDs");
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fields");
}

id objc_msgSend_filterPluginIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterPluginIDs:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_freshProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freshProvider");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getStateForForXPCActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStateForForXPCActivity:");
}

id objc_msgSend_handleCompleteActivityTask_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleCompleteActivityTask:withError:");
}

id objc_msgSend_handleDeferActivityTask_withStartTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleDeferActivityTask:withStartTime:");
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasDirectoryPath");
}

id objc_msgSend_hasMLRCtlEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMLRCtlEntitlement:");
}

id objc_msgSend_hasRecordAccessToBundleId_connection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasRecordAccessToBundleId:connection:error:");
}

id objc_msgSend_hasToolEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasToolEntitlement:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_initFromStoreWithPluginID_taskSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromStoreWithPluginID:taskSource:");
}

id objc_msgSend_initWithBaseURL_localeIdentifier_fromDesTool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBaseURL:localeIdentifier:fromDesTool:");
}

id objc_msgSend_initWithBundleIdentifier_taskSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:taskSource:");
}

id objc_msgSend_initWithBundleIdentifier_taskSource_maxTimeLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:taskSource:maxTimeLimit:");
}

id objc_msgSend_initWithBundleRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleRegistry:");
}

id objc_msgSend_initWithEvaluationState_runtimeEvaluation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEvaluationState:runtimeEvaluation:");
}

id objc_msgSend_initWithExperimentID_deploymentID_treatmentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExperimentID:deploymentID:treatmentID:");
}

id objc_msgSend_initWithExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtension:");
}

id objc_msgSend_initWithExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtensions:");
}

id objc_msgSend_initWithJSONResult_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithJSONResult:identifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPluginID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPluginID:");
}

id objc_msgSend_initWithPluginID_taskSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPluginID:taskSource:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithRecordID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordID:");
}

id objc_msgSend_initWithTaskID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTaskID:");
}

id objc_msgSend_initWithTrialManager_plugin_alwaysRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTrialManager:plugin:alwaysRun:");
}

id objc_msgSend_initWithXPCActivityManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCActivityManager:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_issueSandBoxExtensionsForFileURLs_requireWrite_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "issueSandBoxExtensionsForFileURLs:requireWrite:outError:");
}

id objc_msgSend_lastCompletionDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastCompletionDate");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_maxPerformCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxPerformCount");
}

id objc_msgSend_maxTimeLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxTimeLimit");
}

id objc_msgSend_minInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minInterval");
}

id objc_msgSend_mlr_listValueWithNSArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mlr_listValueWithNSArray:");
}

id objc_msgSend_mlr_structWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mlr_structWithDictionary:");
}

id objc_msgSend_mlr_valueWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mlr_valueWithObject:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_performCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performCount");
}

id objc_msgSend_performOnRemoteObjectSynchronouslyWithBlock_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performOnRemoteObjectSynchronouslyWithBlock:errorHandler:");
}

id objc_msgSend_performOnRemoteObjectWithBlock_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performOnRemoteObjectWithBlock:errorHandler:");
}

id objc_msgSend_performTask_sandBoxExtensions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTask:sandBoxExtensions:completion:");
}

id objc_msgSend_performTrialTask_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTrialTask:completion:");
}

id objc_msgSend_performTrialTask_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performTrialTask:outError:");
}

id objc_msgSend_periodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodInSeconds");
}

id objc_msgSend_pluginId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginId");
}

id objc_msgSend_pluginManagerForBundleIdentifier_endpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginManagerForBundleIdentifier:endpoint:");
}

id objc_msgSend_pluginTypeForBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginTypeForBundleId:");
}

id objc_msgSend_pluginWithBundleIdentifier_errorOut_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pluginWithBundleIdentifier:errorOut:");
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "policy");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_purgeObsoleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purgeObsoleted");
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recipe");
}

id objc_msgSend_recordDirURLsForBundleId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordDirURLsForBundleId:");
}

id objc_msgSend_registerIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerIfNeeded");
}

id objc_msgSend_registerWithIdentifier_criteria_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWithIdentifier:criteria:handler:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeEligibilityChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeEligibilityChangedHandler:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_requireWrite(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireWrite");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_runActivityTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runActivityTask:");
}

id objc_msgSend_runWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runWithCompletion:");
}

id objc_msgSend_sandboxExtensionsForTask_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sandboxExtensionsForTask:error:");
}

id objc_msgSend_sandboxExtensionsToXPCConnection_fileURLs_requireWrite_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:");
}

id objc_msgSend_schedulerWakeupPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedulerWakeupPeriodInSeconds");
}

id objc_msgSend_sendEventActivityScheduled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventActivityScheduled");
}

id objc_msgSend_sendEventActivityShouldDeferWithActivityID_connectionDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventActivityShouldDeferWithActivityID:connectionDuration:");
}

id objc_msgSend_sendEventErrorForBundleID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventErrorForBundleID:error:");
}

id objc_msgSend_sendEventEvaluationForBundleID_evaluationID_duration_deferred_success_error_downloadedAttachmentCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventEvaluationForBundleID:evaluationID:duration:deferred:success:error:downloadedAttachmentCount:");
}

id objc_msgSend_sendEventEvaluationSessionFinishForBundleID_success_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventEvaluationSessionFinishForBundleID:success:");
}

id objc_msgSend_sendEventEvaluationSessionStartForBundleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventEvaluationSessionStartForBundleID:");
}

id objc_msgSend_sendEventMaintenanceWithActivityID_intervalSincePostedEvent_shouldSkip_lockState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventMaintenanceWithActivityID:intervalSincePostedEvent:shouldSkip:lockState:");
}

id objc_msgSend_sendEventRecipeFetchedForBundleID_evaluationID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventRecipeFetchedForBundleID:evaluationID:error:");
}

id objc_msgSend_sendEventTaskCompletedForBundleID_identifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventTaskCompletedForBundleID:identifiers:error:");
}

id objc_msgSend_sendEventTaskFetchedForBundleID_identifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventTaskFetchedForBundleID:identifiers:");
}

id objc_msgSend_sendEventTaskSchedulingFailedForBundleID_identifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventTaskSchedulingFailedForBundleID:identifiers:error:");
}

id objc_msgSend_sendEventTaskSchedulingSucceededForBundleID_identifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventTaskSchedulingSucceededForBundleID:identifiers:");
}

id objc_msgSend_setActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivity:");
}

id objc_msgSend_setActivityDeferred_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActivityDeferred:");
}

id objc_msgSend_setBoolValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBoolValue:");
}

id objc_msgSend_setCriteriaForXPCActivityIfNeeded_criteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCriteriaForXPCActivityIfNeeded:criteria:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEligibilityHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEligibilityHandler:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setLastCompletionDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastCompletionDate:");
}

id objc_msgSend_setListValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListValue:");
}

id objc_msgSend_setNullValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNullValue:");
}

id objc_msgSend_setNumberValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberValue:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPerformCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPerformCount:");
}

id objc_msgSend_setPeriodInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeriodInSeconds:");
}

id objc_msgSend_setRequestCancellationBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestCancellationBlock:");
}

id objc_msgSend_setRequestInterruptionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequestInterruptionBlock:");
}

id objc_msgSend_setSchedulerWakeupPeriodInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSchedulerWakeupPeriodInSeconds:");
}

id objc_msgSend_setShouldRegister_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRegister:");
}

id objc_msgSend_setStateForXPCActivity_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateForXPCActivity:state:");
}

id objc_msgSend_setStringValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStringValue:");
}

id objc_msgSend_setStructValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStructValue:");
}

id objc_msgSend_shadowExperimentTasksForPluginID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shadowExperimentTasksForPluginID:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldDeferForXPCActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDeferForXPCActivity:");
}

id objc_msgSend_shouldTriggerSimulatedCrash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldTriggerSimulatedCrash");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "source");
}

id objc_msgSend_startAfterDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAfterDate");
}

id objc_msgSend_startTaskWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTaskWithCompletion:");
}

id objc_msgSend_startTasks_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTasks:completion:");
}

id objc_msgSend_startTasksForPluginIDs_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTasksForPluginIDs:completion:");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_submissionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submissionAllowed");
}

id objc_msgSend_submitWithTRIClient_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitWithTRIClient:error:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskID");
}

id objc_msgSend_tasksForPluginIDs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tasksForPluginIDs:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "treatmentId");
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unload");
}

id objc_msgSend_unregisterXPCActivityWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterXPCActivityWithIdentifier:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateInterval(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateInterval");
}

id objc_msgSend_updateTaskAfterCompletion_taskID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTaskAfterCompletion:taskID:error:");
}

id objc_msgSend_updateWakeUpPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWakeUpPeriodInSeconds");
}

id objc_msgSend_valuesArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valuesArray");
}

id objc_msgSend_wakeUpPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeUpPeriodInSeconds");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}
