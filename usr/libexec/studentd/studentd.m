void sub_10000695C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

void sub_100006BB8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(const char **)(a1 + 40);
    v7 = NSStringFromSelector(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("STUSendIDSMessageOperation.m"), 74, CFSTR("%@ must be called from the main thread"), v8);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v3 = *(void **)(a1 + 32);
    if (v9)
      objc_msgSend(v3, "endOperationWithError:");
    else
      objc_msgSend(v3, "endOperationWithResultObject:");
  }

}

void sub_1000071E8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "setCacheClearInProgress:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "clock"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDate"));
  objc_msgSend(*(id *)(a1 + 32), "setLastCacheClearFinishDate:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_100007440(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  NSString *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v5 = (const char *)a1[7];
    v6 = a1[4];
    v7 = NSStringFromSelector(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("STUIDSCacheClearer.m"), 100, CFSTR("%@ must be called from the main thread"), v8);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", a1[5]));
  (*(void (**)(void))(a1[6] + 16))();

}

void sub_100007700(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchInstructorEndpointResultObject);
    objc_msgSend(v5, "setEndpoint:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

void sub_1000078B4(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalOperation"));
  objc_msgSend(v1, "cancel");

}

BOOL sub_100007CF4(id a1, CATOperation *a2)
{
  CATOperation *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(STUAppLockLongRunningOperation);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_100007FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008024(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "batteryLevelDidChange");

}

id sub_100008050()
{
  if (qword_1000FC028 != -1)
    dispatch_once(&qword_1000FC028, &stru_1000C9968);
  return (id)qword_1000FC020;
}

void sub_100008348(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1000082C8);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000083A8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC020;
  qword_1000FC020 = (uint64_t)v1;

}

void sub_100008614(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "globalNotification"));

    if (v2)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "globalNotification"));
      objc_msgSend(v3, "cancel");

      v4 = *(void **)(a1 + 32);
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v4, "endOperationWithError:", v6);

    }
  }
}

void sub_100008814(uint64_t a1, void *a2)
{
  id v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = CATErrorWithCodeAndUserInfo(404, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "endOperationWithError:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setLockStateStatusProvider:", v3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000088FC;
    v9[3] = &unk_1000C97E8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribeToLockStateChanges:", v9));
    objc_msgSend(*(id *)(a1 + 32), "setLockStateStatusSubscription:", v8);

    objc_msgSend(*(id *)(a1 + 32), "postMainNotification");
    objc_msgSend(*(id *)(a1 + 32), "updateLockScreenNotificationWithInitialUpdate:", 1);
  }

}

id sub_1000088FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateLockScreenNotificationWithInitialUpdate:", 0);
}

void sub_100008B00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008B24(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "handleGlobalNotificationWith:responseDictionary:error:", a2, v8, v7);

}

void sub_100009118(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[CRKUser makeMeCardUserProvider](CRKUser, "makeMeCardUserProvider"));
  v2 = (void *)qword_1000FC038;
  qword_1000FC038 = v1;

}

void sub_100009214(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC040;
  qword_1000FC040 = (uint64_t)v1;

}

void sub_100009488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000094C8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateScreenState");

}

void sub_1000095F4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC050;
  qword_1000FC050 = (uint64_t)v1;

}

void sub_100009664(id a1)
{
  id v1;
  void *v2;

  v1 = -[STUCourseIdentifierMetadataTracker _init]([STUCourseIdentifierMetadataTracker alloc], "_init");
  v2 = (void *)qword_1000FC068;
  qword_1000FC068 = (uint64_t)v1;

}

void sub_100009B8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "errorForRenewResult:", a2));
  v8 = v7;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100009C4C;
  v11[3] = &unk_1000C9A68;
  v9 = *(id *)(a1 + 40);
  v12 = v8;
  v13 = v9;
  v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

uint64_t sub_100009C4C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100009D40(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC070;
  qword_1000FC070 = (uint64_t)v1;

}

void sub_10000B00C(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  id v4;
  id v5;

  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  if (string)
  {
    v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", string, 4);
    if (v4)
    {
      v5 = v4;
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      v4 = v5;
    }

  }
}

uint64_t sub_10000B114(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000BB48(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fetchOperation"));
  objc_msgSend(v1, "cancel");

}

id sub_10000BBD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

id sub_10000C018()
{
  if (qword_1000FC088 != -1)
    dispatch_once(&qword_1000FC088, &stru_1000C9B20);
  return (id)qword_1000FC080;
}

id sub_10000C14C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", *(_QWORD *)(a1 + 40));
}

void sub_10000C514(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v3 = a2;
  v4 = sub_10000C018();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10007A844(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringValue"));
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully cleared IDS cache for instructor Apple Account %{public}@, course identifier %{public}@", (uint8_t *)&v9, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10000C748(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC080;
  qword_1000FC080 = (uint64_t)v1;

}

void sub_10000D084(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchMeCardResultObject);
    objc_msgSend(v5, "setCardInfo:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

void sub_10000D28C(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureDataStore"));
  objc_msgSend(v2, "setClassroomInstructorRoleEnabled:", v1);

}

BOOL sub_10000D2DC(id a1, STULSApplicationProxy *a2)
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STULSApplicationProxy bundleIdentifier](a2, "bundleIdentifier"));
  v3 = CRKIsClassroomBundleIdentifier();

  return v3;
}

id sub_10000D7E4()
{
  if (qword_1000FC098 != -1)
    dispatch_once(&qword_1000FC098, &stru_1000C9BD0);
  return (id)qword_1000FC090;
}

void sub_10000D878(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC090;
  qword_1000FC090 = (uint64_t)v1;

}

void sub_10000DA78(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC0A0;
  qword_1000FC0A0 = (uint64_t)v1;

}

void sub_10000DDAC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void sub_10000DE28(uint64_t a1)
{
  id v2;

  v2 = (id)objc_opt_new(CRKFetchApplicationsResultObject);
  objc_msgSend(v2, "setApplicationsByIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "endOperationWithResultObject:", v2);

}

void sub_10000DF54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    if (qword_1000FC0B8 != -1)
      dispatch_once(&qword_1000FC0B8, &stru_1000C9C60);
    v7 = (void *)qword_1000FC0B0;
    if (os_log_type_enabled((os_log_t)qword_1000FC0B0, OS_LOG_TYPE_ERROR))
      sub_10007A9A4(a1, v7, v6);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10000E074(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC0B0;
  qword_1000FC0B0 = (uint64_t)v1;

}

id sub_10000E3E4()
{
  if (qword_1000FC0C8 != -1)
    dispatch_once(&qword_1000FC0C8, &stru_1000C9C80);
  return (id)qword_1000FC0C0;
}

void sub_10000E4A4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "cancel");
  if ((objc_msgSend(*(id *)(a1 + 32), "isExclusive") & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
    {
      v2 = *(void **)(a1 + 32);
      v3 = CATErrorWithCodeAndUserInfo(404, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue(v3);
      objc_msgSend(v2, "endOperationWithError:", v4);

    }
  }
}

void sub_10000EDE8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC0C0;
  qword_1000FC0C0 = (uint64_t)v1;

}

id sub_10000F450()
{
  if (qword_1000FC0E8 != -1)
    dispatch_once(&qword_1000FC0E8, &stru_1000C9CC0);
  return (id)qword_1000FC0E0;
}

void sub_1000102E4(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(CATSerialOperationQueue);
  v2 = (void *)qword_1000FC0D8;
  qword_1000FC0D8 = v1;

  objc_msgSend((id)qword_1000FC0D8, "setMaxConcurrentOperationCount:", -1);
}

void sub_100010388(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC0E0;
  qword_1000FC0E0 = (uint64_t)v1;

}

id sub_1000105D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fire");
}

void sub_1000112F4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC0F0;
  qword_1000FC0F0 = (uint64_t)v1;

}

id sub_1000113BC()
{
  if (qword_1000FC108 != -1)
    dispatch_once(&qword_1000FC108, &stru_1000C9D50);
  return (id)qword_1000FC100;
}

uint64_t sub_10001182C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a3 + 24)));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *(_QWORD *)(a3 + 16), v6);
  if (v7)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

  return 0;
}

void sub_100011C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011CBC(uint64_t a1, int a2, _QWORD *a3)
{
  void *v4;

  if (a2 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *a3));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v4, "integerValue");

  }
  return 0;
}

uint64_t sub_100012080(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (**v7)(id, uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  v7 = objc_retainBlock(a1);
  v8 = v7[2](v7, a2, a3, a4);

  return v8;
}

void sub_1000121C0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC100;
  qword_1000FC100 = (uint64_t)v1;

}

void sub_1000121F0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_100012214(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

id sub_100012A38()
{
  if (qword_1000FC118 != -1)
    dispatch_once(&qword_1000FC118, &stru_1000C9DC0);
  return (id)qword_1000FC110;
}

void sub_100012A78(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012B1C;
  v7[3] = &unk_1000C9D78;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v4;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v7);

}

void sub_100012B1C(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v2 = (char *)objc_msgSend(*(id *)(a1 + 32), "unsignedIntegerValue");
  v4 = *(void **)(a1 + 40);
  v3 = a1 + 40;
  v5 = objc_msgSend(v4, "isCancelled");
  v6 = *(_QWORD *)(v3 + 8);
  if ((v5 & 1) != 0 || (v6 ? (v7 = v2 == 0) : (v7 = 1), v7))
  {
    _objc_msgSend(*(id *)v3, "loginDidCompleteWithError:", v6);
  }
  else
  {
    v8 = sub_100012A38();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10007ACA0((uint64_t *)v3, v9);

    v11 = *(id *)v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v2 - 1));
    v14[0] = NSDefaultRunLoopMode;
    v14[1] = NSRunLoopCommonModes;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
    objc_msgSend(v11, "performSelector:withObject:afterDelay:inModes:", "assignUserWithRetriesLeft:", v12, v13, 1.0);

  }
}

void sub_100012D8C(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "daemon"));
  objc_msgSend(v1, "setActiveStudentIdentifier:completion:", 0, 0);

}

void sub_100012F84(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC110;
  qword_1000FC110 = (uint64_t)v1;

}

void sub_10001344C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC120;
  qword_1000FC120 = (uint64_t)v1;

}

void sub_10001391C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

void sub_100013B54(uint64_t a1)
{
  void *v2;
  id v3;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "startAppLockOperation"));
    objc_msgSend(v2, "cancel");

    v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "launchAppOperation"));
    objc_msgSend(v3, "cancel");

  }
}

id sub_100015294()
{
  if (qword_1000FC138 != -1)
    dispatch_once(&qword_1000FC138, &stru_1000C9E28);
  return (id)qword_1000FC130;
}

void sub_1000152D4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC130;
  qword_1000FC130 = (uint64_t)v1;

}

void sub_100015304(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10001546C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchAdHocConfigurationResultObject);
    objc_msgSend(v5, "setConfiguration:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  STUConcretePrimitives *v3;
  STUDaemon *v4;
  void *v5;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_opt_new(CRKSandboxPrimitivesProvider);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "makePrimitives"));

  if ((objc_msgSend(v2, "enter") & 1) == 0)
    exit(1);
  v3 = objc_opt_new(STUConcretePrimitives);
  +[STUEnvironment setUpWithPrimitives:](STUEnvironment, "setUpWithPrimitives:", v3);
  v4 = objc_opt_new(STUDaemon);

  objc_autoreleasePoolPop(v0);
  -[STUDaemon run](v4, "run");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v5, "run");

  return 0;
}

void sub_10001756C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

id sub_10001858C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "originalTable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));

  return v5;
}

NSArray *__cdecl sub_1000186B4(id a1, CRKASMCourse *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRKASMCourse trustedUsers](a2, "trustedUsers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crk_mapUsingBlock:", &stru_1000C9ED0));

  return (NSArray *)v3;
}

NSString *__cdecl sub_1000186F8(id a1, CRKASMTrustedUser *a2)
{
  return (NSString *)-[CRKASMTrustedUser appleID](a2, "appleID");
}

DMFControlGroupIdentifier *__cdecl sub_10001894C(id a1, CRKASMCourse *a2)
{
  return (DMFControlGroupIdentifier *)-[CRKASMCourse identifier](a2, "identifier");
}

void sub_100019A78(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

void sub_100019E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019E74(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notificationDurationTimerDidFire");

}

id sub_100019EA0()
{
  if (qword_1000FC148 != -1)
    dispatch_once(&qword_1000FC148, &stru_1000C9FA8);
  return (id)qword_1000FC140;
}

id sub_10001A720(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "primitives"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userNotificationPrimitives"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "instructor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A804;
  v11[3] = &unk_1000C9F60;
  v12 = v3;
  v8 = v3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "postRemoteConnectionNotificationWithInstructorName:actionHandler:", v7, v11));

  return v9;
}

uint64_t sub_10001A804(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001A898(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC140;
  qword_1000FC140 = (uint64_t)v1;

}

void sub_10001B67C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

void sub_10001B93C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000FC150;
  qword_1000FC150 = v1;

}

void sub_10001BC00(id a1, CATOperation *a2, BOOL *a3)
{
  -[CATOperation cancel](a2, "cancel", a3);
}

id sub_10001BCF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

id sub_10001BD7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

id sub_10001C10C()
{
  if (qword_1000FC168 != -1)
    dispatch_once(&qword_1000FC168, &stru_1000CA058);
  return (id)qword_1000FC160;
}

void sub_10001C1A8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    objc_msgSend(*(id *)(a1 + 32), "endObserving");
    v2 = sub_10001C10C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v12 = 138543362;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@: Disabling classroom lock screen", (uint8_t *)&v12, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lockScreenMonitor"));
    objc_msgSend(v6, "dismissClassroomLockScreen");

    if (objc_msgSend(*(id *)(a1 + 32), "didClassroomLockScreenDisplay"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "postNotificationName:object:", CFSTR("STULockLongRunningOperationDidUnlockNotification"), *(_QWORD *)(a1 + 32));

    }
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v9 = *(void **)(a1 + 32);
    if (v8)
    {
      v10 = CATErrorWithCodeAndUserInfo(404, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(v9, "endOperationWithError:", v11);

    }
    else
    {
      objc_msgSend(v9, "endOperationWithResultObject:", 0);
    }
  }
}

void sub_10001C920(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC160;
  qword_1000FC160 = (uint64_t)v1;

}

void sub_10001CE00(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC170;
  qword_1000FC170 = (uint64_t)v1;

}

void sub_10001D508(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

id sub_10001D5C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginObservingLockState");
}

void sub_10001D76C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001D790(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSString *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = a2;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = *(const char **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSStringFromSelector(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("STUPostAggressiveUserNotificationOperation.m"), 98, CFSTR("%@ must be called from the main thread"), v12);

  }
  v4 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "isExecuting"))
  {
    objc_msgSend(v6, "setLockStateStatusProvider:", v3);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001D8FC;
    v13[3] = &unk_1000C9F38;
    objc_copyWeak(&v14, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscribeToLockStateChanges:", v13));
    objc_msgSend(v6, "setLockScreenStateSubscription:", v7);

    objc_msgSend(v6, "postInitialUserNotification");
    objc_destroyWeak(&v14);
  }

}

void sub_10001D8E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001D8FC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evaluateLockScreenState");

}

void sub_10001DB30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10001DB54(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001DBD4;
  v3[3] = &unk_1000CA0C8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(v4);
}

void sub_10001DBD4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userNotificationDidFinishWithResult:", *(_QWORD *)(a1 + 40));

}

void sub_10001DF88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001DFAC(id *a1)
{
  id WeakRetained;
  BOOL v3;
  id v4;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "lockScreenEvaluationCounter") == a1[6];
    WeakRetained = v4;
    if (v3)
    {
      objc_msgSend(a1[4], "reregister");
      WeakRetained = v4;
    }
  }

}

id sub_10001E7EC(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = kMCAppWhitelistIdentifierKey;
  v6[1] = kMCAppWhitelistUserEnabledOptionsKey;
  v2 = *(_QWORD *)(a1 + 32);
  v7[0] = a2;
  v7[1] = v2;
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));

  return v4;
}

id sub_10001FA84()
{
  if (qword_1000FC188 != -1)
    dispatch_once(&qword_1000FC188, &stru_1000CA188);
  return (id)qword_1000FC180;
}

id sub_1000200B0(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "instructorIdentifier"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void sub_100020450(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC180;
  qword_1000FC180 = (uint64_t)v1;

}

void sub_100020480(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100020490(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100020634(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchResourceResultObject);
    objc_msgSend(v5, "setResourceData:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

id sub_100020FFC()
{
  if (qword_1000FC198 != -1)
    dispatch_once(&qword_1000FC198, &stru_1000CA2C8);
  return (id)qword_1000FC190;
}

void sub_1000211EC(uint64_t a1, void *a2)
{
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100021320;
  v12[3] = &unk_1000CA218;
  v4 = (id *)(a1 + 32);
  v13 = *(id *)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "crk_firstMatching:", v12));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "notificationCenter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "request"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000213A0;
    v10[3] = &unk_1000CA240;
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v6, "addNotificationRequest:withCompletionHandler:", v7, v10);

    v8 = v11;
  }
  else
  {
    v9 = sub_100020FFC();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007B14C(v4);
  }

}

id sub_100021320(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "request"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

void sub_1000213A0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = sub_100020FFC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10007B1CC(a1, v3, v5);

  }
}

void sub_100021598(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100020FFC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10007B290(v2);

  }
}

void sub_10002183C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC190;
  qword_1000FC190 = (uint64_t)v1;

}

void sub_1000218E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000FC1A8;
  qword_1000FC1A8 = v1;

}

void sub_100022274(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC1B0;
  qword_1000FC1B0 = (uint64_t)v1;

}

void sub_1000223E4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a4);
  }
  else
  {
    v7 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a2));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, CFSTR("eligible"));

    v9 = (void *)objc_opt_new(CRKFetchEasyMAIDSignInEligibilityResultObject);
    v10 = -[NSMutableDictionary copy](v7, "copy");
    objc_msgSend(v9, "setEligibility:", v10);

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v9);
  }

}

STUASMCertificateRefreshIdentifier *__cdecl sub_100022598(id a1, DMFControlSessionIdentifier *a2)
{
  DMFControlSessionIdentifier *v2;
  STUASMCertificateRefreshIdentifier *v3;

  v2 = a2;
  v3 = -[STUASMCertificateRefreshIdentifier initWithSessionIdentifier:]([STUASMCertificateRefreshIdentifier alloc], "initWithSessionIdentifier:", v2);

  return v3;
}

id sub_1000228C0()
{
  if (qword_1000FC1C8 != -1)
    dispatch_once(&qword_1000FC1C8, &stru_1000CA398);
  return (id)qword_1000FC1C0;
}

uint64_t sub_100022900(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  int v10;
  __CFString *v11;
  __int16 v12;
  void *v13;

  v4 = sub_1000228C0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = CFSTR("NO");
    if (a2)
      v6 = CFSTR("YES");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stringValue"));
    v10 = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Refresh finished with outcome: %{public}@. Killing TCP connection to %{public}@", (uint8_t *)&v10, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100022CBC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC1C0;
  qword_1000FC1C0 = (uint64_t)v1;

}

id sub_1000241C0()
{
  if (qword_1000FC1D8 != -1)
    dispatch_once(&qword_1000FC1D8, &stru_1000CA3E0);
  return (id)qword_1000FC1D0;
}

id sub_100025278(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  NSObject *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "makeCertificateWithData:", a2));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addCertificate:toAccessGroup:", v3, CFSTR("com.apple.studentd")));
    if (!v4)
    {
      if (qword_1000FC1E8 != -1)
        dispatch_once(&qword_1000FC1E8, &stru_1000CA400);
      v5 = qword_1000FC1E0;
      if (os_log_type_enabled((os_log_t)qword_1000FC1E0, OS_LOG_TYPE_ERROR))
        sub_10007B490((uint64_t)v3, v5);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_10002548C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC1D0;
  qword_1000FC1D0 = (uint64_t)v1;

}

void sub_1000254BC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC1E0;
  qword_1000FC1E0 = (uint64_t)v1;

}

void sub_100025BBC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC1F0;
  qword_1000FC1F0 = (uint64_t)v1;

}

id sub_100025D70()
{
  if (qword_1000FC208 != -1)
    dispatch_once(&qword_1000FC208, &stru_1000CA468);
  return (id)qword_1000FC200;
}

void sub_100025EC4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC200;
  qword_1000FC200 = (uint64_t)v1;

}

id sub_100026394()
{
  if (qword_1000FC218 != -1)
    dispatch_once(&qword_1000FC218, &stru_1000CA4B0);
  return (id)qword_1000FC210;
}

void sub_1000263D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = sub_100026394();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10007B5E0(v5);

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didFetchInternetDate:course:", a2, *(_QWORD *)(a1 + 40));
  }

}

void sub_1000265EC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC210;
  qword_1000FC210 = (uint64_t)v1;

}

id sub_100026878()
{
  if (qword_1000FC228 != -1)
    dispatch_once(&qword_1000FC228, &stru_1000CA4D0);
  return (id)qword_1000FC220;
}

void sub_100026B80(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC220;
  qword_1000FC220 = (uint64_t)v1;

}

void sub_100026DEC(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchInternetDateResultObject);
    objc_msgSend(v5, "setDate:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

void sub_100027A50(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC230;
  qword_1000FC230 = (uint64_t)v1;

}

void sub_100028324(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC240;
  qword_1000FC240 = (uint64_t)v1;

}

void sub_100028354(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

void sub_100028BDC(id a1, NSString *a2, CRKUser *a3, BOOL *a4)
{
  -[CRKUser setRole:](a3, "setRole:", 2, a4);
}

BOOL sub_1000299E0(id a1, NSData *a2, NSDictionary *a3)
{
  NSData *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keychain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "certificateWithPersistentID:", v3));

  LOBYTE(v4) = objc_msgSend(v6, "isTemporallyValid");
  return (char)v4;
}

void sub_10002A0FC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

id sub_10002A6DC()
{
  if (qword_1000FC258 != -1)
    dispatch_once(&qword_1000FC258, &stru_1000CA600);
  return (id)qword_1000FC250;
}

void sub_10002A71C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  id *v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  id obj;
  void *v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;

  v5 = a2;
  v6 = a3;
  v46 = a1;
  v8 = *(void **)(a1 + 32);
  v7 = (uint64_t *)(a1 + 32);
  if (objc_msgSend(v8, "isCanceled"))
  {
    v9 = (void *)*v7;
    v10 = CATErrorWithCodeAndUserInfo(404, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "endOperationWithError:", v11);

  }
  else
  {
    v12 = sub_10002A6DC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = v13;
    if (v6)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10007B850(v7, v14);

      objc_msgSend((id)*v7, "endOperationWithError:", v6);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = *v7;
        *(_DWORD *)buf = 138543362;
        v58 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Fetched ad-hoc configuration", buf, 0xCu);
      }
      v39 = (id *)v7;

      v40 = v5;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5));
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v46 + 40), "configuration"));
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v52;
        v20 = kCRKAdHocConfigurationDefaultStudentInformationKey;
        v41 = *(_QWORD *)v52;
        v42 = v16;
        do
        {
          v21 = 0;
          v43 = v18;
          do
          {
            if (*(_QWORD *)v52 != v19)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v21);
            if (objc_msgSend(v22, "isEqualToString:", v20))
            {
              v45 = v21;
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v20));
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v23));

              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v46 + 40), "configuration"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", v20));

              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              if (v27)
              {
                v28 = v27;
                v29 = *(_QWORD *)v48;
                do
                {
                  for (i = 0; i != v28; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v48 != v29)
                      objc_enumerationMutation(v26);
                    v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v46 + 40), "configuration"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v20));
                    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKeyedSubscript:", v31));
                    objc_msgSend(v24, "setObject:forKeyedSubscript:", v34, v31);

                  }
                  v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
                }
                while (v28);
              }

              v16 = v42;
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v24, v20);
              v19 = v41;
              v18 = v43;
              v21 = v45;
            }
            else
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v46 + 40), "configuration"));
              v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v22));
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v35, v22);

            }
            v21 = (char *)v21 + 1;
          }
          while (v21 != v18);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v18);
      }

      v36 = sub_10002A6DC();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = *v39;
        *(_DWORD *)buf = 138543362;
        v58 = (uint64_t)v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%{public}@: Merging ad-hoc configuration", buf, 0xCu);
      }

      objc_msgSend(*v39, "setConfiguration:", v16);
      v6 = 0;
      v5 = v40;
    }
  }

}

id sub_10002AD30(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_10002AD48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC250;
  qword_1000FC250 = (uint64_t)v1;

}

id sub_10002B004()
{
  if (qword_1000FC268 != -1)
    dispatch_once(&qword_1000FC268, &stru_1000CA620);
  return (id)qword_1000FC260;
}

id sub_10002B044(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", "logoutDidCompleteWithError:", a2, 0);
}

void sub_10002B170(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC260;
  qword_1000FC260 = (uint64_t)v1;

}

void sub_10002B2D8(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "assertions", 0));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "cancel");
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

    v7 = *(void **)(a1 + 32);
    v8 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "endOperationWithError:", v9);

  }
}

id sub_10002B778()
{
  if (qword_1000FC278 != -1)
    dispatch_once(&qword_1000FC278, &stru_1000CA640);
  return (id)qword_1000FC270;
}

void sub_10002B7E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC270;
  qword_1000FC270 = (uint64_t)v1;

}

FBSDisplayLayout *__cdecl sub_10002BDD8(id a1, FBSDisplayLayoutMonitor *a2)
{
  return -[FBSDisplayLayoutMonitor stu_currentLayout](a2, "stu_currentLayout");
}

id sub_10002C0C8()
{
  if (qword_1000FC288 != -1)
    dispatch_once(&qword_1000FC288, &stru_1000CA6F0);
  return (id)qword_1000FC280;
}

void sub_10002C1F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002C218(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C2F0;
  v9[3] = &unk_1000CA6A8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = *(id *)(a1 + 32);
  v12 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v13);
}

void sub_10002C2F0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "monitor:forIdentity:didUpdateLayout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void sub_10002C744(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC280;
  qword_1000FC280 = (uint64_t)v1;

}

void sub_10002C774(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10002C854(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void (**v5)(void);
  objc_super v7;
  uint8_t buf[4];
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cancellationBlock"));

  if (v2)
  {
    if (qword_1000FC298 != -1)
      dispatch_once(&qword_1000FC298, &stru_1000CA710);
    v3 = qword_1000FC290;
    if (os_log_type_enabled((os_log_t)qword_1000FC290, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@: Operation cancelled, calling cancelBlock", buf, 0xCu);
    }
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "cancellationBlock"));
    v5[2]();

  }
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)STUCancellableBlockOperation;
  return objc_msgSendSuper2(&v7, "cancel");
}

void sub_10002CA18(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC290;
  qword_1000FC290 = (uint64_t)v1;

}

void sub_10002CE70(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id *v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;

  v6 = a2;
  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v8 = *(void **)(a1 + 32);
      v9 = CATErrorWithCodeAndUserInfo(404, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v8, "failWithUnderlyingError:", v10);

    }
    else
    {
      if (v7)
      {
        v11 = *(id **)(a1 + 32);
        v12 = v7;
      }
      else
      {
        v13 = sub_10002CFD4();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = *(_QWORD *)(a1 + 32);
          v16 = 138543618;
          v17 = v15;
          v18 = 2114;
          v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@: Bundle ID of app handling URL: %{public}@", (uint8_t *)&v16, 0x16u);
        }

        v11 = *(id **)(a1 + 32);
        if (v6)
        {
          objc_storeStrong(v11 + 5, a2);
          objc_msgSend(*(id *)(a1 + 32), "askUserPermisisonWithEnrollmentRecord:", *(_QWORD *)(a1 + 40));
          goto LABEL_11;
        }
        v12 = 0;
      }
      objc_msgSend(v11, "failWithUnderlyingError:", v12);
    }
  }
LABEL_11:

}

id sub_10002CFD4()
{
  if (qword_1000FC2A8 != -1)
    dispatch_once(&qword_1000FC2A8, &stru_1000CA870);
  return (id)qword_1000FC2A0;
}

void sub_10002D698(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002D6B4(uint64_t a1, void *a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  v4 = v10;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v5 = *(void **)(a1 + 32);
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      WeakRetained = v5;
      v9 = v7;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      v7 = WeakRetained;
      v9 = v10;
      if (!v10)
      {
        objc_msgSend(WeakRetained, "waitForDeviceToUnlock");
        goto LABEL_7;
      }
    }
    objc_msgSend(WeakRetained, "failWithUnderlyingError:", v9);
LABEL_7:

    v4 = v10;
  }

}

void sub_10002D9F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[STUSpringBoardServices applicationLaunchFromURLOptionUnlockDeviceKey](STUSpringBoardServices, "applicationLaunchFromURLOptionUnlockDeviceKey"));
  v22[0] = v2;
  v22[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v23[0] = &__kCFBooleanTrue;
  v23[1] = &__kCFBooleanTrue;
  v22[2] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v22[3] = LSBlockUntilCompleteKey;
  v23[2] = &__kCFBooleanTrue;
  v23[3] = &__kCFBooleanTrue;
  v22[4] = LSDisableURLOverrides;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 56)));
  v23[4] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 5));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "primitives"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "launchServicesPrimitives"));
  v8 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  v9 = objc_msgSend(v7, "openURL:withOptions:error:", v8, v4, &v21);
  v10 = v21;

  if ((v9 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
    if (!objc_msgSend(v11, "isEqualToString:", FBSOpenApplicationServiceErrorDomain))
      goto LABEL_8;
    v12 = objc_msgSend(v10, "code");

    if (v12 == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSUnderlyingErrorKey));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "domain"));
      if (!objc_msgSend(v14, "isEqualToString:", FBSOpenApplicationErrorDomain))
      {
LABEL_7:

        goto LABEL_8;
      }
      v15 = objc_msgSend(v11, "code");

      if (v15 == (id)7)
      {
        v14 = v10;
        v10 = 0;
        goto LABEL_7;
      }
LABEL_8:

    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002DC7C;
  v18[3] = &unk_1000C9A68;
  v16 = *(id *)(a1 + 48);
  v19 = v10;
  v20 = v16;
  v17 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

}

uint64_t sub_10002DC7C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10002E0BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002E0F8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evaluateApplicationRestrictedness");

}

void sub_10002E30C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002E338(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  __CFString *v18;

  v5 = a3;
  v6 = sub_10002CFD4();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    if (a2)
      v9 = CFSTR("YES");
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v16 = v8;
    v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Restrictions update has been noted with success: %{public}@", buf, 0x16u);

  }
  if (v5)
  {
    v11 = sub_10002CFD4();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_10007B998(a1, v5);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E4B8;
  block[3] = &unk_1000C9F38;
  objc_copyWeak(&v14, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v14);

}

void sub_10002E4B8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceIsReadyToOpenURL");

}

void sub_10002E884(uint64_t a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v9 = a5;
  v13 = a2;
  v10 = objc_retainBlock(a4);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 64);
  *(_QWORD *)(v11 + 64) = v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = objc_msgSend(*(id *)(a1 + 32), "lockInApp") & a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_10002E92C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v6 = a2;
  v7 = a4;
  if (v6)
  {
    v8 = v6;
LABEL_4:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    goto LABEL_5;
  }
  v8 = *(id *)(a1 + 32);
  if (v8)
    goto LABEL_4;
  v9 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    (*(void (**)(_QWORD, _QWORD, id))(v9 + 16))(*(_QWORD *)(a1 + 48), 0, v7);
  }
  else
  {
    v15 = CFSTR("kCRKURLStringErrorKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "URL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "absoluteURL"));
    v16 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v13 = CRKErrorWithCodeAndUserInfo(13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v14);

  }
LABEL_5:

}

void sub_10002F214(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSSet *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  NSSet *v14;
  uint64_t v15;
  NSSet *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;

  v6 = a2;
  v7 = a4;
  if (*(_BYTE *)(a1 + 64))
  {
    v8 = (NSSet *)*(id *)(a1 + 32);
    if (v6)
    {
      v9 = objc_msgSend(*(id *)(a1 + 40), "lockInApp");
      v10 = sub_10002CFD4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v12)
        {
          v13 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543618;
          v33 = v13;
          v34 = 2114;
          v35 = v6;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: Adding %{public}@ to the whitelist because lockInApp = YES", buf, 0x16u);
        }

        v14 = (NSSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setByAddingObject:", v6));
      }
      else
      {
        if (v12)
        {
          v15 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138543362;
          v33 = v15;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}@: Not reapplying whitelist because lockInApp = NO", buf, 0xCu);
        }

        v14 = objc_opt_new(NSSet);
      }
      v16 = v14;

      v8 = v16;
    }
    if (-[NSSet count](v8, "count"))
    {
      v17 = sub_10002CFD4();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(_QWORD *)(a1 + 40);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet crk_stableDescription](v8, "crk_stableDescription"));
        *(_DWORD *)buf = 138543618;
        v33 = v19;
        v34 = 2114;
        v35 = v20;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}@: Reapplying whitelist of %{public}@", buf, 0x16u);

      }
      v21 = *(void **)(a1 + 48);
      v31 = 0;
      v22 = objc_msgSend(v21, "setBundleIdentifiers:error:", v8, &v31);
      v23 = v31;
      if ((v22 & 1) == 0)
      {
        v24 = sub_10002CFD4();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          sub_10007BB24(a1, v23);

      }
    }

  }
  v26 = sub_10002CFD4();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = *(_QWORD *)(a1 + 40);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "verboseDescription"));
    *(_DWORD *)buf = 138543874;
    v33 = v28;
    v34 = 2114;
    v35 = v6;
    v36 = 2114;
    v37 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%{public}@: LS gave us a handling app of %{public}@. Error: %{public}@", buf, 0x20u);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "restorationBlockForWhitelist:previousState:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32)));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_10002F630(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  if (*(_BYTE *)(a1 + 64))
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "changeToken"));
    if (!(v2 | v3)
      || (v4 = (void *)v3, v5 = objc_msgSend((id)v2, "isEqual:", v3), v4, (v5 & 1) != 0))
    {
      v6 = *(void **)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v22 = 0;
      v8 = objc_msgSend(v6, "setBundleIdentifiers:error:", v7, &v22);
      v9 = v22;
      v10 = sub_10002CFD4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      v12 = v11;
      if (v8)
      {
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
LABEL_11:

          goto LABEL_15;
        }
        v13 = *(_QWORD *)(a1 + 32);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "crk_stableDescription"));
        *(_DWORD *)buf = 138543618;
        v24 = v13;
        v25 = 2114;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@: Restored whitelist to original state of %{public}@", buf, 0x16u);
      }
      else
      {
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          goto LABEL_11;
        v20 = *(_QWORD *)(a1 + 32);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "crk_stableDescription"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject verboseDescription](v9, "verboseDescription"));
        *(_DWORD *)buf = 138543874;
        v24 = v20;
        v25 = 2114;
        v26 = v14;
        v27 = 2114;
        v28 = v21;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to restore whitelist back to original state of %{public}@. Error: %{public}@", buf, 0x20u);

      }
      goto LABEL_11;
    }
    v18 = sub_10002CFD4();
    v9 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v19;
    v17 = "%{public}@: Not restoring whitelist because the change token has advanced";
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, v17, buf, 0xCu);
    goto LABEL_15;
  }
  v15 = sub_10002CFD4();
  v9 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v24 = v16;
    v17 = "%{public}@: Not restoring whitelist because we didn't alter it";
    goto LABEL_14;
  }
LABEL_15:

}

void sub_100030418(uint64_t a1, void *a2)
{
  unsigned int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  v4 = v9;
  if (v3)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v5 = *(void **)(a1 + 32);
      v6 = CATErrorWithCodeAndUserInfo(404, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      objc_msgSend(v5, "failWithUnderlyingError:", v7);

    }
    else
    {
      v8 = *(void **)(a1 + 32);
      if (v9)
        objc_msgSend(v8, "failWithUnderlyingError:", v9);
      else
        objc_msgSend(v8, "waitForTargetApplicationToBecomeActive");
    }
    v4 = v9;
  }

}

void sub_100030D98(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC2A0;
  qword_1000FC2A0 = (uint64_t)v1;

}

void sub_100030DC8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100031440()
{
  if (qword_1000FC2B8 != -1)
    dispatch_once(&qword_1000FC2B8, &stru_1000CA890);
  return (id)qword_1000FC2B0;
}

void sub_1000315AC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC2B0;
  qword_1000FC2B0 = (uint64_t)v1;

}

void sub_100031A7C(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "waitForUnlockOperation"));
  objc_msgSend(v2, "cancel");

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sequentialOperation"));
  objc_msgSend(v3, "cancel");

}

id sub_100033290()
{
  if (qword_1000FC2C8 != -1)
    dispatch_once(&qword_1000FC2C8, &stru_1000CA8B0);
  return (id)qword_1000FC2C0;
}

void sub_1000344C4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC2C0;
  qword_1000FC2C0 = (uint64_t)v1;

}

void sub_100034504(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000348B0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "endOperationWithError:", v8);
LABEL_6:

    goto LABEL_7;
  }
  if (!v5)
  {
    v8 = (void *)objc_opt_new(CRKFetchUserImageResultObject);
    objc_msgSend(v8, "setUserImageData:", v9);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v8);
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", v5);
LABEL_7:

}

id sub_100034BF4()
{
  if (qword_1000FC2D8 != -1)
    dispatch_once(&qword_1000FC2D8, &stru_1000CA8D0);
  return (id)qword_1000FC2D0;
}

void sub_1000352FC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC2D0;
  qword_1000FC2D0 = (uint64_t)v1;

}

void sub_1000353A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(*(_QWORD *)(a1 + 32));
  v2 = (void *)qword_1000FC2E8;
  qword_1000FC2E8 = v1;

}

void sub_100035BC0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

void sub_1000365C0(uint64_t a1, STUConcreteLSAppLink *a2, void *a3)
{
  STUConcreteLSAppLink *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    v5 = a2;
    a2 = -[STUConcreteLSAppLink initWithAppLink:]([STUConcreteLSAppLink alloc], "initWithAppLink:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

id sub_100036804()
{
  if (qword_1000FC2F8 != -1)
    dispatch_once(&qword_1000FC2F8, &stru_1000CA918);
  return (id)qword_1000FC2F0;
}

void sub_100036928(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC2F0;
  qword_1000FC2F0 = (uint64_t)v1;

}

id sub_10003716C(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "endOperationWithError:", a2);
  else
    return objc_msgSend(v2, "endOperationWithResultObject:", 0);
}

void sub_100037548(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "appLockOperation"));
  objc_msgSend(v1, "cancel");

}

id sub_100037BE4()
{
  if (qword_1000FC308 != -1)
    dispatch_once(&qword_1000FC308, &stru_1000CA938);
  return (id)qword_1000FC300;
}

void sub_100038050(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "device"));

    v4 = sub_100037BE4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v3, "isAppLocked")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allOpenApplications"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      v19 = 138543874;
      v20 = v6;
      v21 = 2114;
      v22 = v7;
      v23 = 2114;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: App Locked: %{public}@ Primary App: %{public}@", (uint8_t *)&v19, 0x20u);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allOpenApplications"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier"));
    if (objc_msgSend(v11, "isEqualToString:", v12))
    {
      v13 = objc_msgSend(v3, "isAppLocked");

      if (v13)
      {
        v14 = sub_100037BE4();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = *(_QWORD *)(a1 + 32);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allOpenApplications"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
          v19 = 138543618;
          v20 = v16;
          v21 = 2114;
          v22 = v18;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@: Device app locked to %{public}@", (uint8_t *)&v19, 0x16u);

        }
        objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
      }
    }
    else
    {

    }
  }
}

void sub_1000383EC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC300;
  qword_1000FC300 = (uint64_t)v1;

}

id sub_100038708()
{
  if (qword_1000FC318 != -1)
    dispatch_once(&qword_1000FC318, &stru_1000CA958);
  return (id)qword_1000FC310;
}

void sub_100038790(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC310;
  qword_1000FC310 = (uint64_t)v1;

}

void sub_100038900(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "outputDeviceChangeObservation"));
    objc_msgSend(v2, "invalidate");

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "browsingSession"));
    objc_msgSend(v3, "invalidate");

    v4 = *(void **)(a1 + 32);
    v5 = CATErrorWithCodeAndUserInfo(404, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "endOperationWithError:", v6);

  }
}

void sub_100038AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100038AF0(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100038B68;
  block[3] = &unk_1000C9F38;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100038B68(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evalutateOutputDevices");

}

uint64_t sub_100038CE0(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  if (!v5)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceID"));
    if (!v2)
    {
      v8 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceID"));
  v8 = (uint64_t)objc_msgSend(v6, "isEqual:", v7);

  if (!v5)
    goto LABEL_6;
LABEL_7:

  return v8;
}

STUGenerateInstructorOperation *sub_10003966C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  STUGenerateInstructorOperation *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[STUGenerateInstructorOperation initWithSessionIdentifier:sessionInfo:isQuarantined:daemon:includeImage:]([STUGenerateInstructorOperation alloc], "initWithSessionIdentifier:sessionInfo:isQuarantined:daemon:includeImage:", v6, v5, 0, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  return v7;
}

void sub_100039AFC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC320;
  qword_1000FC320 = (uint64_t)v1;

}

void sub_100039C64(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

void sub_10003A0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A128(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateOrientation");

}

void sub_10003A25C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC330;
  qword_1000FC330 = (uint64_t)v1;

}

void sub_10003A4A8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "currentOutputDeviceObservation"));
    objc_msgSend(v2, "invalidate");

    v3 = *(void **)(a1 + 32);
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v3, "endOperationWithError:", v5);

  }
}

void sub_10003A6CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003A708(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003A780;
  block[3] = &unk_1000C9F38;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_10003A780(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "evaluateCurrentOutputDevice");

}

void sub_10003A7AC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003A850;
  v5[3] = &unk_1000CAA10;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10003A850(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "displayToDeviceDidFinishWithError:", *(_QWORD *)(a1 + 32));

}

id sub_10003B030(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
  if (objc_msgSend(v3, "isFolder"))
  {
    v5 = *(void **)(a1 + 32);
    v6 = objc_msgSend(v3, "identifier");

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "listWithID:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "convertWebBookmarkListToCRKBookmarkArray:collection:", v7, *(_QWORD *)(a1 + 32)));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBookmark folderWithName:children:](CRKBookmark, "folderWithName:children:", v4, v8));

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "address"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRKBookmark leafBookmarkWithName:URL:](CRKBookmark, "leafBookmarkWithName:URL:", v4, v7));
  }

  return v9;
}

BOOL sub_10003B2F4(id a1, STUDevicePropertyProviding *a2)
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProviding key](a2, "key"));
  v3 = v2 == (void *)CRKDeviceIdentifierKey;

  return v3;
}

NSString *__cdecl sub_10003BF14(id a1, STUDevicePropertyProviding *a2)
{
  return (NSString *)-[STUDevicePropertyProviding key](a2, "key");
}

id sub_10003C864(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "tryToOpenApp");
}

void sub_10003C93C(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "realErrorForError:", a2));
  v3 = objc_msgSend(*(id *)(a1 + 32), "shouldRetryAfterError:");
  v4 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "tryToOpenAppIfAttemptsRemainAfterDelay:", 0.1);
  else
    objc_msgSend(v4, "finishWithError:", v5);

}

void sub_10003D51C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC340;
  qword_1000FC340 = (uint64_t)v1;

}

void sub_10003DA30(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC350;
  qword_1000FC350 = (uint64_t)v1;

}

void sub_10003DB1C(id a1)
{
  STUCloudConfiguration_iOS *v1;
  void *v2;

  v1 = objc_opt_new(STUCloudConfiguration_iOS);
  v2 = (void *)qword_1000FC368;
  qword_1000FC368 = (uint64_t)v1;

}

void sub_10003E7A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = CATErrorWithCodeAndUserInfo(404, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v6, "endOperationWithError:", v8);
LABEL_6:

    goto LABEL_7;
  }
  v9 = *(void **)(a1 + 32);
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "makeResultObjectWithData:", v10));
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v8);
    goto LABEL_6;
  }
  objc_msgSend(v9, "endOperationWithError:", v5);
LABEL_7:

}

void sub_10003EB2C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC370;
  qword_1000FC370 = (uint64_t)v1;

}

void sub_10003ECC4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a3);
  }
  else
  {
    v5 = (void *)objc_opt_new(CRKFetchActiveRestrictionUUIDsResultObject);
    objc_msgSend(v5, "setActiveRestrictionUUIDs:", v6);
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v5);

  }
}

void sub_10003F258(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAsking") & 1) == 0)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "searchForOutputDeviceOperation"));
      objc_msgSend(v2, "cancel");

      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "setOutputDeviceOperation"));
      objc_msgSend(v3, "cancel");

      v4 = *(void **)(a1 + 32);
      v5 = CATErrorWithCodeAndUserInfo(404, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      objc_msgSend(v4, "endOperationWithError:", v6);

    }
  }
}

id sub_1000405D0(uint64_t a1, uint64_t a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "containsEDUPayload:", a2);
}

BOOL sub_10004061C(id a1, MCPayload *a2)
{
  MCPayload *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;

  v2 = a2;
  v3 = objc_claimAutoreleasedReturnValue(-[MCPayload type](v2, "type"));
  v4 = kCRKEDUPayloadType;
  if (v3 | kCRKEDUPayloadType)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCPayload type](v2, "type"));
    v6 = objc_msgSend(v5, "isEqual:", v4);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void sub_100040698(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC380;
  qword_1000FC380 = (uint64_t)v1;

}

id sub_100040950(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancel");
}

void sub_100040E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100040E7C()
{
  if (qword_1000FC398 != -1)
    dispatch_once(&qword_1000FC398, &stru_1000CAC30);
  return (id)qword_1000FC390;
}

void sub_100040EBC(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040F34;
  block[3] = &unk_1000C9F38;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100040F34(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationMightHaveBecomeExclusive:", 1);

}

void sub_100040F64(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040FDC;
  block[3] = &unk_1000C9F38;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v2);
}

void sub_100040FDC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "operationMightHaveBecomeExclusive:", 0);

}

void sub_100041520(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC390;
  qword_1000FC390 = (uint64_t)v1;

}

void sub_100041550(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC3A0;
  qword_1000FC3A0 = (uint64_t)v1;

}

void sub_1000418D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100041918(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "passcodeEnabledDidChange");

}

void sub_100041A00(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC3B0;
  qword_1000FC3B0 = (uint64_t)v1;

}

void sub_100041C10(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC3C0;
  qword_1000FC3C0 = (uint64_t)v1;

}

id sub_100041C40(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    if (objc_msgSend(v3, "isEnabled"))
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    else
      v5 = v4;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

CRKCancelable *__cdecl sub_100041CFC(id a1)
{
  return (CRKCancelable *)+[STUSystemStatusActivity cancelableWithIdentifier:](_TtC8studentd23STUSystemStatusActivity, "cancelableWithIdentifier:", STStatusItemIdentifierStudent);
}

CRKCancelable *__cdecl sub_100041D60(id a1)
{
  return (CRKCancelable *)+[STUSystemStatusBackgroundActivity cancelableWithIdentifier:](_TtC8studentd33STUSystemStatusBackgroundActivity, "cancelableWithIdentifier:", STBackgroundActivityIdentifierScreenSharing);
}

CRKCancelable *__cdecl sub_100041DC4(id a1)
{
  return (CRKCancelable *)+[STUSystemStatusActivity cancelableWithIdentifier:](_TtC8studentd23STUSystemStatusActivity, "cancelableWithIdentifier:", STStatusItemIdentifierAirPlay);
}

id sub_100042CC4()
{
  if (qword_1000FC3D8 != -1)
    dispatch_once(&qword_1000FC3D8, &stru_1000CAD30);
  return (id)qword_1000FC3D0;
}

void sub_100042D58(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC3D0;
  qword_1000FC3D0 = (uint64_t)v1;

}

void sub_100042E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100042EBC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "classroomDidLaunch");

}

id sub_100042F58()
{
  if (qword_1000FC3E8 != -1)
    dispatch_once(&qword_1000FC3E8, &stru_1000CAE40);
  return (id)qword_1000FC3E0;
}

BOOL sub_1000430C4(id a1, CRKClassKitCurrentUser *a2)
{
  return -[CRKClassKitCurrentUser isInstructor](a2, "isInstructor");
}

BOOL sub_100043188(id a1, CRKClassKitCurrentUser *a2)
{
  return -[CRKClassKitCurrentUser isStudent](a2, "isStudent");
}

void sub_1000432C8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004339C;
  block[3] = &unk_1000CADB8;
  v12 = a3;
  v13 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v16 = v6;
  v14 = v7;
  v15 = v8;
  v9 = v5;
  v10 = v12;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10004339C(uint64_t a1)
{
  id *v1;
  id v2;
  NSObject *v3;
  void *v5;
  id v6;
  const char *v7;
  uint8_t *v8;
  id v9;
  id v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;

  v1 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = sub_100042F58();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10007C3DC(v1);
    goto LABEL_15;
  }
  v5 = *(void **)(a1 + 40);
  if (!v5)
  {
    v6 = sub_100042F58();
    v3 = objc_claimAutoreleasedReturnValue(v6);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v13 = 0;
    v7 = "Not re-syncing ClassKit because there is no ClassKit current user";
    v8 = (uint8_t *)&v13;
LABEL_14:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v7, v8, 2u);
    goto LABEL_15;
  }
  if ((objc_msgSend(v5, "hasEDUAccount") & 1) == 0)
  {
    v9 = sub_100042F58();
    v3 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_15;
    v12 = 0;
    v7 = "Not re-syncing ClassKit because the current user does not have an EDU account";
    v8 = (uint8_t *)&v12;
    goto LABEL_14;
  }
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))() & 1) != 0)
  {
    _objc_msgSend(*(id *)(a1 + 48), "resyncClassKitWithFacade:", *(_QWORD *)(a1 + 56));
    return;
  }
  v10 = sub_100042F58();
  v3 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v11 = 0;
    v7 = "Not re-syncing ClassKit because the evaluator rejected the current ClassKit user";
    v8 = (uint8_t *)&v11;
    goto LABEL_14;
  }
LABEL_15:

}

void sub_1000434E8(id a1, BOOL a2, NSError *a3)
{
  NSError *v4;
  _QWORD v5[4];
  NSError *v6;
  BOOL v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100043568;
  v5[3] = &unk_1000C9B70;
  v6 = a3;
  v7 = a2;
  v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

}

void sub_100043568(uint64_t a1)
{
  id *v1;
  id v2;
  NSObject *v3;
  id v4;
  uint8_t v5[16];

  v1 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32) || !*(_BYTE *)(a1 + 40))
  {
    v2 = sub_100042F58();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10007C45C(v1);
  }
  else
  {
    v4 = sub_100042F58();
    v3 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Successfully re-synced ClassKit", v5, 2u);
    }
  }

}

void sub_100043620(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC3E0;
  qword_1000FC3E0 = (uint64_t)v1;

}

void sub_100043828(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = sub_100043900();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v8 = 138543362;
      v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%{public}@: Operation canceled", (uint8_t *)&v8, 0xCu);
    }

    v5 = *(void **)(a1 + 32);
    v6 = CATErrorWithCodeAndUserInfo(404, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "cleanupAndFinishWithError:", v7);

  }
}

id sub_100043900()
{
  if (qword_1000FC3F8 != -1)
    dispatch_once(&qword_1000FC3F8, &stru_1000CAE60);
  return (id)qword_1000FC3F0;
}

id sub_100043DD8(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "cleanupAndFinishWithError:", a2);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
  return objc_msgSend(*(id *)(a1 + 40), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("lockState"), 4, "STUAppLockLongRunningOperationObservationContext");
}

void sub_100043EA8(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(_BYTE **)(a1 + 32);
    if (v2[56])
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "context"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device"));
      v5 = objc_msgSend(v4, "lockState");

      if (v5 == (id)1)
      {
        v6 = sub_100043900();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v8 = *(_QWORD *)(a1 + 32);
          v11 = 138543362;
          v12 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Device did unlock", (uint8_t *)&v11, 0xCu);
        }

        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "device"));
        objc_msgSend(v10, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("lockState"), "STUAppLockLongRunningOperationObservationContext");

        objc_msgSend(*(id *)(a1 + 32), "installSingleAppModeRestriction");
      }
    }
  }
}

id sub_100044C88(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "performSelectorOnMainThread:withObject:waitUntilDone:", "guidedAccessActiveStatusDidChange:", 0, 0);
}

void sub_10004549C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC3F0;
  qword_1000FC3F0 = (uint64_t)v1;

}

void sub_1000455F4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

id sub_1000460A4()
{
  if (qword_1000FC408 != -1)
    dispatch_once(&qword_1000FC408, &stru_1000CAE80);
  return (id)qword_1000FC400;
}

void sub_100046170(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "context"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "device"));

    if (objc_msgSend(v3, "lockState") == (id)3)
    {
      objc_msgSend(v3, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CFSTR("lockState"), "kSTUManagementLockOperationObservationContext");
      v4 = sub_1000460A4();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = 138543362;
        v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: classroom lock screen did take effect", (uint8_t *)&v7, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
    }

  }
}

void sub_10004644C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC400;
  qword_1000FC400 = (uint64_t)v1;

}

id sub_100046B34()
{
  if (qword_1000FC428 != -1)
    dispatch_once(&qword_1000FC428, &stru_1000CAF00);
  return (id)qword_1000FC420;
}

void sub_100046BB4(id a1)
{
  NSCache *v1;
  void *v2;

  v1 = objc_opt_new(NSCache);
  v2 = (void *)qword_1000FC410;
  qword_1000FC410 = (uint64_t)v1;

}

NSString *__cdecl sub_100047004(id a1, CRKCertificate *a2)
{
  return (NSString *)-[CRKCertificate fingerprint](a2, "fingerprint");
}

void sub_10004712C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC420;
  qword_1000FC420 = (uint64_t)v1;

}

id sub_100047428()
{
  if (qword_1000FC438 != -1)
    dispatch_once(&qword_1000FC438, &stru_1000CAF20);
  return (id)qword_1000FC430;
}

void sub_1000478F0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC430;
  qword_1000FC430 = (uint64_t)v1;

}

void sub_100047AD4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 40);
  v4 = a2;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rollingCourseIdentitySet"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resultDictionaryForRollingIdentity:", v9));
  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v8);

}

void sub_100047F14(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  void *v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", v3));
  v10 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v4, "setPredicates:", v6);

  v7 = (void *)objc_opt_new(RBSProcessStateDescriptor);
  objc_msgSend(v4, "setStateDescriptor:", v7);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100048038;
  v8[3] = &unk_1000CAF98;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v4, "setUpdateHandler:", v8);

}

void sub_100048038(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000480CC;
  v6[3] = &unk_1000CAF70;
  v7 = a4;
  v8 = *(id *)(a1 + 32);
  v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

void sub_1000480CC(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "previousState"));
  v3 = objc_msgSend(v2, "isRunning");

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "state"));
  v5 = objc_msgSend(v4, "isRunning");

  if ((v3 & 1) == 0)
  {
    if (v5)
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

id sub_100048148(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_10004873C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100048760(uint64_t a1)
{
  id v2;
  unsigned int v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "screenState");
  v3 = objc_msgSend(*(id *)(a1 + 32), "isScreenSaverActive");
  v4 = objc_msgSend(*(id *)(a1 + 32), "lockState");
  if (v2 == (id)1)
    return (v4 == (id)1) & ~v3;
  else
    return 0;
}

void sub_1000487C0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceDidUnlock");

}

void sub_1000488A8(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      objc_msgSend(v3, "endOperationWithError:", v5);

    }
    else
    {
      objc_msgSend(v3, "endOperationWithResultObject:", 0);
    }
  }
}

void sub_1000489FC(id a1)
{
  STUAskAlertModelFactory *v1;
  void *v2;

  v1 = objc_opt_new(STUAskAlertModelFactory);
  v2 = (void *)qword_1000FC448;
  qword_1000FC448 = (uint64_t)v1;

}

void sub_100048F7C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = *(void **)(a1 + 32);
    v3 = CATErrorWithCodeAndUserInfo(404, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(v3);
    objc_msgSend(v2, "endOperationWithError:", v4);

  }
}

void sub_10004A55C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10004A590()
{
  if (qword_1000FC468 != -1)
    dispatch_once(&qword_1000FC468, &stru_1000CB380);
  return (id)qword_1000FC460;
}

id sub_10004A5D0(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "stateDictionary"));

  return v2;
}

void sub_10004A608(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "lockScreenMonitor"));
    objc_msgSend(v2, "dismissClassroomLockScreen");

    +[STUAppLockLongRunningOperation removeCurrentAppLock](STUAppLockLongRunningOperation, "removeCurrentAppLock");
    WeakRetained = v3;
  }

}

id sub_10004A824(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager IDSDirectoryURL](NSFileManager, "IDSDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKFileBasedKeyedDataStore excludedFromiCloudBackupStoreWithDirectoryURL:](CRKFileBasedKeyedDataStore, "excludedFromiCloudBackupStoreWithDirectoryURL:", v2));

  v4 = (void *)objc_opt_new(CRKASMRosterProviderFactory);
  v5 = objc_alloc((Class)CRKIDSFirewallUpdatingRosterProvider);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makeStudentRosterProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "makeInstructorRosterWithoutKeychainAndWithPersonaAdoption"));
  v8 = objc_msgSend(v5, "initWithPrimaryRosterProvider:secondaryRosterProvider:IDSPrimitives:", v6, v7, *(_QWORD *)(a1 + 32));

  v9 = objc_msgSend(objc_alloc((Class)CRKASMPreemptiveIDSMessagingRosterProvider), "initWithRosterProvider:IDSPrimitives:IDSAddressTranslator:dataStore:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v3);
  return v9;
}

void sub_10004AEF8(id a1, NSString *a2)
{
  NSString *v2;
  id v3;
  NSObject *v4;
  int v5;
  NSString *v6;

  v2 = a2;
  v3 = sub_10004A590();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Received notification XPC event. Notification name: %{public}@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10004AFA0(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10004A590();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received filepath keep alive XPC event.", v3, 2u);
  }

}

NSString *__cdecl sub_10004B5AC(id a1, CATTaskSession *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskSession stu_info](a2, "stu_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "classSessionGenerationToken"));

  return (NSString *)v3;
}

BOOL sub_10004C0B4(id a1, CATTaskSession *a2)
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CATTaskSession stu_info](a2, "stu_info"));
  v3 = objc_msgSend(v2, "isIDSSession");

  return v3;
}

id sub_10004C2D4(id a1, CRKCourseInvitation *a2)
{
  return -[CRKCourseInvitation courseIdentifier](a2, "courseIdentifier");
}

void sub_10004C90C(uint64_t a1)
{
  NSMutableArray *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];

  v2 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));

        if (v9)
        {
          v10 = sub_10004A590();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionIdentifier"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "error"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "verboseDescription"));
            *(_DWORD *)buf = 138543618;
            v24 = v13;
            v25 = 2114;
            v26 = v15;
            _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to generate instructor for session identifier %{public}@. Error: %{public}@", buf, 0x16u);

          }
        }
        else
        {
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resultObject"));
          -[NSMutableArray addObject:](v2, "addObject:", v11);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v5);
  }

  v16 = *(_QWORD *)(v18 + 40);
  v17 = -[NSMutableArray copy](v2, "copy");
  (*(void (**)(uint64_t, id))(v16 + 16))(v16, v17);

}

id sub_10004CDEC(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)a1[4];
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierForSession:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stu_info"));

  if (v5 && objc_msgSend(v6, "allowsStudentInitiatedDisconnection"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));
    if (objc_msgSend(v7, "isEqual:", a1[5]))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instructorIdentifier"));
      v9 = objc_msgSend(v8, "isEqualToString:", a1[6]);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_10004CEB8(id a1, CATTaskSession *a2, unint64_t a3, BOOL *a4)
{
  CATTaskSession *v4;
  uint64_t v5;
  id v6;

  v4 = a2;
  v5 = CRKErrorWithCodeAndUserInfo(130, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  -[CATTaskSession invalidateWithError:](v4, "invalidateWithError:", v6);

}

void sub_10004D018(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;
  uint8_t v5[16];

  v2 = sub_10004A590();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "SIGTERM received, cleaning up.", v5, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

  exit(15);
}

void sub_10004DA44(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_10004A590();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10007CAD8(v2);

  }
}

void sub_10004E0D8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeCourseIdentifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("stringValue")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = CRKActiveStudentCoursesDidChangeNotificationName;
  v9[0] = v3;
  v8[0] = CRKActiveStudentCourseIdentifierStringsUserInfoKey;
  v8[1] = CRKActiveInstructorIdentifiersUserInfoKey;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeInstructorIdentifiers"));
  v9[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", v5, 0, v7);

}

void sub_10004E744(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  id v8;

  v8 = a3;
  v5 = a2;
  v6 = objc_opt_class(CATIDSServiceTransport);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

void sub_10004E7FC(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[0] = objc_opt_class(CRKFetchDeviceGestaltRequest);
  v3[1] = objc_opt_class(CRKRemoteConnectionRequest);
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 2));
  v2 = (void *)qword_1000FC458;
  qword_1000FC458 = v1;

}

STUGenerateInstructorOperation *sub_10004EC88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  STUGenerateInstructorOperation *v5;
  void *v6;
  STUGenerateInstructorOperation *v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifierForSession:", v3));
  if (v4)
  {
    v5 = [STUGenerateInstructorOperation alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stu_info"));
    v7 = -[STUGenerateInstructorOperation initWithSessionIdentifier:sessionInfo:isQuarantined:daemon:includeImage:](v5, "initWithSessionIdentifier:sessionInfo:isQuarantined:daemon:includeImage:", v4, v6, objc_msgSend(*(id *)(a1 + 32), "isSessionQuarantined:", v3), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

DMFControlSessionIdentifier *__cdecl sub_10004EF30(id a1, STUGenerateInstructorOperation *a2)
{
  return -[STUGenerateInstructorOperation sessionIdentifier](a2, "sessionIdentifier");
}

id sub_10004F0BC(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v2, "postNotificationName:object:", CRKStudentPermissionsDidChangeNotificationName, 0);

  return _objc_msgSend(*(id *)(a1 + 32), "scheduleConfigurationDidChangeNotification");
}

id sub_10004F3F0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  unsigned int v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  void *v18;

  v2 = sub_10004A590();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Beginning switching task", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  v5 = objc_msgSend(v4, "hasNonSynthesizedEnrollmentRecords");

  v6 = objc_msgSend(*(id *)(a1 + 32), "countOfBonafideClassSessions");
  if (!v5 || !v6)
    return objc_msgSend(*(id *)(a1 + 32), "endUserSwitchTask");
  v7 = sub_10004A590();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientSessions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("sessionUUID")));
    *(_DWORD *)buf = 138543362;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Attempting to notify connected sessions %{public}@", buf, 0xCu);

  }
  v11 = *(void **)(a1 + 32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "nextLoginState", CRKDeviceLoginStateKey)));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  objc_msgSend(v11, "postDevicePropertyChangedNotification:course:", v13, 0);

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "endUserSwitchTask", 0, 1.0);
}

void sub_10004F734(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, objc_msgSend(v2, "configurationType"), 0);

}

void sub_10004F82C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  v3 = objc_msgSend(v2, "setAdHocConfiguration:", *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 48);
  if ((v3 & 1) != 0)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = CRKErrorWithCodeAndUserInfo(7, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
}

void sub_10004F948(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adHocConfiguration"));
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

}

void sub_10004FA4C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  v3 = objc_msgSend(v2, "setProfileConfiguration:", *(_QWORD *)(a1 + 40));

  v4 = *(_QWORD *)(a1 + 48);
  if ((v3 & 1) != 0)
  {
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  }
  else
  {
    v5 = CRKErrorWithCodeAndUserInfo(7, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

  }
}

void sub_10004FB68(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configurationManager"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "effectiveManagedConfiguration"));
  (*(void (**)(uint64_t, void *, _QWORD))(v1 + 16))(v1, v2, 0);

}

uint64_t sub_10004FC6C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t result;
  int v7;
  uint64_t v8;

  v2 = sub_10004A590();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Setting student identifier to %{public}@", (uint8_t *)&v7, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "configurationManager"));
  objc_msgSend(v5, "setActiveUserIdentifier:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "updateSessionBrowser");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t sub_10004FDEC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_10004A590();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Authenticated as %{public}@", (uint8_t *)&v6, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10004FF4C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serverResourceCache"));
  objc_msgSend(v2, "fetchResourceFromURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

id sub_100051D60(id a1, DMFControlSessionIdentifier *a2)
{
  return -[DMFControlSessionIdentifier groupIdentifier](a2, "groupIdentifier");
}

void sub_100051EB0(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)a1[4];
  v6 = a1[5];
  v3 = (void *)a1[6];
  v4 = v3;
  if (!v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  objc_msgSend(v2, "postDevicePropertyChangedNotification:course:", v5, a1[7]);

  if (!v3)
}

void sub_10005273C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC460;
  qword_1000FC460 = (uint64_t)v1;

}

void sub_10005276C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_1000527A0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC470;
  qword_1000FC470 = (uint64_t)v1;

}

uint64_t sub_1000527DC()
{
  uint64_t v0;

  return v0;
}

id sub_100053A00()
{
  if (qword_1000FC488 != -1)
    dispatch_once(&qword_1000FC488, &stru_1000CB3E8);
  return (id)qword_1000FC480;
}

void sub_100053D50(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC480;
  qword_1000FC480 = (uint64_t)v1;

}

id sub_100053E8C(uint64_t a1, void *a2)
{
  return _objc_msgSend(*(id *)(a1 + 32), "stu_whitelistUserEnabledOptionKeyForTripleClickOption:", objc_msgSend(a2, "intValue"));
}

id sub_1000540DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

id sub_1000541E4()
{
  if (qword_1000FC498 != -1)
    dispatch_once(&qword_1000FC498, &stru_1000CB430);
  return (id)qword_1000FC490;
}

void sub_10005433C(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;

  v3 = a2;
  v5 = *(void **)(a1 + 32);
  v4 = (_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "gate"));
  objc_msgSend(v6, "didFinishRenewingCredentials");

  v7 = sub_1000541E4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007CFD0(v4, v3);

    objc_msgSend((id)*v4, "endOperationWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = objc_opt_class(*v4);
      v14 = 138543362;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: Apple Account credential renewal succeeded", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)*v4;
    v12 = CRKErrorWithCodeAndUserInfo(44, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v11, "endOperationWithError:", v13);

  }
}

void sub_100054504(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC490;
  qword_1000FC490 = (uint64_t)v1;

}

uint64_t sub_100054F30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

UIActivityContinuationAction *__cdecl sub_1000550A0(id a1, STUFBSActivityContinuation *a2)
{
  STUFBSActivityContinuation *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = a2;
  v3 = objc_alloc((Class)UIActivityContinuationAction);
  v9[0] = &off_1000D4200;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFBSActivityContinuation type](v2, "type"));
  v9[1] = &off_1000D4218;
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFBSActivityContinuation data](v2, "data"));

  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));
  v7 = objc_msgSend(v3, "initWithSettings:", v6);

  return (UIActivityContinuationAction *)v7;
}

id sub_1000552D4(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "updateInstalledApplicationInfos");
}

NSDictionary *__cdecl sub_100055468(id a1, CRKApplicationInfo *a2)
{
  return (NSDictionary *)-[CRKApplicationInfo dictionaryRepresentation](a2, "dictionaryRepresentation");
}

int64_t sub_1000556E4(id a1, CRKApplicationInfo *a2, CRKApplicationInfo *a3)
{
  CRKApplicationInfo *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRKApplicationInfo bundleIdentifier](a2, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRKApplicationInfo bundleIdentifier](v4, "bundleIdentifier"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

void sub_1000557D8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC4A0;
  qword_1000FC4A0 = (uint64_t)v1;

}

id sub_1000565FC(id a1, CRKDeviceDisplay *a2)
{
  return -[CRKDeviceDisplay dictionaryValue](a2, "dictionaryValue");
}

void sub_100056B6C(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056BC8;
  block[3] = &unk_1000C97E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100056BC8(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setInactiveAccountsAssertionCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "inactiveAccountsAssertionCount") - 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "forceAccountsInactiveBeacon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isForcingAccountsInactive")));
  objc_msgSend(v3, "send:", v2);

}

void sub_100056D3C(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056D98;
  block[3] = &unk_1000C97E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100056D98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setRemoteUsersNotRegisteredAssertionCount:", (char *)objc_msgSend(*(id *)(a1 + 32), "remoteUsersNotRegisteredAssertionCount") - 1);
}

STUSimulatedIDSAccount *sub_100056E7C(uint64_t a1, void *a2)
{
  id v3;
  STUSimulatedIDSAccount *v4;
  void *v5;
  STUSimulatedIDSAccount *v6;

  v3 = a2;
  v4 = [STUSimulatedIDSAccount alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "forceAccountsInactiveBeacon"));
  v6 = -[STUSimulatedIDSAccount initWithAccount:forceInactiveBeacon:](v4, "initWithAccount:forceInactiveBeacon:", v3, v5);

  return v6;
}

id sub_100057730(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "makeObjectsPerformSelector:", "cancel");
}

id sub_100057934()
{
  if (qword_1000FC4B8 != -1)
    dispatch_once(&qword_1000FC4B8, &stru_1000CB600);
  return (id)qword_1000FC4B0;
}

STUCreateTemporaryFileOperation *__cdecl sub_100057974(id a1, CRKOpenFileRequestItem *a2)
{
  CRKOpenFileRequestItem *v2;
  STUCreateTemporaryFileOperation *v3;
  void *v4;
  void *v5;
  STUCreateTemporaryFileOperation *v6;

  v2 = a2;
  v3 = [STUCreateTemporaryFileOperation alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRKOpenFileRequestItem fileData](v2, "fileData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRKOpenFileRequestItem fileName](v2, "fileName"));

  v6 = -[STUCreateTemporaryFileOperation initWithData:name:](v3, "initWithData:name:", v4, v5);
  return v6;
}

id sub_1000579F4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "createFileOperationsDidFinish:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

void sub_100057E64(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC4B0;
  qword_1000FC4B0 = (uint64_t)v1;

}

void sub_100058540(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_init");
  v2 = (void *)qword_1000FC4C8;
  qword_1000FC4C8 = (uint64_t)v1;

}

id sub_100058700()
{
  if (qword_1000FC4D8 != -1)
    dispatch_once(&qword_1000FC4D8, &stru_1000CB620);
  return (id)qword_1000FC4D0;
}

void sub_100058A44(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC4D0;
  qword_1000FC4D0 = (uint64_t)v1;

}

void sub_100058BE0(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = (id)objc_opt_new(CRKFetchActiveInstructorsResultObject);
  objc_msgSend(v4, "setInstructors:", v3);

  objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v4);
}

id sub_100059190(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[4];
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device"));
  v3 = objc_msgSend(v2, "isApplicationOpen:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

  if (v3)
  {
    v4 = sub_1000592D0();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(v6 + 8);
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@: %{public}@ is already open; bailing",
        buf,
        0x16u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  }
  else
  {
    v9 = *(_OWORD *)(a1 + 32);
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100059310;
    v12[3] = &unk_1000C9810;
    v13 = v9;
    return objc_msgSend(v10, "openAppWithBundleIdentifier:completion:", v11, v12);
  }
}

id sub_1000592D0()
{
  if (qword_1000FC4F0 != -1)
    dispatch_once(&qword_1000FC4F0, &stru_1000CB690);
  return (id)qword_1000FC4E8;
}

void sub_100059310(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(const char **)(a1 + 40);
    v10 = NSStringFromSelector(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 74, CFSTR("%@ must be called from the main thread"), v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v3 = *(void **)(a1 + 32);
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      objc_msgSend(v3, "endOperationWithError:", v5);

    }
    else
    {
      v6 = *(void **)(a1 + 32);
      if (v12)
        objc_msgSend(v6, "endOperationWithError:");
      else
        objc_msgSend(v6, "startObservingLockState");
    }
  }

}

void sub_100059A38(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSString *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(const char **)(a1 + 40);
    v10 = NSStringFromSelector(v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("STUOpenAppLockTransferredAppOperation.m"), 135, CFSTR("%@ must be called from the main thread"), v11);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
    {
      v3 = *(void **)(a1 + 32);
      v4 = CATErrorWithCodeAndUserInfo(404, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
      objc_msgSend(v3, "endOperationWithError:", v5);

    }
    else
    {
      v6 = *(_QWORD **)(a1 + 32);
      if (v12)
        objc_msgSend(v6, "endOperationWithError:");
      else
        objc_msgSend(v6, "waitForApplicationWithIdentifierToBecomeActive:", v6[1]);
    }
  }

}

void sub_10005A2FC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC4E8;
  qword_1000FC4E8 = (uint64_t)v1;

}

void sub_10005A56C(id a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
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
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[STUConcreteGlobalNotification scheduledNotifications](STUConcreteGlobalNotification, "scheduledNotifications", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "notificationRef") == a1)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[STUConcreteGlobalNotification scheduledNotifications](STUConcreteGlobalNotification, "scheduledNotifications"));
          objc_msgSend(v11, "removeObject:", v10);

          objc_msgSend(v10, "fireWithResponseFlags:", a2);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

void sub_10005A788(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
  v2 = (void *)qword_1000FC500;
  qword_1000FC500 = v1;

}

void sub_10005A990(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32)));

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_10005B570()
{
  if (qword_1000FC510 != -1)
    dispatch_once(&qword_1000FC510, &stru_1000CB720);
  return (id)qword_1000FC508;
}

id sub_10005B5B0(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "makeCertificateWithData:", a2));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "addCertificate:toAccessGroup:", v3, CFSTR("com.apple.studentd")));
    if (!v4)
    {
      v5 = sub_10005B570();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_10007D0F4(a1, (uint64_t)v3, v6);

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_10005B774(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC508;
  qword_1000FC508 = (uint64_t)v1;

}

id sub_10005BC0C()
{
  if (qword_1000FC520 != -1)
    dispatch_once(&qword_1000FC520, &stru_1000CB740);
  return (id)qword_1000FC518;
}

void sub_10005C2B4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC518;
  qword_1000FC518 = (uint64_t)v1;

}

void sub_10005C7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10005C810(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "maxIdleLengthTimerDidFire");

}

id sub_10005C944()
{
  if (qword_1000FC530 != -1)
    dispatch_once(&qword_1000FC530, &stru_1000CB788);
  return (id)qword_1000FC528;
}

id sub_10005C984(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "invalidateWithError:", *(_QWORD *)(a1 + 32));
}

void sub_10005CF70(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC528;
  qword_1000FC528 = (uint64_t)v1;

}

id sub_10005D2C0(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "deviceNameDidChange");
}

id sub_10005D2C8()
{
  if (qword_1000FC540 != -1)
    dispatch_once(&qword_1000FC540, &stru_1000CB7A8);
  return (id)qword_1000FC538;
}

void sub_10005D410(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC538;
  qword_1000FC538 = (uint64_t)v1;

}

id sub_10005D840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _objc_msgSend(*(id *)(a1 + 32), "downloadTaskForURL:didFinishWithLocation:response:error:completion:", *(_QWORD *)(a1 + 40), a2, a3, a4, *(_QWORD *)(a1 + 48));
}

id sub_10005D85C()
{
  if (qword_1000FC550 != -1)
    dispatch_once(&qword_1000FC550, &stru_1000CB7F0);
  return (id)qword_1000FC548;
}

void sub_10005E0BC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC548;
  qword_1000FC548 = (uint64_t)v1;

}

void sub_10005E230(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "internalOperation"));
  objc_msgSend(v1, "cancel");

}

id sub_10005E948()
{
  if (qword_1000FC570 != -1)
    dispatch_once(&qword_1000FC570, &stru_1000CB830);
  return (id)qword_1000FC568;
}

void sub_10005EB34(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CRKDeviceAllOpenApplicationsKey, CFSTR("lockState"), 0));
  v2 = (void *)qword_1000FC560;
  qword_1000FC560 = v1;

}

void sub_10005EF28(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC568;
  qword_1000FC568 = (uint64_t)v1;

}

void sub_10005F308(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC578;
  qword_1000FC578 = (uint64_t)v1;

}

id sub_10005F4F0(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "crkCourse"));
  objc_msgSend(v3, "setMustRequestUnenroll:", objc_msgSend(*(id *)(a1 + 32), "requestPermissionToLeaveClasses"));
  return v3;
}

id sub_10005F698(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "cancel");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cancel");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "cancel");
}

void sub_10005F748(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v3, "endOperationWithError:", v5);

  }
  else
  {
    objc_msgSend(v3, "askIfNeeded");
  }
}

void sub_10005FD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10005FDC0()
{
  if (qword_1000FC5B0 != -1)
    dispatch_once(&qword_1000FC5B0, &stru_1000CB8D8);
  return (id)qword_1000FC5A8;
}

void sub_10005FE00(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "askForSession");

}

void sub_10005FE2C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "askForFeature");

}

void sub_100060B2C(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_opt_new(CATSerialOperationQueue);
  v2 = (void *)qword_1000FC590;
  qword_1000FC590 = v1;

  objc_msgSend((id)qword_1000FC590, "setMaxConcurrentOperationCount:", -1);
}

void sub_1000610A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC598;
  qword_1000FC598 = (uint64_t)v1;

}

void sub_1000610D4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC5A8;
  qword_1000FC5A8 = (uint64_t)v1;

}

id sub_100061780()
{
  if (qword_1000FC5C0 != -1)
    dispatch_once(&qword_1000FC5C0, &stru_1000CB950);
  return (id)qword_1000FC5B8;
}

uint64_t sub_100061A4C(uint64_t a1)
{

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100061CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100061D28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "refreshCertificatesOperationDidFinish:courseIdentifier:instructorIdentifier:targetIPAddress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

id sub_1000621D0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isForCourseIdentifier:targetIPAddress:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_100062304(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC5B8;
  qword_1000FC5B8 = (uint64_t)v1;

}

void sub_10006279C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    v7 = *(void **)(a1 + 32);
    v8 = CATErrorWithCodeAndUserInfo(404, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v7, "endOperationWithError:", v9);
  }
  else
  {
    if (v6)
    {
      if (qword_1000FC5D0 != -1)
        dispatch_once(&qword_1000FC5D0, &stru_1000CB998);
      v10 = (void *)qword_1000FC5C8;
      if (os_log_type_enabled((os_log_t)qword_1000FC5C8, OS_LOG_TYPE_ERROR))
      {
        v15 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(a1 + 40);
        v16 = v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userIdentifier"));
        v18 = 138543874;
        v19 = v15;
        v20 = 2114;
        v21 = v17;
        v22 = 2114;
        v23 = v6;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch image data for instructor with identifier %{public}@. Error: %{public}@", (uint8_t *)&v18, 0x20u);

      }
    }
    v11 = *(void **)(a1 + 32);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sessionIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sessionInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "instructorWithSessionIdentifier:sessionInfo:user:enrollmentRecord:imageData:", v12, v13, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5));

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", v9);
  }

}

void sub_100062BF0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC5C8;
  qword_1000FC5C8 = (uint64_t)v1;

}

id sub_100062D08(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dictionaryValue");
}

void sub_100062D10(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC5D8;
  qword_1000FC5D8 = (uint64_t)v1;

}

void sub_100062F40(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "userNotification"));
    objc_msgSend(v2, "cancel");

    v3 = *(void **)(a1 + 32);
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v3, "endOperationWithError:", v5);

  }
}

id sub_100063018(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "postUserNotification");
}

void sub_1000631F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100063218(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4[2];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100063298;
  v3[3] = &unk_1000CA0C8;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(v4);
}

void sub_100063298(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "userNotificationDidFinishWithResult:", *(_QWORD *)(a1 + 40));

}

void sub_100063920(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

id sub_1000639A0()
{
  if (qword_1000FC5E8 != -1)
    dispatch_once(&qword_1000FC5E8, &stru_1000CBA00);
  return (id)qword_1000FC5F0;
}

void sub_1000639E0(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("STUFeatureUpdateQueue", 0);
  v2 = (void *)qword_1000FC5F0;
  qword_1000FC5F0 = (uint64_t)v1;

}

void sub_100063DE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100063E0C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "fireTimeout");

}

void sub_100065420(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  id v8;

  v5 = a2;
  v8 = v5;
  if (a3)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
      (*(void (**)(_QWORD, void *, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, objc_msgSend(*(id *)(a1 + 32), "isWebBrowser:", v7), 0);

      goto LABEL_6;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();
LABEL_6:

}

void sub_1000655D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000656A8;
  v11[3] = &unk_1000CBA50;
  v12 = a3;
  v13 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v14 = v6;
  v15 = v7;
  v16 = v8;
  v9 = v5;
  v10 = v12;
  +[NSRunLoop cat_performBlockOnMainRunLoop:](NSRunLoop, "cat_performBlockOnMainRunLoop:", v11);

}

void sub_1000656A8(uint64_t a1)
{
  NSMutableArray *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];

  v2 = objc_opt_new(NSMutableArray);
  v3 = *(void **)(a1 + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "defaultWebBrowserBundleIdentifier"));
  v5 = sub_100041C40(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "length"))
    -[NSMutableArray addObject:](v2, "addObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "URLOverrideForURL:", *(_QWORD *)(a1 + 56)));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "applicationsAvailableForOpeningURL:", v7, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v12), "bundleIdentifier"));
        if (objc_msgSend(v13, "length")
          && (-[NSMutableArray containsObject:](v2, "containsObject:", v13) & 1) == 0)
        {
          -[NSMutableArray addObject:](v2, "addObject:", v13);
        }

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v10);
  }

  v14 = *(_QWORD *)(a1 + 64);
  if (-[NSMutableArray count](v2, "count"))
  {
    (*(void (**)(uint64_t, NSMutableArray *, _QWORD))(v14 + 16))(v14, v2, 0);
  }
  else
  {
    v23 = CFSTR("kCRKURLStringErrorKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "absoluteString"));
    v24 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v17 = CRKErrorWithCodeAndUserInfo(13, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*(void (**)(uint64_t, NSMutableArray *, void *))(v14 + 16))(v14, v2, v18);

  }
}

void sub_100065F1C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC5F8;
  qword_1000FC5F8 = (uint64_t)v1;

}

id sub_10006627C()
{
  if (qword_1000FC610 != -1)
    dispatch_once(&qword_1000FC610, &stru_1000CBAE0);
  return (id)qword_1000FC608;
}

void sub_1000669D4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v8 = CRKCourseInvitationIdentifiersFoundUserInfoKey;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "courseIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
  v7 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));

  objc_msgSend(*(id *)(a1 + 32), "postNotificationWithName:userInfo:", CRKCourseInvitationsUpdatedNotificationName, v6);
}

void sub_100066B0C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC608;
  qword_1000FC608 = (uint64_t)v1;

}

id sub_100068018()
{
  if (qword_1000FC620 != -1)
    dispatch_once(&qword_1000FC620, &stru_1000CBB00);
  return (id)qword_1000FC618;
}

id sub_100068058()
{
  if (qword_1000FC630 != -1)
    dispatch_once(&qword_1000FC630, &stru_1000CBB20);
  return (id)qword_1000FC628;
}

void sub_1000682DC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC618;
  qword_1000FC618 = (uint64_t)v1;

}

void sub_10006830C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC628;
  qword_1000FC628 = (uint64_t)v1;

}

id sub_1000685F4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "cancel");
}

void sub_100068664(uint64_t a1)
{
  unsigned int v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v3, "endOperationWithError:");

  }
  else
  {
    v16 = 0;
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "enqueueOperationWithError:", &v16));
    v6 = v16;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 16);
    *(_QWORD *)(v7 + 16) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setNotificationDelegate:");
    v9 = *(_QWORD **)(a1 + 32);
    if (v9[2])
    {
      v10 = sub_100068820();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(_QWORD *)(v12 + 8);
        v14 = *(_QWORD *)(v12 + 16);
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2114;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "TASK SESSION %{public}@ ENQUEUED OPERATION %{public}@", buf, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addTarget:selector:forOperationEvents:", *(_QWORD *)(a1 + 32), "taskOperationDidProgress:", 8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addTarget:selector:forOperationEvents:", *(_QWORD *)(a1 + 32), "taskOperationDidFinish:", 6);
    }
    else
    {
      objc_msgSend(v9, "endOperationWithError:", v6);
    }

  }
}

id sub_100068820()
{
  if (qword_1000FC640 != -1)
    dispatch_once(&qword_1000FC640, &stru_1000CBB40);
  return (id)qword_1000FC638;
}

void sub_100068E48(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC638;
  qword_1000FC638 = (uint64_t)v1;

}

void sub_10006919C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firewallOperation"));
    objc_msgSend(v2, "cancel");

    v3 = *(void **)(a1 + 32);
    v4 = CATErrorWithCodeAndUserInfo(404, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(v3, "endOperationWithError:", v5);

  }
}

void sub_1000695CC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100069674;
  v10[3] = &unk_1000CBB68;
  v11 = v6;
  v12 = v5;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v7, "fetchFirewallAllowedAppleIDs:", v10);

}

uint64_t sub_100069674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100069770(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = a1 + 32;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v9 + 8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100069838;
    v10[3] = &unk_1000CBBB8;
    v11 = v6;
    v12 = v5;
    objc_msgSend(v8, "addAllowedAppleIDsToFirewall:completion:", v7, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t sub_100069838(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100069930(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v9 = a1 + 32;
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v9 + 8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000699F8;
    v10[3] = &unk_1000CBBB8;
    v11 = v6;
    v12 = v5;
    objc_msgSend(v8, "removeAllowedAppleIDsFromFirewall:completion:", v7, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t sub_1000699F8(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100069B80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObservingChanges");
}

id sub_10006A780()
{
  if (qword_1000FC650 != -1)
    dispatch_once(&qword_1000FC650, &stru_1000CBC00);
  return (id)qword_1000FC648;
}

void sub_10006AD18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006AD40(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "historyOwnerRecheckTimerAction");

}

void sub_10006AEBC(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006AF18;
  block[3] = &unk_1000C97E8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10006AF18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "history");
}

void sub_10006B09C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC648;
  qword_1000FC648 = (uint64_t)v1;

}

void sub_10006B7F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10006B814(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deviceDidUnlockForFirstTime");

}

id sub_10006B900()
{
  if (qword_1000FC660 != -1)
    dispatch_once(&qword_1000FC660, &stru_1000CBDA0);
  return (id)qword_1000FC658;
}

BOOL sub_10006BD90(id a1, STUControlGroupEnrollmentRecord *a2, NSDictionary *a3)
{
  return !-[STUControlGroupEnrollmentRecord isHidden](a2, "isHidden", a3);
}

NSString *__cdecl sub_10006C0C0(id a1, STUControlGroupEnrollmentRecord *a2)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUControlGroupEnrollmentRecord groupUser](a2, "groupUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userIdentifier"));

  return (NSString *)v3;
}

void sub_10006CAE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10006B900();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10007E0C0(v6);

    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didFetchInternetDate:record:completion:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

id sub_10006D51C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "credentialCache"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "keychain"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificateWithPersistentID:", v3));

    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "credentialCache"));
      objc_msgSend(v8, "setObject:forKey:", v5, v3);

    }
    else
    {
      v9 = sub_10006B900();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10007E164(a1, (uint64_t)v3, v10);

      v5 = 0;
    }
  }

  return v5;
}

void sub_10006F6FC(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "featureDataStore"));
  objc_msgSend(v2, "setClassroomStudentRoleEnabled:", v1);

}

void sub_10006F828(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _UNKNOWN **v3;
  void *v4;
  void *v5;
  STUFeature *v6;
  void *v7;
  STUFeature *v8;
  STUFeature *v9;
  void *v10;
  STUFeature *v11;
  STUFeature *v12;
  void *v13;
  STUFeature *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  STUFeature *v20;
  STUFeature *v21;
  void *v22;
  STUFeature *v23;
  uint64_t v24;
  uint64_t v25;
  id obj;
  STUFeature *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v1 = a1;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = *(id *)(a1 + 32);
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v2 = *(_QWORD *)v34;
    v3 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
    v24 = *(_QWORD *)v34;
    v25 = v1;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v34 != v2)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v4);
        v6 = [STUFeature alloc];
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[384], "classroomOpenAppAllowed"));
        v8 = -[STUFeature initWithCRKFeature:enrollmentRecord:](v6, "initWithCRKFeature:enrollmentRecord:", v7, v5);

        v9 = [STUFeature alloc];
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[384], "classroomOpenURLAllowed"));
        v11 = -[STUFeature initWithCRKFeature:enrollmentRecord:](v9, "initWithCRKFeature:enrollmentRecord:", v10, v5);

        v12 = [STUFeature alloc];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3[384], "unpromptedRemoteScreenObservationForced"));
        v14 = -[STUFeature initWithCRKFeature:enrollmentRecord:](v12, "initWithCRKFeature:enrollmentRecord:", v13, v5);

        if (objc_msgSend(v5, "isManaged"))
        {
          v27 = v8;
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRKFeatures allClassroomCRKFeatures](CRKFeatures, "allClassroomCRKFeatures"));
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v30;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v30 != v18)
                  objc_enumerationMutation(v15);
                v20 = -[STUFeature initWithCRKFeature:enrollmentRecord:]([STUFeature alloc], "initWithCRKFeature:enrollmentRecord:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v19), v5);
                -[STUFeature setPermission:](v20, "setPermission:", 1);

                v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v17);
          }

          v1 = v25;
          -[STUFeature setPermission:](v14, "setPermission:", *(_BYTE *)(v25 + 40) == 0);
          v2 = v24;
          v3 = &_s2os6LoggerV9logObjectSo03OS_a1_C0Cvg_ptr;
          v8 = v27;
        }
        -[STUFeature setPermission:](v8, "setPermission:", 1);
        -[STUFeature setPermission:](v11, "setPermission:", 1);

        v4 = (char *)v4 + 1;
      }
      while (v4 != v28);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  if (*(_BYTE *)(v1 + 41) && !*(_BYTE *)(v1 + 40))
  {
    v21 = [STUFeature alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed"));
    v23 = -[STUFeature initWithCRKFeature:](v21, "initWithCRKFeature:", v22);

    -[STUFeature setPermission:](v23, "setPermission:", 1);
  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000CBD30);
}

void sub_10006FB48(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CRKStudentPermissionsDidChangeNotificationName, 0);

}

void sub_10006FC04(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = sub_10006B900();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10007E2B8(v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "didFetchInternetDateForCleanupAdHocEnrollmentRecords:", a2);
  }

}

void sub_10006FD18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;

  v5 = a2;
  if (objc_msgSend(a3, "isTombstoned"))
  {
    v6 = *(void **)(a1 + 32);
    v11 = 0;
    v7 = objc_msgSend(v6, "removeEnrollmentRecordWithIdentifier:error:", v5, &v11);
    v8 = v11;
    if ((v7 & 1) == 0)
    {
      v9 = sub_10006B900();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_10007E330(v8);

    }
  }

}

void sub_100072870(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC658;
  qword_1000FC658 = (uint64_t)v1;

}

void sub_1000728A0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

uint64_t sub_1000728C0(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100072A28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isExecuting"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "initialOpenAppOperation"));
    objc_msgSend(v2, "cancel");

    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "waitForUnlockedStateOperation"));
    objc_msgSend(v3, "cancel");

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "followUpOpenAppOperation"));
    objc_msgSend(v4, "cancel");

    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "waitForOpenedAppToAppearOperation"));
    objc_msgSend(v5, "cancel");

  }
}

id sub_100072D90()
{
  if (qword_1000FC670 != -1)
    dispatch_once(&qword_1000FC670, &stru_1000CBDC0);
  return (id)qword_1000FC668;
}

BOOL sub_100073020(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device"));
  v2 = objc_msgSend(v1, "lockState") == (id)1;

  return v2;
}

id sub_10007344C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "primitives"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "devicePrimitives"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device"));
  v7 = objc_msgSend(v3, "isApplicationOpen:device:", v5, v6);

  return v7;
}

void sub_1000737D0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC668;
  qword_1000FC668 = (uint64_t)v1;

}

void sub_100073A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100073A48(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateScreenLocked");

}

void sub_100073B38(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "DeviceProperty");
  v2 = (void *)qword_1000FC678;
  qword_1000FC678 = (uint64_t)v1;

}

id sub_100075178()
{
  if (qword_1000FC690 != -1)
    dispatch_once(&qword_1000FC690, &stru_1000CBE00);
  return (id)qword_1000FC688;
}

void sub_1000756D0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC688;
  qword_1000FC688 = (uint64_t)v1;

}

void sub_100075700(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7));

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v6, a3);
}

void sub_100075A08(uint64_t a1, uint64_t a2)
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "endOperationWithError:", a2);
  }
  else
  {
    v3 = objc_opt_new(NSMutableDictionary);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "groupIdentifier"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("CourseIdentifier"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("UserIsStudent"));
    v8 = CRKDeviceUserRequestingUnenrollmentKey;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 48)));
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("PropertiesByKey"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("STUUserPropertiesDidChangeNotificationName"), *(_QWORD *)(a1 + 32), v3);

    objc_msgSend(*(id *)(a1 + 32), "endOperationWithResultObject:", 0);
  }
}

void sub_100075B9C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC698;
  qword_1000FC698 = (uint64_t)v1;

}

id sub_100075F50()
{
  if (qword_1000FC6B0 != -1)
    dispatch_once(&qword_1000FC6B0, &stru_1000CBEE8);
  return (id)qword_1000FC6A8;
}

id sub_100075F90(id a1, id a2)
{
  id v2;
  uint64_t v3;
  id v4;

  v2 = a2;
  v3 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = objc_msgSend(objc_alloc((Class)CRKSignInHistoryItem), "initWithDictionary:", v2);
  else
    v4 = 0;

  return v4;
}

id sub_100076188(id a1, CRKSignInHistoryItem *a2)
{
  return -[CRKSignInHistoryItem dictionaryValue](a2, "dictionaryValue");
}

void sub_100076200(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC6A8;
  qword_1000FC6A8 = (uint64_t)v1;

}

void sub_100076270(id a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v5 = 1;
  v1 = container_system_path_for_identifier(0, &v5);
  if (v1)
  {
    v2 = (void *)v1;
    v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:](NSURL, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v1, 1, 0));
    v4 = (void *)qword_1000FC6B8;
    qword_1000FC6B8 = v3;

    free(v2);
  }
}

id sub_100076700()
{
  if (qword_1000FC6D0 != -1)
    dispatch_once(&qword_1000FC6D0, &stru_1000CBF28);
  return (id)qword_1000FC6C8;
}

void sub_1000767A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC6C8;
  qword_1000FC6C8 = (uint64_t)v1;

}

void sub_1000770E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "Operation");
  v2 = (void *)qword_1000FC6D8;
  qword_1000FC6D8 = (uint64_t)v1;

}

void sub_1000777E8(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "valueForKey:", CFSTR("dictionaryRepresentation")));
  if (qword_1000FC6F0 != -1)
    dispatch_once(&qword_1000FC6F0, &stru_1000CBFD0);
  v4 = qword_1000FC6E8;
  if (os_log_type_enabled((os_log_t)qword_1000FC6E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Share targets did change %{public}@", buf, 0xCu);
  }
  v5 = *(void **)(a1 + 32);
  v6 = CRKShareTargetsDidChangeNotificationName;
  v8 = CRKShareTargetsUserInfoKey;
  v9 = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
  objc_msgSend(v5, "postNotificationWithName:userInfo:", v6, v7);

}

void sub_100077A24(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "crk_mapUsingBlock:", &stru_1000CBF88));
  v4 = v3;
  if (!v3)
    v3 = &__NSArray0__struct;
  (*(void (**)(_QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

CRKShareTarget *__cdecl sub_100077A84(id a1, CRKInstructor *a2)
{
  CRKInstructor *v2;
  void *v3;

  v2 = a2;
  if ((-[CRKInstructor disallowsClassroomAirDropOverLocalNetwork](v2, "disallowsClassroomAirDropOverLocalNetwork") & 1) != 0)v3 = 0;
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKShareTarget stu_shareTargetWithInstructor:](CRKShareTarget, "stu_shareTargetWithInstructor:", v2));

  return (CRKShareTarget *)v3;
}

void sub_100077AD4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "General");
  v2 = (void *)qword_1000FC6E8;
  qword_1000FC6E8 = (uint64_t)v1;

}

id sub_100077DA4()
{
  if (qword_1000FC700[0] != -1)
    dispatch_once(qword_1000FC700, &stru_1000CBFF0);
  return (id)qword_1000FC6F8;
}

void sub_100078170(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.classroom", "ASM");
  v2 = (void *)qword_1000FC6F8;
  qword_1000FC6F8 = (uint64_t)v1;

}

uint64_t sub_1000781A4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

id sub_100078284()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STUConcreteMobileKeyBagPrimitives();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id variable initialization expression of STUSystemStatusActivity.publisher()
{
  return objc_msgSend(objc_allocWithZone((Class)STStatusItemsStatusDomainPublisher), "init");
}

uint64_t variable initialization expression of STUSystemStatusBackgroundActivity.currentAttribution()
{
  return 0;
}

id variable initialization expression of STUSystemStatusBackgroundActivity.publisher()
{
  return objc_msgSend(objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainPublisher), "init");
}

uint64_t type metadata accessor for STUConcreteMobileKeyBagPrimitives()
{
  return objc_opt_self(_TtC8studentd33STUConcreteMobileKeyBagPrimitives);
}

void type metadata accessor for STBackgroundActivityIdentifier(uint64_t a1)
{
  sub_10007834C(a1, &qword_1000FBEC0, (uint64_t)&unk_1000CC0B8);
}

void type metadata accessor for STStatusItemIdentifier(uint64_t a1)
{
  sub_10007834C(a1, &qword_1000FBEC8, (uint64_t)&unk_1000CC0E0);
}

void sub_10007834C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_100078390(uint64_t a1, uint64_t a2)
{
  return sub_1000786FC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000783A8(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_10007841C(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100078498@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_1000784DC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100078504(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000785E0(&qword_1000FBF10, (uint64_t (*)(uint64_t))type metadata accessor for STStatusItemIdentifier, (uint64_t)&unk_1000B9314);
  v3 = sub_1000785E0(&qword_1000FBF18, (uint64_t (*)(uint64_t))type metadata accessor for STStatusItemIdentifier, (uint64_t)&unk_1000B92BC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100078588()
{
  return sub_1000785E0(&qword_1000FBED0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusItemIdentifier, (uint64_t)&unk_1000B9284);
}

uint64_t sub_1000785B4()
{
  return sub_1000785E0(&qword_1000FBED8, (uint64_t (*)(uint64_t))type metadata accessor for STStatusItemIdentifier, (uint64_t)&unk_1000B925C);
}

uint64_t sub_1000785E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100078620@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100078664(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1000785E0(&qword_1000FBF00, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1000B9454);
  v3 = sub_1000785E0(&qword_1000FBF08, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1000B93FC);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000786E8(uint64_t a1, uint64_t a2)
{
  return sub_1000786FC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000786FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100078738(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100078778(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_1000787EC()
{
  return sub_1000785E0(&qword_1000FBEE0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusItemIdentifier, (uint64_t)&unk_1000B92EC);
}

uint64_t sub_100078818()
{
  return sub_1000785E0(&qword_1000FBEE8, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1000B93C4);
}

uint64_t sub_100078844()
{
  return sub_1000785E0(&qword_1000FBEF0, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1000B939C);
}

uint64_t sub_100078870(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_1000788F8()
{
  return sub_1000785E0(&qword_1000FBEF8, (uint64_t (*)(uint64_t))type metadata accessor for STBackgroundActivityIdentifier, (uint64_t)&unk_1000B942C);
}

uint64_t sub_100078924()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100078948()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

id sub_100078954(uint64_t (*a1)(), uint64_t a2)
{
  id v4;
  NSString v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  void **v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  uint64_t (*v19)();
  uint64_t v20;

  v4 = objc_msgSend(objc_allocWithZone((Class)CRKConcreteDarwinNotificationPublisher), "init");
  v5 = String._bridgeToObjectiveC()();
  v19 = a1;
  v20 = a2;
  v15 = _NSConcreteStackBlock;
  v16 = 1107296256;
  v17 = sub_1000781A4;
  v18 = &unk_1000CC120;
  v6 = _Block_copy(&v15);
  v7 = v20;
  swift_retain(a2);
  swift_release(v7);
  v8 = objc_msgSend(v4, "subscribeToNotificationWithName:handler:", v5, v6);
  _Block_release(v6);

  if (!v8)
  {
    if (qword_1000FBE30 != -1)
      swift_once(&qword_1000FBE30, sub_100078BB4);
    v9 = type metadata accessor for Logger(0);
    sub_100078B8C(v9, (uint64_t)qword_1000FCD10);
    v10 = Logger.logObject.getter();
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to subscribe to first unlock notification", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v19 = nullsub_3;
    v20 = 0;
    v15 = _NSConcreteStackBlock;
    v16 = 1107296256;
    v17 = sub_1000781A4;
    v18 = &unk_1000CC148;
    v13 = _Block_copy(&v15);
    v8 = objc_msgSend((id)objc_opt_self(CRKBlockCancelable), "cancelableWithBlock:", v13);
    _Block_release(v13);
    swift_release(v20);
  }

  return v8;
}

uint64_t sub_100078B74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100078B84(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100078B8C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_100078BB4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_100078C28(v0, qword_1000FCD10);
  sub_100078B8C(v0, (uint64_t)qword_1000FCD10);
  return Logger.init(subsystem:category:)(0xD000000000000013, 0x80000001000BDDF0, 0x6C6172656E6547, 0xE700000000000000);
}

uint64_t *sub_100078C28(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

id STUSystemStatusActivity.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id result;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution];
  if (!v2)
    goto LABEL_3;
  v3 = *(void **)&v0[OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher];
  v4 = swift_allocObject(&unk_1000CC230, 24, 7);
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_allocObject(&unk_1000CC258, 32, 7);
  *(_QWORD *)(v5 + 16) = sub_10007965C;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_100079678;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000793A0;
  v10[3] = &unk_1000CC270;
  v6 = _Block_copy(v10);
  v7 = v11;
  v8 = v2;
  swift_retain(v5);
  swift_release(v7);
  objc_msgSend(v3, "updateVolatileData:completion:", v6, 0);

  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation(v5, "", 166, 49, 42, 1);
  swift_release(v4);
  result = (id)swift_release(v5);
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_3:
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher], "invalidate");
    v12.receiver = v0;
    v12.super_class = ObjectType;
    return objc_msgSendSuper2(&v12, "dealloc");
  }
  return result;
}

Swift::Void __swiftcall STUSystemStatusActivity.cancel()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution);
  if (v1)
  {
    v2 = *(void **)(v0 + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher);
    v3 = swift_allocObject(&unk_1000CC2A8, 24, 7);
    *(_QWORD *)(v3 + 16) = v1;
    v4 = swift_allocObject(&unk_1000CC2D0, 32, 7);
    *(_QWORD *)(v4 + 16) = sub_10007965C;
    *(_QWORD *)(v4 + 24) = v3;
    v8[4] = sub_100079AB4;
    v9 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_1000793A0;
    v8[3] = &unk_1000CC2E8;
    v5 = _Block_copy(v8);
    v6 = v9;
    v7 = v1;
    swift_retain(v4);
    swift_release(v6);
    objc_msgSend(v2, "updateVolatileData:completion:", v5, 0);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v4, "", 166, 49, 42, 1);
    swift_release(v3);
    swift_release(v4);
    if ((v2 & 1) != 0)
      __break(1u);
  }
}

uint64_t sub_100078FBC(uint64_t result)
{
  uint64_t isEscapingClosureAtFileLocation;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 aBlock;
  __int128 v30;
  uint64_t (*v31)();
  uint64_t v32;

  if ((result & 1) != 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(BSAuditToken), "tokenForCurrentProcess");
    objc_msgSend(v2, "realToken");
    v27 = v30;
    v28 = aBlock;

    v3 = objc_allocWithZone((Class)STActivityAttribution);
    aBlock = v28;
    v30 = v27;
    v4 = objc_msgSend(v3, "initWithAuditToken:", &aBlock);
    v5 = *(void **)(isEscapingClosureAtFileLocation + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_identifier);
    v6 = objc_allocWithZone((Class)STStatusItemsStatusDomainStatusItemAttribution);
    v7 = v5;
    v8 = objc_msgSend(v6, "initWithStatusItemIdentifier:activityAttribution:", v7, v4);

    v9 = *(void **)(isEscapingClosureAtFileLocation + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher);
    v10 = swift_allocObject(&unk_1000CC398, 24, 7);
    *(_QWORD *)(v10 + 16) = v8;
    v11 = swift_allocObject(&unk_1000CC3C0, 32, 7);
    *(_QWORD *)(v11 + 16) = sub_10007986C;
    *(_QWORD *)(v11 + 24) = v10;
    v31 = sub_100079AB4;
    v32 = v11;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000793A0;
    *((_QWORD *)&v30 + 1) = &unk_1000CC3D8;
    v12 = _Block_copy(&aBlock);
    v13 = v32;
    v14 = v8;
    swift_retain(v11);
    swift_release(v13);
    v15 = swift_allocObject(&unk_1000CC410, 24, 7);
    swift_unknownObjectWeakInit(v15 + 16, isEscapingClosureAtFileLocation);
    v16 = swift_allocObject(&unk_1000CC438, 32, 7);
    *(_QWORD *)(v16 + 16) = v15;
    *(_QWORD *)(v16 + 24) = v14;
    v31 = sub_1000798EC;
    v32 = v16;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000781A4;
    *((_QWORD *)&v30 + 1) = &unk_1000CC450;
    v17 = _Block_copy(&aBlock);
    v18 = v32;
    v19 = v14;
    swift_release(v18);
    objc_msgSend(v9, "updateVolatileData:completion:", v12, v17);

    _Block_release(v17);
    _Block_release(v12);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v11, "", 166, 39, 42, 1);
    swift_release(v10);
    result = swift_release(v11);
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return result;
    __break(1u);
  }
  v20 = *(void **)(isEscapingClosureAtFileLocation
                 + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution);
  if (v20)
  {
    v21 = *(void **)(isEscapingClosureAtFileLocation + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher);
    v22 = swift_allocObject(&unk_1000CC320, 24, 7);
    *(_QWORD *)(v22 + 16) = v20;
    v23 = swift_allocObject(&unk_1000CC348, 32, 7);
    *(_QWORD *)(v23 + 16) = sub_10007965C;
    *(_QWORD *)(v23 + 24) = v22;
    v31 = sub_100079AB4;
    v32 = v23;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000793A0;
    *((_QWORD *)&v30 + 1) = &unk_1000CC360;
    v24 = _Block_copy(&aBlock);
    v25 = v32;
    v26 = v20;
    swift_retain(v23);
    swift_release(v25);
    objc_msgSend(v21, "updateVolatileData:completion:", v24, 0);

    _Block_release(v24);
    LOBYTE(v21) = swift_isEscapingClosureAtFileLocation(v23, "", 166, 49, 42, 1);
    swift_release(v22);
    result = swift_release(v23);
    if ((v21 & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_1000793A0(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

uint64_t sub_1000793F4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000798F4();
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_1000CC488, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  aBlock[4] = sub_100079960;
  v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000781A4;
  aBlock[3] = &unk_1000CC4A0;
  v13 = _Block_copy(aBlock);
  v14 = v24;
  swift_retain(a1);
  v15 = a2;
  v16 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v17 = sub_100079968();
  v18 = sub_1000799B0(&qword_1000FBFD0);
  v19 = sub_1000799F0();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_1000795D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution);
    *(_QWORD *)(Strong + OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution) = a2;

    v7 = a2;
  }
}

uint64_t sub_100079638()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

id sub_10007965C(void *a1, void *a2)
{
  return sub_100079878(a1, a2, (SEL *)&selRef_removeAttribution_);
}

uint64_t sub_100079668()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100079678()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100079698(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000796A8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000796B0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id STUSystemStatusBackgroundActivity.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void STUSystemStatusActivity.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("studentd.STUSystemStatusActivity", 32, "init()", 6, 0);
  __break(1u);
}

id _s8studentd23STUSystemStatusActivityC10cancelable10identifierSo13CRKCancelable_pSo22STStatusItemIdentifiera_tFZ_0(void *a1)
{
  objc_class *v2;
  char *v3;
  uint64_t v4;
  id v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;

  v2 = (objc_class *)type metadata accessor for STUSystemStatusActivity();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_publisher;
  v5 = objc_allocWithZone((Class)STStatusItemsStatusDomainPublisher);
  v6 = a1;
  v7 = v3;
  *(_QWORD *)&v3[v4] = objc_msgSend(v5, "init");
  *(_QWORD *)&v7[OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_currentAttribution] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8studentd23STUSystemStatusActivity_identifier] = v6;
  v8 = v6;

  v11.receiver = v7;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, "init");

  sub_100078FBC(1);
  return v9;
}

uint64_t type metadata accessor for STUSystemStatusActivity()
{
  return objc_opt_self(_TtC8studentd23STUSystemStatusActivity);
}

uint64_t sub_10007985C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

id sub_10007986C(void *a1, void *a2)
{
  return sub_100079878(a1, a2, (SEL *)&selRef_addAttribution_);
}

id sub_100079878(void *a1, void *a2, SEL *a3)
{
  uint64_t v3;

  objc_msgSend(a1, *a3, *(_QWORD *)(v3 + 16));
  return objc_msgSend(a2, "setUserInitiated:", 1);
}

uint64_t sub_1000798B4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000798C4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000798EC()
{
  uint64_t v0;

  return sub_1000793F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_1000798F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000FBFC0;
  if (!qword_1000FBFC0)
  {
    v1 = objc_opt_self(OS_dispatch_queue);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000FBFC0);
  }
  return result;
}

uint64_t sub_100079934()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

void sub_100079960()
{
  uint64_t v0;

  sub_1000795D0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_100079968()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000FBFC8;
  if (!qword_1000FBFC8)
  {
    v1 = type metadata accessor for DispatchWorkItemFlags(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for DispatchWorkItemFlags, v1);
    atomic_store(result, (unint64_t *)&qword_1000FBFC8);
  }
  return result;
}

uint64_t sub_1000799B0(uint64_t *a1)
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

unint64_t sub_1000799F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000FBFD8;
  if (!qword_1000FBFD8)
  {
    v1 = sub_100079A3C(&qword_1000FBFD0);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000FBFD8);
  }
  return result;
}

uint64_t sub_100079A3C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id STUSystemStatusBackgroundActivity.__deallocating_deinit()
{
  char *v0;
  objc_class *ObjectType;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id result;
  _QWORD v10[5];
  uint64_t v11;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(v0);
  v2 = *(void **)&v0[OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution];
  if (!v2)
    goto LABEL_3;
  v3 = *(void **)&v0[OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher];
  v4 = swift_allocObject(&unk_1000CC4D8, 24, 7);
  *(_QWORD *)(v4 + 16) = v2;
  v5 = swift_allocObject(&unk_1000CC500, 32, 7);
  *(_QWORD *)(v5 + 16) = sub_10007965C;
  *(_QWORD *)(v5 + 24) = v4;
  v10[4] = sub_100079678;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_1000793A0;
  v10[3] = &unk_1000CC518;
  v6 = _Block_copy(v10);
  v7 = v11;
  v8 = v2;
  swift_retain(v5);
  swift_release(v7);
  objc_msgSend(v3, "updateData:completion:", v6, 0);

  _Block_release(v6);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation(v5, "", 176, 45, 34, 1);
  swift_release(v4);
  result = (id)swift_release(v5);
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
LABEL_3:
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher], "invalidate");
    v12.receiver = v0;
    v12.super_class = ObjectType;
    return objc_msgSendSuper2(&v12, "dealloc");
  }
  return result;
}

Swift::Void __swiftcall STUSystemStatusBackgroundActivity.cancel()()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  uint64_t v9;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution);
  if (v1)
  {
    v2 = *(void **)(v0 + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher);
    v3 = swift_allocObject(&unk_1000CC550, 24, 7);
    *(_QWORD *)(v3 + 16) = v1;
    v4 = swift_allocObject(&unk_1000CC578, 32, 7);
    *(_QWORD *)(v4 + 16) = sub_10007965C;
    *(_QWORD *)(v4 + 24) = v3;
    v8[4] = sub_100079AB4;
    v9 = v4;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_1000793A0;
    v8[3] = &unk_1000CC590;
    v5 = _Block_copy(v8);
    v6 = v9;
    v7 = v1;
    swift_retain(v4);
    swift_release(v6);
    objc_msgSend(v2, "updateData:completion:", v5, 0);

    _Block_release(v5);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation(v4, "", 176, 45, 34, 1);
    swift_release(v3);
    swift_release(v4);
    if ((v2 & 1) != 0)
      __break(1u);
  }
}

uint64_t sub_100079E0C(uint64_t result)
{
  uint64_t isEscapingClosureAtFileLocation;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 aBlock;
  __int128 v30;
  uint64_t (*v31)();
  uint64_t v32;

  if ((result & 1) != 0)
  {
    v2 = objc_msgSend((id)objc_opt_self(BSAuditToken), "tokenForCurrentProcess");
    objc_msgSend(v2, "realToken");
    v27 = v30;
    v28 = aBlock;

    v3 = objc_allocWithZone((Class)STActivityAttribution);
    aBlock = v28;
    v30 = v27;
    v4 = objc_msgSend(v3, "initWithAuditToken:", &aBlock);
    v5 = *(void **)(isEscapingClosureAtFileLocation
                  + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_identifier);
    v6 = objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution);
    v7 = v5;
    v8 = objc_msgSend(v6, "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", v7, v4, 1);

    v9 = *(void **)(isEscapingClosureAtFileLocation
                  + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher);
    v10 = swift_allocObject(&unk_1000CC640, 24, 7);
    *(_QWORD *)(v10 + 16) = v8;
    v11 = swift_allocObject(&unk_1000CC668, 32, 7);
    *(_QWORD *)(v11 + 16) = sub_10007986C;
    *(_QWORD *)(v11 + 24) = v10;
    v31 = sub_100079AB4;
    v32 = v11;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000793A0;
    *((_QWORD *)&v30 + 1) = &unk_1000CC680;
    v12 = _Block_copy(&aBlock);
    v13 = v32;
    v14 = v8;
    swift_retain(v11);
    swift_release(v13);
    v15 = swift_allocObject(&unk_1000CC6B8, 24, 7);
    swift_unknownObjectWeakInit(v15 + 16, isEscapingClosureAtFileLocation);
    v16 = swift_allocObject(&unk_1000CC6E0, 32, 7);
    *(_QWORD *)(v16 + 16) = v15;
    *(_QWORD *)(v16 + 24) = v14;
    v31 = sub_10007A658;
    v32 = v16;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000781A4;
    *((_QWORD *)&v30 + 1) = &unk_1000CC6F8;
    v17 = _Block_copy(&aBlock);
    v18 = v32;
    v19 = v14;
    swift_release(v18);
    objc_msgSend(v9, "updateData:completion:", v12, v17);

    _Block_release(v17);
    _Block_release(v12);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v11, "", 176, 35, 34, 1);
    swift_release(v10);
    result = swift_release(v11);
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return result;
    __break(1u);
  }
  v20 = *(void **)(isEscapingClosureAtFileLocation
                 + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution);
  if (v20)
  {
    v21 = *(void **)(isEscapingClosureAtFileLocation
                   + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher);
    v22 = swift_allocObject(&unk_1000CC5C8, 24, 7);
    *(_QWORD *)(v22 + 16) = v20;
    v23 = swift_allocObject(&unk_1000CC5F0, 32, 7);
    *(_QWORD *)(v23 + 16) = sub_10007965C;
    *(_QWORD *)(v23 + 24) = v22;
    v31 = sub_100079AB4;
    v32 = v23;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v30 = sub_1000793A0;
    *((_QWORD *)&v30 + 1) = &unk_1000CC608;
    v24 = _Block_copy(&aBlock);
    v25 = v32;
    v26 = v20;
    swift_retain(v23);
    swift_release(v25);
    objc_msgSend(v21, "updateData:completion:", v24, 0);

    _Block_release(v24);
    LOBYTE(v21) = swift_isEscapingClosureAtFileLocation(v23, "", 176, 45, 34, 1);
    swift_release(v22);
    result = swift_release(v23);
    if ((v21 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_10007A1F4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[5];
  uint64_t v24;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v22 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000798F4();
  v11 = (void *)static OS_dispatch_queue.main.getter();
  v12 = swift_allocObject(&unk_1000CC730, 32, 7);
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  aBlock[4] = sub_10007A664;
  v24 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000781A4;
  aBlock[3] = &unk_1000CC748;
  v13 = _Block_copy(aBlock);
  v14 = v24;
  swift_retain(a1);
  v15 = a2;
  v16 = swift_release(v14);
  static DispatchQoS.unspecified.getter(v16);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v17 = sub_100079968();
  v18 = sub_1000799B0(&qword_1000FBFD0);
  v19 = sub_1000799F0();
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v18, v19, v4, v17);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_10007A3D0(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  void *v6;
  id v7;
  _BYTE v8[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = *(void **)(Strong + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution);
    *(_QWORD *)(Strong + OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution) = a2;

    v7 = a2;
  }
}

uint64_t sub_10007A438()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10007A45C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10007A46C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10007A47C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10007A484()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void STUSystemStatusBackgroundActivity.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("studentd.STUSystemStatusBackgroundActivity", 42, "init()", 6, 0);
  __break(1u);
}

id _s8studentd33STUSystemStatusBackgroundActivityC10cancelable10identifierSo13CRKCancelable_pSo012STBackgroundE10Identifiera_tFZ_0(void *a1)
{
  objc_class *v2;
  char *v3;
  uint64_t v4;
  id v5;
  id v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;

  v2 = (objc_class *)type metadata accessor for STUSystemStatusBackgroundActivity();
  v3 = (char *)objc_allocWithZone(v2);
  v4 = OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_publisher;
  v5 = objc_allocWithZone((Class)STBackgroundActivitiesStatusDomainPublisher);
  v6 = a1;
  v7 = v3;
  *(_QWORD *)&v3[v4] = objc_msgSend(v5, "init");
  *(_QWORD *)&v7[OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_currentAttribution] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC8studentd33STUSystemStatusBackgroundActivity_identifier] = v6;
  v8 = v6;

  v11.receiver = v7;
  v11.super_class = v2;
  v9 = objc_msgSendSuper2(&v11, "init");

  sub_100079E0C(1);
  return v9;
}

uint64_t type metadata accessor for STUSystemStatusBackgroundActivity()
{
  return objc_opt_self(_TtC8studentd33STUSystemStatusBackgroundActivity);
}

uint64_t sub_10007A610()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10007A620()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10007A630()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10007A658()
{
  uint64_t v0;

  return sub_10007A1F4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10007A664()
{
  uint64_t v0;

  sub_10007A3D0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_10007A6A0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = CFSTR("com.apple.system.powersources.source");
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to register for notification named \"%@\" with notification status %@", buf, 0x16u);

}

void sub_10007A708(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to calculate the battery level for this device due to invalid battery values (%@)", (uint8_t *)&v2, 0xCu);
}

void sub_10007A77C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to register for %{public}@ notifications", buf, 0xCu);

}

void sub_10007A7D0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown ACAccountCredentialRenewResult: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_10007A844(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v8 = 138543874;
  v9 = v5;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to clear IDS cache for instructor Apple Account %{public}@, course identifier %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

void sub_10007A910(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fileName"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to migrate: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_10007A9A4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "verboseDescription"));
  v7 = 138543618;
  v8 = v4;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to fetch %{public}@, which should be installed: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10007AA60(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "verboseDescription"));
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to prune events before %{public}@. Error: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10007AB1C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to close event store database. Error: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_10007ABB0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100012208();
  sub_100012214(v1, v2, 5.8381e-34);
  sub_1000121F0((void *)&_mh_execute_header, v3, v4, "Failed to reopen database %{public}@", v5);

  sub_100012200();
}

void sub_10007ABEC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100012208();
  sub_100012214(v1, v2, 5.8381e-34);
  sub_1000121F0((void *)&_mh_execute_header, v3, v4, "Failed to delete database file. Error: %{public}@", v5);

  sub_100012200();
}

void sub_10007AC28()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100012208();
  sub_100012214(v1, v2, 5.8381e-34);
  sub_1000121F0((void *)&_mh_execute_header, v3, v4, "Failed to close database connection for migration %{public}@", v5);

  sub_100012200();
}

void sub_10007AC64()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  sub_100012208();
  sub_100012214(v1, v2, 5.8381e-34);
  sub_1000121F0((void *)&_mh_execute_header, v3, v4, "Failed to get db schema version %{public}@", v5);

  sub_100012200();
}

void sub_10007ACA0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v2 = *a1;
  v3 = 138543618;
  v4 = v2;
  v5 = 2048;
  v6 = 0x3FF0000000000000;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to assign user, trying again in %f seconds", (uint8_t *)&v3, 0x16u);
}

void sub_10007AD28(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error creating directory in SpringBoard file cache backed keyed data store: %{public}@", (uint8_t *)&v5, 0xCu);

}

void sub_10007ADCC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015318();
  sub_100015304((void *)&_mh_execute_header, v0, v1, "%{public}@: Failed to add certificate %{public}@ to keychain");
}

void sub_10007AE30()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015318();
  sub_100015304((void *)&_mh_execute_header, v0, v1, "%{public}@: Failed to initialize certificate %{public}@ from data");
}

void sub_10007AE94(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "key"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "debugDescription"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to fetch value for %@: %@", (uint8_t *)&v8, 0x16u);

}

void sub_10007AF64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "ASMClassSessionBrowser received an invitation to connect without any course information. Dropping invitation.", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007AF90(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userInfo"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "ASMClassSessionBrowser received an invitation to connect with malformed course information: %{public}@. Dropping invitation.", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007B00C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "ASMClassSessionBrowser received an invitation to connect to an unenrolled class. Dropping invitation.", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007B038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "ASMClassSessionBrowser received an invitation from an instructor that was not a trusted user of the course. Dropping invitation.", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007B064()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "ASMClassSessionBrowser received a rejection to connect over IDS. This student cannot initiate connections.", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007B090(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "destinationAppleID"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "ASMClassSessionBrowser timed out attmepting to connect to instructor %{public}@ after accepting their invitation", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007B10C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received an unexpected notification response", v1, 2u);
}

void sub_10007B14C(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "identifier"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to find notification with identifier %{public}@ to re-register", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007B1CC(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to re-register notification with identifier %{public}@. Error: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10007B290(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "An error occurred displaying a user notification: %{public}@", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007B30C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create invitation identity", v1, 2u);
}

void sub_10007B34C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringValue"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Certificate presented by instructor for class session %{public}@ has no instructor identifier in the common name", (uint8_t *)&v4, 0xCu);

}

void sub_10007B3E0(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to store user image %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_10007B490(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to add certificate %{public}@ to keychain", (uint8_t *)&v2, 0xCu);
}

void sub_10007B504(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not find course with identifier", v1, 2u);
}

void sub_10007B544(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "verboseDescription"));
  sub_100020490((void *)&_mh_execute_header, v3, v4, "Fetch courses operation did fail: %{public}@", v5, v6, v7, v8, 2u);

}

void sub_10007B5E0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Did fail to fetch internet date and time for STUFetchNumberOfDaysBeforeAutomaticRemovalOperation: %{public}@", v4, v5, v6, v7, 2u);

}

void sub_10007B664()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015318();
  sub_100015304((void *)&_mh_execute_header, v0, v1, "Failed to deserialize data in %{public}@: %{public}@");
  sub_100026BB0();
}

void sub_10007B6C4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015318();
  sub_100015304((void *)&_mh_execute_header, v0, v1, "Failed to write data for key %{public}@: %{public}@");
  sub_100026BB0();
}

void sub_10007B724(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create directory %{public}@", (uint8_t *)&v2, 0xCu);
  sub_100026BB0();
}

void sub_10007B794(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;

  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "verboseDescription"));
  v7 = 138543618;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error fetching LSApplication record for %{public}@: %{public}@", (uint8_t *)&v7, 0x16u);

}

void sub_10007B850(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch adhoc configuration", (uint8_t *)&v3, 0xCu);
}

void sub_10007B8C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002C774((void *)&_mh_execute_header, a2, a3, "Display identity %{public}@ connected twice without an intervening disconnect -- this shouldn't happen!", a5, a6, a7, a8, 2u);
}

void sub_10007B930(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10002C774((void *)&_mh_execute_header, a2, a3, "Display identity %{public}@ disconnected without connecting first -- this shouldn't happen!", a5, a6, a7, a8, 2u);
}

void sub_10007B998(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to notify restrictions update for opens. Error: %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007BA1C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Request doesn't contain any suggested bundle identifiers", (uint8_t *)&v2, 0xCu);
}

void sub_10007BA90(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "%{public}@: Failed to suspend whitelist. Error: %{public}@", v4, v5, v6, v7, 2u);

  sub_100030DDC();
}

void sub_10007BB24(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to reapply whitelist. Error: %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007BBA8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000344F4();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "INVITE SESSION INVALIDATING %{public}@ %{public}@", v5, v6, v7, v8, 2u);

  sub_100030DDC();
}

void sub_10007BC34(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringValue"));
  v5 = 138543362;
  v6 = v3;
  sub_100034504((void *)&_mh_execute_header, a2, v4, "INVITE SESSION DISCONNECTING %{public}@", (uint8_t *)&v5);

}

void sub_10007BCC0(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000344F4();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "INVITE SESSION INTERRUPTION %{public}@ %{public}@", v5, v6, v7, v8, 2u);

  sub_100030DDC();
}

void sub_10007BD4C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_100034504((void *)&_mh_execute_header, a2, a3, "No invitation identity found for endpoint %{public}@", (uint8_t *)&v3);
}

void sub_10007BDB8(void *a1)
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "verboseDescription"));
  sub_1000344F4();
  sub_100030DC8((void *)&_mh_execute_header, v7, v8, "%{public}@: %{public}@", v9, v10, v11, v12, 2u);

  sub_100030DDC();
}

void sub_10007BE68(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Did fail to fetch default web broser bundle identifier", v1, 2u);
}

void sub_10007BEA8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v5 = 138543362;
  v6 = v3;
  sub_100034504((void *)&_mh_execute_header, a2, v4, "Did fail to fetch default web broser bundle identifier: %{public}@", (uint8_t *)&v5);

}

void sub_10007BF34(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_100034504((void *)&_mh_execute_header, a2, a3, "Did fail to check if bundle identifier is a browser: %{public}@", (uint8_t *)&v3);
}

void sub_10007BFA0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Did fail to check if bundle identifier is a browser: %{public}@ with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_10007C024(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemURL"));
  sub_1000387C0();
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "Failed to remove item %{public}@: %{public}@", v4, v5, v6, v7, v8);

  sub_100030DDC();
}

void sub_10007C0A4(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemURL"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to delete not empty directory: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_10007C138(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "itemURL"));
  sub_1000387C0();
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "Failed to fetch directory contents: %{public}@: %{public}@", v4, v5, v6, v7, v8);

  sub_100030DDC();
}

void sub_10007C1B8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session %{public}@ has a nil identifier", (uint8_t *)&v2, 0xCu);
}

void sub_10007C22C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to fetch list of user profiles", v1, 2u);
}

void sub_10007C26C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to become exclusive", v1, 2u);
}

void sub_10007C2AC(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to register for notification named \"%@\" with notification status %@", buf, 0x16u);

}

void sub_10007C310(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourceURL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "destinationURL"));
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to move item %{public}@ to %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

void sub_10007C3DC(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "verboseDescription"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Not re-syncing ClassKit becuase fetching the current user failed: %{public}@", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007C45C(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "verboseDescription"));
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to re-sync ClassKit: %{public}@", v4, v5, v6, v7, 2u);

  sub_1000204B8();
}

void sub_10007C4DC(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "%{public}@: Failed to set whitelisted bundle identifiers: %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007C560(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "error"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "%{public}@: Failed to open transferred app: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007C5F4()
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
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v1, v2, "Failed to set user tmp directory suffix: %{public}s", v3, v4, v5, v6, v7);
  sub_1000204B8();
}

void sub_10007C66C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to delete vestigial Settings UI visibility indicator file: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007C6E4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to purge event store due to date invalidation. Error: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007C75C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v2 = objc_msgSend((id)sub_1000527DC(), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "Failed to set NSURLIsExcludedFromBackupKey = YES on event database directory: %{public}@. Error: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007C7EC(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v2 = objc_msgSend((id)sub_1000527DC(), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "Failed to create event database directory: %{public}@. Error: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007C87C(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "path"));
  v2 = objc_msgSend((id)sub_1000527DC(), "verboseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "Failed to delete OLD log event database at path %{public}@. Error: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007C90C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Leader identity configured on a shared device", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007C938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "studentd is unconfigured because it can't find it's identitities in the keychain", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007C964()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "studentd is unconfigured because there are no organizations", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007C990()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "studentd is unconfigured because the EDU payload was installed by user enrollment", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007C9BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "studentd is unconfigured because the device is unsupervised", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007C9E8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Could not create the studentd isConnected keepalive file: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007CA60(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Could not remove the studentd isConnected keepalive file: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007CAD8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Unable to reset requesting unenrollment state: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007CB50(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringValue"));
  sub_1000527D0();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Instructor %{public}@ has received screenshot", v6, 0xCu);

  sub_100030DDC();
}

void sub_10007CBFC(void *a1, NSObject *a2)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Denying connection from (%d) as it lacks a valid entitlement (com.apple.studentd-access or com.apple.studentd.configuration).", (uint8_t *)v3, 8u);
}

void sub_10007CC84(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "TASK SESSION INVALIDATING %{public}@ %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007CD08()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_1000527D0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "TASK SESSION DISCONNECTING %{public}@", v1, 0xCu);
}

void sub_10007CD78(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "TASK SESSION INTERRUPTION %{public}@ %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007CDFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "TASK SESSION TIMED OUT WHILE DISCONNECTED, INVALIDATING...", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007CE28(uint64_t a1)
{
  void *v1;
  objc_class *v2;
  NSString *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v2 = (objc_class *)objc_opt_class(a1);
  v3 = NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue(v3);
  v4 = objc_msgSend((id)sub_1000527DC(), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "verboseDescription"));
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v7, v8, "%{public}@: %{public}@", v9, v10, v11, v12, v13);

  sub_100030DDC();
}

void sub_10007CECC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Class session browser failed with error %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007CF44(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_opt_class(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "%{public}@: Not prompting the user to renew their Apple Account credentials: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007CFD0(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_opt_class(*a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_100030DEC();
  sub_100030DC8((void *)&_mh_execute_header, v4, v5, "%{public}@: Apple Account credential renewal failed: %{public}@", v6, v7, v8, v9, v10);

  sub_100030DDC();
}

void sub_10007D060(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to force reset the app whitelist: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_10007D0F4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@: Failed to add certificate %{public}@ to keychain", (uint8_t *)&v4, 0x16u);
}

void sub_10007D17C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Idle monitor reached max idle time. Invalidatinig IDS task sessions", v1, 2u);
}

void sub_10007D1BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020480((void *)&_mh_execute_header, a1, a3, "Unable to create System Configuration dynamic store", a5, a6, a7, a8, 0);
  sub_1000204A4();
}

void sub_10007D1EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020480((void *)&_mh_execute_header, a1, a3, "Unable to set up notifications for keys from System Configuration dynamic store", a5, a6, a7, a8, 0);
  sub_1000204A4();
}

void sub_10007D21C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100020480((void *)&_mh_execute_header, a1, a3, "Unable to set the notification dispatch queue for the System Configuration dynamic store", a5, a6, a7, a8, 0);
  sub_1000204A4();
}

void sub_10007D24C(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_100034504((void *)&_mh_execute_header, a2, a3, "Downloading %{public}@", (uint8_t *)&v3);
}

void sub_10007D2B8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v5 = 138543362;
  v6 = v3;
  sub_100034504((void *)&_mh_execute_header, a2, v4, "Failed to remove all cached resources: %{public}@", (uint8_t *)&v5);

}

void sub_10007D344(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Removing all cached resources", v1, 2u);
}

void sub_10007D384(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "Failed to fetch %{public}@ from data store: %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007D408(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v3, v4, "Failed to store data for %{public}@ in data store: %{public}@", v5, v6, v7, v8, v9);

  sub_100030DDC();
}

void sub_10007D48C(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to remove all events from store: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_10007D520(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to store event %{public}@. Error: %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_10007D5D0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Dropping event %{public}@ because we are not recording", (uint8_t *)&v2, 0xCu);
}

void sub_10007D644(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No feature authenticator defined. Assuming everying is authenticated", v1, 2u);
}

void sub_10007D684()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_100061104();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "error"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "%{public}@: Failed to wake screen: %{public}@", v4, v5, v6, v7, v8);

  sub_100030DDC();
}

void sub_10007D704()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_100061104();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLong:](NSNumber, "numberWithUnsignedLong:", objc_msgSend(v0, "selectedResponse")));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "%{public}@: Unhandled user notification response: %{public}@", v4, v5, v6, v7, v8);

  sub_100030DDC();
}

void sub_10007D798()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_100061104();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "error"));
  sub_1000454CC();
  sub_100030DC8((void *)&_mh_execute_header, v2, v3, "%{public}@: User notification operation failed. Error: %{public}@", v4, v5, v6, v7, v8);

  sub_100030DDC();
}

void sub_10007D818(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@: Failing with no underlying error", (uint8_t *)&v2, 0xCu);
}

void sub_10007D88C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to report analytics event %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10007D900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000527D0();
  sub_10002C774((void *)&_mh_execute_header, v0, v1, "%{public}@: student information not provided", v2, v3, v4, v5, v6);
  sub_100026BB0();
}

void sub_10007D960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000527D0();
  sub_10002C774((void *)&_mh_execute_header, v0, v1, "%{public}@: student does not have a display name", v2, v3, v4, v5, v6);
  sub_100026BB0();
}

void sub_10007D9C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000527D0();
  sub_10002C774((void *)&_mh_execute_header, v0, v1, "%{public}@: Tried to accept an invitation that does not exist", v2, v3, v4, v5, v6);
  sub_100026BB0();
}

void sub_10007DA20(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "verboseDescription"));
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: Failed to accept course invitation with provided pin code %{public}@", (uint8_t *)&v6, 0x16u);

}

void sub_10007DAD0(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to enroll in course with user entered pin %{public}@", v4, 0xCu);

}

void sub_10007DB60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000527D0();
  sub_10002C774((void *)&_mh_execute_header, v0, v1, "%{public}@: User cancelled pin code prompt", v2, v3, v4, v5, v6);
  sub_100026BB0();
}

void sub_10007DBC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to read Sign In data from storage", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DBEC(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to read Sign In History plist: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007DC64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In data from storage", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DC90(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to encode Sign In History data: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007DD08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In data to dictionary from storage", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DD34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to create Sign In History plist data", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DD60(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to create Sign In History plist data: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007DDD8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to write Sign In History file with unknown error", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DE04(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to write Sign In History file: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007DE7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Sign-in current AppleID is empty", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DEA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Sign-in history owner AppleID is empty", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DED4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Sign-in history owner AppleID is different from current user AppleID", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DF00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to remove Sign In data with unknown error", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007DF2C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to remove Sign In History plist: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007DFA4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Failed to delete old cloud directory: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007E01C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Invalid managed configuration; EDU payload is not installed. Returning nil.",
    v2,
    v3,
    v4,
    v5,
    v6);
  sub_1000204A4();
}

void sub_10007E048(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Did fail to upsert enrollment record: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007E0C0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Did fail to fetch internet date and time for -setRequestUnenroll: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007E138()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to find a persistent to present for client identity", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E164(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "stringValue"));
  sub_1000527D0();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to retrieve trusted anchor for course (%{public}@) with persistentID %{public}@", v6, 0x16u);

}

void sub_10007E210()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "taskOperation:needsToEnqueueOperation: in STUConfigurationManager was called. This should not happen.", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E23C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Keychain failure: The identity cannot be found because it failed to ingest it from the student profile. This should never happen", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E268(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_1000728C0(a1, a2), "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138543362;
  *v2 = v5;
  sub_1000728A0((void *)&_mh_execute_header, v6, v7, "Failed to upsert enrollment record: %{public}@");

  sub_1000728B4();
}

void sub_10007E2B8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Did fail to fetch internet date and time for -cleanupAdHocEnrollmentRecords: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007E330(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  sub_1000527D0();
  sub_100020490((void *)&_mh_execute_header, v2, v3, "Did fail to remove enrollment record: %{public}@", v4, v5, v6, v7, v8);

  sub_1000204B8();
}

void sub_10007E3A8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)sub_1000728C0(a1, a2), "verboseDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138543362;
  *v2 = v5;
  sub_1000728A0((void *)&_mh_execute_header, v6, v7, "Did fail to upsert enrollment record: %{public}@");

  sub_1000728B4();
}

void sub_10007E3F8(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to register for notification named \"%@\" with notification status %@", buf, 0x16u);

}

void sub_10007E468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In data to array from dictionary", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In historyVersion value to number from dictionary", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E4C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In truncated value to number from dictionary", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E4EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000204AC();
  sub_100020480((void *)&_mh_execute_header, v0, v1, "Failed to cast Sign In ownerAppleId value to string from dictionary", v2, v3, v4, v5, v6);
  sub_1000204A4();
}

void sub_10007E518(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find image named \"%{public}@\" in bundle (%{public}@)", (uint8_t *)&v3, 0x16u);
}

void sub_10007E59C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to store image named \"%{public}@\" in studentd's temporary directory", (uint8_t *)&v2, 0xCu);
}

void sub_10007E610(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Identity certificate has nil data representation", v1, 2u);
}

void sub_10007E650(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "verboseDescription"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to ingest requester certificate with error: %{public}@", (uint8_t *)&v4, 0xCu);

}

id objc_msgSend_ASMClassSessionBrowser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ASMClassSessionBrowser");
}

id objc_msgSend_ASMCourseLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ASMCourseLibrary");
}

id objc_msgSend_ASMEventHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ASMEventHandler");
}

id objc_msgSend_ASMSessionIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ASMSessionIdentifiers");
}

id objc_msgSend_CRKAppLockErrorForBundleIdentifier_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CRKAppLockErrorForBundleIdentifier:underlyingError:");
}

id objc_msgSend_CRKFavoritesFolderWithCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CRKFavoritesFolderWithCollection:");
}

id objc_msgSend_CRKFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CRKFeature");
}

id objc_msgSend_CRKReadingListFolderWithCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CRKReadingListFolderWithCollection:");
}

id objc_msgSend_DMFAppLockErrorForBundleIdentifier_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DMFAppLockErrorForBundleIdentifier:underlyingError:");
}

id objc_msgSend_DMFErrorByTranslatingCRKError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DMFErrorByTranslatingCRKError:");
}

id objc_msgSend_DMFErrorByTranslatingCRKErrorIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DMFErrorByTranslatingCRKErrorIfNeeded:");
}

id objc_msgSend_EDUPayloadInstalledByUserEnrollment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "EDUPayloadInstalledByUserEnrollment");
}

id objc_msgSend_IDSAddressTranslator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSAddressTranslator");
}

id objc_msgSend_IDSCacheClearer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSCacheClearer");
}

id objc_msgSend_IDSDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSDirectoryURL");
}

id objc_msgSend_IDSLocalConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSLocalConfiguration");
}

id objc_msgSend_IDSLocalPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSLocalPrimitives");
}

id objc_msgSend_IDSLocalSimulation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSLocalSimulation");
}

id objc_msgSend_IDSMessageBroadcaster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSMessageBroadcaster");
}

id objc_msgSend_IDSMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSMigrationTasks");
}

id objc_msgSend_IDSPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSPrimitives");
}

id objc_msgSend_IDSTaskSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IDSTaskSessions");
}

id objc_msgSend_IPAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "IPAddress");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForRequest:");
}

id objc_msgSend_URLOverrideForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLOverrideForURL:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_XPCConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "XPCConnection");
}

id objc_msgSend_XPCPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "XPCPrimitives");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_init");
}

id objc_msgSend__openWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_openWithError:");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteURL");
}

id objc_msgSend_acceptCourseInvitationWithIdentifier_pin_studentInformation_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptCourseInvitationWithIdentifier:pin:studentInformation:error:");
}

id objc_msgSend_acceptInvitationWithPin_studentInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptInvitationWithPin:studentInformation:");
}

id objc_msgSend_acceptJoinPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptJoinPrompt");
}

id objc_msgSend_acceptPermissionPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptPermissionPrompt");
}

id objc_msgSend_acceptedInvitationIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptedInvitationIdentifiers");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account");
}

id objc_msgSend_accountNeedsMoreTimeToSettle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountNeedsMoreTimeToSettle");
}

id objc_msgSend_accountPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPrimitives");
}

id objc_msgSend_accountState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountState");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_accountsPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsPrimitives");
}

id objc_msgSend_acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:");
}

id objc_msgSend_acquireConnectWithoutBeaconAssertionForSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireConnectWithoutBeaconAssertionForSessionIdentifier:");
}

id objc_msgSend_acquireDaemonActivityAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireDaemonActivityAssertion");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "action");
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionHandler");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionRequest");
}

id objc_msgSend_actionValueForResponse_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionValueForResponse:action:");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_actionsFromSTUActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionsFromSTUActivities:");
}

id objc_msgSend_activeCourseIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCourseIdentifiers");
}

id objc_msgSend_activeCoursesDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeCoursesDidChange");
}

id objc_msgSend_activeIDSClassSessionAssertionProviderWithPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeIDSClassSessionAssertionProviderWithPrefix:");
}

id objc_msgSend_activeIdentityPersistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeIdentityPersistentID");
}

id objc_msgSend_activeInstructorIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInstructorIdentifiers");
}

id objc_msgSend_activeInstructorUsers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInstructorUsers");
}

id objc_msgSend_activeInstructorUsersBySession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInstructorUsersBySession");
}

id objc_msgSend_activeRestrictionUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeRestrictionUUIDs");
}

id objc_msgSend_activeRouteDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeRouteDictionary");
}

id objc_msgSend_activeSessionIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeSessionIdentifiers");
}

id objc_msgSend_activeUserIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeUserIdentifier");
}

id objc_msgSend_activities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activities");
}

id objc_msgSend_activityData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityData");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_activityUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityUI");
}

id objc_msgSend_actuallyClearCacheForInstructorAppleID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actuallyClearCacheForInstructorAppleID:completion:");
}

id objc_msgSend_adHocBaseUserIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocBaseUserIdentifier");
}

id objc_msgSend_adHocConfigAllowsAutomaticallyJoinClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocConfigAllowsAutomaticallyJoinClasses");
}

id objc_msgSend_adHocConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocConfiguration");
}

id objc_msgSend_adHocDefaultStudentInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocDefaultStudentInformation");
}

id objc_msgSend_adHocEnrollmentRecordsByGroupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocEnrollmentRecordsByGroupIdentifier");
}

id objc_msgSend_adHocUserIdentifierForCourseWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocUserIdentifierForCourseWithIdentifier:");
}

id objc_msgSend_adHocXPCEnrollmentRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adHocXPCEnrollmentRecord");
}

id objc_msgSend_addAllowedAppleIDsToFirewall_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAllowedAppleIDsToFirewall:completion:");
}

id objc_msgSend_addApplicationStateObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addApplicationStateObserver:");
}

id objc_msgSend_addBroadcastHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBroadcastHandler:");
}

id objc_msgSend_addCertificate_toAccessGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCertificate:toAccessGroup:");
}

id objc_msgSend_addDependency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDependency:");
}

id objc_msgSend_addEnrolledControlGroupIdentifiers_forUserWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEnrolledControlGroupIdentifiers:forUserWithIdentifier:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addExclusiveOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExclusiveOperation:");
}

id objc_msgSend_addIdentity_toAccessGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIdentity:toAccessGroup:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_addRestrictionsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRestrictionsObserver:");
}

id objc_msgSend_addTarget_selector_forOperationEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:selector:forOperationEvents:");
}

id objc_msgSend_addTarget_selector_forOperationEvents_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:selector:forOperationEvents:userInfo:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "address");
}

id objc_msgSend_airPlayActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayActivity");
}

id objc_msgSend_airPlayMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayMessage");
}

id objc_msgSend_airPlayPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayPrimitives");
}

id objc_msgSend_airPlayTextWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayTextWithInstructorName:");
}

id objc_msgSend_airPlayTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayTitle");
}

id objc_msgSend_airPlayTitleWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airPlayTitleWithInstructorName:");
}

id objc_msgSend_airplayStatusItemServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "airplayStatusItemServer");
}

id objc_msgSend_allClassroomCRKFeatures(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allClassroomCRKFeatures");
}

id objc_msgSend_allClassroomTopLevelRestrictions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allClassroomTopLevelRestrictions");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allLayoutElements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allLayoutElements");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allOpenApplications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allOpenApplications");
}

id objc_msgSend_allOpenBundleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allOpenBundleIDs");
}

id objc_msgSend_allPropertyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPropertyKeys");
}

id objc_msgSend_allRunningOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allRunningOperations");
}

id objc_msgSend_allStudentIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allStudentIdentifiers");
}

id objc_msgSend_allTrustedUserCertificates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allTrustedUserCertificates");
}

id objc_msgSend_allUsers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allUsers");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowManagementForSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowManagementForSessionWithIdentifier:");
}

id objc_msgSend_allowedAppleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowedAppleIDs");
}

id objc_msgSend_allowsStudentInitiatedDisconnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsStudentInitiatedDisconnection");
}

id objc_msgSend_alwaysAllowPermissionPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alwaysAllowPermissionPrompt");
}

id objc_msgSend_analyticsPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsPrimitives");
}

id objc_msgSend_anchorCertificateDatas(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorCertificateDatas");
}

id objc_msgSend_anchorCertificates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorCertificates");
}

id objc_msgSend_anyInstallationExists(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyInstallationExists");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appBundleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBundleURL");
}

id objc_msgSend_appGroupLibraryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appGroupLibraryURL");
}

id objc_msgSend_appLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLink");
}

id objc_msgSend_appLockErrorForBundleIdentifier_underlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLockErrorForBundleIdentifier:underlyingError:");
}

id objc_msgSend_appLockOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appLockOperation");
}

id objc_msgSend_appNotInstalledErrorReturningDMFError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appNotInstalledErrorReturningDMFError:");
}

id objc_msgSend_appProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appProvider");
}

id objc_msgSend_appTags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appTags");
}

id objc_msgSend_appendItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendItem:");
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleID");
}

id objc_msgSend_appleIDAuthenticator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleIDAuthenticator");
}

id objc_msgSend_appleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleIDs");
}

id objc_msgSend_appleIDsForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleIDsForRequest:");
}

id objc_msgSend_applicationDisplayIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDisplayIdentifiers");
}

id objc_msgSend_applicationLaunchFromURLOptionUnlockDeviceKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationLaunchFromURLOptionUnlockDeviceKey");
}

id objc_msgSend_applicationProxyForIdentifier_placeholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:placeholder:");
}

id objc_msgSend_applicationRecordStateSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationRecordStateSubscription");
}

id objc_msgSend_applicationRecordWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationRecordWithBundleIdentifier:error:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationType");
}

id objc_msgSend_applicationWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWorkspace");
}

id objc_msgSend_applicationsAvailableForOpeningURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationsAvailableForOpeningURL:");
}

id objc_msgSend_applicationsDidInstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationsDidInstall:");
}

id objc_msgSend_applicationsDidUninstall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationsDidUninstall:");
}

id objc_msgSend_applyRestrictionDictionary_appsAndOptions_clientType_clientUUID_localizedClientDescription_localizedWarningMessage_outRestrictionChanged_outEffectiveSettingsChanged_outError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyRestrictionDictionary:appsAndOptions:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:");
}

id objc_msgSend_applyWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyWithError:");
}

id objc_msgSend_appsAndOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appsAndOptions");
}

id objc_msgSend_appsChangedNotificationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appsChangedNotificationName");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_askForFeature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askForFeature");
}

id objc_msgSend_askForSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askForSession");
}

id objc_msgSend_askIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askIfNeeded");
}

id objc_msgSend_askOperationDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askOperationDidFinish:");
}

id objc_msgSend_askPermissionPromptFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askPermissionPromptFlags");
}

id objc_msgSend_askPermissionPromptOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askPermissionPromptOptions");
}

id objc_msgSend_askUserPermisisonWithEnrollmentRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askUserPermisisonWithEnrollmentRecord:");
}

id objc_msgSend_askUserPermissionForFeature_alertModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "askUserPermissionForFeature:alertModel:");
}

id objc_msgSend_asmXPCEnrollmentRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "asmXPCEnrollmentRecord");
}

id objc_msgSend_assertAccountsInactive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertAccountsInactive");
}

id objc_msgSend_assertRemoteUsersNotRegistered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertRemoteUsersNotRegistered");
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertions");
}

id objc_msgSend_assignRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assignRequest");
}

id objc_msgSend_assignUserWithRetriesLeft_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assignUserWithRetriesLeft:");
}

id objc_msgSend_attachCompletionBlock_toOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachCompletionBlock:toOperation:");
}

id objc_msgSend_attemptsRemaining(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attemptsRemaining");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_authenticateToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateToken:");
}

id objc_msgSend_authenticatedTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticatedTokens");
}

id objc_msgSend_autoAccept(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoAccept");
}

id objc_msgSend_automaticRemovalDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticRemovalDate");
}

id objc_msgSend_automaticallyJoinClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automaticallyJoinClasses");
}

id objc_msgSend_auxiliaryEnrolledGroupsByUserIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryEnrolledGroupsByUserIdentifier");
}

id objc_msgSend_auxiliaryUsersByIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auxiliaryUsersByIdentifier");
}

id objc_msgSend_availableAirPlayRoutes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableAirPlayRoutes");
}

id objc_msgSend_availableBytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableBytes");
}

id objc_msgSend_availableRoutes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableRoutes");
}

id objc_msgSend_backingLockStateProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backingLockStateProvider");
}

id objc_msgSend_backingOpenAppRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backingOpenAppRequest");
}

id objc_msgSend_badgeCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "badgeCount");
}

id objc_msgSend_baseNotificationUserInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseNotificationUserInfo");
}

id objc_msgSend_batteryLevelDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryLevelDidChange");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryState");
}

id objc_msgSend_becomeExclusiveOrStartLockApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeExclusiveOrStartLockApp");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "begin");
}

id objc_msgSend_beginBrowsingForConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBrowsingForConnections");
}

id objc_msgSend_beginObservationForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservationForSession:");
}

id objc_msgSend_beginObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObserving");
}

id objc_msgSend_beginObservingAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingAccounts");
}

id objc_msgSend_beginObservingDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingDevice");
}

id objc_msgSend_beginObservingDeviceIdleness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingDeviceIdleness");
}

id objc_msgSend_beginObservingLockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingLockState");
}

id objc_msgSend_beginObservingOpenApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingOpenApps");
}

id objc_msgSend_beginObservingProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingProviders");
}

id objc_msgSend_beginObservingRoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingRoster");
}

id objc_msgSend_beginOutputDeviceBrowsingSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginOutputDeviceBrowsingSession");
}

id objc_msgSend_beginTransactionForSession_transport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransactionForSession:transport:");
}

id objc_msgSend_beginUpdating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginUpdating");
}

id objc_msgSend_beginUpdating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginUpdating:");
}

id objc_msgSend_blockOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockOperationWithBlock:");
}

id objc_msgSend_blockOperationWithBlock_cancellationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blockOperationWithBlock:cancellationBlock:");
}

id objc_msgSend_bookmarkArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bookmarkArray");
}

id objc_msgSend_books(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "books");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLRestrictionForFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLRestrictionForFeature:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_BOOLValueForEntitlement_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForEntitlement:onConnection:");
}

id objc_msgSend_BOOLValueForEntitlement_onConnection_XPCPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValueForEntitlement:onConnection:XPCPrimitives:");
}

id objc_msgSend_bootDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bootDate");
}

id objc_msgSend_broadcasterWithIDSPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "broadcasterWithIDSPrimitives:");
}

id objc_msgSend_browseForPickableAirPlayRoutes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browseForPickableAirPlayRoutes");
}

id objc_msgSend_browserStateDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browserStateDictionary");
}

id objc_msgSend_browsingSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "browsingSession");
}

id objc_msgSend_buildCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildCache");
}

id objc_msgSend_buildNotificationCategories(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildNotificationCategories");
}

id objc_msgSend_buildProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildProviders");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_buildVersionProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVersionProvider");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleIdentifierByLocatingWebClipBundleIdentifierInString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierByLocatingWebClipBundleIdentifierInString:");
}

id objc_msgSend_bundleIdentifierForPlatform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierForPlatform:");
}

id objc_msgSend_bundleIdentifierForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierForRequest:");
}

id objc_msgSend_bundleIdentifierFromLayoutElement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifierFromLayoutElement:");
}

id objc_msgSend_bundleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiers");
}

id objc_msgSend_bundleIdentifiersFromDictionaryRepresentations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiersFromDictionaryRepresentations:");
}

id objc_msgSend_bundleIdentifiersInLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiersInLayouts:");
}

id objc_msgSend_bundleRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecord");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cacheClearInProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cacheClearInProgress");
}

id objc_msgSend_cachedDefaultWebBrowserBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedDefaultWebBrowserBundleIdentifier");
}

id objc_msgSend_cachedImageDataForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachedImageDataForURL:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelHistoryOwnerRecheckTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelHistoryOwnerRecheckTimer");
}

id objc_msgSend_cancelOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelOperation:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelRefreshCertificatesForCourseWithIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRefreshCertificatesForCourseWithIdentifier:targetIPAddress:");
}

id objc_msgSend_cancelRefreshesForIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRefreshesForIdentifiers:");
}

id objc_msgSend_cancelRosterObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelRosterObservation");
}

id objc_msgSend_cancelValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelValue");
}

id objc_msgSend_cancelableWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelableWithBlock:");
}

id objc_msgSend_cancellationBlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancellationBlock");
}

id objc_msgSend_cat_addDependencies_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cat_addDependencies:");
}

id objc_msgSend_cat_archivedDataWithRootObject_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cat_archivedDataWithRootObject:error:");
}

id objc_msgSend_cat_performBlockOnMainRunLoop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cat_performBlockOnMainRunLoop:");
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryIdentifier");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificate");
}

id objc_msgSend_certificateConduit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateConduit");
}

id objc_msgSend_certificateDataCollectionForCourse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateDataCollectionForCourse:");
}

id objc_msgSend_certificateExchangeHandler_needsCertificatesForRequester_sourceRole_destinationRole_controlGroupIdentifier_destinationDeviceIdentifier_requesterCertificate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateExchangeHandler:needsCertificatesForRequester:sourceRole:destinationRole:controlGroupIdentifier:destinationDeviceIdentifier:requesterCertificate:error:");
}

id objc_msgSend_certificateRefresher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateRefresher");
}

id objc_msgSend_certificateWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificateWithPersistentID:");
}

id objc_msgSend_certificatesWithDatas_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "certificatesWithDatas:error:");
}

id objc_msgSend_changeIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeIndex");
}

id objc_msgSend_changeToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeToken");
}

id objc_msgSend_chargingState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chargingState");
}

id objc_msgSend_chargingStateDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chargingStateDidChange");
}

id objc_msgSend_checkAppCanBeOpened(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAppCanBeOpened");
}

id objc_msgSend_chooseUserWithIdentifier_inClassWithID_password_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chooseUserWithIdentifier:inClassWithID:password:completion:");
}

id objc_msgSend_chooseUserWithIdentifier_inClassWithID_password_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:");
}

id objc_msgSend_claimedAnchorCertificatePersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "claimedAnchorCertificatePersistentIDs");
}

id objc_msgSend_claimedIdentityPersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "claimedIdentityPersistentIDs");
}

id objc_msgSend_classKitReSyncer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classKitReSyncer");
}

id objc_msgSend_classSessionBrowser_foundSessionWithIdentifier_transport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionBrowser:foundSessionWithIdentifier:transport:");
}

id objc_msgSend_classSessionBrowser_lostEnrollmentInCourses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionBrowser:lostEnrollmentInCourses:");
}

id objc_msgSend_classSessionDidConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionDidConnect:");
}

id objc_msgSend_classSessionDidConnectWithCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionDidConnectWithCourseIdentifier:");
}

id objc_msgSend_classSessionDidDisconnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionDidDisconnect:");
}

id objc_msgSend_classSessionDidDisconnectWithCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionDidDisconnectWithCourseIdentifier:");
}

id objc_msgSend_classSessionGenerationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionGenerationToken");
}

id objc_msgSend_classSessionGenerationTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionGenerationTokens");
}

id objc_msgSend_classSessionInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionInvalidated:");
}

id objc_msgSend_classSessionRejected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionRejected:");
}

id objc_msgSend_classSessionReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classSessionReporter");
}

id objc_msgSend_classroomActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomActivity");
}

id objc_msgSend_classroomAppBundleURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomAppBundleURL");
}

id objc_msgSend_classroomDidLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomDidLaunch");
}

id objc_msgSend_classroomLockDeviceAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomLockDeviceAllowed");
}

id objc_msgSend_classroomOpenAppAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomOpenAppAllowed");
}

id objc_msgSend_classroomOpenURLAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomOpenURLAllowed");
}

id objc_msgSend_classroomScreenObservationAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomScreenObservationAllowed");
}

id objc_msgSend_classroomSettingsPaneDidActivate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomSettingsPaneDidActivate");
}

id objc_msgSend_classroomStatusItemServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomStatusItemServer");
}

id objc_msgSend_classroomUnpromptedAppAndDeviceLockForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classroomUnpromptedAppAndDeviceLockForced");
}

id objc_msgSend_cleanupAdHocEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupAdHocEnrollmentRecords");
}

id objc_msgSend_cleanupAndFinishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupAndFinishWithError:");
}

id objc_msgSend_cleanupLegacyTombstones(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanupLegacyTombstones");
}

id objc_msgSend_clearCacheForInstructorAppleID_courseIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCacheForInstructorAppleID:courseIdentifier:completion:");
}

id objc_msgSend_clearCertificates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCertificates");
}

id objc_msgSend_clearIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearIdentities");
}

id objc_msgSend_clearNoAccountsActiveStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearNoAccountsActiveStartDate");
}

id objc_msgSend_clientIdentityForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIdentityForCourseIdentifier:");
}

id objc_msgSend_clientIdentityForGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientIdentityForGroupIdentifier:");
}

id objc_msgSend_clientSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientSessions");
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientType");
}

id objc_msgSend_clientUserInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientUserInfo");
}

id objc_msgSend_clock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clock");
}

id objc_msgSend_closeWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closeWithError:");
}

id objc_msgSend_cloudConfigurationDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cloudConfigurationDidChange:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_coerceIdentitySetToSteadyState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coerceIdentitySetToSteadyState");
}

id objc_msgSend_collectBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectBundleIdentifiers");
}

id objc_msgSend_collectBundleIdentifiersFromLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectBundleIdentifiersFromLayouts:");
}

id objc_msgSend_collectIDSLocalAssertions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectIDSLocalAssertions:");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "color");
}

id objc_msgSend_colorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorType");
}

id objc_msgSend_commonName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonName");
}

id objc_msgSend_commonNamePrefix(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonNamePrefix");
}

id objc_msgSend_commonNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonNames");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completedUnitCount");
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completion");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_concretePrimaryAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concretePrimaryAppProvider");
}

id objc_msgSend_concreteSecondaryAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "concreteSecondaryAppProvider");
}

id objc_msgSend_conditionMatcher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionMatcher");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationForDefaultMainDisplayMonitor");
}

id objc_msgSend_configurationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationManager");
}

id objc_msgSend_configurationMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationMigrationTasks");
}

id objc_msgSend_configurationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationType");
}

id objc_msgSend_configurationWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithEndpoint:");
}

id objc_msgSend_configurationWithOpenAppRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithOpenAppRequest:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connectToClassSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToClassSessionWithIdentifier:");
}

id objc_msgSend_connectToDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectToDataSource");
}

id objc_msgSend_connectWithClientTransport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectWithClientTransport:");
}

id objc_msgSend_connectedClientSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedClientSessions");
}

id objc_msgSend_connectedTaskSessionsDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectedTaskSessionsDidChange");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionTerminal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionTerminal");
}

id objc_msgSend_consumeSandboxExtensions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumeSandboxExtensions:");
}

id objc_msgSend_consumedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consumedTime");
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_containsBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsBundleIdentifier:");
}

id objc_msgSend_containsCourseWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsCourseWithIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentsOfDirectoryAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsOfDirectoryAtURL:error:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "context");
}

id objc_msgSend_convertWebBookmarkListToCRKBookmarkArray_collection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertWebBookmarkListToCRKBookmarkArray:collection:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfBonafideClassSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfBonafideClassSessions");
}

id objc_msgSend_countOfIdleClassSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countOfIdleClassSessions");
}

id objc_msgSend_course_containsInstructorWithAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "course:containsInstructorWithAppleID:");
}

id objc_msgSend_courseColorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseColorType");
}

id objc_msgSend_courseCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseCount");
}

id objc_msgSend_courseDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseDescription");
}

id objc_msgSend_courseFirstSeenDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseFirstSeenDate");
}

id objc_msgSend_courseIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseIdentifier");
}

id objc_msgSend_courseIdentifiersInRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseIdentifiersInRoster:");
}

id objc_msgSend_courseInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseInvitations");
}

id objc_msgSend_courseMascotType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseMascotType");
}

id objc_msgSend_courseName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseName");
}

id objc_msgSend_coursePrivateIdentityForCourseIdentifier_studentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coursePrivateIdentityForCourseIdentifier:studentIdentifier:");
}

id objc_msgSend_courseWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseWithIdentifier:");
}

id objc_msgSend_courseWithIdentifier_inRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courseWithIdentifier:inRoster:");
}

id objc_msgSend_courses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "courses");
}

id objc_msgSend_createConditionMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createConditionMonitor");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryIfNeeded");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_createFreshActiveIdentityIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFreshActiveIdentityIfNeeded");
}

id objc_msgSend_createTableWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createTableWithError:");
}

id objc_msgSend_createWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithError:");
}

id objc_msgSend_createsNewApplicationInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createsNewApplicationInstance");
}

id objc_msgSend_credential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credential");
}

id objc_msgSend_credentialCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialCache");
}

id objc_msgSend_credentialWithIdentity_certificates_persistence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialWithIdentity:certificates:persistence:");
}

id objc_msgSend_credentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentials");
}

id objc_msgSend_crkCourse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crkCourse");
}

id objc_msgSend_crkCourseType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crkCourseType");
}

id objc_msgSend_crkOpenAppRequestFromDMFRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crkOpenAppRequestFromDMFRequest:");
}

id objc_msgSend_crkOpenAppRequestFromRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crkOpenAppRequestFromRequest:");
}

id objc_msgSend_crk_JSONStringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_JSONStringValue");
}

id objc_msgSend_crk_adHocXPCGroupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_adHocXPCGroupIdentifier");
}

id objc_msgSend_crk_arrayByRemovingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_arrayByRemovingObject:");
}

id objc_msgSend_crk_asmXPCGroupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_asmXPCGroupIdentifier");
}

id objc_msgSend_crk_backgroundQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_backgroundQueue");
}

id objc_msgSend_crk_containsCurrentDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_containsCurrentDate");
}

id objc_msgSend_crk_containsObjectMatchingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_containsObjectMatchingPredicate:");
}

id objc_msgSend_crk_dateIntervalByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_dateIntervalByAddingTimeInterval:");
}

id objc_msgSend_crk_dictionaryByAddingEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_dictionaryByAddingEntriesFromDictionary:");
}

id objc_msgSend_crk_dictionaryByFilteringToKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_dictionaryByFilteringToKeys:");
}

id objc_msgSend_crk_dictionaryUsingKeyGenerator_valueGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_dictionaryUsingKeyGenerator:valueGenerator:");
}

id objc_msgSend_crk_endpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_endpoint");
}

id objc_msgSend_crk_filterUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_filterUsingBlock:");
}

id objc_msgSend_crk_firstMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_firstMatching:");
}

id objc_msgSend_crk_flatMapUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_flatMapUsingBlock:");
}

id objc_msgSend_crk_hexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_hexString");
}

id objc_msgSend_crk_isBeingTested(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_isBeingTested");
}

id objc_msgSend_crk_isFourDigitPasscode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_isFourDigitPasscode");
}

id objc_msgSend_crk_keyValueObservingNewObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_keyValueObservingNewObject");
}

id objc_msgSend_crk_keyValueObservingOldObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_keyValueObservingOldObject");
}

id objc_msgSend_crk_macOSProfileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_macOSProfileURL");
}

id objc_msgSend_crk_managedXPCGroupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_managedXPCGroupIdentifier");
}

id objc_msgSend_crk_mapToSetUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_mapToSetUsingBlock:");
}

id objc_msgSend_crk_mapUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_mapUsingBlock:");
}

id objc_msgSend_crk_naturallySortedArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_naturallySortedArray");
}

id objc_msgSend_crk_nonContainerizedHomeDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_nonContainerizedHomeDirectoryURL");
}

id objc_msgSend_crk_optionalObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_optionalObjectAtIndex:");
}

id objc_msgSend_crk_safeRemoveItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_safeRemoveItemAtURL:error:");
}

id objc_msgSend_crk_setBySubtractingSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_setBySubtractingSet:");
}

id objc_msgSend_crk_sha1Hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_sha1Hash");
}

id objc_msgSend_crk_stableDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_stableDescription");
}

id objc_msgSend_crk_stringWithIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_stringWithIPAddress:");
}

id objc_msgSend_crk_timingOutOperationWithTimerPrimitives_operationQueue_timerIdentifier_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_timingOutOperationWithTimerPrimitives:operationQueue:timerIdentifier:timeout:");
}

id objc_msgSend_crk_uniqueTemporaryDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_uniqueTemporaryDirectoryURL");
}

id objc_msgSend_crk_zerosUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crk_zerosUUID");
}

id objc_msgSend_crossPlatformPropertyProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crossPlatformPropertyProviders");
}

id objc_msgSend_currentDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDate");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentIDSTaskSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentIDSTaskSessions");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentMaxIdleLength(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentMaxIdleLength");
}

id objc_msgSend_currentOpenApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOpenApps");
}

id objc_msgSend_currentOutputDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOutputDevice");
}

id objc_msgSend_currentOutputDeviceObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentOutputDeviceObservation");
}

id objc_msgSend_currentToneIdentifierForAlertType_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentToneIdentifierForAlertType:topic:");
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUser");
}

id objc_msgSend_currentUserProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUserProvider");
}

id objc_msgSend_currentUserWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUserWithCompletion:");
}

id objc_msgSend_cursorDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cursorDate");
}

id objc_msgSend_customUserFromMeCardUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "customUserFromMeCardUser:");
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "daemon");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForKey:error:");
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataRepresentation");
}

id objc_msgSend_dataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataStore");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:error:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingComponents_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingComponents:toDate:options:");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateProvider");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "day");
}

id objc_msgSend_deauthenticateToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deauthenticateToken:");
}

id objc_msgSend_debouncingAnalyticsPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debouncingAnalyticsPrimitives");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_debugInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugInfo");
}

id objc_msgSend_debugStringForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "debugStringForAction:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultAdHocProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultAdHocProfile");
}

id objc_msgSend_defaultBrowserIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBrowserIdentifier");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultUserDictionaryForProfileConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultUserDictionaryForProfileConfiguration:");
}

id objc_msgSend_defaultWebBrowserBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWebBrowserBundleIdentifier");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateKey_didChangeToValue_inCourse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateKey:didChangeToValue:inCourse:");
}

id objc_msgSend_delegateOutLostCoursesWithOldRoster_newRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegateOutLostCoursesWithOldRoster:newRoster:");
}

id objc_msgSend_deleteAnchorCertificatePersistentIDIfUnclaimed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAnchorCertificatePersistentIDIfUnclaimed:");
}

id objc_msgSend_deleteAnchorCertificatePersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAnchorCertificatePersistentIDs:");
}

id objc_msgSend_deleteEnrollmentRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEnrollmentRecord:");
}

id objc_msgSend_deleteEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteEnrollmentRecords");
}

id objc_msgSend_deleteIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteIdentities");
}

id objc_msgSend_deleteIdentityPersistentIDIfUnclaimed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteIdentityPersistentIDIfUnclaimed:");
}

id objc_msgSend_deleteIdentitySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteIdentitySet:");
}

id objc_msgSend_deleteOldCloudDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteOldCloudDirectory");
}

id objc_msgSend_deleteOnlyIfEmpty(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteOnlyIfEmpty");
}

id objc_msgSend_deletePersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePersistentID:");
}

id objc_msgSend_deletePersistentIDIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePersistentIDIfNeeded:");
}

id objc_msgSend_deleteStandaloneIdentityPersistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteStandaloneIdentityPersistentID");
}

id objc_msgSend_deleteStandaloneStagedPersistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteStandaloneStagedPersistentID");
}

id objc_msgSend_deleteUserImageDataWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteUserImageDataWithIdentifier:error:");
}

id objc_msgSend_deleteVestigialSettingsUIVisibiltyIndicatorFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteVestigialSettingsUIVisibiltyIndicatorFile");
}

id objc_msgSend_deleteWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteWithError:");
}

id objc_msgSend_deliverAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deliverAction:");
}

id objc_msgSend_denyJoinPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denyJoinPrompt");
}

id objc_msgSend_denyPermissionPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "denyPermissionPrompt");
}

id objc_msgSend_destination(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destination");
}

id objc_msgSend_destinationAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationAddress");
}

id objc_msgSend_destinationAddressForAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationAddressForAppleID:");
}

id objc_msgSend_destinationAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationAppleID");
}

id objc_msgSend_destinationURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationURL");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "device");
}

id objc_msgSend_deviceDidUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDidUnlock");
}

id objc_msgSend_deviceDidUnlockForFirstTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceDidUnlockForFirstTime");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceIDForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIDForRouteUID:");
}

id objc_msgSend_deviceIdentifierProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifierProvider");
}

id objc_msgSend_deviceIsReadyToOpenApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsReadyToOpenApp");
}

id objc_msgSend_deviceIsReadyToOpenURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIsReadyToOpenURL");
}

id objc_msgSend_deviceLockProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLockProvider");
}

id objc_msgSend_deviceNameDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceNameDidChange");
}

id objc_msgSend_devicePrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePrimitives");
}

id objc_msgSend_devicePropertyObserver_didObserveChangeForKey_toValue_inCourse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devicePropertyObserver:didObserveChangeForKey:toValue:inCourse:");
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryValue");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didClassroomLockScreenDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didClassroomLockScreenDisplay");
}

id objc_msgSend_didConnectIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didConnectIdentity:");
}

id objc_msgSend_didEncounterUntrustedClassSession_instructorIdentifier_decisionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didEncounterUntrustedClassSession:instructorIdentifier:decisionHandler:");
}

id objc_msgSend_didFetchInternetDate_course_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchInternetDate:course:");
}

id objc_msgSend_didFetchInternetDate_record_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchInternetDate:record:completion:");
}

id objc_msgSend_didFetchInternetDateForCleanupAdHocEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchInternetDateForCleanupAdHocEnrollmentRecords:");
}

id objc_msgSend_didFinishRenewingCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishRenewingCredentials");
}

id objc_msgSend_directoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "directoryURL");
}

id objc_msgSend_disableAdHocIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disableAdHocIfNeeded");
}

id objc_msgSend_disallowsClassroomAirDropOverLocalNetwork(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disallowsClassroomAirDropOverLocalNetwork");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnect");
}

id objc_msgSend_disconnectFromDataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectFromDataSource");
}

id objc_msgSend_disconnectIDSSessionWithCourseIdentifier_instructorIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "disconnectIDSSessionWithCourseIdentifier:instructorIdentifier:");
}

id objc_msgSend_dismissClassroomLockScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissClassroomLockScreen");
}

id objc_msgSend_dismissLockScreenAndFinishIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissLockScreenAndFinishIfNeeded");
}

id objc_msgSend_displayClassroomLockScreenWithLabel_passcode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayClassroomLockScreenWithLabel:passcode:");
}

id objc_msgSend_displayHeightProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayHeightProvider");
}

id objc_msgSend_displayMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayMonitor");
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayName");
}

id objc_msgSend_displayScaleFactorProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayScaleFactorProvider");
}

id objc_msgSend_displayToDeviceDidFinishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayToDeviceDidFinishWithError:");
}

id objc_msgSend_displayToDeviceWithPassword_suppressPrompt_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayToDeviceWithPassword:suppressPrompt:completion:");
}

id objc_msgSend_displayWidthProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayWidthProvider");
}

id objc_msgSend_displays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displays");
}

id objc_msgSend_displaysProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displaysProvider");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_earliestAllowedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earliestAllowedDate");
}

id objc_msgSend_effectiveAppLockedBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveAppLockedBundleIdentifier");
}

id objc_msgSend_effectiveBoolValueForSetting_outAsk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:outAsk:");
}

id objc_msgSend_effectiveCursorDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveCursorDate");
}

id objc_msgSend_effectiveManagedConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveManagedConfiguration");
}

id objc_msgSend_effectiveUserImageDataForUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveUserImageDataForUser:");
}

id objc_msgSend_effectiveValueForSetting_configurationUUID_outAsk_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveValueForSetting:configurationUUID:outAsk:");
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elements");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "end");
}

id objc_msgSend_endBrowsingForConnections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBrowsingForConnections");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDate");
}

id objc_msgSend_endObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObserving");
}

id objc_msgSend_endObservingAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObservingAccounts");
}

id objc_msgSend_endObservingDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObservingDevice");
}

id objc_msgSend_endObservingDeviceIdleness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObservingDeviceIdleness");
}

id objc_msgSend_endObservingProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObservingProviders");
}

id objc_msgSend_endObservingRoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endObservingRoster");
}

id objc_msgSend_endOperationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endOperationWithError:");
}

id objc_msgSend_endOperationWithResultObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endOperationWithResultObject:");
}

id objc_msgSend_endTransactionForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransactionForSession:");
}

id objc_msgSend_endUpdating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUpdating");
}

id objc_msgSend_endUpdating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUpdating:");
}

id objc_msgSend_endUserSwitchTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUserSwitchTask");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endpoint");
}

id objc_msgSend_enqueueOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueOperation:");
}

id objc_msgSend_enqueueOperationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueOperationWithError:");
}

id objc_msgSend_enrolledControlGroupIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrolledControlGroupIdentifiers");
}

id objc_msgSend_enrollmentRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecord");
}

id objc_msgSend_enrollmentRecordForSession_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecordForSession:error:");
}

id objc_msgSend_enrollmentRecordForSessionIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecordForSessionIdentifier:error:");
}

id objc_msgSend_enrollmentRecordProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecordProvider");
}

id objc_msgSend_enrollmentRecordWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecordWithIdentifier:");
}

id objc_msgSend_enrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecords");
}

id objc_msgSend_enrollmentRecordsByGroupIdentifierInConfiguration_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enrollmentRecordsByGroupIdentifierInConfiguration:type:");
}

id objc_msgSend_enter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enter");
}

id objc_msgSend_entriesByIPAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesByIPAddress");
}

id objc_msgSend_entriesByKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entriesByKey");
}

id objc_msgSend_entryForInstructorAppleID_courseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entryForInstructorAppleID:courseIdentifier:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_environmentPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environmentPrimitives");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_equivalencyForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "equivalencyForBundleIdentifier:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "error");
}

id objc_msgSend_errorForRenewResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForRenewResult:");
}

id objc_msgSend_errorIndicatesCacheNeedsToBeCleared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorIndicatesCacheNeedsToBeCleared:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_evaluateApplicationRestrictedness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateApplicationRestrictedness");
}

id objc_msgSend_evaluateCurrentOutputDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateCurrentOutputDevice");
}

id objc_msgSend_evaluateLockScreenState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateLockScreenState");
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluator");
}

id objc_msgSend_evalutateOutputDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evalutateOutputDevices");
}

id objc_msgSend_eventCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventCache");
}

id objc_msgSend_eventDatabaseDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventDatabaseDirectoryURL");
}

id objc_msgSend_eventLogSinceDate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventLogSinceDate:error:");
}

id objc_msgSend_eventLogWithStartDate_endDate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventLogWithStartDate:endDate:error:");
}

id objc_msgSend_eventRecorder_didRecordEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventRecorder:didRecordEvent:");
}

id objc_msgSend_eventsSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventsSinceDate:");
}

id objc_msgSend_exchangeHandlerDelegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeHandlerDelegate");
}

id objc_msgSend_excludedFromiCloudBackupStoreWithDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "excludedFromiCloudBackupStoreWithDirectoryURL:");
}

id objc_msgSend_exclusiveOperationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusiveOperationManager");
}

id objc_msgSend_exclusiveOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusiveOperations");
}

id objc_msgSend_exclusivityRequestDidComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exclusivityRequestDidComplete:");
}

id objc_msgSend_executeSQL_rowHandler_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeSQL:rowHandler:error:");
}

id objc_msgSend_existingAppLockOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingAppLockOperation");
}

id objc_msgSend_existingRefreshCertificatesOperationForCourseIdentifier_instructorIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingRefreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:");
}

id objc_msgSend_existingRefreshCertificatesOperationsForCourseIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "existingRefreshCertificatesOperationsForCourseIdentifier:targetIPAddress:");
}

id objc_msgSend_exposableClientSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exposableClientSessions");
}

id objc_msgSend_failWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failWithUnderlyingError:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyName");
}

id objc_msgSend_favoritesFolder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesFolder");
}

id objc_msgSend_favoritesFolderWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "favoritesFolderWithChildren:");
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feature");
}

id objc_msgSend_featureDataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureDataStore");
}

id objc_msgSend_featureForCRKFeature_enrollmentRecord_configurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureForCRKFeature:enrollmentRecord:configurationManager:");
}

id objc_msgSend_featurePermissionFromFeatureBoolType_ask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featurePermissionFromFeatureBoolType:ask:");
}

id objc_msgSend_featureScreenObserveAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureScreenObserveAllowed");
}

id objc_msgSend_featureUnpromptedRemoteScreenObservationForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureUnpromptedRemoteScreenObservationForced");
}

id objc_msgSend_fetchActiveInstructorsIncludingImages_includeIdleInstructors_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActiveInstructorsIncludingImages:includeIdleInstructors:completion:");
}

id objc_msgSend_fetchAdHocConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAdHocConfiguration:");
}

id objc_msgSend_fetchAndNilOutObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAndNilOutObjectForKey:");
}

id objc_msgSend_fetchApplicationWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchApplicationWithBundleIdentifier:completion:");
}

id objc_msgSend_fetchApplicationWithDescriptor_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchApplicationWithDescriptor:completion:");
}

id objc_msgSend_fetchAvailableShareTargetsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAvailableShareTargetsWithCompletion:");
}

id objc_msgSend_fetchEligibilityForEasyMAIDSignInWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEligibilityForEasyMAIDSignInWithCompletion:");
}

id objc_msgSend_fetchFirewallAllowedAppleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFirewallAllowedAppleIDs:");
}

id objc_msgSend_fetchFirewallWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchFirewallWithCompletion:");
}

id objc_msgSend_fetchHandlingAppWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHandlingAppWithCompletion:");
}

id objc_msgSend_fetchImageDataForUser_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchImageDataForUser:completion:");
}

id objc_msgSend_fetchImageForUser_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchImageForUser:completion:");
}

id objc_msgSend_fetchInternetDateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchInternetDateWithCompletion:");
}

id objc_msgSend_fetchListenerEndpointForExtensionBundleIdentifier_fromClassroomBundleWithURL_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchListenerEndpointForExtensionBundleIdentifier:fromClassroomBundleWithURL:completionBlock:");
}

id objc_msgSend_fetchMeCard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchMeCard:");
}

id objc_msgSend_fetchOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchOperation");
}

id objc_msgSend_fetchResourceFromURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchResourceFromURL:completion:");
}

id objc_msgSend_fetchScreenshotDataWithMaximumSizeInPixels_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchScreenshotDataWithMaximumSizeInPixels:completion:");
}

id objc_msgSend_fetchSerialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSerialNumber");
}

id objc_msgSend_fetchSetOfActiveRestrictionUUIDsForClientType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchSetOfActiveRestrictionUUIDsForClientType:completion:");
}

id objc_msgSend_fileCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileCache");
}

id objc_msgSend_fileCache_loadFileWrapperNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileCache:loadFileWrapperNamed:");
}

id objc_msgSend_fileCache_storeFileWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileCache:storeFileWrapper:");
}

id objc_msgSend_fileData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileData");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtURL:");
}

id objc_msgSend_fileItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileItems");
}

id objc_msgSend_fileName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileName");
}

id objc_msgSend_fileStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileStore");
}

id objc_msgSend_fileSystemPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemPrimitives");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredRouteDescriptionForRelevantKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredRouteDescriptionForRelevantKeys:");
}

id objc_msgSend_filteredSetUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredSetUsingPredicate:");
}

id objc_msgSend_fingerprint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerprint");
}

id objc_msgSend_fingerprintsByPersistentIDCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fingerprintsByPersistentIDCache");
}

id objc_msgSend_finishWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithError:");
}

id objc_msgSend_finishWithURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishWithURLs:");
}

id objc_msgSend_finishedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedDate");
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fire");
}

id objc_msgSend_fireTimeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fireTimeout");
}

id objc_msgSend_fireWithResponseFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fireWithResponseFlags:");
}

id objc_msgSend_firewallOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firewallOperation");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstSeenDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstSeenDate");
}

id objc_msgSend_firstSeenDateForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstSeenDateForCourseIdentifier:");
}

id objc_msgSend_firstUnlockSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstUnlockSubscription");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flags");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flushStagedIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushStagedIdentity");
}

id objc_msgSend_folderWithName_children_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "folderWithName:children:");
}

id objc_msgSend_followUpOpenApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followUpOpenApp");
}

id objc_msgSend_followUpOpenAppOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "followUpOpenAppOperation");
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "force");
}

id objc_msgSend_forceAccountsInactiveBeacon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceAccountsInactiveBeacon");
}

id objc_msgSend_forceInactiveBeacon(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceInactiveBeacon");
}

id objc_msgSend_forceKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceKey");
}

id objc_msgSend_forceRefreshIDStatusForDestinations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceRefreshIDStatusForDestinations:completion:");
}

id objc_msgSend_forceReset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceReset");
}

id objc_msgSend_forceSetBundleIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceSetBundleIdentifiers:error:");
}

id objc_msgSend_forgetAcceptedCourseInvitationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forgetAcceptedCourseInvitationWithIdentifier:");
}

id objc_msgSend_foundCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "foundCourseIdentifier:");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_frontBoardServicesPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frontBoardServicesPrimitives");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullName");
}

id objc_msgSend_fullScreenImageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullScreenImageURL");
}

id objc_msgSend_gate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gate");
}

id objc_msgSend_generateIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateIdentity");
}

id objc_msgSend_generateInstructorOperationsByUnioningActiveOperations_andIdleOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateInstructorOperationsByUnioningActiveOperations:andIdleOperations:");
}

id objc_msgSend_getAppLinkWithURL_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppLinkWithURL:completion:");
}

id objc_msgSend_getAppLinkWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAppLinkWithURL:completionHandler:");
}

id objc_msgSend_getDeliveredNotificationsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getDeliveredNotificationsWithCompletionHandler:");
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "givenName");
}

id objc_msgSend_globalIdentityiOSOnly(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalIdentityiOSOnly");
}

id objc_msgSend_globalNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalNotification");
}

id objc_msgSend_globalNotificationPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "globalNotificationPrimitives");
}

id objc_msgSend_groupColorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupColorType");
}

id objc_msgSend_groupDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupDescription");
}

id objc_msgSend_groupEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupEnrollmentRecords");
}

id objc_msgSend_groupEnrollmentRecordsByGroupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupEnrollmentRecordsByGroupIdentifier");
}

id objc_msgSend_groupID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupID");
}

id objc_msgSend_groupIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupIdentifier");
}

id objc_msgSend_groupIdentifierForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupIdentifierForRequest:");
}

id objc_msgSend_groupIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupIdentifiers");
}

id objc_msgSend_groupMascotType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupMascotType");
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupName");
}

id objc_msgSend_groupNameWithBeaconID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupNameWithBeaconID:");
}

id objc_msgSend_groupUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupUser");
}

id objc_msgSend_guidedAccessActiveStatusDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "guidedAccessActiveStatusDidChange:");
}

id objc_msgSend_handleAskPermissionPromptResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAskPermissionPromptResponse:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleGlobalNotificationWith_responseDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleGlobalNotificationWith:responseDictionary:error:");
}

id objc_msgSend_handleJoinClassPromptResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleJoinClassPromptResponse:");
}

id objc_msgSend_handleSuccessfulFetchCertificatesOperation_instructorAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSuccessfulFetchCertificatesOperation:instructorAppleID:");
}

id objc_msgSend_handlesNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlesNotifications");
}

id objc_msgSend_handlingBundleIdentifierFromSuggestions_isBrowser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlingBundleIdentifierFromSuggestions:isBrowser:");
}

id objc_msgSend_handlingBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlingBundleIdentifiers");
}

id objc_msgSend_handlingBundleIdentifiersForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handlingBundleIdentifiersForRequest:");
}

id objc_msgSend_hasActiveRemoteClassSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasActiveRemoteClassSessions");
}

id objc_msgSend_hasConnectionToClassWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasConnectionToClassWithIdentifier:");
}

id objc_msgSend_hasCurrentlyConnectedIDSTaskSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCurrentlyConnectedIDSTaskSessions");
}

id objc_msgSend_hasEDUAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasEDUAccount");
}

id objc_msgSend_hasIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasIdentities");
}

id objc_msgSend_hasNonSynthesizedEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasNonSynthesizedEnrollmentRecords");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hash");
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hashTableWithOptions:");
}

id objc_msgSend_hideActiveConnectionIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideActiveConnectionIndicator");
}

id objc_msgSend_hideScreenObserveIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideScreenObserveIndicator");
}

id objc_msgSend_history(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "history");
}

id objc_msgSend_historyOwnerRecheckTimerAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historyOwnerRecheckTimerAction");
}

id objc_msgSend_historyVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "historyVersion");
}

id objc_msgSend_hostFileURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostFileURLs:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_housekeepConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "housekeepConfiguration:");
}

id objc_msgSend_iOSBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iOSBundleIdentifier");
}

id objc_msgSend_iOSSystemContainerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iOSSystemContainerURL");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierForSession:");
}

id objc_msgSend_identifierOfInstructorWithAppleID_inCourse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierOfInstructorWithAppleID:inCourse:error:");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiers");
}

id objc_msgSend_identifiersToDelete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifiersToDelete");
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identity");
}

id objc_msgSend_identityConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityConfiguration");
}

id objc_msgSend_identityForEndpoint_createIfDoesNotExist_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityForEndpoint:createIfDoesNotExist:");
}

id objc_msgSend_identityInfoFromIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityInfoFromIdentityPersistentID:");
}

id objc_msgSend_identityPersistentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityPersistentId");
}

id objc_msgSend_identitySetForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identitySetForCourseIdentifier:");
}

id objc_msgSend_identityTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityTable");
}

id objc_msgSend_identityWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityWithPersistentID:");
}

id objc_msgSend_identityWithPersistentIDContainsMultipleMemberPrefixes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityWithPersistentIDContainsMultipleMemberPrefixes:");
}

id objc_msgSend_idleConnectionMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleConnectionMonitor");
}

id objc_msgSend_idleStateProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idleStateProvider");
}

id objc_msgSend_ignoresDeviceIdleState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ignoresDeviceIdleState");
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageData");
}

id objc_msgSend_imageIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageIdentifier");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageURL");
}

id objc_msgSend_inRangeClassSessionIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inRangeClassSessionIdentifiers");
}

id objc_msgSend_inRangeClassSessions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inRangeClassSessions");
}

id objc_msgSend_inRangeClassSessionsDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inRangeClassSessionsDidChange:");
}

id objc_msgSend_inRangeRefreshIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inRangeRefreshIdentifiers");
}

id objc_msgSend_inactiveAccountsAssertionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inactiveAccountsAssertionCount");
}

id objc_msgSend_includeImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includeImage");
}

id objc_msgSend_includeImages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "includeImages");
}

id objc_msgSend_ingestCertificateDatas_intoRosterProvider_instructorAppleID_courseIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ingestCertificateDatas:intoRosterProvider:instructorAppleID:courseIdentifier:error:");
}

id objc_msgSend_ingestCertificates_forTrustedUserIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ingestCertificates:forTrustedUserIdentifier:error:");
}

id objc_msgSend_ingestCertificates_intoRosterProvider_trustedUserIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ingestCertificates:intoRosterProvider:trustedUserIdentifier:error:");
}

id objc_msgSend_ingestInstructorCertificateData_appleID_courseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ingestInstructorCertificateData:appleID:courseIdentifier:");
}

id objc_msgSend_initObservingObject_keyPaths_condition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initObservingObject:keyPaths:condition:completion:");
}

id objc_msgSend_initRegularFileWithContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRegularFileWithContents:");
}

id objc_msgSend_initWithASMCourseLibrary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithASMCourseLibrary:");
}

id objc_msgSend_initWithASMCourseLibrary_featureDataStore_mobileKeyBagPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithASMCourseLibrary:featureDataStore:mobileKeyBagPrimitives:");
}

id objc_msgSend_initWithAccount_forceInactiveBeacon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:forceInactiveBeacon:");
}

id objc_msgSend_initWithActiveIdentityPersistentID_stagedIdentityPersistentID_userIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:");
}

id objc_msgSend_initWithActiveIdentityPersistentID_stagedIdentityPersistentID_userIdentifier_groupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActiveIdentityPersistentID:stagedIdentityPersistentID:userIdentifier:groupIdentifier:");
}

id objc_msgSend_initWithAppLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppLink:");
}

id objc_msgSend_initWithBaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBaseURL:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_includeIcon_includeBadgeIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:includeIcon:includeBadgeIcon:");
}

id objc_msgSend_initWithBundleIdentifier_isInstalled_isRestricted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:isInstalled:isRestricted:");
}

id objc_msgSend_initWithBundleIdentifier_primitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:primitives:");
}

id objc_msgSend_initWithBundleIdentifier_primitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:primitives:device:");
}

id objc_msgSend_initWithBundleIdentifier_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:queue:");
}

id objc_msgSend_initWithBundleIdentifier_shortVersionString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:shortVersionString:");
}

id objc_msgSend_initWithBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifiers:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithCRKFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCRKFeature:");
}

id objc_msgSend_initWithCRKFeature_enrollmentRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCRKFeature:enrollmentRecord:");
}

id objc_msgSend_initWithCRKFeature_enrollmentRecord_forceKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCRKFeature:enrollmentRecord:forceKey:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCancelableGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCancelableGenerator:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClassKitFacade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClassKitFacade:");
}

id objc_msgSend_initWithClock_IDSLocalPrimitives_IDSAddressTranslator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClock:IDSLocalPrimitives:IDSAddressTranslator:");
}

id objc_msgSend_initWithClock_accountsPrimitives_IDSLocalPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClock:accountsPrimitives:IDSLocalPrimitives:");
}

id objc_msgSend_initWithCommonName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCommonName:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConfiguration_claimedIdentityPersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:claimedIdentityPersistentIDs:");
}

id objc_msgSend_initWithConfiguration_device_primitives_shouldReturnDMFErrors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:device:primitives:shouldReturnDMFErrors:");
}

id objc_msgSend_initWithConfiguration_enrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:enrollmentRecords:");
}

id objc_msgSend_initWithConfiguration_primitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:primitives:");
}

id objc_msgSend_initWithConfigurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:");
}

id objc_msgSend_initWithConfigurationManager_daemon_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:daemon:device:");
}

id objc_msgSend_initWithConfigurationManager_endpoint_instructorPlatform_instructorOSVersion_instructorClassroomAppVersion_studentIdentity_serverResourceCache_daemon_device_applicationWorkspace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:endpoint:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:studentIdentity:serverResourceCache:daemon:device:applicationWorkspace:");
}

id objc_msgSend_initWithConfigurationManager_sessionInfo_sessionIdentifier_enrollmentRecord_tokenAuthenticator_sessionToken_courseFirstSeenDate_dateProvider_instructorPlatform_instructorOSVersion_instructorClassroomAppVersion_operationQueue_studentIdentity_IDSMessageBroadcaster_keychain_screenshotServiceProxy_serverResourceCache_featureDataStore_lockScreenMonitor_daemon_device_primitives_classSessionReporter_applicationWorkspace_idleStateProvider_signInHistoryStorage_classKitReSyncer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationManager:sessionInfo:sessionIdentifier:enrollmentRecord:tokenAuthenticator:sessionToken:courseFirstSeenDate:dateProvider:instructorPlatform:instructorOSVersion:instructorClassroomAppVersion:operationQueue:studentIdentity:IDSMessageBroadcaster:keychain:screenshotServiceProxy:serverResourceCache:featureDataStore:lockScreenMonitor:daemon:device:primitives:classSessionReporter:applicationWorkspace:idleStateProvider:signInHistoryStorage:classKitReSyncer:");
}

id objc_msgSend_initWithConfigurationType_courseCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigurationType:courseCount:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithCourseIdentifier_IPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCourseIdentifier:IPAddress:");
}

id objc_msgSend_initWithCourseIdentifier_instructorIdentifier_targetIPAddress_rosterProvider_certificateConduit_IDSCacheClearer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCourseIdentifier:instructorIdentifier:targetIPAddress:rosterProvider:certificateConduit:IDSCacheClearer:");
}

id objc_msgSend_initWithCoursePrivateIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoursePrivateIdentity:");
}

id objc_msgSend_initWithDaemon_device_configurationManager_timerPrimitives_dateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDaemon:device:configurationManager:timerPrimitives:dateProvider:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:name:");
}

id objc_msgSend_initWithDatabaseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabaseURL:");
}

id objc_msgSend_initWithDateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDateProvider:");
}

id objc_msgSend_initWithDatesByAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatesByAppleID:");
}

id objc_msgSend_initWithDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:");
}

id objc_msgSend_initWithDevice_store_dateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:store:dateProvider:");
}

id objc_msgSend_initWithDeviceID_airPlayPlayPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeviceID:airPlayPlayPrimitives:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDictionary_groupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:groupIdentifier:");
}

id objc_msgSend_initWithDictionary_type_hidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:type:hidden:");
}

id objc_msgSend_initWithDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDirectoryURL:");
}

id objc_msgSend_initWithDirectoryURL_maximumTotalFileSize_maximumTotalFileCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDirectoryURL:maximumTotalFileSize:maximumTotalFileCount:");
}

id objc_msgSend_initWithEnrollmentRecord_configurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnrollmentRecord:configurationManager:");
}

id objc_msgSend_initWithEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnrollmentRecords:");
}

id objc_msgSend_initWithEnrollmentRecordsByIdentifier_identifiersToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnrollmentRecordsByIdentifier:identifiersToDelete:");
}

id objc_msgSend_initWithExclusiveOperationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExclusiveOperationManager:");
}

id objc_msgSend_initWithFileName_source_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileName:source:destination:");
}

id objc_msgSend_initWithFileSystemPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileSystemPrimitives:");
}

id objc_msgSend_initWithFileSystemPrimitives_accountPrimitives_transactionPrimitives_timerPrimitives_limit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileSystemPrimitives:accountPrimitives:transactionPrimitives:timerPrimitives:limit:");
}

id objc_msgSend_initWithFileSystemPrimitives_itemURL_deleteOnlyIfEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileSystemPrimitives:itemURL:deleteOnlyIfEmpty:");
}

id objc_msgSend_initWithFileSystemPrimitives_sourceURL_destinationURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileSystemPrimitives:sourceURL:destinationURL:");
}

id objc_msgSend_initWithFileURLs_keepOriginalFiles_previewImageData_senderName_autoAccept_sourceBundleIdentifier_filesDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURLs:keepOriginalFiles:previewImageData:senderName:autoAccept:sourceBundleIdentifier:filesDescription:");
}

id objc_msgSend_initWithGate_accountsPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGate:accountsPrimitives:");
}

id objc_msgSend_initWithGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGenerator:");
}

id objc_msgSend_initWithGroupIdentifier_groupName_groupDescription_groupMascotType_groupColorType_rollingCourseIdentitySet_instructorsByIdentifier_trustedAnchorCertificatePersistentIDs_groupUser_requestingUnenroll_automaticRemovalDate_type_hidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:requestingUnenroll:automaticRemovalDate:type:hidden:");
}

id objc_msgSend_initWithGroupIdentifier_groupName_groupDescription_groupMascotType_groupColorType_rollingCourseIdentitySet_instructorsByIdentifier_trustedAnchorCertificatePersistentIDs_groupUser_tombstoned_requestingUnenroll_automaticRemovalDate_type_hidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupIdentifier:groupName:groupDescription:groupMascotType:groupColorType:rollingCourseIdentitySet:instructorsByIdentifier:trustedAnchorCertificatePersistentIDs:groupUser:tombstoned:requestingUnenroll:automaticRemovalDate:type:hidden:");
}

id objc_msgSend_initWithGroupIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupIdentifiers:");
}

id objc_msgSend_initWithIDSLocalPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSLocalPrimitives:");
}

id objc_msgSend_initWithIDSLocalPrimitives_IDSReadinessEvaluator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSLocalPrimitives:IDSReadinessEvaluator:");
}

id objc_msgSend_initWithIDSPrimitives_addressTranslator_timerPrimitives_operationQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSPrimitives:addressTranslator:timerPrimitives:operationQueue:");
}

id objc_msgSend_initWithIDSPrimitives_appleIDProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSPrimitives:appleIDProvider:");
}

id objc_msgSend_initWithIDSPrimitives_assertionProvider_sourceAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIDSPrimitives:assertionProvider:sourceAppleID:");
}

id objc_msgSend_initWithIdentifier_cancelValue_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:cancelValue:actionHandler:");
}

id objc_msgSend_initWithIdentifier_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:type:");
}

id objc_msgSend_initWithIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentity:");
}

id objc_msgSend_initWithIdentityPersistentId_stagedIdentityPersistentId_groupIdentifier_studentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentityPersistentId:stagedIdentityPersistentId:groupIdentifier:studentIdentifier:");
}

id objc_msgSend_initWithInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInfo:");
}

id objc_msgSend_initWithInterfaceOrientationProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInterfaceOrientationProvider:");
}

id objc_msgSend_initWithKey_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:value:");
}

id objc_msgSend_initWithLSApplicationRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLSApplicationRecord:");
}

id objc_msgSend_initWithLSPrimitives_featureDataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLSPrimitives:featureDataStore:");
}

id objc_msgSend_initWithLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLayouts:");
}

id objc_msgSend_initWithLockScreenPrimitives_userNotificationPrimitives_globalNotificationPrimitives_options_timeout_flags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLockScreenPrimitives:userNotificationPrimitives:globalNotificationPrimitives:options:timeout:flags:");
}

id objc_msgSend_initWithLowBatteryPropertyProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLowBatteryPropertyProvider:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMessage_senderAppleID_senderAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMessage:senderAppleID:senderAddress:");
}

id objc_msgSend_initWithMigrationTaskProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMigrationTaskProvider:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_date_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:date:userInfo:");
}

id objc_msgSend_initWithName_hasAccess_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:hasAccess:device:");
}

id objc_msgSend_initWithNonXPCTransport_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNonXPCTransport:device:");
}

id objc_msgSend_initWithNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotification:");
}

id objc_msgSend_initWithNotificationCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationCenter:");
}

id objc_msgSend_initWithNumberOfDaysBeforeAutomaticRemoval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNumberOfDaysBeforeAutomaticRemoval:");
}

id objc_msgSend_initWithObject_keyPaths_conditionEvaluator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObject:keyPaths:conditionEvaluator:");
}

id objc_msgSend_initWithOrganizationUUID_groupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrganizationUUID:groupID:");
}

id objc_msgSend_initWithOutputDevice_airPlayPrimitives_password_suppressPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOutputDevice:airPlayPrimitives:password:suppressPrompt:");
}

id objc_msgSend_initWithOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOwner:");
}

id objc_msgSend_initWithPersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentIDs:");
}

id objc_msgSend_initWithPlatform_configurationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPlatform:configurationManager:");
}

id objc_msgSend_initWithPrimaryRosterProvider_secondaryRosterProvider_IDSPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrimaryRosterProvider:secondaryRosterProvider:IDSPrimitives:");
}

id objc_msgSend_initWithPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrimitives:");
}

id objc_msgSend_initWithPrimitives_addressTranslator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrimitives:addressTranslator:");
}

id objc_msgSend_initWithPrimitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPrimitives:device:");
}

id objc_msgSend_initWithProcessInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProcessInfo:");
}

id objc_msgSend_initWithRemainingRecordsByIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemainingRecordsByIdentifier:error:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithRequest_context_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:context:delegate:");
}

id objc_msgSend_initWithRequest_context_delegate_feature_alertModel_supportsAlwaysAllow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:context:delegate:feature:alertModel:supportsAlwaysAllow:");
}

id objc_msgSend_initWithRequest_session_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:session:context:");
}

id objc_msgSend_initWithResourceURLs_serverIdentity_trustedCertificates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResourceURLs:serverIdentity:trustedCertificates:");
}

id objc_msgSend_initWithResources_clientIdentity_trustedCertificates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResources:clientIdentity:trustedCertificates:");
}

id objc_msgSend_initWithResponseFlags_responseDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithResponseFlags:responseDictionary:");
}

id objc_msgSend_initWithRollingIdentity_userIdentifier_groupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRollingIdentity:userIdentifier:groupIdentifier:");
}

id objc_msgSend_initWithRootPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootPrimitives:");
}

id objc_msgSend_initWithRosterProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:");
}

id objc_msgSend_initWithRosterProvider_IDSPrimitives_IDSAddressTranslator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:IDSPrimitives:IDSAddressTranslator:");
}

id objc_msgSend_initWithRosterProvider_IDSPrimitives_IDSAddressTranslator_dataStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:IDSPrimitives:IDSAddressTranslator:dataStore:");
}

id objc_msgSend_initWithRosterProvider_certificateConduit_IDSCacheClearer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:certificateConduit:IDSCacheClearer:");
}

id objc_msgSend_initWithRosterProvider_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:device:");
}

id objc_msgSend_initWithRosterProvider_studentClassKitFacade_certificateConduit_IDSPrimitives_IDSAddressTranslator_IDSCacheClearer_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRosterProvider:studentClassKitFacade:certificateConduit:IDSPrimitives:IDSAddressTranslator:IDSCacheClearer:device:");
}

id objc_msgSend_initWithScaleFactor_width_height_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScaleFactor:width:height:orientation:");
}

id objc_msgSend_initWithServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceName:");
}

id objc_msgSend_initWithSession_postsDMFNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSession:postsDMFNotification:");
}

id objc_msgSend_initWithSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionIdentifier:");
}

id objc_msgSend_initWithSessionIdentifier_sessionInfo_isQuarantined_daemon_includeImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionIdentifier:sessionInfo:isQuarantined:daemon:includeImage:");
}

id objc_msgSend_initWithSessionToken_feature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSessionToken:feature:");
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSettings:");
}

id objc_msgSend_initWithSimulations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSimulations:");
}

id objc_msgSend_initWithStartDate_endDate_eventDatas_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:eventDatas:");
}

id objc_msgSend_initWithStartDate_endDate_events_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStartDate:endDate:events:");
}

id objc_msgSend_initWithStore_faultHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStore:faultHandler:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTarget_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:queue:");
}

id objc_msgSend_initWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeout:");
}

id objc_msgSend_initWithTimerPrimitives_dateProvider_timeout_timeoutHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimerPrimitives:dateProvider:timeout:timeoutHandler:");
}

id objc_msgSend_initWithTimerPrimitives_lockScreenPrimitives_userNotificationPoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimerPrimitives:lockScreenPrimitives:userNotificationPoster:");
}

id objc_msgSend_initWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:message:");
}

id objc_msgSend_initWithTransport_XPCPrimitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransport:XPCPrimitives:device:");
}

id objc_msgSend_initWithTransport_clientUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTransport:clientUserInfo:");
}

id objc_msgSend_initWithType_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:data:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithUnderlyingPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnderlyingPrimitives:");
}

id objc_msgSend_initWithUnderlyingStore_dateProvider_maximumEventAge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUnderlyingStore:dateProvider:maximumEventAge:");
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValue:");
}

id objc_msgSend_initWithValuesByPropertyKey_errorsByPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithValuesByPropertyKey:errorsByPropertyKey:");
}

id objc_msgSend_initWithXPCConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:");
}

id objc_msgSend_initWithXPCPrimitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCPrimitives:device:");
}

id objc_msgSend_initWithXPCTransport_XPCPrimitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCTransport:XPCPrimitives:device:");
}

id objc_msgSend_initWithmacOSBundleIdentifier_iOSBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithmacOSBundleIdentifier:iOSBundleIdentifier:");
}

id objc_msgSend_initialOpenAppOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialOpenAppOperation");
}

id objc_msgSend_initializeEventRecorder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeEventRecorder");
}

id objc_msgSend_installSingleAppModeRestriction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installSingleAppModeRestriction");
}

id objc_msgSend_installedApplicationInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedApplicationInfo");
}

id objc_msgSend_installedEDUProfile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedEDUProfile");
}

id objc_msgSend_installedProfilesWithFilterFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedProfilesWithFilterFlags:");
}

id objc_msgSend_instanceWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instanceWithDictionary:");
}

id objc_msgSend_instructor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructor");
}

id objc_msgSend_instructorClassKitFacade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorClassKitFacade");
}

id objc_msgSend_instructorClassroomAppVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorClassroomAppVersion");
}

id objc_msgSend_instructorCredentialStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorCredentialStore");
}

id objc_msgSend_instructorIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorIdentifier");
}

id objc_msgSend_instructorIdentifierForAppleID_courseIdentifier_rosterProvider_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorIdentifierForAppleID:courseIdentifier:rosterProvider:error:");
}

id objc_msgSend_instructorImageData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorImageData");
}

id objc_msgSend_instructorName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorName");
}

id objc_msgSend_instructorPlatform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorPlatform");
}

id objc_msgSend_instructorUserWithIdentifier_forSessionWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorUserWithIdentifier:forSessionWithIdentifier:");
}

id objc_msgSend_instructorWithSessionIdentifier_sessionInfo_user_enrollmentRecord_imageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorWithSessionIdentifier:sessionInfo:user:enrollmentRecord:imageData:");
}

id objc_msgSend_instructordBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructordBundleIdentifier");
}

id objc_msgSend_instructorsByIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorsByIdentifier");
}

id objc_msgSend_instructorsDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instructorsDidChange");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerFromDate:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_interfaceOrientationProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientationProvider");
}

id objc_msgSend_internalOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalOperation");
}

id objc_msgSend_intersections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersections");
}

id objc_msgSend_invalidResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidResult");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateUnenrollmentRequestsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateUnenrollmentRequestsIfNeeded");
}

id objc_msgSend_invalidateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateWithError:");
}

id objc_msgSend_invitation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitation");
}

id objc_msgSend_invitationSessionWithEndpointInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invitationSessionWithEndpointInvalidated:");
}

id objc_msgSend_isASM(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isASM");
}

id objc_msgSend_isASMClassSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isASMClassSession:");
}

id objc_msgSend_isAccepted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccepted");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isActiveConnectionIndicatorVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActiveConnectionIndicatorVisible");
}

id objc_msgSend_isActiveIdentityValidObeyingOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActiveIdentityValidObeyingOverride:");
}

id objc_msgSend_isAdHoc(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAdHoc");
}

id objc_msgSend_isAppLockOperationCurrentlyRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppLockOperationCurrentlyRunning");
}

id objc_msgSend_isAppLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppLocked");
}

id objc_msgSend_isApplicationOpen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationOpen:");
}

id objc_msgSend_isApplicationOpen_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isApplicationOpen:device:");
}

id objc_msgSend_isAsking(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAsking");
}

id objc_msgSend_isAutomaticallyJoinClassesForcedOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAutomaticallyJoinClassesForcedOn");
}

id objc_msgSend_isBonafideClassSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBonafideClassSession:");
}

id objc_msgSend_isBrowsing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBrowsing");
}

id objc_msgSend_isBundleIdentifierLaunchable_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleIdentifierLaunchable:error:");
}

id objc_msgSend_isBundleIdentifierLaunchable_returnDMFError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundleIdentifierLaunchable:returnDMFError:error:");
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCanceled");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isClassroomAutomaticClassJoiningForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClassroomAutomaticClassJoiningForced");
}

id objc_msgSend_isClassroomLockScreenVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClassroomLockScreenVisible");
}

id objc_msgSend_isClassroomRequestPermissionToLeaveClassesForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClassroomRequestPermissionToLeaveClassesForced");
}

id objc_msgSend_isClassroomUnpromptedScreenObservationForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isClassroomUnpromptedScreenObservationForced");
}

id objc_msgSend_isCurrentDeviceIdle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentDeviceIdle");
}

id objc_msgSend_isCurrentlyTrackingIdleness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentlyTrackingIdleness");
}

id objc_msgSend_isDMFRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDMFRequest");
}

id objc_msgSend_isDMFRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDMFRequest:");
}

id objc_msgSend_isDateWithinLast24Hours_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDateWithinLast24Hours:");
}

id objc_msgSend_isDeviceIdentifierForThisDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeviceIdentifierForThisDevice:");
}

id objc_msgSend_isDisabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDisabled");
}

id objc_msgSend_isEDUPayloadInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEDUPayloadInstalled");
}

id objc_msgSend_isEligibleForSessionSnapshotting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEligibleForSessionSnapshotting");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEphemeralMultiUser");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToFeature:");
}

id objc_msgSend_isEqualToRemoteEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToRemoteEndpoint:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExclusive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExclusive");
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isExecuting");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isFolder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFolder");
}

id objc_msgSend_isForCourseIdentifier_instructorIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForCourseIdentifier:instructorIdentifier:targetIPAddress:");
}

id objc_msgSend_isForCourseIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForCourseIdentifier:targetIPAddress:");
}

id objc_msgSend_isForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForced");
}

id objc_msgSend_isForcedByRestriction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForcedByRestriction");
}

id objc_msgSend_isForcingAccountsInactive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForcingAccountsInactive");
}

id objc_msgSend_isForcingRemoteUsersNotRegistered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isForcingRemoteUsersNotRegistered");
}

id objc_msgSend_isGuidedAccessActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isGuidedAccessActive");
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHidden");
}

id objc_msgSend_isIDSSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIDSSession");
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIdle");
}

id objc_msgSend_isInRangeClassSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInRangeClassSession:");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInstalled");
}

id objc_msgSend_isInstructorIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInstructorIdentity:");
}

id objc_msgSend_isInstructorOnEDU(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInstructorOnEDU");
}

id objc_msgSend_isInstructorWithSessionIdentifierObservingScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInstructorWithSessionIdentifierObservingScreen:");
}

id objc_msgSend_isLaunchableReturningDMFError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLaunchableReturningDMFError:error:");
}

id objc_msgSend_isLocalNetworkSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocalNetworkSession");
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocked");
}

id objc_msgSend_isLockedError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLockedError:");
}

id objc_msgSend_isLoginUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLoginUser");
}

id objc_msgSend_isLowBattery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLowBattery");
}

id objc_msgSend_isMainDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainDisplay");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isManaged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManaged");
}

id objc_msgSend_isMeCardUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMeCardUser");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isModifiable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isModifiable");
}

id objc_msgSend_isMuted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMuted");
}

id objc_msgSend_isNonXPCSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNonXPCSession");
}

id objc_msgSend_isObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObserving");
}

id objc_msgSend_isObservingAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObservingAccounts");
}

id objc_msgSend_isObservingDeviceIdleness(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObservingDeviceIdleness");
}

id objc_msgSend_isObservingRoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObservingRoster");
}

id objc_msgSend_isOpenWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOpenWithError:");
}

id objc_msgSend_isPasscodeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPasscodeEnabled");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPersistentIDClaimed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPersistentIDClaimed:");
}

id objc_msgSend_isPostedOnLockedScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPostedOnLockedScreen");
}

id objc_msgSend_isQuarantined(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isQuarantined");
}

id objc_msgSend_isRateLimited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRateLimited");
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecording");
}

id objc_msgSend_isRemoteUserNotRegisteredError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRemoteUserNotRegisteredError:");
}

id objc_msgSend_isRequestDMF(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequestDMF");
}

id objc_msgSend_isRequestDeniedError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequestDeniedError:");
}

id objc_msgSend_isRequestingInstructorAlreadyConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequestingInstructorAlreadyConnected");
}

id objc_msgSend_isRequestingUnenroll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRequestingUnenroll");
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRestricted");
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunning");
}

id objc_msgSend_isRunningOnInternalOS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningOnInternalOS");
}

id objc_msgSend_isSafariBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSafariBundleIdentifier:");
}

id objc_msgSend_isScreenLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isScreenLocked");
}

id objc_msgSend_isScreenObserveIndicatorVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isScreenObserveIndicatorVisible");
}

id objc_msgSend_isScreenSaverActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isScreenSaverActive");
}

id objc_msgSend_isSessionEligibleForSnapshotting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSessionEligibleForSnapshotting:");
}

id objc_msgSend_isSessionIdentifierInRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSessionIdentifierInRange:");
}

id objc_msgSend_isSessionQuarantined_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSessionQuarantined:");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSharedIPad");
}

id objc_msgSend_isSignedInToStudentMAID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignedInToStudentMAID");
}

id objc_msgSend_isStudent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStudent");
}

id objc_msgSend_isStudentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStudentConfiguration:");
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSupervised");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isTemporallyValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTemporallyValid");
}

id objc_msgSend_isTimeToStageIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTimeToStageIdentity");
}

id objc_msgSend_isTokenAuthenticated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTokenAuthenticated:");
}

id objc_msgSend_isTombstoned(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTombstoned");
}

id objc_msgSend_isTruncated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTruncated");
}

id objc_msgSend_isTrustedByInstructor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isTrustedByInstructor");
}

id objc_msgSend_isUnspecifiedError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUnspecifiedError:");
}

id objc_msgSend_isUpdating(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUpdating");
}

id objc_msgSend_isUsingCachedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUsingCachedData");
}

id objc_msgSend_isValidRequestClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidRequestClass:");
}

id objc_msgSend_isValidWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidWithError:");
}

id objc_msgSend_isWebBrowser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWebBrowser");
}

id objc_msgSend_isWebBrowser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isWebBrowser:");
}

id objc_msgSend_isXPCSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXPCSession");
}

id objc_msgSend_isiOS(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isiOS");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "item");
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemURL");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_joinClassPromptFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClassPromptFlags");
}

id objc_msgSend_joinClassPromptOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinClassPromptOptions");
}

id objc_msgSend_joinCourse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "joinCourse");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyForURL:");
}

id objc_msgSend_keychain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychain");
}

id objc_msgSend_keychainGroup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainGroup");
}

id objc_msgSend_lastCacheClearFinishDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastCacheClearFinishDate");
}

id objc_msgSend_lastLoginDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastLoginDate");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPromptFinishDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPromptFinishDate");
}

id objc_msgSend_laterDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laterDate:");
}

id objc_msgSend_launchAppOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchAppOperation");
}

id objc_msgSend_launchServicesPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchServicesPrimitives");
}

id objc_msgSend_launchServicesQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchServicesQueue");
}

id objc_msgSend_layoutElementsForRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutElementsForRole:");
}

id objc_msgSend_layoutMonitorsByIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMonitorsByIdentity");
}

id objc_msgSend_layoutRole(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutRole");
}

id objc_msgSend_layouts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layouts");
}

id objc_msgSend_leaderIP(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leaderIP");
}

id objc_msgSend_leafBookmarkWithName_URL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leafBookmarkWithName:URL:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "limit");
}

id objc_msgSend_listWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listWithID:");
}

id objc_msgSend_listenerForMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "listenerForMachServiceName:");
}

id objc_msgSend_loadHistory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadHistory");
}

id objc_msgSend_localOutputDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localOutputDevice");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lockDeviceMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockDeviceMessage");
}

id objc_msgSend_lockDeviceTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockDeviceTitle");
}

id objc_msgSend_lockDeviceTitleWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockDeviceTitleWithInstructorName:");
}

id objc_msgSend_lockInApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockInApp");
}

id objc_msgSend_lockInAppForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockInAppForRequest:");
}

id objc_msgSend_lockOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockOperation");
}

id objc_msgSend_lockScreenDidAppear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenDidAppear");
}

id objc_msgSend_lockScreenDidDisappear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenDidDisappear");
}

id objc_msgSend_lockScreenEmbeddedAppBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenEmbeddedAppBundleIdentifiers");
}

id objc_msgSend_lockScreenEvaluationCounter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenEvaluationCounter");
}

id objc_msgSend_lockScreenMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenMonitor");
}

id objc_msgSend_lockScreenPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenPrimitives");
}

id objc_msgSend_lockScreenStateSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockScreenStateSubscription");
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockState");
}

id objc_msgSend_lockStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockStateDidChange:");
}

id objc_msgSend_lockStateProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockStateProvider");
}

id objc_msgSend_lockStateStatusProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockStateStatusProvider");
}

id objc_msgSend_lockStateStatusProviderWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockStateStatusProviderWithCompletion:");
}

id objc_msgSend_lockStateStatusSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockStateStatusSubscription");
}

id objc_msgSend_lockTextWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockTextWithInstructorName:");
}

id objc_msgSend_lockedByLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockedByLabel");
}

id objc_msgSend_lockedByLabelForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lockedByLabelForRequest:");
}

id objc_msgSend_logEventDatabaseMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logEventDatabaseMigrationTasks");
}

id objc_msgSend_loginID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loginID");
}

id objc_msgSend_loginState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loginState");
}

id objc_msgSend_lostConnectionToClassSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lostConnectionToClassSession:");
}

id objc_msgSend_lostConnectionToInvitationSessionWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lostConnectionToInvitationSessionWithEndpoint:");
}

id objc_msgSend_lostCourseIdentifiersWithOldRoster_newRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lostCourseIdentifiersWithOldRoster:newRoster:");
}

id objc_msgSend_lowBatteryPropertyProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowBatteryPropertyProvider");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_macOSBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "macOSBundleIdentifier");
}

id objc_msgSend_mainIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainIdentity");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreenScale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreenScale");
}

id objc_msgSend_mainScreenSizeInPixels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreenSizeInPixels");
}

id objc_msgSend_makeActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeActivities");
}

id objc_msgSend_makeAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeAppProvider");
}

id objc_msgSend_makeApplicationInfoDictionaries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeApplicationInfoDictionaries");
}

id objc_msgSend_makeApplicationInfos(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeApplicationInfos");
}

id objc_msgSend_makeCertificateWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeCertificateWithData:");
}

id objc_msgSend_makeClaimedAnchorCertificatePersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeClaimedAnchorCertificatePersistentIDs");
}

id objc_msgSend_makeClassSessionBrowser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeClassSessionBrowser");
}

id objc_msgSend_makeCountedCancelable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeCountedCancelable");
}

id objc_msgSend_makeDecoratedPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDecoratedPrimitives");
}

id objc_msgSend_makeDevicePrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeDevicePrimitives");
}

id objc_msgSend_makeEasyMAIDSignInRosterProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeEasyMAIDSignInRosterProvider");
}

id objc_msgSend_makeEnrollmentRecordWithCourse_groupUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeEnrollmentRecordWithCourse:groupUser:");
}

id objc_msgSend_makeEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeEnrollmentRecords");
}

id objc_msgSend_makeEnrollmentRecordsByIdentifierWithEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeEnrollmentRecordsByIdentifierWithEnrollmentRecords:");
}

id objc_msgSend_makeErrorWithErrorsByGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeErrorWithErrorsByGroupIdentifier:");
}

id objc_msgSend_makeFailedToSetVolumeError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFailedToSetVolumeError");
}

id objc_msgSend_makeFeatureDataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFeatureDataStore");
}

id objc_msgSend_makeFeatureFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFeatureFlags");
}

id objc_msgSend_makeFirewallOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeFirewallOperation");
}

id objc_msgSend_makeIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeIdentity");
}

id objc_msgSend_makeIdentityUsingFactory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeIdentityUsingFactory");
}

id objc_msgSend_makeIdentityWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeIdentityWithConfiguration:");
}

id objc_msgSend_makeInstructorClassKitFacadeWithPersonaAdoption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInstructorClassKitFacadeWithPersonaAdoption:");
}

id objc_msgSend_makeInstructorRosterWithoutKeychainAndWithPersonaAdoption(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInstructorRosterWithoutKeychainAndWithPersonaAdoption");
}

id objc_msgSend_makeInstructorsByIdentifierWithTrustedUsers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInstructorsByIdentifierWithTrustedUsers:");
}

id objc_msgSend_makeInvitationIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInvitationIdentity");
}

id objc_msgSend_makeInvitationIdentityConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeInvitationIdentityConfiguration");
}

id objc_msgSend_makeLayoutMonitorConfigurationForIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeLayoutMonitorConfigurationForIdentity:");
}

id objc_msgSend_makeLayoutMonitorForIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeLayoutMonitorForIdentity:");
}

id objc_msgSend_makeMaxIdleLengthTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeMaxIdleLengthTimer");
}

id objc_msgSend_makeMeCardUserProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeMeCardUserProvider");
}

id objc_msgSend_makeMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeMigrationTasks");
}

id objc_msgSend_makeMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeMonitor");
}

id objc_msgSend_makeMuteOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeMuteOperation");
}

id objc_msgSend_makeNotificationIdentifierWithCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeNotificationIdentifierWithCategoryIdentifier:");
}

id objc_msgSend_makeNotificationWithOptions_flags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeNotificationWithOptions:flags:error:");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_makeOpenSpringboardOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOpenSpringboardOperation");
}

id objc_msgSend_makeOperationToPerformStartAppLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOperationToPerformStartAppLock");
}

id objc_msgSend_makeOperationToPostNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOperationToPostNotification");
}

id objc_msgSend_makeOperationsToGenerateActiveInstructorsIncludingImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOperationsToGenerateActiveInstructorsIncludingImages:");
}

id objc_msgSend_makeOperationsToGenerateIdleInstructorsIncludingImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOperationsToGenerateIdleInstructorsIncludingImages:");
}

id objc_msgSend_makeOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOptions");
}

id objc_msgSend_makeOptionsDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeOptionsDictionary");
}

id objc_msgSend_makePauseOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makePauseOperation");
}

id objc_msgSend_makePrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makePrimitives");
}

id objc_msgSend_makeRemainingEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRemainingEnrollmentRecords");
}

id objc_msgSend_makeRemainingEnrollmentRecordsByIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRemainingEnrollmentRecordsByIdentifier");
}

id objc_msgSend_makeRemoteAttendanceNotificationSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRemoteAttendanceNotificationSound");
}

id objc_msgSend_makeRemoteUserNotRegisteredError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRemoteUserNotRegisteredError");
}

id objc_msgSend_makeRenewalOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRenewalOptions");
}

id objc_msgSend_makeResultObjectWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeResultObjectWithData:");
}

id objc_msgSend_makeResultObjectWithDatesByAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeResultObjectWithDatesByAppleID:");
}

id objc_msgSend_makeResultObjectWithGroupIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeResultObjectWithGroupIdentifiers:");
}

id objc_msgSend_makeResultObjectWithNumberOfDaysBeforeAutomaticRemoval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeResultObjectWithNumberOfDaysBeforeAutomaticRemoval:");
}

id objc_msgSend_makeRosterProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeRosterProvider");
}

id objc_msgSend_makeScreenDimmingPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeScreenDimmingPrimitives");
}

id objc_msgSend_makeSearchForOutputDeviceOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeSearchForOutputDeviceOperation");
}

id objc_msgSend_makeSetOutputDeviceOperationForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeSetOutputDeviceOperationForDevice:");
}

id objc_msgSend_makeStartAppLockRequestForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeStartAppLockRequestForBundleIdentifier:");
}

id objc_msgSend_makeStoreWithDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeStoreWithDirectoryURL:");
}

id objc_msgSend_makeStudentClassKitFacade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeStudentClassKitFacade");
}

id objc_msgSend_makeStudentRosterProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeStudentRosterProvider");
}

id objc_msgSend_makeUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeUUIDs");
}

id objc_msgSend_makeUnableToOpenAppErrorForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeUnableToOpenAppErrorForBundleIdentifier:");
}

id objc_msgSend_makeUnableToOpenURLErrorWithUnderlyingError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeUnableToOpenURLErrorWithUnderlyingError:");
}

id objc_msgSend_makeUserWithASMUser_role_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeUserWithASMUser:role:");
}

id objc_msgSend_managedAnchorPersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedAnchorPersistentIDs");
}

id objc_msgSend_managedIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedIdentity");
}

id objc_msgSend_managedOrganizationUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedOrganizationUUID");
}

id objc_msgSend_managedRollingDeviceIdentitySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedRollingDeviceIdentitySet");
}

id objc_msgSend_managedXPCContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedXPCContext");
}

id objc_msgSend_managedXPCEnrollmentRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedXPCEnrollmentRecord");
}

id objc_msgSend_managementLockPasscodeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managementLockPasscodeProvider");
}

id objc_msgSend_mascot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mascot");
}

id objc_msgSend_mascotType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mascotType");
}

id objc_msgSend_maxHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxHeight");
}

id objc_msgSend_maxIdleLengthTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxIdleLengthTimer");
}

id objc_msgSend_maxIdleLengthTimerDidFire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxIdleLengthTimerDidFire");
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxSize");
}

id objc_msgSend_maxWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxWidth");
}

id objc_msgSend_maximumEventAge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maximumEventAge");
}

id objc_msgSend_maybeClearIDSCacheForInstructorAppleID_courseIdentifier_dependingOnError_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maybeClearIDSCacheForInstructorAppleID:courseIdentifier:dependingOnError:completion:");
}

id objc_msgSend_meCardUserProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meCardUserProvider");
}

id objc_msgSend_merge(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "merge");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "message");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadata");
}

id objc_msgSend_metadataTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataTracker");
}

id objc_msgSend_metadataTrackerKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataTrackerKey");
}

id objc_msgSend_migrateDatabaseWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateDatabaseWithError:");
}

id objc_msgSend_migrateFromCorruptStagedCertificateCommonNames(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateFromCorruptStagedCertificateCommonNames");
}

id objc_msgSend_migrationSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrationSession");
}

id objc_msgSend_migrationSessionDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrationSessionDidFinish:");
}

id objc_msgSend_migrationTaskProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrationTaskProvider");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minute");
}

id objc_msgSend_mirroringRouteUIDForRouteUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mirroringRouteUIDForRouteUID:");
}

id objc_msgSend_mobileKeyBagPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mobileKeyBagPrimitives");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "model");
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitor");
}

id objc_msgSend_monitor_forIdentity_didUpdateLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitor:forIdentity:didUpdateLayout:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_monotonicClock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monotonicClock");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableConfiguration");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameComponents");
}

id objc_msgSend_nextLoginState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextLoginState");
}

id objc_msgSend_nilOutAllProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nilOutAllProperties");
}

id objc_msgSend_noAccountsActiveStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noAccountsActiveStartDate");
}

id objc_msgSend_noteRestrictionsUpdateForOpensWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noteRestrictionsUpdateForOpensWithCompletion:");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationCenter");
}

id objc_msgSend_notificationDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDuration");
}

id objc_msgSend_notificationDurationTimerDidFire(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDurationTimerDidFire");
}

id objc_msgSend_notificationDurationTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationDurationTimerIdentifier");
}

id objc_msgSend_notificationName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationName");
}

id objc_msgSend_notificationOperationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationOperationQueue");
}

id objc_msgSend_notificationRef(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationRef");
}

id objc_msgSend_notificationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationType");
}

id objc_msgSend_notifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifications");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfConnectionsForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfConnectionsForCourseIdentifier:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_observeBrowsedOutputDeviceChangesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeBrowsedOutputDeviceChangesWithHandler:");
}

id objc_msgSend_observeCurrentOutputDeviceChangesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observeCurrentOutputDeviceChangesWithHandler:");
}

id objc_msgSend_observedDeviceKeyPaths(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedDeviceKeyPaths");
}

id objc_msgSend_observedKeyPaths(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedKeyPaths");
}

id objc_msgSend_observedObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observedObject");
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "observers");
}

id objc_msgSend_oldStudentdLibraryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "oldStudentdLibraryURL");
}

id objc_msgSend_openAfterDownloadCompletes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAfterDownloadCompletes");
}

id objc_msgSend_openAppMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppMessage");
}

id objc_msgSend_openAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppProvider");
}

id objc_msgSend_openAppRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppRequest");
}

id objc_msgSend_openAppTextWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppTextWithInstructorName:");
}

id objc_msgSend_openAppTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppTitle");
}

id objc_msgSend_openAppTitleWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppTitleWithInstructorName:");
}

id objc_msgSend_openAppWithBundleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openAppWithBundleIdentifier:completion:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_openBundleIdentifier_primitives_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openBundleIdentifier:primitives:completion:");
}

id objc_msgSend_openConfiguration_primitives_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openConfiguration:primitives:completion:");
}

id objc_msgSend_openRequestedURLWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openRequestedURLWithCompletion:");
}

id objc_msgSend_openTransferredApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openTransferredApp");
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withOptions:error:");
}

id objc_msgSend_openURLMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLMessage");
}

id objc_msgSend_openURLTextWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLTextWithInstructorName:");
}

id objc_msgSend_openURLTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLTitle");
}

id objc_msgSend_openURLTitleWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLTitleWithInstructorName:");
}

id objc_msgSend_openURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURLs:");
}

id objc_msgSend_openWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openWithError:");
}

id objc_msgSend_openedApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openedApps");
}

id objc_msgSend_operationCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationCount");
}

id objc_msgSend_operationMightHaveBecomeExclusive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationMightHaveBecomeExclusive:");
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationQueue");
}

id objc_msgSend_operationToAddAllowedAppleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToAddAllowedAppleIDs:");
}

id objc_msgSend_operationToFetchAllowedAppleIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToFetchAllowedAppleIDs");
}

id objc_msgSend_operationToFetchCertificateForDestinationAppleID_sourceAppleID_destinationDeviceIdentifier_controlGroupIdentifier_sourceRole_destinationRole_requesterCertificate_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToFetchCertificateForDestinationAppleID:sourceAppleID:destinationDeviceIdentifier:controlGroupIdentifier:sourceRole:destinationRole:requesterCertificate:timeout:");
}

id objc_msgSend_operationToRemoveAllowedAppleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationToRemoveAllowedAppleIDs:");
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operations");
}

id objc_msgSend_operationsToGenerateIdleInstructorsWithDaemon_includeImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationsToGenerateIdleInstructorsWithDaemon:includeImages:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_optionsFromSTUOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsFromSTUOptions:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_organizationUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "organizationUUID");
}

id objc_msgSend_organizationUUIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "organizationUUIDs");
}

id objc_msgSend_originalTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalTable");
}

id objc_msgSend_osTransactionPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "osTransactionPrimitives");
}

id objc_msgSend_outputDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputDevice");
}

id objc_msgSend_outputDeviceChangeObservation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputDeviceChangeObservation");
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputDevices");
}

id objc_msgSend_ownerAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerAppleID");
}

id objc_msgSend_ownerRecheckInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerRecheckInterval");
}

id objc_msgSend_ownerRecheckTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ownerRecheckTimerIdentifier");
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcode");
}

id objc_msgSend_passcodeEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeEnabled");
}

id objc_msgSend_passcodeEnabledDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeEnabledDidChange");
}

id objc_msgSend_passcodeForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeForRequest:");
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passcodeType");
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "password");
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "passwordType");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_paths(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "paths");
}

id objc_msgSend_payloads(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "payloads");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performDeletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDeletion");
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigration");
}

id objc_msgSend_performRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:inModes:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_permission(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permission");
}

id objc_msgSend_permissionForConfigurationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permissionForConfigurationUUID:");
}

id objc_msgSend_permissionResultObjectWithPermission_modifiable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permissionResultObjectWithPermission:modifiable:");
}

id objc_msgSend_permissionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permissionWithError:");
}

id objc_msgSend_permissionsByFeatureForEnrollmentRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permissionsByFeatureForEnrollmentRecord:");
}

id objc_msgSend_persistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentIDs");
}

id objc_msgSend_persistentIDsClaimedByEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentIDsClaimedByEnrollmentRecords:");
}

id objc_msgSend_phoneticFamilyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneticFamilyName");
}

id objc_msgSend_phoneticGivenName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "phoneticGivenName");
}

id objc_msgSend_pin(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pin");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "platform");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "port");
}

id objc_msgSend_ports(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ports");
}

id objc_msgSend_postActiveInstructorsDidChangeXPCNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postActiveInstructorsDidChangeXPCNotification");
}

id objc_msgSend_postConfigurationChangeNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postConfigurationChangeNotification");
}

id objc_msgSend_postConfigurationDidChangeXPCNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postConfigurationDidChangeXPCNotification");
}

id objc_msgSend_postDevicePropertyChangedNotification_course_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postDevicePropertyChangedNotification:course:");
}

id objc_msgSend_postInformativeNotificationWithTitle_subtitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postInformativeNotificationWithTitle:subtitle:");
}

id objc_msgSend_postInitialUserNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postInitialUserNotification");
}

id objc_msgSend_postMainNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postMainNotification");
}

id objc_msgSend_postNotificationForInitialInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationForInitialInvitations");
}

id objc_msgSend_postNotificationForPropertyChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationForPropertyChange:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_postNotificationOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationOperation");
}

id objc_msgSend_postNotificationToSessionWithIdentifier_name_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationToSessionWithIdentifier:name:userInfo:");
}

id objc_msgSend_postNotificationWithName_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationWithName:userInfo:");
}

id objc_msgSend_postNotificationWithTitle_subtitle_categoryIdentifier_cancelValue_sound_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationWithTitle:subtitle:categoryIdentifier:cancelValue:sound:actionHandler:");
}

id objc_msgSend_postRemoteConnectionNotificationWithInstructorName_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postRemoteConnectionNotificationWithInstructorName:actionHandler:");
}

id objc_msgSend_postShareNotificationForResources_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postShareNotificationForResources:");
}

id objc_msgSend_postShareNotificationForURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postShareNotificationForURL:");
}

id objc_msgSend_postsDMFNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postsDMFNotification");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prefixForCommonNamePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefixForCommonNamePrefix:");
}

id objc_msgSend_prefixForStudentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prefixForStudentIdentifier:");
}

id objc_msgSend_presentCourseIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCourseIdentifiers");
}

id objc_msgSend_previewImageData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewImageData");
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousState");
}

id objc_msgSend_primaryApp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryApp");
}

id objc_msgSend_primaryAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAppProvider");
}

id objc_msgSend_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAppleAccount");
}

id objc_msgSend_primaryAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primaryAppleID");
}

id objc_msgSend_primitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "primitives");
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateKey");
}

id objc_msgSend_processAction_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processAction:reason:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processName");
}

id objc_msgSend_processPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPrimitives");
}

id objc_msgSend_profileConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileConfiguration");
}

id objc_msgSend_profileConfigurationMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileConfigurationMetadata");
}

id objc_msgSend_profileCourseConfigurationMetadataForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileCourseConfigurationMetadataForCourseIdentifier:");
}

id objc_msgSend_profilesContainingEDUPayload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profilesContainingEDUPayload");
}

id objc_msgSend_promoteStagedIdentityToActiveIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promoteStagedIdentityToActiveIdentity");
}

id objc_msgSend_promptForCredentials(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promptForCredentials");
}

id objc_msgSend_propertyKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyKeys");
}

id objc_msgSend_propertyKeysForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyKeysForRequest:");
}

id objc_msgSend_propertyKeysForSubscriptionRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyKeysForSubscriptionRequest:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyObservationGatekeeper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyObservationGatekeeper");
}

id objc_msgSend_propertyProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyProviders");
}

id objc_msgSend_providersByKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providersByKey");
}

id objc_msgSend_proxiesContainClassroomApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proxiesContainClassroomApp:");
}

id objc_msgSend_pruneOldEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pruneOldEvents");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publisher");
}

id objc_msgSend_purgeEventsBeforeDate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeEventsBeforeDate:error:");
}

id objc_msgSend_quarantineAllowedTaskRequestClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quarantineAllowedTaskRequestClasses");
}

id objc_msgSend_quarantineIDSSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quarantineIDSSessionIdentifier:");
}

id objc_msgSend_quarantinedIDSSessionIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "quarantinedIDSSessionIdentifiers");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queue");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_readingListFolder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readingListFolder");
}

id objc_msgSend_readingListFolderWithChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readingListFolderWithChildren:");
}

id objc_msgSend_realErrorForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "realErrorForError:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reason");
}

id objc_msgSend_receiveResponse_withValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveResponse:withValue:");
}

id objc_msgSend_recheckHistoryOwnerTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recheckHistoryOwnerTimer");
}

id objc_msgSend_recheckHistoryOwnerTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recheckHistoryOwnerTransaction");
}

id objc_msgSend_recordAcceptedCourseInvitationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAcceptedCourseInvitationWithIdentifier:");
}

id objc_msgSend_recordCurrentOpenApps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCurrentOpenApps");
}

id objc_msgSend_recordCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordCurrentState");
}

id objc_msgSend_recordEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent:");
}

id objc_msgSend_recordNoAccountsActiveStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordNoAccountsActiveStartDate");
}

id objc_msgSend_redeliverDelayTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redeliverDelayTimerIdentifier");
}

id objc_msgSend_redeliveryDelay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redeliveryDelay");
}

id objc_msgSend_redeliveryDelayTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redeliveryDelayTimer");
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refresh");
}

id objc_msgSend_refreshCertificatesForCourseWithIdentifier_instructorIdentifier_targetIPAddress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshCertificatesForCourseWithIdentifier:instructorIdentifier:targetIPAddress:completion:");
}

id objc_msgSend_refreshCertificatesOperationDidFinish_courseIdentifier_instructorIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshCertificatesOperationDidFinish:courseIdentifier:instructorIdentifier:targetIPAddress:");
}

id objc_msgSend_refreshCertificatesOperationForCourseIdentifier_instructorIdentifier_targetIPAddress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:");
}

id objc_msgSend_refreshCourses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshCourses");
}

id objc_msgSend_refreshIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshIdentities");
}

id objc_msgSend_refreshOperations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshOperations");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_registerHandlerForFilePathKeepAliveEventStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForFilePathKeepAliveEventStream:");
}

id objc_msgSend_registerHandlerForNotificationEventStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandlerForNotificationEventStream:");
}

id objc_msgSend_registerUserSwitchStakeHolder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUserSwitchStakeHolder:");
}

id objc_msgSend_regularFileContents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularFileContents");
}

id objc_msgSend_releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseConnectWithoutBeaconAssertionForInvitationSessionWithEndpoint:");
}

id objc_msgSend_releaseConnectWithoutBeaconAssertionForSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseConnectWithoutBeaconAssertionForSessionIdentifier:");
}

id objc_msgSend_releaseDaemonActivityAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "releaseDaemonActivityAssertion");
}

id objc_msgSend_remainingEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingEnrollmentRecords");
}

id objc_msgSend_remainingRecordsByIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingRecordsByIdentifier");
}

id objc_msgSend_remoteUsersNotRegisteredAssertionCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteUsersNotRegisteredAssertionCount");
}

id objc_msgSend_removalDateFromBaseDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removalDateFromBaseDate:");
}

id objc_msgSend_removeAll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAll");
}

id objc_msgSend_removeAllCachedResources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllCachedResources");
}

id objc_msgSend_removeAllDataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllDataWithError:");
}

id objc_msgSend_removeAllFiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllFiles");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAllowedAppleIDsFromFirewall_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllowedAppleIDsFromFirewall:completion:");
}

id objc_msgSend_removeCacheTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCacheTasks");
}

id objc_msgSend_removeContainerTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContainerTasks");
}

id objc_msgSend_removeCurrentAppLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCurrentAppLock");
}

id objc_msgSend_removeDataForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDataForKey:error:");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeEnrollmentRecordWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEnrollmentRecordWithIdentifier:error:");
}

id objc_msgSend_removeEnrollmentRecordWithIdentifier_updateEffectiveConfiguration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEnrollmentRecordWithIdentifier:updateEffectiveConfiguration:error:");
}

id objc_msgSend_removeEnrollmentRecordsWithIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEnrollmentRecordsWithIdentifiers:error:");
}

id objc_msgSend_removeEnrollmentRecordsWithIdentifiers_updateEffectiveConfiguration_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeEnrollmentRecordsWithIdentifiers:updateEffectiveConfiguration:error:");
}

id objc_msgSend_removeHistoryFile(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeHistoryFile");
}

id objc_msgSend_removeIdentityForEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeIdentityForEndpoint:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeItemWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemWithPersistentID:");
}

id objc_msgSend_removeItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItems:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingNotificationRequestsWithIdentifiers:");
}

id objc_msgSend_removeRestrictionsObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRestrictionsObserver:");
}

id objc_msgSend_removeSnapshotForSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSnapshotForSessionIdentifier:");
}

id objc_msgSend_removeSnapshotsForSessionIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSnapshotsForSessionIdentifiers:");
}

id objc_msgSend_removeStaleStudentImagesWithOldEnrollmentRecords_newEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeStaleStudentImagesWithOldEnrollmentRecords:newEnrollmentRecords:");
}

id objc_msgSend_removedCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removedCourseIdentifier:");
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:force:reason:completion:");
}

id objc_msgSend_renewPrimaryAppleIDCredentialsWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewPrimaryAppleIDCredentialsWithOptions:completion:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestHasAllowedClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestHasAllowedClass:");
}

id objc_msgSend_requestPermissionToLeaveClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestPermissionToLeaveClasses");
}

id objc_msgSend_requestToBecomeExclusive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestToBecomeExclusive");
}

id objc_msgSend_requestToMakeOperationExclusive_successBlock_failureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestToMakeOperationExclusive:successBlock:failureBlock:");
}

id objc_msgSend_requestToUpdateUser_withUser_courseIdentifier_outUsersEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestToUpdateUser:withUser:courseIdentifier:outUsersEqual:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_requestingUnenroll(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestingUnenroll");
}

id objc_msgSend_requireLoggedInUser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requireLoggedInUser");
}

id objc_msgSend_requiredNotificationOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiredNotificationOptions");
}

id objc_msgSend_requiresPassword(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresPassword");
}

id objc_msgSend_reregister(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reregister");
}

id objc_msgSend_resourceCacheDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceCacheDirectoryURL");
}

id objc_msgSend_resourceHostingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceHostingQueue");
}

id objc_msgSend_resourceIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceIdentity");
}

id objc_msgSend_resourcePersistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcePersistentID");
}

id objc_msgSend_resourceURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceURL");
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resources");
}

id objc_msgSend_resourcesDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourcesDescription");
}

id objc_msgSend_responseDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseDictionary");
}

id objc_msgSend_responseFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseFlags");
}

id objc_msgSend_responseForAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseForAction:");
}

id objc_msgSend_restorationBlockForWhitelist_previousState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorationBlockForWhitelist:previousState:");
}

id objc_msgSend_restoreWhitelistIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreWhitelistIfNeeded");
}

id objc_msgSend_restrictedBools(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictedBools");
}

id objc_msgSend_restrictionDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictionDictionary");
}

id objc_msgSend_restrictionUUIDKeeper(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restrictionUUIDKeeper");
}

id objc_msgSend_resultDictionaryForRollingIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultDictionaryForRollingIdentity:");
}

id objc_msgSend_resultObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultObject");
}

id objc_msgSend_resultWithCertificateDataCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resultWithCertificateDataCollection:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resyncClassKitIfInstructor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resyncClassKitIfInstructor");
}

id objc_msgSend_resyncClassKitIfStudent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resyncClassKitIfStudent");
}

id objc_msgSend_resyncClassKitWithFacade_userEvaluator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resyncClassKitWithFacade:userEvaluator:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rollingCourseIdentitySet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollingCourseIdentitySet");
}

id objc_msgSend_rollingDeviceIdentitySetForEnrollmentRecordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollingDeviceIdentitySetForEnrollmentRecordType:");
}

id objc_msgSend_rollingDeviceIdentitySetInAdHocConfiguration_studentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rollingDeviceIdentitySetInAdHocConfiguration:studentIdentifier:");
}

id objc_msgSend_rootList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootList");
}

id objc_msgSend_rootPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootPrimitives");
}

id objc_msgSend_roster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "roster");
}

id objc_msgSend_rosterProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rosterProvider");
}

id objc_msgSend_routeDictionaryWithUID_name_requiresPIN_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routeDictionaryWithUID:name:requiresPIN:");
}

id objc_msgSend_routeName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routeName");
}

id objc_msgSend_routeUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "routeUID");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_runWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithRequest:");
}

id objc_msgSend_runningBoardPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningBoardPrimitives");
}

id objc_msgSend_safari(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safari");
}

id objc_msgSend_safariBookmarkCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safariBookmarkCollection");
}

id objc_msgSend_safariBookmarks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safariBookmarks");
}

id objc_msgSend_sandboxExtensions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sandboxExtensions");
}

id objc_msgSend_saveHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveHistory:");
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaleFactor");
}

id objc_msgSend_scheduleHistoryOwnerRecheckTimerIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleHistoryOwnerRecheckTimerIfNeeded");
}

id objc_msgSend_scheduleTimerWithIdentifier_timeInterval_fireHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTimerWithIdentifier:timeInterval:fireHandler:");
}

id objc_msgSend_scheduleWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleWithCompletion:");
}

id objc_msgSend_scheduledNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledNotifications");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_screenDimmingPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenDimmingPrimitives");
}

id objc_msgSend_screenObserveMessageLocal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenObserveMessageLocal");
}

id objc_msgSend_screenObserveMessageRemote(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenObserveMessageRemote");
}

id objc_msgSend_screenObserveTextWithInstructorName_isLocalNetworkConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenObserveTextWithInstructorName:isLocalNetworkConnection:");
}

id objc_msgSend_screenObserveTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenObserveTitle");
}

id objc_msgSend_screenObserveTitleWithInstructorName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenObserveTitleWithInstructorName:");
}

id objc_msgSend_screenState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenState");
}

id objc_msgSend_screenshareActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshareActivity");
}

id objc_msgSend_screenshareStatusItemServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshareStatusItemServer");
}

id objc_msgSend_screenshotServiceProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotServiceProxy");
}

id objc_msgSend_searchForOutputDeviceOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchForOutputDeviceOperation");
}

id objc_msgSend_searchForOutputDeviceTimeoutTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchForOutputDeviceTimeoutTimerIdentifier");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "second");
}

id objc_msgSend_secondaryAppProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryAppProvider");
}

id objc_msgSend_selectedResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedResponse");
}

id objc_msgSend_selfReportedSessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selfReportedSessionIdentifier");
}

id objc_msgSend_send_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendMessage_destinationAddress_sourceAppleID_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:destinationAddress:sourceAppleID:options:completion:");
}

id objc_msgSend_sendMessage_toAddress_fromID_options_identifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessage:toAddress:fromID:options:identifier:error:");
}

id objc_msgSend_senderName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "senderName");
}

id objc_msgSend_sequentialOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequentialOperation");
}

id objc_msgSend_sequentialOperationWithOperations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sequentialOperationWithOperations:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumberProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumberProvider");
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialQueue");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "server");
}

id objc_msgSend_serverResourceCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverResourceCache");
}

id objc_msgSend_serviceProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProxy");
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceWithDefaultShellEndpoint");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_sessionBrowser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionBrowser");
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifier");
}

id objc_msgSend_sessionIdentifierForTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIdentifierForTimer:");
}

id objc_msgSend_sessionInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionInfo");
}

id objc_msgSend_sessionToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionToken");
}

id objc_msgSend_sessionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionUUID");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccepted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccepted:");
}

id objc_msgSend_setAcceptedInvitationIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptedInvitationIdentifiers:");
}

id objc_msgSend_setAccountChangeSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountChangeSubscription:");
}

id objc_msgSend_setAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccounts:");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActiveConnectionIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveConnectionIndicatorVisible:");
}

id objc_msgSend_setActiveCourseIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveCourseIdentifiers:");
}

id objc_msgSend_setActiveIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveIdentityPersistentID:");
}

id objc_msgSend_setActiveInstructorIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveInstructorIdentifiers:");
}

id objc_msgSend_setActiveRestrictionUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRestrictionUUIDs:");
}

id objc_msgSend_setActiveRouteDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveRouteDictionary:");
}

id objc_msgSend_setActiveStudentIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveStudentIdentifier:completion:");
}

id objc_msgSend_setActiveUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveUserIdentifier:");
}

id objc_msgSend_setActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivities:");
}

id objc_msgSend_setActivityData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityData:");
}

id objc_msgSend_setActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityType:");
}

id objc_msgSend_setAdHocBaseUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocBaseUserIdentifier:");
}

id objc_msgSend_setAdHocConfigAllowsAutomaticallyJoinClasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocConfigAllowsAutomaticallyJoinClasses:");
}

id objc_msgSend_setAdHocConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocConfiguration:");
}

id objc_msgSend_setAdHocConfiguration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocConfiguration:completion:");
}

id objc_msgSend_setAdHocDefaultStudentInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocDefaultStudentInformation:");
}

id objc_msgSend_setAdHocEnrollmentRecordsByGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdHocEnrollmentRecordsByGroupIdentifier:");
}

id objc_msgSend_setAirplayStatusCancelable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAirplayStatusCancelable:");
}

id objc_msgSend_setAllOpenBundleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllOpenBundleIDs:");
}

id objc_msgSend_setAllowInvitationSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowInvitationSessions:");
}

id objc_msgSend_setAllowUnenrolledSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowUnenrolledSessions:");
}

id objc_msgSend_setAllowedAppleIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedAppleIDs:");
}

id objc_msgSend_setAllowsStudentInitiatedDisconnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsStudentInitiatedDisconnection:");
}

id objc_msgSend_setAppBundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppBundleURL:");
}

id objc_msgSend_setAppLockOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppLockOperation:");
}

id objc_msgSend_setApplicationRecordStateSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationRecordStateSubscription:");
}

id objc_msgSend_setApplicationsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationsByIdentifier:");
}

id objc_msgSend_setAssertions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssertions:");
}

id objc_msgSend_setAttemptsRemaining_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttemptsRemaining:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAttribution_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribution:");
}

id objc_msgSend_setAutomaticRemovalDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticRemovalDate:");
}

id objc_msgSend_setAuxiliaryEnrolledGroupsByUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuxiliaryEnrolledGroupsByUserIdentifier:");
}

id objc_msgSend_setAuxiliaryUsers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuxiliaryUsers:");
}

id objc_msgSend_setAvailableAirPlayRoutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAvailableAirPlayRoutes:");
}

id objc_msgSend_setBackingLockStateProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingLockStateProvider:");
}

id objc_msgSend_setBackingOpenAppRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackingOpenAppRequest:");
}

id objc_msgSend_setBadgeValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeValue:");
}

id objc_msgSend_setBadgeValue_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeValue:forBundleIdentifier:");
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBatteryMonitoringEnabled:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBookmarks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBookmarks:");
}

id objc_msgSend_setBoolValue_ask_forSetting_configurationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBoolValue:ask:forSetting:configurationUUID:");
}

id objc_msgSend_setBrowsing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowsing:");
}

id objc_msgSend_setBrowsingSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBrowsingSession:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifiers:");
}

id objc_msgSend_setBundleIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifiers:error:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCacheClearInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCacheClearInProgress:");
}

id objc_msgSend_setCachedDefaultWebBrowserBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedDefaultWebBrowserBundleIdentifier:");
}

id objc_msgSend_setCachedImageData_forURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedImageData:forURL:");
}

id objc_msgSend_setCancellationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancellationBlock:");
}

id objc_msgSend_setCardInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCardInfo:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setCertificateData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCertificateData:");
}

id objc_msgSend_setChangeIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeIndex:");
}

id objc_msgSend_setChangeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeToken:");
}

id objc_msgSend_setClassroomInstructorRoleEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClassroomInstructorRoleEnabled:");
}

id objc_msgSend_setClassroomStatusCancelable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClassroomStatusCancelable:");
}

id objc_msgSend_setClassroomStudentRoleEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClassroomStudentRoleEnabled:");
}

id objc_msgSend_setCommonNamePrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommonNamePrefix:");
}

id objc_msgSend_setCompletedUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletedUnitCount:");
}

id objc_msgSend_setCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletion:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConditionMatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConditionMatcher:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConfigurationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationType:");
}

id objc_msgSend_setConfigurationsByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationsByType:");
}

id objc_msgSend_setConnectionTerminal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectionTerminal:");
}

id objc_msgSend_setConsumedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsumedTime:");
}

id objc_msgSend_setCountOfRemovedRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountOfRemovedRecords:");
}

id objc_msgSend_setCourse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourse:");
}

id objc_msgSend_setCourseColorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseColorType:");
}

id objc_msgSend_setCourseDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseDescription:");
}

id objc_msgSend_setCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseIdentifier:");
}

id objc_msgSend_setCourseIdentityInfosByGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseIdentityInfosByGroupIdentifier:");
}

id objc_msgSend_setCourseInvitations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseInvitations:");
}

id objc_msgSend_setCourseMascotType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseMascotType:");
}

id objc_msgSend_setCourseName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseName:");
}

id objc_msgSend_setCourseUser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourseUser:");
}

id objc_msgSend_setCourses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCourses:");
}

id objc_msgSend_setCreatesNewApplicationInstance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreatesNewApplicationInstance:");
}

id objc_msgSend_setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:");
}

id objc_msgSend_setCredentials_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredentials:");
}

id objc_msgSend_setCurrentDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDate:");
}

id objc_msgSend_setCurrentOutputDeviceObservation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentOutputDeviceObservation:");
}

id objc_msgSend_setData_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:forKey:error:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeviceGestalt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceGestalt:");
}

id objc_msgSend_setDidClassroomLockScreenDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidClassroomLockScreenDisplay:");
}

id objc_msgSend_setDisallowsClassroomAirDropOverLocalNetwork_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisallowsClassroomAirDropOverLocalNetwork:");
}

id objc_msgSend_setDiscoveryMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscoveryMode:");
}

id objc_msgSend_setDisplayMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayMonitor:");
}

id objc_msgSend_setDisplayName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayName:");
}

id objc_msgSend_setDisplays_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplays:");
}

id objc_msgSend_setEligibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEligibility:");
}

id objc_msgSend_setEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndpoint:");
}

id objc_msgSend_setEnrolledControlGroupIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnrolledControlGroupIdentifiers:");
}

id objc_msgSend_setEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnrollmentRecords:");
}

id objc_msgSend_setEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnvironment:");
}

id objc_msgSend_setErrorsByPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setErrorsByPropertyKey:");
}

id objc_msgSend_setEventLog_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventLog:");
}

id objc_msgSend_setExclusive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExclusive:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFamilyName:");
}

id objc_msgSend_setFetchOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchOperation:");
}

id objc_msgSend_setFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilename:");
}

id objc_msgSend_setFirewallOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirewallOperation:");
}

id objc_msgSend_setFirstSeenDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstSeenDate:");
}

id objc_msgSend_setFirstUnlockSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockSubscription:");
}

id objc_msgSend_setFollowUpOpenAppOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFollowUpOpenAppOperation:");
}

id objc_msgSend_setForce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForce:");
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGivenName:");
}

id objc_msgSend_setGlobalNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGlobalNotification:");
}

id objc_msgSend_setGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroup:");
}

id objc_msgSend_setGroupColorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupColorType:");
}

id objc_msgSend_setGroupDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupDescription:");
}

id objc_msgSend_setGroupEnrollmentRecords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupEnrollmentRecords:");
}

id objc_msgSend_setGroupEnrollmentRecordsByGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupEnrollmentRecordsByGroupIdentifier:");
}

id objc_msgSend_setGroupID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupID:");
}

id objc_msgSend_setGroupMascotType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupMascotType:");
}

id objc_msgSend_setGroupName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupName:");
}

id objc_msgSend_setHTTPMaximumConnectionsPerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMaximumConnectionsPerHost:");
}

id objc_msgSend_setHandlesNotifications_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlesNotifications:");
}

id objc_msgSend_setHasIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasIdentities:");
}

id objc_msgSend_setHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHistory:");
}

id objc_msgSend_setHistoryVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHistoryVersion:");
}

id objc_msgSend_setIconImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconImageData:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setImageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageIdentifier:");
}

id objc_msgSend_setInRangeClassSessions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInRangeClassSessions:");
}

id objc_msgSend_setInRangeRefreshIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInRangeRefreshIdentifiers:");
}

id objc_msgSend_setInactiveAccountsAssertionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInactiveAccountsAssertionCount:");
}

id objc_msgSend_setInitialOpenAppOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialOpenAppOperation:");
}

id objc_msgSend_setInstalledApplicationInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledApplicationInfo:");
}

id objc_msgSend_setInstalledEDUProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstalledEDUProfile:");
}

id objc_msgSend_setInstructor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstructor:");
}

id objc_msgSend_setInstructors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstructors:");
}

id objc_msgSend_setInstructorsByIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstructorsByIdentifier:");
}

id objc_msgSend_setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterfaceOrientation:");
}

id objc_msgSend_setInternalOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalOperation:");
}

id objc_msgSend_setInvitationSessionDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitationSessionDelegate:");
}

id objc_msgSend_setIsInstructorOnEDU_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsInstructorOnEDU:");
}

id objc_msgSend_setIsTruncated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsTruncated:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setLastCacheClearFinishDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastCacheClearFinishDate:");
}

id objc_msgSend_setLastPromptFinishDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPromptFinishDate:");
}

id objc_msgSend_setLaunchAppOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchAppOperation:");
}

id objc_msgSend_setLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLimit:");
}

id objc_msgSend_setLiveProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiveProperties:");
}

id objc_msgSend_setLockInApp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockInApp:");
}

id objc_msgSend_setLockOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockOperation:");
}

id objc_msgSend_setLockScreenEvaluationCounter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockScreenEvaluationCounter:");
}

id objc_msgSend_setLockScreenStateSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockScreenStateSubscription:");
}

id objc_msgSend_setLockStateStatusProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockStateStatusProvider:");
}

id objc_msgSend_setLockStateStatusSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLockStateStatusSubscription:");
}

id objc_msgSend_setLowBattery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLowBattery:");
}

id objc_msgSend_setManagedAnchorPersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedAnchorPersistentIDs:");
}

id objc_msgSend_setManagedIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedIdentity:");
}

id objc_msgSend_setManagedOrganizationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedOrganizationUUID:");
}

id objc_msgSend_setManagedRollingDeviceIdentitySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManagedRollingDeviceIdentitySet:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMaxIdleLengthTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxIdleLengthTimer:");
}

id objc_msgSend_setMaxTotalFileCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxTotalFileCount:");
}

id objc_msgSend_setMaxTotalFileSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxTotalFileSize:");
}

id objc_msgSend_setMaximumAllowedDownloads_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumAllowedDownloads:");
}

id objc_msgSend_setMdmIdentityCommonName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMdmIdentityCommonName:");
}

id objc_msgSend_setMigrationSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMigrationSession:");
}

id objc_msgSend_setModifiable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiable:");
}

id objc_msgSend_setMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitor:");
}

id objc_msgSend_setMustRequestUnenroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMustRequestUnenroll:");
}

id objc_msgSend_setMute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMute:");
}

id objc_msgSend_setMuted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMuted:");
}

id objc_msgSend_setNeedsUserInteractivePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUserInteractivePriority:");
}

id objc_msgSend_setNoAccountsActiveStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoAccountsActiveStartDate:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setNotificationDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationDelegate:");
}

id objc_msgSend_setNotificationRef_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotificationRef:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObservedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservedObject:");
}

id objc_msgSend_setObserving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObserving:");
}

id objc_msgSend_setObservingAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservingAccounts:");
}

id objc_msgSend_setObservingDeviceIdleness_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservingDeviceIdleness:");
}

id objc_msgSend_setObservingRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservingRoster:");
}

id objc_msgSend_setObservingStudentScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObservingStudentScreen:");
}

id objc_msgSend_setOrganizationUUIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrganizationUUIDs:");
}

id objc_msgSend_setOutputDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputDevice:");
}

id objc_msgSend_setOutputDeviceChangeObservation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputDeviceChangeObservation:");
}

id objc_msgSend_setOutputDeviceOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputDeviceOperation");
}

id objc_msgSend_setOutputDeviceTimeoutTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOutputDeviceTimeoutTimerIdentifier");
}

id objc_msgSend_setOwnerAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOwnerAppleID:");
}

id objc_msgSend_setPasscodeEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPasscodeEnabled:");
}

id objc_msgSend_setPermission_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermission:");
}

id objc_msgSend_setPermission_forConfigurationUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermission:forConfigurationUUID:");
}

id objc_msgSend_setPermissionsByFeature_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermissionsByFeature:");
}

id objc_msgSend_setPhoneticFamilyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneticFamilyName:");
}

id objc_msgSend_setPhoneticGivenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneticGivenName:");
}

id objc_msgSend_setPostNotificationOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostNotificationOperation:");
}

id objc_msgSend_setPostedOnLockedScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPostedOnLockedScreen:");
}

id objc_msgSend_setPredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicates:");
}

id objc_msgSend_setPrivateKeyData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivateKeyData:");
}

id objc_msgSend_setProfileConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfileConfiguration:");
}

id objc_msgSend_setProfileConfigurationMetadata_updateEffectiveConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfileConfigurationMetadata:updateEffectiveConfiguration:");
}

id objc_msgSend_setProfileCourseConfigurationMetadata_courseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfileCourseConfigurationMetadata:courseIdentifier:");
}

id objc_msgSend_setReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReason:");
}

id objc_msgSend_setRecheckHistoryOwnerTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecheckHistoryOwnerTimer:");
}

id objc_msgSend_setRecheckHistoryOwnerTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecheckHistoryOwnerTransaction:");
}

id objc_msgSend_setRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecording:");
}

id objc_msgSend_setRedeliveryDelayTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedeliveryDelayTimer:");
}

id objc_msgSend_setRemoteUsersNotRegisteredAssertionCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteUsersNotRegisteredAssertionCount:");
}

id objc_msgSend_setRequestUnenroll_forCourseWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestUnenroll:forCourseWithIdentifier:completion:");
}

id objc_msgSend_setRequestingUnenroll_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestingUnenroll:");
}

id objc_msgSend_setResourceData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceData:");
}

id objc_msgSend_setResourceFileURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceFileURLs:");
}

id objc_msgSend_setResourceIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceIdentity:");
}

id objc_msgSend_setResourcePersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourcePersistentID:");
}

id objc_msgSend_setResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResourceValue:forKey:error:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRollingCourseIdentitySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRollingCourseIdentitySet:");
}

id objc_msgSend_setScreenObserveIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenObserveIndicatorVisible:");
}

id objc_msgSend_setScreenshareActivityCancelable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshareActivityCancelable:");
}

id objc_msgSend_setScreenshotData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScreenshotData:");
}

id objc_msgSend_setSearchForOutputDeviceOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchForOutputDeviceOperation:");
}

id objc_msgSend_setSecondaryName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryName:");
}

id objc_msgSend_setSequentialOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSequentialOperation:");
}

id objc_msgSend_setSessionBrowser_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionBrowser:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setSessionToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionToken:");
}

id objc_msgSend_setSetOutputDeviceOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetOutputDeviceOperation:");
}

id objc_msgSend_setShouldBecomeExclusive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldBecomeExclusive:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRepeat:");
}

id objc_msgSend_setShouldSuppressDefaultAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressDefaultAction:");
}

id objc_msgSend_setSignedInToStudentMAID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignedInToStudentMAID:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setStagedAdHocIdentityCertificate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStagedAdHocIdentityCertificate:");
}

id objc_msgSend_setStagedIdentityPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStagedIdentityPersistentID:");
}

id objc_msgSend_setStartAppLockOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartAppLockOperation:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStateDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateDictionary:");
}

id objc_msgSend_setStaticProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStaticProperties:");
}

id objc_msgSend_setStu_currentLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStu_currentLayout:");
}

id objc_msgSend_setStudentCredentialsAreValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStudentCredentialsAreValid:");
}

id objc_msgSend_setStudentIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStudentIdentifier:");
}

id objc_msgSend_setSupportsFileURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsFileURLs:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTargetApplicationRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetApplicationRecord:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeout:");
}

id objc_msgSend_setTimeoutHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutHandler:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTimeoutTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutTimer:");
}

id objc_msgSend_setTimeoutTimerStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeoutTimerStartDate:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToneIdentifier:");
}

id objc_msgSend_setTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalUnitCount:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTruncated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTruncated:");
}

id objc_msgSend_setTrustedAnchorCertificatePersistentIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedAnchorCertificatePersistentIDs:");
}

id objc_msgSend_setTrustedCertificatePersistentIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedCertificatePersistentIds:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnlockedConditionMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnlockedConditionMonitor:");
}

id objc_msgSend_setUpWithPrimitives_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpWithPrimitives:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUpdating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdating:");
}

id objc_msgSend_setUseMeCardIfAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseMeCardIfAvailable:");
}

id objc_msgSend_setUserIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserIdentifier:");
}

id objc_msgSend_setUserImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserImageData:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserNotification:");
}

id objc_msgSend_setUserNotificationPoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserNotificationPoster:");
}

id objc_msgSend_setUserSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserSource:");
}

id objc_msgSend_setValidTrustedCertificatePersistentIds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidTrustedCertificatePersistentIds:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValue_forKey_courseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:courseIdentifier:");
}

id objc_msgSend_setValuesByPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesByPropertyKey:");
}

id objc_msgSend_setValuesByRestriction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesByRestriction:");
}

id objc_msgSend_setVolumeController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeController:");
}

id objc_msgSend_setVolumeTo_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeTo:forCategory:");
}

id objc_msgSend_setWaitForOpenedAppToAppearOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitForOpenedAppToAppearOperation:");
}

id objc_msgSend_setWaitForUnlockOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitForUnlockOperation:");
}

id objc_msgSend_setWaitForUnlockedStateOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitForUnlockedStateOperation:");
}

id objc_msgSend_setWaitsForDeviceUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitsForDeviceUnlock:");
}

id objc_msgSend_setWakeScreenOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWakeScreenOperation:");
}

id objc_msgSend_setWakesScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWakesScreen:");
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsNotificationResponsesDelivered");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setupSignalHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSignalHandler");
}

id objc_msgSend_shareDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareDescription");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAVSystemController");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedExtensionProxy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedExtensionProxy");
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedFactory");
}

id objc_msgSend_sharedGestalt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedGestalt");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedProvider");
}

id objc_msgSend_sharedSystemInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSystemInfo");
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedToneManager");
}

id objc_msgSend_sharedTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedTracker");
}

id objc_msgSend_sharedWhitelist(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedWhitelist");
}

id objc_msgSend_sharediPadPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharediPadPrimitives");
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortVersionString");
}

id objc_msgSend_shouldAutoAcceptRemoteInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAutoAcceptRemoteInvitations");
}

id objc_msgSend_shouldBecomeExclusive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldBecomeExclusive");
}

id objc_msgSend_shouldForce(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForce");
}

id objc_msgSend_shouldForceAccountsInactive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceAccountsInactive");
}

id objc_msgSend_shouldForceCreateStagedIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceCreateStagedIdentity");
}

id objc_msgSend_shouldForceExpireActiveIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceExpireActiveIdentity");
}

id objc_msgSend_shouldForceRemoteUsersNotRegistered(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceRemoteUsersNotRegistered");
}

id objc_msgSend_shouldMute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldMute");
}

id objc_msgSend_shouldRefreshCertificatesForClassSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRefreshCertificatesForClassSession:");
}

id objc_msgSend_shouldRemoveRecordToday_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRemoveRecordToday:");
}

id objc_msgSend_shouldRetryAfterError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRetryAfterError:");
}

id objc_msgSend_shouldSuppressPrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSuppressPrompt");
}

id objc_msgSend_shouldUseMeCardIfAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseMeCardIfAvailable");
}

id objc_msgSend_showActiveConnectionIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showActiveConnectionIndicator");
}

id objc_msgSend_showScreenObserveIndicator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showScreenObserveIndicator");
}

id objc_msgSend_signInHistoryMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInHistoryMigrationTasks");
}

id objc_msgSend_signInHistoryPlistURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInHistoryPlistURL");
}

id objc_msgSend_signInHistoryStorage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInHistoryStorage");
}

id objc_msgSend_simulateRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulateRequest");
}

id objc_msgSend_simulations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "simulations");
}

id objc_msgSend_snapshotManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotManager");
}

id objc_msgSend_snapshotManager_identifierForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotManager:identifierForSession:");
}

id objc_msgSend_snapshotManagerDidUpdateIdleInstructors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotManagerDidUpdateIdleInstructors:");
}

id objc_msgSend_snapshotSession_withIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotSession:withIdentifier:");
}

id objc_msgSend_snapshotsBySessionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotsBySessionIdentifier");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingDescriptors:");
}

id objc_msgSend_soundWithAlertType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundWithAlertType:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "source");
}

id objc_msgSend_sourceAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceAppleID");
}

id objc_msgSend_sourceBundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceBundleIdentifier");
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceURL");
}

id objc_msgSend_sqliteErrorWithCode_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sqliteErrorWithCode:description:");
}

id objc_msgSend_stagedCertificateCommonNameContainsMultipleMemberPrefixes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagedCertificateCommonNameContainsMultipleMemberPrefixes");
}

id objc_msgSend_stagedClientIdentityForGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagedClientIdentityForGroupIdentifier:");
}

id objc_msgSend_stagedIdentityPersistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagedIdentityPersistentID");
}

id objc_msgSend_stagedIdentityPersistentId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stagedIdentityPersistentId");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAppLockOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAppLockOperation");
}

id objc_msgSend_startAppLockRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAppLockRequest");
}

id objc_msgSend_startBrowsing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBrowsing");
}

id objc_msgSend_startBrowsingForCourseInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startBrowsingForCourseInvitations");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDate");
}

id objc_msgSend_startForwardingNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startForwardingNotifications");
}

id objc_msgSend_startMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMigration");
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObserving");
}

id objc_msgSend_startObservingApplicationChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingApplicationChange");
}

id objc_msgSend_startObservingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingChanges");
}

id objc_msgSend_startObservingLockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingLockState");
}

id objc_msgSend_startObservingRoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startObservingRoster");
}

id objc_msgSend_startOfDayForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOfDayForDate:");
}

id objc_msgSend_startOrStopBrowsing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startOrStopBrowsing");
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecording");
}

id objc_msgSend_startUsingCachedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUsingCachedData");
}

id objc_msgSend_startedDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedDate");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateDictionariesByClassSessionIdentifierString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateDictionariesByClassSessionIdentifierString");
}

id objc_msgSend_stateDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateDictionary");
}

id objc_msgSend_stateTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateTable");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopBrowsing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBrowsing");
}

id objc_msgSend_stopBrowsingForCourseInvitations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBrowsingForCourseInvitations");
}

id objc_msgSend_stopEventRecordingIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopEventRecordingIfNeeded");
}

id objc_msgSend_stopForwardingNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopForwardingNotifications");
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObserving");
}

id objc_msgSend_stopObservingApplicationChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingApplicationChange");
}

id objc_msgSend_stopObservingChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingChanges");
}

id objc_msgSend_stopObservingLockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingLockState");
}

id objc_msgSend_stopObservingRoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObservingRoster");
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopRecording");
}

id objc_msgSend_stopUsingCachedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUsingCachedData");
}

id objc_msgSend_stopWaitingForApplicationToBecomeUnrestricted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWaitingForApplicationToBecomeUnrestricted");
}

id objc_msgSend_stopWaitingForOperationToBeExclusive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopWaitingForOperationToBeExclusive:");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "store");
}

id objc_msgSend_storeEvent_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeEvent:error:");
}

id objc_msgSend_storeUserImageData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeUserImageData:error:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "strongToStrongObjectsMapTable");
}

id objc_msgSend_stu_allWhitelistUserEnabledOptionKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_allWhitelistUserEnabledOptionKeys");
}

id objc_msgSend_stu_applicationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_applicationType");
}

id objc_msgSend_stu_currentLayoutKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_currentLayoutKey");
}

id objc_msgSend_stu_enrolledGroupIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_enrolledGroupIdentifiers");
}

id objc_msgSend_stu_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_stu_handlingAppWithLSPrimitives_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_handlingAppWithLSPrimitives:completion:");
}

id objc_msgSend_stu_handlingAppsWithLSPrimitives_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_handlingAppsWithLSPrimitives:completion:");
}

id objc_msgSend_stu_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_info");
}

id objc_msgSend_stu_isHidden(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_isHidden");
}

id objc_msgSend_stu_isKnownApplicationType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_isKnownApplicationType");
}

id objc_msgSend_stu_isUserFacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_isUserFacing");
}

id objc_msgSend_stu_mirroringRouteDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_mirroringRouteDescription");
}

id objc_msgSend_stu_mirroringRouteUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_mirroringRouteUID");
}

id objc_msgSend_stu_plistObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_plistObjectForKey:");
}

id objc_msgSend_stu_requiresPIN(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_requiresPIN");
}

id objc_msgSend_stu_routeDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_routeDescription");
}

id objc_msgSend_stu_routeDescriptionWithUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_routeDescriptionWithUID:");
}

id objc_msgSend_stu_setPlistObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_setPlistObject:forKey:");
}

id objc_msgSend_stu_shareTargetWithInstructor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_shareTargetWithInstructor:");
}

id objc_msgSend_stu_sharedMeCardUserProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_sharedMeCardUserProvider");
}

id objc_msgSend_stu_urlForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_urlForKey:");
}

id objc_msgSend_stu_whitelistUserEnabledOptionKeysEnabledInSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stu_whitelistUserEnabledOptionKeysEnabledInSettings");
}

id objc_msgSend_studentClassKitFacade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentClassKitFacade");
}

id objc_msgSend_studentCredentialStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentCredentialStore");
}

id objc_msgSend_studentCredentialsAreValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentCredentialsAreValid");
}

id objc_msgSend_studentIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentIdentifier");
}

id objc_msgSend_studentIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentIdentity");
}

id objc_msgSend_studentInformation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentInformation");
}

id objc_msgSend_studentdLibraryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "studentdLibraryURL");
}

id objc_msgSend_subscribeForAccountChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeForAccountChangeNotifications");
}

id objc_msgSend_subscribePropertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribePropertyKeys:");
}

id objc_msgSend_subscribeToFirstUnlockNotificationsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToFirstUnlockNotificationsWithHandler:");
}

id objc_msgSend_subscribeToLaunchEventsForBundleIdentifier_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToLaunchEventsForBundleIdentifier:handler:");
}

id objc_msgSend_subscribeToLockStateChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToLockStateChanges:");
}

id objc_msgSend_subscribeToMessageReceivesWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToMessageReceivesWithHandler:");
}

id objc_msgSend_subscribeToMessageSendsWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToMessageSendsWithHandler:");
}

id objc_msgSend_subscribeToNotificationWithName_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscribeToNotificationWithName:handler:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "summary");
}

id objc_msgSend_supportsAlwaysAllow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAlwaysAllow");
}

id objc_msgSend_supportsAppLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsAppLock");
}

id objc_msgSend_supportsConnectedInstructor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsConnectedInstructor");
}

id objc_msgSend_supportsNotingRestrictionsUpdateForOpens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsNotingRestrictionsUpdateForOpens");
}

id objc_msgSend_supportsWirelessDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsWirelessDisplay");
}

id objc_msgSend_suppressPasscodePrompt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suppressPasscodePrompt");
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspend");
}

id objc_msgSend_switchToLoginUserWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "switchToLoginUserWithCompletionHandler:");
}

id objc_msgSend_synthesizedEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synthesizedEnrollmentRecords");
}

id objc_msgSend_systemDataMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDataMigrationTasks");
}

id objc_msgSend_systemDataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDataStore");
}

id objc_msgSend_systemDataStoreDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDataStoreDirectoryURL");
}

id objc_msgSend_systemStatusPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemStatusPrimitives");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_systemVersionProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemVersionProvider");
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "target");
}

id objc_msgSend_targetApplicationRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetApplicationRecord");
}

id objc_msgSend_targetIPAddress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetIPAddress");
}

id objc_msgSend_targetIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetIdentifier");
}

id objc_msgSend_targetType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetType");
}

id objc_msgSend_taskOperation_needsToEnqueueOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskOperation:needsToEnqueueOperation:");
}

id objc_msgSend_taskWithName_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithName:reason:");
}

id objc_msgSend_tearDownLayoutMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tearDownLayoutMonitor:");
}

id objc_msgSend_temporarilySuspendWhitelist_toDetermineAppHandlingRequestWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporarilySuspendWhitelist:toDetermineAppHandlingRequestWithCompletion:");
}

id objc_msgSend_textProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProvider");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeSince_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSince:");
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeout");
}

id objc_msgSend_timeoutHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutHandler");
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutInterval");
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutTimer");
}

id objc_msgSend_timeoutTimerStartDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeoutTimerStartDate");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerIdentifier");
}

id objc_msgSend_timerPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerPrimitives");
}

id objc_msgSend_timestampForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampForDate:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_tokenAuthenticator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenAuthenticator");
}

id objc_msgSend_tokenForTransport_XPCPrimitives_device_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenForTransport:XPCPrimitives:device:");
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalUnitCount");
}

id objc_msgSend_trackLongRunningOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trackLongRunningOperation:");
}

id objc_msgSend_transactionPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionPrimitives");
}

id objc_msgSend_transactionWithReverseDNSReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionWithReverseDNSReason:");
}

id objc_msgSend_transactionsBySessionUUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionsBySessionUUID");
}

id objc_msgSend_transferLockToBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transferLockToBundleIdentifier:error:");
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transport");
}

id objc_msgSend_trustedAnchorCertificatePersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedAnchorCertificatePersistentIDs");
}

id objc_msgSend_trustedAnchorCertificatesForCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedAnchorCertificatesForCourseIdentifier:");
}

id objc_msgSend_trustedAnchorCertificatesForGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedAnchorCertificatesForGroupIdentifier:");
}

id objc_msgSend_trustedExchangeIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedExchangeIdentifier");
}

id objc_msgSend_trustedUserCertificatesForCourseWithIdentifier_inRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedUserCertificatesForCourseWithIdentifier:inRoster:");
}

id objc_msgSend_trustedUserWithAppleID_existsInRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedUserWithAppleID:existsInRoster:");
}

id objc_msgSend_trustedUserWithIdentifier_inCourse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedUserWithIdentifier:inCourse:");
}

id objc_msgSend_trustedUsers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedUsers");
}

id objc_msgSend_tryToOpenAppIfAttemptsRemainAfterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryToOpenAppIfAttemptsRemainAfterDelay:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unableToOpenAppErrorReturningDMFError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unableToOpenAppErrorReturningDMFError:");
}

id objc_msgSend_underlyingCertificate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingCertificate");
}

id objc_msgSend_underlyingIdentity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingIdentity");
}

id objc_msgSend_underlyingPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingPrimitives");
}

id objc_msgSend_underlyingRecord(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingRecord");
}

id objc_msgSend_underlyingStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingStore");
}

id objc_msgSend_undimScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undimScreen");
}

id objc_msgSend_undimScreenWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "undimScreenWithReason:");
}

id objc_msgSend_unlockedConditionMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockedConditionMonitor");
}

id objc_msgSend_unpromptedRemoteScreenObservationForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unpromptedRemoteScreenObservationForced");
}

id objc_msgSend_unquarantineIDSSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unquarantineIDSSessionIdentifier:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsubscribePropertyKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsubscribePropertyKeys:");
}

id objc_msgSend_updateASMCourseLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateASMCourseLibrary");
}

id objc_msgSend_updateActiveConnectionUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateActiveConnectionUI");
}

id objc_msgSend_updateAdHocEnrollmentRecord_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAdHocEnrollmentRecord:request:");
}

id objc_msgSend_updateAvailableRoutesWithRoutingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAvailableRoutesWithRoutingController:");
}

id objc_msgSend_updateChangeToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateChangeToken");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_updateCredential(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCredential");
}

id objc_msgSend_updateDefaultPermissions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDefaultPermissions");
}

id objc_msgSend_updateDeprecatedPropertyProvidersWithBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDeprecatedPropertyProvidersWithBundleIdentifiers:");
}

id objc_msgSend_updateDisplays(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDisplays");
}

id objc_msgSend_updateEffectiveConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEffectiveConfiguration");
}

id objc_msgSend_updateEnrollmentRecordIdentitiesWithDefaultIdentitySet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateEnrollmentRecordIdentitiesWithDefaultIdentitySet:");
}

id objc_msgSend_updateExclusiveOperationsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateExclusiveOperationsWithBlock:");
}

id objc_msgSend_updateInstructorRoleEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateInstructorRoleEnabledState");
}

id objc_msgSend_updateKeepAliveFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateKeepAliveFile:");
}

id objc_msgSend_updateLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocale:");
}

id objc_msgSend_updateLockScreenNotificationWithInitialUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLockScreenNotificationWithInitialUpdate:");
}

id objc_msgSend_updateLockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLockState");
}

id objc_msgSend_updateManagedEnrollmentRecord_request_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateManagedEnrollmentRecord:request:");
}

id objc_msgSend_updateMeCardInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMeCardInfo");
}

id objc_msgSend_updateMetadataTrackerAndEndOperationWithCourseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateMetadataTrackerAndEndOperationWithCourseIdentifier:");
}

id objc_msgSend_updateOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOrientation");
}

id objc_msgSend_updateOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateOrientation:");
}

id objc_msgSend_updatePermissionForEnrollmentRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePermissionForEnrollmentRecord:error:");
}

id objc_msgSend_updateProgressWithDownloadOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProgressWithDownloadOperation:");
}

id objc_msgSend_updateScreenLocked(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScreenLocked");
}

id objc_msgSend_updateScreenState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateScreenState");
}

id objc_msgSend_updateSessionBrowser(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSessionBrowser");
}

id objc_msgSend_updateStudentRoleEnabledState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStudentRoleEnabledState");
}

id objc_msgSend_updateWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithBundleIdentifier:");
}

id objc_msgSend_updateWithBundleIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithBundleIdentifiers:");
}

id objc_msgSend_updateWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithTimeout:");
}

id objc_msgSend_upsertEnrollmentRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upsertEnrollmentRecord:error:");
}

id objc_msgSend_upsertEnrollmentRecord_error_shouldUpdateConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upsertEnrollmentRecord:error:shouldUpdateConfiguration:");
}

id objc_msgSend_upsertUserDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "upsertUserDictionary:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "url");
}

id objc_msgSend_urls(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urls");
}

id objc_msgSend_useMeCardIfAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "useMeCardIfAvailable");
}

id objc_msgSend_user(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "user");
}

id objc_msgSend_userDataMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDataMigrationTasks");
}

id objc_msgSend_userDataStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDataStore");
}

id objc_msgSend_userDefaultsPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDefaultsPrimitives");
}

id objc_msgSend_userDictionaryForCourseWithIdentifier_studentInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDictionaryForCourseWithIdentifier:studentInformation:");
}

id objc_msgSend_userDictionaryWithAppleID_inConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDictionaryWithAppleID:inConfiguration:");
}

id objc_msgSend_userDictionaryWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDictionaryWithIdentifier:");
}

id objc_msgSend_userDictionaryWithIdentifier_inConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userDictionaryWithIdentifier:inConfiguration:");
}

id objc_msgSend_userEnabledOptionKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userEnabledOptionKeys");
}

id objc_msgSend_userEnabledOptions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userEnabledOptions");
}

id objc_msgSend_userIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userIdentifier");
}

id objc_msgSend_userIdentityForCourseWithIdentifier_inRoster_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userIdentityForCourseWithIdentifier:inRoster:");
}

id objc_msgSend_userImageData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userImageData");
}

id objc_msgSend_userImageDataWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userImageDataWithIdentifier:error:");
}

id objc_msgSend_userImageStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userImageStore");
}

id objc_msgSend_userImagesDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userImagesDirectoryURL");
}

id objc_msgSend_userImagesMigrationTasks(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userImagesMigrationTasks");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotification");
}

id objc_msgSend_userNotificationDidFinishWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationDidFinishWithResult:");
}

id objc_msgSend_userNotificationPoster(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationPoster");
}

id objc_msgSend_userNotificationPrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationPrimitives");
}

id objc_msgSend_userNotificationWantsToDeregister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWantsToDeregister:");
}

id objc_msgSend_userNotificationWantsToReregister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userNotificationWantsToReregister:");
}

id objc_msgSend_userSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userSource");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_usesPixels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "usesPixels");
}

id objc_msgSend_validTrustedAnchorPersistentIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validTrustedAnchorPersistentIDs");
}

id objc_msgSend_validateHistoryAndRemoveIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateHistoryAndRemoveIfNeeded:");
}

id objc_msgSend_validateRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateRequest:error:");
}

id objc_msgSend_validationClassForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validationClassForRequest:");
}

id objc_msgSend_validityDateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validityDateInterval");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForEntitlement_onConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:onConnection:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForKey_courseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:courseIdentifier:");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_valueForUserPropertyKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForUserPropertyKey:");
}

id objc_msgSend_verboseDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verboseDescription");
}

id objc_msgSend_versionProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionProvider");
}

id objc_msgSend_visibleGroupEnrollmentRecords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleGroupEnrollmentRecords");
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volume");
}

id objc_msgSend_volumeCategoryForAudioCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeCategoryForAudioCategory:");
}

id objc_msgSend_volumeController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeController");
}

id objc_msgSend_waitForApplicationToBecomeUnrestricted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForApplicationToBecomeUnrestricted");
}

id objc_msgSend_waitForApplicationWithIdentifierToBecomeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForApplicationWithIdentifierToBecomeActive:");
}

id objc_msgSend_waitForDeviceToUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForDeviceToUnlock");
}

id objc_msgSend_waitForOpenedAppToAppearOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForOpenedAppToAppearOperation");
}

id objc_msgSend_waitForTargetApplicationToBecomeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForTargetApplicationToBecomeActive");
}

id objc_msgSend_waitForUnlockOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForUnlockOperation");
}

id objc_msgSend_waitForUnlockedStateOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForUnlockedStateOperation");
}

id objc_msgSend_waitsForDeviceUnlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitsForDeviceUnlock");
}

id objc_msgSend_wakeScreenOperation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeScreenOperation");
}

id objc_msgSend_wakeScreenWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakeScreenWithCompletion:");
}

id objc_msgSend_wakesScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wakesScreen");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "weakToStrongObjectsMapTable");
}

id objc_msgSend_webClipBundleIdentifierFromIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webClipBundleIdentifierFromIdentifier:");
}

id objc_msgSend_whiteboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteboard");
}

id objc_msgSend_whitelistSingleBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitelistSingleBundleIdentifier:");
}

id objc_msgSend_whitelistedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitelistedBundleIdentifiers");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_workspacePrimitives(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workspacePrimitives");
}

id objc_msgSend_writeAdHocConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeAdHocConfiguration:");
}

id objc_msgSend_writeData_toURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeData:toURL:options:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}
