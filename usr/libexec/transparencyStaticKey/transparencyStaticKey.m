void sub_100003A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003A6C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100003DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003E18(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_10000417C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004190(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "timeoutCanOccur"))
  {
    objc_msgSend(WeakRetained, "setTimeoutCanOccur:", 0);
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transitionOperation"));
    v2 = objc_msgSend(v1, "timeout:", 0);

    v3 = objc_alloc_init((Class)NSOperationQueue);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "transitionOperation"));
    objc_msgSend(v3, "addOperation:", v4);

  }
}

void sub_1000044C0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_1000044F0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004978(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004988(uint64_t a1)
{

}

void sub_100004990(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v3 = kKTApplicationIdentifierIDS;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004A24;
  v6[3] = &unk_100070798;
  v8 = *(_QWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(a2, "accountKey:complete:", v3, v6);

}

void sub_100004A24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004AAC(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_100004AF8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004B28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004B58(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004F28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004F58(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004F88(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100004FB8(id a1, KTIDSSession *a2)
{
  KTIDSSession *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSession state](v2, "state"));
  if ((objc_msgSend(v3, "isEqual:", kTransparencyStaticKeyStateCodeAvailable) & 1) != 0
    || (objc_msgSend(v3, "isEqual:", kTransparencyStaticKeyStateCodeError) & 1) != 0)
  {
    v15[0] = kTransparencyStaticKeySessionID;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTIDSSession sessionID](v2, "sessionID"));
    v15[1] = kTransparencyStaticKeyState;
    v16[0] = v4;
    v16[1] = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070928);
    v6 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543874;
      v10 = (void *)kTransparencyStaticKeyNotification;
      v11 = 1024;
      v12 = 1;
      v13 = 2112;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting notification: %{public}@: options = 0x%08x, %@", (uint8_t *)&v9, 0x1Cu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:userInfo:options:", kTransparencyStaticKeyNotification, 0, v5, 1);

  }
  else
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_100070908);
    v8 = qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dropped notification: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }

}

void sub_1000051F8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005228(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005258(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_10000557C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

uint64_t start()
{
  char *v0;
  char *v1;
  void *v2;
  IDSServiceDelegate *v3;
  dispatch_queue_t v4;
  KTIDSSessionHandler *v5;
  id v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  NSObject *v15;
  int v16;
  int *v17;
  char *v18;
  const char *v19;
  void *v20;
  int v21;
  int *v22;
  char *v23;
  int v24;
  int v25;
  __int16 v26;
  char *v27;
  uint8_t buf[1032];

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  bzero(buf, 0x400uLL);
  if (!_set_user_dir_suffix("com.apple.transparencyStaticKey")
    || !confstr(65537, (char *)buf, 0x400uLL)
    || mkdir((const char *)buf, 0x1C0u) && *__error() != 17)
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_1000709C8);
    v14 = (void *)qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = *__error();
      v17 = __error();
      v18 = strerror(*v17);
      v24 = 67109378;
      v25 = v16;
      v26 = 2080;
      v27 = v18;
      v19 = "failed to initialize temporary directory (%d): %s";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, 0x12u);

    }
LABEL_24:
    exit(1);
  }
  v0 = realpath_DARWIN_EXTSN((const char *)buf, 0);
  if (!v0)
  {
    if (qword_10008AA40 != -1)
      dispatch_once(&qword_10008AA40, &stru_1000709E8);
    v20 = (void *)qword_10008AA48;
    if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_ERROR))
    {
      v15 = v20;
      v21 = *__error();
      v22 = __error();
      v23 = strerror(*v22);
      v24 = 67109378;
      v25 = v21;
      v26 = 2080;
      v27 = v23;
      v19 = "failed to resolve temporary directory (%d): %s";
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  v1 = v0;
  setenv("SQLITE_TMPDIR", v0, 1);
  free(v1);
  v2 = objc_autoreleasePoolPush();
  v3 = objc_alloc_init(IDSServiceDelegate);
  v4 = dispatch_queue_create("main-ids-queue", 0);
  -[IDSServiceDelegate setXpcQueue:](v3, "setXpcQueue:", v4);

  v5 = -[KTIDSSessionHandler initWithTransport:peerName:]([KTIDSSessionHandler alloc], "initWithTransport:peerName:", 0, 0);
  -[IDSServiceDelegate setIdsTransport:](v3, "setIdsTransport:", v5);

  v6 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.transparencyd.ids"));
  objc_msgSend(v6, "setDelegate:", v3);
  objc_msgSend(v6, "resume");
  v7 = objc_claimAutoreleasedReturnValue(-[IDSServiceDelegate xpcQueue](v3, "xpcQueue"));
  signal(15, (void (__cdecl *)(int))1);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
  v9 = (void *)qword_10008AA50;
  qword_10008AA50 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10008AA50, &stru_100070A08);
  dispatch_activate((dispatch_object_t)qword_10008AA50);

  objc_autoreleasePoolPop(v2);
  if (qword_10008AA40 != -1)
    dispatch_once(&qword_10008AA40, &stru_100070988);
  v10 = qword_10008AA48;
  if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "transparencyStaticKey accepting work", buf, 2u);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v11, "run");

  if (qword_10008AA40 != -1)
    dispatch_once(&qword_10008AA40, &stru_1000709A8);
  v12 = qword_10008AA48;
  if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "transparencyStaticKey stopping", buf, 2u);
  }

  return 1;
}

void sub_100005A10(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005A40(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005A70(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005AA0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100005AD0(id a1)
{
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[16];

  if (qword_10008AA40 != -1)
    dispatch_once(&qword_10008AA40, &stru_100070A28);
  v1 = qword_10008AA48;
  if (os_log_type_enabled((os_log_t)qword_10008AA48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v3, 2u);
  }
  v2 = xpc_transaction_exit_clean();
  xpc_transaction_try_exit_clean(v2);
}

void sub_100005B60(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008AA48;
  qword_10008AA48 = (uint64_t)v1;

}

void sub_100006064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000060A0(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  int v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "allDependentsSuccessful") & 1) != 0)
    {
      objc_msgSend(v2, "groupStart");
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "error"));
        v4 = 138412290;
        v5 = v3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Not running due to some failed dependent: %@", (uint8_t *)&v4, 0xCu);

      }
      objc_msgSend(v2, "cancel");
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v4) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "received callback for released object", (uint8_t *)&v4, 2u);
  }

}

void sub_1000061C4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "completeOperation");
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "received callback for released object", v3, 2u);
  }

}

void sub_100006904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000691C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

void sub_1000069DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000069F4(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 73);
  return result;
}

uint64_t sub_100006B48(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 73) = 1;
  return result;
}

uint64_t sub_100006B60(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 1;
  return result;
}

void sub_100006F2C(uint64_t a1)
{
  void *v2;
  void *v3;

  if (objc_msgSend(*(id *)(a1 + 32), "fillInError"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "internalSuccesses"));
    objc_msgSend(v2, "allSuccessful:", v3);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 73) = 1;
}

void sub_100007238(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007434(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100007C80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007C98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007CA8(uint64_t a1)
{

}

void sub_100007CB0(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "idsHandleLookup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", a1[5]));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapMailbox:", v3));
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100007E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007E9C(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sessionIDLookup"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", a1[5]));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapMailbox:", v3));
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100007FD0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionIDLookup", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(a1 + 40);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mapMailbox:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7)));
        objc_msgSend(v8, "addObject:", v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

void sub_1000082C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000082E0(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionIDLookup"));
  v3 = (id *)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "removeMailbox:", v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "oslog"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10004FE60(v3, v6);

  }
}

void sub_100008794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000087AC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  SKMailbox *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  SKMailbox *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  void *v58;
  _BYTE v59[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "otherNamesForPeer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 40), "dumpState:", CFSTR("setupMailbox"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR(",")));
    *(_DWORD *)buf = 141558274;
    v48 = 1752392040;
    v49 = 2112;
    v50 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Peer handles for setup: %{mask.hash}@", buf, 0x16u);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
LABEL_5:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v44 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "idsHandleLookup", (_QWORD)v43));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
        if (v10)
          goto LABEL_5;
        break;
      }
    }
  }

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "handleID"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "kt_hexString"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
      *(_DWORD *)buf = 138543874;
      v48 = (uint64_t)v20;
      v49 = 2160;
      v50 = 1752392040;
      v51 = 2112;
      v52 = (uint64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "connecting existing mailbox %{public}@ peer: %{mask.hash}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPeer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMyPublicInfo:", *(_QWORD *)(a1 + 48));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "stateMachine"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentState"));

    if ((-[NSObject isEqual:](v23, "isEqual:", off_10008A510) & 1) == 0
      && (-[NSObject isEqual:](v23, "isEqual:", off_10008A518) & 1) == 0)
    {
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
        *(_DWORD *)buf = 141558530;
        v48 = 1752392040;
        v49 = 2112;
        v50 = (uint64_t)v25;
        v51 = 2114;
        v52 = (uint64_t)v23;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "resetting mailbox peer: %{mask.hash}@ state: %{public}@", buf, 0x20u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "restart");
    }
  }
  else
  {
    v26 = [SKMailbox alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
    v28 = *(_QWORD *)(a1 + 48);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
    v30 = -[SKMailbox initWithLogging:publicInfo:peerIDSID:session:](v26, "initWithLogging:publicInfo:peerIDSID:session:", v27, v28, v29, *(_QWORD *)(a1 + 40));
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPeer:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMyPublicInfo:", *(_QWORD *)(a1 + 48));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "otherNamesForPeer"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "allObjects"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "componentsJoinedByString:", CFSTR(",")));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastUsedAddressOfMe"));
      *(_DWORD *)buf = 141559298;
      v48 = 1752392040;
      v49 = 2112;
      v50 = (uint64_t)v33;
      v51 = 2160;
      v52 = 1752392040;
      v53 = 2112;
      v54 = v36;
      v55 = 2160;
      v56 = 1752392040;
      v57 = 2112;
      v58 = v37;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "starting new mailbox with peer: %{mask.hash}@ other known handles: %{mask.hash}@ lastMe: %{mask.hash}@", buf, 0x3Eu);

    }
  }

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastUsedAddressOfMe"));
  if (v38)
  {
    v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "oslog"));
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastUsedAddressOfMe"));
      *(_DWORD *)buf = 138543362;
      v48 = (uint64_t)v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Using send handle: %{public}@", buf, 0xCu);

    }
    v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastUsedAddressOfMe"));
    objc_msgSend(v41, "setSourceIDSID:", v42);

  }
  objc_msgSend(*(id *)(a1 + 40), "addMailbox:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), (_QWORD)v43);

}

void sub_10000A54C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  v5 = a2;
  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "oslog"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localSessionID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "kt_hexString"));
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "mailbox-handle: %{public}@ session: %{public}@", (uint8_t *)&v10, 0x16u);

  }
}

void sub_10000A7BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000A7C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000A7D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL sub_10000E4EC(int a1)
{
  return a1 != -72499473;
}

void sub_10000F50C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F530(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 0.0));
  objc_msgSend(WeakRetained, "setFinishDate:", v1);

}

void sub_10000F870(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000F88C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(void);
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "finishingBlock"));
    v4[2]();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completionHandlerDidRunCondition"));
    objc_msgSend(v5, "fulfill");

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dependencies", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v3, "removeDependency:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "completion handler called on deallocated operation instance", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id sub_10000FB78(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setTimeoutCanOccur:", 0);
  return result;
}

BOOL sub_10000FD54(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_10000FFE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000FFFC(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "timeoutCanOccur"))
  {
    v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "_onqueueTimeoutError"));
    objc_msgSend(WeakRetained, "setError:", v1);

    objc_msgSend(WeakRetained, "setTimeoutCanOccur:", 0);
    objc_msgSend(WeakRetained, "cancel");
  }

}

void sub_1000100E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100010500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1000106A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000106C4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100011338(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateInit"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v11 = (void *)qword_10008AA60;
  qword_10008AA60 = (uint64_t)v2;

}

void sub_100011500(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateInit"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  v11 = (void *)qword_10008AA70;
  qword_10008AA70 = (uint64_t)v2;

}

void sub_100011694(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v1, "addObject:", CFSTR("Unlocked"));
  objc_msgSend(v1, "addObject:", CFSTR("AccountChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("CKAccountChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("RepairIDSFlag"));
  objc_msgSend(v1, "addObject:", CFSTR("ConfigBagFetch"));
  objc_msgSend(v1, "addObject:", CFSTR("ManateeViewChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("FetchIDMS"));
  objc_msgSend(v1, "addObject:", CFSTR("ValidateSelf"));
  objc_msgSend(v1, "addObject:", CFSTR("CheckAccountSignatures"));
  objc_msgSend(v1, "addObject:", CFSTR("FetchSelf"));
  objc_msgSend(v1, "addObject:", CFSTR("FetchPublicKeys"));
  objc_msgSend(v1, "addObject:", CFSTR("CheckIDSRegistration"));
  objc_msgSend(v1, "addObject:", CFSTR("ValidateSelfOptIn"));
  objc_msgSend(v1, "addObject:", CFSTR("ChangeOptInState"));
  objc_msgSend(v1, "addObject:", CFSTR("EnsureIdentity"));
  objc_msgSend(v1, "addObject:", CFSTR("CloudKitOutgoing"));
  objc_msgSend(v1, "addObject:", CFSTR("CloudKitIncoming"));
  objc_msgSend(v1, "addObject:", CFSTR("CloudKitZoneRecreate"));
  objc_msgSend(v1, "addObject:", CFSTR("OctagonTrustChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("CheckKTAccountKey"));
  objc_msgSend(v1, "addObject:", CFSTR("StatusUpdate"));
  objc_msgSend(v1, "addObject:", CFSTR("CheckKTAccountKeyChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("IDSStatusChanged"));
  objc_msgSend(v1, "addObject:", CFSTR("CheckServerOptIn"));
  v2 = (void *)qword_10008AA80;
  qword_10008AA80 = (uint64_t)v1;

}

uint64_t sub_100011848()
{
  if (qword_10008AA90 != -1)
    dispatch_once(&qword_10008AA90, &stru_100070E50);
  return qword_10008AA98;
}

void sub_100011888(id a1)
{
  qword_10008AA98 = (uint64_t)objc_alloc_init((Class)NSData);
}

id sub_1000118AC(id result)
{
  NSMutableArray *v1;
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  _QWORD *v10;
  unsigned int v11;
  _DWORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  unsigned int v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  if (!result)
    return result;
  v1 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", result);
  result = -[NSMutableArray count](v1, "count");
  if (!result)
    return result;
  do
  {
    v2 = -[NSMutableArray lastObject](v1, "lastObject");
    -[NSMutableArray removeLastObject](v1, "removeLastObject");
    objc_msgSend(v2, "setUnknownFields:", 0);
    v4 = objc_msgSend((id)objc_opt_class(v2, v3), "descriptor");
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v5 = (void *)v4[1];
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (!v6)
      goto LABEL_35;
    v7 = v6;
    v8 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if (*(unsigned __int8 *)(v10[1] + 30) - 15 <= 1)
        {
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i), "fieldType");
          if (v11 == 2)
          {
            v17 = v2[8];
            if (v17)
              v18 = *(void **)(v17 + *(unsigned int *)(v10[1] + 24));
            else
              v18 = 0;
            switch(objc_msgSend(v10, "mapKeyDataType"))
            {
              case 0u:
                v37[0] = _NSConcreteStackBlock;
                v37[1] = 3221225472;
                v37[2] = sub_100011D64;
                v37[3] = &unk_100070E78;
                v37[4] = v1;
                v19 = v37;
                goto LABEL_32;
              case 1u:
              case 0xBu:
                v36[0] = _NSConcreteStackBlock;
                v36[1] = 3221225472;
                v36[2] = sub_100011D6C;
                v36[3] = &unk_100070EA0;
                v36[4] = v1;
                v19 = v36;
                goto LABEL_32;
              case 2u:
              case 7u:
              case 9u:
                v35[0] = _NSConcreteStackBlock;
                v35[1] = 3221225472;
                v35[2] = sub_100011D74;
                v35[3] = &unk_100070EC8;
                v35[4] = v1;
                v19 = v35;
                goto LABEL_32;
              case 4u:
              case 0xCu:
                v34[0] = _NSConcreteStackBlock;
                v34[1] = 3221225472;
                v34[2] = sub_100011D7C;
                v34[3] = &unk_100070EF0;
                v34[4] = v1;
                v19 = v34;
                goto LABEL_32;
              case 5u:
              case 8u:
              case 0xAu:
                v33[0] = _NSConcreteStackBlock;
                v33[1] = 3221225472;
                v33[2] = sub_100011D84;
                v33[3] = &unk_100070F18;
                v33[4] = v1;
                v19 = v33;
                goto LABEL_32;
              case 0xEu:
                v32[0] = _NSConcreteStackBlock;
                v32[1] = 3221225472;
                v32[2] = sub_100011D8C;
                v32[3] = &unk_100070F40;
                v32[4] = v1;
                v19 = v32;
LABEL_32:
                objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v19);
                break;
              default:
                continue;
            }
          }
          else if (v11 == 1)
          {
            v15 = v2[8];
            if (v15)
              v16 = *(void **)(v15 + *(unsigned int *)(v10[1] + 24));
            else
              v16 = 0;
            if (objc_msgSend(v16, "count"))
              -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v16);
          }
          else
          {
            if (v11)
              continue;
            v12 = (_DWORD *)v10[1];
            v13 = v12[5];
            if ((v13 & 0x80000000) != 0)
            {
              v14 = v2[8];
              if (*(_DWORD *)(v14 + 4 * -(int)v13) != v12[4])
                continue;
LABEL_23:
              -[NSMutableArray addObject:](v1, "addObject:", *(_QWORD *)(v14 + v12[6]));
              continue;
            }
            v14 = v2[8];
            if (((*(_DWORD *)(v14 + ((v13 >> 3) & 0x1FFFFFFC)) >> v13) & 1) != 0)
              goto LABEL_23;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
LABEL_35:
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = objc_msgSend(v2, "extensionsCurrentlySet", 0);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v29 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v25, "dataType") - 15 <= 1)
          {
            v26 = objc_msgSend(v25, "isRepeated");
            v27 = objc_msgSend(v2, "getExtension:", v25);
            if (v26)
              -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v27);
            else
              -[NSMutableArray addObject:](v1, "addObject:", v27);
          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
      }
      while (v22);
    }
    result = -[NSMutableArray count](v1, "count");
  }
  while (result);
  return result;
}

uint64_t sub_100011D2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    return *(_QWORD *)(v2 + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24));
  else
    return 0;
}

id sub_100011D64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D6C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D8C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100011D94(id result)
{
  if ((int)result >= 30008)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!"), 30007, result);
  if ((int)result <= 30000)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!"), result, 30001);
  return result;
}

id sub_100011E18()
{
  return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Proto generation source appears to have been from a version newer that this runtime (%d)."), 30007);
}

id sub_100011E58(id result)
{
  uint64_t v1;
  uint64_t v2;

  if ((_DWORD)result != 30001)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!"), 30001, result, v1, v2);
  return result;
}

BOOL sub_100011EA8(void *a1, uint64_t a2)
{
  return sub_100011EDC((uint64_t)a1, (uint64_t)objc_msgSend(objc_msgSend(a1, "descriptor"), "fieldWithNumber:", a2));
}

BOOL sub_100011EDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) != 0)
    {
      v4 = *(_QWORD *)(a1 + 64);
      if (v4)
        v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
      else
        v5 = 0;
      return objc_msgSend(v5, "count") != 0;
    }
    else
    {
      v6 = *(unsigned int *)(v3 + 20);
      if ((v6 & 0x80000000) != 0)
        return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -(int)v6) == *(_DWORD *)(v3 + 16);
      else
        return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
    }
  }
  return v2;
}

void sub_100011FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(unsigned int *)(v3 + 20);
  if ((v4 & 0x80000000) != 0)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v5 + 4 * -(int)v4) != *(_DWORD *)(v3 + 16))
      return;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) == 0)
      return;
  }
  if ((*(_WORD *)(v3 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v3 + 30) - 13 <= 3)
  {
    v6 = *(unsigned int *)(v3 + 24);

    *(_QWORD *)(v5 + v6) = 0;
    LODWORD(v4) = *(_DWORD *)(v3 + 20);
  }
  v7 = *(_QWORD *)(a1 + 64);
  if ((v4 & 0x80000000) != 0)
    *(_DWORD *)(v7 + 4 * -(int)v4) = 0;
  else
    *(_DWORD *)(v7 + 4 * (v4 >> 5)) &= ~(1 << v4);
}

uint64_t sub_100012090(uint64_t result, unsigned int a2, int a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  int v7;

  v4 = *(_QWORD *)(result + 64);
  if ((a2 & 0x80000000) != 0)
  {
    if (!a4)
      a3 = 0;
    *(_DWORD *)(v4 + 4 * -a2) = a3;
  }
  else
  {
    v5 = a2 >> 5;
    v6 = 1 << a2;
    if (a4)
      v7 = *(_DWORD *)(v4 + 4 * v5) | v6;
    else
      v7 = *(_DWORD *)(v4 + 4 * v5) & ~v6;
    *(_DWORD *)(v4 + 4 * v5) = v7;
  }
  return result;
}

void sub_1000120E4(uint64_t a1, id *a2)
{
  sub_10001213C(a1, a2, *(_DWORD *)(*((_QWORD *)objc_msgSend(a2[2], "objectAtIndexedSubscript:", 0) + 1) + 20), 0);
}

void sub_10001213C(uint64_t a1, void *a2, unsigned int a3, int a4)
{
  int v5;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a1 + 64) - 4 * (int)a3);
  if (v5 != a4 && v5 != 0)
  {
    v8 = objc_msgSend(a2, "fieldWithNumber:");
    if (v8)
    {
      v9 = v8[1];
      if ((*(_WORD *)(v9 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v9 + 30) - 13 <= 3)
      {
        v10 = *(_QWORD *)(a1 + 64);
        v11 = *(unsigned int *)(v9 + 24);

        *(_QWORD *)(v10 + v11) = 0;
      }
    }
    v12 = *(_QWORD *)(a1 + 64);
    if ((a3 & 0x80000000) != 0)
      *(_DWORD *)(v12 + 4 * -a3) = 0;
    else
      *(_DWORD *)(v12 + 4 * (a3 >> 5)) &= ~(1 << a3);
  }
}

BOOL sub_100012214(uint64_t a1, unsigned int a2, int a3)
{
  if ((a2 & 0x80000000) != 0)
    return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -a2) == a3;
  else
    return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
}

uint64_t sub_100012260(uint64_t a1, int a2)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 64) - 4 * a2);
}

void sub_10001227C(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v2 = *(_DWORD **)(a2 + 8);
  v3 = v2[5];
  if ((v3 & 0x80000000) == 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return;
LABEL_5:
    v5 = v2[6];
    v6 = *(_QWORD *)(v4 + v5);
    v7 = (id)v6;
    *(_QWORD *)(v4 + v5) = 0;
    sub_1000293A8(v6);

    return;
  }
  v4 = *(_QWORD *)(a1 + 64);
  if (*(_DWORD *)(v4 + 4 * -(int)v3) != v2[4])
    goto LABEL_5;
}

uint64_t sub_100012318(uint64_t a1, _QWORD *a2, void *a3)
{
  return sub_100012348(a1, a2, a3);
}

uint64_t sub_100012348(uint64_t a1, _QWORD *a2, void *a3)
{
  void *v3;
  uint64_t v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  void *v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  v6 = a2[1];
  v7 = *(unsigned __int8 *)(v6 + 30);
  v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v9 + v10);
    *(_QWORD *)(v9 + v10) = a3;
    if (v11)
    {
      if (objc_msgSend(a2, "fieldType") == 1)
      {
        if ((v7 - 13) <= 3)
        {
          v13 = objc_opt_class(TransparencyGPBAutocreatedArray, v12);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
            goto LABEL_29;
          }
LABEL_31:

          return sub_10002909C(a1);
        }
        v14 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      }
      else if (objc_msgSend(a2, "mapKeyDataType") == 14 && (v7 - 13) <= 3)
      {
        v22 = objc_opt_class(TransparencyGPBAutocreatedDictionary, v21);
        if ((objc_opt_isKindOfClass(v11, v22) & 1) == 0)
          goto LABEL_31;
        v14 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
      }
      else
      {
        v14 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
      }
LABEL_29:
      v26 = *v14;
      if (*(_QWORD *)&v11[v26] == a1)
        *(_QWORD *)&v11[v26] = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v15 = (void *)a2[2];
    if (v15)
    {
      sub_10001213C(a1, v15, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16));
      v8 = *(_WORD *)(v6 + 28);
    }
    v16 = v3 != 0;
    if ((v8 & 0x20) != 0 && !objc_msgSend(v3, "length"))
    {

      v16 = 0;
      v3 = 0;
    }
    v17 = *(unsigned int *)(v6 + 20);
    v18 = *(_QWORD *)(a1 + 64);
    if ((v17 & 0x80000000) != 0)
    {
      v23 = *(_DWORD *)(v6 + 16);
      if (!v16)
        v23 = 0;
      *(_DWORD *)(v18 + 4 * -(int)v17) = v23;
    }
    else
    {
      v19 = v17 >> 5;
      v20 = 1 << v17;
      if (v16)
        *(_DWORD *)(v18 + 4 * v19) |= v20;
      else
        *(_DWORD *)(v18 + 4 * v19) &= ~v20;
    }
    v24 = *(_QWORD *)(a1 + 64);
    v25 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v24 + v25);
    *(_QWORD *)(v24 + v25) = v3;
    if (v11)
    {
      if ((v7 - 15) <= 1 && sub_10002908C((uint64_t)v11, a1))
        sub_1000293A8((uint64_t)v11);
      goto LABEL_31;
    }
  }
  return sub_10002909C(a1);
}

uint64_t sub_10001255C(uint64_t a1, _QWORD *a2)
{
  id v3;

  v3 = sub_1000125B8(a1, a2);
  if ((*(_WORD *)(a2[1] + 28) & 0x1000) == 0)
  {
    if (objc_msgSend(a2, "isValidEnumValue:", v3))
      return v3;
    else
      return 4222467823;
  }
  return (uint64_t)v3;
}

id sub_1000125B8(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return (id)*(unsigned int *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return (id)*(unsigned int *)(v4 + v2[6]);
  }
  return objc_msgSend(a2, "defaultValue");
}

id sub_100012640(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v6;

  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@.%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(a1, v6), objc_msgSend(a2, "name"), a3);
  return sub_1000126D8(a1, (uint64_t)a2, a3);
}

id sub_1000126D8(_QWORD *a1, uint64_t a2, int a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_10001213C((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_10002909C(a1);
}

BOOL sub_1000127C4(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (_DWORD *)a2[1];
  v3 = v2[4];
  v4 = v2[5];
  if ((v4 & 0x80000000) == 0)
  {
    v5 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v5 + ((v4 >> 3) & 0x1FFFFFFC)) >> v4) & 1) != 0)
      goto LABEL_3;
    return (unint64_t)objc_msgSend(a2, "defaultValue") & 1;
  }
  v5 = *(_QWORD *)(a1 + 64);
  if (*(_DWORD *)(v5 + 4 * -(int)v4) != v3)
    return (unint64_t)objc_msgSend(a2, "defaultValue") & 1;
LABEL_3:
  v6 = v2[6];
  if ((v6 & 0x80000000) != 0)
    return *(_DWORD *)(v5 + 4 * -(int)v6) == v3;
  else
    return (*(_DWORD *)(v5 + ((v6 >> 3) & 0x1FFFFFFC)) >> v6) & 1;
}

_QWORD *sub_100012868(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return sub_100012878(a1, a2, a3);
  }
  return a1;
}

id sub_100012878(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  _BOOL4 v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;

  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  if (v6)
    sub_10001213C((uint64_t)a1, v6, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16));
  v7 = *(unsigned int *)(v5 + 24);
  v8 = a1[8];
  if ((v7 & 0x80000000) != 0)
  {
    v11 = *(_DWORD *)(v5 + 16);
    if (!a3)
      v11 = 0;
    *(_DWORD *)(v8 + 4 * -(int)v7) = v11;
    if ((a3 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v9 = v7 >> 5;
    v10 = 1 << v7;
    if (a3)
    {
      *(_DWORD *)(v8 + 4 * v9) |= v10;
LABEL_9:
      v12 = 1;
      goto LABEL_12;
    }
    *(_DWORD *)(v8 + 4 * v9) &= ~v10;
  }
  v12 = (*(_WORD *)(v5 + 28) & 0x20) == 0;
LABEL_12:
  v13 = *(unsigned int *)(v5 + 20);
  v14 = a1[8];
  if ((v13 & 0x80000000) != 0)
  {
    if (v12)
      v17 = *(_DWORD *)(v5 + 16);
    else
      v17 = 0;
    *(_DWORD *)(v14 + 4 * -(int)v13) = v17;
  }
  else
  {
    v15 = v13 >> 5;
    v16 = 1 << v13;
    if (v12)
      *(_DWORD *)(v14 + 4 * v15) |= v16;
    else
      *(_DWORD *)(v14 + 4 * v15) &= ~v16;
  }
  return sub_10002909C(a1);
}

_QWORD *sub_100012998(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return sub_1000126D8(a1, a2, a3);
  }
  return a1;
}

id sub_1000129A8(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(id *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(id *)(v4 + v2[6]);
  }
  return objc_msgSend(a2, "defaultValue");
}

_QWORD *sub_100012A1C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
      return sub_100012A2C(a1, a2, a3);
  }
  return a1;
}

id sub_100012A2C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_10001213C((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_10002909C(a1);
}

float sub_100012B10(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;
  float result;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(float *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(float *)(v4 + v2[6]);
  }
  LODWORD(result) = objc_msgSend(a2, "defaultValue");
  return result;
}

_QWORD *sub_100012B98(_QWORD *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2)
      return sub_100012BA8(a1, a2, a3);
  }
  return a1;
}

id sub_100012BA8(_QWORD *a1, uint64_t a2, float a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_10001213C((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_10002909C(a1);
}

double sub_100012C90(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (_DWORD *)a2[1];
  v3 = v2[5];
  if ((v3 & 0x80000000) != 0)
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (*(_DWORD *)(v4 + 4 * -(int)v3) == v2[4])
      return *(double *)(v4 + v2[6]);
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (((*(_DWORD *)(v4 + ((v3 >> 3) & 0x1FFFFFFC)) >> v3) & 1) != 0)
      return *(double *)(v4 + v2[6]);
  }
  return COERCE_DOUBLE(objc_msgSend(a2, "defaultValue"));
}

_QWORD *sub_100012D18(_QWORD *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2)
      return sub_100012D28(a1, a2, a3);
  }
  return a1;
}

id sub_100012D28(_QWORD *a1, uint64_t a2, double a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  int v13;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_10001213C((uint64_t)a1, v6, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  v9 = *(unsigned int *)(v7 + 20);
  v10 = a1[8];
  if ((v9 & 0x80000000) != 0)
  {
    if (v8)
      v13 = *(_DWORD *)(v7 + 16);
    else
      v13 = 0;
    *(_DWORD *)(v10 + 4 * -(int)v9) = v13;
  }
  else
  {
    v11 = v9 >> 5;
    v12 = 1 << v9;
    if (v8)
      *(_DWORD *)(v10 + 4 * v11) |= v12;
    else
      *(_DWORD *)(v10 + 4 * v11) &= ~v12;
  }
  return sub_10002909C(a1);
}

uint64_t sub_100012E14(uint64_t result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return sub_100012348(result, a2, objc_msgSend(a3, "copy"));
  }
  return result;
}

uint64_t sub_100012E60(uint64_t result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return sub_100012348(result, a2, a3);
  }
  return result;
}

char *sub_100012EA4(const char *a1, BOOL a2)
{
  Protocol *Protocol;

  Protocol = objc_getProtocol("TransparencyGPBMessageSignatureProtocol");
  return protocol_getMethodDescription(Protocol, a1, 0, a2).types;
}

__CFString *sub_100012EE4(void *a1, __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;

  v2 = &stru_100072BF0;
  if (a1)
  {
    if (a2)
      v4 = a2;
    else
      v4 = &stru_100072BF0;
    v2 = (__CFString *)+[NSMutableString string](NSMutableString, "string");
    sub_100012F40(a1, v2, v4);
  }
  return v2;
}

id sub_100012F40(void *a1, void *a2, __CFString *a3)
{
  _QWORD *v6;
  char *v7;
  _QWORD *v8;
  unsigned int v9;
  id v10;
  BOOL v11;
  void *v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  NSString *v27;
  const __CFString *v28;
  unsigned int v29;
  int v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  const char *v34;
  NSString *v35;
  uint64_t v36;
  int v37;
  const char *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  unsigned int v44;
  float v45;
  double v46;
  _QWORD *v47;
  _QWORD *v48;
  id v49;
  void *v50;
  _QWORD *v51;
  const __CFString *v52;
  id v53;
  id v54;
  __CFString *v55;
  id result;
  uint64_t v57;
  NSString *v58;
  __CFString *v59;
  id v60;
  _QWORD *v61;
  char *v62;
  char *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  _QWORD *v67;
  _QWORD *v68;
  void **v69;
  uint64_t v70;
  id (*v71)(uint64_t, void *, void *);
  void *v72;
  void *v73;
  NSString *v74;
  NSString *v75;
  NSString *v76;
  NSString *v77;
  __CFString *v78;
  NSString *v79;
  NSString *v80;
  _QWORD *v81;
  char v82;
  char v83;
  _QWORD v84[3];
  char v85;

  v6 = objc_msgSend(a1, "descriptor");
  v66 = (void *)v6[1];
  v7 = (char *)objc_msgSend(v66, "count");
  v8 = objc_msgSend(v6, "extensionRanges");
  v9 = objc_msgSend(v6, "extensionRangesCount");
  v68 = a1;
  v10 = objc_msgSend(objc_msgSend(a1, "extensionsCurrentlySet"), "sortedArrayUsingSelector:", "compareByFieldNumber:");
  if (v7)
    v11 = 0;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    v12 = v10;
    v13 = 0;
    v14 = 0;
    v15 = v9;
    v60 = v10;
    v61 = v8;
    v62 = v7;
    v64 = v9;
    v59 = a3;
    do
    {
      if (v14 == v7)
      {
        sub_100014110(v68, v12, v8[v13], a2, a3);
        v14 = v7;
        ++v13;
        continue;
      }
      if (v13 != v15)
      {
        v16 = objc_msgSend(v66, "objectAtIndexedSubscript:", v14);
        v17 = &v8[v13];
        if (*(_DWORD *)(v16[1] + 16) >= *(_DWORD *)v17)
        {
          ++v13;
          sub_100014110(v68, v12, *v17, a2, a3);
          continue;
        }
      }
      v18 = v14 + 1;
      v67 = objc_msgSend(v66, "objectAtIndexedSubscript:", v14);
      v19 = objc_msgSend(v67, "fieldType");
      v20 = v19;
      if (v19 == 2 || v19 == 1)
      {
        v65 = v13;
        v24 = v68[8];
        if (v24)
          v25 = *(void **)(v24 + *(unsigned int *)(v67[1] + 24));
        else
          v25 = 0;
        v26 = (unint64_t)objc_msgSend(v25, "count");
        if (v26)
          goto LABEL_21;
      }
      else
      {
        if (v19)
        {
          ++v14;
          v15 = v64;
          continue;
        }
        v21 = v67[1];
        v22 = *(unsigned int *)(v21 + 20);
        v65 = v13;
        if ((v22 & 0x80000000) != 0)
          v23 = *(_DWORD *)(v68[8] + 4 * -(int)v22) == *(_DWORD *)(v21 + 16);
        else
          v23 = (*(_DWORD *)(v68[8] + ((v22 >> 3) & 0x1FFFFFFC)) >> v22) & 1;
        v25 = 0;
        v26 = v23;
        if (v23)
        {
LABEL_21:
          v27 = (NSString *)objc_msgSend(v67, "textFormatName");
          if (-[NSString length](v27, "length"))
          {
            v28 = &stru_100072BF0;
          }
          else
          {
            v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), *(unsigned int *)(v67[1] + 16));
            if (v26 < 2)
            {
              v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  # %@"), objc_msgSend(v67, "name"));
            }
            else
            {
              objc_msgSend(a2, "appendFormat:", CFSTR("%@# %@\n"), a3, objc_msgSend(v67, "name"));
              v28 = &stru_100072BF0;
            }
          }
          v63 = v18;
          if (v20 == 2)
          {
            v29 = objc_msgSend(v67, "mapKeyDataType");
            v30 = *(unsigned __int8 *)(v67[1] + 30);
            v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {%@\n"), a3, v27, v28);
            v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {\n"), a3, v27);
            v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@}\n"), a3);
            v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  key: "), a3);
            v34 = ":";
            if ((v30 - 15) < 2)
              v34 = "";
            v35 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  value%s "), a3, v34);
            v84[0] = 0;
            v84[1] = v84;
            v84[2] = 0x2020000000;
            v85 = 1;
            if (v29 == 14 && (v30 - 13) <= 3)
            {
              v69 = _NSConcreteStackBlock;
              v70 = 3221225472;
              v71 = sub_100014688;
              v72 = &unk_100070FB8;
              v73 = a2;
              v74 = v58;
              v75 = v31;
              v76 = v33;
              LOBYTE(v81) = v30;
              v77 = v35;
              v78 = a3;
              v79 = v32;
              v80 = (NSString *)v84;
              objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", &v69);
              v14 = v18;
            }
            else
            {
              v69 = _NSConcreteStackBlock;
              v70 = 3221225472;
              v71 = sub_1000147C0;
              v72 = &unk_100070FE0;
              v80 = v32;
              v81 = v84;
              v73 = a2;
              v74 = v58;
              v82 = v29;
              v75 = v31;
              v76 = v33;
              v83 = v30;
              v77 = v35;
              v78 = a3;
              v79 = (NSString *)v67;
              objc_msgSend(v25, "enumerateForTextFormat:", &v69);
              v14 = v18;
            }
            _Block_object_dispose(v84, 8);
            v8 = v61;
            v7 = v62;
            v12 = v60;
            v15 = v64;
            v13 = v65;
            continue;
          }
          v36 = 0;
          v37 = *(unsigned __int8 *)(v67[1] + 30);
          if ((v37 - 15) >= 2)
            v38 = ":";
          else
            v38 = "";
          do
          {
            objc_msgSend(a2, "appendFormat:", CFSTR("%@%@%s "), a3, v27, v38);
            switch(v37)
            {
              case 0:
                if (v25)
                  v44 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v44 = sub_1000127C4((uint64_t)v68, v67);
                if (v44)
                  v52 = CFSTR("true");
                else
                  v52 = CFSTR("false");
                objc_msgSend(a2, "appendString:", v52);
                break;
              case 1:
              case 11:
                if (v25)
                  v41 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v41 = sub_1000125B8((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%u"), v41, v57);
                break;
              case 2:
              case 7:
              case 9:
                if (v25)
                  v39 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v39 = sub_1000125B8((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v39, v57);
                break;
              case 3:
                if (v25)
                  objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v45 = sub_100012B10((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*g"), 6, v45);
                break;
              case 4:
              case 12:
                if (v25)
                  v42 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v42 = sub_1000129A8((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%llu"), v42, v57);
                break;
              case 5:
              case 8:
              case 10:
                if (v25)
                  v40 = objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v40 = sub_1000129A8((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%lld"), v40, v57);
                break;
              case 6:
                if (v25)
                  objc_msgSend(v25, "valueAtIndex:", v36);
                else
                  v46 = sub_100012C90((uint64_t)v68, v67);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&v46);
                break;
              case 13:
                if (v25)
                  v47 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v47 = sub_10002A2C0((uint64_t)v68, v67);
                sub_100013C1C(v47, a2);
                break;
              case 14:
                if (v25)
                  v48 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v48 = sub_10002A2C0((uint64_t)v68, v67);
                sub_100014504(v48, a2);
                break;
              case 15:
              case 16:
                if (v25)
                  v43 = objc_msgSend(v25, "objectAtIndex:", v36);
                else
                  v43 = sub_10002A2C0((uint64_t)v68, v67);
                v51 = v43;
                objc_msgSend(a2, "appendFormat:", CFSTR("{%@\n"), v28);
                sub_100012F40(v51, a2, -[__CFString stringByAppendingString:](a3, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a2, "appendFormat:", CFSTR("%@}"), a3);
                v28 = &stru_100072BF0;
                break;
              case 17:
                if (v25)
                {
                  v49 = objc_msgSend(v25, "rawValueAtIndex:", v36);
                  v50 = v67;
                }
                else
                {
                  v50 = v67;
                  v49 = sub_1000125B8((uint64_t)v68, v67);
                }
                v53 = objc_msgSend(v50, "enumDescriptor");
                if (v53 && (v54 = objc_msgSend(v53, "textFormatNameForValue:", v49)) != 0)
                  objc_msgSend(a2, "appendString:", v54);
                else
                  objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v49);
                a3 = v59;
                break;
              default:
                break;
            }
            objc_msgSend(a2, "appendFormat:", CFSTR("%@\n"), v28);
            ++v36;
          }
          while (v26 != v36);
          v7 = v62;
          v14 = v63;
          v12 = v60;
          v8 = v61;
          goto LABEL_92;
        }
      }
      v14 = v18;
LABEL_92:
      v15 = v64;
      v13 = v65;
    }
    while (v14 < v7 || v13 < v15);
  }
  v55 = sub_1000137F4(objc_msgSend(v68, "unknownFields"), a3);
  result = -[__CFString length](v55, "length");
  if (result)
  {
    objc_msgSend(a2, "appendFormat:", CFSTR("%@# --- Unknown fields ---\n"), a3);
    return objc_msgSend(a2, "appendString:", v55);
  }
  return result;
}

void sub_1000137D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *sub_1000137F4(void *a1, const __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  id obj;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[6];
  int v38;
  _QWORD v39[6];
  int v40;
  _QWORD v41[6];
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];

  v2 = &stru_100072BF0;
  if (a1)
  {
    v4 = a2 ? (__CFString *)a2 : &stru_100072BF0;
    v2 = (__CFString *)+[NSMutableString string](NSMutableString, "string");
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = objc_msgSend(a1, "sortedFields");
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v26)
    {
      v25 = *(_QWORD *)v44;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v44 != v25)
            objc_enumerationMutation(obj);
          v28 = v5;
          v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v5);
          v7 = objc_msgSend(v6, "number");
          v8 = objc_msgSend(v6, "varintList");
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100013B74;
          v41[3] = &unk_100070F68;
          v41[4] = v2;
          v41[5] = v4;
          v42 = (int)v7;
          objc_msgSend(v8, "enumerateValuesWithBlock:", v41);
          v9 = objc_msgSend(v6, "fixed32List");
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100013BAC;
          v39[3] = &unk_100070F90;
          v39[4] = v2;
          v39[5] = v4;
          v40 = (int)v7;
          objc_msgSend(v9, "enumerateValuesWithBlock:", v39);
          v10 = objc_msgSend(v6, "fixed64List");
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100013BE4;
          v37[3] = &unk_100070F68;
          v37[4] = v2;
          v37[5] = v4;
          v38 = (int)v7;
          objc_msgSend(v10, "enumerateValuesWithBlock:", v37);
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v27 = v6;
          v11 = objc_msgSend(v6, "lengthDelimitedList");
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(_QWORD *)v34 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: "), v4, v7);
                sub_100013C1C(v16, v2);
                -[__CFString appendString:](v2, "appendString:", CFSTR("\n"));
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v48, 16);
            }
            while (v13);
          }
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v17 = objc_msgSend(v27, "groupList");
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@%d: {\n"), v4, v7);
                -[__CFString appendString:](v2, "appendString:", sub_1000137F4(v22, -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("  "))));
                -[__CFString appendFormat:](v2, "appendFormat:", CFSTR("%@}\n"), v4);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v47, 16);
            }
            while (v19);
          }
          v5 = v28 + 1;
        }
        while ((id)(v28 + 1) != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v26);
    }
  }
  return v2;
}

id sub_100013B74(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: %llu\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_100013BAC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%X\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_100013BE4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%llX\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_100013C1C(void *a1, void *a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;

  v4 = (char *)objc_msgSend(a1, "bytes");
  v5 = (uint64_t)objc_msgSend(a1, "length");
  objc_msgSend(a2, "appendString:", CFSTR("\""));
  if (v5 >= 1)
  {
    v6 = &v4[v5];
    do
    {
      v7 = *v4;
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            goto LABEL_16;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            goto LABEL_16;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            goto LABEL_16;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            goto LABEL_16;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            goto LABEL_16;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
LABEL_16:
            objc_msgSend(v8, "appendString:", v9);
            goto LABEL_17;
        }
      }
      if ((v7 & 0x80000000) != 0)
      {
        if (!__maskrune(*v4, 0x40000uLL))
        {
LABEL_23:
          objc_msgSend(a2, "appendFormat:", CFSTR("\\%03o"), v7);
          goto LABEL_17;
        }
      }
      else if ((_DefaultRuneLocale.__runetype[v7] & 0x40000) == 0)
      {
        goto LABEL_23;
      }
      objc_msgSend(a2, "appendFormat:", CFSTR("%c"), v7);
LABEL_17:
      ++v4;
    }
    while (v4 < v6);
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

NSString *sub_100013DC0(char *a1, int a2, void *a3)
{
  NSMutableString *v3;
  int v6;
  int v7;
  int v8;
  char *v9;
  char *v10;
  char v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  int v22;
  char *v23;

  v3 = 0;
  if (a1 && a3)
  {
    v23 = a1;
    v6 = sub_100013FA0(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      while (1)
      {
        v8 = sub_100013FA0(&v23);
        v9 = v23;
        if (v8 == a2)
          break;
        v10 = v23 + 1;
        while (*v10++)
          ;
        v23 = v10;
        if (v7-- < 2)
          return 0;
      }
      if (*v23)
      {
        v3 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", objc_msgSend(a3, "length"));
        v14 = *v9;
        if (*v9)
        {
          v15 = 0;
          while (1)
          {
            if (v14 < 0)
            {
              -[NSMutableString appendString:](v3, "appendString:", CFSTR("_"));
              v14 = *v9;
            }
            v16 = v14 & 0x1F;
            v17 = v14 & 0x60;
            if (v17 == 32)
              break;
            if (v17 == 64)
            {
              v18 = __toupper((char)objc_msgSend(a3, "characterAtIndex:", v15));
LABEL_21:
              -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%c"), v18);
              ++v15;
              --v16;
            }
            if (v16 >= 1)
            {
              v19 = v16;
              v20 = v15;
              do
              {
                v21 = objc_msgSend(a3, "characterAtIndex:", v20);
                if (v17 == 96)
                  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%c"), __toupper((char)v21));
                else
                  -[NSMutableString appendFormat:](v3, "appendFormat:", CFSTR("%C"), v21);
                ++v20;
                --v19;
              }
              while (v19);
            }
            v15 += v16;
            v22 = *++v9;
            v14 = v22;
            if (!v22)
              return (NSString *)v3;
          }
          v18 = __tolower((char)objc_msgSend(a3, "characterAtIndex:", v15));
          goto LABEL_21;
        }
      }
      else
      {
        return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23 + 1);
      }
    }
  }
  return (NSString *)v3;
}

uint64_t sub_100013FA0(char **a1)
{
  char *v1;
  uint64_t v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v9;
  uint64_t v10;
  int v11;

  v1 = *a1;
  v2 = *(*a1)++;
  if ((v2 & 0x80000000) != 0)
  {
    v3 = v2 & 0x7F;
    v4 = v1[1];
    *a1 = v1 + 2;
    v5 = v4 << 7;
    if ((v4 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x3F80;
    v6 = v1[2];
    *a1 = v1 + 3;
    v5 = v6 << 14;
    if ((v6 & 0x80000000) == 0)
      return v5 | v3;
    v3 |= v5 & 0x1FC000;
    v7 = v1[3];
    *a1 = v1 + 4;
    v5 = v7 << 21;
    if (v7 < 0)
    {
      v9 = v1[4];
      *a1 = v1 + 5;
      v2 = v5 & 0xFE00000 | (v9 << 28) | v3;
      if (v9 < 0)
      {
        v10 = 0;
        while (1)
        {
          v11 = v1[v10 + 5];
          *a1 = &v1[v10 + 6];
          if ((v11 & 0x80000000) == 0)
            break;
          if ((_DWORD)++v10 == 5)
          {
            +[NSException raise:format:](NSException, "raise:format:", NSParseErrorException, CFSTR("Unable to read varint32"));
            return v2;
          }
        }
      }
    }
    else
    {
      return v5 | v3;
    }
  }
  return v2;
}

void sub_100014088(uint64_t a1, void *a2, unsigned int a3)
{
  sub_10001213C(a1, a2, a3, 0);
}

BOOL sub_100014090(objc_class *a1, const char *a2)
{
  Method *v3;
  unint64_t i;
  SEL Name;
  _BOOL8 v6;
  unsigned int outCount;

  outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      Name = method_getName(v3[i]);
      v6 = Name == a2;
      if (Name == a2)
        break;
    }
  }
  else
  {
    v6 = 0;
  }
  free(v3);
  return v6;
}

id sub_100014110(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id result;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  unsigned int v14;
  unsigned int v15;
  const __CFString *v16;
  uint64_t v17;
  const char *v18;
  id v19;
  id v20;
  float v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;
  id v28;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v28 = result;
  if (result)
  {
    v27 = *(_QWORD *)v33;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v27)
          objc_enumerationMutation(a2);
        v30 = v7;
        v8 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v7);
        result = objc_msgSend(v8, "fieldNumber");
        if (result >= a3)
        {
          v9 = result;
          if (result >= HIDWORD(a3))
            return result;
          v10 = objc_msgSend(a1, "getExtension:", v8);
          v11 = objc_msgSend(v8, "isRepeated");
          if ((v11 & 1) != 0)
          {
            v12 = (uint64_t)objc_msgSend(v10, "count");
            v13 = objc_msgSend(v8, "singletonName");
            if (v12 != 1)
            {
              objc_msgSend(a4, "appendFormat:", CFSTR("%@# [%@]\n"), a5, v13);
              v14 = objc_msgSend(v8, "dataType");
              if (!v12)
                goto LABEL_7;
              v15 = v14;
              v16 = &stru_100072BF0;
              goto LABEL_16;
            }
          }
          else
          {
            v13 = objc_msgSend(v8, "singletonName");
          }
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  # [%@]"), v13);
          v15 = objc_msgSend(v8, "dataType");
          v12 = 1;
LABEL_16:
          v17 = 0;
          if (v15 - 15 >= 2)
            v18 = ":";
          else
            v18 = "";
          do
          {
            v19 = v10;
            if (v11)
              v19 = objc_msgSend(v10, "objectAtIndex:", v17);
            objc_msgSend(a4, "appendFormat:", CFSTR("%@%u%s "), a5, v9, v18);
            switch(v15)
            {
              case 0u:
                if (objc_msgSend(v19, "BOOLValue"))
                  v22 = CFSTR("true");
                else
                  v22 = CFSTR("false");
                objc_msgSend(a4, "appendString:", v22);
                break;
              case 1u:
              case 0xBu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%u"), objc_msgSend(v19, "unsignedIntValue"), v24);
                break;
              case 2u:
                v20 = objc_msgSend(v19, "unsignedIntValue");
                goto LABEL_34;
              case 3u:
                objc_msgSend(v19, "floatValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*g"), 6, v21);
                break;
              case 4u:
              case 0xCu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%llu"), objc_msgSend(v19, "unsignedLongLongValue"), v24);
                break;
              case 5u:
              case 8u:
              case 0xAu:
                objc_msgSend(a4, "appendFormat:", CFSTR("%lld"), objc_msgSend(v19, "longLongValue"), v24);
                break;
              case 6u:
                objc_msgSend(v19, "doubleValue");
                objc_msgSend(a4, "appendFormat:", CFSTR("%.*lg"), 15, v23);
                break;
              case 7u:
              case 9u:
              case 0x11u:
                v20 = objc_msgSend(v19, "intValue");
LABEL_34:
                objc_msgSend(a4, "appendFormat:", CFSTR("%d"), v20, v24);
                break;
              case 0xDu:
                sub_100013C1C(v19, a4);
                break;
              case 0xEu:
                sub_100014504(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                objc_msgSend(a4, "appendFormat:", CFSTR("{%@\n"), v16);
                sub_100012F40(v19, a4, objc_msgSend(a5, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a4, "appendFormat:", CFSTR("%@}"), a5);
                v16 = &stru_100072BF0;
                break;
              default:
                break;
            }
            objc_msgSend(a4, "appendFormat:", CFSTR("%@\n"), v16);
            ++v17;
          }
          while (v12 != v17);
        }
LABEL_7:
        v7 = v30 + 1;
      }
      while ((id)(v30 + 1) != v28);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v28 = result;
    }
    while (result);
  }
  return result;
}

id sub_100014504(void *a1, void *a2)
{
  char *v4;
  char *v5;
  char *i;
  id v7;
  void *v8;
  const __CFString *v9;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "appendString:", CFSTR("\""));
  v4 = (char *)objc_msgSend(a1, "length");
  if (v4)
  {
    v5 = v4;
    for (i = 0; v5 != i; ++i)
    {
      v7 = objc_msgSend(a1, "characterAtIndex:", i);
      if ((int)v7 > 33)
      {
        switch((_DWORD)v7)
        {
          case '"':
            v8 = a2;
            v9 = CFSTR("\\\"");
            break;
          case '\'':
            v8 = a2;
            v9 = CFSTR("\\'");
            break;
          case '\\':
            v8 = a2;
            v9 = CFSTR("\\\\");
            break;
          default:
LABEL_19:
            if (v7 > 0x1F)
              objc_msgSend(a2, "appendFormat:", CFSTR("%C"), v7, v11, v12);
            else
              objc_msgSend(a2, "appendFormat:", CFSTR("\\%d%d%d"), 0, v7 >> 3, v7 & 7);
            continue;
        }
      }
      else
      {
        switch((_DWORD)v7)
        {
          case 9:
            v8 = a2;
            v9 = CFSTR("\\t");
            break;
          case 0xA:
            v8 = a2;
            v9 = CFSTR("\\n");
            break;
          case 0xD:
            v8 = a2;
            v9 = CFSTR("\\r");
            break;
          default:
            goto LABEL_19;
        }
      }
      objc_msgSend(v8, "appendString:", v9);
    }
  }
  return objc_msgSend(a2, "appendString:", CFSTR("\""));
}

id sub_100014688(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  int v8;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 56));
  sub_100014504(a2, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_100013C1C(a3, *(void **)(a1 + 32));
      break;
    case 15:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_100012F40(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 14:
      sub_100014504(a3, *(void **)(a1 + 32));
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 80));
}

id sub_1000147C0(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = *(void **)(a1 + 32);
  v7 = 40;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    v7 = 48;
  objc_msgSend(v6, "appendString:", *(_QWORD *)(a1 + v7));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 0;
  v8 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 104) == 14)
  {
    objc_msgSend(v8, "appendString:", *(_QWORD *)(a1 + 56));
    sub_100014504(a2, *(void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  }
  else
  {
    objc_msgSend(v8, "appendFormat:", CFSTR("%@%@\n"), *(_QWORD *)(a1 + 56), a2);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  switch(*(_BYTE *)(a1 + 105))
  {
    case 0xD:
      sub_100013C1C(a3, *(void **)(a1 + 32));
      break;
    case 0xE:
      sub_100014504(a3, *(void **)(a1 + 32));
      break;
    case 0xF:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_100012F40(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 0x11:
      v11 = objc_msgSend(a3, "intValue");
      v12 = objc_msgSend(*(id *)(a1 + 80), "enumDescriptor");
      if (v12)
      {
        v13 = objc_msgSend(v12, "textFormatNameForValue:", v11);
        if (v13)
        {
          v10 = v13;
          v9 = *(void **)(a1 + 32);
          goto LABEL_14;
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), v11);
      break;
    default:
      v9 = *(void **)(a1 + 32);
      v10 = a3;
LABEL_14:
      objc_msgSend(v9, "appendString:", v10);
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 88));
}

unint64_t SASIDSProtocolNumbers_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&qword_10008AAA8))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("SASIDSProtocolNumbers"), "Announce", &unk_10006BE3C, 7, SASIDSProtocolNumbers_IsValidValue, &unk_10006BE58);
    while (!__ldaxr(&qword_10008AAA8))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AAA8))
        return atomic_load(&qword_10008AAA8);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AAA8);
}

BOOL SASIDSProtocolNumbers_IsValidValue(unsigned int a1)
{
  return a1 < 7;
}

unint64_t SASTeardownReason_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&qword_10008AAB0))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("SASTeardownReason"), "NewerSession", &unk_10006BE80, 1, SASTeardownReason_IsValidValue, &unk_10006BE84);
    while (!__ldaxr(&qword_10008AAB0))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AAB0))
        return atomic_load(&qword_10008AAB0);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AAB0);
}

BOOL SASTeardownReason_IsValidValue(int a1)
{
  return a1 == 0;
}

unint64_t SASProtocol_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&qword_10008AAB8))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("SASProtocol"), "HmacSha256Version1", &unk_10006BEB0, 2, SASProtocol_IsValidValue, &unk_10006BF10);
    while (!__ldaxr(&qword_10008AAB8))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AAB8))
        return atomic_load(&qword_10008AAB8);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AAB8);
}

BOOL SASProtocol_IsValidValue(unsigned int a1)
{
  return a1 < 2;
}

TransparencyGPBFileDescriptor *sub_100014C28()
{
  TransparencyGPBFileDescriptor *result;

  result = (TransparencyGPBFileDescriptor *)qword_10008AAF8;
  if (!qword_10008AAF8)
  {
    result = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]([TransparencyGPBFileDescriptor alloc], "initWithPackage:syntax:", &stru_100072BF0, 3);
    qword_10008AAF8 = (uint64_t)result;
  }
  return result;
}

uint64_t SASTeardown_Reason_RawValue(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[SASTeardown descriptor](SASTeardown, "descriptor"), "fieldWithNumber:", 2));
}

id SetSASTeardown_Reason_RawValue(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[SASTeardown descriptor](SASTeardown, "descriptor"), "fieldWithNumber:", 2), a2);
}

void sub_100015108(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = objc_msgSend(a2, "copy");
  objc_msgSend(a3, "addField:", v4);

}

int sub_10001540C(id a1, const void *a2, const void *a3)
{
  int v3;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
    v3 = 0;
  else
    v3 = -1;
  if (*(_QWORD *)a2 > *(_QWORD *)a3)
    return 1;
  else
    return v3;
}

int sub_10001557C(id a1, const void *a2, const void *a3)
{
  int v3;

  if (*(_QWORD *)a2 == *(_QWORD *)a3)
    v3 = 0;
  else
    v3 = -1;
  if (*(_QWORD *)a2 > *(_QWORD *)a3)
    return 1;
  else
    return v3;
}

id sub_100015644(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSize");
  *a3 += result;
  return result;
}

id sub_10001568C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

id sub_1000156CC(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSizeAsMessageSetExtension");
  *a3 += result;
  return result;
}

void sub_1000158B8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v5 = objc_msgSend(a2, "number");
  if (!(_DWORD)v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Zero is not a valid field number."));
  v6 = objc_msgSend(a3, "mutableFieldForNumber:create:", v5, 0);
  if (v6)
  {
    objc_msgSend(v6, "mergeFromField:", a2);
  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    objc_msgSend(a3, "addField:", v7);

  }
}

void sub_100015D04(id a1)
{
  uint64_t v1;

  v1 = xpc_transaction_exit_clean(a1);
  xpc_transaction_try_exit_clean(v1);
}

id sub_100016070(uint64_t a1)
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v3, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "signalEventHander");
}

uint64_t sub_1000161E8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

unint64_t sub_100016298()
{
  id v1;

  if (!atomic_load(&qword_10008AB28))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBSyntax"), "SyntaxProto2", &unk_10006BF54, 2, sub_100016314, 0);
    while (!__ldaxr(&qword_10008AB28))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AB28))
        return atomic_load(&qword_10008AB28);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AB28);
}

BOOL sub_100016314(unsigned int a1)
{
  return a1 < 2;
}

unint64_t sub_100016320()
{
  id v1;

  if (!atomic_load(&qword_10008AB30))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBField_Kind"), "TypeUnknown", &unk_10006C030, 19, sub_10001639C, 0);
    while (!__ldaxr(&qword_10008AB30))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AB30))
        return atomic_load(&qword_10008AB30);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AB30);
}

BOOL sub_10001639C(unsigned int a1)
{
  return a1 < 0x13;
}

unint64_t sub_1000163A8()
{
  id v1;

  if (!atomic_load(&qword_10008AB38))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBField_Cardinality"), "CardinalityUnknown", &unk_10006C0CC, 4, sub_100016424, 0);
    while (!__ldaxr(&qword_10008AB38))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008AB38))
        return atomic_load(&qword_10008AB38);
    }
    __clrex();

  }
  return atomic_load(&qword_10008AB38);
}

BOOL sub_100016424(unsigned int a1)
{
  return a1 < 4;
}

uint64_t sub_10001649C(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBType descriptor](TransparencyGPBType, "descriptor"), "fieldWithNumber:", 6));
}

id sub_1000164D4(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBType descriptor](TransparencyGPBType, "descriptor"), "fieldWithNumber:", 6), a2);
}

uint64_t sub_100016594(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 1));
}

id sub_1000165CC(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 1), a2);
}

uint64_t sub_10001660C(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 2));
}

id sub_100016644(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBField descriptor](TransparencyGPBField, "descriptor"), "fieldWithNumber:", 2), a2);
}

uint64_t sub_1000166F0(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBEnum descriptor](TransparencyGPBEnum, "descriptor"), "fieldWithNumber:", 5));
}

id sub_100016728(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBEnum descriptor](TransparencyGPBEnum, "descriptor"), "fieldWithNumber:", 5), a2);
}

id sub_100016CE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSetFlag:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_100016EF4(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_100016F00(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_100016F1C(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_100016F38(_BYTE *a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  LOBYTE(v1) = *a1;
  if (*a1)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v2 = (1025 * (v2 + (char)v1)) ^ ((1025 * (v2 + (char)v1)) >> 6);
      v1 = a1[v3++];
    }
    while (v1);
    v4 = 9 * v2;
  }
  else
  {
    v4 = 0;
  }
  return 32769 * (v4 ^ (v4 >> 11));
}

uint64_t sub_100016FDC(objc_class *a1, const char *a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  const char *Name;
  objc_class *MetaClass;
  void (*v9)(void);
  _QWORD block[5];

  result = (uint64_t)sub_1000170A0(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = sub_100012EA4("getClassValue", 0);
    Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000171EC;
    block[3] = &unk_1000710E0;
    block[4] = v5;
    v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || sub_100014090(MetaClass, a2);
  }
  return result;
}

const void *sub_1000170A0(objc_class *a1, SEL sel)
{
  const char *Name;
  int v4;
  const void *Value;
  const char *v6;
  uint64_t v7;
  const char *v8;
  size_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  uint64_t v14;

  Name = sel_getName(sel);
  v4 = *(unsigned __int8 *)Name;
  if (v4 != 95)
  {
    v6 = Name;
    v7 = 1;
    if (!*Name)
    {
LABEL_6:
      v8 = class_getName(a1);
      v9 = strlen(v8);
      __chkstk_darwin();
      v11 = (char *)&v14 - v10;
      bzero((char *)&v14 - v10, v12);
      memcpy(v11, v8, v9);
      v11[v9] = 95;
      memcpy(&v11[v9 + 1], v6, v7 - 1);
      v11[v9 + v7] = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&unk_10008AB78);
      Value = CFDictionaryGetValue((CFDictionaryRef)qword_10008AB68, v11);
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_10008AB78);
      return Value;
    }
    while (v4 != 58)
    {
      v4 = Name[v7++];
      if (!v4)
        goto LABEL_6;
    }
  }
  return 0;
}

uint64_t sub_1000171EC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sub_1000172BC(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBApi descriptor](TransparencyGPBApi, "descriptor"), "fieldWithNumber:", 7));
}

id sub_1000172F4(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBApi descriptor](TransparencyGPBApi, "descriptor"), "fieldWithNumber:", 7), a2);
}

uint64_t sub_1000173B4(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBMethod descriptor](TransparencyGPBMethod, "descriptor"), "fieldWithNumber:", 7));
}

id sub_1000173EC(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBMethod descriptor](TransparencyGPBMethod, "descriptor"), "fieldWithNumber:", 7), a2);
}

uint64_t *sub_100017654(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = result;
  v4 = result[2];
  if (v4 == result[1])
  {
    result = sub_10001A098(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = sub_10001A098(v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_10001A098(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = sub_10001A098(v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = BYTE3(a2);
  v12 = v3[2];
  if (v12 == v3[1])
  {
    result = sub_10001A098(v3);
    v12 = v3[2];
  }
  v13 = *v3;
  v3[2] = v12 + 1;
  *(_BYTE *)(v13 + v12) = BYTE4(a2);
  v14 = v3[2];
  if (v14 == v3[1])
  {
    result = sub_10001A098(v3);
    v14 = v3[2];
  }
  v15 = *v3;
  v3[2] = v14 + 1;
  *(_BYTE *)(v15 + v14) = BYTE5(a2);
  v16 = v3[2];
  if (v16 == v3[1])
  {
    result = sub_10001A098(v3);
    v16 = v3[2];
  }
  v17 = *v3;
  v3[2] = v16 + 1;
  *(_BYTE *)(v17 + v16) = BYTE6(a2);
  v18 = v3[2];
  if (v18 == v3[1])
  {
    result = sub_10001A098(v3);
    v18 = v3[2];
  }
  v19 = *v3;
  v3[2] = v18 + 1;
  *(_BYTE *)(v19 + v18) = HIBYTE(a2);
  return result;
}

uint64_t *sub_100017824(uint64_t *result, int a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = result;
  v4 = result[2];
  if (v4 == result[1])
  {
    result = sub_10001A098(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = sub_10001A098(v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_10001A098(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = sub_10001A098(v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t *sub_100017944(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = sub_10001A098(v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_10001A098(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_100017A78(uint64_t *result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0)
    return sub_100017944(result, (int)a2);
  else
    return sub_100017D4C(result, a2);
}

uint64_t *sub_100017D4C(uint64_t *result, unsigned int a2)
{
  unsigned int v2;
  uint64_t *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = sub_10001A098(v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_10001A098(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_1000180A8(uint64_t *a1, int a2, unsigned int a3)
{
  unsigned int v5;

  v5 = sub_100023730(a2, 0);
  sub_100017D4C(a1, v5);
  return sub_100017D4C(a1, a3);
}

void sub_1000183B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000183D0(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t sub_1000183E8()
{
  return 8;
}

id sub_1000183F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDoubleNoTag:");
}

id sub_1000183F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDouble:value:", *(unsigned int *)(a1 + 40));
}

void sub_10001854C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018564(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t sub_10001857C()
{
  return 4;
}

id sub_100018584(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloatNoTag:");
}

id sub_10001858C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloat:value:", *(unsigned int *)(a1 + 40));
}

void sub_1000186E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000186F8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_10001A318(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_100018734(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64NoTag:", a2);
}

id sub_100018740(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100018898(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000188B0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_10001A318(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1000188E8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64NoTag:", a2);
}

id sub_1000188F4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100018A4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018A64(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_100018ABC(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

id sub_100018B00(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32NoTag:", a2);
}

id sub_100018B0C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100018C64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018C7C(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t sub_100018CC8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

id sub_100018D00(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32NoTag:", a2);
}

id sub_100018D0C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100018E64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018E7C(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_100018E94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64NoTag:", a2);
}

id sub_100018EA0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100018FF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019010(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_100019028(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32NoTag:", a2);
}

id sub_100019034(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_10001918C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000191A4(uint64_t result, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (2 * a2) ^ (a2 >> 31);
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v2 >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t sub_1000191F8(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (2 * a1) ^ (a1 >> 31);
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (v1 >> 28)
    v4 = 5;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 1;
}

id sub_100019238(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32NoTag:", a2);
}

id sub_100019244(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_10001939C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000193B4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_10001A318((2 * a2) ^ (a2 >> 63));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1000193F0(uint64_t a1)
{
  return sub_10001A318((2 * a1) ^ (a1 >> 63));
}

id sub_1000193FC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64NoTag:", a2);
}

id sub_100019408(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100019560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019578(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

id sub_100019590(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64NoTag:", a2);
}

id sub_10001959C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1000196F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001970C(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

id sub_100019724(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32NoTag:", a2);
}

id sub_100019730(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100019888(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000198A0(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000198B8()
{
  return 1;
}

id sub_1000198C0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBoolNoTag:", a2);
}

id sub_1000198CC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBool:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_100019A24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100019A3C(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

id sub_100019A94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnumNoTag:", a2);
}

id sub_100019AA0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnum:value:", *(unsigned int *)(a1 + 40), a2);
}

_QWORD *sub_10001A098(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (!result[3])
    result = +[NSException raise:format:](NSException, "raise:format:", CFSTR("OutOfSpace"), &stru_100072BF0);
  if (v1[2])
  {
    result = objc_msgSend((id)v1[3], "write:maxLength:", *v1);
    if (result != (_QWORD *)v1[2])
      result = +[NSException raise:format:](NSException, "raise:format:", CFSTR("WriteFailed"), &stru_100072BF0);
    v1[2] = 0;
  }
  return result;
}

uint64_t sub_10001A318(unint64_t a1)
{
  uint64_t v2;

  if (a1 < 0x80)
    return 1;
  if (a1 < 0x4000)
    return 2;
  if (a1 < 0x200000)
    return 3;
  if (!(a1 >> 28))
    return 4;
  if (!(a1 >> 35))
    return 5;
  if (!(a1 >> 42))
    return 6;
  if (!(a1 >> 49))
    return 7;
  v2 = 9;
  if ((a1 & 0x8000000000000000) != 0)
    v2 = 10;
  if (HIBYTE(a1))
    return v2;
  else
    return 8;
}

char *sub_10001A3A8(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

char *sub_10001A3FC(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "serializedSize");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

char *sub_10001A448(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "length");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

uint64_t sub_10001A494(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_100023730(a1, 0);
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if (v1 >> 28)
    v4 = 13;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t sub_10001A4E0(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_100023730(a1, 0);
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (v1 >> 28)
    v4 = 5;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 1;
}

uint64_t sub_10001A52C(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_100023730(a1, 0);
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (v1 >> 28)
    v4 = 9;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t sub_10001A578(int a1, unint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_100023730(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  return sub_10001A318(a2) + v7;
}

uint64_t sub_10001A5DC(int a1, unsigned int a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_100023730(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  v8 = 10;
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (a2 >> 28)
    v12 = 5;
  if (a2 >= 0x200000)
    v11 = v12;
  if (a2 >= 0x4000)
    v10 = v11;
  if (a2 >= 0x80)
    v9 = v10;
  if ((a2 & 0x80000000) == 0)
    v8 = v9;
  return v8 + v4;
}

uint64_t sub_10001A678(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = sub_100023730(a1, 0);
  v2 = 3;
  v3 = 4;
  v4 = 5;
  if (v1 >> 28)
    v4 = 6;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 2;
}

char *sub_10001A6C4(int a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_100023730(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

char *sub_10001A764(int a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_100023730(a1, 0);
  v4 = 4;
  v5 = 6;
  v6 = 10;
  if (!(v3 >> 28))
    v6 = 8;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 2;
  return (char *)objc_msgSend(a2, "serializedSize") + v7;
}

char *sub_10001A7CC(int a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_100023730(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "serializedSize");
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

char *sub_10001A868(int a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_100023730(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "length");
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

uint64_t sub_10001A904(int a1, unsigned int a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100023730(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (a2 >> 28)
    v11 = 5;
  if (a2 >= 0x200000)
    v10 = v11;
  if (a2 >= 0x4000)
    v9 = v10;
  if (a2 >= 0x80)
    v8 = v9;
  return v8 + v4;
}

uint64_t sub_10001A994(int a1, int a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = sub_100023730(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  v8 = (2 * a2) ^ (a2 >> 31);
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (v8 >> 28)
    v11 = 5;
  if (v8 >= 0x200000)
    v10 = v11;
  if (v8 >= 0x4000)
    v9 = v10;
  if (v8 >= 0x80)
    v12 = v9;
  else
    v12 = 1;
  return v12 + v4;
}

uint64_t sub_10001AA2C(int a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_100023730(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (v3 >> 28)
    v6 = 5;
  if (v3 >= 0x200000)
    v5 = v6;
  if (v3 >= 0x4000)
    v4 = v5;
  if (v3 >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  return sub_10001A318((2 * a2) ^ (a2 >> 63)) + v7;
}

char *sub_10001AA94(unsigned int a1, void *a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_100023730(1, 0);
  v5 = 4;
  v6 = 6;
  v7 = 10;
  if (!(v4 >> 28))
    v7 = 8;
  if (v4 >= 0x200000)
    v6 = v7;
  if (v4 >= 0x4000)
    v5 = v6;
  if (v4 >= 0x80)
    v8 = v5;
  else
    v8 = 2;
  v9 = sub_10001A904(2, a1) + v8;
  return &sub_10001A7CC(3, a2)[v9];
}

char *sub_10001AB20(unsigned int a1, void *a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_100023730(1, 0);
  v5 = 4;
  v6 = 6;
  v7 = 10;
  if (!(v4 >> 28))
    v7 = 8;
  if (v4 >= 0x200000)
    v6 = v7;
  if (v4 >= 0x4000)
    v5 = v6;
  if (v4 >= 0x80)
    v8 = v5;
  else
    v8 = 2;
  v9 = sub_10001A904(2, a1) + v8;
  return &sub_10001A868(3, a2)[v9];
}

uint64_t sub_10001ABAC(int a1, int a2)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_100023730(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (v3 >> 28)
    v7 = 5;
  if (v3 >= 0x200000)
    v6 = v7;
  if (v3 >= 0x4000)
    v5 = v6;
  if (v3 >= 0x80)
    v4 = v5;
  return v4 << (a2 == 16);
}

id sub_10001AE58(uint64_t a1)
{
  unint64_t v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "setInitialDelay:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDelay:", objc_msgSend(*(id *)(a1 + 32), "initialDelay"));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = (double)*(unint64_t *)(a1 + 48) / (double)v2;
  else
    v3 = 1.0;
  objc_msgSend(*(id *)(a1 + 32), "setBackoff:", v3);
  return objc_msgSend(*(id *)(a1 + 32), "setMaximumDelay:", *(_QWORD *)(a1 + 48));
}

id sub_10001B134(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueTrigger:maximumDelay:", *(_QWORD *)(a1 + 40), -1);
}

void sub_10001B1F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10001B20C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLiveRequest:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "liveRequestReceived"));
  objc_msgSend(v2, "fulfill");

  if (*(_QWORD *)(a1 + 40) == -1)
    v3 = 0;
  else
    v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(WeakRetained, "_onqueueTrigger:maximumDelay:", v3);

}

void sub_10001B53C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_10001B550(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setLiveRequest:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "liveRequestReceived"));
  objc_msgSend(v1, "fulfill");

  objc_msgSend(WeakRetained, "_onqueueTrigger:maximumDelay:", 0, -1);
}

void sub_10001B954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001B980(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onqueueTimerTick");

}

void sub_10001BA18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  intptr_t v5;
  NSObject *v6;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    v5 = dispatch_source_testcancel(v4);

    if (!v5)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
      dispatch_source_cancel(v6);

    }
  }
}

void sub_10001C58C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

SEL sub_10001CE10(char *__s, char *str, const char *a3, int a4)
{
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  if (!__s && !a3 && (a4 & 1) == 0)
    return sel_getUid(str);
  if (__s)
    v9 = strlen(__s);
  else
    v9 = 0;
  v10 = strlen(str);
  v11 = v10;
  if (a3)
  {
    v10 = strlen(a3);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v18 = (uint64_t)&v18;
  v13 = v11 + v9 + v12;
  v14 = 1;
  if (a4)
    v14 = 2;
  v15 = v13 + v14;
  __chkstk_darwin(v10);
  v17 = (char *)&v18 - v16;
  bzero((char *)&v18 - v16, v15);
  if (!__s)
  {
    memcpy(v17, str, v11);
    if (!a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  memcpy(v17, __s, v9);
  memcpy(&v17[v9], str, v11);
  v17[v9] = __toupper(v17[v9]);
  if (a3)
LABEL_15:
    memcpy(&v17[v9 + v11], a3, v12);
LABEL_16:
  if (a4)
    v17[v13] = 58;
  v17[v15 - 1] = 0;
  return sel_getUid(v17);
}

uint64_t sub_10001D240(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(unsigned __int16 *)(v1 + 28);
  if ((v2 & 0xF00) != 0)
  {
    v3 = 15;
    LOBYTE(v4) = 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(v1 + 30);
    v4 = (v2 >> 2) & 1;
  }
  v5 = sub_100023758(v3, v4);
  return sub_100023730(*(_DWORD *)(v1 + 16), v5);
}

uint64_t sub_10001D288(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_100023758(*(unsigned __int8 *)(v1 + 30), (*(_WORD *)(v1 + 28) & 4) == 0);
  return sub_100023730(*(_DWORD *)(v1 + 16), v2);
}

void sub_10001DA74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001E688(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  KTCondition *v5;

  v3 = a2;
  v5 = objc_alloc_init(KTCondition);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mutableStateConditions"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, v3);

}

void sub_10001E6F8(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E784;
  block[3] = &unk_100070A78;
  v5 = WeakRetained;
  v3 = WeakRetained;
  dispatch_sync(v2, block);

}

id sub_10001E784(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSendAnyPendingFlags");
}

void sub_10001E854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001E86C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001E87C(uint64_t a1)
{

}

void sub_10001E884(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mutableStateConditions"));
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001EE4C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10001F238(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10001F268(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10001F298(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10001F3D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001F3F4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD block[4];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F48C;
  block[3] = &unk_100070AE8;
  v5 = *(id *)(a1 + 32);
  v6 = WeakRetained;
  dispatch_sync(v2, block);

}

id sub_10001F48C(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_1000715B8);
  v2 = (void *)qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "intendedState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "currentFlags"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsAsString"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "pendingFlagsString"));
    v10 = *(void **)(a1 + 32);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    v12 = (void *)v11;
    *(_DWORD *)buf = 138544642;
    v13 = CFSTR("(no error)");
    v41 = v5;
    if (v11)
      v13 = (const __CFString *)v11;
    v42 = 2114;
    v43 = v6;
    v44 = 2114;
    v45 = v8;
    v46 = 2114;
    v47 = v9;
    v48 = 2114;
    v49 = v10;
    v50 = 2114;
    v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Finishing state transition attempt (ending in %{public}@, intended: %{public}@, f:[%{public}@], p:[%{public}@]): %{public}@ %{public}@", buf, 0x3Eu);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stateMachineWatchers"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v36;
    *(_QWORD *)&v16 = 138543362;
    v34 = v16;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v19);
        if (qword_10008ABA0 != -1)
          dispatch_once(&qword_10008ABA0, &stru_1000715D8);
        v21 = qword_10008ABA8;
        if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v34;
          v41 = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "notifying watcher: %{public}@", buf, 0xCu);
        }
        objc_msgSend(v20, "onqueueHandleTransition:", *(_QWORD *)(a1 + 32), v34);
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stateMachineWatchers"));
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stateMachineWatchers"));
    v25 = (uint64_t)objc_msgSend(v24, "count");

    if (v25 >= 1)
    {
      v26 = v25 + 1;
      do
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stateMachineWatchers"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectAtIndexedSubscript:", v26 - 2));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "result"));
        v30 = objc_msgSend(v29, "isFinished");

        if (v30)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stateMachineWatchers"));
          objc_msgSend(v31, "removeObjectAtIndex:", v26 - 2);

        }
        --v26;
      }
      while (v26 > 1);
    }
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextState"));
  objc_msgSend(*(id *)(a1 + 40), "setCurrentState:", v32);

  objc_msgSend(*(id *)(a1 + 40), "setNextStateMachineCycleOperation:", 0);
  return objc_msgSend(*(id *)(a1 + 40), "_onqueueStartNextStateMachineOperation:", 1);
}

void sub_10001F84C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10001F87C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

id sub_10001F918(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueuePokeStateMachine");
}

id sub_10001F9F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueHandleFlag:", *(_QWORD *)(a1 + 40));
}

id sub_10001FAFC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueHandlePendingFlag:", *(_QWORD *)(a1 + 40));
}

id sub_10001FBB8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueHandlePendingFlag:", *(_QWORD *)(a1 + 40));
}

id sub_10001FCE8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueCancelPendingFlag:", *(_QWORD *)(a1 + 40));
}

void sub_10001FE68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001FE88(uint64_t a1)
{
  NSObject *v1;
  id WeakRetained;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FF08;
  block[3] = &unk_100070A78;
  block[4] = WeakRetained;
  dispatch_sync(v1, block);

}

id sub_10001FF08(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_100071620);
  v2 = qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Finished waiting for operation", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSendAnyPendingFlags");
}

void sub_10001FF9C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

id sub_100020038(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAllowPendingFlags:", 0);
}

void sub_100020124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002013C(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingFlags", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allKeys"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pendingFlags"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v8));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v11, v8);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

void sub_10002037C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100020394(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentFlags", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dumpFlags"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void sub_1000209CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020A28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100020A58(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020ADC;
    block[3] = &unk_100070A78;
    block[4] = v3;
    dispatch_sync(v2, block);

    WeakRetained = v3;
  }

}

id sub_100020ADC(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_100071688);
  v2 = qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unlock occurred", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConditionChecksInFlight:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "conditionChecksInFlight") & 0xFFFFFFFFFFFFFFFELL);
  objc_msgSend(*(id *)(a1 + 32), "_onqueueRecheckConditions");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSendAnyPendingFlags");
}

void sub_100020B90(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100020BC0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100020BF0(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD block[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100020C74;
    block[3] = &unk_100070A78;
    block[4] = v3;
    dispatch_sync(v2, block);

    WeakRetained = v3;
  }

}

id sub_100020C74(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_1000716C8);
  v2 = qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Network is reachable", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConditionChecksInFlight:", (unint64_t)objc_msgSend(*(id *)(a1 + 32), "conditionChecksInFlight") & 0xFFFFFFFFFFFFFFFDLL);
  objc_msgSend(*(id *)(a1 + 32), "_onqueueRecheckConditions");
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueSendAnyPendingFlags");
}

void sub_100020D28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_1000212B8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_1000212E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100021318(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_1000213E0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testHoldStates"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

id sub_1000214B8(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v6;
  uint64_t v7;

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_100071748);
  v2 = qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Releasing state machine test pause from %@", (uint8_t *)&v6, 0xCu);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "testHoldStates"));
  objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 40), "_onqueuePokeStateMachine");
}

void sub_1000215A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100021678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021690(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextStateMachineCycleOperation"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

void sub_10002179C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000217B4(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextStateMachineCycleOperation"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v2 == 0;

}

void sub_10002185C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "holdStateMachineOperation"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operationQueue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "holdStateMachineOperation"));
    objc_msgSend(v3, "addOperation:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setHoldStateMachineOperation:", 0);
  }
}

id sub_100021968(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "holdStateMachineOperation"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "operationQueue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "holdStateMachineOperation"));
    objc_msgSend(v3, "addOperation:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setHoldStateMachineOperation:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHalted:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAllowPendingFlags:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_onqueuePokeStateMachine");
}

id sub_100021A98(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachineRequests"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_onqueuePokeStateMachine");
}

id sub_100021B6C(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachineWatchers"));
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_onqueuePokeStateMachine");
}

id sub_100021C40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueueRegisterMultiStateArrivalWatcher:", *(_QWORD *)(a1 + 40));
}

void sub_100021F98(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_100021FC8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;

  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_100071788);
  v2 = (void *)qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));
    v7 = (void *)v6;
    v8 = CFSTR("no error");
    if (v6)
      v8 = (const __CFString *)v6;
    v11 = 138543618;
    v12 = v4;
    v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Returning '%{public}@' result: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v9 = *(_QWORD *)(a1 + 48);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "error"));
  (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

}

void sub_1000220F8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_10002257C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

void sub_1000225AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;

  v3 = a2;
  if (qword_10008ABA0 != -1)
    dispatch_once(&qword_10008ABA0, &stru_1000717F0);
  v4 = (void *)qword_10008ABA8;
  if (os_log_type_enabled((os_log_t)qword_10008ABA8, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(a1 + 40);
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "result"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
    v10 = (void *)v9;
    v11 = CFSTR("no error");
    if (v9)
      v11 = (const __CFString *)v9;
    v17 = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Returning '%{public}@' result: %{public}@", (uint8_t *)&v17, 0x16u);

  }
  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "result"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "error"));
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "result"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
  objc_msgSend(v3, "setError:", v16);

}

void sub_100022748(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.Transparency", "default");
  v2 = (void *)qword_10008ABA8;
  qword_10008ABA8 = (uint64_t)v1;

}

id sub_100022A88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v5 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v5 + 45) & 1) == 0)
    return sub_100022ED8(a2, v5, a3);
  if ((*(_BYTE *)(v5 + 45) & 2) != 0)
  {
    objc_msgSend(a3, "writeTag:format:", *(unsigned int *)(v5 + 40), 2);
    v10 = *(char *)(v5 + 44);
    if (v10 > 6)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(a2);
            v12 += (uint64_t)sub_1000235EC((id)*(unsigned __int8 *)(v5 + 44), *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_10006C188[v10];
      v12 = (_QWORD)objc_msgSend(a2, "count") * v11;
    }
    objc_msgSend(a3, "writeRawVarintSizeTAs32:", v12);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
    if (result)
    {
      v17 = result;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(a2);
          switch(*(_BYTE *)(v5 + 44))
          {
            case 0:
              objc_msgSend(a3, "writeBoolNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "BOOLValue"));
              break;
            case 1:
              objc_msgSend(a3, "writeFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 2:
              objc_msgSend(a3, "writeSFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 3:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "floatValue");
              objc_msgSend(a3, "writeFloatNoTag:");
              break;
            case 4:
              objc_msgSend(a3, "writeFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 5:
              objc_msgSend(a3, "writeSFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 6:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "doubleValue");
              objc_msgSend(a3, "writeDoubleNoTag:");
              break;
            case 7:
              objc_msgSend(a3, "writeInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 8:
              objc_msgSend(a3, "writeInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 9:
              objc_msgSend(a3, "writeSInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 0xA:
              objc_msgSend(a3, "writeSInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 0xB:
              objc_msgSend(a3, "writeUInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 0xC:
              objc_msgSend(a3, "writeUInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 0xD:
              objc_msgSend(a3, "writeBytesNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xE:
              objc_msgSend(a3, "writeStringNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xF:
              objc_msgSend(a3, "writeMessageNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x10:
              objc_msgSend(a3, "writeGroupNoTag:value:", *(unsigned int *)(v5 + 40), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x11:
              objc_msgSend(a3, "writeEnumNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            default:
              break;
          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
        v17 = result;
      }
      while (result);
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(a2);
          sub_100022ED8(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9), v5, a3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

id sub_100022ED8(id result, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  switch(*(_BYTE *)(a2 + 44))
  {
    case 0:
      result = objc_msgSend(a3, "writeBool:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "BOOLValue"));
      break;
    case 1:
      result = objc_msgSend(a3, "writeFixed32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedIntValue"));
      break;
    case 2:
      result = objc_msgSend(a3, "writeSFixed32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 3:
      v4 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "floatValue");
      result = objc_msgSend(a3, "writeFloat:value:", v4);
      break;
    case 4:
      result = objc_msgSend(a3, "writeFixed64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedLongLongValue"));
      break;
    case 5:
      result = objc_msgSend(a3, "writeSFixed64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 6:
      v5 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "doubleValue");
      result = objc_msgSend(a3, "writeDouble:value:", v5);
      break;
    case 7:
      result = objc_msgSend(a3, "writeInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 8:
      result = objc_msgSend(a3, "writeInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 9:
      result = objc_msgSend(a3, "writeSInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    case 0xA:
      result = objc_msgSend(a3, "writeSInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "longLongValue"));
      break;
    case 0xB:
      result = objc_msgSend(a3, "writeUInt32:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedIntValue"));
      break;
    case 0xC:
      result = objc_msgSend(a3, "writeUInt64:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "unsignedLongLongValue"));
      break;
    case 0xD:
      result = objc_msgSend(a3, "writeBytes:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xE:
      result = objc_msgSend(a3, "writeString:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xF:
      v6 = *(unsigned int *)(a2 + 40);
      if ((*(_BYTE *)(a2 + 45) & 4) != 0)
        result = objc_msgSend(a3, "writeMessageSetExtension:value:", v6, result);
      else
        result = objc_msgSend(a3, "writeMessage:value:", v6, result);
      break;
    case 0x10:
      result = objc_msgSend(a3, "writeGroup:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0x11:
      result = objc_msgSend(a3, "writeEnum:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100023170(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *j;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v3 + 45) & 1) == 0)
    return sub_1000233A4(*(_QWORD *)(a1 + 8), a2);
  if ((*(_BYTE *)(v3 + 45) & 2) != 0)
  {
    v10 = *(char *)(v3 + 44);
    if (v10 > 6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(a2);
            v12 += (uint64_t)sub_1000235EC((id)*(unsigned __int8 *)(v3 + 44), *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_10006C188[v10];
      v12 = (_QWORD)objc_msgSend(a2, "count") * v11;
    }
    v17 = sub_10001A4E0(*(_DWORD *)(v3 + 40));
    return v17 + v12 + sub_100018CC8(v12);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(a2);
          v7 += sub_1000233A4(v3, *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j));
        }
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_1000233A4(uint64_t result, void *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char v9;
  unsigned int v10;

  switch(*(_BYTE *)(result + 44))
  {
    case 0:
      v2 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "BOOLValue");
      result = sub_10001A678(v2);
      break;
    case 1:
      v5 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedIntValue");
      result = sub_10001A52C(v5);
      break;
    case 2:
      v3 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "intValue");
      result = sub_10001A52C(v3);
      break;
    case 3:
      v6 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "floatValue");
      result = sub_10001A52C(v6);
      break;
    case 4:
      v4 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedLongLongValue");
      result = sub_10001A494(v4);
      break;
    case 5:
      v7 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "longLongValue");
      result = sub_10001A494(v7);
      break;
    case 6:
      v8 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "doubleValue");
      result = sub_10001A494(v8);
      break;
    case 7:
    case 0x11:
      result = sub_10001A5DC(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
      break;
    case 8:
      result = sub_10001A578(*(_DWORD *)(result + 40), (unint64_t)objc_msgSend(a2, "longLongValue"));
      break;
    case 9:
      result = sub_10001A994(*(_DWORD *)(result + 40), (int)objc_msgSend(a2, "intValue"));
      break;
    case 0xA:
      result = sub_10001AA2C(*(_DWORD *)(result + 40), (uint64_t)objc_msgSend(a2, "longLongValue"));
      break;
    case 0xB:
      result = sub_10001A904(*(_DWORD *)(result + 40), objc_msgSend(a2, "unsignedIntValue"));
      break;
    case 0xC:
      result = sub_10001A578(*(_DWORD *)(result + 40), (unint64_t)objc_msgSend(a2, "unsignedLongLongValue"));
      break;
    case 0xD:
      result = (uint64_t)sub_10001A868(*(_DWORD *)(result + 40), a2);
      break;
    case 0xE:
      result = (uint64_t)sub_10001A6C4(*(_DWORD *)(result + 40), a2);
      break;
    case 0xF:
      v9 = *(_BYTE *)(result + 45);
      v10 = *(_DWORD *)(result + 40);
      if ((v9 & 4) != 0)
        result = (uint64_t)sub_10001AA94(v10, a2);
      else
        result = (uint64_t)sub_10001A7CC(v10, a2);
      break;
    case 0x10:
      result = (uint64_t)sub_10001A764(*(_DWORD *)(result + 40), a2);
      break;
    default:
      return result;
  }
  return result;
}

id sub_1000235EC(id result, void *a2)
{
  id v2;

  switch((int)result)
  {
    case 0:
      objc_msgSend(a2, "BOOLValue");
      return (id)sub_1000198B8();
    case 1:
      objc_msgSend(a2, "unsignedIntValue");
      return (id)sub_10001857C();
    case 2:
      objc_msgSend(a2, "intValue");
      return (id)sub_10001857C();
    case 3:
      objc_msgSend(a2, "floatValue");
      return (id)sub_10001857C();
    case 4:
      objc_msgSend(a2, "unsignedLongLongValue");
      return (id)sub_1000183E8();
    case 5:
      objc_msgSend(a2, "longLongValue");
      return (id)sub_1000183E8();
    case 6:
      objc_msgSend(a2, "doubleValue");
      return (id)sub_1000183E8();
    case 7:
    case 17:
      return (id)sub_100018ABC(objc_msgSend(a2, "intValue"));
    case 8:
      v2 = objc_msgSend(a2, "longLongValue");
      goto LABEL_13;
    case 9:
      return (id)sub_1000191F8((int)objc_msgSend(a2, "intValue"));
    case 10:
      return (id)sub_1000193F0((uint64_t)objc_msgSend(a2, "longLongValue"));
    case 11:
      return (id)sub_100018CC8(objc_msgSend(a2, "unsignedIntValue"));
    case 12:
      v2 = objc_msgSend(a2, "unsignedLongLongValue");
LABEL_13:
      result = (id)sub_100018730((unint64_t)v2);
      break;
    case 13:
      result = sub_10001A448(a2);
      break;
    case 14:
      result = sub_10001A3A8(a2);
      break;
    case 15:
      result = sub_10001A3FC(a2);
      break;
    case 16:
      result = objc_msgSend(a2, "serializedSize");
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100023730(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t sub_100023738(char a1)
{
  return a1 & 7;
}

uint64_t sub_100023740(unsigned int a1)
{
  return a1 >> 3;
}

BOOL sub_100023748(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t sub_100023758(int a1, char a2)
{
  if ((a2 & 1) != 0)
    return 2;
  else
    return dword_10006C1C0[a1];
}

void sub_100023AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023B14(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stateMachine"));
  objc_msgSend(v1, "handleFlag:", off_10008A4D0);

}

id sub_1000241E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onQueueUpdateState");
}

void sub_1000242BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000242D0(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onQueueMapMailbox"));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void sub_1000243DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000243F4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100024404(uint64_t a1)
{

}

void sub_10002440C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "onQueueMapMailbox"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002477C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000247D0(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[0] = off_10008A4C8;
  v4[1] = off_10008A4D0;
  v4[2] = off_10008A4D8;
  v4[3] = off_10008A4E0;
  v4[4] = off_10008A4E8;
  v4[5] = off_10008A4F0;
  v4[6] = off_10008A4F8;
  v4[7] = off_10008A500;
  v4[8] = off_10008A508;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 9));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_10008ABC0;
  qword_10008ABC0 = v2;

}

void sub_100024900(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[13];

  v4[0] = off_10008A510;
  v4[1] = off_10008A518;
  v4[2] = off_10008A520;
  v4[3] = off_10008A528;
  v4[4] = off_10008A530;
  v4[5] = off_10008A538;
  v4[6] = off_10008A540;
  v4[7] = off_10008A548;
  v4[8] = off_10008A550;
  v4[9] = off_10008A558;
  v4[10] = off_10008A560;
  v4[11] = off_10008A568;
  v4[12] = off_10008A570;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 13));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_10008ABD0;
  qword_10008ABD0 = v2;

}

void sub_100024BF0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "handleID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kt_hexString"));
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "got announce %{public}@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setGotAnnounceData:", *(_QWORD *)(a1 + 40));
  if ((int)objc_msgSend(*(id *)(a1 + 32), "beforeRatelimit") < 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recvRatelimit"));
    objc_msgSend(v5, "trigger");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setBeforeRatelimit:", objc_msgSend(*(id *)(a1 + 32), "beforeRatelimit") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
    objc_msgSend(v5, "_onqueueHandleFlag:", off_10008A4D0);
  }

}

void sub_100024FAC(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotCommitData:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A4D8);

}

void sub_1000251B8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotReplyBData:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A4E0);

}

void sub_1000253E4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotRevealData:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A4E8);

}

void sub_1000255F8(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotConfirmData:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A4F0);

}

void sub_100025758(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotSelected:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A508);

}

void sub_100025AD4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setGotTeardown:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateMachine"));
  objc_msgSend(v2, "_onqueueHandleFlag:", off_10008A4F8);

}

void sub_100026B14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __CFString *v20;
  NSObject *v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "myPublicInfo"));

  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000505D0();
    goto LABEL_12;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gotAnnounceData"));

  v7 = *(void **)(a1 + 32);
  if (!v6)
  {
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000505FC();
LABEL_12:

    goto LABEL_15;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotAnnounceData"));
  v9 = objc_msgSend(v7, "validateAnnounce:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerSessionID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerAnnounce"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionId"));
    v13 = objc_msgSend(v10, "isEqual:", v12);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerAnnounce"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionId"));
    objc_msgSend(*(id *)(a1 + 32), "setPeerSessionID:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerAnnounce"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "peerSessionId"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localSessionID"));
    v19 = objc_msgSend(v17, "isEqual:", v18);

    if ((v19 & 1) != 0)
    {
      if ((v13 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "sendAnnounce");
      objc_msgSend(*(id *)(a1 + 32), "updateState");
      v20 = off_10008A528;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sendAnnounce");
      v20 = off_10008A520;
    }
    objc_msgSend(v3, "setNextState:", v20);
  }
LABEL_15:

}

void sub_100026D00(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerAnnounce"));

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerAnnounce"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localSessionID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
    v9 = +[KTIDSSessionHandler compareLocalSessionID:remoteSessionID:](KTIDSSessionHandler, "compareLocalSessionID:remoteSessionID:", v7, v8);

    switch(v9)
    {
      case 0:
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localSessionID"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "kt_hexString"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "kt_hexString"));
          v42 = 141558786;
          v43 = 1752392040;
          v44 = 2112;
          v45 = v27;
          v46 = 2114;
          v47 = v29;
          v48 = 2114;
          v49 = v31;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "ktAnnounce picking session from me %{mask.hash}@ negotiated: %{public}@ peer %{public}@", (uint8_t *)&v42, 0x2Au);

        }
        v32 = objc_alloc((Class)KTVaudenaySAS);
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "myPublicInfo"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(+[KTVaudenaySASConfiguration sha256Transparency](KTVaudenaySASConfiguration, "sha256Transparency"));
        v35 = objc_msgSend(v32, "initInitiatorWithPublic:configuration:", v33, v34);
        objc_msgSend(*(id *)(a1 + 32), "setSas:", v35);

        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localSessionID"));
        objc_msgSend(*(id *)(a1 + 32), "setNegotiatedSessionID:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v37));
        objc_msgSend(*(id *)(a1 + 32), "setPeerSessionID:", v38);

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "negotiatedSessionID"));
        objc_msgSend(v39, "negotiatedSessionID:forMailbox:", v40, *(_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 32), "sendCommitA");
        objc_msgSend(v3, "setNextState:", off_10008A538);
        goto LABEL_17;
      case 2:
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
          v42 = 141558274;
          v43 = 1752392040;
          v44 = 2112;
          v45 = v41;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "ktAnnounce invalid session %{mask.hash}@", (uint8_t *)&v42, 0x16u);

        }
        break;
      case 1:
        v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peer"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "kt_hexString"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "localSessionID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_hexString"));
          v42 = 141558786;
          v43 = 1752392040;
          v44 = 2112;
          v45 = v11;
          v46 = 2114;
          v47 = v13;
          v48 = 2114;
          v49 = v15;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ktAnnounce picking session from peer %{mask.hash}@ negotiated: %{public}@ local: %{public}@", (uint8_t *)&v42, 0x2Au);

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](NSData, "dataWithData:", v16));
        objc_msgSend(*(id *)(a1 + 32), "setPeerSessionID:", v17);

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "peerSessionID"));
        objc_msgSend(*(id *)(a1 + 32), "setNegotiatedSessionID:", v18);

        v19 = objc_claimAutoreleasedReturnValue(+[KTVaudenaySASConfiguration sha256Transparency](KTVaudenaySASConfiguration, "sha256Transparency"));
        v20 = objc_alloc((Class)KTVaudenaySAS);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "myPublicInfo"));
        v22 = objc_msgSend(v20, "initAcceptorWithPublic:configuration:", v21, v19);
        objc_msgSend(*(id *)(a1 + 32), "setSas:", v22);

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "session"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "negotiatedSessionID"));
        objc_msgSend(v23, "negotiatedSessionID:forMailbox:", v24, *(_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 32), "sendSelected");
        objc_msgSend(v3, "setNextState:", off_10008A530);
        break;
      default:
LABEL_17:

        goto LABEL_18;
    }

    goto LABEL_17;
  }
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "log"));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    sub_100050628();

  objc_msgSend(v3, "setNextState:", off_10008A568);
LABEL_18:

}

void sub_10002728C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  NSObject *v22;
  id v23;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gotCommitData"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotCommitData"));
      v23 = 0;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASCommit, "parseFromData:error:", v7, &v23));
      v9 = v23;

      if (v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicInfo"));
        v11 = objc_msgSend(v10, "length");

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aCommitRandom"));
          v13 = objc_msgSend(v12, "length");

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicInfo"));
            objc_msgSend(*(id *)(a1 + 32), "setPeerPublicInfo:", v14);

            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicInfo"));
            objc_msgSend(v15, "setPeerPublic:", v16);

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "aCommitRandom"));
            objc_msgSend(v17, "setInitiatorUndisclosedRandom:", v18);

            objc_msgSend(*(id *)(a1 + 32), "sendSetupB");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intendedState"));
            objc_msgSend(v3, "setNextState:", v19);

LABEL_20:
            goto LABEL_21;
          }
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_100050738();
        }
        else
        {
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            sub_10005070C();
        }

        v21 = off_10008A560;
      }
      else
      {
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          sub_1000506AC();

        objc_msgSend(*(id *)(a1 + 32), "setGotCommitData:", 0);
        v21 = off_10008A540;
      }
      objc_msgSend(v3, "setNextState:", v21);
      goto LABEL_20;
    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100050680();
  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100050654();
  }
LABEL_21:

}

void sub_100027538(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
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

  v3 = a2;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
  if (v4
    && (v5 = (void *)v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotReplyBData")),
        v6,
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotReplyBData"));
    v22 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASSetupB, "parseFromData:error:", v7, &v22));
    v9 = v22;

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionId"));
    v12 = objc_msgSend(v10, "matchSession:op:", v11, CFSTR("replyB"));

    v13 = *(void **)(a1 + 32);
    if ((v12 & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerSessionId"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "matchPeerSessionID:op:", v14, CFSTR("replyB")));

      if (v15)
      {
        objc_msgSend(v3, "setNextState:", v15);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicInfo"));
        objc_msgSend(*(id *)(a1 + 32), "setPeerPublicInfo:", v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicInfo"));
        objc_msgSend(v17, "setPeerPublic:", v18);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bRandom"));
        objc_msgSend(v19, "setPeerRandom:", v20);

        objc_msgSend(*(id *)(a1 + 32), "sendRevealA");
        objc_msgSend(*(id *)(a1 + 32), "sendConfirm");
        objc_msgSend(*(id *)(a1 + 32), "updateState");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intendedState"));
        objc_msgSend(v3, "setNextState:", v21);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setGotReplyBData:", 0);
      objc_msgSend(v3, "setNextState:", off_10008A538);
    }

  }
  else
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100050764();
  }

}

void sub_100027784(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotRevealData"));
    v23 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASReveal, "parseFromData:error:", v5, &v23));
    v7 = v23;

    v8 = *(void **)(a1 + 32);
    if (!v6)
    {
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000507BC();

      objc_msgSend(v3, "setError:", v7);
      goto LABEL_19;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sessionId"));
    v10 = objc_msgSend(v8, "matchSession:op:", v9, CFSTR("DiscloseA"));

    v11 = *(void **)(a1 + 32);
    if ((v10 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setGotRevealData:", 0);
      objc_msgSend(v3, "setNextState:", off_10008A540);
LABEL_19:

      goto LABEL_20;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerSessionId"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "matchPeerSessionID:op:", v12, CFSTR("DiscloseA")));

    if (v13)
    {
      v14 = v3;
      v15 = v13;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sas"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aRandom"));
      v19 = objc_msgSend(v17, "setPeerRandom:", v18);

      v20 = *(void **)(a1 + 32);
      if ((v19 & 1) != 0)
      {
        objc_msgSend(v20, "sendConfirm");
        objc_msgSend(*(id *)(a1 + 32), "updateState");
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intendedState"));
        objc_msgSend(v3, "setNextState:", v21);

LABEL_18:
        goto LABEL_19;
      }
      v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "log"));
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_1000507E8();

      v15 = off_10008A568;
      v14 = v3;
    }
    objc_msgSend(v14, "setNextState:", v15);
    goto LABEL_18;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100050790();
LABEL_20:

}

void sub_1000279DC(uint64_t a1, void *a2)
{
  id v3;
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

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "gotConfirmData"));
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyGPBMessage parseFromData:error:](SASConfirm, "parseFromData:error:", v4, &v13));
  v6 = v13;

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sessionId"));
  LOBYTE(v7) = objc_msgSend(v7, "matchSession:op:", v8, CFSTR("confirm"));

  v9 = *(void **)(a1 + 32);
  if ((v7 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "peerSessionId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "matchPeerSessionID:op:", v10, CFSTR("confirm")));

    if (v11)
    {
      objc_msgSend(v3, "setNextState:", v11);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intendedState"));
      objc_msgSend(v3, "setNextState:", v12);

    }
  }
  else
  {
    objc_msgSend(v9, "setGotConfirmData:", 0);
    objc_msgSend(v3, "setNextState:", off_10008A548);
  }

}

void sub_10002872C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002873C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100028954(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028AD8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_100028BE8(id a1, id a2, unint64_t a3, BOOL *a4)
{
  return objc_msgSend(a2, "isFinished", a3, a4) ^ 1;
}

void sub_100028EDC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100028EF8(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dependencies", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(WeakRetained, "removeDependency:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6));
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

_QWORD *sub_10002904C(objc_class *a1, uint64_t a2, void *a3)
{
  _QWORD *v5;

  v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL sub_10002908C(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

id sub_10002909C(_QWORD *a1)
{
  id result;
  _QWORD *v3;

  result = (id)a1[4];
  if (result)
  {
    v3 = (_QWORD *)a1[5];
    if (v3)
      return (id)sub_100012318((uint64_t)result, v3, a1);
    else
      return objc_msgSend(result, "setExtension:value:", a1[6]);
  }
  return result;
}

id sub_1000290C4(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  int *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(a1, a2), "descriptor") + 1);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "fieldType") == 1 && sub_100011D2C((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4)
            v10 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
          else
            v10 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
          *(_QWORD *)(a2 + *v10) = 0;
          return sub_10002909C(a1);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

id sub_10002922C(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  int *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(a1, a2), "descriptor") + 1);
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "fieldType") == 2 && sub_100011D2C((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (objc_msgSend(v9, "mapKeyDataType") == 14
            && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
          {
            v10 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
          }
          else
          {
            v10 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
          }
          *(_QWORD *)(a2 + *v10) = 0;
          return sub_10002909C(a1);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

void sub_1000293A8(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_QWORD *)(a1 + 32) = 0;

      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
  }
}

NSError *sub_100029654(void *a1)
{
  NSError *result;
  id v3;
  NSDictionary *v4;
  const __CFString *v5;
  id v6;

  if (!objc_msgSend(objc_msgSend(a1, "name"), "isEqual:", CFSTR("TransparencyGPBCodedInputStreamException"))|| (result = (NSError *)objc_msgSend(objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", CFSTR("TransparencyGPBCodedInputStreamUnderlyingErrorKey"))) == 0)
  {
    v3 = objc_msgSend(a1, "reason");
    if (objc_msgSend(v3, "length"))
    {
      v5 = CFSTR("Reason");
      v6 = v3;
      v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    }
    else
    {
      v4 = 0;
    }
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyGPBMessageErrorDomain"), -100, v4);
  }
  return result;
}

void sub_100029C00(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = objc_msgSend(a3, "copyWithZone:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, a2);

}

NSMutableDictionary *sub_100029CCC(void *a1, uint64_t a2)
{
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  NSMutableDictionary *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  if (!objc_msgSend(a1, "count"))
    return 0;
  v4 = -[NSMutableDictionary initWithCapacity:](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a2), "initWithCapacity:", objc_msgSend(a1, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v21 = *(_QWORD *)v29;
    v22 = v4;
    do
    {
      v8 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(a1);
        v9 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend(a1, "objectForKey:", v9);
        v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if (objc_msgSend(v9, "isRepeated"))
        {
          if (v11 > 1)
          {
            v18 = objc_msgSend(v10, "mutableCopyWithZone:", a2);
            goto LABEL_20;
          }
          v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v25 != v15)
                  objc_enumerationMutation(v10);
                v17 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "copyWithZone:", a2);
                objc_msgSend(v12, "addObject:", v17);

              }
              v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v14);
          }
          v4 = v22;
          -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v12, v9);

          v7 = v21;
          v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            v18 = objc_msgSend(v10, "copyWithZone:", a2);
LABEL_20:
            v19 = v18;
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v18, v9);

            goto LABEL_22;
          }
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v9);
        }
LABEL_22:
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }
  return v4;
}

_QWORD *sub_10002A2C0(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  _QWORD *v6;
  unint64_t v7;

  v4 = a2[1];
  if (*(unsigned __int8 *)(v4 + 30) - 15 >= 2)
  {
    if (sub_100012214(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16)))
      return *(_QWORD **)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
    else
      return objc_msgSend(a2, "defaultValue");
  }
  else
  {
    v5 = (unint64_t *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(v4 + 24));
    v6 = (_QWORD *)atomic_load(v5);
    if (!v6)
    {
      v6 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      v6[4] = a1;
      v6[5] = a2;
      while (1)
      {
        v7 = __ldaxr(v5);
        if (v7)
          break;
        if (!__stlxr((unint64_t)v6, v5))
          return v6;
      }
      __clrex();
      sub_1000293A8((uint64_t)v6);

      return (_QWORD *)v7;
    }
  }
  return v6;
}

void sub_10002A6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10002A6C8(_QWORD *result, _QWORD *a2, void *a3, _BYTE *a4)
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    v6 = result;
    if (objc_msgSend(a2, "isRepeated"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (!result)
        return result;
      v7 = result;
      v8 = *(_QWORD *)v11;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "isInitialized");
        if (!(_DWORD)result)
          break;
        if (v7 == (id)++v9)
        {
          result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          v7 = result;
          if (result)
            goto LABEL_5;
          return result;
        }
      }
    }
    else
    {
      result = objc_msgSend(a3, "isInitialized");
      if ((result & 1) != 0)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(v6[4] + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10002B698(uint64_t a1, void *a2)
{
  uint64_t result;
  id v5;
  uint64_t v6;

  result = objc_opt_isKindOfClass(a1, objc_msgSend(a2, "containingMessageClass"));
  if ((result & 1) == 0)
  {
    v5 = objc_msgSend(a2, "singletonName");
    return (uint64_t)+[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Extension %@ used on wrong class (%@ instead of %@)"), v5, objc_opt_class(a1, v6), objc_msgSend(a2, "containingMessageClass"));
  }
  return result;
}

void sub_10002BF78(_QWORD *a1, int a2, uint64_t *a3, uint64_t a4, _QWORD *a5)
{
  int v9;
  unint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  id v14;
  const __CFString *v15;
  const __CFString *v16;
  __CFString *v17;
  __CFString *v18;

  if (a2)
  {
    v9 = sub_1000346F8(a3 + 1);
    v10 = sub_100034B58((uint64_t)(a3 + 1), v9);
    while (sub_100034BA8((uint64_t)(a3 + 1)))
    {
      v11 = sub_10002F5DC(a1, a5, a3, a4, 0);
      if (v11)
      {
        v12 = (__CFString *)v11;
        objc_msgSend(a5, "addExtension:value:", a1, v11);

      }
    }
    sub_100034BA0((uint64_t)(a3 + 1), v10);
  }
  else
  {
    v13 = a1[1];
    if ((*(_BYTE *)(v13 + 45) & 1) != 0)
    {
      v15 = sub_10002F5DC(a1, a5, a3, a4, 0);
      if (v15)
      {
        v17 = (__CFString *)v15;
        objc_msgSend(a5, "addExtension:value:", a1, v15);

      }
    }
    else
    {
      if (*(unsigned __int8 *)(v13 + 44) - 15 > 1)
        v14 = 0;
      else
        v14 = objc_msgSend(a5, "getExistingExtension:", a1);
      v16 = sub_10002F5DC(a1, a5, a3, a4, v14);
      if (v16)
      {
        v18 = (__CFString *)v16;
        objc_msgSend(a5, "setExtension:value:", a1, v16);

      }
    }
  }
}

uint64_t sub_10002C11C(_QWORD *a1)
{
  uint64_t result;

  result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(TransparencyGPBUnknownFieldSet);
    sub_10002909C(a1);
    return a1[1];
  }
  return result;
}

uint64_t sub_10002C814(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t *v6;
  void *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;

  v5 = *(unsigned __int8 *)(a2[1] + 30);
  v6 = (uint64_t *)(a3 + 8);
  v7 = sub_10002D360((uint64_t)a1, a2);
  v8 = sub_1000346F8(v6);
  v9 = sub_100034B58((uint64_t)v6, v8);
  while (sub_100034BA8((uint64_t)v6))
  {
    switch(v5)
    {
      case 0:
        v10 = sub_1000347BC(v6);
        goto LABEL_16;
      case 1:
      case 2:
        v10 = sub_100034744(v6);
        goto LABEL_16;
      case 3:
        *(float *)&v12 = sub_100034638(v6);
        objc_msgSend(v7, "addValue:", v12);
        break;
      case 4:
      case 5:
        v10 = sub_10003470C(v6);
        goto LABEL_16;
      case 6:
        objc_msgSend(v7, "addValue:", sub_100034600(v6));
        break;
      case 7:
      case 11:
        v10 = sub_1000346F8(v6);
        goto LABEL_16;
      case 8:
      case 12:
        v10 = sub_100034670(v6);
        goto LABEL_16;
      case 9:
        v10 = sub_10003477C(v6);
        goto LABEL_16;
      case 10:
        v10 = sub_10003479C(v6);
LABEL_16:
        objc_msgSend(v7, "addValue:", v10);
        break;
      case 17:
        v11 = sub_1000346F8(v6);
        if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && !objc_msgSend(a2, "isValidEnumValue:", v11))
          objc_msgSend((id)sub_10002C11C(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), v11);
        else
          objc_msgSend(v7, "addRawValue:", v11);
        break;
      default:
        break;
    }
  }
  return sub_100034BA0((uint64_t)v6, v9);
}

void sub_10002C9F8(_QWORD *a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  void *v8;
  uint64_t *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;

  v8 = sub_10002D360((uint64_t)a1, a2);
  v9 = a3 + 1;
  switch(*(_BYTE *)(a2[1] + 30))
  {
    case 0:
      sub_1000347BC(v9);
      goto LABEL_20;
    case 1:
    case 2:
      sub_100034744(v9);
      goto LABEL_20;
    case 3:
      *(float *)&v10 = sub_100034638(v9);
      v11 = v8;
      goto LABEL_5;
    case 4:
    case 5:
      sub_10003470C(v9);
      goto LABEL_20;
    case 6:
      v10 = sub_100034600(v9);
      v11 = v8;
      goto LABEL_5;
    case 7:
    case 0xB:
      sub_1000346F8(v9);
      goto LABEL_20;
    case 8:
    case 0xC:
      sub_100034670(v9);
      goto LABEL_20;
    case 9:
      sub_10003477C(v9);
      goto LABEL_20;
    case 0xA:
      sub_10003479C(v9);
LABEL_20:
      v11 = v8;
LABEL_5:
      objc_msgSend(v11, "addValue:", v10);
      return;
    case 0xD:
      v12 = sub_100034A6C(v9);
      goto LABEL_22;
    case 0xE:
      v12 = (void *)sub_100034980(v9);
LABEL_22:
      v14 = v12;
      v16 = v12;
      v13 = v8;
      goto LABEL_23;
    case 0xF:
      v16 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a3, "readMessage:extensionRegistry:", v16, a4);
      goto LABEL_14;
    case 0x10:
      v16 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(a2[1] + 16), v16, a4);
LABEL_14:
      v13 = v8;
      v14 = v16;
LABEL_23:
      objc_msgSend(v13, "addObject:", v14);

      break;
    case 0x11:
      v15 = sub_1000346F8(v9);
      if ((*(_WORD *)(a2[1] + 28) & 0x1000) != 0 && !objc_msgSend(a2, "isValidEnumValue:", v15))
        objc_msgSend((id)sub_10002C11C(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), v15);
      else
        objc_msgSend(v8, "addRawValue:", v15);
      break;
    default:
      return;
  }
}

void *sub_10002CC84(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = (void *)sub_100011D2C(a1, (uint64_t)a2);
  if (!v4)
  {
    v4 = sub_10002F9A8(a2, 0);
    sub_100012348(a1, a2, v4);
  }
  return v4;
}

void *sub_10002D360(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = (void *)sub_100011D2C(a1, (uint64_t)a2);
  if (!v4)
  {
    v4 = sub_10002FDF8(a2, 0);
    sub_100012348(a1, a2, v4);
  }
  return v4;
}

void sub_10002E44C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002E4D4(uint64_t a1)
{
  uint64_t result;

  result = sub_1000198B8();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E50C(uint64_t a1)
{
  uint64_t result;

  result = sub_10001857C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E544(uint64_t a1)
{
  uint64_t result;

  result = sub_10001857C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E57C(uint64_t a1)
{
  uint64_t result;

  result = sub_10001857C();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E5B0(uint64_t a1)
{
  uint64_t result;

  result = sub_1000183E8();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E5E8(uint64_t a1)
{
  uint64_t result;

  result = sub_1000183E8();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E620(uint64_t a1)
{
  uint64_t result;

  result = sub_1000183E8();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E654(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = sub_100018ABC(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E68C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_100018730(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E6C4(uint64_t a1, int a2)
{
  uint64_t result;

  result = sub_1000191F8(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E6FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1000193F0(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E734(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = sub_100018CC8(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E76C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_100018730(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10002E7A4(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = sub_100018ABC(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

BOOL sub_10002F250(uint64_t a1, uint64_t a2)
{
  return sub_100012214(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void sub_10002F260(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;

  if (a3)
  {
    v5 = objc_opt_class(a2, a2);
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@: %@ can only be set to NO (to clear field)."), v5, NSStringFromSelector(*(SEL *)(*(_QWORD *)(a1 + 32) + 48)));
  }
  sub_100011FA4(a2, *(_QWORD *)(a1 + 32));
}

uint64_t sub_10002F2F4(uint64_t a1, uint64_t a2)
{
  return sub_100012260(a2, *(_DWORD *)(a1 + 32));
}

TransparencyGPBAutocreatedArray *sub_10002F304(uint64_t a1, objc_class *a2)
{
  _QWORD *v2;
  unint64_t *v3;
  TransparencyGPBAutocreatedArray *result;
  unint64_t v5;
  int *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (unint64_t *)(*((_QWORD *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  result = (TransparencyGPBAutocreatedArray *)atomic_load(v3);
  if (!result)
  {
    result = sub_10002FDF8(v2, a2);
    while (1)
    {
      v5 = __ldaxr(v3);
      if (v5)
        break;
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();
    if (*(unsigned __int8 *)(v2[1] + 30) - 13 >= 4)
      v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
    else
      v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
    *(Class *)((char *)&result->super.super.super.isa + *v6) = 0;

    return (TransparencyGPBAutocreatedArray *)v5;
  }
  return result;
}

TransparencyGPBAutocreatedDictionary *sub_10002F3B4(uint64_t a1, objc_class *a2)
{
  _QWORD *v2;
  unint64_t *v3;
  TransparencyGPBAutocreatedDictionary *v4;
  TransparencyGPBAutocreatedDictionary *v5;
  unint64_t v6;
  int *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (unint64_t *)(*((_QWORD *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  v4 = (TransparencyGPBAutocreatedDictionary *)atomic_load(v3);
  if (!v4)
  {
    v5 = sub_10002F9A8(*(_QWORD **)(a1 + 32), a2);
    v4 = v5;
    while (1)
    {
      v6 = __ldaxr(v3);
      if (v6)
        break;
      if (!__stlxr((unint64_t)v5, v3))
        return v4;
    }
    __clrex();
    if (objc_msgSend(v2, "mapKeyDataType") == 14
      && *(unsigned __int8 *)(v2[1] + 30) - 13 < 4)
    {
      v7 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
    }
    else
    {
      v7 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
    }
    *(Class *)((char *)&v4->super.super.super.isa + *v7) = 0;

    return (TransparencyGPBAutocreatedDictionary *)v6;
  }
  return v4;
}

uint64_t sub_10002F488(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100012318(a2, *(_QWORD **)(a1 + 32), a3);
}

id sub_10002F498(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)sub_100011D2C(a2, *(_QWORD *)(a1 + 32)), "count");
}

const __CFString *sub_10002F5DC(_QWORD *a1, _QWORD *a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v5;
  uint64_t *v8;
  id v10;
  id v11;
  _BOOL8 v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v31;

  v5 = a1[1];
  v8 = a3 + 1;
  switch(*(_BYTE *)(v5 + 44))
  {
    case 0:
      v11 = objc_alloc((Class)NSNumber);
      v12 = sub_1000347BC(v8);
      return (const __CFString *)objc_msgSend(v11, "initWithBool:", v12);
    case 1:
      v13 = objc_alloc((Class)NSNumber);
      v14 = sub_100034744(v8);
      return (const __CFString *)objc_msgSend(v13, "initWithUnsignedInt:", v14);
    case 2:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_100034744(v8);
      goto LABEL_11;
    case 3:
      v17 = objc_alloc((Class)NSNumber);
      sub_100034638(v8);
      return (const __CFString *)objc_msgSend(v17, "initWithFloat:", v31);
    case 4:
      v18 = objc_alloc((Class)NSNumber);
      v19 = sub_10003470C(v8);
      return (const __CFString *)objc_msgSend(v18, "initWithUnsignedLongLong:", v19);
    case 5:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_10003470C(v8);
      return (const __CFString *)objc_msgSend(v25, "initWithLongLong:", v26);
    case 6:
      v27 = objc_alloc((Class)NSNumber);
      sub_100034600(v8);
      return (const __CFString *)objc_msgSend(v27, "initWithDouble:", v29);
    case 7:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_1000346F8(v8);
      goto LABEL_11;
    case 8:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_100034670(v8);
      return (const __CFString *)objc_msgSend(v25, "initWithLongLong:", v26);
    case 9:
      v15 = objc_alloc((Class)NSNumber);
      v16 = sub_10003477C(v8);
LABEL_11:
      v20 = v16;
      v21 = v15;
      return (const __CFString *)objc_msgSend(v21, "initWithInt:", v20);
    case 0xA:
      v25 = objc_alloc((Class)NSNumber);
      v26 = sub_10003479C(v8);
      return (const __CFString *)objc_msgSend(v25, "initWithLongLong:", v26);
    case 0xB:
      v13 = objc_alloc((Class)NSNumber);
      v14 = sub_1000346F8(v8);
      return (const __CFString *)objc_msgSend(v13, "initWithUnsignedInt:", v14);
    case 0xC:
      v18 = objc_alloc((Class)NSNumber);
      v19 = sub_100034670(v8);
      return (const __CFString *)objc_msgSend(v18, "initWithUnsignedLongLong:", v19);
    case 0xD:
      return (const __CFString *)sub_100034A6C(a3 + 1);
    case 0xE:
      return sub_100034980(a3 + 1);
    case 0xF:
    case 0x10:
      if (a5)
        v10 = a5;
      else
        v10 = objc_alloc_init((Class)objc_msgSend(objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass"));
      v28 = v10;
      if (*(_BYTE *)(v5 + 44) == 16)
      {
        objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v5 + 40), v10, a4);
      }
      else if ((*(_BYTE *)(v5 + 45) & 4) != 0)
      {
        objc_msgSend(v10, "mergeFromCodedInputStream:extensionRegistry:", a3, a4);
      }
      else
      {
        objc_msgSend(a3, "readMessage:extensionRegistry:", v10, a4);
      }
      return (const __CFString *)v28;
    case 0x11:
      v23 = sub_1000346F8(a3 + 1);
      v24 = objc_msgSend(a1, "enumDescriptor");
      if (objc_msgSend(v24, "isClosed")
        && !((unsigned int (*)(uint64_t))objc_msgSend(v24, "enumVerifier"))(v23))
      {
        objc_msgSend((id)sub_10002C11C(a2), "mergeVarintField:value:", *(unsigned int *)(a1[1] + 40), v23);
        return 0;
      }
      else
      {
        v21 = objc_alloc((Class)NSNumber);
        v20 = v23;
        return (const __CFString *)objc_msgSend(v21, "initWithInt:", v20);
      }
    default:
      return 0;
  }
}

TransparencyGPBAutocreatedDictionary *sub_10002F9A8(_QWORD *a1, objc_class *a2)
{
  unsigned int v4;
  TransparencyGPBAutocreatedDictionary *result;
  int v6;
  __objc2_class *v7;
  __objc2_class *v8;
  int *v9;

  v4 = objc_msgSend(a1, "mapKeyDataType");
  result = 0;
  v6 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBBoolBoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBBoolUInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBBoolInt32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBBoolFloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBBoolUInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBBoolInt64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBBoolDoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBBoolObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBBoolEnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 1u:
    case 0xBu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBUInt32BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBUInt32UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBUInt32Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBUInt32FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBUInt32UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBUInt32Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBUInt32DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBUInt32ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBUInt32EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 2u:
    case 7u:
    case 9u:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBInt32BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBInt32UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBInt32Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBInt32FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBInt32UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBInt32Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBInt32DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBInt32ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBInt32EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      return result;
    case 4u:
    case 0xCu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBUInt64BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBUInt64UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBUInt64Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBUInt64FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBUInt64UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBUInt64Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBUInt64DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBUInt64ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBUInt64EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 5u:
    case 8u:
    case 0xAu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBInt64BoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBInt64UInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBInt64Int32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBInt64FloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBInt64UInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBInt64Int64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBInt64DoubleDictionary;
          goto LABEL_63;
        case 0xD:
        case 0xE:
        case 0xF:
          v7 = TransparencyGPBInt64ObjectDictionary;
          goto LABEL_63;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBInt64EnumDictionary;
          goto LABEL_72;
        default:
          goto LABEL_64;
      }
    case 0xEu:
      result = 0;
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v7 = TransparencyGPBStringBoolDictionary;
          goto LABEL_63;
        case 1:
        case 0xB:
          v7 = TransparencyGPBStringUInt32Dictionary;
          goto LABEL_63;
        case 2:
        case 7:
        case 9:
          v7 = TransparencyGPBStringInt32Dictionary;
          goto LABEL_63;
        case 3:
          v7 = TransparencyGPBStringFloatDictionary;
          goto LABEL_63;
        case 4:
        case 0xC:
          v7 = TransparencyGPBStringUInt64Dictionary;
          goto LABEL_63;
        case 5:
        case 8:
        case 0xA:
          v7 = TransparencyGPBStringInt64Dictionary;
          goto LABEL_63;
        case 6:
          v7 = TransparencyGPBStringDoubleDictionary;
LABEL_63:
          result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init(v7);
          goto LABEL_64;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            result = objc_alloc_init(TransparencyGPBAutocreatedDictionary);
            goto LABEL_67;
          }
          result = (TransparencyGPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          return result;
        case 0x11:
          v8 = TransparencyGPBStringEnumDictionary;
LABEL_72:
          result = (TransparencyGPBAutocreatedDictionary *)objc_msgSend([v8 alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
          if (a2)
            goto LABEL_65;
          return result;
        default:
          goto LABEL_64;
      }
      break;
    default:
LABEL_64:
      if (a2)
      {
LABEL_65:
        if (v4 == 14 && (v6 - 13) <= 3)
LABEL_67:
          v9 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
        else
          v9 = &OBJC_IVAR___TransparencyGPBInt32Int32Dictionary__autocreator;
        *(Class *)((char *)&result->super.super.super.isa + *v9) = a2;
      }
      break;
  }
  return result;
}

TransparencyGPBAutocreatedArray *sub_10002FDF8(_QWORD *a1, objc_class *a2)
{
  int v3;
  TransparencyGPBAutocreatedArray *result;
  __objc2_class *v5;
  int *v6;

  v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(_BYTE *)(a1[1] + 30))
  {
    case 0:
      v5 = TransparencyGPBBoolArray;
      goto LABEL_14;
    case 1:
    case 0xB:
      v5 = TransparencyGPBUInt32Array;
      goto LABEL_14;
    case 2:
    case 7:
    case 9:
      v5 = TransparencyGPBInt32Array;
      goto LABEL_14;
    case 3:
      v5 = TransparencyGPBFloatArray;
      goto LABEL_14;
    case 4:
    case 0xC:
      v5 = TransparencyGPBUInt64Array;
      goto LABEL_14;
    case 5:
    case 8:
    case 0xA:
      v5 = TransparencyGPBInt64Array;
      goto LABEL_14;
    case 6:
      v5 = TransparencyGPBDoubleArray;
LABEL_14:
      result = (TransparencyGPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2)
        goto LABEL_15;
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (!a2)
        return (TransparencyGPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      result = objc_alloc_init(TransparencyGPBAutocreatedArray);
LABEL_16:
      v6 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
LABEL_18:
      *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      return result;
    case 0x11:
      result = -[TransparencyGPBEnumArray initWithValidationFunction:]([TransparencyGPBEnumArray alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
      if (!a2)
        return result;
      goto LABEL_15;
    default:
      result = 0;
      if (!a2)
        return result;
LABEL_15:
      if ((v3 - 13) <= 3)
        goto LABEL_16;
      v6 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
      goto LABEL_18;
  }
}

BOOL sub_10002FF3C(uint64_t a1, uint64_t a2)
{
  return sub_1000127C4(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FF4C(uint64_t a1, uint64_t a2)
{
  return sub_1000125B8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FF5C(uint64_t a1, uint64_t a2)
{
  return sub_1000125B8(a2, *(_QWORD **)(a1 + 32));
}

float sub_10002FF6C(uint64_t a1, uint64_t a2)
{
  return sub_100012B10(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FF7C(uint64_t a1, uint64_t a2)
{
  return sub_1000129A8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FF8C(uint64_t a1, uint64_t a2)
{
  return sub_1000129A8(a2, *(_QWORD **)(a1 + 32));
}

double sub_10002FF9C(uint64_t a1, uint64_t a2)
{
  return sub_100012C90(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFAC(uint64_t a1, uint64_t a2)
{
  return sub_1000125B8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFBC(uint64_t a1, uint64_t a2)
{
  return sub_1000129A8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFCC(uint64_t a1, uint64_t a2)
{
  return sub_1000125B8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFDC(uint64_t a1, uint64_t a2)
{
  return sub_1000129A8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFEC(uint64_t a1, uint64_t a2)
{
  return sub_1000125B8(a2, *(_QWORD **)(a1 + 32));
}

id sub_10002FFFC(uint64_t a1, uint64_t a2)
{
  return sub_1000129A8(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_10003000C(uint64_t a1, uint64_t a2)
{
  return sub_10002A2C0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_10003001C(uint64_t a1, uint64_t a2)
{
  return sub_10002A2C0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_10003002C(uint64_t a1, uint64_t a2)
{
  return sub_10002A2C0(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_10003003C(uint64_t a1, uint64_t a2)
{
  return sub_10002A2C0(a2, *(_QWORD **)(a1 + 32));
}

uint64_t sub_10003004C(uint64_t a1, uint64_t a2)
{
  return sub_10001255C(a2, *(_QWORD **)(a1 + 32));
}

id sub_10003005C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_100012878(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003006C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000126D8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003007C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000126D8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003008C(uint64_t a1, _QWORD *a2, float a3)
{
  return sub_100012BA8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003009C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012A2C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300AC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012A2C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300BC(uint64_t a1, _QWORD *a2, double a3)
{
  return sub_100012D28(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300CC(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000126D8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300DC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012A2C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300EC(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000126D8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1000300FC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012A2C(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003010C(uint64_t a1, _QWORD *a2, int a3)
{
  return sub_1000126D8(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_10003011C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012A2C(a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t sub_10003012C(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100012348(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

uint64_t sub_100030160(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100012348(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

uint64_t sub_100030194(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100012318(a2, *(_QWORD **)(a1 + 32), a3);
}

uint64_t sub_1000301A4(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100012318(a2, *(_QWORD **)(a1 + 32), a3);
}

id sub_1000301B4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_100012640(a2, *(void **)(a1 + 32), a3);
}

void sub_100030204(id a1)
{
  TransparencyIDSConfigBag *v1;
  void *v2;

  v1 = objc_alloc_init(TransparencyIDSConfigBag);
  v2 = (void *)qword_10008ABF0;
  qword_10008ABF0 = (uint64_t)v1;

}

void sub_10003064C(void *key, const __CFDictionary *a2, CFDictionaryRef theDict)
{
  void *Value;
  CFMutableDictionaryRef MutableCopy;

  Value = (void *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_1000306D8, Value);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
    CFDictionarySetValue(theDict, key, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void sub_1000306D8(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

void sub_100030E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100030E38(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = sub_10001A578(*(_DWORD *)(a1 + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100030E70(uint64_t a1)
{
  uint64_t result;

  result = sub_10001A52C(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100030EA8(uint64_t a1)
{
  uint64_t result;

  result = sub_10001A494(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_100031348(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

id sub_100031374(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%u\n"), a2);
}

id sub_1000313A0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

unint64_t sub_1000317DC()
{
  id v1;

  if (!atomic_load(&qword_10008ABF8))
  {
    v1 = +[TransparencyGPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:flags:](TransparencyGPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", CFSTR("TransparencyGPBNullValue"), "NullValue", &unk_10006C3E4, 1, sub_100031858, 0);
    while (!__ldaxr(&qword_10008ABF8))
    {
      if (!__stlxr((unint64_t)v1, &qword_10008ABF8))
        return atomic_load(&qword_10008ABF8);
    }
    __clrex();

  }
  return atomic_load(&qword_10008ABF8);
}

BOOL sub_100031858(int a1)
{
  return a1 == 0;
}

uint64_t sub_100031958(uint64_t a1)
{
  return sub_1000127BC(a1, objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "fieldWithNumber:", 1));
}

id sub_100031990(_QWORD *a1, int a2)
{
  return sub_1000127C0(a1, (uint64_t)objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "fieldWithNumber:", 1), a2);
}

void sub_1000319D0(uint64_t a1)
{
  sub_1000120E4(a1, (id *)objc_msgSend(objc_msgSend(+[TransparencyGPBValue descriptor](TransparencyGPBValue, "descriptor"), "oneofs"), "objectAtIndex:", 0));
}

void sub_100032BD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100032C00(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "transitionOperation"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "error"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("KTResultOperationError")))
      {
LABEL_6:

        goto LABEL_7;
      }
      v6 = objc_msgSend(v4, "code");

      if (v6 == (id)3)
      {
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100032D10;
        block[3] = &unk_100070AE8;
        v10 = v8;
        v11 = v4;
        dispatch_sync(v7, block);

        v5 = v10;
        goto LABEL_6;
      }
    }
LABEL_7:

    WeakRetained = v8;
  }

}

id sub_100032D10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueuePerformTimeoutWithUnderlyingError:", *(_QWORD *)(a1 + 40));
}

void sub_100032D1C(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100032DAC;
    block[3] = &unk_100070A78;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

void sub_100032DAC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("KTResultOperationError"), 4, CFSTR("SIGTERM happened")));
  objc_msgSend(*(id *)(a1 + 32), "_onqueuePerformTimeoutWithUnderlyingError:", v2);

}

void sub_100033210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100033234(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onqueuePerformTimeoutWithUnderlyingError:", 0);

}

void sub_100034344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100034358(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_onqueuePerformTimeoutWithUnderlyingError");

}

id sub_1000344C8(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "completed");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "onqueueStartFinishOperation:", *(_QWORD *)(a1 + 40));
  return result;
}

double sub_100034600(_QWORD *a1)
{
  uint64_t v2;
  double result;

  sub_100034A10(a1, 8);
  v2 = a1[2];
  result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float sub_100034638(_QWORD *a1)
{
  uint64_t v2;
  float result;

  sub_100034A10(a1, 4);
  v2 = a1[2];
  result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_100034674(uint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = 0;
  while (v2 <= 0x3F)
  {
    sub_100034A10(a1, 1);
    v4 = *a1;
    v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(_BYTE *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0)
      return v3;
  }
  sub_10003488C(-105, CFSTR("Invalid VarInt64"));
  return 0;
}

uint64_t sub_1000346F8(uint64_t *a1)
{
  return sub_100034674(a1);
}

uint64_t sub_10003470C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_100034A10(a1, 8);
  v2 = a1[2];
  result = *(_QWORD *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t sub_100034744(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_100034A10(a1, 4);
  v2 = a1[2];
  result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t sub_10003477C(uint64_t *a1)
{
  unsigned int v1;

  v1 = sub_100034674(a1);
  return -(v1 & 1) ^ (v1 >> 1);
}

unint64_t sub_10003479C(uint64_t *a1)
{
  unint64_t v1;

  v1 = sub_100034674(a1);
  return -(uint64_t)(v1 & 1) ^ (v1 >> 1);
}

BOOL sub_1000347BC(uint64_t *a1)
{
  return sub_100034674(a1) != 0;
}

uint64_t sub_1000347D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a1 + 8) || v2 == *(_QWORD *)(a1 + 24))
  {
    v3 = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    v3 = sub_100034674((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = v3;
    if (!sub_100023748(v3))
    {
      sub_10003488C(-103, CFSTR("Invalid wireformat in tag."));
      v3 = *(unsigned int *)(a1 + 32);
    }
    if (!sub_100023740(v3))
    {
      sub_10003488C(-103, CFSTR("A zero field number on the wire is invalid."));
      return *(unsigned int *)(a1 + 32);
    }
  }
  return v3;
}

BOOL sub_100034868(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

id sub_10003488C(uint64_t a1, void *a2)
{
  NSDictionary *v4;
  const __CFString *v6;
  NSError *v7;
  const __CFString *v8;
  void *v9;

  if (objc_msgSend(a2, "length"))
  {
    v8 = CFSTR("Reason");
    v9 = a2;
    v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  }
  else
  {
    v4 = 0;
  }
  v6 = CFSTR("TransparencyGPBCodedInputStreamUnderlyingErrorKey");
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TransparencyGPBCodedInputStreamErrorDomain"), a1, v4);
  return -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("TransparencyGPBCodedInputStreamException"), a2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)), "raise");
}

const __CFString *sub_100034980(uint64_t *a1)
{
  int v2;
  const __CFString *result;

  v2 = sub_100034674(a1);
  if (!v2)
    return &stru_100072BF0;
  sub_100034A10(a1, v2);
  result = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", *a1 + a1[2], v2, 4);
  a1[2] += v2;
  if (!result)
  {
    sub_10003488C(-104, 0);
    return 0;
  }
  return result;
}

_QWORD *sub_100034A10(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = result;
  v3 = result[2] + a2;
  if (v3 > result[1])
    result = sub_10003488C(-100, 0);
  v4 = v2[3];
  if (v3 > v4)
  {
    v2[2] = v4;
    return sub_10003488C(-101, 0);
  }
  return result;
}

id sub_100034A6C(uint64_t *a1)
{
  unsigned int v2;
  id result;

  v2 = sub_100034674(a1);
  if ((v2 & 0x80000000) != 0)
    return 0;
  sub_100034A10(a1, v2);
  result = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *a1 + a1[2], v2);
  a1[2] += v2;
  return result;
}

id sub_100034AE0(uint64_t *a1)
{
  unsigned int v2;
  id result;

  v2 = sub_100034674(a1);
  if ((v2 & 0x80000000) != 0)
    return 0;
  sub_100034A10(a1, v2);
  result = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", *a1 + a1[2], v2, 0);
  a1[2] += v2;
  return result;
}

unint64_t sub_100034B58(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 16) + a2;
  if (v4 > v3)
    sub_10003488C(-102, 0);
  *(_QWORD *)(a1 + 24) = v4;
  return v3;
}

uint64_t sub_100034BA0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t sub_100034BA8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
}

_DWORD *sub_100034BB4(_DWORD *result, int a2)
{
  if (result[8] != a2)
    return sub_10003488C(-103, CFSTR("Unexpected tag read"));
  return result;
}

uint64_t sub_10003540C(void *a1, uint64_t a2)
{
  int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 30);
  v5 = objc_msgSend(a1, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a1, "objectForKeyedSubscript:", v7);
      v10 = sub_10001A6C4(1, v7);
      v11 = &v10[(_QWORD)sub_1000354EC(v9, v4)];
      v8 += (uint64_t)&v11[sub_100018CC8(v11)];
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v12 = sub_10001ABAC(*(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), 15);
  return v8 + (_QWORD)objc_msgSend(a1, "count") * v12;
}

char *sub_1000354EC(void *a1, int a2)
{
  switch(a2)
  {
    case 13:
      return sub_10001A868(2, a1);
    case 14:
      return sub_10001A6C4(2, a1);
    case 15:
      return sub_10001A7CC(2, a1);
  }
  return 0;
}

id sub_100035534(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;
  id result;
  void *v10;
  id v11;
  unsigned int v12;

  v5 = *(_QWORD *)(a3 + 8);
  v6 = *(unsigned __int8 *)(v5 + 30);
  v7 = sub_100023730(*(_DWORD *)(v5 + 16), 2);
  v8 = objc_msgSend(a2, "keyEnumerator");
  result = objc_msgSend(v8, "nextObject");
  if (result)
  {
    v10 = result;
    do
    {
      v11 = objc_msgSend(a2, "objectForKeyedSubscript:", v10);
      objc_msgSend(a1, "writeInt32NoTag:", v7);
      v12 = sub_10001A6C4(1, v10);
      objc_msgSend(a1, "writeInt32NoTag:", sub_1000354EC(v11, v6) + v12);
      objc_msgSend(a1, "writeString:value:", 1, v10);
      sub_10003561C(a1, (const char *)v11, v6);
      result = objc_msgSend(v8, "nextObject");
      v10 = result;
    }
    while (result);
  }
  return result;
}

void *sub_10003561C(void *a1, const char *a2, int a3)
{
  switch(a3)
  {
    case 13:
      return objc_msgSend(a1, "writeBytes:value:", 2, a2);
    case 14:
      return objc_msgSend(a1, "writeString:value:", 2, a2);
    case 15:
      return objc_msgSend(a1, "writeMessage:value:", 2, a2);
  }
  return a1;
}

BOOL sub_10003565C(void *a1)
{
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(a1, "objectEnumerator");
  do
  {
    v2 = objc_msgSend(v1, "nextObject");
    v3 = v2;
  }
  while (v2 && (objc_msgSend(v2, "isInitialized") & 1) != 0);
  return v3 == 0;
}

void sub_1000356A0(void *a1, uint64_t *a2, uint64_t a3, _QWORD *a4, void *a5)
{
  id v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  id *v16;
  uint64_t *v17;
  int v18;
  uint64_t v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v24;
  __CFString *v25;

  v9 = objc_msgSend(a4, "mapKeyDataType");
  v10 = *(unsigned __int8 *)(a4[1] + 30);
  v24 = 0;
  v25 = 0;
  if (v10 == 17)
    v24 = (__CFString *)objc_msgSend(a4, "defaultValue");
  v11 = sub_100023758((int)v9, 0);
  v12 = sub_100023730(1, v11);
  v13 = sub_100023758(v10, 0);
  v14 = sub_100023730(2, v13);
  while (1)
  {
    while (1)
    {
      v15 = sub_1000347D8((uint64_t)(a2 + 1));
      if ((_DWORD)v15 == v12)
      {
        v16 = (id *)&v25;
        v17 = a2;
        v18 = (int)v9;
        goto LABEL_8;
      }
      v19 = v15;
      if ((_DWORD)v15 != v14)
        break;
      v16 = (id *)&v24;
      v17 = a2;
      v18 = v10;
LABEL_8:
      sub_10003591C(v17, v16, v18, a3, a4);
    }
    if (!(_DWORD)v15)
      break;
    if ((objc_msgSend(a2, "skipField:", v15) & 1) == 0)
      goto LABEL_32;
  }
  v20 = v25;
  if ((_DWORD)v9 == 14 && !v25)
  {
    v20 = &stru_100072BF0;
    v25 = v20;
  }
  v21 = v24;
  if ((v10 - 13) > 3u || v24)
    goto LABEL_25;
  switch(v10)
  {
    case 13:
      v22 = (__CFString *)(id)sub_100011848();
LABEL_23:
      v21 = v22;
      v24 = v22;
      goto LABEL_25;
    case 15:
      v22 = (__CFString *)objc_alloc_init((Class)objc_msgSend(a4, "msgClass", v19));
      goto LABEL_23;
    case 14:
      v22 = &stru_100072BF0;
      goto LABEL_23;
  }
  v21 = 0;
LABEL_25:
  if ((_DWORD)v9 == 14 && (v10 - 13) <= 3u)
  {
    objc_msgSend(a1, "setObject:forKey:", v21, v20);
    goto LABEL_34;
  }
  if (v10 == 17
    && (*(_WORD *)(a4[1] + 28) & 0x1000) != 0
    && !objc_msgSend(a4, "isValidEnumValue:", v21))
  {
    objc_msgSend(a5, "addUnknownMapEntry:value:", *(unsigned int *)(a4[1] + 16), objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:", v21, &v25, v9));
  }
  else
  {
    objc_msgSend(a1, "setTransparencyGPBGenericValue:forTransparencyGPBGenericValueKey:", &v24, &v25);
  }
LABEL_32:
  if (((_BYTE)v9 - 13) > 3u)
    goto LABEL_35;
  v20 = v25;
LABEL_34:

LABEL_35:
  if ((v10 - 13) <= 3u)

}

void sub_10003591C(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  int v7;
  uint64_t v8;
  id v10;

  switch(a3)
  {
    case 0:
      *(_BYTE *)a2 = sub_1000347BC(a1 + 1);
      return;
    case 1:
    case 2:
      v7 = sub_100034744(a1 + 1);
      goto LABEL_15;
    case 3:
      *(float *)a2 = sub_100034638(a1 + 1);
      return;
    case 4:
    case 5:
      v8 = sub_10003470C(a1 + 1);
      goto LABEL_12;
    case 6:
      *(double *)a2 = sub_100034600(a1 + 1);
      return;
    case 7:
    case 11:
    case 17:
      v7 = sub_1000346F8(a1 + 1);
      goto LABEL_15;
    case 8:
    case 12:
      v8 = sub_100034670(a1 + 1);
      goto LABEL_12;
    case 9:
      v7 = sub_10003477C(a1 + 1);
LABEL_15:
      *(_DWORD *)a2 = v7;
      return;
    case 10:
      v8 = sub_10003479C(a1 + 1);
      goto LABEL_12;
    case 13:

      v8 = (uint64_t)sub_100034A6C(a1 + 1);
      goto LABEL_12;
    case 14:

      v8 = (uint64_t)sub_100034980(a1 + 1);
LABEL_12:
      *a2 = (id)v8;
      break;
    case 15:
      v10 = objc_alloc_init((Class)objc_msgSend(a5, "msgClass"));
      objc_msgSend(a1, "readMessage:extensionRegistry:", v10, a4);

      *a2 = v10;
      break;
    default:
      return;
  }
}

uint64_t sub_100035F44(unsigned int a1, int a2, int a3)
{
  if (a3 == 1)
    return sub_10001A52C(a2);
  if (a3 == 11)
    return sub_10001A904(a2, a1);
  return 0;
}

uint64_t sub_100036190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_100036768(unsigned int a1, int a2, int a3)
{
  switch(a3)
  {
    case 2:
      return sub_10001A52C(a2);
    case 9:
      return sub_10001A994(a2, a1);
    case 7:
      return sub_10001A5DC(a2, a1);
  }
  return 0;
}

id sub_100036904(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 2:
      return objc_msgSend(result, "writeSFixed32:value:", a3, a2);
    case 9:
      return objc_msgSend(result, "writeSInt32:value:", a3, a2);
    case 7:
      return objc_msgSend(result, "writeInt32:value:", a3, a2);
  }
  return result;
}

uint64_t sub_1000369DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_100036FAC(unint64_t a1, int a2, int a3)
{
  if (a3 == 4)
    return sub_10001A494(a2);
  if (a3 == 12)
    return sub_10001A578(a2, a1);
  return 0;
}

uint64_t sub_1000371F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_1000377C8(unint64_t a1, int a2, int a3)
{
  switch(a3)
  {
    case 5:
      return sub_10001A494(a2);
    case 10:
      return sub_10001AA2C(a2, a1);
    case 8:
      return sub_10001A578(a2, a1);
  }
  return 0;
}

id sub_100037964(id result, uint64_t a2, uint64_t a3, int a4)
{
  switch(a4)
  {
    case 5:
      return objc_msgSend(result, "writeSFixed64:value:", a3, a2);
    case 10:
      return objc_msgSend(result, "writeSInt64:value:", a3, a2);
    case 8:
      return objc_msgSend(result, "writeInt64:value:", a3, a2);
  }
  return result;
}

uint64_t sub_100037A3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1000381D4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_100038960(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_10003910C(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

BOOL sub_1000393E0(int a1)
{
  return a1 != -72499473;
}

uint64_t sub_1000399CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_10003A510(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), a3);
}

uint64_t sub_10003AC9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_10003B444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_10003BC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_10003C3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_10003CB34(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_10003D2A0(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_10003DA2C(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_10003E298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_10003EDBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), a3);
}

uint64_t sub_10003F568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_10003FD30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_100040518(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_100040CE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_100041480(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_100041C0C(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1000423B8(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_100042C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_1000437A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), a3);
}

uint64_t sub_100043F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_1000446DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_100044EA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_10004564C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_100045DCC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_100046538(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_100046CC4(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_100047530(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_100048054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), a3);
}

uint64_t sub_1000487A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_100048ECC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_100049610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_100049D34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_10004A430(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const __CFString *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v3 + 16))(v3, a2, v4);
}

uint64_t sub_10004AAF8(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_10004B204(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_10004B9E4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
}

void sub_10004FD68(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "kt_hexString"));
  v4 = 138543362;
  v5 = v2;
  sub_10000A7BC((void *)&_mh_execute_header, a1, v3, "find: no sessionID: [%{public}@]", (uint8_t *)&v4);

  sub_10000A7F0();
}

void sub_10004FDF8(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_10000A7BC((void *)&_mh_execute_header, a2, a3, "invalid sessionID: [%{public}@]", (uint8_t *)&v3);
  sub_10000A7F8();
}

void sub_10004FE60(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "kt_hexString"));
  v5 = 138543362;
  v6 = v3;
  sub_10000A7BC((void *)&_mh_execute_header, a2, v4, "delete: no sessionID: [%{public}@]", (uint8_t *)&v5);

  sub_10000A7F0();
}

void sub_10004FEEC(unsigned __int16 a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%d no peerHandle", (uint8_t *)v2, 8u);
  sub_10000A7E8();
}

void sub_10004FF60(unsigned __int16 a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3[0] = 67109634;
  v3[1] = a1;
  v4 = 2160;
  v5 = 1752392040;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%d can't convert peerHandle %{mask.hash}@", (uint8_t *)v3, 0x1Cu);
  sub_10000A7F0();
}

void sub_10004FFF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A7D8((void *)&_mh_execute_header, a1, a3, "ktRevealA: no session, reject", a5, a6, a7, a8, 0);
  sub_10000A7E8();
}

void sub_100050028()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A79C();
  sub_10000A7C8((void *)&_mh_execute_header, v0, v1, "ktTeardown: no known session, rejected, %{mask.hash}@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_100050088()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000A79C();
  sub_10000A7C8((void *)&_mh_execute_header, v0, v1, "ktTeardown: no packet, %{mask.hash}@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_1000500E8(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localSessionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peerSessionID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
  v11 = 138412802;
  v12 = v6;
  v13 = 2112;
  v14 = v8;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "ktTeardown: session didn't match: %@ vs (%@/%@)", (uint8_t *)&v11, 0x20u);

}

void sub_100050204()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002877C();
  sub_10002872C((void *)&_mh_execute_header, v0, v1, "onQueueMapMailbox unknown state: %@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_100050264(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "negotiatedSessionID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "kt_hexString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "peerSessionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kt_hexString"));
  sub_100028764();
  sub_10002873C((void *)&_mh_execute_header, v6, v7, "confirming session neg: %{public}@ (local id %{public}@)", v8, v9, v10, v11, v12);

  sub_100028750();
}

void sub_10005031C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "validateAnnounce not present", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050348()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002877C();
  sub_10002872C((void *)&_mh_execute_header, v0, v1, "validateAnnounce parse failed: %@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_1000503A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "no session id too short", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_1000503D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "announceMismatch not present", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002877C();
  sub_10002872C((void *)&_mh_execute_header, v0, v1, "announceMismatch parse failed: %@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_100050460(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localSessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "peerSessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  sub_100028764();
  sub_10002873C((void *)&_mh_execute_header, v7, v8, "announceMismatch sessionId mismatch: %{public}@ vs peer idea of self %{public}@", v9, v10, v11, v12, v13);

  sub_100028750();
}

void sub_100050518(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "peerSessionID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "kt_hexString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "sessionId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
  sub_100028764();
  sub_10002873C((void *)&_mh_execute_header, v7, v8, "announceMismatch peerSessionId mismatch: %{public}@ vs peer idea %{public}@", v9, v10, v11, v12, v13);

  sub_100028750();
}

void sub_1000505D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "announce w/o peer info", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_1000505FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "announce w/o announce", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "decide-ab have no peer announce", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "commit-a: no SAS for session", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "commit-a: commit data", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_1000506AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002877C();
  sub_10002872C((void *)&_mh_execute_header, v0, v1, "commit-a: session don't parse: %{public}@", v2, v3, v4, v5, v6);
  sub_10000A7F8();
}

void sub_10005070C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "commit-a: session length 0", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050738()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "commit-a: random length 0", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050764()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "ktSetupB: no SAS for session", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_100050790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "DiscloseA: no SAS for session", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_1000507BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "DiscloseA: parse failed", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

void sub_1000507E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100028720();
  sub_10000A7D8((void *)&_mh_execute_header, v0, v1, "ktRevealA: reveal mismatch", v2, v3, v4, v5, v6);
  sub_10000A7E8();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__onqueueContains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueContains:");
}

id objc_msgSend__onqueueHandleFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueHandleFlag:");
}

id objc_msgSend__onqueueNextStateMachineTransition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueNextStateMachineTransition");
}

id objc_msgSend__onqueueNextStateMachineTransition_flags_pendingFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueNextStateMachineTransition:flags:pendingFlags:");
}

id objc_msgSend__onqueuePerformTimeoutWithUnderlyingError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueuePerformTimeoutWithUnderlyingError");
}

id objc_msgSend__onqueuePerformTimeoutWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueuePerformTimeoutWithUnderlyingError:");
}

id objc_msgSend__onqueuePokeStateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueuePokeStateMachine");
}

id objc_msgSend__onqueueRecheckConditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueRecheckConditions");
}

id objc_msgSend__onqueueRemoveFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueRemoveFlag:");
}

id objc_msgSend__onqueueSendAnyPendingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueSendAnyPendingFlags");
}

id objc_msgSend__onqueueSetFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueSetFlag:");
}

id objc_msgSend__onqueueStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueStart");
}

id objc_msgSend__onqueueStartNextStateMachineOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueStartNextStateMachineOperation:");
}

id objc_msgSend__onqueueTimeoutError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueTimeoutError");
}

id objc_msgSend__onqueueTimerTick(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueTimerTick");
}

id objc_msgSend__onqueueTrigger_maximumDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_onqueueTrigger:maximumDelay:");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_aCommitRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aCommitRandom");
}

id objc_msgSend_aRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aRandom");
}

id objc_msgSend_accountKey_complete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountKey:complete:");
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "active");
}

id objc_msgSend_addDelegate_withDelegateProperties_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:withDelegateProperties:queue:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExecutionBlock:");
}

id objc_msgSend_addExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExtension:value:");
}

id objc_msgSend_addExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExtensions:");
}

id objc_msgSend_addField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addField:");
}

id objc_msgSend_addFixed32_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFixed32:");
}

id objc_msgSend_addFixed64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFixed64:");
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGroup:");
}

id objc_msgSend_addLengthDelimited_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLengthDelimited:");
}

id objc_msgSend_addMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addMailbox:");
}

id objc_msgSend_addNullableDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNullableDependency:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addRawEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawEntriesFromDictionary:");
}

id objc_msgSend_addRawValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValue:");
}

id objc_msgSend_addRawValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValues:count:");
}

id objc_msgSend_addRawValuesFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValuesFromArray:");
}

id objc_msgSend_addUnknownMapEntry_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUnknownMapEntry:value:");
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValue:");
}

id objc_msgSend_addValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValues:count:");
}

id objc_msgSend_addValuesFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValuesFromArray:");
}

id objc_msgSend_addVarint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addVarint:");
}

id objc_msgSend_afterOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "afterOperation");
}

id objc_msgSend_allDependentsSuccessful(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDependentsSuccessful");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allSMFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSMFlags");
}

id objc_msgSend_allSMStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSMStates");
}

id objc_msgSend_allSuccessful_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSuccessful:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocDescriptorForClass_messageName_fileDescription_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForClass_rootClass_file_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_flags_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:extraTextFormatInfo:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowPendingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowPendingFlags");
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateWireType");
}

id objc_msgSend_announceMismatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "announceMismatch");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_asPathStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asPathStep");
}

id objc_msgSend_bRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bRandom");
}

id objc_msgSend_backoff(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backoff");
}

id objc_msgSend_bag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bag");
}

id objc_msgSend_beforeRatelimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beforeRatelimit");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcValueNameOffsets");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllOperations");
}

id objc_msgSend_chain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chain");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkLastTagWas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkLastTagWas:");
}

id objc_msgSend_checkReachabilityOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkReachabilityOperation");
}

id objc_msgSend_checkUnlockOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkUnlockOperation");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_compareLocalSessionID_remoteSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compareLocalSessionID:remoteSessionID:");
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "complete");
}

id objc_msgSend_completeOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completeOperation");
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completed");
}

id objc_msgSend_completionHandlerDidRunCondition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completionHandlerDidRunCondition");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_computeSerializedSizeAsField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeSerializedSizeAsField:");
}

id objc_msgSend_conditionChecksInFlight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conditionChecksInFlight");
}

id objc_msgSend_conditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conditions");
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingMessageClass");
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingType");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsAsString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsAsString");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyFieldsInto_zone_descriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFieldsInto:zone:descriptor:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfFields");
}

id objc_msgSend_createOperationToFinishAttempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createOperationToFinishAttempt:");
}

id objc_msgSend_currentConditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConditions");
}

id objc_msgSend_currentDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDelay");
}

id objc_msgSend_currentFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentFlags");
}

id objc_msgSend_currentReachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentReachability");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataType");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_deepCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deepCopyWithZone:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultValue");
}

id objc_msgSend_deleteSessionByID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSessionByID:");
}

id objc_msgSend_deletedHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletedHandles");
}

id objc_msgSend_dependOnBeforeGroupFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependOnBeforeGroupFinished:");
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependencies");
}

id objc_msgSend_dependenciesDescriptionError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dependenciesDescriptionError");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptionError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionError");
}

id objc_msgSend_descriptionErrorCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptionErrorCode");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_destinationIDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationIDSID");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_doWatchedStateMachineRPC_sourceStates_path_transitionOp_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doWatchedStateMachineRPC:sourceStates:path:transitionOp:reply:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dumpFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpFlags");
}

id objc_msgSend_dumpState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpState:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumDescriptor");
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumVerifier");
}

id objc_msgSend_enumerateForTextFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateForTextFormat:");
}

id objc_msgSend_enumerateKeysAndBoolsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndBoolsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndDoublesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndDoublesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndFloatsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndFloatsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndInt64sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndRawValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndRawValuesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndUInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndUInt64sUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateRawValuesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRawValuesWithBlock:");
}

id objc_msgSend_enumerateValuesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateValuesWithBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:");
}

id objc_msgSend_errorWithDomain_code_description_underlying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:description:underlying:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_errorWithDomain_code_userInfo_description_underlying_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:description:underlying:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_expectedFailure(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedFailure");
}

id objc_msgSend_expire(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expire");
}

id objc_msgSend_extensionForDescriptor_fieldNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionForDescriptor:fieldNumber:");
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRanges");
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRangesCount");
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRegistry");
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsCurrentlySet");
}

id objc_msgSend_failStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failStates");
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldNumber");
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldType");
}

id objc_msgSend_fieldWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldWithNumber:");
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "file");
}

id objc_msgSend_fillInError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fillInError");
}

id objc_msgSend_findSessionByHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findSessionByHandle:");
}

id objc_msgSend_findSessionByID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findSessionByID:");
}

id objc_msgSend_finishDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDate");
}

id objc_msgSend_finishOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishOperation");
}

id objc_msgSend_finishingBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishingBlock");
}

id objc_msgSend_fireTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireTime");
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixed32List");
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixed64List");
}

id objc_msgSend_flag(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flag");
}

id objc_msgSend_flagConditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flagConditions");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_followStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "followStates");
}

id objc_msgSend_fulfill(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fulfill");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullName");
}

id objc_msgSend_futureBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "futureBlock");
}

id objc_msgSend_generateSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateSessionID");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getEnumTextFormatNameForIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnumTextFormatNameForIndex:");
}

id objc_msgSend_getExistingExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExistingExtension:");
}

id objc_msgSend_getExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExtension:");
}

id objc_msgSend_gotAnnounceData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotAnnounceData");
}

id objc_msgSend_gotCommitData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotCommitData");
}

id objc_msgSend_gotConfirmData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotConfirmData");
}

id objc_msgSend_gotReplyBData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotReplyBData");
}

id objc_msgSend_gotRevealData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotRevealData");
}

id objc_msgSend_gotSelected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gotSelected");
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupList");
}

id objc_msgSend_groupStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupStart");
}

id objc_msgSend_haltOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haltOperation");
}

id objc_msgSend_halted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "halted");
}

id objc_msgSend_handleExternalRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleExternalRequest:");
}

id objc_msgSend_handleFlag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFlag:");
}

id objc_msgSend_handleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleID");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_holdStateMachineOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdStateMachineOperation");
}

id objc_msgSend_idsHandleLookup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsHandleLookup");
}

id objc_msgSend_idsTransport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsTransport");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_init_sourceStates_serialQueue_timeout_transitionOp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:sourceStates:serialQueue:timeout:transitionOp:");
}

id objc_msgSend_initAcceptorWithPublic_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAcceptorWithPublic:configuration:");
}

id objc_msgSend_initAsSuccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initAsSuccess");
}

id objc_msgSend_initInitiatorWithPublic_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initInitiatorWithPublic:configuration:");
}

id objc_msgSend_initIntending_errorState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initIntending:errorState:");
}

id objc_msgSend_initNamed_serialQueue_path_initialRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initNamed:serialQueue:path:initialRequest:");
}

id objc_msgSend_initWithBools_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBools:forKeys:count:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClass_messageName_fileDescription_fields_storageSize_wireFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClass:messageName:fileDescription:fields:storageSize:wireFormat:");
}

id objc_msgSend_initWithCodedInputStream_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCodedInputStream:extensionRegistry:error:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:error:");
}

id objc_msgSend_initWithData_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:extensionRegistry:error:");
}

id objc_msgSend_initWithDoubles_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDoubles:forKeys:count:");
}

id objc_msgSend_initWithFieldDescription_descriptorFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFieldDescription:descriptorFlags:");
}

id objc_msgSend_initWithFloats_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFloats:forKeys:count:");
}

id objc_msgSend_initWithInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt32s:forKeys:count:");
}

id objc_msgSend_initWithInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt64s:forKeys:count:");
}

id objc_msgSend_initWithLogging_publicInfo_peerIDSID_session_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLogging:publicInfo:peerIDSID:session:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_initWithName_delay_keepProcessAlive_dependencyDescriptionCode_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:");
}

id objc_msgSend_initWithName_fields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:fields:");
}

id objc_msgSend_initWithName_initialDelay_continuingDelay_keepProcessAlive_dependencyDescriptionCode_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:");
}

id objc_msgSend_initWithName_states_flags_initialState_queue_stateEngine_lockStateTracker_reachabilityTracker_idsConfigBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:");
}

id objc_msgSend_initWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNumber:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:forKeys:count:");
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:");
}

id objc_msgSend_initWithOutputStream_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:data:");
}

id objc_msgSend_initWithPackage_objcPrefix_syntax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackage:objcPrefix:syntax:");
}

id objc_msgSend_initWithPackage_syntax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackage:syntax:");
}

id objc_msgSend_initWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:");
}

id objc_msgSend_initWithPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeer:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithQueue_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:flags:");
}

id objc_msgSend_initWithSIGTERMNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSIGTERMNotification:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_initWithState_pathStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithState:pathStep:");
}

id objc_msgSend_initWithTransport_peerName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTransport:peerName:");
}

id objc_msgSend_initWithUInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUInt32s:forKeys:count:");
}

id objc_msgSend_initWithUInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUInt64s:forKeys:count:");
}

id objc_msgSend_initWithValidationFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:");
}

id objc_msgSend_initWithValidationFunction_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:capacity:");
}

id objc_msgSend_initWithValidationFunction_rawValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:rawValues:count:");
}

id objc_msgSend_initWithValidationFunction_rawValues_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:rawValues:forKeys:count:");
}

id objc_msgSend_initWithValueArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValueArray:");
}

id objc_msgSend_initWithValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValues:count:");
}

id objc_msgSend_initialDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialDelay");
}

id objc_msgSend_initialState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialState");
}

id objc_msgSend_initiator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiator");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_intendedPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intendedPath");
}

id objc_msgSend_intendedState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intendedState");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface");
}

id objc_msgSend_internalClear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalClear:");
}

id objc_msgSend_internalResizeToCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalResizeToCapacity:");
}

id objc_msgSend_internalSuccesses(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalSuccesses");
}

id objc_msgSend_invalidateTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateTimeout");
}

id objc_msgSend_invokeIDSSupportWithBlock_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeIDSSupportWithBlock:errorHandler:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isClosed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isClosed");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isExpectedFailure_expected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExpectedFailure:expected:");
}

id objc_msgSend_isFieldTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFieldTag:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInitialized");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPackable");
}

id objc_msgSend_isPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPending");
}

id objc_msgSend_isReady(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isReady");
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRepeated");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isValidEnumValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidEnumValue:");
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWireFormat");
}

id objc_msgSend_keepProcessAlive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keepProcessAlive");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_ktAccountPublicIDWithPublicKeyInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ktAccountPublicIDWithPublicKeyInfo:error:");
}

id objc_msgSend_kt_dataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kt_dataWithHexString:");
}

id objc_msgSend_kt_hexString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kt_hexString");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastUsedAddressOfMe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUsedAddressOfMe");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthDelimitedList");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_listSessions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listSessions");
}

id objc_msgSend_liveRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveRequest");
}

id objc_msgSend_liveRequestReceived(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "liveRequestReceived");
}

id objc_msgSend_localSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localSessionID");
}

id objc_msgSend_lockStateTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockStateTracker");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_makeOperationDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeOperationDependency");
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapKeyDataType");
}

id objc_msgSend_mapMailbox(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapMailbox");
}

id objc_msgSend_mapMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapMailbox:");
}

id objc_msgSend_matchPeerSessionID_op_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchPeerSessionID:op:");
}

id objc_msgSend_matchSession_op_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchSession:op:");
}

id objc_msgSend_maximumDelay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maximumDelay");
}

id objc_msgSend_mergeDelimitedFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeDelimitedFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFieldFrom_input_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFieldFrom:input:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mergeFromCodedInputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromCodedInputStream:");
}

id objc_msgSend_mergeFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFromData_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromData:extensionRegistry:");
}

id objc_msgSend_mergeUnknownFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeUnknownFields:");
}

id objc_msgSend_mergeVarintField_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeVarintField:value:");
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageClass");
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "msgClass");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_mutableFieldForNumber_create_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableFieldForNumber:create:");
}

id objc_msgSend_mutableStateConditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableStateConditions");
}

id objc_msgSend_myPublicInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "myPublicInfo");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_named_entering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "named:entering:");
}

id objc_msgSend_named_intending_errorState_withBlockTakingSelf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "named:intending:errorState:withBlockTakingSelf:");
}

id objc_msgSend_named_withBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "named:withBlock:");
}

id objc_msgSend_named_withBlockTakingSelf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "named:withBlockTakingSelf:");
}

id objc_msgSend_nanos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nanos");
}

id objc_msgSend_negotiatedSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "negotiatedSessionID");
}

id objc_msgSend_negotiatedSessionID_forMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "negotiatedSessionID:forMailbox:");
}

id objc_msgSend_nextFireTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextFireTime");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextState");
}

id objc_msgSend_nextStateMachineCycleOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextStateMachineCycleOperation");
}

id objc_msgSend_nextStep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextStep:");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
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

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objcPrefix");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsAtIndexes:");
}

id objc_msgSend_onQueueMapMailbox(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onQueueMapMailbox");
}

id objc_msgSend_onQueueStartOver_clearAnnounce_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onQueueStartOver:clearAnnounce:flags:");
}

id objc_msgSend_onQueueUpdateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onQueueUpdateState");
}

id objc_msgSend_oneofs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oneofs");
}

id objc_msgSend_onqueueCheckExpectedFailure_attempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueCheckExpectedFailure:attempt:");
}

id objc_msgSend_onqueueEnterState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueEnterState:");
}

id objc_msgSend_onqueueHandleTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueHandleTransition:");
}

id objc_msgSend_onqueueProcessTransition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueProcessTransition:");
}

id objc_msgSend_onqueueStartFinishOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueStartFinishOperation");
}

id objc_msgSend_onqueueStartFinishOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onqueueStartFinishOperation:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationCount");
}

id objc_msgSend_operationDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationDependency");
}

id objc_msgSend_operationDependencyDescriptionCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationDependencyDescriptionCode");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_operationStateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationStateString");
}

id objc_msgSend_operationWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationWithBlock:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operations");
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oslog");
}

id objc_msgSend_otherNamesForPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "otherNamesForPeer");
}

id objc_msgSend_packWithMessage_typeURLPrefix_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "packWithMessage:typeURLPrefix:error:");
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "package");
}

id objc_msgSend_parseFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseFromData:error:");
}

id objc_msgSend_parseMessageSet_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseMessageSet:extensionRegistry:");
}

id objc_msgSend_parseUnknownField_extensionRegistry_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseUnknownField:extensionRegistry:tag:");
}

id objc_msgSend_pathFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathFromDictionary:");
}

id objc_msgSend_pathStep(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathStep");
}

id objc_msgSend_paused(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "paused");
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peer");
}

id objc_msgSend_peerAnnounce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerAnnounce");
}

id objc_msgSend_peerDisconnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerDisconnected");
}

id objc_msgSend_peerHandles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerHandles");
}

id objc_msgSend_peerIDMismatchCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerIDMismatchCounter");
}

id objc_msgSend_peerPublicInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerPublicInfo");
}

id objc_msgSend_peerSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerSessionID");
}

id objc_msgSend_peerSessionId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerSessionId");
}

id objc_msgSend_peerStorage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerStorage");
}

id objc_msgSend_pendingDependenciesString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingDependenciesString:");
}

id objc_msgSend_pendingFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingFlags");
}

id objc_msgSend_pendingFlagsScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingFlagsScheduler");
}

id objc_msgSend_pendingFlagsString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pendingFlagsString");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_postNotificationName_object_userInfo_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:options:");
}

id objc_msgSend_predictedNextFireTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predictedNextFireTime");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_publicInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicInfo");
}

id objc_msgSend_publicKeyInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicKeyInfo");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_rawValueAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawValueAtIndex:");
}

id objc_msgSend_reachabilityDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityDependency");
}

id objc_msgSend_reachabilityTracker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reachabilityTracker");
}

id objc_msgSend_readGroup_message_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readGroup:message:extensionRegistry:");
}

id objc_msgSend_readMapEntry_extensionRegistry_field_parentMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readMapEntry:extensionRegistry:field:parentMessage:");
}

id objc_msgSend_readMessage_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readMessage:extensionRegistry:");
}

id objc_msgSend_readUnknownGroup_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readUnknownGroup:message:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_recheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recheck");
}

id objc_msgSend_recvAnnounce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvAnnounce:");
}

id objc_msgSend_recvCommit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvCommit:");
}

id objc_msgSend_recvConfirm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvConfirm:");
}

id objc_msgSend_recvDiscloseA_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvDiscloseA:");
}

id objc_msgSend_recvRatelimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvRatelimit");
}

id objc_msgSend_recvReplyB_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvReplyB:");
}

id objc_msgSend_recvSelected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvSelected:");
}

id objc_msgSend_recvTeardown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recvTeardown:");
}

id objc_msgSend_registerStateTransitionWatcher_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerStateTransitionWatcher:");
}

id objc_msgSend_remainingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remainingPath");
}

id objc_msgSend_removeAddressLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAddressLookup:");
}

id objc_msgSend_removeDependenciesUponCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDependenciesUponCompletion");
}

id objc_msgSend_removeDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDependency:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeMailbox:");
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

id objc_msgSend_removeSessionIDLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeSessionIDLookup:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetSession:");
}

id objc_msgSend_restart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restart");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_runBeforeGroupFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runBeforeGroupFinished:");
}

id objc_msgSend_sas(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sas");
}

id objc_msgSend_sasCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sasCode");
}

id objc_msgSend_seconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seconds");
}

id objc_msgSend_selfAccountKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfAccountKey:");
}

id objc_msgSend_selfRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfRandom");
}

id objc_msgSend_selfname(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selfname");
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semaphore");
}

id objc_msgSend_sendAnnounce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAnnounce");
}

id objc_msgSend_sendCommitA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCommitA");
}

id objc_msgSend_sendConfirm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendConfirm");
}

id objc_msgSend_sendMessage_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:data:");
}

id objc_msgSend_sendMessage_data_targets_fromHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:data:targets:fromHandle:");
}

id objc_msgSend_sendMessage_data_targets_sourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:data:targets:sourceID:");
}

id objc_msgSend_sendMessage_data_toID_sourceID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:data:toID:sourceID:");
}

id objc_msgSend_sendProtobuf_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendProtobuf:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendRevealA(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRevealA");
}

id objc_msgSend_sendSelected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSelected");
}

id objc_msgSend_sendSetupB(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSetupB");
}

id objc_msgSend_sendTearDown_idsHandle_because_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTearDown:idsHandle:because:");
}

id objc_msgSend_sendTeardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendTeardown");
}

id objc_msgSend_sentAnnounce(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentAnnounce");
}

id objc_msgSend_sentTeardown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentTeardown");
}

id objc_msgSend_sentTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentTime");
}

id objc_msgSend_serializedDataForUnknownValue_forKey_keyDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:");
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSize");
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSizeAsMessageSet");
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSizeAsMessageSetExtension");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionID");
}

id objc_msgSend_sessionIDLookup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionIDLookup");
}

id objc_msgSend_sessionId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionId");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setACommitRandom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setACommitRandom:");
}

id objc_msgSend_setARandom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setARandom:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAllowPendingFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowPendingFlags:");
}

id objc_msgSend_setBRandom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBRandom:");
}

id objc_msgSend_setBackoff_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackoff:");
}

id objc_msgSend_setBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBag:");
}

id objc_msgSend_setBeforeRatelimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBeforeRatelimit:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setCheckReachabilityOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckReachabilityOperation:");
}

id objc_msgSend_setCheckUnlockOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCheckUnlockOperation:");
}

id objc_msgSend_setComplete_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComplete:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setConditionChecksInFlight_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConditionChecksInFlight:");
}

id objc_msgSend_setCurrentConditions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentConditions:");
}

id objc_msgSend_setCurrentDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentDelay:");
}

id objc_msgSend_setCurrentState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentState:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeletedHandles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeletedHandles:");
}

id objc_msgSend_setDescriptionErrorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDescriptionErrorCode:");
}

id objc_msgSend_setDestinationIDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationIDSID:");
}

id objc_msgSend_setError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:");
}

id objc_msgSend_setExpire_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExpire:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtension:value:");
}

id objc_msgSend_setFillInError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFillInError:");
}

id objc_msgSend_setFinishDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinishDate:");
}

id objc_msgSend_setGotAnnounceData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotAnnounceData:");
}

id objc_msgSend_setGotCommitData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotCommitData:");
}

id objc_msgSend_setGotConfirmData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotConfirmData:");
}

id objc_msgSend_setGotReplyBData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotReplyBData:");
}

id objc_msgSend_setGotRevealData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotRevealData:");
}

id objc_msgSend_setGotSelected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotSelected:");
}

id objc_msgSend_setGotTeardown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGotTeardown:");
}

id objc_msgSend_setHalted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHalted:");
}

id objc_msgSend_setHandleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandleID:");
}

id objc_msgSend_setHoldStateMachineOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHoldStateMachineOperation:");
}

id objc_msgSend_setIdsHandleLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsHandleLookup:");
}

id objc_msgSend_setIdsTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsTransport:");
}

id objc_msgSend_setInitialDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialDelay:");
}

id objc_msgSend_setInitiatorUndisclosedRandom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitiatorUndisclosedRandom:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLiveRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveRequest:");
}

id objc_msgSend_setLiveRequestReceived_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLiveRequestReceived:");
}

id objc_msgSend_setLocalSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocalSessionID:");
}

id objc_msgSend_setLog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLog:");
}

id objc_msgSend_setMessagedAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessagedAction:forIncomingRequestsOfType:");
}

id objc_msgSend_setMyPublicInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMyPublicInfo:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNanos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNanos:");
}

id objc_msgSend_setNegotiatedSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNegotiatedSessionID:");
}

id objc_msgSend_setNextState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextState:");
}

id objc_msgSend_setNextStateMachineCycleOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextStateMachineCycleOperation:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationDependency_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationDependency:");
}

id objc_msgSend_setOslog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOslog:");
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPaused:");
}

id objc_msgSend_setPeer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeer:");
}

id objc_msgSend_setPeerAccountIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerAccountIdentity:");
}

id objc_msgSend_setPeerAnnounce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerAnnounce:");
}

id objc_msgSend_setPeerDisconnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerDisconnected:");
}

id objc_msgSend_setPeerIDMismatchCounter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerIDMismatchCounter:");
}

id objc_msgSend_setPeerIDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerIDSID:");
}

id objc_msgSend_setPeerPublic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerPublic:");
}

id objc_msgSend_setPeerPublicInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerPublicInfo:");
}

id objc_msgSend_setPeerRandom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerRandom:");
}

id objc_msgSend_setPeerSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerSessionID:");
}

id objc_msgSend_setPeerSessionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerSessionId:");
}

id objc_msgSend_setPeerStorage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerStorage:");
}

id objc_msgSend_setPredictedNextFireTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredictedNextFireTime:");
}

id objc_msgSend_setProtobufAction_forIncomingRequestsOfType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProtobufAction:forIncomingRequestsOfType:");
}

id objc_msgSend_setPublicInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPublicInfo:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setRecvRatelimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecvRatelimit:");
}

id objc_msgSend_setRemainingPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemainingPath:");
}

id objc_msgSend_setSas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSas:");
}

id objc_msgSend_setSasCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSasCode:");
}

id objc_msgSend_setSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeconds:");
}

id objc_msgSend_setSentAnnounce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentAnnounce:");
}

id objc_msgSend_setSentTeardown_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentTeardown:");
}

id objc_msgSend_setSentTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentTime:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setSessionExpire_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionExpire:");
}

id objc_msgSend_setSessionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionID:");
}

id objc_msgSend_setSessionIDLookup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionIDLookup:");
}

id objc_msgSend_setSessionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionId:");
}

id objc_msgSend_setSigTerm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSigTerm:");
}

id objc_msgSend_setSourceIDSID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourceIDSID:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateMachine:");
}

id objc_msgSend_setStateMachineQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateMachineQueue:");
}

id objc_msgSend_setStateUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateUpdate:");
}

id objc_msgSend_setTimeoutCanOccur_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutCanOccur:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setTransparencyGPBGenericValue_forTransparencyGPBGenericValueKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransparencyGPBGenericValue:forTransparencyGPBGenericValueKey:");
}

id objc_msgSend_setTransport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransport:");
}

id objc_msgSend_setTypeURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTypeURL:");
}

id objc_msgSend_setUnknownFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnknownFields:");
}

id objc_msgSend_setUpdateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateQueue:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setXpcQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setXpcQueue:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup");
}

id objc_msgSend_setupExtraTextInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupExtraTextInfo:");
}

id objc_msgSend_setupMailbox_publicInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupMailbox:publicInfo:");
}

id objc_msgSend_setupOneofs_count_firstHasIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupOneofs:count:firstHasIndex:");
}

id objc_msgSend_setupTransport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTransport");
}

id objc_msgSend_sha256Transparency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha256Transparency");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shortAuthenticationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortAuthenticationString");
}

id objc_msgSend_sigTerm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sigTerm");
}

id objc_msgSend_signalEventHander(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signalEventHander");
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singletonName");
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singletonNameC");
}

id objc_msgSend_skipField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipField:");
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipMessage");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedFields");
}

id objc_msgSend_sourceIDS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceIDS");
}

id objc_msgSend_sourceStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceStates");
}

id objc_msgSend_startMessageDelegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMessageDelegate:onQueue:");
}

id objc_msgSend_startOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOperation");
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSession");
}

id objc_msgSend_startSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSession:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateConditions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateConditions");
}

id objc_msgSend_stateEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateEngine");
}

id objc_msgSend_stateInit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateInit");
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachine");
}

id objc_msgSend_stateMachineQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineQueue");
}

id objc_msgSend_stateMachineRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineRequests");
}

id objc_msgSend_stateMachineWatchers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateMachineWatchers");
}

id objc_msgSend_stateUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateUpdate");
}

id objc_msgSend_states(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "states");
}

id objc_msgSend_staticKeyFeatureNotEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "staticKeyFeatureNotEnabled:");
}

id objc_msgSend_stopTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTransaction");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_successDependencies(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successDependencies");
}

id objc_msgSend_successState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "successState");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superclass");
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syntax");
}

id objc_msgSend_tearDown_toID_fromID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDown:toID:fromID:");
}

id objc_msgSend_teardownMailbox_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownMailbox:");
}

id objc_msgSend_testHoldStates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testHoldStates");
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFormatName");
}

id objc_msgSend_textFormatNameForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFormatNameForValue:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeout:");
}

id objc_msgSend_timeoutCanOccur(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutCanOccur");
}

id objc_msgSend_timeoutQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeoutQueue");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timer");
}

id objc_msgSend_toID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toID");
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transaction");
}

id objc_msgSend_transitionOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionOperation");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transport");
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trigger");
}

id objc_msgSend_triggerAt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerAt:");
}

id objc_msgSend_typeURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeURL");
}

id objc_msgSend_undisclosedInitiatorRandom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "undisclosedInitiatorRandom");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknownFields");
}

id objc_msgSend_unlockDependency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockDependency");
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregister");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateQueue");
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateAnnounce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateAnnounce:");
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validationFunc");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}

id objc_msgSend_valueAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueAtIndex:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "varintList");
}

id objc_msgSend_wait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wait:");
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitUntilFinished");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wireType");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeBool_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBool:value:");
}

id objc_msgSend_writeBoolNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBoolNoTag:");
}

id objc_msgSend_writeBytes_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytes:value:");
}

id objc_msgSend_writeBytesArray_values_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytesArray:values:");
}

id objc_msgSend_writeBytesNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytesNoTag:");
}

id objc_msgSend_writeDelimitedToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDelimitedToCodedOutputStream:");
}

id objc_msgSend_writeDouble_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDouble:value:");
}

id objc_msgSend_writeDoubleNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDoubleNoTag:");
}

id objc_msgSend_writeEnum_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeEnum:value:");
}

id objc_msgSend_writeEnumNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeEnumNoTag:");
}

id objc_msgSend_writeExtensionsToCodedOutputStream_range_sortedExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeExtensionsToCodedOutputStream:range:sortedExtensions:");
}

id objc_msgSend_writeField_toCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeField:toCodedOutputStream:");
}

id objc_msgSend_writeFixed32_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed32:value:");
}

id objc_msgSend_writeFixed32Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed32Array:values:tag:");
}

id objc_msgSend_writeFixed32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed32NoTag:");
}

id objc_msgSend_writeFixed64_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed64:value:");
}

id objc_msgSend_writeFixed64Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed64Array:values:tag:");
}

id objc_msgSend_writeFixed64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed64NoTag:");
}

id objc_msgSend_writeFloat_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFloat:value:");
}

id objc_msgSend_writeFloatNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFloatNoTag:");
}

id objc_msgSend_writeGroup_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeGroup:value:");
}

id objc_msgSend_writeGroupNoTag_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeGroupNoTag:value:");
}

id objc_msgSend_writeInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInt32NoTag:");
}

id objc_msgSend_writeInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInt64NoTag:");
}

id objc_msgSend_writeMessage_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMessage:value:");
}

id objc_msgSend_writeMessageNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMessageNoTag:");
}

id objc_msgSend_writeRawMessageSetExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeRawMessageSetExtension:value:");
}

id objc_msgSend_writeRawVarintSizeTAs32_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeRawVarintSizeTAs32:");
}

id objc_msgSend_writeSFixed32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSFixed32NoTag:");
}

id objc_msgSend_writeSFixed64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSFixed64NoTag:");
}

id objc_msgSend_writeSInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSInt32NoTag:");
}

id objc_msgSend_writeSInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSInt64NoTag:");
}

id objc_msgSend_writeString_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeString:value:");
}

id objc_msgSend_writeStringNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeStringNoTag:");
}

id objc_msgSend_writeTag_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTag:format:");
}

id objc_msgSend_writeToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToCodedOutputStream:");
}

id objc_msgSend_writeToOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToOutput:");
}

id objc_msgSend_writeUInt32_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt32:value:");
}

id objc_msgSend_writeUInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt32NoTag:");
}

id objc_msgSend_writeUInt64_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt64:value:");
}

id objc_msgSend_writeUInt64Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt64Array:values:tag:");
}

id objc_msgSend_writeUInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt64NoTag:");
}

id objc_msgSend_writeUnknownGroup_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUnknownGroup:value:");
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcQueue");
}
