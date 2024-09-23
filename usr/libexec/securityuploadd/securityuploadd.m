uint64_t start()
{
  const void *v0;
  NSObject *v1;
  ServiceDelegate *v2;
  supd *v3;
  void *v4;
  id v5;
  dispatch_time_t v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  void *v9;
  uint8_t v11[16];

  v0 = sub_100010B28("lifecycle");
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "supd lives!", v11, 2u);
  }

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  v2 = objc_alloc_init(ServiceDelegate);
  v3 = -[supd initWithConnection:]([supd alloc], "initWithConnection:", 0);
  v4 = (void *)qword_10001DB60;
  qword_10001DB60 = (uint64_t)v3;

  v5 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.securityuploadd"));
  objc_msgSend(v5, "setDelegate:", v2);
  v6 = dispatch_time(0, 5000000000);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_after(v6, v8, &stru_100018618);

  objc_msgSend(v5, "resume");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v9, "run");

  return 0;
}

void sub_10000526C(id a1)
{
  const void *v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_100010B28("lifecycle");
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "will exit when clean", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100005394(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v3 = a2;
  v4 = sub_100010B28("OSAWriteLogForSubmission");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Writing log data to report: %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v3, "writeData:", *(_QWORD *)(a1 + 40));
}

void sub_100005858(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  id v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
  v11 = 0;
  v3 = objc_msgSend(v2, "openWithError:", &v11);
  v4 = v11;

  if ((v3 & 1) != 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
    objc_msgSend(v7, "close");
  }
  else
  {
    if (!v4 || objc_msgSend(v4, "code") != (id)23)
    {
      v8 = sub_100010B28("SecError");
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SFAnalytics: could not open db at init, will try again later. Error: %@", buf, 0xCu);
      }

    }
    v10 = *(_QWORD *)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "store"));
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v7);
  }

}

void sub_100005D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DB68);
  _Unwind_Resume(a1);
}

uint64_t sub_100005D88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005D98(uint64_t a1)
{

}

void sub_100005DA0(uint64_t a1, int a2, id obj, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  *a4 = 1;
}

void sub_100006A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

void sub_100009964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009F48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  id *v27;

  objc_destroyWeak(v27);
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a27, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A734(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const void *v26;
  NSObject *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  const void *v34;
  unint64_t v35;
  void *v36;
  const void *v37;
  NSObject *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  const void *v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  unsigned int v50;
  void *v51;
  void *v52;
  id obj;
  uint8_t buf[4];
  unint64_t v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  uint64_t v59;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    if (!v7 || v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a4);
LABEL_16:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v26 = sub_100010B28("upload");
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          v29 = *(_QWORD *)(a1 + 48);
          v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          *(_DWORD *)buf = 138412802;
          v55 = v28;
          v56 = 2112;
          v57 = v29;
          v58 = 2112;
          v59 = v30;
          v31 = "Unable to fetch splunk endpoint at URL for %@: %@ -- error: %@";
          v32 = v27;
          v33 = 32;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
        }
      }
      else
      {
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          goto LABEL_22;
        v34 = sub_100010B28("upload");
        v27 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          *(_DWORD *)buf = 138412290;
          v55 = v35;
          v31 = "Malformed iTunes config payload for %@!";
          v32 = v27;
          v33 = 12;
          goto LABEL_19;
        }
      }

LABEL_22:
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
      goto LABEL_23;
    }
    v11 = v7;
    v12 = objc_autoreleasePoolPush();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v11, 0, &obj));
    objc_storeStrong((id *)(v13 + 40), obj);
    v15 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0 || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
LABEL_14:
      objc_autoreleasePoolPop(v12);

      goto LABEL_16;
    }
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
    {
LABEL_7:
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("metricsBase")));
      v17 = (void *)WeakRetained[11];
      WeakRetained[11] = v16;

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("metricsUrl")));
      v19 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
      {
        v52 = v18;
        v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingFormat:", CFSTR("/2/%@"), WeakRetained[3]));
        v21 = sub_100010B28("upload");
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
          *(_DWORD *)buf = 138412546;
          v55 = v20;
          v56 = 2112;
          v57 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "got metrics endpoint %@ for %@", buf, 0x16u);
        }

        v51 = (void *)v20;
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "scheme"));
        v50 = objc_msgSend(v25, "isEqualToString:", CFSTR("https"));

        if (v50)
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v24);

        v18 = v52;
      }

      goto LABEL_14;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("sendDisabled")));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = objc_msgSend(v36, "BOOLValue");

    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKey:", CFSTR("postFrequency")));
      v41 = (unint64_t)objc_msgSend(v40, "unsignedIntegerValue");

      if (v41 >= 0x3E8)
      {
        v42 = v41 / 0x3E8;
        if (os_variant_has_internal_diagnostics("com.apple.security")
          && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) < v42)
        {
          v43 = sub_100010B28("getURL");
          v44 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
            *(_DWORD *)buf = 134218240;
            v55 = v42;
            v56 = 2048;
            v57 = v45;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Overriding server-sent post frequency because device is internal (%lu -> %lu)", buf, 0x16u);
          }

        }
        else
        {
          WeakRetained[9] = v42;
        }
      }
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("blacklistedEvents")));
      v47 = (void *)WeakRetained[13];
      WeakRetained[13] = v46;

      v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("blacklistedFields")));
      v49 = (void *)WeakRetained[12];
      WeakRetained[12] = v48;

      goto LABEL_7;
    }
    v37 = sub_100010B28("SecError");
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      *(_DWORD *)buf = 138412290;
      v55 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "not returning a splunk URL because uploads are disabled for %@", buf, 0xCu);
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    objc_autoreleasePoolPop(v12);

  }
LABEL_23:

}

void sub_10000ACC0(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10000AD0C(id a1)
{
  id v1;
  void *v2;
  const void *v3;
  NSObject *v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  dispatch_time_t v9;
  const void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 buf;
  void (*v35)(uint64_t, void *, void *);
  void *v36;
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  const __CFString *v40;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = sub_100005D88;
  v32 = sub_100005D98;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100005D88;
  v26 = sub_100005D98;
  v27 = 0;
  v1 = sub_10000B0D0();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    v3 = sub_100010B28("_getiCloudConfigurationInfoWithError");
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Fetching configuration info", (uint8_t *)&buf, 2u);
    }

    v5 = dispatch_semaphore_create(0);
    v6 = (void *)objc_opt_new(AKAppleIDAuthenticationController);
    v40 = CFSTR("com.apple.idms.config.privacy.icloud.data");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v35 = sub_10000B138;
    v36 = &unk_100018970;
    v38 = &v22;
    v39 = &v28;
    v8 = v5;
    v37 = v8;
    objc_msgSend(v6, "configurationInfoWithIdentifiers:forAltDSID:completion:", v7, v2, &buf);

    v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);

  }
  else
  {
    v10 = sub_100010B28("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: Failed to fetch primary account info.", (uint8_t *)&buf, 2u);
    }
  }

  v11 = (void *)v23[5];
  if (v11)
    v12 = objc_retainAutorelease(v11);
  v13 = (id)v29[5];

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  v14 = v11;
  if (v13)
    v15 = v11 == 0;
  else
    v15 = 0;
  if (v15)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.idms.config.privacy.icloud.data")));
    if (v16)
    {
      v17 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0
        || (v18 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v16, v18) & 1) != 0))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSObject integerValue](v16, "integerValue")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 0));
        byte_10001DBA0 = objc_msgSend(v19, "isEqualToNumber:", v20) ^ 1;

      }
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v11)
  {
    v21 = sub_100010B28("SecError");
    v16 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_isiCloudAnalyticsEnabled: %@", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:

}

void sub_10000B0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Block_object_dispose(&a9, 8);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

id sub_10000B0D0()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "aa_primaryAppleAccount"));
  v2 = v1;
  if (v1)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "aa_altDSID"));
  else
    v3 = 0;

  return v3;
}

void sub_10000B138(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void *v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  void *v14;
  const void *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  void *v19;
  int v20;
  id v21;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_100010B28("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: Error fetching configurationInfo: %@", (uint8_t *)&v20, 0xCu);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v6;
LABEL_9:
    v14 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
    goto LABEL_10;
  }
  v11 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v11) & 1) != 0)
  {
    v12 = sub_100010B28("_getiCloudConfigurationInfoWithError");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "fetched configurationInfo %@", (uint8_t *)&v20, 0xCu);
    }

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = v5;
    v5 = v10;
    goto LABEL_9;
  }
  v15 = sub_100010B28("SecError");
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543362;
    v21 = (id)objc_opt_class(v5);
    v17 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_getiCloudConfigurationInfoWithError: configurationInfo dict was not a dict, it was a %{public}@", (uint8_t *)&v20, 0xCu);

  }
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = 0;

  v14 = v5;
  v5 = 0;
LABEL_10:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000B344(id a1)
{
  byte_10001DB90 = DiagnosticLogSubmissionEnabled(a1);
}

void sub_10000B360(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  const void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  const void *v33;
  void *v34;
  const char *v35;
  const void *v36;
  _BYTE v37[24];
  NSObject *v38;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uploadDate"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uploadDate"));
    objc_msgSend(v5, "timeIntervalSince1970");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6 * 1000.0));

  }
  if (!*(_BYTE *)(a1 + 136))
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "requireDeviceAnalytics"))
      goto LABEL_12;
    if (qword_10001DB98 != -1)
      dispatch_once(&qword_10001DB98, &stru_100018928);
    if (!byte_10001DB90)
    {
      v33 = sub_100010B28("getLoggingJSON");
      v8 = objc_claimAutoreleasedReturnValue(v33);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)v37 = 138412290;
      *(_QWORD *)&v37[4] = v34;
      v35 = "Client '%@' requires device analytics yet user did not opt in.";
    }
    else
    {
LABEL_12:
      if (*(_BYTE *)(a1 + 136) || !objc_msgSend(*(id *)(a1 + 32), "requireiCloudAnalytics"))
        goto LABEL_13;
      if (qword_10001DBA8 != -1)
        dispatch_once(&qword_10001DBA8, &stru_100018948);
      if (byte_10001DBA0)
        goto LABEL_13;
      v36 = sub_100010B28("getLoggingJSON");
      v8 = objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_39;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      *(_DWORD *)v37 = 138412290;
      *(_QWORD *)&v37[4] = v34;
      v35 = "Client '%@' requires iCloud analytics yet user did not opt in.";
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v35, v37, 0xCu);

    goto LABEL_39;
  }
LABEL_13:
  if (!*(_BYTE *)(a1 + 137))
  {
LABEL_27:
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "healthSummaryWithName:store:uuid:timestamp:lastUploadTime:", *(_QWORD *)(a1 + 32), v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4, *(_OWORD *)v37, *(_QWORD *)&v37[16]));
    v8 = v25;
    if (v25)
    {
      v26 = *(_QWORD *)(a1 + 72);
      if (v26)
        -[NSObject setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v26, CFSTR("ckdeviceID"));
      v27 = *(_QWORD *)(a1 + 80);
      if (v27)
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v27, CFSTR("altDSID"));
      if (*(_QWORD *)(a1 + 88))
        -[NSObject addEntriesFromDictionary:](v8, "addEntriesFromDictionary:");
      if (*(_QWORD *)(a1 + 96))
        -[NSObject setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("isAppleUser"));
      objc_msgSend(*(id *)(a1 + 104), "addObject:", v8);
    }
    v28 = *(void **)(a1 + 112);
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rockwells"));
    objc_msgSend(v28, "addObject:", v29);

    v30 = *(void **)(a1 + 120);
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hardFailures"));
    objc_msgSend(v30, "addObject:", v31);

    v32 = *(void **)(a1 + 128);
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "softFailures"));
    objc_msgSend(v32, "addObject:", v15);
    goto LABEL_38;
  }
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uploadDate"));
  v8 = v7;
  v9 = *(unsigned __int8 *)(a1 + 136);
  if (*(_BYTE *)(a1 + 136) || !v7)
  {
LABEL_20:
    v18 = sub_100010B28("json");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
        *(_DWORD *)v37 = 138412546;
        *(_QWORD *)&v37[4] = v21;
        *(_WORD *)&v37[12] = 2112;
        *(_QWORD *)&v37[14] = v22;
        v23 = "client '%@' for topic '%@' force-included";
LABEL_25:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v23, v37, 0x16u);

      }
    }
    else if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
      *(_DWORD *)v37 = 138412546;
      *(_QWORD *)&v37[4] = v21;
      *(_WORD *)&v37[12] = 2112;
      *(_QWORD *)&v37[14] = v24;
      v23 = "including client '%@' for topic '%@' for upload";
      goto LABEL_25;
    }

    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
    goto LABEL_27;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v10, "timeIntervalSinceDate:", v8);
  v12 = v11;
  v13 = (double)*(unint64_t *)(*(_QWORD *)(a1 + 40) + 72);

  if (v12 >= v13)
  {
    v9 = *(unsigned __int8 *)(a1 + 136);
    goto LABEL_20;
  }
  v14 = sub_100010B28("json");
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    *(_DWORD *)v37 = 138412802;
    *(_QWORD *)&v37[4] = v16;
    *(_WORD *)&v37[12] = 2112;
    *(_QWORD *)&v37[14] = v17;
    *(_WORD *)&v37[22] = 2112;
    v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ignoring client '%@' for %@ because last upload too recent: %@", v37, 0x20u);

  }
LABEL_38:

LABEL_39:
}

void sub_10000B83C(id a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];

  v4[0] = SFAnalyticsTopicKeySync;
  v4[1] = SFAnalyticsTopicCloudServices;
  v4[2] = SFAnalyticsTopicTransparency;
  v4[3] = SFAnalyticsTopicSWTransparency;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 4));
  v2 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v1));
  v3 = (void *)qword_10001DB80;
  qword_10001DB80 = v2;

}

void sub_10000B908(uint64_t a1, void *a2)
{
  id v3;
  const void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v3 = a2;
  v4 = sub_100010B28("postprocess");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting upload date (%@) for client: %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(v3, "setUploadDate:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 48))
  {
    v8 = sub_100010B28("postprocess");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Clearing collected data for client: %@", (uint8_t *)&v11, 0xCu);

    }
    objc_msgSend(v3, "clearAllData");
  }

}

void sub_10000BA74(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a2;
  v5 = SFAnalyticsColumnSuccessCount;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", SFAnalyticsColumnHardFailureCount));
  v10 = (unint64_t)objc_msgSend(v9, "integerValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", SFAnalyticsColumnSoftFailureCount));
  v12 = (unint64_t)objc_msgSend(v11, "integerValue");

  if (!objc_msgSend(*(id *)(a1 + 32), "terseMetrics"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-success"), v30));
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-hardfail"), v30));
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v28);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-softfail"), v30);
    goto LABEL_12;
  }
  if (v10 | v12)
    v13 = v8 == 0;
  else
    v13 = 0;
  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-s"), v30));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
  if (v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v10));
    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-h"), v30));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);

  }
  if (v12)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-f"), v30);
LABEL_12:
    v29 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v29);

  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v8;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v10;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v12;

}

void sub_10000BDC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sampleStatisticsForSamples:withName:", a3, a2));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addEntriesFromDictionary:", v4);

}

void sub_10000BE10(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  const void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];
  uint8_t buf[4];
  id v18;

  v7 = a2;
  if (*(_QWORD *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    v8 = objc_autoreleasePoolPush();
    if (objc_msgSend(*(id *)(a1 + 32), "prepareEventForUpload:linkedUUID:", v7, *(_QWORD *)(a1 + 40)))
    {
      if (+[NSJSONSerialization isValidJSONObject:](NSJSONSerialization, "isValidJSONObject:", v7))
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);
      }
      else
      {
        v9 = sub_100010B28("SecError");
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "supd: Replacing event with errorEvent because invalid JSON: %@", buf, 0xCu);
        }

        v11 = SFAnalyticsEventType;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", SFAnalyticsEventType));
        v15[0] = v11;
        v15[1] = SFAnalyticsEventErrorDestription;
        v16[0] = SFAnalyticsEventTypeErrorEvent;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("JSON:%@"), v12));
        v16[1] = v13;
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

        objc_msgSend(*(id *)(a1 + 48), "addObject:", v14);
      }
    }
    objc_autoreleasePoolPop(v8);
  }

}

void sub_10000BFDC(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "prepareEventForUpload:linkedUUID:"))
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);

}

void sub_10000C028(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7));

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void sub_10000C09C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  objc_class *v18;
  const void *v19;
  uint64_t v20;
  NSString *v21;
  const void *v22;
  NSObject *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  NSObject *v28;
  __int16 v29;
  unsigned int v30;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    v11 = objc_opt_class(NSHTTPURLResponse);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) == 0)
    {
      v18 = (objc_class *)objc_opt_class(v6);
      v19 = sub_100010B28("SecError");
      v9 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_15;
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v21 = NSStringFromClass(v18);
      v13 = objc_claimAutoreleasedReturnValue(v21);
      v25 = 138412546;
      v26 = v20;
      v27 = 2112;
      v28 = v13;
      v15 = "Received the wrong kind of response for %@: %@";
      v16 = v9;
      v17 = 22;
      goto LABEL_13;
    }
    v9 = v6;
    if ((uint64_t)-[NSObject statusCode](v9, "statusCode") < 200
      || (uint64_t)-[NSObject statusCode](v9, "statusCode") > 299)
    {
      v22 = sub_100010B28("upload");
      v13 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v23 = *(NSObject **)(a1 + 40);
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        v25 = 138412802;
        v26 = v24;
        v27 = 2112;
        v28 = v23;
        v29 = 1024;
        v30 = -[NSObject statusCode](v9, "statusCode");
        v15 = "Splunk upload for %@ unexpected status to URL: %@ -- status: %d";
        v16 = v13;
        v17 = 28;
        goto LABEL_13;
      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v12 = sub_100010B28("upload");
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
        v25 = 138412290;
        v26 = v14;
        v15 = "Splunk upload success for %@";
        v16 = v13;
        v17 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v25, v17);
      }
    }

    goto LABEL_15;
  }
  v8 = sub_100010B28("SecError");
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v25 = 138412546;
    v26 = v10;
    v27 = 2112;
    v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Error in uploading the events to splunk for %@: %@", (uint8_t *)&v25, 0x16u);
  }
LABEL_15:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000DACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EB64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uploadDate"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("uploadDate"));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "name"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

}

void sub_10000EC04(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  v4 = a1[4];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Client: %@\n"), v5));
  objc_msgSend(v4, "appendString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allEvents"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = a1[4];
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "sysdiagnoseStringForEventRecord:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v12, "appendFormat:", CFSTR("%@\n"), v13);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  if (!objc_msgSend(v7, "count"))
    objc_msgSend(a1[4], "appendString:", CFSTR("No data to report for this client\n"));

}

void sub_10000EDA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;
  void *v6;

  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v5 = &stru_100019AA8;
  else
    v5 = CFSTR(", ");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ : %@"), v5, a2, a3));
  objc_msgSend(v4, "appendString:", v6);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
}

void sub_10000EE30(uint64_t a1)
{
  _QWORD handler[4];
  id v2;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000EEB0;
  handler[3] = &unk_100018840;
  v2 = *(id *)(a1 + 32);
  xpc_activity_register("com.apple.securityuploadd.triggerupload", XPC_ACTIVITY_CHECK_IN, handler);

}

void sub_10000EEB0(uint64_t a1, xpc_activity_t activity)
{
  xpc_activity_state_t state;
  const void *v4;
  NSObject *v5;
  int v6;
  xpc_activity_state_t v7;

  state = xpc_activity_get_state(activity);
  v4 = sub_100010B28("supd");
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = state;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "hit xpc activity trigger, state: %ld", (uint8_t *)&v6, 0xCu);
  }

  if (state == 2)
    objc_msgSend(*(id *)(a1 + 32), "performRegularlyScheduledUpload");
}

void sub_10000F38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000FD84(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FD8C(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FD94(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FD9C(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDA4(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDAC(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDB4(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDBC(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDC4(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDCC(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDD4(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDDC(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDE4(id a1, const char *a2)
{
  remove((const std::__fs::filesystem::path *)a2, (std::error_code *)a2);
}

void sub_10000FDEC(id a1, const char *a2)
{
  int v3;
  int v4;
  const void *v5;
  NSObject *v6;
  const void *v7;
  NSObject *v8;
  int *v9;
  char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  char *v14;

  v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    v4 = v3;
    if (v3 != 17)
    {
      v5 = sub_100010B28("SecError");
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315394;
        v12 = a2;
        v13 = 2080;
        v14 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v11, 0x16u);
      }

    }
  }
  if (chmod(a2, 0x1FFu))
  {
    v7 = sub_100010B28("SecError");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = __error();
      v10 = strerror(*v9);
      v11 = 136315394;
      v12 = a2;
      v13 = 2080;
      v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", (uint8_t *)&v11, 0x16u);
    }

  }
}

uint64_t sub_10000FF4C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000FF5C(uint64_t a1)
{

}

void sub_10000FF64(uint64_t a1, char *a2)
{
  int v4;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  char *v16;
  NSErrorUserInfoKey v17;
  void *v18;

  if (chmod(a2, 0x1A4u))
  {
    v4 = *__error();
    v17 = NSLocalizedDescriptionKey;
    v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change permissions of %s: %s"), a2, strerror(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v18 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, v7));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (v4 != 2)
    {
      v11 = sub_100010B28("SecError");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = a2;
        v15 = 2080;
        v16 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

BOOL sub_100010114(id a1, NSURL *a2, NSError *a3)
{
  NSURL *v4;
  NSError *v5;
  const char *v6;
  void *v7;
  id v8;
  const char *v9;
  const void *v10;
  NSObject *v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = objc_retainAutorelease(a2);
  v5 = a3;
  v6 = -[NSURL fileSystemRepresentation](v4, "fileSystemRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedFailureReason](v5, "localizedFailureReason"));

  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");

  v10 = sub_100010B28("SecError");
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = "unknown error";
    if (v9)
      v12 = v9;
    v14 = 136315394;
    v15 = v6;
    v16 = 2080;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "unable to fix permissions for %s: %s", (uint8_t *)&v14, 0x16u);
  }

  return 1;
}

void sub_100010230(uint64_t a1, char *a2)
{
  int v4;
  NSString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  NSObject *v12;
  uint8_t buf[4];
  char *v14;
  __int16 v15;
  char *v16;
  NSErrorUserInfoKey v17;
  void *v18;

  if (chown(a2, 0x11Au, 0x11Au))
  {
    v4 = *__error();
    v17 = NSLocalizedDescriptionKey;
    v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change owner of %s: %s"), a2, strerror(v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v18 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
    v8 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, v7));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (v4 != 2)
    {
      v11 = sub_100010B28("SecError");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v14 = a2;
        v15 = 2080;
        v16 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "failed to change owner of %s: %s", buf, 0x16u);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

void sub_10001079C(id a1)
{
  if (getuid() == 282 || !getuid() && gTrustd)
    byte_10001DBB0 = 1;
}

void sub_1000107DC(id a1)
{
  const __CFURL *v1;

  v1 = sub_100010C24(CFSTR("private/var/protected/"), (uint64_t)CFSTR("trustd"));
  sub_100010D0C(v1, (uint64_t)&stru_100018C60);
}

void sub_100010808(id a1, const char *a2)
{
  int v3;
  int v4;
  const void *v5;
  NSObject *v6;
  uid_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  char *v11;

  v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    v4 = v3;
    if (v3 != 17)
    {
      v5 = sub_100010B28("SecError");
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315394;
        v9 = a2;
        v10 = 2080;
        v11 = strerror(v4);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", (uint8_t *)&v8, 0x16u);
      }

    }
  }
  if (qword_10001DBB8 != -1)
    dispatch_once(&qword_10001DBB8, &stru_100018C00);
  if (byte_10001DBB0 == 1)
  {
    v7 = getuid();
    chown(a2, v7, v7);
    chmod(a2, 0x1EDu);
  }
}

const void *sub_100010940(const __CFString *a1)
{
  const __CFString *v1;
  const __CFDictionary *Mutable;
  const void *Value;
  const char *CStringPtr;
  CFIndex Length;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[9];
  CFIndex usedBufLen;
  CFRange v11;

  if (a1)
    v1 = a1;
  else
    v1 = CFSTR("logging");
  os_unfair_lock_lock_with_options(&unk_10001DBC8, 0x10000);
  Mutable = (const __CFDictionary *)qword_10001DBD0;
  if (!qword_10001DBD0)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFCopyStringDictionaryKeyCallBacks, 0);
    qword_10001DBD0 = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 0x40000000;
    v7[2] = sub_100010AEC;
    v7[3] = &unk_100018C80;
    v7[4] = v1;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000;
    v8[2] = sub_100010C18;
    v8[3] = &unk_100018CD0;
    v8[4] = v7;
    CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
    if (CStringPtr)
    {
      strlen(CStringPtr);
      sub_100010C18((uint64_t)v8);
    }
    else
    {
      usedBufLen = 0;
      Length = CFStringGetLength(v1);
      v11.location = 0;
      v11.length = Length;
      CFStringGetBytes(v1, v11, 0x8000100u, 0, 0, 0, 0, &usedBufLen);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 0x40000000;
      v9[2] = sub_100010BA4;
      v9[3] = &unk_100018CA8;
      v9[6] = 0;
      v9[7] = Length;
      v9[8] = usedBufLen;
      v9[4] = v8;
      v9[5] = v1;
      sub_100010DF8(usedBufLen + 1, (uint64_t)v9);
    }
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_10001DBD0, v1);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10001DBC8);
  return Value;
}

void sub_100010AEC(uint64_t a1, const char *a2)
{
  __CFDictionary *v2;
  const void *v3;
  os_log_t v4;

  v2 = (__CFDictionary *)qword_10001DBD0;
  v3 = *(const void **)(a1 + 32);
  v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_100010B28(const char *a1)
{
  const __CFString *v2;
  const void *v3;

  pthread_mutex_lock(&stru_10001DB18);
  pthread_mutex_unlock(&stru_10001DB18);
  if (!a1)
    return sub_100010940(0);
  v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
  v3 = sub_100010940(v2);
  if (v2)
    CFRelease(v2);
  return v3;
}

uint64_t sub_100010BA4(uint64_t result, int a2, UInt8 *buffer)
{
  uint64_t v4;
  const __CFString *v5;
  CFIndex v6;
  CFIndex usedBufLen;
  CFRange v8;

  if (buffer)
  {
    v4 = result;
    v5 = *(const __CFString **)(result + 40);
    v8 = *(CFRange *)(v4 + 48);
    v6 = *(_QWORD *)(v4 + 64);
    usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v4 + 32) + 16))();
  }
  return result;
}

uint64_t sub_100010C18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

CFURLRef sub_100010C24(const __CFString *a1, uint64_t a2)
{
  const __CFURL *v4;
  const __CFAllocator *v5;
  const __CFString *Copy;
  const __CFString *v7;
  CFURLRef v8;

  v4 = CFURLCreateWithFileSystemPath(0, CFSTR("/"), kCFURLPOSIXPathStyle, 1u);
  if (a2)
  {
    v5 = kCFAllocatorDefault;
    Copy = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@/%@"), a1, a2);
  }
  else
  {
    if (!a1)
      goto LABEL_10;
    v5 = kCFAllocatorDefault;
    Copy = CFStringCreateCopy(kCFAllocatorDefault, a1);
  }
  v7 = Copy;
  if (v4 && Copy)
  {
    v8 = CFURLCreateCopyAppendingPathComponent(v5, v4, Copy, a2 == 0);
    CFRelease(v7);
LABEL_11:
    CFRelease(v4);
    return v8;
  }
  if (Copy)
    CFRelease(Copy);
LABEL_10:
  v8 = 0;
  if (v4)
    goto LABEL_11;
  return v8;
}

void sub_100010D0C(const __CFURL *a1, uint64_t a2)
{
  UInt8 __b[1024];

  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }
}

void sub_100010DA8(uint64_t a1, uint64_t a2)
{
  const __CFURL *v4;

  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  v4 = sub_100010C24(CFSTR("Library/Keychains"), a1);
  sub_100010D0C(v4, a2);
}

void sub_100010DF8(size_t size, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  if (size)
  {
    if (size > 0x800)
    {
      v4 = malloc_type_malloc(size, 0x9C1A2F70uLL);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, size, v4);
      if (v4)
        free(v4);
    }
    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((size + 15) & 0xFFFFFFFFFFFFFFF0), 170, size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))(a2, size, (char *)&v5 - ((size + 15) & 0xFFFFFFFFFFFFFFF0));
    }
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, 0, 0);
  }
}

id objc_msgSend_AppSupportPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AppSupportPath");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_accountTypeWithAccountTypeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountTypeWithAccountTypeIdentifier:");
}

id objc_msgSend_accountsWithAccountType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsWithAccountType:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addFailures_toUploadRecords_threshold_linkedUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFailures:toUploadRecords:threshold:linkedUUID:");
}

id objc_msgSend_addOSVersionToEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOSVersionToEvent:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addRequiredFieldsToEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRequiredFieldsToEvent:");
}

id objc_msgSend_allEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allEvents");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allowTrustdToReadFilesForMigration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowTrustdToReadFilesForMigration:");
}

id objc_msgSend_allowTrustdToWriteAnalyticsFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowTrustdToWriteAnalyticsFiles");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_appleUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appleUser");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_askSecurityForCKDeviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "askSecurityForCKDeviceID");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_automatedDeviceGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automatedDeviceGroup");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_carryStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carryStatus");
}

id objc_msgSend_changeOwnerOfValidFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changeOwnerOfValidFile:error:");
}

id objc_msgSend_changePermissionsOfKeychainDirectoryFile_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "changePermissionsOfKeychainDirectoryFile:error:");
}

id objc_msgSend_checkSupdEntitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkSupdEntitlement");
}

id objc_msgSend_chunkFailureSet_events_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chunkFailureSet:events:error:");
}

id objc_msgSend_ckDeviceAccountApprovedTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ckDeviceAccountApprovedTopic:");
}

id objc_msgSend_clearAllData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllData");
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

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationInfoWithIdentifiers_forAltDSID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configurationInfoWithIdentifiers:forAltDSID:completion:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_controlObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlObject:");
}

id objc_msgSend_copyEvents_failures_forUpload_participatingClients_force_linkedUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyEvents:failures:forUpload:participatingClients:force:linkedUUID:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createChunkedLoggingJSON_failures_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createChunkedLoggingJSON:failures:error:");
}

id objc_msgSend_createChunkedLoggingJSON_forUpload_participatingClients_force_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createChunkedLoggingJSON:forUpload:participatingClients:force:error:");
}

id objc_msgSend_createEventDictionary_timestamp_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEventDictionary:timestamp:error:");
}

id objc_msgSend_createLoggingJSON_forUpload_participatingClients_force_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createLoggingJSON:forUpload:participatingClients:force:error:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_dataAnalyticsSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataAnalyticsSetting:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithURL:completionHandler:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_databasePathForCKKS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForCKKS");
}

id objc_msgSend_databasePathForCloudServices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForCloudServices");
}

id objc_msgSend_databasePathForLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForLocal");
}

id objc_msgSend_databasePathForNetworking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForNetworking");
}

id objc_msgSend_databasePathForPCS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForPCS");
}

id objc_msgSend_databasePathForSOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForSOS");
}

id objc_msgSend_databasePathForSWTransparency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForSWTransparency");
}

id objc_msgSend_databasePathForTransparency(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForTransparency");
}

id objc_msgSend_databasePathForTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databasePathForTrust");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_deleteOldFiles(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteOldFiles");
}

id objc_msgSend_deleteSupplementalsAssetsDir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSupplementalsAssetsDir");
}

id objc_msgSend_deleteSystemDbFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteSystemDbFiles:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disableUploads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableUploads");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_eventIsBlacklisted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventIsBlacklisted:");
}

id objc_msgSend_expressionForConstantValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expressionForConstantValue:");
}

id objc_msgSend_expressionForFunction_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expressionForFunction:arguments:");
}

id objc_msgSend_expressionValueWithObject_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expressionValueWithObject:context:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fixFiles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixFiles:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSession");
}

id objc_msgSend_getSharedClientNamed_orCreateWithStorePath_requireDeviceAnalytics_requireiCloudAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSharedClientNamed:orCreateWithStorePath:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_getSysdiagnoseDump(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSysdiagnoseDump");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_hardFailures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardFailures");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_haveEligibleClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "haveEligibleClients");
}

id objc_msgSend_healthSummaryWithName_store_uuid_timestamp_lastUploadTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "healthSummaryWithName:store:uuid:timestamp:lastUploadTime:");
}

id objc_msgSend_increaseLengthBy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "increaseLengthBy:");
}

id objc_msgSend_initFromExistingClient_name_requireDeviceAnalytics_requireiCloudAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFromExistingClient:name:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithConnection_reporter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:reporter:");
}

id objc_msgSend_initWithDictionary_name_samplingRates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:name:samplingRates:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithPath_schema_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPath:schema:");
}

id objc_msgSend_initWithStore_queue_name_requireDeviceAnalytics_requireiCloudAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStore:queue:name:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_initWithStorePath_name_requireDeviceAnalytics_requireiCloudAnalytics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStorePath:name:requireDeviceAnalytics:requireiCloudAnalytics:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalTopicName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalTopicName");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSampledUpload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSampledUpload");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_localizedFailureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedFailureReason");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_metricsAccountID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metricsAccountID");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openWithError:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performRegularlyScheduledUpload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performRegularlyScheduledUpload");
}

id objc_msgSend_postJSON_toEndpoint_postSession_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postJSON:toEndpoint:postSession:error:");
}

id objc_msgSend_prepareEventForUpload_linkedUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareEventForUpload:linkedUUID:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousFailureCount");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_removeBlacklistedFieldsFromEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeBlacklistedFieldsFromEvent:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requireDeviceAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireDeviceAnalytics");
}

id objc_msgSend_requireiCloudAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requireiCloudAnalytics");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_rockwells(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rockwells");
}

id objc_msgSend_rpcGetCKDeviceIDWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rpcGetCKDeviceIDWithReply:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_sampleStatisticsForSamples_withName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sampleStatisticsForSamples:withName:");
}

id objc_msgSend_samples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "samples");
}

id objc_msgSend_saveReport_fileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveReport:fileName:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sendNotificationForOncePerReportSamplers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendNotificationForOncePerReportSamplers");
}

id objc_msgSend_serializeLoggingEvent_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeLoggingEvent:error:");
}

id objc_msgSend_serializedEventSize_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedEventSize:error:");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
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

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPAdditionalHeaders:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setTerseMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTerseMetrics:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUploadDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadDate:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupClientsForTopic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupClientsForTopic:");
}

id objc_msgSend_setupSamplingRates(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSamplingRates");
}

id objc_msgSend_setupTopics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupTopics");
}

id objc_msgSend_softFailures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "softFailures");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_splunkUploadURL_urlSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "splunkUploadURL:urlSession:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_storePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storePath");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringForEventClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForEventClass:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
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

id objc_msgSend_summaryCounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summaryCounts");
}

id objc_msgSend_supd_gzipDeflate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supd_gzipDeflate");
}

id objc_msgSend_sysdiagnoseStringForEventRecord_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseStringForEventRecord:");
}

id objc_msgSend_terseMetrics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terseMetrics");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_topicClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topicClients");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_updateUploadDateForClients_date_clearData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUploadDateForClients:date:clearData:");
}

id objc_msgSend_uploadAnalyticsWithError_force_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadAnalyticsWithError:force:");
}

id objc_msgSend_uploadDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadDate");
}

id objc_msgSend_uploadSizeLimit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadSizeLimit");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_withStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withStore:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
