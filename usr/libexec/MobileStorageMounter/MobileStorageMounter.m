uint64_t start()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  IONotificationPort *v13;
  IONotificationPortRef *v14;
  io_object_t v15;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  id v18;
  _xpc_connection_s *mach_service;
  id v21;
  int v22;
  int *v23;
  char *v24;
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  _QWORD handler[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSFileAttributeKey v49;
  _UNKNOWN **v50;
  uint8_t buf[4];
  _BYTE v52[14];

  v43 = 0;
  v44 = &v43;
  v45 = 0x3010000000;
  v47 = 0;
  v48 = 0;
  v46 = "";
  if ((_set_user_dir_suffix("com.apple.mobile_storage_mounter") & 1) == 0)
  {
    v21 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *__error();
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v52 = v22;
      *(_WORD *)&v52[4] = 2080;
      *(_QWORD *)&v52[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set temporary directory subpath: %d (%s)", buf, 0x12u);
    }

    v25 = *__error();
    v26 = __error();
    strerror(*v26);
    v30 = sub_100013988((uint64_t)"main", 1394, -2, 0, CFSTR("Failed to set temporary directory subpath: %d (%s)"), v27, v28, v29, v25);
    v31 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v30), "description");
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v31));
    _os_crash(objc_msgSend(v32, "UTF8String"));

    __break(1u);
    goto LABEL_14;
  }
  v1 = sub_1000177D4();
  v5 = (id)objc_claimAutoreleasedReturnValue(v1);
  if (!v5)
  {
LABEL_14:
    v33 = sub_100013988((uint64_t)"main", 1402, -2, 0, CFSTR("Failed to query working directory."), v2, v3, v4, v39);
    v34 = objc_msgSend((id)objc_claimAutoreleasedReturnValue(v33), "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v34));
    _os_crash(objc_msgSend(v5, "UTF8String"));

    __break(1u);
    goto LABEL_15;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v49 = NSFilePosixPermissions;
  v50 = &off_100030608;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
  v42 = 0;
  v8 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, v7, &v42);
  v0 = v42;

  if ((v8 & 1) == 0)
  {
LABEL_15:
    v35 = sub_100013988((uint64_t)"main", 1407, -2, v0, CFSTR("Failed to create %@."), v9, v10, v11, (uint64_t)v5);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

    v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "description")));
    _os_crash(objc_msgSend(v37, "UTF8String"));

    __break(1u);
    goto LABEL_16;
  }
  v12 = v44;
  v14 = (IONotificationPortRef *)(v44 + 4);
  v13 = (IONotificationPort *)v44[4];
  if (v13)
  {
    IONotificationPortDestroy(v13);
    *v14 = 0;
  }
  v15 = *((_DWORD *)v12 + 10);
  if (v15)
    IOObjectRelease(v15);
  *v14 = 0;
  v14[1] = 0;
  *v14 = IONotificationPortCreate(kIOMasterPortDefault);
  Main = CFRunLoopGetMain();
  RunLoopSource = IONotificationPortGetRunLoopSource(*v14);
  CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  if (!*v14)
  {
LABEL_16:
    sub_10001E0A0();
    v38 = _os_crash("Failed to init device ark.");
    sub_10001E09C(v38);
  }
  v18 = &_dispatch_main_q;
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.storage_mounter.xpc", (dispatch_queue_t)&_dispatch_main_q, 1uLL);

  if (!mach_service)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v52 = "com.apple.mobile.storage_mounter.xpc";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create xpc listener for %s.", buf, 0xCu);
    }
    exit(1);
  }
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000350C;
  handler[3] = &unk_10002C8B0;
  handler[4] = &v43;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100004224;
  v40[3] = &unk_10002C8B0;
  v40[4] = &v43;
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, v40);

  CFRunLoopRun();
  _Block_object_dispose(&v43, 8);
  return 0;
}

void sub_1000034E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000350C(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E0F4(v3);
    xpc_connection_set_target_queue((xpc_connection_t)v3, (dispatch_queue_t)&_dispatch_main_q);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000035F8;
    v7[3] = &unk_10002C888;
    v9 = *(_QWORD *)(a1 + 32);
    v6 = v3;
    v8 = v6;
    xpc_connection_set_event_handler((xpc_connection_t)v6, v7);
    xpc_connection_resume((xpc_connection_t)v6);

  }
  else if (v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error)
  {
    sub_10001E170();
  }

}

void sub_1000035F8(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  BOOL v5;
  uint64_t v6;
  id v7;
  id v8;
  xpc_object_t reply;
  const UInt8 *data;
  const UInt8 *v11;
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  const __CFData *v14;
  const __CFData *v15;
  const __CFDictionary *v16;
  const __CFString *Value;
  const __CFString *v18;
  CFTypeID v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  const char *v23;
  uint32_t v24;
  __CFDictionary *v25;
  const char *v26;
  uint32_t v27;
  char v28;
  const __CFData *v29;
  uint64_t v30;
  id v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFData *v45;
  const UInt8 *BytePtr;
  size_t v47;
  id v48;
  const __CFData *v49;
  const __CFDictionary *v50;
  size_t length;
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const __CFString *v55;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    v5 = v3 == &_xpc_error_connection_invalid && type == (xpc_type_t)&_xpc_type_error;
    if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E220(a1);
    goto LABEL_46;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  length = 0;
  reply = xpc_dictionary_create_reply(v8);
  if (!reply)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create xpc reply dictionary.";
LABEL_27:
      v24 = 2;
      goto LABEL_28;
    }
LABEL_44:

LABEL_45:
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    goto LABEL_46;
  }
  data = (const UInt8 *)xpc_dictionary_get_data(v8, "EncodedDictionary", &length);
  if (!data)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v53 = "EncodedDictionary";
      v23 = "Invalid or missing value for %s.";
      v24 = 12;
LABEL_28:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
      goto LABEL_44;
    }
    goto LABEL_44;
  }
  v11 = data;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v23 = "Failed to create response dictionary.";
      goto LABEL_27;
    }
    goto LABEL_44;
  }
  v13 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("Status"), CFSTR("Failure"));
  v14 = CFDataCreate(0, v11, length);
  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to encode buffer.", buf, 2u);
    }
    v25 = v13;
    goto LABEL_43;
  }
  v15 = v14;
  v16 = (const __CFDictionary *)CFPropertyListCreateWithData(0, v14, 0, 0, 0);
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary with data.", buf, 2u);
    }
    CFRelease(v13);
    v25 = v15;
LABEL_43:
    CFRelease(v25);
    goto LABEL_44;
  }
  v49 = v15;
  v50 = v16;
  Value = (const __CFString *)CFDictionaryGetValue(v16, CFSTR("RequestType"));
  v18 = Value;
  if (!Value || (v19 = CFGetTypeID(Value), v19 != CFStringGetTypeID()))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 138412546;
    v53 = CFSTR("RequestType");
    v54 = 2112;
    v55 = v18;
    v26 = "Invalid value for %@: %@";
    v27 = 22;
    goto LABEL_34;
  }
  v20 = v6 + 32;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E188(v7, (uint64_t)v18);
  if (CFEqual(v18, CFSTR("CopyDevices")))
  {
    if (sub_100009B38(v7, CFSTR("CopyDevices")))
    {
      v21 = v20;
      v22 = v13;
      sub_100004578(v21, v13);
      goto LABEL_95;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v31 = sub_1000099C0(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      v54 = 2112;
      v55 = CFSTR("CopyDevices");
LABEL_106:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ missing required entitlement: %@", buf, 0x16u);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  if (!CFEqual(v18, CFSTR("Mount")))
  {
    if (CFEqual(v18, CFSTR("Unmount")))
    {
      if (!sub_100009B38(v7, CFSTR("UnmountDevice")))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v36 = sub_1000099C0(v7);
          v32 = (char *)objc_claimAutoreleasedReturnValue(v36);
          *(_DWORD *)buf = 138412546;
          v53 = v32;
          v54 = 2112;
          v55 = CFSTR("UnmountDevice");
          goto LABEL_106;
        }
        goto LABEL_35;
      }
      v33 = v20;
      v22 = v13;
      sub_1000060AC(v33, v50, v13);
      goto LABEL_95;
    }
    if (CFEqual(v18, CFSTR("Sync")))
    {
      if (!sub_100009B38(v7, CFSTR("SyncDevice")))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v38 = sub_1000099C0(v7);
          v32 = (char *)objc_claimAutoreleasedReturnValue(v38);
          *(_DWORD *)buf = 138412546;
          v53 = v32;
          v54 = 2112;
          v55 = CFSTR("SyncDevice");
          goto LABEL_106;
        }
        goto LABEL_35;
      }
      v35 = v20;
      v22 = v13;
      sub_100006C08(v35, v50, v13);
      goto LABEL_95;
    }
    if (CFEqual(v18, CFSTR("CopyPersonalizationManifest")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v37 = v20;
        v22 = v13;
        sub_100006FB8(v37, v50, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("CopyPersonalizationNonce")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v39 = v20;
        v22 = v13;
        sub_10000764C(v39, v50, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("CopyPersonalizationIdentifiers")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v40 = v20;
        v22 = v13;
        sub_100007984(v40, v50, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("CopyCryptexNonce")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v41 = v20;
        v22 = v13;
        sub_100007F0C(v41, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("RollPersonalizationNonce")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v42 = v20;
        v22 = v13;
        sub_100008164(v42, v50, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("RollCryptexNonce")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v43 = v20;
        v22 = v13;
        sub_100008478(v43, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      goto LABEL_105;
    }
    if (CFEqual(v18, CFSTR("CopyDeveloperModeStatus")))
    {
      if (sub_100009B38(v7, CFSTR("QueryNonce")))
      {
        v44 = v20;
        v22 = v13;
        sub_1000086B0(v44, v13);
        goto LABEL_95;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
LABEL_105:
      v48 = sub_1000099C0(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v48);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      v54 = 2112;
      v55 = CFSTR("QueryNonce");
      goto LABEL_106;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    *(_DWORD *)buf = 138412290;
    v53 = (const char *)v18;
    v26 = "Invalid request type: %@";
    v27 = 12;
LABEL_34:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    goto LABEL_35;
  }
  if (!sub_100009B38(v7, CFSTR("MountDevice")))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v34 = sub_1000099C0(v7);
      v32 = (char *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138412546;
      v53 = v32;
      v54 = 2112;
      v55 = CFSTR("MountDevice");
      goto LABEL_106;
    }
LABEL_35:
    v28 = 0;
    v29 = 0;
    v22 = v13;
    goto LABEL_36;
  }
  v30 = v20;
  v22 = v13;
  sub_10000472C(v30, v50, v13);
LABEL_95:
  v45 = CFPropertyListCreateData(0, v22, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (v45)
  {
    v29 = v45;
    BytePtr = CFDataGetBytePtr(v45);
    v47 = CFDataGetLength(v29);
    xpc_dictionary_set_data(reply, "EncodedDictionary", BytePtr, v47);
    xpc_connection_send_message((xpc_connection_t)v7, reply);
    v28 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary with data.", buf, 2u);
    }
    v28 = 0;
    v29 = 0;
  }
LABEL_36:
  CFRelease(v22);
  CFRelease(v50);
  CFRelease(v49);
  if (v29)
    CFRelease(v29);

  if ((v28 & 1) == 0)
    goto LABEL_45;
LABEL_46:

}

void sub_100004224(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  id v5;
  uint64_t v6;
  CFMutableDictionaryRef v7;
  CFMutableDictionaryRef v8;
  uint64_t v9;
  void *v10;
  dispatch_time_t v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  IONotificationPort *v14;
  const __CFDictionary *v15;
  kern_return_t v16;
  const char *v17;
  uint8_t *p_block;
  uint32_t v19;
  uint64_t v20;
  io_iterator_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  io_iterator_t notification;
  _DWORD v29[4];
  __int128 block;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t *v33;

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", string);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_10001E308();
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobile.ptp_camera")))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        sub_10001E2A0();
      goto LABEL_18;
    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    notification = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_1000087FC;
    v26 = sub_10000880C;
    v27 = 0;
    v7 = IOServiceMatching("IOUSBInterface");
    v8 = v7;
    if (v7)
    {
      -[__CFDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", &off_100030620, CFSTR("bInterfaceClass"));
      -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_100030638, CFSTR("bInterfaceSubClass"));
      -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_100030638, CFSTR("bInterfaceProtocol"));
      v9 = os_transaction_create("com.apple.mobile.storage_mounter.xpc");
      v10 = (void *)v23[5];
      v23[5] = v9;

      v11 = dispatch_time(0, 15000000000);
      global_queue = dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue(global_queue);
      *(_QWORD *)&block = _NSConcreteStackBlock;
      *((_QWORD *)&block + 1) = 3221225472;
      v31 = sub_100008814;
      v32 = &unk_10002C8D8;
      v33 = &v22;
      dispatch_after(v11, v13, &block);

      v14 = *(IONotificationPort **)(v6 + 32);
      v15 = v8;
      v16 = IOServiceAddMatchingNotification(v14, "IOServiceFirstMatch", v15, (IOServiceMatchingCallback)sub_100008828, (void *)(v6 + 32), &notification);

      if (!v16)
      {
        v20 = *(unsigned int *)(v6 + 40);
        if ((_DWORD)v20)
        {
          v20 = IOObjectRelease(v20);
          *(_DWORD *)(v6 + 40) = 0;
        }
        v21 = notification;
        *(_DWORD *)(v6 + 40) = notification;
        sub_100008828(v20, v21);
        goto LABEL_17;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v29[0] = 67109120;
        v29[1] = v16 & 0x3FFF;
        v17 = "IOServiceAddMatchingNotification failed: %04x";
        p_block = (uint8_t *)v29;
        v19 = 8;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v17, p_block, v19);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(block) = 136315138;
      *(_QWORD *)((char *)&block + 4) = "IOUSBInterface";
      v17 = "IOServiceMatching failed for %s.";
      p_block = (uint8_t *)&block;
      v19 = 12;
      goto LABEL_13;
    }
LABEL_17:
    _Block_object_dispose(&v22, 8);

LABEL_18:
  }

}

void sub_100004558(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004578(uint64_t a1, __CFDictionary *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  int v12;
  id v13;
  uint64_t v14;
  uint8_t buf[16];

  if (a1)
  {
    v3 = sub_100016608(1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
    {
      v5 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));
      CFDictionarySetValue(a2, CFSTR("EntryList"), v6);
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Success"));

      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve attached device list.", (uint8_t *)&v14, 2u);
    }
    v10 = CFSTR("Failed to retrieve attached device list.");
    v11 = 152;
    v12 = -2;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v10 = CFSTR("Invalid input(s)");
    v11 = 145;
    v12 = -3;
  }
  v13 = sub_100013988((uint64_t)"handle_copy_devices", v11, v12, 0, v10, v7, v8, v9, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v5)
    return;
  if (!CFDictionaryGetValue(a2, CFSTR("Error")))
    CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
  CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v5, "description"));
LABEL_14:

}

void sub_10000472C(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  __CFString *v6;
  id v7;
  void *v8;
  const void *v9;
  __CFString *v10;
  id v11;
  void *v12;
  const void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  const void *v17;
  __CFString *v18;
  __CFString *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  const void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  __CFString *v56;
  uint64_t inited;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unsigned int v82;
  id v83;
  id v84;
  const char *v85;
  id v86;
  int v87;
  int v88;
  id v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *i;
  void *v95;
  void *v96;
  unsigned int v97;
  __CFString *v98;
  id v99;
  id v100;
  char v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  __CFString *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  int *v114;
  char *v115;
  int *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unsigned __int8 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  id v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  __CFString *v140;
  uint64_t v141;
  int *v142;
  char *v143;
  int *v144;
  id v145;
  int *v146;
  char *v147;
  int *v148;
  id v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  id v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  id v168;
  BOOL v169;
  id v170;
  __CFDictionary *v171;
  uint64_t v172;
  __CFString *v173;
  id v174;
  int v175;
  char v176;
  int v177;
  __CFString *v178;
  __CFString *v179;
  __CFString *v180;
  __CFString *v181;
  __CFString *v182;
  id v183;
  id v184;
  id v185;
  id v186;
  id v187;
  _QWORD v188[2];
  _QWORD v189[2];
  _BYTE v190[12];
  __int16 v191;
  id v192;
  __int16 v193;
  void *v194;
  uint8_t v195[32];
  __int128 v196;
  __int128 v197;
  uint8_t buf[4];
  const __CFString *v199;
  __int16 v200;
  __CFString *v201;
  _BYTE v202[448];
  uint64_t v203;

  v203 = 0;
  memset(v202, 0, sizeof(v202));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v35 = sub_100013988((uint64_t)"handle_mount_disk_image", 226, -3, 0, CFSTR("Invalid input(s)"), v32, v33, v34, v165);
    v36 = (id)objc_claimAutoreleasedReturnValue(v35);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v182 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("DiskImageType"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  v7 = sub_1000131B0(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = CFSTR("DiskImageType");
      v200 = 2112;
      v201 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v47 = sub_100013988((uint64_t)"handle_mount_disk_image", 233, -3, 0, CFSTR("Invalid value for %@: %@"), v44, v45, v46, (uint64_t)CFSTR("DiskImageType"));
    v36 = (id)objc_claimAutoreleasedReturnValue(v47);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v182 = 0;
    goto LABEL_23;
  }
  v9 = CFDictionaryGetValue(theDict, CFSTR("ImageSignature"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_100013208(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v182 = v10;
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = CFSTR("ImageSignature");
      v200 = 2112;
      v201 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v51 = sub_100013988((uint64_t)"handle_mount_disk_image", 240, -3, 0, CFSTR("Invalid value for %@: %@"), v48, v49, v50, (uint64_t)CFSTR("ImageSignature"));
    v36 = (id)objc_claimAutoreleasedReturnValue(v51);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
LABEL_23:
    v179 = 0;
LABEL_24:
    v180 = 0;
    v181 = 0;
    goto LABEL_25;
  }
  v13 = CFDictionaryGetValue(theDict, CFSTR("DiskImagePath"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(v13);
  v15 = sub_1000131B0(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v179 = v14;
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = CFSTR("DiskImagePath");
      v200 = 2112;
      v201 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v55 = sub_100013988((uint64_t)"handle_mount_disk_image", 247, -3, 0, CFSTR("Invalid value for %@: %@"), v52, v53, v54, (uint64_t)CFSTR("DiskImagePath"));
    v36 = (id)objc_claimAutoreleasedReturnValue(v55);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_24;
  }
  v17 = CFDictionaryGetValue(theDict, CFSTR("ImageTrustCache"));
  v18 = (__CFString *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  v180 = v18;
  if (v18)
  {
    v20 = sub_100013208(v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    if (!v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v199 = CFSTR("ImageTrustCache");
        v200 = 2112;
        v201 = v19;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
      }
      v70 = sub_100013988((uint64_t)"handle_mount_disk_image", 253, -3, 0, CFSTR("Invalid value for option %@: %@"), v67, v68, v69, (uint64_t)CFSTR("ImageTrustCache"));
      goto LABEL_61;
    }
  }
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Cryptex")))
  {
LABEL_41:
    v181 = 0;
    goto LABEL_42;
  }
  v22 = sub_100013208(v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = CFSTR("ImageTrustCache");
      v200 = 2112;
      v201 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for required option %@: %@", buf, 0x16u);
    }
    v70 = sub_100013988((uint64_t)"handle_mount_disk_image", 259, -3, 0, CFSTR("Invalid value for required option %@: %@"), v71, v72, v73, (uint64_t)CFSTR("ImageTrustCache"));
LABEL_61:
    v36 = (id)objc_claimAutoreleasedReturnValue(v70);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v181 = 0;
    goto LABEL_25;
  }
  v24 = CFDictionaryGetValue(theDict, CFSTR("ImageInfoPlist"));
  v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
  if (!v25)
    goto LABEL_41;
  v181 = v25;
  v26 = sub_100013208(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (!v27)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v199 = CFSTR("ImageInfoPlist");
      v200 = 2112;
      v201 = v181;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for option %@: %@", buf, 0x16u);
    }
    v31 = sub_100013988((uint64_t)"handle_mount_disk_image", 265, -3, 0, CFSTR("Invalid value for option %@: %@"), v28, v29, v30, (uint64_t)CFSTR("ImageInfoPlist"));
LABEL_65:
    v36 = (id)objc_claimAutoreleasedReturnValue(v31);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v178 = 0;
    v41 = 0;
LABEL_66:
    v42 = 0;
    v43 = 0;
    goto LABEL_25;
  }
LABEL_42:
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Personalized")))
  {
    bzero(buf, 0x400uLL);
    *(_QWORD *)v190 = 0;
    v189[0] = 0;
    v56 = objc_retainAutorelease(v182);
    inited = Img4DecodeInitManifest((uint64_t)-[__CFString bytes](v56, "bytes"), (uint64_t)-[__CFString length](v56, "length"), (uint64_t)v202);
    v173 = v56;
    if ((_DWORD)inited)
    {
      v58 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v195 = 67109120;
        *(_DWORD *)&v195[4] = v58;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", v195, 8u);
      }
      v62 = sub_100013988((uint64_t)"handle_mount_disk_image", 282, -2, 0, CFSTR("Failed to decode img4 manifest: %d"), v59, v60, v61, v58);
LABEL_71:
      v36 = (id)objc_claimAutoreleasedReturnValue(v62);
      v39 = 0;
LABEL_72:
      v37 = 0;
      v38 = 0;
      v40 = 0;
      v178 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v182 = v173;
      goto LABEL_25;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v202, 1885629799, 1885630061, v190, v189);
    if ((_DWORD)v77)
    {
      v78 = v77;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v195 = 67109120;
        *(_DWORD *)&v195[4] = v78;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", v195, 8u);
      }
      v62 = sub_100013988((uint64_t)"handle_mount_disk_image", 288, -2, 0, CFSTR("Failed to retrieve data from manifest: %d"), v79, v80, v81, v78);
      goto LABEL_71;
    }
    v83 = objc_alloc((Class)NSString);
    v84 = objc_msgSend(v83, "initWithBytes:length:encoding:", *(_QWORD *)v190, v189[0], 4);
    if (!v84)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v114 = __error();
        v115 = strerror(*v114);
        *(_DWORD *)v195 = 136315138;
        *(_QWORD *)&v195[4] = v115;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string: %s", v195, 0xCu);
      }
      v116 = __error();
      v117 = strerror(*v116);
      v62 = sub_100013988((uint64_t)"handle_mount_disk_image", 294, -2, 0, CFSTR("Failed to create string: %s"), v118, v119, v120, (uint64_t)v117);
      goto LABEL_71;
    }
    v39 = v84;
    if ((objc_msgSend(v84, "isEqualToString:", CFSTR("DebugDiskImage")) & 1) != 0)
    {
      v85 = "/private/var/personalized_debug";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("DemoDiskImage")) & 1) != 0)
    {
      v85 = "/private/var/personalized_demo";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("DeveloperDiskImage")) & 1) != 0)
    {
      v85 = "/System/Developer";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FactoryDiskImage")) & 1) != 0)
    {
      v85 = "/private/var/personalized_factory";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("AutomationDiskImage")) & 1) != 0
           || (objc_msgSend(v39, "isEqualToString:", CFSTR("ProdAutomationDiskImage")) & 1) != 0)
    {
      v85 = "/private/var/personalized_automation";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceDiskImage")) & 1) != 0)
    {
      v85 = "/System/Volumes/FieldService";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceDiagnosticDiskImage")) & 1) != 0)
    {
      v85 = "/System/Volumes/FieldServiceDiagnostic";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceRepairDiskImage")) & 1) != 0)
    {
      v85 = "/System/Volumes/FieldServiceRepair";
    }
    else if ((objc_msgSend(v39, "isEqualToString:", CFSTR("QualityDiskImage")) & 1) != 0)
    {
      v85 = "/private/var/personalized_quality";
    }
    else
    {
      if ((objc_msgSend(v39, "isEqualToString:", CFSTR("RepairDiskImage")) & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v195 = 138412290;
          *(_QWORD *)&v195[4] = v39;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid personalized disk image type: %@", v195, 0xCu);
        }
        v145 = sub_100013988((uint64_t)"handle_mount_disk_image", 321, -3, 0, CFSTR("Invalid personalized disk image type: %@"), v162, v163, v164, (uint64_t)v39);
        goto LABEL_154;
      }
      v85 = "/private/var/personalized_repair";
    }
    if (mkdir(v85, 0x1EDu) && *__error() != 17)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v142 = __error();
        v143 = strerror(*v142);
        *(_DWORD *)v195 = 136315394;
        *(_QWORD *)&v195[4] = v85;
        *(_WORD *)&v195[12] = 2080;
        *(_QWORD *)&v195[14] = v143;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create mount path %s: %s", v195, 0x16u);
      }
      v144 = __error();
      strerror(*v144);
      v140 = CFSTR("Failed to create mount path %s: %s");
      v166 = (uint64_t)v85;
      v141 = 327;
      goto LABEL_153;
    }
    if (objc_msgSend(v39, "isEqualToString:", CFSTR("FactoryDiskImage")))
    {
      if (snprintf((char *)buf, 0x400uLL, "%s/%s", v85, "XXXXXXX") >= 0x400)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v195 = 134217984;
          *(_QWORD *)&v195[4] = 1024;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path: > %ld", v195, 0xCu);
        }
        v140 = CFSTR("Failed to create path: > %ld");
        v166 = 1024;
        v141 = 336;
LABEL_153:
        v145 = sub_100013988((uint64_t)"handle_mount_disk_image", v141, -2, 0, v140, v137, v138, v139, v166);
LABEL_154:
        v36 = (id)objc_claimAutoreleasedReturnValue(v145);
        goto LABEL_72;
      }
      if (!mkdtemp((char *)buf))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v146 = __error();
          v147 = strerror(*v146);
          *(_DWORD *)v195 = 136315394;
          *(_QWORD *)&v195[4] = buf;
          *(_WORD *)&v195[12] = 2080;
          *(_QWORD *)&v195[14] = v147;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", v195, 0x16u);
        }
        v148 = __error();
        strerror(*v148);
        v140 = CFSTR("Failed to create %s: %s");
        v166 = (uint64_t)buf;
        v141 = 340;
        goto LABEL_153;
      }
      v85 = (const char *)buf;
      chmod((const char *)buf, 0x1EDu);
    }
    v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v85);
    v178 = CFSTR("com.apple.mobile.personalized_image_mounted");
  }
  else
  {
    if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Cryptex")))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v199 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported disk image type: %@", buf, 0xCu);
      }
      v31 = sub_100013988((uint64_t)"handle_mount_disk_image", 357, -3, 0, CFSTR("Unsupported disk image type: %@"), v74, v75, v76, (uint64_t)v6);
      goto LABEL_65;
    }
    v178 = CFSTR("com.apple.mobile.cryptex_mounted");
    v39 = 0;
    v41 = 0;
  }
  v6 = v6;
  v39 = v39;
  if (-[__CFString isEqual:](v6, "isEqual:", CFSTR("Developer")))
  {

LABEL_51:
    if (!sub_100013754())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Developer mode is not enabled.", buf, 2u);
      }
      v66 = sub_100013988((uint64_t)"handle_mount_disk_image", 371, -4, 0, CFSTR("Developer mode is not enabled."), v63, v64, v65, v165);
      v36 = (id)objc_claimAutoreleasedReturnValue(v66);
      v37 = 0;
      v38 = 0;
      v40 = 0;
      goto LABEL_66;
    }
    goto LABEL_80;
  }
  if ((-[__CFString isEqual:](v6, "isEqual:", CFSTR("Personalized")) & 1) == 0)
  {

    goto LABEL_80;
  }
  v82 = objc_msgSend(v39, "isEqual:", CFSTR("DeveloperDiskImage"));

  if (v82)
    goto LABEL_51;
LABEL_80:
  if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Cryptex")))
  {
    v171 = a3;
    v172 = (uint64_t)v6;
    v89 = sub_100016AC8(v6, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    memset(v195, 0, sizeof(v195));
    v196 = 0u;
    v197 = 0u;
    v43 = v90;
    v91 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", v195, buf, 16);
    if (v91)
    {
      v92 = v91;
      v93 = **(_QWORD **)&v195[16];
      while (2)
      {
        for (i = 0; i != v92; i = (char *)i + 1)
        {
          if (**(_QWORD **)&v195[16] != v93)
            objc_enumerationMutation(v43);
          v95 = *(void **)(*(_QWORD *)&v195[8] + 8 * (_QWORD)i);
          v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("MountPath")));
          v97 = objc_msgSend(v96, "isEqualToString:", v41);

          if (v97)
          {
            v6 = (__CFString *)v172;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("MountPath")));
              *(_DWORD *)v190 = 138412802;
              *(_QWORD *)&v190[4] = v172;
              v191 = 2112;
              v192 = v39;
              v193 = 2112;
              v194 = v102;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "A disk image of type %@/%@ is already mounted at %@.", v190, 0x20u);

            }
            v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectForKeyedSubscript:", CFSTR("MountPath")));
            v106 = sub_100013988((uint64_t)"handle_mount_disk_image", 393, -3, 0, CFSTR("A disk image of type %@/%@ is already mounted at %@."), v103, v104, v105, v172);
            v36 = (id)objc_claimAutoreleasedReturnValue(v106);

            v37 = 0;
            v38 = 0;
            v40 = 0;
            v42 = 0;
            a3 = v171;
            goto LABEL_25;
          }
        }
        v92 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", v195, buf, 16);
        if (v92)
          continue;
        break;
      }
    }

    if ((objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceDiskImage")) & 1) != 0
      || (objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceDiagnosticDiskImage")) & 1) != 0)
    {
      a3 = v171;
      v6 = (__CFString *)v172;
      v98 = v180;
      if (v180)
        goto LABEL_100;
    }
    else
    {
      v121 = objc_msgSend(v39, "isEqualToString:", CFSTR("FieldServiceRepairDiskImage"));
      a3 = v171;
      v6 = (__CFString *)v172;
      v98 = v180;
      if (v180 || (v121 & 1) == 0)
      {
LABEL_100:
        v186 = 0;
        v187 = 0;
        v99 = sub_10000EA7C(v179, v6, v182, v98, v41, &v187, &v186);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v99);
        v42 = v187;
        v100 = v186;
        v36 = v100;
        if (!v40)
        {
          if (v42)
          {
            v126 = v42;

            v41 = v126;
            v88 = 0;
            v38 = 0;
            v40 = 0;
            v42 = v41;
LABEL_88:
            CFDictionarySetValue(a3, CFSTR("MountPath"), v41);
            CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));
            v37 = v88 != 0;
            goto LABEL_25;
          }
          v37 = 0;
          v38 = 0;
          v40 = 0;
          goto LABEL_25;
        }
        v185 = v100;
        v101 = sub_100009E0C(v41, &v185);
        v170 = v185;

        if ((v101 & 1) != 0)
        {
          if (sub_100009ED8(v41, v6))
          {
            v37 = sub_1000128A0();
            if (v37)
            {
              v184 = v170;
              v176 = sub_1000128C4(v41, &v184);
              v168 = v184;

              if ((v176 & 1) == 0)
              {
                v149 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to register apps."));
                if (v168)
                {
                  v165 = (uint64_t)v149;
                  v150 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

                  v149 = (id)v150;
                }
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)v190 = 138412290;
                  *(_QWORD *)&v190[4] = v149;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v190, 0xCu);
                }
                v154 = sub_100013988((uint64_t)"handle_mount_disk_image", 439, -2, v168, CFSTR("Failed to register apps."), v151, v152, v153, v165);
                v36 = (id)objc_claimAutoreleasedReturnValue(v154);

                v37 = 0;
                v38 = 0;
                goto LABEL_179;
              }
              v177 = 1;
              v170 = v168;
            }
            else
            {
              v177 = 0;
            }
            if (!objc_msgSend(v39, "isEqualToString:", CFSTR("DeveloperDiskImage")))
            {
              v36 = v170;
              goto LABEL_166;
            }
            v183 = v170;
            v169 = sub_100011C40(v39, v182, &v183);
            v36 = v183;

            if (v169)
            {
              v6 = (__CFString *)v172;
LABEL_166:
              v87 = v177;
              goto LABEL_83;
            }
            v155 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to store image manifest."));
            if (v36)
            {
              v165 = (uint64_t)v155;
              v156 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

              v155 = (id)v156;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v190 = 138412290;
              *(_QWORD *)&v190[4] = v155;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v190, 0xCu);
            }
            v160 = sub_100013988((uint64_t)"handle_mount_disk_image", 450, -2, v36, CFSTR("Failed to store image manifest."), v157, v158, v159, v165);
            v161 = objc_claimAutoreleasedReturnValue(v160);

            v38 = 0;
            v36 = (id)v161;
LABEL_179:
            a3 = v171;
            v6 = (__CFString *)v172;
            goto LABEL_25;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v190 = 138412290;
            *(_QWORD *)&v190[4] = v41;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load launchd jobs for %@.", v190, 0xCu);
          }
          v136 = sub_100013988((uint64_t)"handle_mount_disk_image", 432, -2, 0, CFSTR("Failed to load launchd jobs for %@."), v133, v134, v135, (uint64_t)v41);
          v36 = (id)objc_claimAutoreleasedReturnValue(v136);

        }
        else
        {
          v127 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to load launchd jetsam properties for %@."), v41);
          if (v170)
          {
            v128 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v127, v170));

            v127 = (id)v128;
          }
          v6 = (__CFString *)v172;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v190 = 138412290;
            *(_QWORD *)&v190[4] = v127;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v190, 0xCu);
          }
          v132 = sub_100013988((uint64_t)"handle_mount_disk_image", 427, -2, v170, CFSTR("Failed to load launchd jetsam properties for %@."), v129, v130, v131, (uint64_t)v41);
          v36 = (id)objc_claimAutoreleasedReturnValue(v132);

        }
        v37 = 0;
        v38 = 0;
        goto LABEL_25;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412290;
      *(_QWORD *)&v190[4] = v39;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Personalized trust cache required for disk image of type '%@'.", v190, 0xCu);
    }
    v125 = sub_100013988((uint64_t)"handle_mount_disk_image", 402, -3, 0, CFSTR("Personalized trust cache required for disk image of type '%@'."), v122, v123, v124, (uint64_t)v39);
    v36 = (id)objc_claimAutoreleasedReturnValue(v125);
    v37 = 0;
    v38 = 0;
    v40 = 0;
    v42 = 0;
    v180 = 0;
    goto LABEL_25;
  }
  *(_QWORD *)v195 = v41;
  v187 = 0;
  v86 = sub_10000DC40(v179, (uint64_t)v6, v182, v180, v181, v195, &v187);
  v40 = (void *)objc_claimAutoreleasedReturnValue(v86);
  v174 = *(id *)v195;

  v36 = v187;
  if (v40)
  {
    v87 = 0;
    v42 = 0;
    v43 = 0;
    v41 = v174;
LABEL_83:
    v175 = v87;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412290;
      *(_QWORD *)&v190[4] = v178;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@", v190, 0xCu);
    }
    sub_10000BC5C(v178);
    v188[0] = CFSTR("DiskImageMountPath");
    v188[1] = CFSTR("DiskImageType");
    v189[0] = v41;
    v189[1] = v6;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v189, v188, 2));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v190 = 138412546;
      *(_QWORD *)&v190[4] = CFSTR("com.apple.mobile.disk_image_mounted");
      v191 = 2112;
      v192 = v38;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@ (%@)", v190, 0x16u);
    }
    sub_10000BBD0(CFSTR("com.apple.mobile.disk_image_mounted"), v38);
    v88 = v175;
    goto LABEL_88;
  }
  v107 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to mount %@."), v179);
  if (v36)
  {
    v108 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v107, v36));

    v107 = (__CFString *)v108;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v199 = v107;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v112 = sub_100013988((uint64_t)"handle_mount_disk_image", 381, -2, v36, CFSTR("Failed to mount %@."), v109, v110, v111, (uint64_t)v179);
  v113 = objc_claimAutoreleasedReturnValue(v112);

  v37 = 0;
  v38 = 0;
  v40 = 0;
  v42 = 0;
  v43 = 0;
  v36 = (id)v113;
  v41 = v174;
LABEL_25:
  if (v36)
  {
    if (v37)
      sub_100012BB0(v41, 0);
    if (v41 && v40 && (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("Cryptex")) & 1) == 0)
    {
      unmount((const char *)objc_msgSend(objc_retainAutorelease(v41), "fileSystemRepresentation"), 0x80000);
      sub_10000D708((const char *)objc_msgSend(objc_retainAutorelease(v40), "fileSystemRepresentation"));
    }
    if (objc_msgSend(v39, "isEqualToString:", CFSTR("DeveloperDiskImage")))
      sub_100012424(v39, 0);
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v36, "description"));
  }

}

void sub_1000060AC(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  __CFString *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  id v17;
  int v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  __CFString *v30;
  id v31;
  void *v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  char v47;
  __CFString *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  _BOOL8 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __CFString *v82;
  int v83;
  int *v84;
  char *v85;
  int *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  void *v93;
  const char *v94;
  uint32_t v95;
  int v96;
  int *v97;
  char *v98;
  uint64_t v99;
  __CFString *v100;
  id v101;
  uint8_t buf[4];
  const __CFString *v103;
  __int16 v104;
  _QWORD v105[3];

  if (a1)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("MountPath"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
    v6 = sub_1000131B0(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    if (v7)
    {
      v8 = sub_100016AEC(v5, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if (v9)
      {
        v10 = v9;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DiskImageType")));
        v12 = v11;
        if (v11)
        {
          v13 = sub_1000131B0(v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

          if (!v14)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query disk image type.", buf, 2u);
            }
            v58 = sub_100013988((uint64_t)"handle_unmount", 539, -2, 0, CFSTR("Failed to query disk image type."), v55, v56, v57, v99);
            v25 = (id)objc_claimAutoreleasedReturnValue(v58);
            goto LABEL_41;
          }
        }
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("Cryptex")))
        {
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CryptexName"))));
          v16 = cryptex_uninstall_4MSM(objc_msgSend(v15, "UTF8String"), 1);

          if (v16)
          {
            v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CryptexName"))));
            v18 = cryptex_uninstall_4MSM(objc_msgSend(v17, "UTF8String"), 0);

            if (v18)
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CryptexName")));
                *(_DWORD *)buf = 138412802;
                v103 = v19;
                v104 = 1024;
                LODWORD(v105[0]) = v18;
                WORD2(v105[0]) = 2080;
                *(_QWORD *)((char *)v105 + 6) = strerror(v18);
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to uninstall cryptex (%@): %d (%s)", buf, 0x1Cu);

              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CryptexName")));
              strerror(v18);
              v24 = sub_100013988((uint64_t)"handle_unmount", 551, -2, 0, CFSTR("Failed to uninstall cryptex (%@): %d (%s)"), v21, v22, v23, (uint64_t)v20);
              v25 = (id)objc_claimAutoreleasedReturnValue(v24);

LABEL_41:
              v30 = 0;
              v31 = 0;
              v32 = 0;
              v33 = 0;
              goto LABEL_22;
            }
          }
          v30 = 0;
          v31 = 0;
          v25 = 0;
          v32 = 0;
          v33 = 0;
          goto LABEL_43;
        }
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DeviceNode")));
        v41 = sub_1000131B0(v33);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

        if (v42)
        {
          v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("BackingImage")));
          v43 = sub_1000131B0(v31);
          v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

          if (v44)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FilesystemType")));
            v45 = sub_1000131B0(v32);
            v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

            if (v46)
            {
              if (sub_10000A4F8(v5))
              {
                if (sub_1000128A0())
                {
                  v101 = 0;
                  v47 = sub_100012BB0(v5, &v101);
                  v25 = v101;
                  if ((v47 & 1) == 0)
                  {
                    v48 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to unregister apps."));
                    if (v25)
                    {
                      v99 = (uint64_t)v48;
                      v49 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

                      v48 = (__CFString *)v49;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      v103 = v48;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
                    }
                    v53 = sub_100013988((uint64_t)"handle_unmount", 584, -2, v25, CFSTR("Failed to unregister apps."), v50, v51, v52, v99);
                    v54 = objc_claimAutoreleasedReturnValue(v53);

                    v30 = 0;
                    v25 = (id)v54;
                    goto LABEL_22;
                  }
                }
                else
                {
                  v25 = 0;
                }
                v82 = objc_retainAutorelease(v5);
                if (unmount((const char *)-[__CFString fileSystemRepresentation](v82, "fileSystemRepresentation"), 0x80000))
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v83 = *__error();
                    v84 = __error();
                    v85 = strerror(*v84);
                    *(_DWORD *)buf = 138412802;
                    v103 = v82;
                    v104 = 1024;
                    LODWORD(v105[0]) = v83;
                    WORD2(v105[0]) = 2080;
                    *(_QWORD *)((char *)v105 + 6) = v85;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force unmount %@: %d (%s)", buf, 0x1Cu);
                  }
                  __error();
                  v86 = __error();
                  strerror(*v86);
                  v90 = sub_100013988((uint64_t)"handle_unmount", 591, -2, 0, CFSTR("Failed to force unmount %@: %d (%s)"), v87, v88, v89, (uint64_t)v82);
                  v91 = objc_claimAutoreleasedReturnValue(v90);

                  v30 = 0;
                  v25 = (id)v91;
                  goto LABEL_65;
                }
                if ((-[__CFString hasPrefix:](v82, "hasPrefix:", CFSTR("/System/Volumes/FieldService")) & 1) != 0
                  || (-[__CFString hasPrefix:](v82, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceDiagnostic")) & 1) != 0|| (-[__CFString hasPrefix:](v82, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceRepair")) & 1) != 0|| (-[__CFString hasPrefix:](v82, "hasPrefix:", CFSTR("/Developer")) & 1) != 0|| (-[__CFString hasPrefix:](v82, "hasPrefix:", CFSTR("/System/Developer")) & 1) != 0|| (v100 = objc_retainAutorelease(v82), rmdir((const char *)-[__CFString fileSystemRepresentation](v100, "fileSystemRepresentation")) != -1))
                {
                  if (!objc_msgSend(v32, "isEqualToString:", CFSTR("apfs")))
                  {
                    v30 = 0;
                    goto LABEL_76;
                  }
                  v92 = sub_100012DFC(v33);
                  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
                  if (v93)
                  {
                    v30 = v93;

                    v33 = v30;
LABEL_76:
                    v33 = objc_retainAutorelease(v33);
                    sub_10000D708((const char *)-[__CFString fileSystemRepresentation](v33, "fileSystemRepresentation"));
                    v31 = objc_retainAutorelease(v31);
                    unlink((const char *)objc_msgSend(v31, "UTF8String"));
LABEL_43:
                    v59 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
                    if (v59)
                      sub_10001E370(v59, v60, v61, v62, v63, v64, v65, v66);
                    sub_10000BC5C(CFSTR("com.apple.mobile.storage_unmounted"));
                    CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));
                    goto LABEL_22;
                  }
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_80:
                    v30 = 0;
LABEL_65:
                    v5 = v82;
                    goto LABEL_22;
                  }
                  *(_DWORD *)buf = 138412290;
                  v103 = v33;
                  v94 = "Failed to copy APFS volume partition for %@.";
                  v95 = 12;
                }
                else
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v30 = 0;
                    v5 = v100;
                    goto LABEL_22;
                  }
                  v96 = *__error();
                  v97 = __error();
                  v98 = strerror(*v97);
                  *(_DWORD *)buf = 138412802;
                  v82 = v100;
                  v103 = v100;
                  v104 = 1024;
                  LODWORD(v105[0]) = v96;
                  WORD2(v105[0]) = 2080;
                  *(_QWORD *)((char *)v105 + 6) = v98;
                  v94 = "Failed to remove %@: %d (%s)";
                  v95 = 28;
                }
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v94, buf, v95);
                goto LABEL_80;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to unload launchd jobs.", buf, 2u);
              }
              v78 = sub_100013988((uint64_t)"handle_unmount", 578, -2, 0, CFSTR("Failed to unload launchd jobs."), v79, v80, v81, v99);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v103 = CFSTR("FilesystemType");
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not extract %@ from map entry", buf, 0xCu);
              }
              v78 = sub_100013988((uint64_t)"handle_unmount", 572, -2, 0, CFSTR("Could not extract %@ from map entry"), v75, v76, v77, (uint64_t)CFSTR("FilesystemType"));
            }
            v25 = (id)objc_claimAutoreleasedReturnValue(v78);
            v30 = 0;
            goto LABEL_22;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query backing image path.", buf, 2u);
          }
          v74 = sub_100013988((uint64_t)"handle_unmount", 566, -2, 0, CFSTR("Failed to query backing image path."), v71, v72, v73, v99);
          v25 = (id)objc_claimAutoreleasedReturnValue(v74);
          v30 = 0;
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v103 = CFSTR("DeviceNode");
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Could not extract %@ from map entry", buf, 0xCu);
          }
          v70 = sub_100013988((uint64_t)"handle_unmount", 560, -2, 0, CFSTR("Could not extract %@ from map entry"), v67, v68, v69, (uint64_t)CFSTR("DeviceNode"));
          v25 = (id)objc_claimAutoreleasedReturnValue(v70);
          v30 = 0;
          v31 = 0;
        }
        v32 = 0;
        goto LABEL_22;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v103 = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There is no matching entry in the device map for %@.", buf, 0xCu);
      }
      v37 = sub_100013988((uint64_t)"handle_unmount", 532, -2, 0, CFSTR("There is no matching entry in the device map for %@."), v38, v39, v40, (uint64_t)v5);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v103 = CFSTR("MountPath");
        v104 = 2112;
        v105[0] = v5;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      v37 = sub_100013988((uint64_t)"handle_unmount", 525, -3, 0, CFSTR("Invalid value for %@: %@"), v34, v35, v36, (uint64_t)CFSTR("MountPath"));
    }
    v25 = (id)objc_claimAutoreleasedReturnValue(v37);
    v30 = 0;
    v12 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v10 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
  }
  v29 = sub_100013988((uint64_t)"handle_unmount", 518, -3, 0, CFSTR("Invalid input(s)"), v26, v27, v28, v99);
  v25 = (id)objc_claimAutoreleasedReturnValue(v29);
  v30 = 0;
  v12 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v10 = 0;
  v5 = 0;
LABEL_22:
  if (v25)
  {
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v25, "description"));
  }

}

void sub_100006C08(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  __CFString *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  int *v12;
  char *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  char *v38;

  v32 = 2;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v23 = sub_100013988((uint64_t)"handle_sync", 665, -3, 0, CFSTR("Invalid input(s)"), v20, v21, v22, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v10 = 0;
    v5 = 0;
    if (!v19)
      goto LABEL_25;
LABEL_22:
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v19, "description"));

    goto LABEL_25;
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("MountPath"));
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(Value);
  v6 = sub_1000131B0(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = CFSTR("MountPath");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to extract %@ from request", buf, 0xCu);
    }
    v27 = sub_100013988((uint64_t)"handle_sync", 672, -3, 0, CFSTR("Failed to extract %@ from request"), v24, v25, v26, (uint64_t)CFSTR("MountPath"));
LABEL_21:
    v19 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v10 = 0;
    if (!v19)
      goto LABEL_25;
    goto LABEL_22;
  }
  v8 = sub_100016AEC(v5, 1);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "There is no matching entry for %@.", buf, 0xCu);
    }
    v27 = sub_100013988((uint64_t)"handle_sync", 679, -2, 0, CFSTR("There is no matching entry for %@."), v28, v29, v30, (uint64_t)v5);
    goto LABEL_21;
  }
  v10 = (void *)v9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E3A4();
  v5 = objc_retainAutorelease(v5);
  if (!fsctl((const char *)-[__CFString UTF8String](v5, "UTF8String"), 0x80004101uLL, &v32, 4u))
  {
    CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *__error();
    v12 = __error();
    v13 = strerror(*v12);
    *(_DWORD *)buf = 138412802;
    v34 = v5;
    v35 = 1024;
    v36 = v11;
    v37 = 2080;
    v38 = v13;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force the sync %@: %d (%s)", buf, 0x1Cu);
  }
  __error();
  v14 = __error();
  strerror(*v14);
  v18 = sub_100013988((uint64_t)"handle_sync", 687, -2, 0, CFSTR("Failed to force the sync %@: %d (%s)"), v15, v16, v17, (uint64_t)v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  if (v19)
    goto LABEL_22;
LABEL_25:

}

void sub_100006FB8(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  void *v6;
  id v7;
  void *v8;
  const void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFString *v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint8_t buf[4];
  const __CFString *v61;
  __int16 v62;
  void *v63;
  _OWORD v64[28];
  uint64_t v65;

  v58 = 0;
  v59 = 0;
  v65 = 0;
  memset(v64, 0, sizeof(v64));
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v26 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 793, -3, 0, CFSTR("Invalid input(s)"), v23, v24, v25, v56);
    v15 = (id)objc_claimAutoreleasedReturnValue(v26);
    v6 = 0;
LABEL_18:
    v16 = 0;
    if (!v15)
      goto LABEL_36;
    goto LABEL_33;
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("PersonalizedImageType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v7 = sub_1000131B0(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v61 = CFSTR("PersonalizedImageType");
      v62 = 2112;
      v63 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v30 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 799, -3, 0, CFSTR("Invalid value for %@: %@"), v27, v28, v29, (uint64_t)CFSTR("PersonalizedImageType"));
    v15 = (id)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_18;
  }
  v9 = CFDictionaryGetValue(theDict, CFSTR("ImageSignature"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = sub_100013208(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v61 = CFSTR("ImageSignature");
      v62 = 2112;
      v63 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
    }
    v34 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 805, -3, 0, CFSTR("Invalid value for %@: %@"), v31, v32, v33, (uint64_t)CFSTR("ImageSignature"));
    v15 = (id)objc_claimAutoreleasedReturnValue(v34);

    goto LABEL_18;
  }
  v57 = 0;
  v13 = sub_1000115DC(v6, &v57);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = v57;
  if (!v14)
  {
    v35 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to find a cached manifest (im4m) for variant %@ (personalization required)."), v6);
    if (v15)
    {
      v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v35, v15));

      v35 = (__CFString *)v36;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v40 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 811, -2, v15, CFSTR("Failed to find a cached manifest (im4m) for variant %@ (personalization required)."), v37, v38, v39, (uint64_t)v6);
    v41 = objc_claimAutoreleasedReturnValue(v40);

    v16 = 0;
LABEL_32:
    v15 = (id)v41;
    if (!v41)
      goto LABEL_36;
    goto LABEL_33;
  }
  v16 = objc_retainAutorelease(v14);
  inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v16, "bytes"), (uint64_t)objc_msgSend(v16, "length"), (uint64_t)v64);
  if ((_DWORD)inited)
  {
    v18 = inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to init img4 manifest: %d", buf, 8u);
    }
    v22 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 817, -2, 0, CFSTR("Failed to init img4 manifest: %d"), v19, v20, v21, v18);
    goto LABEL_30;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v64, 1885629799, 1145525076, &v59, &v58);
  if ((_DWORD)v42)
  {
    v43 = v42;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
    }
    v47 = CFSTR("Failed to retrieve data from manifest: %d");
    v56 = v43;
    v48 = 825;
LABEL_29:
    v22 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", v48, -2, 0, v47, v44, v45, v46, v56);
LABEL_30:
    v41 = objc_claimAutoreleasedReturnValue(v22);

LABEL_31:
    goto LABEL_32;
  }
  v49 = objc_alloc((Class)NSData);
  v50 = objc_msgSend(v49, "initWithBytes:length:", v59, v58);
  if (!v50)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    v47 = CFSTR("Failed to create data.");
    v48 = 831;
    goto LABEL_29;
  }
  v51 = v50;
  if ((objc_msgSend(v10, "isEqualToData:", v50) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Existing manifest's digest does not match.", buf, 2u);
    }
    v55 = sub_100013988((uint64_t)"handle_copy_personalization_manifest", 836, -2, 0, CFSTR("Existing manifest's digest does not match."), v52, v53, v54, v56);
    v41 = objc_claimAutoreleasedReturnValue(v55);

    goto LABEL_31;
  }
  CFDictionarySetValue(a3, CFSTR("ImageSignature"), v16);
  CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));

  if (!v15)
    goto LABEL_36;
LABEL_33:
  if (!CFDictionaryGetValue(a3, CFSTR("Error")))
    CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
  CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v15, "description"));
LABEL_36:

}

void sub_10000764C(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  void *v32;

  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v15 = sub_100013988((uint64_t)"handle_copy_personalization_nonce", 865, -3, 0, CFSTR("Invalid input(s)"), v12, v13, v14, v27);
    v11 = (id)objc_claimAutoreleasedReturnValue(v15);
    v6 = 0;
LABEL_19:
    v10 = 0;
    if (!v11)
      goto LABEL_23;
    goto LABEL_20;
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("PersonalizedImageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = v5;
  if (v5)
  {
    v7 = sub_1000131B0(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v30 = CFSTR("PersonalizedImageType");
        v31 = 2112;
        v32 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      v26 = sub_100013988((uint64_t)"handle_copy_personalization_nonce", 871, -3, 0, CFSTR("Invalid value for %@: %@"), v23, v24, v25, (uint64_t)CFSTR("PersonalizedImageType"));
      v11 = (id)objc_claimAutoreleasedReturnValue(v26);
      goto LABEL_19;
    }
  }
  v28 = 0;
  v9 = sub_10001078C(v6, &v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v28;
  if (v10)
  {
    CFDictionarySetValue(a3, CFSTR("PersonalizationNonce"), v10);
    CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));
    if (!v11)
      goto LABEL_23;
    goto LABEL_20;
  }
  v16 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy personalization nonce."));
  if (v11)
  {
    v27 = (uint64_t)v16;
    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

    v16 = (__CFString *)v17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v21 = sub_100013988((uint64_t)"handle_copy_personalization_nonce", 877, -2, v11, CFSTR("Failed to copy personalization nonce."), v18, v19, v20, v27);
  v22 = objc_claimAutoreleasedReturnValue(v21);

  v10 = 0;
  v11 = (id)v22;
  if (v22)
  {
LABEL_20:
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v11, "description"));
  }
LABEL_23:

}

void sub_100007984(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  __CFDictionary *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[8];
  _QWORD v46[8];
  uint8_t buf[4];
  _BYTE v48[18];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v49 = 0u;
  if (a1)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("PersonalizedImageType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
    v6 = v5;
    if (v5)
    {
      v7 = sub_1000131B0(v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      if (!v8)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v48 = CFSTR("PersonalizedImageType");
          *(_WORD *)&v48[8] = 2112;
          *(_QWORD *)&v48[10] = v6;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
        }
        v12 = sub_100013988((uint64_t)"handle_copy_personalization_identifiers", 919, -3, 0, CFSTR("Invalid value for %@: %@"), v9, v10, v11, (uint64_t)CFSTR("PersonalizedImageType"));
        v13 = (id)objc_claimAutoreleasedReturnValue(v12);
        v14 = 0;
        if (!v13)
          goto LABEL_27;
        goto LABEL_23;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No disk image variant specified, assuming not the DDI.", buf, 2u);
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IODeviceTree"), "stringByAppendingString:", CFSTR(":/chosen")));
    v20 = sub_1000179D4(v19, CFSTR("esdm-fuses"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v20);

    v21 = img4_chip_select_personalized_ap();
    if (v21)
    {
      v22 = img4_chip_instantiate(v21, &v49);
      if (!(_DWORD)v22)
      {
        v45[0] = CFSTR("UniqueChipID");
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *((_QWORD *)&v51 + 1)));
        v46[0] = v44;
        v45[1] = CFSTR("ChipID");
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v51));
        v46[1] = v43;
        v45[2] = CFSTR("BoardId");
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", HIDWORD(v50)));
        v46[2] = v42;
        v45[3] = CFSTR("SecurityDomain");
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", DWORD1(v51)));
        v46[3] = v35;
        v45[4] = CFSTR("EffectiveSecurityModeAp");
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYTE3(v52)));
        v46[4] = v36;
        v45[5] = CFSTR("EffectiveProductionStatusAp");
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYTE2(v52)));
        v46[5] = v37;
        v45[6] = CFSTR("CertificateSecurityMode");
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", BYTE1(v52)));
        v46[6] = v38;
        v45[7] = CFSTR("CertificateProductionStatus");
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v52));
        v46[7] = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v46, v45, 8));
        v13 = objc_msgSend(v40, "mutableCopy");

        if (v14)
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("Ap,SikaFuse"));
        CFDictionarySetValue(a3, CFSTR("PersonalizationIdentifiers"), v13);
        v34 = CFSTR("Status");
        v32 = CFSTR("Success");
        v33 = a3;
        goto LABEL_26;
      }
      v23 = v22;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v24 = strerror(v23);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v48 = v23;
        *(_WORD *)&v48[4] = 2080;
        *(_QWORD *)&v48[6] = v24;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to instantiate chip: 0x%08x (%s)", buf, 0x12u);
      }
      strerror(v23);
      v28 = sub_100013988((uint64_t)"handle_copy_personalization_identifiers", 944, -2, 0, CFSTR("Failed to instantiate chip: 0x%08x (%s)"), v25, v26, v27, v23);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to select chip.", buf, 2u);
      }
      v28 = sub_100013988((uint64_t)"handle_copy_personalization_identifiers", 938, -2, 0, CFSTR("Failed to select chip."), v29, v30, v31, v41);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(v28);
    if (!v13)
      goto LABEL_27;
LABEL_23:
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    v32 = (const __CFString *)objc_msgSend(v13, "description");
    v33 = a3;
    v34 = CFSTR("DetailedError");
LABEL_26:
    CFDictionarySetValue(v33, v34, v32);

    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
  }
  v18 = sub_100013988((uint64_t)"handle_copy_personalization_identifiers", 912, -3, 0, CFSTR("Invalid input(s)"), v15, v16, v17, v41);
  v13 = (id)objc_claimAutoreleasedReturnValue(v18);
  v14 = 0;
  v6 = 0;
  if (v13)
    goto LABEL_23;
LABEL_27:

}

void sub_100007F0C(uint64_t a1, __CFDictionary *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;

  if (a1)
  {
    v18 = 0;
    v3 = sub_100010F78(&v18);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = v18;
    if (v4)
    {
      CFDictionarySetValue(a2, CFSTR("CryptexNonce"), v4);
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Success"));

      if (!v5)
        goto LABEL_17;
      goto LABEL_14;
    }
    v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to copy cryptex nonce."));
    if (v5)
    {
      v17 = (uint64_t)v10;
      v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v10 = (id)v11;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v15 = sub_100013988((uint64_t)"handle_copy_cryptex_nonce", 995, -2, v5, CFSTR("Failed to copy cryptex nonce."), v12, v13, v14, v17);
    v16 = objc_claimAutoreleasedReturnValue(v15);

    v5 = (id)v16;
    if (v16)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, CFSTR("Error")))
        CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
      CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v5, "description"));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v9 = sub_100013988((uint64_t)"handle_copy_cryptex_nonce", 989, -3, 0, CFSTR("Invalid input(s)"), v6, v7, v8, v17);
    v5 = (id)objc_claimAutoreleasedReturnValue(v9);
    if (v5)
      goto LABEL_14;
  }
LABEL_17:

}

void sub_100008164(uint64_t a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  const void *Value;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  void *v31;

  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v14 = sub_100013988((uint64_t)"handle_roll_personalization_nonce", 715, -3, 0, CFSTR("Invalid input(s)"), v11, v12, v13, v26);
    v10 = (id)objc_claimAutoreleasedReturnValue(v14);
    v6 = 0;
    if (!v10)
      goto LABEL_23;
LABEL_20:
    if (!CFDictionaryGetValue(a3, CFSTR("Error")))
      CFDictionarySetValue(a3, CFSTR("Error"), CFSTR("InternalError"));
    CFDictionarySetValue(a3, CFSTR("DetailedError"), objc_msgSend(v10, "description"));
    goto LABEL_23;
  }
  Value = CFDictionaryGetValue(theDict, CFSTR("PersonalizedImageType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(Value);
  v6 = v5;
  if (v5)
  {
    v7 = sub_1000131B0(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (!v8)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = CFSTR("PersonalizedImageType");
        v30 = 2112;
        v31 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@: %@", buf, 0x16u);
      }
      v25 = sub_100013988((uint64_t)"handle_roll_personalization_nonce", 721, -3, 0, CFSTR("Invalid value for %@: %@"), v22, v23, v24, (uint64_t)CFSTR("PersonalizedImageType"));
      v10 = (id)objc_claimAutoreleasedReturnValue(v25);
      if (!v10)
        goto LABEL_23;
      goto LABEL_20;
    }
  }
  v27 = 0;
  v9 = sub_100010C00(v6, &v27);
  v10 = v27;
  if (v9)
  {
    CFDictionarySetValue(a3, CFSTR("Status"), CFSTR("Success"));
    if (!v10)
      goto LABEL_23;
    goto LABEL_20;
  }
  v15 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to roll personalization nonce."));
  if (v10)
  {
    v26 = (uint64_t)v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

    v15 = (__CFString *)v16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  v20 = sub_100013988((uint64_t)"handle_roll_personalization_nonce", 726, -2, v10, CFSTR("Failed to roll personalization nonce."), v17, v18, v19, v26);
  v21 = objc_claimAutoreleasedReturnValue(v20);

  v10 = (id)v21;
  if (v21)
    goto LABEL_20;
LABEL_23:

}

void sub_100008478(uint64_t a1, __CFDictionary *a2)
{
  BOOL v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;

  if (a1)
  {
    v17 = 0;
    v3 = sub_1000112FC(&v17);
    v4 = v17;
    if (v3)
    {
      CFDictionarySetValue(a2, CFSTR("Status"), CFSTR("Success"));
      if (!v4)
        goto LABEL_17;
      goto LABEL_14;
    }
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to roll cryptex nonce."));
    if (v4)
    {
      v16 = (uint64_t)v9;
      v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

      v9 = (id)v10;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v14 = sub_100013988((uint64_t)"handle_roll_cryptex_nonce", 758, -2, v4, CFSTR("Failed to roll cryptex nonce."), v11, v12, v13, v16);
    v15 = objc_claimAutoreleasedReturnValue(v14);

    v4 = (id)v15;
    if (v15)
    {
LABEL_14:
      if (!CFDictionaryGetValue(a2, CFSTR("Error")))
        CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
      CFDictionarySetValue(a2, CFSTR("DetailedError"), objc_msgSend(v4, "description"));
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v8 = sub_100013988((uint64_t)"handle_roll_cryptex_nonce", 753, -3, 0, CFSTR("Invalid input(s)"), v5, v6, v7, v16);
    v4 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (v4)
      goto LABEL_14;
  }
LABEL_17:

}

void sub_1000086B0(uint64_t a1, __CFDictionary *a2)
{
  NSNumber *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", sub_100013754());
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    CFDictionarySetValue(a2, CFSTR("DeveloperModeStatus"), v4);
    v5 = CFSTR("Status");
    v6 = CFSTR("Success");
    v7 = a2;
LABEL_9:
    CFDictionarySetValue(v7, v5, v6);

    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s)", (uint8_t *)&v13, 2u);
  }
  v11 = sub_100013988((uint64_t)"handle_copy_developer_mode_status", 1026, -3, 0, CFSTR("Invalid input(s)"), v8, v9, v10, v13);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v12)
  {
    v4 = (void *)v12;
    if (!CFDictionaryGetValue(a2, CFSTR("Error")))
      CFDictionarySetValue(a2, CFSTR("Error"), CFSTR("InternalError"));
    v6 = (const __CFString *)objc_msgSend(v4, "description");
    v7 = a2;
    v5 = CFSTR("DetailedError");
    goto LABEL_9;
  }
}

uint64_t sub_1000087FC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000880C(uint64_t a1)
{

}

void sub_100008814(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void sub_100008828(uint64_t a1, io_iterator_t a2)
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_object_t v11;
  io_registry_entry_t v12;
  __CFDictionary *v13;
  kern_return_t v14;
  __int16 v15;
  const char *v16;
  uint32_t v17;
  const void *Value;
  void *v19;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v22;

  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v3)
    sub_10001E40C(v3, v4, v5, v6, v7, v8, v9, v10);
  v19 = (void *)os_transaction_create("com.apple.mobile.storage_mounter.xpc");
  v11 = IOIteratorNext(a2);
  if (v11)
  {
    v12 = v11;
    do
    {
      properties = 0;
      v13 = sub_100012DD8();
      if (v13)
      {
        v14 = IORegistryEntryCreateCFProperties(v12, &properties, 0, 0);
        if (v14)
        {
          v15 = v14;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v22) = v15 & 0x3FFF;
            v16 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
            v17 = 8;
LABEL_11:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v16, buf, v17);
          }
        }
        else
        {
          Value = CFDictionaryGetValue(properties, CFSTR("locationID"));
          if (Value)
          {
            CFDictionarySetValue(v13, CFSTR("LocationID"), Value);
            CFDictionarySetValue(v13, CFSTR("DeviceType"), CFSTR("PTPCamera"));
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v22 = CFSTR("com.apple.mobile.camera_attached");
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Posting notification: %@", buf, 0xCu);
            }
            sub_10000BBD0(CFSTR("com.apple.mobile.camera_attached"), v13);
            goto LABEL_18;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v22 = "locationID";
            v16 = "Failed to retrieve %s.";
            v17 = 12;
            goto LABEL_11;
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v16 = "Failed to create dictionary.";
        v17 = 2;
        goto LABEL_11;
      }
LABEL_18:
      if (properties)
        CFRelease(properties);
      properties = 0;
      if (v13)
        CFRelease(v13);
      IOObjectRelease(v12);
      v12 = IOIteratorNext(a2);
    }
    while (v12);
  }

}

void sub_100008AE0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100008B08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

id sub_100008B28(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;

  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("/private/var")))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("/")));
    v3 = objc_msgSend(v2, "mutableCopy");

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
    v5 = objc_msgSend(v4, "isEqualToString:", &stru_10002F6C8);

    if (v5)
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsJoinedByString:", CFSTR("/")));
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%@"), v6));

    v1 = (id)v7;
  }
  return v1;
}

void sub_100008C60(id a1)
{
  PlistProcessor *v1;
  void *v2;

  v1 = objc_alloc_init(PlistProcessor);
  v2 = (void *)qword_100034878;
  qword_100034878 = (uint64_t)v1;

}

id sub_1000091D8(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint8_t buf[4];
  void *v14;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ProgramArguments")));
  if (!v2)
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Program")));
  v3 = sub_100013158(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {

  }
  else
  {
    v5 = sub_1000131B0(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v2;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected object: %@", buf, 0xCu);
      }
      v11 = 0;
      goto LABEL_11;
    }
  }
  v7 = sub_100013158(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = objc_msgSend(v2, "mutableCopy");
LABEL_10:
    v11 = v9;
    goto LABEL_11;
  }
  v10 = sub_1000131B0(v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v2, 0);
    goto LABEL_10;
  }
LABEL_11:

  return v11;
}

void sub_100009994(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

id sub_1000099C0(void *a1)
{
  _xpc_connection_s *v1;
  uint64_t pid;
  int v3;
  void *v5;
  uint8_t buf[16];
  _OWORD v8[16];
  char buffer[4096];

  v1 = a1;
  bzero(buffer, 0x1000uLL);
  memset(v8, 0, sizeof(v8));
  if (v1)
  {
    pid = xpc_connection_get_pid(v1);
    proc_pidpath(pid, buffer, 0x1000u);
    v3 = strlen(buffer);
    if ((v3 & 0x80000000) == 0)
    {
      while (buffer[v3] != 47)
      {
        if (v3-- <= 0)
        {
          v3 = -1;
          break;
        }
      }
    }
    __strcpy_chk(v8, &buffer[v3 + 1], 256);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s<%d>"), v8, pid));
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

BOOL sub_100009B38(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  const __CFString *v10;
  _QWORD v11[4];
  __CFString *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint8_t buf[4];
  const __CFString *v19;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (v3 && v4)
  {
    v6 = (void *)xpc_connection_copy_entitlement_value(v3, objc_msgSend(CFSTR("com.apple.private.mobile_storage.allowedSPI"), "UTF8String"));
    v7 = v6;
    if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_array)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100009D78;
      v11[3] = &unk_10002CE40;
      v10 = v5;
      v12 = (__CFString *)v10;
      v13 = &v14;
      xpc_array_apply(v7, v11);

      if (!*((_BYTE *)v15 + 24) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v10;
        goto LABEL_7;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("com.apple.private.mobile_storage.allowedSPI");
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid or missing entitlement: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid inputs.", buf, 2u);
    }
    v7 = 0;
  }
  v8 = *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_100009D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100009D78(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  const char *string_ptr;
  _BOOL8 v6;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation")))*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  v6 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;

  return v6;
}

uint64_t sub_100009E0C(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t mounted_jetsam_properties;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v17;

  v3 = a1;
  v7 = v3;
  if (v3)
  {
    mounted_jetsam_properties = launch_load_mounted_jetsam_properties(objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    if (!(_DWORD)mounted_jetsam_properties)
    {
      v14 = 0;
      v15 = 1;
      goto LABEL_9;
    }
    v9 = mounted_jetsam_properties;
    strerror(mounted_jetsam_properties);
    v13 = sub_100013988((uint64_t)"loadLaunchdJetsamPropertiesForMountPoint", 302, -2, 0, CFSTR("Failed to load mounted jetsam properties: %d (%s)"), v10, v11, v12, v9);
  }
  else
  {
    v13 = sub_100013988((uint64_t)"loadLaunchdJetsamPropertiesForMountPoint", 296, -3, 0, CFSTR("Invalid input."), v4, v5, v6, v17);
  }
  v14 = (id)objc_claimAutoreleasedReturnValue(v13);
  if (a2)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    *a2 = v14;
  }
  else
  {
    v15 = 0;
  }
LABEL_9:

  return v15;
}

BOOL sub_100009ED8(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  void *context;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _BYTE v30[128];

  v3 = a1;
  v17 = a2;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  context = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR("/Library/LaunchDaemons")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR("/System/Library/LaunchDaemons")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v3, CFSTR("/AppleInternal/Library/LaunchDaemons")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, 0));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v8);
      v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v11);
      v13 = objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000A1A0;
      v18[3] = &unk_10002CE68;
      v19 = v3;
      v20 = v17;
      v21 = &v26;
      objc_msgSend((id)v13, "scanPlistsAtPath:execBlock:", v12, v18);

      LOBYTE(v13) = *((_BYTE *)v27 + 24) == 0;
      if ((v13 & 1) != 0)
        break;
      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_autoreleasePoolPop(context);
  v14 = *((_BYTE *)v27 + 24) != 0;
  _Block_object_dispose(&v26, 8);

  return v14;
}

void sub_10000A170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A1A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  const __CFDictionary *v16;
  void *v17;
  int v18;
  _BOOL4 v19;
  uint64_t v20;
  id v22;
  id v23;
  id v24;
  CFErrorRef outError;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  CFErrorRef v31;

  v5 = a2;
  v6 = a3;
  outError = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
  v8 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  v9 = objc_msgSend(v7, "verifyPlist:forMountPoint:withError:", v5, v8, &v24);
  v10 = v24;

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Label")));
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Personalized"))
      && objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", CFSTR("/private/var/personalized_factory")))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
      v13 = *(_QWORD *)(a1 + 32);
      v23 = v10;
      v14 = objc_msgSend(v12, "copyAndFixPlist:forMountPoint:withError:", v5, v13, &v23);
      v15 = v23;

      if (!v14)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_10001E6C8();
        goto LABEL_20;
      }
      v10 = v15;
    }
    else
    {
      v14 = v5;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
    v22 = v10;
    v16 = (const __CFDictionary *)objc_msgSend(v17, "copyPlistWithMSMKeys:withError:", v14, &v22);
    v15 = v22;

    if (v16)
    {
      v18 = SMJobSubmit(0, v16, 0, &outError);
      v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          *(_DWORD *)buf = 138412290;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registered launchd job: %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      if (v19)
      {
        *(_DWORD *)buf = 138412802;
        v27 = v11;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = outError;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to register launchd job '%@' (%@): %@", buf, 0x20u);
      }
LABEL_21:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      v28 = 2114;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to add MobileStorageMounter keys to job %{public}@: %{public}@", buf, 0x16u);
    }
LABEL_20:
    v16 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_10001E730();
  v11 = 0;
  v16 = 0;
  v15 = v10;
LABEL_22:
  if (outError)
    CFRelease(outError);
  outError = 0;
  v20 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  return v20;
}

BOOL sub_10000A4F8(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  void *context;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;

  v1 = a1;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 1;
  v2 = sub_100008B28(v1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v16)
  {
    context = objc_autoreleasePoolPush();
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v1, CFSTR("/Library/LaunchDaemons")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v1, CFSTR("/System/Library/LaunchDaemons")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v1, CFSTR("/AppleInternal/Library/LaunchDaemons")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, v4, v5, 0));

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v22;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10);
        v12 = objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10000A81C;
        v17[3] = &unk_10002CE68;
        v18 = v1;
        v19 = v16;
        v20 = &v25;
        objc_msgSend((id)v12, "scanPlistsAtPath:execBlock:", v11, v17);

        LOBYTE(v12) = *((_BYTE *)v26 + 24) == 0;
        if ((v12 & 1) != 0)
          break;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_autoreleasePoolPop(context);
    v13 = *((_BYTE *)v26 + 24) != 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to normalize mount point (%@)", buf, 0xCu);
    }
    v13 = 0;
    *((_BYTE *)v26 + 24) = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v13;
}

void sub_10000A7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A81C(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  void *v7;
  unsigned __int8 v8;
  __CFString *v9;
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  const char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFErrorRef outError;
  uint8_t buf[4];
  __CFString *v26;

  v5 = a2;
  v6 = a3;
  outError = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
  v8 = objc_msgSend(v7, "verifyPlist:forMountPoint:withError:", v5, a1[4], 0);

  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to verify %@. Skipping unload.", buf, 0xCu);
    }
    v9 = 0;
    goto LABEL_11;
  }
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Label")));
  v10 = SMJobCopyDictionary(0, v9);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Job '%@' is not currently loaded. Skipping unload.", buf, 0xCu);
    }
LABEL_11:
    v12 = 0;
    v11 = 0;
    goto LABEL_12;
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", CFSTR("Program")));
  if ((objc_msgSend(v12, "hasPrefix:", a1[5]) & 1) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor"));
    v14 = objc_msgSend(v13, "jobIsManagedByMSM:", v11);

    if ((v14 & 1) == 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
      *(_DWORD *)buf = 138412290;
      v26 = v9;
      v15 = "Job '%@' was not loaded by MobileStorageMounter. Skipping unload.";
      goto LABEL_22;
    }
  }
  if (SMJobRemove(0, v9, 0, 1u, &outError))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v26 = v9;
    v15 = "Removed launchd job: %@";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_10001E798((uint64_t)v9, (uint64_t)&outError, v18, v19, v20, v21, v22, v23);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
LABEL_12:
  if (outError)
    CFRelease(outError);
  outError = 0;
  v16 = *(unsigned __int8 *)(*(_QWORD *)(a1[6] + 8) + 24);

  return v16;
}

uint64_t sub_10000AAF8(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  uint64_t v3;
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  const char *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  const __CFString *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      v30 = "Invalid input.";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v36, 2u);
    }
LABEL_22:
    v13 = 0;
    v6 = 0;
    v4 = 0;
LABEL_23:
    v8 = 0;
LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  v3 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/SystemVersion.plist")));
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      v30 = "Failed to create string.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v4 = (__CFString *)v3;
  v5 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v3);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138412290;
      v37 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", (uint8_t *)&v36, 0xCu);
    }
    v13 = 0;
    v6 = 0;
    goto LABEL_23;
  }
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ProductVersion")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(".")));

  v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v9)
    {
      v36 = 138412290;
      v37 = CFSTR("/System/Library/CoreServices/SystemVersion.plist");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve disk image product version from %@.", (uint8_t *)&v36, 0xCu);
    }
    v13 = 0;
    goto LABEL_23;
  }
  if (v9)
  {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
    v36 = 138412546;
    v37 = v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk Image Product Version: %@.%@", (uint8_t *)&v36, 0x16u);

  }
  v12 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/System/Library/CoreServices/SystemVersion.plist"));
  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = 138412290;
      v37 = CFSTR("/System/Library/CoreServices/SystemVersion.plist");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", (uint8_t *)&v36, 0xCu);
    }
    v13 = 0;
    goto LABEL_24;
  }
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ProductVersion")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(".")));

  v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (!v15)
  {
    if (v16)
    {
      v36 = 138412290;
      v37 = CFSTR("/System/Library/CoreServices/SystemVersion.plist");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve system product version from %@.", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_24;
  }
  if (v16)
  {
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
    v36 = 138412546;
    v37 = v17;
    v38 = 2112;
    v39 = v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System Product Version: %@.%@", (uint8_t *)&v36, 0x16u);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if ((v21 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_43;
    goto LABEL_25;
  }
  v22 = 1;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 1));
  v25 = objc_msgSend(v23, "isEqualToString:", v24);

  if ((v25 & 1) != 0)
    goto LABEL_26;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 0));
  if (!objc_msgSend(v26, "isEqualToString:", CFSTR("16")))
  {
LABEL_41:

    goto LABEL_42;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", 1));
  if (objc_msgSend(v27, "compare:options:", CFSTR("4"), 64) == (id)-1)
  {

    goto LABEL_41;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 1));
  v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("4"));

  v22 = 1;
  if ((v29 & 1) == 0)
  {
LABEL_42:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_43:
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 0));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", 1));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 1));
      v36 = 138413314;
      v37 = v2;
      v38 = 2112;
      v39 = v32;
      v40 = 2112;
      v41 = v33;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System Version Mismatch for %@: (System: %@.%@ / Image: %@.%@)", (uint8_t *)&v36, 0x34u);

    }
LABEL_25:
    v22 = 0;
  }
LABEL_26:

  return v22;
}

uint64_t sub_10000B1BC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  id v7;
  const char *v8;
  uint32_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  id v30;

  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v4 = 0;
LABEL_10:
      v10 = 0;
LABEL_11:
      v11 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v8 = "Invalid input.";
    v9 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    goto LABEL_9;
  }
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/System/Library/CoreServices/SystemVersion.plist")));
  if (v3)
  {
    v4 = (void *)v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v5 = 0;
    v6 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  v14 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", 0);
  if (!v14)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 138412290;
    v28 = 0;
    v8 = "Failed to load %@.";
    v9 = 12;
    goto LABEL_8;
  }
  v5 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ProductVersion")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "componentsSeparatedByString:", CFSTR(".")));

  if (!v10 || objc_msgSend(v10, "count") != (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = CFSTR("/System/Library/CoreServices/SystemVersion.plist");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve disk image product version from %@.", buf, 0xCu);
    }
    v6 = 0;
    v7 = 0;
    v4 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
    *(_DWORD *)buf = 138412546;
    v28 = v16;
    v29 = 2112;
    v30 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk Image Product Version: %@.%@", buf, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1000344B8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsSeparatedByString:", CFSTR(".")));

  if (v11 && objc_msgSend(v11, "count") == (id)2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
      *(_DWORD *)buf = 138412546;
      v28 = v19;
      v29 = 2112;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Required Disk Image Product Version: %@.%@", buf, 0x16u);

    }
    v21 = objc_alloc((Class)NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));
    v12 = 1;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 1));
    v7 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@.%@"), v22, v23);

    v24 = objc_alloc((Class)NSString);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 1));
    v6 = (__CFString *)objc_msgSend(v24, "initWithFormat:", CFSTR("%@.%@"), v25, v26);

    if (objc_msgSend(v7, "compare:options:", v6, 64) != (id)1)
    {
      v4 = 0;
      goto LABEL_13;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v6;
      v29 = 2112;
      v30 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current DDI version (%@) is lower than OS version (%@).", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve required DDI version.", buf, 2u);
    }
    v6 = 0;
    v7 = 0;
  }
  v4 = 0;
LABEL_12:
  v12 = 0;
LABEL_13:

  return v12;
}

uint64_t sub_10000B6F4(void *a1)
{
  id v1;
  void *v2;
  id v3;
  const char *v4;
  int v5;
  int *v6;
  char *v7;
  uint64_t v8;
  int v9;
  int *v10;
  char *v11;
  const char *v12;
  uint32_t v13;
  FTS *v14;
  FTSENT *v15;
  FTSENT *v16;
  char v17;
  char *fts_path;
  int v19;
  int *v20;
  char *v21;
  int v22;
  int *v23;
  char *v24;
  stat v26;
  uint8_t buf[4];
  _BYTE v28[24];
  char *v29[2];

  v1 = a1;
  v2 = v1;
  memset(&v26, 0, sizeof(v26));
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    if (lstat(v4, &v26))
    {
      if (*__error() != 2
        || (objc_msgSend(v3, "hasPrefix:", CFSTR("/System/Volumes/FieldService")) & 1) != 0
        || (objc_msgSend(v3, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceDiagnostic")) & 1) != 0
        || (objc_msgSend(v3, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceRepair")) & 1) != 0
        || (objc_msgSend(v3, "hasPrefix:", CFSTR("/Developer")) & 1) != 0
        || (objc_msgSend(v3, "hasPrefix:", CFSTR("/System/Developer")) & 1) != 0)
      {
        goto LABEL_12;
      }
      if (mkdir(v4, 0x1EDu))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v5 = *__error();
          v6 = __error();
          v7 = strerror(*v6);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v5;
          *(_WORD *)&v28[14] = 2080;
          *(_QWORD *)&v28[16] = v7;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %d (%s)", buf, 0x1Cu);
        }
LABEL_12:
        v8 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *__error();
          v10 = __error();
          v11 = strerror(*v10);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)v28 = v4;
          *(_WORD *)&v28[8] = 1024;
          *(_DWORD *)&v28[10] = v9;
          *(_WORD *)&v28[14] = 2080;
          *(_QWORD *)&v28[16] = v11;
          v12 = "Failed to lstat %s: %d (%s)";
          v13 = 28;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
          v8 = 0;
          goto LABEL_40;
        }
        goto LABEL_40;
      }
LABEL_41:
      v8 = 1;
      goto LABEL_40;
    }
    if ((v26.st_mode & 0xF000) == 0x4000)
    {
      v29[0] = (char *)v4;
      v29[1] = 0;
      v14 = fts_open(v29, 17, 0);
      v8 = (uint64_t)v14;
      if (v14)
      {
        v15 = fts_read(v14);
        if (v15)
        {
          v16 = v15;
          v17 = 1;
          do
          {
            if (strcmp(v16->fts_path, v4))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              {
                fts_path = v16->fts_path;
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)v28 = v4;
                *(_WORD *)&v28[8] = 2080;
                *(_QWORD *)&v28[10] = fts_path;
                _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Mount path %s is not empty: %s", buf, 0x16u);
              }
              v17 = 0;
            }
            v16 = fts_read((FTS *)v8);
          }
          while (v16);
          if (!fts_close((FTS *)v8))
          {
            if ((v17 & 1) != 0)
              goto LABEL_41;
            v8 = 0;
            if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              goto LABEL_40;
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v28 = v4;
            v12 = "%s is not empty.";
LABEL_28:
            v13 = 12;
            goto LABEL_39;
          }
        }
        else if (!fts_close((FTS *)v8))
        {
          goto LABEL_41;
        }
        v8 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
        v22 = *__error();
        v23 = __error();
        v24 = strerror(*v23);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v28 = v22;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = v24;
        v12 = "Failed to close file traversal handle: %d (%s)";
      }
      else
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_40;
        v19 = *__error();
        v20 = __error();
        v21 = strerror(*v20);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v28 = v19;
        *(_WORD *)&v28[4] = 2080;
        *(_QWORD *)&v28[6] = v21;
        v12 = "Failed to open path for traversal: %d (%s)";
      }
      v13 = 18;
      goto LABEL_39;
    }
    v8 = 0;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_40;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v28 = v4;
    v12 = "%s is not a directory.";
    goto LABEL_28;
  }
  v8 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v12 = "Invalid input.";
    v13 = 2;
    goto LABEL_39;
  }
LABEL_40:

  return v8;
}

void sub_10000BBD0(void *a1, void *a2)
{
  id v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  __CFString *object;

  object = a1;
  v3 = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, object, object, 0, 1u);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "postNotificationName:object:userInfo:deliverImmediately:", object, CFSTR("MobileStorageMounter"), v3, 1);

  }
}

void sub_10000BC5C(void *a1)
{
  sub_10000BBD0(a1, 0);
}

id sub_10000BC64(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint32_t v13;
  int v14;
  CC_SHA1_CTX v16;
  uint8_t buf[4];
  id v18;

  v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid input.";
      v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }
LABEL_13:
    v10 = 0;
    v3 = 0;
    goto LABEL_20;
  }
  v2 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v1, *(_OWORD *)&v16.h0, *(_OWORD *)&v16.h4, *(_OWORD *)&v16.data[1], *(_OWORD *)&v16.data[5], *(_OWORD *)&v16.data[9], *(_OWORD *)&v16.data[13]));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v1;
      v12 = "Failed to create file handle for %@.";
      v13 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v3 = (void *)v2;
  CC_SHA1_Init(&v16);
  v4 = (unsigned __int8 *)malloc_type_malloc(0x14uLL, 0x4025CD4uLL);
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = objc_autoreleasePoolPush();
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readDataOfLength:", 1024)));
      CC_SHA1_Update(&v16, objc_msgSend(v7, "bytes"), (CC_LONG)objc_msgSend(v7, "length"));
      v8 = objc_msgSend(v7, "length");

      objc_autoreleasePoolPop(v6);
    }
    while (v8);
    CC_SHA1_Final(v5, &v16);
    v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v5, 20);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
    }
    v10 = 0;
  }
LABEL_20:

  return v10;
}

id sub_10000BEF4(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  const char *v12;
  uint32_t v13;
  int v14;
  CC_SHA512_CTX v16;
  uint8_t buf[4];
  id v18;

  v1 = a1;
  memset(&v16, 0, sizeof(v16));
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v12 = "Invalid input.";
      v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
    }
LABEL_13:
    v10 = 0;
    v3 = 0;
    goto LABEL_20;
  }
  v2 = objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForReadingAtPath:](NSFileHandle, "fileHandleForReadingAtPath:", v1, *(_OWORD *)v16.count, *(_OWORD *)v16.hash, *(_OWORD *)&v16.hash[2], *(_OWORD *)&v16.hash[4], *(_OWORD *)&v16.hash[6], *(_OWORD *)v16.wbuf, *(_OWORD *)&v16.wbuf[2], *(_OWORD *)&v16.wbuf[4], *(_OWORD *)&v16.wbuf[6], *(_OWORD *)&v16.wbuf[8], *(_OWORD *)&v16.wbuf[10], *(_OWORD *)&v16.wbuf[12], *(_OWORD *)&v16.wbuf[14]));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v1;
      v12 = "Failed to create file handle for %@.";
      v13 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v3 = (void *)v2;
  CC_SHA384_Init(&v16);
  v4 = (unsigned __int8 *)malloc_type_malloc(0x30uLL, 0x61AD7283uLL);
  if (v4)
  {
    v5 = v4;
    do
    {
      v6 = objc_autoreleasePoolPush();
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readDataOfLength:", 1024)));
      CC_SHA384_Update(&v16, objc_msgSend(v7, "bytes"), (CC_LONG)objc_msgSend(v7, "length"));
      v8 = objc_msgSend(v7, "length");

      objc_autoreleasePoolPop(v6);
    }
    while (v8);
    CC_SHA384_Final(v5, &v16);
    v9 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v5, 48);
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    free(v5);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v18) = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
    }
    v10 = 0;
  }
LABEL_20:

  return v10;
}

uint64_t sub_10000C19C(void *a1, uint64_t a2, size_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  int v17;
  size_t v18;

  v5 = a1;
  v6 = v5;
  if (a2)
  {
    if (a3 == 48)
    {
      v10 = sub_10000BEF4(v5);
      v8 = objc_claimAutoreleasedReturnValue(v10);
    }
    else
    {
      if (a3 != 20)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v17 = 134217984;
          v18 = a3;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported digest size: %ld", (uint8_t *)&v17, 0xCu);
        }
LABEL_13:
        a2 = 0;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_20;
        LOWORD(v17) = 0;
        v9 = "Failed to digest data.";
        goto LABEL_15;
      }
      v7 = sub_10000BC64(v5);
      v8 = objc_claimAutoreleasedReturnValue(v7);
    }
    v11 = (void *)v8;
    if (v8)
    {
      v12 = malloc_type_malloc(a3, 0xCA816F39uLL);
      if (v12)
      {
        v13 = v12;
        v14 = objc_retainAutorelease(v11);
        memcpy(v13, objc_msgSend(v14, "bytes"), (size_t)objc_msgSend(v14, "length"));
        *(_QWORD *)a2 = v13;

        a2 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *__error();
        v17 = 67109120;
        LODWORD(v18) = v15;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", (uint8_t *)&v17, 8u);
      }

LABEL_19:
      a2 = 0;
      goto LABEL_20;
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    v9 = "Invalid input";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, 2u);
    goto LABEL_19;
  }
LABEL_20:

  return a2;
}

uint64_t sub_10000C3C0(void *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, _QWORD *a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  __CFString *v31;
  uint64_t v32;
  int v33;
  int *v34;
  id v35;
  void *v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v48;
  _QWORD v49[3];
  int __errnum;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  int v54;
  _OWORD v55[3];
  uint64_t v56;

  v11 = a1;
  v12 = a2;
  v13 = a5;
  v17 = v13;
  v54 = -1;
  v49[1] = sub_10000C734;
  v49[0] = 1;
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v56 = 0;
  memset(v55, 0, sizeof(v55));
  __errnum = 0;
  v49[2] = &__errnum;
  if (!v11 || !v12 || !a4 || !v13)
  {
    v31 = CFSTR("Invalid input(s).");
    v32 = 921;
    v33 = -3;
LABEL_15:
    v35 = sub_100013988((uint64_t)"verify_disk_image_img4_ticket", v32, v33, 0, v31, v14, v15, v16, v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v22 = 0;
LABEL_24:
    v45 = 0;
    goto LABEL_25;
  }
  v18 = objc_retainAutorelease(v11);
  v54 = open((const char *)objc_msgSend(v18, "UTF8String"), 0);
  if (v54 == -1)
  {
    __error();
    v34 = __error();
    strerror(*v34);
    v31 = CFSTR("Failed to open %@: %d (%s)");
    v48 = (uint64_t)v18;
    v32 = 929;
    v33 = -2;
    goto LABEL_15;
  }
  v22 = img4_firmware_new_from_fd_4MSM(&_img4_runtime_default, v49, a3, &v54, 2);
  v53 = v22;
  if (!v22)
  {
    v37 = CFSTR("Failed to create img4 firmware object.");
    v38 = 935;
LABEL_22:
    v30 = sub_100013988((uint64_t)"verify_disk_image_img4_ticket", v38, -2, 0, v37, v19, v20, v21, v48);
    goto LABEL_23;
  }
  v23 = objc_retainAutorelease(v17);
  *((_QWORD *)&v51 + 1) = objc_msgSend(v23, "bytes");
  *(_QWORD *)&v52 = objc_msgSend(v23, "length");
  img4_firmware_attach_manifest(v22, &v51);
  v24 = img4_nonce_domain_copy_nonce(a4, v55);
  if (!(_DWORD)v24)
    goto LABEL_20;
  v25 = v24;
  if ((_DWORD)v24 != 45)
  {
    strerror(v24);
    v30 = sub_100013988((uint64_t)"verify_disk_image_img4_ticket", 964, -2, 0, CFSTR("Failed to query img4 nonce: %d (%s)"), v39, v40, v41, v25);
    goto LABEL_23;
  }
  if (!qword_1000348B8 || !objc_msgSend((id)qword_1000348B8, "length"))
  {
    v37 = CFSTR("Invalid personalization nonce.");
    v38 = 951;
    goto LABEL_22;
  }
  if ((unint64_t)objc_msgSend((id)qword_1000348B8, "length") >= 0x31)
  {
    v26 = objc_msgSend((id)qword_1000348B8, "length");
    v30 = sub_100013988((uint64_t)"verify_disk_image_img4_ticket", 956, -2, 0, CFSTR("Invalid nonce size (%ld > %ld)"), v27, v28, v29, (uint64_t)v26);
LABEL_23:
    v36 = (void *)objc_claimAutoreleasedReturnValue(v30);
    goto LABEL_24;
  }
  v42 = objc_msgSend((id)qword_1000348B8, "bytes");
  __memcpy_chk((char *)v55 + 2, v42, objc_msgSend((id)qword_1000348B8, "length"), 54);
  HIDWORD(v56) = objc_msgSend((id)qword_1000348B8, "length");
LABEL_20:
  v43 = img4_chip_select_personalized_ap();
  img4_firmware_execute(v22, v43, v55);
  v44 = __errnum;
  if (__errnum)
  {
    strerror(__errnum);
    v37 = CFSTR("img4_firmware_execute failed: %d (%s)");
    v48 = v44;
    v38 = 984;
    goto LABEL_22;
  }
  v36 = 0;
  v45 = 1;
LABEL_25:
  if (v54 != -1)
    close(v54);
  if (v22)
    img4_firmware_destroy(&v53);
  if (a6)
    v46 = v45;
  else
    v46 = 1;
  if ((v46 & 1) == 0)
    *a6 = objc_retainAutorelease(v36);

  return v45;
}

void sub_10000C734(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a4)
    *a4 = a3;
}

uint64_t sub_10000C740(void *a1)
{
  id v1;
  void *v2;
  id v3;
  int v4;
  int v5;
  UInt8 *v6;
  UInt8 *v7;
  ssize_t v8;
  CFDataRef v9;
  CFDataRef v10;
  uint64_t v11;
  const char *v12;
  uint32_t v13;
  int v14;
  int *v15;
  char *v16;
  int v17;
  int *v18;
  char *v19;
  const char *v20;
  uint32_t v21;
  int v22;
  int *v23;
  char *v24;
  int v25;
  int *v26;
  char *v27;
  const char *v28;
  uint32_t v29;
  stat v31;
  uint8_t buf[4];
  _BYTE v33[14];
  __int16 v34;
  char *v35;

  v1 = a1;
  v2 = v1;
  memset(&v31, 0, sizeof(v31));
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    v4 = open((const char *)objc_msgSend(v3, "UTF8String", *(_OWORD *)&v31.st_dev, *(_OWORD *)&v31.st_uid, *(_OWORD *)&v31.st_atimespec, *(_OWORD *)&v31.st_mtimespec, *(_OWORD *)&v31.st_ctimespec, *(_OWORD *)&v31.st_birthtimespec), 0);
    if (v4 != -1)
    {
      v5 = v4;
      if (fstat(v4, &v31) == -1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v17 = *__error();
          v18 = __error();
          v19 = strerror(*v18);
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v33 = v3;
          *(_WORD *)&v33[8] = 1024;
          *(_DWORD *)&v33[10] = v17;
          v34 = 2080;
          v35 = v19;
          v20 = "Failed to fstat %@: %d (%s)";
          v21 = 28;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, buf, v21);
        }
      }
      else
      {
        v6 = (UInt8 *)malloc_type_malloc(v31.st_size, 0x345A89D4uLL);
        if (v6)
        {
          v7 = v6;
          v8 = read(v5, v6, v31.st_size);
          if (v8 == v31.st_size)
          {
            v9 = CFDataCreate(kCFAllocatorDefault, v7, v8);
            if (v9)
            {
              v10 = v9;
              v11 = SecCertificateCreateWithPEM(kCFAllocatorDefault, v9);
              if (!v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create certificate with PEM data.", buf, 2u);
              }
              CFRelease(v10);
              goto LABEL_29;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v28 = "Failed to create data.";
              v29 = 2;
              goto LABEL_27;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v25 = *__error();
            v26 = __error();
            v27 = strerror(*v26);
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v33 = v3;
            *(_WORD *)&v33[8] = 1024;
            *(_DWORD *)&v33[10] = v25;
            v34 = 2080;
            v35 = v27;
            v28 = "Failed to read %@: %d (%s)";
            v29 = 28;
LABEL_27:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v28, buf, v29);
          }
          v11 = 0;
LABEL_29:
          free(v7);
          goto LABEL_30;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *__error();
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v33 = v22;
          *(_WORD *)&v33[4] = 2080;
          *(_QWORD *)&v33[6] = v24;
          v20 = "Failed to allocate memory: %d (%s)";
          v21 = 18;
          goto LABEL_21;
        }
      }
      v11 = 0;
LABEL_30:
      close(v5);
      goto LABEL_31;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v33 = v3;
      *(_WORD *)&v33[8] = 1024;
      *(_DWORD *)&v33[10] = v14;
      v34 = 2080;
      v35 = v16;
      v12 = "Failed to open %@: %d (%s)";
      v13 = 28;
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v12 = "Invalid input.";
    v13 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, v13);
  }
  v11 = 0;
LABEL_31:

  return v11;
}

SecKeyRef sub_10000CB38(const void *a1)
{
  uint64_t v2;
  const void *v3;
  __CFArray *Mutable;
  __CFArray *v5;
  SecPolicyRef BasicX509;
  SecPolicyRef v7;
  const char *v8;
  SecKeyRef v9;
  const char *v10;
  const __CFDate *v12;
  const __CFDate *v13;
  const char *v14;
  uint32_t v15;
  CFTypeRef cf;
  SecTrustRef trust;
  uint8_t buf[4];
  const __CFString *v19;

  cf = 0;
  trust = 0;
  v2 = sub_10000C740(CFSTR("/System/Library/Lockdown/iPhoneCA.pem"));
  if (v2)
  {
    v3 = (const void *)v2;
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v5 = Mutable;
    if (Mutable)
    {
      CFArrayAppendValue(Mutable, a1);
      CFArrayAppendValue(v5, v3);
      BasicX509 = SecPolicyCreateBasicX509();
      if (BasicX509)
      {
        v7 = BasicX509;
        if (SecTrustCreateWithCertificates(v5, BasicX509, &trust))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
LABEL_17:
            CFRelease(v3);
            v9 = 0;
            goto LABEL_18;
          }
          *(_WORD *)buf = 0;
          v8 = "Failed to create trust with policy.";
LABEL_7:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
          goto LABEL_17;
        }
        v12 = CFDateCreate(0, 418863330.0);
        if (!v12)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_17;
          *(_WORD *)buf = 0;
          v8 = "Failed to create verification date.";
          goto LABEL_7;
        }
        v13 = v12;
        if (SecTrustSetVerifyDate(trust, v12))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v14 = "Failed to set trust verify date.";
LABEL_31:
            v15 = 2;
LABEL_40:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
          }
        }
        else if (SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
        {
          v9 = SecTrustCopyKey(trust);
          if (v9)
          {
LABEL_42:
            CFRelease(v3);
            CFRelease(v13);
            goto LABEL_18;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v14 = "Failed to copy the public key from the trust.";
            goto LABEL_31;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v19 = (const __CFString *)cf;
          v14 = "Failed to evaluate trust: %@";
          v15 = 12;
          goto LABEL_40;
        }
        v9 = 0;
        goto LABEL_42;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v10 = "Failed to create basic X509 policy.";
        goto LABEL_15;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to create array.";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
    v7 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = CFSTR("/System/Library/Lockdown/iPhoneCA.pem");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load %@.", buf, 0xCu);
  }
  v9 = 0;
  v7 = 0;
  v5 = 0;
LABEL_18:
  if (trust)
    CFRelease(trust);
  trust = 0;
  if (v7)
    CFRelease(v7);
  if (v5)
    CFRelease(v5);
  if (cf)
    CFRelease(cf);
  return v9;
}

id sub_10000CEBC(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  const char *v7;
  uint32_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v7 = "Invalid input(s).";
      v8 = 2;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v16, v8);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  v6 = objc_retainAutorelease(v3);
  if (sub_100016F38((const char *)objc_msgSend(v6, "fileSystemRepresentation")))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      v7 = "Path is bad: %@";
LABEL_13:
      v8 = 12;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v9 = sub_10000D0D0(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v6;
      v7 = "Failed to attach %@.";
      goto LABEL_13;
    }
LABEL_15:
    v14 = 0;
    v11 = 0;
    goto LABEL_16;
  }
  v11 = v10;
  v12 = sub_10000D358(v10, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (v13)
  {
    v14 = v13;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ on %@.", (uint8_t *)&v16, 0x16u);
    }
    v11 = objc_retainAutorelease(v11);
    sub_10000D708((const char *)objc_msgSend(v11, "UTF8String"));
    v14 = 0;
  }
LABEL_16:

  return v14;
}

id sub_10000D0D0(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v1 = a1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
LABEL_11:
    v9 = 0;
    v4 = 0;
    v7 = 0;
    v5 = 0;
    v3 = 0;
    goto LABEL_19;
  }
  v2 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v1));
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Failed to create URL.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v3 = (void *)v2;
  v14 = 0;
  v4 = objc_msgSend(objc_alloc((Class)DIAttachParams), "initWithURL:error:", v2, &v14);
  v5 = v14;
  if (v4)
  {
    objc_msgSend(v4, "setAutoMount:", 0);
    objc_msgSend(v4, "setFileMode:", 2);
    v12 = v5;
    v13 = 0;
    v6 = +[DiskImages2 attachWithParams:handle:error:](DiskImages2, "attachWithParams:handle:error:", v4, &v13, &v12);
    v7 = v13;
    v8 = v12;

    if ((v6 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "BSDName"));
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v1;
        v17 = 2112;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to attach %@: %@", buf, 0x16u);
      }
      v9 = 0;
    }
    v5 = v8;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create attach parameters: %@", buf, 0xCu);
    }
    v9 = 0;
    v4 = 0;
    v7 = 0;
  }
LABEL_19:

  return v9;
}

id sub_10000D358(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  int v10;
  __int128 *v11;
  const char *v12;
  const char *v13;
  id v14;
  id v15;
  id v17;
  id v18;
  int v19;
  id v20;
  timeval v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _DWORD v52[7];

  v3 = a1;
  v4 = a2;
  v5 = v4;
  v23 = 0u;
  v24 = 0u;
  v22 = 0u;
  v51 = 0u;
  memset(v52, 0, sizeof(v52));
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  v21.tv_sec = 0;
  *(_QWORD *)&v21.tv_usec = 0;
  if (!v3 || !v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Invalid inputs.";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
    }
LABEL_14:
    v9 = 0;
    v7 = 0;
    goto LABEL_15;
  }
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("/dev/%@"), v3);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v13 = "Failed to create string.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v7 = v6;
  v20 = 0;
  v8 = sub_1000132B8(v3, &v20);
  v9 = v20;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("/")))
    v10 = 1048609;
  else
    v10 = 1048577;
  if (v8 == 6)
  {
    *(_QWORD *)&v33 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    v11 = &v33;
    *(_QWORD *)&v52[5] = 0;
    LOWORD(v34) = 1;
    DWORD2(v33) = v10;
    v12 = "apfs";
  }
  else
  {
    v17 = objc_retainAutorelease(v7);
    v22 = (unint64_t)objc_msgSend(v17, "UTF8String");
    LOWORD(v23) = 511;
    DWORD1(v23) = sub_10000DADC((const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
    LODWORD(v24) = 4;
    v11 = &v22;
    gettimeofday(&v21, (char *)&v23 + 8);
    v12 = "hfs";
  }
  v18 = objc_retainAutorelease(v5);
  if (mount(v12, (const char *)objc_msgSend(v18, "UTF8String"), v10, v11) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *__error();
      *(_DWORD *)buf = 138413058;
      v26 = v7;
      v27 = 2112;
      v28 = v18;
      v29 = 2080;
      v30 = v12;
      v31 = 1024;
      v32 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ on %@ (type %s): %{errno}d", buf, 0x26u);
    }
  }
  else
  {
    if (!objc_msgSend(v18, "hasPrefix:", CFSTR("/Developer")) || (sub_10000AAF8(v18) & 1) != 0)
    {
      v14 = v7;
      v7 = v14;
      goto LABEL_16;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "System version verification failed for %@.", buf, 0xCu);
    }
    unmount((const char *)objc_msgSend(objc_retainAutorelease(v18), "fileSystemRepresentation"), 0x80000);
    v7 = objc_retainAutorelease(v7);
    sub_10000D708((const char *)objc_msgSend(v7, "UTF8String"));
  }
LABEL_15:
  v14 = 0;
LABEL_16:
  v15 = v14;

  return v15;
}

void sub_10000D708(const char *a1)
{
  int v2;
  int v3;
  int v4;
  int *v5;
  char *v6;
  int v7;
  int *v8;
  char *v9;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;

  v2 = open(a1, 0);
  v3 = v2;
  if ((v2 & 0x80000000) == 0)
  {
    if (ioctl(v2, 0x20006415uLL) == -1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *__error();
      v5 = __error();
      v6 = strerror(*v5);
      v10 = 136315650;
      v11 = a1;
      v12 = 1024;
      v13 = v4;
      v14 = 2080;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to eject %s : %d (%s)", (uint8_t *)&v10, 0x1Cu);
    }
LABEL_8:
    close(v3);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *__error();
    v8 = __error();
    v9 = strerror(*v8);
    v10 = 136315650;
    v11 = a1;
    v12 = 1024;
    v13 = v7;
    v14 = 2080;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %s: %d (%s)", (uint8_t *)&v10, 0x1Cu);
  }
  if (v3 != -1)
    goto LABEL_8;
}

BOOL sub_10000D88C(CFTypeRef *a1)
{
  IONotificationPortRef v2;
  IONotificationPort *v3;
  const __CFDictionary *v4;
  kern_return_t v5;
  __int16 v6;
  const char *v7;
  _BOOL8 v8;
  io_object_t v10;
  io_registry_entry_t v11;
  CFTypeRef v12;
  const void *v13;
  io_iterator_t notification;
  uint8_t buf[4];
  int v16;

  notification = 0;
  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Invalid input.";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_11:
    v3 = 0;
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v2 = IONotificationPortCreate(kIOMasterPortDefault);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "IONotificationPortCreate failed.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v3 = v2;
  v4 = IOServiceMatching("IOMedia");
  v5 = IOServiceAddMatchingNotification(v3, "IOServiceMatched", v4, 0, a1, &notification);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v6 & 0x3FFF;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOServiceAddMatchingNotification failed: 0x%04x", buf, 8u);
    }
    goto LABEL_12;
  }
  v10 = IOIteratorNext(notification);
  if (v10)
  {
    v11 = v10;
    do
    {
      v12 = IORegistryEntrySearchCFProperty(v11, "IOService", CFSTR("hdik-unique-identifier"), kCFAllocatorDefault, 3u);
      if (v12)
      {
        v13 = v12;
        if (CFEqual(v12, *a1))
          a1[1] = IORegistryEntryCreateCFProperty(v11, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
        CFRelease(v13);
      }
      IOObjectRelease(v11);
      v11 = IOIteratorNext(notification);
    }
    while (v11);
  }
  v8 = a1[1] != 0;
LABEL_13:
  if (notification)
    IOObjectRelease(notification);
  if (v3)
    IONotificationPortDestroy(v3);
  return v8;
}

uint64_t sub_10000DADC(const char *a1)
{
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD __buf[6];
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
  __int128 v32;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
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
  memset(__buf, 0, sizeof(__buf));
  v1 = open(a1, 4, 0);
  if (v1 == -1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  v3 = 0xFFFFFFFFLL;
  if (pread(v1, __buf, 0x200uLL, 1024) == 512 && LOWORD(__buf[0]) == 17474 && WORD6(v8) != 11080)
  {
    if ((HIDWORD(v7) & 0xFFFFFF) == 0x636E65)
    {
      v3 = HIBYTE(HIDWORD(v7));
    }
    else
    {
      v3 = sub_1000105E0();
      if ((v3 + 1) <= 1)
        v3 = (uint64_t)sub_100010694();
    }
    v4 = &dword_100000010;
    while (*(_QWORD *)&aArabic[v4] != (int)v3)
    {
      v4 += 24;
      if ((_DWORD)v4 == 928)
      {
        v3 = 0;
        break;
      }
    }
  }
  close(v2);
  return v3;
}

id sub_10000DC40(void *a1, uint64_t a2, void *a3, void *a4, void *a5, _QWORD *a6, _QWORD *a7)
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t inited;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSString *v40;
  void *v41;
  void *v42;
  NSString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSString *v47;
  void *v48;
  void *v49;
  int v50;
  int v51;
  id v52;
  uint64_t v53;
  int v54;
  int *v55;
  char *v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int *v81;
  char *v82;
  int *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  int *v88;
  char *v89;
  int *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  int v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __CFString *v109;
  uint64_t v110;
  id v111;
  int v112;
  int *v113;
  char *v114;
  int *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  id v126;
  int v127;
  int v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t string;
  uint64_t v136;
  _QWORD *v137;
  void *v138;
  id v139;
  void *v140;
  id v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint8_t buf[4];
  uint64_t v146;
  __int16 v147;
  int v148;
  __int16 v149;
  char *v150;
  _OWORD v151[28];
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;

  v139 = a1;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v144 = 0;
  v153 = -1;
  v154 = -1;
  v152 = 0;
  memset(v151, 0, sizeof(v151));
  v142 = 0;
  v143 = 0;
  v15 = objc_retainAutorelease(v12);
  inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v15, "bytes"), (uint64_t)objc_msgSend(v15, "length"), (uint64_t)v151);
  v138 = v13;
  v140 = v14;
  if ((_DWORD)inited)
  {
    v17 = (void *)inited;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v146) = (_DWORD)v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", buf, 8u);
    }
    v21 = CFSTR("Failed to decode img4 manifest: %d");
    v129 = v17;
    v22 = 1471;
LABEL_5:
    v23 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", v22, -2, 0, v21, v18, v19, v20, (uint64_t)v129);
LABEL_6:
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = 0;
    v141 = 0;
    v26 = 0;
LABEL_7:
    v27 = -1;
    v28 = -1;
    v29 = -1;
LABEL_8:
    LODWORD(v30) = -1;
    goto LABEL_9;
  }
  Img4DecodeGetObjectPropertyData((uint64_t)v151, 1668315236, 1668834414, &v143, &v142);
  if (v34)
  {
    Img4DecodeGetObjectPropertyData((uint64_t)v151, 1885629799, 1885630061, &v143, &v142);
    if ((_DWORD)v35)
    {
      v36 = v35;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v146) = v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      v23 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1487, -2, 0, CFSTR("Failed to retrieve data from manifest: %d"), v37, v38, v39, v36);
      goto LABEL_6;
    }
    v136 = 0;
  }
  else
  {
    v136 = 1;
  }
  v40 = NSTemporaryDirectory();
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "UUIDString"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingFormat:", CFSTR("%@")));

  if (!v26)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v21 = CFSTR("Failed to create string.");
    v22 = 1496;
    goto LABEL_5;
  }
  v137 = a7;
  v43 = NSTemporaryDirectory();
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "UUIDString"));
  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "stringByAppendingFormat:", CFSTR("%@")));

  v141 = (id)v46;
  if (!v46)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v65 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1502, -2, 0, CFSTR("Failed to create string."), v62, v63, v64, (uint64_t)v130);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v65);
    v25 = 0;
    v141 = 0;
    v27 = -1;
    v28 = -1;
    v29 = -1;
    LODWORD(v30) = -1;
    a7 = v137;
    goto LABEL_9;
  }
  v47 = NSTemporaryDirectory();
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "UUIDString"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingFormat:", CFSTR("%@")));

  if (!v25)
  {
    a7 = v137;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v69 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1508, -2, 0, CFSTR("Failed to create string."), v66, v67, v68, (uint64_t)v131);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v69);
    v25 = 0;
    goto LABEL_7;
  }
  a7 = v137;
  if ((objc_msgSend(v13, "writeToFile:atomically:", v26, 0) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v146 = (uint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    v73 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1515, -2, 0, CFSTR("Failed to write to %@."), v70, v71, v72, (uint64_t)v26);
    goto LABEL_64;
  }
  if ((objc_msgSend(v15, "writeToFile:atomically:", v141, 0) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v146 = (uint64_t)v141;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    v73 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1520, -2, 0, CFSTR("Failed to write to %@."), v74, v75, v76, (uint64_t)v141);
    goto LABEL_64;
  }
  if (v14 && (objc_msgSend(v14, "writeToFile:atomically:", v25, 0) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v146 = (uint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to write to %@.", buf, 0xCu);
    }
    v73 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1526, -2, 0, CFSTR("Failed to write to %@."), v77, v78, v79, (uint64_t)v25);
    goto LABEL_64;
  }
  v26 = objc_retainAutorelease(v26);
  v50 = open((const char *)objc_msgSend(v26, "UTF8String"), 0, 420);
  if (v50 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v80 = *__error();
      v81 = __error();
      v82 = strerror(*v81);
      *(_DWORD *)buf = 138412802;
      v146 = (uint64_t)v26;
      v147 = 1024;
      v148 = v80;
      v149 = 2080;
      v150 = v82;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    v83 = __error();
    strerror(*v83);
    v73 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1535, -2, 0, CFSTR("Failed to create %@: %d (%s)"), v84, v85, v86, (uint64_t)v26);
LABEL_64:
    v24 = (void *)objc_claimAutoreleasedReturnValue(v73);
    goto LABEL_7;
  }
  v29 = v50;
  v141 = objc_retainAutorelease(v141);
  v51 = open((const char *)objc_msgSend(v141, "UTF8String"), 0, 420);
  if (v51 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v87 = *__error();
      v88 = __error();
      v89 = strerror(*v88);
      *(_DWORD *)buf = 138412802;
      v146 = (uint64_t)v141;
      v147 = 1024;
      v148 = v87;
      v149 = 2080;
      v150 = v89;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    v90 = __error();
    strerror(*v90);
    v94 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1541, -2, 0, CFSTR("Failed to create %@: %d (%s)"), v91, v92, v93, (uint64_t)v141);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v94);
    v27 = -1;
    v28 = -1;
    goto LABEL_8;
  }
  v28 = v51;
  if (v140)
  {
    v52 = objc_retainAutorelease(v25);
    v27 = open((const char *)objc_msgSend(v52, "UTF8String"), 0, 420);
    v53 = v136;
    if (v27 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v54 = *__error();
        v55 = __error();
        v56 = strerror(*v55);
        *(_DWORD *)buf = 138412802;
        v146 = (uint64_t)v52;
        v147 = 1024;
        v148 = v54;
        v149 = 2080;
        v150 = v56;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
      }
      __error();
      v57 = __error();
      strerror(*v57);
      v61 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1548, -2, 0, CFSTR("Failed to create %@: %d (%s)"), v58, v59, v60, (uint64_t)v52);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v27 = -1;
      v25 = v52;
      goto LABEL_8;
    }
  }
  else
  {
    v27 = -1;
    v53 = v136;
  }
  v134 = objc_retainAutorelease(v139);
  v132 = 420;
  v95 = open((const char *)objc_msgSend(v134, "UTF8String"), 0);
  if ((_DWORD)v95 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v112 = *__error();
      v113 = __error();
      v114 = strerror(*v113);
      *(_DWORD *)buf = 138412802;
      v146 = (uint64_t)v134;
      v147 = 1024;
      v148 = v112;
      v149 = 2080;
      v150 = v114;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %@: %d (%s)", buf, 0x1Cu);
    }
    __error();
    v115 = __error();
    strerror(*v115);
    v119 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1555, -2, 0, CFSTR("Failed to create %@: %d (%s)"), v116, v117, v118, (uint64_t)v134);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v119);
    goto LABEL_8;
  }
  v30 = v95;
  v153 = __PAIR64__(v29, v95);
  HIDWORD(v154) = v28;
  if (v27 != -1)
    LODWORD(v154) = v27;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001EA10(v30, v96, v97, v98, v99, v100, v101, v102);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E9A0();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E930();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10001E8C0();
  v103 = cryptex_install_4MSM(&v153, v53, &v144);
  if (v103)
  {
    v104 = v103;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v105 = strerror(v104);
      *(_DWORD *)buf = 138412802;
      v146 = (uint64_t)v134;
      v147 = 1024;
      v148 = v104;
      v149 = 2080;
      v150 = v105;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to install cryptex (%@): %d (%s)", buf, 0x1Cu);
    }
    strerror(v104);
    v109 = CFSTR("Failed to install cryptex (%@): %d (%s)");
    v132 = (uint64_t)v134;
    v110 = 1575;
LABEL_84:
    v111 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", v110, -2, 0, v109, v106, v107, v108, v132);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v111);
    goto LABEL_9;
  }
  string = cryptex_msm_get_string(v144, 0);
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve cryptex name.", buf, 2u);
    }
    v109 = CFSTR("Failed to retrieve cryptex name.");
    v110 = 1581;
    goto LABEL_84;
  }
  v120 = cryptex_msm_get_string(v144, 2);
  if (v120)
  {
    v133 = v120;
    v121 = cryptex_msm_get_string(v144, 4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v146 = v121;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cryptex mount point = %s", buf, 0xCu);
    }
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v121));
    v122 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v133));
    v24 = 0;
    if (v122)
    {
      v31 = (void *)v122;
LABEL_12:
      close(v29);
      v26 = objc_retainAutorelease(v26);
      unlink((const char *)objc_msgSend(v26, "UTF8String"));
      v32 = v31;
      goto LABEL_13;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve cryptex devpath.", buf, 2u);
    }
    v126 = sub_100013988((uint64_t)"perform_disk_image_mount_cryptex", 1587, -2, 0, CFSTR("Failed to retrieve cryptex devpath."), v123, v124, v125, 420);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v126);
  }
  v127 = cryptex_uninstall_4MSM(string, v136);
  if (v127)
  {
    v128 = v127;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_10001E814(string, v128);
  }
LABEL_9:
  if (a7)
    *a7 = objc_retainAutorelease(v24);
  v31 = 0;
  v32 = 0;
  if (v29 != -1)
    goto LABEL_12;
LABEL_13:
  if (v28 != -1)
  {
    close(v28);
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v141), "UTF8String"));
  }
  if (v27 != -1)
  {
    close(v27);
    unlink((const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));
  }
  if ((_DWORD)v30 != -1)
    close(v30);
  if (v144)
    cryptex_msm_destroy(&v144);

  return v32;
}

id sub_10000EA7C(void *a1, void *a2, void *a3, void *a4, void *a5, _QWORD *a6, _QWORD *a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  char *v32;
  id v33;
  int v34;
  int *v35;
  char *v36;
  int *v37;
  id v38;
  uint64_t inited;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  int v51;
  int *v52;
  char *v53;
  id v54;
  char *v56;
  id v57;
  void *v58;
  id v59;
  char v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  void *i;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  int v74;
  int *v75;
  char *v76;
  uint64_t v77;
  int *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  id v123;
  int v124;
  int *v125;
  char *v126;
  id v127;
  int v128;
  int *v129;
  char *v130;
  uint64_t v131;
  void *v132;
  uint64_t v133;
  _QWORD *v134;
  id v135;
  unsigned int v136;
  void *v137;
  char *v138;
  char *v139;
  void *v140;
  id obj;
  id v142;
  id v143;
  void *v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  id v149;
  size_t v150;
  const char *v151;
  size_t v152;
  uint64_t v153;
  void *v154;
  stat v155;
  uint8_t v156[128];
  uint8_t buf[4];
  _BYTE v158[24];
  _OWORD v159[28];
  uint64_t v160;

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = v17;
  memset(&v155, 0, sizeof(v155));
  v160 = 0;
  memset(v159, 0, sizeof(v159));
  v153 = 0;
  v154 = 0;
  v151 = 0;
  v152 = 0;
  v150 = 0;
  v140 = v16;
  if (v14 && v15 && a6 && v17 && v13)
  {
    if (!v16 && objc_msgSend(v14, "isEqualToString:", CFSTR("Cryptex")))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Missing trust cache.", buf, 2u);
      }
      v22 = CFSTR("Missing trust cache.");
      v23 = 1682;
      v24 = -3;
      goto LABEL_44;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v158 = v18;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Preparing to mount disk image at %@.", buf, 0xCu);
    }
    v33 = objc_retainAutorelease(v13);
    if (lstat((const char *)objc_msgSend(v33, "UTF8String"), &v155))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v34 = *__error();
        v35 = __error();
        v36 = strerror(*v35);
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)v158 = v33;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v34;
        *(_WORD *)&v158[14] = 2080;
        *(_QWORD *)&v158[16] = v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to lstat %@: %d (%s)", buf, 0x1Cu);
      }
      __error();
      v37 = __error();
      strerror(*v37);
      v22 = CFSTR("Failed to lstat %@: %d (%s)");
      v131 = (uint64_t)v33;
      v23 = 1690;
LABEL_43:
      v24 = -2;
LABEL_44:
      v45 = sub_100013988((uint64_t)"perform_disk_image_mount", v23, v24, 0, v22, v19, v20, v21, v131);
      obj = 0;
      v142 = (id)objc_claimAutoreleasedReturnValue(v45);
      v32 = 0;
      v31 = 0;
      v30 = 0;
      v143 = 0;
      v29 = 0;
      goto LABEL_45;
    }
    if ((v155.st_mode & 0xF000) != 0x8000)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v158 = v33;
        *(_WORD *)&v158[8] = 1024;
        *(_DWORD *)&v158[10] = v155.st_mode & 0xF000;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ is not a regular file (mode: 0x%04x).", buf, 0x12u);
      }
      v22 = CFSTR("%@ is not a regular file (mode: 0x%04x).");
      v131 = (uint64_t)v33;
      v23 = 1695;
      goto LABEL_43;
    }
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("Personalized")) & 1) == 0
      && (objc_msgSend(v14, "isEqualToString:", CFSTR("Cryptex")) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v158 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported disk image type: %@", buf, 0xCu);
      }
      v22 = CFSTR("Unsupported disk image type: %@");
      v131 = (uint64_t)v14;
      v23 = 1701;
      goto LABEL_43;
    }
    v38 = objc_retainAutorelease(v15);
    inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v38, "bytes"), (uint64_t)objc_msgSend(v38, "length"), (uint64_t)v159);
    if ((_DWORD)inited)
    {
      v40 = inited;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v158 = v40;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to decode img4 manifest: %d", buf, 8u);
      }
      v22 = CFSTR("Failed to decode img4 manifest: %d");
      v131 = v40;
      v23 = 1713;
      goto LABEL_43;
    }
    v144 = v38;
    Img4DecodeGetObjectPropertyData((uint64_t)v159, 1885629799, 1145525076, &v153, &v152);
    if ((_DWORD)v41)
    {
      v42 = v41;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v158 = v42;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      v22 = CFSTR("Failed to retrieve data from manifest: %d");
      v131 = v42;
      v23 = 1719;
      goto LABEL_43;
    }
    Img4DecodeGetObjectPropertyData((uint64_t)v159, 1885629799, 1885630061, &v151, &v150);
    if ((_DWORD)v43)
    {
      v44 = v43;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v158 = v44;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve data from manifest: %d", buf, 8u);
      }
      v22 = CFSTR("Failed to retrieve data from manifest: %d");
      v131 = v44;
      v23 = 1725;
      goto LABEL_43;
    }
    v56 = (char *)malloc_type_calloc(1uLL, v150 + 1, 0xAED4D1E7uLL);
    if (!v56)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v74 = *__error();
        v75 = __error();
        v76 = strerror(*v75);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v158 = v74;
        *(_WORD *)&v158[4] = 2080;
        *(_QWORD *)&v158[6] = v76;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %d (%s)", buf, 0x12u);
      }
      v77 = *__error();
      v78 = __error();
      strerror(*v78);
      v22 = CFSTR("Failed to allocate memory: %d (%s)");
      v131 = v77;
      v23 = 1731;
      goto LABEL_43;
    }
    v32 = v56;
    v134 = a7;
    strncpy(v56, v151, v150);
    v57 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v32);
    if (!v57)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
      }
      v82 = sub_100013988((uint64_t)"perform_disk_image_mount", 1739, -2, 0, CFSTR("Failed to create string."), v79, v80, v81, v131);
      obj = 0;
      v142 = (id)objc_claimAutoreleasedReturnValue(v82);
      v31 = 0;
      v30 = 0;
      v143 = 0;
      v29 = 0;
      goto LABEL_45;
    }
    v31 = v57;
    v139 = v32;
    if (objc_msgSend(v57, "isEqual:", CFSTR("DeveloperDiskImage")))
      v58 = &_img4_nonce_domain_ddi;
    else
      v58 = &_img4_nonce_domain_pdi;
    if ((sub_10000C19C(v33, (uint64_t)&v154, v152) & 1) != 0)
    {
      v59 = objc_alloc((Class)NSData);
      v135 = objc_msgSend(v59, "initWithBytes:length:", v154, v152);
      if (v135)
      {
        v149 = 0;
        v132 = v31;
        v60 = sub_10000C3C0(v33, v31, 1885629799, (uint64_t)v58, v144, &v149);
        v61 = v149;
        v62 = v61;
        if ((v60 & 1) == 0)
        {
          v90 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to validate server ticket with this device/image."));
          if (v62)
          {
            v91 = v62;
            v131 = (uint64_t)v90;
            v92 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)")));

            v90 = (id)v92;
          }
          else
          {
            v91 = 0;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v158 = v90;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
          }
          v101 = sub_100013988((uint64_t)"perform_disk_image_mount", 1760, -2, v91, CFSTR("Failed to validate server ticket with this device/image."), v98, v99, v100, v131);
          v102 = objc_claimAutoreleasedReturnValue(v101);

          obj = 0;
          v142 = (id)v102;
          v143 = 0;
          v29 = 0;
          v31 = v132;
          v30 = v135;
          goto LABEL_45;
        }
        v142 = v61;
        v63 = sub_100016AC8(v14, 1);
        v145 = 0u;
        v146 = 0u;
        v147 = 0u;
        v148 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(v63);
        v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
        if (v64)
        {
          v65 = v64;
          v133 = *(_QWORD *)v146;
          while (2)
          {
            for (i = 0; i != v65; i = (char *)i + 1)
            {
              if (*(_QWORD *)v146 != v133)
                objc_enumerationMutation(obj);
              v67 = *(void **)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)i);
              v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("ImageSignature")));
              v136 = objc_msgSend(v68, "isEqual:", v135);

              if (v136)
              {
                *a6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("MountPath")));

                v32 = v139;
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)v158 = v14;
                  *(_WORD *)&v158[8] = 2080;
                  *(_QWORD *)&v158[10] = v139;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Matching image of type %@/%s found.", buf, 0x16u);
                }
                v96 = sub_100013988((uint64_t)"perform_disk_image_mount", 1776, -2, 0, CFSTR("Matching image of type %@/%s found."), v93, v94, v95, (uint64_t)v14);
                v97 = objc_claimAutoreleasedReturnValue(v96);

                v29 = 0;
                v142 = (id)v97;
                v143 = 0;
                a7 = v134;
                goto LABEL_116;
              }
            }
            v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v145, v156, 16);
            if (v65)
              continue;
            break;
          }
        }

        v137 = v18;
        if ((sub_10000B6F4(v18) & 1) != 0)
        {
          v69 = objc_retainAutorelease(v33);
          if (sub_100016F38((const char *)objc_msgSend(v69, "fileSystemRepresentation")))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)v158 = v69;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disk image path is bad: %@", buf, 0xCu);
            }
            v73 = sub_100013988((uint64_t)"perform_disk_image_mount", 1787, -2, 0, CFSTR("Disk image path is bad: %@"), v70, v71, v72, (uint64_t)v69);
LABEL_113:
            v114 = objc_claimAutoreleasedReturnValue(v73);

            v29 = 0;
            v142 = (id)v114;
            v143 = 0;
            goto LABEL_114;
          }
          if (v140 && (sub_10000FCD0(v140, v144, v18) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load trust cache.", buf, 2u);
            }
            v73 = sub_100013988((uint64_t)"perform_disk_image_mount", 1796, -2, 0, CFSTR("Failed to load trust cache."), v111, v112, v113, v131);
            goto LABEL_113;
          }
          v108 = sub_10000CEBC(v69, v18);
          v109 = objc_claimAutoreleasedReturnValue(v108);
          if (v109)
          {
            v110 = (void *)v109;
            if (v140 || (sub_10000FCD0(0, 0, v18) & 1) != 0)
            {
              v29 = v110;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v158 = v18;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully mounted disk image at %@.", buf, 0xCu);
                v143 = v29;
                goto LABEL_115;
              }
              v143 = v29;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)v158 = v18;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to load trust caches at %@.", buf, 0xCu);
              }
              v121 = sub_100013988((uint64_t)"perform_disk_image_mount", 1815, -2, 0, CFSTR("Failed to load trust caches at %@."), v118, v119, v120, (uint64_t)v18);
              v122 = objc_claimAutoreleasedReturnValue(v121);

              v123 = objc_retainAutorelease(v137);
              if (unmount((const char *)objc_msgSend(v123, "fileSystemRepresentation"), 0x80000)
                && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                v124 = *__error();
                v125 = __error();
                v126 = strerror(*v125);
                *(_DWORD *)buf = 138412802;
                *(_QWORD *)v158 = v123;
                *(_WORD *)&v158[8] = 1024;
                *(_DWORD *)&v158[10] = v124;
                *(_WORD *)&v158[14] = 2080;
                *(_QWORD *)&v158[16] = v126;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to force unmount %@: %d (%s)", buf, 0x1Cu);
              }
              if ((objc_msgSend(v123, "hasPrefix:", CFSTR("/System/Volumes/FieldService")) & 1) == 0
                && (objc_msgSend(v123, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceDiagnostic")) & 1) == 0
                && (objc_msgSend(v123, "hasPrefix:", CFSTR("/System/Volumes/FieldServiceRepair")) & 1) == 0
                && (objc_msgSend(v123, "hasPrefix:", CFSTR("/Developer")) & 1) == 0
                && (objc_msgSend(v123, "hasPrefix:", CFSTR("/System/Developer")) & 1) == 0)
              {
                v127 = objc_retainAutorelease(v123);
                if (rmdir((const char *)objc_msgSend(v127, "fileSystemRepresentation")) == -1
                  && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v128 = *__error();
                  v129 = __error();
                  v130 = strerror(*v129);
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v158 = v127;
                  *(_WORD *)&v158[8] = 1024;
                  *(_DWORD *)&v158[10] = v128;
                  *(_WORD *)&v158[14] = 2080;
                  *(_QWORD *)&v158[16] = v130;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove %@: %d (%s)", buf, 0x1Cu);
                }
              }
              v143 = objc_retainAutorelease(v110);
              sub_10000D708((const char *)objc_msgSend(v143, "fileSystemRepresentation"));
              v29 = 0;
              v142 = (id)v122;
            }
LABEL_114:
            v18 = v137;
LABEL_115:
            a7 = v134;
            v32 = v139;
LABEL_116:
            v31 = v132;
            v30 = v135;
            goto LABEL_45;
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v158 = v69;
            *(_WORD *)&v158[8] = 2112;
            *(_QWORD *)&v158[10] = v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mount %@ at %@.", buf, 0x16u);
          }
          v106 = sub_100013988((uint64_t)"perform_disk_image_mount", 1806, -2, 0, CFSTR("Failed to mount %@ at %@."), v115, v116, v117, (uint64_t)v69);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v158 = v18;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to verify the disk image mount path %@.", buf, 0xCu);
          }
          v106 = sub_100013988((uint64_t)"perform_disk_image_mount", 1782, -2, 0, CFSTR("Failed to verify the disk image mount path %@."), v103, v104, v105, (uint64_t)v18);
        }
        v107 = objc_claimAutoreleasedReturnValue(v106);

        v29 = 0;
        v142 = (id)v107;
        v143 = 0;
        goto LABEL_115;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
      }
      v86 = sub_100013988((uint64_t)"perform_disk_image_mount", 1754, -2, 0, CFSTR("Failed to create data."), v87, v88, v89, v131);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v158 = v33;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to digest %@.", buf, 0xCu);
      }
      v86 = sub_100013988((uint64_t)"perform_disk_image_mount", 1748, -2, 0, CFSTR("Failed to digest %@."), v83, v84, v85, (uint64_t)v33);
    }
    obj = 0;
    v142 = (id)objc_claimAutoreleasedReturnValue(v86);
    v30 = 0;
    v143 = 0;
    v29 = 0;
    goto LABEL_45;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
  }
  v28 = sub_100013988((uint64_t)"perform_disk_image_mount", 1677, -3, 0, CFSTR("Invalid input(s)."), v25, v26, v27, v131);
  v142 = (id)objc_claimAutoreleasedReturnValue(v28);
  v143 = 0;
  v29 = 0;
  obj = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  if (!v13)
  {
    if (!a7)
      goto LABEL_51;
    goto LABEL_49;
  }
LABEL_45:
  v46 = v30;
  v47 = v31;
  v48 = objc_retainAutorelease(v13);
  if (unlink((const char *)objc_msgSend(v48, "UTF8String"))
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v138 = v32;
    v49 = v14;
    v50 = v15;
    v51 = *__error();
    v52 = __error();
    v53 = strerror(*v52);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)v158 = v48;
    *(_WORD *)&v158[8] = 1024;
    *(_DWORD *)&v158[10] = v51;
    v15 = v50;
    v14 = v49;
    v32 = v138;
    *(_WORD *)&v158[14] = 2080;
    *(_QWORD *)&v158[16] = v53;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to unlink %@: %d (%s)", buf, 0x1Cu);
  }
  v31 = v47;
  v30 = v46;
  if (a7)
  {
LABEL_49:
    if (!v143)
      *a7 = objc_retainAutorelease(v142);
  }
LABEL_51:
  if (v32)
    free(v32);
  if (v154)
    free(v154);
  v54 = v29;

  return v54;
}

uint64_t sub_10000FCD0(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  const __CFDictionary *v10;
  io_service_t MatchingService;
  io_object_t v12;
  kern_return_t v13;
  __int16 v14;
  const char *v15;
  uint32_t v16;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  id v23;
  id v25;
  char *v26;
  _QWORD *v27;
  char *v28;
  BOOL v29;
  id v30;
  int v31;
  int v32;
  const char *v33;
  uint32_t v34;
  int v35;
  int *v36;
  char *v37;
  io_connect_t v38;
  kern_return_t v39;
  kern_return_t v40;
  int v41;
  int *v42;
  char *v43;
  int v44;
  int *v45;
  char *v46;
  int v47;
  int *v48;
  char *v49;
  kern_return_t v50;
  kern_return_t v51;
  id v52;
  size_t inputStructCnt;
  id v54;
  BOOL v55;
  io_connect_t connect;
  stat v57;
  uint8_t buf[4];
  _BYTE v59[14];
  __int16 v60;
  char *v61;
  char __str[1024];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  bzero(__str, 0x400uLL);
  memset(&v57, 0, sizeof(v57));
  connect = 0;
  v55 = 0;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input.", buf, 2u);
    }
    v17 = 0;
    v12 = 0;
    v8 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_14;
  }
  if (v5)
  {
    v8 = 0;
    v9 = -1;
    goto LABEL_4;
  }
  snprintf(__str, 0x400uLL, "%s/.TrustCache", (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
  v20 = open(__str, 0);
  if (v20 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *__error();
      v36 = __error();
      v37 = strerror(*v36);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v35;
      v60 = 2080;
      v61 = v37;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %s: %d (%s)", buf, 0x1Cu);
    }
    v17 = 0;
    v12 = 0;
    v8 = 0;
    v18 = 0;
    v19 = 0;
    v5 = 0;
LABEL_14:
    v9 = -1;
    goto LABEL_24;
  }
  v9 = v20;
  if (fstat(v20, &v57) == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v41 = *__error();
      v42 = __error();
      v43 = strerror(*v42);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)v59 = __str;
      *(_WORD *)&v59[8] = 1024;
      *(_DWORD *)&v59[10] = v41;
      v60 = 2080;
      v61 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to fstat %s: %d (%s)", buf, 0x1Cu);
    }
    v17 = 0;
    v12 = 0;
    v8 = 0;
    goto LABEL_63;
  }
  v21 = mmap(0, v57.st_size, 1, 1026, v9, 0);
  if (v21 != (void *)-1)
  {
    v8 = (uint64_t)v21;
    v22 = objc_alloc((Class)NSData);
    v23 = objc_msgSend(v22, "initWithBytesNoCopy:length:freeWhenDone:", v8, v57.st_size, 0);
    if (v23)
    {
      v5 = v23;
LABEL_4:
      v10 = IOServiceMatching("AppleMobileFileIntegrity");
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
      if (!MatchingService)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IOServiceGetMatchingService failed.", buf, 2u);
        }
        v17 = 0;
        v12 = 0;
        goto LABEL_23;
      }
      v12 = MatchingService;
      v13 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
      if (v13)
      {
        v14 = v13;
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
LABEL_10:
          v17 = 0;
LABEL_23:
          v18 = 0;
          v19 = 0;
          goto LABEL_24;
        }
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)v59 = v14 & 0x3FFF;
        v15 = "IOServiceOpen failed: 0x%04x";
        goto LABEL_8;
      }
      if (v6 && objc_msgSend(v6, "length"))
      {
        v25 = objc_msgSend(v6, "length");
        v26 = (char *)objc_msgSend(v5, "length") + (_QWORD)v25 + 16;
        v27 = malloc_type_malloc((size_t)v26, 0x2DCA2206uLL);
        if (!v27)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          v47 = *__error();
          v48 = __error();
          v49 = strerror(*v48);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v59 = v47;
          *(_WORD *)&v59[4] = 2080;
          *(_QWORD *)&v59[6] = v49;
          v15 = "Failed to allocate memory: %d (%s)";
          v16 = 18;
          goto LABEL_9;
        }
        v17 = v27;
        inputStructCnt = (size_t)v26;
        *v27 = objc_msgSend(v6, "length");
        v52 = objc_retainAutorelease(v6);
        memcpy(v17 + 2, objc_msgSend(v52, "bytes"), (size_t)objc_msgSend(v52, "length"));
        v17[1] = objc_msgSend(v5, "length");
        v28 = (char *)v17 + *v17 + 16;
        v5 = objc_retainAutorelease(v5);
        memcpy(v28, objc_msgSend(v5, "bytes"), (size_t)objc_msgSend(v5, "length"));
        v54 = 0;
        v29 = sub_10001383C(&v55, &v54);
        v19 = v54;
        if (!v29)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)v59 = v19;
            v33 = "Failed to check support for Restricted Execution Mode: %{public}@";
            v34 = 12;
            goto LABEL_73;
          }
LABEL_74:
          v18 = 0;
          goto LABEL_24;
        }
        if (v55)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sealing trust cache will invalidate the system's attestation.", buf, 2u);
          }
          if (!sub_100013AFC())
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v33 = "Bailing in order to protect attestation integrity.";
              v34 = 2;
              goto LABEL_73;
            }
            goto LABEL_74;
          }
          v30 = objc_retainAutorelease(v52);
          v31 = aks_measure_and_seal_cryptex_manifest(objc_msgSend(v30, "bytes"), objc_msgSend(v30, "length"));
          if (v31)
          {
            v32 = v31;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v59 = v32;
              *(_WORD *)&v59[4] = 1024;
              *(_DWORD *)&v59[6] = v32;
              v33 = "Failed to measure and seal im4m: %d (0x%08x)";
              v34 = 14;
LABEL_73:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v33, buf, v34);
              goto LABEL_74;
            }
            goto LABEL_74;
          }
        }
        v50 = IOConnectCallMethod(connect, 7u, 0, 0, v17, inputStructCnt, 0, 0, 0, 0);
        if (v50)
        {
          v51 = v50;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v59 = v51;
            v33 = "IOConnectCallMethod failed: 0x%08x";
            v34 = 8;
            goto LABEL_73;
          }
          goto LABEL_74;
        }
      }
      else
      {
        v38 = connect;
        v5 = objc_retainAutorelease(v5);
        v39 = IOConnectCallMethod(v38, 2u, 0, 0, objc_msgSend(v5, "bytes"), (size_t)objc_msgSend(v5, "length"), 0, 0, 0, 0);
        if (v39)
        {
          v40 = v39;
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)v59 = v40;
          v15 = "IOConnectCallMethod failed: 0x%08x";
LABEL_8:
          v16 = 8;
LABEL_9:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
          goto LABEL_10;
        }
        v17 = 0;
        v19 = 0;
      }
      v18 = 1;
      goto LABEL_24;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    v17 = 0;
    v12 = 0;
LABEL_63:
    v18 = 0;
    v19 = 0;
    v5 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v44 = *__error();
    v45 = __error();
    v46 = strerror(*v45);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v59 = __str;
    *(_WORD *)&v59[8] = 1024;
    *(_DWORD *)&v59[10] = v44;
    v60 = 2080;
    v61 = v46;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to mmap %s: %d (%s)", buf, 0x1Cu);
  }
  v17 = 0;
  v12 = 0;
  v18 = 0;
  v19 = 0;
  v5 = 0;
  v8 = -1;
LABEL_24:
  if (connect)
  {
    IOServiceClose(connect);
    connect = 0;
  }
  if (v12)
    IOObjectRelease(v12);
  if (v8)
    munmap((void *)v8, v57.st_size);
  if (v9 != -1)
    close(v9);
  if (v17)
    free(v17);

  return v18;
}

uint64_t sub_1000105E0()
{
  unsigned int v1;
  size_t v2;
  vfsconf v3;
  int v4[3];

  v2 = 4;
  memset(&v3, 0, sizeof(v3));
  v1 = 0;
  if (getvfsbyname("hfs", &v3) < 0)
    return 0xFFFFFFFFLL;
  v4[0] = 3;
  v4[1] = v3.vfc_typenum;
  v4[2] = 1;
  if (sysctl(v4, 3u, &v1, &v2, 0, 0) < 0)
    return 0xFFFFFFFFLL;
  else
    return v1;
}

passwd *sub_100010694()
{
  passwd *result;
  int v1;
  int v2;
  ssize_t v3;
  uint64_t v4;
  char __str[1024];

  bzero(__str, 0x400uLL);
  result = getpwuid(0);
  if (result)
  {
    __strcpy_chk(__str, result->pw_dir, 1024);
    __strcat_chk(__str, "/.CFUserTextEncoding", 1024);
    v1 = open(__str, 0, 0);
    v2 = v1;
    if (v1 < 0)
    {
      v4 = 0;
      result = 0;
      if (v2 == -1)
        return result;
    }
    else
    {
      v3 = read(v1, __str, 0x400uLL);
      __str[v3 & ~(v3 >> 63)] = 0;
      v4 = strtol(__str, 0, 0);
    }
    close(v2);
    return (passwd *)v4;
  }
  return result;
}

id sub_10001078C(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000108C8;
  v24 = sub_1000108D8;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000108C8;
  v18 = sub_1000108D8;
  v19 = 0;
  v4 = sub_1000108E0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010920;
  block[3] = &unk_10002CE90;
  v6 = v3;
  v11 = v6;
  v12 = &v20;
  v13 = &v14;
  dispatch_sync(v5, block);

  v7 = (void *)v15[5];
  if (a2 && !v7)
  {
    *a2 = objc_retainAutorelease((id)v21[5]);
    v7 = (void *)v15[5];
  }
  v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

uint64_t sub_1000108C8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000108D8(uint64_t a1)
{

}

id sub_1000108E0()
{
  if (qword_100034888 != -1)
    dispatch_once(&qword_100034888, &stru_10002CF00);
  return (id)qword_100034890;
}

void sub_100010920(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  unsigned int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  _OWORD v37[3];
  uint64_t v38;

  v38 = 0;
  memset(v37, 0, sizeof(v37));
  v2 = sub_1000131B0(*(void **)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = &_img4_nonce_domain_pdi;
  v5 = "PDI";
  if (v3)
  {
    v6 = (void *)v3;
    v7 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("DeveloperDiskImage"));

    if (v7)
    {
      v5 = "DDI";
      v4 = &_img4_nonce_domain_ddi;
    }
  }
  v8 = img4_nonce_domain_copy_nonce(v4, v37);
  if (!v8)
  {
    v15 = objc_alloc((Class)NSData);
    v14 = objc_msgSend(v15, "initWithBytes:length:", (char *)v37 + 2, HIDWORD(v38));
    if (v14)
      goto LABEL_9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    v26 = CFSTR("Failed to create data.");
    v27 = 2206;
    goto LABEL_19;
  }
  v9 = v8;
  if (v8 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v32 = v5;
      v33 = 1024;
      v34 = v9;
      v35 = 2080;
      v36 = strerror(v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query img4 %s nonce: %d (%s)", buf, 0x1Cu);
    }
    strerror(v9);
    v22 = sub_100013988((uint64_t)"copy_personalization_nonce_for_image_type_block_invoke", 2198, -2, 0, CFSTR("Failed to query img4 %s nonce: %d (%s)"), v19, v20, v21, (uint64_t)v5);
    goto LABEL_20;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
  v13 = (void *)qword_1000348B8;
  qword_1000348B8 = v12;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    v26 = CFSTR("Failed to create nonce.");
    v27 = 2191;
LABEL_19:
    v22 = sub_100013988((uint64_t)"copy_personalization_nonce_for_image_type_block_invoke", v27, -2, 0, v26, v23, v24, v25, v30);
LABEL_20:
    v28 = objc_claimAutoreleasedReturnValue(v22);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(id *)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;
    goto LABEL_21;
  }
  v14 = (id)qword_1000348B8;
LABEL_9:
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v14;
  v18 = v14;

LABEL_21:
}

BOOL sub_100010C00(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  _BOOL8 v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v3 = a1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000108C8;
  v18 = sub_1000108D8;
  v19 = 0;
  v4 = sub_1000108E0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010D38;
  block[3] = &unk_10002CE90;
  v6 = v3;
  v11 = v6;
  v12 = &v14;
  v13 = &v20;
  dispatch_sync(v5, block);

  v7 = *((unsigned __int8 *)v21 + 24);
  if (a2 && !*((_BYTE *)v21 + 24))
  {
    *a2 = objc_retainAutorelease((id)v15[5]);
    v7 = *((unsigned __int8 *)v21 + 24);
  }
  v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

void sub_100010D38(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  unsigned int v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  char *v30;

  v2 = sub_1000131B0(*(void **)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = &_img4_nonce_domain_pdi;
  v5 = "PDI";
  if (v3)
  {
    v6 = (void *)v3;
    v7 = objc_msgSend(*(id *)(a1 + 32), "isEqual:", CFSTR("DeveloperDiskImage"));

    if (v7)
    {
      v5 = "DDI";
      v4 = &_img4_nonce_domain_ddi;
    }
  }
  v8 = img4_nonce_domain_roll_nonce(v4);
  if (!v8)
    goto LABEL_7;
  v9 = v8;
  if (v8 == 45)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UUIDString"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataUsingEncoding:", 4));
    v13 = (void *)qword_1000348B8;
    qword_1000348B8 = v12;

    if (qword_1000348B8)
    {
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    v17 = sub_100013988((uint64_t)"roll_personalization_nonce_for_image_type_block_invoke", 2244, -2, 0, CFSTR("Failed to create nonce."), v18, v19, v20, v24);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = v5;
      v27 = 1024;
      v28 = v9;
      v29 = 2080;
      v30 = strerror(v9);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll img4 %s nonce: %d (%s)", buf, 0x1Cu);
    }
    strerror(v9);
    v17 = sub_100013988((uint64_t)"roll_personalization_nonce_for_image_type_block_invoke", 2249, -2, 0, CFSTR("Failed to roll img4 %s nonce: %d (%s)"), v14, v15, v16, (uint64_t)v5);
  }
  v21 = objc_claimAutoreleasedReturnValue(v17);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

id sub_100010F78(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000108C8;
  v18 = sub_1000108D8;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000108C8;
  v12 = sub_1000108D8;
  v13 = 0;
  v2 = sub_1000108E0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011088;
  v7[3] = &unk_10002CEB8;
  v7[4] = &v14;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = (void *)v9[5];
  if (a1 && !v4)
  {
    *a1 = objc_retainAutorelease((id)v15[5]);
    v4 = (void *)v9[5];
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_100011088(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  char *v28;
  _OWORD v29[3];
  uint64_t v30;

  v30 = 0;
  memset(v29, 0, sizeof(v29));
  v2 = img4_nonce_domain_copy_nonce(&_img4_nonce_domain_cryptex, v29);
  if (!(_DWORD)v2)
  {
    v9 = objc_alloc((Class)NSData);
    v8 = objc_msgSend(v9, "initWithBytes:length:", (char *)v29 + 2, HIDWORD(v30));
    if (v8)
      goto LABEL_6;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create data.", buf, 2u);
    }
    v20 = CFSTR("Failed to create data.");
    v21 = 2298;
    goto LABEL_16;
  }
  v3 = v2;
  if ((_DWORD)v2 != 45)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v26 = v3;
      v27 = 2080;
      v28 = strerror(v3);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query img4 nonce: %d (%s)", buf, 0x12u);
    }
    strerror(v3);
    v16 = sub_100013988((uint64_t)"copy_cryptex_nonce_block_invoke", 2290, -2, 0, CFSTR("Failed to query img4 nonce: %d (%s)"), v13, v14, v15, v3);
    goto LABEL_17;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  v7 = (void *)qword_1000348B8;
  qword_1000348B8 = v6;

  if (!qword_1000348B8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    v20 = CFSTR("Failed to create nonce.");
    v21 = 2283;
LABEL_16:
    v16 = sub_100013988((uint64_t)"copy_cryptex_nonce_block_invoke", v21, -2, 0, v20, v17, v18, v19, v24);
LABEL_17:
    v22 = objc_claimAutoreleasedReturnValue(v16);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(id *)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;
    goto LABEL_18;
  }
  v8 = (id)qword_1000348B8;
LABEL_6:
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;
  v12 = v8;

LABEL_18:
}

BOOL sub_1000112FC(_QWORD *a1)
{
  id v2;
  NSObject *v3;
  int v4;
  _BOOL8 v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000108C8;
  v12 = sub_1000108D8;
  v13 = 0;
  v2 = sub_1000108E0();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011408;
  v7[3] = &unk_10002CEB8;
  v7[4] = &v8;
  v7[5] = &v14;
  dispatch_sync(v3, v7);

  v4 = *((unsigned __int8 *)v15 + 24);
  if (a1 && !*((_BYTE *)v15 + 24))
  {
    *a1 = objc_retainAutorelease((id)v9[5]);
    v4 = *((unsigned __int8 *)v15 + 24);
  }
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void sub_100011408(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  char *v22;

  v2 = img4_nonce_domain_roll_nonce(&_img4_nonce_domain_cryptex);
  if (!(_DWORD)v2)
    goto LABEL_4;
  v3 = v2;
  if ((_DWORD)v2 == 45)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUIDString"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
    v7 = (void *)qword_1000348B8;
    qword_1000348B8 = v6;

    if (qword_1000348B8)
    {
LABEL_4:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      return;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create nonce.", buf, 2u);
    }
    v11 = sub_100013988((uint64_t)"roll_cryptex_nonce_block_invoke", 2328, -2, 0, CFSTR("Failed to create nonce."), v12, v13, v14, v18);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v20 = v3;
      v21 = 2080;
      v22 = strerror(v3);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to roll img4 cryptex nonce: %d (%s)", buf, 0x12u);
    }
    strerror(v3);
    v11 = sub_100013988((uint64_t)"roll_cryptex_nonce_block_invoke", 2333, -2, 0, CFSTR("Failed to roll img4 cryptex nonce: %d (%s)"), v8, v9, v10, v3);
  }
  v15 = objc_claimAutoreleasedReturnValue(v11);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

}

id sub_1000115DC(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v3 = a1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1000108C8;
  v24 = sub_1000108D8;
  v25 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000108C8;
  v18 = sub_1000108D8;
  v19 = 0;
  v4 = sub_100011718();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011758;
  block[3] = &unk_10002CE90;
  v6 = v3;
  v11 = v6;
  v12 = &v14;
  v13 = &v20;
  dispatch_sync(v5, block);

  v7 = (void *)v21[5];
  if (a2 && !v7)
  {
    *a2 = objc_retainAutorelease((id)v15[5]);
    v7 = (void *)v21[5];
  }
  v8 = v7;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

id sub_100011718()
{
  if (qword_100034898 != -1)
    dispatch_once(&qword_100034898, &stru_10002CF20);
  return (id)qword_1000348A0;
}

void sub_100011758(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t inited;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  __CFString *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  int *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id obj;
  uint64_t v97;
  uint64_t v98;
  _OWORD v99[28];
  uint64_t v100;

  v100 = 0;
  memset(v99, 0, sizeof(v99));
  v97 = 0;
  v98 = 0;
  if (!a1[4])
  {
    v46 = CFSTR("Invalid input(s).");
    v47 = 2373;
LABEL_12:
    v48 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", v47, -2, 0, v46, a6, a7, a8, v93);
    v49 = objc_claimAutoreleasedReturnValue(v48);
    v50 = *(_QWORD *)(a1[5] + 8);
    v51 = *(void **)(v50 + 40);
    *(_QWORD *)(v50 + 40) = v49;

    return;
  }
  v9 = sub_1000177D4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v46 = CFSTR("Failed to query working directory.");
    v47 = 2379;
    goto LABEL_12;
  }
  v11 = (void *)v10;
  v12 = (void *)a1[4];
  v13 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v13 + 40);
  v14 = sub_10001078C(v12, &obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v15)
  {
    v19 = objc_msgSend(objc_alloc((Class)NSString), "initHexStringWithData:", v15);
    if (v19)
    {
      v23 = v19;
      v94 = a1[4];
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("/%@/%@.im4m")));
      if (v24)
      {
        v28 = (void *)v24;
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v30 = objc_msgSend(v29, "fileExistsAtPath:", v28);

        if ((v30 & 1) != 0)
        {
          v34 = objc_alloc((Class)NSData);
          v35 = *(_QWORD *)(a1[5] + 8);
          v95 = *(id *)(v35 + 40);
          v36 = objc_msgSend(v34, "initWithContentsOfFile:options:error:", v28, 0, &v95);
          objc_storeStrong((id *)(v35 + 40), v95);
          if (v36)
          {
            v40 = objc_retainAutorelease(v36);
            inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(v40, "bytes"), (uint64_t)objc_msgSend(v40, "length"), (uint64_t)v99);
            if ((_DWORD)inited)
            {
              v45 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2414, -2, 0, CFSTR("Failed to decode img4 manifest: %d"), v42, v43, v44, inited);
            }
            else
            {
              Img4DecodeGetObjectPropertyData((uint64_t)v99, 1885629799, 1885630061, &v98, &v97);
              if ((_DWORD)v68)
              {
                v45 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2420, -2, 0, CFSTR("Failed to retrieve data from manifest: %d"), v69, v70, v71, v68);
              }
              else
              {
                v75 = objc_alloc((Class)NSString);
                v76 = objc_msgSend(v75, "initWithBytes:length:encoding:", v98, v97, 4);
                if (v76)
                {
                  v77 = v76;
                  if ((objc_msgSend(v76, "isEqualToString:", a1[4]) & 1) != 0)
                  {
                    v81 = *(_QWORD *)(a1[6] + 8);
                    v82 = *(void **)(v81 + 40);
                    *(_QWORD *)(v81 + 40) = v40;
                    v83 = v40;

                  }
                  else
                  {
                    v89 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2431, -2, 0, CFSTR("Manifest type does not match."), v78, v79, v80, v94);
                    v90 = objc_claimAutoreleasedReturnValue(v89);
                    v91 = *(_QWORD *)(a1[5] + 8);
                    v92 = *(void **)(v91 + 40);
                    *(_QWORD *)(v91 + 40) = v90;

                  }
                  goto LABEL_24;
                }
                v84 = __error();
                v85 = strerror(*v84);
                v45 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2426, -2, 0, CFSTR("Failed to create string: %s"), v86, v87, v88, (uint64_t)v85);
              }
            }
            v72 = objc_claimAutoreleasedReturnValue(v45);
            v73 = *(_QWORD *)(a1[5] + 8);
            v74 = *(void **)(v73 + 40);
            *(_QWORD *)(v73 + 40) = v72;

LABEL_23:
LABEL_24:

            goto LABEL_25;
          }
          v64 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2408, -2, *(void **)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("Failed to load manifest at %@."), v37, v38, v39, (uint64_t)v28);
        }
        else
        {
          v64 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2402, -2, 0, CFSTR("%@ does not exist."), v31, v32, v33, (uint64_t)v28);
        }
        v65 = objc_claimAutoreleasedReturnValue(v64);
        v66 = *(_QWORD *)(a1[5] + 8);
        v67 = *(void **)(v66 + 40);
        *(_QWORD *)(v66 + 40) = v65;

        goto LABEL_23;
      }
      v60 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2397, -2, 0, CFSTR("Failed to create manifest path."), v25, v26, v27, v94);
      v61 = objc_claimAutoreleasedReturnValue(v60);
      v62 = *(_QWORD *)(a1[5] + 8);
      v63 = *(void **)(v62 + 40);
      *(_QWORD *)(v62 + 40) = v61;

    }
    else
    {
      v56 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2391, -2, 0, CFSTR("Failed to create hex string."), v20, v21, v22, v93);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      v58 = *(_QWORD *)(a1[5] + 8);
      v59 = *(void **)(v58 + 40);
      *(_QWORD *)(v58 + 40) = v57;

    }
  }
  else
  {
    v52 = sub_100013988((uint64_t)"copy_personalized_image_manifest_block_invoke", 2385, -2, *(void **)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("Failed to copy personalization nonce."), v16, v17, v18, v93);
    v53 = objc_claimAutoreleasedReturnValue(v52);
    v54 = *(_QWORD *)(a1[5] + 8);
    v55 = *(void **)(v54 + 40);
    *(_QWORD *)(v54 + 40) = v53;

  }
LABEL_25:

}

BOOL sub_100011C40(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  _BOOL8 v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v5 = a1;
  v6 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000108C8;
  v27 = sub_1000108D8;
  v28 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v7 = sub_100011718();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011DA4;
  v14[3] = &unk_10002CEE0;
  v9 = v5;
  v15 = v9;
  v10 = v6;
  v16 = v10;
  v17 = &v23;
  v18 = &v19;
  dispatch_sync(v8, v14);

  v11 = *((unsigned __int8 *)v20 + 24);
  if (a3 && !*((_BYTE *)v20 + 24))
  {
    *a3 = objc_retainAutorelease((id)v24[5]);
    v11 = *((unsigned __int8 *)v20 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);

  return v12;
}

void sub_100011DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  unsigned __int8 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  __CFString *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  id v108;
  id v109;
  id v110;
  id obj;
  uint64_t v112;
  uint64_t v113;
  uint8_t buf[4];
  uint64_t v115;
  __int16 v116;
  void *v117;
  NSFileAttributeKey v118;
  _UNKNOWN **v119;
  _OWORD v120[28];
  uint64_t v121;

  v121 = 0;
  memset(v120, 0, sizeof(v120));
  v112 = 0;
  v113 = 0;
  if (!*(_QWORD *)(a1 + 32) || (v9 = *(void **)(a1 + 40)) == 0)
  {
    v15 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2469, -2, 0, CFSTR("Invalid input(s)."), a6, a7, a8, v107);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    return;
  }
  inited = Img4DecodeInitManifest((uint64_t)objc_msgSend(objc_retainAutorelease(v9), "bytes"), (uint64_t)objc_msgSend(*(id *)(a1 + 40), "length"), (uint64_t)v120);
  if (!(_DWORD)inited)
  {
    Img4DecodeGetObjectPropertyData((uint64_t)v120, 1885629799, 1885630061, &v113, &v112);
    if ((_DWORD)v19)
    {
      v14 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2481, -2, 0, CFSTR("Failed to retrieve data from manifest: %d"), v20, v21, v22, v19);
      goto LABEL_8;
    }
    v26 = objc_alloc((Class)NSString);
    v27 = objc_msgSend(v26, "initWithBytes:length:encoding:", v113, v112, 4);
    if (!v27)
    {
      v75 = __error();
      v76 = strerror(*v75);
      v14 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2487, -2, 0, CFSTR("Failed to create string: %s"), v77, v78, v79, (uint64_t)v76);
      goto LABEL_8;
    }
    v28 = v27;
    if ((objc_msgSend(v27, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      v32 = sub_1000177D4();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (v33)
      {
        v34 = (void *)v33;
        v35 = *(void **)(a1 + 32);
        v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v36 + 40);
        v37 = sub_10001078C(v35, &obj);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
        objc_storeStrong((id *)(v36 + 40), obj);
        if (!v38)
        {
          v86 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2504, -2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Failed to copy personalization nonce."), v39, v40, v41, v107);
          v87 = objc_claimAutoreleasedReturnValue(v86);
          v88 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v89 = *(void **)(v88 + 40);
          *(_QWORD *)(v88 + 40) = v87;

          return;
        }
        v42 = objc_msgSend(objc_alloc((Class)NSString), "initHexStringWithData:", v38);
        if (!v42)
        {
          v90 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2510, -2, 0, CFSTR("Failed to create hex string."), v43, v44, v45, v107);
          v91 = objc_claimAutoreleasedReturnValue(v90);
          v92 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v93 = *(void **)(v92 + 40);
          *(_QWORD *)(v92 + 40) = v91;

LABEL_39:
          return;
        }
        v46 = v42;
        v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingPathComponent:", *(_QWORD *)(a1 + 32)));
        if (v47)
        {
          v51 = (void *)v47;
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v53 = objc_msgSend(v52, "fileExistsAtPath:", v51);

          if (v53
            && (v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
                v55 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
                v110 = *(id *)(v55 + 40),
                v56 = objc_msgSend(v54, "removeItemAtPath:error:", v51, &v110),
                objc_storeStrong((id *)(v55 + 40), v110),
                v54,
                (v56 & 1) == 0))
          {
            v99 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2522, -2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Failed to delete manifest folder at %@."), v57, v58, v59, (uint64_t)v51);
          }
          else
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
            v118 = NSFilePosixPermissions;
            v119 = &off_100030650;
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
            v62 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v109 = *(id *)(v62 + 40);
            v63 = objc_msgSend(v60, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v51, 1, v61, &v109);
            objc_storeStrong((id *)(v62 + 40), v109);

            if ((v63 & 1) != 0)
            {
              v107 = (uint64_t)v46;
              v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingFormat:", CFSTR("/%@.im4m")));

              if (v67)
              {
                v68 = *(void **)(a1 + 40);
                v69 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                v108 = *(id *)(v69 + 40);
                v70 = objc_msgSend(v68, "writeToFile:options:error:", v67, 0, &v108);
                objc_storeStrong((id *)(v69 + 40), v108);
                if ((v70 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v74 = *(_QWORD *)(a1 + 32);
                    *(_DWORD *)buf = 138412546;
                    v115 = v74;
                    v116 = 2112;
                    v117 = v67;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully stored %@ manifest at %@.", buf, 0x16u);
                  }
                  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
                }
                else
                {
                  v103 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2539, -2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Failed to write manifest to %@."), v71, v72, v73, (uint64_t)v67);
                  v104 = objc_claimAutoreleasedReturnValue(v103);
                  v105 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
                  v106 = *(void **)(v105 + 40);
                  *(_QWORD *)(v105 + 40) = v104;

                }
                goto LABEL_38;
              }
              v94 = 2534;
              goto LABEL_31;
            }
            v99 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2528, -2, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), CFSTR("Failed to create %@."), v64, v65, v66, (uint64_t)v51);
          }
          v100 = objc_claimAutoreleasedReturnValue(v99);
          v101 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v102 = *(void **)(v101 + 40);
          *(_QWORD *)(v101 + 40) = v100;

          goto LABEL_38;
        }
        v94 = 2516;
LABEL_31:
        v95 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", v94, -2, 0, CFSTR("Failed to create manifest path."), v48, v49, v50, v107);
        v96 = objc_claimAutoreleasedReturnValue(v95);
        v97 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v98 = *(void **)(v97 + 40);
        *(_QWORD *)(v97 + 40) = v96;

LABEL_38:
        goto LABEL_39;
      }
      v80 = CFSTR("Failed to query working directory.");
      v81 = 2498;
    }
    else
    {
      v80 = CFSTR("Manifest type does not match.");
      v81 = 2492;
    }
    v82 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", v81, -2, 0, v80, v29, v30, v31, v107);
    v83 = objc_claimAutoreleasedReturnValue(v82);
    v84 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v85 = *(void **)(v84 + 40);
    *(_QWORD *)(v84 + 40) = v83;

    return;
  }
  v14 = sub_100013988((uint64_t)"store_personalized_image_manifest_block_invoke", 2475, -2, 0, CFSTR("Failed to decode img4 manifest: %d"), v11, v12, v13, inited);
LABEL_8:
  v23 = objc_claimAutoreleasedReturnValue(v14);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

}

BOOL sub_100012424(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  _BOOL8 v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = a1;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000108C8;
  v22 = sub_1000108D8;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v4 = sub_100011718();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001255C;
  block[3] = &unk_10002CE90;
  v6 = v3;
  v11 = v6;
  v12 = &v18;
  v13 = &v14;
  dispatch_sync(v5, block);

  v7 = *((unsigned __int8 *)v15 + 24);
  if (a2 && !*((_BYTE *)v15 + 24))
  {
    *a2 = objc_retainAutorelease((id)v19[5]);
    v7 = *((unsigned __int8 *)v15 + 24);
  }
  v8 = v7 != 0;

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

void sub_10001255C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id obj;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  void *v45;

  if (!a1[4])
  {
    v25 = CFSTR("Invalid input(s).");
    v26 = 2570;
LABEL_11:
    v27 = sub_100013988((uint64_t)"delete_personalized_image_manifest_block_invoke", v26, -2, 0, v25, a6, a7, a8, v39);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = *(_QWORD *)(a1[5] + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    return;
  }
  v9 = sub_1000177D4();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    v25 = CFSTR("Failed to query working directory.");
    v26 = 2576;
    goto LABEL_11;
  }
  v40 = v10;
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", a1[4]));
  if (!v11)
  {
    v31 = sub_100013988((uint64_t)"delete_personalized_image_manifest_block_invoke", 2582, -2, 0, CFSTR("Failed to create manifest path."), v12, v13, v14, v39);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    v33 = *(_QWORD *)(a1[5] + 8);
    v34 = *(void **)(v33 + 40);
    *(_QWORD *)(v33 + 40) = v32;

    return;
  }
  v15 = (void *)v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = objc_msgSend(v16, "fileExistsAtPath:", v15);

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = *(_QWORD *)(a1[5] + 8);
    obj = *(id *)(v19 + 40);
    v20 = objc_msgSend(v18, "removeItemAtPath:error:", v15, &obj);
    objc_storeStrong((id *)(v19 + 40), obj);

    if ((v20 & 1) == 0)
    {
      v35 = sub_100013988((uint64_t)"delete_personalized_image_manifest_block_invoke", 2588, -2, *(void **)(*(_QWORD *)(a1[5] + 8) + 40), CFSTR("Failed to remove manifest at %@."), v21, v22, v23, (uint64_t)v15);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      v37 = *(_QWORD *)(a1[5] + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

      goto LABEL_14;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = a1[4];
      *(_DWORD *)buf = 138412546;
      v43 = v24;
      v44 = 2112;
      v45 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully deleted %@ manifest at %@.", buf, 0x16u);
    }
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
LABEL_14:

}

void sub_1000127FC(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.storage_mounter.nonce", 0);
  v2 = (void *)qword_100034890;
  qword_100034890 = (uint64_t)v1;

}

void sub_100012828(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.storage_mounter.manifest", 0);
  v2 = (void *)qword_1000348A0;
  qword_1000348A0 = (uint64_t)v1;

}

void sub_100012854(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100012864(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

BOOL sub_1000128A0()
{
  return objc_opt_class(IXAppInstallCoordinator) != 0;
}

uint64_t sub_1000128C4(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid argument.", buf, 2u);
    }
    v12 = CFSTR("Invalid argument.");
    v13 = 33;
    v14 = -3;
LABEL_16:
    v15 = sub_100013988((uint64_t)"registerAppsForMountPoint", v13, v14, 0, v12, v9, v10, v11, v24);
    v7 = (id)objc_claimAutoreleasedReturnValue(v15);
    v5 = 0;
    if (!a2)
    {
LABEL_23:
      v8 = 0;
      goto LABEL_24;
    }
LABEL_17:
    v7 = objc_retainAutorelease(v7);
    v8 = 0;
    *a2 = v7;
    goto LABEL_24;
  }
  if (!objc_opt_class(IXAppInstallCoordinator))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "InstallCoordination is not supported.", buf, 2u);
    }
    v12 = CFSTR("InstallCoordination is not supported.");
    v13 = 38;
    goto LABEL_15;
  }
  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL.", buf, 2u);
    }
    v12 = CFSTR("Failed to create URL.");
    v13 = 44;
LABEL_15:
    v14 = -2;
    goto LABEL_16;
  }
  v5 = (void *)v4;
  v25 = 0;
  v6 = +[IXAppInstallCoordinator registerContentsForDiskImageAtURL:options:withError:](IXAppInstallCoordinator, "registerContentsForDiskImageAtURL:options:withError:", v4, 0, &v25);
  v7 = v25;
  if ((v6 & 1) == 0)
  {
    v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to register apps for %@."), v3);
    if (v7)
    {
      v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %@ (%@)"), v16, v7));

      v16 = (id)v17;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    v21 = sub_100013988((uint64_t)"registerAppsForMountPoint", 49, -2, v7, CFSTR("Failed to register apps for %@."), v18, v19, v20, (uint64_t)v3);
    v22 = objc_claimAutoreleasedReturnValue(v21);

    v7 = (id)v22;
    if (!a2)
      goto LABEL_23;
    goto LABEL_17;
  }
  v8 = 1;
LABEL_24:

  return v8;
}

uint64_t sub_100012BB0(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  id v23;
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t buf[16];

  v3 = a1;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid argument.", buf, 2u);
    }
    v15 = CFSTR("Invalid argument.");
    v16 = 73;
    v17 = -3;
LABEL_16:
    v18 = sub_100013988((uint64_t)"unregisterAppsForMountPoint", v16, v17, 0, v15, v12, v13, v14, v22);
    v10 = (id)objc_claimAutoreleasedReturnValue(v18);
    v5 = 0;
    if (!a2)
    {
LABEL_19:
      v11 = 0;
      goto LABEL_20;
    }
LABEL_17:
    v10 = objc_retainAutorelease(v10);
    v11 = 0;
    *a2 = v10;
    goto LABEL_20;
  }
  if (!objc_opt_class(IXAppInstallCoordinator))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "InstallCoordination is not supported.", v25, 2u);
    }
    v15 = CFSTR("InstallCoordination is not supported.");
    v16 = 78;
    goto LABEL_15;
  }
  v4 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL.", v24, 2u);
    }
    v15 = CFSTR("Failed to create URL.");
    v16 = 84;
LABEL_15:
    v17 = -2;
    goto LABEL_16;
  }
  v5 = (void *)v4;
  v23 = 0;
  v6 = +[IXAppInstallCoordinator unregisterContentsForDiskImageAtURL:options:withError:](IXAppInstallCoordinator, "unregisterContentsForDiskImageAtURL:options:withError:", v4, 0, &v23);
  v10 = v23;
  if ((v6 & 1) == 0)
  {
    v19 = sub_100013988((uint64_t)"unregisterAppsForMountPoint", 89, -2, v10, CFSTR("Failed to unregister apps for %@."), v7, v8, v9, (uint64_t)v3);
    v20 = objc_claimAutoreleasedReturnValue(v19);

    v10 = (id)v20;
    if (!a2)
      goto LABEL_19;
    goto LABEL_17;
  }
  v11 = 1;
LABEL_20:

  return v11;
}

CFMutableDictionaryRef sub_100012DD8()
{
  return CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
}

id sub_100012DFC(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_registry_entry_t v6;
  void *CFProperty;
  id v8;
  id v9;
  io_registry_entry_t entry;

  entry = 0;
  v1 = sub_100012F6C(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2)
  {
    v4 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"));
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    entry = MatchingService;
    if (MatchingService)
    {
      v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        v9 = 0;
        CFProperty = 0;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }
      if (sub_10001300C(&entry, "AppleAPFSContainer")
        && sub_10001300C(&entry, "AppleAPFSMedia")
        && sub_10001300C(&entry, "AppleAPFSContainerScheme")
        && sub_10001300C(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
        if (CFProperty)
        {
          v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("/dev/%@"), CFProperty);
          if (v8)
          {
            v9 = v8;
            goto LABEL_14;
          }
        }
      }
      else
      {
        CFProperty = 0;
      }
      v9 = 0;
LABEL_14:
      v6 = entry;
      if (!entry)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v9 = 0;
  CFProperty = 0;
LABEL_18:

  return v9;
}

id sub_100012F6C(void *a1)
{
  id v1;
  void *v2;
  id v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    v4 = CFSTR("/dev/r");
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/r")) & 1) != 0
      || (v4 = CFSTR("/dev/"), objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"))))
    {
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length")));

      v3 = (id)v5;
    }
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t sub_10001300C(io_object_t *a1, const char *a2)
{
  uint64_t result;
  io_registry_entry_t parent;

  result = 0;
  parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0;
      }
    }
    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1;
    }
  }
  return result;
}

id sub_100013094(void *a1)
{
  return a1;
}

id sub_1000130A8(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_100013100(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSDictionary), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_100013158(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_1000131B0(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_100013208(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSData), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

id sub_100013260(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (v1 && (v2 = objc_opt_class(NSURL), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
    v3 = v1;
  else
    v3 = 0;

  return v3;
}

uint64_t sub_1000132B8(void *a1, _QWORD *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  void *v11;
  id CFProperty;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;
  _BYTE entry[12];
  __int16 v26;
  int v27;
  _BYTE v28[3];
  uint64_t v29;
  __int16 v30;
  char v31;

  v3 = a1;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)entry = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }
    v3 = 0;
    goto LABEL_32;
  }
  v4 = sub_100012F6C(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v5
    || (v7 = objc_retainAutorelease(v5),
        v8 = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(v7, "UTF8String")),
        MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8),
        (*(_DWORD *)entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }
  v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }
  if (!sub_100017AA8((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !sub_100017AA8((io_object_t *)entry, "AppleAPFSMedia"))
  {
    v22 = 0;
    v11 = 0;
LABEL_45:
    CFProperty = 0;
    goto LABEL_46;
  }
  v11 = (void *)IORegistryEntrySearchCFProperty(*(io_registry_entry_t *)entry, "IOService", CFSTR("Content Hint"), kCFAllocatorDefault, 0);
  if (!v11 || !objc_msgSend(CFSTR("EF57347C-0000-11AA-AA11-00306543ECAC"), "isEqualToString:", v11))
    goto LABEL_44;
  if (!a2)
  {
    CFProperty = 0;
    goto LABEL_55;
  }
  if (!sub_100017AA8((io_object_t *)entry, "AppleAPFSContainer")
    || !sub_100017AA8((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    v22 = 0;
    goto LABEL_45;
  }
  CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  v13 = sub_1000131B0(CFProperty);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/dev/"), "stringByAppendingString:", CFProperty));

    if (v15)
    {
      CFProperty = objc_retainAutorelease(v15);
      *a2 = CFProperty;
LABEL_55:
      v22 = 1;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry)
    IOObjectRelease(*(io_object_t *)entry);

  if ((v22 & 1) != 0)
  {
    v19 = 6;
    goto LABEL_53;
  }
LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"), *(_QWORD *)entry) & 1) == 0)
  {
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/dev"), "stringByAppendingString:", v3));

    v3 = (id)v16;
  }
  v3 = objc_retainAutorelease(v3);
  v17 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open %@: %{errno}d", entry, 0x12u);
    }
LABEL_32:
    v19 = 0;
    goto LABEL_53;
  }
  v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        v19 = 5;
      }
      else if (v29 == 0x2020205441465845)
      {
        v19 = 4;
      }
      else
      {
        v19 = 1;
      }
    }
    else if (v30 == 11080)
    {
      v19 = 2 * (v31 == 4);
    }
    else if (v31 == 5 && v30 == 22600)
    {
      v19 = 3;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read %@ volume header: %{errno}d", entry, 0x12u);
      v19 = 0;
    }
  }
  close(v18);
LABEL_53:

  return v19;
}

BOOL sub_100013754()
{
  int *v0;
  _BOOL4 v1;
  _BOOL8 result;
  int v3;
  size_t v4;
  uint64_t v5;
  uint8_t buf[4];
  int v7;

  v4 = 8;
  v5 = 0;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0, 0))
    return v5 == 1;
  v0 = __error();
  v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v1)
  {
    v3 = *v0;
    *(_DWORD *)buf = 67109120;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read developer mode status: %{darwin.errno}d", buf, 8u);
    return 0;
  }
  return result;
}

BOOL sub_10001383C(BOOL *a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _BOOL8 v10;
  size_t v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  int v17;

  v13 = 0;
  v12 = 4;
  if (sysctlbyname("security.codesigning.config", &v13, &v12, 0, 0))
  {
    v4 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "security.codesigning.config";
      v16 = 1024;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to read sysctl (%s): %{darwin.errno}d", buf, 0x12u);
    }
    v8 = sub_100013988((uint64_t)"systemSupportsRestrictedExecutionMode", 773, -2, 0, CFSTR("Failed to read sysctl (%s): %{darwin.errno}d"), v5, v6, v7, (uint64_t)"security.codesigning.config");
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (a2 && v9)
    {
      v9 = objc_retainAutorelease(v9);
      *a2 = v9;
    }
  }
  else
  {
    v9 = 0;
    if (a1)
      *a1 = (v13 & 0x2000000) != 0;
  }
  v10 = v9 == 0;

  return v10;
}

id sub_100013988(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v13 = a4;
  v14 = a5;
  v15 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:arguments:", v14, &a9);

  v16 = objc_alloc_init((Class)NSMutableDictionary);
  v17 = v16;
  if (v15)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, NSLocalizedDescriptionKey);
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);
  if (os_variant_allows_internal_security_policies(0))
  {
    if (a1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a2));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v19, CFSTR("SourceLine"));

    }
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileStorage.ErrorDomain"), a3, v17));

  return v20;
}

BOOL sub_100013AFC()
{
  const char *v0;
  const char *v1;
  uint32_t v2;
  uint64_t v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;

  v4 = 0;
  if ((os_parse_boot_arg_int("allow_msm_to_invalidate_attestations", &v4) & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v0 = "";
      *(_DWORD *)buf = 136315650;
      if (!v4)
        v0 = " not";
      v6 = v0;
      v7 = 2080;
      v8 = "allow_msm_to_invalidate_attestations";
      v9 = 2048;
      v10 = v4;
      v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      v2 = 32;
      goto LABEL_8;
    }
  }
  else
  {
    v4 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "allow_msm_to_invalidate_attestations";
      v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
      v2 = 12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }
  return v4 != 0;
}

BOOL sub_100013C40(io_registry_entry_t a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFString *Value;
  _BOOL8 v4;

  v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("Protocol Characteristics"), kCFAllocatorDefault, 3u);
  if (!v1)
    return 0;
  v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, CFSTR("Physical Interconnect"));
  if (Value)
    v4 = CFStringCompare(Value, CFSTR("Virtual Interface"), 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

id sub_100013CC8(int a1)
{
  int v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  statfs *v6;
  int v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  int v14;
  char *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  uint32_t v27;
  void *v28;
  void *v29;
  __CFString *v30;
  id v31;
  id v32;
  id v33;
  __CFString *v34;
  id v35;
  id v36;
  int v37;
  __int128 v39;
  id v40;
  statfs *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t *v46;
  uint64_t v47;
  CFDictionaryRef *v48;
  uint8_t v49[4];
  uint64_t v50;
  uint8_t v51[4];
  const __CFString *f_mntonname;
  uint8_t buf[8];
  __int128 v54;
  char v55;

  v47 = 0;
  v48 = 0;
  v40 = objc_alloc_init((Class)NSMutableDictionary);
  if (v40)
  {
    v2 = getfsstat(0, 0, 2);
    if (v2 < 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
      v41 = 0;
    }
    else
    {
      v3 = v2;
      v4 = 0;
      v41 = 0;
      do
      {
        v5 = 2168 * v3;
        if (v4 > v5)
        {
          if (v41)
            goto LABEL_22;
          goto LABEL_21;
        }
        if (v41)
          free(v41);
        v4 = v5 + 2168;
        v6 = (statfs *)malloc_type_malloc(v5 + 2168, 0x809D8011uLL);
        if (!v6)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
          }
LABEL_21:
          v41 = 0;
          goto LABEL_22;
        }
        v41 = v6;
        v3 = getfsstat(v6, v5 + 2168, 2);
      }
      while ((v3 & 0x80000000) == 0);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
LABEL_22:
      if (v3 > 0)
      {
        v11 = (void *)MGCopyAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), 0);
        v12 = objc_msgSend(v11, "BOOLValue");

        if (((v12 | os_variant_is_recovery("com.apple.mobile.storage_mounter")) & 1) == 0)
        {
          v14 = cryptex_copy_list_4MSM(a1 ^ 1u, &v48, &v47, 0);
          if ((v14 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v15 = strerror(v14);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v14;
              LOWORD(v54) = 2080;
              *(_QWORD *)((char *)&v54 + 2) = v15;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to copy cryptex list (%d (%s)), non-fatal.", buf, 0x12u);
            }
            if (v48)
            {
              cryptex_msm_array_destroy(v48, v47);
              v48 = 0;
            }
            v47 = 0;
          }
        }
        v16 = 0;
        v17 = 0;
        v18 = v3;
        *(_QWORD *)&v13 = 136315138;
        v39 = v13;
        while (1)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&v54 = buf;
          *((_QWORD *)&v54 + 1) = 0x2020000000;
          v55 = 0;
          v19 = sub_10001466C((uint64_t)&v41[v16], v48, v47);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (!v20)
            break;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MountPath")));
          if (!v22)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("MountPath");
              v26 = "Map entry missing value for key %@.";
              v27 = 12;
LABEL_39:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v26, v51, v27);
            }
            goto LABEL_40;
          }
          v23 = v22;
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DiskImageType")));
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Cryptex"));

          if (v25)
          {
            *(_BYTE *)(v54 + 24) = 1;
          }
          else
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_10001537C;
            v43[3] = &unk_10002CF60;
            v32 = v23;
            v44 = v32;
            v45 = v21;
            v46 = buf;
            objc_msgSend(&off_1000306E0, "enumerateObjectsUsingBlock:", v43);

            if (!*(_BYTE *)(v54 + 24))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                sub_10001EA88(v49, (uint64_t)v32, &v50);
              v28 = 0;
              v29 = 0;
              v30 = 0;
              v31 = 0;
              v42 = (uint64_t)v17;
              v23 = v32;
              goto LABEL_62;
            }
          }
          v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DeviceNode"), v39));

          if (v42)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("DeviceType")));
            if (v28)
            {
              if (objc_msgSend(CFSTR("DiskImage"), "isEqualToString:", v28))
              {
                v33 = sub_100015400((uint64_t)v41[v16].f_mntfromname);
                v34 = (__CFString *)objc_claimAutoreleasedReturnValue(v33);
                if (v34)
                {
                  objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("BackingImage"));
                  v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("ImageSignature")));
                  if (v31)
                  {
                    v29 = 0;
                    v30 = v34;
LABEL_61:
                    objc_msgSend(v40, "setObject:forKeyedSubscript:", v21, v42);
                    goto LABEL_62;
                  }
                  v35 = sub_100015400((uint64_t)v41[v16].f_mntfromname);
                  v30 = (__CFString *)objc_claimAutoreleasedReturnValue(v35);

                  if (v30)
                  {
                    v36 = sub_1000155A4(v30);
                    v29 = (void *)objc_claimAutoreleasedReturnValue(v36);
                    if (v29)
                    {
                      v31 = objc_msgSend(objc_alloc((Class)NSMutableData), "initDataWithHexString:", v29);
                      if (v31)
                      {
                        objc_msgSend(v21, "setObject:forKeyedSubscript:", v31, CFSTR("ImageSignature"));
                      }
                      else
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v51 = 138412290;
                          f_mntonname = v30;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to convert signature from %@", v51, 0xCu);
                        }
                        v31 = 0;
                      }
                      goto LABEL_61;
                    }
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v51 = 138412290;
                      f_mntonname = v30;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to recover signature from %@", v51, 0xCu);
                    }
                    v31 = 0;
                    goto LABEL_60;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
LABEL_58:
                    *(_DWORD *)v51 = v39;
                    f_mntonname = (const __CFString *)v41[v16].f_mntonname;
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get backing image path for %s", v51, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  goto LABEL_58;
                }
              }
              v31 = 0;
              v30 = 0;
LABEL_60:
              v29 = 0;
              goto LABEL_61;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("DeviceType");
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v51, 0xCu);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v51 = 138412290;
              f_mntonname = CFSTR("DeviceNode");
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v51, 0xCu);
            }
            v42 = 0;
          }
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v31 = 0;
LABEL_62:
          _Block_object_dispose(buf, 8);

          ++v16;
          v8 = (void *)v42;
          v17 = (void *)v42;
          if (!--v18)
            goto LABEL_79;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v51 = 0;
          v26 = "Failed to create map entry.";
          v27 = 2;
          goto LABEL_39;
        }
LABEL_40:
        v28 = 0;
        v29 = 0;
        v23 = 0;
        v30 = 0;
        v31 = 0;
        v42 = (uint64_t)v17;
        goto LABEL_62;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v37 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v37;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
    }
    v8 = 0;
LABEL_79:
    if (v41)
      free(v41);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v8 = 0;
  }
  if (v48)
    cryptex_msm_array_destroy(v48, v47);

  return v40;
}

void sub_10001464C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id sub_10001466C(uint64_t a1, CFDictionaryRef *a2, uint64_t a3)
{
  uint64_t v3;
  CFDictionaryRef *v4;
  const char *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  __CFString *v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  io_service_t MatchingService;
  uint64_t v26;
  const char *v27;
  size_t v28;
  uint64_t string;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  __CFString *v36;
  const __CFString *v37;
  __CFString **v38;
  __CFString **v39;
  uint64_t v40;
  __CFBundle *Unique;
  CFTypeRef ValueForInfoDictionaryKey;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  io_object_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *__s2;
  unsigned int __s2a;
  const __CFDictionary *matching;
  CFDictionaryRef matchinga;
  CFDictionaryRef matchingb;
  mach_port_t mainPort;
  uint8_t buf[4];
  CFStringRef v58;
  __int16 v59;
  id v60;

  if (!a1 || (v3 = a3, (v4 = a2) == 0) && a3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v4 = 0;
      v11 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
LABEL_8:
      v15 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v6 = "Invalid intput.";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    goto LABEL_7;
  }
  v17 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 1112, 4);
  if (!v17)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v6 = "Failed to create string.";
    goto LABEL_6;
  }
  v14 = v17;
  v18 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 88, 4);
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_8;
  }
  v13 = objc_retainAutorelease(v18);
  v19 = (char *)objc_msgSend(v13, "UTF8String");
  if (!v19)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v35 = "Failed to get C string.";
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
    }
LABEL_52:
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v20 = v19;
  v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", a1 + 72, 4);
  if (!v21)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v35 = "Failed to create string.";
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  v12 = v21;
  v22 = objc_alloc_init((Class)NSMutableDictionary);
  if (!v22)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = 0;
    v11 = 0;
    goto LABEL_8;
  }
  v15 = v22;
  __s2 = v20;
  objc_msgSend(v22, "setObject:forKeyedSubscript:", CFSTR("MassStorage"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("DeviceNode"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, CFSTR("MountPath"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("FilesystemType"));
  objc_msgSend(v15, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("IsMounted"));
  v23 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v14);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v14;
      v59 = 2080;
      v60 = (id)(a1 + 88);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create URL (%@ / %s).", buf, 0x16u);
    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_62;
  }
  v10 = v23;
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent")));
  matching = IOBSDNameMatching(kIOMasterPortDefault, 0, (const char *)objc_msgSend(v24, "UTF8String"));

  if (!matching)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
      *(_DWORD *)buf = 138412290;
      v58 = v36;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create a BSD matching dictionary for %@.", buf, 0xCu);

    }
    v7 = 0;
    v8 = 0;
    v9 = 0;
LABEL_62:
    v4 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, matching);
  mainPort = MatchingService;
  if (!MatchingService || !sub_100013C40(MatchingService))
    goto LABEL_99;
  objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("DiskImage"), CFSTR("DeviceType"));
  if (!strcmp("/Developer", __s2))
  {
    v37 = CFSTR("Developer");
    v38 = &off_10002CC38;
LABEL_98:
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v37, *v38);
    goto LABEL_99;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = &off_10002CC80;
LABEL_97:
    v37 = *v39;
    v38 = &off_10002CC58;
    goto LABEL_98;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = &off_10002CC70;
    goto LABEL_97;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v39 = &off_10002CC60;
    goto LABEL_97;
  }
  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CC78;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CC90;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CC98;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CCA0;
    }
    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CCA8;
    }
    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          matchingb = 0;
          v8 = 0;
          v9 = 0;
          goto LABEL_100;
        }
        objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Cryptex"), CFSTR("DiskImageType"));
        if (v3)
        {
          while (1)
          {
            matchinga = *v4;
            v26 = ((uint64_t (*)(void))cryptex_msm_get_string)();
            if (v26)
            {
              v27 = (const char *)v26;
              v28 = strlen((const char *)(a1 + 1112));
              if (strnstr(v27, (const char *)(a1 + 1112), v28))
              {
                string = cryptex_msm_get_string(matchinga, 1);
                if (string)
                {
                  v30 = string;
                  v31 = cryptex_msm_get_string(matchinga, 0);
                  if (v31)
                    break;
                }
              }
            }
            ++v4;
            if (!--v3)
              goto LABEL_37;
          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v49, CFSTR("CryptexName"));

          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v30));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v50, CFSTR("CryptexVersion"));

        }
LABEL_37:
        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CryptexName")));
        if (!v32
          || (v33 = (void *)v32,
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CryptexVersion"))),
              v34,
              v33,
              !v34))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v58 = v14;
            v59 = 2112;
            v60 = v13;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).", buf, 0x16u);
          }
          v7 = 0;
          matchingb = 0;
          v8 = 0;
          v9 = 0;
          v4 = 0;
          v11 = 0;
LABEL_108:
          v46 = mainPort;
          if (!mainPort)
            goto LABEL_110;
          goto LABEL_109;
        }
LABEL_99:
        matchingb = 0;
        v8 = 0;
        v9 = 0;
        v4 = 0;
LABEL_100:
        v11 = 0;
        goto LABEL_101;
      }
      objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v39 = &off_10002CCB0;
    }
    goto LABEL_97;
  }
  v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("Library/Frameworks/DTRemoteServices.framework")));
  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
    v11 = 0;
    v4 = 0;
    goto LABEL_86;
  }
  v4 = (CFDictionaryRef *)v40;
  Unique = (__CFBundle *)_CFBundleCreateUnique(0, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v40, 0));
  if (!Unique)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle for DTRemoteServices.framework.", buf, 2u);
    }
    v11 = 0;
LABEL_86:
    v9 = 0;
    v8 = 0;
    matchingb = 0;
    goto LABEL_95;
  }
  matchingb = Unique;
  ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(Unique, kCFBundleVersionKey);
  v43 = objc_claimAutoreleasedReturnValue(ValueForInfoDictionaryKey);
  if (v43)
  {
    v11 = (void *)v43;
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", CFSTR("version.plist")));
    if (v44)
    {
      v8 = (void *)v44;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      __s2a = objc_msgSend(v45, "fileExistsAtPath:", v8);

      if (__s2a)
      {
        v9 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", v8);
        if (v9)
        {
LABEL_76:
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, CFSTR("PersonalizedImageVersion"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v9, CFSTR("PersonalizedImageVersionInfo"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
          objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("DeveloperDiskImage"), CFSTR("PersonalizedImageType"));
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0)
            v47 = &__kCFBooleanTrue;
          else
            v47 = &__kCFBooleanFalse;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v47, CFSTR("IsReadOnly"));
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0)
            v48 = &__kCFBooleanTrue;
          else
            v48 = &__kCFBooleanFalse;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v48, CFSTR("SupportsContentProtection"));
          v7 = v15;
          goto LABEL_108;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_10001EAC8((uint64_t)v8, (uint64_t)v11);
      }
      v9 = 0;
      goto LABEL_76;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = kCFBundleVersionKey;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to query bundle key %@.", buf, 0xCu);
    }
    v11 = 0;
  }
  v9 = 0;
  v8 = 0;
LABEL_95:
  v7 = 0;
  v46 = mainPort;
LABEL_109:
  IOObjectRelease(v46);
LABEL_110:
  if (matchingb)
    CFRelease(matchingb);
LABEL_9:

  return v7;
}

void sub_10001537C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  unsigned int v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2) & 1) != 0
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("DiskImageType"))),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Cryptex")),
        v6,
        v7))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_100015400(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  id v8;
  uint8_t buf[4];
  id v10;

  if (!a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Invalid input.";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_10:
    v5 = 0;
    v2 = 0;
    v4 = 0;
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  v1 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", a1);
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "Failed to create string.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v2 = v1;
  v8 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[DiskImages2 imageURLFromDevice:error:](DiskImages2, "imageURLFromDevice:error:", v1, &v8));
  v4 = v8;
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve image URL: %@", buf, 0xCu);
    }
    v5 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
LABEL_12:

  return v5;
}

id sub_1000155A4(void *a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pathComponents"));
  if ((unint64_t)objc_msgSend(v1, "count") >= 4)
  {
    v3 = objc_alloc((Class)NSString);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectAtIndexedSubscript:", (char *)objc_msgSend(v1, "count") - 2));
    v2 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@%@"), v4, v5);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id sub_10001565C()
{
  id v0;
  CFMutableDictionaryRef v1;
  CFMutableDictionaryRef v2;
  void *v3;
  void *v4;
  io_object_t v6;
  io_registry_entry_t v7;
  kern_return_t v8;
  __int16 v9;
  void *Value;
  id v11;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v15;

  properties = 0;
  existing = 0;
  v0 = objc_alloc_init((Class)NSMutableDictionary);
  if (v0)
  {
    v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", &off_100030668, CFSTR("bInterfaceClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_100030680, CFSTR("bInterfaceSubClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &off_100030680, CFSTR("bInterfaceProtocol")), !IOServiceGetMatchingServices(kIOMasterPortDefault, v2, &existing))&& (v6 = IOIteratorNext(existing)) != 0)
    {
      v7 = v6;
      v4 = 0;
      v3 = 0;
      do
      {
        v8 = IORegistryEntryCreateCFProperties(v7, &properties, 0, 0);
        if (v8)
        {
          v9 = v8;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v15) = v9 & 0x3FFF;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: 0x%04x", buf, 8u);
          }
        }
        else
        {
          Value = (void *)CFDictionaryGetValue(properties, CFSTR("locationID"));

          if (Value)
          {
            v11 = objc_alloc_init((Class)NSMutableDictionary);

            if (v11)
            {
              objc_msgSend(v11, "setObject:forKeyedSubscript:", Value, CFSTR("LocationID"));
              objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("PTPCamera"), CFSTR("DeviceType"));
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v11, CFSTR("PTPNode"));
              v3 = v11;
            }
            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }
              v3 = 0;
            }
            v4 = Value;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v15 = "locationID";
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }
            v4 = 0;
          }
        }
        if (properties)
          CFRelease(properties);
        properties = 0;
        IOObjectRelease(v7);
        v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    if (existing)
      IOObjectRelease(existing);
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return v0;
}

id sub_100015984()
{
  const __CFDictionary *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  io_object_t v10;
  io_registry_entry_t v11;
  kern_return_t v12;
  __int16 v13;
  const char *v14;
  uint32_t v15;
  const void *Value;
  void *v17;
  id v18;
  void *v19;
  id v20;
  const void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  void *v28;
  id v29;
  void *v30;
  const void *v31;
  void *v32;
  id v33;
  void *v34;
  const void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  int v41;
  id v42;
  void *v43;
  id v44;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint8_t v50;
  _BYTE v51[15];
  uint8_t v52;
  _BYTE v53[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v56[4];
  uint64_t v57;
  uint8_t v58[4];
  uint64_t v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  const char *v63;
  _BYTE v64[72];
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  properties = 0;
  existing = 0;
  bzero(v64, 0x878uLL);
  v0 = IOServiceMatching("IOMedia");
  v1 = 0;
  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  if (!IOServiceGetMatchingServices(kIOMasterPortDefault, v0, &existing))
  {
    v9 = objc_alloc_init((Class)NSMutableDictionary);
    if (v9)
    {
      v1 = v9;
      v10 = IOIteratorNext(existing);
      if (v10)
      {
        v11 = v10;
        v48 = v1;
        v49 = 0;
        v8 = 0;
        v7 = 0;
        v6 = 0;
        v5 = 0;
        v4 = 0;
        v3 = 0;
        v47 = 1;
        while (1)
        {
          if (!sub_100013C40(v11))
          {
            v12 = IORegistryEntryCreateCFProperties(v11, &properties, 0, 0);
            if (v12)
            {
              v13 = v12;
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v61) = v13 & 0x3FFF;
                v14 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                v15 = 8;
LABEL_9:
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              }
            }
            else
            {
              if (properties)
              {
                Value = CFDictionaryGetValue(properties, CFSTR("BSD Name"));
                v17 = (void *)objc_claimAutoreleasedReturnValue(Value);

                v18 = sub_1000131B0(v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

                if (v19)
                {
                  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("/dev/%@"), v17);

                  if (v20)
                  {
                    v21 = CFDictionaryGetValue(properties, CFSTR("Content"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

                    v23 = sub_1000131B0(v22);
                    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

                    if (v24)
                    {
                      if (objc_msgSend(CFSTR("C12A7328-F81F-11D2-BA4B-00A0C93EC93B"), "isEqualToString:", v22))
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                          sub_10001EB50(&v52, v53, v25);
LABEL_32:
                        v3 = v20;
                        v5 = v22;
                        v6 = v17;
                        goto LABEL_33;
                      }
                      if (objc_msgSend(CFSTR("Apple_partition_map"), "isEqualToString:", v22))
                      {
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                          sub_10001EB88(&v50, v51, v26);
                        goto LABEL_32;
                      }
                      v27 = CFDictionaryGetValue(properties, CFSTR("Removable"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

                      v29 = sub_1000130A8(v28);
                      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

                      if (v30)
                      {
                        if ((objc_msgSend(v28, "BOOLValue") & 1) == 0 && (sub_100016428(v11) & 1) == 0)
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                            sub_10001EC00(v58, (uint64_t)v17, &v59);
                          v3 = v20;
                          v5 = v22;
                          v6 = v17;
LABEL_59:
                          v8 = v28;
                          goto LABEL_33;
                        }
                        v31 = CFDictionaryGetValue(properties, CFSTR("Leaf"));
                        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

                        v33 = sub_1000130A8(v32);
                        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

                        if (v34)
                        {
                          if ((objc_msgSend(v32, "BOOLValue") & 1) != 0)
                          {
                            v46 = v32;
                            v35 = CFDictionaryGetValue(properties, CFSTR("Writable"));
                            v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

                            v37 = sub_1000130A8(v36);
                            v38 = objc_claimAutoreleasedReturnValue(v37);
                            if (v38)
                            {
                              v39 = (void *)v38;
                              v40 = objc_msgSend(v36, "BOOLValue");

                              v47 &= v40 ^ 1;
                            }
                            v41 = sub_1000132B8(v20, 0);
                            if (v41 == 4 || (v41 & 3) == 1)
                            {
                              v3 = objc_retainAutorelease(v20);
                              if ((unint64_t)__strlcpy_chk(&v66, objc_msgSend(v3, "UTF8String"), 1024, 1024) >= 0x400)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_72;
LABEL_71:
                                *(_WORD *)buf = 0;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                                goto LABEL_72;
                              }
                              v3 = objc_retainAutorelease(v3);
                              if ((unint64_t)__strlcpy_chk(&v67, objc_msgSend(v3, "UTF8String"), 1024, 1024) >= 0x400)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_72;
                                goto LABEL_71;
                              }
                              if ((unint64_t)__strlcpy_chk(&v65, "exfat", 16, 16) >= 0x10)
                              {
                                v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                  goto LABEL_71;
LABEL_72:
                                v4 = v36;
                                v5 = v22;
                                v6 = v17;
                                v7 = v46;
                                goto LABEL_33;
                              }
                              v44 = sub_10001466C((uint64_t)v64, 0, 0);
                              v42 = (id)objc_claimAutoreleasedReturnValue(v44);

                              if (!v42)
                              {
                                v8 = v28;
                                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  v49 = 0;
                                  v4 = v36;
                                  v5 = v22;
                                  v6 = v17;
                                  v7 = v46;
                                  goto LABEL_33;
                                }
                                *(_DWORD *)buf = 138412290;
                                v61 = (const char *)v3;
                                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create map entry for %@.", buf, 0xCu);
                                v49 = 0;
                                goto LABEL_72;
                              }
                            }
                            else
                            {
                              v42 = objc_alloc_init((Class)NSMutableDictionary);

                              if (!v42)
                              {
                                v8 = v28;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
                                }
                                v49 = 0;
                                v3 = v20;
                                goto LABEL_72;
                              }
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", CFSTR("MassStorage"), CFSTR("DeviceType"));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", v20, CFSTR("DeviceNode"));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("IsMounted"));
                              v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v47 & 1));
                              objc_msgSend(v42, "setObject:forKeyedSubscript:", v43, CFSTR("IsReadOnly"));

                            }
                            objc_msgSend(v48, "setObject:forKeyedSubscript:", v42, v20);
                            v49 = v42;
                            v3 = v20;
                            v4 = v36;
                            v5 = v22;
                            v6 = v17;
                            v7 = v32;
                          }
                          else
                          {
                            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                              sub_10001EBC0(v56, (uint64_t)v17, &v57);
                            v3 = v20;
                            v5 = v22;
                            v6 = v17;
                            v7 = v32;
                          }
                          goto LABEL_59;
                        }
                        v7 = v32;
                        v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = (const char *)v17;
                          v62 = 2080;
                          v63 = "Leaf";
LABEL_26:
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The attached media object %@ does not have a '%s' flag.", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v8 = v28;
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v61 = (const char *)v17;
                          v62 = 2080;
                          v63 = "Removable";
                          goto LABEL_26;
                        }
                      }
                    }
                    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v61 = (const char *)v17;
                      v62 = 2080;
                      v63 = "Content";
                      goto LABEL_26;
                    }
                    v3 = v20;
                    v5 = v22;
                  }
                  else
                  {
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }
                    v3 = 0;
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  v61 = "BSD Name";
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                }
                v6 = v17;
                goto LABEL_33;
              }
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v14 = "Failed to retrieve any properties for the matched service.";
                v15 = 2;
                goto LABEL_9;
              }
            }
          }
LABEL_33:
          IOObjectRelease(v11);
          if (properties)
            CFRelease(properties);
          properties = 0;
          v11 = IOIteratorNext(existing);
          if (!v11)
          {
            v1 = v48;
            v2 = v49;
            goto LABEL_81;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
      }
      v1 = 0;
    }
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }
LABEL_81:
  if (existing)
    IOObjectRelease(existing);

  return v1;
}

uint64_t sub_100016428(io_registry_entry_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  kern_return_t ParentEntry;
  _QWORD v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = (void (*)(void))sub_100016CCC;
  v10 = &unk_10002CF88;
  v11 = &v12;
  v2 = v8;
  v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0)
          break;
        a1 = parent;
        if (!parent)
          goto LABEL_3;
        ((void (*)(_QWORD *, _QWORD, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v19 = ParentEntry & 0x3FFF;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetParentEntry failed: 0x%04x", buf, 8u);
      }
    }
  }
LABEL_3:

  v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_1000165E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

id sub_100016608(int a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_alloc_init((Class)NSMutableDictionary);
  if (v2)
  {
    v3 = sub_10001565C();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    if (v4)
      objc_msgSend(v2, "addEntriesFromDictionary:", v4);
    v5 = sub_100015984();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    if (v6)
      objc_msgSend(v2, "addEntriesFromDictionary:", v6);
    v7 = sub_100013CC8(a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v8)
    {
      objc_msgSend(v2, "addEntriesFromDictionary:", v8);

    }
  }
  return v2;
}

id sub_1000166A8(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = sub_100016754(CFSTR("MassStorage"), CFSTR("DeviceNode"), a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = v2;
  if (v2
    && objc_msgSend(v2, "count")
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0)),
        v5 = sub_100013100(v4),
        v6 = (void *)objc_claimAutoreleasedReturnValue(v5),
        v6,
        v4,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id sub_100016754(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  const __CFString *v41;
  _BYTE v42[128];

  v7 = a1;
  v33 = a2;
  v32 = a3;
  if (!v7 || !v33 || !v32)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    goto LABEL_26;
  }
  v8 = sub_100016608(a4);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (!v9)
  {
    v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v26)
      sub_10001EC40(v26, v27, v28);
LABEL_26:
    v31 = 0;
    v29 = 0;
    v13 = 0;
    v10 = 0;
    goto LABEL_32;
  }
  v10 = (id)v9;
  v31 = objc_alloc_init((Class)NSMutableArray);
  if (v31)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v10 = v10;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v11)
    {
      v12 = v11;
      v35 = 0;
      v13 = 0;
      v14 = *(_QWORD *)v37;
      do
      {
        v15 = 0;
        v34 = v12;
        do
        {
          v16 = v13;
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v10);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v15)));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DeviceType")));

          if (v13)
          {
            if (objc_msgSend(v13, "isEqual:", v7))
            {
              v18 = v14;
              v19 = v10;
              v20 = v7;
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v33));

              v22 = sub_1000131B0(v21);
              v23 = objc_claimAutoreleasedReturnValue(v22);
              if (v23)
              {
                v24 = (void *)v23;
                v25 = objc_msgSend(v21, "isEqual:", v32);

                if (v25)
                  objc_msgSend(v31, "addObject:", v17);
              }
              v35 = v21;
              v7 = v20;
              v10 = v19;
              v14 = v18;
              v12 = v34;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v41 = CFSTR("DeviceType");
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          v15 = (char *)v15 + 1;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      }
      while (v12);
    }
    else
    {
      v35 = 0;
      v13 = 0;
    }

    v29 = v35;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    v31 = 0;
    v29 = 0;
    v13 = 0;
  }
LABEL_32:

  return v31;
}

id sub_100016AC8(void *a1, int a2)
{
  return sub_100016754(CFSTR("DiskImage"), CFSTR("DiskImageType"), a1, a2);
}

id sub_100016AEC(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  unsigned __int8 v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v3 = a1;
  v4 = sub_100016608(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (v5)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v8)
    {
      v9 = v8;
      v25 = v6;
      v10 = 0;
      v11 = *(_QWORD *)v27;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12)));
        v14 = sub_100013100(v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MountPath")));

          v10 = (void *)v16;
        }
        v17 = sub_1000131B0(v10);
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          v19 = (void *)v18;
          v20 = objc_msgSend(v10, "isEqualToString:", v3);

          if ((v20 & 1) != 0)
            break;
        }

        if (v9 == (id)++v12)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v9)
            goto LABEL_4;
          v13 = 0;
          break;
        }
      }
      v6 = v25;
    }
    else
    {
      v10 = 0;
      v13 = 0;
    }

  }
  else
  {
    v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v21)
      sub_10001EC40(v21, v22, v23);
    v10 = 0;
    v13 = 0;
  }

  return v13;
}

void sub_100016CCC(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty;
  const void *v6;

  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("removable"), 0, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    if (CFEqual(CFProperty, kCFBooleanTrue))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

id sub_100016D54(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  uint32_t v11;
  id v12;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  id v17;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initHexStringWithData:", v3);
  v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v8 = 0;
      v7 = 0;
      v9 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v10 = "Failed to create hex string with data.";
    v11 = 2;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v10, buf, v11);
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "length") != (id)256
    && objc_msgSend(v6, "length") != (id)96
    && objc_msgSend(v6, "length") != (id)40)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109378;
    v15 = objc_msgSend(v6, "length");
    v16 = 2112;
    v17 = v3;
    v10 = "Unsupported signature length: %d characters (%@)";
    v11 = 18;
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1));
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@/%@/%@"), v4, v7, v8);
LABEL_10:
  v12 = v9;

  return v12;
}

uint64_t sub_100016F38(const char *a1)
{
  _QWORD *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  uint64_t result;
  _QWORD v15[2];
  uint64_t (*v16)(uint64_t);
  void *v17;
  _BYTE *v18;
  const char *v19;
  char __s1[1024];
  _BYTE buf[24];
  char v22;

  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400)
    goto LABEL_18;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v16 = sub_100017B54;
  v17 = &unk_10002CFD0;
  v18 = buf;
  v19 = a1;
  v2 = v15;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a1, strlen(a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));
  v7 = objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = (char *)objc_msgSend(v7, "count");
    if (v8)
    {
      do
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v7));
        v10 = v9;
        if (v9)
        {
          v11 = objc_retainAutorelease(v9);
          v12 = objc_msgSend(v11, "fileSystemRepresentation");
          if (!((unsigned int (*)(_QWORD *, id))v16)(v2, v12))
          {

            break;
          }
          objc_msgSend(v7, "removeLastObject");
        }

      }
      while (--v8);
    }
  }

  v13 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (v13 || !realpath_DARWIN_EXTSN(a1, __s1) || (result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = __s1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }
    return 1;
  }
  return result;
}

void sub_100017184(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000171A8(const char *a1, removefile_flags_t a2)
{
  _removefile_state *v4;
  _removefile_state *v5;
  int v6;
  int *v7;
  char *v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  int *v14;
  char *v15;
  int value;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  char *v21;

  value = 0;
  v4 = removefile_state_alloc();
  if (v4)
  {
    v5 = v4;
    if (removefile_state_set(v4, 3u, sub_1000173E0)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      v19 = v6;
      v20 = 2080;
      v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      v19 = v9;
      v20 = 2080;
      v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile(a1, v5, a2))
    {
      v12 = 0;
      if (*__error() != 2 || value)
        goto LABEL_17;
    }
    else if (value)
    {
      v12 = 0;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }
    v12 = 1;
    goto LABEL_17;
  }
  v12 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *__error();
    v14 = __error();
    v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    v19 = v13;
    v20 = 2080;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_alloc failed: %d (%s)", buf, 0x12u);
    return 0;
  }
  return v12;
}

uint64_t sub_1000173E0(_removefile_state *a1, const char *a2, int *a3)
{
  int v5;
  int v6;
  int *v7;
  char *v8;
  const char *v9;
  int v10;
  int *v11;
  char *v12;
  int v13;
  int *v14;
  char *v15;
  stat v17;
  int dst;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  char *v24;

  dst = 0;
  memset(&v17, 0, sizeof(v17));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v20) = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "removefile_state_get failed: %{errno}d", buf, 8u);
    }
    dst = 2;
    goto LABEL_17;
  }
  if (dst == 1)
  {
    if (lstat(a2, &v17))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *__error();
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v6;
        v23 = 2080;
        v24 = v8;
        v9 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v9, buf, 0x1Cu);
      }
    }
    else
    {
      if ((v17.st_flags & 2) == 0)
        goto LABEL_17;
      if (lchflags(a2, v17.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v10 = *__error();
        v11 = __error();
        v12 = strerror(*v11);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v10;
        v23 = 2080;
        v24 = v12;
        v9 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }
      if (!unlink(a2))
        return 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 136315650;
        v20 = a2;
        v21 = 1024;
        v22 = v13;
        v23 = 2080;
        v24 = v15;
        v9 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }
LABEL_17:
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

id sub_100017678(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  uint32_t v8;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;

  v1 = a1;
  v2 = v1;
  v10 = 1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Invalid input.";
      v8 = 2;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v7, buf, v8);
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v3 = objc_retainAutorelease(v1);
  v4 = container_system_group_path_for_identifier(0, objc_msgSend(v3, "UTF8String"), &v10);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = v10;
      v7 = "Failed to copy system group container (%@): %d";
      v8 = 18;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v5 = (void *)v4;
  v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", v4);
  free(v5);
LABEL_10:

  return v6;
}

id sub_1000177D4()
{
  if (qword_1000348A8 != -1)
    dispatch_once(&qword_1000348A8, &stru_10002CFA8);
  return (id)qword_1000348B0;
}

void sub_100017814(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = sub_100017678(CFSTR("systemgroup.com.apple.mobilestorageproxy"));
  v4 = (id)objc_claimAutoreleasedReturnValue(v1);
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("backingStore")));
  v3 = (void *)qword_1000348B0;
  qword_1000348B0 = v2;

}

uint64_t sub_100017868(void *a1, void *a2, id a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      if (objc_msgSend(v9, "isEqualToString:", v7))
      {
        v10 = objc_msgSend(v5, "code");

        if (v10 == a3)
        {
          v8 = 1;
          goto LABEL_9;
        }
      }
      else
      {

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userInfo"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", NSUnderlyingErrorKey));

      v5 = (id)v12;
    }
    while (v12);
    v8 = 0;
  }
LABEL_9:

  return v8;
}

id sub_100017944(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *CFProperty;
  io_registry_entry_t v6;
  io_object_t v7;

  v3 = a2;
  v4 = v3;
  CFProperty = 0;
  if (a1 && v3)
  {
    v6 = IORegistryEntryFromPath(kIOMainPortDefault, (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
    if (v6)
    {
      v7 = v6;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0, 0);
      IOObjectRelease(v7);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return CFProperty;
}

id sub_1000179D4(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned int v15;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  v15 = 0;
  if (!a1)
    goto LABEL_6;
  v8 = v5;
  if (a2)
  {
    v9 = sub_100017944(a1, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v10 = sub_100013208(v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = objc_msgSend(v7, "length");

      if (v13 == (id)4)
      {
        objc_msgSend(v7, "getBytes:length:", &v15, 4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v15));

        goto LABEL_7;
      }
    }
LABEL_6:
    v8 = v6;
  }
LABEL_7:

  return v8;
}

uint64_t sub_100017AA8(io_object_t *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v5;
  io_iterator_t iterator;

  v2 = 0;
  iterator = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      v2 = 0;
    }
    else
    {
      while (1)
      {
        v5 = IOIteratorNext(iterator);
        v2 = v5;
        if (!(_DWORD)v5)
          break;
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          v2 = 1;
          break;
        }
        IOObjectRelease(v2);
      }
    }
    if (iterator)
      IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t sub_100017B54(uint64_t a1)
{
  uint64_t result;
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  stat v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;

  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    result = 1;
    if ((v8.st_mode & 0xF000) != 0xA000)
      return result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  if (*__error() == 2)
    return 1;
  v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0;
  }
  return result;
}

void sub_100017C9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_100017CA8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020CC8, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&unk_100020ED6, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  Img4DecodeEvaluateTrustWithCallbacks(a1, a2, a3, (unsigned int (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))img4_verify_signature_with_chain, (unsigned int (*)(uint64_t, uint64_t))Img4DecodeEvaluateCertificateProperties, (void (*)(_QWORD, _QWORD, uint64_t))sha1_digest, a4);
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(_QWORD, _QWORD, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6))
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4Decode(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u,
                   v8 = 0u,
                   result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
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

  result = 6;
  if (a1 && a2)
  {
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
    result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_1000185C4(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(_QWORD *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(_QWORD *a1, unint64_t a2)
{
  return sub_1000185C4(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v18 = 0;
  v19 = 0;
  v20 = 0;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              v16 = 0u;
              v17 = 0u;
              v14 = 0u;
              v15 = 0u;
              result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011)
                  return 2;
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result)
                    return result;
                  if (v18 != 0x2000000000000010)
                    return 2;
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    v12 = *((_QWORD *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result)
                      return result;
                    if (v18 == 4)
                    {
                      result = 0;
                      v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;

  result = 6;
  if (a1)
  {
    if (a3)
    {
      v14 = 0;
      v15 = 0uLL;
      v13 = 0uLL;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
      result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010)
          return 2;
        result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result)
          return result;
        if (v14 != 22)
          return 2;
        result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result)
          return result;
        if ((v8 | 0xE000000000000000) != a2)
          return 2;
        *(_OWORD *)a3 = v15;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result)
          return result;
        *(_QWORD *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1)
          return 2;
        v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;

  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_100018B50(a1, a2, a3, 0x4D414E42u);
}

void sub_100018B50(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  sub_100018B50(a1, a2, a3, 0x43525450u);
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v11 = 0;
  v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  v15 = 0;
  result = 0xFFFFFFFFLL;
  v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010)
            return 2;
          result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result)
            return result;
          if (v11)
          {
            result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1))
                return 7;
              v9 = __CFADD__(v12, v8);
              v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  BOOL v5;

  v5 = 0;
  result = 6;
  if (!a1 || !a2 || (result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2)
      return result;
    goto LABEL_7;
  }
  if (v5)
  {
    result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  result = 1;
  if (!a2)
    return result;
LABEL_7:
  if ((_DWORD)result)
    *a2 = 0;
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 152))
      v4 = *(_QWORD *)(a1 + 160) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 168))
      v4 = *(_QWORD *)(a1 + 176) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  BOOL v11;

  v11 = 0;
  result = 6;
  if (!a1)
    goto LABEL_14;
  if (!a2)
    goto LABEL_14;
  if (!a3)
    goto LABEL_14;
  result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
    goto LABEL_13;
  result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
  {
LABEL_13:
    result = 1;
    goto LABEL_14;
  }
  v9 = 0u;
  v10 = 0u;
  v8 = *(_QWORD *)(a1 + 168);
  v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    result = 0xFFFFFFFFLL;
    if (!a2)
      return result;
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if ((_DWORD)result
    || (result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2)
      return result;
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(_QWORD, _QWORD, __int128 *), uint64_t a3, int a4)
{
  __int128 v7;
  BOOL v9;
  __int128 v10;
  int v11;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v7;
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9)
    goto LABEL_9;
  if (*(_BYTE *)a1)
  {
    v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
    a2(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), &v10);
    *(_QWORD *)&v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  BOOL v10;
  _OWORD __src[3];

  v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  v4 = (*a4)(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4)
                    memcpy(a2, __src, a3);
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  __int128 v5;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v5;
LABEL_8:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_8;
  if (*(_BYTE *)(a1 + 1))
  {
    v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(_QWORD *)&v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  uint64_t (*v7)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD);
  uint64_t v8;
  _OWORD v10[3];

  v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          v7 = *a4;
          if (*a4)
          {
            v8 = *(_QWORD *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                v4 = v7(v8, *(_QWORD *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4)
                  memcpy(__dst, v10, __n);
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;

  result = 6;
  if (a1 && a2 && a3)
  {
    v5 = *(_QWORD *)(a1 + 24);
    *a2 = v5;
    v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(_QWORD *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      v4 = v6;
      if (!(_DWORD)v6)
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  Img4DecodeGetIntegerFromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  Img4DecodeGetInteger64FromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  Img4DecodeGetDataFromSection(a1, 1u, a2, a3, a4);
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (!a1)
    return 6;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result)
        *a2 = (_QWORD)v8 != 0;
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];
  _OWORD v12[4];

  if (a1)
  {
    if (a4)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v10 = 0uLL;
        v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(_QWORD *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8)
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v5;
  int v6;
  int v7;
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

  if (a1)
  {
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
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
    if (a3)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v19 = 0uLL;
        v20 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v15 = 0uLL;
        v16 = 0uLL;
        v13 = 0uLL;
        v14 = 0uLL;
        v11 = 0uLL;
        v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((_QWORD)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7)
                  *a3 = (_QWORD)v8 != 0;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (!a1)
    return 6;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((_QWORD)v9)
        {
          result = 0;
          v7 = *((_QWORD *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(_QWORD *a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t result;
  uint64_t (*v8)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD);
  _OWORD v9[3];

  result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, _QWORD *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17[3];
  unint64_t v18;
  unint64_t v19[2];
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22[2];
  unint64_t v23[2];

  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((_QWORD)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8)
                        break;
                      if (v8 == 1)
                        return;
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9)
                    break;
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4)
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger64((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    v7 = v10;
    *a3 = *((_QWORD *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!(_DWORD)v6)
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;
  _QWORD v15[2];

  if (a3 && a4)
  {
    v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    v12 = 0uLL;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      v8 = 0;
      *a3 = 0;
    }
    else
    {
      v8 = v11;
      *a3 = *((_QWORD *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!Img4DecodeSectionExists((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) == 1)
    {
      if (a3)
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      else
        return 6;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = 6;
  if (a3 && a4)
  {
    v8 = *a1;
    v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((_QWORD *)&v14 + 1) == 4)
      {
        result = 0;
        *a3 = *((_QWORD *)&v13 + 1);
        v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      result = 2;
    }
    v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(_QWORD *a1)
{
  sub_10001A5A4(a1, 0);
}

void sub_10001A5A4(_QWORD *a1, _OWORD *a2)
{
  __int128 *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 __s2;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__s1;
  size_t __n;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20[2];
  unint64_t v21[3];

  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v19 = 0;
  v18 = 0uLL;
  __n = 0;
  v17 = 0;
  v14 = 0;
  __s1 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __s2 = 0uLL;
  v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17))
        return;
      v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((_QWORD *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5)
              break;
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9))
              return;
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((_QWORD *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6)
                return;
              if (__n != *((_QWORD *)&__s2 + 1))
                return;
              v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6)
                return;
            }
            else if (*((_QWORD *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((_QWORD *)&v10 + 1) != 0xA000000000000001 || v6 != 1)
                return;
              v6 = 0;
            }
            if (v6)
              return;
          }
          if (v5 != 1)
            return;
          break;
        case 0xE00000006D616E78:
          if (a2)
            *a2 = v18;
          break;
        case 0xE00000004F424A50:
          v4 = (__int128 *)(a1 + 9);
          if (a1[9])
            goto LABEL_11;
          v4 = (__int128 *)(a1 + 9);
          if (a1[10])
            goto LABEL_11;
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  int v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[48];
  _BYTE v17[208];

  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        v10[2] = Img4DecodeDigestReturnHash;
        *(_QWORD *)&v13 = &unk_100022178;
        *((_QWORD *)&v13 + 1) = 156;
        v14 = a3;
        v15 = v10;
        sub_10001A5A4(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              v11[2] = a1;
              v12 = v17;
              if (!((unsigned int (*)(_QWORD, _BYTE **))*v15)(*(_QWORD *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))sub_10001B69C, (uint64_t)v11)&& !((unsigned int (*)(_QWORD, _BYTE **, uint64_t, _BYTE *))v15[2])(*(_QWORD *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  if (!a3)
    return 6;
  result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1)
        return 0;
      if ((_DWORD)result)
        return result;
      result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result)
        return result;
      result = 2;
      if (*((_QWORD *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16))
        break;
      v10 = v15;
      LODWORD(v11) = v16;
      v12 = *((_QWORD *)&v9 + 1);
      result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;

  if (a1 && a3)
  {
    *(_QWORD *)&v5 = a1;
    *((_QWORD *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(_QWORD *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_10001AC70(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = DERImg4DecodeCertificate(&v15, v10);
      else
        result = DERImg4DecodeUnsignedCertificate(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = DERImg4DecodeManifest(&v15, v9);
      else
        result = DERImg4DecodeUnsignedManifest(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeInitCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 1, a3, 1229796419);
}

uint64_t Img4DecodeInitUnsignedCertificate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10001AC70(a1, a2, 0, a3, 1229796419);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  void (*v9)(uint64_t);

  result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(_QWORD, _QWORD, uint64_t), uint64_t a7)
{
  int v14;
  int v15;
  BOOL v16;
  _OWORD v17[3];

  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(_QWORD *)(a2 + 24))
      {
        v16 = 0;
        a6(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376);
        if (!a4(*(_QWORD *)(a2 + 296), *(unsigned int *)(a2 + 304), *(_QWORD *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_10001B3D8(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10001B3D8(a1, a2, a3, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  sub_10001B3D8(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;
  __int128 v17;
  __int128 v18;
  __int128 v19;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[5];
  uint64_t v41;

  v41 = 0;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = 6;
  v17 = 0u;
  v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (sub_10001AC70(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(_QWORD, _QWORD, char *, _QWORD, uint64_t))a9)(*((_QWORD *)&v33 + 1), v34, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, char *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a9 + 16))(a1, a2, *((_QWORD *)&v34 + 1), v35, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9, a10, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19,
           *((_QWORD *)&v19 + 1),
           v20,
           *((_QWORD *)&v20 + 1),
           v21,
           *((_QWORD *)&v21 + 1),
           v22,
           *((_QWORD *)&v22 + 1),
           v23,
           *((_QWORD *)&v23 + 1),
           v24,
           *((_QWORD *)&v24 + 1),
           v25,
           *((_QWORD *)&v25 + 1),
           v26,
           *((_QWORD *)&v26 + 1),
           v27,
           *((_QWORD *)&v27 + 1),
           v28,
           *((_QWORD *)&v28 + 1),
           v29,
           *((_QWORD *)&v29 + 1),
           v30,
           *((_QWORD *)&v30 + 1),
           v31,
           *((_QWORD *)&v31 + 1),
           v32,
           *((_QWORD *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10001B3D8(a1, a2, a3, a4, 0, a5);
}

void sub_10001B3D8(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t (*v13)(uint64_t, uint64_t);
  const void *v14;
  int v15;
  int v16;
  unsigned int (*v17)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t);
  unint64_t v18;
  unint64_t *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  v22 = 0;
  v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      v21 = 0;
      if (a4)
      {
        if (*(_QWORD *)a3)
        {
          if (*(_QWORD *)a4)
          {
            if (*(_QWORD *)(a4 + 24))
            {
              if (*(_QWORD *)(a4 + 8))
              {
                if (*(_QWORD *)(a4 + 16))
                {
                  v9 = *(_QWORD **)(a4 + 32);
                  if (v9)
                  {
                    if (*(_QWORD *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(_QWORD **)(a4 + 32)))
                      {
                        v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(_QWORD **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(_QWORD, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(_QWORD *)(a2 + 280), *(_QWORD *)(a2 + 288), a2 + 376,
                               **(_QWORD **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16)
                        return;
                      if ((a5 & 1) == 0)
                      {
                        v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        v18 = a1 | 0xE000000000000000;
                        v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6))
                            return;
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20)
                            return;
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(_QWORD **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184, **(_QWORD **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(_BYTE *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10001B3D8(0, a1, a2, a3, 1, a4);
}

uint64_t sub_10001B69C(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11[3];
  unint64_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v10 = a1;
  if (a3)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD **)a4;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((_QWORD *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(_QWORD *)a2);
  return 0;
}

uint64_t sha1_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return ccdigest(sha1_digest_info, a2, a1, a3);
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = sub_10001B854((uint64_t)v13, v9[4], v11, v12, 3072);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t sub_10001B854(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  unint64_t v9;
  size_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  _BYTE *v15;
  __int128 i;
  unint64_t v17;
  BOOL v18;
  int v19;
  int v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[2];
  _QWORD v24[2];

  if (a5 != 4096 && a5 != 3072)
    return 0xFFFFFFFFLL;
  v24[0] = 0;
  v24[1] = 0;
  v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  *v11 = v9;
  v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(_QWORD *)a1;
  v23[1] = v12;
  v21 = 0u;
  v22 = 0u;
  result = DERParseSequenceToObject((uint64_t)v23, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)&v21, 0x20uLL, 0x20uLL);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v14 = *((_QWORD *)&v21 + 1);
  v15 = (_BYTE *)v21;
  for (i = v22; v14; --v14)
  {
    if (*v15)
      break;
    if (v15 == (_BYTE *)-1)
      __break(0x5513u);
    ++v15;
  }
  if (v14 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  v17 = (v14 + 7) >> 3;
  if (v17 > *v11)
    return 0xFFFFFFFFLL;
  *v11 = v17;
  if (ccrsa_make_pub(v11, *((_QWORD *)&i + 1), i))
    return 0xFFFFFFFFLL;
  if (&_ccrsa_verify_pkcs1v15_digest)
    v18 = &CCRSA_PKCS1_FAULT_CANARY == 0;
  else
    v18 = 1;
  if (!v18)
  {
    v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    if (!v20 && !cc_cmp_safe(16, &CCRSA_PKCS1_FAULT_CANARY, v24))
      return 0;
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v21) = 0;
  v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21)
    return 0;
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = sub_10001B854((uint64_t)v13, v9[4], v11, v12, 4096);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                v7 = *(_QWORD **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(_QWORD *)(a7 + 48) && *v7 == a6)
                  {
                    v10[0] = a1;
                    v10[1] = a2;
                    v9[0] = a3;
                    v9[1] = a4;
                    v8[0] = a5;
                    v8[1] = a6;
                    sub_10001BB80(v10, v8, v9);
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_10001BB80(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  _QWORD *cp;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  size_t v15;
  _QWORD *v16;
  _BYTE v17[7];
  char v18;

  v18 = 0;
  v6 = ccec_x963_import_pub_size(a1[1]);
  if (ccec_keysize_is_supported())
  {
    cp = (_QWORD *)ccec_get_cp(v6);
    v8 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v8, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      v9 = 24 * v8;
      v10 = __CFADD__(v9, 16);
      v11 = v9 + 16;
      if (!v10)
      {
        v10 = __CFADD__(v11, 16);
        v12 = v11 + 16;
        if (!v10)
        {
          v13 = cp;
          v14 = v12 - 1;
          __chkstk_darwin();
          v16 = &v17[-v15];
          bzero(&v17[-v15], v15);
          if (v14 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *v16 = v13;
            if (!ccec_import_pub(v13, a1[1], *a1, v16))
              ccec_verify(v16, a2[1], *a2, a3[1], *a3, &v18);
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t result;
  unsigned int v9;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  unint64_t *v19;
  size_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  unint64_t v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[216];
  _BYTE v32[24];
  unint64_t v33[30];
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41[2];
  unint64_t v42[2];
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46[2];
  unint64_t v47[3];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!sub_10001D164(v26, (uint64_t)v27, 3u)
          && !sub_10001BFC8((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          v15 = 0;
          v16 = (const void **)v32;
          v17 = &v30;
          v18 = (const void **)v32;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = sub_10001C22C(&v34[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42))
                return 0xFFFFFFFFLL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                v43 = 0u;
                v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1)
                        goto LABEL_14;
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  v25 = v44;
                  result = DEROidCompare((uint64_t)&off_10002D558, (uint64_t)&v25);
                  if (!(_DWORD)result)
                    return 0xFFFFFFFFLL;
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  if (!v38)
                    return 0;
                  v23 = v39;
                  if (!v39)
                    return 0;
                  result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      result = 0;
                      *a5 = v38;
                      *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_10001BFC8(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;

  if (!a2)
    return 0;
  v8 = 0;
  v15 = result;
  v18 = ~result;
  v17 = ~a3;
  v14 = ~a4;
  v13 = ~a5;
  v11 = ~a6;
  v10 = a2;
  while (1)
  {
    v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17)
      break;
    result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (160 * v8 > v14)
      break;
    result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v13)
      break;
    v22 = 0u;
    v23 = 0u;
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result)
      return 0xFFFFFFFFLL;
    if (*((_QWORD *)&v20 + 1))
    {
      if (*((_QWORD *)&v20 + 1) != 2 || *(_BYTE *)v20 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v20 == -1)
        break;
      if (*(_BYTE *)(v20 + 1))
        return 0xFFFFFFFFLL;
    }
    result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21)
      return 0xFFFFFFFFLL;
    if (v9 > v11)
      break;
    result = sub_10001D23C(a4 + 160 * v8, (_QWORD *)(a6 + 16 * v8));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (++v8 == v10)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10001C22C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(_QWORD *)a3
    || !*(_QWORD *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((_QWORD *)&v12 + 1))
  {
    result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((_QWORD *)&v12 + 1) != 2 || *(_BYTE *)v12 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(_BYTE *)(v12 + 1))
        return 0xFFFFFFFFLL;
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(_QWORD *)(a3 + 40)))
    return 0xFFFFFFFFLL;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _OWORD *, _QWORD, uint64_t))a3)(*a2, a2[1], v13, **(_QWORD **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10))
    return 0xFFFFFFFFLL;
  if (v10)
    return 0xFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, _OWORD *, _QWORD, uint64_t, _QWORD))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(_QWORD **)(a3 + 32), a3, 0);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C56C);
}

uint64_t sub_10001C3DC(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[2];
  _BYTE v22[48];
  _OWORD v23[9];
  uint64_t v24;
  void *__s1;
  size_t __n;
  _QWORD v27[6];
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2))
          return 0xFFFFFFFFLL;
        result = sub_10001BFC8((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          v16 = 1;
          v17 = 1;
          while ((v16 & 1) != 0)
          {
            v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              result = sub_10001C22C(v27, &v23[3 * v17], a7);
              v16 = 0;
              v17 = 2;
              if (!(_DWORD)result)
                continue;
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (v19 = v30) != 0)
          {
            result = 0;
            if (a5 && a6)
            {
              result = 0;
              *a5 = v29;
              *a6 = v19;
            }
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10001C56C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C5AC);
}

uint64_t sub_10001C5AC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C5EC);
}

uint64_t sub_10001C5EC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C62C);
}

uint64_t sub_10001C62C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C66C);
}

uint64_t sub_10001C66C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C6AC);
}

uint64_t sub_10001C6AC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C6EC);
}

uint64_t sub_10001C6EC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C72C);
}

uint64_t sub_10001C72C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C76C);
}

uint64_t sub_10001C76C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C7AC);
}

uint64_t sub_10001C7AC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C7EC);
}

uint64_t sub_10001C7EC(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001C3DC(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001C82C);
}

uint64_t sub_10001C82C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  _QWORD *v19;
  size_t v20;
  const void *v21;
  uint64_t v22;
  _QWORD *v25;
  _QWORD v26[2];
  _BYTE v27[48];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[264];
  _OWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !sub_10001CA10((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          v25 = a4;
          v15 = 0;
          v16 = (const void **)v31;
          v17 = &v29;
          v18 = (const void **)v31;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = sub_10001C22C(&v32[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (v22 = v38) != 0)
              {
                result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t sub_10001CA10(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  __int128 v32;

  if (!a2)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v21 = result;
  v24 = ~result;
  v23 = ~a3;
  v20 = ~a4;
  if (a5 <= a6)
    v12 = a6;
  else
    v12 = a5;
  v19 = ~v12;
  v16 = ~a7;
  v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v20)
      break;
    result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v11 > v19)
      break;
    v31 = 0u;
    v32 = 0u;
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey))
      return 0xFFFFFFFFLL;
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30))
      return 0xFFFFFFFFLL;
    if (v30)
      return 0xFFFFFFFFLL;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v13 = (_QWORD *)(a6 + v11);
    v14 = v27;
    *v13 = v26;
    v13[1] = v14;
    if (v11 > v16)
      break;
    result = sub_10001D23C(a4 + v9, (_QWORD *)(a7 + v11));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001CC8C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001CE0C);
}

uint64_t sub_10001CC8C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _BYTE v20[32];
  _BYTE v21[48];
  _QWORD v22[6];
  _BYTE v23[80];
  void *__s1;
  size_t __n;
  void *__s2;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  _BYTE v30[16];
  uint64_t v31;
  uint64_t v32;

  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  v10 = a2;
  if (!a2 || !a3 || !a4)
    return result;
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2))
    return 0xFFFFFFFFLL;
  result = sub_10001CA10((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL)
    goto LABEL_22;
  if (__n != v27)
    return 0xFFFFFFFFLL;
  result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  result = sub_10001C22C(v28, v22, a7);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  if (!v31)
    return 0;
  v17 = v32;
  if (!v32)
    return 0;
  result = 0;
  if (a5)
  {
    if (a6)
    {
      result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t sub_10001CE0C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return sub_10001CC8C(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001CE4C);
}

uint64_t sub_10001CE4C(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001CEA4);
}

uint64_t sub_10001CEA4(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001CE4C);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))sub_10001CF20);
}

uint64_t sub_10001CF20(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (sub_10001D164(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t Img4DecodeDigestInit(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD **)(a1 + 16);
  if (!v2 || !*v2)
    return 0xFFFFFFFFLL;
  ccdigest_init(*v2, *a2);
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = **(_QWORD **)(a1 + 16);
  if (!v2)
    return 0xFFFFFFFFLL;
  ccdigest_update(v2, *a2);
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = **(_QWORD **)(a1 + 16);
  if (!v4 || *(_QWORD *)v4 > a3)
    return 0xFFFFFFFFLL;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t *v3;

  if (a1 && (v3 = **(unint64_t ***)(a1 + 16)) != 0)
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  else
    return 0xFFFFFFFFLL;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD **v9;
  _QWORD *v10;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    v8 = *(_QWORD **)(a5 + 32);
    if (v8 && (v9 = (_QWORD **)v8[2]) != 0 && *v8 == a4 && (v10 = *v9) != 0 && *v10 == a4)
    {
      ccdigest(v10, a2, a1, a3);
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
    return 0xFFFFFFFFLL;
  *a7 = v15;
  *a8 = v16;
  result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t sub_10001D164(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0;
  v19 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v5 = ~a2;
  v6 = 1;
  v7 = *a1;
  v8 = a1[1];
  while (1)
  {
    v18 = v7;
    v19 = v8;
    result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (__CFADD__(v16, v17))
      break;
    v10 = v16 + v17;
    v11 = v16 + v17 - v7;
    v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3)
      return 0xFFFFFFFFLL;
    if (v5 < 16 * (unint64_t)v6)
      break;
    v14 = (unint64_t *)(a2 + 16 * v6);
    *v14 = v7;
    v14[1] = v11;
    if (v10 < v7)
      break;
    v12 = v8 >= v11;
    v8 -= v11;
    if (!v12)
      goto LABEL_21;
    ++v6;
    v7 = v10;
    if (!v8)
    {
      if (v6 == a3)
        return 0;
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_10001D23C(uint64_t a1, _QWORD *a2)
{
  char v3;
  int v4;
  _OWORD v6[2];
  __int128 v7;
  unint64_t v8;
  unint64_t v9[2];
  uint64_t v10;
  unint64_t v11[2];
  unint64_t v12[3];

  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  v9[0] = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010)
    return 0xFFFFFFFFLL;
  v3 = 1;
  while (1)
  {
    v4 = DERDecodeSeqNext(v11, &v8);
    if (v4)
      break;
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011)
        return 0xFFFFFFFFLL;
      v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeItemPartialBuffer(uint64_t result, unint64_t *a2, int a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  char v24;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_54;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_55;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        v17 = v16 < v15 && a3 == 0;
        v18 = (unint64_t)(v12 + 1);
        if (v17)
          return 3;
LABEL_28:
        if (v15 > (~v18 & 0x7FFFFFFFFFFFFFFFLL))
          return 7;
        if (v18 <= v18 + v15)
        {
          result = 0;
          a2[1] = v18;
          a2[2] = v15;
          return result;
        }
        goto LABEL_55;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
      {
LABEL_55:
        __break(0x5519u);
LABEL_56:
        __break(0x5515u);
        return result;
      }
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v18 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_55;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_56;
        v23 = *v14++;
        v15 = (v15 << 8) | v23;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (v15 <= v22)
            v24 = 1;
          else
            v24 = a3;
          result = 3;
          if (v15 >= 0x80 && (v24 & 1) != 0)
            goto LABEL_28;
          return result;
        }
      }
    }
LABEL_54:
    __break(0x5513u);
    goto LABEL_55;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_54;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_55;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4;
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[3];

  memset(v8, 170, sizeof(v8));
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[2];

  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[3];

  memset(v12, 170, sizeof(v12));
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;

  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4[3];

  memset(v4, 170, sizeof(v4));
  result = DERDecodeItemPartialBufferGetLength(a1, v4, 0);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL)
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    else
      return 2;
  }
  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  char v7;
  unint64_t v8[3];
  unint64_t v9[2];

  v9[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  v4 = v2 + v3;
  if (v2 > v4)
    goto LABEL_13;
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result)
      break;
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result)
      break;
    if (v7)
      return 0;
  }
  if (result <= 1)
    return 0;
  else
    return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void sub_10001E0A0()
{
  uint8_t v0[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "IONotificationPortCreate failed.", v0, 2u);
  }
  sub_100008B18();
}

void sub_10001E0F4(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1000099C0(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100008AFC();
  sub_100008AE0((void *)&_mh_execute_header, &_os_log_default, v3, "new xpc connection: %@", v4, v5, v6, v7, v8);

  sub_100008AF0();
}

void sub_10001E170()
{
  _os_crash("xpc connection listener is invalid. Verify mach service name is set correctly in launchd plist.");
  __break(1u);
}

void sub_10001E188(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;

  v3 = sub_1000099C0(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100008AFC();
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Processing XPC request [%@]: %@", v5, 0x16u);

  sub_100008AF0();
}

void sub_10001E220(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = sub_1000099C0(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  sub_100008AFC();
  sub_100008AE0((void *)&_mh_execute_header, &_os_log_default, v3, "connection closed: %@", v4, v5, v6, v7, v8);

  sub_100008AF0();
}

void sub_10001E2A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100008AFC();
  sub_100008AE0((void *)&_mh_execute_header, &_os_log_default, v0, "Unsupported IOKit Event: %@", v1, v2, v3, v4, v5);
  sub_100008B20();
}

void sub_10001E308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100008AFC();
  sub_100008AE0((void *)&_mh_execute_header, &_os_log_default, v0, "IOKit Event: %@", v1, v2, v3, v4, v5);
  sub_100008B20();
}

void sub_10001E370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008B08((void *)&_mh_execute_header, &_os_log_default, a3, "Posting a notification that regular storage has been unmounted", a5, a6, a7, a8, 0);
  sub_100008B18();
}

void sub_10001E3A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100008AFC();
  sub_100008AE0((void *)&_mh_execute_header, &_os_log_default, v0, "Syncing %@.", v1, v2, v3, v4, v5);
  sub_100008B20();
}

void sub_10001E40C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008B08((void *)&_mh_execute_header, &_os_log_default, a3, "-- PTP ATTACHED CALLBACK --", a5, a6, a7, a8, 0);
  sub_100008B18();
}

void sub_10001E440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000099A4();
  sub_100009994((void *)&_mh_execute_header, &_os_log_default, v0, "Updated launchd job (%@) program path from %@ to %@.", v1, v2, v3, v4, v5);
  sub_1000099B8();
}

void sub_10001E4B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008B08((void *)&_mh_execute_header, &_os_log_default, a3, "Invalid input.", a5, a6, a7, a8, 0);
}

void sub_10001E4EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008B08((void *)&_mh_execute_header, &_os_log_default, a3, "No job label.", a5, a6, a7, a8, 0);
}

void sub_10001E524()
{
  uint8_t v0[14];
  const __CFString *v1;

  sub_1000099A4();
  v1 = CFSTR("_AdditionalProperties");
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Job '%@' lacks a '%@' dictionary.", v0, 0x16u);
}

void sub_10001E5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009994((void *)&_mh_execute_header, &_os_log_default, a3, "Job '%@': '%@' lacks a '%@' dictionary.", a5, a6, a7, a8, 2u);
  sub_1000099B8();
}

void sub_10001E638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100009994((void *)&_mh_execute_header, &_os_log_default, a3, "Job '%@': '%@' lacks a '%@' BOOLean.", a5, a6, a7, a8, 2u);
  sub_1000099B8();
}

void sub_10001E6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100012888();
  sub_100012864((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to copy/fix %{public}@: %{public}@", v1, v2, v3, v4, v5);
  sub_100008B20();
}

void sub_10001E730()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_100012888();
  sub_100012864((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to verify %{public}@: %{public}@", v1, v2, v3, v4, v5);
  sub_100008B20();
}

void sub_10001E798(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012864((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to remove launchd job '%{public}@': %{public}@", a5, a6, a7, a8, 2u);
  sub_100008B20();
}

void sub_10001E814(uint64_t a1, int __errnum)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  int v5;
  __int16 v6;
  char *v7;

  v2 = 136315650;
  v3 = a1;
  v4 = 1024;
  v5 = __errnum;
  v6 = 2080;
  v7 = strerror(__errnum);
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to uninstall cryptex (%s): %d (%s)", (uint8_t *)&v2, 0x1Cu);
}

void sub_10001E8C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100012874();
  sub_100012854((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B20();
}

void sub_10001E930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100012874();
  sub_100012854((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B20();
}

void sub_10001E9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100012874();
  sub_100012854((void *)&_mh_execute_header, &_os_log_default, v0, "FDSET[%lld] = %d", v1, v2, v3, v4, 0);
  sub_100008B20();
}

void sub_10001EA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100012854((void *)&_mh_execute_header, &_os_log_default, a3, "FDSET[%lld] = %d", a5, a6, a7, a8, 0);
  sub_100008B20();
}

void sub_10001EA88(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CA8((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "Skipping %@, as we didn't mount it.", a1);
}

void sub_10001EAC8(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to load version dictionary at %@ (image version: %@).", (uint8_t *)&v2, 0x16u);
}

void sub_10001EB50(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017C9C((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring EFI partition.", a1);
}

void sub_10001EB88(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100017C9C((void *)&_mh_execute_header, &_os_log_default, a3, "Ignoring Apple_partition_map partition.", a1);
}

void sub_10001EBC0(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CA8((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "The attached media %@ is not a leaf, ignoring.", a1);
}

void sub_10001EC00(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  sub_100017CA8((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "The attached media %@ is not removable, ignoring.", a1);
}

void sub_10001EC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100017C9C((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to retrieve the list of attached devices.", v3);
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BSDName");
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

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_alphanumericCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alphanumericCharacterSet");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_attachWithParams_handle_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachWithParams:handle:error:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyAndFixPlist_forMountPoint_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyAndFixPlist:forMountPoint:withError:");
}

id objc_msgSend_copyPlistWithMSMKeys_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPlistWithMSMKeys:withError:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileHandleForReadingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForReadingAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_imageURLFromDevice_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURLFromDevice:error:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initDataWithHexString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDataWithHexString:");
}

id objc_msgSend_initHexStringWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initHexStringWithData:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:error:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_jobIsManagedByMSM_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "jobIsManagedByMSM:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
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

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_postNotificationName_object_userInfo_deliverImmediately_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:userInfo:deliverImmediately:");
}

id objc_msgSend_readDataOfLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readDataOfLength:");
}

id objc_msgSend_registerContentsForDiskImageAtURL_options_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerContentsForDiskImageAtURL:options:withError:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_scanPlistsAtPath_execBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanPlistsAtPath:execBlock:");
}

id objc_msgSend_setAutoMount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoMount:");
}

id objc_msgSend_setFileMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileMode:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_sharedPlistProcessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedPlistProcessor");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
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

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_unregisterContentsForDiskImageAtURL_options_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterContentsForDiskImageAtURL:options:withError:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_verifyPlist_forMountPoint_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyPlist:forMountPoint:withError:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
