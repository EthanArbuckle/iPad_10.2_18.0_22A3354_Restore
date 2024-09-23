uint64_t start(int a1, uint64_t a2)
{
  __CFRunLoopSource *v2;
  __CFRunLoop *Main;
  _QWORD v5[5];
  int v6;
  CFRunLoopSourceContext context;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003BD8;
  v5[3] = &unk_100004120;
  v6 = a1;
  v5[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  v2 = (__CFRunLoopSource *)qword_100008008;
  if (!qword_100008008)
  {
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_3;
    v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    qword_100008008 = (uint64_t)v2;
    if (!v2)
      dispatch_main();
  }
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v2, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0;
}

void sub_100003BD8(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  if (*(int *)(a1 + 40) >= 1)
    strncmp(**(const char ***)(a1 + 32), "/usr/libexec/symptomsd-helper", 0x1DuLL);
  configure_symptom_logging();
  objc_autoreleasePoolPop(v2);
}

uint64_t sub_100003C78(uint64_t a1)
{
  uint64_t v1;
  dispatch_source_t v2;
  void *v3;

  if (*(_BYTE *)(a1 + 32))
  {
    configure_analytics_launchpad_for_helper();
  }
  else
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004160);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004180);

    v1 = configure_symptom_evaluator_handling(0, 0);
    activate_symptom_evaluator_handling(v1);
    init_managed_event_listening(0);
    init_symptom_evaluator_listening(0);
    init_analytics_portal_listening(0);
  }
  signal(15, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v3 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v2;

  if (qword_100008000)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008000, &stru_1000041C0);
    dispatch_resume((dispatch_object_t)qword_100008000);
  }
  return atexit_b(&stru_1000041E0);
}

void sub_100003D68(id a1)
{
  uint64_t v1;

  v1 = client_transactions_release(a1);
  xpc_transaction_exit_clean(v1);
}
