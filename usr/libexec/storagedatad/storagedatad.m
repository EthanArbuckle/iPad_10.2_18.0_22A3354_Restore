id sub_100002C24()
{
  if (qword_100008790 != -1)
    dispatch_once(&qword_100008790, &stru_100004148);
  return (id)qword_100008788;
}

void sub_100002C64(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.storagedatad", "storagedatad");
  v2 = (void *)qword_100008788;
  qword_100008788 = (uint64_t)v1;

}

void sub_100002FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100002FC4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  id result;
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    v4 = sub_100002C24();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(v2);
      v12 = 138412290;
      v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connection from remote invalidated: %@", (uint8_t *)&v12, 0xCu);

    }
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v8 = objc_loadWeakRetained(v2);
    objc_msgSend(v7, "removeObject:", v8);

  }
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "count");
  if (!result)
  {
    v10 = sub_100002C24();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Last connection invalidated ; exiting",
        (uint8_t *)&v12,
        2u);
    }

    exit(0);
  }
  return result;
}

uint64_t start()
{
  DSStorageDataServiceDelegate *v0;
  id v1;
  void *v2;

  v0 = objc_opt_new(DSStorageDataServiceDelegate);
  v1 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.storagedatad"));
  objc_msgSend(v1, "setDelegate:", v0);
  objc_msgSend(v1, "resume");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v2, "run");

  return 0;
}

void sub_1000031A4(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Client %d is missing entitlements required to use this service", (uint8_t *)v3, 8u);
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_storageInfoDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storageInfoDict");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
