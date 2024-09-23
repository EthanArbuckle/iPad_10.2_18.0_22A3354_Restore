void sub_100004798()
{
  _QWORD *v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  in_addr_t *v6;
  in_addr v7;
  char *v8;
  uint64_t v9;
  in_addr v10;
  char *v11;
  int v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint8_t *v16;
  __int16 v17;
  char *v18;
  uint8_t v19[40];

  v0 = (_QWORD *)qword_10001C9C8;
  if (*(int *)(qword_10001C9C8 + 8) < 1)
    goto LABEL_22;
  v1 = 0;
  v2 = 0;
  do
  {
    v3 = *v0 + 96 * v1;
    if (!sub_1000105F8((uint64_t)qword_10001C9D0)
      || (v4 = (const char *)nullsub_1(v3), sub_1000049BC(v4)))
    {
      if (sub_100010260(v3) && (sub_100010204(v3) & 8) == 0)
      {
        v12 = v2;
        if ((int)sub_10001020C(v3) >= 1)
        {
          v5 = 0;
          do
          {
            v6 = (in_addr_t *)sub_100010214(v3, v5);
            v7.s_addr = *v6;
            v8 = inet_ntoa(v7);
            __strlcpy_chk(v19, v8, 32, 32);
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v9 = nullsub_1(v3);
              v10.s_addr = v6[1];
              v11 = inet_ntoa(v10);
              *(_DWORD *)buf = 136315650;
              v14 = v9;
              v15 = 2080;
              v16 = v19;
              v17 = 2080;
              v18 = v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface %s: ip %s mask %s", buf, 0x20u);
            }
            v5 = (v5 + 1);
          }
          while ((int)v5 < (int)sub_10001020C(v3));
        }
        v2 = v12 + 1;
      }
    }
    ++v1;
    v0 = (_QWORD *)qword_10001C9C8;
  }
  while (v1 < *(int *)(qword_10001C9C8 + 8));
  if (!v2)
  {
LABEL_22:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "no available interfaces", v19, 2u);
    }
    if ((byte_10001C9E0 & 1) == 0)
      exit(2);
  }
}

uint64_t sub_1000049BC(const char *a1)
{
  int v2;
  const char *v3;

  if ((int)sub_1000105F8((uint64_t)&unk_10001C9D0) < 1)
    return 0;
  v2 = 0;
  while (1)
  {
    v3 = (const char *)sub_100010614((uint64_t)&unk_10001C9D0, v2);
    if (!strcmp(a1, v3))
      break;
    if (++v2 >= (int)sub_1000105F8((uint64_t)&unk_10001C9D0))
      return 0;
  }
  return 1;
}

void sub_100004A3C()
{
  void *v0;
  uint64_t v1;
  uint8_t v2[16];

  v0 = sub_10000F978();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface list initialization failed", v2, 2u);
    }
    exit(1);
  }
  v1 = (uint64_t)v0;
  sub_100010188(&qword_10001C9C8);
  qword_10001C9C8 = v1;
}

void sub_100004AC4()
{
  void **v0;
  uint64_t v1;
  __CFString *Mutable;
  int v3;
  __CFString *v4;

  v0 = inetroute_list_init();
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v3) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "can't get inetroutes list", (uint8_t *)&v3, 2u);
    }
    exit(1);
  }
  v1 = (uint64_t)v0;
  inetroute_list_free((void **)&qword_10001C9E8);
  qword_10001C9E8 = v1;
  if (byte_10001C0B0)
  {
    Mutable = CFStringCreateMutable(0, 0);
    inetroute_list_print_cfstr(Mutable, (int *)qword_10001C9E8);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v3 = 138412290;
      v4 = Mutable;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Routes:\n%@", (uint8_t *)&v3, 0xCu);
    }
    CFRelease(Mutable);
  }
}

uint64_t sub_100004BF4(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_10001C9F0) >> 6) & 1;
}

uint64_t sub_100004C0C(uint64_t a1)
{
  return ((*(_DWORD *)(a1 + 76) | dword_10001C9F0) >> 7) & 1;
}

uint64_t sub_100004C24(uint64_t a1)
{
  *(_DWORD *)(a1 + 76) = *(_DWORD *)(a1 + 76) & 0x7FFFFFFD | 0x80000000;
  return sub_100004C3C(1);
}

uint64_t sub_100004C3C(uint64_t result)
{
  int v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  __CFArray *Mutable;
  const char *v6;
  CFStringRef v7;
  CFStringRef v8;
  CFDictionaryRef v9;
  const __CFString *v10;
  void *values;

  if (result | dword_10001D4A8)
  {
    v1 = result;
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)qword_10001D4A0, CFSTR("com.apple.bootpd.DHCPServer"));
    if (v1)
    {
      v2 = (_QWORD *)qword_10001C9C8;
      if (*(int *)(qword_10001C9C8 + 8) >= 1)
      {
        v3 = 0;
        v4 = 0;
        Mutable = 0;
        do
        {
          if ((*(_DWORD *)(*v2 + v3 + 76) & 0x80000000) != 0)
          {
            v6 = (const char *)nullsub_1();
            v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
            if (v7)
            {
              v8 = v7;
              if (!Mutable)
                Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
              CFArrayAppendValue(Mutable, v8);
              CFRelease(v8);
            }
          }
          ++v4;
          v2 = (_QWORD *)qword_10001C9C8;
          v3 += 96;
        }
        while (v4 < *(int *)(qword_10001C9C8 + 8));
        values = Mutable;
        if (Mutable)
        {
          v10 = CFSTR("DisabledInterfaces");
          v9 = CFDictionaryCreate(0, (const void **)&v10, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          SCDynamicStoreAddTemporaryValue((SCDynamicStoreRef)qword_10001D4A0, CFSTR("com.apple.bootpd.DHCPServer"), v9);
          CFRelease(v9);
        }
      }
    }
    result = notify_post("com.apple.bootpd.DHCPDisabledInterfaces");
    dword_10001D4A8 = v1;
  }
  return result;
}

void sub_100004DB4(const __CFDictionary *a1, const void *a2, uint64_t a3, _DWORD *a4)
{
  const __CFString *Value;
  int v7;
  uint64_t v8;

  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      if ((sub_10000C760(Value, a4) & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 136315138;
        v8 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

void sub_100004E6C()
{
  fwrite("usage: bootpd <options>\n<options> are:\n[ -D ]\tbe a DHCP server\n[ -b ] \tbootfile must exist or we don't respond\n[ -d ]\tdebug mode, stay in foreground\n[ -f <filename> ] load bootpd.plist from <filename>\n[ -I ]\tdisable re-initialization on IP address changes\n[ -i <interface> [ -i <interface> ... ] ]\n[ -q ]\tbe quiet as possible\n[ -r <server ip> [ -o <max hops> ] ] relay packets to server, optionally set the hop count (default is 4 hops)\n[ -S ]\tenable BOOTP service\n[ -v ] \tverbose mode, extra information\n", 0x1F9uLL, 1uLL, __stderrp);
  exit(1);
}

void start(int a1, char *const *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  char v8;
  unint64_t v9;
  int i;
  int v11;
  int v12;
  int v13;
  const char *v14;
  uint8_t *p_buf;
  os_log_type_t v16;
  int v17;
  int *v18;
  char *v19;
  NSObject *v20;
  dispatch_time_t v21;
  FILE *v22;
  FILE *v23;
  pid_t v24;
  int *v25;
  char *v26;
  uint32_t v27;
  int *v28;
  char *v29;
  int *v30;
  char *v31;
  int *v32;
  char *v33;
  NSObject *v34;
  NSObject *v35;
  char v36;
  uint8_t v37[4];
  char *v38;
  in_addr v39;
  stat buf;

  v39.s_addr = 0;
  byte_10001C0B0 = 0;
  byte_10001C1C0 = 0;
  sub_1000105C4(qword_10001C9D0);
  sub_100004A3C();
  v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
  if (v4 == -1)
  {
    v36 = 0;
    v5 = 1;
LABEL_35:
    memset(&buf, 0, sizeof(buf));
    if (fstat(0, &buf) < 0)
    {
      v8 = v36;
    }
    else
    {
      HIDWORD(v9) = buf.st_mode & 0xF000;
      LODWORD(v9) = HIDWORD(v9) - 0x2000;
      v8 = v36;
      if ((v9 >> 13) > 4)
      {
        dword_10001C080 = 0;
        gettimeofday((timeval *)&qword_10001CA00, 0);
        if ((byte_10001C9E0 & 1) == 0)
        {
          v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
          dispatch_source_set_event_handler(v20, &stru_100018580);
          v21 = dispatch_time(0, 15000000000);
          dispatch_source_set_timer(v20, v21, 0x37E11D600uLL, 0);
          dispatch_resume(v20);
        }
        goto LABEL_58;
      }
    }
    *(_OWORD *)&buf.st_dev = xmmword_100014CB0;
    if ((v8 & 1) == 0)
    {
      if (fork())
        exit(0);
      for (i = 0; i != 10; ++i)
        close(i);
      open("/", 0);
      dup2(0, 1);
      dup2(0, 2);
      v11 = open("/dev/tty", 2);
      if (v11 >= 1)
      {
        v12 = v11;
        ioctl(v11, 0x20007471uLL, 0);
        close(v12);
      }
    }
    v13 = socket(2, 2, 0);
    dword_10001C080 = v13;
    if (v13 < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        goto LABEL_101;
      *(_WORD *)v37 = 0;
      v14 = "socket call failed";
      goto LABEL_47;
    }
    HIWORD(buf.st_dev) = 17152;
    *(_DWORD *)&buf.st_mode = 0;
    if (bind(v13, (const sockaddr *)&buf, 0x10u) < 0)
    {
      v17 = 10;
      while (1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v18 = __error();
          v19 = strerror(*v18);
          *(_DWORD *)v37 = 136315138;
          v38 = v19;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "bind call failed: %s", v37, 0xCu);
        }
        if (*__error() != 48)
          goto LABEL_101;
        if (!--v17)
          break;
        sleep(0xAu);
        if ((bind(dword_10001C080, (const sockaddr *)&buf, 0x10u) & 0x80000000) == 0)
          goto LABEL_58;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v37 = 0;
        v14 = "exiting";
LABEL_47:
        p_buf = v37;
        v16 = OS_LOG_TYPE_INFO;
LABEL_82:
        v27 = 2;
LABEL_83:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v16, v14, p_buf, v27);
      }
LABEL_101:
      exit(1);
    }
LABEL_58:
    v22 = fopen("/var/run/bootpd.pid", "w");
    if (v22)
    {
      v23 = v22;
      v24 = getpid();
      fprintf(v23, "%d\n", v24);
      fclose(v23);
    }
    if ((v8 & 1) != 0)
      byte_10001CA10 = 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "server starting", (uint8_t *)&buf, 2u);
    }
    *(_DWORD *)v37 = 1;
    if (setsockopt(dword_10001C080, 0, 20, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      v25 = __error();
      v26 = strerror(*v25);
      buf.st_dev = 136315138;
      *(_QWORD *)&buf.st_mode = v26;
      v14 = "setsockopt(IP_RECVIF) failed: %s";
      p_buf = (uint8_t *)&buf;
      v16 = OS_LOG_TYPE_DEFAULT;
      v27 = 12;
      goto LABEL_83;
    }
    if (setsockopt(dword_10001C080, 0xFFFF, 4356, v37, 4u) < 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_RECV_ANYIF) failed", (uint8_t *)&buf, 2u);
    }
    if (setsockopt(dword_10001C080, 0xFFFF, 32, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_BROADCAST) failed";
    }
    else if (setsockopt(dword_10001C080, 0, 7, v37, 4u) < 0)
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(IPPROTO_IP, IP_RECVDSTADDR) failed";
    }
    else
    {
      if ((setsockopt(dword_10001C080, 0xFFFF, 4, v37, 4u) & 0x80000000) == 0)
      {
        *(_DWORD *)v37 = 900;
        if (setsockopt(dword_10001C080, 0xFFFF, 4230, v37, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = __error();
          v29 = strerror(*v28);
          buf.st_dev = 136315138;
          *(_QWORD *)&buf.st_mode = v29;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_TRAFFIC_CLASS) failed, %s", (uint8_t *)&buf, 0xCu);
        }
        *(_DWORD *)v37 = 0;
        if (setsockopt(dword_10001C080, 0xFFFF, 4352, v37, 4u) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v30 = __error();
          v31 = strerror(*v30);
          buf.st_dev = 136315138;
          *(_QWORD *)&buf.st_mode = v31;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setsockopt(SO_DEFUNCTOK) failed, %s", (uint8_t *)&buf, 0xCu);
        }
        *(_DWORD *)v37 = 1;
        if (ioctl(dword_10001C080, 0x8004667EuLL, v37) < 0
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v32 = __error();
          v33 = strerror(*v32);
          buf.st_dev = 136315138;
          *(_QWORD *)&buf.st_mode = v33;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ioctl FIONBIO failed, %s", (uint8_t *)&buf, 0xCu);
        }
        v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, dword_10001C080, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v34, &stru_100018540);
        dispatch_resume(v34);
        v35 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
        dispatch_source_set_event_handler(v35, &stru_1000185C0);
        dispatch_resume(v35);
        signal(1, (void (__cdecl *)(int))1);
        if (v5)
          sub_100008AE8();
        dispatch_main();
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_101;
      LOWORD(buf.st_dev) = 0;
      v14 = "setsockopt(SO_REUSEADDR) failed";
    }
    p_buf = (uint8_t *)&buf;
    v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_82;
  }
  v36 = 0;
  v5 = 1;
  while (1)
  {
    if ((char)v4 <= 79)
    {
      if ((char)v4 != 68)
      {
        if ((char)v4 == 73)
        {
          v5 = 0;
        }
        else if ((char)v4 == 72)
        {
LABEL_77:
          sub_100004E6C();
        }
        goto LABEL_34;
      }
      v6 = dword_10001C9F4 | 2;
    }
    else
    {
      switch((char)v4)
      {
        case 'b':
          byte_10001C9F8 = 1;
          goto LABEL_34;
        case 'c':
        case 'e':
        case 'g':
        case 'j':
        case 'k':
        case 'l':
        case 'm':
        case 'n':
        case 's':
        case 'u':
          goto LABEL_34;
        case 'd':
          v36 = 1;
          goto LABEL_34;
        case 'f':
          off_10001C098 = optarg;
          goto LABEL_34;
        case 'h':
          goto LABEL_77;
        case 'i':
          if (sub_1000049BC(optarg))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              buf.st_dev = 136315138;
              *(_QWORD *)&buf.st_mode = optarg;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "interface %s already specified", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            sub_1000106BC((uint64_t)qword_10001C9D0, (uint64_t)optarg);
          }
          goto LABEL_34;
        case 'o':
          v7 = atoi(optarg);
          if ((v7 - 17) <= 0xFFFFFFEF)
          {
            printf("max hops value %s must be in the range 1..16\n");
            goto LABEL_101;
          }
          dword_10001C0A0 = v7;
          goto LABEL_34;
        case 'p':
          word_10001C084 = strtoul(optarg, 0, 0);
          printf("Priority set to %d\n", (unsigned __int16)word_10001C084);
          goto LABEL_34;
        case 'q':
          dword_10001C0A8 = 1;
          goto LABEL_34;
        case 'r':
          dword_10001C9F4 |= 0x10u;
          if (!inet_aton(optarg, &v39) || v39.s_addr + 1 <= 1)
          {
            printf("Invalid relay server ip address %s\n");
            goto LABEL_101;
          }
          if (sub_10000F834((uint64_t *)qword_10001C9C8, v39.s_addr))
          {
            printf("Relay server ip address %s specifies this host\n");
            goto LABEL_101;
          }
          sub_100005894(v39.s_addr);
          goto LABEL_34;
        case 't':
          off_10001C088 = optarg;
          goto LABEL_34;
        case 'v':
          byte_10001C9FC = 1;
          goto LABEL_34;
        default:
          if ((char)v4 == 80)
          {
            byte_10001C9E0 = 1;
            goto LABEL_34;
          }
          if ((char)v4 != 83)
            goto LABEL_34;
          v6 = dword_10001C9F4 | 1;
          break;
      }
    }
    dword_10001C9F4 = v6;
LABEL_34:
    v4 = getopt(a1, a2, "aBbc:Ddf:hHi:Io:Pp:qr:St:v");
    if (v4 == -1)
      goto LABEL_35;
  }
}

_DWORD *sub_100005894(int a1)
{
  uint64_t v2;
  _DWORD *result;
  uint8_t v4[16];

  if (qword_10001CA38)
  {
    v2 = ++dword_10001CA40;
    result = malloc_type_realloc((void *)qword_10001CA38, 4 * v2, 0x100004052888210uLL);
    qword_10001CA38 = (uint64_t)result;
    if (!result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "realloc failed, exiting", v4, 2u);
      }
      exit(1);
    }
    result[dword_10001CA40 - 1] = a1;
  }
  else
  {
    result = malloc_type_malloc(4uLL, 0x100004052888210uLL);
    qword_10001CA38 = (uint64_t)result;
    *result = a1;
    dword_10001CA40 = 1;
  }
  return result;
}

void sub_100005980(id a1)
{
  ssize_t v1;
  unint64_t v2;
  const char *v3;
  uint32_t v4;
  const char *v5;
  uint8_t *v6;
  os_log_type_t v7;
  uint32_t v8;
  CFPropertyListRef v9;
  CFTypeID TypeID;
  const __CFString *v11;
  int v12;
  const void *v13;
  const void *v14;
  const void *v15;
  const __CFArray *v16;
  CFTypeID v17;
  CFIndex Count;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v21;
  in_addr_t v22;
  in_addr v23;
  char *v24;
  const char *v25;
  uint32_t v26;
  in_addr v27;
  char *v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const __CFArray *Value;
  CFTypeID v33;
  const __CFArray *v34;
  CFTypeID v35;
  const void *v36;
  CFTypeID v37;
  __CFString *Mutable;
  int nscount;
  __CFString *tv_sec;
  int v41;
  uint64_t v42;
  in_addr *p_sin_addr;
  in_addr v44;
  in_addr_t s_addr;
  int v46;
  char *v47;
  __CFString *v48;
  uint64_t v50;
  unsigned int *v51;
  BOOL v52;
  int v53;
  unsigned int *v54;
  in_addr_t *v55;
  _BOOL4 v56;
  const char *v57;
  uint32_t v58;
  in_addr v59;
  char *v60;
  unsigned int *v61;
  unsigned int *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char v67;
  char *v68;
  unsigned __int8 *v69;
  char v70;
  unsigned int v71;
  __CFString *v72;
  int v73;
  int v74;
  _BYTE *v75;
  unsigned int v76;
  int v77;
  char *v78;
  char v79;
  char *v80;
  uint64_t v81;
  NSObject *v82;
  in_addr_t v83;
  BOOL v84;
  __CFString *v85;
  NSObject *v86;
  int v87;
  _WORD *v88;
  const char *v89;
  int v90;
  int v91;
  int v92;
  uint64_t v93;
  in_addr v94;
  char *v95;
  in_addr v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  char *v101;
  __CFString *v102;
  int v103;
  _WORD *v104;
  const char *v105;
  int v106;
  int v107;
  int v108;
  _BOOL4 v109;
  uint64_t v110;
  in_addr v111;
  char *v112;
  const char *v113;
  uint32_t v114;
  int v115;
  in_addr v116;
  char *v117;
  uint64_t v118;
  void *v119;
  in_addr v120;
  void *v121;
  in_addr v122;
  char *v123;
  int v124;
  unint64_t v125;
  int v126;
  uint64_t v127;
  void *__src;
  uint64_t v129;
  _QWORD *v130;
  unsigned int *v131;
  uint64_t *v132;
  _QWORD v133[2];
  uint8_t v134[12];
  in_addr v135;
  void *v136;
  void *v137;
  __int128 v138;
  uint8_t buf[32];
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  timeval __dst[19];

  v138 = xmmword_100014CB0;
  qword_10001D258 = (uint64_t)&qword_10001D278;
  dword_10001D260 = 1;
  qword_10001D268 = (uint64_t)&unk_10001D288;
  qword_10001D270 = 512;
  qword_10001D278 = (uint64_t)&byte_10001CA48;
  unk_10001D280 = 2048;
  qword_10001D248 = (uint64_t)&v138;
  dword_10001D250 = 16;
  v1 = recvmsg(dword_10001C080, (msghdr *)&qword_10001D248, 0);
  if (v1 < 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      return;
    *(_DWORD *)buf = 6291714;
    v5 = "recvmsg failed, %m";
    v6 = buf;
    v7 = OS_LOG_TYPE_DEBUG;
    v8 = 4;
    goto LABEL_8;
  }
  v2 = v1;
  if ((byte_10001CA44 & 1) == 0)
  {
    sub_100008C48(0);
    if (gethostname(&byte_10001C0B3, 0x100uLL))
    {
      byte_10001C0B3 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 6291714;
        v3 = "gethostname() failed, %m";
        v4 = 4;
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v3, buf, v4);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = &byte_10001C0B3;
      v3 = "server name %s";
      v4 = 12;
      goto LABEL_11;
    }
    sub_100004A3C();
    sub_100004798();
    sub_100004AC4();
    sub_100004C3C(0);
    v9 = sub_10000C2EC(off_10001C098);
    if (v9)
    {
      TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v9) != TypeID)
      {
        CFRelease(v9);
        v9 = 0;
      }
    }
    LODWORD(v127) = 0;
    dword_10001C9F0 = dword_10001C9F4;
    byte_10001C1C0 = byte_10001C9FC;
    byte_10001C0B0 = byte_10001CA10;
    if (!v9)
    {
      dword_10001CA34 = 0;
LABEL_50:
      if (qword_10001D488)
      {
        free((void *)qword_10001D488);
        qword_10001D488 = 0;
      }
      if (qword_10001D490)
      {
        free((void *)qword_10001D490);
        qword_10001D490 = 0;
      }
      dword_10001D498 = 0;
      dword_10001D49C = 0;
      if (v9)
      {
        Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("allow"));
        v33 = CFArrayGetTypeID();
        if (Value && CFGetTypeID(Value) == v33 && CFArrayGetCount(Value) >= 1)
          qword_10001D488 = (uint64_t)sub_1000088F0(Value, &dword_10001D498);
        v34 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("deny"));
        v35 = CFArrayGetTypeID();
        if (v34 && CFGetTypeID(v34) == v35 && CFArrayGetCount(v34) >= 1)
          qword_10001D490 = (uint64_t)sub_1000088F0(v34, &dword_10001D49C);
      }
      dword_10001C0AC = 0;
      sub_100004DB4((const __CFDictionary *)v9, CFSTR("reply_threshold_seconds"), (uint64_t)"reply_threshold_seconds", &dword_10001C0AC);
      byte_10001C0B1 = 0;
      LODWORD(v127) = 0;
      sub_100004DB4((const __CFDictionary *)v9, CFSTR("dhcp_ignore_client_identifier"), (uint64_t)"dhcp_ignore_client_identifier", &v127);
      if ((_DWORD)v127)
        byte_10001C0B1 = 1;
      byte_10001C0B2 = 0;
      LODWORD(v127) = 0;
      sub_100004DB4((const __CFDictionary *)v9, CFSTR("dhcp_supply_bootfile"), (uint64_t)"dhcp_supply_bootfile", &v127);
      if ((_DWORD)v127)
      {
        byte_10001C0B2 = 1;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "dhcp_supply_bootfile";
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s is enabled", buf, 0xCu);
        }
      }
      dword_10001C0A4 = sub_10000868C((const __CFDictionary *)v9, CFSTR("use_server_config_for_dhcp_options"), (uint64_t)"use_server_config_for_dhcp_options", 1);
      SubnetListFree((uint64_t **)&qword_10001C1B8);
      if (v9)
      {
        v36 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("Subnets"));
        v37 = CFArrayGetTypeID();
        if (v36)
        {
          if (CFGetTypeID(v36) == v37)
          {
            qword_10001C1B8 = (uint64_t)SubnetListCreateWithArray(v36);
            if (qword_10001C1B8)
            {
              if (byte_10001C1C0)
              {
                Mutable = CFStringCreateMutable(0, 0);
                SubnetListPrintCFString(Mutable, qword_10001C1B8);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = Mutable;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }
                CFRelease(Mutable);
              }
            }
          }
        }
        sub_100009804();
        CFRelease(v9);
      }
      else
      {
        sub_100009804();
      }
      res_9_init();
      qword_10001CA20 = 0;
      if (qword_10001CA18)
      {
        free((void *)qword_10001CA18);
        qword_10001CA18 = 0;
      }
      if (qword_10001CA28)
      {
        free((void *)qword_10001CA28);
        qword_10001CA28 = 0;
      }
      dword_10001CA30 = 0;
      dword_10001CA14 = 0;
      nscount = _res.nscount;
      if (nscount)
      {
        __dst[0].tv_sec = 0;
        if (byte_10001C0B0)
        {
          tv_sec = CFStringCreateMutable(0, 0);
          __dst[0].tv_sec = (__darwin_time_t)tv_sec;
          nscount = _res.nscount;
        }
        else
        {
          tv_sec = 0;
        }
        qword_10001CA18 = (uint64_t)malloc_type_malloc(4 * nscount, 0x100004052888210uLL);
        v41 = _res.nscount;
        if (v41 >= 1)
        {
          v42 = 0;
          p_sin_addr = &_res.nsaddr_list[0].sin_addr;
          do
          {
            s_addr = p_sin_addr->s_addr;
            p_sin_addr += 4;
            v44.s_addr = s_addr;
            if (s_addr + 1 >= 2 && LOBYTE(v44.s_addr) != 127)
            {
              v46 = dword_10001CA14;
              *(in_addr *)(qword_10001CA18 + 4 * dword_10001CA14) = v44;
              if (tv_sec)
              {
                v47 = inet_ntoa(v44);
                CFStringAppendFormat(tv_sec, 0, CFSTR(" %s"), v47);
                v46 = dword_10001CA14;
                v41 = _res.nscount;
              }
              dword_10001CA14 = v46 + 1;
            }
            ++v42;
          }
          while (v42 < v41);
        }
        if (!dword_10001CA14)
        {
          free((void *)qword_10001CA18);
          qword_10001CA18 = 0;
          sub_10000C2BC((const void **)__dst);
          tv_sec = (__CFString *)__dst[0].tv_sec;
        }
        if (tv_sec)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = tv_sec;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS servers: %@", buf, 0xCu);
            tv_sec = (__CFString *)__dst[0].tv_sec;
          }
          CFRelease(tv_sec);
        }
        if (dword_10001CA14)
        {
          __dst[0].tv_sec = 0;
          if (byte_10001C0B0)
          {
            v48 = CFStringCreateMutable(0, 0);
            __dst[0].tv_sec = (__darwin_time_t)v48;
          }
          else
          {
            v48 = 0;
          }
          if (_res.defdname[0])
          {
            if (*(_DWORD *)_res.defdname != 1633906540 || *(_WORD *)&_res.defdname[4] != 108)
            {
              qword_10001CA20 = (uint64_t)_res.defdname;
              if (byte_10001C0B0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = _res.defdname;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS domain: %s", buf, 0xCu);
                }
              }
            }
          }
          v50 = 0;
          while (_res.dnsrch[v50])
          {
            if (v48)
              CFStringAppendFormat(v48, 0, CFSTR(" %s"), _res.dnsrch[v50]);
            if (++v50 == 6)
              goto LABEL_119;
          }
          if ((_DWORD)v50)
          {
LABEL_119:
            qword_10001CA28 = (uint64_t)sub_10000D994((uint64_t)_res.dnsrch, v50, 0, &dword_10001CA30, 1);
            if (!v48)
              goto LABEL_123;
            goto LABEL_120;
          }
          sub_10000C2BC((const void **)__dst);
          v48 = (__CFString *)__dst[0].tv_sec;
          if (!__dst[0].tv_sec)
            goto LABEL_123;
LABEL_120:
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v48;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "DNS search: %@", buf, 0xCu);
            v48 = (__CFString *)__dst[0].tv_sec;
          }
          CFRelease(v48);
        }
      }
LABEL_123:
      byte_10001CA44 = 1;
      goto LABEL_124;
    }
    v11 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("ipv6_only_wait"));
    LODWORD(__dst[0].tv_sec) = 0;
    if (v11)
    {
      if ((sub_10000C760(v11, __dst) & 1) != 0)
      {
        v12 = (LODWORD(__dst[0].tv_sec) != 0) << 24;
LABEL_23:
        dword_10001CA34 = v12;
        if (sub_10000868C((const __CFDictionary *)v9, CFSTR("verbose"), (uint64_t)"verbose", 0))
          byte_10001C1C0 = 1;
        if (sub_10000868C((const __CFDictionary *)v9, CFSTR("debug"), (uint64_t)"debug", 0))
          byte_10001C0B0 = 1;
        v13 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("bootp_enabled"));
        sub_10000875C((uint64_t)v13, 1);
        v14 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("dhcp_enabled"));
        sub_10000875C((uint64_t)v14, 2);
        v15 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("relay_enabled"));
        sub_10000875C((uint64_t)v15, 16);
        v16 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("relay_ip_list"));
        v17 = CFArrayGetTypeID();
        if (v16 && CFGetTypeID(v16) == v17)
        {
          Count = CFArrayGetCount(v16);
          if (qword_10001CA38)
          {
            free((void *)qword_10001CA38);
            qword_10001CA38 = 0;
            dword_10001CA40 = 0;
          }
          if (Count >= 1)
          {
            for (i = 0; Count != i; ++i)
            {
              LODWORD(__dst[0].tv_sec) = 0;
              ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, i);
              v21 = CFStringGetTypeID();
              if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v21)
                continue;
              if ((sub_10000C614(ValueAtIndex, (in_addr *)__dst) & 1) != 0)
              {
                v22 = __dst[0].tv_sec;
                if ((LODWORD(__dst[0].tv_sec) + 1) > 1)
                {
                  if (!sub_10000F834((uint64_t *)qword_10001C9C8, __dst[0].tv_sec))
                  {
                    sub_100005894(__dst[0].tv_sec);
                    continue;
                  }
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                  {
                    v27.s_addr = __dst[0].tv_sec;
                    v28 = inet_ntoa(v27);
                    *(_DWORD *)buf = 136315138;
                    *(_QWORD *)&buf[4] = v28;
                    v25 = "Relay server ip address %s specifies this host";
LABEL_44:
                    v26 = 12;
LABEL_45:
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, buf, v26);
                  }
                }
                else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v23.s_addr = v22;
                  v24 = inet_ntoa(v23);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v24;
                  v25 = "Invalid relay server ip address %s";
                  goto LABEL_44;
                }
              }
              else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v25 = "Invalid relay server ip address";
                v26 = 2;
                goto LABEL_45;
              }
            }
          }
        }
        v29 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("ignore_allow_deny"));
        sub_10000875C((uint64_t)v29, 32);
        v30 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("detect_other_dhcp_server"));
        sub_10000875C((uint64_t)v30, 64);
        v31 = CFDictionaryGetValue((CFDictionaryRef)v9, CFSTR("ipv6_only_preferred"));
        sub_10000875C((uint64_t)v31, 128);
        goto LABEL_50;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "ipv6_only_wait";
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", buf, 0xCu);
      }
    }
    v12 = 0;
    goto LABEL_23;
  }
LABEL_124:
  if (v2 >= 0xEC && byte_10001CA4A <= 0x10u)
  {
    *(_DWORD *)buf = 0;
    v51 = sub_100008A74(7, buf);
    if (v51)
      v52 = *(_DWORD *)buf == 4;
    else
      v52 = 0;
    v53 = !v52;
    if (v52)
      v54 = v51;
    else
      v54 = 0;
    if (byte_10001C0B0)
    {
      v55 = v51;
      v56 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
      if (v53)
      {
        if (v56)
        {
          *(_WORD *)buf = 0;
          v57 = "no destination address";
          v58 = 2;
LABEL_141:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v57, buf, v58);
        }
      }
      else if (v56)
      {
        v59.s_addr = *v55;
        v60 = inet_ntoa(v59);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v60;
        v57 = "destination address %s";
        v58 = 12;
        goto LABEL_141;
      }
    }
    LODWORD(v127) = 0;
    v61 = sub_100008A74(20, &v127);
    if (!v61)
      return;
    if (!(_DWORD)v127)
      return;
    v62 = v61;
    v63 = *((unsigned __int8 *)v61 + 5);
    if (v63 > 0x10)
      return;
    __memmove_chk(buf, v61 + 2, v63, 17);
    buf[*((unsigned __int8 *)v62 + 5)] = 0;
    v64 = sub_10000F8F4((uint64_t *)qword_10001C9C8, (char *)buf);
    if (v64)
    {
      v65 = v64;
      if (sub_100010260(v64))
      {
        if ((int)sub_1000105F8((uint64_t)qword_10001C9D0) < 1 || sub_1000049BC((const char *)buf))
        {
          v66 = *(_DWORD *)(v65 + 76);
          if ((v66 & 0x80000000) == 0)
          {
            v67 = v66 | dword_10001C9F0;
            if ((v67 & 0x1F) != 0)
            {
              if (byte_10001CA4A == 6 && (v67 & 0x20) == 0)
              {
                if (qword_10001D490
                  && bsearch(&unk_10001CA64, (const void *)qword_10001D490, dword_10001D49C, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010D20))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                    return;
                  v68 = ether_ntoa((const ether_addr *)&unk_10001CA64);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v68;
                  v5 = "%s is in deny list, ignoring";
LABEL_237:
                  v6 = buf;
                  goto LABEL_173;
                }
                if (qword_10001D488
                  && !bsearch(&unk_10001CA64, (const void *)qword_10001D488, dword_10001D498, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010D20))
                {
                  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                    return;
                  v101 = ether_ntoa((const ether_addr *)&unk_10001CA64);
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v101;
                  v5 = "%s is not in the allow list, ignoring";
                  goto LABEL_237;
                }
              }
              gettimeofday((timeval *)&qword_10001CA00, 0);
              if (byte_10001CA48 != 1)
                goto LABEL_200;
              v133[0] = 0;
              v133[1] = 0;
              v130 = 0;
              v127 = v65;
              __src = &byte_10001CA48;
              v129 = v2;
              v131 = v54;
              v132 = &qword_10001CA00;
              sub_10000CEAC(v133);
              if (sub_10000D05C(v133, (uint64_t)&byte_10001CA48, v2, 0)
                && (v130 = v133, *(_DWORD *)buf = 0, (v69 = sub_10000CFB0((uint64_t)v133, 53, buf, 0)) != 0))
              {
                v70 = 0;
                v71 = *v69;
              }
              else
              {
                v71 = 0;
                v70 = 1;
              }
              if (byte_10001C1C0)
              {
                v72 = CFStringCreateMutable(0, 0);
                sub_10000D59C(v72, (unsigned __int8 *)&byte_10001CA48, v2);
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)&buf[4] = v72;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "---- Client Request ----\n%@", buf, 0xCu);
                }
                CFRelease(v72);
              }
              if (!byte_10001CA74 || !strcmp(&byte_10001CA74, &byte_10001C0B3))
              {
                v73 = dword_10001CA5C;
                if (!dword_10001CA5C || v73 == sub_10001021C(v65))
                {
                  v74 = *(_DWORD *)(v65 + 76);
                  if ((v70 & 1) != 0 || v74 < 0 || ((v74 | dword_10001C9F0) & 2) == 0)
                  {
                    if (((v74 | dword_10001C9F0) & 1) == 0)
                      goto LABEL_199;
                    v136 = 0;
                    v137 = 0;
                    if (v129 < 0x12C)
                      goto LABEL_199;
                    v75 = __src;
                    v135.s_addr = 0;
                    v76 = bswap32(*((unsigned __int16 *)__src + 4));
                    v77 = dword_10001C0AC;
                    if (dword_10001C0AC > HIWORD(v76))
                    {
                      if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 67109376;
                        *(_DWORD *)&buf[4] = HIWORD(v76);
                        *(_WORD *)&buf[8] = 1024;
                        *(_DWORD *)&buf[10] = v77;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "rq->bp_secs %d < threshold %d", buf, 0xEu);
                      }
                      goto LABEL_199;
                    }
                    memcpy(__dst, __src, 0x12CuLL);
                    LOBYTE(__dst[0].tv_sec) = 2;
                    v115 = *((_DWORD *)__src + 3);
                    if (v115)
                    {
                      v135.s_addr = *((_DWORD *)__src + 3);
                      if (!sub_100009480(v115, (char **)&v136, (char **)&v137))
                        goto LABEL_199;
                    }
                    else
                    {
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = v127;
                      *(_QWORD *)&buf[16] = 0;
                      *(_DWORD *)buf = *((_DWORD *)__src + 6);
                      if (!sub_10000939C(*((unsigned __int8 *)__src + 1), (char *)__src + 28, *((unsigned __int8 *)__src + 2), (unsigned int (*)(uint64_t, _QWORD))sub_100007A08, (uint64_t)buf, &v135, (char **)&v136, (char **)&v137))goto LABEL_199;
                      LODWORD(__dst[1].tv_sec) = v135;
                    }
                    v75[235] = 0;
                    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                    {
                      v118 = nullsub_1(v127);
                      v119 = v136;
                      if (!v136)
                      {
                        v120.s_addr = v135.s_addr;
                        v119 = inet_ntoa(v120);
                      }
                      *(_DWORD *)buf = 136315650;
                      *(_QWORD *)&buf[4] = v118;
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = v119;
                      *(_WORD *)&buf[22] = 2080;
                      *(_QWORD *)&buf[24] = v75 + 108;
                      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "BOOTP request [%s]: %s requested file '%s'", buf, 0x20u);
                    }
                    if (sub_100007408(v75 + 108, (uint64_t)v136, v137, (char *)&__dst[6].tv_usec + 4, 128))
                    {
                      if (*((_DWORD *)v75 + 59) == 1666417251)
                      {
                        v155 = 0u;
                        v156 = 0u;
                        v153 = 0u;
                        v154 = 0u;
                        v151 = 0u;
                        v152 = 0u;
                        v149 = 0u;
                        v150 = 0u;
                        v147 = 0u;
                        v148 = 0u;
                        v145 = 0u;
                        v146 = 0u;
                        v143 = 0u;
                        v144 = 0u;
                        v141 = 0u;
                        v142 = 0u;
                        v140 = 0u;
                        memset(buf, 0, sizeof(buf));
                        sub_10000D32C((uint64_t)buf, &__dst[15], 60);
                        sub_100007DBC((char *)v136, v135.s_addr, v127, (uint64_t *)buf, 0, 0);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)v134 = 0;
                          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "added vendor extensions", v134, 2u);
                        }
                        if (sub_10000D334((uint64_t)buf, 255, 0, 0))
                        {
                          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)v134 = 0;
                            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "couldn't add end tag", v134, 2u);
                          }
                        }
                        else
                        {
                          *(&__dst[14].tv_usec + 1) = 1666417251;
                        }
                      }
                      HIDWORD(__dst[1].tv_sec) = sub_10001021C(v127);
                      __strlcpy_chk(&__dst[2].tv_usec + 1, &byte_10001C0B3, 64, 64);
                      if (sub_100007A58(v127, (uint64_t)__dst, 0x12Cu, 0, 0)
                        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                      {
                        v121 = v136;
                        v122.s_addr = v135.s_addr;
                        v123 = inet_ntoa(v122);
                        *(_DWORD *)buf = 136315650;
                        *(_QWORD *)&buf[4] = v121;
                        *(_WORD *)&buf[12] = 2080;
                        *(_QWORD *)&buf[14] = v123;
                        *(_WORD *)&buf[22] = 1024;
                        *(_DWORD *)&buf[24] = 300;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "reply sent %s %s pktsize %d", buf, 0x1Cu);
                      }
                    }
                    if (v136)
                      free(v136);
                    if (v137)
                      free(v137);
                    goto LABEL_199;
                  }
                  sub_100009EBC(&v127, v71, 1);
                }
              }
LABEL_199:
              sub_10000CEB0((uint64_t)v133);
LABEL_200:
              v78 = aPrivateTftpboo;
              if (qword_10001CA38
                && v2 >= 0x12C
                && ((*(_DWORD *)(v65 + 76) | dword_10001C9F0) & 0x10) != 0)
              {
                if (byte_10001CA48 != 2)
                {
                  if (byte_10001CA48 == 1)
                  {
                    v79 = byte_10001CA4B;
                    if (dword_10001C0A0 > byte_10001CA4B
                      && dword_10001C0AC <= bswap32((unsigned __int16)word_10001CA50) >> 16)
                    {
                      v124 = dword_10001CA60;
                      if (!dword_10001CA60)
                      {
                        dword_10001CA60 = sub_10001021C(v65);
                        v79 = byte_10001CA4B;
                      }
                      byte_10001CA4B = v79 + 1;
                      v80 = aPrivateTftpboo;
                      if (dword_10001CA40 >= 1)
                      {
                        v81 = 0;
                        v126 = 0;
                        v82 = &_os_log_default;
                        v125 = v2;
                        do
                        {
                          v83 = *(_DWORD *)(*((_QWORD *)v78 + 327) + 4 * v81);
                          if (v83 != sub_100010240(v65))
                          {
                            if (byte_10001C1C0)
                              v84 = v126 == 0;
                            else
                              v84 = 0;
                            if (v84)
                            {
                              v85 = CFStringCreateMutable(0, 0);
                              sub_10000D59C(v85, (unsigned __int8 *)&byte_10001CA48, v2);
                              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                              {
                                *(_DWORD *)buf = 138412290;
                                *(_QWORD *)&buf[4] = v85;
                                _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "==== Relayed Request ====\n%@", buf, 0xCu);
                              }
                              CFRelease(v85);
                              v126 = 1;
                            }
                            v86 = v82;
                            v87 = dword_10001C080;
                            v88 = off_10001C090;
                            v89 = (const char *)nullsub_1(v65);
                            v90 = byte_10001CA49;
                            v91 = sub_10001021C(v65);
                            v92 = sub_100013E14(v87, v88, v89, v90, 0, v83, v91, 0x43u, 0x44u, &byte_10001CA48, v2);
                            v82 = v86;
                            if (v92 < 0)
                            {
                              v80 = aPrivateTftpboo;
                              if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                              {
                                v96.s_addr = v83;
                                v97 = inet_ntoa(v96);
                                *(_DWORD *)buf = 136315394;
                                *(_QWORD *)&buf[4] = v97;
                                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "send to %s failed, %m", buf, 0xEu);
                              }
                              v2 = v125;
                              v78 = aPrivateTftpboo;
                            }
                            else
                            {
                              if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
                              {
                                v93 = nullsub_1(v65);
                                v94.s_addr = v83;
                                v95 = inet_ntoa(v94);
                                *(_DWORD *)buf = 136315394;
                                *(_QWORD *)&buf[4] = v93;
                                *(_WORD *)&buf[12] = 2080;
                                *(_QWORD *)&buf[14] = v95;
                                _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "Relayed Request [%s] to %s", buf, 0x16u);
                              }
                              v2 = v125;
                              v78 = aPrivateTftpboo;
                              v80 = aPrivateTftpboo;
                            }
                          }
                          ++v81;
                        }
                        while (v81 < *((int *)v80 + 656));
                      }
                      if (!v124)
                        dword_10001CA60 = 0;
                      --byte_10001CA4B;
                    }
                  }
                  goto LABEL_254;
                }
                if (dword_10001CA60)
                {
                  v98 = sub_10000F834((uint64_t *)qword_10001C9C8, dword_10001CA60);
                  if (v98)
                  {
                    v99 = v98;
                    if ((word_10001CA52 & 0x80) != 0)
                    {
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying using broadcast IP address", buf, 2u);
                      }
                      v100 = -1;
                    }
                    else
                    {
                      v100 = dword_10001CA58;
                    }
                    if (byte_10001C1C0)
                    {
                      v102 = CFStringCreateMutable(0, 0);
                      sub_10000D59C(v102, (unsigned __int8 *)&byte_10001CA48, v2);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        *(_QWORD *)&buf[4] = v102;
                        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "==== Relayed Reply ====\n%@", buf, 0xCu);
                      }
                      CFRelease(v102);
                    }
                    v103 = dword_10001C080;
                    v104 = off_10001C090;
                    v105 = (const char *)nullsub_1(v99);
                    v106 = byte_10001CA49;
                    v107 = sub_10001021C(v99);
                    v108 = sub_100013E14(v103, v104, v105, v106, (uint64_t)&unk_10001CA64, v100, v107, 0x44u, 0x43u, &byte_10001CA48, v2);
                    v109 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
                    if (v108 < 0)
                    {
                      if (!v109)
                        goto LABEL_254;
                      v116.s_addr = v100;
                      v117 = inet_ntoa(v116);
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = v117;
                      v113 = "send %s failed, %m";
                      v114 = 14;
                    }
                    else
                    {
                      if (!v109)
                        goto LABEL_254;
                      v110 = nullsub_1(v99);
                      v111.s_addr = v100;
                      v112 = inet_ntoa(v111);
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = v110;
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = v112;
                      v113 = "Relayed Response [%s] to %s";
                      v114 = 22;
                    }
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v113, buf, v114);
                  }
                }
              }
LABEL_254:
              if (!byte_10001C1C0)
                return;
              *(_QWORD *)&__dst[0].tv_usec = 0;
              __dst[0].tv_sec = 0;
              v127 = 0;
              __src = 0;
              gettimeofday(__dst, 0);
              sub_100010A48(__dst[0].tv_sec, __dst[0].tv_usec, qword_10001CA00, *(int *)algn_10001CA08, (uint64_t)&v127);
              if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                return;
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v127;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = (_DWORD)__src;
              v5 = "service time %lu.%06d seconds";
              v6 = buf;
              v7 = OS_LOG_TYPE_INFO;
              v8 = 18;
LABEL_8:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v7, v5, v6, v8);
              return;
            }
          }
          if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            return;
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          v5 = "ignoring request on %s (no services enabled)";
        }
        else
        {
          if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            return;
          LODWORD(__dst[0].tv_sec) = 136315138;
          *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
          v5 = "ignoring request on %s";
        }
      }
      else
      {
        if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          return;
        LODWORD(__dst[0].tv_sec) = 136315138;
        *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
        v5 = "ignoring request on %s (no IP address)";
      }
    }
    else
    {
      if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        return;
      LODWORD(__dst[0].tv_sec) = 136315138;
      *(__darwin_time_t *)((char *)&__dst[0].tv_sec + 4) = (__darwin_time_t)buf;
      v5 = "unknown interface %s";
    }
    v6 = (uint8_t *)__dst;
LABEL_173:
    v7 = OS_LOG_TYPE_DEBUG;
    v8 = 12;
    goto LABEL_8;
  }
}

BOOL sub_100007408(_BYTE *a1, uint64_t a2, _BYTE *a3, char *a4, int a5)
{
  _BYTE *v8;
  const char *v9;
  uint8_t *v10;
  uint32_t v11;
  int v12;
  int v13;
  _BOOL4 v14;
  _BOOL8 result;
  int v16;
  _BYTE v17[10];
  char __s[1024];
  unsigned __int8 v19[1032];

  if (!a1 || (v8 = a1, !*a1))
  {
    if (!a3 || (v8 = a3, !*a3))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        v9 = "no replyfile";
        v10 = v19;
        v11 = 2;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v9, v10, v11);
      }
      return 1;
    }
  }
  __strlcpy_chk(v19, v8, 1024, 1024);
  if (v19[0] == 47)
  {
    __strlcpy_chk(__s, v19, 1024, 1024);
    if (!a2)
      goto LABEL_13;
  }
  else
  {
    __strlcpy_chk(__s, aPrivateTftpboo, 1024, 1024);
    __strlcat_chk(__s, "/", 1024, 1024);
    __strlcat_chk(__s, v19, 1024, 1024);
    if (!a2)
      goto LABEL_13;
  }
  v12 = strlen(__s);
  __strlcat_chk(__s, ".", 1024, 1024);
  __strlcat_chk(__s, a2, 1024, 1024);
  if ((access(__s, 4) & 0x80000000) == 0)
    goto LABEL_14;
  __s[v12] = 0;
LABEL_13:
  if ((access(__s, 4) & 0x80000000) == 0)
    goto LABEL_14;
  if (byte_10001C9F8 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v16 = 136315138;
      *(_QWORD *)v17 = __s;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "boot file %s* missing", (uint8_t *)&v16, 0xCu);
    }
LABEL_14:
    v13 = strlen(__s);
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v13 < a5)
    {
      if (v14)
      {
        v16 = 136315138;
        *(_QWORD *)v17 = __s;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replyfile %s", (uint8_t *)&v16, 0xCu);
      }
      strlcpy(a4, __s, a5);
      return 1;
    }
    if (v14)
    {
      v16 = 67109376;
      *(_DWORD *)v17 = v13;
      *(_WORD *)&v17[4] = 1024;
      *(_DWORD *)&v17[6] = a5;
      v9 = "boot file name too long %d >= %d";
      v10 = (uint8_t *)&v16;
      v11 = 14;
      goto LABEL_20;
    }
    return 1;
  }
  result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (result)
  {
    v16 = 136315138;
    *(_QWORD *)v17 = __s;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "boot file %s* missing - not replying", (uint8_t *)&v16, 0xCu);
    return 0;
  }
  return result;
}

BOOL sub_100007728(int a1, int a2, uint64_t a3)
{
  _BOOL8 result;
  int v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  const char *v10;
  uint32_t v11;
  int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  uint64_t v16;
  in_addr v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  _BYTE v26[10];
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;

  if (a2)
  {
    if (qword_10001C1B8)
      return SubnetListAreAddressesOnSameSupernet(qword_10001C1B8, a1, a2);
    return 0;
  }
  v5 = HIBYTE(a1);
  v6 = BYTE2(a1);
  v7 = BYTE1(a1);
  v8 = a1;
  v9 = a1 & 0xFF000000 | (BYTE2(a1) << 16) | (BYTE1(a1) << 8) | a1;
  if (sub_100010280(a3, v9) != -1)
  {
    if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      return 1;
    v23 = 136316162;
    v24 = nullsub_1(a3);
    v25 = 1024;
    *(_DWORD *)v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    v27 = 1024;
    v28 = v6;
    v29 = 1024;
    v30 = v5;
    v10 = "%s: %d.%d.%d.%d on subnet";
    v11 = 36;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v23, v11);
    return 1;
  }
  v12 = sub_10001030C(a3);
  v13 = *(unsigned int *)qword_10001C9E8;
  if ((int)v13 >= 1)
  {
    v14 = *(unsigned __int8 **)(qword_10001C9E8 + 8);
    while (1)
    {
      if (v14[9] == 18 && v12 == *((unsigned __int16 *)v14 + 5))
      {
        v15 = *((_DWORD *)v14 + 1);
        if (v15)
        {
          if ((v15 & v9) == *(_DWORD *)v14)
            break;
        }
      }
      v14 += 28;
      if (!--v13)
        goto LABEL_17;
    }
    if (!byte_10001C1C0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      return 1;
    v18 = nullsub_1(a3);
    v19 = *v14;
    v20 = v14[1];
    v21 = v14[2];
    v22 = v14[3];
    v23 = 136317186;
    v24 = v18;
    v25 = 1024;
    *(_DWORD *)v26 = v8;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = v7;
    v27 = 1024;
    v28 = v6;
    v29 = 1024;
    v30 = v5;
    v31 = 1024;
    v32 = v19;
    v33 = 1024;
    v34 = v20;
    v35 = 1024;
    v36 = v21;
    v37 = 1024;
    v38 = v22;
    v10 = "%s: %d.%d.%d.%d on subnet route %d.%d.%d.%d";
    v11 = 60;
    goto LABEL_8;
  }
LABEL_17:
  if (byte_10001C1C0)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    v16 = nullsub_1(a3);
    v17.s_addr = v9;
    v23 = 136315394;
    v24 = v16;
    v25 = 2080;
    *(_QWORD *)v26 = inet_ntoa(v17);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: ip %s not reachable", (uint8_t *)&v23, 0x16u);
  }
  return 0;
}

BOOL sub_100007A08(uint64_t a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  v2 = 1;
  *(_DWORD *)(a1 + 16) = 1;
  if (*(_DWORD *)(a1 + 4) != a2)
    return sub_100007728(a2, *(_DWORD *)a1, *(_QWORD *)(a1 + 8));
  return v2;
}

BOOL sub_100007A58(uint64_t a1, uint64_t a2, unsigned int a3, int a4, in_addr_t *a5)
{
  in_addr_t v7;
  in_addr v8;
  uint64_t v9;
  unsigned int v10;
  unsigned __int16 v11;
  in_addr v13;
  in_addr_t *v14;
  in_addr v15;
  char *v16;
  int v17;
  _WORD *v18;
  const char *v19;
  int v20;
  int v21;
  __CFString *Mutable;
  _BOOL8 result;
  uint8_t buf[4];
  char *v26;

  v7 = *(_DWORD *)(a2 + 12);
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v8.s_addr = v7;
      *(_DWORD *)buf = 136315138;
      v26 = inet_ntoa(v8);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reply ciaddr %s", buf, 0xCu);
    }
    v9 = 0;
LABEL_5:
    v10 = 68;
    v11 = 67;
    goto LABEL_23;
  }
  v7 = *(_DWORD *)(a2 + 24);
  if (!v7)
  {
    if (a4 || (*(_WORD *)(a2 + 10) & 0x80) != 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying using broadcast IP address", buf, 2u);
      }
      v9 = 0;
      v7 = -1;
    }
    else
    {
      v14 = (in_addr_t *)(a2 + 16);
      if (a5)
        v14 = a5;
      v7 = *v14;
      v9 = a2 + 28;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      v15.s_addr = v7;
      v16 = inet_ntoa(v15);
      *(_DWORD *)buf = 136315138;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "replying to %s", buf, 0xCu);
    }
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v13.s_addr = v7;
    *(_DWORD *)buf = 136315138;
    v26 = inet_ntoa(v13);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "reply giaddr %s", buf, 0xCu);
  }
  if (a4)
  {
    v9 = 0;
    *(_WORD *)(a2 + 10) |= 0x8000u;
  }
  else
  {
    v9 = 0;
  }
  v10 = 67;
  v11 = 68;
LABEL_23:
  v17 = dword_10001C080;
  v18 = off_10001C090;
  v19 = (const char *)nullsub_1(a1);
  v20 = sub_1000102F0(a1);
  v21 = sub_10001021C(a1);
  if ((sub_100013E14(v17, v18, v19, v20, v9, v7, v21, v10, v11, (void *)a2, a3) & 0x80000000) != 0)
  {
    result = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 6291714;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "transmit failed, %m", buf, 4u);
      return 0;
    }
  }
  else
  {
    if (byte_10001C1C0)
    {
      Mutable = CFStringCreateMutable(0, 0);
      sub_10000D59C(Mutable, (unsigned __int8 *)a2, a3);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (char *)Mutable;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "==== Server Reply ====\n%@", buf, 0xCu);
      }
      CFRelease(Mutable);
    }
    return 1;
  }
  return result;
}

uint64_t sub_100007DBC(char *a1, unsigned int a2, uint64_t a3, uint64_t *a4, _BYTE *a5, unsigned int a6)
{
  uint64_t SubnetForAddress;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  int v15;
  int v16;
  const char *v17;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  uint32_t v21;
  void *OptionPtrAndLength;
  BOOL v23;
  const char *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  int v29;
  const char *v30;
  uint64_t v31;
  unsigned int v32;
  const char *v33;
  NSObject *v34;
  const char *v35;
  int v36;
  int v37;
  const char *v38;
  const char *v39;
  int v40;
  const char *v41;
  _DWORD *v42;
  const char *v43;
  NSObject *v44;
  const char *v45;
  in_addr v46;
  char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v51;
  _DWORD *__src;
  int v54;
  int v56;
  int v57;
  uint8_t buf[4];
  _BYTE v59[18];

  v54 = sub_10000D574((uint64_t)a4);
  if (qword_10001C1B8)
  {
    SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, a2, 1);
    if (!SubnetForAddress)
      SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, a2, 0);
  }
  else
  {
    SubnetForAddress = 0;
  }
  if (a5)
    v11 = a6;
  else
    v11 = 5;
  if (!a5)
    a5 = &unk_100014CAA;
  if ((int)v11 >= 1)
  {
    __src = 0;
    v12 = 0;
    v56 = 0;
    v13 = &_os_log_default;
    v14 = "couldn't add hostname: %s";
    while (1)
    {
      v15 = *a5;
      if ((v15 - 50) >= 0xA)
      {
        if (*a5 > 0x3Cu)
        {
          if (v15 == 61 || v15 == 255)
            goto LABEL_13;
          goto LABEL_26;
        }
        if (*a5)
          break;
      }
LABEL_13:
      ++a5;
      if (!--v11)
        return sub_10000D574((uint64_t)a4) - v54;
    }
    if (v15 == 12)
    {
      if (!a1)
        goto LABEL_13;
      v16 = strlen(a1);
      if (!sub_10000D334((uint64_t)a4, 12, v16, a1) || !os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      v17 = sub_10000D54C(a4);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v59 = v17;
      v18 = v13;
      v19 = OS_LOG_TYPE_DEFAULT;
      v20 = v14;
      goto LABEL_22;
    }
LABEL_26:
    if (SubnetForAddress)
    {
      v57 = 0;
      OptionPtrAndLength = (void *)SubnetGetOptionPtrAndLength(SubnetForAddress, v15, &v57);
      v23 = OptionPtrAndLength != 0;
      if (OptionPtrAndLength
        && sub_10000D334((uint64_t)a4, *a5, v57, OptionPtrAndLength)
        && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v14;
        v25 = v13;
        v26 = v12;
        v27 = SubnetForAddress;
        v28 = a1;
        v29 = *a5;
        v30 = sub_10000D54C(a4);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v59 = v29;
        a1 = v28;
        SubnetForAddress = v27;
        v12 = v26;
        v13 = v25;
        v14 = v24;
        *(_WORD *)&v59[4] = 2080;
        *(_QWORD *)&v59[6] = v30;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add option %d: %s", buf, 0x12u);
      }
    }
    else
    {
      v23 = 0;
    }
    if (v23 || !dword_10001C0A4)
      goto LABEL_87;
    if (!v56)
    {
      v31 = sub_100010280(a3, a2);
      if ((_DWORD)v31 != -1)
        v12 = sub_100010214(a3, v31);
      __src = (_DWORD *)inetroute_default(qword_10001C9E8);
    }
    v32 = *a5;
    v56 = 1;
    if (v32 <= 5)
    {
      if (v32 == 1)
      {
        if (!v12)
          goto LABEL_69;
        v51 = v12;
        v42 = (_DWORD *)(v12 + 4);
        if (sub_10000D334((uint64_t)a4, 1, 4, v42))
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v43 = sub_10000D54C(a4);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v59 = v43;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add subnet_mask: %s", buf, 0xCu);
          }
          v56 = 1;
          v12 = v51;
          goto LABEL_13;
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v46.s_addr = *v42;
          v47 = inet_ntoa(v46);
          v48 = nullsub_1(a3);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v59 = v47;
          *(_WORD *)&v59[8] = 2080;
          *(_QWORD *)&v59[10] = v48;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "subnet mask %s derived from %s", buf, 0x16u);
          v56 = 1;
          v12 = v51;
          goto LABEL_88;
        }
        v56 = 1;
        v12 = v51;
        goto LABEL_87;
      }
      if (v32 != 3)
        goto LABEL_87;
      v56 = 1;
      if (!__src)
        goto LABEL_13;
      if (!v12)
        goto LABEL_13;
      v37 = *(_DWORD *)(v12 + 4);
      v36 = *(_DWORD *)(v12 + 8);
      v56 = 1;
      if ((*__src & v37) != v36 || (v37 & a2) != v36)
        goto LABEL_13;
      if (sub_10000D334((uint64_t)a4, 3, 4, __src))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v38 = sub_10000D54C(a4);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v59 = v38;
          v34 = v13;
          v35 = "couldn't add router: %s";
          goto LABEL_59;
        }
LABEL_69:
        v56 = 1;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v44 = v13;
        v45 = "default route added as router";
        goto LABEL_85;
      }
    }
    else
    {
      if (v32 != 6)
      {
        if (v32 != 15)
        {
          if (v32 != 119)
            goto LABEL_87;
          if (qword_10001CA28)
          {
            if (sub_10000D334((uint64_t)a4, 119, dword_10001CA30, (void *)qword_10001CA28))
            {
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                v33 = sub_10000D54C(a4);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)v59 = v33;
                v34 = v13;
                v35 = "couldn't add domain search: %s";
                goto LABEL_59;
              }
              goto LABEL_69;
            }
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v44 = v13;
              v45 = "domain search added";
LABEL_85:
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, v45, buf, 2u);
              v56 = 1;
              goto LABEL_88;
            }
          }
          goto LABEL_86;
        }
        if (qword_10001CA20)
        {
          v40 = strlen((const char *)qword_10001CA20);
          if (sub_10000D334((uint64_t)a4, 15, v40, (void *)qword_10001CA20))
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v41 = sub_10000D54C(a4);
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)v59 = v41;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "couldn't add domain name: %s", buf, 0xCu);
            }
            v56 = 1;
            v14 = "couldn't add hostname: %s";
            goto LABEL_13;
          }
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "default domain name added", buf, 2u);
            v56 = 1;
            v14 = "couldn't add hostname: %s";
            goto LABEL_88;
          }
          v56 = 1;
        }
        else
        {
          v56 = 1;
        }
        v14 = "couldn't add hostname: %s";
LABEL_87:
        if (v23)
          goto LABEL_13;
LABEL_88:
        if (*a5 != 108 || ((*(_DWORD *)(a3 + 76) | dword_10001C9F0) & 0x80) == 0)
          goto LABEL_13;
        if (sub_10000D334((uint64_t)a4, 108, 4, &dword_10001CA34))
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            goto LABEL_13;
          v49 = sub_10000D54C(a4);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v59 = v49;
          v18 = v13;
          v19 = OS_LOG_TYPE_DEFAULT;
          v20 = "couldn't add ipv6 only preferred: %s";
LABEL_22:
          v21 = 12;
        }
        else
        {
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            goto LABEL_13;
          *(_WORD *)buf = 0;
          v18 = v13;
          v19 = OS_LOG_TYPE_INFO;
          v20 = "IPv6-only preferred option added";
          v21 = 2;
        }
        _os_log_impl((void *)&_mh_execute_header, v18, v19, v20, buf, v21);
        goto LABEL_13;
      }
      if (!dword_10001CA14)
        goto LABEL_69;
      if (sub_10000D334((uint64_t)a4, 6, 4 * dword_10001CA14, (void *)qword_10001CA18))
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v39 = sub_10000D54C(a4);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v59 = v39;
          v34 = v13;
          v35 = "couldn't add dns servers: %s";
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        }
        goto LABEL_69;
      }
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v44 = v13;
        v45 = "default dns servers added";
        goto LABEL_85;
      }
    }
LABEL_86:
    v56 = 1;
    goto LABEL_87;
  }
  return sub_10000D574((uint64_t)a4) - v54;
}

void sub_1000085F8(id a1)
{
  uint8_t v1[16];
  timeval v2;

  v2.tv_sec = 0;
  *(_QWORD *)&v2.tv_usec = 0;
  gettimeofday(&v2, 0);
  if (v2.tv_sec - qword_10001CA00 >= 300)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "idle, exiting", v1, 2u);
    }
    exit(0);
  }
}

void sub_100008680(id a1)
{
  byte_10001CA44 = 0;
}

BOOL sub_10000868C(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4)
{
  const __CFString *Value;
  int v8;
  uint8_t buf[4];
  uint64_t v10;

  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    v8 = 0;
    if (Value)
    {
      if ((sub_10000C760(Value, &v8) & 1) != 0)
      {
        return v8 != 0;
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v10 = a3;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid '%s' property", buf, 0xCu);
      }
    }
  }
  return a4;
}

uint64_t sub_10000875C(uint64_t result, int a2)
{
  const __CFString *v3;
  CFTypeID TypeID;
  CFTypeID v5;
  uint64_t v6;
  const __CFString *ValueAtIndex;
  CFIndex i;
  uint64_t v9;
  CFTypeID v10;
  char buffer[17];

  if (!result)
    return result;
  v3 = (const __CFString *)result;
  TypeID = CFBooleanGetTypeID();
  if (CFGetTypeID(v3) == TypeID)
  {
    result = CFEqual(v3, kCFBooleanTrue);
    if (!(_DWORD)result)
      return result;
    goto LABEL_4;
  }
  v5 = CFStringGetTypeID();
  if (CFGetTypeID(v3) == v5)
  {
    v6 = 1;
    ValueAtIndex = v3;
    goto LABEL_7;
  }
  v10 = CFArrayGetTypeID();
  result = CFGetTypeID(v3);
  if (result == v10)
  {
    result = CFArrayGetCount((CFArrayRef)v3);
    if (!result)
    {
LABEL_4:
      dword_10001C9F0 |= a2;
      return result;
    }
    v6 = result;
    if (result >= 1)
    {
      ValueAtIndex = 0;
LABEL_7:
      for (i = 0; i != v6; ++i)
      {
        if (i || !ValueAtIndex)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v3, i);
          result = CFStringGetTypeID();
          if (!ValueAtIndex)
            continue;
          v9 = result;
          result = CFGetTypeID(ValueAtIndex);
          if (result != v9)
            continue;
        }
        result = CFStringGetCString(ValueAtIndex, buffer, 17, 0x600u);
        if ((_DWORD)result && buffer[0])
        {
          result = sub_10000F8F4((uint64_t *)qword_10001C9C8, buffer);
          if (result)
            *(_DWORD *)(result + 76) |= a2;
        }
      }
    }
  }
  return result;
}

char *sub_1000088F0(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count;
  char *v5;
  CFIndex v6;
  int v7;
  const __CFString *ValueAtIndex;
  CFTypeID TypeID;
  ether_addr *v10;
  char *v11;
  int v12;
  char buffer[2];

  Count = CFArrayGetCount(a1);
  v5 = (char *)malloc_type_malloc(6 * Count, 0x1000040274DC3F3uLL);
  if (Count < 1)
    goto LABEL_12;
  v6 = 0;
  v7 = 0;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
    TypeID = CFStringGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        if (CFStringGetCString(ValueAtIndex, buffer, 64, 0x600u))
        {
          if (strlen(buffer) >= 2)
          {
            v10 = ether_aton(&buffer[2 * (*(unsigned __int16 *)buffer == 11313)]);
            if (v10)
            {
              v11 = &v5[6 * v7];
              v12 = *(_DWORD *)v10->octet;
              *((_WORD *)v11 + 2) = *(_WORD *)&v10->octet[4];
              *(_DWORD *)v11 = v12;
              ++v7;
            }
          }
        }
      }
    }
    ++v6;
  }
  while (Count != v6);
  if (v7)
  {
    qsort(v5, v7, 6uLL, (int (__cdecl *)(const void *, const void *))sub_100010D20);
  }
  else
  {
LABEL_12:
    free(v5);
    v7 = 0;
    v5 = 0;
  }
  *a2 = v7;
  return v5;
}

unsigned int *sub_100008A74(int a1, _DWORD *a2)
{
  unsigned int *v2;

  *a2 = 0;
  v2 = (unsigned int *)qword_10001D268;
  if (qword_10001D270 < 0xC || qword_10001D268 == 0)
    return 0;
  while (v2[1] || v2[2] != a1)
  {
    v2 = (unsigned int *)((char *)v2 + ((*v2 + 3) & 0x1FFFFFFFCLL));
    if ((unint64_t)(v2 + 3) > qword_10001D268 + (unint64_t)qword_10001D270)
      return 0;
  }
  if (*v2 < 0xC)
    return 0;
  *a2 = *v2 - 12;
  return v2 + 3;
}

uint64_t sub_100008AE8()
{
  const __CFDictionary *v0;
  CFStringRef NetworkInterfaceEntity;
  __CFArray *Mutable;
  uint8_t v4[16];

  v0 = CFDictionaryCreate(0, (const void **)&kSCDynamicStoreUseSessionKeys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_10001D4A0 = (uint64_t)SCDynamicStoreCreateWithOptions(0, CFSTR("com.apple.network.bootpd"), v0, (SCDynamicStoreCallBack)sub_100008C3C, 0);
  CFRelease(v0);
  if (!qword_10001D4A0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SCDynamicStoreCreate failed", v4, 2u);
    }
    exit(2);
  }
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
  Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_10001D4A0, 0, Mutable);
  CFRelease(Mutable);
  return SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)qword_10001D4A0, (dispatch_queue_t)&_dispatch_main_q);
}

void sub_100008C3C()
{
  byte_10001CA44 = 0;
}

void sub_100008C48(const char *a1)
{
  const char *v1;
  FILE *v2;
  FILE *v3;
  int v4;
  _QWORD *v5;
  _QWORD *v6;
  int v7;
  int v8;
  _BOOL4 v9;
  int v10;
  char *v12;
  uint64_t v13;
  int v14;
  char *i;
  unsigned int v16;
  int v18;
  uint64_t v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint8_t *v23;
  os_log_type_t v24;
  uint32_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint8_t *v30;
  stat v31;
  uint8_t v32[4];
  char *v33;
  __int16 v34;
  int v35;
  uint8_t v36[32];
  uint8_t v37[4];
  int v38;
  __int16 v39;
  int v40;
  char v41[64];
  char v42[64];
  char v43[64];
  uint8_t buf[4];
  const char *v45;

  memset(&v31, 0, sizeof(v31));
  if (a1)
    v1 = a1;
  else
    v1 = "/etc/bootptab";
  v2 = fopen(v1, "r");
  if (!v2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      return;
    *(_DWORD *)buf = 136315138;
    v45 = v1;
    v22 = "can't open %s";
    v23 = buf;
    v24 = OS_LOG_TYPE_INFO;
    v25 = 12;
    goto LABEL_59;
  }
  v3 = v2;
  v4 = fileno(v2);
  if (!fstat(v4, &v31) && v31.st_mtimespec.tv_sec == qword_10001D4B0)
  {
    fclose(v3);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "re-reading %s", buf, 0xCu);
  }
  qword_10001D4B0 = v31.st_mtimespec.tv_sec;
  v5 = (_QWORD *)qword_10001D4B8;
  if (qword_10001D4B8)
  {
    do
    {
      v6 = (_QWORD *)*v5;
      hostfree(&qword_10001D4B8, v5);
      v5 = v6;
    }
    while (v6);
  }
  v29 = 0;
  if (fgets((char *)buf, 256, v3))
  {
    v26 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 1;
    while (1)
    {
      v10 = strlen((const char *)buf);
      if (v10)
        buf[v10 - 1] = 0;
      v30 = buf;
      ++v8;
      if (buf[0] <= 0x23u && ((1 << buf[0]) & 0x900000001) != 0)
        goto LABEL_20;
      if (!v9)
        break;
      v9 = buf[0] != 37;
LABEL_20:
      v29 = 0;
      if (!fgets((char *)buf, 256, v3))
        goto LABEL_57;
    }
    v27 = v7 + 1;
    sub_100009248(&v30, v8, v41, 63);
    sub_100009248(&v30, v8, v43, 64);
    sscanf(v43, "%d", &v29);
    sub_100009248(&v30, v8, v43, 64);
    v12 = v42;
    __strlcpy_chk(v42, v43, 64, 64);
    v13 = 0;
    v14 = 1;
    do
    {
      v28 = 0;
      for (i = v12 + 1; ; ++i)
      {
        v16 = *(i - 1);
        if (v16 <= 0x3A && ((1 << v16) & 0x400400000000001) != 0)
          break;
      }
      *(i - 1) = 0;
      if (sscanf(v12, "%x", &v28) != 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 136315394;
          v33 = v43;
          v34 = 1024;
          v35 = v8;
          v20 = "bad hex address: %s, at line %d of bootptab";
LABEL_42:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v20, v32, 0x12u);
        }
LABEL_43:
        v9 = 0;
        v7 = v27;
        goto LABEL_20;
      }
      v18 = v28;
      v19 = v13 + 1;
      v36[v13] = v28;
      if (v18)
        v14 = 0;
      if (!v16)
        break;
      ++v13;
      v12 = i;
    }
    while (v19 != 32);
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v32 = 136315394;
        v33 = v43;
        v34 = 1024;
        v35 = v8;
        v20 = "zero hex address: %s, at line %d of bootptab";
        goto LABEL_42;
      }
      goto LABEL_43;
    }
    if ((_DWORD)v29 != 1 || (_DWORD)v19 == 6)
    {
      sub_100009248(&v30, v8, v43, 64);
      HIDWORD(v29) = inet_addr(v43);
      v7 = v27;
      if ((HIDWORD(v29) + 1) > 1)
      {
        sub_100009248(&v30, v8, v37, 127);
        hostadd((uint64_t)&qword_10001D4B8, 0, v29, (uint64_t)v36, v19, (_DWORD *)&v29 + 1, v41, (const char *)v37);
        v9 = 0;
        ++v26;
        goto LABEL_20;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        goto LABEL_52;
      *(_DWORD *)v32 = 136315394;
      v33 = v43;
      v34 = 1024;
      v35 = v8;
      v21 = "bad internet address: %s, at line %d of bootptab";
    }
    else
    {
      v7 = v27;
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
LABEL_52:
        v9 = 0;
        goto LABEL_20;
      }
      *(_DWORD *)v32 = 136315394;
      v33 = v43;
      v34 = 1024;
      v35 = v8;
      v21 = "bad hex address: %s, at line %d of bootptab";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, v32, 0x12u);
    goto LABEL_52;
  }
  v7 = 0;
  v26 = 0;
LABEL_57:
  fclose(v3);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v37 = 67109376;
    v38 = v26;
    v39 = 1024;
    v40 = v7 - v26;
    v22 = "Loaded %d entries from bootptab (%d bad)";
    v23 = v37;
    v24 = OS_LOG_TYPE_DEFAULT;
    v25 = 14;
LABEL_59:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v24, v22, v23, v25);
  }
}

void sub_100009248(_BYTE **a1, int a2, _BYTE *a3, int a4)
{
  _BYTE *i;
  int v8;
  uint64_t j;
  int v10;
  _BYTE *v11;
  __int16 v12;
  int v13;

  for (i = *a1; ; ++i)
  {
    v8 = *i;
    if (v8 != 9 && v8 != 32)
      break;
  }
  if (*i)
  {
    for (j = 0; ; ++j)
    {
      if (v8 <= 0x20u && ((1 << v8) & 0x100000201) != 0)
      {
        a3[j] = 0;
        i += j;
        goto LABEL_13;
      }
      a3[j] = v8;
      if (a4 <= 2)
        break;
      LOBYTE(v8) = i[j + 1];
      --a4;
    }
    a3[j + 1] = 0;
    i += j;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315394;
      v11 = a3;
      v12 = 1024;
      v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "string truncated: %s, on line %d of bootptab", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    *a3 = 0;
  }
LABEL_13:
  *a1 = i;
}

uint64_t sub_10000939C(int a1, void *a2, unsigned int a3, unsigned int (*a4)(uint64_t, _QWORD), uint64_t a5, _DWORD *a6, char **a7, char **a8)
{
  uint64_t v8;
  size_t v17;

  v8 = qword_10001D4B8;
  if (!qword_10001D4B8)
    return 0;
  v17 = a3;
  while (*(unsigned __int8 *)(v8 + 20) != a1
       || *(unsigned __int8 *)(v8 + 21) != a3
       || bcmp(a2, (const void *)(v8 + 22), v17)
       || a4 && !a4(a5, *(unsigned int *)(v8 + 16)))
  {
    v8 = *(_QWORD *)v8;
    if (!v8)
      return 0;
  }
  if (a7)
    *a7 = strdup(*(const char **)(v8 + 280));
  if (a8)
    *a8 = strdup(*(const char **)(v8 + 288));
  *a6 = *(_DWORD *)(v8 + 16);
  return 1;
}

uint64_t sub_100009480(int a1, char **a2, char **a3)
{
  uint64_t v3;

  v3 = qword_10001D4B8;
  if (!qword_10001D4B8)
    return 0;
  while (*(_DWORD *)(v3 + 16) != a1)
  {
    v3 = *(_QWORD *)v3;
    if (!v3)
      return 0;
  }
  if (a2)
    *a2 = strdup(*(const char **)(v3 + 280));
  if (a3)
    *a3 = strdup(*(const char **)(v3 + 288));
  return 1;
}

uint64_t sub_1000094F4(uint64_t *a1)
{
  uint64_t result;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  sub_1000127AC(a1);
  sub_1000127C0((uint64_t)a1, 104857600);
  if (sub_1000128B8((uint64_t)a1, "/var/db/dhcpd_leases"))
    return 1;
  sub_100012848(a1);
  result = 0;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t sub_100009558(uint64_t a1, uint64_t a2, int a3, uint64_t *a4, in_addr *a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  in_addr v15;
  char *v16;
  in_addr v18;
  _QWORD *v19;
  uint8_t buf[4];
  char *v21;

  v5 = *(_QWORD **)(a1 + 8);
  if (!v5)
    return 0;
  while (1)
  {
    v18.s_addr = 0;
    v9 = sub_1000134A8(*v5, v5[1], "ip_address", 0);
    if (v9 << 32 != 0xFFFFFFFF00000000)
    {
      v10 = v5[1];
      if (*(_DWORD *)(v10 + 24 * (int)v9 + 8))
      {
        if (inet_aton(**(const char ***)(v10 + 24 * (int)v9 + 16), &v18) && sub_100007728(v18.s_addr, a3, a2))
        {
          v11 = sub_1000134A8(*v5, v5[1], "lease", 0);
          if (v11 << 32 == 0xFFFFFFFF00000000)
            break;
          v12 = v5[1];
          if (*(_DWORD *)(v12 + 24 * (int)v11 + 8))
          {
            v13 = strtol(**(const char ***)(v12 + 24 * (int)v11 + 16), 0, 0);
            if ((v13 != 0x7FFFFFFFFFFFFFFFLL || *__error() != 34) && *a4 > v13)
              break;
          }
        }
      }
    }
    v5 = (_QWORD *)v5[5];
    if (!v5)
      return 0;
  }
  v19 = v5;
  sub_100009748((uint64_t *)&v19);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v15.s_addr = v18.s_addr;
    v16 = inet_ntoa(v15);
    *(_DWORD *)buf = 136315138;
    v21 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcp: reclaimed address %s", buf, 0xCu);
  }
  a5->s_addr = v18.s_addr;
  return 1;
}

uint64_t sub_100009748(uint64_t *a1)
{
  uint64_t v2;

  v2 = *a1;
  sub_100012DF4((uint64_t)&xmmword_10001D4C8, *a1);
  sub_10001277C(v2);
  *a1 = 0;
  sub_100012C70((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases");
  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

uint64_t sub_1000097A8(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t result;
  unsigned int v3;
  int v4;

  v4 = 0;
  v1 = sub_10000CFB0(a1, 57, &v4, 0);
  result = 548;
  if (v1 && v4 == 2)
  {
    v3 = bswap32(*(unsigned __int16 *)v1) >> 16;
    if (v3 <= 0x224)
      return 548;
    else
      return v3;
  }
  return result;
}

void sub_100009804()
{
  __int128 v0;
  uint64_t v1;
  uint8_t buf[4];
  int v3;

  if ((byte_10001D4C0 & 1) != 0)
  {
    v0 = 0uLL;
    v1 = 0;
    if (sub_1000094F4((uint64_t *)&v0))
    {
      sub_100012848((uint64_t *)&xmmword_10001D4C8);
      xmmword_10001D4C8 = v0;
      qword_10001D4D8 = v1;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v3 = HIDWORD(qword_10001D4D8);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcp: re-reading lease list (%d entries)", buf, 8u);
      }
    }
  }
  else if (sub_1000094F4((uint64_t *)&xmmword_10001D4C8))
  {
    byte_10001D4C0 = 1;
  }
}

uint64_t sub_100009900(uint64_t a1, int a2, int a3, int a4, _OWORD *a5, uint64_t *a6)
{
  uint64_t v8;
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
  const char *v20;
  uint32_t v21;
  const char *v22;
  int __src;
  uint8_t buf[4];
  _QWORD v26[2];

  v8 = a1;
  __src = a3;
  v10 = a5[1];
  v9 = a5[2];
  *(_OWORD *)a1 = *a5;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v9;
  v11 = a5[3];
  v12 = a5[4];
  v13 = a5[6];
  *(_OWORD *)(a1 + 80) = a5[5];
  *(_OWORD *)(a1 + 96) = v13;
  *(_OWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v12;
  v14 = a5[7];
  v15 = a5[8];
  v16 = a5[10];
  *(_OWORD *)(a1 + 144) = a5[9];
  *(_OWORD *)(a1 + 160) = v16;
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = v15;
  v17 = a5[11];
  v18 = a5[12];
  v19 = a5[13];
  *(_OWORD *)(a1 + 220) = *(_OWORD *)((char *)a5 + 220);
  *(_OWORD *)(a1 + 192) = v18;
  *(_OWORD *)(a1 + 208) = v19;
  *(_OWORD *)(a1 + 176) = v17;
  *(_DWORD *)(a1 + 20) = a3;
  *(_BYTE *)(a1 + 3) = 0;
  *(_WORD *)(a1 + 8) = 0;
  *(_BYTE *)a1 = 2;
  *(_DWORD *)(a1 + 236) = 1666417251;
  sub_10000D32C((uint64_t)a6, (void *)(a1 + 240), a2 - 240);
  if (sub_10000D520((uint64_t)a6, a4))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v26[0]) = a4;
      WORD2(v26[0]) = 2080;
      *(_QWORD *)((char *)v26 + 6) = sub_10000D54C(a6);
      v20 = "make_dhcp_reply: couldn't add dhcp message tag %d: %s";
      v21 = 18;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v20, buf, v21);
      return 0;
    }
    return 0;
  }
  if (sub_10000D334((uint64_t)a6, 54, 4, &__src))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v22 = sub_10000D54C(a6);
      *(_DWORD *)buf = 136315138;
      v26[0] = v22;
      v20 = "make_dhcp_reply: couldn't add server identifier tag: %s";
      v21 = 12;
      goto LABEL_7;
    }
    return 0;
  }
  return v8;
}

void sub_100009AC8(unsigned int *a1, uint64_t a2, _DWORD *a3)
{
  char __str[32];

  snprintf(__str, 0x20uLL, "0x%lx", a2);
  sub_100013678(a1, "lease", __str, a3);
}

uint64_t sub_100009B4C(int a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;

  v4 = qword_10001C1B8;
  if (!qword_10001C1B8)
    return 0;
  if (a1)
  {
    *a4 = a1;
    return SubnetListAcquireAddress(v4, a4, (uint64_t (*)(uint64_t, uint64_t))sub_10000BF58, a3);
  }
  if ((int)sub_10001020C(a2) < 1)
    return 0;
  v9 = 0;
  while (1)
  {
    *a4 = *(_DWORD *)(sub_100010214(a2, v9) + 8);
    result = SubnetListAcquireAddress(qword_10001C1B8, a4, (uint64_t (*)(uint64_t, uint64_t))sub_10000BF58, a3);
    if (result)
      break;
    v9 = (v9 + 1);
    if ((int)v9 >= (int)sub_10001020C(a2))
      return 0;
  }
  return result;
}

uint64_t sub_100009C20(const char *a1, const char *a2, in_addr_t a3, uint64_t a4, int a5, uint64_t a6)
{
  char *v10;
  in_addr v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char __str[16];
  uint64_t v26;

  v19 = 0;
  v20 = 0;
  if (a4)
  {
    v10 = sub_10000BE7C(a4, a5);
    *(_QWORD *)&__str[8] = 0;
    v26 = 0;
    *(_QWORD *)__str = "name";
    if (v10)
      sub_1000135A8((unsigned int *)&__str[8], v10, 0);
    v23 = *(_OWORD *)__str;
    v24 = v26;
    sub_100013154((unsigned int *)&v19, (uint64_t)&v23, 0);
    sub_100013540(&__str[8]);
    free(v10);
  }
  v11.s_addr = a3;
  v12 = inet_ntoa(v11);
  v13 = v19;
  *(_QWORD *)&__str[8] = 0;
  v26 = 0;
  *(_QWORD *)__str = "ip_address";
  if (v12)
    sub_1000135A8((unsigned int *)&__str[8], v12, 0);
  v23 = *(_OWORD *)__str;
  v24 = v26;
  sub_100013154((unsigned int *)&v19, (uint64_t)&v23, v13);
  sub_100013540(&__str[8]);
  v14 = v19;
  *(_QWORD *)&__str[8] = 0;
  v26 = 0;
  *(_QWORD *)__str = "hw_address";
  if (a2)
    sub_1000135A8((unsigned int *)&__str[8], a2, 0);
  v23 = *(_OWORD *)__str;
  v24 = v26;
  sub_100013154((unsigned int *)&v19, (uint64_t)&v23, v14);
  sub_100013540(&__str[8]);
  v15 = v19;
  *(_QWORD *)&__str[8] = 0;
  v26 = 0;
  *(_QWORD *)__str = "identifier";
  if (a1)
    sub_1000135A8((unsigned int *)&__str[8], a1, 0);
  v23 = *(_OWORD *)__str;
  v24 = v26;
  sub_100013154((unsigned int *)&v19, (uint64_t)&v23, v15);
  sub_100013540(&__str[8]);
  snprintf(__str, 0x80uLL, "0x%lx", a6);
  v16 = v19;
  *((_QWORD *)&v23 + 1) = 0;
  v24 = 0;
  *(_QWORD *)&v23 = "lease";
  sub_1000135A8((unsigned int *)&v23 + 2, __str, 0);
  v21 = v23;
  v22 = v24;
  sub_100013154((unsigned int *)&v19, (uint64_t)&v21, v16);
  sub_100013540((_QWORD *)&v23 + 1);
  v17 = sub_10001271C(v19, v20);
  sub_100012884((uint64_t *)&xmmword_10001D4C8, (uint64_t)v17);
  sub_100012C70((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases");
  sub_100013338((unsigned int *)&v19);
  return notify_post("com.apple.bootpd.DHCPLeaseList");
}

void sub_100009EBC(uint64_t *a1, unsigned int a2, int a3)
{
  uint64_t v6;
  char **v7;
  unsigned int v8;
  int v9;
  unsigned __int8 *v10;
  void *v11;
  int v12;
  int v13;
  char *v14;
  char *v15;
  char *v16;
  unsigned __int8 *v17;
  int v18;
  _BOOL4 v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint32_t v24;
  uint64_t v25;
  int v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int *v32;
  uint64_t v33;
  int v34;
  unsigned int *v35;
  uint64_t SubnetForAddress;
  uint64_t v37;
  uint64_t v38;
  const char ***v39;
  in_addr v40;
  char *v41;
  int v42;
  int v43;
  uint64_t v44;
  size_t v45;
  const char *v46;
  uint32_t v47;
  unsigned __int8 *v48;
  unsigned int *v49;
  int v50;
  unsigned __int8 *v51;
  int *v52;
  in_addr_t *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  in_addr v57;
  char *v58;
  unsigned int *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  size_t v71;
  int v72;
  int v73;
  in_addr_t v74;
  char v75;
  uint64_t v76;
  in_addr_t v77;
  in_addr *v78;
  const char *v79;
  const char *v80;
  in_addr v81;
  char *v82;
  in_addr v83;
  char *v84;
  uint64_t v85;
  unsigned int *v86;
  in_addr v87;
  char *v88;
  in_addr v89;
  char *v90;
  char *v91;
  unsigned int v92;
  int v93;
  const char *v94;
  uint8_t *v95;
  os_log_type_t v96;
  uint32_t v97;
  unsigned __int8 *v98;
  const char *v99;
  uint8_t *v100;
  os_log_type_t v101;
  uint32_t v102;
  unsigned int v103;
  unsigned int v104;
  const char *v105;
  in_addr v106;
  char *v107;
  int v108;
  int v109;
  int v110;
  int v111;
  const char *v112;
  uint64_t v113;
  in_addr_t s_addr;
  unsigned int v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  void *v120;
  void *v121;
  const char *v122;
  uint32_t v123;
  const char *v124;
  const char *v125;
  in_addr v126;
  char *v127;
  _DWORD *v128;
  const char *v129;
  in_addr v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  _OWORD *v134;
  uint64_t v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  in_addr_t v139;
  const char *v140;
  char *v141;
  unsigned int *v142;
  char *v143;
  in_addr v144;
  char *v145;
  unsigned int MaxLease;
  unsigned int MinLease;
  unsigned int v148;
  unsigned int v149;
  uint64_t v150;
  uint64_t v151;
  _DWORD *v152;
  unsigned int v153;
  in_addr_t v154;
  char *v155;
  uint64_t v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int v159;
  unsigned int v160;
  uint64_t v161;
  _BOOL4 v162;
  _BOOL4 v163;
  in_addr v164;
  char *v165;
  char *v166;
  uint64_t v167;
  in_addr_t v168;
  in_addr v169;
  char *v170;
  uint64_t v171;
  int v172;
  _BOOL4 v173;
  unsigned __int8 *v174;
  int v175;
  int v176;
  uint64_t v177;
  const char *v178;
  int v179;
  in_addr_t *v180;
  const char *v181;
  unsigned int v182;
  unsigned int v183;
  uint64_t v184;
  unsigned int __src;
  in_addr v186;
  void *v187;
  int v188;
  int v189[2];
  unsigned int v190[3];
  uint8_t v191[4];
  _BYTE v192[10];
  void *v193;
  __int16 v194;
  char *v195;
  __int16 v196;
  unsigned int v197;
  uint8_t buf[4];
  _BYTE v199[36];
  _QWORD v200[183];
  char v201[48];
  char __str[128];
  _OWORD v203[19];

  memset(v190, 0, sizeof(v190));
  *(_QWORD *)v189 = 0;
  v188 = 0;
  v187 = 0;
  __src = 0;
  v184 = 0;
  memset(v203, 0, sizeof(v203));
  v183 = 0;
  v6 = a1[1];
  if (byte_10001C0B2)
    v7 = (char **)&v190[1];
  else
    v7 = 0;
  v186.s_addr = 0;
  v8 = sub_1000097A8(a1[3]);
  if (v8 >= 0x5DC)
    v9 = 1500;
  else
    v9 = v8;
  v10 = sub_10000CFB0(a1[3], 61, v190, 0);
  if (!v10
    || (int)v190[0] < 2
    || (v11 = v10 + 1, v12 = *v10, v13 = v190[0] - 1, --v190[0], byte_10001C0B1) && *(_BYTE *)(v6 + 2))
  {
    v12 = *(unsigned __int8 *)(v6 + 1);
    v13 = *(unsigned __int8 *)(v6 + 2);
    v190[0] = v13;
    if (!v13)
    {
      v15 = 0;
      goto LABEL_22;
    }
    v11 = (void *)(v6 + 28);
  }
  v14 = identifierToStringWithBuffer(v12, (uint64_t)v11, v13, __str, 128);
  v15 = v14;
  if (!v14)
  {
LABEL_22:
    v16 = 0;
    goto LABEL_330;
  }
  v179 = v9;
  v16 = v14;
  if (!v12)
  {
    v16 = identifierToStringWithBuffer(*(unsigned __int8 *)(v6 + 1), v6 + 28, *(unsigned __int8 *)(v6 + 2), v201, 48);
    if (!v16)
      goto LABEL_330;
  }
  v175 = a3;
  v17 = sub_10000CFB0(a1[3], 12, &v188, 0);
  v18 = v188;
  v19 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  v177 = (uint64_t)v17;
  if (v17 && v18)
  {
    if (!v19)
      goto LABEL_31;
    if (a2 > 8)
      v20 = "<unknown>";
    else
      v20 = off_1000185E0[a2];
    v22 = nullsub_1(*a1);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v199 = v20;
    *(_WORD *)&v199[8] = 2080;
    *(_QWORD *)&v199[10] = v22;
    *(_WORD *)&v199[18] = 2080;
    *(_QWORD *)&v199[20] = v15;
    *(_WORD *)&v199[28] = 1040;
    *(_DWORD *)&v199[30] = v188;
    *(_WORD *)&v199[34] = 2080;
    v200[0] = v17;
    v23 = "DHCP %s [%s]: %s <%.*s>";
    v24 = 48;
  }
  else
  {
    if (!v19)
      goto LABEL_31;
    if (a2 > 8)
      v21 = "<unknown>";
    else
      v21 = off_1000185E0[a2];
    v25 = nullsub_1(*a1);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)v199 = v21;
    *(_WORD *)&v199[8] = 2080;
    *(_QWORD *)&v199[10] = v25;
    *(_WORD *)&v199[18] = 2080;
    *(_QWORD *)&v199[20] = v15;
    v23 = "DHCP %s [%s]: %s";
    v24 = 32;
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v23, buf, v24);
LABEL_31:
  v174 = sub_10000CFB0(a1[3], 51, (_DWORD *)&v184 + 1, 0);
  v181 = v15;
  v178 = v16;
  if (!v12)
  {
    v28 = 0;
LABEL_36:
    v182 = 0;
    *(_QWORD *)&v199[4] = *a1;
    *(_QWORD *)&v199[12] = 0;
    v34 = *(_DWORD *)(v6 + 12);
    *(_DWORD *)buf = *(_DWORD *)(v6 + 24);
    *(_DWORD *)v199 = v34;
    v35 = (unsigned int *)sub_100012EB0((uint64_t *)&xmmword_10001D4C8, v15, (unsigned int (*)(uint64_t, _QWORD))sub_100007A08, (uint64_t)buf, &v186, &v182);
    v32 = v35;
    *(_QWORD *)v189 = v35;
    if (v182 == 1)
      v28 = 1;
    v173 = v28;
    if (v35)
    {
      if (qword_10001C1B8 && (SubnetForAddress = SubnetListGetSubnetForAddress(qword_10001C1B8, v186.s_addr, 1)) != 0)
      {
        v37 = SubnetForAddress;
        if ((SubnetDoesAllocate(SubnetForAddress) & 1) != 0)
        {
          v38 = *v32;
          if (!(_DWORD)v38)
            goto LABEL_181;
          v39 = (const char ***)(*((_QWORD *)v32 + 1) + 16);
          while (strcmp("lease", (const char *)*(v39 - 2)))
          {
            v39 += 3;
            if (!--v38)
              goto LABEL_181;
          }
          if (*((_DWORD *)v39 - 2) && (v112 = **v39) != 0)
          {
            v113 = strtol(v112, 0, 0);
            if (v113 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v15 = (char *)v181;
              if (*__error() == 34)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v191 = 136315138;
                  *(_QWORD *)v192 = v112;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "S_lease_time_expiry: lease '%s' bad", v191, 0xCu);
                }
                v33 = 0;
              }
              else
              {
                v33 = 0x7FFFFFFFFFFFFFFFLL;
              }
              sub_100012E50((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
LABEL_269:
              MaxLease = SubnetGetMaxLease(v37);
              MinLease = SubnetGetMinLease(v37);
              if (v174)
              {
                v148 = bswap32(*(_DWORD *)v174);
                __src = v148;
                if (v148 > MaxLease)
                {
                  v31 = 0;
                  v149 = MaxLease;
                  LODWORD(v32) = 0;
LABEL_274:
                  __src = v149;
LABEL_305:
                  v30 = 2;
                  v29 = v37;
                  goto LABEL_53;
                }
                if (v148 >= MinLease)
                {
                  v31 = 0;
                  LODWORD(v32) = 0;
                  goto LABEL_305;
                }
              }
              else
              {
                v150 = *(_QWORD *)a1[5];
                if (v150 + MinLease < v33)
                {
                  v31 = 0;
                  LODWORD(v32) = 0;
                  v149 = v33 - v150;
                  goto LABEL_274;
                }
              }
              v31 = 0;
              LODWORD(v32) = 0;
              __src = MinLease;
              goto LABEL_305;
            }
            v33 = v113;
            sub_100012E50((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
            v15 = (char *)v181;
            if (v33 != -1)
              goto LABEL_269;
            v30 = 2;
          }
          else
          {
LABEL_181:
            sub_100012E50((uint64_t *)&xmmword_10001D4C8, (uint64_t)v32);
            v30 = 2;
            v15 = (char *)v181;
          }
          v29 = v37;
          goto LABEL_34;
        }
      }
      else
      {
        v37 = 0;
      }
      sub_100009748((uint64_t *)v189);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        v40.s_addr = v186.s_addr;
        v41 = inet_ntoa(v40);
        *(_DWORD *)v191 = 136315394;
        *(_QWORD *)v192 = v15;
        *(_WORD *)&v192[8] = 2080;
        v193 = v41;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: removing %s binding for %s", v191, 0x16u);
      }
      *(_QWORD *)v189 = 0;
      LODWORD(v32) = 1;
      v29 = v37;
    }
    else
    {
      v29 = 0;
    }
    v30 = 0;
    v33 = 0;
    v31 = 1;
    goto LABEL_53;
  }
  *(_OWORD *)&v199[4] = (unint64_t)*a1;
  v26 = *(_DWORD *)(v6 + 12);
  *(_DWORD *)buf = *(_DWORD *)(v6 + 24);
  *(_DWORD *)v199 = v26;
  v27 = sub_10000939C(v12, v11, v190[0], (unsigned int (*)(uint64_t, _QWORD))sub_100007A08, (uint64_t)buf, &v186, (char **)&v187, v7);
  v28 = *(_DWORD *)&v199[12] == 1;
  if (!v27)
    goto LABEL_36;
  v173 = *(_DWORD *)&v199[12] == 1;
  v29 = 0;
  v30 = 1;
LABEL_34:
  v31 = 0;
  LODWORD(v32) = 0;
  __src = -1;
  v33 = -1;
LABEL_53:
  v42 = v179 - 28;
  switch(a2)
  {
    case 1u:
      v43 = v31;
      v44 = qword_10001D4E0;
      if (!qword_10001D4E0)
        goto LABEL_191;
      v45 = v190[0];
      while (*(unsigned __int8 *)(v44 + 20) != v12
           || (_DWORD)v45 != *(unsigned __int8 *)(v44 + 21)
           || bcmp(v11, (const void *)(v44 + 22), v45))
      {
        v44 = *(_QWORD *)v44;
        if (!v44)
          goto LABEL_191;
      }
      hostfree(&qword_10001D4E0, (_QWORD *)v44);
LABEL_191:
      if (sub_10000BC0C(*a1, a1[3]))
      {
        v16 = (char *)v178;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "client IPv6-only preferred", buf, 2u);
        }
        s_addr = 0;
        v186.s_addr = 0;
        v115 = 3600;
      }
      else
      {
        v16 = (char *)v178;
        if (v43)
        {
          if (!v175)
            goto LABEL_330;
          v116 = sub_100009B4C(*(_DWORD *)(v6 + 24), *a1, a1[5], &v186);
          if (!v116
            && (!sub_100009558((uint64_t)&xmmword_10001D4C8, *a1, *(_DWORD *)(v6 + 24), (uint64_t *)a1[5], &v186)|| !qword_10001C1B8|| (v116 = SubnetListGetSubnetForAddress(qword_10001C1B8, v186.s_addr, 1)) == 0))
          {
            v16 = (char *)v178;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v94 = "no ip addresses";
              v95 = buf;
              v96 = OS_LOG_TYPE_DEFAULT;
              v97 = 2;
              goto LABEL_220;
            }
            goto LABEL_330;
          }
          v117 = SubnetGetMaxLease(v116);
          v118 = SubnetGetMinLease(v116);
          if (v174)
          {
            v119 = bswap32(*(_DWORD *)v174);
            __src = v119;
            v16 = (char *)v178;
            if (v119 <= v117)
            {
              v15 = (char *)v181;
              if (v119 < v118)
                __src = v118;
            }
            else
            {
              __src = v117;
              v15 = (char *)v181;
            }
          }
          else
          {
            __src = v118;
            v15 = (char *)v181;
            v16 = (char *)v178;
          }
        }
        v134 = hostadd((uint64_t)&qword_10001D4E0, (_OWORD *)a1[5], v12, (uint64_t)v11, v190[0], &v186, 0, 0);
        if (!v134)
          goto LABEL_330;
        v115 = __src;
        s_addr = v186.s_addr;
        *((_QWORD *)v134 + 39) = __src;
      }
      __src = bswap32(v115);
      v135 = *a1;
      v136 = sub_100010280(*a1, s_addr);
      if ((_DWORD)v136 == -1)
        v137 = sub_10001021C(v135);
      else
        v137 = *(_DWORD *)sub_100010214(v135, v136);
      v183 = 2;
      v138 = sub_100009900((uint64_t)buf, v42, v137, 2, (_OWORD *)v6, (uint64_t *)v203);
      if (v138)
      {
        v63 = v138;
        v139 = v186.s_addr;
        *(_DWORD *)(v138 + 12) = 0;
        *(_DWORD *)(v138 + 16) = v139;
        if (*(_QWORD *)&v190[1])
          __strlcpy_chk(v138 + 108, *(_QWORD *)&v190[1], 128, 128);
        if (!sub_10000D334((uint64_t)v203, 51, 4, &__src))
        {
          v64 = 0;
          v69 = 3;
          goto LABEL_142;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v140 = sub_10000D54C((uint64_t *)v203);
          *(_DWORD *)v191 = 136315138;
          *(_QWORD *)v192 = v140;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: couldn't add lease time tag: %s", v191, 0xCu);
        }
      }
      v15 = (char *)v181;
      goto LABEL_330;
    case 3u:
      v172 = v31;
      v171 = v29;
      v182 = 0;
      v180 = (in_addr_t *)sub_10000CFB0(a1[3], 54, &v182, 0);
      v48 = sub_10000CFB0(a1[3], 50, &v182, 0);
      v49 = (unsigned int *)v48;
      if (v48)
        v50 = *(_DWORD *)v48;
      else
        v50 = 0;
      v176 = v30;
      v65 = *a1;
      v66 = sub_100010280(*a1, v50);
      if ((_DWORD)v66 == -1)
        v67 = sub_10001021C(v65);
      else
        v67 = *(_DWORD *)sub_100010214(v65, v66);
      if (v180)
      {
        v70 = qword_10001D4E0;
        if (qword_10001D4E0)
        {
          v71 = v190[0];
          do
          {
            if (*(unsigned __int8 *)(v70 + 20) == v12
              && (_DWORD)v71 == *(unsigned __int8 *)(v70 + 21)
              && !bcmp(v11, (const void *)(v70 + 22), v71))
            {
              break;
            }
            v70 = *(_QWORD *)v70;
          }
          while (v70);
        }
        v72 = v42;
        v73 = v67;
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "SELECT", buf, 2u);
        }
        v74 = *v180;
        v30 = v176;
        if (*v180 != v73)
        {
          if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v81.s_addr = v74;
            v82 = inet_ntoa(v81);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v199 = v82;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "client selected %s", buf, 0xCu);
          }
          if (v70)
            hostfree(&qword_10001D4E0, (_QWORD *)v70);
          if (v176 == 2)
            sub_100009748((uint64_t *)v189);
          if (sub_100004BF4(*a1))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v83.s_addr = *v180;
              v84 = inet_ntoa(v83);
              v85 = nullsub_1(*a1);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v199 = v84;
              *(_WORD *)&v199[8] = 2080;
              *(_QWORD *)&v199[10] = v85;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: detected another DHCP server %s, disabling DHCP on %s", buf, 0x16u);
            }
            sub_100004C24(*a1);
          }
          goto LABEL_329;
        }
        if (v70)
          v75 = 0;
        else
          v75 = v172;
        if ((v75 & 1) == 0)
        {
          if (v70)
          {
            v186.s_addr = *(_DWORD *)(v70 + 16);
            v76 = *(_QWORD *)(v70 + 312);
            v33 = 0xFFFFFFFFLL;
            if (v76 != 0xFFFFFFFFLL)
              v33 = *(_QWORD *)a1[5] + v76;
            __src = *(_QWORD *)(v70 + 312);
          }
          if (v49)
          {
            v77 = *v49;
            if (*v49 == v186.s_addr)
            {
              if ((v172 & 1) == 0)
              {
                v30 = v176;
                if (v176 == 2)
                {
                  if (v177 && v188 > 0)
                  {
                    v141 = sub_10000BE7C(v177, v188);
                    v142 = *(unsigned int **)v189;
                    sub_100013678(*(unsigned int **)v189, "name", v141, &v184);
                    free(v141);
                  }
                  else
                  {
                    v142 = *(unsigned int **)v189;
                  }
                  sub_100009AC8(v142, v33, &v184);
                }
                v69 = 4;
                goto LABEL_115;
              }
              if (qword_10001C1B8)
                v171 = SubnetListGetSubnetForAddress(qword_10001C1B8, *v49, 1);
              if (v171)
              {
                sub_100009C20(v181, v178, v186.s_addr, v177, v188, v33);
                v69 = 4;
                v30 = v176;
LABEL_115:
                __src = bswap32(__src);
                v183 = 5;
                v78 = (in_addr *)sub_100009900((uint64_t)buf, v72, v73, 5, (_OWORD *)v6, (uint64_t *)v203);
                v63 = (uint64_t)v78;
                v78[4].s_addr = v186.s_addr;
                if (*(_QWORD *)&v190[1])
                  __strlcpy_chk(&v78[27], *(_QWORD *)&v190[1], 128, 128);
                if (!sub_10000D334((uint64_t)v203, 51, 4, &__src))
                {
                  v64 = 0;
                  goto LABEL_142;
                }
                if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
                  goto LABEL_329;
                v79 = sub_10000D54C((uint64_t *)v203);
                *(_DWORD *)v191 = 136315138;
                *(_QWORD *)v192 = v79;
                v80 = "dhcpd: couldn't add lease time tag: %s";
                goto LABEL_162;
              }
              v161 = sub_10000BC8C((uint64_t)buf, v42, v73, &v183, "unexpected server failure", (_OWORD *)v6, (uint64_t *)v203);
              if (!v161)
                goto LABEL_329;
              v63 = v161;
              v30 = v176;
              v64 = 0;
LABEL_232:
              v69 = 4;
              goto LABEL_142;
            }
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v130.s_addr = v77;
              v131 = inet_ntoa(v130);
              *(_DWORD *)buf = 136316418;
              *(_QWORD *)v199 = v181;
              *(_WORD *)&v199[8] = 2080;
              *(_QWORD *)&v199[10] = v131;
              *(_WORD *)&v199[18] = 1024;
              *(_DWORD *)&v199[20] = LOBYTE(v186.s_addr);
              *(_WORD *)&v199[24] = 1024;
              *(_DWORD *)&v199[26] = BYTE1(v186.s_addr);
              *(_WORD *)&v199[30] = 1024;
              *(_DWORD *)&v199[32] = BYTE2(v186.s_addr);
              LOWORD(v200[0]) = 1024;
              *(_DWORD *)((char *)v200 + 2) = HIBYTE(v186.s_addr);
              v122 = "dhcpd: host %s sends SELECT with wrong IP address %s, should be %d.%d.%d.%d";
              v123 = 46;
              goto LABEL_229;
            }
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v199 = v181;
            v122 = "dhcpd: host %s sends SELECT without Requested IP option";
            v123 = 12;
LABEL_229:
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v122, buf, v123);
          }
          v132 = sub_10000BC8C((uint64_t)buf, v42, v73, &v183, "protocol error in SELECT state", (_OWORD *)v6, (uint64_t *)v203);
          if (!v132)
            goto LABEL_329;
          v63 = v132;
          v64 = 1;
          goto LABEL_232;
        }
LABEL_329:
        v15 = (char *)v181;
        v16 = (char *)v178;
        goto LABEL_330;
      }
      if (sub_10000BC0C(*a1, a1[3]))
      {
        v72 = v42;
        __src = 3600;
        v186.s_addr = 0;
        v69 = 0;
        v73 = v67;
        v30 = v176;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "client IPv6-only preferred", buf, 2u);
          v69 = 0;
        }
        goto LABEL_115;
      }
      v73 = v67;
      if (!v49)
      {
        if (!*(_DWORD *)(v6 + 12))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            goto LABEL_329;
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v199 = v181;
          v80 = "dhcpd: host %s in unknown state";
          v100 = buf;
          v101 = OS_LOG_TYPE_DEBUG;
          goto LABEL_163;
        }
        v72 = v42;
        v30 = v176;
        if (!byte_10001C0B0)
          goto LABEL_280;
        v128 = (_DWORD *)a1[4];
        if (!v128 || *v128 == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            v129 = "rebind";
            goto LABEL_279;
          }
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v129 = "renew";
LABEL_279:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v129, buf, 2u);
        }
LABEL_280:
        if (v172)
        {
          if (!(_DWORD)v32)
          {
            if (!byte_10001C0B0)
              goto LABEL_329;
            v162 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            if (v173)
            {
              if (!v162)
                goto LABEL_329;
              *(_WORD *)buf = 0;
              v80 = "Client binding is not applicable";
            }
            else
            {
              if (!v162)
                goto LABEL_329;
              *(_WORD *)buf = 0;
              v80 = "No binding for client";
            }
            v100 = buf;
            v101 = OS_LOG_TYPE_DEBUG;
            v102 = 2;
            goto LABEL_173;
          }
          v69 = 0;
          goto LABEL_283;
        }
        v152 = (_DWORD *)a1[4];
        if (!v152 || *v152 == -1 || *(_DWORD *)(v6 + 24))
        {
          v153 = *(_DWORD *)(v6 + 12);
          v154 = v186.s_addr;
          v133 = v171;
          if (v153 != v186.s_addr)
          {
            if (!byte_10001C0B0 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
              goto LABEL_329;
            *(_DWORD *)buf = 67110912;
            *(_DWORD *)v199 = v153;
            *(_WORD *)&v199[4] = 1024;
            *(_DWORD *)&v199[6] = BYTE1(v153);
            *(_WORD *)&v199[10] = 1024;
            *(_DWORD *)&v199[12] = BYTE2(v153);
            *(_WORD *)&v199[16] = 1024;
            *(_DWORD *)&v199[18] = HIBYTE(v153);
            *(_WORD *)&v199[22] = 1024;
            *(_DWORD *)&v199[24] = v154;
            *(_WORD *)&v199[28] = 1024;
            *(_DWORD *)&v199[30] = BYTE1(v154);
            *(_WORD *)&v199[34] = 1024;
            LODWORD(v200[0]) = BYTE2(v154);
            WORD2(v200[0]) = 1024;
            *(_DWORD *)((char *)v200 + 6) = HIBYTE(v154);
            v80 = "Incorrect ciaddr %d.%d.%d.%d should be %d.%d.%d.%d";
            v100 = buf;
            v101 = OS_LOG_TYPE_DEBUG;
            v102 = 50;
            goto LABEL_173;
          }
          v69 = 8;
LABEL_291:
          if (v30 == 1)
          {
            __src = -1;
            goto LABEL_115;
          }
          if (v177 && v188 >= 1)
          {
            v155 = sub_10000BE7C(v177, v188);
            sub_100013678(*(unsigned int **)v189, "name", v155, &v184);
            free(v155);
            v133 = v171;
          }
          v156 = v133;
          v157 = SubnetGetMaxLease(v133);
          v158 = SubnetGetMaxLease(v156);
          v159 = v158;
          if (v174)
          {
            v160 = bswap32(*(_DWORD *)v174);
            __src = v160;
            if (v160 > v157)
            {
              __src = v157;
              v160 = v157;
              goto LABEL_318;
            }
            if (v160 < v158)
            {
              __src = v158;
              v160 = v158;
            }
          }
          else
          {
            __src = v158;
            v163 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
            v160 = v159;
            if (v163)
            {
              v164.s_addr = v186.s_addr;
              v165 = inet_ntoa(v164);
              v166 = off_100018628[v69];
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)v199 = v165;
              *(_WORD *)&v199[8] = 2080;
              *(_QWORD *)&v199[10] = v166;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcpd: %s lease extended to %s client", buf, 0x16u);
              v160 = __src;
            }
          }
          if (v160 == -1)
          {
            v167 = -1;
            goto LABEL_320;
          }
LABEL_318:
          v167 = *(_QWORD *)a1[5] + v160;
LABEL_320:
          sub_100009AC8(*(unsigned int **)v189, v167, &v184);
          goto LABEL_115;
        }
        v168 = *(_DWORD *)(v6 + 12);
        if (v168 != v186.s_addr)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v169.s_addr = v168;
            v170 = inet_ntoa(v169);
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)v199 = v170;
            *(_WORD *)&v199[8] = 1024;
            *(_DWORD *)&v199[10] = LOBYTE(v186.s_addr);
            *(_WORD *)&v199[14] = 1024;
            *(_DWORD *)&v199[16] = BYTE1(v186.s_addr);
            *(_WORD *)&v199[20] = 1024;
            *(_DWORD *)&v199[22] = BYTE2(v186.s_addr);
            *(_WORD *)&v199[26] = 1024;
            *(_DWORD *)&v199[28] = HIBYTE(v186.s_addr);
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: client ciaddr=%s should use %d.%d.%d.%d", buf, 0x24u);
            v168 = *(_DWORD *)(v6 + 12);
          }
          v186.s_addr = v168;
        }
        v69 = 7;
LABEL_234:
        v133 = v171;
        goto LABEL_291;
      }
      if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "init-reboot", buf, 2u);
      }
      v30 = v176;
      if (v172)
      {
        if (!(_DWORD)v32)
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
            goto LABEL_329;
          v144.s_addr = *v49;
          v145 = inet_ntoa(v144);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v199 = v181;
          *(_WORD *)&v199[8] = 2080;
          *(_QWORD *)&v199[10] = v145;
          v80 = "dhcpd: INIT-REBOOT host %s binding for %s with another server";
          v100 = buf;
          v101 = OS_LOG_TYPE_DEBUG;
          v102 = 22;
          goto LABEL_173;
        }
        v72 = v42;
        v69 = 6;
LABEL_283:
        v143 = "requested address no longer available";
        goto LABEL_284;
      }
      v72 = v42;
      v69 = 6;
      if (*v49 == v186.s_addr)
        goto LABEL_234;
      v143 = "requested address incorrect";
LABEL_284:
      v151 = sub_10000BC8C((uint64_t)buf, v72, v73, &v183, v143, (_OWORD *)v6, (uint64_t *)v203);
      if (!v151)
        goto LABEL_329;
      v63 = v151;
      v64 = 1;
LABEL_142:
      if (byte_10001C0B0)
      {
LABEL_143:
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v91 = off_100018628[v69];
          *(_DWORD *)v191 = 136315138;
          *(_QWORD *)v192 = v91;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "state=%s", v191, 0xCu);
        }
      }
LABEL_145:
      if (v30 == 2
        && (_DWORD)v184
        && !sub_100012C70((unsigned int **)&xmmword_10001D4C8, (const std::__fs::filesystem::path *)"/var/db/dhcpd_leases"))
      {
        goto LABEL_329;
      }
      v92 = bswap32(*(unsigned __int16 *)(v6 + 8));
      v93 = dword_10001C0AC;
      if (dword_10001C0AC <= HIWORD(v92))
      {
        if (!v63)
          goto LABEL_329;
        if (v183 == 5 || v183 == 2)
        {
          v182 = 0;
          v98 = sub_10000CFB0(a1[3], 55, &v182, 0);
          if (!*(_QWORD *)&v190[1])
          {
            *(_OWORD *)(v63 + 220) = 0u;
            *(_OWORD *)(v63 + 204) = 0u;
            *(_OWORD *)(v63 + 188) = 0u;
            *(_OWORD *)(v63 + 172) = 0u;
            *(_OWORD *)(v63 + 156) = 0u;
            *(_OWORD *)(v63 + 140) = 0u;
            *(_OWORD *)(v63 + 124) = 0u;
            *(_OWORD *)(v63 + 108) = 0u;
          }
          __strlcpy_chk(v63 + 44, &byte_10001C0B3, 64, 64);
          if (v98)
            sub_100007DBC((char *)v187, v186.s_addr, *a1, (uint64_t *)v203, v98, v182);
          if (sub_10000D334((uint64_t)v203, 255, 0, 0))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v99 = sub_10000D54C((uint64_t *)v203);
              *(_DWORD *)v191 = 136315138;
              *(_QWORD *)v192 = v99;
              v80 = "couldn't add end tag: %s";
LABEL_162:
              v100 = v191;
              v101 = OS_LOG_TYPE_INFO;
LABEL_163:
              v102 = 12;
LABEL_173:
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v101, v80, v100, v102);
              goto LABEL_329;
            }
            goto LABEL_329;
          }
        }
        v103 = sub_10000D4F8((uint64_t)v203) + 240;
        if (v103 <= 0x12C)
          v104 = 300;
        else
          v104 = v103;
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          if (v183 > 8)
            v105 = "<unknown>";
          else
            v105 = off_1000185E0[v183];
          *(_DWORD *)v191 = 136315394;
          *(_QWORD *)v192 = v105;
          *(_WORD *)&v192[8] = 1024;
          LODWORD(v193) = v104;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Sending: DHCP %s (size %d)", v191, 0x12u);
        }
        if (!sub_100007A58(*a1, v63, v104, v64, &v186.s_addr))
          goto LABEL_329;
        v120 = v187;
        v15 = (char *)v181;
        v16 = (char *)v178;
        if (!v187 && *(_QWORD *)v189)
        {
          v121 = (void *)sub_10000BEEC(*(unsigned int **)v189, "name");
          v187 = v121;
          if (v121)
          {
            v120 = strdup((const char *)v121);
            v187 = v120;
          }
          else
          {
            v120 = 0;
          }
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          if (v183 > 8)
            v124 = "<unknown>";
          else
            v124 = off_1000185E0[v183];
          if (v120)
            v125 = (const char *)v120;
          else
            v125 = "<no hostname>";
          v126.s_addr = v186.s_addr;
          v127 = inet_ntoa(v126);
          *(_DWORD *)v191 = 136315906;
          *(_QWORD *)v192 = v124;
          *(_WORD *)&v192[8] = 2080;
          v193 = (void *)v125;
          v194 = 2080;
          v195 = v127;
          v196 = 1024;
          v197 = v104;
          v94 = "%s sent %s %s pktsize %d";
          v95 = v191;
          v96 = OS_LOG_TYPE_INFO;
          v97 = 38;
          goto LABEL_220;
        }
      }
      else
      {
        v15 = (char *)v181;
        v16 = (char *)v178;
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v191 = 67109376;
          *(_DWORD *)v192 = HIWORD(v92);
          *(_WORD *)&v192[4] = 1024;
          *(_DWORD *)&v192[6] = v93;
          v94 = "rp->dp_secs %d < threshold %d";
          v95 = v191;
          v96 = OS_LOG_TYPE_DEBUG;
          v97 = 14;
LABEL_220:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, v96, v94, v95, v97);
        }
      }
LABEL_330:
      if (v187)
        free(v187);
      if (*(_QWORD *)&v190[1])
        free(*(void **)&v190[1]);
      if (v15 != __str)
        free(v15);
      if (v16 && v16 != v15 && v16 != v201)
        free(v16);
      return;
    case 4u:
      *(_DWORD *)v191 = 0;
      v51 = sub_10000CFB0(a1[3], 54, v191, 0);
      v52 = (int *)sub_10000CFB0(a1[3], 50, v191, 0);
      if (!v51)
        goto LABEL_329;
      v53 = (in_addr_t *)v52;
      if (!v52)
        goto LABEL_329;
      v54 = *a1;
      v55 = sub_100010280(*a1, *v52);
      if ((_DWORD)v55 == -1)
        v56 = sub_10001021C(v54);
      else
        v56 = *(_DWORD *)sub_100010214(v54, v55);
      if (*(_DWORD *)v51 == v56)
      {
        if (v30 == 2 && v186.s_addr == *v53)
        {
          v86 = *(unsigned int **)v189;
          sub_10001378C(*(uint64_t *)v189, "identifier", &v184);
          sub_100009AC8(v86, *(_QWORD *)a1[5] + 600, &v184);
          sub_100013678(v86, "declined", v181, &v184);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v87.s_addr = v186.s_addr;
            v88 = inet_ntoa(v87);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v199 = v88;
            *(_WORD *)&v199[8] = 2080;
            *(_QWORD *)&v199[10] = v181;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "dhcpd: IP %s declined by %s", buf, 0x16u);
          }
          if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v89.s_addr = v186.s_addr;
            v90 = inet_ntoa(v89);
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)v199 = v90;
            v46 = "marking host %s as declined";
            v47 = 12;
            goto LABEL_64;
          }
        }
        goto LABEL_141;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        goto LABEL_329;
      v106.s_addr = *v53;
      v107 = inet_ntoa(v106);
      v108 = *v51;
      v109 = v51[1];
      v110 = v51[2];
      v111 = v51[3];
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)v199 = v181;
      *(_WORD *)&v199[8] = 2080;
      *(_QWORD *)&v199[10] = v107;
      *(_WORD *)&v199[18] = 1024;
      *(_DWORD *)&v199[20] = v108;
      *(_WORD *)&v199[24] = 1024;
      *(_DWORD *)&v199[26] = v109;
      *(_WORD *)&v199[30] = 1024;
      *(_DWORD *)&v199[32] = v110;
      LOWORD(v200[0]) = 1024;
      *(_DWORD *)((char *)v200 + 2) = v111;
      v80 = "dhcpd: host %s declines IP %s from server %d.%d.%d.%d";
      v100 = buf;
      v101 = OS_LOG_TYPE_DEBUG;
      v102 = 46;
      goto LABEL_173;
    case 7u:
      if (v30 == 2)
      {
        if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          v57.s_addr = v186.s_addr;
          v58 = inet_ntoa(v57);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)v199 = v58;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s released by client, setting expiration to now", buf, 0xCu);
        }
        v59 = *(unsigned int **)v189;
        snprintf((char *)buf, 0x20uLL, "0x%lx", *(_QWORD *)a1[5]);
        sub_100013678(v59, "lease", (const char *)buf, &v184);
      }
      goto LABEL_141;
    case 8u:
      v186.s_addr = *(_DWORD *)(v6 + 12);
      v60 = *a1;
      v61 = sub_100010280(*a1, v186.s_addr);
      if ((_DWORD)v61 == -1)
        v62 = sub_10001021C(v60);
      else
        v62 = *(_DWORD *)sub_100010214(v60, v61);
      v183 = 5;
      v68 = sub_100009900((uint64_t)buf, v42, v62, 5, (_OWORD *)v6, (uint64_t *)v203);
      if (!v68)
        goto LABEL_329;
      v63 = v68;
      v64 = 0;
      v69 = 0;
      goto LABEL_142;
    default:
      if (!byte_10001C0B0)
      {
        v63 = 0;
        v64 = 0;
        goto LABEL_145;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v63 = 0;
        v69 = 0;
        v64 = 0;
        goto LABEL_143;
      }
      *(_WORD *)buf = 0;
      v46 = "unknown message ignored";
      v47 = 2;
LABEL_64:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, v46, buf, v47);
LABEL_141:
      v64 = 0;
      v69 = 0;
      v63 = 0;
      goto LABEL_142;
  }
}

uint64_t sub_10000BC0C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;
  int v7;

  if (!sub_100004C0C(a1))
    return 0;
  v7 = 0;
  v3 = sub_10000CFB0(a2, 55, &v7, 0);
  v4 = 0;
  if (v3)
  {
    v5 = v7;
    if (v7 >= 1)
    {
      while (*v3 != 108)
      {
        ++v3;
        if (!--v5)
          return 0;
      }
      return 1;
    }
  }
  return v4;
}

uint64_t sub_10000BC8C(uint64_t a1, int a2, int a3, _DWORD *a4, char *a5, _OWORD *a6, uint64_t *a7)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *v19;
  int v21;
  void *v22;

  if (byte_10001C0B0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v21 = 136315138;
    v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "sending a NAK: '%s'", (uint8_t *)&v21, 0xCu);
  }
  v14 = sub_100009900(a1, a2, a3, 6, a6, a7);
  v15 = v14;
  if (v14)
  {
    *(_DWORD *)(v14 + 12) = 0;
    *(_DWORD *)(v14 + 16) = 0;
    if (a5 && (v16 = strlen(a5), sub_10000D334((uint64_t)a7, 56, v16, a5)))
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        return 0;
      v17 = sub_10000D54C(a7);
      v21 = 136315138;
      v22 = (void *)v17;
      v18 = "dhcpd: couldn't add NAK message type: %s";
    }
    else
    {
      if (!sub_10000D334((uint64_t)a7, 255, 0, 0))
      {
        *a4 = 6;
        return v15;
      }
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        return 0;
      v19 = sub_10000D54C(a7);
      v21 = 136315138;
      v22 = (void *)v19;
      v18 = "dhcpd: couldn't add end tag: %s";
    }
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v21, 0xCu);
    return 0;
  }
  return v15;
}

_BYTE *sub_10000BE7C(uint64_t a1, int a2)
{
  _BYTE *result;
  uint64_t v5;
  int v6;

  if (a2 < 1)
    return 0;
  result = malloc_type_malloc((a2 + 1), 0xF5130B02uLL);
  v5 = 0;
  do
  {
    v6 = *(unsigned __int8 *)(a1 + v5);
    if (v6 == 10 || v6 == 0)
      LOBYTE(v6) = 46;
    result[v5++] = v6;
  }
  while (a2 != v5);
  result[a2] = 0;
  return result;
}

uint64_t sub_10000BEEC(unsigned int *a1, char *__s1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  if (!(_DWORD)v2)
    return 0;
  for (i = *((_QWORD *)a1 + 1) + 16; strcmp(__s1, *(const char **)(i - 16)); i += 24)
  {
    if (!--v2)
      return 0;
  }
  if (*(_DWORD *)(i - 8))
    return **(_QWORD **)i;
  else
    return 0;
}

uint64_t sub_10000BF58(_QWORD *a1, in_addr_t a2)
{
  uint64_t v6;
  unint64_t v7;
  in_addr v8;
  int v9;
  char *v10;
  __int16 v11;
  int v12;

  if (sub_100009480(a2, 0, 0) || sub_100013068((uint64_t *)&xmmword_10001D4C8, a2))
    return 1;
  v6 = qword_10001D4E0;
  if (qword_10001D4E0)
  {
    while (*(_DWORD *)(v6 + 16) != a2)
    {
      v6 = *(_QWORD *)v6;
      if (!v6)
        return 0;
    }
    v7 = *a1 - *(_QWORD *)(v6 + 296);
    if (v7 <= 0x3B)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v8.s_addr = a2;
        v9 = 136315394;
        v10 = inet_ntoa(v8);
        v11 = 1024;
        v12 = 60 - v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "dhcpd: %s will remain pending %d secs", (uint8_t *)&v9, 0x12u);
      }
      return 1;
    }
    hostfree(&qword_10001D4E0, (_QWORD *)v6);
  }
  return 0;
}

uint64_t sub_10000C09C(int a1)
{
  if (a1 < 0)
    return 0;
  else
    return close(a1);
}

uint64_t sub_10000C0AC()
{
  uint64_t v0;
  int i;
  int v3;
  char __str[256];

  snprintf(__str, 0x100uLL, "/dev/bpf%d", 0);
  v0 = open(__str, 2, 0);
  if ((v0 & 0x80000000) != 0)
  {
    if (*__error() != 16)
      return v0;
    for (i = 1; ; ++i)
    {
      snprintf(__str, 0x100uLL, "/dev/bpf%d", i);
      v0 = open(__str, 2, 0);
      if ((v0 & 0x80000000) == 0)
        break;
      if (*__error() != 16)
        return v0;
    }
  }
  v3 = 900;
  ioctl(v0, 0x8004427BuLL, &v3);
  return v0;
}

uint64_t sub_10000C1B4(int a1, uint64_t a2)
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  __strlcpy_chk(v4, a2, 16, 16);
  return ioctl(a1, 0x8020426CuLL, v4);
}

uint64_t sub_10000C234(int a1)
{
  _QWORD v2[2];
  uint64_t v3;

  v3 = 6;
  v2[1] = &v3;
  v2[0] = 1;
  return ioctl(a1, 0x80104267uLL, v2);
}

ssize_t sub_10000C2A4(int a1, const void *a2, int a3)
{
  return write(a1, a2, a3);
}

void sub_10000C2BC(const void **a1)
{
  const void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

CFPropertyListRef sub_10000C2EC(const char *a1)
{
  off_t st_size;
  void *v3;
  void *v4;
  int v5;
  int v6;
  const __CFData *v7;
  const __CFData *v8;
  CFPropertyListRef v9;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  if (stat(a1, &v11) < 0)
    return 0;
  st_size = v11.st_size;
  if (!v11.st_size)
    return 0;
  v3 = malloc_type_malloc(v11.st_size, 0xE2EAFFC1uLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = open(a1, 0);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    read(v5, v4, st_size);
    close(v6);
  }
  v7 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)v4, st_size, kCFAllocatorNull);
  if (v7)
  {
    v8 = v7;
    v9 = CFPropertyListCreateWithData(0, v7, 0, 0, 0);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  free(v4);
  return v9;
}

uint64_t sub_10000C3E8(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
{
  int v8;
  CFIndex usedBufLen;
  CFRange v11;

  usedBufLen = 0;
  v11.length = CFStringGetLength(a1);
  v11.location = 0;
  CFStringGetBytes(a1, v11, 0x8000100u, 0, a4, a2, a3 - 1, &usedBufLen);
  v8 = usedBufLen;
  if (a2)
    a2[usedBufLen] = 0;
  return (v8 + 1);
}

uint64_t sub_10000C46C(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  CFIndex Count;
  CFIndex v9;
  signed int v10;
  UInt8 *v12;
  CFIndex v13;
  const __CFString *ValueAtIndex;
  CFTypeID TypeID;
  int v16;
  int v17;

  Count = CFArrayGetCount(a1);
  v9 = Count;
  v10 = 8 * Count;
  if (a2)
  {
    if ((int)*a3 < v10)
      return 0;
    v12 = (UInt8 *)(a2 + v10);
  }
  else
  {
    v12 = 0;
  }
  if (Count >= 1)
  {
    v13 = 0;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v13);
      TypeID = CFStringGetTypeID();
      if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != TypeID)
        return 0;
      if (a2)
      {
        v16 = *a3 - v10;
        if (v16 < 0)
          return 0;
        v17 = sub_10000C3E8(ValueAtIndex, v12, v16, 0);
        *(_QWORD *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }
      else
      {
        v17 = sub_10000C3E8(ValueAtIndex, v12, 0, 0);
      }
      v10 += v17;
    }
    while (v9 != ++v13);
  }
  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1;
}

void *sub_10000C580(const __CFArray *a1, _DWORD *a2)
{
  void *v4;
  size_t size;

  size = 0;
  *a2 = 0;
  if (!sub_10000C46C(a1, 0, (unsigned int *)&size, (_DWORD *)&size + 1))
    return 0;
  v4 = malloc_type_malloc((int)size, 0xA7A2F498uLL);
  if (!sub_10000C46C(a1, (uint64_t)v4, (unsigned int *)&size, (_DWORD *)&size + 1))
  {
    free(v4);
    return 0;
  }
  *a2 = HIDWORD(size);
  return v4;
}

uint64_t sub_10000C614(const __CFString *a1, in_addr *a2)
{
  CFTypeID TypeID;
  uint64_t result;
  char buffer[64];

  a2->s_addr = 0;
  TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 0;
  result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if ((_DWORD)result)
    return inet_aton(buffer, a2) == 1;
  return result;
}

uint64_t sub_10000C6C4(const __CFString *a1, _DWORD *a2)
{
  unint64_t v3;
  int v4;
  char __str[64];

  sub_10000C3E8(a1, (UInt8 *)__str, 64, 0);
  v3 = strtoul(__str, 0, 0);
  if (v3 == -1)
    return 0;
  v4 = v3;
  if (*__error() == 34)
    return 0;
  *a2 = v4;
  return 1;
}

uint64_t sub_10000C760(const __CFString *a1, _DWORD *a2)
{
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v6;
  CFTypeID v7;

  TypeID = CFStringGetTypeID();
  if (!a1)
  {
    CFBooleanGetTypeID();
    CFNumberGetTypeID();
    return 0;
  }
  if (CFGetTypeID(a1) == TypeID)
    return (sub_10000C6C4(a1, a2) & 1) != 0;
  v6 = CFBooleanGetTypeID();
  if (CFGetTypeID(a1) != v6)
  {
    v7 = CFNumberGetTypeID();
    if (CFGetTypeID(a1) == v7)
    {
      result = CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, a2);
      if (!(_DWORD)result)
        return result;
      return 1;
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

UInt8 *sub_10000C820(const __CFString *a1, CFRange a2, CFStringEncoding a3)
{
  CFIndex length;
  CFIndex location;
  UInt8 *v7;
  CFIndex maxBufLen;
  CFRange v10;

  length = a2.length;
  location = a2.location;
  maxBufLen = 0;
  CFStringGetBytes(a1, a2, a3, 0, 0, 0, 0, &maxBufLen);
  if (!maxBufLen)
    return 0;
  v7 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x10A3B885uLL);
  v10.location = location;
  v10.length = length;
  CFStringGetBytes(a1, v10, a3, 0, 0, v7, maxBufLen, &maxBufLen);
  v7[maxBufLen] = 0;
  return v7;
}

UInt8 *sub_10000C8D4(const __CFString *a1, CFStringEncoding a2)
{
  CFRange v5;

  v5.length = CFStringGetLength(a1);
  v5.location = 0;
  return sub_10000C820(a1, v5, a2);
}

CFDataRef sub_10000C908(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0, theString, 0x8000100u, 0);
}

char *sub_10000C920(unsigned int a1)
{
  if (a1 <= 0xE)
    return (char *)&unk_100018670 + 24 * a1;
  else
    return 0;
}

void sub_10000C93C(CFMutableStringRef theString, int a2, unsigned __int8 *a3, uint64_t a4)
{
  int v4;
  uint64_t v7;
  const char *v8;
  unsigned __int8 *v9;
  uint64_t i;
  const char *v11;
  int v12;
  unsigned __int8 *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;

  v4 = a4;
  switch(a2)
  {
    case 1:
      CFStringAppendFormat(theString, 0, CFSTR("\n"));
      sub_100010A78(theString, (uint64_t)a3, v4);
      return;
    case 2:
      if (*a3)
        v8 = "TRUE";
      else
        v8 = "FALSE";
      CFStringAppendFormat(theString, 0, CFSTR("%s"), v8);
      return;
    case 3:
      v7 = *a3;
      goto LABEL_10;
    case 4:
      v7 = bswap32(*(unsigned __int16 *)a3) >> 16;
      goto LABEL_10;
    case 5:
    case 6:
      v7 = bswap32(*(_DWORD *)a3);
LABEL_10:
      CFStringAppendFormat(theString, 0, CFSTR("0x%x"), v7);
      return;
    case 9:
      CFStringAppendFormat(theString, 0, CFSTR("%.*s"), a4, a3);
      return;
    case 10:
      CFStringAppendFormat(theString, 0, CFSTR("%d.%d.%d.%d"), *a3, a3[1], a3[2], a3[3]);
      return;
    case 13:
      v20 = 0;
      v9 = (unsigned __int8 *)sub_10000E150((uint64_t)a3, a4, &v20);
      CFStringAppendFormat(theString, 0, CFSTR("{"));
      if (!v9)
        goto LABEL_29;
      if (v20 >= 1)
      {
        for (i = 0; i < v20; CFStringAppendFormat(theString, 0, CFSTR("%s%s"), v11, *(_QWORD *)&v9[8 * i++]))
        {
          if (i)
            v11 = ", ";
          else
            v11 = "";
        }
      }
      break;
    case 14:
      v19 = 0;
      v9 = (unsigned __int8 *)sub_10000EA90(a3, a4, &v19);
      CFStringAppendFormat(theString, 0, CFSTR("{"));
      if (!v9)
        goto LABEL_29;
      if (v19 >= 1)
      {
        v12 = 0;
        v13 = v9;
        do
        {
          if (v12)
            v14 = "; ";
          else
            v14 = "";
          CFStringAppendFormat(theString, 0, CFSTR("%s%d.%d.%d.%d/%d, %d.%d.%d.%d"), v14, *v13, v13[1], v13[2], v13[3], *((unsigned int *)v13 + 1), v13[8], v13[9], v13[10], v13[11]);
          ++v12;
          v13 += 12;
        }
        while (v12 < v19);
      }
      break;
    default:
      return;
  }
  free(v9);
LABEL_29:
  CFStringAppendFormat(theString, 0, CFSTR("}"), v15, v16, v17, v18);
}

void sub_10000CBD8(CFMutableStringRef theString, unsigned int a2, unsigned __int8 *a3, uint64_t a4)
{
  unsigned __int8 *v4;
  unsigned int v6;
  uint64_t v7;
  int v8;
  int i;

  v4 = a3;
  if (a2 <= 0xE && (v6 = *((_DWORD *)&unk_100018670 + 6 * a2 + 1)) != 0)
  {
    if (v6 <= 0xE)
    {
      v7 = *((int *)&unk_100018670 + 6 * v6);
      v8 = (int)a4 / (int)v7;
      CFStringAppendFormat(theString, 0, CFSTR("{"));
      if (v8 >= 1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (i)
            CFStringAppendFormat(theString, 0, CFSTR(", "));
          sub_10000C93C(theString, v6, v4, v7);
          v4 += v7;
        }
      }
      CFStringAppendFormat(theString, 0, CFSTR("}"));
    }
  }
  else
  {
    sub_10000C93C(theString, a2, a3, a4);
  }
}

BOOL sub_10000CCF0(CFMutableStringRef theString, unsigned __int8 *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t v7;
  const char *v8;
  uint64_t v10;

  v3 = *a2;
  v4 = *((_DWORD *)&unk_1000187D8 + 4 * v3);
  if (v4 >= 0xF)
  {
    CFStringAppendFormat(theString, 0, CFSTR("unknown type %d\n"), *((unsigned int *)&unk_1000187D8 + 4 * v3));
  }
  else
  {
    v5 = a2[1];
    v6 = a2 + 2;
    CFStringAppendFormat(theString, 0, CFSTR("%s (%s): "), *((_QWORD *)&unk_1000187D8 + 2 * v3 + 1), *((_QWORD *)&unk_100018670 + 3 * v4 + 1));
    if ((_DWORD)v3 == 53)
    {
      v7 = *v6;
      if (v7 > 8)
        v8 = "<unknown>";
      else
        v8 = (&off_1000197D8)[v7];
      CFStringAppendFormat(theString, 0, CFSTR("%s "), v8);
    }
    sub_10000CBD8(theString, v4, v6, v5);
    CFStringAppendFormat(theString, 0, CFSTR("\n"), v10);
  }
  return v4 < 0xF;
}

char *sub_10000CE00(unsigned int a1)
{
  if (a1 <= 0xFF)
    return (char *)&unk_1000187D8 + 16 * a1;
  else
    return 0;
}

uint64_t sub_10000CE18(char *__s2)
{
  uint64_t v2;
  const char **i;
  const char *v4;
  unsigned int v5;

  v2 = 0;
  for (i = (const char **)&off_1000187E0; strcmp(*i, __s2); i += 2)
  {
    if (++v2 == 256)
    {
      if (!strncmp(__s2, "option_", 7uLL))
        v4 = __s2 + 7;
      else
        v4 = __s2;
      v5 = strtoul(v4, 0, 10);
      if (v5 >= 0x101uLL)
        return 0xFFFFFFFFLL;
      else
        return v5;
    }
  }
  return v2;
}

uint64_t sub_10000CEB4(_QWORD *a1, unsigned __int8 *a2, int a3, char *a4)
{
  int v8;
  uint64_t v9;

  if (a4)
    *a4 = 0;
  sub_1000105C4(a1);
  if (a3 < 1)
  {
    v8 = 0;
    if ((a3 & 0x80000000) == 0)
      return 1;
    goto LABEL_16;
  }
  while (1)
  {
    v8 = *a2;
    if (*a2)
      break;
    ++a2;
    --a3;
LABEL_9:
    if (a3 <= 0)
      goto LABEL_14;
  }
  if (v8 != 255)
  {
    if (a3 < 2)
      goto LABEL_16;
    v9 = a2[1];
    sub_1000106BC((uint64_t)a1, (uint64_t)a2);
    a3 -= v9 + 2;
    a2 += v9 + 2;
    goto LABEL_9;
  }
  sub_1000106BC((uint64_t)a1, (uint64_t)a2);
  --a3;
LABEL_14:
  if ((a3 & 0x80000000) == 0)
    return 1;
LABEL_16:
  if (a4)
    snprintf(a4, 0x100uLL, "parse failed near tag %d", v8);
  sub_1000105CC((uint64_t)a1);
  return 0;
}

unsigned __int8 *sub_10000CFB0(uint64_t a1, int a2, _DWORD *a3, int *a4)
{
  unsigned __int8 *result;
  int v9;
  unsigned __int8 *v10;

  result = 0;
  if (a2 && a2 != 255)
  {
    if (a4)
      v9 = *a4;
    else
      v9 = 0;
    while (1)
    {
      if (v9 >= (int)sub_1000105F8(a1))
        return 0;
      v10 = (unsigned __int8 *)sub_100010614(a1, v9);
      if (*v10 == a2)
        break;
      ++v9;
    }
    if (a3)
      *a3 = v10[1];
    if (a4)
      *a4 = v9 + 1;
    return v10 + 2;
  }
  return result;
}

uint64_t sub_10000D05C(_QWORD *a1, uint64_t a2, unsigned int a3, char *a4)
{
  uint64_t result;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  _QWORD v11[2];
  int v12;

  sub_1000105C4(a1);
  if (a4)
  {
    *a4 = 0;
    if (a3 <= 0xEF)
    {
      snprintf(a4, 0x100uLL, "packet is too short: %d < %d", a3, 240);
      return 0;
    }
    if (*(_DWORD *)(a2 + 236) != 1666417251)
    {
      result = 0;
      strcpy(a4, "missing magic number");
      return result;
    }
  }
  else if (a3 < 0xF0 || *(_DWORD *)(a2 + 236) != 1666417251)
  {
    return 0;
  }
  result = sub_10000CEB4(a1, (unsigned __int8 *)(a2 + 240), a3 - 240, a4);
  if ((_DWORD)result)
  {
    v12 = 0;
    v9 = sub_10000CFB0((uint64_t)a1, 52, &v12, 0);
    if (v9 && v12 == 1)
    {
      v10 = v9;
      v11[0] = 0;
      v11[1] = 0;
      sub_1000105C4(v11);
      if ((*v10 | 2) == 3 && sub_10000CEB4(v11, (unsigned __int8 *)(a2 + 108), 128, 0))
      {
        sub_100010828((uint64_t)a1, (uint64_t)v11);
        sub_1000105CC((uint64_t)v11);
      }
      if ((*v10 & 0xFE) == 2)
      {
        if (sub_10000CEB4(v11, (unsigned __int8 *)(a2 + 44), 64, 0))
        {
          sub_100010828((uint64_t)a1, (uint64_t)v11);
          sub_1000105CC((uint64_t)v11);
        }
      }
    }
    return 1;
  }
  return result;
}

uint64_t sub_10000D1EC(__CFString *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  int v6;
  unsigned __int8 *v7;

  v4 = sub_1000105F8(a2);
  CFStringAppendFormat(a1, 0, CFSTR("Options count is %d\n"), v4);
  result = sub_1000105F8(a2);
  if ((int)result >= 1)
  {
    v6 = 0;
    do
    {
      v7 = (unsigned __int8 *)sub_100010614(a2, v6);
      if (!sub_10000CCF0(a1, v7))
        CFStringAppendFormat(a1, 0, CFSTR("undefined tag %d len %d\n"), *v7, v7[1]);
      ++v6;
      result = sub_1000105F8(a2);
    }
    while (v6 < (int)result);
  }
  return result;
}

double sub_10000D2B0(uint64_t a1, void *a2, int a3, int a4)
{
  double result;

  bzero(a2, a3);
  result = 0.0;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_QWORD *)a1 = 287454020;
  *(_QWORD *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  *(_DWORD *)(a1 + 296) = a4;
  return result;
}

double sub_10000D32C(uint64_t a1, void *a2, int a3)
{
  return sub_10000D2B0(a1, a2, a3, 1);
}

uint64_t sub_10000D334(uint64_t a1, int a2, int a3, void *__src)
{
  char *v5;
  const char *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;

  *(_BYTE *)(a1 + 40) = 0;
  v5 = (char *)(a1 + 40);
  if (a3 >= 256)
  {
    snprintf(v5, 0x100uLL, "tag %d option %d > %d", __src);
    return 1;
  }
  if (*(_QWORD *)a1 != 287454020)
  {
    v6 = "dhcpoa_t not initialized - internal error!!!";
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 24))
  {
    v6 = "attempt to add data after end tag";
LABEL_7:
    __strlcpy_chk(v5, v6, 256, 256);
    return 1;
  }
  if (a2)
  {
    if (a2 == 255)
    {
      v8 = *(int *)(a1 + 20);
      if ((int)v8 >= *(_DWORD *)(a1 + 16))
      {
        snprintf(v5, 0x100uLL, "can't add end tag %d > %d", __src);
        return 1;
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 8) + v8) = -1;
      ++*(_DWORD *)(a1 + 20);
      *(_DWORD *)(a1 + 24) = 1;
      goto LABEL_24;
    }
    v11 = a3 + 2;
    v12 = *(int *)(a1 + 20);
    if (a3 + 2 + (int)v12 + *(_DWORD *)(a1 + 296) > *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add tag %d (%d > %d)", __src);
      return 2;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 8) + v12) = a2;
    *(_BYTE *)(*(int *)(a1 + 20) + *(_QWORD *)(a1 + 8) + 1) = a3;
    if (a3)
      memmove((void *)(*(int *)(a1 + 20) + *(_QWORD *)(a1 + 8) + 2), __src, a3);
    v13 = *(_DWORD *)(a1 + 28);
    v14 = *(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 28) = v14;
    *(_DWORD *)(a1 + 32) = v13;
    v10 = v11 + v14;
  }
  else
  {
    v9 = *(int *)(a1 + 20);
    if (*(_DWORD *)(a1 + 296) + (int)v9 >= *(_DWORD *)(a1 + 16))
    {
      snprintf(v5, 0x100uLL, "can't add pad tag %d > %d", __src);
      return 2;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 8) + v9) = 0;
    v10 = *(_DWORD *)(a1 + 20) + 1;
  }
  *(_DWORD *)(a1 + 20) = v10;
LABEL_24:
  result = 0;
  ++*(_DWORD *)(a1 + 36);
  return result;
}

uint64_t sub_10000D4F8(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)result == 287454020)
      return *(unsigned int *)(result + 20);
    else
      return 0;
  }
  return result;
}

uint64_t sub_10000D520(uint64_t a1, char a2)
{
  char __src;

  __src = a2;
  return sub_10000D334(a1, 53, 1, &__src);
}

const char *sub_10000D54C(uint64_t *a1)
{
  const char *result;
  _QWORD *v3;
  uint64_t v4;

  result = "<bad parameter>";
  if (a1)
  {
    v4 = *a1;
    v3 = a1 + 5;
    if (v4 == 287454020)
      return (const char *)v3;
  }
  return result;
}

uint64_t sub_10000D574(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)result == 287454020)
      return *(unsigned int *)(result + 36);
    else
      return 0;
  }
  return result;
}

void sub_10000D59C(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v6;
  _QWORD v7[2];

  v3 = a3;
  if (a3 > 0xEB)
  {
    v7[0] = 0;
    v7[1] = 0;
    sub_10000CEAC(v7);
    sub_10000D05C(v7, (uint64_t)a2, v3, 0);
    sub_10000D630(theString, a2, v6, (uint64_t)v7);
    sub_10000CEB0((uint64_t)v7);
  }
  else
  {
    CFStringAppendFormat(theString, 0, CFSTR("Packet is too short %d < %d\n"), a3, 236);
  }
}

void sub_10000D630(__CFString *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  int v7;
  unsigned int v8;
  const char *v9;
  int v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  uint64_t i;
  char v16[16];

  CFStringAppendFormat(a1, 0, CFSTR("op = "));
  v7 = *a2;
  if (v7 == 2)
  {
    CFStringAppendFormat(a1, 0, CFSTR("BOOTREPLY\n"));
  }
  else if (v7 == 1)
  {
    CFStringAppendFormat(a1, 0, CFSTR("BOOTREQUEST\n"));
  }
  else
  {
    CFStringAppendFormat(a1, 0, CFSTR("OP(%d)\n"), *a2);
  }
  CFStringAppendFormat(a1, 0, CFSTR("htype = %d\n"), a2[1]);
  CFStringAppendFormat(a1, 0, CFSTR("flags = 0x%x\n"), bswap32(*((unsigned __int16 *)a2 + 5)) >> 16);
  v8 = a2[2];
  if (v8 >= 0x11)
  {
    v10 = 16;
    CFStringAppendFormat(a1, 0, CFSTR("hlen = %d (invalid > %lu)\n"), a2[2], 16);
    v9 = "[truncated] ";
  }
  else
  {
    CFStringAppendFormat(a1, 0, CFSTR("hlen = %d\n"), a2[2]);
    v9 = "";
    v10 = v8;
  }
  CFStringAppendFormat(a1, 0, CFSTR("hops = %d\n"), a2[3]);
  CFStringAppendFormat(a1, 0, CFSTR("xid = 0x%lx\n"), bswap32(*((_DWORD *)a2 + 1)));
  CFStringAppendFormat(a1, 0, CFSTR("secs = %hu\n"), bswap32(*((unsigned __int16 *)a2 + 4)) >> 16);
  v11 = inet_ntop(2, a2 + 12, v16, 0x10u);
  CFStringAppendFormat(a1, 0, CFSTR("ciaddr = %s\n"), v11);
  v12 = inet_ntop(2, a2 + 16, v16, 0x10u);
  CFStringAppendFormat(a1, 0, CFSTR("yiaddr = %s\n"), v12);
  v13 = inet_ntop(2, a2 + 20, v16, 0x10u);
  CFStringAppendFormat(a1, 0, CFSTR("siaddr = %s\n"), v13);
  v14 = inet_ntop(2, a2 + 24, v16, 0x10u);
  CFStringAppendFormat(a1, 0, CFSTR("giaddr = %s\n"), v14);
  CFStringAppendFormat(a1, 0, CFSTR("chaddr = %s"), v9);
  if (v10)
  {
    for (i = 0; i != v10; CFStringAppendFormat(a1, 0, CFSTR("%0x"), a2[i++ + 28]))
    {
      if (i)
        CFStringAppendFormat(a1, 0, CFSTR(":"));
    }
  }
  CFStringAppendFormat(a1, 0, CFSTR("\n"));
  CFStringAppendFormat(a1, 0, CFSTR("sname = %.*s\n"), 64, a2 + 44);
  CFStringAppendFormat(a1, 0, CFSTR("file = %.*s\n"), 128, a2 + 108);
  if (a4)
  {
    if ((int)sub_10000CEA8(a4) >= 1)
    {
      CFStringAppendFormat(a1, 0, CFSTR("options:\n"));
      sub_10000D1EC(a1, a4);
    }
  }
}

void *sub_10000D994(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
{
  _DWORD *v5;
  void *v6;
  uint64_t v7;
  int v8;
  __int128 *v9;
  int v10;
  uint64_t v11;
  const char *v12;
  int v13;
  char *v14;
  _OWORD *v15;
  char *v16;
  uint64_t v17;
  size_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int8 *v32;
  size_t v33;
  unsigned __int8 *v34;
  int v35;
  BOOL v36;
  char v37;
  unsigned int v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v52;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  __int16 __src;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;

  v5 = a4;
  v6 = a3;
  if (!a2)
    goto LABEL_5;
  v7 = a1;
  v8 = *a4;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  if (!a3)
  {
    *(_QWORD *)&v68 = 0;
    v67 = 0uLL;
    v65 = 0uLL;
    v66 = 0uLL;
    v63 = 0uLL;
    v64 = 0uLL;
    v61 = 0uLL;
    v62 = 0uLL;
    v8 = 128;
    v9 = &v59;
    v59 = 0uLL;
    v60 = 0uLL;
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    v10 = 0;
    goto LABEL_85;
  }
  v67 = 0uLL;
  *(_QWORD *)&v68 = 0;
  v65 = 0uLL;
  v66 = 0uLL;
  v63 = 0uLL;
  v64 = 0uLL;
  v61 = 0uLL;
  v62 = 0uLL;
  v59 = 0uLL;
  v60 = 0uLL;
  v9 = (__int128 *)a3;
  LOBYTE(v67) = 1;
LABEL_7:
  *((_QWORD *)&v67 + 1) = v9;
  DWORD1(v68) = v8;
  *((_QWORD *)&v68 + 1) = 0;
  *(_QWORD *)&v69 = 0;
  BYTE8(v69) = a5;
  if (a2 < 1)
  {
    v10 = 0;
LABEL_67:
    if (!v6)
    {
      v6 = malloc_type_malloc(v10, 0x64155627uLL);
      memcpy(v6, *((const void **)&v67 + 1), v10);
    }
    goto LABEL_84;
  }
  v11 = 0;
  v52 = a2;
  while (1)
  {
    v54 = v11;
    v12 = *(const char **)(v7 + 8 * v11);
    v55 = v68;
    v13 = strlen(v12);
    v14 = (char *)malloc_type_malloc(v13 + 26, 0xA1EABF7AuLL);
    v15 = malloc_type_malloc(0x30uLL, 0x101004044458BAAuLL);
    if (v15)
    {
      *(_OWORD *)((char *)v15 + 28) = 0u;
      *v15 = 0u;
      v15[1] = 0u;
      *((_DWORD *)v15 + 11) = 8;
      *((_QWORD *)v15 + 4) = v15;
    }
    v16 = v14 + 24;
    *(_QWORD *)v14 = v15;
    *((_QWORD *)v14 + 1) = v14 + 24;
    if ((v13 & 0x80000000) == 0)
      break;
    v19 = 0;
LABEL_22:
    *((_DWORD *)v14 + 4) = v19 + 1;
    v16[v19] = 0;
    if (!BYTE8(v69))
    {
      if ((sub_10000E69C((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
        goto LABEL_75;
      goto LABEL_64;
    }
    v57 = v69;
    if ((int)v69 < 1)
    {
      v24 = 0;
LABEL_41:
      if ((sub_10000E69C((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
      {
LABEL_75:
        if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68))
        {
          fprintf(__stderrp, "trying to set used to %d\n", v55);
          v7 = a1;
        }
        else
        {
          LODWORD(v68) = v55;
          v7 = a1;
        }
        sub_10000E784((_QWORD **)v14);
        free(v14);
        goto LABEL_80;
      }
      v23 = 0;
      v38 = 0;
      v37 = 1;
      goto LABEL_43;
    }
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v56 = *((_QWORD *)&v68 + 1);
    v25 = *((_QWORD *)&v67 + 1);
    do
    {
      v26 = *(_QWORD *)(v56 + 8 * v22);
      if (!v26)
        break;
      v27 = 0;
      v28 = *(unsigned int *)(v26 + 40);
      v29 = *(_QWORD **)v14;
      v30 = *(unsigned int *)(*(_QWORD *)v14 + 40);
      do
      {
        v31 = v27;
        if ((int)v28 < 1)
          break;
        if ((int)v30 < 1)
          break;
        v32 = (unsigned __int8 *)(v25 + *(unsigned int *)(*(_QWORD *)(v26 + 32) + 4 * v28 - 4));
        v33 = *v32;
        v34 = (unsigned __int8 *)(*((_QWORD *)v14 + 1) + *(unsigned int *)(v29[4] + 4 * v30 - 4));
        if ((_DWORD)v33 != *v34)
          break;
        v35 = memcmp(v32 + 1, v34 + 1, v33);
        v27 = v31 + 1;
        --v28;
        --v30;
      }
      while (!v35);
      v36 = v31 > v24;
      if ((int)v31 > (int)v24)
        v24 = v31;
      if (v36)
        v23 = v26;
      ++v22;
    }
    while (v22 != v57);
    if (!v23)
      goto LABEL_41;
    v37 = 0;
    v38 = *(_DWORD *)(v23 + 40) - v24;
LABEL_43:
    v39 = *(_QWORD **)v14;
    v40 = *(unsigned int *)(*(_QWORD *)v14 + 40);
    if ((int)v40 >= 1)
    {
      v41 = 0;
      v42 = v40 - v24;
      do
      {
        if (v41 >= (int)v42)
        {
          v45 = *(_DWORD *)(*(_QWORD *)(v23 + 32) + 4 * (int)v38);
          if (v42 == v41)
          {
            __src = bswap32(v45 | 0xC000) >> 16;
            if (!sub_10000E69C((uint64_t)&v59, &__src, 2))
              goto LABEL_75;
          }
          ++v38;
          v43 = *(_QWORD **)v14;
        }
        else
        {
          v43 = *(_QWORD **)v14;
          v44 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)v14 + 32) + 4 * v41);
          if ((v37 & 1) == 0)
          {
            if (!sub_10000E69C((uint64_t)&v59, (void *)(*((_QWORD *)v14 + 1) + v44), *(unsigned __int8 *)(*((_QWORD *)v14 + 1) + v44) + 1))goto LABEL_75;
            v43 = *(_QWORD **)v14;
          }
          v45 = v44 + v55;
        }
        if (v41 > *((int *)v43 + 10))
          fprintf(__stderrp, "attempt to set offset 0x%x at index %d\n", v45, v41);
        *(_DWORD *)(v43[4] + 4 * v41++) = v45;
      }
      while (v40 != v41);
      v39 = *(_QWORD **)v14;
    }
    v46 = SDWORD1(v69);
    if (DWORD1(v69) == (_DWORD)v69)
    {
      if (DWORD1(v69))
      {
        DWORD1(v69) *= 2;
        v47 = reallocf(*((void **)&v68 + 1), 16 * v46);
      }
      else
      {
        DWORD1(v69) = 8;
        v47 = malloc_type_malloc(0x40uLL, 0x2004093837F09uLL);
      }
      *((_QWORD *)&v68 + 1) = v47;
    }
    else
    {
      v47 = (_QWORD *)*((_QWORD *)&v68 + 1);
    }
    v48 = (int)v69;
    LODWORD(v69) = v69 + 1;
    v47[v48] = v39;
    *(_QWORD *)v14 = 0;
LABEL_64:
    sub_10000E784((_QWORD **)v14);
    free(v14);
    v7 = a1;
    v11 = v54 + 1;
    if (v54 + 1 == v52)
    {
      v10 = v68;
      v6 = a3;
      v5 = a4;
      goto LABEL_67;
    }
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  while (1)
  {
    if (v17 != v13)
    {
      v21 = v12[v17];
      if (v21 != 46)
      {
        ++v17;
        *(_BYTE *)(*((_QWORD *)v14 + 1) + v17) = v21;
        ++v20;
        goto LABEL_19;
      }
    }
    if (!v20)
    {
      fwrite("label length is 0\n", 0x12uLL, 1uLL, __stderrp);
      goto LABEL_71;
    }
    if (v20 >= 64)
      break;
    sub_10000E608(*(int **)v14, v18);
    *(_BYTE *)(*((_QWORD *)v14 + 1) + v18) = v20;
    v19 += v20 + 1;
    v18 = ++v17;
    v20 = 0;
LABEL_19:
    if (v17 == v13 + 1)
    {
      v16 = (char *)*((_QWORD *)v14 + 1);
      goto LABEL_22;
    }
  }
  fprintf(__stderrp, "label length %d > %d\n", v20, 63);
LABEL_71:
  sub_10000E784((_QWORD **)v14);
  free(v14);
  if ((v68 & 0x80000000) != 0 || (int)v68 > SDWORD1(v68))
    fprintf(__stderrp, "trying to set used to %d\n", v55);
  else
    LODWORD(v68) = v55;
LABEL_80:
  v5 = a4;
  fprintf(__stderrp, "failed to add %s\n", *(const char **)(v7 + 8 * v54));
  if (a3)
    v10 = v68;
  else
    v10 = 0;
  v6 = 0;
LABEL_84:
  sub_10000DFC8((uint64_t)&v59);
LABEL_85:
  *v5 = v10;
  return v6;
}

void sub_10000DFC8(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000E5B4((_OWORD *)a1);
  v3 = (void **)(a1 + 152);
  v2 = *(void **)(a1 + 152);
  if (v2)
  {
    if (*(int *)(a1 + 160) >= 1)
    {
      v4 = 0;
      v5 = 0;
      do
      {
        sub_10000E784((_QWORD **)(*(_QWORD *)(a1 + 152) + v4));
        ++v5;
        v4 += 8;
      }
      while (v5 < *(int *)(a1 + 160));
      v2 = *v3;
    }
    free(v2);
  }
  *v3 = 0;
  *(_QWORD *)(a1 + 160) = 0;
}

CFDataRef sub_10000E03C(const __CFArray *a1, char a2)
{
  void *v3;
  void *v4;
  UInt8 *v5;
  CFDataRef v6;
  CFIndex length;

  length = 0;
  v3 = sub_10000C580(a1, &length);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (UInt8 *)sub_10000D994((uint64_t)v3, length, 0, (_DWORD *)&length + 1, a2);
  free(v4);
  v6 = CFDataCreate(0, v5, SHIDWORD(length));
  free(v5);
  return v6;
}

CFDataRef sub_10000E0C4(const __CFString *a1)
{
  UInt8 *v1;
  UInt8 *v2;
  UInt8 *v3;
  CFDataRef v4;
  UInt8 *v6;
  CFIndex length;

  LODWORD(length) = 0;
  v1 = sub_10000C8D4(a1, 0x8000100u);
  v6 = v1;
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (UInt8 *)sub_10000D994((uint64_t)&v6, 1, 0, &length, 0);
  free(v2);
  if (!v3)
    return 0;
  v4 = CFDataCreate(0, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_10000E150(uint64_t a1, unsigned int a2, int *a3)
{
  int v4;
  int v5;
  char *v6;
  char *v7;
  uint64_t v8;
  int v9;
  _OWORD v11[8];
  void *__src[2];
  size_t __n;

  __src[0] = 0;
  memset(v11, 0, sizeof(v11));
  __src[1] = v11;
  __n = 0x8000000000;
  v4 = sub_10000E268(a1, a2, (uint64_t)v11, 0);
  v5 = v4;
  if (v4)
  {
    v6 = (char *)malloc_type_malloc((int)__n + 8 * v4, 0x1C7CB10DuLL);
    v7 = &v6[8 * v5];
    memcpy(v7, __src[1], (int)__n);
    if (v5 >= 1)
    {
      v8 = 0;
      do
      {
        *(_QWORD *)&v6[v8] = v7;
        v7 += strlen(v7) + 1;
        v8 += 8;
      }
      while (8 * v5 != v8);
    }
  }
  else
  {
    v6 = 0;
  }
  if (v6)
    v9 = v5;
  else
    v9 = 0;
  *a3 = v9;
  sub_10000E5B4(v11);
  return v6;
}

uint64_t sub_10000E268(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  size_t v7;
  size_t v8;
  unsigned int v9;
  char v10;
  unsigned int v11;
  unsigned __int8 *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  int v21;
  FILE *v22;
  const char *v23;
  size_t v24;
  char __src;
  _OWORD v29[2];
  void *v30[2];

  v4 = 0;
  if (a1 && a2)
  {
    v7 = 0;
    v8 = 0;
    v4 = 0;
    v9 = 0;
    v30[1] = (void *)0x800000000;
    memset(v29, 0, sizeof(v29));
    v30[0] = v29;
    v10 = 1;
    v11 = a2;
    do
    {
      v12 = (unsigned __int8 *)(a1 + v8);
      v13 = *v12;
      if ((~v13 & 0xC0) != 0)
      {
        if (v8 >= v7)
        {
          if (v13 >= 0x40)
          {
            fprintf(__stderrp, "label length %d > %d\n");
            goto LABEL_48;
          }
          v18 = v13 + 1;
          if (v11 <= v13)
          {
            fprintf(__stderrp, "label truncated %d < %d\n");
            goto LABEL_48;
          }
          v7 = v18 + v7;
          v11 -= v18;
        }
        if (*v12)
        {
          __src = 46;
          if (SLODWORD(v30[1]) < 1)
            goto LABEL_29;
          if (*(_DWORD *)v30[0] != (_DWORD)v8)
          {
            v19 = 1;
            do
            {
              v20 = v19;
              if (LODWORD(v30[1]) == v19)
                break;
              v21 = *((_DWORD *)v30[0] + v19++);
            }
            while (v21 != (_DWORD)v8);
            if (v20 >= LODWORD(v30[1]))
LABEL_29:
              sub_10000E608((int *)v29, v8);
          }
          if ((v10 & 1) == 0)
            sub_10000E69C(a3, &__src, 1);
          sub_10000E69C(a3, v12 + 1, v13);
          v10 = 0;
          v8 = v8 + v13 + 1;
        }
        else
        {
          __src = 0;
          v10 = 1;
          sub_10000E69C(a3, &__src, 1);
          v4 = (v4 + 1);
          v9 = v7;
          v8 = v7;
          if (a4)
            break;
        }
      }
      else
      {
        if (a4)
        {
          v22 = __stderrp;
          v23 = "single name with pointers\n";
          v24 = 26;
          goto LABEL_47;
        }
        if (v8 >= v7)
        {
          if (v11 <= 1)
          {
            v22 = __stderrp;
            v23 = "truncated pointer value\n";
            v24 = 24;
            goto LABEL_47;
          }
          v7 = (v7 + 2);
          v11 -= 2;
        }
        v14 = bswap32(*(_WORD *)v12 & 0xFF3F);
        if (v8 <= HIWORD(v14))
        {
          v22 = __stderrp;
          v23 = "pointer points at or ahead of current position\n";
          v24 = 47;
          goto LABEL_47;
        }
        v8 = HIWORD(v14);
        if (v9 <= v8)
        {
          v22 = __stderrp;
          v23 = "attempt to create infinite loop\n";
          v24 = 32;
          goto LABEL_47;
        }
        if (SLODWORD(v30[1]) < 1)
          goto LABEL_38;
        if (*(_DWORD *)v30[0] != (_DWORD)v8)
        {
          v15 = 1;
          do
          {
            v16 = v15;
            if (LODWORD(v30[1]) == v15)
              break;
            v17 = *((_DWORD *)v30[0] + v15++);
          }
          while (v17 != (_DWORD)v8);
          if (v16 >= LODWORD(v30[1]))
          {
LABEL_38:
            v22 = __stderrp;
            v23 = "attempt to point off into the weeds\n";
            v24 = 36;
            goto LABEL_47;
          }
        }
      }
    }
    while (v8 < a2);
    if ((_DWORD)v4)
      goto LABEL_49;
    v22 = __stderrp;
    if (*(_DWORD *)(a3 + 144))
    {
      v23 = "name missing end label\n";
      v24 = 23;
    }
    else
    {
      v23 = "empty list\n";
      v24 = 11;
    }
LABEL_47:
    fwrite(v23, v24, 1uLL, v22);
LABEL_48:
    sub_10000E5B4((_OWORD *)a3);
    v4 = 0;
LABEL_49:
    if (v30[0] && v30[0] != v29)
      free(v30[0]);
  }
  return v4;
}

double sub_10000E5B4(_OWORD *a1)
{
  _OWORD *v2;
  BOOL v3;
  double result;

  if (!*((_BYTE *)a1 + 128))
  {
    v2 = (_OWORD *)*((_QWORD *)a1 + 17);
    if (v2)
      v3 = v2 == a1;
    else
      v3 = 1;
    if (!v3)
      free(v2);
  }
  *((_QWORD *)a1 + 18) = 0;
  result = 0.0;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

int *sub_10000E608(int *result, size_t size)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = size;
  v3 = (uint64_t)result;
  v4 = result[11];
  if ((_DWORD)v4 == result[10])
  {
    result[11] = 2 * v4;
    v5 = (void *)*((_QWORD *)result + 4);
    if (v5 == (void *)v3)
    {
      v6 = malloc_type_malloc(8 * v4, 0x100004052888210uLL);
      *(_QWORD *)(v3 + 32) = v6;
      result = (int *)memmove(v6, (const void *)v3, 4 * *(int *)(v3 + 40));
    }
    else
    {
      result = (int *)reallocf(v5, 8 * v4);
      *(_QWORD *)(v3 + 32) = result;
    }
  }
  v7 = *(_QWORD *)(v3 + 32);
  v8 = *(int *)(v3 + 40);
  *(_DWORD *)(v3 + 40) = v8 + 1;
  *(_DWORD *)(v7 + 4 * v8) = v2;
  return result;
}

uint64_t sub_10000E69C(uint64_t a1, void *__src, int a3)
{
  int v6;
  int v7;
  int v9;
  int v10;
  void *v11;
  void *v12;

  v6 = *(_DWORD *)(a1 + 148);
  v7 = v6 - *(_DWORD *)(a1 + 144);
  if (v7 < a3)
  {
    if (*(_BYTE *)(a1 + 128))
    {
      fprintf(__stderrp, "user-supplied buffer failed to add data with length %d (> %d)\n", a3, v7);
      return 0;
    }
    if (a3 <= 128)
      v9 = 128;
    else
      v9 = a3;
    v10 = v6 + v9;
    *(_DWORD *)(a1 + 148) = v10;
    v11 = *(void **)(a1 + 136);
    if (v11 == (void *)a1)
    {
      v12 = malloc_type_malloc(v10, 0x6DA55C14uLL);
      *(_QWORD *)(a1 + 136) = v12;
      memcpy(v12, (const void *)a1, *(int *)(a1 + 144));
    }
    else
    {
      *(_QWORD *)(a1 + 136) = reallocf(v11, v10);
    }
  }
  memcpy((void *)(*(_QWORD *)(a1 + 136) + *(int *)(a1 + 144)), __src, a3);
  *(_DWORD *)(a1 + 144) += a3;
  return 1;
}

void sub_10000E784(_QWORD **a1)
{
  _QWORD *v2;
  _QWORD *v3;
  BOOL v4;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v3 = (_QWORD *)v2[4];
      if (v3)
        v4 = v3 == v2;
      else
        v4 = 1;
      if (!v4)
        free(v3);
      free(v2);
      *a1 = 0;
    }
  }
}

void *sub_10000E7CC(unsigned __int8 *a1, int a2, void *a3, int *a4)
{
  void *v5;
  int v6;
  unsigned __int8 *v7;
  int v8;
  __int128 *v9;
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  _DWORD v24[3];
  unsigned __int8 __src;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v5 = a3;
  v6 = 0;
  if (a1 && a2)
  {
    v7 = a1;
    if (a3)
    {
      v8 = *a4;
      if (!*a4)
      {
        v6 = 0;
        goto LABEL_26;
      }
      v29 = 0u;
      v30 = 0u;
      v31 = 0;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v9 = (__int128 *)a3;
      LOBYTE(v30) = 1;
    }
    else
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v8 = 64;
      v9 = &v26;
    }
    *((_QWORD *)&v30 + 1) = v9;
    HIDWORD(v31) = v8;
    if (a2 < 1)
    {
      v6 = 0;
      if (a3)
      {
LABEL_24:
        sub_10000EA44(&v26);
        goto LABEL_26;
      }
    }
    else
    {
      v10 = a2;
      do
      {
        __src = *((_DWORD *)v7 + 1);
        v11 = __src;
        if (__src > 0x20u || !sub_10000F494((uint64_t)&v26, &__src, 1uLL))
          goto LABEL_19;
        if (v11)
        {
          v12 = v11 & 0xF8;
          if ((v11 & 7) != 0)
            v12 = (v11 & 0xF8) + 8;
          if ((sub_10000F494((uint64_t)&v26, v7, v12 >> 3) & 1) == 0)
            goto LABEL_19;
        }
        if ((sub_10000F494((uint64_t)&v26, v7 + 8, 4uLL) & 1) == 0)
        {
LABEL_19:
          v13 = sub_10001453C();
          v14 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v13, v14))
          {
            v15 = _os_log_pack_size(26);
            v16 = (char *)v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
            v17 = __error();
            v18 = _os_log_pack_fill(v16, v15, *v17, &_mh_execute_header, "failed to add %d.%d.%d.%d", v24[0], v24[2], (_DWORD)v26, DWORD2(v26));
            v19 = *v7;
            v20 = v7[1];
            v21 = v7[2];
            v22 = v7[3];
            *(_DWORD *)v18 = 67109888;
            *(_DWORD *)(v18 + 4) = v19;
            *(_WORD *)(v18 + 8) = 1024;
            *(_DWORD *)(v18 + 10) = v20;
            *(_WORD *)(v18 + 14) = 1024;
            *(_DWORD *)(v18 + 16) = v21;
            *(_WORD *)(v18 + 20) = 1024;
            *(_DWORD *)(v18 + 22) = v22;
            __SC_log_send(5, v13, v14, v16);
          }
          v6 = 0;
          v5 = 0;
          goto LABEL_24;
        }
        v7 += 12;
        --v10;
      }
      while (v10);
      v6 = v31;
      if (v5)
        goto LABEL_24;
    }
    v5 = malloc_type_malloc(v6, 0xFED602F4uLL);
    memcpy(v5, *((const void **)&v30 + 1), v6);
    goto LABEL_24;
  }
LABEL_26:
  *a4 = v6;
  return v5;
}

double sub_10000EA44(_OWORD *a1)
{
  _OWORD *v2;
  BOOL v3;
  double result;

  if (!*((_BYTE *)a1 + 64))
  {
    v2 = (_OWORD *)*((_QWORD *)a1 + 9);
    if (v2)
      v3 = v2 == a1;
    else
      v3 = 1;
    if (!v3)
      free(v2);
  }
  *((_QWORD *)a1 + 10) = 0;
  result = 0.0;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

_DWORD *sub_10000EA90(unsigned __int8 *a1, int a2, _DWORD *a3)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v8;

  v4 = 0;
  LODWORD(v5) = 0;
  if (a1 && a2)
  {
    v8 = sub_10000EB40(a1, a2, 0, 0);
    v5 = v8;
    if (!(_DWORD)v8)
    {
LABEL_6:
      v4 = 0;
      goto LABEL_7;
    }
    v4 = malloc_type_malloc(12 * (int)v8, 0x10000403E1C8BA9uLL);
    if (sub_10000EB40(a1, a2, v4, v5) != (_DWORD)v5)
    {
      free(v4);
      LODWORD(v5) = 0;
      goto LABEL_6;
    }
  }
LABEL_7:
  *a3 = v5;
  return v4;
}

uint64_t sub_10000EB40(unsigned __int8 *a1, int a2, _DWORD *__dst, uint64_t a4)
{
  unsigned int v5;
  uint64_t v7;
  uint64_t v8;
  _DWORD *i;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int *v31;
  _DWORD *v32;
  uint64_t v34;
  uint64_t v35;

  if (a2 >= 1)
  {
    v5 = a2;
    v7 = 0;
    v34 = a4;
    v8 = (int)a4;
    for (i = __dst; ; i += 3)
    {
      v10 = *a1;
      if (v10 >= 0x21)
        break;
      LODWORD(v11) = v10 + 8;
      if ((v10 & 7) != 0)
        v11 = v11;
      else
        v11 = *a1;
      v12 = v11 >> 3;
      v13 = (v11 >> 3) + 5;
      v14 = v5 - v13;
      if (v5 < v13)
      {
        v21 = sub_10001453C();
        v22 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v21, v22))
        {
          v23 = _os_log_pack_size(14);
          v24 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
          v25 = __error();
          v26 = _os_log_pack_fill(v24, v23, *v25, &_mh_execute_header, "truncated descriptor %d < %d", v34, v35);
          *(_DWORD *)v26 = 67109376;
          *(_DWORD *)(v26 + 4) = v5;
          *(_WORD *)(v26 + 8) = 1024;
          *(_DWORD *)(v26 + 10) = v13;
          __SC_log_send(5, v21, v22, v24);
        }
        return 0;
      }
      if (__dst)
      {
        if (v7 >= v8)
        {
          v27 = sub_10001453C();
          v28 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v27, v28))
          {
            v29 = _os_log_pack_size(8);
            v30 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
            v31 = __error();
            v32 = (_DWORD *)_os_log_pack_fill(v30, v29, *v31, &_mh_execute_header, "supplied route list too small (%d elements)", v34);
            *v32 = 67109120;
            v32[1] = v34;
            __SC_log_send(5, v27, v28, v30);
          }
          return 0;
        }
        *i = 0;
        i[1] = v10;
        memcpy(i, a1 + 1, v11 >> 3);
        i[2] = *(_DWORD *)&a1[v12 + 1];
      }
      ++v7;
      a1 += v13;
      v5 -= v13;
      if (v14 <= 0)
        return v7;
    }
    v15 = sub_10001453C();
    v16 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v15, v16))
    {
      v17 = _os_log_pack_size(8);
      v18 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = __error();
      v20 = (_DWORD *)_os_log_pack_fill(v18, v17, *v19, &_mh_execute_header, "prefix length is %d (> 32)", v34);
      *v20 = 67109120;
      v20[1] = v10;
      __SC_log_send(5, v15, v16, v18);
    }
  }
  return 0;
}

in_addr *sub_10000EE58(const __CFArray *a1, _DWORD *a2)
{
  CFIndex Count;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  in_addr *v8;
  in_addr *v9;
  in_addr *v10;
  CFIndex v11;
  uint64_t v12;
  const __CFString *ValueAtIndex;
  const __CFString *v14;
  CFTypeID TypeID;
  CFTypeID v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v32;
  int *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  int *v39;
  uint64_t v40;
  uint64_t v41;
  _DWORD *v42;
  int v43;

  Count = CFArrayGetCount(a1);
  if (!Count)
    goto LABEL_28;
  v5 = Count;
  if ((Count & 1) != 0)
  {
    v18 = sub_10001453C();
    v19 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v18, v19))
    {
      v20 = _os_log_pack_size(2);
      v21 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v22 = __error();
      *(_WORD *)_os_log_pack_fill(v21, v20, *v22, &_mh_execute_header, "Classless route requires pairs of IP address values") = 0;
      __SC_log_send(5, v18, v19, v21);
    }
    goto LABEL_28;
  }
  if (Count >= 0)
    v6 = Count;
  else
    v6 = Count + 1;
  v7 = v6 >> 1;
  v8 = (in_addr *)malloc_type_malloc(12 * (v6 >> 1) + 12, 0x10000403E1C8BA9uLL);
  v9 = v8;
  if (v5 < 2)
    goto LABEL_27;
  v42 = a2;
  v43 = 0;
  v10 = v8 + 3;
  v11 = 1;
  v12 = v7;
  do
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v11 - 1);
    v14 = (const __CFString *)CFArrayGetValueAtIndex(a1, v11);
    TypeID = CFStringGetTypeID();
    if (!ValueAtIndex
      || CFGetTypeID(ValueAtIndex) != TypeID
      || (v16 = CFStringGetTypeID(), !v14)
      || CFGetTypeID(v14) != v16)
    {
      v23 = sub_10001453C();
      v24 = _SC_syslog_os_log_mapping(5);
      a2 = v42;
      if (!__SC_log_enabled(5, v23, v24))
        goto LABEL_27;
      v25 = _os_log_pack_size(2);
      v26 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = __error();
      *(_WORD *)_os_log_pack_fill(v26, v25, *v27, &_mh_execute_header, "Classless route array contains non-string") = 0;
      goto LABEL_25;
    }
    if ((sub_10000F2A8(ValueAtIndex, v10, (int *)&v10[1]) & 1) == 0)
    {
      v23 = sub_10001453C();
      v24 = _SC_syslog_os_log_mapping(5);
      a2 = v42;
      if (__SC_log_enabled(5, v23, v24))
      {
        v32 = _os_log_pack_size(12);
        v26 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
        v33 = __error();
        v34 = _os_log_pack_fill(v26, v32, *v33, &_mh_execute_header, "Invalid route destination descriptor '%@'");
        *(_DWORD *)v34 = 138412290;
        *(_QWORD *)(v34 + 4) = ValueAtIndex;
LABEL_25:
        v28 = v23;
        v29 = v24;
        v30 = v26;
LABEL_26:
        __SC_log_send(5, v28, v29, v30);
      }
LABEL_27:
      free(v9);
LABEL_28:
      LODWORD(v7) = 0;
      v9 = 0;
      goto LABEL_29;
    }
    if ((sub_10000C614(v14, v10 + 2) & 1) == 0)
    {
      v35 = sub_10001453C();
      v36 = _SC_syslog_os_log_mapping(5);
      a2 = v42;
      if (__SC_log_enabled(5, v35, v36))
      {
        v37 = _os_log_pack_size(12);
        v38 = (char *)&v41 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
        v39 = __error();
        v40 = _os_log_pack_fill(v38, v37, *v39, &_mh_execute_header, "Invalid route gateway address '%@'");
        *(_DWORD *)v40 = 138412290;
        *(_QWORD *)(v40 + 4) = v14;
        v28 = v35;
        v29 = v36;
        v30 = v38;
        goto LABEL_26;
      }
      goto LABEL_27;
    }
    if ((v10->s_addr != 0) | v43 & 1)
    {
      v10 += 3;
    }
    else
    {
      v17 = *(_QWORD *)&v10->s_addr;
      v9[2].s_addr = v10[2].s_addr;
      *(_QWORD *)&v9->s_addr = v17;
      v43 = 1;
    }
    v11 += 2;
    --v12;
  }
  while (v12);
  a2 = v42;
  if ((unint64_t)(v5 + 1) < 3)
    goto LABEL_27;
  if ((v43 & 1) == 0)
  {
    v9[2].s_addr = 0;
    LODWORD(v7) = v7 + 1;
    *(_QWORD *)&v9->s_addr = 0;
  }
LABEL_29:
  *a2 = v7;
  return v9;
}

uint64_t sub_10000F2A8(const __CFString *a1, in_addr *a2, int *a3)
{
  char *v5;
  char *v6;
  char *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  _DWORD *v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v21;

  v5 = (char *)sub_10000C8D4(a1, 0x600u);
  if (v5)
  {
    v6 = v5;
    v7 = strchr(v5, 47);
    if (v7)
    {
      *v7 = 0;
      v8 = strtoul(v7 + 1, 0, 0);
      if (v8 >= 0x21)
      {
        v9 = sub_10001453C();
        v10 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v9, v10))
        {
          v11 = _os_log_pack_size(8);
          v12 = (char *)&v21 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
          v13 = __error();
          v14 = (_DWORD *)_os_log_pack_fill(v12, v11, *v13, &_mh_execute_header, "invalid prefix length %d", v21);
          *v14 = 67109120;
          v14[1] = v8;
          __SC_log_send(5, v9, v10, v12);
        }
        goto LABEL_22;
      }
    }
    else
    {
      v8 = -1;
    }
    if (inet_aton(v6, a2) == 1)
    {
      v16 = bswap32(a2->s_addr);
      if (v8)
        v17 = -1 << -(char)v8;
      else
        v17 = 0;
      if (v16 >> 30 == 2)
        v18 = 16;
      else
        v18 = 24;
      if (v16 >= 0)
        v18 = 8;
      v19 = -1 << -(char)v18;
      if (v8 != -1)
      {
        v18 = v8;
        v19 = v17;
      }
      if ((v19 & v16) == 0)
      {
        v18 = 0;
        a2->s_addr = 0;
      }
      *a3 = v18;
      v15 = 1;
      goto LABEL_23;
    }
LABEL_22:
    v15 = 0;
LABEL_23:
    free(v6);
    return v15;
  }
  return 0;
}

uint64_t sub_10000F494(uint64_t a1, void *__src, size_t __n)
{
  unsigned int v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  _DWORD v17[4];

  v3 = __n;
  v6 = *(int *)(a1 + 84);
  if ((int)v6 - *(_DWORD *)(a1 + 80) >= (int)__n)
    goto LABEL_9;
  if (!*(_BYTE *)(a1 + 64))
  {
    *(_DWORD *)(a1 + 84) = v6 + 64;
    v15 = *(void **)(a1 + 72);
    if (v15 == (void *)a1)
    {
      v16 = malloc_type_malloc(v6 + 64, 0x75B8D83FuLL);
      *(_QWORD *)(a1 + 72) = v16;
      memcpy(v16, (const void *)a1, *(int *)(a1 + 80));
    }
    else
    {
      result = (uint64_t)reallocf(v15, v6 + 64);
      *(_QWORD *)(a1 + 72) = result;
      if (!result)
        return result;
    }
LABEL_9:
    memcpy((void *)(*(_QWORD *)(a1 + 72) + *(int *)(a1 + 80)), __src, v3);
    *(_DWORD *)(a1 + 80) += v3;
    return 1;
  }
  v7 = sub_10001453C();
  v8 = _SC_syslog_os_log_mapping(5);
  result = __SC_log_enabled(5, v7, v8);
  if ((_DWORD)result)
  {
    v10 = _os_log_pack_size(14);
    v11 = (char *)v17 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = __error();
    v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "user-supplied buffer failed to add data with length %d (> %d)", v17[0], v17[2]);
    v14 = *(_DWORD *)(a1 + 84) - *(_DWORD *)(a1 + 80);
    *(_DWORD *)v13 = 67109376;
    *(_DWORD *)(v13 + 4) = v3;
    *(_WORD *)(v13 + 8) = 1024;
    *(_DWORD *)(v13 + 10) = v14;
    __SC_log_send(5, v7, v8, v11);
    return 0;
  }
  return result;
}

_QWORD *sub_10000F650(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = sub_1000105C4(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_10000F684(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;

  v1 = (uint64_t)a1;
  v3 = 0;
  while (sub_100010638(a1, 0, &v3))
  {
    if (v3)
    {
      v2 = *(void (**)(void))(v1 + 16);
      if (v2)
        v2();
    }
    a1 = (uint64_t *)v1;
  }
  sub_1000105CC(v1);
}

uint64_t sub_10000F6F0(_OWORD *a1, int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint16x8_t v4;
  uint16x8_t v5;
  BOOL v6;
  int v7;
  uint16x4_t v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int i;
  int v13;

  if (a2 < 32)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0;
    v3 = a2;
    do
    {
      a2 = v3 - 32;
      v4 = *(uint16x8_t *)a1;
      v5 = *((uint16x8_t *)a1 + 1);
      a1 += 2;
      v2 += vaddvq_s32(vaddq_s32((int32x4_t)vaddl_u16(*(uint16x4_t *)v4.i8, *(uint16x4_t *)v5.i8), (int32x4_t)vaddl_high_u16(v4, v5)));
      v6 = v3 > 0x3F;
      v3 -= 32;
    }
    while (v6);
  }
  if (a2 < 8)
  {
    v7 = a2;
    if (!a2)
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
  }
  else
  {
    do
    {
      v7 = a2 - 8;
      v8 = *(uint16x4_t *)a1;
      a1 = (_OWORD *)((char *)a1 + 8);
      v2 += vaddvq_s32((int32x4_t)vmovl_u16(v8));
      v6 = a2 > 0xF;
      a2 -= 8;
    }
    while (v6);
    if (!v7)
      return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
  }
  v2 = HIWORD(v2) + (unsigned __int16)v2;
  if (HIWORD(v2))
    v2 -= 0xFFFF;
  v9 = v7 - 2;
  if (v7 < 2)
  {
    v11 = (unsigned __int8 *)a1;
  }
  else
  {
    v10 = v9 & 0xFFFFFFFE;
    v11 = (unsigned __int8 *)a1 + v10 + 2;
    for (i = v7; i > 1; i -= 2)
    {
      v13 = *(unsigned __int16 *)a1;
      a1 = (_OWORD *)((char *)a1 + 2);
      v2 += v13;
    }
    v9 = v7 - v10 - 4;
  }
  if (v9 == -1)
    v2 += *v11;
  return (unsigned __int16)~(HIWORD(v2) + v2 + ((HIWORD(v2) + (unsigned __int16)v2) >> 16));
}

__n128 sub_10000F7F0(__n128 *a1)
{
  _OWORD *v2;
  __n128 result;

  v2 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
  if (v2)
  {
    result = *a1;
    *v2 = *a1;
  }
  return result;
}

uint64_t sub_10000F834(uint64_t *a1, int a2)
{
  uint64_t v4;
  int i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = 0;
  if (!a1)
    goto LABEL_3;
LABEL_2:
  for (i = *((_DWORD *)a1 + 2); ; i = 0)
  {
    if (v4 >= i)
      return 0;
    v6 = *a1;
    v7 = *a1 + 96 * v4 + 24;
    if ((int)sub_10000CEA8(v7) >= 1)
      break;
LABEL_9:
    ++v4;
    if (a1)
      goto LABEL_2;
LABEL_3:
    ;
  }
  v8 = 0;
  while (*(_DWORD *)sub_10000F6EC(v7, v8) != a2)
  {
    v8 = (v8 + 1);
    if ((int)v8 >= (int)sub_10000CEA8(v7))
      goto LABEL_9;
  }
  return v6 + 96 * v4;
}

uint64_t sub_10000F8F4(uint64_t *a1, char *__s2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v4 = -96;
  v5 = -1;
  while (1)
  {
    v6 = a1 ? *((_DWORD *)a1 + 2) : 0;
    if (++v5 >= v6)
      break;
    v7 = v4 + 96;
    v8 = *a1;
    v9 = strcmp((const char *)(*a1 + v4 + 96), __s2);
    v4 = v7;
    if (!v9)
      return v8 + v7;
  }
  return 0;
}

void *sub_10000F978()
{
  void *v0;
  void *v1;

  v0 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  v1 = v0;
  if (v0 && !sub_10000F9CC((uint64_t)v0))
  {
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t sub_10000F9CC(uint64_t a1)
{
  int v2;
  ifaddrs *v3;
  int v4;
  ifaddrs *v5;
  int v6;
  void *v7;
  int v8;
  __int128 v9;
  int v10;
  size_t v11;
  sockaddr *ifa_addr;
  const char *ifa_name;
  int sa_family;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  int *v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  sockaddr *ifa_netmask;
  int v40;
  sockaddr *ifa_dstaddr;
  int v42;
  _DWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char v49;
  char *ifa_data;
  uint64_t v51;
  char v52;
  const __CFDictionary *v53;
  io_service_t MatchingService;
  io_object_t v55;
  CFTypeRef CFProperty;
  const void *v57;
  CFTypeID TypeID;
  _BOOL4 v59;
  CFStringRef v60;
  uint64_t v61;
  const void *v62;
  int IsTetheredHotspot;
  int IsCarPlay;
  char v65;
  char v66;
  unint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t result;
  const __CFAllocator *v71;
  int v72;
  mach_port_t v73;
  __int128 v74;
  int v75;
  ifaddrs *v76;
  void *v77;
  void *keys;
  void *values;
  _OWORD v80[3];

  v76 = 0;
  memset(v80, 0, 44);
  *(_QWORD *)a1 = 0;
  v2 = getifaddrs(&v76);
  v3 = v76;
  if (v2 < 0)
    goto LABEL_89;
  if (!v76)
  {
LABEL_91:
    result = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      free((void *)result);
      result = 0;
      *(_QWORD *)a1 = 0;
    }
    return result;
  }
  v4 = 0;
  v5 = v76;
  while (v5->ifa_addr)
  {
    v5 = v5->ifa_next;
    --v4;
    if (!v5)
      goto LABEL_8;
  }
  if (!v4)
  {
LABEL_89:
    if (v3)
      freeifaddrs(v3);
    goto LABEL_91;
  }
LABEL_8:
  v6 = -v4;
  v7 = malloc_type_malloc(96 * -v4, 0x1080040B03B560BuLL);
  *(_QWORD *)a1 = v7;
  if (!v7)
  {
    v3 = v76;
    goto LABEL_89;
  }
  v8 = socket(2, 2, 0);
  v3 = v76;
  if (v8 < 0)
    goto LABEL_89;
  v10 = v8;
  *(_DWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 12) = v6;
  v11 = 96;
  if (!v3)
    goto LABEL_94;
  v73 = kIOMainPortDefault;
  v71 = kCFAllocatorDefault;
  *(_QWORD *)&v9 = 136315906;
  v74 = v9;
  v75 = v8;
  do
  {
    ifa_addr = v3->ifa_addr;
    if (!ifa_addr)
      goto LABEL_82;
    ifa_name = v3->ifa_name;
    sa_family = ifa_addr->sa_family;
    if (sa_family == 2)
    {
      v21 = 96 * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
      v22 = -96;
      do
      {
        v23 = v22 + 96;
        if (v21 == v22 + 96)
          goto LABEL_30;
        v24 = *(_QWORD *)a1;
        v25 = strcmp((const char *)(*(_QWORD *)a1 + v22 + 96), ifa_name);
        v22 = v23;
      }
      while (v25);
      if (v24)
      {
        v26 = v24 + v23;
LABEL_32:
        v38 = *(_DWORD *)&ifa_addr->sa_data[2];
        ifa_netmask = v3->ifa_netmask;
        if (ifa_netmask)
          v40 = *(_DWORD *)&ifa_netmask->sa_data[2];
        else
          v40 = 0;
        if ((*(_WORD *)(v26 + 16) & 2) != 0 && (ifa_dstaddr = v3->ifa_dstaddr) != 0)
          v42 = *(_DWORD *)&ifa_dstaddr->sa_data[2];
        else
          v42 = 0;
        v43 = malloc_type_malloc(0x10uLL, 0x1000040451B5BE8uLL);
        if (v43)
        {
          *v43 = v38;
          v43[1] = v40;
          v43[2] = v40 & v38;
          v43[3] = v42;
        }
        sub_10000F6E4(v26 + 24, v43);
        goto LABEL_82;
      }
LABEL_30:
      v37 = sub_100010544((uint64_t *)a1, (uint64_t)ifa_name);
      if (v37)
      {
        v26 = v37;
        *(_WORD *)(v37 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }
      v44 = sub_10001453C();
      v45 = _SC_syslog_os_log_mapping(5);
      if (!__SC_log_enabled(5, v44, v45))
        goto LABEL_82;
      goto LABEL_45;
    }
    if (sa_family != 18)
      goto LABEL_82;
    v15 = 96 * (*(_DWORD *)(a1 + 8) & ~(*(int *)(a1 + 8) >> 31));
    v16 = -96;
    do
    {
      v17 = v16 + 96;
      if (v15 == v16 + 96)
        goto LABEL_25;
      v18 = *(_QWORD *)a1;
      v19 = strcmp((const char *)(*(_QWORD *)a1 + v16 + 96), ifa_name);
      v16 = v17;
    }
    while (v19);
    if (v18)
    {
      v20 = v18 + v17;
      goto LABEL_27;
    }
LABEL_25:
    v27 = sub_100010544((uint64_t *)a1, (uint64_t)ifa_name);
    if (!v27)
    {
      v44 = sub_10001453C();
      v45 = _SC_syslog_os_log_mapping(5);
      if (!__SC_log_enabled(5, v44, v45))
        goto LABEL_82;
LABEL_45:
      v46 = _os_log_pack_size(2);
      v47 = (char *)&v71 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v48 = *__error();
      *(_WORD *)_os_log_pack_fill(v47, v46, v48, &_mh_execute_header, "interfaces: S_next_entry returns NULL", v71) = 0;
      __SC_log_send(5, v44, v45, v47);
      goto LABEL_82;
    }
    v20 = v27;
    *(_WORD *)(v27 + 16) = v3->ifa_flags;
LABEL_27:
    v28 = ifa_addr->sa_data[4];
    if (v28 >= 0x11)
    {
      v29 = sub_10001453C();
      v30 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v29, v30))
      {
        v31 = _os_log_pack_size(34);
        v32 = (char *)&v71 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
        v33 = __error();
        v34 = _os_log_pack_fill(v32, v31, *v33, &_mh_execute_header, "%s: link type %d address length %d > %ld", (const char *)v71, v72, (_DWORD)v74, *((_QWORD *)&v74 + 1));
        v35 = ifa_addr->sa_data[2];
        v36 = ifa_addr->sa_data[4];
        *(_DWORD *)v34 = v74;
        *(_QWORD *)(v34 + 4) = ifa_name;
        *(_WORD *)(v34 + 12) = 1024;
        *(_DWORD *)(v34 + 14) = v35;
        *(_WORD *)(v34 + 18) = 1024;
        *(_DWORD *)(v34 + 20) = v36;
        *(_WORD *)(v34 + 24) = 2048;
        v28 = 16;
        *(_QWORD *)(v34 + 26) = 16;
        __SC_log_send(5, v29, v30, v32);
        v10 = v75;
      }
      else
      {
        v28 = 16;
      }
    }
    *(_BYTE *)(v20 + 74) = v28;
    memmove((void *)(v20 + 56), &ifa_addr->sa_data[ifa_addr->sa_data[3] + 6], v28);
    v49 = ifa_addr->sa_data[2];
    *(_BYTE *)(v20 + 75) = v49;
    *(_WORD *)(v20 + 72) = *(_WORD *)ifa_addr->sa_data;
    ifa_data = (char *)v3->ifa_data;
    if (ifa_data)
      v49 = *ifa_data;
    *(_BYTE *)(v20 + 18) = v49;
    if (sub_100010314(v10, (uint64_t)ifa_name, (uint64_t)v80))
    {
      if (*(_BYTE *)(v20 + 18) == 6)
      {
        v51 = sub_1000103A4(v10, (uint64_t)ifa_name);
        if ((v51 & 0x4000) != 0)
          *(_BYTE *)(v20 + 19) |= 8u;
        if ((v80[1] & 0xE0) == 0x80)
        {
          v52 = *(_BYTE *)(v20 + 19);
          *(_BYTE *)(v20 + 19) = v52 | 1;
          if ((v51 & 0x100000) != 0)
          {
            v66 = v52 | 3;
            goto LABEL_70;
          }
          keys = CFSTR("IOInterfaceName");
          values = (void *)CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          v77 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(values);
          keys = CFSTR("IOPropertyMatch");
          v53 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v77, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFRelease(v77);
          MatchingService = IOServiceGetMatchingService(v73, v53);
          if (MatchingService)
          {
            v55 = MatchingService;
            CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IO80211InterfaceRole"), v71, 0);
            if (CFProperty)
            {
              v57 = CFProperty;
              TypeID = CFStringGetTypeID();
              v59 = CFGetTypeID(v57) == TypeID && CFEqual(v57, CFSTR("Infrastructure")) != 0;
              CFRelease(v57);
              IOObjectRelease(v55);
              if (v59)
              {
                v66 = *(_BYTE *)(v20 + 19) | 0x10;
LABEL_70:
                *(_BYTE *)(v20 + 19) = v66;
              }
            }
            else
            {
              IOObjectRelease(v55);
            }
          }
        }
        else
        {
          v60 = CFStringCreateWithCString(0, ifa_name, 0x8000100u);
          v61 = _SCNetworkInterfaceCreateWithBSDName(0, v60, 0);
          if (v61)
          {
            v62 = (const void *)v61;
            IsTetheredHotspot = _SCNetworkInterfaceIsTetheredHotspot();
            IsCarPlay = _SCNetworkInterfaceIsCarPlay(v62);
            CFRelease(v62);
            if (IsCarPlay)
            {
              if (IsTetheredHotspot)
                v65 = 36;
              else
                v65 = 32;
              CFRelease(v60);
            }
            else
            {
              CFRelease(v60);
              if (!IsTetheredHotspot)
                goto LABEL_71;
              v65 = 4;
            }
            v66 = *(_BYTE *)(v20 + 19) | v65;
            goto LABEL_70;
          }
          CFRelease(v60);
        }
      }
LABEL_71:
      if (SLODWORD(v80[2]) < 1)
      {
        v68 = 0;
        v67 = 0;
        v69 = 0;
      }
      else
      {
        v67 = (unint64_t)(BYTE8(v80[1]) & 2) << 31;
        if ((BYTE8(v80[1]) & 1) != 0)
          v68 = (DWORD2(v80[1]) >> 2) & 1;
        else
          v68 = 0;
        if ((BYTE8(v80[1]) & 1) == 0)
          v67 = 0;
        v69 = 1;
        if ((BYTE8(v80[1]) & 1) == 0)
          v69 = 0;
      }
      *(_QWORD *)(v20 + 80) = v69 | v67;
      *(_DWORD *)(v20 + 88) = v68;
    }
LABEL_82:
    v3 = v3->ifa_next;
  }
  while (v3);
  v11 = 96 * *(int *)(a1 + 8) + 96;
LABEL_94:
  *(_QWORD *)a1 = reallocf(*(void **)a1, v11);
  if (v76)
    freeifaddrs(v76);
  if ((v10 & 0x80000000) == 0)
    close(v10);
  return 1;
}

void sub_100010188(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      if (*(int *)(v2 + 8) >= 1)
      {
        v3 = 0;
        v4 = 24;
        do
        {
          sub_10000F684((uint64_t *)(*(_QWORD *)v2 + v4));
          ++v3;
          v4 += 96;
        }
        while (v3 < *(int *)(v2 + 8));
      }
      if (*(_QWORD *)v2)
        free(*(void **)v2);
      free((void *)v2);
      *a1 = 0;
    }
  }
}

uint64_t sub_100010204(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 16);
}

uint64_t sub_10001020C(uint64_t a1)
{
  return sub_10000CEA8(a1 + 24);
}

uint64_t sub_100010214(uint64_t a1, uint64_t a2)
{
  return sub_10000F6EC(a1 + 24, a2);
}

unsigned int *sub_10001021C(uint64_t a1)
{
  unsigned int *result;

  result = (unsigned int *)sub_10000F6EC(a1 + 24, 0);
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t sub_100010240(uint64_t a1)
{
  return *(unsigned int *)(sub_10000F6EC(a1 + 24, 0) + 12);
}

BOOL sub_100010260(uint64_t a1)
{
  return (int)sub_10000CEA8(a1 + 24) > 0;
}

uint64_t sub_100010280(uint64_t a1, int a2)
{
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a1 + 24;
  v4 = sub_10000CEA8(a1 + 24);
  if (v4 < 1)
    return 0xFFFFFFFFLL;
  v5 = v4;
  v6 = 0;
  while (1)
  {
    v7 = sub_10000F6EC(v3, v6);
    if ((*(_DWORD *)(v7 + 4) & a2) == *(_DWORD *)(v7 + 8))
      break;
    v6 = (v6 + 1);
    if (v5 == (_DWORD)v6)
      return 0xFFFFFFFFLL;
  }
  return v6;
}

uint64_t sub_1000102F0(uint64_t a1)
{
  int v1;
  unsigned int v2;

  v1 = *(unsigned __int8 *)(a1 + 75);
  if (v1 == 144)
    v2 = 24;
  else
    v2 = -1;
  if (v1 == 6)
    return 1;
  else
    return v2;
}

uint64_t sub_10001030C(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 72);
}

uint64_t sub_100010314(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  *(_OWORD *)(a3 + 28) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  __strlcpy_chk(a3, a2, 16, 16);
  if (ioctl(a1, 0xC02C6938uLL, a3) != -1)
    return 1;
  if (*__error() != 102)
    return 0;
  *(_DWORD *)(a3 + 24) = 3;
  result = 1;
  *(_DWORD *)(a3 + 32) = 1;
  return result;
}

uint64_t sub_1000103A4(int a1, uint64_t a2)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  int *v11;
  char *v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  __strlcpy_chk(&v13, a2, 16, 16);
  if (ioctl(a1, 0xC020698EuLL, &v13) != -1)
    return v14;
  if (*__error() != 6 && *__error() != 82 && *__error() != 22)
  {
    v5 = sub_10001453C();
    v6 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v5, v6))
    {
      v7 = _os_log_pack_size(22);
      v8 = (char *)&v13 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v9 = __error();
      v10 = _os_log_pack_fill(v8, v7, *v9, &_mh_execute_header, "%s: SIOCGIFEFLAGS failed status, %s", (const char *)v13, *((const char **)&v13 + 1));
      v11 = __error();
      v12 = strerror(*v11);
      *(_DWORD *)v10 = 136315394;
      *(_QWORD *)(v10 + 4) = a2;
      *(_WORD *)(v10 + 12) = 2080;
      *(_QWORD *)(v10 + 14) = v12;
      __SC_log_send(5, v5, v6, v8);
    }
  }
  return 0;
}

uint64_t sub_100010544(uint64_t *a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *((_DWORD *)a1 + 2);
  if (v2 >= *((_DWORD *)a1 + 3))
    return 0;
  v3 = *a1;
  *((_DWORD *)a1 + 2) = v2 + 1;
  v4 = v3 + 96 * v2;
  *(_OWORD *)(v4 + 64) = 0u;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)v4 = 0u;
  *(_OWORD *)(v4 + 16) = 0u;
  __strlcpy_chk(v4, a2, 16, 16);
  sub_10000F650((_QWORD *)(v4 + 24), (uint64_t)j__free, (uint64_t)sub_10000F7F0);
  return v4;
}

_QWORD *sub_1000105C4(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_1000105CC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
    free(v2);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

uint64_t sub_1000105F8(uint64_t result)
{
  if (result)
  {
    if (*(_QWORD *)result)
      return *(unsigned int *)(result + 12);
    else
      return 0;
  }
  return result;
}

uint64_t sub_100010614(uint64_t a1, int a2)
{
  if (*(_QWORD *)a1 && *(_DWORD *)(a1 + 12) > a2)
    return *(_QWORD *)(*(_QWORD *)a1 + 8 * a2);
  else
    return 0;
}

uint64_t sub_100010638(uint64_t *a1, unsigned int a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  int v6;

  v3 = *a1;
  if (!*a1)
    return 0;
  result = 0;
  if ((a2 & 0x80000000) == 0)
  {
    v6 = *((_DWORD *)a1 + 3);
    if (v6 > (int)a2)
    {
      if (a3)
        *a3 = *(_QWORD *)(v3 + 8 * a2);
      if ((int)(v6 + ~a2) >= 1)
      {
        memmove((void *)(*a1 + 8 * a2), (const void *)(*a1 + 8 * (a2 + 1)), 8 * (v6 + ~a2));
        v6 = *((_DWORD *)a1 + 3);
      }
      *((_DWORD *)a1 + 3) = v6 - 1;
      return 1;
    }
  }
  return result;
}

BOOL sub_1000106BC(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1000106FC(a1);
  if (result)
  {
    v5 = *(_QWORD *)a1;
    v6 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v6 + 1;
    *(_QWORD *)(v5 + 8 * v6) = a2;
    return 1;
  }
  return result;
}

BOOL sub_1000106FC(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = *(void **)a1;
  v3 = *(_DWORD *)(a1 + 8);
  if (!v2)
  {
    if (!v3)
    {
      v3 = 16;
      *(_DWORD *)(a1 + 8) = 16;
    }
    *(_DWORD *)(a1 + 12) = 0;
    v2 = malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    goto LABEL_7;
  }
  if (v3 == *(_DWORD *)(a1 + 12))
  {
    *(_DWORD *)(a1 + 8) = 2 * v3;
    v2 = malloc_type_realloc(v2, 16 * v3, 0x80040B8603338uLL);
LABEL_7:
    *(_QWORD *)a1 = v2;
  }
  return v2 != 0;
}

BOOL sub_10001078C(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;

  if ((a3 & 0x80000000) != 0)
    return 0;
  v6 = *(_DWORD *)(a1 + 12);
  result = sub_1000106FC(a1);
  if (v6 <= (int)a3)
  {
    if (!result)
      return result;
    v8 = *(_QWORD *)a1;
    v9 = *(int *)(a1 + 12);
    *(_DWORD *)(a1 + 12) = v9 + 1;
    *(_QWORD *)(v8 + 8 * v9) = a2;
  }
  else
  {
    if (!result)
      return result;
    memmove((void *)(*(_QWORD *)a1 + 8 * a3 + 8), (const void *)(*(_QWORD *)a1 + 8 * a3), 8 * (int)(*(_DWORD *)(a1 + 12) - a3));
    *(_QWORD *)(*(_QWORD *)a1 + 8 * a3) = a2;
    ++*(_DWORD *)(a1 + 12);
  }
  return 1;
}

uint64_t sub_100010828(uint64_t a1, uint64_t a2)
{
  int v2;
  int v5;
  void *v6;
  uint64_t result;

  v2 = *(_DWORD *)(a2 + 12);
  if (!v2)
    return 1;
  v5 = *(_DWORD *)(a1 + 12) + v2;
  if (v5 <= *(_DWORD *)(a1 + 8))
  {
    result = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
LABEL_9:
      memmove((void *)(result + 8 * *(int *)(a1 + 12)), *(const void **)a2, 8 * *(int *)(a2 + 12));
      *(_DWORD *)(a1 + 12) += *(_DWORD *)(a2 + 12);
      return 1;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 8) = v5;
    v6 = *(void **)a1;
    if (*(_QWORD *)a1)
      result = (uint64_t)malloc_type_realloc(v6, 8 * v5, 0x80040B8603338uLL);
    else
      result = (uint64_t)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
    *(_QWORD *)a1 = result;
    if (result)
      goto LABEL_9;
  }
  return result;
}

char *sub_1000108E0(int a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  const char *v12;
  int v14;
  char __str[8];

  v2 = 0;
  v14 = a1;
  v3 = bswap32(a2);
  while (((v3 >> v2) & 1) == 0)
  {
    if (++v2 == 32)
    {
      byte_10001D4E8 = 0;
      v4 = 32;
      v5 = 4;
      goto LABEL_7;
    }
  }
  v4 = 32 - v2;
  byte_10001D4E8 = 0;
  v6 = 39 - v2;
  if (v6 < 8)
    goto LABEL_12;
  v5 = v6 >> 3;
LABEL_7:
  v7 = (v5 - 1);
  v8 = v7 + 1;
  v9 = (unsigned __int8 *)&v14;
  do
  {
    v11 = *v9++;
    v10 = v11;
    if ((_DWORD)v7)
      v12 = ".";
    else
      v12 = "";
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk(&byte_10001D4E8, __str, 32, 32);
    LODWORD(v7) = v7 - 1;
    --v8;
  }
  while (v8);
LABEL_12:
  if ((v4 & 7) != 0)
  {
    snprintf(__str, 8uLL, "/%d", v4);
    __strlcat_chk(&byte_10001D4E8, __str, 32, 32);
  }
  return &byte_10001D4E8;
}

uint64_t sub_100010A48(uint64_t result, int a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_QWORD *)a5 = result - a3;
  *(_DWORD *)(a5 + 8) = a2 - a4;
  if (a2 - a4 < 0)
  {
    *(_DWORD *)(a5 + 8) = a2 - a4 + 1000000;
    *(_QWORD *)a5 = result - a3 - 1;
  }
  return result;
}

void sub_100010A78(CFMutableStringRef theString, uint64_t a2, int a3)
{
  uint64_t v5;
  int v6;
  int v8;
  __uint32_t v9;
  unsigned __int8 v10;
  char v11;
  const char *v12;
  uint64_t v13;
  _BYTE v14[16];
  char v15;

  if (a3 >= 1)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (!v6)
        CFStringAppendFormat(theString, 0, CFSTR("%04x "), v5);
      v8 = *(char *)(a2 + v5);
      if (v8 < 0)
        v9 = __maskrune(*(unsigned __int8 *)(a2 + v5), 0x40000uLL);
      else
        v9 = _DefaultRuneLocale.__runetype[*(unsigned __int8 *)(a2 + v5)] & 0x40000;
      v10 = *(_BYTE *)(a2 + v5);
      if (v9)
        v11 = v8;
      else
        v11 = 46;
      v14[v6] = v11;
      CFStringAppendFormat(theString, 0, CFSTR(" %02x"), v10);
      if (v6 == 7)
      {
        CFStringAppendFormat(theString, 0, CFSTR(" "));
        v6 = 8;
      }
      else if (v6 == 15)
      {
        v15 = 0;
        CFStringAppendFormat(theString, 0, CFSTR("  %s\n"), v14);
        v6 = 0;
      }
      else
      {
        ++v6;
      }
      ++v5;
    }
    while (a3 != (_DWORD)v5);
    if (v6)
    {
      if (v6 >= 8)
        v12 = "";
      else
        v12 = " ";
      if (v6 <= 15)
      {
        v13 = v6;
        do
        {
          CFStringAppendFormat(theString, 0, CFSTR("   "));
          v14[v13++] = 32;
        }
        while ((_DWORD)v13 != 16);
      }
      v15 = 0;
      CFStringAppendFormat(theString, 0, CFSTR("  %s%s\n"), v12, v14);
    }
  }
}

void sub_100010C60(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char v11[3];
  uint64_t v12;
  uint64_t v13;

  if (a3 >= 1)
  {
    v12 = v4;
    v13 = v5;
    v9 = 0;
    v10 = a3;
    do
    {
      if (v9)
      {
        if (a4 != 32 || (v9 & 7) != 0)
          *(_WORD *)v11 = a4;
        else
          strcpy(v11, "  ");
      }
      else
      {
        v11[0] = 0;
      }
      CFStringAppendFormat(theString, 0, CFSTR("%s%02x"), v11, *(unsigned __int8 *)(a2 + v9++));
    }
    while (v10 != v9);
  }
}

void sub_100010D18(__CFString *a1, uint64_t a2, int a3)
{
  sub_100010C60(a1, a2, a3, 32);
}

uint64_t sub_100010D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 0;
  while (1)
  {
    v3 = *(unsigned __int8 *)(a1 + v2) - *(unsigned __int8 *)(a2 + v2);
    if ((_DWORD)v3)
      break;
    if ((_DWORD)++v2 == 6)
      return 0;
  }
  return v3;
}

char *identifierToStringWithBuffer(int a1, uint64_t a2, int a3, char *__str, int a5)
{
  int v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  const char *v12;
  char __stra[4];

  v8 = 3 * a3 + 4;
  v9 = v8;
  if (__str && (v10 = __str, v8 <= a5) || (v10 = (char *)malloc_type_malloc(v8, 0x78A35FCFuLL)) != 0)
  {
    snprintf(v10, v9, "%x%c", a1, 44);
    if (a3 >= 1)
    {
      v11 = 0;
      do
      {
        if (v11)
          v12 = ":";
        else
          v12 = "";
        snprintf(__stra, 4uLL, "%s%x", v12, *(unsigned __int8 *)(a2 + v11));
        strlcat(v10, __stra, v9);
        ++v11;
      }
      while (a3 != v11);
    }
  }
  return v10;
}

uint64_t SubnetDoesAllocate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t SubnetGetMaxLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t SubnetGetMinLease(uint64_t a1)
{
  return *(unsigned int *)(a1 + 28);
}

uint64_t SubnetGetOptionPtrAndLength(uint64_t a1, int a2, _DWORD *a3)
{
  int v4;
  uint64_t i;

  if (a2 == 1)
  {
    *a3 = 4;
    return a1 + 12;
  }
  else
  {
    v4 = *(_DWORD *)(a1 + 56);
    if (v4 < 1)
    {
      return 0;
    }
    else
    {
      for (i = *(_QWORD *)(a1 + 48) + 8; *(_DWORD *)(i - 8) != a2; i += 16)
      {
        if (!--v4)
          return 0;
      }
      *a3 = *(_DWORD *)(i - 4);
      return *(_QWORD *)i;
    }
  }
}

uint64_t *SubnetListCreateWithArray(const void *a1)
{
  CFTypeID TypeID;
  uint64_t *v3;
  uint64_t *v4;
  CFIndex Count;
  CFIndex v6;
  const void *ValueAtIndex;
  CFTypeID v8;
  const __CFString *Value;
  CFTypeID v10;
  int v11;
  int v12;
  const __CFString *v13;
  CFTypeID v14;
  int v15;
  int v16;
  int v17;
  const __CFString *v18;
  CFTypeID v19;
  const __CFString *v20;
  CFTypeID v21;
  const void *v22;
  CFTypeID v23;
  const __CFString *v24;
  const __CFString *v25;
  char *v26;
  __CFArray *v27;
  const __CFArray *v28;
  unsigned int v29;
  const char **v30;
  int v31;
  UInt8 *v32;
  uint64_t v33;
  int v34;
  const char *v35;
  _QWORD *v36;
  int v37;
  int *v38;
  const char *v39;
  uint64_t v40;
  unsigned int v41;
  int v43;
  char *v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  const char *v55;
  CFIndex v56;
  int v57;
  int v58;
  const char *v59;
  uint64_t v60;
  char v61[256];

  TypeID = CFArrayGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
  {
    syslog(5, "subnets: type is not an array");
    return 0;
  }
  v3 = (uint64_t *)malloc_type_malloc(0x20uLL, 0x1080040EE4F9096uLL);
  v4 = v3;
  if (v3)
  {
    *(_OWORD *)v3 = 0u;
    *((_OWORD *)v3 + 1) = 0u;
    sub_10000F650(v3, (uint64_t)j__free_0, 0);
    Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      v6 = 0;
      v56 = Count;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
        v58 = 0;
        v8 = CFDictionaryGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v8)
        {
          v55 = "subnet element is not a dictionary";
          goto LABEL_97;
        }
        v61[0] = 0;
        Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("name"));
        if (Value)
        {
          v10 = CFStringGetTypeID();
          if (CFGetTypeID(Value) != v10)
          {
            v55 = "Invalid 'name' property";
            goto LABEL_97;
          }
          v11 = sub_10000C3E8(Value, 0, 0, 0);
          v12 = v11 >= 2 ? v11 : 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("supernet"));
        if (v13)
        {
          v14 = CFStringGetTypeID();
          if (CFGetTypeID(v13) != v14)
          {
            v55 = "Invalid 'supernet' property";
            goto LABEL_97;
          }
          v15 = sub_10000C3E8(v13, 0, 0, 0);
          v16 = v15 >= 2 ? v15 : 0;
          v57 = v16;
          v17 = v16 + v12;
        }
        else
        {
          v57 = 0;
          v17 = v12;
        }
        v59 = 0;
        v60 = 0;
        v18 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("net_address"));
        v19 = CFStringGetTypeID();
        if (!v18 || CFGetTypeID(v18) != v19 || !sub_10000C614(v18, (in_addr *)&v60 + 1))
          break;
        v20 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("net_mask"));
        v21 = CFStringGetTypeID();
        if (!v20 || CFGetTypeID(v20) != v21 || !sub_10000C614(v20, (in_addr *)&v60))
        {
          v55 = "Invalid/missing 'net_mask' property";
          goto LABEL_97;
        }
        v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, CFSTR("net_range"));
        v23 = CFArrayGetTypeID();
        if (!v22 || CFGetTypeID(v22) != v23)
        {
          v55 = "Invalid/missing 'net_range' property";
          goto LABEL_97;
        }
        if (CFArrayGetCount((CFArrayRef)v22) != 2)
        {
          v55 = "'net_range' property must specify 2 values";
          goto LABEL_97;
        }
        v24 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 0);
        if (!sub_100011BCC(v24) || !sub_10000C614(v24, (in_addr *)&v59))
        {
          v55 = "Invalid 'net_range' range start";
          goto LABEL_97;
        }
        v25 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v22, 1);
        if (!sub_100011BCC(v25) || !sub_10000C614(v25, (in_addr *)&v59 + 1))
        {
          v55 = "Invalid 'net_range' range end";
          goto LABEL_97;
        }
        if ((v59 & v60) != HIDWORD(v60))
        {
          v55 = "'net_range' start not within subnet";
          goto LABEL_97;
        }
        if ((HIDWORD(v59) & v60) != HIDWORD(v60))
        {
          v55 = "'net_range' end not within subnet";
          goto LABEL_97;
        }
        if (bswap32(v59) > bswap32(HIDWORD(v59)))
        {
          v55 = "'net_range' start > end";
          goto LABEL_97;
        }
        if (!v12)
        {
          v26 = sub_1000108E0(SHIDWORD(v60), v60);
          Value = 0;
          v12 = strlen(v26) + 1;
          v17 += v12;
        }
        v27 = sub_100011C0C((const __CFDictionary *)ValueAtIndex, &v58);
        v28 = v27;
        if (v27)
        {
          v29 = (v58 + 7) & 0xFFFFFFF8;
          v58 = v29 + 16 * CFArrayGetCount(v27);
          v17 += v58;
        }
        v30 = (const char **)malloc_type_malloc(v17 + 64, 0xCE3239EBuLL);
        *(_OWORD *)v30 = 0u;
        *((_OWORD *)v30 + 1) = 0u;
        *((_OWORD *)v30 + 2) = 0u;
        *((_OWORD *)v30 + 3) = 0u;
        sub_10001243C((uint64_t)v30, (CFDictionaryRef)ValueAtIndex);
        v31 = v60;
        *((_DWORD *)v30 + 2) = HIDWORD(v60);
        *((_DWORD *)v30 + 3) = v31;
        v30[2] = v59;
        *((_BYTE *)v30 + 24) = sub_1000124DC((const __CFDictionary *)ValueAtIndex);
        v32 = (UInt8 *)(v30 + 8);
        if (v28)
        {
          *((_DWORD *)v30 + 14) = CFArrayGetCount(v28);
          v33 = v58;
          v30[6] = (const char *)sub_100012538(v28, (uint64_t)(v30 + 8), v58);
          v32 += v33;
          CFRelease(v28);
          v34 = *((_DWORD *)v30 + 14);
          if (v34 >= 1)
          {
            v35 = v30[6];
            v36 = v35 + 8;
            v37 = *((_DWORD *)v30 + 14);
            while (*((_DWORD *)v36 - 2) != 3)
            {
              v36 += 2;
              if (!--v37)
              {
                v38 = 0;
                goto LABEL_49;
              }
            }
            v38 = (int *)*v36;
LABEL_49:
            v39 = v35 + 4;
            while (*((_DWORD *)v39 - 1) != 121)
            {
              v39 += 16;
              if (!--v34)
                goto LABEL_65;
            }
            if (v38)
            {
              v40 = *(_QWORD *)(v39 + 4);
              if (v40)
              {
                v41 = *(_DWORD *)v39;
                if (!*(_BYTE *)v40 && v41 >= 5)
                {
                  v43 = *v38;
                  if (!*(_DWORD *)(v40 + 1) && v43 != 0)
                    *(_DWORD *)(v40 + 1) = v43;
                }
              }
            }
          }
        }
LABEL_65:
        *v30 = (const char *)v32;
        if (Value)
        {
          sub_10000C3E8(Value, v32, v12, 0);
        }
        else
        {
          v45 = sub_1000108E0(SHIDWORD(v60), v60);
          strncpy((char *)v32, v45, v12);
        }
        if (v57)
        {
          sub_10000C3E8(v13, &v32[v12], v57, 0);
          v30[5] = (const char *)&v32[v12];
        }
        *((_DWORD *)v30 + 9) = (_DWORD)v59;
        v46 = sub_10000CEA8(v4);
        if (v46 >= 1)
        {
          v47 = v46;
          v48 = 0;
          while (1)
          {
            v49 = sub_10000F6EC(v4, v48);
            v50 = *(_DWORD *)(v49 + 16);
            v51 = *((_DWORD *)v30 + 4);
            if (v51 == v50)
              break;
            v52 = bswap32(v51);
            v53 = bswap32(v50);
            if (v52 < v53)
            {
              if (bswap32(*((_DWORD *)v30 + 5)) < v53)
              {
                sub_10000F6E8(v4, v30, v48);
                goto LABEL_79;
              }
              break;
            }
            if (bswap32(*(_DWORD *)(v49 + 20)) >= v52)
              break;
            v48 = (v48 + 1);
            if (v47 == (_DWORD)v48)
              goto LABEL_76;
          }
          syslog(5, "subnets: '%s' net_range overlaps with subnet '%s'", *v30, *(const char **)v49);
          free(v30);
LABEL_98:
          sub_10000F684(v4);
          free(v4);
          return 0;
        }
LABEL_76:
        sub_10000F6E4(v4, v30);
LABEL_79:
        if (++v6 == v56)
          return v4;
      }
      v55 = "Invalid/missing 'net_address' property";
LABEL_97:
      __strlcpy_chk(v61, v55, 256, 256);
      syslog(5, "subnets: create failed, %s", v61);
      goto LABEL_98;
    }
  }
  return v4;
}

void SubnetListFree(uint64_t **a1)
{
  uint64_t *v2;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      sub_10000F684(*a1);
      free(v2);
      *a1 = 0;
    }
  }
}

void SubnetListPrintCFString(__CFString *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  in_addr v9;
  char *v10;
  in_addr v11;
  char *v12;
  in_addr v13;
  char *v14;
  in_addr v15;
  char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = sub_10000CEA8(a2);
  v5 = v4;
  CFStringAppendFormat(a1, 0, CFSTR("Subnets[%d]\n"), v4);
  if (v5 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = sub_10000F6EC(a2, v6);
      v6 = (v6 + 1);
      CFStringAppendFormat(a1, 0, CFSTR("%2d. "), v6);
      v8 = *(char **)v7;
      if (!*(_QWORD *)v7)
        v8 = sub_1000108E0(*(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
      CFStringAppendFormat(a1, 0, CFSTR("Subnet '%s'"), v8);
      if (*(_QWORD *)(v7 + 40))
        CFStringAppendFormat(a1, 0, CFSTR(": supernet %s\n"), *(_QWORD *)(v7 + 40));
      else
        CFStringAppendFormat(a1, 0, CFSTR("\n"), v20);
      v9.s_addr = *(_DWORD *)(v7 + 8);
      v10 = inet_ntoa(v9);
      CFStringAppendFormat(a1, 0, CFSTR("\tNetwork: %s"), v10);
      v11.s_addr = *(_DWORD *)(v7 + 12);
      v12 = inet_ntoa(v11);
      CFStringAppendFormat(a1, 0, CFSTR("/%s\n"), v12);
      v13.s_addr = *(_DWORD *)(v7 + 16);
      v14 = inet_ntoa(v13);
      CFStringAppendFormat(a1, 0, CFSTR("\tRange: %s.."), v14);
      v15.s_addr = *(_DWORD *)(v7 + 20);
      v16 = inet_ntoa(v15);
      CFStringAppendFormat(a1, 0, CFSTR("%s\n"), v16);
      v17 = "yes";
      if (!*(_BYTE *)(v7 + 24))
        v17 = "no";
      CFStringAppendFormat(a1, 0, CFSTR("\tAllocate: %s\n"), v17);
      if (*(_BYTE *)(v7 + 24))
        CFStringAppendFormat(a1, 0, CFSTR("\tLease Min: %d   Lease Max: %d\n"), *(unsigned int *)(v7 + 28), *(unsigned int *)(v7 + 32));
      if (*(_DWORD *)(v7 + 56))
      {
        CFStringAppendFormat(a1, 0, CFSTR("\tOptions:\n"));
        CFStringAppendFormat(a1, 0, CFSTR("\t%6s %6s   %s\n"), "Code", "Length", "Data");
        if (*(int *)(v7 + 56) >= 1)
        {
          v18 = 0;
          v19 = 0;
          do
          {
            CFStringAppendFormat(a1, 0, CFSTR("\t%6d %6d   "), *(unsigned int *)(*(_QWORD *)(v7 + 48) + v18), *(unsigned int *)(*(_QWORD *)(v7 + 48) + v18 + 4));
            sub_100010D18(a1, *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18 + 8), *(_DWORD *)(*(_QWORD *)(v7 + 48) + v18 + 4));
            CFStringAppendFormat(a1, 0, CFSTR("\n"));
            ++v19;
            v18 += 16;
          }
          while (v19 < *(int *)(v7 + 56));
        }
      }
    }
    while ((_DWORD)v6 != v5);
  }
}

uint64_t SubnetListAcquireAddress(uint64_t a1, _DWORD *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t a4)
{
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  const char *v22;
  const char *v23;
  _DWORD *v25;
  int v26;

  v8 = *a2;
  v9 = sub_10000CEA8(a1);
  if (v9 < 1)
    return 0;
  v10 = v9;
  v11 = 0;
  while (1)
  {
    v12 = sub_10000F6EC(a1, v11);
    if ((*(_DWORD *)(v12 + 12) & v8) == *(_DWORD *)(v12 + 8))
      break;
    v11 = (v11 + 1);
    if (v10 == (_DWORD)v11)
      return 0;
  }
  v13 = v12;
  v14 = sub_10000CEA8(a1);
  if (v14 < 1)
    return 0;
  v15 = v14;
  v25 = a2;
  v16 = 0;
  v26 = v14;
  while (1)
  {
    v17 = sub_10000F6EC(a1, v16);
    v18 = v17;
    if (v17 != v13 && (*(_DWORD *)(v17 + 12) & v8) != *(_DWORD *)(v17 + 8))
    {
      v22 = *(const char **)(v17 + 40);
      if (!v22)
        goto LABEL_21;
      v23 = *(const char **)(v13 + 40);
      if (!v23 || strcmp(v22, v23))
        goto LABEL_21;
    }
    if (!*(_BYTE *)(v18 + 24))
      goto LABEL_21;
    v19 = bswap32(*(_DWORD *)(v18 + 20));
    v20 = bswap32(*(_DWORD *)(v18 + 36));
    if (v20 == v19 + 1)
      v20 = bswap32(*(_DWORD *)(v18 + 16));
    if (v20 <= v19)
      break;
LABEL_17:
    v15 = v26;
    *(_DWORD *)(v18 + 36) = bswap32(v19 + 1);
LABEL_21:
    v16 = (v16 + 1);
    if ((_DWORD)v16 == v15)
      return 0;
  }
  if (a3)
  {
    while (1)
    {
      v21 = bswap32(v20);
      if ((a3(a4, v21) & 1) == 0)
        break;
      if (++v20 > v19)
        goto LABEL_17;
    }
  }
  else
  {
    LODWORD(v21) = bswap32(v20);
  }
  *v25 = v21;
  *(_DWORD *)(v18 + 36) = v21;
  return v18;
}

uint64_t SubnetListGetSubnetForAddress(uint64_t a1, unsigned int a2, int a3)
{
  int v6;
  unsigned int (*v7)(uint64_t, _QWORD);
  int v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_10000CEA8(a1);
  if (a3)
    v7 = (unsigned int (*)(uint64_t, _QWORD))sub_100011A90;
  else
    v7 = (unsigned int (*)(uint64_t, _QWORD))sub_100011A7C;
  if (v6 < 1)
    return 0;
  v8 = v6;
  v9 = 0;
  while (1)
  {
    v10 = sub_10000F6EC(a1, v9);
    if (v7(v10, a2))
      break;
    v9 = (v9 + 1);
    if (v8 == (_DWORD)v9)
      return 0;
  }
  return v10;
}

BOOL sub_100011A7C(uint64_t a1, int a2)
{
  return (*(_DWORD *)(a1 + 12) & a2) == *(_DWORD *)(a1 + 8);
}

BOOL sub_100011A90(_DWORD *a1, unsigned int a2)
{
  unsigned int v2;

  if ((a1[3] & a2) == a1[2] && (v2 = bswap32(a2), v2 >= bswap32(a1[4])))
    return v2 <= bswap32(a1[5]);
  else
    return 0;
}

BOOL SubnetListAreAddressesOnSameSupernet(uint64_t a1, int a2, int a3)
{
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;

  v6 = sub_10000CEA8(a1);
  if (v6 < 1)
  {
LABEL_5:
    v10 = 0;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = sub_10000F6EC(a1, v8);
      if ((*(_DWORD *)(v9 + 12) & a2) == *(_DWORD *)(v9 + 8))
        break;
      v8 = (v8 + 1);
      if (v7 == (_DWORD)v8)
        goto LABEL_5;
    }
    v10 = v9;
  }
  v11 = sub_10000CEA8(a1);
  if (v11 < 1)
    return 0;
  v12 = v11;
  v13 = 0;
  while (1)
  {
    v14 = sub_10000F6EC(a1, v13);
    if ((*(_DWORD *)(v14 + 12) & a3) == *(_DWORD *)(v14 + 8))
      break;
    v13 = (v13 + 1);
    if (v12 == (_DWORD)v13)
      return 0;
  }
  if (!v10)
    return 0;
  if (v10 != v14)
  {
    if (*(_QWORD *)(v10 + 40))
    {
      v15 = *(const char **)(v14 + 40);
      if (v15)
        return strcmp(*(const char **)(v10 + 40), v15) == 0;
    }
    return 0;
  }
  return 1;
}

const void *sub_100011BCC(const void *a1)
{
  CFTypeID TypeID;

  TypeID = CFStringGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

__CFArray *sub_100011C0C(const __CFDictionary *a1, _DWORD *a2)
{
  CFIndex Count;
  CFIndex v5;
  size_t v6;
  const void **v7;
  const void **v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *ValueAtIndex;
  char *v12;
  char *v13;
  unsigned int v14;
  unsigned int v15;
  CFTypeID TypeID;
  const __CFData *v17;
  const __CFData *Copy;
  __CFDictionary *v19;
  CFNumberRef v20;
  unsigned int *v21;
  int *v22;
  char *v23;
  int v24;
  char *v25;
  CFTypeID v26;
  CFTypeID v27;
  BOOL v28;
  const char *v29;
  const char *v30;
  CFTypeID v31;
  CFTypeID v32;
  const char *v33;
  CFTypeID v34;
  unsigned int v35;
  CFTypeID v36;
  CFIndex v37;
  uint64_t v38;
  CFIndex v39;
  const __CFString *v40;
  __CFData *v41;
  CFIndex v42;
  const __CFData *v43;
  CFMutableDataRef Mutable;
  const __CFData *v45;
  CFIndex v46;
  const __CFString *v47;
  CFTypeID v48;
  unsigned __int8 *v49;
  unsigned __int8 *v50;
  const UInt8 *v51;
  UInt8 *v52;
  const __CFData *v53;
  const char *v54;
  __CFArray *v55;
  uint64_t v57;
  const __CFData *theData;
  __CFData *theDataa;
  _DWORD *v60;
  __CFArray *theArray;
  int v62;
  unsigned int valuePtr;
  UInt8 bytes[8];
  char __str[256];
  CFRange v66;

  *a2 = 0;
  Count = CFDictionaryGetCount(a1);
  if (!Count)
    return 0;
  v5 = Count;
  v60 = a2;
  v6 = 8 * Count;
  v7 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
  v8 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(a1, v7, v8);
  theArray = CFArrayCreateMutable(0, v5, &kCFTypeArrayCallBacks);
  if (v5 >= 1)
  {
    v9 = 0;
    v62 = 0;
    while (1)
    {
      valuePtr = 0;
      v10 = (const __CFString *)v7[v9];
      ValueAtIndex = (const __CFString *)v8[v9];
      if (!CFStringHasPrefix(v10, CFSTR("dhcp_")))
        goto LABEL_35;
      v66.length = CFStringGetLength(v10) - 5;
      v66.location = 5;
      v12 = (char *)sub_10000C820(v10, v66, 0x8000100u);
      if (!v12)
        goto LABEL_35;
      v13 = v12;
      v14 = sub_10000CE18(v12);
      valuePtr = v14;
      if (v14 == 1)
        goto LABEL_34;
      v15 = v14;
      if (v14 == -1)
      {
        syslog(5, "subnets: unrecognized option '%s'");
        goto LABEL_34;
      }
      __str[0] = 0;
      TypeID = CFDataGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == TypeID)
      {
        v17 = (const __CFData *)CFRetain(ValueAtIndex);
      }
      else
      {
        v21 = (unsigned int *)sub_10000CE00(v15);
        if (!v21)
        {
          v30 = "Unknown tag";
          goto LABEL_28;
        }
        v22 = (int *)v21;
        v23 = sub_10000C920(*v21);
        v24 = *v22;
        if (!v23)
        {
          snprintf(__str, 0x100uLL, "Unknown type %d");
          goto LABEL_33;
        }
        v25 = v23;
        v26 = CFArrayGetTypeID();
        if (!ValueAtIndex)
        {
          CFStringGetTypeID();
LABEL_32:
          CFNumberGetTypeID();
          CFBooleanGetTypeID();
          CFArrayGetTypeID();
          goto LABEL_33;
        }
        if (CFGetTypeID(ValueAtIndex) != v26)
          goto LABEL_21;
        if (!CFArrayGetCount((CFArrayRef)ValueAtIndex))
        {
          v30 = "Empty array";
LABEL_28:
          __strlcpy_chk(__str, v30, 256, 256);
LABEL_33:
          syslog(5, "subnets: Failed to convert '%s': %s");
          goto LABEL_34;
        }
        if (!*((_DWORD *)v25 + 4))
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, 0);
          v27 = CFStringGetTypeID();
          if (!ValueAtIndex)
            goto LABEL_32;
        }
        else
        {
LABEL_21:
          v27 = CFStringGetTypeID();
        }
        if (CFGetTypeID(ValueAtIndex) == v27)
        {
          *(_QWORD *)bytes = 0;
          if (*((_DWORD *)v25 + 1) && (v28 = v24 == 12, v24 = *((_DWORD *)v25 + 1), v28))
          {
            v29 = "Type requires IP address pairs";
          }
          else
          {
            switch(v24)
            {
              case 2:
              case 3:
              case 4:
              case 5:
              case 6:
                if ((sub_10000C6C4(ValueAtIndex, bytes) & 1) == 0)
                {
                  v29 = "Invalid IP number";
                  break;
                }
                Copy = sub_10001267C(v24, *(unsigned int *)bytes);
                if (!Copy)
                {
                  v33 = "Failed to convert to numeric";
LABEL_73:
                  __strlcpy_chk(__str, v33, 256, 256);
                }
                goto LABEL_13;
              case 9:
                v17 = sub_10000C908(ValueAtIndex);
                goto LABEL_12;
              case 10:
                if ((sub_10000C614(ValueAtIndex, (in_addr *)&bytes[4]) & 1) != 0)
                {
                  v17 = CFDataCreate(0, &bytes[4], 4);
                  goto LABEL_12;
                }
                v29 = "Invalid IP address";
                break;
              case 13:
                Copy = sub_10000E0C4(ValueAtIndex);
                if (Copy)
                  goto LABEL_13;
                v33 = "Failed to encode DNS search";
                goto LABEL_73;
              default:
                snprintf(__str, 0x100uLL, "Failed to convert from string to %s", *((const char **)v25 + 1));
                goto LABEL_76;
            }
          }
LABEL_75:
          __strlcpy_chk(__str, v29, 256, 256);
LABEL_76:
          Copy = 0;
          goto LABEL_13;
        }
        v31 = CFNumberGetTypeID();
        if (CFGetTypeID(ValueAtIndex) != v31)
        {
          v32 = CFBooleanGetTypeID();
          if (CFGetTypeID(ValueAtIndex) != v32)
          {
            v36 = CFArrayGetTypeID();
            if (CFGetTypeID(ValueAtIndex) != v36)
              goto LABEL_33;
            v37 = CFArrayGetCount((CFArrayRef)ValueAtIndex);
            v38 = v37;
            switch(v24)
            {
              case 7:
              case 8:
                *(_DWORD *)&bytes[4] = 0;
                theData = CFDataCreateMutable(0, v37 * *(int *)v25);
                if (v38 < 1)
                  goto LABEL_64;
                v39 = 0;
                while (1)
                {
                  v40 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v39);
                  if ((sub_10000C760(v40, &bytes[4]) & 1) == 0)
                    break;
                  if (*(_DWORD *)v25 == 1)
                  {
                    bytes[0] = bytes[4];
                    v41 = theData;
                    v42 = 1;
                  }
                  else
                  {
                    *(_WORD *)bytes = bswap32(*(unsigned __int16 *)&bytes[4]) >> 16;
                    v41 = theData;
                    v42 = 2;
                  }
                  CFDataAppendBytes(v41, bytes, v42);
                  if (v38 == ++v39)
                  {
LABEL_64:
                    v43 = theData;
                    Copy = CFDataCreateCopy(0, theData);
                    goto LABEL_92;
                  }
                }
                __strlcpy_chk(__str, "Invalid number", 256, 256);
                Copy = 0;
                v43 = theData;
LABEL_92:
                v53 = v43;
                goto LABEL_100;
              case 11:
                goto LABEL_79;
              case 12:
                if ((v37 & 1) != 0)
                {
                  v30 = "Type requires pairs of IP address values";
                  goto LABEL_28;
                }
LABEL_79:
                *(_DWORD *)&bytes[4] = 0;
                Mutable = CFDataCreateMutable(0, 4 * v37);
                v45 = Mutable;
                if (v38 < 1)
                  goto LABEL_85;
                v46 = 0;
                v57 = v38;
                theDataa = Mutable;
                break;
              case 13:
                Copy = sub_10000E03C((const __CFArray *)ValueAtIndex, 1);
                if (Copy)
                  goto LABEL_14;
                v30 = "Failed to encode DNS search";
                goto LABEL_28;
              case 14:
                *(_DWORD *)&bytes[4] = 0;
                v49 = (unsigned __int8 *)sub_10000EE58((const __CFArray *)ValueAtIndex, &bytes[4]);
                if (!v49)
                  goto LABEL_76;
                v50 = v49;
                *(_DWORD *)bytes = 0;
                v51 = (const UInt8 *)sub_10000E7CC(v49, *(int *)&bytes[4], 0, (int *)bytes);
                if (v51)
                {
                  v52 = (UInt8 *)v51;
                  Copy = CFDataCreate(0, v51, *(int *)bytes);
                  free(v52);
                }
                else
                {
                  Copy = 0;
                }
                free(v50);
                goto LABEL_13;
              default:
                snprintf(__str, 0x100uLL, "Can't convert array to %s");
                goto LABEL_33;
            }
            while (1)
            {
              v47 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v46);
              v48 = CFStringGetTypeID();
              if (!v47 || CFGetTypeID(v47) != v48)
              {
                v54 = "Can't convert non-string to IP address";
                goto LABEL_98;
              }
              if ((sub_10000C614(v47, (in_addr *)&bytes[4]) & 1) == 0)
                break;
              v45 = theDataa;
              CFDataAppendBytes(theDataa, &bytes[4], 4);
              if (v57 == ++v46)
              {
LABEL_85:
                Copy = CFDataCreateCopy(0, v45);
                goto LABEL_99;
              }
            }
            v54 = "Invalid IP address";
LABEL_98:
            __strlcpy_chk(__str, v54, 256, 256);
            Copy = 0;
            v45 = theDataa;
LABEL_99:
            v53 = v45;
LABEL_100:
            CFRelease(v53);
            goto LABEL_13;
          }
        }
        *(_DWORD *)&bytes[4] = 0;
        if (*((_DWORD *)v25 + 1))
        {
          v28 = v24 == 12;
          v24 = *((_DWORD *)v25 + 1);
          if (v28)
          {
            v29 = "Type requires pairs of IP address values";
            goto LABEL_75;
          }
        }
        v34 = CFBooleanGetTypeID();
        if (CFGetTypeID(ValueAtIndex) == v34)
        {
          v35 = CFEqual(ValueAtIndex, kCFBooleanTrue) != 0;
          *(_DWORD *)&bytes[4] = v35;
        }
        else
        {
          if (!CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberSInt32Type, &bytes[4]))
          {
            v29 = "Failed to convert to numeric";
            goto LABEL_75;
          }
          v35 = *(_DWORD *)&bytes[4];
        }
        v17 = sub_10001267C(v24, v35);
      }
LABEL_12:
      Copy = v17;
LABEL_13:
      if (!Copy)
        goto LABEL_33;
LABEL_14:
      v62 += CFDataGetLength(Copy);
      v19 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(v19, CFSTR("Tag"), v20);
      CFRelease(v20);
      CFDictionarySetValue(v19, CFSTR("Data"), Copy);
      CFRelease(Copy);
      CFArrayAppendValue(theArray, v19);
      CFRelease(v19);
LABEL_34:
      free(v13);
LABEL_35:
      if (++v9 == v5)
        goto LABEL_102;
    }
  }
  v62 = 0;
LABEL_102:
  free(v7);
  free(v8);
  v55 = theArray;
  if (!CFArrayGetCount(theArray))
  {
    CFRelease(theArray);
    return 0;
  }
  *v60 = v62;
  return v55;
}

uint64_t sub_10001243C(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  int v5;
  int v6;
  const __CFString *v7;
  uint64_t result;
  unsigned int v9;
  unsigned int v10;

  v10 = 0;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("lease_max"));
  v5 = sub_10000C760(Value, &v10);
  v6 = v10;
  if (!v5)
    v6 = 86400;
  *(_DWORD *)(a1 + 32) = v6;
  v7 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("lease_min"));
  result = sub_10000C760(v7, &v10);
  v9 = v10;
  if (!v10)
    v9 = 3600;
  if (!(_DWORD)result)
    v9 = 3600;
  *(_DWORD *)(a1 + 28) = v9;
  if (*(_DWORD *)(a1 + 32) < v9)
    *(_DWORD *)(a1 + 32) = v9;
  return result;
}

BOOL sub_1000124DC(const __CFDictionary *a1)
{
  const void *Value;
  CFTypeID TypeID;

  Value = CFDictionaryGetValue(a1, CFSTR("allocate"));
  TypeID = CFBooleanGetTypeID();
  return Value && CFGetTypeID(Value) == TypeID && CFBooleanGetValue((CFBooleanRef)Value) != 0;
}

uint64_t sub_100012538(const __CFArray *a1, uint64_t a2, int a3)
{
  CFIndex Count;
  uint64_t v7;
  CFIndex v8;
  CFIndex v9;
  char *v10;
  int v11;
  _QWORD *i;
  const __CFDictionary *ValueAtIndex;
  const __CFData *Value;
  const __CFNumber *v15;
  int Length;
  const UInt8 *BytePtr;
  int valuePtr;

  Count = CFArrayGetCount(a1);
  v7 = 16 * Count;
  if (16 * Count > (unint64_t)a3)
  {
    syslog(5, "copyOptionsDataArrayToOptionTLVList %d < %d");
    return 0;
  }
  v8 = Count;
  if (Count >= 1)
  {
    v9 = 0;
    v10 = (char *)(a2 + v7);
    v11 = a3 - v7;
    for (i = (_QWORD *)(a2 + 8); ; i += 2)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v9);
      valuePtr = 0;
      Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Data"));
      v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Tag"));
      CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
      Length = CFDataGetLength(Value);
      *((_DWORD *)i - 2) = valuePtr;
      *((_DWORD *)i - 1) = Length;
      *i = v10;
      if (v11 < Length)
        break;
      BytePtr = CFDataGetBytePtr(Value);
      memcpy(v10, BytePtr, Length);
      v10 += Length;
      ++v9;
      v11 -= Length;
      if (v8 == v9)
        return a2;
    }
    syslog(5, "copyOptionsDataArrayToOptionTLVList option %d < %d");
    return 0;
  }
  return a2;
}

CFDataRef sub_10001267C(int a1, unsigned int a2)
{
  UInt8 *v2;
  CFIndex v3;
  CFDataRef result;
  UInt8 bytes[2];
  BOOL v6;
  unsigned int v7;

  v6 = 0;
  switch(a1)
  {
    case 2:
      v6 = a2 != 0;
      goto LABEL_6;
    case 3:
      v6 = a2;
LABEL_6:
      v2 = (UInt8 *)&v6;
      v3 = 1;
      goto LABEL_8;
    case 4:
      *(_WORD *)bytes = bswap32(a2) >> 16;
      v2 = bytes;
      v3 = 2;
      goto LABEL_8;
    case 5:
    case 6:
      v7 = bswap32(a2);
      v2 = (UInt8 *)&v7;
      v3 = 4;
LABEL_8:
      result = CFDataCreate(0, v2, v3);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

_QWORD *sub_10001271C(unsigned int a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = malloc_type_malloc(0x30uLL, 0x10A0040A76AC297uLL);
  if (v4)
  {
    *v4 = sub_1000133A0(a1, a2);
    v4[1] = v5;
    v4[4] = 0;
    v4[5] = 0;
  }
  return v4;
}

void sub_10001277C(uint64_t a1)
{
  sub_100013338((unsigned int *)a1);
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  free((void *)a1);
}

_QWORD *sub_1000127AC(_QWORD *result)
{
  result[1] = 0;
  result[2] = 0;
  *result = 0;
  *((_DWORD *)result + 4) = 256;
  return result;
}

void sub_1000127C0(uint64_t a1, int a2)
{
  int v2;
  int v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  if (a2 <= 10)
    v2 = 10;
  else
    v2 = a2;
  *(_DWORD *)(a1 + 16) = v2;
  v3 = *(_DWORD *)(a1 + 20);
  v4 = v3 - v2;
  if (v3 > v2)
  {
    if (v4 <= 0)
    {
      *(_QWORD *)(a1 + 8) = 0;
      v8 = (_QWORD *)a1;
    }
    else
    {
      v6 = *(_QWORD *)(a1 + 8);
      do
      {
        v7 = v6;
        v6 = *(_QWORD *)(v6 + 40);
        sub_10001277C(v7);
        --v4;
      }
      while (v4);
      *(_QWORD *)(a1 + 8) = v6;
      v8 = (_QWORD *)(v6 + 32);
      if (!v6)
        v8 = (_QWORD *)a1;
    }
    *v8 = 0;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(a1 + 16);
  }
}

uint64_t sub_100012848(uint64_t *a1)
{
  uint64_t result;
  uint64_t v3;

  result = *a1;
  if (result)
  {
    do
    {
      v3 = *(_QWORD *)(result + 32);
      sub_10001277C(result);
      result = v3;
    }
    while (v3);
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

uint64_t *sub_100012884(uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = *result;
    *(_QWORD *)(a2 + 32) = *result;
    *(_QWORD *)(a2 + 40) = 0;
    if (v2)
      v3 = (_QWORD *)(v2 + 40);
    else
      v3 = result + 1;
    *v3 = a2;
    *result = a2;
    ++*((_DWORD *)result + 5);
  }
  return result;
}

uint64_t sub_1000128B8(uint64_t a1, char *__filename)
{
  FILE *v3;
  FILE *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char *v9;
  int v10;
  int v11;
  char *v12;
  int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  unsigned int v21;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  char v30[768];
  char v31[128];
  char __s[2];
  unsigned __int8 v33;

  v24 = 0;
  v25 = 0;
  v3 = fopen(__filename, "r");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
LABEL_3:
    v7 = v6;
    while (1)
    {
      v8 = 1023;
      v9 = __s;
      do
      {
        v10 = fgetc(v4);
        if ((v10 + 1) < 2)
          break;
        if (v8 >= 1)
        {
          *v9++ = v10;
          --v8;
        }
      }
      while (v10 != 10);
      if (v9 == __s)
        break;
      *v9 = 0;
      ++v5;
      if (!(*(unsigned __int16 *)__s ^ 0xA7B | v33))
      {
        v6 = 1;
        if (v7 && v7 != 3)
        {
          fprintf(__stderrp, "unexpected '{' at line %d\n");
          goto LABEL_35;
        }
        goto LABEL_3;
      }
      if (!(*(unsigned __int16 *)__s ^ 0xA7D | v33))
      {
        if ((v7 - 3) <= 0xFFFFFFFD)
        {
          fprintf(__stderrp, "unexpected '}' at line %d\n");
          goto LABEL_35;
        }
        v6 = 3;
        if ((_DWORD)v24)
        {
          v18 = sub_10001271C(v24, v25);
          if (v18)
          {
            v18[4] = 0;
            v19 = *(_QWORD *)(a1 + 8);
            v18[5] = v19;
            v20 = (_QWORD *)(v19 + 32);
            if (!*(_QWORD *)a1)
              v20 = (_QWORD *)a1;
            *v20 = v18;
            *(_QWORD *)(a1 + 8) = v18;
            ++*(_DWORD *)(a1 + 20);
          }
          sub_100013338((unsigned int *)&v24);
          v6 = 3;
        }
        goto LABEL_3;
      }
      bzero(v30, 0x300uLL);
      v11 = strlen(__s);
      v12 = strchr(__s, 61);
      v13 = strspn(__s, " \t\n");
      v14 = v13;
      if (v13 != v11)
      {
        if (v12)
        {
          v15 = (_DWORD)v12 - __s;
          v16 = v15 - v13;
          if (v15 - v13 >= 0x80)
          {
            v16 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v5);
            v15 = (_DWORD)v12 - __s;
          }
          v17 = v11 - v15 - 2;
          if (v17 >= 0x300)
          {
            v17 = 767;
            fprintf(__stderrp, "value truncated to %d bytes at line %d\n", 767, v5);
          }
          __strncpy_chk(v31, &__s[v14], v16, 128);
          v31[v16] = 0;
          __strncpy_chk(v30, v12 + 1, v17, 768);
          v30[v17] = 0;
          *((_QWORD *)&v28 + 1) = 0;
          v29 = 0;
          *(_QWORD *)&v28 = v31;
          sub_1000135A8((unsigned int *)&v28 + 2, v30, 0);
        }
        else
        {
          v21 = ~v13 + v11;
          if (v21 >= 0x80)
          {
            v21 = 127;
            fprintf(__stderrp, "property name truncated to %d bytes at line %d\n", 127, v5);
          }
          __strncpy_chk(v31, &__s[v14], v21, 128);
          v31[v21] = 0;
          *((_QWORD *)&v28 + 1) = 0;
          v29 = 0;
          *(_QWORD *)&v28 = v31;
        }
        v26 = v28;
        v27 = v29;
        sub_100013154((unsigned int *)&v24, (uint64_t)&v26, 0xFFFFFFFFFFFFFFFFLL);
        sub_100013540((_QWORD *)&v28 + 1);
        v6 = 2;
        goto LABEL_3;
      }
    }
    if ((v7 - 1) <= 1)
      fwrite("file ends prematurely\n", 0x16uLL, 1uLL, __stderrp);
LABEL_35:
    fclose(v4);
  }
  else
  {
    perror(__filename);
  }
  sub_100013338((unsigned int *)&v24);
  return 1;
}

uint64_t sub_100012C70(unsigned int **a1, const std::__fs::filesystem::path *a2)
{
  FILE *v4;
  FILE *v5;
  unsigned int *i;
  uint64_t v7;
  unint64_t v8;
  std::error_code *v9;
  std::__fs::filesystem::path __str[10];

  snprintf((char *)__str, 0x100uLL, "%s-", (const char *)a2);
  v4 = fopen((const char *)__str, "w");
  if (v4)
  {
    v5 = v4;
    for (i = *a1; i; i = (unsigned int *)*((_QWORD *)i + 4))
    {
      fwrite("{\n", 2uLL, 1uLL, v5);
      if (*i)
      {
        v7 = 0;
        v8 = 0;
        do
        {
          if (*(_DWORD *)(*((_QWORD *)i + 1) + v7 + 8))
            fprintf(v5, "\t%s=%s\n");
          else
            fprintf(v5, "\t%s\n");
          ++v8;
          v7 += 24;
        }
        while (v8 < *i);
      }
      fwrite("}\n", 2uLL, 1uLL, v5);
    }
    fclose(v5);
    rename(__str, a2, v9);
    return 1;
  }
  else
  {
    perror((const char *)__str);
    return 0;
  }
}

uint64_t sub_100012DF4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a2 + 40);
    if (v2)
      *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
    v3 = *(_QWORD *)(a2 + 32);
    if (v3)
      *(_QWORD *)(v3 + 40) = v2;
    if (*(_QWORD *)result == a2)
      *(_QWORD *)result = v3;
    if (*(_QWORD *)(result + 8) == a2)
      *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 40);
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0;
    --*(_DWORD *)(result + 20);
  }
  return result;
}

uint64_t *sub_100012E50(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;

  if (*result != a2)
  {
    v3 = result;
    result = (uint64_t *)sub_100012DF4((uint64_t)result, a2);
    if (a2)
    {
      v4 = *v3;
      *(_QWORD *)(a2 + 32) = *v3;
      *(_QWORD *)(a2 + 40) = 0;
      if (v4)
        v5 = (uint64_t *)(v4 + 40);
      else
        v5 = v3 + 1;
      *v5 = a2;
      *v3 = a2;
      ++*((_DWORD *)v3 + 5);
    }
  }
  return result;
}

_QWORD *sub_100012EB0(uint64_t *a1, const char *a2, unsigned int (*a3)(uint64_t, _QWORD), uint64_t a4, in_addr *a5, _DWORD *a6)
{
  _QWORD *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _DWORD *v19;
  int v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;

  if (a6)
    *a6 = 0;
  v9 = (_QWORD *)*a1;
  if (*a1)
  {
    while (1)
    {
      v10 = sub_1000134A8(*v9, v9[1], "identifier", 0);
      if (v10 << 32 != 0xFFFFFFFF00000000)
      {
        v11 = v10;
        v12 = v9[1];
        v13 = v12 + 24 * (int)v10;
        v15 = *(_DWORD *)(v13 + 8);
        v14 = (_DWORD *)(v13 + 8);
        if (v15)
        {
          if (!a5 && !strcmp(**(const char ***)(v12 + 24 * (int)v10 + 16), a2))
          {
            if (a6)
              *a6 = 1;
            goto LABEL_26;
          }
          v16 = sub_1000134A8(*v9, v12, "ip_address", 0);
          if (v16 << 32 != 0xFFFFFFFF00000000)
          {
            v17 = v9[1];
            v18 = v17 + 24 * (int)v16;
            v20 = *(_DWORD *)(v18 + 8);
            v19 = (_DWORD *)(v18 + 8);
            if (v20)
            {
              if (*v14)
                break;
            }
          }
        }
      }
LABEL_22:
      v9 = (_QWORD *)v9[4];
      if (!v9)
        return v9;
    }
    v21 = 0;
    v22 = (_QWORD *)(v12 + 24 * v11 + 16);
    v23 = (_QWORD *)(v17 + 24 * (int)v16 + 16);
    while (1)
    {
      if (!strcmp(*(const char **)(*v22 + 8 * v21), a2)
        && inet_aton(*(const char **)(*v23 + 8 * (v21 % *v19)), a5))
      {
        if (a6)
          *a6 = 1;
        if (!a3 || a5 && a3(a4, a5->s_addr))
          break;
      }
      if (++v21 >= (unint64_t)*v14)
        goto LABEL_22;
    }
LABEL_26:
    sub_100012E50(a1, (uint64_t)v9);
  }
  return v9;
}

_QWORD *sub_100013068(uint64_t *a1, int a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  in_addr v14;

  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    while (1)
    {
      v5 = sub_1000134A8(*v2, v2[1], "ip_address", 0);
      if (v5 << 32 != 0xFFFFFFFF00000000)
      {
        v6 = v2[1];
        v7 = v6 + 24 * (int)v5;
        v9 = *(_DWORD *)(v7 + 8);
        v8 = (unsigned int *)(v7 + 8);
        if (v9)
          break;
      }
LABEL_10:
      v2 = (_QWORD *)v2[4];
      if (!v2)
        return v2;
    }
    v10 = 0;
    v11 = (_QWORD *)(v6 + 24 * (int)v5 + 16);
    while (1)
    {
      v14.s_addr = 0;
      if (inet_aton(*(const char **)(*v11 + 8 * v10), &v14) && v14.s_addr == a2)
        break;
      if (++v10 >= (unint64_t)*v8)
        goto LABEL_10;
    }
    sub_100012E50(a1, (uint64_t)v2);
  }
  return v2;
}

uint64_t sub_100013154(unsigned int *a1, uint64_t a2, unint64_t a3)
{
  void *v6;
  unsigned int v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  const char *v13;
  uint64_t v14;
  const char **v15;
  char *v16;
  uint64_t result;
  char *v18;

  v6 = (void *)*((_QWORD *)a1 + 1);
  v7 = *a1 + 1;
  if (v6)
    v8 = (char *)malloc_type_realloc(v6, 24 * v7, 0x1090040D67CC068uLL);
  else
    v8 = (char *)malloc_type_malloc(24 * v7, 0x1090040D67CC068uLL);
  *((_QWORD *)a1 + 1) = v8;
  v9 = *a1;
  if (v9 <= a3)
  {
    a3 = *a1;
  }
  else
  {
    v10 = 24 * v9;
    do
    {
      v11 = *((_QWORD *)a1 + 1) + v10;
      --v9;
      *(_OWORD *)v11 = *(_OWORD *)(v11 - 24);
      *(_QWORD *)(v11 + 16) = *(_QWORD *)(v11 - 8);
      v10 -= 24;
    }
    while (v9 > a3);
    v8 = (char *)*((_QWORD *)a1 + 1);
  }
  v12 = (char **)&v8[24 * a3];
  v13 = *(const char **)a2;
  v14 = *(_QWORD *)(a2 + 8);
  v15 = *(const char ***)(a2 + 16);
  v16 = strdup(v13);
  result = sub_100013434(v14, v15);
  *v12 = v16;
  v12[1] = (char *)result;
  v12[2] = v18;
  ++*a1;
  return result;
}

void *sub_100013254(int *a1, uint64_t a2)
{
  int v2;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 *v10;
  __int128 v11;
  void *v12;
  void *result;

  v2 = a2;
  sub_100013308(*((_QWORD *)a1 + 1) + 24 * a2);
  v4 = v2 + 1;
  v5 = *a1;
  if (v2 + 1 < *a1)
  {
    v6 = v4;
    v7 = 24 * v4;
    do
    {
      v8 = *((_QWORD *)a1 + 1);
      v9 = v8 + 24 * v2;
      v10 = (__int128 *)(v8 + v7);
      v11 = *v10;
      *(_QWORD *)(v9 + 16) = *((_QWORD *)v10 + 2);
      *(_OWORD *)v9 = v11;
      v2 = v6++;
      v5 = *a1;
      v7 += 24;
    }
    while (*a1 > v6);
  }
  v12 = (void *)*((_QWORD *)a1 + 1);
  *a1 = v5 - 1;
  result = malloc_type_realloc(v12, 24 * (v5 - 1), 0x1090040D67CC068uLL);
  *((_QWORD *)a1 + 1) = result;
  return result;
}

void sub_100013308(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
  }
  sub_100013540((_QWORD *)(a1 + 8));
}

void sub_100013338(unsigned int *a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  v2 = (void *)*((_QWORD *)a1 + 1);
  if (v2)
  {
    if (*a1)
    {
      v3 = 0;
      v4 = 0;
      do
      {
        sub_100013308(*((_QWORD *)a1 + 1) + v3);
        ++v4;
        v3 += 24;
      }
      while (v4 < *a1);
      v2 = (void *)*((_QWORD *)a1 + 1);
    }
    free(v2);
    *(_QWORD *)a1 = 0;
    *((_QWORD *)a1 + 1) = 0;
  }
}

uint64_t sub_1000133A0(unsigned int a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  const char ***v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a1;
  v4 = (char *)malloc_type_malloc(24 * a1, 0x1090040D67CC068uLL);
  if (v3)
  {
    v5 = v4 + 16;
    v6 = (const char ***)(a2 + 16);
    v7 = v3;
    do
    {
      *(v5 - 2) = strdup((const char *)*(v6 - 2));
      *(v5 - 1) = sub_100013434(*(v6 - 1), *v6);
      *v5 = v8;
      v5 += 3;
      v6 += 3;
      --v7;
    }
    while (v7);
  }
  return v3;
}

uint64_t sub_100013434(unsigned int a1, const char **a2)
{
  uint64_t v3;
  char **v4;
  char **v5;
  uint64_t v6;
  const char *v7;

  v3 = a1;
  v4 = (char **)malloc_type_malloc(8 * a1, 0x10040436913F5uLL);
  if (v3)
  {
    v5 = v4;
    v6 = v3;
    do
    {
      v7 = *a2++;
      *v5++ = strdup(v7);
      --v6;
    }
    while (v6);
  }
  return v3;
}

uint64_t sub_1000134A8(unsigned int a1, uint64_t a2, char *__s1, const char *a4)
{
  uint64_t v4;
  uint64_t v7;
  const char ***i;
  uint64_t v9;
  const char **j;

  v4 = a1;
  if (!a1)
    return -1;
  v7 = 0;
  for (i = (const char ***)(a2 + 16); strcmp(__s1, (const char *)*(i - 2)); i += 3)
  {
    if (v4 == ++v7)
      return -1;
  }
  if (a4)
  {
    v9 = *((unsigned int *)i - 2);
    if ((_DWORD)v9)
    {
      for (j = *i; strcmp(a4, *j); ++j)
      {
        if (!--v9)
          return -1;
      }
      return v7;
    }
    return -1;
  }
  return v7;
}

void sub_100013540(_QWORD *a1)
{
  void *v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  void *v6;

  v2 = (void *)a1[1];
  if (v2)
  {
    v3 = *(unsigned int *)a1;
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = a1[1];
        v6 = *(void **)(v5 + 8 * i);
        if (v6)
        {
          free(v6);
          *(_QWORD *)(v5 + 8 * i) = 0;
          v3 = *(unsigned int *)a1;
        }
      }
      v2 = (void *)a1[1];
    }
    free(v2);
    *a1 = 0;
    a1[1] = 0;
  }
}

char *sub_1000135A8(unsigned int *a1, const char *a2, unint64_t a3)
{
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *result;

  v6 = (void *)*((_QWORD *)a1 + 1);
  if (v6)
    v7 = malloc_type_realloc(v6, 8 * (*a1 + 1), 0x10040436913F5uLL);
  else
    v7 = malloc_type_malloc(8 * (*a1 + 1), 0x10040436913F5uLL);
  v8 = v7;
  *((_QWORD *)a1 + 1) = v7;
  v9 = *a1;
  v10 = v9;
  if (v9 > a3)
  {
    v11 = *a1;
    do
    {
      *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v11) = *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v11 - 8);
      --v11;
    }
    while (v11 > a3);
    v8 = (_QWORD *)*((_QWORD *)a1 + 1);
    v10 = a3;
  }
  result = strdup(a2);
  v8[v10] = result;
  *a1 = v9 + 1;
  return result;
}

void sub_100013678(unsigned int *a1, char *__s1, const char *a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  const char **v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  v8 = *(_QWORD *)a1;
  v9 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
LABEL_5:
    v10 = -1;
LABEL_9:
    v16 = 0;
    v15 = (unint64_t)__s1;
    if (a3)
      sub_1000135A8((unsigned int *)&v15 + 2, a3, 0);
    v13 = v15;
    v14 = v16;
    sub_100013154(a1, (uint64_t)&v13, v10);
    sub_100013540((_QWORD *)&v15 + 1);
    if (a4)
      *a4 = 1;
    return;
  }
  v10 = 0;
  v11 = *((_QWORD *)a1 + 1);
  v12 = (const char **)v11;
  while (strcmp(__s1, *v12))
  {
    ++v10;
    v12 += 3;
    if (v9 == v10)
      goto LABEL_5;
  }
  if (!a3 || sub_1000134A8(v8, v11, __s1, a3) != v10)
  {
    sub_100013254((int *)a1, v10);
    goto LABEL_9;
  }
}

uint64_t sub_10001378C(uint64_t result, char *__s1, _DWORD *a3)
{
  uint64_t v3;
  int *v6;
  uint64_t v7;
  const char **i;

  v3 = *(unsigned int *)result;
  if (*(_DWORD *)result)
  {
    v6 = (int *)result;
    v7 = 0;
    for (i = *(const char ***)(result + 8); ; i += 3)
    {
      result = strcmp(__s1, *i);
      if (!(_DWORD)result)
        break;
      v7 += (uint64_t)&_mh_execute_header;
      if (!--v3)
        return result;
    }
    if (v7 != 0xFFFFFFFF00000000)
    {
      result = (uint64_t)sub_100013254(v6, v7 >> 32);
      if (a3)
        *a3 = 1;
    }
  }
  return result;
}

void hostfree(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;

  v3 = (_QWORD *)a2[1];
  if (!v3)
    v3 = a1;
  *v3 = *a2;
  if (*a2)
    *(_QWORD *)(*a2 + 8) = a2[1];
  v4 = (void *)a2[35];
  if (v4)
  {
    free(v4);
    a2[35] = 0;
  }
  v5 = (void *)a2[36];
  if (v5)
    free(v5);
  free(a2);
}

_OWORD *hostadd(uint64_t a1, _OWORD *a2, char a3, uint64_t a4, unsigned int a5, _DWORD *a6, const char *a7, const char *a8)
{
  _OWORD *v16;
  _OWORD *v17;
  uint64_t v18;

  v16 = malloc_type_malloc(0x140uLL, 0x1030040E79DA29AuLL);
  v17 = v16;
  if (v16)
  {
    v16[18] = 0u;
    v16[19] = 0u;
    v16[16] = 0u;
    v16[17] = 0u;
    v16[14] = 0u;
    v16[15] = 0u;
    v16[12] = 0u;
    v16[13] = 0u;
    v16[10] = 0u;
    v16[11] = 0u;
    v16[8] = 0u;
    v16[9] = 0u;
    v16[6] = 0u;
    v16[7] = 0u;
    v16[4] = 0u;
    v16[5] = 0u;
    v16[2] = 0u;
    v16[3] = 0u;
    *v16 = 0u;
    v16[1] = 0u;
    if (a2)
      *(_OWORD *)((char *)v16 + 296) = *a2;
    *((_BYTE *)v16 + 20) = a3;
    *((_BYTE *)v16 + 21) = a5;
    if (a5 >= 0x100)
      v18 = 256;
    else
      v18 = a5;
    __memmove_chk((char *)v16 + 22, a4, v18, 298);
    if (a6)
      *((_DWORD *)v17 + 4) = *a6;
    if (a7)
      *((_QWORD *)v17 + 35) = strdup(a7);
    if (a8)
      *((_QWORD *)v17 + 36) = strdup(a8);
    *(_QWORD *)v17 = *(_QWORD *)a1;
    *((_QWORD *)v17 + 1) = 0;
    if (*(_QWORD *)a1)
      *(_QWORD *)(*(_QWORD *)a1 + 8) = v17;
    *(_QWORD *)a1 = v17;
  }
  return v17;
}

void **inetroute_list_init()
{
  unsigned __int16 *v0;
  unsigned __int16 *v1;
  void **v2;
  void *v3;
  unint64_t v4;
  int v5;
  unsigned __int16 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  int v16;
  _DWORD *v17;
  int v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  size_t size;
  void **v24;
  int v25[4];
  uint64_t v26;

  size = 0;
  v24 = 0;
  *(_OWORD *)v25 = xmmword_100014D20;
  v26 = 1;
  if (sysctl(v25, 6u, 0, &size, 0, 0) < 0)
  {
    perror("route-sysctl-estimate");
    goto LABEL_47;
  }
  v0 = (unsigned __int16 *)malloc_type_malloc(size, 0xA7C6D049uLL);
  if (!v0)
  {
LABEL_47:
    inetroute_list_free((void **)&v24);
    return 0;
  }
  v1 = v0;
  if (sysctl(v25, 6u, v0, &size, 0, 0) < 0)
  {
    perror("sysctl of routing table");
    goto LABEL_46;
  }
  v2 = (void **)malloc_type_malloc(0x18uLL, 0x1020040903548AEuLL);
  v24 = v2;
  *((_DWORD *)v2 + 4) = -1;
  *(_DWORD *)v2 = 0;
  v3 = malloc_type_malloc(0x38uLL, 0x100004027586B93uLL);
  v2[1] = v3;
  if (!v3)
  {
LABEL_46:
    free(v1);
    goto LABEL_47;
  }
  if ((uint64_t)size >= 1)
  {
    v4 = (unint64_t)v1 + size;
    v5 = 2;
    v6 = v1;
    do
    {
      v7 = (unsigned __int8 *)(v6 + 46);
      v8 = *((_DWORD *)v6 + 3);
      if ((v8 & 1) != 0)
      {
        v13 = (*v7 & 0xFC) + 4;
        if ((*v7 & 3) == 0)
          v13 = *v7;
        if (*v7)
          v14 = v13;
        else
          v14 = 4;
        v9 = &v7[v14];
        if ((v8 & 2) != 0)
        {
LABEL_9:
          v10 = (*v9 & 0xFC) + 4;
          if ((*v9 & 3) == 0)
            v10 = *v9;
          if (*v9)
            v11 = v10;
          else
            v11 = 4;
          v12 = &v9[v11];
          goto LABEL_22;
        }
      }
      else
      {
        v9 = (unsigned __int8 *)(v6 + 46);
        v7 = 0;
        if ((v8 & 2) != 0)
          goto LABEL_9;
      }
      v12 = v9;
      v9 = 0;
LABEL_22:
      if ((v8 & 4) != 0)
        v15 = v12;
      else
        v15 = 0;
      if (v7 && (v8 & 4) != 0 && v7[1] == 2 && v9 && (v6[4] & 4) == 0)
      {
        v16 = *(_DWORD *)v2;
        if (*(_DWORD *)v2 == v5)
        {
          v5 *= 2;
          v17 = malloc_type_realloc(v2[1], 28 * v5, 0x100004027586B93uLL);
          v2[1] = v17;
          if (!v17)
            goto LABEL_46;
          v16 = *(_DWORD *)v2;
        }
        else
        {
          v17 = v2[1];
        }
        v18 = v16;
        v19 = (char *)&v17[7 * v16];
        *(_QWORD *)v19 = 0;
        *((_QWORD *)v19 + 1) = 0;
        *((_DWORD *)v19 + 6) = 0;
        *((_QWORD *)v19 + 2) = 0;
        *(_DWORD *)v19 = *((_DWORD *)v7 + 1);
        if (*v15)
          v17[7 * v18 + 1] = *((_DWORD *)v15 + 1);
        if ((*((_BYTE *)v6 + 11) & 1) == 0 && !*((_DWORD *)v7 + 1))
          *((_DWORD *)v2 + 4) = *(_DWORD *)v2;
        v20 = (uint64_t)&v17[7 * v18 + 2];
        v21 = *(_OWORD *)v9;
        if (v9[1] == 18)
          *(_DWORD *)(v20 + 16) = *((_DWORD *)v9 + 4);
        *(_OWORD *)v20 = v21;
        ++*(_DWORD *)v2;
      }
      v6 = (unsigned __int16 *)((char *)v6 + *v6);
    }
    while ((unint64_t)v6 < v4);
  }
  free(v1);
  return v2;
}

void inetroute_list_free(void **a1)
{
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
    {
      v3 = (void *)v2[1];
      if (v3)
      {
        free(v3);
        v2 = *a1;
      }
      v2[1] = 0;
      free(*a1);
      *a1 = 0;
    }
  }
}

uint64_t inetroute_default(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 16);
  if (v1 == -1)
    return 0;
  v2 = *(_QWORD *)(a1 + 8) + 28 * v1;
  v3 = *(unsigned __int8 *)(v2 + 9);
  v4 = v2 + 12;
  if (v3 == 2)
    return v4;
  else
    return 0;
}

void inetroute_list_print_cfstr(__CFString *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char *v8;
  char *v9;
  const char *v10;
  char v11[16];

  if (*a2 >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)a2 + 1) + v4;
      v7 = *(unsigned __int8 *)(v6 + 9);
      v8 = sub_1000108E0(*(_DWORD *)v6, *(_DWORD *)(v6 + 4));
      v9 = v8;
      if (v7 == 18)
      {
        CFStringAppendFormat(a1, 0, CFSTR("%s ==> link %d\n"), v8, *(unsigned __int16 *)(v6 + 10));
      }
      else
      {
        v10 = inet_ntop(2, (const void *)(v6 + 12), v11, 0x10u);
        CFStringAppendFormat(a1, 0, CFSTR("%s ==> %s\n"), v9, v10);
      }
      ++v5;
      v4 += 28;
    }
    while (v5 < *a2);
  }
}

ssize_t sub_100013E14(int a1, _WORD *a2, const char *a3, int a4, uint64_t a5, int a6, int a7, unsigned int a8, unsigned __int16 a9, void *a10, int a11)
{
  ssize_t v19;
  int v20;
  int v21;
  char *v22;
  char *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  int *v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  int *v39;
  uint64_t v40;
  int *v41;
  char *v42;
  int v43;
  const char *v45;
  const char *v46;
  int v47;
  unsigned int v48;
  sockaddr v49;

  if ((byte_10001D508 & 1) == 0)
  {
    byte_10001D508 = 1;
    dword_10001D50C = arc4random();
  }
  if ((a4 == 24 || a4 == 1) && (a5 || a6 == -1))
  {
    v20 = sub_100014208((uint64_t)a3);
    if (v20 < 0)
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      v21 = v20;
      v46 = a3;
      v48 = a9;
      if (a4 == 24)
      {
        *(_QWORD *)a2 = -1;
        a2[8] = 8;
        v22 = (char *)(a2 + 9);
        v23 = (char *)(a2 + 13);
        v24 = a2 + 23;
        v25 = 46;
      }
      else
      {
        v22 = (char *)(a2 + 7);
        v23 = (char *)(a2 + 11);
        v24 = a2 + 21;
        if (a6 == -1)
        {
          v31 = -1;
          a2[2] = -1;
        }
        else
        {
          v31 = *(_DWORD *)a5;
          a2[2] = *(_WORD *)(a5 + 4);
        }
        *(_DWORD *)a2 = v31;
        a2[6] = 8;
        v25 = 42;
      }
      v32 = v25 + a11;
      memmove(v24, a10, a11);
      *(_DWORD *)v23 = a7;
      *((_DWORD *)v23 + 1) = a6;
      *((_WORD *)v23 + 4) = 4352;
      v33 = bswap32(a11 + 8) >> 16;
      *((_WORD *)v23 + 5) = v33;
      *((_WORD *)v22 + 10) = __rev16(v48);
      *((_WORD *)v22 + 11) = __rev16(a8);
      *((_DWORD *)v22 + 6) = (unsigned __int16)v33;
      *((_WORD *)v22 + 13) = sub_10000F6F0(v23, a11 + 20);
      *(_QWORD *)v22 = 0;
      *((_QWORD *)v22 + 1) = 0;
      *v22 = 69;
      *((_DWORD *)v22 + 2) = 4607;
      *((_DWORD *)v22 + 3) = a7;
      *((_DWORD *)v22 + 4) = a6;
      *((_WORD *)v22 + 1) = bswap32(a11 + 28) >> 16;
      v34 = dword_10001D50C++;
      *((_WORD *)v22 + 2) = bswap32(v34) >> 16;
      *((_WORD *)v22 + 5) = sub_10000F6F0(v22, 20);
      v19 = sub_10000C2A4(v21, a2, v32);
      if ((v19 & 0x80000000) != 0)
      {
        v35 = sub_10001453C();
        v36 = _SC_syslog_os_log_mapping(3);
        if (__SC_log_enabled(3, v35, v36))
        {
          v37 = _os_log_pack_size(28);
          v38 = (char *)&v45 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
          v39 = __error();
          v40 = _os_log_pack_fill(v38, v37, *v39, &_mh_execute_header, "bpf_write(%s) failed: %s (%d)", v45, v46, v47);
          v41 = __error();
          v42 = strerror(*v41);
          v43 = *__error();
          *(_DWORD *)v40 = 136315650;
          *(_QWORD *)(v40 + 4) = v46;
          *(_WORD *)(v40 + 12) = 2080;
          *(_QWORD *)(v40 + 14) = v42;
          *(_WORD *)(v40 + 22) = 1024;
          *(_DWORD *)(v40 + 24) = v43;
          __SC_log_send(3, v35, v36, v38);
        }
      }
      sub_10000C09C(v21);
    }
  }
  else if (a1 < 0)
  {
    v26 = sub_10001453C();
    v27 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v26, v27))
    {
      v28 = _os_log_pack_size(2);
      v29 = (char *)&v45 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v30 = __error();
      *(_WORD *)_os_log_pack_fill(v29, v28, *v30, &_mh_execute_header, "neither bpf nor socket send available") = 0;
      __SC_log_send(3, v26, v27, v29);
    }
    return 0;
  }
  else
  {
    *(_QWORD *)&v49.sa_data[6] = 0;
    *(_WORD *)&v49.sa_len = 528;
    *(_WORD *)v49.sa_data = __rev16(a8);
    *(_DWORD *)&v49.sa_data[2] = a6;
    if (sendto(a1, a10, a11, 0, &v49, 0x10u) >= a11)
      return 0;
    else
      return 0xFFFFFFFFLL;
  }
  return v19;
}

uint64_t sub_100014208(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  int *v10;
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int *v17;
  uint64_t v18;
  int *v19;
  char *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  int *v26;
  uint64_t v27;
  int *v28;
  char *v29;
  int v30;
  const char *v32;
  const char *v33;
  uint64_t v34;

  v2 = sub_10000C0AC();
  v3 = v2;
  if ((v2 & 0x80000000) != 0)
  {
    v13 = sub_10001453C();
    v14 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v13, v14))
    {
      v15 = _os_log_pack_size(18);
      v16 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v17 = __error();
      v18 = _os_log_pack_fill(v16, v15, *v17, &_mh_execute_header, "Transmitter: bpf_fd() failed, %s (%d)", v32, (_DWORD)v33);
      v19 = __error();
      v20 = strerror(*v19);
      v21 = *__error();
      *(_DWORD *)v18 = 136315394;
      *(_QWORD *)(v18 + 4) = v20;
      *(_WORD *)(v18 + 12) = 1024;
      *(_DWORD *)(v18 + 14) = v21;
      __SC_log_send(3, v13, v14, v16);
    }
  }
  else
  {
    if ((sub_10000C234(v2) & 0x80000000) != 0)
    {
      v22 = sub_10001453C();
      v23 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v22, v23))
      {
        v24 = _os_log_pack_size(18);
        v25 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
        v26 = __error();
        v27 = _os_log_pack_fill(v25, v24, *v26, &_mh_execute_header, "Transmitter: failed to set filter, %s (%d)", v32, (_DWORD)v33);
        v28 = __error();
        v29 = strerror(*v28);
        v30 = *__error();
        *(_DWORD *)v27 = 136315394;
        *(_QWORD *)(v27 + 4) = v29;
        *(_WORD *)(v27 + 12) = 1024;
        *(_DWORD *)(v27 + 14) = v30;
        __SC_log_send(3, v22, v23, v25);
      }
      goto LABEL_11;
    }
    if ((sub_10000C1B4(v3, a1) & 0x80000000) != 0)
    {
      if (*__error() != 6)
      {
        v4 = sub_10001453C();
        v5 = _SC_syslog_os_log_mapping(3);
        if (__SC_log_enabled(3, v4, v5))
        {
          v6 = _os_log_pack_size(28);
          v7 = (char *)&v32 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
          v8 = __error();
          v9 = _os_log_pack_fill(v7, v6, *v8, &_mh_execute_header, "Transmitter: bpf_setif (%s) failed: %s (%d)", v32, v33, v34);
          v10 = __error();
          v11 = strerror(*v10);
          v12 = *__error();
          *(_DWORD *)v9 = 136315650;
          *(_QWORD *)(v9 + 4) = a1;
          *(_WORD *)(v9 + 12) = 2080;
          *(_QWORD *)(v9 + 14) = v11;
          *(_WORD *)(v9 + 22) = 1024;
          *(_DWORD *)(v9 + 24) = v12;
          __SC_log_send(3, v4, v5, v7);
        }
      }
LABEL_11:
      sub_10000C09C(v3);
      return 0xFFFFFFFFLL;
    }
  }
  return v3;
}

uint64_t sub_10001453C()
{
  return qword_10001D510;
}
