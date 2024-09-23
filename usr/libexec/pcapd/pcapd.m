void start()
{
  dispatch_workloop_t inactive;
  uint64_t v1;
  const char *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  dispatch_time_t v5;
  const __CFString *v6;
  const char *v7;
  uint32_t v8;
  int v9;
  NSObject *v10;
  uint32_t v11;
  uint32_t v12;
  FILE *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  _QWORD v23[4];
  int v24;
  _QWORD handler[4];
  int v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint32_t v34;
  _QWORD v35[5];

  if (sub_100005F60("com.apple.pcapd"))
  {
    inactive = dispatch_workloop_create_inactive("com.apple.pcapd");
    qword_10000C048 = (uint64_t)inactive;
    if (!inactive)
    {
      fprintf(__stderrp, "%s:%d dispatch_queue_create() failed: main queue\n", "main", 180);
      v1 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 136315394;
      v28 = "main";
      v29 = 1024;
      v30 = 180;
      v2 = "%s:%d dispatch_queue_create() failed: main queue";
      goto LABEL_18;
    }
    dispatch_workloop_set_scheduler_priority(inactive, 47, 1);
    dispatch_activate((dispatch_object_t)qword_10000C048);
    v3 = dispatch_semaphore_create(0);
    if (!v3)
    {
      fprintf(__stderrp, "%s:%d dispatch_semaphore_create() failed\n", "main", 255);
      v1 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 136315394;
      v28 = "main";
      v29 = 1024;
      v30 = 255;
      v2 = "%s:%d dispatch_semaphore_create() failed";
      goto LABEL_18;
    }
    v4 = v3;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 0x40000000;
    v35[2] = sub_10000414C;
    v35[3] = &unk_100008238;
    v35[4] = v3;
    if (lockdown_checkin_xpc("com.apple.pcapd", 0, 0, v35))
    {
      fprintf(__stderrp, "%s:%d failure to secure checkin with the lockdown service\n", "main", 265);
      v1 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 136315394;
      v28 = "main";
      v29 = 1024;
      v30 = 265;
      v2 = "%s:%d failure to secure checkin with the lockdown service";
      goto LABEL_18;
    }
    v5 = dispatch_time(0, 10000000000);
    if (dispatch_semaphore_wait(v4, v5))
    {
      fprintf(__stderrp, "%s:%d Timed out waiting for the service to checkin in.\n", "main", 270);
      v1 = qword_10000D090;
      if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      *(_DWORD *)buf = 136315394;
      v28 = "main";
      v29 = 1024;
      v30 = 270;
      v2 = "%s:%d Timed out waiting for the service to checkin in.";
      goto LABEL_18;
    }
    dispatch_release(v4);
    v6 = (const __CFString *)kLockdownNotificationHostDetached;
    v7 = sub_10000415C(kLockdownNotificationHostDetached);
    v8 = notify_register_dispatch(v7, (int *)&unk_10000C058, (dispatch_queue_t)qword_10000C048, &stru_100008278);
    if (v8)
    {
      v12 = v8;
      v13 = __stderrp;
      v14 = sub_10000415C(v6);
      fprintf(v13, "%s:%d failed to setup notification for %s: %d\n", "main", 288, v14, v12);
      v15 = qword_10000D090;
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v28 = "main";
        v29 = 1024;
        v30 = 288;
        v31 = 2080;
        v32 = sub_10000415C(v6);
        v33 = 1024;
        v34 = v12;
        v2 = "%s:%d failed to setup notification for %s: %d";
        v10 = v15;
        v11 = 34;
        goto LABEL_19;
      }
    }
    else
    {
      v9 = sub_1000044A0();
      if (v9 == -1)
      {
        fprintf(__stderrp, "%s:%d failure to kernel control socket\n", "main", 295);
        v1 = qword_10000D090;
        if (!os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
          goto LABEL_20;
        *(_DWORD *)buf = 136315394;
        v28 = "main";
        v29 = 1024;
        v30 = 295;
        v2 = "%s:%d failure to kernel control socket";
        goto LABEL_18;
      }
      v16 = v9;
      v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v9, 0, (dispatch_queue_t)qword_10000C048);
      qword_10000C060 = (uint64_t)v17;
      if (v17)
      {
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000;
        handler[2] = sub_100004C94;
        handler[3] = &unk_100008298;
        v26 = v16;
        dispatch_source_set_event_handler(v17, handler);
        dispatch_resume((dispatch_object_t)qword_10000C060);
        v18 = 30;
        v19 = &dword_100000004;
        while (1)
        {
          signal(v18, (void (__cdecl *)(int))1);
          v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v18, 0, (dispatch_queue_t)qword_10000C048);
          if (!v20)
            break;
          v21 = v20;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 0x40000000;
          v23[2] = sub_100005184;
          v23[3] = &unk_1000082B8;
          v24 = v18;
          dispatch_source_set_event_handler(v20, v23);
          dispatch_resume(v21);
          v18 = *(_DWORD *)((char *)&unk_100007160 + v19);
          v19 += 4;
          if (v19 == 32)
            dispatch_main();
        }
        fprintf(__stderrp, "%s:%d dispatch_source_create(%d) failed\n", "main", 431, v18);
        v22 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v28 = "main";
          v29 = 1024;
          v30 = 431;
          v31 = 1024;
          LODWORD(v32) = v18;
          v2 = "%s:%d dispatch_source_create(%d) failed";
          v10 = v22;
          v11 = 24;
          goto LABEL_19;
        }
      }
      else
      {
        fprintf(__stderrp, "%s:%d dispatch_source_create() for DISPATCH_SOURCE_TYPE_READ failed.\n", "main", 415);
        v1 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "main";
          v29 = 1024;
          v30 = 415;
          v2 = "%s:%d dispatch_source_create() for DISPATCH_SOURCE_TYPE_READ failed.";
LABEL_18:
          v10 = v1;
          v11 = 18;
LABEL_19:
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v2, buf, v11);
        }
      }
    }
  }
LABEL_20:
  exit(1);
}

intptr_t sub_10000414C(uint64_t a1, uint64_t a2)
{
  qword_10000C050 = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

const char *sub_10000415C(const __CFString *a1)
{
  CFTypeID v2;
  CFStringEncoding FastestEncoding;
  const char *CStringPtr;
  int v5;
  CFTypeID v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;

  if (!a1)
    return "<NULL>";
  v2 = CFGetTypeID(a1);
  if (v2 != CFStringGetTypeID())
  {
    v7 = CFGetTypeID(a1);
    if (v7 == CFDataGetTypeID())
    {
      v8 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)a1, 0x8000100u);
      if (!v8)
        goto LABEL_15;
    }
    else
    {
      v8 = CFCopyDescription(a1);
      if (!v8)
        goto LABEL_15;
    }
    v9 = v8;
    if (CFStringGetCString(v8, &byte_10000C080[1024 * (uint64_t)dword_10000D080], 1024, 0x8000100u))
    {
      CStringPtr = &byte_10000C080[1024 * (uint64_t)dword_10000D080];
      if (dword_10000D080 <= 2)
        v10 = dword_10000D080 + 1;
      else
        v10 = 0;
      dword_10000D080 = v10;
    }
    else
    {
      CStringPtr = 0;
    }
    CFRelease(v9);
    goto LABEL_24;
  }
  FastestEncoding = CFStringGetFastestEncoding(a1);
  if (!FastestEncoding || FastestEncoding == 134217984 || FastestEncoding == 1536)
  {
    CStringPtr = CFStringGetCStringPtr(a1, FastestEncoding);
    if (CStringPtr)
      goto LABEL_24;
  }
  if (CFStringGetCString(a1, &byte_10000C080[1024 * (uint64_t)dword_10000D080], 1024, 0x8000100u))
  {
    CStringPtr = &byte_10000C080[1024 * (uint64_t)dword_10000D080];
    if (dword_10000D080 <= 2)
      v5 = dword_10000D080 + 1;
    else
      v5 = 0;
    dword_10000D080 = v5;
    goto LABEL_24;
  }
LABEL_15:
  CStringPtr = 0;
LABEL_24:
  if (CStringPtr)
    return CStringPtr;
  else
    return "???";
}

void sub_1000042CC(id a1, int a2)
{
  NSObject *v2;
  uint8_t buf[4];
  const char *v4;
  __int16 v5;
  int v6;

  if (qword_10000C060)
  {
    dispatch_source_cancel((dispatch_source_t)qword_10000C060);
    if (qword_10000C060)
    {
      dispatch_release((dispatch_object_t)qword_10000C060);
      qword_10000C060 = 0;
    }
  }
  sub_100004390();
  fprintf(__stdoutp, "%s:%d Device was detached from host, exiting\n", "main_block_invoke", 284);
  v2 = qword_10000D090;
  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v4 = "main_block_invoke";
    v5 = 1024;
    v6 = 284;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s:%d Device was detached from host, exiting", buf, 0x12u);
  }
  exit(1);
}

void sub_100004390()
{
  NSObject *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  if (qword_10000D088)
  {
    fprintf(__stdoutp, "%s:%d cleanup %s\n", "cleanup_pktap", 605, (const char *)qword_10000D088);
    v0 = qword_10000D090;
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v2 = "cleanup_pktap";
      v3 = 1024;
      v4 = 605;
      v5 = 2080;
      v6 = qword_10000D088;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "%s:%d cleanup %s", buf, 0x1Cu);
    }
    pcap_cleanup_pktap_interface(qword_10000D088);
    if (qword_10000D088)
    {
      free((void *)qword_10000D088);
      qword_10000D088 = 0;
    }
  }
}

uint64_t sub_1000044A0()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  FILE *v23;
  int *v24;
  char *v25;
  FILE *v26;
  int *v27;
  char *v28;
  NSObject *v29;
  FILE *v30;
  int *v31;
  char *v32;
  FILE *v33;
  int *v34;
  char *v35;
  FILE *v36;
  int *v37;
  char *v38;
  FILE *v39;
  int *v40;
  char *v41;
  FILE *v42;
  int *v43;
  char *v44;
  FILE *v45;
  int *v46;
  char *v47;
  FILE *v48;
  int *v49;
  char *v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint8_t buf[4];
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  char *v62;
  char v63[256];
  char __str[19];
  _BYTE v65[40];

  memset(v65, 0, 32);
  v54 = 0;
  v52 = 0;
  v53 = 0;
  qword_10000D088 = pcap_setup_pktap_interface("pktap", v63);
  if (qword_10000D088)
  {
    snprintf(__str, 0x13uLL, "/dev/bpf%d", 0);
    v0 = open(__str, 0);
    if ((_DWORD)v0 == -1)
    {
      v1 = 1;
      while (*__error() == 16)
      {
        snprintf(__str, 0x13uLL, "/dev/bpf%d", v1);
        v2 = open(__str, 0);
        ++v1;
        if ((_DWORD)v2 != -1)
        {
          v0 = v2;
          goto LABEL_7;
        }
      }
      v26 = __stderrp;
      v27 = __error();
      v28 = strerror(*v27);
      fprintf(v26, "%s:%d open(%s) - %s\n", "pcapd_open_bpf_device", 476, __str, v28);
      v29 = qword_10000D090;
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
        sub_1000067DC((uint64_t)__str, v29);
    }
    else
    {
LABEL_7:
      if (dword_10000D098 >= 1)
      {
        fprintf(__stdoutp, "%s:%d intended bpf buffer size: %u\n", "pcapd_open_bpf_device", 486, dword_10000C000);
        v3 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
          sub_10000674C(v3, v4, v5, v6, v7, v8, v9, v10);
      }
      if (ioctl(v0, 0xC0044266uLL, &dword_10000C000) < 0)
      {
        v23 = __stderrp;
        v24 = __error();
        v25 = strerror(*v24);
        fprintf(v23, "%s:%d ioctl(BIOCSBLEN) - %s\n", "pcapd_open_bpf_device", 488, v25);
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
          sub_100006254();
      }
      else if (ioctl(v0, 0x40044266uLL, &dword_10000C000) < 0)
      {
        v30 = __stderrp;
        v31 = __error();
        v32 = strerror(*v31);
        fprintf(v30, "%s:%d ioctl(BIOCGBLEN) - %s\n", "pcapd_open_bpf_device", 492, v32);
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
          sub_1000062D4();
      }
      else
      {
        if (dword_10000D098 >= 1)
        {
          fprintf(__stdoutp, "%s:%d final bpf buffer size: %u\n", "pcapd_open_bpf_device", 495, dword_10000C000);
          v11 = qword_10000D090;
          if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
            sub_1000066BC(v11, v12, v13, v14, v15, v16, v17, v18);
        }
        v19 = dword_10000C000;
        if (!dword_10000C000)
          sub_100006354((char **)buf);
        v20 = malloc_type_malloc(dword_10000C000, 0x5CED6262uLL);
        if (!v20)
          sub_100006384((char **)buf, v19);
        qword_10000C068 = (uint64_t)v20;
        v54 = 1;
        if (ioctl(v0, 0xC004427FuLL, &v54) < 0)
        {
          v33 = __stderrp;
          v34 = __error();
          v35 = strerror(*v34);
          fprintf(v33, "%s:%d ioctl(BIOCSWANTPKTAP) - %s\n", "pcapd_open_bpf_device", 506, v35);
          if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
            sub_1000063BC();
        }
        else
        {
          __strlcpy_chk(v65, qword_10000D088, 16, 16);
          if (ioctl(v0, 0x8020426CuLL, v65) == -1)
          {
            v36 = __stderrp;
            v37 = __error();
            v38 = strerror(*v37);
            fprintf(v36, "%s:%d ioctl(BIOCSETIF) - %s\n", "pcapd_open_bpf_device", 515, v38);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
              sub_10000643C();
          }
          else
          {
            v54 = 149;
            if (ioctl(v0, 0x80044278uLL, &v54) == -1)
            {
              v39 = __stderrp;
              v40 = __error();
              v41 = strerror(*v40);
              fprintf(v39, "%s:%d ioctl(BIOCSDLT) - %s\n", "pcapd_open_bpf_device", 524, v41);
              if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
                sub_1000064BC();
            }
            else
            {
              v52 = 1;
              LODWORD(v53) = 0;
              if (ioctl(v0, 0x8010426DuLL, &v52) == -1)
              {
                v42 = __stderrp;
                v43 = __error();
                v44 = strerror(*v43);
                fprintf(v42, "%s:%d ioctl(BIOCSRTIMEOUT) - %s\n", "pcapd_open_bpf_device", 534, v44);
                if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
                  sub_10000653C();
              }
              else
              {
                v21 = fcntl(v0, 3, 0);
                if (v21 == -1)
                {
                  v45 = __stderrp;
                  v46 = __error();
                  v47 = strerror(*v46);
                  fprintf(v45, "%s:%d fcntl(F_GETFL) - %s\n", "pcapd_open_bpf_device", 543, v47);
                  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
                    sub_1000065BC();
                }
                else
                {
                  if ((v21 & 4) != 0 || fcntl(v0, 4, v21 | 4u) != -1)
                  {
                    fprintf(__stdoutp, "%s:%d taping %s over %s\n", "pcapd_open_bpf_device", 554, (const char *)qword_10000D088, __str);
                    v22 = qword_10000D090;
                    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136315906;
                      v56 = "pcapd_open_bpf_device";
                      v57 = 1024;
                      v58 = 554;
                      v59 = 2080;
                      v60 = qword_10000D088;
                      v61 = 2080;
                      v62 = __str;
                      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%d taping %s over %s", buf, 0x26u);
                    }
                    return v0;
                  }
                  v48 = __stderrp;
                  v49 = __error();
                  v50 = strerror(*v49);
                  fprintf(v48, "%s:%d fcntl(F_SETFL) - %s\n", "pcapd_open_bpf_device", 549, v50);
                  if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
                    sub_10000663C();
                }
              }
            }
          }
        }
      }
      close(v0);
    }
  }
  else
  {
    fprintf(__stderrp, "%s:%d pcap_setup_pktap_interface() fail - %s\n", "pcapd_open_bpf_device", 462, v63);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_1000061D0();
  }
  if (qword_10000C068)
  {
    free((void *)qword_10000C068);
    qword_10000C068 = 0;
  }
  sub_100004390();
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004C94(uint64_t a1)
{
  uint64_t result;
  unint64_t v2;
  unint64_t v3;
  _DWORD *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFData *v14;
  const __CFData *v15;
  FILE *v16;
  CFIndex Length;
  NSObject *v18;
  CFIndex v19;
  NSObject *v20;
  FILE *v21;
  int *v22;
  char *v23;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  CFIndex v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[2];

  do
  {
LABEL_1:
    while (1)
    {
      result = read(*(_DWORD *)(a1 + 32), (void *)qword_10000C068, dword_10000C000);
      if (result == -1)
        break;
      if (!result)
        return result;
      if (result >= 1)
      {
        v2 = qword_10000C068;
        v3 = qword_10000C068 + result;
        while (1)
        {
          v35 = 0u;
          memset(v36, 0, 19);
          v33 = 0u;
          v34 = 0u;
          v31 = 0u;
          v32 = 0u;
          if (v2 + 176 > v3)
            break;
          v4 = (_DWORD *)(v2 + *(unsigned __int16 *)(v2 + 16));
          v5 = (char *)v4 + *v4;
          sub_100005B74((uint64_t)v4);
          sub_100005CB0((uint64_t)v5, (*(_DWORD *)(v2 + 8) - *v4));
          sub_100005718((int *)v2, (uint64_t)&v31);
          sub_100005400((uint64_t)&v31);
          v6 = *(unsigned int *)(v2 + 8) - (unint64_t)*v4 + 99;
          v7 = qword_10000C078;
          if (v6 > qword_10000C070)
          {
            v8 = reallocf((void *)qword_10000C078, *(unsigned int *)(v2 + 8) - (unint64_t)*v4 + 99);
            if (!v8)
              sub_100006884((char **)buf, v6);
            v7 = (uint64_t)v8;
            qword_10000C078 = (uint64_t)v8;
            qword_10000C070 = v6;
          }
          v9 = v31;
          v10 = v33;
          *(_OWORD *)(v7 + 16) = v32;
          *(_OWORD *)(v7 + 32) = v10;
          *(_OWORD *)v7 = v9;
          v11 = v34;
          v12 = v35;
          v13 = v36[0];
          *(_DWORD *)(v7 + 95) = *(_DWORD *)((char *)v36 + 15);
          *(_OWORD *)(v7 + 64) = v12;
          *(_OWORD *)(v7 + 80) = v13;
          *(_OWORD *)(v7 + 48) = v11;
          memcpy((void *)(v7 + 99), v5, (*(_DWORD *)(v2 + 8) - *v4));
          v14 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v7, v6, kCFAllocatorNull);
          if (!v14)
          {
            fprintf(__stderrp, "%s:%d unable to allocate memory for packet\n", "main_block_invoke", 368);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
              sub_1000068BC();
            lockdown_disconnect(qword_10000C050);
            goto LABEL_26;
          }
          v15 = v14;
          if (dword_10000D098 >= 1)
          {
            v16 = __stdoutp;
            Length = CFDataGetLength(v14);
            fprintf(v16, "%s:%d sending remote packet to host with payload size: %ld\n", "main_block_invoke", 377, Length);
            v18 = qword_10000D090;
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
            {
              v19 = CFDataGetLength(v15);
              *(_DWORD *)buf = 136315650;
              v26 = "main_block_invoke";
              v27 = 1024;
              v28 = 377;
              v29 = 2048;
              v30 = v19;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%s:%d sending remote packet to host with payload size: %ld", buf, 0x1Cu);
            }
          }
          if (lockdown_send_message(qword_10000C050, v15, 200))
          {
            fprintf(__stderrp, "%s:%d unable to send packet\n", "main_block_invoke", 382);
            if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
              sub_100006934();
            lockdown_disconnect(qword_10000C050);
            sub_100004390();
            CFRelease(v15);
            goto LABEL_30;
          }
          CFRelease(v15);
          v2 += (*(_DWORD *)(v2 + 8) + *(unsigned __int16 *)(v2 + 16) + 3) & 0x1FFFFFFFCLL;
          if (v2 >= v3)
            goto LABEL_1;
        }
        fprintf(__stdoutp, "%s:%d not enough space for bpf and pktap headers\n", "main_block_invoke", 335);
        v20 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "main_block_invoke";
          v27 = 1024;
          v28 = 335;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s:%d not enough space for bpf and pktap headers", buf, 0x12u);
        }
      }
    }
  }
  while (*__error() == 4);
  result = (uint64_t)__error();
  if (*(_DWORD *)result != 35)
  {
    v21 = __stderrp;
    v22 = __error();
    v23 = strerror(*v22);
    fprintf(v21, "%s:%d read bpf %s\n", "main_block_invoke", 311, v23);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_1000069AC();
LABEL_26:
    close(*(_DWORD *)(a1 + 32));
    sub_100004390();
LABEL_30:
    exit(1);
  }
  return result;
}

void sub_100005184(uint64_t a1)
{
  unsigned int v1;
  int v2;
  NSObject *v3;
  int v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 0x1F)
  {
    if (((1 << v1) & 0xE248) != 0)
    {
      sub_100004390();
      return;
    }
    if (v1 == 30)
    {
      v4 = dword_10000D098;
      if (dword_10000D098 != 0x7FFFFFFF)
      {
        ++dword_10000D098;
        fprintf(__stdoutp, "%s:%d pcapd verbosity now %d\n", "handle_signal", 577, v4 + 1);
        v3 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v6 = "handle_signal";
          v7 = 1024;
          v8 = 577;
          v9 = 1024;
          v10 = dword_10000D098;
          goto LABEL_12;
        }
      }
    }
    else if (v1 == 31)
    {
      v2 = dword_10000D098 - 1;
      if (dword_10000D098 >= 1)
      {
        --dword_10000D098;
        fprintf(__stdoutp, "%s:%d pcapd verbosity now %d\n", "handle_signal", 583, v2);
        v3 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v6 = "handle_signal";
          v7 = 1024;
          v8 = 583;
          v9 = 1024;
          v10 = dword_10000D098;
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s:%d pcapd verbosity now %d", buf, 0x18u);
        }
      }
    }
  }
}

void sub_100005384(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

char *sub_1000053C8(int *a1)
{
  return strerror(*a1);
}

int *sub_1000053D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
  return __error();
}

void sub_1000053E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000053F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x18u);
}

int8x8_t sub_100005400(uint64_t a1)
{
  int8x8_t result;

  *(_DWORD *)a1 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)(a1 + 5) = bswap32(*(_DWORD *)(a1 + 5));
  *(int8x8_t *)(a1 + 13) = vrev32_s8(*(int8x8_t *)(a1 + 13));
  *(_DWORD *)(a1 + 21) = bswap32(*(_DWORD *)(a1 + 21));
  *(_WORD *)(a1 + 10) = bswap32(*(unsigned __int16 *)(a1 + 10)) >> 16;
  result = vrev32_s8(*(int8x8_t *)(a1 + 87));
  *(int8x8_t *)(a1 + 87) = result;
  *(_DWORD *)(a1 + 95) = bswap32(*(_DWORD *)(a1 + 95));
  return result;
}

uint64_t sub_10000545C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  int v11;
  int v12;
  int v13;

  if (!a1)
  {
    fprintf(__stderrp, "%s:%d iptap_hdr == NULL\n", "rvi_iptap_to_pktap", 58);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006A2C();
    errx(5, "iptap_hdr == NULL");
  }
  if (!a2)
  {
    fprintf(__stderrp, "%s:%d pktap_hdr == NULL\n", "rvi_iptap_to_pktap", 63);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006AA4();
    errx(5, "pktap_hdr == NULL");
  }
  *(_OWORD *)(a2 + 140) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_QWORD *)a2 = 0x10000009CLL;
  v4 = *(unsigned __int8 *)(a1 + 9);
  v5 = 1;
  if (v4 > 0x36)
  {
    if (*(unsigned __int8 *)(a1 + 9) > 0xD0u)
    {
      if (v4 == 209)
        goto LABEL_22;
      if (v4 != 255)
        goto LABEL_20;
    }
    else if (v4 != 55 && v4 != 57)
    {
      goto LABEL_20;
    }
LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  if (*(unsigned __int8 *)(a1 + 9) <= 0x16u)
  {
    if (v4 != 1)
    {
      if (v4 == 6)
        goto LABEL_22;
      goto LABEL_20;
    }
    if (strcmp((const char *)(a1 + 25), "utun") && strcmp((const char *)(a1 + 25), "ipsec"))
    {
LABEL_20:
      v5 = 12;
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if (v4 != 23)
  {
    if (v4 != 24)
      goto LABEL_20;
    goto LABEL_21;
  }
  v5 = 9;
LABEL_22:
  *(_DWORD *)(a2 + 8) = v5;
  snprintf((char *)(a2 + 12), 0x18uLL, "%s%u", (const char *)(a1 + 25), *(unsigned __int16 *)(a1 + 10));
  v6 = *(unsigned __int8 *)(a1 + 12);
  if (v6 == 1)
  {
    v7 = 2;
  }
  else if (v6 == 16)
  {
    v7 = 1;
  }
  else
  {
    v7 = *(_DWORD *)(a2 + 36);
  }
  *(_DWORD *)(a2 + 36) = v7 | *(_DWORD *)(a1 + 95);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 13);
  v8 = *(_DWORD *)(a1 + 21);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)(a1 + 62);
  v9 = *(_DWORD *)(a1 + 41);
  *(_DWORD *)(a2 + 48) = v8;
  *(_DWORD *)(a2 + 52) = v9;
  result = __strlcpy_chk(a2 + 56, a1 + 45, 17, 17);
  v11 = *(_DWORD *)(a1 + 66);
  if (v11 == -1 || v11 == *(_DWORD *)(a1 + 41))
  {
    *(_DWORD *)(a2 + 84) = -1;
  }
  else
  {
    *(_DWORD *)(a2 + 36) |= 4u;
    *(_DWORD *)(a2 + 84) = v11;
    result = __strlcpy_chk(a2 + 88, a1 + 70, 17, 17);
  }
  v12 = *(_DWORD *)(a1 + 87);
  v13 = *(_DWORD *)(a1 + 91);
  if (*(_QWORD *)(a1 + 87))
  {
    *(_DWORD *)(a2 + 36) |= 0x2000u;
    *(_DWORD *)(a2 + 116) = v12;
    *(_DWORD *)(a2 + 120) = v13;
  }
  *(_WORD *)(a2 + 80) = *(unsigned __int8 *)(a1 + 9);
  *(_WORD *)(a2 + 82) = *(_WORD *)(a1 + 10);
  return result;
}

void sub_100005718(int *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  char v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;

  if (!a1)
  {
    fprintf(__stderrp, "%s:%d bpfhdr == NULL\n", "rvi_bpf_to_iptap", 140);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006B1C();
    errx(5, "bpfhdr == NULL");
  }
  if (!a2)
  {
    fprintf(__stderrp, "%s:%d iptap_hdr == NULL\n", "rvi_bpf_to_iptap", 145);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006B94();
    errx(5, "iptap_hdr == NULL");
  }
  v4 = (uint64_t)a1 + *((unsigned __int16 *)a1 + 8);
  *(_DWORD *)a2 = 99;
  *(_BYTE *)(a2 + 4) = 2;
  *(_DWORD *)(a2 + 5) = a1[2] - *(_DWORD *)v4;
  *(_BYTE *)(a2 + 9) = *(_BYTE *)(v4 + 80);
  v5 = *(_DWORD *)(v4 + 36);
  if ((v5 & 1) != 0)
  {
    v6 = 16;
  }
  else
  {
    if ((v5 & 2) == 0)
      goto LABEL_8;
    v6 = 1;
  }
  *(_BYTE *)(a2 + 12) = v6;
LABEL_8:
  *(_DWORD *)(a2 + 95) = v5;
  *(_DWORD *)(a2 + 13) = *(_DWORD *)(v4 + 40);
  if (*(_DWORD *)(v4 + 8))
    v7 = *(_DWORD *)(v4 + 44);
  else
    v7 = 4;
  *(_DWORD *)(a2 + 17) = v7;
  v8 = *(_DWORD *)(v4 + 52);
  *(_DWORD *)(a2 + 21) = *(_DWORD *)(v4 + 48);
  *(_DWORD *)(a2 + 41) = v8;
  __strlcpy_chk(a2 + 45, v4 + 56, 17, 17);
  *(_DWORD *)(a2 + 62) = *(_DWORD *)(v4 + 76);
  *(_DWORD *)(a2 + 66) = *(_DWORD *)(v4 + 84);
  __strlcpy_chk(a2 + 70, v4 + 88, 17, 17);
  v9 = *(_DWORD *)(v4 + 116);
  v10 = *(_DWORD *)(v4 + 120);
  if (*(_QWORD *)(v4 + 116) || (v9 = *a1, v10 = a1[1], *(_QWORD *)a1))
  {
    *(_DWORD *)(a2 + 95) |= 0x2000u;
    *(_DWORD *)(a2 + 87) = v9;
    *(_DWORD *)(a2 + 91) = v10;
  }
  v11 = v4 + 12;
  v12 = strpbrk((char *)(v4 + 12), "0123456789");
  if (v12)
  {
    v13 = v12;
    *(_WORD *)(a2 + 10) = atoi(v12);
    *v13 = 0;
    __strlcpy_chk(a2 + 25, v11, 16, 16);
  }
  else
  {
    fprintf(__stderrp, "%s:%d no unit number in %s\n", "rvi_bpf_to_iptap", 193, (const char *)(v4 + 12));
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006C0C();
    *(_WORD *)(a2 + 10) = 0;
  }
}

void sub_100005980(uint64_t a1)
{
  const char *v2;
  char v3[33];
  char __str[256];

  if (dword_10000D098 >= 2)
  {
    sub_100005AE4(v3, *(_DWORD *)(a1 + 95));
    v2 = "input";
    if (*(_BYTE *)(a1 + 12) == 1)
      v2 = "output";
    snprintf(__str, 0x100uLL, "iptap: %s hdr_length: %d length: %d frame_pre_length: %dframe_pst_length: %d version: %d type: %d ifname: %s%d process %s.%d svc %d tstamp %d.%d flags 0x%x (%s)", v2, *(_DWORD *)a1, *(_DWORD *)(a1 + 5), *(_DWORD *)(a1 + 17), *(_DWORD *)(a1 + 21), *(unsigned __int8 *)(a1 + 4), *(unsigned __int8 *)(a1 + 9), (const char *)(a1 + 25), *(unsigned __int16 *)(a1 + 10), (const char *)(a1 + 45), *(_DWORD *)(a1 + 41), *(_DWORD *)(a1 + 62), *(_DWORD *)(a1 + 87), *(_DWORD *)(a1 + 91), *(_DWORD *)(a1 + 95),
      v3);
    if (dword_10000D098 >= 1)
    {
      fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_iptap_header", 256, __str);
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
        sub_100006C8C();
    }
  }
}

uint64_t sub_100005AE4(char *a1, unsigned int a2)
{
  uint64_t v2;
  char *v3;
  char v5[33];

  v2 = 0;
  v5[0] = 0;
  v3 = v5;
  do
  {
    if (((a2 >> v2) & 1) != 0)
      *(_WORD *)v3++ = aIopiTnrksc2w[v2];
    ++v2;
  }
  while (v2 != 32);
  return snprintf(a1, 0x21uLL, "%s", v5);
}

void sub_100005B74(uint64_t a1)
{
  char v2[33];
  char __str[256];

  if (dword_10000D098 >= 2)
  {
    sub_100005AE4(v2, *(_DWORD *)(a1 + 36));
    snprintf(__str, 0x100uLL, "pktap length %u type_next %u dlt %u ifname %s iftype %u flags 0x%x (%s) proto_fam %u prelen %u postlen %u pid %u comm %s svc %u epid %u ecomm %s ", *(_DWORD *)a1, *(_DWORD *)(a1 + 4), *(_DWORD *)(a1 + 8), (const char *)(a1 + 12), *(unsigned __int16 *)(a1 + 80), *(_DWORD *)(a1 + 36), v2, *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44), *(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52), (const char *)(a1 + 56), *(_DWORD *)(a1 + 76), *(_DWORD *)(a1 + 84), (const char *)(a1 + 88));
    if (dword_10000D098 >= 1)
    {
      fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_pktap_header", 286, __str);
      if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
        sub_100006D00();
    }
  }
}

void sub_100005CB0(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unsigned int v14;
  char v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __uint32_t v21;
  char v22;
  NSObject *v23;
  unint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  char *v31;
  char __str[99];

  if (dword_10000D098 >= 3 && a2 != 0)
  {
    v4 = 0;
    v5 = 16;
    do
    {
      v25 = v5;
      if (a2 >= v5)
        v6 = v5;
      else
        v6 = a2;
      v7 = snprintf(__str, 0x63uLL, "\t0x%04lx:  ", v4);
      v8 = v7;
      v9 = v4 + 16;
      if (v4 == -16)
      {
        v10 = v7;
      }
      else
      {
        v11 = 0;
        do
        {
          if (v4 + v11 >= a2)
          {
            v16 = 32;
            __str[v8] = 32;
          }
          else
          {
            v12 = *(unsigned __int8 *)(a1 + v4 + v11);
            v13 = (v12 >> 4) + 87;
            if (v12 < 0xA0)
              LOBYTE(v13) = (*(_BYTE *)(a1 + v4 + v11) >> 4) | 0x30;
            __str[v8] = v13;
            v14 = v12 & 0xF;
            v15 = v12 & 0xF | 0x30;
            v16 = (v12 & 0xF) + 87;
            if (v14 < 0xA)
              v16 = v15;
          }
          __str[v8 + 1] = v16;
          v10 = v8 + 2;
          if ((((_BYTE)v4 + (_BYTE)v11) & 1) != 0)
          {
            __str[v10] = 32;
            v10 = v8 + 3;
          }
          if (v11 == 15)
            __str[v10++] = 32;
          ++v11;
          v8 = v10;
        }
        while (v4 + v11 < v9);
      }
      *(_WORD *)&__str[v10] = 8224;
      v17 = v10 + 2;
      if (v9 >= a2)
        v18 = a2;
      else
        v18 = v4 + 16;
      if (v4 < v18)
      {
        v19 = a1;
        do
        {
          v20 = *(unsigned __int8 *)(v19 + v4);
          if (*(char *)(v19 + v4) < 0)
            v21 = __maskrune(*(unsigned __int8 *)(v19 + v4), 0x40000uLL);
          else
            v21 = _DefaultRuneLocale.__runetype[v20] & 0x40000;
          ++v19;
          if (v21)
            v22 = v20;
          else
            v22 = 46;
          __str[v17++] = v22;
          --v6;
        }
        while (v4 != v6);
      }
      __str[v17] = 0;
      if (dword_10000D098 >= 1)
      {
        fprintf(__stdoutp, "%s:%d %s\n", "rvi_log_hexdump", 330, __str);
        v23 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v27 = "rvi_log_hexdump";
          v28 = 1024;
          v29 = 330;
          v30 = 2080;
          v31 = __str;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%s:%d %s", buf, 0x1Cu);
        }
      }
      v5 = v25 + 16;
      v4 = v9;
    }
    while (v9 < a2);
  }
}

BOOL sub_100005F60(char *subsystem)
{
  CFStringRef v2;
  const __CFString *v3;
  const __CFString *v4;
  _BOOL8 v5;
  const __CFString *v6;
  unint64_t AppIntegerValue;
  NSObject *v8;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;

  if (!qword_10000D090)
  {
    qword_10000D090 = (uint64_t)os_log_create(subsystem, "");
    if (!qword_10000D090)
    {
      fwrite("os_log_create failed", 0x14uLL, 1uLL, __stderrp);
      return 0;
    }
  }
  v2 = CFStringCreateWithCString(0, subsystem, 0x8000100u);
  if (!v2)
  {
    fprintf(__stderrp, "%s:%d CFStringCreateWithCString subsystem failed\n", "rvi_init_logging", 350);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006D74();
    return 0;
  }
  v3 = v2;
  v4 = CFStringCreateWithCString(0, "verbose", 0);
  v5 = v4 != 0;
  if (v4)
  {
    v6 = v4;
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(v4, v3, &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      if (AppIntegerValue <= 0x7FFFFFFE)
      {
        dword_10000D098 = AppIntegerValue;
        fprintf(__stdoutp, "%s:%d rvi_debug_verbosity is now %d\n", "rvi_init_logging", 363, AppIntegerValue);
        v8 = qword_10000D090;
        if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v12 = "rvi_init_logging";
          v13 = 1024;
          v14 = 363;
          v15 = 1024;
          v16 = dword_10000D098;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:%d rvi_debug_verbosity is now %d", buf, 0x18u);
        }
      }
    }
    CFRelease(v6);
  }
  else
  {
    fprintf(__stderrp, "%s:%d CFStringCreateWithCString verbose_key failed\n", "rvi_init_logging", 355);
    if (os_log_type_enabled((os_log_t)qword_10000D090, OS_LOG_TYPE_ERROR))
      sub_100006DEC();
  }
  CFRelease(v3);
  return v5;
}

void sub_1000061B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_1000061D0()
{
  os_log_t v0;
  int v1[10];

  v1[0] = 136315650;
  sub_1000053AC();
  sub_100005398();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d pcap_setup_pktap_interface() fail - %s", (uint8_t *)v1, 0x1Cu);
}

void sub_100006254()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSBLEN) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_1000062D4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCGBLEN) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_100006354(char **a1)
{
  *a1 = 0;
  asprintf(a1, "strict_malloc called with size 0");
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_100006384(char **a1, uint64_t a2)
{
  *a1 = 0;
  asprintf(a1, "strict_malloc(%zu) failed", a2);
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_1000063BC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSWANTPKTAP) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_10000643C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSETIF) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_1000064BC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSDLT) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_10000653C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d ioctl(BIOCSRTIMEOUT) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_1000065BC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d fcntl(F_GETFL) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_10000663C()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d fcntl(F_SETFL) - %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_1000066BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000053F0((void *)&_mh_execute_header, a1, a3, "%s:%d final bpf buffer size: %u", a5, a6, a7, a8, 2u);
  sub_1000053D8();
}

void sub_10000674C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000053F0((void *)&_mh_execute_header, a1, a3, "%s:%d intended bpf buffer size: %u", a5, a6, a7, a8, 2u);
  sub_1000053D8();
}

void sub_1000067DC(uint64_t a1, NSObject *a2)
{
  int *v4;
  uint64_t v5;
  _WORD v6[10];
  uint64_t v7;
  __int16 v8;
  uint64_t v9;

  v4 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v4);
  *(_DWORD *)v6 = 136315906;
  sub_1000053AC();
  *(_DWORD *)&v6[7] = 476;
  v6[9] = 2080;
  v7 = a1;
  v8 = 2080;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s:%d open(%s) - %s", (uint8_t *)v6, 0x26u);
  sub_1000053BC();
}

void sub_100006884(char **a1, uint64_t a2)
{
  *a1 = 0;
  asprintf(a1, "_strict_reallocf(%zu) failed", a2);
  qword_10000C010 = (uint64_t)*a1;
  __break(1u);
}

void sub_1000068BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d unable to allocate memory for packet", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d unable to send packet", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_1000069AC()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_1000053D0(__stack_chk_guard);
  sub_1000053C8(v0);
  sub_1000053AC();
  sub_100005398();
  sub_100005384((void *)&_mh_execute_header, v1, v2, "%s:%d read bpf %s", v3, v4, v5, v6, 2u);
  sub_1000053BC();
}

void sub_100006A2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d iptap_hdr == NULL", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006AA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d pktap_hdr == NULL", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006B1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d bpfhdr == NULL", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006B94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d iptap_hdr == NULL", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006C0C()
{
  os_log_t v0;
  int v1[10];

  v1[0] = 136315650;
  sub_1000053AC();
  sub_100005398();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s:%d no unit number in %s", (uint8_t *)v1, 0x1Cu);
  sub_1000061C8();
}

void sub_100006C8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_100005398();
  sub_1000061B8((void *)&_mh_execute_header, v0, v1, "%s:%d %s", v2, v3, v4, v5, 2u);
  sub_1000061C8();
}

void sub_100006D00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_100005398();
  sub_1000061B8((void *)&_mh_execute_header, v0, v1, "%s:%d %s", v2, v3, v4, v5, 2u);
  sub_1000061C8();
}

void sub_100006D74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d CFStringCreateWithCString subsystem failed", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}

void sub_100006DEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1000053AC();
  sub_1000053E0((void *)&_mh_execute_header, v0, v1, "%s:%d CFStringCreateWithCString verbose_key failed", v2, v3, v4, v5, 2u);
  sub_1000053D8();
}
