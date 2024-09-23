void start(int a1, uint64_t a2)
{
  const char *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD handler[5];

  if (a1 < 2)
    v2 = 0;
  else
    v2 = *(const char **)(a2 + 8);
  v3 = sub_1000039F0(v2);
  if (!v3)
    exit(1);
  v4 = v3;
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_1000039E8;
  handler[3] = &unk_10000C3C8;
  handler[4] = v4;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  signal(1, (void (__cdecl *)(int))1);
  dispatch_main();
}

void sub_1000039E8(uint64_t a1)
{
  sub_1000046F8(*(_QWORD *)(a1 + 32));
}

void *sub_1000039F0(const char *a1)
{
  uint64_t v2;
  unsigned int v3;
  const void *v4;
  const void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  int *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  char *v21;
  NSObject *v22;
  NSObject *v23;
  const __SCDynamicStore *v24;
  const __CFArray *v25;
  const char *v27;
  _QWORD handler[5];
  const void *v29;
  void *values;
  SCDynamicStoreContext context;

  v29 = 0;
  v2 = sub_100003D68();
  if ((v2 & 0x80000000) != 0)
  {
    v8 = _SC_LOG_DEFAULT(v2);
    v9 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v8, v9))
    {
      v10 = _os_log_pack_size(12);
      v11 = (char *)&handler[-1] - ((__chkstk_darwin(v10) + 15) & 0xFFFFFFFFFFFFFFF0);
      v12 = __error();
      v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "socket() failed, %s", v27);
      v14 = __error();
      v15 = strerror(*v14);
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = v15;
      __SC_log_send(5, v8, v9, v11);
    }
    goto LABEL_10;
  }
  v3 = v2;
  v4 = sub_1000040C8();
  v29 = v4;
  if (!v4)
  {
    v16 = _SC_LOG_DEFAULT(0);
    v17 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v16, v17))
    {
      v18 = _os_log_pack_size(2);
      v19 = (char *)&handler[-1] - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0);
      v20 = __error();
      *(_WORD *)_os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "Can't load DUID") = 0;
      __SC_log_send(5, v16, v17, v19);
    }
    close(v3);
LABEL_10:
    sub_10000683C(&v29);
    return 0;
  }
  v5 = v4;
  v6 = malloc_type_malloc(0x50uLL, 0x10F004095A59CC2uLL);
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  if (a1)
    v7 = a1;
  else
    v7 = "/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist";
  v21 = strdup(v7);
  *((_QWORD *)v6 + 2) = v5;
  *((_QWORD *)v6 + 3) = v21;
  *(_DWORD *)v6 = v3;
  v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v3, 0, (dispatch_queue_t)&_dispatch_main_q);
  *((_QWORD *)v6 + 1) = v22;
  dispatch_set_context(v22, (void *)v3);
  dispatch_set_finalizer_f(*((dispatch_object_t *)v6 + 1), (dispatch_function_t)j__close);
  v23 = *((_QWORD *)v6 + 1);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100004298;
  handler[3] = &unk_10000C3E8;
  handler[4] = v6;
  dispatch_source_set_event_handler(v23, handler);
  sub_1000046F8((uint64_t)v6);
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = v6;
  v24 = SCDynamicStoreCreate(0, CFSTR("DHCPv6Server"), (SCDynamicStoreCallBack)sub_100005EE8, &context);
  values = (void *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
  v25 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  CFRelease(values);
  SCDynamicStoreSetNotificationKeys(v24, 0, v25);
  CFRelease(v25);
  *((_QWORD *)v6 + 6) = v24;
  SCDynamicStoreSetDispatchQueue(v24, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_resume(*((dispatch_object_t *)v6 + 1));
  return v6;
}

uint64_t sub_100003D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  int *v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  sockaddr v25;
  uint64_t v26;
  int v27;

  HIDWORD(v24) = 1;
  v0 = socket(30, 2, 0);
  v1 = v0;
  if ((v0 & 0x80000000) == 0)
  {
    *(_QWORD *)&v25.sa_len = 587341312;
    *(_QWORD *)&v25.sa_data[6] = 0;
    v27 = 0;
    v26 = 0;
    if (bind(v0, &v25, 0x1Cu))
    {
      v2 = _SC_LOG_DEFAULT();
      v3 = _SC_syslog_os_log_mapping(3);
      if (!__SC_log_enabled(3, v2, v3))
      {
LABEL_6:
        close(v1);
        return 0xFFFFFFFFLL;
      }
      v4 = _os_log_pack_size(12);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v6 = *__error();
      v7 = _os_log_pack_fill(v5, v4, v6, &_mh_execute_header, "bind failed, %s");
    }
    else if (ioctl(v1, 0x8004667EuLL, (char *)&v24 + 4) < 0)
    {
      v2 = _SC_LOG_DEFAULT();
      v3 = _SC_syslog_os_log_mapping(3);
      if (!__SC_log_enabled(3, v2, v3))
        goto LABEL_6;
      v20 = _os_log_pack_size(12);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v21 = *__error();
      v7 = _os_log_pack_fill(v5, v20, v21, &_mh_execute_header, "ioctl FIONBIO failed, %s");
    }
    else
    {
      if ((setsockopt(v1, 41, 61, (char *)&v24 + 4, 4u) & 0x80000000) == 0)
        return v1;
      v2 = _SC_LOG_DEFAULT();
      v3 = _SC_syslog_os_log_mapping(3);
      if (!__SC_log_enabled(3, v2, v3))
        goto LABEL_6;
      v22 = _os_log_pack_size(12);
      v5 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = *__error();
      v7 = _os_log_pack_fill(v5, v22, v23, &_mh_execute_header, "setsockopt(IPV6_PKTINFO) failed, %s");
    }
    v8 = v7;
    v9 = __error();
    v10 = strerror(*v9);
    *(_DWORD *)v8 = 136315138;
    *(_QWORD *)(v8 + 4) = v10;
    __SC_log_send(3, v2, v3, v5);
    goto LABEL_6;
  }
  v11 = _SC_LOG_DEFAULT();
  v12 = _SC_syslog_os_log_mapping(3);
  if (__SC_log_enabled(3, v11, v12))
  {
    v13 = _os_log_pack_size(12);
    v14 = (char *)&v24 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = __error();
    v16 = _os_log_pack_fill(v14, v13, *v15, &_mh_execute_header, "socket failed, %s", v24);
    v17 = __error();
    v18 = strerror(*v17);
    *(_DWORD *)v16 = 136315138;
    *(_QWORD *)(v16 + 4) = v18;
    __SC_log_send(3, v11, v12, v14);
  }
  return v1;
}

const void *sub_1000040C8()
{
  CFPropertyListRef v0;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v3;
  __CFString *Mutable;
  unsigned __int16 *BytePtr;
  CFIndex Length;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  const void *v15;

  v0 = sub_10000686C("/var/db/com.apple.dhcp6d.plist");
  v15 = v0;
  TypeID = CFDictionaryGetTypeID();
  if (v0
    && CFGetTypeID(v0) == TypeID
    && (Value = CFDictionaryGetValue((CFDictionaryRef)v0, CFSTR("DUID")), v3 = CFDataGetTypeID(), Value)
    && CFGetTypeID(Value) == v3)
  {
    CFRetain(Value);
  }
  else
  {
    Value = sub_100004A88();
    if (!Value)
      goto LABEL_10;
  }
  Mutable = CFStringCreateMutable(0, 0);
  BytePtr = (unsigned __int16 *)CFDataGetBytePtr((CFDataRef)Value);
  Length = CFDataGetLength((CFDataRef)Value);
  sub_100008EF0(Mutable, BytePtr, Length);
  v8 = _SC_LOG_DEFAULT(v7);
  v9 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v8, v9))
  {
    v10 = _os_log_pack_size(12);
    v11 = (char *)&v15 - ((__chkstk_darwin(v10) + 15) & 0xFFFFFFFFFFFFFFF0);
    v12 = __error();
    v13 = _os_log_pack_fill(v11, v10, *v12, &_mh_execute_header, "%@", v15);
    *(_DWORD *)v13 = 138412290;
    *(_QWORD *)(v13 + 4) = Mutable;
    __SC_log_send(5, v8, v9, v11);
  }
  CFRelease(Mutable);
LABEL_10:
  sub_10000683C(&v15);
  return Value;
}

void sub_100004298(uint64_t a1)
{
  sub_1000042A0(*(int **)(a1 + 32));
}

void sub_1000042A0(int *a1)
{
  unint64_t v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  int *v22;
  char *v23;
  int v24;
  unsigned int *msg_control;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int *v31;
  _DWORD *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  int *v38;
  __int128 v39;
  msghdr v40;
  _QWORD v41[2];
  _QWORD v42[3];
  int v43;
  unsigned __int8 v44[1500];
  char v45;

  memset(v42, 0, sizeof(v42));
  v43 = 0;
  *(_QWORD *)&v40.msg_namelen = 28;
  *(_QWORD *)&v40.msg_iovlen = 1;
  v41[0] = v44;
  v41[1] = 1500;
  v40.msg_name = v42;
  v40.msg_iov = (iovec *)v41;
  v40.msg_control = &v45;
  *(_QWORD *)&v40.msg_controllen = 32;
  v2 = recvmsg(*a1, &v40, 0);
  if ((v2 & 0x8000000000000000) != 0)
  {
    v15 = __error();
    if (*v15 != 35)
    {
      v16 = _SC_LOG_DEFAULT(v15);
      v17 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v16, v17))
      {
        v18 = _os_log_pack_size(18);
        v19 = (char *)&v39 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0);
        v20 = __error();
        v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "DHCPv6SocketRead: recvfrom failed %s (%d)", (const char *)v39, DWORD2(v39));
        v22 = __error();
        v23 = strerror(*v22);
        v24 = *__error();
        *(_DWORD *)v21 = 136315394;
        *(_QWORD *)(v21 + 4) = v23;
        *(_WORD *)(v21 + 12) = 1024;
        *(_DWORD *)(v21 + 14) = v24;
        v11 = 3;
        v12 = v16;
        v13 = v17;
        v14 = v19;
LABEL_8:
        __SC_log_send(v11, v12, v13, v14);
      }
    }
  }
  else
  {
    v4 = v2;
    if (v2 <= 3)
    {
      v5 = _SC_LOG_DEFAULT(v2);
      v6 = _SC_syslog_os_log_mapping(5);
      if (!__SC_log_enabled(5, v5, v6))
        return;
      v7 = _os_log_pack_size(18);
      v8 = (char *)&v39 - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0);
      v9 = __error();
      v10 = _os_log_pack_fill(v8, v7, *v9, &_mh_execute_header, "DHCPv6SocketRead: packet too short %ld < %d", (_QWORD)v39, DWORD2(v39));
      *(_DWORD *)v10 = 134218240;
      *(_QWORD *)(v10 + 4) = v4;
      *(_WORD *)(v10 + 12) = 1024;
      *(_DWORD *)(v10 + 14) = 4;
      v11 = 5;
      v12 = v5;
      v13 = v6;
      v14 = v8;
      goto LABEL_8;
    }
    if (v40.msg_controllen < 0xC)
      goto LABEL_22;
    msg_control = (unsigned int *)v40.msg_control;
    if (!v40.msg_control)
      goto LABEL_22;
    v26 = 0;
    *(_QWORD *)&v3 = 67109120;
    v39 = v3;
    do
    {
      if (msg_control[1] == 41)
      {
        if (msg_control[2] == 46)
        {
          if (*msg_control >= 0x20)
            v26 = msg_control + 3;
        }
        else
        {
          v27 = _SC_LOG_DEFAULT(v2);
          v28 = _SC_syslog_os_log_mapping(5);
          v2 = __SC_log_enabled(5, v27, v28);
          if ((_DWORD)v2)
          {
            v29 = _os_log_pack_size(8);
            v30 = (char *)&v39 - ((__chkstk_darwin(v29) + 15) & 0xFFFFFFFFFFFFFFF0);
            v31 = __error();
            v32 = (_DWORD *)_os_log_pack_fill(v30, v29, *v31, &_mh_execute_header, "Why did we get control message type %d?", (_DWORD)v39);
            v33 = msg_control[2];
            *v32 = v39;
            v32[1] = v33;
            v2 = __SC_log_send(5, v27, v28, v30);
          }
        }
      }
      msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
    }
    while ((char *)(msg_control + 3) <= (char *)v40.msg_control + v40.msg_controllen);
    if (v26)
    {
      sub_100004EE8((uint64_t)a1, (uint64_t)v42, v44, v4, v26[4]);
    }
    else
    {
LABEL_22:
      v34 = _SC_LOG_DEFAULT(v2);
      v35 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v34, v35))
      {
        v36 = _os_log_pack_size(2);
        v37 = (char *)&v39 - ((__chkstk_darwin(v36) + 15) & 0xFFFFFFFFFFFFFFF0);
        v38 = __error();
        *(_WORD *)_os_log_pack_fill(v37, v36, *v38, &_mh_execute_header, "DHCPv6SocketRead: missing IPV6_PKTINFO") = 0;
        __SC_log_send(5, v34, v35, v37);
      }
    }
  }
}

void sub_1000046F8(uint64_t a1)
{
  const char *v2;
  CFTypeID TypeID;
  CFTypeID v4;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  const __CFDictionary *v14;
  const char *v15;

  v2 = (const char *)sub_10000686C(*(const char **)(a1 + 24));
  v15 = v2;
  TypeID = CFDictionaryGetTypeID();
  if (v2 && (v4 = TypeID, TypeID = CFGetTypeID(v2), TypeID == v4))
  {
    v5 = CFDictionaryGetTypeID();
  }
  else
  {
    v6 = _SC_LOG_DEFAULT(TypeID);
    v7 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v6, v7))
    {
      v8 = _os_log_pack_size(12);
      v9 = (char *)&v15 - ((__chkstk_darwin(v8) + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = __error();
      v11 = _os_log_pack_fill(v9, v8, *v10, &_mh_execute_header, "Failed to load '%s'", v15);
      v12 = *(_QWORD *)(a1 + 24);
      *(_DWORD *)v11 = 136315138;
      *(_QWORD *)(v11 + 4) = v12;
      __SC_log_send(5, v6, v7, v9);
    }
    v5 = CFDictionaryGetTypeID();
    if (!v2)
    {
      v14 = 0;
      goto LABEL_11;
    }
  }
  if (CFGetTypeID(v2) == v5)
    v14 = (const __CFDictionary *)v2;
  else
    v14 = 0;
LABEL_11:
  sub_100004874(a1, v14, v13);
  sub_10000683C((const void **)&v15);
}

void sub_100004874(uint64_t a1, CFDictionaryRef theDict, __n128 a3)
{
  const void *Value;
  CFTypeID TypeID;
  const void *v7;
  CFTypeID v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  const char *v18;
  const char *v19;

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("enabled_interfaces"));
    TypeID = CFArrayGetTypeID();
    if (Value && CFGetTypeID(Value) != TypeID)
      Value = 0;
    v7 = CFDictionaryGetValue(theDict, CFSTR("options"));
    v8 = CFDictionaryGetTypeID();
    if (v7 && CFGetTypeID(v7) != v8)
      v7 = 0;
    v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("verbose"));
    v10 = CFBooleanGetTypeID();
    if (v9)
    {
      if (CFGetTypeID(v9) == v10)
      {
        v11 = CFBooleanGetValue(v9);
        if (v11 != byte_100010000)
        {
          byte_100010000 = v11 != 0;
          v12 = _SC_LOG_DEFAULT();
          v13 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v12, v13))
          {
            v14 = _os_log_pack_size(12);
            v15 = (char *)&v19 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
            v16 = __error();
            v17 = _os_log_pack_fill(v15, v14, *v16, &_mh_execute_header, "Verbose mode %s", v19);
            if (byte_100010000)
              v18 = "enabled";
            else
              v18 = "disabled";
            *(_DWORD *)v17 = 136315138;
            *(_QWORD *)(v17 + 4) = v18;
            __SC_log_send(5, v12, v13, v15);
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
    Value = 0;
  }
  sub_100005EF4(a1, Value, a3);
  sub_10000671C(a1, (const __CFDictionary *)v7);
}

__CFData *sub_100004A88()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  int v4;
  unsigned int v5;
  __CFData *v6;
  __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _WORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v27;

  v0 = (const char *)sub_1000080D0();
  v27 = v0;
  if (!v0)
  {
    v16 = _SC_LOG_DEFAULT(0);
    v17 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v16, v17))
      goto LABEL_13;
    v18 = _os_log_pack_size(2);
    v19 = (char *)&v27 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = *__error();
    v21 = (_WORD *)_os_log_pack_fill(v19, v18, v20, &_mh_execute_header, "can't retrieve interface list", v27);
LABEL_12:
    *v21 = 0;
    __SC_log_send(5, v16, v17, v19);
    v7 = 0;
    goto LABEL_14;
  }
  v1 = sub_100007FD8((uint64_t)v0);
  if (!v1)
  {
    v16 = _SC_LOG_DEFAULT(0);
    v17 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v16, v17))
      goto LABEL_13;
    v22 = _os_log_pack_size(2);
    v19 = (char *)&v27 - ((__chkstk_darwin(v22) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = *__error();
    v21 = (_WORD *)_os_log_pack_fill(v19, v22, v23, &_mh_execute_header, "can't find suitable interface for DUID", v27);
    goto LABEL_12;
  }
  v2 = v1;
  v3 = (const void *)sub_100008978(v1);
  v4 = sub_1000080C4(v2);
  v5 = sub_10000895C(v2);
  v6 = sub_1000091E0(v3, v4, v5);
  if (!v6)
  {
    v16 = _SC_LOG_DEFAULT(0);
    v17 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v16, v17))
    {
      v24 = _os_log_pack_size(2);
      v19 = (char *)&v27 - ((__chkstk_darwin(v24) + 15) & 0xFFFFFFFFFFFFFFF0);
      v25 = *__error();
      v21 = (_WORD *)_os_log_pack_fill(v19, v24, v25, &_mh_execute_header, "failed to establish DUID", v27);
      goto LABEL_12;
    }
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  sub_100004D94(v6);
  v9 = _SC_LOG_DEFAULT(v8);
  v10 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v9, v10))
  {
    v11 = _os_log_pack_size(12);
    v12 = (char *)&v27 - ((__chkstk_darwin(v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = __error();
    v14 = _os_log_pack_fill(v12, v11, *v13, &_mh_execute_header, "Derived DUID from %s", v27);
    v15 = nullsub_1(v2);
    *(_DWORD *)v14 = 136315138;
    *(_QWORD *)(v14 + 4) = v15;
    __SC_log_send(5, v9, v10, v12);
  }
LABEL_14:
  sub_1000088E0((uint64_t *)&v27);
  return v7;
}

void sub_100004D94(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *v6;
  uint64_t v7;
  const char *v8;
  CFDictionaryRef v9;
  void *values;

  values = a1;
  v9 = CFDictionaryCreate(0, (const void **)&off_10000C408, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v1 = sub_100006968(v9, (const std::__fs::filesystem::path *)"/var/db/com.apple.dhcp6d.plist", 0x1A4u);
  if ((v1 & 0x80000000) != 0)
  {
    v2 = _SC_LOG_DEFAULT(v1);
    v3 = _SC_syslog_os_log_mapping(7);
    if (__SC_log_enabled(7, v2, v3))
    {
      v4 = _os_log_pack_size(12);
      v5 = (char *)&v8 - ((__chkstk_darwin(v4) + 15) & 0xFFFFFFFFFFFFFFF0);
      v6 = __error();
      v7 = _os_log_pack_fill(v5, v4, *v6, &_mh_execute_header, "Failed to write DUID to %s", v8);
      *(_DWORD *)v7 = 136315138;
      *(_QWORD *)(v7 + 4) = "/var/db/com.apple.dhcp6d.plist";
      __SC_log_send(7, v2, v3, v5);
    }
  }
  sub_10000683C((const void **)&v9);
}

void sub_100004EE8(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned int a5)
{
  uint64_t v7;
  uint64_t v11;
  const char *v12;
  const char *v13;
  __CFString *Mutable;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  int *v34;
  uint64_t v35;
  const char *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  int v48;
  const char *v49;
  char *v50;
  unsigned __int16 *v51;
  unsigned __int16 *v52;
  _BOOL8 v53;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  _WORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  int *v66;
  uint64_t v67;
  unsigned __int16 *v68;
  unsigned __int16 *v69;
  _BOOL8 v70;
  _BOOL8 v71;
  unsigned __int16 v72;
  UInt8 *v73;
  _BOOL8 v74;
  unsigned __int16 *v75;
  unsigned __int16 *v76;
  uint64_t v77;
  unsigned int v78;
  unsigned int v79;
  const __CFData *v80;
  const __CFData *v81;
  unsigned __int16 v82;
  UInt8 *v83;
  _BOOL8 v84;
  int v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  int *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int *v110;
  uint64_t v111;
  const char *v112;
  const char *v113;
  const char *v114;
  uint64_t v115;
  const char **v116;
  const char *v117;
  uint64_t v118;
  _QWORD v119[2];
  int v120;
  const char *v121;
  char v122[46];
  _OWORD v123[16];
  unsigned __int8 v124;
  __int16 v125;
  unsigned __int8 v126;
  uint64_t v127;

  memset(v123, 0, sizeof(v123));
  v120 = 0;
  v119[0] = 0;
  v119[1] = 0;
  v7 = *(unsigned int *)(a1 + 72);
  if ((int)v7 < 1)
    goto LABEL_15;
  v11 = 0;
  while (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 4 * v11) != a5)
  {
    if (v7 == ++v11)
      goto LABEL_15;
  }
  if (v11 == 0xFFFFFFFFLL || !*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v11))
  {
LABEL_15:
    v24 = _SC_LOG_DEFAULT(a1);
    v25 = _SC_syslog_os_log_mapping(7);
    if (__SC_log_enabled(7, v24, v25))
    {
      v26 = _os_log_pack_size(14);
      v27 = (char *)&v113 - ((__chkstk_darwin(v26) + 15) & 0xFFFFFFFFFFFFFFF0);
      v28 = __error();
      v29 = _os_log_pack_fill(v27, v26, *v28, &_mh_execute_header, "Interface %d not enabled, ignoring (%d bytes)", (_DWORD)v113, (_DWORD)v114);
      *(_DWORD *)v29 = 67109376;
      *(_DWORD *)(v29 + 4) = a5;
      *(_WORD *)(v29 + 8) = 1024;
      *(_DWORD *)(v29 + 10) = a4;
      __SC_log_send(7, v24, v25, v27);
    }
  }
  else if (*a3 == 11)
  {
    v118 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8 * v11);
    v12 = (const char *)sub_100009784((uint64_t)a3, a4, (char *)v123);
    v13 = v12;
    v121 = v12;
    if (byte_100010000)
    {
      Mutable = CFStringCreateMutable(0, 0);
      DHCPv6PacketPrintToString(Mutable, a3, a4);
      if (v13)
        sub_1000097D8(Mutable, (uint64_t)v13);
      v16 = _SC_LOG_DEFAULT(v15);
      v17 = _SC_syslog_os_log_mapping(4294967290);
      if (__SC_log_enabled(4294967290, v16, v17))
      {
        v117 = v13;
        v18 = _os_log_pack_size(32);
        v116 = &v113;
        v19 = (char *)&v113 - ((__chkstk_darwin(v18) + 15) & 0xFFFFFFFFFFFFFFF0);
        v20 = __error();
        v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "[%s] Receive from %s %@");
        v22 = inet_ntop(30, (const void *)(a2 + 8), v122, 0x2Eu);
        *(_DWORD *)v21 = 136315650;
        *(_QWORD *)(v21 + 4) = v118;
        *(_WORD *)(v21 + 12) = 2080;
        *(_QWORD *)(v21 + 14) = v22;
        *(_WORD *)(v21 + 22) = 2112;
        *(_QWORD *)(v21 + 24) = Mutable;
        v13 = v117;
        __SC_log_send(4294967290, v16, v17, v19);
      }
      CFRelease(Mutable);
    }
    else
    {
      v38 = _SC_LOG_DEFAULT(v12);
      v39 = _SC_syslog_os_log_mapping(5);
      v40 = v39;
      v23 = __SC_log_enabled(5, v38, v39);
      if ((_DWORD)v23)
      {
        v115 = v38;
        v41 = _os_log_pack_size(44);
        v116 = &v113;
        v42 = __chkstk_darwin(v41);
        v117 = v13;
        v43 = (char *)&v113 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
        v44 = __error();
        v45 = _os_log_pack_fill(v43, v41, *v44, &_mh_execute_header, "[%s] Receive %s (%d) [%d bytes] from %s", v113, v114, v115, (_DWORD)v116, v117);
        v46 = DHCPv6MessageTypeName(*a3);
        HIDWORD(v114) = v40;
        v47 = v46;
        v48 = *a3;
        v49 = inet_ntop(30, (const void *)(a2 + 8), v122, 0x2Eu);
        *(_DWORD *)v45 = 136316162;
        *(_QWORD *)(v45 + 4) = v118;
        *(_WORD *)(v45 + 12) = 2080;
        *(_QWORD *)(v45 + 14) = v47;
        *(_WORD *)(v45 + 22) = 1024;
        *(_DWORD *)(v45 + 24) = v48;
        *(_WORD *)(v45 + 28) = 1024;
        *(_DWORD *)(v45 + 30) = a4;
        *(_WORD *)(v45 + 34) = 2080;
        *(_QWORD *)(v45 + 36) = v49;
        v50 = v43;
        v13 = v117;
        v23 = __SC_log_send(5, v115, HIDWORD(v114), v50);
      }
    }
    if (v13)
    {
      v51 = sub_100009920((uint64_t)v13, 2, (unsigned int *)&v120, 0);
      if (v51)
      {
        v52 = v51;
        v53 = sub_100009198(v51, v120);
        if (!v53)
        {
          v56 = _SC_LOG_DEFAULT(v53);
          v57 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v56, v57))
          {
            v97 = _os_log_pack_size(2);
            v59 = (char *)&v113 - ((__chkstk_darwin(v97) + 15) & 0xFFFFFFFFFFFFFFF0);
            v98 = *__error();
            v61 = (_WORD *)_os_log_pack_fill(v59, v97, v98, &_mh_execute_header, "Request contains invalid SERVERID");
            goto LABEL_50;
          }
LABEL_58:
          sub_10000979C((void **)&v121);
          return;
        }
        Length = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        if (Length != v120
          || (BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 16)), Length = bcmp(v52, BytePtr, v120), (_DWORD)Length))
        {
          v56 = _SC_LOG_DEFAULT(Length);
          v57 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v56, v57))
          {
            v58 = _os_log_pack_size(2);
            v59 = (char *)&v113 - ((__chkstk_darwin(v58) + 15) & 0xFFFFFFFFFFFFFFF0);
            v60 = *__error();
            v61 = (_WORD *)_os_log_pack_fill(v59, v58, v60, &_mh_execute_header, "Request SERVERID doesn't match");
LABEL_50:
            *v61 = 0;
LABEL_56:
            v95 = v56;
            v96 = v57;
            v106 = v59;
LABEL_57:
            __SC_log_send(5, v95, v96, v106);
            goto LABEL_58;
          }
          goto LABEL_58;
        }
      }
      DHCPv6PacketSetMessageType(&v124, 7);
      v125 = *(_WORD *)(a3 + 1);
      v126 = a3[3];
      sub_100009590((uint64_t)v119, (uint64_t)&v127, 1496);
      v68 = sub_100009920((uint64_t)v13, 1, (unsigned int *)&v120, 0);
      if (!v68)
        goto LABEL_34;
      v69 = v68;
      v70 = sub_100009198(v68, v120);
      if (!v70)
      {
        v56 = _SC_LOG_DEFAULT(v70);
        v57 = _SC_syslog_os_log_mapping(5);
        if (__SC_log_enabled(5, v56, v57))
        {
          v99 = _os_log_pack_size(2);
          v59 = (char *)&v113 - ((__chkstk_darwin(v99) + 15) & 0xFFFFFFFFFFFFFFF0);
          v100 = *__error();
          v61 = (_WORD *)_os_log_pack_fill(v59, v99, v100, &_mh_execute_header, "Request contains invalid CLIENTID");
          goto LABEL_50;
        }
        goto LABEL_58;
      }
      v71 = sub_1000095A4((uint64_t)v119, 1u, (unsigned __int16)v120, v69, (char *)v123);
      if (!v71)
      {
        v56 = _SC_LOG_DEFAULT(v71);
        v57 = _SC_syslog_os_log_mapping(5);
        if (!__SC_log_enabled(5, v56, v57))
          goto LABEL_58;
        v104 = _os_log_pack_size(12);
        v59 = (char *)&v113 - ((__chkstk_darwin(v104) + 15) & 0xFFFFFFFFFFFFFFF0);
        v105 = *__error();
        v103 = _os_log_pack_fill(v59, v104, v105, &_mh_execute_header, " failed to add CLIENTID, %s");
      }
      else
      {
LABEL_34:
        v72 = CFDataGetLength(*(CFDataRef *)(a1 + 16));
        v73 = (UInt8 *)CFDataGetBytePtr(*(CFDataRef *)(a1 + 16));
        v74 = sub_1000095A4((uint64_t)v119, 2u, v72, v73, (char *)v123);
        if (v74)
        {
          v75 = sub_100009920((uint64_t)v13, 6, (unsigned int *)&v120, 0);
          if (v75 && *(_QWORD *)(a1 + 32) && v120 >= 2)
          {
            v76 = v75;
            v77 = 0;
            while (1)
            {
              v78 = bswap32(v76[v77]);
              v79 = HIWORD(v78);
              v80 = (const __CFData *)sub_1000099C8(*(const __CFDictionary **)(a1 + 32), SHIWORD(v78));
              if (v80)
              {
                v81 = v80;
                v82 = CFDataGetLength(v80);
                v83 = (UInt8 *)CFDataGetBytePtr(v81);
                v84 = sub_1000095A4((uint64_t)v119, v79, v82, v83, (char *)v123);
                if (!v84)
                  break;
              }
              if (++v77 >= (unint64_t)v120 >> 1)
                goto LABEL_42;
            }
            v107 = _SC_LOG_DEFAULT(v84);
            v108 = _SC_syslog_os_log_mapping(5);
            if (!__SC_log_enabled(5, v107, v108))
              goto LABEL_58;
            v109 = _os_log_pack_size(22);
            v91 = (char *)&v113 - ((__chkstk_darwin(v109) + 15) & 0xFFFFFFFFFFFFFFF0);
            v110 = __error();
            v111 = _os_log_pack_fill(v91, v109, *v110, &_mh_execute_header, "failed to add %s, %s", v113, v114);
            v112 = sub_10000940C(v79);
            *(_DWORD *)v111 = 136315394;
            *(_QWORD *)(v111 + 4) = v112;
            *(_WORD *)(v111 + 12) = 2080;
            *(_QWORD *)(v111 + 14) = v123;
            v95 = v107;
            v96 = v108;
          }
          else
          {
LABEL_42:
            v85 = sub_10000959C((uint64_t)v119);
            v86 = sub_100005A8C((int *)a1, a5, (_OWORD *)(a2 + 8), &v124, (v85 + 4));
            v87 = v86;
            if (v86 <= 0x32 && ((1 << v86) & 0x4000000000041) != 0)
              goto LABEL_58;
            v88 = _SC_LOG_DEFAULT(v86);
            v89 = _SC_syslog_os_log_mapping(5);
            if (!__SC_log_enabled(5, v88, v89))
              goto LABEL_58;
            v90 = _os_log_pack_size(22);
            v91 = (char *)&v113 - ((__chkstk_darwin(v90) + 15) & 0xFFFFFFFFFFFFFFF0);
            v92 = __error();
            v93 = _os_log_pack_fill(v91, v90, *v92, &_mh_execute_header, "%s transmit failed, %s", v113, v114);
            v94 = strerror(v87);
            *(_DWORD *)v93 = 136315394;
            *(_QWORD *)(v93 + 4) = v118;
            *(_WORD *)(v93 + 12) = 2080;
            *(_QWORD *)(v93 + 14) = v94;
            v95 = v88;
            v96 = v89;
          }
          v106 = v91;
          goto LABEL_57;
        }
        v56 = _SC_LOG_DEFAULT(v74);
        v57 = _SC_syslog_os_log_mapping(5);
        if (!__SC_log_enabled(5, v56, v57))
          goto LABEL_58;
        v101 = _os_log_pack_size(12);
        v59 = (char *)&v113 - ((__chkstk_darwin(v101) + 15) & 0xFFFFFFFFFFFFFFF0);
        v102 = *__error();
        v103 = _os_log_pack_fill(v59, v101, v102, &_mh_execute_header, "failed to add SERVERID, %s");
      }
      *(_DWORD *)v103 = 136315138;
      *(_QWORD *)(v103 + 4) = v123;
      goto LABEL_56;
    }
    v62 = _SC_LOG_DEFAULT(v23);
    v63 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v62, v63))
    {
      v64 = _os_log_pack_size(12);
      v65 = (char *)&v113 - ((__chkstk_darwin(v64) + 15) & 0xFFFFFFFFFFFFFFF0);
      v66 = __error();
      v67 = _os_log_pack_fill(v65, v64, *v66, &_mh_execute_header, "DHCPv6 options parse failed, %s", v113);
      *(_DWORD *)v67 = 136315138;
      *(_QWORD *)(v67 + 4) = v123;
      __SC_log_send(5, v62, v63, v65);
    }
  }
  else
  {
    v30 = _SC_LOG_DEFAULT(a1);
    v31 = _SC_syslog_os_log_mapping(7);
    if (__SC_log_enabled(7, v30, v31))
    {
      v32 = _os_log_pack_size(30);
      v33 = (char *)&v113 - ((__chkstk_darwin(v32) + 15) & 0xFFFFFFFFFFFFFFF0);
      v34 = __error();
      v35 = _os_log_pack_fill(v33, v32, *v34, &_mh_execute_header, "Ignoring %s (%d) packet on interface %d (%d bytes)", v113, (_DWORD)v114, v115, (_DWORD)v116);
      v36 = DHCPv6MessageTypeName(*a3);
      v37 = *a3;
      *(_DWORD *)v35 = 136315906;
      *(_QWORD *)(v35 + 4) = v36;
      *(_WORD *)(v35 + 12) = 1024;
      *(_DWORD *)(v35 + 14) = v37;
      *(_WORD *)(v35 + 18) = 1024;
      *(_DWORD *)(v35 + 20) = a5;
      *(_WORD *)(v35 + 24) = 1024;
      *(_DWORD *)(v35 + 26) = a4;
      __SC_log_send(7, v30, v31, v33);
    }
  }
}

uint64_t sub_100005A8C(int *a1, unsigned int a2, _OWORD *a3, unsigned __int8 *a4, uint64_t a5)
{
  int *v8;
  __CFString *Mutable;
  _OWORD *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  const char *v20;
  int *v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  int *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  int *v35;
  uint64_t v36;
  __CFString *v37;
  int v38;
  int *v39;
  unsigned int v40;
  char *v41;
  const char *v42;
  int v43;
  const char *v45;
  const char **v46;
  const char **v47;
  _OWORD *v48;
  _BYTE v49[28];
  char v50[46];
  char v51[16];
  _OWORD v52[16];

  v48 = a3;
  v8 = a1;
  memset(v52, 0, sizeof(v52));
  if (byte_100010000)
  {
    Mutable = CFStringCreateMutable(0, 0);
    DHCPv6PacketPrintToString(Mutable, a4, a5);
    v10 = sub_100009784((uint64_t)a4, a5, (char *)v52);
    *(_QWORD *)v49 = v10;
    if (v10)
    {
      sub_1000097D8(Mutable, (uint64_t)v10);
      sub_10000979C((void **)v49);
    }
    else
    {
      v24 = _SC_LOG_DEFAULT(0);
      v25 = _SC_syslog_os_log_mapping(5);
      v11 = __SC_log_enabled(5, v24, v25);
      if ((_DWORD)v11)
      {
        v26 = _os_log_pack_size(12);
        v47 = (const char **)v8;
        v27 = (char *)&v45 - ((__chkstk_darwin(v26) + 15) & 0xFFFFFFFFFFFFFFF0);
        v28 = __error();
        v29 = _os_log_pack_fill(v27, v26, *v28, &_mh_execute_header, "parse options failed, %s", v45);
        *(_DWORD *)v29 = 136315138;
        *(_QWORD *)(v29 + 4) = v52;
        v11 = __SC_log_send(5, v24, v25, v27);
        v8 = (int *)v47;
      }
    }
    v30 = (const char *)_SC_LOG_DEFAULT(v11);
    v31 = _SC_syslog_os_log_mapping(4294967290);
    if (__SC_log_enabled(4294967290, v30, v31))
    {
      v32 = _os_log_pack_size(38);
      v46 = (const char **)v30;
      v33 = v32;
      v47 = &v45;
      v34 = (char *)&v45 - ((__chkstk_darwin(v32) + 15) & 0xFFFFFFFFFFFFFFF0);
      v35 = __error();
      v36 = _os_log_pack_fill(v34, v33, *v35, &_mh_execute_header, "[%s] Transmit [%d bytes] to %s %@");
      v37 = Mutable;
      v38 = a5;
      a5 = (uint64_t)a4;
      v39 = v8;
      v40 = a2;
      v41 = if_indextoname(a2, v51);
      v42 = inet_ntop(30, v48, v50, 0x2Eu);
      *(_DWORD *)v36 = 136315906;
      *(_QWORD *)(v36 + 4) = v41;
      a2 = v40;
      v8 = v39;
      a4 = (unsigned __int8 *)a5;
      LODWORD(a5) = v38;
      Mutable = v37;
      *(_WORD *)(v36 + 12) = 1024;
      *(_DWORD *)(v36 + 14) = a5;
      *(_WORD *)(v36 + 18) = 2080;
      *(_QWORD *)(v36 + 20) = v42;
      *(_WORD *)(v36 + 28) = 2112;
      *(_QWORD *)(v36 + 30) = v37;
      __SC_log_send(4294967290, v46, v31, v34);
    }
    CFRelease(Mutable);
  }
  else
  {
    v12 = (const char *)_SC_LOG_DEFAULT(a1);
    v13 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v12, v13))
    {
      LODWORD(v47) = a2;
      v14 = _os_log_pack_size(44);
      v46 = &v45;
      v15 = (char *)&v45 - ((__chkstk_darwin(v14) + 15) & 0xFFFFFFFFFFFFFFF0);
      v16 = __error();
      v17 = _os_log_pack_fill(v15, v14, *v16, &_mh_execute_header, "[%s] Transmit %s (%d) [%d bytes] to %s", v45, (const char *)v46, (_DWORD)v47, (_DWORD)v48, *(const char **)v49);
      v18 = if_indextoname(v47, v51);
      v45 = v12;
      v19 = v18;
      v20 = DHCPv6MessageTypeName(*a4);
      v21 = v8;
      v22 = *a4;
      v23 = inet_ntop(30, v48, v50, 0x2Eu);
      *(_DWORD *)v17 = 136316162;
      *(_QWORD *)(v17 + 4) = v19;
      *(_WORD *)(v17 + 12) = 2080;
      *(_QWORD *)(v17 + 14) = v20;
      *(_WORD *)(v17 + 22) = 1024;
      *(_DWORD *)(v17 + 24) = v22;
      v8 = v21;
      *(_WORD *)(v17 + 28) = 1024;
      *(_DWORD *)(v17 + 30) = a5;
      *(_WORD *)(v17 + 34) = 2080;
      *(_QWORD *)(v17 + 36) = v23;
      a2 = v47;
      __SC_log_send(5, v45, v13, v15);
    }
  }
  v43 = *v8;
  *(_OWORD *)&v49[12] = *(__int128 *)((char *)&xmmword_10000AF08 + 12);
  *(_OWORD *)v49 = xmmword_10000AF08;
  *(_OWORD *)&v49[8] = *v48;
  *(_WORD *)&v49[2] = 8706;
  return sub_100008E00(v43, a2, v49, (uint64_t)a4, a5, -1);
}

void sub_100005EE8(__n128 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100005EF4(a4, *(const void **)(a4 + 40), a1);
}

void sub_100005EF4(uint64_t a1, const void *a2, __n128 a3)
{
  const void *v5;
  _QWORD *v6;
  uint64_t v7;
  if_nameindex *v8;
  int *v9;
  uint64_t i;
  const char *if_name;
  const char *v12;
  if_nameindex *v13;
  int if_index;
  char v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  const void *v28;
  unsigned int v29;

  v29 = 0;
  v5 = *(const void **)(a1 + 40);
  v28 = v5;
  if (!byte_100010000 || sub_100006E1C(v5, a2))
  {
    if (a2)
      goto LABEL_4;
LABEL_28:
    LODWORD(v7) = 0;
    v6 = 0;
    v9 = 0;
    v15 = 1;
    goto LABEL_29;
  }
  v16 = _SC_LOG_DEFAULT();
  v7 = _SC_syslog_os_log_mapping(5);
  v17 = __SC_log_enabled(5, v16, v7);
  if (!a2)
  {
    if (v17)
    {
      v22 = _os_log_pack_size(2);
      v23 = (char *)&v27 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v24 = __error();
      *(_WORD *)_os_log_pack_fill(v23, v22, *v24, &_mh_execute_header, "Enabled Interfaces: none") = 0;
      __SC_log_send(5, v16, v7, v23);
      v15 = 1;
      LODWORD(v7) = 0;
      v6 = 0;
      goto LABEL_24;
    }
    goto LABEL_28;
  }
  if (v17)
  {
    v18 = _os_log_pack_size(12);
    v19 = (char *)&v27 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
    v20 = __error();
    v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "Enabled Interfaces: %@");
    *(_DWORD *)v21 = 138412290;
    *(_QWORD *)(v21 + 4) = a2;
    __SC_log_send(5, v16, v7, v19);
  }
LABEL_4:
  v6 = sub_100006C20((const __CFArray *)a2, &v29);
  v7 = v29;
  if (!v6)
  {
    v15 = 0;
LABEL_24:
    v9 = 0;
    goto LABEL_29;
  }
  v8 = if_nameindex();
  v9 = (int *)malloc_type_malloc(4 * (int)v7, 0x100004052888210uLL);
  if ((int)v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      if (v8 && (if_name = v8->if_name) != 0)
      {
        v12 = (const char *)v6[i];
        v13 = v8;
        while (strcmp(if_name, v12))
        {
          if_name = v13[1].if_name;
          ++v13;
          if (!if_name)
            goto LABEL_12;
        }
        if_index = v13->if_index;
      }
      else
      {
LABEL_12:
        if_index = 0;
      }
      v9[i] = if_index;
    }
  }
  if (v8)
    if_freenameindex(v8);
  LODWORD(v7) = v29;
  if (v9)
  {
    sub_100006204(a1, (uint64_t)v9, (uint64_t)v6, v29, a3);
    v15 = 0;
    LODWORD(v7) = v29;
  }
  else
  {
    v15 = 0;
  }
LABEL_29:
  sub_1000063A0(a1, v9, v7, a3);
  v25 = *(void **)(a1 + 56);
  if (v25)
    free(v25);
  v26 = *(void **)(a1 + 64);
  if (v26)
    free(v26);
  *(_DWORD *)(a1 + 72) = v29;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v6;
  if ((v15 & 1) == 0)
    CFRetain(a2);
  *(_QWORD *)(a1 + 40) = a2;
  sub_10000683C(&v28);
}

uint64_t sub_100006204(uint64_t result, uint64_t a2, uint64_t a3, int a4, __n128 a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;

  if (a4 >= 1)
  {
    v5 = a3;
    v7 = result;
    v8 = 0;
    v9 = a4;
    a5.n128_u64[0] = 136315138;
    v22 = a5;
    v23 = a3;
    do
    {
      v10 = *(_DWORD *)(a2 + 4 * v8);
      if (v10)
      {
        v11 = *(_QWORD *)(v5 + 8 * v8);
        v12 = *(unsigned int *)(v7 + 72);
        if ((int)v12 < 1)
          goto LABEL_10;
        v13 = *(int **)(v7 + 56);
        v14 = 0xFFFFFFFFLL;
        while (1)
        {
          v15 = *v13++;
          if (v15 == v10)
            break;
          --v14;
          if (!--v12)
            goto LABEL_10;
        }
        if (!v14)
        {
LABEL_10:
          result = sub_100006558(*(_DWORD *)v7, 80, v10);
          if (!(_DWORD)result)
          {
            v16 = _SC_LOG_DEFAULT();
            v17 = _SC_syslog_os_log_mapping(5);
            result = __SC_log_enabled(5, v16, v17);
            if ((_DWORD)result)
            {
              v18 = _os_log_pack_size(12);
              v19 = (char *)&v22 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
              v20 = __error();
              v21 = _os_log_pack_fill(v19, v18, *v20, &_mh_execute_header, "Added DHCPv6 multicast for interface %s", (const char *)v22.n128_u64[0]);
              *(_DWORD *)v21 = v22.n128_u32[0];
              *(_QWORD *)(v21 + 4) = v11;
              result = __SC_log_send(5, v16, v17, v19);
              v5 = v23;
            }
          }
        }
      }
      ++v8;
    }
    while (v8 != v9);
  }
  return result;
}

uint64_t sub_1000063A0(uint64_t result, int *a2, unsigned int a3, __n128 a4)
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  __n128 v21;
  int v22;

  if (*(int *)(result + 72) >= 1)
  {
    v4 = a3;
    v6 = result;
    v7 = 0;
    v8 = a3;
    a4.n128_u64[0] = 136315138;
    v21 = a4;
    v22 = a3;
    do
    {
      v9 = *(int *)(*(_QWORD *)(v6 + 56) + 4 * v7);
      if ((_DWORD)v9)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(v6 + 64) + 8 * v7);
        if (!a2 || v4 < 1)
          goto LABEL_11;
        v11 = a2;
        v12 = v8;
        v13 = 0xFFFFFFFFLL;
        while (1)
        {
          v14 = *v11++;
          if (v14 == v9)
            break;
          --v13;
          if (!--v12)
            goto LABEL_11;
        }
        if (!v13)
        {
LABEL_11:
          result = sub_100006558(*(_DWORD *)v6, 81, v9);
          if (!(_DWORD)result)
          {
            v15 = _SC_LOG_DEFAULT();
            v16 = _SC_syslog_os_log_mapping(5);
            result = __SC_log_enabled(5, v15, v16);
            if ((_DWORD)result)
            {
              v17 = _os_log_pack_size(12);
              v18 = (char *)&v21 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
              v19 = __error();
              v20 = _os_log_pack_fill(v18, v17, *v19, &_mh_execute_header, "Removed DHCPv6 multicast for interface %s", (const char *)v21.n128_u64[0]);
              *(_DWORD *)v20 = v21.n128_u32[0];
              *(_QWORD *)(v20 + 4) = v10;
              result = __SC_log_send(5, v15, v16, v18);
              v4 = v22;
            }
          }
        }
      }
      ++v7;
    }
    while (v7 < *(int *)(v6 + 72));
  }
  return result;
}

uint64_t sub_100006558(int a1, int a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int *v10;
  uint64_t v11;
  const char *v12;
  int *v13;
  char *v14;
  const char *v16;
  _OWORD v17[8];

  if ((a2 & 0xFFFFFFFE) != 0x50)
    return 0xFFFFFFFFLL;
  HIDWORD(v16) = a3;
  v17[0] = xmmword_10000AF24;
  memset((char *)&v17[1] + 12, 0, 100);
  *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_10000AF24 + 12);
  v5 = setsockopt(a1, 41, a2, (char *)&v16 + 4, 0x84u);
  if ((_DWORD)v5)
  {
    v6 = _SC_LOG_DEFAULT();
    v7 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v6, v7))
    {
      v8 = _os_log_pack_size(28);
      v9 = (char *)&v16 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v10 = __error();
      v11 = _os_log_pack_fill(v9, v8, *v10, &_mh_execute_header, "setsockopt(%s) if_index %d failed, %s", v16, LODWORD(v17[0]), *((const char **)&v17[0] + 1));
      if (a2 == 80)
        v12 = "MCAST_JOIN_GROUP";
      else
        v12 = "MCAST_LEAVE_GROUP";
      v13 = __error();
      v14 = strerror(*v13);
      *(_DWORD *)v11 = 136315650;
      *(_QWORD *)(v11 + 4) = v12;
      *(_WORD *)(v11 + 12) = 1024;
      *(_DWORD *)(v11 + 14) = a3;
      *(_WORD *)(v11 + 18) = 2080;
      *(_QWORD *)(v11 + 20) = v14;
      __SC_log_send(3, v6, v7, v9);
    }
  }
  return v5;
}

void sub_10000671C(uint64_t a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;

  if (!a2)
  {
LABEL_5:
    v3 = 0;
    goto LABEL_6;
  }
  v3 = sub_100009A2C(a2);
  if (!v3)
  {
    v4 = _SC_LOG_DEFAULT();
    v5 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v4, v5))
    {
      v6 = _os_log_pack_size(2);
      v7 = (char *)&v9 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
      v8 = __error();
      *(_WORD *)_os_log_pack_fill(v7, v6, *v8, &_mh_execute_header, "Failed to create DHCPv6OptionsDictionary") = 0;
      __SC_log_send(5, v4, v5, v7);
    }
    goto LABEL_5;
  }
LABEL_6:
  sub_10000683C((const void **)(a1 + 32));
  *(_QWORD *)(a1 + 32) = v3;
}

void sub_10000683C(const void **a1)
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

CFPropertyListRef sub_10000686C(const char *a1)
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

uint64_t sub_100006968(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2, unsigned int a3)
{
  const __CFData *Data;
  const __CFData *v6;
  const UInt8 *BytePtr;
  size_t Length;
  int v9;
  int v10;
  std::error_code *v11;
  uint64_t v12;
  std::__fs::filesystem::path __str[42];

  if (!propertyList)
    return 0;
  Data = CFPropertyListCreateData(0, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
  if (!Data)
    return 0;
  v6 = Data;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v6);
  snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
  v9 = open((const char *)__str, 1537, a3);
  if (v9 < 0)
  {
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    v10 = v9;
    if (write(v9, BytePtr, Length) == Length)
    {
      rename(__str, a2, v11);
      v12 = 0;
    }
    else
    {
      v12 = 0xFFFFFFFFLL;
    }
    close(v10);
  }
  CFRelease(v6);
  return v12;
}

uint64_t sub_100006A88(const __CFString *a1, UInt8 *a2, int a3, Boolean a4)
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

uint64_t sub_100006B0C(const __CFArray *a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
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
        v17 = sub_100006A88(ValueAtIndex, v12, v16, 0);
        *(_QWORD *)(a2 + 8 * v13) = v12;
        v12 += v17;
      }
      else
      {
        v17 = sub_100006A88(ValueAtIndex, v12, 0, 0);
      }
      v10 += v17;
    }
    while (v9 != ++v13);
  }
  *a3 = (v10 + 7) & 0xFFFFFFF8;
  *a4 = v9;
  return 1;
}

void *sub_100006C20(const __CFArray *a1, _DWORD *a2)
{
  void *v4;
  size_t size;

  size = 0;
  *a2 = 0;
  if (!sub_100006B0C(a1, 0, (unsigned int *)&size, (_DWORD *)&size + 1))
    return 0;
  v4 = malloc_type_malloc((int)size, 0xA7A2F498uLL);
  if (!sub_100006B0C(a1, (uint64_t)v4, (unsigned int *)&size, (_DWORD *)&size + 1))
  {
    free(v4);
    return 0;
  }
  *a2 = HIDWORD(size);
  return v4;
}

uint64_t sub_100006CB4(const __CFString *a1, _QWORD *a2)
{
  CFTypeID TypeID;
  uint64_t result;
  char buffer[64];

  *a2 = 0;
  a2[1] = 0;
  TypeID = CFStringGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 0;
  result = CFStringGetCString(a1, buffer, 64, 0x600u);
  if ((_DWORD)result)
    return inet_pton(30, buffer, a2) == 1;
  return result;
}

void *sub_100006D68(const __CFArray *a1, int *a2)
{
  int Count;
  int v5;
  void *v6;
  void *v7;
  CFIndex v8;
  _QWORD *v9;
  const __CFString *ValueAtIndex;

  Count = CFArrayGetCount(a1);
  v5 = Count;
  if (!Count)
    return 0;
  v6 = malloc_type_malloc(16 * Count, 0x1000040451B5BE8uLL);
  v7 = v6;
  if (v5 >= 1)
  {
    v8 = 0;
    v9 = v6;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v8);
      if ((sub_100006CB4(ValueAtIndex, v9) & 1) == 0)
        break;
      ++v8;
      v9 += 2;
      if (v5 == v8)
        goto LABEL_6;
    }
    free(v7);
    return 0;
  }
LABEL_6:
  *a2 = v5;
  return v7;
}

uint64_t sub_100006E1C(const void *a1, const void *a2)
{
  CFTypeID v4;

  if (!a1)
    return a2 == 0;
  if (a2)
  {
    v4 = CFGetTypeID(a1);
    if (v4 == CFGetTypeID(a2))
      return CFEqual(a1, a2);
  }
  return 0;
}

void sub_100006E8C(CFMutableStringRef theString, uint64_t a2, int a3, int a4)
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

UInt8 *sub_100006F44(const __CFString *a1, CFRange a2, CFStringEncoding a3)
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

UInt8 *sub_100006FF8(const __CFString *a1, CFStringEncoding a2)
{
  CFRange v5;

  v5.length = CFStringGetLength(a1);
  v5.location = 0;
  return sub_100006F44(a1, v5, a2);
}

CFDataRef sub_10000702C(CFStringRef theString)
{
  return CFStringCreateExternalRepresentation(0, theString, 0x8000100u, 0);
}

void *sub_100007044(uint64_t a1, int a2, void *a3, _DWORD *a4, char a5)
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
      if ((sub_100007D4C((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
        goto LABEL_75;
      goto LABEL_64;
    }
    v57 = v69;
    if ((int)v69 < 1)
    {
      v24 = 0;
LABEL_41:
      if ((sub_100007D4C((uint64_t)&v59, *((void **)v14 + 1), *((_DWORD *)v14 + 4)) & 1) == 0)
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
        sub_100007E34((_QWORD **)v14);
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
            if (!sub_100007D4C((uint64_t)&v59, &__src, 2))
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
            if (!sub_100007D4C((uint64_t)&v59, (void *)(*((_QWORD *)v14 + 1) + v44), *(unsigned __int8 *)(*((_QWORD *)v14 + 1) + v44) + 1))goto LABEL_75;
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
    sub_100007E34((_QWORD **)v14);
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
    sub_100007CB8(*(int **)v14, v18);
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
  sub_100007E34((_QWORD **)v14);
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
  sub_100007678((uint64_t)&v59);
LABEL_85:
  *v5 = v10;
  return v6;
}

void sub_100007678(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;

  sub_100007C64((_OWORD *)a1);
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
        sub_100007E34((_QWORD **)(*(_QWORD *)(a1 + 152) + v4));
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

CFDataRef sub_1000076EC(const __CFArray *a1, char a2)
{
  void *v3;
  void *v4;
  UInt8 *v5;
  CFDataRef v6;
  CFIndex length;

  length = 0;
  v3 = sub_100006C20(a1, &length);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (UInt8 *)sub_100007044((uint64_t)v3, length, 0, (_DWORD *)&length + 1, a2);
  free(v4);
  v6 = CFDataCreate(0, v5, SHIDWORD(length));
  free(v5);
  return v6;
}

CFDataRef sub_100007774(const __CFString *a1)
{
  UInt8 *v1;
  UInt8 *v2;
  UInt8 *v3;
  CFDataRef v4;
  UInt8 *v6;
  CFIndex length;

  LODWORD(length) = 0;
  v1 = sub_100006FF8(a1, 0x8000100u);
  v6 = v1;
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (UInt8 *)sub_100007044((uint64_t)&v6, 1, 0, &length, 0);
  free(v2);
  if (!v3)
    return 0;
  v4 = CFDataCreate(0, v3, (int)length);
  free(v3);
  return v4;
}

char *sub_100007800(uint64_t a1, unsigned int a2, int *a3)
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
  v4 = sub_100007918(a1, a2, (uint64_t)v11, 0);
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
  sub_100007C64(v11);
  return v6;
}

uint64_t sub_100007918(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
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
              sub_100007CB8((int *)v29, v8);
          }
          if ((v10 & 1) == 0)
            sub_100007D4C(a3, &__src, 1);
          sub_100007D4C(a3, v12 + 1, v13);
          v10 = 0;
          v8 = v8 + v13 + 1;
        }
        else
        {
          __src = 0;
          v10 = 1;
          sub_100007D4C(a3, &__src, 1);
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
    sub_100007C64((_OWORD *)a3);
    v4 = 0;
LABEL_49:
    if (v30[0] && v30[0] != v29)
      free(v30[0]);
  }
  return v4;
}

double sub_100007C64(_OWORD *a1)
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

int *sub_100007CB8(int *result, size_t size)
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

uint64_t sub_100007D4C(uint64_t a1, void *__src, int a3)
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

void sub_100007E34(_QWORD **a1)
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

_QWORD *sub_100007E7C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = sub_100008C30(a1);
  a1[2] = a2;
  a1[3] = a3;
  return result;
}

void sub_100007EB0(uint64_t *a1)
{
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;

  v1 = (uint64_t)a1;
  v3 = 0;
  while (sub_100008CA4(a1, 0, &v3))
  {
    if (v3)
    {
      v2 = *(void (**)(void))(v1 + 16);
      if (v2)
        v2();
    }
    a1 = (uint64_t *)v1;
  }
  sub_100008C38(v1);
}

__n128 sub_100007F14(__n128 *a1)
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

uint64_t sub_100007F58(uint64_t *a1, char *__s2)
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

uint64_t sub_100007FD8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  BOOL v10;

  result = sub_100007F58((uint64_t *)a1, "en0");
  if (!result)
  {
    if (a1 && (v3 = *(unsigned int *)(a1 + 8), (int)v3 >= 1))
    {
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = *(int *)(a1 + 8);
      do
      {
        if (v4 >= v7)
          v8 = 0;
        else
          v8 = *(_QWORD *)a1 + 96 * v4;
        v9 = *(unsigned __int8 *)(v8 + 18);
        if (v9 == 6 || v9 == 144)
        {
          if (v6)
          {
            if (strcmp((const char *)v8, v6) < 0)
              v6 = (const char *)v8;
          }
          else
          {
            v6 = (const char *)v8;
          }
        }
        else if (!v5)
        {
          if (*(_BYTE *)(v8 + 74))
            v5 = v8;
          else
            v5 = 0;
        }
        ++v4;
      }
      while (v4 != v3);
    }
    else
    {
      v6 = 0;
      v5 = 0;
    }
    if (v5)
      v10 = v6 == 0;
    else
      v10 = 0;
    if (v10)
      return v5;
    else
      return (uint64_t)v6;
  }
  return result;
}

uint64_t sub_1000080C4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 74);
}

void *sub_1000080D0()
{
  void *v0;
  void *v1;

  v0 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  v1 = v0;
  if (v0 && !sub_100008124((uint64_t)v0))
  {
    free(v1);
    return 0;
  }
  return v1;
}

uint64_t sub_100008124(uint64_t a1)
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
        sub_100007F10(v26 + 24, v43);
        goto LABEL_82;
      }
LABEL_30:
      v37 = sub_100008BB0((uint64_t *)a1, (uint64_t)ifa_name);
      if (v37)
      {
        v26 = v37;
        *(_WORD *)(v37 + 16) = v3->ifa_flags;
        ifa_addr = v3->ifa_addr;
        goto LABEL_32;
      }
      v44 = sub_100009374();
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
    v27 = sub_100008BB0((uint64_t *)a1, (uint64_t)ifa_name);
    if (!v27)
    {
      v44 = sub_100009374();
      v45 = _SC_syslog_os_log_mapping(5);
      if (!__SC_log_enabled(5, v44, v45))
        goto LABEL_82;
LABEL_45:
      v46 = _os_log_pack_size(2);
      v47 = (char *)&v71 - ((__chkstk_darwin(v46) + 15) & 0xFFFFFFFFFFFFFFF0);
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
      v29 = sub_100009374();
      v30 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v29, v30))
      {
        v31 = _os_log_pack_size(34);
        v32 = (char *)&v71 - ((__chkstk_darwin(v31) + 15) & 0xFFFFFFFFFFFFFFF0);
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
    if (sub_100008980(v10, (uint64_t)ifa_name, (uint64_t)v80))
    {
      if (*(_BYTE *)(v20 + 18) == 6)
      {
        v51 = sub_100008A10(v10, (uint64_t)ifa_name);
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

void sub_1000088E0(uint64_t *a1)
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
          sub_100007EB0((uint64_t *)(*(_QWORD *)v2 + v4));
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

uint64_t sub_10000895C(uint64_t a1)
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

uint64_t sub_100008978(uint64_t a1)
{
  return a1 + 56;
}

uint64_t sub_100008980(int a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_100008A10(int a1, uint64_t a2)
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
    v5 = sub_100009374();
    v6 = _SC_syslog_os_log_mapping(5);
    if (__SC_log_enabled(5, v5, v6))
    {
      v7 = _os_log_pack_size(22);
      v8 = (char *)&v13 - ((__chkstk_darwin(v7) + 15) & 0xFFFFFFFFFFFFFFF0);
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

uint64_t sub_100008BB0(uint64_t *a1, uint64_t a2)
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
  sub_100007E7C((_QWORD *)(v4 + 24), (uint64_t)j__free, (uint64_t)sub_100007F14);
  return v4;
}

_QWORD *sub_100008C30(_QWORD *result)
{
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_100008C38(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
    free(v2);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

uint64_t sub_100008C64(uint64_t result)
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

uint64_t sub_100008C80(uint64_t a1, int a2)
{
  if (*(_QWORD *)a1 && *(_DWORD *)(a1 + 12) > a2)
    return *(_QWORD *)(*(_QWORD *)a1 + 8 * a2);
  else
    return 0;
}

uint64_t sub_100008CA4(uint64_t *a1, unsigned int a2, _QWORD *a3)
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

BOOL sub_100008D28(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;

  result = sub_100008D68(a1);
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

BOOL sub_100008D68(uint64_t a1)
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

void sub_100008DF8(__CFString *a1, uint64_t a2, int a3)
{
  sub_100006E8C(a1, a2, a3, 32);
}

uint64_t sub_100008E00(int a1, int a2, void *a3, uint64_t a4, int a5, int a6)
{
  uint64_t v6;
  socklen_t v7;
  ssize_t v8;
  uint64_t result;
  msghdr v10;
  _QWORD v11[2];
  uint64_t v12;
  int v13;
  __int128 v14;
  __int128 v15;
  int v16;

  v6 = a5;
  v11[0] = a4;
  v11[1] = a5;
  v10.msg_name = a3;
  *(&v10.msg_namelen + 1) = 0;
  v10.msg_namelen = 28;
  v10.msg_iov = (iovec *)v11;
  *(&v10.msg_iovlen + 1) = 0;
  v10.msg_iovlen = 1;
  v10.msg_control = &v12;
  if (a6 >= 0)
    v7 = 48;
  else
    v7 = 32;
  v10.msg_controllen = v7;
  v10.msg_flags = 0;
  v15 = 0u;
  v14 = 0u;
  v13 = 46;
  v12 = 0x2900000020;
  v16 = 0;
  LODWORD(v15) = a2;
  if ((a6 & 0x80000000) == 0)
  {
    *(_QWORD *)((char *)&v15 + 4) = 0x2900000010;
    HIDWORD(v15) = 47;
    v16 = a6;
  }
  v8 = sendmsg(a1, &v10, 0);
  result = 0;
  if (v8 != v6)
    return *__error();
  return result;
}

void sub_100008EF0(CFMutableStringRef theString, unsigned __int16 *a2, uint64_t a3)
{
  int v3;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  char out[40];

  v3 = a3;
  if ((int)a3 >= 2)
  {
    v7 = bswap32(*a2) >> 16;
    switch((int)v7)
    {
      case 1:
        v8 = a3 - 8;
        if (a3 < 8)
        {
          v6 = 8;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, CFSTR("DUID LLT HW %d Time %u Addr "), bswap32(a2[1]) >> 16, bswap32(*((_DWORD *)a2 + 1)));
        v9 = (uint64_t)(a2 + 4);
        goto LABEL_17;
      case 2:
        v8 = a3 - 6;
        if (a3 < 6)
        {
          v6 = 6;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, CFSTR("DUID EN Num %d Id "), __rev16(a2[2]));
        v9 = (uint64_t)(a2 + 3);
        goto LABEL_17;
      case 3:
        v8 = a3 - 4;
        if (a3 < 4)
        {
          v6 = 4;
          goto LABEL_3;
        }
        CFStringAppendFormat(theString, 0, CFSTR("DUID LL HW %d Addr "), bswap32(a2[1]) >> 16);
        v9 = (uint64_t)(a2 + 2);
LABEL_17:
        sub_100006E8C(theString, v9, v8, 58);
        return;
      case 4:
        if (a3 < 0x12)
        {
          v6 = 18;
          goto LABEL_3;
        }
        memset(out, 0, 37);
        uuid_unparse((const unsigned __int8 *)a2 + 2, out);
        CFStringAppendFormat(theString, 0, CFSTR("DUID UUID %s"), out);
        break;
      default:
        CFStringAppendFormat(theString, 0, CFSTR("DUID (unrecognized type=%d): "), v7);
        sub_100006E8C(theString, (uint64_t)a2, v3, 32);
        return;
    }
  }
  else
  {
    v6 = 2;
LABEL_3:
    CFStringAppendFormat(theString, 0, CFSTR("DUID too short (%d < %d), Data = { "), a3, v6);
    sub_100006E8C(theString, (uint64_t)a2, v3, 32);
    CFStringAppendCString(theString, " }", 0x600u);
  }
}

BOOL sub_100009198(unsigned __int16 *a1, int a2)
{
  unsigned int v2;

  if (a2 < 2)
    return 0;
  v2 = (bswap32(*a1) >> 16) - 1;
  return (unsigned __int16)v2 <= 3u && dword_10000AF60[(__int16)v2] <= a2;
}

__CFData *sub_1000091E0(const void *a1, int a2, unsigned int a3)
{
  size_t v5;
  CFIndex v6;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  int v9;
  tm v11;

  v5 = a2;
  v6 = a2 + 8;
  Mutable = CFDataCreateMutable(0, v6);
  CFDataSetLength(Mutable, v6);
  MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
  *(_WORD *)MutableBytePtr = 256;
  *((_WORD *)MutableBytePtr + 1) = bswap32(a3) >> 16;
  memcpy(MutableBytePtr + 8, a1, v5);
  memset(&v11, 0, sizeof(v11));
  v11.tm_year = 100;
  v11.tm_mday = 1;
  v9 = timegm(&v11);
  *((_DWORD *)MutableBytePtr + 1) = bswap32(time(0) - v9);
  return Mutable;
}

const char *DHCPv6MessageTypeName(unsigned int a1)
{
  if (a1 > 0xD)
    return "<unknown";
  else
    return off_10000C410[(char)a1];
}

_BYTE *DHCPv6PacketSetMessageType(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void DHCPv6PacketPrintToString(CFMutableStringRef theString, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6;
  const char *v7;

  if ((int)a3 > 3)
  {
    v6 = *a2;
    v7 = DHCPv6MessageTypeName(*a2);
    CFStringAppendFormat(theString, 0, CFSTR("DHCPv6 %s (%d) Transaction ID 0x%06x Length %d\n"), v7, v6, bswap32((a2[1] << 8) | (a2[2] << 16) | (a2[3] << 24)), a3);
  }
  else
  {
    CFStringAppendFormat(theString, 0, CFSTR("Packet too short %d < %d\n"), a3, 4);
  }
}

uint64_t sub_100009374()
{
  return qword_100010008;
}

uint64_t sub_100009380(int a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 1:
    case 2:
      result = 2;
      break;
    case 3:
      result = 7;
      break;
    case 4:
    case 7:
    case 9:
    case 10:
    case 11:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
      return result;
    case 5:
      result = 8;
      break;
    case 6:
    case 8:
      result = 3;
      break;
    case 12:
    case 22:
    case 23:
      result = 5;
      break;
    case 13:
      result = 9;
      break;
    case 14:
      result = 0;
      break;
    case 21:
    case 24:
      result = 6;
      break;
    case 25:
      result = 11;
      break;
    case 26:
      result = 12;
      break;
    case 41:
    case 42:
      goto LABEL_7;
    default:
      if (a1 == 103)
LABEL_7:
        result = 10;
      break;
  }
  return result;
}

const char *sub_10000940C(int a1)
{
  int v1;
  const char *result;

  v1 = a1 - 1;
  result = "CLIENTID";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = "SERVERID";
      break;
    case 2:
      result = "IA_NA";
      break;
    case 3:
      result = "IA_TA";
      break;
    case 4:
      result = "IAADDR";
      break;
    case 5:
      result = "ORO";
      break;
    case 6:
      result = "PREFERENCE";
      break;
    case 7:
      result = "ELAPSED_TIME";
      break;
    case 8:
      result = "RELAY_MSG";
      break;
    case 9:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
      goto LABEL_5;
    case 10:
      result = "AUTH";
      break;
    case 11:
      result = "UNICAST";
      break;
    case 12:
      result = "STATUS_CODE";
      break;
    case 13:
      result = "RAPID_COMMIT";
      break;
    case 14:
      result = "USER_CLASS";
      break;
    case 15:
      result = "VENDOR_CLASS";
      break;
    case 16:
      result = "VENDOR_OPTS";
      break;
    case 17:
      result = "INTERFACE_ID";
      break;
    case 18:
      result = "RECONF_MSG";
      break;
    case 19:
      result = "RECONF_ACCEPT";
      break;
    case 20:
      result = "SIP_SERVER_D";
      break;
    case 21:
      result = "SIP_SERVER_A";
      break;
    case 22:
      result = "DNS_SERVERS";
      break;
    case 23:
      result = "DOMAIN_LIST";
      break;
    case 24:
      result = "IA_PD";
      break;
    case 25:
      result = "IAPREFIX";
      break;
    case 40:
      result = "POSIX_TIMEZONE";
      break;
    case 41:
      result = "TZDB_TIMEZONE";
      break;
    default:
      if ("CLIENTID" == 103)
        result = "CAPTIVE_PORTAL_URL";
      else
LABEL_5:
        result = "<unknown>";
      break;
  }
  return result;
}

uint64_t sub_100009590(uint64_t result, uint64_t a2, int a3)
{
  *(_QWORD *)result = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = 0;
  return result;
}

uint64_t sub_10000959C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

BOOL sub_1000095A4(uint64_t a1, unsigned int a2, size_t __len, void *__src, char *a5)
{
  int v6;
  int v7;
  _WORD *v9;
  const char *v11;

  v6 = *(_DWORD *)(a1 + 8) - *(_DWORD *)(a1 + 12);
  v7 = __len + 4;
  *a5 = 0;
  if (v6 < (int)__len + 4)
  {
    v11 = sub_10000940C(a2);
    snprintf(a5, 0x100uLL, "No room for option %s (%d), %d < %d", v11, a2, v6, v7);
  }
  else
  {
    v9 = (_WORD *)(*(_QWORD *)a1 + *(int *)(a1 + 12));
    *v9 = __rev16(a2);
    v9[1] = __rev16(__len);
    if ((_DWORD)__len)
      memmove(v9 + 2, __src, __len);
    *(_DWORD *)(a1 + 12) += v7;
  }
  return v6 >= v7;
}

_OWORD *sub_100009668(unsigned __int16 *a1, unsigned int a2, char *a3)
{
  unsigned int v6;
  unsigned __int16 *v7;
  unsigned int v8;
  _OWORD *result;
  __int128 v10;

  v10 = 0uLL;
  sub_100008C30(&v10);
  if (a2 >= 4)
  {
    v7 = a1;
    while (1)
    {
      v8 = (bswap32(v7[1]) >> 16) + 4;
      v6 = a2 - v8;
      if ((int)a2 < (int)v8)
        break;
      sub_100008D28((uint64_t)&v10, (uint64_t)v7);
      v7 = (unsigned __int16 *)((char *)v7 + v8);
      a2 -= v8;
      if (v6 < 4)
        goto LABEL_6;
    }
    if (a3)
    {
      sub_10000940C(bswap32(*v7) >> 16);
      snprintf(a3, 0x100uLL, "truncated option %s (%d) at offset %d, left %d < need %d");
    }
  }
  else
  {
    v6 = a2;
LABEL_6:
    if (!v6)
    {
      result = malloc_type_malloc(0x10uLL, 0x1080040FC6463CFuLL);
      *result = v10;
      return result;
    }
    if (a3)
      snprintf(a3, 0x100uLL, "truncated buffer at offset %d\n");
  }
  sub_100008C38((uint64_t)&v10);
  return 0;
}

_OWORD *sub_100009784(uint64_t a1, int a2, char *a3)
{
  BOOL v3;
  signed int v4;

  v3 = __OFSUB__(a2, 4);
  v4 = a2 - 4;
  if (v4 < 0 != v3)
    return 0;
  else
    return sub_100009668((unsigned __int16 *)(a1 + 4), v4, a3);
}

void sub_10000979C(void **a1)
{
  void *v1;

  v1 = *a1;
  if (*a1)
  {
    *a1 = 0;
    sub_100008C38((uint64_t)v1);
    free(v1);
  }
}

void sub_1000097D8(__CFString *a1, uint64_t a2)
{
  sub_1000097E0(a1, a2, 0);
}

void sub_1000097E0(__CFString *a1, uint64_t a2, int a3)
{
  uint64_t v6;
  int v7;
  int i;
  unsigned __int16 *v9;
  unsigned int v10;
  unsigned int v11;
  int v12;

  v6 = sub_100008C64(a2);
  v7 = v6;
  CFStringAppendFormat(a1, 0, CFSTR("Options[%d] = {\n"), v6);
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      v9 = (unsigned __int16 *)sub_100008C80(a2, i);
      v10 = *v9;
      v11 = v9[1];
      if (a3 >= 1)
      {
        v12 = a3;
        do
        {
          CFStringAppendFormat(a1, 0, CFSTR("  "));
          --v12;
        }
        while (v12);
      }
      CFStringAppendFormat(a1, 0, CFSTR("  "));
      sub_10000A0E8(a1, bswap32(v10) >> 16, bswap32(v11) >> 16, v9 + 2, a3);
    }
  }
  if (a3 >= 1)
  {
    do
    {
      CFStringAppendFormat(a1, 0, CFSTR("  "));
      --a3;
    }
    while (a3);
  }
  CFStringAppendFormat(a1, 0, CFSTR("}\n"));
}

unsigned __int16 *sub_100009920(uint64_t a1, int a2, unsigned int *a3, int *a4)
{
  int v8;
  int v9;
  int v10;
  unsigned __int16 *v11;

  v8 = sub_100008C64(a1);
  v9 = v8;
  if (a4)
    v10 = *a4;
  else
    v10 = 0;
  if (v10 >= v8)
    return 0;
  while (1)
  {
    v11 = (unsigned __int16 *)sub_100008C80(a1, v10);
    if (a2 == bswap32(*v11) >> 16)
      break;
    if (v9 == ++v10)
      return 0;
  }
  if (a4)
    *a4 = v10 + 1;
  *a3 = bswap32(v11[1]) >> 16;
  return v11 + 2;
}

const void *sub_1000099C8(const __CFDictionary *a1, __int16 a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  const void *Value;
  __int16 valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
  if (!v3)
    return 0;
  v4 = v3;
  Value = CFDictionaryGetValue(a1, v3);
  CFRelease(v4);
  return Value;
}

CFMutableDictionaryRef sub_100009A2C(const __CFDictionary *a1)
{
  CFIndex Count;
  uint64_t v3;
  CFMutableDictionaryRef Mutable;
  const void **v5;
  const void **v6;
  __int128 v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  UInt8 *v11;
  char *v12;
  uint64_t v13;
  unsigned __int16 v14;
  CFDataRef v15;
  CFDataRef v16;
  CFNumberRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  int *v31;
  uint64_t v32;
  __int128 v34;
  __CFDictionary *v35;
  const void **v36;
  const void **v37;
  CFMutableDictionaryRef v38;
  unsigned __int16 valuePtr;
  CFRange v40;

  Count = CFDictionaryGetCount(a1);
  if (!Count)
    return 0;
  v3 = Count;
  Mutable = CFDictionaryCreateMutable(0, Count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v38 = Mutable;
  v5 = (const void **)malloc_type_malloc(16 * v3, 0xBCB6576AuLL);
  v6 = &v5[v3];
  CFDictionaryGetKeysAndValues(a1, v5, v6);
  if (v3 >= 1)
  {
    v8 = 0;
    *(_QWORD *)&v7 = 138412290;
    v34 = v7;
    v35 = Mutable;
    v36 = &v5[v3];
    v37 = v5;
    do
    {
      v9 = (const __CFString *)v5[v8];
      v10 = (const __CFString *)v6[v8];
      if (CFStringHasPrefix(v9, CFSTR("dhcp_")))
      {
        v40.length = CFStringGetLength(v9) - 5;
        v40.location = 5;
        v11 = sub_100006F44(v9, v40, 0x8000100u);
        if (v11)
        {
          v12 = (char *)v11;
          v13 = 0;
          while (strcasecmp(v12, *(const char **)&word_10000C480[v13 + 4]))
          {
            v13 += 8;
            if ((_DWORD)(v13 * 2) == 80)
              goto LABEL_11;
          }
          v14 = word_10000C480[v13];
          if (!v14)
          {
LABEL_11:
            if ((*v12 - 48) > 9 || (v14 = strtoul(v12, 0, 0)) == 0)
            {
              v18 = _SC_LOG_DEFAULT();
              v19 = _SC_syslog_os_log_mapping(5);
              if (!__SC_log_enabled(5, v18, v19))
                goto LABEL_20;
              v20 = _os_log_pack_size(12);
              v21 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
              v22 = __error();
              v23 = _os_log_pack_fill(v21, v20, *v22, &_mh_execute_header, "Ignoring unsupported option '%@'");
              *(_DWORD *)v23 = v34;
              *(_QWORD *)(v23 + 4) = v9;
              v24 = v18;
              v25 = v19;
              v26 = v21;
              goto LABEL_19;
            }
          }
          v15 = sub_100009DA4(v14, v10);
          if (v15)
          {
            v16 = v15;
            valuePtr = v14;
            v17 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
            CFDictionarySetValue(Mutable, v17, v16);
            CFRelease(v17);
            CFRelease(v16);
            goto LABEL_20;
          }
          v27 = _SC_LOG_DEFAULT();
          v28 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v27, v28))
          {
            v29 = _os_log_pack_size(12);
            v30 = (char *)&v34 - ((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0);
            v31 = __error();
            v32 = _os_log_pack_fill(v30, v29, *v31, &_mh_execute_header, "Failed to handle '%@'");
            *(_DWORD *)v32 = v34;
            *(_QWORD *)(v32 + 4) = v9;
            v24 = v27;
            v25 = v28;
            v26 = v30;
LABEL_19:
            __SC_log_send(5, v24, v25, v26);
            Mutable = v35;
          }
LABEL_20:
          free(v12);
          v6 = v36;
          v5 = v37;
        }
      }
      ++v8;
    }
    while (v8 != v3);
  }
  free(v5);
  if (!CFDictionaryGetCount(Mutable))
  {
    sub_10000683C((const void **)&v38);
    return v38;
  }
  return Mutable;
}

CFDataRef sub_100009DA4(int a1, const __CFString *a2)
{
  int v3;
  CFTypeID TypeID;
  CFTypeID v6;
  CFTypeID v7;
  const UInt8 *v8;
  UInt8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UInt8 *v13;
  uint64_t v14;
  uint64_t v15;
  UInt8 bytes[8];
  uint64_t v18;

  v3 = sub_100009380(a1);
  TypeID = CFDataGetTypeID();
  if (a2)
  {
    if (CFGetTypeID(a2) == TypeID)
      return (CFDataRef)CFRetain(a2);
    v6 = CFStringGetTypeID();
    if (CFGetTypeID(a2) == v6)
    {
      if (v3 == 6)
        return sub_100007774(a2);
      if (v3 != 5)
        return sub_10000702C(a2);
      *(_QWORD *)bytes = 0;
      v18 = 0;
      if ((sub_100006CB4(a2, bytes) & 1) != 0)
        return CFDataCreate(0, bytes, 16);
      v10 = _SC_LOG_DEFAULT();
      v11 = _SC_syslog_os_log_mapping(5);
      if (__SC_log_enabled(5, v10, v11))
        goto LABEL_21;
    }
    else
    {
      v7 = CFArrayGetTypeID();
      if (CFGetTypeID(a2) == v7)
      {
        if (v3 == 6)
          return sub_1000076EC((const __CFArray *)a2, 0);
        if (v3 == 5)
        {
          *(_DWORD *)bytes = 0;
          v8 = (const UInt8 *)sub_100006D68((const __CFArray *)a2, (int *)bytes);
          if (v8)
          {
            v9 = (UInt8 *)v8;
            a2 = (const __CFString *)CFDataCreate(0, v8, 16 * *(int *)bytes);
            free(v9);
            return (CFDataRef)a2;
          }
          v10 = _SC_LOG_DEFAULT();
          v11 = _SC_syslog_os_log_mapping(5);
          if (__SC_log_enabled(5, v10, v11))
          {
LABEL_21:
            v12 = _os_log_pack_size(12);
            v13 = &bytes[-((__chkstk_darwin() + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
            v14 = *__error();
            v15 = _os_log_pack_fill(v13, v12, v14, &_mh_execute_header, "invalid IPv6 address '%@'");
            *(_DWORD *)v15 = 138412290;
            *(_QWORD *)(v15 + 4) = a2;
            __SC_log_send(5, v10, v11, v13);
          }
        }
      }
    }
    return 0;
  }
  CFStringGetTypeID();
  CFArrayGetTypeID();
  return (CFDataRef)a2;
}

void sub_10000A0E8(__CFString *a1, unsigned int a2, uint64_t a3, unsigned __int16 *a4, int a5)
{
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  const char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  _OWORD *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39[16];
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
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v10 = sub_10000940C(a2);
  CFStringAppendFormat(a1, 0, CFSTR("%s (%d) Length %d: "), v10, a2, a3);
  switch(sub_100009380(a2))
  {
    case 0u:
      return;
    case 2u:
      sub_100008EF0(a1, a4, a3);
      goto LABEL_51;
    case 3u:
      if (a3 >= 2)
      {
        v11 = 0;
        do
        {
          v12 = bswap32(a4[v11]);
          v13 = HIWORD(v12);
          if ((_DWORD)(v11 * 2))
            v14 = ", ";
          else
            v14 = (const char *)&unk_10000B2A2;
          if (a2 == 6)
          {
            v35 = sub_10000940C(HIWORD(v12));
            CFStringAppendFormat(a1, 0, CFSTR("%s%s (%d)"), v14, v35, v13);
          }
          else
          {
            CFStringAppendFormat(a1, 0, CFSTR("%s%d"), v14, HIWORD(v12), v37);
          }
          ++v11;
        }
        while ((a3 & 0xFFFE) != (_DWORD)(v11 * 2));
      }
      goto LABEL_51;
    case 4u:
      if (a3 >= 4)
      {
        v15 = 0;
        v16 = a3 & 0xFFFC;
        do
        {
          if ((_DWORD)(v15 * 2))
            v17 = ", ";
          else
            v17 = (const char *)&unk_10000B2A2;
          CFStringAppendFormat(a1, 0, CFSTR("%s%d"), v17, bswap32(*(_DWORD *)&a4[v15]));
          v15 += 2;
        }
        while (v16 != (_DWORD)(v15 * 2));
      }
      goto LABEL_51;
    case 5u:
      if (a3 >= 0x10)
      {
        v18 = 0;
        v19 = a3 & 0xFFF0;
        do
        {
          if ((_DWORD)(v18 * 2))
            v20 = ", ";
          else
            v20 = (const char *)&unk_10000B2A2;
          v21 = inet_ntop(30, &a4[v18], v39, 0x2Eu);
          CFStringAppendFormat(a1, 0, CFSTR("%s%s"), v20, v21);
          v18 += 8;
        }
        while (v19 != (_DWORD)(v18 * 2));
      }
      goto LABEL_55;
    case 6u:
      *(_DWORD *)v39 = 0;
      v22 = sub_100007800((uint64_t)a4, a3, (int *)v39);
      if (v22)
      {
        v23 = v22;
        if (*(int *)v39 >= 1)
        {
          v24 = 0;
          do
          {
            if (v24)
              v25 = ", ";
            else
              v25 = (const char *)&unk_10000B2A2;
            CFStringAppendFormat(a1, 0, CFSTR("%s%s"), v25, *(_QWORD *)&v23[8 * v24++]);
          }
          while (v24 < *(int *)v39);
        }
        free(v23);
      }
      else
      {
        CFStringAppendFormat(a1, 0, CFSTR(" Invalid"));
LABEL_53:
        if ((_DWORD)a3)
        {
          CFStringAppendFormat(a1, 0, CFSTR(" Data "));
          sub_100008DF8(a1, (uint64_t)a4, a3);
        }
      }
LABEL_55:
      CFStringAppendFormat(a1, 0, CFSTR("\n"), v33, v34, v37);
      return;
    case 7u:
      if (a3 <= 0xB)
      {
        CFStringAppendFormat(a1, 0, CFSTR(" IA_NA option is too short %d < %d\n"), a3, 12, v37);
        return;
      }
      v26 = a3 - 12;
      CFStringAppendFormat(a1, 0, CFSTR(" IA_NA IAID=%d T1=%d T2=%d"), bswap32(*(_DWORD *)a4), bswap32(*((_DWORD *)a4 + 1)), bswap32(*((_DWORD *)a4 + 2)));
      goto LABEL_48;
    case 8u:
      sub_10000A69C(a1, (uint64_t)a4, a3, a5);
      return;
    case 9u:
      if (a3 > 1)
      {
        v27 = bswap32(*a4);
        v28 = HIWORD(v27);
        v29 = (a3 - 2);
        v30 = sub_10000A874(HIWORD(v27));
        if ((_DWORD)v29)
          CFStringAppendFormat(a1, 0, CFSTR(" STATUS_CODE %s (%d) '%.*s'\n"), v30, v28, v29, a4 + 1);
        else
          CFStringAppendFormat(a1, 0, CFSTR(" STATUS_CODE %s (%d)\n"), v30, v28, v37);
      }
      else
      {
        CFStringAppendFormat(a1, 0, CFSTR(" STATUS_CODE option is too short %d < %d\n"), a3, 2, v37);
      }
      return;
    case 0xAu:
      *(_QWORD *)v39 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)a4, a3, 0x8000100u, 0);
      CFStringAppendFormat(a1, 0, CFSTR(" %@\n"), *(_QWORD *)v39);
      sub_10000683C((const void **)v39);
      return;
    case 0xBu:
      if (a3 > 0xB)
      {
        v26 = a3 - 12;
        CFStringAppendFormat(a1, 0, CFSTR(" IA_PD IAID=%d T1=%d T2=%d"), bswap32(*(_DWORD *)a4), bswap32(*((_DWORD *)a4 + 1)), bswap32(*((_DWORD *)a4 + 2)));
LABEL_48:
        if (v26)
        {
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
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
          *(_OWORD *)v39 = 0u;
          v40 = 0u;
          v31 = sub_100009668(a4 + 6, v26, v39);
          if (v31)
          {
            v32 = v31;
            CFStringAppendFormat(a1, 0, CFSTR(" "));
            sub_1000097E0(a1, v32, (a5 + 1));
            sub_100008C38((uint64_t)v32);
            free(v32);
          }
          else
          {
            CFStringAppendFormat(a1, 0, CFSTR(" options invalid:\n\t%s\n"), v39, v36, v38);
          }
        }
        else
        {
LABEL_51:
          CFStringAppendFormat(a1, 0, CFSTR("\n"));
        }
      }
      else
      {
        CFStringAppendFormat(a1, 0, CFSTR(" IA_PD option is too short %d < %d\n"), a3, 12, v37);
      }
      return;
    case 0xCu:
      sub_10000A784(a1, (uint64_t)a4, a3, a5);
      return;
    default:
      goto LABEL_53;
  }
}

void sub_10000A69C(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11[46];

  if ((int)a3 > 23)
  {
    v7 = a3 - 24;
    v8 = inet_ntop(30, (const void *)a2, v11, 0x2Eu);
    CFStringAppendFormat(theString, 0, CFSTR(" IAADDR %s Preferred %d Valid=%d"), v8, bswap32(*(_DWORD *)(a2 + 16)), bswap32(*(_DWORD *)(a2 + 20)));
    if (v7)
      sub_10000A89C(theString, (unsigned __int16 *)(a2 + 24), v7, a4);
    else
      CFStringAppendFormat(theString, 0, CFSTR("\n"), v9, v10);
  }
  else
  {
    CFStringAppendFormat(theString, 0, CFSTR(" IAADDR option is too short %d < %d\n"), a3, 24);
  }
}

void sub_10000A784(CFMutableStringRef theString, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11[46];

  if ((int)a3 > 24)
  {
    v7 = a3 - 25;
    v8 = inet_ntop(30, (const void *)(a2 + 9), v11, 0x2Eu);
    CFStringAppendFormat(theString, 0, CFSTR(" IAPREFIX %s/%d Preferred %d Valid=%d"), v8, *(unsigned __int8 *)(a2 + 8), bswap32(*(_DWORD *)a2), bswap32(*(_DWORD *)(a2 + 4)));
    if (v7)
      sub_10000A89C(theString, (unsigned __int16 *)(a2 + 25), v7, a4);
    else
      CFStringAppendFormat(theString, 0, CFSTR("\n"), v9, v10);
  }
  else
  {
    CFStringAppendFormat(theString, 0, CFSTR(" IAPREFIX option is too short %d < %d\n"), a3, 25);
  }
}

const char *sub_10000A874(unsigned int a1)
{
  if (a1 > 0x16)
    return "<unknown>";
  else
    return (&off_10000C4D0)[(__int16)a1];
}

void sub_10000A89C(__CFString *a1, unsigned __int16 *a2, unsigned int a3, int a4)
{
  _OWORD *v6;
  void *v7;
  _OWORD v8[16];

  memset(v8, 0, sizeof(v8));
  v6 = sub_100009668(a2, a3, (char *)v8);
  if (v6)
  {
    v7 = v6;
    CFStringAppendFormat(a1, 0, CFSTR(" "));
    sub_1000097E0(a1, v7, (a4 + 1));
    sub_100008C38((uint64_t)v7);
    free(v7);
  }
  else
  {
    CFStringAppendFormat(a1, 0, CFSTR(" options invalid:\n\t%s\n"), v8);
  }
}
