void sub_100001998(int a1)
{
  os_release((void *)qword_1000103C8);
  qword_1000103C8 = 0;
  if (dword_100010390 != -1)
  {
    close(dword_100010390);
    dword_100010390 = -1;
  }
  if (qword_1000103B0)
    xpc_connection_cancel((xpc_connection_t)qword_1000103B0);
  if (qword_1000103B8)
    CFRelease((CFTypeRef)qword_1000103B8);
  if (qword_1000103C0)
    CFRelease((CFTypeRef)qword_1000103C0);
  exit(a1);
}

uint64_t sub_100001A0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return os_log_with_args(qword_1000103C8, 0, a1, &a9, v9);
}

uint64_t sub_100001A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return os_log_with_args(qword_1000103C8, 1, a1, &a9, v9);
}

uint64_t sub_100001A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return os_log_with_args(qword_1000103C8, 2, a1, &a9, v9);
}

uint64_t sub_100001AC0(const char *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const char *ValueAtIndex;

  Count = CFArrayGetCount((CFArrayRef)qword_1000103B8);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v4) = -1;
  }
  else
  {
    v3 = Count;
    v4 = 0;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex((CFArrayRef)qword_1000103B8, v4);
      if (!strncmp(a1, ValueAtIndex, 0x40uLL))
        break;
      if (v3 == ++v4)
        goto LABEL_5;
    }
  }
  return (unsigned __int16)v4;
}

uint64_t sub_100001B34(uint64_t a1, const char *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const char *ValueAtIndex;

  v3 = (const __CFArray *)qword_1000103C0;
  Count = CFArrayGetCount((CFArrayRef)qword_1000103C0);
  if (Count < 1)
  {
LABEL_5:
    LOWORD(v6) = -1;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    while (1)
    {
      ValueAtIndex = (const char *)CFArrayGetValueAtIndex(v3, v6);
      if (!strncmp(a2, ValueAtIndex, 0x40uLL))
        break;
      if (v5 == ++v6)
        goto LABEL_5;
    }
  }
  return (unsigned __int16)v6;
}

uint64_t sub_100001BAC()
{
  return dword_100010390;
}

const char *sub_100001BB8(uint64_t a1)
{
  if (a1 > 3222291537)
  {
    if (a1 <= 3295691826)
    {
      if (a1 <= 3223864408)
      {
        if (a1 == 3222291538)
          return "DIOCXCOMMIT";
        if (a1 == 3222291539)
          return "DIOCXROLLBACK";
      }
      else
      {
        switch(a1)
        {
          case 3223864409:
            return "DIOCSETIFFLAG";
          case 3223864410:
            return "DIOCCLRIFFLAG";
          case 3235398674:
            return "DIOCCLRSTATES";
        }
      }
    }
    else if (a1 > 3424666629)
    {
      switch(a1)
      {
        case 3424666630:
          return "DIOCGETRULES";
        case 3424666651:
          return "DIOCINSERTRULE";
        case 3424666652:
          return "DIOCDELETERULE";
      }
    }
    else
    {
      switch(a1)
      {
        case 3295691827:
          return "DIOCBEGINADDRS";
        case 3295691828:
          return "DIOCADDADDR";
        case 3424666628:
          return "DIOCADDRULE";
      }
    }
  }
  else if (a1 <= 3221505047)
  {
    if (a1 <= 536888341)
    {
      if (a1 == 536888321)
        return "DIOCSTART";
      if (a1 == 536888322)
        return "DIOCSTOP";
    }
    else
    {
      switch(a1)
      {
        case 536888342:
          return "DIOCCLRSTATUS";
        case 536888405:
          return "DIOCCLRSRCNODES";
        case 1074283528:
          return "DIOCSTARTREF";
      }
    }
  }
  else if (a1 > 3222291460)
  {
    switch(a1)
    {
      case 3222291461:
        return "DIOCGETSTARTERS";
      case 3222291465:
        return "DIOCSTOPREF";
      case 3222291537:
        return "DIOCXBEGIN";
    }
  }
  else
  {
    switch(a1)
    {
      case 3221505048:
        return "DIOCSETDEBUG";
      case 3221767197:
        return "DIOCSETTIMEOUT";
      case 3221767208:
        return "DIOCSETLIMIT";
    }
  }
  return "UNKNOWN";
}

void start(int a1, char *const *a2)
{
  const char *v4;
  int v5;
  char *errorbuf;

  v4 = *a2;
  errorbuf = 0;
  if (sandbox_init("pfd", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "sandbox_init: %s\n", errorbuf);
    sandbox_free_error(errorbuf);
  }
  while (1)
  {
    v5 = getopt(a1, a2, "D");
    if (v5 != 68)
      break;
    dword_100010398 = 1;
  }
  if (v5 == -1)
  {
    sub_100001FB4();
    sub_100002000();
    sub_1000024EC();
    sub_1000025EC();
    sub_100002778();
    sub_1000027D8();
    dispatch_main();
  }
  sub_100001F6C(v4);
  exit(1);
}

uint64_t sub_100001F6C(const char *a1)
{
  printf("Usage: %s ", a1);
  puts("[-D]");
  puts("\noptions:");
  return puts("\t-D\tEnable PF debugging");
}

void sub_100001FB4()
{
  qword_1000103C8 = (uint64_t)os_log_create(off_100010000[0], "daemon");
  if (!qword_1000103C8 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_1000082F4();
}

void sub_100002000()
{
  int v0;
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
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  unint64_t v24;
  int v25;
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
  int v41;
  unint64_t v42;
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
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  const char *v85;
  int v86;
  int *v87;
  const char *v88;
  unint64_t v89;
  uint64_t v90;
  _OWORD v91[2];
  uint64_t v92;

  if (dword_100010390 != -1)
    sub_100001998(22);
  v0 = open("/dev/pfm", 2);
  dword_100010390 = v0;
  if (v0 == -1)
  {
    sub_100001A0C((uint64_t)"%s: %m", v1, v2, v3, v4, v5, v6, v7, (uint64_t)"__PFDInitPFSetup");
    goto LABEL_60;
  }
  if (fcntl(v0, 2, 1) == -1)
  {
    sub_100001A0C((uint64_t)"%s: fcntl(FD_CLOEXEC): %m", v8, v9, v10, v11, v12, v13, v14, (uint64_t)"__PFDInitPFSetup");
LABEL_60:
    v87 = __error();
    sub_100001998(*v87);
  }
  xmmword_1000103D0 = xmmword_1000088C0;
  unk_1000103E0 = xmmword_1000088D0;
  xmmword_1000103F0 = xmmword_1000088E0;
  unk_100010400 = xmmword_1000088F0;
  xmmword_100010410 = xmmword_100008900;
  unk_100010420 = xmmword_100008910;
  qword_100010430 = 0x9600000000;
  if (dword_100010398)
    v15 = 3;
  else
    v15 = 1;
  LODWORD(v91[0]) = v15;
  if (ioctl(dword_100010390, 0xC0044418uLL, v91))
    sub_100001A0C((uint64_t)"%s: %m", v16, v17, v18, v19, v20, v21, v22, (uint64_t)"DIOCSETDEBUG");
  if (LODWORD(v91[0]) > 3)
    v23 = "<invalid>";
  else
    v23 = off_10000C488[SLODWORD(v91[0])];
  sub_100001A84((uint64_t)"pf debug level set to '%s'", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
  v24 = 0;
  *(_QWORD *)&v91[0] = 0;
  do
  {
    LODWORD(v91[0]) = v24;
    v25 = ioctl(dword_100010390, 0xC0084427uLL, v91, v89, v90);
    if (v25)
    {
      v41 = v25;
      sub_100001A0C((uint64_t)"%s: DIOCGETLIMIT index %d", v26, v27, v28, v29, v30, v31, v32, (uint64_t)"__PFDSetLimits");
      goto LABEL_56;
    }
    v33 = dword_100008928[v24];
    if (DWORD1(v91[0]) <= v33
      && (DWORD1(v91[0]) = dword_100008928[v24], ioctl(dword_100010390, 0xC0084428uLL)))
    {
      v41 = *__error();
      if (v41 == 16)
      {
        sub_100001A0C((uint64_t)"Current pool size exceeds requested hard limit", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v91);
        goto LABEL_56;
      }
      v89 = v24;
      v90 = v33;
      sub_100001A0C((uint64_t)"%s[%d,%d]: %m", v34, v35, v36, v37, v38, v39, v40, (uint64_t)"DIOCSETLIMIT");
    }
    else
    {
      v41 = 0;
    }
    if (v24 > 4)
      break;
    ++v24;
  }
  while (!v41);
  if (v41)
    goto LABEL_56;
  v42 = 0;
  do
  {
    *(_QWORD *)&v91[0] = __PAIR64__(*((_DWORD *)&xmmword_1000103D0 + v42), v42);
    if (ioctl(dword_100010390, 0xC008441DuLL, v91, v89, v90))
    {
      v41 = *__error();
      v89 = v42;
      v90 = *((unsigned int *)&xmmword_1000103D0 + v42);
      sub_100001A0C((uint64_t)"%s[%d,%d]: %m", v43, v44, v45, v46, v47, v48, v49, (uint64_t)"DIOCSETTIMEOUT");
    }
    else
    {
      v41 = 0;
    }
    if (v42 > 0x18)
      break;
    ++v42;
  }
  while (!v41);
  if (v41)
LABEL_56:
    sub_100001998(v41);
  v92 = 0x10000000000;
  memset(v91, 0, sizeof(v91));
  if ((unint64_t)__strlcpy_chk(v91, "lo0", 16, 16) >= 0x10)
    sub_100001A0C((uint64_t)"%s: strlcpy", v50, v51, v52, v53, v54, v55, v56, (uint64_t)"__PFDSetInterfaceFlags");
  if (ioctl(dword_100010390, 0xC0284459uLL, v91))
  {
    v57 = *__error();
    sub_100001A0C((uint64_t)"%s: %m", v58, v59, v60, v61, v62, v63, v64, (uint64_t)"DIOCSETIFFLAG");
    if (v57)
    {
      v86 = v57;
      goto LABEL_62;
    }
  }
  v91[0] = 0uLL;
  if (ioctl(dword_100010390, 0xC0104405uLL, v91) < 0)
  {
    if (*__error() == 2)
    {
      v84 = "no pf starter references held";
LABEL_46:
      sub_100001A48((uint64_t)v84, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v88);
      goto LABEL_49;
    }
    goto LABEL_47;
  }
  v65 = malloc_type_malloc(2 * SLODWORD(v91[0]), 0x2829944CuLL);
  if (!v65)
  {
    v85 = "malloc failed";
LABEL_48:
    sub_100001A0C((uint64_t)v85, v66, v67, v68, v69, v70, v71, v72, (uint64_t)v88);
LABEL_49:
    v86 = *__error();
    if ((v86 & 0xFFFFFFFD) == 0)
      return;
LABEL_62:
    sub_100001998(v86);
  }
  v73 = v65;
  *((_QWORD *)&v91[0] + 1) = v65;
  v88 = (const char *)v91;
  if (ioctl(dword_100010390, 0xC0104405uLL) < 0)
  {
    free(v73);
    if (*__error() == 2)
    {
      v84 = "no pf enabled references";
      goto LABEL_46;
    }
LABEL_47:
    v88 = "DIOCGETSTARTERS";
    v85 = "%s: %m";
    goto LABEL_48;
  }
  v74 = v91[0];
  if (SLODWORD(v91[0]) >= 1)
  {
    v75 = 0;
    v76 = *((_QWORD *)&v91[0] + 1);
    while (strncmp((const char *)(v76 + v75 + 20), "pfd", 0x40uLL))
    {
      v75 += 84;
      if ((int)v75 >= v74)
        goto LABEL_52;
    }
    sub_100001A84((uint64_t)"token found %llu", v77, v78, v79, v80, v81, v82, v83, *(_QWORD *)(v76 + v75));
    qword_1000103A0 = *(_QWORD *)(v76 + v75);
  }
LABEL_52:
  free(v73);
}

void sub_1000024EC()
{
  __CFArray *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFArrayCallBacks v8;

  memset(&v8, 0, sizeof(v8));
  v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &v8);
  qword_1000103B8 = (uint64_t)v0;
  if (!v0)
  {
    sub_100001A0C((uint64_t)"unable to create an array for anchor priority", v1, v2, v3, v4, v5, v6, v7, v8.version);
    sub_100001998(12);
  }
  CFArrayAppendValue(v0, off_1000100D0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, kPFThreadBR[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_100010100[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100D8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E0[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100E8[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103B8, off_1000100F0[0]);
}

void sub_1000025EC()
{
  __CFArray *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFArrayCallBacks v8;

  memset(&v8, 0, sizeof(v8));
  v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &v8);
  qword_1000103C0 = (uint64_t)v0;
  if (!v0)
  {
    sub_100001A0C((uint64_t)"unable to create an array for default priority", v1, v2, v3, v4, v5, v6, v7, v8.version);
    sub_100001998(12);
  }
  CFArrayAppendValue(v0, off_100010110[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010118[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010120[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010128[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010130[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010138[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010140[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010148[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010150[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010158[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, kPFThreadBR_nat64[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010160[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010168[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010170[0]);
  CFArrayAppendValue((CFMutableArrayRef)qword_1000103C0, off_100010178[0]);
}

void sub_100002778()
{
  _xpc_connection_s *mach_service;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  mach_service = xpc_connection_create_mach_service(off_100010008[0], (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  qword_1000103B0 = (uint64_t)mach_service;
  if (!mach_service)
  {
    sub_100001A0C((uint64_t)"could not start xpc listener", v1, v2, v3, v4, v5, v6, v7, v8);
    sub_100001998(12);
  }
  xpc_connection_set_event_handler(mach_service, &stru_10000C408);
  xpc_connection_resume((xpc_connection_t)qword_1000103B0);
}

void sub_1000027D8()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  NSObject *v3;
  _QWORD v4[6];
  sigaction v5;

  v5.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v5.sa_mask = 0x200000000;
  sigaction(1, &v5, 0);
  sigaction(13, &v5, 0);
  sigaction(14, &v5, 0);
  sigaction(24, &v5, 0);
  sigaction(25, &v5, 0);
  sigaction(26, &v5, 0);
  sigaction(27, &v5, 0);
  sigaction(18, &v5, 0);
  sigaction(21, &v5, 0);
  sigaction(22, &v5, 0);
  sigaction(30, &v5, 0);
  sigaction(31, &v5, 0);
  sigaction(29, &v5, 0);
  sigaction(15, &v5, 0);
  sigaction(2, &v5, 0);
  v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1DuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v1 = v0;
  if (v0)
  {
    dispatch_source_set_event_handler(v0, &stru_10000C448);
    dispatch_resume(v1);
  }
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (v2)
  {
    v3 = v2;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_100002A40;
    v4[3] = &unk_10000C468;
    v4[4] = v1;
    v4[5] = v2;
    dispatch_source_set_event_handler(v2, v4);
    dispatch_resume(v3);
  }
}

void sub_100002998(id a1, void *a2)
{
  xpc_type_t type;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *string;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    sub_100001A84((uint64_t)"new peer %p", v4, v5, v6, v7, v8, v9, v10, (uint64_t)a2);
    sub_100002A78((_xpc_connection_s *)a2);
  }
  else
  {
    if (type == (xpc_type_t)&_xpc_type_error)
    {
      string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
      sub_100001A0C((uint64_t)"xpc connection error: %s", v12, v13, v14, v15, v16, v17, v18, (uint64_t)string);
      sub_100001998(22);
    }
    sub_100001A0C((uint64_t)"unknown message type", v4, v5, v6, v7, v8, v9, v10, v19);
  }
}

void sub_100002A40(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
  sub_100001998(0);
}

void sub_100002A78(_xpc_connection_s *a1)
{
  _QWORD handler[5];

  if (__CFADD__(dword_100010438++, 1))
    sub_100008338();
  xpc_connection_set_target_queue(a1, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_100002B04;
  handler[3] = &unk_10000C4A8;
  handler[4] = a1;
  xpc_connection_set_event_handler(a1, handler);
  xpc_connection_resume(a1);
}

void sub_100002B04(uint64_t a1, xpc_object_t object, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v9;
  xpc_type_t type;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __SecTask *v21;
  __SecTask *v22;
  CFTypeRef v23;
  CFErrorRef v24;
  CFTypeID TypeID;
  _BOOL4 v26;
  _xpc_connection_s *v27;
  char **v28;
  uint64_t uint64;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  const char *v38;
  int v39;
  const char *v40;
  int v41;
  xpc_object_t value;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  xpc_object_t v51;
  const char *v52;
  const char *name;
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
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  xpc_object_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  xpc_object_t v77;
  _xpc_connection_s *v78;
  char v79;
  void *v80;
  xpc_object_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  xpc_object_t v85;
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
  xpc_object_t v100;
  xpc_object_t v101;
  BOOL v102;
  int v103;
  xpc_object_t v104;
  xpc_object_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  xpc_object_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  xpc_object_t v129;
  BOOL v130;
  xpc_object_t v131;
  const char *v132;
  uint64_t v133;
  char *v134;
  xpc_object_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char v143;
  xpc_object_t v144;
  void *v145;
  char v146;
  xpc_object_t v147;
  const char *v148;
  void *v149;
  uint64_t v150;
  xpc_object_t v151;
  void *v152;
  xpc_object_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  xpc_object_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  void *v171;
  xpc_object_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  xpc_object_t v181;
  void *v182;
  xpc_object_t v183;
  void *v184;
  int v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  unint64_t v193;
  size_t v194;
  char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  int v210;
  char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  int v216;
  char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  int v222;
  uint64_t v223;
  uint64_t v224;
  size_t v225;
  unsigned __int8 *v226;
  xpc_object_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  xpc_object_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  _BYTE *bytes_ptr;
  size_t length;
  xpc_object_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const unsigned __int8 *bytes;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  int v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  xpc_object_t empty;
  void *v273;
  xpc_object_t v274;
  size_t v275;
  char *v276;
  xpc_object_t v277;
  char v278;
  uint64_t v279;
  const char *v280;
  const char *v281;
  int v282;
  const char *CStringPtr;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  int v291;
  int v292;
  xpc_object_t v293;
  xpc_object_t v294;
  unsigned __int16 v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  _BOOL8 v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  xpc_object_t reply;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  xpc_object_t v319;
  _BOOL8 v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  xpc_object_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  unsigned __int16 v341;
  xpc_object_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  unsigned __int8 v351;
  xpc_object_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  int v361;
  xpc_object_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  unsigned __int16 v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  void *v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  audit_token_t *v407;
  uint64_t v408;
  unint64_t v409;
  unint64_t v410;
  audit_token_t token;
  int v412[2];
  CFErrorRef error;
  audit_token_t size[2];

  type = xpc_get_type(object);
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (type != (xpc_type_t)&_xpc_type_error)
    {
      sub_100001A0C((uint64_t)"unknown message type", v13, v14, v15, v16, v17, v18, v19, a9);
      return;
    }
    goto LABEL_23;
  }
  v20 = *(_QWORD *)(a1 + 32);
  memset(size, 0, 32);
  error = 0;
  xpc_connection_get_audit_token(v20, size);
  token = size[0];
  v21 = SecTaskCreateWithAuditToken(0, &token);
  if (!v21)
    goto LABEL_22;
  v22 = v21;
  v23 = SecTaskCopyValueForEntitlement(v21, CFSTR("com.apple.pf.allow"), &error);
  v24 = error;
  if (!error && v23)
  {
    TypeID = CFBooleanGetTypeID();
    v26 = TypeID == CFGetTypeID(v23) && CFEqual(v23, kCFBooleanTrue) != 0;
    goto LABEL_12;
  }
  v26 = 0;
  if (v23)
  {
LABEL_12:
    CFRelease(v23);
    v24 = error;
  }
  if (v24)
    CFRelease(v24);
  CFRelease(v22);
  if (v26)
  {
    v27 = *(_xpc_connection_s **)(a1 + 32);
    v28 = off_100010000;
    uint64 = xpc_dictionary_get_uint64(object, off_100010010[0]);
    switch(uint64)
    {
      case 0x3E9uLL:
        *(_QWORD *)token.val = 0;
        *(_QWORD *)v412 = 0;
        error = 0;
        v37 = 0;
        if (!sub_100003FC4(object, (const char **)&token, (const char **)&error))
          goto LABEL_179;
        v38 = *(const char **)token.val;
        v39 = sub_100001AC0(*(const char **)token.val);
        v40 = (const char *)error;
        v41 = sub_100001B34((uint64_t)v38, (const char *)error);
        value = xpc_dictionary_get_value(object, off_100010030[0]);
        if (!value)
        {
          v52 = "no rule to insert";
          goto LABEL_178;
        }
        v50 = value;
        v51 = xpc_dictionary_get_value(object, off_100010038[0]);
        if (!v51 || xpc_get_type(v51) != (xpc_type_t)&_xpc_type_uint64)
        {
          v52 = "incorrect type for priority";
          goto LABEL_178;
        }
        v295 = xpc_dictionary_get_uint64(object, off_100010038[0]);
        *(_QWORD *)size[0].val = 0;
        LOWORD(size[0].val[2]) = 0;
        v37 = sub_100004524(v38, v40, v39, v41, size);
        if (!v37)
          goto LABEL_202;
        v303 = sub_100005E88(v38, v40, v37, v295, v50, v412);
        if (!v303)
          sub_1000042B0(v38, v40, (uint64_t)size, v306, v307, v308, v309, v310, v405);
        if (!sub_1000060A8(v303, v304, v305, v306, v307, v308, v309, v310))
        {
          sub_1000043BC(v38, v40, *(uint64_t *)v412, v37);
          goto LABEL_204;
        }
        reply = xpc_dictionary_create_reply(object);
        if (reply)
        {
          v100 = reply;
          xpc_dictionary_set_uint64(reply, off_100010010[0], 0x7D1uLL);
          v148 = off_100010040[0];
          v150 = *(_QWORD *)v412;
          v149 = v100;
          goto LABEL_182;
        }
        sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v312, v313, v314, v315, v316, v317, v318, v405);
        sub_1000043BC(v38, v40, *(uint64_t *)v412, v37);
        sub_1000042B0(v38, v40, (uint64_t)size, v336, v337, v338, v339, v340, v408);
        goto LABEL_187;
      case 0x3EAuLL:
        *(_QWORD *)size[0].val = 0;
        *(_QWORD *)token.val = 0;
        LODWORD(error) = 0;
        if (sub_100003FC4(object, (const char **)size, (const char **)&token))
        {
          v85 = xpc_dictionary_get_value(object, off_100010040[0]);
          if (!v85 || xpc_get_type(v85) != (xpc_type_t)&_xpc_type_uint64)
          {
            sub_100001A0C((uint64_t)"Incorrect type for insertion id", v86, v87, v88, v89, v90, v91, v92, v405);
            v100 = xpc_dictionary_create_reply(object);
            v37 = 0;
            if (v100)
              goto LABEL_181;
            goto LABEL_186;
          }
          v279 = xpc_dictionary_get_uint64(object, off_100010040[0]);
          v280 = *(const char **)size[0].val;
          v281 = *(const char **)token.val;
          v37 = sub_100004A2C(*(const char **)size[0].val, *(const char **)token.val);
          if (sub_1000043BC(v280, v281, v279, v37))
          {
            v282 = sub_100005F64(v37, &error);
            v146 = v282;
            if (v282 && !(_DWORD)error)
            {
              CStringPtr = CFStringGetCStringPtr(v37, 0);
              sub_100001A84((uint64_t)"no rules exist in the anchor %s after deleting a single rule", v284, v285, v286, v287, v288, v289, v290, (uint64_t)CStringPtr);
              sub_100005CB4(v280, v281);
              v100 = xpc_dictionary_create_reply(object);
              if (v100)
                goto LABEL_80;
              goto LABEL_186;
            }
          }
          else
          {
            v146 = 0;
          }
        }
        else
        {
          v146 = 0;
          v37 = 0;
        }
        v147 = xpc_dictionary_create_reply(object);
        if (!v147)
          goto LABEL_186;
        v100 = v147;
        if ((v146 & 1) == 0)
          goto LABEL_181;
        goto LABEL_80;
      case 0x3EBuLL:
        *(_QWORD *)token.val = 0;
        error = 0;
        v37 = 0;
        if (!sub_100003FC4(object, (const char **)&token, (const char **)&error))
          goto LABEL_179;
        v101 = xpc_dictionary_get_value(object, off_100010020[0]);
        if (v101 && xpc_get_type(v101) == (xpc_type_t)&_xpc_type_string)
        {
          v38 = *(const char **)token.val;
          v291 = sub_100001AC0(*(const char **)token.val);
          v40 = (const char *)error;
          v292 = sub_100001B34((uint64_t)v38, (const char *)error);
          v293 = xpc_dictionary_get_value(object, off_100010028[0]);
          if (v293 && xpc_get_type(v293) == (xpc_type_t)&_xpc_type_array)
          {
            v319 = xpc_dictionary_get_value(object, off_100010028[0]);
            *(_QWORD *)size[0].val = 0;
            LOWORD(size[0].val[2]) = 0;
            v37 = sub_100004524(v38, v40, v291, v292, size);
            if (v37)
            {
              v320 = sub_100004ABC(v38, v40, v37, v319);
              if (v320)
              {
                if (sub_1000060A8(v320, v321, v322, v323, v324, v325, v326, v327))
                {
                  v328 = xpc_dictionary_create_reply(object);
                  if (!v328)
                  {
                    sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v329, v330, v331, v332, v333, v334, v335, v405);
                    sub_100005CB4(v38, v40);
                    goto LABEL_187;
                  }
                  v100 = v328;
LABEL_80:
                  v148 = off_100010010[0];
                  v149 = v100;
                  v150 = 2001;
LABEL_182:
                  xpc_dictionary_set_uint64(v149, v148, v150);
                  sub_100003F68(v27, v100);
                  v171 = v100;
LABEL_183:
                  xpc_release(v171);
LABEL_184:
                  if (!v37)
                    return;
LABEL_187:
                  CFRelease(v37);
                  return;
                }
                sub_100005CB4(v38, v40);
              }
              else
              {
LABEL_204:
                sub_1000042B0(v38, v40, (uint64_t)size, v323, v324, v325, v326, v327, v405);
              }
            }
            else
            {
LABEL_202:
              sub_100001A0C((uint64_t)"unable to create anchors", v296, v297, v298, v299, v300, v301, v302, v405);
            }
LABEL_179:
            v294 = xpc_dictionary_create_reply(object);
            if (!v294)
            {
LABEL_186:
              sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v93, v94, v95, v96, v97, v98, v99, v405);
              if (!v37)
                return;
              goto LABEL_187;
            }
            v100 = v294;
LABEL_181:
            v148 = off_100010010[0];
            v149 = v100;
            v150 = 2000;
            goto LABEL_182;
          }
          v52 = "Incorrect type for rule array";
        }
        else
        {
          v52 = "Incorrect type for sub app";
        }
LABEL_178:
        sub_100001A0C((uint64_t)v52, v43, v44, v45, v46, v47, v48, v49, v405);
        v37 = 0;
        goto LABEL_179;
      case 0x3ECuLL:
        *(_QWORD *)size[0].val = 0;
        *(_QWORD *)token.val = 0;
        if (!sub_100003FC4(object, (const char **)size, (const char **)&token))
          goto LABEL_70;
        v102 = sub_100005CB4(*(const char **)size[0].val, *(const char **)token.val);
        goto LABEL_58;
      case 0x3EDuLL:
        *(_QWORD *)size[0].val = 0;
        *(_QWORD *)token.val = 0;
        v103 = sub_100003FC4(object, (const char **)size, (const char **)&token);
        v37 = 0;
        v104 = 0;
        LOBYTE(error) = v103;
        if (v103)
        {
          v37 = sub_100004A2C(*(const char **)size[0].val, *(const char **)token.val);
          v104 = sub_100006150(v37, &error);
        }
        v105 = xpc_dictionary_create_reply(object);
        if (v105)
        {
          v113 = v105;
          if ((_BYTE)error)
          {
            xpc_dictionary_set_uint64(v105, off_100010010[0], 0x7D1uLL);
            if (v104)
              xpc_dictionary_set_value(v113, off_100010028[0], v104);
          }
          else
          {
            xpc_dictionary_set_uint64(v105, off_100010010[0], 0x7D0uLL);
          }
          sub_100003F68(v27, v113);
          xpc_release(v113);
        }
        else
        {
          sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v106, v107, v108, v109, v110, v111, v112, v405);
        }
        if (!v104)
          goto LABEL_184;
        v171 = v104;
        goto LABEL_183;
      case 0x3EEuLL:
        v121 = xpc_dictionary_get_value(object, off_100010030[0]);
        if (v121)
        {
          v129 = xpc_dictionary_create(0, 0, 0);
          if (v129)
          {
            LOBYTE(v121) = sub_100006F14(v121, v129);
          }
          else
          {
            sub_100001A0C((uint64_t)"xpc_dictionary_create failed %m", v122, v123, v124, v125, v126, v127, v128, v405);
            LOBYTE(v121) = 0;
          }
        }
        else
        {
          sub_100001A0C((uint64_t)"no nat rule to check", v114, v115, v116, v117, v118, v119, v120, v405);
          v129 = 0;
        }
        v172 = xpc_dictionary_create_reply(object);
        if (v172)
        {
          v180 = v172;
          if ((v121 & 1) != 0)
          {
            xpc_dictionary_set_uint64(v172, off_100010010[0], 0x7D1uLL);
            xpc_dictionary_set_value(v180, off_100010030[0], v129);
          }
          else
          {
            xpc_dictionary_set_uint64(v172, off_100010010[0], 0x7D0uLL);
          }
          sub_100003F68(v27, v180);
          xpc_release(v180);
        }
        else
        {
          sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v173, v174, v175, v176, v177, v178, v179, v405);
        }
        if (!v129)
          return;
        v145 = v129;
        goto LABEL_75;
      case 0x3EFuLL:
        *(_QWORD *)size[0].val = 0;
        *(_QWORD *)token.val = 0;
        if (!sub_100003FC4(object, (const char **)size, (const char **)&token))
        {
LABEL_70:
          v77 = xpc_dictionary_create_reply(object);
          if (!v77)
            goto LABEL_76;
          goto LABEL_71;
        }
        v102 = sub_100006DF0(*(const char **)size[0].val, *(const char **)token.val);
LABEL_58:
        v130 = v102;
        v131 = xpc_dictionary_create_reply(object);
        if (!v131)
          goto LABEL_76;
        v77 = v131;
        if (!v130)
          goto LABEL_71;
        v132 = off_100010010[0];
        v133 = 2001;
        goto LABEL_72;
      default:
        if (uint64 != 3000)
        {
          if (uint64 == 3001)
          {
            *(_QWORD *)size[0].val = 0;
            *(_QWORD *)&size[0].val[2] = 0;
            token.val[0] = 0;
            LODWORD(error) = 0;
            if (object
              && xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary
              && (v151 = xpc_dictionary_get_value(object, off_100010050[0])) != 0
              && (v152 = v151, xpc_get_type(v151) == (xpc_type_t)&_xpc_type_dictionary))
            {
              token.val[0] = 0;
              v153 = xpc_dictionary_get_value(v152, off_1000100A8[0]);
              if (v153
                && (v161 = v153, xpc_get_type(v153) == (xpc_type_t)&_xpc_type_data)
                && xpc_data_get_bytes(v161, &token, 0, 4uLL) == 4)
              {
                v162 = xpc_dictionary_get_value(v152, off_1000100B0[0]);
                if (v162
                  && (v170 = v162, v9 = (char *)&_xpc_type_uint64, xpc_get_type(v162) == (xpc_type_t)&_xpc_type_uint64)
                  && xpc_uint64_get_value(v170) < 0x10000)
                {
                  v341 = xpc_uint64_get_value(v170);
                  v342 = xpc_dictionary_get_value(v152, off_1000100C8[0]);
                  if (v342
                    && (v350 = v342, xpc_get_type(v342) == (xpc_type_t)&_xpc_type_uint64)
                    && xpc_uint64_get_value(v350) < 0x100)
                  {
                    v351 = xpc_uint64_get_value(v350);
                  }
                  else
                  {
                    sub_100001A0C((uint64_t)"%s: invalid param ip proto", v343, v344, v345, v346, v347, v348, v349, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    v351 = 0;
                  }
                  LODWORD(error) = 0;
                  v352 = xpc_dictionary_get_value(v152, off_1000100B8[0]);
                  if (v352
                    && (v360 = v352, xpc_get_type(v352) == (xpc_type_t)&_xpc_type_data)
                    && xpc_data_get_bytes(v360, &error, 0, 4uLL) == 4)
                  {
                    v361 = 1;
                  }
                  else
                  {
                    sub_100001A0C((uint64_t)"%s: invalid param ext lan addr", v353, v354, v355, v356, v357, v358, v359, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    v361 = 0;
                  }
                  v362 = xpc_dictionary_get_value(v152, off_1000100C0[0]);
                  if (v362
                    && (v370 = v362, xpc_get_type(v362) == (xpc_type_t)&_xpc_type_uint64)
                    && xpc_uint64_get_value(v370) < 0x10000)
                  {
                    v371 = xpc_uint64_get_value(v370);
                  }
                  else
                  {
                    sub_100001A0C((uint64_t)"%s: invalid param ext lan port", v363, v364, v365, v366, v367, v368, v369, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                    v371 = 0;
                  }
                  v372 = sub_100001BAC();
                  if ((v372 & 0x80000000) != 0)
                  {
                    sub_100001A0C((uint64_t)"%s: dev", v373, v374, v375, v376, v377, v378, v379, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                  }
                  else
                  {
                    v9 = (char *)v372;
                    if ((ioctl(v372, 0xC0104419uLL, size) & 0x80000000) == 0)
                    {
                      v387 = malloc_type_malloc((int)size[0].val[0], 0x783562F8uLL);
                      v80 = v387;
                      if (v387)
                      {
                        *(_QWORD *)&size[0].val[2] = v387;
                        bzero(v387, (int)size[0].val[0]);
                        if ((ioctl((int)v9, 0xC0104419uLL, size) & 0x80000000) == 0)
                        {
                          if ((int)size[0].val[0] >= 1)
                          {
                            v402 = 0;
                            v9 = 0;
                            v79 = 0;
                            while (1)
                            {
                              v403 = *(_QWORD *)&size[0].val[2] + v402;
                              if (*(_BYTE *)(*(_QWORD *)&size[0].val[2] + v402 + 282) == 2
                                && (*(_DWORD *)(v403 + 24) != *(_DWORD *)(v403 + 48)
                                 || *(unsigned __int16 *)(*(_QWORD *)&size[0].val[2] + v402 + 40) != *(unsigned __int16 *)(*(_QWORD *)&size[0].val[2] + v402 + 64))
                                && *(_DWORD *)(v403 + 24) == token.val[0]
                                && *(unsigned __int16 *)(*(_QWORD *)&size[0].val[2] + v402 + 40) == v341)
                              {
                                if (v361 && *(_DWORD *)(*(_QWORD *)&size[0].val[2] + v402 + 72) != (_DWORD)error
                                  || v371 && *(unsigned __int16 *)(*(_QWORD *)&size[0].val[2] + v402 + 88) != v371
                                  || v351 && *(unsigned __int8 *)(*(_QWORD *)&size[0].val[2] + v402 + 284) != v351)
                                {
                                  goto LABEL_33;
                                }
                                if ((v79 & 1) != 0)
                                {
                                  sub_100001A0C((uint64_t)"%s: found multiple nat states, aborting", v395, v396, v397, v398, v399, v400, v401, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                                  v79 = 0;
                                  goto LABEL_33;
                                }
                                v79 = 1;
                                v9 = (char *)(*(_QWORD *)&size[0].val[2] + v402);
                              }
                              v402 += 297;
                              if ((int)v402 >= (int)size[0].val[0])
                                goto LABEL_33;
                            }
                          }
                          v79 = 0;
                          v9 = 0;
LABEL_33:
                          v81 = xpc_dictionary_create_reply(object);
                          if (v81)
                          {
                            v82 = v81;
                            v83 = off_100010010[0];
                            if ((v79 & 1) != 0)
                            {
                              xpc_dictionary_set_uint64(v81, off_100010010[0], 0x7D1uLL);
                              xpc_dictionary_set_data(v82, off_100010098[0], v9 + 48, 4uLL);
                              v83 = off_1000100A0[0];
                              v84 = *((unsigned __int16 *)v9 + 32);
                              v81 = v82;
                            }
                            else
                            {
                              v84 = 2000;
                            }
                            xpc_dictionary_set_uint64(v81, v83, v84);
                            sub_100003F68(v27, v82);
                          }
                          if (v80)
                            free(v80);
                          return;
                        }
                        sub_100001A0C((uint64_t)"%s: ioctl DIOCGETSTATES (second), err %d", v395, v396, v397, v398, v399, v400, v401, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                      }
                      else
                      {
                        sub_100001A0C((uint64_t)"%s: malloc %zu", v388, v389, v390, v391, v392, v393, v394, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                      }
                      v79 = 0;
                      goto LABEL_33;
                    }
                    sub_100001A0C((uint64_t)"%s: ioctl DIOCGETSTATES (first), err %d", v380, v381, v382, v383, v384, v385, v386, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                  }
                }
                else
                {
                  sub_100001A0C((uint64_t)"%s: invalid param lan port", v163, v164, v165, v166, v167, v168, v169, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
                }
              }
              else
              {
                sub_100001A0C((uint64_t)"%s: invalid param lan addr", v154, v155, v156, v157, v158, v159, v160, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
              }
            }
            else
            {
              sub_100001A0C((uint64_t)"%s: invalid param query_obj", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"__PFDQueryGatewayAddrAndPortForDescriptor");
            }
            v79 = 0;
            v80 = 0;
            goto LABEL_33;
          }
          sub_100001A0C((uint64_t)"incorrect xpc request type", v30, v31, v32, v33, v34, v35, v36, v405);
          v144 = xpc_dictionary_create_reply(object);
          if (!v144)
            goto LABEL_76;
          v77 = v144;
LABEL_71:
          v132 = off_100010010[0];
          v131 = v77;
          v133 = 2000;
LABEL_72:
          xpc_dictionary_set_uint64(v131, v132, v133);
          v78 = v27;
          goto LABEL_73;
        }
        if (object
          && xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary
          && (v181 = xpc_dictionary_get_value(object, off_100010048[0])) != 0
          && (v182 = v181, xpc_get_type(v181) == (xpc_type_t)&_xpc_type_dictionary)
          && (v183 = xpc_dictionary_get_value(v182, off_100010058[0])) != 0
          && (v184 = v183, xpc_get_type(v183) == (xpc_type_t)&_xpc_type_array))
        {
          v185 = sub_100001BAC();
          *(_QWORD *)size[0].val = 0;
          *(_QWORD *)&size[0].val[2] = 0;
          if ((ioctl(v185, 0xC0104419uLL, size) & 0x80000000) == 0)
          {
            sub_100001A48((uint64_t)"required buffer length is %d. sizeof pfsync_state is %u", v186, v187, v188, v189, v190, v191, v192, size[0].val[0]);
            v193 = ((int)size[0].val[0] & 0xFFFFFFFFFFFFFFF8) + 8;
            v194 = v193 + 40 * xpc_array_get_count(v184) + 8 * (v193 / 0x129) + 96;
            v195 = (char *)malloc_type_malloc(v194, 0x1765BE4CuLL);
            v134 = v195;
            if (!v195)
            {
              sub_100001A0C((uint64_t)"%s: malloc %zu", v196, v197, v198, v199, v200, v201, v202, (uint64_t)"__PFDQueryStatesByDescriptor");
              goto LABEL_65;
            }
            *(_QWORD *)&size[0].val[2] = v195;
            bzero(v195, v194);
            v407 = size;
            if (ioctl(v185, 0xC0104419uLL) < 0)
            {
              sub_100001A0C((uint64_t)"%s: ioctl DIOCGETSTATES (second), err %d", v203, v204, v205, v206, v207, v208, v209, (uint64_t)"__PFDQueryStatesByDescriptor");
              goto LABEL_65;
            }
            v210 = size[0].val[0];
            v409 = (int)size[0].val[0] & 0xFFFFFFFFFFFFFFF8;
            v211 = &v134[v409];
            *((_WORD *)v211 + 8) = 529;
            *((_WORD *)v211 + 20) = 7697;
            *((_WORD *)v211 + 32) = 518;
            *((_WORD *)v211 + 44) = 7686;
            v212 = (uint64_t)&v134[v409 + 104];
            v213 = *(_QWORD *)&size[0].val[2];
            if (v210 < 1)
              goto LABEL_130;
            v214 = 0;
            while (1)
            {
              v215 = *(unsigned __int8 *)(v213 + v214 + 282);
              if (v215 == 30)
                break;
              if (v215 == 2)
              {
                v216 = *(unsigned __int8 *)(v213 + v214 + 284);
                v217 = &v134[v409 + 56];
                if (v216 != 6)
                {
                  v217 = &v134[v409 + 8];
LABEL_124:
                  if (v216 != 17)
                    goto LABEL_128;
                }
                goto LABEL_127;
              }
LABEL_128:
              v214 += 297;
              if ((int)v214 >= v210)
              {
                v213 = *(_QWORD *)&size[0].val[2];
LABEL_130:
                *(_QWORD *)&v134[v409 + 24] = v212;
                v218 = v212 + 8 * *(unsigned int *)&v134[v409 + 8];
                *(_QWORD *)&v134[v409 + 48] = v218;
                v219 = v218 + 8 * *(unsigned int *)&v134[v409 + 32];
                *(_QWORD *)&v134[v409 + 72] = v219;
                *(_QWORD *)&v134[v409 + 96] = v219 + 8 * *(unsigned int *)&v134[v409 + 56];
                *(_QWORD *)token.val = &v134[v409 + 8];
                if (v210 >= 1)
                {
                  v220 = 0;
                  while (1)
                  {
                    v221 = *(unsigned __int8 *)(v213 + v220 + 282);
                    if (v221 == *(unsigned __int8 *)(v213 + v220 + 283))
                      break;
LABEL_143:
                    v220 += 297;
                    if ((int)v220 >= v210)
                      goto LABEL_144;
                  }
                  if (v221 != 2)
                  {
                    if (v221 == 30)
                    {
                      v222 = *(unsigned __int8 *)(v213 + v220 + 284);
                      if (v222 == 6)
                      {
                        v223 = (uint64_t)&v134[v409 + 80];
LABEL_142:
                        v224 = *(unsigned int *)(v223 + 4);
                        *(_QWORD *)(*(_QWORD *)(v223 + 16) + 8 * v224) = v213 + v220;
                        *(_DWORD *)(v223 + 4) = v224 + 1;
                        goto LABEL_143;
                      }
                      v223 = (uint64_t)&v134[v409 + 32];
LABEL_139:
                      if (v222 == 17)
                        goto LABEL_142;
                    }
                    sub_100001A48((uint64_t)"skipping state that is using IP Version %hhu and IP protocol %hhu.", v203, v204, v205, v206, v207, v208, v209, *(unsigned __int8 *)(v213 + v220 + 282));
                    v210 = size[0].val[0];
                    goto LABEL_143;
                  }
                  v222 = *(unsigned __int8 *)(v213 + v220 + 284);
                  v223 = (uint64_t)&v134[v409 + 56];
                  if (v222 == 6)
                    goto LABEL_142;
                  v223 = (uint64_t)&v134[v409 + 8];
                  goto LABEL_139;
                }
LABEL_144:
                sub_100001A48((uint64_t)"finished adding states to dictionary", v203, v204, v205, v206, v207, v208, v209, (uint64_t)v407);
                v410 = ((unint64_t)(((((int)size[0].val[0] & 0xFFFFFFFFFFFFFFF8) + 8)
                                          * (unsigned __int128)0xDCA8F158C7F91AB9) >> 64) >> 5) & 0x7FFFFFFFFFFFFF8;
                if (xpc_array_get_count(v184))
                {
                  v225 = 0;
                  v226 = (unsigned __int8 *)&v134[v410 + 120 + (int)v409];
                  while (1)
                  {
                    v227 = xpc_array_get_value(v184, v225);
                    if (!v227 || (v235 = v227, xpc_get_type(v227) != (xpc_type_t)&_xpc_type_dictionary))
                    {
                      sub_100001A0C((uint64_t)"input descriptor array index %u is not dictionary type", v228, v229, v230, v231, v232, v233, v234, v225);
                      goto LABEL_254;
                    }
                    v236 = xpc_dictionary_get_value(v235, off_100010060[0]);
                    if (!v236 || (v244 = v236, xpc_get_type(v236) != (xpc_type_t)&_xpc_type_data))
                    {
                      sub_100001A0C((uint64_t)"input descriptor array index %u does not or has wrong type of descriptor", v237, v238, v239, v240, v241, v242, v243, v225);
                      goto LABEL_254;
                    }
                    bytes_ptr = xpc_data_get_bytes_ptr(v244);
                    length = xpc_data_get_length(v244);
                    v247 = xpc_dictionary_get_value(v235, off_100010068[0]);
                    if (!v247 || (v255 = v247, xpc_get_type(v247) != (xpc_type_t)&_xpc_type_uuid))
                    {
                      sub_100001A0C((uint64_t)"input descriptor array index %u does not or has wrong type of descriptor id", v248, v249, v250, v251, v252, v253, v254, v225);
                      goto LABEL_254;
                    }
                    if (length != 48)
                    {
                      sub_100001A0C((uint64_t)"invalid input array element %u: incorrect length", v248, v249, v250, v251, v252, v253, v254, v225);
                      goto LABEL_254;
                    }
                    if (*bytes_ptr != 2)
                      break;
                    bytes = xpc_uuid_get_bytes(v255);
                    uuid_copy(v226, bytes);
                    v262 = sub_100004080((uint64_t *)&token, (uint64_t)bytes_ptr, (uint64_t)(v226 - 16), v257, v258, v259, v260, v261);
                    v263 = *(_QWORD *)xpc_uuid_get_bytes(v255);
                    xpc_uuid_get_bytes(v255);
                    if (v262)
                      v271 = "some states matched with descriptor %llu %llu";
                    else
                      v271 = "no states matched with descriptor %llu %llu";
                    sub_100001A48((uint64_t)v271, v264, v265, v266, v267, v268, v269, v270, v263);
                    ++v225;
                    v226 += 40;
                    if (v225 >= xpc_array_get_count(v184))
                      goto LABEL_158;
                  }
                  v406 = v225;
                  v404 = "invalid input array element %u: incorrect object type";
LABEL_253:
                  sub_100001A0C((uint64_t)v404, v248, v249, v250, v251, v252, v253, v254, v406);
LABEL_254:
                  v28 = off_100010000;
LABEL_65:
                  v135 = xpc_dictionary_create_reply(object);
                  if (v135)
                  {
                    v77 = v135;
                    xpc_dictionary_set_uint64(v135, v28[2], 0x7D0uLL);
                    goto LABEL_67;
                  }
LABEL_164:
                  sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v136, v137, v138, v139, v140, v141, v142, v406);
                  v77 = 0;
                  v143 = 1;
                }
                else
                {
LABEL_158:
                  empty = xpc_array_create_empty();
                  if (!empty)
                  {
                    v404 = "xpc_array_create_empty failed";
                    goto LABEL_253;
                  }
                  v273 = empty;
                  v274 = xpc_dictionary_create_reply(object);
                  if (!v274)
                    goto LABEL_164;
                  v77 = v274;
                  xpc_dictionary_set_uint64(v274, off_100010010[0], 0x7D1uLL);
                  if (xpc_array_get_count(v184))
                  {
                    v275 = 0;
                    v276 = &v134[v410 + 136 + (int)v409];
                    do
                    {
                      v277 = xpc_dictionary_create_empty();
                      xpc_dictionary_set_uint64(v277, off_100010088[0], *((_QWORD *)v276 - 4));
                      xpc_dictionary_set_uint64(v277, off_100010090[0], *((_QWORD *)v276 - 3));
                      xpc_dictionary_set_uuid(v277, off_100010078[0], (const unsigned __int8 *)v276 - 16);
                      v278 = *v276;
                      v276 += 40;
                      xpc_dictionary_set_BOOL(v277, off_100010080[0], v278);
                      xpc_array_append_value(v273, v277);
                      xpc_release(v277);
                      ++v275;
                    }
                    while (v275 < xpc_array_get_count(v184));
                  }
                  xpc_dictionary_set_value(v77, off_100010070[0], v273);
                  xpc_release(v273);
LABEL_67:
                  sub_100003F68(v27, v77);
                  v143 = 0;
                }
                if (v134)
                  free(v134);
                if ((v143 & 1) != 0)
                  return;
                goto LABEL_74;
              }
            }
            v216 = *(unsigned __int8 *)(v213 + v214 + 284);
            if (v216 != 6)
            {
              v217 = &v134[v409 + 32];
              goto LABEL_124;
            }
            v217 = &v134[v409 + 80];
LABEL_127:
            ++*(_DWORD *)v217;
            goto LABEL_128;
          }
          sub_100001A0C((uint64_t)"%s: ioctl DIOCGETSTATES (first), err %d", v186, v187, v188, v189, v190, v191, v192, (uint64_t)"__PFDQueryStatesByDescriptor");
        }
        else
        {
          sub_100001A0C((uint64_t)"%s: invalid param", v30, v31, v32, v33, v34, v35, v36, (uint64_t)"__PFDQueryStatesByDescriptor");
        }
        v134 = 0;
        goto LABEL_65;
    }
  }
LABEL_22:
  name = xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
  xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 32));
  sub_100001A0C((uint64_t)"%s[%d] does not have entitlements ", v54, v55, v56, v57, v58, v59, v60, (uint64_t)name);
  if (&_xpc_type_dictionary == &_xpc_type_error)
  {
LABEL_23:
    v61 = *(_QWORD *)(a1 + 32);
    xpc_dictionary_get_string(object, _xpc_error_key_description);
    sub_100001A48((uint64_t)"%p: %s", v62, v63, v64, v65, v66, v67, v68, v61);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    if (!dword_100010438)
      sub_100008360();
    --dword_100010438;
    return;
  }
  v69 = xpc_dictionary_create_reply(object);
  if (!v69)
  {
LABEL_76:
    sub_100001A0C((uint64_t)"xpc_dictionary_create_reply failed", v70, v71, v72, v73, v74, v75, v76, v405);
    return;
  }
  v77 = v69;
  xpc_dictionary_set_uint64(v69, off_100010010[0], 0x7D2uLL);
  v78 = *(_xpc_connection_s **)(a1 + 32);
LABEL_73:
  sub_100003F68(v78, v77);
LABEL_74:
  v145 = v77;
LABEL_75:
  xpc_release(v145);
}

void sub_100003F68(_xpc_connection_s *a1, xpc_object_t object)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;

  v11 = xpc_copy_description(object);
  sub_100001A84((uint64_t)"%p:\n%s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)a1);
  free(v11);
  xpc_connection_send_message(a1, object);
}

uint64_t sub_100003FC4(void *a1, const char **a2, const char **a3)
{
  xpc_object_t value;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  xpc_object_t v16;
  uint64_t v17;

  value = xpc_dictionary_get_value(a1, off_100010018[0]);
  if (!value || xpc_get_type(value) != (xpc_type_t)&_xpc_type_string)
  {
    v14 = "Incorrect type for app";
LABEL_4:
    sub_100001A0C((uint64_t)v14, v7, v8, v9, v10, v11, v12, v13, v17);
    return 0;
  }
  v16 = xpc_dictionary_get_value(a1, off_100010020[0]);
  if (!v16 || xpc_get_type(v16) != (xpc_type_t)&_xpc_type_string)
  {
    v14 = "Incorrect type for sub app";
    goto LABEL_4;
  }
  *a2 = xpc_dictionary_get_string(a1, off_100010018[0]);
  *a3 = xpc_dictionary_get_string(a1, off_100010020[0]);
  return 1;
}

uint64_t sub_100004080(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  unsigned int v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  int v25;
  int v26;
  const char *v27;
  uint64_t v29;

  for (i = 0; i != 4; ++i)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    {
      v25 = *(unsigned __int8 *)(a2 + 9);
      if ((i & 1) != 0 && v25 == 4)
        continue;
      if ((i & 1) == 0 && v25 == 96)
        continue;
    }
    if ((*(_BYTE *)(a2 + 8) & 2) != 0)
    {
      v26 = *(unsigned __int8 *)(a2 + 10);
      if (i <= 1 && v26 == 6)
        continue;
      if (i >= 2 && v26 == 17)
        continue;
    }
    v12 = *a1;
    *(_BYTE *)(a3 + 32) = 0;
    *(_QWORD *)a3 = 0;
    v13 = v12 + 24 * i;
    v16 = *(_DWORD *)(v13 + 4);
    v15 = (unsigned int *)(v13 + 4);
    v14 = v16;
    if (v16)
    {
      v17 = 0;
      v18 = (_QWORD *)(v12 + 24 * i + 16);
      do
      {
        v19 = *(_QWORD *)(*v18 + 8 * v17);
        if (((*(_BYTE *)(a2 + 8) & 0x10) == 0 || *(unsigned __int16 *)(a2 + 44) == *(unsigned __int16 *)(v19 + 40))
          && ((*(_BYTE *)(a2 + 8) & 0x20) == 0 || *(unsigned __int16 *)(a2 + 46) == *(unsigned __int16 *)(v19 + 88))
          && ((*(_BYTE *)(a2 + 8) & 2) == 0 || *(unsigned __int8 *)(a2 + 10) == *(unsigned __int8 *)(v19 + 284)))
        {
          if ((*(_BYTE *)(a2 + 8) & 1) == 0)
            goto LABEL_34;
          v20 = *(unsigned __int8 *)(a2 + 9);
          if (v20 == 96)
          {
            if (*(_BYTE *)(v19 + 282) != 2)
            {
              if ((*(_BYTE *)(a2 + 8) & 4) == 0
                || (*(_QWORD *)(a2 + 12) == *(_QWORD *)(v19 + 24)
                  ? (v21 = *(_QWORD *)(a2 + 20) == *(_QWORD *)(v19 + 32))
                  : (v21 = 0),
                    v21))
              {
                if ((*(_BYTE *)(a2 + 8) & 8) == 0
                  || (*(_QWORD *)(a2 + 28) == *(_QWORD *)(v19 + 72)
                    ? (v22 = *(_QWORD *)(a2 + 36) == *(_QWORD *)(v19 + 80))
                    : (v22 = 0),
                      v22))
                {
LABEL_34:
                  *(_BYTE *)(a3 + 32) = 1;
                  v23 = (*(unsigned int *)(v19 + 256) | ((unint64_t)*(unsigned int *)(v19 + 252) << 32))
                      + *(_QWORD *)a3;
                  v24 = (*(unsigned int *)(v19 + 248) | ((unint64_t)*(unsigned int *)(v19 + 244) << 32))
                      + *(_QWORD *)(a3 + 8);
                  *(_QWORD *)a3 = v23;
                  *(_QWORD *)(a3 + 8) = v24;
                  goto LABEL_35;
                }
              }
            }
          }
          else if (v20 != 4
                 || *(_BYTE *)(v19 + 282) != 30
                 && ((*(_BYTE *)(a2 + 8) & 4) == 0 || *(_DWORD *)(a2 + 24) == *(_DWORD *)(v19 + 48))
                 && ((*(_BYTE *)(a2 + 8) & 8) == 0 || *(_DWORD *)(a2 + 40) == *(_DWORD *)(v19 + 72)))
          {
            goto LABEL_34;
          }
        }
        sub_100001A48((uint64_t)"state did not match filter", a2, a3, a4, a5, a6, a7, a8, v29);
        v14 = *v15;
LABEL_35:
        ++v17;
      }
      while (v17 < v14);
    }
  }
  if (*(_BYTE *)(a3 + 32))
    v27 = "found";
  else
    v27 = "did not find";
  sub_100001A84((uint64_t)"%s matching states for the descriptor", a2, a3, a4, a5, a6, a7, a8, (uint64_t)v27);
  return *(unsigned __int8 *)(a3 + 32);
}

void sub_1000042B0(const char *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;

  v12 = 0;
  while (!*(_QWORD *)(a3 + 8 * v12))
  {
LABEL_8:
    if (++v12 == 10)
      return;
  }
  if (v12 > 4)
    v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s%s"), "com.apple", a1);
  else
    v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s"), "/", v22);
  v21 = v13;
  if (v13)
  {
    sub_1000043BC(a1, a2, *(_QWORD *)(a3 + 8 * v12), v13);
    CFRelease(v21);
    goto LABEL_8;
  }
  sub_100001A0C((uint64_t)"PFDRuleDeleteAnchorIDs failed creating anchor strings.", v14, v15, v16, v17, v18, v19, v20, a9);
}

BOOL sub_1000043BC(const char *a1, const char *a2, uint64_t a3, CFStringRef theString)
{
  _BOOL8 result;
  const char *CStringPtr;
  uint64_t v9;
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
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char __str[64];
  _BYTE v36[12];
  int v37;
  char v38[2736];
  uint64_t v39;
  char v40[344];

  result = 0;
  if (a1 && a2 && theString)
  {
    CStringPtr = CFStringGetCStringPtr(theString, 0);
    if (CStringPtr)
    {
      v16 = CStringPtr;
      bzero(v36, 0xC20uLL);
      if (strncmp(v16, "/", 0x40uLL))
      {
        snprintf(__str, 0x40uLL, "%s%s", a1, a2);
        strncpy(v40, __str, 0x40uLL);
      }
      snprintf(v38, 0x40uLL, "%s", v16);
      v39 = a3;
      v17 = ioctl(dword_100010390, 0xCC20441CuLL);
      if ((_DWORD)v17)
      {
        v25 = *__error();
        v26 = sub_100001BB8(3424666652);
        sub_100001A0C((uint64_t)"%s: %m", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);
        return v25 == 0;
      }
      else
      {
        if (!v37)
          sub_100005DA4(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v36);
        return 1;
      }
    }
    else
    {
      sub_100001A0C((uint64_t)"CFStringGetCStringPtr failed", v9, v10, v11, v12, v13, v14, v15, v34);
      return 0;
    }
  }
  return result;
}

CFStringRef sub_100004524(const char *a1, const char *a2, int a3, int a4, _QWORD *a5)
{
  CFStringRef v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  _BOOL4 v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30[64];
  char v31[64];
  char __str[64];

  v5 = 0;
  if (!a1 || !a2)
    return v5;
  snprintf(__str, 0x40uLL, "%s%s", "com.apple.", a1);
  snprintf(v31, 0x40uLL, "%s", a2);
  snprintf(v30, 0x40uLL, "%s%s", a1, a2);
  v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%s%s%s"));
  if (!v5)
  {
    sub_100001A0C((uint64_t)"CFStringCreateWithFormat failed in anchor create", v11, v12, v13, v14, v15, v16, v17, (uint64_t)__str);
    return v5;
  }
  if (!strncmp(a1, off_1000100D0[0], 0x40uLL))
  {
    v21 = strncmp(a1, off_1000100D8[0], 0x40uLL) == 0;
  }
  else
  {
    v18 = strncmp(a1, kPFThreadBR[0], 0x40uLL);
    v19 = strncmp(a1, off_1000100E8[0], 0x40uLL);
    v20 = strncmp(a1, off_1000100D8[0], 0x40uLL);
    v21 = v20 == 0;
    if (v19 && v18)
    {
      v22 = 0;
      v23 = 0;
      v21 = 0;
      if (v20)
        goto LABEL_19;
      goto LABEL_17;
    }
    if (v18)
    {
      v23 = 0;
      goto LABEL_15;
    }
  }
  if (sub_1000048A0((uint64_t)__str, (uint64_t)"/", 0, a3, 2u, a5))
  {
LABEL_21:
    CFRelease(v5);
    sub_1000042B0(a1, a2, (uint64_t)a5, v24, v25, v26, v27, v28, (uint64_t)__str);
    return 0;
  }
  v23 = 1;
LABEL_15:
  if (sub_1000048A0((uint64_t)__str, (uint64_t)"/", 0, a3, 4u, a5 + 1))
    goto LABEL_21;
  v22 = 1;
  if (!v21)
    goto LABEL_19;
LABEL_17:
  if (sub_1000048A0((uint64_t)__str, (uint64_t)"/", 0, a3, 5u, a5 + 2))
    goto LABEL_21;
  v21 = 1;
LABEL_19:
  if (sub_1000048A0((uint64_t)__str, (uint64_t)"/", 0, a3, 0, a5 + 3)
    || sub_1000048A0((uint64_t)__str, (uint64_t)"/", 0, a3, 1u, a5 + 4)
    || v23 && sub_1000048A0((uint64_t)v31, (uint64_t)__str, v30, a4, 2u, a5 + 5)
    || v22 && sub_1000048A0((uint64_t)v31, (uint64_t)__str, v30, a4, 4u, a5 + 6)
    || v21 && sub_1000048A0((uint64_t)v31, (uint64_t)__str, v30, a4, 5u, a5 + 7)
    || sub_1000048A0((uint64_t)v31, (uint64_t)__str, v30, a4, 0, a5 + 8)
    || sub_1000048A0((uint64_t)v31, (uint64_t)__str, v30, a4, 1u, a5 + 9))
  {
    goto LABEL_21;
  }
  return v5;
}

uint64_t sub_1000048A0(uint64_t a1, uint64_t a2, const char *a3, int a4, unsigned int a5, _QWORD *a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v30[16];
  uint64_t v31;
  _QWORD v32[215];
  char v33[64];
  int v34;
  char v35;

  bzero(v30, 0xC20uLL);
  __strlcpy_chk(&v31, a2, 1024, 1024);
  __strlcpy_chk(v32, a1, 1024, 1024);
  if (a5 <= 5 && ((0x37u >> a5) & 1) != 0)
    v35 = 0xB0800040002uLL >> (8 * a5);
  v34 = a4;
  if (a3)
    strncpy(v33, a3, 0x40uLL);
  if (ioctl(dword_100010390, 0xCC20441BuLL, v30))
  {
    v19 = 0;
    v20 = *__error();
    if (v20 && v20 != 17)
    {
      v19 = v20;
      v21 = sub_100001BB8(3424666651);
      sub_100001A0C((uint64_t)"%s - anchor %s(%s): %m", v22, v23, v24, v25, v26, v27, v28, (uint64_t)v21);
    }
  }
  else
  {
    if (a6)
      *a6 = v32[214];
    sub_100001A84((uint64_t)"inserted - anchor %s-%s", v12, v13, v14, v15, v16, v17, v18, a2);
    return 0;
  }
  return v19;
}

CFStringRef sub_100004A2C(const char *a1, const char *a2)
{
  CFStringEncoding SystemEncoding;
  char __str[64];

  snprintf(__str, 0x40uLL, "%s%s/%s", "com.apple.", a1, a2);
  SystemEncoding = CFStringGetSystemEncoding();
  return CFStringCreateWithCString(kCFAllocatorDefault, __str, SystemEncoding);
}

BOOL sub_100004ABC(const char *a1, const char *a2, const __CFString *a3, void *a4)
{
  _BOOL8 result;
  const char *CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  char *v17;
  uint64_t v18;
  int64_t count;
  int64_t v20;
  size_t v21;
  xpc_object_t value;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char __dst[8256];
  char __str[64];

  result = 1;
  if (a2 && a1 && a3 && a4)
  {
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    if (CStringPtr)
    {
      v16 = CStringPtr;
      snprintf(__str, 0x40uLL, "%s%s", a1, a2);
      memcpy(__dst, &unk_1000089C0, sizeof(__dst));
      v17 = &__dst[4];
      v18 = 8;
      do
      {
        if (v18 != 2)
          __strlcpy_chk(v17, v16, 64, 1024);
        v17 += 1032;
        --v18;
      }
      while (v18);
      if (!sub_100004C78(0xC0104451uLL, (uint64_t)__dst))
      {
        count = xpc_array_get_count(a4);
        if (count < 1)
          return sub_100004C78(0xC0104452uLL, (uint64_t)__dst) == 0;
        v20 = count;
        v21 = 0;
        while (1)
        {
          value = xpc_array_get_value(a4, v21);
          if (sub_100004CF4(value, v16, (uint64_t)__dst, 0xFFFF, __str, 0))
            break;
          if (v20 == ++v21)
            return sub_100004C78(0xC0104452uLL, (uint64_t)__dst) == 0;
        }
        sub_100001A0C((uint64_t)"rule %d failed during commit", v23, v24, v25, v26, v27, v28, v29, v21);
      }
      sub_100004C78(0xC0104453uLL, (uint64_t)__dst);
    }
    else
    {
      sub_100001A0C((uint64_t)"CFStringGetCStringPtr failed", v9, v10, v11, v12, v13, v14, v15, v30);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100004C78(unint64_t a1, uint64_t a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[0] = 0x40800000008;
  v13[1] = a2;
  if (!ioctl(dword_100010390, a1, v13))
    return 0;
  v3 = *__error();
  v4 = sub_100001BB8(a1);
  sub_100001A0C((uint64_t)"%s: %m", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  return v3;
}

uint64_t sub_100004CF4(void *a1, const char *a2, uint64_t a3, int a4, const char *a5, _QWORD *a6)
{
  uint64_t v11;
  const char *v12;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  char v38;
  char uint64;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *string;
  xpc_object_t v49;
  xpc_object_t v50;
  xpc_object_t v51;
  xpc_object_t v52;
  xpc_object_t v53;
  xpc_object_t v54;
  xpc_object_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  xpc_object_t v58;
  xpc_object_t v59;
  int v60;
  xpc_object_t v61;
  int v62;
  xpc_object_t v63;
  xpc_object_t v64;
  xpc_object_t v65;
  xpc_object_t v66;
  xpc_object_t v67;
  xpc_object_t v68;
  xpc_object_t v69;
  xpc_object_t v70;
  xpc_object_t v71;
  xpc_object_t v72;
  xpc_object_t v73;
  xpc_object_t v74;
  xpc_object_t v75;
  const char *v76;
  const char *v77;
  xpc_object_t v78;
  xpc_object_t v79;
  xpc_object_t v80;
  xpc_object_t v81;
  xpc_object_t v82;
  xpc_object_t v83;
  xpc_object_t v84;
  xpc_object_t v85;
  xpc_object_t v86;
  xpc_object_t v87;
  xpc_object_t v88;
  xpc_object_t v89;
  xpc_object_t v90;
  xpc_object_t v91;
  xpc_object_t v92;
  xpc_object_t v93;
  xpc_object_t v94;
  xpc_object_t v95;
  xpc_object_t v96;
  uint64_t v97;
  int v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _BYTE *v107;
  char __str[64];
  _BYTE v110[4];
  int v111;
  char v112;
  char v113[1029];
  int8x16_t v114[5];
  __int128 v115;
  _OWORD v116[128];
  int8x16_t v117[3];
  __int16 v118;
  __int16 v119;
  char v120;
  BOOL v121;
  int8x16_t v122[3];
  __int16 v123;
  __int16 v124;
  char v125;
  BOOL v126;
  char v127[144];
  char v128[64];
  char v129[172];
  __int16 v130;
  __int16 v131;
  char v132;
  char v133;
  uint64_t v134;
  char v135[64];
  int v136;
  int v137;
  int v138;
  int v139;
  __int16 v140;
  int v141;
  int v142;
  char v143;
  int v144;
  int v145;
  char v146;
  int v147;
  char v148;
  char v149;
  char v150;
  char v151;
  BOOL v152;
  BOOL v153;
  BOOL v154;
  char v155;
  char v156;
  char v157;
  char v158;
  char v159;
  char v160;
  char v161;
  char v162;
  BOOL v163;
  char v164;
  char v165;
  char v166;
  int v167;
  int v168;

  memset(v116, 0, 496);
  v115 = 0u;
  bzero(v110, 0x470uLL);
  snprintf(v113, 0x400uLL, "%s", a2);
  v107 = v110;
  if (!ioctl(dword_100010390, 0xC4704433uLL)
    || (v11 = *__error(),
        v12 = sub_100001BB8(3295691827),
        sub_100001A0C((uint64_t)"%s: %m", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v12),
        !(_DWORD)v11))
  {
    value = xpc_dictionary_get_value(a1, off_100010188[0]);
    if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
    {
      bzero(&v115, 0xC20uLL);
      LOBYTE(v29) = xpc_dictionary_get_uint64(a1, off_100010188[0]);
      v148 = v29;
      if (v29 >= 2uLL)
      {
        if ((v29 & 0xFE) == 2)
        {
          v37 = 0;
        }
        else if ((v29 & 0xFE) == 4)
        {
          v37 = 2;
        }
        else
        {
          v38 = v29 - 8;
          if ((v29 - 8) < 7u && ((0x63u >> v38) & 1) != 0)
          {
            v29 = 0xE0D0E0E0E0908uLL >> (8 * v38);
            v37 = 4;
          }
          else if ((unint64_t)v29 - 11 >= 2)
          {
            sub_100001A0C((uint64_t)"incorrect type of action", v30, v31, v32, v33, v34, v35, v36, (uint64_t)v107);
            v37 = 22;
            LOBYTE(v29) = v148;
          }
          else
          {
            v37 = 5;
          }
        }
      }
      else
      {
        v37 = 1;
      }
      if (v29 <= 0xDu && ((1 << v29) & 0x2110) != 0)
      {
        v11 = sub_1000075C8(v114, a1, off_1000101E0[0]);
        if ((_DWORD)v11)
          return v11;
        if (v148 == 13)
          uint64 = 2;
        else
          uint64 = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
        v112 = uint64;
        if (ioctl(dword_100010390, 0xC4704434uLL, v110))
        {
          v11 = *__error();
          v40 = sub_100001BB8(3295691828);
          sub_100001A0C((uint64_t)"%s: %m", v41, v42, v43, v44, v45, v46, v47, (uint64_t)v40);
          return v11;
        }
      }
      if (a3)
        DWORD1(v115) = *(_DWORD *)(a3 + 1032 * v37 + 1028);
      v136 = a4;
      DWORD2(v115) = v111;
      snprintf((char *)v116, 0x40uLL, "%s", a2);
      strncpy(v135, a5, 0x40uLL);
      string = xpc_dictionary_get_string(a1, off_1000101A0[0]);
      if (string)
        snprintf(v127, 0x10uLL, "%s", string);
      v49 = xpc_dictionary_get_value(a1, off_100010198[0]);
      if (v49 && xpc_get_type(v49) == (xpc_type_t)&_xpc_type_uint64)
        v149 = xpc_dictionary_get_uint64(a1, off_100010198[0]);
      v50 = xpc_dictionary_get_value(a1, off_100010308[0]);
      if (v50 && xpc_get_type(v50) == (xpc_type_t)&_xpc_type_uint64)
        v150 = xpc_dictionary_get_uint64(a1, off_100010308[0]);
      v51 = xpc_dictionary_get_value(a1, off_100010310[0]);
      if (v51 && xpc_get_type(v51) == (xpc_type_t)&_xpc_type_uint64)
        v151 = xpc_dictionary_get_uint64(a1, off_100010310[0]);
      v52 = xpc_dictionary_get_value(a1, off_1000101B8[0]);
      if (v52 && xpc_get_type(v52) == (xpc_type_t)&_xpc_type_BOOL)
        v152 = xpc_dictionary_get_BOOL(a1, off_1000101B8[0]);
      v53 = xpc_dictionary_get_value(a1, off_1000101A8[0]);
      if (v53 && xpc_get_type(v53) == (xpc_type_t)&_xpc_type_uint64)
        v156 = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
      v54 = xpc_dictionary_get_value(a1, off_100010318[0]);
      if (v54 && xpc_get_type(v54) == (xpc_type_t)&_xpc_type_uint64)
        v158 = xpc_dictionary_get_uint64(a1, off_100010318[0]) + 1;
      v55 = xpc_dictionary_get_value(a1, off_100010320[0]);
      if (v55 && xpc_get_type(v55) == (xpc_type_t)&_xpc_type_uint64)
        v159 = xpc_dictionary_get_uint64(a1, off_100010320[0]) + 1;
      v56 = xpc_dictionary_get_value(a1, off_1000101B0[0]);
      if (v56 && xpc_get_type(v56) == (xpc_type_t)&_xpc_type_uint64)
        v157 = xpc_dictionary_get_uint64(a1, off_1000101B0[0]);
      v57 = xpc_dictionary_get_value(a1, off_100010370[0]);
      if (v57 && xpc_get_type(v57) == (xpc_type_t)&_xpc_type_uint64)
        v140 = xpc_dictionary_get_uint64(a1, off_100010370[0]);
      v58 = xpc_dictionary_get_value(a1, off_100010368[0]);
      if (v58 && xpc_get_type(v58) == (xpc_type_t)&_xpc_type_uint64)
        v162 = xpc_dictionary_get_uint64(a1, off_100010368[0]);
      v59 = xpc_dictionary_get_value(a1, off_100010360[0]);
      if (v59 && xpc_get_type(v59) == (xpc_type_t)&_xpc_type_uint64)
      {
        v60 = xpc_dictionary_get_uint64(a1, off_100010360[0]);
        v147 |= v60;
      }
      v61 = xpc_dictionary_get_value(a1, off_100010328[0]);
      if (v61)
      {
        if (xpc_get_type(v61) == (xpc_type_t)&_xpc_type_uint64)
        {
          v62 = xpc_dictionary_get_uint64(a1, off_100010328[0]);
          v147 |= v62;
          if ((v147 & 8) != 0)
            v139 = 17040131;
        }
      }
      v63 = xpc_dictionary_get_value(a1, off_100010330[0]);
      if (v63 && xpc_get_type(v63) == (xpc_type_t)&_xpc_type_uint64)
        v164 = xpc_dictionary_get_uint64(a1, off_100010330[0]);
      v64 = xpc_dictionary_get_value(a1, off_100010338[0]);
      if (v64 && xpc_get_type(v64) == (xpc_type_t)&_xpc_type_uint64)
      {
        LOWORD(v139) = xpc_dictionary_get_uint64(a1, off_100010338[0]) | 0x300;
        HIWORD(v139) = 260;
      }
      v65 = xpc_dictionary_get_value(a1, off_100010340[0]);
      if (v65)
      {
        if (xpc_get_type(v65) == (xpc_type_t)&_xpc_type_uint64)
        {
          HIWORD(v139) = xpc_dictionary_get_uint64(a1, off_100010340[0]) | 0x100;
          if (!(_WORD)v139)
            LOWORD(v139) = 771;
        }
      }
      v66 = xpc_dictionary_get_value(a1, off_1000102E0[0]);
      if (v66 && xpc_get_type(v66) == (xpc_type_t)&_xpc_type_uint64)
        v143 = xpc_dictionary_get_uint64(a1, off_1000102E0[0]);
      v67 = xpc_dictionary_get_value(a1, off_1000102D0[0]);
      if (v67 && xpc_get_type(v67) == (xpc_type_t)&_xpc_type_uint64)
        v141 = xpc_dictionary_get_uint64(a1, off_1000102D0[0]);
      v68 = xpc_dictionary_get_value(a1, off_1000102D8[0]);
      if (v68 && xpc_get_type(v68) == (xpc_type_t)&_xpc_type_uint64)
        v142 = xpc_dictionary_get_uint64(a1, off_1000102D8[0]);
      v69 = xpc_dictionary_get_value(a1, off_100010300[0]);
      if (v69 && xpc_get_type(v69) == (xpc_type_t)&_xpc_type_uint64)
        v146 = xpc_dictionary_get_uint64(a1, off_100010300[0]);
      v70 = xpc_dictionary_get_value(a1, off_1000102F0[0]);
      if (v70 && xpc_get_type(v70) == (xpc_type_t)&_xpc_type_uint64)
        v144 = xpc_dictionary_get_uint64(a1, off_1000102F0[0]);
      v71 = xpc_dictionary_get_value(a1, off_1000102F8[0]);
      if (v71 && xpc_get_type(v71) == (xpc_type_t)&_xpc_type_uint64)
        v145 = xpc_dictionary_get_uint64(a1, off_1000102F8[0]);
      v72 = xpc_dictionary_get_value(a1, off_1000101E8[0]);
      if (v72 && xpc_get_type(v72) == (xpc_type_t)&_xpc_type_uint64)
        v160 = xpc_dictionary_get_uint64(a1, off_1000101E8[0]);
      v73 = xpc_dictionary_get_value(a1, off_1000101F0[0]);
      if (v73 && xpc_get_type(v73) == (xpc_type_t)&_xpc_type_uint64)
        v161 = xpc_dictionary_get_uint64(a1, off_1000101F0[0]);
      v74 = xpc_dictionary_get_value(a1, off_100010220[0]);
      if (v74 && xpc_get_type(v74) == (xpc_type_t)&_xpc_type_uint64)
        v155 = xpc_dictionary_get_uint64(a1, off_100010220[0]);
      v75 = xpc_dictionary_get_value(a1, off_100010228[0]);
      if (v75 && xpc_get_type(v75) == (xpc_type_t)&_xpc_type_BOOL)
        v163 = xpc_dictionary_get_BOOL(a1, off_100010228[0]);
      v76 = xpc_dictionary_get_string(a1, off_100010348[0]);
      if (v76)
        snprintf(v128, 0x40uLL, "%s", v76);
      v77 = xpc_dictionary_get_string(a1, off_100010350[0]);
      if (v77)
        snprintf(v129, 0x40uLL, "%s", v77);
      v78 = xpc_dictionary_get_value(a1, off_100010358[0]);
      if (v78 && xpc_get_type(v78) == (xpc_type_t)&_xpc_type_BOOL)
        v153 = xpc_dictionary_get_BOOL(a1, off_100010358[0]);
      v79 = xpc_dictionary_get_value(a1, off_100010248[0]);
      if (v79 && xpc_get_type(v79) == (xpc_type_t)&_xpc_type_uint64)
        v166 = xpc_dictionary_get_uint64(a1, off_100010248[0]);
      v80 = xpc_dictionary_get_value(a1, off_100010240[0]);
      if (v80 && xpc_get_type(v80) == (xpc_type_t)&_xpc_type_uint64)
        v165 = xpc_dictionary_get_uint64(a1, off_100010240[0]);
      v81 = xpc_dictionary_get_value(a1, off_100010250[0]);
      if (v81 && xpc_get_type(v81) == (xpc_type_t)&_xpc_type_uint64)
        v137 = xpc_dictionary_get_uint64(a1, off_100010250[0]);
      v82 = xpc_dictionary_get_value(a1, off_100010258[0]);
      if (v82 && xpc_get_type(v82) == (xpc_type_t)&_xpc_type_BOOL)
        v154 = xpc_dictionary_get_BOOL(a1, off_100010258[0]);
      v83 = xpc_dictionary_get_value(a1, off_100010260[0]);
      if (v83 && xpc_get_type(v83) == (xpc_type_t)&_xpc_type_uint64)
        v138 = xpc_dictionary_get_uint64(a1, off_100010260[0]);
      v84 = xpc_dictionary_get_value(a1, off_100010380[0]);
      if (v84 && xpc_get_type(v84) == (xpc_type_t)&_xpc_type_uint64)
        v168 = xpc_dictionary_get_uint64(a1, off_100010380[0]);
      v85 = xpc_dictionary_get_value(a1, off_100010378[0]);
      if (v85 && xpc_get_type(v85) == (xpc_type_t)&_xpc_type_uint64)
        v167 = xpc_dictionary_get_uint64(a1, off_100010378[0]);
      v11 = sub_1000075C8(v117, a1, off_1000101C0[0]);
      if (!(_DWORD)v11)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102A8[0]);
        v86 = xpc_dictionary_get_value(a1, __str);
        if (v86 && xpc_get_type(v86) == (xpc_type_t)&_xpc_type_BOOL)
          v121 = xpc_dictionary_get_BOOL(a1, __str);
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102C0[0]);
        v87 = xpc_dictionary_get_value(a1, __str);
        if (v87 && xpc_get_type(v87) == (xpc_type_t)&_xpc_type_uint64)
          v120 = xpc_dictionary_get_uint64(a1, __str);
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        v88 = xpc_dictionary_get_value(a1, __str);
        if (v88 && xpc_get_type(v88) == (xpc_type_t)&_xpc_type_uint64)
          v118 = bswap32(xpc_dictionary_get_uint64(a1, __str)) >> 16;
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B8[0]);
        v89 = xpc_dictionary_get_value(a1, __str);
        if (v89 && xpc_get_type(v89) == (xpc_type_t)&_xpc_type_uint64)
          v119 = bswap32(xpc_dictionary_get_uint64(a1, __str)) >> 16;
        v11 = sub_1000075C8(v122, a1, "to");
        if (!(_DWORD)v11)
        {
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102A8[0]);
          v90 = xpc_dictionary_get_value(a1, __str);
          if (v90 && xpc_get_type(v90) == (xpc_type_t)&_xpc_type_BOOL)
            v126 = xpc_dictionary_get_BOOL(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102C0[0]);
          v91 = xpc_dictionary_get_value(a1, __str);
          if (v91 && xpc_get_type(v91) == (xpc_type_t)&_xpc_type_uint64)
            v125 = xpc_dictionary_get_uint64(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
          v92 = xpc_dictionary_get_value(a1, __str);
          if (v92 && xpc_get_type(v92) == (xpc_type_t)&_xpc_type_uint64)
            v123 = bswap32(xpc_dictionary_get_uint64(a1, __str)) >> 16;
          snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B8[0]);
          v93 = xpc_dictionary_get_value(a1, __str);
          if (v93 && xpc_get_type(v93) == (xpc_type_t)&_xpc_type_uint64)
            v124 = bswap32(xpc_dictionary_get_uint64(a1, __str)) >> 16;
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102C0[0]);
          v94 = xpc_dictionary_get_value(a1, __str);
          if (v94 && xpc_get_type(v94) == (xpc_type_t)&_xpc_type_uint64)
            v132 = xpc_dictionary_get_uint64(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B0[0]);
          v95 = xpc_dictionary_get_value(a1, __str);
          if (v95 && xpc_get_type(v95) == (xpc_type_t)&_xpc_type_uint64)
            v130 = xpc_dictionary_get_uint64(a1, __str);
          snprintf(__str, 0x40uLL, "%s%s", off_1000101E0[0], off_1000102B8[0]);
          v96 = xpc_dictionary_get_value(a1, __str);
          if (v96 && xpc_get_type(v96) == (xpc_type_t)&_xpc_type_uint64)
            v131 = xpc_dictionary_get_uint64(a1, __str);
          if (v148 == 13)
          {
            v156 = 30;
            v133 = 2;
          }
          if (a3)
          {
            v97 = 3424666628;
            v98 = ioctl(dword_100010390, 0xCC204404uLL, &v115);
          }
          else
          {
            v97 = 3424666651;
            v98 = ioctl(dword_100010390, 0xCC20441BuLL, &v115);
          }
          if (v98)
          {
            v11 = *__error();
            v99 = sub_100001BB8(v97);
            sub_100001A0C((uint64_t)"%s: %m", v100, v101, v102, v103, v104, v105, v106, (uint64_t)v99);
          }
          else
          {
            v11 = 0;
          }
          if (a6)
            *a6 = v134;
        }
      }
    }
    else
    {
      sub_100001A0C((uint64_t)"incorrect action value", v21, v22, v23, v24, v25, v26, v27, (uint64_t)v107);
      return 22;
    }
  }
  return v11;
}

BOOL sub_100005CB4(const char *a1, const char *a2)
{
  _BOOL8 result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char __str[64];
  _BYTE v22[12];
  int v23;
  char v24[344];

  result = 0;
  if (a1 && a2)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    bzero(v22, 0xC20uLL);
    strncpy(v24, __str, 0x40uLL);
    v4 = ioctl(dword_100010390, 0xCC20441CuLL);
    if ((_DWORD)v4)
    {
      v12 = *__error();
      v13 = sub_100001BB8(3424666652);
      sub_100001A0C((uint64_t)"%s: %m", v14, v15, v16, v17, v18, v19, v20, (uint64_t)v13);
      return v12 == 0;
    }
    else
    {
      if (!v23)
        sub_100005DA4(v4, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v22);
      return 1;
    }
  }
  return result;
}

uint64_t sub_100005DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
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
  const char *v23;
  uint64_t result;
  const char *v25;
  uint64_t v26;
  uint64_t v27;

  if (!qword_1000103A0)
    return sub_100001A84((uint64_t)"pf is already disabled", a2, a3, a4, a5, a6, a7, a8, a9);
  v26 = qword_1000103A0;
  v27 = 0;
  v25 = (const char *)&v26;
  if (ioctl(dword_100010390, 0xC0104409uLL))
  {
    if (*__error() == 2)
    {
      v23 = "pf not enabled";
    }
    else
    {
      v25 = sub_100001BB8(3222291465);
      v23 = "%s: %m";
    }
    return sub_100001A0C((uint64_t)v23, v16, v17, v18, v19, v20, v21, v22, (uint64_t)v25);
  }
  else
  {
    if (v27)
      result = sub_100001A84((uint64_t)"pf still enabled with %llu other reference%s", v9, v10, v11, v12, v13, v14, v15, v27);
    else
      result = sub_100001A84((uint64_t)"pf disabled", v9, v10, v11, v12, v13, v14, v15, (uint64_t)&v26);
    qword_1000103A0 = 0;
  }
  return result;
}

BOOL sub_100005E88(const char *a1, const char *a2, const __CFString *a3, int a4, void *a5, _QWORD *a6)
{
  _BOOL8 result;
  const char *CStringPtr;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char __str[64];

  result = 0;
  if (a1 && a2 && a3 && a5)
  {
    snprintf(__str, 0x40uLL, "%s%s", a1, a2);
    CStringPtr = CFStringGetCStringPtr(a3, 0);
    if (CStringPtr)
    {
      return sub_100004CF4(a5, CStringPtr, 0, a4, __str, a6) == 0;
    }
    else
    {
      sub_100001A0C((uint64_t)"CFStringGetCStringPtr failed", v13, v14, v15, v16, v17, v18, v19, v20);
      return 0;
    }
  }
  return result;
}

uint64_t sub_100005F64(const __CFString *a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  _BYTE v24[12];
  int v25;
  char v26[2624];
  _QWORD v27[53];
  char v28;

  bzero(v24, 0xC20uLL);
  v27[1] = v27;
  if (CFStringGetCString(a1, v26, 1024, 0x8000100u))
  {
    v11 = 0;
    *a2 = 0;
    while (1)
    {
      if ((v11 & 0x7FFFFFFB) != 0xA && v11 != 12 && v11 != 9 && (v11 & 0x7FFFFFF9) != 1)
      {
        v28 = v11;
        if (ioctl(dword_100010390, 0xCC204406uLL, v24))
        {
          v23 = sub_100001BB8(3424666630);
          sub_100001A0C((uint64_t)"%s: %m", v16, v17, v18, v19, v20, v21, v22, (uint64_t)v23);
          return 0;
        }
        *a2 += v25;
      }
      if (++v11 == 15)
        return 1;
    }
  }
  sub_100001A0C((uint64_t)"%s: anchor name too long", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"PFDRuleGetNumberOfRules");
  return 0;
}

BOOL sub_1000060A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_1000103A0)
  {
    sub_100001A84((uint64_t)"pf is already enabled", a2, a3, a4, a5, a6, a7, a8, v25);
    return 1;
  }
  if (!ioctl(dword_100010390, 0x40084408uLL))
    return 1;
  v16 = *__error();
  if (v16 == 17)
  {
    sub_100001A0C((uint64_t)"pf already enabled", v9, v10, v11, v12, v13, v14, v15, (uint64_t)&qword_1000103A0);
    return 1;
  }
  v17 = sub_100001BB8(1074283528);
  sub_100001A0C((uint64_t)"%s: %m", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
  return v16 == 0;
}

xpc_object_t sub_100006150(const __CFString *a1, _BYTE *a2)
{
  xpc_object_t v4;
  int v5;
  BOOL v6;
  BOOL v7;
  int v9;
  int v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  char **v24;
  const char *v25;
  protoent *v26;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t v30;
  char *v31;
  char v32;
  int v33;
  xpc_object_t v34;
  void *v35;
  xpc_object_t v36;
  void *v37;
  xpc_object_t v38;
  void *v39;
  xpc_object_t v40;
  void *v41;
  xpc_object_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned __int8 v51;
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
  uint64_t v65;
  const char *v66;
  char v67;
  _QWORD *v68;
  _QWORD *v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  void **v81;
  char v82;
  const char *v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v112;
  _BYTE *v113;
  const char *CStringPtr;
  int v115;
  _BYTE v116[4];
  int v117;
  int v118;
  char v119[2048];
  int32x4_t v120[2];
  char v121;
  unsigned __int16 v122;
  unsigned __int16 v123;
  unsigned __int8 v124;
  int32x4_t v125[2];
  unsigned __int8 v126;
  unsigned __int16 v127;
  unsigned __int16 v128;
  unsigned __int8 v129;
  char v130[144];
  char v131[64];
  char v132[112];
  void *v133;
  void **v134;
  unsigned __int16 v135;
  unsigned __int16 v136;
  unsigned __int8 v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unsigned __int16 v145;
  unsigned __int16 v146;
  unsigned __int16 v147;
  unsigned int v148;
  int v149;
  unsigned __int8 v150;
  unsigned int v151;
  unsigned __int8 v152;
  unsigned int value;
  unsigned __int8 value_4;
  unsigned __int8 value_5;
  unsigned __int8 value_6;
  unsigned __int8 value_7;
  char v158;
  char v159;
  char v160;
  unsigned __int8 v161;
  unsigned __int8 v162;
  unsigned __int8 v163;
  unsigned __int8 v164;
  unsigned __int8 v165;
  unsigned __int8 v166;
  unsigned __int8 v167;
  unsigned __int8 v168;
  char v169;
  unsigned __int8 v170;
  unsigned __int8 v171;
  unsigned __int8 v172;
  unsigned int v173;
  unsigned int v174;
  char v175[64];
  char v176[16];
  _BYTE v177[1027];
  uint64_t v178;

  bzero(v116, 0xC20uLL);
  CStringPtr = CFStringGetCStringPtr(a1, 0);
  snprintf(v119, 0x40uLL, "%s", CStringPtr);
  v4 = xpc_array_create(0, 0);
  v5 = 0;
  v113 = a2;
  while (1)
  {
    v6 = (v5 & 0x7FFFFFFB) == 0xA || v5 == 12;
    v7 = v6 || v5 == 9;
    if (!v7 && (v5 & 0x7FFFFFF9) != 1)
    {
      value_4 = v5;
      if (ioctl(dword_100010390, 0xCC204406uLL, v116))
      {
        v94 = 3424666630;
LABEL_172:
        v103 = sub_100001BB8(v94);
        sub_100001A0C((uint64_t)"%s: %m", v104, v105, v106, v107, v108, v109, v110, (uint64_t)v103);
        xpc_release(v4);
        v4 = 0;
        *a2 = 0;
        return v4;
      }
      v115 = v118;
      if (v118 >= 1)
        break;
    }
LABEL_161:
    if (++v5 == 15)
    {
      if (!xpc_array_get_count(v4))
      {
        sub_100001A84((uint64_t)"no rules in the anchor %s", v86, v87, v88, v89, v90, v91, v92, (uint64_t)CStringPtr);
        xpc_release(v4);
        v4 = 0;
      }
      *a2 = 1;
      return v4;
    }
  }
  v9 = 0;
  while (1)
  {
    v118 = v9;
    if (ioctl(dword_100010390, 0xCC204407uLL, v116))
    {
      v94 = 3424666631;
      goto LABEL_172;
    }
    v10 = v117;
    v11 = xpc_dictionary_create(0, 0, 0);
    if (!v11)
      goto LABEL_175;
    v19 = v11;
    xpc_dictionary_set_uint64(v11, off_100010188[0], value_4);
    if (value_4 > 0xEu || ((1 << value_4) & 0x6330) == 0)
      xpc_dictionary_set_uint64(v19, off_100010198[0], value_5);
    if (v130[0])
      xpc_dictionary_set_string(v19, off_1000101A0[0], v130);
    if (v162)
      xpc_dictionary_set_uint64(v19, off_1000101A8[0], v162);
    if (value_4 == 1 && (value & 0xD) != 0)
      break;
LABEL_42:
    if (v163)
    {
      v26 = getprotobynumber(v163);
      if (v26)
        xpc_dictionary_set_string(v19, off_1000101B0[0], v26->p_name);
      else
        xpc_dictionary_set_uint64(v19, off_1000101B0[0], v163);
    }
    if (v158)
      xpc_dictionary_set_BOOL(v19, off_1000101B8[0], 1);
    if (v171 - 1 <= 2)
      xpc_dictionary_set_uint64(v19, off_100010240[0], v171);
    if (v172 - 1 <= 2)
      xpc_dictionary_set_uint64(v19, off_100010248[0], v172);
    if (!value_4 && v161)
      xpc_dictionary_set_uint64(v19, off_100010220[0], v161);
    if (v169)
      xpc_dictionary_set_BOOL(v19, off_100010228[0], 1);
    if ((_DWORD)v143)
      xpc_dictionary_set_uint64(v19, off_100010250[0], v143);
    if (v160)
      xpc_dictionary_set_BOOL(v19, off_100010258[0], 1);
    if ((_DWORD)v144)
      xpc_dictionary_set_uint64(v19, off_100010260[0], v144);
    if (v138)
      xpc_dictionary_set_uint64(v19, off_100010268[0], v138);
    if (v139)
      xpc_dictionary_set_uint64(v19, off_100010270[0], v139);
    if (v140)
      xpc_dictionary_set_uint64(v19, off_100010278[0], v140);
    if (v141)
      xpc_dictionary_set_uint64(v19, off_100010280[0], v141);
    if (v142)
      xpc_dictionary_set_uint64(v19, off_100010288[0], v142);
    if (v166)
    {
      v27 = 0;
      *(_OWORD *)v177 = 0u;
      *(_OWORD *)v176 = 0u;
      v28 = v176;
      v29 = 70;
      do
      {
        if (((v166 >> v27) & 1) != 0)
          *v28++ = v29;
        v29 = aFsrpauew[++v27];
      }
      while (v27 != 8);
      if (!v167)
        goto LABEL_86;
    }
    else
    {
      if (!v167)
        goto LABEL_87;
      *(_OWORD *)v177 = 0u;
      *(_OWORD *)v176 = 0u;
      v28 = v176;
    }
    v30 = 0;
    *v28 = 47;
    v31 = v28 + 1;
    v32 = 70;
    do
    {
      if (((v167 >> v30) & 1) != 0)
        *v31++ = v32;
      v32 = aFsrpauew[++v30];
    }
    while (v30 != 8);
LABEL_86:
    xpc_dictionary_set_string(v19, off_1000101E8[0], v176);
LABEL_87:
    if (v150 && !sub_100007C7C(v150, v148, v149, off_1000101F8[0], v19)
      || v152 && !sub_100007C7C(v152, v151, v151, off_100010200[0], v19))
    {
      goto LABEL_170;
    }
    v33 = value_4;
    if (value_4 == 2)
    {
      if (!value && !v168 && !v147)
        goto LABEL_107;
      v34 = xpc_dictionary_create(0, 0, 0);
      if (!v34)
        goto LABEL_165;
      v35 = v34;
      if (value)
        xpc_dictionary_set_uint64(v34, off_100010360[0], value);
      if (v168)
        xpc_dictionary_set_uint64(v35, off_100010368[0], v168);
      if (v147)
        xpc_dictionary_set_uint64(v35, off_100010370[0], v147);
      xpc_dictionary_set_value(v19, off_100010218[0], v35);
      xpc_release(v35);
      v33 = value_4;
    }
    if (v33 == 11 && v173)
    {
      v36 = xpc_dictionary_create(0, 0, 0);
      if (!v36)
        goto LABEL_165;
      v37 = v36;
      xpc_dictionary_set_uint64(v36, off_100010380[0], v174);
      xpc_dictionary_set_uint64(v37, off_100010378[0], v173);
      xpc_dictionary_set_value(v19, off_100010238[0], v37);
      xpc_release(v37);
    }
LABEL_107:
    if (value_6)
    {
      v38 = xpc_dictionary_create(0, 0, 0);
      if (!v38)
        goto LABEL_165;
      v39 = v38;
      if (value_6)
        xpc_dictionary_set_uint64(v38, off_100010308[0], value_6);
      if (value_7)
      {
        snprintf(v175, 0x40uLL, "pflog%d", value_7);
        xpc_dictionary_set_string(v39, off_100010310[0], v175);
      }
      xpc_dictionary_set_value(v19, off_100010208[0], v39);
      xpc_release(v39);
    }
    if ((v163 == 58 || v163 == 1) && v164)
    {
      v40 = xpc_dictionary_create(0, 0, 0);
      if (!v40)
      {
        xpc_release(v19);
        v93 = "subrule xpc_dictionary_create() failed %m";
        goto LABEL_176;
      }
      v41 = v40;
      xpc_dictionary_set_uint64(v40, off_100010318[0], v164 - 1);
      if (v165)
        xpc_dictionary_set_uint64(v41, off_100010320[0], v165 - 1);
      xpc_dictionary_set_value(v19, off_100010210[0], v41);
      xpc_release(v41);
    }
    if (v131[0] | v132[0])
    {
      v42 = xpc_dictionary_create(0, 0, 0);
      if (!v42)
      {
LABEL_165:
        xpc_release(v19);
        v93 = "subrule xpc_dictionary_create failed %m";
        goto LABEL_176;
      }
      v43 = v42;
      if (v131[0])
        xpc_dictionary_set_string(v42, off_100010348[0], v131);
      if (v132[0])
        xpc_dictionary_set_string(v43, off_100010350[0], v132);
      if (v159)
        xpc_dictionary_set_BOOL(v43, off_100010358[0], 1);
      xpc_dictionary_set_value(v19, off_100010230[0], v43);
      xpc_release(v43);
    }
    if (v121
      || (vmaxvq_u8((uint8x16_t)vmvnq_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v120[0]), (int16x8_t)vceqzq_s32(v120[1])), (int8x16_t)vuzp1q_s16((int16x8_t)vceqzq_s32(v125[0]), (int16x8_t)vceqzq_s32(v125[1]))))) & 1) != 0|| v126 | v124|| v129)
    {
      if (!sub_100007EAC((uint64_t)v120, v162, v124, v122, v123, v163, v19, off_1000101C0[0]))
      {
        v95 = "get source address/port failed";
LABEL_169:
        sub_100001A0C((uint64_t)v95, v44, v45, v46, v47, v48, v49, v50, v112);
LABEL_170:
        xpc_release(v19);
        goto LABEL_177;
      }
      if ((sub_100007EAC((uint64_t)v125, v162, v129, v127, v128, v163, v19, off_1000101D8[0]) & 1) == 0)
      {
        v95 = "get destination address/port failed";
        goto LABEL_169;
      }
    }
    v51 = value_4;
    if (value_4 <= 0xDu && ((1 << value_4) & 0x2110) != 0)
    {
      bzero(v176, 0x470uLL);
      memcpy(&v177[3], CStringPtr, 0x400uLL);
      v177[0] = v51;
      *(_DWORD *)&v176[12] = v9;
      *(_DWORD *)&v176[4] = v10;
      if (ioctl(dword_100010390, 0xC4704435uLL))
      {
        sub_100001A0C((uint64_t)"DIOCGETADDRS %m", v52, v53, v54, v55, v56, v57, v58, (uint64_t)v176);
LABEL_137:
        v66 = "get pool for nat/rdr failed";
LABEL_138:
        sub_100001A0C((uint64_t)v66, v59, v60, v61, v62, v63, v64, v65, v112);
        v67 = 0;
LABEL_139:
        v68 = v133;
        if (v133)
        {
          do
          {
            v69 = (_QWORD *)v68[6];
            free(v68);
            v68 = v69;
          }
          while (v69);
        }
        a2 = v113;
        if ((v67 & 1) == 0)
          goto LABEL_170;
      }
      else
      {
        v133 = 0;
        v134 = &v133;
        v70 = *(_DWORD *)&v176[8];
        if (*(_DWORD *)&v176[8])
        {
          v71 = 0;
          while (1)
          {
            *(_DWORD *)&v176[8] = v71;
            if (ioctl(dword_100010390, 0xC4704436uLL, v176))
              break;
            v79 = (char *)malloc_type_calloc(1uLL, 0x58uLL, 0x10A2040E07ACC14uLL);
            if (!v79)
            {
              v83 = "calloc failed %m";
LABEL_158:
              sub_100001A0C((uint64_t)v83, v72, v73, v74, v75, v76, v77, v78, v112);
              v84 = v133;
              if (v133)
              {
                do
                {
                  v85 = (_QWORD *)v84[6];
                  free(v84);
                  v84 = v85;
                }
                while (v85);
              }
              goto LABEL_137;
            }
            v80 = v79;
            memmove(v79, &v178, 0x58uLL);
            *((_QWORD *)v80 + 6) = 0;
            v81 = v134;
            *((_QWORD *)v80 + 7) = v134;
            *v81 = v80;
            v134 = (void **)(v80 + 48);
            if (v70 == ++v71)
            {
              a2 = v113;
              if (!v133)
                goto LABEL_142;
              v82 = sub_100007EAC((uint64_t)v133, v162, v137, v135, v136, v163, v19, off_1000101E0[0]);
              v66 = "get nat/rdr failed";
              if ((v82 & 1) != 0)
              {
                v67 = 1;
                goto LABEL_139;
              }
              goto LABEL_138;
            }
          }
          v83 = "DIOCGETADDR %m";
          goto LABEL_158;
        }
      }
    }
LABEL_142:
    xpc_array_append_value(v4, v19);
    xpc_release(v19);
    *a2 = 1;
    if (++v9 == v115)
      goto LABEL_161;
  }
  v21 = xpc_dictionary_create(0, 0, 0);
  if (v21)
  {
    v22 = v21;
    if ((value & 8) != 0)
    {
      v25 = off_100010328[0];
      v23 = 8;
    }
    else
    {
      if ((value & 1) != 0)
      {
        xpc_dictionary_set_uint64(v21, off_100010328[0], 1uLL);
        v23 = v170;
        if (!v170)
        {
LABEL_41:
          xpc_dictionary_set_value(v19, off_100010190[0], v22);
          xpc_release(v22);
          goto LABEL_42;
        }
        v24 = off_100010330;
      }
      else
      {
        if ((value & 4) == 0)
          goto LABEL_41;
        xpc_dictionary_set_uint64(v21, off_100010328[0], 4uLL);
        if (v145)
          xpc_dictionary_set_uint64(v22, off_100010338[0], v145);
        v23 = v146;
        if (!v146)
          goto LABEL_41;
        v24 = off_100010340;
      }
      v25 = *v24;
      v21 = v22;
    }
    xpc_dictionary_set_uint64(v21, v25, v23);
    goto LABEL_41;
  }
  xpc_release(v19);
LABEL_175:
  v93 = "xpc_dictionary_create failed %m";
LABEL_176:
  sub_100001A0C((uint64_t)v93, v12, v13, v14, v15, v16, v17, v18, v112);
LABEL_177:
  *a2 = 0;
  sub_100001A0C((uint64_t)"creating xpc from pf rule failed", v96, v97, v98, v99, v100, v101, v102, v112);
  xpc_release(v4);
  return 0;
}

BOOL sub_100006DF0(const char *a1, const char *a2)
{
  int v2;
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
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v27[13];
  uint64_t v28;

  v2 = -1;
  if (a1)
  {
    if (a2)
    {
      v28 = 0;
      memset(v27, 0, sizeof(v27));
      snprintf((char *)&v27[9] + 8, 0x40uLL, "%s%s", a1, a2);
      sub_100001A0C((uint64_t)"clearing states for %s", v4, v5, v6, v7, v8, v9, v10, (uint64_t)&v27[9] + 8);
      if (!ioctl(dword_100010390, 0xC0D84412uLL, v27)
        || (v2 = *__error(),
            v18 = sub_100001BB8(3235398674),
            sub_100001A0C((uint64_t)"%s: %m", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v18),
            !v2))
      {
        sub_100001A84((uint64_t)"pf states cleared for %s(%s)", v11, v12, v13, v14, v15, v16, v17, (uint64_t)a1);
        v2 = 0;
      }
    }
  }
  return v2 == 0;
}

uint64_t sub_100006F14(void *a1, void *a2)
{
  xpc_object_t value;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  xpc_object_t v17;
  unsigned int uint64;
  xpc_object_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  xpc_object_t v28;
  unsigned int v29;
  xpc_object_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  xpc_object_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *string;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  int v73;
  char key[64];
  char __str[64];

  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0;
  value = xpc_dictionary_get_value(a1, off_100010198[0]);
  if (value && xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
  {
    HIBYTE(v73) = xpc_dictionary_get_uint64(a1, off_100010198[0]);
    xpc_dictionary_set_uint64(a2, off_100010198[0], HIBYTE(v73));
  }
  v5 = xpc_dictionary_get_value(a1, off_1000101A8[0]);
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_uint64)
  {
    LOBYTE(v73) = xpc_dictionary_get_uint64(a1, off_1000101A8[0]);
    xpc_dictionary_set_uint64(a2, off_1000101A8[0], v73);
  }
  v6 = xpc_dictionary_get_value(a1, off_1000101B0[0]);
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_uint64)
  {
    BYTE1(v73) = xpc_dictionary_get_uint64(a1, off_1000101B0[0]);
    xpc_dictionary_set_uint64(a2, off_1000101B0[0], BYTE1(v73));
  }
  v7 = xpc_dictionary_create(0, 0, 0);
  if (v7)
  {
    v15 = v7;
    if (sub_1000073C0(&v68, a1, off_1000101C0[0], v7))
    {
LABEL_12:
      v16 = 0;
LABEL_37:
      xpc_release(v15);
      return v16;
    }
    snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
    v17 = xpc_dictionary_get_value(a1, __str);
    if (v17 && xpc_get_type(v17) == (xpc_type_t)&_xpc_type_uint64)
    {
      uint64 = xpc_dictionary_get_uint64(a1, __str);
      LOWORD(v72) = bswap32(uint64) >> 16;
      xpc_dictionary_set_uint64(v15, off_1000102B0[0], (unsigned __int16)uint64);
    }
    v19 = xpc_dictionary_create(0, 0, 0);
    if (!v19)
    {
      sub_100001A0C((uint64_t)"xpc_dictionary_create failed", v20, v21, v22, v23, v24, v25, v26, v66);
      goto LABEL_12;
    }
    v27 = v19;
    if (!sub_1000073C0(&v69, a1, off_1000101D8[0], v19))
    {
      snprintf(__str, 0x40uLL, "%s%s", off_1000101D8[0], off_1000102B0[0]);
      v28 = xpc_dictionary_get_value(a1, __str);
      if (v28 && xpc_get_type(v28) == (xpc_type_t)&_xpc_type_uint64)
      {
        v29 = xpc_dictionary_get_uint64(a1, __str);
        WORD2(v72) = bswap32(v29) >> 16;
        xpc_dictionary_set_uint64(v27, off_1000102B0[0], (unsigned __int16)v29);
      }
      if (ioctl(dword_100010390, 0xC0544417uLL, &v68) == -1)
      {
        snprintf(__str, 0x40uLL, "%s%s", off_1000101C0[0], off_100010298[0]);
        snprintf(key, 0x40uLL, "%s%s", off_1000101C0[0], off_1000102B0[0]);
        string = xpc_dictionary_get_string(a1, __str);
        xpc_dictionary_get_uint64(a1, key);
        sub_100001A0C((uint64_t)"pf nat lookup failed %s:%hu (%m)", v56, v57, v58, v59, v60, v61, v62, (uint64_t)string);
      }
      else
      {
        v30 = xpc_dictionary_create(0, 0, 0);
        if (v30)
        {
          v38 = v30;
          if ((sub_100007500(&v70, v73, v30) & 1) != 0)
          {
            if (WORD4(v72))
              xpc_dictionary_set_uint64(v38, off_1000102B0[0], __rev16(WORD4(v72)));
            v46 = xpc_dictionary_create(0, 0, 0);
            if (v46)
            {
              v47 = v46;
              v16 = sub_100007500(&v71, v73, v46);
              if ((v16 & 1) != 0)
              {
                if (WORD6(v72))
                  xpc_dictionary_set_uint64(v47, off_1000102B0[0], __rev16(WORD6(v72)));
                xpc_dictionary_set_value(a2, off_1000101C0[0], v15);
                xpc_dictionary_set_value(a2, off_1000101D8[0], v27);
                xpc_dictionary_set_value(a2, off_1000101C8[0], v38);
                xpc_dictionary_set_value(a2, off_1000101D0[0], v47);
              }
              else
              {
                sub_100001A0C((uint64_t)"natlook getting internal destination address failed", v48, v49, v50, v51, v52, v53, v54, v67);
              }
              xpc_release(v47);
              goto LABEL_44;
            }
            v64 = "xpc_dictionary_create failed";
          }
          else
          {
            v64 = "natlook getting internal source address failed";
          }
          sub_100001A0C((uint64_t)v64, v39, v40, v41, v42, v43, v44, v45, v67);
          v16 = 0;
LABEL_44:
          xpc_release(v38);
          goto LABEL_36;
        }
        sub_100001A0C((uint64_t)"xpc_dictionary_create failed", v31, v32, v33, v34, v35, v36, v37, v67);
      }
    }
    v16 = 0;
LABEL_36:
    xpc_release(v27);
    goto LABEL_37;
  }
  sub_100001A0C((uint64_t)"xpc_dictionary_create failed", v8, v9, v10, v11, v12, v13, v14, v65);
  return 0;
}

uint64_t sub_1000073C0(_DWORD *a1, void *a2, const char *a3, void *a4)
{
  const char *string;
  const char *v8;
  uint64_t result;
  addrinfo *v10;
  addrinfo *v11;
  addrinfo v12;
  int v13;
  char __str[64];

  v11 = 0;
  if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010298[0]) < 1)
    return 22;
  string = xpc_dictionary_get_string(a2, __str);
  if (!string)
    return 22;
  v8 = string;
  v13 = 0;
  xpc_dictionary_set_string(a4, off_100010298[0], string);
  if (inet_pton(2, v8, &v13) == 1)
  {
    result = 0;
    *a1 = v13;
    return result;
  }
  memset(&v12.ai_socktype, 0, 40);
  v12.ai_socktype = 2;
  *(_QWORD *)&v12.ai_flags = 0x1E00000004;
  if (getaddrinfo(v8, "0", &v12, &v11))
    return 22;
  v10 = v11;
  *(_OWORD *)a1 = *(_OWORD *)&v11->ai_addr->sa_data[6];
  freeaddrinfo(v10);
  return 0;
}

uint64_t sub_100007500(_DWORD *a1, int a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD v12[3];

  if (!*a1 && !a1[1] && !a1[2] && !a1[3])
    return 1;
  memset(v12, 0, 46);
  if (inet_ntop(a2, a1, (char *)v12, 0x2Eu))
  {
    xpc_dictionary_set_string(a3, off_100010298[0], (const char *)v12);
    return 1;
  }
  sub_100001A0C((uint64_t)"inet_ntop failed %m", v4, v5, v6, v7, v8, v9, v10, *(uint64_t *)&v12[0]);
  return 0;
}

uint64_t sub_1000075C8(int8x16_t *a1, void *a2, const char *a3)
{
  const char *v6;
  char *v7;
  char *v8;
  char *v9;
  const char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  size_t v21;
  size_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  size_t v32;
  size_t v33;
  const char *string;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  __int8 v46;
  char v47;
  char *v48;
  int v49;
  int64x2_t v50;
  int8x16_t v51;
  const char *v52;
  const char *v53;
  const char *v54;
  addrinfo *v55;
  uint64_t uint64;
  int64x2_t v57;
  int8x16_t v58;
  int8x16_t *v59;
  unsigned int v60;
  int *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  int8x16_t v71;
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
  uint64_t v84;
  uint64_t v85;
  addrinfo *v86;
  int64x2_t v87;
  int *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *__endptr;
  addrinfo *v99;
  addrinfo v100;
  char __str[64];

  if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010290[0]) < 1 || (v6 = xpc_dictionary_get_string(a2, __str)) == 0)
  {
    __endptr = 0;
    if (snprintf(__str, 0x40uLL, "%s%s", a3, off_100010298[0]) >= 1
      && (v7 = (char *)xpc_dictionary_get_string(a2, __str)) != 0)
    {
      v8 = v7;
      v9 = strrchr(v7, 47);
      if (v9)
      {
        v10 = v9;
        v11 = v9 + 1;
        v12 = strtol(v9 + 1, &__endptr, 0);
        if (!__endptr || __endptr == v11 || *__endptr || (v20 = v12, v12 >= 129))
        {
          sub_100001A0C((uint64_t)"invalid netmask '%s'\n", v13, v14, v15, v16, v17, v18, v19, (uint64_t)v10);
          return 22;
        }
        v21 = strlen(v8);
        v22 = strlen(v10);
        v23 = (char *)malloc_type_malloc(v21 - v22 + 1, 0x75BFF506uLL);
        if (v23)
        {
          v31 = v23;
          v32 = strlen(v8);
          v33 = strlen(v10);
          strlcpy(v31, v8, v32 - v33 + 1);
          goto LABEL_32;
        }
        v53 = "address: malloc";
      }
      else
      {
        v48 = strdup(v8);
        if (v48)
        {
          v31 = v48;
          v20 = 0x80;
LABEL_32:
          v100.ai_flags = 0;
          if (strrchr(v8, 47))
          {
            v49 = inet_net_pton(2, v8, &v100, 4uLL);
            if (v49 == -1)
            {
              v52 = "inet_net_pton failed for %s with %s";
LABEL_53:
              v62 = __error();
              strerror(*v62);
              sub_100001A84((uint64_t)v52, v63, v64, v65, v66, v67, v68, v69, (uint64_t)v8);
              v99 = 0;
              memset(&v100.ai_socktype, 0, 40);
              v100.ai_socktype = 2;
              *(_QWORD *)&v100.ai_flags = 0x1E00000004;
              v70 = getaddrinfo(v31, "0", &v100, &v99);
              if (v70)
              {
                gai_strerror(v70);
                sub_100001A84((uint64_t)"getaddrinfo failed for %s with %s", v72, v73, v74, v75, v76, v77, v78, (uint64_t)v31);
                free(v31);
                sub_100001A0C((uint64_t)"no IP address found for %s", v79, v80, v81, v82, v83, v84, v85, (uint64_t)v8);
                return 22;
              }
              v86 = v99;
              v87 = *(int64x2_t *)&v99->ai_addr->sa_data[6];
              *a1 = (int8x16_t)v87;
              sub_100007B04(a1, v20, v87, v71);
              freeaddrinfo(v86);
LABEL_56:
              free(v31);
              return 0;
            }
          }
          else
          {
            if (inet_pton(2, v8, &v100) != 1)
            {
              v52 = "inet_pton failed for %s with %s";
              goto LABEL_53;
            }
            LOBYTE(v49) = 32;
          }
          a1->i32[0] = v100.ai_flags;
          a1[2].i8[8] = 0;
          sub_100007B04(a1, v49, v50, v51);
          goto LABEL_56;
        }
        v53 = "address: strdup";
      }
    }
    else
    {
      if (snprintf(__str, 0x40uLL, "%s%s", a3, off_1000102A0[0]) < 1)
        return 0;
      string = xpc_dictionary_get_string(a2, __str);
      if (!string)
        return 0;
      v35 = strdup(string);
      if (v35)
      {
        v36 = v35;
        v37 = strrchr(v35, 58);
        if (v37)
        {
          v45 = v37;
          v46 = 0;
          do
          {
            if (!strcmp(v45 + 1, "network"))
            {
              v47 = 1;
            }
            else if (!strcmp(v45 + 1, "broadcast"))
            {
              v47 = 2;
            }
            else if (!strcmp(v45 + 1, "peer"))
            {
              v47 = 4;
            }
            else
            {
              if (strcmp(v45 + 1, "0"))
                goto LABEL_62;
              v47 = 8;
            }
            v46 |= v47;
            *v45 = 0;
            v45 = strrchr(v36, 58);
          }
          while (v45);
        }
        else
        {
          v46 = 0;
        }
        if ((v46 & (v46 - 1) & 6) != 0)
        {
          v54 = "illegal combination of interface modifiers\n";
        }
        else
        {
          *(_QWORD *)&v100.ai_flags = 0;
          if ((getifaddrs((ifaddrs **)&v100) & 0x80000000) == 0)
          {
            v55 = &v100;
            do
            {
              v55 = *(addrinfo **)&v55->ai_flags;
              if (!v55)
              {
                freeifaddrs(*(ifaddrs **)&v100.ai_flags);
                goto LABEL_60;
              }
            }
            while (strncmp(*(const char **)&v55->ai_socktype, v36, 0x10uLL));
            freeifaddrs(*(ifaddrs **)&v100.ai_flags);
            a1[2].i8[8] = 2;
            a1[2].i8[9] = v46;
            snprintf(a1->i8, 0x10uLL, "%s", v36);
            uint64 = xpc_dictionary_get_uint64(a2, off_1000101A8[0]);
            if (uint64 == 30)
            {
              v59 = a1;
              v60 = 128;
            }
            else
            {
              if (uint64 != 2)
                return 0;
              v59 = a1;
              v60 = 32;
            }
            sub_100007B04(v59, v60, v57, v58);
            return 0;
          }
          v88 = __error();
          v89 = strerror(*v88);
          sub_100001A0C((uint64_t)"getifaddrs failed %s", v90, v91, v92, v93, v94, v95, v96, (uint64_t)v89);
LABEL_60:
          v97 = (uint64_t)v36;
          v54 = "invalid interface name %s";
        }
        sub_100001A0C((uint64_t)v54, v38, v39, v40, v41, v42, v43, v44, v97);
LABEL_62:
        free(v36);
        return 22;
      }
      v53 = "dynamic address: strdup";
    }
    sub_100001A0C((uint64_t)v53, v24, v25, v26, v27, v28, v29, v30, v97);
    return 12;
  }
  if (!strncmp(v6, off_100010388, 0x40uLL))
    return 0;
  return 22;
}

int64x2_t sub_100007B04(int8x16_t *a1, unsigned int a2, int64x2_t result, int8x16_t a4)
{
  unsigned __int8 v4;
  int8x16_t *v6;
  unsigned __int8 v7;
  unint64_t v8;
  int8x8_t v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  int v13;
  uint32x4_t v14;
  int v15;
  int32x4_t v16;
  uint32x4_t v17;
  int32x4_t v18;
  int8x16_t v19;

  v4 = a2;
  a1[1].i64[0] = 0;
  a1[1].i64[1] = 0;
  v6 = a1 + 1;
  v7 = a2 - 32;
  if (a2 < 0x20)
  {
    v10 = 0;
  }
  else
  {
    v8 = v7 >> 5;
    memset(&a1[1], 255, 4 * v8 + 4);
    result = vdupq_n_s64(v8);
    a4.i8[4] = 0;
    a4.i8[5] = 0;
    a4.i8[6] = 0;
    a4.i8[7] = 0;
    a4.i8[8] = 0;
    a4.i8[9] = 0;
    a4.i8[10] = 0;
    a4.i8[11] = 0;
    a4.i8[12] = 0;
    a4.i8[13] = 0;
    a4.i8[14] = 0;
    a4.i8[15] = 0;
    v9.i8[1] = -32;
    v9.i16[1] = -7968;
    v9.i32[1] = -522133280;
    v9.i8[0] = v7;
    *(int8x8_t *)result.i8 = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008990, (uint64x2_t)result), (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008980, (uint64x2_t)result)), (int16x8_t)vuzp1q_s32((int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008970, (uint64x2_t)result), (int32x4_t)vcgtq_u64((uint64x2_t)xmmword_100008960, (uint64x2_t)result)))), (int8x8_t)v4, v9);
    result.i8[0] = vaddv_s8(*(int8x8_t *)result.i8);
    v4 = result.i8[0];
    v10 = v8 + 1;
  }
  if (v4)
  {
    v11 = 0;
    v12 = v4 ^ 0x1F;
    if (v12 >= 0x1E)
      v12 = 30;
    v13 = v12 ^ 0x1F;
    v14 = (uint32x4_t)vdupq_n_s32(v13 - 1);
    v15 = ((_BYTE)v13 + 3) & 0x3C;
    a4.i32[0] = v6->i32[v10];
    v16 = (int32x4_t)xmmword_1000089A0;
    v17.i64[0] = 0x100000001;
    v17.i64[1] = 0x100000001;
    v18.i64[0] = 0x300000003;
    v18.i64[1] = 0x300000003;
    do
    {
      v19 = a4;
      a4 = vorrq_s8(a4, (int8x16_t)vshlq_u32(v17, (uint32x4_t)v16));
      v11 += 4;
      v16 = vaddq_s32(v16, v18);
    }
    while (v15 != v11);
    result = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v11 - 4), (int8x16_t)xmmword_1000089B0), v14), v19, a4);
    *(int8x8_t *)result.i8 = vorr_s8(*(int8x8_t *)result.i8, (int8x8_t)*(_OWORD *)&vextq_s8((int8x16_t)result, (int8x16_t)result, 8uLL));
    v6->i32[v10] = bswap32(result.i32[0] | result.i32[1]);
  }
  if (!a1[2].i8[8])
  {
    result = (int64x2_t)vandq_s8(a1[1], *a1);
    *a1 = (int8x16_t)result;
  }
  return result;
}

BOOL sub_100007C7C(unsigned int a1, unsigned int a2, int a3, const char *a4, void *a5)
{
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  const char *v18;
  size_t v19;
  int v20;
  char **v21;
  char **v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  uint64_t v27;

  LODWORD(v7) = a3;
  v17 = xpc_dictionary_create(0, 0, 0);
  if (v17)
  {
    v18 = off_1000101F8[0];
    v19 = strnlen(off_1000101F8[0], 0x40uLL);
    v20 = strncmp(a4, v18, v19);
    if (a2 == 0x7FFFFFFF && (a1 & 0xFE) == 2)
    {
      v7 = a1;
      if (v20)
      {
        xpc_dictionary_set_string(v17, off_1000102E8[0], "unknown");
        v21 = off_100010300;
LABEL_10:
        xpc_dictionary_set_uint64(v17, *v21, v7);
        v22 = off_100010200;
LABEL_16:
        xpc_dictionary_set_value(a5, *v22, v17);
        xpc_release(v17);
        return v17 != 0;
      }
      xpc_dictionary_set_string(v17, off_1000102C8[0], "unknown");
      v23 = off_1000102E0[0];
      v24 = v17;
      v25 = a1;
    }
    else
    {
      if (v20)
      {
        xpc_dictionary_set_uint64(v17, off_1000102F0[0], a2);
        v21 = off_1000102F8;
        v7 = v7;
        xpc_dictionary_set_uint64(v17, off_1000102F8[0], v7);
        xpc_dictionary_set_uint64(v17, off_100010300[0], a1);
        v22 = off_100010200;
        if (a1 > 9 || ((1 << a1) & 0x302) == 0)
          goto LABEL_16;
        goto LABEL_10;
      }
      xpc_dictionary_set_uint64(v17, off_1000102D0[0], a2);
      xpc_dictionary_set_uint64(v17, off_1000102E0[0], a1);
      v22 = off_1000101F8;
      if (a1 > 9 || ((1 << a1) & 0x302) == 0)
        goto LABEL_16;
      v23 = off_1000102D8[0];
      v25 = v7;
      v24 = v17;
    }
    xpc_dictionary_set_uint64(v24, v23, v25);
    v22 = off_1000101F8;
    goto LABEL_16;
  }
  sub_100001A0C((uint64_t)"unable to create subrule dictionary for ugid %m", v10, v11, v12, v13, v14, v15, v16, v27);
  return v17 != 0;
}

uint64_t sub_100007EAC(uint64_t a1, int a2, unsigned int a3, int a4, int a5, int a6, void *a7, char *a8)
{
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  const char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  const char *v32;
  unsigned int v33;
  int v34;
  char v35;
  int v36;
  const char *v37;
  servent *v38;
  unsigned int v39;
  unsigned int v40;
  const char **p_s_name;
  const char *v42;
  void *v43;
  uint64_t v44;
  uint64_t v46;
  char string[64];
  char __str[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;

  LODWORD(v11) = a5;
  LODWORD(v12) = a4;
  v16 = xpc_dictionary_create(0, 0, 0);
  if (v16)
  {
    v24 = v16;
    if (*(_BYTE *)(a1 + 40))
    {
      if (*(_BYTE *)(a1 + 40) == 2)
      {
        v50 = 0u;
        v51 = 0u;
        *(_OWORD *)__str = 0u;
        v49 = 0u;
        v25 = *(_BYTE *)(a1 + 41);
        if ((v25 & 1) != 0)
        {
          snprintf(__str, 0x40uLL, "%s:network", (const char *)a1);
          v25 = *(_BYTE *)(a1 + 41);
          if ((v25 & 2) == 0)
          {
LABEL_6:
            if ((v25 & 4) == 0)
              goto LABEL_7;
            goto LABEL_31;
          }
        }
        else if ((*(_BYTE *)(a1 + 41) & 2) == 0)
        {
          goto LABEL_6;
        }
        snprintf(__str, 0x40uLL, "%s:broadcast", (const char *)a1);
        v25 = *(_BYTE *)(a1 + 41);
        if ((v25 & 4) == 0)
        {
LABEL_7:
          if ((v25 & 8) == 0)
          {
LABEL_9:
            v26 = off_1000102A0[0];
            v27 = __str;
            goto LABEL_46;
          }
LABEL_8:
          snprintf(__str, 0x40uLL, "%s:0", (const char *)a1);
          goto LABEL_9;
        }
LABEL_31:
        snprintf(__str, 0x40uLL, "%s:peer", (const char *)a1);
        if ((*(_BYTE *)(a1 + 41) & 8) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }
      v32 = "not supported address type";
LABEL_34:
      sub_100001A0C((uint64_t)v32, v17, v18, v19, v20, v21, v22, v23, v46);
      v28 = 0;
LABEL_64:
      xpc_release(v24);
      return v28;
    }
    if (*(_DWORD *)a1
      || *(_DWORD *)(a1 + 4)
      || *(_DWORD *)(a1 + 8)
      || *(_DWORD *)(a1 + 12)
      || *(_DWORD *)(a1 + 16)
      || *(_DWORD *)(a1 + 20)
      || *(_DWORD *)(a1 + 24)
      || *(_DWORD *)(a1 + 28))
    {
      v50 = 0u;
      v51 = 0u;
      *(_OWORD *)__str = 0u;
      v49 = 0u;
      if (!inet_ntop(a2, (const void *)a1, __str, 0x40u))
      {
        v32 = "inet_ntop failed %m";
        goto LABEL_34;
      }
      if (!*(_DWORD *)(a1 + 16) && !*(_DWORD *)(a1 + 20) && !*(_DWORD *)(a1 + 24) && !*(_DWORD *)(a1 + 28))
        goto LABEL_44;
      v29 = 0;
      v30 = 0;
      while (1)
      {
        v31 = *(_DWORD *)(a1 + 16 + v29);
        if (v31 != -1)
          break;
        v30 += 32;
        v29 += 4;
        if (v29 == 16)
        {
          v30 = 128;
          goto LABEL_39;
        }
      }
      v33 = bswap32(v31);
      if ((v33 & 0x80000000) != 0)
      {
        v34 = 0;
        do
          v35 = v34-- + 30;
        while (((v33 >> v35) & 1) != 0);
        v30 -= v34;
      }
LABEL_39:
      v36 = a2 == 2 ? 32 : 128;
      if (v30 == v36)
        snprintf(string, 0x40uLL, "%s");
      else
LABEL_44:
        snprintf(string, 0x40uLL, "%s/%d");
      v26 = off_100010298[0];
      v27 = string;
    }
    else
    {
      v26 = off_100010290[0];
      v27 = off_100010388;
    }
LABEL_46:
    xpc_dictionary_set_string(v24, v26, v27);
    if (a6 == 6)
      v37 = "tcp";
    else
      v37 = "udp";
    v38 = getservbyport(v12, v37);
    v39 = __rev16(v12);
    v40 = __rev16(v11);
    if (off_1000101E0[0] == a8)
      v11 = v11;
    else
      v11 = v40;
    if (off_1000101E0[0] == a8)
      v12 = v12;
    else
      v12 = v39;
    if (v38 && ((p_s_name = (const char **)&v38->s_name, a3 - 2 < 6) || !a3))
    {
      xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
      xpc_dictionary_set_string(v24, off_1000102B0[0], *p_s_name);
    }
    else if ((_DWORD)v12)
    {
      if (a3 - 2 >= 6 && a3)
      {
        if (!(_DWORD)v11 || (_DWORD)v12 == (_DWORD)v11 || a3 > 9 || ((1 << a3) & 0x302) == 0)
          goto LABEL_63;
        xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
        xpc_dictionary_set_uint64(v24, off_1000102B0[0], v12);
        v42 = off_1000102B8[0];
        v43 = v24;
        v44 = v11;
      }
      else
      {
        xpc_dictionary_set_uint64(v24, off_1000102C0[0], a3);
        v42 = off_1000102B0[0];
        v43 = v24;
        v44 = v12;
      }
      xpc_dictionary_set_uint64(v43, v42, v44);
    }
LABEL_63:
    xpc_dictionary_set_value(a7, a8, v24);
    v28 = 1;
    goto LABEL_64;
  }
  sub_100001A0C((uint64_t)"subrule xpc_dictionary_create failed %m", v17, v18, v19, v20, v21, v22, v23, v46);
  return 0;
}

void sub_1000082F4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create os log object", v0, 2u);
}

void sub_100008338()
{
  __assert_rtn("PFDClientNewConnection", "PFDClient.c", 1401, "__pfdnclients != 0");
}

void sub_100008360()
{
  __assert_rtn("__PFDClientRemoveConnection", "PFDClient.c", 1319, "__pfdnclients != 0");
}
