uint64_t start()
{
  CFRunLoopRef Current;
  uint64_t i;
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _opaque_pthread_t *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t v23[8];
  _QWORD v24[5];
  int out_token;
  int __relative_priority[2];
  _QWORD handler[6];
  uint8_t buf[8];
  uint8_t *v29;
  uint64_t v30;
  char v31;

  +[NSError _setFileNameLocalizationEnabled:](NSError, "_setFileNameLocalizationEnabled:", 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured is launching...", buf, 2u);
  }
  Current = CFRunLoopGetCurrent();
  *(_QWORD *)buf = 0;
  v29 = buf;
  v30 = 0x2020000000;
  v31 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000034F4;
  handler[3] = &unk_100004188;
  handler[4] = buf;
  handler[5] = Current;
  _set_user_dir_suffix("com.apple.cameracaptured");
  for (i = 0; i != 3; ++i)
  {
    v2 = dword_1000037D8[i];
    signal(v2, (void (__cdecl *)(int))1);
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v2, 0, (dispatch_queue_t)&_dispatch_main_q);
    qword_100008008[i] = v3;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_activate(qword_100008008[i]);
  }
  if (_os_feature_enabled_impl("CameraCapture", "cameracaptured"))
  {
    v4 = FigCommonMediaProcessInitialization(7, 0);
    FigSandboxRegistrationServerStart(v4);
    v5 = setiopolicy_np(9, 0, 1);
    v6 = pthread_set_fixedpriority_self(v5);
    *(_QWORD *)__relative_priority = 0;
    v7 = pthread_self();
    if (pthread_get_qos_class_np(v7, (qos_class_t *)&__relative_priority[1], __relative_priority))
      v8 = 0;
    else
      v8 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0) == 0;
    v9 = getpid();
    proc_disable_wakemon(v9);
    v10 = getpid();
    proc_disable_cpumon(v10);
    out_token = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003518;
    v24[3] = &unk_1000041B0;
    v24[4] = handler;
    v11 = notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v24);
    if (&_MSNMonitorStartCam)
      MSNMonitorStartCam(v11);
    if (gGMFigKTraceEnabled == 1)
      kdebug_trace(538247193, 0, 0, 0, 0);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured servers starting", v23, 2u);
    }
    v12 = objc_autoreleasePoolPush();
    v13 = FigCaptureMemoryReporterStart();
    v14 = FigExternalStorageDeviceManagerServerStart(v13);
    v15 = FigCapturePreloadShaders(v14);
    v16 = FigCaptureSourceServerStart(v15);
    v17 = FigCameraViewfinderServerStart(v16);
    v18 = FigCaptureSessionServerStart(v17);
    v19 = FigFlashlightServerStart(v18);
    v20 = FigCaptureDeferredContainerManagerServerStart(v19);
    FigVirtualCaptureCardServerStart(v20);
    objc_autoreleasePoolPop(v12);
    v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v21)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured servers have finished starting", v23, 2u);
    }
    if (gGMFigKTraceEnabled == 1)
      v21 = kdebug_trace(538247194, 0, 0, 0, 0);
    if (v8)
      v21 = pthread_set_qos_class_self_np((qos_class_t)__relative_priority[1], __relative_priority[0]);
    if (!v6)
      pthread_set_timeshare_self(v21);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured has finished launching", v23, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100003588();
  }
  while (!v29[24])
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(buf, 8);
  return 0;
}

void sub_1000034C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000034F4(uint64_t a1)
{
  __CFRunLoop *v2;

  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
}

uint64_t sub_100003518(uint64_t a1)
{
  uint8_t v3[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User's preferred language has changed.  Exiting...", v3, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100003588()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "cameracaptured is not enabled.  Running idle in the background.", v0, 2u);
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setFileNameLocalizationEnabled:");
}
