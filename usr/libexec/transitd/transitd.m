uint64_t sub_100003EF8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2 == 3 || !*(_DWORD *)(a6 + 40))
  {
    if (a2 == 3)
      NSLog(CFSTR("Error while copying"));
    return 2;
  }
  else if (objc_msgSend(*(id *)(a6 + 48), "isCancelled"))
  {
    return 2;
  }
  else
  {
    return 0;
  }
}

Copier *sub_100003FD4()
{
  Copier *result;

  result = objc_alloc_init(Copier);
  qword_10000C648 = (uint64_t)result;
  return result;
}

uint64_t sub_100003FF8(int a1, uint64_t a2, unsigned int *a3, int *a4, _OWORD *a5)
{
  mach_port_t v10;
  __int128 v11;
  __int128 v12;
  __SecTask *v13;
  __SecTask *v14;
  CFTypeRef v15;
  CFErrorRef v16;
  CFTypeID TypeID;
  int v18;
  mach_error_t v20;
  kern_return_t inserted;
  mach_port_name_t v22;
  mach_error_t v23;
  mach_error_t v24;
  mach_error_t v25;
  pid_t pidp;
  mach_port_t previous;
  audit_token_t atoken;
  CFErrorRef error;
  audit_token_t v30;

  v10 = mach_task_self_;
  pidp = -1;
  previous = 0;
  sub_1000042FC();
  *a3 = 0;
  *a4 = 0;
  if (!a1)
    goto LABEL_15;
  v11 = a5[1];
  *(_OWORD *)v30.val = *a5;
  *(_OWORD *)&v30.val[4] = v11;
  error = 0;
  v12 = a5[1];
  *(_OWORD *)atoken.val = *a5;
  *(_OWORD *)&atoken.val[4] = v12;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  atoken = v30;
  v13 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &atoken);
  if (!v13)
  {
    *a4 = 13;
LABEL_15:
    sub_100004358("pid %d does not have MDT entitlements", pidp);
    goto LABEL_16;
  }
  v14 = v13;
  v15 = SecTaskCopyValueForEntitlement(v13, CFSTR("com.apple.MobileDataTransit.allow"), &error);
  v16 = error;
  if (error || !v15)
  {
    v18 = 13;
    if (!v15)
      goto LABEL_12;
  }
  else
  {
    TypeID = CFBooleanGetTypeID();
    v18 = 13;
    if (TypeID == CFGetTypeID(v15))
    {
      if (CFEqual(v15, kCFBooleanTrue))
        v18 = 0;
      else
        v18 = 13;
    }
  }
  CFRelease(v15);
  v16 = error;
LABEL_12:
  if (v16)
    CFRelease(v16);
  CFRelease(v14);
  *a4 = v18;
  if (v18)
    goto LABEL_15;
  v20 = mach_port_allocate(v10, 1u, a3);
  if (v20)
  {
    *a4 = 22;
    mach_error_string(v20);
    sub_100004358("mach_port_allocate: %d (%s)");
LABEL_25:
    if (*a3)
    {
      mach_port_mod_refs(v10, *a3, 1u, -1);
      mach_port_deallocate(v10, *a3);
    }
    *a3 = 0;
    goto LABEL_16;
  }
  inserted = mach_port_insert_right(v10, *a3, *a3, 0x14u);
  v22 = *a3;
  if (inserted)
  {
    v23 = inserted;
    mach_port_mod_refs(v10, v22, 1u, -1);
    *a3 = 0;
    *a4 = 22;
    mach_error_string(v23);
    sub_100004358("mach_port_insert_right: %d (%s)");
    goto LABEL_25;
  }
  v24 = mach_port_move_member(v10, v22, dword_10000C6F8);
  if (v24)
  {
    *a4 = 22;
    mach_error_string(v24);
    sub_100004358("mach_port_move_member: %d (%s)");
    goto LABEL_25;
  }
  v25 = mach_port_request_notification(v10, *a3, 70, 1u, *a3, 0x15u, &previous);
  if (v25)
  {
    *a4 = 22;
    mach_error_string(v25);
    sub_100004358("mach_port_request_notification: %d (%s)");
    goto LABEL_25;
  }
  if (previous)
    sub_1000060C8();
  +[MDTSession sessionWithServerPort:clientPort:pid:](MDTSession, "sessionWithServerPort:clientPort:pid:", *a3, a2, pidp);
  sub_1000043C4();
LABEL_16:
  sub_1000042FC();
  return 0;
}

void sub_1000042FC()
{
  __CFRunLoopTimer *v0;
  CFAbsoluteTime Current;

  if (qword_10000C698)
  {
    if (+[MDTSession sessionCount](MDTSession, "sessionCount") <= 0)
    {
      v0 = (__CFRunLoopTimer *)qword_10000C698;
      Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(v0, Current + 60.0);
    }
  }
}

void sub_100004358(char *a1, ...)
{
  int v1;
  va_list va;

  va_start(va, a1);
  if (dword_10000C640)
    v1 = 5;
  else
    v1 = 3;
  if (qword_10000C6D8)
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v1, a1, va);
  else
    vsyslog(v1, a1, va);
}

void sub_1000043C4()
{
  BOOL v0;

  if (qword_10000C688)
    v0 = qword_10000C698 == 0;
  else
    v0 = 1;
  if (!v0)
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
}

uint64_t sub_1000043F4(uint64_t a1)
{
  objc_msgSend(+[MDTSession lookupSessionForPort:](MDTSession, "lookupSessionForPort:", a1), "invalidate");
  if (!+[MDTSession sessionCount](MDTSession, "sessionCount"))
    sub_100004438();
  sub_1000042FC();
  return 0;
}

void sub_100004438()
{
  BOOL v0;

  if (qword_10000C688)
    v0 = qword_10000C698 == 0;
  else
    v0 = 1;
  if (!v0)
    CFRunLoopAddTimer((CFRunLoopRef)qword_10000C688, (CFRunLoopTimerRef)qword_10000C698, kCFRunLoopDefaultMode);
}

uint64_t sub_100004468(uint64_t a1)
{
  id *v1;

  v1 = +[MDTSession lookupSessionForPort:](MDTSession, "lookupSessionForPort:", a1);
  if (v1)
    objc_msgSend(v1[3], "cancelCopy");
  sub_1000042FC();
  return 0;
}

uint64_t sub_1000044A8(uint64_t a1, const char *a2, const char *a3, uint64_t a4, int a5, _BYTE *a6, int a7)
{
  id v14;
  id v15;
  NSURL *v16;
  NSURL *v17;
  NSString *v18;
  NSString *v20;
  id v21;
  uint64_t v22;

  sub_100004630("Copy %s -> %s\n", a2, a3);
  sub_1000042FC();
  v14 = +[MDTSession lookupSessionForPort:](MDTSession, "lookupSessionForPort:", a1);
  if (!v14)
    return 268451842;
  v15 = v14;
  v16 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 4));
  v17 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a3, 4));
  if (a5)
  {
    v18 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a4, 4);
    if (!a6)
      goto LABEL_9;
  }
  else
  {
    v18 = 0;
    if (!a6)
    {
LABEL_9:
      v20 = 0;
      goto LABEL_10;
    }
  }
  if (!*a6)
    goto LABEL_9;
  v20 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a6, 4);
LABEL_10:
  LODWORD(v22) = a7;
  *((_QWORD *)v15 + 3) = +[Copier copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:](Copier, "copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:", v16, v18, v17, v20, v15, "returnStatusWithDestURL:error:", v22);
  v21 = *((id *)v15 + 3);
  objc_msgSend(*((id *)v15 + 3), "startCopy");
  sub_1000042FC();
  return 0;
}

void sub_100004630(char *a1, ...)
{
  int v1;
  va_list va;

  va_start(va, a1);
  if (dword_10000C640)
    v1 = 5;
  else
    v1 = 6;
  if (qword_10000C6D8)
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v1, a1, va);
  else
    vsyslog(v1, a1, va);
}

void start()
{
  __asl_object_s *v0;
  int v1;
  int v2;
  const char *v3;
  mach_error_t v4;
  mach_error_t v5;
  mach_error_t v6;
  mach_error_t attributes;
  mach_error_t v8;
  char *v9;
  mach_error_t inserted;
  CFAbsoluteTime Current;
  id v12;
  mach_msg_return_t v13;
  BOOL v14;
  mach_msg_return_t v16;
  char *v17;
  uint64_t v18;
  integer_t port_info_out[4];
  __int128 v20;
  uint64_t v21;
  mach_msg_type_number_t port_info_outCnt;
  sigaction v23;
  mach_port_t sp;

  if (dword_10000C700)
  {
    v0 = asl_open(0, "com.apple.mdt", 2u);
    qword_10000C6D8 = (uint64_t)v0;
    if (v0)
    {
      if (dword_10000C6FC)
        v1 = 255;
      else
        v1 = 127;
      asl_set_filter(v0, v1);
    }
    else
    {
      fwrite("Error initializing ASL\n", 0x17uLL, 1uLL, __stderrp);
    }
  }
  else
  {
    openlog("com.apple.mdt", 9, 24);
    if (dword_10000C6FC)
      v2 = 255;
    else
      v2 = 127;
    setlogmask(v2);
  }
  port_info_outCnt = 0;
  *(_OWORD *)port_info_out = 0u;
  v20 = 0u;
  v21 = 0;
  v3 = getprogname();
  sub_100004630("%s started", v3);
  qword_10000C758 = (uint64_t)vproc_transaction_begin(0);
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  v23.sa_mask = 0;
  v23.sa_flags = 2;
  sigaction(1, &v23, 0);
  sigaction(13, &v23, 0);
  sigaction(14, &v23, 0);
  sigaction(24, &v23, 0);
  sigaction(25, &v23, 0);
  sigaction(26, &v23, 0);
  sigaction(27, &v23, 0);
  sigaction(18, &v23, 0);
  sigaction(21, &v23, 0);
  sigaction(22, &v23, 0);
  sigaction(30, &v23, 0);
  sigaction(31, &v23, 0);
  v23.sa_flags = 0;
  v23.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_100004BDC;
  sigaction(2, &v23, 0);
  sigaction(15, &v23, 0);
  v23.sa_flags = 10;
  sigaction(20, &v23, 0);
  if (pthread_mutexattr_init(&stru_10000C748)
    || pthread_mutexattr_settype(&stru_10000C748, 1)
    || pthread_mutex_init(&stru_10000C708, &stru_10000C748)
    || pthread_cond_init(&stru_10000C650, 0))
  {
    sub_100004358("could not initialize mutex: %m", v18);
  }
  else
  {
    pthread_mutex_lock(&stru_10000C708);
    if (pthread_create(&qword_10000C680, 0, (void *(__cdecl *)(void *))sub_100004C9C, 0))
    {
      pthread_mutex_unlock(&stru_10000C708);
      sub_100004358("could not start runloop thread: %m", v18);
    }
    else
    {
      while (!qword_10000C688)
      {
        if (pthread_cond_wait(&stru_10000C650, &stru_10000C708))
          __assert_rtn("main", "server.m", 694, "err == 0");
      }
      pthread_mutex_unlock(&stru_10000C708);
      sp = 0;
      v4 = bootstrap_check_in(bootstrap_port, "com.apple.mdt", &sp);
      if (v4)
      {
        mach_error_string(v4);
        sub_100004358("bootstrap_check_in: %d (%s)");
      }
      else if (sp)
      {
        inserted = mach_port_insert_right(mach_task_self_, sp, sp, 0x14u);
        if (inserted)
        {
          mach_error_string(inserted);
          sub_100004358("mach_port_insert_right: %d (%s)");
        }
      }
      else
      {
        sub_100004358("launchd returned a NULL Mach port");
      }
      if (sp)
      {
        dword_10000C690 = sp;
        v5 = mach_port_allocate(mach_task_self_, 3u, (mach_port_name_t *)&dword_10000C6F8);
        if (v5)
        {
          mach_error_string(v5);
          sub_100004358("gPortSet mach_port_allocate: %d (%s)");
        }
        else
        {
          v6 = mach_port_move_member(mach_task_self_, dword_10000C690, dword_10000C6F8);
          if (!v6)
          {
            v21 = 0;
            *(_OWORD *)port_info_out = 0u;
            v20 = 0u;
            port_info_outCnt = 10;
            attributes = mach_port_get_attributes(mach_task_self_, dword_10000C690, 2, port_info_out, &port_info_outCnt);
            if (attributes)
            {
              v8 = attributes;
              v9 = mach_error_string(attributes);
              sub_100004358("get status count: %d (%s)", v8, v9);
            }
            else if (!(_DWORD)v20)
            {
              sleep(5u);
            }
            Current = CFAbsoluteTimeGetCurrent();
            qword_10000C698 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 60.0, 60.0, 0, 0, (CFRunLoopTimerCallBack)sub_100004D54, 0);
            if (pthread_create(qword_10000C6A0, 0, (void *(__cdecl *)(void *))sub_100004D90, (void *)1))
              sub_100004358("could create ipc worker thread[%d]: %m", 1);
            sub_100004438();
            while (1)
            {
              v12 = objc_alloc_init((Class)NSAutoreleasePool);
              v13 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004E30, 0x108Cu, dword_10000C6F8, 50331648);
              if (v13)
                v14 = v13 == 268451842;
              else
                v14 = 1;
              if (!v14 && v13 != 268451846)
              {
                v16 = v13;
                v17 = mach_error_string(v13);
                sub_100004358("ipc main mach_msg_server: (%d) %s", v16, v17);
              }
              objc_msgSend(v12, "drain");
            }
          }
          mach_error_string(v6);
          sub_100004358("portset mach_port_move_member: %d (%s)");
        }
      }
    }
  }
  sub_100004C24(1);
}

void sub_100004BDC(int a1)
{
  if (a1 != 20)
  {
    if (a1 == 15 || a1 == 2)
      sub_100004C24(0);
    sub_100004630("got signal %d", a1);
  }
}

void sub_100004C24(int a1)
{
  const char *v2;

  if (dword_10000C6F8)
  {
    mach_port_move_member(mach_task_self_, dword_10000C690, 0);
    mach_port_mod_refs(mach_task_self_, dword_10000C6F8, 3u, -1);
    dword_10000C6F8 = 0;
  }
  v2 = getprogname();
  sub_100004630("%s exiting: %d", v2, a1);
  sub_100004F54();
  exit(a1);
}

uint64_t sub_100004C9C()
{
  CFRunLoopRunResult v0;
  BOOL v1;
  BOOL v2;

  pthread_mutex_lock(&stru_10000C708);
  qword_10000C688 = (uint64_t)CFRunLoopGetCurrent();
  pthread_cond_broadcast(&stru_10000C650);
  pthread_mutex_unlock(&stru_10000C708);
  sub_100004438();
  v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
  if (qword_10000C688)
    v1 = v0 == kCFRunLoopRunStopped;
  else
    v1 = 1;
  if (!v1)
  {
    do
    {
      if (v0 == kCFRunLoopRunFinished)
        sleep(1u);
      v0 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (qword_10000C688)
        v2 = v0 == kCFRunLoopRunStopped;
      else
        v2 = 1;
    }
    while (!v2);
  }
  return 0;
}

void sub_100004D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004F90(a1, a2, a3, a4, a5, a6, a7, a8, 60);
  if (qword_10000C758)
  {
    vproc_transaction_end(0, (vproc_transaction_t)qword_10000C758);
    qword_10000C758 = 0;
  }
  sub_100004C24(0);
}

void sub_100004D90(const void *a1)
{
  id v2;
  mach_msg_return_t v3;
  BOOL v4;
  mach_msg_return_t v6;
  char *v7;

  while (1)
  {
    v2 = objc_alloc_init((Class)NSAutoreleasePool);
    v3 = mach_msg_server_once((BOOLean_t (__cdecl *)(mach_msg_header_t *, mach_msg_header_t *))sub_100004E30, 0x108Cu, dword_10000C6F8, 50331648);
    if (v3)
      v4 = v3 == 268451842;
    else
      v4 = 1;
    if (!v4 && v3 != 268451846)
    {
      v6 = v3;
      v7 = mach_error_string(v3);
      sub_100004358("ipc thread[%p] mach_msg_server: %d (%s)", a1, v6, v7);
    }
    objc_msgSend(v2, "drain");
  }
}

uint64_t sub_100004E30(_DWORD *a1, uint64_t a2)
{
  int v4;
  unsigned int v6;
  int v7;
  uint64_t audit_trailer;
  __int128 v9;
  audit_token_t atoken;
  pid_t pidp;

  pidp = -1;
  v4 = a1[5];
  if ((v4 - 78) <= 0xFFFFFFF1)
    return sub_100005FE4(a1, a2);
  *(_DWORD *)a2 = *a1 & 0x1F;
  v6 = a1[2];
  *(_DWORD *)(a2 + 4) = 36;
  *(_QWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 20) = v4 + 100;
  v7 = a1[5];
  if (v7 == 72 || v7 == 70)
  {
    *(_DWORD *)(a2 + 32) = -303;
    audit_trailer = os_mach_msg_get_audit_trailer(a1);
    if (audit_trailer)
    {
      v9 = *(_OWORD *)(audit_trailer + 36);
      *(_OWORD *)atoken.val = *(_OWORD *)(audit_trailer + 20);
      *(_OWORD *)&atoken.val[4] = v9;
      audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
      if (!pidp)
      {
        sub_1000043F4(a1[3]);
        *(_DWORD *)a2 = 0;
        *(_DWORD *)(a2 + 8) = 0;
        *(_DWORD *)(a2 + 32) = 0;
      }
    }
    else
    {
      sub_100004358("No Trailer");
    }
  }
  else
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return 1;
}

void sub_100004F54()
{
  if (!dword_10000C700)
    closelog();
  if (qword_10000C6D8)
  {
    asl_close((asl_object_t)qword_10000C6D8);
    qword_10000C6D8 = 0;
  }
}

void sub_100004F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;

  if (dword_10000C640)
    v9 = 5;
  else
    v9 = 7;
  if (qword_10000C6D8)
    asl_vlog((asl_object_t)qword_10000C6D8, 0, v9, "now quitting (%d sec idle)", &a9);
  else
    vsyslog(v9, "now quitting (%d sec idle)", &a9);
}

CFDictionaryRef sub_100005004(const __CFURL *a1, __CFError *a2)
{
  uint64_t v3;
  CFIndex v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  uint64_t Count;
  __CFDictionary *Mutable;
  const void **v9;
  const void **v10;
  uint64_t v11;
  const void **v12;
  const void *v13;
  CFTypeID v14;
  CFDictionaryRef v15;
  CFIndex valuePtr;
  __int128 v18;
  CFTypeRef cf[3];
  _QWORD v20[4];

  v20[0] = CFSTR("URL");
  v20[1] = CFSTR("Domain");
  v20[2] = CFSTR("Code");
  v20[3] = CFSTR("UserInfo");
  v18 = 0u;
  *(_OWORD *)cf = 0u;
  if (!a1)
  {
    v4 = 0;
    v3 = 1;
    if (!a2)
      goto LABEL_19;
LABEL_5:
    valuePtr = CFErrorGetCode(a2);
    *((_QWORD *)&v18 + 1) = CFErrorGetDomain(a2);
    cf[0] = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
    v5 = CFErrorCopyUserInfo(a2);
    if (v5)
    {
      v6 = v5;
      Count = CFDictionaryGetCount(v5);
      Mutable = CFDictionaryCreateMutable(0, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v9 = (const void **)CFAllocatorAllocate(0, 16 * Count, 0);
        if (v9)
        {
          v10 = v9;
          CFDictionaryGetKeysAndValues(v6, v9, &v9[Count]);
          if (Count >= 1)
          {
            v11 = Count;
            v12 = v10;
            while (1)
            {
              v13 = v12[Count];
              v14 = CFGetTypeID(v13);
              if (v14 == CFErrorGetTypeID())
                break;
              CFRetain(v13);
              if (v13)
                goto LABEL_14;
LABEL_15:
              ++v12;
              if (!--v11)
                goto LABEL_16;
            }
            v13 = (const void *)sub_100005004(0, v13);
            if (!v13)
              goto LABEL_15;
LABEL_14:
            CFDictionarySetValue(Mutable, *v12, v13);
            CFRelease(v13);
            goto LABEL_15;
          }
LABEL_16:
          CFAllocatorDeallocate(0, v10);
        }
      }
      CFRelease(v6);
    }
    else
    {
      Mutable = 0;
    }
    cf[1] = Mutable;
    v4 += 3;
    goto LABEL_19;
  }
  v3 = 0;
  *(_QWORD *)&v18 = CFURLGetString(a1);
  v4 = 1;
  if (a2)
    goto LABEL_5;
LABEL_19:
  v15 = CFDictionaryCreate(0, (const void **)&v20[v3], (const void **)((unint64_t)&v18 | (8 * v3)), v4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (cf[0])
    CFRelease(cf[0]);
  if (cf[1])
    CFRelease(cf[1]);
  return v15;
}

const __CFDictionary *sub_100005240(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  const __CFString *Value;
  const __CFNumber *v3;
  const __CFDictionary *v4;
  CFIndex valuePtr;

  if (result)
  {
    v1 = result;
    Value = (const __CFString *)CFDictionaryGetValue(result, CFSTR("Domain"));
    v3 = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("Code"));
    v4 = (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("UserInfo"));
    result = 0;
    valuePtr = 0;
    if (Value)
    {
      if (v3)
      {
        CFNumberGetValue(v3, kCFNumberLongType, &valuePtr);
        return CFErrorCreate(0, Value, valuePtr, v4);
      }
    }
  }
  return result;
}

CFURLRef sub_1000052DC(const __CFDictionary *a1)
{
  const __CFString *Value;

  if (a1 && (Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("URL"))) != 0)
    return CFURLCreateWithString(0, Value, 0);
  else
    return 0;
}

CFTypeRef sub_100005314(void *a1, const __CFString *a2, CFIndex a3)
{
  __CFError *v3;
  __CFError *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFTypeRef v7;
  void *userInfoValues;
  void *userInfoKeys;

  userInfoValues = a1;
  userInfoKeys = (void *)kCFErrorDescriptionKey;
  v3 = CFErrorCreateWithUserInfoKeysAndValues(0, a2, a3, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = sub_100005004(0, v3);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1000053D4(v5);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v4);
  return v7;
}

CFTypeRef sub_1000053D4(const void *a1)
{
  CFTypeRef v1;
  __CFWriteStream *v2;
  __CFWriteStream *v3;

  v1 = a1;
  if (a1)
  {
    v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
    if (v2)
    {
      v3 = v2;
      CFWriteStreamOpen(v2);
      if (CFPropertyListWrite(v1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0))
      {
        v1 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
        CFWriteStreamClose(v3);
      }
      else
      {
        v1 = 0;
      }
      CFRelease(v3);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

const __CFData *sub_10000546C(CFDataRef theData)
{
  const __CFData *v1;
  const UInt8 *BytePtr;
  CFIndex Length;
  __CFReadStream *v4;
  __CFReadStream *v5;
  CFIndex v6;
  CFPropertyListFormat format;

  v1 = theData;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(v1);
    v4 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, kCFAllocatorNull);
    if (v4)
    {
      v5 = v4;
      format = 0;
      CFReadStreamOpen(v4);
      v6 = CFDataGetLength(v1);
      v1 = (const __CFData *)CFPropertyListCreateWithStream(0, v5, v6, 0, &format, 0);
      CFReadStreamClose(v5);
      CFRelease(v5);
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_1000055A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005648(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000056D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFErrorRef sub_1000059D4(CFErrorRef result)
{
  CFErrorRef v1;
  id v2;
  void *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (result)
  {
    v1 = result;
    v2 = -[__CFError userInfo](result, "userInfo");
    if (v2)
    {
      v3 = v2;
      v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v3);
            v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            v10 = objc_msgSend(v3, "valueForKey:", v9);
            v11 = objc_opt_class(NSError);
            if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
              v10 = (id)sub_1000059D4(v10);
            else
              v12 = v10;
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v9);

          }
          v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }
    }
    else
    {
      v4 = 0;
    }
    return CFErrorCreate(0, (CFErrorDomain)-[__CFError domain](v1, "domain"), (CFIndex)-[__CFError code](v1, "code"), (CFDictionaryRef)v4);
  }
  return result;
}

uint64_t sub_100005B70(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  NDR_record_t v11;
  int v12;
  int v13;

  v8 = a3;
  v9 = 16777472;
  v10 = a4;
  v11 = NDR_record;
  v12 = a2;
  v13 = a4;
  v5 = 2147483667;
  v6 = a1;
  v7 = xmmword_100007E70;
  if (&_voucher_mach_msg_set)
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 1, 0x3Cu, 0, 0, 0, 0);
}

uint64_t sub_100005BF8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 954437181) >= 0xFFFFFFFC)
    return (uint64_t)*(&off_1000084D8 + 5 * (v1 - 954437177) + 5);
  else
    return 0;
}

uint64_t sub_100005C38(uint64_t result, uint64_t a2)
{
  int v3;
  unsigned int *v4;
  int v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[2];

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    v3 = -304;
    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    v3 = -300;
    goto LABEL_9;
  }
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    v3 = -309;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  v4 = (unsigned int *)(a2 + 28);
  *(_QWORD *)(a2 + 32) = 0x11000000000000;
  v5 = *(_DWORD *)(result + 12);
  v6 = *(unsigned int *)(result + 28);
  v7 = *(_OWORD *)(result + 76);
  v8[0] = *(_OWORD *)(result + 60);
  v8[1] = v7;
  result = sub_100003FF8(v5, v6, v4, (int *)(a2 + 48), v8);
  if (!(_DWORD)result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100005D38(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
  }
  else
  {
    result = (_DWORD *)sub_1000043F4(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

const char *sub_100005D90(const char *result, uint64_t a2)
{
  const char *v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  char *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v26;
  const char *v27;
  const char *v28;
  size_t v29;
  uint64_t v30;
  size_t v31;
  uint64_t v32;
  _BYTE *v33;
  size_t v34;

  if ((*(_DWORD *)result & 0x80000000) != 0)
    goto LABEL_46;
  v3 = result;
  v4 = *((unsigned int *)result + 1);
  if (v4 < 0x48 || v4 > 0x1048)
    goto LABEL_46;
  v6 = *((_DWORD *)result + 9);
  if (v6 > 0x400)
    goto LABEL_46;
  v7 = (v6 + 3) & 0xFFFFFFFC;
  if ((int)v4 - 72 < v6 || v4 < v7 + 72)
    goto LABEL_46;
  v9 = (char *)&result[v7];
  v10 = *((_DWORD *)v9 + 11);
  if (v10 > 0x400)
    goto LABEL_46;
  v11 = v4 - v7;
  v12 = (v10 + 3) & 0xFFFFFFFC;
  if (v11 - 72 < v10 || v11 < v12 + 72)
    goto LABEL_46;
  v14 = v9 - 1024;
  v15 = (uint64_t)&v9[v12 - 1024];
  v16 = *(_DWORD *)(v15 + 1076);
  if (v16 > 0x400)
    goto LABEL_46;
  v17 = v11 - v12;
  v18 = (v16 + 3) & 0xFFFFFFFC;
  if (v17 - 72 < v16 || v17 < v18 + 72)
    goto LABEL_46;
  v20 = v15 - 1024;
  v21 = v15 - 1024 + v18;
  v22 = *(_DWORD *)(v21 + 2112);
  if (v22 > 0x400)
    goto LABEL_46;
  v23 = (v22 + 3) & 0xFFFFFFFC;
  v24 = v17 - v18;
  if (v24 - 72 < v22 || v24 != v23 + 72)
    goto LABEL_46;
  v26 = 1064;
  if (*((unsigned int *)result + 1) < 0x428uLL)
    v26 = *((unsigned int *)result + 1);
  result = (const char *)memchr((void *)(result + 40), 0, v26 - 40);
  if (!result)
    goto LABEL_46;
  v27 = &v3[v4];
  v28 = v14 + 1072;
  v29 = v27 - (v14 + 1072) >= 1024 ? 1024 : v27 - (v14 + 1072);
  result = (const char *)memchr(v14 + 1072, 0, v29);
  if (!result)
    goto LABEL_46;
  v30 = v20 + 2104;
  v31 = (uint64_t)&v27[-v20 - 2104] >= 1024 ? 1024 : (size_t)&v27[-v20 - 2104];
  result = (const char *)memchr((void *)(v20 + 2104), 0, v31);
  if (result
    && ((v32 = v21 - 1024, v33 = (_BYTE *)(v21 + 2116), v27 - v33 >= 1024) ? (v34 = 1024) : (v34 = v27 - v33),
        (result = (const char *)memchr(v33, 0, v34)) != 0))
  {
    result = (const char *)sub_1000044A8(*((unsigned int *)v3 + 3), v3 + 40, v28, v30, *(_DWORD *)(v32 + 3128), v33, *(_DWORD *)(v32 + v23 + 3140));
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  else
  {
LABEL_46:
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  return result;
}

_DWORD *sub_100005F8C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }
  else
  {
    result = (_DWORD *)sub_100004468(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t sub_100005FE4(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 954437181) >= 0xFFFFFFFC
    && (v5 = (void (*)(void))*(&off_1000084D8 + 5 * (v4 - 954437177) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100006078()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 329, "NULL != path");
}

void sub_1000060A0()
{
  __assert_rtn("-[Copier isCandidateFileName:forSourceFileName:]", "copier.m", 330, "NULL != sourceFilename");
}

void sub_1000060C8()
{
  __assert_rtn("_server_create_session", "server.m", 187, "oldport == MACH_PORT_NULL");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_cancelCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelCopy");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copierWithSourceURL_uniqueIdentifier_destURL_sandboxExtension_callbackTarget_selector_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copierWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectory:error:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createTemporaryDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createTemporaryDirectory:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_destroyTemporaryDirectory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destroyTemporaryDirectory:error:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileName_inDirectory_hasUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileName:inDirectory:hasUniqueIdentifier:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identicalDocumentInDirectory_sourceURL_uniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identicalDocumentInDirectory:sourceURL:uniqueIdentifier:");
}

id objc_msgSend_initWithServerPort_clientPort_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerPort:clientPort:pid:");
}

id objc_msgSend_initWithSourceURL_uniqueIdentifier_destURL_sandboxExtension_callbackTarget_selector_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSourceURL:uniqueIdentifier:destURL:sandboxExtension:callbackTarget:selector:options:");
}

id objc_msgSend_initWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:selector:object:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_isCandidateFileName_forSourceFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCandidateFileName:forSourceFileName:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lookupSessionForPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookupSessionForPort:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_performSelector_withObject_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performSelector:withObject:withObject:");
}

id objc_msgSend_serverPort(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverPort");
}

id objc_msgSend_sessionCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionCount");
}

id objc_msgSend_sessionWithServerPort_clientPort_pid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithServerPort:clientPort:pid:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setUniqueIdentifier_forPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueIdentifier:forPath:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startCopy");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingPathExtension");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_uniquePathInDirectory_sourceURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniquePathInDirectory:sourceURL:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_validateSourceURLForCopying_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validateSourceURLForCopying:error:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
