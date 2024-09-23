uint64_t sub_100001BBC(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  const char *v23;
  uint32_t v24;
  int v25;
  int *v26;
  char *v27;
  int v29;
  int v30;
  int *v31;
  char *v32;
  const char *v33;
  uint32_t v34;
  void *v35;
  char *errorbuf;
  uint8_t buf[4];
  _QWORD v38[2];

  v7 = a3;
  v8 = v7;
  if ((a1 & 0x80000000) != 0 || !v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid inputs", buf, 2u);
    }
    goto LABEL_28;
  }
  v9 = v7;
  v10 = v9;
  v11 = v9;
  if (a4 == 1)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Documents")));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

  if ((v13 & 1) != 0)
  {
    v11 = objc_retainAutorelease(v11);
    v14 = sandbox_extension_issue_file("com.apple.sandbox.container", objc_msgSend(v11, "UTF8String"), 0);
    if (v14)
    {
      v15 = (void *)v14;
      errorbuf = 0;
      if (sandbox_init("mobile-house-arrest", 1uLL, &errorbuf) < 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v29 = *__error();
          *(_DWORD *)buf = 67109378;
          LODWORD(v38[0]) = v29;
          WORD2(v38[0]) = 2080;
          *(_QWORD *)((char *)v38 + 6) = errorbuf;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "sandbox_init failed: %d (%s)", buf, 0x12u);
        }
        sandbox_free_error(errorbuf);
        goto LABEL_41;
      }
      if (sandbox_extension_consume(v15) < 0)
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        v30 = *__error();
        v31 = __error();
        v32 = strerror(*v31);
        *(_DWORD *)buf = 67109378;
        LODWORD(v38[0]) = v30;
        WORD2(v38[0]) = 2080;
        *(_QWORD *)((char *)v38 + 6) = v32;
        v33 = "sandbox_extension_consume failed: %d (%s)";
        v34 = 18;
      }
      else
      {
        v16 = AFCCreateServerContext();
        if (v16)
        {
          v17 = v16;
          v18 = AFCConnectionCreate(0, a1, 0, 0, v16);
          if (v18)
          {
            v19 = v18;
            if (a2)
              AFCConnectionSetSecureContext(v18, a2);
            AFCInitServerConnection(v19);
            AFCServerConnectionSetFileCoordinationEnabled(v19, 1);
            AFCServerConnectionSetRespectDataProtectionClass(v19, 1);
            AFCConnectionSetIOTimeout(v19, 0);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              sub_1000030C4((uint64_t)v10, (uint64_t)v11);
            v20 = AFCServeWithRoot(v19, v10);
            if ((_DWORD)v20 != -402636789 && (v21 = v20) != 0)
            {
              v35 = (void *)AFCCopyErrorString(v20);
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109378;
                LODWORD(v38[0]) = v21;
                WORD2(v38[0]) = 2112;
                *(_QWORD *)((char *)v38 + 6) = v35;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "AFCServe failed: 0x%x (%@)", buf, 0x12u);
              }

              v22 = 0xFFFFFFFFLL;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                sub_100003080();
              v22 = 0;
            }
            AFCFreeServerContext(v17);
            AFCConnectionClose(v19);
            goto LABEL_42;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not open the AFC connection", buf, 2u);
          }
          AFCFreeServerContext(v17);
LABEL_41:
          v22 = 0xFFFFFFFFLL;
LABEL_42:
          free(v15);

          goto LABEL_29;
        }
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_41;
        *(_WORD *)buf = 0;
        v33 = "Could not create AFC server context";
        v34 = 2;
      }
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
      goto LABEL_41;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    v25 = *__error();
    v26 = __error();
    v27 = strerror(*v26);
    *(_DWORD *)buf = 67109378;
    LODWORD(v38[0]) = v25;
    WORD2(v38[0]) = 2080;
    *(_QWORD *)((char *)v38 + 6) = v27;
    v23 = "sandbox_extension_issue_file failed: %d (%s)";
    v24 = 18;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38[0] = v11;
    v23 = "%@ does not exist";
    v24 = 12;
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
  }
LABEL_27:

LABEL_28:
  v22 = 0xFFFFFFFFLL;
LABEL_29:

  return v22;
}

const __CFString *sub_1000020C4(uint64_t a1, void *a2, unsigned int a3)
{
  id v5;
  void *v6;
  const char *v7;
  const __CFString *v8;
  id v10;
  __CFString *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  unsigned int v22;
  const char *v23;
  char v24;
  uint64_t v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  __CFString *v31;
  dispatch_time_t v32;
  dispatch_queue_global_t global_queue;
  NSObject *v34;
  void *v35;
  uint64_t socket;
  uint64_t securecontext;
  unsigned int v38;
  void *v39;
  unsigned __int8 v40;
  __CFString *v41;
  const __CFString *v42;
  unsigned int v43;
  const __CFString *v44;
  const char *v45;
  const __CFString *v46;
  unsigned int v47;
  const __CFString *v48;
  uint32_t v49;
  id v50;
  __CFString *v51;
  _QWORD block[5];
  __CFString *v53;
  id v54;
  char v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  const __CFString *v61;

  v5 = a2;
  v6 = v5;
  v55 = 0;
  if (!a1 || !v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "invalid input";
      goto LABEL_8;
    }
LABEL_9:
    v8 = CFSTR("InternalFailure");
    goto LABEL_10;
  }
  if (a3 >= 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "invalid request";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v54 = 0;
  v10 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 0, &v54);
  v11 = (__CFString *)v54;
  if (v10)
  {
LABEL_16:
    v13 = v10;
    v14 = v6;
    v15 = v13;
    v16 = objc_opt_class(LSApplicationExtensionRecord);
    v17 = v15;
    if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containingBundleRecord"));

    }
    v18 = v17;
    v19 = objc_opt_class(LSApplicationRecord);
    isKindOfClass = objc_opt_isKindOfClass(v18, v19);

    if ((isKindOfClass & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v14;
        v23 = "%@ is not an application or extension for an application.";
        goto LABEL_24;
      }
LABEL_25:
      v24 = 0;
      v8 = CFSTR("ApplicationLookupFailed");
      goto LABEL_26;
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "applicationState"));
    v22 = objc_msgSend(v21, "isPlaceholder");

    if (v22)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v57 = v14;
        v23 = "found placeholder for %@";
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v51 = v11;
    if (os_variant_allows_internal_security_policies("com.apple.mobile.house_arrest"))
      v38 = objc_msgSend(v18, "isAdHocCodeSigned");
    else
      v38 = 0;
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "typeForInstallMachinery"));
    v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("User"));

    if ((v40 & 1) == 0 && (v38 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "typeForInstallMachinery"));
        *(_DWORD *)buf = 138412546;
        v57 = v14;
        v58 = 2112;
        v59 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid application type for %@: %@", buf, 0x16u);

      }
      v24 = 0;
      v8 = CFSTR("InstallationLookupFailed");
      v11 = v51;
      goto LABEL_26;
    }
    if (a3 == 1)
    {
      v11 = v51;
      if (((objc_msgSend(v18, "isFileSharingEnabled") | v38) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v14;
          v45 = "file sharing is not enabled for %@";
          v49 = 12;
          goto LABEL_79;
        }
        goto LABEL_80;
      }
    }
    else
    {
      v11 = v51;
      if (((objc_msgSend(v15, "isProfileValidated") | v38) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(v15, "isProfileValidated"))
            v46 = CFSTR("true");
          else
            v46 = CFSTR("false");
          v47 = objc_msgSend(v18, "isAdHocCodeSigned");
          *(_DWORD *)buf = 138412802;
          if (v47)
            v48 = CFSTR("true");
          else
            v48 = CFSTR("false");
          v57 = v14;
          v58 = 2112;
          v59 = v46;
          v60 = 2112;
          v61 = v48;
          v45 = "unsupported code signature for %@ (validated profile: %@, ad-hoc signed: %@)";
          goto LABEL_76;
        }
LABEL_80:
        v24 = 0;
        v8 = CFSTR("InstallationLookupFailed");
LABEL_26:

        if ((v24 & 1) != 0)
        {
          v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataContainerURL"));
          if (v25)
          {
            v26 = (__CFString *)v25;
            v50 = v14;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v26, "path"));
            v30 = objc_msgSend(v28, "fileExistsAtPath:isDirectory:", v29, &v55);

            if ((v30 & 1) != 0)
            {
              v31 = v27;
              if (v55)
              {
                v32 = dispatch_time(0, 1000000000);
                global_queue = dispatch_get_global_queue(0, 0);
                v34 = objc_claimAutoreleasedReturnValue(global_queue);
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_1000029A8;
                block[3] = &unk_100004238;
                block[4] = a1;
                dispatch_after(v32, v34, block);

                v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString path](v26, "path"));
                socket = lockdown_get_socket(a1);
                securecontext = lockdown_get_securecontext(a1);
                sub_100001BBC(socket, securecontext, v35, a3);

              }
              else
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v57 = v50;
                  v58 = 2112;
                  v59 = v26;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid data container for %@ (%@)", buf, 0x16u);
                }

                v8 = CFSTR("InvalidPath");
              }
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v57 = v50;
                v58 = 2112;
                v59 = v26;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "missing data container for %@ (%@)", buf, 0x16u);
              }

              v8 = CFSTR("PathMissing");
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v57 = v14;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to retrieve data container for %@", buf, 0xCu);
            }

            v8 = CFSTR("MissingContainer");
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v57 = v14;
            v58 = 2112;
            v59 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ is not an allowed app bundle or extension: %@", buf, 0x16u);
          }

        }
        goto LABEL_10;
      }
      if (((objc_msgSend(v15, "isUPPValidated") ^ 1 | v38) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          if (objc_msgSend(v15, "isUPPValidated"))
            v42 = CFSTR("true");
          else
            v42 = CFSTR("false");
          v43 = objc_msgSend(v18, "isAdHocCodeSigned");
          *(_DWORD *)buf = 138412802;
          if (v43)
            v44 = CFSTR("true");
          else
            v44 = CFSTR("false");
          v57 = v14;
          v58 = 2112;
          v59 = v42;
          v60 = 2112;
          v61 = v44;
          v45 = "unsupported code signature for %@ (UPP validated profile: %@, ad-hoc signed: %@)";
LABEL_76:
          v49 = 32;
LABEL_79:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v45, buf, v49);
          goto LABEL_80;
        }
        goto LABEL_80;
      }
    }
    v8 = 0;
    v24 = 1;
    goto LABEL_26;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v6;
    v58 = 2112;
    v59 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to lookup application for %@, attempting app extension: %@", buf, 0x16u);
  }
  v53 = v11;
  v10 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v6, &v53);
  v12 = v53;

  if (v10)
  {
    v11 = v12;
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v6;
    v58 = 2112;
    v59 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to lookup app extension for %@: %@", buf, 0x16u);
  }

  v8 = CFSTR("ApplicationLookupFailed");
LABEL_10:

  return v8;
}

void sub_1000029A8(uint64_t a1)
{
  sub_100002F24(*(_QWORD *)(a1 + 32), CFSTR("Status"), CFSTR("Complete"));
}

uint64_t start()
{
  id v0;
  int v1;
  int v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;
  uint8_t buf[4];
  int v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000314C();
  v0 = &_dispatch_main_q;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002B4C;
  v4[3] = &unk_100004260;
  v4[4] = &v5;
  v1 = lockdown_checkin_xpc("com.apple.mobile.house_arrest", 0, &_dispatch_main_q, v4);
  *((_DWORD *)v6 + 6) = v1;

  if (*((_DWORD *)v6 + 6))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *((_DWORD *)v6 + 6);
      *(_DWORD *)buf = 67109120;
      v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to checkin with lockdown: 0x%08x", buf, 8u);
    }
    exit(1);
  }
  CFRunLoopRun();
  _Block_object_dispose(&v5, 8);
  return 0;
}

void sub_100002B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
}

void sub_100002B4C(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  unsigned int v11;
  const __CFString *v12;
  __CFString *v13;
  int v14;
  const char *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;

  v4 = objc_autoreleasePoolPush();
  v16 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = lockdown_receive_message(a2, &v16);
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive request from host: 0x%08x", buf, 8u);
    }
LABEL_17:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closing connection", buf, 2u);
    }
    lockdown_disconnect(a2);
    exit(0);
  }
  v5 = v16;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received request: %@", buf, 0xCu);
  }
  v6 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Command")));
    v8 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Identifier")));
      v10 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("VendContainer")))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "vend container", buf, 2u);
          }
          v11 = 0;
          goto LABEL_15;
        }
        if (objc_msgSend(v7, "isEqualToString:", CFSTR("VendDocuments")))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "vend documents", buf, 2u);
          }
          v11 = 1;
LABEL_15:
          v12 = sub_1000020C4(a2, v9, v11);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue(v12);
          if (!v13)
            goto LABEL_17;
          goto LABEL_16;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received unknown command: %@", buf, 0xCu);
        }
        v13 = CFSTR("UnknownCommand");
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request did not contain an identifier", buf, 2u);
        }
        v13 = CFSTR("MissingIdentifier");
      }
LABEL_16:
      sub_100002F24(a2, CFSTR("Error"), v13);
      goto LABEL_17;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v15 = "Request did not contain a command";
      goto LABEL_26;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v15 = "Request is invalid";
LABEL_26:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
  }
  v13 = CFSTR("MissingCommand");
  goto LABEL_16;
}

void sub_100002F24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    v15 = v5;
    v16 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    v9 = lockdown_send_message(a1, v8, 100);
    if (v9)
    {
      v10 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = 138412546;
        v12 = v8;
        v13 = 1024;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send message (%@) to host: 0x%08x", (uint8_t *)&v11, 0x12u);
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "invalid inputs", (uint8_t *)&v11, 2u);
    }
    v8 = 0;
  }

}

void sub_100003080()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "closing afc connection", v0, 2u);
}

void sub_1000030C4(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "serving %@, w/ sandbox path %@", (uint8_t *)&v2, 0x16u);
}

void sub_10000314C()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "starting house arrest", v0, 2u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundleRecord");
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataContainerURL");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:error:");
}

id objc_msgSend_isAdHocCodeSigned(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAdHocCodeSigned");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileSharingEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileSharingEnabled");
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPlaceholder");
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProfileValidated");
}

id objc_msgSend_isUPPValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUPPValidated");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_typeForInstallMachinery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeForInstallMachinery");
}
