uint64_t sub_100001CD0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  xpc_object_t value;
  void *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  xpc_object_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  xpc_object_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  xpc_object_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned __int8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  xpc_object_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *string_ptr;
  xpc_object_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  char v87;
  xpc_object_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
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
  uint64_t v106;
  __int128 v107;
  __int128 v108;

  if (!a1 || xpc_get_type(a1) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v10 = "metadata is not dictionary object";
LABEL_4:
    sub_100002150((uint64_t)v10, a2, a3, a4, a5, a6, a7, a8, v106);
    return 0;
  }
  value = xpc_dictionary_get_value(a1, netrbClientLowLatencyFlowParam[0]);
  if (!value || (v13 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
  {
    v10 = "metadata does not contain low latency flow parameter dictionary.";
    goto LABEL_4;
  }
  v108 = 0uLL;
  v107 = 0uLL;
  v14 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpVersion[0]);
  if (v14 && (v22 = v14, xpc_get_type(v14) == (xpc_type_t)&_xpc_type_uint64))
  {
    v58 = xpc_uint64_get_value(v22);
    v66 = v58;
    if (v58 != 4 && v58 != 96)
    {
      sub_100002150((uint64_t)"IP version (%hhu) is not supported or is invalid", v59, v60, v61, v62, v63, v64, v65, v58);
      return 0;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 1u;
      *(_BYTE *)(a2 + 9) = v58;
    }
    v67 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalIp[0]);
    if (v67 && (v75 = v67, xpc_get_type(v67) == (xpc_type_t)&_xpc_type_string))
    {
      string_ptr = xpc_string_get_string_ptr(v75);
      if (a2)
        *(_BYTE *)(a2 + 8) |= 4u;
    }
    else
    {
      sub_10000218C((uint64_t)"local IP is not present or has incorrect type", v68, v69, v70, v71, v72, v73, v74, v106);
      string_ptr = 0;
    }
    v77 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemoteIp[0]);
    if (v77 && (v85 = v77, xpc_get_type(v77) == (xpc_type_t)&_xpc_type_string))
    {
      v86 = xpc_string_get_string_ptr(v85);
      if (a2)
        *(_BYTE *)(a2 + 8) |= 8u;
    }
    else
    {
      sub_10000218C((uint64_t)"remote IP is not present or has incorrect type", v78, v79, v80, v81, v82, v83, v84, v106);
      v86 = 0;
    }
    if (v66 == 4)
    {
      if (string_ptr && inet_pton(2, string_ptr, (char *)&v108 + 12) != 1
        || v86 && inet_pton(2, v86, (char *)&v107 + 12) != 1)
      {
        v10 = "local or remote IPv4 address is malformed.";
        goto LABEL_4;
      }
      if (a2)
      {
        *(_DWORD *)(a2 + 24) = HIDWORD(v108);
        *(_DWORD *)(a2 + 40) = HIDWORD(v107);
      }
    }
    else
    {
      if (string_ptr && inet_pton(30, string_ptr, &v108) != 1 || v86 && inet_pton(30, v86, &v107) != 1)
      {
        v10 = "local or remote IPv6 address is malformed.";
        goto LABEL_4;
      }
      if (a2)
      {
        *(_OWORD *)(a2 + 12) = v108;
        *(_OWORD *)(a2 + 28) = v107;
      }
    }
  }
  else
  {
    sub_100002150((uint64_t)"IP version is not present", v15, v16, v17, v18, v19, v20, v21, v106);
  }
  v23 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorIpProtocol[0]);
  if (v23 && (v31 = v23, xpc_get_type(v23) == (xpc_type_t)&_xpc_type_uint64))
  {
    v87 = xpc_uint64_get_value(v31);
    if (v87 != 17 && v87 != 6)
    {
      v10 = "IP protocol is not supported or is invalid.";
      goto LABEL_4;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 2u;
      *(_BYTE *)(a2 + 10) = v87;
    }
  }
  else
  {
    sub_10000218C((uint64_t)"IP protocol is not present or has incorrect type", v24, v25, v26, v27, v28, v29, v30, v106);
  }
  v32 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorLocalPort[0]);
  if (v32)
  {
    v40 = v32;
    if (xpc_get_type(v32) != (xpc_type_t)&_xpc_type_uint64)
    {
LABEL_22:
      v10 = "Local port specified does not have UINT64 type.";
      goto LABEL_4;
    }
    v41 = xpc_uint64_get_value(v40);
    if (v41 - 0x10000 < 0xFFFFFFFFFFFF0001)
    {
      sub_100002150((uint64_t)"Illegal local port %llu", v42, v43, v44, v45, v46, v47, v48, v41);
      return 0;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x10u;
      *(_WORD *)(a2 + 44) = bswap32(v41) >> 16;
    }
  }
  else
  {
    sub_10000218C((uint64_t)"No local port specified.", v33, v34, v35, v36, v37, v38, v39, v106);
  }
  v49 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorRemotePort[0]);
  if (v49)
  {
    v57 = v49;
    if (xpc_get_type(v49) != (xpc_type_t)&_xpc_type_uint64)
      goto LABEL_22;
    v91 = xpc_uint64_get_value(v57);
    if (v91 - 0x10000 < 0xFFFFFFFFFFFF0001)
    {
      sub_100002150((uint64_t)"Illegal remote port %llu", v92, v93, v94, v95, v96, v97, v98, v91);
      return 0;
    }
    if (a2)
    {
      *(_BYTE *)(a2 + 8) |= 0x20u;
      *(_WORD *)(a2 + 46) = bswap32(v91) >> 16;
    }
  }
  else
  {
    sub_100002150((uint64_t)"No local port specified.", v50, v51, v52, v53, v54, v55, v56, v106);
  }
  v89 = xpc_dictionary_get_value(v13, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
  if (v89)
  {
    v90 = v89;
    if (xpc_get_type(v89) != (xpc_type_t)&_xpc_type_uint64)
    {
      v10 = "Connection idle timeout does not have UINT64 type.";
      goto LABEL_4;
    }
    if (xpc_uint64_get_value(v90) >= 0x69781)
    {
      sub_100002150((uint64_t)"Connection idle timeout exceeds max limit of %u seconds", v99, v100, v101, v102, v103, v104, v105, 432000);
      return 0;
    }
  }
  return 1;
}

uint64_t sub_100002150(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return os_log_with_args(qword_100034E90, 0, a1, &a9, v9);
}

uint64_t sub_10000218C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return os_log_with_args(qword_100034E90, 1, a1, &a9, v9);
}

void start(int a1, char **a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD block[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  int v37;
  char *__endptr;
  stat __str;

  __endptr = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2000000000;
  v37 = 0;
  v4 = basename(*a2);
  snprintf((char *)&__str, 0x28uLL, "com.apple.misd.mainQ.%p", &qword_100035470);
  HIBYTE(__str.st_atimespec.tv_sec) = 0;
  qword_100035470 = (uint64_t)dispatch_queue_create((const char *)&__str, 0);
  if (!qword_100035470)
  {
    sub_100003108(0, (uint64_t)"failed to create main queue", v5, v6, v7, v8, v9, v10, v31);
    goto LABEL_38;
  }
  memset(&__str, 0, sizeof(__str));
  if (!stat("/AppleInternal", &__str) && (__str.st_mode & 0xF000) == 0x4000 && (__str.st_mode & 0x140) != 0)
  {
    v11 = 1;
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
    v11 = !stat("/System/Library/PreferenceBundles/CarrierSettings.bundle", &__str)
       && (__str.st_mode & 0xF000) == 0x4000
       && (__str.st_mode & 0x140) != 0;
  }
  dword_100035460 = v11;
  while (1)
  {
    v12 = getopt(a1, a2, "Be:p:P:t:v");
    v13 = v12;
    if (v12 > 111)
    {
      switch(v12)
      {
        case 'p':
          goto LABEL_20;
        case 't':
          v16 = strtol(optarg, &__endptr, 0);
          if (!*optarg || *__endptr || v16 < 0)
          {
            fprintf(__stderrp, "Bad idle timeout: %s\n");
            goto LABEL_38;
          }
          break;
        case 'v':
          dword_10003546C = 1;
          break;
        default:
          goto LABEL_51;
      }
    }
    else if (v12 <= 79)
    {
      if (v12 != 66)
      {
        if (v12 == -1)
        {
          if (dword_10003546C)
            sub_100003500(dword_10003546C);
          if (sub_100003024())
          {
            if (dword_100035460)
            {
              sub_100003108(0, (uint64_t)"allowing special port forwarding for test fixtures", v17, v18, v19, v20, v21, v22, v31);
              sub_1000197A0();
            }
            *(_QWORD *)&__str.st_dev = 1;
            __str.st_ino = 0x200000000;
            sigaction(1, (const sigaction *)&__str, 0);
            sigaction(13, (const sigaction *)&__str, 0);
            sigaction(14, (const sigaction *)&__str, 0);
            sigaction(24, (const sigaction *)&__str, 0);
            sigaction(25, (const sigaction *)&__str, 0);
            sigaction(26, (const sigaction *)&__str, 0);
            sigaction(27, (const sigaction *)&__str, 0);
            sigaction(18, (const sigaction *)&__str, 0);
            sigaction(21, (const sigaction *)&__str, 0);
            sigaction(22, (const sigaction *)&__str, 0);
            sigaction(30, (const sigaction *)&__str, 0);
            sigaction(31, (const sigaction *)&__str, 0);
            sigaction(2, (const sigaction *)&__str, 0);
            sigaction(15, (const sigaction *)&__str, 0);
            sigaction(20, (const sigaction *)&__str, 0);
            v23 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, (dispatch_queue_t)qword_100035470);
            qword_100034EA0 = (uint64_t)v23;
            if (v23)
            {
              dispatch_source_set_event_handler(v23, &stru_100030BD8);
              dispatch_resume((dispatch_object_t)qword_100034EA0);
            }
            v24 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_100035470);
            qword_100034EA8 = (uint64_t)v24;
            if (v24)
            {
              dispatch_source_set_event_handler(v24, &stru_100030C18);
              dispatch_resume((dispatch_object_t)qword_100034EA8);
            }
            snprintf((char *)&__str, 0x22uLL, "com.apple.misd.%p", &qword_100035478);
            BYTE1(__str.st_atimespec.tv_sec) = 0;
            qword_100035478 = (uint64_t)dispatch_queue_create((const char *)&__str, 0);
            if (qword_100035478)
            {
              *((_DWORD *)v35 + 6) = 0;
              block[0] = _NSConcreteStackBlock;
              block[1] = 0x40000000;
              block[2] = sub_100002840;
              block[3] = &unk_100030B98;
              block[4] = &v34;
              dispatch_sync((dispatch_queue_t)qword_100035470, block);
              if (!*((_DWORD *)v35 + 6))
              {
                sub_100002918();
                dispatch_main();
              }
            }
            else
            {
              sub_100003108(0, (uint64_t)"failed to create process termination queue", v25, v26, v27, v28, v29, v30, v32);
              *((_DWORD *)v35 + 6) = 12;
            }
          }
        }
        else
        {
LABEL_51:
          sub_1000027BC(v4);
        }
LABEL_38:
        sub_1000026F8(1);
      }
      dword_100034D30 = 0;
    }
    else if (v12 == 80)
    {
LABEL_20:
      if (dword_100035460)
      {
        v14 = strtol(optarg, &__endptr, 0);
        if (!*optarg || *__endptr || (v14 < 0x10000 ? (v15 = v14 <= 0) : (v15 = 1), v15))
        {
          fprintf(__stderrp, "Bad port : %s\n");
          goto LABEL_38;
        }
        ++dword_100035464;
        if (v13 == 112)
          word_100035468 = v14;
        else
          word_10003546A = v14;
      }
    }
    else
    {
      if (v12 != 101)
        goto LABEL_51;
      __strlcpy_chk(&byte_100035450, optarg, 16, 16);
    }
  }
}

void sub_1000026F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (qword_100034E98)
  {
    xpc_connection_cancel((xpc_connection_t)qword_100034E98);
    xpc_release((xpc_object_t)qword_100034E98);
    qword_100034E98 = 0;
  }
  if (qword_100035470)
  {
    dispatch_release((dispatch_object_t)qword_100035470);
    qword_100035470 = 0;
  }
  if (qword_100035478)
  {
    dispatch_release((dispatch_object_t)qword_100035478);
    qword_100035478 = 0;
  }
  if (qword_100034EA0)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100034EA0);
    dispatch_release((dispatch_object_t)qword_100034EA0);
    qword_100034EA0 = 0;
  }
  if (qword_100034EA8)
  {
    dispatch_source_cancel((dispatch_source_t)qword_100034EA8);
    dispatch_release((dispatch_object_t)qword_100034EA8);
    qword_100034EA8 = 0;
  }
  sub_100010B7C();
  sub_100014468();
  sub_1000115D4();
  sub_1000182A8();
  sub_100019AE4();
  sub_100003108(1u, (uint64_t)"exit: %d", v2, v3, v4, v5, v6, v7, a1);
  sub_1000034A8();
  exit(a1);
}

uint64_t sub_1000027BC(const char *a1)
{
  printf("Usage: %s ", a1);
  puts("[-Bcv6] [-e EXTIF] [-p LO] [-P HI] [-t TIMEOUT]");
  puts("\nptions:");
  puts("\t-B\tDisable bridge");
  puts("\t-v\tEnable verbose logging");
  puts("\t-e EXTIF\tExternal interface name");
  puts("\t-p LO\tPort forwarding range, LO");
  puts("\t-P HI\tPort forwarding range, HI");
  return puts("\t-t TIMEOUT\tIdle timeout");
}

void sub_100002840(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;

  sub_1000197E4();
  v2 = sub_100010B68();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v2;
  if (v2)
  {
    v23 = strerror(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    sub_100003108(0, (uint64_t)"pdp: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v23);
  }
  else
  {
    v9 = sub_100013010();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v9;
    if (v9)
    {
      v24 = strerror(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
      sub_100003108(0, (uint64_t)"settings: %s", v10, v11, v12, v13, v14, v15, (uint64_t)v24);
    }
    else
    {
      v16 = sub_10001159C();
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v16;
      if (v16)
      {
        v25 = strerror(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
        sub_100003108(0, (uint64_t)"bcast: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v25);
      }
      else
      {
        sub_1000180E4();
      }
    }
  }
}

void sub_100002918()
{
  _xpc_connection_s *mach_service;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  mach_service = xpc_connection_create_mach_service(off_100034B90[0], (dispatch_queue_t)qword_100035470, 1uLL);
  qword_100034E98 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_100003108(0, (uint64_t)"could not start xpc listener", v1, v2, v3, v4, v5, v6, v7);
    sub_1000026F8(12);
  }
  xpc_connection_set_event_handler(mach_service, &stru_100030C58);
  xpc_connection_resume((xpc_connection_t)qword_100034E98);
}

void sub_10000297C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  sub_100003108(2u, (uint64_t)"received SIGINT", v1, v2, v3, v4, v5, v6, vars0);
  sub_1000026F8(0);
}

void sub_10000299C(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t vars0;

  sub_100003108(2u, (uint64_t)"received SIGTERM", v1, v2, v3, v4, v5, v6, vars0);
  sub_1000026F8(0);
}

void sub_1000029BC(id a1, void *a2)
{
  xpc_type_t type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *string;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD handler[5];
  uint64_t v18;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100003108(2u, (uint64_t)"connection %p event from client", v4, v5, v6, v7, v8, v9, (uint64_t)a2);
    xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)qword_100035470);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100002AB8;
    handler[3] = &unk_100030C78;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_resume((xpc_connection_t)a2);
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    sub_100003108(0, (uint64_t)"xpc connection error: %s", v11, v12, v13, v14, v15, v16, (uint64_t)string);
  }
  else
  {
    sub_100003108(0, (uint64_t)"unknown message type", v4, v5, v6, v7, v8, v9, v18);
  }
}

void sub_100002AB8(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_type_t type;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _xpc_connection_s *v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _xpc_connection_s *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t uint64;
  pid_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  pid_t pid;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  xpc_object_t reply;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  _OWORD *v76;
  _OWORD buffer[4];

  type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      v20 = *(_QWORD *)(a1 + 32);
      xpc_dictionary_get_string(object, _xpc_error_key_description);
      sub_100003108(1u, (uint64_t)"received connection error %p:%s", v21, v22, v23, v24, v25, v26, v20);
      v33 = *(_xpc_connection_s **)(a1 + 32);
      v34 = (uint64_t *)qword_1000354C8;
      if (qword_1000354C8)
      {
        do
        {
          v35 = *v34;
          if (*(_xpc_connection_s **)(v34[10] + 8) == v33)
          {
            sub_100003108(2u, (uint64_t)"found client %p for connection %p", v27, v28, v29, v30, v31, v32, (uint64_t)v34);
            sub_10000B5E8(v34);
          }
          v34 = (uint64_t *)v35;
        }
        while (v35);
      }
      xpc_connection_cancel(v33);
    }
    else
    {
      sub_100003108(0, (uint64_t)"unknown message type", v12, v13, v14, v15, v16, v17, a9);
    }
    return;
  }
  if (xpc_dictionary_get_uint64(object, off_100034B98[0]) == 1000)
  {
    v18 = *(_QWORD *)(a1 + 32);
    memset(buffer, 0, 32);
    xpc_connection_get_audit_token(v18, buffer);
    if (sub_100002F90((uint64_t)buffer, (uint64_t)"com.apple.MobileInternetSharing.allow"))
    {
      v19 = 1;
    }
    else
    {
      if (!sub_100002F90((uint64_t)buffer, (uint64_t)"com.apple.vm.networking"))
      {
        sub_100003108(0, (uint64_t)"%s: xpc client does not have any vmnet entitlement, nor is it root", v53, v54, v55, v56, v57, v58, (uint64_t)"client_entitlement_check");
        pid = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
        proc_name(pid, buffer, 0x40u);
        sub_100003108(0, (uint64_t)" %s[%d] client access check failed", v60, v61, v62, v63, v64, v65, (uint64_t)buffer);
        reply = xpc_dictionary_create_reply(object);
        if (reply)
        {
          v73 = reply;
          xpc_dictionary_set_uint64(reply, off_100034BF8[0], 0x7D2uLL);
          sub_1000042FC(*(_xpc_connection_s **)(a1 + 32), v73);
          xpc_release(v73);
          return;
        }
        v74 = "xpc_dictionary_create_reply() failed";
        goto LABEL_51;
      }
      v19 = 2;
    }
  }
  else
  {
    v19 = 0;
  }
  v36 = (void *)xpc_connection_copy_entitlement_value(*(_QWORD *)(a1 + 32), "com.apple.private.MobileInternetSharingStateException.allow");
  if (v36)
  {
    v37 = v36;
    if (xpc_get_type(v36) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v37))
      v19 |= 4u;
    xpc_release(v37);
  }
  v38 = *(_xpc_connection_s **)(a1 + 32);
  uint64 = xpc_dictionary_get_uint64(object, off_100034B98[0]);
  if (dword_10003546C || byte_100035480)
  {
    v46 = xpc_connection_get_pid(v38);
    proc_name(v46, buffer, 0x40u);
    sub_100002FFC(uint64);
    sub_100003108(2u, (uint64_t)"%s ---> %s", v47, v48, v49, v50, v51, v52, (uint64_t)buffer);
  }
  switch(uint64)
  {
    case 0x3E8uLL:
      sub_10000435C(v38, object, v19);
      break;
    case 0x3E9uLL:
      sub_100004518(v38, object);
      break;
    case 0x3EAuLL:
      sub_100004EA8(v38, object);
      break;
    case 0x3EBuLL:
      sub_100004F9C(v38, object);
      break;
    case 0x3ECuLL:
      sub_1000050A0(v38, object);
      break;
    case 0x3EDuLL:
      sub_1000052D0(v38, object);
      break;
    case 0x3EEuLL:
      sub_1000053E4(v38, object);
      break;
    case 0x3EFuLL:
      sub_100005558(v38, object);
      break;
    case 0x3F0uLL:
      sub_100005618(v38, object);
      break;
    case 0x3F1uLL:
      sub_10000576C(v38, object);
      break;
    case 0x3F2uLL:
      sub_1000058C0(v38, object);
      break;
    case 0x3F3uLL:
      sub_1000059C4(v38, object);
      break;
    case 0x3F4uLL:
      sub_100004490(v38, object);
      break;
    case 0x3F5uLL:
      sub_1000051A4(v38, object);
      break;
    case 0x3F6uLL:
      sub_100005B04(v38, object);
      break;
    case 0x3F7uLL:
      sub_100006358(v38, object);
      break;
    case 0x3F8uLL:
      sub_100006854(v38, object);
      break;
    case 0x3F9uLL:
      sub_100006930(v38, object);
      break;
    case 0x3FAuLL:
      sub_100006A28(v38, object, v39, v40, v41, v42, v43, v44);
      break;
    case 0x3FBuLL:
      sub_100006D2C(v38, object, v39, v40, v41, v42, v43, v44);
      break;
    default:
      sub_100003108(0, (uint64_t)"incorrect xpc request type", v39, v40, v41, v42, v43, v44, v75);
      break;
  }
  if (dword_10003546C || byte_100035480)
  {
    v76 = buffer;
    sub_100002FFC(uint64);
    v74 = "%s <--- %s";
    LOBYTE(reply) = 2;
LABEL_51:
    sub_100003108(reply, (uint64_t)v74, v67, v68, v69, v70, v71, v72, (uint64_t)v76);
  }
}

BOOL sub_100002F90(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = (void *)xpc_copy_entitlement_for_token(a2, a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = xpc_get_type(v2) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v3);
  xpc_release(v3);
  return v4;
}

const char *sub_100002FFC(uint64_t a1)
{
  if ((unint64_t)(a1 - 1000) > 0x11)
    return "unknown";
  else
    return (&off_100030C98)[a1 - 1000];
}

uint64_t sub_100003024()
{
  uint64_t result;
  const __SCPreferences *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_100034EB0)
    return 1;
  v1 = SCPreferencesCreate(kCFAllocatorDefault, CFSTR("com.apple.MobileInternetSharing"), CFSTR("com.apple.MIS.logging.plist"));
  qword_100034EB0 = (uint64_t)v1;
  if (v1)
  {
    if (SCPreferencesSetCallback(v1, (SCPreferencesCallBack)sub_100003168, 0))
    {
      if (SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_100034EB0, (dispatch_queue_t)qword_100035470))
      {
        sub_100003168((const __SCPreferences *)qword_100034EB0, 3, v2, v3, v4, v5, v6, v7);
        return 1;
      }
      v8 = "SCPreferencesSetDispatchQueue() failed for logging: %s";
    }
    else
    {
      v8 = "SCPreferencesSetCallback() failed for logging: %s";
    }
  }
  else
  {
    v8 = "SCPreferencesCreate() failed for logging: %s";
  }
  v9 = SCError();
  v10 = SCErrorString(v9);
  sub_100003108(0, (uint64_t)v8, v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  result = qword_100034EB0;
  if (qword_100034EB0)
  {
    CFRelease((CFTypeRef)qword_100034EB0);
    result = 0;
    qword_100034EB0 = 0;
  }
  return result;
}

uint64_t sub_100003108(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t result;

  result = sub_100003504();
  if ((_DWORD)result)
    return os_log_with_args(qword_100034EB8, a1, a2, &a9, v9);
  return result;
}

void sub_100003168(const __SCPreferences *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFBoolean *Value;
  CFTypeID TypeID;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  const __CFBoolean *v18;
  CFTypeID v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const char *v27;
  CFPropertyListRef v28;
  CFTypeID v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const char *v37;
  CFPropertyListRef v38;
  CFTypeID v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const char *v47;
  CFPropertyListRef v48;
  CFTypeID v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  const char *v57;
  const __CFBoolean *v58;
  CFTypeID v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;

  if ((a2 & 2) != 0)
  {
    sub_100003108(1u, (uint64_t)"logging preference changed", a3, a4, a5, a6, a7, a8, v68);
    Value = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("MISDLogging"));
    TypeID = CFBooleanGetTypeID();
    if (Value)
    {
      if (CFGetTypeID(Value) == TypeID)
        LODWORD(Value) = CFBooleanGetValue(Value);
      else
        LODWORD(Value) = 0;
    }
    if (byte_100035480 != (_DWORD)Value)
    {
      byte_100035480 = (char)Value;
      if (!dword_10003546C)
      {
        sub_100003504();
        v17 = "enabled";
        if (!(_DWORD)Value)
          v17 = "disabled";
        sub_100003108(1u, (uint64_t)"verbose mode %s", v11, v12, v13, v14, v15, v16, (uint64_t)v17);
      }
    }
    v18 = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("EnablePFLog"));
    v19 = CFBooleanGetTypeID();
    if (v18 && CFGetTypeID(v18) == v19)
      v26 = CFBooleanGetValue(v18);
    else
      v26 = 0;
    if (v26 != byte_100035485)
    {
      byte_100035485 = v26;
      if (v26)
        v27 = "true";
      else
        v27 = "false";
      sub_100003108(1u, (uint64_t)"EnablePFLog %s", v20, v21, v22, v23, v24, v25, (uint64_t)v27);
    }
    v28 = SCPreferencesGetValue(a1, CFSTR("IPv6OnlyPreferred"));
    v29 = CFBooleanGetTypeID();
    v36 = v28 && CFGetTypeID(v28) == v29 && CFBooleanGetValue((CFBooleanRef)v28) == 0;
    if (v36 != byte_100035482)
    {
      byte_100035482 = v36;
      if (v36)
        v37 = "true";
      else
        v37 = "false";
      sub_100003108(1u, (uint64_t)"DisableIPv6OnlyPreferred %s", v30, v31, v32, v33, v34, v35, (uint64_t)v37);
    }
    v38 = SCPreferencesGetValue(a1, CFSTR("IPv6UsePREF64"));
    v39 = CFBooleanGetTypeID();
    v46 = v38 && CFGetTypeID(v38) == v39 && CFBooleanGetValue((CFBooleanRef)v38) == 0;
    if (v46 != byte_100035483)
    {
      byte_100035483 = v46;
      if (v46)
        v47 = "true";
      else
        v47 = "false";
      sub_100003108(1u, (uint64_t)"DisableIPv6UsePREF64 %s", v40, v41, v42, v43, v44, v45, (uint64_t)v47);
    }
    v48 = SCPreferencesGetValue(a1, CFSTR("IPv6Enable"));
    v49 = CFBooleanGetTypeID();
    v56 = v48 && CFGetTypeID(v48) == v49 && CFBooleanGetValue((CFBooleanRef)v48) == 0;
    if (v56 != byte_100035481)
    {
      byte_100035481 = v56;
      if (v56)
        v57 = "true";
      else
        v57 = "false";
      sub_100003108(1u, (uint64_t)"DisableIPv6 %s", v50, v51, v52, v53, v54, v55, (uint64_t)v57);
    }
    v58 = (const __CFBoolean *)SCPreferencesGetValue(a1, CFSTR("PREF64OnDualSim"));
    v59 = CFBooleanGetTypeID();
    if (v58 && CFGetTypeID(v58) == v59)
      v66 = CFBooleanGetValue(v58);
    else
      v66 = 0;
    if (v66 != byte_100035484)
    {
      byte_100035484 = v66;
      if (v66)
        v67 = "true";
      else
        v67 = "false";
      sub_100003108(1u, (uint64_t)"EnablePREF64OnDualSim %s", v60, v61, v62, v63, v64, v65, (uint64_t)v67);
    }
    SCPreferencesSynchronize(a1);
  }
}

void sub_1000034A8()
{
  const void *v0;
  BOOL v1;

  v0 = (const void *)qword_100034EB0;
  if (qword_100034EB0)
  {
    if (dword_10003546C)
      v1 = 0;
    else
      v1 = byte_100035480 == 0;
    if (!v1)
    {
      byte_100035480 = 0;
      sub_100003504();
      v0 = (const void *)qword_100034EB0;
    }
    CFRelease(v0);
    qword_100034EB0 = 0;
  }
}

BOOL sub_100003504()
{
  os_log_t v0;
  NSObject *v2;

  v0 = (os_log_t)qword_100034EB8;
  if (!qword_100034EB8)
  {
    v0 = os_log_create("com.apple.MobileInternetSharing", "daemon");
    qword_100034EB8 = (uint64_t)v0;
    if (!v0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_100021BB0(&v2);
        v0 = v2;
      }
      else
      {
        v0 = 0;
      }
    }
  }
  return v0 != 0;
}

uint64_t sub_10000357C(uint64_t a1)
{
  uint64_t v2;

  v2 = a1;
  return sub_1000035A4(0, &v2);
}

uint64_t sub_1000035A4(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v2 = (uint64_t *)qword_100034EC8;
  if (!qword_100034EC8)
    return 0;
  v5 = 0;
  do
  {
    v6 = (uint64_t *)v2[13];
    if (!a1 || sub_100003CD8((uint64_t)v2, a1))
      v5 += sub_100003D90(v2, a2);
    v2 = v6;
  }
  while (v6);
  if (v5 && !qword_100034EC8)
  {
    sub_100003108(1u, (uint64_t)"no filters left after this remove, freeing the GCD handle", v7, v8, v9, v10, v11, v12, v14);
    dispatch_source_cancel((dispatch_source_t)qword_100034ED0);
    dispatch_release((dispatch_object_t)qword_100034ED0);
    qword_100034ED0 = 0;
  }
  return v5;
}

uint64_t sub_100003654()
{
  return sub_1000035A4(0, 0);
}

uint64_t sub_100003660(uint64_t a1, _OWORD *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  _QWORD *v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  dispatch_time_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  __int128 v69;

  v8 = a5;
  v66 = a3;
  if (!qword_100034EC0)
  {
    v33 = "failed to add low latency rule, nexus controller not present.";
    goto LABEL_12;
  }
  sub_100003108(1u, (uint64_t)"modifying low latency rules. remove: %d", a3, a4, a5, a6, a7, a8, a5);
  if ((v8 & 1) == 0)
  {
    v34 = qword_100034EC8;
    if (qword_100034EC8)
    {
      v35 = a4 / 0x3C + 2;
      while (!sub_100003CD8(v34, (uint64_t)a2))
      {
        v34 = *(_QWORD *)(v34 + 104);
        if (!v34)
          goto LABEL_10;
      }
      sub_100003108(1u, (uint64_t)"found matching low latency filter", v13, v14, v15, v16, v17, v18, v64);
      v40 = *(_QWORD **)(v34 + 48);
      if (v40)
      {
        while (*v40 != a3)
        {
          v40 = (_QWORD *)v40[1];
          if (!v40)
            goto LABEL_20;
        }
        v33 = "found matching device id in list, this means filter already exists";
        goto LABEL_12;
      }
LABEL_20:
      v41 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
      *v41 = a3;
      v41[1] = *(_QWORD *)(v34 + 48);
      *(_QWORD *)(v34 + 48) = v41;
      if (v35 > *(unsigned __int16 *)(v34 + 98))
      {
        *(_WORD *)(v34 + 98) = v35;
        *(_WORD *)(v34 + 96) = v35;
        sub_100003108(2u, (uint64_t)"extending descriptor %p max_time to %hu", v26, v27, v28, v29, v30, v31, v34);
      }
LABEL_23:
      if (!qword_100034ED0)
      {
        v37 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100035470);
        qword_100034ED0 = (uint64_t)v37;
        if (!v37)
        {
          v33 = "failed to create GCD handle for filter traffic query timer";
          goto LABEL_13;
        }
        dispatch_source_set_event_handler(v37, &stru_100030D48);
        v54 = qword_100034ED0;
        v55 = dispatch_walltime(0, 60000000000);
        dispatch_source_set_timer(v54, v55, 0xDF8475800uLL, 0);
        byte_100034EE0 = 1;
        sub_100003108(2u, (uint64_t)"created GCD handle and set timer to %d seconds", v56, v57, v58, v59, v60, v61, 60);
      }
      if (byte_100034EE0 == 1)
      {
        dispatch_resume((dispatch_object_t)qword_100034ED0);
        byte_100034EE0 = 0;
      }
      v32 = "add";
      goto LABEL_29;
    }
LABEL_10:
    v67 = 786433;
    v69 = 0uLL;
    v68 = 0;
    sub_100003108(1u, (uint64_t)"installing filter to ifname %s", v13, v14, v15, v16, v17, v18, *(_QWORD *)(a1 + 296) + 308);
    v36 = os_nexus_controller_add_traffic_rule(qword_100034EC0, *(_QWORD *)(a1 + 296) + 308, a2, &v67, 0, &v69);
    if (!(_DWORD)v36)
    {
      sub_100003108(2u, (uint64_t)"did not find matching filter in list, adding new filter", a3, a4, a5, a6, a7, a8, v65);
      v42 = malloc_type_malloc(0x70uLL, 0x1020040761EC19CuLL);
      v44 = a2[1];
      v43 = a2[2];
      *v42 = *a2;
      v42[1] = v44;
      v42[2] = v43;
      *((_QWORD *)v42 + 13) = qword_100034EC8;
      qword_100034EC8 = (uint64_t)v42;
      ++qword_100034ED8;
      v45 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
      *((_QWORD *)v42 + 6) = 0;
      *((_QWORD *)v42 + 7) = 0;
      *v45 = a3;
      v46 = a4 / 0x3C + 2;
      *((_WORD *)v42 + 48) = v46;
      *((_WORD *)v42 + 49) = v46;
      sub_100003108(2u, (uint64_t)"initializing descriptor %p max_time to %hu", v47, v48, v49, v50, v51, v52, (uint64_t)v42);
      *((_QWORD *)v42 + 10) = 0;
      *((_QWORD *)v42 + 11) = 0;
      v45[1] = *((_QWORD *)v42 + 6);
      v53 = *((_QWORD *)v42 + 7) + 1;
      *((_QWORD *)v42 + 6) = v45;
      *((_QWORD *)v42 + 7) = v53;
      v42[4] = v69;
      goto LABEL_23;
    }
    v63 = v36;
    v33 = "add low latency rule failed with error code %u.\n";
LABEL_12:
    LOBYTE(v37) = 0;
LABEL_13:
    sub_100003108(v37, (uint64_t)v33, a3, a4, a5, a6, a7, a8, v63);
    goto LABEL_14;
  }
  sub_100003108(2u, (uint64_t)"device id is %llu", v13, v14, v15, v16, v17, v18, a3);
  v19 = sub_1000035A4((uint64_t)a2, &v66);
  sub_100003108(1u, (uint64_t)"removed %lu filters", v20, v21, v22, v23, v24, v25, v19);
  if (v19)
  {
    v32 = "remove";
LABEL_29:
    v39 = 1;
    sub_100003108(1u, (uint64_t)"%s filter operation succeeded", v26, v27, v28, v29, v30, v31, (uint64_t)v32);
    return v39;
  }
LABEL_14:
  v38 = "add";
  if (v8)
    v38 = "remove";
  sub_100003108(0, (uint64_t)"%s filter operation failed", v26, v27, v28, v29, v30, v31, (uint64_t)v38);
  return 0;
}

uint64_t sub_100003A74()
{
  uint64_t result;

  if (qword_100034EC0)
    sub_100021C0C();
  result = os_nexus_controller_create();
  qword_100034EC0 = result;
  return result;
}

uint64_t sub_100003AA4()
{
  uint64_t result;

  result = qword_100034EC0;
  if (qword_100034EC0)
  {
    result = os_nexus_controller_destroy();
    qword_100034EC0 = 0;
  }
  return result;
}

uint64_t sub_100003AD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  __int128 v44;
  __int128 v45;
  int v46;

  if (*(_BYTE *)(a2 + 9) == 96)
    return 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
  {
    v12 = socket(30, 2, 0);
    if (v12 < 0)
    {
      sub_100003108(0, (uint64_t)"%s: failed to create socket: %m", v13, v14, v15, v16, v17, v18, (uint64_t)"mis_translate_addr_for_clat46");
      return 0xFFFFFFFFLL;
    }
    v19 = v12;
    v46 = 0;
    v44 = 0u;
    v45 = 0u;
    if ((unint64_t)__strlcpy_chk(&v44, a1 + 308, 16, 16) >= 0x10)
    {
      sub_100003108(0, (uint64_t)"%s: failed to copy external interface name: %m", v20, v21, v22, v23, v24, v25, (uint64_t)"mis_translate_addr_for_clat46");
      goto LABEL_9;
    }
    if (ioctl(v19, 0xC02469C9uLL, &v44) < 0)
    {
      sub_100003108(1u, (uint64_t)"%s: ext interface %s does not have clat46 prefix: %m", v26, v27, v28, v29, v30, v31, (uint64_t)"mis_translate_addr_for_clat46");
    }
    else
    {
      v32 = sub_100006F80(a1, 0, 0, v27, v28, v29, v30, v31);
      if (v32 != 2)
      {
        if (!v32)
        {
          v33 = *(_BYTE *)(a2 + 8);
          if ((v33 & 4) != 0)
            *(_OWORD *)(a2 + 12) = v45;
          if ((v33 & 8) == 0
            || (v42 = 0,
                v43 = 0,
                v41 = *(_DWORD *)(a1 + 1260),
                __memcpy_chk(&v42, a1 + 1244),
                v40 = *(_DWORD *)(a2 + 40),
                nw_nat64_synthesize_v6(&v41, &v40, a2 + 28)))
          {
            v9 = 0;
            *(_BYTE *)(a2 + 9) = 96;
            goto LABEL_21;
          }
          sub_100003108(0, (uint64_t)"%s: failed to synthesize remote address with NAT64 prefix", v34, v35, v36, v37, v38, v39, (uint64_t)"mis_translate_addr_for_clat46");
        }
LABEL_9:
        v9 = 0xFFFFFFFFLL;
LABEL_21:
        close(v19);
        return v9;
      }
    }
    v9 = 0;
    goto LABEL_21;
  }
  sub_100003108(2u, (uint64_t)"%s: steering rule does not specify IP version", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_translate_addr_for_clat46");
  return 0;
}

BOOL sub_100003CD8(uint64_t a1, uint64_t a2)
{
  int v2;

  if (*(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8))
    return 0;
  v2 = *(unsigned __int8 *)(a1 + 9);
  if (v2 != *(unsigned __int8 *)(a2 + 9))
    return 0;
  if (v2 == 96)
  {
    if (*(_QWORD *)(a1 + 12) != *(_QWORD *)(a2 + 12) || *(_QWORD *)(a1 + 20) != *(_QWORD *)(a2 + 20))
      return 0;
    if (*(_QWORD *)(a1 + 28) != *(_QWORD *)(a2 + 28) || *(_QWORD *)(a1 + 36) != *(_QWORD *)(a2 + 36))
      return 0;
  }
  else if (v2 != 4 || *(_DWORD *)(a1 + 24) != *(_DWORD *)(a2 + 24) || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a2 + 40))
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 44) == *(unsigned __int16 *)(a2 + 44))
    return *(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46);
  return 0;
}

uint64_t sub_100003D90(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1 + 6;
  result = a1[6];
  if (result)
  {
    while (1)
    {
      v6 = *(_QWORD *)(result + 8);
      if (!a2 || *(_QWORD *)result == *a2)
      {
        v7 = *v4;
        v8 = v4;
        if (*v4 != result)
        {
          do
          {
            v9 = v7;
            v7 = *(_QWORD *)(v7 + 8);
          }
          while (v7 != result);
          v8 = (uint64_t *)(v9 + 8);
        }
        *v8 = v6;
        v10 = a1[7];
        if (!v10)
          sub_100021C34();
        a1[7] = v10 - 1;
        free((void *)result);
        if (!a1[7])
          break;
      }
      result = v6;
      if (!v6)
        return result;
    }
    v11 = &qword_100034EC8;
    v12 = qword_100034EC8;
    if ((uint64_t *)qword_100034EC8 != a1)
    {
      do
      {
        v13 = v12;
        v12 = *(_QWORD *)(v12 + 104);
      }
      while ((uint64_t *)v12 != a1);
      v11 = (uint64_t *)(v13 + 104);
    }
    *v11 = a1[13];
    if (!qword_100034ED8)
      sub_100021C5C();
    --qword_100034ED8;
    v14 = os_nexus_controller_remove_traffic_rule(qword_100034EC0, a1 + 8);
    if ((_DWORD)v14)
      sub_100003108(0, (uint64_t)"failed to remove steering rule with error %d", v15, v16, v17, v18, v19, v20, v14);
    free(a1);
    return 1;
  }
  return result;
}

void sub_100003EB4(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = 0;
  v7 = qword_100034EC8;
  if (qword_100034EC8)
  {
    v8 = 0;
    do
    {
      if ((PFStateQueryAppendTrafficDescriptor(&v12, v7, v7 + 64) & 1) == 0)
      {
        v9 = "failed to append descriptor to query object, skipping query";
        v10 = 0;
        goto LABEL_9;
      }
      v7 = *(_QWORD *)(v7 + 104);
      --v8;
    }
    while (v7);
    if (!v8)
      goto LABEL_7;
    PFFindStatesByDescriptor(v12, qword_100035470, &stru_100030D88);
  }
  else
  {
LABEL_7:
    v9 = "no filters are currently in effect, skipping query";
    v10 = 1;
LABEL_9:
    sub_100003108(v10, (uint64_t)v9, v1, v2, v3, v4, v5, v6, v11);
  }
}

void sub_100003F4C(id a1, BOOL a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  xpc_object_t value;
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
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  if (!a2)
  {
    v46 = "query of PF states returned error status";
LABEL_21:
    sub_100003108(0, (uint64_t)v46, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v47);
    goto LABEL_22;
  }
  if (!a3)
  {
    v46 = "response is NULL";
    goto LABEL_21;
  }
  if (xpc_array_get_count(a3))
  {
    v15 = 0;
    do
    {
      v51 = 0;
      v49 = 0u;
      v50 = 0u;
      value = xpc_array_get_value(a3, v15);
      PFGetDescriptorStateDetails(value, &v49, 40);
      v17 = qword_100034EC8;
      while (v17)
      {
        v18 = v17;
        v17 = *(_QWORD *)(v17 + 104);
        if (!uuid_compare((const unsigned __int8 *)(v18 + 64), (const unsigned __int8 *)&v50))
        {
          sub_100003108(1u, (uint64_t)"found matching descriptor by uuid", v19, v20, v21, v22, v23, v24, v47);
          if ((_BYTE)v51 && *(_OWORD *)(v18 + 80) != v49)
          {
            sub_100003108(1u, (uint64_t)"detected ongoing traffic during the timeout period, renewing timeout", v25, v26, v27, v28, v29, v30, v48);
            sub_100003108(2u, (uint64_t)"packet count in old %llu new %llu, packet count out old %llu new %llu", v32, v33, v34, v35, v36, v37, *(_QWORD *)(v18 + 80));
            *(_OWORD *)(v18 + 80) = v49;
            *(_WORD *)(v18 + 96) = *(_WORD *)(v18 + 98);
          }
          else
          {
            if (!*(_WORD *)(v18 + 96))
              sub_100021C84();
            v31 = *(_WORD *)(v18 + 96) - 1;
            *(_WORD *)(v18 + 96) = v31;
            if (v31)
            {
              sub_100003108(2u, (uint64_t)"descriptor %p remaining time %hu", v25, v26, v27, v28, v29, v30, v18);
            }
            else
            {
              v38 = sub_100003D90((uint64_t *)v18, 0);
              v45 = "failed to remove";
              if (v38)
                v45 = "removed";
              sub_100003108(1u, (uint64_t)"%s descriptor from the list", v39, v40, v41, v42, v43, v44, (uint64_t)v45);
            }
          }
          break;
        }
      }
      ++v15;
    }
    while (v15 < xpc_array_get_count(a3));
  }
LABEL_22:
  if (!qword_100034EC8)
  {
    sub_100003108(1u, (uint64_t)"no filters left after this query, freeing the GCD handle", v9, v10, v11, v12, v13, v14, v47);
    dispatch_source_cancel((dispatch_source_t)qword_100034ED0);
    dispatch_release((dispatch_object_t)qword_100034ED0);
    qword_100034ED0 = 0;
  }
  if (a3)
    xpc_release(a3);
}

uint64_t sub_10000418C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a4 || !result || !a2 || !a3)
    sub_100021CD4();
  *(_OWORD *)result = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_QWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a4;
  *(_QWORD *)(result + 32) = 0;
  *(_DWORD *)(result + 32) = a5;
  if (__CFADD__(dword_100035488++, 1))
    sub_100021CAC();
  *(_QWORD *)result = qword_1000354A0;
  qword_1000354A0 = result;
  return result;
}

void sub_1000041F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *i;
  void *v12;
  _xpc_connection_s *v13;

  if (!a1)
    sub_100021CFC();
  v9 = &qword_1000354A0;
  v10 = &qword_1000354A0;
  while (1)
  {
    v10 = (uint64_t *)*v10;
    if (!v10)
      break;
    if (v10[3] == a1)
    {
      for (i = (uint64_t *)qword_1000354A0; i != v10; i = (uint64_t *)*i)
        v9 = i;
      *v9 = *v10;
      if (!dword_100035488)
        sub_100021D24();
      --dword_100035488;
      v13 = (_xpc_connection_s *)v10[1];
      v12 = (void *)v10[2];
      if (*(_DWORD *)(*(_QWORD *)(a1 + 280) + 288) == 101)
        sub_100014844(4, a2, a3, a4, a5, a6, a7, a8);
      if (v12)
      {
        if (v13)
        {
          xpc_dictionary_set_uint64(v12, off_100034BF8[0], 0x7D3uLL);
          sub_1000042FC(v13, v12);
          xpc_release(v12);
        }
      }
      sub_100003108(1u, (uint64_t)"destroyed service request %s", a3, a4, a5, a6, a7, a8, a1 + 20);
      free(v10);
      return;
    }
  }
}

void sub_1000042FC(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;

  v10 = xpc_copy_description(object);
  sub_100003108(2u, (uint64_t)"sending reply %p:\n%s", v4, v5, v6, v7, v8, v9, (uint64_t)a1);
  free(v10);
  xpc_connection_send_message(a1, object);
}

uint64_t sub_10000435C(_xpc_connection_s *a1, xpc_object_t original, int a3)
{
  xpc_object_t reply;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v38;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v13 = reply;
    v14 = sub_10000AF6C((uint64_t)a1);
    if (v14 || (v14 = sub_10000B0F0((uint64_t)a1, original)) != 0)
    {
      v21 = sub_10000B374(a1, (uint64_t)v14, a3);
      if (v21)
      {
        v28 = v21;
        xpc_dictionary_set_uint64(v13, off_100034BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v13, off_100034BA0[0], v28 + 96);
        v29 = 1;
LABEL_10:
        sub_1000042FC(a1, v13);
        xpc_release(v13);
        return v29;
      }
      sub_100003108(0, (uint64_t)"client creation failed for connection %p", v22, v23, v24, v25, v26, v27, (uint64_t)a1);
      sub_10000B040(v14, v30, v31, v32, v33, v34, v35, v36);
    }
    else
    {
      sub_100003108(0, (uint64_t)"unable to create endpoint for %p", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    }
    xpc_dictionary_set_uint64(v13, off_100034BF8[0], 0x7D0uLL);
    v29 = 0;
    goto LABEL_10;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v7, v8, v9, v10, v11, v12, v38);
  return 0;
}

BOOL sub_100004490(_xpc_connection_s *a1, xpc_object_t original)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t reply;
  uint64_t v12;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    sub_10000B544(original, (uint64_t)a1);
    xpc_dictionary_set_uint64(reply, off_100034BF8[0], 0x7D1uLL);
    sub_1000042FC(a1, reply);
    xpc_release(reply);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v4, v5, v6, v7, v8, v9, v12);
  }
  return reply != 0;
}

uint64_t sub_100004518(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  xpc_object_t value;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  xpc_object_t v38;
  xpc_object_t v39;
  xpc_object_t v40;
  void *v41;
  xpc_object_t v42;
  xpc_object_t v43;
  xpc_object_t v44;
  xpc_object_t v45;
  int uint64;
  int v47;
  BOOL v48;
  int v49;
  xpc_object_t v50;
  void *v51;
  xpc_object_t v52;
  void *v53;
  xpc_object_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  xpc_object_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  xpc_object_t v89;
  const char *string;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  unsigned __int8 *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  int v104;
  int v105;
  _OWORD v106[6];

  v105 = 0;
  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    memset(v106, 0, sizeof(v106));
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (!v12 || (v19 = v12, (*(_BYTE *)(v12 + 508) & 1) == 0))
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
LABEL_8:
      v20 = 0;
LABEL_9:
      v21 = 2000;
LABEL_10:
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], v21);
      sub_1000042FC(a1, v11);
      xpc_release(v11);
      return v20;
    }
    if (*(_QWORD *)(v12 + 24))
    {
      sub_100003108(0, (uint64_t)"interface creation previously requested on this interface", v13, v14, v15, v16, v17, v18, (uint64_t)v100);
      goto LABEL_8;
    }
    v20 = (uint64_t)malloc_type_malloc(0x28uLL, 0x10A0040D1175C0DuLL);
    if (!v20)
    {
      sub_100003108(0, (uint64_t)"unable to create reply service object", v23, v24, v25, v26, v27, v28, (uint64_t)v100);
      goto LABEL_9;
    }
    value = xpc_dictionary_get_value(original, off_100034C60[0]);
    if (!value || (v36 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
    {
      v37 = "interface parameter object is not a xpc dictionary";
LABEL_20:
      sub_100003108(0, (uint64_t)v37, v30, v31, v32, v33, v34, v35, (uint64_t)v100);
LABEL_21:
      free((void *)v20);
      goto LABEL_8;
    }
    v38 = xpc_dictionary_get_value(original, off_100034C00[0]);
    if (!v38
      || xpc_get_type(v38) != (xpc_type_t)&_xpc_type_uint64
      || (v39 = xpc_dictionary_get_value(original, off_100034C08[0])) == 0
      || xpc_get_type(v39) != (xpc_type_t)&_xpc_type_uint64
      || (v40 = xpc_dictionary_get_value(v36, off_100034C70[0])) == 0
      || (v41 = v40, xpc_get_type(v40) != (xpc_type_t)&_xpc_type_uint64)
      || xpc_uint64_get_value(v41) != 1
      && ((v45 = xpc_dictionary_get_value(v36, off_100034C68[0])) == 0
       || xpc_get_type(v45) != (xpc_type_t)&_xpc_type_string))
    {
      v37 = "interface parameter object is not valid for mandatory parameters";
      goto LABEL_20;
    }
    v42 = xpc_dictionary_get_value(v36, off_100034C80[0]);
    if (v42 && xpc_get_type(v42) != (xpc_type_t)&_xpc_type_uint64
      || (v43 = xpc_dictionary_get_value(v36, off_100034CB8[0])) != 0
      && xpc_get_type(v43) != (xpc_type_t)&_xpc_type_uint64
      || (v44 = xpc_dictionary_get_value(v36, off_100034C88[0])) != 0
      && xpc_get_type(v44) != (xpc_type_t)&_xpc_type_uint64)
    {
      v37 = "interface parameter object is not valid for optional parameters";
      goto LABEL_20;
    }
    uint64 = xpc_dictionary_get_uint64(original, off_100034C00[0]);
    v47 = xpc_dictionary_get_uint64(v36, off_100034CB8[0]);
    v104 = uint64;
    if (v47)
      v48 = 0;
    else
      v48 = uint64 == 201;
    if (v48)
      v49 = 500;
    else
      v49 = v47;
    v50 = xpc_dictionary_get_value(v36, off_100034CC0[0]);
    v51 = v50;
    if (v50 && xpc_get_type(v50) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v37 = "nat64Param object is not a xpc dictionary";
      goto LABEL_20;
    }
    v52 = xpc_dictionary_get_value(v36, off_100034CC8[0]);
    v53 = v52;
    if (v52 && xpc_get_type(v52) != (xpc_type_t)&_xpc_type_dictionary)
    {
      v37 = "nat66Param object is not a xpc dictionary";
      goto LABEL_20;
    }
    if (!v51 && v49 == 502)
    {
      v37 = "nat64Param not present for nat type NAT64";
      goto LABEL_20;
    }
    memset((char *)v106 + 4, 0, 92);
    LODWORD(v106[0]) = v49;
    if (v49 == 502)
    {
      v54 = xpc_dictionary_get_value(v51, off_100034CD0[0]);
      if (!v54
        || xpc_get_type(v54) != (xpc_type_t)&_xpc_type_string
        || (v89 = xpc_dictionary_get_value(v51, off_100034CD8[0])) == 0
        || xpc_get_type(v89) != (xpc_type_t)&_xpc_type_string)
      {
        v37 = "nat64Param object is not valid for mandatory parameters";
        goto LABEL_20;
      }
      string = xpc_dictionary_get_string(v51, off_100034CD0[0]);
      v91 = xpc_dictionary_get_string(v51, off_100034CD8[0]);
      if (!string || (v92 = v91) == 0)
      {
        v37 = "Failed to get mandatory nat64 params";
        goto LABEL_20;
      }
      __strlcpy_chk((char *)&v106[3] + 2, string, 46, 46);
      __strlcpy_chk((char *)v106 + 4, v92, 46, 46);
    }
    else if (v53 && v49 == 500 && !sub_100004C28(v53, (char *)v106 + 4, (_BYTE *)&v106[3] + 2))
    {
      goto LABEL_21;
    }
    v55 = (char *)xpc_dictionary_get_string(v36, off_100034C90[0]);
    v56 = (char *)xpc_dictionary_get_string(v36, off_100034C98[0]);
    v57 = (char *)xpc_dictionary_get_string(v36, off_100034CA0[0]);
    if (!sub_100004D04(v55, v56, v57, v58, v59, v60, v61, v62))
      goto LABEL_21;
    v63 = xpc_dictionary_get_value(original, off_100034C20[0]);
    if (v63 && xpc_get_type(v63) != (xpc_type_t)&_xpc_type_string)
    {
      v37 = "external interface name is not valid";
      goto LABEL_20;
    }
    v64 = xpc_dictionary_get_uint64(original, off_100034C08[0]);
    v103 = (char *)xpc_dictionary_get_string(original, off_100034C20[0]);
    v102 = (char *)xpc_dictionary_get_string(v36, off_100034C68[0]);
    v101 = xpc_dictionary_get_uint64(v36, off_100034C70[0]);
    v65 = xpc_dictionary_get_uint64(v36, off_100034C80[0]);
    v66 = xpc_dictionary_get_uint64(v36, off_100034C88[0]);
    v67 = sub_1000071C4(v104, v64, v103, v102, v101, v65, v66, 0, 0, 0, v55, v56, v57, *(_DWORD *)(v19 + 508) & 0xFFFFFFFD, v106, 0, &v105);
    if (!v67)
    {
      if (xpc_dictionary_get_uint64(v36, off_100034C70[0]) == 1)
        v99 = "auth";
      else
        v99 = xpc_dictionary_get_string(v36, off_100034C68[0]);
      sub_100003108(0, (uint64_t)"unable to create service for %s", v93, v94, v95, v96, v97, v98, (uint64_t)v99);
      goto LABEL_21;
    }
    v74 = (uint64_t)v67;
    v75 = sub_100008C2C((uint64_t)v67, v19, v68, v69, v70, v71, v72, v73);
    if (!v75)
    {
      xpc_dictionary_set_string(v11, off_100034C10[0], (const char *)(v74 + 20));
      free((void *)v20);
      v20 = 1;
      v21 = 2001;
      goto LABEL_10;
    }
    if (v75 != 36)
    {
      sub_100006D68(v74, v76, v77, v78, v79, v80, v81, v82);
      goto LABEL_21;
    }
    sub_10000418C(v20, (uint64_t)a1, (uint64_t)v11, v74, -1);
    if (xpc_dictionary_get_uint64(v36, off_100034C70[0]) != 1)
      xpc_dictionary_get_string(v36, off_100034C68[0]);
    sub_100003108(2u, (uint64_t)"reply enqueued %p for interface %s", v83, v84, v85, v86, v87, v88, v20);
    return 1;
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, (uint64_t)v100);
    return 0;
  }
}

uint64_t sub_100004C28(void *a1, char *a2, _BYTE *a3)
{
  const char *string;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  const char *v20;
  uint64_t v21;
  _QWORD v22[2];

  string = xpc_dictionary_get_string(a1, off_100034CD8[0]);
  if (!string)
  {
    v20 = "NAT66 RA Prefix is missing/invalid";
LABEL_10:
    sub_100003108(string, (uint64_t)v20, v6, v7, v8, v9, v10, v11, v21);
    return 0;
  }
  v12 = (uint64_t)string;
  v22[0] = 0;
  v22[1] = 0;
  if (inet_pton(30, string, v22) != 1)
  {
    v21 = v12;
    v20 = "NAT66 RA Prefix (%s) is invalid";
LABEL_9:
    LOBYTE(string) = 0;
    goto LABEL_10;
  }
  if (LOBYTE(v22[0]) != 253)
  {
    v21 = v12;
    v20 = "NAT66 RA Prefix (%s) must start with fd00::/8";
    goto LABEL_9;
  }
  if (inet_ntop(30, v22, a2, 0x2Eu))
  {
    *a3 = 64;
    return 1;
  }
  sub_100003108(0, (uint64_t)"NAT66 RA Prefix (%s) is invalid", v13, v14, v15, v16, v17, v18, v12);
  return 0;
}

uint64_t sub_100004D04(char *a1, char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  in_addr_t v20;
  in_addr_t v21;
  in_addr_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if (!a1 && !a2 && !a3)
    return 1;
  if (a1 && a2 && a3)
  {
    if (sub_10000CAFC(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8)
      && sub_10000CAFC(a2, v12, v13, v14, v15, v16, v17, v18)
      && sub_10000CAFC(a3, v19, v13, v14, v15, v16, v17, v18))
    {
      v20 = inet_addr(a1);
      v21 = inet_addr(a2);
      v22 = inet_addr(a3);
      if (sub_10000CB78(v22) && (int)sub_10000EFC8(v22) < 31)
      {
        if (sub_1000122E4(v20) && sub_1000122E4(v21))
        {
          v36 = bswap32(v22 & v20);
          if (bswap32(v20) >= v36)
          {
            if (v36 + ~(-1 << -(char)sub_10000EFC8(v22)) >= bswap32(v21))
              return 1;
            sub_100003108(0, (uint64_t)"end address %s is beyond the allowed range of network mask", v37, v38, v39, v40, v41, v42, (uint64_t)a2);
          }
          else
          {
            sub_100003108(0, (uint64_t)"start address %s is not in the subnet", v30, v31, v32, v33, v34, v35, (uint64_t)a1);
          }
        }
        else
        {
          sub_100003108(0, (uint64_t)"start address %s and end address %s must beprivate addresses", v30, v31, v32, v33, v34, v35, (uint64_t)a1);
        }
      }
      else
      {
        sub_100003108(0, (uint64_t)"mask %s is not valid", v23, v24, v25, v26, v27, v28, (uint64_t)a3);
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"start address %s, end address %s or mask %s is invalid", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }
  }
  else
  {
    if (a1)
      v29 = a1;
    else
      v29 = (char *)&unk_10002576D;
    sub_100003108(0, (uint64_t)"missing dhcp parameters: start address %s, end address %s or mask %s", (uint64_t)a3, a4, a5, a6, a7, a8, (uint64_t)v29);
  }
  return 0;
}

uint64_t sub_100004EA8(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
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
  uint64_t v32;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (v12 && (v19 = v12, (*(_BYTE *)(v12 + 508) & 1) != 0))
    {
      v21 = *(_QWORD *)(v12 + 88);
      if (v21)
      {
        sub_100008F00(v21, v19);
        v24 = sub_100003654();
        v22 = 1;
        sub_100003108(1u, (uint64_t)"cleared %zu filters", v25, v26, v27, v28, v29, v30, v24);
        v23 = 2001;
        goto LABEL_9;
      }
      v20 = "service does not exist";
    }
    else
    {
      v32 = (uint64_t)a1;
      v20 = "invalid client for connection %p";
      LOBYTE(v21) = 0;
    }
    sub_100003108(v21, (uint64_t)v20, v13, v14, v15, v16, v17, v18, v32);
    v22 = 0;
    v23 = 2000;
LABEL_9:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v23);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v22;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v32);
  return 0;
}

BOOL sub_100004F9C(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t value;

  value = 0;
  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    v19 = v12 != 0;
    if (v12)
    {
      sub_100014558((_DWORD *)&value + 1, &value, v13, v14, v15, v16, v17, v18);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C18[0], HIDWORD(value));
      v20 = off_100034C28[0];
      v21 = value;
      v22 = v11;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client %p for connection %p", v13, v14, v15, v16, v17, v18, 0);
      v20 = off_100034BF8[0];
      v22 = v11;
      v21 = 2000;
    }
    xpc_dictionary_set_uint64(v22, v20, v21);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v24);
    return 0;
  }
  return v19;
}

BOOL sub_1000050A0(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t uint64;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  int v28;
  uint64_t v30;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    if (sub_10000B564(original, (uint64_t)a1))
    {
      uint64 = xpc_dictionary_get_uint64(original, off_100034C18[0]);
      if ((uint64 - 1024) > 0xFFFFFFFB)
      {
        if (uint64 < 0x3FE)
          v28 = sub_1000145BC(uint64, v19, v20, v21, v22, v23, v24, v25);
        else
          v28 = sub_100014780(uint64, v19, v20, v21, v22, v23, v24, v25);
        v26 = v28 == 0;
        if (v28)
          v27 = 2000;
        else
          v27 = 2001;
        goto LABEL_14;
      }
      sub_100003108(0, (uint64_t)"%d, not a valid state", v20, v21, v22, v23, v24, v25, uint64);
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }
    v26 = 0;
    v27 = 2000;
LABEL_14:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v26;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v30);
  return 0;
}

uint64_t sub_1000051A4(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int v21;
  uint64_t v23;
  char string[8];
  uint64_t v25;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    *(_QWORD *)string = 0;
    v25 = 0;
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      v21 = sub_100014EB4(string);
      v19 = off_100034BF8[0];
      if (!v21)
      {
        xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
        xpc_dictionary_set_string(v11, off_100034C20[0], string);
        v20 = 1;
        goto LABEL_8;
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      v19 = off_100034BF8[0];
    }
    xpc_dictionary_set_uint64(v11, v19, 0x7D0uLL);
    v20 = 0;
LABEL_8:
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v20;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v23);
  return 0;
}

uint64_t sub_1000052D0(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t value;

  LODWORD(value) = 0;
  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      sub_100014D2C((_WORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C30[0], WORD1(value));
      xpc_dictionary_set_uint64(v11, off_100034C38[0], (unsigned __int16)value);
      v19 = 1;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D0uLL);
      v19 = 0;
    }
    sub_1000042FC(a1, v11);
    xpc_release(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v21);
    return 0;
  }
  return v19;
}

uint64_t sub_1000053E4(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t value;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  __int16 v31;
  xpc_object_t v32;
  uint64_t uint64;
  uint64_t v34;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (v12 && (*(_BYTE *)(v12 + 508) & 1) != 0)
    {
      value = xpc_dictionary_get_value(original, off_100034C30[0]);
      if (value
        && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64
        && (v27 = xpc_dictionary_get_uint64(original, off_100034C30[0]), v27 < 0x10000))
      {
        v31 = v27;
        v32 = xpc_dictionary_get_value(original, off_100034C38[0]);
        if (v32)
        {
          if (xpc_get_type(v32) == (xpc_type_t)&_xpc_type_uint64)
          {
            uint64 = xpc_dictionary_get_uint64(original, off_100034C38[0]);
            if (uint64 < 0x10000)
            {
              v19 = sub_100014C90(v31, uint64);
              if ((_DWORD)v19)
                v29 = 2001;
              else
                v29 = 2000;
              goto LABEL_12;
            }
          }
        }
        v28 = "high port is not valid";
      }
      else
      {
        v28 = "low port is not valid";
      }
      sub_100003108(0, (uint64_t)v28, v21, v22, v23, v24, v25, v26, v34);
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }
    v19 = 0;
    v29 = 2000;
LABEL_12:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v29);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v19;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply failed", v5, v6, v7, v8, v9, v10, v34);
  return 0;
}

BOOL sub_100005558(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v21;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    if (sub_10000B564(original, (uint64_t)a1))
    {
      v18 = sub_100014E6C();
      if (v18)
        v19 = 2001;
      else
        v19 = 2000;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
      v18 = 0;
      v19 = 2000;
    }
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v19);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v21);
    return 0;
  }
  return v18;
}

uint64_t sub_100005618(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t uint64;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  xpc_object_t value;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v18 = sub_10000B564(original, (uint64_t)a1);
    if (v18)
    {
      uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      v26 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
          v34 = xpc_dictionary_get_uint64(original, off_100034C78[0]);
        else
          v34 = 0xFFFFFFFFLL;
        sub_10000B844(v18, v26, v34, v29, v30, v31, v32, v33, v36);
        v18 = 1;
        v27 = 2001;
        goto LABEL_13;
      }
      sub_100003108(0, (uint64_t)"invalid iftype %d", v20, v21, v22, v23, v24, v25, uint64);
      v18 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }
    v27 = 2000;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v18;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v36);
  return 0;
}

uint64_t sub_10000576C(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t uint64;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  xpc_object_t value;
  uint64_t v29;
  uint64_t v31;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v18 = sub_10000B564(original, (uint64_t)a1);
    if (v18)
    {
      uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      v26 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        value = xpc_dictionary_get_value(original, netrbClientHostDeviceId[0]);
        if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
          v29 = xpc_dictionary_get_uint64(original, off_100034C78[0]);
        else
          v29 = 0xFFFFFFFFLL;
        sub_10000B938(v18, v26, v29);
        v18 = 1;
        v27 = 2001;
        goto LABEL_13;
      }
      sub_100003108(0, (uint64_t)"invalid iftype %d", v20, v21, v22, v23, v24, v25, uint64);
      v18 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }
    v27 = 2000;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v27);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v18;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply failed", v5, v6, v7, v8, v9, v10, v31);
  return 0;
}

BOOL sub_1000058C0(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
  uint64_t value;

  value = 0;
  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    v19 = v12 != 0;
    if (v12)
    {
      sub_10000BA14(v12, (_DWORD *)&value + 1, &value);
      xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D1uLL);
      xpc_dictionary_set_uint64(v11, off_100034C48[0], HIDWORD(value));
      v20 = off_100034C50[0];
      v21 = value;
      v22 = v11;
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      v20 = off_100034BF8[0];
      v22 = v11;
      v21 = 2000;
    }
    xpc_dictionary_set_uint64(v22, v20, v21);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v24);
    return 0;
  }
  return v19;
}

uint64_t sub_1000059C4(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t uint64;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v38;

  reply = xpc_dictionary_create_reply(original);
  if (reply)
  {
    v11 = reply;
    v12 = sub_10000B564(original, (uint64_t)a1);
    if (v12)
    {
      v19 = v12;
      uint64 = xpc_dictionary_get_uint64(original, off_100034C40[0]);
      v27 = uint64;
      if ((uint64 - 7) > 0xFFFFFFFA)
      {
        if (xpc_dictionary_get_value(original, off_100034C58[0]))
        {
          v35 = xpc_dictionary_get_uint64(original, off_100034C58[0]);
          v28 = sub_10000BA44(v19, v27, v35);
          if ((_DWORD)v28)
            v36 = 2001;
          else
            v36 = 2000;
          goto LABEL_13;
        }
        sub_100003108(0, (uint64_t)"host count is not present", v29, v30, v31, v32, v33, v34, v38);
      }
      else
      {
        sub_100003108(0, (uint64_t)"invalid iftype %d", v21, v22, v23, v24, v25, v26, uint64);
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"invalid client for connection %p", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }
    v28 = 0;
    v36 = 2000;
LABEL_13:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], v36);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return v28;
  }
  sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, v38);
  return 0;
}

uint64_t sub_100005B04(_xpc_connection_s *a1, xpc_object_t original)
{
  xpc_object_t reply;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t uint64;
  int v29;
  BOOL v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const unsigned __int8 *uuid;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  in_addr_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  const char *v66;
  char *v67;
  char *v68;
  const char *v69;
  char *v70;
  int v71;
  xpc_object_t value;
  void *v73;
  const char *v74;
  const unsigned __int8 *v75;
  char v76;
  const char *v77;
  ether_addr *v78;
  __int16 v79;
  const char *v81;
  char *v82;
  const char *v83;
  const char *v84;
  BOOL v85;
  char *string;
  char *v87;
  char v88;
  char v89[16];
  _WORD v90[15];

  *(_OWORD *)v89 = 0u;
  memset(v90, 0, sizeof(v90));
  reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create_reply() failed", v5, v6, v7, v8, v9, v10, (uint64_t)v81);
    return 0;
  }
  v11 = reply;
  v12 = sub_10000B564(original, (uint64_t)a1);
  if (!v12)
  {
    sub_100003108(0, (uint64_t)"invalid client for connection %p", v14, v15, v16, v17, v18, v19, (uint64_t)a1);
    sub_100003108(0, (uint64_t)"%s FAILED", v22, v23, v24, v25, v26, v27, (uint64_t)"netrbCreateInterface");
LABEL_22:
    xpc_dictionary_set_uint64(v11, off_100034BF8[0], 0x7D0uLL);
    sub_1000042FC(a1, v11);
    xpc_release(v11);
    return 0;
  }
  v20 = v12;
  if ((*(_BYTE *)(v12 + 508) & 0xA) == 0)
  {
    v81 = (const char *)a1;
    v21 = "invalid client for connection %p";
    goto LABEL_19;
  }
  if (*(_QWORD *)(v12 + 24))
  {
    v21 = "interface already requested";
LABEL_19:
    v31 = 0;
LABEL_20:
    sub_100003108(v31, (uint64_t)v21, v14, v15, v16, v17, v18, v19, (uint64_t)v81);
LABEL_21:
    sub_100003108(0, (uint64_t)"%s %s[%d] FAILED", v32, v33, v34, v35, v36, v37, (uint64_t)"netrbCreateInterface");
    goto LABEL_22;
  }
  if (*(_QWORD *)(v12 + 88))
  {
    v21 = "service request previously requested";
    goto LABEL_19;
  }
  if ((sub_10000B7C4(v12, v13, v14, v15, v16, v17, v18, v19) & 1) == 0)
  {
    v21 = "unable to create interface";
    goto LABEL_19;
  }
  uint64 = xpc_dictionary_get_uint64(original, off_100034C00[0]);
  v29 = xpc_dictionary_get_uint64(original, off_100034C80[0]);
  if (v29)
    sub_100003108(2u, (uint64_t)"%s: mtu %d", v14, v15, v16, v17, v18, v19, (uint64_t)"netrbCreateInterface");
  if ((uint64 - 202) < 2)
  {
    v87 = 0;
    v30 = 0;
  }
  else if ((_DWORD)uint64 == 204)
  {
    v87 = (char *)xpc_dictionary_get_string(original, off_100034C20[0]);
    if (!v87 || !*v87)
    {
      v21 = "bridged mode requires external interface";
      goto LABEL_19;
    }
    if (!sub_1000062AC(v87))
    {
      v81 = v87;
      v21 = "external interface '%s' is not valid";
      goto LABEL_19;
    }
    if ((*(_BYTE *)(v20 + 508) & 8) != 0)
    {
      v74 = "bridged mode not available to limited clients";
      goto LABEL_76;
    }
    v29 = sub_1000079EC(v87);
    v30 = xpc_dictionary_get_BOOL(original, off_100034BD0[0]);
    sub_100003108(2u, (uint64_t)"%s: ext_if %s mtu %d%s", v59, v60, v61, v62, v63, v64, (uint64_t)"netrbCreateInterface");
  }
  else
  {
    if ((_DWORD)uint64 != 201)
    {
      v81 = (const char *)uint64;
      v21 = "not valid operation mode %u";
      goto LABEL_19;
    }
    v30 = 0;
    v87 = off_100034CB0[0];
  }
  sub_100003108(1u, (uint64_t)"%s %s[%d]", v14, v15, v16, v17, v18, v19, (uint64_t)"netrbCreateInterface");
  uuid = xpc_dictionary_get_uuid(original, off_100034CE0[0]);
  if (!uuid)
  {
    if ((_DWORD)uint64 == 202)
    {
      v81 = sub_10000F150(202);
      v21 = "%s only supported with network identifier";
      goto LABEL_19;
    }
    v85 = v30;
    v58 = xpc_dictionary_get_string(original, off_100034C90[0]);
    v65 = (char *)xpc_dictionary_get_string(original, off_100034C98[0]);
    v66 = xpc_dictionary_get_string(original, off_100034CA0[0]);
    v67 = (char *)v66;
    v84 = v65;
    if ((_DWORD)uint64 == 204)
    {
      if (v58 || v65 || v66)
      {
        v21 = "bridged mode doesn't support subnet options";
        goto LABEL_19;
      }
    }
    else
    {
      v68 = (char *)v58;
      v69 = v58;
      v70 = v67;
      v71 = sub_100004D04(v68, v65, v67, v15, v16, v17, v18, v19);
      v67 = v70;
      v58 = v69;
      uuid = 0;
      if (!v71)
        goto LABEL_21;
    }
    string = v67;
    value = xpc_dictionary_get_value(original, off_100034CC8[0]);
    if (value)
    {
      if ((_DWORD)uint64 != 201)
      {
        v21 = "NAT66 only applies to Internet Sharing mode";
        goto LABEL_19;
      }
      v73 = value;
      if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary)
      {
        v21 = "NAT66 object is not an xpc dictionary";
        goto LABEL_19;
      }
      if (!sub_100004C28(v73, v89, &v88))
        goto LABEL_21;
    }
    v83 = 0;
    goto LABEL_65;
  }
  if ((_DWORD)uint64 != 202)
  {
    v81 = sub_10000F150(uint64);
    v21 = "%s not supported with network identifier";
    goto LABEL_19;
  }
  v40 = (char *)xpc_dictionary_get_string(original, off_100034CE8[0]);
  string = (char *)xpc_dictionary_get_string(original, off_100034CA0[0]);
  if (v40)
  {
    if (!sub_10000CAFC(v40, v41, v42, v43, v44, v45, v46, v47))
    {
      v81 = v40;
      v21 = "bad interface IP address: %s";
      goto LABEL_19;
    }
    v31 = string;
    if (!string)
    {
      v21 = "missing interface network mask";
      goto LABEL_20;
    }
    v48 = inet_addr(string);
    if (!sub_10000CB78(v48))
    {
      v81 = string;
      v21 = "mask %s is not valid";
      goto LABEL_19;
    }
  }
  v49 = (char *)xpc_dictionary_get_string(original, off_100034CF0[0]);
  v85 = v30;
  if (!v49)
  {
    v83 = v40;
    v84 = 0;
    v58 = 0;
LABEL_65:
    v82 = 0;
    goto LABEL_66;
  }
  v57 = v49;
  if (!sub_10000CBC8(v49, v50, v51, v52, v53, v54, v55, v56))
  {
    v81 = v57;
    v21 = "bad interface IPv6 address: %s";
    goto LABEL_19;
  }
  v82 = v57;
  v83 = v40;
  v58 = 0;
  v84 = 0;
LABEL_66:
  if (xpc_dictionary_get_value(original, off_100034BC0[0]) && !xpc_dictionary_get_BOOL(original, off_100034BC0[0]))
  {
    if ((*(_BYTE *)(v20 + 508) & 8) == 0)
    {
      v76 = 0;
      goto LABEL_73;
    }
    v81 = "netrbCreateInterface";
    v74 = "%s: invalid configuration: limited client must allocate mac address";
LABEL_76:
    sub_100003108(0, (uint64_t)v74, v14, v15, v16, v17, v18, v19, (uint64_t)v81);
    xpc_dictionary_set_uint64(v11, off_100034BE8[0], 0x1771uLL);
    goto LABEL_21;
  }
  v75 = xpc_dictionary_get_uuid(original, off_100034BA8[0]);
  if (sub_100015B38(v75, v11))
  {
    v21 = "unable to get MAC address";
    goto LABEL_19;
  }
  v77 = xpc_dictionary_get_string(v11, off_100034BB0[0]);
  v78 = ether_aton(v77);
  v79 = *(_WORD *)&v78->octet[4];
  *(_DWORD *)(v20 + 9) = *(_DWORD *)v78->octet;
  *(_WORD *)(v20 + 13) = v79;
  v76 = 1;
LABEL_73:
  *(_BYTE *)(v20 + 76) = xpc_dictionary_get_BOOL(original, off_100034BC8[0]);
  *(_BYTE *)(v20 + 77) = xpc_dictionary_get_BOOL(original, off_100034BD8[0]);
  *(_BYTE *)(v20 + 78) = xpc_dictionary_get_BOOL(original, off_100034BE0[0]);
  *(_BYTE *)(v20 + 79) = v85;
  *(_BYTE *)(v20 + 8) = v76;
  *(_DWORD *)(v20 + 72) = v29;
  if (sub_10000BB0C(v20))
  {
    v21 = "interface creation failed";
    goto LABEL_19;
  }
  if (v58)
  {
    xpc_dictionary_set_string(v11, off_100034C90[0], v58);
    xpc_dictionary_set_string(v11, off_100034C98[0], v84);
    xpc_dictionary_set_string(v11, off_100034CA0[0], string);
  }
  if (v87)
    xpc_dictionary_set_string(v11, off_100034C20[0], v87);
  if (v89[0])
    xpc_dictionary_set_string(v11, off_100034CD8[0], v89);
  if (uuid)
  {
    xpc_dictionary_set_uuid(v11, off_100034CE0[0], uuid);
    if (v83)
    {
      xpc_dictionary_set_string(v11, off_100034CE8[0], v83);
      xpc_dictionary_set_string(v11, off_100034CA0[0], string);
    }
    if (v82)
      xpc_dictionary_set_string(v11, off_100034CF0[0], v82);
  }
  *(_DWORD *)(v20 + 48) = uint64;
  *(_QWORD *)(v20 + 56) = a1;
  *(_QWORD *)(v20 + 64) = v11;
  if (__CFADD__(dword_1000354D0++, 1))
    sub_100021D4C();
  return 1;
}

BOOL sub_1000062AC(const char *a1)
{
  xpc_object_t v2;
  void *v3;
  size_t count;
  size_t v5;
  const char *string;
  size_t v7;
  size_t v8;
  const char *v9;
  int v10;
  _BOOL8 v11;

  v2 = sub_100020FEC();
  if (!v2)
    return 0;
  v3 = v2;
  count = xpc_array_get_count(v2);
  if (count)
  {
    v5 = count;
    string = xpc_array_get_string(v3, 0);
    if (!strcmp(string, a1))
    {
      v11 = 1;
    }
    else
    {
      v7 = 1;
      do
      {
        v8 = v7;
        if (v5 == v7)
          break;
        v9 = xpc_array_get_string(v3, v7);
        v10 = strcmp(v9, a1);
        v7 = v8 + 1;
      }
      while (v10);
      v11 = v8 < v5;
    }
  }
  else
  {
    v11 = 0;
  }
  xpc_release(v3);
  return v11;
}

BOOL sub_100006358(_xpc_connection_s *a1, void *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v16;
  xpc_object_t v17;
  uint64_t v18;
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
  uint64_t v31;
  const char *v32;
  _QWORD v33[2];
  xpc_object_t xdict;
  _BYTE v35[9];
  uint64_t v36;
  unsigned __int16 v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int16 v40;
  unsigned __int8 v41;
  char v42[46];

  v40 = 0;
  v38 = 0;
  v39 = 0;
  v37 = 0;
  v36 = 0;
  memset(v35, 0, sizeof(v35));
  xdict = 0;
  v4 = 0;
  if (sub_1000065D0((uint64_t)a1, a2, (uint64_t *)&v35[1], &xdict))
  {
    v41 = 0;
    v4 = 0;
    if (sub_100006688(a2, v35, &v40, &v41, &v38, &v37, &v36))
    {
      v11 = *(_QWORD *)&v35[1];
      v12 = *(_QWORD *)(*(_QWORD *)&v35[1] + 88);
      if (!v12 || (v13 = *(_QWORD *)(v12 + 288)) == 0)
      {
        v16 = "port forwarding can't find bridge";
LABEL_14:
        sub_100003108(0, (uint64_t)v16, v5, v6, v7, v8, v9, v10, (uint64_t)v32);
        goto LABEL_15;
      }
      v14 = v41;
      if (v41 == 2)
      {
        v15 = *(_DWORD *)(v13 + 680);
        if ((_DWORD)v38 == v15)
        {
          sub_100003108(0, (uint64_t)"%s internal address invalid ip '%s'", v5, v6, v7, v8, v9, v10, (uint64_t)"netrbAddPortForwardingRule");
LABEL_15:
          v4 = 0;
          goto LABEL_16;
        }
        if ((*(_DWORD *)(v13 + 684) & (v15 ^ v38)) != 0)
        {
          v32 = "netrbAddPortForwardingRule";
          v16 = "%s internal address wrong subnet '%s'";
          goto LABEL_14;
        }
      }
      else
      {
        v33[0] = 0;
        v33[1] = 0;
        if (*(_DWORD *)(v13 + 1128) != 500 || *(_BYTE *)(v13 + 1107) || !*(_BYTE *)(v13 + 1178))
        {
          sub_100003108(0, (uint64_t)"%s IPv6 port forwarding not supported", v5, v6, v7, v8, v9, v10, (uint64_t)"netrbAddPortForwardingRule");
          goto LABEL_15;
        }
        inet_pton(30, (const char *)(v13 + 1132), v33);
        if (v33[0] != v38)
        {
          inet_ntop(30, &v38, v42, 0x2Eu);
          sub_100003108(0, (uint64_t)"%s IPv6 address %s not on prefix %s", v20, v21, v22, v23, v24, v25, (uint64_t)"netrbAddPortForwardingRule");
          goto LABEL_15;
        }
        if (!v39)
        {
          inet_ntop(30, &v38, v42, 0x2Eu);
          sub_100003108(0, (uint64_t)"%s IPv6 address %s can't be the prefix %s", v26, v27, v28, v29, v30, v31, (uint64_t)"netrbAddPortForwardingRule");
          goto LABEL_15;
        }
      }
      v4 = sub_10001CB0C(v11, v35[0], v40, v14, &v38, v37, v9, v10) == 0;
    }
  }
LABEL_16:
  v17 = xdict;
  if (xdict)
  {
    if (v4)
      v18 = 2001;
    else
      v18 = 2000;
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v18);
    sub_1000042FC(a1, v17);
    xpc_release(v17);
  }
  return v4;
}

uint64_t sub_1000065D0(uint64_t a1, xpc_object_t original, uint64_t *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t reply;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  reply = xpc_dictionary_create_reply(original);
  if (!reply)
  {
    sub_100003108(0, (uint64_t)"port forwarding xpc_dictionary_create_reply() failed", v8, v9, v10, v11, v12, v13, v24);
    v22 = 0;
LABEL_8:
    result = 0;
    goto LABEL_9;
  }
  v15 = sub_10000B564(original, a1);
  v22 = v15;
  if (!v15)
  {
    sub_100003108(0, (uint64_t)"port forwarding no client for connection %p", v16, v17, v18, v19, v20, v21, a1);
    goto LABEL_8;
  }
  if (*(_DWORD *)(v15 + 48) != 201)
  {
    sub_100003108(0, (uint64_t)"port forwarding rules available only in shared mode", v16, v17, v18, v19, v20, v21, v24);
    goto LABEL_8;
  }
  result = 1;
LABEL_9:
  *a4 = reply;
  *a3 = v22;
  return result;
}

uint64_t sub_100006688(void *a1, _BYTE *a2, _WORD *a3, _BYTE *a4, void *a5, _WORD *a6, uint64_t *a7)
{
  xpc_object_t value;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t result;
  char uint64;
  char v26;
  __int16 v28;
  __int16 v29;
  const char *string;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  value = xpc_dictionary_get_value(a1, off_100034CF8[0]);
  if (!value || (v20 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary))
  {
    v21 = "port forwarding rule missing/invalid";
LABEL_4:
    sub_100003108(0, (uint64_t)v21, v14, v15, v16, v17, v18, v19, v43);
    v22 = 0;
    goto LABEL_5;
  }
  uint64 = xpc_dictionary_get_uint64(v20, off_100034D20[0]);
  *a4 = uint64;
  if (uint64 != 2 && uint64 != 30)
  {
    v21 = "port forwarding rule invalid address family";
    goto LABEL_4;
  }
  if (a2)
  {
    v26 = xpc_dictionary_get_uint64(v20, off_100034D08[0]);
    *a2 = v26;
    if (v26 != 6 && v26 != 17)
    {
      v21 = "port forwarding rule contains missing/invalid protocol";
      goto LABEL_4;
    }
  }
  if (a3)
  {
    v28 = xpc_dictionary_get_uint64(v20, off_100034D10[0]);
    *a3 = v28;
    if (!v28)
    {
      v21 = "port forwarding rule invalid/missing external port";
      goto LABEL_4;
    }
  }
  if (a6)
  {
    v29 = xpc_dictionary_get_uint64(v20, off_100034D28);
    *a6 = v29;
    if (!v29)
    {
      v21 = "port forwarding rule invalid/missing internal port";
      goto LABEL_4;
    }
  }
  if (a5)
  {
    string = xpc_dictionary_get_string(v20, off_100034D18[0]);
    v22 = (uint64_t)string;
    if (!string)
    {
      sub_100003108(0, (uint64_t)"port forwarding rule missing/invalid internal address", v31, v32, v33, v34, v35, v36, v43);
LABEL_5:
      result = 0;
      if (!a7)
        return result;
      goto LABEL_6;
    }
    if (!inet_pton(*a4, string, a5))
    {
      sub_100003108(0, (uint64_t)"port forwarding rule invalid internal address '%s'", v37, v38, v39, v40, v41, v42, v22);
      goto LABEL_5;
    }
  }
  else
  {
    v22 = 0;
  }
  result = 1;
  if (a7)
LABEL_6:
    *a7 = v22;
  return result;
}

BOOL sub_100006854(_xpc_connection_s *a1, void *a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t xdict;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int16 v15;
  unsigned __int8 v16;

  v15 = 0;
  v14 = 0;
  v13 = 0;
  xdict = 0;
  v4 = 0;
  if (sub_1000065D0((uint64_t)a1, a2, &v14, &xdict))
  {
    v16 = 0;
    v4 = 0;
    if (sub_100006688(a2, &v13, &v15, &v16, 0, 0, 0))
      v4 = sub_10001CDAC(v14, v13, v15, v16, v5, v6, v7, v8) == 0;
  }
  v9 = xdict;
  if (xdict)
  {
    if (v4)
      v10 = 2001;
    else
      v10 = 2000;
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v10);
    sub_1000042FC(a1, v9);
    xpc_release(v9);
  }
  return v4;
}

BOOL sub_100006930(_xpc_connection_s *a1, void *a2)
{
  xpc_object_t v4;
  _BOOL8 v5;
  xpc_object_t v6;
  uint64_t v7;
  xpc_object_t xdict;
  uint64_t v10;
  unsigned __int8 v11;

  xdict = 0;
  v10 = 0;
  if (sub_1000065D0((uint64_t)a1, a2, &v10, &xdict)
    && (v11 = 0, sub_100006688(a2, 0, 0, &v11, 0, 0, 0)))
  {
    v4 = sub_10001CF1C(v10, v11);
    v5 = v4 != 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v6 = xdict;
  if (xdict)
  {
    if (v5)
      v7 = 2001;
    else
      v7 = 2000;
    xpc_dictionary_set_uint64(xdict, off_100034BF8[0], v7);
    if (v4)
      xpc_dictionary_set_value(v6, off_100034D00[0], v4);
    sub_1000042FC(a1, v6);
    xpc_release(v6);
  }
  if (v4)
    xpc_release(v4);
  return v5;
}

uint64_t sub_100006A28(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;

  sub_100003108(1u, (uint64_t)"adding low latency flow descriptor", a3, a4, a5, a6, a7, a8, v11);
  return sub_100006A64(a1, a2, 0);
}

uint64_t sub_100006A64(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  const char *v20;
  xpc_object_t value;
  xpc_object_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  xpc_object_t reply;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  xpc_object_t v35;
  xpc_object_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;

  v6 = sub_10000B564(a2, (uint64_t)a1);
  if (!v6)
  {
    sub_100003108(0, (uint64_t)"invalid client for connection %p", v7, v8, v9, v10, v11, v12, (uint64_t)a1);
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  v13 = *(_QWORD *)(v6 + 88);
  if (!v13)
  {
    sub_100003108(1u, (uint64_t)"requesting client does not have an associated service, finding service from global list.", v7, v8, v9, v10, v11, v12, (uint64_t)v49);
    v13 = qword_100035490;
    if (!qword_100035490)
    {
      v20 = "service is not started";
      goto LABEL_18;
    }
  }
  v53 = 0u;
  v54 = 0u;
  v52 = 0u;
  if ((sub_100001CD0(a2, (uint64_t)&v52, v7, v8, v9, v10, v11, v12) & 1) == 0)
  {
    v20 = "request object failed validation test.";
LABEL_18:
    sub_100003108(0, (uint64_t)v20, v7, v8, v9, v10, v11, v12, (uint64_t)v49);
    goto LABEL_19;
  }
  v51 = 0;
  if (BYTE9(v52) == 4 && (~BYTE8(v52) & 0x14) == 0 && PFQueryGatewayAddrAndPortForDescriptor(&v52, &v51))
  {
    DWORD2(v53) = v51;
    WORD6(v54) = WORD2(v51);
    sub_100003108(1u, (uint64_t)"%s: PFSetGatewayAddrAndPortForDescriptor success", v7, v8, v9, v10, v11, v12, (uint64_t)"netrbModifyLowLatencyFlow");
  }
  else
  {
    sub_100003108(1u, (uint64_t)"%s: deleting local addr and port", v7, v8, v9, v10, v11, v12, (uint64_t)"netrbModifyLowLatencyFlow");
    BYTE8(v52) &= 0xEBu;
  }
  if ((sub_100003AD0(*(_QWORD *)(v13 + 296), (uint64_t)&v52, v14, v15, v16, v17, v18, v19) & 0x80000000) != 0)
  {
    v49 = "netrbModifyLowLatencyFlow";
    v20 = "%s: failed to translate addresses for 464xlat";
    goto LABEL_18;
  }
  LOBYTE(v52) = 2;
  WORD1(v52) = 48;
  DWORD1(v52) = 3;
  value = xpc_dictionary_get_value(a2, netrbClientLowLatencyFlowParam[0]);
  v22 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorDeviceId[0]);
  if (v22 && (v23 = v22, xpc_get_type(v22) == (xpc_type_t)&_xpc_type_uint64))
    v24 = xpc_uint64_get_value(v23);
  else
    v24 = 0xFFFFFFFFLL;
  v37 = xpc_dictionary_get_value(value, netrbClientIfnetTrafficDescriptorConnectionIdleTimeout[0]);
  if (v37 && (v41 = v37, xpc_get_type(v37) == (xpc_type_t)&_xpc_type_uint64))
  {
    v42 = xpc_uint64_get_value(v41);
    sub_100003108(1u, (uint64_t)"setting connection idle timeout %llu", v43, v44, v45, v46, v47, v48, v42);
  }
  else
  {
    v42 = 300;
  }
  v25 = sub_100003660(v13, &v52, v24, v42, a3, v38, v39, v40);
LABEL_20:
  reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    v33 = reply;
    if ((_DWORD)v25)
      v34 = 2001;
    else
      v34 = 2000;
  }
  else
  {
    v34 = 2000;
    do
    {
      sub_100003108(0, (uint64_t)"failed to create xpc reply dictionary.", v27, v28, v29, v30, v31, v32, v50);
      v35 = xpc_dictionary_create_reply(a2);
    }
    while (!v35);
    v33 = v35;
    v25 = 0;
  }
  xpc_dictionary_set_uint64(v33, off_100034BF8[0], v34);
  sub_1000042FC(a1, v33);
  xpc_release(v33);
  return v25;
}

uint64_t sub_100006D2C(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;

  sub_100003108(1u, (uint64_t)"removing low latency flow descriptor", a3, a4, a5, a6, a7, a8, v11);
  return sub_100006A64(a1, a2, 1);
}

void sub_100006D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  void (*v12)(void);
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *i;

  if (*(_DWORD *)(a1 + 16))
    sub_100021DC4();
  v9 = *(_QWORD *)(a1 + 280);
  if (v9)
  {
    v10 = *(_DWORD *)(v9 + 288);
    if (v10 != 101 && (v10 != 103 || (*(_BYTE *)(v9 + 584) & 2) != 0 && *(_DWORD *)(v9 + 20) != 204))
      sub_10001C3D4((_QWORD *)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  v11 = *(_QWORD *)(a1 + 288);
  if (v11)
  {
    v12 = *(void (**)(void))(v11 + 624);
    if (!v12)
      sub_100021D9C();
    v12();
  }
  v13 = *(uint64_t **)(a1 + 280);
  if (v13)
  {
    sub_100006E78(v13, a2, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(a1 + 280) = 0;
  }
  v14 = *(uint64_t **)(a1 + 288);
  if (v14)
  {
    sub_100006E78(v14, a2, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(a1 + 288) = 0;
  }
  v15 = *(uint64_t **)(a1 + 296);
  if (v15)
  {
    sub_100006E78(v15, a2, a3, a4, a5, a6, a7, a8);
    *(_QWORD *)(a1 + 296) = 0;
  }
  v16 = &qword_100035490;
  for (i = (uint64_t *)qword_100035490; i != (uint64_t *)a1; i = (uint64_t *)*i)
    v16 = i;
  *v16 = *(_QWORD *)a1;
  if (!dword_100034EE8)
    sub_100021D74();
  --dword_100034EE8;
  sub_100003108(1u, (uint64_t)"destroying service %s", a3, a4, a5, a6, a7, a8, a1 + 20);
  free((void *)a1);
}

void sub_100006E78(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  void (*v11)(uint64_t *);
  uint64_t *v12;
  uint64_t *i;
  int v14;
  const char *v15;
  const char *v16;

  v8 = *((_DWORD *)a1 + 2);
  if (!v8)
    sub_100021DEC();
  v10 = v8 - 1;
  *((_DWORD *)a1 + 2) = v10;
  if (!v10)
  {
    v11 = (void (*)(uint64_t *))a1[75];
    if (v11)
      v11(a1);
    v12 = &qword_100035498;
    for (i = (uint64_t *)qword_100035498; i != a1; i = (uint64_t *)*i)
      v12 = i;
    *v12 = *a1;
    if (!dword_100034F08)
      sub_100021E14();
    --dword_100034F08;
    v14 = *((_DWORD *)a1 + 4);
    v15 = "external";
    if (v14 != 1)
      v15 = "unknown";
    if (v14)
      v16 = v15;
    else
      v16 = "internal";
    sub_100003108(2u, (uint64_t)"destroying %s interface (%s) devname %s@%d", a3, a4, a5, a6, a7, a8, (uint64_t)v16);
    free(a1);
  }
}

uint64_t sub_100006F80(uint64_t a1, char a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
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
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  if (*(_DWORD *)(a1 + 1264) != 1 || (a2 & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = socket(30, 2, 0);
    if (v11 < 0)
    {
      sub_100003108(0, (uint64_t)"%s: failed to create socket: %m", v12, v13, v14, v15, v16, v17, (uint64_t)"mis_query_nat64_prefix");
      *(_DWORD *)(a1 + 1264) = -1;
      return 1;
    }
    v18 = v11;
    if ((unint64_t)__strlcpy_chk(&v35, a1 + 308, 16, 16) >= 0x10)
    {
      sub_100003108(0, (uint64_t)"%s: failed to copy interface name: %m", v19, v20, v21, v22, v23, v24, (uint64_t)"mis_query_nat64_prefix");
      v10 = 1;
LABEL_13:
      *(_DWORD *)(a1 + 1264) = -1;
LABEL_14:
      close(v18);
      return v10;
    }
    if (ioctl(v18, 0xC06069C1uLL, &v35) < 0)
    {
      sub_100003108(1u, (uint64_t)"%s: interface %s does not have nat64 prefix: %m", v25, v26, v27, v28, v29, v30, (uint64_t)"mis_query_nat64_prefix");
      goto LABEL_12;
    }
    if ((v37 - 13) <= 0xFFFFFFF3)
    {
      sub_100003108(0, (uint64_t)"%s: invalid NAT64 prefix length", v25, v26, v27, v28, v29, v30, (uint64_t)"mis_query_nat64_prefix");
LABEL_12:
      v10 = 2;
      goto LABEL_13;
    }
    *(_DWORD *)(a1 + 1264) = 1;
    if (*(_QWORD *)(a1 + 1244) == (_QWORD)v36
      && *(_QWORD *)(a1 + 1252) == *((_QWORD *)&v36 + 1)
      && *(_DWORD *)(a1 + 1260) == (unint64_t)v37)
    {
      sub_100003108(1u, (uint64_t)"%s: same nat64 prefix", v25, v26, v27, v28, v29, v30, (uint64_t)"mis_query_nat64_prefix");
      if (a3)
      {
        v34 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      *(_OWORD *)(a1 + 1244) = v36;
      *(_DWORD *)(a1 + 1260) = v37;
      if (a3)
      {
        v34 = 1;
LABEL_27:
        *a3 = v34;
      }
    }
    sub_100003108(1u, (uint64_t)"%s: successfully queried the NAT64 prefix of external interface %s", v25, v26, v27, v28, v29, v30, (uint64_t)"mis_query_nat64_prefix");
    v10 = 0;
    goto LABEL_14;
  }
  sub_100003108(0, (uint64_t)"%s: using cached NAT64 prefix", (uint64_t)a3, a4, a5, a6, a7, a8, (uint64_t)"mis_query_nat64_prefix");
  return 0;
}

char *sub_1000071C4(int a1, uint64_t a2, char *__s1, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8, unsigned __int8 *src, __int128 *a10, char *a11, const char *a12, const char *a13, int a14, _OWORD *a15, int a16, int *a17)
{
  unsigned int v17;
  int v18;
  int v20;
  int v21;
  int v22;
  uint64_t v25;
  const char *v26;
  char *v27;
  int v28;
  const char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  _BOOL4 v66;
  char v67;
  char *v68;
  uint64_t *v69;
  uint64_t v70;
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
  uint64_t v82;
  int v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  int v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t *v108;
  const char *v109;
  _QWORD *v110;
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
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t *v131;
  int v132;
  unsigned int v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v142;
  const char *v143;
  char *__s2;
  char *__s2a;
  char *__s2b;
  int v147;
  unsigned int v148;
  int v149;
  BOOL v150;
  _BOOL4 v151;
  char *v152;

  v17 = a1 - 200;
  if ((a1 - 200) >= 5)
  {
    v26 = "incorrect operation mode";
LABEL_8:
    sub_100003108(0, (uint64_t)v26, (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, v142);
    goto LABEL_9;
  }
  v18 = a2 - 300;
  if ((a2 - 300) >= 5)
  {
    v142 = a2;
    v26 = "incorrect bridge type %u";
    goto LABEL_8;
  }
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v25 = dword_1000250C0[v17];
  if ((_DWORD)a5 == 1 && v17 >= 2)
  {
    sub_100003108(0, (uint64_t)"auth device is specific to internet sharing mode instead of %d", (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, dword_1000250C0[v17]);
LABEL_9:
    v27 = 0;
    v28 = 22;
LABEL_10:
    *a17 = v28;
    return v27;
  }
  if ((_DWORD)a5 == 1 && (_DWORD)a2 != 301)
  {
    sub_100003108(0, (uint64_t)"auth device should be configured with no bridge instead of %d", (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, dword_1000250E8[v18]);
    goto LABEL_9;
  }
  if ((_DWORD)a5 == 1)
    v30 = "_auth";
  else
    v30 = a4;
  if ((_DWORD)a5 == 1)
    v31 = 101;
  else
    v31 = dword_1000250D4[v17];
  if (!a15)
    sub_100021E3C();
  if ((*(_DWORD *)a15 - 500) >= 3)
  {
    sub_100003108(0, (uint64_t)"incorrect NAT type %u", (uint64_t)__s1, (uint64_t)a4, a5, a6, a7, (uint64_t)a8, *(unsigned int *)a15);
    goto LABEL_9;
  }
  if (v17 <= 1 && *(_DWORD *)a15 == 501)
  {
    v26 = "no NAT specified for internet sharing mode";
    goto LABEL_8;
  }
  v149 = v31;
  v147 = dword_1000250E8[v18];
  v152 = (char *)v30;
  v150 = (_DWORD)a5 != 1;
  if ((_DWORD)a5 != 1 && !if_nametoindex(a4))
  {
    sub_100003108(0, (uint64_t)"device name is not valid %s", v32, v33, v34, v35, v36, v37, (uint64_t)a4);
    goto LABEL_9;
  }
  if (__s1)
  {
    v38 = *__s1;
    if (*__s1)
    {
      if (v17 != 4 && !strncmp(__s1, off_100034CB0[0], 0x10uLL))
      {
        sub_100003108(2u, (uint64_t)"%s, using any external interface", v39, v40, v41, v42, v43, v44, (uint64_t)v152);
        v38 = 1;
      }
      else
      {
        if (!if_nametoindex(__s1))
        {
          sub_100003108(0, (uint64_t)"%s, can't find external interface %s", v45, v46, v47, v48, v49, v50, (uint64_t)v152);
          goto LABEL_9;
        }
        v38 = 0;
      }
      if ((_DWORD)v25 != 201 && (_DWORD)v25 != 204)
      {
        sub_100003108(0, (uint64_t)"%s, external interface %s is valid only with internet sharing and bridged mode", v45, v46, v47, v48, v49, v50, (uint64_t)v152);
        goto LABEL_9;
      }
    }
  }
  else
  {
    v38 = 0;
  }
  v148 = v38;
  if (v17 <= 1)
  {
    if (v38)
    {
      v51 = qword_100035498;
      if (qword_100035498)
      {
        __s2 = off_100034CB0[0];
        while (*(_DWORD *)(v51 + 16) != 1
             || *(_DWORD *)(v51 + 1128) != 502
             || *(_DWORD *)(v51 + 20) != 201
             || !strncmp((const char *)(v51 + 308), __s2, 0x100uLL))
        {
          v51 = *(_QWORD *)v51;
          if (!v51)
            goto LABEL_56;
        }
        sub_100003108(0, (uint64_t)"VMNet in NAT mode can't be started now due to an active NAT64 InternetSharing session on %s", v52, v53, v54, v55, v56, v57, v51 + 308);
LABEL_94:
        v27 = 0;
        v28 = 16;
        goto LABEL_10;
      }
    }
    else if (__s1)
    {
      if (*(_DWORD *)a15 == 502)
      {
        if (*__s1)
        {
          v58 = qword_100035498;
          if (qword_100035498)
          {
            __s2a = off_100034CB0[0];
            while (*(_DWORD *)(v58 + 16) != 1
                 || *(_DWORD *)(v58 + 20) != 201
                 || strncmp((const char *)(v58 + 308), __s2a, 0x100uLL))
            {
              v58 = *(_QWORD *)v58;
              if (!v58)
                goto LABEL_56;
            }
            sub_100003108(0, (uint64_t)"NAT64 InternetSharing session on %s can't be started now due to active VMNet session", v59, v60, v61, v62, v63, v64, (uint64_t)__s1);
            goto LABEL_94;
          }
        }
      }
    }
  }
LABEL_56:
  v65 = (char *)malloc_type_malloc(0x138uLL, 0x1020040F55D4EC8uLL);
  v27 = v65;
  if (!v65)
  {
    v84 = strerror(12);
    sub_100003108(0, (uint64_t)"unable to create service %s", v85, v86, v87, v88, v89, v90, (uint64_t)v84);
    *a17 = 12;
    return v27;
  }
  v66 = 0;
  *((_QWORD *)v65 + 38) = 0;
  *((_OWORD *)v65 + 17) = 0u;
  *((_OWORD *)v65 + 18) = 0u;
  *((_OWORD *)v65 + 15) = 0u;
  *((_OWORD *)v65 + 16) = 0u;
  *((_OWORD *)v65 + 13) = 0u;
  *((_OWORD *)v65 + 14) = 0u;
  *((_OWORD *)v65 + 11) = 0u;
  *((_OWORD *)v65 + 12) = 0u;
  *((_OWORD *)v65 + 9) = 0u;
  *((_OWORD *)v65 + 10) = 0u;
  *((_OWORD *)v65 + 7) = 0u;
  *((_OWORD *)v65 + 8) = 0u;
  *((_OWORD *)v65 + 5) = 0u;
  *((_OWORD *)v65 + 6) = 0u;
  *((_OWORD *)v65 + 3) = 0u;
  *((_OWORD *)v65 + 4) = 0u;
  *((_OWORD *)v65 + 1) = 0u;
  *((_OWORD *)v65 + 2) = 0u;
  v67 = !v150;
  if (v18 == 1)
    v67 = 1;
  *(_OWORD *)v65 = 0uLL;
  v68 = v152;
  if ((v67 & 1) == 0 && dword_100034D30)
  {
    v68 = v152;
    v66 = sub_1000078A8(v152) == 0;
  }
  v151 = v66;
  v69 = sub_100007994(v68);
  if (v69)
  {
    sub_100006E78(v69, v70, v71, v72, v73, v74, v75, v76);
    sub_100003108(0, (uint64_t)"device name %s is already used", v77, v78, v79, v80, v81, v82, (uint64_t)v68);
    v83 = 17;
LABEL_88:
    *a17 = v83;
    free(v27);
    return 0;
  }
  if (v22 != 1 && !v21)
    v21 = sub_1000079EC(v152);
  v91 = sub_100007B3C(__s1, v149, v25, v148, (uint64_t)a15, v74, v75, v76);
  if (!v91)
  {
    sub_100003108(0, (uint64_t)"no external interface to service %s", v92, v93, v94, v95, v96, v97, (uint64_t)v152);
    goto LABEL_87;
  }
  v98 = (const char *)(v91 + 308);
  __s2b = (char *)v91;
  v99 = *(unsigned __int8 *)(v91 + 1107);
  if (!v151)
  {
    v131 = sub_100007E2C(0, v25, v147, v152, v98, v22, v149, v21, v20, 0, a8, a11, a12, a13, a14, v148, a15, v99 != 0, src,
             a10,
             a16);
    if (v131)
    {
      v108 = v131;
      v110 = 0;
      goto LABEL_84;
    }
LABEL_86:
    sub_100006E78((uint64_t *)__s2b, v101, v102, v103, v104, v105, v106, v107);
    goto LABEL_87;
  }
  v143 = (const char *)(v91 + 308);
  v100 = sub_100007E2C(0, v25, v147, v152, v98, v22, v149, v21, (int)&_mh_execute_header, (unint64_t)&_mh_execute_header >> 32, a8, 0, 0, 0, a14, v148, a15, v99 != 0, src,
           0,
           a16);
  if (!v100)
    goto LABEL_86;
  v108 = v100;
  if (v17 == 4)
    v109 = __s1;
  else
    v109 = v143;
  v110 = sub_10000826C(*((_DWORD *)v100 + 74), a11, a12, a13, v25, v147, v109, a14, v148, a15, __s2b[1107], src, a10, a16);
  if (!v110)
  {
    sub_100006E78(v108, v111, v112, v113, v114, v115, v116, v117);
    sub_100006E78((uint64_t *)__s2b, v118, v119, v120, v121, v122, v123, v124);
    sub_100003108(0, (uint64_t)"no bridge interface to service %s", v125, v126, v127, v128, v129, v130, (uint64_t)v152);
LABEL_87:
    v83 = 6;
    goto LABEL_88;
  }
LABEL_84:
  v132 = dword_100034EEC++;
  *((_DWORD *)v27 + 69) = v132;
  *((_DWORD *)v27 + 4) = 0;
  *((_QWORD *)v27 + 36) = v110;
  *((_QWORD *)v27 + 37) = __s2b;
  *((_QWORD *)v27 + 35) = v108;
  v133 = *((_DWORD *)v108 + 72) - 100;
  if (v133 > 4)
    v134 = "unknown";
  else
    v134 = off_100030E68[v133];
  snprintf(v27 + 20, 0x100uLL, "%s.%s-%d", "com.apple.MobileInternetSharing", v134, v132);
  *(_QWORD *)v27 = qword_100035490;
  qword_100035490 = (uint64_t)v27;
  sub_100003108(1u, (uint64_t)"creating service %s", v135, v136, v137, v138, v139, v140, (uint64_t)(v27 + 20));
  if (__CFADD__(dword_100034EE8++, 1))
    sub_100021E64();
  *a17 = 0;
  return v27;
}

uint64_t sub_1000078A8(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ifaddrs *v9;
  ifaddrs *v10;
  sockaddr *ifa_addr;
  unsigned __int8 *ifa_data;
  uint64_t v14;
  ifaddrs *v15;

  v15 = 0;
  if (!a1 || !*a1)
    sub_100021E8C();
  if (getifaddrs(&v15))
  {
    v2 = *__error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v14);
    v9 = v15;
    if (!v15)
      return v2;
    goto LABEL_13;
  }
  v9 = v15;
  if (v15)
  {
    v10 = v15;
    while (1)
    {
      if (!strncmp(a1, v10->ifa_name, 0x10uLL))
      {
        ifa_addr = v10->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18)
            break;
        }
      }
      v10 = v10->ifa_next;
      if (!v10)
        goto LABEL_12;
    }
    if (ifa_addr->sa_data[4] == 6)
    {
      ifa_data = (unsigned __int8 *)v10->ifa_data;
      if (!ifa_data || *ifa_data != 209)
      {
        v2 = 0;
        if (!v9)
          return v2;
        goto LABEL_13;
      }
    }
  }
LABEL_12:
  v2 = 22;
  if (v9)
LABEL_13:
    freeifaddrs(v9);
  return v2;
}

uint64_t *sub_100007994(char *__s1)
{
  uint64_t *v2;
  int v3;

  v2 = &qword_100035498;
  while (1)
  {
    v2 = (uint64_t *)*v2;
    if (!v2)
      break;
    if (!strncmp(__s1, (const char *)v2 + 28, 0x100uLL))
    {
      v3 = *((_DWORD *)v2 + 2);
      *((_DWORD *)v2 + 2) = v3 + 1;
      if (v3 == -1)
        sub_100021EB4();
      return v2;
    }
  }
  return v2;
}

uint64_t sub_1000079EC(_BYTE *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  __int128 *v30;
  __int128 v31;
  __int128 v32;

  if (!a1)
    sub_100021EDC();
  if (!*a1)
    sub_100021F04();
  v31 = 0u;
  v32 = 0u;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    sub_100003108(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v29);
    goto LABEL_12;
  }
  v9 = v2;
  v31 = 0u;
  v32 = 0u;
  if ((unint64_t)__strlcpy_chk(&v31, a1, 16, 16) >= 0x10)
  {
    sub_100003108(0, (uint64_t)"strlcpy: %m", v10, v11, v12, v13, v14, v15, v29);
    close(v9);
LABEL_12:
    sub_100003108(0, (uint64_t)"could not get mtu for %s, assuming 1500", v16, v17, v18, v19, v20, v21, (uint64_t)a1);
    return 1500;
  }
  v30 = &v31;
  if (ioctl(v9, 0xC0206933uLL) == -1)
    sub_100003108(0, (uint64_t)"SIOCGIFMTU: %m", v22, v23, v24, v25, v26, v27, (uint64_t)&v31);
  if (close(v9))
    sub_100003108(0, (uint64_t)"close: %m", v16, v17, v18, v19, v20, v21, (uint64_t)v30);
  result = v32;
  if ((int)v32 <= 0)
    goto LABEL_12;
  return result;
}

uint64_t sub_100007B3C(char *__s1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  int v12;
  uint64_t v13;
  char v14;
  int v15;
  int v16;
  int v17;
  int v18;

  v8 = a4;
  v9 = a3;
  if (__s1)
  {
    if (*__s1)
      v12 = a4 ^ 1;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_19:
    if (v12 != v8)
      v16 = 102;
    else
      v16 = 100;
    if (byte_100035450)
      v16 = 102;
    if (a2 == 103)
      v17 = 103;
    else
      v17 = v16;
    __asm { BR              X13 }
  }
  v14 = v12 ^ 1 | a4;
  v15 = v12 | a4;
  while (1)
  {
    if ((v14 & 1) == 0 && !strncmp(__s1, (const char *)(v13 + 308), 0x100uLL) && *(_DWORD *)(v13 + 16) != 1)
    {
      sub_100003108(0, (uint64_t)"external interface %s cannot be used", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0;
    }
    if (*(_DWORD *)(v13 + 16) == 1
      && *(_DWORD *)(v13 + 20) == v9
      && (!v15 || v8 && *(_BYTE *)(v13 + 564) || __s1 && !strncmp(__s1, (const char *)(v13 + 308), 0x100uLL)))
    {
      break;
    }
    v13 = *(_QWORD *)v13;
    if (!v13)
      goto LABEL_19;
  }
  v18 = *(_DWORD *)(v13 + 8);
  *(_DWORD *)(v13 + 8) = v18 + 1;
  if (v18 == -1)
    sub_100021F2C();
  sub_100003108(2u, (uint64_t)"found existing %s interface (%s) devname %s@%d mode %s", a3, a4, a5, a6, a7, a8, (uint64_t)"external");
  return v13;
}

_QWORD *sub_100007E2C(int a1, int a2, int a3, const char *a4, const char *a5, int a6, int a7, int a8, int a9, int a10, int *a11, const char *a12, const char *a13, const char *a14, int a15, char a16, _OWORD *a17, char a18, unsigned __int8 *src, __int128 *a20,int a21)
{
  int v21;
  _QWORD *v27;
  _QWORD *v28;
  BOOL v29;
  int v30;
  int v31;
  int v32;
  in_addr_t v33;
  in_addr_t v34;
  in_addr_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v65;
  int v67;
  int v68;

  v21 = a7 - 100;
  if ((a7 - 100) >= 5)
    sub_100021FCC();
  v27 = malloc_type_malloc(0x500uLL, 0x10A004065807024uLL);
  v28 = v27;
  if (v27)
  {
    v68 = v21;
    if (a20
      && (*((_DWORD *)a20 + 8)
       || (*(_QWORD *)a20 == *(_QWORD *)in6addr_any.__u6_addr8
         ? (v29 = *((_QWORD *)a20 + 1) == *(_QWORD *)&in6addr_any.__u6_addr32[2])
         : (v29 = 0),
           !v29)))
    {
      if (a12)
        sub_100021FA4();
      v30 = a1;
      v67 = 1;
    }
    else
    {
      v30 = a1;
      v67 = 0;
    }
    bzero(v27, 0x500uLL);
    *((_DWORD *)v28 + 2) = 1;
    *((_DWORD *)v28 + 4) = v30;
    *((_DWORD *)v28 + 5) = a2;
    *((_DWORD *)v28 + 6) = a3;
    *((_DWORD *)v28 + 72) = a7;
    *((_DWORD *)v28 + 73) = a9;
    *((_DWORD *)v28 + 76) = a10;
    if (v30)
      v31 = 0;
    else
      v31 = a8;
    *((_DWORD *)v28 + 74) = v31;
    snprintf((char *)v28 + 28, 0x100uLL, "%s", a4);
    *((_DWORD *)v28 + 71) = a6;
    if (a11)
    {
      v32 = *a11;
      *((_WORD *)v28 + 322) = *((_WORD *)a11 + 2);
      *((_DWORD *)v28 + 160) = v32;
      *((_BYTE *)v28 + 646) = 1;
    }
    if (a12)
      v33 = inet_addr(a12);
    else
      v33 = 0;
    *((_DWORD *)v28 + 173) = v33;
    if (a13)
      v34 = inet_addr(a13);
    else
      v34 = 0;
    *((_DWORD *)v28 + 174) = v34;
    if (a14)
      v35 = inet_addr(a14);
    else
      v35 = 0;
    *((_DWORD *)v28 + 171) = v35;
    snprintf((char *)v28 + 565, 0x10uLL, "%s", a5);
    *((_BYTE *)v28 + 564) = a16;
    *((_DWORD *)v28 + 146) = a15;
    *((_DWORD *)v28 + 310) = a21;
    if (!a17)
      sub_100021F54();
    v42 = src;
    v43 = a17[1];
    *(_OWORD *)(v28 + 141) = *a17;
    *(_OWORD *)(v28 + 143) = v43;
    v44 = a17[2];
    v45 = a17[3];
    v46 = a17[5];
    *(_OWORD *)(v28 + 149) = a17[4];
    *(_OWORD *)(v28 + 151) = v46;
    *(_OWORD *)(v28 + 145) = v44;
    *(_OWORD *)(v28 + 147) = v45;
    *((_BYTE *)v28 + 1107) = a18;
    if (v67)
    {
      v47 = *a20;
      v48 = a20[1];
      *(_OWORD *)((char *)v28 + 676) = *(__int128 *)((char *)a20 + 28);
      *(_OWORD *)(v28 + 81) = v47;
      *(_OWORD *)(v28 + 83) = v48;
      *((_BYTE *)v28 + 688) = 1;
    }
    if (src)
      uuid_copy((unsigned __int8 *)v28 + 1224, src);
    switch(v68)
    {
      case 0:
        v49 = sub_100010C44((uint64_t)v28, (uint64_t)v42, v36, v37, v38, v39, v40, v41);
        if (v49)
          goto LABEL_39;
        goto LABEL_46;
      case 1:
        v49 = sub_1000167DC((uint64_t)v28);
        if (!v49)
          goto LABEL_46;
        goto LABEL_39;
      case 2:
        goto LABEL_38;
      case 3:
        goto LABEL_45;
      case 4:
        if (a2 == 201)
        {
LABEL_38:
          v49 = sub_100011610((uint64_t)v28);
          if (v49)
          {
LABEL_39:
            v56 = "unknown";
            if (v30 == 1)
              v56 = "external";
            if (v30)
              v57 = v56;
            else
              v57 = "internal";
            strerror(v49);
            sub_100003108(0, (uint64_t)"error creating %s interface for devname %s@%d: %s", v58, v59, v60, v61, v62, v63, (uint64_t)v57);
            free(v28);
            return 0;
          }
        }
        else
        {
LABEL_45:
          v49 = sub_100012BCC((uint64_t)v28);
          if (v49)
            goto LABEL_39;
        }
LABEL_46:
        if (__CFADD__(dword_100034F08++, 1))
          sub_100021F7C();
        *v28 = qword_100035498;
        qword_100035498 = (uint64_t)v28;
        v65 = "external";
        if (v30 != 1)
          v65 = "unknown";
        if (!v30)
          v65 = "internal";
        sub_100003108(2u, (uint64_t)"creating %s interface (%s), %s, %s devname %s@%d, mtu %d, prefixSharing %s", v50, v51, v52, v53, v54, v55, (uint64_t)v65);
        return v28;
      default:
        v49 = 45;
        goto LABEL_39;
    }
  }
  return v28;
}

_QWORD *sub_10000826C(int a1, char *a2, const char *a3, const char *a4, int a5, int a6, const char *a7, int a8, char a9, _OWORD *a10, char a11, unsigned __int8 *src, __int128 *a13, int a14)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int is_null;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  const char *v35;
  const char *v36;
  uint64_t v38;
  char __str[16];
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
  __int128 v55;

  if (a2)
  {
    HIDWORD(v38) = inet_addr(a2);
    LODWORD(v38) = inet_addr(a3);
    v21 = inet_addr(a4);
  }
  else
  {
    v38 = 0;
    v21 = 0;
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)__str = 0u;
  v41 = 0u;
  v22 = qword_100035498;
  if (!qword_100035498)
  {
LABEL_29:
    if (sub_1000193C0(__str))
      return 0;
    else
      return sub_100007E2C(0, a5, a6, __str, a7, 0, 104, a1, 0, 0, 0, a2, a3, a4, a8, a9, a10, a11, src, a13, a14);
  }
  while (1)
  {
    if (*(_DWORD *)(v22 + 16))
      goto LABEL_12;
    if (*(_DWORD *)(v22 + 288) != 104)
      goto LABEL_12;
    if (*(_DWORD *)(v22 + 20) != a5)
      goto LABEL_12;
    if (*(_DWORD *)(v22 + 24) != a6)
      goto LABEL_12;
    if (*(_DWORD *)(v22 + 296) != a1)
      goto LABEL_12;
    if (*(_DWORD *)(v22 + 584) != a8)
      goto LABEL_12;
    v23 = v21;
    v24 = strncmp((const char *)(v22 + 565), a7, 0x10uLL);
    v21 = v23;
    if (v24
      || a2
      && (v38 != __PAIR64__(*(_DWORD *)(v22 + 692), *(_DWORD *)(v22 + 696)) || (_DWORD)v23 != *(_DWORD *)(v22 + 684)))
    {
      goto LABEL_12;
    }
    is_null = uuid_is_null((const unsigned __int8 *)(v22 + 1224));
    if (src)
      break;
    v21 = v23;
    if (is_null)
      goto LABEL_22;
LABEL_12:
    v22 = *(_QWORD *)v22;
    if (!v22)
      goto LABEL_29;
  }
  v21 = v23;
  if (is_null)
    goto LABEL_12;
  v32 = uuid_compare(src, (const unsigned __int8 *)(v22 + 1224));
  v21 = v23;
  if (v32)
    goto LABEL_12;
LABEL_22:
  v33 = *(_DWORD *)(v22 + 8);
  *(_DWORD *)(v22 + 8) = v33 + 1;
  if (v33 == -1)
    sub_100021FF4();
  v34 = *(_DWORD *)(v22 + 16);
  v35 = "external";
  if (v34 != 1)
    v35 = "unknown";
  if (v34)
    v36 = v35;
  else
    v36 = "internal";
  sub_100003108(2u, (uint64_t)"found existing %s interface (%s) devname %s@%d mode %s bridge type %s", v26, v27, v28, v29, v30, v31, (uint64_t)v36);
  return (_QWORD *)v22;
}

void sub_10000857C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  int v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  _xpc_connection_s *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;

  if ((_DWORD)a2 == 36 || *(_DWORD *)(a1 + 16) != 1)
    sub_10002201C();
  v9 = (uint64_t *)qword_1000354A0;
  if (qword_1000354A0)
  {
    v10 = a2;
    v11 = 0;
    do
    {
      while (1)
      {
        v12 = v9;
        v9 = (uint64_t *)*v9;
        v13 = v12[3];
        if (v13)
        {
          if (*(_QWORD *)(v13 + 296) == a1)
            break;
        }
        if (!v9)
          return;
      }
      if (*(_DWORD *)(v13 + 16) != 1)
        sub_100022044();
      if (!v10)
        v11 = sub_100008728(v12[3], (*(_DWORD *)(*(_QWORD *)(v13 + 8) + 508) >> 3) & 1);
      v14 = (void *)v12[2];
      if (v14)
      {
        v15 = (_xpc_connection_s *)v12[1];
        if (v15)
        {
          v16 = (void *)v12[2];
          if (v10 | v11)
          {
            xpc_dictionary_set_uint64(v16, off_100034BF8[0], 0x7D0uLL);
          }
          else
          {
            xpc_dictionary_set_uint64(v16, off_100034BF8[0], 0x7D1uLL);
            xpc_dictionary_set_string(v14, off_100034C10[0], (const char *)(v13 + 20));
            v17 = *((_DWORD *)v12 + 8);
            if (v17 != -1)
              xpc_dictionary_set_fd(v14, off_100034BB8[0], v17);
          }
          sub_1000042FC(v15, v14);
          xpc_release(v14);
        }
      }
      if (v10 | v11)
      {
        sub_100008A7C(v13, a2, a3, a4, a5, a6, a7, a8);
        sub_100006D68(v13, v18, v19, v20, v21, v22, v23, v24);
      }
      v25 = (uint64_t *)qword_1000354A0;
      if ((uint64_t *)qword_1000354A0 == v12)
      {
        v26 = &qword_1000354A0;
      }
      else
      {
        do
        {
          v26 = v25;
          v25 = (uint64_t *)*v25;
        }
        while (v25 != v12);
      }
      *v26 = *v12;
      free(v12);
      --dword_100035488;
    }
    while (v9);
  }
}

uint64_t sub_100008728(uint64_t a1, int a2)
{
  BOOL v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t (*v10)(uint64_t);
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
  uint64_t (*v25)(uint64_t, uint64_t, _QWORD);
  uint64_t (*v26)(uint64_t, _QWORD, uint64_t);
  char v27;
  int v28;
  BOOL v29;
  int v31;
  int v32;
  int v33;
  int *v34;
  uint64_t v36;
  char v37;
  xpc_object_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  if (byte_100035481)
    goto LABEL_2;
  v5 = *(_QWORD *)(a1 + 296);
  v6 = *(_DWORD *)(v5 + 1128);
  if (v6 == 502)
    goto LABEL_10;
  if (v6 != 500)
  {
LABEL_2:
    v4 = 0;
    goto LABEL_11;
  }
  if (*(_BYTE *)(v5 + 1107))
  {
    if (!*(_BYTE *)(v5 + 704))
    {
      if (*(_BYTE *)(v5 + 564))
        sub_1000220BC();
      goto LABEL_2;
    }
    goto LABEL_10;
  }
  if (*(_BYTE *)(v5 + 564))
  {
LABEL_10:
    v4 = 1;
    goto LABEL_11;
  }
  v4 = *(_BYTE *)(v5 + 1105) != 0;
LABEL_11:
  v7 = *(_DWORD *)(*(_QWORD *)(a1 + 280) + 288);
  if (*(_QWORD *)(a1 + 288))
    v8 = *(_QWORD *)(a1 + 288);
  else
    v8 = *(_QWORD *)(a1 + 280);
  v9 = *(unsigned __int8 *)(v8 + 700);
  if (*(_DWORD *)(v8 + 288) != 104)
    goto LABEL_21;
  v10 = *(uint64_t (**)(uint64_t))(v8 + 616);
  if (!v10)
    sub_10002206C();
  v17 = v10(v8);
  if (!(_DWORD)v17)
  {
    if (a2)
    {
      v18 = *(_QWORD *)(a1 + 280);
      if (*(_BYTE *)(v18 + 646))
      {
        if ((sub_100019468(*(_QWORD *)(a1 + 288) + 308, v18 + 308, (int *)(v18 + 640), 0) & 1) != 0)
        {
          sub_100003108(1u, (uint64_t)"%s: successfully set the host filter for bridge %s, interface %s", v19, v20, v21, v22, v23, v24, (uint64_t)"mis_svc_start_internal_interface");
          goto LABEL_21;
        }
        sub_100003108(0, (uint64_t)"%s: failed to set host filter for bridge %s, interface %s.", v19, v20, v21, v22, v23, v24, (uint64_t)"mis_svc_start_internal_interface");
      }
      else
      {
        sub_100003108(0, (uint64_t)"%s: mac address is unknown, unable to provision host filter for limited mode", v11, v12, v13, v14, v15, v16, (uint64_t)"mis_svc_start_internal_interface");
      }
      v17 = 0;
      *__error() = 22;
      goto LABEL_37;
    }
LABEL_21:
    v25 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v8 + 592);
    if (!v25)
      sub_100022094();
    v17 = v25(a1 + 20, v8, *(_QWORD *)(a1 + 296));
    if (!(_DWORD)v17)
    {
      if ((v7 | 2) == 0x67 && ((*(_BYTE *)(v8 + 584) & 2) == 0 || *(_DWORD *)(v8 + 20) == 204)
        || (v17 = sub_10001AE28((_QWORD *)a1), !(_DWORD)v17))
      {
        v26 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v8 + 608);
        v27 = !v4;
        if (!v26)
          v27 = 1;
        if ((v27 & 1) != 0 || (v17 = v26(a1 + 20, *(_QWORD *)(a1 + 296), v8), !(_DWORD)v17))
        {
          if ((v7 | 2) != 0x67
            && !*(_BYTE *)(v8 + 700)
            && ((v36 = *(_QWORD *)(a1 + 296), *(_DWORD *)(v36 + 680)) ? (v37 = 1) : (v37 = v4),
                ((v37 & 1) != 0 || *(_BYTE *)(v36 + 564))
             && (v38 = xpc_array_create(0, 0),
                 xpc_array_set_string(v38, 0xFFFFFFFFFFFFFFFFLL, (const char *)(v8 + 308)),
                 v17 = sub_100021200(*(_QWORD *)(a1 + 296), v38, v39, v40, v41, v42, v43, v44),
                 xpc_release(v38),
                 (_DWORD)v17)))
          {
            sub_100003108(0, (uint64_t)"dns_proxy_insert_interfaces failed %d", v45, v46, v47, v48, v49, v50, v17);
          }
          else
          {
            *(_DWORD *)(a1 + 16) = 2;
            v17 = 0;
            *(_QWORD *)(a1 + 304) = mach_continuous_time();
          }
        }
      }
    }
  }
LABEL_37:
  v28 = *(_DWORD *)(v8 + 288);
  if (v9 || v28 == 101 || (*(_BYTE *)(v8 + 700) ? (v29 = (_DWORD)v17 == 0) : (v29 = 1), v29))
  {
    if (v28 == 101 || (_DWORD)v17 != 0)
      return v17;
    if (*(_BYTE *)(v8 + 700))
      return v17;
    v31 = *(_DWORD *)(v8 + 20);
    if ((v31 | 2) != 0xCB)
      return v17;
    v32 = 1;
    *(_BYTE *)(v8 + 700) = 1;
    if (v31 != 201)
    {
      if (v31 != 203)
        return v17;
      goto LABEL_58;
    }
LABEL_60:
    v34 = &dword_1000354D4;
    goto LABEL_61;
  }
  v33 = *(_DWORD *)(v8 + 20);
  if ((v33 | 2) != 0xCB)
    return v17;
  *(_BYTE *)(v8 + 700) = 0;
  if (v33 == 201)
  {
    v32 = -1;
    goto LABEL_60;
  }
  if (v33 == 203)
  {
    v32 = -1;
LABEL_58:
    v34 = &dword_1000354D8;
LABEL_61:
    *v34 += v32;
  }
  return v17;
}

uint64_t sub_100008A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  const char *v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t result;
  _QWORD v19[6];
  mach_timebase_info info;

  if (*(_DWORD *)(a1 + 16) == 2 && (v9 = *(_QWORD *)(a1 + 280)) != 0 && *(_QWORD *)(a1 + 304))
  {
    if (*(_DWORD *)(v9 + 284) < 2u)
      goto LABEL_10;
    v10 = mach_continuous_time();
    v11 = *(_QWORD *)(a1 + 304);
    v12 = v10 - v11;
    if (v10 < v11)
      sub_1000220E4();
    info = 0;
    if (mach_timebase_info(&info))
    {
      v15 = "%s: failed to retrieve time base error(%d)";
    }
    else
    {
      LODWORD(v13) = info.numer;
      LODWORD(v14) = info.denom;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 0x40000000;
      v19[2] = sub_10000F37C;
      v19[3] = &unk_100030E08;
      v19[4] = a1;
      v19[5] = (unint64_t)((double)v13 * 0.000000001 / (double)v14 * (double)v12);
      analytics_send_event_lazy("com.apple.MobileInternetSharing.svc.usage", v19);
      v15 = "%s: %s: iftype %d, duration %qu seconds";
    }
    v16 = 0;
  }
  else
  {
    v15 = "%s: service not started, ignoring event";
    v16 = 1;
  }
  sub_100003108(v16, (uint64_t)v15, a3, a4, a5, a6, a7, a8, (uint64_t)"mis_send_svc_usage_event");
LABEL_10:
  *(_DWORD *)(a1 + 16) = 0;
  v17 = *(_QWORD *)(a1 + 8);
  if (!v17)
    return sub_100003108(0, (uint64_t)"%s (%s) has been stopped", a3, a4, a5, a6, a7, a8, a1 + 20);
  result = sub_100003108(0, (uint64_t)"%s: %s (%s) has been stopped", a3, a4, a5, a6, a7, a8, v17 + 356);
  *(_QWORD *)(*(_QWORD *)(a1 + 8) + 88) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t sub_100008C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v11;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  const char *v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;

  if (*(_QWORD *)(a2 + 88) || *(_QWORD *)(a1 + 8))
    return 16;
  v11 = *(_DWORD *)(a1 + 16);
  if (v11)
  {
    if (v11 == 1)
      return 0;
    else
      return 37;
  }
  v48 = 0;
  v13 = *(_QWORD *)(a1 + 280);
  v14 = *(_DWORD *)(v13 + 288);
  if (v14 != 103)
  {
    v26 = *(_DWORD *)(v13 + 584);
    if (v14 == 101)
      sub_100003108(1u, (uint64_t)"checking for AUTH service availability", a3, a4, a5, a6, a7, a8, v47);
    v27 = sub_100014518(v14 == 101, v26, a3, a4, a5, a6, a7, a8);
    v28 = v27;
    if (v27)
    {
      v29 = strerror(v27);
      sub_100003108(1u, (uint64_t)"service not available: %s", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
    }
    v48 = v28;
    if ((*(_BYTE *)(a2 + 508) & 2) != 0)
    {
      v36 = *(_QWORD *)(a1 + 296);
      if (v28)
        v37 = (char *)(v36 + 308) == netrbClientAnyExternal[0];
      else
        v37 = 0;
      if (v37)
      {
        sub_100003108(1u, (uint64_t)"%s: starting vmnet with ext_if %s but no cellular", v15, v16, v17, v18, v19, v20, (uint64_t)"mis_svc_start_internal");
      }
      else if (v28 && *(_DWORD *)(v36 + 288) == 100)
      {
        v38 = "%s: failed to get available service for external interface %s";
        goto LABEL_37;
      }
    }
    else if (v28 && *(_DWORD *)(*(_QWORD *)(a1 + 280) + 288) == 102)
    {
      goto LABEL_43;
    }
  }
  if (*(_DWORD *)(*(_QWORD *)(a1 + 280) + 288) != 101 || (sub_100014808(&v48) & 1) != 0)
  {
    v21 = *(_QWORD *)(a1 + 288);
    if (!v21
      || (v48 = sub_1000182C0((char *)(v21 + 308), *(_DWORD *)(v21 + 20), *(_DWORD *)(v21 + 24), *(unsigned int *)(v21 + 584), (char *)(v21 + 565), (*(_DWORD *)(v21 + 1240) >> 1) & 1)) == 0)
    {
      v23 = *(_QWORD *)(a1 + 296);
      if (!v23 || (v24 = *(uint64_t (**)(uint64_t))(v23 + 592)) == 0)
        sub_10002210C();
      v25 = v24(a1 + 20);
      v48 = v25;
      if ((_DWORD)v25)
      {
        if ((_DWORD)v25 == 36 || (_DWORD)v25 == 62)
          *(_DWORD *)(a1 + 16) = 1;
        else
          sub_100014534(v25, v22, v15, v16, v17, v18, v19, v20);
      }
      else
      {
        v48 = sub_100008728(a1, (*(_DWORD *)(a2 + 508) >> 3) & 1);
      }
    }
    goto LABEL_43;
  }
  if (!v48)
  {
    v38 = "%s: authentication already complete";
    v39 = 1;
    goto LABEL_42;
  }
  v38 = "%s: authentication cannot be started";
LABEL_37:
  v39 = 0;
LABEL_42:
  sub_100003108(v39, (uint64_t)v38, v15, v16, v17, v18, v19, v20, (uint64_t)"mis_svc_start_internal");
LABEL_43:
  v9 = v48;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 280) + 288) != 103)
  {
    sub_100014844(v48, v22, v15, v16, v17, v18, v19, v20);
    v9 = v48;
  }
  if ((_DWORD)v9)
  {
    if ((_DWORD)v9 != 36)
    {
      sub_100008A7C(a1, v22, v15, v16, v17, v18, v19, v20);
      sub_100014844(v9, v40, v41, v42, v43, v44, v45, v46);
      return v9;
    }
    if (*(_DWORD *)(a1 + 16) != 1)
      sub_100022184();
  }
  if (*(_QWORD *)(a1 + 8))
    sub_10002215C();
  *(_QWORD *)(a1 + 8) = a2;
  if (*(_QWORD *)(a2 + 88))
    sub_100022134();
  *(_QWORD *)(a2 + 88) = a1;
  sub_100003108(0, (uint64_t)"%s: %s has been started", v15, v16, v17, v18, v19, v20, a2 + 356);
  return v9;
}

void sub_100008F00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_100008F30(a2);
  sub_100008FA4(a1, a2, v4, v5, v6, v7, v8, v9);
}

_QWORD *sub_100008F30(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  _QWORD *result;
  _QWORD *v5;
  uint64_t v6;
  signed int v7;

  for (i = 0; i != 7; ++i)
  {
    v3 = a1 + 8 * i;
    result = *(_QWORD **)(v3 + 424);
    if (result)
    {
      v5 = (_QWORD *)(v3 + 424);
      do
      {
        *v5 = result[2];
        free(result);
        result = (_QWORD *)*v5;
      }
      while (*v5);
    }
    v6 = a1 + 4 * i;
    v7 = *(_DWORD *)(v6 + 480);
    *(_DWORD *)(v6 + 480) = 0;
    if (v7 >= 1)
      result = (_QWORD *)sub_100014DF0(i, v7);
  }
  return result;
}

void sub_100008FA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

  if (*(_QWORD *)(a2 + 88))
  {
    if (*(_QWORD *)(a1 + 8))
    {
      sub_100008A7C(a1, a2, a3, a4, a5, a6, a7, a8);
      sub_1000041F0(a1, v9, v10, v11, v12, v13, v14, v15);
      sub_100006D68(a1, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

uint64_t sub_100008FF0()
{
  uint64_t result;
  const char *notify_key;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (dword_100034D44 != -1)
    return 0;
  notify_key = (const char *)nwi_state_get_notify_key();
  v2 = notify_register_dispatch(notify_key, &dword_100034D44, (dispatch_queue_t)qword_100035470, &stru_100030DC8);
  if (!(_DWORD)v2)
  {
    sub_10000907C(v2, v3, v4, v5, v6, v7, v8, v9, v10);
    sub_10001D204(1u);
    sub_10001D2F4(1u);
    return 0;
  }
  sub_100003108(0, (uint64_t)"notify_register_dispatch() for NWI key failed", v4, v5, v6, v7, v8, v9, v10);
  result = 0xFFFFFFFFLL;
  dword_100034D44 = -1;
  return result;
}

uint64_t sub_10000907C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  int v10;
  uint64_t i;
  uint64_t j;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  const char *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v9 = dword_1000354B8;
  v10 = dword_1000354BC;
  v48 = 0;
  if (dword_100034D44 == -1)
  {
    v20 = "nwi notifications turned off";
    return sub_100003108(2u, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
  }
  v47 = nwi_state_copy();
  if (!v47)
  {
    v20 = "nwi_state_copy returned no state";
    return sub_100003108(2u, (uint64_t)v20, a3, a4, a5, a6, a7, a8, a9);
  }
  sub_100003108(2u, (uint64_t)"%s: resetting nwi_active in v4 and v6 nwi lists", a3, a4, a5, a6, a7, a8, (uint64_t)"nwi_change_process");
  for (i = qword_1000354A8; i; i = *(_QWORD *)i)
  {
    *(_WORD *)(i + 40) = *(unsigned __int8 *)(i + 41);
    *(_DWORD *)(i + 28) = -1;
  }
  for (j = qword_1000354B0; j; j = *(_QWORD *)j)
  {
    *(_WORD *)(j + 40) = *(unsigned __int8 *)(j + 41);
    *(_DWORD *)(j + 28) = -1;
  }
  dword_1000354B8 = 0;
  dword_1000354BC = 0;
  result = sub_10000F3DC(&v47, 2, (_DWORD *)&v48 + 1);
  if (v47)
  {
    v14 = result;
    result = sub_10000F3DC(&v47, 30, &v48);
    v15 = v47;
    if (v47)
    {
      if (v9 == dword_1000354B8)
        v16 = v14;
      else
        v16 = 1;
      if (v10 == dword_1000354BC)
        v17 = result;
      else
        v17 = 1;
      v18 = qword_100035498;
      if ((v16 | v17) == 1 && qword_100035498 != 0)
      {
        while (*(_DWORD *)(v18 + 16) != 1 || !*(_BYTE *)(v18 + 564))
        {
          v18 = *(_QWORD *)v18;
          if (!v18)
            return nwi_state_release(v15);
        }
        v21 = HIDWORD(v48);
        if (SHIDWORD(v48) >= (int)v48)
          v21 = v48;
        if (!v21)
          v21 = 1500;
        *(_DWORD *)(v18 + 296) = v21;
        *(_DWORD *)(v18 + 300) = v21 - 40;
        if (v16)
        {
          sub_100019BE8((char *)(v18 + 308), 0, 0, v21 - 40);
          v27 = qword_1000354A8;
          if (qword_1000354A8)
          {
            while (!*(_BYTE *)(v27 + 40) || *(_BYTE *)(v27 + 41))
            {
              v27 = *(_QWORD *)v27;
              if (!v27)
                goto LABEL_38;
            }
            sub_10001C954((char *)(v18 + 308), 1, 0, v22, v23, v24, v25, v26, v46);
          }
        }
LABEL_38:
        if (byte_100035481)
          v28 = 0;
        else
          v28 = v17;
        if (v28 == 1)
        {
          v29 = (uint64_t)sub_10001A6F8((char *)(v18 + 308), *(_DWORD *)(v18 + 300));
          v37 = qword_1000354B0;
          if (qword_1000354B0)
          {
            while (!*(_BYTE *)(v37 + 40) || *(_BYTE *)(v37 + 41))
            {
              v37 = *(_QWORD *)v37;
              if (!v37)
                goto LABEL_48;
            }
            v29 = sub_10001C954((char *)(v18 + 308), 0, 1, v32, v33, v34, v35, v36, v46);
          }
LABEL_48:
          v38 = sub_10001FB48(v29, v30, v31, v32, v33, v34, v35, v36);
          if (v38)
          {
            v39 = strerror(v38);
            sub_100003108(0, (uint64_t)"unable to start rtadvd: %s", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
          }
        }
      }
      return nwi_state_release(v15);
    }
  }
  return result;
}

uint64_t sub_100009320()
{
  uint64_t result;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;

  result = dword_100034D44;
  if (dword_100034D44 != -1)
  {
    notify_cancel(dword_100034D44);
    dword_100034D44 = -1;
    v1 = (uint64_t *)qword_1000354A8;
    if (qword_1000354A8)
    {
      do
      {
        v2 = (uint64_t *)qword_1000354A8;
        if ((uint64_t *)qword_1000354A8 == v1)
        {
          v3 = &qword_1000354A8;
        }
        else
        {
          do
          {
            v3 = v2;
            v2 = (uint64_t *)*v2;
          }
          while (v2 != v1);
        }
        v4 = (uint64_t *)*v1;
        *v3 = *v1;
        free(v1);
        if (!dword_100034EF0)
          sub_1000221D4();
        --dword_100034EF0;
        v1 = v4;
      }
      while (v4);
    }
    v5 = (uint64_t *)qword_1000354B0;
    if (qword_1000354B0)
    {
      do
      {
        v6 = (uint64_t *)qword_1000354B0;
        if ((uint64_t *)qword_1000354B0 == v5)
        {
          v7 = &qword_1000354B0;
        }
        else
        {
          do
          {
            v7 = v6;
            v6 = (uint64_t *)*v6;
          }
          while (v6 != v5);
        }
        v8 = (uint64_t *)*v5;
        *v7 = *v5;
        free(v5);
        if (!dword_100034EF4)
          sub_1000221AC();
        --dword_100034EF4;
        v5 = v8;
      }
      while (v8);
    }
    sub_10001D204(0);
    result = sub_10001D2F4(0);
  }
  dword_1000354B8 = 0;
  dword_1000354BC = 0;
  return result;
}

uint64_t sub_100009444(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SCDynamicStoreRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFArray *Mutable;
  const __CFString *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  CFStringRef NetworkInterfaceEntity;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFStringRef v33;
  CFStringRef v34;
  CFStringRef v35;
  int v36;
  int *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  const __SCDynamicStore *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  SCDynamicStoreContext context;

  if (*(_DWORD *)(a1 + 16) != 1)
    sub_100022274();
  if (*(_DWORD *)(a1 + 20) != 201)
    sub_10002224C();
  if (!*(_BYTE *)(a1 + 308))
    sub_1000221FC();
  if (*(_BYTE *)(a1 + 564))
    sub_100022224();
  if (*(_BYTE *)(a1 + 1107))
  {
    if (*(_DWORD *)(a1 + 288) != 102)
    {
      v2 = sub_100009730(a1);
      if ((_DWORD)v2)
      {
        v9 = v2;
        sub_100003108(0, (uint64_t)"unable to listen to IPv6 prefix events", v3, v4, v5, v6, v7, v8, v68);
        return v9;
      }
    }
  }
  if (*(_QWORD *)(a1 + 1112))
    return 0;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = (void *)a1;
  v10 = SCDynamicStoreCreate(kCFAllocatorDefault, CFSTR("com.apple.MobileInternetSharing"), (SCDynamicStoreCallBack)sub_100010244, &context);
  *(_QWORD *)(a1 + 1112) = v10;
  if (!v10)
  {
    v37 = __error();
    strerror(*v37);
    sub_100003108(0, (uint64_t)"%s, unable to create dynamic store handle: %s", v38, v39, v40, v41, v42, v43, a1 + 308);
    Mutable = 0;
LABEL_27:
    v9 = 12;
    goto LABEL_28;
  }
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (!Mutable)
  {
    sub_100003108(0, (uint64_t)"%s, unable to create mutable array for notify keys", v11, v12, v13, v14, v15, v16, a1 + 308);
    goto LABEL_27;
  }
  v18 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a1 + 308), 0x600u);
  if (!v18)
  {
    sub_100003108(0, (uint64_t)"CFStringCreateWithCString() failed", v19, v20, v21, v22, v23, v24, v68);
    goto LABEL_27;
  }
  v25 = v18;
  NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v18, kSCEntNetIPv4);
  if (!NetworkInterfaceEntity)
  {
    v50 = "%s, failed to create key kSCEntNetIPv4";
LABEL_26:
    sub_100003108(0, (uint64_t)v50, v27, v28, v29, v30, v31, v32, a1 + 308);
    CFRelease(v25);
    goto LABEL_27;
  }
  v33 = NetworkInterfaceEntity;
  CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
  CFRelease(v33);
  if (*(_DWORD *)(a1 + 1128) != 500 || *(_DWORD *)(a1 + 288) != 102)
    goto LABEL_19;
  v34 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v25, kSCEntNetIPv6);
  if (!v34)
  {
    v50 = "%s, failed to create key kSCEntNetIPv6";
    goto LABEL_26;
  }
  v35 = v34;
  CFArrayAppendValue(Mutable, v34);
  CFRelease(v35);
LABEL_19:
  CFRelease(v25);
  SCDynamicStoreSetNotificationKeys(*(SCDynamicStoreRef *)(a1 + 1112), Mutable, 0);
  v36 = SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(a1 + 1112), (dispatch_queue_t)qword_100035470);
  if (v36)
  {
    sub_100010244(v36, Mutable, a1);
    CFRelease(Mutable);
    return 0;
  }
  v60 = SCError();
  v61 = SCErrorString(v60);
  sub_100003108(0, (uint64_t)"SCDynamicStoreSetDispatchQueue() failed: %s", v62, v63, v64, v65, v66, v67, (uint64_t)v61);
  v9 = 22;
LABEL_28:
  v51 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v51)
  {
    SCDynamicStoreSetDispatchQueue(v51, 0);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(_QWORD *)(a1 + 1112) = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  sub_100003108(0, (uint64_t)"unable to set dynamic store notification", v44, v45, v46, v47, v48, v49, v69);
  sub_1000099C8(a1, v52, v53, v54, v55, v56, v57, v58);
  return v9;
}

uint64_t sub_100009730(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
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
  const char *v31;
  NSObject *v32;
  uint64_t *v34;
  _QWORD v35[4];
  int v36;
  _QWORD handler[5];
  int v38;
  uint64_t v39;
  int v40;
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
  uint64_t v53;

  v38 = 1;
  if (*(_DWORD *)(a1 + 16) != 1)
    sub_1000222C4();
  if (!*(_BYTE *)(a1 + 1107))
    sub_10002229C();
  if (*(_QWORD *)(a1 + 1120))
    return 0;
  v40 = 0;
  v39 = 0;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0;
  v3 = socket(32, 3, 1);
  v10 = v3;
  if (v3 == -1)
  {
    v31 = "socket() failed";
  }
  else
  {
    v39 = 0x100000001;
    v40 = 7;
    v34 = &v39;
    if (ioctl(v3, 0x800C6502uLL) == -1)
    {
      v31 = "ioctl(, SIOCSKEVFILT,) failed\n";
    }
    else
    {
      v34 = (uint64_t *)&v38;
      if (ioctl(v10, 0x8004667EuLL) != -1)
      {
        v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v10, 0, (dispatch_queue_t)qword_100035470);
        *(_QWORD *)(a1 + 1120) = v11;
        if (v11)
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 0x40000000;
          handler[2] = sub_10000F848;
          handler[3] = &unk_100030E28;
          handler[4] = a1;
          dispatch_source_set_event_handler(v11, handler);
          v18 = *(NSObject **)(a1 + 1120);
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 0x40000000;
          v35[2] = sub_10000FA84;
          v35[3] = &unk_100030E48;
          v36 = v10;
          dispatch_source_set_cancel_handler(v18, v35);
          dispatch_resume(*(dispatch_object_t *)(a1 + 1120));
          v53 = 0;
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
          v2 = sub_10000FA8C(a1, (uint64_t)&v41, v19, v20, v21, v22, v23, v24);
          if (!(_DWORD)v2)
          {
            sub_100009AC8(a1, (unsigned __int8 *)&v41, v25, v26, v27, v28, v29, v30);
            return v2;
          }
          sub_100003108(0, (uint64_t)"failed to get IPv6 configuration for %s", v25, v26, v27, v28, v29, v30, a1 + 308);
        }
        else
        {
          sub_100003108(0, (uint64_t)"dispatch_source_create() failed", v12, v13, v14, v15, v16, v17, (uint64_t)&v38);
          v2 = 12;
        }
        goto LABEL_15;
      }
      v31 = "ioctl(, FIONBIO,) failed";
    }
  }
  sub_100003108(0, (uint64_t)v31, v4, v5, v6, v7, v8, v9, (uint64_t)v34);
  v2 = *__error();
LABEL_15:
  v32 = *(NSObject **)(a1 + 1120);
  if (v32)
  {
    dispatch_source_cancel(v32);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(_QWORD *)(a1 + 1120) = 0;
  }
  if (v10 != -1)
    close(v10);
  return v2;
}

uint64_t sub_1000099C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __SCDynamicStore *v9;
  NSObject *v10;
  _OWORD v12[12];
  uint64_t v13;

  if (*(_DWORD *)(a1 + 16) != 1)
    sub_1000222EC();
  if (*(_BYTE *)(a1 + 1107))
  {
    if (*(_BYTE *)(a1 + 704))
    {
      v13 = 0;
      memset(v12, 0, sizeof(v12));
      sub_100009AC8(a1, (unsigned __int8 *)v12, a3, a4, a5, a6, a7, a8);
    }
  }
  else
  {
    sub_10000A178(a1, (uint64_t)&in6addr_any, a3, a4, a5, a6, a7, a8, *(uint64_t *)&v12[0]);
  }
  if (*(_DWORD *)(a1 + 680))
    sub_10000A438(a1, 0, 0, a4, a5, a6, a7, a8);
  v9 = *(const __SCDynamicStore **)(a1 + 1112);
  if (v9)
  {
    SCDynamicStoreSetDispatchQueue(v9, 0);
    CFRelease(*(CFTypeRef *)(a1 + 1112));
    *(_QWORD *)(a1 + 1112) = 0;
  }
  v10 = *(NSObject **)(a1 + 1120);
  if (v10)
  {
    dispatch_source_cancel(v10);
    dispatch_release(*(dispatch_object_t *)(a1 + 1120));
    *(_QWORD *)(a1 + 1120) = 0;
  }
  return 0;
}

void sub_100009AC8(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *v10;
  int v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  xpc_object_t v48;
  uint64_t i;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  char v171[46];
  char v172[46];

  if (!*(_BYTE *)(a1 + 1107))
    sub_100022314();
  v10 = (unsigned __int8 *)(a1 + 704);
  v11 = *(unsigned __int8 *)(a1 + 704);
  if (v11 == *a2)
  {
    if (!*(_BYTE *)(a1 + 704))
      return;
    v12 = *(unsigned __int8 *)(a1 + 741);
    if ((_DWORD)v12 == a2[37]
      && sub_1000101A8((unsigned __int8 *)(a1 + 720), a2 + 16, v12, a4, a5, a6, a7, a8)
      && *(unsigned __int8 *)(a1 + 876) == a2[172]
      && *(unsigned __int16 *)(a1 + 814) == *((unsigned __int16 *)a2 + 55)
      && *(_DWORD *)(a1 + 860) == *((_DWORD *)a2 + 39)
      && *(_DWORD *)(a1 + 864) == *((_DWORD *)a2 + 40)
      && *(_QWORD *)(a1 + 744) == *((_QWORD *)a2 + 5)
      && *(_QWORD *)(a1 + 752) == *((_QWORD *)a2 + 6)
      && *(_DWORD *)(a1 + 848) == *((_DWORD *)a2 + 36))
    {
      if (*v10)
      {
        if (!*(_BYTE *)(a1 + 1106))
        {
          sub_10000E868(a1 + 308, 1);
          *(_BYTE *)(a1 + 1106) = 1;
          sub_10001D2F4(1u);
          if (dword_1000354D4)
          {
            v13 = *(_BYTE *)(a1 + 1106);
            v14 = *((_OWORD *)v10 + 11);
            v168 = *((_OWORD *)v10 + 10);
            v169 = v14;
            v170 = *((_QWORD *)v10 + 24);
            v15 = *((_OWORD *)v10 + 7);
            v164 = *((_OWORD *)v10 + 6);
            v165 = v15;
            v16 = *((_OWORD *)v10 + 9);
            v166 = *((_OWORD *)v10 + 8);
            v167 = v16;
            v17 = *((_OWORD *)v10 + 3);
            v160 = *((_OWORD *)v10 + 2);
            v161 = v17;
            v18 = *((_OWORD *)v10 + 5);
            v162 = *((_OWORD *)v10 + 4);
            v163 = v18;
            v19 = *((_OWORD *)v10 + 1);
            v158 = *(_OWORD *)v10;
            v159 = v19;
            v20 = (char *)(a1 + 308);
LABEL_23:
            sub_10001AAD4(v20, (uint64_t)&v158, v13);
            return;
          }
        }
      }
      return;
    }
    v11 = *v10;
  }
  if (!v11)
  {
    if (*a2)
    {
      inet_ntop(30, a2 + 16, v171, 0x2Eu);
      sub_100003108(2u, (uint64_t)"%s prefix changed from \"\" to %s", v27, v28, v29, v30, v31, v32, a1 + 308);
      sub_10000E868(a1 + 308, 1);
      *(_BYTE *)(a1 + 1106) = 1;
      *(_OWORD *)v10 = *(_OWORD *)a2;
      v33 = *((_OWORD *)a2 + 8);
      v35 = *((_OWORD *)a2 + 5);
      v34 = *((_OWORD *)a2 + 6);
      *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v10 + 8) = v33;
      *((_OWORD *)v10 + 5) = v35;
      *((_OWORD *)v10 + 6) = v34;
      v37 = *((_OWORD *)a2 + 10);
      v36 = *((_OWORD *)a2 + 11);
      v38 = *((_OWORD *)a2 + 9);
      *((_QWORD *)v10 + 24) = *((_QWORD *)a2 + 24);
      *((_OWORD *)v10 + 10) = v37;
      *((_OWORD *)v10 + 11) = v36;
      *((_OWORD *)v10 + 9) = v38;
      v40 = *((_OWORD *)a2 + 3);
      v39 = *((_OWORD *)a2 + 4);
      v41 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v10 + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v10 + 2) = v41;
      *((_OWORD *)v10 + 3) = v40;
      *((_OWORD *)v10 + 4) = v39;
      sub_10001D2F4(1u);
      if (!dword_1000354D4)
      {
        v156 = a1 + 308;
        v142 = "%s, no internal interfaces to setup ipv6";
LABEL_60:
        sub_100003108(2u, (uint64_t)v142, v42, v43, v44, v45, v46, v47, v156);
        return;
      }
      v48 = xpc_array_create(0, 0);
      for (i = qword_100035498; i; i = *(_QWORD *)i)
      {
        if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
        {
          if (!*(_DWORD *)(i + 16) && !*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
            sub_10000E6F8((const char *)(i + 308), 1);
          if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
          {
            v55 = sub_100012920(i, a1, 1, v50, v51, v52, v53, v54);
            v61 = (const char *)(i + 308);
            if (v55)
              sub_100003108(0, (uint64_t)"failed to setup IPv6 on %s", (uint64_t)v61, v56, v57, v58, v59, v60, i + 308);
            else
              xpc_array_set_string(v48, 0xFFFFFFFFFFFFFFFFLL, v61);
          }
        }
      }
      if (!xpc_array_get_count(v48) || sub_100021200(a1, v48, v113, v114, v115, v116, v117, v118))
        goto LABEL_64;
      v112 = *(_BYTE *)(a1 + 1106) != 0;
LABEL_52:
      v119 = *((_OWORD *)v10 + 11);
      v168 = *((_OWORD *)v10 + 10);
      v169 = v119;
      v170 = *((_QWORD *)v10 + 24);
      v120 = *((_OWORD *)v10 + 7);
      v164 = *((_OWORD *)v10 + 6);
      v165 = v120;
      v121 = *((_OWORD *)v10 + 9);
      v166 = *((_OWORD *)v10 + 8);
      v167 = v121;
      v122 = *((_OWORD *)v10 + 3);
      v160 = *((_OWORD *)v10 + 2);
      v161 = v122;
      v123 = *((_OWORD *)v10 + 5);
      v162 = *((_OWORD *)v10 + 4);
      v163 = v123;
      v124 = *((_OWORD *)v10 + 1);
      v158 = *(_OWORD *)v10;
      v159 = v124;
      v125 = sub_10001AAD4((char *)(a1 + 308), (uint64_t)&v158, v112);
      if ((_DWORD)v125)
        goto LABEL_64;
      v133 = sub_10001FB48(v125, v126, v127, v128, v129, v130, v131, v132);
      if ((_DWORD)v133)
      {
        v141 = "unable to start rtadvd: %s";
      }
      else
      {
        LODWORD(v133) = sub_100020BC0(v133, v134, v135, v136, v137, v138, v139, v140);
        if (!(_DWORD)v133)
          goto LABEL_64;
        v141 = "unable to start dhcp6d: %s";
      }
      v149 = strerror(v133);
      sub_100003108(0, (uint64_t)v141, v150, v151, v152, v153, v154, v155, (uint64_t)v149);
LABEL_64:
      if (v48)
        xpc_release(v48);
      return;
    }
LABEL_39:
    if (sub_1000101A8((unsigned __int8 *)(a1 + 720), a2 + 16, *(unsigned __int8 *)(a1 + 741), a4, a5, a6, a7, a8))
    {
      if (!sub_1000101A8((unsigned __int8 *)(a1 + 720), a2 + 16, *(unsigned __int8 *)(a1 + 741), v62, v63, v64, v65, v66))return;
      inet_ntop(30, a2 + 16, v171, 0x2Eu);
      v73 = sub_100003108(1u, (uint64_t)"%s %s prefix characteristics changed", v67, v68, v69, v70, v71, v72, (uint64_t)v171);
      *(_OWORD *)v10 = *(_OWORD *)a2;
      v75 = *((_OWORD *)a2 + 1);
      v76 = *((_OWORD *)a2 + 2);
      v77 = *((_OWORD *)a2 + 4);
      *((_OWORD *)v10 + 3) = *((_OWORD *)a2 + 3);
      *((_OWORD *)v10 + 4) = v77;
      *((_OWORD *)v10 + 1) = v75;
      *((_OWORD *)v10 + 2) = v76;
      v78 = *((_OWORD *)a2 + 5);
      v79 = *((_OWORD *)a2 + 6);
      v80 = *((_OWORD *)a2 + 8);
      *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
      *((_OWORD *)v10 + 8) = v80;
      *((_OWORD *)v10 + 5) = v78;
      *((_OWORD *)v10 + 6) = v79;
      v81 = *((_OWORD *)a2 + 9);
      v82 = *((_OWORD *)a2 + 10);
      v83 = *((_OWORD *)a2 + 11);
      *((_QWORD *)v10 + 24) = *((_QWORD *)a2 + 24);
      *((_OWORD *)v10 + 10) = v82;
      *((_OWORD *)v10 + 11) = v83;
      *((_OWORD *)v10 + 9) = v81;
      if (*(_BYTE *)(a1 + 1106))
      {
        if (dword_1000354D4)
        {
LABEL_43:
          v84 = sub_10001FB48(v73, v74, v42, v43, v44, v45, v46, v47);
          if (v84)
          {
            v157 = strerror(v84);
            sub_100003108(0, (uint64_t)"unable to start rtadvd: %s", v85, v86, v87, v88, v89, v90, (uint64_t)v157);
          }
          return;
        }
      }
      else
      {
        sub_10000E868(a1 + 308, 1);
        sub_10001D2F4(1u);
        *(_BYTE *)(a1 + 1106) = 1;
        if (dword_1000354D4)
        {
          v143 = *((_OWORD *)v10 + 11);
          v168 = *((_OWORD *)v10 + 10);
          v169 = v143;
          v170 = *((_QWORD *)v10 + 24);
          v144 = *((_OWORD *)v10 + 7);
          v164 = *((_OWORD *)v10 + 6);
          v165 = v144;
          v145 = *((_OWORD *)v10 + 9);
          v166 = *((_OWORD *)v10 + 8);
          v167 = v145;
          v146 = *((_OWORD *)v10 + 3);
          v160 = *((_OWORD *)v10 + 2);
          v161 = v146;
          v147 = *((_OWORD *)v10 + 5);
          v162 = *((_OWORD *)v10 + 4);
          v163 = v147;
          v148 = *((_OWORD *)v10 + 1);
          v158 = *(_OWORD *)v10;
          v159 = v148;
          v73 = sub_10001AAD4((char *)(a1 + 308), (uint64_t)&v158, 1);
          if ((_DWORD)v73)
            return;
          goto LABEL_43;
        }
      }
      goto LABEL_59;
    }
    inet_ntop(30, a2 + 16, v171, 0x2Eu);
    inet_ntop(30, (const void *)(a1 + 720), v172, 0x2Eu);
    sub_100003108(2u, (uint64_t)"%s prefix changed from %s -> %s", v91, v92, v93, v94, v95, v96, a1 + 308);
    v97 = *((_OWORD *)v10 + 3);
    *(_OWORD *)(a1 + 936) = *((_OWORD *)v10 + 2);
    *(_OWORD *)(a1 + 952) = v97;
    v98 = *((_OWORD *)v10 + 7);
    *(_OWORD *)(a1 + 1000) = *((_OWORD *)v10 + 6);
    *(_OWORD *)(a1 + 1016) = v98;
    v99 = *((_OWORD *)v10 + 5);
    *(_OWORD *)(a1 + 968) = *((_OWORD *)v10 + 4);
    *(_OWORD *)(a1 + 984) = v99;
    *(_QWORD *)(a1 + 1096) = *((_QWORD *)v10 + 24);
    v100 = *((_OWORD *)v10 + 11);
    *(_OWORD *)(a1 + 1064) = *((_OWORD *)v10 + 10);
    *(_OWORD *)(a1 + 1080) = v100;
    v101 = *((_OWORD *)v10 + 9);
    *(_OWORD *)(a1 + 1032) = *((_OWORD *)v10 + 8);
    *(_OWORD *)(a1 + 1048) = v101;
    v102 = *((_OWORD *)v10 + 1);
    *(_OWORD *)(a1 + 904) = *(_OWORD *)v10;
    *(_OWORD *)(a1 + 920) = v102;
    *(_OWORD *)v10 = *(_OWORD *)a2;
    v103 = *((_OWORD *)a2 + 1);
    v104 = *((_OWORD *)a2 + 2);
    v105 = *((_OWORD *)a2 + 4);
    *((_OWORD *)v10 + 3) = *((_OWORD *)a2 + 3);
    *((_OWORD *)v10 + 4) = v105;
    *((_OWORD *)v10 + 1) = v103;
    *((_OWORD *)v10 + 2) = v104;
    v106 = *((_OWORD *)a2 + 5);
    v107 = *((_OWORD *)a2 + 6);
    v108 = *((_OWORD *)a2 + 8);
    *((_OWORD *)v10 + 7) = *((_OWORD *)a2 + 7);
    *((_OWORD *)v10 + 8) = v108;
    *((_OWORD *)v10 + 5) = v106;
    *((_OWORD *)v10 + 6) = v107;
    v109 = *((_OWORD *)a2 + 9);
    v110 = *((_OWORD *)a2 + 10);
    v111 = *((_OWORD *)a2 + 11);
    *((_QWORD *)v10 + 24) = *((_QWORD *)a2 + 24);
    *((_OWORD *)v10 + 10) = v110;
    *((_OWORD *)v10 + 11) = v111;
    *((_OWORD *)v10 + 9) = v109;
    if (!*(_BYTE *)(a1 + 1106))
    {
      sub_10000E868(a1 + 308, 1);
      sub_10001D2F4(1u);
      *(_BYTE *)(a1 + 1106) = 1;
    }
    if (!dword_1000354D4)
    {
LABEL_59:
      v142 = "no internal interfaces to setup ipv6";
      goto LABEL_60;
    }
    v48 = 0;
    v112 = 1;
    goto LABEL_52;
  }
  if (*a2)
    goto LABEL_39;
  if (*(_BYTE *)(a1 + 1106))
  {
    sub_10000E868(a1 + 308, 0);
    sub_10001D2F4(0);
    *(_BYTE *)(a1 + 1106) = 0;
    if (dword_1000354D4)
    {
      v21 = *((_OWORD *)v10 + 11);
      v168 = *((_OWORD *)v10 + 10);
      v169 = v21;
      v170 = *((_QWORD *)v10 + 24);
      v22 = *((_OWORD *)v10 + 7);
      v164 = *((_OWORD *)v10 + 6);
      v165 = v22;
      v23 = *((_OWORD *)v10 + 9);
      v166 = *((_OWORD *)v10 + 8);
      v167 = v23;
      v24 = *((_OWORD *)v10 + 3);
      v160 = *((_OWORD *)v10 + 2);
      v161 = v24;
      v25 = *((_OWORD *)v10 + 5);
      v162 = *((_OWORD *)v10 + 4);
      v163 = v25;
      v26 = *((_OWORD *)v10 + 1);
      v158 = *(_OWORD *)v10;
      v159 = v26;
      v20 = (char *)(a1 + 308);
      v13 = 0;
      goto LABEL_23;
    }
  }
}

void sub_10000A178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v10;
  uint64_t v12;
  BOOL v15;
  xpc_object_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;

  if (byte_100035481)
    return;
  if (*(_BYTE *)(a1 + 1107))
    sub_10002233C();
  v10 = (_QWORD *)(a1 + 648);
  if (*(_QWORD *)a2 == *(_QWORD *)(a1 + 648) && *(_QWORD *)(a2 + 8) == *(_QWORD *)(a1 + 656))
  {
    v15 = *v10 == *(_QWORD *)in6addr_any.__u6_addr8 && *(_QWORD *)(a1 + 656) == *(_QWORD *)&in6addr_any.__u6_addr32[2];
    if (!v15 && !*(_BYTE *)(a1 + 1105))
    {
      sub_10001D2F4(1u);
      *(_BYTE *)(a1 + 1105) = 1;
    }
  }
  else
  {
    v12 = *(_QWORD *)&in6addr_any.__u6_addr32[2];
    if (*(_QWORD *)a2 == *(_QWORD *)in6addr_any.__u6_addr8 && *(_QWORD *)(a2 + 8) == v12)
    {
      if (*(_BYTE *)(a1 + 1105))
      {
        sub_10001D2F4(0);
        *(_BYTE *)(a1 + 1105) = 0;
        return;
      }
    }
    else if (*v10 != *(_QWORD *)in6addr_any.__u6_addr8 || *(_QWORD *)(a1 + 656) != v12)
    {
      *(_OWORD *)v10 = *(_OWORD *)a2;
      if (!*(_BYTE *)(a1 + 1105))
      {
        sub_10001D2F4(1u);
        *(_BYTE *)(a1 + 1105) = 1;
      }
      if (dword_1000354D4)
        sub_10001C954((char *)(a1 + 308), 0, 1, a4, a5, a6, a7, a8, a9);
      return;
    }
    if (*v10 == *(_QWORD *)in6addr_any.__u6_addr8 && *(_QWORD *)(a1 + 656) == v12)
    {
      *(_OWORD *)v10 = *(_OWORD *)a2;
      if (!*(_BYTE *)(a1 + 1105))
      {
        sub_10001D2F4(1u);
        *(_BYTE *)(a1 + 1105) = 1;
      }
      if (dword_1000354D4)
      {
        v17 = xpc_array_create(0, 0);
        for (i = qword_100035498; i; i = *(_QWORD *)i)
        {
          if (!strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
          {
            if (!*(_DWORD *)(i + 16) && !*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
              sub_10000E6F8((const char *)(i + 308), 1);
            if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
            {
              v24 = sub_100012920(i, a1, 1, v19, v20, v21, v22, v23);
              v30 = (const char *)(i + 308);
              if (v24)
                sub_100003108(0, (uint64_t)"%s: failed to setup IPv6 on %s", (uint64_t)v30, v25, v26, v27, v28, v29, (uint64_t)"mis_process_v6_addr_change");
              else
                xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, v30);
            }
          }
        }
        if (xpc_array_get_count(v17))
        {
          if (!sub_100021200(a1, v17, v31, v32, v33, v34, v35, v36))
          {
            v37 = sub_10001A6F8((char *)(a1 + 308), *(_DWORD *)(a1 + 300));
            if (!(_DWORD)v37)
            {
              v45 = sub_10001FB48((uint64_t)v37, v38, v39, v40, v41, v42, v43, v44);
              if ((_DWORD)v45)
              {
                v66 = strerror(v45);
                sub_100003108(0, (uint64_t)"unable to start rtadvd: %s", v53, v54, v55, v56, v57, v58, (uint64_t)v66);
              }
              else
              {
                v59 = sub_100020BC0(v45, v46, v47, v48, v49, v50, v51, v52);
                if (v59)
                {
                  strerror(v59);
                  sub_100003108(0, (uint64_t)"unable to start dhcp6d for %s: %s", v60, v61, v62, v63, v64, v65, 308);
                }
              }
            }
          }
        }
        if (v17)
          xpc_release(v17);
      }
    }
  }
}

void sub_10000A438(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v11;
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
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  int v28;
  xpc_object_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  _DWORD *v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v8 = a3;
  v11 = *(_DWORD *)(a1 + 1264);
  if (a2 || *(_DWORD *)(a1 + 680))
  {
    if (sub_10001F9A4() && !byte_100035484)
    {
      sub_100003108(1u, (uint64_t)"%s: device currently has dual sim, skipping PREF64 configurations", v12, v13, v14, v15, v16, v17, (uint64_t)"mis_process_pref64");
      v24 = v11 == 1;
      goto LABEL_19;
    }
    v25 = sub_100006F80(a1, 1, 0, v13, v14, v15, v16, v17);
    if ((_DWORD)v25)
    {
      if ((_DWORD)v25 != 2)
      {
        sub_100003108(0, (uint64_t)"%s: failed to query NAT64 prefix on ext if %s", v18, v19, v20, v21, v22, v23, (uint64_t)"mis_process_pref64");
        return;
      }
      v25 = sub_100003108(1u, (uint64_t)"%s: NAT64 prefix doesn't exist on ext if %s", v18, v19, v20, v21, v22, v23, (uint64_t)"mis_process_pref64");
    }
    if (v11)
    {
      if (v11 != *(_DWORD *)(a1 + 1264))
      {
        v24 = 1;
LABEL_19:
        v28 = *(_DWORD *)(a1 + 680);
        if (v28 == a2)
        {
          if (*(_DWORD *)(a1 + 684) == v8)
          {
            if (!a2)
              return;
            if (!*(_BYTE *)(a1 + 1104))
            {
              sub_10001D204(1u);
              *(_BYTE *)(a1 + 1104) = 1;
              if (!v24)
                return;
              goto LABEL_42;
            }
            goto LABEL_41;
          }
          if (!a2)
            return;
          goto LABEL_35;
        }
        v27 = (int *)(a1 + 680);
        if (a2)
        {
          if (v28)
          {
            *v27 = a2;
LABEL_35:
            *(_DWORD *)(a1 + 684) = v8;
            if (!*(_BYTE *)(a1 + 1104))
            {
              sub_10001D204(1u);
              *(_BYTE *)(a1 + 1104) = 1;
            }
            if ((_DWORD)qword_1000354D4)
            {
              sub_10001C954((char *)(a1 + 308), 1, 0, v19, v20, v21, v22, v23, v67);
              if (!v24)
                return;
              goto LABEL_42;
            }
            goto LABEL_41;
          }
          v39 = *(unsigned __int8 *)(a1 + 1104);
          *(_DWORD *)(a1 + 680) = a2;
          v40 = (_DWORD *)(a1 + 684);
          *(_DWORD *)(a1 + 684) = v8;
          if (v39)
          {
LABEL_50:
            if (!(_DWORD)qword_1000354D4)
              return;
            v30 = xpc_array_create(0, 0);
            for (i = qword_100035498; i; i = *(_QWORD *)i)
            {
              if (*(_BYTE *)(i + 700)
                && *(_DWORD *)(i + 20) == 201
                && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
              {
                v48 = sub_100012310(i, a1, v42, v43, v44, v45, v46, v47);
                v54 = (const char *)(i + 308);
                if (v48)
                {
                  sub_100003108(0, (uint64_t)"failed to setup IPv4 on %s", (uint64_t)v54, v49, v50, v51, v52, v53, i + 308);
                }
                else
                {
                  xpc_array_set_string(v30, 0xFFFFFFFFFFFFFFFFLL, v54);
                  if (sub_100016F1C(i, a1, v55, v56, v57, v58, v59, v60))
                    goto LABEL_44;
                }
              }
            }
            if (!xpc_array_get_count(v30))
              goto LABEL_44;
            if (sub_100021200(a1, v30, v61, v62, v63, v64, v65, v66))
              goto LABEL_44;
            sub_100019BE8((char *)(a1 + 308), v27, v40, *(_DWORD *)(a1 + 300));
            if (!v24)
              goto LABEL_44;
            goto LABEL_43;
          }
LABEL_49:
          sub_10001D204(1u);
          *(_BYTE *)(a1 + 1104) = 1;
          goto LABEL_50;
        }
        goto LABEL_28;
      }
    }
    else
    {
      v11 = *(_DWORD *)(a1 + 1264);
    }
    if (v11 == 1 && sub_10001FB48(v25, v26, v18, v19, v20, v21, v22, v23))
      return;
    v24 = 0;
    goto LABEL_19;
  }
  v27 = (int *)(a1 + 680);
  sub_100003108(1u, (uint64_t)"%s: both existing and new v4 addresses are not present, skipping PREF64", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_process_v4_change");
  v28 = *v27;
  if (!*v27)
    return;
  v24 = 0;
LABEL_28:
  if (!*(_BYTE *)(a1 + 1104))
  {
    if (v28)
    {
LABEL_41:
      if (!v24)
        return;
      goto LABEL_42;
    }
    *(_DWORD *)(a1 + 680) = a2;
    v40 = (_DWORD *)(a1 + 684);
    *(_DWORD *)(a1 + 684) = v8;
    goto LABEL_49;
  }
  sub_10001D204(0);
  *(_BYTE *)(a1 + 1104) = 0;
  if (*(_DWORD *)(a1 + 1264) == 1 && v24)
  {
LABEL_42:
    v30 = 0;
LABEL_43:
    v31 = sub_100003108(1u, (uint64_t)"%s: resetting NETRB state due to PREF64 presence change", v18, v19, v20, v21, v22, v23, (uint64_t)"mis_process_v4_change");
    *(_DWORD *)(a1 + 1264) = 0;
    sub_1000147A0(v31, v32, v33, v34, v35, v36, v37, v38);
LABEL_44:
    if (v30)
      xpc_release(v30);
  }
}

uint64_t sub_10000A7B0(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v2 = xpc_array_create(0, 0);
  for (i = qword_100035498; i; i = *(_QWORD *)i)
  {
    if (!*(_DWORD *)(i + 16)
      && *(_DWORD *)(i + 20) == 201
      && *(_BYTE *)(i + 700)
      && !strncmp((const char *)(i + 565), (const char *)(a1 + 308), 0x10uLL))
    {
      xpc_array_set_string(v2, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
    }
  }
  if (xpc_array_get_count(v2))
  {
    sub_100021790((char *)(a1 + 308), v2, v4, v5, v6, v7, v8, v9);
    v17 = (_QWORD *)qword_100035490;
    if (qword_100035490)
    {
      do
      {
        if (v17[37] == a1)
          sub_10001C3D4(v17, v10, v11, v12, v13, v14, v15, v16);
        v17 = (_QWORD *)*v17;
      }
      while (v17);
    }
  }
  if (v2)
    xpc_release(v2);
  return 0;
}

uint64_t sub_10000A88C(uint64_t a1, const char *a2)
{
  xpc_object_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = xpc_array_create(0, 0);
  for (i = qword_100035498; i; i = *(_QWORD *)i)
  {
    if (!*(_DWORD *)(i + 16) && *(_DWORD *)(i + 20) == 201 && !strncmp((const char *)(i + 565), a2, 0x10uLL))
    {
      snprintf((char *)(i + 565), 0x10uLL, "%s", (const char *)(a1 + 308));
      if (*(_BYTE *)(i + 700))
        xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, (const char *)(i + 308));
    }
  }
  if (xpc_array_get_count(v4))
  {
    sub_100021200(a1, v4, v6, v7, v8, v9, v10, v11);
    v12 = (_QWORD *)qword_100035490;
    if (qword_100035490)
    {
      do
      {
        if (v12[37] == a1)
          sub_10001AE28(v12);
        v12 = (_QWORD *)*v12;
      }
      while (v12);
    }
  }
  if (v4)
    xpc_release(v4);
  return 0;
}

void sub_10000A9A4(const char *a1, Boolean *a2, Boolean *a3)
{
  const __SCPreferences *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __SCPreferences *v13;
  const __SCNetworkService *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __SCNetworkService *v21;
  const __SCNetworkProtocol *v22;
  const __SCNetworkProtocol *v23;
  const __SCNetworkProtocol *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const __SCNetworkProtocol *v31;

  v6 = SCPreferencesCreate(0, CFSTR("com.apple.MobileInternetSharing"), 0);
  *a2 = 0;
  *a3 = 0;
  if (v6)
  {
    v13 = v6;
    v14 = (const __SCNetworkService *)sub_10000AAF0(v6, a1);
    if (v14)
    {
      v21 = v14;
      v22 = SCNetworkServiceCopyProtocol(v14, kSCNetworkProtocolTypeIPv4);
      if (v22)
      {
        v23 = v22;
        *a2 = SCNetworkProtocolGetEnabled(v22);
        CFRelease(v23);
      }
      v24 = SCNetworkServiceCopyProtocol(v21, kSCNetworkProtocolTypeIPv6);
      if (v24)
      {
        v31 = v24;
        *a3 = SCNetworkProtocolGetEnabled(v24);
        CFRelease(v31);
      }
      sub_100003108(1u, (uint64_t)"interface protocol status for %s IPv4: %s, IPv6: %s", v25, v26, v27, v28, v29, v30, (uint64_t)a1);
      CFRelease(v21);
    }
    else
    {
      sub_100003108(0, (uint64_t)"failed to find network service for %s", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    }
    CFRelease(v13);
  }
  else
  {
    sub_100003108(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v7, v8, v9, v10, v11, v12, (uint64_t)a1);
  }
}

CFTypeRef sub_10000AAF0(const __SCPreferences *a1, const char *a2)
{
  CFStringRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFStringRef v11;
  const __SCNetworkSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __SCNetworkSet *v19;
  const __CFArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFArray *v27;
  CFIndex Count;
  CFIndex v29;
  CFIndex v30;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  CFStringRef BSDName;
  CFTypeRef v34;

  v4 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x600u);
  if (v4)
  {
    v11 = v4;
    v12 = SCNetworkSetCopyCurrent(a1);
    if (v12)
    {
      v19 = v12;
      v20 = SCNetworkSetCopyServices(v12);
      if (v20)
      {
        v27 = v20;
        Count = CFArrayGetCount(v20);
        if (Count < 1)
        {
LABEL_10:
          v34 = 0;
        }
        else
        {
          v29 = Count;
          v30 = 0;
          while (1)
          {
            ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v27, v30);
            Interface = SCNetworkServiceGetInterface(ValueAtIndex);
            if (Interface)
            {
              BSDName = SCNetworkInterfaceGetBSDName(Interface);
              if (BSDName)
              {
                if (CFEqual(BSDName, v11))
                  break;
              }
            }
            if (v29 == ++v30)
              goto LABEL_10;
          }
          v34 = CFRetain(ValueAtIndex);
        }
        CFRelease(v27);
      }
      else
      {
        sub_100003108(0, (uint64_t)"SCNetworkSetCopyServices failed for (%s)", v21, v22, v23, v24, v25, v26, (uint64_t)a2);
        v34 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      sub_100003108(0, (uint64_t)"SCNetworkSetCopyCurrent failed for (%s)", v13, v14, v15, v16, v17, v18, (uint64_t)a2);
      v34 = 0;
    }
    CFRelease(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"CFStringCreateWithCString() failed for (%s)", v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    return 0;
  }
  return v34;
}

void sub_10000AC24(uint64_t a1)
{
  SCDynamicStoreRef v2;
  const __SCDynamicStore *v3;
  SCDynamicStoreRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  SCDynamicStoreRef v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  CFStringRef NetworkServiceEntity;
  __CFArray *Mutable;
  CFDictionaryRef v17;
  CFTypeID TypeID;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t Count;
  const void **v26;
  const void **v27;
  const __CFDictionary **v28;
  CFStringRef *v29;
  const __CFDictionary *v30;
  CFTypeID v31;
  const void *Value;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v34;
  const void *ValueAtIndex;
  const __CFString *v36;
  const __CFString *v37;
  uint64_t v38;
  const void **v39;
  CFStringRef cf1;

  v2 = SCDynamicStoreCreate(0, CFSTR("com.apple.MobileInternetSharing"), 0, 0);
  if (v2)
  {
    v3 = v2;
    v4 = SCDynamicStoreCreate(0, CFSTR("com.apple.MobileInternetSharing"), 0, 0);
    if (!v4)
      goto LABEL_34;
    v11 = v4;
    v12 = CFStringCreateWithCString(0, (const char *)(a1 + 308), 0x600u);
    if (!v12)
    {
      CFRelease(v11);
      goto LABEL_34;
    }
    v13 = v12;
    v14 = kSCDynamicStoreDomainSetup;
    NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetInterface);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(Mutable, NetworkServiceEntity);
    CFRelease(NetworkServiceEntity);
    v17 = SCDynamicStoreCopyMultiple(v11, 0, Mutable);
    CFRelease(Mutable);
    TypeID = CFDictionaryGetTypeID();
    if (!v17 || CFGetTypeID(v17) != TypeID)
    {
      sub_100003108(0, (uint64_t)"Empty dictionary", v19, v20, v21, v22, v23, v24, v38);
      Count = 0;
      goto LABEL_28;
    }
    Count = CFDictionaryGetCount(v17);
    v26 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v27 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(v17, v27, v26);
    if (Count < 1)
    {
      Count = 0;
      if (!v26)
      {
LABEL_26:
        if (v27)
          free(v27);
LABEL_28:
        if (v17)
          CFRelease(v17);
        CFRelease(v13);
        CFRelease(v11);
        if (Count)
        {
          v36 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, v14, (CFStringRef)Count, kSCEntNetIPv4);
          if (v36)
          {
            v37 = v36;
            SCDynamicStoreNotifyValue(v3, v36);
            CFRelease(v37);
          }
          CFRelease((CFTypeRef)Count);
          goto LABEL_35;
        }
LABEL_34:
        sub_100003108(1u, (uint64_t)"notify: svcid for %s not found", v5, v6, v7, v8, v9, v10, a1 + 308);
LABEL_35:
        CFRelease(v3);
        return;
      }
    }
    else
    {
      cf1 = v13;
      v39 = v26;
      v28 = (const __CFDictionary **)v26;
      v29 = (CFStringRef *)v27;
      while (1)
      {
        v30 = *v28;
        v31 = CFDictionaryGetTypeID();
        if (v30)
        {
          if (CFGetTypeID(v30) == v31)
          {
            Value = CFDictionaryGetValue(v30, kSCPropNetInterfaceDeviceName);
            if (Value)
            {
              if (CFEqual(cf1, Value))
                break;
            }
          }
        }
        ++v29;
        ++v28;
        if (!--Count)
          goto LABEL_13;
      }
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, *v29, CFSTR("/"));
      if (!ArrayBySeparatingStrings)
      {
        Count = 0;
LABEL_13:
        v14 = kSCDynamicStoreDomainSetup;
        v13 = cf1;
        v26 = v39;
        goto LABEL_25;
      }
      v34 = ArrayBySeparatingStrings;
      v14 = kSCDynamicStoreDomainSetup;
      v13 = cf1;
      v26 = v39;
      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 4)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v34, 3);
        Count = (uint64_t)CFRetain(ValueAtIndex);
      }
      else
      {
        Count = 0;
      }
      CFRelease(v34);
    }
LABEL_25:
    free(v26);
    goto LABEL_26;
  }
}

uint64_t *sub_10000AF6C(uint64_t a1)
{
  uint64_t *result;
  int v3;

  result = &qword_1000354C0;
  while (1)
  {
    result = (uint64_t *)*result;
    if (!result)
      break;
    if (result[1] == a1)
    {
      v3 = *((_DWORD *)result + 6);
      if (!v3)
        sub_100022364();
      *((_DWORD *)result + 6) = v3 + 1;
      return result;
    }
  }
  return result;
}

void sub_10000AFB0(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;

  v10 = xpc_dictionary_create(0, 0, 0);
  if (v10)
  {
    v17 = v10;
    xpc_dictionary_set_uint64(v10, off_100034CA8[0], a1);
    sub_100003108(2u, (uint64_t)"sending notification to clients", v18, v19, v20, v21, v22, v23, v25);
    for (i = qword_1000354C0; i; i = *(_QWORD *)i)
      xpc_connection_send_message(*(xpc_connection_t *)(i + 16), v17);
    xpc_release(v17);
  }
  else
  {
    sub_100003108(0, (uint64_t)"xpc_dictionary_create() failed", v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000B040(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  uint64_t *v11;
  uint64_t *i;

  v8 = *((_DWORD *)a1 + 6);
  if (!v8)
    sub_10002238C();
  v10 = v8 - 1;
  *((_DWORD *)a1 + 6) = v10;
  if (!v10)
  {
    if (a1[2])
    {
      sub_100003108(2u, (uint64_t)"releasing remote connection %p to client", a3, a4, a5, a6, a7, a8, a1[2]);
      xpc_connection_cancel((xpc_connection_t)a1[2]);
      xpc_release((xpc_object_t)a1[2]);
    }
    v11 = &qword_1000354C0;
    for (i = (uint64_t *)qword_1000354C0; i != a1; i = (uint64_t *)*i)
      v11 = i;
    *v11 = *a1;
    free(a1);
    if (!dword_100034EF8)
      sub_1000223B4();
    --dword_100034EF8;
  }
}

_QWORD *sub_10000B0F0(uint64_t a1, void *a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _xpc_endpoint_s *value;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _xpc_connection_s *v19;
  _xpc_connection_s *v20;
  const char *v22;
  uint64_t v24;
  _QWORD handler[7];

  v4 = malloc_type_malloc(0x20uLL, 0x102004055CCDE27uLL);
  v11 = v4;
  if (!v4)
  {
    sub_100003108(0, (uint64_t)"malloc() failed for connection %p", v5, v6, v7, v8, v9, v10, a1);
    return v11;
  }
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[1] = a1;
  *((_DWORD *)v4 + 6) = 1;
  value = (_xpc_endpoint_s *)xpc_dictionary_get_value(a2, off_100034BF0[0]);
  if (!value)
  {
    v22 = "message does not contain the endpoint connection";
LABEL_10:
    sub_100003108(0, (uint64_t)v22, v13, v14, v15, v16, v17, v18, v24);
    free(v11);
    return 0;
  }
  v19 = xpc_connection_create_from_endpoint(value);
  if (!v19)
  {
    v22 = "xpc_connection_create_from_endpoint() failed";
    goto LABEL_10;
  }
  v20 = v19;
  v11[2] = v19;
  xpc_connection_set_target_queue(v19, (dispatch_queue_t)qword_100035470);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_10000B23C;
  handler[3] = &unk_100030DE8;
  handler[4] = v20;
  handler[5] = a1;
  handler[6] = v11;
  xpc_connection_set_event_handler(v20, handler);
  xpc_connection_resume(v20);
  *v11 = qword_1000354C0;
  qword_1000354C0 = (uint64_t)v11;
  if (__CFADD__(dword_100034EF8++, 1))
    sub_1000223DC();
  return v11;
}

void sub_10000B23C(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  type = xpc_get_type(object);
  sub_100003108(1u, (uint64_t)"event on remote connection %p from client connection %p", v5, v6, v7, v8, v9, v10, *(_QWORD *)(a1 + 32));
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
      {
        v18 = &qword_1000354C0;
        while (1)
        {
          v18 = (uint64_t *)*v18;
          if (!v18)
            break;
          if (v18[2] == v17)
          {
            sub_100003108(2u, (uint64_t)"found remote connection", v11, v12, v13, v14, v15, v16, v25);
            if (!*((_DWORD *)v18 + 6))
              sub_100022404();
            sub_100003108(1u, (uint64_t)"XPC_ERROR_CONNECTION_INVALID for remote %p from connection %p", v19, v20, v21, v22, v23, v24, *(_QWORD *)(a1 + 32));
            xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
            xpc_release(*(xpc_object_t *)(a1 + 32));
            *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16) = 0;
            return;
          }
        }
      }
    }
    else if (object == &_xpc_error_termination_imminent)
    {
      sub_100003108(0, (uint64_t)"XPC_ERROR_TERMINATION_IMMINENT for peer %p from connection %p", v11, v12, v13, v14, v15, v16, *(_QWORD *)(a1 + 32));
    }
    else if (object == &_xpc_error_connection_interrupted)
    {
      sub_100003108(0, (uint64_t)"XPC_ERROR_CONNECTION_INTERRUPTED for peer %p from connection %p", v11, v12, v13, v14, v15, v16, *(_QWORD *)(a1 + 32));
    }
  }
}

char *sub_10000B374(_xpc_connection_s *a1, uint64_t a2, int a3)
{
  pid_t pid;
  char *v7;
  char *v8;
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
  int v23;

  pid = xpc_connection_get_pid(a1);
  v7 = (char *)malloc_type_malloc(0x200uLL, 0x10A00401629E6F1uLL);
  v8 = v7;
  if (v7)
  {
    *((_OWORD *)v7 + 29) = 0u;
    *((_OWORD *)v7 + 30) = 0u;
    *((_OWORD *)v7 + 27) = 0u;
    *((_OWORD *)v7 + 28) = 0u;
    *((_OWORD *)v7 + 25) = 0u;
    *((_OWORD *)v7 + 26) = 0u;
    *((_OWORD *)v7 + 23) = 0u;
    *((_OWORD *)v7 + 24) = 0u;
    *((_OWORD *)v7 + 21) = 0u;
    *((_OWORD *)v7 + 22) = 0u;
    *((_OWORD *)v7 + 19) = 0u;
    *((_OWORD *)v7 + 20) = 0u;
    *((_OWORD *)v7 + 17) = 0u;
    *((_OWORD *)v7 + 18) = 0u;
    *((_OWORD *)v7 + 15) = 0u;
    *((_OWORD *)v7 + 16) = 0u;
    *((_OWORD *)v7 + 13) = 0u;
    *((_OWORD *)v7 + 14) = 0u;
    *((_OWORD *)v7 + 11) = 0u;
    *((_OWORD *)v7 + 12) = 0u;
    *((_OWORD *)v7 + 9) = 0u;
    *((_OWORD *)v7 + 10) = 0u;
    *((_OWORD *)v7 + 7) = 0u;
    *((_OWORD *)v7 + 8) = 0u;
    *((_OWORD *)v7 + 4) = 0u;
    *((_OWORD *)v7 + 5) = 0u;
    *((_OWORD *)v7 + 2) = 0u;
    *((_OWORD *)v7 + 3) = 0u;
    *(_OWORD *)v7 = 0u;
    *((_OWORD *)v7 + 1) = 0u;
    *(_OWORD *)(v7 + 492) = 0u;
    *((_OWORD *)v7 + 6) = 0u;
    *((_QWORD *)v7 + 10) = a2;
    *((_DWORD *)v7 + 127) = a3;
    *((_DWORD *)v7 + 88) = pid;
    proc_name(pid, v7 + 356, 0x40u);
    snprintf(v8 + 96, 0x100uLL, "%s.%p-%p-%d", "com.apple.MobileInternetSharing", v8, a1, dword_100034EFC);
    sub_100003108(2u, (uint64_t)"client created %s (%p) (%s), client connection %p remote connection %p", v9, v10, v11, v12, v13, v14, (uint64_t)(v8 + 356));
    v15 = qword_1000354C8;
    if (qword_1000354C8)
    {
      v16 = qword_1000354C8;
      while (strncmp(v8 + 96, (const char *)(v16 + 96), 0x100uLL)
           || *(_xpc_connection_s **)(*(_QWORD *)(v16 + 80) + 8) != a1)
      {
        v16 = *(_QWORD *)v16;
        if (!v16)
          goto LABEL_7;
      }
      sub_100003108(0, (uint64_t)"duplicate mis client id %s", v17, v18, v19, v20, v21, v22, (uint64_t)(v8 + 96));
      free(v8);
      return 0;
    }
    else
    {
LABEL_7:
      v23 = dword_100034EFC++;
      if (v23 == -1)
        sub_10002242C();
      *(_QWORD *)v8 = v15;
      qword_1000354C8 = (uint64_t)v8;
      if (!v23)
      {
        sub_100003A74();
        if (qword_100034F00)
          sub_100022454();
        qword_100034F00 = os_transaction_create("com.apple.misd.client-create");
      }
    }
  }
  return v8;
}

void sub_10000B544(void *a1, uint64_t a2)
{
  uint64_t *v2;

  v2 = (uint64_t *)sub_10000B564(a1, a2);
  if (v2)
    sub_10000B5E8(v2);
}

uint64_t sub_10000B564(void *a1, uint64_t a2)
{
  const char *string;
  uint64_t v4;
  BOOL v5;
  const char *v6;

  string = xpc_dictionary_get_string(a1, off_100034BA0[0]);
  v4 = qword_1000354C8;
  if (string)
    v5 = qword_1000354C8 == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  v6 = string;
  do
  {
    if (!strncmp(v6, (const char *)(v4 + 96), 0x100uLL) && *(_QWORD *)(*(_QWORD *)(v4 + 80) + 8) == a2)
      break;
    v4 = *(_QWORD *)v4;
  }
  while (v4);
  return v4;
}

void sub_10000B5E8(uint64_t *a1)
{
  uint64_t *v2;
  uint64_t *i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = &qword_1000354C8;
  for (i = (uint64_t *)qword_1000354C8; i != a1; i = (uint64_t *)*i)
    v2 = i;
  *v2 = *a1;
  if (!dword_100034EFC)
    sub_10002247C();
  --dword_100034EFC;
  sub_100008F30((uint64_t)a1);
  v11 = a1[11];
  if (v11)
  {
    if (*(uint64_t **)(v11 + 8) != a1)
      sub_10002251C();
    sub_100008FA4(v11, (uint64_t)a1, v5, v6, v7, v8, v9, v10);
    if (a1[11])
      sub_1000224F4();
  }
  v12 = (uint64_t *)a1[10];
  if (v12)
    sub_10000B040(v12, v4, v5, v6, v7, v8, v9, v10);
  sub_10001D0D0((uint64_t)a1, 2);
  sub_10001D0D0((uint64_t)a1, 30);
  if (*(_DWORD *)((char *)a1 + 9) | *(unsigned __int16 *)((char *)a1 + 13))
    sub_10001596C((uint64_t)a1 + 9);
  if (*(_DWORD *)((char *)a1 + 15))
    v19 = 0;
  else
    v19 = *(unsigned __int16 *)((char *)a1 + 19) == 0;
  if (!v19)
    sub_10001520C((uint64_t)a1 + 15);
  v20 = a1[3];
  if (v20)
  {
    IOEthernetControllerSetLinkStatus(v20, 0);
    IOEthernetControllerSetDispatchQueue(a1[3], 0);
    CFRelease((CFTypeRef)a1[3]);
    a1[3] = 0;
    if (!dword_1000354D0)
      sub_1000224CC();
    --dword_1000354D0;
    v21 = (void *)a1[8];
    if (v21 && a1[7])
    {
      xpc_dictionary_set_uint64(v21, off_100034BF8[0], 0x7D3uLL);
      sub_1000042FC((_xpc_connection_s *)a1[7], (xpc_object_t)a1[8]);
      xpc_release((xpc_object_t)a1[8]);
      a1[7] = 0;
      a1[8] = 0;
    }
  }
  sub_100003108(2u, (uint64_t)"detached from %s (%p)", v13, v14, v15, v16, v17, v18, (uint64_t)a1 + 356);
  free(a1);
  if (!dword_100034EFC)
  {
    sub_100003108(2u, (uint64_t)"no clients left; resuming idle timer", v22, v23, v24, v25, v26, v27, v28);
    sub_100003AA4();
    if (!qword_100034F00)
      sub_1000224A4();
    os_release((void *)qword_100034F00);
    qword_100034F00 = 0;
  }
}

uint64_t sub_10000B7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t *v9;
  const char *v10;
  uint64_t vars0;

  v8 = 0;
  v9 = &qword_1000354C8;
  v10 = "maximum interfaces per vm reached";
  while (1)
  {
    v9 = (uint64_t *)*v9;
    if (!v9)
      break;
    if (*((_DWORD *)v9 + 88) == *(_DWORD *)(a1 + 352))
    {
      if (v9[3])
        ++v8;
    }
    if (v8 == 10)
      goto LABEL_10;
  }
  if (dword_1000354D0 == 128)
  {
    v10 = "maximum interfaces for vm";
LABEL_10:
    sub_100003108(0, (uint64_t)v10, a3, a4, a5, a6, a7, a8, vars0);
    return 0;
  }
  return 1;
}

uint64_t sub_10000B844(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _DWORD *v15;
  uint64_t v16;
  int v17;
  const char *v19;

  if (a2 - 7 <= 0xFFFFFFFA)
    sub_100022544();
  v12 = a2;
  if (a3 != 0xFFFFFFFFLL)
  {
    v13 = a1 + 8 * a2;
    v14 = *(_QWORD **)(v13 + 424);
    if (v14)
    {
      while (*v14 != a3)
      {
        v14 = (_QWORD *)v14[2];
        if (!v14)
          goto LABEL_6;
      }
      v19 = "duplicate device ID found on the list.";
      LOBYTE(v15) = 0;
      return sub_100003108(v15, (uint64_t)v19, a3, a4, a5, a6, a7, a8, a9);
    }
LABEL_6:
    v15 = malloc_type_malloc(0x18uLL, 0x10200406E52F545uLL);
    if (!v15)
    {
      v19 = "failed to allocate memory.";
      return sub_100003108(v15, (uint64_t)v19, a3, a4, a5, a6, a7, a8, a9);
    }
    *(_QWORD *)v15 = a3;
    v15[2] = a2;
    *((_QWORD *)v15 + 2) = *(_QWORD *)(v13 + 424);
    *(_QWORD *)(v13 + 424) = v15;
  }
  v16 = a1 + 4 * v12;
  v17 = *(_DWORD *)(v16 + 480);
  *(_DWORD *)(v16 + 480) = v17 + 1;
  if (v17 == -1)
    sub_10002256C();
  return sub_100014DA0(a2, 1);
}

void sub_10000B938(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  int v14;

  if (a2 - 7 <= 0xFFFFFFFA)
    sub_100022594();
  v5 = a2;
  if (a3 != 0xFFFFFFFFLL)
  {
    v6 = a1 + 8 * a2;
    v7 = *(_QWORD **)(v6 + 424);
    if (!v7)
      return;
    v8 = (_QWORD *)(v6 + 424);
    v9 = v7;
    while (*v9 != a3)
    {
      v9 = (_QWORD *)v9[2];
      if (!v9)
        return;
    }
    if (v7 != v9)
    {
      do
      {
        v10 = v7;
        v7 = (_QWORD *)v7[2];
      }
      while (v7 != v9);
      v8 = v10 + 2;
      v7 = v9;
    }
    *v8 = v7[2];
    sub_10000357C(a3);
    free(v9);
  }
  v11 = a1 + 4 * v5;
  v12 = *(_DWORD *)(v11 + 480);
  v13 = __OFSUB__(v12, 1);
  v14 = v12 - 1;
  if (v14 < 0 == v13)
  {
    *(_DWORD *)(v11 + 480) = v14;
    sub_100014DF0(a2, 1u);
  }
}

uint64_t sub_10000BA14(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  *a2 = sub_100014D94();
  result = sub_100014E40();
  *a3 = result;
  return result;
}

uint64_t sub_10000BA44(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int v4;

  if (a2 - 7 <= 0xFFFFFFFA)
    sub_1000225BC();
  v3 = a1 + 4 * a2;
  v4 = *(_DWORD *)(v3 + 480);
  *(_DWORD *)(v3 + 480) = a3;
  if (v4 >= a3)
  {
    if (v4 > a3)
      sub_100014DF0(a2, v4 - a3);
  }
  else
  {
    sub_100014DA0(a2, a3 - v4);
  }
  return 1;
}

uint64_t sub_10000BAA0(uint64_t result)
{
  ++*(_DWORD *)(result + 8);
  return result;
}

uint64_t sub_10000BAB0(uint64_t a1, const char *a2)
{
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD);

  result = snprintf((char *)(a1 + 308), 0x100uLL, "%s", a2);
  v4 = *(uint64_t (**)(uint64_t, _QWORD))(a1 + 632);
  if (v4)
    return v4(a1, 0);
  return result;
}

uint64_t sub_10000BB0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDataRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFDataRef v17;
  __CFDictionary *Mutable;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFDictionary *v25;
  int v26;
  __CFDictionary *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFDictionary *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  const char *v43;
  __CFDictionary *v44;
  uint64_t v45;
  uint64_t v47;
  UInt8 bytes[4];
  __int16 v49;

  v49 = 0;
  *(_DWORD *)bytes = 0;
  v2 = sub_1000153D8((uint64_t)bytes);
  if ((_DWORD)v2)
  {
    v9 = v2;
    sub_100003108(0, (uint64_t)"error getting mac address for interface", v3, v4, v5, v6, v7, v8, v47);
    goto LABEL_18;
  }
  *(_DWORD *)(a1 + 15) = *(_DWORD *)bytes;
  *(_WORD *)(a1 + 19) = v49;
  v10 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
  if (!v10)
  {
    sub_100003108(0, (uint64_t)"client %p, CFDataCreate() failed", v11, v12, v13, v14, v15, v16, a1);
LABEL_17:
    v9 = 12;
    goto LABEL_18;
  }
  v17 = v10;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_100003108(0, (uint64_t)"client %p, CFDictionaryCreateMutable() failed", v19, v20, v21, v22, v23, v24, a1);
    v44 = v17;
LABEL_16:
    CFRelease(v44);
    goto LABEL_17;
  }
  v25 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("EnableMultiPages"), kCFBooleanTrue);
  CFDictionarySetValue(v25, kIOEthernetHardwareAddress, v17);
  v26 = *(_DWORD *)(a1 + 72);
  if (v26)
    sub_10000BE00(v25, CFSTR("MaxTransferUnit"), v26);
  if (*(_BYTE *)(a1 + 76))
    CFDictionarySetValue(v25, CFSTR("EnableTSO"), kCFBooleanTrue);
  CFDictionarySetValue(v25, CFSTR("NamePrefix"), CFSTR("vmenet"));
  sub_10000BE00(v25, CFSTR("SubType"), 9);
  v27 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v27)
  {
    sub_100003108(0, (uint64_t)"client %p, CFDictionaryCreateMutable() failed", v28, v29, v30, v31, v32, v33, a1);
    CFRelease(v17);
    v44 = v25;
    goto LABEL_16;
  }
  v34 = v27;
  CFDictionarySetValue(v27, CFSTR("Product Name"), CFSTR("VM network interface"));
  CFDictionarySetValue(v34, kIOUserEthernetInterfaceRole, CFSTR("VMNET"));
  CFDictionarySetValue(v34, CFSTR("HiddenInterface"), kCFBooleanTrue);
  CFDictionarySetValue(v34, CFSTR("IsEphemeral"), kCFBooleanTrue);
  CFDictionarySetValue(v25, kIOUserEthernetInterfaceMergeProperties, v34);
  v35 = IOEthernetControllerCreate(kCFAllocatorDefault, v25);
  *(_QWORD *)(a1 + 24) = v35;
  if (!v35)
  {
    v9 = 12;
    v43 = "client %p, ethernet controller create failed";
    goto LABEL_22;
  }
  IOEthernetControllerSetDispatchQueue(v35, qword_100035470);
  IOEthernetControllerRegisterBSDAttachCallback(*(_QWORD *)(a1 + 24), sub_10000BE64, a1);
  v42 = 1;
  if (IOEthernetControllerSetLinkStatus(*(_QWORD *)(a1 + 24), 1))
  {
    v9 = 22;
    v43 = "client %p, ethernet controller set link status failed";
LABEL_22:
    sub_100003108(0, (uint64_t)v43, v36, v37, v38, v39, v40, v41, a1);
    v42 = 0;
    goto LABEL_24;
  }
  v9 = 0;
LABEL_24:
  CFRelease(v17);
  CFRelease(v34);
  CFRelease(v25);
  if ((v42 & 1) != 0)
    return 0;
LABEL_18:
  v45 = *(_QWORD *)(a1 + 24);
  if (v45)
  {
    IOEthernetControllerSetDispatchQueue(v45, 0);
    CFRelease(*(CFTypeRef *)(a1 + 24));
    *(_QWORD *)(a1 + 24) = 0;
  }
  return v9;
}

void sub_10000BE00(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sub_10000BE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  io_registry_entry_t IONetworkInterfaceObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *CFProperty;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int BSDSocket;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  const char *string;
  unsigned __int8 *uuid;
  const char *v55;
  const char *v56;
  const char *v57;
  const char *v58;
  const char *v59;
  int v60;
  char **v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  const char *v70;
  const char *v71;
  char *v72;
  int *v73;
  unsigned int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  int v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unsigned __int8 *v101;
  void *v102;
  size_t v103;
  int v104;
  int v105;
  _BYTE v106[44];
  int v107;
  _OWORD v108[6];

  v107 = 0x200000;
  memset(v106, 0, sizeof(v106));
  v105 = 0;
  v8 = (_QWORD *)qword_1000354C8;
  if (!qword_1000354C8)
  {
LABEL_7:
    sub_100003108(0, (uint64_t)"%s: failed to find mis_client", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_vmnet_interface_attached_callback");
    return;
  }
  memset(v108, 0, sizeof(v108));
  while (v8 != (_QWORD *)a2 || !*(_QWORD *)(a2 + 24) || !*(_QWORD *)(a2 + 64))
  {
    v8 = (_QWORD *)*v8;
    if (!v8)
      goto LABEL_7;
  }
  IONetworkInterfaceObject = IOEthernetControllerGetIONetworkInterfaceObject();
  if (!IONetworkInterfaceObject)
  {
    sub_100003108(0, (uint64_t)"client %p, getting network io object failed", v11, v12, v13, v14, v15, v16, a2);
    goto LABEL_34;
  }
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(IONetworkInterfaceObject, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    sub_100003108(0, (uint64_t)"client %p, getting bsd name failed", v18, v19, v20, v21, v22, v23, a2);
    goto LABEL_34;
  }
  v24 = CFProperty;
  CFStringGetCString(CFProperty, (char *)(a2 + 32), 16, 0x600u);
  sub_100003108(2u, (uint64_t)"client %p bsd name %s", v25, v26, v27, v28, v29, v30, a2);
  CFRelease(v24);
  BSDSocket = IOEthernetControllerGetBSDSocket(*(_QWORD *)(a2 + 24));
  *(_DWORD *)(a2 + 52) = BSDSocket;
  if (BSDSocket < 0)
  {
    sub_100003108(0, (uint64_t)"client %p, unable to get socket", v32, v33, v34, v35, v36, v37, a2);
    goto LABEL_34;
  }
  if (setsockopt(BSDSocket, 0xFFFF, 4097, &v107, 4u) != -1)
  {
LABEL_12:
    if (setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4098, &v107, 4u) != -1)
    {
      v44 = malloc_type_malloc(0x28uLL, 0x10A0040D1175C0DuLL);
      if (v44)
      {
        v51 = v44;
        memset((char *)v108 + 4, 0, 92);
        LODWORD(v108[0]) = 501;
        v52 = *(_DWORD *)(a2 + 48);
        if (v52 == 201)
        {
          LODWORD(v108[0]) = 500;
          string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CD8[0]);
          if (string)
          {
            __strlcpy_chk((char *)v108 + 4, string, 46, 46);
            BYTE2(v108[3]) = 64;
            xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CD8[0], 0);
          }
          v52 = *(_DWORD *)(a2 + 48);
        }
        v102 = v51;
        if (v52 == 202)
        {
          uuid = (unsigned __int8 *)xpc_dictionary_get_uuid(*(xpc_object_t *)(a2 + 64), off_100034CE0[0]);
          if (uuid)
          {
            v55 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CE8[0]);
            v56 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CA0[0]);
            if (v55)
            {
              v57 = v56;
              if (!v56)
                sub_10002260C();
              inet_pton(2, v55, &v106[32]);
              inet_pton(2, v57, &v106[36]);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CE8[0], 0);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CA0[0], 0);
            }
            v58 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CF0[0]);
            if (v58)
            {
              inet_pton(30, v58, v106);
              xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CF0[0], 0);
            }
          }
        }
        else
        {
          uuid = 0;
        }
        v69 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C90[0]);
        v70 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C98[0]);
        v71 = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034CA0[0]);
        v72 = (char *)xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 64), off_100034C20[0]);
        if (*(_BYTE *)(a2 + 8))
          v73 = (int *)(a2 + 9);
        else
          v73 = 0;
        v74 = *(_DWORD *)(a2 + 72);
        if (v74)
          v75 = v74;
        else
          v75 = 1500;
        v76 = *(unsigned __int8 *)(a2 + 78);
        if (*(_BYTE *)(a2 + 79))
          v76 |= 2u;
        if (*(unsigned __int8 *)(a2 + 77) | *(_DWORD *)(a2 + 508) & 8)
          v77 = 304;
        else
          v77 = 302;
        v84 = sub_1000071C4(*(_DWORD *)(a2 + 48), v77, v72, (char *)(a2 + 32), 2, v75, 0, v73, uuid, (__int128 *)v106, v69, v70, v71, 2, v108, v76, &v105);
        if (v69)
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C90[0], 0);
        if (v70)
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C98[0], 0);
        if (v71)
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CA0[0], 0);
        if (v72)
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034C20[0], 0);
        if (uuid)
          xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 64), off_100034CE0[0], 0);
        if (v84)
        {
          v85 = sub_100008C2C((uint64_t)v84, a2, v78, v79, v80, v81, v82, v83);
          if (v85 == 36)
          {
            sub_10000418C((uint64_t)v102, *(_QWORD *)(a2 + 56), *(_QWORD *)(a2 + 64), (uint64_t)v84, *(_DWORD *)(a2 + 52));
            sub_100003108(2u, (uint64_t)"reply enqueued %p for interface %s", v94, v95, v96, v97, v98, v99, (uint64_t)v102);
            goto LABEL_37;
          }
          v60 = v85;
          if (v85)
          {
            sub_100006D68((uint64_t)v84, v86, v87, v88, v89, v90, v91, v92);
          }
          else
          {
            xpc_dictionary_set_string(*(xpc_object_t *)(a2 + 64), off_100034C10[0], v84 + 20);
            xpc_dictionary_set_fd(*(xpc_object_t *)(a2 + 64), off_100034BB8[0], *(_DWORD *)(a2 + 52));
            if (*(_DWORD *)(a2 + 48) != 204)
            {
              v93 = *((_QWORD *)v84 + 36);
              if (v93)
                sub_1000109CC(*(void **)(a2 + 64), v93);
            }
            xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100034C80[0], (int)v75);
            v60 = 0;
          }
        }
        else
        {
          sub_100003108(0, (uint64_t)"unable to create service for %s", v78, v79, v80, v81, v82, v83, a2 + 32);
          v60 = v105;
          if (!v105)
            sub_1000225E4();
        }
        free(v102);
        goto LABEL_74;
      }
      sub_100003108(0, (uint64_t)"unable to create reply service object", v45, v46, v47, v48, v49, v50, (uint64_t)v101);
LABEL_34:
      v61 = off_100034BF8;
      v62 = 2000;
      goto LABEL_35;
    }
    v101 = (unsigned __int8 *)a2;
    v59 = "client %p, set SO_RCVBUF failed";
    goto LABEL_31;
  }
  v104 = 0;
  v103 = 4;
  if (!sysctlbyname("kern.ipc.maxsockbuf", &v104, &v103, 0, 0))
  {
    v107 = v104;
    if (setsockopt(*(_DWORD *)(a2 + 52), 0xFFFF, 4097, &v107, 4u) == -1)
    {
      sub_100003108(0, (uint64_t)"client %p, set SO_SNDBUF failed", v63, v64, v65, v66, v67, v68, a2);
      goto LABEL_32;
    }
    goto LABEL_12;
  }
  v59 = "sysctl kern.ipc.maxsockbuf failed";
LABEL_31:
  sub_100003108(0, (uint64_t)v59, v38, v39, v40, v41, v42, v43, (uint64_t)v101);
LABEL_32:
  v60 = *__error();
LABEL_74:
  if (v60)
    v100 = 2000;
  else
    v100 = 2001;
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), off_100034BF8[0], v100);
  if (v60 != 16)
    goto LABEL_36;
  v61 = off_100034BE8;
  v62 = 6000;
LABEL_35:
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a2 + 64), *v61, v62);
LABEL_36:
  sub_1000042FC(*(_xpc_connection_s **)(a2 + 56), *(xpc_object_t *)(a2 + 64));
  xpc_release(*(xpc_object_t *)(a2 + 64));
LABEL_37:
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
}

uint64_t sub_10000C514(const char *a1)
{
  ifaddrs *v2;
  uint64_t v3;
  sockaddr *ifa_addr;
  int sa_family;
  BOOL v6;
  in_addr v7;
  char *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  __int128 v44;
  in_addr_t v45;
  ifaddrs *v46;
  char v47[46];
  char __str[16];

  v46 = 0;
  v45 = 0;
  v44 = 0uLL;
  if (getifaddrs(&v46) < 0)
  {
    v3 = *__error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v36, v37, v38, v39, v40, v41, v43);
LABEL_24:
    if (v46)
      freeifaddrs(v46);
  }
  else
  {
    v2 = v46;
    if (v46)
    {
      v3 = 0;
      while (1)
      {
        ifa_addr = v2->ifa_addr;
        if (!ifa_addr)
          goto LABEL_21;
        sa_family = ifa_addr->sa_family;
        v6 = sa_family == 30 || sa_family == 2;
        if (!v6 || strncmp(a1, v2->ifa_name, 0x10uLL))
          goto LABEL_21;
        if (sa_family == 2)
        {
          v45 = *(_DWORD *)&ifa_addr->sa_data[2];
          v7.s_addr = v45;
          v8 = inet_ntoa(v7);
          snprintf(__str, 0x10uLL, "%s", v8);
          v9 = sub_10000C6F0(a1, &v45);
          if (v9)
          {
            v16 = v9;
            strerror(v9);
            sub_100003108(0, (uint64_t)"mis_difaddr(%s,%s): %s", v17, v18, v19, v20, v21, v22, (uint64_t)a1);
            goto LABEL_16;
          }
          sub_100003108(0, (uint64_t)"removed addr=%s on %s", v10, v11, v12, v13, v14, v15, (uint64_t)__str);
        }
        else
        {
          v44 = *(_OWORD *)&ifa_addr->sa_data[6];
          inet_ntop(30, &v44, v47, 0x2Eu);
          v23 = sub_10000C814(a1, &v44);
          if (v23)
          {
            v16 = v23;
            strerror(v23);
            sub_100003108(0, (uint64_t)"mis_difaddr6(%s,%s): %s", v30, v31, v32, v33, v34, v35, (uint64_t)a1);
LABEL_16:
            if ((_DWORD)v3)
              v3 = v3;
            else
              v3 = v16;
            goto LABEL_21;
          }
          sub_100003108(0, (uint64_t)"removed addr=%s on %s", v24, v25, v26, v27, v28, v29, (uint64_t)v47);
        }
LABEL_21:
        v2 = v2->ifa_next;
        if (!v2)
          goto LABEL_24;
      }
    }
    return 0;
  }
  return v3;
}

uint64_t sub_10000C6F0(const char *a1, _DWORD *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __dst[16];
  uint64_t v25;
  uint64_t v26;

  v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    sub_100003108(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }
  else
  {
    v5 = v4;
    v25 = 0;
    v26 = 0;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v25) = 528;
      HIDWORD(v25) = *a2;
    }
    if (ioctl(v5, 0x80206919uLL, __dst) == -1)
    {
      v6 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      sub_100003108(0, (uint64_t)"SIOCDIFADDR: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
    else
    {
      v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000C814(const char *a1, _OWORD *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __dst[48];
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

  v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    sub_100003108(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }
  else
  {
    v5 = v4;
    v39 = 0u;
    v38 = 0u;
    v37 = 0u;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&__dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }
    if (ioctl(v5, 0x81206919uLL, __dst) == -1)
    {
      v6 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      sub_100003108(0, (uint64_t)"SIOCDIFADDR_IN6: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
    else
    {
      v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000C98C(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int *v9;
  int *v10;
  int v11;
  uint64_t v12;
  int *v13;
  int v14;
  uint64_t v15;
  int *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v26;
  size_t v27;
  int v28;
  int buffer[2];

  *(_QWORD *)buffer = 0x600000001;
  v28 = 0;
  v27 = 4;
  if (sysctl(buffer, 2u, &v28, &v27, 0, 0) < 0)
  {
    v16 = __error();
    v17 = strerror(*v16);
    sub_100003108(0, (uint64_t)"failed to get max proc count (%s)", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    goto LABEL_11;
  }
  if (!v28)
  {
LABEL_11:
    v24 = "no current processes";
    LOBYTE(v9) = 2;
LABEL_12:
    sub_100003108(v9, (uint64_t)v24, v2, v3, v4, v5, v6, v7, v26);
    return 0;
  }
  v8 = 4 * v28;
  v9 = (int *)malloc_type_malloc(4 * v28, 0xFCF8E920uLL);
  if (!v9)
  {
    v24 = "malloc() failed";
    goto LABEL_12;
  }
  v10 = v9;
  v11 = proc_listallpids(v9, v8);
  if (v11 < 1)
  {
LABEL_9:
    v15 = 0;
  }
  else
  {
    v12 = v11;
    v13 = v10;
    while (1)
    {
      v14 = proc_pidpath(*v13, buffer, 0x400u);
      if (v14 >= 1)
      {
        *((_BYTE *)buffer + v14) = 0;
        if (!strncmp((const char *)buffer, a1, 0x400uLL))
          break;
      }
      ++v13;
      if (!--v12)
        goto LABEL_9;
    }
    v15 = *v13;
  }
  free(v10);
  return v15;
}

BOOL sub_10000CAFC(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD v10[2];

  if (a1)
  {
    HIDWORD(v10[0]) = 0;
    v10[1] = 0;
    return inet_pton(2, a1, (char *)v10 + 4) != 0;
  }
  else
  {
    sub_100003108(0, (uint64_t)"ip address string is NULL", a3, a4, a5, a6, a7, a8, v9);
    return 0;
  }
}

BOOL sub_10000CB78(unsigned int a1)
{
  int v1;
  int v2;
  unsigned int v3;

  v1 = 0;
  v2 = 0;
  v3 = bswap32(a1);
  while (v1 != 1)
  {
    v1 = (v3 >> v2) & 1;
LABEL_6:
    if (++v2 == 32)
      return v1 != 0;
  }
  if (((v3 >> v2) & 1) != 0)
  {
    v1 = 1;
    goto LABEL_6;
  }
  return 0;
}

BOOL sub_10000CBC8(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  _QWORD v10[2];
  int v11;

  if (a1)
  {
    v10[0] = 0;
    v11 = 0;
    v10[1] = 0;
    return inet_pton(30, a1, v10) != 0;
  }
  else
  {
    sub_100003108(0, (uint64_t)"ipv6 address string is NULL", a3, a4, a5, a6, a7, a8, v9);
    return 0;
  }
}

uint64_t sub_10000CC20(uint64_t a1, int a2)
{
  int v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  v23 = 0u;
  v24 = 0u;
  v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    v6 = *__error();
    sub_100003108(0, (uint64_t)"socket: %m", v7, v8, v9, v10, v11, v12, v22);
    if (v4 == -1)
      return v6;
    goto LABEL_12;
  }
  v23 = 0u;
  v24 = 0u;
  if ((unint64_t)__strlcpy_chk(&v23, a1, 16, 16) > 0xF)
  {
    v5 = "strlcpy: %s";
LABEL_11:
    v6 = *__error();
    v13 = __error();
    v14 = strerror(*v13);
    sub_100003108(0, (uint64_t)v5, v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    goto LABEL_12;
  }
  if (ioctl(v4, 0xC0206911uLL, &v23) < 0)
  {
    v5 = "SIOCGIFFLAGS: %s";
    goto LABEL_11;
  }
  LOWORD(v24) = v24 | a2 & ~(unsigned __int16)(a2 >> 31);
  if (ioctl(v4, 0x80206910uLL, &v23) < 0)
  {
    v5 = "SIOCSIFFLAGS: %s";
    goto LABEL_11;
  }
  v6 = 0;
LABEL_12:
  close(v4);
  return v6;
}

uint64_t sub_10000CD84(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  __int16 v26;

  if (!a1)
    sub_100022634();
  if (!*a1)
    sub_10002265C();
  v26 = 0;
  v2 = sub_10000CC20((uint64_t)a1, -1);
  v3 = v2;
  if ((_DWORD)v2)
  {
    v4 = strerror(v2);
    sub_100003108(0, (uint64_t)"setifflags: %s", v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }
  sub_10000A9A4(a1, (Boolean *)&v26 + 1, (Boolean *)&v26);
  if (HIBYTE(v26))
  {
    v11 = sub_10000CE6C(a1);
    v3 = v11;
    if ((_DWORD)v11)
    {
      strerror(v11);
      sub_100003108(0, (uint64_t)"protoattach failed (%s): %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    }
  }
  if ((_BYTE)v26)
  {
    v18 = sub_10000D010(a1);
    v3 = v18;
    if ((_DWORD)v18)
    {
      strerror(v18);
      sub_100003108(0, (uint64_t)"protoattach6 failed (%s): %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
    }
  }
  return v3;
}

uint64_t sub_10000CE6C(_BYTE *a1)
{
  int v2;
  int v3;
  uint64_t v4;
  const char *v5;
  int *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  char *v15;
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
  int *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;

  if (!a1)
    sub_100022684();
  if (!*a1)
    sub_1000226AC();
  v37 = 0u;
  v38 = 0u;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    v14 = __error();
    v15 = strerror(*v14);
    sub_100003108(0, (uint64_t)"socket: %s", v16, v17, v18, v19, v20, v21, (uint64_t)v15);
    v4 = *__error();
    goto LABEL_13;
  }
  v3 = v2;
  v37 = 0u;
  v38 = 0u;
  if ((unint64_t)__strlcpy_chk(&v37, a1, 16, 16) >= 0x10)
  {
    v4 = *__error();
    v5 = "strlcpy: %s";
LABEL_6:
    v6 = __error();
    v7 = strerror(*v6);
    sub_100003108(0, (uint64_t)v5, v8, v9, v10, v11, v12, v13, (uint64_t)v7);
    goto LABEL_11;
  }
  if (ioctl(v3, 0xC0206950uLL, &v37) == -1 && *__error() != 17)
  {
    v4 = *__error();
    if ((_DWORD)v4)
    {
      v5 = "SIOCPROTOATTACH: %s";
      goto LABEL_6;
    }
  }
  else
  {
    v4 = 0;
  }
LABEL_11:
  if (close(v3))
  {
    v28 = __error();
    v4 = *v28;
    v29 = strerror(*v28);
    sub_100003108(0, (uint64_t)"close: %s", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
  }
LABEL_13:
  if (!(_DWORD)v4)
    sub_100003108(1u, (uint64_t)"attached IPv4 protocol on %s", v22, v23, v24, v25, v26, v27, (uint64_t)a1);
  return v4;
}

uint64_t sub_10000D010(_BYTE *a1)
{
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v26;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  if (!a1)
    sub_1000226D4();
  if (!*a1)
    sub_1000226FC();
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
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    v10 = *__error();
    v18 = "socket: %m";
    goto LABEL_13;
  }
  v3 = v2;
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
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  if ((unint64_t)__strlcpy_chk(&v27, a1, 16, 16) < 0x10)
  {
    v26 = &v27;
    if (ioctl(v3, 0xC080696EuLL) != -1 || *__error() == 17)
    {
      v10 = 0;
      goto LABEL_11;
    }
    v10 = *__error();
    if (!(_DWORD)v10)
      goto LABEL_11;
    v11 = "SIOCPROTOATTACH_IN6: %m";
  }
  else
  {
    v10 = *__error();
    v11 = "strlcpy: %m";
  }
  sub_100003108(0, (uint64_t)v11, v4, v5, v6, v7, v8, v9, (uint64_t)v26);
LABEL_11:
  if (!close(v3))
    goto LABEL_14;
  v10 = *__error();
  v18 = "close: %m";
LABEL_13:
  sub_100003108(0, (uint64_t)v18, v12, v13, v14, v15, v16, v17, (uint64_t)v26);
LABEL_14:
  if (!(_DWORD)v10)
    sub_100003108(1u, (uint64_t)"attached IPv6 protocol on %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
  return v10;
}

uint64_t sub_10000D1BC(char *a1, int a2, int a3, char a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int16 v63;

  if (!a1)
    sub_100022724();
  if (!*a1)
    sub_10002274C();
  v63 = 0;
  v8 = sub_10000C514(a1);
  v9 = v8;
  if ((_DWORD)v8)
  {
    strerror(v8);
    sub_100003108(0, (uint64_t)"remove_addrs(%s): %s", v10, v11, v12, v13, v14, v15, (uint64_t)a1);
  }
  if ((a4 & 1) == 0)
  {
    v16 = sub_10000CC20((uint64_t)a1, -1);
    v9 = v16;
    if ((_DWORD)v16)
    {
      v17 = strerror(v16);
      sub_100003108(0, (uint64_t)"setifflags: %s", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
    }
  }
  sub_10000A9A4(a1, (Boolean *)&v63 + 1, (Boolean *)&v63);
  v24 = HIBYTE(v63);
  if (HIBYTE(v63))
  {
    if ((a4 & 1) == 0)
    {
      v25 = sub_10000CE6C(a1);
      v9 = v25;
      if ((_DWORD)v25)
      {
        strerror(v25);
        sub_100003108(0, (uint64_t)"protoattach(%s): %s", v26, v27, v28, v29, v30, v31, (uint64_t)a1);
      }
    }
  }
  v32 = v63;
  if (a2 && (_BYTE)v63)
  {
    v33 = sub_10000D39C(a1);
    if (v33)
    {
      strerror(v33);
      sub_100003108(0, (uint64_t)"mis_autoconf_start(%s): %s", v34, v35, v36, v37, v38, v39, (uint64_t)a1);
    }
    v40 = sub_10000D4F4(a1);
    v9 = v40;
    if ((_DWORD)v40)
    {
      strerror(v40);
      sub_100003108(0, (uint64_t)"mis_ll_start(%s): %s", v41, v42, v43, v44, v45, v46, (uint64_t)a1);
    }
    if ((a4 & 1) == 0)
    {
      v47 = sub_10000D010(a1);
      v9 = v47;
      if ((_DWORD)v47)
      {
        strerror(v47);
        sub_100003108(0, (uint64_t)"protoattach6(%s): %s", v48, v49, v50, v51, v52, v53, (uint64_t)a1);
      }
    }
  }
  if (a3)
    sub_10000D61C(a1, 1);
  if (v24 || v32)
  {
    v54 = sub_10000CC20((uint64_t)a1, 1);
    v9 = v54;
    if ((_DWORD)v54)
    {
      v55 = strerror(v54);
      sub_100003108(0, (uint64_t)"setifflags: %s", v56, v57, v58, v59, v60, v61, (uint64_t)v55);
    }
  }
  return v9;
}

uint64_t sub_10000D39C(const char *a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char __dst;
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

  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    v5 = __error();
    v6 = strerror(*v5);
    sub_100003108(0, (uint64_t)"socket: %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    return *__error();
  }
  else
  {
    v3 = v2;
    v39 = 0u;
    v38 = 0u;
    v37 = 0u;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC1206984uLL, &__dst) == -1)
    {
      v4 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      sub_100003108(0, (uint64_t)"SIOCAUTOCONF_START: %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }
    else
    {
      v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_10000D4F4(const char *a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char __dst[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    v5 = __error();
    v6 = strerror(*v5);
    sub_100003108(0, (uint64_t)"socket: %s", v7, v8, v9, v10, v11, v12, (uint64_t)v6);
    return *__error();
  }
  else
  {
    v3 = v2;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (ioctl(v3, 0xC0806982uLL, __dst) == -1)
    {
      v4 = *__error();
      v13 = __error();
      v14 = strerror(*v13);
      sub_100003108(0, (uint64_t)"SIOCLL_START: %s", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
    }
    else
    {
      v4 = 0;
    }
    close(v3);
  }
  return v4;
}

uint64_t sub_10000D61C(const char *a1, int a2)
{
  const __SCPreferences *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __SCPreferences *v11;
  const __SCNetworkService *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __SCNetworkService *v19;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;

  v4 = SCPreferencesCreate(0, CFSTR("com.apple.MobileInternetSharing"), 0);
  if (v4)
  {
    v11 = v4;
    v12 = (const __SCNetworkService *)sub_10000AAF0(v4, a1);
    if (!v12)
    {
      sub_100003108(0, (uint64_t)"Failed to find network service for %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      v39 = 0xFFFFFFFFLL;
LABEL_18:
      CFRelease(v11);
      return v39;
    }
    v19 = v12;
    if (SCNetworkServiceGetEnabled(v12) == a2)
      goto LABEL_10;
    if (SCNetworkServiceSetEnabled(v19, a2))
    {
      if (SCPreferencesCommitChanges(v11))
      {
        if (SCPreferencesApplyChanges(v11))
        {
          v38 = "disabled";
          if (a2)
            v38 = "enabled";
          sub_100003108(1u, (uint64_t)"network service status changed to %s for %s", v32, v33, v34, v35, v36, v37, (uint64_t)v38);
LABEL_10:
          v39 = 0;
LABEL_17:
          CFRelease(v19);
          goto LABEL_18;
        }
        sub_100003108(0, (uint64_t)"SCPreferencesApplyChanges for %s failed", v32, v33, v34, v35, v36, v37, (uint64_t)a1);
      }
      else
      {
        sub_100003108(0, (uint64_t)"SCPreferencesCommitChanges for %s failed", v26, v27, v28, v29, v30, v31, (uint64_t)a1);
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"SCNetworkServiceSetEnabled for %s failed", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
    }
    v39 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  sub_100003108(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v5, v6, v7, v8, v9, v10, (uint64_t)a1);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000D758(char *a1, int a2, char a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  if (!a1)
    sub_100022774();
  if (!*a1)
    sub_10002279C();
  if (a2)
    sub_10000D61C(a1, 0);
  v5 = sub_10000C514(a1);
  if (v5)
  {
    strerror(v5);
    sub_100003108(0, (uint64_t)"remove_addrs(%s): %s", v6, v7, v8, v9, v10, v11, (uint64_t)a1);
  }
  if ((a3 & 1) == 0)
  {
    v12 = sub_10000D894(a1);
    if (v12)
    {
      strerror(v12);
      sub_100003108(0, (uint64_t)"protodetach(%s): %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
    }
  }
  v19 = sub_10000D9F0(a1);
  if (v19)
  {
    strerror(v19);
    sub_100003108(0, (uint64_t)"mis_autoconf_stop(%s): %s", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
  }
  v26 = sub_10000DB28(a1);
  if (v26)
  {
    strerror(v26);
    sub_100003108(0, (uint64_t)"mis_ll_stop(%s): %s", v27, v28, v29, v30, v31, v32, (uint64_t)a1);
  }
  if ((a3 & 1) == 0)
  {
    v33 = sub_10000DC60(a1);
    if (v33)
    {
      strerror(v33);
      sub_100003108(0, (uint64_t)"protodetach6(%s): %s", v34, v35, v36, v37, v38, v39, (uint64_t)a1);
    }
  }
  v40 = sub_10000CC20((uint64_t)a1, -1);
  v41 = v40;
  if ((_DWORD)v40)
  {
    v42 = strerror(v40);
    sub_100003108(0, (uint64_t)"setifflags: %s", v43, v44, v45, v46, v47, v48, (uint64_t)v42);
  }
  return v41;
}

uint64_t sub_10000D894(_BYTE *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v31;
  __int128 v32;
  __int128 v33;

  if (!a1)
    sub_1000227C4();
  if (!*a1)
    sub_1000227EC();
  v32 = 0u;
  v33 = 0u;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    sub_100003108(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, (uint64_t)v31);
    v17 = *__error();
    goto LABEL_13;
  }
  v9 = v2;
  v32 = 0u;
  v33 = 0u;
  if ((unint64_t)__strlcpy_chk(&v32, a1, 16, 16) <= 0xF)
  {
    v31 = &v32;
    if (ioctl(v9, 0xC0206951uLL) != -1)
    {
      v17 = 0;
      goto LABEL_11;
    }
    v10 = "SIOCPROTODETACH: %m";
  }
  else
  {
    v10 = "strlcpy: %m";
  }
  v17 = *__error();
  sub_100003108(0, (uint64_t)v10, v18, v19, v20, v21, v22, v23, (uint64_t)v31);
LABEL_11:
  if (close(v9))
  {
    v17 = *__error();
    sub_100003108(0, (uint64_t)"close: %m", v24, v25, v26, v27, v28, v29, (uint64_t)v31);
  }
LABEL_13:
  if (!(_DWORD)v17)
    sub_100003108(1u, (uint64_t)"detached IPv4 protocol on %s", v11, v12, v13, v14, v15, v16, (uint64_t)a1);
  return v17;
}

uint64_t sub_10000D9F0(const char *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char __dst;
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

  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_100003108(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v18);
    return *__error();
  }
  else
  {
    v9 = v2;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v9, 0xC1206985uLL) == -1)
    {
      v10 = *__error();
      sub_100003108(0, (uint64_t)"SIOCAUTOCONF_STOP: %m", v11, v12, v13, v14, v15, v16, (uint64_t)&__dst);
    }
    else
    {
      v10 = 0;
    }
    close(v9);
  }
  return v10;
}

uint64_t sub_10000DB28(const char *a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char __dst;
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

  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    sub_100003108(0, (uint64_t)"socket: %m", v3, v4, v5, v6, v7, v8, v18);
    return *__error();
  }
  else
  {
    v9 = v2;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    v24 = 0u;
    v23 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    if (ioctl(v9, 0xC1206983uLL) == -1)
    {
      v10 = *__error();
      sub_100003108(0, (uint64_t)"SIOCLL_STOP: %m", v11, v12, v13, v14, v15, v16, (uint64_t)&__dst);
    }
    else
    {
      v10 = 0;
    }
    close(v9);
  }
  return v10;
}

uint64_t sub_10000DC60(_BYTE *a1)
{
  int v2;
  int v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
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
  __int128 *v26;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;

  if (!a1)
    sub_100022814();
  if (!*a1)
    sub_10002283C();
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
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = socket(30, 2, 0);
  if (v2 < 0)
  {
    v11 = *__error();
    v12 = "socket: %m";
    goto LABEL_13;
  }
  v3 = v2;
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
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  if ((unint64_t)__strlcpy_chk(&v27, a1, 16, 16) > 0xF)
  {
    v4 = "strlcpy: %m";
LABEL_10:
    v11 = *__error();
    sub_100003108(0, (uint64_t)v4, v13, v14, v15, v16, v17, v18, (uint64_t)v26);
    goto LABEL_11;
  }
  v26 = &v27;
  if (ioctl(v3, 0xC120696FuLL) == -1)
  {
    v4 = "SIOCPROTODETACH: %m";
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:
  if (!close(v3))
    goto LABEL_14;
  v11 = *__error();
  v12 = "close: %m";
LABEL_13:
  sub_100003108(0, (uint64_t)v12, v5, v6, v7, v8, v9, v10, (uint64_t)v26);
LABEL_14:
  if (!(_DWORD)v11)
    sub_100003108(1u, (uint64_t)"detached IPv6 protocol on %s", v19, v20, v21, v22, v23, v24, (uint64_t)a1);
  return v11;
}

uint64_t sub_10000DDFC(_BYTE *a1)
{
  int v2;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a1)
    sub_100022864();
  if (!*a1)
    sub_10002288C();
  v2 = sub_10000D894(a1);
  if (v2)
  {
    strerror(v2);
    sub_100003108(0, (uint64_t)"protodetach(%s): %s", v3, v4, v5, v6, v7, v8, (uint64_t)a1);
  }
  v9 = sub_10000DC60(a1);
  v10 = v9;
  if ((_DWORD)v9)
  {
    strerror(v9);
    sub_100003108(0, (uint64_t)"protodetach6(%s): %s", v11, v12, v13, v14, v15, v16, (uint64_t)a1);
  }
  return v10;
}

uint64_t sub_10000DE88(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ifaddrs **v10;
  uint64_t v11;
  ifaddrs *v12;

  v12 = 0;
  if (!a1 || !*a1)
    sub_1000228B4();
  if (getifaddrs(&v12))
  {
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v2, v3, v4, v5, v6, v7, v11);
  }
  else
  {
    v10 = &v12;
    while (1)
    {
      v10 = (ifaddrs **)*v10;
      if (!v10)
        break;
      if (!strncmp(a1, (const char *)v10[1], 0x10uLL))
      {
        v8 = *((unsigned int *)v10 + 4);
        goto LABEL_6;
      }
    }
  }
  v8 = 0;
LABEL_6:
  if (v12)
    freeifaddrs(v12);
  return v8;
}

uint64_t sub_10000DF18(_BYTE *a1, int a2)
{
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  unsigned int v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  __int128 v29;
  __int128 v30;

  if (!a1)
    sub_1000228DC();
  if (!*a1)
    sub_100022904();
  v29 = 0u;
  v30 = 0u;
  v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    v6 = *__error();
    sub_100003108(0, (uint64_t)"socket: %m", v13, v14, v15, v16, v17, v18, v28);
    if (!(_DWORD)v6)
      return v6;
    goto LABEL_14;
  }
  v5 = v4;
  v29 = 0u;
  v30 = 0u;
  if ((unint64_t)__strlcpy_chk(&v29, a1, 16, 16) < 0x10)
  {
    LODWORD(v30) = a2;
    if (ioctl(v5, 0x80206934uLL, &v29) == -1)
    {
      v19 = *__error();
      if (sub_1000079EC(a1) == a2)
        v6 = 0;
      else
        v6 = v19;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = *__error();
    sub_100003108(0, (uint64_t)"strlcpy: %m", v7, v8, v9, v10, v11, v12, v28);
  }
  close(v5);
  if ((_DWORD)v6)
  {
LABEL_14:
    v20 = strerror(v6);
    sub_100003108(0, (uint64_t)"SIOCSIFMTU: %s %d", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
  }
  return v6;
}

uint64_t sub_10000E078(const char *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  char __dst[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    sub_100003108(0, (uint64_t)"socket: %m", v9, v10, v11, v12, v13, v14, v24);
    return *__error();
  }
  else
  {
    v15 = v8;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      LOWORD(v27) = 528;
      DWORD1(v27) = *a2;
    }
    if (a3)
    {
      LOWORD(v29) = 528;
      DWORD1(v29) = *a3;
    }
    if (a4 || a2 && (a4 = a2, (sub_10000DE88(a1) & 0x10) != 0))
    {
      LOWORD(v28) = 528;
      DWORD1(v28) = *a4;
    }
    if (ioctl(v15, 0x8040691AuLL, __dst) == -1)
    {
      v16 = *__error();
      sub_100003108(0, (uint64_t)"SIOCAIFADDR: %m", v17, v18, v19, v20, v21, v22, v25);
    }
    else
    {
      v16 = 0;
    }
    close(v15);
  }
  return v16;
}

uint64_t sub_10000E1D8(const char *a1, _OWORD *a2, __int128 *a3, int a4)
{
  int v8;
  int v9;
  uint64_t v10;
  int *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char __dst[48];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v8 = socket(30, 2, 0);
  if (v8 < 0)
  {
    v11 = __error();
    v12 = strerror(*v11);
    sub_100003108(0, (uint64_t)"socket: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    return *__error();
  }
  else
  {
    v9 = v8;
    v33 = 0;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    memset(&__dst[16], 0, 32);
    strncpy(__dst, a1, 0x10uLL);
    if (a2)
    {
      *(_WORD *)&__dst[16] = 7708;
      *(_OWORD *)&__dst[24] = *a2;
    }
    if (a3)
    {
      WORD4(v30) = 7708;
      v31 = *a3;
    }
    DWORD1(v32) = a4;
    v34 = -1;
    if (ioctl(v9, 0x8080691AuLL, __dst) == -1)
    {
      v10 = *__error();
      v19 = __error();
      v20 = strerror(*v19);
      sub_100003108(0, (uint64_t)"SIOCAIFADDR_IN6: %s", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
    }
    else
    {
      v10 = 0;
    }
    close(v9);
  }
  return v10;
}

uint64_t sub_10000E348(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ifaddrs *v9;
  sockaddr *ifa_addr;
  __uint8_t *v11;
  int v12;
  int v13;
  ifaddrs *v15;
  uint64_t v17;
  ifaddrs *v18;

  v18 = 0;
  if (getifaddrs(&v18))
  {
    v2 = *__error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v17);
  }
  else
  {
    v9 = v18;
    if (v18)
    {
      while (1)
      {
        ifa_addr = v9->ifa_addr;
        if (ifa_addr && ifa_addr->sa_family == 18 && ifa_addr->sa_data[4] == 6)
        {
          v11 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
          v12 = *((_DWORD *)v11 + 2);
          v13 = *((unsigned __int16 *)v11 + 6);
          if (*(_DWORD *)a1 == v12 && *(unsigned __int16 *)(a1 + 4) == v13)
            break;
        }
        v9 = v9->ifa_next;
        if (!v9)
        {
          v2 = 0;
          goto LABEL_13;
        }
      }
      v2 = 22;
LABEL_13:
      v15 = v18;
    }
    else
    {
      v15 = 0;
      v2 = 0;
    }
    freeifaddrs(v15);
  }
  return v2;
}

uint64_t sub_10000E410(uint64_t a1, int *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ifaddrs *v13;
  const char *v14;
  ifaddrs *v15;
  sockaddr *ifa_netmask;
  int v18;
  uint64_t v19;
  ifaddrs *v20;

  v20 = 0;
  if (!a2)
    sub_10002292C();
  if (getifaddrs(&v20))
  {
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v6, v7, v8, v9, v10, v11, v19);
    return 0;
  }
  else
  {
    v13 = v20;
    if (v20)
    {
      v14 = (const char *)(a1 + 308);
      v15 = v20;
      while (strncmp(v14, v15->ifa_name, 0x10uLL) || (v15->ifa_flags & 0x10) == 0)
      {
        v15 = v15->ifa_next;
        if (!v15)
          goto LABEL_9;
      }
      if (a3)
      {
        ifa_netmask = v15->ifa_netmask;
        if (ifa_netmask)
          v18 = *(_DWORD *)&ifa_netmask->sa_data[2];
        else
          v18 = -1;
        *a2 = v18;
      }
      v12 = 1;
    }
    else
    {
LABEL_9:
      v12 = 0;
    }
    freeifaddrs(v13);
  }
  return v12;
}

uint64_t sub_10000E4E4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ifaddrs *v9;
  ifaddrs *v10;
  sockaddr *ifa_addr;
  uint64_t v13;
  ifaddrs *v14;

  v14 = 0;
  if (!*(_BYTE *)(a1 + 308))
    sub_100022954();
  if (getifaddrs(&v14))
  {
    v2 = *__error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v3, v4, v5, v6, v7, v8, v13);
  }
  else
  {
    v9 = v14;
    if (v14)
    {
      v10 = v14;
      while (1)
      {
        if (!strncmp((const char *)(a1 + 308), v10->ifa_name, 0x10uLL))
        {
          ifa_addr = v10->ifa_addr;
          if (ifa_addr)
          {
            if (ifa_addr->sa_family == 30
              && ifa_addr->sa_data[6] == 254
              && (ifa_addr->sa_data[7] & 0xC0) == 0x80)
            {
              break;
            }
          }
        }
        v10 = v10->ifa_next;
        if (!v10)
          goto LABEL_14;
      }
      v2 = 0;
      *(sockaddr *)(a1 + 664) = *(sockaddr *)&ifa_addr->sa_data[6];
    }
    else
    {
LABEL_14:
      v2 = 6;
    }
    freeifaddrs(v9);
  }
  return v2;
}

uint64_t sub_10000E5CC(const char *a1)
{
  return sub_10000E5D4(a1, 1);
}

uint64_t sub_10000E5D4(const char *a1, int a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __dst[16];
  uint64_t v25;
  uint64_t v26;

  v4 = socket(2, 2, 0);
  if (v4 < 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    sub_100003108(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }
  else
  {
    v5 = v4;
    v25 = 0;
    v26 = 0;
    strncpy(__dst, a1, 0x10uLL);
    LODWORD(v25) = a2;
    if (ioctl(v5, 0xC020698DuLL, __dst) == -1)
    {
      v6 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      sub_100003108(0, (uint64_t)"SIOCSETROUTERMODE: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
    else
    {
      v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000E6E8(const char *a1)
{
  return sub_10000E5D4(a1, 0);
}

uint64_t sub_10000E6F0(const char *a1)
{
  return sub_10000E6F8(a1, 1);
}

uint64_t sub_10000E6F8(const char *a1, int a2)
{
  int v4;
  int v5;
  uint64_t v6;
  int *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __dst;
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
  __int128 v40;
  __int128 v41;

  v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    v7 = __error();
    v8 = strerror(*v7);
    sub_100003108(0, (uint64_t)"socket: %s", v9, v10, v11, v12, v13, v14, (uint64_t)v8);
    return *__error();
  }
  else
  {
    v5 = v4;
    v41 = 0u;
    v40 = 0u;
    v39 = 0u;
    v38 = 0u;
    v37 = 0u;
    v36 = 0u;
    v35 = 0u;
    v34 = 0u;
    v33 = 0u;
    v32 = 0u;
    v31 = 0u;
    v30 = 0u;
    v29 = 0u;
    v28 = 0u;
    v27 = 0u;
    v26 = 0u;
    v25 = 0u;
    strncpy(&__dst, a1, 0x10uLL);
    LODWORD(v25) = a2;
    if (ioctl(v5, 0xC1206988uLL, &__dst) == -1)
    {
      v6 = *__error();
      v15 = __error();
      v16 = strerror(*v15);
      sub_100003108(0, (uint64_t)"SIOCSETROUTERMODE_IN6: %s", v17, v18, v19, v20, v21, v22, (uint64_t)v16);
    }
    else
    {
      v6 = 0;
    }
    close(v5);
  }
  return v6;
}

uint64_t sub_10000E860(const char *a1)
{
  return sub_10000E6F8(a1, 0);
}

uint64_t sub_10000E868(uint64_t a1, int a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v4 = socket(30, 2, 0);
  if ((v4 & 0x80000000) == 0)
  {
    v11 = v4;
    v26 = 0;
    v24 = 0u;
    v25 = 0u;
    memset(v23, 0, sizeof(v23));
    __strlcpy_chk(v23, a1, 16, 16);
    if (ioctl(v11, 0xC030694CuLL, v23) < 0)
    {
      v14 = "SIOCGIFINFO_IN6 on %s: %m";
    }
    else
    {
      if (a2)
        v12 = 32;
      else
        v12 = 0;
      DWORD1(v24) = DWORD1(v24) & 0xFFFFFFDF | v12;
      v13 = 0;
      if ((ioctl(v11, 0xC0486957uLL, v23) & 0x80000000) == 0)
        goto LABEL_11;
      v14 = "SIOCSIFINFO_FLAGS on %s: %m";
    }
    v13 = *__error();
    sub_100003108(0, (uint64_t)v14, v15, v16, v17, v18, v19, v20, a1);
LABEL_11:
    close(v11);
    return v13;
  }
  sub_100003108(0, (uint64_t)"socket: %m", v5, v6, v7, v8, v9, v10, v22);
  return *__error();
}

uint64_t sub_10000E9A8(posix_spawnattr_t *a1, posix_spawn_file_actions_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
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
  uint64_t v38;
  uint64_t v39;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  sigset_t v46;

  v4 = posix_spawn_file_actions_init(a2);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v41 = strerror(v4);
    sub_100003108(0, (uint64_t)"spawn init: %s", v6, v7, v8, v9, v10, v11, (uint64_t)v41);
  }
  else
  {
    if (dword_10003546C)
      v12 = 0;
    else
      v12 = byte_100035480 == 0;
    if (v12)
    {
      posix_spawn_file_actions_addopen(a2, 1, "/dev/null", 1, 0);
      posix_spawn_file_actions_addopen(a2, 2, "/dev/null", 1, 0);
    }
    v46 = 0;
    v13 = posix_spawnattr_init(a1);
    if ((_DWORD)v13)
    {
      v5 = v13;
      posix_spawn_file_actions_destroy(a2);
      v42 = strerror(v5);
      sub_100003108(0, (uint64_t)"posix_spawnattr_init(): %s", v14, v15, v16, v17, v18, v19, (uint64_t)v42);
    }
    else
    {
      v20 = posix_spawnattr_setflags(a1, 12);
      if ((_DWORD)v20)
      {
        v5 = v20;
        posix_spawnattr_destroy(a1);
        posix_spawn_file_actions_destroy(a2);
        v43 = strerror(v5);
        sub_100003108(0, (uint64_t)"posix_spawnattr_setflags(): %s", v21, v22, v23, v24, v25, v26, (uint64_t)v43);
      }
      else
      {
        v27 = posix_spawnattr_setsigmask(a1, &v46);
        if ((_DWORD)v27)
        {
          v5 = v27;
          posix_spawnattr_destroy(a1);
          posix_spawn_file_actions_destroy(a2);
          v44 = strerror(v5);
          sub_100003108(0, (uint64_t)"posix_spawnattr_setsigmask(): %s", v28, v29, v30, v31, v32, v33, (uint64_t)v44);
        }
        else
        {
          v46 = -1;
          v5 = posix_spawnattr_setsigdefault(a1, &v46);
          if ((_DWORD)v5)
          {
            posix_spawnattr_destroy(a1);
            posix_spawn_file_actions_destroy(a2);
            v45 = strerror(v5);
            sub_100003108(0, (uint64_t)"posix_spawnattr_setsigdefault(): %s", v34, v35, v36, v37, v38, v39, (uint64_t)v45);
          }
        }
      }
    }
  }
  return v5;
}

void sub_10000EB50(const __CFArray *a1, const char *a2)
{
  CFIndex Count;
  CFStringRef v5;
  CFStringRef v6;
  CFRange v7;

  Count = CFArrayGetCount(a1);
  v5 = CFStringCreateWithCString(0, a2, 0x600u);
  if (v5)
  {
    v6 = v5;
    v7.location = 0;
    v7.length = Count;
    if (!CFArrayContainsValue(a1, v7, v5))
      CFArrayAppendValue(a1, v6);
    CFRelease(v6);
  }
}

void sub_10000EBD0(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5;
  CFStringRef v6;

  v5 = CFStringCreateWithCString(0, cStr, 0x600u);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sub_10000EC34(__CFDictionary *a1, const void *a2, __int16 a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  __int16 valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberShortType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t sub_10000EC98(CFPropertyListRef propertyList, const std::__fs::filesystem::path *a2, uid_t a3, gid_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  CFDataRef Data;
  CFDataRef v13;
  int v14;
  int v15;
  size_t Length;
  const UInt8 *BytePtr;
  std::error_code *v18;
  uint64_t v19;
  std::__fs::filesystem::path __str[42];

  v6 = 22;
  if (propertyList && a2 && (_DWORD)a5)
  {
    Data = CFPropertyListCreateData(kCFAllocatorDefault, propertyList, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      v13 = Data;
      snprintf((char *)__str, 0x400uLL, "%s-", (const char *)a2);
      if (a6 == 1)
        v14 = open_dprotected_np((const char *)__str, 1537, 4, 0, a5);
      else
        v14 = open((const char *)__str, 1537, a5);
      v15 = v14;
      if (v14 < 0)
      {
        v6 = *__error();
        CFRelease(v13);
      }
      else
      {
        Length = CFDataGetLength(v13);
        BytePtr = CFDataGetBytePtr(v13);
        if (write(v15, BytePtr, Length) == Length)
        {
          rename(__str, a2, v18);
          if ((_DWORD)v19)
          {
            v6 = v19;
            unlink((const char *)__str);
          }
          else
          {
            v6 = chown((const char *)a2, a3, a4);
          }
        }
        else
        {
          v6 = *__error();
        }
        CFRelease(v13);
        close(v15);
      }
    }
    else
    {
      return 12;
    }
  }
  return v6;
}

size_t sub_10000EE38(const char *a1, int *a2, int a3)
{
  int v6;
  size_t st_size;
  UInt8 *v8;
  UInt8 *v9;
  int v10;
  int v11;
  int v12;
  const __CFData *v13;
  const __CFData *v14;
  int v15;
  stat v17;

  memset(&v17, 0, sizeof(v17));
  v6 = stat(a1, &v17);
  *a2 = v6;
  if (v6 < 0)
    return 0;
  st_size = v17.st_size;
  if (v17.st_size)
  {
    v8 = (UInt8 *)malloc_type_malloc(v17.st_size, 0xE23C9A12uLL);
    if (v8)
    {
      v9 = v8;
      if (a3 == 1)
        v10 = open_dprotected_np(a1, 0, 4, 0);
      else
        v10 = open(a1, 0);
      v12 = v10;
      if ((v10 & 0x80000000) == 0)
      {
        if (read(v10, v9, st_size) == st_size)
        {
          v13 = CFDataCreateWithBytesNoCopy(0, v9, st_size, kCFAllocatorNull);
          if (v13)
          {
            v14 = v13;
            st_size = (size_t)CFPropertyListCreateWithData(kCFAllocatorDefault, v13, 0, 0, 0);
            if (!st_size)
              *a2 = 12;
            CFRelease(v14);
            goto LABEL_21;
          }
          st_size = 0;
          v15 = 12;
        }
        else
        {
          st_size = 0;
          v15 = *__error();
        }
        *a2 = v15;
LABEL_21:
        free(v9);
        close(v12);
        return st_size;
      }
      *a2 = *__error();
      free(v9);
      return 0;
    }
    st_size = 0;
    v11 = 12;
  }
  else
  {
    v11 = 22;
  }
  *a2 = v11;
  return st_size;
}

uint64_t sub_10000EFC8(unsigned int a1)
{
  unsigned int v1;
  int v2;

  v1 = bswap32(a1);
  v2 = -32;
  while (((v1 >> v2) & 1) == 0)
  {
    if (__CFADD__(v2++, 1))
      return 32;
  }
  return -v2;
}

char *sub_10000EFF0(int a1, unsigned int a2)
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
      byte_100034F0C = 0;
      v4 = 32;
      v5 = 4;
      goto LABEL_7;
    }
  }
  v4 = 32 - v2;
  byte_100034F0C = 0;
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
      v12 = (const char *)&unk_10002576D;
    snprintf(__str, 8uLL, "%d%s", v10, v12);
    __strlcat_chk(&byte_100034F0C, __str, 32, 32);
    LODWORD(v7) = v7 - 1;
    --v8;
  }
  while (v8);
LABEL_12:
  snprintf(__str, 8uLL, "/%d", v4);
  __strlcat_chk(&byte_100034F0C, __str, 32, 32);
  return &byte_100034F0C;
}

const char *sub_10000F150(int a1)
{
  if ((a1 - 201) > 3)
    return "unknown_mode";
  else
    return off_100030E90[a1 - 201];
}

const char *sub_10000F178(int a1)
{
  if ((a1 - 301) > 3)
    return "unknown";
  else
    return off_100030EB0[a1 - 301];
}

uint64_t sub_10000F1A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v4;
  const __CFString *Domain;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFErrorRef err;
  char buffer[256];

  err = 0;
  if (SMJobSetEnabled(kSMDomainSystemLaunchd, 0, a1, a3, 1, &err))
    v4 = 1;
  else
    v4 = err == 0;
  if (v4)
    return 0;
  Domain = CFErrorGetDomain(err);
  if (Domain)
  {
    CFStringGetCString(Domain, buffer, 256, 0x600u);
    CFErrorGetCode(err);
    sub_100003108(0, (uint64_t)"\"%s\" %s job error %s(%ld)", v7, v8, v9, v10, v11, v12, a2);
  }
  CFRelease(err);
  return 22;
}

uint64_t sub_10000F2A0(const char *a1, BOOL *a2)
{
  const __SCPreferences *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __SCPreferences *v11;
  const __SCNetworkService *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __SCNetworkService *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = SCPreferencesCreate(0, CFSTR("com.apple.MobileInternetSharing"), 0);
  if (v4)
  {
    v11 = v4;
    v12 = (const __SCNetworkService *)sub_10000AAF0(v4, a1);
    if (v12)
    {
      v19 = v12;
      *a2 = SCNetworkServiceGetEnabled(v12) != 0;
      sub_100003108(1u, (uint64_t)"network service status for %s: %s", v20, v21, v22, v23, v24, v25, (uint64_t)a1);
      CFRelease(v19);
      v26 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"Failed to find network service for %s", v13, v14, v15, v16, v17, v18, (uint64_t)a1);
      v26 = 0xFFFFFFFFLL;
    }
    CFRelease(v11);
  }
  else
  {
    sub_100003108(0, (uint64_t)"SCPreferencesCreate for %s returned NULL", v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    return 0xFFFFFFFFLL;
  }
  return v26;
}

xpc_object_t sub_10000F37C(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "iftype", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 280) + 284));
  xpc_dictionary_set_uint64(v2, "duration", *(_QWORD *)(a1 + 40));
  return v2;
}

uint64_t sub_10000F3DC(_QWORD *a1, int a2, _DWORD *a3)
{
  _DWORD *v3;
  int v4;
  int *v6;
  uint64_t *v7;
  uint64_t interface_names;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t flags;
  ifaddrs *v41;
  sockaddr *ifa_addr;
  uint64_t *v43;
  void *v44;
  BOOL v45;
  int v46;
  int v47;
  int v49;
  char v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  ifaddrs *v66;
  _DWORD *v67;
  int *v68;
  int v69;
  int v70;
  uint64_t v71;
  int v72;
  ifaddrs *v73;

  v3 = a3;
  v4 = a2;
  *a3 = 0;
  if (a2 == 2)
  {
    v6 = &dword_1000354B8;
    v72 = 5;
    v7 = &qword_1000354A8;
  }
  else
  {
    if (a2 != 30)
      sub_1000229CC();
    v6 = &dword_1000354BC;
    v72 = 6;
    v7 = &qword_1000354B0;
  }
  interface_names = nwi_state_get_interface_names(*a1, 0, 0);
  if ((_DWORD)interface_names)
  {
    v15 = interface_names;
    v16 = malloc_type_malloc(8 * (int)interface_names, 0x10040436913F5uLL);
    if (v16)
    {
      v17 = v16;
      v18 = nwi_state_get_interface_names(*a1, v16, v15);
      if (v18 >= 1)
      {
        v67 = v3;
        v68 = v6;
        v25 = 0;
        v71 = 0;
        v69 = 0;
        v70 = v4;
        v26 = v18;
        while (1)
        {
          v27 = (const char *)v17[v25];
          if (v27 && *v27 && if_nametoindex((const char *)v17[v25]))
          {
            if (nwi_state_get_ifstate(*a1, v27))
            {
              flags = nwi_ifstate_get_flags();
              if ((~(_DWORD)flags & v72) == 0)
              {
                if (v4 != 30)
                  goto LABEL_32;
                v73 = 0;
                if (getifaddrs(&v73))
                {
                  sub_100003108(0, (uint64_t)"%s: getifaddrs: %m", v19, v20, v21, v22, v23, v24, (uint64_t)"mis_interface_has_routable_ipv6_addr");
                  goto LABEL_30;
                }
                v41 = v73;
                v66 = v73;
                if (v73)
                {
                  while (1)
                  {
                    ifa_addr = v41->ifa_addr;
                    if (ifa_addr)
                    {
                      if (ifa_addr->sa_family == 30
                        && !strncmp(v27, v41->ifa_name, 0x10uLL)
                        && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80))
                      {
                        break;
                      }
                    }
                    v41 = v41->ifa_next;
                    if (!v41)
                    {
                      free(v66);
                      goto LABEL_30;
                    }
                  }
                  free(v66);
                  v3 = v67;
LABEL_32:
                  sub_100003108(2u, (uint64_t)"%s: nwi interface name %s found for %s", v34, v35, v36, v37, v38, v39, (uint64_t)"mis_nwi_process_state");
                  v43 = v7;
                  while (1)
                  {
                    v43 = (uint64_t *)*v43;
                    if (!v43)
                      break;
                    if (!strncmp((const char *)v43 + 8, v27, 0x10uLL))
                      goto LABEL_43;
                  }
                  v44 = malloc_type_malloc(0x30uLL, 0x102004051B57111uLL);
                  if (!v44)
                  {
                    v59 = __error();
                    strerror(*v59);
                    sub_100003108(0, (uint64_t)"%s: malloc failed:(%s) for nwi %s", v60, v61, v62, v63, v64, v65, (uint64_t)"mis_nwi_process_state");
                    free(v17);
                    goto LABEL_57;
                  }
                  v43 = (uint64_t *)v44;
                  *((_OWORD *)v44 + 2) = 0u;
                  *(_OWORD *)v44 = 0u;
                  *((_OWORD *)v44 + 1) = 0u;
                  snprintf((char *)v44 + 8, 0x10uLL, "%s", v27);
                  *v43 = *v7;
                  *v7 = (uint64_t)v43;
                  if (v70 == 2)
                  {
                    v45 = __CFADD__(dword_100034EF0++, 1);
                    if (v45)
                      sub_10002297C();
                  }
                  else
                  {
                    v45 = __CFADD__(dword_100034EF4++, 1);
                    if (v45)
                      sub_1000229A4();
                  }
                  HIDWORD(v71) = 1;
LABEL_43:
                  if (flags != v43[4])
                    v43[4] = flags;
                  v46 = sub_1000079EC((_BYTE *)v43 + 8);
                  v47 = HIDWORD(v71);
                  if (v46 != *((_DWORD *)v43 + 6))
                  {
                    *((_DWORD *)v43 + 6) = v46;
                    v47 = 1;
                  }
                  if ((int)v71 > v46 || (_DWORD)v71 == 0)
                    v49 = v46;
                  else
                    v49 = v71;
                  *((_BYTE *)v43 + 41) = 1;
                  LODWORD(v71) = v49;
                  HIDWORD(v71) = (*((_BYTE *)v43 + 40) == 0) | v47;
                  *((_DWORD *)v43 + 7) = v69;
                  ++*v68;
                  ++v69;
                }
                else
                {
LABEL_30:
                  v3 = v67;
                }
                v4 = v70;
                goto LABEL_18;
              }
              sub_100003108(2u, (uint64_t)"%s: skipped interface %s flags 0x%qx", v34, v35, v36, v37, v38, v39, (uint64_t)"mis_nwi_process_state");
            }
            else
            {
              sub_100003108(0, (uint64_t)"%s: no state info for %s", v28, v29, v30, v31, v32, v33, (uint64_t)"mis_nwi_process_state");
            }
          }
          else
          {
            sub_100003108(0, (uint64_t)"%s: bad interface in nwi state", v19, v20, v21, v22, v23, v24, (uint64_t)"mis_nwi_process_state");
          }
LABEL_18:
          if (++v25 == v26)
            goto LABEL_59;
        }
      }
      v71 = 0;
LABEL_59:
      *v3 = v71;
      free(v17);
      v50 = BYTE4(v71);
    }
    else
    {
      v51 = __error();
      strerror(*v51);
      sub_100003108(0, (uint64_t)"%s: malloc failed:(%s) for if_names", v52, v53, v54, v55, v56, v57, (uint64_t)"mis_nwi_process_state");
LABEL_57:
      nwi_state_release(*a1);
      v50 = 0;
      *a1 = 0;
    }
  }
  else
  {
    sub_100003108(0, (uint64_t)"%s: no interfaces in nwi state", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_nwi_process_state");
    v50 = 0;
  }
  return v50 & 1;
}

void sub_10000F848(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uintptr_t data;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int handle;
  ssize_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  ssize_t v18;
  ssize_t v19;
  _DWORD *v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _OWORD v43[12];
  uint64_t v44;
  _BYTE v45[1024];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 1107))
    sub_1000229F4();
  v2 = (_QWORD *)qword_100035498;
  if (qword_100035498)
  {
    while (v2 != (_QWORD *)v1 || *(_DWORD *)(v1 + 16) != 1 || *(_DWORD *)(v1 + 20) != 201)
    {
      v2 = (_QWORD *)*v2;
      if (!v2)
        return;
    }
    data = dispatch_source_get_data(*(dispatch_source_t *)(v1 + 1120));
    sub_100003108(2u, (uint64_t)"Estimated kernel prefix event bytes available: %ld", v4, v5, v6, v7, v8, v9, data);
    bzero(v45, 0x400uLL);
    handle = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
    v11 = read(handle, v45, 0x400uLL);
    if (v11 == -1)
      goto LABEL_22;
    v18 = v11;
    while (2)
    {
      if (v18 >= 1)
      {
        v19 = 0;
        while (1)
        {
          v20 = &v45[v19];
          v19 += *(unsigned int *)&v45[v19];
          if (v19 > v18)
            break;
          if (v20[1] == 1
            && v20[2] == 1
            && v20[3] == 7
            && v20[5] == 1
            && if_nametoindex((const char *)(v1 + 308)) == v20[28])
          {
            sub_100003108(2u, (uint64_t)"received prefix event for %s", v12, v13, v14, v15, v16, v17, v1 + 308);
            v44 = 0;
            memset(v43, 0, sizeof(v43));
            if (sub_10000FA8C(v1, (uint64_t)v43, v29, v30, v31, v32, v33, v34))
              sub_100003108(0, (uint64_t)"failed to get IPv6 configuration for %s", v35, v36, v37, v38, v39, v40, v1 + 308);
            else
              sub_100009AC8(v1, (unsigned __int8 *)v43, v35, v36, v37, v38, v39, v40);
            return;
          }
          if (v19 >= v18)
            goto LABEL_21;
        }
        sub_100003108(2u, (uint64_t)"missed SYSPROTO_EVENT event,buffer not big enough", v12, v13, v14, v15, v16, v17, v41);
LABEL_21:
        bzero(v45, 0x400uLL);
        v21 = dispatch_source_get_handle(*(dispatch_source_t *)(v1 + 1120));
        v18 = read(v21, v45, 0x400uLL);
        if (v18 != -1)
          continue;
LABEL_22:
        v22 = *__error();
        if (v22)
        {
          if (v22 != 35)
          {
            v42 = strerror(v22);
            sub_100003108(0, (uint64_t)"recv() failed %s", v23, v24, v25, v26, v27, v28, (uint64_t)v42);
          }
        }
      }
      break;
    }
  }
}

uint64_t sub_10000FA84(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_10000FA8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  ifaddrs *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  char *v55;
  char *v56;
  unsigned int v57;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  ifaddrs *v68;
  sockaddr *ifa_addr;
  const void *v70;
  char *v71;
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
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const void *v115;
  char *v116;
  char *v117;
  ifaddrs *v118;
  int __errnum;
  ifaddrs *v120;
  __int128 v121;
  _OWORD v122[11];
  uint64_t v123;
  int v124[14];

  if (!*(_BYTE *)(a1 + 1107))
    sub_100022A1C();
  v10 = *(_OWORD *)(a1 + 880);
  v122[9] = *(_OWORD *)(a1 + 864);
  v122[10] = v10;
  v123 = *(_QWORD *)(a1 + 896);
  v11 = *(_OWORD *)(a1 + 816);
  v122[5] = *(_OWORD *)(a1 + 800);
  v122[6] = v11;
  v12 = *(_OWORD *)(a1 + 848);
  v122[7] = *(_OWORD *)(a1 + 832);
  v122[8] = v12;
  v13 = *(_OWORD *)(a1 + 752);
  v122[1] = *(_OWORD *)(a1 + 736);
  v122[2] = v13;
  v14 = *(_OWORD *)(a1 + 784);
  v122[3] = *(_OWORD *)(a1 + 768);
  v122[4] = v14;
  v15 = *(_OWORD *)(a1 + 720);
  v121 = *(_OWORD *)(a1 + 704);
  v122[0] = v15;
  v16 = (v15 | DWORD1(v15) | DWORD2(v15) | HIDWORD(v15)) == 0;
  *(_OWORD *)v124 = xmmword_100025110;
  __errnum = 0;
  v120 = 0;
  v23 = (char *)sub_100010024((uint64_t)"ICMPV6CTL_ND6_DRLIST", v124, (size_t *)&v120, &__errnum, a5, a6, a7, a8);
  if (!v23)
  {
    v25 = __errnum;
    if (__errnum)
      goto LABEL_4;
    sub_100003108(0, (uint64_t)"no usable default IPv6 router", v17, v18, v19, v20, v21, v22, v112);
    return 0;
  }
  v24 = v120;
  v25 = __errnum;
  if (__errnum)
  {
LABEL_4:
    if ((_DWORD)v25 != 2)
    {
      strerror(v25);
      sub_100003108(0, (uint64_t)"%s, unable to get default router list: %s", v26, v27, v28, v29, v30, v31, a1 + 308);
    }
    v32 = 0;
    goto LABEL_7;
  }
  *(_OWORD *)v124 = xmmword_100025120;
  v120 = 0;
  __errnum = 0;
  v32 = (char *)sub_100010024((uint64_t)"ICMPV6CTL_ND6_PRLIST", v124, (size_t *)&v120, &__errnum, v19, v20, v21, v22);
  if (!v32)
  {
    v25 = __errnum;
    if (!__errnum)
    {
      sub_100003108(0, (uint64_t)"no usable IPv6 prefix information", v33, v34, v35, v36, v37, v38, v112);
      v32 = 0;
      v25 = 2;
      goto LABEL_7;
    }
    goto LABEL_17;
  }
  v118 = v120;
  v25 = __errnum;
  if (__errnum)
  {
LABEL_17:
    if ((_DWORD)v25 != 2)
    {
      strerror(v25);
      sub_100003108(0, (uint64_t)"%s, unable to get prefix list: %s", v39, v40, v41, v42, v43, v44, a1 + 308);
    }
    goto LABEL_7;
  }
  if (*(_DWORD *)(a1 + 16) != 1)
    sub_100022A44();
  v46 = (const char *)(a1 + 308);
  v47 = if_nametoindex(v46);
  if (!v47)
  {
    v25 = *__error();
    sub_100003108(0, (uint64_t)"if_nametoindex() failed %s: %m", v72, v73, v74, v75, v76, v77, (uint64_t)v46);
    if ((v25 & 0xFFFFFFFD) == 0)
      goto LABEL_71;
    sub_100003108(0, (uint64_t)"%s, unable to get prefix and default router", v78, v79, v80, v81, v82, v83, (uint64_t)v46);
    goto LABEL_7;
  }
  if ((uint64_t)v24 < 1)
    goto LABEL_65;
  v54 = v47;
  v115 = 0;
  v116 = 0;
  v114 = a2;
  v117 = (char *)v24 + (_QWORD)v23;
  v55 = v23;
  do
  {
    if ((uint64_t)v118 >= 1 && v54 == *((unsigned __int16 *)v55 + 20))
    {
      v56 = v32;
      do
      {
        v57 = *((unsigned __int16 *)v56 + 33);
        if (v56[29] != 64)
          goto LABEL_61;
        if (v54 != *((unsigned __int16 *)v56 + 32) || v57 == 0)
          goto LABEL_61;
        v120 = 0;
        if (getifaddrs(&v120))
        {
          v59 = *__error();
          sub_100003108(0, (uint64_t)"getifaddrs: %m", v60, v61, v62, v63, v64, v65, v112);
        }
        else
        {
          v68 = v120;
          if (!v120)
            goto LABEL_61;
          while (1)
          {
            if (!strncmp(v46, v68->ifa_name, 0x10uLL))
            {
              ifa_addr = v68->ifa_addr;
              if (ifa_addr)
              {
                if (ifa_addr->sa_family == 30
                  && (ifa_addr->sa_data[6] != 254 || (ifa_addr->sa_data[7] & 0xC0) != 0x80)
                  && *(_QWORD *)&ifa_addr->sa_data[6] == *((_QWORD *)v56 + 1))
                {
                  break;
                }
              }
            }
            v68 = v68->ifa_next;
            if (!v68)
            {
              v59 = -1;
              goto LABEL_57;
            }
          }
          v59 = 0;
LABEL_57:
          if (v120)
            free(v120);
        }
        if (!v59 && *((_WORD *)v56 + 33))
        {
          v66 = 0;
          while (*(_QWORD *)&v56[v66 + 80] != *((_QWORD *)v55 + 1) || *(_QWORD *)&v56[v66 + 88] != *((_QWORD *)v55 + 2))
          {
            v66 += 28;
            if (28 * *((unsigned __int16 *)v56 + 33) == (_DWORD)v66)
              goto LABEL_61;
          }
          if (v16
            || (v115 = v56,
                v116 = v55,
                sub_1000101A8((unsigned __int8 *)v122, (unsigned __int8 *)v56 + 8, v56[29], v49, v50, v51, v52, v53)))
          {
            v71 = v55;
            v70 = v56;
            a2 = v114;
            goto LABEL_70;
          }
        }
LABEL_61:
        v56 += 28 * v57 + 72;
      }
      while (v56 < (char *)v118 + (unint64_t)v32);
    }
    v55 += 48;
  }
  while (v55 < v117);
  a2 = v114;
  v70 = v115;
  v71 = v116;
  if (v115 && v116)
  {
LABEL_70:
    memmove((void *)(a2 + 8), v70, 0x48uLL);
    v85 = *((_OWORD *)v71 + 1);
    v84 = *((_OWORD *)v71 + 2);
    *(_OWORD *)(a2 + 80) = *(_OWORD *)v71;
    *(_OWORD *)(a2 + 96) = v85;
    *(_OWORD *)(a2 + 112) = v84;
    *(_BYTE *)a2 = 1;
    inet_ntop(30, (const void *)(a2 + 16), (char *)v124, 0x2Eu);
    sub_100003108(1u, (uint64_t)"found prefix: %s with prefix length %u for external interface %s", v86, v87, v88, v89, v90, v91, (uint64_t)v124);
    v25 = 0;
  }
  else
  {
LABEL_65:
    sub_100003108(0, (uint64_t)"no ipv6 default router or prefix information for %s", v48, v49, v50, v51, v52, v53, (uint64_t)v46);
    v25 = 2;
  }
LABEL_71:
  if (*(_BYTE *)a2)
  {
    v92 = socket(30, 2, 0);
    if (v92 < 0)
    {
      v25 = *__error();
      sub_100003108(0, (uint64_t)"socket: %m", v100, v101, v102, v103, v104, v105, v113);
      if (v92 != -1)
        goto LABEL_81;
    }
    else
    {
      if ((unint64_t)__strlcpy_chk(a2 + 128, v46, 16, 16) >= 0x10)
      {
        v25 = *__error();
        v99 = "strlcpy: %m";
        goto LABEL_80;
      }
      if (ioctl(v92, 0xC030694CuLL, a2 + 128) < 0)
      {
        v25 = *__error();
        v113 = a2 + 128;
        v99 = "SIOCGIFINFO_IN6 on %s: %m";
LABEL_80:
        sub_100003108(0, (uint64_t)v99, v93, v94, v95, v96, v97, v98, v113);
      }
      else
      {
        v25 = 0;
      }
LABEL_81:
      close(v92);
    }
    if ((_DWORD)v25)
    {
      strerror(v25);
      sub_100003108(0, (uint64_t)"unable to get ND info for %s: %s", v106, v107, v108, v109, v110, v111, (uint64_t)v46);
    }
  }
LABEL_7:
  if (v23)
    free(v23);
  if (v32)
    free(v32);
  if ((_DWORD)v25 == 2)
    return 0;
  return v25;
}

void *sub_100010024(uint64_t a1, int *a2, size_t *a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v12;
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
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  size_t size;

  size = 0;
  v12 = 1;
  while (1)
  {
    if (v12 != 1)
      sub_100003108(0, (uint64_t)"sysctl(%s): trying again (%d of %d)", (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, a1);
    if (sysctl(a2, 4u, 0, &size, 0, 0) < 0)
    {
      v26 = *__error();
LABEL_12:
      strerror(v26);
      sub_100003108(0, (uint64_t)"sysctl(%s) failed: %s", v27, v28, v29, v30, v31, v32, a1);
LABEL_14:
      v25 = 0;
      goto LABEL_17;
    }
    if (!size)
    {
      sub_100003108(0, (uint64_t)"sysctl(%s): length is zero", v13, v14, v15, v16, v17, v18, a1);
      v26 = 0;
      goto LABEL_14;
    }
    v25 = malloc_type_malloc(size, 0xF14D96CAuLL);
    if (!v25)
    {
      sub_100003108(0, (uint64_t)"sysctl(%s): malloc failed", v19, v20, v21, v22, v23, v24, a1);
      v26 = 12;
      goto LABEL_17;
    }
    if (!sysctl(a2, 4u, v25, &size, 0, 0))
      break;
    free(v25);
    v26 = *__error();
    if (*__error() != 12)
      goto LABEL_12;
    if (++v12 == 11)
      goto LABEL_14;
  }
  v26 = 0;
LABEL_17:
  v33 = size;
  if (!v25)
    v33 = 0;
  *a3 = v33;
  *a4 = v26;
  return v25;
}

BOOL sub_1000101A8(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  size_t v11;

  v8 = a3;
  if ((int)a3 >= 129)
  {
    sub_100003108(0, (uint64_t)"in6_are_prefix_equal: invalid prefix length(%d)\n", a3, a4, a5, a6, a7, a8, a3);
    return 0;
  }
  v11 = (unint64_t)a3 >> 3;
  return !bcmp(a1, a2, v11) && ((v8 & 7) == 0 || a1[v11] >> (8 - (v8 & 7)) == a2[v11] >> (8 - (v8 & 7)));
}

void sub_100010244(int a1, CFArrayRef theArray, uint64_t a3)
{
  _QWORD *v3;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  uint64_t v9;
  const __CFString *ValueAtIndex;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __SCDynamicStore *v17;
  CFPropertyListRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const void *v24;
  CFTypeID TypeID;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *Value;
  const void *v33;
  CFTypeID v34;
  int v35;
  const void *v36;
  const void *v37;
  CFTypeID v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __SCDynamicStore *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFDictionary *v59;
  CFTypeID v60;
  const void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const void *v68;
  CFTypeID v69;
  CFTypeID v70;
  const char *v71;
  CFIndex v72;
  const __CFString *v73;
  const __CFString *v74;
  uint64_t v75;
  CFTypeID v76;
  const __CFNumber *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const __CFString *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  NSObject *v94;
  const __CFArray *v95;
  const __CFArray *v96;
  CFTypeID v97;
  CFIndex v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  BOOL v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  const __CFArray *v121;
  _QWORD *v122;
  const __CFArray *theArraya;
  CFArrayRef theArrayb;
  CFIndex v125;
  in6_addr v126;
  unsigned int v127;
  int v128;
  int valuePtr;
  char buffer[16];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  uint64_t v142;
  char v143[8];
  in6_addr v144;
  int v145;

  if (!a3)
    sub_100022A6C();
  v3 = (_QWORD *)qword_100035498;
  if (qword_100035498)
  {
    v126 = (in6_addr)0;
    while (v3 != (_QWORD *)a3 || *(_DWORD *)(a3 + 16) != 1 || *(_DWORD *)(a3 + 20) != 201)
    {
      v3 = (_QWORD *)*v3;
      if (!v3)
        return;
    }
    Count = CFArrayGetCount(theArray);
    if (Count >= 1)
    {
      v7 = Count;
      v8 = 0;
      v9 = a3 + 308;
      v122 = (_QWORD *)(a3 + 648);
      v127 = 0;
      v128 = 0;
      do
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v8);
        if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv4))
        {
          if (!ValueAtIndex || (v17 = *(const __SCDynamicStore **)(a3 + 1112)) == 0)
          {
            sub_100003108(0, (uint64_t)"dynamic store ref or IPv4 kSCEntNetIPv4 key not present for %s", v11, v12, v13, v14, v15, v16, v9);
            goto LABEL_93;
          }
          v18 = SCDynamicStoreCopyValue(v17, ValueAtIndex);
          if (v18)
          {
            v24 = v18;
            TypeID = CFDictionaryGetTypeID();
            if (CFGetTypeID(v24) != TypeID)
            {
              v118 = "%s, dynamic store IPv4 kSCEntNetIPv4 is not a CFDictionary";
              goto LABEL_92;
            }
            Value = CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv4Addresses);
            if (!Value)
              goto LABEL_49;
            v33 = Value;
            v34 = CFArrayGetTypeID();
            if (CFGetTypeID(v33) != v34)
            {
              v118 = "%s, dynamic store IPv4 address is not a CFArray";
              goto LABEL_92;
            }
            if (CFArrayGetCount((CFArrayRef)v33))
            {
              v35 = 1;
              if ((sub_10000E410(a3, (int *)&v127, 1) & 1) == 0)
              {
                v36 = CFDictionaryGetValue((CFDictionaryRef)v24, kSCPropNetIPv4SubnetMasks);
                if (!v36)
                {
                  v118 = "%s, dynamic store network mask cannot be NULL";
                  goto LABEL_92;
                }
                v37 = v36;
                v38 = CFArrayGetTypeID();
                if (CFGetTypeID(v37) != v38)
                {
                  v118 = "%s, dynamic store IPv4 network mask is not a CFArray";
                  goto LABEL_92;
                }
                if (!CFArrayGetCount((CFArrayRef)v37))
                {
                  v118 = "%s, dynamic store IPv4 network mask cannot be NULL";
LABEL_92:
                  sub_100003108(0, (uint64_t)v118, v26, v27, v28, v29, v30, v31, v9);
                  CFRelease(v24);
LABEL_93:
                  sub_100003108(0, (uint64_t)"%s, failed to get IPv4 configuration", v85, v19, v20, v21, v22, v23, v9);
                  return;
                }
                v39 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v37, 0);
                CFStringGetCString(v39, buffer, 16, 0x600u);
                if (inet_pton(2, buffer, &v127) == 1)
                {
                  v35 = 1;
                }
                else
                {
                  sub_100003108(0, (uint64_t)"%s, inet_pton() failed for external mask", v40, v41, v42, v43, v44, v45, v9);
                  v35 = 0;
                }
              }
              v84 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v33, 0);
              CFStringGetCString(v84, buffer, 16, 0x600u);
              if (inet_pton(2, buffer, &v128) != 1)
              {
                v118 = "%s, inet_pton() failed for external address";
                goto LABEL_92;
              }
              CFRelease(v24);
              if (!v35)
                goto LABEL_93;
            }
            else
            {
LABEL_49:
              v127 = 0;
              v128 = 0;
              CFRelease(v24);
            }
          }
          else
          {
            v127 = 0;
            v128 = 0;
          }
          v86 = *(unsigned int *)(a3 + 680);
          if (v86 != v128 || (v87 = *(unsigned int *)(a3 + 684), v87 != v127))
          {
            inet_ntop(2, (const void *)(a3 + 680), buffer, 0x10u);
            inet_ntop(2, &v128, v143, 0x10u);
            sub_100003108(2u, (uint64_t)"%s IPv4 address changed from %s to %s", v88, v89, v90, v91, v92, v93, v9);
            v87 = v127;
            LODWORD(v86) = v128;
          }
          sub_10000A438(a3, v86, v87, v19, v20, v21, v22, v23);
        }
        else if (CFStringHasSuffix(ValueAtIndex, kSCEntNetIPv6))
        {
          v126 = in6addr_any;
          if (!ValueAtIndex || (v52 = *(const __SCDynamicStore **)(a3 + 1112)) == 0)
          {
            sub_100003108(0, (uint64_t)"dynamic store ref or ipv6 key not present for %s", v46, v47, v48, v49, v50, v51, v9);
            goto LABEL_66;
          }
          *(_QWORD *)v143 = 0;
          v144 = (in6_addr)0;
          v145 = 0;
          v59 = (const __CFDictionary *)SCDynamicStoreCopyValue(v52, ValueAtIndex);
          if (v59 && (v60 = CFDictionaryGetTypeID(), CFGetTypeID(v59) == v60))
          {
            v61 = CFDictionaryGetValue(v59, kSCPropNetIPv6Addresses);
            if (!v61)
              goto LABEL_63;
            v68 = v61;
            v69 = CFArrayGetTypeID();
            v70 = CFGetTypeID(v68);
            v71 = "ipv6 array empty for %s";
            if (v70 != v69)
              goto LABEL_64;
            v125 = CFArrayGetCount((CFArrayRef)v68);
            if (!v125)
            {
LABEL_63:
              v71 = "ipv6 array empty for %s";
              goto LABEL_64;
            }
            if (*(_BYTE *)(a3 + 1107))
            {
              v121 = 0;
              goto LABEL_35;
            }
            v95 = (const __CFArray *)CFDictionaryGetValue(v59, kSCPropNetIPv6Flags);
            if (!v95)
            {
              v71 = "ipv6 flags empty for %s";
              goto LABEL_64;
            }
            v96 = v95;
            theArrayb = (CFArrayRef)CFArrayGetTypeID();
            v121 = v96;
            v97 = CFGetTypeID(v96);
            v71 = "ipv6 flags empty for %s";
            if ((CFArrayRef)v97 != theArrayb
              || (v98 = CFArrayGetCount(v96), v71 = "ipv6 flags count mismatch for %s", v98 != v125))
            {
LABEL_64:
              sub_100003108(2u, (uint64_t)v71, v62, v63, v64, v65, v66, v67, v9);
LABEL_65:
              CFRelease(v59);
LABEL_66:
              v94 = *(NSObject **)(a3 + 1120);
              if (v94)
              {
                if (!*(_BYTE *)(a3 + 1107))
                  sub_100022A94();
                if (!*(_BYTE *)(a3 + 704))
                  goto LABEL_70;
                v142 = 0;
                v140 = 0u;
                v141 = 0u;
                v138 = 0u;
                v139 = 0u;
                v136 = 0u;
                v137 = 0u;
                v134 = 0u;
                v135 = 0u;
                v132 = 0u;
                v133 = 0u;
                *(_OWORD *)buffer = 0u;
                v131 = 0u;
                sub_100009AC8(a3, (unsigned __int8 *)buffer, v78, v79, v80, v81, v82, v83);
                v94 = *(NSObject **)(a3 + 1120);
                if (v94)
                {
LABEL_70:
                  dispatch_source_cancel(v94);
                  dispatch_release(*(dispatch_object_t *)(a3 + 1120));
                  *(_QWORD *)(a3 + 1120) = 0;
                }
              }
              goto LABEL_61;
            }
LABEL_35:
            theArraya = (const __CFArray *)v68;
            if (v125 >= 1)
            {
              v72 = 0;
              while (1)
              {
                v73 = (const __CFString *)CFArrayGetValueAtIndex(theArraya, v72);
                if (v73)
                {
                  v74 = v73;
                  v75 = v9;
                  v76 = CFStringGetTypeID();
                  v105 = CFGetTypeID(v74) == v76;
                  v9 = v75;
                  if (v105)
                  {
                    CFStringGetCString(v74, buffer, 46, 0x600u);
                    if (inet_pton(30, buffer, &v144) == 1
                      && (v144.__u6_addr8[0] != 254 || (v144.__u6_addr8[1] & 0xC0) != 0x80))
                    {
                      if (*(_BYTE *)(a3 + 1107))
                        break;
                      valuePtr = 0;
                      v77 = (const __CFNumber *)CFArrayGetValueAtIndex(v121, v72);
                      if (CFNumberGetValue(v77, kCFNumberSInt32Type, &valuePtr))
                      {
                        if ((valuePtr & 0x109F) == 0)
                          break;
                      }
                    }
                  }
                }
                if (v125 == ++v72)
                  goto LABEL_47;
              }
              v126 = v144;
              sub_100003108(2u, (uint64_t)"found ipv6 address %s for %s", v62, v63, v64, v65, v66, v67, (uint64_t)buffer);
              CFRelease(v59);
              if (*(_BYTE *)(a3 + 1107))
              {
                if (!*(_QWORD *)(a3 + 1120) && sub_100009730(a3))
                  sub_100003108(0, (uint64_t)"unable to listen to IPv6 prefix events", v99, v100, v101, v102, v103, v104, v119);
              }
              else
              {
                v105 = *v122 == *(_QWORD *)v126.__u6_addr8 && *(_QWORD *)(a3 + 656) == *(_QWORD *)&v126.__u6_addr32[2];
                if (!v105)
                {
                  inet_ntop(30, v122, buffer, 0x2Eu);
                  inet_ntop(30, &v126, v143, 0x2Eu);
                  sub_100003108(2u, (uint64_t)"%s IPv6 address changed from %s to %s", v106, v107, v108, v109, v110, v111, v75);
                  sub_10000A178(a3, (uint64_t)&v126, v112, v113, v114, v115, v116, v117, v120);
                }
              }
              goto LABEL_61;
            }
LABEL_47:
            sub_100003108(1u, (uint64_t)"ipv6 is not present for %s", v62, v63, v64, v65, v66, v67, v9);
          }
          else
          {
            sub_100003108(2u, (uint64_t)"ipv6 dictionary not present for %s", v53, v54, v55, v56, v57, v58, v9);
          }
          if (v59)
            goto LABEL_65;
          goto LABEL_66;
        }
LABEL_61:
        ++v8;
      }
      while (v8 != v7);
    }
  }
}

void sub_1000109CC(void *a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  unsigned int v7;
  const char *v8;
  const char *v9;
  const char *v10;
  xpc_object_t v11;
  unsigned int v12;
  char string[16];

  v4 = *(_DWORD *)(a2 + 684);
  v5 = *(_DWORD *)(a2 + 680);
  v6 = *(_DWORD *)(a2 + 692);
  if (v6)
  {
    if (v6 != (v5 & v4))
      v5 = *(_DWORD *)(a2 + 692);
    v7 = *(_DWORD *)(a2 + 696);
  }
  else
  {
    v7 = bswap32(bswap32(v5 | ~v4) - 1);
  }
  v8 = off_100034C90[0];
  v12 = v5;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v8, string);
  v9 = off_100034C98[0];
  v12 = v7;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v9, string);
  v10 = off_100034CA0[0];
  v12 = v4;
  inet_ntop(2, &v12, string, 0x10u);
  xpc_dictionary_set_string(a1, v10, string);
  if (*(_DWORD *)(a2 + 1128) == 500 && !*(_BYTE *)(a2 + 1107))
  {
    if (*(_BYTE *)(a2 + 1178))
    {
      v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v11, off_100034CD8[0], (const char *)(a2 + 1132));
      xpc_dictionary_set_value(a1, off_100034CC8[0], v11);
      xpc_release(v11);
    }
  }
}

uint64_t sub_100010B68()
{
  byte_100034F2C = 1;
  return 0;
}

void sub_100010B7C()
{
  if (byte_100034F2C == 1)
    byte_100034F2C = 0;
}

uint64_t sub_100010B94(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[2];

  *a3 = 0;
  result = (uint64_t)sub_10001F8C0(a2);
  if (!(_DWORD)result)
  {
    memset(v12, 0, sizeof(v12));
    result = sub_10001F894((uint64_t)v12);
    *a3 = BYTE1(v12[0]);
    if (!(_DWORD)result)
    {
      if (LOBYTE(v12[0]))
      {
        v5 = DWORD1(v12[0]);
        sub_100014D58(DWORD1(v12[0]));
        sub_100003108(0, (uint64_t)"maximum number of wireless tethered hosts is %d", v6, v7, v8, v9, v10, v11, v5);
        return 0;
      }
      else
      {
        return 45;
      }
    }
  }
  return result;
}

uint64_t sub_100010C44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t result;

  if (*(_DWORD *)(a1 + 16) != 1)
    sub_100022B0C();
  if (*(_DWORD *)(a1 + 288) != 100)
    sub_100022AE4();
  v9 = dword_100034F30++;
  if (v9 > 0)
    return 0;
  if (v9 < 0)
    sub_100022ABC();
  if (*(_BYTE *)(a1 + 1269))
  {
    sub_100010EFC(a1, a2, a3, a4, a5, a6, a7, a8);
    return 37;
  }
  else
  {
    sub_10001F8EC(1, (uint64_t)sub_100010F78, a1);
    sub_10001F9C0();
    result = 0;
    *(_BYTE *)(a1 + 1269) = 1;
    *(_QWORD *)(a1 + 592) = sub_100010D00;
    *(_QWORD *)(a1 + 600) = sub_100010EDC;
    *(_QWORD *)(a1 + 632) = 0;
  }
  return result;
}

uint64_t sub_100010D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v9;
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
  unsigned int v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];

  if (*(_DWORD *)(a2 + 288) != 100)
    sub_100022B5C();
  if (!dword_100034F30)
    sub_100022B34();
  v9 = *(_DWORD *)(a3 + 288) == 101;
  *(_BYTE *)(a2 + 1268) = v9;
  if (v9)
  {
    memset(v41, 0, sizeof(v41));
    sub_100003108(0, (uint64_t)"%s: starting tethering authentication", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_activate");
    v10 = sub_10001F894((uint64_t)v41);
    v18 = v10;
    if ((_DWORD)v10)
      v10 = sub_1000145BC(0x3FDu, v11, v12, v13, v14, v15, v16, v17);
    if (LOBYTE(v41[0]))
    {
      if (BYTE1(v41[0]))
      {
        sub_1000147E4(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_16:
        *(_BYTE *)(a2 + 1268) = 0;
        goto LABEL_17;
      }
      v25 = 1021;
    }
    else
    {
      v25 = 1020;
    }
    sub_1000145BC(v25, v11, v12, v13, v14, v15, v16, v17);
    goto LABEL_16;
  }
  if (*(_DWORD *)(a2 + 12) || *(_BYTE *)(a2 + 1276))
  {
    sub_100003108(1u, (uint64_t)"%s: Ignoring PDP context activation request since PDP context is active(%d) or in-progress(%d)", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_activate");
    return 0;
  }
  sub_100003108(0, (uint64_t)"%s: starting tethering activation", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_activate");
  v34 = sub_10001F868(1);
  if (!(_DWORD)v34)
  {
    *(_BYTE *)(a2 + 1276) = 1;
    *(_DWORD *)(a2 + 12) = 0;
    return 36;
  }
  v18 = v34;
  sub_100003108(0, (uint64_t)"%s: failed to activate tethering %d", v35, v36, v37, v38, v39, v40, (uint64_t)"mis_pdp_activate");
LABEL_17:
  *(_DWORD *)(a2 + 12) = v18 == 0;
  if ((_DWORD)v18 == 36)
    return 36;
  sub_10000857C(a2, v18, v19, v20, v21, v22, v23, v24);
  if ((_DWORD)v18 && (_DWORD)v18 != 62)
  {
    v26 = strerror(v18);
    sub_100003108(0, (uint64_t)"PDP activate failed: %s", v27, v28, v29, v30, v31, v32, (uint64_t)v26);
  }
  return v18;
}

double sub_100010EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 288) != 100)
    sub_100022B84();
  return sub_100010EFC(a1, a2, a3, a4, a5, a6, a7, a8);
}

double sub_100010EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  double result;

  if (*(_DWORD *)(a1 + 288) != 100)
    sub_100022C4C();
  v8 = dword_100034F30;
  if (!dword_100034F30)
    sub_100022BAC();
  --dword_100034F30;
  if (v8 <= 1)
  {
    sub_100011528(a1, 1, a3, a4, a5, a6, a7, a8);
    if (*(_QWORD *)(a1 + 1120))
      sub_100022C24();
    if (*(_QWORD *)(a1 + 1112))
      sub_100022BFC();
    if (*(_BYTE *)(a1 + 1269))
      sub_100022BD4();
    result = 0.0;
    *(_OWORD *)(a1 + 592) = 0u;
  }
  return result;
}

void sub_100010F78(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  if (a3)
  {
    v10 = a1 - 1;
    if (!a2 && v10 <= 1)
      sub_100003108(0, (uint64_t)"%s: CT callback for %s with NULL info", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_ct_event_cb");
    if (dword_100034F30 && *(_BYTE *)(a3 + 1269))
    {
      sub_10000BAA0(a3);
      switch(v10)
      {
        case 0u:
          v39 = "event_tethering_status";
          sub_100003108(1u, (uint64_t)"%s: conn_available: %s, conn_state: %s, conn_sts_wait: %s, new_ifname: %s, cur_ifname: %s", v12, v13, v14, v15, v16, v17, (uint64_t)"event_tethering_status");
          if ((*(_BYTE *)(a3 + 1276)
             || *(_BYTE *)(a2 + 16) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 16), 0x100uLL))
            && *(_BYTE *)(a2 + 2)
            && *(_DWORD *)(a2 + 8) == 3)
          {
            goto LABEL_22;
          }
          if (!*(_BYTE *)(a3 + 1270) || *(_BYTE *)(a2 + 2) && *(_DWORD *)(a2 + 8) == 3)
            goto LABEL_39;
          sub_100003108(1u, (uint64_t)"%s: tethering connection not available or active, teardown external interface", v12, v13, v14, v15, v16, v17, (uint64_t)"event_tethering_status");
          goto LABEL_31;
        case 1u:
          v39 = "event_connection_status";
          sub_100003108(1u, (uint64_t)"%s: conn_state: %s, conn_sts_wait: %s, new_ifname: %s, cur_ifname: %s", v12, v13, v14, v15, v16, v17, (uint64_t)"event_connection_status");
          if (*(_DWORD *)a2 == 3)
          {
            if (*(_BYTE *)(a3 + 1276)
              || *(_BYTE *)(a2 + 8) && strncmp((const char *)(a3 + 308), (const char *)(a2 + 8), 0x100uLL))
            {
LABEL_22:
              sub_100003108(1u, (uint64_t)"%s: tethering connection active, setup external interface", v12, v13, v14, v15, v16, v17, (uint64_t)v39);
              v18 = sub_1000113A4(a3);
              goto LABEL_40;
            }
            goto LABEL_39;
          }
          if (!*(_BYTE *)(a3 + 1270))
          {
LABEL_39:
            v18 = 0;
            goto LABEL_40;
          }
          sub_100003108(1u, (uint64_t)"%s: tethering connection not active, teardown external interface", v12, v13, v14, v15, v16, v17, (uint64_t)"event_connection_status");
LABEL_31:
          *(_DWORD *)(a3 + 12) = 0;
          *(_BYTE *)(a3 + 1270) = 0;
          sub_1000099C8(a3, v40, v41, v42, v43, v44, v45, v46);
          if (!*(_BYTE *)(a3 + 1271))
          {
            sub_10000AFB0(0x1388u, v47, v48, v49, v50, v51, v52, v53, v62);
            *(_BYTE *)(a3 + 1271) = 1;
          }
          v54 = sub_100014844(36, v47, v48, v49, v50, v51, v52, v53);
          *(_BYTE *)(a3 + 1276) = 1;
          if (sub_100014534(v54, v55, v56, v57, v58, v59, v60, v61) == 45)
            v18 = 45;
          else
            v18 = 0;
LABEL_40:
          *(_DWORD *)(a3 + 1272) = v18;
          sub_100006E78((uint64_t *)a3, v11, v12, v13, v14, v15, v16, v17);
          break;
        case 2u:
          sub_100003108(0, (uint64_t)"%s: CoreTelephony connection went away", v12, v13, v14, v15, v16, v17, (uint64_t)"event_connection_invalidated");
          sub_100011528(a3, 0, v19, v20, v21, v22, v23, v24);
          v18 = 36;
          sub_100014844(36, v25, v26, v27, v28, v29, v30, v31);
          sub_1000145BC(0x3FCu, v32, v33, v34, v35, v36, v37, v38);
          goto LABEL_40;
        case 3u:
          if (!dword_100034F30)
            goto LABEL_39;
          sub_100003108(0, (uint64_t)"%s: CoreTelephony connection is now restored", v12, v13, v14, v15, v16, v17, (uint64_t)"event_connection_restored");
          if (dword_100034F30 <= 0)
            sub_100022ABC();
          if (*(_BYTE *)(a3 + 1269))
          {
            v18 = 37;
          }
          else
          {
            v18 = 0;
            *(_BYTE *)(a3 + 1269) = 1;
          }
          goto LABEL_40;
        default:
          sub_100003108(0, (uint64_t)"%s: unhandled CT event(%d)", v12, v13, v14, v15, v16, v17, (uint64_t)"mis_pdp_ct_event_cb");
          v18 = 6;
          goto LABEL_40;
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: ignoring unexpected/invalid CT event for %s callback", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_ct_event_cb");
    }
  }
  else
  {
    sub_100003108(0, (uint64_t)"%s: CT callback for %s with NULL arg", 0, a4, a5, a6, a7, a8, (uint64_t)"mis_pdp_ct_event_cb");
  }
}

uint64_t sub_1000113A4(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  char __s2[8];
  uint64_t v47;
  char __str[8];
  uint64_t v49;

  *(_QWORD *)__str = 0;
  v49 = 0;
  *(_QWORD *)__s2 = 0;
  v47 = 0;
  if (sub_10001F930((uint64_t)__s2))
  {
    sub_100003108(0, (uint64_t)"unable to get interface name", v2, v3, v4, v5, v6, v7, v45);
    v8 = 19;
    sub_100003108(0, (uint64_t)"%s: mis_pdp_get_name_mtu failed %d", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_pdp_setup_external_interface");
  }
  else
  {
    v22 = strncmp((const char *)(a1 + 308), __s2, 0x100uLL);
    if (v22)
    {
      snprintf(__str, 0x10uLL, "%s", (const char *)(a1 + 308));
      sub_1000099C8(a1, v23, v24, v25, v26, v27, v28, v29);
      sub_10000A7B0(a1);
    }
    sub_10000BAB0(a1, __s2);
    v30 = sub_1000079EC((_BYTE *)(a1 + 308));
    *(_DWORD *)(a1 + 296) = v30;
    *(_DWORD *)(a1 + 300) = v30 - 40;
    if (v22)
      sub_10000A88C(a1, __str);
    sub_100003108(0, (uint64_t)"PDP interface is ready [%s, mtu=%d]", v31, v32, v33, v34, v35, v36, a1 + 308);
    v8 = sub_100009444(a1);
    if ((_DWORD)v8)
      sub_100003108(0, (uint64_t)"%s: mis_setup_external_listeners failed %d", v16, v17, v18, v19, v20, v21, (uint64_t)"mis_pdp_setup_external_interface");
  }
  *(_BYTE *)(a1 + 1276) = 0;
  v37 = v8 == 0;
  *(_DWORD *)(a1 + 12) = v37;
  *(_BYTE *)(a1 + 1270) = v37;
  sub_100014844(v8, v15, v16, v17, v18, v19, v20, v21);
  sub_10000857C(a1, v8, v38, v39, v40, v41, v42, v43);
  return v8;
}

uint64_t sub_100011528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t result;

  if ((*(_DWORD *)(a1 + 288) - 102) <= 0xFFFFFFFD)
    sub_100022C74();
  v8 = a2;
  if ((_DWORD)a2 && dword_100034F30)
    sub_100022C9C();
  result = sub_1000099C8(a1, a2, a3, a4, a5, a6, a7, a8);
  *(_BYTE *)(a1 + 1276) = 0;
  if (v8)
  {
    sub_10001F8EC(0, 0, 0);
    result = sub_10001F868(0);
  }
  *(_BYTE *)(a1 + 1269) = 0;
  return result;
}

uint64_t sub_10001159C()
{
  uint64_t result;

  byte_100034F34 = 1;
  result = sub_1000168AC();
  if (!(_DWORD)result)
  {
    sub_1000211C8();
    result = sub_10001F9DC();
    if (!(_DWORD)result)
      return sub_100020ABC();
  }
  return result;
}

uint64_t sub_1000115D4()
{
  uint64_t result;

  if (byte_100034F34 == 1)
  {
    sub_100016DA4();
    sub_1000211E8();
    sub_10001FA58();
    result = nullsub_1();
    byte_100034F34 = 0;
  }
  return result;
}

uint64_t sub_100011610(uint64_t a1)
{
  int v1;
  int v3;
  int v5;
  int v7;
  unsigned int v8;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(_DWORD *)(a1 + 1128);
  if (v1 == 501)
    sub_100022CC4();
  v3 = *(unsigned __int8 *)(a1 + 1107);
  v5 = v1 == 500 && v3 == 0;
  if (v1 != 502 && v3 == v5)
    sub_100022CEC();
  v7 = *(_DWORD *)(a1 + 16);
  sub_10000BAB0(a1, (const char *)(a1 + 28));
  if (v7)
    goto LABEL_21;
  v8 = *(_DWORD *)(a1 + 296);
  if (!v8)
  {
    v8 = 1500;
    goto LABEL_17;
  }
  if (v8 <= 0x4FF)
  {
    v8 = 1280;
LABEL_17:
    *(_DWORD *)(a1 + 296) = v8;
  }
  if (*(_DWORD *)(a1 + 288) != 104)
  {
    v15 = sub_10000DF18((_BYTE *)(a1 + 308), v8);
    if ((_DWORD)v15)
      goto LABEL_30;
  }
  if (!*(_DWORD *)(a1 + 304))
  {
    v15 = sub_100016DBC();
    if (!(_DWORD)v15)
    {
      v16 = sub_10001FA98();
      if ((_DWORD)v16)
      {
        v15 = v16;
        sub_1000178D4(a1, v17, v18, v19, v20, v21, v22, v23);
      }
      else
      {
        if (v1 == 502)
          goto LABEL_21;
        v25 = sub_100020B10();
        if (!(_DWORD)v25)
          goto LABEL_21;
        v15 = v25;
        sub_1000178D4(a1, v26, v27, v28, v29, v30, v31, v32);
        sub_100020968(v33, v34, v35, v36, v37, v38, v39, v40);
      }
    }
LABEL_30:
    sub_100003108(0, (uint64_t)"%s failed (%d) for %s", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_bcast_init");
    return v15;
  }
LABEL_21:
  *(_QWORD *)(a1 + 592) = sub_10001179C;
  *(_QWORD *)(a1 + 600) = sub_100011988;
  *(_QWORD *)(a1 + 632) = 0;
  *(_QWORD *)(a1 + 608) = sub_100011B28;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(_QWORD *)(a1 + 616) = sub_100011C5C;
      *(_QWORD *)(a1 + 624) = sub_100011CE0;
    }
    if (!*(_DWORD *)(a1 + 304))
      sub_100011D14(a1);
  }
  return 0;
}

uint64_t sub_10001179C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;

  v10 = *(_DWORD *)(a2 + 288);
  if (v10 != 102 && v10 != 104)
    sub_100022D14();
  if (*(_DWORD *)(a2 + 16) == 1)
  {
    if (!*(_BYTE *)(a2 + 564))
      goto LABEL_7;
    if (sub_100008FF0() == -1)
      goto LABEL_28;
    if (!*(_BYTE *)(a2 + 564))
    {
LABEL_7:
      v17 = sub_100009444(a2);
      if ((_DWORD)v17)
        goto LABEL_29;
    }
  }
  else
  {
    if (*(_BYTE *)(a2 + 700))
      goto LABEL_28;
    *(_BYTE *)(a2 + 700) = 1;
    v18 = qword_1000354D4;
    LODWORD(qword_1000354D4) = qword_1000354D4 + 1;
    if (v18 < 0)
      sub_100022D64();
    v19 = sub_100012310(a2, a3, a3, a4, a5, a6, a7, a8);
    if ((_DWORD)v19)
    {
      v17 = v19;
      sub_100003108(0, (uint64_t)"%s: failed to setup IPv4 on %s", v20, v21, v22, v23, v24, v25, (uint64_t)"mis_bcast_start");
      goto LABEL_29;
    }
    v26 = sub_100012920(a2, a3, 0, v21, v22, v23, v24, v25);
    if ((_DWORD)v26)
    {
      v17 = v26;
      sub_100003108(0, (uint64_t)"%s: failed to setup IPv6 on %s", v11, v12, v13, v14, v15, v16, (uint64_t)"mis_bcast_start");
      goto LABEL_29;
    }
  }
  if (*(_DWORD *)(a2 + 16) == 1 && *(_BYTE *)(a2 + 564))
  {
    v27 = *(_DWORD *)(a2 + 296);
    if (!v27)
    {
      v27 = 1500;
      *(_DWORD *)(a2 + 296) = 1500;
    }
    *(_DWORD *)(a2 + 300) = v27 - 40;
    goto LABEL_27;
  }
  v28 = sub_1000079EC((_BYTE *)(a2 + 308));
  *(_DWORD *)(a2 + 296) = v28;
  v29 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a2 + 300) = v28 - 40;
  if (v29 == 1)
  {
LABEL_27:
    sub_100003108(0, (uint64_t)"BCAST is ready [%s, mtu=%d ]", v11, v12, v13, v14, v15, v16, a2 + 308);
    goto LABEL_28;
  }
  if (v29)
  {
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  if (!*(_BYTE *)(a3 + 564) && !*(_DWORD *)(a3 + 680)
    || (v17 = sub_100016F1C(a2, a3, v11, v12, v13, v14, v15, v16), !(_DWORD)v17))
  {
    *(_BYTE *)(a2 + 700) = 0;
    if ((int)qword_1000354D4 <= 0)
      sub_100022D3C();
    v17 = 0;
    LODWORD(qword_1000354D4) = qword_1000354D4 - 1;
  }
LABEL_29:
  *(_DWORD *)(a2 + 12) = v17 == 0;
  return v17;
}

void sub_100011988(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  int v10;
  uint64_t *v11;
  int v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  if ((*(_DWORD *)(a1 + 288) - 102) >= 3)
    sub_100022E04();
  if (*(_QWORD *)(a1 + 632))
    sub_100022DDC();
  v9 = *(_DWORD *)(a1 + 1128);
  *(_DWORD *)(a1 + 12) = 0;
  *(_OWORD *)(a1 + 592) = 0u;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_QWORD *)(a1 + 624) = 0;
  if (*(_DWORD *)(a1 + 16) == 1)
  {
    if (*(_DWORD *)(a1 + 20) == 201)
      sub_1000099C8(a1, a2, a3, a4, a5, a6, a7, a8);
    if (*(_BYTE *)(a1 + 564))
      sub_100009320();
    return;
  }
  if (*(_BYTE *)(a1 + 700))
  {
    *(_BYTE *)(a1 + 700) = 0;
    v10 = *(_DWORD *)(a1 + 20);
    if (v10 == 203)
    {
      v11 = (uint64_t *)((char *)&qword_1000354D4 + 4);
      v12 = HIDWORD(qword_1000354D4);
      if (SHIDWORD(qword_1000354D4) <= 0)
        sub_100022DB4();
    }
    else
    {
      if (v10 != 201)
        goto LABEL_15;
      v11 = &qword_1000354D4;
      v12 = qword_1000354D4;
      if ((int)qword_1000354D4 <= 0)
        sub_100022D8C();
    }
    *(_DWORD *)v11 = v12 - 1;
  }
LABEL_15:
  if (*(_DWORD *)(a1 + 304))
    goto LABEL_25;
  sub_1000178D4(a1, a2, a3, a4, a5, a6, a7, a8);
  if (*(_DWORD *)(a1 + 20) != 201)
    goto LABEL_23;
  v13 = xpc_array_create(0, 0);
  if (v13)
  {
    v21 = v13;
    xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1 + 308));
    sub_100021790((char *)(a1 + 565), v21, v22, v23, v24, v25, v26, v27);
    xpc_release(v21);
  }
  if (byte_100035481)
    goto LABEL_25;
  sub_100020968((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  if (v9 != 502)
  {
    sub_100020F6C(v28, v29, v30, v31, v32, v33, v34, v35);
LABEL_23:
    v36 = 1;
    goto LABEL_24;
  }
  sub_10001D2F4(0);
  v36 = 0;
LABEL_24:
  sub_100011FFC(a1, v36, 1);
LABEL_25:
  sub_10000AC24(a1);
  if (*(_DWORD *)(a1 + 288) == 104)
    sub_100018F00((char *)(a1 + 308), v37, v38, v39, v40, v41, v42, v43);
}

uint64_t sub_100011B28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  int v11;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_DWORD *)(a3 + 16) || (v9 = *(_DWORD *)(a3 + 288), v9 != 102) && v9 != 104)
    sub_100022E2C();
  if (*(_DWORD *)(a2 + 1128) != 502 && !*(_BYTE *)(a2 + 704) && *(_BYTE *)(a2 + 1107))
    sub_100022EA4();
  if (*(_BYTE *)(a3 + 700))
    return 0;
  *(_BYTE *)(a3 + 700) = 1;
  v11 = qword_1000354D4;
  LODWORD(qword_1000354D4) = qword_1000354D4 + 1;
  if (v11 < 0)
    sub_100022E54();
  if (*(_DWORD *)(a3 + 1128) == 502)
    a1 = sub_10001D2F4(1u);
  v12 = sub_10001FB48(a1, a2, a3, a4, a5, a6, a7, a8);
  if ((_DWORD)v12)
  {
    v10 = v12;
    strerror(v12);
    sub_100003108(0, (uint64_t)"unable to start rtadvd for %s: %s", v20, v21, v22, v23, v24, v25, a3 + 308);
  }
  else if (*(_DWORD *)(a3 + 1128) == 502 || (v26 = sub_100020BC0(v12, v13, v14, v15, v16, v17, v18, v19), !(_DWORD)v26))
  {
    *(_BYTE *)(a3 + 700) = 0;
    if ((int)qword_1000354D4 <= 0)
      sub_100022E7C();
    v10 = 0;
    LODWORD(qword_1000354D4) = qword_1000354D4 - 1;
  }
  else
  {
    v10 = v26;
    strerror(v26);
    sub_100003108(0, (uint64_t)"unable to start dhcpd for %s: %s", v27, v28, v29, v30, v31, v32, a3 + 308);
  }
  return v10;
}

uint64_t sub_100011C5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104)
    sub_100022ECC();
  v8 = a2 + 308;
  v15 = sub_100018B7C((char *)(a2 + 308), (char *)(a1 + 308), a3, 0, *(_DWORD *)(a2 + 1240) & 1, 0, a7, a8);
  if ((_DWORD)v15)
    sub_100003108(0, (uint64_t)"failed to add member %s to bridge %s", v9, v10, v11, v12, v13, v14, v8);
  return v15;
}

uint64_t sub_100011CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 288) != 104)
    sub_100022EF4();
  return sub_100019220((char *)(a2 + 308), (char *)(a1 + 308), a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100011D14(uint64_t result)
{
  uint64_t v1;
  char v2;
  int v3;
  in_addr_t s_addr;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  const char *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  in_addr v29;
  timespec v30;
  CC_SHA256_CTX c;
  int v32;
  in_addr_t data;
  unsigned __int8 md[32];

  if (*(_DWORD *)(result + 16) || (v1 = result, *(_DWORD *)(result + 304)))
    sub_100022F1C();
  v29.s_addr = 0;
  if (*(_DWORD *)(result + 292))
  {
    *(_DWORD *)(result + 684) = -251658241;
    v2 = sub_10000EFC8(0xF0FFFFFF);
    v3 = *(_DWORD *)(v1 + 292);
    result = inet_aton("172.19.73.1", &v29);
    s_addr = v29.s_addr;
    v5 = (bswap32(v29.s_addr & 0xF0FFFFFF) + (v3 - 1) * (16 << -v2)) | 1;
LABEL_9:
    *(_DWORD *)(v1 + 680) = bswap32(v5);
    goto LABEL_10;
  }
  v6 = *(_DWORD *)(result + 692);
  if (v6)
  {
    s_addr = 0;
    v7 = *(_DWORD *)(result + 684) & v6;
    v8 = bswap32(v6);
    v9 = bswap32(v7);
    if (v7 == v6)
      v5 = v9 + 1;
    else
      v5 = v8;
    goto LABEL_9;
  }
  if ((*(_BYTE *)(result + 584) & 2) != 0)
  {
    c.count[0] = 0;
    result = sub_100014F48(*(_DWORD *)(result + 20), &v29, &c);
    if ((_DWORD)result)
    {
      if (*(_DWORD *)(v1 + 20) == 201)
        v19 = "192.168.64.1";
      else
        v19 = "192.168.128.1";
      result = inet_aton(v19, &v29);
      v20 = -256;
    }
    else
    {
      v20 = bswap32(c.count[0]);
    }
    s_addr = v29.s_addr;
    *(_DWORD *)(v1 + 680) = bswap32((bswap32(v29.s_addr) & v20) + 1);
    v18 = bswap32(v20);
  }
  else
  {
    result = inet_aton("172.20.10.1", &v29);
    s_addr = v29.s_addr;
    *(_DWORD *)(v1 + 680) = v29.s_addr & 0xF0FFFFFF | 0x1000000;
    v18 = -251658241;
  }
  *(_DWORD *)(v1 + 684) = v18;
LABEL_10:
  if (!byte_100035481 && *(_DWORD *)(v1 + 1128) == 500 && !*(_BYTE *)(v1 + 1107) && !*(_BYTE *)(v1 + 1178))
  {
    v27 = 0;
    v28 = 0;
    v32 = *(_DWORD *)(v1 + 684);
    data = s_addr;
    memset(&c, 0, sizeof(c));
    v30.tv_sec = 0;
    v30.tv_nsec = 0;
    if ((byte_100034F45 & 1) == 0)
    {
      if (gethostuuid(byte_100034F35, &v30))
      {
        v10 = __error();
        v11 = strerror(*v10);
        sub_100003108(0, (uint64_t)"gethostuuid failed %s", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      }
      else
      {
        byte_100034F45 = 1;
      }
    }
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, &data, 4u);
    CC_SHA256_Update(&c, &v32, 4u);
    if (byte_100034F45 == 1)
      CC_SHA256_Update(&c, byte_100034F35, 0x10u);
    CC_SHA256_Final(md, &c);
    LOBYTE(v27) = -3;
    *(_DWORD *)((char *)&v27 + 1) = *(_DWORD *)md;
    HIDWORD(v27) = *(_DWORD *)&md[3];
    v28 = 0;
    *(_BYTE *)(v1 + 1178) = 64;
    inet_ntop(30, &v27, (char *)(v1 + 1132), 0x2Eu);
    return sub_100003108(1u, (uint64_t)"generated ula prefix %s/%d for interface %s", v21, v22, v23, v24, v25, v26, v1 + 1132);
  }
  return result;
}

uint64_t sub_100011FFC(uint64_t a1, int a2, int a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((*(_DWORD *)(a1 + 288) - 102) >= 3)
    sub_100022F6C();
  if (*(_DWORD *)(a1 + 16))
    sub_100022F44();
  if (a2)
  {
    v6 = sub_100012174(a1);
    if (v6)
    {
      strerror(v6);
      sub_100003108(0, (uint64_t)"routes_del(%s): %s", v7, v8, v9, v10, v11, v12, a1 + 308);
    }
  }
  if (a3)
  {
    v13 = sub_10000DB28((const char *)(a1 + 308));
    if (v13)
    {
      strerror(v13);
      sub_100003108(0, (uint64_t)"stop link local(%s): %s:", v14, v15, v16, v17, v18, v19, a1 + 308);
    }
  }
  if (*(_DWORD *)(a1 + 20) == 201)
  {
    if (a2)
      sub_10000E6E8((const char *)(a1 + 308));
    if (a3)
      sub_10000E860((const char *)(a1 + 308));
  }
  v20 = (char *)(a1 + 308);
  v21 = sub_10000C514(v20);
  v22 = v21;
  if ((_DWORD)v21)
  {
    strerror(v21);
    sub_100003108(0, (uint64_t)"remove_addrs(%s): %s", v23, v24, v25, v26, v27, v28, (uint64_t)v20);
  }
  if (a2)
  {
    v29 = sub_10000D894(v20);
    v22 = v29;
    if ((_DWORD)v29)
    {
      strerror(v29);
      sub_100003108(0, (uint64_t)"protodetach(%s): %s", v30, v31, v32, v33, v34, v35, (uint64_t)v20);
    }
  }
  if (a3)
  {
    v36 = sub_10000DC60(v20);
    v22 = v36;
    if ((_DWORD)v36)
    {
      strerror(v36);
      sub_100003108(0, (uint64_t)"protodetach(%s): %s", v37, v38, v39, v40, v41, v42, (uint64_t)v20);
    }
  }
  sub_10000D1BC(v20, a3, 0, 0);
  return v22;
}

uint64_t sub_100012174(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  char *v10;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;

  v2 = (char *)(a1 + 308);
  v3 = if_nametoindex((const char *)(a1 + 308));
  if ((_DWORD)v3)
  {
    if (*(_DWORD *)(a1 + 680))
    {
      v4 = socket(17, 3, 2);
      if (v4 < 0)
      {
        v3 = *__error();
        sub_100003108(0, (uint64_t)"socket: %m", v24, v25, v26, v27, v28, v29, v44);
      }
      else
      {
        v5 = v4;
        v6 = *(_DWORD *)(a1 + 680);
        v7 = *(_DWORD *)(a1 + 684);
        v8 = v7 & v6;
        v9 = sub_100012E40(v4, 2, v7 & v6, v6, v7, v2, 0, v6, 0);
        v10 = sub_10000EFF0(v8, *(_DWORD *)(a1 + 684));
        v17 = (uint64_t)v10;
        if (v9)
        {
          strerror(v9);
          sub_100003108(0, (uint64_t)"unable to remove subnet route %s on %s: %s", v18, v19, v20, v21, v22, v23, v17);
        }
        else
        {
          sub_100003108(1u, (uint64_t)"subnet route %s removed on %s", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
        }
        v30 = sub_100012E40(v5, 2, 0, *(_DWORD *)(a1 + 680), 0, v2, v3, *(_DWORD *)(a1 + 680), 3);
        v3 = v30;
        if ((_DWORD)v30)
        {
          strerror(v30);
          sub_100003108(0, (uint64_t)"unable to remove scoped default route on %s: %s", v37, v38, v39, v40, v41, v42, (uint64_t)v2);
        }
        else
        {
          sub_100003108(1u, (uint64_t)"scoped default route removed on %s", v31, v32, v33, v34, v35, v36, (uint64_t)v2);
        }
        close(v5);
      }
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

BOOL sub_1000122E4(unsigned int a1)
{
  unsigned int v1;
  BOOL v2;
  unsigned int v3;

  v1 = bswap32(a1);
  v2 = HIBYTE(v1) == 10 || v1 >> 20 == 2753;
  v3 = HIWORD(v1);
  return v2 || v3 == 49320;
}

uint64_t sub_100012310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  int v10;
  char v12;
  unsigned int v13;
  unsigned int v14;
  BOOL v15;
  unsigned int v16;
  char v18;
  int v19;
  BOOL v20;
  int v21;
  char v22;
  int v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  ifaddrs *v27;
  sockaddr *ifa_addr;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  in_addr v42;
  char *v43;
  in_addr v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v69;
  char v70;
  unsigned int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int16 v78;
  int v79;
  int v80;
  int v81;
  uint64_t v82;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
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
  uint64_t v110;
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
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  char __str[16];
  ifaddrs *v142[2];

  if ((*(_DWORD *)(a1 + 288) - 102) >= 3)
    sub_10002305C();
  if (*(_DWORD *)(a1 + 16))
    sub_100023034();
  if (*(_DWORD *)(a1 + 304))
    sub_10002300C();
  if (*(_BYTE *)(a1 + 701))
    return 0;
  v10 = *(_DWORD *)(a1 + 1128);
  if (*(_DWORD *)(a1 + 20) == 201 && !*(_BYTE *)(a2 + 564) && !*(_DWORD *)(a2 + 680))
  {
    if (*(_BYTE *)(a2 + 308))
    {
      sub_100003108(1u, (uint64_t)"external interface %s is not configured with IPv4 address", a3, a4, a5, a6, a7, a8, a2 + 308);
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: external interface name is blank", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_bcast_setup_v4_service");
      if (*(_BYTE *)(a2 + 1276))
      {
        v137 = "in-progress";
      }
      else if (*(_DWORD *)(a2 + 12))
      {
        v137 = "active";
      }
      else
      {
        v137 = "unknown";
      }
      sub_100003108(0, (uint64_t)"PDP context state is '%s'", v131, v132, v133, v134, v135, v136, (uint64_t)v137);
    }
    return 0;
  }
  sub_10000E6E8((const char *)(a1 + 308));
  v142[0] = 0;
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3)
    sub_100022FE4();
  if (*(_DWORD *)(a1 + 16))
    sub_100022FBC();
  if (getifaddrs(v142) < 0)
  {
    v9 = *__error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v30, v31, v32, v33, v34, v35, v138);
  }
  else
  {
    v12 = sub_10000EFC8(*(_DWORD *)(a1 + 684));
    v13 = *(_DWORD *)(a1 + 680);
    v14 = bswap32(v13);
    v15 = HIBYTE(v14) == 10 || v14 >> 20 == 2753;
    v16 = HIWORD(v14);
    v18 = v15 || v16 == 49320;
    v19 = *(_DWORD *)(a1 + 692);
    v20 = 1;
    if (!v19)
      v20 = *(_BYTE *)(a1 + 688) != 0;
    if (v142[0])
    {
      v21 = *(_DWORD *)(a1 + 684);
      v22 = v20 | v18 ^ 1;
      v23 = (1 << (32 - v12)) + 1;
      v24 = 255 << (32 - v12);
      v25 = *(_DWORD *)(a1 + 680);
      v9 = 49;
      while (1)
      {
        v26 = v25 & v21;
        v27 = v142[0];
        while (1)
        {
          ifa_addr = v27->ifa_addr;
          if (ifa_addr->sa_family == 2)
          {
            v29 = *(_DWORD *)&ifa_addr->sa_data[2];
            if (v29 == v25 || (*(_DWORD *)&v27->ifa_netmask->sa_data[2] & v29) == v26)
              break;
          }
          v27 = v27->ifa_next;
          if (!v27)
          {
            v13 = v25;
            goto LABEL_35;
          }
        }
        if ((v22 & 1) != 0)
          break;
        v25 = bswap32(v23 + bswap32(v26));
        if ((bswap32((v25 ^ v13) & v21) & v24) == 0)
          goto LABEL_40;
      }
      v9 = 48;
    }
    else
    {
LABEL_35:
      *(_DWORD *)(a1 + 680) = v13;
      if ((!v19 || !*(_BYTE *)(a1 + 688)) && (*(_BYTE *)(a1 + 584) & 2) != 0)
        sub_100015068(*(_DWORD *)(a1 + 20), (const void *)(a1 + 680), (const void *)(a1 + 684));
      v9 = 0;
    }
  }
LABEL_40:
  if (v142[0])
    freeifaddrs(v142[0]);
  if ((_DWORD)v9)
  {
    v139 = strerror(v9);
    sub_100003108(0, (uint64_t)"mis_bcast_fix_addrs: %s", v36, v37, v38, v39, v40, v41, (uint64_t)v139);
  }
  else
  {
    v42.s_addr = *(_DWORD *)(a1 + 680);
    v43 = inet_ntoa(v42);
    snprintf((char *)v142, 0x10uLL, "%s", v43);
    v44.s_addr = *(_DWORD *)(a1 + 684);
    v45 = inet_ntoa(v44);
    snprintf(__str, 0x10uLL, "%s", v45);
    if (v10 != 502 && *(_DWORD *)(a1 + 20) == 201 && (v46 = sub_10000E5CC((const char *)(a1 + 308)), (_DWORD)v46))
    {
      v9 = v46;
      sub_100003108(0, (uint64_t)"unable to start router on %s", v47, v48, v49, v50, v51, v52, a1 + 308);
    }
    else
    {
      v53 = (int *)(a1 + 680);
      v54 = (int *)(a1 + 684);
      v55 = sub_10000E078((const char *)(a1 + 308), (_DWORD *)(a1 + 680), (_DWORD *)(a1 + 684), 0);
      if ((_DWORD)v55)
      {
        v9 = v55;
        strerror(v55);
        sub_100003108(0, (uint64_t)"mis_aifaddr(%s,%s,%s): %s", v62, v63, v64, v65, v66, v67, a1 + 308);
      }
      else
      {
        sub_100003108(0, (uint64_t)"added addr=%s mask=%s on %s", v56, v57, v58, v59, v60, v61, (uint64_t)v142);
        if (v10 == 502)
        {
LABEL_52:
          v9 = 0;
          *(_BYTE *)(a1 + 701) = 1;
        }
        else
        {
          v69 = 1;
          v70 = 1;
          do
          {
            v71 = if_nametoindex((const char *)(a1 + 308));
            if (v71)
            {
              if (!*v53)
                goto LABEL_52;
              v78 = v71;
              v79 = socket(17, 3, 2);
              if (v79 < 0)
              {
                v9 = *__error();
                sub_100003108(0, (uint64_t)"socket: %m", v100, v101, v102, v103, v104, v105, v140);
              }
              else
              {
                v80 = v79;
                v81 = *v54 & *v53;
                v82 = sub_100012E40(v79, 1, v81, *v53, *v54, (char *)(a1 + 308), 0, *v53, 1);
                v9 = v82;
                if (!(_DWORD)v82 || (_DWORD)v82 == 17)
                {
                  v84 = sub_10000EFF0(v81, *v54);
                  sub_100003108(1u, (uint64_t)"subnet route %s %sadded on %s", v85, v86, v87, v88, v89, v90, (uint64_t)v84);
                  v91 = sub_100012E40(v80, 1, 0, *v53, 0, (char *)(a1 + 308), v78, *v53, 3);
                  v98 = v91;
                  if ((_DWORD)v91 && (_DWORD)v91 != 17)
                  {
                    strerror(v91);
                    sub_100003108(0, (uint64_t)"unable to add scoped default route on %s: %s", v113, v114, v115, v116, v117, v118, a1 + 308);
                    v9 = v98;
                  }
                  else
                  {
                    v99 = "(already) ";
                    if (!(_DWORD)v91)
                      v99 = (const char *)&unk_10002576D;
                    sub_100003108(1u, (uint64_t)"scoped default route %sadded on %s", v92, v93, v94, v95, v96, v97, (uint64_t)v99);
                    v9 = 0;
                    if ((_DWORD)v98 && (_DWORD)v98 != 17)
                      sub_100022F94();
                  }
                }
                else
                {
                  v106 = sub_10000EFF0(v81, *v54);
                  strerror(v9);
                  sub_100003108(0, (uint64_t)"unable to add subnet route %s on %s: %s", v107, v108, v109, v110, v111, v112, (uint64_t)v106);
                }
                close(v80);
              }
              if (!(_DWORD)v9)
                goto LABEL_52;
            }
            else
            {
              sub_100003108(0, (uint64_t)"setup_routes: interface %s is not or no longer valid", v72, v73, v74, v75, v76, v77, a1 + 308);
              v9 = 19;
            }
            sub_100012174(a1);
            if ((v70 & 1) == 0)
            {
              strerror(v9);
              sub_100003108(0, (uint64_t)"setup_routes(%s) try #%d: %s", v119, v120, v121, v122, v123, v124, a1 + 308);
              sleep(1u);
            }
            v70 = 0;
            ++v69;
          }
          while (v69 != 4);
          strerror(v9);
          sub_100003108(0, (uint64_t)"setup_routes(%s): %s", v125, v126, v127, v128, v129, v130, a1 + 308);
        }
      }
    }
  }
  return v9;
}

uint64_t sub_100012920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  __int128 v51;
  char v52[46];

  if (byte_100035481)
  {
    sub_100003108(0, (uint64_t)"%s: not enabling IPv6 on %s", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_bcast_setup_v6_service");
    return 0;
  }
  if ((*(_DWORD *)(a1 + 288) - 102) >= 3)
    sub_1000230D4();
  if (*(_DWORD *)(a1 + 16))
    sub_1000230AC();
  if (*(_DWORD *)(a1 + 304))
    sub_100023084();
  if (!(_DWORD)a3)
  {
    if (sub_10000DB28((const char *)(a1 + 308)))
    {
      strerror(0);
      sub_100003108(0, (uint64_t)"mis_stop_linklocal(%s): %s:", v12, v13, v14, v15, v16, v17, a1 + 308);
      return 0;
    }
    v18 = sub_10000D010((_BYTE *)(a1 + 308));
    if ((_DWORD)v18)
    {
      v9 = v18;
      strerror(v18);
      sub_100003108(0, (uint64_t)"unable to attach ipv6 proto %s: %s", v19, v20, v21, v22, v23, v24, a1 + 308);
      return v9;
    }
    v31 = sub_10000D4F4((const char *)(a1 + 308));
    if ((_DWORD)v31)
    {
      v9 = v31;
      strerror(v31);
      sub_100003108(0, (uint64_t)"unable to start linklocal %s: %s", v32, v33, v34, v35, v36, v37, a1 + 308);
      return v9;
    }
    if (*(_BYTE *)(a1 + 688)
      && (*(_DWORD *)(a1 + 648) || *(_DWORD *)(a1 + 652) || *(_DWORD *)(a1 + 656) || *(_DWORD *)(a1 + 660)))
    {
      inet_ntop(30, (const void *)(a1 + 648), v52, 0x2Eu);
      v51 = xmmword_100025140;
      if (sub_10000E1D8((const char *)(a1 + 308), (_OWORD *)(a1 + 648), &v51, 0))
      {
        sub_100003108(0, (uint64_t)"failed to set %s address on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v52);
        return 0;
      }
      sub_100003108(0, (uint64_t)"added %s/%d on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v52);
    }
  }
  if (*(_DWORD *)(a1 + 20) != 201)
    return 0;
  if (*(_DWORD *)(a1 + 1128) != 502)
  {
    if (*(_BYTE *)(a2 + 1107))
    {
      if (!*(_BYTE *)(a2 + 704))
        goto LABEL_13;
    }
    else if (!*(_BYTE *)(a2 + 564) && !*(_BYTE *)(a2 + 1105))
    {
LABEL_13:
      if (*(_BYTE *)(a2 + 308))
      {
        sub_100003108(0, (uint64_t)"external interface %s is not configured with IPv6 address", a3, a4, a5, a6, a7, a8, a2 + 308);
      }
      else
      {
        sub_100003108(0, (uint64_t)"%s: external interface name is blank", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_bcast_setup_v6_service");
        if (*(_BYTE *)(a2 + 1276))
        {
          v50 = "in-progress";
        }
        else if (*(_DWORD *)(a2 + 12))
        {
          v50 = "active";
        }
        else
        {
          v50 = "unknown";
        }
        sub_100003108(0, (uint64_t)"PDP context state is '%s'", v44, v45, v46, v47, v48, v49, (uint64_t)v50);
      }
      return 0;
    }
  }
  v9 = sub_10000E6F0((const char *)(a1 + 308));
  if ((_DWORD)v9)
    sub_100003108(0, (uint64_t)"unable to start router6 on %s", v25, v26, v27, v28, v29, v30, a1 + 308);
  return v9;
}

uint64_t sub_100012BCC(uint64_t a1)
{
  unsigned int v2;
  uint64_t result;

  if (!*(_DWORD *)(a1 + 16))
  {
    sub_10000BAB0(a1, (const char *)(a1 + 28));
    v2 = *(_DWORD *)(a1 + 296);
    if (v2)
    {
      if (v2 > 0x4FF)
        goto LABEL_8;
      v2 = 1280;
    }
    else
    {
      v2 = 1500;
    }
    *(_DWORD *)(a1 + 296) = v2;
LABEL_8:
    if (*(_DWORD *)(a1 + 288) != 104)
    {
      result = sub_10000DF18((_BYTE *)(a1 + 308), v2);
      if ((_DWORD)result)
        return result;
    }
    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203)
    {
      result = sub_100016DBC();
      if ((_DWORD)result)
        return result;
    }
    goto LABEL_13;
  }
  sub_10000BAB0(a1, "bcast-local");
  *(_DWORD *)(a1 + 296) = 1500;
LABEL_13:
  *(_QWORD *)(a1 + 592) = sub_100012CD4;
  *(_QWORD *)(a1 + 600) = sub_100011988;
  *(_QWORD *)(a1 + 632) = 0;
  if (!*(_DWORD *)(a1 + 16))
  {
    if (*(_DWORD *)(a1 + 288) == 104)
    {
      *(_QWORD *)(a1 + 616) = sub_100011C5C;
      *(_QWORD *)(a1 + 624) = sub_100011CE0;
    }
    if (!*(_DWORD *)(a1 + 304) && *(_DWORD *)(a1 + 20) == 203)
      sub_100011D14(a1);
  }
  return 0;
}

uint64_t sub_100012CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;

  if ((*(_DWORD *)(a2 + 288) - 105) <= 0xFFFFFFFD)
    sub_1000230FC();
  v9 = *(_DWORD *)(a2 + 16);
  if (v9)
    goto LABEL_3;
  if (!*(_BYTE *)(a2 + 700))
  {
    *(_BYTE *)(a2 + 700) = 1;
    v13 = *(_DWORD *)(a2 + 20);
    if (v13 == 204)
      goto LABEL_19;
    if (v13 == 203)
    {
      v14 = HIDWORD(qword_1000354D4)++;
      if (v14 < 0)
        sub_100023124();
    }
    if (*(_DWORD *)(a2 + 680))
    {
      v15 = sub_100012310(a2, a3, a3, a4, a5, a6, a7, a8);
      if ((_DWORD)v15)
      {
        v10 = v15;
        sub_100003108(0, (uint64_t)"failed to setup IPv4 on %s", v16, a4, a5, a6, a7, a8, a2 + 308);
        goto LABEL_8;
      }
    }
    v17 = sub_100012920(a2, a3, 0, a4, a5, a6, a7, a8);
    if ((_DWORD)v17)
    {
      v10 = v17;
      sub_100003108(0, (uint64_t)"failed to setup IPv6 on %s", a3, a4, a5, a6, a7, a8, a2 + 308);
      goto LABEL_8;
    }
    v9 = *(_DWORD *)(a2 + 16);
    if (!v9)
    {
LABEL_19:
      v18 = sub_1000079EC((_BYTE *)(a2 + 308));
      v9 = *(_DWORD *)(a2 + 16);
      *(_DWORD *)(a2 + 296) = v18;
      if (!v9)
      {
        if (*(_DWORD *)(a2 + 20) == 203)
        {
          v10 = sub_100016F1C(a2, a3, a3, a4, a5, a6, a7, a8);
          goto LABEL_8;
        }
        goto LABEL_7;
      }
      goto LABEL_4;
    }
LABEL_3:
    *(_DWORD *)(a2 + 296) = 1500;
LABEL_4:
    if (v9 == 1)
      sub_100003108(0, (uint64_t)"BCAST-LOCAL is ready [%s, mtu=%d]", a3, a4, a5, a6, a7, a8, a2 + 308);
  }
LABEL_7:
  v10 = 0;
LABEL_8:
  *(_DWORD *)(a2 + 12) = v10 == 0;
  return v10;
}

uint64_t sub_100012E40(int a1, char a2, int a3, int a4, int a5, char *__s, __int16 a7, int a8, char a9)
{
  int v13;
  unsigned int v14;
  char *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[14];

  v25 = 0u;
  memset(v26, 0, 220);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  BYTE3(v18) = a2;
  BYTE2(v18) = 5;
  v13 = dword_100034D48++;
  DWORD1(v19) = v13;
  if (a9 & 1 | a3)
    v14 = 2305;
  else
    v14 = 2051;
  *((_QWORD *)&v18 + 1) = v14 | 0x3700000000;
  if ((a9 & 2) != 0)
  {
    WORD2(v18) = a7;
    v14 |= 0x1000000u;
    DWORD2(v18) = v14;
  }
  WORD6(v23) = 528;
  LODWORD(v24) = a3;
  if ((v14 & 2) != 0)
  {
    WORD6(v24) = 528;
    LODWORD(v25) = a4;
    v15 = (char *)&v25 + 12;
  }
  else
  {
    WORD6(v24) = 4628;
    BYTE1(v25) = strlen(__s);
    __memmove_chk((char *)&v25 + 4, __s, BYTE1(v25), 232);
    v15 = (char *)v26;
  }
  *(_WORD *)v15 = 528;
  *((_DWORD *)v15 + 1) = a5;
  *((_WORD *)v15 + 8) = 4628;
  v16 = strlen(__s);
  v15[21] = v16;
  memmove(v15 + 24, __s, v16);
  *((_WORD *)v15 + 18) = 528;
  *((_DWORD *)v15 + 10) = a8;
  LOWORD(v18) = (_WORD)v15 - ((unsigned __int16)&v23 + 12) + 144;
  if (write(a1, &v18, (int)((_DWORD)v15 - (&v23 + 12) + 144)) == -1)
    return *__error();
  else
    return 0;
}

uint64_t sub_100013010()
{
  const __SCDynamicStore *v0;
  const __CFURL *v1;
  const __CFURL *v2;
  const __CFString *v3;
  const __CFString *v4;
  passwd *v5;
  size_t v6;
  char *v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  CFTypeID TypeID;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const void *Value;
  const void *v24;
  CFTypeID v25;
  const void *v26;
  const void *v27;
  CFTypeID v28;
  const void *v29;
  const void *v30;
  const __CFString *v31;
  CFTypeID v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v62;
  BOOL v63;
  int v64;
  uint64_t v65;
  const __SCPreferences *v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  const __CFDictionary *Mutable;
  const __CFDictionary *v84;
  const __CFDictionary *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  CFArrayRef *v92;
  const __CFArray *v93;
  const __CFArray *v94;
  const char *v95;
  const __CFArray *v96;
  CFMutableArrayRef MutableCopy;
  CFIndex Count;
  CFIndex v99;
  CFIndex v100;
  char v101;
  CFMutableArrayRef *v102;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v104;
  CFTypeID v105;
  CFBooleanRef v106;
  CFTypeID v107;
  BOOL v108;
  __CFDictionary *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  __CFDictionary *v116;
  const void **v117;
  CFIndex v118;
  CFIndex v119;
  CFIndex v120;
  const void *v121;
  const void *v122;
  CFTypeID v123;
  CFBooleanRef v124;
  CFTypeID v125;
  __CFDictionary *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  __CFDictionary *v134;
  const void *v135;
  uid_t v136;
  gid_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const __CFString *v145;
  const __CFURL *v146;
  int v147;
  int v148;
  unsigned int v149;

  byte_100034F48 = 1;
  v0 = SCDynamicStoreCreate(kCFAllocatorDefault, CFSTR("com.apple.MobileInternetSharing"), 0, 0);
  qword_100034F50 = (uint64_t)v0;
  if (!v0)
  {
    v39 = SCError();
    SCErrorString(v39);
    sub_100003108(0, (uint64_t)"%s: SCDynamicStoreCreate() failed: %s", v40, v41, v42, v43, v44, v45, (uint64_t)"mis_set_load");
    return 12;
  }
  if (!SCDynamicStoreSetDispatchQueue(v0, (dispatch_queue_t)qword_100035470))
  {
    v46 = SCError();
    SCErrorString(v46);
    sub_100003108(0, (uint64_t)"%s: SCDynamicStoreSetDispatchQueue() failed: %s", v47, v48, v49, v50, v51, v52, (uint64_t)"mis_set_load");
    return 12;
  }
  if (!SCDynamicStoreSetDisconnectCallBack(qword_100034F50, sub_100013940))
  {
    v53 = SCError();
    SCErrorString(v53);
    sub_100003108(0, (uint64_t)"%s: SCDynamicStoreSetDisconnectCallBack() failed: %s", v54, v55, v56, v57, v58, v59, (uint64_t)"mis_set_load");
    return 12;
  }
  v1 = (const __CFURL *)CFCopyHomeDirectoryURLForUser(CFSTR("mobile"));
  if (!v1)
    return 2;
  v2 = v1;
  v147 = 0;
  v3 = CFURLCopyFileSystemPath(v1, kCFURLPOSIXPathStyle);
  if (!v3)
  {
    v60 = 12;
    goto LABEL_114;
  }
  v4 = v3;
  CFStringGetCString(v3, byte_100034F58, 1024, 0x600u);
  v5 = getpwnam("mobile");
  if (!v5)
  {
    v60 = 2;
    goto LABEL_113;
  }
  dword_100035358 = v5->pw_gid;
  if (qword_100035360)
    free((void *)qword_100035360);
  v6 = strlen(byte_100034F58) + 59;
  v7 = (char *)malloc_type_malloc(v6, 0x29EFF63DuLL);
  qword_100035360 = (uint64_t)v7;
  if (!v7)
  {
LABEL_102:
    v60 = 12;
    goto LABEL_113;
  }
  snprintf(v7, v6, "%s%s", byte_100034F58, "/Library/Preferences/com.apple.MobileInternetSharing.plist");
  *(_OWORD *)&dword_10003536C = 0u;
  *(_OWORD *)&dword_10003537C = 0u;
  unk_10003538C = 0u;
  unk_10003539C = 0;
  dword_100035368[0] = 3;
  qword_100035370 = (uint64_t)vdup_n_s32(0x3FCu);
  dword_10003537C = 0;
  if (!qword_100035360)
    sub_10002314C();
  v148 = 0;
  v8 = sub_10000EE38((const char *)qword_100035360, &v148, 1);
  if (!v8)
  {
    sub_100003108(0, (uint64_t)"%s: failed (%d) to read settings from %s", v9, v10, v11, v12, v13, v14, (uint64_t)"read_settings");
    if (!v148)
      sub_100023174();
    v63 = 0;
    v64 = dword_100035368[0];
    goto LABEL_39;
  }
  v15 = (const void *)v8;
  TypeID = CFDictionaryGetTypeID();
  if (CFGetTypeID(v15) != TypeID)
    goto LABEL_32;
  Value = CFDictionaryGetValue((CFDictionaryRef)v15, CFSTR("Version"));
  if (!Value)
    goto LABEL_32;
  v24 = Value;
  v25 = CFNumberGetTypeID();
  if (CFGetTypeID(v24) != v25)
    goto LABEL_32;
  v26 = CFDictionaryGetValue((CFDictionaryRef)v15, CFSTR("State"));
  if (!v26)
    goto LABEL_32;
  v27 = v26;
  v28 = CFNumberGetTypeID();
  if (CFGetTypeID(v27) != v28
    || (v29 = CFDictionaryGetValue((CFDictionaryRef)v15, CFSTR("UState"))) == 0
    || (v30 = v29, v31 = v4, v32 = CFNumberGetTypeID(), v108 = CFGetTypeID(v30) == v32, v4 = v31, !v108))
  {
LABEL_32:
    sub_100003108(0, (uint64_t)"%s: failed to get properties from plist file", v17, v18, v19, v20, v21, v22, (uint64_t)"read_settings");
    v62 = 2;
LABEL_33:
    v148 = v62;
    goto LABEL_34;
  }
  if (!CFNumberGetValue((CFNumberRef)v24, kCFNumberIntType, dword_100035368)
    || !CFNumberGetValue((CFNumberRef)v27, kCFNumberIntType, &qword_100035370)
    || !CFNumberGetValue((CFNumberRef)v30, kCFNumberIntType, &dword_10003536C))
  {
    sub_100003108(0, (uint64_t)"%s: failed to retrieve property values", v33, v34, v35, v36, v37, v38, (uint64_t)"read_settings");
    v62 = 22;
    goto LABEL_33;
  }
  v148 = sub_100016450(v15);
LABEL_34:
  CFRelease(v15);
  v63 = v148 == 0;
  v64 = dword_100035368[0];
  if (!v148 && dword_100035368[0] == 3)
  {
    v65 = qword_100035370;
    v63 = 1;
    goto LABEL_41;
  }
LABEL_39:
  v65 = 1020;
  if (v64 != 3)
    LODWORD(qword_100035370) = 1020;
LABEL_41:
  if (dword_10003536C != 1023)
    dword_10003536C = 1022;
  v66 = SCPreferencesCreate(0, CFSTR("com.apple.MobileInternetSharing"), CFSTR("com.apple.radios.plist"));
  qword_1000353A8 = (uint64_t)v66;
  if (v66)
  {
    if (SCPreferencesSetCallback(v66, (SCPreferencesCallBack)sub_100013970, 0)
      && SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_1000353A8, (dispatch_queue_t)qword_100035470))
    {
      sub_1000139BC();
    }
    else
    {
      v68 = SCError();
      SCErrorString(v68);
      sub_100003108(0, (uint64_t)"%s: radio pref callback setup failed: %s\n", v69, v70, v71, v72, v73, v74, (uint64_t)"mis_set_load");
      CFRelease((CFTypeRef)qword_1000353A8);
      qword_1000353A8 = 0;
    }
  }
  else
  {
    v75 = SCError();
    SCErrorString(v75);
    sub_100003108(0, (uint64_t)"%s: SCPreferencesCreate() failed: %s\n", v76, v77, v78, v79, v80, v81, (uint64_t)"mis_set_load");
  }
  sub_100013A70(0, 0, v65, 0, 0, &v147, 0, v67);
  if (!v147)
  {
    if ((_DWORD)qword_100035370 != (_DWORD)v65 || !v63)
      sub_100013F88();
    sub_100014030((const __SCDynamicStore *)qword_100034F50);
  }
  v149 = 0;
  Mutable = (const __CFDictionary *)qword_1000353C0;
  if (!qword_1000353C0)
  {
    v84 = (const __CFDictionary *)sub_10000EE38("/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (int *)&v149, 0);
    if (v84)
    {
      v85 = v84;
      qword_1000353C0 = (uint64_t)CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v84);
      CFRelease(v85);
      Mutable = (const __CFDictionary *)qword_1000353C0;
    }
    else
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_1000353C0 = (uint64_t)Mutable;
    }
    if (!Mutable)
    {
      v95 = "CFDictionaryCreateMutable() failed";
LABEL_101:
      sub_100003108(0, (uint64_t)v95, v86, v87, v88, v89, v90, v91, v144);
      goto LABEL_102;
    }
  }
  v92 = (CFArrayRef *)&byte_100034F58[168];
  v93 = (const __CFArray *)qword_1000353B0;
  if (!qword_1000353B0)
  {
    v94 = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("MAC_ARRAY"));
    v93 = v94
        ? CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v94)
        : CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    qword_1000353B0 = (uint64_t)v93;
    if (!v93)
    {
LABEL_100:
      v95 = "CFArrayCreateMutable() failed";
      goto LABEL_101;
    }
  }
  if (!qword_1000353B8)
  {
    v96 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, CFSTR("MAC_IOUE_ARRAY"));
    if (v96)
      MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v96);
    else
      MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    qword_1000353B8 = (uint64_t)MutableCopy;
    if (MutableCopy)
    {
      v93 = (const __CFArray *)qword_1000353B0;
      goto LABEL_73;
    }
    goto LABEL_100;
  }
LABEL_73:
  v145 = v4;
  v146 = v2;
  Count = CFArrayGetCount(v93);
  if (Count >= 1)
  {
    v99 = Count;
    v100 = 0;
    v101 = 0;
    while (1)
    {
      v102 = v92;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v92[118], v100);
      if (ValueAtIndex)
      {
        v104 = ValueAtIndex;
        v105 = CFDictionaryGetTypeID();
        if (CFGetTypeID(v104) == v105)
        {
          v106 = (CFBooleanRef)CFDictionaryGetValue(v104, CFSTR("MAC_USED"));
          v107 = CFBooleanGetTypeID();
          if (!v106 || (CFGetTypeID(v106) == v107 ? (v108 = v106 == kCFBooleanFalse) : (v108 = 0), !v108))
          {
            v109 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v104);
            if (!v109)
            {
              sub_100003108(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v110, v111, v112, v113, v114, v115, v144);
              v60 = 12;
              v4 = v145;
LABEL_110:
              v2 = v146;
              goto LABEL_113;
            }
            v116 = v109;
            CFDictionarySetValue(v109, CFSTR("MAC_USED"), kCFBooleanFalse);
            CFArraySetValueAtIndex(v102[118], v100, v116);
            CFRelease(v116);
            v101 = 1;
          }
        }
      }
      ++v100;
      v92 = v102;
      if (v99 == v100)
        goto LABEL_87;
    }
  }
  v101 = 0;
LABEL_87:
  v117 = (const void **)&byte_100034F58[168];
  v118 = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (v118 < 1)
  {
    v2 = v146;
LABEL_104:
    if ((v101 & 1) == 0)
    {
      v60 = 0;
      goto LABEL_112;
    }
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_ARRAY"), (const void *)qword_1000353B0);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_IOUE_ARRAY"), v117[119]);
    v135 = (const void *)qword_1000353C0;
    v136 = geteuid();
    v137 = getgid();
    v149 = sub_10000EC98(v135, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v136, v137, 416, 0);
    v4 = v145;
    if (v149)
    {
      CFRelease((CFTypeRef)qword_1000353B0);
      CFRelease(v117[119]);
      CFRelease((CFTypeRef)qword_1000353C0);
      qword_1000353B0 = 0;
      v117[119] = 0;
      qword_1000353C0 = 0;
      sub_100003108(0, (uint64_t)"plist write failed for IOUE address", v138, v139, v140, v141, v142, v143, v144);
      v60 = v149;
    }
    else
    {
      v60 = 0;
    }
    goto LABEL_110;
  }
  v119 = v118;
  v120 = 0;
  v2 = v146;
  while (1)
  {
    v121 = CFArrayGetValueAtIndex((CFArrayRef)v117[119], v120);
    if (!v121)
      goto LABEL_98;
    v122 = v121;
    v123 = CFDictionaryGetTypeID();
    if (CFGetTypeID(v122) != v123)
      goto LABEL_98;
    v124 = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)v122, CFSTR("MAC_IOUE_USED"));
    v125 = CFBooleanGetTypeID();
    if (v124)
    {
      if (CFGetTypeID(v124) == v125 && v124 == kCFBooleanFalse)
        goto LABEL_98;
    }
    v127 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)v122);
    if (!v127)
      break;
    v134 = v127;
    CFDictionarySetValue(v127, CFSTR("MAC_IOUE_USED"), kCFBooleanFalse);
    CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v120, v134);
    CFRelease(v134);
    v101 = 1;
LABEL_98:
    ++v120;
    v117 = (const void **)(byte_100034F58 + 168);
    if (v119 == v120)
      goto LABEL_104;
  }
  sub_100003108(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v128, v129, v130, v131, v132, v133, v144);
  v60 = 12;
LABEL_112:
  v4 = v145;
LABEL_113:
  CFRelease(v4);
LABEL_114:
  CFRelease(v2);
  return v60;
}

uint64_t sub_100013940(const __SCDynamicStore *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  sub_100003108(0, (uint64_t)"Restoring settings due to SC disconnection", a3, a4, a5, a6, a7, a8, v10);
  return sub_100014030(a1);
}

uint64_t sub_100013970(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;

  if ((a2 & 2) != 0)
  {
    if (qword_1000353A8)
    {
      sub_1000139BC();
      return sub_100013A70(0, 0, qword_100035370, dword_100035378, dword_10003537C, 0, 0, v2);
    }
  }
  return result;
}

void sub_1000139BC()
{
  const __CFBoolean *Value;
  const __CFBoolean *v1;
  CFTypeID v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  if (!qword_1000353A8)
    sub_10002319C();
  Value = (const __CFBoolean *)SCPreferencesGetValue((SCPreferencesRef)qword_1000353A8, CFSTR("AirplaneMode"));
  if (Value)
  {
    v1 = Value;
    v2 = CFGetTypeID(Value);
    if (v2 == CFBooleanGetTypeID())
    {
      v3 = byte_1000353A0;
      v4 = CFBooleanGetValue(v1);
      if (v3 != (v4 != 0))
      {
        byte_1000353A0 = v4 != 0;
        v11 = "OFF";
        if (v4)
          v11 = "ON";
        sub_100003108(0, (uint64_t)"Airplane Mode is %s", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
      }
    }
  }
  SCPreferencesSynchronize((SCPreferencesRef)qword_1000353A8);
}

uint64_t sub_100013A70(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v10;
  int v11;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  uint64_t v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  int v38;
  const char *v39;
  const char *v40;
  const char *v41;
  _BOOL4 v42;
  uint64_t v45;
  uint64_t v46;
  char v47;
  int v48;
  __int16 v49;

  v8 = a7;
  v10 = a5;
  v11 = a3;
  v49 = 0;
  if (a6)
    *a6 = 0;
  v48 = a4;
  if (byte_100035450)
  {
    v49 = 257;
LABEL_5:
    v14 = 1;
    goto LABEL_8;
  }
  sub_100003108(1u, (uint64_t)"checking for carrier provisioning", a3, a4, a5, (uint64_t)a6, a7, a8, v45);
  if (!sub_100010B94(a1, (uint64_t)&v49 + 1, &v49))
    goto LABEL_5;
  v14 = 0;
LABEL_8:
  sub_100003108(1u, (uint64_t)"doauth(%d) tethering %s supported, user %s authenticated", a3, a4, a5, (uint64_t)a6, a7, a8, a1);
  v47 = a2;
  if (!v14)
  {
    if ((_DWORD)qword_100035370 == 1020)
    {
LABEL_18:
      byte_1000353A1 = HIBYTE(v49) ^ 1;
      v24 = 1020;
      v23 = 45;
LABEL_19:
      sub_100003108(0, (uint64_t)"state out of bounds or already reset %d", v16, v17, v18, v19, v20, v21, v24);
      if (byte_100035450)
        v31 = 0;
      else
        v31 = a1;
      v32 = (v14 & v31) == 0;
      v33 = 1020;
      if (v32)
        v34 = 1020;
      else
        v34 = 1021;
      LODWORD(qword_100035370) = v34;
      dword_100035378 = 0;
      if (!v32)
        v33 = 1021;
      sub_100003108(0, (uint64_t)"netrb state set to %d, reason %d", v25, v26, v27, v28, v29, v30, v33);
      LODWORD(v24) = qword_100035370;
      goto LABEL_28;
    }
LABEL_17:
    sub_100003108(0, (uint64_t)"resetting netrb state %d, reason %d, tethering support %d", v16, v17, v18, v19, v20, v21, qword_100035370);
    LODWORD(qword_100035370) = 1020;
    goto LABEL_18;
  }
  if ((_DWORD)a1 && (_DWORD)qword_100035370 == 1021 && dword_100035378 != 2 && dword_100035378 != 4)
    goto LABEL_17;
  if ((_DWORD)qword_100035370 == 1020)
  {
    if ((_BYTE)v49)
    {
      v22 = dword_10003536C;
      v23 = 45;
    }
    else
    {
      dword_100035378 = 3;
      v23 = 80;
      v22 = 1021;
    }
    LODWORD(qword_100035370) = v22;
    sub_100003108(0, (uint64_t)"Setting netrb state to %d, reason %d from %d", v16, v17, v18, v19, v20, v21, v22);
    v24 = qword_100035370;
  }
  else
  {
    if (!(_BYTE)v49)
    {
      sub_100003108(0, (uint64_t)"Setting netrb state to %d from %d", v16, v17, v18, v19, v20, v21, 1021);
      LODWORD(qword_100035370) = 1021;
      dword_100035378 = 3;
      byte_1000353A1 = HIBYTE(v49) ^ 1;
      LODWORD(v37) = 80;
      LODWORD(v24) = 1021;
      goto LABEL_33;
    }
    v23 = 45;
    v24 = qword_100035370;
  }
  byte_1000353A1 = HIBYTE(v49) ^ 1;
  if ((v24 - 1024) <= 0xFFFFFFFC)
    goto LABEL_19;
LABEL_28:
  if (v24 >= 0x3FE)
  {
    v35 = HIDWORD(qword_100035370);
    if (byte_1000353A0 | byte_1000353A1)
    {
      v38 = HIDWORD(qword_100035370);
      if (HIDWORD(qword_100035370) == 1020)
      {
        HIDWORD(qword_100035370) = v24;
        v38 = v24;
      }
      v36 = 1022;
      LODWORD(qword_100035370) = 1022;
      dword_100035378 = 4;
    }
    else
    {
      if (HIDWORD(qword_100035370) >= 0x3FE)
      {
        LODWORD(qword_100035370) = HIDWORD(qword_100035370);
        *(uint64_t *)((char *)&qword_100035370 + 4) = 1020;
        v36 = v35;
        goto LABEL_47;
      }
      v36 = v24;
      v38 = HIDWORD(qword_100035370);
    }
    if ((_DWORD)v24 == v36 && v35 == v38)
    {
LABEL_56:
      if ((_DWORD)v24 == 1023)
      {
        sub_100003108(0, (uint64_t)"netrb state is ON", v16, v17, v18, v19, v20, v21, v46);
        LODWORD(v37) = 0;
      }
      else
      {
        v42 = v24 != 1022;
        if (dword_100035378 == 4)
          v42 = 1;
        if ((v47 & 4) == 0)
          v42 = 1;
        if (v42)
          LODWORD(v37) = v23;
        else
          LODWORD(v37) = 0;
        if ((_DWORD)v24 == 1022 && v42)
        {
          sub_100003108(0, (uint64_t)"netrb state is OFF", v16, v17, v18, v19, v20, v21, v46);
          LODWORD(v37) = v23;
        }
      }
      goto LABEL_68;
    }
LABEL_47:
    v39 = "silent";
    if ((_DWORD)a1)
      v39 = "ask CT";
    if (v36 == 1022)
      v40 = "OFF";
    else
      v40 = "UNKNOWN";
    if (v36 == 1023)
      v41 = "ON";
    else
      v41 = v40;
    sub_100003108(0, (uint64_t)"set state: %s, pstate %s(%d)->%s(%d), state %s(%d)->%s(%d), reason %s(%d), airplane mode %s, cellular data plan %s", (uint64_t)"OFF", (uint64_t)v41, (uint64_t)"ON", v19, v20, v21, (uint64_t)v39);
    LODWORD(v24) = qword_100035370;
    goto LABEL_56;
  }
  LODWORD(v37) = v23;
LABEL_33:
  if ((_DWORD)v24 == 1021 && (_DWORD)a1)
  {
    if (dword_100035378 == 3)
      v37 = 80;
    else
      v37 = 36;
    dword_100035378 = sub_100016384(v37, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_68:
  if (v8 && qword_100035370 >= 0x3FE)
    dword_10003536C = qword_100035370;
  dword_10003537C = v37;
  if ((_DWORD)v37 != v10 || (_DWORD)qword_100035370 != v11 || dword_100035378 != v48)
  {
    if ((_DWORD)qword_100035370 != v11)
      sub_100013F88();
    sub_100014030((const __SCDynamicStore *)qword_100034F50);
    if (a6)
      *a6 = 1;
  }
  if ((_DWORD)v37 == 45 || (_DWORD)v37 == 0)
    return v37;
  else
    return 45;
}

void sub_100013F88()
{
  __CFDictionary *v0;
  __CFDictionary *v1;
  const std::__fs::filesystem::path *v2;
  uid_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;

  if (!qword_100035360)
    sub_1000231C4();
  v0 = sub_1000165D0(1);
  if (v0)
  {
    v1 = v0;
    v2 = (const std::__fs::filesystem::path *)qword_100035360;
    v3 = geteuid();
    v4 = sub_10000EC98(v1, v2, v3, dword_100035358, 384, 1);
    v11 = "error";
    if (!v4)
      v11 = "success";
    sub_100003108(2u, (uint64_t)"wrote changes: %s", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
    CFRelease(v1);
  }
}

uint64_t sub_100014030(const __SCDynamicStore *a1)
{
  CFStringRef v2;
  const __CFString *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFArray *Mutable;
  __CFArray *v7;
  uint64_t i;
  CFStringRef v9;
  size_t count;
  size_t v11;
  size_t j;
  const char *string;
  CFStringRef v14;
  __CFDictionary *v15;
  CFNumberRef v16;
  uint64_t v17;
  int v18;
  CFNumberRef v19;
  uint64_t v20;
  int v21;
  const void **v22;
  uint64_t v23;
  __CFDictionary *v24;
  uint64_t v25;
  char *v26;
  const void *v27;
  CFNumberRef v28;
  CFNumberRef v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  CFNumberRef v39;
  CFNumberRef cf;
  CFNumberRef v41;
  CFNumberRef v42;
  const __CFString *v43;
  int valuePtr;

  if (!a1)
    sub_1000231EC();
  v2 = SCDynamicStoreKeyCreate(0, CFSTR("%@"), CFSTR("com.apple.MobileInternetSharing"));
  if (!v2)
    return 12;
  v3 = v2;
  v4 = sub_1000165D0(0);
  if (v4)
  {
    v5 = v4;
    v42 = CFNumberCreate(0, kCFNumberIntType, &dword_100035378);
    CFDictionarySetValue(v5, CFSTR("Reason"), v42);
    v41 = CFNumberCreate(0, kCFNumberIntType, &dword_10003537C);
    CFDictionarySetValue(v5, CFSTR("Errnum"), v41);
    Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v7 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    for (i = qword_1000353C8; i; i = *(_QWORD *)i)
    {
      v9 = CFStringCreateWithCString(0, (const char *)(i + 12), 0x600u);
      CFArrayAppendValue(Mutable, v9);
      CFRelease(v9);
      count = xpc_array_get_count(*(xpc_object_t *)(i + 32));
      if (count)
      {
        v11 = count;
        for (j = 0; j != v11; ++j)
        {
          string = xpc_array_get_string(*(xpc_object_t *)(i + 32), j);
          v14 = CFStringCreateWithCString(0, string, 0x600u);
          CFArrayAppendValue(v7, v14);
          CFRelease(v14);
        }
      }
    }
    CFDictionarySetValue(v5, CFSTR("InternalInterfaces"), v7);
    CFDictionarySetValue(v5, CFSTR("ExternalInterfaces"), Mutable);
    v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v16 = CFNumberCreate(0, kCFNumberIntType, &dword_100035380);
    CFDictionarySetValue(v15, CFSTR("Max"), v16);
    v17 = 0;
    v18 = 0;
    do
    {
      v18 += dword_100035368[v17 + 7];
      ++v17;
    }
    while (v17 != 7);
    valuePtr = v18;
    v19 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, CFSTR("Current"), v19);
    v43 = v3;
    v39 = v19;
    cf = v16;
    if (!dword_100035380)
      goto LABEL_15;
    v20 = 0;
    v21 = 0;
    do
    {
      v21 += dword_100035368[v20 + 7];
      ++v20;
    }
    while (v20 != 7);
    if (v21 >= dword_100035380)
      v22 = (const void **)&kCFBooleanFalse;
    else
LABEL_15:
      v22 = (const void **)&kCFBooleanTrue;
    CFDictionarySetValue(v15, CFSTR("MoreAllowed"), *v22);
    v24 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v25 = -2;
    v26 = (char *)&unk_100035384;
    do
    {
      if (v25 <= 4)
      {
        v27 = (const void *)*((_QWORD *)&off_100030F10 + v25);
        v28 = CFNumberCreate(0, kCFNumberIntType, v26);
        if (v28)
        {
          v29 = v28;
          CFDictionarySetValue(v24, v27, v28);
          CFRelease(v29);
        }
      }
      ++v25;
      v26 += 4;
    }
    while (v25 != 5);
    CFDictionarySetValue(v15, CFSTR("Type"), v24);
    CFDictionarySetValue(v5, CFSTR("Hosts"), v15);
    if (v15)
      CFRelease(v15);
    v3 = v43;
    if (cf)
      CFRelease(cf);
    if (v39)
      CFRelease(v39);
    if (v24)
      CFRelease(v24);
    if (v42)
      CFRelease(v42);
    if (v41)
      CFRelease(v41);
    if (v7)
      CFRelease(v7);
    if (Mutable)
      CFRelease(Mutable);
    v30 = SCDynamicStoreSetValue(a1, v43, v5);
    v23 = v30 == 0;
    v37 = "success";
    if (!v30)
      v37 = "error";
    sub_100003108(0, (uint64_t)"published changes: %s", v31, v32, v33, v34, v35, v36, (uint64_t)v37);
    CFRelease(v5);
  }
  else
  {
    v23 = 12;
  }
  CFRelease(v3);
  return v23;
}

void sub_100014468()
{
  if (byte_100034F48 == 1)
  {
    if (qword_100035360)
    {
      free((void *)qword_100035360);
      qword_100035360 = 0;
    }
    if (qword_1000353A8)
    {
      CFRelease((CFTypeRef)qword_1000353A8);
      qword_1000353A8 = 0;
    }
    if (qword_1000353B0)
    {
      CFRelease((CFTypeRef)qword_1000353B0);
      qword_1000353B0 = 0;
    }
    if (qword_1000353B8)
    {
      CFRelease((CFTypeRef)qword_1000353B8);
      qword_1000353B8 = 0;
    }
    if (qword_1000353C0)
    {
      CFRelease((CFTypeRef)qword_1000353C0);
      qword_1000353C0 = 0;
    }
    if (qword_100034F50)
    {
      SCDynamicStoreSetDispatchQueue((SCDynamicStoreRef)qword_100034F50, 0);
      CFRelease((CFTypeRef)qword_100034F50);
      qword_100034F50 = 0;
    }
    byte_100034F48 = 0;
  }
}

uint64_t sub_100014518(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100013A70(a1, a2, qword_100035370, dword_100035378, dword_10003537C, 0, 0, a8);
}

uint64_t sub_100014534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100013A70(0, 0, qword_100035370, dword_100035378, dword_10003537C, 0, 0, a8);
}

uint64_t sub_100014558(_DWORD *a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  result = sub_100013A70(0, 0, qword_100035370, dword_100035378, dword_10003537C, 0, 0, a8);
  if (a1)
    *a1 = qword_100035370;
  if (a2)
    *a2 = dword_100035378;
  return result;
}

uint64_t sub_1000145BC(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000145DC(a1, 0, 0, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_1000145DC(unsigned int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v10 = qword_100035370;
  v11 = dword_100035378;
  v12 = dword_10003537C;
  if (a2)
  {
    if ((_DWORD)a3)
      sub_100023214();
    if (a1 != 1022)
      sub_10002323C();
    if (dword_10003536C <= 0x3FE)
      v13 = 1022;
    else
      v13 = dword_10003536C;
    dword_100035378 = 0;
    dword_10003537C = 0;
    if (byte_1000353A0 | byte_1000353A1)
      dword_100035378 = 4;
  }
  else if (qword_100035370 < 0x3FE && byte_100035450 == 0 && a1 > 0x3FD)
  {
    v13 = 1020;
  }
  else
  {
    v13 = a1;
  }
  if ((qword_100035370 - 1020) > 3)
    v16 = "UNKNOWN";
  else
    v16 = (&off_100030F68)[(int)qword_100035370 - 1020];
  sub_100003108(1u, (uint64_t)"set state: state %s(%d)->%s(%d), reason: %s(%d)->%s(%d),  errnum %d->%d", a3, a4, a5, a6, a7, a8, (uint64_t)v16);
  LODWORD(qword_100035370) = v13;
  if (a2)
    v18 = v11;
  else
    v18 = dword_100035378;
  if (a2)
    v19 = v12;
  else
    v19 = dword_10003537C;
  return sub_100013A70(0, 0, v10, v18, v19, 0, a3, v17);
}

uint64_t sub_100014780(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000145DC(a1, 0, 1, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_1000147A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if ((_DWORD)qword_100035370 == 1023)
  {
    sub_1000145DC(0x3FEu, 0, 0, a4, a5, a6, a7, a8);
    return sub_1000145DC(0x3FFu, 0, 0, v8, v9, v10, v11, v12);
  }
  return result;
}

uint64_t sub_1000147E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000145DC(0x3FEu, 1, 0, a4, a5, a6, a7, a8);
  return 0;
}

uint64_t sub_100014808(_DWORD *a1)
{
  uint64_t result;

  result = 0;
  *a1 = 0;
  if (qword_100035370 <= 0x3FD)
  {
    if ((_DWORD)qword_100035370 == 1020)
    {
      result = 0;
      *a1 = 45;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_100014844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;

  v8 = a1;
  v9 = sub_100016384(a1, a2, a3, a4, a5, a6, a7, a8);
  v16 = 4;
  if (v9 != 4)
  {
    if (byte_1000353A0 | byte_1000353A1)
      v16 = 4;
    else
      v16 = v9;
  }
  if (dword_100035378 > 5)
    v17 = "UNKNOWN";
  else
    v17 = (&off_100030F38)[dword_100035378];
  sub_100003108(2u, (uint64_t)"set reason: %s(%d)->%s(%d), errnum %d->%d, state %s(%d), forced %d", v10, v11, v12, v13, v14, v15, (uint64_t)v17);
  if (v16 != dword_100035378 || dword_10003537C != v8)
  {
    dword_100035378 = v16;
    dword_10003537C = v8;
    sub_100014030((const __SCDynamicStore *)qword_100034F50);
  }
  return 0;
}

uint64_t sub_100014960(char *__s1, const char *a2)
{
  uint64_t *v4;
  uint64_t *v5;
  xpc_object_t v6;
  size_t count;
  size_t v8;
  size_t v9;
  const char *string;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v4 = &qword_1000353C8;
  while (1)
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
      break;
    if (!strcmp(__s1, (const char *)v4 + 12))
      goto LABEL_8;
  }
  v5 = (uint64_t *)malloc_type_malloc(0x28uLL, 0x10A00403AAC9C39uLL);
  if (!v5)
    return 12;
  v4 = v5;
  v5[4] = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  v6 = xpc_array_create(0, 0);
  v4[4] = (uint64_t)v6;
  if (!v6)
  {
    free(v4);
    return 12;
  }
  snprintf((char *)v4 + 12, 0x10uLL, "%s", __s1);
LABEL_8:
  count = xpc_array_get_count((xpc_object_t)v4[4]);
  if (count)
  {
    v8 = count;
    v9 = 0;
    while (1)
    {
      string = xpc_array_get_string((xpc_object_t)v4[4], v9);
      if (!strcmp(string, a2))
        break;
      if (v8 == ++v9)
        goto LABEL_12;
    }
    sub_100003108(0, (uint64_t)"%s internal interface already present for external %s", v11, v12, v13, v14, v15, v16, (uint64_t)string);
    return 22;
  }
  else
  {
LABEL_12:
    xpc_array_set_string((xpc_object_t)v4[4], 0xFFFFFFFFFFFFFFFFLL, a2);
    v17 = *((_DWORD *)v4 + 2);
    *((_DWORD *)v4 + 2) = v17 + 1;
    if (!v17)
    {
      *v4 = qword_1000353C8;
      qword_1000353C8 = (uint64_t)v4;
    }
    return sub_100014030((const __SCDynamicStore *)qword_100034F50);
  }
}

uint64_t sub_100014AC8(char *__s1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  xpc_object_t v13;
  size_t count;
  size_t v15;
  size_t v16;
  char v17;
  size_t v18;
  const char *string;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t *i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  size_t v36;

  v10 = &qword_1000353C8;
  v11 = &qword_1000353C8;
  do
  {
    v11 = (uint64_t *)*v11;
    if (!v11)
    {
      sub_100003108(0, (uint64_t)"%s, external interface not present in settings", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0;
    }
  }
  while (strcmp(__s1, (const char *)v11 + 12));
  v12 = (void *)v11[4];
  v13 = xpc_array_create(0, 0);
  count = xpc_array_get_count(v12);
  if (count)
  {
    v15 = count;
    v16 = 0;
    v17 = 0;
    v36 = count - 1;
LABEL_6:
    v18 = v16;
    do
    {
      string = xpc_array_get_string(v12, v18);
      if (!strcmp(string, a2))
      {
        v16 = v18 + 1;
        v17 = 1;
        if (v36 != v18)
          goto LABEL_6;
        goto LABEL_14;
      }
      xpc_array_set_string(v13, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v18;
    }
    while (v15 != v18);
    if ((v17 & 1) == 0)
      goto LABEL_19;
LABEL_14:
    xpc_release(v12);
    v11[4] = (uint64_t)v13;
    sub_100003108(2u, (uint64_t)"found internal interface %s for external interface %s", v21, v22, v23, v24, v25, v26, (uint64_t)a2);
    v27 = *((_DWORD *)v11 + 2);
    if (!v27)
      sub_100023264();
    v28 = v27 - 1;
    *((_DWORD *)v11 + 2) = v28;
    if (!v28)
    {
      for (i = (uint64_t *)qword_1000353C8; i != v11; i = (uint64_t *)*i)
        v10 = i;
      *v10 = *v11;
      xpc_release((xpc_object_t)v11[4]);
      free(v11);
    }
    return sub_100014030((const __SCDynamicStore *)qword_100034F50);
  }
  else
  {
LABEL_19:
    xpc_release(v13);
    sub_100003108(0, (uint64_t)"%s internal interface not present for %s external interface", v30, v31, v32, v33, v34, v35, (uint64_t)a2);
    return 22;
  }
}

uint64_t sub_100014C90(__int16 a1, __int16 a2)
{
  BOOL v2;
  uint64_t v3;
  int v4;
  int v5;

  if (dword_100035460)
    v2 = dword_100035464 == 0;
  else
    v2 = 0;
  v3 = v2;
  if (v2)
  {
    v4 = (unsigned __int16)word_10003546A;
    v5 = (unsigned __int16)word_100035468;
    word_100035468 = a1;
    word_10003546A = a2;
    sub_1000197A0();
    if (v5 != (unsigned __int16)word_100035468 || v4 != (unsigned __int16)word_10003546A)
    {
      sub_100013F88();
      sub_100014030((const __SCDynamicStore *)qword_100034F50);
    }
  }
  return v3;
}

_WORD *sub_100014D2C(_WORD *result, _WORD *a2)
{
  if (result)
    *result = word_100035468;
  if (a2)
    *a2 = word_10003546A;
  return result;
}

uint64_t sub_100014D58(uint64_t result)
{
  int v1;

  if ((result & 0x80000000) != 0)
    sub_10002328C();
  v1 = dword_100035380;
  dword_100035380 = result;
  if (v1 != (_DWORD)result)
    return sub_100014030((const __SCDynamicStore *)qword_100034F50);
  return result;
}

uint64_t sub_100014D94()
{
  return dword_100035380;
}

uint64_t sub_100014DA0(int a1, int a2)
{
  int *v2;
  _DWORD *v3;
  int v4;
  int v5;

  if ((a1 - 7) <= 0xFFFFFFFA)
    sub_1000232B4();
  if (!a2)
    sub_1000232DC();
  v2 = &dword_100035368[a1];
  v4 = v2[7];
  v3 = v2 + 7;
  v5 = v4 + a2;
  if (!(v4 + a2))
    sub_100023304();
  *v3 = v5;
  return sub_100014030((const __SCDynamicStore *)qword_100034F50);
}

uint64_t sub_100014DF0(int a1, unsigned int a2)
{
  int *v2;
  unsigned int *v3;
  unsigned int v4;
  int v5;
  BOOL v6;
  unsigned int v7;

  if ((a1 - 7) <= 0xFFFFFFFA)
    sub_10002332C();
  v2 = &dword_100035368[a1];
  v5 = v2[7];
  v3 = (unsigned int *)(v2 + 7);
  v4 = v5;
  if (v5)
  {
    v6 = v4 >= a2;
    v7 = v4 - a2;
    if (!v6)
      v7 = 0;
    *v3 = v7;
    sub_100014030((const __SCDynamicStore *)qword_100034F50);
  }
  return 0;
}

uint64_t sub_100014E40()
{
  uint64_t v0;
  uint64_t result;

  v0 = 0;
  LODWORD(result) = 0;
  do
  {
    result = (dword_100035368[v0 + 7] + result);
    ++v0;
  }
  while (v0 != 7);
  return result;
}

BOOL sub_100014E6C()
{
  uint64_t v0;
  int v1;

  if (!dword_100035380)
    return 1;
  v0 = 0;
  v1 = 0;
  do
  {
    v1 += dword_100035368[v0 + 7];
    ++v0;
  }
  while (v0 != 7);
  return v1 < dword_100035380;
}

uint64_t sub_100014EB4(char *a1)
{
  const char *v2;
  uint64_t *v3;

  v2 = off_100034CB0[0];
  v3 = &qword_1000353C8;
  do
  {
    v3 = (uint64_t *)*v3;
    if (!v3)
      return 6;
  }
  while (!strncmp((const char *)v3 + 12, v2, 0x10uLL));
  if (!if_nametoindex((const char *)v3 + 12))
    sub_100023354();
  snprintf(a1, 0x10uLL, "%s", (const char *)v3 + 12);
  return 0;
}

uint64_t sub_100014F48(int a1, void *a2, void *a3)
{
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *Value;
  const __CFString *v8;
  uint64_t result;
  char v10[16];
  char buffer[16];

  if (!a2 || !a3)
    sub_10002337C();
  if (!qword_1000353C0)
    sub_1000233A4();
  if (a1 == 201)
    v5 = CFSTR("Shared_Net_Address");
  else
    v5 = CFSTR("Host_Net_Address");
  if (a1 == 201)
    v6 = CFSTR("Shared_Net_Mask");
  else
    v6 = CFSTR("Host_Net_Mask");
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, v5);
  v8 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)qword_1000353C0, v6);
  result = 19;
  if (Value)
  {
    if (v8)
    {
      CFStringGetCString(Value, buffer, 16, 0x600u);
      CFStringGetCString(v8, v10, 16, 0x600u);
      inet_pton(2, buffer, a2);
      inet_pton(2, v10, a3);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100015068(int a1, const void *a2, const void *a3)
{
  CFStringRef v5;
  CFStringRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;
  BOOL v14;
  uint64_t v15;
  const __CFString *v17;
  const __CFString *v18;
  const void *v19;
  uid_t v20;
  gid_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[16];
  char cStr[16];

  if (!a2 || !a3)
    sub_1000233CC();
  if (!qword_1000353C0)
    sub_1000233F4();
  inet_ntop(2, a2, cStr, 0x10u);
  inet_ntop(2, a3, v29, 0x10u);
  v5 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x600u);
  v6 = CFStringCreateWithCString(kCFAllocatorDefault, v29, 0x600u);
  v13 = v6;
  if (v5)
    v14 = v6 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    if (a1 == 201)
      v17 = CFSTR("Shared_Net_Address");
    else
      v17 = CFSTR("Host_Net_Address");
    if (a1 == 201)
      v18 = CFSTR("Shared_Net_Mask");
    else
      v18 = CFSTR("Host_Net_Mask");
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, v17, v5);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, v18, v13);
    v19 = (const void *)qword_1000353C0;
    v20 = geteuid();
    v21 = getgid();
    v15 = sub_10000EC98(v19, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v20, v21, 416, 0);
    if ((_DWORD)v15)
      sub_100003108(0, (uint64_t)"plist write failed for vmnet subnet", v22, v23, v24, v25, v26, v27, v28);
LABEL_21:
    CFRelease(v5);
    if (!v13)
      return v15;
    goto LABEL_11;
  }
  sub_100003108(0, (uint64_t)"unable to set subnet information in plist", v7, v8, v9, v10, v11, v12, v28);
  v15 = 12;
  if (v5)
    goto LABEL_21;
  if (v13)
LABEL_11:
    CFRelease(v13);
  return v15;
}

uint64_t sub_10001520C(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v6;
  CFTypeID TypeID;
  const __CFData *Value;
  const __CFData *v9;
  CFTypeID v10;
  const UInt8 *BytePtr;
  uint64_t v13;
  __CFDictionary *MutableCopy;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  const void *v23;
  gid_t v24;
  const char *v25;
  uint64_t v26;

  if (!qword_1000353C0)
    sub_10002341C();
  if (!qword_1000353B8)
    sub_100023444();
  Count = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (Count < 1)
    return 22;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v4);
    if (ValueAtIndex)
    {
      v6 = ValueAtIndex;
      TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        Value = (const __CFData *)CFDictionaryGetValue(v6, CFSTR("MAC_IOUE"));
        if (Value)
        {
          v9 = Value;
          v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4)
      return 22;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v6);
  if (!MutableCopy)
  {
    v13 = 12;
    v25 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_21;
  }
  v22 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("MAC_IOUE_USED"), kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v4, v22);
  CFRelease(v22);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_IOUE_ARRAY"), (const void *)qword_1000353B8);
  v23 = (const void *)qword_1000353C0;
  LODWORD(v22) = geteuid();
  v24 = getgid();
  v13 = sub_10000EC98(v23, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v22, v24, 416, 0);
  if ((_DWORD)v13)
  {
    v25 = "plist write failed for IOUE address";
LABEL_21:
    sub_100003108(0, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v26);
  }
  return v13;
}

uint64_t sub_1000153D8(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  CFTypeID TypeID;
  CFBooleanRef Value;
  CFTypeID v8;
  const __CFData *v10;
  CFTypeID v11;
  const UInt8 *BytePtr;
  uint64_t v13;
  CFMutableDictionaryRef Mutable;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFDictionary *v21;
  CFDataRef v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFDataRef v29;
  __CFDictionary *v30;
  const void *v31;
  uid_t v32;
  gid_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  int v43;
  __CFDictionary *MutableCopy;
  __CFDictionary *v45;
  uint64_t v46;
  UInt8 bytes[4];
  __int16 v48;

  if (!qword_1000353C0)
    sub_10002346C();
  if (!qword_1000353B8)
    sub_100023494();
  Count = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  if (Count < 1)
  {
LABEL_18:
    sub_1000156D0((unsigned __int16 *)bytes, 0);
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v21 = Mutable;
      v22 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
      if (v22)
      {
        v29 = v22;
        CFDictionarySetValue(v21, CFSTR("MAC_IOUE"), v22);
        CFRelease(v29);
        *(_DWORD *)a1 = *(_DWORD *)bytes;
        *(_WORD *)(a1 + 4) = v48;
        CFDictionarySetValue(v21, CFSTR("MAC_IOUE_USED"), kCFBooleanTrue);
        CFArrayAppendValue((CFMutableArrayRef)qword_1000353B8, v21);
        v30 = v21;
        goto LABEL_21;
      }
      sub_100003108(0, (uint64_t)"CFDataCreate() failed", v23, v24, v25, v26, v27, v28, v46);
      CFRelease(v21);
      return 12;
    }
    v41 = "CFDictionaryCreateMutable() failed";
LABEL_24:
    sub_100003108(0, (uint64_t)v41, v15, v16, v17, v18, v19, v20, v46);
    return 12;
  }
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v4);
    TypeID = CFDictionaryGetTypeID();
    if (ValueAtIndex)
    {
      if (CFGetTypeID(ValueAtIndex) == TypeID)
      {
        Value = (CFBooleanRef)CFDictionaryGetValue(ValueAtIndex, CFSTR("MAC_IOUE_USED"));
        v8 = CFBooleanGetTypeID();
        if (Value)
        {
          if (CFGetTypeID(Value) == v8 && Value != kCFBooleanTrue)
          {
            v10 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("MAC_IOUE"));
            v11 = CFDataGetTypeID();
            if (v10)
            {
              if (CFGetTypeID(v10) == v11)
              {
                BytePtr = CFDataGetBytePtr(v10);
                if (BytePtr)
                {
                  v13 = (uint64_t)BytePtr;
                  if (CFDataGetLength(v10) == 6 && !sub_10000E348(v13))
                    break;
                }
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4)
      goto LABEL_18;
  }
  v43 = *(_DWORD *)v13;
  *(_WORD *)(a1 + 4) = *(_WORD *)(v13 + 4);
  *(_DWORD *)a1 = v43;
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, ValueAtIndex);
  if (!MutableCopy)
  {
    v41 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_24;
  }
  v45 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("MAC_IOUE_USED"), kCFBooleanTrue);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B8, v4, v45);
  v30 = v45;
LABEL_21:
  CFRelease(v30);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_IOUE_ARRAY"), (const void *)qword_1000353B8);
  v31 = (const void *)qword_1000353C0;
  v32 = geteuid();
  v33 = getgid();
  v40 = sub_10000EC98(v31, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v32, v33, 416, 0);
  if ((_DWORD)v40)
    sub_100003108(0, (uint64_t)"plist write failed for IOUE address", v34, v35, v36, v37, v38, v39, v46);
  return v40;
}

uint64_t sub_1000156D0(unsigned __int16 *a1, const void *a2)
{
  unsigned __int8 Count;
  unsigned __int8 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  CFTypeID TypeID;
  const __CFData *Value;
  CFTypeID v13;
  const UInt8 *BytePtr;
  CFIndex v16;
  const __CFDictionary *v17;
  CFTypeID v18;
  const __CFData *v19;
  CFTypeID v20;
  const UInt8 *v21;
  int v24;
  int v25;
  unsigned __int8 md[4];
  unsigned __int16 v27;

  if (!qword_1000353B0)
    sub_1000234BC();
  Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  if (!qword_1000353B8)
    sub_1000234E4();
  v5 = CFArrayGetCount((CFArrayRef)qword_1000353B8);
  v6 = Count;
  v24 = Count;
  v25 = v5;
  v7 = Count;
  v8 = v5;
  do
  {
    if (a2)
    {
      CC_MD5(a2, 0x10u, md);
      *(_DWORD *)a1 = *(_DWORD *)md;
      a1[2] = v27;
      goto LABEL_7;
    }
    while (1)
    {
      while (1)
      {
        arc4random_buf(a1, 6uLL);
LABEL_7:
        *(_BYTE *)a1 = *(_BYTE *)a1 & 0xFC | 2;
        if (!sub_10000E348((uint64_t)a1))
          break;
        if (a2)
          return 22;
      }
      LODWORD(v9) = 0;
      if (v6)
      {
        v9 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v9);
          TypeID = CFDictionaryGetTypeID();
          if (ValueAtIndex)
          {
            if (CFGetTypeID(ValueAtIndex) == TypeID)
            {
              Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("MAC_ADDRESS"));
              v13 = CFDataGetTypeID();
              if (Value)
              {
                if (CFGetTypeID(Value) == v13)
                {
                  BytePtr = CFDataGetBytePtr(Value);
                  if (BytePtr)
                  {
                    if (*(_DWORD *)a1 == *(_DWORD *)BytePtr && a1[2] == *((unsigned __int16 *)BytePtr + 2))
                      break;
                  }
                }
              }
            }
          }
          if (v7 == ++v9)
            goto LABEL_25;
        }
        v6 = v24;
      }
      if ((_DWORD)v9 == v6)
        break;
      v6 = v24;
      if (a2)
        return 22;
    }
LABEL_25:
    if (v25)
    {
      v16 = 0;
      while (1)
      {
        v17 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B8, v16);
        v18 = CFDictionaryGetTypeID();
        if (v17)
        {
          if (CFGetTypeID(v17) == v18)
          {
            v19 = (const __CFData *)CFDictionaryGetValue(v17, CFSTR("MAC_IOUE"));
            v20 = CFDataGetTypeID();
            if (v19)
            {
              if (CFGetTypeID(v19) == v20)
              {
                v21 = CFDataGetBytePtr(v19);
                if (v21)
                {
                  if (*(_DWORD *)a1 == *(_DWORD *)v21 && a1[2] == *((unsigned __int16 *)v21 + 2))
                    break;
                }
              }
            }
          }
        }
        if (v8 == ++v16)
          return 0;
      }
    }
    else
    {
      LODWORD(v16) = 0;
    }
    v6 = v24;
  }
  while (!a2 && (_DWORD)v16 != v25);
  if ((_DWORD)v16 == v25)
    return 0;
  return 22;
}

uint64_t sub_10001596C(uint64_t a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v6;
  CFTypeID TypeID;
  const __CFData *Value;
  const __CFData *v9;
  CFTypeID v10;
  const UInt8 *BytePtr;
  uint64_t v13;
  __CFDictionary *MutableCopy;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __CFDictionary *v22;
  const void *v23;
  gid_t v24;
  const char *v25;
  uint64_t v26;

  if (!qword_1000353C0)
    sub_10002350C();
  if (!qword_1000353B0)
    sub_100023534();
  Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  if (Count < 1)
    return 22;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v4);
    if (ValueAtIndex)
    {
      v6 = ValueAtIndex;
      TypeID = CFDictionaryGetTypeID();
      if (CFGetTypeID(v6) == TypeID)
      {
        Value = (const __CFData *)CFDictionaryGetValue(v6, CFSTR("MAC_ADDRESS"));
        if (Value)
        {
          v9 = Value;
          v10 = CFDataGetTypeID();
          if (CFGetTypeID(v9) == v10)
          {
            BytePtr = CFDataGetBytePtr(v9);
            if (BytePtr)
            {
              if (*(_DWORD *)BytePtr == *(_DWORD *)a1
                && *((unsigned __int16 *)BytePtr + 2) == *(unsigned __int16 *)(a1 + 4))
              {
                break;
              }
            }
          }
        }
      }
    }
    if (v3 == ++v4)
      return 22;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v6);
  if (!MutableCopy)
  {
    v13 = 12;
    v25 = "CFDictionaryCreateMutableCopy() failed";
    goto LABEL_21;
  }
  v22 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("MAC_USED"), kCFBooleanFalse);
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v4, v22);
  CFRelease(v22);
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_ARRAY"), (const void *)qword_1000353B0);
  v23 = (const void *)qword_1000353C0;
  LODWORD(v22) = geteuid();
  v24 = getgid();
  v13 = sub_10000EC98(v23, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", (uid_t)v22, v24, 416, 0);
  if ((_DWORD)v13)
  {
    v25 = "plist write failed for IOUE address";
LABEL_21:
    sub_100003108(0, (uint64_t)v25, v16, v17, v18, v19, v20, v21, v26);
  }
  return v13;
}

uint64_t sub_100015B38(const unsigned __int8 *a1, void *a2)
{
  CFIndex Count;
  uint64_t v5;
  const __CFAllocator *v6;
  CFStringRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFStringRef v14;
  CFIndex v15;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v17;
  CFTypeID TypeID;
  const void *Value;
  const void *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __CFDictionary *v28;
  uint64_t v29;
  CFStringRef v30;
  CFIndex v31;
  const __CFDictionary *v32;
  const __CFDictionary *v33;
  CFTypeID v34;
  const void *v35;
  const void *v36;
  CFTypeID v37;
  int v38;
  CFMutableDictionaryRef MutableCopy;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFMutableDictionaryRef v46;
  CFAbsoluteTime v47;
  CFMutableDictionaryRef v48;
  CFIndex v49;
  CFIndex v50;
  const __CFDate *v51;
  const __CFDictionary *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const __CFDictionary *v59;
  CFTypeID v60;
  CFBooleanRef v61;
  CFTypeID v62;
  const __CFDate *v64;
  const __CFDate *v65;
  CFTypeID v66;
  const char *v67;
  CFBooleanRef v68;
  CFTypeID v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  CFBooleanRef v76;
  const void *v77;
  uid_t v78;
  gid_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const __CFData *v86;
  unsigned __int8 *v87;
  const void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const void *v95;
  CFTypeID v96;
  CFAbsoluteTime Current;
  CFMutableDictionaryRef v98;
  const void *v99;
  uid_t v100;
  gid_t v101;
  uint64_t v102;
  uint64_t v104;
  int v105;
  void *v106;
  unsigned __int8 *v107;
  const unsigned __int8 *v108;
  UInt8 bytes[6];
  uuid_t uu;
  char out[40];

  memset(uu, 0, sizeof(uu));
  Count = CFArrayGetCount((CFArrayRef)qword_1000353B0);
  v5 = Count;
  if (a1 && Count)
  {
    uuid_unparse(a1, out);
    v6 = kCFAllocatorDefault;
    v7 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v7)
    {
      v14 = v7;
      if (v5 < 1)
        goto LABEL_16;
      v107 = (unsigned __int8 *)a1;
      v15 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v15);
        if (ValueAtIndex)
        {
          v17 = ValueAtIndex;
          TypeID = CFDictionaryGetTypeID();
          if (CFGetTypeID(v17) == TypeID)
          {
            Value = CFDictionaryGetValue(v17, CFSTR("UUID_MAC"));
            if (Value)
            {
              v20 = Value;
              v21 = CFStringGetTypeID();
              if (CFGetTypeID(v20) == v21)
              {
                if (CFEqual(v20, v14))
                  break;
              }
            }
          }
        }
        if (v5 == ++v15)
        {
          a1 = v107;
          goto LABEL_16;
        }
      }
      v68 = (CFBooleanRef)CFDictionaryGetValue(v17, CFSTR("MAC_USED"));
      v69 = CFBooleanGetTypeID();
      if (v68)
      {
        v76 = kCFBooleanTrue;
        if (CFGetTypeID(v68) == v69 && v68 == kCFBooleanTrue)
        {
          sub_100003108(0, (uint64_t)"MAC address associated with UUID %s is already being used", v70, v71, v72, v73, v74, v75, (uint64_t)out);
LABEL_90:
          v28 = 0;
          v29 = 22;
          goto LABEL_86;
        }
      }
      else
      {
        v76 = kCFBooleanTrue;
      }
      v88 = CFDictionaryGetValue(v17, CFSTR("MAC_ADDRESS"));
      if (!v88 || (v95 = v88, v96 = CFDataGetTypeID(), CFGetTypeID(v95) != v96))
      {
        sub_100003108(0, (uint64_t)"no MAC address for uuid", v89, v90, v91, v92, v93, v94, v104);
        goto LABEL_90;
      }
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v17);
      v28 = MutableCopy;
      if (!MutableCopy)
      {
        v67 = "CFDictionaryCreateMutableCopy() failed";
        goto LABEL_85;
      }
      Current = CFAbsoluteTimeGetCurrent();
      MutableCopy = CFDateCreate(kCFAllocatorDefault, Current);
      if (MutableCopy)
      {
        v98 = MutableCopy;
        CFDictionarySetValue(v28, CFSTR("MAC_TIME_USED"), MutableCopy);
        CFDictionarySetValue(v28, CFSTR("MAC_USED"), v76);
        CFRelease(v98);
        CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v15, v28);
        CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_ARRAY"), (const void *)qword_1000353B0);
        v99 = (const void *)qword_1000353C0;
        v100 = geteuid();
        v101 = getgid();
        v102 = sub_10000EC98(v99, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v100, v101, 416, 0);
        if (!(_DWORD)v102)
        {
          v29 = sub_10001629C(a2, (CFDataRef)v95, v107);
          goto LABEL_86;
        }
        v29 = v102;
        goto LABEL_72;
      }
      goto LABEL_84;
    }
LABEL_35:
    sub_100003108(v7, (uint64_t)"CFStringCreateWithCString() failed", v8, v9, v10, v11, v12, v13, v104);
    return 12;
  }
  if (!a1)
  {
    uuid_generate(uu);
    uuid_unparse(uu, out);
    v6 = kCFAllocatorDefault;
    v30 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
    if (v30)
    {
      v14 = v30;
      do
      {
        if (v5 < 1)
        {
          v31 = 0;
        }
        else
        {
          v31 = 0;
          while (1)
          {
            v32 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v31);
            if (v32)
            {
              v33 = v32;
              v34 = CFDictionaryGetTypeID();
              if (CFGetTypeID(v33) == v34)
              {
                v35 = CFDictionaryGetValue(v33, CFSTR("UUID_MAC"));
                if (v35)
                {
                  v36 = v35;
                  v37 = CFStringGetTypeID();
                  if (CFGetTypeID(v36) == v37)
                  {
                    if (CFEqual(v36, v14))
                      break;
                  }
                }
              }
            }
            if (v5 == ++v31)
              goto LABEL_32;
          }
        }
        if (v5 == v31)
        {
LABEL_32:
          if (!sub_1000156D0((unsigned __int16 *)bytes, uu))
          {
            v38 = 1;
            a1 = 0;
            goto LABEL_38;
          }
        }
        CFRelease(v14);
        uuid_generate(uu);
        uuid_unparse(uu, out);
        v14 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
      }
      while (v14);
    }
    LOBYTE(v7) = 0;
    goto LABEL_35;
  }
  uuid_unparse(a1, out);
  v6 = kCFAllocatorDefault;
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, out, 0x600u);
  if (!v7)
    goto LABEL_35;
  v14 = v7;
LABEL_16:
  if (sub_1000156D0((unsigned __int16 *)bytes, a1))
  {
    sub_100003108(0, (uint64_t)"mac address conflict with given uuid", v22, v23, v24, v25, v26, v27, v104);
    v28 = 0;
    v29 = 22;
    goto LABEL_86;
  }
  v38 = 0;
LABEL_38:
  MutableCopy = CFDictionaryCreateMutable(v6, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v28 = MutableCopy;
  if (!MutableCopy)
  {
    v67 = "CFDictionaryCreateMutable() failed";
LABEL_85:
    sub_100003108(MutableCopy, (uint64_t)v67, v40, v41, v42, v43, v44, v45, v104);
    v29 = 12;
    goto LABEL_86;
  }
  CFDictionarySetValue(MutableCopy, CFSTR("UUID_MAC"), v14);
  MutableCopy = CFDataCreate(v6, bytes, 6);
  if (!MutableCopy)
  {
    v67 = "CFDataCreate() failed";
    goto LABEL_85;
  }
  v46 = MutableCopy;
  CFDictionarySetValue(v28, CFSTR("MAC_ADDRESS"), MutableCopy);
  CFRelease(v46);
  v47 = CFAbsoluteTimeGetCurrent();
  MutableCopy = CFDateCreate(v6, v47);
  if (!MutableCopy)
  {
LABEL_84:
    v67 = "CFDateCreate() failed";
    goto LABEL_85;
  }
  v48 = MutableCopy;
  CFDictionarySetValue(v28, CFSTR("MAC_TIME_USED"), MutableCopy);
  CFRelease(v48);
  CFDictionarySetValue(v28, CFSTR("MAC_USED"), kCFBooleanTrue);
  if (v5 < 138)
  {
    CFArrayAppendValue((CFMutableArrayRef)qword_1000353B0, v28);
    goto LABEL_71;
  }
  v105 = v38;
  v108 = a1;
  v106 = a2;
  v49 = 0;
  v50 = 0;
  v51 = 0;
  while (1)
  {
    v52 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000353B0, v49);
    if (v52)
    {
      v59 = v52;
      v60 = CFDictionaryGetTypeID();
      if (CFGetTypeID(v59) == v60)
      {
        v61 = (CFBooleanRef)CFDictionaryGetValue(v59, CFSTR("MAC_USED"));
        v62 = CFBooleanGetTypeID();
        if (!v61)
          break;
        if (CFGetTypeID(v61) != v62 || v61 != kCFBooleanTrue)
          break;
      }
    }
LABEL_57:
    if (v5 == ++v49)
    {
      v49 = v5;
      goto LABEL_67;
    }
  }
  v64 = (const __CFDate *)CFDictionaryGetValue(v59, CFSTR("MAC_TIME_USED"));
  if (v64)
  {
    v65 = v64;
    v66 = CFDateGetTypeID();
    if (CFGetTypeID(v65) == v66)
    {
      if (v51)
      {
        if (CFDateCompare(v51, v65, 0) == kCFCompareGreaterThan)
        {
          v51 = v65;
          v50 = v49;
        }
      }
      else
      {
        v51 = v65;
        v50 = v49;
      }
      goto LABEL_57;
    }
  }
  v50 = v49;
LABEL_67:
  a2 = v106;
  if (!v51 && v5 == v49)
  {
    sub_100003108(0, (uint64_t)"vm interface create exceeded limit", v53, v54, v55, v56, v57, v58, v104);
    v29 = 19;
    goto LABEL_86;
  }
  CFArraySetValueAtIndex((CFMutableArrayRef)qword_1000353B0, v50, v28);
  a1 = v108;
  v38 = v105;
LABEL_71:
  CFDictionarySetValue((CFMutableDictionaryRef)qword_1000353C0, CFSTR("MAC_ARRAY"), (const void *)qword_1000353B0);
  v77 = (const void *)qword_1000353C0;
  v78 = geteuid();
  v79 = getgid();
  v29 = sub_10000EC98(v77, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.vmnet.plist", v78, v79, 416, 0);
  if ((_DWORD)v29)
  {
LABEL_72:
    sub_100003108(0, (uint64_t)"plist write failed for MAC address", v80, v81, v82, v83, v84, v85, v104);
    goto LABEL_86;
  }
  v86 = (const __CFData *)CFDictionaryGetValue(v28, CFSTR("MAC_ADDRESS"));
  if (v38)
    v87 = uu;
  else
    v87 = (unsigned __int8 *)a1;
  sub_10001629C(a2, v86, v87);
LABEL_86:
  CFRelease(v14);
  if (v28)
    CFRelease(v28);
  return v29;
}

uint64_t sub_10001629C(void *a1, CFDataRef theData, _OWORD *a3)
{
  const UInt8 *BytePtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 uuid[20];
  char __str[20];

  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr)
  {
    snprintf(__str, 0x14uLL, "%02x:%02x:%02x:%02x:%02x:%02x", *BytePtr, BytePtr[1], BytePtr[2], BytePtr[3], BytePtr[4], BytePtr[5]);
    xpc_dictionary_set_string(a1, off_100034BB0[0], __str);
    *(_OWORD *)uuid = *a3;
    xpc_dictionary_set_uuid(a1, off_100034BA8[0], uuid);
    return 0;
  }
  else
  {
    sub_100003108(0, (uint64_t)"CFDataGetBytePtr() failed", v6, v7, v8, v9, v10, v11, v13);
    return 12;
  }
}

uint64_t sub_100016384(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((int)result > 35)
  {
    switch((_DWORD)result)
    {
      case '$':
        return 2;
      case 'P':
        return 3;
      case '-':
        return 1;
    }
    goto LABEL_14;
  }
  if (!(_DWORD)result)
    return result;
  if ((_DWORD)result == 4)
    return 5;
  if ((_DWORD)result != 19)
  {
LABEL_14:
    sub_100003108(0, (uint64_t)"errnum %d has no matching netrbReason value", a3, a4, a5, a6, a7, a8, result);
    return 6;
  }
  return 4;
}

const void *sub_100016410(const void *a1)
{
  CFTypeID TypeID;

  TypeID = CFNumberGetTypeID();
  if (!a1)
    return 0;
  if (CFGetTypeID(a1) == TypeID)
    return a1;
  return 0;
}

uint64_t sub_100016450(const void *a1)
{
  CFTypeID TypeID;
  const void *Value;
  uint64_t result;
  CFTypeID v5;
  const void *ValueAtIndex;
  const void *v7;
  CFTypeID v8;
  const void *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  CFTypeID v12;
  CFTypeID v13;
  int valuePtr;

  TypeID = CFDictionaryGetTypeID();
  if (!a1 || CFGetTypeID(a1) != TypeID)
    return 22;
  Value = CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("ForwardedPorts"));
  result = 0;
  if (!Value || dword_100035464)
    return result;
  v5 = CFArrayGetTypeID();
  if (CFGetTypeID(Value) != v5)
    return 22;
  if (CFArrayGetCount((CFArrayRef)Value) < 1)
    return 22;
  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, 0);
  if (!ValueAtIndex)
    return 22;
  v7 = ValueAtIndex;
  v8 = CFDictionaryGetTypeID();
  if (CFGetTypeID(v7) != v8)
    return 22;
  v9 = CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("Low"));
  v10 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v7, CFSTR("High"));
  if (!v9)
    return 22;
  v11 = v10;
  v12 = CFNumberGetTypeID();
  v13 = CFGetTypeID(v9);
  result = 22;
  if (v13 == v12 && v11)
  {
    if (sub_100016410(v11))
    {
      valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)v9, kCFNumberShortType, (char *)&valuePtr + 2))
      {
        if (CFNumberGetValue(v11, kCFNumberShortType, &valuePtr))
        {
          word_100035468 = HIWORD(valuePtr);
          word_10003546A = valuePtr;
          sub_1000197A0();
          return 0;
        }
      }
    }
    return 22;
  }
  return result;
}

__CFDictionary *sub_1000165D0(int a1)
{
  __CFDictionary *Mutable;
  CFNumberRef v3;
  CFNumberRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFMutableArrayRef v9;
  __CFArray *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  int v14;
  int valuePtr;

  v14 = 3;
  valuePtr = 1020;
  if ((qword_100035370 & 0xFFFFFFFC) == 0x3FC)
    valuePtr = qword_100035370;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    if (a1 && byte_1000353A0 | byte_1000353A1)
      valuePtr = HIDWORD(qword_100035370);
    v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      CFDictionarySetValue(Mutable, CFSTR("State"), v3);
      CFRelease(v4);
    }
    v5 = CFNumberCreate(0, kCFNumberIntType, &dword_10003536C);
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(Mutable, CFSTR("UState"), v5);
      CFRelease(v6);
    }
    v7 = CFNumberCreate(0, kCFNumberIntType, &v14);
    if (v7)
    {
      v8 = v7;
      CFDictionarySetValue(Mutable, CFSTR("Version"), v7);
      CFRelease(v8);
    }
    if (!dword_100035464)
    {
      if ((unsigned __int16)word_100035468 | (unsigned __int16)word_10003546A)
      {
        v9 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        if (v9)
        {
          v10 = v9;
          v11 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v11)
          {
            v12 = v11;
            sub_10000EC34(v11, CFSTR("Low"), word_100035468);
            sub_10000EC34(v12, CFSTR("High"), word_10003546A);
            CFArrayAppendValue(v10, v12);
            CFRelease(v12);
            CFDictionarySetValue(Mutable, CFSTR("ForwardedPorts"), v10);
          }
          CFRelease(v10);
        }
      }
    }
  }
  return Mutable;
}

uint64_t sub_1000167DC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 288) != 101)
    sub_100023584();
  if (*(_DWORD *)(a1 + 16))
    sub_10002355C();
  *(_QWORD *)(a1 + 592) = sub_100016828;
  *(_QWORD *)(a1 + 600) = sub_10001687C;
  *(_QWORD *)(a1 + 632) = 0;
  return 0;
}

uint64_t sub_100016828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a2 + 288) != 101)
    sub_1000235AC();
  sub_100003108(0, (uint64_t)"%s started", a3, a4, a5, a6, a7, a8, a1);
  *(_DWORD *)(a2 + 12) = 1;
  return 0;
}

double sub_10001687C(uint64_t a1)
{
  double result;

  if (*(_DWORD *)(a1 + 288) != 101)
    sub_1000235D4();
  *(_QWORD *)(a1 + 632) = 0;
  *(_DWORD *)(a1 + 12) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 592) = 0u;
  return result;
}

uint64_t sub_1000168AC()
{
  CFStringRef v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFStringRef v7;
  const __CFDictionary *v8;
  CFTypeID TypeID;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *MutableCopy;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFDictionary *v23;
  CFMutableArrayRef v24;
  const __CFArray *v25;
  const __CFArray *v26;
  const __CFArray *v27;
  const __CFArray *v28;
  const __CFArray *v29;
  CFIndex Count;
  CFIndex v31;
  CFIndex v32;
  const __CFDictionary *ValueAtIndex;
  CFTypeID v34;
  const void *Value;
  CFTypeID v36;
  const void *v37;
  CFTypeID v38;
  CFIndex v39;
  uid_t v41;
  gid_t v42;
  uint64_t v43;
  char v44;
  const __CFArray *v45;
  const __CFArray *v46;
  const __CFArray *v47;
  int v48;

  if (!dword_100034D38)
    return 0;
  v48 = 0;
  v0 = CFStringCreateWithCString(kCFAllocatorDefault, "com.apple.MobileInternetSharing", 0x600u);
  if (v0)
  {
    v7 = v0;
    v8 = (const __CFDictionary *)sub_10000EE38("/Library/Preferences/SystemConfiguration/bootpd.plist", &v48, 0);
    TypeID = CFDictionaryGetTypeID();
    if (v8 && CFGetTypeID(v8) == TypeID)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v8);
      v23 = MutableCopy;
      if (MutableCopy)
      {
        v24 = sub_100017A88(MutableCopy, CFSTR("Subnets"));
        if (v24)
        {
          v25 = v24;
          v26 = sub_100017A88(v23, CFSTR("dhcp_enabled"));
          v27 = sub_100017A88(v23, CFSTR("ignore_allow_deny"));
          v28 = sub_100017A88(v23, CFSTR("detect_other_dhcp_server"));
          v29 = sub_100017A88(v23, CFSTR("ipv6_only_preferred"));
          Count = CFArrayGetCount(v25);
          if (Count >= 1)
          {
            v31 = Count;
            v44 = 0;
            v46 = v27;
            v47 = v26;
            v45 = v28;
            while (2)
            {
              v32 = 0;
              while (1)
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v25, v32);
                v34 = CFDictionaryGetTypeID();
                if (ValueAtIndex)
                {
                  if (CFGetTypeID(ValueAtIndex) == v34)
                  {
                    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("_creator"));
                    v36 = CFStringGetTypeID();
                    if (Value)
                    {
                      if (CFGetTypeID(Value) == v36 && CFEqual(Value, v7))
                        break;
                    }
                  }
                }
                if (v31 == ++v32)
                {
                  v27 = v46;
                  v26 = v47;
                  v28 = v45;
                  if ((v44 & 1) == 0)
                    goto LABEL_38;
                  goto LABEL_37;
                }
              }
              v37 = CFDictionaryGetValue(ValueAtIndex, CFSTR("interface"));
              v38 = CFStringGetTypeID();
              if (v37 && CFGetTypeID(v37) == v38)
              {
                v26 = v47;
                sub_100017AF4(v47, v37);
                v27 = v46;
                sub_100017AF4(v46, v37);
                sub_100017AF4(v45, v37);
                sub_100017AF4(v29, v37);
                v39 = v32;
                v28 = v45;
                CFArrayRemoveValueAtIndex(v25, v39);
                v31 = CFArrayGetCount(v25);
                v44 = 1;
                if (v31 > 0)
                  continue;
LABEL_37:
                sub_100017B84(v23, CFSTR("Subnets"), v25, 1);
                sub_100017B84(v23, CFSTR("dhcp_enabled"), v26, 0);
                sub_100017B84(v23, CFSTR("ignore_allow_deny"), v27, 1);
                sub_100017B84(v23, CFSTR("detect_other_dhcp_server"), v28, 0);
                sub_100017B84(v23, CFSTR("ipv6_only_preferred"), v29, 1);
                v41 = geteuid();
                v42 = getgid();
                v48 = sub_10000EC98(v23, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v41, v42, 420, 0);
                sub_100017868();
                goto LABEL_38;
              }
              break;
            }
            unlink("/Library/Preferences/SystemConfiguration/bootpd.plist");
            v27 = v46;
            v26 = v47;
            v28 = v45;
          }
LABEL_38:
          CFRelease(v7);
          if (v28)
            CFRelease(v28);
          if (v27)
            CFRelease(v27);
          CFRelease(v25);
          if (!v26)
            goto LABEL_24;
          goto LABEL_23;
        }
      }
      else
      {
        sub_100003108(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v17, v18, v19, v20, v21, v22, v43);
      }
    }
    else
    {
      sub_100003108(2u, (uint64_t)"no bootpd plist found", v10, v11, v12, v13, v14, v15, v43);
      v23 = 0;
    }
    v29 = 0;
    v26 = (const __CFArray *)v7;
LABEL_23:
    CFRelease(v26);
LABEL_24:
    if (v23)
      CFRelease(v23);
    if (v8)
      CFRelease(v8);
    if (v29)
      CFRelease(v29);
    goto LABEL_31;
  }
  sub_100003108(0, (uint64_t)"CFStringCreateWithCString() failed", v1, v2, v3, v4, v5, v6, v43);
LABEL_31:
  if (sub_100016CB4())
    sub_10000F1A0((uint64_t)CFSTR("com.apple.bootpd"), (uint64_t)"bootpd", 0);
  byte_1000353D0 = 1;
  return 0;
}

uint64_t sub_100016CB4()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  CFBooleanRef Value;
  BOOL v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  uint64_t v7;
  CFBooleanRef v9;
  BOOL v10;
  int v11;

  v11 = 0;
  v0 = (const __CFDictionary *)sub_10000EE38("/Library/Preferences/SystemConfiguration/bootpd.plist", &v11, 0);
  if (!v0)
    return 1;
  v1 = v0;
  Value = (CFBooleanRef)CFDictionaryGetValue(v0, CFSTR("bootp_enabled"));
  if (Value)
    v3 = Value == kCFBooleanFalse;
  else
    v3 = 1;
  if (v3
    && ((v4 = (const __CFBoolean *)CFDictionaryGetValue(v1, CFSTR("dhcp_enabled"))) == 0 || v4 == kCFBooleanFalse)
    && ((v5 = (const __CFBoolean *)CFDictionaryGetValue(v1, CFSTR("netboot_enabled"))) == 0 || v5 == kCFBooleanFalse)
    && ((v6 = (const __CFBoolean *)CFDictionaryGetValue(v1, CFSTR("old_netboot_enabled"))) == 0
     || v6 == kCFBooleanFalse))
  {
    v9 = (CFBooleanRef)CFDictionaryGetValue(v1, CFSTR("relay_enabled"));
    if (v9)
      v10 = v9 == kCFBooleanFalse;
    else
      v10 = 1;
    v7 = v10;
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v1);
  return v7;
}

void sub_100016DA4()
{
  if (byte_1000353D0 == 1)
    byte_1000353D0 = 0;
}

uint64_t sub_100016DBC()
{
  uint64_t v0;
  int v1;
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

  if (dword_1000353D4 < 0)
  {
    v1 = -1;
    v0 = 2;
    goto LABEL_5;
  }
  if (!dword_1000353D4)
  {
    if (!dword_100034D38)
      return 0;
    if (access("/usr/libexec/bootpd", 0))
    {
      v0 = *__error();
      sub_100003108(0, (uint64_t)"\"%s\" not available", v9, v10, v11, v12, v13, v14, (uint64_t)"/usr/libexec/bootpd");
      if (!(_DWORD)v0)
        goto LABEL_3;
    }
    else
    {
      if (dword_100034D4C == -1)
      {
        if (notify_register_dispatch(DHCPSDisabledInterfacesNotificationKey, &dword_100034D4C, (dispatch_queue_t)qword_100035470, &stru_100030FA8))
        {
          sub_100003108(0, (uint64_t)"notify_register_dispatch() failed for disabled interfaces", v22, v23, v24, v25, v26, v27, v34);
          sub_100003108(0, (uint64_t)"monitoring disabled interfaces failed", v28, v29, v30, v31, v32, v33, v35);
          v1 = -1;
          v0 = 12;
          goto LABEL_5;
        }
      }
      else
      {
        sub_100003108(2u, (uint64_t)"dhcp disabled monitoring already setup", v3, v4, v5, v6, v7, v8, v34);
      }
      v15 = sub_10000F1A0((uint64_t)CFSTR("com.apple.bootpd"), (uint64_t)"bootpd", 1);
      if (!(_DWORD)v15)
        goto LABEL_3;
      v0 = v15;
      sub_100003108(0, (uint64_t)"unable to load bootpd job", v16, v17, v18, v19, v20, v21, v34);
    }
    v1 = -1;
    goto LABEL_5;
  }
LABEL_3:
  v0 = 0;
  v1 = dword_1000353D4 + 1;
LABEL_5:
  dword_1000353D4 = v1;
  return v0;
}

uint64_t sub_100016F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v12;
  const __SCPreferences *v13;
  const __SCPreferences *v14;
  const __CFDictionary *v15;
  CFTypeID TypeID;
  const __CFNumber *v17;
  CFTypeID v18;
  int v19;
  int v20;
  const __CFDictionary *v21;
  CFTypeID v22;
  const __CFDictionary *MutableCopy;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFDictionary *v30;
  CFMutableArrayRef v31;
  const __CFArray *v32;
  CFBooleanRef v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  int v41;
  const __CFArray *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v50;
  char *v51;
  in_addr_t v52;
  in_addr v53;
  char *v54;
  in_addr v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  in_addr v62;
  char *v63;
  in_addr v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  in_addr v71;
  char *v72;
  in_addr v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  CFMutableArrayRef v80;
  const __CFArray *v81;
  in_addr v82;
  char *v83;
  in_addr v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  CFMutableArrayRef v97;
  CFMutableArrayRef v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  in_addr_t v117;
  in_addr v118;
  char *v119;
  in_addr v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  in_addr v127;
  char *v128;
  in_addr v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const __CFString *v136;
  __CFDictionary *v137;
  const __CFArray *v138;
  uid_t v139;
  gid_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  in_addr v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  __CFArray *theArray;
  int v165;
  const __CFArray *v166;
  const __CFArray *cf;
  const __CFArray *value;
  int __errnum;
  char valuePtr[16];

  if (!a1)
    sub_1000235FC();
  if (dword_1000353D4 < 0)
  {
    sub_100003108(2u, (uint64_t)"\"%s\" not available", a3, a4, a5, a6, a7, a8, (uint64_t)"bootpd");
    return 19;
  }
  if (!dword_100034D38)
  {
    sub_100003108(2u, (uint64_t)"\"%s\" not enabled", a3, a4, a5, a6, a7, a8, (uint64_t)"bootpd");
    return 19;
  }
  if (qword_1000354D4)
  {
    v12 = 3600;
    __errnum = 12;
    *(_DWORD *)valuePtr = 3600;
    v13 = SCPreferencesCreate(0, CFSTR("com.apple.MobileInternetSharing"), CFSTR("com.apple.InternetSharing.default.plist"));
    if (v13)
    {
      v14 = v13;
      v15 = (const __CFDictionary *)SCPreferencesGetValue(v13, CFSTR("bootpd"));
      TypeID = CFDictionaryGetTypeID();
      if (v15)
      {
        if (CFGetTypeID(v15) == TypeID)
        {
          v17 = (const __CFNumber *)CFDictionaryGetValue(v15, CFSTR("DHCPLeaseTimeSecs"));
          v18 = CFNumberGetTypeID();
          if (v17)
          {
            if (CFGetTypeID(v17) == v18)
              CFNumberGetValue(v17, kCFNumberIntType, valuePtr);
          }
        }
      }
      CFRelease(v14);
      v12 = *(_DWORD *)valuePtr;
    }
    if (!*(_BYTE *)(a1 + 700) || !*(_BYTE *)(a1 + 701))
    {
LABEL_88:
      v8 = sub_100017868();
      if ((_DWORD)v8)
        return v8;
      v148 = sub_10000EFF0(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
      sub_100003108(0, (uint64_t)"started: [DHCP subnet=%s on %s mtu=%d <---> %s mtu=%d] max-mss=%d", v149, v150, v151, v152, v153, v154, (uint64_t)v148);
      if (*(_DWORD *)(a1 + 20) == 201)
      {
        v155.s_addr = *(_DWORD *)(a1 + 680);
        v156 = inet_ntoa(v155);
        snprintf(valuePtr, 0x10uLL, "%s", v156);
        sub_100003108(0, (uint64_t)"  dns: %s", v157, v158, v159, v160, v161, v162, (uint64_t)valuePtr);
      }
      return 0;
    }
    if ((*(_DWORD *)(a1 + 20) | 2) != 0xCB)
      sub_100023624();
    v19 = *(_DWORD *)(a1 + 1128);
    v20 = *(_DWORD *)(a2 + 1264);
    v21 = (const __CFDictionary *)sub_10000EE38("/Library/Preferences/SystemConfiguration/bootpd.plist", &__errnum, 0);
    v22 = CFDictionaryGetTypeID();
    if (v21 && CFGetTypeID(v21) == v22)
      MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v21);
    else
      MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v30 = MutableCopy;
    if (!MutableCopy)
    {
      sub_100003108(0, (uint64_t)"CFDictionaryCreateMutable/Copy() failed", v24, v25, v26, v27, v28, v29, v163);
      v32 = 0;
      goto LABEL_82;
    }
    if (v19 == 502)
      v31 = 0;
    else
      v31 = sub_100017A88(MutableCopy, CFSTR("Subnets"));
    value = sub_100017A88(v30, CFSTR("dhcp_enabled"));
    cf = sub_100017A88(v30, CFSTR("ignore_allow_deny"));
    v166 = sub_100017A88(v30, CFSTR("detect_other_dhcp_server"));
    v32 = sub_100017A88(v30, CFSTR("ipv6_only_preferred"));
    if ((*(_BYTE *)(a1 + 584) & 2) != 0 && *(_DWORD *)(a1 + 20) == 201)
    {
      CFDictionarySetValue(v30, CFSTR("use_server_config_for_dhcp_options"), kCFBooleanTrue);
      v33 = kCFBooleanFalse;
    }
    else
    {
      v33 = kCFBooleanFalse;
      CFDictionarySetValue(v30, CFSTR("use_server_config_for_dhcp_options"), kCFBooleanFalse);
    }
    CFDictionaryRemoveValue(v30, CFSTR("dhcp_ignore_client_identifier"));
    CFDictionarySetValue(v30, CFSTR("bootp_enabled"), v33);
    sub_10000EB50(value, (const char *)(a1 + 308));
    sub_10000EB50(cf, (const char *)(a1 + 308));
    v40 = v19 == 502 || v20 == 1;
    v41 = v40;
    if (v40)
    {
      if (!byte_100035482)
        sub_10000EB50(v32, (const char *)(a1 + 308));
      sub_100003108(2u, (uint64_t)"config[%s]: dhcp_enabled", v34, v35, v36, v37, v38, v39, a1 + 308);
      v40 = v19 == 502;
      v42 = v166;
      if (v40)
        goto LABEL_67;
    }
    else
    {
      v42 = v166;
      sub_10000EB50(v166, (const char *)(a1 + 308));
      sub_100003108(2u, (uint64_t)"config[%s]: dhcp_enabled", v43, v44, v45, v46, v47, v48, a1 + 308);
    }
    v165 = v41;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
LABEL_73:
      if (v42)
        CFRelease(v42);
      if (cf)
        CFRelease(cf);
      if (v31)
        CFRelease(v31);
      if (value)
        CFRelease(value);
      CFRelease(v30);
LABEL_82:
      if (v21)
        CFRelease(v21);
      if (v32)
        CFRelease(v32);
      v8 = __errnum;
      if (__errnum)
      {
        v141 = strerror(__errnum);
        sub_100003108(0, (uint64_t)"dhcp_config_create: %s", v142, v143, v144, v145, v146, v147, (uint64_t)v141);
        return v8;
      }
      goto LABEL_88;
    }
    v50 = Mutable;
    v51 = sub_10000EFF0(*(_DWORD *)(a1 + 680), *(_DWORD *)(a1 + 684));
    sub_10000EBD0(v50, CFSTR("name"), v51);
    v52 = *(_DWORD *)(a1 + 684) & *(_DWORD *)(a1 + 680);
    v53.s_addr = v52;
    v54 = inet_ntoa(v53);
    sub_10000EBD0(v50, CFSTR("net_address"), v54);
    v55.s_addr = v52;
    inet_ntoa(v55);
    sub_100003108(2u, (uint64_t)"config[%s]: Subnets:net_address [%s]", v56, v57, v58, v59, v60, v61, a1 + 308);
    v62.s_addr = *(_DWORD *)(a1 + 684);
    v63 = inet_ntoa(v62);
    sub_10000EBD0(v50, CFSTR("net_mask"), v63);
    v64.s_addr = *(_DWORD *)(a1 + 684);
    inet_ntoa(v64);
    sub_100003108(2u, (uint64_t)"config[%s]: Subnets:net_mask [%s]", v65, v66, v67, v68, v69, v70, a1 + 308);
    if (*(_DWORD *)(a1 + 20) == 201)
    {
      v71.s_addr = *(_DWORD *)(a1 + 680);
      v72 = inet_ntoa(v71);
      sub_10000EBD0(v50, CFSTR("dhcp_router"), v72);
      v73.s_addr = *(_DWORD *)(a1 + 680);
      inet_ntoa(v73);
      sub_100003108(2u, (uint64_t)"config[%s]: Subnets:dhcp_router [%s]", v74, v75, v76, v77, v78, v79, a1 + 308);
      if (*(_DWORD *)(a1 + 20) == 201)
      {
        v80 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        if (!v80)
          goto LABEL_57;
        v81 = v80;
        v82.s_addr = *(_DWORD *)(a1 + 680);
        v83 = inet_ntoa(v82);
        sub_10000EB50(v81, v83);
        v84.s_addr = *(_DWORD *)(a1 + 680);
        inet_ntoa(v84);
        sub_100003108(2u, (uint64_t)"config[%s]: Subnets:dhcp_domain_name_server [%s]", v85, v86, v87, v88, v89, v90, a1 + 308);
        CFDictionarySetValue(v50, CFSTR("dhcp_domain_name_server"), v81);
        CFRelease(v81);
      }
    }
    sub_10000EBD0(v50, CFSTR("_creator"), "com.apple.MobileInternetSharing");
    CFDictionarySetValue(v50, CFSTR("allocate"), kCFBooleanTrue);
    sub_10000BE00(v50, CFSTR("lease_min"), v12);
    sub_10000BE00(v50, CFSTR("lease_max"), v12);
    sub_100003108(2u, (uint64_t)"config[%s]: Subnets:lease_{min,max} [%d]", v91, v92, v93, v94, v95, v96, a1 + 308);
    v97 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (v97)
    {
      v98 = v97;
      v99 = *(_DWORD *)(a1 + 680);
      v100 = *(_DWORD *)(a1 + 684);
      v101 = v100 & v99;
      v102 = *(_DWORD *)(a1 + 692);
      theArray = v31;
      if (v102 && v101 != v102)
      {
        if (v99 != v102)
          sub_100023674();
        v104 = bswap32(v102) + 1;
      }
      else
      {
        v103 = bswap32(v101);
        if (bswap32(v99) != v103 + 1)
          sub_10002364C();
        v104 = v103 + 2;
      }
      v105 = 1 << -(char)sub_10000EFC8(v100);
      v106 = *(_DWORD *)(a1 + 680);
      v107 = *(_DWORD *)(a1 + 684);
      v108 = v107 & v106;
      v109 = *(_DWORD *)(a1 + 696);
      if (!v109 || v105 + bswap32(v108) - 1 == bswap32(v109))
      {
        if (v105 < 4)
        {
          v110 = sub_10000EFF0(v106, v107);
          sub_100003108(0, (uint64_t)"not enough hosts on subnet %s", v111, v112, v113, v114, v115, v116, (uint64_t)v110);
          CFRelease(v98);
          CFRelease(v50);
          __errnum = 49;
          v31 = theArray;
          goto LABEL_64;
        }
        v109 = bswap32(v105 + bswap32(v108) - 2);
      }
      v117 = bswap32(v104);
      v118.s_addr = v117;
      v119 = inet_ntoa(v118);
      sub_10000EB50(v98, v119);
      v120.s_addr = v117;
      inet_ntoa(v120);
      sub_100003108(2u, (uint64_t)"config[%s]: Subnets:net_range_min [%s]", v121, v122, v123, v124, v125, v126, a1 + 308);
      v127.s_addr = v109;
      v128 = inet_ntoa(v127);
      sub_10000EB50(v98, v128);
      v129.s_addr = v109;
      inet_ntoa(v129);
      sub_100003108(2u, (uint64_t)"config[%s]: Subnets:net_range_max [%s]", v130, v131, v132, v133, v134, v135, a1 + 308);
      CFDictionarySetValue(v50, CFSTR("net_range"), v98);
      CFRelease(v98);
      sub_10000EBD0(v50, CFSTR("interface"), (char *)(a1 + 308));
      v31 = theArray;
      CFArrayAppendValue(theArray, v50);
      CFRelease(v50);
      CFDictionarySetValue(v30, CFSTR("Subnets"), theArray);
      v42 = v166;
      v41 = v165;
LABEL_67:
      CFDictionarySetValue(v30, CFSTR("dhcp_enabled"), value);
      CFDictionarySetValue(v30, CFSTR("ignore_allow_deny"), cf);
      if (v41)
      {
        if (!CFArrayGetCount(v32))
        {
LABEL_72:
          v139 = geteuid();
          v140 = getgid();
          __errnum = sub_10000EC98(v30, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v139, v140, 420, 0);
          goto LABEL_73;
        }
        v136 = CFSTR("ipv6_only_preferred");
        v137 = v30;
        v138 = v32;
      }
      else
      {
        v136 = CFSTR("detect_other_dhcp_server");
        v137 = v30;
        v138 = v42;
      }
      CFDictionarySetValue(v137, v136, v138);
      goto LABEL_72;
    }
LABEL_57:
    CFRelease(v50);
LABEL_64:
    v42 = v166;
    goto LABEL_73;
  }
  sub_100003108(2u, (uint64_t)"no internal interfaces to start dhcp", a3, a4, a5, a6, a7, a8, v163);
  return 0;
}

uint64_t sub_100017868()
{
  pid_t v0;
  uint64_t v1;
  int *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_10000C98C("/usr/libexec/bootpd");
  if (!v0)
    return 0;
  v1 = kill(v0, 1);
  if ((_DWORD)v1)
  {
    v2 = __error();
    v3 = strerror(*v2);
    sub_100003108(0, (uint64_t)"bootpd(HUP): %s", v4, v5, v6, v7, v8, v9, (uint64_t)v3);
  }
  return v1;
}

void sub_1000178D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if ((dword_1000353D4 & 0x80000000) == 0)
  {
    if (dword_1000353D4 >= 2 && qword_1000354D4)
    {
      sub_100017978(a1, a2, a3, a4, a5, a6, a7, a8, v8);
    }
    else
    {
      sub_100017978(a1, a2, a3, a4, a5, a6, a7, a8, v8);
      if (dword_100034D4C != -1)
      {
        notify_cancel(dword_100034D4C);
        dword_100034D4C = -1;
      }
      if (sub_100016CB4())
        sub_10000F1A0((uint64_t)CFSTR("com.apple.bootpd"), (uint64_t)"bootpd", 0);
    }
    if (dword_1000353D4 >= 1)
      --dword_1000353D4;
  }
}

void sub_100017978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFStringRef v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFStringRef v16;
  __CFArray *Mutable;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFArray *v24;
  int v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  pid_t v34;
  uint64_t v35;
  char v36;

  v36 = 0;
  v9 = CFStringCreateWithCString(0, (const char *)(a1 + 308), 0x600u);
  if (v9)
  {
    v16 = v9;
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v24 = Mutable;
      CFArrayAppendValue(Mutable, v16);
      v25 = sub_100017CD0(v24, &v36);
      if (v25)
      {
        v26 = "dhcp_interface_config_remove: %s";
      }
      else
      {
        if (!v36)
          goto LABEL_6;
        v34 = sub_10000C98C("/usr/libexec/bootpd");
        if (!v34 || !kill(v34, 1))
          goto LABEL_6;
        v25 = *__error();
        v26 = "bootpd(HUP): %s";
      }
      v27 = strerror(v25);
      sub_100003108(0, (uint64_t)v26, v28, v29, v30, v31, v32, v33, (uint64_t)v27);
LABEL_6:
      CFRelease(v16);
      CFRelease(v24);
      return;
    }
    sub_100003108(0, (uint64_t)"CFArrayCreate() failed", v18, v19, v20, v21, v22, v23, v35);
    CFRelease(v16);
  }
  else
  {
    sub_100003108(0, (uint64_t)"CFStringCreateWithCString() failed", v10, v11, v12, v13, v14, v15, a9);
  }
}

CFMutableArrayRef sub_100017A88(const __CFDictionary *a1, const void *a2)
{
  const __CFArray *Value;
  CFTypeID TypeID;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, a2);
  TypeID = CFArrayGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
    return CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, Value);
  else
    return CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
}

const __CFArray *sub_100017AF4(const __CFArray *result, const void *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex FirstIndexOfValue;
  CFIndex v6;
  CFIndex v7;
  CFRange v8;
  CFRange v9;

  if (result)
  {
    v3 = result;
    Count = CFArrayGetCount(result);
    v8.location = 0;
    v8.length = Count;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v8, a2);
    if (FirstIndexOfValue == -1)
    {
      return 0;
    }
    else
    {
      v6 = FirstIndexOfValue;
      v7 = Count - 1;
      do
      {
        CFArrayRemoveValueAtIndex(v3, v6);
        v9.location = 0;
        v9.length = v7;
        v6 = CFArrayGetFirstIndexOfValue(v3, v9, a2);
        --v7;
      }
      while (v6 != -1);
      return (const __CFArray *)1;
    }
  }
  return result;
}

void sub_100017B84(__CFDictionary *a1, const void *a2, CFArrayRef theArray, int a4)
{
  __CFDictionary *v8;
  const void *v9;
  CFBooleanRef v10;

  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      v8 = a1;
      v9 = a2;
      v10 = theArray;
    }
    else
    {
      if (a4)
      {
        CFDictionaryRemoveValue(a1, a2);
        return;
      }
      v10 = kCFBooleanFalse;
      v8 = a1;
      v9 = a2;
    }
    CFDictionarySetValue(v8, v9, v10);
  }
}

void sub_100017C14(id a1, int a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFArray *v16;
  CFTypeID TypeID;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v8 = sub_100003108(0, (uint64_t)"received dhcp disable notification", v2, v3, v4, v5, v6, v7, v18);
  if (dword_100034D4C == -1)
  {
    sub_100003108(1u, (uint64_t)"dhcp disabled interfaces monitoring already stopped", v9, v10, v11, v12, v13, v14, v20);
  }
  else
  {
    v15 = DHCPSCopyDisabledInterfaces(v8);
    if (v15)
    {
      v16 = (const __CFArray *)v15;
      TypeID = CFArrayGetTypeID();
      if (CFGetTypeID(v16) == TypeID && CFArrayGetCount(v16))
      {
        v19 = 0;
        sub_100017CD0(v16, &v19);
        if (v19)
          sub_100017868();
      }
      CFRelease(v16);
    }
  }
}

uint64_t sub_100017CD0(const __CFArray *a1, _BYTE *a2)
{
  const void *v4;
  CFTypeID TypeID;
  const __CFDictionary *MutableCopy;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  const __CFArray *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  const __CFArray *v17;
  CFMutableArrayRef v18;
  CFIndex v19;
  CFIndex v20;
  const __CFString *ValueAtIndex;
  CFTypeID v22;
  const __CFArray *v23;
  const __CFArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFIndex v31;
  CFIndex v32;
  CFIndex v33;
  const __CFDictionary *v34;
  CFTypeID v35;
  const void *Value;
  CFTypeID v37;
  uid_t v38;
  gid_t v39;
  uint64_t v41;
  __CFDictionary *cf;
  CFTypeRef v43;
  const __CFArray *v44;
  const __CFArray *v45;
  CFIndex Count;
  _BYTE *v47;
  unsigned int v48;
  char buffer[8];
  uint64_t v50;

  v48 = 0;
  Count = CFArrayGetCount(a1);
  v47 = a2;
  *a2 = 0;
  v4 = (const void *)sub_10000EE38("/Library/Preferences/SystemConfiguration/bootpd.plist", (int *)&v48, 0);
  TypeID = CFDictionaryGetTypeID();
  if (!v4)
    return v48;
  if (CFGetTypeID(v4) != TypeID)
  {
LABEL_41:
    CFRelease(v4);
    return v48;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, (CFDictionaryRef)v4);
  if (!MutableCopy)
  {
    sub_100003108(0, (uint64_t)"CFDictionaryCreateMutableCopy() failed", v7, v8, v9, v10, v11, v12, v41);
    goto LABEL_41;
  }
  v13 = MutableCopy;
  v43 = v4;
  v14 = sub_100017A88(MutableCopy, CFSTR("Subnets"));
  v15 = sub_100017A88(v13, CFSTR("dhcp_enabled"));
  v16 = sub_100017A88(v13, CFSTR("ignore_allow_deny"));
  v17 = sub_100017A88(v13, CFSTR("detect_other_dhcp_server"));
  cf = v13;
  v18 = sub_100017A88(v13, CFSTR("ipv6_only_preferred"));
  v4 = v18;
  v19 = Count;
  if (Count >= 1)
  {
    v20 = 0;
    v44 = v17;
    v45 = v18;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v20);
      v22 = CFStringGetTypeID();
      if (ValueAtIndex && CFGetTypeID(ValueAtIndex) == v22)
      {
        v23 = v16;
        v24 = v15;
        *(_QWORD *)buffer = 0;
        v50 = 0;
        CFStringGetCString(ValueAtIndex, buffer, 16, 0x600u);
        sub_100003108(1u, (uint64_t)"dhcp disabled interface: %s", v25, v26, v27, v28, v29, v30, (uint64_t)buffer);
        if (v14)
        {
          v31 = CFArrayGetCount(v14);
          if (v31 >= 1)
          {
            v32 = v31;
            v33 = 0;
            while (1)
            {
              v34 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v33);
              v35 = CFDictionaryGetTypeID();
              if (v34)
              {
                if (CFGetTypeID(v34) == v35)
                {
                  Value = CFDictionaryGetValue(v34, CFSTR("interface"));
                  v37 = CFStringGetTypeID();
                  if (Value)
                  {
                    if (CFGetTypeID(Value) == v37 && CFEqual(ValueAtIndex, Value))
                      break;
                  }
                }
              }
              if (v32 == ++v33)
                goto LABEL_17;
            }
            CFArrayRemoveValueAtIndex(v14, v33);
            *v47 = 1;
          }
        }
LABEL_17:
        v15 = v24;
        if (sub_100017AF4(v24, ValueAtIndex))
          *v47 = 1;
        v16 = v23;
        v4 = v45;
        if (sub_100017AF4(v23, ValueAtIndex))
          *v47 = 1;
        v17 = v44;
        v19 = Count;
        if (sub_100017AF4(v44, ValueAtIndex))
          *v47 = 1;
        if (sub_100017AF4(v45, ValueAtIndex))
          *v47 = 1;
      }
      ++v20;
    }
    while (v20 != v19);
  }
  if (*v47)
  {
    sub_100017B84(cf, CFSTR("Subnets"), v14, 1);
    sub_100017B84(cf, CFSTR("dhcp_enabled"), v15, 0);
    sub_100017B84(cf, CFSTR("ignore_allow_deny"), v16, 1);
    sub_100017B84(cf, CFSTR("detect_other_dhcp_server"), v17, 0);
    sub_100017B84(cf, CFSTR("ipv6_only_preferred"), (CFArrayRef)v4, 1);
    v38 = geteuid();
    v39 = getgid();
    v48 = sub_10000EC98(cf, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/bootpd.plist", v38, v39, 420, 0);
  }
  if (v17)
    CFRelease(v17);
  if (v16)
    CFRelease(v16);
  if (v14)
    CFRelease(v14);
  if (v15)
    CFRelease(v15);
  CFRelease(cf);
  CFRelease(v43);
  if (v4)
    goto LABEL_41;
  return v48;
}

void sub_1000180E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  ifaddrs *i;
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
  ifaddrs *v22;
  char __dst[16];
  size_t __n[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;

  v22 = 0;
  v32 = 0;
  v31 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  *(_OWORD *)__dst = 0u;
  *(_OWORD *)__n = 0u;
  if (getifaddrs(&v22))
  {
    __error();
    sub_100003108(0, (uint64_t)"getifaddrs: %m", v0, v1, v2, v3, v4, v5, v21);
  }
  else
  {
    v6 = socket(2, 2, 0);
    if (v6 < 0)
    {
      __error();
      sub_100003108(0, (uint64_t)"socket: %m", v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      v7 = v6;
      for (i = v22; i; i = i->ifa_next)
      {
        if (strnstr(i->ifa_name, "bridge", 0x10uLL))
        {
          v32 = 0;
          v31 = 0u;
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          *(_OWORD *)__dst = 0u;
          *(_OWORD *)__n = 0u;
          strncpy(__dst, i->ifa_name, 0x10uLL);
          if (ioctl(v7, 0xC0946990uLL, __dst) != -1
            && LODWORD(__n[0])
            && !strncmp((const char *)__n + 4, "com.apple.MobileInternetSharing", LODWORD(__n[0]))
            && sub_1000186F0(i->ifa_name))
          {
            sub_100003108(0, (uint64_t)"unable to destroy interface %s", v9, v10, v11, v12, v13, v14, (uint64_t)i->ifa_name);
          }
        }
      }
      close(v7);
    }
    freeifaddrs(v22);
  }
  byte_1000353D8 = 1;
}

void sub_1000182A8()
{
  if (byte_1000353D8 == 1)
    byte_1000353D8 = 0;
}

uint64_t sub_1000182C0(char *__s1, int a2, int a3, uint64_t a4, char *a5, uint64_t a6)
{
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
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
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  xpc_object_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
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
  char *v82;
  char *v83;
  uint64_t v84;
  char __dst[16];
  _BYTE v86[132];

  if (!__s1)
    sub_10002369C();
  if (!*__s1)
    sub_1000236C4();
  v11 = &qword_1000353E0;
  while (1)
  {
    v11 = (uint64_t *)*v11;
    if (!v11)
      break;
    if (!strncmp(__s1, (const char *)v11 + 8, 0x10uLL))
      return 0;
  }
  if (if_nametoindex(__s1))
  {
    v12 = sub_1000186F0(__s1);
    if ((_DWORD)v12)
      goto LABEL_38;
  }
  *(_OWORD *)__dst = 0u;
  *(_OWORD *)v86 = 0u;
  v19 = socket(2, 2, 0);
  if ((v19 & 0x80000000) == 0)
  {
    *(_OWORD *)__dst = 0u;
    *(_OWORD *)v86 = 0u;
    if ((unint64_t)__strlcpy_chk(__dst, __s1, 16, 16) <= 0xF)
    {
      v82 = __dst;
      if ((ioctl(v19, 0xC020697AuLL) & 0x80000000) == 0)
      {
        v12 = 0;
        goto LABEL_19;
      }
      v20 = "SIOCIFCREATE2: %m";
    }
    else
    {
      v20 = "strlcpy: %m";
    }
    v12 = *__error();
    sub_100003108(0, (uint64_t)v20, v27, v28, v29, v30, v31, v32, (uint64_t)v82);
LABEL_19:
    close(v19);
    if (!(_DWORD)v12)
      goto LABEL_20;
    goto LABEL_38;
  }
  v12 = *__error();
  sub_100003108(0, (uint64_t)"socket: %m", v21, v22, v23, v24, v25, v26, (uint64_t)v82);
  if (v19 != -1)
    goto LABEL_19;
  if (!(_DWORD)v12)
  {
LABEL_20:
    memset(v86, 0, sizeof(v86));
    *(_OWORD *)__dst = 0u;
    v33 = socket(2, 2, 0);
    if (v33 < 0)
    {
      v12 = *__error();
      sub_100003108(0, (uint64_t)"socket: %m", v34, v35, v36, v37, v38, v39, (uint64_t)v82);
      if (v33 == -1)
      {
LABEL_27:
        if ((v12 & 0x80000000) != 0)
        {
          sub_100003108(0, (uint64_t)"bridge create, add description: %m", v40, v41, v42, v43, v44, v45, (uint64_t)v83);
        }
        else
        {
          v52 = (char *)malloc_type_malloc(0x30uLL, 0x10A00409936FB06uLL);
          if (v52)
          {
            v53 = v52;
            *((_OWORD *)v52 + 1) = 0u;
            *((_OWORD *)v52 + 2) = 0u;
            *(_OWORD *)v52 = 0u;
            snprintf(v52 + 8, 0x10uLL, "%s", __s1);
            *((_DWORD *)v53 + 10) = 1;
            *((_DWORD *)v53 + 6) = a2;
            *((_DWORD *)v53 + 7) = a3;
            v54 = xpc_dictionary_create(0, 0, 0);
            *((_QWORD *)v53 + 4) = v54;
            if (v54)
            {
              *(_QWORD *)v53 = qword_1000353E0;
              qword_1000353E0 = (uint64_t)v53;
              if (__CFADD__(dword_1000353E8++, 1))
                sub_1000236EC();
              if (a2 != 204)
              {
                sub_10000CC20((uint64_t)__s1, 1);
                if (!(_DWORD)v12)
                  return v12;
                goto LABEL_38;
              }
              v62 = sub_100018B7C(a5, __s1, 0, 1, 0, a6, v59, v60);
              v12 = v62;
              if (!(_DWORD)v62)
              {
                sub_100003108(1u, (uint64_t)"%s external %s%s", v63, v64, v65, v66, v67, v68, (uint64_t)__s1);
                sub_10000CC20((uint64_t)__s1, 1);
                return v12;
              }
              strerror(v62);
              sub_100003108(0, (uint64_t)"mis_bridge_add_member(%s) %s, err %s (%d)", v69, v70, v71, v72, v73, v74, (uint64_t)__s1);
              goto LABEL_37;
            }
            sub_100003108(0, (uint64_t)"unable to create bridge members dictionary", v55, v56, v57, v58, v59, v60, v84);
            free(v53);
          }
          sub_10000F150(a2);
          sub_10000F178(a3);
          sub_100003108(0, (uint64_t)"bridge clone failed for %s mode %s bridge type %s", v75, v76, v77, v78, v79, v80, (uint64_t)__s1);
          v12 = 12;
        }
LABEL_37:
        sub_100018A4C((uint64_t)__s1);
        goto LABEL_38;
      }
    }
    else
    {
      strncpy(__dst, __s1, 0x10uLL);
      strcpy(&v86[4], "com.apple.MobileInternetSharing");
      memset(&v86[36], 0, 96);
      *(_DWORD *)v86 = 31;
      v83 = __dst;
      if (ioctl(v33, 0xC094698FuLL) < 0)
      {
        v12 = *__error();
        sub_100003108(0, (uint64_t)"SIOCSIFDESC: %m", v46, v47, v48, v49, v50, v51, (uint64_t)__dst);
      }
      else
      {
        v12 = 0;
      }
    }
    close(v33);
    goto LABEL_27;
  }
LABEL_38:
  sub_100003108(0, (uint64_t)"could not create bridge interface for %s", v13, v14, v15, v16, v17, v18, (uint64_t)__s1);
  return v12;
}

uint64_t sub_1000186F0(char *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  void *v17;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  int v48;
  __int128 *v49;
  void *v50[2];
  __int128 v51;
  __int128 v52;
  void **v53;

  if (!a1)
    sub_100023714();
  if (!*a1)
    sub_10002373C();
  memset(v50, 0, 12);
  if (!if_nametoindex(a1))
  {
    v30 = 0;
    goto LABEL_26;
  }
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v8 = socket(2, 2, 0);
  if (v8 < 0)
  {
    v30 = *__error();
    sub_100003108(0, (uint64_t)"socket: %m", v31, v32, v33, v34, v35, v36, (uint64_t)v49);
    v17 = 0;
    goto LABEL_19;
  }
  v53 = 0;
  v51 = 0u;
  v52 = 0u;
  v9 = malloc_type_realloc(0, 0x2000uLL, 0x48C2642uLL);
  if (!v9)
  {
    sub_100003108(0, (uint64_t)"realloc() failed: %m", v10, v11, v12, v13, v14, v15, (uint64_t)v49);
    v17 = 0;
    v30 = 12;
    goto LABEL_20;
  }
  v16 = 0x2000;
  while (1)
  {
    v17 = v9;
    bzero(v9, v16);
    LODWORD(v50[0]) = v16;
    *(void **)((char *)v50 + 4) = v17;
    if ((unint64_t)__strlcpy_chk(&v51, a1, 16, 16) >= 0x10)
    {
      v30 = *__error();
      v43 = "strlcpy: %m";
LABEL_17:
      sub_100003108(0, (uint64_t)v43, v37, v38, v39, v40, v41, v42, (uint64_t)v49);
      goto LABEL_19;
    }
    v52 = xmmword_100025160;
    v53 = v50;
    v49 = &v51;
    if (ioctl(v8, 0xC028697BuLL) < 0)
    {
      v30 = *__error();
      v43 = "SIOCGDRVSPEC: %m";
      goto LABEL_17;
    }
    if (LODWORD(v50[0]) + 80 < (int)v16)
      break;
    v53 = 0;
    v16 = (2 * v16);
    v51 = 0u;
    v52 = 0u;
    v9 = malloc_type_realloc(v17, v16, 0x48C2642uLL);
    if (!v9)
    {
      sub_100003108(0, (uint64_t)"realloc() failed: %m", v24, v25, v26, v27, v28, v29, (uint64_t)&v51);
      free(v17);
      v17 = 0;
      v30 = 12;
      goto LABEL_19;
    }
  }
  v30 = 0;
LABEL_19:
  if (v8 != -1)
LABEL_20:
    close(v8);
  if (v17 && (_DWORD)v30)
  {
    free(v17);
    *(void **)((char *)v50 + 4) = 0;
    goto LABEL_25;
  }
  if ((_DWORD)v30)
  {
LABEL_25:
    sub_100003108(0, (uint64_t)"unable to get bridge members", v18, v19, v20, v21, v22, v23, (uint64_t)v49);
  }
  else
  {
    if (LODWORD(v50[0]) >= 0x50)
    {
      v45 = 0;
      v46 = 0;
      do
      {
        v47 = *(char **)((char *)v50 + 4) + v45;
        if ((*(_BYTE **)((char *)v50 + 4))[v45])
        {
          sub_100003108(2u, (uint64_t)"removing bridge %s, member: %s", v18, v19, v20, v21, v22, v23, (uint64_t)a1);
          sub_10000E6E8(v47);
          sub_10000E860(v47);
          sub_10000CD84(v47);
          v48 = sub_10001912C((uint64_t)v47, (uint64_t)a1);
          sub_10000D1BC(v47, 1, 1, 1);
          if (v48)
            sub_100003108(0, (uint64_t)"unable to delete interface %s member: %s", v18, v19, v20, v21, v22, v23, (uint64_t)a1);
        }
        ++v46;
        v45 += 80;
      }
      while (v46 < LODWORD(v50[0]) / 0x50uLL);
    }
    sub_10000E6E8(a1);
    sub_10000E860(a1);
    sub_10000D758(a1, 0, 0);
    v30 = sub_100018A4C((uint64_t)a1);
  }
LABEL_26:
  if (*(void **)((char *)v50 + 4))
  {
    free(*(void **)((char *)v50 + 4));
    *(void **)((char *)v50 + 4) = 0;
  }
  if ((_DWORD)v30)
    sub_100003108(0, (uint64_t)"unable to destroy interface %s", v2, v3, v4, v5, v6, v7, (uint64_t)a1);
  return v30;
}

uint64_t sub_100018A4C(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
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
  __int128 *v24;
  __int128 v25;
  __int128 v26;

  v25 = 0u;
  v26 = 0u;
  v2 = socket(2, 2, 0);
  if (v2 < 0)
  {
    v9 = *__error();
    sub_100003108(0, (uint64_t)"socket: %m", v11, v12, v13, v14, v15, v16, (uint64_t)v24);
    if (v2 == -1)
      return v9;
    goto LABEL_10;
  }
  v25 = 0u;
  v26 = 0u;
  if ((unint64_t)__strlcpy_chk(&v25, a1, 16, 16) >= 0x10)
  {
    v9 = *__error();
    v10 = "strlcpy: %m";
LABEL_9:
    sub_100003108(0, (uint64_t)v10, v3, v4, v5, v6, v7, v8, (uint64_t)v24);
    goto LABEL_10;
  }
  v24 = &v25;
  if (ioctl(v2, 0x80206979uLL) < 0)
  {
    v9 = *__error();
    v10 = "SIOCIFDESTROY: %m";
    goto LABEL_9;
  }
  sub_100003108(2u, (uint64_t)"destroyed interface %s", v17, v18, v19, v20, v21, v22, a1);
  v9 = 0;
LABEL_10:
  close(v2);
  return v9;
}

uint64_t sub_100018B7C(char *a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  int v11;
  char v12;
  int v13;
  uint64_t *v14;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
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
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  BOOL value;
  _OWORD v81[5];

  value = 0;
  if (!a1)
    sub_100023764();
  if (!*a1)
    sub_10002378C();
  if (!__s1)
    sub_1000237B4();
  if (!*__s1)
    sub_1000237DC();
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = &qword_1000353E0;
  do
  {
    v14 = (uint64_t *)*v14;
    if (!v14)
    {
      sub_100003108(0, (uint64_t)"bridge %s does not exist", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
LABEL_11:
      v27 = 22;
      goto LABEL_12;
    }
  }
  while (strncmp(__s1, (const char *)v14 + 8, 0x10uLL));
  if (xpc_dictionary_get_value((xpc_object_t)v14[4], a1))
  {
    sub_100003108(0, (uint64_t)"member %s already added to bridge %s", v15, v16, v17, v18, v19, v20, (uint64_t)a1);
    goto LABEL_11;
  }
  if ((v12 & 1) == 0)
  {
    sub_10000F2A0(a1, &value);
    sub_10000D758(a1, value, 1);
    sub_10000E5CC(a1);
  }
  memset(v81, 0, sizeof(v81));
  if ((unint64_t)__strlcpy_chk(v81, a1, 16, 16) >= 0x10)
  {
    v27 = *__error();
    v35 = "strlcpy: %m";
    goto LABEL_25;
  }
  v36 = socket(2, 2, 0);
  if ((v36 & 0x80000000) == 0)
  {
    v37 = v36;
    v27 = sub_100019624((uint64_t)__s1, v36, 0, (uint64_t)"BRDGADD", (uint64_t)v81, 1);
    close(v37);
    if (!(_DWORD)v27)
      goto LABEL_20;
LABEL_26:
    if ((v12 & 1) == 0)
    {
LABEL_31:
      sub_10000E6E8(a1);
      sub_10000D1BC(a1, 1, value, 0);
    }
LABEL_12:
    sub_100003108(0, (uint64_t)"could not add member %s to interface %s", v21, v22, v23, v24, v25, v26, (uint64_t)a1);
    return v27;
  }
  v27 = *__error();
  v35 = "socket: %m";
LABEL_25:
  sub_100003108(0, (uint64_t)v35, v29, v30, v31, v32, v33, v34, v78);
  if ((_DWORD)v27)
    goto LABEL_26;
LABEL_20:
  if ((v12 & 1) == 0)
  {
    sub_10000DDFC(a1);
    v51 = sub_10000CC20((uint64_t)a1, 1);
    if ((_DWORD)v51)
    {
      v27 = v51;
      v79 = strerror(v51);
      sub_100003108(0, (uint64_t)"bridge add member, setifflags: %s", v52, v53, v54, v55, v56, v57, (uint64_t)v79);
LABEL_30:
      sub_10001912C((uint64_t)a1, (uint64_t)__s1);
      goto LABEL_31;
    }
    if (v11)
      v58 = ((*((_DWORD *)v14 + 7) == 304) << 11) | 0x10000;
    else
      v58 = (*((_DWORD *)v14 + 7) == 304) << 11;
    if (v58)
    {
      v59 = sub_100018FF8((uint64_t)a1, (uint64_t)__s1, v58);
      if ((_DWORD)v59)
      {
        v27 = v59;
        strerror(v59);
        sub_100003108(0, (uint64_t)"%s(%s) set bridge member flags 0x%x failed: %s", v66, v67, v68, v69, v70, v71, (uint64_t)__s1);
        goto LABEL_30;
      }
      sub_100003108(1u, (uint64_t)"%s(%s) set bridge member flags 0x%x", v60, v61, v62, v63, v64, v65, (uint64_t)__s1);
    }
    if (v13)
      sub_10000E6F0(a1);
    goto LABEL_42;
  }
  if (!v10)
  {
LABEL_42:
    v27 = 0;
    goto LABEL_43;
  }
  v38 = sub_100018FF8((uint64_t)a1, (uint64_t)__s1, 0x8000);
  v27 = v38;
  if ((_DWORD)v38)
  {
    strerror(v38);
    sub_100003108(0, (uint64_t)"%s(%s) set bridge member MAC_NAT failed: %s", v45, v46, v47, v48, v49, v50, (uint64_t)__s1);
  }
  else
  {
    sub_100003108(1u, (uint64_t)"%s(%s) set bridge member MAC_NAT", v39, v40, v41, v42, v43, v44, (uint64_t)__s1);
  }
LABEL_43:
  xpc_dictionary_set_BOOL((xpc_object_t)v14[4], a1, value);
  if (!xpc_dictionary_get_count((xpc_object_t)v14[4]))
    sub_100023804();
  sub_10000F150(*((_DWORD *)v14 + 6));
  sub_10000F178(*((_DWORD *)v14 + 7));
  sub_100003108(2u, (uint64_t)"added bridge member %s to bridge %s with mode %s and type %s", v72, v73, v74, v75, v76, v77, (uint64_t)a1);
  if ((_DWORD)v27)
    goto LABEL_12;
  return v27;
}

uint64_t sub_100018F00(char *__s1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v9;
  uint64_t *v10;
  int v11;
  uint64_t *i;

  if (!__s1)
    sub_10002382C();
  if (!*__s1)
    sub_100023854();
  v9 = &qword_1000353E0;
  v10 = &qword_1000353E0;
  do
  {
    v10 = (uint64_t *)*v10;
    if (!v10)
    {
      sub_100003108(0, (uint64_t)"could not destroy interface %s", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 22;
    }
  }
  while (strncmp(__s1, (const char *)v10 + 8, 0x10uLL));
  v11 = *((_DWORD *)v10 + 10) - 1;
  *((_DWORD *)v10 + 10) = v11;
  if (v11)
    sub_1000238A4();
  sub_10000CC20((uint64_t)__s1, -1);
  sub_100018A4C((uint64_t)__s1);
  for (i = (uint64_t *)qword_1000353E0; i != v10; i = (uint64_t *)*i)
    v9 = i;
  *v9 = *v10;
  if (!dword_1000353E8)
    sub_10002387C();
  --dword_1000353E8;
  xpc_release((xpc_object_t)v10[4]);
  free(v10);
  return 0;
}

uint64_t sub_100018FF8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  if ((unint64_t)__strlcpy_chk(&v16, a1, 16, 16) >= 0x10)
  {
    v11 = *__error();
    v12 = "strlcpy: %m";
LABEL_8:
    sub_100003108(0, (uint64_t)v12, v5, v6, v7, v8, v9, v10, v16);
    return v11;
  }
  v13 = socket(2, 2, 0);
  if (v13 < 0)
  {
    v11 = *__error();
    v12 = "socket: %m";
    goto LABEL_8;
  }
  v14 = v13;
  v11 = sub_100019624(a2, v13, 2, (uint64_t)"BRDGGIFFLGS", (uint64_t)&v16, 0);
  if (!(_DWORD)v11)
  {
    LODWORD(v17) = v17 | a3;
    v11 = sub_100019624(a2, v14, 3, (uint64_t)"BRDGSIFFLGS", (uint64_t)&v16, 1);
  }
  close(v14);
  return v11;
}

uint64_t sub_10001912C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  int v12;
  _OWORD v14[5];

  memset(v14, 0, sizeof(v14));
  if ((unint64_t)__strlcpy_chk(v14, a1, 16, 16) >= 0x10)
  {
    v9 = *__error();
    v10 = "strlcpy: %m";
LABEL_6:
    sub_100003108(0, (uint64_t)v10, v3, v4, v5, v6, v7, v8, *(uint64_t *)&v14[0]);
    return v9;
  }
  v11 = socket(2, 2, 0);
  if (v11 < 0)
  {
    v9 = *__error();
    v10 = "socket: %m";
    goto LABEL_6;
  }
  v12 = v11;
  v9 = sub_100019624(a2, v11, 1, (uint64_t)"BRDGDEL", (uint64_t)v14, 1);
  close(v12);
  return v9;
}

uint64_t sub_100019220(char *a1, char *__s1, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v10;
  xpc_object_t value;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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

  if (!a1)
    sub_1000238CC();
  if (!*a1)
    sub_1000238F4();
  if (!__s1)
    sub_10002391C();
  if (!*__s1)
    sub_100023944();
  v10 = &qword_1000353E0;
  do
  {
    v10 = (uint64_t *)*v10;
    if (!v10)
    {
      sub_100003108(0, (uint64_t)"couldn't find bridge %s", a3, a4, a5, a6, a7, a8, (uint64_t)__s1);
      return 0;
    }
  }
  while (strncmp(__s1, (const char *)v10 + 8, 0x10uLL));
  value = xpc_dictionary_get_value((xpc_object_t)v10[4], a1);
  if (!value || (v18 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL))
  {
    sub_100003108(0, (uint64_t)"couldn't find member %s for bridge %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
    return 0;
  }
  sub_100003108(2u, (uint64_t)"found member %s for bridge %s", v12, v13, v14, v15, v16, v17, (uint64_t)a1);
  v21 = xpc_BOOL_get_value(v18);
  xpc_dictionary_set_value((xpc_object_t)v10[4], a1, 0);
  sub_10000E6E8(a1);
  sub_10000E860(a1);
  sub_10000CD84(a1);
  v22 = sub_10001912C((uint64_t)a1, (uint64_t)__s1);
  if (!(_DWORD)v22)
  {
    sub_10000F150(*((_DWORD *)v10 + 6));
    sub_10000F178(*((_DWORD *)v10 + 7));
    sub_100003108(2u, (uint64_t)"removed bridge member %s to bridge %s with mode %s and type %s", v29, v30, v31, v32, v33, v34, (uint64_t)a1);
    sub_10000D1BC(a1, 1, v21, 1);
    return 0;
  }
  v19 = v22;
  if (v21)
    sub_10000D61C(a1, 1);
  sub_100003108(0, (uint64_t)"couldn't delete member %s from bridge %s", v23, v24, v25, v26, v27, v28, (uint64_t)a1);
  return v19;
}

uint64_t sub_1000193C0(char *__str)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!__str)
    sub_10002396C();
  v2 = 0;
  while (1)
  {
    snprintf(__str, 0x10uLL, "%s%d", "bridge", v2 + 100);
    if (!if_nametoindex(__str))
      break;
    if (++v2 == 2147483547)
      return 22;
  }
  sub_100003108(2u, (uint64_t)"creating interface: %s", v3, v4, v5, v6, v7, v8, (uint64_t)__str);
  return 0;
}

uint64_t sub_100019468(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  const char *v17;
  int v18;
  int v19;
  int v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 *v33;

  v8 = socket(2, 2, 0);
  if ((v8 & 0x80000000) == 0)
  {
    v15 = v8;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0;
    if ((unint64_t)__strlcpy_chk(&v31, a1, 16, 16) <= 0xF)
    {
      if ((unint64_t)__strlcpy_chk((char *)&v29 + 4, a2, 16, 16) <= 0xF)
      {
        v18 = v29;
        v19 = v29 | 1;
        LODWORD(v29) = v29 | 1;
        if (a3)
        {
          v20 = *a3;
          WORD4(v30) = *((_WORD *)a3 + 2);
          v19 = v18 | 3;
          DWORD1(v30) = v20;
          LODWORD(v29) = v18 | 3;
        }
        if (a4)
        {
          HIDWORD(v30) = *a4;
          LODWORD(v29) = v19 | 4;
        }
        v32 = xmmword_100025170;
        v33 = &v29;
        v16 = 1;
        if ((ioctl(v15, 0x8028697BuLL, &v31) & 0x80000000) == 0)
          goto LABEL_14;
        v17 = "%s: failed to set host filter: %s";
      }
      else
      {
        v16 = 0;
        v17 = "%s: member if name is too long: %s";
      }
    }
    else
    {
      v16 = 0;
      v17 = "%s: bridge if name is too long: %s";
    }
    v21 = __error();
    strerror(*v21);
    sub_100003108(0, (uint64_t)v17, v22, v23, v24, v25, v26, v27, (uint64_t)"mis_set_host_filter");
LABEL_14:
    close(v15);
    return v16;
  }
  sub_100003108(0, (uint64_t)"%s: failed to create socket", v9, v10, v11, v12, v13, v14, (uint64_t)"mis_set_host_filter");
  return 0;
}

uint64_t sub_100019624(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = 0;
  v35 = 0u;
  v36 = 0u;
  if ((unint64_t)__strlcpy_chk(&v35, a1, 16, 16) < 0x10)
  {
    *(_QWORD *)&v36 = a3;
    *((_QWORD *)&v36 + 1) = 80;
    v37 = a5;
    if (a6)
      v19 = ioctl(a2, 0x8028697BuLL, &v35);
    else
      v19 = ioctl(a2, 0xC028697BuLL, &v35);
    if (v19 < 0)
    {
      v26 = __error();
      v12 = *v26;
      strerror(*v26);
      sub_100003108(0, (uint64_t)"ioctl(%s, %s, %s) %s: failed %s", v27, v28, v29, v30, v31, v32, a1);
    }
    else
    {
      sub_100003108(2u, (uint64_t)"ioctl(%s, %s, %s) %s: success", v20, v21, v22, v23, v24, v25, a1);
      return 0;
    }
  }
  else
  {
    v11 = __error();
    v12 = *v11;
    v34 = strerror(*v11);
    sub_100003108(0, (uint64_t)"strlcpy: %s", v13, v14, v15, v16, v17, v18, (uint64_t)v34);
  }
  return v12;
}

void sub_1000197A0()
{
  __int16 v0;
  BOOL v1;

  v0 = word_100035468;
  if ((unsigned __int16)word_100035468 <= (unsigned __int16)word_10003546A)
  {
    if (word_100035468)
      v1 = 1;
    else
      v1 = word_10003546A == 0;
    if (!v1)
      word_100035468 = word_10003546A;
  }
  else
  {
    if (word_10003546A)
      word_100035468 = word_10003546A;
    word_10003546A = v0;
  }
}

void sub_1000197E4()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  const __CFString *Domain;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFErrorRef err;
  char buffer[256];

  err = 0;
  v0 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0);
  if (v0)
  {
    v1 = v0;
    PFUserDeleteRules(v0, 0, 0);
    PFUserRelease(v1, 0);
    v2 = PFUserCreate(kPFInternetSharing, kPFBase_v4, qword_100035470, 0);
    if (v2)
    {
      v3 = v2;
      PFUserDeleteRules(v2, 0, 0);
      PFUserRelease(v3, 0);
      v4 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0);
      if (v4)
      {
        v5 = v4;
        PFUserDeleteRules(v4, 0, 0);
        PFUserRelease(v5, 0);
        v6 = PFUserCreate(kPFInternetSharing, kPFBase_nat66, qword_100035470, 0);
        if (v6)
        {
          v7 = v6;
          PFUserDeleteRules(v6, 0, 0);
          PFUserRelease(v7, 0);
          v8 = PFUserCreate(kPFInternetSharing, kPFShared_v4, qword_100035470, 0);
          if (v8)
          {
            v9 = v8;
            PFUserDeleteRules(v8, 0, 0);
            PFUserRelease(v9, 0);
            v10 = PFUserCreate(kPFInternetSharing, kPFShared_v6, qword_100035470, 0);
            if (v10)
            {
              v11 = v10;
              PFUserDeleteRules(v10, 0, 0);
              PFUserRelease(v11, 0);
              v12 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0);
              if (v12)
              {
                v13 = v12;
                PFUserDeleteRules(v12, 0, 0);
                PFUserRelease(v13, 0);
                v14 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0);
                if (v14)
                {
                  v15 = v14;
                  PFUserDeleteRules(v14, 0, 0);
                  PFUserRelease(v15, 0);
                }
              }
            }
          }
        }
      }
    }
  }
  if (!access("/usr/libexec/ftp-proxy", 0))
  {
    if (SMJobSetEnabled(kSMDomainSystemLaunchd, 0, CFSTR("com.apple.ftp-proxy-embedded"), 1, 1, &err))v16 = 1;
    else
      v16 = err == 0;
    if (v16)
    {
      byte_1000353F0 = 1;
    }
    else
    {
      Domain = CFErrorGetDomain(err);
      if (Domain)
      {
        CFStringGetCString(Domain, buffer, 256, 0x600u);
        CFErrorGetCode(err);
        sub_100003108(0, (uint64_t)"\"%s\" enabling job error %s(%ld)", v18, v19, v20, v21, v22, v23, (uint64_t)"ftp-proxy");
      }
      CFRelease(err);
    }
  }
  byte_1000353F4 = 1;
}

void sub_100019AE4()
{
  const __CFString *Domain;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFErrorRef err;
  char buffer[256];

  if (byte_1000353F4 == 1)
  {
    if (byte_1000353F0 == 1)
    {
      err = 0;
      if (!SMJobSetEnabled(kSMDomainSystemLaunchd, 0, CFSTR("com.apple.ftp-proxy-embedded"), 0, 1, &err)&& err != 0)
      {
        Domain = CFErrorGetDomain(err);
        if (Domain)
        {
          CFStringGetCString(Domain, buffer, 256, 0x600u);
          CFErrorGetCode(err);
          sub_100003108(0, (uint64_t)"\"%s\" disabling job error %s(%ld)", v2, v3, v4, v5, v6, v7, (uint64_t)"ftp-proxy");
        }
        CFRelease(err);
      }
    }
    byte_1000353F4 = 0;
  }
}

uint64_t *sub_100019BE8(char *__s1, _DWORD *a2, _DWORD *a3, int a4)
{
  uint64_t *v8;
  int v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;

  v8 = &qword_1000353F8;
  while (1)
  {
    v8 = (uint64_t *)*v8;
    if (!v8)
      return v8;
    if (!strncmp(__s1, (const char *)v8 + 20, 0x10uLL))
    {
      v9 = *((unsigned __int8 *)v8 + 344);
      if (*((_BYTE *)v8 + 344))
      {
        if (a4)
          goto LABEL_6;
      }
      else
      {
        if (!*a2)
          return 0;
        *((_DWORD *)v8 + 13) = *a2;
        *((_DWORD *)v8 + 14) = *a3;
        if (a4)
LABEL_6:
          *((_DWORD *)v8 + 4) = a4;
      }
      if (v9)
        v10 = &kPFShared_v4;
      else
        v10 = &kPFBase_v4;
      v11 = PFUserCreate(kPFInternetSharing, *v10, qword_100035470, 0);
      if (!v11)
        return (uint64_t *)12;
      v12 = v11;
      if (*((_BYTE *)v8 + 344))
        v13 = dword_1000354B8 == 0;
      else
        v13 = 0;
      if (v13)
      {
        PFUserDeleteRules(v11, 0, 0);
        v8 = 0;
      }
      else
      {
        v8 = (uint64_t *)sub_100019D80((uint64_t)v8, v11);
      }
      PFUserRelease(v12, 0);
      return v8;
    }
  }
}

uint64_t *sub_100019D18(char *__s1, int a2)
{
  uint64_t *v4;
  int v5;

  v4 = &qword_1000353F8;
  while (1)
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
      break;
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2)
      {
        v5 = *((_DWORD *)v4 + 87);
        *((_DWORD *)v4 + 87) = v5 + 1;
        if (v5 == -1)
          sub_100023994();
      }
      return v4;
    }
  }
  return v4;
}

uint64_t sub_100019D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  unsigned int v10;
  uint64_t k;
  unsigned int v12;
  int v13;
  int v14;
  char v15;
  unsigned int v16;
  int v17;
  int v18;
  char v19;
  unsigned int v20;
  xpc_object_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  xpc_object_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  xpc_object_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  int v46;
  int v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  xpc_object_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  xpc_object_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  xpc_object_t v73;
  void *v74;
  unsigned int v75;
  int v76;
  const char *v77;
  int v78;
  void *v79;
  int v80;
  char v81;
  xpc_object_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  unsigned int v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  uint64_t i;
  const char *v107;
  uint64_t j;
  uint64_t v110;
  int v111;
  int v112;
  char v113[16];
  char string[16];
  char __str[16];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;

  v4 = PFUserBeginRules(a2);
  if (*(_BYTE *)(a1 + 344))
  {
    v5 = qword_1000354A8;
    if (qword_1000354A8)
    {
      while (1)
      {
        if (*(_BYTE *)(v5 + 41))
        {
          v6 = sub_10001D3E4((const char *)(v5 + 8), 0, 0, a2, v4);
          if ((_DWORD)v6)
            break;
        }
        v5 = *(_QWORD *)v5;
        if (!v5)
          goto LABEL_8;
      }
LABEL_98:
      v7 = v6;
      goto LABEL_99;
    }
  }
  else
  {
    v7 = sub_10001D3E4((const char *)(a1 + 20), 0, 0, a2, v4);
    if ((_DWORD)v7)
      goto LABEL_99;
  }
LABEL_8:
  v8 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_72:
    v95 = (unsigned __int16)word_100035468;
    v96 = (unsigned __int16)word_10003546A;
    v97 = *(unsigned __int8 *)(a1 + 344);
    if ((unsigned __int16)word_100035468 | (unsigned __int16)word_10003546A)
    {
      if (*(_BYTE *)(a1 + 344))
        sub_100023A0C();
      v98 = 0;
      v99 = qword_1000353F8;
      do
      {
        if (!v99)
          break;
        if (!*(_DWORD *)(v99 + 8) && !strncmp((const char *)(v99 + 36), (const char *)(a1 + 20), 0x100uLL))
          v98 = v99;
        v99 = *(_QWORD *)v99;
      }
      while (v99);
      if (!v98)
        sub_1000239BC();
      v101 = *(_DWORD *)(v98 + 52);
      v100 = *(_DWORD *)(v98 + 56);
      v102 = v100 & v101;
      v103 = bswap32(v101);
      v104 = bswap32(v100 & v101);
      if (v103 != v104 + 1)
        sub_1000239E4();
      v105 = bswap32(v104 + 2);
      v7 = sub_10001D8BC((const char *)(v98 + 20), (const char *)(a1 + 20), v102, v100, 6u, v95, v96, v95, v96, SHIDWORD(v110), v105, a2, v4);
      if ((_DWORD)v7)
        goto LABEL_99;
      v7 = sub_10001D8BC((const char *)(v98 + 20), (const char *)(a1 + 20), v102, *(_DWORD *)(v98 + 56), 0x11u, (unsigned __int16)word_100035468, (unsigned __int16)word_10003546A, (unsigned __int16)word_100035468, word_10003546A, v111, v105, a2, v4);
      if ((_DWORD)v7)
        goto LABEL_99;
      v97 = *(unsigned __int8 *)(a1 + 344);
    }
    if (v97)
    {
      for (i = qword_1000354A8; i; i = *(_QWORD *)i)
      {
        if (*(_BYTE *)(i + 41))
        {
          v6 = sub_10001DD00((const char *)(i + 8), a2, v4, 2u);
          if ((_DWORD)v6)
            goto LABEL_98;
        }
      }
    }
    else
    {
      v107 = (const char *)(a1 + 20);
      v7 = sub_10001DD00(v107, a2, v4, 2u);
      if ((_DWORD)v7)
        goto LABEL_99;
      for (j = qword_1000353F8; j; j = *(_QWORD *)j)
      {
        if (!*(_DWORD *)(j + 8) && !strncmp((const char *)(j + 36), v107, 0x100uLL))
        {
          v6 = sub_10001DFCC(v107, (const char *)(j + 20), a2, v4);
          if ((_DWORD)v6)
            goto LABEL_98;
        }
      }
    }
    PFUserCommitRules(a2, v4, 0, 0);
    return 0;
  }
  v9 = (const char *)(a1 + 20);
  while (1)
  {
    if (*(_DWORD *)(v8 + 8) || strncmp((const char *)(v8 + 36), v9, 0x100uLL))
      goto LABEL_71;
    if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v8 + 16))
      v10 = *(_DWORD *)(v8 + 16);
    else
      v10 = *(_DWORD *)(a1 + 16);
    v6 = sub_10001D3E4((const char *)(v8 + 20), 0, v10, a2, v4);
    if ((_DWORD)v6)
      goto LABEL_98;
    v6 = sub_10001D3E4((const char *)(v8 + 20), 0x32u, 0, a2, v4);
    if ((_DWORD)v6)
      goto LABEL_98;
    inet_ntop(2, (const void *)(v8 + 52), v113, 0x10u);
    if (*(_BYTE *)(a1 + 344))
    {
      for (k = qword_1000354A8; k; k = *(_QWORD *)k)
      {
        if (*(_BYTE *)(k + 41))
        {
          v12 = bswap32(*(_DWORD *)(v8 + 56));
          if ((v12 & 0x80000000) != 0)
          {
            v14 = 0;
            do
              v15 = v14-- + 30;
            while (((v12 >> v15) & 1) != 0);
            v13 = -v14;
          }
          else
          {
            v13 = 0;
          }
          v6 = sub_10001D55C((const char *)(k + 8), 2u, v113, v13, a2, v4);
          if ((_DWORD)v6)
            goto LABEL_98;
          v6 = sub_10001D834((const char *)(k + 8), 2, a2, v4);
          if ((_DWORD)v6)
            goto LABEL_98;
        }
      }
    }
    else
    {
      v16 = bswap32(*(_DWORD *)(v8 + 56));
      if ((v16 & 0x80000000) != 0)
      {
        v18 = 0;
        do
          v19 = v18-- + 30;
        while (((v16 >> v19) & 1) != 0);
        v17 = -v18;
      }
      else
      {
        v17 = 0;
      }
      v6 = sub_10001D55C(v9, 2u, v113, v17, a2, v4);
      if ((_DWORD)v6)
        goto LABEL_98;
    }
    v20 = *(_DWORD *)(v8 + 56);
    v112 = *(_DWORD *)(v8 + 52);
    v21 = xpc_dictionary_create(0, 0, 0);
    if (!v21)
    {
      sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v22, v23, v24, v25, v26, v27, v110);
LABEL_105:
      v7 = 12;
      goto LABEL_99;
    }
    v28 = v21;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    *(_OWORD *)__str = 0u;
    v116 = 0u;
    xpc_dictionary_set_uint64(v21, kPFAction, 5uLL);
    xpc_dictionary_set_string(v28, kPFInterface, (const char *)(v8 + 20));
    xpc_dictionary_set_uint64(v28, kPFFamily, 2uLL);
    v29 = xpc_dictionary_create(0, 0, 0);
    if (!v29)
    {
      sub_100003108(0, (uint64_t)"unable to create src address xpc dictionary", v30, v31, v32, v33, v34, v35, v110);
LABEL_104:
      xpc_release(v28);
      goto LABEL_105;
    }
    v36 = v29;
    inet_ntop(2, &v112, string, 0x10u);
    xpc_dictionary_set_string(v36, kPFSubAddress, string);
    v37 = xpc_dictionary_create(0, 0, 0);
    if (!v37)
    {
      sub_100003108(0, (uint64_t)"unable to create dst address xpc dictionary", v38, v39, v40, v41, v42, v43, v110);
      xpc_release(v36);
      goto LABEL_104;
    }
    v44 = v37;
    v45 = bswap32(v20);
    if ((v45 & 0x80000000) != 0)
    {
      v47 = 0;
      do
        v48 = v47-- + 30;
      while (((v45 >> v48) & 1) != 0);
      v46 = -v47;
    }
    else
    {
      v46 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", string, v46);
    xpc_dictionary_set_string(v44, kPFSubAddress, __str);
    xpc_dictionary_set_value(v28, kPFFrom, v36);
    xpc_dictionary_set_value(v28, kPFTo, v44);
    v55 = sub_10001E118(a2, v4, v28);
    if ((v55 & 1) != 0)
    {
      v7 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v49, v50, v51, v52, v53, v54, (uint64_t)"mis_pf_configure_nonat");
      v7 = 22;
    }
    xpc_release(v36);
    xpc_release(v44);
    xpc_release(v28);
    if (!v55)
      goto LABEL_99;
    if (byte_1000353F0 == 1 && !*(_BYTE *)(a1 + 344))
      break;
LABEL_70:
    v9 = (const char *)(a1 + 20);
LABEL_71:
    v8 = *(_QWORD *)v8;
    if (!v8)
      goto LABEL_72;
  }
  v56 = *(_DWORD *)(v8 + 56);
  v112 = *(_DWORD *)(v8 + 52);
  v57 = xpc_dictionary_create(0, 0, 0);
  if (v57)
  {
    v64 = v57;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    *(_OWORD *)__str = 0u;
    v116 = 0u;
    xpc_dictionary_set_string(v57, kPFSubAddress, "127.0.0.1");
    xpc_dictionary_set_uint64(v64, kPFSubLowPort, 0x1F55uLL);
    xpc_dictionary_set_uint64(v64, kPFSubPortOperator, 0);
    v65 = xpc_dictionary_create(0, 0, 0);
    v72 = v65;
    if (v65)
    {
      xpc_dictionary_set_uint64(v65, kPFAction, 8uLL);
      xpc_dictionary_set_uint64(v72, kPFProtocol, 6uLL);
      xpc_dictionary_set_string(v72, kPFInterface, (const char *)(v8 + 20));
      xpc_dictionary_set_uint64(v72, kPFFamily, 2uLL);
      v73 = xpc_dictionary_create(0, 0, 0);
      if (v73)
      {
        v74 = v73;
        inet_ntop(2, &v112, string, 0x10u);
        v75 = bswap32(v56);
        if ((v75 & 0x80000000) != 0)
        {
          v80 = 0;
          do
            v81 = v80-- + 30;
          while (((v75 >> v81) & 1) != 0);
          v76 = -v80;
        }
        else
        {
          v76 = 0;
        }
        snprintf(__str, 0x100uLL, "%s/%d", string, v76);
        xpc_dictionary_set_string(v74, kPFSubAddress, __str);
        v82 = xpc_dictionary_create(0, 0, 0);
        v79 = v82;
        if (v82)
        {
          xpc_dictionary_set_string(v82, kPFSubAddressLabel, kPFAny);
          xpc_dictionary_set_uint64(v79, kPFSubLowPort, 0x15uLL);
          xpc_dictionary_set_uint64(v79, kPFSubPortOperator, 2uLL);
          xpc_dictionary_set_value(v72, kPFFrom, v74);
          xpc_dictionary_set_value(v72, kPFTo, v79);
          xpc_dictionary_set_value(v72, kPFNATRDRAddress, v64);
          if ((sub_10001E118(a2, v4, v72) & 1) != 0)
          {
            v78 = 0;
          }
          else
          {
            sub_100003108(0, (uint64_t)"%s: unable to add rule", v89, v90, v91, v92, v93, v94, (uint64_t)"mis_pf_configure_ftp_proxy");
            v78 = 22;
          }
        }
        else
        {
          sub_100003108(0, (uint64_t)"unable to create dst xpc dictionary", v83, v84, v85, v86, v87, v88, v110);
          v78 = 12;
        }
        xpc_release(v64);
        xpc_release(v74);
        if (!v79)
        {
LABEL_67:
          if (v72)
            xpc_release(v72);
          if (v78)
            goto LABEL_107;
          goto LABEL_70;
        }
LABEL_66:
        xpc_release(v79);
        goto LABEL_67;
      }
      v77 = "unable to create src address xpc dictionary";
    }
    else
    {
      v77 = "unable to create rule xpc dictionary";
    }
    sub_100003108(0, (uint64_t)v77, v66, v67, v68, v69, v70, v71, v110);
    v78 = 12;
    v79 = v64;
    goto LABEL_66;
  }
  sub_100003108(0, (uint64_t)"unable to create rdr xpc dictionary", v58, v59, v60, v61, v62, v63, v110);
LABEL_107:
  v7 = 1;
LABEL_99:
  PFUserClearRules(a2, v4);
  return v7;
}

uint64_t *sub_10001A6F8(char *__s1, int a2)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = &qword_1000353F8;
  while (1)
  {
    v4 = (uint64_t *)*v4;
    if (!v4)
      break;
    if (!strncmp(__s1, (const char *)v4 + 20, 0x10uLL))
    {
      if (a2)
        *((_DWORD *)v4 + 4) = a2;
      if (*((_BYTE *)v4 + 344))
        v5 = &kPFShared_v6;
      else
        v5 = &kPFBase_nat66;
      v6 = PFUserCreate(kPFInternetSharing, *v5, qword_100035470, 0);
      if (!v6)
        return (uint64_t *)12;
      v7 = v6;
      if (*((_BYTE *)v4 + 344))
        v8 = dword_1000354BC == 0;
      else
        v8 = 0;
      if (v8)
      {
        PFUserDeleteRules(v6, 0, 0);
        v4 = 0;
      }
      else
      {
        v4 = (uint64_t *)sub_10001A7F0((uint64_t)v4, v6);
      }
      PFUserRelease(v7, 0);
      return v4;
    }
  }
  return v4;
}

uint64_t sub_10001A7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t i;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  const char *v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t j;
  const char *v16;
  const char *k;
  const char *v19;

  if (*(_BYTE *)(a1 + 281))
    return 45;
  v5 = PFUserBeginRules(a2);
  v6 = &qword_1000354B0;
  if (*(_BYTE *)(a1 + 344))
  {
    for (i = qword_1000354B0; i; i = *(_QWORD *)i)
    {
      if (*(_BYTE *)(i + 41))
      {
        v8 = sub_10001D3E4((const char *)(i + 8), 0, 0, a2, v5);
        if ((_DWORD)v8)
          goto LABEL_32;
      }
    }
  }
  else
  {
    v2 = sub_10001D3E4((const char *)(a1 + 20), 0, 0, a2, v5);
    if ((_DWORD)v2)
      goto LABEL_40;
  }
  v9 = &byte_100034F58[168];
  v10 = qword_1000353F8;
  if (qword_1000353F8)
  {
    v11 = (const char *)(a1 + 20);
    do
    {
      if (!*(_DWORD *)(v10 + 8)
        && !*(_BYTE *)(v10 + 281)
        && *(_BYTE *)(v10 + 328)
        && !strncmp((const char *)(v10 + 36), v11, 0x100uLL))
      {
        if (*(_DWORD *)(a1 + 16) >= *(_DWORD *)(v10 + 16))
          v12 = *(_DWORD *)(v10 + 16);
        else
          v12 = *(_DWORD *)(a1 + 16);
        v8 = sub_10001D3E4((const char *)(v10 + 20), 0, v12, a2, v5);
        if ((_DWORD)v8)
          goto LABEL_32;
        v8 = sub_10001D3E4((const char *)(v10 + 20), 0x32u, 0, a2, v5);
        if ((_DWORD)v8)
          goto LABEL_32;
        v19 = v11;
        if (*(_BYTE *)(a1 + 344))
        {
          v13 = v6;
          v14 = *v6;
          if (*v6)
          {
            while (1)
            {
              if (*(_BYTE *)(v14 + 41))
              {
                v8 = sub_10001D55C((const char *)(v14 + 8), 0x1Eu, (const char *)(v10 + 282), *(unsigned __int8 *)(v10 + 328), a2, v5);
                if ((_DWORD)v8)
                  break;
                v8 = sub_10001D834((const char *)(v14 + 8), 30, a2, v5);
                if ((_DWORD)v8)
                  break;
              }
              v14 = *(_QWORD *)v14;
              if (!v14)
                goto LABEL_31;
            }
LABEL_32:
            v2 = v8;
LABEL_40:
            PFUserClearRules(a2, v5);
            return v2;
          }
        }
        else
        {
          v13 = v6;
          v8 = sub_10001D55C(v11, 0x1Eu, (const char *)(v10 + 282), *(unsigned __int8 *)(v10 + 328), a2, v5);
          if ((_DWORD)v8)
            goto LABEL_32;
        }
LABEL_31:
        v8 = sub_10001E578((const char *)(v10 + 20), a2, v5, 1u);
        v6 = v13;
        v9 = byte_100034F58 + 168;
        v11 = v19;
        if ((_DWORD)v8)
          goto LABEL_32;
      }
      v10 = *(_QWORD *)v10;
    }
    while (v10);
  }
  if (*(_BYTE *)(a1 + 344))
  {
    for (j = *v6; j; j = *(_QWORD *)j)
    {
      if (*(_BYTE *)(j + 41))
      {
        v8 = sub_10001DD00((const char *)(j + 8), a2, v5, 0x1Eu);
        if ((_DWORD)v8)
          goto LABEL_32;
      }
    }
  }
  else
  {
    v16 = (const char *)(a1 + 20);
    v2 = sub_10001DD00(v16, a2, v5, 0x1Eu);
    if ((_DWORD)v2)
      goto LABEL_40;
    for (k = (const char *)*((_QWORD *)v9 + 127); k; k = *(const char **)k)
    {
      if (!*((_DWORD *)k + 2) && !strncmp(k + 36, v16, 0x100uLL))
      {
        v8 = sub_10001DFCC(v16, k + 20, a2, v5);
        if ((_DWORD)v8)
          goto LABEL_32;
      }
    }
  }
  PFUserCommitRules(a2, v5, 0, 0);
  return 0;
}

uint64_t sub_10001AAD4(char *__s1, uint64_t a2, char a3)
{
  uint64_t *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = &qword_1000353F8;
  do
  {
    v6 = (uint64_t *)*v6;
    if (!v6)
      return 22;
  }
  while (strncmp(__s1, (const char *)v6 + 20, 0x10uLL));
  if (*((_BYTE *)v6 + 344))
    sub_100023A34();
  if (!*(_BYTE *)a2)
    return 0;
  *((_OWORD *)v6 + 5) = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v6 + 8) = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v6 + 9) = v9;
  *((_OWORD *)v6 + 6) = v7;
  *((_OWORD *)v6 + 7) = v8;
  v10 = *(_OWORD *)(a2 + 80);
  v11 = *(_OWORD *)(a2 + 96);
  v12 = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v6 + 12) = *(_OWORD *)(a2 + 112);
  *((_OWORD *)v6 + 13) = v12;
  *((_OWORD *)v6 + 10) = v10;
  *((_OWORD *)v6 + 11) = v11;
  v13 = *(_OWORD *)(a2 + 144);
  v14 = *(_OWORD *)(a2 + 160);
  v15 = *(_OWORD *)(a2 + 176);
  v6[34] = *(_QWORD *)(a2 + 192);
  *((_OWORD *)v6 + 15) = v14;
  *((_OWORD *)v6 + 16) = v15;
  *((_OWORD *)v6 + 14) = v13;
  *((_BYTE *)v6 + 280) = a3;
  v16 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0);
  if (!v16)
    return 12;
  v17 = v16;
  v18 = sub_10001ABE8((uint64_t)v6, v16);
  PFUserRelease(v17, 0);
  return v18;
}

uint64_t sub_10001ABE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;

  v4 = PFUserBeginRules(a2);
  v5 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_11:
    PFUserCommitRules(a2, v4, 0, 0);
    return 0;
  }
  while (1)
  {
    if (*(_DWORD *)(v5 + 8) || strncmp((const char *)(v5 + 36), (const char *)(a1 + 20), 0x100uLL))
      goto LABEL_10;
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
    {
      sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v7, v8, v9, v10, v11, v12, v31);
      v29 = 12;
      goto LABEL_17;
    }
    v13 = v6;
    v14 = xpc_dictionary_create(0, 0, 0);
    if (!v14)
    {
      sub_100003108(0, (uint64_t)"unable to create return option xpc dictionary", v15, v16, v17, v18, v19, v20, v31);
      v29 = 12;
      goto LABEL_16;
    }
    v21 = v14;
    xpc_dictionary_set_uint64(v13, kPFAction, 1uLL);
    xpc_dictionary_set_uint64(v13, kPFDirection, 1uLL);
    xpc_dictionary_set_string(v13, kPFInterface, (const char *)(v5 + 20));
    xpc_dictionary_set_uint64(v13, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v21, kPFSubReturnType, 8uLL);
    xpc_dictionary_set_value(v13, kPFReturnOptions, v21);
    xpc_release(v21);
    if ((sub_10001E118(a2, v4, v13) & 1) == 0)
      break;
    xpc_release(v13);
    if (*(_BYTE *)(a1 + 280)
      && (v28 = sub_10001E7D4(a1, (const char *)(v5 + 20), a2, v4, 1, 1u, (const void *)(a1 + 96), *(unsigned __int8 *)(a1 + 117)), (_DWORD)v28)|| (v28 = sub_10001E578((const char *)(v5 + 20), a2, v4, 1u), (_DWORD)v28))
    {
      v29 = v28;
      goto LABEL_17;
    }
LABEL_10:
    v5 = *(_QWORD *)v5;
    if (!v5)
      goto LABEL_11;
  }
  sub_100003108(0, (uint64_t)"%s: unable to add rule", v22, v23, v24, v25, v26, v27, (uint64_t)"mis_pf_configure_block_ip6");
  v29 = 22;
LABEL_16:
  xpc_release(v13);
LABEL_17:
  PFUserClearRules(a2, v4);
  return v29;
}

uint64_t sub_10001AE28(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  const char *v13;
  void *v14;
  size_t count;
  unint64_t v16;
  const char *string;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  const char *v25;
  uint64_t v26;
  xpc_object_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;

  if (a1[36])
    v1 = a1[36];
  else
    v1 = a1[35];
  if (*(_DWORD *)(a1[35] + 288) == 101)
    return 0;
  v3 = sub_100019D18((char *)(a1[37] + 308), 1);
  if (!v3)
  {
    v4 = (uint64_t *)sub_10001B398(a1[37], byte_100025230);
    if (!v4)
    {
      sub_100003108(0, (uint64_t)"pf clone failed for %s", v5, v6, v7, v8, v9, v10, a1[37] + 308);
      return 0xFFFFFFFFLL;
    }
    v3 = v4;
    *v4 = qword_1000353F8;
    qword_1000353F8 = (uint64_t)v4;
  }
  v11 = sub_100019D18((char *)(v1 + 308), 1);
  if (!v11)
  {
    v27 = (xpc_object_t *)sub_10001B398(v1, (const char *)v3 + 20);
    if (!v27)
    {
      sub_100003108(0, (uint64_t)"pf clone failed for %s", v28, v29, v30, v31, v32, v33, v1 + 308);
LABEL_29:
      sub_10001B5A4(v3);
      return 0xFFFFFFFFLL;
    }
    v34 = (char *)v27;
    *v27 = (xpc_object_t)qword_1000353F8;
    qword_1000353F8 = (uint64_t)v27;
    if (*((_DWORD *)v27 + 3) == 104)
      xpc_array_set_string(v27[42], 0xFFFFFFFFFFFFFFFFLL, (const char *)(a1[35] + 308));
    if (*((_BYTE *)v3 + 352))
    {
      if (*((_DWORD *)v3 + 13))
      {
        v35 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0);
        if (v35)
        {
          v36 = sub_10001B61C((uint64_t)v3, v35);
          if ((_DWORD)v36)
          {
            v26 = v36;
          }
          else
          {
            v26 = sub_100014960((char *)v3 + 20, v34 + 20);
            if (!(_DWORD)v26)
              goto LABEL_91;
          }
          v39 = 0;
          v37 = 0;
          goto LABEL_77;
        }
        v39 = 0;
        v37 = 0;
        goto LABEL_76;
      }
      sub_100003108(0, (uint64_t)"no IPv4 address found for %s", v28, v29, v30, v31, v32, v33, (uint64_t)v3 + 20);
      v35 = 0;
      v39 = 0;
      v37 = 0;
      v26 = 49;
LABEL_77:
      sub_10001B5A4((uint64_t *)v34);
      sub_10001B5A4(v3);
      if (!v37)
      {
        if (!v39)
        {
          if (!v35)
            return v26;
          goto LABEL_90;
        }
        goto LABEL_84;
      }
      PFUserDeleteRules(v37, 0, 0);
      v54 = 0;
      goto LABEL_79;
    }
    if (*(_DWORD *)(a1[35] + 288) == 103)
    {
      v37 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0);
      if (v37)
      {
        v38 = sub_10001B894((uint64_t)v3, v37);
        if (!(_DWORD)v38)
        {
          v39 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0);
          if (v39)
          {
            v40 = sub_10001C218((uint64_t)v3, v39);
            if (!(_DWORD)v40)
              goto LABEL_69;
            goto LABEL_63;
          }
LABEL_75:
          v35 = 0;
          goto LABEL_76;
        }
LABEL_47:
        v26 = v38;
        v35 = 0;
        v39 = 0;
        goto LABEL_77;
      }
LABEL_49:
      v35 = 0;
      v39 = 0;
LABEL_76:
      v26 = 12;
      goto LABEL_77;
    }
    v41 = *((unsigned __int8 *)v3 + 344);
    if (!*((_DWORD *)v3 + 13))
    {
      v37 = 0;
      if (!*((_BYTE *)v3 + 344) || !dword_1000354B8)
        goto LABEL_52;
      v41 = 1;
    }
    if (v41)
      v42 = &kPFShared_v4;
    else
      v42 = &kPFBase_v4;
    v37 = PFUserCreate(kPFInternetSharing, *v42, qword_100035470, 0);
    if (!v37)
      goto LABEL_49;
    v38 = sub_100019D80((uint64_t)v3, v37);
    if ((_DWORD)v38)
      goto LABEL_47;
LABEL_52:
    if (v34[328])
    {
      if (*((_BYTE *)v3 + 344))
        v43 = &kPFShared_v6;
      else
        v43 = &kPFBase_nat66;
      v44 = PFUserCreate(kPFInternetSharing, *v43, qword_100035470, 0);
      v39 = v44;
      if (v44)
      {
        v40 = sub_10001A7F0((uint64_t)v3, v44);
        if (!(_DWORD)v40)
        {
LABEL_69:
          v26 = sub_100014960((char *)v3 + 20, v34 + 20);
          if (!(_DWORD)v26)
          {
            v35 = 0;
            v54 = 1;
            if (!v37)
            {
LABEL_80:
              if (!v39)
                goto LABEL_86;
              if ((v54 & 1) != 0)
              {
                v54 = 1;
LABEL_85:
                PFUserRelease(v39, 0);
LABEL_86:
                if (!v35)
                  return v26;
                if ((v54 & 1) != 0)
                {
LABEL_91:
                  PFUserRelease(v35, 0);
                  return v26;
                }
LABEL_90:
                PFUserDeleteRules(v35, 0, 0);
                goto LABEL_91;
              }
LABEL_84:
              PFUserDeleteRules(v39, 0, 0);
              v54 = 0;
              goto LABEL_85;
            }
LABEL_79:
            PFUserRelease(v37, 0);
            goto LABEL_80;
          }
          goto LABEL_70;
        }
LABEL_63:
        v26 = v40;
LABEL_70:
        v35 = 0;
        goto LABEL_77;
      }
      if (*((_BYTE *)v3 + 344))
        v52 = (uint64_t *)&kPFShared_v6;
      else
        v52 = (uint64_t *)&kPFBase_nat66;
      v53 = *v52;
    }
    else
    {
      if (!*((_BYTE *)v3 + 80))
      {
        v39 = 0;
        goto LABEL_69;
      }
      if (*((_BYTE *)v3 + 344))
        sub_100023A5C();
      v51 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0);
      v39 = v51;
      if (v51)
      {
        v40 = sub_10001ABE8((uint64_t)v3, v51);
        if (!(_DWORD)v40)
          goto LABEL_69;
        goto LABEL_63;
      }
      v53 = kPFBase_v6;
    }
    sub_100003108(0, (uint64_t)"pf user failed for anchor %s", v45, v46, v47, v48, v49, v50, v53);
    goto LABEL_75;
  }
  if (*(_DWORD *)(v1 + 288) != 104)
    sub_100023A84();
  v12 = v11;
  v13 = (const char *)(a1[35] + 308);
  v14 = (void *)v11[42];
  count = xpc_array_get_count(v14);
  if (count)
  {
    v16 = count;
    string = xpc_array_get_string(v14, 0);
    if (strcmp(string, v13))
    {
      v24 = 1;
      while (v16 != v24)
      {
        v25 = xpc_array_get_string(v14, v24++);
        if (!strcmp(v25, v13))
        {
          if (v24 - 1 >= v16)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      goto LABEL_17;
    }
LABEL_16:
    sub_100003108(0, (uint64_t)"pf rules already present for %s", v18, v19, v20, v21, v22, v23, (uint64_t)v13);
    sub_10001B5A4(v12);
    goto LABEL_29;
  }
LABEL_17:
  xpc_array_set_string((xpc_object_t)v12[42], 0xFFFFFFFFFFFFFFFFLL, v13);
  return 0;
}

_OWORD *sub_10001B398(uint64_t a1, const char *a2)
{
  _OWORD *v4;
  _OWORD *v5;
  int v6;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
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
  uint64_t v29;

  v4 = malloc_type_malloc(0x190uLL, 0x10A0040374E5239uLL);
  v5 = v4;
  if (v4)
  {
    v4[23] = 0u;
    v4[24] = 0u;
    v4[21] = 0u;
    v4[22] = 0u;
    v4[19] = 0u;
    v4[20] = 0u;
    v4[17] = 0u;
    v4[18] = 0u;
    v4[15] = 0u;
    v4[16] = 0u;
    v4[13] = 0u;
    v4[14] = 0u;
    v4[11] = 0u;
    v4[12] = 0u;
    v4[9] = 0u;
    v4[10] = 0u;
    v4[7] = 0u;
    v4[8] = 0u;
    v4[5] = 0u;
    v4[6] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    *v4 = 0u;
    v6 = *(_DWORD *)(a1 + 16);
    if (!v6)
    {
      if (*(_DWORD *)(a1 + 288) == 104)
      {
        v7 = xpc_array_create(0, 0);
        *((_QWORD *)v5 + 42) = v7;
        if (!v7)
        {
          sub_100003108(0, (uint64_t)"xpc_array_create() failed in pf clone", v8, v9, v10, v11, v12, v13, v29);
          free(v5);
          return 0;
        }
      }
      snprintf((char *)v5 + 36, 0x10uLL, "%s", a2);
      v6 = *(_DWORD *)(a1 + 16);
    }
    v14 = *(_DWORD *)(a1 + 288);
    *((_DWORD *)v5 + 2) = v6;
    *((_DWORD *)v5 + 3) = v14;
    *((_DWORD *)v5 + 4) = *(_DWORD *)(a1 + 300);
    snprintf((char *)v5 + 20, 0x10uLL, "%s", (const char *)(a1 + 308));
    *((_DWORD *)v5 + 13) = *(_DWORD *)(a1 + 680);
    *(_OWORD *)((char *)v5 + 60) = *(_OWORD *)(a1 + 648);
    *((_DWORD *)v5 + 14) = *(_DWORD *)(a1 + 684);
    *((_BYTE *)v5 + 280) = *(_BYTE *)(a1 + 1106);
    v15 = *(unsigned __int8 *)(a1 + 1107);
    *((_BYTE *)v5 + 281) = v15;
    *((_BYTE *)v5 + 344) = *(_BYTE *)(a1 + 564);
    *((_DWORD *)v5 + 87) = 1;
    v16 = *(_DWORD *)(a1 + 1128);
    *((_BYTE *)v5 + 352) = v16 == 502;
    if (v16 == 502)
    {
      if (v15)
        sub_100023AAC();
      snprintf((char *)v5 + 353, 0x2EuLL, "%s/96", (const char *)(a1 + 1178));
    }
    else if (v15)
    {
      if (v16 != 500)
        sub_100023AD4();
      v5[5] = *(_OWORD *)(a1 + 704);
      v17 = *(_OWORD *)(a1 + 720);
      v18 = *(_OWORD *)(a1 + 736);
      v19 = *(_OWORD *)(a1 + 768);
      v5[8] = *(_OWORD *)(a1 + 752);
      v5[9] = v19;
      v5[6] = v17;
      v5[7] = v18;
      v20 = *(_OWORD *)(a1 + 784);
      v21 = *(_OWORD *)(a1 + 800);
      v22 = *(_OWORD *)(a1 + 832);
      v5[12] = *(_OWORD *)(a1 + 816);
      v5[13] = v22;
      v5[10] = v20;
      v5[11] = v21;
      v23 = *(_OWORD *)(a1 + 848);
      v24 = *(_OWORD *)(a1 + 864);
      v25 = *(_OWORD *)(a1 + 880);
      *((_QWORD *)v5 + 34) = *(_QWORD *)(a1 + 896);
      v5[15] = v24;
      v5[16] = v25;
      v5[14] = v23;
    }
    else if (v16 == 500 && !*((_DWORD *)v5 + 2))
    {
      v26 = *(_OWORD *)(a1 + 1132);
      v27 = *(_OWORD *)(a1 + 1148);
      *(_OWORD *)((char *)v5 + 313) = *(_OWORD *)(a1 + 1163);
      *(_OWORD *)((char *)v5 + 282) = v26;
      *(_OWORD *)((char *)v5 + 298) = v27;
    }
  }
  return v5;
}

void sub_10001B5A4(uint64_t *a1)
{
  int v1;
  uint64_t *v3;
  uint64_t *i;

  v1 = *((_DWORD *)a1 + 87) - 1;
  *((_DWORD *)a1 + 87) = v1;
  if (!v1)
  {
    if (*((_DWORD *)a1 + 3) == 104)
      xpc_release((xpc_object_t)a1[42]);
    v3 = &qword_1000353F8;
    for (i = (uint64_t *)qword_1000353F8; i != a1; i = (uint64_t *)*i)
      v3 = i;
    *v3 = *a1;
    free(a1);
  }
}

uint64_t sub_10001B61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  xpc_object_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v37;
  char string[16];

  v4 = PFUserBeginRules(a2);
  v5 = xpc_dictionary_create(0, 0, 0);
  if (!v5)
  {
    sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v6, v7, v8, v9, v10, v11, v37);
LABEL_8:
    v34 = 12;
LABEL_15:
    PFUserClearRules(a2, v4);
    return v34;
  }
  v12 = v5;
  v13 = xpc_dictionary_create(0, 0, 0);
  if (!v13)
  {
    sub_100003108(0, (uint64_t)"unable to create dstAddr xpc dictionary", v14, v15, v16, v17, v18, v19, v37);
    xpc_release(v12);
    goto LABEL_8;
  }
  v20 = v13;
  v27 = xpc_dictionary_create(0, 0, 0);
  if (v27)
  {
    inet_ntop(2, (const void *)(a1 + 52), string, 0x10u);
    xpc_dictionary_set_uint64(v12, kPFAction, 0xDuLL);
    xpc_dictionary_set_uint64(v12, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_string(v20, kPFSubAddress, (const char *)(a1 + 353));
    xpc_dictionary_set_value(v12, kPFTo, v20);
    xpc_dictionary_set_string(v27, kPFSubAddress, string);
    xpc_dictionary_set_uint64(v27, kPFSubLowPort, 0x8000uLL);
    xpc_dictionary_set_uint64(v27, kPFSubHighPort, 0xBFFFuLL);
    xpc_dictionary_set_uint64(v27, kPFSubPortOperator, 0);
    xpc_dictionary_set_value(v12, kPFNATRDRAddress, v27);
    if ((sub_10001E118(a2, v4, v12) & 1) != 0)
    {
      v34 = 0;
      v35 = 1;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v28, v29, v30, v31, v32, v33, (uint64_t)"mis_pf_configure_nat64");
      v35 = 0;
      v34 = 22;
    }
  }
  else
  {
    sub_100003108(0, (uint64_t)"unable to create natAddr xpc dictionary", v21, v22, v23, v24, v25, v26, v37);
    v35 = 0;
    v34 = 12;
  }
  xpc_release(v12);
  xpc_release(v20);
  if (v27)
    xpc_release(v27);
  if (!v35)
    goto LABEL_15;
  PFUserCommitRules(a2, v4, 0, 0);
  return 0;
}

uint64_t sub_10001B894(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const char *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  void *v21;
  xpc_object_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  int v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned int v42;
  void *v43;
  unsigned int v44;
  int v45;
  int v46;
  char v47;
  xpc_object_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  int v65;
  int v66;
  char v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  void *v76;
  xpc_object_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  void *v92;
  uint64_t v94;
  uint64_t v95;
  int v96;
  char v97[16];
  char __str[16];
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;

  v95 = PFUserBeginRules(a2);
  v4 = qword_1000353F8;
  if (!qword_1000353F8)
  {
LABEL_50:
    PFUserCommitRules(a2, v95, 0, 0);
    return 0;
  }
  v5 = (const char *)(a1 + 20);
  while (1)
  {
    if (*(_DWORD *)(v4 + 8) || strncmp((const char *)(v4 + 36), v5, 0x100uLL))
      goto LABEL_49;
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
      goto LABEL_51;
    v13 = v6;
    xpc_dictionary_set_uint64(v6, kPFAction, 1uLL);
    xpc_dictionary_set_string(v13, kPFInterface, (const char *)(v4 + 20));
    if ((sub_10001E118(a2, v95, v13) & 1) == 0)
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v14, v15, v16, v17, v18, v19, (uint64_t)"mis_pf_block_all");
      xpc_release(v13);
      v41 = 22;
      goto LABEL_59;
    }
    xpc_release(v13);
    v20 = *(_DWORD *)(v4 + 56);
    v96 = *(_DWORD *)(v4 + 52);
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
      goto LABEL_51;
    v21 = v6;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v105 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    *(_OWORD *)__str = 0u;
    xpc_dictionary_set_uint64(v6, kPFAction, 0);
    xpc_dictionary_set_string(v21, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v21, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v21, kPFKeepState, 1uLL);
    v22 = xpc_dictionary_create(0, 0, 0);
    if (!v22)
      goto LABEL_52;
    v29 = v22;
    inet_ntop(2, &v96, v97, 0x10u);
    v30 = bswap32(v20);
    if ((v30 & 0x80000000) != 0)
    {
      v32 = 0;
      do
        v33 = v32-- + 30;
      while (((v30 >> v33) & 1) != 0);
      v31 = -v32;
    }
    else
    {
      v31 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v97, v31);
    xpc_dictionary_set_string(v29, kPFSubAddress, __str);
    xpc_dictionary_set_value(v21, kPFFrom, v29);
    xpc_dictionary_set_value(v21, kPFTo, v29);
    v40 = sub_10001E118(a2, v95, v21);
    if ((v40 & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v34, v35, v36, v37, v38, v39, (uint64_t)"mis_pf_pass_subnet");
      v41 = 22;
    }
    xpc_release(v29);
    xpc_release(v21);
    if (!v40)
      goto LABEL_59;
    v42 = *(_DWORD *)(v4 + 56);
    v96 = *(_DWORD *)(v4 + 52);
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
    {
LABEL_51:
      sub_100003108(v6, (uint64_t)"unable to create rule xpc dictionary", v7, v8, v9, v10, v11, v12, v94);
      goto LABEL_58;
    }
    v21 = v6;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v105 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    *(_OWORD *)__str = 0u;
    xpc_dictionary_set_uint64(v6, kPFAction, 0);
    xpc_dictionary_set_string(v21, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v21, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v21, kPFKeepState, 1uLL);
    v22 = xpc_dictionary_create(0, 0, 0);
    if (!v22)
      goto LABEL_52;
    v43 = v22;
    inet_ntop(2, &v96, v97, 0x10u);
    v44 = bswap32(v42);
    if ((v44 & 0x80000000) != 0)
    {
      v46 = 0;
      do
        v47 = v46-- + 30;
      while (((v44 >> v47) & 1) != 0);
      v45 = -v46;
    }
    else
    {
      v45 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v97, v45);
    xpc_dictionary_set_string(v43, kPFSubAddress, __str);
    xpc_dictionary_set_value(v21, kPFFrom, v43);
    v48 = xpc_dictionary_create(0, 0, 0);
    if (!v48)
      goto LABEL_53;
    v55 = v48;
    strcpy(__str, "224.0.0.0/24");
    xpc_dictionary_set_string(v48, kPFSubAddress, __str);
    xpc_dictionary_set_value(v21, kPFTo, v55);
    v62 = sub_10001E118(a2, v95, v21);
    if ((v62 & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v56, v57, v58, v59, v60, v61, (uint64_t)"mis_pf_pass_multicast_ip4");
      v41 = 22;
    }
    xpc_release(v43);
    xpc_release(v55);
    xpc_release(v21);
    if (!v62)
      goto LABEL_59;
    v63 = *(_DWORD *)(v4 + 56);
    v96 = *(_DWORD *)(v4 + 52);
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
      goto LABEL_51;
    v21 = v6;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v105 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    *(_OWORD *)__str = 0u;
    xpc_dictionary_set_uint64(v6, kPFAction, 0);
    xpc_dictionary_set_string(v21, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v21, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v21, kPFKeepState, 1uLL);
    v22 = xpc_dictionary_create(0, 0, 0);
    if (!v22)
      goto LABEL_52;
    v43 = v22;
    inet_ntop(2, &v96, v97, 0x10u);
    v64 = bswap32(v63);
    if ((v64 & 0x80000000) != 0)
    {
      v66 = 0;
      do
        v67 = v66-- + 30;
      while (((v64 >> v67) & 1) != 0);
      v65 = -v66;
    }
    else
    {
      v65 = 0;
    }
    snprintf(__str, 0x100uLL, "%s/%d", v97, v65);
    xpc_dictionary_set_string(v43, kPFSubAddress, __str);
    xpc_dictionary_set_value(v21, kPFFrom, v43);
    v48 = xpc_dictionary_create(0, 0, 0);
    if (!v48)
    {
LABEL_53:
      sub_100003108(v48, (uint64_t)"unable to create dst address xpc dictionary", v49, v50, v51, v52, v53, v54, v94);
      v92 = v43;
      goto LABEL_56;
    }
    v68 = v48;
    strcpy(__str, "255.255.255.255");
    xpc_dictionary_set_string(v48, kPFSubAddress, __str);
    xpc_dictionary_set_value(v21, kPFTo, v68);
    v75 = sub_10001E118(a2, v95, v21);
    if ((v75 & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v69, v70, v71, v72, v73, v74, (uint64_t)"mis_pf_pass_broadcast_ip4");
      v41 = 22;
    }
    xpc_release(v43);
    xpc_release(v68);
    xpc_release(v21);
    if (!v75)
      goto LABEL_59;
    v6 = xpc_dictionary_create(0, 0, 0);
    if (!v6)
      goto LABEL_51;
    v21 = v6;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v105 = 0u;
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    *(_OWORD *)__str = 0u;
    xpc_dictionary_set_uint64(v6, kPFAction, 0);
    xpc_dictionary_set_string(v21, kPFInterface, (const char *)(v4 + 20));
    xpc_dictionary_set_uint64(v21, kPFFamily, 2uLL);
    xpc_dictionary_set_uint64(v21, kPFKeepState, 1uLL);
    xpc_dictionary_set_string(v21, kPFProtocol, "udp");
    v22 = xpc_dictionary_create(0, 0, 0);
    if (!v22)
    {
LABEL_52:
      sub_100003108(v22, (uint64_t)"unable to create src address xpc dictionary", v23, v24, v25, v26, v27, v28, v94);
      goto LABEL_57;
    }
    v76 = v22;
    strcpy(__str, "0.0.0.0");
    xpc_dictionary_set_string(v22, kPFSubAddress, __str);
    xpc_dictionary_set_uint64(v76, kPFSubLowPort, 0x44uLL);
    xpc_dictionary_set_uint64(v76, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v21, kPFFrom, v76);
    v77 = xpc_dictionary_create(0, 0, 0);
    if (!v77)
      break;
    v84 = v77;
    xpc_dictionary_set_string(v77, kPFSubAddressLabel, kPFAny);
    xpc_dictionary_set_uint64(v84, kPFSubLowPort, 0x43uLL);
    xpc_dictionary_set_uint64(v84, kPFSubPortOperator, 2uLL);
    xpc_dictionary_set_value(v21, kPFTo, v84);
    v91 = sub_10001E118(a2, v95, v21);
    if ((v91 & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v85, v86, v87, v88, v89, v90, (uint64_t)"mis_pf_pass_broadcast_dhcp");
      v41 = 22;
    }
    xpc_release(v76);
    xpc_release(v84);
    xpc_release(v21);
    if (!v91)
      goto LABEL_59;
LABEL_49:
    v4 = *(_QWORD *)v4;
    if (!v4)
      goto LABEL_50;
  }
  sub_100003108(0, (uint64_t)"unable to create dst address xpc dictionary", v78, v79, v80, v81, v82, v83, v94);
  v92 = v76;
LABEL_56:
  xpc_release(v92);
LABEL_57:
  xpc_release(v21);
LABEL_58:
  v41 = 12;
LABEL_59:
  PFUserClearRules(a2, v95);
  return v41;
}

uint64_t sub_10001C218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  int8x16_t v21;
  char v22[46];

  v4 = PFUserBeginRules(a2);
  v5 = qword_1000353F8;
  if (qword_1000353F8)
  {
    while (1)
    {
      if (!*(_DWORD *)(v5 + 8) && !strncmp((const char *)(v5 + 36), (const char *)(a1 + 20), 0x100uLL))
      {
        v6 = sub_10001E578((const char *)(v5 + 20), a2, v4, 0);
        if ((_DWORD)v6)
          break;
        sub_100003108(2u, (uint64_t)"%s: pass fe80::/10 on %s", v7, v8, v9, v10, v11, v12, (uint64_t)"mis_pf_add_hostrules_v6");
        if (*(_DWORD *)(v5 + 60) || *(_DWORD *)(v5 + 64) || *(_DWORD *)(v5 + 68) || *(_DWORD *)(v5 + 72))
        {
          v21 = *(int8x16_t *)(v5 + 60);
          v21 = vandq_s8(v21, (int8x16_t)xmmword_100025140);
          inet_ntop(30, &v21, v22, 0x2Eu);
          sub_100003108(2u, (uint64_t)"%s: pass %s/64 on %s", v13, v14, v15, v16, v17, v18, (uint64_t)"mis_pf_add_hostrules_v6");
          v6 = sub_10001E7D4(a1, (const char *)(v5 + 20), a2, v4, 0, 0, &v21, 64);
          if ((_DWORD)v6)
            break;
        }
      }
      v5 = *(_QWORD *)v5;
      if (!v5)
        goto LABEL_11;
    }
    v19 = v6;
    PFUserClearRules(a2, v4);
  }
  else
  {
LABEL_11:
    PFUserCommitRules(a2, v4, 0, 0);
    return 0;
  }
  return v19;
}

void sub_10001C3D4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  const char *v11;
  uint64_t *v12;
  const char *v13;
  uint64_t *v14;
  const char *v15;
  void *v16;
  xpc_object_t v17;
  size_t count;
  size_t v19;
  size_t v20;
  char v21;
  size_t v22;
  const char *string;
  const char *v24;
  int v25;
  int v26;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  size_t v70;
  uint64_t v71;
  char v72;

  v8 = a1[35];
  if (a1[36])
    v9 = a1[36];
  else
    v9 = a1[35];
  if (*(_DWORD *)(v8 + 288) == 101)
    return;
  v11 = (const char *)(a1[37] + 308);
  v12 = &qword_1000353F8;
  do
  {
    v12 = (uint64_t *)*v12;
    if (!v12)
    {
      v69 = v9 + 308;
      v24 = "external interface not present in pf for %s";
LABEL_22:
      sub_100003108(0, (uint64_t)v24, a3, a4, a5, a6, a7, a8, v69);
      return;
    }
  }
  while (strncmp(v11, (const char *)v12 + 20, 0x10uLL));
  v13 = (const char *)(v9 + 308);
  v14 = &qword_1000353F8;
  do
  {
    v14 = (uint64_t *)*v14;
    if (!v14)
    {
      v69 = v9 + 308;
      v24 = "pf not setup on %s";
      goto LABEL_22;
    }
  }
  while (strncmp((const char *)(v9 + 308), (const char *)v14 + 20, 0x10uLL));
  if (*((_DWORD *)v14 + 3) == 104)
  {
    v71 = v9;
    v15 = (const char *)(v8 + 308);
    v16 = (void *)v14[42];
    v17 = xpc_array_create(0, 0);
    count = xpc_array_get_count(v16);
    if (!count)
    {
LABEL_31:
      xpc_release(v17);
      sub_100003108(1u, (uint64_t)"pf not setup on %s", v38, v39, v40, v41, v42, v43, (uint64_t)v15);
      return;
    }
    v19 = count;
    v20 = 0;
    v21 = 0;
    v70 = count - 1;
LABEL_14:
    v72 = v21;
    v22 = v20;
    do
    {
      string = xpc_array_get_string(v16, v22);
      if (!strcmp(string, v15))
      {
        v20 = v22 + 1;
        v21 = 1;
        if (v70 != v22)
          goto LABEL_14;
        goto LABEL_25;
      }
      xpc_array_set_string(v17, 0xFFFFFFFFFFFFFFFFLL, string);
      ++v22;
    }
    while (v19 != v22);
    if ((v72 & 1) == 0)
      goto LABEL_31;
LABEL_25:
    xpc_release(v16);
    v14[42] = (uint64_t)v17;
    v9 = v71;
  }
  v25 = *((_DWORD *)v14 + 87);
  v26 = *((_DWORD *)v12 + 87);
  sub_10001B5A4(v14);
  sub_10001B5A4(v12);
  if (v25 > 1)
    return;
  sub_100014AC8((char *)(a1[37] + 308), v13, v27, v28, v29, v30, v31, v32);
  v33 = a1[35];
  if (*(_DWORD *)(v33 + 1128) != 502)
  {
    if (*(_DWORD *)(v33 + 288) == 103)
    {
      v37 = PFUserCreate(kPFInternetSharing, kPFHost_v4, qword_100035470, 0);
      if (!v37)
      {
        v50 = kPFHost_v4;
LABEL_71:
        sub_100003108(0, (uint64_t)"pf user handle failed for anchor %s", v44, v45, v46, v47, v48, v49, v50);
        return;
      }
    }
    else
    {
      if (*(_BYTE *)(a1[37] + 564))
        v51 = &kPFShared_v4;
      else
        v51 = &kPFBase_v4;
      v37 = PFUserCreate(kPFInternetSharing, *v51, qword_100035470, 0);
      if (!v37)
      {
        if (*(_BYTE *)(a1[37] + 564))
          v68 = (uint64_t *)&kPFShared_v4;
        else
          v68 = (uint64_t *)&kPFBase_v4;
        v50 = *v68;
        goto LABEL_71;
      }
    }
    if (*(_BYTE *)(v9 + 1107) || !*(_BYTE *)(v9 + 1178) || *(_DWORD *)(v9 + 288) == 103)
    {
      v52 = (_BYTE *)a1[37];
      if (v52[1107] && v52[704] && *(_DWORD *)(a1[35] + 288) != 103)
      {
        if (v52[564])
          sub_100023AFC();
        v36 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0);
        if (!v36)
        {
          v67 = kPFBase_v6;
LABEL_76:
          sub_100003108(0, (uint64_t)"pf user failed for anchor %s", v60, v61, v62, v63, v64, v65, v67);
          goto LABEL_77;
        }
      }
      else
      {
        v36 = PFUserCreate(kPFInternetSharing, kPFHost_v6, qword_100035470, 0);
        if (!v36)
        {
          sub_100003108(0, (uint64_t)"pf user handle failed for anchor %s", v53, v54, v55, v56, v57, v58, kPFHost_v6);
          goto LABEL_77;
        }
      }
    }
    else
    {
      if (*(_DWORD *)(v9 + 1128) != 500)
        sub_100023B24();
      if (*(_BYTE *)(v9 + 564))
        v59 = &kPFShared_v6;
      else
        v59 = &kPFBase_nat66;
      v36 = PFUserCreate(kPFInternetSharing, *v59, qword_100035470, 0);
      if (!v36)
      {
        if (*(_BYTE *)(v9 + 564))
          v66 = (uint64_t *)&kPFShared_v6;
        else
          v66 = (uint64_t *)&kPFBase_nat66;
        v67 = *v66;
        goto LABEL_76;
      }
    }
    if (v26 > 1)
    {
      v35 = 0;
LABEL_46:
      if (*((_BYTE *)v12 + 352))
      {
        sub_10001B61C((uint64_t)v12, v35);
        if (v37)
LABEL_78:
          PFUserRelease(v37, 0);
LABEL_79:
        if (v36)
          PFUserRelease(v36, 0);
        if (v35)
          goto LABEL_82;
        return;
      }
      if (*((_DWORD *)v12 + 13) || *((_BYTE *)v12 + 344) && dword_1000354B8)
      {
        if (*(_DWORD *)(a1[35] + 288) == 103)
        {
LABEL_66:
          sub_10001B894((uint64_t)v12, v37);
          goto LABEL_84;
        }
        sub_100019D80((uint64_t)v12, v37);
      }
      else if (*(_DWORD *)(a1[35] + 288) == 103)
      {
        goto LABEL_66;
      }
LABEL_84:
      if (*((_BYTE *)v12 + 281))
      {
        if (*((_BYTE *)v12 + 80) && *(_DWORD *)(a1[35] + 288) != 103)
        {
          sub_10001ABE8((uint64_t)v12, v36);
          if (v37)
            goto LABEL_78;
          goto LABEL_79;
        }
      }
      else if (*(_BYTE *)(v9 + 1178) && *(_DWORD *)(v9 + 288) != 103)
      {
        sub_10001A7F0((uint64_t)v12, v36);
        if (v37)
          goto LABEL_78;
        goto LABEL_79;
      }
      sub_10001C218((uint64_t)v12, v36);
      if (v37)
        goto LABEL_78;
      goto LABEL_79;
    }
    PFUserDeleteRules(v37, 0, 0);
    PFUserDeleteRules(v36, 0, 0);
LABEL_77:
    v35 = 0;
    goto LABEL_78;
  }
  v34 = PFUserCreate(kPFInternetSharing, kPFBase_nat64, qword_100035470, 0);
  if (!v34)
    return;
  v35 = v34;
  if (v26 >= 2)
  {
    v36 = 0;
    v37 = 0;
    goto LABEL_46;
  }
  PFUserDeleteRules(0, 0, 0);
  PFUserDeleteRules(v35, 0, 0);
LABEL_82:
  PFUserRelease(v35, 0);
}

uint64_t sub_10001C954(char *__s1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v9;
  uint64_t *v12;
  uint64_t result;
  _QWORD *v14;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v9 = a3;
  v12 = &qword_1000353F8;
  do
  {
    v12 = (uint64_t *)*v12;
    if (!v12)
      return sub_100003108(2u, (uint64_t)"pf flush states not required", a3, a4, a5, a6, a7, a8, a9);
    result = strncmp(__s1, (const char *)v12 + 20, 0x10uLL);
  }
  while ((_DWORD)result);
  if (a2)
  {
    sub_100003108(1u, (uint64_t)"flush ipv4 pf states for %s", a3, a4, a5, a6, a7, a8, (uint64_t)v12 + 20);
    if (*((_BYTE *)v12 + 344))
      v14 = &kPFShared_v4;
    else
      v14 = &kPFBase_v4;
    v15 = PFUserCreate(kPFInternetSharing, *v14, qword_100035470, 0);
    if (!v15)
      return sub_100003108(0, (uint64_t)"pf handle create failed for %s", v16, v17, v18, v19, v20, v21, (uint64_t)v12 + 20);
    v22 = v15;
    result = PFUserClearStates(v15, 0);
    if (!v9)
    {
LABEL_10:
      v23 = 0;
      if (!v22)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else
  {
    v22 = 0;
    if (!v9)
      goto LABEL_10;
  }
  sub_100003108(1u, (uint64_t)"flush ipv6 pf states for %s", a3, a4, a5, a6, a7, a8, (uint64_t)v12 + 20);
  v24 = PFUserCreate(kPFInternetSharing, kPFBase_v6, qword_100035470, 0);
  v23 = v24;
  if (v24)
  {
    result = PFUserClearStates(v24, 0);
    if (!v22)
      goto LABEL_17;
    goto LABEL_16;
  }
  result = sub_100003108(0, (uint64_t)"pf handle create failed for %s", v25, v26, v27, v28, v29, v30, (uint64_t)v12 + 20);
  if (v22)
LABEL_16:
    result = PFUserRelease(v22, 0);
LABEL_17:
  if (v23)
    return PFUserRelease(v23, 0);
  return result;
}

uint64_t sub_10001CB0C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int16 v8;
  int v10;
  int v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t *v30;
  _DWORD *v31;
  uint64_t **v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  char v38[46];

  if ((*(_BYTE *)(a1 + 508) & 8) != 0)
  {
    sub_100003108(0, (uint64_t)"%s: port forwarding unavailable with limited clients", a3, a4, (uint64_t)a5, a6, a7, a8, (uint64_t)"mis_pf_add_port_forwarding_rule");
    return 80;
  }
  else
  {
    v8 = a6;
    v10 = a4;
    v11 = a3;
    inet_ntop(a4, a5, v38, 0x2Eu);
    if (v10 == 2)
      v20 = "inet";
    else
      v20 = "inet6";
    if (v10 == 2)
      v21 = &qword_100034D50;
    else
      v21 = &qword_100034D60;
    sub_100003108(0, (uint64_t)"%s %s(pid %d) %s %s %d -> %s:%d", v14, v15, v16, v17, v18, v19, (uint64_t)"mis_pf_add_port_forwarding_rule");
    v28 = *v21;
    if (*v21)
    {
      while (*(unsigned __int8 *)(v28 + 44) != a2 || *(unsigned __int16 *)(v28 + 42) != v11)
      {
        v28 = *(_QWORD *)v28;
        if (!v28)
          goto LABEL_12;
      }
      sub_100003108(0, (uint64_t)"%s rule for %s %d already exists", v22, v23, v24, v25, v26, v27, (uint64_t)v20);
      return 17;
    }
    else
    {
LABEL_12:
      v29 = (char *)malloc_type_malloc(0x30uLL, 0x10A00403747CE00uLL);
      v30 = (uint64_t *)v29;
      *((_OWORD *)v29 + 1) = 0u;
      *((_OWORD *)v29 + 2) = 0u;
      *(_OWORD *)v29 = 0u;
      *((_QWORD *)v29 + 2) = a1;
      v29[44] = a2;
      *((_WORD *)v29 + 21) = v11;
      *((_WORD *)v29 + 20) = v8;
      v31 = v29 + 24;
      v29[45] = v10;
      if (v10 == 2)
      {
        *v31 = *a5;
        v32 = &off_100034D58;
      }
      else
      {
        *(_OWORD *)v31 = *(_OWORD *)a5;
        v32 = &off_100034D68;
      }
      v34 = *v32;
      *(_QWORD *)v29 = 0;
      *((_QWORD *)v29 + 1) = v34;
      *v34 = (uint64_t)v29;
      *v32 = (uint64_t *)v29;
      v33 = sub_10001CD4C(v10);
      if ((_DWORD)v33)
      {
        v35 = *v30;
        v36 = (uint64_t *)v30[1];
        if (*v30)
        {
          *(_QWORD *)(v35 + 8) = v36;
          v36 = (uint64_t *)v30[1];
        }
        else
        {
          *v32 = v36;
        }
        *v36 = v35;
        free(v30);
      }
    }
  }
  return (uint64_t)v33;
}

uint64_t *sub_10001CD4C(int a1)
{
  uint64_t v1;

  v1 = qword_100035498;
  if (!qword_100035498)
    return 0;
  while (*(_DWORD *)(v1 + 16) != 1 || !*(_BYTE *)(v1 + 564))
  {
    v1 = *(_QWORD *)v1;
    if (!v1)
      return 0;
  }
  if (a1 == 2)
    return sub_100019BE8((char *)(v1 + 308), 0, 0, *(_DWORD *)(v1 + 300));
  else
    return sub_10001A6F8((char *)(v1 + 308), *(_DWORD *)(v1 + 300));
}

uint64_t sub_10001CDAC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  const char *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t *v23;

  if ((*(_BYTE *)(a1 + 508) & 8) != 0)
  {
    sub_100003108(0, (uint64_t)"%s: port forwarding unavailable for limited clients", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pf_remove_port_forwarding_rule");
    return 80;
  }
  else
  {
    v8 = a4;
    v9 = a3;
    if ((_DWORD)a4 == 2)
      v11 = "inet";
    else
      v11 = "inet6";
    if ((_DWORD)a4 == 2)
      v12 = &qword_100034D50;
    else
      v12 = &qword_100034D60;
    sub_100003108(0, (uint64_t)"%s %s(pid %d) %s %s %d", a3, a4, a5, a6, a7, a8, (uint64_t)"mis_pf_remove_port_forwarding_rule");
    v19 = (_QWORD *)*v12;
    if (*v12)
    {
      while (*((unsigned __int8 *)v19 + 44) != a2 || *((unsigned __int16 *)v19 + 21) != v9)
      {
        v19 = (_QWORD *)*v19;
        if (!v19)
          goto LABEL_12;
      }
      v21 = (_QWORD *)*v19;
      v22 = (_QWORD *)v19[1];
      if (*v19)
      {
        v21[1] = v22;
        v22 = (_QWORD *)v19[1];
      }
      else
      {
        if (v8 == 2)
          v23 = &qword_100034D50;
        else
          v23 = &qword_100034D60;
        v23[1] = (uint64_t)v22;
      }
      *v22 = v21;
      free(v19);
      return (uint64_t)sub_10001CD4C(v8);
    }
    else
    {
LABEL_12:
      sub_100003108(0, (uint64_t)"No forwarding rule for %s %s %d", v13, v14, v15, v16, v17, v18, (uint64_t)v11);
      return 2;
    }
  }
}

xpc_object_t sub_10001CF1C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v3;
  xpc_object_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  void *v12;
  char string[46];

  v2 = &qword_100034D60;
  if (a2 == 2)
    v2 = &qword_100034D50;
  v3 = *v2;
  if (*v2)
  {
    v5 = 0;
    while (*(_QWORD *)(v3 + 16) != a1)
    {
LABEL_22:
      v3 = *(_QWORD *)v3;
      if (!v3)
        return v5;
    }
    v6 = *(unsigned __int8 *)(v3 + 45);
    v7 = (_DWORD)v6 == 30 || (_DWORD)v6 == 2;
    if (v7
      && (v8 = *(unsigned __int16 *)(v3 + 40), *(_WORD *)(v3 + 40))
      && (v9 = *(unsigned __int8 *)(v3 + 44),
          v10 = *(unsigned __int16 *)(v3 + 42),
          inet_ntop(*(unsigned __int8 *)(v3 + 45), (const void *)(v3 + 24), string, 0x2Eu)))
    {
      v11 = xpc_dictionary_create(0, 0, 0);
      v12 = v11;
      if ((_DWORD)v9)
        xpc_dictionary_set_uint64(v11, off_100034D08[0], v9);
      if ((_DWORD)v10)
        xpc_dictionary_set_uint64(v12, off_100034D10[0], v10);
      xpc_dictionary_set_uint64(v12, off_100034D20[0], v6);
      xpc_dictionary_set_uint64(v12, off_100034D28, v8);
      xpc_dictionary_set_string(v12, off_100034D18[0], string);
      if (v5)
        goto LABEL_21;
    }
    else
    {
      v12 = 0;
      if (v5)
      {
LABEL_21:
        xpc_array_append_value(v5, v12);
        xpc_release(v12);
        goto LABEL_22;
      }
    }
    v5 = xpc_array_create(0, 0);
    goto LABEL_21;
  }
  return 0;
}

void sub_10001D0D0(uint64_t a1, int a2)
{
  uint64_t *v2;
  _QWORD *v3;
  uint64_t *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char v15[46];

  if (a2 == 2)
    v2 = &qword_100034D50;
  else
    v2 = &qword_100034D60;
  v3 = (_QWORD *)*v2;
  if (*v2)
  {
    if (a2 == 2)
      v5 = &qword_100034D50;
    else
      v5 = &qword_100034D60;
    do
    {
      v6 = (_QWORD *)*v3;
      if (v3[2] == a1)
      {
        inet_ntop(*((unsigned __int8 *)v3 + 45), v3 + 3, v15, 0x2Eu);
        sub_100003108(0, (uint64_t)"Remove rule %s(pid %d) %s %d -> %s:%d", v7, v8, v9, v10, v11, v12, v3[2] + 356);
        v13 = (_QWORD *)*v3;
        v14 = (_QWORD *)v3[1];
        if (*v3)
        {
          v13[1] = v14;
          v14 = (_QWORD *)v3[1];
        }
        else
        {
          v5[1] = (uint64_t)v14;
        }
        *v14 = v13;
        free(v3);
      }
      v3 = v6;
    }
    while (v6);
  }
}

uint64_t sub_10001D204(unsigned int a1)
{
  int v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v17;
  int v18[6];

  v17 = a1;
  *(_OWORD *)v18 = xmmword_100025210;
  v1 = dword_100035400;
  if (a1)
  {
    ++dword_100035400;
    if (v1 > 0)
      return 0;
  }
  else
  {
    --dword_100035400;
    if (v1 != 1)
      return 0;
  }
  v3 = sysctl(v18, 4u, 0, 0, &v17, 4uLL);
  if ((v3 & 0x80000000) != 0)
  {
    v2 = *__error();
    sub_100003108(0, (uint64_t)"setting ip forwarding to %d: %m", v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    v2 = v3;
    sub_100003108(2u, (uint64_t)"ip forwarding set to %d", v4, v5, v6, v7, v8, v9, v17);
  }
  return v2;
}

uint64_t sub_10001D2F4(unsigned int a1)
{
  int v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v17;
  int v18[6];

  v17 = a1;
  *(_OWORD *)v18 = xmmword_100025220;
  v1 = dword_100035404;
  if (a1)
  {
    ++dword_100035404;
    if (v1 > 0)
      return 0;
  }
  else
  {
    --dword_100035404;
    if (v1 != 1)
      return 0;
  }
  v3 = sysctl(v18, 4u, 0, 0, &v17, 4uLL);
  if ((v3 & 0x80000000) != 0)
  {
    v2 = *__error();
    sub_100003108(0, (uint64_t)"setting ip6 forwarding to %d: %m", v10, v11, v12, v13, v14, v15, v17);
  }
  else
  {
    v2 = v3;
    sub_100003108(2u, (uint64_t)"ip6 forwarding set to %d", v4, v5, v6, v7, v8, v9, v17);
  }
  return v2;
}

uint64_t sub_10001D3E4(const char *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;

  v10 = xpc_dictionary_create(0, 0, 0);
  if (!v10)
  {
    sub_100003108(0, (uint64_t)"unable to create xpc rule dictionary", v11, v12, v13, v14, v15, v16, v34);
    return 12;
  }
  v17 = v10;
  xpc_dictionary_set_uint64(v10, kPFAction, 2uLL);
  xpc_dictionary_set_uint64(v17, kPFProtocol, a2);
  xpc_dictionary_set_string(v17, kPFInterface, a1);
  v18 = xpc_dictionary_create(0, 0, 0);
  if (!v18)
  {
    sub_100003108(0, (uint64_t)"unable to create sub dictionary", v19, v20, v21, v22, v23, v24, v34);
    xpc_release(v17);
    return 12;
  }
  v25 = v18;
  xpc_dictionary_set_uint64(v18, kPFSubScrubMaxMSS, a3);
  xpc_dictionary_set_uint64(v25, kPFSubScrubFlags, 0x100uLL);
  xpc_dictionary_set_value(v17, kPFScrubOptions, v25);
  if ((sub_10001E118(a4, a5, v17) & 1) != 0)
  {
    v32 = 0;
  }
  else
  {
    sub_100003108(0, (uint64_t)"%s: unable to add rule", v26, v27, v28, v29, v30, v31, (uint64_t)"mis_pf_ifscrub");
    v32 = 22;
  }
  xpc_release(v25);
  xpc_release(v17);
  return v32;
}

uint64_t sub_10001D55C(const char *a1, unsigned int a2, const char *a3, int a4, uint64_t a5, uint64_t a6)
{
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  xpc_object_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  xpc_object_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  char __str[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;

  v12 = xpc_dictionary_create(0, 0, 0);
  if (!v12)
  {
    sub_100003108(0, (uint64_t)"unable to create nat xpc dictionary", v13, v14, v15, v16, v17, v18, v44);
    return 12;
  }
  v19 = v12;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  *(_OWORD *)__str = 0u;
  v47 = 0u;
  snprintf(__str, 0x100uLL, "%s:0", a1);
  xpc_dictionary_set_string(v19, kPFSubDynInterface, __str);
  xpc_dictionary_set_uint64(v19, kPFSubLowPort, 0x8000uLL);
  xpc_dictionary_set_uint64(v19, kPFSubHighPort, 0xBFFFuLL);
  xpc_dictionary_set_uint64(v19, kPFSubPortOperator, 0);
  v20 = xpc_dictionary_create(0, 0, 0);
  if (!v20)
  {
    sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v21, v22, v23, v24, v25, v26, v45);
    xpc_release(v19);
    return 12;
  }
  v27 = v20;
  xpc_dictionary_set_uint64(v20, kPFAction, 4uLL);
  xpc_dictionary_set_string(v27, kPFInterface, a1);
  xpc_dictionary_set_uint64(v27, kPFFamily, a2);
  xpc_dictionary_set_uint64(v27, kPFExtFilter, 3uLL);
  xpc_dictionary_set_uint64(v27, kPFExtMap, 3uLL);
  v28 = xpc_dictionary_create(0, 0, 0);
  if (v28)
  {
    v35 = v28;
    snprintf(__str, 0x100uLL, "%s/%d", a3, a4);
    xpc_dictionary_set_string(v35, kPFSubAddress, __str);
    xpc_dictionary_set_value(v27, kPFFrom, v35);
    xpc_dictionary_set_value(v27, kPFNATRDRAddress, v19);
    if ((sub_10001E118(a5, a6, v27) & 1) != 0)
    {
      v42 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v36, v37, v38, v39, v40, v41, (uint64_t)"mis_pf_configure_nat_outbound");
      v42 = 22;
    }
    xpc_release(v19);
  }
  else
  {
    sub_100003108(0, (uint64_t)"unable to create src address xpc dictionary", v29, v30, v31, v32, v33, v34, v45);
    v42 = 12;
    v35 = v19;
  }
  xpc_release(v35);
  xpc_release(v27);
  return v42;
}

uint64_t sub_10001D834(const char *a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t result;

  if (a2 == 2)
    v7 = &qword_100034D50;
  else
    v7 = &qword_100034D60;
  while (1)
  {
    v7 = (uint64_t *)*v7;
    if (!v7)
      break;
    result = sub_10001E1A8(a1, *((unsigned __int8 *)v7 + 44), *((unsigned __int16 *)v7 + 21), *((unsigned __int16 *)v7 + 21), *((unsigned __int16 *)v7 + 20), *((unsigned __int16 *)v7 + 20), *((unsigned __int8 *)v7 + 45), v7 + 3, a3, a4);
    if ((_DWORD)result)
      return result;
  }
  return 0;
}

uint64_t sub_10001D8BC(const char *a1, const char *a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9, int a10, int a11, uint64_t a12, uint64_t a13)
{
  uint64_t v19;
  xpc_object_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  xpc_object_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  xpc_object_t v37;
  void *v38;
  unsigned int v39;
  int v40;
  const char *v41;
  xpc_object_t v42;
  int v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  int v63;
  char string[16];
  char __str[16];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
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

  v61 = a11;
  v19 = sub_10001E1A8(a2, a5, a6, a7, a8, a9, 2u, &v61, a12, a13);
  if ((_DWORD)v19)
    return v19;
  v62 = v61;
  v63 = a3;
  v21 = xpc_dictionary_create(0, 0, 0);
  if (!v21)
  {
    sub_100003108(0, (uint64_t)"unable to create nat xpc dictionary", v22, v23, v24, v25, v26, v27, v58);
    return 12;
  }
  v28 = v21;
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v72 = 0u;
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  *(_OWORD *)__str = 0u;
  snprintf(__str, 0x100uLL, "%s:0", a2);
  xpc_dictionary_set_string(v28, kPFSubDynInterface, __str);
  v29 = xpc_dictionary_create(0, 0, 0);
  v36 = v29;
  if (v29)
  {
    xpc_dictionary_set_uint64(v29, kPFAction, 4uLL);
    xpc_dictionary_set_string(v36, kPFInterface, a1);
    xpc_dictionary_set_uint64(v36, kPFProtocol, a5);
    xpc_dictionary_set_uint64(v36, kPFFamily, 2uLL);
    v37 = xpc_dictionary_create(0, 0, 0);
    if (v37)
    {
      v38 = v37;
      inet_ntop(2, &v63, string, 0x10u);
      v39 = bswap32(a4);
      if ((v39 & 0x80000000) != 0)
      {
        v43 = 0;
        do
          v44 = v43-- + 30;
        while (((v39 >> v44) & 1) != 0);
        v40 = -v43;
      }
      else
      {
        v40 = 0;
      }
      snprintf(__str, 0x100uLL, "%s/%d", string, v40);
      xpc_dictionary_set_string(v38, kPFSubAddress, __str);
      v42 = xpc_dictionary_create(0, 0, 0);
      if (v42)
      {
        v51 = 2;
        inet_ntop(2, &v62, string, 0x10u);
        xpc_dictionary_set_string(v42, kPFSubAddress, string);
        xpc_dictionary_set_uint64(v42, kPFSubLowPort, a8);
        if (a8 != a9)
        {
          xpc_dictionary_set_uint64(v42, kPFSubHighPort, a9);
          v51 = 9;
        }
        xpc_dictionary_set_uint64(v42, kPFSubPortOperator, v51);
        xpc_dictionary_set_uint64(v28, kPFSubLowPort, 0x8000uLL);
        xpc_dictionary_set_uint64(v28, kPFSubHighPort, 0xBFFFuLL);
        xpc_dictionary_set_uint64(v28, kPFSubPortOperator, 0);
        xpc_dictionary_set_uint64(v36, kPFExtFilter, 1uLL);
        xpc_dictionary_set_uint64(v36, kPFExtMap, 1uLL);
        xpc_dictionary_set_value(v36, kPFFrom, v38);
        xpc_dictionary_set_value(v36, kPFTo, v42);
        xpc_dictionary_set_value(v36, kPFNATRDRAddress, v28);
        if ((sub_10001E118(a12, a13, v36) & 1) != 0)
        {
          v19 = 0;
        }
        else
        {
          sub_100003108(0, (uint64_t)"%s: unable to add rule", v52, v53, v54, v55, v56, v57, (uint64_t)"mis_pf_configure_nat_hairpin");
          v19 = 22;
        }
      }
      else
      {
        sub_100003108(0, (uint64_t)"unable to create dst address xpc dictionary", v45, v46, v47, v48, v49, v50, v60);
        v19 = 12;
      }
      xpc_release(v28);
      xpc_release(v38);
      if (!v42)
        goto LABEL_25;
      goto LABEL_24;
    }
    v41 = "unable to create src address xpc dictionary";
  }
  else
  {
    v41 = "unable to create rule xpc dictionary";
  }
  sub_100003108(0, (uint64_t)v41, v30, v31, v32, v33, v34, v35, v59);
  v19 = 12;
  v42 = v28;
LABEL_24:
  xpc_release(v42);
LABEL_25:
  if (v36)
    xpc_release(v36);
  return v19;
}

uint64_t sub_10001DD00(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  xpc_object_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;

  v8 = xpc_dictionary_create(0, 0, 0);
  if (!v8)
  {
    sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v9, v10, v11, v12, v13, v14, v53);
    return 12;
  }
  v15 = v8;
  xpc_dictionary_set_uint64(v8, kPFAction, 0);
  xpc_dictionary_set_uint64(v15, kPFFamily, a4);
  xpc_dictionary_set_string(v15, kPFInterface, a1);
  xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
  xpc_dictionary_set_uint64(v15, kPFExtFilter, 1uLL);
  if ((sub_10001E118(a2, a3, v15) & 1) == 0)
  {
    sub_100003108(0, (uint64_t)"%s: unable to add generic pass all rule", v16, v17, v18, v19, v20, v21, (uint64_t)"mis_pf_configure_ext_filters");
    v36 = 22;
LABEL_9:
    v37 = v15;
LABEL_19:
    xpc_release(v37);
    return v36;
  }
  v22 = xpc_dictionary_create(0, 0, 0);
  if (!v22)
  {
    sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v23, v24, v25, v26, v27, v28, v53);
    v36 = 12;
    goto LABEL_9;
  }
  v29 = v22;
  xpc_dictionary_set_uint64(v22, kPFAction, 0);
  xpc_dictionary_set_uint64(v29, kPFFamily, a4);
  xpc_dictionary_set_string(v29, kPFInterface, a1);
  xpc_dictionary_set_uint64(v29, kPFProtocol, 0x32uLL);
  if ((sub_10001E118(a2, a3, v29) & 1) != 0)
  {
    v36 = 0;
  }
  else
  {
    sub_100003108(0, (uint64_t)"%s: unable to add esp rule", v30, v31, v32, v33, v34, v35, (uint64_t)"mis_pf_configure_ext_filters");
    v36 = 22;
  }
  if (a4 == 2)
  {
    v38 = xpc_dictionary_create(0, 0, 0);
    v45 = v38;
    if (v38)
    {
      xpc_dictionary_set_uint64(v38, kPFAction, 0);
      xpc_dictionary_set_uint64(v45, kPFFamily, 2uLL);
      xpc_dictionary_set_uint64(v45, kPFProtocol, 2uLL);
      xpc_dictionary_set_uint64(v45, kPFKeepState, 1uLL);
      xpc_dictionary_set_BOOL(v45, kPFAllowOpts, 1);
      if ((sub_10001E118(a2, a3, v45) & 1) == 0)
      {
        sub_100003108(0, (uint64_t)"%s: unable to add igmp rule", v46, v47, v48, v49, v50, v51, (uint64_t)"mis_pf_configure_ext_filters");
        v36 = 22;
      }
    }
    else
    {
      sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v39, v40, v41, v42, v43, v44, v53);
      v36 = 12;
    }
  }
  else
  {
    v45 = 0;
  }
  xpc_release(v15);
  xpc_release(v29);
  if (v45)
  {
    v37 = v45;
    goto LABEL_19;
  }
  return v36;
}

uint64_t sub_10001DFCC(const char *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;

  v8 = if_nametoindex(a1);
  if (v8)
  {
    v15 = v8;
    v16 = xpc_dictionary_create(0, 0, 0);
    if (v16)
    {
      v23 = v16;
      xpc_dictionary_set_uint64(v16, kPFAction, 0);
      xpc_dictionary_set_string(v23, kPFInterface, a2);
      xpc_dictionary_set_uint64(v23, kPFRTableID, v15);
      xpc_dictionary_set_uint64(v23, kPFKeepState, 1uLL);
      xpc_dictionary_set_uint64(v23, kPFExtFilter, 1uLL);
      if ((sub_10001E118(a3, a4, v23) & 1) != 0)
      {
        v30 = 0;
      }
      else
      {
        sub_100003108(0, (uint64_t)"%s: unable to add rule", v24, v25, v26, v27, v28, v29, (uint64_t)"mis_pf_configure_int_filters");
        v30 = 22;
      }
      xpc_release(v23);
    }
    else
    {
      sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v17, v18, v19, v20, v21, v22, v32);
      return 12;
    }
  }
  else
  {
    sub_100003108(0, (uint64_t)"if_nametoindex(%s)", v9, v10, v11, v12, v13, v14, (uint64_t)a1);
    return 6;
  }
  return v30;
}

uint64_t sub_10001E118(uint64_t a1, uint64_t a2, xpc_object_t xdict)
{
  void *v6;

  if (byte_100035485)
  {
    v6 = (void *)qword_100035408;
    if (!qword_100035408)
    {
      qword_100035408 = (uint64_t)xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64((xpc_object_t)qword_100035408, kPFSubLogFlags, 1uLL);
      v6 = (void *)qword_100035408;
    }
    xpc_dictionary_set_value(xdict, kPFLog, v6);
  }
  return PFUserAddRule(a1, a2, xdict);
}

uint64_t sub_10001E1A8(const char *a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, const void *a8, uint64_t a9, uint64_t a10)
{
  xpc_object_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  xpc_object_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  xpc_object_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  const char **v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  char __str[16];
  __int128 v56;
  __int128 v57;
  __int128 v58;
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
  __int128 v70;
  char string[46];

  if (a3 > a4 || a5 > a6)
    sub_100023B4C();
  if (a4 - a3 != a6 - a5)
    sub_100023B74();
  v18 = xpc_dictionary_create(0, 0, 0);
  if (!v18)
  {
    sub_100003108(0, (uint64_t)"unable to create rdr xpc dictionary", v19, v20, v21, v22, v23, v24, v54);
    return 12;
  }
  v25 = v18;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  *(_OWORD *)__str = 0u;
  v56 = 0u;
  inet_ntop(a7, a8, string, 0x2Eu);
  xpc_dictionary_set_string(v25, kPFSubAddress, string);
  v26 = xpc_dictionary_create(0, 0, 0);
  if (!v26)
  {
    sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v27, v28, v29, v30, v31, v32, v54);
    xpc_release(v25);
    return 12;
  }
  v33 = v26;
  xpc_dictionary_set_uint64(v26, kPFAction, 8uLL);
  xpc_dictionary_set_uint64(v33, kPFProtocol, a2);
  xpc_dictionary_set_string(v33, kPFInterface, a1);
  xpc_dictionary_set_uint64(v33, kPFFamily, a7);
  v34 = xpc_dictionary_create(0, 0, 0);
  if (v34)
  {
    v41 = v34;
    snprintf(__str, 0x100uLL, "%s:0", a1);
    xpc_dictionary_set_string(v41, kPFSubDynInterface, __str);
    xpc_dictionary_set_uint64(v41, kPFSubLowPort, a3);
    if (a3 == a4)
    {
      v42 = 2;
    }
    else
    {
      xpc_dictionary_set_uint64(v41, kPFSubHighPort, a4);
      v42 = 9;
    }
    xpc_dictionary_set_uint64(v41, kPFSubPortOperator, v42);
    v44 = (const char **)&kPFSubLowPort;
    if (a5 == a6)
    {
      v45 = 2;
      v46 = a5;
    }
    else
    {
      xpc_dictionary_set_uint64(v25, kPFSubLowPort, a5);
      v44 = (const char **)&kPFSubHighPort;
      v45 = 9;
      v46 = a6;
    }
    xpc_dictionary_set_uint64(v25, *v44, v46);
    xpc_dictionary_set_uint64(v25, kPFSubPortOperator, v45);
    xpc_dictionary_set_value(v33, kPFTo, v41);
    xpc_dictionary_set_value(v33, kPFNATRDRAddress, v25);
    if ((sub_10001E118(a9, a10, v33) & 1) != 0)
    {
      if (a3 == a4)
        sub_100003108(0, (uint64_t)"port forwarding enabled on %s proto %s port %d to %s port %d", v47, v48, v49, v50, v51, v52, (uint64_t)a1);
      else
        sub_100003108(0, (uint64_t)"port forwarding enabled on %s proto %s port %d:%d to %s port %d:%d", v47, v48, v49, v50, v51, v52, (uint64_t)a1);
      v43 = 0;
    }
    else
    {
      sub_100003108(0, (uint64_t)"%s: unable to add rule", v47, v48, v49, v50, v51, v52, (uint64_t)"mis_pf_configure_rdr");
      v43 = 22;
    }
    xpc_release(v25);
  }
  else
  {
    sub_100003108(0, (uint64_t)"unable to create dst xpc dictionary", v35, v36, v37, v38, v39, v40, v54);
    v43 = 12;
    v41 = v25;
  }
  xpc_release(v41);
  xpc_release(v33);
  return v43;
}

uint64_t sub_10001E578(const char *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  xpc_object_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  char string[16];
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
  __int128 v55;
  __int128 v56;

  v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    v15 = v8;
    v55 = 0u;
    v56 = 0u;
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
    *(_OWORD *)string = 0u;
    v42 = 0u;
    xpc_dictionary_set_uint64(v8, kPFAction, 0);
    xpc_dictionary_set_uint64(v15, kPFDirection, a4);
    xpc_dictionary_set_string(v15, kPFInterface, a1);
    xpc_dictionary_set_uint64(v15, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v15, kPFKeepState, 1uLL);
    v16 = xpc_dictionary_create(0, 0, 0);
    if (v16)
    {
      v23 = v16;
      strcpy(string, "fe80::/10");
      xpc_dictionary_set_string(v16, kPFSubAddress, string);
      v24 = xpc_dictionary_create(0, 0, 0);
      if (v24)
      {
        v31 = v24;
        xpc_dictionary_set_string(v24, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v15, kPFFrom, v23);
        xpc_dictionary_set_value(v15, kPFTo, v31);
        if ((sub_10001E118(a2, a3, v15) & 1) != 0)
        {
          v38 = 0;
        }
        else
        {
          sub_100003108(0, (uint64_t)"%s: unable to add rule", v32, v33, v34, v35, v36, v37, (uint64_t)"mis_pf_configure_pass_ip6_linklocal");
          v38 = 22;
        }
        xpc_release(v23);
        xpc_release(v31);
        goto LABEL_12;
      }
      sub_100003108(0, (uint64_t)"unable to create dst address xpc dictionary", v25, v26, v27, v28, v29, v30, v40);
      xpc_release(v23);
    }
    else
    {
      sub_100003108(0, (uint64_t)"unable to create src address xpc dictionary", v17, v18, v19, v20, v21, v22, v40);
    }
    v38 = 12;
LABEL_12:
    xpc_release(v15);
    return v38;
  }
  sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v9, v10, v11, v12, v13, v14, v40);
  return 12;
}

uint64_t sub_10001E7D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6, const void *a7, int a8)
{
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  xpc_object_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  xpc_object_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  char __str[54];
  char v58[46];

  v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    v23 = v16;
    xpc_dictionary_set_uint64(v16, kPFAction, 0);
    xpc_dictionary_set_uint64(v23, kPFDirection, a6);
    xpc_dictionary_set_string(v23, kPFInterface, a2);
    xpc_dictionary_set_uint64(v23, kPFFamily, 0x1EuLL);
    xpc_dictionary_set_uint64(v23, kPFKeepState, 1uLL);
    if (a5)
    {
      v24 = if_nametoindex((const char *)(a1 + 20));
      if (!v24)
      {
        sub_100003108(0, (uint64_t)"if_nametoindex(%s)", v25, v26, v27, v28, v29, v30, a1 + 20);
        v53 = 6;
        goto LABEL_16;
      }
      xpc_dictionary_set_uint64(v23, kPFRTableID, v24);
    }
    v31 = xpc_dictionary_create(0, 0, 0);
    if (v31)
    {
      v38 = v31;
      inet_ntop(30, a7, v58, 0x2Eu);
      snprintf(__str, 0x36uLL, "%s/%d", v58, a8);
      xpc_dictionary_set_string(v38, kPFSubAddress, __str);
      v39 = xpc_dictionary_create(0, 0, 0);
      if (v39)
      {
        v46 = v39;
        xpc_dictionary_set_string(v39, kPFSubAddressLabel, kPFAny);
        xpc_dictionary_set_value(v23, kPFFrom, v38);
        xpc_dictionary_set_value(v23, kPFTo, v46);
        if ((sub_10001E118(a3, a4, v23) & 1) != 0)
        {
          v53 = 0;
        }
        else
        {
          sub_100003108(0, (uint64_t)"%s: unable to add rule", v47, v48, v49, v50, v51, v52, (uint64_t)"mis_pf_configure_pass_ip6_prefix");
          v53 = 22;
        }
        xpc_release(v38);
        xpc_release(v46);
        goto LABEL_16;
      }
      sub_100003108(0, (uint64_t)"unable to create dst address xpc dictionary", v40, v41, v42, v43, v44, v45, v56);
      xpc_release(v38);
    }
    else
    {
      sub_100003108(0, (uint64_t)"unable to create src address xpc dictionary", v32, v33, v34, v35, v36, v37, v55);
    }
    v53 = 12;
LABEL_16:
    xpc_release(v23);
    return v53;
  }
  sub_100003108(0, (uint64_t)"unable to create rule xpc dictionary", v17, v18, v19, v20, v21, v22, v55);
  return 12;
}

id sub_10001EB00(uint64_t a1)
{
  id result;

  result = objc_alloc_init(*(Class *)(a1 + 32));
  qword_100035418 = (uint64_t)result;
  return result;
}

id sub_10001ED4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleCTNotification:notificationInfo:", a2, a3);
}

id sub_10001F080(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(objc_msgSend(a2, "description"), "UTF8String");
  sub_100003108(0, (uint64_t)"%s: failed tethering context re-assertion with error '%s'", v3, v4, v5, v6, v7, v8, (uint64_t)"-[misCTClientSharedInstance activateTethering:]_block_invoke");
  return objc_msgSend(*(id *)(a1 + 32), "activateTethering:", 0);
}

uint64_t sub_10001F868(uint64_t a1)
{
  return -[misCTClientSharedInstance activateTethering:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "activateTethering:", a1);
}

uint64_t sub_10001F894(uint64_t a1)
{
  return -[misCTClientSharedInstance getTetheringStatus:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "getTetheringStatus:", a1);
}

id sub_10001F8C0(uint64_t a1)
{
  return (id)-[misCTClientSharedInstance isDataPlanEnabled:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "isDataPlanEnabled:", a1);
}

id sub_10001F8EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (id)-[misCTClientSharedInstance registerCellularDataStatusNotification:callback:callbackArg:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "registerCellularDataStatusNotification:callback:callbackArg:", a1, a2, a3);
}

uint64_t sub_10001F930(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = -[misCTClientSharedInstance getTetheringInterfaceName:](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "getTetheringInterfaceName:", a1);
  if ((_DWORD)v7)
    sub_100003108(0, (uint64_t)"%s: failed to get tethering interface name", v1, v2, v3, v4, v5, v6, (uint64_t)"mis_ctinterface_get_tethering_interface");
  else
    sub_100003108(1u, (uint64_t)"%s: tethering interface name: %s", v1, v2, v3, v4, v5, v6, (uint64_t)"mis_ctinterface_get_tethering_interface");
  return v7;
}

id sub_10001F9A4()
{
  return (id)-[misCTClientSharedInstance isDualSim](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "isDualSim");
}

id sub_10001F9C0()
{
  return -[misCTClientSharedInstance _updateDualSimStatus](+[misCTClientSharedInstance sharedInstance](misCTClientSharedInstance, "sharedInstance"), "_updateDualSimStatus");
}

uint64_t sub_10001F9DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  if (!dword_100034D3C)
    return 0;
  if (qword_100035420 || (qword_100035420 = (uint64_t)dispatch_semaphore_create(0)) != 0)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    result = 0;
    byte_100035428 = 1;
  }
  else
  {
    sub_100003108(0, (uint64_t)"rtadvd semaphore create failed", v0, v1, v2, v3, v4, v5, v7);
    return 12;
  }
  return result;
}

void sub_10001FA58()
{
  if (byte_100035428 == 1)
  {
    if (qword_100035420)
    {
      dispatch_release((dispatch_object_t)qword_100035420);
      qword_100035420 = 0;
    }
    byte_100035428 = 0;
  }
}

uint64_t sub_10001FA98()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (!dword_100034D3C)
    return 0;
  if (dword_10003542C < 0)
  {
    v1 = -1;
    v0 = 2;
  }
  else if (!dword_10003542C
         && access("/usr/sbin/rtadvd", 0)
         && (v0 = *__error(),
             sub_100003108(0, (uint64_t)"\"%s\" not available", v2, v3, v4, v5, v6, v7, (uint64_t)"/usr/sbin/rtadvd"),
             (_DWORD)v0))
  {
    v1 = -1;
  }
  else
  {
    v0 = 0;
    v1 = dword_10003542C + 1;
  }
  dword_10003542C = v1;
  return v0;
}

uint64_t sub_10001FB48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v8;
  pid_t v9;
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
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  const char *v34;
  int v35;
  FILE *v36;
  FILE *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  int v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  int v52;
  BOOL v53;
  int v54;
  unsigned int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  unsigned int v61;
  const char *v62;
  size_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unsigned int v70;
  std::error_code *v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  pid_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  pid_t v118;
  posix_spawnattr_t v119;
  posix_spawn_file_actions_t v120;
  char v121[46];
  char v122[46];
  std::__fs::filesystem::path __str[10];

  v119 = 0;
  v120 = 0;
  v118 = 0;
  v8 = &byte_100034F58[168];
  if (dword_10003542C < 0)
  {
    sub_100003108(2u, (uint64_t)"\"%s\" not available", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
LABEL_12:
    v22 = 0;
    goto LABEL_147;
  }
  if (!dword_100034D3C)
  {
    sub_100003108(2u, (uint64_t)"\"%s\" not enabled", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
    goto LABEL_12;
  }
  if (!dword_1000354D4)
  {
    sub_100003108(2u, (uint64_t)"no internal interfaces to start \"%s\"", a3, a4, a5, a6, a7, a8, (uint64_t)"rtadvd");
    goto LABEL_12;
  }
  v9 = dword_100035430;
  if (dword_100035430)
  {
    if (!qword_100035438)
      sub_100023C64();
    if (kill(dword_100035430, 0) != 3)
    {
      unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
      if (sub_1000207B0(v9, (dispatch_queue_t)qword_100035478))
      {
        sub_100003108(0, (uint64_t)"rtadvd monitor process failed for process queue", v10, v11, v12, v13, v14, v15, v114);
      }
      else
      {
        if (qword_100035438)
        {
          dispatch_source_cancel((dispatch_source_t)qword_100035438);
          dispatch_release((dispatch_object_t)qword_100035438);
          qword_100035438 = 0;
        }
        sub_100003108(2u, (uint64_t)"sending KILL to  \"%s\" pid %d", v10, v11, v12, v13, v14, v15, (uint64_t)"rtadvd");
        kill(v9, 9);
        dispatch_semaphore_wait((dispatch_semaphore_t)qword_100035420, 0xFFFFFFFFFFFFFFFFLL);
        dword_100035430 = 0;
      }
    }
  }
  v29 = (char **)malloc_type_malloc(8 * dword_1000354D4 + 48, 0x10040436913F5uLL);
  *v29 = "rtadvd";
  v29[1] = "-c";
  v29[2] = "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf";
  v29[3] = "-f";
  v29[4] = "-s";
  v30 = &qword_100035498;
  do
  {
    v30 = (uint64_t *)*v30;
    if (!v30)
    {
      v40 = qword_100035498;
      if (!qword_100035498)
      {
LABEL_48:
        v22 = 0;
        goto LABEL_146;
      }
      v41 = 0;
      v42 = 5;
      do
      {
        if (!*(_DWORD *)(v40 + 16)
          && *(_BYTE *)(v40 + 700)
          && *(_DWORD *)(v40 + 20) == 201
          && !strncmp((const char *)(v40 + 565), off_100034CB0[0], 0x10uLL))
        {
          if (!*(_BYTE *)(v40 + 1178))
            sub_100023C14();
          v29[v42++] = (char *)(v40 + 308);
          v41 = 1;
        }
        v40 = *(_QWORD *)v40;
      }
      while (v40);
      v43 = qword_100035498;
      if (!qword_100035498)
      {
LABEL_61:
        v29[v42] = 0;
        if ((v41 & 1) != 0)
          goto LABEL_31;
        goto LABEL_62;
      }
      while (1)
      {
        if (*(_BYTE *)(v43 + 1107))
        {
          if (*(_BYTE *)(v43 + 704))
            goto LABEL_54;
        }
        else if (*(_BYTE *)(v43 + 1105))
        {
LABEL_54:
          for (i = qword_100035498; i; i = *(_QWORD *)i)
          {
            if (*(_BYTE *)(i + 700)
              && *(_DWORD *)(i + 20) == 201
              && !strncmp((const char *)(i + 565), (const char *)(v43 + 308), 0x10uLL))
            {
              v29[v42++] = (char *)(i + 308);
              v41 = 1;
            }
          }
        }
        v43 = *(_QWORD *)v43;
        if (!v43)
          goto LABEL_61;
      }
    }
  }
  while (*((_DWORD *)v30 + 282) != 502);
  sub_100003108(1u, (uint64_t)"rtadvd: in nat64 mode", v23, v24, v25, v26, v27, v28, v114);
  v31 = &qword_100035498;
  do
  {
    v31 = (uint64_t *)*v31;
    if (!v31)
      goto LABEL_48;
  }
  while (*((_DWORD *)v31 + 4) != 1);
  v32 = qword_100035498;
  if (!qword_100035498)
    goto LABEL_48;
  v33 = 0;
  v34 = (char *)v31 + 308;
  v35 = 5;
  do
  {
    if (*(_BYTE *)(v32 + 700) && *(_DWORD *)(v32 + 20) == 201 && !strncmp((const char *)(v32 + 565), v34, 0x10uLL))
    {
      if (*(_DWORD *)(v32 + 1128) != 502)
        sub_100023C3C();
      v29[v35++] = (char *)(v32 + 308);
      v33 = 1;
    }
    v32 = *(_QWORD *)v32;
  }
  while (v32);
  v29[v35] = 0;
  if ((v33 & 1) == 0)
  {
LABEL_62:
    v22 = 0;
    goto LABEL_146;
  }
LABEL_31:
  snprintf((char *)__str, 0x100uLL, "%s-", "/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
  v36 = fopen((const char *)__str, "w");
  if (v36)
  {
    v37 = v36;
    v22 = qword_100035498;
    if (qword_100035498)
    {
      v38 = qword_100035498;
      while (*(_DWORD *)(v38 + 16) != 1 || !*(_BYTE *)(v38 + 564))
      {
        v38 = *(_QWORD *)v38;
        if (!v38)
        {
          v39 = 1;
          goto LABEL_66;
        }
      }
      if (strncmp((const char *)(v38 + 308), off_100034CB0[0], 0x10uLL))
        sub_100023BEC();
      v39 = 0;
      do
      {
LABEL_66:
        if (!*(_DWORD *)(v22 + 16)
          && *(_BYTE *)(v22 + 700)
          && *(_DWORD *)(v22 + 20) == 201
          && !strncmp((const char *)(v22 + 565), off_100034CB0[0], 0x10uLL))
        {
          if (!*(_BYTE *)(v22 + 1178))
            sub_100023BC4();
          fprintf(v37, "%s:\\\n", (const char *)(v22 + 308));
          fprintf(v37, "\t:maxinterval#%u", 135);
          fprintf(v37, ":mininterval#%u:\\\n", 45);
          fputc(9, v37);
          v51 = sub_10000E4E4(v22);
          v52 = dword_1000354BC;
          if (!v51 && dword_1000354BC)
          {
            fprintf(v37, ":raflags#%u", 64);
            v52 = dword_1000354BC;
          }
          v53 = v52 == 0;
          v54 = 9000;
          if (v53)
            v54 = 0;
          fprintf(v37, ":rltime#%u:\\\n", v54);
          fprintf(v37, "\t:addr=\"%s\":prefixlen#%u:pinfoflags#%u\\\n", (const char *)(v22 + 1132), *(unsigned __int8 *)(v22 + 1178), 192);
          if (*(_DWORD *)(v22 + 664) || *(_DWORD *)(v22 + 668) || *(_DWORD *)(v22 + 672) || *(_DWORD *)(v22 + 676))
          {
            fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v37);
            inet_ntop(30, (const void *)(v22 + 664), v122, 0x2Eu);
            fprintf(v37, "\t:rdnssaddr%d=\"%s\":\\\n", 0, v122);
          }
          if ((v39 & 1) == 0)
          {
            v55 = *(_DWORD *)(v38 + 296);
            if (v55 >= *(_DWORD *)(v22 + 296))
              v55 = *(_DWORD *)(v22 + 296);
            fprintf(v37, "\t:mtu#%u\n", v55);
          }
        }
        v22 = *(_QWORD *)v22;
      }
      while (v22);
      v56 = qword_100035498;
      if (qword_100035498)
      {
        while (2)
        {
          if (!*(_DWORD *)(v56 + 16))
            goto LABEL_133;
          v57 = *(unsigned __int8 *)(v56 + 1107);
          if (*(_BYTE *)(v56 + 1107))
          {
            if (!*(_BYTE *)(v56 + 704))
              goto LABEL_133;
          }
          else if (!*(_BYTE *)(v56 + 1105) && *(_DWORD *)(v56 + 1128) != 502)
          {
LABEL_133:
            v56 = *(_QWORD *)v56;
            if (!v56)
              goto LABEL_134;
            continue;
          }
          break;
        }
        v58 = qword_100035498;
        if (!qword_100035498)
          goto LABEL_133;
        v59 = (const char *)(v56 + 308);
        v60 = 848;
        if (!*(_BYTE *)(v56 + 1107))
          v60 = 296;
        v117 = v60;
        while (2)
        {
          if (*(_BYTE *)(v58 + 700)
            && *(_DWORD *)(v58 + 20) == 201
            && !strncmp((const char *)(v58 + 565), v59, 0x10uLL))
          {
            fprintf(v37, "%s:\\\n", (const char *)(v58 + 308));
            fprintf(v37, "\t:maxinterval#%u", 135);
            fprintf(v37, ":mininterval#%u:\\\n", 45);
            if (v57)
              fprintf(v37, "\t:chlim#%u", *(unsigned __int8 *)(v56 + 876));
            else
              fputc(9, v37);
            if (!sub_10000E4E4(v58) && *(_DWORD *)(v58 + 1128) != 502)
              fprintf(v37, ":raflags#%u", 64);
            if (v57)
            {
              v61 = *(unsigned __int16 *)(v56 + 814);
              if (v61 >= 0x2328)
                v61 = 9000;
              fprintf(v37, ":rltime#%u", v61);
              fprintf(v37, ":rtime#%u", 1000 * *(_DWORD *)(v56 + 860));
              fprintf(v37, ":retrans#%u:\\\n", *(_DWORD *)(v56 + 864));
              inet_ntop(30, (const void *)(v56 + 720), v122, 0x2Eu);
              if (*(_BYTE *)(v56 + 904))
              {
                fprintf(v37, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u", v122, *(unsigned __int8 *)(v56 + 741), 192);
                fprintf(v37, ":vltime0#%lu", *(_QWORD *)(v56 + 744));
                fwrite(":vltimedecr0#true", 0x11uLL, 1uLL, v37);
                fprintf(v37, ":pltime0#%lu", *(_QWORD *)(v56 + 752));
                fwrite(":pltimedecr0#true:\\\n", 0x14uLL, 1uLL, v37);
                inet_ntop(30, (const void *)(v56 + 920), v122, 0x2Eu);
                v59 = (const char *)(v56 + 308);
                fprintf(v37, "\t:addr1=\"%s\":prefixlen1#%u:pinfoflags1#%u", v122, *(unsigned __int8 *)(v56 + 741), 192);
                fwrite(":vltime1#0", 0xAuLL, 1uLL, v37);
                v62 = ":pltime1#0:\\\n";
                v63 = 13;
              }
              else
              {
                fprintf(v37, "\t:addr=\"%s\":prefixlen#%u:pinfoflags#%u", v122, *(unsigned __int8 *)(v56 + 741), 192);
                fprintf(v37, ":vltime#%lu", *(_QWORD *)(v56 + 744));
                fwrite(":vltimedecr#true", 0x10uLL, 1uLL, v37);
                fprintf(v37, ":pltime#%lu", *(_QWORD *)(v56 + 752));
                v62 = ":pltimedecr#true:\\\n";
                v63 = 19;
              }
              fwrite(v62, v63, 1uLL, v37);
              if (*(_DWORD *)(v56 + 1264) == 1 && !byte_100035483)
              {
                if (!inet_ntop(30, (const void *)(v56 + 1244), v121, 0x2Eu))
                {
                  v22 = *__error();
                  sub_100003108(0, (uint64_t)"%s: inet_ntop failed for nat64 prefix: %m", v92, v93, v94, v95, v96, v97, (uint64_t)"rtadvd_config_create");
                  fclose(v37);
                  v8 = byte_100034F58 + 168;
                  goto LABEL_137;
                }
LABEL_119:
                fprintf(v37, "\t:pref64addr=\"%s\":pref64len#%u:pref64lifetime#%u:\\\n");
              }
            }
            else
            {
              fprintf(v37, ":rltime#%u:\\\n", 9000);
              if (*(_DWORD *)(v58 + 1128) == 502)
              {
                fprintf(v37, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u:\\\n", (const char *)(v58 + 1132), 64, 192);
                if (!byte_100035483)
                  goto LABEL_119;
              }
              else
              {
                fprintf(v37, "\t:addr0=\"%s\":prefixlen0#%u:pinfoflags0#%u:\\\n");
              }
            }
            if (*(_DWORD *)(v58 + 664) || *(_DWORD *)(v58 + 668) || *(_DWORD *)(v58 + 672) || *(_DWORD *)(v58 + 676))
            {
              fwrite("\t:rdnssaddrs#1:\\\n", 0x11uLL, 1uLL, v37);
              v59 = (const char *)(v56 + 308);
              inet_ntop(30, (const void *)(v58 + 664), v122, 0x2Eu);
              fprintf(v37, "\t:rdnssaddr%d=\"%s\":\\\n", 0, v122);
            }
            else if (*(_DWORD *)(v58 + 1128) == 502)
            {
              sub_100003108(0, (uint64_t)"%s: IPv6 LL address not found", v64, v65, v66, v67, v68, v69, v58 + 308);
              v22 = 6;
              goto LABEL_135;
            }
            v70 = *(_DWORD *)(v58 + 296);
            if (*(_DWORD *)(v56 + v117) < v70)
              v70 = *(_DWORD *)(v56 + v117);
            fprintf(v37, "\t:mtu#%u\n", v70);
          }
          v58 = *(_QWORD *)v58;
          if (!v58)
            goto LABEL_133;
          continue;
        }
      }
LABEL_134:
      v22 = 0;
LABEL_135:
      v8 = &byte_100034F58[168];
    }
    fclose(v37);
    rename(__str, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf", v71);
  }
  else
  {
    v22 = *__error();
    sub_100003108(0, (uint64_t)"fopen(%s) failed: %m", v45, v46, v47, v48, v49, v50, (uint64_t)__str);
  }
LABEL_137:
  if ((_DWORD)v22)
  {
    v72 = strerror(v22);
    sub_100003108(0, (uint64_t)"rtadvd_config_create: %s", v73, v74, v75, v76, v77, v78, (uint64_t)v72);
  }
  else
  {
    v22 = sub_10000E9A8(&v119, &v120);
    if (!(_DWORD)v22)
    {
      v79 = posix_spawn(&v118, "/usr/sbin/rtadvd", &v120, &v119, v29, environ);
      v22 = v79;
      if ((_DWORD)v79)
      {
        strerror(v79);
        sub_100003108(0, (uint64_t)"spawn \"%s\":%s", v86, v87, v88, v89, v90, v91, (uint64_t)"rtadvd");
      }
      else
      {
        sub_100003108(1u, (uint64_t)"spawned \"%s\" as pid %d", v80, v81, v82, v83, v84, v85, (uint64_t)"rtadvd");
        v98 = v118;
        *((_DWORD *)v8 + 268) = v118;
        if (sub_1000207B0(v98, (dispatch_queue_t)qword_100035470))
        {
          v105 = sub_100003108(0, (uint64_t)"rtadvd monitor process error", v99, v100, v101, v102, v103, v104, v115);
          sub_100020884(v105, v106, v107, v108, v109, v110, v111, v112, v116);
        }
      }
      posix_spawnattr_destroy(&v119);
      posix_spawn_file_actions_destroy(&v120);
    }
  }
LABEL_146:
  free(v29);
  if (!(_DWORD)v22)
  {
LABEL_147:
    if (*((_DWORD *)v8 + 268))
      sub_100003108(0, (uint64_t)"started \"%s\"", v16, v17, v18, v19, v20, v21, (uint64_t)"rtadvd");
  }
  return v22;
}

uint64_t sub_1000207B0(int a1, dispatch_queue_t queue)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD handler[5];

  v3 = qword_100035478;
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a1, 0x80000000uLL, queue);
  v5 = v4;
  if (v3 == queue)
  {
    if (v4)
    {
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_1000209CC;
      handler[3] = &unk_100031060;
      handler[4] = v4;
      dispatch_source_set_event_handler(v4, handler);
      v6 = v5;
      goto LABEL_6;
    }
  }
  else
  {
    qword_100035438 = (uint64_t)v4;
    if (v4)
    {
      dispatch_source_set_event_handler(v4, &stru_1000310A0);
      v6 = qword_100035438;
LABEL_6:
      dispatch_resume(v6);
      return 0;
    }
  }
  return 12;
}

void sub_100020884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  pid_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = dword_100035430;
  if (dword_100035430 && kill(dword_100035430, 0) != 3)
  {
    unlink("/Library/Preferences/SystemConfiguration/com.apple.mis.rtadvd.conf");
    if (sub_1000207B0(v9, (dispatch_queue_t)qword_100035478))
    {
      sub_100003108(0, (uint64_t)"rtadvd monitor process failed for process queue", v10, v11, v12, v13, v14, v15, a9);
    }
    else
    {
      if (qword_100035438)
      {
        dispatch_source_cancel((dispatch_source_t)qword_100035438);
        dispatch_release((dispatch_object_t)qword_100035438);
        qword_100035438 = 0;
      }
      sub_100003108(2u, (uint64_t)"sending TERM to  \"%s\" pid %d", v10, v11, v12, v13, v14, v15, (uint64_t)"rtadvd");
      kill(v9, 15);
      dispatch_semaphore_wait((dispatch_semaphore_t)qword_100035420, 0xFFFFFFFFFFFFFFFFLL);
      dword_100035430 = 0;
    }
  }
}

void sub_100020968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if ((dword_10003542C & 0x80000000) == 0)
  {
    if (dword_10003542C < 2 || dword_100035430 == 0 || (_DWORD)qword_1000354D4 == 0)
      sub_100020884(a1, a2, a3, a4, a5, a6, a7, a8, v10);
    else
      sub_10001FB48(a1, a2, a3, a4, a5, a6, a7, a8);
    if (dword_10003542C >= 1)
      --dword_10003542C;
  }
}

intptr_t sub_1000209CC(uint64_t a1)
{
  pid_t data;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v10;

  v10 = 0;
  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  waitpid(data, &v10, 1);
  sub_100003108(2u, (uint64_t)"\"%s\" exit", v3, v4, v5, v6, v7, v8, (uint64_t)"rtadvd");
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  return dispatch_semaphore_signal((dispatch_semaphore_t)qword_100035420);
}

void sub_100020A40(id a1)
{
  pid_t data;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v8 = 0;
  data = dispatch_source_get_data((dispatch_source_t)qword_100035438);
  waitpid(data, &v8, 1);
  sub_100003108(2u, (uint64_t)"\"%s\" exit", v2, v3, v4, v5, v6, v7, (uint64_t)"rtadvd");
  if (dword_100035430)
  {
    dword_100035430 = 0;
    dispatch_source_cancel((dispatch_source_t)qword_100035438);
    dispatch_release((dispatch_object_t)qword_100035438);
    qword_100035438 = 0;
  }
}

uint64_t sub_100020ABC()
{
  if (dword_100034D40)
  {
    sub_10000F1A0((uint64_t)CFSTR("com.apple.dhcp6d"), (uint64_t)"dhcp6d", 0);
    byte_100035444 = 0;
    unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
  }
  return 0;
}

uint64_t sub_100020B10()
{
  uint64_t v0;
  int v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (dword_100035440 < 0)
  {
    v1 = -1;
    v0 = 2;
  }
  else
  {
    if (dword_100035440)
      goto LABEL_3;
    if (!dword_100034D40)
      return 0;
    if (access("/usr/libexec/dhcp6d", 0)
      && (v0 = *__error(),
          sub_100003108(0, (uint64_t)"\"%s\" not available", v3, v4, v5, v6, v7, v8, (uint64_t)"/usr/libexec/dhcp6d"),
          (_DWORD)v0))
    {
      v1 = -1;
    }
    else
    {
LABEL_3:
      v0 = 0;
      v1 = dword_100035440 + 1;
    }
  }
  dword_100035440 = v1;
  return v0;
}

uint64_t sub_100020BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFArray *Mutable;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFDictionary *v23;
  CFDictionaryRef v24;
  uid_t v25;
  gid_t v26;
  uint64_t v27;
  pid_t v28;
  uint64_t v29;
  int *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  unsigned __int8 v45;
  char *v47;
  void *keys;
  void *values;
  char v50[46];

  if (dword_100035440 < 0)
  {
    v47 = "dhcp6d";
    v16 = "\"%s\" not available";
LABEL_27:
    v45 = 1;
    goto LABEL_28;
  }
  if (!dword_100034D40)
  {
    v47 = "dhcp6d";
    v16 = "\"%s\" not enabled";
    goto LABEL_27;
  }
  if (!dword_1000354D4)
  {
    v16 = "no internal interfaces to start dhcpd";
    goto LABEL_27;
  }
  keys = 0;
  Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  values = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  for (i = qword_100035498; i; i = *(_QWORD *)i)
  {
    if (*(_BYTE *)(i + 700) && *(_DWORD *)(i + 20) == 201)
    {
      if (*(_DWORD *)(i + 664)
        || *(_DWORD *)(i + 668)
        || *(_DWORD *)(i + 672)
        || *(_DWORD *)(i + 676)
        || !sub_10000E4E4(i))
      {
        sub_10000EB50(Mutable, (const char *)(i + 308));
        inet_ntop(30, (const void *)(i + 664), v50, 0x2Eu);
        sub_10000EB50((const __CFArray *)values, v50);
      }
      else
      {
        sub_100003108(0, (uint64_t)"dhcp6d: can't get linklocal address on %s", v10, v11, v12, v13, v14, v15, i + 308);
      }
    }
  }
  if (!CFArrayGetCount(Mutable))
  {
    sub_100003108(0, (uint64_t)"dhcp6d: no enabled interfaces", v17, v18, v19, v20, v21, v22, (uint64_t)v47);
    CFRelease(Mutable);
    CFRelease(values);
    v27 = 22;
LABEL_30:
    v47 = strerror(v27);
    v44 = "dhcp6d_config_create: %s";
    goto LABEL_31;
  }
  v23 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v23, CFSTR("enabled_interfaces"), Mutable);
  CFRelease(Mutable);
  keys = CFSTR("dhcp_dns_servers");
  v24 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(values);
  CFDictionarySetValue(v23, CFSTR("options"), v24);
  CFRelease(v24);
  if (byte_100035480)
    CFDictionarySetValue(v23, CFSTR("verbose"), kCFBooleanTrue);
  v25 = geteuid();
  v26 = getgid();
  v27 = sub_10000EC98(v23, (const std::__fs::filesystem::path *)"/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist", v25, v26, 420, 0);
  CFRelease(v23);
  if ((_DWORD)v27)
    goto LABEL_30;
  if (byte_100035444 != 1)
  {
    v27 = sub_10000F1A0((uint64_t)CFSTR("com.apple.dhcp6d"), (uint64_t)"dhcp6d", 1);
    if (!(_DWORD)v27)
    {
      byte_100035444 = 1;
      sub_100003108(0, (uint64_t)"started \"%s\"", v38, v39, v40, v41, v42, v43, (uint64_t)"dhcp6d");
      return v27;
    }
    v44 = "unable to load dhcp6d job";
    goto LABEL_31;
  }
  v28 = sub_10000C98C("/usr/libexec/dhcp6d");
  if (v28)
  {
    v29 = kill(v28, 1);
    if ((_DWORD)v29)
    {
      v27 = v29;
      v30 = __error();
      v31 = strerror(*v30);
      sub_100003108(0, (uint64_t)"dhcp6d(HUP): %s", v32, v33, v34, v35, v36, v37, (uint64_t)v31);
      v47 = strerror(v27);
      v44 = "dhcp6d_sighup failed: %s";
LABEL_31:
      sub_100003108(0, (uint64_t)v44, v38, v39, v40, v41, v42, v43, (uint64_t)v47);
      return v27;
    }
  }
  v16 = "dhcp6d_sighup succeeded";
  v45 = 0;
LABEL_28:
  sub_100003108(v45, (uint64_t)v16, a3, a4, a5, a6, a7, a8, (uint64_t)v47);
  return 0;
}

uint64_t sub_100020F6C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((dword_100035440 & 0x80000000) == 0)
  {
    if (dword_100035440 < 2 || (_DWORD)qword_1000354D4 == 0)
    {
      sub_10000F1A0((uint64_t)CFSTR("com.apple.dhcp6d"), (uint64_t)"dhcp6d", 0);
      byte_100035444 = 0;
      result = unlink("/Library/Preferences/SystemConfiguration/com.apple.dhcp6d.plist");
    }
    else
    {
      result = sub_100020BC0(result, a2, a3, a4, a5, a6, a7, a8);
    }
    if (dword_100035440 >= 1)
      --dword_100035440;
  }
  return result;
}

xpc_object_t sub_100020FEC()
{
  ifaddrs *v0;
  xpc_object_t v1;
  unsigned __int8 *ifa_data;
  int v3;
  const char *ifa_name;
  CFStringRef v5;
  const void *v6;
  CFStringRef InterfaceType;
  CFStringRef v8;
  int v9;
  int IsPhysicalEthernet;
  ifaddrs *v11;
  ifaddrs *v13;

  v13 = 0;
  if (getifaddrs(&v13) == -1)
    return 0;
  v0 = v13;
  if (v13)
  {
    v1 = 0;
    while (1)
    {
      if (v0->ifa_addr->sa_family == 18)
      {
        ifa_data = (unsigned __int8 *)v0->ifa_data;
        if (ifa_data)
        {
          v3 = *ifa_data;
          ifa_name = v0->ifa_name;
          if ((v3 - 135) < 2)
            goto LABEL_7;
          if (v3 == 6)
          {
            v5 = CFStringCreateWithCString(0, v0->ifa_name, 0x8000100u);
            v6 = (const void *)_SCNetworkInterfaceCreateWithBSDName(0, v5, 0);
            CFRelease(v5);
            if (v6)
            {
              if (_SCNetworkInterfaceSupportsVMNETBridgedMode(v6))
              {
                CFRelease(v6);
LABEL_7:
                if (!v1)
                  v1 = xpc_array_create(0, 0);
                xpc_array_set_string(v1, 0xFFFFFFFFFFFFFFFFLL, ifa_name);
                goto LABEL_16;
              }
              if (_SCNetworkInterfaceIsHiddenConfiguration(v6)
                || (InterfaceType = SCNetworkInterfaceGetInterfaceType((SCNetworkInterfaceRef)v6)) == 0)
              {
LABEL_15:
                CFRelease(v6);
                goto LABEL_16;
              }
              v8 = InterfaceType;
              if (CFEqual(InterfaceType, kSCNetworkInterfaceTypeIEEE80211))
              {
                v9 = strncmp(ifa_name, "en", 2uLL);
                CFRelease(v6);
                if (!v9)
                  goto LABEL_7;
              }
              else
              {
                if (!CFEqual(v8, kSCNetworkInterfaceTypeEthernet) || _SCNetworkInterfaceIsTethered(v6))
                  goto LABEL_15;
                IsPhysicalEthernet = _SCNetworkInterfaceIsPhysicalEthernet(v6);
                CFRelease(v6);
                if (IsPhysicalEthernet)
                  goto LABEL_7;
              }
            }
          }
        }
      }
LABEL_16:
      v0 = v0->ifa_next;
      if (!v0)
      {
        v11 = v13;
        goto LABEL_28;
      }
    }
  }
  v11 = 0;
  v1 = 0;
LABEL_28:
  freeifaddrs(v11);
  return v1;
}

void sub_1000211C8()
{
  if (dword_100034D34)
    byte_100035448 = 1;
}

void sub_1000211E8()
{
  if (byte_100035448 == 1)
    byte_100035448 = 0;
}

uint64_t sub_100021200(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  xpc_object_t v26;
  void *v27;
  size_t count;
  size_t v29;
  size_t i;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44;
  size_t v45;
  char v46;
  const char *string;
  void *v48;
  size_t v49;
  unint64_t v50;
  const char *v51;
  size_t v52;
  const char *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  size_t v63;
  size_t v64;
  size_t j;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  if (dword_100034D34)
  {
    v10 = (const char *)(a1 + 308);
    v11 = &qword_1000354E0;
    while (1)
    {
      v11 = (uint64_t *)*v11;
      if (!v11)
        break;
      if (!strncmp((const char *)v11 + 8, v10, 0x10uLL))
        goto LABEL_13;
    }
    v18 = (uint64_t *)malloc_type_malloc(0x40uLL, 0x10A004087B56009uLL);
    if (v18)
    {
      v11 = v18;
      *((_OWORD *)v18 + 2) = 0u;
      *((_OWORD *)v18 + 3) = 0u;
      *(_OWORD *)v18 = 0u;
      *((_OWORD *)v18 + 1) = 0u;
      v25 = *(_DWORD *)(a1 + 1128) == 502;
      *((_DWORD *)v18 + 11) = v25;
      if (v25)
      {
        sub_100003108(0, (uint64_t)"%s: dns64 is supported only on macOS", v19, v20, v21, v22, v23, v24, (uint64_t)"dns_proxy_insert_interfaces");
        if (*((_DWORD *)v11 + 11))
          sub_100023CB4();
      }
      v26 = xpc_array_create(0, 0);
      v11[4] = (uint64_t)v26;
      if (v26)
      {
        snprintf((char *)v11 + 8, 0x10uLL, "%s", v10);
        *v11 = qword_1000354E0;
        qword_1000354E0 = (uint64_t)v11;
        ++dword_10003544C;
LABEL_13:
        sub_100003108(2u, (uint64_t)"%s: before:", v12, v13, v14, v15, v16, v17, (uint64_t)"dns_proxy_insert_interfaces");
        v27 = (void *)v11[4];
        if (v27)
        {
          count = xpc_array_get_count((xpc_object_t)v11[4]);
          if (count)
          {
            v29 = count;
            for (i = 0; i != v29; ++i)
            {
              xpc_array_get_string(v27, i);
              sub_100003108(2u, (uint64_t)"%ld. %s", v31, v32, v33, v34, v35, v36, i);
            }
          }
        }
        v37 = xpc_array_get_count(a2);
        if (v37)
        {
          v44 = v37;
          v45 = 0;
          v46 = 0;
          while (1)
          {
            string = xpc_array_get_string(a2, v45);
            v48 = (void *)v11[4];
            v49 = xpc_array_get_count(v48);
            if (!v49)
              goto LABEL_25;
            v50 = v49;
            v51 = xpc_array_get_string(v48, 0);
            if (strcmp(v51, string))
              break;
LABEL_27:
            if (++v45 == v44)
              goto LABEL_30;
          }
          v52 = 1;
          while (v50 != v52)
          {
            v53 = xpc_array_get_string(v48, v52++);
            if (!strcmp(v53, string))
            {
              if (v52 - 1 < v50)
                goto LABEL_27;
              break;
            }
          }
LABEL_25:
          xpc_array_set_string((xpc_object_t)v11[4], 0xFFFFFFFFFFFFFFFFLL, string);
          v54 = *((_DWORD *)v11 + 10);
          *((_DWORD *)v11 + 10) = v54 + 1;
          if (v54 == -1)
            sub_100023C8C();
          v46 = 1;
          goto LABEL_27;
        }
        v46 = 0;
LABEL_30:
        sub_100003108(2u, (uint64_t)"%s: after:", v38, v39, v40, v41, v42, v43, (uint64_t)"dns_proxy_insert_interfaces");
        v62 = (void *)v11[4];
        if (v62)
        {
          v63 = xpc_array_get_count((xpc_object_t)v11[4]);
          if (v63)
          {
            v64 = v63;
            for (j = 0; j != v64; ++j)
            {
              xpc_array_get_string(v62, j);
              sub_100003108(2u, (uint64_t)"%ld. %s", v66, v67, v68, v69, v70, v71, j);
            }
          }
        }
        if ((v46 & 1) != 0)
          return sub_100021534((uint64_t)v11, v55, v56, v57, v58, v59, v60, v61);
        return 0;
      }
      free(v11);
    }
    v73 = 12;
    strerror(12);
    sub_100003108(0, (uint64_t)"%s, dns insert failed %s", v74, v75, v76, v77, v78, v79, (uint64_t)v10);
    return v73;
  }
  sub_100003108(2u, (uint64_t)"\"dns proxy\" not enabled", a3, a4, a5, a6, a7, a8, v80);
  return 0;
}

uint64_t sub_100021534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int64_t count;
  int64_t v19;
  size_t v20;
  const char *string;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD v57[5];
  unsigned int v58;

  v58 = -1;
  if (!dword_100034D34)
  {
    v16 = "dns proxy not enabled";
LABEL_9:
    sub_100003108(2u, (uint64_t)v16, a3, a4, a5, a6, a7, a8, v56);
    return v58;
  }
  if (!*(_DWORD *)(a1 + 40))
  {
    v16 = "no internal interfaces to start dns proxy";
    goto LABEL_9;
  }
  v15 = mrc_dns_proxy_parameters_create(&v58);
  if (v58)
  {
    sub_100003108(0, (uint64_t)"%s: mrc_dns_proxy_parameters_create failed, %d", v9, v10, v11, v12, v13, v14, (uint64_t)"dns_proxy_start");
    goto LABEL_5;
  }
  count = xpc_array_get_count(*(xpc_object_t *)(a1 + 32));
  if (count < 1)
  {
LABEL_15:
    if (!strncmp((const char *)(a1 + 8), off_100034CB0[0], 0x10uLL))
    {
      v29 = 0;
    }
    else
    {
      v29 = if_nametoindex((const char *)(a1 + 8));
      if (!(_DWORD)v29)
      {
        sub_100003108(0, (uint64_t)"%s: external interface %s does not exist", v30, v31, v32, v33, v34, v35, (uint64_t)"dns_proxy_start");
        goto LABEL_5;
      }
    }
    mrc_dns_proxy_parameters_set_output_interface(v15, v29);
    if (*(_DWORD *)(a1 + 44))
    {
      sub_100003108(0, (uint64_t)"%s: dns64 only supported on macOS", v36, v37, v38, v39, v40, v41, (uint64_t)"dns_proxy_start");
      if (*(_DWORD *)(a1 + 44))
        sub_100023CDC();
    }
    if (*(_QWORD *)(a1 + 24))
    {
      mrc_dns_proxy_invalidate();
      *(_QWORD *)(a1 + 24) = 0;
    }
    v42 = mrc_dns_proxy_create(v15, &v58);
    if (v42)
    {
      v49 = v42;
      mrc_dns_proxy_set_queue(v42, qword_100035470);
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 0x40000000;
      v57[2] = sub_100021AC0;
      v57[3] = &unk_1000310C0;
      v57[4] = v49;
      mrc_dns_proxy_set_event_handler(v49, v57);
      mrc_dns_proxy_activate(v49);
      sub_100003108(0, (uint64_t)"%s: DNS proxy %p external interface %s", v50, v51, v52, v53, v54, v55, (uint64_t)"dns_proxy_start");
      *(_QWORD *)(a1 + 24) = v49;
      v58 = 0;
      if (!v15)
        return v58;
      goto LABEL_6;
    }
    sub_100003108(0, (uint64_t)"%s: mrc_dns_proxy_create() failed, %d", v43, v44, v45, v46, v47, v48, (uint64_t)"dns_proxy_start");
  }
  else
  {
    v19 = count;
    v20 = 0;
    while (1)
    {
      string = xpc_array_get_string(*(xpc_object_t *)(a1 + 32), v20);
      v22 = if_nametoindex(string);
      if (!(_DWORD)v22)
        break;
      mrc_dns_proxy_parameters_add_input_interface(v15, v22);
      if (v19 == ++v20)
        goto LABEL_15;
    }
    sub_100003108(0, (uint64_t)"%s: internal interface %s does not exist", v23, v24, v25, v26, v27, v28, (uint64_t)"dns_proxy_start");
  }
LABEL_5:
  if (v15)
LABEL_6:
    mrc_release(v15);
  return v58;
}

uint64_t sub_100021790(char *__s2, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t *v10;
  uint64_t *v11;
  void *v12;
  size_t count;
  size_t v14;
  size_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  xpc_object_t v23;
  size_t v24;
  size_t v25;
  size_t v26;
  int v27;
  const char *string;
  size_t v29;
  unint64_t v30;
  const char *v31;
  size_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  unsigned __int8 v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  size_t v51;
  size_t v52;
  size_t j;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  int v61;
  uint64_t v62;
  uint64_t *k;
  char *v64;

  if (!dword_100034D34)
  {
    v40 = "\"dns proxy\" not enabled";
    v41 = 2;
LABEL_24:
    sub_100003108(v41, (uint64_t)v40, a3, a4, a5, a6, a7, a8, (uint64_t)v64);
    return 22;
  }
  v10 = &qword_1000354E0;
  v11 = &qword_1000354E0;
  do
  {
    v11 = (uint64_t *)*v11;
    if (!v11)
    {
      v64 = __s2;
      v40 = "%s, dns lookup external failed";
      v41 = 0;
      goto LABEL_24;
    }
  }
  while (strncmp((const char *)v11 + 8, __s2, 0x10uLL));
  sub_100003108(2u, (uint64_t)"%s: before:", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_remove_interfaces");
  v12 = (void *)v11[4];
  if (v12)
  {
    count = xpc_array_get_count((xpc_object_t)v11[4]);
    if (count)
    {
      v14 = count;
      for (i = 0; i != v14; ++i)
      {
        xpc_array_get_string(v12, i);
        sub_100003108(2u, (uint64_t)"%ld. %s", v16, v17, v18, v19, v20, v21, i);
      }
    }
  }
  v22 = (void *)v11[4];
  v23 = xpc_array_create(0, 0);
  v24 = xpc_array_get_count(v22);
  if (!v24)
  {
    v27 = 0;
LABEL_27:
    xpc_release(v23);
    goto LABEL_28;
  }
  v25 = v24;
  v26 = 0;
  v27 = 0;
  while (2)
  {
    string = xpc_array_get_string(v22, v26);
    v29 = xpc_array_get_count(a2);
    if (v29)
    {
      v30 = v29;
      v31 = xpc_array_get_string(a2, 0);
      if (strcmp(v31, string))
      {
        v32 = 1;
        while (v30 != v32)
        {
          v33 = xpc_array_get_string(a2, v32++);
          if (!strcmp(v33, string))
          {
            if (v32 - 1 >= v30)
              goto LABEL_18;
            goto LABEL_17;
          }
        }
        goto LABEL_18;
      }
LABEL_17:
      ++v27;
    }
    else
    {
LABEL_18:
      xpc_array_set_string(v23, 0xFFFFFFFFFFFFFFFFLL, string);
    }
    if (++v26 != v25)
      continue;
    break;
  }
  if (v27 <= 0)
  {
    v10 = &qword_1000354E0;
    goto LABEL_27;
  }
  xpc_release(v22);
  v11[4] = (uint64_t)v23;
  v10 = &qword_1000354E0;
LABEL_28:
  sub_100003108(2u, (uint64_t)"%s: after:", v34, v35, v36, v37, v38, v39, (uint64_t)"dns_proxy_remove_interfaces");
  v50 = (void *)v11[4];
  if (v50)
  {
    v51 = xpc_array_get_count((xpc_object_t)v11[4]);
    if (v51)
    {
      v52 = v51;
      for (j = 0; j != v52; ++j)
      {
        xpc_array_get_string(v50, j);
        sub_100003108(2u, (uint64_t)"%ld. %s", v54, v55, v56, v57, v58, v59, j);
      }
    }
  }
  if (v27 >= 1)
  {
    v60 = *((_DWORD *)v11 + 10);
    v61 = v60 - v27;
    if (v60 < v27)
      sub_100023D04();
    *((_DWORD *)v11 + 10) = v61;
    v62 = v11[3];
    if (v61 < 1)
    {
      if (v62)
      {
        sub_100003108(0, (uint64_t)"%s: DNS Proxy stop %p", v44, v45, v46, v47, v48, v49, (uint64_t)"dns_proxy_stop");
        mrc_dns_proxy_invalidate(v11[3]);
        v11[3] = 0;
      }
    }
    else if (v62)
    {
      sub_100021534((uint64_t)v11, v43, v44, v45, v46, v47, v48, v49);
    }
    if (!*((_DWORD *)v11 + 10))
    {
      for (k = (uint64_t *)qword_1000354E0; k != v11; k = (uint64_t *)*k)
        v10 = k;
      *v10 = *v11;
      if (!dword_10003544C)
        sub_100023D2C();
      --dword_10003544C;
      xpc_release((xpc_object_t)v11[4]);
      free(v11);
    }
  }
  return 0;
}

uint64_t sub_100021AC0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = *(_QWORD *)(a1 + 32);
  switch(a2)
  {
    case -1:
      v9 = a3;
      sub_100003108(0, (uint64_t)"%s: %p %s", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_handle_event");
      mrc_release(v8);
      if (v9)
        result = sub_100003108(0, (uint64_t)"%s: dns proxy failed %d", v10, v11, v12, v13, v14, v15, (uint64_t)"dns_proxy_handle_event");
      else
        result = sub_100003108(0, (uint64_t)"%s: dns proxy all done", v10, v11, v12, v13, v14, v15, (uint64_t)"dns_proxy_handle_event");
      break;
    default:
      result = sub_100003108(0, (uint64_t)"%s: %p %s", a3, a4, a5, a6, a7, a8, (uint64_t)"dns_proxy_handle_event");
      break;
  }
  return result;
}

void sub_100021BB0(_QWORD *a1)
{
  uint8_t v2[16];

  *(_WORD *)v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v2, 2u);
  *a1 = qword_100034EB8;
}

void sub_100021C0C()
{
  __assert_rtn("mis_create_nexus_controller", "mis_lowlatency.c", 542, "nexus_controller_handle == NULL");
}

void sub_100021C34()
{
  __assert_rtn("mis_lowlatency_remove_descriptor_from_nexus", "mis_lowlatency.c", 343, "descriptor->device_id_list_size > 0");
}

void sub_100021C5C()
{
  __assert_rtn("mis_lowlatency_remove_descriptor_from_nexus", "mis_lowlatency.c", 354, "descriptor_list_size > 0");
}

void sub_100021C84()
{
  __assert_rtn("mis_query_descriptor_handler", "mis_lowlatency.c", 122, "descriptor_iter->remaining_time > 0");
}

void sub_100021CAC()
{
  __assert_rtn("netrbServiceRequestAdd", "mis_rpc.c", 57, "mis_nsvc_request != 0");
}

void sub_100021CD4()
{
  __assert_rtn("netrbServiceRequestAdd", "mis_rpc.c", 48, "service != NULL && connection != NULL && reply != NULL && m != NULL");
}

void sub_100021CFC()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 68, "m != NULL");
}

void sub_100021D24()
{
  __assert_rtn("netrbServiceRequestRemove", "mis_rpc.c", 73, "mis_nsvc_request != 0");
}

void sub_100021D4C()
{
  __assert_rtn("netrbCreateInterface", "mis_rpc.c", 1144, "mis_vmnet_interfaces_cnt > 0");
}

void sub_100021D74()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 245, "mis_nsvc != 0");
}

void sub_100021D9C()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 221, "m->ms_bridge->mi_delete != NULL");
}

void sub_100021DC4()
{
  __assert_rtn("mis_svc_release", "mis_impl.c", 208, "m->ms_svcstate == MIS_SVC_IDLE");
}

void sub_100021DEC()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3447, "mif->mi_refcnt != 0");
}

void sub_100021E14()
{
  __assert_rtn("mis_if_release", "mis_impl.c", 3455, "mis_nif != 0");
}

void sub_100021E3C()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 386, "natInfo != NULL");
}

void sub_100021E64()
{
  __assert_rtn("mis_svc_create", "mis_impl.c", 568, "mis_nsvc != 0");
}

void sub_100021E8C()
{
  __assert_rtn("mis_is_bridgeable", "mis_impl.c", 4332, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_100021EB4()
{
  __assert_rtn("mis_if_lookup", "mis_impl.c", 3316, "mif->mi_refcnt != 0");
}

void sub_100021EDC()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4577, "ifname != NULL");
}

void sub_100021F04()
{
  __assert_rtn("mis_getifmtu", "mis_impl.c", 4578, "ifname[0] != '\\0'");
}

void sub_100021F2C()
{
  __assert_rtn("mis_if_get_extif", "mis_impl.c", 3491, "mif->mi_refcnt != 0");
}

void sub_100021F54()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3376, "natInfo != NULL");
}

void sub_100021F7C()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3419, "mis_nif != 0");
}

void sub_100021FA4()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3352, "!(if_address_fixed && saddr != NULL)");
}

void sub_100021FCC()
{
  __assert_rtn("mis_if_create", "mis_impl.c", 3341, "iftype == MIS_IFTYPE_PDP || iftype == MIS_IFTYPE_AUTH || iftype == MIS_IFTYPE_BROADCAST || iftype == MIS_IFTYPE_BROADCAST_LOCAL || iftype == MIS_IFTYPE_BRIDGE");
}

void sub_100021FF4()
{
  __assert_rtn("mis_if_get_bridge", "mis_impl.c", 3565, "mif->mi_refcnt != 0");
}

void sub_10002201C()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 734, "mif_ext->mi_class == MIS_IFCLASS_EXT && result != EINPROGRESS");
}

void sub_100022044()
{
  __assert_rtn("mis_svc_complete", "mis_impl.c", 738, "m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_10002206C()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 630, "mif_int->mi_add != NULL");
}

void sub_100022094()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 652, "mif_int != NULL && mif_int->mi_start != NULL");
}

void sub_1000220BC()
{
  __assert_rtn("mis_svc_start_internal_interface", "mis_impl.c", 611, "!m->ms_ext->mi_prefix_sharing");
}

void sub_1000220E4()
{
  __assert_rtn("mis_send_svc_usage_event", "mis_impl.c", 5784, "now >= ms->ms_start_time");
}

void sub_10002210C()
{
  __assert_rtn("mis_svc_start_external_interface", "mis_impl.c", 590, "m->ms_ext != NULL && m->ms_ext->mi_start != NULL");
}

void sub_100022134()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 865, "mc->mc_mis == NULL");
}

void sub_10002215C()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 863, "m->ms_client == NULL");
}

void sub_100022184()
{
  __assert_rtn("mis_svc_start", "mis_impl.c", 861, "err != EINPROGRESS || m->ms_svcstate == MIS_SVC_STARTING");
}

void sub_1000221AC()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1194, "mis_nnwi_ipv6 != 0");
}

void sub_1000221D4()
{
  __assert_rtn("nwi_notification_cleanup", "mis_impl.c", 1188, "mis_nnwi != 0");
}

void sub_1000221FC()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2233, "mif->mi_name[0] != '\\0'");
}

void sub_100022224()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2234, "!mif->mi_any_external");
}

void sub_10002224C()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2232, "mif->mi_mode == NETRB_INTERNET_SHARING_MODE");
}

void sub_100022274()
{
  __assert_rtn("mis_setup_external_listeners", "mis_impl.c", 2231, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_10002229C()
{
  __assert_rtn("mis_listen_prefix_events", "mis_impl.c", 2158, "mif_ext->mi_prefix_sharing");
}

void sub_1000222C4()
{
  __assert_rtn("mis_listen_prefix_events", "mis_impl.c", 2157, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_1000222EC()
{
  __assert_rtn("mis_cleanup_external_listeners", "mis_impl.c", 2253, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022314()
{
  __assert_rtn("mis_process_v6_prefix_change", "mis_impl.c", 1907, "mif_ext->mi_prefix_sharing");
}

void sub_10002233C()
{
  __assert_rtn("mis_process_v6_addr_change", "mis_impl.c", 1576, "!mif_ext->mi_prefix_sharing");
}

void sub_100022364()
{
  __assert_rtn("mis_netrb_remote_connection_lookup", "mis_impl.c", 2827, "ne->ne_refcnt");
}

void sub_10002238C()
{
  __assert_rtn("mis_netrb_remote_connection_release", "mis_impl.c", 2860, "ne->ne_refcnt != 0");
}

void sub_1000223B4()
{
  __assert_rtn("mis_netrb_remote_connection_release", "mis_impl.c", 2874, "mis_nepoint > 0");
}

void sub_1000223DC()
{
  __assert_rtn("mis_netrb_remote_connection_create", "mis_impl.c", 2963, "mis_nepoint != 0");
}

void sub_100022404()
{
  __assert_rtn("mis_netrb_remote_connection_lookup_no_ref", "mis_impl.c", 2886, "ne->ne_refcnt");
}

void sub_10002242C()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3015, "mis_nclient != 0");
}

void sub_100022454()
{
  __assert_rtn("mis_client_create", "mis_impl.c", 3022, "mis_xpc_transaction == NULL");
}

void sub_10002247C()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3058, "mis_nclient != 0");
}

void sub_1000224A4()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3092, "mis_xpc_transaction != NULL");
}

void sub_1000224CC()
{
  __assert_rtn("mis_client_remove_vmnet_interface", "mis_impl.c", 3143, "mis_vmnet_interfaces_cnt > 0");
}

void sub_1000224F4()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3073, "mc->mc_mis == NULL");
}

void sub_10002251C()
{
  __assert_rtn("mis_client_release", "mis_impl.c", 3071, "mc->mc_mis->ms_client == mc");
}

void sub_100022544()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3162, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_10002256C()
{
  __assert_rtn("mis_client_add_host", "mis_impl.c", 3195, "mc->mc_host_count[iftype] != 0");
}

void sub_100022594()
{
  __assert_rtn("mis_client_remove_host", "mis_impl.c", 3206, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000225BC()
{
  __assert_rtn("mis_client_set_host_count", "mis_impl.c", 3289, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000225E4()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3821, "err != 0");
}

void sub_10002260C()
{
  __assert_rtn("mis_vmnet_interface_attached_callback", "mis_impl.c", 3763, "interface_network_mask != NULL");
}

void sub_100022634()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4197, "ifname != NULL");
}

void sub_10002265C()
{
  __assert_rtn("interface_back_attach", "mis_impl.c", 4198, "ifname[0] != '\\0'");
}

void sub_100022684()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4394, "ifname != NULL");
}

void sub_1000226AC()
{
  __assert_rtn("mis_protoattach", "mis_impl.c", 4395, "ifname[0] != '\\0'");
}

void sub_1000226D4()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4430, "ifname != NULL");
}

void sub_1000226FC()
{
  __assert_rtn("mis_protoattach6", "mis_impl.c", 4431, "ifname[0] != '\\0'");
}

void sub_100022724()
{
  __assert_rtn("interface_back", "mis_impl.c", 4226, "ifname != NULL");
}

void sub_10002274C()
{
  __assert_rtn("interface_back", "mis_impl.c", 4227, "ifname[0] != '\\0'");
}

void sub_100022774()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4275, "ifname != NULL");
}

void sub_10002279C()
{
  __assert_rtn("interface_quiesce", "mis_impl.c", 4276, "ifname[0] != '\\0'");
}

void sub_1000227C4()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4467, "ifname != NULL");
}

void sub_1000227EC()
{
  __assert_rtn("mis_protodetach", "mis_impl.c", 4468, "ifname[0] != '\\0'");
}

void sub_100022814()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4502, "ifname != NULL");
}

void sub_10002283C()
{
  __assert_rtn("mis_protodetach6", "mis_impl.c", 4503, "ifname[0] != '\\0'");
}

void sub_100022864()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4312, "ifname != NULL");
}

void sub_10002288C()
{
  __assert_rtn("interface_quiesce_detach", "mis_impl.c", 4313, "ifname[0] != '\\0'");
}

void sub_1000228B4()
{
  __assert_rtn("mis_get_interface_flags", "mis_impl.c", 4369, "ifname != NULL && ifname[0] != '\\0'");
}

void sub_1000228DC()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4538, "ifname != NULL");
}

void sub_100022904()
{
  __assert_rtn("mis_setifmtu", "mis_impl.c", 4539, "ifname[0] != '\\0'");
}

void sub_10002292C()
{
  __assert_rtn("mis_is_interface_ppp", "mis_impl.c", 4923, "mask != NULL");
}

void sub_100022954()
{
  __assert_rtn("mis_get_linklocal", "mis_impl.c", 4961, "mif->mi_name[0] != '\\0'");
}

void sub_10002297C()
{
  __assert_rtn("mis_nwi_process_state", "mis_impl.c", 1019, "mis_nnwi > 0");
}

void sub_1000229A4()
{
  __assert_rtn("mis_nwi_process_state", "mis_impl.c", 1022, "mis_nnwi_ipv6 > 0");
}

void sub_1000229CC()
{
  __assert_rtn("mis_nwi_process_state", "mis_impl.c", 960, "af == AF_INET6");
}

void sub_1000229F4()
{
  __assert_rtn("mis_prefix_event_process", "mis_impl.c", 2085, "mif_ext->mi_prefix_sharing");
}

void sub_100022A1C()
{
  __assert_rtn("mis_capture_prefix_info", "mis_impl.c", 2058, "mif_ext->mi_prefix_sharing");
}

void sub_100022A44()
{
  __assert_rtn("mis_get_prefix_router", "mis_impl.c", 2559, "mif_ext->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022A6C()
{
  __assert_rtn("mis_dynamic_store_changed", "mis_impl.c", 1669, "mif_ext != NULL");
}

void sub_100022A94()
{
  __assert_rtn("mis_dynamic_store_changed", "mis_impl.c", 1714, "mif_ext->mi_prefix_sharing");
}

void sub_100022ABC()
{
  __assert_rtn("mis_pdp_context_validate", "mis_pdp.c", 318, "mis_pdp_refcnt > 0");
}

void sub_100022AE4()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 293, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022B0C()
{
  __assert_rtn("mis_pdp_init", "mis_pdp.c", 292, "mif->mi_class == MIS_IFCLASS_EXT");
}

void sub_100022B34()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 470, "mis_pdp_refcnt != 0");
}

void sub_100022B5C()
{
  __assert_rtn("mis_pdp_start", "mis_pdp.c", 469, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022B84()
{
  __assert_rtn("mis_pdp_stop", "mis_pdp.c", 483, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022BAC()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 341, "mis_pdp_refcnt != 0");
}

void sub_100022BD4()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 350, "!mif->mi_pdp_valid");
}

void sub_100022BFC()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 349, "mif->mi_SCDynamicStore == NULL");
}

void sub_100022C24()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 348, "mif->mi_prefixDispatchSource == NULL");
}

void sub_100022C4C()
{
  __assert_rtn("mis_pdp_context_cleanup", "mis_pdp.c", 339, "mif->mi_type == MIS_IFTYPE_PDP");
}

void sub_100022C74()
{
  __assert_rtn("mis_pdp_context_invalidate", "mis_pdp.c", 358, "mif->mi_type == MIS_IFTYPE_PDP || mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_100022C9C()
{
  __assert_rtn("mis_pdp_context_invalidate", "mis_pdp.c", 359, "!all || mis_pdp_refcnt == 0");
}

void sub_100022CC4()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 250, "mif->mi_nat_param.ni_nattype != NETRB_NONAT");
}

void sub_100022CEC()
{
  __assert_rtn("mis_bcast_init", "mis_bcast.c", 251, "nat64 || nat66 != mif->mi_prefix_sharing");
}

void sub_100022D14()
{
  __assert_rtn("mis_bcast_start", "mis_bcast.c", 879, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022D3C()
{
  __assert_rtn("mis_bcast_start", "mis_bcast.c", 950, "mis_setup_cnt > 0");
}

void sub_100022D64()
{
  __assert_rtn("mis_bcast_start", "mis_bcast.c", 895, "mis_setup_cnt > 0");
}

void sub_100022D8C()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 992, "mis_setup_cnt > 0");
}

void sub_100022DB4()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 995, "mis_setup_local_cnt > 0");
}

void sub_100022DDC()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 970, "mif->mi_notify == NULL");
}

void sub_100022E04()
{
  __assert_rtn("mis_bcast_stop", "mis_bcast.c", 969, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022E2C()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1064, "mif_int->mi_class == MIS_IFCLASS_INT && (mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE)");
}

void sub_100022E54()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1073, "mis_setup_cnt > 0");
}

void sub_100022E7C()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1097, "mis_setup_cnt > 0");
}

void sub_100022EA4()
{
  __assert_rtn("mis_bcast_startv6", "mis_bcast.c", 1066, "mif_ext->mi_nat_param.ni_nattype == NETRB_NAT64 || mif_ext->mi_prefixinfo.mp_prefix_present || !mif_ext->mi_prefix_sharing");
}

void sub_100022ECC()
{
  __assert_rtn("mis_bridge_add", "mis_bcast.c", 1111, "mif_bridge->mi_class == MIS_IFCLASS_INT && mif_bridge->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022EF4()
{
  __assert_rtn("mis_bridge_delete", "mis_bcast.c", 1128, "mif->mi_class == MIS_IFCLASS_INT && mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100022F1C()
{
  __assert_rtn("mis_bcast_init_addr", "mis_bcast.c", 632, "mif->mi_class == MIS_IFCLASS_INT && mif->mi_member == 0");
}

void sub_100022F44()
{
  __assert_rtn("mis_bcast_teardown_interface", "mis_bcast.c", 457, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100022F6C()
{
  __assert_rtn("mis_bcast_teardown_interface", "mis_bcast.c", 456, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_100022F94()
{
  __assert_rtn("mis_bcast_setup_routes", "mis_bcast.c", 388, "err == 0 || err == EEXIST");
}

void sub_100022FBC()
{
  __assert_rtn("mis_bcast_fix_addrs", "mis_bcast.c", 552, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100022FE4()
{
  __assert_rtn("mis_bcast_fix_addrs", "mis_bcast.c", 551, "mif->mi_type == MIS_IFTYPE_BROADCAST || mif->mi_type == MIS_IFTYPE_BRIDGE || mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_10002300C()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 725, "mif_int->mi_member == 0");
}

void sub_100023034()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 724, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_10002305C()
{
  __assert_rtn("mis_bcast_setup_v4_service", "mis_bcast.c", 722, "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023084()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 814, "mif_int->mi_member == 0");
}

void sub_1000230AC()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 813, "mif_int->mi_class == MIS_IFCLASS_INT");
}

void sub_1000230D4()
{
  __assert_rtn("mis_bcast_setup_v6_service", "mis_bcast.c", 811, "mif_int->mi_type == MIS_IFTYPE_BROADCAST || mif_int->mi_type == MIS_IFTYPE_BRIDGE || mif_int->mi_type == MIS_IFTYPE_BROADCAST_LOCAL");
}

void sub_1000230FC()
{
  __assert_rtn("mis_bcast_local_start", "mis_bcast.c", 1200, "mif->mi_type == MIS_IFTYPE_BROADCAST_LOCAL || mif->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023124()
{
  __assert_rtn("mis_bcast_local_start", "mis_bcast.c", 1211, "mis_setup_local_cnt > 0");
}

void sub_10002314C()
{
  __assert_rtn("read_settings", "mis_set.c", 651, "plist_path != NULL");
}

void sub_100023174()
{
  __assert_rtn("read_settings", "mis_set.c", 655, "err != 0");
}

void sub_10002319C()
{
  __assert_rtn("mis_set_update_airplane_mode", "mis_set.c", 463, "set_prefs != NULL");
}

void sub_1000231C4()
{
  __assert_rtn("write_settings", "mis_set.c", 1085, "plist_path != NULL");
}

void sub_1000231EC()
{
  __assert_rtn("publish_settings", "mis_set.c", 1110, "sr != NULL");
}

void sub_100023214()
{
  __assert_rtn("mis_set_state_common", "mis_set.c", 1174, "!ustate");
}

void sub_10002323C()
{
  __assert_rtn("mis_set_state_common", "mis_set.c", 1175, "state == NETRB_SVC_STATE_OFF");
}

void sub_100023264()
{
  __assert_rtn("mis_remove_settings", "mis_set.c", 1364, "st->st_refcnt != 0");
}

void sub_10002328C()
{
  __assert_rtn("mis_set_max_hosts", "mis_set.c", 1421, "limit >= 0");
}

void sub_1000232B4()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1441, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_1000232DC()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1442, "count > 0");
}

void sub_100023304()
{
  __assert_rtn("mis_set_add_host", "mis_set.c", 1443, "(gset.mset_hosts[iftype] + count) != 0");
}

void sub_10002332C()
{
  __assert_rtn("mis_set_remove_host", "mis_set.c", 1452, "iftype >= NETRB_DEVTYPE_MIN && iftype <= NETRB_DEVTYPE_MAX");
}

void sub_100023354()
{
  __assert_rtn("mis_get_ext", "mis_set.c", 1514, "if_nametoindex(st->st_ext_name) != 0");
}

void sub_10002337C()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1544, "addr != NULL && mask != NULL");
}

void sub_1000233A4()
{
  __assert_rtn("mis_set_get_vmnet_subnet_information", "mis_set.c", 1545, "vmnet_plist != NULL");
}

void sub_1000233CC()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1573, "addr != NULL && mask != NULL");
}

void sub_1000233F4()
{
  __assert_rtn("mis_set_vmnet_subnet_information", "mis_set.c", 1574, "vmnet_plist != NULL");
}

void sub_10002341C()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1641, "vmnet_plist != NULL");
}

void sub_100023444()
{
  __assert_rtn("mis_set_reclaim_mac_io_ethernet", "mis_set.c", 1642, "mac_ioue_array != NULL");
}

void sub_10002346C()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1700, "vmnet_plist != NULL");
}

void sub_100023494()
{
  __assert_rtn("mis_set_get_mac_io_ethernet", "mis_set.c", 1701, "mac_ioue_array != NULL");
}

void sub_1000234BC()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1789, "mac_array_plist != NULL");
}

void sub_1000234E4()
{
  __assert_rtn("mis_set_get_unique_mac_address", "mis_set.c", 1792, "mac_ioue_array != NULL");
}

void sub_10002350C()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1876, "vmnet_plist != NULL");
}

void sub_100023534()
{
  __assert_rtn("mis_set_reclaim_mac_address", "mis_set.c", 1877, "mac_array_plist != NULL");
}

void sub_10002355C()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 36, "mif->mi_class == MIS_IFCLASS_INT");
}

void sub_100023584()
{
  __assert_rtn("mis_auth_init", "mis_auth.c", 35, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235AC()
{
  __assert_rtn("mis_auth_start", "mis_auth.c", 48, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235D4()
{
  __assert_rtn("mis_auth_stop", "mis_auth.c", 57, "mif->mi_type == MIS_IFTYPE_AUTH");
}

void sub_1000235FC()
{
  __assert_rtn("dhcp_start", "mis_dhcp.c", 935, "mif != NULL");
}

void sub_100023624()
{
  __assert_rtn("dhcp_interface_config_add", "mis_dhcp.c", 259, "mif->mi_mode == NETRB_INTERNET_SHARING_MODE || mif->mi_mode == NETRB_LOCAL_WITH_DHCP_MODE");
}

void sub_10002364C()
{
  __assert_rtn("bcast_range", "mis_dhcp.c", 206, "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_address_info.mi_addr.s_addr & mif->mi_address_info.mi_netmask.s_addr) + 1");
}

void sub_100023674()
{
  __assert_rtn("bcast_range", "mis_dhcp.c", 196, "ntohl(mif->mi_address_info.mi_addr.s_addr) == ntohl(mif->mi_saddr.s_addr)");
}

void sub_10002369C()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 510, "bridgeName != NULL");
}

void sub_1000236C4()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 511, "bridgeName[0] != '\\0'");
}

void sub_1000236EC()
{
  __assert_rtn("mis_bridge_create", "mis_bridge.c", 543, "nBridge > 0");
}

void sub_100023714()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 346, "bridgename != NULL");
}

void sub_10002373C()
{
  __assert_rtn("delete_entire_bridge", "mis_bridge.c", 347, "bridgename[0] != '\\0'");
}

void sub_100023764()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 615, "ifname != NULL");
}

void sub_10002378C()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 616, "ifname[0] != '\\0'");
}

void sub_1000237B4()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 617, "bridgename != NULL");
}

void sub_1000237DC()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 618, "bridgename[0] != '\\0'");
}

void sub_100023804()
{
  __assert_rtn("mis_bridge_add_member", "mis_bridge.c", 714, "xpc_dictionary_get_count(bridge->bridgeMembers) != 0");
}

void sub_10002382C()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 573, "bridgeName != NULL");
}

void sub_100023854()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 574, "bridgeName[0] != '\\0'");
}

void sub_10002387C()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 587, "nBridge > 0");
}

void sub_1000238A4()
{
  __assert_rtn("mis_bridge_destroy", "mis_bridge.c", 582, "bridge->bridge_refcnt == 0");
}

void sub_1000238CC()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 733, "ifname != NULL");
}

void sub_1000238F4()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 734, "ifname[0] != '\\0'");
}

void sub_10002391C()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 735, "bridgename != NULL");
}

void sub_100023944()
{
  __assert_rtn("mis_bridge_delete_member", "mis_bridge.c", 736, "bridgename[0] != '\\0'");
}

void sub_10002396C()
{
  __assert_rtn("mis_get_bridge_name", "mis_bridge.c", 783, "bridge_name != NULL");
}

void sub_100023994()
{
  __assert_rtn("mis_pfif_lookup", "mis_pf.c", 2687, "pe->refcnt != 0");
}

void sub_1000239BC()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 513, "pe_last != NULL");
}

void sub_1000239E4()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 521, "ntohl(pe_last->pe_addr.s_addr) == ntohl(pe_last->pe_addr.s_addr & pe_last->pe_netmask.s_addr) + 1");
}

void sub_100023A0C()
{
  __assert_rtn("mis_pf_addrules_v4", "mis_pf.c", 503, "!pe_ext->pe_any_external");
}

void sub_100023A34()
{
  __assert_rtn("mis_pf_add_external_rules_v6_prefix_sharing", "mis_pf.c", 829, "!pe_ext->pe_any_external");
}

void sub_100023A5C()
{
  __assert_rtn("mis_pf_start", "mis_pf.c", 981, "!pe_ext->pe_any_external");
}

void sub_100023A84()
{
  __assert_rtn("mis_pf_start", "mis_pf.c", 891, "mif_int->mi_type == MIS_IFTYPE_BRIDGE");
}

void sub_100023AAC()
{
  __assert_rtn("mis_pfif_clone", "mis_pf.c", 2749, "!pe->pe_prefix_sharing");
}

void sub_100023AD4()
{
  __assert_rtn("mis_pfif_clone", "mis_pf.c", 2753, "mif->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_100023AFC()
{
  __assert_rtn("mis_pf_stop", "mis_pf.c", 1102, "!m->ms_ext->mi_any_external");
}

void sub_100023B24()
{
  __assert_rtn("mis_pf_stop", "mis_pf.c", 1092, "mif_int->mi_nat_param.ni_nattype == NETRB_DEFAULT_NAT");
}

void sub_100023B4C()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1266, "ext_lo_port <= ext_hi_port && int_lo_port <= int_hi_port");
}

void sub_100023B74()
{
  __assert_rtn("mis_pf_configure_rdr", "mis_pf.c", 1267, "ext_hi_port - ext_lo_port == int_hi_port - int_lo_port");
}

void sub_100023B9C()
{
  __assert_rtn("-[misCTClientSharedInstance activateTethering:]", "mis_ctinterface.m", 236, "self.ctServerConnection != NULL");
}

void sub_100023BC4()
{
  __assert_rtn("rtadvd_config_create", "mis_rtadvd.c", 108, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_100023BEC()
{
  __assert_rtn("rtadvd_config_create", "mis_rtadvd.c", 96, "strncmp(mif_ext->mi_name, netrbXPCAnyExternal, NETRB_IFNAMSIZ) == 0");
}

void sub_100023C14()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 474, "mif->mi_nat_param.ni_nat66.ra_prefix_len != 0");
}

void sub_100023C3C()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 460, "mif->mi_nat_param.ni_nattype == NETRB_NAT64");
}

void sub_100023C64()
{
  __assert_rtn("rtadvd_start", "mis_rtadvd.c", 425, "rtadvd_source != NULL");
}

void sub_100023C8C()
{
  __assert_rtn("dns_proxy_insert_interfaces", "mis_dnsproxy.c", 272, "dns_object->dns_refcnt != 0");
}

void sub_100023CB4()
{
  __assert_rtn("dns_proxy_insert_interfaces", "mis_dnsproxy.c", 236, "!dns_object->dns64");
}

void sub_100023CDC()
{
  __assert_rtn("dns_proxy_start", "mis_dnsproxy.c", 144, "!dnsobject->dns64");
}

void sub_100023D04()
{
  __assert_rtn("dns_proxy_remove_interfaces", "mis_dnsproxy.c", 310, "removed_count <= dns_object->dns_refcnt");
}

void sub_100023D2C()
{
  __assert_rtn("dns_proxy_remove_interfaces", "mis_dnsproxy.c", 315, "nDNSProxy > 0");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__setupCTServerConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupCTServerConnection");
}

id objc_msgSend_activateTethering_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateTethering:");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_carrierEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierEnabled");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_connectionAvailabilityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionAvailabilityStatus");
}

id objc_msgSend_connectionStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionStatus");
}

id objc_msgSend_convertConnectionStatus_ctInterfaceConnStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertConnectionStatus:ctInterfaceConnStatus:");
}

id objc_msgSend_convertTetheringStatus_CTStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertTetheringStatus:CTStatus:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_createAssertionForConnectionType_allocator_error_onReAssertError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createAssertionForConnectionType:allocator:error:onReAssertError:");
}

id objc_msgSend_ctServerConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ctServerConnection");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_getTetheringInterfaceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTetheringInterfaceName:");
}

id objc_msgSend_getTetheringStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTetheringStatus:");
}

id objc_msgSend_getTetheringStatusSync_connectionType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTetheringStatusSync:connectionType:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceName");
}

id objc_msgSend_misPdpMaxHosts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "misPdpMaxHosts");
}

id objc_msgSend_pdp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pdp");
}

id objc_msgSend_processCTConnectionStateChangeNotification_connection_connectionStatus_ctInterfaceConnStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processCTConnectionStateChangeNotification:connection:connectionStatus:ctInterfaceConnStatus:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionsInUse");
}

id objc_msgSend_userAuthenticated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAuthenticated");
}
