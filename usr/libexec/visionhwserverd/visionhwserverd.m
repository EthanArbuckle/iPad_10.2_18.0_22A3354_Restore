uint64_t start()
{
  id v0;
  CFRunLoopRef Current;
  _QWORD *v2;
  dispatch_source_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  char *v11;
  char *v12;
  uint8_t v14[16];
  _QWORD v15[6];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint8_t v20[24];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "visionhwserverd is launching...", buf, 2u);
  }
  kdebug_trace(733233008, 0, 0, 0, 0);
  _set_user_dir_suffix("com.apple.visionhwserverd");
  v0 = NSTemporaryDirectory();
  Current = CFRunLoopGetCurrent();
  *(_QWORD *)buf = 0;
  v17 = buf;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000039F8;
  v15[3] = &unk_100004110;
  v15[4] = buf;
  v15[5] = Current;
  v2 = objc_retainBlock(v15);
  signal(1, (void (__cdecl *)(int))1);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100008000, v2);
  dispatch_activate((dispatch_object_t)qword_100008000);
  signal(13, (void (__cdecl *)(int))1);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xDuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v6 = (void *)qword_100008008;
  qword_100008008 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100008008, v2);
  dispatch_activate((dispatch_object_t)qword_100008008);
  signal(15, (void (__cdecl *)(int))1);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v8 = (void *)qword_100008010;
  qword_100008010 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100008010, v2);
  dispatch_activate((dispatch_object_t)qword_100008010);
  if (_os_feature_enabled_impl("AppleCVHWA", "enable_visionhwserverd"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "VisionHWA XPCService", v20, 2u);
    }
    v9 = dlopen("/System/Library/PrivateFrameworks/VisionHWAccelerationServices.framework/VisionHWAccelerationServices", 4);
    if (v9)
    {
      v10 = (void (*)(void))dlsym(v9, "VisionHWServerStart");
      if (v10)
      {
        v10();
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v12 = dlerror();
        sub_100003A74((uint64_t)v12, v20);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v11 = dlerror();
      sub_100003A2C((uint64_t)v11, v20);
    }
  }
  while (!v17[24])
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "visionhwserverd exiting...", v14, 2u);
  }

  _Block_object_dispose(buf, 8);
  return 0;
}

void sub_1000039B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2)
    sub_100003A1C(exception_object);
  _Unwind_Resume(exception_object);
}

void sub_1000039F8(uint64_t a1)
{
  __CFRunLoop *v2;

  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
}

void sub_100003A1C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_100003A2C(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load VisionHWAccelerationServices framework: %s", buf, 0xCu);
}

void sub_100003A74(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(_QWORD *)(buf + 4) = "VisionHWServerStart";
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not find '%s': %s", buf, 0x16u);
}
