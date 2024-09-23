uint64_t start()
{
  uint64_t i;
  int v1;
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000038BC;
  v5[3] = &unk_100004090;
  v5[4] = &v6;
  v5[5] = CFRunLoopGetCurrent();
  _set_user_dir_suffix("com.apple.deferredmediad");
  for (i = 0; i != 3; ++i)
  {
    v1 = dword_100003988[i];
    signal(v1, (void (__cdecl *)(int))1);
    v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v1, 0, (dispatch_queue_t)&_dispatch_main_q);
    qword_100008000[i] = v2;
    dispatch_source_set_event_handler(v2, v5);
    dispatch_activate(qword_100008000[i]);
  }
  v3 = FigCommonMediaProcessInitialization(9, 0);
  FigCaptureDeferredPhotoProcessorServerStart(v3);
  while (!*((_BYTE *)v7 + 24))
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(&v6, 8);
  return 0;
}

void sub_10000389C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000038BC(uint64_t a1)
{
  __CFRunLoop *v2;

  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
}
