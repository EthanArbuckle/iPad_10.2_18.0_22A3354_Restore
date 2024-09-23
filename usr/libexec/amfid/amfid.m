void sub_100004F60(void *a1)
{
  id v1;
  UNMutableNotificationContent *v2;
  NSObject *v3;
  id v4;
  uint64_t Value;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  _BOOL4 v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFTypeRef buf[3];

  v1 = a1;
  v2 = objc_opt_new(UNMutableNotificationContent);
  v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 136315138;
    *(CFTypeRef *)((char *)buf + 4) = "showProfileInstalledNotification";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%s] attempting profile trust notification", (uint8_t *)buf, 0xCu);
  }
  v4 = v1;
  buf[0] = 0;
  if (MISCopyProvisioningProfile() || !buf[0])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001942C();
  }
  else
  {
    Value = MISProfileGetValue(buf[0], CFSTR("TeamName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
    if (v6)
      goto LABEL_11;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_1000193BC();
  }
  v6 = 0;
LABEL_11:
  if (buf[0])
    CFRelease(buf[0]);

  if (v6)
  {
    v7 = sub_10000999C(CFSTR("UPP_TRUST_TITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v10 = objc_msgSend(v9, "userInterfaceIdiom") == 0;

    if (v10)
    {
      v13 = CFSTR("UPP_TRUST_BODY_IPHONE");
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v12 = objc_msgSend(v11, "userInterfaceIdiom") == (id)1;

      if (v12)
        v13 = CFSTR("UPP_TRUST_BODY_IPAD");
      else
        v13 = CFSTR("UPP_TRUST_BODY");
    }
    v14 = sub_10000999C(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v6));
    v17 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.amfi.usernotifications"));
    -[UNMutableNotificationContent setTitle:](v2, "setTitle:", v8);
    -[UNMutableNotificationContent setBody:](v2, "setBody:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
    -[UNMutableNotificationContent setSound:](v2, "setSound:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", CFSTR("gear")));
    -[UNMutableNotificationContent setIcon:](v2, "setIcon:", v19);

    -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v2, "setShouldIgnoreDoNotDisturb:", 1);
    -[UNMutableNotificationContent setShouldIgnoreDowntime:](v2, "setShouldIgnoreDowntime:", 1);
    -[UNMutableNotificationContent setShouldHideTime:](v2, "setShouldHideTime:", 0);
    -[UNMutableNotificationContent setShouldHideDate:](v2, "setShouldHideDate:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=General&path=ManagedConfigurationList")));
    -[UNMutableNotificationContent setDefaultActionURL:](v2, "setDefaultActionURL:", v20);

    -[UNMutableNotificationContent setShouldSuppressScreenLightUp:](v2, "setShouldSuppressScreenLightUp:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v22, v2, 0, 3));

    objc_msgSend(v17, "addNotificationRequest:withCompletionHandler:", v23, &stru_100024EE0);
  }

}

void sub_1000052F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

void sub_100005318(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  int v4;
  const char *v5;

  v2 = a2;
  v3 = off_100028EF0;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_1000194B8();
  }
  else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "showProfileInstalledNotification_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[%s] posted profile trust notification", (uint8_t *)&v4, 0xCu);
  }

}

void sub_100005400(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100005410(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  uint8_t buf[4];
  int v6;

  v4 = 0;
  AMFIGetSecurityBootMode(&v4);
  v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v6 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "committing developer mode state: %u", buf, 8u);
  }
  AMFIDeveloperModeCommit(a1);
  sub_10000DFB0();
  if ((v4 - 1) > 1)
    result = sub_100009854(&stru_100024F20);
  else
    result = AMFICompleteSecurityBootMode();
  byte_100029520 = 1;
  return result;
}

int sub_1000054F8(id a1, unsigned int a2)
{
  return IOConnectCallScalarMethod(a2, 0x11u, 0, 0, 0, 0);
}

void sub_100005514()
{
  LAContext *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  NSObject *v11;
  LAContext *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  NSObject *v27;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v29;
  id v30;
  uint8_t buf[24];

  v0 = objc_opt_new(LAContext);
  if (sub_100009B0C())
  {
    v1 = sub_10000999C(CFSTR("DEV_MODE_NEEDS_AUTH"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    -[LAContext setOptionAuthenticationTitle:](v0, "setOptionAuthenticationTitle:", v2);

    -[LAContext setOptionSecurePassphrase:](v0, "setOptionSecurePassphrase:", &__kCFBooleanTrue);
  }
  v29 = 0;
  v3 = -[LAContext evaluatePolicy:options:error:](v0, "evaluatePolicy:options:error:", 1024, 0, &v29);
  v4 = v29;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    v7 = off_100028EF0;
    if (v6 == (id)-4)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "enableDeveloperModeWithAuth";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: will retry user authentication", buf, 0xCu);
      }
      if (++dword_100029524 <= 7)
      {
        v8 = dispatch_time(0, 5000000000);
        global_queue = dispatch_get_global_queue(33, 0);
        v10 = objc_claimAutoreleasedReturnValue(global_queue);
        dispatch_after_f(v8, v10, 0, (dispatch_function_t)sub_100005514);

      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_1000196C0(v7, v5);
      sub_100005410(0);
    }
  }
  else
  {
    v11 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "enableDeveloperModeWithAuth";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s: user authentication successful -- enabling developer mode", buf, 0xCu);
    }
    *(_QWORD *)buf = 1;
    v12 = v0;
    v13 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, v12);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 8));
      v30 = 0;
      objc_msgSend(v13, "setData:forKey:error:", v14, 3, &v30);
      v15 = v30;

      if (v15)
      {
        v16 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_10001961C(v16, v15);

      }
      else
      {
        sub_100005410(1);
        if (amfi_developer_mode_status())
        {
          v25 = launch_enable_directory("/System/Library/DeveloperModeLaunchDaemons");
          if (v25)
          {
            v26 = v25;
            v27 = off_100028EF0;
            if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
              sub_100019598(v26, v27);
          }
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("security.mac.amfi.developer_mode_status.changed"), 0, 0, 1u);
      }
    }
    else
    {
      v17 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019528(v17, v18, v19, v20, v21, v22, v23, v24);
    }

  }
}

void sub_100005878()
{
  NSObject *v0;
  NSObject *v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;

  v5 = 0;
  AMFIGetSecurityBootMode(&v5);
  v0 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "checkDeveloperModeEnrollment";
    v8 = 1024;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "%s: resolved security-boot-mode: %u", buf, 0x12u);
  }
  if (v5 == 2 && byte_100029520 == 0)
  {
    if (amfi_developer_mode_resolved())
    {
      byte_100029520 = 1;
    }
    else if (!byte_100029520 && (_os_feature_enabled_impl("LocalAuthentication", "PreboardDeveloperMode") & 1) == 0)
    {
      v2 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v7 = "checkDeveloperModeEnrollment";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: starting enrollment", buf, 0xCu);
      }
      global_queue = dispatch_get_global_queue(33, 0);
      v4 = objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_async(v4, &stru_100024F60);

    }
  }
}

void sub_1000059F8(id a1)
{
  id v1;
  const __CFDictionary *v2;
  __CFUserNotification *v3;
  __CFUserNotification *v4;
  SInt32 v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SInt32 v16;
  NSObject *v17;
  NSObject *v18;
  SInt32 error;
  CFOptionFlags responseFlags;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  CFOptionFlags v24;

  responseFlags = 0;
  error = -1;
  if (sub_100009AF0())
  {
    v1 = sub_10000C414();
    v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(v1);
    if (v2)
    {
      v3 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0x20uLL, &error, v2);
      v4 = v3;
      v5 = error;
      if (error)
      {
        v6 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_1000197D4(v5, v6, v7);
      }
      else
      {
        v16 = CFUserNotificationReceiveResponse(v3, 0.0, &responseFlags);
        v17 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "__startDeveloperModeEnrollment";
          v23 = 2048;
          v24 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s: notify response: %ld", buf, 0x16u);
        }
        if (v16)
          goto LABEL_14;
        v18 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v22 = "__startDeveloperModeEnrollment";
          v23 = 2048;
          v24 = responseFlags & 3;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: button flags: 0x%0lX", buf, 0x16u);
        }
        if ((responseFlags & 1) != 0)
          sub_100005514();
        else
LABEL_14:
          sub_100005410(0);
      }

      if (v4)
        CFRelease(v4);
    }
    else
    {
      v8 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019764(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void sub_100005C04(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void sub_100005C2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100005C38(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005C70(const char *a1, uint64_t a2, unsigned int a3, uint64_t a4, _DWORD *a5, _DWORD *a6, _DWORD *a7, vm_offset_t *a8, mach_msg_type_number_t *a9, _DWORD *a10, vm_offset_t *a11, mach_msg_type_number_t *a12, _DWORD *a13)
{
  void *v17;
  void *v18;
  _DWORD *v19;
  _DWORD *v20;
  _DWORD *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  vm_map_read_t v27;
  id v28;
  void *v29;
  void *v30;
  vm_map_read_t v31;
  id v32;
  kern_return_t v33;
  void *context;
  id v39;

  context = objc_autoreleasePoolPush();
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v17));

  v19 = a6;
  *a6 = 0;
  v20 = a7;
  *a7 = 0;
  v21 = a5;
  *a5 = 0;
  *a12 = 0;
  *a11 = 0;
  *a13 = 0;
  v22 = objc_msgSend(objc_alloc((Class)AMFIPathValidator_ios), "initWithURL:withFileOffset:withFlags:", v18, a2, a3);
  v39 = 0;
  LODWORD(v17) = objc_msgSend(v22, "validateWithError:", &v39);
  v23 = v39;
  v24 = v23;
  if ((_DWORD)v17)
  {
    objc_msgSend(v22, "computedCdHash:", a4);
    *v21 = objc_msgSend(v22, "signerType");
    *v19 = objc_msgSend(v22, "isValid");
    *v20 = objc_msgSend(v22, "areEntitlementsValidated");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "profileData"));
    v26 = v25;
    if (v25)
    {
      v27 = mach_task_self_;
      v28 = objc_retainAutorelease(v25);
      if (vm_read(v27, (vm_address_t)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"), a8, a9))
      {
        *a10 = 0;
        *a9 = 0;
      }
      else
      {
        *a10 = 1;
      }
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "profileAuxSig"));
    v30 = v29;
    if (v29)
    {
      v31 = mach_task_self_;
      v32 = objc_retainAutorelease(v29);
      v33 = vm_read(v31, (vm_address_t)objc_msgSend(v32, "bytes"), objc_msgSend(v32, "length"), a11, a12);
      if (v33)
      {
        syslog(3, "%s: unable to vm_read profileAuxSig: %d", a1, v33);
        *a11 = 0;
        *a12 = 0;
      }
      else
      {
        *a13 = 1;
      }
    }

  }
  else
  {
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "description")));
    syslog(3, "%s not valid: %s", a1, (const char *)objc_msgSend(v26, "UTF8String"));
  }

  objc_autoreleasePoolPop(context);
}

uint64_t sub_100005F14()
{
  if (qword_1000295F8 != -1)
    dispatch_once(&qword_1000295F8, &stru_100024FA0);
  return qword_1000295F0;
}

void sub_100005F54(id a1)
{
  qword_1000295F0 = (uint64_t)dispatch_workloop_create_inactive("com.apple.amfi.mach");
  dispatch_set_target_queue((dispatch_object_t)qword_1000295F0, 0);
  dispatch_set_qos_class_fallback(qword_1000295F0, 33);
  dispatch_workloop_set_scheduler_priority(qword_1000295F0, 36, 1);
  dispatch_activate((dispatch_object_t)qword_1000295F0);
}

void sub_100005FA8()
{
  uint64_t v0;
  NSObject *v1;
  xpc_connection_t mach_service;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v0 = sub_100005F14();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  mach_service = xpc_connection_create_mach_service("com.apple.amfi.xpc", v1, 1uLL);
  v3 = (void *)qword_100029528;
  qword_100029528 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100029528, &stru_100024FE0);
  xpc_connection_resume((xpc_connection_t)qword_100029528);
  v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "setupXPCInterface";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: XPC interface setup", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100006098(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  _QWORD handler[4];
  OS_xpc_object *v5;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = v2;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000618C;
    handler[3] = &unk_100025008;
    v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_resume(v3);

  }
  else if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(v2, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019854();
  }

}

void sub_10000618C(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _UNKNOWN **v17;
  uint64_t v18;
  xpc_object_t reply;
  void *v20;
  int v21;
  const char *v22;
  __int16 v23;
  void *v24;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v5 = v3;
    v6 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    v7 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
    {
      v21 = 136315394;
      v22 = "__handleXPCDictionary";
      v23 = 2112;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: new XPC Dictionary: %@", (uint8_t *)&v21, 0x16u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("action")));
    v9 = (unint64_t)objc_msgSend(v8, "longValue");

    if (v9 < 3)
    {
      v18 = ((uint64_t (*)(void *))off_100025028[v9])(v6);
      v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v10 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_1000198C0(v9, v10, v11, v12, v13, v14, v15, v16);
      v17 = &off_100026070;
    }
    reply = xpc_dictionary_create_reply(v5);

    v20 = (void *)_CFXPCCreateXPCMessageWithCFObject(v17);
    xpc_dictionary_set_value(reply, "cfreply", v20);

    xpc_connection_send_message(v4, reply);
  }
  else if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019938();
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }

}

id sub_1000063C4()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  void *v6;
  void *v7;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;

  v0 = AMFIArmSecurityBootMode(2);
  v1 = off_100028EF0;
  v2 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO);
  if (v0)
  {
    if (v2)
    {
      *(_DWORD *)buf = 136315394;
      v12 = "__xpcActionArmDeveloperMode";
      v13 = 1024;
      v14 = v0;
      v3 = "%s: failed to arm security boot mode: %u";
      v4 = v1;
      v5 = 18;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v3, buf, v5);
    }
  }
  else if (v2)
  {
    *(_DWORD *)buf = 136315138;
    v12 = "__xpcActionArmDeveloperMode";
    v3 = "%s: armed security boot mode";
    v4 = v1;
    v5 = 12;
    goto LABEL_6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v0 == 0, CFSTR("success")));
  v10 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));

  return v7;
}

id sub_100006518()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSNumber *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  void *v15;

  sub_100005410(0);
  if (!amfi_developer_mode_status())
  {
    v0 = launch_disable_directory("/System/Library/DeveloperModeLaunchDaemons");
    if ((_DWORD)v0)
    {
      v1 = v0;
      v2 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_1000199A4(v1, v2, v3, v4, v5, v6, v7, v8);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("security.mac.amfi.developer_mode_status.changed"), 0, 0, 1u);
  }
  v14 = CFSTR("success");
  v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", !amfi_developer_mode_status());
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  return v12;
}

id sub_100006628(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[6];
  _QWORD v16[3];
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[4];

  v1 = a1;
  v23[0] = &__kCFBooleanTrue;
  v22[0] = CFSTR("success");
  v22[1] = CFSTR("status");
  if (amfi_developer_mode_status())
    v2 = &__kCFBooleanTrue;
  else
    v2 = &__kCFBooleanFalse;
  v23[1] = v2;
  v22[2] = CFSTR("armed");
  LODWORD(v15[0]) = 0;
  AMFIGetSecurityBootModeArmed(v15);
  if ((LODWORD(v15[0]) - 1) >= 2)
    v3 = &__kCFBooleanFalse;
  else
    v3 = &__kCFBooleanTrue;
  v23[2] = v3;
  v22[3] = CFSTR("writable");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006818;
  v15[3] = &unk_100025048;
  v15[4] = &v18;
  v15[5] = v16;
  v4 = sub_100009854(v15);
  if ((_DWORD)v4)
  {
    v5 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019A1C(v4, v5, v6, v7, v8, v9, v10, v11);
    v12 = &__kCFBooleanFalse;
  }
  else if (v19[3])
  {
    v12 = &__kCFBooleanTrue;
  }
  else
  {
    v12 = &__kCFBooleanFalse;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  v23[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 4));

  return v13;
}

void sub_1000067EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006818(uint64_t a1, mach_port_t connection)
{
  return IOConnectCallScalarMethod(connection, 0xFu, 0, 0, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (uint32_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void sub_100006840(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_100006850(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, _QWORD *a6)
{
  if (*a6 | a6[1] | a6[2] | a6[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019A94();
    return 5;
  }
  else
  {
    if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0)
      sub_10000C370(a2, a3, a4, a5);
    return 0;
  }
}

uint64_t sub_100006900(uint64_t a1, uint64_t a2, unsigned int a3, vm_offset_t *a4, mach_msg_type_number_t *a5, _DWORD *a6, _DWORD *a7)
{
  uint64_t v7;
  int v13;
  const __CFData *v14;
  CFPropertyListRef v15;
  uint64_t v16;
  vm_map_read_t v18;
  const UInt8 *BytePtr;
  unsigned int Length;
  CFDataRef v21;

  if (*(_QWORD *)a7 | *((_QWORD *)a7 + 1) | *((_QWORD *)a7 + 2) | *((_QWORD *)a7 + 3))
  {
    syslog(4, "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }", "construct_der_entitlements", *a7, a7[1], a7[2], a7[3], a7[4], a7[5], a7[6], a7[7]);
    return 5;
  }
  syslog(6, "Being asked to construct DER entitlements");
  v13 = sub_10000A584(a2, a3);
  sub_10000A540();
  if (v13)
  {
    syslog(6, "Cannot construct DER entitlements due to an entitlement anomaly");
    return 14;
  }
  v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)(a2 + 8), a3 - 8, kCFAllocatorNull);
  v15 = CFPropertyListCreateWithData(kCFAllocatorDefault, v14, 0, 0, 0);
  CFRelease(v14);
  if (!v15)
  {
    syslog(6, "Cannot construct DER entitlements, possibly corrupt XML");
    return 14;
  }
  v21 = 0;
  v16 = CESerializeCFDictionary(CECRuntime, v15, &v21);
  CFRelease(v15);
  if (v16 != kCENoError)
  {
    if (v21)
      CFRelease(v21);
    return 14;
  }
  v18 = mach_task_self_;
  BytePtr = CFDataGetBytePtr(v21);
  Length = CFDataGetLength(v21);
  v7 = vm_read(v18, (vm_address_t)BytePtr, Length, a4, a5);
  CFRelease(v21);
  if ((_DWORD)v7)
  {
    *a6 = 0;
    *a5 = 0;
  }
  else
  {
    *a6 = 1;
    syslog(6, "Successfully transmuted entitlements.");
  }
  return v7;
}

uint64_t sub_100006B00(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14, uint64_t a15, vm_offset_t *a16, mach_msg_type_number_t *a17, _DWORD *a18, vm_offset_t *a19, mach_msg_type_number_t *a20,_DWORD *a21,_DWORD *a22)
{
  *a8 = 0;
  *a9 = 0;
  *a11 = 0;
  *a12 = 0;
  *a13 = 0;
  *a10 = 0;
  *a17 = 0;
  *a16 = 0;
  *a18 = 0;
  *a20 = 0;
  *a19 = 0;
  *a21 = 0;
  *(_QWORD *)a15 = 0;
  *(_QWORD *)(a15 + 8) = 0;
  *(_DWORD *)(a15 + 16) = 0;
  if (*(_QWORD *)a22 | *((_QWORD *)a22 + 1) | *((_QWORD *)a22 + 2) | *((_QWORD *)a22 + 3))
  {
    syslog(4, "%s: bad security token { 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x }", "verify_code_directory", *a22, a22[1], a22[2], a22[3], a22[4], a22[5], a22[6], a22[7]);
  }
  else
  {
    syslog(6, "Entering iOS path for %s", a2);
    sub_100005C70(a2, a3, a4, a15, a11, a9, a8, a16, a17, a18, a19, a20, a21);
  }
  return 0;
}

uint64_t sub_100006C44(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = *a3 | a3[1] | a3[2] | a3[3];
  v4 = off_100028EF0;
  v5 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      sub_100019B58();
  }
  else if (v5)
  {
    sub_100019B24(v4, v6, v7, v8, v9, v10, v11, v12);
  }
  return 5;
}

uint64_t sub_100006CBC(uint64_t a1, const void *a2, _QWORD *a3)
{
  int v5;
  int v6;
  ssize_t v7;
  int v8;
  ssize_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _OWORD __s1[6];
  char v20;

  if (*a3 | a3[1] | a3[2] | a3[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019B58();
    return 5;
  }
  v5 = open("/private/var/db/amfid/swift_playgrounds_public_key", 0);
  if (v5 == -1)
  {
    if (*__error() != 2)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019D10();
      return 5;
    }
    goto LABEL_12;
  }
  v6 = v5;
  if (v5 < 0)
  {
LABEL_12:
    v8 = open("/private/var/db/amfid/swift_playgrounds_public_key", 1537, 384);
    if (v8 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019BB8();
      return 5;
    }
    v6 = v8;
    v9 = write(v8, a2, 0x61uLL);
    if (v9 != 97)
    {
      if (v9 == -1)
      {
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_100019C94();
      }
      else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      {
        sub_100019C34();
      }
      close(v6);
      unlink("/private/var/db/amfid/swift_playgrounds_public_key");
      return 5;
    }
    v18 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(__s1[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "successfully stored local signing public key", (uint8_t *)__s1, 2u);
    }
    goto LABEL_28;
  }
  v20 = 0;
  memset(__s1, 0, sizeof(__s1));
  v7 = read(v5, __s1, 0x61uLL);
  if (v7 != 97)
  {
    if (v7 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019DEC();
    }
    else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    {
      sub_100019D8C();
    }
    return 5;
  }
  if (memcmp(__s1, a2, 0x61uLL))
  {
    v10 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019E68(v10, v11, v12, v13, v14, v15, v16, v17);
    return 5;
  }
LABEL_28:
  close(v6);
  return 0;
}

uint64_t sub_100006F80(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  int v5;
  int v6;
  ssize_t v7;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;

  if (*a3 | a3[1] | a3[2] | a3[3])
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_100019B58();
    return 5;
  }
  else
  {
    v5 = open("/private/var/db/amfid/swift_playgrounds_public_key", 0);
    if (v5 == -1)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019E9C();
      if (*__error() == 2)
        return 56;
      else
        return 5;
    }
    else
    {
      v6 = v5;
      v20 = 0;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v7 = read(v5, &v14, 0x61uLL);
      if (v7 == 97)
      {
        v8 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "successfully acquired local signing public key", v13, 2u);
        }
        v3 = 0;
        *(_BYTE *)(a2 + 96) = v20;
        v9 = v19;
        *(_OWORD *)(a2 + 64) = v18;
        *(_OWORD *)(a2 + 80) = v9;
        v10 = v15;
        *(_OWORD *)a2 = v14;
        *(_OWORD *)(a2 + 16) = v10;
        v11 = v17;
        *(_OWORD *)(a2 + 32) = v16;
        *(_OWORD *)(a2 + 48) = v11;
      }
      else
      {
        if (v7 == -1)
        {
          if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
            sub_100019DEC();
        }
        else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        {
          sub_100019D8C();
        }
        v3 = 5;
      }
      if (close(v6) == -1)
        sub_100019F18();
    }
  }
  return v3;
}

uint64_t start(int a1, char **a2)
{
  char v4;
  char v5;
  int v6;
  os_log_t v7;
  os_log_t v8;
  int v9;
  int v10;
  timespec v11;
  uint64_t v13;
  NSObject *v14;
  uint8_t buf[12];
  mach_port_t sp;
  stat v17;

  v4 = 1;
  do
  {
    v5 = v4;
    v6 = getopt(a1, a2, "d");
    v4 = 0;
  }
  while (v6 == 100);
  if (v6 != -1)
  {
    fprintf(__stderrp, "unrecognized argument '%c'\n", optopt);
    goto LABEL_22;
  }
  v7 = os_log_create("com.apple.MobileFileIntegrity", "amfid");
  v8 = (os_log_t)&_os_log_default;
  if (v7)
    v8 = v7;
  off_100028EF0 = v8;
  if ((v5 & 1) != 0)
    v9 = 1;
  else
    v9 = 33;
  if ((v5 & 1) != 0)
    v10 = 63;
  else
    v10 = 255;
  openlog("amfid", v9, 24);
  setlogmask(v10);
  syslog(6, "starting");
  v11.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v11.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v17.st_blksize = v11;
  *(timespec *)v17.st_qspare = v11;
  v17.st_birthtimespec = v11;
  *(timespec *)&v17.st_size = v11;
  v17.st_mtimespec = v11;
  v17.st_ctimespec = v11;
  *(timespec *)&v17.st_uid = v11;
  v17.st_atimespec = v11;
  *(timespec *)&v17.st_dev = v11;
  if (!stat("/private/var/db/amfid", &v17))
  {
LABEL_23:
    sp = 0;
    sub_10000740C(&sp);
    if (sp)
    {
      v13 = sub_100005F14();
      qword_100029600 = dispatch_mach_create_f("amfi_mach_channel", v13, &off_1000253B0, sub_100007464);
      dispatch_mach_connect();
      dispatch_release((dispatch_object_t)qword_100029600);
      if (os_variant_is_darwinos("com.apple.amfid"))
      {
        v14 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "amfid is booted as darwinOS", buf, 2u);
        }
      }
      sub_100005FA8();
      sub_10000D5C8();
      sub_10000C9F4();
      sub_100005878();
      if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0)
        sub_10000C280();
      sub_1000091BC();
      dispatch_main();
    }
    syslog(3, "could not get mach port");
LABEL_22:
    exit(1);
  }
  if (*__error() == 2)
  {
    if (mkdir("/private/var/db/amfid", 0x1EDu) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_100019F34();
      return *__error();
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    sub_100019FB0();
  return *__error();
}

void sub_10000740C(mach_port_t *sp)
{
  int *v1;
  char *v2;

  if (bootstrap_check_in(bootstrap_port, "com.apple.MobileFileIntegrity", sp))
  {
    v1 = __error();
    v2 = strerror(*v1);
    syslog(3, "unable to checkin with launchd: %s", v2);
  }
}

void sub_100007464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  mach_msg_header_t *msg;
  uint64_t v8;

  v6 = (void *)os_transaction_create("amfid mig server");
  v8 = a1;
  if (a2 == 2 && (dispatch_mach_mig_demux(0, &v8, 1, a3) & 1) == 0)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg(a3, 0);
    mach_msg_destroy(msg);
  }
  if (v6)
    os_release(v6);
}

void sub_100007508(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

char *sub_100007544(int *a1)
{
  return strerror(*a1);
}

int *sub_10000754C()
{
  return __error();
}

int *sub_100007554@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
  return __error();
}

void sub_10000755C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100008DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008E18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100008E28(uint64_t a1)
{

}

void sub_100008E30(uint64_t a1)
{
  id v1;

  sub_100004F60(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v1, "removeItemAtPath:error:", CFSTR("/private/var/db/amfid/UPPCommitting.plist"), 0);

}

void sub_100009194(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1000091BC()
{
  int v0;
  NSObject *v1;
  _BOOL4 v2;
  dispatch_queue_global_t global_queue;
  NSObject *v4;
  _DWORD v5[4];
  _OWORD v6[3];
  char v7;

  v7 = 0;
  memset(v6, 0, sizeof(v6));
  AMFIGetSEPDeviceState(v6);
  v0 = v6[0];
  v1 = off_100028EF0;
  v2 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      v5[0] = 67109120;
      v5[1] = v6[0];
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SEP init-state already ratched: %u", (uint8_t *)v5, 8u);
    }
  }
  else
  {
    if (v2)
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "initiating SEP init-state ratcheting", (uint8_t *)v5, 2u);
    }
    global_queue = dispatch_get_global_queue(33, 0);
    v4 = objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v4, &stru_100025090);

  }
}

void sub_1000092D0(id a1)
{
  NSObject *v1;
  NSObject *v2;
  dispatch_semaphore_t v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  void **v18;
  NSObject *v19;
  NSObject *v20;
  void **v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, int);
  void *v24;
  NSObject *v25;
  int out_token;
  uint8_t v27[4];
  unint64_t v28;
  uint8_t buf[16];
  __int128 v30;
  _BYTE v31[116];

  v1 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "initiating data migration procedure -- skipped on darwinOS", buf, 2u);
  }
  if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0)
    DMPerformMigrationIfNeeded();
  v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initiating setup assistant procedure -- skipped on darwinOS", buf, 2u);
  }
  if ((os_variant_is_darwinos("com.apple.amfid") & 1) == 0)
  {
    v3 = dispatch_semaphore_create(0);
    out_token = -1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier"));
    *(_QWORD *)buf = _NSConcreteStackBlock;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&v30 = sub_100009700;
    *((_QWORD *)&v30 + 1) = &unk_1000250B8;
    v5 = v3;
    *(_QWORD *)v31 = v5;
    objc_msgSend(v4, "addStateChangeObserver:", buf);

    v6 = (const char *)objc_msgSend(objc_retainAutorelease(BYSetupAssistantFinishedDarwinNotification), "UTF8String");
    global_queue = dispatch_get_global_queue(33, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v21 = _NSConcreteStackBlock;
    v22 = 3221225472;
    v23 = sub_1000097D0;
    v24 = &unk_1000250E0;
    v9 = v5;
    v25 = v9;
    notify_register_dispatch(v6, &out_token, v8, &v21);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier", v21, v22, v23, v24));
    v11 = (unint64_t)objc_msgSend(v10, "currentState");

    v12 = off_100028EF0;
    v13 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      if (v13)
      {
        *(_DWORD *)v27 = 134217984;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "setup assistant already in finished state: %lu", v27, 0xCu);
      }
    }
    else
    {
      if (v13)
      {
        *(_DWORD *)v27 = 134217984;
        v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "waiting for setup assistant to complete: %lu", v27, 0xCu);
      }
      dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    }
    v14 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setup assistant has finished running", v27, 2u);
    }

  }
  memset(v31, 170, sizeof(v31));
  *(_OWORD *)buf = xmmword_10001DB80;
  v30 = unk_10001DB90;
  v15 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 148));
    v21 = 0;
    v17 = objc_msgSend(v15, "exchangeData:forKey:error:", v16, 13, &v21);
    v18 = v21;

    v19 = off_100028EF0;
    if (v18)
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001A83C((uint64_t)v18, v19);

    }
    else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v27 = 67109120;
      LODWORD(v28) = 1;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "successfully ratched the SEP init-state: %u", v27, 8u);
    }
  }
  else
  {
    v20 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A7FC(v20);
  }

}

void sub_100009700(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = a2;
    v9 = 2048;
    v10 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "detected setup assistant transition: %lu -> %lu", (uint8_t *)&v7, 0x16u);
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_1000097D0(uint64_t a1, int a2)
{
  NSObject *v4;
  uint8_t v6[16];

  v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "detected setup assistant completion through darwin notification", v6, 2u);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  return notify_cancel(a2);
}

uint64_t sub_100009854(void *a1)
{
  uint64_t v1;
  uint64_t (**v2)(_QWORD);
  const __CFDictionary *v3;
  uint64_t MatchingService;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_connect_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  io_connect_t connect;

  v1 = 3758097084;
  v2 = a1;
  connect = 0;
  v3 = IOServiceMatching("AppleMobileFileIntegrity");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
  v5 = MatchingService;
  if ((_DWORD)MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      v6 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001A924(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    v14 = connect;
    if (connect)
    {
      v1 = v2[2](v2);
      v14 = connect;
    }
  }
  else
  {
    v15 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001A8B0(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = 0;
  }
  sub_100009960(v5, v14);

  return v1;
}

uint64_t sub_100009960(uint64_t object, io_connect_t connect)
{
  io_object_t v2;

  v2 = object;
  if (connect)
    object = IOServiceClose(connect);
  if (v2)
    return IOObjectRelease(v2);
  return object;
}

id sub_10000999C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const void *Unique;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/PreferenceBundles/SecuritySettings.bundle")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PreferenceBundles/SecuritySettings.bundle")));
  Unique = (const void *)_CFBundleCreateUnique(kCFAllocatorDefault, v2);
  v5 = (void *)CFPreferencesCopyValue(CFSTR("AppleLanguages"), kCFPreferencesAnyApplication, CFSTR("mobile"), kCFPreferencesAnyHost);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v6, v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  v9 = (void *)CFBundleCopyLocalizedStringForLocalization(Unique, v1, 0, 0, v8);
  if (Unique)
    CFRelease(Unique);

  return v9;
}

void sub_100009AD4(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

BOOL sub_100009AF0()
{
  nullsub_2();
  return !sub_10000DD14();
}

id sub_100009B0C()
{
  void *v0;
  id v1;

  v0 = (void *)MGCopyAnswer(CFSTR("PasswordConfigured"), 0);
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

BOOL sub_100009B48(uint64_t *a1, CFBooleanRef a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  const char *v11;

  if (!a1)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    sub_10001A998();
    return 0;
  }
  if (!a2)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    sub_10001AA18();
    return 0;
  }
  if (!sub_10000E680(a1, a2))
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    sub_10001AD18();
    return 0;
  }
  v4 = sub_10000E660(a1);
  if (sub_10000A6FC(v4, qword_100029540))
  {
    if ((sub_100009E04((int)a1, a2) & 1) == 0)
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      sub_10001AA98();
      return 0;
    }
    return 1;
  }
  v6 = sub_10000E660(a1);
  if (sub_10000A6FC(v6, qword_100029548))
  {
    if (!sub_10000A06C((uint64_t)a1, a2))
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      sub_10001AB18();
      return 0;
    }
    return 1;
  }
  v7 = sub_10000E660(a1);
  if (sub_10000A6FC(v7, qword_100029550))
    sub_10000A134();
  v8 = sub_10000E660(a1);
  if (sub_10000A6FC(v8, qword_100029560))
  {
    if ((a1 != &kOSBooleanTrue_single || kCFBooleanTrue != a2)
      && (a1 != &kOSBooleanFalse_single || kCFBooleanFalse != a2))
    {
      result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (!result)
        return result;
      sub_10001AC18();
      return 0;
    }
    return 1;
  }
  v9 = sub_10000E660(a1);
  if (!sub_10000A6FC(v9, qword_100029568))
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    v10 = 136315138;
    v11 = "BOOL valuesEqual(OSObject *, CFTypeRef)";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Encountered unknown type during %s", (uint8_t *)&v10, 0xCu);
    return 0;
  }
  if (sub_10000A1F0((uint64_t)a1, a2))
    return 1;
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_10001AC98();
    return 0;
  }
  return result;
}

uint64_t sub_100009E04(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t **v3;
  __CFString *v4;
  const __CFBoolean *Value;
  CFIndex Count;
  void **v7;
  CFTypeID v8;
  uint64_t v9;
  uint64_t v11;
  void **keys;
  void **v13;
  uint64_t v14;

  v3 = *(uint64_t ***)(a1 + 32);
  if (!v3)
  {
LABEL_6:
    keys = 0;
    v13 = 0;
    v14 = 0;
    Count = CFDictionaryGetCount(theDict);
    v11 = 0;
    sub_10000A2B4((uint64_t)&keys, Count, &v11);
    CFDictionaryGetKeysAndValues(theDict, (const void **)keys, 0);
    v7 = keys;
    if (keys == v13)
    {
      v9 = 1;
      if (!keys)
        return v9;
    }
    else
    {
      v8 = CFGetTypeID(*keys);
      if (v8 == CFStringGetTypeID())
        sub_10000E77C((const __CFString *)*v7);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10001AE98();
      v9 = 0;
      v7 = keys;
      if (!keys)
        return v9;
    }
    v13 = v7;
    operator delete(v7);
    return v9;
  }
  while (sub_10000E6EC(v3[2]))
  {
    keys = (void **)0xAAAAAAAAAAAAAAAALL;
    v4 = (__CFString *)sub_10000E744((uint64_t)v3[2]);
    keys = &v4->isa;
    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10001AF18();
      goto LABEL_17;
    }
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, v4);
    if (!sub_100009B48(v3[3], Value))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10001AF98();
LABEL_17:
      sub_10000BF24((const void **)&keys);
      return 0;
    }
    sub_10000BF24((const void **)&keys);
    v3 = (uint64_t **)*v3;
    if (!v3)
      goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001B018();
  return 0;
}

void sub_10000A030(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_10000A06C(uint64_t a1, CFArrayRef theArray)
{
  uint64_t v4;
  CFIndex v5;
  const void *ValueAtIndex;
  _BOOL8 result;

  v4 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
  if (CFArrayGetCount(theArray) != v4 >> 3)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    sub_10001B118();
    return 0;
  }
  if (CFArrayGetCount(theArray) < 1)
    return 1;
  v5 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(theArray, v5);
    if ((sub_100009B48(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * v5), ValueAtIndex) & 1) == 0)
      break;
    if (++v5 >= CFArrayGetCount(theArray))
      return 1;
  }
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (result)
  {
    sub_10001B098();
    return 0;
  }
  return result;
}

void sub_10000A134()
{
  operator new[]();
}

BOOL sub_10000A1F0(uint64_t a1, CFNumberRef number)
{
  _BOOL8 result;
  uint64_t valuePtr;

  if (CFNumberIsFloatType(number))
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result)
      return result;
    sub_10001B298();
    return 0;
  }
  if ((unint64_t)CFNumberGetByteSize(number) >= 9)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!(_DWORD)result)
      return result;
    sub_10001B218();
    return 0;
  }
  valuePtr = 0;
  if (CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr))
    return valuePtr == *(_QWORD *)(a1 + 16);
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)result)
  {
    sub_10001B198();
    return 0;
  }
  return result;
}

void sub_10000A2B4(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    sub_10000BF54((void **)a1, a2 - v3, a3);
  }
}

uint64_t sub_10000A2E4(uint64_t a1, char *__s)
{
  _QWORD *v3;
  uint64_t v4;
  _DWORD *v6;

  v6 = (_DWORD *)sub_10000A748(__s);
  v3 = sub_10000BCF8((_QWORD *)(a1 + 16), &v6);
  if (!v3)
    sub_10000B0B8("unordered_map::at: key not found");
  v4 = v3[3];
  sub_10000A3B4(v6);
  return v4;
}

_DWORD *sub_10000A3B4(_DWORD *result)
{
  int v1;
  BOOL v2;
  int v3;

  v1 = result[2];
  if (v1 != -1)
  {
    if (v1 == -2)
      abort();
    v2 = __OFSUB__(v1, 1);
    v3 = v1 - 1;
    result[2] = v3;
    if ((v3 < 0) ^ v2 | (v3 == 0))
    {
      result[2] = -1;
      return (_DWORD *)(*(uint64_t (**)(_DWORD *))(*(_QWORD *)result + 24))(result);
    }
  }
  return result;
}

uint64_t sub_10000A400(uint64_t a1, uint64_t a2)
{
  CFDataRef v3;
  CFPropertyListRef v4;
  CFTypeID v5;
  uint64_t v6;
  CFTypeRef v8;
  CFTypeRef cf;
  CFDataRef v10;

  v3 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)a2, *(_QWORD *)(a2 + 8), kCFAllocatorNull);
  v10 = v3;
  if (v3)
  {
    v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, v3, 0, 0, 0);
    cf = v4;
    if (v4 && (v5 = CFGetTypeID(v4), v5 == CFDictionaryGetTypeID()))
    {
      CFRetain(cf);
      v8 = cf;
      v6 = sub_100009E04(a1, (CFDictionaryRef)cf);
      sub_10000C114(&v8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10001B398();
      v6 = 0;
    }
    sub_10000C0E4(&cf);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001B318();
    v6 = 0;
  }
  sub_10000C0B4((const void **)&v10);
  return v6;
}

void sub_10000A508(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v3;
  va_list va;
  const void *v5;
  va_list va1;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, const void *);
  va_copy(va2, va1);
  v5 = va_arg(va2, const void *);
  sub_10000C114((const void **)va);
  sub_10000C0E4((const void **)va1);
  sub_10000C0B4((const void **)va2);
  _Unwind_Resume(a1);
}

void sub_10000A544()
{
  uint64_t i;

  for (i = qword_1000295D0; i; i = *(_QWORD *)i)
    sub_10000A3B4(*(_DWORD **)(i + 40));
  sub_10000BDE4((uint64_t)&OSSymbol::symbols);
}

uint64_t sub_10000A584(uint64_t a1, unint64_t a2)
{
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  OSString *v7;
  int v8;
  OSMetaClass **p_meta;
  OSString *v11;
  void *__p[3];
  __int128 buf;

  v2 = a2 - 8;
  if (a2 < 8)
    return 1;
  v4 = a1 + 8;
  memset(__p, 170, sizeof(__p));
  sub_10000BE7C(__p, (void *)(a1 + 8), v2);
  v11 = 0;
  v5 = parseEntitlements((const char *)__p, &v11);
  v6 = (_DWORD *)v5;
  v7 = v11;
  if (!v5 || v11)
  {
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        p_meta = &v7->meta;
        if (SHIBYTE(v7->lvars) < 0)
          p_meta = (OSMetaClass **)*p_meta;
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = p_meta;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "AMFIUnserializeXML failed: %s", (uint8_t *)&buf, 0xCu);
        v7 = v11;
      }
      sub_10000A3B4(v7);
    }
    v3 = 0;
  }
  else
  {
    *(_QWORD *)&buf = v4;
    *((_QWORD *)&buf + 1) = v2;
    v8 = sub_10000A400(v5, (uint64_t)&buf);
    sub_10000A3B4(v6);
    v3 = v8 ^ 1u;
  }
  if (SHIBYTE(__p[2]) < 0)
    operator delete(__p[0]);
  return v3;
}

void sub_10000A6D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_10000A6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

uint64_t sub_10000A748(char *__s)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  uint64_t v5;
  void *__p[2];
  char v8;

  sub_10000AF58(__p, __s);
  v2 = sub_10000A90C(&OSSymbol::symbols, (unsigned __int8 *)__p);
  v3 = v2;
  if ((v8 & 0x80000000) == 0)
  {
    if (v2)
      goto LABEL_3;
LABEL_8:
    operator new();
  }
  operator delete(__p[0]);
  if (!v3)
    goto LABEL_8;
LABEL_3:
  sub_10000AF58(__p, __s);
  v4 = sub_10000B108(&OSSymbol::symbols, (unsigned __int8 *)__p);
  if (!v4)
    sub_10000B0B8("unordered_map::at: key not found");
  v5 = *((_QWORD *)v4 + 5);
  if (v8 < 0)
    operator delete(__p[0]);
  sub_10000A8D4(v5);
  return v5;
}

void sub_10000A880(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000A8C4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t sub_10000A8D4(uint64_t result)
{
  int v1;

  v1 = *(_DWORD *)(result + 8);
  if (v1 != -1)
  {
    if (v1 <= 0)
      abort();
    *(_DWORD *)(result + 8) = v1 + 1;
  }
  return result;
}

unsigned __int8 *sub_10000A90C(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = sub_10000AA0C((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((sub_10000AEB4(v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t sub_10000AA0C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return sub_10000AA48((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t sub_10000AA48(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
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
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return sub_10000ADF4(a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return sub_10000AD48(a2, a3);
  }
  else
  {
    return sub_10000AC50(a2, a3);
  }
}

unint64_t sub_10000AC50(_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t sub_10000AD48(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_10000ADF4(_QWORD *a1, uint64_t a2)
{
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
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_10000AEB4(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

_QWORD *sub_10000AF58(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000B008();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_10000B008()
{
  sub_10000B01C("basic_string");
}

void sub_10000B01C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000B06C(exception, a1);
}

void sub_10000B058(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000B06C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10000B090()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_10000B0B8(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000B208(exception, a1);
}

void sub_10000B0F4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000B108(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = sub_10000AA0C((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((sub_10000AEB4(v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::logic_error *sub_10000B208(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

uint64_t sub_10000B22C(uint64_t a1, char *a2)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  *(_DWORD *)(a1 + 8) = 1;
  *(_QWORD *)a1 = off_100025180;
  *(_QWORD *)(a1 + 16) = 0;
  v3 = a1 + 16;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  if (a2)
  {
    sub_10000AF58(&v5, a2);
    if (*(char *)(a1 + 39) < 0)
      operator delete(*(void **)v3);
    *(_OWORD *)v3 = v5;
    *(_QWORD *)(v3 + 16) = v6;
  }
  return a1;
}

void sub_10000B2A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 39) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B2C4(uint64_t a1)
{
  *(_QWORD *)a1 = off_100025180;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

void sub_10000B300(uint64_t a1)
{
  *(_QWORD *)a1 = off_100025180;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  operator delete();
}

_QWORD *sub_10000B34C(uint64_t a1, int a2)
{
  int v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  v4 = sub_10000B484(&std::cout, (uint64_t)"OSString(", 9);
  v7 = *(_QWORD *)(a1 + 16);
  v6 = a1 + 16;
  v5 = v7;
  v8 = *(char *)(v6 + 23);
  if (v8 >= 0)
    v9 = v6;
  else
    v9 = v5;
  if (v8 >= 0)
    v10 = *(unsigned __int8 *)(v6 + 23);
  else
    v10 = *(_QWORD *)(v6 + 8);
  v11 = sub_10000B484(v4, v9, v10);
  return sub_10000B484(v11, (uint64_t)")\n", 2);
}

uint64_t sub_10000B3E8(_DWORD *a1)
{
  a1[2] = -2;
  return (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t sub_10000B3FC(uint64_t a1)
{
  *(_QWORD *)a1 = off_100025180;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  return a1;
}

void sub_10000B438(uint64_t a1)
{
  *(_QWORD *)a1 = off_100025180;
  if (*(char *)(a1 + 39) < 0)
    operator delete(*(void **)(a1 + 16));
  operator delete();
}

_QWORD *sub_10000B484(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  std::ostream::sentry::sentry(v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_10000B5F0(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_10000B594(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x10000B574);
}

void sub_10000B5DC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_10000B5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[3];

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      memset(__p, 170, sizeof(__p));
      sub_10000B738(__p, v12, __c);
      v13 = SHIBYTE(__p[2]) >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_10000B71C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000B738(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_10000B008();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_10000B7E0(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  void **v14;
  void *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;

  v7 = (_QWORD *)(a1 + 24);
  v8 = sub_10000AA0C(a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v13 = v8;
      if (v8 >= v10)
        v13 = v8 % v10;
    }
    else
    {
      v13 = (v10 - 1) & v8;
    }
    v14 = *(void ***)(*(_QWORD *)a1 + 8 * v13);
    if (v14)
    {
      for (i = *v14; i; i = *(void **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v9)
        {
          if ((sub_10000AEB4(a1 + 32, (unsigned __int8 *)i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10)
              v16 %= v10;
          }
          else
          {
            v16 &= v10 - 1;
          }
          if (v16 != v13)
            break;
        }
      }
    }
  }
  else
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
  }
  v17 = (_QWORD *)(a1 + 16);
  i = operator new(0x30uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v9;
  v18 = *a4;
  v19 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  *((_QWORD *)i + 5) = 0;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v10 || (float)(v21 * (float)v10) < v20)
  {
    v22 = 1;
    if (v10 >= 3)
      v22 = (v10 & (v10 - 1)) != 0;
    v23 = v22 | (2 * v10);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    sub_10000BA78(a1, v25);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v13 = v9 % v10;
      else
        v13 = v9;
    }
    else
    {
      v13 = (v10 - 1) & v9;
    }
  }
  v26 = *(_QWORD *)a1;
  v27 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v13);
  if (v27)
  {
    *(_QWORD *)i = *v27;
LABEL_38:
    *v27 = i;
    goto LABEL_39;
  }
  *(_QWORD *)i = *v17;
  *v17 = i;
  *(_QWORD *)(v26 + 8 * v13) = v17;
  if (*(_QWORD *)i)
  {
    v28 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v28 >= v10)
        v28 %= v10;
    }
    else
    {
      v28 &= v10 - 1;
    }
    v27 = (_QWORD *)(*(_QWORD *)a1 + 8 * v28);
    goto LABEL_38;
  }
LABEL_39:
  ++*v7;
  return i;
}

void sub_10000BA5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  sub_10000BCAC(v11, v10);
  _Unwind_Resume(a1);
}

void sub_10000BA78(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_10000BB54(a1, prime);
  }
}

void sub_10000BB54(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_10000B090();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_10000BCAC(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

_QWORD *sub_10000BCF8(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;
  int8x8_t v5;
  uint8x8_t v6;
  unint64_t v7;
  _QWORD *i;
  unint64_t v9;
  char v11;

  v4 = sub_10000AA0C((uint64_t)&v11, *a2 + 16);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = (uint8x8_t)vcnt_s8(v5);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] > 1uLL)
  {
    v7 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v7 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v7 = (*(_QWORD *)&v5 - 1) & v4;
  }
  i = *(_QWORD **)(*a1 + 8 * v7);
  if (i)
  {
    for (i = (_QWORD *)*i; i; i = (_QWORD *)*i)
    {
      v9 = i[1];
      if (v9 == v4)
      {
        if (i[2] == *a2)
          return i;
      }
      else
      {
        if (v6.u32[0] > 1uLL)
        {
          if (v9 >= *(_QWORD *)&v5)
            v9 %= *(_QWORD *)&v5;
        }
        else
        {
          v9 &= *(_QWORD *)&v5 - 1;
        }
        if (v9 != v7)
          return 0;
      }
    }
  }
  return i;
}

void sub_10000BDE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_10000BE38(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void sub_10000BE38(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

_QWORD *sub_10000BE7C(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_10000B008();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

const void **sub_10000BF24(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_10000BF54(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      sub_10000C06C();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_10000C080(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v24 = (char *)*a1;
    v23 = (char *)a1[1];
    if (v23 != *a1)
    {
      do
      {
        v25 = *((_QWORD *)v23 - 1);
        v23 -= 8;
        *((_QWORD *)v18 - 1) = v25;
        v18 -= 8;
      }
      while (v23 != v24);
      v23 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void sub_10000C06C()
{
  sub_10000B01C("vector");
}

void *sub_10000C080(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_10000B090();
  return operator new(8 * a2);
}

const void **sub_10000C0B4(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **sub_10000C0E4(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

const void **sub_10000C114(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_10000C144(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000C1D8(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_100029608;
  qword_100029608 = (uint64_t)v1;

}

void sub_10000C280()
{
  xpc_activity_register("com.apple.security.amfid.reportmetrics", XPC_ACTIVITY_CHECK_IN, &stru_1000251C0);
  xpc_activity_register("com.apple.security.amfid.cleanmetrics", XPC_ACTIVITY_CHECK_IN, &stru_1000251E0);
}

void sub_10000C2D0(id a1, OS_xpc_object *a2)
{
  id v2;

  if (xpc_activity_get_state(a2) == 2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](MetricsManager, "sharedInstance"));
    objc_msgSend(v2, "report");

  }
}

void sub_10000C320(id a1, OS_xpc_object *a2)
{
  id v2;

  if (xpc_activity_get_state(a2) == 2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](MetricsManager, "sharedInstance"));
    objc_msgSend(v2, "clean");

  }
}

void sub_10000C370(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsManager sharedInstance](MetricsManager, "sharedInstance"));
  objc_msgSend(v8, "recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:", v9, v7, a3, a4);

}

id sub_10000C414()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[8];
  _QWORD v11[8];

  v10[0] = kCFUserNotificationAlertHeaderKey;
  v0 = sub_10000999C(CFSTR("DEV_MODE_ALERT_TITLE"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v11[0] = v1;
  v10[1] = kCFUserNotificationAlertMessageKey;
  v2 = sub_10000999C(CFSTR("DEV_MODE_ALERT_BODY"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v11[1] = v3;
  v10[2] = kCFUserNotificationDefaultButtonTitleKey;
  v4 = sub_10000999C(CFSTR("CANCEL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v11[2] = v5;
  v10[3] = kCFUserNotificationAlternateButtonTitleKey;
  v6 = sub_10000999C(CFSTR("DEV_MODE_ALERT_ENABLE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v11[3] = v7;
  v11[4] = &__kCFBooleanTrue;
  v10[4] = SBUserNotificationDontDismissOnUnlock;
  v10[5] = SBUserNotificationDismissOnLock;
  v11[5] = &__kCFBooleanFalse;
  v11[6] = &__kCFBooleanFalse;
  v10[6] = SBUserNotificationBehavesSuperModally;
  v10[7] = SBUserNotificationAlternateButtonPresentationStyleKey;
  v11[7] = &off_1000261D8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 8));

  return v8;
}

void sub_10000C59C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char isKindOfClass;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;

  v3 = a2;
  v32 = 0;
  v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v36 = "handleLockdownXPC";
    v37 = 2112;
    v38 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s: new connection: %@", buf, 0x16u);
  }
  v5 = kAMFILockdownErrKey;
  v33 = kAMFILockdownErrKey;
  v34 = kAMFILockdownErrUnknown;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6));

  if (lockdown_receive_message(a1, &v32))
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B5B0();
    v8 = 0;
  }
  else
  {
    v8 = v32;
    v9 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("action")));
      v11 = objc_msgSend(v10, "longValue");

      v12 = off_100028EF0;
      if ((unint64_t)v11 < 5)
      {
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v36 = "handleLockdownXPC";
          v37 = 2048;
          v38 = v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s: requested lockdown action: %lu", buf, 0x16u);
        }
        v13 = ((uint64_t (*)(void *))*(&off_100025200 + (_QWORD)v11))(v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v14));

        v7 = (void *)v15;
      }
      else if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      {
        sub_10001B52C((uint64_t)v11, v12);
      }
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", kAMFILockdownErrNotADict, v5);
    }
  }
  v16 = v3;
  v17 = v7;
  if (v16)
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", kLockdownCheckinClientNameKey));
  else
    v18 = 0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", v5));

  if (v19)
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B4A4();
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v5));
    v21 = objc_opt_class(NSError);
    isKindOfClass = objc_opt_isKindOfClass(v20, v21);

    if ((isKindOfClass & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v5));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v5));
      v31 = v5;
      v26 = v18;
      v27 = a1;
      v28 = v8;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userInfo"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%@)"), v24, v29));

      v8 = v28;
      a1 = v27;
      v18 = v26;

      objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, v31);
    }
  }
  if (lockdown_send_message(a1, v17, 100)
    && os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
  {
    sub_10001B418();
  }
  lockdown_disconnect(a1);

}

void sub_10000C9F4()
{
  NSObject *v0;
  const char *v1;
  uint64_t v2;
  void *v3;
  int v4;
  const char *v5;

  if (os_variant_is_darwinos("com.apple.amfid"))
  {
    v0 = off_100028EF0;
    if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
      return;
    v4 = 136315138;
    v5 = "setupLockdownInterface";
    v1 = "%s: lockdown interface not supported on darwinOS";
  }
  else
  {
    v2 = sub_100005F14();
    v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
    lockdown_checkin_xpc("com.apple.amfi.lockdown", 0, v3, &stru_100025248);

    v0 = off_100028EF0;
    if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
      return;
    v4 = 136315138;
    v5 = "setupLockdownInterface";
    v1 = "%s: lockdown interface setup";
  }
  _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, v1, (uint8_t *)&v4, 0xCu);
}

void sub_10000CB1C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  sub_10000C59C((uint64_t)a2, a3);
}

id sub_10000CB28()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  NSFileAttributeKey v10;
  void *v11;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", 1));
  v1 = AMFIShowOverridePath;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v7, 8));
  v10 = NSFilePosixPermissions;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", 292));
  v11 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  LODWORD(v1) = objc_msgSend(v0, "createFileAtPath:contents:attributes:", v1, v2, v4);

  v8 = CFSTR("success");
  v5 = &__kCFBooleanFalse;
  if ((_DWORD)v1)
    v5 = &__kCFBooleanTrue;
  v9 = v5;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
}

id sub_10000CC7C()
{
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  NSObject *v5;
  uint32_t v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  if (sub_100009B0C())
  {
    v16 = kAMFILockdownErrKey;
    v17 = kAMFILockdownErrHasPasscode;
    return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1));
  }
  v1 = AMFIArmSecurityBootMode(1);
  v2 = off_100028EF0;
  v3 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO);
  if (v1)
  {
    if (v3)
    {
      *(_DWORD *)buf = 136315394;
      v13 = "__lockdownActionArmAndReboot";
      v14 = 1024;
      v15 = v1;
      v4 = "%s: failed to arm security boot mode: %u";
      v5 = v2;
      v6 = 18;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v4, buf, v6);
    }
  }
  else if (v3)
  {
    *(_DWORD *)buf = 136315138;
    v13 = "__lockdownActionArmAndReboot";
    v4 = "%s: armed security boot mode";
    v5 = v2;
    v6 = 12;
    goto LABEL_8;
  }
  v7 = dispatch_time(0, 1000000000);
  dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, &stru_100025268);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v1 == 0, CFSTR("success")));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  return v9;
}

_UNKNOWN **sub_10000CE44()
{
  uint64_t *v0;
  uint64_t *v1;
  UNMutableNotificationContent *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v15 = 0;
  if (sub_100009B0C())
  {
    v20 = kAMFILockdownErrKey;
    v21 = kAMFILockdownErrHasPasscode;
    v0 = &v21;
    v1 = &v20;
  }
  else
  {
    AMFIGetSecurityBootMode(&v15);
    if (v15 == 1)
    {
      sub_100005514();
      if (amfi_developer_mode_status())
      {
        v2 = objc_opt_new(UNMutableNotificationContent);
        v3 = objc_msgSend(objc_alloc((Class)UNUserNotificationCenter), "initWithBundleIdentifier:", CFSTR("com.apple.amfi.usernotifications"));
        v4 = sub_10000999C(CFSTR("DEV_MODE_NOTIFICATION_TITLE"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
        -[UNMutableNotificationContent setTitle:](v2, "setTitle:", v5);

        v6 = sub_10000999C(CFSTR("DEV_MODE_NOTIFICATION_BODY"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        -[UNMutableNotificationContent setBody:](v2, "setBody:", v7);

        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](UNNotificationSound, "defaultSound"));
        -[UNMutableNotificationContent setSound:](v2, "setSound:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationIcon iconForSystemImageNamed:](UNNotificationIcon, "iconForSystemImageNamed:", CFSTR("checkmark.shield.fill")));
        -[UNMutableNotificationContent setIcon:](v2, "setIcon:", v9);

        -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v2, "setShouldIgnoreDoNotDisturb:", 1);
        -[UNMutableNotificationContent setShouldIgnoreDowntime:](v2, "setShouldIgnoreDowntime:", 1);
        -[UNMutableNotificationContent setShouldHideTime:](v2, "setShouldHideTime:", 1);
        -[UNMutableNotificationContent setShouldHideDate:](v2, "setShouldHideDate:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=Privacy")));
        -[UNMutableNotificationContent setDefaultActionURL:](v2, "setDefaultActionURL:", v10);

        -[UNMutableNotificationContent setShouldSuppressScreenLightUp:](v2, "setShouldSuppressScreenLightUp:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "UUIDString"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:](UNNotificationRequest, "requestWithIdentifier:content:trigger:destinations:", v12, v2, 0, 3));

        objc_msgSend(v3, "addNotificationRequest:withCompletionHandler:", v13, &stru_100025288);
        return &off_100026098;
      }
      v16 = kAMFILockdownErrKey;
      v17 = kAMFILockdownErrUnknown;
      v0 = &v17;
      v1 = &v16;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001B61C();
      v18 = kAMFILockdownErrKey;
      v19 = kAMFILockdownErrUnknown;
      v0 = &v19;
      v1 = &v18;
    }
  }
  return (_UNKNOWN **)(id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v0, v1, 1));
}

id sub_10000D148()
{
  void *v0;
  void *v1;
  _QWORD v3[3];
  _QWORD v4[3];

  v4[0] = &__kCFBooleanTrue;
  v3[0] = CFSTR("success");
  v3[1] = CFSTR("status");
  if (amfi_developer_mode_status())
    v0 = &__kCFBooleanTrue;
  else
    v0 = &__kCFBooleanFalse;
  v4[1] = v0;
  v3[2] = CFSTR("resolved");
  if (amfi_developer_mode_resolved())
    v1 = &__kCFBooleanTrue;
  else
    v1 = &__kCFBooleanFalse;
  v4[2] = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
}

_UNKNOWN **sub_10000D204(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  void *v12;
  void *v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[3];
  char v34;

  v1 = a1;
  v34 = 0;
  memset(v33, 0, sizeof(v33));
  if (sub_100009B0C())
  {
    v2 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B68C(v2, v3, v4, v5, v6, v7, v8, v9);
    v10 = &off_1000260C0;
  }
  else if (AMFIGetSEPDeviceState(v33))
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B84C();
    v10 = &off_1000260E8;
  }
  else if (LODWORD(v33[0]))
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B7DC();
    v10 = &off_100026110;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("input_profile_uuid")));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("input_profile_uuid")));
      v14 = objc_opt_class(NSString);
      isKindOfClass = objc_opt_isKindOfClass(v13, v14);

      if ((isKindOfClass & 1) != 0)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("input_profile_uuid")));
        if (sub_10000E094(v16))
          v10 = &off_100026188;
        else
          v10 = &off_1000261B0;

      }
      else
      {
        v25 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_10001B76C(v25, v26, v27, v28, v29, v30, v31, v32);
        v10 = &off_100026160;
      }
    }
    else
    {
      v17 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
        sub_10001B6FC(v17, v18, v19, v20, v21, v22, v23, v24);
      v10 = &off_100026138;
    }
  }

  return v10;
}

void sub_10000D438(id a1)
{
  reboot3(0);
}

void sub_10000D440(id a1, NSError *a2)
{
  NSError *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    v3 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001B8B8((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }

}

void sub_10000D5C8()
{
  AMFIDelegate *v0;
  void *v1;
  id v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;

  v0 = objc_alloc_init(AMFIDelegate);
  v1 = (void *)qword_100029530;
  qword_100029530 = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.amfi.nsxpc"));
  v3 = (void *)qword_100029538;
  qword_100029538 = (uint64_t)v2;

  objc_msgSend((id)qword_100029538, "setDelegate:", qword_100029530);
  objc_msgSend((id)qword_100029538, "resume");
  v4 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "setupNSXPCInterface";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: NSXPC interface setup successfully", (uint8_t *)&v5, 0xCu);
  }
}

BOOL amfi_developer_mode_status()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v3, 0, 0) && v2 == 1;
}

BOOL amfi_developer_mode_resolved()
{
  uint64_t v2;
  size_t v3;

  v2 = 0;
  v3 = 8;
  return !sysctlbyname("security.mac.amfi.developer_mode_resolved", &v2, &v3, 0, 0) && v2 == 1;
}

void sub_10000D75C()
{
  _BOOL4 v0;
  int v1;
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  unsigned int v7;
  NSObject *v8;
  _OWORD v9[3];
  char v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  unsigned int v14;
  __int16 v15;
  int v16;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v0 = sub_10000E568();
  AMFIGetSEPDeviceState(v9);
  v1 = v9[0];
  v2 = off_100028EF0;
  v3 = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_DWORD *)buf = 67109120;
      v12 = v9[0];
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "skipping AMFI migration: %u", buf, 8u);
    }
  }
  else
  {
    if (v3)
    {
      *(_DWORD *)buf = 67109120;
      v12 = v0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "initiating AMFI migration | TXM: %u", buf, 8u);
    }
    v4 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "initiating MIS migration", buf, 2u);
    }
    MISDataMigrate(&off_1000261F0);
    if (v0)
    {
      MISEnumerateTrustedUPPs(&stru_1000252C8);
    }
    else
    {
      v5 = off_100028EF0;
      if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "skipping auxiliary signatures for non-TXM system", buf, 2u);
      }
    }
    v6 = MGGetBoolAnswer(CFSTR("StoreDemoMode"));
    v7 = MGGetBoolAnswer(CFSTR("PressDemoMode"));
    v8 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109632;
      v12 = v6;
      v13 = 1024;
      v14 = v7;
      v15 = 1024;
      v16 = v6 | v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initiating demo state migration: %u | %u | %u", buf, 0x14u);
    }
    AMFIDemoModeSetState(v6 | v7);
  }
}

void sub_10000D990(id a1, __CFString *a2)
{
  const char *CStringPtr;
  int v4;
  NSObject *v5;
  const __CFString *TeamIdentifier;
  __CFString *v7;
  const char *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  CFTypeRef cf;
  id v21;
  uint8_t buf[4];
  _BYTE v23[140];
  unsigned int v24;

  cf = 0;
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  if (!CStringPtr)
    __assert_rtn("__misMigrate_block_invoke", "Migrator.m", 98, "uuidStr != NULL");
  v4 = MISCopyProvisioningProfile(a2, &cf);
  if (v4)
  {
    v5 = off_100028EF0;
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001BA0C((uint64_t)CStringPtr, v4, v5);
    goto LABEL_21;
  }
  if (!MISProfileSupportsAuxiliarySignature(cf))
    goto LABEL_21;
  TeamIdentifier = (const __CFString *)MISProvisioningProfileGetTeamIdentifier(cf);
  v7 = (__CFString *)TeamIdentifier;
  if (TeamIdentifier)
  {
    v8 = CFStringGetCStringPtr(TeamIdentifier, 0x8000100u);
    v9 = (id)MISCopyAuxiliarySignature(v7);
    if (v9)
    {
      v10 = off_100028EF0;
      if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        goto LABEL_21;
      }
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v23 = v8;
      v11 = "misMigrate | %s: existing auxiliary signature";
    }
    else
    {
      v13 = v7;
      memset(v23, 0, sizeof(v23));
      *(_DWORD *)buf = 2;
      *(_QWORD *)&v23[4] = 0x100000005;
      v24 = -[__CFString lengthOfBytesUsingEncoding:](v13, "lengthOfBytesUsingEncoding:", 4);
      v14 = objc_retainAutorelease(v13);
      __memcpy_chk(&v23[12], -[__CFString UTF8String](v14, "UTF8String"), -[__CFString lengthOfBytesUsingEncoding:](v14, "lengthOfBytesUsingEncoding:", 4), 132);
      v15 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", buf, 148));
      v21 = 0;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "exchangeData:forKey:error:", v16, 13, &v21));
      v18 = v21;

      if (v18)
      {
        v19 = off_100028EF0;
        if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
          sub_10001B98C((uint64_t)v14, (uint64_t)v18, v19);
        v9 = 0;
      }
      else
      {
        v9 = v17;
      }

      MISSetProfileTrust(a2, v9);
      v10 = off_100028EF0;
      if (!os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v23 = v8;
      v11 = "misMigrate | %s: created auxiliary signature";
    }
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    goto LABEL_20;
  }
  v12 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
    sub_10001B91C((uint64_t)CStringPtr, v12);
LABEL_21:
  if (cf)
    CFRelease(cf);
}

void sub_10000DCD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

BOOL sub_10000DD14()
{
  dispatch_semaphore_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;

  v0 = dispatch_semaphore_create(0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DED8;
  v9[3] = &unk_1000250B8;
  v2 = v0;
  v10 = v2;
  objc_msgSend(v1, "addStateChangeObserver:", v9);

  v3 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "__buddyInRunningState";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: beginning wait for state", buf, 0xCu);
  }
  v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BYSetupStateNotifier sharedNotifier](BYSetupStateNotifier, "sharedNotifier"));
  v6 = objc_msgSend(v5, "currentState");

  v7 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "__buddyInRunningState";
    v13 = 2048;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: buddy state: %lu", buf, 0x16u);
  }

  return v6 == (id)1;
}

void sub_10000DED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  v6 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "__buddyInRunningState_block_invoke";
    v9 = 2048;
    v10 = a2;
    v11 = 2048;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: state transition: %lu to %lu", (uint8_t *)&v7, 0x20u);
  }
  if (a3)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000DFB0()
{
  id v0;
  void *v1;
  int v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = 0u;
  v11 = 0u;
  v10 = 0u;
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v2 = 2;
  DWORD1(v3) = 6;
  v0 = objc_msgSend(objc_alloc((Class)LAStorage), "initWithDomain:authenticationContext:", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v2, 148));
  objc_msgSend(v0, "exchangeData:forKey:completionHandler:", v1, 13, &stru_100025308);

}

uint64_t sub_10000E094(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;

  v1 = a1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = off_100028EF0;
  if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "__trustProfileIdentity";
    v15 = 2112;
    v16 = v1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: adding profile %@ to trustedAppSigners", buf, 0x16u);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E24C;
  v6[3] = &unk_100025330;
  v3 = v1;
  v7 = v3;
  v8 = &v9;
  if (MISEnumerateInstalledProvisioningProfiles(0, v6))
  {
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001BAFC();
  }
  else
  {
    if (*((_BYTE *)v10 + 24))
    {
      v4 = 1;
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR))
      sub_10001BA8C();
  }
  v4 = 0;
LABEL_9:

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_10000E22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10000E24C(uint64_t a1, uint64_t a2)
{
  uint64_t UUID;
  void *v5;
  id v6;
  uint64_t DeveloperCertificates;
  uint64_t v8;
  void *i;
  __SecCertificate *v10;
  __SecCertificate *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  _BOOL8 v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  __CFString *v37;
  _BYTE v38[128];

  UUID = MISProvisioningProfileGetUUID(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(UUID);
  v6 = objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 32));
  if (!v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    DeveloperCertificates = MISProvisioningProfileGetDeveloperCertificates(a2);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(DeveloperCertificates);
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v24)
    {
      v8 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(obj);
          v10 = SecCertificateCreateWithData(0, *(CFDataRef *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i));
          v11 = v10;
          if (v10)
          {
            v12 = (__CFString *)SecCertificateCopySubjectSummary(v10);
            if (v12)
            {
              v13 = off_100028EF0;
              if (os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v35 = "__trustProfileIdentity_block_invoke";
                v36 = 2112;
                v37 = v12;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s: adding identity %@ to trustedAppSigners", buf, 0x16u);
              }
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trustedCodeSigningIdentities"));
              v16 = objc_msgSend(v15, "mutableCopy");

              v27 = 0u;
              v28 = 0u;
              v25 = 0u;
              v26 = 0u;
              v17 = v16;
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v18)
              {
                v19 = *(_QWORD *)v26;
                while (2)
                {
                  for (j = 0; j != v18; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v26 != v19)
                      objc_enumerationMutation(v17);
                    if (!objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)j), "compare:", v12))
                    {

                      goto LABEL_21;
                    }
                  }
                  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                  if (v18)
                    continue;
                  break;
                }
              }

              objc_msgSend(v17, "addObject:", v12);
              objc_msgSend(v14, "setTrustedCodeSigningIdentities:", v17);
LABEL_21:

            }
            CFRelease(v11);
          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v24);
    }

    v6 = 0;
  }
  v21 = v6 != 0;

  return v21;
}

void sub_10000E52C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10000E568()
{
  void *v0;
  _BOOL8 result;
  void *v2;
  size_t v3;
  unsigned int v4;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  v4 = 0;
  v3 = 4;
  if (sysctlbyname("security.codesigning.monitor", &v6, &v5, 0, 0))
  {
    v0 = off_100028EF0;
    result = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_10001BBEC(v0);
  }
  else if (sysctlbyname("security.codesigning.config", &v4, &v3, 0, 0))
  {
    v2 = off_100028EF0;
    result = os_log_type_enabled((os_log_t)off_100028EF0, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_10001BB6C(v2);
  }
  else if (v6 == 2)
  {
    return v4 >> 31;
  }
  return 0;
}

void sub_10000E648(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10000E660(_QWORD *a1)
{
  if (!a1)
    __cxa_bad_typeid();
  return *(_QWORD *)(*a1 - 8);
}

BOOL sub_10000E680(_QWORD *a1, const void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v6;

  if (!a1)
    __cxa_bad_typeid();
  v6 = *(_QWORD *)(*a1 - 8);
  v3 = sub_10000EBCC(qword_100029570, &v6);
  if (!v3)
    sub_10000B0B8("unordered_map::at: key not found");
  v4 = v3[3];
  return v4 == CFGetTypeID(a2);
}

BOOL sub_10000E6EC(_QWORD *a1)
{
  _BOOL8 result;

  if (!a1)
    __cxa_bad_typeid();
  if (sub_10000A6FC(*(_QWORD *)(*a1 - 8), qword_100029550))
    return 1;
  result = sub_10000A6FC(*(_QWORD *)(*a1 - 8), qword_100029558);
  if (result)
    return 1;
  return result;
}

CFStringRef sub_10000E744(uint64_t a1)
{
  const UInt8 *v1;
  CFIndex v2;

  if (*(char *)(a1 + 39) < 0)
  {
    v1 = *(const UInt8 **)(a1 + 16);
    v2 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v1 = (const UInt8 *)(a1 + 16);
    v2 = *(unsigned __int8 *)(a1 + 39);
  }
  return CFStringCreateWithBytes(kCFAllocatorDefault, v1, v2, 0x8000100u, 0);
}

void sub_10000E77C(const __CFString *a1)
{
  CFIndex Length;

  Length = CFStringGetLength(a1);
  if (CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) == -1)
    sub_10000E850();
  operator new[]();
}

void sub_10000E850()
{
  operator new();
}

void sub_10000E894()
{
  operator delete();
}

uint64_t sub_10000E8B8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 16 * a3;
    do
    {
      sub_10000E92C(a1, a2, a2);
      a2 += 2;
      v5 -= 16;
    }
    while (v5);
  }
  return a1;
}

void sub_10000E918(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_10000EB84(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000E92C(uint64_t a1, uint64_t *a2, _OWORD *a3)
{
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD **v14;
  _QWORD *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;

  v6 = *(_QWORD *)(*a2 + 8);
  if ((v6 & 0x8000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)(v6 & 0x7FFFFFFFFFFFFFFFLL);
    v8 = 5381;
    do
    {
      v6 = v8;
      v9 = *v7++;
      v8 = (33 * v8) ^ v9;
    }
    while (v9);
  }
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v13 = v6;
      if (v6 >= v10)
        v13 = v6 % v10;
    }
    else
    {
      v13 = (v10 - 1) & v6;
    }
    v14 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v13);
    if (v14)
    {
      for (i = *v14; i; i = (_QWORD *)*i)
      {
        v16 = i[1];
        if (v16 == v6)
        {
          if (sub_10000A6FC(i[2], *a2))
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v16 >= v10)
              v16 %= v10;
          }
          else
          {
            v16 &= v10 - 1;
          }
          if (v16 != v13)
            break;
        }
      }
    }
  }
  else
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v6;
  *((_OWORD *)i + 1) = *a3;
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v10 || (float)(v18 * (float)v10) < v17)
  {
    v19 = 1;
    if (v10 >= 3)
      v19 = (v10 & (v10 - 1)) != 0;
    v20 = v19 | (2 * v10);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    sub_10000BA78(a1, v22);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v6 >= v10)
        v13 = v6 % v10;
      else
        v13 = v6;
    }
    else
    {
      v13 = (v10 - 1) & v6;
    }
  }
  v23 = *(_QWORD *)a1;
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v13);
  if (v24)
  {
    *i = *v24;
LABEL_41:
    *v24 = i;
    goto LABEL_42;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v23 + 8 * v13) = a1 + 16;
  if (*i)
  {
    v25 = *(_QWORD *)(*i + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v25 >= v10)
        v25 %= v10;
    }
    else
    {
      v25 &= v10 - 1;
    }
    v24 = (_QWORD *)(*(_QWORD *)a1 + 8 * v25);
    goto LABEL_41;
  }
LABEL_42:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_10000EB70(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000EB84(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *sub_10000EBCC(_QWORD *a1, uint64_t *a2)
{
  unint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  unsigned int v6;
  int8x8_t v7;
  uint8x8_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;

  v3 = *(_QWORD *)(*a2 + 8);
  if ((v3 & 0x8000000000000000) != 0)
  {
    v4 = (unsigned __int8 *)(v3 & 0x7FFFFFFFFFFFFFFFLL);
    v5 = 5381;
    do
    {
      v3 = v5;
      v6 = *v4++;
      v5 = (33 * v5) ^ v6;
    }
    while (v6);
  }
  v7 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v7)
    return 0;
  v8 = (uint8x8_t)vcnt_s8(v7);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v8.u32[0];
  if (v8.u32[0] > 1uLL)
  {
    v10 = v3;
    if (v3 >= *(_QWORD *)&v7)
      v10 = v3 % *(_QWORD *)&v7;
  }
  else
  {
    v10 = (*(_QWORD *)&v7 - 1) & v3;
  }
  v11 = *(_QWORD **)(*a1 + 8 * v10);
  if (!v11)
    return 0;
  v12 = (_QWORD *)*v11;
  if (*v11)
  {
    do
    {
      v13 = v12[1];
      if (v3 == v13)
      {
        if (sub_10000A6FC(v12[2], *a2))
          return v12;
      }
      else
      {
        if (v9 > 1)
        {
          if (v13 >= *(_QWORD *)&v7)
            v13 %= *(_QWORD *)&v7;
        }
        else
        {
          v13 &= *(_QWORD *)&v7 - 1;
        }
        if (v13 != v10)
          return 0;
      }
      v12 = (_QWORD *)*v12;
    }
    while (v12);
  }
  return v12;
}

uint64_t sub_10000ECDC()
{
  CFTypeID TypeID;
  CFTypeID v1;
  CFTypeID v2;
  CFTypeID v3;
  CFTypeID v4;
  CFTypeID v5;
  uint64_t v7[12];

  TypeID = CFDictionaryGetTypeID();
  v7[0] = qword_100029540;
  v7[1] = TypeID;
  v1 = CFArrayGetTypeID();
  v7[2] = qword_100029548;
  v7[3] = v1;
  v2 = CFStringGetTypeID();
  v7[4] = qword_100029550;
  v7[5] = v2;
  v3 = CFStringGetTypeID();
  v7[6] = qword_100029558;
  v7[7] = v3;
  v4 = CFBooleanGetTypeID();
  v7[8] = qword_100029560;
  v7[9] = v4;
  v5 = CFNumberGetTypeID();
  v7[10] = qword_100029568;
  v7[11] = v5;
  sub_10000E8B8((uint64_t)&unk_100029570, v7, 6);
  return __cxa_atexit((void (*)(void *))sub_10000E65C, &unk_100029570, (void *)&_mh_execute_header);
}

uint64_t sub_10000EE10(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 1010) >= 0xFFFFFFF6)
    return (uint64_t)*(&off_1000253B0 + 5 * (v1 - 1000) + 5);
  else
    return 0;
}

const char *sub_10000EE44(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v8;
  const char *v9;
  int v10;
  mach_msg_type_number_t v11;
  mach_msg_type_number_t v12;
  NDR_record_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_msg_type_number_t v17;
  int v18;
  mach_msg_type_number_t v19;
  _BYTE v20[20];

  memset(v20, 170, sizeof(v20));
  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_16;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x40)
    goto LABEL_16;
  if (v4 > 0x440)
    goto LABEL_16;
  v5 = *((_DWORD *)result + 9);
  if (v5 > 0x400)
    goto LABEL_16;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 64 < v5 || (_DWORD)v4 != v6 + 64)
    goto LABEL_16;
  v8 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL)
    v8 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 40), 0, v8 - 40);
  if (!result)
  {
LABEL_16:
    v10 = -304;
    goto LABEL_17;
  }
  v18 = -1431655766;
  v16 = -1431655766;
  v9 = &v3[(v4 + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v9 || *((_DWORD *)v9 + 1) <= 0x1Fu)
  {
    v10 = -309;
LABEL_17:
    *(_DWORD *)(a2 + 32) = v10;
LABEL_18:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  *(_DWORD *)(a2 + 52) = *(unsigned __int8 *)(a2 + 52) | 0x1000100;
  v19 = 0;
  v17 = 0;
  result = (const char *)sub_100006B00(*((unsigned int *)v3 + 3), v3 + 40, *(_QWORD *)&v3[v6 + 40], *(_DWORD *)&v3[v6 + 48], *(unsigned int *)&v3[v6 + 52], *(unsigned int *)&v3[v6 + 56], *(unsigned int *)&v3[v6 + 60], (_DWORD *)(a2 + 68), (_DWORD *)(a2 + 72), (_DWORD *)(a2 + 76), (_DWORD *)(a2 + 80), (_DWORD *)(a2 + 84), (_DWORD *)(a2 + 88), a2 + 100, (uint64_t)v20, (vm_offset_t *)(a2 + 28), &v19, &v18, (vm_offset_t *)(a2 + 44),
                           &v17,
                           &v16,
                           (_DWORD *)v9 + 5);
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
    goto LABEL_18;
  }
  v11 = v19;
  *(_BYTE *)(a2 + 36) = v18;
  *(_DWORD *)(a2 + 40) = v11;
  v12 = v17;
  *(_BYTE *)(a2 + 52) = v16;
  *(_DWORD *)(a2 + 56) = v12;
  v13 = NDR_record;
  *(NDR_record_t *)(a2 + 60) = NDR_record;
  result = (const char *)strlen((const char *)(a2 + 100));
  if ((unint64_t)(result + 1) >> 32)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = v13;
  }
  else
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = (_DWORD)result + 1;
    v14 = ((_DWORD)result + 4) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v14 + 128;
    v15 = a2 + v14;
    *(_OWORD *)(v15 + 100) = *(_OWORD *)v20;
    *(_DWORD *)(v15 + 116) = *(_DWORD *)&v20[16];
    *(_DWORD *)(v15 + 120) = v11;
    *(_DWORD *)(v15 + 124) = v12;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 2;
  }
  return result;
}

void sub_10000F0A4(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;

  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    v4 = -304;
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    v4 = -300;
    goto LABEL_10;
  }
  v6 = -1431655766;
  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  v5 = sub_100006900(*(unsigned int *)(a1 + 12), *(_QWORD *)(a1 + 28), *(_DWORD *)(a1 + 40), (vm_offset_t *)(a2 + 28), (mach_msg_type_number_t *)(a2 + 52), &v6, (_DWORD *)(a1 + 76));
  mig_deallocate(*(_QWORD *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(_QWORD *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!v5)
  {
    *(_BYTE *)(a2 + 36) = v6;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = v5;
LABEL_11:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

uint64_t sub_10000F1E8(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  result = sub_100006C44(*(unsigned int *)(result + 12), a2 + 36, (_QWORD *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_8;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 184;
  return result;
}

uint64_t sub_10000F284(uint64_t result, uint64_t a2)
{
  int v3;
  NDR_record_t v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  result = sub_100006F80(*(unsigned int *)(result + 12), a2 + 36, (_QWORD *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  v4 = NDR_record;
  if ((_DWORD)result)
    goto LABEL_8;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 136;
  return result;
}

uint64_t sub_10000F320(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 132)
  {
    v3 = -304;
  }
  else
  {
    if (!*(_DWORD *)(result + 132) && *(_DWORD *)(result + 136) > 0x1Fu)
    {
      result = sub_100006CBC(*(unsigned int *)(result + 12), (const void *)(result + 32), (_QWORD *)(result + 152));
      *(_DWORD *)(a2 + 32) = result;
      goto LABEL_8;
    }
    v3 = -309;
  }
  *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_10000F3A4(_DWORD *result, uint64_t a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  char *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  uint64_t v13;
  char *v14;
  _BYTE *v15;
  size_t v16;
  char *v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  __int128 v22;
  _OWORD v23[2];

  if ((*result & 0x80000000) != 0)
    goto LABEL_26;
  v3 = result;
  v4 = result[1];
  if (v4 < 0x38)
    goto LABEL_26;
  if (v4 > 0x178)
    goto LABEL_26;
  v5 = result[9];
  if (v5 > 0x100)
    goto LABEL_26;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 56 < v5 || v4 < v6 + 56)
    goto LABEL_26;
  v8 = (char *)result + v6;
  v9 = *((_DWORD *)v8 + 11);
  if (v9 > 0x40)
    goto LABEL_26;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v4 - v6;
  if (v11 - 56 < v9 || v11 != v10 + 56)
    goto LABEL_26;
  v13 = 296;
  if (result[1] < 0x128uLL)
    v13 = result[1];
  result = memchr(result + 10, 0, v13 - 40);
  if (result
    && ((v14 = v8 - 256, v15 = v8 + 48, (char *)v3 + v4 - v15 >= 64) ? (v16 = 64) : (v16 = (char *)v3 + v4 - v15),
        (result = memchr(v15, 0, v16)) != 0))
  {
    v17 = (char *)v3 + ((v4 + 3) & 0x1FFFFFFFCLL);
    if (!*(_DWORD *)v17 && *((_DWORD *)v17 + 1) > 0x1Fu)
    {
      v19 = v3[3];
      v20 = v14[v10 + 304];
      v21 = v14[v10 + 308];
      v22 = *(_OWORD *)(v17 + 36);
      v23[0] = *(_OWORD *)(v17 + 20);
      v23[1] = v22;
      result = (_DWORD *)sub_100006850(v19, (uint64_t)(v3 + 10), (uint64_t)v15, v20, v21, v23);
      *(_DWORD *)(a2 + 32) = (_DWORD)result;
      return result;
    }
    v18 = -309;
  }
  else
  {
LABEL_26:
    v18 = -304;
  }
  *(_DWORD *)(a2 + 32) = v18;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_10000F524(unsigned __int8 a1)
{
  return a1 + 1;
}

BOOL sub_10000F530(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void sub_10000F548()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0 + 1);
}

uint64_t sub_10000F578@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_10001317C(*a1);
  *a2 = result;
  return result;
}

void sub_10000F5A0(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t sub_10000F5B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014374();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000F60C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014374();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

Swift::Int sub_10000F65C()
{
  unsigned __int8 *v0;
  uint64_t v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1 + 1);
  return Hasher._finalize()();
}

Swift::Int sub_10000F6A0(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2 + 1);
  return Hasher._finalize()();
}

uint64_t sub_10000F6E0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1000131A0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000F708(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014330();
  return RawRepresentable<>.init(from:)(a1, a2, a3, v6);
}

uint64_t sub_10000F764(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100014330();
  return RawRepresentable<>.encode(to:)(a1, a2, a3, v6);
}

uint64_t sub_10000F7B0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 168))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000F7E0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 176);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t sub_10000F824()
{
  return sub_10000F9F0((uint64_t)&unk_10001DC88);
}

uint64_t sub_10000F830(uint64_t a1, uint64_t a2)
{
  return sub_10000FAD8(a1, a2, (uint64_t)&unk_10001DC88, (uint64_t)sub_1000131F0);
}

void (*sub_10000F844(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1;
  v4 = malloc(0x38uLL);
  *a1 = v4;
  v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[4] = v2;
  v4[5] = v5;
  v4[2] = v2;
  KeyPath = swift_getKeyPath(&unk_10001DC88);
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[6] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 2, KeyPath, v7);
  swift_release(KeyPath);
  v8 = swift_getKeyPath(&unk_10001DC88);
  v9 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(v4 + 2, v8, v9, &protocol witness table for String);
  swift_release(v8);
  v10 = v4[3];
  *v4 = v4[2];
  v4[1] = v10;
  return sub_10000F954;
}

void sub_10000F954(uint64_t **a1, char a2)
{
  sub_10000FD40(a1, a2, (uint64_t)&unk_10001DC88, (uint64_t)sub_100014B90, (uint64_t)sub_100014B90);
}

uint64_t sub_10000F970@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 216))();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_10000F9A0(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);

  v2 = *a1;
  v3 = a1[1];
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(**(_QWORD **)a2 + 224);
  swift_bridgeObjectRetain(v3);
  return v4(v2, v3);
}

uint64_t sub_10000F9E4()
{
  return sub_10000F9F0((uint64_t)&unk_10001DCB0);
}

uint64_t sub_10000F9F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = v1;
  KeyPath = swift_getKeyPath(a1);
  v4 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  v5 = swift_getKeyPath(a1);
  v6 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(&v8, v5, v6, &protocol witness table for String);
  swift_release(v5);
  return v8;
}

uint64_t sub_10000FAC4(uint64_t a1, uint64_t a2)
{
  return sub_10000FAD8(a1, a2, (uint64_t)&unk_10001DCB0, (uint64_t)sub_100013224);
}

uint64_t sub_10000FAD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  KeyPath = swift_getKeyPath(a3);
  v12 = v4;
  v13 = a1;
  v14 = a2;
  v9 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v15, KeyPath, a4, &v11, (char *)&type metadata for () + 8, v9);
  swift_release(KeyPath);
  return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000FB90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t KeyPath;
  uint64_t v7;
  _QWORD v9[2];

  KeyPath = swift_getKeyPath(a4);
  v9[0] = a2;
  v9[1] = a3;
  v7 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, v9, v7, &protocol witness table for String);
  return swift_release(KeyPath);
}

void (*sub_10000FC14(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = v1;
  v4 = malloc(0x38uLL);
  *a1 = v4;
  v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[4] = v2;
  v4[5] = v5;
  v4[2] = v2;
  KeyPath = swift_getKeyPath(&unk_10001DCB0);
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[6] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 2, KeyPath, v7);
  swift_release(KeyPath);
  v8 = swift_getKeyPath(&unk_10001DCB0);
  v9 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(v4 + 2, v8, v9, &protocol witness table for String);
  swift_release(v8);
  v10 = v4[3];
  *v4 = v4[2];
  v4[1] = v10;
  return sub_10000FD24;
}

void sub_10000FD24(uint64_t **a1, char a2)
{
  sub_10000FD40(a1, a2, (uint64_t)&unk_10001DCB0, (uint64_t)sub_100014BA4, (uint64_t)sub_100014BA4);
}

void sub_10000FD40(uint64_t **a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t KeyPath;
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *a1;
  v7 = (*a1)[4];
  v6[2] = v7;
  v9 = *v6;
  v8 = v6[1];
  v10 = v6[6];
  KeyPath = swift_getKeyPath(a3);
  v15 = v7;
  v16 = v9;
  v17 = v8;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain(v8);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v6 + 2, KeyPath, a5, v14, (char *)&type metadata for () + 8, v10);
    swift_bridgeObjectRelease(v8);
    swift_release(KeyPath);
    swift_bridgeObjectRelease(v6[1]);
  }
  else
  {
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v6 + 2, KeyPath, a4, v14, (char *)&type metadata for () + 8, v10);
    swift_bridgeObjectRelease(v8);
    swift_release(KeyPath);
  }
  free(v6);
}

uint64_t sub_10000FE54@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 264))();
  *a2 = result;
  return result;
}

uint64_t sub_10000FE84(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 272))(*a1);
}

uint64_t sub_10000FEB0()
{
  return sub_10001010C((uint64_t)&unk_10001DCD8);
}

uint64_t sub_10000FEBC(uint64_t a1)
{
  return sub_1000101F4(a1, (uint64_t)&unk_10001DCD8, (uint64_t)sub_100013258);
}

void (*sub_10000FED0(_QWORD *a1))(uint64_t **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[2] = v2;
  v4[3] = v5;
  v4[1] = v2;
  KeyPath = swift_getKeyPath(&unk_10001DCD8);
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[4] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 1, KeyPath, v7);
  swift_release(KeyPath);
  v8 = swift_getKeyPath(&unk_10001DCD8);
  v9 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(v4 + 1, v8, v9, &protocol witness table for Int);
  swift_release(v8);
  *v4 = v4[1];
  return sub_10000FFDC;
}

void sub_10000FFDC(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t KeyPath;
  _QWORD v7[6];

  v1 = *a1;
  v2 = **a1;
  v3 = (*a1)[4];
  v4 = (*a1)[2];
  v5 = *a1;
  v5[1] = v4;
  KeyPath = swift_getKeyPath(&unk_10001DCD8);
  v7[2] = v4;
  v7[3] = v2;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v5 + 1, KeyPath, sub_100014B38, v7, (char *)&type metadata for () + 8, v3);
  swift_release(KeyPath);
  free(v1);
}

uint64_t sub_1000100A4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 312))();
  *a2 = result;
  return result;
}

uint64_t sub_1000100D4(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)a2 + 320))(*a1);
}

uint64_t sub_100010100()
{
  return sub_10001010C((uint64_t)&unk_10001DD00);
}

uint64_t sub_10001010C(uint64_t a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = v1;
  KeyPath = swift_getKeyPath(a1);
  v4 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v8, KeyPath, v4);
  swift_release(KeyPath);
  v5 = swift_getKeyPath(a1);
  v6 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(&v8, v5, v6, &protocol witness table for Int);
  swift_release(v5);
  return v8;
}

uint64_t sub_1000101E0(uint64_t a1)
{
  return sub_1000101F4(a1, (uint64_t)&unk_10001DD00, (uint64_t)sub_100013288);
}

uint64_t sub_1000101F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  KeyPath = swift_getKeyPath(a2);
  v10 = v3;
  v11 = a1;
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v12, KeyPath, a3, &v9, (char *)&type metadata for () + 8, v7);
  return swift_release(KeyPath);
}

uint64_t sub_10001029C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a3);
  v7 = a2;
  v5 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, &v7, v5, &protocol witness table for Int);
  return swift_release(KeyPath);
}

void (*sub_100010318(_QWORD *a1))(uint64_t **a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v4 = malloc(0x28uLL);
  *a1 = v4;
  v5 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[2] = v2;
  v4[3] = v5;
  v4[1] = v2;
  KeyPath = swift_getKeyPath(&unk_10001DD00);
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[4] = v7;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4 + 1, KeyPath, v7);
  swift_release(KeyPath);
  v8 = swift_getKeyPath(&unk_10001DD00);
  v9 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.getValue<A>(forKey:)(v4 + 1, v8, v9, &protocol witness table for Int);
  swift_release(v8);
  *v4 = v4[1];
  return sub_100010424;
}

void sub_100010424(uint64_t **a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t KeyPath;
  _QWORD v7[6];

  v1 = *a1;
  v2 = **a1;
  v3 = (*a1)[4];
  v4 = (*a1)[2];
  v5 = *a1;
  v5[1] = v4;
  KeyPath = swift_getKeyPath(&unk_10001DD00);
  v7[2] = v4;
  v7[3] = v2;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v5 + 1, KeyPath, sub_100014B4C, v7, (char *)&type metadata for () + 8, v3);
  swift_release(KeyPath);
  free(v1);
}

uint64_t sub_1000104EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 360))();
}

uint64_t sub_100010514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  type metadata accessor for Date(0);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 368))(v5);
}

uint64_t sub_10001059C@<X0>(_QWORD *a1@<X8>)
{
  return sub_1000107E8((uint64_t)&unk_10001DD28, a1);
}

uint64_t sub_1000105A8(uint64_t a1)
{
  return sub_1000108EC(a1, (uint64_t)&unk_10001DD28, (uint64_t)sub_1000132B8);
}

void (*sub_1000105BC(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = malloc(0x50uLL);
  *a1 = v4;
  v4[3] = v2;
  v5 = type metadata accessor for Date(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v4[6] = malloc(v7);
  v8 = malloc(v7);
  v9 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[7] = v8;
  v4[8] = v9;
  *v4 = v2;
  KeyPath = swift_getKeyPath(&unk_10001DD28);
  v11 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[9] = v11;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v11);
  swift_release(KeyPath);
  v12 = swift_getKeyPath(&unk_10001DD28);
  v13 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v14 = sub_100013DD8(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(v8, v12, v13, v14);
  swift_release(v12);
  return sub_100010710;
}

void sub_100010710(uint64_t a1, char a2)
{
  sub_100010BA8(a1, a2, (uint64_t)&unk_10001DD28, (uint64_t)sub_100014B60, (uint64_t)sub_100014B60);
}

uint64_t sub_10001072C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 408))();
}

uint64_t sub_100010754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  type metadata accessor for Date(0);
  __chkstk_darwin();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 416))(v5);
}

uint64_t sub_1000107DC@<X0>(_QWORD *a1@<X8>)
{
  return sub_1000107E8((uint64_t)&unk_10001DD50, a1);
}

uint64_t sub_1000107E8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v11 = v2;
  KeyPath = swift_getKeyPath(a1);
  v6 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.access<A, B>(_:keyPath:)(&v11, KeyPath, v6);
  swift_release(KeyPath);
  v7 = swift_getKeyPath(a1);
  v8 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v9 = sub_100013DD8(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(a2, v7, v8, v9);
  return swift_release(v7);
}

uint64_t sub_1000108D8(uint64_t a1)
{
  return sub_1000108EC(a1, (uint64_t)&unk_10001DD50, (uint64_t)sub_1000132E8);
}

uint64_t sub_1000108EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  KeyPath = swift_getKeyPath(a2);
  v11 = v3;
  v12 = a1;
  v7 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v13, KeyPath, a3, &v10, (char *)&type metadata for () + 8, v7);
  swift_release(KeyPath);
  v8 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
}

uint64_t sub_1000109B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;

  KeyPath = swift_getKeyPath(a3);
  v5 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v6 = sub_100013DD8(&qword_100029038, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.setValue<A>(forKey:to:)(KeyPath, a2, v5, v6);
  return swift_release(KeyPath);
}

void (*sub_100010A38(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t KeyPath;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = malloc(0x50uLL);
  *a1 = v4;
  v4[3] = v2;
  v5 = type metadata accessor for Date(0);
  v4[4] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[5] = v6;
  v7 = *(_QWORD *)(v6 + 64);
  v4[6] = malloc(v7);
  v8 = malloc(v7);
  v9 = OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v4[7] = v8;
  v4[8] = v9;
  *v4 = v2;
  KeyPath = swift_getKeyPath(&unk_10001DD50);
  v11 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  v4[9] = v11;
  ObservationRegistrar.access<A, B>(_:keyPath:)(v4, KeyPath, v11);
  swift_release(KeyPath);
  v12 = swift_getKeyPath(&unk_10001DD50);
  v13 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v14 = sub_100013DD8(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  PersistentModel.getValue<A>(forKey:)(v8, v12, v13, v14);
  swift_release(v12);
  return sub_100010B8C;
}

void sub_100010B8C(uint64_t a1, char a2)
{
  sub_100010BA8(a1, a2, (uint64_t)&unk_10001DD50, (uint64_t)sub_100014B74, (uint64_t)sub_100014B74);
}

void sub_100010BA8(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  void (*v14)(void *, uint64_t);
  uint64_t v16;
  _BYTE v17[16];
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;

  v6 = *(_QWORD **)a1;
  v22 = *(_QWORD *)(*(_QWORD *)a1 + 72);
  v7 = (void *)v6[7];
  v9 = v6[5];
  v8 = (void *)v6[6];
  v10 = v6[3];
  v11 = v6[4];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v9 + 16))(v6[6], v6[7], v6[4]);
    v6[1] = v10;
    KeyPath = swift_getKeyPath(a3);
    v21 = &v20;
    __chkstk_darwin();
    v18 = v10;
    v19 = v8;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v6 + 1, KeyPath, a5, v17, (char *)&type metadata for () + 8, v22);
    swift_release(KeyPath);
    v14 = *(void (**)(void *, uint64_t))(v9 + 8);
    v14(v8, v11);
    v14(v7, v11);
  }
  else
  {
    v6[2] = v10;
    v16 = swift_getKeyPath(a3);
    v21 = &v20;
    __chkstk_darwin();
    v18 = v10;
    v19 = v7;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(v6 + 2, v16, a4, v17, (char *)&type metadata for () + 8, v22);
    swift_release(v16);
    (*(void (**)(void *, uint64_t))(v9 + 8))(v7, v11);
  }
  free(v7);
  free(v8);
  free(v6);
}

uint64_t sub_100010D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  uint64_t v7;
  uint64_t v15;

  v15 = swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  sub_100010DD4(a1, a2, a3, a4, a5, a6, a7);
  return v15;
}

_QWORD *sub_100010DD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char *a7)
{
  _QWORD *v7;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t KeyPath;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[3];
  uint64_t v53;
  uint64_t v54;

  v48 = a7;
  v45 = a5;
  v46 = a6;
  v43 = a3;
  v44 = a4;
  v10 = type metadata accessor for Date(0);
  v47 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin();
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ConstraintUsage(0);
  v7[5] = sub_100013318(&qword_100029030);
  v49 = v7;
  v14 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v52[0] = v13;
  v52[1] = v13;
  v52[2] = v14;
  v53 = v14;
  v7[6] = swift_getOpaqueTypeConformance2(v52, &opaque type descriptor for <<opaque return type of static PersistentModel.createBackingData<A>()>>, 1);
  sub_100013358(v7 + 2);
  v15 = static PersistentModel.createBackingData<A>()(v13, v13, v14, v14);
  ObservationRegistrar.init()(v15);
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v17 = v53;
  v16 = v54;
  sub_1000133D8(v52, v53);
  KeyPath = swift_getKeyPath(&unk_10001DC88);
  v50 = a1;
  v51 = a2;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(KeyPath, &v50, &type metadata for String, &protocol witness table for String, v17, v16);
  swift_bridgeObjectRelease(a2);
  swift_release(KeyPath);
  sub_1000133FC(v52);
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v19 = v53;
  v20 = v54;
  sub_1000133D8(v52, v53);
  v21 = swift_getKeyPath(&unk_10001DCB0);
  v22 = v44;
  v50 = v43;
  v51 = v44;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v21, &v50, &type metadata for String, &protocol witness table for String, v19, v20);
  swift_bridgeObjectRelease(v22);
  swift_release(v21);
  sub_1000133FC(v52);
  v23 = v45 + 1;
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v24 = v53;
  v25 = v54;
  sub_1000133D8(v52, v53);
  v26 = swift_getKeyPath(&unk_10001DCD8);
  v50 = v23;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v26, &v50, &type metadata for Int, &protocol witness table for Int, v24, v25);
  swift_release(v26);
  sub_1000133FC(v52);
  v27 = v46 + 1;
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v28 = v53;
  v29 = v54;
  sub_1000133D8(v52, v53);
  v30 = swift_getKeyPath(&unk_10001DD00);
  v50 = v27;
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v30, &v50, &type metadata for Int, &protocol witness table for Int, v28, v29);
  swift_release(v30);
  sub_1000133FC(v52);
  v32 = v47;
  v31 = v48;
  (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v12, v48, v10);
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v33 = v53;
  v34 = v54;
  sub_1000133D8(v52, v53);
  v35 = swift_getKeyPath(&unk_10001DD28);
  v36 = sub_100013DD8(&qword_100029038, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v35, v12, v10, v36, v33, v34);
  swift_release(v35);
  v37 = *(void (**)(char *, uint64_t))(v32 + 8);
  v37(v12, v10);
  v38 = sub_1000133FC(v52);
  static Date.distantPast.getter(v38);
  sub_100013394((uint64_t)(v7 + 2), (uint64_t)v52);
  v39 = v53;
  v40 = v54;
  sub_1000133D8(v52, v53);
  v41 = swift_getKeyPath(&unk_10001DD50);
  dispatch thunk of BackingData.setValue<A>(forKey:to:)(v41, v12, v10, v36, v39, v40);
  swift_release(v41);
  v37(v12, v10);
  sub_1000133FC(v52);
  v37(v31, v10);
  return v49;
}

uint64_t sub_1000111E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = v1 + 16;
  swift_beginAccess(v3, v5, 0, 0);
  return sub_100013394(v3, a1);
}

uint64_t sub_100011228(__int128 *a1)
{
  uint64_t v1;
  _QWORD *v3;
  _BYTE v5[24];

  v3 = (_QWORD *)(v1 + 16);
  swift_beginAccess(v3, v5, 33, 0);
  sub_1000133FC(v3);
  sub_10001341C(a1, (uint64_t)v3);
  return swift_endAccess(v5);
}

void (*sub_100011280(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[16] = v1;
  swift_beginAccess(v1 + 16, v3 + 10, 0, 0);
  sub_100013394(v1 + 16, (uint64_t)v3);
  return sub_1000112E8;
}

void sub_1000112E8(uint64_t *a1, char a2)
{
  __int128 *v2;
  __int128 *v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = (__int128 *)*a1;
  v3 = (__int128 *)(*a1 + 40);
  if ((a2 & 1) != 0)
  {
    v4 = (_QWORD *)(*((_QWORD *)v2 + 16) + 16);
    sub_100013394(*a1, (uint64_t)v3);
    swift_beginAccess(v4, (char *)v2 + 104, 33, 0);
    sub_1000133FC(v4);
    sub_10001341C(v3, (uint64_t)v4);
    swift_endAccess((char *)v2 + 104);
    sub_1000133FC(v2);
  }
  else
  {
    v5 = (_QWORD *)(*((_QWORD *)v2 + 16) + 16);
    swift_beginAccess(v5, v3, 33, 0);
    sub_1000133FC(v5);
    sub_10001341C(v2, (uint64_t)v5);
    swift_endAccess(v3);
  }
  free(v2);
}

uint64_t sub_1000113A4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = swift_allocObject(v1, *(unsigned int *)(v1 + 48), *(unsigned __int16 *)(v1 + 52));
  sub_1000113E0(a1);
  return v3;
}

_QWORD *sub_1000113E0(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[5];

  v3 = type metadata accessor for ConstraintUsage(0);
  v1[5] = sub_100013318(&qword_100029030);
  v4 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  v7[0] = v3;
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = v4;
  v1[6] = swift_getOpaqueTypeConformance2(v7, &opaque type descriptor for <<opaque return type of static PersistentModel.createBackingData<A>()>>, 1);
  sub_100013358(v1 + 2);
  v5 = static PersistentModel.createBackingData<A>()(v3, v3, v4, v4);
  ObservationRegistrar.init()(v5);
  sub_100013394((uint64_t)a1, (uint64_t)v7);
  (*(void (**)(_QWORD *))(*v1 + 472))(v7);
  sub_1000133FC(a1);
  return v1;
}

uint64_t sub_1000114DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  return ObservationRegistrar.access<A, B>(_:keyPath:)(&v4, a1, v2);
}

uint64_t sub_100011548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v10;

  v8 = sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)(&v10, a1, a2, a3, a4, v8);
}

uint64_t sub_1000115EC()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  sub_1000133FC(v0 + 2);
  v1 = (char *)v0 + OBJC_IVAR____TtC5amfid15ConstraintUsage___observationRegistrar;
  v2 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_100011644(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ModelConfiguration(0);
  v7 = *(_QWORD **)(v6 - 8);
  v8 = v7[8];
  ((void (*)(void))__chkstk_darwin)();
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = v3;
  v33 = v2;
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v34 = a1;
  v10(v5, a1, v2);
  type metadata accessor for ModelConfiguration.CloudKitDatabase(0);
  v11 = ((uint64_t (*)(void))__chkstk_darwin)();
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static ModelConfiguration.CloudKitDatabase.automatic.getter(v11);
  v14 = ModelConfiguration.init(_:schema:url:allowsSave:cloudKitDatabase:)(0, 0, 0, v5, 1, v13);
  __chkstk_darwin(v14);
  v15 = (void (*)(char *, char *, uint64_t))v7[2];
  v15(v9, v9, v6);
  v16 = type metadata accessor for ModelContainer(0);
  v17 = sub_100013318(&qword_100029040);
  v18 = swift_allocObject(v17, 48, 7);
  v30 = xmmword_10001DC50;
  *(_OWORD *)(v18 + 16) = xmmword_10001DC50;
  v19 = type metadata accessor for ConstraintUsage(0);
  v20 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  *(_QWORD *)(v18 + 32) = v19;
  *(_QWORD *)(v18 + 40) = v20;
  v21 = sub_100013318(&qword_100029048);
  v22 = swift_allocObject(v21, 72, 7);
  *(_OWORD *)(v22 + 16) = v30;
  *(_QWORD *)(v22 + 56) = v6;
  *(_QWORD *)(v22 + 64) = sub_100013DD8(&qword_100029050, (void (*)(uint64_t))&type metadata accessor for ModelConfiguration, (uint64_t)&protocol conformance descriptor for ModelConfiguration);
  v23 = (char *)sub_100013358((_QWORD *)(v22 + 32));
  v15(v23, v9, v6);
  v24 = v31;
  v25 = ModelContainer.__allocating_init(for:configurations:)(v18, v22);
  if (!v24)
  {
    v16 = v25;
    v27 = type metadata accessor for ModelContext(0);
    swift_allocObject(v27, *(unsigned int *)(v27 + 48), *(unsigned __int16 *)(v27 + 52));
    v28 = swift_retain(v16);
    ModelContext.init(_:)(v28);
  }
  v26 = (void (*)(char *, uint64_t))v7[1];
  v26(v9, v6);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v34, v33);
  v26(v9, v6);
  return v16;
}

uint64_t sub_100011918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v9;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v24[4];
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[16];
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char v40;
  _BYTE v41[16];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;

  v28 = a8;
  v29 = a7;
  v9 = a6;
  v25 = a6;
  v15 = sub_100013318(&qword_100029058);
  __chkstk_darwin(v15);
  v17 = &v24[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v27 = sub_100013318(&qword_100029060);
  v26 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27);
  v19 = &v24[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v42 = a1;
  v43 = a2;
  v44 = a3;
  v45 = a4;
  v46 = a5;
  v47 = v9;
  v20 = type metadata accessor for ConstraintUsage(0);
  v48 = v20;
  Predicate.init(_:)(sub_1000136A4, v41, 1, &v48);
  v21 = sub_100013318(&qword_100029068);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 0, 1, v21);
  v22 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  FetchDescriptor.init(predicate:sortBy:)(v17, &_swiftEmptyArrayStorage, v20, v22);
  v31 = v28;
  v32 = a9;
  v33 = v19;
  v34 = v29;
  v35 = a1;
  v36 = a2;
  v37 = a3;
  v38 = a4;
  v39 = a5;
  v40 = v25;
  dispatch thunk of ModelContext.transaction(block:)(sub_1000136B8, v30);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v26 + 8))(v19, v27);
}

uint64_t sub_100011B08@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, int a7@<W6>, _QWORD *a8@<X8>)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t KeyPath;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  _QWORD *v139;
  uint64_t v140;
  void (*v141)(char *, uint64_t);
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;

  v133 = a7;
  LODWORD(v127) = a6;
  v115 = a5;
  v114 = a4;
  v109 = a3;
  v110 = a2;
  v139 = a8;
  v9 = sub_100013318(&qword_100029360);
  v10 = *(_QWORD *)(v9 - 8);
  v134 = v9;
  v135 = v10;
  __chkstk_darwin(v9);
  v130 = (char *)&v97 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100013318(&qword_100029368);
  v13 = *(_QWORD *)(v12 - 8);
  v136 = v12;
  v137 = v13;
  __chkstk_darwin(v12);
  v131 = (char *)&v97 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_100013318(&qword_100029370);
  v140 = *(_QWORD *)(v138 - 8);
  __chkstk_darwin(v138);
  v132 = (char *)&v97 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = sub_100013318(&qword_100029378);
  v121 = *(_QWORD *)(v119 - 8);
  __chkstk_darwin(v119);
  v116 = (char *)&v97 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_100013318(&qword_100029380);
  v124 = *(_QWORD *)(v123 - 8);
  __chkstk_darwin(v123);
  v117 = (char *)&v97 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_100013318(&qword_100029388);
  v122 = *(_QWORD *)(v120 - 8);
  __chkstk_darwin(v120);
  v111 = (char *)&v97 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100013318(&qword_100029390);
  v20 = *(_QWORD *)(v19 - 8);
  v125 = v19;
  v126 = v20;
  __chkstk_darwin(v19);
  v118 = (char *)&v97 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_100013318(&qword_100029398);
  v106 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104);
  v100 = (char *)&v97 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100013318(&qword_1000292F8);
  v24 = *(_QWORD *)(v23 - 8);
  __chkstk_darwin(v23);
  v26 = (char *)&v97 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = sub_100013318(&qword_1000293A0);
  v102 = *(_QWORD *)(v101 - 8);
  __chkstk_darwin(v101);
  v28 = (char *)&v97 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v107 = sub_100013318(&qword_1000293A8);
  v108 = *(_QWORD *)(v107 - 8);
  v29 = __chkstk_darwin(v107);
  v103 = (char *)&v97 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v98 = (char *)&v97 - v31;
  v112 = sub_100013318(&qword_1000293B0);
  v113 = *(_QWORD *)(v112 - 8);
  __chkstk_darwin(v112);
  v105 = (char *)&v97 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_100013318(&qword_1000293B8);
  v34 = *(_QWORD *)(v33 - 8);
  v128 = v33;
  v129 = v34;
  __chkstk_darwin(v33);
  v142 = (char *)&v97 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *a1;
  v37 = sub_100014AEC(&qword_100029308, &qword_1000292F8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  v97 = v36;
  v143 = v37;
  static PredicateExpressions.build_Arg<A>(_:)(v36, v23, v37);
  KeyPath = swift_getKeyPath(&unk_10001DC88);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v26, KeyPath, v23, v37);
  swift_release(KeyPath);
  v141 = *(void (**)(char *, uint64_t))(v24 + 8);
  v141(v26, v23);
  v144 = v110;
  v145 = v109;
  v39 = v100;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for String);
  v40 = sub_100014AEC(&qword_1000293C0, &qword_1000293A0, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v110 = v40;
  v109 = sub_100014AEC(&qword_1000293C8, &qword_100029398, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v41 = v101;
  v42 = v104;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v28, v39, v101, v104, v40, v109, &protocol witness table for String);
  v43 = *(void (**)(char *, uint64_t))(v106 + 8);
  v43(v39, v42);
  v44 = *(void (**)(char *, uint64_t))(v102 + 8);
  v44(v28, v41);
  v45 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v36, v23, v143);
  v46 = swift_getKeyPath(&unk_10001DCB0);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v26, v46, v23, v45);
  swift_release(v46);
  v47 = v23;
  v48 = v141;
  v141(v26, v23);
  v144 = v114;
  v145 = v115;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for String);
  v49 = v103;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v28, v39, v41, v42, v110, v109, &protocol witness table for String);
  v43(v39, v42);
  v44(v28, v41);
  v50 = sub_100014AEC(&qword_1000293D0, &qword_1000293A8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  v51 = v105;
  v52 = v98;
  v53 = v107;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v98, v49, v107, v107, v50, v50);
  v54 = *(void (**)(char *, uint64_t))(v108 + 8);
  v54(v49, v53);
  v54(v52, v53);
  v55 = v26;
  v56 = v97;
  v99 = v47;
  v57 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v97, v47, v143);
  v58 = swift_getKeyPath(&unk_10001DCD8);
  v59 = v111;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v55, v58, v47, v57);
  swift_release(v58);
  v48(v55, v47);
  LOBYTE(v144) = v127;
  v60 = v116;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for ValidationCategory);
  v61 = swift_getKeyPath(&unk_10001E178);
  v62 = sub_100014AEC(&qword_1000293D8, &qword_100029378, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v63 = v117;
  v64 = v119;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v60, v61, v119, v62);
  swift_release(v61);
  (*(void (**)(char *, uint64_t))(v121 + 8))(v60, v64);
  v65 = sub_100014AEC(&qword_1000293E0, &qword_100029388, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v127 = v65;
  v66 = sub_100014AEC(&qword_1000293E8, &qword_100029380, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v67 = v118;
  v68 = v120;
  v69 = v123;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v59, v63, v120, v123, v65, v66, &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v124 + 8))(v63, v69);
  v124 = *(_QWORD *)(v122 + 8);
  ((void (*)(char *, uint64_t))v124)(v59, v68);
  v70 = sub_100014AEC(&qword_1000293F0, &qword_1000293B0, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Conjunction<A, B>);
  v71 = sub_100014AEC(&qword_1000293F8, &qword_100029390, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  v72 = v67;
  v73 = v67;
  v74 = v112;
  v75 = v125;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v51, v73, v112, v125, v70, v71);
  (*(void (**)(char *, uint64_t))(v126 + 8))(v72, v75);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v51, v74);
  v76 = v55;
  v77 = v56;
  v78 = v99;
  v79 = v143;
  static PredicateExpressions.build_Arg<A>(_:)(v77, v99, v143);
  v80 = swift_getKeyPath(&unk_10001DD00);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v76, v80, v78, v79);
  swift_release(v80);
  v141(v76, v78);
  LOBYTE(v144) = v133;
  v81 = v130;
  static PredicateExpressions.build_Arg<A>(_:)(&v144, &type metadata for ConstraintType);
  v82 = swift_getKeyPath(&unk_10001E1A0);
  v83 = sub_100014AEC(&qword_100029400, &qword_100029360, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v84 = v131;
  v85 = v134;
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v81, v82, v134, v83);
  swift_release(v82);
  (*(void (**)(char *, uint64_t))(v135 + 8))(v81, v85);
  v86 = sub_100014AEC(&qword_100029408, &qword_100029368, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v87 = v132;
  v88 = v136;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v59, v84, v68, v136, v127, v86, &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v137 + 8))(v84, v88);
  ((void (*)(char *, uint64_t))v124)(v59, v68);
  v89 = sub_100013318(&qword_100029410);
  v90 = v139;
  v139[3] = v89;
  v90[4] = sub_100014548(&qword_100029418, &qword_100029410, (void (*)(void))sub_100014524, (void (*)(void))sub_100014964);
  sub_100013358(v90);
  v91 = sub_100014AEC(&qword_1000294A0, &qword_1000293B8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Conjunction<A, B>);
  v92 = sub_100014AEC(&qword_1000294A8, &qword_100029370, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Equal<A, B>);
  v93 = v142;
  v94 = v128;
  v95 = v138;
  static PredicateExpressions.build_Conjunction<A, B>(lhs:rhs:)(v142, v87, v128, v138, v91, v92);
  (*(void (**)(char *, uint64_t))(v140 + 8))(v87, v95);
  return (*(uint64_t (**)(char *, uint64_t))(v129 + 8))(v93, v94);
}

unsigned __int8 *sub_100012690@<X0>(unsigned __int8 *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result + 1;
  return result;
}

unint64_t sub_1000126A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, unsigned __int8 a9)
{
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v49 = a8;
  v47 = a6;
  v48 = a7;
  v50 = a4;
  v51 = a5;
  v13 = type metadata accessor for Date(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for ConstraintUsage(0);
  v18 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  result = dispatch thunk of ModelContext.fetch<A>(_:)(a2, v17, v18);
  if (!v9)
  {
    v20 = result;
    v45 = a3;
    v46 = v14;
    v43 = v16;
    v44 = v13;
    v53 = v18;
    v42 = 0;
    v54 = v17;
    v21 = v50;
    if (result >> 62)
    {
LABEL_24:
      if (v20 < 0)
        v39 = v20;
      else
        v39 = v20 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v20);
      v22 = _CocoaArrayWrapper.endIndex.getter(v39);
      swift_bridgeObjectRelease(v20);
    }
    else
    {
      v22 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v23 = v51;
    v24 = v21;
    v25 = v46;
    if (v22)
    {
      v26 = a1;
      v27 = 0;
      v28 = 0;
      v52 = v20 & 0xFFFFFFFFFFFFFF8;
LABEL_6:
      v41 = v27;
      do
      {
        if ((v20 & 0xC000000000000001) != 0)
        {
          v29 = specialized _ArrayBuffer._getElementSlowPath(_:)(v28, v20);
        }
        else
        {
          if (v28 >= *(_QWORD *)(v52 + 16))
            goto LABEL_23;
          v29 = *(_QWORD *)(v20 + 8 * v28 + 32);
          swift_retain(v29);
        }
        v30 = v28 + 1;
        if (__OFADD__(v28, 1))
        {
          __break(1u);
LABEL_23:
          __break(1u);
          goto LABEL_24;
        }
        if (!v28)
        {
          v31 = v43;
          (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v43, v45, v44);
          a1 = v29;
          (*(void (**)(char *))(*(_QWORD *)v29 + 368))(v31);
          swift_release(v29);
          v27 = 1;
          v28 = 1;
          if (v22 != 1)
            goto LABEL_6;
          return swift_bridgeObjectRelease(v20);
        }
        a1 = v26;
        dispatch thunk of ModelContext.delete<A>(_:)(v29, v54, v53);
        swift_release(v29);
        ++v28;
      }
      while (v30 != v22);
      v24 = v21;
      result = swift_bridgeObjectRelease(v20);
      v32 = v49;
      v23 = v51;
      v34 = v44;
      v33 = v45;
      v25 = v46;
      if ((v41 & 1) == 0)
        goto LABEL_20;
    }
    else
    {
      swift_bridgeObjectRelease(v20);
      v34 = v44;
      v33 = v45;
      v32 = v49;
LABEL_20:
      v35 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v43, v33, v34);
      v36 = v54;
      v37 = swift_allocObject(v54, *(unsigned int *)(v54 + 48), *(unsigned __int16 *)(v54 + 52));
      swift_bridgeObjectRetain(v23);
      v38 = v48;
      swift_bridgeObjectRetain(v48);
      sub_100010DD4(v24, v23, v47, v38, v32, a9, v35);
      dispatch thunk of ModelContext.insert<A>(_:)(v37, v36, v53);
      return swift_release(v37);
    }
  }
  return result;
}

uint64_t sub_100012988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[8];

  v6[2] = a4;
  v6[3] = a5;
  v6[4] = a1;
  v6[5] = a2;
  v6[6] = a3;
  return dispatch thunk of ModelContext.transaction(block:)(sub_1000138F8, v6);
}

uint64_t sub_1000129C8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v29 - v13;
  result = sub_1000136F0(a2);
  if (!v4)
  {
    v16 = result;
    v29 = 0;
    result = static Date.now.getter();
    if ((unint64_t)v16 >> 62)
    {
      if (v16 < 0)
        v28 = v16;
      else
        v28 = v16 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(v16);
      v17 = _CocoaArrayWrapper.endIndex.getter(v28);
      result = swift_bridgeObjectRelease(v16);
      if (v17)
        goto LABEL_4;
    }
    else
    {
      v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v17)
      {
LABEL_4:
        if (v17 < 1)
        {
          __break(1u);
          return result;
        }
        v18 = 0;
        v30 = v16 & 0xC000000000000001;
        v31 = v17;
        v37 = a4;
        v35 = a3;
        v36 = v8;
        v33 = v14;
        v34 = v9;
        v32 = v16;
        do
        {
          if (v30)
          {
            v19 = specialized _ArrayBuffer._getElementSlowPath(_:)(v18, v16);
          }
          else
          {
            v19 = *(_QWORD *)(v16 + 8 * v18 + 32);
            swift_retain(v19);
          }
          ++v18;
          v20 = (*(uint64_t (**)(void))(*(_QWORD *)v19 + 168))();
          v22 = v21;
          v23 = (*(uint64_t (**)(void))(*(_QWORD *)v19 + 216))();
          v25 = v24;
          v26 = (*(uint64_t (**)(void))(*(_QWORD *)v19 + 264))();
          v27 = (*(uint64_t (**)(void))(*(_QWORD *)v19 + 312))();
          v35(v20, v22, v23, v25, v26, v27);
          swift_bridgeObjectRelease(v22);
          swift_bridgeObjectRelease(v25);
          v14 = v33;
          v9 = v34;
          v8 = v36;
          (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v12, v33, v36);
          (*(void (**)(char *))(*(_QWORD *)v19 + 416))(v12);
          swift_release(v19);
          v16 = v32;
        }
        while (v31 != v18);
      }
    }
    swift_bridgeObjectRelease(v16);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  return result;
}

uint64_t sub_100012C0C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a2;
  v5 = type metadata accessor for PredicateExpressions.ComparisonOperator(0);
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100013318(&qword_1000292F0);
  v9 = *(_QWORD *)(v8 - 8);
  v34 = v8;
  v35 = v9;
  __chkstk_darwin(v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100013318(&qword_1000292F8);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_100013318(&qword_100029300);
  v33 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *a1;
  v20 = sub_100014AEC(&qword_100029308, &qword_1000292F8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  static PredicateExpressions.build_Arg<A>(_:)(v19, v12, v20);
  KeyPath = swift_getKeyPath(&unk_10001DD28);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v15, KeyPath, v12, v20);
  swift_release(KeyPath);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v22 = type metadata accessor for Date(0);
  static PredicateExpressions.build_Arg<A>(_:)(v32, v22);
  v24 = v30;
  v23 = v31;
  (*(void (**)(char *, _QWORD, uint64_t))(v30 + 104))(v7, enum case for PredicateExpressions.ComparisonOperator.lessThan(_:), v31);
  a3[3] = sub_100013318(&qword_100029310);
  a3[4] = sub_100014404();
  sub_100013358(a3);
  v25 = sub_100014AEC(&qword_100029338, &qword_100029300, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v26 = sub_100014AEC(&qword_100029340, &qword_1000292F0, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v27 = sub_100013DD8(&qword_100029348, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  v28 = v34;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)(v18, v11, v7, v16, v34, v25, v26, v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v23);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v16);
}

uint64_t sub_100012EE0(uint64_t a1, uint64_t a2, double a3)
{
  _QWORD v4[6];

  v4[2] = a1;
  v4[3] = a2;
  *(double *)&v4[4] = a3;
  return dispatch thunk of ModelContext.transaction(block:)(sub_100013B34, v4);
}

uint64_t sub_100012F1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 488))();
}

uint64_t sub_100012F24()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t sub_100012F30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

void (*sub_100012F3C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 480))();
  return sub_100012F88;
}

void sub_100012F88(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

Swift::Int sub_100012FB8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  v0 = type metadata accessor for ConstraintUsage(0);
  v1 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  PersistentModel.hash(into:)(v3, v0, v1);
  return Hasher._finalize()();
}

uint64_t sub_100013028(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_10001DF58);
  return PersistentModel.hash(into:)(a1, a2, WitnessTable);
}

Swift::Int sub_100013070(uint64_t a1, uint64_t a2)
{
  uint64_t WitnessTable;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, a1);
  WitnessTable = swift_getWitnessTable(&unk_10001DF58);
  PersistentModel.hash(into:)(v5, a2, WitnessTable);
  return Hasher._finalize()();
}

uint64_t sub_1000130C8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for ConstraintUsage(0);
  v1 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  return PersistentModel.id.getter(v0, v1);
}

uint64_t sub_100013128(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t WitnessTable;

  v4 = *a1;
  v5 = *a2;
  WitnessTable = swift_getWitnessTable(&unk_10001DF58);
  return static PersistentModel.== infix(_:_:)(v4, v5, a3, WitnessTable) & 1;
}

uint64_t sub_10001317C(unint64_t a1)
{
  if (a1 >= 6)
    return 5;
  else
    return (0x40302010005uLL >> (8 * a1));
}

uint64_t sub_1000131A0(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 0xA)
    return 10;
  else
    return a1 - 1;
}

uint64_t type metadata accessor for ConstraintUsage(uint64_t a1)
{
  uint64_t result;

  result = qword_100029DE0;
  if (!qword_100029DE0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConstraintUsage);
  return result;
}

uint64_t sub_1000131F0()
{
  uint64_t *v0;

  return sub_10000FB90(v0[2], v0[3], v0[4], (uint64_t)&unk_10001DC88);
}

uint64_t sub_100013224()
{
  uint64_t *v0;

  return sub_10000FB90(v0[2], v0[3], v0[4], (uint64_t)&unk_10001DCB0);
}

uint64_t sub_100013258()
{
  uint64_t v0;

  return sub_10001029C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_10001DCD8);
}

uint64_t sub_100013288()
{
  uint64_t v0;

  return sub_10001029C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_10001DD00);
}

uint64_t sub_1000132B8()
{
  uint64_t v0;

  return sub_1000109B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_10001DD28);
}

uint64_t sub_1000132E8()
{
  uint64_t v0;

  return sub_1000109B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)&unk_10001DD50);
}

uint64_t sub_100013318(uint64_t *a1)
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

_QWORD *sub_100013358(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_100013394(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_1000133D8(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000133FC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001341C(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100013434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  v0 = sub_100013318(&qword_1000294B0);
  v1 = *(_QWORD *)(type metadata accessor for Schema.PropertyMetadata(0) - 8);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80))+ 6 * *(_QWORD *)(v1 + 72), *(unsigned __int8 *)(v1 + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_10001DC60;
  KeyPath = swift_getKeyPath(&unk_10001DC88);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0xD000000000000011, 0x8000000100021280, KeyPath, &v13, &v10);
  v4 = swift_getKeyPath(&unk_10001DCB0);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0x6E6564496D616574, 0xEE00726569666974, v4, &v13, &v10);
  v5 = swift_getKeyPath(&unk_10001DCD8);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0xD000000000000012, 0x80000001000212A0, v5, &v13, &v10);
  v6 = swift_getKeyPath(&unk_10001DD00);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0x69617274736E6F63, 0xEE0065707954746ELL, v6, &v13, &v10);
  v7 = swift_getKeyPath(&unk_10001DD28);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0x676173557473616CLL, 0xE900000000000065, v7, &v13, &v10);
  v8 = swift_getKeyPath(&unk_10001DD50);
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  Schema.PropertyMetadata.init(name:keypath:defaultValue:metadata:)(0x6F7065527473616CLL, 0xEA00000000007472, v8, &v13, &v10);
  return v2;
}

uint64_t sub_1000136A4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100011B08(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(unsigned __int8 *)(v2 + 49), a2);
}

unint64_t sub_1000136B8()
{
  uint64_t v0;

  return sub_1000126A0(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(unsigned __int8 *)(v0 + 80), *(_BYTE *)(v0 + 81));
}

uint64_t sub_1000136F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v2 = sub_100013318(&qword_100029058);
  __chkstk_darwin(v2);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100013318(&qword_100029060);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100013318(&qword_100029068);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  v10 = sub_100013318(&qword_100029350);
  v11 = *(_QWORD *)(sub_100013318(&qword_100029358) - 8);
  v12 = swift_allocObject(v10, ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72), *(unsigned __int8 *)(v11 + 80) | 7);
  *(_OWORD *)(v12 + 16) = xmmword_10001DC50;
  KeyPath = swift_getKeyPath(&unk_10001DD50);
  v14 = sub_100013DD8(&qword_100029348, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
  SortDescriptor.init<A>(_:order:)(KeyPath, 0, v14);
  v15 = type metadata accessor for ConstraintUsage(0);
  v16 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  FetchDescriptor.init(predicate:sortBy:)(v4, v12, v15, v16);
  FetchDescriptor.fetchLimit.setter(a1, 0, v5);
  v17 = dispatch thunk of ModelContext.fetch<A>(_:)(v8, v15, v16);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v17;
}

uint64_t sub_1000138F8()
{
  uint64_t v0;

  return sub_1000129C8(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_100013914(double a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  _BYTE v24[16];
  char *v25;
  uint64_t v26;

  v2 = sub_100013318(&qword_100029058);
  __chkstk_darwin(v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Date(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v22 - v11;
  static Date.now.getter(v10);
  static Date.- infix(_:_:)(v9, a1);
  v22 = *(void (**)(char *, uint64_t))(v6 + 8);
  v23 = v5;
  v22(v9, v5);
  v13 = sub_100013318(&qword_100029060);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v12;
  v17 = type metadata accessor for ConstraintUsage(0);
  v26 = v17;
  Predicate.init(_:)(sub_1000143B8, v24, 1, &v26);
  v18 = sub_100013318(&qword_100029068);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v4, 0, 1, v18);
  v19 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
  FetchDescriptor.init(predicate:sortBy:)(v4, &_swiftEmptyArrayStorage, v17, v19);
  v20 = dispatch thunk of ModelContext.fetch<A>(_:)(v16, v17, v19);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v22(v12, v23);
  return v20;
}

uint64_t sub_100013B34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = sub_100013914(*(double *)(v0 + 32));
  if (!v1)
  {
    v3 = result;
    if ((unint64_t)result >> 62)
    {
      if (result < 0)
        v9 = result;
      else
        v9 = result & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain(result);
      v4 = _CocoaArrayWrapper.endIndex.getter(v9);
      result = swift_bridgeObjectRelease(v3);
      if (v4)
        goto LABEL_4;
    }
    else
    {
      v4 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v4)
      {
LABEL_4:
        if (v4 < 1)
        {
          __break(1u);
          return result;
        }
        v5 = 0;
        do
        {
          if ((v3 & 0xC000000000000001) != 0)
          {
            v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, v3);
          }
          else
          {
            v6 = *(_QWORD *)(v3 + 8 * v5 + 32);
            swift_retain(v6);
          }
          ++v5;
          v7 = type metadata accessor for ConstraintUsage(0);
          v8 = sub_100013DD8(&qword_100029020, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DF58);
          dispatch thunk of ModelContext.delete<A>(_:)(v6, v7, v8);
          swift_release(v6);
        }
        while (v4 != v5);
      }
    }
    return swift_bridgeObjectRelease(v3);
  }
  return result;
}

unint64_t sub_100013C70()
{
  unint64_t result;

  result = qword_100029070;
  if (!qword_100029070)
  {
    result = swift_getWitnessTable(&unk_10001DD78);
    atomic_store(result, (unint64_t *)&qword_100029070);
  }
  return result;
}

unint64_t sub_100013CB8()
{
  unint64_t result;

  result = qword_100029078;
  if (!qword_100029078)
  {
    result = swift_getWitnessTable(&unk_10001DE68);
    atomic_store(result, (unint64_t *)&qword_100029078);
  }
  return result;
}

uint64_t sub_100013CFC()
{
  return sub_100013DD8(&qword_100029018, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E058);
}

uint64_t sub_100013D28()
{
  return sub_100013DD8(&qword_100029080, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DFB8);
}

uint64_t sub_100013D54()
{
  return sub_100013DD8(&qword_100029088, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001DFF8);
}

uint64_t sub_100013D80()
{
  return sub_100013DD8(&qword_100029090, (void (*)(uint64_t))type metadata accessor for ConstraintUsage, (uint64_t)&unk_10001E030);
}

uint64_t sub_100013DAC()
{
  return sub_100013DD8(&qword_100029098, (void (*)(uint64_t))&type metadata accessor for PersistentIdentifier, (uint64_t)&protocol conformance descriptor for PersistentIdentifier);
}

uint64_t sub_100013DD8(unint64_t *a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    result = swift_getWitnessTable(a3);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ConstraintType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ConstraintType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_100013F04 + 4 * byte_10001DC75[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100013F38 + 4 * byte_10001DC70[v4]))();
}

uint64_t sub_100013F38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100013F48);
  return result;
}

uint64_t sub_100013F54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100013F5CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_100013F60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100013F74(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100013F7C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ConstraintType()
{
  return &type metadata for ConstraintType;
}

uint64_t getEnumTagSinglePayload for ValidationCategory(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_100014070 + 4 * byte_10001DC7F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1000140A4 + 4 * byte_10001DC7A[v4]))();
}

uint64_t sub_1000140A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000140AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000140B4);
  return result;
}

uint64_t sub_1000140C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000140C8);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1000140CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000140D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ValidationCategory()
{
  return &type metadata for ValidationCategory;
}

uint64_t sub_1000140F0()
{
  return type metadata accessor for ConstraintUsage(0);
}

uint64_t sub_1000140F8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[8];

  v4[0] = (char *)&value witness table for () + 64;
  v4[1] = (char *)&value witness table for () + 64;
  v4[2] = (char *)&value witness table for () + 64;
  v4[3] = (char *)&value witness table for () + 64;
  v4[4] = (char *)&value witness table for () + 64;
  v4[5] = (char *)&value witness table for () + 64;
  v4[6] = "(";
  result = type metadata accessor for ObservationRegistrar(319);
  if (v3 <= 0x3F)
  {
    v4[7] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 8, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsage._SwiftDataNoType()
{
  return &type metadata for ConstraintUsage._SwiftDataNoType;
}

uint64_t destroy for ConstraintUsageModel(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

_QWORD *_s5amfid20ConstraintUsageModelVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  return a1;
}

uint64_t *assignWithCopy for ConstraintUsageModel(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for ConstraintUsageModel(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for ConstraintUsageModel(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ConstraintUsageModel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ConstraintUsageModel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConstraintUsageModel()
{
  return &type metadata for ConstraintUsageModel;
}

unint64_t sub_100014330()
{
  unint64_t result;

  result = qword_1000292E0;
  if (!qword_1000292E0)
  {
    result = swift_getWitnessTable(&unk_10001DED0);
    atomic_store(result, (unint64_t *)&qword_1000292E0);
  }
  return result;
}

unint64_t sub_100014374()
{
  unint64_t result;

  result = qword_1000292E8;
  if (!qword_1000292E8)
  {
    result = swift_getWitnessTable(&unk_10001DDE0);
    atomic_store(result, (unint64_t *)&qword_1000292E8);
  }
  return result;
}

uint64_t sub_1000143B8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100012C0C(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_1000143C0(uint64_t *a1)
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

unint64_t sub_100014404()
{
  unint64_t result;

  result = qword_100029318;
  if (!qword_100029318)
  {
    sub_1000143C0(&qword_100029310);
    sub_100014698(&qword_100029320, &qword_100029300);
    sub_100014480();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Comparison<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029318);
  }
  return result;
}

unint64_t sub_100014480()
{
  unint64_t result;

  result = qword_100029330;
  if (!qword_100029330)
  {
    sub_1000143C0(&qword_1000292F0);
    sub_100013DD8(&qword_100029028, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    sub_100013DD8(&qword_100029038, (void (*)(uint64_t))&type metadata accessor for Date, (uint64_t)&protocol conformance descriptor for Date);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, (unint64_t *)&qword_100029330);
  }
  return result;
}

uint64_t sub_100014524()
{
  return sub_100014548(&qword_100029420, &qword_1000293B8, (void (*)(void))sub_1000145B8, (void (*)(void))sub_10001476C);
}

uint64_t sub_100014548(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_1000143C0(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Conjunction<A, B>);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000145B8()
{
  unint64_t result;

  result = qword_100029428;
  if (!qword_100029428)
  {
    sub_1000143C0(&qword_1000293B0);
    sub_10001461C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Conjunction<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029428);
  }
  return result;
}

unint64_t sub_10001461C()
{
  unint64_t result;

  result = qword_100029430;
  if (!qword_100029430)
  {
    sub_1000143C0(&qword_1000293A8);
    sub_100014698(&qword_100029438, &qword_1000293A0);
    sub_100014708();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029430);
  }
  return result;
}

uint64_t sub_100014698(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_1000143C0(a2);
    sub_100014AEC(&qword_100029328, &qword_1000292F8, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100014708()
{
  unint64_t result;

  result = qword_100029440;
  if (!qword_100029440)
  {
    sub_1000143C0(&qword_100029398);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, (unint64_t *)&qword_100029440);
  }
  return result;
}

unint64_t sub_10001476C()
{
  unint64_t result;

  result = qword_100029448;
  if (!qword_100029448)
  {
    sub_1000143C0(&qword_100029390);
    sub_100014698(&qword_100029450, &qword_100029388);
    sub_1000147E8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029448);
  }
  return result;
}

unint64_t sub_1000147E8()
{
  unint64_t result;

  result = qword_100029458;
  if (!qword_100029458)
  {
    sub_1000143C0(&qword_100029380);
    sub_10001486C(&qword_100029460, &qword_100029378, (void (*)(void))sub_1000148DC, (void (*)(void))sub_100014920);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029458);
  }
  return result;
}

uint64_t sub_10001486C(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_1000143C0(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> PredicateExpressions.Value<A>);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000148DC()
{
  unint64_t result;

  result = qword_100029468;
  if (!qword_100029468)
  {
    result = swift_getWitnessTable(&unk_10001DF08);
    atomic_store(result, (unint64_t *)&qword_100029468);
  }
  return result;
}

unint64_t sub_100014920()
{
  unint64_t result;

  result = qword_100029470;
  if (!qword_100029470)
  {
    result = swift_getWitnessTable(&unk_10001DF30);
    atomic_store(result, (unint64_t *)&qword_100029470);
  }
  return result;
}

unint64_t sub_100014964()
{
  unint64_t result;

  result = qword_100029478;
  if (!qword_100029478)
  {
    sub_1000143C0(&qword_100029370);
    sub_100014698(&qword_100029450, &qword_100029388);
    sub_1000149E0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029478);
  }
  return result;
}

unint64_t sub_1000149E0()
{
  unint64_t result;

  result = qword_100029480;
  if (!qword_100029480)
  {
    sub_1000143C0(&qword_100029368);
    sub_10001486C(&qword_100029488, &qword_100029360, (void (*)(void))sub_100014A64, (void (*)(void))sub_100014AA8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>);
    atomic_store(result, (unint64_t *)&qword_100029480);
  }
  return result;
}

unint64_t sub_100014A64()
{
  unint64_t result;

  result = qword_100029490;
  if (!qword_100029490)
  {
    result = swift_getWitnessTable(&unk_10001DE18);
    atomic_store(result, (unint64_t *)&qword_100029490);
  }
  return result;
}

unint64_t sub_100014AA8()
{
  unint64_t result;

  result = qword_100029498;
  if (!qword_100029498)
  {
    result = swift_getWitnessTable(&unk_10001DE40);
    atomic_store(result, (unint64_t *)&qword_100029498);
  }
  return result;
}

uint64_t sub_100014AEC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_1000143C0(a2);
    result = swift_getWitnessTable(a3);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100014B38()
{
  return sub_100013258();
}

uint64_t sub_100014B4C()
{
  return sub_100013288();
}

uint64_t sub_100014B60()
{
  return sub_1000132B8();
}

uint64_t sub_100014B74()
{
  return sub_1000132E8();
}

uint64_t sub_100014B90()
{
  return sub_1000131F0();
}

uint64_t sub_100014BA4()
{
  return sub_100013224();
}

id ConstraintUsageMetricsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id ConstraintUsageMetricsManager.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v14;
  objc_super v15;

  v1 = type metadata accessor for Logger(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for URL(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v0;
  URL.init(fileURLWithPath:)(0xD000000000000020, 0x80000001000212C0);
  v9 = sub_100011644((uint64_t)v7);
  v10 = (uint64_t *)&v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context];
  *v10 = v9;
  v10[1] = v11;
  Logger.init(subsystem:category:)(0xD00000000000001DLL, 0x8000000100021350, 0x5F7363697274656DLL, 0xEF676E6967676F6CLL);
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v8[OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log], v4, v1);

  v12 = (objc_class *)type metadata accessor for ConstraintUsageMetricsManager(0);
  v15.receiver = v8;
  v15.super_class = v12;
  return objc_msgSendSuper2(&v15, "init");
}

uint64_t type metadata accessor for ConstraintUsageMetricsManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100029E08;
  if (!qword_100029E08)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ConstraintUsageMetricsManager);
  return result;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.record(signingIdentifier:teamIdentifier:validationCategory:constraintType:)(Swift::String signingIdentifier, Swift::String teamIdentifier, Swift::Int validationCategory, Swift::Int constraintType)
{
  uint64_t v4;
  void *object;
  NSObject *countAndFlagsBits;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  char v20;
  int v21;
  uint64_t v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;

  object = teamIdentifier._object;
  countAndFlagsBits = teamIdentifier._countAndFlagsBits;
  v9 = signingIdentifier._object;
  v31 = signingIdentifier._countAndFlagsBits;
  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10000F658(validationCategory);
  if (v14 == 10)
  {
    swift_bridgeObjectRetain_n(v9, 2);
    v15 = swift_bridgeObjectRetain_n(object, 2);
    v32 = Logger.logObject.getter(v15);
    v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v16))
    {
      v17 = swift_slowAlloc(42, -1);
      v18 = swift_slowAlloc(64, -1);
      v34 = v18;
      *(_DWORD *)v17 = 136315906;
      swift_bridgeObjectRetain(v9);
      v33 = sub_10001624C(v31, (unint64_t)v9, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 4, v17 + 12);
      swift_bridgeObjectRelease_n(v9, 3);
      *(_WORD *)(v17 + 12) = 2080;
      swift_bridgeObjectRetain(object);
      v33 = sub_10001624C((uint64_t)countAndFlagsBits, (unint64_t)object, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 14, v17 + 22);
      swift_bridgeObjectRelease_n(object, 3);
      *(_WORD *)(v17 + 22) = 2048;
      v33 = validationCategory;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 24, v17 + 32);
      *(_WORD *)(v17 + 32) = 2048;
      v33 = constraintType;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v17 + 34, v17 + 42);
      _os_log_impl((void *)&_mh_execute_header, v32, v16, "Failed recording constraint event: %s %s %ld %ld: unknown validation category", (uint8_t *)v17, 0x2Au);
      swift_arrayDestroy(v18, 2, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v18, -1, -1);
      swift_slowDealloc(v17, -1, -1);
      v19 = v32;
LABEL_7:

      return;
    }
    swift_bridgeObjectRelease_n(object, 2);
    swift_bridgeObjectRelease_n(v9, 2);

  }
  else
  {
    v20 = v14;
    v32 = countAndFlagsBits;
    v21 = sub_10000F520(constraintType);
    if (v21 == 5)
    {
      swift_bridgeObjectRetain_n(v9, 2);
      v22 = swift_bridgeObjectRetain_n(object, 2);
      v30 = Logger.logObject.getter(v22);
      v23 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v23))
      {
        v24 = swift_slowAlloc(42, -1);
        v25 = swift_slowAlloc(64, -1);
        v34 = v25;
        *(_DWORD *)v24 = 136315906;
        swift_bridgeObjectRetain(v9);
        v33 = sub_10001624C(v31, (unint64_t)v9, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 4, v24 + 12);
        swift_bridgeObjectRelease_n(v9, 3);
        *(_WORD *)(v24 + 12) = 2080;
        swift_bridgeObjectRetain(object);
        v33 = sub_10001624C((uint64_t)v32, (unint64_t)object, &v34);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 14, v24 + 22);
        swift_bridgeObjectRelease_n(object, 3);
        *(_WORD *)(v24 + 22) = 2048;
        v33 = validationCategory;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 24, v24 + 32);
        *(_WORD *)(v24 + 32) = 2048;
        v33 = constraintType;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 34, v24 + 42);
        _os_log_impl((void *)&_mh_execute_header, v30, v23, "Failed recording constraint event: %s %s %ld %ld: unknown constraint type", (uint8_t *)v24, 0x2Au);
        swift_arrayDestroy(v25, 2, (char *)&type metadata for Any + 8);
        swift_slowDealloc(v25, -1, -1);
        swift_slowDealloc(v24, -1, -1);
        v19 = v30;
        goto LABEL_7;
      }
      swift_bridgeObjectRelease_n(object, 2);
      swift_bridgeObjectRelease_n(v9, 2);

    }
    else
    {
      v26 = v21;
      v29[1] = validationCategory;
      v30 = constraintType;
      v27 = *(_QWORD *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context);
      v28 = *(_QWORD *)(v4 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8);
      static Date.now.getter();
      sub_100011918(v31, (uint64_t)v9, (uint64_t)v32, (uint64_t)object, v20, v26, (uint64_t)v13, v27, v28);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    }
  }
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.report()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v1 = v0;
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  v8 = Logger.logObject.getter(v4);
  v9 = static os_log_type_t.info.getter();
  v10 = os_log_type_enabled(v8, v9);
  v32 = v3;
  v33 = v2;
  if (v10)
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v35[0] = v12;
    v31 = v7;
    *(_DWORD *)v11 = 136315138;
    v13 = v6;
    v30 = v11 + 4;
    static Date.now.getter();
    v14 = sub_10001688C();
    v15 = dispatch thunk of CustomStringConvertible.description.getter(v2, v14);
    v16 = v2;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v16);
    v34 = sub_10001624C(v15, v18, v35);
    v6 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v30, v11 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Reporting environment constraint usage: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v19 = sub_100012988(5, (uint64_t)sub_100015A64, 0, *(_QWORD *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context), *(_QWORD *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8));
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v35[0] = v23;
    *(_DWORD *)v22 = 136315138;
    static Date.now.getter();
    v24 = sub_10001688C();
    v25 = v33;
    v26 = dispatch thunk of CustomStringConvertible.description.getter(v33, v24);
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v25);
    v34 = sub_10001624C(v26, v28, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Finished reporting environment constraint usage: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }

}

void sub_100015A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  NSString v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  _QWORD v16[5];
  _QWORD *v17;

  v12 = String._bridgeToObjectiveC()();
  v13 = (_QWORD *)swift_allocObject(&unk_1000258A0, 64, 7);
  v13[2] = a5;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = a4;
  v13[7] = a6;
  v16[4] = sub_100016980;
  v17 = v13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_100015C84;
  v16[3] = &unk_1000258B8;
  v14 = _Block_copy(v16);
  v15 = v17;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  swift_release(v15);
  AnalyticsSendEventLazy(v12, v14);
  _Block_release(v14);

}

unint64_t sub_100015B6C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100013318(&qword_100029510);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_100016B18(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

Class sub_100015C84(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary v5;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v4 = v1(v3);
  swift_release(v2);
  if (v4)
  {
    sub_100016AE0(0, &qword_1000294F8, NSObject_ptr);
    v5.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return v5.super.isa;
}

Swift::Void __swiftcall ConstraintUsageMetricsManager.clean()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint8_t *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];

  v1 = v0;
  v2 = type metadata accessor for Date(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v0 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_log;
  v8 = Logger.logObject.getter(v4);
  v9 = static os_log_type_t.info.getter();
  v10 = os_log_type_enabled(v8, v9);
  v32 = v3;
  v33 = v2;
  if (v10)
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v35[0] = v12;
    v31 = v7;
    *(_DWORD *)v11 = 136315138;
    v13 = v6;
    v30 = v11 + 4;
    static Date.now.getter(v12);
    v14 = sub_10001688C();
    v15 = dispatch thunk of CustomStringConvertible.description.getter(v2, v14);
    v16 = v2;
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v13, v16);
    v34 = sub_10001624C(v15, v18, v35);
    v6 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v30, v11 + 12);
    swift_bridgeObjectRelease(v18);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cleaning environment constraint usage metrics: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }

  v19 = sub_100012EE0(*(_QWORD *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context), *(_QWORD *)(v1 + OBJC_IVAR____TtC5amfid29ConstraintUsageMetricsManager_context + 8), 1209600.0);
  v20 = Logger.logObject.getter(v19);
  v21 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc(12, -1);
    v23 = swift_slowAlloc(32, -1);
    v35[0] = v23;
    *(_DWORD *)v22 = 136315138;
    static Date.now.getter(v23);
    v24 = sub_10001688C();
    v25 = v33;
    v26 = dispatch thunk of CustomStringConvertible.description.getter(v33, v24);
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v25);
    v34 = sub_10001624C(v26, v28, v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v34, v35, v22 + 4, v22 + 12);
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Finished cleaning environment constraint usage metrics: %s", v22, 0xCu);
    swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v23, -1, -1);
    swift_slowDealloc(v22, -1, -1);
  }

}

id ConstraintUsageMetricsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ConstraintUsageMetricsManager(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001624C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10001631C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100016C5C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100016C5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_1000133FC(v12);
  return v7;
}

uint64_t sub_10001631C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000164D4(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_1000164D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100016568(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100016740(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100016740(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100016568(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000166DC(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000166DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100013318(&qword_100029518);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100016740(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100013318(&qword_100029518);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

unint64_t sub_10001688C()
{
  unint64_t result;

  result = qword_1000294C8;
  if (!qword_1000294C8)
  {
    type metadata accessor for Date(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for Date);
    atomic_store(result, (unint64_t *)&qword_1000294C8);
  }
  return result;
}

uint64_t sub_1000168D4()
{
  return type metadata accessor for ConstraintUsageMetricsManager(0);
}

uint64_t sub_1000168DC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = &unk_10001E210;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100016954()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 64, 7);
}

unint64_t sub_100016980()
{
  uint64_t v0;
  Swift::Int v1;
  Swift::Int v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = sub_100013318(&qword_100029500);
  inited = swift_initStackObject(v3, &v6);
  *(_OWORD *)(inited + 16) = xmmword_10001E1E0;
  *(_QWORD *)(inited + 32) = 0xD000000000000013;
  *(_QWORD *)(inited + 40) = 0x8000000100021420;
  sub_100016AE0(0, &qword_100029508, NSNumber_ptr);
  *(NSNumber *)(inited + 48) = NSNumber.init(integerLiteral:)(v1);
  *(_QWORD *)(inited + 56) = 0xD000000000000012;
  *(_QWORD *)(inited + 64) = 0x8000000100021440;
  *(_QWORD *)(inited + 72) = String._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 80) = 0x6564695F6D616574;
  *(_QWORD *)(inited + 88) = 0xEF7265696669746ELL;
  *(_QWORD *)(inited + 96) = String._bridgeToObjectiveC()();
  *(_QWORD *)(inited + 104) = 0x69617274736E6F63;
  *(_QWORD *)(inited + 112) = 0xEF657079745F746ELL;
  *(NSNumber *)(inited + 120) = NSNumber.init(integerLiteral:)(v2);
  return sub_100015B6C(inited);
}

uint64_t sub_100016AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100016AD8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100016AE0(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_100016B18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100016B7C(a1, a2, v5);
}

unint64_t sub_100016B7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100016C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t parseEntitlements(const char *a1, OSString **a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = *((_QWORD *)a1 + 1);
  if ((v2 & 0x80u) != 0)
  {
    a1 = *(const char **)a1;
    v2 = v3;
  }
  return AMFIUnserializeXML(a1, v2 + 1, a2);
}

void sub_100016CC4()
{
  operator delete();
}

_QWORD *sub_100016CD8(uint64_t a1, int a2)
{
  int v3;
  _QWORD *v4;
  _QWORD *v5;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  v4 = sub_10000B484(&std::cout, (uint64_t)"OSBoolean(", 10);
  v5 = (_QWORD *)std::ostream::operator<<(v4, *(unsigned __int8 *)(a1 + 12));
  return sub_10000B484(v5, (uint64_t)")\n", 2);
}

uint64_t sub_100016D5C(uint64_t a1)
{
  void *v2;

  sub_10000BE38(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

uint64_t sub_100016D94()
{
  dword_1000295A8 = 1;
  kOSBooleanFalse_single = (uint64_t)off_1000258F0;
  byte_1000295AC = 0;
  dword_1000295B8 = 1;
  kOSBooleanTrue_single = (uint64_t)off_1000258F0;
  byte_1000295BC = 1;
  OSSymbol::symbols = 0u;
  *(_OWORD *)&qword_1000295D0 = 0u;
  dword_1000295E0 = 1065353216;
  return __cxa_atexit((void (*)(void *))sub_100016C9C, &OSSymbol::symbols, (void *)&_mh_execute_header);
}

uint64_t AMFIUnserializeXMLparse(_DWORD *a1)
{
  __int128 v2;
  _QWORD *v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  __int128 v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  int v14;
  int v15;
  int v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  int v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v48;
  char *v49;
  _BYTE *v50;
  BOOL v51;
  int v52;
  _BYTE *v54;
  BOOL v55;
  int v56;
  _BYTE *v57;
  char *v58;
  void *v59;
  uint64_t result;
  _QWORD *v61;
  const char *v62;
  char *__str;
  char *__stra;
  _QWORD *v65;
  unint64_t v66;
  unsigned int v67;
  _BYTE __b[1600];
  __int16 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[30];
  _BYTE v94[1024];
  char __s1[1024];
  _OWORD v96[2];

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v92 = v2;
  *(_OWORD *)v93 = v2;
  v90 = v2;
  v91 = v2;
  v88 = v2;
  v89 = v2;
  v86 = v2;
  v87 = v2;
  *(_OWORD *)&v93[14] = v2;
  v85 = v2;
  v84 = v2;
  v83 = v2;
  v82 = v2;
  v81 = v2;
  v80 = v2;
  v79 = v2;
  v78 = v2;
  v77 = v2;
  v76 = v2;
  v75 = v2;
  v74 = v2;
  v73 = v2;
  v72 = v2;
  v71 = v2;
  v70 = v2;
  v3 = __b;
  memset(__b, 170, sizeof(__b));
  v4 = 0;
  v5 = 0;
  v69 = 0;
  v6 = -2;
  v65 = (_QWORD *)0xAAAAAAAAAAAAAAAALL;
  while (2)
  {
    if (((0xFDAFF8FEuLL >> v5) & 1) == 0)
    {
      v7 = byte_10001E26A[v5];
      if (v6 == -2)
      {
        *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v96[0] = v8;
        v96[1] = v8;
        v67 = -1431655766;
        memset(__s1, 170, sizeof(__s1));
        memset(v94, 170, sizeof(v94));
        while (1)
        {
          do
          {
            while (1)
            {
              v9 = a1[2];
              v6 = *(unsigned __int8 *)(*(_QWORD *)a1 + v9);
              if (v6 == 32 || v6 == 9)
              {
                v11 = *((_QWORD *)a1 + 7);
                if (v11 - 1 <= (unint64_t)v9)
                {
LABEL_38:
                  v6 = 0;
                  goto LABEL_39;
                }
                v12 = ~(uint64_t)v9 + v11;
                v13 = (unsigned __int8 *)(*(_QWORD *)a1 + v9++ + 1);
                while (1)
                {
                  a1[2] = v9;
                  v14 = *v13++;
                  v6 = v14;
                  if (v14 != 9 && v6 != 32)
                    break;
                  ++v9;
                  if (!--v12)
                    goto LABEL_38;
                }
                if (!v6)
                  goto LABEL_39;
              }
              if (v6 != 10)
                break;
              ++a1[3];
              if (*((_QWORD *)a1 + 7) - 1 > (unint64_t)v9)
                a1[2] = v9 + 1;
            }
            v6 = (char)v6;
            if (!(_BYTE)v6)
              goto LABEL_39;
            v15 = sub_100017CF4((uint64_t *)a1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94);
          }
          while (v15 == 4);
          v16 = v15;
          if (!v15)
            goto LABEL_147;
          v17 = (_OWORD *)*((_QWORD *)a1 + 3);
          if (v17)
          {
            *((_QWORD *)a1 + 3) = *(_QWORD *)v17;
          }
          else
          {
            v17 = malloc_type_malloc(0x50uLL, 0x10B0040F2213367uLL);
            v17[2] = 0u;
            v17[3] = 0u;
            v17[4] = 0u;
            *v17 = 0u;
            v17[1] = 0u;
            *((_QWORD *)v17 + 1) = *((_QWORD *)a1 + 2);
            *((_QWORD *)a1 + 2) = v17;
          }
          *((_DWORD *)v17 + 18) = -1;
          v18 = v67;
          v65 = v17;
          if ((int)v67 >= 1)
          {
            v19 = v67;
            v20 = &__s1[1];
            while (*(v20 - 1) != 73 || *v20 != 68)
            {
              v20 += 32;
              if (!--v19)
                goto LABEL_31;
            }
LABEL_147:
            v6 = 267;
            goto LABEL_39;
          }
LABEL_31:
          if (SLOBYTE(v96[0]) != 112)
            break;
          if (LODWORD(v96[0]) != 1936288880 || WORD2(v96[0]) != 116)
            goto LABEL_147;
          *(_QWORD *)v17 = *((_QWORD *)a1 + 3);
          *((_QWORD *)a1 + 3) = v17;
        }
        v6 = &stru_100000100.sectname[11];
        switch(LOBYTE(v96[0]))
        {
          case 'a':
            if (LODWORD(v96[0]) == 1634890337 && WORD2(v96[0]) == 121)
            {
              if (v16 != 3)
              {
                v55 = v16 == 1;
                v56 = 40;
                goto LABEL_154;
              }
              *((_QWORD *)v17 + 2) = 0;
              v6 = &stru_100000100.sectname[2];
            }
            break;
          case 'b':
          case 'c':
          case 'e':
          case 'g':
          case 'h':
          case 'j':
            break;
          case 'd':
            if (LODWORD(v96[0]) ^ 0x74636964 | BYTE4(v96[0]))
            {
              if (!(LODWORD(v96[0]) ^ 0x61746164 | BYTE4(v96[0])))
              {
                v66 = 0xAAAAAAAAAAAAAAAALL;
                if (v16 == 3)
                {
                  *((_QWORD *)v17 + 5) = 0;
                  *((_QWORD *)v17 + 6) = 0;
                  v6 = &stru_100000100.sectname[4];
                }
                else
                {
                  if ((int)v67 < 1)
                  {
LABEL_162:
                    v59 = sub_100018468((uint64_t *)a1, &v66);
                  }
                  else
                  {
                    __stra = v94;
                    v58 = __s1;
                    while (strcmp(v58, "format") || strcmp(__stra, "hex"))
                    {
                      __stra += 32;
                      v58 += 32;
                      if (!--v18)
                        goto LABEL_162;
                    }
                    v59 = sub_100018284((uint64_t *)a1, &v66);
                  }
                  v65[5] = v66;
                  v65[6] = v59;
                  if (sub_100017CF4((uint64_t *)a1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                  {
                    if (LODWORD(v96[0]) ^ 0x61746164 | BYTE4(v96[0]))
                      v6 = 267;
                    else
                      v6 = 260;
                  }
                  else
                  {
                    v6 = 267;
                  }
                }
              }
            }
            else if (v16 == 3)
            {
              *((_QWORD *)v17 + 2) = 0;
              v6 = &stru_100000100.sectname[5];
            }
            else if (v16 == 1)
            {
              v6 = 123;
            }
            else
            {
              v6 = 125;
            }
            break;
          case 'f':
            v48 = LODWORD(v96[0]) != 1936482662 || WORD2(v96[0]) != 101;
            if (v16 == 3 && !v48)
            {
              *((_QWORD *)v17 + 8) = 0;
              goto LABEL_118;
            }
            break;
          case 'i':
            if (*(_QWORD *)&v96[0] == 0x72656765746E69)
            {
              *((_QWORD *)v17 + 5) = 64;
              if ((int)v18 >= 1)
              {
                __str = v94;
                v49 = __s1;
                do
                {
                  if (!strcmp(v49, "size"))
                    v65[5] = strtoul(__str, 0, 0);
                  __str += 32;
                  v49 += 32;
                  --v18;
                }
                while (v18);
              }
              if (v16 != 3)
              {
                v65[8] = sub_100018614((uint64_t *)a1);
                if (sub_100017CF4((uint64_t *)a1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) != 2)
                  goto LABEL_147;
                v51 = *(_QWORD *)&v96[0] == 0x72656765746E69;
                v52 = 264;
                goto LABEL_144;
              }
              v65[8] = 0;
              v6 = &stru_100000100.sectname[8];
            }
            break;
          case 'k':
            if (v16 != 3 && LODWORD(v96[0]) == 7955819)
            {
              v50 = sub_10001878C((uint64_t *)a1);
              v65[7] = v50;
              if (v50)
              {
                if (sub_100017CF4((uint64_t *)a1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                {
                  v51 = LODWORD(v96[0]) == 7955819;
                  v52 = 263;
LABEL_144:
                  if (v51)
                    v6 = v52;
                  else
                    v6 = 267;
                }
              }
            }
            break;
          default:
            if (SLOBYTE(v96[0]) == 115)
            {
              if (LODWORD(v96[0]) == 1769108595 && *(_DWORD *)((char *)v96 + 3) == 6778473)
              {
                if (v16 == 3)
                {
                  v54 = malloc_type_malloc(1uLL, 0xD67C392CuLL);
                  v65[7] = v54;
                  *v54 = 0;
                  v6 = &stru_100000100.sectname[10];
                }
                else
                {
                  v57 = sub_10001878C((uint64_t *)a1);
                  v65[7] = v57;
                  if (v57
                    && sub_100017CF4((uint64_t *)a1, (uint64_t)v96, (int *)&v67, (uint64_t)__s1, (uint64_t)v94) == 2)
                  {
                    v55 = (LODWORD(v96[0]) ^ 0x69727473 | *(_DWORD *)((char *)v96 + 3) ^ 0x676E69) == 0;
                    v56 = 266;
LABEL_154:
                    if (v55)
                      v6 = v56;
                    else
                      v6 = v56 + 1;
                  }
                }
              }
            }
            else if (SLOBYTE(v96[0]) == 116 && v16 == 3 && !(LODWORD(v96[0]) ^ 0x65757274 | BYTE4(v96[0])))
            {
              *((_QWORD *)v17 + 8) = 1;
LABEL_118:
              v6 = &stru_100000100.sectname[3];
            }
            break;
        }
      }
LABEL_39:
      if (v6 < 1)
      {
        v22 = 0;
        v6 = 0;
      }
      else
      {
        v22 = v6 > 0x10B ? 2 : byte_10001E28A[v6];
      }
      v23 = (v22 + v7);
      if (v23 <= 0x38 && v22 == byte_10001E396[v23])
      {
        if (((0xAA005815600800uLL >> (v22 + v7)) & 1) != 0)
          goto LABEL_169;
        if ((_DWORD)v23 == 6)
          return 0;
        v5 = byte_10001E3CF[v23];
        if (v6)
          v6 = -2;
        else
          v6 = 0;
        v3[1] = v65;
        ++v3;
        goto LABEL_90;
      }
    }
    if (((0x2500700uLL >> v5) & 1) != 0)
    {
LABEL_169:
      v62 = "syntax error";
      goto LABEL_171;
    }
    v24 = byte_10001E408[v5];
    v25 = byte_10001E428[v24];
    v26 = v3[1 - v25];
    switch((int)v24)
    {
      case 2:
        v62 = "unexpected end of buffer";
        goto LABEL_171;
      case 3:
        result = 0;
        *((_QWORD *)a1 + 5) = *(_QWORD *)(*v3 + 24);
        *(_QWORD *)(*v3 + 24) = 0;
        v61 = (_QWORD *)*v3;
        *v61 = *((_QWORD *)a1 + 3);
        *((_QWORD *)a1 + 3) = v61;
        return result;
      case 4:
        goto LABEL_169;
      case 5:
        v36 = *v3;
        v37 = *(_QWORD **)(*v3 + 16);
        if (v37)
        {
          v38 = 0;
          v39 = 0;
          do
          {
            v40 = v37;
            v37 = (_QWORD *)*v37;
            *v40 = v39;
            ++v38;
            v39 = v40;
          }
          while (v37);
        }
        else
        {
          v40 = 0;
        }
        *(_QWORD *)(v36 + 16) = v40;
        sub_100018A04();
      case 6:
        v31 = *v3;
        v32 = *(_QWORD **)(*v3 + 16);
        if (v32)
        {
          v33 = 0;
          v34 = 0;
          do
          {
            v35 = v32;
            v32 = (_QWORD *)*v32;
            *v35 = v34;
            ++v33;
            v34 = v35;
          }
          while (v32);
        }
        else
        {
          v35 = 0;
        }
        *(_QWORD *)(v31 + 16) = v35;
        sub_100018F2C();
      case 7:
        sub_10000E850();
      case 8:
        operator new();
      case 9:
        operator new();
      case 10:
        v26 = *v3;
        if (*(_QWORD *)(*v3 + 64))
          v30 = &kOSBooleanTrue_single;
        else
          v30 = &kOSBooleanFalse_single;
        *(_QWORD *)(v26 + 24) = v30;
        sub_10000A8D4((uint64_t)v30);
        if (*(_QWORD *)(v26 + 24))
        {
          v41 = a1[12];
          a1[12] = v41 + 1;
          if (v41 >= 0x1FFFF)
          {
            v62 = "maximum object count";
            goto LABEL_171;
          }
LABEL_86:
          v42 = &v3[-v25];
          v4 -= v25;
          v42[1] = v26;
          v3 = v42 + 1;
          v43 = byte_10001E443[v24] - 17;
          v44 = (*(&v69 + v4) + byte_10001E45E[v43]);
          if (v44 <= 0x38
            && (unsigned __int16)*(&v69 + v4) == (unsigned __int16)byte_10001E396[v44])
          {
            v5 = byte_10001E3CF[v44];
          }
          else
          {
            v5 = byte_10001E46B[v43];
          }
LABEL_90:
          *(&v69 + v4 + 1) = v5;
          if (v4++ > 197)
          {
            sub_100017AAC((uint64_t)a1, "memory exhausted");
            return 2;
          }
          continue;
        }
        v62 = "buildBoolean";
LABEL_171:
        sub_100017AAC((uint64_t)a1, v62);
        return 1;
      case 11:
      case 18:
        v26 = *(v3 - 1);
        *(_QWORD *)(v26 + 16) = 0;
        goto LABEL_86;
      case 12:
      case 19:
        v26 = *(v3 - 2);
        *(_QWORD *)(v26 + 16) = *(v3 - 1);
        goto LABEL_86;
      case 15:
        v29 = (_QWORD *)*(v3 - 1);
        v26 = *v3;
        *(_QWORD *)*v3 = v29;
        if (!v29)
          goto LABEL_86;
        while (v29[4] != *(_QWORD *)(v26 + 32))
        {
          v29 = (_QWORD *)*v29;
          if (!v29)
            goto LABEL_86;
        }
        v62 = "duplicate dictionary key";
        goto LABEL_171;
      case 16:
        v26 = *(v3 - 1);
        *(_QWORD *)(v26 + 32) = *(_QWORD *)(v26 + 24);
        *(_QWORD *)(v26 + 24) = *(_QWORD *)(*v3 + 24);
        *(_QWORD *)v26 = 0;
        *(_QWORD *)(*v3 + 24) = 0;
        v27 = (_QWORD *)*v3;
        *v27 = *((_QWORD *)a1 + 3);
        *((_QWORD *)a1 + 3) = v27;
        goto LABEL_86;
      case 17:
        v26 = *v3;
        v28 = sub_10000A748(*(char **)(*v3 + 56));
        free(*(void **)(v26 + 56));
        *(_QWORD *)(v26 + 56) = 0;
        *(_QWORD *)(v26 + 24) = v28;
        goto LABEL_86;
      case 21:
        v26 = *v3;
        *(_QWORD *)*v3 = 0;
        goto LABEL_86;
      case 22:
        v26 = *v3;
        *(_QWORD *)*v3 = *(v3 - 1);
        goto LABEL_86;
      default:
        goto LABEL_86;
    }
  }
}

uint64_t sub_100017AAC(uint64_t result, const char *a2)
{
  __int128 v2;
  char __str[16];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (*(_QWORD *)(result + 32))
  {
    *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v9 = v2;
    v10 = v2;
    v7 = v2;
    v8 = v2;
    v5 = v2;
    v6 = v2;
    *(_OWORD *)__str = v2;
    v4 = v2;
    snprintf(__str, 0x80uLL, "AMFIUnserializeXML: %s near line %d\n", a2, *(_DWORD *)(result + 12));
    sub_10000E850();
  }
  return result;
}

uint64_t AMFIUnserializeXML(const char *a1, unint64_t a2, OSString **a3)
{
  uint64_t v3;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _DWORD *v10;
  void *v11;
  _DWORD *v12;
  void *v13;
  _QWORD *v14;

  v3 = 0;
  if (a1 && a2 >= 4)
  {
    if (a1[a2 - 1])
      return 0;
    v7 = malloc_type_malloc(0x40uLL, 0x10F004054948CD0uLL);
    if (!v7)
    {
      return 0;
    }
    else
    {
      v8 = v7;
      if (a3)
        *a3 = 0;
      *v7 = a1;
      v7[1] = &_mh_execute_header;
      v7[2] = 0;
      v7[3] = 0;
      v7[4] = a3;
      v7[5] = 0;
      v7[6] = 0;
      v7[7] = a2;
      AMFIUnserializeXMLparse(v7);
      v3 = v8[5];
      v9 = (_QWORD *)v8[2];
      if (v9)
      {
        do
        {
          v10 = (_DWORD *)v9[3];
          if (v10)
            sub_10000A3B4(v10);
          v11 = (void *)v9[6];
          if (v11)
            free(v11);
          v12 = (_DWORD *)v9[4];
          if (v12)
            sub_10000A3B4(v12);
          v13 = (void *)v9[7];
          if (v13)
            free(v13);
          v14 = (_QWORD *)v9[1];
          free(v9);
          v9 = v14;
        }
        while (v14);
      }
      free(v8);
    }
  }
  return v3;
}

_QWORD *sub_100017C44(_QWORD *a1, int a2)
{
  int v3;
  _QWORD *v4;
  _QWORD *v5;
  const char *v6;
  size_t v7;
  _QWORD *v8;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  v4 = sub_10000B484(&std::cout, (uint64_t)"OSObject(", 9);
  if (!a1)
    __cxa_bad_typeid();
  v5 = v4;
  v6 = (const char *)(*(_QWORD *)(*(_QWORD *)(*a1 - 8) + 8) & 0x7FFFFFFFFFFFFFFFLL);
  v7 = strlen(v6);
  v8 = sub_10000B484(v5, (uint64_t)v6, v7);
  return sub_10000B484(v8, (uint64_t)")\n", 2);
}

uint64_t sub_100017CF4(uint64_t *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t i;
  int v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  BOOL v48;
  uint64_t v49;
  int v50;
  int v51;
  BOOL v52;
  char v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;

  v5 = 0;
  v6 = *a1;
  v7 = *(unsigned __int8 *)(*a1 + *((int *)a1 + 2));
  *a3 = 0;
  if (v7 != 60)
    return v5;
  v8 = *((int *)a1 + 2);
  v9 = a1[7] - 1;
  if (v9 <= v8)
    return 0;
  v10 = v8 + 1;
  *((_DWORD *)a1 + 2) = v8 + 1;
  LODWORD(v11) = *(unsigned __int8 *)(v6 + v8 + 1);
  if ((_DWORD)v11 == 33)
  {
    if (v9 > v10)
    {
      v10 = v8 + 2;
      *((_DWORD *)a1 + 2) = v8 + 2;
      v13 = *(char *)(v6 + v8 + 2);
      if (v13 == 45)
      {
        if (v9 > v10)
        {
          LODWORD(v10) = v8 + 3;
          *((_DWORD *)a1 + 2) = v8 + 3;
          v13 = *(char *)(v6 + v8 + 3);
          if (*(_BYTE *)(v6 + v8 + 3))
          {
            v14 = v13 == 45;
            goto LABEL_84;
          }
          goto LABEL_36;
        }
        v13 = 0;
      }
      v14 = 0;
LABEL_84:
      v5 = 0;
      v48 = !v14;
      if ((v13 & 0xFFFFFFDF) - 91 >= 0xFFFFFFE6)
        v48 = 0;
      if (v48 || !v13)
        return v5;
      while (1)
      {
        if (v9 <= (int)v10)
          return 0;
        v49 = (int)v10;
        v10 = (int)v10 + 1;
        *((_DWORD *)a1 + 2) = v10;
        v5 = *(unsigned __int8 *)(v6 + v10);
        if ((_DWORD)v5 == 10)
          break;
        if (!*(_BYTE *)(v6 + v10))
          return v5;
        if (v14)
        {
          if ((_DWORD)v5 != 45)
            goto LABEL_100;
          if (v9 <= v10)
          {
            LOBYTE(v50) = 0;
          }
          else
          {
            *((_DWORD *)a1 + 2) = v49 + 2;
            v50 = *(unsigned __int8 *)(v6 + v49 + 2);
            LODWORD(v10) = v49 + 2;
            if (v50 == 45)
            {
              if (v9 <= v49 + 2)
                return 0;
              LODWORD(v10) = v49 + 3;
              *((_DWORD *)a1 + 2) = v49 + 3;
              LODWORD(v5) = *(unsigned __int8 *)(v6 + v49 + 3);
              goto LABEL_97;
            }
          }
          v51 = (char)v50;
LABEL_109:
          v5 = 0;
          if (!v51)
            return v5;
        }
        else
        {
LABEL_97:
          if ((_DWORD)v5 == 62)
          {
            if (v9 <= (int)v10)
              return 4;
            v54 = v10 + 1;
LABEL_115:
            v16 = 4;
LABEL_116:
            *((_DWORD *)a1 + 2) = v54;
            return v16;
          }
LABEL_102:
          v52 = (_DWORD)v5 == 0;
          v5 = 0;
          v53 = v52 || v14;
          if ((v53 & 1) != 0)
            return v5;
        }
      }
      ++*((_DWORD *)a1 + 3);
      if (!v14)
      {
        LODWORD(v5) = 10;
        goto LABEL_102;
      }
LABEL_100:
      v51 = 1;
      goto LABEL_109;
    }
    v13 = 0;
LABEL_36:
    v14 = 0;
    goto LABEL_84;
  }
  if ((_DWORD)v11 == 47)
  {
    if (v9 <= v10)
      return 0;
    v15 = v8 + 2;
    *((_DWORD *)a1 + 2) = v15;
    LOBYTE(v11) = *(_BYTE *)(v6 + v15);
    v16 = 2;
    goto LABEL_25;
  }
  if ((_DWORD)v11 != 63)
  {
    v16 = 1;
LABEL_25:
    if (((v11 & 0xDF) - 65) > 0x19u)
      return 0;
    v17 = 0;
    while (((v11 & 0xDF) - 65) < 0x1Au
         || v11 == 45
         || (v11 - 48) <= 9u)
    {
      *(_BYTE *)(a2 + v17) = v11;
      v18 = *((int *)a1 + 2);
      if (a1[7] - 1 <= v18)
      {
        LOBYTE(v11) = 0;
      }
      else
      {
        v11 = *a1;
        v19 = v18 + 1;
        *((_DWORD *)a1 + 2) = v19;
        LOBYTE(v11) = *(_BYTE *)(v11 + v19);
      }
      v5 = 0;
      if (++v17 == 31)
        return v5;
    }
    *(_BYTE *)(a2 + v17) = 0;
LABEL_38:
    if (v11 != 47)
    {
      if (v11 == 62)
      {
        LODWORD(v58) = *((_DWORD *)a1 + 2);
        v59 = (int)v58;
        v56 = a1[7] - 1;
LABEL_125:
        if (v56 > v59)
        {
          v54 = v58 + 1;
          goto LABEL_116;
        }
        return v16;
      }
      while (1)
      {
        if (v11 != 9)
        {
          LODWORD(v20) = (char)v11;
          if ((char)v11 != 32)
            break;
        }
        LOBYTE(v11) = 0;
        v21 = *((int *)a1 + 2);
        if (a1[7] - 1 > v21)
        {
          v22 = *a1;
          v23 = v21 + 1;
          *((_DWORD *)a1 + 2) = v23;
          LOBYTE(v11) = *(_BYTE *)(v22 + v23);
        }
      }
      for (i = 0; ; ++i)
      {
        if ((v20 & 0xFFFFFFDF) - 65 > 0x19)
        {
          v25 = *a3;
          if ((_DWORD)v20 != 45 && (v20 - 48) > 9)
          {
            *(_BYTE *)(a4 + 32 * v25 + i) = 0;
            while ((_DWORD)v20 == 9 || (_DWORD)v20 == 32)
            {
              v28 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v28)
              {
                v31 = 0;
              }
              else
              {
                v29 = *a1;
                v30 = v28 + 1;
                *((_DWORD *)a1 + 2) = v30;
                v31 = *(_BYTE *)(v29 + v30);
              }
              LODWORD(v20) = v31;
            }
            if ((_DWORD)v20 != 61)
              return 0;
            v32 = *((int *)a1 + 2);
            v33 = a1[7] - 1;
            if (v33 <= v32)
            {
              v34 = 0;
              goto LABEL_64;
            }
LABEL_67:
            v35 = *a1;
            v32 = (int)v32 + 1;
            *((_DWORD *)a1 + 2) = v32;
            v34 = *(_BYTE *)(v35 + v32);
LABEL_64:
            while (v34 == 9 || v34 == 32)
            {
              v34 = 0;
              if (v33 > (int)v32)
                goto LABEL_67;
            }
            if (v34 != 34)
              return 0;
            if (v33 <= (int)v32)
            {
              v38 = 0;
            }
            else
            {
              v36 = *a1;
              v37 = (int)v32 + 1;
              *((_DWORD *)a1 + 2) = v37;
              v38 = *(unsigned __int8 *)(v36 + v37);
            }
            v39 = 0;
            while (1)
            {
              v40 = *a3;
              if (v38 == 34)
                break;
              *(_BYTE *)(a5 + 32 * v40 + v39) = v38;
              if (v39 == 30)
                return 0;
              v41 = *((int *)a1 + 2);
              if (a1[7] - 1 <= v41)
                return 0;
              v5 = 0;
              ++v39;
              v42 = *a1;
              v43 = v41 + 1;
              *((_DWORD *)a1 + 2) = v43;
              v38 = *(unsigned __int8 *)(v42 + v43);
              if (!v38)
                return v5;
            }
            LOBYTE(v11) = 0;
            *(_BYTE *)(a5 + 32 * v40 + v39) = 0;
            v44 = *((int *)a1 + 2);
            if (a1[7] - 1 > v44)
            {
              v45 = *a1;
              v46 = v44 + 1;
              *((_DWORD *)a1 + 2) = v46;
              LOBYTE(v11) = *(_BYTE *)(v45 + v46);
            }
            v5 = 0;
            v47 = (*a3)++;
            if (v47 > 30)
              return v5;
            goto LABEL_38;
          }
        }
        else
        {
          v25 = *a3;
        }
        *(_BYTE *)(a4 + 32 * v25 + i) = v20;
        if (i == 30)
          return 0;
        v26 = *((int *)a1 + 2);
        if (a1[7] - 1 <= v26)
        {
          LOBYTE(v20) = 0;
        }
        else
        {
          v27 = *a1;
          v20 = v26 + 1;
          *((_DWORD *)a1 + 2) = v20;
          LOBYTE(v20) = *(_BYTE *)(v27 + v20);
        }
        LODWORD(v20) = (char)v20;
      }
    }
    v55 = *((int *)a1 + 2);
    v56 = a1[7] - 1;
    if (v56 > v55)
    {
      v57 = *a1;
      v58 = v55 + 1;
      *((_DWORD *)a1 + 2) = v55 + 1;
      if (*(_BYTE *)(v57 + v55 + 1) == 62)
      {
        v16 = 3;
        v59 = v58;
        goto LABEL_125;
      }
    }
    return 0;
  }
  if (v9 <= v10)
    return 0;
  while (1)
  {
    v12 = (int)v10;
    v10 = (int)v10 + 1;
    *((_DWORD *)a1 + 2) = v10;
    v5 = *(unsigned __int8 *)(v6 + v10);
    if ((_DWORD)v5 == 10)
    {
      ++*((_DWORD *)a1 + 3);
      goto LABEL_15;
    }
    if ((_DWORD)v5 != 63)
    {
      if (!*(_BYTE *)(v6 + v10))
        return v5;
      goto LABEL_15;
    }
    if (v9 <= v10)
      return 4;
    v10 = v12 + 2;
    *((_DWORD *)a1 + 2) = v12 + 2;
    if (!*(_BYTE *)(v6 + v12 + 2))
      return 4;
    if (*(_BYTE *)(v6 + v12 + 2) == 62)
      break;
LABEL_15:
    v5 = 0;
    if (v9 <= v10)
      return v5;
  }
  if (v9 > v10)
  {
    v54 = v12 + 3;
    goto LABEL_115;
  }
  return 4;
}

_BYTE *sub_100018284(uint64_t *a1, _QWORD *a2)
{
  _BYTE *result;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  char v17;
  uint64_t v18;
  int v19;

  result = malloc_type_malloc(0x1000uLL, 0xBF3DDE5EuLL);
  v5 = result;
  v6 = *((int *)a1 + 2);
  LOBYTE(v7) = *(_BYTE *)(*a1 + v6);
  v8 = result;
  while (1)
  {
    while (1)
    {
      if (v7 == 9 || v7 == 32)
      {
        v9 = a1[7] - 1;
        if (v9 <= (int)v6)
          goto LABEL_29;
        v10 = (int)v6;
        v11 = *a1 + 1;
        LODWORD(v6) = v6 + 1;
        while (1)
        {
          *((_DWORD *)a1 + 2) = v6;
          LODWORD(v7) = *(unsigned __int8 *)(v11 + v10);
          if ((_DWORD)v7 != 9 && (_DWORD)v7 != 32)
            break;
          ++v10;
          LODWORD(v6) = v6 + 1;
          if (v9 <= v10)
            goto LABEL_29;
        }
        if (!*(_BYTE *)(v11 + v10))
          goto LABEL_29;
      }
      else if (v7 == 60)
      {
        *a2 = v5 - result;
        return result;
      }
      if (v7 != 10)
        break;
      LOBYTE(v7) = 0;
      ++*((_DWORD *)a1 + 3);
      if (a1[7] - 1 > (unint64_t)(int)v6)
      {
        v7 = *a1;
        v6 = (int)v6;
        goto LABEL_16;
      }
    }
    if (((char)v7 - 48) > 9)
    {
      if (((char)v7 - 97) > 5)
        break;
      v12 = 16 * v7 - 112;
    }
    else
    {
      v12 = 16 * v7;
    }
    *v5 = v12;
    v13 = *((int *)a1 + 2);
    if (a1[7] - 1 <= v13)
      break;
    v14 = *a1;
    v15 = v13 + 1;
    *((_DWORD *)a1 + 2) = v15;
    v16 = *(unsigned __int8 *)(v14 + v15);
    v17 = v16 - 48;
    if ((v16 - 48) >= 0xA)
    {
      if ((v16 - 97) > 5)
        break;
      v17 = v16 - 87;
    }
    *v5++ |= v17;
    if (v5 - v8 >= 4096)
    {
      v18 = v5 - result;
      result = malloc_type_realloc(result, v5 - result + 4096, 0x2FBA26FCuLL);
      v5 = &result[v18];
      v8 = &result[v18];
    }
    LOBYTE(v7) = 0;
    v19 = *((_DWORD *)a1 + 2);
    LODWORD(v6) = v19;
    if (a1[7] - 1 > (unint64_t)v19)
    {
      v6 = v19;
      v7 = *a1;
LABEL_16:
      *((_DWORD *)a1 + 2) = ++v6;
      LOBYTE(v7) = *(_BYTE *)(v7 + v6);
    }
  }
LABEL_29:
  *a2 = 0;
  free(result);
  return 0;
}

void *sub_100018468(uint64_t *a1, _QWORD *a2)
{
  void *result;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  result = malloc_type_malloc(0x1000uLL, 0xF3D532CuLL);
  v5 = *((int *)a1 + 2);
  v6 = *(unsigned __int8 *)(*a1 + v5);
  *a2 = 0;
  if (v6 == 60)
  {
LABEL_28:
    free(result);
    return 0;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v6 & 0x7F;
    switch((_DWORD)v12)
    {
      case 0xA:
        v11 = 0;
        ++*((_DWORD *)a1 + 3);
        break;
      case 0x3D:
        ++v11;
        break;
      case 0:
        goto LABEL_28;
      default:
        v11 = 0;
        break;
    }
    v13 = byte_10001E48C[v12];
    if (v13 < 0)
    {
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        v14 = *a1;
        v5 = (int)v5;
LABEL_12:
        *((_DWORD *)a1 + 2) = ++v5;
        v6 = *(unsigned __int8 *)(v14 + v5);
        continue;
      }
      v6 = 0;
    }
    else
    {
      ++v10;
      v9 = v13 + (v9 << 6);
      if ((v10 & 3) == 0)
      {
        v15 = v8 + 2;
        if (v7 <= (int)v15)
        {
          v7 += 4096;
          result = malloc_type_realloc(result, v7, 0xBD9879DCuLL);
        }
        *((_BYTE *)result + v8) = BYTE2(v9);
        if (v11 > 1)
        {
          ++v8;
        }
        else
        {
          *((_BYTE *)result + v8 + 1) = BYTE1(v9);
          if (v11 == 1)
          {
            v8 += 2;
          }
          else
          {
            v8 += 3;
            *((_BYTE *)result + v15) = v9;
          }
        }
      }
      LODWORD(v5) = *((_DWORD *)a1 + 2);
      if (a1[7] - 1 > (unint64_t)(int)v5)
      {
        v5 = (int)v5;
        v14 = *a1;
        goto LABEL_12;
      }
      v6 = 0;
    }
  }
  while (v6 != 60);
  *a2 = v8;
  if (!v8)
    goto LABEL_28;
  return result;
}

uint64_t sub_100018614(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int v6;
  char v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v13;
  char v14;

  v1 = *a1;
  LODWORD(v2) = *((_DWORD *)a1 + 2);
  v3 = *(unsigned __int8 *)(*a1 + (int)v2);
  if (v3 != 48)
    goto LABEL_6;
  v4 = (int)v2;
  v5 = a1[7] - 1;
  if (v5 <= (int)v2)
    return 0;
  v2 = (int)v2 + 1;
  *((_DWORD *)a1 + 2) = v4 + 1;
  v3 = *(unsigned __int8 *)(v1 + v4 + 1);
  if (v3 != 120)
  {
LABEL_6:
    if (v3 != 45)
    {
      v7 = v3;
LABEL_10:
      v8 = v7;
      if ((v7 - 48) > 9)
      {
        v9 = 0;
      }
      else
      {
        v9 = 0;
        v10 = a1[7] - 1;
        v2 = (int)v2;
        do
        {
          v9 = 10 * v9 + v8 - 48;
          if (v10 <= v2)
            break;
          *((_DWORD *)a1 + 2) = ++v2;
          v8 = *(char *)(v1 + (int)v2);
        }
        while (v8 - 48 < 0xA);
      }
      if (v3 == 45)
        return -v9;
      return v9;
    }
    if (a1[7] - 1 > (unint64_t)(int)v2)
    {
      v2 = (int)v2 + 1;
      *((_DWORD *)a1 + 2) = v2;
      v7 = *(_BYTE *)(v1 + v2);
      goto LABEL_10;
    }
    return 0;
  }
  if (v5 <= v2)
  {
    v6 = 0;
  }
  else
  {
    LODWORD(v2) = v4 + 2;
    *((_DWORD *)a1 + 2) = v4 + 2;
    v6 = *(char *)(v1 + v4 + 2);
  }
  v11 = v6 - 48 < 0xA;
  if (v6 - 48 >= 0xA && v6 - 97 > 5)
    return 0;
  v9 = 0;
  do
  {
    if (v11)
      v13 = -48;
    else
      v13 = -87;
    if (v5 <= (int)v2)
    {
      v14 = 0;
    }
    else
    {
      v2 = (int)v2 + 1;
      *((_DWORD *)a1 + 2) = v2;
      v14 = *(_BYTE *)(v1 + v2);
    }
    v9 = v13 + 16 * v9 + v6;
    v6 = v14;
    v11 = (v14 - 48) < 0xA;
  }
  while ((v14 - 48) < 0xA || (v14 - 97) < 6);
  return v9;
}

_BYTE *sub_10001878C(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  char v6;
  int v7;
  _BYTE *result;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v2 = *a1;
  v3 = *((_DWORD *)a1 + 2);
  v4 = v3;
LABEL_2:
  v5 = v4;
  v6 = *(_BYTE *)(v2 + v4);
  while (v6 == 10)
  {
    ++*((_DWORD *)a1 + 3);
LABEL_8:
    v6 = 0;
    if (a1[7] - 1 > v5)
    {
      v4 = v5 + 1;
      *((_DWORD *)a1 + 2) = v5 + 1;
      goto LABEL_2;
    }
  }
  if (!v6)
    return 0;
  if (v6 != 60)
    goto LABEL_8;
  v7 = v5 - v3;
  result = malloc_type_malloc((int)v5 - v3 + 1, 0x6F12ABF3uLL);
  if (!result)
  {
    puts("AMFIUnserializeXML: can't alloc temp memory");
    return 0;
  }
  if (v7 < 1)
  {
    v21 = 0;
LABEL_47:
    result[v21] = 0;
    return result;
  }
  v9 = 0;
  LODWORD(v10) = 0;
  v11 = v3 + 3;
  v12 = result;
  while (2)
  {
    v13 = *a1;
    v14 = (int)v10;
    v15 = (int)v10 + 1;
    v16 = *(unsigned __int8 *)(*a1 + v3 + (uint64_t)(int)v10);
    if (v16 != 38)
      goto LABEL_40;
    v10 = (int)v10 + 4;
    if ((int)v14 + 4 > v7)
      goto LABEL_44;
    v17 = v14 + 2;
    v18 = *(unsigned __int8 *)(v13 + v15 + v3);
    if (v18 != 103)
    {
      if (v18 == 108)
      {
        if (*(_BYTE *)(v13 + v17 + v3) != 116 || *(_BYTE *)(v13 + v11 + (int)v14) != 59)
          goto LABEL_44;
        LOBYTE(v16) = 60;
        goto LABEL_41;
      }
      v15 = v14 + 5;
      if ((int)v14 + 5 > v7)
        goto LABEL_44;
      if (v18 == 113)
      {
        if (*(_BYTE *)(v13 + v3 + (uint64_t)(int)v17) != 117
          || *(_BYTE *)(v13 + v11 + (int)v14) != 111
          || *(_BYTE *)(v13 + v3 + (uint64_t)(int)v10) != 116
          || *(_BYTE *)(v13 + (int)v15 + v3) != 59)
        {
          goto LABEL_44;
        }
        LODWORD(v10) = v14 + 6;
        LOBYTE(v16) = 34;
        goto LABEL_41;
      }
      if (v18 != 97)
        goto LABEL_44;
      v19 = v14 + 3;
      v20 = *(unsigned __int8 *)(v13 + v3 + (uint64_t)(int)v17);
      if (v20 != 109)
      {
        if (v20 != 112
          || *(_BYTE *)(v13 + v19 + v3) != 111
          || *(_BYTE *)(v13 + v10 + v3) != 115
          || *(_BYTE *)(v13 + v15 + v3) != 59)
        {
          goto LABEL_44;
        }
        LODWORD(v10) = v14 + 6;
        LOBYTE(v16) = 39;
        goto LABEL_41;
      }
      if (*(_BYTE *)(v13 + (int)v19 + v3) != 112 || *(_BYTE *)(v13 + v3 + (uint64_t)(int)v10) != 59)
        goto LABEL_44;
      LOBYTE(v16) = 38;
LABEL_40:
      LODWORD(v10) = v15;
LABEL_41:
      *v12++ = v16;
      v9 += (uint64_t)&_mh_execute_header;
      if ((int)v10 >= v7)
      {
        v21 = v9 >> 32;
        goto LABEL_47;
      }
      continue;
    }
    break;
  }
  if (*(_BYTE *)(v13 + v3 + (uint64_t)(int)v17) == 116 && *(_BYTE *)(v13 + v11 + (int)v14) == 59)
  {
    LOBYTE(v16) = 62;
    goto LABEL_41;
  }
LABEL_44:
  free(result);
  return 0;
}

void sub_100018A04()
{
  operator new();
}

_QWORD *sub_100018A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;
  uint64_t v7;
  uint64_t *v8;

  v7 = a2;
  sub_10000A8D4(a3);
  sub_10000A8D4(a2);
  v8 = &v7;
  result = sub_100018CE4(a1 + 16, &v7, (uint64_t)&std::piecewise_construct, &v8);
  result[3] = a3;
  return result;
}

_QWORD *sub_100018AF0(_QWORD *a1)
{
  *a1 = off_100025920;
  sub_10000EB84((uint64_t)(a1 + 2));
  return a1;
}

void sub_100018B24(_QWORD *a1)
{
  *a1 = off_100025920;
  sub_10000EB84((uint64_t)(a1 + 2));
  operator delete();
}

_QWORD *sub_100018B68(uint64_t a1, int a2)
{
  int v4;
  _QWORD *result;
  uint64_t **v6;
  uint64_t v7;
  uint64_t *v8;

  if (a2 >= 1)
  {
    v4 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v4;
    }
    while (v4);
  }
  result = sub_10000B484(&std::cout, (uint64_t)"OSDictionary\n", 13);
  v6 = *(uint64_t ***)(a1 + 32);
  if (v6)
  {
    v7 = (a2 + 1);
    do
    {
      v8 = v6[3];
      (*(void (**)(uint64_t *, uint64_t))(*v6[2] + 16))(v6[2], v7);
      result = (_QWORD *)(*(uint64_t (**)(uint64_t *, uint64_t))(*v8 + 16))(v8, v7);
      v6 = (uint64_t **)*v6;
    }
    while (v6);
  }
  return result;
}

uint64_t sub_100018C20(uint64_t a1)
{
  uint64_t **i;
  uint64_t *v3;

  for (i = *(uint64_t ***)(a1 + 32); i; i = (uint64_t **)*i)
  {
    v3 = i[3];
    sub_10000A3B4(i[2]);
    sub_10000A3B4(v3);
  }
  sub_100018C80((_QWORD *)(a1 + 16));
  *(_DWORD *)(a1 + 8) = -2;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

_QWORD *sub_100018C80(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

_QWORD *sub_100018CE4(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  _QWORD **v12;
  _QWORD *i;
  unint64_t v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  char v25;

  v7 = sub_10000AA0C((uint64_t)&v25, *a2 + 16);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      v11 = v7;
      if (v7 >= v9)
        v11 = v7 % v9;
    }
    else
    {
      v11 = (v9 - 1) & v7;
    }
    v12 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v11);
    if (v12)
    {
      for (i = *v12; i; i = (_QWORD *)*i)
      {
        v14 = i[1];
        if (v14 == v7)
        {
          if (i[2] == *a2)
            return i;
        }
        else
        {
          if (v10.u32[0] > 1uLL)
          {
            if (v14 >= v9)
              v14 %= v9;
          }
          else
          {
            v14 &= v9 - 1;
          }
          if (v14 != v11)
            break;
        }
      }
    }
  }
  else
  {
    v11 = 0xAAAAAAAAAAAAAAAALL;
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v8;
  i[2] = **a4;
  i[3] = 0;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    v17 = 1;
    if (v9 >= 3)
      v17 = (v9 & (v9 - 1)) != 0;
    v18 = v17 | (2 * v9);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    sub_10000BA78(a1, v20);
    v9 = *(_QWORD *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9)
        v11 = v8 % v9;
      else
        v11 = v8;
    }
    else
    {
      v11 = (v9 - 1) & v8;
    }
  }
  v21 = *(_QWORD *)a1;
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v11);
  if (v22)
  {
    *i = *v22;
LABEL_38:
    *v22 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v21 + 8 * v11) = a1 + 16;
  if (*i)
  {
    v23 = *(_QWORD *)(*i + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v23 >= v9)
        v23 %= v9;
    }
    else
    {
      v23 &= v9 - 1;
    }
    v22 = (_QWORD *)(*(_QWORD *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_100018F18(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100018F2C()
{
  operator new();
}

void sub_100018F70()
{
  operator delete();
}

void sub_100018F94(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;

  sub_10000A8D4(a2);
  v4 = a1[4];
  v5 = (uint64_t *)a1[3];
  if ((unint64_t)v5 >= v4)
  {
    v7 = a1[2];
    v8 = ((uint64_t)v5 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61)
      sub_10000C06C();
    v9 = v4 - v7;
    v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1))
      v10 = v8 + 1;
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    if (v11)
      v12 = (char *)sub_10000C080((uint64_t)(a1 + 4), v11);
    else
      v12 = 0;
    v13 = (uint64_t *)&v12[8 * v8];
    v14 = &v12[8 * v11];
    *v13 = a2;
    v6 = v13 + 1;
    v16 = (char *)a1[2];
    v15 = (char *)a1[3];
    if (v15 != v16)
    {
      do
      {
        v17 = *((_QWORD *)v15 - 1);
        v15 -= 8;
        *--v13 = v17;
      }
      while (v15 != v16);
      v15 = (char *)a1[2];
    }
    a1[2] = v13;
    a1[3] = v6;
    a1[4] = v14;
    if (v15)
      operator delete(v15);
  }
  else
  {
    *v5 = a2;
    v6 = v5 + 1;
  }
  a1[3] = v6;
}

uint64_t sub_100019078(uint64_t a1, unint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 1;
  *(_QWORD *)a1 = off_100025950;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  sub_1000190E8((void **)(a1 + 16), a2);
  return a1;
}

void sub_1000190CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 24) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000190E8(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_10000C06C();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_10000C080(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

_QWORD *sub_10001917C(_QWORD *a1)
{
  void *v2;

  *a1 = off_100025950;
  v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1000191BC(_QWORD *a1)
{
  void *v2;

  *a1 = off_100025950;
  v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  operator delete();
}

_QWORD *sub_10001920C(uint64_t a1, int a2)
{
  int v4;
  _QWORD *result;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a2 >= 1)
  {
    v4 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v4;
    }
    while (v4);
  }
  result = sub_10000B484(&std::cout, (uint64_t)"OSArray\n", 8);
  v7 = *(uint64_t **)(a1 + 16);
  v6 = *(uint64_t **)(a1 + 24);
  if (v7 != v6)
  {
    v8 = (a2 + 1);
    do
    {
      v9 = *v7++;
      result = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 16))(v9, v8);
    }
    while (v7 != v6);
  }
  return result;
}

uint64_t sub_1000192B4(uint64_t a1)
{
  _DWORD **v2;
  _DWORD **v3;
  _DWORD *v4;

  v2 = *(_DWORD ***)(a1 + 16);
  v3 = *(_DWORD ***)(a1 + 24);
  if (v2 != v3)
  {
    do
    {
      v4 = *v2++;
      sub_10000A3B4(v4);
    }
    while (v2 != v3);
    v2 = *(_DWORD ***)(a1 + 16);
  }
  *(_QWORD *)(a1 + 24) = v2;
  *(_DWORD *)(a1 + 8) = -2;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void sub_100019310()
{
  operator delete();
}

void sub_100019324()
{
  operator delete();
}

_QWORD *sub_100019338(uint64_t a1, int a2)
{
  int v3;
  _QWORD *v4;
  _QWORD *v5;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      sub_10000B484(&std::cout, (uint64_t)"\t", 1);
      --v3;
    }
    while (v3);
  }
  v4 = sub_10000B484(&std::cout, (uint64_t)"OSNumber(", 9);
  v5 = (_QWORD *)std::ostream::operator<<(v4, *(_QWORD *)(a1 + 16));
  return sub_10000B484(v5, (uint64_t)")\n", 2);
}

void sub_1000193BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] missing TeamName: %@", v2, v3, v4, v5, 2u);
}

void sub_10001942C()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;

  v2[0] = 136315650;
  sub_1000053EC();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "[%s] missing profile: %@ | %u", (uint8_t *)v2, 0x1Cu);
}

void sub_1000194B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] profile trust notification err: %@", v2, v3, v4, v5, 2u);
}

void sub_100019528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: unable to allocate an LAStorage object", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_100019598(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;

  v2 = 136315394;
  v3 = "__enableDeveloperMode";
  v4 = 1026;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: launch_enable_directory failure: %{public}d", (uint8_t *)&v2, 0x12u);
  sub_100005C48();
}

void sub_10001961C(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  int v6[6];

  v3 = a1;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
  objc_msgSend(v4, "UTF8String");
  v6[0] = 136315394;
  sub_100005C50();
  sub_100005C2C((void *)&_mh_execute_header, v3, v5, "%s: unable to set SEP developer mode state: %s", (uint8_t *)v6);

  sub_100005C64();
}

void sub_1000196C0(void *a1, void *a2)
{
  NSObject *v3;
  id v4;
  uint64_t v5;
  int v6[6];

  v3 = a1;
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description")));
  objc_msgSend(v4, "UTF8String");
  v6[0] = 136315394;
  sub_100005C50();
  sub_100005C2C((void *)&_mh_execute_header, v3, v5, "%s: unable to authenticate user: %s", (uint8_t *)v6);

  sub_100005C64();
}

void sub_100019764(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: received NULL notifyOptions", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_1000197D4(int a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;

  v3 = 136315394;
  v4 = "__startDeveloperModeEnrollment";
  v5 = 2050;
  v6 = a1;
  sub_100005C2C((void *)&_mh_execute_header, a2, a3, "%s: failed to display notification: %{public}ld", (uint8_t *)&v3);
  sub_100005C48();
}

void sub_100019854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100005C50();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "%s: XPC error: %s", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_1000198C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005400((void *)&_mh_execute_header, a2, a3, "%s: invalid XPC action: %lu", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_100019938()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_100005C50();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "%s: XPC error: %s", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_1000199A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006840((void *)&_mh_execute_header, a2, a3, "%s: launch_disable_directory failure: %{public}d", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_100019A1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006840((void *)&_mh_execute_header, a2, a3, "%s: ioRet: %d -- failing closed", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_100019A94()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  sub_10000756C();
  v3 = 1040;
  v4 = 8;
  v5 = 2096;
  v6 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: bad security token { %.8P }", v2, 0x1Cu);
}

void sub_100019B24(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000755C((void *)&_mh_execute_header, a1, a3, "copying local signing private key not supported on this platform", a5, a6, a7, a8, 0);
}

void sub_100019B58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100007528();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "bad security token { %.8P }", v2, v3, v4, v5, v6);
  sub_100005C48();
}

void sub_100019BB8()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to open %s for writing: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019C34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000756C();
  sub_100005C38((void *)&_mh_execute_header, v0, v1, "only wrote %ld bytes of the local signing public key", v2, v3, v4, v5, v6);
  sub_100005C48();
}

void sub_100019C94()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to write %s: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019D10()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to open %s for reading: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019D8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000756C();
  sub_100005C38((void *)&_mh_execute_header, v0, v1, "only read %ld bytes of the local signing public key", v2, v3, v4, v5, v6);
  sub_100005C48();
}

void sub_100019DEC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to read %s: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019E68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000755C((void *)&_mh_execute_header, a1, a3, "given public key does not match stored public key", a5, a6, a7, a8, 0);
}

void sub_100019E9C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to open %s: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019F18()
{
  int *v0;
  uint64_t v1;

  v0 = __error();
  v1 = _os_assert_log(*v0);
  _os_crash(v1);
  __break(1u);
}

void sub_100019F34()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to create %s: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_100019FB0()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100007554(__stack_chk_guard);
  v0 = sub_10000754C();
  sub_100007544(v0);
  sub_1000074E8();
  sub_100007508((void *)&_mh_execute_header, v1, v2, "unable to stat %s: %d (%s)", v3, v4, v5, v6, 2u);
  sub_10000751C();
}

void sub_10001A02C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] missing: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A098()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] invalid: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A104()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to get SEP state: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A170(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "[%s] must provide Team ID to sign", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001A1E0()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000053EC();
  sub_100009194((void *)&_mh_execute_header, v0, v1, "[%s] length of Team ID too large: %@ | %lu", v2);
}

void sub_10001A25C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000091A8();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "[%s] unknown sign type: %u", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A2C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "%s: setCredential error: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A334(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006840((void *)&_mh_execute_header, a2, a3, "%s: launch_enable_directory failure: %{public}d", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001A3AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001A41C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000091A8();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "[%s] unable to arm security boot mode: %u", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A488()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to stage UUID: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A4F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to read staged file: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A560()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to commit UUID: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A5CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to remove staged UUID: %@ (not fatal)", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A638()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  sub_1000053EC();
  sub_100009194((void *)&_mh_execute_header, v0, v1, "[%s] mismatch for staged UUID: %@ | %@", v2);
}

void sub_10001A6B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "[%s] unable to read staged file: %@", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001A71C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001A78C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "[%s] profile UUID must be provided", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001A7FC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "unable to create LAStorage for SEP init-state", v1, 2u);
}

void sub_10001A83C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unable to ratchet SEP init-state: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001A8B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: unable to find AppleMobileFileIntegrity service", a5, a6, a7, a8, 2u);
}

void sub_10001A924(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: unable to open AppleMobileFileIntegrity service", a5, a6, a7, a8, 2u);
}

void sub_10001A998()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AA18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AA98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AB18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AB98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AC98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AD18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AD98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AE18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AE98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AF18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001AF98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B098()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B198()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B398()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000C154();
  sub_10000C144((void *)&_mh_execute_header, &_os_log_default, v0, "Couldn't enforce %s in %s", v1, v2, v3, v4, 2u);
  sub_100005C48();
}

void sub_10001B418()
{
  int v0;
  os_log_t v1;
  int v2[5];
  __int16 v3;
  int v4;

  v2[0] = 136315650;
  sub_1000053EC();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%s: [%@] error sending reply: %d", (uint8_t *)v2, 0x1Cu);
}

void sub_10001B4A4()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;

  v3[0] = 136315650;
  sub_1000053EC();
  v4 = v0;
  v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: [%@] error with request: %@", (uint8_t *)v3, 0x20u);
}

void sub_10001B52C(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "handleLockdownXPC";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: invalid lockdown action: %lu", (uint8_t *)&v2, 0x16u);
  sub_100005C48();
}

void sub_10001B5B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000091A8();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "%s: unable to receive message: %d", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001B61C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000D494();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "%s: unexpected security boot mode: %u", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001B68C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: unsupported when device has a passcode", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001B6FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: no UUID provided", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001B76C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a1, a3, "%s: input provided is not a string", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001B7DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000D494();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "%s: unable to trust profile as SEP ratcheted: %u", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001B84C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000091A8();
  sub_100006840((void *)&_mh_execute_header, v0, v1, "%s: unable to query SEP device-state: %u", v2, v3, v4, v5, 2u);
  sub_100005C48();
}

void sub_10001B8B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005C38((void *)&_mh_execute_header, a2, a3, "Dev Mode Notification Error: %@", a5, a6, a7, a8, 2u);
  sub_100005C48();
}

void sub_10001B91C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "misMigrate | %s: missing Team ID", (uint8_t *)&v2, 0xCu);
  sub_100005C48();
}

void sub_10001B98C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: failed creating auxiliary signature: %@", (uint8_t *)&v3, 0x16u);
  sub_100005C48();
}

void sub_10001BA0C(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "misMigrate | %s: copy profile error: %u", (uint8_t *)&v3, 0x12u);
  sub_100005C48();
}

void sub_10001BA8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "%s: unable to find %@", v2, v3, v4, v5, 2u);
}

void sub_10001BAFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053EC();
  sub_100005400((void *)&_mh_execute_header, v0, v1, "%s: unable to iterate and select %@", v2, v3, v4, v5, 2u);
}

void sub_10001BB6C(void *a1)
{
  id v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v2 = __error();
  strerror(*v2);
  sub_10000E648((void *)&_mh_execute_header, v3, v4, "unable to read security.codesigning.config: %s", v5, v6, v7, v8, 2u);

  sub_100005C64();
}

void sub_10001BBEC(void *a1)
{
  id v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = a1;
  v2 = __error();
  strerror(*v2);
  sub_10000E648((void *)&_mh_execute_header, v3, v4, "unable to read security.codesigning.monitor: %s", v5, v6, v7, v8, 2u);

  sub_100005C64();
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
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

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addStateChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStateChangeObserver:");
}

id objc_msgSend_areEntitlementsValidated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "areEntitlementsValidated");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_clean(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clean");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_computedCdHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "computedCdHash:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentState");
}

id objc_msgSend_dataForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForKey:error:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSound");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_evaluatePolicy_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluatePolicy:options:error:");
}

id objc_msgSend_exchangeData_forKey_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeData:forKey:completionHandler:");
}

id objc_msgSend_exchangeData_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exchangeData:forKey:error:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_iconForSystemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconForSystemImageNamed:");
}

id objc_msgSend_initWithAMFIErrorCode_withURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAMFIErrorCode:withURL:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithDomain_authenticationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:authenticationContext:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithURL_withFileOffset_withFlags_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:withFileOffset:withFlags:");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isCredentialSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCredentialSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValid");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizations");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longValue");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_profileAuxSig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileAuxSig");
}

id objc_msgSend_profileData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profileData");
}

id objc_msgSend_recordWithSigningIdentifier_teamIdentifier_validationCategory_constraintType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordWithSigningIdentifier:teamIdentifier:validationCategory:constraintType:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_report(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "report");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setCredential_type_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCredential:type:error:");
}

id objc_msgSend_setData_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:forKey:error:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptionAuthenticationTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptionAuthenticationTitle:");
}

id objc_msgSend_setOptionSecurePassphrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptionSecurePassphrase:");
}

id objc_msgSend_setShouldHideDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldHideDate:");
}

id objc_msgSend_setShouldHideTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldHideTime:");
}

id objc_msgSend_setShouldIgnoreDoNotDisturb_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDoNotDisturb:");
}

id objc_msgSend_setShouldIgnoreDowntime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreDowntime:");
}

id objc_msgSend_setShouldSuppressScreenLightUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSuppressScreenLightUp:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTrustedCodeSigningIdentities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrustedCodeSigningIdentities:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNotifier");
}

id objc_msgSend_signerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signerType");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithContentsOfFile_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithContentsOfFile:encoding:error:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_trustedCodeSigningIdentities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trustedCodeSigningIdentities");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_validateWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateWithError:");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_verifyBoolEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyBoolEntitlement:");
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}
