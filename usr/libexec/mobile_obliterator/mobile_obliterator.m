void sub_1000045C0(int a1, int a2)
{
  char *v4;
  const __CFString *v5;
  const __CFNumber *v6;
  CFTypeID v7;
  CFTypeID v8;
  CFRange v9;
  CFTypeID v10;
  CFIndex Length;
  UInt8 buffer[8];
  uint64_t v13;

  if (os_variant_has_internal_content(""))
  {
    dword_1000287B8 = a1;
    if (a1)
      goto LABEL_16;
    if (a2)
      v4 = "safe-oblit-sim-fail";
    else
      v4 = "oblit-sim-fail";
    v5 = sub_100010804(v4, 1);
    if (v5)
    {
      v6 = (const __CFNumber *)v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v6, kCFNumberIntType, &dword_1000287B8);
      }
      else
      {
        v8 = CFGetTypeID(v6);
        if (v8 == CFDataGetTypeID())
        {
          *(_QWORD *)buffer = 0;
          v13 = 0;
          if ((unint64_t)CFDataGetLength(v6) > 0xF)
            v9.length = 16;
          else
            v9.length = CFDataGetLength(v6);
          v9.location = 0;
          CFDataGetBytes(v6, v9, buffer);
          dword_1000287B8 = strtoul((const char *)buffer, 0, 0);
        }
      }
      v10 = CFGetTypeID(v6);
      Length = CFDataGetLength(v6);
      sub_10000489C(1, "%s: Found %s set in NVRAM (type: %lu, size: %ld)\n", "obliteration_sim_failure_setup", "oblit-sim-fail", v10, Length);
      CFRelease(v6);
    }
    a1 = dword_1000287B8;
    if (dword_1000287B8)
LABEL_16:
      sub_10000489C(1, "%s: Set simulated failure location to 0x%x", "obliteration_sim_failure_setup", a1);
  }
}

uint64_t sub_100004750(int a1, const char *a2)
{
  unsigned int has_internal_content;
  uint64_t v5;

  has_internal_content = os_variant_has_internal_content("");
  if (dword_1000287B8 == a1)
    v5 = has_internal_content;
  else
    v5 = 0;
  if ((_DWORD)v5 == 1)
    sub_10000489C(1, "%s: Simulating failure at location 0x%x (%s)\n", "obliteration_sim_failure_should_fail", a1, a2);
  return v5;
}

const char *sub_1000047C8(int a1)
{
  const char *result;
  int v4;
  const char *v5;
  const char *v6;

  result = aPrivateVarHard;
  switch(a1)
  {
    case 0:
      v4 = byte_1000288D8;
      v5 = "/private/var";
      v6 = "/private/var/tmp/alt_root/private/var";
      goto LABEL_7;
    case 1:
      v4 = byte_1000288D8;
      v5 = "/private/var/mobile";
      v6 = "/private/var/tmp/alt_root/private/var/mobile";
      goto LABEL_7;
    case 2:
      return result;
    case 3:
      return "/private/var/tmp";
    case 4:
      v4 = byte_1000288D8;
      v5 = "/";
      v6 = "/private/var/tmp/alt_root";
LABEL_7:
      if (v4)
        result = v6;
      else
        result = v5;
      break;
    default:
      sub_10000489C(1, "%s: ☠️ =====>>> Error: Invalid path request (%d) <<<===== ☠️", "getCurrentPath", a1);
      result = "/private/var";
      break;
  }
  return result;
}

void sub_10000489C(int a1, char *__format, ...)
{
  int v3;
  CFIndex v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  UInt8 __str[1024];
  va_list va;

  va_start(va, __format);
  if (!__format)
    return;
  if (byte_1000288F0 != 1)
  {
    v6 = CFStringCreateWithCString(kCFAllocatorDefault, __format, 0x8000100u);
    if (!v6)
      return;
    v7 = v6;
    v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v6, va);
    CFRelease(v7);
    if (!v5)
      return;
LABEL_10:
    sub_100006454(v5, 1u, a1);
    CFRelease(v5);
    return;
  }
  v3 = vsnprintf((char *)__str, 0x400uLL, __format, va);
  if (v3)
  {
    v4 = v3;
    if (v3 <= 0x3FF)
    {
      __str[v3] = 10;
      v4 = v3 + 1;
    }
    v5 = CFStringCreateWithBytes(kCFAllocatorDefault, __str, v4, 0x8000100u, 0);
    if (v5)
      goto LABEL_10;
  }
}

uint64_t sub_1000049E0(int a1, char *__s1, const char *a3)
{
  size_t v6;
  size_t v7;
  const char *v8;
  size_t v9;
  const char *v10;
  const char *v11;

  if (__s1)
  {
    v6 = strnlen(__s1, 0x100uLL) + 1;
    if (a3)
    {
LABEL_3:
      v7 = strnlen(a3, 0x100uLL);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 1;
    if (a3)
      goto LABEL_3;
  }
  v7 = 0;
LABEL_6:
  v8 = sub_1000047C8(a1);
  v9 = strlen(v8);
  if (v6 + v7 + v9 >= 0x101)
    sub_10000489C(1, "%s: ☠️ =====>>> Error: path too long (%zu > %d) and WILL BE TRUNCATED <<<===== ☠️", "setGlobalPath", v6 + v7 + v9, 256);
  v10 = "";
  if (__s1)
    v11 = __s1;
  else
    v11 = "";
  if (a3)
    v10 = a3;
  return snprintf(byte_1000287D0, 0x100uLL, "%s%s%s", v8, v11, v10);
}

uint64_t start(int a1, uint64_t a2)
{
  dispatch_queue_t v4;
  NSObject *v5;
  uint64_t v6;
  const char *v8;
  size_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char *v13;
  size_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  time_t v18;
  const char *v19;
  const __CFString *v20;
  CFStringRef v21;
  CFStringRef v22;
  char __big[256];

  byte_1000287C1 = sub_100011594();
  dword_100028698 = open("/dev/console", 9);
  if (sub_100010158())
    sub_1000102D0();
  byte_1000288D9 = sub_1000100B8();
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    fwrite("Obliterator: In INIT check\n", 0x1BuLL, 1uLL, __stderrp);
    if ((sub_100004E90(0, 0) & 1) != 0 || (sub_100011494() & 1) != 0)
    {
      fwrite("Obliterator: Obliteration terminated improperly, continuing obliteration...\n", 0x4CuLL, 1uLL, __stderrp);
      close(0);
      if (open("/dev/null", 2) == -1)
      {
        v8 = "failed to open stdin devnull\n";
        v9 = 29;
      }
      else
      {
        v8 = "*** STDIN set with devnull ***\n";
        v9 = 31;
      }
      fwrite(v8, v9, 1uLL, __stderrp);
      sub_1000045C0(0, 1);
      v10 = sub_100004FB8();
      v11 = v10;
      if ((_DWORD)v10 != 89 && (_DWORD)v10)
      {
        v21 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Safe Obliteration failed with [gF: 0x%016llX] Attempt: %ld"), qword_1000287C8, qword_1000288E0 + 1);
        if (v21)
        {
          v22 = v21;
          sub_100010F20("oblit-failure", v21);
          CFRelease(v22);
        }
        sub_10000489C(0, "%s: Safe Obliteration failed, returning %d", "main", v11);
      }
      else
      {
        v12 = sub_10000635C("oblit-begins", __big, 0x100u);
        if (v12)
        {
          v14 = v12;
          v15 = strnstr(__big, "Caller: ", v12);
          v16 = v14 - 8;
          v13 = &__big[8 * (v15 != 0)];
          if (!v15)
            v16 = v14;
          if (v16 >= 0xC1)
          {
            v17 = 199;
            if (!v15)
              v17 = 191;
            __big[v17] = 0;
          }
        }
        else
        {
          v13 = 0;
        }
        v18 = time(0);
        v19 = "<unknown>";
        if (v13)
          v19 = v13;
        v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("SafeOblit done @%ld, Err:%d, By:%s"), v18, v11, v19);
        sub_100006454(v20, 0, 1);
        sub_1000113A8(CFSTR("oblit-begins"));
        sub_1000113A8(CFSTR("oblit-failure"));
        if (sub_100011494())
LABEL_31:
          exit(0);
      }
      if (sub_100010158())
      {
        sub_1000049E0(0, 0, "/log/obliteration.log");
        sub_10001057C((uint64_t)byte_1000287D0, (uint64_t)sub_1000101BC);
        sub_100010394();
      }
      exit(v11);
    }
    fwrite("Obliterator: No obliteration needed, continue booting, returning 0\n", 0x43uLL, 1uLL, __stderrp);
    goto LABEL_31;
  }
  sub_10000489C(1, "%s: mobile_obliterator - XPC version started", "main");
  v4 = dispatch_queue_create("com.apple.mobile.obliterator", 0);
  if (v4)
  {
    v5 = v4;
    v6 = qword_1000288E8;
    if (qword_1000288E8 || (v6 = MOXPCTransportOpen("com.apple.mobile.obliteration", 1), (qword_1000288E8 = v6) != 0))
    {
      MOXPCTransportSetMessageHandler(v6, v5, &stru_100024B70);
      dispatch_release(v5);
      MOXPCTransportResume(qword_1000288E8);
      dispatch_main();
    }
    sub_10000489C(1, "%s: Unable to start server");
  }
  else
  {
    sub_10000489C(1, "%s: Can't create dispatch resources.");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004E90(int a1, uint64_t *a2)
{
  io_registry_entry_t v4;
  uint64_t result;
  char *__endptr;
  uint32_t size;
  char _20[320];

  size = 255;
  v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v4)
  {
    sub_10000489C(0, "%s: IORegistryEntryFromPath failed");
    return 0;
  }
  memset(_20, 0, 255);
  if (IORegistryEntryGetProperty(v4, "oblit-inprogress", _20, &size))
  {
    sub_10000489C(0, "%s: IORegistryEntryGetProperty failed, may be does not exist");
    return 0;
  }
  result = 1;
  if (a2)
  {
    if (a1)
    {
      __endptr = 0;
      *a2 = strtol(_20, &__endptr, 10);
      return 1;
    }
  }
  return result;
}

uint64_t sub_100004FB8()
{
  int v0;
  size_t v1;
  size_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  unint64_t v15;
  _BOOL4 v17;
  const char *v18;
  fstab *v19;
  fstab *v20;
  int *v21;
  char *f_mntfromname;
  char *v23;
  char *v24;
  __CFArray *v25;
  __objc2_class_ro *v26;
  __CFArray *v27;
  int Count;
  CFStringRef v29;
  const __CFString *v30;
  const __CFString *ValueAtIndex;
  int v32;
  fstab *v33;
  _QWORD *v34;
  _QWORD *v35;
  char *v36;
  int v37;
  int v38;
  char *v39;
  uint64_t v40;
  char *v41;
  id v42;
  void *v43;
  int v44;
  int v45;
  off_t v46;
  size_t v47;
  char *v48;
  char *v49;
  const char *v50;
  int *v51;
  int *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  const __CFString *v58;
  id v59;
  int v60;
  int v61;
  char *v62;
  int v63;
  int v64;
  char *v65;
  uint64_t v66;
  CFIndex v67;
  const __CFString *v68;
  int *v69;
  char *v70;
  int *v71;
  char *v72;
  CFIndex v73;
  char *v74;
  char v75;
  char v76;
  statfs v77;
  char v78[64];
  char __s[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83[72];

  memset(v83, 0, 64);
  v82 = 0u;
  v81 = 0u;
  v80 = 0u;
  *(_OWORD *)__s = 0u;
  memset(v78, 0, sizeof(v78));
  v76 = 0;
  v0 = sub_100011494();
  v75 = 0;
  sub_10000489C(1, "%s: safeObliterate: Starting", "safeObliterate");
  if ((v0 & 1) != 0)
    goto LABEL_32;
  v1 = sub_10000635C("oblit-failure", (char *)&xmmword_100028978, 0x180u);
  if (v1)
  {
    v2 = v1;
    v3 = strnstr((const char *)&xmmword_100028978, "[gF: 0x", v1);
    if (v3)
    {
      v4 = strtoull(v3 + 7, 0, 16);
      sub_10000489C(1, "%s: Safe Obliteration previous gFailure is 0x%016llX", "safeOblitCheckLoop", v4);
    }
    else
    {
      v4 = 0;
    }
    v6 = strnstr((const char *)&xmmword_100028978, "Attempt: ", v2);
    if (v6)
    {
      v7 = strtol(v6 + 9, 0, 10);
      v8 = v7;
      if (v7)
      {
        sub_10000489C(1, "%s: Safe Obliteration previous finish count in nvram is %ld", "safeOblitCheckLoop", v7);
        if (v8 >= 1)
          qword_1000288E0 = v8;
      }
      v5 = v8 & ~(v8 >> 63);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  v9 = sub_10000635C("oblit-begins", (char *)&xmmword_100028978, 0x160u);
  if (v9)
  {
    v10 = strnstr((const char *)&xmmword_100028978, "Attempt: ", v9);
    if (v10)
    {
      v11 = v10 + 9;
      v12 = strtol(v10 + 9, 0, 10);
      if (v12)
      {
        v13 = v12;
        sub_10000489C(1, "%s: Safe Obliteration previous start count in nvram is %ld", "safeOblitCheckLoop", v12);
        if (v13 > 0)
        {
          if ((unint64_t)v13 > 0xA)
          {
            v14 = "no";
            v15 = v4 & 0x8650100000165600;
            if (!v15)
              v14 = "yes";
            sub_10000489C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", v14);
            if (!v15)
            {
              sub_10000489C(0, "%s: Skipping safe attempt, returning 0 to try normal boot (also clearing NVRAM Key indicating obliteration should run)", "safeObliterate");
              sub_10000489C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
              sub_1000113A8(CFSTR("oblit-inprogress"));
              return 0;
            }
            goto LABEL_30;
          }
          goto LABEL_28;
        }
      }
    }
  }
  if ((unint64_t)(v5 - 1) > 3)
  {
    v5 = 1;
    sub_10000489C(1, "%s: Overriding all safe obliteration previous count values to 1", "safeOblitCheckLoop");
    qword_1000288E0 = 1;
    if (v9)
      goto LABEL_24;
LABEL_26:
    strcpy((char *)&xmmword_100028978, "No info for unknown MO type, Attempt: ");
    v9 = &stru_100000020.cmdsize + 2;
    goto LABEL_27;
  }
  sub_10000489C(1, "%s: Overriding safe obliteration previous start count to %ld", "safeOblitCheckLoop", v5);
  if (!v9)
    goto LABEL_26;
LABEL_24:
  v9 = v9 - 1 + snprintf((char *)&xmmword_100028978 + v9 - 1, 353 - v9, ", Attempt: ");
LABEL_27:
  v11 = (char *)&xmmword_100028978 + v9;
  v13 = v5;
LABEL_28:
  if (v13 - v5 >= 5)
  {
    sub_10000489C(1, "%s: Too many failures (try boot: %s)", "safeObliterate", "no");
LABEL_30:
    sub_100010A58("auto-boot", "false");
    sub_10000489C(0, "%s: Skipping safe attempt, returning EACCES to go into recovery (set 'auto-boot' to false)");
    return 13;
  }
  snprintf(v11, 384 - v9, "%lu", v13 + 1);
  sub_100010A58("oblit-begins", (const char *)&xmmword_100028978);
  sub_10000489C(1, "%s: safeOblitCheckLoop() passed, attempting safe-obliterate", "safeObliterate");
LABEL_32:
  if (sub_100004750(16, "safeObliterate"))
  {
    sub_10000489C(1, "%s: Simulating safeObliterate failure at start");
    return 13;
  }
  v17 = sub_10000B170();
  if (v17)
    sub_10000489C(1, "%s: safeObliterate: Device is in multiuser mode", "safeObliterate");
  if (byte_1000288D8)
    v18 = "/private/var/tmp/alt_root/private/var";
  else
    v18 = "/private/var";
  v74 = (char *)v18;
  v19 = getfsfile(v18);
  if (v19 && (v20 = v19, (sub_100004750(17, "safeObliterate") & 1) == 0))
  {
    __strlcpy_chk(__s, v20->fs_spec, 64, 64);
  }
  else
  {
    sub_10000489C(1, "%s: safeObliterate: Failed getfsfile, manually creating data volume device", "safeObliterate");
    memset(&v77, 0, 512);
    *__error() = 0;
    if (statfs("/", &v77) || sub_100004750(17, "safeObliterate"))
    {
      v21 = __error();
      sub_10000489C(1, "%s: safeObliterate: Failed statfs of \"/\", error: %d", "safeObliterate", *v21);
    }
    else
    {
      f_mntfromname = v77.f_mntfromname;
      do
      {
        v23 = f_mntfromname;
        v24 = strchr(f_mntfromname, 64);
        f_mntfromname = v24 + 1;
      }
      while (v24);
      __strlcpy_chk(__s, v23, 64, 64);
      __s[strlen(__s) - 1] = 50;
      sub_10000489C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }
  }
  sub_10000489C(1, "%s: safeObliterate(): XXXXXXXXXXXXX SKIPPING RAMROD SETUP XXXXXXXXXXXXX ", "safeObliterate");
  sub_10000489C(1, "%s: safeObliterate: Checking if Data volume exists", "safeObliterate");
  v25 = sub_10000DEC0();
  v26 = &DiskSupport__metaData;
  if (!v25)
  {
    sub_10000489C(1, "%s: Unable to find any APFS Volume in IORegistry, bailing", "data_volume_exists");
LABEL_59:
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x10000);
    sub_10000489C(1, "%s: safeObliterate: Could not find Data volume, will skip deletion but drop keys before creating new volume", "safeObliterate");
    v32 = 0;
    goto LABEL_60;
  }
  v27 = v25;
  Count = CFArrayGetCount(v25);
  if (!Count)
  {
    sub_10000489C(1, "%s: APFS Volume list is empty, bailing");
    goto LABEL_58;
  }
  sub_10000489C(1, "%s: Obtained List of APFS volumes", "data_volume_exists");
  v29 = CFStringCreateWithCString(kCFAllocatorDefault, __s, 0x8000100u);
  if (!v29)
  {
    sub_10000489C(1, "%s: Could not create String from f_mntfromname, bailing");
    goto LABEL_58;
  }
  if (Count <= 0)
  {
LABEL_58:
    CFRelease(v27);
    goto LABEL_59;
  }
  v30 = v29;
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v27, 0);
  if (CFStringFind(v30, ValueAtIndex, 0x40uLL).location == -1)
  {
    v73 = Count;
    v66 = Count;
    v67 = 1;
    while (v66 != v67)
    {
      v68 = (const __CFString *)CFArrayGetValueAtIndex(v27, v67++);
      if (CFStringFind(v30, v68, 0x40uLL).location != -1)
      {
        v32 = 1;
        sub_10000489C(1, "%s: Found existing Data volume", "data_volume_exists");
        CFRelease(v27);
        v26 = &DiskSupport__metaData;
        if (v67 - 1 >= v73)
          goto LABEL_59;
        goto LABEL_60;
      }
    }
    CFRelease(v27);
    v26 = &DiskSupport__metaData;
    if (v67 >= v73)
      goto LABEL_59;
    v32 = 1;
  }
  else
  {
    v32 = 1;
    sub_10000489C(1, "%s: Found existing Data volume", "data_volume_exists");
    CFRelease(v27);
  }
LABEL_60:
  if ((v0 & 1) == 0)
  {
    if (byte_1000287C1)
    {
      sub_10000489C(1, "%s: safeObliterate: Skipping the Disable of the watchdog timer", "safeObliterate");
    }
    else
    {
      sub_10000489C(1, "%s: safeObliterate: Disabling the watchdog timer", "safeObliterate");
      sub_10000D928();
    }
  }
  sub_10000B298(__s, v83);
  sub_10000489C(1, "%s: safeObliterate: Using container device name: %s", "safeObliterate", v83);
  sub_10000489C(1, "%s: safeObliterate: Obliterating the Data volume", "safeObliterate");
  if (sub_10000B3AC(v83, __s, v32, v17, &v76))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x20000);
    sub_10000489C(1, "%s: safeObliterate: Could not obliterate the Data volume", "safeObliterate");
    if (!v76)
    {
      sub_10000489C(1, "%s: safeObliterate: failed to wipe volume keys, failing safe obliteration");
      return 13;
    }
  }
  sub_10000489C(1, "%s: safeObliterate: Reformatting the Data volume in container %s", "safeObliterate", v83);
  if (sub_10000BB30(v83, 1, __s, "safeObliterate"))
    sub_10000489C(0, "%s: safeObliterate: Could not reformat the Data volume", "safeObliterate");
  if (v17)
  {
    sub_10000489C(1, "%s: safeObliterate: Reformatting the User volume in container %s", "safeObliterate", v83);
    if (sub_10000BB30(v83, 0, v78, "safeObliterate"))
      sub_10000489C(0, "%s: safeObliterate: Could not reformat the User volume", "safeObliterate");
  }
  if (!__s[0])
  {
    v33 = getfsfile(v74);
    if (v33)
    {
      __strlcpy_chk(__s, v33->fs_spec, 64, 64);
      sub_10000489C(1, "%s: safeObliterate: Using data volume device: %s", "safeObliterate", __s);
    }
    else
    {
      sub_10000489C(1, "%s: safeObliterate: Failed second getfsfile, this is really bad", "safeObliterate");
      v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x2000000000000);
    }
  }
  sub_10000489C(1, "%s: safeObliterate: Setting up Data volume content", "safeObliterate");
  v34 = sub_10000BDE0(0, 0);
  v35 = v34;
  if (v34)
  {
    sub_10000EE50((uint64_t)v34);
  }
  else
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x80000);
    sub_10000489C(1, "%s: safeObliterate: Failed to set up detault content on the new Data volume", "safeObliterate");
  }
  byte_1000288D8 = 1;
  sub_10000BF5C("/private/var/tmp");
  if (byte_1000288D8)
    v36 = "/private/var/tmp/alt_root/private/var";
  else
    v36 = "/private/var";
  v37 = mkpath_np(v36, 0x1EDu);
  if (v37)
  {
    v38 = v37;
    if (v37 != 17)
    {
      v39 = strerror(v37);
      sub_10000489C(1, "%s: safeObliterate: Could not create the Data volume path %s, error %d (%s)", "safeObliterate", v36, v38, v39);
    }
  }
  sub_10000489C(1, "%s: safeObliterate: Remounting the Data volume %s at %s", "safeObliterate", __s, v36);
  if (sub_10000C054(__s, v36))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x100000);
    sub_10000489C(1, "%s: safeObliterate: Could not remount the Data volume", "safeObliterate");
  }
  if (v17)
  {
    sub_10000489C(1, "%s: safeObliterate: Setting up UM/AKS for the new Data volume", "safeObliterate");
    if (sub_10000C110(__s, v36, v78, 0))
    {
      v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x100000000000000);
      sub_10000489C(1, "%s: safeObliterate: Failed to set up the data and user volumes in multiuser mode", "safeObliterate");
    }
  }
  sub_10000489C(1, "%s: safeObliterate: Re-creating overprovisioning file", "safeObliterate");
  if (sub_10000C94C(v40))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x200000);
    sub_10000489C(1, "%s: safeObliterate: Could not re-create overprovisioning file", "safeObliterate");
  }
  sub_10000489C(1, "%s: safeObliterate: Creating mobile path", "safeObliterate");
  sub_10000F81C();
  if (byte_1000288D8)
    v41 = "/private/var/tmp/alt_root/private/var/mobile";
  else
    v41 = "/private/var/mobile";
  if (!v17)
  {
    sub_10000489C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
    sub_10000E894((uint64_t)v35);
    if (v0)
      goto LABEL_101;
LABEL_110:
    if (!sub_10000D384(&v75))
      goto LABEL_156;
    memset(&v77, 0, 144);
    sub_1000049E0(2, "/.obliteration_preserved", "/");
    sub_10000489C(1, "%s: Examining '%s' for files to recover", "copy_preserved_files_from_storage", byte_1000287D0);
    if (stat(byte_1000287D0, (stat *)&v77) || (v77.f_iosize & 0xF000) != 0x4000)
    {
      sub_10000489C(1, "%s: No files to recover");
    }
    else
    {
      if (byte_1000288D8)
        v50 = "/private/var/tmp/alt_root/private/var";
      else
        v50 = "/private/var";
      if (copyfile(byte_1000287D0, v50, 0, 0x800Fu))
      {
        v51 = __error();
        strerror(*v51);
        sub_10000489C(1, "%s: Could not copy files from temporary location '%s', error: %s");
      }
      else
      {
        sub_10000489C(1, "%s: Successfully copied files from the temporary location '%s'");
      }
    }
    sub_10000D528();
    goto LABEL_126;
  }
  sub_10000489C(1, "%s: safeObliterate: Remounting the User volume %s at %s", "safeObliterate", v78, v41);
  if (sub_10000C054(v78, v41))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x400000000000000);
    sub_10000489C(1, "%s: safeObliterate: Could not remount the User volume", "safeObliterate");
  }
  sub_10000489C(1, "%s: safeObliterate: Rebuilding the Data volume", "safeObliterate");
  sub_10000E894((uint64_t)v35);
  sub_10000489C(1, "%s: safeObliterate: Populating USER volume with mastered content", "safeObliterate");
  if (sub_10000D14C((uint64_t)v41))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x800000000000000);
    sub_10000489C(0, "%s: safeObliterate: Failed to create and set up a user volume for multiuser mode", "safeObliterate");
  }
  if (!v0)
    goto LABEL_110;
LABEL_101:
  if (!byte_1000288D9 || (sub_10000EB68("epdm_skip_preboot_cleanup=1") & 1) == 0)
  {
    sub_10000489C(1, "%s: safeObliterate: Cleaning Preboot volume", "safeObliterate");
    v42 = objc_alloc_init((Class)NSMutableDictionary);
    if (v42)
    {
      v43 = v42;
      sub_10000E3AC();
      v44 = open("/private/preboot/active", 0);
      if (v44 == -1)
      {
        v52 = __error();
        v53 = strerror(*v52);
        sub_10000489C(1, "%s: Failed to open /private/preboot/active: %s", "epdm_fixup_preboot", v53);
        __error();
      }
      else
      {
        v45 = v44;
        v46 = lseek(v44, 0, 2);
        if (v46 != -1
          && (v47 = v46, (v48 = (char *)malloc_type_malloc(v46 + 1, 0xF312D8FDuLL)) != 0)
          && (v49 = v48, v47 == pread(v45, v48, v47, 0)))
        {
          v49[v47] = 0;
          sub_10000489C(1, "%s: Found '/private/preboot/active' to point to '%s'", "epdm_fixup_preboot", v49);
          objc_msgSend(v43, "setObject:forKey:", CFSTR("remove"), off_1000286A0);
          objc_msgSend(v43, "setObject:forKey:", CFSTR("keep"), CFSTR("DarwinInitCache"));
          objc_msgSend(v43, "setObject:forKey:", CFSTR("keep"), CFSTR("active"));
          objc_msgSend(v43, "setObject:forKey:", CFSTR("removeExcept /apticket.der/ /com.apple.factorydata/"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/System/Library/Caches"), v49));
          objc_msgSend(v43, "setObject:forKey:", CFSTR("removeExcept /kernelcache/"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/System/Library/Caches/com.apple.kernelcaches"), v49));
          objc_msgSend(v43, "setObject:forKey:", CFSTR("removeExcept /devicetree.img4/ /root_hash.img4/ /sep-firmware.img4/"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/usr/standalone/firmware"), v49));
          objc_msgSend(v43, "setObject:forKey:", CFSTR("removeExcept /(ANE|GFX|PMP|SIO|StaticTrustCache|iBootData|Ap,(ANE1|RestoreTMU|SecurePageTableMonitor|TrustedExecutionMonitor))\\.img4/"), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/usr/standalone/firmware/FUD"), v49));
          -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", CFSTR("/private/preboot"), v43);

          free(v49);
        }
        else
        {
          sub_10000489C(1, "%s: Failed to read /private/preboot/active");
        }
      }
    }
    else
    {
      sub_10000489C(1, "%s: Could not create exceptions dictionary");
    }
  }
  if ((sub_10000D384(&v75) & 1) != 0)
  {
    if (!byte_1000288D9 || (sub_10000EB68("epdm_skip_hwvolume_cleanup=1") & 1) == 0)
    {
      sub_10000489C(1, "%s: safeObliterate: Cleaning Hardware volume", "safeObliterate");
      v54 = MGCopyAnswer(CFSTR("UniqueDeviceID"), 0);
      v55 = MGCopyAnswer(CFSTR("r5pA2qLgR86BQKwgMjPWzg"), 0);
      v56 = objc_alloc_init((Class)NSMutableDictionary);
      if (v56)
      {
        v57 = v56;
        objc_msgSend(v56, "setObject:forKey:", CFSTR("remove"), off_1000286A0);
        objc_msgSend(v57, "setObject:forKey:", CFSTR("keep"), CFSTR("MobileActivation"));
        objc_msgSend(v57, "setObject:forKey:", CFSTR("removeExcept /apticket.der/"), CFSTR("FactoryData/System/Library/Caches"));
        v58 = &stru_100025BD8;
        if (v54)
          v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/(appv|(|mansta-)fCfg|pcrt|scrt|seal)-%@/ "), &stru_100025BD8, v54);
        if (v55)
        {
          v59 = objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v55), "componentsSeparatedByString:", CFSTR("0x")), "objectAtIndex:", 1), "uppercaseString");
          v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/(|mansta-)lcrt-%@/ "), v58, objc_msgSend(v59, "substringToIndex:", (char *)objc_msgSend(v59, "length") - 1));
        }
        sub_1000049E0(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", "trustobject-current");
        v60 = open(byte_1000287D0, 0);
        if (v60 == -1)
        {
          v69 = __error();
          v70 = strerror(*v69);
          sub_10000489C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_1000287D0, v70);
        }
        else
        {
          v61 = v60;
          v62 = sub_10000EC68(v60);
          close(v61);
          if (v62)
          {
            snprintf((char *)&v77, 0x4DuLL, "trustobject-%s", v62);
            sub_1000049E0(2, "/FactoryData/System/Library/Caches/com.apple.factorydata/", (const char *)&v77);
            v63 = open(byte_1000287D0, 0);
            if (v63 == -1)
            {
              v71 = __error();
              v72 = strerror(*v71);
              sub_10000489C(1, "%s: Failed to open '%s': %s", "epdm_fixup_hardware_volume", byte_1000287D0, v72);
            }
            else
            {
              v64 = v63;
              v65 = sub_10000EC68(v63);
              close(v64);
              if (v65)
              {
                if (!strncmp(v62, v65, 0x40uLL))
                {
                  sub_10000489C(1, "%s: Verified 'trustobject-current' and '%s' have the same content SHA-256 which also matches the name", "epdm_fixup_hardware_volume", (const char *)&v77);
                  v58 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/trustobject-current/ /%s/"), v58, &v77);
                }
                free(v65);
              }
            }
            free(v62);
          }
        }
        if (v58)
          objc_msgSend(v57, "setObject:forKey:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("removeExcept %@"), v58), CFSTR("FactoryData/System/Library/Caches/com.apple.factorydata"));
        -[DiskSupport traverseFolderAndRemoveItems:exceptions:](+[DiskSupport sharedInstance](DiskSupport, "sharedInstance"), "traverseFolderAndRemoveItems:exceptions:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", aPrivateVarHard), v57);

      }
      else
      {
        sub_10000489C(1, "%s: Could not create exceptions dictionary", "epdm_fixup_hardware_volume");
      }
      goto LABEL_154;
    }
LABEL_126:
    sub_10000489C(1, "%s: safeObliterate: Clearing activation files", "safeObliterate");
    sub_10000D638();
LABEL_154:
    if (v75)
      sub_10000D714();
  }
LABEL_156:
  if (v17)
  {
    sub_10000489C(1, "%s: safeObliterate: Unmounting the User volume post obliteration", "safeObliterate");
    if (sub_10000B1E8(1, 1))
    {
      v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x200000000000000);
      sub_10000489C(1, "%s: safeObliterate: Failed to unmount the User volume post obliteration", "safeObliterate");
    }
  }
  sub_10000489C(1, "%s: safeObliterate: Unmounting the Data volume post obliteration", "safeObliterate");
  if (sub_10000B1E8(0, 1))
  {
    v26[27].ivars = (__objc2_ivar_list *)((unint64_t)v26[27].ivars | 0x40000000000000);
    sub_10000489C(1, "%s: safeObliterate: Failed to unmount the Data volume post obliteration", "safeObliterate");
  }
  sub_10000489C(1, "%s: safeObliterate: Unmounting the tmpfs volume post obliteration", "safeObliterate");
  sub_10000B1E8(3, 1);
  sub_10000489C(1, "%s: safeObliterate: Clearing NVRAM Key", "safeObliterate");
  sub_10000489C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
  sub_1000113A8(CFSTR("oblit-inprogress"));
  if (v35)
    sub_10000F110(v35);
  if (!v76)
    return 13;
  sub_10000489C(0, "%s: safeObliterate: all done, returning ECANCELED", "safeObliterate");
  return 89;
}

size_t sub_10000635C(char *a1, char *a2, unsigned int a3)
{
  size_t v3;
  const __CFString *v6;
  const __CFString *v7;
  CFTypeID v8;
  CFTypeID v9;
  CFIndex Length;
  const UInt8 *BytePtr;

  v3 = 0;
  if (a1 && a2)
  {
    v6 = sub_100010804(a1, 0);
    if (v6)
    {
      v7 = v6;
      v8 = CFGetTypeID(v6);
      if (v8 == CFStringGetTypeID() && CFStringGetCString(v7, a2, a3, 0x8000100u))
      {
        v3 = strnlen(a2, a3) + 1;
      }
      else
      {
        v9 = CFGetTypeID(v7);
        if (v9 == CFDataGetTypeID())
        {
          Length = CFDataGetLength((CFDataRef)v7);
          if (Length + 1 < (unint64_t)a3)
            v3 = Length + 1;
          else
            v3 = a3;
          BytePtr = CFDataGetBytePtr((CFDataRef)v7);
          memcpy(a2, BytePtr, v3);
          a2[v3 - 1] = 0;
        }
        else
        {
          v3 = 0;
        }
      }
      CFRelease(v7);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

void sub_100006454(const __CFString *a1, unsigned __int8 a2, int a3)
{
  size_t v6;
  size_t i;
  int v8;
  int v10;
  CFIndex v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  CFAbsoluteTime Current;
  size_t v18;
  size_t v19;
  time_t v20;
  char __str[8];
  uint64_t v22;
  char v23[16];
  UInt8 buffer[1024];

  if (CFStringGetCString(a1, (char *)buffer, 1024, 0x8000100u) == 1)
  {
    v6 = strlen((const char *)buffer);
    if (v6 > 0x3FF)
      goto LABEL_22;
    for (i = v6; i; --i)
    {
      v8 = v23[i + 15];
      if (v8 != 13 && v8 != 10)
        break;
    }
    v10 = snprintf((char *)&buffer[i], 1024 - i, " [gF: 0x%016llX]", qword_1000287C8);
    v11 = i + v10 >= 0x400 ? 1024 : i + v10;
    v12 = CFStringCreateWithBytes(kCFAllocatorDefault, buffer, v11, 0x8000100u, 0);
    if (v12)
    {
      v13 = v12;
      if (a3)
        v14 = CFSTR("obliteration");
      else
        v14 = 0;
      sub_100008E54(v12, v14, a2);
      CFRelease(v13);
    }
    else
    {
LABEL_22:
      if (a3)
        v16 = CFSTR("obliteration");
      else
        v16 = 0;
      sub_100008E54(a1, v16, a2);
    }
    if ((byte_100028918 & 1) != 0)
    {
      *(_QWORD *)__str = 0;
      v22 = 0;
      memset(v23, 0, 11);
      Current = CFAbsoluteTimeGetCurrent();
      snprintf(__str, 0x1BuLL, "%fs ", Current - *(double *)&qword_100028910);
    }
    else
    {
      v20 = time(0);
      ctime_r(&v20, __str);
      strcpy(&v23[8], ": ");
    }
    if (dword_100028698 != -1)
    {
      v18 = strlen(__str);
      write(dword_100028698, __str, v18);
      v19 = strlen((const char *)buffer);
      write(dword_100028698, buffer, v19);
      write(dword_100028698, "\n", 1uLL);
    }
  }
  else
  {
    if (a3)
      v15 = CFSTR("obliteration");
    else
      v15 = 0;
    sub_100008E54(a1, v15, a2);
  }
}

void sub_10000668C(id a1, OS_xpc_object *a2, __CFDictionary *a3)
{
  __objc2_class_ro *v5;
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  const void *v9;
  int v10;
  CFTypeID TypeID;
  const void *Value;
  const void *v13;
  const void *v14;
  const void *v15;
  char *v16;
  char v17;
  int v18;
  const void *v19;
  const void *v20;
  const __CFString *v21;
  const __CFString *v22;
  CFTypeID v23;
  const __CFArray *v24;
  const __CFArray *v25;
  CFTypeID v26;
  CFIndex i;
  const __CFString *ValueAtIndex;
  CFTypeID v29;
  char *v30;
  char *v31;
  int v32;
  int v33;
  const __CFNumber *v34;
  const void *v35;
  const void *v36;
  CFTypeID v37;
  const char *v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  int v41;
  CFTypeID v42;
  BOOL v43;
  int *v44;
  char *v45;
  const __CFString *v46;
  int v47;
  const __CFString *v48;
  const __CFString *v49;
  CFStringRef v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const char *CStringPtr;
  const char *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  CFStringRef v60;
  CFStringRef v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  CFStringRef v65;
  CFStringRef v66;
  Block_layout *v67;
  __CFString **v68;
  const __CFString *v69;
  const __CFString *v70;
  int v71;
  signed int valuePtr;
  audit_token_t v73;
  CFErrorRef error;
  audit_token_t token;
  statfs v76;

  valuePtr = 0;
  byte_1000286A8 = 1;
  v5 = &DiskSupport__metaData;
  byte_100028908 = 0;
  byte_100028909 = 0;
  byte_1000287C0 = 0;
  byte_10002890A = 0;
  qword_100028910 = 0;
  byte_100028918 = 0;
  qword_1000287C8 = 0;
  qword_1000288E0 = 0;
  byte_1000288D9 = sub_1000100B8();
  byte_100028919 = 0;
  byte_1000288F1 = 0;
  qword_100028920 = 0;
  byte_1000288F0 = 0;
  byte_1000287C1 = sub_100011594();
  if (dword_1000288D0)
    sub_10000489C(1, "%s: Error: sepService is supposed to be NULL at handle_message(), 0x%x instead", "handle_message", dword_1000288D0);
  memset(&v73, 0, sizeof(v73));
  memset(&v76, 0, 512);
  xpc_connection_get_audit_token(a2, &v73);
  token = v73;
  error = 0;
  v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v6)
  {
    sub_10000489C(1, "%s: Could not create the security task from the audit token", "verify_obliteration_client");
LABEL_8:
    sub_10000489C(1, "%s: Could not verify the obliteration client");
    goto LABEL_128;
  }
  v7 = v6;
  v8 = SecTaskCopyValueForEntitlement(v6, CFSTR("allow-obliterate-device"), &error);
  if (!v8)
  {
    sub_10000489C(1, "%s: Could not extract the value for the entitlement", "verify_obliteration_client");
    v10 = -1;
    goto LABEL_17;
  }
  v9 = v8;
  if (error)
  {
    sub_10000489C(1, "%s: There was an error retrieving the entitlement value");
LABEL_15:
    v10 = -1;
    goto LABEL_16;
  }
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v9))
  {
    sub_10000489C(1, "%s: The entitlement value is not a BOOLean");
    goto LABEL_15;
  }
  if (!CFEqual(v9, kCFBooleanTrue))
  {
    sub_10000489C(1, "%s: The client does not have the obliteration entitlement");
    goto LABEL_15;
  }
  v10 = 0;
LABEL_16:
  CFRelease(v9);
LABEL_17:
  v5 = &DiskSupport__metaData;
  if (error)
    CFRelease(error);
  CFRelease(v7);
  if (v10)
    goto LABEL_8;
  Value = CFDictionaryGetValue(a3, CFSTR("DisplayProgressBar"));
  if (Value)
  {
    byte_1000286A8 = CFEqual(Value, kCFBooleanTrue) != 0;
    sub_10000489C(1, "%s: Option: set gShowProgress to %s");
  }
  else
  {
    sub_10000489C(1, "%s: Caller did not specify preference for progress bar. Defaulting to %d.");
  }
  v13 = CFDictionaryGetValue(a3, CFSTR("IgnoreMissingPath"));
  if (v13)
  {
    if (CFEqual(v13, kCFBooleanTrue))
    {
      sub_10000489C(1, "%s: Option: set gPathMissOkay = true", "handle_message");
      byte_1000287C0 = 1;
    }
    else
    {
      sub_10000489C(1, "%s: Option: set gPathMissOkay = false", "handle_message");
      byte_1000287C0 = 0;
    }
  }
  else
  {
    sub_10000489C(1, "%s: Caller did not specify preference for missing Exclusion path. Defaulting to %d", "handle_message", byte_1000287C0);
  }
  v14 = CFDictionaryGetValue(a3, CFSTR("SkipDataObliteration"));
  if (v14)
    CFEqual(v14, kCFBooleanTrue);
  v15 = CFDictionaryGetValue(a3, CFSTR("ObliterationManagedDeviceWipe"));
  if (v15 && CFEqual(v15, kCFBooleanTrue))
  {
    v16 = "%s: Managed Device Wipe Chosen";
    v17 = 1;
  }
  else
  {
    v17 = 0;
    v16 = "%s: Not a Managed Device Wipe Request";
  }
  byte_1000288F1 = v17;
  v18 = 1;
  sub_10000489C(1, v16, "handle_message");
  v19 = CFDictionaryGetValue(a3, CFSTR("ObliterationBrickIncludesFirmware"));
  if (v19 && CFEqual(v19, kCFBooleanFalse))
  {
    sub_10000489C(1, "%s: Not including firmware in brick operation", "handle_message");
    v18 = 0;
  }
  v20 = CFDictionaryGetValue(a3, CFSTR("IgnoreInternalBuildSetting"));
  if (v20 && CFEqual(v20, kCFBooleanTrue))
  {
    byte_1000288D9 = 0;
    sub_10000489C(1, "%s: Ignoring internal build - assuming customer build", "handle_message");
  }
  v21 = (const __CFString *)CFDictionaryGetValue(a3, CFSTR("ObliterationMessage"));
  v22 = v21;
  if (v21)
  {
    v23 = CFGetTypeID(v21);
    if (v23 == CFStringGetTypeID())
    {
      if (CFStringGetCString(v22, (char *)&token, 512, 0x8000100u))
        sub_10000489C(1, "%s: Option: reason is '%s'", "handle_message", (const char *)&token);
      v5 = &DiskSupport__metaData;
    }
  }
  v24 = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("ExclusionPaths"));
  if (v24)
  {
    v25 = v24;
    v26 = CFGetTypeID(v24);
    if (v26 != CFArrayGetTypeID())
    {
      sub_10000489C(1, "%s: Exclusions paths isn't an array", "handle_message");
      goto LABEL_125;
    }
    if (CFArrayGetCount(v25))
    {
      v71 = v18;
      if (CFArrayGetCount(v25) >= 1)
      {
        for (i = 0; i < CFArrayGetCount(v25); ++i)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v25, i);
          v29 = CFGetTypeID(ValueAtIndex);
          if (v29 != CFStringGetTypeID())
          {
            sub_10000489C(1, "%s: Exclusions path isn't a string");
            goto LABEL_124;
          }
          if (!CFStringGetCString(ValueAtIndex, (char *)&token, 1025, 0x8000100u))
          {
            sub_10000489C(1, "%s: Could not get string");
            goto LABEL_124;
          }
          v30 = realpath_DARWIN_EXTSN((const char *)&token, 0);
          if (v30)
          {
            v31 = v30;
            sub_10000489C(1, "%s: realpath(%s) returned %s, path checks out okay.", "handle_message", (const char *)&token, v30);
            free(v31);
          }
          else
          {
            v32 = byte_1000287C0;
            v33 = *__error();
            if (!v32)
            {
              sub_10000489C(1, "%s: realpath(%s) returned %d, path doesn't appear to exist.");
LABEL_124:
              v5 = &DiskSupport__metaData;
LABEL_125:
              if (CFEqual(0, CFSTR("ObliterationTypeMarkStart"))
                || CFEqual(0, CFSTR("ObliterationTypeMarkerCreate")))
              {
                LOBYTE(v5[32].ivar_base_size) = 1;
              }
              goto LABEL_128;
            }
            sub_10000489C(1, "%s: realpath(%s) returned %d, path doesn't appear to exist, skipping as path miss is okay.", "handle_message", (const char *)&token, v33);
          }
        }
      }
      qword_100028920 = (uint64_t)CFRetain(v25);
      v5 = &DiskSupport__metaData;
      v18 = v71;
    }
  }
  v34 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("ObliterationSimulatedFailure"));
  token.val[0] = 0;
  if (v34)
  {
    CFNumberGetValue(v34, kCFNumberIntType, &token);
    LODWORD(v34) = token.val[0];
  }
  sub_1000045C0((int)v34, 0);
  v35 = CFDictionaryGetValue(a3, CFSTR("ObliterationType"));
  if (!v35)
  {
    sub_10000489C(1, "%s: No obliteration type specified in the options");
    goto LABEL_128;
  }
  v36 = v35;
  v37 = CFGetTypeID(v35);
  if (v37 != CFStringGetTypeID())
  {
    sub_10000489C(1, "%s: Obliteration type is not CFString");
    goto LABEL_128;
  }
  if (byte_10002890A == 1)
  {
    sub_10000489C(1, "%s: Obliteration is already in progress, cannot handle another one, returning", "handle_message");
    LOBYTE(v5[32].ivar_base_size) = 1;
    goto LABEL_128;
  }
  sub_10000489C(1, "%s: Obliteration started, sending ack to the caller...", "handle_message");
  sub_10000489C(1, "%s: Examining the Data volume", "handle_message");
  bzero(&v76, 0x878uLL);
  if (byte_1000288D8)
    v38 = "/private/var/tmp/alt_root/private/var";
  else
    v38 = "/private/var";
  if (statfs(v38, &v76) == -1)
  {
    v44 = __error();
    v45 = strerror(*v44);
    sub_10000489C(1, "%s: Could not statfs %s: %s", "handle_message", v38, v45);
    LOBYTE(v5[32].ivar_base_size) = 1;
    goto LABEL_128;
  }
  if (CFDictionaryContainsKey(a3, CFSTR("ObliterationDelayAfterReply")))
  {
    v39 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("ObliterationDelayAfterReply"));
    if (v39 && (v40 = v39, v41 = v18, v42 = CFGetTypeID(v39), v43 = v42 == CFNumberGetTypeID(), v18 = v41, v43))
    {
      CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
      if (valuePtr < 0)
      {
        sub_10000489C(1, "%s: Incorrect Delay After Reply time of %d, ignoring");
      }
      else
      {
        sub_10000489C(1, "%s: SENDING REPLY BACK TO CALLER and waiting for %d secs", "handle_message", valuePtr);
        sub_100008DD8((uint64_t)a2, CFSTR("Complete"));
        if (valuePtr >= 1)
          sleep(valuePtr);
      }
    }
    else
    {
      sub_10000489C(1, "%s: Invalid Delay After Reply time, ignoring..");
    }
  }
  else
  {
    sub_10000489C(1, "%s: Continuing Obliteration Without Reply");
  }
  if (byte_1000288D9)
    v46 = (const __CFString *)CFDictionaryGetValue(a3, CFSTR("ObliterationCallingProcessName"));
  else
    v46 = 0;
  v47 = v18;
  v48 = CFSTR("N/A");
  if (v46)
    v49 = v46;
  else
    v49 = CFSTR("N/A");
  if (v22)
    v48 = v22;
  v50 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Caller: %@, Type: %@, Reason: %@"), v49, v36, v48);
  if (v50)
  {
    v51 = v50;
    v52 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v50);
    if (v52)
    {
      v53 = v52;
      CStringPtr = CFStringGetCStringPtr(v52, 0x8000100u);
      v55 = "<error getting string>";
      if (CStringPtr)
        v55 = CStringPtr;
      sub_10000489C(1, "%s: Logging obliteration reason: \"%s\"", "handle_message", v55);
      CFRelease(v53);
    }
    else
    {
      sub_10000489C(1, "%s: Logging obliteration reason: \"%s\"", "handle_message", "<error getting string>");
    }
    sub_100008E54(v51, CFSTR("oblit-begins"), 1u);
    if (CFEqual(v36, CFSTR("ObliterateDataPartition")))
    {
      byte_10002890A = 1;
      sub_10000489C(1, "%s: Data Obliteration is in progress...", "handle_message");
      if (!sub_10000904C((uint64_t)&v76, 1, 0, 0))
      {
        v56 = CFSTR("EACS Done");
LABEL_99:
        sub_10000A028(v56, v46, v22);
        sub_1000113A8(CFSTR("orig-oblit"));
        sub_1000113A8(CFSTR("oblit-begins"));
        v57 = CFSTR("oblit-failure");
LABEL_100:
        sub_1000113A8(v57);
LABEL_121:
        CFRelease(v51);
        goto LABEL_128;
      }
      v58 = sub_100010988("orig-oblit", 0);
      if (!v58)
      {
        v59 = sub_100010988("obliteration", 0);
        if (!v59)
        {
LABEL_105:
          v60 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("EACS failed with [gF: 0x%016llX] Attempt: 1"), qword_1000287C8);
          if (v60)
          {
            v61 = v60;
            sub_100010F20("oblit-failure", v60);
            CFRelease(v61);
          }
          sub_10000489C(0, "%s: Data Obliteration failed with error %d");
LABEL_120:
          v5 = &DiskSupport__metaData;
          goto LABEL_121;
        }
        v58 = v59;
        sub_100010F20("orig-oblit", v59);
      }
      CFRelease(v58);
      goto LABEL_105;
    }
    if (!CFEqual(v36, CFSTR("ObliterationTypeWipeAndBrick")))
    {
      if (CFEqual(v36, CFSTR("ObliterationTypeBrickOnly")))
      {
        sub_10000489C(1, "%s: Bricking but preserving user data...", "handle_message");
        sub_10000A0DC(v47);
        v62 = CFSTR("BrickOnly Done");
      }
      else
      {
        if (CFEqual(v36, CFSTR("ObliterationTypeMarkStart")))
        {
          sub_10000489C(1, "%s: Marking Obliteration Begin in NVRAM...", "handle_message");
          sub_10000AAE0();
          sub_100007544();
          byte_100028909 = 1;
          sub_10000489C(1, "%s: Marked in NVRAM, returning ...", "handle_message");
          goto LABEL_121;
        }
        if (CFEqual(v36, CFSTR("ObliterationTypeSafeWipe")))
        {
          sub_100007544();
          byte_10002890A = 1;
          byte_100028919 = 1;
          sub_10000489C(1, "%s: SAFE WIPE Type Obliteration is in progress...", "handle_message");
          sub_10000489C(1, "%s: Terminating Daemons for safe wipe ...", "handle_message");
          sub_10000B030();
          sub_10000489C(1, "%s: Terminating Daemons Complete, safe wipe started ...", "handle_message");
          sub_100004FB8();
          v62 = CFSTR("SafeWipe Done");
        }
        else
        {
          if (!CFEqual(v36, CFSTR("ObliterationTypeMarkerCreate")))
          {
            v69 = CFStringCreateWithFormat(0, 0, CFSTR("Unknown obliteration type '%@' specified"), v36);
            v70 = v69;
            if (!v69)
              v69 = CFSTR("Unknown obliteration type specified");
            sub_10000A028(v69, v46, v22);
            if (v70)
              CFRelease(v70);
            sub_1000113A8(CFSTR("oblit-begins"));
            LOBYTE(v5[32].ivar_base_size) = 1;
            goto LABEL_121;
          }
          sub_10000489C(1, "%s: Creating Marker files ...", "handle_message");
          byte_100028909 = 1;
          v62 = CFSTR("MarkerCreate Done");
        }
      }
      sub_10000A028(v62, v46, v22);
      v57 = CFSTR("oblit-begins");
      goto LABEL_100;
    }
    byte_10002890A = 1;
    sub_10000489C(1, "%s: Brick Obliteration is in progress...", "handle_message");
    if (!sub_10000904C((uint64_t)&v76, 0, 1, v47))
    {
      v56 = CFSTR("WipeAndBrick Done");
      goto LABEL_99;
    }
    v63 = sub_100010988("orig-oblit", 0);
    if (!v63)
    {
      v64 = sub_100010988("obliteration", 0);
      if (!v64)
      {
LABEL_117:
        v65 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("Brick failed with [gF: 0x%016llX] Attempt: 1"), qword_1000287C8);
        if (v65)
        {
          v66 = v65;
          sub_100010F20("oblit-failure", v65);
          CFRelease(v66);
        }
        sub_10000489C(0, "%s: Brick failed with error %d");
        goto LABEL_120;
      }
      v63 = v64;
      sub_100010F20("orig-oblit", v64);
    }
    CFRelease(v63);
    goto LABEL_117;
  }
LABEL_128:
  if (sub_100010158())
  {
    sub_1000049E0(0, 0, "/log/obliteration.log");
    sub_10001057C((uint64_t)byte_1000287D0, (uint64_t)sub_1000101BC);
    sub_100010394();
  }
  if ((v5[32].ivar_base_size & 1) != 0)
  {
    v67 = &stru_100024BD8;
    v68 = &off_100024E10;
  }
  else
  {
    if (byte_100028909 != 1)
    {
      v67 = &stru_100024C18;
      goto LABEL_136;
    }
    v67 = &stru_100024BF8;
    v68 = &off_100024E08;
  }
  sub_100008DD8((uint64_t)a2, *v68);
LABEL_136:
  xpc_connection_send_barrier(a2, v67);
}

uint64_t sub_100007544()
{
  uint64_t v0;
  int v1;
  const __CFString *v2;
  io_registry_entry_t v3;
  io_registry_entry_t v4;
  CFStringRef v5;
  CFStringRef v6;
  kern_return_t v7;
  mach_port_t mainPort;
  char __str[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  sub_10000489C(1, "%s: Marking NVRAM Obliteration in Progress", "setOblitNVRAMkey");
  if (!sub_100004E90(0, 0))
  {
    mainPort = 0;
    *(_OWORD *)__str = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v1 = 64;
    if (!byte_1000288F1)
      v1 = 0;
    snprintf(__str, 0x40uLL, "%d", v1);
    v2 = CFStringCreateWithCString(0, "oblit-inprogress", 0x8000100u);
    if (IOMainPort(bootstrap_port, &mainPort))
    {
      sub_10000489C(1, "%s: Could not get main port\n");
    }
    else
    {
      v3 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
      if (v3)
      {
        v4 = v3;
        v5 = CFStringCreateWithCString(0, __str, 0x8000100u);
        if (v5)
        {
          v6 = v5;
          v7 = IORegistryEntrySetCFProperty(v4, v2, v5);
          if (v7)
          {
            sub_10000489C(1, "%s: Could not save value:%08x\n", "setOblitNVRAMkey", v7);
            v0 = 0xFFFFFFFFLL;
          }
          else
          {
            sub_100010BE4(v4, "0");
            v0 = 0;
          }
          sub_10000489C(1, "%s: NVRamSyncNow", "setOblitNVRAMkey");
          CFRelease(v6);
        }
        else
        {
          sub_10000489C(1, "%s: Could not create string for value\n", "setOblitNVRAMkey");
          v0 = 0xFFFFFFFFLL;
        }
        IOObjectRelease(v4);
        goto LABEL_17;
      }
      sub_10000489C(1, "%s: Could not get options entry from the device tree\n");
    }
    v0 = 0xFFFFFFFFLL;
LABEL_17:
    CFRelease(v2);
    return v0;
  }
  sub_10000489C(1, "%s: Already marked the start of progress, returning", "setOblitNVRAMkey");
  return 0;
}

const char *sub_100007748(const char *result)
{
  const char *v1;
  int v2;
  int v3;
  char *i;
  statfs *v5;

  if (result)
  {
    v1 = result;
    v5 = 0;
    v2 = getmntinfo(&v5, 2);
    if (v2)
    {
      v3 = v2;
      for (i = v5->f_mntfromname; strcmp(v1, i); i += 2168)
      {
        v5 = (statfs *)(i + 1056);
        if (!--v3)
          return 0;
      }
      return i - 1024;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000077C8(const char *a1)
{
  int *v3;
  char *v4;

  if (unmount(a1, 0x80000) != -1)
    return 0;
  v3 = __error();
  v4 = strerror(*v3);
  sub_10000489C(1, "%s: Could not unmount %s: %s", "unmountVolume", a1, v4);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000078A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = objc_opt_class(*(_QWORD *)(a1 + 32));
  result = objc_opt_new(v1);
  qword_1000288F8 = result;
  return result;
}

void sub_100008DD8(uint64_t a1, const void *a2)
{
  __CFDictionary *v4;

  v4 = sub_100010044();
  CFDictionarySetValue(v4, CFSTR("IPCStatus"), a2);
  if ((MOXPCTransportSendMessageOnConnection(a1, v4) & 1) == 0)
    sub_10000489C(1, "%s: Failed to not send response to the client", "send_reply_response_cf");
  CFRelease(v4);
}

void sub_100008E54(const __CFString *a1, const __CFString *a2, unsigned __int8 a3)
{
  __CFDateFormatter *v6;
  CFStringRef v7;
  CFStringRef v8;
  CFAbsoluteTime Current;
  CFStringRef StringWithAbsoluteTime;
  CFStringRef v11;
  char *v12;
  io_registry_entry_t v13;
  io_object_t v14;
  uint64_t v15;
  _QWORD *v16;
  mach_port_t mainPort;

  if (!a1)
    return;
  if (!byte_1000288D9 || (byte_1000288F0 & 1) != 0)
  {
    v6 = 0;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = CFDateFormatterCreate(kCFAllocatorDefault, 0, kCFDateFormatterShortStyle, kCFDateFormatterLongStyle);
  if (!v6)
    goto LABEL_5;
  Current = CFAbsoluteTimeGetCurrent();
  StringWithAbsoluteTime = CFDateFormatterCreateStringWithAbsoluteTime(kCFAllocatorDefault, v6, Current);
  v7 = StringWithAbsoluteTime;
  if (StringWithAbsoluteTime)
  {
    v8 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@: %@"), StringWithAbsoluteTime, a1);
    if (!a2)
      goto LABEL_21;
    goto LABEL_11;
  }
LABEL_6:
  v8 = 0;
  if (!a2)
    goto LABEL_21;
LABEL_11:
  if (((v8 != 0) & a3) != 0)
    v11 = v8;
  else
    v11 = a1;
  mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort))
  {
    v12 = "%s: Could not get main port";
  }
  else
  {
    v13 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
    if (v13)
    {
      v14 = v13;
      if (IORegistryEntrySetCFProperty(v13, a2, v11))
        sub_10000489C(0, "%s: Could not set obliterate setting");
      IOObjectRelease(v14);
      goto LABEL_21;
    }
    v12 = "%s: Could not get options entry from the device tree";
  }
  sub_10000489C(0, v12);
LABEL_21:
  if (sub_100010158())
  {
    if (v8)
      v15 = (uint64_t)v8;
    else
      v15 = (uint64_t)a1;
    v16 = sub_100010270(v15, (uint64_t)&_CFRetain, (uint64_t)&_CFRelease);
    if (v16)
    {
      sub_100010474((uint64_t)v16);
    }
    else if (dword_100028698 != -1)
    {
      write(dword_100028698, "Failed to create in memory logging data\n", 0x29uLL);
    }
  }
  if (v6)
    CFRelease(v6);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
}

uint64_t sub_10000904C(uint64_t a1, int a2, int a3, int a4)
{
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const __CFString *Value;
  CFComparisonResult v11;
  uint64_t v12;
  _BOOL4 v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  int *v15;
  int v16;
  char v17;
  uint64_t v18;
  const void *v19;
  const __CFDictionary *v20;
  io_service_t MatchingService;
  CFDictionaryRef v22;
  int v23;
  _DWORD *v24;
  int *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  const __CFArray *v29;
  CFIndex v30;
  const __CFString *ValueAtIndex;
  char *v32;
  int v33;
  int v34;
  char *v35;
  uint64_t v36;
  char *v37;
  const char *v38;
  dispatch_semaphore_t v39;
  NSObject *v40;
  dispatch_time_t v41;
  CFDictionaryRef cf;
  io_registry_entry_t entry;
  int v45;
  int v46;
  __int16 v47;
  IOPMAssertionID AssertionID;
  void *v49;
  int valuePtr;
  void *keys;
  CFTypeRef v52;
  _OWORD v53[4];
  _OWORD v54[4];
  char v55[64];
  CFTypeRef values[129];

  AssertionID = 0;
  v47 = 0;
  memset(v55, 0, sizeof(v55));
  memset(v54, 0, sizeof(v54));
  memset(v53, 0, sizeof(v53));
  sub_100007544();
  sub_10000AAE0();
  v8 = (const __CFDictionary *)MKBUserTypeDeviceMode(0, 0);
  if (!v8
    || (v9 = v8,
        Value = (const __CFString *)CFDictionaryGetValue(v8, kMKBDeviceModeKey),
        v11 = CFStringCompare(Value, kMKBDeviceModeSharedIPad, 0),
        CFRelease(v9),
        v11))
  {
    v12 = 0xFFFFFFFFLL;
    v13 = sub_10000B170();
    if (v13)
      sub_10000489C(1, "%s: Device is in multiuser mode", "obliterate");
    if (IOPMAssertionCreateWithName(CFSTR("NoIdleSleepAssertion"), 0xFFu, CFSTR("Mobile Obliteratation"), &AssertionID))
    {
      sub_10000489C(1, "%s: Cannot prevent idle sleep", "obliterate");
      if (!a3)
        goto LABEL_146;
    }
    if (dword_100028698 != -1)
      ramrod_add_log_fd(dword_100028698);
    ramrod_log_set_buffermsgs(0);
    ramrod_set_syslog_flush_msgs(0);
    ramrod_display_set_showprogress(byte_1000286A8);
    sub_10000489C(1, "%s: Posting the data eschaton notification", "obliterate");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    if (DarwinNotifyCenter)
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.mobile.data_eschaton"), 0, 0, 1u);
    else
      sub_10000489C(1, "%s: Could not get the darwin notification center", "post_notification");
    sub_10000489C(1, "%s: Taking the device off the USB bus", "obliterate");
    values[0] = 0;
    v16 = IOUSBDeviceControllerCreate(0, values);
    if (v16)
    {
      if (v16 == -536870160)
      {
        v17 = 1;
        sub_10000489C(1, "%s: The USB device controller could not be found. It's cool.", "getoff_bus");
LABEL_21:
        if (values[0])
          CFRelease(values[0]);
        if ((v17 & 1) == 0)
        {
          qword_1000287C8 |= 1uLL;
          sub_10000489C(0, "%s: Could not get off the USB bus", "obliterate");
          if (!a3)
            goto LABEL_146;
        }
        if (byte_1000287C1)
        {
          sub_10000489C(1, "%s: Skipping the disable of watchdog timer", "obliterate");
        }
        else
        {
          sub_10000489C(1, "%s: Disabling the watchdog timer", "obliterate");
          sub_10000D7CC(CFSTR("com.apple.watchdogd"));
          if (sub_10000D928())
          {
            qword_1000287C8 |= 2uLL;
            sub_10000489C(0, "%s: Could not disable the watchdog timer", "obliterate");
            if (!a3)
              goto LABEL_146;
          }
        }
        v45 = a4;
        sub_10000489C(1, "%s: Grabbing framebuffer", "obliterate");
        v18 = MGCopyAnswer(CFSTR("DeviceClass"), 0);
        if (!v18)
        {
          sub_10000489C(1, "%s: Could not get device class.", "grab_framebuffer");
LABEL_37:
          qword_1000287C8 |= 4uLL;
          sub_10000489C(0, "%s: Could not open framebuffer", "obliterate");
          if (!a3)
            goto LABEL_146;
LABEL_53:
          sub_10000489C(1, "%s: Begin background progress bar UI thread", "obliterate");
          v24 = malloc_type_malloc(0xCuLL, 0x10000403E1C8BA9uLL);
          sub_10000489C(1, "%s: Faking from %3f to %3f expecting %d sec", "begin_fakery", 0.0, 1.0, 15);
          if (v24)
          {
            *(_QWORD *)v24 = 0x3F80000000000000;
            v24[2] = 15;
            byte_100028928 = 0;
            if (pthread_create((pthread_t *)&qword_100028930, 0, (void *(__cdecl *)(void *))sub_10000DA4C, v24))
            {
              v25 = __error();
              v26 = strerror(*v25);
              sub_10000489C(1, "%s: could not spwawn thread: %s", "begin_fakery", v26);
            }
          }
          sub_10000489C(1, "%s: Killing some daemons", "obliterate");
          qword_100028910 = CFAbsoluteTimeGetCurrent();
          if (*(double *)&qword_100028910 <= 0.0)
            sub_10000489C(1, "%s: Failed to get daemon unload timestamp", "obliterate");
          else
            byte_100028918 = 1;
          if (sub_10000B030())
          {
            qword_1000287C8 |= 0x10uLL;
            sub_10000489C(0, "%s: Could not kill daemons", "obliterate");
            if (!a3)
              goto LABEL_145;
          }
          if (a2)
          {
            sub_10000489C(1, "%s: Capturing the Data volume state", "obliterate");
            v27 = sub_10000EEB0();
            if (v27)
            {
              v28 = v27;
              if (sub_10000F188((uint64_t)v27, "/private/var/mobile/Library/Preferences/.GlobalPreferences.plist", "/System/Library/Obliteration/GlobalPreferences.plist"))
              {
                qword_1000287C8 |= 0x1000000uLL;
                sub_10000489C(1, "%s: Could not add user preferences file.", "capture_data_volume");
              }
              sub_10000FB6C((uint64_t)v28);
              v29 = (const __CFArray *)qword_100028920;
              if (qword_100028920)
              {
                v30 = 0;
                while (1)
                {
                  if (v30 >= CFArrayGetCount(v29))
                    goto LABEL_71;
                  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028920, v30);
                  if (!CFStringGetCString(ValueAtIndex, (char *)values, 1025, 0x8000100u))
                    break;
                  if (sub_10000F188((uint64_t)v28, (char *)values, 0))
                  {
                    sub_10000489C(1, "%s: Could not add item '%s' to scrapper");
                    goto LABEL_82;
                  }
                  ++v30;
                  v29 = (const __CFArray *)qword_100028920;
                  if (!qword_100028920)
                    goto LABEL_71;
                }
                sub_10000489C(1, "%s: Could not extract C-string for path.");
LABEL_82:
                free(v28);
                goto LABEL_83;
              }
LABEL_71:
              sub_10000489C(1, "%s: Successfully captured Data volume info", "capture_data_volume");
              sub_10000EE50((uint64_t)v28);
LABEL_85:
              sub_10000489C(1, "%s: Warming Launchd pages", "obliterate");
              v46 = 0;
              if (sysctlbyname("kern.memorystatus_do_fastwake_warmup_all", 0, 0, &v46, 4uLL))
              {
                qword_1000287C8 |= 0x80uLL;
                __error();
                sub_10000489C(1, "%s: memorystatus_do_fastwake_warmup_all failed with error: %d");
              }
              else
              {
                sub_10000489C(1, "%s: memorystatus_do_fastwake_warmup_all success");
              }
              if (v13)
              {
                sub_10000489C(1, "%s: Unmounting the User volume", "obliterate");
                if (sub_10000B1E8(1, 1))
                {
                  qword_1000287C8 |= 0x4000000000000000uLL;
                  sub_10000489C(0, "%s: Could not unmount the User volume", "obliterate");
                  if (!a3)
                    goto LABEL_143;
                }
              }
              sub_10000489C(1, "%s: Unmounting the Data volume", "obliterate");
              if (sub_10000B1E8(0, 1))
              {
                qword_1000287C8 |= 0x100uLL;
                sub_10000489C(0, "%s: Could not unmount the Data volume", "obliterate");
                if (!a3)
                  goto LABEL_143;
              }
              sub_10000B298((const char *)(a1 + 1112), v55);
              sub_10000489C(1, "%s: Using container device name: %s", "obliterate", v55);
              sub_10000489C(1, "%s: Obliterating the Data volume", "obliterate");
              if (sub_10000B3AC(v55, (const char *)(a1 + 1112), a2, v13, (_BYTE *)&v47 + 1))
              {
                qword_1000287C8 |= 0x200uLL;
                sub_10000489C(0, "%s: Could not obliterate the Data volume", "obliterate");
                if ((a3 & 1) == 0)
                  goto LABEL_143;
              }
              else if (!a3)
              {
                goto LABEL_98;
              }
              sub_10000A0DC(v45);
LABEL_98:
              if (!a2)
              {
LABEL_139:
                if (sub_10000D384(&v47))
                {
                  sub_1000049E0(2, "/.obliteration_preserved", 0);
                  sub_10000D528();
                  sub_10000489C(1, "%s: Clearing activation files", "obliterate");
                  sub_10000D638();
                  if ((_BYTE)v47)
                    sub_10000D714();
                }
                sub_10000D790();
                v12 = 0;
                goto LABEL_143;
              }
              sub_10000489C(1, "%s: Reformatting the Data volume in container %s", "obliterate", v55);
              if (!sub_10000BB30(v55, 1, (char *)v54, 0)
                || (sub_10000489C(0, "%s: Could not reformat the Data volume", "obliterate"), a3))
              {
                if (!v13
                  || !sub_10000BB30(v55, 0, (char *)v53, 0)
                  || (sub_10000489C(0, "%s: Could not reformat the User volume", "obliterate"), a3))
                {
                  v28 = sub_10000BDE0(v28, 1);
                  if (!v28)
                  {
                    qword_1000287C8 |= 0x800uLL;
                    sub_10000489C(0, "%s: Could not setup the content for Data volume", "obliterate");
                    if (!a3)
                    {
LABEL_145:
                      v39 = dispatch_semaphore_create(0);
                      v40 = dispatch_queue_create("com.apple.obliterator.threadJoin", 0);
                      values[0] = _NSConcreteStackBlock;
                      values[1] = (CFTypeRef)3221225472;
                      values[2] = sub_10000E340;
                      values[3] = &unk_100024B98;
                      values[4] = v39;
                      dispatch_async(v40, values);
                      v41 = dispatch_time(0, 5000000000);
                      dispatch_semaphore_wait(v39, v41);
                      usleep(0x3D090u);
LABEL_146:
                      sub_10000489C(0, "%s:  ******** Obliteration done ******** ", "obliterate");
                      return v12;
                    }
                  }
                  byte_1000288D8 = 1;
                  if (!sub_10000BF5C("/private/var/tmp") || a3)
                  {
                    v32 = byte_1000288D8 ? "/private/var/tmp/alt_root/private/var" : "/private/var";
                    v33 = mkpath_np(v32, 0x1EDu);
                    if (!v33
                      || (v34 = v33, v33 == 17)
                      || (qword_1000287C8 |= 0x1000uLL,
                          v35 = strerror(v33),
                          sub_10000489C(1, "%s: Could not create the Data volume path %s, error %d (%s)", "obliterate", v32, v34, v35), a3))
                    {
                      sub_10000489C(1, "%s: Remounting the Data volume %s at %s", "obliterate", (const char *)v54, v32);
                      if (!sub_10000C054((char *)v54, v32)
                        || (qword_1000287C8 |= 0x1000uLL,
                            sub_10000489C(0, "%s: Could not remount the Data volume", "obliterate"),
                            a3))
                      {
                        if (!v13
                          || (sub_10000489C(1, "%s: Setting up UM/AKS for the new Data volume", "obliterate"),
                              !sub_10000C110((const char *)v54, v32, (const char *)v53, 1))
                          || (qword_1000287C8 |= 0x20000000000000uLL,
                              sub_10000489C(0, "%s: Failed to set up the data volume in multiuser mode", "obliterate"),
                              a3))
                        {
                          sub_10000489C(1, "%s: Re-creating overprovisioning file", "obliterate");
                          if (sub_10000C94C(v36))
                          {
                            qword_1000287C8 |= 0x2000uLL;
                            sub_10000489C(0, "%s: Could not re-create overprovisioning file", "obliterate");
                          }
                          sub_10000489C(1, "%s: Creating mobile path", "obliterate");
                          sub_10000F81C();
                          if (byte_1000288D8)
                            v37 = "/private/var/tmp/alt_root/private/var/mobile";
                          else
                            v37 = "/private/var/mobile";
                          if (v13)
                          {
                            sub_10000489C(1, "%s: Remounting the User volume %s at %s", "obliterate", (const char *)v53, v37);
                            if (sub_10000C054((char *)v53, v37))
                            {
                              qword_1000287C8 |= 0x10000000000000uLL;
                              sub_10000489C(0, "%s: Could not remount the User volume", "obliterate");
                              if (!a3)
                                goto LABEL_143;
                            }
                            v38 = "Shared ";
                          }
                          else
                          {
                            v38 = "";
                          }
                          sub_10000489C(1, "%s: Rebuilding the %sData volume", "obliterate", v38);
                          if (!sub_10000CE28((uint64_t)v28)
                            || (qword_1000287C8 |= 0x4000uLL,
                                sub_10000489C(0, "%s: Could not rebuild the Data volume", "obliterate"),
                                a3))
                          {
                            if (!v13)
                            {
LABEL_136:
                              sub_10000489C(1, "%s: Unmounting the Data volume post obliteration", "obliterate");
                              if (sub_10000B1E8(0, 0))
                              {
                                qword_1000287C8 |= 0x40000000000000uLL;
                                sub_10000489C(1, "%s: Failed to unmount the Data volume post obliteration", "obliterate");
                              }
                              sub_10000489C(1, "%s: Unmounting the tmpfs volume post obliteration", "obliterate");
                              sub_10000B1E8(3, 0);
                              goto LABEL_139;
                            }
                            sub_10000489C(1, "%s: Populating USER volume with mastered content", "obliterate");
                            if (!sub_10000D14C((uint64_t)v37)
                              || (qword_1000287C8 |= 0x80000000000000uLL,
                                  sub_10000489C(0, "%s: Failed to create and set up a user volume for multiuser mode", "obliterate"), a3))
                            {
                              sub_10000489C(1, "%s: Unmounting the User volume post obliteration", "obliterate");
                              if (sub_10000B1E8(1, 0))
                              {
                                qword_1000287C8 |= 0x200000000000000uLL;
                                sub_10000489C(1, "%s: Failed to unmount the User volume post obliteration", "obliterate");
                              }
                              goto LABEL_136;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_143:
              if (v28)
                sub_10000F110(v28);
              goto LABEL_145;
            }
            sub_10000489C(1, "%s: Could not create FS scraper.", "capture_data_volume");
LABEL_83:
            qword_1000287C8 |= 0x40uLL;
            sub_10000489C(0, "%s: Could not capture the Data volume state", "obliterate");
            if (!a3)
              goto LABEL_145;
          }
          v28 = 0;
          goto LABEL_85;
        }
        v19 = (const void *)v18;
        sub_10000489C(1, "%s: Unloading Springboard", "grab_framebuffer");
        sub_10000D7CC(CFSTR("com.apple.SpringBoard"));
        sub_10000489C(1, "%s: Unloaded Springboard", "grab_framebuffer");
        sub_10000489C(1, "%s: Unloading backbaordd", "grab_framebuffer");
        sub_10000D7CC(CFSTR("com.apple.backboardd"));
        sub_10000489C(1, "%s: Unloaded backboardd", "grab_framebuffer");
        if (CFEqual(v19, CFSTR("RealityDevice")) == 1)
        {
          sub_10000489C(1, "%s: Unloading wakeboardd", "grab_framebuffer");
          sub_10000D7CC(CFSTR("com.apple.wakeboardd"));
          sub_10000489C(1, "%s: Unloaded wakeboardd", "grab_framebuffer");
        }
        if (sub_10000EE28(0.0))
        {
          sub_10000489C(1, "%s: Could not initialize progress bar to zero.");
LABEL_32:
          CFRelease(v19);
          goto LABEL_37;
        }
        if (CFEqual(v19, CFSTR("AppleTV")) || CFEqual(v19, CFSTR("RealityDevice")) | byte_1000287C1)
        {
          sub_10000489C(1, "%s: Will not attempt to disable backlight for this platform", "grab_framebuffer");
          goto LABEL_52;
        }
        sub_10000489C(1, "%s: Turning off backlight", "grab_framebuffer");
        keys = CFSTR("backlight-control");
        v52 = 0;
        values[0] = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&kCFBooleanTrue, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!values[0])
          goto LABEL_73;
        keys = CFSTR("IOPropertyMatch");
        v20 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v20)
          goto LABEL_73;
        MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v20);
        if (!MatchingService)
          goto LABEL_73;
        entry = MatchingService;
        valuePtr = 0x8000;
        v52 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
        if (!v52)
        {
          v23 = -1;
          goto LABEL_76;
        }
        v49 = CFSTR("brightness");
        v22 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&v49, &v52, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v22)
        {
          cf = v22;
          if (IORegistryEntrySetCFProperties(entry, v22))
            v23 = -1;
          else
            v23 = 0;
          CFRelease(cf);
        }
        else
        {
LABEL_73:
          v23 = -1;
        }
        if (v52)
          CFRelease(v52);
LABEL_76:
        if (values[0])
          CFRelease(values[0]);
        if (v23)
        {
          sub_10000489C(1, "%s: Could not turn on backlight.");
          goto LABEL_32;
        }
LABEL_52:
        CFRelease(v19);
        goto LABEL_53;
      }
      sub_10000489C(1, "%s: Could not create controller %08x");
    }
    else
    {
      v17 = 1;
      if (!IOUSBDeviceControllerForceOffBus(values[0], 1))
        goto LABEL_21;
      sub_10000489C(1, "%s: Could not force controller off USB %08x");
    }
    v17 = 0;
    goto LABEL_21;
  }
  sub_10000489C(1, "%s: Shared Mode device, reverting to Safeboot wipe.", "obliterate");
  *__error() = 0;
  reboot(0);
  v15 = __error();
  sub_10000489C(1, "%s: Ooops... shouldn't be here - reboot() must have failed - errno %d!", "obliterate", *v15);
  byte_100028908 = 1;
  if (*__error())
    return *__error();
  else
    return 35;
}

void sub_10000A028(const __CFString *a1, const __CFString *a2, const __CFString *a3)
{
  time_t v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v6 = time(0);
  v7 = CFSTR("N/A");
  if (a2)
    v8 = a2;
  else
    v8 = CFSTR("N/A");
  if (a3)
    v7 = a3;
  v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%@ @%ld, Caller: %@, Reason: %@"), a1, v6, v8, v7);
  if (v9)
  {
    v10 = v9;
    sub_100006454(v9, 0, 1);
    CFRelease(v10);
  }
  else
  {
    sub_100006454(a1, 0, 1);
  }
}

uint64_t sub_10000A0DC(int a1)
{
  __CFString *v2;
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  off_t v7;
  size_t v8;
  char *v9;
  int *v10;
  char *v11;
  char *v12;
  char v13;
  int v14;
  size_t gl_pathc;
  uint64_t v16;
  const char *v17;
  int *v18;
  const __CFDictionary *v19;
  io_service_t MatchingService;
  io_service_t v21;
  char *v23;
  int v24;
  const __CFDictionary *v25;
  io_service_t v26;
  const __CFDictionary *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int *v32;
  char *v33;
  const __CFDictionary *v34;
  io_service_t v35;
  io_registry_entry_t v36;
  const __CFString *CFProperty;
  int v38;
  int v39;
  int v40;
  int v41;
  int *v42;
  char *v43;
  int *v44;
  int v45;
  int v46;
  int v47;
  int *v48;
  char *v49;
  int *v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  glob_t v56;

  sub_10000489C(1, "%s: Deleting kernelcaches", "brick");
  sub_10000E3AC();
  v54 = 0;
  v2 = (__CFString *)sub_100010804("boot-path", 0);
  v3 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    if (v2)
    {
      v4 = (const char *)-[__CFString UTF8String](v2, "UTF8String");
      goto LABEL_6;
    }
  }
  else
  {
    sub_10000489C(1, "%s: boot-path was not a string!?", "kernelcachePathFromVars");
    v2 = 0;
  }
  v4 = "/System/Library/Caches/com.apple.kernelcaches/kernelcache";
LABEL_6:
  memset(&v56, 0, sizeof(v56));
  v5 = open("/private/preboot/active", 0);
  if (v5 != -1)
  {
    v6 = v5;
    v7 = lseek(v5, 0, 2);
    if (v7 == -1)
    {
      v9 = 0;
    }
    else
    {
      v8 = v7;
      v9 = (char *)malloc_type_malloc(v7 + 1, 0x7F0B2A44uLL);
      if (v9 && v8 == pread(v6, v9, v8, 0))
      {
        v9[v8] = 0;
        if (asprintf(&v54, "/private/preboot/%s%s", v9, v4) < 0)
        {
          sub_10000489C(1, "%s: asprintf failed", "kernelcachePathFromVars");
          v54 = 0;
        }
        goto LABEL_17;
      }
    }
    sub_10000489C(1, "%s: Failed to read /private/preboot/active", "kernelcachePathFromVars");
LABEL_17:
    close(v6);
    goto LABEL_18;
  }
  if (*__error() != 2)
  {
    v10 = __error();
    v11 = strerror(*v10);
    sub_10000489C(1, "%s: Failed to open /private/preboot/active: %s", "kernelcachePathFromVars", v11);
  }
  v9 = 0;
LABEL_18:

  free(v9);
  v12 = v54;
  if (v54)
    v13 = sub_10000E42C(v54) == 0;
  else
    v13 = 0;
  v14 = glob_b("/private/preboot/*/System/Library/Caches/com.apple.kernelcaches/kernelcache*", 32, &stru_100024C68, &v56);
  if (v14 != -3 && v14)
  {
    qword_1000287C8 |= 0x40000000uLL;
    v18 = __error();
    strerror(*v18);
    sub_10000489C(1, "%s: glob_b failed: ret:%d err:%s");
  }
  else
  {
    gl_pathc = v56.gl_pathc;
    if (v56.gl_pathc)
    {
      v16 = 0;
      do
      {
        v17 = v56.gl_pathv[v16];
        if (!v12 || strcmp(v12, v56.gl_pathv[v16]))
          v13 |= sub_10000E42C(v17) == 0;
        ++v16;
      }
      while (gl_pathc != v16);
      globfree(&v56);
      if ((v13 & 1) == 0)
      {
        qword_1000287C8 |= 0x80000000uLL;
        sub_10000489C(1, "%s: Failed to delete any kernelcaches...");
      }
    }
    else
    {
      globfree(&v56);
    }
  }
  free(v12);
  if (!a1)
  {
    sub_10000489C(1, "%s: Setting auto-boot to false", "brick");
    return sub_100010A58("auto-boot", "false");
  }
  sub_10000489C(1, "%s: Deleting firmware", "brick");
  v19 = IOServiceMatching("AppleImage3NORAccess");
  if (v19)
  {
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v19);
    if (MatchingService)
    {
      v21 = MatchingService;
      sub_10000489C(1, "%s: Found device with AppleImage3NORAccess; Erasing Firmware", "deleteFirmware");
      LODWORD(v56.gl_pathc) = 0;
      if (IOServiceOpen(v21, mach_task_self_, 0, (io_connect_t *)&v56))
      {
        qword_1000287C8 |= 0x20000000000uLL;
        sub_10000489C(1, "%s: Could not open the service");
      }
      else
      {
        sub_10000489C(1, "%s: Erasing all Image3 firmware images", "delete_Image3_Firmware");
        if (IOConnectCallStructMethod(v56.gl_pathc, 2u, 0, 0, 0, 0))
        {
          qword_1000287C8 |= 0x40000000000uLL;
          sub_10000489C(1, "%s: IOConnectCallStructMethod(%d) failed: 0x%x\n");
        }
      }
      if (LODWORD(v56.gl_pathc))
        IOServiceClose(v56.gl_pathc);
      IOObjectRelease(v21);
      goto LABEL_51;
    }
    sub_10000489C(1, "%s: Could not get the AppleImage3NORAccess service; Trying ASPStorage", "deleteFirmware");
    v25 = IOServiceMatching("ASPStorage");
    if (v25)
    {
      v26 = IOServiceGetMatchingService(kIOMainPortDefault, v25);
      if (v26)
      {
        IOObjectRelease(v26);
        sub_10000489C(1, "%s: Found device with ASPStorage; Erasing Firmware", "deleteFirmware");
        v55 = 1;
        v53 = 0;
        if (sub_10000E524((char *)&v56))
        {
          qword_1000287C8 |= 0x4000000000000uLL;
LABEL_45:
          sub_10000489C(1, "%s: Failed to find firmware partition, err=%d");
LABEL_51:
          v23 = "%s: Firmware is gone?!";
          v24 = 0;
          goto LABEL_52;
        }
        v28 = open((const char *)&v56, 1);
        if (v28 == -1)
        {
          qword_1000287C8 |= 0x800000000uLL;
          v44 = __error();
          strerror(*v44);
          goto LABEL_72;
        }
        v29 = v28;
        sub_10000489C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v56);
        v54 = (char *)&v52;
        v52 = 0;
        v53 = sub_10000E788(v29, (const char *)&v56);
        v30 = ioctl(v29, 0x8010641FuLL, &v54);
        if (v30)
        {
          v31 = v30;
          qword_1000287C8 |= 0x1000000000uLL;
          v32 = __error();
          v33 = strerror(*v32);
          sub_10000489C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v31, v33);
        }
        sub_10000489C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v56);
        close(v29);
        memset(&v56, 0, 64);
        v34 = IOServiceNameMatching("Apple LLB Media");
        v35 = IOServiceGetMatchingService(kIOMainPortDefault, v34);
        if (v35)
        {
          v36 = v35;
          if (IOObjectConformsTo(v35, "IOMedia"))
          {
            CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v36, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
            IOObjectRelease(v36);
            if (CFProperty)
            {
              __strlcpy_chk(&v56, "/dev/", 64, 64);
              if (!CFStringGetCString(CFProperty, (char *)&v56.gl_pathc + 5, 59, 0x8000100u))
              {
                CFRelease(CFProperty);
                sub_10000489C(1, "%s: Failed to get LLB device name");
                goto LABEL_51;
              }
              sub_10000489C(1, "%s: Found LLB device: %s", "delete_ASP_Firmware", (const char *)&v56);
              CFRelease(CFProperty);
              v38 = open((const char *)&v56, 1);
              if (v38 != -1)
              {
                v39 = v38;
                sub_10000489C(1, "%s: Opened Device '%s': ", "delete_ASP_Firmware", (const char *)&v56);
                v54 = (char *)&v52;
                LODWORD(v55) = 1;
                v52 = 0;
                v53 = sub_10000E788(v39, (const char *)&v56);
                v40 = ioctl(v39, 0x8010641FuLL, &v54);
                if (v40)
                {
                  v41 = v40;
                  qword_1000287C8 |= 0x4000000000uLL;
                  v42 = __error();
                  v43 = strerror(*v42);
                  sub_10000489C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_ASP_Firmware", v41, v43);
                }
                sub_10000489C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_ASP_Firmware", (const char *)&v56);
LABEL_77:
                close(v39);
                goto LABEL_51;
              }
              qword_1000287C8 |= 0x2000000000uLL;
              v51 = __error();
              strerror(*v51);
              goto LABEL_72;
            }
          }
          else
          {
            IOObjectRelease(v36);
          }
        }
        else
        {
          sub_10000489C(1, "%s: Failed to find llb object %s", "delete_ASP_Firmware", "Apple LLB Media");
        }
        sub_10000489C(1, "%s: Failed to find LLB device");
        goto LABEL_51;
      }
      sub_10000489C(1, "%s: Could not get the ASPStorage service; Trying NVMe", "deleteFirmware");
      v27 = IOServiceMatching("AppleEmbeddedNVMeController");
      if (v27)
      {
        if (IOServiceGetMatchingService(kIOMainPortDefault, v27))
        {
          v55 = 1;
          v53 = 0;
          if (sub_10000E524((char *)&v56))
          {
            qword_1000287C8 |= (unint64_t)&_mh_execute_header;
            goto LABEL_45;
          }
          v45 = open((const char *)&v56, 1);
          if (v45 != -1)
          {
            v39 = v45;
            sub_10000489C(1, "%s: Opened Device '%s': ", "delete_NVMe_Firmware", (const char *)&v56);
            v54 = (char *)&v52;
            v52 = 0;
            v53 = sub_10000E788(v39, (const char *)&v56);
            v46 = ioctl(v39, 0x8010641FuLL, &v54);
            if (v46)
            {
              v47 = v46;
              qword_1000287C8 |= 0x10000000000uLL;
              v48 = __error();
              v49 = strerror(*v48);
              sub_10000489C(1, "%s: ioctl: %d DKIOCUNMAP failed: %s\n", "delete_NVMe_Firmware", v47, v49);
            }
            sub_10000489C(1, "%s: Completed DKIOCUNMAP on '%s': ", "delete_NVMe_Firmware", (const char *)&v56);
            goto LABEL_77;
          }
          qword_1000287C8 |= 0x8000000000uLL;
          v50 = __error();
          strerror(*v50);
LABEL_72:
          sub_10000489C(1, "%s: Unable to open '%s': err='%s': ");
          goto LABEL_51;
        }
        qword_1000287C8 |= 0x200000000uLL;
        v23 = "%s: Could not get the NVMe service as well; giving up...";
      }
      else
      {
        v23 = "%s: Could not create NVMe matching dictionary";
      }
    }
    else
    {
      v23 = "%s: Could not create ASP Storage MATCHING Dictionary";
    }
  }
  else
  {
    qword_1000287C8 |= 0x400000000uLL;
    v23 = "%s: Could not create AppleImage3NORAccess MATCHING Dictionary";
  }
  v24 = 1;
LABEL_52:
  sub_10000489C(v24, v23, "deleteFirmware");
  sub_10000489C(1, "%s: Delete Any existing EAN", "brick");
  v56.gl_pathc = (size_t)"aptk";
  return sub_10000DB88((uint64_t)&v56, 1u);
}

void sub_10000AAE0()
{
  const char *v0;
  size_t v1;
  uint64_t v2;
  int v3;
  const __CFArray *v4;
  CFIndex v5;
  uint64_t v6;
  char *v7;
  size_t v8;
  const __CFString *ValueAtIndex;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  int *v22;
  int *v23;
  int *v24;
  int *v25;
  char *v26;
  uint64_t v27;
  char *v28;
  stat v29;
  char path[1025];

  if (byte_1000288D8)
    v0 = "/private/var/tmp/alt_root/private/var";
  else
    v0 = "/private/var";
  if (byte_1000288D8)
    v1 = 37;
  else
    v1 = 12;
  sub_1000049E0(2, "/.obliteration_preserved", 0);
  v2 = __strlcpy_chk(path, byte_1000287D0, 1024, 1025);
  v3 = mkpath_np(path, 0x1EDu);
  if (v3 && v3 != 17)
  {
    strerror(v3);
    sub_10000489C(1, "%s: Could not create folder '%s' for temporary storage, error: %s");
    return;
  }
  v4 = (const __CFArray *)qword_100028920;
  if (!qword_100028920)
    return;
  v5 = 0;
  v6 = 0;
  v7 = &path[v2];
  v8 = 1025 - (int)v2;
  while (v5 < CFArrayGetCount(v4))
  {
    memset(&v29, 0, sizeof(v29));
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100028920, v5);
    if (CFStringGetCString(ValueAtIndex, v7, v8, 0x8000100u))
    {
      v10 = realpath_DARWIN_EXTSN(v7, 0);
      if (v10)
      {
        v11 = v10;
        if (!strncmp(v10, v0, v1))
        {
          strlcpy(v7, &v11[v1], v8);
          v12 = strrchr(path, 47);
          if (!v12 || v12 == path)
          {
            sub_10000489C(1, "%s: Could not find path of '%s', skipping");
          }
          else
          {
            v13 = v12;
            *v12 = 0;
            v14 = mkpath_np(path, 0x1EDu);
            if (v14 && v14 != 17)
            {
              strerror(v14);
              sub_10000489C(1, "%s: Could not create folder '%s' in temporary location, error: %s");
            }
            else
            {
              *v13 = 47;
              v15 = strdup(v11);
              if (v15)
              {
                v16 = v15;
                v17 = strdup(path);
                if (v17)
                {
                  v18 = v17;
                  v27 = v6;
                  v28 = &v16[v1];
                  while (1)
                  {
                    v19 = strrchr(v16, 47);
                    v20 = v19;
                    if (!v19 || v19 == v28)
                      goto LABEL_42;
                    *v19 = 0;
                    v21 = strrchr(v18, 47);
                    if (!v21)
                    {
                      sub_10000489C(1, "%s: Failed to find next '/' in destination path %s, might be malformed", "copy_preserved_files_to_storage", v18);
                      goto LABEL_43;
                    }
                    v20 = v21;
                    *v21 = 0;
                    if (stat(v16, &v29))
                    {
                      v23 = __error();
                      strerror(*v23);
                      __error();
                      sub_10000489C(1, "%s: Failed to stat '%s' with error %s (%d)");
                      goto LABEL_42;
                    }
                    if (chown(v18, v29.st_uid, v29.st_gid))
                      break;
                    if (chmod(v18, v29.st_mode))
                    {
                      v22 = __error();
                      strerror(*v22);
                      __error();
                      sub_10000489C(1, "%s: Failed to change mode of '%s' with error %s (%d)");
                      goto LABEL_42;
                    }
                  }
                  v24 = __error();
                  strerror(*v24);
                  __error();
                  sub_10000489C(1, "%s: Failed to change ownership of '%s' with error %s (%d)");
LABEL_42:
                  if (v20 != v28)
                  {
LABEL_43:
                    sub_10000489C(1, "%s: Failed to set permissions on %s", "copy_preserved_files_to_storage", v11);
                    v6 = v27;
                    goto LABEL_47;
                  }
                  v6 = v27;
                  if (copyfile(v11, path, 0, 0xFu))
                  {
                    v25 = __error();
                    v26 = strerror(*v25);
                    sub_10000489C(1, "%s: Could not copy file '%s' to temporary location '%s', error: %s", "copy_preserved_files_to_storage", v11, path, v26);
                  }
                  else
                  {
                    sub_10000489C(1, "%s: Successfully copied file '%s' to temporary location '%s'", "copy_preserved_files_to_storage", v11, path);
                    v6 = (v27 + 1);
                  }
LABEL_47:
                  free(v11);
                  free(v16);
                  free(v18);
                }
                else
                {
                  sub_10000489C(1, "%s: Failed to copy destination path %s", "copy_preserved_files_to_storage", path);
                  free(v11);
                  free(v16);
                }
                goto LABEL_36;
              }
              sub_10000489C(1, "%s: Failed to copy source path %s");
            }
          }
        }
        else
        {
          sub_10000489C(1, "%s: File '%s' is not under the Data (or User) volume '%s', skipping", "copy_preserved_files_to_storage", v11, v0);
        }
        free(v11);
      }
      else
      {
        sub_10000489C(1, "%s: Could not find the real path of '%s', skipping");
      }
    }
    else
    {
      sub_10000489C(1, "%s: Could not extract C-string for path... skipping");
    }
LABEL_36:
    ++v5;
    v4 = (const __CFArray *)qword_100028920;
    if (!qword_100028920)
      break;
  }
  if ((int)v6 >= 1)
    sub_10000489C(1, "%s: Done copying files to temporary location, %d successfully copied");
}

uint64_t sub_10000B030()
{
  char *v0;
  uint64_t v1;
  int v2;
  char *v3;
  char *v4;
  time_t v6;

  v6 = time(0);
  v0 = ctime(&v6);
  sub_10000489C(1, "%s: Starting termination of Daemons:%s", "terminate_daemons", v0);
  v1 = reboot3(0x4000000000000000);
  if ((_DWORD)v1)
    v2 = *__error();
  else
    v2 = 0;
  if (dword_100028698 != -1)
  {
    close(dword_100028698);
    dword_100028698 = open("/dev/console", 9);
  }
  if ((_DWORD)v1)
  {
    v3 = strerror(v2);
    sub_10000489C(1, "%s: Reboot3: obliterate shutdown failed with error %s", "terminate_daemons", v3);
    v1 = 0xFFFFFFFFLL;
  }
  else
  {
    sub_10000489C(1, "%s: Reboot3: obliterate shutdown Completed", "terminate_daemons");
  }
  v6 = time(0);
  v4 = ctime(&v6);
  sub_10000489C(0, "%s: Termination of daemons completed at %s", "terminate_daemons", v4);
  return v1;
}

void sub_10000B138(id a1)
{
  usleep(0xF4240u);
}

void sub_10000B144(id a1)
{
  usleep(0xF4240u);
}

void sub_10000B150(id a1)
{
  usleep(0xF4240u);
  reboot3(0x8000000000000000);
}

BOOL sub_10000B170()
{
  io_registry_entry_t v0;
  io_object_t v1;
  CFTypeRef CFProperty;
  _BOOL8 v3;

  v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/filesystems");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = IORegistryEntryCreateCFProperty(v0, CFSTR("e-apfs"), kCFAllocatorDefault, 0);
  v3 = CFProperty != 0;
  if (CFProperty)
    CFRelease(CFProperty);
  IOObjectRelease(v1);
  return v3;
}

uint64_t sub_10000B1E8(int a1, int a2)
{
  const char *v4;
  const char *v5;
  int v6;
  uint64_t result;
  const char *v8;
  int *v9;
  char *v10;

  v4 = sub_1000047C8(a1);
  v5 = v4;
  if (a2)
    v6 = 0x80000;
  else
    v6 = 0;
  if (unmount(v4, v6) == -1)
  {
    if (a2)
      v8 = "force-";
    else
      v8 = "";
    v9 = __error();
    v10 = strerror(*v9);
    sub_10000489C(1, "%s: Could not %sunmount %s: %s", "unmount_volume", v8, v5, v10);
    return 0xFFFFFFFFLL;
  }
  else
  {
    result = 0;
    if (!a1)
      byte_1000288F0 = 1;
  }
  return result;
}

void sub_10000B298(const char *a1, char *a2)
{
  uint64_t v4;

  v4 = 0;
  if (sscanf(a1, "disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "disk%d");
  }
  else if (sscanf(a1, "/dev/disk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/disk%d");
  }
  else if (sscanf(a1, "/dev/rdisk%ds%d", (char *)&v4 + 4, &v4) == 2)
  {
    snprintf(a2, 0x40uLL, "/dev/rdisk%d");
  }
  else
  {
    sub_10000489C(1, "%s: Data volume path looks odd: %s, defaulting to %s\n", "get_container_from_volume", a1, "/dev/rdisk0s1");
    strcpy(a2, "/dev/rdisk0s1");
  }
}

uint64_t sub_10000B3AC(const char *a1, const char *a2, int a3, int a4, _BYTE *a5)
{
  double Current;
  int *v11;
  int *v12;
  __CFArray *Mutable;
  CFMutableArrayRef v14;
  __CFArray *v15;
  BOOL v16;
  _BYTE *v17;
  fstab *v18;
  fstab *v19;
  CFStringRef v20;
  const char *fs_spec;
  CFStringRef v22;
  int Count;
  __CFArray *v24;
  const __CFArray *v25;
  int v26;
  __CFArray *v27;
  CFIndex v28;
  uint64_t v29;
  const __CFString *ValueAtIndex;
  CFIndex v31;
  char v32;
  const __CFString *v33;
  int v34;
  CFIndex v35;
  uint64_t v36;
  int v37;
  const __CFString *v38;
  uint64_t v39;
  int v40;
  char *v41;
  uint64_t v42;
  CFAbsoluteTime v44;
  __CFArray *v45;
  _BYTE *v46;
  const char *v47;
  __int16 v48;
  char buffer[16];
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
  __int128 v62;
  __int128 v63;
  __int128 v64;

  Current = CFAbsoluteTimeGetCurrent();
  if ((sub_100004750(1, "obliterate_data_volume") & 1) != 0)
    return 0xFFFFFFFFLL;
  if (a3)
  {
    if (byte_100028919 == 1)
    {
      if (a4 && sub_10000B1E8(1, 1))
      {
        v11 = __error();
        sub_10000489C(1, "%s: SafeWipe: Could not unmount the User volume %s (error: %d)", "obliterate_data_volume", a2, *v11);
      }
      if (sub_10000B1E8(0, 1))
      {
        v12 = __error();
        sub_10000489C(1, "%s: SafeWipe: Could not unmount the Data volume %s (error: %d)", "obliterate_data_volume", a2, *v12);
      }
    }
    sub_10000489C(1, "%s: Calling APFSVolumeDelete", "obliterate_data_volume");
    if (APFSVolumeDelete(a2))
    {
      qword_1000287C8 |= 0x2000000uLL;
      sub_10000489C(1, "%s: Could not delete the Data volume %s (error: %d)");
    }
  }
  else
  {
    sub_10000489C(1, "%s: NoDelete requested, skipping deletion, just create+format");
  }
  if ((sub_100004750(2, "obliterate_data_volume") & 1) != 0)
    return 0xFFFFFFFFLL;
  sub_10000489C(1, "%s: Delete other non fstab APFS volumes if present", "obliterate_data_volume");
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v14 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v15 = v14;
  if (Mutable)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (v16)
  {
    sub_10000489C(1, "%s: Unable to create Mutable Arrays, bail");
LABEL_56:
    v25 = 0;
    goto LABEL_59;
  }
  sub_10000489C(1, "%s: Creating a list of fssepc nodes from fstab", "removeOtherAPFSVolumes");
  if (setfsent())
  {
    v45 = v15;
    v17 = a5;
    v18 = getfsent();
    if (v18)
    {
      v19 = v18;
      do
      {
        *(_WORD *)buffer = 0;
        v20 = CFStringCreateWithCString(kCFAllocatorDefault, v19->fs_spec, 0x8000100u);
        fs_spec = v19->fs_spec;
        if (v20)
        {
          v22 = v20;
          sub_10000489C(1, "%s: Adding fspec to the spec node array:%s", "removeOtherAPFSVolumes", fs_spec);
          CFArrayAppendValue(Mutable, v22);
          CFRelease(v22);
        }
        else
        {
          sub_10000489C(1, "%s: Failed to create CFStr for spec file:%s", "removeOtherAPFSVolumes", fs_spec);
        }
        if (APFSVolumeRole(v19->fs_spec, buffer, 0))
        {
          sub_10000489C(1, "%s: APFSVolumeRole for %s failed with %d");
        }
        else if (*(unsigned __int16 *)buffer == 320)
        {
          __strlcpy_chk(&byte_100028938, v19->fs_spec, 64, 64);
          __strlcpy_chk(aPrivateVarHard, v19->fs_file, 1024, 1024);
          sub_10000489C(1, "%s: Found Hardware volume device %s, default mount point '%s'");
        }
        v19 = getfsent();
      }
      while (v19);
    }
    endfsent();
    a5 = v17;
    v15 = v45;
  }
  Count = CFArrayGetCount(Mutable);
  if (!Count)
  {
    sub_10000489C(1, "%s: Unable to find any FSSpec nodes in fstab, bailing");
    goto LABEL_56;
  }
  sub_10000489C(1, "%s: Creating List of APFS volume Spec Nodes", "removeOtherAPFSVolumes");
  v24 = sub_10000DEC0();
  v25 = v24;
  if (!v24)
  {
    sub_10000489C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
    goto LABEL_59;
  }
  v26 = CFArrayGetCount(v24);
  if (!v26)
  {
    sub_10000489C(1, "%s: APFS Volume FSSpec nodes list empty , bailing");
LABEL_59:
    v37 = 0;
    if (!Mutable)
      goto LABEL_61;
    goto LABEL_60;
  }
  v27 = v15;
  v46 = a5;
  v47 = a1;
  if (v26 >= 1)
  {
    v28 = 0;
    v29 = v26;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v25, v28);
      if (Count < 1)
        goto LABEL_40;
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = (const __CFString *)CFArrayGetValueAtIndex(Mutable, v31);
        v32 |= CFStringFind(v33, ValueAtIndex, 0x40uLL).location != -1;
        ++v31;
      }
      while (Count != v31);
      if ((v32 & 1) == 0)
LABEL_40:
        CFArrayAppendValue(v27, ValueAtIndex);
      ++v28;
    }
    while (v28 != v29);
  }
  v15 = v27;
  v34 = CFArrayGetCount(v27);
  if (v34)
  {
    if (v34 >= 1)
    {
      v35 = 0;
      v36 = v34;
      v37 = 1;
      while (1)
      {
        v38 = (const __CFString *)CFArrayGetValueAtIndex(v27, v35);
        *(_OWORD *)buffer = 0u;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        v64 = 0u;
        CFStringGetCString(v38, buffer, 256, 0x8000100u);
        v48 = 0;
        v39 = APFSVolumeRole(buffer, &v48, 0);
        if (v48 == 4)
        {
          v41 = "%s: Skipping deletion of non fstab volume with role Recovery: %s";
        }
        else if (v48 != 704
               || (v40 = APFSOverProvModel(v39),
                   v41 = "%s: Skipping deletion of non fstab volume with role Overprovision: %s",
                   v40 != 2))
        {
          sub_10000489C(1, "%s: Trying to delete APFS volume: %s", "removeOtherAPFSVolumes", buffer);
          if (APFSVolumeDelete(buffer))
            sub_10000489C(1, "%s: Failed to delete volume: %s");
          else
            sub_10000489C(1, "%s: Successfully deleted volume: %s");
          goto LABEL_53;
        }
        sub_10000489C(1, v41, "removeOtherAPFSVolumes", buffer);
LABEL_53:
        if (v36 == ++v35)
          goto LABEL_85;
      }
    }
    v37 = 1;
  }
  else
  {
    v37 = 1;
    sub_10000489C(1, "%s: Found no extraneous APFS volumes to delete", "removeOtherAPFSVolumes");
  }
LABEL_85:
  a5 = v46;
  a1 = v47;
  if (Mutable)
LABEL_60:
    CFRelease(Mutable);
LABEL_61:
  if (v25)
    CFRelease(v25);
  if (v15)
    CFRelease(v15);
  if (v37)
  {
    sub_10000489C(1, "%s: Completed deletion of non fstab APFS volumes if present", "obliterate_data_volume");
  }
  else
  {
    sub_10000489C(1, "%s: Could not delete existing non fstab APFS volumes", "obliterate_data_volume");
    qword_1000287C8 |= 0x4000000uLL;
  }
  *a5 = 0;
  sub_10000489C(1, "%s: Calling APFSContainerWipeVolumeKeys for container %s", "obliterate_data_volume", a1);
  if (APFSContainerWipeVolumeKeys(a1))
  {
    qword_1000287C8 |= 0x8000000uLL;
    sub_10000489C(1, "%s: APFSContainerWipeVolumeKeys failed for container %s (error: %d)");
    return 0xFFFFFFFFLL;
  }
  if ((sub_100004750(3, "obliterate_data_volume") & 1) != 0)
    return 0xFFFFFFFFLL;
  if (byte_1000287C1)
  {
    sub_10000489C(1, "%s: Wiping xART on VM", "obliterate_data_volume");
    *(_OWORD *)buffer = *(_OWORD *)&off_100024C38;
    sub_10000DB88((uint64_t)buffer, 2u);
LABEL_75:
    sub_10000489C(1, "%s: Revoking D Key", "obliterate_data_volume");
    if (MKBDeviceObliterateClassDKey())
    {
      qword_1000287C8 |= 0x20000000uLL;
      v42 = 0xFFFFFFFFLL;
      sub_10000489C(1, "%s: Unable to obliterate class-d key: %d", "obliterate_data_volume", -1);
      return v42;
    }
    if ((sub_100004750(5, "obliterate_data_volume") & 1) == 0)
    {
      *a5 = 1;
      v44 = CFAbsoluteTimeGetCurrent();
      sub_10000489C(1, "%s: obliterate_data_volume() took %f seconds to complete with result %d", "obliterate_data_volume", v44 - Current, 0);
      return 0;
    }
    return 0xFFFFFFFFLL;
  }
  sub_10000489C(1, "%s: Telling SEP to obliterate gigalockers.", "obliterate_data_volume");
  if (!sub_1000110F0())
  {
    qword_1000287C8 |= 0x10000000uLL;
    sub_10000489C(1, "%s: Failed to obliterate gigalockers.");
    return 0xFFFFFFFFLL;
  }
  if ((sub_100004750(4, "obliterate_data_volume") & 1) == 0)
    goto LABEL_75;
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000BB30(char *a1, int a2, char *a3, const char *a4)
{
  const char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *ValueAtIndex;
  const __CFString *v14;
  const __CFString *v15;
  const char *CStringPtr;
  const char *v17;
  CFArrayRef theArray;
  char *__argv[10];

  __argv[0] = "/sbin/newfs_apfs";
  __argv[1] = "-A";
  if (a4)
    v7 = a4;
  else
    v7 = "reformat_volume";
  __argv[2] = "-P";
  __argv[3] = "-v";
  if (a2)
    v8 = "Data";
  else
    v8 = "User";
  __argv[4] = v8;
  __argv[5] = "-R";
  v9 = "u";
  if (a2)
    v9 = "d";
  __argv[6] = v9;
  __argv[7] = "-D";
  __argv[8] = a1;
  __argv[9] = 0;
  sub_10000489C(1, "%s: %s: Calling newfs_apfs for the %s volume on container %s", "reformat_volume", v7, v8, a1);
  if (sub_100010794((const char **)__argv, 0))
  {
    v10 = 0x40000;
    if (a2)
      v10 = 1024;
    qword_1000287C8 |= v10;
    sub_10000489C(1, "%s: %s: Could not newfs the Data volume: %d");
    return 0xFFFFFFFFLL;
  }
  sub_10000489C(1, "%s: %s: newfs_apfs for the %s volume completed OK, looking up new volume dev node", "reformat_volume", v7, v8);
  theArray = 0;
  if (a2)
    v11 = 64;
  else
    v11 = 2;
  if (APFSVolumeRoleFind(a1, v11, &theArray) || CFArrayGetCount(theArray) != 1)
  {
    if (theArray)
    {
      v14 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), theArray);
      if (v14)
      {
        v15 = v14;
        CStringPtr = CFStringGetCStringPtr(v14, 0x8000100u);
        v17 = "<error getting string>";
        if (CStringPtr)
          v17 = CStringPtr;
        sub_10000489C(1, "%s: %s: APFSVolumeRoleFind returned %s", "reformat_volume", v7, v17);
        CFRelease(v15);
      }
      else
      {
        sub_10000489C(1, "%s: %s: APFSVolumeRoleFind returned %s", "reformat_volume", v7, "<error getting string>");
      }
      CFRelease(theArray);
    }
    qword_1000287C8 |= 0x100000000000uLL;
    sub_10000489C(1, "%s: %s: Error: expected exactly one volume with '%s' role");
    return 0xFFFFFFFFLL;
  }
  if (a3)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
    CFStringGetCString(ValueAtIndex, a3, 64, 0x8000100u);
    sub_10000489C(1, "%s: %s: newfs_apfs new volume dev node is %s", "reformat_volume", v7, a3);
  }
  CFRelease(theArray);
  return 0;
}

_QWORD *sub_10000BDE0(_QWORD *a1, int a2)
{
  _QWORD *v3;
  fstab *v4;
  fstab *v5;
  const char *fs_file;
  size_t v7;
  size_t v8;

  v3 = a1;
  if (a1 || (v3 = sub_10000EEB0()) != 0)
  {
    sub_10000F9B8((uint64_t)v3, 0, a2);
    if (setfsent())
    {
      v4 = getfsent();
      if (v4)
      {
        v5 = v4;
        do
        {
          sub_1000049E0(0, "/", 0);
          fs_file = v5->fs_file;
          v7 = strlen(fs_file);
          v8 = strlen(byte_1000287D0);
          if (v7 > v8 && !strncmp(fs_file, byte_1000287D0, v8))
          {
            sub_10000489C(1, "%s: Adding FSENT path %s", "setup_default_content_for_data_volume", fs_file);
            sub_10000F188((uint64_t)v3, v5->fs_file, 0);
          }
          v5 = getfsent();
        }
        while (v5);
      }
      endfsent();
    }
    if (sub_10000F60C((uint64_t)v3))
    {
      sub_10000489C(1, "%s: Could not finalize FS capture.", "setup_default_content_for_data_volume");
      if (v3)
      {
        free(v3);
        return 0;
      }
    }
    else
    {
      sub_10000489C(1, "%s: Successfully setup default Data volume content", "setup_default_content_for_data_volume");
      sub_10000EE50((uint64_t)v3);
    }
  }
  else
  {
    sub_10000489C(1, "%s: Could not create FS scraper.", "setup_default_content_for_data_volume");
  }
  return v3;
}

uint64_t sub_10000BF5C(char *a1)
{
  int v1;
  uint64_t result;
  char *__argv[3];

  __argv[0] = "/sbin/mount_tmpfs";
  __argv[1] = a1;
  __argv[2] = 0;
  v1 = mkpath_np(a1, 0x1EDu);
  if (v1 && v1 != 17)
  {
    qword_1000287C8 |= 0x1000000000000000uLL;
    strerror(v1);
    sub_10000489C(1, "%s: Could not create tmpfs folder at %s, error: %d (%s)");
  }
  else
  {
    result = sub_100010794((const char **)__argv, 0);
    if (!(_DWORD)result)
      return result;
    qword_1000287C8 |= 0x2000000000000000uLL;
    strerror(result);
    sub_10000489C(1, "%s: Could not create tmpfs at %s, error: %d (%s)");
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000C054(char *a1, char *a2)
{
  uint64_t result;
  int v5;
  char *v6;
  char *__argv[4];

  __argv[0] = "/sbin/mount_apfs";
  __argv[1] = a1;
  __argv[2] = a2;
  __argv[3] = 0;
  result = sub_100010794((const char **)__argv, 0);
  if ((_DWORD)result)
  {
    v5 = result;
    qword_1000287C8 |= 0x200000000000uLL;
    v6 = strerror(result);
    sub_10000489C(1, "%s: Could not mount volume: %s at %s, error: %d (%s)", "mount_volume", a1, a2, v5, v6);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10000C110(const char *a1, const char *a2, const char *a3, char a4)
{
  NSString *v8;
  NSString *v9;
  id v10;
  id v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;
  const char *CStringPtr;
  const char *v16;
  uint64_t v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;
  const char *v21;
  const char *v22;
  CFUUIDRef v23;
  const __CFString *v24;
  const __CFString *v25;
  const char *v26;
  const char *v27;
  CFDataRef v28;
  const __CFString *v29;
  const __CFString *v30;
  const char *v31;
  const char *v32;
  const __CFString *v33;
  const __CFString *v34;
  const char *v35;
  const char *v36;
  const __CFString *v37;
  const __CFString *v38;
  const char *v39;
  const char *v40;
  const __CFString *v41;
  const __CFString *v42;
  const char *v43;
  const char *v44;
  int v45;
  NSString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const char *v49;
  const char *v50;
  const __CFString *v51;
  const __CFString *v52;
  const char *v53;
  const char *v54;
  id v56;
  UInt8 bytes;
  id v58;
  uuid_t uu;
  char buffer[256];

  v58 = 0;
  bytes = 0;
  sub_10000489C(1, "%s: Setting up user on %s (device: %s, user device: %s)", "multiuser_mode_setup_user_and_data_volumes", a2, a1, a3);
  v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a2, 1);
  if (!v8)
  {
    sub_10000489C(1, "%s: Failed to convert data mount point string %s to NSString");
LABEL_14:
    v11 = 0;
    v17 = 0xFFFFFFFFLL;
    goto LABEL_114;
  }
  v9 = v8;
  v10 = +[UMLManager sharedManager](UMLManager, "sharedManager");
  if (!v10)
  {
    sub_10000489C(1, "%s: Failed to obtain shared UserManagement instance");
    goto LABEL_14;
  }
  v11 = objc_msgSend(v10, "createPrimaryUserOnSharedDataVolumePath:withError:", v9, &v58);
  if (v11)
    v12 = v58 == 0;
  else
    v12 = 0;
  if (v12)
  {
    v17 = 0;
    goto LABEL_23;
  }
  if (v58)
  {
    v13 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v58);
    if (v13)
    {
      v14 = v13;
      CStringPtr = CFStringGetCStringPtr(v13, 0x8000100u);
      v16 = "<error getting string>";
      if (CStringPtr)
        v16 = CStringPtr;
      sub_10000489C(1, "%s: Failed to create primary user with error:%s", "multiuser_mode_setup_user_and_data_volumes", v16);
      CFRelease(v14);
    }
    else
    {
      sub_10000489C(1, "%s: Failed to create primary user with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    v17 = (uint64_t)objc_msgSend(v58, "code");
  }
  else
  {
    v17 = 0xFFFFFFFFLL;
  }
  if (v11 && (a4 & 1) == 0)
  {
    if (v58)
    {

      v58 = 0;
    }
LABEL_23:
    v18 = objc_msgSend(v11, "uid");
    v19 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), objc_msgSend(v11, "userUUID"));
    v56 = v18;
    if (v19)
    {
      v20 = v19;
      v21 = CFStringGetCStringPtr(v19, 0x8000100u);
      if (v21)
        v22 = v21;
      else
        v22 = "<error getting string>";
      sub_10000489C(1, "%s: Primary user create with uuid: %s and session uid:%d", "multiuser_mode_setup_user_and_data_volumes", v22, (_DWORD)v18);
      CFRelease(v20);
    }
    else
    {
      sub_10000489C(1, "%s: Primary user create with uuid: %s and session uid:%d", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>", (_DWORD)v18);
    }
    v23 = CFUUIDCreateFromString(kCFAllocatorDefault, (CFStringRef)objc_msgSend(v11, "userUUID"));
    v24 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v23);
    if (v24)
    {
      v25 = v24;
      v26 = CFStringGetCStringPtr(v24, 0x8000100u);
      if (v26)
        v27 = v26;
      else
        v27 = "<error getting string>";
      sub_10000489C(1, "%s: AKSIdentityCreateFirst attempt with UUID %s", "multiuser_mode_setup_user_and_data_volumes", v27);
      CFRelease(v25);
    }
    else
    {
      sub_10000489C(1, "%s: AKSIdentityCreateFirst attempt with UUID %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    v28 = CFDataCreate(kCFAllocatorDefault, &bytes, 1);
    v29 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v28);
    if (v29)
    {
      v30 = v29;
      v31 = CFStringGetCStringPtr(v29, 0x8000100u);
      if (v31)
        v32 = v31;
      else
        v32 = "<error getting string>";
      sub_10000489C(1, "%s: AKSIdentityCreateFirst attempt with emptyPass %s", "multiuser_mode_setup_user_and_data_volumes", v32);
      CFRelease(v30);
      if (!v23)
        goto LABEL_45;
    }
    else
    {
      sub_10000489C(1, "%s: AKSIdentityCreateFirst attempt with emptyPass %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
      if (!v23)
        goto LABEL_45;
    }
    if (v28 && (AKSIdentityCreateFirst(v23, v28, &v58) & 1) != 0)
    {
      sub_10000489C(1, "%s: AKSIdentityCreateFirst success, loading the identity", "multiuser_mode_setup_user_and_data_volumes");
LABEL_55:
      if (v58)
      {

        v58 = 0;
      }
      if ((AKSIdentityLoad(v23, v56, &v58) & 1) != 0)
      {
        sub_10000489C(1, "%s: AKSIdentityLoad Succeeded, calling SetPrimary", "multiuser_mode_setup_user_and_data_volumes");
      }
      else
      {
        v37 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v58);
        if (v37)
        {
          v38 = v37;
          v39 = CFStringGetCStringPtr(v37, 0x8000100u);
          if (v39)
            v40 = v39;
          else
            v40 = "<error getting string>";
          sub_10000489C(1, "%s: AKSIdentityLoad failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v40);
          CFRelease(v38);
        }
        else
        {
          sub_10000489C(1, "%s: AKSIdentityLoad failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
        }
        if (v58)
          v17 = (uint64_t)objc_msgSend(v58, "code");
        else
          v17 = 0xFFFFFFFFLL;
        if ((a4 & 1) != 0)
          goto LABEL_110;
      }
      if (v58)
      {

        v58 = 0;
      }
      if ((AKSIdentitySetPrimary(v56, v28, &v58) & 1) != 0)
      {
        sub_10000489C(1, "%s: AKSIdentitySetPrimary succeded, binding Shared data volume", "multiuser_mode_setup_user_and_data_volumes");
        goto LABEL_83;
      }
      v41 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v58);
      if (v41)
      {
        v42 = v41;
        v43 = CFStringGetCStringPtr(v41, 0x8000100u);
        if (v43)
          v44 = v43;
        else
          v44 = "<error getting string>";
        sub_10000489C(1, "%s: AKSIdentitySetPrimary failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v44);
        CFRelease(v42);
      }
      else
      {
        sub_10000489C(1, "%s: AKSIdentitySetPrimary failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
      }
      if (v58)
        v17 = (uint64_t)objc_msgSend(v58, "code");
      else
        v17 = 0xFFFFFFFFLL;
      if ((a4 & 1) == 0)
      {
LABEL_83:
        memset(uu, 0, sizeof(uu));
        sub_10000489C(1, "%s: Binding shared data volume to primary identity", "multiuser_mode_APFS_bind_data_volume");
        if (CFStringGetCString((CFStringRef)objc_msgSend(v11, "userUUID"), buffer, 256, 0x8000100u))
        {
          if (uuid_parse(buffer, uu))
          {
            sub_10000489C(1, "%s: Failed to parse unique string to uuid_t");
          }
          else
          {
            sub_10000489C(1, "%s: Calling APFSVolumeEnableUserProtectionWithOptions with device_node:%s userUUID:%s", "multiuser_mode_APFS_bind_data_volume", a1, buffer);
            v45 = APFSVolumeEnableUserProtectionWithOptions(a1, uu, v28, 8);
            if (!v45)
            {
              sub_10000489C(1, "%s: Shared data volume bound to AKS with primary identity", "multiuser_mode_APFS_bind_data_volume");
              sub_10000489C(1, "%s: Shared data volume bound to AKS with primary", "multiuser_mode_setup_user_and_data_volumes");
              goto LABEL_90;
            }
            strerror(v45);
            sub_10000489C(1, "%s: APFSVolumeEnableUserProtectionWithOptions failed with error:%s");
          }
        }
        else
        {
          sub_10000489C(1, "%s: Failed to retrieve CString from user UUID-string");
        }
        sub_10000489C(1, "%s: Failed to bind Shared data volume", "multiuser_mode_setup_user_and_data_volumes");
        v17 = 0xFFFFFFFFLL;
        if ((a4 & 1) != 0)
          goto LABEL_110;
LABEL_90:
        if (v58)
        {

          v58 = 0;
        }
        v46 = -[NSString lastPathComponent](+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a3, 1), "lastPathComponent");
        v47 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v46);
        if (v47)
        {
          v48 = v47;
          v49 = CFStringGetCStringPtr(v47, 0x8000100u);
          if (v49)
            v50 = v49;
          else
            v50 = "<error getting string>";
          sub_10000489C(1, "%s: User Data Volume, calling volume map on %s", "multiuser_mode_setup_user_and_data_volumes", v50);
          CFRelease(v48);
          if (!v46)
          {
LABEL_101:
            v51 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v58);
            if (v51)
            {
              v52 = v51;
              v53 = CFStringGetCStringPtr(v51, 0x8000100u);
              if (v53)
                v54 = v53;
              else
                v54 = "<error getting string>";
              sub_10000489C(1, "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v54);
              CFRelease(v52);
            }
            else
            {
              sub_10000489C(1, "%s: AKSVolumeMap not called (userDisk unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
            }
            if (v58)
              v17 = (uint64_t)objc_msgSend(v58, "code");
            else
              v17 = 0xFFFFFFFFLL;
            goto LABEL_110;
          }
        }
        else
        {
          sub_10000489C(1, "%s: User Data Volume, calling volume map on %s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
          if (!v46)
            goto LABEL_101;
        }
        if ((AKSVolumeMap(v46, v56, 0, &v58) & 1) != 0)
        {
          sub_10000489C(1, "%s: AKS VolumeMapPath Success", "multiuser_mode_setup_user_and_data_volumes");
          goto LABEL_110;
        }
        goto LABEL_101;
      }
LABEL_110:
      if (v23)
        CFRelease(v23);
      if (v28)
        CFRelease(v28);
      goto LABEL_114;
    }
LABEL_45:
    v33 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v58);
    if (v33)
    {
      v34 = v33;
      v35 = CFStringGetCStringPtr(v33, 0x8000100u);
      if (v35)
        v36 = v35;
      else
        v36 = "<error getting string>";
      sub_10000489C(1, "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", v36);
      CFRelease(v34);
    }
    else
    {
      sub_10000489C(1, "%s: AKSIdentityCreateFirst not called (cfuuid or emptyPassRef unavailable) or failed with error:%s", "multiuser_mode_setup_user_and_data_volumes", "<error getting string>");
    }
    if (v58)
      v17 = (uint64_t)objc_msgSend(v58, "code");
    else
      v17 = 0xFFFFFFFFLL;
    if ((a4 & 1) != 0)
      goto LABEL_110;
    goto LABEL_55;
  }
LABEL_114:

  return v17;
}

uint64_t sub_10000C94C(uint64_t a1)
{
  int v1;
  char *v2;
  unint64_t v3;
  unsigned int v4;
  char *v5;
  int v6;
  int v7;
  const char *v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int *v18;
  int v19;
  uint64_t v20;
  char v22[3];
  uint64_t v23;
  unint64_t v24;
  _QWORD v25[4];
  uint64_t v26;
  int v27;
  statfs v28;
  _OWORD v29[4];

  v27 = 0;
  v26 = 0;
  memset(v29, 0, sizeof(v29));
  v1 = APFSOverProvModel(a1);
  if (!v1)
  {
    v8 = "None";
LABEL_13:
    sub_10000489C(1, "%s: System OVP model is %s", "create_overprovisioning_file", v8);
    return 0;
  }
  if (v1 != 1)
  {
    v8 = "unknown";
    if (v1 == 2)
      v8 = "Volume based";
    goto LABEL_13;
  }
  memset(&v28, 0, 512);
  sub_10000489C(1, "%s: System OVP model is %s", "create_overprovisioning_file", "File based - going to create the OVP file now");
  v25[3] = 0;
  v23 = 0;
  v24 = 0;
  statfs("/", &v28);
  v2 = strstr(v28.f_mntfromname, "disk");
  if (v2)
  {
    if (v2[4] < 48)
    {
      LODWORD(v3) = 0;
    }
    else
    {
      v3 = 0;
      v4 = v2[4];
      v5 = v2 + 5;
      while (v4 <= 0x39 && v3 <= 1)
      {
        v22[v3] = v4;
        v6 = v3 + 1;
        v7 = v5[v3];
        v4 = v5[v3++];
        if (v7 <= 47)
        {
          LODWORD(v3) = v6;
          break;
        }
      }
    }
    v22[v3] = 0;
  }
  __sprintf_chk((char *)v29, 0, 0x40uLL, "/dev/rdisk%s", v22);
  v10 = open((const char *)v29, 0);
  if (v10 != -1)
  {
    v11 = v10;
    if (ioctl(v10, 0x40046418uLL, &v27) == -1)
    {
      v9 = *__error();
      __error();
      sub_10000489C(1, "%s: unable to get DKIOCGETBLOCKSIZE: %d\n");
    }
    else if (ioctl(v11, 0x40086419uLL, &v26) == -1)
    {
      v9 = *__error();
      __error();
      sub_10000489C(1, "%s: unable to get DKIOCGETBLOCKCOUNT: %d\n");
    }
    else
    {
      v12 = v26 * v27;
      v13 = v12 + 0x3FFFFFFF;
      if (v12 >= 0)
        v13 = v26 * v27;
      sub_10000489C(1, "%s: device_size = %llu (%lld GB)\n", "create_overprovisioning_file", v26 * v27, v13 >> 30);
      if ((unint64_t)(v12 / 100) >= 0x40000000)
        v14 = 0x40000000;
      else
        v14 = v12 / 100;
      sub_10000489C(1, "%s: file_size = %llu (%lld GB)\n", "create_overprovisioning_file", v14, v14 >> 30);
      sub_1000049E0(0, 0, "/.overprovisioning_file");
      v15 = open_dprotected_np(byte_1000287D0, 2562, 6, 0, 384);
      if (v15 != -1)
      {
        v16 = v15;
        v25[0] = 0x300000002;
        v25[1] = 0;
        v25[2] = v14;
        if (fcntl(v15, 42, v25) == -1 && *__error() == 28 && (LODWORD(v25[0]) = 0, fcntl(v16, 42, v25) == -1))
        {
          v9 = *__error();
          __error();
          sub_10000489C(1, "%s: preallocation of %llu bytes failed: %d \n");
        }
        else
        {
          v17 = ftruncate(v16, v14);
          if ((_DWORD)v17)
          {
            v9 = v17;
            __error();
            sub_10000489C(1, "%s: failed to write to %s file to establish the size (%d).\n");
          }
          else
          {
            v20 = fcntl(v16, 51, 0);
            if ((_DWORD)v20)
            {
              v9 = v20;
              __error();
              sub_10000489C(1, "%s: failed to fullsync %s file with %d.\n");
            }
            else
            {
              v23 = 0;
              v24 = v14;
              if (fcntl(v16, 100, &v23) == -1)
              {
                v9 = *__error();
                __error();
                sub_10000489C(1, "%s: F_TRIM_ACTIVE_FILE failed with: %d \n");
              }
              else
              {
                v9 = 0;
              }
            }
          }
        }
        close(v11);
        v19 = v16;
        goto LABEL_42;
      }
      v9 = *__error();
      __error();
      sub_10000489C(1, "%s: Could not open %s with error %d\n");
    }
    v19 = v11;
LABEL_42:
    close(v19);
    return v9;
  }
  v9 = *__error();
  v18 = __error();
  sub_10000489C(1, "%s: unable to open device: %d\n", "create_overprovisioning_file", *v18);
  return v9;
}

uint64_t sub_10000CE28(uint64_t a1)
{
  int v2;
  uid_t v3;
  uid_t v4;
  pid_t v5;
  pid_t v6;
  const char *v7;
  int v8;
  const char *v9;
  int System;
  uint64_t v11;
  const char *v12;
  int *v13;
  int *v14;
  char *v15;
  int v16;
  int *v17;
  char *v18;

  v2 = umask(0);
  sub_10000489C(1, "%s: Old mask has value %o; New mask has value %o.", "rebuild_data_volume", v2, 0);
  v3 = geteuid();
  v4 = getuid();
  v5 = getpid();
  v6 = getppid();
  sub_10000489C(1, "%s: EUID = %d; UID = %d; PID = %d; PPID = %d.", "rebuild_data_volume", v3, v4, v5, v6);
  if (byte_1000288F1 == 1)
    sub_10000FF6C();
  sub_10000489C(1, "%s: Creating whitelist directories", "rebuild_data_volume");
  if (byte_1000288D8)
    v7 = "/private/var/tmp/alt_root/private/var";
  else
    v7 = "/private/var";
  v8 = aks_bootstrap_fs(v7, 2);
  if (v8)
  {
    qword_1000287C8 |= 0x400000000000uLL;
    sub_10000489C(1, "%s: aksutils_bootstrap_fs failed: %d", "rebuild_data_volume", v8);
  }
  sub_10000FD90();
  sub_10000489C(1, "%s: Creating system keybag", "rebuild_data_volume");
  if (byte_1000288D8)
    v9 = "/private/var/tmp/alt_root/private/var";
  else
    v9 = "/private/var";
  System = MKBKeyBagCreateSystem(0, v9);
  if (System)
  {
    qword_1000287C8 |= 0x1000000000000uLL;
    sub_10000489C(1, "%s: Unable to create keybag: %d", "rebuild_data_volume", System);
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 0;
  }
  sub_10000489C(1, "%s: Restoring Data volume content", "rebuild_data_volume");
  if (byte_1000288D8)
    v12 = "/private/var/tmp/alt_root";
  else
    v12 = "/";
  if (sub_10000F670(a1, (uint64_t)v12))
  {
    qword_1000287C8 |= 0x800000000000uLL;
    v11 = 0xFFFFFFFFLL;
    sub_10000489C(1, "%s: Unable to restore filesystem stuff.");
  }
  else
  {
    sub_10000489C(1, "%s: Restoring Data volume content Completed");
  }
  sub_1000049E0(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_1000287D0) == -1)
  {
    if (*__error() == 17)
    {
      sub_10000489C(1, "%s: Timezone symlink already exists.");
    }
    else
    {
      qword_1000287C8 |= 8uLL;
      v14 = __error();
      v15 = strerror(*v14);
      sub_10000489C(1, "%s: Could not symlink the timezone file '%s': %s", "rebuild_data_volume", byte_1000287D0, v15);
      v11 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    sub_10000489C(1, "%s: Symlink of TZDEFAULT(%s) to US/Pacific Completed OK", "rebuild_data_volume", byte_1000287D0);
    if (lchmod(byte_1000287D0, 0x1EDu) == -1)
    {
      v13 = __error();
      strerror(*v13);
      sub_10000489C(1, "%s: Could not set 0755 permission on symlink: %s");
    }
  }
  sub_10000FC0C();
  sub_1000049E0(0, "/root", "/.obliterated");
  v16 = open(byte_1000287D0, 513, 420);
  if (v16 == -1)
  {
    qword_1000287C8 |= 0x8000uLL;
    v17 = __error();
    v18 = strerror(*v17);
    sub_10000489C(1, "%s: Could not create the '.obliterated' marker file: %s", "rebuild_data_volume", v18);
  }
  else
  {
    close(v16);
  }
  return v11;
}

id sub_10000D14C(uint64_t a1)
{
  NSString *v1;
  NSString *v2;
  NSString *v3;
  BOOL v4;
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  const char *CStringPtr;
  const char *v9;
  const __CFString *v10;
  const __CFString *v11;
  const char *v12;
  const char *v13;
  const __CFString *v14;
  const __CFString *v15;
  const char *v16;
  const char *v17;
  id v19;

  v19 = 0;
  v1 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 1);
  v2 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", "/", 1);
  v3 = v2;
  if (v1)
    v4 = v2 == 0;
  else
    v4 = 1;
  if (v4
    || (objc_msgSend(+[UMLManager sharedManager](UMLManager, "sharedManager"), "createPrimaryUserLayoutWithOnUserVolumePath:fromSystemVolumePath:withError:", v1, v2, &v19) & 1) == 0)
  {
    v6 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v1);
    if (v6)
    {
      v7 = v6;
      CStringPtr = CFStringGetCStringPtr(v6, 0x8000100u);
      if (CStringPtr)
        v9 = CStringPtr;
      else
        v9 = "<error getting string>";
      sub_10000489C(1, "%s: createPrimaryUserLayout for user mount point %s", "multiuser_mode_rebuild_user_volume", v9);
      CFRelease(v7);
    }
    else
    {
      sub_10000489C(1, "%s: createPrimaryUserLayout for user mount point %s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    v10 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v3);
    if (v10)
    {
      v11 = v10;
      v12 = CFStringGetCStringPtr(v10, 0x8000100u);
      if (v12)
        v13 = v12;
      else
        v13 = "<error getting string>";
      sub_10000489C(1, "%s: createPrimaryUserLayout for system mount point %s", "multiuser_mode_rebuild_user_volume", v13);
      CFRelease(v11);
    }
    else
    {
      sub_10000489C(1, "%s: createPrimaryUserLayout for system mount point %s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    v14 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), v19);
    if (v14)
    {
      v15 = v14;
      v16 = CFStringGetCStringPtr(v14, 0x8000100u);
      if (v16)
        v17 = v16;
      else
        v17 = "<error getting string>";
      sub_10000489C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s", "multiuser_mode_rebuild_user_volume", v17);
      CFRelease(v15);
    }
    else
    {
      sub_10000489C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath failed with error:%s", "multiuser_mode_rebuild_user_volume", "<error getting string>");
    }
    v5 = objc_msgSend(v19, "code");
  }
  else
  {
    sub_10000489C(1, "%s: createPrimaryUserLayoutWithOnUserVolumePath Success", "multiuser_mode_rebuild_user_volume");
    v5 = 0;
  }

  return v5;
}

uint64_t sub_10000D384(_BYTE *a1)
{
  size_t v2;
  uint64_t v3;
  char *v4;
  char *v6;
  char *v7;
  statfs v8;

  if (a1)
    *a1 = 0;
  if (!byte_100028938)
  {
    sub_10000489C(1, "%s: Warning: Hardware volume device-node/default-mount unknown!");
    return 0;
  }
  memset(&v8, 0, 512);
  if (aPrivateVarHard[0])
  {
    if (!statfs(aPrivateVarHard, &v8))
    {
      v2 = strlen(aPrivateVarHard);
      if (!strncmp(v8.f_mntonname, aPrivateVarHard, v2))
      {
        v6 = &byte_100028938;
        v7 = aPrivateVarHard;
        v4 = "%s: Hardware volume %s is already mounted at '%s'";
LABEL_15:
        v3 = 1;
        sub_10000489C(1, v4, "try_mount_hw_volume", v6, v7);
        return v3;
      }
    }
  }
  if (!sub_10000C054(&byte_100028938, aPrivateVarHard))
  {
    if (a1)
      *a1 = 1;
    v4 = "%s: Successfully mounted Hardware volume";
    goto LABEL_15;
  }
  sub_10000489C(1, "%s: Failed to mount Hardware volume");
  return 0;
}

uint64_t sub_10000D528()
{
  _removefile_state *v0;
  int *v1;
  char *v2;
  int *v3;
  char *v4;
  int v5;
  char *v6;
  uint64_t v7;
  int value;

  v0 = removefile_state_alloc();
  value = 0;
  if (removefile_state_set(v0, 3u, sub_10000E1E0))
  {
    v1 = __error();
    v2 = strerror(*v1);
    sub_10000489C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CALLBACK failed: %s", "RemoveFileLayout", v2);
  }
  if (removefile_state_set(v0, 4u, &value))
  {
    v3 = __error();
    v4 = strerror(*v3);
    sub_10000489C(1, "%s: removefile_state_set REMOVEFILE_STATE_ERROR_CONTEXT failed: %s", "RemoveFileLayout", v4);
  }
  if (removefile(byte_1000287D0, v0, 1u) && (v5 = *__error(), v5 != 2) || (v5 = value, (value & 0xFFFFFFFD) != 0))
  {
    v6 = strerror(v5);
    sub_10000489C(1, "%s: removefile for %s failed with error:%s", "RemoveFileLayout", byte_1000287D0, v6);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  removefile_state_free(v0);
  return v7;
}

void sub_10000D638()
{
  sub_1000049E0(2, "/factory/mfi", 0);
  if (sub_10000D528())
    sub_10000489C(1, "%s: Successfully removed 'mfi' dir");
  else
    sub_10000489C(1, "%s: Failed to remove 'mfi' dir");
  sub_1000049E0(2, "/factory/su", 0);
  if (sub_10000D528())
    sub_10000489C(1, "%s: Successfully removed 'su' dir");
  else
    sub_10000489C(1, "%s: Failed to remove 'su' dir");
  sub_1000049E0(2, "/dcrt", 0);
  if (sub_10000D528())
    sub_10000489C(1, "%s: Successfully removed 'dcrt' dir");
  else
    sub_10000489C(1, "%s: Failed to remove 'dcrt' dir");
}

void sub_10000D714()
{
  int *v0;

  if (unmount(aPrivateVarHard, 0x80000))
  {
    qword_1000287C8 |= 0x8000000000000000;
    v0 = __error();
    strerror(*v0);
    sub_10000489C(1, "%s: Failed to unmount the Hardware volume: %s");
  }
  else
  {
    sub_10000489C(1, "%s: Successfully unmounted the Hardware volume");
  }
}

void sub_10000D790()
{
  sub_10000489C(0, "%s: Clearing Obliteration in Progress", "clearOblitNVRAMkey");
  sub_1000113A8(CFSTR("oblit-inprogress"));
}

void sub_10000D7CC(CFStringRef jobLabel)
{
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  CFErrorRef outError;

  outError = 0;
  if (SMJobRemove(kSMDomainSystemLaunchd, jobLabel, 0, 1u, &outError))
  {
    v2 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), jobLabel);
    if (v2)
    {
      v3 = v2;
      CFStringGetCStringPtr(v2, 0x8000100u);
      sub_10000489C(1, "%s: SMJobRemove:%s Success");
LABEL_6:
      CFRelease(v3);
      return;
    }
    sub_10000489C(1, "%s: SMJobRemove:%s Success");
  }
  else
  {
    CFErrorGetCode(outError);
    v4 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), jobLabel);
    if (v4)
    {
      v3 = v4;
      CFStringGetCStringPtr(v4, 0x8000100u);
      sub_10000489C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
      goto LABEL_6;
    }
    sub_10000489C(1, "%s: SMJobRemove:%s Failed, returned error:%d");
  }
}

uint64_t sub_10000D928()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  kern_return_t v3;
  BOOL v4;
  uint64_t v5;
  kern_return_t v6;
  io_connect_t connect;

  connect = 0;
  v0 = IOServiceMatching("IOWatchdog");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    sub_10000489C(1, "%s: Failed to discover watchdog service");
    return 0xFFFFFFFFLL;
  }
  v2 = MatchingService;
  v3 = IOServiceOpen(MatchingService, mach_task_self_, 1u, &connect);
  IOObjectRelease(v2);
  if (v3)
    v4 = 1;
  else
    v4 = connect == 0;
  if (v4)
  {
    sub_10000489C(1, "%s: IOServiceOpen kIOWatchdogUserClientOpen failed with error: %d");
    return 0xFFFFFFFFLL;
  }
  v6 = IOConnectCallScalarMethod(connect, 3u, 0, 0, 0, 0);
  if (v6)
  {
    sub_10000489C(1, "%s: Failed to call kIOWatchdogDaemonDisableUserspaceMonitoring method, returned : %d", "disable_watchdog_only", v6);
    v5 = 0xFFFFFFFFLL;
  }
  else
  {
    sub_10000489C(1, "%s: Disabled watchdog timer", "disable_watchdog_only");
    v5 = 0;
  }
  IOServiceClose(connect);
  return v5;
}

uint64_t sub_10000DA4C(void *a1)
{
  float v2;
  float v3;
  int v4;
  double Current;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;

  v3 = *(float *)a1;
  v2 = *((float *)a1 + 1);
  v4 = *((_DWORD *)a1 + 2);
  sub_10000489C(1, "%s: \tspawned drawing thread.", "drawing_routine");
  Current = CFAbsoluteTimeGetCurrent();
  if (Current <= 0.0)
  {
    sub_10000489C(1, "%s: could not get start time");
  }
  else
  {
    v6 = Current;
    v7 = CFAbsoluteTimeGetCurrent();
    if (v7 <= 0.0)
    {
LABEL_6:
      sub_10000489C(1, "%s: could not get time");
    }
    else
    {
      v8 = (float)(v2 - v3);
      v9 = v3;
      v10 = 1.2 / (float)v4;
      while (1)
      {
        v11 = v7 - v6;
        if (byte_100028928 == 1)
          break;
        v12 = v9 + v8 * tanh((float)(v10 * v11));
        sub_10000EE28(v12);
        usleep(0x411Au);
        v7 = CFAbsoluteTimeGetCurrent();
        if (v7 <= 0.0)
          goto LABEL_6;
      }
      sub_10000489C(0, "%s: time to die. setting to %f. %f total seconds elapsed", "drawing_routine", *((float *)a1 + 1), v11);
      sub_10000EE28(*((float *)a1 + 1));
    }
  }
  free(a1);
  return 0;
}

uint64_t sub_10000DB88(uint64_t result, unsigned int a2)
{
  const char **v2;
  io_registry_entry_t v4;
  io_object_t v5;
  CFTypeRef CFProperty;
  const __CFDictionary *v7;
  io_service_t MatchingService;
  io_object_t v9;
  io_object_t v10;
  uint64_t v11;
  unsigned int **v12;
  kern_return_t v13;
  const __CFDictionary *v14;
  io_service_t v15;
  uint32_t outputCnt;
  uint64_t output;
  io_connect_t connect;
  uint64_t input;

  connect = 0;
  input = 0;
  output = 0;
  outputCnt = 1;
  if (!result)
    return result;
  v2 = (const char **)result;
  if (!*(_QWORD *)result)
    return result;
  v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  if (!v4)
  {
    sub_10000489C(1, "%s: unable to find /defaults node\n", "deviceHasEANStorage");
    goto LABEL_9;
  }
  v5 = v4;
  CFProperty = IORegistryEntryCreateCFProperty(v4, CFSTR("ean-storage-present"), kCFAllocatorDefault, 0);
  IOObjectRelease(v5);
  if (!CFProperty)
  {
LABEL_9:
    sub_10000489C(1, "%s: Device Does not Support EAN Storage, skipping...", "eraseEANStorage");
    v10 = 0;
    v9 = 0;
    goto LABEL_12;
  }
  CFRelease(CFProperty);
  sub_10000489C(1, "%s: Supports EAN Storage, erasing...", "eraseEANStorage");
  v7 = IOServiceMatching("AppleNVMeEAN");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v7);
  v9 = MatchingService;
  if (MatchingService)
  {
    if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
    {
      sub_10000489C(1, "%s: Failed to open IOService with error:0x%x");
    }
    else if (connect)
    {
      if (a2)
      {
        v11 = a2;
        v12 = (unsigned int **)v2;
        do
        {
          input = bswap32(**v12);
          sub_10000489C(1, "%s: Erasing EAN key %c%c%c%c.\n", "eraseEANStorage", BYTE3(input), WORD1(input), input >> 8, input);
          v13 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
          if (v13)
          {
            qword_1000287C8 |= 0x80000000000uLL;
            sub_10000489C(1, "%s: Erasing EAN key failed with error %d\n", "eraseEANStorage", v13);
          }
          ++v12;
          --v11;
        }
        while (v11);
      }
      if (!strcmp(*v2, "xrtC") && !strcmp(v2[1], "xrtP"))
      {
        v14 = IOServiceMatching("AppleVirtualPlatformXART");
        v15 = IOServiceGetMatchingService(kIOMainPortDefault, v14);
        v10 = v15;
        if (v15)
        {
          if (IORegistryEntrySetCFProperty(v15, CFSTR("FORCE-RELOAD"), kCFBooleanTrue))
          {
            qword_1000287C8 |= 0x80000000000uLL;
            sub_10000489C(1, "%s: Failed to set FORCE_RELOAD on AppleVirtualPlatformXART with error: %d\n");
          }
        }
        else
        {
          sub_10000489C(1, "%s: Failed to find AppleVirtualPlatformXART\n");
        }
        goto LABEL_12;
      }
    }
    else
    {
      sub_10000489C(1, "%s: IOServiceOpen returned IO_OBJECT_NULL, bailing...");
    }
  }
  else
  {
    sub_10000489C(1, "%s: Unable to find kNVMeEANServiceMatchName, bailing...");
  }
  v10 = 0;
LABEL_12:
  result = connect;
  if (connect)
    result = IOServiceClose(connect);
  if (v9)
    result = IOObjectRelease(v9);
  if (v10)
    return IOObjectRelease(v10);
  return result;
}

__CFArray *sub_10000DEC0()
{
  CFMutableArrayRef Mutable;
  __CFArray *v1;
  const __CFDictionary *v2;
  io_object_t v3;
  io_object_t v4;
  io_object_t v5;
  io_object_t v6;
  const __CFString *Value;
  int Count;
  io_registry_entry_t parent;
  CFMutableDictionaryRef theDict;
  CFMutableDictionaryRef v12;
  CFMutableDictionaryRef properties;
  io_iterator_t existing[2];
  char buffer[256];

  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  if (Mutable)
  {
    v1 = Mutable;
    properties = 0;
    *(_QWORD *)existing = 0;
    theDict = 0;
    v12 = 0;
    parent = 0;
    sub_10000489C(1, "%s: Creating List of APFS volume Spec Nodes", "findAll_APFSVolumes_OnDevice");
    v2 = IOServiceMatching("AppleAPFSContainer");
    if (!IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing[1]))
    {
      v3 = IOIteratorNext(existing[1]);
      if (!v3)
      {
        IOObjectRelease(existing[1]);
        sub_10000489C(1, "%s: no APFS containers found");
        goto LABEL_24;
      }
      v4 = v3;
      while (!IORegistryEntryGetParentEntry(v4, "IOService", &parent)
           && !IORegistryEntryGetChildIterator(v4, "IOService", existing))
      {
        if (IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0)
          || IORegistryEntryCreateCFProperties(v4, &v12, kCFAllocatorDefault, 0))
        {
LABEL_21:
          sub_10000489C(1, "%s: unable to fetch IORegistry properties");
          goto LABEL_24;
        }
        CFRelease(v12);
        CFRelease(properties);
        IOObjectRelease(parent);
        v5 = IOIteratorNext(existing[0]);
        if (v5)
        {
          v6 = v5;
          do
          {
            if (IOObjectConformsTo(v6, "AppleAPFSVolume"))
            {
              if (IORegistryEntryCreateCFProperties(v6, &theDict, kCFAllocatorDefault, 0))
                goto LABEL_21;
              Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("BSD Name"));
              CFArrayAppendValue(v1, Value);
              CFStringGetCString(Value, buffer, 256, 0x8000100u);
              sub_10000489C(1, "%s: Found Volume IOBSD name:%s, added to the list", "findAll_APFSVolumes_OnDevice", buffer);
              CFRelease(theDict);
            }
            IOObjectRelease(v6);
            v6 = IOIteratorNext(existing[0]);
          }
          while (v6);
        }
        IOObjectRelease(existing[0]);
        IOObjectRelease(v4);
        v4 = IOIteratorNext(existing[1]);
        if (!v4)
        {
          IOObjectRelease(existing[1]);
          Count = CFArrayGetCount(v1);
          if (Count)
          {
            sub_10000489C(1, "%s: Found %d Volumes, returning the list", "findAll_APFSVolumes_OnDevice", Count);
            return v1;
          }
          sub_10000489C(1, "%s: Unable to find any APFS Volume FSSpec nodes from IORegistry, bailing");
          goto LABEL_24;
        }
      }
    }
    sub_10000489C(1, "%s: unable to scan IORegistry");
LABEL_24:
    sub_10000489C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
    CFRelease(v1);
    return 0;
  }
  sub_10000489C(1, "%s: could not create temp Array", "findAll_APFSVolumes_OnDevice");
  sub_10000489C(1, "%s: Encountered error while finding volumes, NULL returned", "findAll_APFSVolumes_OnDevice");
  return 0;
}

uint64_t sub_10000E1E0(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  char *v5;
  char *v6;
  int *v7;
  char *v8;
  stat v10;
  int dst;

  dst = 0;
  if (removefile_state_get(a1, 5u, &dst))
  {
    sub_10000489C(1, "%s: removefile hit error for %s but we failed to get the error number", "_removefile_error_callback", a2);
    dst = 2;
  }
  else if (dst != 2)
  {
    v5 = strerror(dst);
    sub_10000489C(1, "%s: removefile hit error for %s : %s", "_removefile_error_callback", a2, v5);
    if (dst == 1)
    {
      memset(&v10, 0, sizeof(v10));
      if (lstat(a2, &v10))
      {
        v6 = "%s: Failed to stat %s before unsetting UF_IMMUTABLE: %s";
      }
      else
      {
        if ((v10.st_flags & 2) == 0)
          goto LABEL_8;
        if (lchflags(a2, v10.st_flags & 0xFFFFFFFD))
        {
          v6 = "%s: Failed to lchflags %s: %s";
        }
        else
        {
          sub_10000489C(1, "%s: Unset UF_IMMUTABLE on %s", "_removefile_error_callback", a2);
          if (!unlink(a2))
            return 0;
          v6 = "%s: unlink of %s failed: %s";
        }
      }
      v7 = __error();
      v8 = strerror(*v7);
      sub_10000489C(1, v6, "_removefile_error_callback", a2, v8);
    }
  }
LABEL_8:
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

intptr_t sub_10000E340(uint64_t a1)
{
  int v2;
  BOOL v3;

  byte_100028928 = 1;
  v2 = pthread_join((pthread_t)qword_100028930, 0);
  if (v2)
    v3 = v2 == 3;
  else
    v3 = 1;
  if (!v3)
    sub_10000489C(0, "%s: Couldn't wait for thread: %d", "end_fakery_block_invoke", v2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000E3AC()
{
  int v0;
  char *__argv[2];
  __int128 v2;

  *(_OWORD *)__argv = *(_OWORD *)off_100024C88;
  v2 = *(_OWORD *)&off_100024C98;
  v0 = sub_100010794((const char **)__argv, 0);
  if (v0)
    sub_10000489C(1, "%s: Failed to remount preboot as read-write: %d", "remountPreboot", v0);
}

uint64_t sub_10000E42C(const char *a1)
{
  uint64_t v2;
  int *v3;

  v2 = unlink(a1);
  if ((_DWORD)v2)
  {
    if (*__error() != 2)
    {
      v3 = __error();
      strerror(*v3);
      sub_10000489C(1, "%s: Failed to delete kernelcache at %s: %s");
    }
  }
  else
  {
    sub_10000489C(0, "%s: Deleted kernelcache at %s", "deleteKernelcacheAtPath", a1);
    sub_10000489C(1, "%s: Deleted kernelcache");
  }
  return v2;
}

int sub_10000E4CC(id a1, const char *a2, int a3)
{
  char *v4;

  if (a3 != 20)
  {
    v4 = strerror(a3);
    sub_10000489C(1, "%s: glob_b: %s: %s", "deleteKernelcaches_block_invoke", a2, v4);
  }
  return 0;
}

uint64_t sub_10000E524(char *a1)
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  uint64_t v5;
  io_object_t v6;
  io_object_t v7;
  CFTypeRef v8;
  const void *v9;
  CFTypeID TypeID;
  uint64_t v12;
  char *v13;
  const __CFString *Value;
  CFMutableDictionaryRef properties;
  io_iterator_t existing;

  existing = 0;
  v2 = IOServiceMatching("IOMedia");
  if (!v2)
  {
    v5 = 12;
    strerror(12);
    sub_10000489C(1, "%s: Failed to create match dictionary: %s");
    return v5;
  }
  v3 = v2;
  CFDictionaryAddValue(v2, CFSTR("Leaf"), kCFBooleanTrue);
  CFDictionaryAddValue(v3, CFSTR("Whole"), kCFBooleanTrue);
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    v5 = MatchingServices;
    mach_error_string(MatchingServices);
    sub_10000489C(1, "%s: Cannot find entries matching %s: %s");
    return v5;
  }
  v6 = IOIteratorNext(existing);
  if (!v6)
  {
LABEL_13:
    v5 = 0;
    goto LABEL_14;
  }
  v7 = v6;
  while (1)
  {
    v8 = IORegistryEntrySearchCFProperty(v7, "IOService", CFSTR("EmbeddedDeviceTypeFirmware"), kCFAllocatorDefault, 3u);
    if (v8)
      break;
LABEL_12:
    IOObjectRelease(v7);
    v7 = IOIteratorNext(existing);
    if (!v7)
      goto LABEL_13;
  }
  v9 = v8;
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v9) || CFBooleanGetValue((CFBooleanRef)v9) != 1)
  {
    CFRelease(v9);
    goto LABEL_12;
  }
  CFRelease(v9);
  properties = 0;
  v12 = IORegistryEntryCreateCFProperties(v7, &properties, kCFAllocatorDefault, 0);
  if ((_DWORD)v12)
  {
    v5 = v12;
    v13 = mach_error_string(v12);
    sub_10000489C(1, "%s: Failed to create CF properties for firmware partition: %s", "findFirmwarePartition", v13);
  }
  else
  {
    Value = (const __CFString *)CFDictionaryGetValue(properties, CFSTR("BSD Name"));
    if (Value)
    {
      strcpy(a1, "/dev/");
      if (CFStringGetCString(Value, a1 + 5, 59, 0x8000100u))
        v5 = 0;
      else
        v5 = 22;
    }
    else
    {
      sub_10000489C(1, "%s: Failed to get bsd name for firmware partition", "findFirmwarePartition");
      v5 = 0;
    }
    CFRelease(properties);
  }
  IOObjectRelease(v7);
LABEL_14:
  IOObjectRelease(existing);
  return v5;
}

uint64_t sub_10000E788(int a1, const char *a2)
{
  uint64_t v4;
  int *v5;
  char *v6;
  int *v7;
  uint64_t v9;
  unsigned int v10;

  v10 = 0;
  v9 = 0;
  if (ioctl(a1, 0x40046418uLL, &v10) < 0)
  {
    v5 = __error();
    v6 = strerror(*v5);
    sub_10000489C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKSIZE for device %s failed: %s\n", "FS_partsize", a2, v6);
    if (*__error() == 25)
      sub_10000489C(1, "%s: FS_partsize: The specified device may be a file and not a valid block device. \n");
    goto LABEL_7;
  }
  if (ioctl(a1, 0x40086419uLL, &v9) < 0)
  {
    v7 = __error();
    strerror(*v7);
    sub_10000489C(1, "%s: FS_partsize: IOCTL DKIOCGETBLOCKCOUNT for device %s failed: %s\n");
LABEL_7:
    v4 = 0x800000;
    goto LABEL_8;
  }
  v4 = v9 * v10;
LABEL_8:
  sub_10000489C(1, "%s: FS_partsize: for device %s returned %llu\n", "FS_partsize", a2, v4);
  return v4;
}

void sub_10000E894(uint64_t a1)
{
  const char *v2;
  int v3;
  const char *v4;
  const char *v5;
  int System;
  int *v7;
  int *v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;

  v12 = 0;
  if (sub_100004E90(1, &v12))
  {
    sub_10000489C(1, "%s: Obtained the NVRAM Key Value and it is %ld", "safe_setup_volume", v12);
    if (v12)
    {
      byte_1000288F1 = 1;
      sub_10000489C(1, "%s: This is a ManagedDevice Wipe");
    }
    else
    {
      sub_10000489C(1, "%s: Not a ManagedDevice Wipe");
    }
  }
  sub_10000489C(1, "%s: Creating whitelist directories", "safe_setup_volume");
  if (byte_1000288D8)
    v2 = "/private/var/tmp/alt_root/private/var";
  else
    v2 = "/private/var";
  v3 = aks_bootstrap_fs(v2, 2);
  if (v3)
    sub_10000489C(1, "%s: aksutils_bootstrap_fs failed: %d", "safe_setup_volume", v3);
  sub_10000489C(1, "%s: Restoring Data volume content", "safe_setup_volume");
  if (byte_1000288D8)
    v4 = "/private/var/tmp/alt_root";
  else
    v4 = "/";
  if (sub_10000F670(a1, (uint64_t)v4))
    sub_10000489C(1, "%s: Unable to restore filesystem stuff.");
  else
    sub_10000489C(1, "%s: Restoring Data volume content Completed");
  if (byte_1000288F1 == 1)
    sub_10000FF6C();
  sub_10000489C(1, "%s: Creating system keybag", "safe_setup_volume");
  if (byte_1000288D8)
    v5 = "/private/var/tmp/alt_root/private/var";
  else
    v5 = "/private/var";
  System = MKBKeyBagCreateSystem(0, v5);
  if (System)
    sub_10000489C(1, "%s: Unable to create keybag: %d", "safe_setup_volume", System);
  sub_10000489C(1, "%s: Creating system keybag - done", "safe_setup_volume");
  sub_1000049E0(4, "/private", "/var/db/timezone/localtime");
  if (symlink("/var/db/timezone/zoneinfo/US/Pacific", byte_1000287D0) == -1)
  {
    if (*__error() == 17)
    {
      sub_10000489C(1, "%s: Timezone symlink already exists.");
    }
    else
    {
      v8 = __error();
      strerror(*v8);
      sub_10000489C(1, "%s: Could not symlink the timezone file '%s': %s");
    }
  }
  else if (lchmod(byte_1000287D0, 0x1EDu) == -1)
  {
    v7 = __error();
    strerror(*v7);
    sub_10000489C(1, "%s: Could not set 0755 permission on symlink: %s");
  }
  sub_10000489C(1, "%s: done symlink of TZDIR", "safe_setup_volume");
  sub_1000049E0(0, "/root", "/.obliterated");
  v9 = open(byte_1000287D0, 513, 420);
  if (v9 == -1)
  {
    v10 = __error();
    v11 = strerror(*v10);
    sub_10000489C(1, "%s: Could not create the '.obliterated' marker file: %s", "safe_setup_volume", v11);
  }
  else
  {
    close(v9);
  }
}

uint64_t sub_10000EB68(const char *a1)
{
  uint64_t v2;
  char *v3;
  char *v4;
  const char *v6;
  size_t size;

  size = 0;
  if (sysctlbyname("kern.bootargs", 0, &size, 0, 0))
    return 0;
  v3 = (char *)malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3)
    return 0;
  v4 = v3;
  if (sysctlbyname("kern.bootargs", v3, &size, 0, 0)
    || !-[NSString containsString:](+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4), "containsString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1)))
  {
    v2 = 0;
  }
  else
  {
    v6 = a1;
    v2 = 1;
    sub_10000489C(1, "%s: found %s in bootargs(%s)", "bootArgsContains", v6, v4);
  }
  free(v4);
  return v2;
}

char *sub_10000EC68(int a1)
{
  void *v2;
  void *v3;
  char *v4;
  ssize_t v5;
  uint64_t v6;
  char *v7;
  int *v9;
  char *v10;
  CC_SHA256_CTX c;
  unsigned __int8 md[16];
  __int128 v13;

  v2 = malloc_type_malloc(0x10000uLL, 0x2DA6D507uLL);
  *(_OWORD *)md = 0u;
  v13 = 0u;
  if (v2)
  {
    v3 = v2;
    v4 = (char *)malloc_type_malloc(0x41uLL, 0x93C5EBAAuLL);
    if (v4)
    {
      memset(&c, 0, sizeof(c));
      CC_SHA256_Init(&c);
      v5 = pread(a1, v3, 0x10000uLL, 0);
      if (v5 >= 1)
      {
        CC_SHA256_Update(&c, v3, v5);
        goto LABEL_8;
      }
      if ((v5 & 0x8000000000000000) == 0)
      {
LABEL_8:
        CC_SHA256_Final(md, &c);
        v6 = 0;
        v7 = v4;
        do
          v7 += snprintf(v7, 3uLL, "%02X", md[v6++]);
        while (v6 != 32);
        goto LABEL_10;
      }
      v9 = __error();
      v10 = strerror(*v9);
      sub_10000489C(1, "%s: Failed to read from input file: %s", "calculate_SHA256_str", v10);
      free(v4);
      v4 = 0;
    }
    else
    {
      sub_10000489C(1, "%s: Failed to allocate %d bytes for SHA result string", "calculate_SHA256_str", 65);
    }
LABEL_10:
    free(v3);
    return v4;
  }
  sub_10000489C(1, "%s: Failed to allocate %d bytes for SHA calculation", "calculate_SHA256_str", 0x10000);
  return 0;
}

uint64_t sub_10000EE28(float a1)
{
  ramrod_display_set_progress((int)(float)(a1 * 100.0));
  return 0;
}

void sub_10000EE50(uint64_t a1)
{
  if (a1)
    sub_10000489C(1, "%s: Scraper stats: files: %zu, dirs: %zu, symlinks: %zu");
  else
    sub_10000489C(1, "%s: Invalid FS scraper.");
}

_QWORD *sub_10000EEB0()
{
  _QWORD *v0;
  CFMutableDataRef Mutable;
  uint64_t v2;
  uint64_t disk_new;

  v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x10200405D94163CuLL);
  if (v0)
  {
    Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
    v0[1] = Mutable;
    if (Mutable)
    {
      *(_DWORD *)v0 = 1935897200;
      *((_OWORD *)v0 + 2) = 0u;
      *((_OWORD *)v0 + 3) = 0u;
      v2 = archive_write_new();
      v0[2] = v2;
      if (v2)
      {
        if (archive_write_set_format_cpio())
        {
          sub_10000489C(1, "%s: Could not set archive type CPIO: %d.");
        }
        else if (archive_write_set_compression_bzip2(v0[2]))
        {
          sub_10000489C(1, "%s: Could not set archive compression to bzip2: %d.");
        }
        else if (archive_write_open(v0[2], v0, sub_10000F03C, sub_10000F07C, sub_10000F0D0))
        {
          sub_10000489C(1, "%s: Could not set backing memory buffer.");
        }
        else
        {
          disk_new = archive_read_disk_new();
          v0[3] = disk_new;
          if (disk_new)
          {
            if (!archive_read_disk_set_symlink_physical())
              return v0;
            sub_10000489C(1, "%s: Could not set no-follow symlink mode.");
          }
          else
          {
            sub_10000489C(1, "%s: Could not create archive structure.");
          }
        }
      }
      else
      {
        sub_10000489C(1, "%s: Could not write_mem archive.");
      }
    }
    else
    {
      sub_10000489C(1, "%s: Could not create CFData.");
    }
    sub_10000F110(v0);
    return 0;
  }
  return v0;
}

uint64_t sub_10000F03C()
{
  fprintf(__stderrp, "DEBUG: %s called\n", "_ArchiveOpenCallback");
  return 0;
}

CFIndex sub_10000F07C(int a1, uint64_t a2, UInt8 *bytes, CFIndex length)
{
  __CFData *v4;
  CFIndex v5;

  if (!a2)
    return -1;
  if (*(_DWORD *)a2 != 1935897200)
    return -1;
  v4 = *(__CFData **)(a2 + 8);
  if (!v4)
    return -1;
  v5 = length;
  CFDataAppendBytes(v4, bytes, length);
  return v5;
}

uint64_t sub_10000F0D0()
{
  fprintf(__stderrp, "DEBUG: %s called\n", "_ArchiveCloseCallback");
  return 0;
}

uint64_t sub_10000F110(_QWORD *a1)
{
  const void *v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != 1935897200)
    return 0xFFFFFFFFLL;
  v2 = (const void *)a1[1];
  if (v2)
  {
    CFRelease(v2);
    a1[1] = 0;
  }
  if (a1[2])
    archive_write_finish();
  *((_OWORD *)a1 + 2) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  free(a1);
  return 0;
}

uint64_t sub_10000F188(uint64_t a1, char *a2, const char *a3)
{
  uint64_t v4;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v14;
  _QWORD *v15;
  size_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  stat v20;
  stat v21;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = 0xFFFFFFFFLL;
  if (a2 && *(_DWORD *)a1 == 1935897200 && *a2 == 47)
  {
    v7 = realpath_DARWIN_EXTSN(a2, 0);
    if (v7)
    {
      v8 = v7;
      v9 = archive_entry_new();
      if (!v9)
      {
        sub_10000489C(1, "%s: Couldn't create archive entry.", "FSScraperAddPath");
        goto LABEL_13;
      }
      v10 = v9;
      archive_entry_set_pathname(v9, v8);
      if (archive_read_disk_entry_from_file(*(_QWORD *)(a1 + 24), v10, 0xFFFFFFFFLL, 0))
      {
        sub_10000489C(1, "%s: Couldn't read archive entry %s from disk: %d.");
LABEL_9:
        archive_entry_free(v10);
LABEL_13:
        free(v8);
        return v4;
      }
      if (a3)
      {
        memset(&v21, 0, sizeof(v21));
        memset(&v20, 0, sizeof(v20));
        if (lstat(a3, &v21) == -1)
        {
          __error();
          sub_10000489C(1, "%s: lstat(2) on '%s' failed: %d");
          goto LABEL_9;
        }
        if ((v21.st_mode & 0xF000) != 0x8000)
          goto LABEL_33;
        sub_10000489C(1, "%s: Processing reg file at %s", "FSScraperAddPath", a3);
        if (stat(a2, &v20) == -1)
        {
          __error();
          sub_10000489C(1, "%s: stat(2) on '%s' failed: %d");
          goto LABEL_9;
        }
        if ((v20.st_mode & 0xF000) != 0x8000)
        {
LABEL_33:
          sub_10000489C(1, "%s: '%s' isn't a regular file");
          goto LABEL_9;
        }
        archive_entry_set_size(v10, v21.st_size);
      }
      if (archive_write_header(*(_QWORD *)(a1 + 16), v10))
      {
        sub_10000489C(1, "%s: Couldn't write archive entry for path %s: %d.");
        goto LABEL_9;
      }
      if (archive_entry_filetype(v10) == 0x8000)
      {
        if (a3)
        {
          v14 = open(a3, 0);
          if (v14 == -1)
            goto LABEL_46;
        }
        else
        {
          v14 = open(a2, 0);
          if (v14 == -1)
          {
LABEL_46:
            __error();
            sub_10000489C(1, "%s: Couldn't open(2) path %s for reading: %d.");
            goto LABEL_9;
          }
        }
        v16 = archive_entry_size(v10);
        v17 = malloc_type_malloc(v16, 0x6E14BFECuLL);
        if (!v17)
        {
          sub_10000489C(1, "%s: Couldn't allocate buffer of  %ld bytes for file %s.", "FSScraperAddPath", v16, a2);
          v4 = 0xFFFFFFFFLL;
LABEL_50:
          close(v14);
          goto LABEL_9;
        }
        v18 = v17;
        if (v16 == read(v14, v17, v16))
        {
          if (archive_write_data(*(_QWORD *)(a1 + 16), v18, v16) == v16)
          {
            v19 = *(_QWORD *)(a1 + 40) + 1;
            *(_QWORD *)(a1 + 32) += v16;
            *(_QWORD *)(a1 + 40) = v19;
            sub_10000489C(1, "%s: Added regular file with size:%zu and total file count:%zu", "FSScraperAddPath", v16, v19);
            sub_10000489C(1, "%s: Added path %s", "FSScraperAddPath", v8);
            v4 = 0;
LABEL_49:
            free(v18);
            goto LABEL_50;
          }
          sub_10000489C(1, "%s: Couldn't write archive data for path %s: %ld:");
        }
        else
        {
          sub_10000489C(1, "%s: Couldn't read  %ld bytes for file %s, got %ld .");
        }
        v4 = 0xFFFFFFFFLL;
        goto LABEL_49;
      }
      if (archive_entry_filetype(v10) == 0x4000)
      {
        v15 = (_QWORD *)(a1 + 48);
      }
      else
      {
        if (archive_entry_filetype(v10) != 40960)
        {
LABEL_37:
          sub_10000489C(1, "%s: Added path %s", "FSScraperAddPath", v8);
          v4 = 0;
          goto LABEL_9;
        }
        v15 = (_QWORD *)(a1 + 56);
      }
      ++*v15;
      goto LABEL_37;
    }
    v11 = byte_1000287C0;
    v12 = *__error();
    if (v11)
    {
      sub_10000489C(1, "%s: Path %s doesn't exist, skipping as path miss is okay: %d.", "FSScraperAddPath", a2, v12);
      return 0;
    }
    else
    {
      sub_10000489C(1, "%s: Path %s doesn't exist: %d.", "FSScraperAddPath", a2, v12);
    }
  }
  return v4;
}

uint64_t sub_10000F60C(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 == 1935897200)
  {
    result = archive_write_close(*(_QWORD *)(a1 + 16));
    if (!(_DWORD)result)
      return result;
    sub_10000489C(1, "%s: Failed closing archive: %d.", "FSScraperFinalizeCapture", result);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000F670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  __CFReadStream *v9;
  __CFReadStream *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (!a1 || *(_DWORD *)a1 != 1935897200)
    return 0xFFFFFFFFLL;
  v4 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        v6 = Mutable;
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 8));
        Length = CFDataGetLength(*(CFDataRef *)(a1 + 8));
        v9 = CFReadStreamCreateWithBytesNoCopy(0, BytePtr, Length, kCFAllocatorNull);
        if (!v9)
        {
          v4 = 0xFFFFFFFFLL;
          goto LABEL_16;
        }
        v10 = v9;
        if (CFReadStreamOpen(v9))
        {
          CFDictionarySetValue(v6, CFSTR("inputStream"), v10);
          CFDictionarySetValue(v6, CFSTR("compressCPIO"), kCFBooleanTrue);
          CFDictionarySetValue(v6, CFSTR("extractCPIO"), kCFBooleanTrue);
          v11 = BOMCopierNew();
          if (v11)
          {
            v12 = v11;
            v13 = BOMCopierCopyWithOptions(v11, 0, a2, v6);
            if (v13)
            {
              sub_10000489C(1, "%s: Could not copy with options: %d.\n", "FSScraperRestore", v13);
              v4 = 0xFFFFFFFFLL;
            }
            else
            {
              v4 = 0;
            }
            BOMCopierFree(v12);
            goto LABEL_15;
          }
        }
        else
        {
          sub_10000489C(1, "%s: Could not open read stream.", "FSScraperRestore");
        }
        v4 = 0xFFFFFFFFLL;
LABEL_15:
        CFRelease(v10);
LABEL_16:
        CFRelease(v6);
      }
    }
  }
  return v4;
}

uint64_t sub_10000F81C()
{
  const char *v0;

  v0 = sub_1000047C8(1);
  return sub_10000F840(v0, 457, 0x1F5u, 0x1F5u);
}

uint64_t sub_10000F840(const char *a1, int a2, uid_t a3, gid_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  char *v12;
  int *v13;
  char *v14;
  stat v16;

  memset(&v16, 0, sizeof(v16));
  if (stat(a1, &v16))
  {
    v8 = mkpath_np(a1, a2);
    if ((_DWORD)v8)
    {
      v9 = v8;
      v10 = strerror(v8);
      sub_10000489C(1, "%s: Failed mkpath for path '%s' - %s", "FSScraperCreatePath", a1, v10);
      return v9;
    }
    goto LABEL_6;
  }
  sub_10000489C(1, "%s: Path '%s' already exits", "FSScraperCreatePath", a1);
  if (!chmod(a1, a2)
    || (v11 = __error(),
        v12 = strerror(*v11),
        sub_10000489C(1, "%s: Failed to change permissions on path '%s' - %s", "FSScraperCreatePath", a1, v12),
        v9 = *__error(),
        !(_DWORD)v9))
  {
LABEL_6:
    if (chown(a1, a3, a4))
    {
      v13 = __error();
      v14 = strerror(*v13);
      sub_10000489C(1, "%s: Failed to change ownership on path '%s' - %s", "FSScraperCreatePath", a1, v14);
      return *__error();
    }
    else
    {
      sub_10000489C(1, "%s: Successfully set up path('%s', mode %03o, uid %d, gid %d)", "FSScraperCreatePath", a1, a2, a3, a4);
      return 0;
    }
  }
  return v9;
}

uint64_t sub_10000F9B8(uint64_t a1, char *a2, int a3)
{
  FTS *v5;
  FTS *v6;
  FTSENT *v7;
  FTSENT *v8;
  unsigned int fts_info;
  const char *v11;
  int *v12;
  char *v13;
  int *v14;
  unsigned int fts_errno;
  char *v16[2];

  v16[0] = a2;
  v16[1] = 0;
  if (!a2)
  {
    a2 = (char *)sub_1000047C8(0);
    v16[0] = a2;
  }
  sub_10000489C(1, "%s: FSScraperSetDefaultPaths: examining '%s'", "FSScraperSetDefaultPaths", a2);
  v5 = fts_open(v16, 2124, 0);
  if (!v5)
  {
    v11 = v16[0];
    v12 = __error();
    v13 = strerror(*v12);
    v14 = __error();
    sub_10000489C(1, "%s: failed to open path %s: %s (%d)\n", "FSScraperSetDefaultPaths", v11, v13, *v14);
    return 0xFFFFFFFFLL;
  }
  v6 = v5;
  v7 = fts_read(v5);
  if (!v7)
  {
LABEL_15:
    fts_close(v6);
    sub_10000489C(1, "%s: Done with FSScraperSetDefaultPaths()", "FSScraperSetDefaultPaths");
    return 0;
  }
  v8 = v7;
  while (1)
  {
    fts_info = v8->fts_info;
    if (fts_info <= 0xA)
    {
      if (((1 << fts_info) & 0x490) != 0)
        goto LABEL_8;
      if (((1 << fts_info) & 0x60) != 0)
        goto LABEL_11;
    }
    if (!v8->fts_errno)
      goto LABEL_9;
LABEL_8:
    sub_10000489C(1, "%s: FSScraperSetDefaultPaths: error in fts_read(), returned info %d, errno %d", "FSScraperSetDefaultPaths", v8->fts_info, v8->fts_errno);
    if (a3)
      break;
LABEL_9:
    sub_10000F188(a1, v8->fts_path, 0);
LABEL_11:
    v8 = fts_read(v6);
    if (!v8)
      goto LABEL_15;
  }
  fts_errno = v8->fts_errno;
  if (fts_errno)
    return fts_errno;
  else
    return 22;
}

uint64_t sub_10000FB6C(uint64_t a1)
{
  uint64_t i;
  const char *v3;

  sub_10000489C(1, "%s: Adding Hilo paths to scrapper", "FSScraperCaptureHiloPaths");
  for (i = 0; i != 15; i += 5)
  {
    sub_1000049E0(0, "/iomfb_bics_daemon", (&off_100024CB0)[i]);
    if (i * 8)
      v3 = byte_1000287D0;
    else
      v3 = 0;
    sub_10000F188(a1, byte_1000287D0, v3);
  }
  return 0;
}

uint64_t sub_10000FC0C()
{
  uint64_t i;

  sub_10000489C(1, "%s: Setting Class-D on restored Hilo paths", "FSScraperFixupRestoredHiloPaths");
  for (i = 0; i != 15; i += 5)
  {
    sub_1000049E0(0, "/iomfb_bics_daemon", (&off_100024CB0)[i]);
    sub_10000FC88();
  }
  return 0;
}

uint64_t sub_10000FC88()
{
  int v0;
  int v1;
  int *v2;
  uint64_t v3;
  char *v4;
  int *v5;
  char *v6;

  v0 = open_dprotected_np(byte_1000287D0, 0, 0, 1);
  if (v0 == -1)
  {
    v5 = __error();
    v3 = *v5;
    v6 = strerror(*v5);
    sub_10000489C(1, "%s: failed (%s) to open path %s\n", "_set_path_class", v6, byte_1000287D0);
  }
  else
  {
    v1 = v0;
    if (fcntl(v0, 64, 4))
    {
      v2 = __error();
      v3 = *v2;
      v4 = strerror(*v2);
      sub_10000489C(1, "%s: failed (%s) to update class for %s\n", "_set_path_class", v4, byte_1000287D0);
      if (v1 < 0)
        return v3;
      goto LABEL_7;
    }
    sub_10000489C(1, "%s: Set %s to protection class:%d\n", "_set_path_class", byte_1000287D0, 4);
    v3 = 0;
    if ((v1 & 0x80000000) == 0)
LABEL_7:
      close(v1);
  }
  return v3;
}

uint64_t sub_10000FD90()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  gid_t v4;
  uid_t v5;

  v5 = 0;
  v4 = 0;
  sub_1000049E0(0, "/iomfb_bics_daemon", "/");
  sub_10000489C(1, "%s: Setting up hilo path at '%s'", "FSScraperCreateHiloDirPath", byte_1000287D0);
  v0 = sub_10000FE80("root", "wheel", &v5, &v4);
  if ((_DWORD)v0)
  {
    v1 = v0;
    v2 = strerror(v0);
    sub_10000489C(1, "%s: Failed to get uid or gid for user '%s' or group '%s' - %s\n", "FSScraperCreateHiloDirPath", "root", "wheel", v2);
    return v1;
  }
  v1 = sub_10000F840(byte_1000287D0, 488, v5, v4);
  if ((_DWORD)v1)
    return v1;
  return sub_10000FC88();
}

uint64_t sub_10000FE80(const char *a1, const char *a2, uid_t *a3, gid_t *a4)
{
  uint64_t result;
  group *v8;
  group v9;
  passwd *v10;
  passwd v11;
  char v12[4096];

  memset(&v11, 0, sizeof(v11));
  v10 = 0;
  memset(&v9, 0, sizeof(v9));
  v8 = 0;
  if (getpwnam_r(a1, &v11, v12, 0x1000uLL, &v10))
    return *__error();
  *a3 = v10->pw_uid;
  result = getgrnam_r(a2, &v9, v12, 0x1000uLL, &v8);
  if ((_DWORD)result)
    return *__error();
  *a4 = v8->gr_gid;
  return result;
}

uint64_t sub_10000FF6C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  gid_t v4;
  uid_t v5;

  v5 = 0;
  v4 = 0;
  sub_1000049E0(1, "/Library/Application Support", "/com.apple.dmd-setup-option");
  sub_10000489C(1, "%s: Setting up Managed Device path at '%s'", "setManagedDeviceWipePath", byte_1000287D0);
  v0 = sub_10000FE80("mobile", "mobile", &v5, &v4);
  if (!(_DWORD)v0)
    return sub_10000F840(byte_1000287D0, 493, v5, v4);
  v1 = v0;
  v2 = strerror(v0);
  sub_10000489C(1, "%s: Failed to get uid or gid for user '%s' or group '%s' - %s\n", "setManagedDeviceWipePath", "mobile", "mobile", v2);
  return v1;
}

CFMutableDictionaryRef sub_100010044()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result)
    exit(-1);
  return result;
}

const void *sub_100010084(const void *result)
{
  const void *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFDictionaryGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

uint64_t sub_1000100B8()
{
  if (qword_100028AF8 != -1)
    dispatch_once(&qword_100028AF8, &stru_100024E38);
  return byte_100028B00;
}

void sub_1000100F8(id a1)
{
  int has_internal_content;
  const char *v2;

  has_internal_content = os_variant_has_internal_content("");
  byte_100028B00 = has_internal_content;
  v2 = "Customer";
  if (has_internal_content)
    v2 = "Internal";
  sub_10000489C(0, "%s: Running on an %s build according to OS variant", "runningInternalBuild_block_invoke", v2);
}

uint64_t sub_100010158()
{
  if (qword_100028B08 != -1)
    dispatch_once(&qword_100028B08, &stru_100024E78);
  return byte_100028B10;
}

void sub_100010198(id a1)
{
  byte_100028B10 = os_variant_has_internal_diagnostics("com.apple.MobileObliteration");
}

void *sub_1000101BC(const __CFString *a1, CFIndex *a2)
{
  CFTypeID v4;
  CFTypeID TypeID;
  void *v6;
  CFIndex Length;
  CFIndex v8;

  if (!a1)
    return 0;
  v4 = CFGetTypeID(a1);
  TypeID = CFStringGetTypeID();
  v6 = 0;
  if (a2)
  {
    if (v4 == TypeID)
    {
      Length = CFStringGetLength(a1);
      v8 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      *a2 = v8;
      v6 = malloc_type_calloc(v8, 1uLL, 0x100004077774924uLL);
      if (v6)
      {
        if (!CFStringGetCString(a1, (char *)v6, v8, 0x8000100u))
        {
          free(v6);
          return 0;
        }
      }
    }
  }
  return v6;
}

_QWORD *sub_100010270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = 0;
  if (a1 && a2)
  {
    if (a3)
    {
      result = malloc_type_calloc(1uLL, 0x28uLL, 0xE0040DC662491uLL);
      *result = a1;
      result[1] = a2;
      result[2] = a3;
    }
  }
  return result;
}

void sub_1000102D0()
{
  if (qword_100028B38 != -1)
    dispatch_once(&qword_100028B38, &stru_100024FF8);
  qword_100028B20 = qword_100028B40;
  if (qword_100028B40)
  {
    if (qword_100028B18 != -1)
      dispatch_once(&qword_100028B18, &stru_100024EB8);
  }
}

void sub_100010344(id a1)
{
  dispatch_sync((dispatch_queue_t)qword_100028B20, &stru_100024EF8);
}

void sub_100010358(id a1)
{
  _QWORD *v1;

  v1 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (v1)
  {
    *v1 = 0;
    v1[1] = v1;
    qword_100028B28 = (uint64_t)v1;
  }
}

void sub_100010394()
{
  if (qword_100028B28)
  {
    if (qword_100028B30 != -1)
      dispatch_once(&qword_100028B30, &stru_100024F38);
  }
}

void sub_1000103C8(id a1)
{
  if (qword_100028B38 != -1)
    dispatch_once(&qword_100028B38, &stru_100024FF8);
  dispatch_sync((dispatch_queue_t)qword_100028B40, &stru_100024F78);
}

void sub_100010410(id a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  while (1)
  {
    v1 = *(_QWORD **)qword_100028B28;
    if (!*(_QWORD *)qword_100028B28)
      break;
    v2 = v1[3];
    v3 = (_QWORD *)v1[4];
    if (v2)
    {
      *(_QWORD *)(v2 + 32) = v3;
      v3 = (_QWORD *)v1[4];
    }
    else
    {
      *(_QWORD *)(qword_100028B28 + 8) = v3;
    }
    *v3 = v2;
    ((void (*)(_QWORD))v1[2])(*v1);
    free(v1);
  }
  free((void *)qword_100028B28);
  qword_100028B28 = 0;
}

void sub_100010474(uint64_t a1)
{
  uint64_t v1;
  _QWORD block[5];

  if (a1 && qword_100028B28 && *(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
  {
    if (qword_100028B38 != -1)
    {
      v1 = a1;
      dispatch_once(&qword_100028B38, &stru_100024FF8);
      a1 = v1;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100010524;
    block[3] = &unk_100024F98;
    block[4] = a1;
    dispatch_sync((dispatch_queue_t)qword_100028B40, block);
  }
}

uint64_t sub_100010524(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;

  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 8))(**(_QWORD **)(a1 + 32));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  v3 = qword_100028B28;
  v4 = *(_QWORD **)(qword_100028B28 + 8);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v4;
  *v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a1 + 32) + 24;
  return result;
}

void sub_10001057C(uint64_t a1, uint64_t a2)
{
  _QWORD v4[6];

  if (a2 && a1 && qword_100028B28)
  {
    if (qword_100028B38 != -1)
      dispatch_once(&qword_100028B38, &stru_100024FF8);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_100010620;
    v4[3] = &unk_100024FB8;
    v4[4] = a1;
    v4[5] = a2;
    dispatch_sync((dispatch_queue_t)qword_100028B40, v4);
  }
}

void sub_100010620(uint64_t a1)
{
  int v2;
  int v3;
  _QWORD *v4;
  const char *v5;
  char *v6;
  size_t v7;
  uint64_t v8;

  v2 = open(*(const char **)(a1 + 32), 522, 384, 0);
  if (v2 != -1)
  {
    v3 = v2;
    v4 = *(_QWORD **)qword_100028B28;
    if (*(_QWORD *)qword_100028B28)
    {
      do
      {
        v5 = (const char *)(*(uint64_t (**)(_QWORD, uint64_t *))(a1 + 40))(*v4, &v8);
        if (v5)
        {
          v6 = (char *)v5;
          v7 = strlen(v5);
          write(v3, v6, v7);
          write(v3, "\n", 1uLL);
          free(v6);
        }
        v4 = (_QWORD *)v4[3];
      }
      while (v4);
    }
    if (v3 >= 1)
      close(v3);
  }
}

BOOL sub_1000106E8(unsigned int a1, void *a2)
{
  dispatch_queue_t v4;
  NSObject *v5;
  dispatch_block_t v6;
  void *v7;
  dispatch_time_t v8;
  _BOOL8 v9;

  v4 = dispatch_queue_create("com.apple.obliteration.timeout_block", 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, a2);
  if (v6)
  {
    v7 = v6;
    dispatch_async(v5, v6);
    v8 = dispatch_time(0, 1000000000 * a1);
    v9 = dispatch_block_wait(v7, v8) == 0;
    _Block_release(v7);
  }
  else
  {
    v9 = 0;
  }
  dispatch_release(v5);
  return v9;
}

uint64_t sub_100010794(const char **__argv, char **__envp)
{
  uint64_t result;
  int v3;
  pid_t v4;

  v4 = 0;
  v3 = 0;
  if (posix_spawn(&v4, *__argv, 0, 0, (char *const *)__argv, __envp))
    return 0xFFFFFFFFLL;
  result = waitpid(v4, &v3, 0);
  if ((_DWORD)result != -1)
  {
    if ((v3 & 0x7F) != 0)
      return 0xFFFFFFFFLL;
    else
      return BYTE1(v3);
  }
  return result;
}

const __CFString *sub_100010804(char *cStr, int a2)
{
  CFStringRef v4;
  const __CFString *v5;
  io_registry_entry_t v6;
  io_registry_entry_t v7;
  const __CFString *CFProperty;
  mach_error_t v9;
  mach_error_t v10;
  char *v11;

  if (!cStr)
  {
    sub_10000489C(1, "%s: Invalid argument(s).");
    return 0;
  }
  v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000489C(1, "%s: Failed to create CFString from C-string for %s");
    return 0;
  }
  v5 = v4;
  v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_10000489C(1, "%s: Failed to get the IO registry entry.", "checkNVRAMProperty");
    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
  if (CFProperty)
  {
    if (a2)
    {
      v9 = IORegistryEntrySetCFProperty(v7, CFSTR("IONVRAM-DELETE-PROPERTY"), v5);
      if (v9)
      {
        v10 = v9;
        v11 = mach_error_string(v9);
        sub_10000489C(1, "%s: Failed to set io registry property for key %s: %s (0x%08x).", "checkNVRAMProperty", "IONVRAM-DELETE-PROPERTY", v11, v10);
        CFRelease(v5);
        v5 = CFProperty;
        CFProperty = 0;
      }
    }
  }
  else
  {
    sub_10000489C(1, "%s: Failed to find property with the key %s", "checkNVRAMProperty", cStr);
  }
  CFRelease(v5);
  IOObjectRelease(v7);
  return CFProperty;
}

const __CFString *sub_100010988(char *cStr, int a2)
{
  CFStringRef v3;
  const __CFString *v4;
  io_registry_entry_t v5;
  io_registry_entry_t v6;
  const __CFString *CFProperty;
  BOOL v8;

  if (!cStr)
    return 0;
  v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v5)
  {
    CFRelease(v4);
    return 0;
  }
  v6 = v5;
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v5, v4, 0, 0);
  if (CFProperty)
    v8 = a2 == 0;
  else
    v8 = 1;
  if (!v8 && IORegistryEntrySetCFProperty(v6, CFSTR("IONVRAM-DELETE-PROPERTY"), v4))
  {
    CFRelease(v4);
    v4 = CFProperty;
    CFProperty = 0;
  }
  CFRelease(v4);
  IOObjectRelease(v6);
  return CFProperty;
}

uint64_t sub_100010A58(char *cStr, const char *a2)
{
  CFStringRef v4;
  const __CFString *v5;
  CFStringRef v6;
  CFStringRef v7;
  io_registry_entry_t v8;
  io_registry_entry_t v9;
  mach_error_t v10;
  uint64_t v11;

  if (!cStr || !a2)
  {
    sub_10000489C(1, "%s: Invalid argument(s).");
    return 0;
  }
  v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000489C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0;
  }
  v5 = v4;
  v6 = CFStringCreateWithCString(0, a2, 0x8000100u);
  if (!v6)
  {
    sub_10000489C(1, "%s: Failed to create C string from CFString for '%s'", "setNVRAMProperty", a2);
    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  v8 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  v9 = v8;
  if (!v8)
  {
    sub_10000489C(1, "%s: Failed to get the IO registry entry.");
    goto LABEL_14;
  }
  v10 = IORegistryEntrySetCFProperty(v8, v5, v7);
  if (v10)
  {
    mach_error_string(v10);
    sub_10000489C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).");
LABEL_14:
    v11 = 0;
    goto LABEL_16;
  }
  sub_100010BE4(v9, cStr);
  v11 = 1;
LABEL_16:
  CFRelease(v5);
  CFRelease(v7);
  if (v9)
    IOObjectRelease(v9);
  return v11;
}

void sub_100010BE4(io_registry_entry_t a1, const char *a2)
{
  CFTypeID TypeID;
  const __CFString *v5;
  const __CFString *v6;
  CFTypeRef CFProperty;
  const void *v8;
  const CFBooleanRef *v9;
  const __CFData *v10;
  CFDataRef v11;
  kern_return_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  CFIndex v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  __darwin_ct_rune_t v22;
  __darwin_ct_rune_t v23;
  unsigned int v24;
  __darwin_ct_rune_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;
  uint64_t valuePtr;

  TypeID = CFStringGetTypeID();
  v5 = CFStringCreateWithCString(kCFAllocatorDefault, "IONVRAM-FORCESYNCNOW-PROPERTY", 0x8000100u);
  if (!v5)
  {
    sub_10000489C(0, "%s: Error creating CFString for key %s", "SetOFVariable", "IONVRAM-FORCESYNCNOW-PROPERTY");
    return;
  }
  v6 = v5;
  CFProperty = IORegistryEntryCreateCFProperty(a1, v5, 0, 0);
  if (CFProperty)
  {
    v8 = CFProperty;
    TypeID = CFGetTypeID(CFProperty);
    CFRelease(v8);
  }
  if (CFBooleanGetTypeID() == TypeID)
  {
    if (!strcmp("true", a2))
    {
      v9 = &kCFBooleanTrue;
    }
    else
    {
      if (strcmp("false", a2))
        goto LABEL_46;
      v9 = &kCFBooleanFalse;
    }
    v11 = *v9;
    if (*v9)
      goto LABEL_17;
  }
  else
  {
    if (CFNumberGetTypeID() == TypeID)
    {
      valuePtr = strtol(a2, 0, 0);
      v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    }
    else
    {
      if (CFStringGetTypeID() != TypeID)
      {
        if (CFDataGetTypeID() == TypeID)
        {
          v14 = strlen(a2);
          v15 = malloc_type_malloc(v14, 0x96A49A6DuLL);
          if (v15)
          {
            v16 = v15;
            if (v14 >= 1)
            {
              v17 = 0;
              v18 = 0;
              v28 = v14;
              while (1)
              {
                v19 = a2[v18];
                if (v19 == 37)
                {
                  v20 = v18 + 2;
                  if (v18 + 2 >= v14)
                    goto LABEL_45;
                  v21 = v18 + 1;
                  v22 = a2[v18 + 1];
                  if (v22 < 0)
                  {
                    if (!__maskrune(v22, 0x10000uLL))
                      goto LABEL_45;
                  }
                  else if ((_DefaultRuneLocale.__runetype[v22] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }
                  v23 = a2[v20];
                  if (v23 < 0)
                  {
                    if (!__maskrune(v23, 0x10000uLL))
                    {
LABEL_45:
                      free(v16);
                      goto LABEL_46;
                    }
                  }
                  else if ((_DefaultRuneLocale.__runetype[v23] & 0x10000) == 0)
                  {
                    goto LABEL_45;
                  }
                  v24 = __toupper(a2[v21]) - 48;
                  v25 = __toupper(a2[v20]);
                  v26 = v25 - 48;
                  v27 = 16 * v24;
                  if (v24 > 9)
                    v27 = 16 * v24 - 112;
                  if (v26 > 9)
                    LOBYTE(v26) = v25 - 55;
                  LOBYTE(v19) = v26 + v27;
                  v14 = v28;
                }
                else
                {
                  v20 = v18;
                }
                *((_BYTE *)v16 + v17) = v19;
                v18 = v20 + 1;
                ++v17;
                if (v20 + 1 >= v14)
                  goto LABEL_43;
              }
            }
            v17 = 0;
LABEL_43:
            v11 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v16, v17);
            free(v16);
            if (v11)
              goto LABEL_17;
          }
        }
        goto LABEL_46;
      }
      v10 = (const __CFData *)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
    }
    v11 = v10;
    if (v10)
    {
LABEL_17:
      v12 = IORegistryEntrySetCFProperty(a1, v6, v11);
      v13 = "Failed";
      if (!v12)
        v13 = "Succeeded";
      sub_10000489C(0, "%s: %s setting the property %s to value %s", "SetOFVariable", v13, "IONVRAM-FORCESYNCNOW-PROPERTY", a2);
      CFRelease(v11);
      goto LABEL_47;
    }
  }
LABEL_46:
  sub_10000489C(0, "%s: Error creating CFTypeRef(%lu) for value %s", "SetOFVariable", TypeID, a2);
LABEL_47:
  CFRelease(v6);
}

BOOL sub_100010F20(char *cStr, const void *a2)
{
  CFStringRef v4;
  const __CFString *v5;
  io_registry_entry_t v6;
  io_registry_entry_t v7;
  kern_return_t v8;
  _BOOL8 v9;
  mach_error_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const char *CStringPtr;
  const char *v14;
  char *v15;
  char *v17;

  if (!cStr || !a2)
  {
    sub_10000489C(1, "%s: Invalid argument(s).");
    return 0;
  }
  v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v4)
  {
    sub_10000489C(1, "%s: Failed to create C string from CFString for '%s'");
    return 0;
  }
  v5 = v4;
  v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v6)
  {
    sub_10000489C(1, "%s: Failed to get the IO registry entry.", "setNVRAMPropertyWithValueRef");
    CFRelease(v5);
    return 0;
  }
  v7 = v6;
  v8 = IORegistryEntrySetCFProperty(v6, v5, a2);
  v9 = v8 == 0;
  if (v8)
  {
    v10 = v8;
    v11 = CFStringCreateWithFormat(0, 0, CFSTR("%@"), a2);
    if (v11)
    {
      v12 = v11;
      CStringPtr = CFStringGetCStringPtr(v11, 0x8000100u);
      if (CStringPtr)
        v14 = CStringPtr;
      else
        v14 = "<error getting string>";
      v15 = mach_error_string(v10);
      sub_10000489C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).", "setNVRAMPropertyWithValueRef", cStr, v14, v15, v10);
      CFRelease(v12);
    }
    else
    {
      v17 = mach_error_string(v10);
      sub_10000489C(1, "%s: Failed to set io registry property for key %s to value %s: %s (0x%08x).", "setNVRAMPropertyWithValueRef", cStr, "<error getting string>", v17, v10);
    }
  }
  else
  {
    sub_100010BE4(v7, cStr);
  }
  CFRelease(v5);
  IOObjectRelease(v7);
  return v9;
}

uint64_t sub_1000110F0()
{
  NSObject *v0;
  NSObject *v1;
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  IONotificationPort *v4;
  IONotificationPort *v5;
  uint64_t v6;
  dispatch_time_t v8;
  io_iterator_t notification[2];

  *(_QWORD *)notification = 0;
  v0 = dispatch_semaphore_create(0);
  v1 = v0;
  if (!v0)
  {
    sub_10000489C(1, "%s: Failed to create a semaphore.");
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  dispatch_retain(v0);
  v2 = IOServiceMatching("AppleSEPManager");
  if (!v2)
  {
    sub_10000489C(1, "%s: Failed to create matching dictionary for : '%s'");
    goto LABEL_8;
  }
  v3 = v2;
  v4 = IONotificationPortCreate(kIOMainPortDefault);
  if (!v4)
  {
    sub_10000489C(1, "%s: Failed to create the io notification port.", "obliterate_gigalockers_oneshot");
    CFRelease(v3);
    goto LABEL_8;
  }
  v5 = v4;
  if (IOServiceAddMatchingNotification(v4, "IOServiceFirstMatch", v3, (IOServiceMatchingCallback)sub_100011350, v1, notification))
  {
    sub_10000489C(1, "%s: Failed to register notification for io service: '%s' : %d");
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  sub_100011350(v1, notification[0]);
  v8 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v1, v8))
  {
    sub_10000489C(1, "%s: Timed out waiting for %s to match.");
    goto LABEL_23;
  }
  if (IOServiceOpen(dword_1000288D0, mach_task_self_, 0, &notification[1]))
  {
    sub_10000489C(1, "%s: Failed to connect to IO service: '%s' : %d");
    goto LABEL_23;
  }
  sub_10000489C(1, "%s: IOService to sepService successful", "obliterate_gigalockers_oneshot");
  if (IOConnectCallScalarMethod(notification[1], 0x2Fu, 0, 0, 0, 0))
  {
    sub_10000489C(1, "%s: Failed to call method: %d via IO service: '%s' : %d");
    goto LABEL_23;
  }
  v6 = 1;
  sub_10000489C(1, "%s:  Completed  obliterate_gigalockers", "obliterate_gigalockers_oneshot");
LABEL_24:
  IONotificationPortDestroy(v5);
  if (notification[0])
    IOObjectRelease(notification[0]);
LABEL_9:
  if (notification[1])
    IOServiceClose(notification[1]);
  if (dword_1000288D0)
  {
    IOObjectRelease(dword_1000288D0);
    dword_1000288D0 = 0;
  }
  if (v1)
    dispatch_release(v1);
  return v6;
}

void sub_100011350(NSObject *a1, io_iterator_t iterator)
{
  io_object_t v3;

  if (iterator)
  {
    v3 = IOIteratorNext(iterator);
    if (v3)
    {
      if (!dword_1000288D0)
      {
        dword_1000288D0 = v3;
        if (a1)
        {
          dispatch_semaphore_signal(a1);
          dispatch_release(a1);
        }
      }
    }
  }
}

void sub_1000113A8(const void *a1)
{
  io_registry_entry_t v2;
  io_object_t v3;
  mach_error_t v4;
  char *v5;

  v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v2)
  {
    v3 = v2;
    v4 = IORegistryEntrySetCFProperty(v2, CFSTR("IONVRAM-DELETE-PROPERTY"), a1);
    if (v4)
    {
      v5 = mach_error_string(v4);
      sub_10000489C(0, "%s: Error clearing nvram key: %s", "clearNVRAMkey", v5);
    }
    IOObjectRelease(v3);
  }
  else
  {
    sub_10000489C(0, "%s: nvram is not supported on this system", "clearNVRAMkey");
  }
}

void sub_10001144C(int a1)
{
  if (a1)
    sub_10000489C(1, "%s: EpDM obliteration enabled %s");
  else
    sub_10000489C(0, "%s: EpDM obliteration disabled %s");
}

uint64_t sub_100011494()
{
  uint64_t result;
  uint64_t v1;
  const __CFNumber *v2;
  const __CFNumber *v3;
  int v4;
  int v5;
  char v6;
  int valuePtr;
  uint64_t v8;

  result = os_variant_is_darwinos("com.apple.mobile.obliterator");
  if ((_DWORD)result)
  {
    v8 = 0;
    if (os_parse_boot_arg_int("ephemeral_data_mode", &v8))
    {
      v1 = v8;
      sub_10001144C(v8 == 1);
      if (v1 == 1)
        return 1;
    }
    else
    {
      valuePtr = -1;
      v2 = (const __CFNumber *)MGCopyAnswer(CFSTR("EphemeralDataModeOverride"), 0);
      if (!v2
        || (v3 = v2, CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr), CFRelease(v3), v4 = valuePtr, valuePtr == -1))
      {
        v5 = MGGetBoolAnswer(CFSTR("EphemeralDataModeEnabled"));
        v6 = v5;
        sub_10001144C(v5);
        if ((v6 & 1) != 0)
          return 1;
      }
      else
      {
        sub_10001144C(valuePtr == 1);
        if (v4 == 1)
          return 1;
      }
    }
    sub_1000113A8(CFSTR("obliteration"));
    return 0;
  }
  return result;
}

BOOL sub_100011594()
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    sub_10000489C(1, "%s: Failed to determine virtual machine status", "machine_is_virtual");
  return v2 != 0;
}

void sub_100011600(id a1)
{
  qword_100028B40 = (uint64_t)dispatch_queue_create("com.apple.obliterator.logger", 0);
}

uint64_t ramrod_display_set_minimum_progress_blink(double a1)
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  qword_1000286C0 = *(_QWORD *)&a1;
  if (*(double *)&qword_1000286C8 >= a1 && (byte_100028C50 & 1) == 0)
  {
    byte_100028C50 = 1;
    sub_10001349C();
  }
  return pthread_mutex_unlock(&stru_100028B48);
}

uint64_t sub_10001169C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (pthread_mutex_init(&stru_100028B48, 0))
    ramrod_log_msg("unable to initialize display lock\n", v0, v1, v2, v3, v4, v5, v6, v16);
  pthread_mutex_lock(&stru_100028B48);
  *(_QWORD *)&dword_100028BDC = 0xFF4D4D4DFFFFFFFFLL;
  byte_100028BD8 = 0;
  dword_100028BD4 = 257;
  byte_100028C0C = 1;
  v7 = MGGetSInt32Answer(CFSTR("DeviceColorMapPolicy"), 0);
  if (v7)
  {
    if (v7 == 1)
    {
      ramrod_log_msg("inverting UI color", v8, v9, v10, v11, v12, v13, v14, v16);
      *(_QWORD *)&dword_100028BDC = 0xFFCCCCCCFF000000;
      HIWORD(dword_100028BD4) = -1;
      byte_100028BD8 = -1;
    }
    else
    {
      ramrod_log_msg("unexpect color map policy %d", v8, v9, v10, v11, v12, v13, v14, v7);
    }
  }
  off_100028C28 = (uint64_t (*)(_QWORD, _QWORD))sub_100012E4C;
  off_100028C30 = sub_100012F1C;
  off_100028C38 = (uint64_t (*)(_QWORD))sub_100012B3C;
  off_100028C40 = (uint64_t (*)(double))sub_100012F68;
  off_100028C48 = (uint64_t (*)(_QWORD))sub_1000132C8;
  sub_100012738();
  return pthread_mutex_unlock(&stru_100028B48);
}

void ramrod_set_progress_UI(int a1, double a2)
{
  double v2;
  double v3;

  v2 = 100.0;
  if (a2 <= 100.0)
    v2 = a2;
  if (a2 >= 0.0)
    v3 = v2;
  else
    v3 = 0.0;
  if (v3 != *(double *)&qword_1000286C8 || a1 != 0)
  {
    qword_1000286C8 = *(_QWORD *)&v3;
    if (dword_1000286D0 != -1)
    {
      off_100028C40(v3);
      v3 = *(double *)&qword_1000286C8;
    }
    if (v3 >= *(double *)&qword_1000286C0 && (byte_100028C50 & 1) == 0)
    {
      byte_100028C50 = 1;
      sub_10001349C();
    }
  }
}

uint64_t ramrod_display_set_granular_progress_forced(int a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  ramrod_log_msg("%s: %f\n", v4, v5, v6, v7, v8, v9, v10, (char)"ramrod_display_set_granular_progress_forced");
  ramrod_set_progress_UI(a1, a2);
  return pthread_mutex_unlock(&stru_100028B48);
}

double ramrod_display_get_progress()
{
  return *(double *)&qword_1000286C8;
}

uint64_t ramrod_display_get_num_progress_segments()
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  if (dword_100028BC8)
    return dword_100028BC8;
  else
    return (dword_100028B9C << 8);
}

void ramrod_display_set_showui(char a1)
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  LOBYTE(dword_100028BD4) = a1;
  sub_100011948();
}

void sub_100011948()
{
  sub_10001357C((__IOSurface *)qword_100028BF8);
  sub_100012388();
  if (dword_1000286D0 != -1)
  {
    if (*(double *)&qword_1000286C8 >= 0.0)
      off_100028C40(*(double *)&qword_1000286C8);
    else
      sub_100012148();
  }
}

void ramrod_display_set_showprogress(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;

  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  v9 = "Disabling";
  if (a1)
    v9 = "Enabling";
  ramrod_log_msg("%s progress UI", v2, v3, v4, v5, v6, v7, v8, (char)v9);
  BYTE1(dword_100028BD4) = a1;
  sub_100011948();
}

uint64_t ramrod_display_show_image(const __CFString *a1)
{
  return ramrod_display_show_image_with_alpha(a1, 0);
}

uint64_t ramrod_display_show_image_with_alpha(const __CFString *a1, int a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  char *v21;
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
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char buffer[1024];
  char v41[1024];

  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  if (dword_1000286D0 != -1)
  {
    bzero(v41, 0x400uLL);
    v4 = buffer;
    bzero(buffer, 0x400uLL);
    v37 = 0;
    v38 = 0;
    v39 = 0;
    CFStringGetFileSystemRepresentation(a1, buffer, 1024);
    if (access(buffer, 0))
    {
      v12 = strrchr(buffer, 47);
      if (!v12)
      {
        ramrod_log_msg("'%s' is not an absolute path\n", v13, v14, v15, v16, v17, v18, v19, (char)buffer);
        return pthread_mutex_unlock(&stru_100028B48);
      }
      *v12 = 0;
      v20 = v12 + 1;
      v21 = strchr(v12 + 1, 46);
      if (!v21)
      {
        ramrod_log_msg("'%s' does not have an extension\n", v22, v23, v24, v25, v26, v27, v28, (char)v20);
        return pthread_mutex_unlock(&stru_100028B48);
      }
      *v21 = 0;
      v4 = v41;
      if (!sub_100011C28(buffer, v20, dword_100028B9C, v41))
      {
        ramrod_log_msg("could not find suitable image for %s/%s\n", v5, v6, v7, v8, v9, v10, v11, (char)buffer);
        return pthread_mutex_unlock(&stru_100028B48);
      }
    }
    ramrod_log_msg("loading image: %s\n", v5, v6, v7, v8, v9, v10, v11, (char)v4);
    if (sub_100011E9C(v4, &v37, dword_100028B98))
    {
      if (v37 > (unint64_t)xmmword_100028B88 || v38 > *((_QWORD *)&xmmword_100028B88 + 1))
      {
        ramrod_log_msg("image dimensions (%zu, %zu) too big\n", v29, v30, v31, v32, v33, v34, v35, v37);
      }
      else
      {
        if (a2)
          sub_100012078((uint64_t)&v37, 1);
        sub_1000120EC(*((__IOSurface **)&unk_100028BE8 + dword_1000286D0), (uint64_t *)&v37);
        sub_100012148();
        sub_1000120EC(*((__IOSurface **)&unk_100028BE8 + dword_1000286D0), (uint64_t *)&v37);
      }
    }
    else
    {
      ramrod_log_msg("unable to load image '%s'\n", v29, v30, v31, v32, v33, v34, v35, (char)buffer);
    }
  }
  return pthread_mutex_unlock(&stru_100028B48);
}

BOOL sub_100011C28(const char *a1, const char *a2, int a3, char *a4)
{
  unsigned int v8;
  _BOOL8 result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[2];

  memset(v17, 0, sizeof(v17));
  v8 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) - 1;
  if (v8 >= 9 || ((0x12Fu >> v8) & 1) == 0)
  {
    LOBYTE(v17[0]) = 0;
    byte_100028BA4 = 0;
LABEL_4:
    snprintf(a4, 0x400uLL, "%s/%s@%zu.tga", a1, a2, *((size_t *)&xmmword_100028B88 + 1));
    if (access(a4, 0))
    {
      snprintf(a4, 0x400uLL, "%s/%s@%dx.tga", a1, a2, a3);
      if (access(a4, 0))
      {
        if (!LOBYTE(v17[0]) || (snprintf(a4, 0x400uLL, "%s/%s~%s.tga", a1, a2, (const char *)v17), access(a4, 0)))
        {
          snprintf(a4, 0x400uLL, "%s/%s.tga", a1, a2);
          return access(a4, 0) == 0;
        }
      }
    }
    return 1;
  }
  __strlcpy_chk(v17, (&off_1000250E8)[v8], 32, 32);
  byte_100028BA4 = 0;
  if (!LOBYTE(v17[0]))
    goto LABEL_4;
  ramrod_log_msg("Using product_suffix of %s\n", v10, v11, v12, v13, v14, v15, v16, (char)v17);
  if (MGGetFloat32Answer(CFSTR("DeviceCornerRadius"), 0.0) > 0.0)
  {
    snprintf(a4, 0x400uLL, "%s/%s@%zu~%s-USBc.tga", a1, a2, *((size_t *)&xmmword_100028B88 + 1), (const char *)v17);
    if (!access(a4, 0))
    {
      result = 1;
      byte_100028BA4 = 1;
      return result;
    }
  }
  snprintf(a4, 0x400uLL, "%s/%s@%zu~%s.tga", a1, a2, *((size_t *)&xmmword_100028B88 + 1), (const char *)v17);
  if (access(a4, 0))
  {
    snprintf(a4, 0x400uLL, "%s/%s@%dx~%s.tga", a1, a2, a3, (const char *)v17);
    if (access(a4, 0))
      goto LABEL_4;
  }
  return 1;
}

uint64_t sub_100011E9C(const char *a1, _QWORD *a2, int a3)
{
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t k;
  int v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  _DWORD *v26;
  uint64_t i;
  int v28;
  uint64_t j;
  char *v30;
  uint64_t v31;
  int v32;

  v6 = strlen(a1);
  if (v6 < 4 || strcasecmp(&a1[v6 - 4], ".png"))
  {
    if ((ramrod_load_tga(a1, a2, a2 + 1, a2 + 2) & 1) == 0)
      return 0;
LABEL_4:
    if (a3 > 179)
    {
      if (a3 != 270 && a3 != 180)
        goto LABEL_20;
    }
    else
    {
      if (!a3)
        return 1;
      if (a3 != 90)
      {
LABEL_20:
        ramrod_log_msg("unexpected rotation value %d\n", v7, v8, v9, v10, v11, v12, v13, a3);
        return 0;
      }
    }
    v15 = a2[1];
    v14 = (int *)a2[2];
    v16 = *a2;
    v17 = (char *)malloc(4 * *a2 * v15);
    if (a3 == 90)
    {
      if (v15)
      {
        v24 = 0;
        v25 = (uint64_t)&v17[4 * v15 - 4];
        do
        {
          v26 = (_DWORD *)v25;
          for (i = v16; i; --i)
          {
            v28 = *v14++;
            *v26 = v28;
            v26 += v15;
          }
          ++v24;
          v25 -= 4;
        }
        while (v24 != v15);
      }
    }
    else
    {
      if (a3 == 180)
      {
        if (v15)
        {
          for (j = 0; j != v15; ++j)
          {
            if (v16)
            {
              v30 = &v17[4 * (v15 - j) * v16 - 4];
              v31 = v16;
              do
              {
                v32 = *v14++;
                *(_DWORD *)v30 = v32;
                v30 -= 4;
                --v31;
              }
              while (v31);
            }
          }
        }
        goto LABEL_34;
      }
      if (v15)
      {
        v18 = 0;
        v19 = &v17[4 * (v16 - 1) * v15];
        do
        {
          v20 = v19;
          for (k = v16; k; --k)
          {
            v22 = *v14++;
            *(_DWORD *)v20 = v22;
            v20 -= 4 * v15;
          }
          ++v18;
          v19 += 4;
        }
        while (v18 != v15);
      }
    }
    *a2 = v15;
    a2[1] = v16;
LABEL_34:
    a2[2] = v17;
    return 1;
  }
  result = ramrod_load_png(a1, a2, a2 + 1, a2 + 2);
  if ((_DWORD)result)
    goto LABEL_4;
  return result;
}

uint64_t sub_100012078(uint64_t result, int a2)
{
  uint64_t v2;
  int *i;
  int v5;

  v2 = *(_QWORD *)(result + 8) * *(_QWORD *)result;
  if (v2)
  {
    for (i = *(int **)(result + 16); ; ++i)
    {
      result = HIBYTE(*i);
      if ((_DWORD)result != 255)
        break;
      if (a2)
      {
        result = dword_100028BDC;
LABEL_10:
        *i = result;
      }
      if (!--v2)
        return result;
    }
    if (a2)
      v5 = dword_100028BDC;
    else
      v5 = *i;
    result = sub_100013418(result, v5);
    goto LABEL_10;
  }
  return result;
}

void sub_1000120EC(__IOSurface *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;

  v4 = (unint64_t)(xmmword_100028B88 - *a2) >> 1;
  v5 = (unint64_t)(*((_QWORD *)&xmmword_100028B88 + 1) - a2[1]) >> 1;
  sub_10001357C(a1);
  sub_1000135EC(a1, a2, v4, v5);
}

uint64_t sub_100012148()
{
  uint64_t v0;
  int v1;
  BOOL v2;
  __IOSurface *v3;
  __n128 v4;
  uint64_t result;

  v0 = qword_100028C18;
  v1 = dword_1000286D0;
  if (qword_100028C18)
    v2 = dword_1000286D0 == -1;
  else
    v2 = 1;
  if (!v2)
  {
    v3 = (__IOSurface *)*((_QWORD *)&unk_100028B48 + dword_1000286D0 + 20);
    if (!(_BYTE)dword_100028BD4)
    {
      sub_10001357C(v3);
      v0 = qword_100028C18;
      v1 = dword_1000286D0;
    }
    IOMobileFramebufferSwapBegin(*(_QWORD *)(v0 + 72), (char *)&unk_100028B48 + 4 * v1 + 184);
    if (byte_100028C0C)
      IOMobileFramebufferSwapSetLayer(*(_QWORD *)(qword_100028C18 + 72), 0, qword_100028BF8, 0, 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1), 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1));
    v4 = IOMobileFramebufferSwapSetLayer(*(_QWORD *)(qword_100028C18 + 72), 1, v3, 0, 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1), 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1));
    if (byte_100028C0C)
    {
      v4 = IOMobileFramebufferSwapSetLayer(*(_QWORD *)(qword_100028C18 + 72), 2, 0, 0, 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1), 0.0, 0.0, (double)(unint64_t)xmmword_100028B88, (double)*((unint64_t *)&xmmword_100028B88 + 1));
      byte_100028C0C = 0;
    }
    result = IOMobileFramebufferSwapEnd(*(_QWORD *)(qword_100028C18 + 72), v4);
    dword_1000286D0 = 1 - dword_1000286D0;
  }
  return result;
}

uint64_t ramrod_display_set_background_color(char a1, char a2, char a3)
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  BYTE2(dword_100028BD4) = a1;
  HIBYTE(dword_100028BD4) = a2;
  byte_100028BD8 = a3;
  sub_100011948();
  return pthread_mutex_unlock(&stru_100028B48);
}

uint64_t ramrod_clear_ui()
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  if (qword_100028C68)
  {
    qword_100028C58 = 0;
    *(_QWORD *)&dword_100028C60 = 0;
    free((void *)qword_100028C68);
    qword_100028C68 = 0;
  }
  off_100028C30();
  sub_10001357C((__IOSurface *)qword_100028BF8);
  sub_100012388();
  return pthread_mutex_unlock(&stru_100028B48);
}

void sub_100012388()
{
  int v0;
  int v1;
  uint64_t i;
  __IOSurface *v3;

  if (qword_100028C68)
  {
    v0 = 0;
    if (dword_100028B98 > 179)
    {
      if (dword_100028B98 == 180)
      {
        v0 = ((int)xmmword_100028B88 - (int)qword_100028C58) / 2;
        v1 = dword_100028BB4 - 2 * dword_100028C60;
        goto LABEL_13;
      }
      v1 = 0;
      if (dword_100028B98 == 270)
      {
        v0 = dword_100028BB0 + 2 * qword_100028C58;
        goto LABEL_10;
      }
    }
    else
    {
      if (!dword_100028B98)
      {
        v0 = ((int)xmmword_100028B88 - (int)qword_100028C58) / 2;
        v1 = dword_100028BB4 + 2 * dword_100028C60;
        goto LABEL_13;
      }
      v1 = 0;
      if (dword_100028B98 == 90)
      {
        v0 = dword_100028BB0 - 2 * qword_100028C58;
LABEL_10:
        v1 = (DWORD2(xmmword_100028B88) - dword_100028C60) / 2;
      }
    }
  }
  else
  {
    v0 = 0;
    v1 = 0;
  }
LABEL_13:
  for (i = 0; i != 16; i += 8)
  {
    v3 = *(__IOSurface **)((char *)&unk_100028B48 + i + 160);
    if (v3)
    {
      sub_10001357C(v3);
      if (qword_100028C80)
        sub_1000135EC(*(__IOSurface **)((char *)&unk_100028B48 + i + 160), &qword_100028C70, dword_100028BA8, unk_100028BAC);
      if (qword_100028C68)
        sub_1000135EC(*(__IOSurface **)((char *)&unk_100028B48 + i + 160), &qword_100028C58, v0, v1);
    }
  }
}

BOOL ramrod_display_set_aux_image_path(const __CFString *a1, CFErrorRef *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char buffer[1024];

  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  if (qword_100028C68)
  {
    qword_100028C58 = 0;
    *(_QWORD *)&dword_100028C60 = 0;
    free((void *)qword_100028C68);
    qword_100028C68 = 0;
  }
  if (a1)
  {
    bzero(buffer, 0x400uLL);
    CFStringGetFileSystemRepresentation(a1, buffer, 1024);
    v4 = sub_100011E9C(buffer, &qword_100028C58, dword_100028B98);
    v12 = v4 != 0;
    if (v4)
    {
      sub_100012078((uint64_t)&qword_100028C58, 0);
    }
    else
    {
      ramrod_log_msg("failed to load image %s\n", v5, v6, v7, v8, v9, v10, v11, (char)buffer);
      ramrod_create_error_cf(a2, CFSTR("RamrodErrorDomain"), 3, 0, CFSTR("%s: unable to load image file %@"), v13, v14, v15, (char)"ramrod_display_set_aux_image_path");
    }
  }
  else
  {
    v12 = 1;
  }
  sub_100012388();
  ramrod_set_progress_UI(1, *(double *)&qword_1000286C8);
  pthread_mutex_unlock(&stru_100028B48);
  return v12;
}

BOOL ramrod_display_has_framebuffer()
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  return dword_100028C10 > 0;
}

BOOL ramrod_display_retry_framebuffer_create()
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  pthread_mutex_lock(&stru_100028B48);
  sub_100012738();
  pthread_mutex_unlock(&stru_100028B48);
  return dword_100028C10 > 0;
}

void sub_100012738()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *DisplayList;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  size_t Count;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  const void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  io_object_t v29;
  const void *v30;
  int v31;
  int v32;
  int v33;
  int v34;
  useconds_t v35;
  uint64_t v36;
  const char *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int DisplaySize;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  unsigned __int8 *v57;
  int v58;
  uint64_t v59;
  char v60;
  pthread_t v61[2];

  if (dword_100028C10 > 0)
    return;
  DisplayList = (const __CFArray *)IOMobileFramebufferCreateDisplayList(kCFAllocatorDefault);
  if (DisplayList)
    goto LABEL_3;
  v32 = dword_1000286E8;
  if (dword_1000286E8 >= 1)
  {
    v33 = dword_1000286E8 + 1;
    do
    {
      dword_1000286E8 = v32 - 1;
      v34 = 100000 * (v33 - v32);
      if (v34 >= 1000000)
        v35 = 1000000;
      else
        v35 = v34;
      usleep(v35);
      v36 = IOMobileFramebufferCreateDisplayList(kCFAllocatorDefault);
      v32 = dword_1000286E8;
    }
    while (dword_1000286E8 >= 1 && v36 == 0);
    DisplayList = (const __CFArray *)v36;
    if (v36)
    {
LABEL_3:
      v8 = (char *)qword_100028C20;
      if (qword_100028C20)
      {
        if (dword_100028C10 >= 1)
        {
          v9 = 0;
          v10 = 72;
          do
          {
            CFRelease(*(CFTypeRef *)&v8[v10]);
            v8 = (char *)qword_100028C20;
            *(_QWORD *)(qword_100028C20 + v10) = 0;
            ++v9;
            v10 += 80;
          }
          while (v9 < dword_100028C10);
        }
        free(v8);
        qword_100028C20 = 0;
      }
      dword_100028C10 = 0;
      Count = CFArrayGetCount(DisplayList);
      qword_100028C20 = (uint64_t)calloc(Count, 0x50uLL);
      if (!qword_100028C20)
      {
        v38 = "unable to allocate framebuffer display\n";
        goto LABEL_29;
      }
      v19 = sub_1000140C4(DisplayList, 0);
      if (qword_100028C18)
        goto LABEL_35;
      v19 = sub_1000140C4(DisplayList, 1);
      if (dword_100028C10 >= 1 && !*(_BYTE *)(qword_100028C20 + 80 * (dword_100028C10 - 1)))
      {
        ramrod_log_msg("attempting to power on display port\n", v12, v13, v14, v15, v16, v17, v18, v60);
        v20 = (const void *)__IOAVClassMatching("IOAVController", 0, 0, 0);
        if (v20)
        {
          v28 = wait_for_io_service_matching_dict(v20, 0xAu);
          if ((_DWORD)v28)
          {
            v29 = v28;
            v30 = (const void *)IOAVControllerCreateWithService(kCFAllocatorDefault, v28);
            IOObjectRelease(v29);
            if (v30)
            {
              v31 = IOAVControllerSetPower(v30, 1);
              CFRelease(v30);
              if (v31)
                ramrod_log_msg("unable to power on DisplayPort: 0x%x\n", v12, v13, v14, v15, v16, v17, v18, v31);
              goto LABEL_34;
            }
            v39 = "Unable to create IOAVController from service";
          }
          else
          {
            v39 = "timed out waiting for IOAVController service\n";
          }
        }
        else
        {
          v39 = "IOAVClassMatching returned no matching class for IOAVController\n";
        }
        ramrod_log_msg(v39, v21, v22, v23, v24, v25, v26, v27, v60);
      }
LABEL_34:
      if (qword_100028C18)
      {
LABEL_35:
        if (DisplayList)
          CFRelease(DisplayList);
        goto LABEL_37;
      }
      v38 = "unable to find a usable display\n";
LABEL_29:
      ramrod_log_msg(v38, v12, v13, v14, v15, v16, v17, v18, v60);
      goto LABEL_35;
    }
  }
  ramrod_log_msg("unable to get display list\n", v0, v1, v2, v3, v4, v5, v6, v60);
LABEL_37:
  if (!dword_100028C10)
  {
    v56 = "unable to get framebuffer\n";
LABEL_52:
    ramrod_log_msg(v56, v12, v13, v14, v15, v16, v17, v18, v60);
LABEL_53:
    sub_100014050();
    return;
  }
  off_100028C48(v19);
  v47 = qword_100028C18;
  if (!qword_100028C18)
  {
    if (!*(_BYTE *)qword_100028C20)
      goto LABEL_50;
    qword_100028C18 = qword_100028C20;
    ramrod_log_msg("%s: Will use %s\n", v40, v41, v42, v43, v44, v45, v46, (char)"create_framebuffer");
    v47 = qword_100028C18;
    if (!qword_100028C18)
      goto LABEL_50;
  }
  v61[0] = 0;
  v61[1] = 0;
  DisplaySize = IOMobileFramebufferGetDisplaySize(*(_QWORD *)(v47 + 72), v61);
  if (DisplaySize)
    ramrod_log_msg("unable to get display size: 0x%x\n", v49, v50, v51, v52, v53, v54, v55, DisplaySize);
  else
    xmmword_100028B88 = (__int128)vcvtq_u64_f64(*(float64x2_t *)v61);
  off_100028C28(dword_100028B9C, dword_100028B98);
  v57 = (unsigned __int8 *)qword_100028C18;
  if (!qword_100028C18
    || !*(_BYTE *)qword_100028C18
    || !*(_BYTE *)(qword_100028C18 + 1) && !*(_BYTE *)(qword_100028C20 + 80 * dword_100028C10 - 80))
  {
LABEL_50:
    v61[0] = 0;
    if (pthread_create(v61, 0, (void *(__cdecl *)(void *))sub_1000137A0, 0))
    {
      v56 = "unable to create hot plug thread\n";
      goto LABEL_52;
    }
    pthread_detach(v61[0]);
    v57 = (unsigned __int8 *)qword_100028C18;
    if (!qword_100028C18)
      goto LABEL_53;
  }
  v58 = sub_100013908(*((_QWORD *)v57 + 9), *v57);
  if (!*(_BYTE *)qword_100028C18)
  {
    v59 = off_100028C28(dword_100028B9C, dword_100028B98);
    off_100028C38(v59);
    sub_100012388();
  }
  if (*(_BYTE *)(qword_100028C20 + 80 * dword_100028C10 - 80) && v58)
    goto LABEL_53;
}

uint64_t ramrod_display_set_granular_progress(double a1)
{
  return ramrod_display_set_granular_progress_forced(0, a1);
}

uint64_t ramrod_display_set_progress(int a1)
{
  return ramrod_display_set_granular_progress_forced(0, (double)a1);
}

void sub_100012B3C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unint64_t v16;

  v0 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
  if (v0 == 3)
  {
    v9 = dword_100028B9C;
    v8 = 80 * dword_100028B9C;
    v10 = 239;
  }
  else if (v0 == 9)
  {
    v8 = (int)((double)*((unint64_t *)&xmmword_100028B88 + 1) * -0.06
             + (double)*((unint64_t *)&xmmword_100028B88 + 1) * 0.5
             + -45.0
             + -2.0);
    v9 = dword_100028B9C;
    v10 = 234;
  }
  else
  {
    v9 = dword_100028B9C;
    v8 = 56 * dword_100028B9C;
    v10 = 189;
  }
  v11 = v9 * v10;
  if (byte_100028BA4)
  {
    v12 = MGGetSInt32Answer(CFSTR("main-screen-class"), 0xFFFFFFFFLL);
    dword_100028BA0 = v12;
    if (v12 == 11)
      v13 = 286;
    else
      v13 = 224;
    if (v12 == 20)
      v8 = 254;
    else
      v8 = v13;
  }
  ramrod_log_msg("Progress Bar Y offset at %d, display class %d\n", v1, v2, v3, v4, v5, v6, v7, v8);
  v14 = dword_100028B98;
  if (dword_100028B98 > 179)
  {
    if (dword_100028B98 == 180)
    {
      v14 = 0;
      dword_100028BA8 = ((int)xmmword_100028B88 - (int)qword_100028C70) / 2;
      unk_100028BAC = (DWORD2(xmmword_100028B88) - dword_100028C78) / 2;
      dword_100028BB0 = (v11 + (int)xmmword_100028B88) / 2;
      v15 = (*((_QWORD *)&xmmword_100028B88 + 1) >> 1) - v8;
      v16 = 0xFFFFFFFFLL;
    }
    else
    {
      if (dword_100028B98 != 270)
        return;
      dword_100028BA8 = ((int)xmmword_100028B88 - (int)qword_100028C70) / 2;
      unk_100028BAC = (DWORD2(xmmword_100028B88) - dword_100028C78) / 2;
      dword_100028BB0 = v8 + ((unint64_t)xmmword_100028B88 >> 1);
      v15 = (v11 + DWORD2(xmmword_100028B88)) / 2;
      v16 = 0xFFFFFFFF00000000;
      v14 = 1;
    }
  }
  else if (dword_100028B98)
  {
    if (dword_100028B98 != 90)
      return;
    dword_100028BA8 = ((int)xmmword_100028B88 - (int)qword_100028C70) / 2;
    unk_100028BAC = (DWORD2(xmmword_100028B88) - dword_100028C78) / 2;
    dword_100028BB0 = ((unint64_t)xmmword_100028B88 >> 1) - v8;
    v15 = (DWORD2(xmmword_100028B88) - v11) / 2;
    v16 = (unint64_t)&_mh_execute_header;
    v14 = -1;
  }
  else
  {
    dword_100028BA8 = ((int)xmmword_100028B88 - (int)qword_100028C70) / 2;
    unk_100028BAC = (DWORD2(xmmword_100028B88) - dword_100028C78) / 2;
    dword_100028BB0 = ((int)xmmword_100028B88 - v11) / 2;
    v15 = v8 + (*((_QWORD *)&xmmword_100028B88 + 1) >> 1);
    v16 = 1;
  }
  dword_100028BB4 = v15;
  *(_QWORD *)&dword_100028BB8 = v16;
  dword_100028BC0 = v14;
  dword_100028BC4 = v16;
  dword_100028BC8 = v11 - 4;
}

uint64_t sub_100012E4C(int a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  char v13[1024];

  bzero(v13, 0x400uLL);
  if (sub_100011C28("/usr/share/progressui", "applelogo", a1, v13))
  {
    ramrod_log_msg("found applelogo at %s\n", v4, v5, v6, v7, v8, v9, v10, (char)v13);
    sub_100011E9C(v13, &qword_100028C70, a2);
  }
  else
  {
    ramrod_log_msg("unable to find a suitable applelogo for this hardware\n", v4, v5, v6, v7, v8, v9, v10, v12);
  }
  return sub_100012078((uint64_t)&qword_100028C70, 1);
}

void sub_100012F1C()
{
  pthread_once(&stru_1000286B0, (void (*)(void))sub_10001169C);
  if (qword_100028C80)
  {
    qword_100028C70 = 0;
    *(_QWORD *)&dword_100028C78 = 0;
    free((void *)qword_100028C80);
    qword_100028C80 = 0;
  }
}

void sub_100012F68(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  double v9;
  double v10;
  double v11;
  double v12;
  __IOSurface *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  int v32;
  unsigned __int8 *v33;
  uint64_t v34;
  int v35;
  int v36;
  int *v37;
  int *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;
  unsigned __int8 *v46;

  v9 = a1 - *(double *)&qword_100028C88;
  if (a1 - *(double *)&qword_100028C88 < 0.0)
    v9 = 0.0;
  if (*(double *)&qword_100028C88 > 0.0)
    v10 = v9;
  else
    v10 = a1;
  if (byte_100028C50 == 1)
    v11 = v10;
  else
    v11 = a1;
  if (v11 * (double)dword_100028BC8 / 100.0 >= (double)dword_100028BC8)
    v12 = (double)dword_100028BC8;
  else
    v12 = v11 * (double)dword_100028BC8 / 100.0;
  if ((dword_1000286D0 & 0x80000000) == 0)
  {
    v13 = (__IOSurface *)*((_QWORD *)&unk_100028B48 + dword_1000286D0 + 20);
    v14 = *((unsigned int *)&unk_100028B48 + dword_1000286D0 + 46);
    if ((_DWORD)v14)
      IOMobileFramebufferSwapWaitWithTimeout(*(_QWORD *)(qword_100028C18 + 72), v14, 0, 1.0);
    if (BYTE1(dword_100028BD4))
    {
      v15 = IOSurfaceGetBytesPerRow(v13) >> 2;
      v23 = (char *)IOSurfaceGetBaseAddress(v13) + 4 * (int)(dword_100028BB4 * v15);
      v24 = dword_100028B9C;
      if (dword_100028B9C < 5)
      {
        if (dword_100028B9C <= 0)
        {
          ramrod_log_msg("Warning: Detected scale is X%d, Supported scales are 1 to %d. Going to use X1 as a fallback.\n", v16, v17, v18, v19, v20, v21, v22, dword_100028B9C);
          v24 = 1;
        }
      }
      else
      {
        ramrod_log_msg("Warning: Detected scale is X%d, Supported scales are 1 to %d. Going to use X%d as a fallback.\n", v16, v17, v18, v19, v20, v21, v22, dword_100028B9C);
        v24 = 4;
      }
      v25 = 0;
      v26 = 0;
      v44 = (4 * v24);
      v46 = (unsigned __int8 *)*(&off_100025018 + 3 * (v24 - 1));
      v27 = *v46;
      while (1)
      {
        v28 = &dword_100028BDC;
        if (v11 <= 0.0)
        {
          v29 = *((_QWORD *)v46 + 2);
          if (v29)
          {
            v28 = &dword_100028BDC;
            goto LABEL_28;
          }
          v28 = &dword_100028BE0;
        }
        v29 = *((_QWORD *)v46 + 1);
LABEL_28:
        v30 = v25;
        v31 = (int *)&v23[4 * dword_100028BB0];
        v45 = v23;
        if ((_DWORD)v27)
        {
          v32 = *v28;
          v33 = (unsigned __int8 *)(v29 + v25);
          v34 = v27;
          do
          {
            v35 = *v33++;
            *v31 = sub_100013418(v35, v32);
            v31 += (int)(*(_DWORD *)algn_100028BBC * v15) + dword_100028BB8;
            --v34;
          }
          while (v34);
        }
        if (dword_100028BC8 >= 1)
        {
          v36 = 0;
          do
          {
            v37 = &dword_100028BDC;
            if (v36 >= (int)v12)
              v37 = &dword_100028BE0;
            *v31 = *v37;
            v31 += (int)(*(_DWORD *)algn_100028BBC * v15) + dword_100028BB8;
            ++v36;
          }
          while (v36 < dword_100028BC8);
        }
        v38 = &dword_100028BDC;
        if (v11 < 100.0)
        {
          v39 = *((_QWORD *)v46 + 2);
          if (v39)
          {
            v38 = &dword_100028BDC;
            if ((_DWORD)v27)
              goto LABEL_42;
            goto LABEL_44;
          }
          v38 = &dword_100028BE0;
        }
        v39 = *((_QWORD *)v46 + 1);
        if ((_DWORD)v27)
        {
LABEL_42:
          v40 = *v38;
          v41 = v39 + v30 - 1;
          v42 = v27;
          do
          {
            *v31 = sub_100013418(*(unsigned __int8 *)(v41 + v42), v40);
            v31 += (int)(*(_DWORD *)algn_100028BBC * v15) + dword_100028BB8;
            --v42;
          }
          while (v42);
        }
LABEL_44:
        v23 = &v45[4 * dword_100028BC4 * v15 + 4 * dword_100028BC0];
        ++v26;
        v25 = v30 + v27;
        if (v26 == v44)
          goto LABEL_45;
      }
    }
    ramrod_log_msg("Not updating screen progress since showprogress is set to false\n", v14, a4, a5, a6, a7, a8, a9, v43);
LABEL_45:
    sub_100012148();
  }
}

void sub_1000132C8()
{
  float v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
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

  dword_100028B9C = MGGetFloat32Answer(CFSTR("main-screen-scale"), 1.0);
  v0 = MGGetFloat32Answer(CFSTR("main-screen-orientation"), 0.0);
  dword_100028BA0 = MGGetSInt32Answer(CFSTR("main-screen-class"), 0xFFFFFFFFLL);
  v1 = MGGetSInt32Answer(CFSTR("DisplayBootRotation"), 0);
  ramrod_log_msg("display-boot-rotation = %d\n", v2, v3, v4, v5, v6, v7, v8, v1);
  v9 = v0 * 57.2957795;
  dword_100028B98 = (int)(v1 - llroundf(v9) + 360) % 360;
  ramrod_log_msg("display-scale = %d\n", v10, v11, v12, v13, v14, v15, v16, dword_100028B9C);
  ramrod_log_msg("display-rotation = %d\n", v17, v18, v19, v20, v21, v22, v23, dword_100028B98);
  if (dword_100028B98 > 179)
  {
    if (dword_100028B98 != 180 && dword_100028B98 != 270)
      goto LABEL_7;
  }
  else if (dword_100028B98 && dword_100028B98 != 90)
  {
LABEL_7:
    ramrod_log_msg("display-rotation value (%d) unsupported, not rotating images\n", v24, v25, v26, v27, v28, v29, v30, dword_100028B98);
    dword_100028B98 = 0;
  }
}

uint64_t sub_100013418(int a1, int a2)
{
  return ((((32897 * BYTE2(dword_100028BD4) * (a1 ^ 0xFFu)) >> 23) + ((32897 * BYTE2(a2) * a1) >> 23)) << 16) | ((((32897 * HIBYTE(dword_100028BD4) * (a1 ^ 0xFFu)) >> 23) + ((32897 * BYTE1(a2) * a1) >> 23)) << 8) | (((32897 * byte_100028BD8 * (a1 ^ 0xFFu)) >> 23) + ((32897 * a2 * a1) >> 23)) | 0xFF000000;
}

void sub_10001349C()
{
  dispatch_time_t v0;
  NSObject *global_queue;

  if (byte_100028C50 == 1)
  {
    v0 = dispatch_time(0, 1000000000);
    global_queue = dispatch_get_global_queue(2, 0);
    dispatch_after(v0, global_queue, &stru_1000250C8);
  }
}

void sub_100013500(id a1)
{
  float v1;
  double v2;
  double v3;

  sub_10001349C();
  pthread_mutex_lock(&stru_100028B48);
  v1 = *(double *)&qword_1000286C8;
  off_100028C40(v1);
  v2 = 1.0;
  if (*(double *)&qword_100028C88 == 0.0
    || (v3 = *(double *)&qword_100028C88 + -1.0, v2 = 0.0, *(double *)&qword_100028C88 + -1.0 < 0.0))
  {
    v3 = v2;
  }
  qword_100028C88 = *(_QWORD *)&v3;
  pthread_mutex_unlock(&stru_100028B48);
}

void sub_10001357C(__IOSurface *a1)
{
  unsigned int v2;
  unsigned int v3;
  void *BaseAddress;
  size_t AllocSize;
  int __pattern4;

  if (a1)
  {
    v2 = BYTE2(dword_100028BD4);
    v3 = *(unsigned __int16 *)((char *)&dword_100028BD4 + 3);
    BaseAddress = IOSurfaceGetBaseAddress(a1);
    AllocSize = IOSurfaceGetAllocSize(a1);
    __pattern4 = (__PAIR64__(v2, bswap32(v3)) >> 16) | 0xFF000000;
    memset_pattern4(BaseAddress, &__pattern4, AllocSize);
  }
}

void sub_1000135EC(__IOSurface *a1, uint64_t *a2, int a3, int a4)
{
  int BytesPerRow;
  char *BaseAddress;
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
  int *v20;
  char *v21;
  uint64_t v22;
  int v23;

  BytesPerRow = IOSurfaceGetBytesPerRow(a1);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
  v17 = *a2;
  if (*a2)
  {
    v18 = a2[1];
    if ((unint64_t)(v18 + a4) <= *((_QWORD *)&xmmword_100028B88 + 1)
      && v17 + a3 <= (unint64_t)xmmword_100028B88)
    {
      if (v18)
      {
        v19 = 0;
        v20 = (int *)a2[2];
        do
        {
          v21 = &BaseAddress[4 * a3 + ((v19 + a4) * BytesPerRow)];
          v22 = v17;
          do
          {
            v23 = *v20++;
            *(_DWORD *)v21 = v23;
            v21 += 4;
            --v22;
          }
          while (v22);
          ++v19;
        }
        while (v19 != v18);
      }
    }
    else
    {
      dword_100028C90 = a3;
      dword_100028C98 = a4;
      qword_100028CA8 = v17;
      qword_100028CA0 = v18;
      pthread_once(&stru_1000286D8, (void (*)(void))sub_100013718);
    }
  }
  else
  {
    ramrod_log_msg("%s: can't blit - image x offset greater that width [%d > %zu]\n", v10, v11, v12, v13, v14, v15, v16, (char)"display_blit_raw_image_limit");
  }
}

void sub_100013718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
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
  char v37;
  char v38;

  ramrod_log_msg("Can't blit image into display buffer since it overflows the display size!\n", a2, a3, a4, a5, a6, a7, a8, v37);
  ramrod_log_msg("Here is some image and display information to debug your overflow issue:\n", v9, v10, v11, v12, v13, v14, v15, v38);
  ramrod_log_msg("Display Info: width=%zu height=%zu\n", v16, v17, v18, v19, v20, v21, v22, xmmword_100028B88);
  ramrod_log_msg("Image Info: xoff=%d yoff=%d height=%zu width=%zu\n", v23, v24, v25, v26, v27, v28, v29, dword_100028C90);
  ramrod_log_msg("This message will only be logged once for all failed blits!\n", v30, v31, v32, v33, v34, v35, v36, a9);
}

uint64_t sub_1000137A0()
{
  __CFRunLoop *Current;
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
  uint64_t v16;
  int v17;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  char v28;
  char v29;

  Current = CFRunLoopGetCurrent();
  ramrod_log_msg("starting display hot plug thread\n", v1, v2, v3, v4, v5, v6, v7, v27);
  if (dword_100028C10 < 1)
    goto LABEL_12;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  do
  {
    if (!*(_BYTE *)(qword_100028C20 + v15))
    {
      RunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetRunLoopSource(*(_QWORD *)(qword_100028C20 + v15 + 72), 0);
      if (RunLoopSource)
      {
        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
        if (IOMobileFramebufferEnableHotPlugDetectNotifications(*(_QWORD *)(qword_100028C20 + v15 + 72), sub_100014298))ramrod_log_msg("unable to register for hot plug notifications on %s: 0x%x\n", v8, v9, v10, v11, v12, v13, v14, qword_100028C20 + v15 + 2);
        else
          ++v17;
      }
    }
    ++v16;
    v15 += 80;
  }
  while (v16 < dword_100028C10);
  if (v17 <= 0)
  {
LABEL_12:
    ramrod_log_msg("no external displays registered for hot plug notifications\n", v8, v9, v10, v11, v12, v13, v14, v28);
  }
  else
  {
    ramrod_log_msg("listening for hot plug notifications from %d display%s\n", v8, v9, v10, v11, v12, v13, v14, v17);
    CFRunLoopRun();
  }
  ramrod_log_msg("display hot plug thread exiting\n", v19, v20, v21, v22, v23, v24, v25, v29);
  return 0;
}

uint64_t sub_100013908(uint64_t a1, int a2)
{
  int DisplaySize;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  __int128 v20;
  __CFDictionary *Mutable;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __CFDictionary *v29;
  int v30;
  __IOSurface *v31;
  uint64_t v32;
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
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int SupportedDigitalOutModes;
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
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  SInt32 v90;
  SInt32 v91;
  int v92;
  CFIndex v93;
  int v94;
  const __CFDictionary *v95;
  const __CFDictionary *ValueAtIndex;
  int v97;
  uint64_t v98;
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
  int v112;
  const __CFString *v114;
  const __CFString *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  CFComparisonResult v123;
  const char *v124;
  uint64_t result;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const __CFData *Value;
  const __CFData *v134;
  CFTypeID v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const __CFNumber *v151;
  const __CFArray *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  CFIndex v160;
  const __CFDictionary *v161;
  const __CFNumber *v162;
  const __CFNumber *v163;
  const __CFNumber *v164;
  const __CFNumber *v165;
  char v166;
  int v167;
  const __CFNumber *v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  double v172;
  double v173;
  uint64_t v174;
  uint64_t v175;
  size_t v176[2];
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  int v181;
  int v182;
  uint64_t v183;
  CFArrayRef v184;
  CFArrayRef v185;
  SInt32 valuePtr[4];
  CFRange v187;

  v172 = 0.0;
  v173 = 0.0;
  if (!a2)
  {
    v181 = 0;
    v11 = IOMobileFramebufferSetDisplayDevice(*(_QWORD *)(qword_100028C18 + 72), 2);
    if (v11)
    {
      ramrod_log_msg("unable to set display device: 0x%x\n", v12, v13, v14, v15, v16, v17, v18, v11);
      return 0xFFFFFFFFLL;
    }
    v184 = 0;
    v185 = 0;
    v183 = 0;
    SupportedDigitalOutModes = IOMobileFramebufferGetSupportedDigitalOutModes(*(_QWORD *)(qword_100028C18 + 72), &v185, &v184);
    if (SupportedDigitalOutModes)
    {
      ramrod_log_msg("unable to get color and timing modes: 0x%x\n", v63, v64, v65, v66, v67, v68, v69, SupportedDigitalOutModes);
      return 0xFFFFFFFFLL;
    }
    if (!v184)
    {
      ramrod_log_msg("NULL timing (%p) modes\n", v63, v64, v65, v66, v67, v68, v69, 0);
      return 0xFFFFFFFFLL;
    }
    LODWORD(v176[0]) = 0;
    *(_QWORD *)valuePtr = 0;
    v171 = a1;
    if (sub_100014634((uint64_t)CFSTR("ramrod-display-width"), (SInt32 *)v176, v64, v65, v66, v67, v68, v69)|| sub_100014634((uint64_t)CFSTR("ramrod-display-height"), &valuePtr[1], v70, v71, v72, v73, v74, v75)|| sub_100014634((uint64_t)CFSTR("ramrod-display-rate"), valuePtr, v76, v77, v78, v79, v80, v81))
    {
      v89 = 0;
      v90 = 0;
      v91 = 0;
      v92 = 0;
    }
    else
    {
      v92 = v176[0];
      v90 = valuePtr[0];
      v91 = valuePtr[1];
      ramrod_log_msg("NVRAM specified preferred display settings %d x %d @ %d\n", v82, v83, v84, v85, v86, v87, v88, v176[0]);
      v89 = 1;
    }
    if (CFArrayGetCount(v184) < 1)
      goto LABEL_51;
    v93 = 0;
    v94 = 0;
    v95 = 0;
    v182 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v184, v93);
      sub_100014490(ValueAtIndex, (_DWORD *)&v183 + 1, &v183, &v182, &v181);
      v97 = v182;
      ramrod_log_msg("%ld: %d x %d @ %d (score = %d)\n", v98, v99, v100, v101, v102, v103, v104, v93);
      v112 = HIDWORD(v183) == v92 ? v89 : 0;
      if (v97 == v90 && v112 && (_DWORD)v183 == v91)
        break;
      if (v181 > v94)
      {
        v95 = ValueAtIndex;
        v94 = v181;
      }
      if (++v93 >= CFArrayGetCount(v184))
        goto LABEL_47;
    }
    ramrod_log_msg("Found display matching NVRAM preferred settings\n", v105, v106, v107, v108, v109, v110, v111, v169);
    v95 = ValueAtIndex;
LABEL_47:
    if (!v95)
    {
LABEL_51:
      v124 = "unable to find usable timing mode\n";
      goto LABEL_64;
    }
    *(_QWORD *)valuePtr = 0;
    *(_OWORD *)v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v179 = 0u;
    v180 = 0u;
    sub_100014490(v95, (_DWORD *)&v183 + 1, &v183, &v182, &v181);
    ramrod_log_msg("using %d x %d @ %d (score = %d)\n", v126, v127, v128, v129, v130, v131, v132, SBYTE4(v183));
    Value = (const __CFData *)CFDictionaryGetValue(v95, CFSTR("ElementData"));
    if (Value && (v134 = Value, v135 = CFGetTypeID(Value), v135 == CFDataGetTypeID()))
    {
      v187.location = 0;
      v187.length = 80;
      CFDataGetBytes(v134, v187, (UInt8 *)v176);
      HIDWORD(v180) = 0;
      ramrod_log_msg("timing_data_struct\n activeVerticalAxis: %d\n activeHorizontalAxis: %d\n interlaced: %d\n pixelClock: %d\n ratioType: %d\n scanInformation: %d\n", v136, v137, v138, v139, v140, v141, v142, SBYTE8(v178));
      v143 = IOAVGetCEAVideoShortIDWithData(v176);
      ramrod_log_msg("cea_id = %d\n", v144, v145, v146, v147, v148, v149, v150, v143);
    }
    else
    {
      v143 = 0;
    }
    v151 = (const __CFNumber *)CFDictionaryGetValue(v95, CFSTR("ID"));
    CFNumberGetValue(v151, kCFNumberSInt32Type, valuePtr);
    v152 = (const __CFArray *)CFDictionaryGetValue(v95, CFSTR("ColorModes"));
    v185 = v152;
    if (v152 && CFArrayGetCount(v152) >= 1)
    {
      v160 = 0;
      while (1)
      {
        v174 = 0;
        v175 = 0;
        v161 = (const __CFDictionary *)CFArrayGetValueAtIndex(v185, v160);
        v162 = (const __CFNumber *)CFDictionaryGetValue(v161, CFSTR("PixelEncoding"));
        CFNumberGetValue(v162, kCFNumberIntType, (char *)&v175 + 4);
        if (!HIDWORD(v175))
        {
          v163 = (const __CFNumber *)CFDictionaryGetValue(v161, CFSTR("Depth"));
          CFNumberGetValue(v163, kCFNumberIntType, &v175);
          if ((_DWORD)v175 == 8)
          {
            v164 = (const __CFNumber *)CFDictionaryGetValue(v161, CFSTR("EOTF"));
            CFNumberGetValue(v164, kCFNumberIntType, (char *)&v174 + 4);
            if (!HIDWORD(v174))
            {
              v165 = (const __CFNumber *)CFDictionaryGetValue(v161, CFSTR("DynamicRange"));
              CFNumberGetValue(v165, kCFNumberIntType, &v174);
              if ((_DWORD)v174 == v143 > 1)
                break;
            }
          }
        }
        if (++v160 >= CFArrayGetCount(v185))
          goto LABEL_61;
      }
      v168 = (const __CFNumber *)CFDictionaryGetValue(v161, CFSTR("ID"));
      CFNumberGetValue(v168, kCFNumberSInt32Type, &valuePtr[1]);
      v166 = valuePtr[1];
    }
    else
    {
LABEL_61:
      v166 = 0;
    }
    ramrod_log_msg("Setting Digital out mode - ColorID: %d timingID: %d", v153, v154, v155, v156, v157, v158, v159, v166);
    v167 = IOMobileFramebufferSetDigitalOutMode(*(_QWORD *)(qword_100028C18 + 72), valuePtr[1], valuePtr[0]);
    a1 = v171;
    if (v167)
    {
      v169 = v167;
      v124 = "unable to set color and timing modes: 0x%x\n";
      goto LABEL_64;
    }
  }
  DisplaySize = IOMobileFramebufferGetDisplaySize(a1, &v172);
  if (DisplaySize)
  {
    ramrod_log_msg("unable to get display size: 0x%x\n", v4, v5, v6, v7, v8, v9, v10, DisplaySize);
    return 0xFFFFFFFFLL;
  }
  v170 = a1;
  *(_QWORD *)&xmmword_100028B88 = (unint64_t)v172;
  *((_QWORD *)&xmmword_100028B88 + 1) = (unint64_t)v173;
  byte_100028C0C = 1;
  ramrod_log_msg("display: %zu x %zu\n", v4, v5, v6, v7, v8, v9, v10, (unint64_t)v172);
  off_100028C38();
  for (i = 0; i != 3; ++i)
  {
    v20 = xmmword_100028B88;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      *((_QWORD *)&unk_100028B48 + i + 20) = 0;
LABEL_20:
      ramrod_log_msg("unable to create display buffer %i\n", v22, v23, v24, v25, v26, v27, v28, i);
      return 0xFFFFFFFFLL;
    }
    v29 = Mutable;
    sub_10001477C(Mutable, kIOSurfaceBytesPerRow, (4 * v20 + 63) & 0xFFFFFFC0);
    sub_10001477C(v29, kIOSurfaceWidth, v20);
    sub_10001477C(v29, kIOSurfaceHeight, SDWORD2(v20));
    sub_10001477C(v29, kIOSurfacePixelFormat, 1111970369);
    sub_10001477C(v29, kIOSurfaceBytesPerElement, 4);
    if ((_get_cpu_capabilities() & 0x800) != 0)
      v30 = 1792;
    else
      v30 = 1024;
    sub_10001477C(v29, kIOSurfaceCacheMode, v30);
    v31 = IOSurfaceCreate(v29);
    CFRelease(v29);
    *((_QWORD *)&unk_100028B48 + i + 20) = v31;
    if (!v31)
      goto LABEL_20;
    if (IOSurfaceLock(v31, 0, 0))
    {
      ramrod_log_msg("unable to lock display buffer %i: 0x%x\n", v32, v33, v34, v35, v36, v37, v38, i);
      return 0xFFFFFFFFLL;
    }
  }
  sub_10001357C((__IOSurface *)qword_100028BF8);
  sub_100012388();
  v176[0] = 128;
  v39 = sysctlbyname("hw.target", &unk_100028CB0, v176, 0, 0);
  ramrod_log_msg("%s: HW.target returned: %s\n", v40, v41, v42, v43, v44, v45, v46, (char)"skip_display_poweron_for_device");
  if (!v39)
  {
    v114 = (const __CFString *)MGCopyAnswer(CFSTR("DeviceName"), 0);
    if (v114)
    {
      v115 = v114;
      CFStringGetCStringPtr(v114, 0x8000100u);
      ramrod_log_msg("%s: DeviceName is: %s\n", v116, v117, v118, v119, v120, v121, v122, (char)"skip_display_poweron_for_device");
      v123 = CFStringCompare(CFSTR("Apple Display"), v115, 1uLL);
      CFRelease(v115);
      if (v123 == kCFCompareEqualTo)
      {
        v124 = "Display-less device detected. Skipping poweron entirely\n";
LABEL_64:
        ramrod_log_msg(v124, v47, v48, v49, v50, v51, v52, v53, v169);
        return 0xFFFFFFFFLL;
      }
    }
  }
  ramrod_log_msg("powering on display\n", v47, v48, v49, v50, v51, v52, v53, v169);
  v54 = IOMobileFramebufferRequestPowerChange(v170, 1);
  if (v54)
  {
    ramrod_log_msg("IOMobileFramebufferRequestPowerChange failed: %x\n", v55, v56, v57, v58, v59, v60, v61, v54);
    return 0xFFFFFFFFLL;
  }
  IOMobileFramebufferSwapWait(v170, 0, 3);
  result = 0;
  dword_1000286D0 = 0;
  return result;
}

void sub_100014050()
{
  uint64_t v0;
  CFTypeRef *v1;
  __IOSurface *v2;

  v0 = 0;
  xmmword_100028B88 = 0uLL;
  do
  {
    v1 = (CFTypeRef *)((char *)&unk_100028B48 + v0);
    v2 = *(__IOSurface **)((char *)&unk_100028B48 + v0 + 160);
    if (v2)
    {
      IOSurfaceUnlock(v2, 0, 0);
      CFRelease(v1[20]);
      v1[20] = 0;
    }
    v0 += 8;
  }
  while (v0 != 24);
  dword_1000286D0 = -1;
}

CFIndex sub_1000140C4(const __CFArray *a1, int a2)
{
  CFIndex result;
  CFIndex i;
  uint64_t *ValueAtIndex;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  BOOL *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;

  result = CFArrayGetCount(a1);
  if (result >= 1)
  {
    for (i = 0; i < result; ++i)
    {
      ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(a1, i);
      if (*((_DWORD *)ValueAtIndex + 2) == a2)
      {
        v7 = ValueAtIndex;
        v8 = qword_100028C20;
        v9 = dword_100028C10;
        v10 = (BOOL *)(qword_100028C20 + 80 * dword_100028C10);
        if (!CFStringGetCString((CFStringRef)*ValueAtIndex, (char *)v10 + 2, 64, 0x8000100u))
          __strlcpy_chk(v10 + 2, "Unknown Display", 64, 64);
        ramrod_log_msg("found display: %s\n", v11, v12, v13, v14, v15, v16, v17, (_BYTE)v10 + 2);
        v18 = *v7;
        v19 = (uint64_t *)(v8 + 80 * v9 + 72);
        v20 = IOMobileFramebufferOpenByName(v18, v19);
        if (v20)
        {
          ramrod_log_msg("unable to open framebuffer: 0x%x\n", v21, v22, v23, v24, v25, v26, v27, v20);
        }
        else
        {
          ++dword_100028C10;
          v28 = v8 + 80 * v9;
          *(_BYTE *)(v28 + 1) = 0;
          v29 = (BOOL *)(v28 + 1);
          *v10 = a2 == 0;
          v30 = *v19;
          v39 = 0;
          if (!a2)
          {
            v38 = 1;
            v39 = 1;
LABEL_13:
            *v29 = v38 == 1;
            if (v38 == 1 && !qword_100028C18)
            {
              qword_100028C18 = (uint64_t)v10;
              ramrod_log_msg("Will use display %s\n", v21, v22, v23, v24, v25, v26, v27, (_BYTE)v10 + 2);
              LOBYTE(v38) = v39;
            }
            ramrod_log_msg("Display state is %d\n", v21, v22, v23, v24, v25, v26, v27, v38);
            goto LABEL_17;
          }
          if (!IOMobileFramebufferGetDigitalOutState(v30, &v39))
          {
            v38 = v39;
            goto LABEL_13;
          }
          ramrod_log_msg("%s: Failed to query digital out state %08x\n", v21, v22, v23, v24, v25, v26, v27, (char)"get_display_state");
          ramrod_log_msg("Unable to get state of %s\n", v31, v32, v33, v34, v35, v36, v37, (_BYTE)v10 + 2);
        }
      }
LABEL_17:
      result = CFArrayGetCount(a1);
    }
  }
  return result;
}

uint64_t sub_100014298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  __IOSurface *v23;
  int v24;
  uint64_t v25;

  v8 = a3;
  ramrod_log_msg("%s: display %s %s\n", a2, a3, a4, a5, a6, a7, a8, (char)"display_hot_plug");
  v11 = pthread_mutex_lock((pthread_mutex_t *)&unk_100028B48);
  v19 = (_BYTE *)qword_100028C18;
  if (a2)
  {
    *(_BYTE *)(v8 + 1) = 1;
    if (!v19 || !v19[1])
      goto LABEL_16;
  }
  else
  {
    *(_BYTE *)(v8 + 1) = 0;
    if (v19 == (_BYTE *)v8)
    {
      ramrod_log_msg("%s: %s was active", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
    }
    else if (v19)
    {
      goto LABEL_17;
    }
    v20 = dword_100028C10;
    v8 = qword_100028C20;
    if (dword_100028C10 >= 1)
    {
      v21 = qword_100028C20 + 2;
      while (!*(_BYTE *)(v21 - 1))
      {
        v21 += 80;
        if (!--v20)
          goto LABEL_13;
      }
      v8 = v21 - 2;
      goto LABEL_16;
    }
LABEL_13:
    if (*(_BYTE *)qword_100028C20)
    {
LABEL_16:
      ramrod_log_msg("%s: Will use %s\n", v12, v13, v14, v15, v16, v17, v18, (char)"display_hot_plug");
      v19 = (_BYTE *)v8;
      goto LABEL_17;
    }
    v19 = 0;
  }
LABEL_17:
  if ((_BYTE *)qword_100028C18 != v19)
  {
    if (qword_100028C18)
    {
      if (*(_BYTE *)qword_100028C18)
        v22 = dword_1000286D0 == -1;
      else
        v22 = 1;
      if (!v22)
      {
        v23 = (__IOSurface *)*((_QWORD *)&unk_100028B48 + dword_1000286D0 + 20);
        if (v23)
        {
          sub_10001357C(v23);
          sub_100012148();
        }
      }
      sub_100014050();
    }
    qword_100028C18 = (uint64_t)v19;
    if (v19)
    {
      if (*v19)
      {
        off_100028C48(v11);
        v24 = *(unsigned __int8 *)qword_100028C18;
      }
      else
      {
        v24 = 0;
      }
      if (!sub_100013908(a1, v24))
      {
        v25 = off_100028C28(dword_100028B9C, dword_100028B98);
        off_100028C38(v25);
        sub_100012388();
        if (*(double *)&qword_1000286C8 != -1.0)
          off_100028C40(*(double *)&qword_1000286C8);
      }
    }
  }
  return pthread_mutex_unlock((pthread_mutex_t *)&unk_100028B48);
}

const __CFNumber *sub_100014490(const __CFDictionary *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  const __CFDictionary *Value;
  const __CFDictionary *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  CFTypeID v20;
  const __CFNumber *result;
  const __CFNumber *v22;
  CFTypeID v23;
  int valuePtr;

  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("HorizontalAttributes"));
  v11 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("VerticalAttributes"));
  if (Value)
  {
    v12 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("Active"));
    if (v12)
    {
      v13 = v12;
      v14 = CFGetTypeID(v12);
      if (v14 == CFNumberGetTypeID())
        CFNumberGetValue(v13, kCFNumberIntType, a2);
    }
  }
  if (v11)
  {
    valuePtr = 0;
    v15 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("Active"));
    if (v15)
    {
      v16 = v15;
      v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID())
        CFNumberGetValue(v16, kCFNumberIntType, a3);
    }
    v18 = (const __CFNumber *)CFDictionaryGetValue(v11, CFSTR("SyncRate"));
    if (v18)
    {
      v19 = v18;
      v20 = CFGetTypeID(v18);
      if (v20 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
        *a4 = (int)((float)((float)valuePtr * 0.000015259) + 0.5);
      }
    }
  }
  result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Score"));
  if (result)
  {
    v22 = result;
    v23 = CFGetTypeID(result);
    result = (const __CFNumber *)CFNumberGetTypeID();
    if ((const __CFNumber *)v23 == result)
      return (const __CFNumber *)CFNumberGetValue(v22, kCFNumberIntType, a5);
  }
  return result;
}

uint64_t sub_100014634(uint64_t a1, SInt32 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFString *v9;
  const __CFString *v10;
  CFTypeID v11;
  SInt32 IntValue;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const UInt8 *BytePtr;
  const UInt8 *v23;
  CFIndex Length;
  const __CFString *v25;
  const __CFString *v26;
  char v28;
  int valuePtr;

  if (!a1)
  {
    v13 = "can't fetch NVRAM value with NULL key\n";
LABEL_8:
    ramrod_log_msg(v13, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v28);
    return 2;
  }
  if (!a2)
  {
    v13 = "can't load nil pointer with NVRAM value\n";
    goto LABEL_8;
  }
  v9 = (const __CFString *)ramrod_copy_NVRAM_variable();
  if (v9)
  {
    v10 = v9;
    valuePtr = -1;
    v11 = CFGetTypeID(v9);
    if (v11 == CFStringGetTypeID())
    {
      IntValue = CFStringGetIntValue(v10);
    }
    else if (v11 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)v10, kCFNumberIntType, &valuePtr);
      IntValue = valuePtr;
    }
    else
    {
      if (v11 != CFDataGetTypeID())
      {
        ramrod_log_msg("can't convert unsupported CFType to int\n", v15, v16, v17, v18, v19, v20, v21, v28);
        goto LABEL_19;
      }
      BytePtr = CFDataGetBytePtr((CFDataRef)v10);
      if (!BytePtr)
        goto LABEL_19;
      v23 = BytePtr;
      Length = CFDataGetLength((CFDataRef)v10);
      v25 = CFStringCreateWithBytes(kCFAllocatorDefault, v23, Length, 0x8000100u, 0);
      if (!v25)
        goto LABEL_19;
      v26 = v25;
      IntValue = CFStringGetIntValue(v25);
      CFRelease(v26);
    }
    if (IntValue != -1)
    {
      v14 = 0;
      *a2 = IntValue;
LABEL_20:
      CFRelease(v10);
      return v14;
    }
LABEL_19:
    v14 = 3;
    goto LABEL_20;
  }
  return 2;
}

void sub_10001477C(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v5);
}

BOOL ramrod_check_NVRAM_access()
{
  io_object_t v0;
  io_object_t v1;

  v0 = wait_for_io_service_matching_resource_with_timeout("IONVRAM", 0);
  v1 = v0;
  if (v0)
    IOObjectRelease(v0);
  return v1 != 0;
}

CFTypeRef ramrod_copy_NVRAM_variable_from_devicetree(CFStringRef theString)
{
  const __CFString *Copy;
  io_registry_entry_t v2;
  CFTypeRef CFProperty;
  io_registry_entry_t v5;

  Copy = CFStringCreateCopy(0, theString);
  v2 = atomic_load((unsigned int *)&unk_100028D30);
  if (!v2)
  {
    v5 = IORegistryEntryFromPath(kIOMasterPortDefault, "IODeviceTree:/options");
    if (v5)
    {
      while (1)
      {
        v2 = __ldaxr((unsigned int *)&unk_100028D30);
        if (v2)
          break;
        if (!__stlxr(v5, (unsigned int *)&unk_100028D30))
        {
          v2 = v5;
          goto LABEL_2;
        }
      }
      __clrex();
      IOObjectRelease(v5);
    }
    else
    {
      v2 = 0;
    }
  }
LABEL_2:
  CFProperty = IORegistryEntryCreateCFProperty(v2, Copy, 0, 0);
  CFRelease(Copy);
  return CFProperty;
}

uint64_t ramrod_load_tga(const char *a1, _QWORD *a2, unint64_t *a3, _QWORD *a4)
{
  char v7;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  size_t st_size;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 *v36;
  unsigned int v37;
  BOOL v38;
  int v39;
  unint64_t v40;
  int *v42;
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
  unint64_t v53;
  char *v54;
  uint64_t v55;
  char v56;
  char v57;
  char v58;
  char v59;
  unint64_t v60;
  uint64_t v61;
  unsigned int v62;
  char *v63;
  unint64_t v64;
  char *v65;
  uint64_t v66;
  char v67;
  char v68;
  int v69;
  char v70;
  char v71;
  uint64_t v72;
  int v73;
  char *v74;
  BOOL v75;
  uint64_t v76;
  char *v77;
  unint64_t v78;
  uint64_t v79;
  unsigned __int8 v80;
  stat v81;

  v7 = (char)a1;
  memset(&v81, 0, sizeof(v81));
  v8 = open(a1, 0, 0);
  if ((v8 & 0x80000000) == 0)
  {
    v9 = v8;
    if (fstat(v8, &v81))
    {
      v10 = __error();
      strerror(*v10);
      ramrod_log_msg("unable to stat image '%s': %s\n", v11, v12, v13, v14, v15, v16, v17, v7);
LABEL_4:
      v18 = 0;
LABEL_25:
      close(v9);
      return v18;
    }
    st_size = v81.st_size;
    v28 = (unsigned __int8 *)mmap(0, v81.st_size, 1, 2, v9, 0);
    if (v28 == (unsigned __int8 *)-1)
    {
      v42 = __error();
      strerror(*v42);
      ramrod_log_msg("unable to mmap image '%s': %s\n", v43, v44, v45, v46, v47, v48, v49, v7);
      goto LABEL_4;
    }
    v36 = v28;
    if (st_size >= 0x13
      && v28[1] <= 1u
      && ((v37 = v28[2], v37 <= 0xB) ? (v38 = ((1 << v37) & 0xE0E) == 0) : (v38 = 1),
          !v38
       && v28[7] <= 0x20u
       && (v28[12] || v28[13])
       && (v28[14] || v28[15])
       && (v39 = v28[16], HIDWORD(v40) = v39, LODWORD(v40) = (v39 << 24) - 0x8000000, (v40 >> 27) <= 3u)
       && v28[17] < 0x40u))
    {
      if (!v28[1] && v37 >= 0xA)
      {
        v50 = *((unsigned __int16 *)v28 + 6);
        if (*((_WORD *)v28 + 6))
        {
          if (*((_WORD *)v28 + 7))
          {
            v51 = *v28;
            if (v39 == 24 || v39 == 32)
            {
              v52 = 4 * v50;
              v53 = *((unsigned __int16 *)v28 + 7);
              v79 = *((unsigned __int16 *)v28 + 6);
              v80 = v28[17];
              v54 = (char *)malloc((4 * v50) * v53);
              v55 = 0;
              v56 = 0;
              v57 = 0;
              v58 = 0;
              v59 = 0;
              v60 = 0;
              v61 = 0;
              v62 = v53 - 1;
              if ((v80 & 0x20) != 0)
                v62 = 0;
              v63 = &v54[v62 * (unint64_t)v52];
              v64 = st_size - v51 - 18;
              v65 = (char *)&v36[v51 + 18];
              v66 = 1 - v79;
              while (1)
              {
                if (!v64)
                {
LABEL_69:
                  if (v54)
                    free(v54);
                  goto LABEL_23;
                }
                v68 = *v65++;
                v67 = v68;
                v69 = v68;
                --v64;
                if (v68 >= 0)
                  v70 = 1;
                else
                  v70 = -127;
                v71 = v70 + v67;
                if (v39 == 24)
                {
                  if (v71)
                  {
                    v76 = 0;
                    v77 = &v63[4 * v61 + 1];
                    while (1)
                    {
                      if ((v69 & 0x80000000) == 0 || !(_DWORD)v76)
                      {
                        v75 = v64 >= 3;
                        v64 -= 3;
                        if (!v75)
                          goto LABEL_69;
                        v57 = *v65;
                        v58 = v65[1];
                        v59 = v65[2];
                        v65 += 3;
                      }
                      *(v77 - 1) = v57;
                      *v77 = v58;
                      v77[1] = v59;
                      v77[2] = -1;
                      if (!(v66 + v61 + v76))
                        goto LABEL_64;
                      ++v76;
                      v77 += 4;
                      if ((v69 + v70) == (_DWORD)v76)
                      {
                        v61 += v76;
                        break;
                      }
                    }
                  }
                }
                else if (v71)
                {
                  v72 = 0;
                  v73 = (v69 + v70);
                  v74 = &v63[4 * v61 + 1];
                  while (1)
                  {
                    if ((v69 & 0x80000000) == 0 || !(_DWORD)v72)
                    {
                      v75 = v64 >= 4;
                      v64 -= 4;
                      if (!v75)
                        goto LABEL_69;
                      v56 = v65[3];
                      if (v56)
                      {
                        v57 = *v65;
                        v58 = v65[1];
                        v59 = v65[2];
                      }
                      else
                      {
                        v59 = 0;
                        v58 = 0;
                        v57 = 0;
                      }
                      v65 += 4;
                    }
                    *(v74 - 1) = v59;
                    *v74 = v58;
                    v74[1] = v57;
                    v74[2] = v56;
                    if (!(v66 + v61 + v72))
                      break;
                    ++v72;
                    v74 += 4;
                    if (v73 == (_DWORD)v72)
                    {
                      v61 += v72;
                      goto LABEL_67;
                    }
                  }
LABEL_64:
                  v61 = 0;
                  v78 = v53 - 2 + v55;
                  if ((v80 & 0x20) != 0)
                    v78 = v60 + 1;
                  ++v60;
                  v63 = &v54[v78 * v52];
                }
LABEL_67:
                v55 = -(uint64_t)v60;
                if (v60 >= v53)
                {
                  *a2 = v79;
                  *a3 = v53;
                  v18 = 1;
                  *a4 = v54;
                  goto LABEL_24;
                }
              }
            }
          }
        }
      }
      ramrod_log_msg("image '%s' is an unsupported TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }
    else
    {
      ramrod_log_msg("image '%s' is not a TGA\n", v29, v30, v31, v32, v33, v34, v35, v7);
    }
LABEL_23:
    v18 = 0;
LABEL_24:
    munmap(v36, st_size);
    goto LABEL_25;
  }
  v19 = __error();
  strerror(*v19);
  ramrod_log_msg("unable to open image '%s': %s\n", v20, v21, v22, v23, v24, v25, v26, v7);
  return 0;
}

uint64_t ramrod_log_msg_to_fd(uint64_t a1, uint64_t a2, int __fd)
{
  uint64_t result;
  uint64_t v7;
  ssize_t v8;

  result = 0;
  if (a1 && a2)
  {
    v7 = 0;
    while (1)
    {
      v8 = write(__fd, (const void *)(a1 + v7), a2 - v7);
      if (v8 == -1)
        break;
      v7 += v8;
      if (v7 == a2)
        return 0;
    }
    return *__error();
  }
  return result;
}

uint64_t ramrod_write_full_log_buffer_to_fd(int __fd)
{
  uint64_t v1;
  BOOL v2;
  uint64_t v4;
  size_t v5;

  v1 = qword_100028D40;
  if (qword_100028D38)
    v2 = qword_100028D40 == 0;
  else
    v2 = 1;
  if (!v2
    && ((v4 = qword_100028D48, (v5 = ((int)qword_100028D48 - (int)qword_100028D38) & 0xFFFFFLL) != 0)
     && write(__fd, (const void *)qword_100028D38, v5) == -1
     || v1 != v4 && write(__fd, (const void *)qword_100028D48, v1 - v4) == -1))
  {
    return *__error();
  }
  else
  {
    return 0;
  }
}

uint64_t ramrod_add_log_fd(int a1)
{
  __CFSet *Mutable;
  FILE *v3;
  const char *v4;
  size_t v5;
  CFNumberRef v6;
  uint64_t v7;
  stat v9;
  int valuePtr;

  valuePtr = a1;
  memset(&v9, 0, sizeof(v9));
  pthread_mutex_lock(&stru_1000286F0);
  pthread_mutex_lock(&stru_100028730);
  if (fstat(a1, &v9) || ((__int16)v9.st_mode & 0x80000000) == 0)
  {
    Mutable = (__CFSet *)*((_QWORD *)&xmmword_100028D50 + 1);
    if (!*((_QWORD *)&xmmword_100028D50 + 1))
    {
      Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      *((_QWORD *)&xmmword_100028D50 + 1) = Mutable;
      if (!Mutable)
      {
        v3 = __stderrp;
        v4 = "failed to allocate logging file descriptors";
        v5 = 43;
        goto LABEL_12;
      }
    }
  }
  else
  {
    Mutable = (__CFSet *)xmmword_100028D50;
    if (!(_QWORD)xmmword_100028D50)
    {
      Mutable = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      *(_QWORD *)&xmmword_100028D50 = Mutable;
      if (!Mutable)
      {
        v3 = __stderrp;
        v4 = "failed to allocate logging file descriptors for regular files";
        v5 = 61;
LABEL_12:
        fwrite(v4, v5, 1uLL, v3);
        v6 = 0;
        goto LABEL_13;
      }
    }
  }
  v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    ramrod_write_full_log_buffer_to_fd(valuePtr);
    CFSetAddValue(Mutable, v6);
    v7 = 0;
    goto LABEL_14;
  }
  fwrite("failed to allocate file descriptor number", 0x29uLL, 1uLL, __stderrp);
LABEL_13:
  v7 = 0xFFFFFFFFLL;
LABEL_14:
  pthread_mutex_unlock(&stru_100028730);
  pthread_mutex_unlock(&stru_1000286F0);
  if (v6)
    CFRelease(v6);
  return v7;
}

uint64_t ramrod_remove_log_fd(int a1)
{
  uint64_t v2;

  pthread_mutex_lock(&stru_100028730);
  v2 = sub_100014FC4(a1);
  pthread_mutex_unlock(&stru_100028730);
  return v2;
}

uint64_t sub_100014FC4(int a1)
{
  int v1;
  BOOL v2;
  uint64_t *v3;
  __CFSet *v4;
  CFNumberRef v5;
  CFNumberRef v6;
  int *v7;
  uint64_t v8;
  FILE *v9;
  int v10;
  char *v11;
  FILE *v12;
  const char *v13;
  size_t v14;
  stat v16;
  int valuePtr;

  valuePtr = a1;
  memset(&v16, 0, sizeof(v16));
  v1 = fstat(a1, &v16);
  v2 = (__int16)v16.st_mode <= -1 && v1 == 0;
  v3 = &qword_100028D58;
  if (v2)
    v3 = &qword_100028D50;
  v4 = (__CFSet *)*v3;
  if (!*v3)
  {
    v12 = __stderrp;
    v13 = "can't remove logging fd since none were added";
    v14 = 45;
LABEL_13:
    fwrite(v13, v14, 1uLL, v12);
    return 0xFFFFFFFFLL;
  }
  v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (!v5)
  {
    v12 = __stderrp;
    v13 = "failed to convert fd to number";
    v14 = 30;
    goto LABEL_13;
  }
  v6 = v5;
  CFSetRemoveValue(v4, v5);
  if (close(valuePtr))
  {
    v7 = __error();
    v8 = *v7;
    v9 = __stderrp;
    v10 = valuePtr;
    v11 = strerror(*v7);
    fprintf(v9, "failed to close file descriptor '%d', error:%s", v10, v11);
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

uint64_t ramrod_log_msg_to_all_fds(uint64_t a1, uint64_t a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  int valuePtr;
  __int128 context;
  CFArrayRef theArray[2];

  context = 0u;
  *(_OWORD *)theArray = 0u;
  valuePtr = -1;
  pthread_mutex_lock(&stru_100028730);
  if (a1 && xmmword_100028D50 != 0)
  {
    *(_QWORD *)&context = a1;
    *((_QWORD *)&context + 1) = a2;
    theArray[0] = 0;
    LOBYTE(theArray[1]) = 0;
    if (*((_QWORD *)&xmmword_100028D50 + 1))
      CFSetApplyFunction(*((CFSetRef *)&xmmword_100028D50 + 1), (CFSetApplierFunction)sub_100015248, &context);
    qword_100028D60 += a2;
    if (qword_100028D60)
    {
      LOBYTE(theArray[1]) = 1;
      qword_100028D60 = 0;
    }
    if ((_QWORD)xmmword_100028D50)
      CFSetApplyFunction((CFSetRef)xmmword_100028D50, (CFSetApplierFunction)sub_100015248, &context);
    if (theArray[0])
    {
      Count = CFArrayGetCount(theArray[0]);
      if (Count >= 1)
      {
        v5 = Count;
        for (i = 0; i != v5; ++i)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray[0], i);
          if (CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr))
            sub_100014FC4(valuePtr);
          else
            fwrite("Failed to convert CFNumberRef into int value\n", 0x2DuLL, 1uLL, __stderrp);
        }
      }
      CFRelease(theArray[0]);
    }
  }
  pthread_mutex_unlock(&stru_100028730);
  return 0;
}

void sub_100015248(const void *a1, uint64_t a2)
{
  __CFArray *Mutable;
  FILE *v5;
  const char *v6;
  size_t v7;
  int valuePtr;

  valuePtr = -1;
  if (!a1)
  {
    v5 = __stderrp;
    v6 = "NULL fd num in fd set, weird.\n";
    v7 = 30;
LABEL_11:
    fwrite(v6, v7, 1uLL, v5);
    return;
  }
  if (!a2)
  {
    v5 = __stderrp;
    v6 = "Missing logging context.\n";
    v7 = 25;
    goto LABEL_11;
  }
  if (*(_QWORD *)a2)
  {
    if (CFNumberGetValue((CFNumberRef)a1, kCFNumberIntType, &valuePtr))
    {
      if (ramrod_log_msg_to_fd(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), valuePtr))
      {
        fprintf(__stderrp, "Removing file descriptor %d since it failed to be written to.\n", valuePtr);
        Mutable = *(__CFArray **)(a2 + 16);
        if (!Mutable)
        {
          Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
          *(_QWORD *)(a2 + 16) = Mutable;
        }
        CFArrayAppendValue(Mutable, a1);
      }
      else if (*(_BYTE *)(a2 + 24))
      {
        fsync(valuePtr);
      }
    }
    else
    {
      fwrite("Failed to convert num to int\n", 0x1DuLL, 1uLL, __stderrp);
    }
  }
}

void *ramrod_log_set_handler(void *result)
{
  off_100028D68 = result;
  return result;
}

uint64_t ramrod_set_syslog_flush_msgs(uint64_t result)
{
  byte_100028770 = result;
  return result;
}

_BYTE *ramrod_copy_log_buffer()
{
  const void *v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;

  pthread_mutex_lock(&stru_1000286F0);
  v0 = (const void *)qword_100028D48;
  if (qword_100028D48)
  {
    v1 = malloc(0x100000uLL);
    v2 = v1;
    if (v1)
    {
      v3 = qword_100028D40;
      v4 = ((int)v0 - (int)qword_100028D38) & 0xFFFFFLL;
      if (v4)
        __memcpy_chk(v1);
      if ((const void *)v3 != v0)
        memcpy(&v2[v4], v0, v3 - (_QWORD)v0);
      v2[v4 + v3 - (_QWORD)v0] = 0;
    }
  }
  else
  {
    v2 = 0;
  }
  pthread_mutex_unlock(&stru_1000286F0);
  return v2;
}

void ramrod_log_msg_noecho(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100015478(0, a1, &a9);
}

void sub_100015478(int a1, const char *a2, va_list a3)
{
  asl_object_t v6;
  __asl_object_s *v7;
  __asl_object_s *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  size_t last;

  if (byte_100028770)
  {
    if (qword_100028D78 != -1)
      dispatch_once(&qword_100028D78, &stru_100025150);
    if (qword_100028D70)
    {
      pthread_mutex_lock(&stru_100028778);
      last = 0;
      v6 = asl_match((asl_object_t)qword_100028D70, 0, &last, qword_100028D80, 0x100uLL, 0, 1);
      if (v6)
      {
        v7 = v6;
        do
        {
          qword_100028D80 = last + 1;
          while (1)
          {
            v8 = asl_next(v7);
            if (!v8)
              break;
            v9 = asl_format(v8, "std", "lcl", 1u);
            if (v9)
            {
              v16 = v9;
              sub_100015958(a1, "SYSLOG: %s", v10, v11, v12, v13, v14, v15, (char)v9);
              free(v16);
            }
          }
          asl_close(v7);
          v7 = asl_match((asl_object_t)qword_100028D70, 0, &last, qword_100028D80, 0x100uLL, 0, 1);
        }
        while (v7);
      }
      pthread_mutex_unlock(&stru_100028778);
    }
  }
  sub_100015784(a1, a2, a3);
}

uint64_t ramrod_log_set_buffermsgs(uint64_t result)
{
  byte_100028771 = result;
  return result;
}

void ramrod_log_msg(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100015478(1, a1, &a9);
}

void ramrod_log_msgv(const char *a1, va_list a2)
{
  sub_100015478(1, a1, a2);
}

void ramrod_log_msg_cf(CFStringRef format, ...)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const char *CStringPtr;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  CFIndex Length;
  CFIndex v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  va_list va;

  va_start(va, format);
  v1 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (!v1)
  {
    ramrod_log_msg("(Failed to format log message)\n", v2, v3, v4, v5, v6, v7, v8, v30);
    return;
  }
  v9 = v1;
  CStringPtr = CFStringGetCStringPtr(v1, 0x8000100u);
  if (CStringPtr)
  {
    v30 = (char)CStringPtr;
    v18 = "%s";
  }
  else
  {
    Length = CFStringGetLength(v9);
    v20 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v21 = (char *)malloc(v20);
    if (v21)
    {
      v22 = v21;
      if (CFStringGetCString(v9, v21, v20, 0x8000100u))
        ramrod_log_msg("%s", v23, v24, v25, v26, v27, v28, v29, (char)v22);
      else
        ramrod_log_msg("(Failed to alloc and convert log message)\n", v23, v24, v25, v26, v27, v28, v29, v30);
      free(v22);
      goto LABEL_12;
    }
    v18 = "(Failed to alloc and convert log message)\n";
  }
  ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v30);
LABEL_12:
  CFRelease(v9);
}

void ramrod_message_error(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100015478(1, a1, &a9);
  sub_100015784(1, "\n", &a9);
}

void sub_100015784(int a1, const char *a2, va_list a3)
{
  size_t v4;
  char *v5;
  char v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  int v11;
  char *__s;

  __s = 0;
  if (vasprintf(&__s, a2, a3) != -1)
  {
    pthread_mutex_lock(&stru_1000286F0);
    if (a1 == 1)
    {
      fputs(__s, __stdoutp);
      if (off_100028D68)
        off_100028D68(__s);
    }
    v4 = strlen(__s);
    ramrod_log_msg_to_all_fds((uint64_t)__s, v4);
    if (!byte_100028771)
      goto LABEL_23;
    v5 = (char *)qword_100028D48;
    if (!qword_100028D48)
    {
      v5 = (char *)malloc(0x100000uLL);
      qword_100028D48 = (uint64_t)v5;
      if (!v5)
      {
        fprintf(__stderrp, "unable to allocate %lu bytes for log buffer\n", 0x100000);
LABEL_23:
        pthread_mutex_unlock(&stru_1000286F0);
        goto LABEL_24;
      }
      qword_100028D38 = (uint64_t)v5;
      qword_100028D40 = (uint64_t)v5;
    }
    v6 = *__s;
    if (*__s)
    {
      v7 = v5 + 0x100000;
      v8 = (char *)qword_100028D40;
      v9 = qword_100028D38;
      v10 = __s + 1;
      do
      {
        *v8 = v6;
        if (v8 + 1 == v7)
          v8 = v5;
        else
          ++v8;
        qword_100028D40 = (uint64_t)v8;
        if ((char *)v9 == v8)
        {
          if (v8 + 1 == v7)
            v9 = (uint64_t)v5;
          else
            v9 = (uint64_t)(v8 + 1);
          qword_100028D38 = v9;
        }
        v11 = *v10++;
        v6 = v11;
      }
      while (v11);
    }
    goto LABEL_23;
  }
  fwrite("unable to allocate storage for log message\n", 0x2BuLL, 1uLL, __stderrp);
LABEL_24:
  free(__s);
}

void sub_1000158FC(id a1)
{
  __asl_object_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  asl_object_t v9;
  char v10;

  v1 = asl_open_path(0, 0);
  if (v1)
  {
    asl_close(v1);
    v8 = "asl_open_path() succeeded - syslogd polling not needed";
LABEL_3:
    sub_100015958(1, v8, v2, v3, v4, v5, v6, v7, v10);
    return;
  }
  v9 = asl_open(0, 0, 4u);
  if (!v9)
  {
    v8 = "asl_open() returned NULL - disabling syslogd polling";
    goto LABEL_3;
  }
  qword_100028D70 = (uint64_t)v9;
}

void sub_100015958(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100015784(a1, a2, &a9);
}

uint64_t ramrod_load_png(const char *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  char v7;
  int v8;
  int v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  off_t st_size;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int *v37;
  void *v38;
  size_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *__p;
  _BYTE *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  stat v55;

  v7 = (char)a1;
  memset(&v55, 0, sizeof(v55));
  v53 = 0;
  v54 = 0;
  __p = 0;
  v51 = 0;
  v52 = 0;
  v8 = open(a1, 0);
  v9 = v8;
  if (v8 < 0)
  {
    v20 = __error();
    strerror(*v20);
    ramrod_log_msg("unable to open image '%s': %s\n", v21, v22, v23, v24, v25, v26, v27, v7);
    return 0;
  }
  if (fstat(v8, &v55))
  {
    v10 = __error();
    strerror(*v10);
    v18 = "unable to stat image '%s': %s\n";
LABEL_4:
    ramrod_log_msg(v18, v11, v12, v13, v14, v15, v16, v17, v7);
    v19 = 0;
    goto LABEL_14;
  }
  st_size = v55.st_size;
  v29 = (unsigned __int8 *)mmap(0, v55.st_size, 1, 2, v9, 0);
  if (v29 == (unsigned __int8 *)-1)
  {
    v37 = __error();
    strerror(*v37);
    v18 = "unable to mmap image '%s': %s\n";
    goto LABEL_4;
  }
  if (picoPNG::decodePNG((uint64_t)&__p, &v54, &v53, v29, st_size, 1))
  {
    ramrod_log_msg("unable to decode image '%s'\n", v30, v31, v32, v33, v34, v35, v36, v7);
  }
  else
  {
    v38 = __p;
    v39 = v51 - (_BYTE *)__p;
    v40 = malloc(v51 - (_BYTE *)__p);
    if (v40)
    {
      v48 = v40;
      memcpy(v40, v38, v39);
      *a2 = v54;
      *a3 = v53;
      *a4 = v48;
      v19 = 1;
      goto LABEL_13;
    }
    ramrod_log_msg("unable to malloc destination image buffer\n", v41, v42, v43, v44, v45, v46, v47, 0);
  }
  v19 = 0;
LABEL_13:
  munmap(v29, st_size);
LABEL_14:
  close(v9);
  if (__p)
  {
    v51 = __p;
    operator delete(__p);
  }
  return v19;
}

void sub_100015B58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ramrod_create_error_cf(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  sub_100015B9C(a1, a2, a3, a4, a5, &a9);
}

void sub_100015B9C(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, va_list a6)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v13;
  CFStringRef v14;
  CFStringRef v15;

  if (a1)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v13 = Mutable;
      v14 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, a5, a6);
      if (v14)
      {
        v15 = v14;
        CFDictionaryAddValue(v13, kCFErrorDescriptionKey, v14);
        CFRelease(v15);
      }
      if (a4)
        CFDictionaryAddValue(v13, kCFErrorUnderlyingErrorKey, a4);
      *a1 = CFErrorCreate(kCFAllocatorDefault, a2, a3, v13);
      CFRelease(v13);
    }
  }
}

void ramrod_create_error_internal(CFErrorRef *a1, const __CFString *a2, CFIndex a3, const void *a4, char *cStr, ...)
{
  const __CFString *v9;
  va_list va;

  va_start(va, cStr);
  v9 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  sub_100015B9C(a1, a2, a3, a4, v9, va);
  CFRelease(v9);
}

uint64_t picoPNG::decodePNG(uint64_t a1, unint64_t *a2, unint64_t *a3, unsigned __int8 *a4, unint64_t a5, char a6)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  char *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t i;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unsigned __int8 *v34;
  unint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unsigned __int8 *v42;
  BOOL v43;
  unint64_t v44;
  unint64_t v45;
  unsigned __int8 *v46;
  char *v47;
  uint64_t *v48;
  char *v49;
  char *v50;
  char *v51;
  uint64_t v52;
  unsigned int v53;
  unsigned __int8 *v54;
  unsigned __int8 *v55;
  char *v56;
  _BYTE *v57;
  char *v58;
  _BYTE *v59;
  unint64_t v60;
  char v61;
  unsigned __int8 *j;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int v66;
  unint64_t v67;
  void *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _BYTE *v72;
  unsigned __int8 *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unsigned __int8 *v77;
  BOOL v78;
  unint64_t v79;
  unint64_t v80;
  char v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  unsigned __int8 *v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  size_t v98;
  unint64_t v99;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  unint64_t v107;
  __int128 v108;
  __int128 v109;
  void *v110[2];
  __int128 v111;
  void *__p;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  void *v118;
  _BYTE *v119;
  uint64_t v120;
  void *v121;
  void *__dst;
  uint64_t v123;
  _QWORD v124[6];
  uint64_t v125;
  _QWORD v126[2];
  uint64x2_t v127;
  uint64x2_t v128;
  unint64_t v129;
  unsigned __int8 *v130;
  uint64x2_t v131;
  uint64x2_t v132;
  unint64_t v133;
  unint64_t v134;

  v6 = 0;
  v111 = 0u;
  v109 = 0u;
  *(_OWORD *)v110 = 0u;
  v108 = 0u;
  v7 = 48;
  v8 = 0;
  if (!a4 || !a5)
    goto LABEL_20;
  if (a5 < 0x1D)
  {
    v6 = 0;
    v8 = 0;
    v7 = 27;
LABEL_20:
    *a2 = v8;
    *a3 = v6;
    return v7;
  }
  if (*a4 != 137
    || a4[1] != 80
    || a4[2] != 78
    || a4[3] != 71
    || a4[4] != 13
    || a4[5] != 10
    || a4[6] != 26
    || a4[7] != 10)
  {
    v6 = 0;
    v8 = 0;
    v7 = 28;
    goto LABEL_20;
  }
  if (a4[12] != 73 || a4[13] != 72 || a4[14] != 68 || a4[15] != 82)
  {
    v6 = 0;
    v8 = 0;
    v7 = 29;
    goto LABEL_20;
  }
  v10 = a2;
  v11 = a3;
  v8 = bswap32(*((_DWORD *)a4 + 4));
  v6 = bswap32(*((_DWORD *)a4 + 5));
  v101 = v8;
  v102 = v6;
  v12 = a4[24];
  v13 = a4[25];
  v103 = v13;
  v104 = v12;
  if ((unint64_t)a4[26])
  {
    v7 = 32;
LABEL_27:
    a2 = v10;
    goto LABEL_20;
  }
  if ((unint64_t)a4[27])
  {
    v7 = 33;
    goto LABEL_27;
  }
  v107 = a4[28];
  if (v107 > 1)
  {
    v7 = 34;
    goto LABEL_27;
  }
  v7 = sub_100017D14(v13, v12);
  DWORD2(v111) = v7;
  a3 = v11;
  a2 = v10;
  if ((_DWORD)v7)
    goto LABEL_20;
  v121 = 0;
  __dst = 0;
  v123 = 0;
  BYTE8(v109) = 0;
  if (a5 < 0x2A)
  {
LABEL_73:
    v33 = 30;
LABEL_130:
    DWORD2(v111) = v33;
    goto LABEL_131;
  }
  v17 = 33;
  v18 = 41;
  while (1)
  {
    v19 = bswap32(*(_DWORD *)&a4[v17]);
    if ((v19 & 0x80000000) != 0)
      goto LABEL_129;
    v20 = v17 + 4 + v19;
    if (v20 >= a5)
    {
      v33 = 35;
      goto LABEL_130;
    }
    v21 = a4[v17 + 4];
    if (v21 != 116)
      break;
    if (a4[v17 + 5] != 82 || a4[v17 + 6] != 78 || a4[v17 + 7] != 83)
      goto LABEL_57;
    if (v103)
    {
      if (v103 != 2)
      {
        if (v103 != 3)
        {
          v33 = 42;
          goto LABEL_130;
        }
        v26 = 4 * v19;
        if ((void *)(4 * v19) > (void *)((char *)v110[1] - (char *)v110[0]))
        {
          v33 = 39;
          goto LABEL_130;
        }
        if ((_DWORD)v19)
        {
          v27 = 0;
          do
          {
            v28 = v18 + 1;
            *((_BYTE *)v110[0] + v27 + 3) = a4[v18];
            v27 += 4;
            ++v18;
          }
          while (v26 != v27);
          goto LABEL_67;
        }
        goto LABEL_66;
      }
      if ((_DWORD)v19 != 6)
      {
        v33 = 41;
        goto LABEL_130;
      }
      v31 = a4[v18];
      BYTE8(v109) = 1;
      v32 = __rev16(*(unsigned __int16 *)&a4[v17 + 10]);
      *(_QWORD *)&v108 = a4[v17 + 9] | (unint64_t)(v31 << 8);
      *((_QWORD *)&v108 + 1) = v32;
      *(_QWORD *)&v109 = __rev16(*(unsigned __int16 *)&a4[v17 + 12]);
      v28 = v17 + 14;
    }
    else
    {
      if ((_DWORD)v19 != 2)
      {
        v33 = 40;
        goto LABEL_130;
      }
      BYTE8(v109) = 1;
      *((_QWORD *)&v108 + 1) = a4[v17 + 9] | ((unint64_t)a4[v18] << 8);
      *(_QWORD *)&v109 = *((_QWORD *)&v108 + 1);
      *(_QWORD *)&v108 = *((_QWORD *)&v108 + 1);
      v28 = v17 + 10;
    }
LABEL_67:
    v17 = v28 + 4;
    v18 = v28 + 12;
    if (v28 + 12 >= a5)
      goto LABEL_73;
  }
  if (v21 == 80)
  {
    if (a4[v17 + 5] != 76 || a4[v17 + 6] != 84 || a4[v17 + 7] != 69)
      goto LABEL_80;
    v23 = ((2863311531u * (unint64_t)v19) >> 31) & 0x1FFFFFFFCLL;
    v25 = v110[0];
    v24 = (char *)v110[1];
    if (v23 <= (char *)v110[1] - (char *)v110[0])
    {
      if (v23 < (char *)v110[1] - (char *)v110[0])
      {
        v24 = (char *)v110[0] + v23;
        v110[1] = (char *)v110[0] + v23;
      }
    }
    else
    {
      sub_100018034((unint64_t *)v110, v23 - ((char *)v110[1] - (char *)v110[0]));
      v25 = v110[0];
      v24 = (char *)v110[1];
    }
    if ((unint64_t)(v24 - v25) > 0x400)
    {
      v33 = 38;
      goto LABEL_130;
    }
    if (v24 != v25)
    {
      v29 = 0;
      do
      {
        for (i = 0; i != 3; ++i)
          *((_BYTE *)v110[0] + v29 + i) = a4[v18 + i];
        *((_BYTE *)v110[0] + (v29 | 3)) = -1;
        v29 += 4;
        v18 += 3;
      }
      while (v29 < (char *)v110[1] - (char *)v110[0]);
    }
LABEL_66:
    v28 = v18;
    goto LABEL_67;
  }
  if (v21 != 73)
  {
    if ((v21 & 0x20) == 0)
      goto LABEL_80;
LABEL_57:
    v28 = v20 + 4;
    goto LABEL_67;
  }
  v22 = a4[v17 + 5];
  if (v22 == 68)
  {
    if (a4[v17 + 6] != 65 || a4[v17 + 7] != 84)
      goto LABEL_80;
    sub_100017D9C((uint64_t)&v121, (char *)__dst, (char *)&a4[v18], (char *)&a4[v18 + v19], v19);
    goto LABEL_57;
  }
  if (v22 != 69 || (v34 = &a4[v17], v34[6] != 78) || v34[7] != 68)
  {
LABEL_80:
    v33 = 69;
    goto LABEL_130;
  }
  if (v103 == 2)
  {
    v35 = 3 * v104;
  }
  else if (v103 < 4)
  {
    v35 = v104;
  }
  else
  {
    v35 = v104 * (v103 - 2);
  }
  if (v35 < 8)
    v36 = 1;
  else
    v36 = v35 >> 3;
  if (!v102 || !v101 || (v101 | v102) >= 0x10000)
  {
LABEL_129:
    v33 = 63;
    goto LABEL_130;
  }
  v118 = 0;
  v119 = 0;
  v120 = 0;
  sub_10001815C(&v118, (v36 + v36 * v102) * v101);
  v37 = v118;
  if (v102 + 1 == (v119 - (_BYTE *)v118) / (v101 * v36))
  {
    DWORD2(v111) = sub_1000169B0((unint64_t *)&v118, (unsigned __int8 **)&v121);
    if (!DWORD2(v111))
    {
      v96 = (v101 * v35 + 7) >> 3;
      sub_100016988((unint64_t *)a1, v96 * v102);
      if (v102 == (*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) / v96)
      {
        v99 = (v35 + 7) >> 3;
        if (v96 * v102)
          v38 = *(_QWORD *)a1;
        else
          v38 = 0;
        if (v107)
        {
          v39 = 0;
          v40 = 0;
          v41 = v101;
          v131 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 3), (uint64x2_t)xmmword_100023150);
          v132 = vshlq_u64((uint64x2_t)vdupq_n_s64(v101 + 1), (uint64x2_t)xmmword_100023160);
          v133 = v101 >> 1;
          v134 = v101;
          v126[0] = (v102 + 7) >> 3;
          v126[1] = v126[0];
          v127 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 3), (uint64x2_t)xmmword_100023150);
          v128 = vshlq_u64((uint64x2_t)vdupq_n_s64(v102 + 1), (uint64x2_t)xmmword_100023160);
          v129 = v102 >> 1;
          v130 = (unsigned __int8 *)((v101 + 7) >> 3);
          v125 = 0;
          memset(v124, 0, sizeof(v124));
          do
          {
            v42 = (&v130)[v39];
            v43 = v42 == 0;
            v44 = ((unint64_t)v42 * v35 + 7) >> 3;
            if (!v43)
              ++v44;
            v40 += v44 * v126[v39];
            v124[++v39] = v40;
          }
          while (v39 != 6);
          v115 = 0;
          v116 = 0;
          v117 = 0;
          sub_10001815C(&v115, (v41 * v35 + 7) >> 3);
          __p = 0;
          v113 = 0;
          v114 = 0;
          sub_10001815C(&__p, (v101 * v35 + 7) >> 3);
          v87 = 0;
          if (v99 <= 1)
            v45 = 1;
          else
            v45 = (v35 + 7) >> 3;
          do
          {
            v46 = (&v130)[v87];
            if (v46)
            {
              v91 = v126[v87];
              if (v91)
              {
                v47 = (char *)__p;
                v93 = (unsigned __int8 *)v115;
                v94 = 0;
                v90 = (char *)v118 + v124[v87];
                v48 = (uint64_t *)((char *)&unk_1000235E8 + 8 * v87);
                v84 = v101 * v35;
                v85 = v48[21];
                v89 = (v101 * v35 + 7) >> 3;
                v95 = v48[14];
                v97 = *v48;
                v86 = v48[7];
                v92 = v38 + v99 * (*v48 + v86 * v101);
                v88 = v99 * v85 * v101;
                do
                {
                  v49 = v47;
                  v50 = &v90[v94 * ((((unint64_t)v46 * v35 + 7) >> 3) + 1)];
                  v53 = *v50;
                  v51 = v50 + 1;
                  v52 = v53;
                  if (v94)
                    v54 = v93;
                  else
                    v54 = 0;
                  sub_1000174C0((uint64_t)&v101, v47, v51, v54, v99, v52, v89);
                  if (DWORD2(v111))
                    break;
                  if (v35 <= 7)
                  {
                    for (j = 0; j != v46; ++j)
                    {
                      if (v35)
                      {
                        v63 = (_QWORD)j * v35;
                        v64 = (v86 + v94 * v85) * v84 + (v97 + (_QWORD)j * v95) * v35;
                        v65 = v35;
                        do
                        {
                          v66 = (v49[v63 >> 3] >> (~(_BYTE)v63 & 7)) & 1;
                          ++v63;
                          *(_BYTE *)(v38 + (v64 >> 3)) |= (_BYTE)v66 << (~(_BYTE)v64 & 7);
                          ++v64;
                          --v65;
                        }
                        while (v65);
                      }
                    }
                  }
                  else
                  {
                    v55 = 0;
                    v56 = v49;
                    v57 = (_BYTE *)v92;
                    do
                    {
                      v58 = v56;
                      v59 = v57;
                      v60 = v45;
                      if (v35 + 7 >= 8)
                      {
                        do
                        {
                          v61 = *v58++;
                          *v59++ = v61;
                          --v60;
                        }
                        while (v60);
                      }
                      ++v55;
                      v57 += v99 * v95;
                      v56 += v99;
                    }
                    while (v55 != v46);
                  }
                  v92 += v88;
                  v47 = (char *)v93;
                  v93 = (unsigned __int8 *)v49;
                  ++v94;
                }
                while (v94 != v91);
              }
            }
            ++v87;
          }
          while (v87 != 7);
          if (__p)
          {
            v113 = __p;
            operator delete(__p);
          }
          if (v115)
          {
            v116 = v115;
            operator delete(v115);
          }
          goto LABEL_166;
        }
        v98 = (v101 * v35 + 7) >> 3;
        if (v35 < 8)
        {
          v130 = 0;
          v131 = 0uLL;
          sub_10001815C(&v130, v98);
          v74 = 0;
          v75 = 0;
          v76 = 0;
          while (1)
          {
            v77 = v74 ? (unsigned __int8 *)(v38 + (v74 - 1) * v96) : 0;
            sub_1000174C0((uint64_t)&v101, v130, (char *)v118 + v75 + 1, v77, v99, *((unsigned __int8 *)v118 + v75), v98);
            v78 = DWORD2(v111) != 0;
            if (DWORD2(v111))
              break;
            if (v101 * v35)
            {
              v79 = 0;
              do
              {
                v80 = v76 + v79;
                v81 = ~(v76 + v79);
                v82 = (v130[v79 >> 3] >> (~(_BYTE)v79 & 7)) & 1;
                ++v79;
                *(_BYTE *)(v38 + (v80 >> 3)) |= (_BYTE)v82 << (v81 & 7);
              }
              while (v79 < v101 * v35);
              v76 += v79;
            }
            v75 += v98 + 1;
            if (++v74 >= v102)
            {
              v83 = 0;
              goto LABEL_161;
            }
          }
          v83 = 1;
LABEL_161:
          if (v130)
          {
            v131.i64[0] = (uint64_t)v130;
            operator delete(v130);
          }
          if (!v78)
LABEL_164:
            v83 = 0;
          if (!v83)
          {
LABEL_166:
            if ((a6 & 1) != 0 && (v103 != 6 || v104 != 8))
            {
              v130 = 0;
              v131 = 0uLL;
              sub_100018830(&v130, *(const void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 8) - *(_QWORD *)a1);
              DWORD2(v111) = sub_100017744((unint64_t *)a1, v130, (uint64_t)&v101, v101, v102);
              if (v130)
              {
                v131.i64[0] = (uint64_t)v130;
                operator delete(v130);
              }
            }
          }
        }
        else
        {
          v69 = 0;
          v70 = 0;
          v71 = -(uint64_t)v99;
          v72 = (_BYTE *)v38;
          while (1)
          {
            v73 = v70 ? (unsigned __int8 *)(v38 + v71 * v101) : 0;
            sub_1000174C0((uint64_t)&v101, v72, (char *)v118 + v69 + 1, v73, v99, *((unsigned __int8 *)v118 + v69), v98);
            if (DWORD2(v111))
              break;
            ++v70;
            v72 += v98;
            v71 += v99;
            v69 += v98 + 1;
            if (v70 >= v102)
              goto LABEL_164;
          }
        }
      }
      else
      {
        DWORD2(v111) = 63;
      }
    }
    v37 = v118;
  }
  else
  {
    DWORD2(v111) = 63;
  }
  if (v37)
  {
    v119 = v37;
    operator delete(v37);
  }
LABEL_131:
  if (v121)
  {
    __dst = v121;
    operator delete(v121);
  }
  v67 = v102;
  v7 = DWORD2(v111);
  v68 = v110[0];
  *v10 = v101;
  *v11 = v67;
  if (v68)
  {
    v110[1] = v68;
    operator delete(v68);
  }
  return v7;
}

void sub_100016900(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,uint64_t a51,void *a52,uint64_t a53)
{
  if (__p)
    operator delete(__p);
  if (a52)
    operator delete(a52);
  if (a39)
    operator delete(a39);
  _Unwind_Resume(exception_object);
}

void sub_100016988(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  size_t v4;

  v2 = a1[1] - *a1;
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_100018034(a1, v4);
  }
  else if (!v3)
  {
    a1[1] = *a1 + a2;
  }
}

uint64_t sub_1000169B0(unint64_t *a1, unsigned __int8 **a2)
{
  unsigned __int8 *v2;
  uint64_t v3;
  int v4;
  __int16 v5;
  unint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  BOOL v42;
  unint64_t v43;
  uint64_t *v44;
  unint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t *v66;
  uint64_t *v67;
  uint64_t *v68;
  unint64_t v69;
  int v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  unint64_t v93;
  uint64_t *v95;
  unint64_t v96;
  unint64_t v97;
  unsigned int v98;
  unsigned __int8 **v99;
  void *v100[2];
  __int128 v101;
  void *v102[2];
  void *v103[2];
  __int128 v104;
  unint64_t v105;
  void *__p;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t *v113;
  uint64_t v114;

  *(_OWORD *)v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  *(_OWORD *)v102 = 0u;
  *(_OWORD *)v100 = 0u;
  v2 = *a2;
  if ((unint64_t)(a2[1] - *a2) < 2)
  {
    v3 = 53;
    goto LABEL_176;
  }
  v4 = *v2;
  v5 = v2[1];
  if ((unsigned __int16)(31711 * (v5 | ((_WORD)v4 << 8))) > 0x842u)
  {
    v3 = 24;
    goto LABEL_176;
  }
  if ((v4 & 0xFFFFFF8F) != 8)
  {
    v3 = 25;
    goto LABEL_176;
  }
  if ((v5 & 0x20) != 0)
  {
    v3 = 26;
    goto LABEL_176;
  }
  v7 = 0;
  v105 = 0;
  LODWORD(v100[0]) = 0;
  v99 = a2;
  do
  {
    v3 = LODWORD(v100[0]);
    if (LODWORD(v100[0]))
      goto LABEL_174;
    v8 = v105;
    v9 = *a2;
    v10 = a2[1] - *a2;
    if (v105 >> 3 >= v10)
    {
      v3 = 52;
LABEL_173:
      LODWORD(v100[0]) = v3;
      goto LABEL_174;
    }
    v11 = (uint64_t)(v9 + 2);
    v12 = v9[(v105 >> 3) + 2];
    v13 = (v9[((v105 + 1) >> 3) + 2] >> ((v105 + 1) & 7)) & 1;
    v14 = v9[((v105 + 2) >> 3) + 2] >> ((v105 + 2) & 7);
    v15 = v105 + 3;
    v105 += 3;
    v16 = v13 & 0xFFFFFFFD | (2 * (v14 & 1));
    if ((_DWORD)v16 == 3)
    {
      v3 = 20;
      goto LABEL_173;
    }
    if ((_DWORD)v16 == 2)
    {
      v98 = v12;
      v112 = 0;
      v113 = 0;
      v114 = 0;
      v109 = 0;
      sub_100018588(&v112, 0x120uLL, &v109);
      v109 = 0;
      v110 = 0;
      v111 = 0;
      __p = 0;
      sub_100018588(&v109, 0x20uLL, &__p);
      if (v10 - 2 <= v15 >> 3)
      {
        LODWORD(v100[0]) = 49;
        goto LABEL_118;
      }
      v25 = 0;
      for (i = 3; i != 8; ++i)
      {
        v27 = v25;
        v28 = (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 3);
        v25 += v28;
      }
      v29 = 0;
      do
      {
        v29 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 8);
        ++i;
      }
      while (i != 13);
      v30 = 0;
      do
      {
        v30 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v8 + i) >> 3)) >> ((v8 + i) & 7)) & 1) << (i - 13);
        ++i;
      }
      while (i != 17);
      __p = 0;
      v107 = 0;
      v108 = 0;
      sub_1000186AC(&__p, 0x13uLL);
      v31 = 0;
      v97 = v25 + 257;
      v32 = v30 + 4;
      v33 = v8 + 17;
      v34 = __p;
      v12 = v98;
      do
      {
        if (v31 >= v32)
        {
          v36 = 0;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          do
          {
            v36 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v33 + v35) >> 3)) >> ((v33 + v35) & 7)) & 1) << v35;
            ++v35;
          }
          while (v35 != 3);
          v33 += 3;
        }
        v34[qword_100023550[v31++]] = v36;
      }
      while (v31 != 19);
      v105 = v33;
      LODWORD(v100[0]) = sub_1000182E8(&v103[1], (uint64_t **)&__p, 7);
      if (!LODWORD(v100[0]))
      {
        v95 = v112;
        v96 = v25 + v29 + 258;
        if (v25 + v29 != -258)
        {
          v37 = 0;
          v38 = v27 + v28;
          v39 = v109;
          v40 = -8 * v38;
          do
          {
            v41 = sub_10001825C((int *)v100, v11, &v105, (uint64_t *)&v103[1], v10);
            if (LODWORD(v100[0]))
              goto LABEL_116;
            if (v41 > 0xF)
            {
              switch(v41)
              {
                case 0x12uLL:
                  if (v10 <= v105 >> 3)
                    goto LABEL_112;
                  v55 = 0;
                  v56 = 0;
                  do
                  {
                    v56 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v55) >> 3)) >> ((v105 + v55) & 7)) & 1) << v55;
                    ++v55;
                  }
                  while (v55 != 7);
                  v105 += 7;
                  v57 = v56 + 11;
                  if (v56 != -11)
                  {
                    v58 = v96 - v37;
                    if (v96 < v37)
                      v58 = 0;
                    v59 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    v60 = &v112[v37];
                    while (v58)
                    {
                      if (v37 >= v97)
                        v61 = v59;
                      else
                        v61 = v60;
                      *v61 = 0;
                      ++v37;
                      --v58;
                      ++v59;
                      ++v60;
                      if (!--v57)
                        goto LABEL_48;
                    }
                    v70 = 15;
                    goto LABEL_115;
                  }
                  break;
                case 0x11uLL:
                  if (v10 <= v105 >> 3)
                  {
LABEL_112:
                    v70 = 50;
                    goto LABEL_115;
                  }
                  v62 = 0;
                  v63 = 0;
                  do
                  {
                    v63 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v62) >> 3)) >> ((v105 + v62) & 7)) & 1) << v62;
                    ++v62;
                  }
                  while (v62 != 3);
                  v105 += 3;
                  v64 = v63 + 3;
                  if (v63 != -3)
                  {
                    v65 = v96 - v37;
                    if (v96 < v37)
                      v65 = 0;
                    v66 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    v67 = &v112[v37];
                    while (v65)
                    {
                      if (v37 >= v97)
                        v68 = v66;
                      else
                        v68 = v67;
                      *v68 = 0;
                      ++v37;
                      --v65;
                      ++v66;
                      ++v67;
                      if (!--v64)
                        goto LABEL_48;
                    }
                    v70 = 14;
                    goto LABEL_115;
                  }
                  break;
                case 0x10uLL:
                  if (v10 <= v105 >> 3)
                    goto LABEL_112;
                  if (!v37)
                  {
                    v70 = 54;
                    goto LABEL_115;
                  }
                  v46 = 0;
                  v47 = 0;
                  do
                  {
                    v47 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v46) >> 3)) >> ((v105 + v46) & 7)) & 1) << v46;
                    ++v46;
                  }
                  while (v46 != 2);
                  v105 += 2;
                  if (v37 - 1 >= v97)
                    v48 = (uint64_t *)(v109 + 8 * (v37 - v25) - 2064);
                  else
                    v48 = &v112[v37 - 1];
                  v49 = v47 + 3;
                  if (v49)
                  {
                    v50 = *v48;
                    v51 = v96 - v37;
                    if (v96 < v37)
                      v51 = 0;
                    v52 = (uint64_t *)(v109 + v40 + 8 * v37 - 2056);
                    v53 = &v112[v37];
                    while (v51)
                    {
                      if (v37 >= v97)
                        v54 = v52;
                      else
                        v54 = v53;
                      *v54 = v50;
                      ++v37;
                      --v51;
                      ++v52;
                      ++v53;
                      if (!--v49)
                        goto LABEL_48;
                    }
                    v70 = 13;
                    goto LABEL_115;
                  }
                  break;
                default:
                  v70 = 16;
                  goto LABEL_115;
              }
            }
            else
            {
              v42 = v37 >= v97;
              v43 = v37 - v97;
              v44 = &v95[v37++];
              v45 = (unint64_t *)(v39 + 8 * v43);
              if (!v42)
                v45 = (unint64_t *)v44;
              *v45 = v41;
            }
LABEL_48:
            ;
          }
          while (v37 < v96);
        }
        if (v95[256])
        {
          LODWORD(v100[0]) = sub_1000182E8(&v100[1], &v112, 15);
          if (LODWORD(v100[0]))
            goto LABEL_116;
          v70 = sub_1000182E8(v102, (uint64_t **)&v109, 15);
        }
        else
        {
          v70 = 64;
        }
LABEL_115:
        LODWORD(v100[0]) = v70;
      }
LABEL_116:
      if (__p)
      {
        v107 = __p;
        operator delete(__p);
      }
LABEL_118:
      if (v109)
      {
        v110 = v109;
        operator delete((void *)v109);
      }
      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }
      if (!LODWORD(v100[0]))
      {
        while (1)
        {
          do
          {
            while (1)
            {
LABEL_123:
              v71 = sub_10001825C((int *)v100, v11, &v105, (uint64_t *)&v100[1], v10);
              if (LODWORD(v100[0]))
                goto LABEL_165;
              v72 = v71;
              if (v71 == 256)
                goto LABEL_165;
              if (v71 > 0xFF)
                break;
              v73 = *a1;
              v74 = a1[1] - *a1;
              if (v7 >= v74)
              {
                v75 = 2 * v7 + 2;
                if (v75 <= v74)
                {
                  if (v75 < v74)
                    a1[1] = v73 + v75;
                }
                else
                {
                  sub_100018034(a1, v75 - v74);
                  v73 = *a1;
                }
              }
              *(_BYTE *)(v73 + v7++) = v72;
            }
          }
          while (v71 > 0x11D);
          if (v10 <= v105 >> 3)
            goto LABEL_161;
          v76 = 8 * v71 - 2056;
          if (v71 - 285 >= 0xFFFFFFFFFFFFFFECLL)
          {
            v78 = 0;
            v77 = 0;
            v79 = *(_QWORD *)((char *)&unk_100023288 + v76);
            do
            {
              v77 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v78) >> 3)) >> ((v105 + v78) & 7)) & 1) << v78;
              ++v78;
            }
            while (v79 != v78);
            v105 += v79;
          }
          else
          {
            v77 = 0;
          }
          v80 = *(_QWORD *)((char *)&unk_1000231A0 + v76);
          v81 = sub_10001825C((int *)v100, v11, &v105, (uint64_t *)v102, v10);
          if (LODWORD(v100[0]))
            goto LABEL_165;
          if (v81 > 0x1D)
            break;
          if (v10 <= v105 >> 3)
          {
LABEL_161:
            v92 = 51;
LABEL_164:
            LODWORD(v100[0]) = v92;
            goto LABEL_165;
          }
          if (v81 >= 4)
          {
            v83 = 0;
            v82 = 0;
            v84 = qword_100023460[v81];
            do
            {
              v82 += (unint64_t)((*(unsigned __int8 *)(v11 + ((v105 + v83) >> 3)) >> ((v105 + v83) & 7)) & 1) << v83;
              ++v83;
            }
            while (v84 != v83);
            v105 += v84;
          }
          else
          {
            v82 = 0;
          }
          v85 = v82 + qword_100023370[v81];
          v86 = v7 - v85;
          if (v7 < v85)
          {
            v92 = 52;
            goto LABEL_164;
          }
          v87 = v77 + v80;
          v88 = a1[1] - *a1;
          if (v87 + v7 >= v88)
          {
            v89 = 2 * (v87 + v7);
            if (v89 <= v88)
            {
              if (v89 < v88)
                a1[1] = *a1 + v89;
            }
            else
            {
              sub_100018034(a1, v89 - v88);
            }
          }
          if (v87)
          {
            v90 = 0;
            v91 = v86;
            do
            {
              *(_BYTE *)(*a1 + v7 + v90) = *(_BYTE *)(*a1 + v91);
              if (v91 + 1 < v7)
                ++v91;
              else
                v91 = v86;
              ++v90;
            }
            while (v87 != v90);
            v7 += v90;
          }
        }
        v92 = 18;
        goto LABEL_164;
      }
      goto LABEL_165;
    }
    if (v16 == 1)
    {
      v23 = v12;
      v112 = 0;
      v113 = 0;
      v114 = 0;
      v109 = 8;
      sub_100018588(&v112, 0x120uLL, &v109);
      v109 = 0;
      v110 = 0;
      v111 = 0;
      __p = (void *)5;
      sub_100018588(&v109, 0x20uLL, &__p);
      v24 = v112;
      memset_pattern16(v112 + 144, &unk_100023170, 0x380uLL);
      memset_pattern16(v24 + 256, &unk_100023180, 0xC0uLL);
      sub_1000182E8(&v100[1], &v112, 15);
      sub_1000182E8(v102, (uint64_t **)&v109, 15);
      v12 = v23;
      if (v109)
      {
        v110 = v109;
        operator delete((void *)v109);
      }
      if (v112)
      {
        v113 = v112;
        operator delete(v112);
      }
      goto LABEL_123;
    }
    if (v16)
      goto LABEL_123;
    v17 = v12;
    if ((v15 & 7) != 0)
    {
      v15 = (v15 | 7) + 1;
      v105 = v15;
    }
    v18 = v15 >> 3;
    if (v15 >> 3 >= v10 - 4)
    {
      v22 = 52;
      goto LABEL_99;
    }
    v19 = *(unsigned __int16 *)(v11 + v18);
    if (*(unsigned __int16 *)(v11 + v18 + 2) + v19 != 0xFFFF)
    {
      v22 = 21;
      goto LABEL_99;
    }
    v20 = a1[1] - *a1;
    if (v19 + v7 > v20)
      sub_100018034(a1, v19 + v7 - v20);
    v21 = v18 + 4;
    if (v19 + v18 + 4 > v10)
    {
      v22 = 23;
LABEL_99:
      LODWORD(v100[0]) = v22;
      v12 = v17;
      goto LABEL_165;
    }
    if (v19)
    {
      v69 = v18 + 6;
      do
      {
        *(_BYTE *)(*a1 + v7++) = v9[v69++];
        --v19;
      }
      while (v19);
      v21 = v69 - 2;
    }
    v12 = v17;
    v105 = 8 * v21;
LABEL_165:
    a2 = v99;
  }
  while (((v12 >> (v8 & 7)) & 1) == 0);
  v3 = LODWORD(v100[0]);
  if (!LODWORD(v100[0]))
  {
    v93 = a1[1] - *a1;
    if (v7 <= v93)
    {
      v3 = 0;
      if (v7 < v93)
        a1[1] = *a1 + v7;
    }
    else
    {
      sub_100018034(a1, v7 - v93);
      v3 = LODWORD(v100[0]);
    }
  }
LABEL_174:
  if (v103[1])
  {
    *(void **)&v104 = v103[1];
    operator delete(v103[1]);
  }
LABEL_176:
  if (v102[0])
  {
    v102[1] = v102[0];
    operator delete(v102[0]);
  }
  if (v100[1])
  {
    *(void **)&v101 = v100[1];
    operator delete(v100[1]);
  }
  return v3;
}

void sub_100017450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30)
{
  sub_10001820C(&a17);
  _Unwind_Resume(a1);
}

uint64_t sub_1000174C0(uint64_t result, _BYTE *a2, char *a3, unsigned __int8 *a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  char v7;
  char *v8;
  _BYTE *v9;
  unint64_t v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char *v15;
  unsigned __int8 *v16;
  _BYTE *v17;
  unint64_t v18;
  char v19;
  char v20;
  unsigned int v21;
  char *v22;
  char *v23;
  _BYTE *v24;
  unint64_t v25;
  char v26;
  char v27;
  char v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  BOOL v38;
  int v39;
  char v41;
  char *v42;
  _BYTE *v43;
  unint64_t v44;
  char v45;
  char *v46;
  _BYTE *v47;
  unint64_t v48;
  char v49;

  switch(a6)
  {
    case 0:
      for (; a7; --a7)
      {
        v7 = *a3++;
        *a2++ = v7;
      }
      break;
    case 1:
      if (a5)
      {
        v8 = a3;
        v9 = a2;
        v10 = a5;
        do
        {
          v11 = *v8++;
          *v9++ = v11;
          --v10;
        }
        while (v10);
      }
      if (a5 < a7)
      {
        do
        {
          a2[a5] = *a2 + a3[a5];
          --a7;
          ++a2;
          ++a3;
        }
        while (a5 != a7);
      }
      break;
    case 2:
      if (a4)
      {
        for (; a7; --a7)
        {
          v13 = *a3++;
          v12 = v13;
          v14 = *a4++;
          *a2++ = v14 + v12;
        }
      }
      else
      {
        for (; a7; --a7)
        {
          v41 = *a3++;
          *a2++ = v41;
        }
      }
      break;
    case 3:
      if (a4)
      {
        if (a5)
        {
          v15 = a3;
          v16 = a4;
          v17 = a2;
          v18 = a5;
          do
          {
            v20 = *v15++;
            v19 = v20;
            v21 = *v16++;
            *v17++ = v19 + (v21 >> 1);
            --v18;
          }
          while (v18);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + ((a4[a5] + *a2) >> 1);
            --a7;
            ++a2;
            ++a4;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      else
      {
        if (a5)
        {
          v42 = a3;
          v43 = a2;
          v44 = a5;
          do
          {
            v45 = *v42++;
            *v43++ = v45;
            --v44;
          }
          while (v44);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = a3[a5] + (*a2 >> 1);
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      break;
    case 4:
      if (a4)
      {
        if (a5)
        {
          v22 = a3;
          v23 = (char *)a4;
          v24 = a2;
          v25 = a5;
          do
          {
            v27 = *v22++;
            v26 = v27;
            v28 = *v23++;
            *v24++ = v28 + v26;
            --v25;
          }
          while (v25);
        }
        if (a5 < a7)
        {
          do
          {
            v29 = *a2;
            v30 = a4[a5];
            v32 = *a4++;
            v31 = v32;
            v33 = v30 + v29 - v32;
            v34 = v32 - v30;
            v35 = v30 - v32;
            if (v33 >= v29 && v30 != v32)
              v34 = v35;
            v36 = v30 - v33;
            if (v33 > v30)
              v36 = v33 - v30;
            v37 = v31 - v33;
            v38 = __OFSUB__(v33, v31);
            v39 = v33 - v31;
            if ((v39 < 0) ^ v38 | (v39 == 0))
              v39 = v37;
            if (v36 > v39)
              LOBYTE(v30) = v31;
            if (v34 > v39 || v34 > v36)
              LOBYTE(v29) = v30;
            a2[a5] = v29 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      else
      {
        if (a5)
        {
          v46 = a3;
          v47 = a2;
          v48 = a5;
          do
          {
            v49 = *v46++;
            *v47++ = v49;
            --v48;
          }
          while (v48);
        }
        if (a5 < a7)
        {
          do
          {
            a2[a5] = *a2 + a3[a5];
            --a7;
            ++a2;
            ++a3;
          }
          while (a5 != a7);
        }
      }
      break;
    default:
      *(_DWORD *)(result + 112) = 36;
      break;
  }
  return result;
}

uint64_t sub_100017744(unint64_t *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v16;
  unsigned __int8 *v17;
  unint64_t v18;
  uint64_t i;
  unsigned __int8 *v20;
  BOOL v21;
  _BYTE *v22;
  unsigned __int8 v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t j;
  char *v28;
  _BYTE *v29;
  char v30;
  char v31;
  uint64_t k;
  uint64_t m;
  uint64_t v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char v44;
  unsigned __int8 *v45;
  BOOL v46;
  _BYTE *v47;
  char *v48;
  char v49;
  char v50;
  uint64_t n;
  uint64_t v52;
  char *v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  BOOL v61;
  unint64_t v62;
  unint64_t v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t ii;

  v8 = a5 * a4;
  v9 = 4 * a5 * a4;
  v10 = *a1;
  v11 = a1[1];
  v12 = v11 - *a1;
  if (v9 <= v12)
  {
    if (v9 < v12)
    {
      v11 = v10 + v9;
      a1[1] = v10 + v9;
    }
  }
  else
  {
    sub_100018034(a1, v9 - v12);
    v10 = *a1;
    v11 = a1[1];
  }
  if (v10 == v11)
    v10 = 0;
  v13 = *(_QWORD *)(a3 + 16);
  v14 = *(_QWORD *)(a3 + 24);
  if (v14 == 8 && v13 == 0)
  {
    if (v8)
    {
      v22 = (_BYTE *)(v10 + 3);
      do
      {
        v23 = *a2;
        *(v22 - 1) = *a2;
        *(v22 - 2) = v23;
        *(v22 - 3) = v23;
        v24 = *(_BYTE *)(a3 + 80);
        if (v24)
          v24 = *(_QWORD *)(a3 + 56) == *a2;
        *v22 = v24 - 1;
        v22 += 4;
        ++a2;
        --v8;
      }
      while (v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 2)
  {
    if (v8)
    {
      v16 = 0;
      v17 = a2;
      v18 = v10;
      do
      {
        for (i = 0; i != 3; ++i)
          *(_BYTE *)(v18 + i) = v17[i];
        v21 = *(_BYTE *)(a3 + 80)
           && *(_QWORD *)(a3 + 56) == a2[3 * v16]
           && (v20 = &a2[3 * v16], *(_QWORD *)(a3 + 64) == v20[1])
           && *(_QWORD *)(a3 + 72) == v20[2];
        *(_BYTE *)(v10 + ((4 * v16++) | 3)) = v21 - 1;
        v18 += 4;
        v17 += 3;
      }
      while (v16 != v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 3)
  {
    if (v8)
    {
      v26 = 0;
      while (*(_QWORD *)(a3 + 96) - *(_QWORD *)(a3 + 88) > 4 * (unint64_t)a2[v26])
      {
        for (j = 0; j != 4; ++j)
          *(_BYTE *)(v10 + j) = *(_BYTE *)(*(_QWORD *)(a3 + 88) + 4 * a2[v26] + j);
        ++v26;
        v10 += 4;
        if (v26 == v8)
          return 0;
      }
      return 46;
    }
    return 0;
  }
  if (v14 == 8 && v13 == 4)
  {
    if (v8)
    {
      v28 = (char *)(a2 + 1);
      v29 = (_BYTE *)(v10 + 3);
      do
      {
        v30 = *(v28 - 1);
        *(v29 - 1) = v30;
        *(v29 - 2) = v30;
        *(v29 - 3) = v30;
        v31 = *v28;
        v28 += 2;
        *v29 = v31;
        v29 += 4;
        --v8;
      }
      while (v8);
    }
    return 0;
  }
  if (v14 == 8 && v13 == 6)
  {
    if (v8)
    {
      for (k = 0; k != v8; ++k)
      {
        for (m = 0; m != 4; ++m)
          *(_BYTE *)(v10 + m) = a2[m];
        result = 0;
        v10 += 4;
        a2 += 4;
      }
      return result;
    }
    return 0;
  }
  if (v14 == 16 && !v13)
  {
    if (v8)
    {
      v34 = 0;
      do
      {
        v35 = a2[2 * v34];
        v36 = (unsigned __int8 *)(v10 + 4 * v34);
        v36[2] = v35;
        v36[1] = v35;
        *v36 = v35;
        if (*(_BYTE *)(a3 + 80))
        {
          v37 = v34 + 1;
          v38 = __rev16(*(unsigned __int16 *)&a2[v34]) == *(_QWORD *)(a3 + 56);
        }
        else
        {
          v38 = 0;
          v37 = v34 + 1;
        }
        result = 0;
        *(_BYTE *)(v10 + ((4 * v34) | 3)) = v38 - 1;
        v34 = v37;
      }
      while (v37 != v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 2)
  {
    if (v8)
    {
      v39 = 0;
      v40 = v10;
      v41 = (char *)a2;
      do
      {
        v42 = 0;
        v43 = v41;
        do
        {
          v44 = *v43;
          v43 += 2;
          *(_BYTE *)(v40 + v42++) = v44;
        }
        while (v42 != 3);
        v46 = *(_BYTE *)(a3 + 80)
           && (a2[(6 * v39) | 1] | ((unint64_t)a2[6 * v39] << 8)) == *(_QWORD *)(a3 + 56)
           && (v45 = &a2[6 * v39], __rev16(*((unsigned __int16 *)v45 + 1)) == *(_QWORD *)(a3 + 64))
           && __rev16(*((unsigned __int16 *)v45 + 2)) == *(_QWORD *)(a3 + 72);
        result = 0;
        *(_BYTE *)(v10 + ((4 * v39++) | 3)) = v46 - 1;
        v41 += 6;
        v40 += 4;
      }
      while (v39 != v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 4)
  {
    if (v8)
    {
      v47 = (_BYTE *)(v10 + 3);
      v48 = (char *)(a2 + 2);
      result = 0;
      do
      {
        v49 = *(v48 - 2);
        *(v47 - 1) = v49;
        *(v47 - 2) = v49;
        *(v47 - 3) = v49;
        v50 = *v48;
        v48 += 4;
        *v47 = v50;
        v47 += 4;
        --v8;
      }
      while (v8);
      return result;
    }
    return 0;
  }
  if (v14 == 16 && v13 == 6)
  {
    if (v8)
    {
      for (n = 0; n != v8; ++n)
      {
        v52 = 0;
        v53 = (char *)a2;
        do
        {
          v54 = *v53;
          v53 += 2;
          *(_BYTE *)(v10 + v52++) = v54;
        }
        while (v52 != 4);
        result = 0;
        a2 += 8;
        v10 += 4;
      }
      return result;
    }
    return 0;
  }
  if (v14 <= 7 && !v13)
  {
    if (v8)
    {
      v55 = 0;
      v56 = 0;
      do
      {
        v57 = *(_QWORD *)(a3 + 24);
        if (v57)
        {
          v58 = 0;
          v59 = v57 - 1;
          do
          {
            v60 = (a2[v56 >> 3] >> (~(_BYTE)v56 & 7)) & 1;
            ++v56;
            v58 += v60 << v59--;
          }
          while (v59 < v57);
        }
        else
        {
          v58 = 0;
        }
        v61 = 0;
        v62 = 255 * v58;
        v63 = ~(-1 << v57);
        v64 = (_BYTE *)(v10 + 4 * v55);
        v64[2] = v62 / v63;
        v64[1] = v62 / v63;
        *v64 = v62 / v63;
        if (*(_BYTE *)(a3 + 80) && v62 >= v63)
        {
          v65 = *(unsigned int *)(a3 + 24);
          v61 = *(_QWORD *)(a3 + 56) == ~(-1 << v65) && v65 != 0;
        }
        result = 0;
        *(_BYTE *)(v10 + ((4 * v55++) | 3)) = v61 - 1;
      }
      while (v55 != v8);
      return result;
    }
    return 0;
  }
  result = 0;
  if (v14 <= 7 && v13 == 3 && v8)
  {
    v67 = 0;
    v68 = 0;
    while (1)
    {
      v69 = *(_QWORD *)(a3 + 24);
      if (v69)
      {
        v70 = 0;
        v71 = v69 - 1;
        do
        {
          v72 = (a2[v68 >> 3] >> (~(_BYTE)v68 & 7)) & 1;
          ++v68;
          v70 += v72 << v71--;
        }
        while (v71 < v69);
      }
      else
      {
        v70 = 0;
      }
      v73 = 4 * v70;
      if (v73 >= *(_QWORD *)(a3 + 96) - *(_QWORD *)(a3 + 88))
        break;
      for (ii = 0; ii != 4; ++ii)
        *(_BYTE *)(v10 + ii) = *(_BYTE *)(*(_QWORD *)(a3 + 88) + v73 + ii);
      result = 0;
      ++v67;
      v10 += 4;
      if (v67 == v8)
        return result;
    }
    return 47;
  }
  return result;
}

uint64_t sub_100017D14(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unsigned int v4;

  result = 31;
  switch(a1)
  {
    case 0:
      if (((1 << a2) & 0x10116) != 0)
        v4 = 0;
      else
        v4 = 37;
      if (a2 <= 0x10)
        result = v4;
      else
        result = 37;
      break;
    case 2:
    case 4:
    case 6:
      if (((a2 - 8) & 0xFFFFFFFFFFFFFFF7) != 0)
        result = 37;
      else
        result = 0;
      break;
    case 3:
      if (a2 - 1 > 7)
        result = 37;
      else
        result = dword_1000236C8[a2 - 1];
      break;
    default:
      return result;
  }
  return result;
}

char *sub_100017D9C(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  int64_t v25;
  char v26;
  char *v27;
  char *v28;
  size_t v29;
  char *v30;
  char *v31;
  char *v32;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      sub_100017F84();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
    {
      v16 = v15;
      v17 = (char *)operator new(v15);
    }
    else
    {
      v16 = 0;
      v17 = 0;
    }
    v27 = &v13[(_QWORD)v17];
    memcpy(&v13[(_QWORD)v17], __src, a5);
    v28 = &v13[(_QWORD)v17];
    v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(_QWORD)v17 - 1] = v13[(_QWORD)(v11 - 1)];
        --v13;
      }
      while (v13);
      v10 = *(char **)(a1 + 8);
      v28 = v17;
    }
    v30 = &v27[a5];
    v31 = &v17[v29];
    if (v10 != v5)
      memmove(v30, v5, v10 - v5);
    v32 = *(char **)a1;
    *(_QWORD *)a1 = v28;
    *(_QWORD *)(a1 + 8) = &v30[v10 - v5];
    *(_QWORD *)(a1 + 16) = v31;
    if (v32)
      operator delete(v32);
    return v27;
  }
  v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v19 = &__src[a5];
    v21 = *(char **)(a1 + 8);
LABEL_17:
    v22 = &v5[a5];
    v23 = &v21[-a5];
    v24 = v21;
    if (&v21[-a5] < v10)
    {
      v25 = &v10[a5] - v21;
      v24 = v21;
      do
      {
        v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(_QWORD *)(a1 + 8) = v24;
    if (v21 != v22)
      memmove(&v5[a5], v5, v21 - v22);
    if (v19 != __src)
      memmove(v5, __src, v19 - __src);
    return v5;
  }
  v19 = &__src[v18];
  v20 = a4 - &__src[v18];
  if (a4 != &__src[v18])
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  v21 = &v10[v20];
  *(_QWORD *)(a1 + 8) = &v10[v20];
  if (v18 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_100017F84()
{
  sub_100017F98("vector");
}

void sub_100017F98(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100017FE8(exception, a1);
}

void sub_100017FD4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100017FE8(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_10001800C()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void sub_100018034(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      sub_100017F84();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

_QWORD *sub_10001815C(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1000181CC(a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_1000181B0(_Unwind_Exception *exception_object)
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

char *sub_1000181CC(_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    sub_100017F84();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *sub_10001820C(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

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
  v4 = (void *)a1[1];
  if (v4)
  {
    a1[2] = v4;
    operator delete(v4);
  }
  return a1;
}

unint64_t sub_10001825C(int *a1, uint64_t a2, unint64_t *a3, uint64_t *a4, unint64_t a5)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  int v12;

  v5 = 0;
  v6 = *a3;
  v7 = *a4;
  v8 = (unint64_t)((a4[1] - *a4) >> 3) >> 1;
  while (1)
  {
    v9 = v6 >> 3;
    if ((v6 & 7) == 0 && v9 >= a5)
    {
      v12 = 10;
      goto LABEL_9;
    }
    v10 = *(unsigned __int8 *)(a2 + v9);
    *a3 = v6 + 1;
    if (v5 >= v8)
      break;
    v11 = *(_QWORD *)(v7 + ((8 * ((v10 >> (v6 & 7)) & 1)) | (16 * v5)));
    *a1 = 0;
    ++v6;
    v5 = v11 - v8;
    if (v11 < v8)
      return v11;
  }
  v12 = 11;
LABEL_9:
  v11 = 0;
  *a1 = v12;
  return v11;
}

uint64_t sub_1000182E8(_QWORD *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  unint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  void *__p;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;

  v7 = *a2;
  v6 = a2[1];
  v8 = (char *)v6 - (char *)*a2;
  v9 = v8 >> 3;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  sub_1000186AC(&v45, v8 >> 3);
  v42 = 0;
  v43 = 0;
  v44 = 0;
  __p = 0;
  sub_100018588(&v42, a3 + 1, &__p);
  __p = 0;
  v40 = 0;
  v41 = 0;
  v38 = 0;
  sub_100018588(&__p, a3 + 1, &v38);
  if (v6 != v7)
  {
    v10 = *a2;
    v11 = v42;
    if (v9 <= 1)
      v12 = 1;
    else
      v12 = v8 >> 3;
    do
    {
      v13 = *v10++;
      ++v11[v13];
      --v12;
    }
    while (v12);
  }
  if (a3)
  {
    v14 = (uint64_t *)v42;
    v15 = (uint64_t *)((char *)__p + 8);
    v16 = *(_QWORD *)__p;
    do
    {
      v17 = *v14++;
      v16 = 2 * (v17 + v16);
      *v15++ = v16;
      --a3;
    }
    while (a3);
  }
  if (v6 != v7)
  {
    v18 = *a2;
    v19 = __p;
    v20 = v45;
    if (v9 <= 1)
      v21 = 1;
    else
      v21 = v8 >> 3;
    do
    {
      v23 = *v18++;
      v22 = v23;
      if (v23)
      {
        v24 = v19[v22];
        v19[v22] = v24 + 1;
        *v20 = v24;
      }
      ++v20;
      --v21;
    }
    while (v21);
  }
  a1[1] = *a1;
  v38 = 0x7FFFLL;
  sub_10001867C((uint64_t)a1, v8 >> 2, &v38);
  if (v6 == v7)
  {
LABEL_31:
    v30 = 0;
  }
  else
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = *a2;
    if (v9 <= 1)
      v29 = 1;
    else
      v29 = v8 >> 3;
    v30 = 1;
    while (1)
    {
      v31 = v28[v25];
      if (v31)
        break;
LABEL_30:
      v30 = ++v25 < v9;
      if (v25 == v29)
        goto LABEL_31;
    }
    v32 = 0;
    v33 = v45;
    while (v27 <= v9 - 2)
    {
      v34 = (v33[v25] >> (v31 + ~(_BYTE)v32)) & 1 | (2 * v27);
      v35 = *a1;
      v36 = *(_QWORD *)(*a1 + 8 * v34);
      if (v36 == 0x7FFF)
      {
        if (++v32 == v31)
        {
          v27 = 0;
          *(_QWORD *)(v35 + 8 * v34) = v25;
        }
        else
        {
          v27 = v26 + 1;
          *(_QWORD *)(v35 + 8 * v34) = ++v26 + v9;
        }
      }
      else
      {
        v27 = v36 - v9;
        ++v32;
      }
      v31 = v28[v25];
      if (v32 >= v31)
        goto LABEL_30;
    }
  }
  if (__p)
  {
    v40 = __p;
    operator delete(__p);
  }
  if (v42)
  {
    v43 = v42;
    operator delete(v42);
  }
  if (v45)
  {
    v46 = v45;
    operator delete(v45);
  }
  if (v30)
    return 55;
  else
    return 0;
}

void sub_10001853C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_100018588(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100018608(a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1000185EC(_Unwind_Exception *exception_object)
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

char *sub_100018608(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_100017F84();
  result = (char *)sub_100018648((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *sub_100018648(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_10001800C();
  return operator new(8 * a2);
}

void sub_10001867C(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    sub_100018720((void **)a1, a2 - v3, a3);
  }
}

_QWORD *sub_1000186AC(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_100018608(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_100018704(_Unwind_Exception *exception_object)
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

void sub_100018720(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      sub_100017F84();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)sub_100018648(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *sub_100018830(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = sub_1000181CC(result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_10001888C(_Unwind_Exception *exception_object)
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

uint64_t wait_for_io_service_matching_dict(CFTypeRef cf, unsigned int a2)
{
  unsigned int v4;
  uint64_t MatchingService;
  unsigned int v6;
  const __CFString *v7;
  char CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = 0;
  do
  {
    CFRetain(cf);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)cf);
    if ((_DWORD)MatchingService)
      break;
    v6 = a2 - v4 >= 3 ? 3 : a2 - v4;
    v7 = CFCopyDescription(cf);
    CStringPtr = CFStringGetCStringPtr(v7, 0);
    ramrod_log_msg("waiting for matching IOKit service: %s\n", v9, v10, v11, v12, v13, v14, v15, CStringPtr);
    sleep(v6);
    v4 += v6;
    CFRelease(v7);
  }
  while (v4 < a2);
  CFRelease(cf);
  return MatchingService;
}

const __CFArray *wait_for_io_service_matching_any_dict(const __CFArray *result, unsigned int a2)
{
  const void *v3;
  CFIndex Count;
  unsigned int v5;
  unsigned int v6;
  CFIndex v7;
  const void *ValueAtIndex;
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char buffer[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int v23;

  if (result)
  {
    v3 = result;
    Count = CFArrayGetCount(result);
    v5 = 0;
    while (1)
    {
      v6 = a2 - v5 >= 3 ? 3 : a2 - v5;
      if (Count >= 1)
        break;
LABEL_10:
      v9 = CFCopyDescription(v3);
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      *(_OWORD *)buffer = 0u;
      v18 = 0u;
      if (CFStringGetCString(v9, buffer, 100, 0x8000100u))
        ramrod_log_msg("waiting for matching IOKit service: %s\n", v10, v11, v12, v13, v14, v15, v16, (char)buffer);
      CFRelease(v9);
      sleep(v6);
      v5 += v6;
      if (v5 >= a2)
        return 0;
    }
    v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v7);
      CFRetain(ValueAtIndex);
      result = (const __CFArray *)IOServiceGetMatchingService(kIOMasterPortDefault, (CFDictionaryRef)ValueAtIndex);
      if ((_DWORD)result)
        break;
      if (Count == ++v7)
        goto LABEL_10;
    }
  }
  return result;
}

uint64_t wait_for_io_service_matching_resource_with_timeout(const char *a1, unsigned int a2)
{
  CFMutableDictionaryRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFStringRef v21;
  char v23;

  v4 = IOServiceMatching("IOResources");
  if (v4)
  {
    v12 = v4;
    v13 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x8000100u);
    if (v13)
    {
      v21 = v13;
      CFDictionarySetValue(v12, CFSTR("IOResourceMatch"), v13);
      CFRelease(v21);
      return wait_for_io_service_matching_dict(v12, a2);
    }
    ramrod_log_msg("unable to convert resource name to CFString\n", v14, v15, v16, v17, v18, v19, v20, v23);
  }
  else
  {
    ramrod_log_msg("unable to create matching dictionary for resource '%s'\n", v5, v6, v7, v8, v9, v10, v11, (char)a1);
  }
  return 0;
}

uint64_t wait_for_io_service_matching_class_with_timeout(const char *a1, unsigned int a2)
{
  char v3;
  CFMutableDictionaryRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (char)a1;
  v4 = IOServiceMatching(a1);
  if (v4)
    return wait_for_io_service_matching_dict(v4, a2);
  ramrod_log_msg("unable to create matching dictionary for class '%s'\n", v5, v6, v7, v8, v9, v10, v11, v3);
  return 0;
}

uint64_t wait_for_io_service_matching_class(const char *a1)
{
  return wait_for_io_service_matching_class_with_timeout(a1, 0xFFFFFFFF);
}

const __CFArray *wait_for_io_service_matching_any_class_with_timeout(const __CFArray *a1, unsigned int a2)
{
  uint64_t Count;
  CFMutableArrayRef Mutable;
  const __CFArray *v6;
  CFIndex v7;
  const __CFString *ValueAtIndex;
  const __CFString *v9;
  CFTypeID v10;
  CFIndex Length;
  int64_t MaximumSizeForEncoding;
  CFIndex v13;
  char *v14;
  char *v15;
  CFMutableDictionaryRef v16;
  const __CFArray *v17;

  if (!a1)
    return 0;
  Count = CFArrayGetCount(a1);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
  if (!Mutable)
    return 0;
  v6 = Mutable;
  if (Count < 1)
  {
LABEL_12:
    v17 = wait_for_io_service_matching_any_dict(v6, a2);
  }
  else
  {
    v7 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v7);
      if (!ValueAtIndex)
        break;
      v9 = ValueAtIndex;
      v10 = CFGetTypeID(ValueAtIndex);
      if (v10 != CFStringGetTypeID())
        break;
      Length = CFStringGetLength(v9);
      MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      if (MaximumSizeForEncoding < 1)
        break;
      v13 = MaximumSizeForEncoding;
      v14 = (char *)malloc(MaximumSizeForEncoding);
      if (!v14)
        break;
      v15 = v14;
      if (!CFStringGetCString(v9, v14, v13, 0x8000100u))
        break;
      v16 = IOServiceMatching(v15);
      free(v15);
      if (!v16)
        break;
      CFArrayAppendValue(v6, v16);
      CFRelease(v16);
      if (Count == ++v7)
        goto LABEL_12;
    }
    v17 = 0;
  }
  CFRelease(v6);
  return v17;
}

const __CFArray *wait_for_io_service_matching_any_class(const __CFArray *a1)
{
  return wait_for_io_service_matching_any_class_with_timeout(a1, 0xFFFFFFFF);
}

uint64_t wait_for_io_service_matching_name(const char *a1)
{
  char v1;
  CFMutableDictionaryRef v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = (char)a1;
  v2 = IOServiceNameMatching(a1);
  if (v2)
    return wait_for_io_service_matching_dict(v2, 0xFFFFFFFF);
  ramrod_log_msg("unable to create matching dictionary for service '%s'\n", v3, v4, v5, v6, v7, v8, v9, v1);
  return 0;
}

__CFDictionary *create_embedded_storage_service_query_dict(char *cStr)
{
  CFStringRef v1;
  CFStringRef v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;

  v1 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v1)
    return 0;
  v2 = v1;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    CFDictionaryAddValue(Mutable, v2, kCFBooleanTrue);
    v5 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v6 = v5;
    if (v5)
      CFDictionaryAddValue(v5, CFSTR("IOPropertyMatch"), v4);
    CFRelease(v2);
  }
  else
  {
    v6 = 0;
    v4 = (__CFDictionary *)v2;
  }
  CFRelease(v4);
  return v6;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createPrimaryUserLayoutWithOnUserVolumePath_fromSystemVolumePath_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPrimaryUserLayoutWithOnUserVolumePath:fromSystemVolumePath:withError:");
}

id objc_msgSend_createPrimaryUserOnSharedDataVolumePath_withError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPrimaryUserOnSharedDataVolumePath:withError:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dryRunOnly(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dryRunOnly");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_matchesInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "matchesInString:options:range:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfFirstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfFirstMatchInString:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeFSItem_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeFSItem:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_traverseFolderAndRemoveItems_exceptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traverseFolderAndRemoveItems:exceptions:");
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uid");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}

id objc_msgSend_userUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userUUID");
}
