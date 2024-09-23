size_t sub_1000026E4()
{
  FILE *v0;
  const char *v1;
  size_t v2;
  unint64_t v3;
  unint64_t v4;
  mach_port_t v5;
  size_t result;
  int v7;
  mach_msg_type_number_t host_info64_outCnt;
  integer_t host_info64_out[4];
  int v10;
  int v11;
  size_t v12;
  unint64_t v13;
  char __str[255];

  v12 = 8;
  v13 = 0;
  if (sysctlbyname("hw.memsize", &v13, &v12, 0, 0))
  {
    v0 = __stderrp;
    v1 = "could not get hw.memsize\n";
    v2 = 25;
  }
  else
  {
    v11 = 0;
    v12 = 4;
    if (sysctlbyname("vm.pagesize", &v11, &v12, 0, 0))
    {
      v0 = __stderrp;
      v1 = "could not get vm.pagesize\n";
      v2 = 26;
    }
    else
    {
      v3 = v13;
      v4 = v11;
      host_info64_outCnt = 38;
      v5 = mach_host_self();
      result = host_statistics64(v5, 4, host_info64_out, &host_info64_outCnt);
      if ((_DWORD)result)
      {
        v0 = __stderrp;
        v1 = "host_statistics64 call failed\n";
        v2 = 30;
      }
      else
      {
        v7 = vaddvq_s32(*(int32x4_t *)host_info64_out);
        if (100 * (unint64_t)(v7 + v10) / (v3 / v4) - 120 > 0xFFFFFFFFFFFFFFD8)
          return result;
        snprintf(__str, 0xFFuLL, "VM has reached unhealthy accounting levels at %llu%%. resident page count: %llu, max pages: %llu", 100 * (unint64_t)(v7 + v10) / (v3 / v4), (v7 + v10), v3 / v4);
        sub_100002880(__str);
        v0 = __stderrp;
        v1 = "panic or reboot failed\n";
        v2 = 23;
      }
    }
  }
  return fwrite(v1, v2, 1uLL, v0);
}

uint64_t sub_100002880(const char *a1)
{
  FILE *v2;
  FILE *v3;
  mach_port_t v4;
  FILE *v5;
  const char *v6;
  size_t v7;
  FILE *v8;
  const char *v9;
  size_t v10;
  pid_t v12[2];
  posix_spawn_file_actions_t v13;
  mach_msg_type_number_t host_info64_outCnt;
  stat host_info64_out;
  char *__argv[2];

  v2 = fopen("/var/mobile/Library/Logs/khwm.log", "w");
  if (!v2)
  {
    fwrite("could not create reboot log file\n", 0x21uLL, 1uLL, __stderrp);
    goto LABEL_18;
  }
  v3 = v2;
  host_info64_outCnt = 38;
  v4 = mach_host_self();
  if (!host_statistics64(v4, 4, &host_info64_out.st_dev, &host_info64_outCnt))
  {
    fprintf(v3, "Wired Memory Pages: %d\n", HIDWORD(host_info64_out.st_ino));
    fclose(v3);
    *(_QWORD *)v12 = 0;
    v13 = 0;
    *(_OWORD *)__argv = off_100010300;
    if (posix_spawn_file_actions_init(&v13))
    {
      fwrite("posix_spawn_file_actions_init call failed\n", 0x2AuLL, 1uLL, __stderrp);
LABEL_17:
      sync();
      goto LABEL_18;
    }
    if (posix_spawn_file_actions_addopen(&v13, 1, "/var/mobile/Library/Logs/khwm.log", 9, 0))
    {
      v5 = __stderrp;
      v6 = "posix_spawn_file_actions_addopen failed\n";
      v7 = 40;
    }
    else if (posix_spawn(&v12[1], "/usr/bin/zprint", &v13, 0, __argv, 0))
    {
      v5 = __stderrp;
      v6 = "posix_spawn failed\n";
      v7 = 19;
    }
    else if (wait4(v12[1], v12, 0, 0))
    {
      v5 = __stderrp;
      v6 = "wait4 call failed\n";
      v7 = 18;
    }
    else
    {
      if (!BYTE1(v12[0]))
      {
LABEL_16:
        posix_spawn_file_actions_destroy(&v13);
        goto LABEL_17;
      }
      v5 = __stderrp;
      v6 = "zprint returned non-zero exit code\n";
      v7 = 35;
    }
    fwrite(v6, v7, 1uLL, v5);
    goto LABEL_16;
  }
  fwrite("host_statistics64 call failed\n", 0x1EuLL, 1uLL, __stderrp);
  fclose(v3);
LABEL_18:
  if (!stat("/var/db/sysstatuscheck_should_not_panic", &host_info64_out) || reboot_np(7168, a1))
  {
    host_info64_out.st_dev = 2;
    if (sysctlbyname("kern.darkboot", 0, 0, &host_info64_out, 4uLL))
    {
      v8 = __stderrp;
      v9 = "could not set dark-boot flag\n";
      v10 = 29;
LABEL_22:
      fwrite(v9, v10, 1uLL, v8);
      return 1;
    }
    if (reboot(0))
    {
      host_info64_out.st_dev = 0;
      fwrite("reboot failed\n", 0xEuLL, 1uLL, __stderrp);
      if (sysctlbyname("kern.darkboot", 0, 0, &host_info64_out, 4uLL))
      {
        v8 = __stderrp;
        v9 = "could not reset darkboot\n";
        v10 = 25;
        goto LABEL_22;
      }
    }
  }
  return 1;
}

uint64_t start()
{
  uint64_t v0;
  FILE *v1;
  const char *v2;
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v8;
  int v9;
  size_t v10[32];

  v8 = 0;
  if (!sub_100002D50())
    return 1;
  sub_1000026E4();
  v9 = 0;
  v10[0] = 4;
  if (sysctlbyname("kern.kasan.available", &v9, v10, 0, 0) || !v9)
  {
    if (sub_100002D98())
    {
      v1 = __stderrp;
      v2 = "could not do KHWM check because the device has debug boot-args\n";
      v0 = 1;
      v3 = 63;
LABEL_18:
      fwrite(v2, v3, 1uLL, v1);
      return v0;
    }
    if ((sub_10000326C() & 1) == 0)
    {
      v1 = __stderrp;
      v2 = "could not read jetsam properties file\n";
      v0 = 1;
      v3 = 38;
      goto LABEL_18;
    }
    v0 = sub_100003A88(&v8);
    if ((_DWORD)v0)
      return v0;
    v4 = qword_100014070;
    v5 = v8;
    if (qword_100014070 >= 1 && qword_100014070 > v8)
    {
      sub_100002EC8(60);
      if (sub_100003A88(&v8))
        return 1;
      snprintf((char *)v10, 0xFFuLL, "Kernel memory has exceeded limits. Memory available now: %u%%. Available memory minimum: %llu%%", v8, qword_100014070);
      if (qword_100014070 >= 1 && qword_100014070 > (unint64_t)v8)
      {
        sub_100003884(1u, v8, qword_100014070);
        sub_100002880((const char *)v10);
        return 1;
      }
      fwrite("Kernel memory exceeded limit on first pass, but not second pass, not rebooting\n", 0x4FuLL, 1uLL, __stderrp);
      v5 = v8;
      v4 = qword_100014070;
    }
    sub_100003884(0, v5, v4);
    return 1;
  }
  v0 = 1;
  fwrite("could not do KHWM check because running kasan kernel\n", 0x35uLL, 1uLL, __stderrp);
  return v0;
}

BOOL sub_100002D50()
{
  std::error_code *v0;
  stat v2;

  return !stat("/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", &v2)
      && !remove((const std::__fs::filesystem::path *)"/private/var/mobile/Library/MemoryMaintenance/sysstatuscheck_should_check", v0);
}

uint64_t sub_100002D98()
{
  int v0;
  _QWORD *v1;
  int64_t v2;
  char *v3;
  char *v4;
  int v5;
  char *v6;
  int64_t v7;
  int v8;
  int64_t v9;
  void *v10;
  int64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void *__p;
  _QWORD v17[2];
  unsigned __int8 v18;

  sub_100002F10(v17);
  v0 = (char)v18;
  __p = (void *)v17[0];
  if ((v18 & 0x80u) == 0)
    v1 = v17;
  else
    v1 = (_QWORD *)v17[0];
  if ((v18 & 0x80u) == 0)
    v2 = v18;
  else
    v2 = v17[1];
  v3 = (char *)v1 + v2;
  v4 = aTrace;
  do
  {
    v5 = v4[23];
    if (v5 >= 0)
      v6 = v4;
    else
      v6 = *(char **)v4;
    if (v5 >= 0)
      v7 = v4[23];
    else
      v7 = *((_QWORD *)v4 + 1);
    if (!v7)
    {
LABEL_26:
      v14 = 1;
      if ((v0 & 0x80000000) == 0)
        return v14;
      goto LABEL_27;
    }
    if (v2 >= v7)
    {
      v8 = *v6;
      v9 = v2;
      v10 = v1;
      do
      {
        v11 = v9 - v7;
        if (v11 == -1)
          break;
        v12 = (char *)memchr(v10, v8, v11 + 1);
        if (!v12)
          break;
        v13 = v12;
        if (!memcmp(v12, v6, v7))
        {
          if (v13 == v3 || v13 - (char *)v1 == -1)
            break;
          goto LABEL_26;
        }
        v10 = v13 + 1;
        v9 = v3 - (v13 + 1);
      }
      while (v9 >= v7);
    }
    v4 += 24;
  }
  while (v4 != (char *)&dword_100014060);
  v14 = 0;
  if (v0 < 0)
LABEL_27:
    operator delete(__p);
  return v14;
}

uint64_t sub_100002EC8(uint64_t result)
{
  int v1;
  unsigned int v2;

  if ((_DWORD)result)
  {
    v1 = result;
    do
    {
      sub_100002FC8();
      if (v1 >= 30)
        v2 = 30;
      else
        v2 = v1;
      result = sleep(v2);
      v1 -= v2;
    }
    while (v1);
  }
  return result;
}

_QWORD *sub_100002F10@<X0>(_QWORD *a1@<X8>)
{
  char *v2;
  size_t v4;
  _BYTE v5[512];

  v4 = 512;
  v2 = v5;
  if (sysctlbyname("kern.bootargs", v5, &v4, 0, 0))
  {
    fwrite("could not retrieve boot-args\n", 0x1DuLL, 1uLL, __stderrp);
    v2 = (char *)&unk_10000F036;
  }
  return sub_1000030D8(a1, v2);
}

size_t sub_100002FC8()
{
  mach_port_t v0;
  size_t result;
  FILE *v2;
  const char *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  kern_return_t v7;
  size_t v9;

  v0 = dword_100014060;
  if (!dword_100014060)
  {
    v4 = IOServiceMatching("IOWatchdog");
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if (!MatchingService)
    {
      v2 = __stderrp;
      v3 = "Failed to discover watchdog service\n";
      v9 = 36;
      return fwrite(v3, v9, 1uLL, v2);
    }
    v6 = MatchingService;
    v7 = IOServiceOpen(MatchingService, mach_task_self_, 1u, (io_connect_t *)&dword_100014060);
    IOObjectRelease(v6);
    v0 = dword_100014060;
    if (v7 || dword_100014060 == 0)
    {
      v2 = __stderrp;
      v3 = "IOServiceOpen kIOWatchdogUserClientOpen failed\n";
      goto LABEL_11;
    }
  }
  result = IOConnectCallScalarMethod(v0, 1u, 0, 0, 0, 0);
  if ((_DWORD)result)
  {
    v2 = __stderrp;
    v3 = "Failed to call kIOWatchdogDaemonCheckin method\n";
LABEL_11:
    v9 = 47;
    return fwrite(v3, v9, 1uLL, v2);
  }
  return result;
}

_QWORD *sub_1000030D8(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_100003188();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_100003188()
{
  sub_10000319C("basic_string");
}

void sub_10000319C(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000031EC(exception, a1);
}

void sub_1000031D8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000031EC(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100003210()
{
  uint64_t i;

  for (i = 0; i != -96; i -= 24)
  {
    if (aTrace[i + 95] < 0)
      operator delete(*(void **)&aTrace[i + 72]);
  }
}

uint64_t sub_100003254()
{
  return __cxa_atexit((void (*)(void *))sub_100003210, 0, (void *)&_mh_execute_header);
}

uint64_t sub_10000326C()
{
  void **v0;
  const char *v1;
  void **v2;
  uint64_t v3;
  void *v4;
  xpc_object_t value;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  xpc_object_t v11;
  void *v13;
  xpc_object_t v14;
  xpc_object_t xdict;
  void *v16[2];
  uint64_t v17;
  xpc_object_t object[2];
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  size_t v22;
  _QWORD v23[4];

  if (access("/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist", 0))
  {
    LOBYTE(v23[0]) = 0;
    v22 = 32;
    if (sysctlbyname("hw.targettype", v23, &v22, 0, 0))
    {
      sub_1000030D8(v16, (char *)&unk_10000F036);
    }
    else
    {
      util::stringprintf((util *)"%s.%s.plist", __p, "/AppleInternal/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (v21 >= 0)
        v0 = __p;
      else
        v0 = (void **)__p[0];
      if (!access((const char *)v0, 0))
        goto LABEL_17;
      util::stringprintf((util *)"%s.%s.plist", object, "/System/Library/LaunchDaemons/com.apple.jetsamproperties", v23);
      if (SHIBYTE(v21) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)object;
      v21 = v19;
      v1 = v19 >= 0 ? (const char *)__p : (const char *)object[0];
      if (access(v1, 0))
      {
        sub_1000030D8(v16, (char *)&unk_10000F036);
        if (SHIBYTE(v21) < 0)
          operator delete(__p[0]);
      }
      else
      {
LABEL_17:
        *(_OWORD *)v16 = *(_OWORD *)__p;
        v17 = v21;
      }
    }
  }
  else
  {
    sub_1000030D8(v16, "/System/Library/LaunchDaemons/com.apple.jetsamproperties.NonUI.plist");
  }
  if (v17 >= 0)
    v2 = v16;
  else
    v2 = (void **)v16[0];
  util::MappedFile::MappedFile((util::MappedFile *)v23, (const char *)v2);
  if (!v23[1] || v23[0])
  {
    v4 = (void *)xpc_create_from_plist(v23[0]);
    __p[0] = v4;
    if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      value = xpc_dictionary_get_value(__p[0], "Version4");
      v22 = (size_t)value;
      if (value)
      {
        xpc_retain(value);
        v6 = (void *)v22;
      }
      else
      {
        v6 = 0;
      }
      object[0] = v6;
      v22 = 0;
      sub_1000036E4((void **)&v22);
      if (object[0] && xpc_get_type(object[0]) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v7 = xpc_dictionary_get_value(object[0], "System");
        xdict = v7;
        if (v7)
        {
          xpc_retain(v7);
          v8 = xdict;
        }
        else
        {
          v8 = 0;
        }
        v22 = (size_t)v8;
        xdict = 0;
        sub_1000036E4(&xdict);
        if (v22 && xpc_get_type((xpc_object_t)v22) == (xpc_type_t)&_xpc_type_dictionary)
        {
          v9 = xpc_dictionary_get_value((xpc_object_t)v22, "Override");
          v14 = v9;
          if (v9)
          {
            xpc_retain(v9);
            v10 = v14;
          }
          else
          {
            v10 = 0;
          }
          v14 = 0;
          xdict = v10;
          sub_1000036E4(&v14);
          if (xdict && xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
          {
            v11 = xpc_dictionary_get_value(xdict, "Global");
            v3 = (uint64_t)v11;
            v13 = v11;
            if (v11)
            {
              xpc_retain(v11);
              v13 = 0;
              v14 = (xpc_object_t)v3;
              sub_1000036E4(&v13);
              if (xpc_get_type((xpc_object_t)v3) == (xpc_type_t)&_xpc_type_dictionary)
              {
                qword_100014068 = xpc_dictionary_get_int64(v14, "UserReclaimableLimit");
                qword_100014070 = xpc_dictionary_get_int64(v14, "KernelHighWaterMark");
                qword_100014078 = xpc_dictionary_get_int64(v14, "DarkBootSystemUIHardLimit");
                v3 = 1;
              }
              else
              {
                v3 = 0;
              }
            }
            else
            {
              v13 = 0;
              v14 = 0;
              sub_1000036E4(&v13);
            }
            sub_1000036E4(&v14);
          }
          else
          {
            v3 = 0;
          }
          sub_1000036E4(&xdict);
        }
        else
        {
          v3 = 0;
        }
        sub_1000036E4((void **)&v22);
      }
      else
      {
        v3 = 0;
      }
      sub_1000036E4(object);
    }
    else
    {
      v3 = 0;
    }
    sub_1000036E4(__p);
  }
  else
  {
    v3 = 0;
  }
  util::MappedFile::~MappedFile((util::MappedFile *)v23);
  if (SHIBYTE(v17) < 0)
    operator delete(v16[0]);
  return v3;
}

void sub_100003628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  sub_1000036E4(&a13);
  sub_1000036E4(&a14);
  sub_1000036E4((void **)(v29 - 64));
  sub_1000036E4(&a21);
  sub_1000036E4((void **)&a24);
  util::MappedFile::~MappedFile((util::MappedFile *)(v29 - 56));
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1000036D4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void **sub_1000036E4(void **a1)
{
  void *v2;

  v2 = *a1;
  if (v2)
    xpc_release(v2);
  return a1;
}

FILE *sub_100003714@<X0>(_OWORD *a1@<X8>)
{
  FILE *result;
  FILE *v3;
  int v4;
  int v5;
  char v6[256];

  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "r");
  if (result)
  {
    v3 = result;
    fgets(v6, 256, result);
    v4 = sscanf(v6, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", a1, (char *)a1 + 8, a1 + 1, (char *)a1 + 24, a1 + 2, (char *)a1 + 40);
    v5 = ferror(v3);
    if (v4 != 6 || v5)
    {
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    return (FILE *)fclose(v3);
  }
  return result;
}

FILE *sub_100003800(_QWORD *a1)
{
  FILE *result;
  FILE *v3;
  int v4;

  result = fopen("/private/var/mobile/Library/MemoryMaintenance/system_hwm", "w");
  if (result)
  {
    v3 = result;
    fprintf(result, "perform_u_reboot=%llu uhwm_level=%llu uhwm_limit=%llu perform_k_reboot=%llu khwm_level=%llu khwm_limit=%llu\n", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
    v4 = ferror(v3);
    fclose(v3);
    if (v4)
    {
      return 0;
    }
    else
    {
      sync();
      return (FILE *)1;
    }
  }
  return result;
}

FILE *sub_100003884(unsigned int a1, uint64_t a2, uint64_t a3)
{
  _OWORD v7[3];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  sub_100003714(&v8);
  *((_QWORD *)&v9 + 1) = a1;
  *(_QWORD *)&v10 = a2;
  *((_QWORD *)&v10 + 1) = a3;
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  return sub_100003800(v7);
}

_QWORD *sub_1000038F0(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_100003188();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

uint64_t sub_100003994(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  const char *i;
  size_t v6;
  int v7;
  int v8;
  int v9;
  void *__p[2];
  _BYTE v12[25];
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  char v19;
  uint64_t v20;

  if (!a2)
    return 0;
  v4 = a2;
  for (i = (const char *)(a1 + 96); ; i += 176)
  {
    v6 = strlen(i);
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    *(_OWORD *)__p = 0u;
    memset(v12, 0, sizeof(v12));
    v7 = sub_100003F20(a3, (uint64_t)i, (uint64_t)&i[v6], (uint64_t)__p, 4160);
    v8 = v18;
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v9 = v8 ? 0 : v7;
    if (v9 == 1)
      break;
    if (!--v4)
      return 0;
  }
  return *((_QWORD *)i - 10);
}

void sub_100003A6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100003A88(void *a1)
{
  uint64_t v1;
  mach_port_t v2;
  std::locale v4;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt;
  mach_zone_info_array_t info;
  mach_msg_type_number_t namesCnt;
  mach_zone_name_array_t names;
  size_t v11;

  v11 = 4;
  if (sysctlbyname("kern.memorystatus_level", a1, &v11, 0, 0))
  {
    v1 = 1;
    fwrite("pressure: could not retrieve memory level\n", 0x2AuLL, 1uLL, __stderrp);
  }
  else
  {
    names = 0;
    namesCnt = 0;
    info = 0;
    infoCnt = 0;
    memory_info = 0;
    memory_infoCnt = 0;
    v2 = mach_host_self();
    if (!mach_memory_info(v2, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt))
      sub_100006CF8(&v4, "com.apple.driver.AppleH[0-9]+CameraInterface.NonPersistent", 0);
    fwrite("pressure: could not retrieve zone memory info\n", 0x2EuLL, 1uLL, __stderrp);
    return 0;
  }
  return v1;
}

void sub_100003E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::locale a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  sub_100003EC8((uint64_t)&a22);
  std::locale::~locale(&a17);
  _Unwind_Resume(a1);
}

uint64_t sub_100003EC8(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t sub_100003F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  sub_1000040F8(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_100004168(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
      v10 = (uint64_t *)(a4 + 24);
    else
      v10 = *(uint64_t **)a4;
LABEL_8:
    v11 = *v10;
    *(_QWORD *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(_QWORD *)(a4 + 48) != v11;
    v12 = v10[1];
    *(_QWORD *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 88) = v12 != *(_QWORD *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_100004188((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
        v16 = sub_100004168(a1, v15, a3, (uint64_t *)a4, v14, 0);
        v18 = *(_QWORD *)a4;
        v17 = *(_QWORD *)(a4 + 8);
        if (v16)
          break;
        sub_100004188((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3)
          goto LABEL_14;
      }
      if (v17 == v18)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
LABEL_14:
    sub_100004188((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
    if (sub_100004168(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
  }
  result = 0;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)a4;
  return result;
}

char *sub_1000040F8(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  _OWORD *v8;
  char *result;

  *(_QWORD *)(a1 + 24) = a4;
  v8 = (_OWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  result = sub_100004188((char **)a1, a2, (__int128 *)(a1 + 24));
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_100004168(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return sub_1000042FC(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return sub_100004C04(a1, a2, a3, a4, a5, a6);
  return sub_1000046E4(a1, a2, a3, a4, a5, a6);
}

char *sub_100004188(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  char *result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    v15 = a1[1];
    v16 = (v15 - result) / 24;
    if (v16 >= a2)
      v17 = a2;
    else
      v17 = (v15 - result) / 24;
    if (v17)
    {
      v18 = result;
      do
      {
        *(_OWORD *)v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      v19 = &v15[24 * (a2 - v16)];
      v20 = 24 * a2 - 24 * v16;
      do
      {
        v21 = *a3;
        *((_QWORD *)v15 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL)
      sub_100005450();
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= a2)
      v9 = a2;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    result = sub_100005960(a1, v10);
    v11 = a1[1];
    v12 = &v11[24 * a2];
    v13 = 24 * a2;
    do
    {
      v14 = *a3;
      *((_QWORD *)v11 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

uint64_t sub_1000042FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v12;
  signed int v13;
  _OWORD *v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  __int128 v42;
  char v43;
  _OWORD *v44;
  _OWORD *v45;
  unint64_t v46;

  v44 = 0;
  v45 = 0;
  v46 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v42 = a3;
    *((_QWORD *)&v42 + 1) = a3;
    v43 = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v45 = (_OWORD *)sub_100005290((uint64_t *)&v44, (uint64_t)v39);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v39[32])
    {
      *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
      operator delete(*(void **)&v39[32]);
    }
    v36 = a4;
    v12 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((_QWORD *)v12 - 11) = a2;
    *((_QWORD *)v12 - 10) = a2;
    *((_QWORD *)v12 - 9) = a3;
    sub_10000518C((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v42);
    sub_1000051C8((uint64_t)v45 - 40, *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = a3 - a2;
    v14 = v45;
    *((_QWORD *)v45 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        sub_1000051F8();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *((_QWORD *)v14 - 8);
          v29 = *((_QWORD *)v14 - 7) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v45 - 6;
          sub_10000555C((_QWORD *)v45 - 12);
          v45 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          sub_1000058E4(&v39[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          sub_1000059B0((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v45;
          if ((unint64_t)v45 >= v46)
          {
            v45 = (_OWORD *)sub_100005290((uint64_t *)&v44, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *v45 = *(_OWORD *)v39;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v39[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v45 = v23 + 6;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v45;
          ++v15;
          if (v44 != v45)
            continue;
          v6 = 0;
          break;
        default:
          sub_100005244();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v44;
  sub_100005A60((void ***)v39);
  return v6;
}

void sub_10000468C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  sub_10000514C(&a13);
  a13 = v18 - 112;
  sub_100005A60((void ***)&a13);
  _Unwind_Resume(a1);
}

uint64_t sub_1000046E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  _BYTE v57[40];
  __int128 v58;
  void *__p[2];
  _QWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v57 = 0;
    memset(&v57[8], 0, 32);
    v58 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v60, 0, 21);
    sub_100005AD0(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v51 = a4;
    if (*(_QWORD *)&v57[32])
    {
      *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    v12 = *((_QWORD *)&v61 + 1);
    v13 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_1000051C8(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    v55 = 0;
    v18 = 0;
    v53 = 0;
    v54 = a2;
    v19 = *((_QWORD *)&v63 + 1);
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v22 = v21 / 0x2A;
    v23 = 3 * (v21 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    v24 = *(_QWORD *)(v20 + 8 * v22) + 32 * v23;
    v25 = a3 - a2;
    *(_DWORD *)(v24 + 88) = a5;
    *(_BYTE *)(v24 + 92) = a6;
    v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v25)
        sub_1000051F8();
      v27 = v19 + v63 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == v52;
          v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v53;
          if ((v55 & (v53 >= v37)) == 0)
            v38 = v37;
          if (v38 != v25)
          {
            v53 = v38;
            sub_100005BD0(&v61);
            v55 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v61 + 1);
          v40 = v62;
          if ((_QWORD)v62 == *((_QWORD *)&v61 + 1))
          {
            v40 = *((_QWORD *)&v61 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                sub_10000555C(v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v61 + 1);
              v40 = v62;
            }
          }
          *((_QWORD *)&v63 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v61 + 1) + 8);
              *((_QWORD *)&v61 + 1) = v39;
              v47 = v62 - (_QWORD)v39;
            }
            while ((_QWORD)v62 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v63 = v48;
LABEL_53:
          v55 = 1;
          v53 = v25;
LABEL_38:
          v19 = *((_QWORD *)&v63 + 1);
          if (*((_QWORD *)&v63 + 1))
            continue;
          if ((v55 & 1) != 0)
          {
            v49 = *v51;
            *(_QWORD *)v49 = v54;
            *(_QWORD *)(v49 + 8) = v54 + v53;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_100005C44((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_100005BD0(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          v58 = 0uLL;
          *(_QWORD *)&v57[32] = 0;
          sub_1000058E4(&v57[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_1000059B0((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v60[1] + 5) = *(_QWORD *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v60[1] + 24))(v60[1], 0, v57);
          sub_100005AD0(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v57[32])
          {
            *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_100005244();
      }
      break;
    }
  }
  sub_100006864(&v61);
  return v6;
}

void sub_100004BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_100006864(&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  char v42;
  _BYTE v45[56];
  void *__p[2];
  _QWORD v47[4];
  __int128 v48;
  char v49;
  _BYTE v50[40];
  __int128 v51;
  void *v52[6];
  _OWORD *v53;
  _OWORD *v54;
  unint64_t v55;

  v53 = 0;
  v54 = 0;
  v55 = 0;
  *(_DWORD *)v50 = 0;
  memset(&v50[8], 0, 32);
  v51 = 0u;
  memset(v52, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v48 = a3;
    *((_QWORD *)&v48 + 1) = a3;
    v49 = 0;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 48);
    *(_OWORD *)__p = 0uLL;
    memset(v47, 0, 21);
    v54 = (_OWORD *)sub_100005290((uint64_t *)&v53, (uint64_t)v45);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v45[32])
    {
      *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }
    v11 = v54;
    *((_DWORD *)v54 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    sub_10000518C((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v48);
    sub_1000051C8((uint64_t)v54 - 40, *(unsigned int *)(a1 + 32));
    v40 = a3;
    v41 = 0;
    v42 = 0;
    v12 = 0;
    v13 = a3 - a2;
    v14 = v54;
    *((_QWORD *)v54 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    do
    {
      v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
      if (!v15)
        sub_1000051F8();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v40)
            goto LABEL_19;
          v26 = v19 - *((_QWORD *)v14 - 11);
          v27 = v41;
          if ((v42 & (v41 >= v26)) == 0)
          {
            v28 = *(v14 - 5);
            *(_OWORD *)v50 = *(_OWORD *)v18;
            *(_OWORD *)&v50[16] = v28;
            if (v50 != v18)
            {
              sub_1000069F8(&v50[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
              sub_100006BAC(v52, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
            }
            v29 = (void *)*v17;
            *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
            v52[3] = v29;
            v27 = v26;
          }
          v30 = v54;
          if (v27 == v13)
          {
            v31 = (uint64_t)v53;
            while (v30 != (_QWORD *)v31)
            {
              v30 -= 12;
              sub_10000555C(v30);
            }
            v54 = (_OWORD *)v31;
            v42 = 1;
            v41 = v13;
          }
          else
          {
            v41 = v27;
            v32 = v54 - 6;
            sub_10000555C((_QWORD *)v54 - 12);
            v54 = v32;
            v42 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          v20 = v54 - 6;
          sub_10000555C((_QWORD *)v54 - 12);
          v54 = v20;
          break;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v45 = *(_OWORD *)v18;
          *(_OWORD *)&v45[16] = v21;
          memset(&v45[32], 0, 24);
          sub_1000058E4(&v45[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v47[0] = 0;
          sub_1000059B0((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = (void *)*v17;
          *(_QWORD *)((char *)&v47[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v47[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v47[1] + 24))(v47[1], 0, v45);
          v23 = v54;
          if ((unint64_t)v54 >= v55)
          {
            v54 = (_OWORD *)sub_100005290((uint64_t *)&v53, (uint64_t)v45);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v45[16];
            *v54 = *(_OWORD *)v45;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v45[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v47[0];
            __p[0] = 0;
            __p[1] = 0;
            v47[0] = 0;
            v25 = v47[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v47[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v54 = v23 + 6;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
          break;
        default:
          sub_100005244();
      }
      v14 = v54;
    }
    while (v53 != v54);
    if ((v42 & 1) != 0)
    {
      v33 = *a4;
      *(_QWORD *)v33 = a2;
      *(_QWORD *)(v33 + 8) = a2 + v41;
      *(_BYTE *)(v33 + 16) = 1;
      if ((_QWORD)v51 != *(_QWORD *)&v50[32])
      {
        v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(_QWORD *)&v50[32]) >> 3);
        v35 = (_BYTE *)(*(_QWORD *)&v50[32] + 16);
        v36 = 1;
        do
        {
          v37 = v33 + 24 * v36;
          *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
          v38 = *v35;
          v35 += 24;
          *(_BYTE *)(v37 + 16) = v38;
          v15 = v34 > v36++;
        }
        while (v15);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (*(_QWORD *)&v50[32])
  {
    *(_QWORD *)&v51 = *(_QWORD *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }
  *(_QWORD *)v50 = &v53;
  sub_100005A60((void ***)v50);
  return v6;
}

void sub_1000050EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  sub_10000514C(&a19);
  sub_10000514C(&a35);
  a35 = v35 - 120;
  sub_100005A60((void ***)&a35);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000514C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_10000518C(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_1000055EC((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_1000051C8(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_1000057A4((void **)a1, a2 - v2);
  }
}

void sub_1000051F8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_100005230(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100005244()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_10000527C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100005290(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    sub_100005450();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)sub_100005464(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_1000053DC(a1, v16);
  v14 = a1[1];
  sub_1000055A0((uint64_t)v16);
  return v14;
}

void sub_1000053C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1000055A0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000053DC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000054D0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void sub_100005450()
{
  sub_10000319C("vector");
}

void *sub_100005464(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    sub_1000054A8();
  return operator new(96 * a2);
}

void sub_1000054A8()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

__n128 sub_1000054D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __n128 result;
  uint64_t v12;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(_QWORD *)(v8 - 56) = 0;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(_QWORD *)(v8 - 48) = *(_QWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v9 - 64) = 0;
      *(_QWORD *)(v9 - 56) = 0;
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(_QWORD *)(v8 - 24) = *(_QWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v9 - 24) = 0;
      v12 = *(_QWORD *)(a3 + v7 - 16);
      *(_QWORD *)(v8 - 11) = *(_QWORD *)(a3 + v7 - 11);
      *(_QWORD *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void sub_10000555C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t sub_1000055A0(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    sub_10000555C((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_1000055EC(void **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      v15 = &v9[3 * a2];
      v16 = 24 * a2;
      do
      {
        v17 = *a3;
        v9[2] = *((_QWORD *)a3 + 2);
        *(_OWORD *)v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_100005450();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)sub_100005760(v6, v13);
    else
      v14 = 0;
    v18 = &v14[24 * v10];
    v19 = &v18[24 * a2];
    v20 = 24 * a2;
    v21 = v18;
    do
    {
      v22 = *a3;
      *((_QWORD *)v21 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    v23 = &v14[24 * v13];
    v25 = (char *)*a1;
    v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        v26 = *(_OWORD *)(v24 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
      operator delete(v24);
  }
}

void *sub_100005760(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_1000054A8();
  return operator new(24 * a2);
}

void sub_1000057A4(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_100005450();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_1000058B0(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

void *sub_1000058B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_1000054A8();
  return operator new(16 * a2);
}

char *sub_1000058E4(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_100005960(result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_100005944(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100005960(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100005450();
  result = (char *)sub_100005760((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

char *sub_1000059B0(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_100005A20(result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_100005A04(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100005A20(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_100005450();
  result = (char *)sub_1000058B0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_100005A60(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 12;
        sub_10000555C(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

__n128 sub_100005AD0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_100005D34(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_100005BD0(_QWORD *a1)
{
  unint64_t v2;

  v2 = a1[5] + a1[4] - 1;
  sub_10000555C((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];
  return sub_1000064D8(a1, 1);
}

int64x2_t sub_100005C44(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    sub_10000654C((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_10000FAE0);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_100005D34(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_1000064A4(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      sub_100006048(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    sub_10000615C((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_1000064A4((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = sub_1000064A4((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  sub_100006278(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10000638C((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_100005FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_100006048(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)sub_1000064A4(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void sub_10000615C(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)sub_1000064A4(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void sub_100006278(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)sub_1000064A4(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void sub_10000638C(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)sub_1000064A4(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *sub_1000064A4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_1000054A8();
  return operator new(8 * a2);
}

uint64_t sub_1000064D8(_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_10000654C(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = sub_1000064A4(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      sub_100006278(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)sub_1000064A4((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        sub_100006048(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      sub_10000615C((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    sub_10000615C((uint64_t)a1, &__p);
  }
}

void sub_100006818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_100006864(_QWORD *a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v3 == v2)
  {
    v4 = a1 + 5;
    v3 = (void **)a1[1];
  }
  else
  {
    v4 = a1 + 5;
    v5 = a1[4];
    v6 = &v2[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_10000555C(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v2 = (void **)a1[1];
      v3 = (void **)a1[2];
    }
  }
  *v4 = 0;
  v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }
  return sub_1000069AC((uint64_t)a1);
}

uint64_t sub_1000069AC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *sub_1000069F8(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_100005450();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = sub_100005960(a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *sub_100006BAC(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      sub_100005450();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_100005A20(a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

void sub_100006CF8(std::locale *a1, const char *a2, int a3)
{
  std::locale *v5;

  v5 = sub_100006D88(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_100006DE4();
}

void sub_100006D6C(_Unwind_Exception *a1)
{
  std::locale *v1;

  sub_100003EC8((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_100006D88(std::locale *a1)
{
  std::locale *v2;

  v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_100006DD0(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_100006DE4()
{
  operator new();
}

void sub_100006F38(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_100006F54()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100006F8C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100006FA0(uint64_t a1, uint64_t a2)
{
  __int128 v2;

  sub_10000766C(&v2, a2);
}

char *sub_100007010(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = a2;
  do
  {
    v7 = v6;
    v6 = sub_1000079D4(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2)
    operator new();
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      v8 = v7 + 1;
      v9 = v7 + 1;
      do
      {
        v10 = v9;
        v9 = sub_1000079D4(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8)
        operator new();
      sub_1000078F4();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_100007158(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v6;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
    operator new();
  if (a2 != a3)
  {
    do
    {
      v6 = v3;
      v3 = sub_10000D924(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36)
        operator new();
      sub_10000D8D8();
    }
  }
  return v4;
}

unsigned __int8 *sub_1000072A4(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v6;

  v3 = a3;
  v6 = sub_10000DF1C(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
LABEL_8:
    sub_10000D8D8();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_10000DF1C(a1, (char *)v6 + 1, v3) != v6 + 1)
        sub_1000078F4();
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_100007344(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_100007158(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_100007158(a1, v8, v10);
      sub_1000078F4();
    }
    operator new();
  }
  return a3;
}

char *sub_10000749C(uint64_t a1, char *__s, char *a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_1000072A4(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (char *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_1000072A4(a1, v8, v10);
      sub_1000078F4();
    }
    operator new();
  }
  return a3;
}

void sub_1000075F4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_10000762C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100007644()
{
  operator delete();
}

void sub_100007658(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_10000766C(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1000076C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void sub_1000076E8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10000770C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_100007724(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_100007764(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

_QWORD *sub_1000077B0(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000077F4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100007848(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000785C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000078A0(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_1000078F4()
{
  operator new();
}

unsigned __int8 *sub_1000079D4(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  unsigned __int8 *v7;

  result = (unsigned __int8 *)sub_100007A68(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    v7 = sub_100007D10(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
      return sub_100007F18(a1, v7, (unsigned __int8 *)a3);
  }
  return result;
}

char *sub_100007A68(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  int v13;
  std::locale v14[3];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (a2 != a3)
  {
    v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          v13 = a2[1];
          if (v13 == 66 || v13 == 98)
            sub_100008218();
        }
      }
      else if (v6 == 94)
      {
        operator new();
      }
    }
    else
    {
      if (v6 == 36)
        operator new();
      v8 = v6 == 40;
      v7 = a2 + 1;
      v8 = !v8 || v7 == a3;
      if (!v8)
      {
        v8 = *v7 == 63;
        v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          v11 = *v9;
          if (v11 == 33)
          {
            sub_100006D88(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_100006DE4(v14, a2 + 3, a3);
            sub_10000829C();
          }
          if (v11 == 61)
          {
            sub_100006D88(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_100006DE4(v14, a2 + 3, a3);
            sub_10000829C();
          }
        }
      }
    }
  }
  return a2;
}

void sub_100007CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_100003EC8((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100007D10(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  _DWORD *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92)
        return sub_100008A34(a1, a2, a3);
      if (v6 != 123)
        return sub_100008D10(a1, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return sub_100008AD4(a1, a2, a3);
      if (v6 != 63)
        return sub_100008D10(a1, a2, a3);
    }
LABEL_28:
    sub_100008CC4();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_29;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)sub_100007010(a1, a2 + 3, a3);
      if (v9 == a3)
        goto LABEL_29;
      v10 = v9;
      if (*v9 != 41)
        goto LABEL_29;
    }
    else
    {
      sub_100008BE4(a1);
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v11 = (unsigned __int8 *)sub_100007010(a1, v3 + 1, a3);
      if (v11 == a3 || (v10 = v11, *v11 != 41))
LABEL_29:
        sub_100008340();
      sub_100008C58(a1);
    }
    --*v8;
    return v10 + 1;
  }
  if (v6 == 46)
    operator new();
  if ((v6 - 42) < 2)
    goto LABEL_28;
  return sub_100008D10(a1, a2, a3);
}

unsigned __int8 *sub_100007F18(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v11;
  int v12;
  int v13;

  if (a2 == a3)
    return a2;
  v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43)
LABEL_18:
      sub_10000D1FC();
    return a2;
  }
  if (v5 == 63)
    goto LABEL_18;
  if (v5 == 123)
  {
    v6 = a2 + 1;
    v7 = sub_10000D344(a1, a2 + 1, a3, &v13);
    if (v7 == v6)
      goto LABEL_23;
    if (v7 != a3)
    {
      v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125)
          goto LABEL_18;
LABEL_23:
        sub_10000D3E0();
      }
      v9 = v7 + 1;
      if (v7 + 1 == a3)
        goto LABEL_23;
      if (*v9 == 125)
        goto LABEL_18;
      v12 = -1;
      v11 = sub_10000D344(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13)
          goto LABEL_18;
        goto LABEL_23;
      }
    }
    sub_10000D42C();
  }
  return a2;
}

void sub_100008218()
{
  operator new();
}

void sub_10000829C()
{
  operator new();
}

void sub_10000831C()
{
  operator delete();
}

void sub_100008340()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_100008378(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000838C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000083D0(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100008424(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

_QWORD *sub_100008484(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000084C8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000851C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10000856C(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010528;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1000085C4(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010528;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000862C(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_100008740(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = off_100010570;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_1000087CC(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010570;
  v2 = a1 + 2;
  sub_100003EC8((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_100008834(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010570;
  v2 = a1 + 2;
  sub_100003EC8((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

void sub_1000088AC(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *__p;
  char *v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  uint64_t v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0uLL;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p = 0;
  v19 = 0;
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v20 = 0;
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v5;
  v22 = 0;
  sub_100004188((char **)&__p, v4, &v21);
  v23 = v6;
  v24 = v6;
  v25 = 0;
  v26 = v21;
  v27 = v22;
  v29 = v6;
  v28 = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_1000042FC(a1 + 16, v7, *(_QWORD *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  v10 = (char *)__p;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &v10[24 * v15];
    v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  v19 = v10;
  operator delete(v10);
}

void sub_100008A14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *sub_100008A34(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    sub_100008E18();
  result = sub_100008E64(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)sub_100008F20(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = sub_100008FEC(a1, a2 + 1, a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

_BYTE *sub_100008AD4(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3)
      sub_100009E38();
    sub_10000B0D4();
  }
  return a2;
}

uint64_t sub_100008BE4(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

uint64_t sub_100008C58(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

void sub_100008CC4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_100008CFC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *sub_100008D10(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v3;
  BOOL v4;

  if (a2 != a3)
  {
    v3 = (char)*a2;
    v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3)
      sub_1000093C0(a1);
  }
  return a2;
}

_QWORD *sub_100008D80(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100008DC4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_100008E18()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_100008E50(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100008E64(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;

  if (a2 != a3)
  {
    v4 = *a2;
    v5 = v4 - 48;
    if (v4 == 48)
      sub_1000093C0(a1);
    if ((v4 - 49) <= 8)
    {
      v6 = a2 + 1;
      if (a2 + 1 == a3)
        goto LABEL_12;
      do
      {
        v7 = *v6;
        if ((v7 - 48) > 9)
          break;
        if (v5 >= 0x19999999)
          goto LABEL_14;
        ++v6;
        v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28))
          sub_100009530(a1);
      }
LABEL_14:
      sub_1000094E4();
    }
  }
  return a2;
}

char *sub_100008F20(uint64_t a1, char *a2, char *a3)
{
  int v3;

  if (a2 == a3)
    return a2;
  v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119)
      goto LABEL_12;
    if (v3 == 115)
LABEL_13:
      sub_100009E38();
    if (v3 != 100)
      return a2;
LABEL_10:
    sub_100009E38();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_100009E38();
  }
  return a2;
}

unsigned __int8 *sub_100008FEC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  char v14;
  unsigned __int8 v15;
  __int16 v16;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if ((char)v5 > 109)
  {
    v6 = 0;
    switch((char)v5)
    {
      case 'n':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 10;
        goto LABEL_74;
      case 'r':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 13;
        goto LABEL_74;
      case 't':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 9;
        goto LABEL_74;
      case 'u':
        if (a2 + 1 == a3)
          goto LABEL_83;
        v7 = a2[1];
        if ((v7 & 0xF8) != 0x30 && (v7 & 0xFE) != 0x38 && (v7 | 0x20u) - 97 >= 6)
          goto LABEL_83;
        v4 = a2 + 2;
        if (a2 + 2 == a3)
          goto LABEL_83;
        v8 = *v4;
        v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38)
          goto LABEL_28;
        v8 |= 0x20u;
        if ((v8 - 97) >= 6)
          goto LABEL_83;
        v9 = -87;
LABEL_28:
        v6 = 16 * (v9 + v8);
LABEL_29:
        if (v4 + 1 == a3)
          goto LABEL_83;
        v10 = v4[1];
        v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
          goto LABEL_34;
        v10 |= 0x20u;
        if ((v10 - 97) >= 6)
          goto LABEL_83;
        v11 = -87;
LABEL_34:
        if (v4 + 2 == a3)
          goto LABEL_83;
        v12 = v4[2];
        v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
          goto LABEL_39;
        v12 |= 0x20u;
        if ((v12 - 97) >= 6)
          goto LABEL_83;
        v13 = -87;
LABEL_39:
        v14 = v13 + v12 + 16 * (v11 + v10 + v6);
        if (!a4)
          sub_1000093C0(a1);
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v14;
        *((_BYTE *)a4 + 1) = 0;
        v4 += 3;
        break;
      case 'v':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 11;
        goto LABEL_74;
      case 'x':
        goto LABEL_29;
      default:
        goto LABEL_53;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4)
      goto LABEL_62;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 12;
LABEL_74:
        *(_WORD *)a4 = v16;
        return a2 + 1;
      }
LABEL_62:
      sub_1000093C0(a1);
    }
LABEL_53:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4)
        goto LABEL_62;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_83:
    sub_100008E18();
  }
  if (a2 + 1 == a3)
    goto LABEL_83;
  v15 = a2[1];
  if (((v15 & 0xDF) - 65) > 0x19u)
    goto LABEL_83;
  if (!a4)
    sub_1000093C0(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v15 & 0x1F;
  *((_BYTE *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_1000093C0(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

void sub_1000094C0()
{
  operator delete();
}

void sub_1000094E4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000951C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100009530(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

uint64_t sub_10000962C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = off_100010600;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_100009698(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::locale *v2;
  uint64_t v4;

  std::locale::~locale(v2);
  *v1 = off_100010468;
  v4 = v1[1];
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  _Unwind_Resume(a1);
}

std::locale *sub_1000096D0(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010600;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_100009728(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010600;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_100009790(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_100009808(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010648;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_100009860(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010648;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_1000098C8(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

_QWORD *sub_100009910(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100009954(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_1000099A8(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_1000099F0(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000106D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_100009A48(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000106D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_100009AB0(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_100009B94(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010720;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_100009BEC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100010720;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_100009C54(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

_QWORD *sub_100009CE4(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100009D28(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

unsigned int *sub_100009D7C(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    sub_1000094E4();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void sub_100009E38()
{
  operator new();
}

void sub_100009EAC()
{
  operator delete();
}

void sub_100009ED0(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100005450();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t sub_10000A0FC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)a1 = off_1000107B0;
  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_10000A210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v10;
  std::locale *v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_10000AB9C((void ***)&a10);
  v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  sub_10000AC28((void ***)&a10);
  v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  *v10 = off_100010468;
  v17 = v10[1];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

std::locale *sub_10000A29C(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)off_1000107B0;
  v7 = a1 + 17;
  sub_10000AB9C((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_10000AC28((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

void sub_10000A350(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v6;

  a1->__locale_ = (std::locale::__imp *)off_1000107B0;
  v6 = a1 + 17;
  sub_10000AB9C((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v6 = a1 + 11;
  sub_10000AC28((void ***)&v6);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100010468;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  operator delete();
}

void sub_10000A418(uint64_t a1, uint64_t a2)
{
  signed __int8 *v4;
  signed __int8 *v5;
  signed __int8 v6;
  signed __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  size_t v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  size_t v40;
  size_t v41;
  uint64_t v42;
  BOOL v43;
  unsigned __int8 **v44;
  unsigned __int8 *v45;
  int v46;
  unsigned __int8 *v47;
  void **v48;
  uint64_t v49;
  size_t v50;
  int v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  size_t v59;
  void *v60;
  size_t v61;
  uint64_t v62;
  BOOL v63;
  unsigned __int8 **v64;
  unsigned __int8 *v65;
  int v66;
  unsigned __int8 *v67;
  void **p_p;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *__p;
  size_t v84;
  char v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  uint64_t v88;

  v4 = *(signed __int8 **)(a2 + 16);
  v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    v18 = 0;
    v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }
  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5)
    goto LABEL_27;
  v6 = *v4;
  v86 = *v4;
  v7 = v4[1];
  v87 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    v86 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v6);
    v87 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v7);
  }
  sub_10000ADF0(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85)
      goto LABEL_8;
LABEL_27:
    v16 = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v19 = v84;
  operator delete(__p);
  if (!v19)
    goto LABEL_27;
LABEL_8:
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 120) - v8;
  if (v9)
  {
    v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1)
      v10 = 1;
    v11 = (_BYTE *)(v8 + 1);
    do
    {
      if (v86 == *(v11 - 1) && v87 == *v11)
        goto LABEL_152;
      v11 += 2;
      --v10;
    }
    while (v10);
  }
  if (!*(_BYTE *)(a1 + 170) || *(_QWORD *)(a1 + 88) == *(_QWORD *)(a1 + 96))
  {
    v16 = 0;
  }
  else
  {
    sub_10000AD1C(a1 + 16, (char *)&v86, (char *)&v88);
    v13 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(a1 + 96) == v13)
    {
LABEL_24:
      v16 = 0;
      v17 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      while ((int)(sub_10000ADB8((_QWORD *)(v13 + v14), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000ADB8(&__p, (void **)(*(_QWORD *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        v13 = *(_QWORD *)(a1 + 88);
        v14 += 48;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v13) >> 4))
          goto LABEL_24;
      }
      v16 = 1;
      v17 = 5;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v16 & 1) != 0)
      goto LABEL_129;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_134;
  sub_10000AFE0(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  v54 = *(_QWORD *)(a1 + 136);
  v55 = v85;
  v56 = *(_QWORD *)(a1 + 144) - v54;
  if (v56)
  {
    v57 = 0;
    v58 = v56 / 24;
    v60 = __p;
    v59 = v84;
    if (v85 >= 0)
      v61 = v85;
    else
      v61 = v84;
    if (v58 <= 1)
      v62 = 1;
    else
      v62 = v56 / 24;
    v63 = 1;
    while (1)
    {
      v64 = (unsigned __int8 **)(v54 + 24 * v57);
      v65 = (unsigned __int8 *)*((unsigned __int8 *)v64 + 23);
      v66 = (char)v65;
      if ((char)v65 < 0)
        v65 = v64[1];
      if ((unsigned __int8 *)v61 == v65)
      {
        if (v66 >= 0)
          v67 = (unsigned __int8 *)(v54 + 24 * v57);
        else
          v67 = *v64;
        if ((v55 & 0x80) == 0)
        {
          if ((_DWORD)v55)
          {
            p_p = &__p;
            v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != *v67)
                goto LABEL_122;
              p_p = (void **)((char *)p_p + 1);
              ++v67;
              --v69;
            }
            while (v69);
            v16 = 1;
            v17 = 5;
            goto LABEL_126;
          }
          v16 = 1;
          if (v63)
            goto LABEL_154;
LABEL_134:
          if ((char)v86 < 0)
          {
            v74 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }
          v71 = *(_DWORD *)(a1 + 160);
          v72 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
          v73 = *(_DWORD *)(v72 + 4 * v86);
          if ((v73 & v71) == 0 && (v86 != 95 || (v71 & 0x80) == 0)
            || (char)v87 < 0
            || (*(_DWORD *)(v72 + 4 * v87) & v71) == 0 && ((v71 & 0x80) == 0 || v87 != 95))
          {
            v74 = *(_DWORD *)(a1 + 164);
            if ((v73 & v74) != 0 || v86 == 95 && (v74 & 0x80) != 0)
            {
LABEL_151:
              v75 = v16;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v87) & v74) != 0)
                goto LABEL_151;
              v75 = 1;
              if (v87 == 95 && (v74 & 0x80) != 0)
                goto LABEL_151;
LABEL_153:
              v16 = v75;
LABEL_154:
              v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          v75 = 1;
          goto LABEL_153;
        }
        v80 = v58;
        v82 = v55;
        v70 = memcmp(v60, v67, v59);
        v58 = v80;
        v55 = v82;
        if (!v70)
          break;
      }
LABEL_122:
      v63 = ++v57 < v58;
      if (v57 == v62)
        goto LABEL_125;
    }
    v17 = 5;
    v16 = 1;
    goto LABEL_127;
  }
  v63 = 0;
LABEL_125:
  v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0)
LABEL_127:
    operator delete(__p);
  if (!v63)
    goto LABEL_134;
LABEL_129:
  if (v17)
    goto LABEL_154;
  v18 = 2;
LABEL_28:
  v20 = **(_BYTE **)(a2 + 16);
  v86 = v20;
  if (*(_BYTE *)(a1 + 169))
  {
    v20 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), (char)v20);
    v86 = v20;
  }
  v21 = *(unsigned __int8 **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 48) - (_QWORD)v21;
  if (v22)
  {
    if (v22 <= 1)
      v22 = 1;
    while (1)
    {
      v23 = *v21++;
      if (v23 == v20)
        break;
      if (!--v22)
        goto LABEL_35;
    }
LABEL_46:
    v16 = 1;
    goto LABEL_155;
  }
LABEL_35:
  v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v20) & v24) == 0)
      v25 = (v20 == 95) & (v24 >> 7);
    else
      LOBYTE(v25) = 1;
    v26 = *(void **)(a1 + 72);
    v27 = memchr(*(void **)(a1 + 64), (char)v20, (size_t)v26 - *(_QWORD *)(a1 + 64));
    v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26)
      goto LABEL_46;
  }
  v29 = *(_QWORD *)(a1 + 88);
  v30 = *(_QWORD *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_10000AD1C(a1 + 16, (char *)&v86, (char *)&v87);
      v29 = *(_QWORD *)(a1 + 88);
      v30 = *(_QWORD *)(a1 + 96);
    }
    else
    {
      v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      v33 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 0;
      while ((int)(sub_10000ADB8((_QWORD *)(v29 + v31), &__p) << 24) > 0xFFFFFF
           || (int)(sub_10000ADB8(&__p, (void **)(*(_QWORD *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        v29 = *(_QWORD *)(a1 + 88);
        v31 += 48;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v29) >> 4))
          goto LABEL_57;
      }
      v33 = 1;
      v16 = 1;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v33 & 1) != 0)
      goto LABEL_155;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_90;
  sub_10000AFE0(a1 + 16, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  v34 = *(_QWORD *)(a1 + 136);
  v35 = v85;
  v36 = *(_QWORD *)(a1 + 144) - v34;
  if (v36)
  {
    v81 = v18;
    v37 = 0;
    v38 = v36 / 24;
    v39 = __p;
    v40 = v84;
    if (v85 >= 0)
      v41 = v85;
    else
      v41 = v84;
    if (v38 <= 1)
      v42 = 1;
    else
      v42 = v36 / 24;
    v43 = 1;
    while (1)
    {
      v44 = (unsigned __int8 **)(v34 + 24 * v37);
      v45 = (unsigned __int8 *)*((unsigned __int8 *)v44 + 23);
      v46 = (char)v45;
      if ((char)v45 < 0)
        v45 = v44[1];
      if ((unsigned __int8 *)v41 == v45)
      {
        if (v46 >= 0)
          v47 = (unsigned __int8 *)(v34 + 24 * v37);
        else
          v47 = *v44;
        if ((v35 & 0x80) != 0)
        {
          v79 = v16;
          v50 = v41;
          v78 = v34;
          v51 = memcmp(v39, v47, v40);
          v34 = v78;
          v41 = v50;
          v16 = v79;
          if (!v51)
          {
            v16 = 1;
            v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!(_DWORD)v35)
          {
            v16 = 1;
            v18 = v81;
            if (!v43)
              goto LABEL_90;
            goto LABEL_155;
          }
          v48 = &__p;
          v49 = v35;
          while (*(unsigned __int8 *)v48 == *v47)
          {
            v48 = (void **)((char *)v48 + 1);
            ++v47;
            if (!--v49)
            {
              v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        v18 = v81;
        if ((v35 & 0x80) == 0)
          goto LABEL_89;
        goto LABEL_88;
      }
    }
  }
  v43 = 0;
  if (v85 < 0)
LABEL_88:
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0)
      goto LABEL_155;
    v52 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v86) & v52) == 0)
    {
      v53 = (v52 >> 7) & 1;
      if (v86 != 95)
        v53 = 0;
      if (v53 != 1)
        goto LABEL_155;
    }
    goto LABEL_46;
  }
LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    v76 = 0;
    v77 = -993;
  }
  else
  {
    *(_QWORD *)(a2 + 16) += v18;
    v76 = *(_QWORD *)(a1 + 8);
    v77 = -995;
  }
  *(_DWORD *)a2 = v77;
  *(_QWORD *)(a2 + 80) = v76;
}

void sub_10000AB9C(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_10000ABDC((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_10000ABDC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void sub_10000AC28(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_10000AC98(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10000AC98(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t sub_10000ACDC(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000AD1C(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1000038F0(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_10000AD9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000ADB8(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return sub_10000AF84(a1, v2, v5, v6);
}

void sub_10000ADF0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_1000038F0(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_10000AF50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000AF84(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

void sub_10000AFE0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000038F0(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_10000B0B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000B0D4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000B10C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_10000B120(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  char *v18;
  __int128 *v19;
  int v20;
  _BYTE *v21;
  char *v22;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  v9 = 0;
  v10 = 0;
  v31 = 0uLL;
  v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    v11 = a2[1];
    switch(v11)
    {
      case '.':
        v4 = (char *)sub_10000B784(a1, a2 + 2, a3, (uint64_t)&v31);
        v9 = HIBYTE(v32);
        v10 = *((_QWORD *)&v31 + 1);
        break;
      case ':':
        v12 = sub_10000B6CC(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        v12 = sub_10000B4F0(a1, a2 + 2, a3, a4);
LABEL_11:
        v6 = v12;
        v13 = 0;
        goto LABEL_44;
      default:
        v10 = 0;
        v9 = 0;
        break;
    }
  }
  v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0)
    v10 = v9;
  if (v10)
  {
    v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    v16 = *v4;
    if (v16 == 92)
    {
      v17 = v4 + 1;
      if (v14)
        v18 = sub_10000B9D4(a1, v17, a3, (uint64_t *)&v31);
      else
        v18 = (char *)sub_10000B870(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    v19 = (__int128 *)v31;
    *((_QWORD *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    v19 = &v31;
  }
  *(_BYTE *)v19 = v16;
  *((_BYTE *)v19 + 1) = 0;
  v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (v20 = *v15, v20 == 93)
    || (v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((_QWORD *)&v31 + 1))
      {
        if (*((_QWORD *)&v31 + 1) != 1)
        {
          v22 = (char *)v31;
LABEL_42:
          sub_10000C084(v6, *v22, v22[1]);
          goto LABEL_43;
        }
        v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      v22 = (char *)&v31;
      if (HIBYTE(v32) != 1)
        goto LABEL_42;
LABEL_40:
      sub_100009ED0(v6, *v22);
    }
LABEL_43:
    v13 = 1;
    v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    v24 = sub_10000B784(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if ((_DWORD)v21 == 92)
    {
      if (v14)
        v24 = (uint64_t)sub_10000B9D4(a1, v15 + 2, a3, (uint64_t *)v29);
      else
        v24 = (uint64_t)sub_10000B870(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)v27 = v31;
  v28 = v32;
  v32 = 0;
  v31 = 0uLL;
  *(_OWORD *)__p = *(_OWORD *)v29;
  v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  sub_10000BCC0(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0)
    operator delete((void *)v31);
  if ((v13 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_10000B490(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B4F0(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t i;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *__p[2];
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  for (i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_33;
  }
  if (&a2[i] == a3)
LABEL_33:
    sub_10000B0D4();
  sub_10000C338(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_10000C2AC();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  sub_10000C4CC(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    sub_10000C2F8(a4, (__int128 *)__p);
  }
  else
  {
    v11 = v19;
    if ((v19 & 0x80u) != 0)
      v11 = v18;
    if (v11 == 2)
    {
      v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v13 = (char *)v17;
      sub_10000C084((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        sub_10000C2AC();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      sub_100009ED0((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_10000B694(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000B6CC(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  int v7;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  for (i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_11;
  }
  if (&a2[i] == a3)
LABEL_11:
    sub_10000B0D4();
  v7 = sub_10000CA24(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    sub_10000C9D8();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_10000B784(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    sub_10000B0D4();
  sub_10000C338(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    sub_10000C2AC();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_10000B870(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v6;
  int v7;
  int v8;

  if (a2 == a3)
    sub_100008E18();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return sub_100008FEC(a1, a2, a3, (uint64_t *)a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_100009ED0(a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100)
        return sub_100008FEC(a1, a2, a3, (uint64_t *)a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    return sub_100008FEC(a1, a2, a3, (uint64_t *)a4);
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 != 87)
    return sub_100008FEC(a1, a2, a3, (uint64_t *)a4);
  *(_DWORD *)(a5 + 164) |= 0x500u;
  sub_10000CADC(a5, 95);
  return a2 + 1;
}

char *sub_10000B9D4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4;
  char v5;
  char v6;
  char *v7;
  char v8;
  int v9;
  char v10;
  __int16 v11;

  if (a2 == a3)
LABEL_78:
    sub_100008E18();
  v4 = *a2;
  v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 8;
        }
        else
        {
          if (v4 != 102)
            goto LABEL_25;
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92)
      goto LABEL_16;
    if (v4 != 97)
      goto LABEL_25;
    if (!a4)
      goto LABEL_60;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_1000093C0(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30)
    goto LABEL_78;
  v6 = v4 - 48;
  v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      v8 = a2[2];
      v9 = v8 & 0xF8;
      v10 = v8 + 8 * v6 - 48;
      if (v9 == 48)
        v7 = a2 + 3;
      else
        v7 = a2 + 2;
      if (v9 == 48)
        v6 = v10;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4)
    sub_1000093C0(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v6;
  *((_BYTE *)a4 + 1) = 0;
  return v7;
}

void sub_10000BCC0(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    sub_10000CEBC(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    sub_10000CEBC(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    sub_10000CD08((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      sub_10000CF58();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    sub_10000CD08((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_10000C038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  sub_10000ACDC((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_10000C084(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)sub_10000D034(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)sub_10000D034(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_100005450();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)sub_10000D034(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void sub_10000C2AC()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000C2E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C2F8(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = sub_10000C61C(v3, a2);
  }
  else
  {
    sub_10000C5C0(v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_10000C338(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_1000038F0(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_10000C498(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000C4CC(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000038F0(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_10000C5A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000C5C0(_QWORD *result, __int128 *a2)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;

  v2 = result;
  v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    result = sub_10000C73C((_BYTE *)result[1], *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_10000C614(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000C61C(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_100005450();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_100005760(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10000C73C(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_10000C7C8(a1, v15);
  v13 = a1[1];
  sub_10000C950((uint64_t)v15);
  return v13;
}

void sub_10000C728(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_10000C950((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_10000C73C(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_100003188();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_10000C7C8(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_10000C83C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_10000C83C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  sub_10000C8D8((uint64_t)v12);
  return a6;
}

uint64_t sub_10000C8D8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_10000C90C(a1);
  return a1;
}

void sub_10000C90C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t sub_10000C950(uint64_t a1)
{
  sub_10000C984(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000C984(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_10000C9D8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_10000CA10(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CA24(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  sub_1000038F0(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_10000CAC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000CADC(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_100005450();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

uint64_t sub_10000CD08(char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  char *v25;
  uint64_t v26;
  int64x2_t v27;
  char *v28;
  uint64_t v29;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      sub_100005450();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v29 = result;
    if (v14)
      v15 = (char *)sub_10000CFA4(result, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v20 = *a1;
    v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      v24 = vdupq_n_s64(v19);
      v21 = &v15[48 * v11];
    }
    else
    {
      v21 = &v15[48 * v11];
      do
      {
        v22 = *(_OWORD *)(v19 - 48);
        *((_QWORD *)v21 - 4) = *(_QWORD *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(_QWORD *)(v19 - 40) = 0;
        *(_QWORD *)(v19 - 32) = 0;
        *(_QWORD *)(v19 - 48) = 0;
        v23 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v21 - 1) = *(_QWORD *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(_QWORD *)(v19 - 16) = 0;
        *(_QWORD *)(v19 - 8) = 0;
        *(_QWORD *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      v24 = *(int64x2_t *)a1;
    }
    v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    v27 = v24;
    v25 = a1[2];
    a1[2] = &v15[48 * v14];
    v28 = v25;
    v26 = v24.i64[0];
    result = sub_10000CFE8((uint64_t)&v26);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
  return result;
}

void sub_10000CEBC(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_1000038F0(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_10000CF3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000CF58()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10000CF90(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000CFA4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_1000054A8();
  return operator new(48 * a2);
}

uint64_t sub_10000CFE8(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    sub_10000AC98(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_10000D034(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_1000054A8();
  return operator new(2 * a2);
}

_QWORD *sub_10000D064(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000D0A8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000D0FC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000D12C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000D170(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000D1C4(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_10000D1FC()
{
  operator new();
}

void sub_10000D31C(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000D344(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            sub_10000D3E0();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void sub_10000D3E0()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000D418(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000D42C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000D464(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000D478(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000D4E0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_10000D558(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return sub_10000D71C(result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *sub_10000D60C(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return sub_10000D71C(result, a3);
  }
  return result;
}

_QWORD *sub_10000D63C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000D6A4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_10000D71C(unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_10000D774()
{
  operator delete();
}

uint64_t sub_10000D788(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000D79C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000D804(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000108E8;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100010468;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

void sub_10000D87C(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000D888(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void sub_10000D8B0()
{
  operator delete();
}

uint64_t sub_10000D8C4(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_10000D8D8()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000D910(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000D924(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v6;

  if (a2 == a3)
    return a2;
  v6 = sub_10000D9AC(a1, a2, a3);
  if (v6 == a2)
    return a2;
  else
    return sub_10000DAB8(a1, v6, a3);
}

_BYTE *sub_10000D9AC(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  int v12;
  uint64_t v13;

  v6 = sub_10000DC58(a1, a2, a3);
  v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      v8 = a2[1];
      if (v8 == 40)
      {
        v9 = (uint64_t)(a2 + 2);
        sub_100008BE4(a1);
        do
        {
          v10 = (_BYTE *)v9;
          v9 = sub_10000D924(a1, v9, a3);
        }
        while ((_BYTE *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41)
          sub_100008340();
        v7 = v10 + 2;
        sub_100008C58(a1);
      }
      else
      {
        v12 = sub_10000DEC0(a1, v8);
        v13 = 2;
        if (!v12)
          v13 = 0;
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_10000DAB8(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  int v12;
  int v13;

  if (a2 != a3)
  {
    v4 = *a2;
    if (v4 == 42)
      sub_10000D1FC();
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      v6 = a2 + 2;
      v13 = 0;
      v7 = sub_10000D344(a1, a2 + 2, a3, &v13);
      if (v7 == v6)
        goto LABEL_16;
      if (v7 != a3)
      {
        v8 = v7 + 1;
        v9 = *v7;
        if (v9 == 44)
        {
          v12 = -1;
          v10 = sub_10000D344(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13)
LABEL_16:
              sub_10000D3E0();
LABEL_20:
            sub_10000D1FC();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_10000D42C();
    }
  }
  return a2;
}

_BYTE *sub_10000DC58(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v6;
  _BYTE *result;

  if (a2 == a3)
  {
    result = sub_10000DD70(a1, a2, a3);
    if (result != a2)
      return result;
    return sub_100008AD4(a1, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_1000093C0(a1);
  }
  result = sub_10000DD70(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46)
      operator new();
    return sub_100008AD4(a1, a2, a3);
  }
  return result;
}

_BYTE *sub_10000DD70(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_1000093C0(a1);
  }
  return a2;
}

_QWORD *sub_10000DDE8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100010468;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000DE2C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100010468;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000DE80(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_10000DEC0(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28))
      sub_100009530(a1);
    sub_1000094E4();
  }
  return 0;
}

unsigned __int8 *sub_10000DF1C(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_10000DF78(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_10000D8D8();
  do
  {
    v7 = v6;
    v6 = sub_10000DF78(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_10000DF78(uint64_t a1, char *a2, char *a3)
{
  char *v6;
  unsigned __int8 *v7;
  int v8;
  char *v9;
  char *v10;

  v6 = sub_10000E128(a1, a2, a3);
  v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    v8 = *a2;
    if (v8 == 36)
      operator new();
    if (v8 != 40)
    {
      if (v8 == 94)
        operator new();
      return (unsigned __int8 *)a2;
    }
    sub_100008BE4(a1);
    ++*(_DWORD *)(a1 + 36);
    v9 = (char *)sub_1000072A4(a1, a2 + 1, a3);
    if (v9 == a3 || (v10 = v9, *v9 != 41))
      sub_100008340();
    sub_100008C58(a1);
    --*(_DWORD *)(a1 + 36);
    v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 != (unsigned __int8 *)a2)
    return sub_100007F18(a1, v7, (unsigned __int8 *)a3);
  return (unsigned __int8 *)a2;
}

char *sub_10000E128(uint64_t a1, char *a2, char *a3)
{
  char *result;

  result = sub_10000E1F0(a1, a2, a3);
  if (result == a2)
  {
    result = sub_10000E278(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46)
        operator new();
      return sub_100008AD4(a1, a2, a3);
    }
  }
  return result;
}

char *sub_10000E1F0(uint64_t a1, char *a2, char *a3)
{
  int v3;
  uint64_t v4;

  if (a2 != a3)
  {
    v3 = *a2;
    v4 = (v3 - 36);
    if (v4 > 0x3A)
      goto LABEL_8;
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0)
      return a2;
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        return a2;
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2)
        return a2;
    }
    sub_1000093C0(a1);
  }
  return a2;
}

char *sub_10000E278(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v4;
  int v5;
  BOOL v6;
  int v8;
  uint64_t v9;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92)
    return v3;
  v5 = (char)*v4;
  v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3)
    sub_1000093C0(a1);
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v8 = sub_10000DEC0(a1, *v4);
    v9 = 2;
    if (!v8)
      v9 = 0;
    v3 += v9;
    return v3;
  }
  return sub_10000B9D4(a1, (char *)v4, a3, 0);
}

util::MappedFile *util::MappedFile::MappedFile(util::MappedFile *this, const char *a2)
{
  int v3;
  int v4;
  off_t st_size;
  void *v7;
  void *v8;
  stat v10;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v3 = open(a2, 0, 0);
  if ((v3 & 0x80000000) == 0)
  {
    v4 = v3;
    if (!fstat(v3, &v10))
    {
      st_size = v10.st_size;
      if ((v10.st_mode & 0xF000) == 0x8000 && v10.st_size > 0)
      {
        *((_QWORD *)this + 1) = v10.st_size;
        v7 = mmap(0, st_size, 1, 1, v4, 0);
        if (v7 == (void *)-1)
          v8 = 0;
        else
          v8 = v7;
        *(_QWORD *)this = v8;
      }
    }
    close(v4);
  }
  return this;
}

void util::MappedFile::~MappedFile(util::MappedFile *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    munmap(v2, *((_QWORD *)this + 1));
}

_QWORD *util::stringprintf@<X0>(util *this@<X0>, _QWORD *a2@<X8>, ...)
{
  char __str[1024];
  va_list va;

  va_start(va, a2);
  vsnprintf(__str, 0x400uLL, (const char *)this, va);
  return sub_1000030D8(a2, __str);
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}
