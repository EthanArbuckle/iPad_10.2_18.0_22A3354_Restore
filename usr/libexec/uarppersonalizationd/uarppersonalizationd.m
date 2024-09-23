uint64_t sub_1000049DC(void *a1, const char *a2)
{
  id v3;
  id v4;
  const char *v5;
  id v6;
  id v7;
  uint64_t v8;
  char v10[1024];

  v3 = a1;
  if (!v3)
  {
    v3 = &_os_log_default;
    v4 = &_os_log_default;
  }
  if (a2)
    v5 = a2;
  else
    v5 = "com.apple.MobileAccessoryUpdater";
  v6 = v3;
  bzero(v10, 0x400uLL);
  v7 = v6;
  if ((_set_user_dir_suffix(v5) & 1) != 0)
  {
    if (confstr(65537, v10, 0x400uLL))
    {
      v8 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      sub_1000061FC();
  }
  else if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
  {
    sub_100006270();
  }

  v8 = 1;
LABEL_14:

  return v8;
}

void sub_100004AFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100004E04(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "XPC Connection Interrupted", v2, 2u);
  }
}

void sub_100004E64(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "XPC Connection Invalidated", v2, 2u);
  }
}

void sub_100004EC4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Proxy Error %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_1000050E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_100005100(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005110(uint64_t a1)
{

}

void sub_100005118(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;

  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(Proxy Reply) Pending Tatsu Requests are %@", (uint8_t *)&v8, 0xCu);
  }
  v5 = objc_msgSend(v3, "copy");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

id sub_100005350(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  unsigned int v14;
  void *v15;
  id v16;

  v3 = a1;
  v4 = a2;
  v5 = sub_100005468();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10000633C();

  v7 = sub_1000054A8(v3, v4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_100005468();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11)
      sub_100006310();

    v12 = v8;
  }
  else
  {
    if (v11)
      sub_1000062E4();

    v13 = (void *)MGCopyAnswer(CFSTR("InternalBuild"), 0);
    v14 = objc_msgSend(v13, "BOOLValue");
    v15 = 0;
    if (v14)
    {
      v16 = sub_100005894(v3, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }
    v12 = v15;

  }
  return v12;
}

id sub_100005468()
{
  if (qword_10000C3E0 != -1)
    dispatch_once(&qword_10000C3E0, &stru_100008318);
  return (id)qword_10000C3E8;
}

id sub_1000054A8(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  const void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  const __CFString *v23;
  id v24;
  NSObject *v25;
  int v26;
  id v27;
  NSObject *v28;
  const __CFString *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  const __CFString *v38;

  v5 = a1;
  v6 = a2;
  v7 = sub_100005468();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler(sub_100005978);
  v9 = AMAuthInstallCreate(kCFAllocatorDefault);
  if (!v9)
  {
    v13 = sub_100005468();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_1000063A0();

    goto LABEL_11;
  }
  v10 = (const void *)v9;
  if (AMAuthInstallSetSigningServerURL(v9, v6))
  {
    v11 = sub_100005468();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100006494();
LABEL_7:

    CFRelease(v10);
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  if (a3)
  {
    v17 = sub_100005468();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "UARP: TSS request is using SSO", buf, 2u);
    }

    if (AMAuthInstallSsoInitialize(0))
    {
      v19 = sub_100005468();
      v12 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_100006468();
      goto LABEL_7;
    }
    if (AMAuthInstallSsoEnable(v10))
    {
      v20 = sub_100005468();
      v12 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10000643C();
      goto LABEL_7;
    }
  }
  v21 = sub_100005468();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    if (a3)
      v23 = CFSTR(" <AppleConnect>");
    else
      v23 = CFSTR(" ");
    *(_DWORD *)buf = 138543618;
    v36 = v6;
    v37 = 2114;
    v38 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
  }

  v24 = sub_100005468();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  v34 = 0;
  v26 = AMAuthInstallApCreatePersonalizedResponse(v10, v5, &v34);
  v27 = sub_100005468();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    if (a3)
      v29 = CFSTR(" <AppleConnect>");
    else
      v29 = CFSTR(" ");
    *(_DWORD *)buf = 138543618;
    v36 = v6;
    v37 = 2114;
    v38 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
  }

  v30 = sub_100005468();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36 = v34;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
  }

  if (v26)
  {
    v32 = sub_100005468();
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1000063CC(v26, v33);

    v15 = 0;
  }
  else
  {
    v15 = v34;
  }
  CFRelease(v10);
LABEL_12:

  return v15;
}

id sub_100005894(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;

  v3 = a1;
  v4 = a2;
  v5 = sub_100005468();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000064EC();

  v7 = sub_1000054A8(v3, v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
    v9 = sub_100005468();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000064C0();

  }
  return v8;
}

void sub_100005948(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  v2 = (void *)qword_10000C3E8;
  qword_10000C3E8 = (uint64_t)v1;

}

void sub_100005978(uint64_t a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;

  v3 = sub_100005468();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 136446210;
    v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100005A18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005A3C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t start()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD v5[6];
  uint8_t buf[4];
  const char *v7;

  v0 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "main";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s: Launched uarppersonalizationd", buf, 0xCu);
  }
  v1 = sub_1000049DC(v0, "com.apple.uarppersonalizationd");
  if (!(_DWORD)v1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005BC0;
    v5[3] = &unk_100008368;
    v5[4] = dispatch_queue_create("com.apple.uarp.personalization-needed.dispatchqueue", 0);
    v5[5] = v0;
    v4 = objc_retainBlock(v5);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, v4);
    dispatch_main();
  }
  v2 = v1;
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    sub_100006550(v0);

  return v2;
}

void sub_100005BC0(uint64_t a1, void *a2)
{
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C58;
  block[3] = &unk_100008340;
  v6 = a2;
  v3 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v4 = v6;
  dispatch_sync(v3, block);

}

void sub_100005C58(uint64_t a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *string;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  UARPPersonalizationHelper *v28;
  UARPPersonalizationHelper *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  UARPPersonalizationHelper *v38;
  UARPPersonalizationHelper *v39;
  UARPPersonalizationHelper *v40;
  NSObject *v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  UARPPersonalizationHelper *v52;
  void *v53;
  NSObject *v54;
  id v55;
  id obj;
  uint64_t v57;
  UARPPersonalizationHelper *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _BYTE v70[128];

  v1 = *(void **)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  v3 = v1;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000067BC();
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_10000674C(v3, v4, v5, v6, v7, v8, v9, v10);
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (!string && os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_1000066DC(v3, v12, v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100006670();
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("hidPersonalizationNeeded")))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100006600(v3, v20, v21, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.uarppersonalization"));
    v28 = [UARPPersonalizationHelper alloc];
    v29 = -[UARPPersonalizationHelper initWithMachServiceName:updaterName:](v28, "initWithMachServiceName:updaterName:", v27, kUARPStringHIDUpdaterName);

  }
  else
  {
    v29 = 0;
  }
  if (objc_msgSend(v19, "isEqualToString:", CFSTR("btlePersonalizationNeeded")))
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100006590(v3, v30, v31, v32, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "com.apple.uarppersonalization.btleserver"));
    v38 = [UARPPersonalizationHelper alloc];
    v39 = -[UARPPersonalizationHelper initWithMachServiceName:updaterName:](v38, "initWithMachServiceName:updaterName:", v37, kUARPStringBTLEServerUpdaterName);

    v29 = v39;
  }
  if (v29)
  {
    v52 = v29;
    v53 = v19;
    v55 = v2;
    v40 = v29;
    v54 = v3;
    v41 = v3;
    -[UARPPersonalizationHelper start](v40, "start");
    -[UARPPersonalizationHelper queryOutstandingTssRequests](v40, "queryOutstandingTssRequests");
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = v40;
    obj = (id)objc_claimAutoreleasedReturnValue(-[UARPPersonalizationHelper tssRequests](v40, "tssRequests"));
    v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v59)
    {
      v57 = *(_QWORD *)v61;
      v42 = kUARPStringTatsuSigningServer;
      do
      {
        for (i = 0; i != v59; i = (char *)i + 1)
        {
          if (*(_QWORD *)v61 != v57)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v65 = "handlePersonalization";
            v66 = 2112;
            v67 = v44;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: Pending TSS Query %@", buf, 0x16u);
          }
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v44, v52, v53));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectForKeyedSubscript:", v42));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v46));
          objc_msgSend(v45, "removeObjectForKey:", v42);
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v45));
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            v65 = "handlePersonalization";
            v66 = 2112;
            v67 = v47;
            v68 = 2112;
            v69 = v48;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: Pending TSS Signing Server %@, Options %@", buf, 0x20u);
          }
          v49 = sub_100005350(v48, v47);
          v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v65 = "handlePersonalization";
            v66 = 2112;
            v67 = v50;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: TSS Response %@", buf, 0x16u);
          }
          if (v50)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v44));
            objc_msgSend(v51, "addEntriesFromDictionary:", v50);
          }
          else
          {
            v51 = 0;
          }
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v65 = "handlePersonalization";
            v66 = 2112;
            v67 = v51;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s: TSS Response to be provided %@", buf, 0x16u);
          }
          -[UARPPersonalizationHelper completedTssResponse:](v58, "completedTssResponse:", v51);

        }
        v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v59);
    }

    v3 = v54;
    v2 = v55;
    v29 = v52;
    v19 = v53;
  }

}

void sub_1000061B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000061C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000061D8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000061FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  sub_100004AFC((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
  sub_100004B10();
}

void sub_100006270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  sub_100004AFC((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
  sub_100004B10();
}

void sub_1000062E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_100006310()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_10000633C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100005A50();
  sub_100005A3C((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void sub_1000063A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_1000063CC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, error = %u", (uint8_t *)v2, 8u);
  sub_100005A28();
}

void sub_10000643C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: Failed to enable sso", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_100006468()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: Failed to initialize sso", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_100006494()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_1000064C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A30();
  sub_100005A18((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
  sub_100005A28();
}

void sub_1000064EC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100005A50();
  sub_100005A3C((void *)&_mh_execute_header, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

void sub_100006550(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not initialize sandbox", v1, 2u);
}

void sub_100006590(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061C8((void *)&_mh_execute_header, a1, a3, "%s: BTLEServer needs personalization", a5, a6, a7, a8, 2u);
  sub_1000061B0();
}

void sub_100006600(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061C8((void *)&_mh_execute_header, a1, a3, "%s: HID needs personalization", a5, a6, a7, a8, 2u);
  sub_1000061B0();
}

void sub_100006670()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000061E8();
  sub_1000061D8((void *)&_mh_execute_header, v0, v1, "%s: Event Name is %@", v2, v3, v4, v5, 2u);
  sub_1000061B0();
}

void sub_1000066DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061B8((void *)&_mh_execute_header, a1, a3, "%s: event kay name is nil", a5, a6, a7, a8, 2u);
  sub_1000061B0();
}

void sub_10000674C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061B8((void *)&_mh_execute_header, a1, a3, "%s: event type is not dictionary", a5, a6, a7, a8, 2u);
  sub_1000061B0();
}

void sub_1000067BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000061E8();
  sub_1000061D8((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
  sub_1000061B0();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_completedTssResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "completedTssResponse:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_getOutstandingPersonalizationRequests_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getOutstandingPersonalizationRequests:reply:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithMachServiceName_updaterName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:updaterName:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_personalizationResponse_updaterName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "personalizationResponse:updaterName:");
}

id objc_msgSend_queryOutstandingTssRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryOutstandingTssRequests");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_tssRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tssRequests");
}
