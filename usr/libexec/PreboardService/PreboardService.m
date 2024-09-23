uint64_t sub_100000C64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  io_service_t MatchingService;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  io_connect_t connect;
  mach_port_t mainPort;

  mainPort = 0;
  connect = 0;
  if (IOMasterPort(0, &mainPort))
  {
    sub_100000E14(1, 3, (uint64_t)CFSTR("%s: could not get master port\n"), v0, v1, v2, v3, v4, (uint64_t)"sep_connect");
  }
  else
  {
    v6 = IOServiceMatching("AppleSEPManager");
    if (v6)
    {
      MatchingService = IOServiceGetMatchingService(mainPort, v6);
      if (MatchingService)
      {
        if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
          return connect;
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: Failed to open SEP service."), v18, v19, v20, v21, v22, (uint64_t)"sep_connect");
      }
      else
      {
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: Could not find SEP service."), v13, v14, v15, v16, v17, (uint64_t)"sep_connect");
      }
    }
    else
    {
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: could not make matching dictionary for '%s'"), v7, v8, v9, v10, v11, (uint64_t)"sep_connect");
    }
  }
  return 0;
}

uint64_t sub_100000D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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

  v0 = sub_100000C64();
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: Purging system token."), v1, v2, v3, v4, v5, (uint64_t)"purge_system_token");
  if ((_DWORD)v0)
  {
    if (IOConnectCallScalarMethod(v0, 0x42u, 0, 0, 0, 0))
    {
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: Purging system token failed: 0x%x"), v11, v12, v13, v14, v15, (uint64_t)"purge_system_token");
      return 0;
    }
    else
    {
      v0 = 1;
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: Purging system token succeeded"), v11, v12, v13, v14, v15, (uint64_t)"purge_system_token");
    }
  }
  else
  {
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: SEP IOService was NULL."), v6, v7, v8, v9, v10, (uint64_t)"purge_system_token");
  }
  return v0;
}

void sub_100000E14(int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;

  v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a3, &a9);
  switch(a2)
  {
    case 3:
      if (a1)
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v13 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_ERROR))
          sub_1000026EC((uint64_t)v11, v13, v14, v15, v16, v17, v18, v19);
      }
      else
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v22 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_ERROR))
          sub_100002688((uint64_t)v11, v22, v23, v24, v25, v26, v27, v28);
      }
      break;
    case 2:
      if (a1)
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v20 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v11;
          v21 = "%{public}@";
LABEL_35:
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
        }
      }
      else
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v20 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v11;
          v21 = "%@";
          goto LABEL_35;
        }
      }
      break;
    case 1:
      if (qword_1000080C0 != -1)
        dispatch_once(&qword_1000080C0, &stru_100004258);
      v12 = qword_1000080B8;
      if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_DEBUG))
        sub_100002618((uint64_t)v11, v12);
      return;
    default:
      if (a1)
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v20 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v11;
          v21 = "%{public}@";
          goto LABEL_35;
        }
      }
      else
      {
        if (qword_1000080C0 != -1)
          dispatch_once(&qword_1000080C0, &stru_100004258);
        v20 = qword_1000080B8;
        if (os_log_type_enabled((os_log_t)qword_1000080B8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v11;
          v21 = "%@";
          goto LABEL_35;
        }
      }
      break;
  }
}

uint64_t sub_100001120()
{
  if (qword_1000080C0 != -1)
    dispatch_once(&qword_1000080C0, &stru_100004258);
  return qword_1000080B8;
}

void sub_100001160(id a1)
{
  qword_1000080B8 = (uint64_t)os_log_create("com.apple.preboardservice_logging", "Common");
}

void sub_10000118C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000011A4(uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSString *v16;
  CFBooleanRef v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  int v30;
  NSObject *v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  dispatch_time_t v38;
  intptr_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  BOOL v45;
  char v46;
  _BOOL4 v47;
  const __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSMutableDictionary *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  NSObject *global_queue;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  dispatch_time_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const __CFString *v84;
  const char *v85;
  _QWORD handler[5];
  _QWORD v87[7];
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  void (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  int out_token[3];

  out_token[0] = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  v88 = 0;
  v89 = &v88;
  v90 = 0x3052000000;
  v91 = sub_100001A28;
  v92 = sub_100001A38;
  v11 = "LEGACY";
  if (!a3)
    v11 = "CURRENT(v2)";
  v93 = 0;
  v85 = v11;
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: %s host tools"), a4, a5, a6, a7, a8, (uint64_t)"handle_create_stashbag");
  if (MKBGetDeviceLockState(0) == 3)
  {
    if (a1 && kCFBooleanTrue)
      sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", kCFBooleanTrue, CFSTR("Skip")));
    goto LABEL_84;
  }
  v12 = objc_msgSend(a2, "objectForKey:", CFSTR("Manifest"));
  if (v12)
  {
    v13 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
    {
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("manifest was not Data type"));
      goto LABEL_89;
    }
  }
  if (os_variant_allows_internal_security_policies(0))
  {
    v14 = objc_msgSend(a2, "objectForKey:", CFSTR("DevicePasscodeData"));
    if (v14)
    {
      v15 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
      {
        v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("passcode data was not Data type"));
LABEL_89:
        v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "handle_create_stashbag", v16);
        v25 = 0;
        v24 = 0;
        goto LABEL_70;
      }
    }
  }
  else
  {
    v14 = 0;
  }
  MKBKeyBagKeyStashCreateWithMode(0, 0);
  if (!v14)
  {
    v24 = dispatch_semaphore_create(0);
    if (!v24)
    {
      v25 = 0;
      v31 = 0;
      v30 = 0;
      v32 = CFSTR("failed to allocate semaphoer for user auth notificaiton");
      goto LABEL_55;
    }
    v25 = objc_alloc_init((Class)LAContext);
    if (!v25)
    {
      v31 = 0;
      v30 = 0;
      v32 = CFSTR("failed to allocate LAContext to prompt for passcode");
      goto LABEL_55;
    }
    v26 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
    if (!v26)
    {
      v31 = 0;
      v30 = 0;
      v32 = CFSTR("failed to allocate options dict for LAContext");
      goto LABEL_55;
    }
    v27 = (void *)MGCopyAnswer(CFSTR("device-name-localized"), 0);
    v28 = -[NSBundle localizedStringForKey:value:table:](+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileSoftwareUpdate.framework")), "localizedStringForKey:value:table:", CFSTR("UNLOCK_DEVICE"), &stru_1000045C8, CFSTR("PreboardService"));
    v29 = v28;
    if (v27)
    {
      if (v28)
        v29 = -[NSString stringByReplacingOccurrencesOfString:withString:](v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<device_name>"), v27);

    }
    if (v29)
      objc_msgSend(v26, "setObject:forKey:", v29, &off_100004E50);
    objc_msgSend(v26, "setObject:forKey:", &off_100004E50, &off_100004E68);
    objc_msgSend(v26, "setObject:forKey:", &off_100004E80, &off_100004E98);
    if (v12)
      objc_msgSend(v26, "setObject:forKey:", v12, &off_100004EB0);
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_100001A44;
    v87[3] = &unk_100004280;
    v87[5] = &v94;
    v87[6] = &v88;
    v87[4] = v24;
    objc_msgSend(v25, "evaluatePolicy:options:reply:", 1010, v26, v87);
    v30 = 0;
    v31 = 0;
    v32 = CFSTR("failed to send show message");
    if (!a1 || (v17 = kCFBooleanTrue) == 0)
    {
LABEL_55:
      v54 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2);
      if (v32)
      {
        -[__CFString UTF8String](v32, "UTF8String");
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: failed - sending error back to host: %s"), v55, v56, v57, v58, v59, (uint64_t)"handle_create_stashbag");
        -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", v32, CFSTR("ErrorString"));
      }
      else
      {
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: failed - sending error back to host"), v49, v50, v51, v52, v53, (uint64_t)"handle_create_stashbag");
      }
      if (v30)
      {
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: destroying stashbag"), v60, v61, v62, v63, v64, (uint64_t)"handle_create_stashbag");
        MKBKeyBagKeyStashCreateWithMode(0, 0);
      }
      -[NSMutableDictionary setObject:forKey:](v54, "setObject:forKey:", &off_100004EC8, CFSTR("Error"));
      sub_100001B60(a1, v54);
      if (!v31)
        goto LABEL_80;
      goto LABEL_79;
    }
    if (!sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", kCFBooleanTrue, CFSTR("ShowDialog"))))
    {
LABEL_70:
      v31 = 0;
      v30 = 0;
      goto LABEL_55;
    }
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: waiting for user auth notification"), v33, v34, v35, v36, v37, (uint64_t)"handle_create_stashbag");
    v38 = dispatch_time(0, 120000000000);
    v39 = dispatch_semaphore_wait(v24, v38);
    if (*((_BYTE *)v95 + 24))
      goto LABEL_49;
LABEL_35:
    if (v39)
    {
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: timed out waiting for unlock"), v19, v20, v21, v22, v23, (uint64_t)"handle_create_stashbag");
      objc_msgSend(v25, "invalidate");
      if (a1)
        v45 = v17 == 0;
      else
        v45 = 1;
      v46 = v45;
      if (!v45)
        sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, CFSTR("Timeout")));
      if (!v14)
      {
        sub_100000E14(1, 2, (uint64_t)CFSTR("%s: sending hide message"), v40, v41, v42, v43, v44, (uint64_t)"handle_create_stashbag");
        if ((v46 & 1) == 0)
          sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, CFSTR("HideDialog")));
      }
      goto LABEL_80;
    }
    if (!v89[5])
    {
      v31 = 0;
      v30 = 0;
      v32 = CFSTR("user authentication failed");
      goto LABEL_55;
    }
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("user authentication failed: %@"), v89[5], v85);

    goto LABEL_70;
  }
  v17 = kCFBooleanTrue;
  if (a1 && kCFBooleanTrue)
    sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", kCFBooleanTrue, CFSTR("StashCreatingWithPasscode")));
  if (v12)
    v18 = MKBKeyBagKeyStashCreateWithManifest(2, v14, v12);
  else
    v18 = MKBKeyBagKeyStashCreateWithMode(2, v14);
  v25 = 0;
  v24 = 0;
  v47 = v18 == 0;
  *((_BYTE *)v95 + 24) = v47;
  v39 = -1;
  if (!v47)
    goto LABEL_35;
LABEL_49:
  if (a3)
  {
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: legacy - committing stashbag"), v19, v20, v21, v22, v23, (uint64_t)"handle_create_stashbag");
    v39 = MKBKeyBagKeyStashCommit();
    if ((_DWORD)v39)
    {
      v48 = CFSTR("failed to commit key stash %d");
LABEL_54:
      v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v39, v85);
      v31 = 0;
      v30 = 1;
      goto LABEL_55;
    }
  }
  v39 = MKBKeyBagKeyStashPersist(v39);
  if ((_DWORD)v39)
  {
    v48 = CFSTR("failed to persist stashbag: 0x%x");
    goto LABEL_54;
  }
  v31 = dispatch_semaphore_create(0);
  if (!v31)
  {
    v30 = 1;
    v32 = CFSTR("failed to allocate disconnection semaphore");
    goto LABEL_55;
  }
  v65 = (const char *)objc_msgSend(kLockdownNotificationHostDetached, "UTF8String");
  global_queue = dispatch_get_global_queue(0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001B18;
  handler[3] = &unk_1000042A8;
  handler[4] = v31;
  if (notify_register_dispatch(v65, out_token, global_queue, handler))
  {
    v30 = 1;
    v32 = CFSTR("failed to register for notification");
    goto LABEL_55;
  }
  if (v14)
  {
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: sending stash created with passcode message"), v67, v68, v69, v70, v71, (uint64_t)"handle_create_stashbag");
    if (a1 && v17)
    {
      v77 = CFSTR("StashCreatedWithPasscode");
LABEL_74:
      sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v17, v77));
    }
  }
  else
  {
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: sending hide message"), v67, v68, v69, v70, v71, (uint64_t)"handle_create_stashbag");
    if (a1 && v17)
    {
      v77 = CFSTR("HideDialog");
      goto LABEL_74;
    }
  }
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: waiting for reboot"), v72, v73, v74, v75, v76, (uint64_t)"handle_create_stashbag");
  v78 = dispatch_time(0, 14400000000000);
  if (dispatch_semaphore_wait(v31, v78))
    v84 = CFSTR("%s: stashbag timed out - destroying stashbag");
  else
    v84 = CFSTR("%s: disconnected from host - destroying stashbag");
  sub_100000E14(1, 3, (uint64_t)v84, v79, v80, v81, v82, v83, (uint64_t)"handle_create_stashbag");
  MKBKeyBagKeyStashCreateWithMode(0, 0);
LABEL_79:
  dispatch_release(v31);
LABEL_80:
  if (v24)
    dispatch_release(v24);
  if (v25)

LABEL_84:
  if (out_token[0])
    notify_cancel(out_token[0]);
  _Block_object_dispose(&v88, 8);
  _Block_object_dispose(&v94, 8);
}

void sub_100001A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100001A28(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100001A38(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

intptr_t sub_100001A44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), a2), "UTF8String");
    sub_100000E14(1, 2, (uint64_t)CFSTR("%s: Policy successfully evaluated: %s"), v4, v5, v6, v7, v8, (uint64_t)"handle_create_stashbag_block_invoke");
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = a3;
    v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    -[NSString UTF8String](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), a3), "UTF8String");
    sub_100000E14(1, 3, (uint64_t)CFSTR("%s: evaluatePolicy: FAILED: %s"), v11, v12, v13, v14, v15, (uint64_t)"handle_create_stashbag_block_invoke");
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100001B18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100000E14(1, 3, (uint64_t)CFSTR("%s: got disconnect notification"), a4, a5, a6, a7, a8, (uint64_t)"handle_create_stashbag_block_invoke_2");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100001B60(uint64_t a1, void *a2)
{
  uint64_t result;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = 0;
  if (a1)
  {
    if (a2)
    {
      result = (uint64_t)objc_msgSend(a2, "mutableCopy");
      if (result)
      {
        v4 = (void *)result;
        objc_msgSend((id)result, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2), CFSTR("Version"));
        v5 = lockdown_send_message(a1, v4, 100);

        if (v5)
        {
          sub_100000E14(1, 3, (uint64_t)CFSTR("%s: failed to send message: %d"), v6, v7, v8, v9, v10, (uint64_t)"_sendMessageDict");
          return 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  return result;
}

BOOL sub_100001C0C(NSString *a1, NSString **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  const char *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v31;
  NSString *v32;
  NSString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  const char *v42;

  v4 = (void *)MKBGetDeviceLockStateInfo(0);
  v5 = v4;
  if (!v4)
  {
    v31 = CFSTR("couldn't fetch lock state");
LABEL_18:
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v39, v41);
    goto LABEL_19;
  }
  v41 = objc_msgSend(objc_msgSend(v4, "description"), "UTF8String");
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: returned %s\n"), v6, v7, v8, v9, v10, (uint64_t)"is_keybag_recoverable");
  v11 = objc_msgSend(v5, "objectForKey:", kMKBInfoBagState);
  if (!v11)
  {
    v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no keybag state in lock state: %@"), 0, v41);
LABEL_19:
    a1 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "is_keybag_recoverable", v32);
    v20 = 0;
LABEL_23:
    if (a1)
    {
      -[NSString UTF8String](a1, "UTF8String");
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: %s"), v34, v35, v36, v37, v38, (uint64_t)"is_keybag_recoverable");
    }
    goto LABEL_10;
  }
  v12 = v11;
  v13 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) == 0)
  {
    v31 = CFSTR("keybag state was not Number type");
    goto LABEL_18;
  }
  v14 = objc_msgSend(v12, "unsignedIntValue");
  v20 = (v14 & 0x40) == 0;
  v21 = "IS NOT";
  if ((v14 & 0x40) == 0)
    v21 = "IS";
  v42 = v21;
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: keybag %s recoverable"), v15, v16, v17, v18, v19, (uint64_t)"is_keybag_recoverable");
  if (a1)
  {
    v22 = objc_msgSend(v5, "objectForKey:", kMKBInfoRecoveryCountdown);
    if (v22)
    {
      v23 = v22;
      v24 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
      {
        *a1 = (NSString)objc_msgSend(v23, "unsignedIntValue");
        sub_100000E14(1, 2, (uint64_t)CFSTR("%s: recovery countdown: %lld"), v25, v26, v27, v28, v29, (uint64_t)"is_keybag_recoverable");
        a1 = 0;
        goto LABEL_10;
      }
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("keybag state was not Number type"), v40, v42);
    }
    else
    {
      v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no recovery countdown in lock state: %@"), v12, v42);
    }
    a1 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "is_keybag_recoverable", v33);
    goto LABEL_23;
  }
LABEL_10:
  if (a2)
    *a2 = a1;
  if (v5)

  return v20;
}

uint64_t sub_100001E48(_QWORD *a1)
{
  NSDate *v2;
  NSDate *v3;
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
  unsigned int v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSString *v26;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;

  v28 = 0;
  v29 = 0;
  v2 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", 900.0);
  if (v2)
  {
    v3 = v2;
    while (!sub_100001C0C((NSString *)&v29, &v28))
    {
      if (!v29)
      {
        v26 = v28;
        v17 = CFSTR("keybag is not recoverable and countdown time is 0 - stopping: \"%@\"");
        goto LABEL_13;
      }
      v9 = v29 / 500000;
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: waiting for keybag to be recoverable - %d seconds until recovery is possible"), v4, v5, v6, v7, v8, (uint64_t)"wait_for_recoverable_keybag");
      v15 = v9 >> (v9 > 0xA);
      if (v15 <= 1)
        v16 = 1;
      else
        v16 = v15;
      v27 = v16;
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: waiting for keybag to be recoverable - sleeping for %d seconds"), v10, v11, v12, v13, v14, (uint64_t)"wait_for_recoverable_keybag");
      sleep(v16);
      v29 = 0;
      if ((id)-[NSDate compare:](+[NSDate date](NSDate, "date"), "compare:", v3) == (id)1)
      {
        v17 = CFSTR("timed out waiting for keybag to become recoverable");
LABEL_13:
        v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "wait_for_recoverable_keybag", +[NSString stringWithFormat:](NSString, "stringWithFormat:", v17, v26, v27));
        goto LABEL_14;
      }
    }
    v18 = 1;
    v19 = v28;
    if (v28)
      goto LABEL_15;
  }
  else
  {
    v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "wait_for_recoverable_keybag", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("couldn't create timeout object")));
LABEL_14:
    v18 = 0;
    v28 = v19;
    if (v19)
    {
LABEL_15:
      -[NSString UTF8String](v19, "UTF8String");
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: %s"), v20, v21, v22, v23, v24, (uint64_t)"wait_for_recoverable_keybag");
    }
  }
  if (a1)
    *a1 = v28;
  return v18;
}

uint64_t sub_100002010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  const CFBooleanRef *v15;

  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: CURRENT(v2) host tools"), a4, a5, a6, a7, a8, (uint64_t)"handle_clear_system_token");
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: Clearing system token in preparation for an erase."), v9, v10, v11, v12, v13, (uint64_t)"handle_clear_system_token");
  result = sub_100000D50();
  v15 = &kCFBooleanTrue;
  if (!(_DWORD)result)
    v15 = &kCFBooleanFalse;
  if (a1)
  {
    if (*v15)
      return sub_100001B60(a1, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", *v15, CFSTR("ClearSystemTokenSuccess")));
  }
  return result;
}

void sub_1000020CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSMutableDictionary *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSDictionary *p_super;
  uint64_t v57;
  const __CFString *v58;
  NSString *v59;
  NSString *v60;

  v60 = 0;
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: starting"), a4, a5, a6, a7, a8, (uint64_t)"handle_commit_stashbag");
  v10 = objc_msgSend(a2, "objectForKey:", CFSTR("Manifest"));
  if (v10)
  {
    v11 = objc_opt_class(NSData);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) == 0)
    {
      v58 = CFSTR("manifest was not Data type");
LABEL_28:
      v60 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %@"), "handle_commit_stashbag", +[NSString stringWithFormat:](NSString, "stringWithFormat:", v58, v59));
      goto LABEL_17;
    }
  }
  if (!MGGetBoolAnswer(CFSTR("Image4Supported")))
    goto LABEL_15;
  v12 = MGGetBoolAnswer(CFSTR("q69vauqK9djnPlEZBFBV4A"));
  if (!v10)
  {
    if (v12)
    {
      v60 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NULL manifest - manifest is required on this device"));
      -[NSString UTF8String](v60, "UTF8String");
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: %s"), v24, v25, v26, v27, v28, (uint64_t)"handle_commit_stashbag");
      goto LABEL_17;
    }
    sub_100000E14(1, 3, (uint64_t)CFSTR("%s: manifest not required - continuing"), v13, v14, v15, v16, v17, (uint64_t)"handle_commit_stashbag");
    goto LABEL_15;
  }
  if (!v12)
  {
    if (MKBKeyBagKeyStashSetManifest(v10))
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: failed to set manifest: %d (not required - continuing)"), v29, v30, v31, v32, v33, (uint64_t)"handle_commit_stashbag");
    goto LABEL_15;
  }
  if (!sub_100001E48(&v60))
  {
    v59 = v60;
    v58 = CFSTR("tried to wait for recoverable keybag, but keybag is not recoverable: %@");
    goto LABEL_28;
  }
  v18 = MKBKeyBagKeyStashSetManifest(v10);
  if ((_DWORD)v18)
  {
    v60 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to set manifest: %d"), v18);
    -[NSString UTF8String](v60, "UTF8String");
    sub_100000E14(1, 3, (uint64_t)CFSTR("%s: %s"), v19, v20, v21, v22, v23, (uint64_t)"handle_commit_stashbag");
LABEL_17:
    v50 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2);
    if (v60)
    {
      -[NSString UTF8String](v60, "UTF8String");
      sub_100000E14(1, 3, (uint64_t)CFSTR("%s: failed - sending error back to host:%s"), v51, v52, v53, v54, v55, (uint64_t)"handle_commit_stashbag");
      -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", v60, CFSTR("ErrorString"));
    }
    else
    {
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: failed - sending error back to host"), v45, v46, v47, v48, v49, (uint64_t)"handle_commit_stashbag");
    }
    -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", &off_100004EC8, CFSTR("Error"));
    -[NSMutableDictionary setObject:forKey:](v50, "setObject:forKey:", &off_100004EE0, CFSTR("StashbagCommitComplete"));
    v57 = a1;
    p_super = &v50->super;
    goto LABEL_24;
  }
LABEL_15:
  v34 = MKBKeyBagKeyStashCommit();
  if ((_DWORD)v34)
  {
    v60 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to commit stashbag: %d"), v34);
    -[NSString UTF8String](v60, "UTF8String");
    sub_100000E14(1, 3, (uint64_t)CFSTR("%s: %s"), v40, v41, v42, v43, v44, (uint64_t)"handle_commit_stashbag");
    MKBKeyBagKeyStashCreateWithMode(0, 0);
    goto LABEL_17;
  }
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: successfully committed stashbag"), v35, v36, v37, v38, v39, (uint64_t)"handle_commit_stashbag");
  if (a1 && kCFBooleanTrue)
  {
    p_super = +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", kCFBooleanTrue, CFSTR("StashbagCommitComplete"));
    v57 = a1;
LABEL_24:
    sub_100001B60(v57, p_super);
  }
}

void sub_1000023D4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef cf;

  cf = 0;
  if (a1)
  {
    v8 = a1;
    if (dword_1000080B0 == 1)
    {
      v9 = 1;
LABEL_8:
      sub_1000011A4(a1, a2, v9, a4, a5, a6, a7, a8);
      goto LABEL_9;
    }
    if (!lockdown_receive_message(a1, &cf))
    {
      v10 = objc_msgSend((id)cf, "valueForKey:", CFSTR("Command"));
      if (v10)
      {
        v11 = v10;
        if (objc_msgSend(v10, "isEqualToString:", CFSTR("CreateStashbag")))
        {
          a2 = (void *)cf;
          a1 = v8;
          v9 = 0;
          goto LABEL_8;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("CommitStashbag")))
        {
          sub_1000020CC(v8, (void *)cf, v12, v13, v14, v15, v16, v17);
          goto LABEL_9;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("ClearSystemToken")))
        {
          sub_100002010(v8, v18, v19, v20, v21, v22, v23, v24);
LABEL_9:
          if (cf)
            CFRelease(cf);
          return;
        }
        sub_100000E14(1, 3, (uint64_t)CFSTR("%s: unknown command: %@"), v20, v21, v22, v23, v24, (uint64_t)"handle_connection");
      }
    }
    if (kCFBooleanTrue)
      sub_100001B60(v8, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", kCFBooleanTrue, CFSTR("Error")));
    goto LABEL_9;
  }
}

void start(int a1, char **a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;

  while (1)
  {
    while (1)
    {
      v4 = getopt(a1, a2, "v:");
      if (v4 != 118)
        break;
      dword_1000080B0 = atoi(optarg);
    }
    if (v4 == -1)
    {
      sub_100000E14(1, 2, (uint64_t)CFSTR("%s: Preboard Service Version: %d"), v5, v6, v7, v8, v9, (uint64_t)"main");
      if (dword_1000080B0 == 1)
        v10 = "com.apple.preboardservice";
      else
        v10 = "com.apple.preboardservice_v2";
      lockdown_checkin_xpc(v10, 0, 0, &stru_1000042E8);
      dispatch_main();
    }
  }
}

void sub_1000025C8(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_1000023D4((uint64_t)a2, a3, (uint64_t)a3, v3, v4, v5, v6, v7);
  lockdown_disconnect(a2);
  sub_100000E14(1, 2, (uint64_t)CFSTR("%s: done"), v9, v10, v11, v12, v13, (uint64_t)"main_block_invoke");
  exit(0);
}

void sub_100002618(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
  sub_10000119C();
}

void sub_100002688(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000118C((void *)&_mh_execute_header, a2, a3, "%@", a5, a6, a7, a8, 2u);
  sub_10000119C();
}

void sub_1000026EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000118C((void *)&_mh_execute_header, a2, a3, "%{public}@", a5, a6, a7, a8, 2u);
  sub_10000119C();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_evaluatePolicy_options_reply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePolicy:options:reply:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
