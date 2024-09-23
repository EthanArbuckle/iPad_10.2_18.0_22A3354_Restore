uint64_t sub_1000037B4(unsigned int a1, const void *a2, size_t a3)
{
  const __CFDictionary *v5;
  io_service_t MatchingService;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
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
  char outputStruct;
  uint64_t input;
  io_connect_t connect;

  connect = 0;
  input = a1;
  v5 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  v13 = MatchingService;
  if (MatchingService)
  {
    v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v14)
    {
      v28 = v14;
      sub_10001595C("storeBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v15, v16, v17, v18, v19, v20, v14);
    }
    else
    {
      v21 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0, 0, 0, 0);
      v28 = v21;
      if ((_DWORD)v21)
        sub_10001595C("storeBlastableBytes", CFSTR("Can't store blastable bytes: %08x"), v22, v23, v24, v25, v26, v27, v21);
    }
  }
  else
  {
    sub_10001595C("storeBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v7, v8, v9, v10, v11, v12, outputStruct);
    v28 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v13)
    IOObjectRelease(v13);
  return v28;
}

uint64_t sub_1000038E4(unsigned int a1, void *a2, size_t *a3)
{
  const __CFDictionary *v5;
  io_service_t MatchingService;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
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
  char outputStruct;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output;
  io_connect_t connect;

  connect = 0;
  input = a1;
  output = 0;
  outputCnt = 1;
  v5 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  v13 = MatchingService;
  if (MatchingService)
  {
    v14 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v14)
    {
      v28 = v14;
      sub_10001595C("loadBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v15, v16, v17, v18, v19, v20, v14);
    }
    else
    {
      v21 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, a2, a3);
      v28 = v21;
      if ((_DWORD)v21)
        sub_10001595C("loadBlastableBytes", CFSTR("Can't load blastable bytes: %08x"), v22, v23, v24, v25, v26, v27, v21);
    }
  }
  else
  {
    sub_10001595C("loadBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v7, v8, v9, v10, v11, v12, outputStruct);
    v28 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v13)
    IOObjectRelease(v13);
  return v28;
}

uint64_t sub_100003A1C(unsigned int a1)
{
  const __CFDictionary *v2;
  io_service_t MatchingService;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  io_object_t v10;
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
  char outputStruct;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output;
  io_connect_t connect;
  size_t v32;
  _BYTE v33[1024];

  bzero(v33, 0x400uLL);
  v32 = 1024;
  connect = 0;
  input = a1;
  output = 0;
  outputCnt = 1;
  v2 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  v10 = MatchingService;
  if (MatchingService)
  {
    v11 = IOServiceOpen(MatchingService, mach_task_self_, 0, &connect);
    if ((_DWORD)v11)
    {
      v18 = v11;
      sub_10001595C("effaceBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      v18 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, v33, &v32);
      if (!(_DWORD)v18)
      {
        v19 = IOConnectCallMethod(connect, 7u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
        v18 = v19;
        if ((_DWORD)v19)
          sub_10001595C("effaceBlastableBytes", CFSTR("efface failed: 0x%x"), v20, v21, v22, v23, v24, v25, v19);
      }
    }
  }
  else
  {
    sub_10001595C("effaceBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v4, v5, v6, v7, v8, v9, outputStruct);
    v18 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v10)
    IOObjectRelease(v10);
  return v18;
}

id sub_100003C38(uint64_t a1)
{
  id result;

  if (-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", CFSTR("/private/var/root/Library/Preferences/spaced_repetition.plist")))
  {
    -[NSFileManager moveItemAtPath:toPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "moveItemAtPath:toPath:error:", CFSTR("/private/var/root/Library/Preferences/spaced_repetition.plist"), CFSTR("/private/var/root/Library/Preferences/com.apple.spaced_repetition.plist"), 0);
  }
  result = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "initialize");
  qword_100035888 = (uint64_t)result;
  return result;
}

void sub_1000042D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004408(uint64_t a1)
{
  NSLog(CFSTR("setting next verification timer[%d] for %lu seconds"), ++dword_100035854, *(_QWORD *)(a1 + 40));
  return -[NSRunLoop addTimer:forMode:](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "addTimer:forMode:", +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "repetitionPeriodTimer:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_100035854), 0, (double)*(uint64_t *)(a1 + 40)), NSRunLoopCommonModes);
}

uint64_t sub_100004630()
{
  if (sub_1000108A4()
    || !-[SpacedRepetitionManager beginNewRepetitionPeriod](+[SpacedRepetitionManager sharedInstance](SpacedRepetitionManager, "sharedInstance"), "beginNewRepetitionPeriod"))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

uint64_t sub_10000466C()
{
  if (sub_1000108A4()
    || !-[SpacedRepetitionManager continueRepetitionPeriod](+[SpacedRepetitionManager sharedInstance](SpacedRepetitionManager, "sharedInstance"), "continueRepetitionPeriod"))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

void sub_1000046A8(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_1000046B8(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class sub_1000046C4(uint64_t a1)
{
  Class result;

  sub_100004718();
  result = objc_getClass("BKDeviceManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001E954();
  qword_100035890 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_100004718()
{
  void *v0;
  __int128 v1;
  uint64_t v2;

  v0 = 0;
  if (!qword_100035898)
  {
    v1 = off_10002CC08;
    v2 = 0;
    qword_100035898 = _sl_dlopen(&v1, &v0);
  }
  if (!qword_100035898)
    sub_10001E9B8(&v0);
  if (v0)
    free(v0);
}

Class sub_1000047BC(uint64_t a1)
{
  Class result;

  sub_100004718();
  result = objc_getClass("BKDevice");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001EA1C();
  qword_1000358A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

const __CFDictionary *sub_100004810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  const __CFDictionary *v15;
  char __str[1025];

  v15 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  v6 = 0;
  if (!sub_100004908(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    v6 = v15;
    if (v15)
    {
      if (!sub_1000100C8(v15, CFSTR("KeyBagKeys")))
      {
        sub_10001595C("KBLoadSystemKeyBag", CFSTR("Keybag %s doesn't actually contain keys"), v8, v9, v10, v11, v12, v13, (char)__str);
        CFRelease(v6);
        return 0;
      }
    }
    else
    {
      sub_10001595C("KBLoadSystemKeyBag", CFSTR(" Empty Keybag returned from KBLoadLoadKeyBagFile"), v0, v1, v2, v3, v4, v5, v14);
    }
  }
  return v6;
}

uint64_t sub_100004908(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__fs::filesystem::path __str[42];
  char v26[1025];

  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a1, a2);
  v4 = (const __CFDictionary *)sub_100010674((const char *)__str);
  v5 = v4;
  if (v4)
    v6 = CFDictionaryGetValue(v4, CFSTR("KeybagxART")) != 0;
  else
    v6 = 0;
  v7 = sub_10000827C(":/defaults", CFSTR("no-effaceable-storage"));
  if (v6 || v7)
  {
    *a3 = 0;
    v16 = sub_100010674((const char *)__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", (const char *)__str);
      v17 = sub_100010674(v26);
      *a3 = v17;
      if (!v17)
      {
        v15 = 4294967289;
        sub_10001595C("KBLoadLoadKeyBagFile", CFSTR("Unable to load keybag with No Crypto: %d"), v18, v19, v20, v21, v22, v23, -7);
        if (!v5)
          return v15;
        goto LABEL_13;
      }
    }
    v15 = 0;
  }
  else
  {
    v8 = sub_100008B14(__str, a3);
    v15 = v8;
    if ((_DWORD)v8)
    {
      sub_10001595C("KBLoadLoadKeyBagFile", CFSTR("Unable to load keybag with Crypto: %d"), v9, v10, v11, v12, v13, v14, v8);
      if (!v5)
        return v15;
      goto LABEL_13;
    }
  }
  if (v5)
LABEL_13:
    CFRelease(v5);
  return v15;
}

CFMutableDictionaryRef sub_100004A70(uint64_t a1)
{
  int v2;
  const __CFDictionary *v3;
  CFStringRef v4;
  const __CFDictionary *v5;
  const __CFDictionary *Value;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef result;
  const __CFDictionary *v16;
  char __str[1025];

  v16 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  v2 = sub_100004908(__str, "userbag", (CFPropertyListRef *)&v16);
  v3 = v16;
  if (!v2 && v16)
  {
    v4 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a1);
    if (!v4)
    {
      MutableCopy = 0;
      goto LABEL_10;
    }
    v5 = (const __CFDictionary *)v4;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v4);
    if (Value)
    {
      v7 = Value;
      if (sub_1000100C8(Value, CFSTR("KeyBagKeys")))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v7);
LABEL_9:
        CFRelease(v3);
        v3 = v5;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }
      sub_10001595C("KBLoadUserKeybag", CFSTR("Keybag %s doesn't actually contain keys"), v8, v9, v10, v11, v12, v13, (char)__str);
    }
    MutableCopy = 0;
    goto LABEL_9;
  }
  MutableCopy = 0;
  result = 0;
  if (v16)
    goto LABEL_10;
  return result;
}

uint64_t sub_100004BD4(const void *a1)
{
  __CFDictionary *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char __str[1025];

  snprintf(__str, 0x401uLL, "%s/%s", "/private/var/", "keybags");
  v2 = sub_100004810();
  if (!v2)
    return 0;
  v3 = v2;
  if (a1)
    CFDictionarySetValue(v2, CFSTR("BackupKeyBagKeys"), a1);
  else
    CFDictionaryRemoveValue(v2, CFSTR("BackupKeyBagKeys"));
  if (sub_100004CBC(v3, __str, 1111574321, "systembag", 0, v4, v5, v6))
    v7 = 0xFFFFFFFFLL;
  else
    v7 = 0;
  CFRelease(v3);
  return v7;
}

uint64_t sub_100004CBC(const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v10;
  unsigned int v13;
  char v14;
  uint64_t v15;
  std::error_code *v16;
  int v17;
  int *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int *v27;
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
  int *v40;
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
  CFDataRef v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  CFDataRef v60;
  CFDataRef v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  CFDataRef v68;
  const __CFData *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const __CFData *v76;
  CCCryptorStatus v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  size_t Length;
  size_t OutputLength;
  __CFData *Mutable;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __CFData *v93;
  _CCCryptor *v94;
  const UInt8 *BytePtr;
  UInt8 *MutableBytePtr;
  CCCryptorStatus v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _CCCryptor *v104;
  UInt8 *v105;
  CFMutableDictionaryRef v106;
  __CFDictionary *v107;
  CFNumberRef v108;
  std::error_code *v109;
  int v110;
  unsigned int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
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
  int *v137;
  char v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  int *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  const __CFString *v162;
  int *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  const __CFString *v170;
  int *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  int *v178;
  const __CFString *v179;
  char v180;
  std::__fs::filesystem::path *p_from;
  char v182;
  size_t v183;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  int v186;
  CFTypeRef cf;
  unsigned int valuePtr;
  std::__fs::filesystem::path __str[42];
  _OWORD v190[3];
  int v191;
  int v192;
  __int128 v193;
  UInt8 v194[35];
  std::__fs::filesystem::path __from;
  CFRange v196;
  CFRange v197;

  v8 = a5;
  v10 = a3;
  v13 = sub_100009158(0xFFFFFFFFLL, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, CFSTR("KeyBagVersion"), CFSTR("1"));
  if (v13)
    CFDictionarySetValue(a1, CFSTR("KeybagxART"), CFSTR("1"));
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    v40 = __error();
    strerror(*v40);
    sub_10001595C("KBSaveKeyBag", CFSTR("Can't create %s: %s"), v41, v42, v43, v44, v45, v46, (char)a2);
    return 0xFFFFFFFFLL;
  }
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a2, a4);
  if (sub_10000827C(":/defaults", CFSTR("no-effaceable-storage")))
    v14 = 1;
  else
    v14 = v13;
  if ((v14 & 1) != 0)
  {
    if (v13 && !sub_10000827C(":/defaults", CFSTR("no-effaceable-storage")))
      sub_100003A1C(0x42414731u);
    bzero(&__from, 0x401uLL);
    v15 = 0xFFFFFFFFLL;
    v192 = -1;
    snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
    if (!sub_1000103F8(a1, (const char *)&__from, &v192))
    {
      if (renamex_np((const char *)&__from, (const char *)__str, 2u) && (__error(), rename(&__from, __str, v16), v17))
      {
        v171 = __error();
        strerror(*v171);
        sub_10001595C("KBSecureSaveObjectNoCrypto", CFSTR("could not rename %s to %s: %s (%d)"), v172, v173, v174, v175, v176, v177, (char)&__from);
      }
      else if (fcntl(v192, 51))
      {
        v154 = __error();
        strerror(*v154);
        sub_10001595C("KBSecureSaveObjectNoCrypto", CFSTR("Unable to fsync %s: %s"), v155, v156, v157, v158, v159, v160, (char)&__from);
      }
      else
      {
        if (unlink((const char *)&__from))
        {
          v18 = __error();
          v19 = strerror(*v18);
          sub_10001595C("KBSecureSaveObjectNoCrypto", CFSTR("unlink failed: %s"), v20, v21, v22, v23, v24, v25, v19);
        }
        v15 = 0;
      }
    }
    if (v192 != -1 && close(v192))
    {
      v26 = v192;
      v27 = __error();
      strerror(*v27);
      sub_10001595C("KBSecureSaveObjectNoCrypto", CFSTR("failed to close(%d): %s"), v28, v29, v30, v31, v32, v33, v26);
    }
    return v15;
  }
  dataOutMoved = 0;
  cryptorRef = 0;
  v183 = 52;
  memset(v190, 0, sizeof(v190));
  v191 = 0;
  if (!v8)
  {
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, (char *)&v190[1] + 4))
    {
      v179 = CFSTR("Can't create key");
    }
    else
    {
      if (!SecRandomCopyBytes(kSecRandomDefault, 0x10uLL, (char *)v190 + 4))
      {
LABEL_28:
        v53 = CFDataCreate(0, (const UInt8 *)&v190[1] + 4, 32);
        if (v53)
        {
          v60 = v53;
          v61 = CFDataCreate(0, (const UInt8 *)v190 + 4, 16);
          if (v61)
          {
            v68 = v61;
            v69 = (const __CFData *)sub_1000101F4(a1);
            if (!v69)
            {
              sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Can't serialize object"), v70, v71, v72, v73, v74, v75, v180);
              v93 = 0;
              v15 = 4294967291;
LABEL_59:
              CFRelease(v60);
              CFRelease(v68);
              if (v93)
                CFRelease(v93);
              goto LABEL_61;
            }
            v76 = v69;
            v77 = CCCryptorCreate(0, 0, 1u, (char *)&v190[1] + 4, 0x20uLL, (char *)v190 + 4, &cryptorRef);
            if (v77)
            {
              sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Can't create cryptor: %d"), v78, v79, v80, v81, v82, v83, v77);
              v93 = 0;
            }
            else
            {
              Length = CFDataGetLength(v76);
              OutputLength = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              Mutable = CFDataCreateMutable(0, OutputLength);
              v93 = Mutable;
              if (!Mutable)
              {
                v161 = "KBSecureSaveObjectWithCrypto";
                v162 = CFSTR("Can't create crypt buffer");
LABEL_74:
                sub_10001595C(v161, v162, v87, v88, v89, v90, v91, v92, v180);
                v15 = 4294967291;
                goto LABEL_58;
              }
              CFDataSetLength(Mutable, OutputLength);
              v94 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v76);
              MutableBytePtr = CFDataGetMutableBytePtr(v93);
              v97 = CCCryptorUpdate(v94, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v97)
              {
                v104 = cryptorRef;
                v105 = CFDataGetMutableBytePtr(v93);
                CCCryptorFinal(v104, &v105[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                valuePtr = v10;
                cf = 0;
                v186 = -1;
                v106 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                if (v106)
                {
                  v107 = v106;
                  v108 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                  if (!v108)
                    goto LABEL_81;
                  CFDictionaryAddValue(v107, CFSTR("_MKBIV"), v68);
                  CFDictionaryAddValue(v107, CFSTR("_MKBWIPEID"), v108);
                  CFDictionaryAddValue(v107, CFSTR("_MKBPAYLOAD"), v93);
                  snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
                  if (sub_1000103F8(v107, (const char *)&__from, &v186))
                    goto LABEL_81;
                  if (renamex_np((const char *)&__from, (const char *)__str, 2u))
                  {
                    __error();
                    rename(&__from, __str, v109);
                    if (v110)
                    {
                      v178 = __error();
                      strerror(*v178);
                      p_from = &__from;
                      v170 = CFSTR("could not rename %s to %s: %s (%d)");
LABEL_80:
                      sub_10001595C("KBSecureSaveObject", v170, v131, v132, v133, v134, v135, v136, (char)p_from);
                      goto LABEL_81;
                    }
                  }
                  if (fcntl(v186, 51))
                  {
                    v163 = __error();
                    strerror(*v163);
                    sub_10001595C("KBSecureSaveObject", CFSTR("Unable to fsync %s: %s"), v164, v165, v166, v167, v168, v169, (char)&__from);
LABEL_81:
                    v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v186 != -1 && close(v186))
                    {
                      v145 = v186;
                      v146 = __error();
                      strerror(*v146);
                      sub_10001595C("KBSecureSaveObject", CFSTR("failed to close(%d): %s"), v147, v148, v149, v150, v151, v152, v145);
                    }
                    CFRelease(v107);
                    if (cf)
                      CFRelease(cf);
                    if (v108)
                      CFRelease(v108);
                    goto LABEL_58;
                  }
                  if ((v8 & 1) == 0)
                  {
                    v111 = valuePtr;
                    if (CFDataGetLength(v68) != 16 || CFDataGetLength(v60) != 32)
                    {
                      sub_10001595C("storeWipeIDInfo", CFSTR("trying to store invalid iv or secret"), v112, v113, v114, v115, v116, v117, (char)p_from);
                      goto LABEL_46;
                    }
                    memset(v194, 0, 32);
                    v193 = 0u;
                    v192 = v111;
                    v196.location = 0;
                    v196.length = 16;
                    CFDataGetBytes(v68, v196, (UInt8 *)&v193);
                    v197.location = 0;
                    v197.length = 32;
                    CFDataGetBytes(v60, v197, v194);
                    v118 = sub_1000037B4(v111, &v192, 0x34uLL);
                    if (v118)
                    {
                      sub_10001595C("storeWipeIDInfo", CFSTR("Unable to save wipe info: %08x"), v119, v120, v121, v122, v123, v124, v118);
LABEL_46:
                      sub_10001595C("KBSecureSaveObject", CFSTR("Oh no! Can't save wipe ID"), v125, v126, v127, v128, v129, v130, v182);
                    }
                  }
                  if (!sub_100008B14(__str, &cf))
                  {
                    if (unlink((const char *)&__from))
                    {
                      v137 = __error();
                      v138 = strerror(*v137);
                      sub_10001595C("KBSecureSaveObject", CFSTR("unlink failed: %s"), v139, v140, v141, v142, v143, v144, v138);
                    }
                    v15 = 0;
                    goto LABEL_51;
                  }
                  v170 = CFSTR("failed to validate newly created bag -- should never happen");
                  goto LABEL_80;
                }
                v161 = "KBSecureSaveObject";
                v162 = CFSTR("Can't create dict");
                goto LABEL_74;
              }
              sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Can't encrypt: %d"), v98, v99, v100, v101, v102, v103, v97);
            }
            v15 = 4294967289;
LABEL_58:
            CFRelease(v76);
            goto LABEL_59;
          }
          sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Can't create iv data"), v62, v63, v64, v65, v66, v67, v180);
          CFRelease(v60);
        }
        else
        {
          sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Can't create key data"), v54, v55, v56, v57, v58, v59, v180);
        }
        v15 = 4294967291;
        goto LABEL_61;
      }
      v179 = CFSTR("Can't create IV");
    }
    sub_10001595C("KBSecureSaveObjectWithCrypto", v179, v47, v48, v49, v50, v51, v52, v180);
    goto LABEL_85;
  }
  if (!sub_1000038E4(v10, v190, &v183))
    goto LABEL_28;
  sub_10001595C("KBSecureSaveObjectWithCrypto", CFSTR("Unable to load wipe info:%08x"), v34, v35, v36, v37, v38, v39, v10);
LABEL_85:
  v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  return v15;
}

uint64_t sub_100005504(uint64_t a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  CFDataRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFDataRef v25;
  CFDataRef v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  const void *Value;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  char v39;
  UInt8 bytes[4];
  UInt8 *v41[129];

  if (sub_100005754() && (_DWORD)a1)
    return 0;
  if ((_DWORD)a5)
    v16 = CFSTR("Saving SystemBag with NO EFFACEABLE ROLL");
  else
    v16 = CFSTR("Saving SystemBag with EFFACEABLE ROLL");
  sub_10001595C("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  v17 = sub_100005754();
  if ((_DWORD)a1 || !v17)
  {
    v41[0] = 0;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag(a1, v41, bytes))
    {
      v26 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v41[0], *(int *)bytes, kCFAllocatorDefault);
      if (v26)
      {
        v25 = v26;
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)bytes = 1752065072;
  LODWORD(v41[0]) = -1;
  if (aks_load_bag(bytes, 4, v41))
    return 0xFFFFFFFFLL;
  aks_unload_bag(LODWORD(v41[0]));
  v18 = CFDataCreate(kCFAllocatorDefault, bytes, 4);
  if (!v18)
    return 0xFFFFFFFFLL;
  v25 = v18;
  sub_10001595C("KBSaveSystemBagHandle", CFSTR("Saving handle 0 with the magic handle"), v19, v20, v21, v22, v23, v24, v39);
LABEL_14:
  v27 = sub_1000107D0();
  if (v27)
  {
    v28 = v27;
    CFDictionaryAddValue(v27, CFSTR("KeyBagKeys"), v25);
    if (a3)
      CFDictionaryAddValue(v28, CFSTR("OpaqueStuff"), a3);
    if (a4)
    {
      v29 = sub_100004810();
      if (v29)
      {
        v30 = v29;
        Value = CFDictionaryGetValue(v29, CFSTR("BackupKeyBagKeys"));
        if (Value)
        {
          v32 = Value;
          CFRetain(Value);
          CFRelease(v30);
          CFDictionarySetValue(v28, CFSTR("BackupKeyBagKeys"), v32);
          v30 = (const __CFDictionary *)v32;
        }
        CFRelease(v30);
      }
    }
    snprintf((char *)v41, 0x401uLL, "%s/%s", a2, "keybags");
    if (sub_100004CBC(v28, (const char *)v41, 1111574321, "systembag", a5, v33, v34, v35))
      v36 = 0xFFFFFFFFLL;
    else
      v36 = 0;
    CFRelease(v28);
  }
  else
  {
    v36 = 0xFFFFFFFFLL;
  }
  CFRelease(v25);
  return v36;
}

uint64_t sub_100005754()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  size_t __len;
  char __big[1024];

  if ((byte_1000358A9 & 1) == 0)
  {
    v0 = sub_10000827C(":/filesystems", CFSTR("e-apfs"));
    __len = 1023;
    bzero(__big, 0x400uLL);
    if ((byte_1000358AB & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
        byte_1000358AC = 1;
      byte_1000358AB = 1;
    }
    if (v0 == 1)
      v7 = 1;
    else
      v7 = byte_1000358AC;
    byte_1000358AA = v7;
    sub_10001595C("MKBDeviceSupportsEnhancedAPFS", CFSTR("dt = %d, bootarg = %d"), v1, v2, v3, v4, v5, v6, v0);
    byte_1000358A9 = 1;
  }
  return byte_1000358AA;
}

uint64_t sub_100005878(uint64_t a1, uint64_t a2, const void *a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  CFStringRef v16;
  CFDataRef v17;
  CFDataRef v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  const __CFDictionary *v21;
  CFAbsoluteTime Current;
  CFDateRef v23;
  const __CFDate *Value;
  CFAbsoluteTime AbsoluteTime;
  CFDateRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *v30;
  uint64_t v31;
  CFMutableDictionaryRef theDict;
  _DWORD length[4];
  char __str[1025];

  *(_QWORD *)&length[1] = 0;
  length[0] = 0;
  theDict = 0;
  if ((sub_100005754() & 1) != 0)
    return 0;
  if (a4)
    v14 = CFSTR("Saving UserBag for uid %d with NO EFFACEABLE ROLL");
  else
    v14 = CFSTR("Saving UserBag for uid %d with EFFACEABLE ROLL");
  sub_10001595C("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  v15 = sub_100004908(__str, "userbag", (CFPropertyListRef *)&theDict);
  if (!(_DWORD)v15
    || (theDict = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0)
  {
    v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a2);
    if (v16)
    {
      if ((_DWORD)a1 == -1)
      {
        v21 = theDict;
        CFDictionaryRemoveValue(theDict, v16);
        v18 = 0;
        v20 = 0;
        goto LABEL_16;
      }
      if (!aks_save_bag(a1, &length[1], length))
      {
        v17 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)&length[1], length[0], kCFAllocatorDefault);
        if (v17)
        {
          v18 = v17;
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!Mutable)
          {
            v23 = 0;
            v26 = 0;
LABEL_32:
            CFRelease(v18);
LABEL_33:
            if (theDict)
            {
              CFRelease(theDict);
              theDict = 0;
            }
            if (v16)
              CFRelease(v16);
            if (v23)
              CFRelease(v23);
            if (v26)
              CFRelease(v26);
            return v15;
          }
          v20 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("KeyBagKeys"), v18);
          if (a3)
            CFDictionarySetValue(v20, CFSTR("OpaqueStuff"), a3);
          v21 = theDict;
          CFDictionarySetValue(theDict, v16, v20);
LABEL_16:
          Current = CFAbsoluteTimeGetCurrent();
          v23 = CFDateCreate(kCFAllocatorDefault, Current);
          Value = (const __CFDate *)CFDictionaryGetValue(v21, CFSTR("LastWipeKeyUpdateTimeStamp"));
          if (Value)
          {
            AbsoluteTime = CFDateGetAbsoluteTime(Value);
            v26 = CFDateCreate(kCFAllocatorDefault, AbsoluteTime + 86400.0);
            if (CFDateCompare(v26, v23, 0) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0)
                CFDictionarySetValue(v21, CFSTR("WipeKeyUpdatePending"), kCFBooleanTrue);
              goto LABEL_23;
            }
            v30 = CFDictionaryGetValue(v21, CFSTR("WipeKeyUpdatePending"));
            if (!CFEqual(v30, kCFBooleanTrue) && (a4 & 1) != 0)
            {
LABEL_23:
              v31 = 1;
              goto LABEL_26;
            }
            CFDictionarySetValue(v21, CFSTR("LastWipeKeyUpdateTimeStamp"), v23);
            CFDictionarySetValue(v21, CFSTR("WipeKeyUpdatePending"), kCFBooleanFalse);
          }
          else
          {
            CFDictionarySetValue(v21, CFSTR("WipeKeyUpdatePending"), kCFBooleanFalse);
            CFDictionarySetValue(v21, CFSTR("LastWipeKeyUpdateTimeStamp"), v23);
            v26 = 0;
          }
          v31 = 0;
LABEL_26:
          if (sub_100004CBC(v21, __str, 1111574322, "userbag", v31, v27, v28, v29))
            v15 = v15;
          else
            v15 = 0;
          if (v20)
            CFRelease(v20);
          if (!v18)
            goto LABEL_33;
          goto LABEL_32;
        }
      }
    }
    v23 = 0;
    v26 = 0;
    goto LABEL_33;
  }
  return v15;
}

BOOL sub_100005C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
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
  _BOOL8 v22;
  char v24;
  char v25;
  CFDataRef theData;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;

  v30 = 0;
  v29[0] = 0;
  v29[1] = 0;
  theData = 0;
  v27 = 0;
  v25 = -1;
  v28 = sub_10001C52C(65000, &v30, (uint64_t)v29, a4, a5, a6, a7, a8);
  if (v28)
  {
    v8 = sub_10001D428((id *)&v28, (CFTypeRef *)&theData, (uint64_t)&v25, (uint64_t)&v27, (uint64_t)&v27 + 4);
    if (v8 == 0x900000000000)
    {
      v22 = CFDataGetLength(theData) > 10;
    }
    else
    {
      sub_10001595C("seshat_supports_upgraded_jcop_kud_policy", CFSTR("getData() -> 0x%x:0x%x"), v9, v10, v11, v12, v13, v14, v8);
      v22 = 0;
    }
    if (v28)
      sub_10001C8E4((id *)&v28, v15, v16, v17, v18, v19, v20, v21, v24);
  }
  else
  {
    v22 = 0;
  }
  if (theData)
    CFRelease(theData);
  return v22;
}

uint64_t sub_100005CF0(uint64_t a1, char a2, CFDataRef theData, id *a4, uint64_t a5, uint64_t a6, unint64_t *a7, uint64_t a8)
{
  int reset_pubkey;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex v22;
  CFMutableDataRef Mutable;
  __CFData *v24;
  const UInt8 *BytePtr;
  CFIndex v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  unint64_t v41;
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
  char *v53;
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
  CFIndex v65;
  const UInt8 *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int8 v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned __int8 v90;
  unint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char Length;
  unint64_t v102;
  uint64_t v103;
  char v104[8];
  char v105;
  unsigned int v106;
  char v107;
  CFDataRef v108;
  char v109;
  CFTypeRef v110;
  uint64_t v111;
  CFIndex v112;
  UInt8 *v113;
  _OWORD v114[2];

  v112 = 0;
  v113 = 0;
  v110 = 0;
  v111 = 0;
  v109 = -1;
  v108 = 0;
  if (!theData)
  {
    Length = -1;
LABEL_27:
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("Invalid args %ld"), (uint64_t)theData, (uint64_t)a4, a5, a6, (uint64_t)a7, a8, Length);
    v24 = 0;
    v102 = 28;
    goto LABEL_44;
  }
  if (CFDataGetLength(theData) != 16)
  {
    Length = CFDataGetLength(theData);
    goto LABEL_27;
  }
  reset_pubkey = aks_se_get_reset_pubkey(a1, &v113, &v112);
  if (reset_pubkey)
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("failed to fetch pubkey 0x%x"), v16, v17, v18, v19, v20, v21, reset_pubkey);
    v24 = 0;
    v102 = 21;
    goto LABEL_44;
  }
  if (v112 != 65)
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("invalid pubkey %zu"), v16, v17, v18, v19, v20, v21, v112);
    v24 = 0;
    v102 = 22;
    goto LABEL_44;
  }
  v22 = CFDataGetLength(theData);
  Mutable = CFDataCreateMutable(0, v22 + 65);
  if (!Mutable)
  {
    v99 = 0xFFFFFFFFLL;
    goto LABEL_20;
  }
  v24 = Mutable;
  BytePtr = CFDataGetBytePtr(theData);
  v26 = CFDataGetLength(theData);
  CFDataAppendBytes(v24, BytePtr, v26);
  CFDataAppendBytes(v24, v113, v112);
  if (CFDataGetLength(v24) != 81)
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("invalid upgrade data"), v27, v28, v29, v30, v31, v32, v104[0]);
    v99 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  v107 = 0;
  v33 = sub_10001D428(a4, &v110, (uint64_t)&v109, (uint64_t)&v111, (uint64_t)&v111 + 4);
  v40 = v33;
  v41 = HIDWORD(v33);
  if (v33 != 0x900000000000)
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("getData() -> 0x%x:0x%x"), v34, v35, v36, v37, v38, v39, v33);
    v49 = 3;
LABEL_35:
    v102 = ((_DWORD)v41 << 16) | ((unint64_t)v40 << 8) | v49;
    goto LABEL_44;
  }
  if (sub_100006238(a1, 2, HIDWORD(v111)))
  {
    v49 = 23;
    goto LABEL_35;
  }
  if (aks_verify_password(a1, a5, a6, 0, 0))
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("cant verify old passcode"), v42, v43, v44, v45, v46, v47, v104[0]);
    v49 = 27;
    goto LABEL_35;
  }
  v48 = sub_1000062B4(a1, &v108, 0);
  v49 = 24;
  if (v48 || !v108)
    goto LABEL_35;
  memset(v114, 0, sizeof(v114));
  v105 = 2;
  v50 = ccec_cp_256();
  v51 = __chkstk_darwin();
  v53 = &v104[-v52];
  v106 = bswap32(HIDWORD(v111));
  v57 = ccsha256_di(v51, v54, v55, v56);
  ccdigest(v57, 5, &v105, v114);
  v58 = ccec_x963_import_pub(v50, v112, v113, v53);
  if (v58)
  {
    sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("import failed %x"), v59, v60, v61, v62, v63, v64, v58);
    v103 = 26;
  }
  else
  {
    v65 = CFDataGetLength(v108);
    v66 = CFDataGetBytePtr(v108);
    v67 = ccec_verify(v53, 32, v114, v65, v66, &v107);
    if (v67)
    {
      sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("verify failed %x"), v68, v69, v70, v71, v72, v73, v67);
    }
    else
    {
      if (v107)
      {
        v74 = sub_10001D360(a4, a2, (uint64_t)v24, (uint64_t)&v111 + 4);
        v81 = v74;
        v82 = HIDWORD(v74);
        if (v74 == 0x900000000000)
        {
          v83 = sub_10001D084(a4, a2, (uint64_t)v108, (uint64_t)&v111 + 4, v77, v78, v79, v80);
          v90 = v83;
          v91 = HIDWORD(v83);
          if (v83 == 0x900000000000)
          {
            v92 = aks_se_delete_reset_token(a1);
            if (!v92)
            {
              sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("successfully migrated slot %d to v2"), v93, v94, v95, v96, v97, v98, a2);
              v99 = 0;
LABEL_19:
              CFRelease(v24);
              goto LABEL_20;
            }
            sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("deletion of rt failed 0x%x"), v93, v94, v95, v96, v97, v98, v92);
            v102 = ((unint64_t)v90 << 8) | 0x90000011;
          }
          else
          {
            sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("resetCounter() -> 0x%x:0x%x"), v84, v85, v86, v87, v88, v89, v83);
            v102 = ((_DWORD)v91 << 16) | ((unint64_t)v90 << 8) | 8;
          }
        }
        else
        {
          sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("failed to upgrade to v2 -> 0x%x:0x%x"), v75, v76, v77, v78, v79, v80, v74);
          v102 = ((_DWORD)v82 << 16) | ((unint64_t)v81 << 8) | 0xF;
        }
        goto LABEL_44;
      }
      sub_10001595C("seshat_migrate_slot_to_v2", CFSTR("singature invalid"), v68, v69, v70, v71, v72, v73, v104[0]);
    }
    v103 = 25;
  }
  v102 = ((unint64_t)v40 << 8) | 0x90000000 | v103;
LABEL_44:
  if (a7)
    *a7 = v102;
  v99 = 0xFFFFFFFFLL;
  if (v24)
    goto LABEL_19;
LABEL_20:
  if (v108)
  {
    CFRelease(v108);
    v108 = 0;
  }
  if (v110)
  {
    CFRelease(v110);
    v110 = 0;
  }
  free(v113);
  return v99;
}

uint64_t sub_100006238(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  char v14;

  v14 = 0;
  v13 = 0;
  sub_10001E28C(a2, a3, (uint64_t)&v13);
  v4 = aks_se_set_nonce(a1, &v13, 5);
  v11 = 0;
  if (v4)
  {
    sub_10001595C("seshat_arm_nonce", CFSTR("failed to set nonce 0x%x"), v5, v6, v7, v8, v9, v10, v4);
    return 0xFFFFFFFFLL;
  }
  return v11;
}

uint64_t sub_1000062B4(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  uint64_t reset_sig;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v12;
  CFDataRef v13;
  uint64_t v14;
  CFIndex v16;
  CFIndex length;
  UInt8 *v18;
  UInt8 *bytes;

  v18 = 0;
  bytes = 0;
  v16 = 0;
  length = 0;
  if (!a2)
  {
LABEL_12:
    v14 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  reset_sig = aks_se_get_reset_sig(a1, &bytes, &length, &v18, &v16);
  if (!(_DWORD)reset_sig)
  {
    v12 = CFDataCreate(0, bytes, length);
    *a2 = v12;
    if (v12)
    {
      if (!a3 || (v13 = CFDataCreate(0, v18, v16), (*a3 = v13) != 0))
      {
        v14 = 0;
        goto LABEL_7;
      }
    }
    goto LABEL_12;
  }
  v14 = reset_sig;
  sub_10001595C("seshat_get_reset_sig", CFSTR("failed to get sig %x"), v6, v7, v8, v9, v10, v11, reset_sig);
LABEL_7:
  if (bytes)
  {
    memset_s(bytes, length, 0, length);
    free(bytes);
  }
  if (v18)
  {
    memset_s(v18, v16, 0, v16);
    free(v18);
  }
  return v14;
}

uint64_t sub_1000063AC()
{
  const __CFBoolean *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFBoolean *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v18;
  char v19;

  v0 = (const __CFBoolean *)MGCopyAnswer(CFSTR("HasSEP"), 0);
  v1 = MGCopyAnswer(CFSTR("0dnM19zBqLw5ZPhIo4GEkg"), 0);
  v8 = (const __CFBoolean *)v1;
  if (v0)
    v9 = v1 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (CFBooleanGetValue(v0))
    {
      if (CFBooleanGetValue(v8))
      {
        v16 = sub_10001C310();
        goto LABEL_8;
      }
      v18 = CFSTR("seshat_support: cond 2 not satisfied");
    }
    else
    {
      v18 = CFSTR("seshat_support: cond 1 not satisfied");
    }
    sub_10001595C("seshat_is_supported", v18, v10, v11, v12, v13, v14, v15, v19);
  }
  v16 = 0;
LABEL_8:
  if ((byte_1000358A8 & 1) == 0)
  {
    sub_10001595C("seshat_is_supported", CFSTR("result: %d"), v2, v3, v4, v5, v6, v7, v16);
    byte_1000358A8 = 1;
  }
  if (v0)
    CFRelease(v0);
  if (v8)
    CFRelease(v8);
  return v16;
}

void sub_1000064A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;

  v31 = 0;
  if (aks_se_support_in_rm_is_set(&v31))
  {
    v6 = CFSTR("cant fetch state");
LABEL_3:
    sub_10001595C("seshat_sep_rm_init", v6, v0, v1, v2, v3, v4, v5, v30);
    return;
  }
  if (!v31)
  {
    v7 = sub_1000063AC();
    if ((_DWORD)v7)
    {
      v15 = sub_100005C24(v7, v8, v9, v10, v11, v12, v13, v14);
      v22 = v15;
      if (v15)
        aks_set_jcop_supports_updated_kud_policy();
      sub_10001595C("seshat_sep_rm_init", CFSTR("JCOP kud support: %d, %d"), v16, v17, v18, v19, v20, v21, v22);
      v23 = sub_10001DED0();
      sub_10001595C("seshat_sep_rm_init", CFSTR("SERM support: %d"), v24, v25, v26, v27, v28, v29, v23);
      if (aks_se_support_in_rm(v23))
      {
        v6 = CFSTR("failed to indicate se rm support (expected on devices where feature is disabled)");
        goto LABEL_3;
      }
    }
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_100006564(uint64_t a1, char a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFArray *v6;
  CFTypeID v7;
  unsigned int v8;
  unsigned __int8 v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;

  v12 = 0;
  sub_10001C940(&v13);
  BYTE6(v13) = ((v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFF9FFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 49)) >> 48;
  v3 = sub_100011568();
  if (v3)
  {
    v4 = v3;
    if (sub_1000110AC(v3))
      BYTE6(v13) = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32) | 0x1000000000000) >> 48;
    v5 = sub_100011440(v4);
    if (v5)
    {
      v6 = v5;
      v7 = CFGetTypeID(v5);
      if (v7 == CFArrayGetTypeID())
      {
        v8 = sub_1000066A8(v6, &v12);
        v9 = -1;
        if (v8 <= 0xFE)
          v9 = sub_1000066A8(v6, &v12);
        v10 = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFFF0000FFFFFFFFLL;
        if (v12 >= 0xFF)
          v11 = 255;
        else
          v11 = v12;
        WORD2(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 32;
        BYTE6(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 48;
      }
    }
    CFRelease(v4);
  }
}

uint64_t sub_1000066A8(CFArrayRef theArray, _DWORD *a2)
{
  int Count;
  CFIndex v5;
  uint64_t v6;
  const __CFNumber *ValueAtIndex;
  BOOL v8;
  uint64_t valuePtr;

  if (!theArray)
    return 0;
  if (a2)
  {
    if (CFArrayGetCount(theArray) < 0)
      Count = 0;
    else
      Count = CFArrayGetCount(theArray);
    *a2 = Count;
  }
  valuePtr = 0;
  if (CFArrayGetCount(theArray) < 1)
    return 0;
  v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v5);
    if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr))
      v8 = valuePtr == 0;
    else
      v8 = 1;
    if (v8)
      v6 = v6;
    else
      v6 = (v6 + 1);
    ++v5;
  }
  while (CFArrayGetCount(theArray) > v5);
  return v6;
}

void sub_100006764(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  CFDataRef theData;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;

  v21 = -18;
  v19 = 0;
  theData = 0;
  v18 = -1;
  v17 = 0;
  if ((sub_1000063AC() & 1) == 0)
  {
    v15 = CFSTR("unsupported");
    goto LABEL_25;
  }
  if (!a1)
  {
    v17 = sub_10001C8D8(65000, v4, v5, v6, v7, v8, v9, v10);
    if (!v17)
    {
      v15 = CFSTR("CreateSession() failed");
      goto LABEL_25;
    }
    a1 = (id *)&v17;
  }
  if (sub_1000069E4(a2, 0, 0, &v21, 0, 0))
    v11 = 238;
  else
    v11 = v21;
  v22 = 0;
  v23 = 0;
  if (aks_memento_get_state(a2, &v22) || (v23 & 0x400000000) == 0)
  {
    v12 = 238;
  }
  else
  {
    v12 = v22;
    v21 = v22;
  }
  if (sub_10001D428(a1, (CFTypeRef *)&theData, (uint64_t)&v18, (uint64_t)&v19, (uint64_t)&v19 + 4) != 0x900000000000)
  {
    v15 = CFSTR("SeshatGetData() failed");
    goto LABEL_25;
  }
  v13 = 0;
  while (1)
  {
    if (CFDataGetBytePtr(theData)[v13] != 238)
    {
      if (v11 == (_DWORD)v13 || v12 == (_DWORD)v13)
      {
        sub_10001595C("KBSeshatEffaceUnusedSlots", CFSTR("not effacing slot %d thats currently referenced by handle %d, (main:%d, memento:%d)"), v5, v6, v7, v8, v9, v10, v13);
        goto LABEL_19;
      }
      sub_10001595C("KBSeshatEffaceUnusedSlots", CFSTR("effacing se slot %d"), v5, v6, v7, v8, v9, v10, v13);
      if (sub_10001D29C(a1, v13, (uint64_t)&v19 + 4) != 0x900000000000)
        break;
    }
LABEL_19:
    if (++v13 == 10)
      goto LABEL_20;
  }
  v16 = v13;
  v15 = CFSTR("SeshatDeleteSlot() failed %d");
LABEL_25:
  sub_10001595C("KBSeshatEffaceUnusedSlots", v15, v5, v6, v7, v8, v9, v10, v16);
LABEL_20:
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (v17)
    sub_10001C8E4((id *)&v17, v14, v5, v6, v7, v8, v9, v10, v16);
}

uint64_t sub_100006968(uint64_t a1, _BYTE *a2, CFDataRef *a3, int *a4)
{
  return sub_1000069E4(a1, 0, 0, a2, a3, a4);
}

uint64_t sub_100006980(uint64_t a1, _BYTE *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  if (aks_memento_get_state(a1, &v6) || (v7 & 0x400000000) == 0)
    return 0xFFFFFFFFLL;
  if (a2)
    *a2 = v6;
  result = 0;
  if (a3)
    *a3 = 2;
  return result;
}

uint64_t sub_1000069E4(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, CFDataRef *a5, int *a6)
{
  uint64_t reset_token_for_memento_secret;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  char v20;
  unsigned __int8 v21;
  UInt8 *bytes;

  bytes = 0;
  v21 = 0;
  if (a3)
    reset_token_for_memento_secret = aks_se_get_reset_token_for_memento_secret(a1, a2, a3, &bytes, &v21);
  else
    reset_token_for_memento_secret = aks_se_get_reset_token(a1, &bytes, &v21);
  v17 = reset_token_for_memento_secret;
  if ((_DWORD)reset_token_for_memento_secret)
  {
    sub_10001595C("KBGetSEStuffForMementoPasscode", CFSTR("aks_se_get_reset_token(memento:%d) -> 0x%x"), v11, v12, v13, v14, v15, v16, a3 != 0);
  }
  else
  {
    if (a4)
      *a4 = v21 & 0x1F;
    if (a6)
    {
      if (v21 < 0x20u)
        v18 = 1;
      else
        v18 = v21 >> 5;
      *a6 = v18;
    }
    if (a5)
    {
      if (bytes)
      {
        v17 = 0;
        *a5 = CFDataCreate(0, bytes, 16);
      }
      else
      {
        sub_10001595C("KBGetSEStuffForMementoPasscode", CFSTR("no resetToken avaialble"), v11, v12, v13, v14, v15, v16, v20);
        v17 = 4294967283;
      }
    }
    else
    {
      v17 = 0;
    }
  }
  if (bytes)
    free(bytes);
  return v17;
}

uint64_t sub_100006AF8(char *cStr, _DWORD *a2, char **a3)
{
  const __CFString *v5;
  io_registry_entry_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
  const __CFString *CFProperty;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  CFTypeID v22;
  uint64_t v23;
  CFTypeID v24;
  size_t Length;
  char *v26;
  char *v27;
  const UInt8 *BytePtr;
  char v30;
  char buffer[1024];

  v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v6 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v6)
  {
    v13 = v6;
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
    if (CFProperty)
    {
      v21 = CFProperty;
      if (a2)
        *a2 = 1;
      if (a3)
      {
        v22 = CFGetTypeID(CFProperty);
        if (v22 == CFStringGetTypeID())
        {
          if (CFStringGetCString(v21, buffer, 1024, 0x8000100u))
            *a3 = strdup(buffer);
        }
        else
        {
          v24 = CFGetTypeID(v21);
          if (v24 == CFDataGetTypeID())
          {
            Length = CFDataGetLength((CFDataRef)v21);
            v26 = (char *)malloc_type_calloc(1uLL, Length + 1, 0xEFD9411AuLL);
            *a3 = v26;
            if (v26)
            {
              v27 = v26;
              BytePtr = CFDataGetBytePtr((CFDataRef)v21);
              memcpy(v27, BytePtr, Length);
            }
          }
          else
          {
            *a3 = 0;
          }
        }
      }
      CFRelease(v21);
    }
    else
    {
      sub_10001595C("getNVRam", CFSTR("Could not create string for value"), v15, v16, v17, v18, v19, v20, v30);
      if (a2)
        *a2 = 0;
    }
    IOObjectRelease(v13);
    v23 = 0;
  }
  else
  {
    sub_10001595C("getNVRam", CFSTR("Could not get options entry from the device tree"), v7, v8, v9, v10, v11, v12, v30);
    v23 = 0xFFFFFFFFLL;
  }
  CFRelease(v5);
  return v23;
}

uint64_t sub_100006CC8(char *cStr, const char *a2)
{
  const __CFString *v3;
  io_registry_entry_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_registry_entry_t v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFStringRef v19;
  kern_return_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v4 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (v4)
  {
    v11 = v4;
    v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
    if (v12)
    {
      v19 = v12;
      v20 = IORegistryEntrySetCFProperty(v11, v3, v12);
      if (v20)
      {
        sub_10001595C("setNVRam", CFSTR("Could not save value:%08x"), v21, v22, v23, v24, v25, v26, v20);
        v27 = 0xFFFFFFFFLL;
      }
      else
      {
        v27 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      sub_10001595C("setNVRam", CFSTR("Could not create string for value"), v13, v14, v15, v16, v17, v18, v29);
      v27 = 0xFFFFFFFFLL;
    }
    IOObjectRelease(v11);
  }
  else
  {
    sub_10001595C("setNVRam", CFSTR("Could not get options entry from the device tree"), v5, v6, v7, v8, v9, v10, v29);
    v27 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v27;
}

uint64_t sub_100006DD4(uint64_t a1, BOOL *a2)
{
  const __CFData *Value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFData *v11;
  CFTypeID v12;
  CFUUIDRef v13;
  const __CFData *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFData *v21;
  CFTypeID v22;
  CFUUIDRef v23;
  BOOL v24;
  uint64_t v25;
  CFDictionaryRef theDict;
  CFTypeRef v28;
  CFTypeRef cf2;
  CFTypeRef cf;
  CFUUIDBytes v31;
  CFUUIDBytes v32;

  cf2 = 0;
  cf = 0;
  theDict = 0;
  v28 = 0;
  if (!sub_100005754())
  {
    v13 = 0;
    v23 = 0;
    v24 = (_DWORD)a1 == 0;
LABEL_14:
    v25 = 0;
    *a2 = v24;
    goto LABEL_15;
  }
  if (!AKSIdentityGetPrimary(&cf, &cf2, &v28) || aks_get_configuration(a1, &theDict))
    goto LABEL_29;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, kAKSConfigUserUUID);
  if (!Value || (v11 = Value, v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()) || CFDataGetLength(v11) != 16)
  {
    sub_10001595C("is_user_primary", CFSTR("no user uuid in the bag %d"), v5, v6, v7, v8, v9, v10, a1);
LABEL_29:
    v13 = 0;
    goto LABEL_31;
  }
  v31 = *(CFUUIDBytes *)CFDataGetBytePtr(v11);
  v13 = CFUUIDCreateFromUUIDBytes(0, v31);
  v14 = (const __CFData *)CFDictionaryGetValue(theDict, kAKSConfigGroupUUID);
  if (v14)
  {
    v21 = v14;
    v22 = CFGetTypeID(v14);
    if (v22 == CFDataGetTypeID() && CFDataGetLength(v21) == 16)
    {
      v32 = *(CFUUIDBytes *)CFDataGetBytePtr(v21);
      v23 = CFUUIDCreateFromUUIDBytes(0, v32);
      if (CFEqual(v23, cf2))
        v24 = CFEqual(v13, cf) != 0;
      else
        v24 = 0;
      goto LABEL_14;
    }
  }
  sub_10001595C("is_user_primary", CFSTR("no group uuid in the bag %d"), v15, v16, v17, v18, v19, v20, a1);
LABEL_31:
  v23 = 0;
  v25 = 0xFFFFFFFFLL;
LABEL_15:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (cf2)
  {
    CFRelease(cf2);
    cf2 = 0;
  }
  if (v28)
  {
    CFRelease(v28);
    v28 = 0;
  }
  if (theDict)
  {
    CFRelease(theDict);
    theDict = 0;
  }
  if (v13)
    CFRelease(v13);
  if (v23)
    CFRelease(v23);
  return v25;
}

uint64_t sub_100006FD4()
{
  int v0;
  char *v1;
  BOOL v2;
  uint64_t v3;
  char *__endptr;
  char *__str;
  int v7;

  v7 = 0;
  __str = 0;
  v0 = sub_100006AF8("seshat-count", &v7, &__str);
  v1 = __str;
  if (v0)
    v2 = 1;
  else
    v2 = __str == 0;
  if (v2
    || (__endptr = 0, *__error() = 0, LODWORD(v3) = strtol(__str, &__endptr, 10), v1 = __str, !*__str)
    || *__endptr)
  {
    v3 = 0;
    if (v1)
LABEL_8:
      free(v1);
  }
  else
  {
    if (*__error() == 34)
      v3 = 0;
    else
      v3 = v3;
    v1 = __str;
    if (__str)
      goto LABEL_8;
  }
  return v3;
}

BOOL sub_100007088(uint64_t a1, char a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  v4 = 0;
  return (a2 & 1) != 0
      && !aks_memento_get_state(a1, &v5)
      && !aks_get_lock_state(a1, &v4)
      && (v4 & 0x2000) != 0
      && (v6 & 0x400000000) == 0;
}

uint64_t sub_1000070F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, const void *a7, unsigned int a8)
{
  uint64_t v15;
  uint64_t system;
  int v17;
  _BOOL4 v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  const __CFDictionary *v27;
  const __CFDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
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
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL4 v73;
  BOOL v74;
  BOOL v75;
  _BOOL4 v76;
  uint64_t v77;
  int lock_state;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BOOL4 v86;
  const char *v87;
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
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CFDataRef v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  _BOOL4 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const UInt8 *BytePtr;
  const UInt8 *v144;
  unsigned int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  int v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const __CFString *v162;
  int v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int v170;
  int v171;
  char v172;
  CFDataRef v173;
  unint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const void *v181;
  unint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  unint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  unint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const UInt8 *v209;
  CFIndex Length;
  char v211;
  const UInt8 *v212;
  char v213;
  int v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  int v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  unint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  int v256;
  char v257;
  int v258;
  uint64_t v259;
  int v260;
  uint64_t v261;
  char v262;
  char v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  int v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const __CFString *v284;
  const __CFString *v286;
  char v287;
  char v288;
  char v289;
  CFTypeRef cf;
  uint64_t v291;
  unsigned int v292;
  unsigned int v293;
  const void *v294;
  uint64_t v295;
  unsigned int v296;
  const __CFData *v298;
  BOOL v299;
  unsigned int v300;
  unsigned int v301;
  unint64_t v302;
  int v303;
  _QWORD v304[2];
  unsigned __int8 v305;
  unsigned int v306;
  unsigned __int8 v307;
  unsigned __int8 v308;
  uint64_t v309;
  const __CFData *v310;
  const __CFData *v311;
  CFDataRef v312;
  CFTypeRef v313;
  const __CFData *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;

  v15 = 0xFFFFFFFFLL;
  v301 = -1;
  system = aks_get_system(a1, &v301);
  if (!(_DWORD)system)
  {
    v294 = a7;
    v295 = a3;
    v298 = a5;
    v300 = 0;
    if (aks_get_lock_state(system, &v300))
      LOBYTE(v17) = 0;
    else
      v17 = (v300 >> 13) & 1;
    v296 = a8;
    v18 = sub_100007088(v301, a8);
    v19 = 0;
    if (sub_1000063AC())
    {
      if (sub_10001E250())
        v19 = !sub_1000108A4();
      else
        v19 = 0;
    }
    v299 = 0;
    v26 = sub_10001D6A8();
    if ((v26 & 0x20000) != 0)
      sub_10001595C("KBChangeSystemSecret", CFSTR("disabled immediate enrollment"), v20, v21, v22, v23, v24, v25, v287);
    if (!v19)
    {
      v42 = 0;
      goto LABEL_29;
    }
    LODWORD(v304[0]) = 0;
    v27 = sub_100011568();
    v28 = v27;
    if (v27 && sub_100011440(v27) && sub_1000110AC(v28))
    {
      sub_10001595C("seshat_preflight_for_passcode_change", CFSTR("health data contains failures"), v29, v30, v31, v32, v33, v34, v287);
      v66 = -1;
    }
    else
    {
      if (!MGGetBoolAnswer(CFSTR("InternalBuild")) || (sub_10001D6A8() & 0x800) != 0)
      {
        v43 = sub_100006FD4();
        if (v43 >= 2)
        {
          sub_10001595C("seshat_preflight_for_passcode_change", CFSTR("bad user experience = %u"), v44, v45, v46, v47, v48, v49, v43);
          v66 = -1;
          if (!v28)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
      else
      {
        v35 = sub_100006FD4();
        sub_10001595C("seshat_preflight_for_passcode_change", CFSTR("ignoring recovery count (%d)"), v36, v37, v38, v39, v40, v41, v35);
      }
      v50 = sub_10001D740(1, (uint64_t)&stru_10002CC40, v304);
      sub_100006564(v50, 2);
      sub_10001595C("seshat_preflight_for_passcode_change", CFSTR("Seshat preflight = %llx (%llx)"), v51, v52, v53, v54, v55, v56, v50);
      v316 = v50;
      sub_100012D40((unsigned int *)&v316, v57, v58, v59, v60, v61, v62, v63, v288);
      v65 = v50 != 14 && v50 != 0;
      v66 = v65 << 31 >> 31;
      if (!v28)
        goto LABEL_28;
    }
LABEL_27:
    CFRelease(v28);
LABEL_28:
    v42 = v66 == 0;
LABEL_29:
    if (sub_100006DD4(a1, &v299))
    {
      sub_10001595C("KBChangeSystemSecret", CFSTR("unable to determine if handle:%d is pirmary"), v67, v68, v69, v70, v71, v72, a1);
      return 0xFFFFFFFFLL;
    }
    v73 = v299;
    sub_10001595C("KBChangeSystemSecret", CFSTR("handle: %d, se-support: %d, primary-user: %d, no-passcode: %d, preflight: %d, se_bound: %d, se_unenroll:%d, dis-imm-enr: %d"), v67, v68, v69, v70, v71, v72, a1);
    if (!v19
      || (v298 ? (v74 = !v73) : (v74 = 1),
          !v74 ? (v75 = a6 == 0) : (v75 = 1),
          !v75 ? (v76 = v42) : (v76 = 0),
          (*(_QWORD *)&v26 & 0x20000) != 0 || !v76 || v18))
    {
      if (sub_100007F10(a1, a2, v295, a4, (uint64_t)v298, a6, v294, v296))
      {
        v284 = CFSTR("Failed to change non-se pw");
        goto LABEL_159;
      }
      v129 = v17 ^ 1;
      if (a6)
        v129 = 1;
      if ((v129 & 1) == 0)
      {
        sub_100006764(0, v301);
        return 0;
      }
      if (!a6)
        return 0;
      goto LABEL_153;
    }
    v77 = v301;
    v313 = 0;
    v314 = 0;
    v311 = 0;
    v312 = 0;
    v309 = 0;
    v310 = 0;
    v308 = -1;
    v307 = 0;
    v306 = -1;
    v305 = 0;
    v304[0] = 0;
    v304[1] = 0;
    v303 = 0;
    lock_state = aks_get_lock_state(v301, &v303);
    v86 = (v303 & 0x2000) == 0 || lock_state != 0;
    v292 = sub_100009158(v77, 0, v79, v80, v81, v82, v83, v84);
    if (v292)
      v87 = "single";
    else
      v87 = "two";
    sub_1000064A4();
    sub_10001595C("KBChangeSystemSeSecret", CFSTR("changing SE bound passcode %s phase, memento_recovery: %s"), v88, v89, v90, v91, v92, v93, (char)v87);
    v315 = sub_10001C52C(65000, &v305, (uint64_t)v304, v94, v95, v96, v97, v98);
    v291 = (int)a6;
    if (v315)
    {
      v105 = sub_10001D610(v298, (int)a6, v99, v100);
      if (!v105)
      {
        sub_10001595C("KBChangeSystemSeSecret", CFSTR("failed to derive SE passcode"), v106, v107, v108, v109, v110, v111, v289);
        LODWORD(v120) = 0;
        v256 = 0;
        v259 = 0;
        cf = 0;
        v170 = -1;
        v257 = 1;
        v258 = 1;
        v260 = 1;
LABEL_167:
        v181 = v294;
LABEL_191:
        v213 = v292;
        goto LABEL_118;
      }
      v112 = (uint64_t)v105;
      v113 = sub_10001D428((id *)&v315, (CFTypeRef *)&v310, (uint64_t)&v308, (uint64_t)&v309, (uint64_t)&v309 + 4);
      v120 = HIDWORD(v113);
      cf = (CFTypeRef)v112;
      if (v113 == 0x900000000000)
      {
        v293 = v77;
        if (v86)
        {
          v121 = 0;
          v122 = v295;
        }
        else
        {
          v122 = v295;
          if ((v296 & 1) != 0)
          {
            v316 = 0;
            v317 = 0;
            if (aks_memento_get_state(v293, &v316) || (v317 & 0x400000000) == 0)
            {
              v162 = CFSTR("KBGetMementoSESlot() failed");
              goto LABEL_185;
            }
            v307 = v316;
          }
          else
          {
            v136 = sub_1000069E4(v293, 0, 0, &v307, 0, 0);
            if (v136)
            {
              v170 = v136;
              v286 = CFSTR("KBGetSEStuff() failed");
              goto LABEL_195;
            }
          }
          BytePtr = CFDataGetBytePtr(v310);
          if (BytePtr[v307] == 238)
          {
            v121 = 0;
          }
          else
          {
            v144 = CFDataGetBytePtr(v310);
            v121 = (v144[v307] & 0x80u) != 0;
          }
        }
        v145 = sub_10001D6F4(v310);
        v152 = v145;
        if (v145 >= 0xA)
        {
          sub_10001595C("KBChangeSystemSeSecret", CFSTR("unexpected slot %d"), v146, v147, v148, v149, v150, v151, v145);
          v256 = 0;
          v260 = 0;
          v170 = -1;
          v259 = 0x400000000000000;
          v257 = 1;
          LODWORD(v120) = 36864;
          goto LABEL_170;
        }
        if (!v86 && v121 && sub_100006238(v293, 0, HIDWORD(v309)))
        {
          v256 = 0;
          v259 = 0;
          v170 = -1000;
LABEL_197:
          v257 = 1;
          LODWORD(v120) = 36864;
          v258 = 1;
          v260 = 1;
          goto LABEL_198;
        }
        if ((v296 & 1) != 0)
        {
          v154 = aks_verify_password_memento(v293, v122, a4, 0, 0);
          if (v154)
          {
            sub_10001595C("KBChangeSystemSeSecret", CFSTR("cant verify old memento passcode 0x%x"), v155, v156, v157, v158, v159, v160, v154);
LABEL_186:
            v256 = 0;
            v259 = 0;
            v170 = -1;
            goto LABEL_197;
          }
        }
        else
        {
          v161 = aks_verify_password(v293, v122, a4, 0, 0);
          if (v161)
          {
            v289 = v161;
            v162 = CFSTR("cant verify old passcode 0x%x");
            goto LABEL_185;
          }
        }
        if (v86)
          goto LABEL_86;
        if (v121)
        {
          if (sub_1000062B4(v293, &v312, 0))
          {
            v162 = CFSTR("cant fetch sig");
LABEL_185:
            sub_10001595C("KBChangeSystemSeSecret", v162, v130, v131, v132, v133, v134, v135, v289);
            goto LABEL_186;
          }
          goto LABEL_86;
        }
        if ((v296 & 1) != 0)
        {
          v163 = sub_1000069E4(v293, v122, (int)a4, 0, &v312, 0);
          if (v163)
          {
            v170 = v163;
            sub_10001595C("KBChangeSystemSeSecret", CFSTR("KBGetSEStuffForMementoPasscode() -> 0x%x"), v164, v165, v166, v167, v168, v169, v163);
LABEL_196:
            v256 = 0;
            v259 = 0;
            goto LABEL_197;
          }
LABEL_86:
          v172 = v307;
          if (v86)
          {
            v172 = -18;
            v173 = 0;
          }
          else
          {
            v173 = v312;
          }
          v174 = sub_10001CC8C((id *)&v315, v152, v172, (uint64_t)v173, (CFTypeRef *)&v311, (uint64_t)&v309 + 4);
          v120 = HIDWORD(v174);
          if (v174 == 0x900000000000)
          {
            v181 = v294;
            if (v311)
            {
              v182 = sub_10001CE00((id *)&v315, v152, v112, (CFTypeRef *)&v314, (uint64_t)&v309 + 4, (uint64_t)v304);
              v120 = HIDWORD(v182);
              if (v182 == 0x900000000000)
              {
                v189 = sub_10001CE00((id *)&v315, v152, v112, &v313, (uint64_t)&v309 + 4, (uint64_t)v304);
                v120 = HIDWORD(v189);
                if (v189 == 0x900000000000)
                {
                  if (CFEqual(v314, v313))
                  {
                    v202 = sub_10001D084((id *)&v315, v152, (uint64_t)v311, (uint64_t)&v309 + 4, v198, v199, v200, v201);
                    v120 = HIDWORD(v202);
                    if (v202 == 0x900000000000)
                    {
                      if (v314)
                      {
                        v209 = CFDataGetBytePtr(v314);
                        if (v314)
                        {
                          Length = CFDataGetLength(v314);
                          goto LABEL_100;
                        }
                      }
                      else
                      {
                        v209 = 0;
                      }
                      Length = 0;
LABEL_100:
                      v211 = (char)v311;
                      if (v311)
                      {
                        v212 = CFDataGetBytePtr(v311);
                        v211 = (char)v311;
                        if (v311)
                          v211 = CFDataGetLength(v311);
                      }
                      else
                      {
                        v212 = 0;
                      }
                      v213 = v292;
                      v289 = v211;
                      v214 = aks_change_secret_opts(v293, v122, a4, v298, a6, v209, Length, v212);
                      if (v214)
                      {
                        sub_10001595C("KBChangeSystemSeSecret", CFSTR("change passcode: %x"), v215, v216, v217, v218, v219, v220, v214);
                        v256 = 0;
                        v257 = 0;
                        v259 = 0;
                        v170 = -1;
                        v258 = 1;
                        LODWORD(v120) = 36864;
                        v260 = 1;
                        v77 = v293;
LABEL_118:
                        if (v310)
                          CFRelease(v310);
                        v261 = v315;
                        if (v315)
                          v262 = v257;
                        else
                          v262 = 1;
                        if ((v262 & 1) == 0)
                        {
                          sub_100006764((id *)&v315, v77);
                          v261 = v315;
                        }
                        if (v261)
                          sub_10001C8E4((id *)&v315, v153, v123, v124, v125, v126, v127, v128, v289);
                        if (v314)
                          CFRelease(v314);
                        if (v313)
                          CFRelease(v313);
                        if (cf)
                          CFRelease(cf);
                        if (v312)
                          CFRelease(v312);
                        if (v311)
                          CFRelease(v311);
                        if (v306 == -1)
                          v263 = 1;
                        else
                          v263 = v213;
                        if ((v263 & 1) == 0)
                          aks_unload_bag(v306);
                        if (v256 && sub_100005504(v77, "/private/var/", v181, 1, 1))
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("welp, unable to persist old bag"), v123, v124, v125, v126, v127, v128, v289);
                        if (((v296 | v260) & 1) != 0)
                        {
LABEL_152:
                          if (v170)
                            goto LABEL_149;
                          goto LABEL_153;
                        }
                        sub_10001E21C(v120, v153, v123, v124, v125, v126, v127, v128);
                        v302 = ((unint64_t)(unsigned __int16)v120 << 40) | ((unint64_t)v305 << 6) | v259 | 8;
                        sub_100012FAC(&v302, v264, v265, v266, v267, v268, v269, v270, v289);
                        sub_10001595C("KBChangeSystemSeSecret", CFSTR("SE failed, trying soft recovery (%d)"), v271, v272, v273, v274, v275, v276, v258);
                        if (v258)
                        {
                          v277 = aks_se_recover(v77, v295, (int)a4);
                          if (!v277)
                          {
                            sub_100006764(0, v77);
                            if (sub_100007F10(v77, 0, v295, (int)a4, (uint64_t)v298, v291, v181, v296))
                            {
LABEL_149:
                              v284 = CFSTR("Failed to change pw");
LABEL_159:
                              sub_10001595C("KBChangeSystemSecret", v284, v123, v124, v125, v126, v127, v128, v289);
                              return 0xFFFFFFFFLL;
                            }
                            goto LABEL_153;
                          }
                          goto LABEL_151;
                        }
                        v277 = aks_se_recover(v77, v298, v291);
                        if (v277)
                        {
LABEL_151:
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("soft recovery failed 0x%x"), v278, v279, v280, v281, v282, v283, v277);
                          v170 = -1;
                          goto LABEL_152;
                        }
                        sub_100006764(0, v77);
LABEL_153:
                        sub_100004630();
                        return 0;
                      }
                      if ((v292 & 1) != 0)
                      {
                        v77 = v293;
                        v306 = v293;
                        v227 = (int)a6;
                        if (sub_100005504(v293, "/private/var/", v294, 1, 0))
                          goto LABEL_179;
                      }
                      else
                      {
                        v227 = (int)a6;
                        v77 = v293;
                        if (v306 == -1 || v306 == v293)
                        {
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("temp handle is invalid: %d"), v215, v216, v217, v218, v219, v220, v306);
                          goto LABEL_188;
                        }
                        if (sub_100005504(v306, "/private/var/", v294, 1, 0))
                        {
LABEL_179:
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("unable to save bag %d"), v221, v222, v223, v224, v225, v226, v306);
LABEL_188:
                          v256 = 0;
                          v257 = 0;
                          v259 = 0;
                          v170 = -1;
                          v258 = 1;
                          LODWORD(v120) = 36864;
LABEL_190:
                          v260 = 1;
                          goto LABEL_191;
                        }
                        v228 = aks_set_system_with_passcode(v306, v293, v298, a6);
                        if (v228)
                        {
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("set-system failed %d"), v229, v230, v231, v232, v233, v234, v228);
                          v257 = 0;
                          v259 = 0;
                          v170 = -1;
                          v256 = 1;
                          LODWORD(v120) = 36864;
                          v258 = 1;
                          goto LABEL_190;
                        }
                      }
                      v235 = aks_change_secret_epilogue(v77, v298, v227);
                      if (!v235)
                      {
                        v213 = v292;
                        if (v308 == 238
                          || (v242 = sub_10001D1B8((id *)&v315, 1, v152, (uint64_t)v311, (uint64_t)&v309 + 4),
                              v120 = HIDWORD(v242),
                              v242 == 0x900000000000))
                        {
                          v316 = 0;
                          if (sub_100005CF0(v77, v152, v311, (id *)&v315, (uint64_t)v298, v227, (unint64_t *)&v316, v241))
                          {
                            v248 = v316;
                            sub_100006564(v316, 2);
                            v302 = v248;
                            sub_100012D40((unsigned int *)&v302, v249, v250, v251, v252, v253, v254, v255, v289);
                          }
                          v256 = 0;
                          v257 = 0;
                          v258 = 0;
                          v259 = 0;
                          v170 = 0;
                          v260 = 1;
                          LODWORD(v120) = 36864;
                        }
                        else
                        {
                          sub_10001595C("KBChangeSystemSeSecret", CFSTR("AuthorizeUpdate() -> 0x%x:0x%x"), v243, v244, v245, v246, v247, v241, v242);
                          v256 = 0;
                          v257 = 0;
                          v258 = 0;
                          v260 = 0;
                          v170 = 0;
                          v259 = 0xA00000000000000;
                        }
                        goto LABEL_118;
                      }
                      v170 = v235;
                      sub_10001595C("KBChangeSystemSeSecret", CFSTR("aks_change_secret_epilogue() failed %x"), v236, v237, v238, v239, v240, v241, v235);
                      v256 = 0;
                      v257 = 0;
                      v259 = 0;
                      v258 = 1;
                      LODWORD(v120) = 36864;
                      v260 = 1;
                      goto LABEL_191;
                    }
                    sub_10001595C("KBChangeSystemSeSecret", CFSTR("resetCounter() -> 0x%x:0x%x"), v203, v204, v205, v206, v207, v208, v202);
                    v256 = 0;
                    v257 = 0;
                    v260 = 0;
                    v170 = -1;
                    v259 = 0x800000000000000;
                    goto LABEL_177;
                  }
                  sub_10001595C("KBChangeSystemSeSecret", CFSTR("se-sec comparisson failed"), v196, v197, v198, v199, v200, v201, v289);
                  v256 = 0;
                  v257 = 0;
                  v260 = 0;
                  v170 = -1;
                  v259 = 0x900000000000000;
                  v258 = 1;
                  LODWORD(v120) = 36864;
LABEL_199:
                  v213 = v292;
                  v77 = v293;
                  goto LABEL_118;
                }
                sub_10001595C("KBChangeSystemSeSecret", CFSTR("derive2() -> 0x%x:0x%x"), v190, v191, v192, v193, v194, v195, v189);
              }
              else
              {
                sub_10001595C("KBChangeSystemSeSecret", CFSTR("derive() -> 0x%x:0x%x"), v183, v184, v185, v186, v187, v188, v182);
              }
              v256 = 0;
              v257 = 0;
              v260 = 0;
              v170 = -1;
              v259 = 0x700000000000000;
LABEL_177:
              v258 = 1;
              goto LABEL_199;
            }
            sub_10001595C("KBChangeSystemSeSecret", CFSTR("no reset token returned"), v175, v176, v177, v178, v179, v180, v289);
            v256 = 0;
            v257 = 0;
            v259 = 0;
            v170 = -1;
            v258 = 1;
            LODWORD(v120) = 36864;
            v260 = 1;
            goto LABEL_199;
          }
          sub_10001595C("KBChangeSystemSeSecret", CFSTR("allocateSlot() -> 0x%x:0x%x"), v175, v176, v177, v178, v179, v180, v174);
          v256 = 0;
          v260 = 0;
          v170 = -1;
          v259 = 0x600000000000000;
          v257 = 1;
LABEL_170:
          v258 = 1;
LABEL_198:
          v181 = v294;
          goto LABEL_199;
        }
        v171 = sub_1000069E4(v293, 0, 0, 0, &v312, 0);
        if (!v171)
          goto LABEL_86;
        v170 = v171;
        v286 = CFSTR("KBGetSEStuff() failed -- unlock required to change passcode");
LABEL_195:
        sub_10001595C("KBChangeSystemSeSecret", v286, v137, v138, v139, v140, v141, v142, v289);
        goto LABEL_196;
      }
      sub_10001595C("KBChangeSystemSeSecret", CFSTR("SeshatGetData() failed"), v114, v115, v116, v117, v118, v119, v289);
      v256 = 0;
      v260 = 0;
      v170 = -1;
      v259 = 0x300000000000000;
    }
    else
    {
      sub_10001595C("KBChangeSystemSeSecret", CFSTR("CreateSession() failed"), v99, v100, v101, v102, v103, v104, v289);
      LODWORD(v120) = 0;
      v256 = 0;
      v260 = 0;
      cf = 0;
      v170 = -1;
      v259 = 0x200000000000000;
    }
    v257 = 1;
    v258 = 1;
    goto LABEL_167;
  }
  return v15;
}

uint64_t sub_100007F10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8)
{
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  const char *v23;
  int v24;
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
  int v45;
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
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v68;
  unsigned int v69;

  v69 = -1;
  v15 = sub_100009158(a1, 0, a3, a4, a5, a6, (uint64_t)a7, a8);
  v22 = v15;
  v23 = "two";
  if (v15)
    v23 = "single";
  sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("changing non-SE passcode %s phase, (params:%d)"), v16, v17, v18, v19, v20, v21, (char)v23);
  v68 = 0;
  v24 = aks_change_secret_opts(a1, a3, a4, a5, a6, 0, 0, 0);
  if (v24)
  {
    sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("change-secret failed %x"), v25, v26, v27, v28, v29, v30, v24);
    goto LABEL_31;
  }
  if ((v22 & 1) == 0)
  {
    sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("temp handle is invalid: %d"), v25, v26, v27, v28, v29, v30, -1);
LABEL_31:
    v59 = 0;
    goto LABEL_32;
  }
  v69 = a1;
  if ((_DWORD)a1)
  {
    v31 = sub_100005878(a1, a2, a7, 0);
    if ((_DWORD)v31)
    {
      v38 = v31;
      sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("unable to save bag %d"), v32, v33, v34, v35, v36, v37, a1);
LABEL_15:
      v59 = 0;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (sub_100005504(a1, "/private/var/", a7, 1, 0))
  {
    sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("unable to save bag %d"), v39, v40, v41, v42, v43, v44, a1);
    goto LABEL_31;
  }
LABEL_11:
  if ((v22 & 1) != 0 || (v45 = aks_set_system_with_passcode(a1, a1, a5, a6)) == 0)
  {
    v52 = aks_change_secret_epilogue(a1, a5, (int)a6);
    v38 = v52;
    if ((_DWORD)v52)
      sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("aks_change_secret_epilogue() failed %x"), v53, v54, v55, v56, v57, v58, v52);
    goto LABEL_15;
  }
  sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("set-system failed %d"), v46, v47, v48, v49, v50, v51, v45);
  v59 = 1;
LABEL_32:
  v38 = 0xFFFFFFFFLL;
LABEL_16:
  if (v69 == -1)
    v60 = 1;
  else
    v60 = v22;
  if ((v60 & 1) == 0)
    aks_unload_bag(v69);
  if (v59)
  {
    if (!(_DWORD)a1)
    {
      if (!sub_100005504(0, "/private/var/", a7, 1, 1))
        return v38;
      goto LABEL_24;
    }
    if (sub_100005878(a1, a2, a7, 1))
LABEL_24:
      sub_10001595C("KBChangeSystemNonSeSecret", CFSTR("welp, unable to persist old bag"), v61, v62, v63, v64, v65, v66, v68);
  }
  return v38;
}

uint64_t sub_1000081AC(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  const UInt8 *BytePtr;
  CFIndex Length;

  if (a1)
  {
    BytePtr = CFDataGetBytePtr(a1);
    Length = CFDataGetLength(a1);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  if (aks_recover_with_escrow_bag(0, BytePtr, Length, a2, a3, a4, a5))
    return 0xFFFFFFFFLL;
  if ((sub_100005754() & 1) != 0)
    return 0;
  return sub_100005504(0, "/private/var/", a7, 1, 0);
}

uint64_t sub_10000827C(const char *a1, const __CFString *a2)
{
  size_t v4;
  char *v5;
  char *v6;
  io_registry_entry_t v7;
  io_object_t v8;
  CFTypeRef CFProperty;
  uint64_t v10;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = strlen(a1) + 13;
  v5 = (char *)malloc_type_malloc(v4, 0x5189311FuLL);
  if (!v5)
    return 4294967291;
  v6 = v5;
  snprintf(v5, v4, "%s%s", "IODeviceTree", a1);
  v7 = IORegistryEntryFromPath(kIOMainPortDefault, v6);
  if (v7)
  {
    v8 = v7;
    CFProperty = IORegistryEntryCreateCFProperty(v7, a2, kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    IOObjectRelease(v8);
  }
  else
  {
    v10 = 4294967288;
  }
  free(v6);
  return v10;
}

uint64_t sub_100008360(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  const void *Value;
  const void *v13;
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
  char v29;
  unsigned int v30;

  if ((_DWORD)a1)
    v4 = sub_100004A70(-(int)a1);
  else
    v4 = sub_100004810();
  v11 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, CFSTR("OpaqueStuff"));
    v13 = Value;
    if (Value)
      CFRetain(Value);
    v30 = 0;
    CFRelease(v11);
    sub_10001595C("KBUpdateKeyBag", CFSTR("Got opaqueStuff from ondisk keybag"), v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system(a1, &v30))
    {
      v27 = 0xFFFFFFFFLL;
      if (!v13)
        return v27;
      goto LABEL_13;
    }
    if ((_DWORD)a1)
      v20 = sub_100005878(v30, -(int)a1, v13, a2);
    else
      v20 = sub_100005504(v30, "/private/var/", v13, 1, a2);
    v27 = v20;
    sub_10001595C("KBUpdateKeyBag", CFSTR("Saved new keybag for handle %d with result %d"), v21, v22, v23, v24, v25, v26, a1);
    if (v13)
LABEL_13:
      CFRelease(v13);
  }
  else
  {
    sub_10001595C("KBUpdateKeyBag", CFSTR("failed to open ondisk keybag, failing UpdateKeyBag"), v5, v6, v7, v8, v9, v10, v29);
    return 0xFFFFFFFFLL;
  }
  return v27;
}

void sub_100008484(uint64_t a1, uint64_t a2, void **a3, _QWORD *a4, int a5, uint64_t a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, void *, uint64_t);
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  int v28;
  const __CFString *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  void *v40;

  v39 = 0;
  v40 = 0;
  v12 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v12)
  {
    v27 = CFSTR("Failed to open APFS framework");
    goto LABEL_8;
  }
  v19 = (uint64_t (*)(uint64_t, _QWORD, void *, uint64_t))dlsym(v12, "APFSVolumePayloadSet");
  if (!v19)
  {
    v27 = CFSTR("Failed to resolve gAPFSVolumePayloadSet");
LABEL_8:
    sub_10001595C("KBSetCookie", v27, v13, v14, v15, v16, v17, v18, v37);
    v19 = 0;
    if (a5)
      goto LABEL_4;
LABEL_9:
    v28 = aks_copy_volume_cookie(a1, &v40, &v39);
    if (v28)
    {
      sub_10001595C("KBSetCookie", CFSTR("Failed to get keybag Cookie from AKS:0x%x"), v21, v22, v23, v24, v25, v26, v28);
      goto LABEL_17;
    }
    v29 = CFSTR("Retrieved keybag Cookie from AKS, setting in APFS volume");
    goto LABEL_13;
  }
  if (!a5)
    goto LABEL_9;
LABEL_4:
  v20 = aks_copy_volume_cookie_persona(a1, a6, &v40, &v39);
  if (v20)
  {
    sub_10001595C("KBSetCookie", CFSTR("Failed to get keybag persona Cookiefrom AKS:0x%x"), v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_17;
  }
  v29 = CFSTR("Retrieved keybag persona Cookie from AKS, setting in APFS volume");
LABEL_13:
  sub_10001595C("KBSetCookie", v29, v21, v22, v23, v24, v25, v26, v37);
  if (v19)
  {
    v30 = v19(a2, 0, v40, v39);
    if (v30)
      sub_10001595C("KBSetCookie", CFSTR("APFSVolumePayloadSet failed with %d"), v31, v32, v33, v34, v35, v36, v30);
    else
      sub_10001595C("KBSetCookie", CFSTR("APFSVolumePayloadSet succeeded"), v31, v32, v33, v34, v35, v36, v38);
  }
LABEL_17:
  if (a3 && a4)
  {
    *a3 = v40;
    *a4 = v39;
  }
  else if (v40)
  {
    free(v40);
  }
}

uint64_t sub_100008610(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  void *v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  size_t size;
  void *v69;

  size = 0;
  v69 = 0;
  v12 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v12)
  {
    v47 = CFSTR("Failed to open APFS framework");
    goto LABEL_11;
  }
  v19 = v12;
  v26 = dlsym(v12, "APFSVolumePayloadGet");
  if (!v26)
    sub_10001595C("KBMapVolume", CFSTR("Failed to resolve gAPFSVolumePayloadGet"), v20, v21, v22, v23, v24, v25, v67);
  if (!dlsym(v19, "APFSVolumePayloadSet"))
    sub_10001595C("KBMapVolume", CFSTR("Failed to resolve gAPFSVolumePayloadSet"), v27, v28, v29, v30, v31, v32, v67);
  if (v26)
  {
    v33 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, size_t *))v26)(a3, 0, 0, &size);
    if (v33)
    {
      v40 = v33;
      sub_10001595C("KBMapVolume", CFSTR("APFSVolumePayloadGet failed with %d"), v34, v35, v36, v37, v38, v39, v33);
      if (v40 == 49154)
      {
        sub_10001595C("KBMapVolume", CFSTR("Not cookie in this volume, attempting to write it"), v41, v42, v43, v44, v45, v46, v67);
        sub_100008484(a1, a3, &v69, &size, a5, a6);
      }
      goto LABEL_12;
    }
    sub_10001595C("KBMapVolume", CFSTR("APFSVolumePayloadGet len reveived to be %zd"), v34, v35, v36, v37, v38, v39, size);
    v59 = malloc_type_malloc(size, 0x21D0A9C3uLL);
    v69 = v59;
    if (v59)
    {
      v60 = ((uint64_t (*)(uint64_t, _QWORD, void *, size_t *))v26)(a3, 0, v59, &size);
      if (v60)
        sub_10001595C("KBMapVolume", CFSTR("Failed to  obtain cookie from the volume with error %d"), v61, v62, v63, v64, v65, v66, v60);
      else
        sub_10001595C("KBMapVolume", CFSTR("Successfully obtained the cookie for the volume with length:%zd"), v61, v62, v63, v64, v65, v66, size);
      goto LABEL_12;
    }
    v47 = CFSTR("Failed to allocate Cookie malloc space");
LABEL_11:
    sub_10001595C("KBMapVolume", v47, v13, v14, v15, v16, v17, v18, v67);
  }
LABEL_12:
  if (a5)
  {
    v48 = aks_set_keybag_for_volume_with_cookie_persona(a2, a4, 0, v69, size, a6);
    v55 = v48;
    if ((_DWORD)v48)
    {
      sub_10001595C("KBMapVolume", CFSTR("aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x"), v49, v50, v51, v52, v53, v54, v48);
      goto LABEL_20;
    }
    v57 = CFSTR("aks_set_keybag_for_volume_with_cookie_persona SUCCESS");
  }
  else
  {
    v56 = aks_set_keybag_for_volume_with_cookie(a2, a4, 0, v69, size);
    v55 = v56;
    if ((_DWORD)v56)
    {
      sub_10001595C("KBMapVolume", CFSTR("aks_set_keybag_for_volume_with_cookie FAIL with 0x%x"), v49, v50, v51, v52, v53, v54, v56);
      goto LABEL_20;
    }
    v57 = CFSTR("aks_set_keybag_for_volume_with_cookie SUCCESS");
  }
  sub_10001595C("KBMapVolume", v57, v49, v50, v51, v52, v53, v54, v67);
LABEL_20:
  if (v69)
    free(v69);
  return v55;
}

uint64_t sub_100008888(const char *a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
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
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _OWORD v50[65];
  _BYTE v51[4];
  statfs v52;

  v47 = 0;
  v48 = 0;
  v49 = 0;
  memset(v50, 0, 512);
  memset(&v52, 0, 512);
  if (statfs(a1, &v52))
  {
    v12 = __error();
    v46 = strerror(*v12);
    sub_10001595C("has_data_protection", CFSTR("Statfs failed due to:%s on  (%s)"), v13, v14, v15, v16, v17, v18, v46);
LABEL_5:
    sub_10001595C("has_data_protection", CFSTR("mount point (%s) does not support Data Protection"), v19, v20, v21, v22, v23, v24, (char)a1);
    return 0;
  }
  if ((v52.f_flags & 0x80) == 0)
  {
    sub_10001595C("has_data_protection", CFSTR("mount is with NO CPROTECT:0x%x on  (%s)"), v6, v7, v8, v9, v10, v11, v52.f_flags);
    goto LABEL_5;
  }
  LOWORD(v47) = 5;
  LODWORD(v48) = -2147188736;
  if (getattrlist(a1, &v47, v50, 0x41CuLL, 0))
  {
    __error();
    sub_10001595C("KBMapDeviceBag", CFSTR("Could not get %s volume attributes (errno=%d)"), v32, v33, v34, v35, v36, v37, (char)a1);
    return 4294967290;
  }
  v38 = (char *)v50 + SDWORD1(v50[0]) + 4;
  if (v38 >= v51 || &v38[DWORD2(v50[0])] >= v51)
  {
    sub_10001595C("KBMapDeviceBag", CFSTR("Attribute buffer too small. offset=%d, lenght=%u"), (uint64_t)v38, v27, v28, v29, v30, v31, SBYTE4(v50[0]));
    return 4294967290;
  }
  v39 = sub_100008610(0, 0, (uint64_t)v38, (unint64_t)v50 | 0xC, a2, a3);
  v25 = sub_1000108D8(v39);
  if ((_DWORD)v25)
    sub_10001595C("KBMapDeviceBag", CFSTR("Could not map %s volume (ret=%d)"), v40, v41, v42, v43, v44, v45, (char)a1);
  return v25;
}

uint64_t sub_100008B14(const std::__fs::filesystem::path *a1, CFPropertyListRef *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  std::error_code *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const __CFData *v19;
  const UInt8 *BytePtr;
  size_t Length;
  const UInt8 *v22;
  CCCryptorStatus v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const UInt8 *v30;
  size_t v31;
  UInt8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  UInt8 *v39;
  _CCCryptor *v40;
  size_t v41;
  size_t v42;
  CCCryptorStatus v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _CCCryptor *v50;
  UInt8 *v51;
  CFIndex v52;
  CCCryptorStatus v53;
  uint64_t v54;
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
  int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  size_t dataOutMoved;
  size_t v77;
  CCCryptorRef cryptorRef;
  CFDataRef theData;
  CFDataRef v80;
  const __CFData *v81;
  std::__fs::filesystem::path __str[42];

  theData = 0;
  v80 = 0;
  v77 = 0;
  cryptorRef = 0;
  dataOutMoved = 0;
  *a2 = 0;
  bzero(__str, 0x401uLL);
  v81 = 0;
  v4 = sub_100008E3C((const char *)a1, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
  if (v4)
  {
    sub_10001595C("KBSecureLoadObject", CFSTR("Failed to validate keybag file: %d, %d"), v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", (const char *)a1);
    v11 = sub_100008E3C((const char *)__str, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
    if (v11 || !v81)
    {
      sub_10001595C("KBSecureLoadObject", CFSTR("Failed to validate keybag file: %d"), (uint64_t)v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      rename(__str, a1, v12);
      if (!v18)
        goto LABEL_5;
      v68 = __error();
      strerror(*v68);
      sub_10001595C("KBSecureLoadObject", CFSTR("could not rename %s to %s: %s"), v69, v70, v71, v72, v73, v74, (char)__str);
    }
    v60 = 4294967288;
    sub_10001595C("KBSecureLoadObjectWithCrypto", CFSTR("Can't load secure keybag Object: %d"), v62, v63, v64, v65, v66, v67, -8);
    v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  v19 = v81;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v22 = CFDataGetBytePtr(v80);
  v23 = CCCryptorCreate(1u, 0, 1u, BytePtr, Length, v22, &cryptorRef);
  if (v23)
  {
    sub_10001595C("KBSecureLoadObjectWithCrypto", CFSTR("Can't create decryptor: %d"), v24, v25, v26, v27, v28, v29, v23);
    v60 = 4294967289;
    goto LABEL_12;
  }
  v30 = CFDataGetBytePtr(v19);
  v31 = CFDataGetLength(v19);
  v32 = (UInt8 *)malloc_type_malloc(v31, 0x47E4BB70uLL);
  if (!v32)
  {
    sub_10001595C("KBSecureLoadObjectWithCrypto", CFSTR("Can't allocate decryption buffer"), v33, v34, v35, v36, v37, v38, v75);
    v60 = 4294967291;
    goto LABEL_12;
  }
  v39 = v32;
  v40 = cryptorRef;
  v41 = CFDataGetLength(v19);
  v42 = CFDataGetLength(v19);
  v43 = CCCryptorUpdate(v40, v30, v41, v39, v42, &dataOutMoved);
  if (v43)
  {
    sub_10001595C("KBSecureLoadObjectWithCrypto", CFSTR("Unable to decrypt: %d"), v44, v45, v46, v47, v48, v49, v43);
  }
  else
  {
    v50 = cryptorRef;
    v51 = &v39[dataOutMoved];
    v52 = CFDataGetLength(v19);
    v53 = CCCryptorFinal(v50, v51, v52 - dataOutMoved, &v77);
    if (!v53)
    {
      v60 = 0;
      *a2 = sub_100010298(v39, (v77 + dataOutMoved));
      goto LABEL_10;
    }
    sub_10001595C("KBSecureLoadObjectWithCrypto", CFSTR("Unable to finalize: %d"), v54, v55, v56, v57, v58, v59, v53);
  }
  v60 = 4294967289;
LABEL_10:
  if (v39 != v30)
    free(v39);
LABEL_12:
  if (v80)
  {
    CFRelease(v80);
    v80 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (v19)
    CFRelease(v19);
  CCCryptorRelease(cryptorRef);
  return v60;
}

uint64_t sub_100008E3C(const char *a1, _QWORD *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  const __CFNumber *Value;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFNumber *v23;
  CFTypeID v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  CFTypeID v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  CFTypeID v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFDataRef v58;
  CFDataRef v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CFDataRef v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CFTypeRef v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  unsigned int valuePtr;
  size_t v84;
  _OWORD v85[3];
  int v86;

  v7 = (char)a1;
  v8 = (const __CFDictionary *)sub_100010674(a1);
  if (!v8)
  {
    sub_10001595C("validateSecureFile", CFSTR("Unable to load %s"), v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }
  v15 = v8;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("_MKBWIPEID"));
  if (!Value || (v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    sub_10001595C("validateSecureFile", CFSTR("%s missing wipeID"), v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }
  v25 = CFDictionaryGetValue(v15, CFSTR("_MKBIV"));
  if (!v25 || (v32 = v25, v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    sub_10001595C("validateSecureFile", CFSTR("%s missing IV"), v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }
  v34 = CFDictionaryGetValue(v15, CFSTR("_MKBPAYLOAD"));
  if (!v34 || (v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    sub_10001595C("validateSecureFile", CFSTR("%s missing payload"), v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }
  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  v43 = valuePtr;
  v86 = 0;
  memset(v85, 0, sizeof(v85));
  v84 = 52;
  v44 = sub_1000038E4(valuePtr, v85, &v84);
  if (v44)
  {
    sub_10001595C("loadWipeIDInfo", CFSTR("Unable to load wipe info: %08x"), v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    sub_10001595C("validateSecureFile", CFSTR("Can't load wipe info for ID:%08x"), v76, v77, v78, v79, v80, v81, valuePtr);
    goto LABEL_35;
  }
  if (LODWORD(v85[0]) != v43)
  {
    sub_10001595C("loadWipeIDInfo", CFSTR("Wipe Info ID is wrong: %d"), v45, v46, v47, v48, v49, v50, v85[0]);
    goto LABEL_34;
  }
  v51 = CFDataCreate(0, (const UInt8 *)v85 + 4, 16);
  if (!v51)
  {
    sub_10001595C("loadWipeIDInfo", CFSTR("Can't create iv data"), v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }
  v58 = v51;
  v59 = CFDataCreate(0, (const UInt8 *)&v85[1] + 4, 32);
  if (!v59)
  {
    sub_10001595C("loadWipeIDInfo", CFSTR("Can't create key data"), v60, v61, v62, v63, v64, v65, v82);
    CFRelease(v58);
    goto LABEL_34;
  }
  v66 = v59;
  if (CFEqual(v32, v58))
  {
    if (a3)
      *a3 = CFRetain(v58);
    if (a4)
      *a4 = CFRetain(v66);
    if (!a2)
    {
      v74 = 0;
      goto LABEL_23;
    }
    v73 = CFRetain(v41);
    v74 = 0;
    goto LABEL_21;
  }
  sub_10001595C("validateSecureFile", CFSTR("fileIV to wipeIV mismatch, no payload returned"), v67, v68, v69, v70, v71, v72, v82);
  CFShow(v32);
  CFShow(v58);
  v74 = 4294967287;
  if (a2)
  {
    v73 = 0;
LABEL_21:
    *a2 = v73;
  }
LABEL_23:
  CFRelease(v15);
  CFRelease(v58);
  CFRelease(v66);
  return v74;
}

const __CFData *sub_100009158(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int lock_state;
  const __CFData *v9;
  const __CFData *v10;
  const UInt8 *BytePtr;
  CFIndex Length;
  int v14;

  if ((_DWORD)a1 != -1)
  {
    v14 = 1;
    lock_state = aks_get_lock_state(a1, &v14);
    if (!lock_state)
    {
      v9 = (const __CFData *)((BYTE2(v14) >> 6) & 1);
      goto LABEL_7;
    }
    sub_10001595C("KBisxARTBasedKeyBag", CFSTR("get_lock_state() -> 0x%x"), a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    v9 = 0;
    goto LABEL_7;
  }
  if (!a2)
    goto LABEL_9;
  v10 = (const __CFData *)sub_1000100C8(a2, CFSTR("KeyBagKeys"));
  v9 = v10;
  if (v10)
  {
    BytePtr = CFDataGetBytePtr(v10);
    Length = CFDataGetLength(v9);
    v9 = (const __CFData *)aks_bag_in_xart(BytePtr, Length);
  }
LABEL_7:
  sub_10001595C("KBisxARTBasedKeyBag", CFSTR("Result = %d"), a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

BOOL sub_100009224(id a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v9;
  char v10;
  int v11;

  v11 = 0;
  if (aks_get_lock_state(0, &v11))
  {
    v9 = CFSTR("no lock state");
LABEL_7:
    sub_10001595C("seshat_preflight_condition_for_pw_change_block_invoke", v9, v2, v3, v4, v5, v6, v7, v10);
    return 0;
  }
  if ((v11 & 0x2000) != 0)
  {
    v9 = CFSTR("can't preflight, already bound to SE");
    goto LABEL_7;
  }
  return 1;
}

uint64_t sub_100009284(uint64_t result)
{
  qword_1000358B0 = result;
  return result;
}

uint64_t sub_100009290(uint64_t result)
{
  qword_1000358B8 = result;
  return result;
}

void sub_1000093A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = objc_opt_class(*(_QWORD *)(a1 + 32));
  v2 = objc_opt_new(v1);
  v3 = (void *)qword_1000358C0;
  qword_1000358C0 = v2;

}

void sub_100009974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000099A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000099B8(uint64_t a1)
{

}

void sub_1000099C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFData *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
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
  char v41;
  char v42;
  char v43;
  uint64_t v44;

  v9 = "NULL";
  if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 72))
    v9 = "SECRET";
  sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", CFSTR("oldpass=%s newpass=%s %s (params:%d)"), a3, a4, a5, a6, a7, a8, (char)v9);
  v10 = *(_QWORD *)(a1 + 64);
  if (v10)
  {
    v10 = *(_QWORD *)(a1 + 72);
    if (v10)
    {
      v10 = *(_QWORD *)(a1 + 80);
      if (v10)
        LOBYTE(v10) = *(_QWORD *)(a1 + 88) != 0;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
  v11 = sub_100015958();
  v12 = sub_100015C70();
  v13 = *(_QWORD *)(a1 + 72);
  if (v13)
    v14 = *(_QWORD *)(a1 + 64);
  else
    v14 = 0;
  v15 = *(_QWORD *)(a1 + 88);
  if (v15)
    v16 = *(const __CFData **)(a1 + 80);
  else
    v16 = 0;
  v17 = sub_1000070F0(v12, v11, v14, v13, v16, v15, *(const void **)(a1 + 32), *(_DWORD *)(a1 + 96));
  if (v17)
  {
    v24 = v17;
    sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", CFSTR("Can't change passcode: 0x%08x"), v18, v19, v20, v21, v22, v23, v17);
    v25 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v24, 0));
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", CFSTR("change passcode success"), v18, v19, v20, v21, v22, v23, v41);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      sub_10001595C("-[KBXPCService changeSystemSecretfromOldSecret:oldSize:toNewSecret:newSize:opaqueData:withParams:reply:]_block_invoke", CFSTR("Posting analytics stats"), v28, v29, v30, v31, v32, v33, v42);
      v44 = 1;
      sub_100013CEC(&v44, v34, v35, v36, v37, v38, v39, v40, v43);
    }
  }
}

void sub_10000A188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000A1B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;
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
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v10 = "NULL";
  if (*(_QWORD *)(a1 + 64) && *(_QWORD *)(a1 + 72))
    v10 = "SECRET";
  sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", CFSTR("oldpass=%s newpass=%s %s"), a3, a4, a5, a6, a7, a8, (char)v10);
  v11 = *(_QWORD *)(a1 + 72);
  if (v11)
    v12 = *(_QWORD *)(a1 + 64);
  else
    v12 = 0;
  v13 = *(_QWORD *)(a1 + 88);
  if (v13)
    v14 = *(_QWORD *)(a1 + 80);
  else
    v14 = 0;
  v15 = sub_1000081AC(*(const __CFData **)(a1 + 40), v12, v11, v14, v13, *(unsigned __int8 *)(a1 + 96), *(const void **)(a1 + 32));
  if (v15)
  {
    v22 = v15;
    sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", CFSTR("Can't change passcode: 0x%08x"), v16, v17, v18, v19, v20, v21, v15);
    v23 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v22, 0));
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(void **)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    sub_10001595C("-[KBXPCService changeSystemSecretWithEscrow:fromOldSecret:oldSize:toNewSecret:newSize:opaqueData:keepstate:reply:]_block_invoke", CFSTR("change passcode success"), v16, v17, v18, v19, v20, v21, a9);
  }
}

uint64_t sub_10000BC20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_10000C240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_10000C268(uint64_t a1)
{
  const __CFDictionary *v2;
  uint64_t v3;
  uint64_t v4;
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
  void *v15;

  v2 = *(const __CFDictionary **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
    v4 = *(_QWORD *)(a1 + 72);
  else
    v4 = 0;
  v5 = sub_1000147D0(v2, *(unsigned int *)(a1 + 80), v4, v3, *(_DWORD *)(a1 + 84), *(const void **)(a1 + 40));
  if (v5)
  {
    v12 = v5;
    sub_10001595C("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]_block_invoke", CFSTR("Can't createKeybag for usersession(uid=%d): 0x%08x"), v6, v7, v8, v9, v10, v11, *(_DWORD *)(a1 + 80));
    v13 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v12, 0));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    sub_10001595C("-[KBXPCService createKeybagForUserSession:withSessionUID:WithSecret:secretSize:withGracePeriod:withOpaqeStuff:withReply:]_block_invoke", CFSTR("Created keybag for user:%d success"), v6, v7, v8, v9, v10, v11, *(_DWORD *)(a1 + 80));
  }
}

void sub_10000C698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_10000C6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v10 = *(const __CFDictionary **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 56);
  if (v11)
    v12 = *(_QWORD *)(a1 + 64);
  else
    v12 = 0;
  v13 = sub_100014114(v10, *(unsigned int *)(a1 + 72), v12, v11, *(unsigned __int8 *)(a1 + 80), *(_DWORD *)(a1 + 76), *(unsigned __int8 *)(a1 + 81));
  if (v13)
  {
    v20 = v13;
    sub_10001595C("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]_block_invoke", CFSTR("Can't loadkeybag for usersession(uid=%d): 0x%08x"), v14, v15, v16, v17, v18, v19, *(_DWORD *)(a1 + 72));
    v21 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, 0));
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    sub_10001595C("-[KBXPCService loadKeybagForUserSession:withSessionID:withSecret:secretSize:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:withReply:]_block_invoke", CFSTR("loadUserKeybag successful"), v14, v15, v16, v17, v18, v19, a9);
  }
}

void sub_10000C8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C8D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_100014B00(*(unsigned int *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 40));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService unloadKeybagForUserSession:withReply:]_block_invoke", CFSTR("unloadUserKeybag successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000CAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000CAE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_100005878(0xFFFFFFFFLL, *(unsigned int *)(a1 + 40), 0, 0);
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke", CFSTR("Can't invalidate keybag for usersession(uid=%d): 0x%08x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 40));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService deleteKeybagForUserSession:withReply:]_block_invoke", CFSTR("deleteUserKeybag successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000CD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CD20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  uuid_t uu;
  char in[16];
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
  char buffer[1024];

  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
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
  *(_OWORD *)in = 0u;
  v30 = 0u;
  if (CFStringGetCString(*(CFStringRef *)(a1 + 32), buffer, 1024, 0x8000100u))
  {
    if (CFStringGetCString(*(CFStringRef *)(a1 + 40), in, 256, 0x8000100u))
    {
      if (uuid_parse(in, uu))
      {
        v5 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v7 = *(void **)(v6 + 40);
        *(_QWORD *)(v6 + 40) = v5;

        v14 = CFSTR("failed to parse unique string to uuid_t");
      }
      else
      {
        v22 = sub_100014A78(0, 0, 0, buffer, (uint64_t)uu, v2, v3, v4);
        if (v22)
        {
          v23 = v22;
          sub_10001595C("-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke", CFSTR("Can't map volumepath:%s to uuid with error: 0x%08x"), v8, v9, v10, v11, v12, v13, (char)buffer);
          v24 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v23, 0));
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v26 = *(void **)(v25 + 40);
          *(_QWORD *)(v25 + 40) = v24;

          return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        }
        v14 = CFSTR("setupKeybagForPersona successful");
      }
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

      v14 = CFSTR("Failed to get cstring from uuid string");
    }
  }
  else
  {
    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v14 = CFSTR("Failed to get volume path");
  }
  sub_10001595C("-[KBXPCService setVolumeToPersona:withPersonaString:withReply:]_block_invoke", v14, v8, v9, v10, v11, v12, v13, v27);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void sub_10000D0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_100014BCC(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService createSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("createSyncbag successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000D2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_100014E58(*(const __CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), a3, a4, a5, a6, a7, a8);
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService loadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("loadSyncbag successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000D518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D530(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_1000153D0(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48));
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(a1 + 48));
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService verifySyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("verifySyncbag successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_10000D738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
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
  const __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char v35;

  v10 = sub_100015958();
  sub_10001595C("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("currentFGID:%d, session uid:%d"), v11, v12, v13, v14, v15, v16, v10);
  if (*(_DWORD *)(a1 + 48) == v10)
  {
    v23 = CFSTR("No need to unload syncbag for current user, skip..");
  }
  else
  {
    sub_10001595C("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Unloading the bag"), v17, v18, v19, v20, v21, v22, v35);
    v30 = sub_1000154A4(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 48), v24, v25, v26, v27, v28, v29);
    if (v30)
    {
      v31 = v30;
      sub_10001595C("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v17, v18, v19, v20, v21, v22, *(_DWORD *)(a1 + 48));
      v32 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v31, 0));
      v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v34 = *(void **)(v33 + 40);
      *(_QWORD *)(v33 + 40) = v32;

      return;
    }
    v23 = CFSTR("unloadSyncbag successful");
  }
  sub_10001595C("-[KBXPCService unloadSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", v23, v17, v18, v19, v20, v21, v22, a9);
}

void sub_10000D9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D9C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
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
  BOOL v24;
  _BOOL8 v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  char v43;

  v10 = sub_100015958();
  sub_10001595C("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("currentFGID:%d, session uid:%d"), v11, v12, v13, v14, v15, v16, v10);
  v23 = *(_DWORD *)(a1 + 48);
  v24 = v23 == v10;
  v25 = v23 != v10;
  if (v24)
    v26 = CFSTR("removing syncbag for current user, only sync bag will be cleared");
  else
    v26 = CFSTR("Syncbag removal for non foreground user, unloading session bag as well");
  sub_10001595C("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", v26, v17, v18, v19, v20, v21, v22, v43);
  v32 = sub_10001513C(*(__CFDictionary **)(a1 + 32), *(unsigned int *)(a1 + 48), v25, v27, v28, v29, v30, v31);
  if (v32)
  {
    v39 = v32;
    sub_10001595C("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("Can't unloadkeybag for usersession(uid=%d): 0x%08x"), v33, v34, v35, v36, v37, v38, *(_DWORD *)(a1 + 48));
    v40 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v39, 0));
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
  else
  {
    sub_10001595C("-[KBXPCService removeSyncBagForUserSession:withSessionUID:withReply:]_block_invoke", CFSTR("removeSyncbag successful"), v33, v34, v35, v36, v37, v38, a9);
  }
}

void sub_10000DE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_10000DE38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v10 = *(unsigned int *)(a1 + 80);
  v11 = *(_QWORD *)(a1 + 64);
  if (v11)
    v12 = *(_QWORD *)(a1 + 72);
  else
    v12 = 0;
  v13 = sub_100015574(v10, *(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40), v12, v11);
  if (v13)
  {
    v20 = v13;
    sub_10001595C("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke", CFSTR("Can't create persona key for user with error: 0x%08x"), v14, v15, v16, v17, v18, v19, v13);
    v21 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, 0));
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    sub_10001595C("-[KBXPCService createPersonaKeyForUserSession:forPath:withUID:WithSecret:secretSize:withReply:]_block_invoke", CFSTR("createPersonaKey successful"), v14, v15, v16, v17, v18, v19, a9);
  }
}

void sub_10000E084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E09C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v10 = sub_10001575C(*(_DWORD *)(a1 + 56), *(CFStringRef *)(a1 + 32), *(const __CFString **)(a1 + 40));
  if (v10)
  {
    v17 = v10;
    sub_10001595C("-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke", CFSTR("Can't delete persona key for user: 0x%08x"), v11, v12, v13, v14, v15, v16, v10);
    v18 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v17, 0));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
  else
  {
    sub_10001595C("-[KBXPCService removePersonaKeyForUserSession:withUID:withVolumeUUIDString:withReply:]_block_invoke", CFSTR("removePersonaKey successful"), v11, v12, v13, v14, v15, v16, a9);
  }
}

id sub_10000E140()
{
  KBXPCListener *v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_opt_new(KBXPCListener);
  v1 = (void *)qword_1000358D8;
  qword_1000358D8 = (uint64_t)v0;

  v2 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.mobile.keybagd.xpc"));
  v3 = (void *)qword_1000358D0;
  qword_1000358D0 = (uint64_t)v2;

  objc_msgSend((id)qword_1000358D0, "setDelegate:", qword_1000358D8);
  return objc_msgSend((id)qword_1000358D0, "resume");
}

void sub_10000E298(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000E2AC(id a1)
{
  qword_1000358E0 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);
}

id sub_10000E444(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_beginSpeculativeFailureCharge");
}

id sub_10000E4A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_rollbackSpeculativeFailureCharge");
}

id sub_10000E504(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockSucceeded");
}

id sub_10000E564(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_persistentStateQueue_unlockFailed");
}

uint64_t sub_10000E600(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 57);
  return result;
}

double sub_10000E6E8(uint64_t a1)
{
  double result;

  result = *(double *)(*(_QWORD *)(a1 + 32) + 64);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_10000E78C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 56);
  return result;
}

uint64_t sub_10000E830(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

NSDictionary *sub_10000EE68(uint64_t a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v1 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", a1);
  objc_msgSend(v1, "timeUntilUnblockedSinceReferenceDate");
  v3 = v2;
  -[NSDate timeIntervalSinceReferenceDate](+[NSDate date](NSDate, "date"), "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = 0.0;
  if (v3 > v5)
    -[NSDate timeIntervalSinceNow](+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v3), "timeIntervalSinceNow");
  v8[0] = CFSTR("TimeUntilUnblockedSinceReferenceDate");
  v9[0] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6);
  v8[1] = CFSTR("FailedPasscodeAttempts");
  v9[1] = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v1, "failedPasscodeAttempts"));
  v8[2] = CFSTR("IsPermanentlyBlocked");
  v9[2] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v1, "isPermanentlyBlocked"));
  v8[3] = CFSTR("IsWipePending");
  v9[3] = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v1, "isWipePending"));
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 4);
}

id sub_10000EFD0(uint64_t a1)
{
  return objc_msgSend(+[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", a1), "notePasscodeEntryBegan");
}

id sub_10000EFF0(uint64_t a1)
{
  return objc_msgSend(+[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", a1), "notePasscodeUnlockSucceeded");
}

id sub_10000F010(uint64_t a1)
{
  return objc_msgSend(+[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", a1), "notePasscodeUnlockFailed");
}

uint64_t sub_10000F030(sqlite3 *a1, int a2)
{
  const char *v2;
  uint64_t v3;
  char *errmsg;

  errmsg = 0;
  if (a2)
    v2 = "BEGIN TRANSACTION";
  else
    v2 = "END TRANSACTION";
  v3 = sqlite3_exec(a1, v2, 0, 0, &errmsg);
  if (errmsg)
    sqlite3_free(errmsg);
  return v3;
}

BOOL sub_10000F090(sqlite3 *a1)
{
  const unsigned __int8 *v1;
  _BOOL8 v2;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = sqlite3_prepare_v2(a1, "PRAGMA integrity_check;", -1, &ppStmt, 0)
    || sqlite3_step(ppStmt) != 100
    || (v1 = sqlite3_column_text(ppStmt, 0)) == 0
    || strncasecmp((const char *)v1, "ok", 3uLL) != 0;
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v2;
}

uint64_t sub_10000F120(sqlite3 *a1)
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
  char v12;

  v2 = sqlite3_file_control(a1, 0, 101, 0);
  if (!(_DWORD)v2)
    return (sub_10000F17C(a1, v3, v4, v5, v6, v7, v8, v9) - 1);
  v10 = v2;
  sub_10001595C("db_truncate", CFSTR("unable to truncate"), v4, v5, v6, v7, v8, v9, v12);
  return v10;
}

BOOL sub_10000F17C(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v17;
  char *errmsg;

  errmsg = 0;
  sub_10001595C("init_db", CFSTR("initializing sqlite db"), a3, a4, a5, a6, a7, a8, v17);
  v15 = sqlite3_exec(a1, "DROP TABLE IF EXISTS WrappedKeys;CREATE TABLE WrappedKeys(Inode INT, Uuid BLOB, Key BLOB, Flagged BOOLEAN DEFA"
          "ULT 0, AddTime TIMESTAMP DEFAULT 0, ClearTime TIMESTAMP DEFAULT 0, AccessTime TIMESTAMP DEFAULT 0, unique(Inod"
          "e, Uuid));CREATE INDEX Inode ON WrappedKeys(Inode);CREATE INDEX InodeUuid ON WrappedKeys(Inode, Uuid);PRAGMA u"
          "ser_version = 3;",
          0,
          0,
          &errmsg);
  if (v15)
  {
    sub_10001595C("init_db", CFSTR("sqlite error: %s"), v9, v10, v11, v12, v13, v14, (char)errmsg);
    sqlite3_free(errmsg);
  }
  return v15 == 0;
}

sqlite3 *sub_10000F208(const char *a1, int a2, int a3, uint64_t a4)
{
  char v5;
  int v7;
  int v8;
  char v9;
  int v10;
  char v11;
  char v12;
  int v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  sqlite3 *result;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  sqlite3 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  BOOL v39;
  int v40;
  char v41;
  int v42;
  stat v43;
  sqlite3 *ppDb;
  char *errmsg;

  v5 = a3;
  ppDb = 0;
  memset(&v43, 0, sizeof(v43));
  if (a2 && a3)
  {
    if (!a4)
      return 0;
    v40 = 1;
LABEL_48:
    result = 0;
    *(_DWORD *)(a4 + 20) = v40;
    return result;
  }
  if (a3)
    v7 = 1;
  else
    v7 = 2;
  if (a2)
    v8 = v7 | 4;
  else
    v8 = v7;
  if (!sub_100015D04())
  {
    if (!a4)
      return 0;
    v40 = 2;
    goto LABEL_48;
  }
  v42 = 0;
  v9 = 0;
  v10 = v8 | 0x300000;
  v11 = 1;
  while (1)
  {
    v12 = v11;
    v13 = stat(a1, &v43);
    v14 = v13 == 0;
    v15 = sqlite3_open_v2(a1, &ppDb, v10, 0);
    if (v15)
    {
      if (a4)
        *(_DWORD *)(a4 + 24) = v15;
      v22 = 4;
      goto LABEL_23;
    }
    if (_sqlite3_maintain_load_factor(ppDb, 0))
      sub_10001595C("db_open_mode_with_stats", CFSTR("_sqlite3_maintain_load_factor for %s failed: %d"), v16, v17, v18, v19, v20, v21, (char)a1);
    result = ppDb;
    if (v13)
    {
      if (!ppDb)
        goto LABEL_44;
      goto LABEL_38;
    }
    if (sub_10000F4AC(ppDb) != 2)
      break;
    v31 = ppDb;
    errmsg = 0;
    sub_10001595C("db_migrate_from_v2", CFSTR("Migrating backup db from v2"), v25, v26, v27, v28, v29, v30, v41);
    if (!sqlite3_exec(v31, "ALTER TABLE WrappedKeys ADD COLUMN AddTime TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN AccessTime"
            " TIMESTAMP DEFAULT 0;ALTER TABLE WrappedKeys ADD COLUMN ClearTime TIMESTAMP DEFAULT 0;PRAGMA user_version = 3;",
            0,
            0,
            &errmsg))
      break;
    sub_10001595C("db_migrate_from_v2", CFSTR("sqlite error: %s"), v32, v33, v34, v35, v36, v37, (char)errmsg);
    sqlite3_free(errmsg);
    v22 = 7;
LABEL_23:
    v42 = v22;
    sub_10001595C("db_open_mode_with_stats", CFSTR("db(%d) @ %s has a problem, rc=%d, version=%d"), v16, v17, v18, v19, v20, v21, v9);
    if (ppDb)
    {
      if ((v5 & 1) != 0)
      {
        sqlite3_close(ppDb);
        ppDb = 0;
      }
      else
      {
        v38 = sub_10000F120(ppDb);
        if (a4)
          *(_BYTE *)(a4 + 28) = 1;
        sqlite3_close(ppDb);
        ppDb = 0;
        if (v38)
        {
          unlink(a1);
          if (a4)
            *(_BYTE *)(a4 + 29) = 1;
        }
      }
    }
    v11 = 0;
    v9 = 1;
    if ((v12 & 1) == 0)
      goto LABEL_36;
  }
  if (sub_10000F4AC(ppDb) != 3)
  {
    v22 = 6;
    goto LABEL_23;
  }
  v14 = 1;
LABEL_36:
  result = ppDb;
  if (!ppDb)
  {
LABEL_44:
    v40 = v42;
    if (a4)
      goto LABEL_48;
    return 0;
  }
  if (v14)
    return result;
LABEL_38:
  v39 = sub_10000F17C(result, v23, v16, v17, v18, v19, v20, v21);
  result = ppDb;
  if (v39)
    return result;
  sqlite3_close(ppDb);
  if (a4)
  {
    v40 = 3;
    goto LABEL_48;
  }
  return 0;
}

uint64_t sub_10000F4AC(sqlite3 *a1)
{
  uint64_t v1;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "PRAGMA user_version;", -1, &ppStmt, 0) || sqlite3_step(ppStmt) != 100)
    v1 = 0;
  else
    v1 = sqlite3_column_int(ppStmt, 0);
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v1;
}

sqlite3 *sub_10000F524(const char *a1, int a2, int a3)
{
  return sub_10000F208(a1, a2, a3, 0);
}

uint64_t sub_10000F52C(sqlite3 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = sqlite3_close(a1);
  v8 = v1;
  if ((_DWORD)v1)
    sub_10001595C("db_close", CFSTR("failed to close sqlite with %d"), v2, v3, v4, v5, v6, v7, v1);
  return v8;
}

uint64_t sub_10000F574(sqlite3 *a1, sqlite3_int64 *a2, const void *a3, int *a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v8 = sqlite3_prepare_v2(a1, "REPLACE INTO WrappedKeys (Inode, Uuid, Key, AddTime) VALUES(?, ?, ?, datetime('now', 'subsec'))", -1, &ppStmt, 0);
  if (v8)
  {
    v22 = v8;
    v23 = sqlite3_errmsg(a1);
    sub_10001595C("db_add_item_with_error", CFSTR("Cannot prepare statement: %s"), v24, v25, v26, v27, v28, v29, v23);
    v20 = 2;
    if (!a4)
      goto LABEL_7;
    goto LABEL_19;
  }
  v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
  if (v9)
  {
    v22 = v9;
    v30 = sqlite3_errmsg(a1);
    sub_10001595C("db_add_item_with_error", CFSTR("Cannot bind inode int64 %s"), v31, v32, v33, v34, v35, v36, v30);
    v20 = 3;
    if (!a4)
      goto LABEL_7;
    goto LABEL_19;
  }
  v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0);
  if (v10)
  {
    v22 = v10;
    v37 = sqlite3_errmsg(a1);
    sub_10001595C("db_add_item_with_error", CFSTR("Cannot bind uuid blob %s"), v38, v39, v40, v41, v42, v43, v37);
    v20 = 4;
    if (!a4)
      goto LABEL_7;
    goto LABEL_19;
  }
  v11 = sqlite3_bind_blob(ppStmt, 3, a3, 108, 0);
  if (v11)
  {
    v22 = v11;
    v44 = sqlite3_errmsg(a1);
    sub_10001595C("db_add_item_with_error", CFSTR("Cannot bind key blob %s"), v45, v46, v47, v48, v49, v50, v44);
    v20 = 5;
    if (!a4)
      goto LABEL_7;
LABEL_19:
    *a4 = v22;
    goto LABEL_7;
  }
  v12 = sqlite3_step(ppStmt);
  if (v12 == 101)
  {
    v20 = 0;
    goto LABEL_7;
  }
  v22 = v12;
  v51 = sqlite3_errmsg(a1);
  sub_10001595C("db_add_item_with_error", CFSTR("step failed: %s"), v52, v53, v54, v55, v56, v57, v51);
  v20 = 6;
  if (a4)
    goto LABEL_19;
LABEL_7:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  v59 = v20;
  sub_100013B6C((uint64_t)&v59, v13, v14, v15, v16, v17, v18, v19, v58);
  return v20;
}

uint64_t sub_10000F748(sqlite3 *a1, sqlite3_int64 *a2, _OWORD *a3, CFTypeRef *a4)
{
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  const unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char *v37;
  int v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
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
  __CFDictionary *Mutable;
  CFNumberRef v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  CFNumberRef v74;
  char v75;
  uint64_t v76;
  sqlite3_stmt *ppStmt;
  int valuePtr;

  ppStmt = 0;
  v8 = sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET AccessTime = (CASE WHEN Key NOT NULL THEN datetime('now', 'subsec') END) WHERE Inode = ? AND Uuid = ? RETURNING Key, AddTime, AccessTime, ClearTime", -1, &ppStmt, 0);
  if (v8)
  {
    v38 = v8;
    v39 = sqlite3_errmsg(a1);
    sub_10001595C("db_get_item", CFSTR("Failed to execute get statement: %s\n"), v40, v41, v42, v43, v44, v45, v39);
    v13 = 0;
    v37 = 0;
    v14 = 0;
    v30 = 2;
  }
  else
  {
    v9 = sqlite3_bind_int64(ppStmt, 1, *a2);
    if (v9)
    {
      v38 = v9;
      v46 = sqlite3_errmsg(a1);
      sub_10001595C("db_get_item", CFSTR("Cannot bind inode int64 %s"), v47, v48, v49, v50, v51, v52, v46);
      v13 = 0;
      v37 = 0;
      v14 = 0;
      v30 = 3;
    }
    else
    {
      v10 = sqlite3_bind_blob(ppStmt, 2, a2 + 1, 16, 0);
      if (v10)
      {
        v38 = v10;
        v53 = sqlite3_errmsg(a1);
        sub_10001595C("db_get_item", CFSTR("Cannot bind uuid blob %s"), v54, v55, v56, v57, v58, v59, v53);
        v13 = 0;
        v37 = 0;
        v14 = 0;
        v30 = 4;
      }
      else
      {
        v11 = sqlite3_step(ppStmt);
        if (v11 == 100)
        {
          v12 = sqlite3_column_bytes(ppStmt, 0);
          v13 = (char *)sqlite3_column_text(ppStmt, 1);
          v14 = (char *)sqlite3_column_text(ppStmt, 2);
          v15 = sqlite3_column_text(ppStmt, 3);
          if (v12 == 108)
          {
            v22 = sqlite3_column_blob(ppStmt, 0);
            v30 = 0;
            v32 = v22[1];
            v31 = v22[2];
            *a3 = *v22;
            a3[1] = v32;
            a3[2] = v31;
            v34 = v22[4];
            v33 = v22[5];
            v35 = v22[3];
            *(_OWORD *)((char *)a3 + 92) = *(_OWORD *)((char *)v22 + 92);
            a3[4] = v34;
            a3[5] = v33;
            a3[3] = v35;
            goto LABEL_7;
          }
          v37 = (char *)v15;
          if (v12)
          {
            sub_10001595C("db_get_item", CFSTR("Invalid Key"), v16, v17, v18, v19, v20, v21, v75);
            v38 = 100;
            v30 = 8;
          }
          else
          {
            sub_10001595C("db_get_item", CFSTR("Cleared Key"), v16, v17, v18, v19, v20, v21, v75);
            v38 = 100;
            v30 = 7;
          }
        }
        else
        {
          v38 = v11;
          sqlite3_errmsg(a1);
          sub_10001595C("db_get_item", CFSTR("Step failed rc=%d, %s"), v60, v61, v62, v63, v64, v65, v38);
          v13 = 0;
          v37 = 0;
          v14 = 0;
          v30 = 6;
        }
      }
    }
  }
  if (a4)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    valuePtr = v38;
    v67 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v67)
    {
      v74 = v67;
      CFDictionaryAddValue(Mutable, CFSTR("sqlError"), v67);
      CFRelease(v74);
    }
    else
    {
      sub_10001595C("CFDictionaryAddInt", CFSTR("Internal error: could not create CFNumber from int"), v68, v69, v70, v71, v72, v73, v75);
    }
    sub_10000FA9C(Mutable, CFSTR("added"), v13);
    sub_10000FA9C(Mutable, CFSTR("accessed"), v14);
    sub_10000FA9C(Mutable, CFSTR("cleared"), v37);
    if (*a4)
      CFRelease(*a4);
    *a4 = CFErrorCreate(kCFAllocatorDefault, CFSTR("MobileKeyBagError.DbGetError"), v30, Mutable);
    if (Mutable)
      CFRelease(Mutable);
  }
LABEL_7:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  v76 = v30;
  sub_100013C2C((uint64_t)&v76, v23, v24, v25, v26, v27, v28, v29, v75);
  return v30;
}

void sub_10000FA9C(__CFDictionary *a1, const void *a2, char *cStr)
{
  char v3;
  CFStringRef v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFStringRef v13;

  if (cStr)
  {
    v3 = (char)cStr;
    v6 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
    if (v6)
    {
      v13 = v6;
      CFDictionaryAddValue(a1, a2, v6);
      CFRelease(v13);
    }
    else
    {
      sub_10001595C("CFDictionaryAddSQLStringIfNotNull", CFSTR("Internal error: could not create CFString from C string %s"), v7, v8, v9, v10, v11, v12, v3);
    }
  }
}

uint64_t sub_10000FB38(sqlite3 *a1, const void *a2)
{
  uint64_t v4;
  const __CFString *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "DELETE FROM WrappedKeys WHERE Uuid = ?", -1, &ppStmt, 0))
  {
    v6 = CFSTR("Failed to execute get statement: %s\n");
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    v4 = 5;
    v6 = CFSTR("Cannot bind uuid blob %s");
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      v4 = 0;
      goto LABEL_5;
    }
    v6 = CFSTR("step failed: %s");
  }
  v7 = sqlite3_errmsg(a1);
  sub_10001595C("db_delete_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v4;
}

uint64_t sub_10000FC10(sqlite3 *a1, const void *a2)
{
  uint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1 WHERE Uuid = ?", -1, &ppStmt, 0))
  {
    v6 = sqlite3_errmsg(a1);
    sub_10001595C("db_flag_volume", CFSTR("Failed to execute get statement: %s\n"), v7, v8, v9, v10, v11, v12, v6);
    v4 = 0xFFFFFFFFLL;
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    v13 = sqlite3_errmsg(a1);
    sub_10001595C("db_flag_volume", CFSTR("Cannot bind uuid blob %s"), v14, v15, v16, v17, v18, v19, v13);
    v4 = 5;
  }
  else if (sqlite3_step(ppStmt) == 101)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0xFFFFFFFFLL;
  }
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v4;
}

uint64_t sub_10000FCE4(sqlite3 *a1)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Flagged = 1", -1, &ppStmt, 0))
  {
    v4 = sqlite3_errmsg(a1);
    sub_10001595C("db_flag_all", CFSTR("Failed to execute get statement: %s\n"), v5, v6, v7, v8, v9, v10, v4);
    v2 = 0xFFFFFFFFLL;
  }
  else if (sqlite3_step(ppStmt) == 101)
  {
    v2 = 0;
  }
  else
  {
    v2 = 0xFFFFFFFFLL;
  }
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v2;
}

uint64_t sub_10000FD70(sqlite3 *a1, const void *a2)
{
  uint64_t v4;
  const __CFString *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Key = NULL, Flagged = 0, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL AND Uuid = ?", -1, &ppStmt, 0))
  {
    v6 = CFSTR("Failed to execute get statement: %s\n");
  }
  else if (sqlite3_bind_blob(ppStmt, 1, a2, 16, 0))
  {
    v4 = 5;
    v6 = CFSTR("Cannot bind uuid blob %s");
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      v4 = 0;
      goto LABEL_5;
    }
    v4 = 6;
    v6 = CFSTR("step failed: %s");
  }
  v7 = sqlite3_errmsg(a1);
  sub_10001595C("db_clear_flagged_volume", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v4;
}

uint64_t sub_10000FE4C(sqlite3 *a1)
{
  uint64_t v2;
  const __CFString *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "UPDATE WrappedKeys SET Key = NULL, ClearTime = datetime('now', 'subsec') WHERE Flagged = 1 AND Key NOT NULL;",
         -1,
         &ppStmt,
         0))
  {
    v4 = CFSTR("Failed to execute get statement: %s\n");
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      v2 = 0;
      goto LABEL_4;
    }
    v2 = 6;
    v4 = CFSTR("step failed: %s");
  }
  v5 = sqlite3_errmsg(a1);
  sub_10001595C("db_clear_flagged", v4, v6, v7, v8, v9, v10, v11, v5);
LABEL_4:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v2;
}

uint64_t sub_10000FEF8(sqlite3 *a1, sqlite3_int64 a2)
{
  uint64_t v4;
  const __CFString *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v4 = 0xFFFFFFFFLL;
  if (sqlite3_prepare_v2(a1, "DELETE FROM WrappedKeys WHERE Flagged = 1 AND Key IS NULL AND unixepoch('now') - unixepoch(ClearTime) > ? ;",
         -1,
         &ppStmt,
         0))
  {
    v6 = CFSTR("Failed to prepare get statement: %s\n");
  }
  else if (sqlite3_bind_int64(ppStmt, 1, a2))
  {
    v6 = CFSTR("Cannot bind age: %s\n");
  }
  else
  {
    if (sqlite3_step(ppStmt) == 101)
    {
      v4 = 0;
      goto LABEL_5;
    }
    v4 = 6;
    v6 = CFSTR("step failed: %s");
  }
  v7 = sqlite3_errmsg(a1);
  sub_10001595C("db_delete_flagged_old", v6, v8, v9, v10, v11, v12, v13, v7);
LABEL_5:
  if (ppStmt)
    sqlite3_finalize(ppStmt);
  return v4;
}

uint64_t sub_10000FFC8(const char *a1, int a2, int a3)
{
  char v4;
  DIR *v5;
  DIR *v6;
  int v7;
  int v8;
  int v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = (char)a1;
  if (a3)
  {
    v5 = opendir(a1);
    if (v5)
    {
      v6 = v5;
      v7 = dirfd(v5);
      if (v7 == -1)
      {
        v10 = 1;
        goto LABEL_16;
      }
      v8 = v7;
LABEL_7:
      if (fcntl(v8, 63) == 3)
      {
        v10 = 1;
      }
      else
      {
        v11 = fcntl(v8, 64, 3);
        v10 = v11 == 0;
        if (v11 && a2)
        {
          __error();
          sub_10001595C("db_move_to_class_c", CFSTR("Failed to set class C on file:%s with error %d"), v12, v13, v14, v15, v16, v17, v4);
          v10 = 0;
        }
      }
      if (!v6)
      {
        close(v8);
        return v10;
      }
LABEL_16:
      closedir(v6);
      return v10;
    }
  }
  else
  {
    v9 = open(a1, 2);
    if (v9 != -1)
    {
      v8 = v9;
      v6 = 0;
      goto LABEL_7;
    }
  }
  return 1;
}

const void *sub_1000100C8(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_100010100(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

const void *sub_100010168(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    return 0;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 0;
  return v3;
}

BOOL sub_1000101A8(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  const __CFString *v6;

  v6 = (const __CFString *)sub_100010168(a1, a2);
  return v6 && CFStringGetCString(v6, a3, a4, 0x8000100u);
}

CFTypeRef sub_1000101F4(const void *a1)
{
  __CFWriteStream *v2;
  __CFWriteStream *v3;
  CFTypeRef v4;

  v2 = CFWriteStreamCreateWithAllocatedBuffers(kCFAllocatorDefault, kCFAllocatorDefault);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1)
      v4 = 0;
    else
      v4 = CFWriteStreamCopyProperty(v3, kCFStreamPropertyDataWritten);
    CFWriteStreamClose(v3);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef sub_100010298(UInt8 *bytes, CFIndex length)
{
  __CFReadStream *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFReadStream *v9;
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
  CFPropertyListRef v22;
  char v24;
  CFPropertyListFormat format;

  format = kCFPropertyListBinaryFormat_v1_0;
  v2 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
  if (v2)
  {
    v9 = v2;
    if (CFReadStreamOpen(v2))
    {
      v22 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0, 2uLL, &format, 0);
      if (!v22)
        sub_10001595C("convertBinaryToObject", CFSTR("Could not create object from stream"), v16, v17, v18, v19, v20, v21, v24);
      CFReadStreamClose(v9);
    }
    else
    {
      sub_10001595C("convertBinaryToObject", CFSTR("Could not open the stream"), v10, v11, v12, v13, v14, v15, v24);
      v22 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    sub_10001595C("convertBinaryToObject", CFSTR("Could not create stream for serialized data"), v3, v4, v5, v6, v7, v8, v24);
    return 0;
  }
  return v22;
}

size_t sub_100010380(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3;
  size_t v6;
  ssize_t v7;

  v3 = __nbyte;
  if (__nbyte)
  {
    v6 = __nbyte;
    do
    {
      v7 = write(__fd, __buf, v6);
      if (v7 == -1)
      {
        if (*__error() != 4)
          return -1;
        v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

uint64_t sub_1000103F8(const void *a1, const char *a2, int *a3)
{
  const __CFData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFData *v12;
  int v13;
  int v14;
  char *BytePtr;
  size_t Length;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;

  v5 = (const __CFData *)sub_1000101F4(a1);
  if (!v5)
  {
    sub_10001595C("store_binary_dict_fd", CFSTR("Can't serialize dictionary"), v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }
  v12 = v5;
  v13 = open_dprotected_np(a2, 1537, 4, 0, 420);
  if (v13 == -1)
  {
    v18 = __error();
    strerror(*v18);
    sub_10001595C("store_binary_dict_fd", CFSTR("Could not create %s: %s"), v19, v20, v21, v22, v23, v24, (char)a2);
    v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  Length = CFDataGetLength(v12);
  if (sub_100010380(v14, BytePtr, Length) == -1)
  {
    v25 = CFSTR("Could not write to %s: %s");
LABEL_12:
    v26 = __error();
    strerror(*v26);
    sub_10001595C("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (fcntl(v14, 51))
  {
    v25 = CFSTR("Unable to fsync %s: %s");
    goto LABEL_12;
  }
  v17 = 0;
  if (!a3)
  {
LABEL_13:
    CFRelease(v12);
    close(v14);
    return v17;
  }
  *a3 = v14;
LABEL_7:
  CFRelease(v12);
  return v17;
}

uint64_t sub_10001054C(const void *a1, const char *a2)
{
  return sub_1000103F8(a1, a2, 0);
}

const void *sub_100010554(UInt8 *bytes, CFIndex length)
{
  const void *v2;
  __CFReadStream *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFReadStream *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFPropertyListRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeID v25;
  char v27;
  CFPropertyListFormat format;

  v2 = 0;
  format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    v4 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, bytes, length, kCFAllocatorNull);
    if (!v4)
    {
      sub_10001595C("load_binary_dict_from_buffer", CFSTR("Could not create stream from serialized data"), v5, v6, v7, v8, v9, v10, v27);
      return 0;
    }
    v11 = v4;
    if (CFReadStreamOpen(v4))
    {
      v18 = CFPropertyListCreateWithStream(kCFAllocatorDefault, v11, length, 2uLL, &format, 0);
      v2 = v18;
      if (!v18)
      {
        sub_10001595C("load_binary_dict_from_buffer", CFSTR("Could not create dictionary from stream"), v19, v20, v21, v22, v23, v24, v27);
        goto LABEL_9;
      }
      v25 = CFGetTypeID(v18);
      if (v25 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v11);
        CFRelease(v11);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      sub_10001595C("load_binary_dict_from_buffer", CFSTR("Could not open the stream"), v12, v13, v14, v15, v16, v17, v27);
    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *sub_100010674(const char *a1)
{
  char v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ssize_t v11;
  const void *v12;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  int *v29;
  char v30;
  stat v31;

  v1 = (char)a1;
  memset(&v31, 0, sizeof(v31));
  v2 = open(a1, 0);
  if (v2 == -1)
  {
    v14 = __error();
    strerror(*v14);
    sub_10001595C("load_binary_dict", CFSTR("Could not open %s: %s"), v15, v16, v17, v18, v19, v20, v1);
    v10 = 0;
    v12 = 0;
    goto LABEL_7;
  }
  v3 = v2;
  if (fstat(v2, &v31))
  {
    v21 = __error();
    strerror(*v21);
    sub_10001595C("load_binary_dict", CFSTR("Could not fstat %s: %s"), v22, v23, v24, v25, v26, v27, v1);
    v12 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v10 = malloc_type_malloc(LODWORD(v31.st_size), 0x9026304CuLL);
  if (!v10)
  {
    v28 = CFSTR("Could not allocate buffer");
LABEL_12:
    sub_10001595C("load_binary_dict", v28, v4, v5, v6, v7, v8, v9, v30);
    v12 = 0;
    goto LABEL_6;
  }
  v11 = read(v3, v10, v31.st_size);
  if (v11 != v31.st_size)
  {
    v29 = __error();
    v30 = v1;
    strerror(*v29);
    v28 = CFSTR("Could not read %s: %s");
    goto LABEL_12;
  }
  v12 = sub_100010554((UInt8 *)v10, v11);
LABEL_6:
  close(v3);
LABEL_7:
  free(v10);
  return v12;
}

CFMutableDictionaryRef sub_1000107D0()
{
  CFMutableDictionaryRef result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  result = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result)
  {
    sub_10001595C("create_dict", CFSTR("Out of Memory!!! Dying!...so...cold...."), v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

uint64_t sub_100010824(uint32_t *a1)
{
  mach_port_t v2;
  uint64_t result;
  uint32_t multiuser_flags;

  multiuser_flags = 0;
  v2 = mach_host_self();
  result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result)
      *a1 = multiuser_flags;
  }
  return result;
}

uint64_t sub_100010868()
{
  int v0;
  uint32_t v1;
  int v3;

  v3 = 0;
  v0 = sub_100010824((uint32_t *)&v3);
  if (v3 >= 0)
    v1 = -1;
  else
    v1 = v3 & 0x3FFFFFFF;
  if (v0)
    return 0xFFFFFFFFLL;
  else
    return v1;
}

BOOL sub_1000108A4()
{
  int v2;

  v2 = 0;
  return !sub_100010824((uint32_t *)&v2) && v2 < 0;
}

uint64_t sub_1000108D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD v4[2];

  v1 = a1;
  if ((int)a1 > -536363001)
  {
    switch(a1)
    {
      case 0xE007C00E:
        return 4294967283;
      case 0xE007C00F:
      case 0xE007C010:
      case 0xE007C011:
      case 0xE007C012:
      case 0xE007C016:
      case 0xE007C017:
        goto LABEL_20;
      case 0xE007C013:
        return 4294967276;
      case 0xE007C014:
        return 0;
      case 0xE007C015:
        return 4294967282;
      case 0xE007C018:
        return 4294967277;
      default:
        if ((_DWORD)a1 == -536363000)
          return 4294967282;
        if (!(_DWORD)a1)
          return v1;
        break;
    }
    goto LABEL_20;
  }
  v2 = 4294967294;
  if ((int)a1 <= -536870195)
  {
    switch((_DWORD)a1)
    {
      case 0xE00002C1:
        return v2;
      case 0xE00002C2:
        return 4294967279;
      case 0xE00002C9:
        return 4294967287;
    }
LABEL_20:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unexpected AppleKeyStore error: %d\n", (uint8_t *)v4, 8u);
    }
    return 0xFFFFFFFFLL;
  }
  if ((int)a1 > -536870175)
  {
    if ((_DWORD)a1 == -536870174)
      return v2;
    if ((_DWORD)a1 == -536870160)
      return 4294967288;
    goto LABEL_20;
  }
  if ((_DWORD)a1 == -536870194)
    return 4294967293;
  if ((_DWORD)a1 != -536870184)
    goto LABEL_20;
  return 4294967283;
}

uint64_t sub_100010AB4(uint64_t result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = (_QWORD *)result;
    result = mach_absolute_time();
    *v1 = result;
  }
  return result;
}

double sub_100010ADC(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  double result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  mach_timebase_info info;

  v4 = mach_absolute_time();
  if (qword_1000358F0)
  {
    if (!a2)
      return result;
  }
  else
  {
    v6 = mach_absolute_time();
    qword_1000358F0 = mach_absolute_time() - v6;
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    result = (double)v7 / (double)v8;
    qword_1000358F8 = *(_QWORD *)&result;
    if (!a2)
      return result;
  }
  result = *(double *)&qword_1000358F8 * (double)(v4 - a1 - qword_1000358F0) / 1000.0;
  *a2 = (unint64_t)result;
  return result;
}

uint64_t sub_100010B98()
{
  uint64_t result;
  unsigned int v1;
  int v2;
  __int128 v3;
  uint64_t v4;

  v2 = -1;
  if (!qword_100035900)
  {
    v3 = off_10002CEA0;
    v4 = 0;
    qword_100035900 = _sl_dlopen(&v3, 0);
  }
  if (!qword_100035900)
    return 0;
  result = sub_100010C84();
  if (!result)
    return result;
  v1 = objc_msgSend(objc_msgSend((id)sub_100010C84(), "sharedConnection"), "unlockScreenTypeWithOutSimplePasscodeType:", &v2);
  if (v1 == 2)
    return 4;
  if (v1 == 1)
    return 3;
  if (v1)
    return 0;
  if (v2 == 1)
    return 2;
  return v2 == 0;
}

uint64_t sub_100010C84()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_100010E90;
  v7 = sub_100010EA0;
  v0 = qword_100035908;
  v8 = qword_100035908;
  if (!qword_100035908)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100010EAC;
    v2[3] = &unk_10002CBE8;
    v2[4] = &v3;
    sub_100010EAC((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100010D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010D48(_BYTE *a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  char v4;
  uint64_t result;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  void *(*v11)(uint64_t);
  void *v12;
  uint64_t *v13;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!qword_100035910)
  {
    v10 = off_10002CEB8;
    v11 = 0;
    qword_100035910 = _sl_dlopen(&v10, 0);
  }
  if (!qword_100035910)
    return 0xFFFFFFFFLL;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (uint64_t (*)(uint64_t))off_100035918;
  v9 = off_100035918;
  if (!off_100035918)
  {
    *(_QWORD *)&v10 = _NSConcreteStackBlock;
    *((_QWORD *)&v10 + 1) = 3221225472;
    v11 = sub_100010F88;
    v12 = &unk_10002CBE8;
    v13 = &v6;
    sub_100010F88((uint64_t)&v10);
    v2 = (uint64_t (*)(uint64_t))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
    sub_10001EA80();
  v4 = v2(v3);
  result = 0;
  *a1 = v4;
  return result;
}

void sub_100010E70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_100010E90(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100010EA0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class sub_100010EAC(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_100035900)
  {
    v4 = off_10002CEA0;
    v5 = 0;
    qword_100035900 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_100035900)
    sub_10001EAE4(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001EB48();
  qword_100035908 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void *sub_100010F88(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  __int128 v5;
  uint64_t v6;

  v4 = 0;
  if (!qword_100035910)
  {
    v5 = off_10002CEB8;
    v6 = 0;
    qword_100035910 = _sl_dlopen(&v5, &v4);
  }
  v2 = (void *)qword_100035910;
  if (!qword_100035910)
    sub_10001EBAC(&v4);
  if (v4)
    free(v4);
  result = dlsym(v2, "MAGetActivationState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_100035918 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFDictionary *sub_100011060(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DSEUN"));
  return result;
}

uint64_t sub_100011074(CFMutableDictionaryRef theDict, void *value)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (theDict)
  {
    if (value)
    {
      CFDictionarySetValue(theDict, CFSTR("_DSEUN"), value);
      return 0;
    }
  }
  return result;
}

const __CFDictionary *sub_1000110AC(const __CFDictionary *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DFAIL"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_100011118(__CFDictionary *a1, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_10001595C("HealthPlistSetFailed", CFSTR("unable to allocate"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, CFSTR("_DFAIL"), v3);
  return 0;
}

uint64_t sub_100011194(CFMutableDictionaryRef theDict, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFNumberRef v10;
  char v12;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!theDict)
    return 0xFFFFFFFFLL;
  if (a2 < 1)
  {
    CFDictionaryRemoveValue(theDict, CFSTR("_DTTR"));
    return 0;
  }
  v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_10001595C("HealthPlistSetTTR", CFSTR("unable to allocate"), v4, v5, v6, v7, v8, v9, v12);
    return 0xFFFFFFFFLL;
  }
  v10 = v3;
  CFDictionarySetValue(theDict, CFSTR("_DTTR"), v3);
  CFRelease(v10);
  return 0;
}

uint64_t sub_100011238(CFDictionaryRef theDict, _QWORD *a2)
{
  uint64_t result;
  const __CFNumber *Value;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t valuePtr;

  valuePtr = 0;
  result = 0xFFFFFFFFLL;
  if (theDict && a2)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("_DTTR"));
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      {
        CFDictionaryRemoveValue(theDict, CFSTR("_DTTR"));
        result = 0;
        *a2 = valuePtr;
        return result;
      }
      sub_10001595C("HealthPlistConsumeTTR", CFSTR("invalid ttr format"), v6, v7, v8, v9, v10, v11, v12);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_1000112CC(__CFDictionary *a1, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  int valuePtr;

  if (!a1)
    return 0xFFFFFFFFLL;
  valuePtr = a2;
  v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, CFSTR("_DVERS"), v3);
    return 0;
  }
  else
  {
    sub_10001595C("HealthPlistSetVersion", CFSTR("cant allocate mem"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

const __CFDictionary *sub_100011350(const __CFDictionary *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DTIME"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1000113BC(__CFDictionary *a1, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t valuePtr;

  if (!a1)
    return 0xFFFFFFFFLL;
  valuePtr = a2;
  v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, CFSTR("_DTIME"), v3);
    return 0;
  }
  else
  {
    sub_10001595C("HealthPlistSetTime", CFSTR("cant allocate mem"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

const __CFDictionary *sub_100011440(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DDATA"));
  return result;
}

uint64_t sub_100011454(const __CFDictionary *a1, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFNumberRef v10;
  __CFArray *Value;
  __CFArray *Mutable;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    sub_10001595C("HealthPlistAddToData", CFSTR("unable to allocate"), v4, v5, v6, v7, v8, v9, v20);
    return 0xFFFFFFFFLL;
  }
  v10 = v3;
  Value = (__CFArray *)CFDictionaryGetValue(a1, CFSTR("_DDATA"));
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }
  CFArrayAppendValue(Mutable, v10);
  if (CFArrayGetCount(Mutable) >= 15)
  {
    sub_10001595C("HealthPlistAddToData", CFSTR("at capacity, forgetting oldest data entry"), v13, v14, v15, v16, v17, v18, v20);
    CFArrayRemoveValueAtIndex(Mutable, 0);
  }
  CFDictionarySetValue(a1, CFSTR("_DDATA"), Mutable);
  CFRelease(v10);
  if (Mutable)
    CFRelease(Mutable);
  return 0;
}

const __CFDictionary *sub_100011568()
{
  const __CFDictionary *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *Mutable;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  CFTypeID v19;
  __CFArray *v20;
  CFMutableArrayRef MutableCopy;
  CFTypeID v22;
  CFIndex v23;
  const void *ValueAtIndex;
  CFTypeID v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  CFTypeID v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  CFTypeID v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  CFTypeID v39;
  char v40;
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
  const __CFString *v54;
  const __CFString *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  int valuePtr;

  v0 = (const __CFDictionary *)sub_100010674("/var/root/.mkb_seshat_health");
  if (v0)
  {
    Mutable = v0;
    valuePtr = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(v0, CFSTR("_DVERS"));
    if (!Value)
    {
      v54 = CFSTR("no version");
      goto LABEL_34;
    }
    v15 = Value;
    v16 = CFGetTypeID(Value);
    if (v16 == CFNumberGetTypeID())
    {
      v58 = 0;
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr != 7)
        {
          sub_10001595C("validate_health_plist", CFSTR("non-current version %d"), v9, v10, v11, v12, v13, v14, valuePtr);
          goto LABEL_28;
        }
        v17 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DTIME"));
        if (v17)
        {
          v18 = v17;
          v19 = CFGetTypeID(v17);
          if (v19 != CFNumberGetTypeID())
          {
            v54 = CFSTR("time stamp is of wrong type");
            goto LABEL_34;
          }
          if (!CFNumberGetValue(v18, kCFNumberLongType, &v58))
          {
            v54 = CFSTR("invalid timestamp");
            goto LABEL_34;
          }
        }
        v20 = (__CFArray *)CFDictionaryGetValue(Mutable, CFSTR("_DDATA"));
        MutableCopy = v20;
        if (!v20)
        {
LABEL_17:
          v26 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DFAIL"));
          if (!v26)
            goto LABEL_20;
          v27 = v26;
          v57 = 0;
          v28 = CFGetTypeID(v26);
          if (v28 != CFNumberGetTypeID())
          {
            v55 = CFSTR("fail indicator is of wrong type");
            goto LABEL_47;
          }
          if (!CFNumberGetValue(v27, kCFNumberLongType, &v57))
          {
            v55 = CFSTR("invalid fail indicator");
          }
          else
          {
LABEL_20:
            v35 = CFDictionaryGetValue(Mutable, CFSTR("_DSEUN"));
            if (v35 && (v36 = CFGetTypeID(v35), v36 != CFStringGetTypeID()))
            {
              v55 = CFSTR("build is of wrong type");
            }
            else
            {
              v37 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DTTR"));
              if (!v37)
                goto LABEL_25;
              v38 = v37;
              v39 = CFGetTypeID(v37);
              if (v39 == CFNumberGetTypeID())
              {
                if (CFNumberGetValue(v38, kCFNumberSInt64Type, &v58))
                {
LABEL_25:
                  v40 = 1;
                  if (!MutableCopy)
                    goto LABEL_27;
                  goto LABEL_26;
                }
                v55 = CFSTR("invalid ttr timestamp");
              }
              else
              {
                v55 = CFSTR("ttr time stamp is of wrong type");
              }
            }
          }
LABEL_47:
          sub_10001595C("validate_health_plist", v55, v29, v30, v31, v32, v33, v34, v56);
          v40 = 0;
          if (!MutableCopy)
          {
LABEL_27:
            if ((v40 & 1) != 0)
              goto LABEL_30;
            goto LABEL_28;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        v22 = CFGetTypeID(v20);
        if (v22 == CFArrayGetTypeID())
        {
          if (CFArrayGetCount(MutableCopy) >= 1)
          {
            v23 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v23);
              if (!ValueAtIndex)
                break;
              v25 = CFGetTypeID(ValueAtIndex);
              if (v25 != CFNumberGetTypeID())
                break;
              if (CFArrayGetCount(MutableCopy) <= ++v23)
                goto LABEL_16;
            }
            v54 = CFSTR("data inconsistent");
            goto LABEL_34;
          }
LABEL_16:
          MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, MutableCopy);
          CFDictionarySetValue(Mutable, CFSTR("_DDATA"), MutableCopy);
          goto LABEL_17;
        }
        v54 = CFSTR("data is of wrong type");
      }
      else
      {
        v54 = CFSTR("invalid version format");
      }
    }
    else
    {
      v54 = CFSTR("version is of wrong type");
    }
LABEL_34:
    sub_10001595C("validate_health_plist", v54, v9, v10, v11, v12, v13, v14, v56);
LABEL_28:
    CFRelease(Mutable);
  }
  sub_10001595C("HealthPlistCopyOrCreateNew", CFSTR("health plist doesnt exist or wrong version, creating new one"), v1, v2, v3, v4, v5, v6, v56);
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
  {
    sub_10001595C("HealthPlistCopyOrCreateNew", CFSTR("Can't create dict"), v41, v42, v43, v44, v45, v46, v56);
    return Mutable;
  }
LABEL_30:
  if (sub_1000112CC(Mutable, 7))
  {
    sub_10001595C("HealthPlistCopyOrCreateNew", CFSTR("cant set version"), v47, v48, v49, v50, v51, v52, v56);
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t sub_100011944(const void *a1)
{
  if (sub_10001054C(a1, "/var/root/.mkb_seshat_health"))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t sub_100011968(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *Mutable;
  const __CFArray *Value;
  const __CFArray *v13;
  CFTypeID v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  CFMutableArrayRef MutableCopy;
  __CFArray *v23;
  CFNumberRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFNumberRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFNumberRef v38;
  __CFArray *v39;
  __CFArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFNumberRef v47;
  CFNumberRef v48;
  io_registry_entry_t v49;
  CFTypeRef v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const __CFString *v73;
  const __CFString *v74;
  const __CFDictionary *v75;
  const __CFString *v76;
  char v77;
  int v78;
  uint64_t v79;
  uint64_t valuePtr;

  valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2)
    return 0xFFFFFFFFLL;
  v4 = sub_100011D28(theString1);
  v79 = v4;
  if (v4 == -1)
  {
    v73 = CFSTR("unsupported key");
LABEL_32:
    sub_10001595C("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }
  Mutable = sub_100011D8C();
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable)
    {
      v73 = CFSTR("Can't create dict");
      goto LABEL_32;
    }
  }
  Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("DATA"));
  if (Value)
  {
    v13 = Value;
    v14 = CFGetTypeID(Value);
    if (v14 != CFArrayGetTypeID())
    {
      v74 = CFSTR("wrong type");
      goto LABEL_45;
    }
    v21 = kCFAllocatorDefault;
    MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0, v13);
  }
  else
  {
    v21 = kCFAllocatorDefault;
    MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  }
  v23 = MutableCopy;
  if (!MutableCopy)
  {
    v74 = CFSTR("unable to allocate array");
LABEL_45:
    sub_10001595C("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    v75 = Mutable;
    goto LABEL_46;
  }
  v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    sub_10001595C("analytics_persist_event", CFSTR("unable to allocate"), v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }
  v31 = v24;
  v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    v39 = CFArrayCreateMutable(v21, 0, &kCFTypeArrayCallBacks);
    v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        sub_10001595C("analytics_persist_event", CFSTR("at capacity, discarding oldest data entry"), v41, v42, v43, v44, v45, v46, v77);
        CFArrayRemoveValueAtIndex(v23, 0);
      }
      CFDictionarySetValue(Mutable, CFSTR("DATA"), v23);
      v78 = 0;
      v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        v48 = v47;
        CFDictionarySetValue(Mutable, CFSTR("VERS"), v47);
        v49 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
        v50 = sub_1000101F4(Mutable);
        if (v50)
        {
          v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, CFSTR("mkb-reports"), v50))
          {
            sub_10001595C("SetPersistedReports", CFSTR("cant set"), v58, v59, v60, v61, v62, v63, v77);
            v64 = -1;
          }
          else
          {
            v64 = 0;
          }
          CFRelease(v57);
          if (!v49)
            goto LABEL_23;
        }
        else
        {
          sub_10001595C("SetPersistedReports", CFSTR("Can't serialize dictionary"), v51, v52, v53, v54, v55, v56, v77);
          v64 = -1;
          if (!v49)
            goto LABEL_23;
        }
        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          sub_10001595C("analytics_persist_event", CFSTR("failed to persist dict"), v65, v66, v67, v68, v69, v70, v77);
          v71 = 0xFFFFFFFFLL;
        }
        else
        {
          v71 = 0;
        }
        CFRelease(v48);
        CFRelease(Mutable);
        CFRelease(v31);
        goto LABEL_26;
      }
      v76 = CFSTR("cant allocate mem");
    }
    else
    {
      v76 = CFSTR("cant allocate");
    }
  }
  else
  {
    v40 = 0;
    v76 = CFSTR("unable to allocate");
  }
  sub_10001595C("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
  CFRelease(Mutable);
  CFRelease(v31);
  v71 = 0xFFFFFFFFLL;
  if (v38)
LABEL_26:
    CFRelease(v38);
  CFRelease(v23);
  if (v40)
    CFRelease(v40);
  return v71;
}

uint64_t sub_100011D28(CFStringRef theString1)
{
  uint64_t v2;
  CFStringRef *i;

  if (!theString1)
    return 0xFFFFFFFFLL;
  v2 = 0;
  for (i = (CFStringRef *)&off_100035788; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

const __CFDictionary *sub_100011D8C()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  UInt8 *BytePtr;
  CFIndex Length;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFTypeID v19;
  CFIndex v20;
  const void *ValueAtIndex;
  CFTypeID v22;
  CFIndex v23;
  char v24;
  char v25;
  const void *v26;
  CFTypeID v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  char v37;
  int valuePtr;

  v0 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("mkb-reports"), kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  Length = CFDataGetLength(v3);
  v6 = (const __CFDictionary *)sub_100010554(BytePtr, Length);
  v7 = v6;
  if (!v6)
    goto LABEL_24;
  Value = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("VERS"));
  if (!Value)
  {
    v28 = CFSTR("no version");
LABEL_22:
    sub_10001595C("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    sub_10001595C("CopyPersistedReports", CFSTR("invalid dict"), v29, v30, v31, v32, v33, v34, v37);
    v7 = 0;
    goto LABEL_24;
  }
  v15 = Value;
  v16 = CFGetTypeID(Value);
  if (v16 != CFNumberGetTypeID())
  {
    v28 = CFSTR("version is of wrong type");
    goto LABEL_22;
  }
  valuePtr = 0;
  if (!CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
  {
    v28 = CFSTR("invalid version format");
    goto LABEL_22;
  }
  if (valuePtr)
  {
    sub_10001595C("analytics_persistance_validate_dict", CFSTR("non-current version %d"), v9, v10, v11, v12, v13, v14, valuePtr);
    goto LABEL_23;
  }
  v17 = (const __CFArray *)CFDictionaryGetValue(v7, CFSTR("DATA"));
  if (!v17)
  {
    v28 = CFSTR("no data");
    goto LABEL_22;
  }
  v18 = v17;
  v19 = CFGetTypeID(v17);
  if (v19 != CFArrayGetTypeID())
  {
    v28 = CFSTR("data is of wrong type");
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) > 5)
  {
    v28 = CFSTR("too many entries");
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) >= 1)
  {
    v20 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v18, v20);
      v22 = CFGetTypeID(ValueAtIndex);
      if (v22 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount((CFArrayRef)ValueAtIndex) == 2)
        {
          v23 = 0;
          v24 = 1;
          do
          {
            v25 = v24;
            v26 = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v23);
            if (!v26 || (v27 = CFGetTypeID(v26), v27 != CFNumberGetTypeID()))
            {
              v36 = v23;
              v28 = CFSTR("sub%d is of wrong type");
              goto LABEL_22;
            }
            v24 = 0;
            v23 = 1;
          }
          while ((v25 & 1) != 0);
          if (CFArrayGetCount(v18) > ++v20)
            continue;
          break;
        }
        v28 = CFSTR("sub has unexpected number of data");
      }
      else
      {
        v28 = CFSTR("sub is of wrong type");
      }
      goto LABEL_22;
    }
  }
LABEL_24:
  IOObjectRelease(v1);
  CFRelease(v3);
  return v7;
}

uint64_t sub_10001206C(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFArray *Value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFArray *v11;
  CFIndex v12;
  const __CFArray *ValueAtIndex;
  const __CFNumber *v14;
  const __CFNumber *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t valuePtr;

  v20 = 0;
  valuePtr = 0;
  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = sub_100011D8C();
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  Value = (const __CFArray *)CFDictionaryGetValue(v2, CFSTR("DATA"));
  if (Value)
  {
    v11 = Value;
    if (CFArrayGetCount(Value) >= 1)
    {
      v12 = 0;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v11, v12);
        v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v14, kCFNumberSInt64Type, &v20);
        v15 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
        if (v20 <= 0xFFFFFFFE && (v20 & 0xFFFFFFFC) == 0)
        {
          v17 = *((_QWORD *)&off_100035788 + 2 * v20);
          if (v17)
            (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 16))(a1, v17, 1, 0, valuePtr);
        }
        ++v12;
      }
      while (CFArrayGetCount(v11) > v12);
    }
    v18 = 0;
  }
  else
  {
    sub_10001595C("analytics_iterate_persisted_eventsWithBlock", CFSTR("no data"), v5, v6, v7, v8, v9, v10, v20);
    v18 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v18;
}

uint64_t sub_1000121A8(uint64_t a1)
{
  io_registry_entry_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  kern_return_t v8;
  char v10;

  if (sub_10001206C(a1))
    return 0xFFFFFFFFLL;
  v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  v8 = IORegistryEntrySetCFProperty(v1, CFSTR("IONVRAM-DELETE-PROPERTY"), CFSTR("mkb-reports"));
  if (v8)
  {
    sub_10001595C("DeletePersistedReports", CFSTR("cant delete"), v2, v3, v4, v5, v6, v7, v10);
    if (!v1)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v1)
LABEL_4:
    IOObjectRelease(v1);
LABEL_5:
  if (!v8)
    return 0;
  sub_10001595C("analytics_submit_persisted_eventsWithBlock", CFSTR("cant delete"), v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10001224C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v8 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  if (a1)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000;
    v11[2] = sub_100012304;
    v11[3] = &unk_10002CED8;
    v11[4] = &v12;
    v11[5] = a1;
    sub_10001206C((uint64_t)v11);
  }
  sub_10001595C("analytics_is_event_persisted", CFSTR("event %@ is already persisted: %d"), a3, a4, a5, a6, a7, a8, v8);
  v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t sub_100012304(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t sub_100012340()
{
  return sub_1000121A8((uint64_t)&stru_10002CF18);
}

int sub_10001234C(id a1, __CFString *a2, BOOL a3, int a4, int64_t a5)
{
  _BOOL4 v6;
  char CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  v6 = a3;
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  sub_10001595C("analytics_submit_persisted_events_block_invoke", CFSTR("persisted-report-submit %s:%llx"), v9, v10, v11, v12, v13, v14, CStringPtr);
  v15 = sub_100011D28(a2);
  if (v15 <= 3)
    (*((void (**)(int64_t))&off_100035788 + 2 * v15 + 1))(a5);
  return sub_100014084((uint64_t)a2, v6, 0, a5);
}

void sub_1000123E0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  unint64_t v9;

  v9 = a1;
  sub_100012FAC(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  sub_100013500(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  sub_100013630(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_10001244C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  sub_100013F48(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void sub_100012470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD v9[5];

  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_1000124E8;
    v9[3] = &unk_10002CF38;
    v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.nfcd.hw.state", v9);
  }
  else
  {
    sub_10001595C("analytics_send_nfc_hardware_state", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_1000124E8(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "timedout", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "duration", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "state", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  return v2;
}

void sub_100012560(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_passcode_status", CFSTR("AnalyticsEvent: is_set: %llu, type: %llu, activation_status: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100012614;
    v16[3] = &unk_10002CF58;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.passcode.status", v16);
  }
  else
  {
    sub_10001595C("analytics_send_passcode_status", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100012614(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "is_set", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "type", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "activation_status", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  return v2;
}

void sub_10001268C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_seshat_debug", CFSTR("AnalyticsEvent: debug: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100012738;
    v16[3] = &unk_10002CF78;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.debug", v16);
  }
  else
  {
    sub_10001595C("analytics_send_seshat_debug", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100012738(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "debug", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100012780(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v10;
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
  const __CFString *v25;
  _QWORD v26[5];

  v10 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  sub_10001595C("analytics_send_seshat_enroll", CFSTR("AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu"), a3, a4, a5, a6, a7, a8, v10 & 1);
  if (sub_10001D6B4(v11, v12, v13, v14, v15, v16, v17, v18))
  {
    if (&_analytics_send_event_lazy)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 0x40000000;
      v26[2] = sub_10001288C;
      v26[3] = &unk_10002CF98;
      v26[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.enroll", v26);
      return;
    }
    v25 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v25 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_enroll", v25, v19, v20, v21, v22, v23, v24, a9);
}

xpc_object_t sub_10001288C(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void sub_1000129D4(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v10;
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
  const __CFString *v25;
  _QWORD v26[5];

  v10 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  sub_10001595C("analytics_send_seshat_unenroll", CFSTR("AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu"), a3, a4, a5, a6, a7, a8, v10 & 1);
  if (sub_10001D6B4(v11, v12, v13, v14, v15, v16, v17, v18))
  {
    if (&_analytics_send_event_lazy)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 0x40000000;
      v26[2] = sub_100012AE0;
      v26[3] = &unk_10002CFB8;
      v26[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.unenroll", v26);
      return;
    }
    v25 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v25 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_unenroll", v25, v19, v20, v21, v22, v23, v24, a9);
}

xpc_object_t sub_100012AE0(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void sub_100012C28(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  sub_10001595C("analytics_send_seshat_eol", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_100012CF4;
      v25[3] = &unk_10002CFD8;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.unexpected_eol", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_eol", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_100012CF4(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_BYTE **)(a1 + 32) & 1);
  return v2;
}

void sub_100012D40(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  int v11;
  unsigned int v12;
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
  const __CFString *v27;
  _QWORD v28[5];

  v10 = *((unsigned __int16 *)a1 + 2);
  v11 = v10 | (*((unsigned __int8 *)a1 + 6) << 16);
  v12 = *a1;
  *((_WORD *)a1 + 2) = v10;
  *((_BYTE *)a1 + 6) = BYTE2(v11);
  *a1 = v12 & 0xFFFFFF1F | 0x60;
  sub_10001595C("analytics_send_preflight_result", CFSTR("AnalyticsEvent: reason: %llu, version: %llu, nf_result: %llu, applet_result: %llu, num_fails: %llu, num_preflights: %llu, failed: %llu, calling_ctx: %llu, jcop_seq_gen: %llu, jcop_seq_gen2: %llu"), a3, a4, a5, a6, a7, a8, v12 & 0x1F);
  if (sub_10001D6B4(v13, v14, v15, v16, v17, v18, v19, v20))
  {
    if (&_analytics_send_event_lazy)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 0x40000000;
      v28[2] = sub_100012E74;
      v28[3] = &unk_10002CFF8;
      v28[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.preflight.fail", v28);
      return;
    }
    v27 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v27 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_preflight_result", v27, v21, v22, v23, v24, v25, v26, a9);
}

xpc_object_t sub_100012E74(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "reason", **(_DWORD **)(a1 + 32) & 0x1FLL);
  xpc_dictionary_set_uint64(v2, "version", **(_DWORD **)(a1 + 32) >> 5);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 2));
  xpc_dictionary_set_uint64(v2, "num_fails", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "num_preflights", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "failed", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 6) & 1);
  xpc_dictionary_set_uint64(v2, "calling_ctx", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 1) & 3);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 3) & 1);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen2", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 4) & 1);
  return v2;
}

void sub_100012FAC(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  *a1 = *a1 & 0xFFFFFFFFFFFFFFF8 | 5;
  sub_10001595C("analytics_send_seshat_recovery_required", CFSTR("AnalyticsEvent: version: %llu, context: %llu, timedout: %llu, padding: %llu, nf_result: %llu, applet_result: %llu, reason: %llu"), a3, a4, a5, a6, a7, a8, 5);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_1000130A8;
      v25[3] = &unk_10002D018;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.recovery_required", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_recovery_required", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_1000130A8(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_QWORD **)(a1 + 32) & 7);
  xpc_dictionary_set_uint64(v2, "context", (**(_QWORD **)(a1 + 32) >> 3) & 7);
  xpc_dictionary_set_uint64(v2, "timedout", (**(_QWORD **)(a1 + 32) >> 6) & 1);
  xpc_dictionary_set_uint64(v2, "padding", (**(_QWORD **)(a1 + 32) >> 7) & 1);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "reason", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 7));
  return v2;
}

void sub_100013190(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  sub_10001595C("analytics_send_seshat_recovery_success", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_10001325C;
      v25[3] = &unk_10002D038;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.recovery_success", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_recovery_success", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_10001325C(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_BYTE **)(a1 + 32) & 1);
  return v2;
}

void sub_1000132A8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  sub_10001595C("analytics_send_seshat_unexpected_sentinel", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_100013370;
      v25[3] = &unk_10002D058;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.unexpected_sentinel", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_unexpected_sentinel", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_100013370(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_1000133B8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  unint64_t v24;
  const __CFString *v25;
  _QWORD v26[5];

  sub_10001595C("analytics_send_seshat_write_count", CFSTR("AnalyticsEvent: writes: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    HIDWORD(v24) = -858993459 * arc4random();
    LODWORD(v24) = HIDWORD(v24);
    if ((v24 >> 1) >= 0x1999999A)
    {
      v25 = CFSTR("sampling condition not sastisifed");
    }
    else
    {
      if (&_analytics_send_event_lazy)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 0x40000000;
        v26[2] = sub_1000134B8;
        v26[3] = &unk_10002D078;
        v26[4] = a1;
        analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.write_count", v26);
        return;
      }
      v25 = CFSTR("CA fwk missing, not sending event");
    }
  }
  else
  {
    v25 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_write_count", v25, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_1000134B8(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "writes", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013500(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  sub_10001595C("analytics_send_seshat_report", CFSTR("AnalyticsEvent: key: %llu, value: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_1000135D0;
      v25[3] = &unk_10002D098;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.seshat.report", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_seshat_report", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_1000135D0(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "key", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "value", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  return v2;
}

void sub_100013630(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  *a1 = *a1 & 0xFFF0 | 1;
  sub_10001595C("analytics_send_sidp_recovery", CFSTR("AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu"), a3, a4, a5, a6, a7, a8, 1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100013714;
    v16[3] = &unk_10002D0B8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.sidp.recovery", v16);
  }
  else
  {
    sub_10001595C("analytics_send_sidp_recovery", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100013714(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_WORD **)(a1 + 32) & 0xFLL);
  xpc_dictionary_set_uint64(v2, "type", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 4) & 3);
  xpc_dictionary_set_uint64(v2, "event", **(_WORD **)(a1 + 32) >> 6);
  xpc_dictionary_set_uint64(v2, "recoverable", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 8) & 1);
  xpc_dictionary_set_uint64(v2, "recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 9) & 1);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "se_recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  return v2;
}

void sub_100013824(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const __CFString *v24;
  _QWORD v25[5];

  *a1 &= 0xE0u;
  sub_10001595C("analytics_send_first_unlock", CFSTR("AnalyticsEvent: version: %llu, se_entangled: %llu, smdk_entalgned: %llu"), a3, a4, a5, a6, a7, a8, 0);
  if (sub_10001D6B4(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (&_analytics_send_event_lazy)
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 0x40000000;
      v25[2] = sub_100013900;
      v25[3] = &unk_10002D0D8;
      v25[4] = a1;
      analytics_send_event_lazy("com.apple.mobile.keybagd.first_unlock", v25);
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  sub_10001595C("analytics_send_first_unlock", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t sub_100013900(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_BYTE **)(a1 + 32) & 0x1F);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 5) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 6) & 1);
  return v2;
}

void sub_100013984(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_db_filekey_found", CFSTR("AnalyticsEvent: filekey_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100013A30;
    v16[3] = &unk_10002D0F8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.filekey.found", v16);
  }
  else
  {
    sub_10001595C("analytics_send_db_filekey_found", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100013A30(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013A78(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_db_filekey_not_found", CFSTR("AnalyticsEvent: filekey_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100013B24;
    v16[3] = &unk_10002D118;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.filekey.not_found", v16);
  }
  else
  {
    sub_10001595C("analytics_send_db_filekey_not_found", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100013B24(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013B6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD v9[5];

  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_100013BE4;
    v9[3] = &unk_10002D138;
    v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.add", v9);
  }
  else
  {
    sub_10001595C("analytics_send_db_add", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100013BE4(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD v9[5];

  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_100013CA4;
    v9[3] = &unk_10002D158;
    v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.db.get", v9);
  }
  else
  {
    sub_10001595C("analytics_send_db_get", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100013CA4(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013CEC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_passphrase_change", CFSTR("AnalyticsEvent: change_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100013D98;
    v16[3] = &unk_10002D178;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.phrasechange", v16);
  }
  else
  {
    sub_10001595C("analytics_send_passphrase_change", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100013D98(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "change_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void sub_100013DE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  _QWORD v9[5];

  if (&_analytics_send_event_lazy)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 0x40000000;
    v9[2] = sub_100013E58;
    v9[3] = &unk_10002D198;
    v9[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.backup.drain", v9);
  }
  else
  {
    sub_10001595C("analytics_send_backup_key_drain", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
  }
}

xpc_object_t sub_100013E58(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fault", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "first_unlocked", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "add_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "open_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 20));
  xpc_dictionary_set_uint64(v2, "sqlite_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "truncated", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28));
  xpc_dictionary_set_BOOL(v2, "unlinked", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 29));
  return v2;
}

void sub_100013F48(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];

  sub_10001595C("analytics_send_forgotten_passcode_event", CFSTR("AnalyticsEvent: days_since_passcode_change: %llu, passcode_reset_expired: %llu, passcode_reset_exists: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (&_analytics_send_event_lazy)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000;
    v16[2] = sub_100014004;
    v16[3] = &unk_10002D1B8;
    v16[4] = a1;
    analytics_send_event_lazy("com.apple.mobile.keybagd.forgotten_passcode", v16);
  }
  else
  {
    sub_10001595C("analytics_send_forgotten_passcode_event", CFSTR("CA fwk missing, not sending event"), v10, v11, v12, v13, v14, v15, a9);
  }
}

xpc_object_t sub_100014004(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 4) & 1);
  xpc_dictionary_set_uint64(v2, "passcode_reset_exists", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4) >> 1) & 1);
  return v2;
}

uint64_t sub_100014084(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  BOOL v4;

  if (&_ADClientAddValueForScalarKey)
    v4 = &_ADClientSetValueForScalarKey == 0;
  else
    v4 = 1;
  if (v4 || a1 == 0)
    return 0xFFFFFFFFLL;
  if (a3 && arc4random() % a3)
    return 0xFFFFFFFFLL;
  if (a2)
    ADClientSetValueForScalarKey(a1, a4);
  else
    ADClientAddValueForScalarKey(a1, a4);
  return 0;
}

uint64_t sub_100014114(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  uint64_t system;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFDictionary *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFData *Value;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const __CFData *v52;
  const UInt8 *BytePtr;
  CFIndex Length;
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
  __CFDictionary *v68;
  CFNumberRef v69;
  CFNumberRef v70;
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
  char v101;
  char v102;
  uint64_t valuePtr;
  unsigned int v104;
  unsigned int v105;

  v104 = -1;
  v105 = -1;
  system = aks_get_system(a2, &v105);
  if ((_DWORD)system == -536870160)
  {
    if (a7)
    {
      sub_10001595C("loadKeybagForUserSession", CFSTR("From EARLYSTART skip check switch between users"), v15, v16, v17, v18, v19, v20, v101);
    }
    else if (sub_100010868() == (_DWORD)a2)
    {
      sub_10001595C("loadKeybagForUserSession", CFSTR("LOADING FOREGROUND USER, SKIP loading Keybag and head to Unlock"), v23, v24, v25, v26, v27, v28, v101);
      v22 = 0;
      v21 = 3758097136;
      goto LABEL_9;
    }
    v38 = sub_100004A70(a2);
    if (!v38)
    {
      sub_10001595C("loadKeybagForUserSession", CFSTR("no user bag found for UID %d"), v39, v40, v41, v42, v43, v44, a2);
      v21 = 4294967288;
      goto LABEL_42;
    }
    v22 = v38;
    Value = (const __CFData *)CFDictionaryGetValue(v38, CFSTR("KeyBagKeys"));
    if (Value)
    {
      v52 = Value;
      BytePtr = CFDataGetBytePtr(Value);
      Length = CFDataGetLength(v52);
      v55 = aks_load_bag(BytePtr, Length, &v104);
      if ((_DWORD)v55)
      {
        v21 = v55;
        sub_10001595C("loadKeybagForUserSession", CFSTR("failed to load bag for user %d: 0x%x"), v56, v57, v58, v59, v60, v61, a2);
      }
      else
      {
        v77 = aks_set_system(v104, a2);
        if ((_DWORD)v77)
        {
          v21 = v77;
          sub_10001595C("loadKeybagForUserSession", CFSTR("failed to set bag handle %d as session bag for UID %d: 0x%x"), v78, v79, v80, v81, v82, v83, v104);
        }
        else
        {
          if ((_DWORD)a2 != 502)
          {
            sub_10001595C("loadKeybagForUserSession", CFSTR("seting APFSVolumeID For KeyBag"), v78, v79, v80, v81, v82, v83, v101);
            sub_100014528(v104, a2, a1, 0, v90, v91, v92, v93, v102);
          }
          v21 = aks_get_system(a2, &v105);
          if (!(_DWORD)v21)
            goto LABEL_9;
          sub_10001595C("loadKeybagForUserSession", CFSTR("loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x"), v94, v95, v96, v97, v98, v99, v104);
        }
      }
      v21 = sub_1000108D8(v21);
    }
    else
    {
      sub_10001595C("loadKeybagForUserSession", CFSTR("no keybag in user bag plist"), v46, v47, v48, v49, v50, v51, v101);
      v21 = 4294966296;
    }
LABEL_41:
    CFRelease(v22);
    goto LABEL_42;
  }
  v21 = system;
  if ((_DWORD)system)
  {
    v21 = sub_1000108D8(system);
    goto LABEL_42;
  }
  v22 = 0;
LABEL_9:
  if (a3)
  {
    v29 = +[MKBDeviceLockModelEducationalMode sharedLockModelWithUID:](MKBDeviceLockModelEducationalMode, "sharedLockModelWithUID:", a2);
    objc_msgSend(v29, "notePasscodeEntryBegan");
    v30 = aks_unlock_device(v105, a3, a4);
    if ((_DWORD)v30)
    {
      v37 = v30;
      sub_10001595C("loadKeybagForUserSession", CFSTR("failed to unlock session bag handle %ld: 0x%x"), v31, v32, v33, v34, v35, v36, v105);
      v21 = sub_1000108D8(v37);
      objc_msgSend(v29, "notePasscodeUnlockFailed");
      if ((objc_msgSend(v29, "isWipePending") & 1) != 0)
      {
        v21 = 4294967281;
      }
      else if ((objc_msgSend(v29, "isTemporarilyBlocked") & 1) != 0
             || objc_msgSend(v29, "isPermanentlyBlocked"))
      {
        v21 = 4294967282;
      }
    }
    else
    {
      objc_msgSend(v29, "notePasscodeUnlockSucceeded");
      if (a5)
      {
        sub_10001595C("loadKeybagForUserSession", CFSTR("TRYING TO UPDATE GRACE PERIOD FOR USER:%d with %d secs"), v62, v63, v64, v65, v66, v67, a2);
        v68 = sub_1000107D0();
        valuePtr = a6;
        v69 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        if (v69)
        {
          v70 = v69;
          CFDictionarySetValue(v68, kAKSConfigGracePeriod, v69);
          CFRelease(v70);
        }
        v21 = aks_set_configuration(v105, a3, a4, v68);
        if (v68)
          CFRelease(v68);
        if ((_DWORD)v21)
        {
          sub_10001595C("loadKeybagForUserSession", CFSTR("FAILED TO AKS update Graceperiod of %d secs FOR USER:%d with error:%d"), v71, v72, v73, v74, v75, v76, a6);
        }
        else
        {
          sub_10001595C("loadKeybagForUserSession", CFSTR("SUCCESSFUL AKS update of Graceperiod FOR USER:%d with %d secs"), v71, v72, v73, v74, v75, v76, a2);
          v21 = sub_100005878(v105, a2, 0, 0);
          if ((_DWORD)v21)
            sub_10001595C("loadKeybagForUserSession", CFSTR("FAILED to save Keybag FOR USER:%d with Graceperiod of %d secs"), v84, v85, v86, v87, v88, v89, a2);
          else
            sub_10001595C("loadKeybagForUserSession", CFSTR("SUCCESSFUL  saving of Keybag FOR USER:%d with Graceperiod of %d secs"), v84, v85, v86, v87, v88, v89, a2);
        }
      }
      else
      {
        v21 = 0;
      }
    }
  }
  if (v22)
    goto LABEL_41;
LABEL_42:
  if (v104 != -1)
    aks_unload_bag(v104);
  return v21;
}

void sub_100014528(uint64_t a1, uint64_t a2, const __CFDictionary *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
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
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  char v34;
  uuid_t uu;
  char in[1024];
  _BYTE v37[5];
  _BYTE v38[3];
  _OWORD v39[16];

  bzero(v38, 0x3FBuLL);
  qmemcpy(v37, "/dev/", sizeof(v37));
  if (!a3)
  {
    v33 = CFSTR("PASSED in NULL Session");
LABEL_12:
    sub_10001595C("setAPFSVolumeIDForKeyBag", v33, v13, v14, v15, v16, v17, v18, a9);
    return;
  }
  memset(v39, 0, sizeof(v39));
  sub_10001595C("setAPFSVolumeIDForKeyBag", CFSTR("Passed in session is %@"), v13, v14, v15, v16, v17, v18, (char)a3);
  if (!CFDictionaryContainsKey(a3, kMKBUserSessionVolumeDeviceNodeKey))
  {
    v33 = CFSTR("NO device node key to map.., returning");
    goto LABEL_12;
  }
  sub_1000101A8(a3, kMKBUserSessionVolumeDeviceNodeKey, (char *)v39, 256);
  if (LODWORD(v39[0]) != 1802725732)
  {
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  __strlcat_chk(v37, v39, 1024, 1024);
  if (a4)
LABEL_5:
    sub_100008484(a1, (uint64_t)v37, 0, 0, 0, 0);
LABEL_6:
  if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
  {
    v25 = sub_100010168(a3, kMKBUserSessionVolumeUUIDKey);
    if (!v25)
      return;
    memset(uu, 0, sizeof(uu));
    sub_10001595C("setAPFSVolumeIDForKeyBag", CFSTR("Updating VolumeUUID %@"), v26, v27, v28, v29, v30, v31, (char)v25);
    bzero(in, 0x400uLL);
    sub_1000101A8(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
    if (!uuid_parse(in, uu))
    {
      sub_10001595C("setAPFSVolumeIDForKeyBag", CFSTR("uuid_parse SUCCESS"), v19, v20, v21, v22, v23, v24, v34);
      sub_100008610(a1, a2, (uint64_t)v37, (uint64_t)uu, 0, 0);
      return;
    }
    v32 = CFSTR("uuid_parse failed");
  }
  else
  {
    v32 = CFSTR("No VolumeUUID key present in the session");
  }
  sub_10001595C("setAPFSVolumeIDForKeyBag", v32, v19, v20, v21, v22, v23, v24, v34);
}

uint64_t sub_1000147D0(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, const void *a6)
{
  CFMutableDictionaryRef v12;
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
  __CFDictionary *v28;
  CFNumberRef v29;
  CFNumberRef v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  char v63;
  char v64;
  uint64_t valuePtr;
  unsigned int v66;

  v66 = -1;
  v12 = sub_100004A70(a2);
  if (v12)
  {
    CFRelease(v12);
    return 0;
  }
  else
  {
    v14 = aks_create_bag(a3, a4, 0, &v66);
    if ((_DWORD)v14)
    {
      v21 = v14;
      sub_10001595C("createKeybagForUserSession", CFSTR("Failed to create bag with aks error:0x%x"), v15, v16, v17, v18, v19, v20, v14);
      v13 = sub_1000108D8(v21);
    }
    else
    {
      sub_10001595C("createKeybagForUserSession", CFSTR("Created keybag for uid:%d"), v15, v16, v17, v18, v19, v20, a2);
      if (a5 >= 1)
      {
        sub_10001595C("createKeybagForUserSession", CFSTR("TRYING TO SET GRACE PERIOD FOR USER with %d secs"), v22, v23, v24, v25, v26, v27, a5);
        v28 = sub_1000107D0();
        valuePtr = a5;
        v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
        if (v29)
        {
          v30 = v29;
          CFDictionarySetValue(v28, kAKSConfigGracePeriod, v29);
          CFRelease(v30);
        }
        v37 = aks_set_configuration(v66, a3, a4, v28);
        if (v28)
          CFRelease(v28);
        if (v37)
          sub_10001595C("createKeybagForUserSession", CFSTR("FAILED TO SET  Graceperiod of %d secs with error:%d"), v31, v32, v33, v34, v35, v36, a5);
        else
          sub_10001595C("createKeybagForUserSession", CFSTR("SUCCESSFUL Setting of Graceperiod of %d secs"), v31, v32, v33, v34, v35, v36, a5);
      }
      sub_10001595C("createKeybagForUserSession", CFSTR("Saving keybag for uid:%d"), v22, v23, v24, v25, v26, v27, a2);
      v13 = sub_100005878(v66, a2, a6, 0);
      if (!(_DWORD)v13)
      {
        sub_10001595C("createKeybagForUserSession", CFSTR("Setting it to  System for user:%d"), v38, v39, v40, v41, v42, v43, a2);
        v45 = aks_set_system_with_passcode(v66, a2, a3, a4);
        if ((_DWORD)v45)
        {
          v52 = v45;
          sub_10001595C("createKeybagForUserSession", CFSTR("Failed to setsystem for the bag with aks error:0x%x"), v46, v47, v48, v49, v50, v51, v45);
          v13 = sub_1000108D8(v52);
          if (sub_100005878(0xFFFFFFFFLL, a2, 0, 0))
            sub_10001595C("createKeybagForUserSession", CFSTR("Failed to remove user bag for session %d: %d"), v53, v54, v55, v56, v57, v58, a2);
        }
        else
        {
          if ((_DWORD)a2 != 502)
          {
            sub_10001595C("createKeybagForUserSession", CFSTR("seting APFSVolumeID For KeyBag "), v46, v47, v48, v49, v50, v51, v63);
            sub_100014528(v66, a2, a1, 1, v59, v60, v61, v62, v64);
          }
          v13 = 0;
        }
      }
    }
    if (v66 != -1)
      aks_unload_bag(v66);
  }
  return v13;
}

uint64_t sub_100014A78(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  sub_10001595C("setupKeybagForPersona", CFSTR("CAlling KBMapDeviceBag with volume %s"), a3, (uint64_t)a4, a5, a6, a7, a8, (char)a4);
  v10 = sub_100008888(a4, 1, a5);
  v17 = v10;
  if ((_DWORD)v10)
    sub_10001595C("setupKeybagForPersona", CFSTR("KBMapDeviceBag failed with error %d"), v11, v12, v13, v14, v15, v16, v10);
  else
    sub_10001595C("setupKeybagForPersona", CFSTR("KBMapDeviceBag Success"), v11, v12, v13, v14, v15, v16, v19);
  return v17;
}

uint64_t sub_100014B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  char v23;
  unsigned int v24;

  v24 = -1;
  sub_10001595C("unloadUserSessionUserBag", CFSTR("Unloading UserKeyBag for User:%d"), a3, a4, a5, a6, a7, a8, a1);
  if (aks_get_system(a1, &v24))
  {
    sub_10001595C("unloadUserSessionUserBag", CFSTR("no Userbag found for UID %d with error:0x%x"), v9, v10, v11, v12, v13, v14, a1);
    return 0;
  }
  else
  {
    sub_10001595C("unloadUserSessionUserBag", CFSTR("Found loaded SyncBag and unloading the bag"), v9, v10, v11, v12, v13, v14, v23);
    v15 = aks_unload_bag(v24);
    if ((_DWORD)v15)
      sub_10001595C("unloadUserSessionUserBag", CFSTR("failed to unload SyncBag for UID:%d with error:0x%x"), v16, v17, v18, v19, v20, v21, a1);
    else
      sub_10001595C("unloadUserSessionUserBag", CFSTR("Unloaded of SyncBag for UID:%d , Successful"), v16, v17, v18, v19, v20, v21, a1);
  }
  return v15;
}

uint64_t sub_100014BCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t system;
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
  CFDataRef v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  CFDataRef v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __CFDictionary *v47;
  CFStringRef v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  char v64;
  stat v65;
  int v66;
  const UInt8 *v67;
  unsigned int v68;
  unsigned int v69;

  v68 = -1;
  v69 = -1;
  v67 = 0;
  v66 = 0;
  sub_10001595C("createSyncBagForSyncBubble", CFSTR("Creating a new SyncBag for User %d"), a3, a4, a5, a6, a7, a8, a2);
  system = aks_get_system(a2, &v68);
  if ((_DWORD)system)
  {
    v16 = system;
    sub_10001595C("createSyncBagForSyncBubble", CFSTR("Unable to find user session_handle for user %d with error:0x%x"), v10, v11, v12, v13, v14, v15, a2);
LABEL_7:
    v31 = sub_1000108D8(v16);
    goto LABEL_8;
  }
  v17 = aks_create_sync_bag(0, 0, v68, &v69);
  if ((_DWORD)v17)
  {
    v16 = v17;
    sub_10001595C("createSyncBagForSyncBubble", CFSTR("failed to create SyncBag for uid %d: with error: 0x%x"), v18, v19, v20, v21, v22, v23, a2);
    goto LABEL_7;
  }
  sub_10001595C("createSyncBagForSyncBubble", CFSTR("Saving content in usersyncbag for User %d"), v18, v19, v20, v21, v22, v23, a2);
  v24 = aks_save_bag(v69, &v67, &v66);
  if ((_DWORD)v24)
  {
    v16 = v24;
    sub_10001595C("createSyncBagForSyncBubble", CFSTR("failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x"), v25, v26, v27, v28, v29, v30, a2);
    goto LABEL_7;
  }
  v33 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v67, v66, kCFAllocatorDefault);
  if (!v33)
  {
    sub_10001595C("createSyncBagForSyncBubble", CFSTR("failed to retrive SyncBag content from keybag for uid %d: with error: 0x%x"), v34, v35, v36, v37, v38, v39, a2);
    v16 = 5;
    goto LABEL_7;
  }
  v40 = v33;
  memset(&v65, 0, sizeof(v65));
  if (stat("/private/var//keybags/usersyncbag.kb", &v65)
    || (sub_10001595C("createSyncBagForSyncBubble", CFSTR("Existing SyncBag needs update"), v41, v42, v43, v44, v45, v46, v62), (v47 = (__CFDictionary *)sub_100010674("/private/var//keybags/usersyncbag.kb")) == 0))
  {
    v47 = sub_1000107D0();
  }
  v48 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a2);
  if (CFDictionaryContainsKey(v47, v48))
    CFDictionaryReplaceValue(v47, v48, v40);
  else
    CFDictionaryAddValue(v47, v48, v40);
  if (sub_10001054C(v47, "/private/var//keybags/usersyncbag.kb"))
    v55 = CFSTR("Failed to save UserSyncBag");
  else
    v55 = CFSTR("Saved UserSyncBag");
  sub_10001595C("createSyncBagForSyncBubble", v55, v49, v50, v51, v52, v53, v54, v63);
  sub_10001595C("createSyncBagForSyncBubble", CFSTR("SyncBag Creation completed"), v56, v57, v58, v59, v60, v61, v64);
  CFRelease(v40);
  if (v48)
    CFRelease(v48);
  if (v47)
    CFRelease(v47);
  v31 = 0;
LABEL_8:
  if (v69 != -1)
    aks_unload_bag(v69);
  return v31;
}

uint64_t sub_100014E58(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t system;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFDictionary *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFDictionary *v33;
  CFStringRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const __CFData *Value;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFData *v48;
  const UInt8 *BytePtr;
  CFIndex Length;
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
  const __CFString *v63;
  char v65;
  char v66;
  unsigned int v67;

  v67 = -1;
  sub_10001595C("loadSyncBagForSyncBubble", CFSTR("Loading SyncBag for the User:%d"), a3, a4, a5, a6, a7, a8, a2);
  v10 = sub_100014114(a1, a2, 0, 0, 0, 0, 0);
  if (!(_DWORD)v10)
  {
    sub_10001595C("loadSyncBagForSyncBubble", CFSTR("LOAD SyncBag for uid %d"), v11, v12, v13, v14, v15, v16, a2);
    system = aks_get_system(a2, &v67);
    if ((_DWORD)system != -536870160)
    {
      v25 = system;
      if ((_DWORD)system)
      {
        sub_10001595C("loadSyncBagForSyncBubble", CFSTR("error with user session_handle for user %d with error:0x%x"), v19, v20, v21, v22, v23, v24, a2);
        goto LABEL_22;
      }
      sub_10001595C("loadSyncBagForSyncBubble", CFSTR("KeyBag for uid %d loaded and ready for syncbag"), v19, v20, v21, v22, v23, v24, a2);
    }
    v26 = (const __CFDictionary *)sub_100010674("/private/var//keybags/usersyncbag.kb");
    if (!v26)
    {
      sub_10001595C("loadSyncBagForSyncBubble", CFSTR("Failed to load userSyncBagDict file"), v27, v28, v29, v30, v31, v32, v65);
      v25 = 5;
      return sub_1000108D8(v25);
    }
    v33 = v26;
    v34 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a2);
    if (CFDictionaryContainsKey(v33, v34))
    {
      Value = (const __CFData *)CFDictionaryGetValue(v33, v34);
      if (Value)
      {
        v48 = Value;
        sub_10001595C("loadSyncBagForSyncBubble", CFSTR("SyncBagContent is being loaded to keybag %d"), v42, v43, v44, v45, v46, v47, a2);
        BytePtr = CFDataGetBytePtr(v48);
        Length = CFDataGetLength(v48);
        v51 = aks_unlock_with_sync_bag(BytePtr, Length, 0, 0, v67);
        v25 = v51;
        if ((_DWORD)v51)
        {
          sub_10001595C("loadSyncBagForSyncBubble", CFSTR("Failed to load SyncBag data with error 0x%x, clearing syncBag for user:%d"), v52, v53, v54, v55, v56, v57, v51);
          if (sub_10001513C(a1, a2, 0, v58, v59, v60, v61, v62))
          {
            sub_10001595C("loadSyncBagForSyncBubble", CFSTR("Failed to clear SyncBag content for User:%d"), v52, v53, v54, v55, v56, v57, a2);
            goto LABEL_20;
          }
          v66 = a2;
          v63 = CFSTR("Cleared SyncBag content for User:%d");
        }
        else
        {
          v63 = CFSTR("SyncBag loaded and unlocked");
        }
        sub_10001595C("loadSyncBagForSyncBubble", v63, v52, v53, v54, v55, v56, v57, v66);
LABEL_20:
        CFRelease(v33);
        if (v34)
          CFRelease(v34);
LABEL_22:
        if (!(_DWORD)v25)
          return 0;
        return sub_1000108D8(v25);
      }
      sub_10001595C("loadSyncBagForSyncBubble", CFSTR("No SyncBagContent in userSyncBagDict for User %d"), v42, v43, v44, v45, v46, v47, a2);
    }
    else
    {
      sub_10001595C("loadSyncBagForSyncBubble", CFSTR("No syncbag uidkey for the user:%d in userSyncBagDict"), v35, v36, v37, v38, v39, v40, a2);
      CFDictionarySetValue(a1, CFSTR("MKBUserSessionHasSyncBag"), kCFBooleanFalse);
    }
    v25 = 5;
    goto LABEL_20;
  }
  v17 = v10;
  sub_10001595C("loadSyncBagForSyncBubble", CFSTR("Failed to load User keybag for user:%d"), v11, v12, v13, v14, v15, v16, a2);
  return v17;
}

uint64_t sub_10001513C(__CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10;
  const __CFString *v11;
  void *v12;
  CFStringRef v13;
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
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;
  stat v71;

  if ((_DWORD)a3)
  {
    v10 = sub_1000154A4((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
    if (!v10)
    {
      v11 = CFSTR("Unload of SyncBag successful");
      goto LABEL_6;
    }
  }
  else
  {
    LOBYTE(v10) = 5;
  }
  v65 = v10;
  v11 = CFSTR("Unload of SyncBag failed with error:%d");
LABEL_6:
  sub_10001595C("removeSyncBagForSyncBubble", v11, a3, a4, a5, a6, a7, a8, v65);
  v12 = (void *)sub_100010674("/private/var//keybags/usersyncbag.kb");
  if (v12)
  {
    v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a2);
    if (!CFDictionaryContainsKey((CFDictionaryRef)v12, v13))
    {
      sub_10001595C("removeSyncBagForSyncBubble", CFSTR("No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey"), v14, v15, v16, v17, v18, v19, a2);
      CFDictionarySetValue(a1, CFSTR("MKBUserSessionHasSyncBag"), kCFBooleanFalse);
LABEL_14:
      CFRelease(v12);
      if (v13)
        CFRelease(v13);
      return sub_1000108D8(5);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)v12, v13);
    sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Removed SyncBag coontent from UserSyncBag for user :%d"), v20, v21, v22, v23, v24, v25, a2);
    if (CFDictionaryGetCount((CFDictionaryRef)v12))
    {
      if (sub_10001054C(v12, "/private/var//keybags/usersyncbag.kb"))
      {
        sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Failed to save Updated UserSyncBag"), v32, v33, v34, v35, v36, v37, v67);
        goto LABEL_14;
      }
      sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Saved UserSyncBag and removal of user:%d syncbag completed"), v32, v33, v34, v35, v36, v37, a2);
    }
    else
    {
      sub_10001595C("removeSyncBagForSyncBubble", CFSTR("NO SyncBag for any Users, removing file.."), v26, v27, v28, v29, v30, v31, v67);
      unlink("/private/var//keybags/usersyncbag.kb");
      sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Invalidate all SyncBags"), v52, v53, v54, v55, v56, v57, v69);
      v58 = aks_invalidate_sync_bags();
      if (v58)
        sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Failed to invalidate all syncbags with error:0x%x"), v59, v60, v61, v62, v63, v64, v58);
      else
        sub_10001595C("removeSyncBagForSyncBubble", CFSTR("XXXXXXXXXXXXXXXX INVALIDATED ALL SYNCBAGS XXXXXXXXXXXXXXXX"), v59, v60, v61, v62, v63, v64, v70);
    }
  }
  else
  {
    memset(&v71, 0, sizeof(v71));
    v38 = stat("/private/var//keybags/usersyncbag.kb", &v71);
    sub_10001595C("removeSyncBagForSyncBubble", CFSTR("Failed to load userSyncBagDict file"), v39, v40, v41, v42, v43, v44, v66);
    if (!v38)
      return sub_1000108D8(5);
    v13 = 0;
  }
  sub_10001595C("removeSyncBagForSyncBubble", CFSTR("RESET kMKBUserSessionHasSyncBagKey"), v45, v46, v47, v48, v49, v50, v68);
  CFDictionarySetValue(a1, CFSTR("MKBUserSessionHasSyncBag"), kCFBooleanFalse);
  if (!v12)
  {
    if (!v13)
      return 0;
    goto LABEL_23;
  }
  CFRelease(v12);
  if (v13)
LABEL_23:
    CFRelease(v13);
  return 0;
}

uint64_t sub_1000153D0(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  CFStringRef v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  char v22;

  v3 = (const __CFDictionary *)sub_100010674("/private/var//keybags/usersyncbag.kb");
  if (v3)
  {
    v10 = v3;
    v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("%d"), a2);
    v12 = CFDictionaryContainsKey(v10, v11);
    if (v12)
      v19 = CFSTR("Bag exists in UserSyncBag for user :%d");
    else
      v19 = CFSTR("No syncbag uidkey for the user:%d in userSyncBagDict, removing hasSyncKey");
    if (v12)
      v20 = 0;
    else
      v20 = 5;
    sub_10001595C("verifySyncBagForSyncBubbleExists", v19, v13, v14, v15, v16, v17, v18, a2);
    CFRelease(v10);
    if (v11)
      CFRelease(v11);
  }
  else
  {
    sub_10001595C("verifySyncBagForSyncBubbleExists", CFSTR("Failed to load userSyncBagDict file"), v4, v5, v6, v7, v8, v9, v22);
    return 5;
  }
  return v20;
}

uint64_t sub_1000154A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  unsigned int v25;

  v25 = -1;
  sub_10001595C("unloadSyncBagForSyncBubble", CFSTR("Unloading UserKeyBag for User:%d"), a3, a4, a5, a6, a7, a8, a2);
  if (aks_get_system(a2, &v25))
  {
    sub_10001595C("unloadSyncBagForSyncBubble", CFSTR("no SyncBag found for UID %d with error:0x%x"), v9, v10, v11, v12, v13, v14, a2);
    return 0;
  }
  sub_10001595C("unloadSyncBagForSyncBubble", CFSTR("Found loaded SyncBag and unloading the bag"), v9, v10, v11, v12, v13, v14, v24);
  v16 = aks_unload_bag(v25);
  if (!(_DWORD)v16)
  {
    sub_10001595C("unloadSyncBagForSyncBubble", CFSTR("Unloaded of SyncBag for UID:%d , Successful"), v17, v18, v19, v20, v21, v22, a2);
    return 0;
  }
  v23 = v16;
  sub_10001595C("unloadSyncBagForSyncBubble", CFSTR("failed to unload SyncBag for UID:%d with error:0x%x"), v17, v18, v19, v20, v21, v22, a2);
  return sub_1000108D8(v23);
}

uint64_t sub_100015574(uint64_t a1, const __CFString *a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  char v33;
  char v34;
  uuid_t uu;
  char in[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
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
  char buffer[1024];

  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
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
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)in = 0u;
  v37 = 0u;
  if (CFStringGetCString(a2, buffer, 1024, 0x8000100u))
  {
    if (CFStringGetCString(a3, in, 256, 0x8000100u))
    {
      v15 = uuid_parse(in, uu);
      if ((_DWORD)v15)
      {
        v16 = CFSTR("failed to parse unique string to uuid_t");
      }
      else
      {
        v17 = aks_keybag_persona_create(v15, a4, a5, uu);
        if (v17)
        {
          v33 = v17;
          v16 = CFSTR("Failed to create persona key with error:0x%x");
        }
        else
        {
          sub_10001595C("createPersonaKeyForUser", CFSTR("Created persona key in the keybag"), v9, v10, v11, v12, v13, v14, v33);
          v25 = sub_100014A78(v19, v20, v21, buffer, (uint64_t)uu, v22, v23, v24);
          if (!v25)
          {
            sub_10001595C("createPersonaKeyForUser", CFSTR(" Successful Setup of keybag with persona key"), v26, v27, v28, v29, v30, v31, v34);
            return 0;
          }
          sub_10001595C("createPersonaKeyForUser", CFSTR("failed to Setup keybag with persona key:%d"), v26, v27, v28, v29, v30, v31, v25);
          v32 = aks_keybag_persona_delete(0, uu);
          if (v32)
          {
            sub_10001595C("createPersonaKeyForUser", CFSTR("Failed to delete persona key with error:0x%x"), v9, v10, v11, v12, v13, v14, v32);
            return 22;
          }
          v16 = CFSTR("Successful deleted persona key");
        }
      }
    }
    else
    {
      v16 = CFSTR("Failed to get cstring from uuid string");
    }
  }
  else
  {
    v16 = CFSTR("Failed to get volume path");
  }
  sub_10001595C("createPersonaKeyForUser", v16, v9, v10, v11, v12, v13, v14, v33);
  return 22;
}

uint64_t sub_10001575C(int a1, CFStringRef theString, const __CFString *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
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
  const __CFString *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uuid_t v37;
  char in[1024];
  uuid_t uu;
  char buffer[16];
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

  memset(uu, 0, sizeof(uu));
  *(_OWORD *)buffer = 0u;
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
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  if (!CFStringGetCString(theString, buffer, 256, 0x8000100u))
  {
    v11 = CFSTR("Failed to get cstring from uuid string");
    goto LABEL_5;
  }
  v10 = uuid_parse(buffer, uu);
  if ((_DWORD)v10)
  {
    v11 = CFSTR("failed to parse unique string to uuid_t");
LABEL_5:
    sub_10001595C("deletePersonaKeyForUser", v11, v4, v5, v6, v7, v8, v9, v35);
    return 22;
  }
  v14 = aks_keybag_persona_delete(v10, uu);
  v12 = v14;
  if (!a3 || (_DWORD)v14)
  {
    if ((_DWORD)v14)
      sub_10001595C("deletePersonaKeyForUser", CFSTR("persona key delete failed with 0x%x"), v15, v16, v17, v18, v19, v20, v14);
  }
  else
  {
    memset(v37, 0, sizeof(v37));
    sub_10001595C("deletePersonaKeyForUser", CFSTR("Non Null VolumeID, parsing the uuid"), v15, v16, v17, v18, v19, v20, v35);
    bzero(in, 0x400uLL);
    if (!CFStringGetCString(a3, in, 1024, 0x8000100u))
    {
      v27 = CFSTR("failed to convert to CString");
      goto LABEL_16;
    }
    if (uuid_parse(in, v37))
    {
      v27 = CFSTR("volume uuid_parse failed");
LABEL_16:
      sub_10001595C("deletePersonaKeyForUser", v27, v21, v22, v23, v24, v25, v26, v36);
      return 0;
    }
    sub_10001595C("deletePersonaKeyForUser", CFSTR("uuid_parse SUCCESS, Unmaping the Persona Volume"), v21, v22, v23, v24, v25, v26, v36);
    v28 = aks_set_keybag_for_volume(0xFFFFFFFFLL, v37, 0);
    v12 = v28;
    if ((_DWORD)v28)
      sub_10001595C("deletePersonaKeyForUser", CFSTR("persona volume unmap failed with 0x%x"), v29, v30, v31, v32, v33, v34, v28);
  }
  return v12;
}

void sub_10001595C(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a1)
    a1 = &unk_100026FAF;
  sub_100015994((int)a1, a2, &a9);
}

void sub_100015994(int a1, CFStringRef format, va_list arguments)
{
  BOOL v3;
  const __CFString *v4;
  const __CFString *v5;
  size_t v6;
  size_t v7;
  char buffer[1024];

  if (dword_100035868)
  {
    if (&_MOLogWriteV)
      v3 = qword_100035940 == 0;
    else
      v3 = 1;
    if (!v3)
      MOLogWriteV();
  }
  else
  {
    v4 = CFStringCreateWithFormatAndArguments(0, 0, format, arguments);
    if (v4)
    {
      v5 = v4;
      if (CFStringGetCString(v4, buffer, 1024, 0x8000100u))
      {
        v6 = strlen(buffer);
        if (v6)
        {
          v7 = v6;
          if (v6 <= 0x3FF)
          {
            buffer[v6] = 10;
            v7 = v6 + 1;
          }
          fprintf(__stdoutp, "MKB_INIT: %s", buffer);
          if (dword_1000357C8 != -1)
            sub_100010380(dword_1000357C8, buffer, v7);
        }
      }
      CFRelease(v5);
    }
  }
}

void sub_100015AC8(const char *a1)
{
  tm *v2;
  char *v3;
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
  FILE *v16;
  FILE *v17;
  char v18;
  time_t v19;
  char __str[80];

  v19 = 0;
  time(&v19);
  v2 = localtime(&v19);
  v3 = asctime(v2);
  snprintf(__str, 0x50uLL, "%s-%s", a1, v3);
  __str[strlen(__str) - 1] = 0;
  sub_10001595C("fatality", CFSTR("FATAL KEYBAG ERROR: %s"), v4, v5, v6, v7, v8, v9, (char)a1);
  sub_100006CC8("keybagd", __str);
  sub_100006CC8("auto-boot", "false");
  sub_10001595C("fatality", CFSTR("Rebooting..."), v10, v11, v12, v13, v14, v15, v18);
  v16 = fopen("/dev/console", "a");
  if (v16)
  {
    v17 = v16;
    fprintf(v16, "FATAL KEYBAG ERROR: %s\n", a1);
    fwrite("REBOOTING INTO RECOVERY MODE.\n", 0x1EuLL, 1uLL, v17);
    fclose(v17);
  }
  reboot(0);
  exit(71);
}

BOOL sub_100015BCC()
{
  size_t __len;
  char __big[1024];

  __len = 1023;
  bzero(__big, 0x400uLL);
  return !sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "keybag_initlog", __len) != 0;
}

uint64_t sub_100015C70()
{
  int v0;
  uint64_t v1;
  int current_persona_proximate_info;
  int v3;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v0 = sub_100015958();
  v7 = 0u;
  v8 = 0u;
  v6 = 0u;
  v1 = 4294967293;
  if ((sub_100005754() & 1) == 0)
  {
    current_persona_proximate_info = voucher_get_current_persona_proximate_info(&v6);
    v3 = DWORD1(v7);
    if (current_persona_proximate_info)
      v3 = -1;
    if (v3 != v0 || v0 == -1)
      return 0;
    else
      return 4294967293;
  }
  return v1;
}

uint64_t sub_100015D04()
{
  uint64_t v0;
  int v2;

  if ((byte_100035920 & 1) == 0)
  {
    v2 = 0;
    v0 = sub_100015C70();
    if (!aks_get_lock_state(v0, &v2) && (v2 & 4) != 0)
      byte_100035920 = 1;
  }
  return byte_100035920;
}

sqlite3 *sub_100015D58(uint64_t a1)
{
  sqlite3 *result;
  sqlite3 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char out[40];

  result = sub_10000F524("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (result)
  {
    v3 = result;
    if (sub_10000FB38(result, *(const void **)(a1 + 32)))
    {
      memset(out, 0, 37);
      uuid_unparse(*(const unsigned __int8 **)(a1 + 32), out);
      sub_10001595C("clear_volume_backup_keys_block_invoke", CFSTR("Failed to delete cached keys for volume %s (err=%d)"), v4, v5, v6, v7, v8, v9, (char)out);
    }
    return (sqlite3 *)sub_10000F52C(v3);
  }
  return result;
}

uint64_t sub_100015E20()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[5];

  v0 = aks_clear_backup_bag(0);
  if (v0)
  {
    sub_10001595C("unregister_backup_bag", CFSTR("Can't unregister OTA Backup bag with AppleKeyStore: %x."), v1, v2, v3, v4, v5, v6, v0);
    return 0xFFFFFFFFLL;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100015D58;
    block[3] = &unk_10002D1D8;
    block[4] = &unk_100035930;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
    return 0;
  }
}

uint64_t sub_100015EB0(const __CFData *a1, uint64_t a2, uint64_t a3, CFDataRef *a4, int a5)
{
  uint64_t v5;
  const UInt8 *BytePtr;
  CFIndex v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD length[4];
  unsigned int v29;
  _QWORD block[5];

  v5 = 0xFFFFFFFFLL;
  v29 = -1;
  *(_QWORD *)&length[1] = 0;
  length[0] = 0;
  if (!a1)
    goto LABEL_9;
  BytePtr = CFDataGetBytePtr(a1);
  v12 = CFDataGetLength(a1);
  v13 = aks_load_bag(BytePtr, v12, &v29);
  if ((_DWORD)v13)
  {
    sub_10001595C("register_backup_bag", CFSTR("Can't read OTA Backup bag: %x."), v14, v15, v16, v17, v18, v19, v13);
LABEL_14:
    v5 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }
  v20 = aks_set_backup_bag(v13, v29, a2, a3, &length[1], length);
  if (v20)
  {
    sub_10001595C("register_backup_bag", CFSTR("Can't register OTA Backup bag with AppleKeyStore: %x."), v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_14;
  }
  if (a4)
    *a4 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, *(const UInt8 **)&length[1], length[0], kCFAllocatorDefault);
  if (a5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100015D58;
    block[3] = &unk_10002D1D8;
    block[4] = &unk_100035930;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
  }
  v5 = 0;
LABEL_9:
  if (v29 != -1)
    aks_unload_bag(v29);
  return v5;
}

uint64_t start(int a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
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
  NSObject *global_queue;
  char *v28;
  BOOL v29;
  uint64_t v30;
  const char *v32;
  uint32_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  FILE *v40;
  const char *v41;
  size_t v42;
  char v43;
  uint8_t buf[4];
  _BOOL4 v45;

  v4 = setiopolicy_np(9, 0, 1);
  if (v4)
    sub_10001595C("main", CFSTR("Error setting io policy: %d"), v5, v6, v7, v8, v9, v10, v4);
  if (a1 == 2 && !strcmp(*(const char **)(a2 + 8), "--init"))
  {
    if (sub_10000827C(":/product", CFSTR("boot-ios-diagnostics")) == 1)
    {
      v40 = __stdoutp;
      v41 = "****** DIAGNOSTICS MODE ENABLED, SKIP INIT ****\n";
      v42 = 48;
    }
    else if (os_variant_uses_ephemeral_storage("com.apple.mobile.keybagd"))
    {
      v40 = __stdoutp;
      v41 = "****** DEVICE HAS EPHEMERAL DATA VOLUME, SKIP INIT ****\n";
      v42 = 56;
    }
    else
    {
      if (sub_100015BCC())
      {
        dword_1000357C8 = open("/var/logs/keybagd_init.log", 522, 448);
        if (dword_1000357C8 == -1)
          fwrite("****** FAILED TO OPEN LOGFILE ****\n", 0x23uLL, 1uLL, __stdoutp);
      }
      sub_100009284((uint64_t)sub_10001595C);
      sub_100009290((uint64_t)sub_100015994);
      fwrite("****** IN MKB_INIT ****\n", 0x18uLL, 1uLL, __stdoutp);
      qword_100035928 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", 0);
      sub_1000164B8();
      sub_100016764();
      if (dword_1000357C8 != -1)
        close(dword_1000357C8);
      v40 = __stdoutp;
      v41 = "****** DONE MKB_INIT ****\n";
      v42 = 26;
    }
    fwrite(v41, v42, 1uLL, v40);
    exit(0);
  }
  sub_100009284((uint64_t)sub_10001595C);
  sub_100009290((uint64_t)sub_100015994);
  v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v12 = sub_1000108A4();
  v13 = 0;
  v14 = 0;
  if (v12)
  {
    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v13 = v11;
  }
  qword_100035870 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.passcode", v13);
  qword_100035928 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.db", v14);
  qword_100035878 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.seshat", v11);
  if (!qword_100035870 || !qword_100035928)
  {
    sub_10001595C("main", CFSTR("Can't create dispatch resources."), v15, v16, v17, v18, v19, v20, v43);
    return 71;
  }
  if (sub_10001E8C8())
    sub_10001595C("main", CFSTR("Can't register for notifications with AppleKeyStore"), v21, v22, v23, v24, v25, v26, v43);
  global_queue = dispatch_get_global_queue(0, 0);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &stru_10002D218);
  sub_10000E140();
  openlog("keybagd", 1, 24);
  v28 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v28 || (&_MOLogEnableDiskLogging ? (v29 = &_MOLogOpen == 0) : (v29 = 1), v29))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_DWORD *)buf = 67109120;
    v45 = v28 == 0;
    v32 = "MOLog* unavailable, disabling MOLog*() based logging (enable: %d).";
    v33 = 8;
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v32, buf, v33);
    goto LABEL_24;
  }
  v30 = MOLogOpen("com.apple.mobile.keybagd", 3);
  qword_100035940 = v30;
  if (!v30)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v32 = "MOLogOpen() failed, disabling MOLog*() based logging.";
    v33 = 2;
    goto LABEL_23;
  }
  MOLogEnableDiskLogging(v30, "/var/logs/keybagd.log", 3, 0x100000);
LABEL_24:
  sub_100009284((uint64_t)sub_10001595C);
  sub_100009290((uint64_t)sub_100015994);
  dword_100035868 = 1;
  if (sub_100005754())
    sub_10001595C("main", CFSTR("enhanced apfs mode"), v34, v35, v36, v37, v38, v39, v43);
  sub_1000064A4();
  dispatch_sync((dispatch_queue_t)qword_100035878, &stru_10002D6A8);
  dispatch_async((dispatch_queue_t)qword_100035878, &stru_10002D6E8);
  xpc_activity_register("com.apple.mobile.keybagd.data-analytics", XPC_ACTIVITY_CHECK_IN, &stru_10002D728);
  dispatch_async((dispatch_queue_t)qword_100035870, &stru_10002D7C8);
  fsctl("/private/var/", 0x40104A60uLL, &unk_100035930, 0);
  sub_10000466C();
  CFRunLoopRun();
  return 0;
}

uint64_t sub_1000164B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFData *v13;
  const void *Value;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  char Length;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v29;
  const UInt8 *BytePtr;
  CFIndex v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  char v40;
  int system;
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
  char v62;
  unsigned int v63;

  v63 = 0;
  v6 = sub_100004810();
  if (!v6)
  {
    if (aks_get_system(0, &v63) != -536870160)
      goto LABEL_18;
    goto LABEL_10;
  }
  sub_10001595C("load_devicebag", CFSTR("Found system keybag plist on filesystem."), v0, v1, v2, v3, v4, v5, v62);
  v13 = (const __CFData *)sub_1000100C8(v6, CFSTR("KeyBagKeys"));
  if (!v13)
    sub_10001595C("load_devicebag", CFSTR("No valid keybag data found in plist."), v7, v8, v9, v10, v11, v12, v62);
  Value = CFDictionaryGetValue(v6, CFSTR("KeybagxART"));
  if (aks_get_system(0, &v63) == -536870160)
  {
    if (v13)
    {
      sub_10001595C("load_devicebag", CFSTR("Try to load filesystem bag as handle 0."), v15, v16, v17, v18, v19, v20, v62);
      if (Value)
      {
        v21 = sub_100005754();
        Length = CFDataGetLength(v13);
        if (v21)
        {
          sub_10001595C("load_devicebag", CFSTR("xART based bag should have been loaded at startup, let's ignore it (eAPFS, len=%d)"), v23, v24, v25, v26, v27, v28, Length);
          goto LABEL_18;
        }
        sub_10001595C("load_devicebag", CFSTR("xART based bag should have been loaded at startup, let's try to load it anyway (NOT eAPFS, len=%d)"), v23, v24, v25, v26, v27, v28, Length);
      }
      BytePtr = CFDataGetBytePtr(v13);
      v31 = CFDataGetLength(v13);
      v32 = aks_load_bag(BytePtr, v31, &v63);
      if (v32)
      {
        sub_10001595C("load_devicebag", CFSTR("Uh Oh! Kernel doesn't like this keybag: 0x%08x."), v33, v34, v35, v36, v37, v38, v32);
        goto LABEL_18;
      }
      v39 = aks_set_system(v63, 0);
      aks_unload_bag(v63);
      if (v39)
      {
        sub_10001595C("load_devicebag", CFSTR("Uh Oh! Can't set system keybag:0x%08x."), v15, v16, v17, v18, v19, v20, v39);
        goto LABEL_18;
      }
      v29 = CFSTR("Handle 0 loaded.");
      goto LABEL_17;
    }
LABEL_10:
    v29 = CFSTR("No system keybag found on filesystem.");
LABEL_17:
    sub_10001595C("load_devicebag", v29, v15, v16, v17, v18, v19, v20, v62);
  }
LABEL_18:
  v40 = sub_100005754();
  system = aks_get_system(0, &v63);
  if ((v40 & 1) != 0)
  {
    if (system)
    {
      sub_10001595C("load_devicebag", CFSTR("No system keybag loaded."), v42, v43, v44, v45, v46, v47, v62);
      if (!v6)
        goto LABEL_26;
LABEL_25:
      CFRelease(v6);
      goto LABEL_26;
    }
    sub_10001595C("load_devicebag", CFSTR("Update system keybag on disk after load."), v42, v43, v44, v45, v46, v47, v62);
    sub_100008360(0, 0);
    if (v6)
      goto LABEL_25;
  }
  else
  {
    if (system)
      sub_100015AC8("failed to load system bag");
    if (sub_100008888("/private/var/", 0, 0))
      sub_100015AC8("data volume mapping");
    if (v6)
      goto LABEL_25;
  }
LABEL_26:
  sub_10001595C("load_devicebag", CFSTR("Setup allow list:"), v48, v49, v50, v51, v52, v53, v62);
  v54 = aks_setupallowlist_fs("/private/var/", 1);
  if (v54)
    sub_10001595C("load_devicebag", CFSTR("aks_setupallowlist_fs completed with %d"), v55, v56, v57, v58, v59, v60, v54);
  unlink("/private/var//keybags/backup/backup_keys_cache.db");
  return unlink("/private/var//keybags/backup/backup_keys_cache_old.db");
}

uint64_t sub_100016764()
{
  stat v1;

  memset(&v1, 0, sizeof(v1));
  if (stat("/private/var//keybags/backup", &v1) < 0 && *__error() == 2)
    mkdir("/private/var//keybags/backup", 0x1C0u);
  return sub_10000FFC8("/private/var//keybags/backup", 0, 1);
}

void sub_1000167DC(id a1, void *a2)
{
  const char *string;
  uint64_t v3;
  int lock_state;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.mobile.keybagd.first_unlock"))
  {
    byte_100035920 = 1;
    v3 = sub_100015C70();
    v14 = 0;
    v13 = 0;
    lock_state = aks_get_lock_state(v3, &v14);
    if (lock_state)
    {
      sub_10001595C("report_first_unlock", CFSTR("get_lock_state() -> 0x%x"), v6, v7, v8, v9, v10, v11, lock_state);
    }
    else
    {
      LOBYTE(v13) = BYTE1(v14) & 0x20 | (v14 >> 3) & 0x40;
      sub_100013824(&v13, v5, v6, v7, v8, v9, v10, v11, v12);
    }
    dispatch_async((dispatch_queue_t)qword_100035878, &stru_10002D258);
  }
}

void sub_100016894()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  time_t v9;

  v9 = 0;
  v0 = sub_100011568();
  if (v0)
  {
    v1 = v0;
    if (!sub_100011238(v0, &v9))
    {
      if (sub_100011944(v1))
        sub_10001595C("KBSeshatProcessTTR", CFSTR("failed to serialize TTR"), v2, v3, v4, v5, v6, v7, v8);
      else
        sub_10001C3E8(v9);
    }
    CFRelease(v1);
  }
}

void sub_100016904(int a1, char a2)
{
  _QWORD block[4];
  int v5;
  char v6;

  xpc_transaction_begin();
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100016974;
  block[3] = &unk_10002D278;
  v5 = a1;
  v6 = a2;
  dispatch_async((dispatch_queue_t)qword_100035870, block);
}

void sub_100016974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001595C("update_system_keybag_block_invoke", CFSTR("Updating Keybag handle %ld with %s"), a3, a4, a5, a6, a7, a8, *(_DWORD *)(a1 + 32));
  sub_100008360(*(unsigned int *)(a1 + 32), *(unsigned __int8 *)(a1 + 36));
  xpc_transaction_end();
}

void sub_1000169DC(int a1)
{
  char v1;
  uint64_t v2;

  if (a1 == 1)
  {
    v2 = sub_100015C70();
    sub_100016B10(v2);
    goto LABEL_5;
  }
  if (a1)
  {
LABEL_5:
    v1 = 2;
    goto LABEL_6;
  }
  dispatch_async((dispatch_queue_t)qword_100035878, &stru_10002D2B8);
  unlink("/var/root/.mkb_seshat_health");
  v1 = 1;
LABEL_6:
  dispatch_async((dispatch_queue_t)qword_100035878, &stru_10002D2F8);
  sub_100016D10(1, v1);
}

void sub_100016A4C(id a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  char __str[8];
  uint64_t v20;

  *(_QWORD *)__str = 0;
  v20 = 0;
  v1 = sub_100006FD4();
  snprintf(__str, 0x10uLL, "%u", v1 + 1);
  if (sub_100006CC8("seshat-count", __str))
  {
    v8 = CFSTR("failed to update nvram");
  }
  else
  {
    v16 = __str;
    v8 = CFSTR("success setting to '%s'");
  }
  sub_10001595C("handle_recovery_completion_block_invoke", v8, v2, v3, v4, v5, v6, v7, (char)v16);
  v18 = 1;
  sub_100013190(&v18, v9, v10, v11, v12, v13, v14, v15, v17);
}

void sub_100016B10(uint64_t a1)
{
  int lock_state;
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
  char v16;
  _QWORD block[9];
  int v18;
  CFTypeRef cf;
  int v20;
  _QWORD v21[3];
  char v22;
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2000000000;
  v29 = -1;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2000000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2000000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v23[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2000000000;
  v22 = 0;
  v20 = 0;
  cf = 0;
  lock_state = aks_get_lock_state(a1, &v20);
  if (lock_state)
  {
    v15 = lock_state;
    sub_10001595C("seshat_reset_count_after_wc_recovery", CFSTR("get_lock_state() -> 0x%x"), v3, v4, v5, v6, v7, v8, lock_state);
    *((_DWORD *)v27 + 6) = v15;
  }
  else
  {
    if ((v20 & 0x2000) == 0)
    {
LABEL_11:
      *((_DWORD *)v27 + 6) = 0;
      goto LABEL_6;
    }
    if (!aks_get_configuration(a1, &cf))
    {
      if ((sub_100010100((const __CFDictionary *)cf, kAKSConfigRecoveryFlags) & 8) != 0)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000;
        block[2] = sub_10001BC68;
        block[3] = &unk_10002D830;
        v18 = a1;
        block[4] = v21;
        block[5] = v24;
        block[6] = v25;
        block[7] = v23;
        block[8] = &v26;
        dispatch_sync((dispatch_queue_t)qword_100035878, block);
        goto LABEL_6;
      }
      goto LABEL_11;
    }
    sub_10001595C("seshat_reset_count_after_wc_recovery", CFSTR("unable to fetch config"), v9, v10, v11, v12, v13, v14, v16);
  }
LABEL_6:
  if (*((_DWORD *)v27 + 6))
    sub_10001595C("seshat_reset_count_after_wc_recovery", CFSTR("failed to reset SEshat: %x"), v3, v4, v5, v6, v7, v8, *((_DWORD *)v27 + 6));
  if (cf)
    CFRelease(cf);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v26, 8);
}

void sub_100016CF4(id a1)
{
  uint64_t v1;

  v1 = sub_100015C70();
  sub_100006764(0, v1);
}

void sub_100016D10(int a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unsigned int v14;

  v14 = 1;
  v13 = 0;
  v4 = sub_100015C70();
  if (!aks_get_lock_state(v4, &v14))
  {
    LOWORD(v13) = ((4 * v14) & 0x100 | (((v14 >> 5) & 1) << 9) & 0xEFFF | (v14 >> 3) & 0x400 | (v14 >> 1) & 0x800 | (((v14 >> 9) & 1) << 12) | ((16 * (a2 & 3)) | ((_BYTE)a1 << 6)) | 1) ^ 0x100;
    switch(a1)
    {
      case 2:
LABEL_5:
        sub_100011968(CFSTR("com.apple.mobile.keybagd.sidp.recovery"), 0, v13);
        return;
      case 1:
        sub_100013630(&v13, v5, v6, v7, v8, v9, v10, v11, v12);
        break;
      case 0:
        goto LABEL_5;
      default:
        sub_10001595C("_collect_recovery_stats", CFSTR("invalid event %d"), v6, v7, v8, v9, v10, v11, a1);
        break;
    }
  }
}

void sub_100016DF8()
{
  xpc_transaction_begin();
  dispatch_async((dispatch_queue_t)qword_100035928, &stru_10002D338);
}

void sub_100016E1C(id a1)
{
  sub_100016E30();
  xpc_transaction_end();
}

BOOL sub_100016E30()
{
  sqlite3 *v0;
  sqlite3 *v1;
  _BOOL4 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  char *v11;
  sqlite3 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  sqlite3 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v53[2];
  sqlite3_int64 v54;
  _QWORD v55[2];

  v43 = 0;
  v44 = 0;
  if ((byte_100035948 & 1) == 0)
  {
    v0 = sub_10000F208("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0, 0);
    if (v0)
    {
      v1 = v0;
      v2 = sub_10000F090(v0);
      sub_10000F52C(v1);
      if (v2)
      {
        sub_10001595C("db_check_once", CFSTR("%s is corrupted, discarding"), v3, v4, v5, v6, v7, v8, (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
        unlink("/private/var//keybags/backup/backup_keys_cache.sql3");
      }
      else
      {
        sub_10001595C("db_check_once", CFSTR("%s is ok"), v3, v4, v5, v6, v7, v8, (char)"/private/var//keybags/backup/backup_keys_cache.sql3");
      }
      byte_100035948 = 1;
    }
  }
  v9 = 0;
  if (aks_drain_backup_keys_info(0, &v44, &v43))
    return v9;
  v10 = v43;
  if (!v43)
    return v9;
  v11 = (char *)v44;
  v47 = 0;
  v45 = 0u;
  v46 = 0u;
  BYTE12(v45) = sub_100015D04();
  *(_QWORD *)&v46 = 0;
  *(_QWORD *)((char *)&v46 + 6) = 0;
  v12 = sub_10000F208("/private/var//keybags/backup/backup_keys_cache.sql3", 1, 0, (uint64_t)&v45);
  if (!v12)
  {
    v27 = 0;
    DWORD2(v45) = 3;
    goto LABEL_24;
  }
  v20 = v12;
  if (sub_10000F030(v12, 1))
    sub_10001595C("drain_backup_keys", CFSTR("failed to begin transaction"), v21, v22, v23, v24, v25, v26, v42);
  v27 = 0;
  while (1)
  {
    v54 = 0;
    v55[0] = 0;
    v55[1] = 0;
    v52 = 0u;
    memset(v53, 0, 28);
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    if (bswap32(*((_DWORD *)v11 + 12)) < 0x49)
      break;
    sub_10001595C("drain_backup_keys", CFSTR("Found bad key (key data larger than expected) trying to skip"), v21, v22, v23, v24, v25, v26, v42);
    DWORD2(v45) = 1;
LABEL_17:
    v11 += 124;
    if (!--v10)
      goto LABEL_21;
  }
  *(_QWORD *)&v45 = v45 + 1;
  v54 = *((_QWORD *)v11 + 4);
  uuid_copy((unsigned __int8 *)v55, (const unsigned __int8 *)v11);
  v28 = *((_OWORD *)v11 + 1);
  v29 = *((_OWORD *)v11 + 3);
  v49 = *((_OWORD *)v11 + 2);
  v50 = v29;
  v48 = v28;
  v30 = *((_OWORD *)v11 + 4);
  v31 = *((_OWORD *)v11 + 5);
  v32 = *((_OWORD *)v11 + 6);
  *(_OWORD *)((char *)v53 + 12) = *(_OWORD *)(v11 + 108);
  v52 = v31;
  v53[0] = v32;
  v51 = v30;
  v33 = sub_10000F574(v20, &v54, &v48, &v47);
  if (!v33)
  {
    v27 = 1;
    goto LABEL_17;
  }
  v34 = v33;
  sub_10001595C("drain_backup_keys", CFSTR("Failed to add key to db %d"), v21, v22, v23, v24, v25, v26, v33);
  DWORD2(v45) = 2;
  LODWORD(v46) = v34;
  DWORD2(v46) = v47;
LABEL_21:
  if (sub_10000F030(v20, 0))
    sub_10001595C("drain_backup_keys", CFSTR("failed to end transaction"), v35, v36, v37, v38, v39, v40, v42);
  sub_10000F52C(v20);
LABEL_24:
  sub_100013DE0((uint64_t)&v45, v13, v14, v15, v16, v17, v18, v19, v42);
  v9 = v27 != 0;
  free(v44);
  return v9;
}

uint64_t sub_100017118(char a1)
{
  uint64_t v1;
  _QWORD v3[5];
  char v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_1000171B0;
  v3[3] = &unk_10002D360;
  v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100035870, v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

void sub_1000171B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  const __CFDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  const __CFString *v19;
  const void *v20;

  if (sub_100015C70())
  {
    v10 = sub_100015958();
    v11 = sub_100004A70(v10);
  }
  else
  {
    v11 = sub_100004810();
  }
  v18 = v11;
  if (v11)
  {
    if (*(_BYTE *)(a1 + 40))
      v19 = CFSTR("BackupKeyBagKeys");
    else
      v19 = CFSTR("OpaqueStuff");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(v11, v19);
    v20 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v20)
      CFRetain(v20);
    CFRelease(v18);
  }
  else
  {
    sub_10001595C("keybagd_getpasscodeblob_block_invoke", CFSTR("Huh? can't load the bag. That makes no sense"), v12, v13, v14, v15, v16, v17, a9);
  }
}

uint64_t sub_100017250(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2000000000;
  v7 = -1;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_1000172E8;
  v3[3] = &unk_10002D388;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_100035870, v3);
  v1 = *((unsigned int *)v5 + 6);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_1000172E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = sub_100015C70();
  if ((_DWORD)v2)
  {
    v3 = sub_100015C70();
    v4 = sub_100015958();
    result = sub_100005878(v3, v4, *(const void **)(a1 + 40), 0);
  }
  else
  {
    result = sub_100005504(v2, "/private/var/", *(const void **)(a1 + 40), 1, 0);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100017354(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_1000173F0;
  v5[3] = &unk_10002D3B0;
  v5[4] = &v6;
  v5[5] = a1;
  v5[6] = a2;
  v5[7] = a3;
  dispatch_sync((dispatch_queue_t)qword_100035870, v5);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_1000173F0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v9;
  BOOL v10;
  char v11;
  CFTypeRef cf;

  sub_10001595C("keybagd_registerbackup_block_invoke", CFSTR("handle_registerbackupbag"), a3, a4, a5, a6, a7, a8, v11);
  v9 = (const __CFData *)a1[5];
  if (v9)
  {
    cf = 0;
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = sub_100015EB0(v9, a1[6], a1[7], (CFDataRef *)&cf, 1);
    if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24))
      v10 = 1;
    else
      v10 = cf == 0;
    if (!v10)
    {
      sub_100004BD4(cf);
      CFRelease(cf);
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = sub_100015E20();
    sub_100004BD4(0);
  }
}

uint64_t sub_10001749C(const __CFData *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  char v16;
  _QWORD block[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_1000175BC;
    block[3] = &unk_10002D3D8;
    block[4] = &v18;
    block[5] = a1;
    block[6] = a2;
    block[7] = a3;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
    if (v19[3])
    {
      v13 = ++dword_10003594C;
    }
    else
    {
      ++dword_100035950;
      v13 = dword_10003594C;
    }
    if (v13 >= 64)
    {
      v22 = v13;
      sub_100013984(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_10003594C = 0;
    }
    if (dword_100035950 >= 64)
    {
      v22 = dword_100035950;
      sub_100013A78(&v22, v6, v7, v8, v9, v10, v11, v12, v16);
      dword_100035950 = 0;
    }
  }
  v14 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

CFDataRef sub_1000175BC(uint64_t a1)
{
  const unsigned __int8 *BytePtr;
  CFDataRef result;
  uuid_t dst;

  memset(dst, 0, sizeof(dst));
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  result = sub_10001766C(dst, *(_QWORD *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    result = (CFDataRef)sub_100016E30();
    if ((_DWORD)result)
    {
      result = sub_10001766C(dst, *(_QWORD *)(a1 + 48), *(CFTypeRef **)(a1 + 56));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

CFDataRef sub_10001766C(unsigned __int8 *src, unint64_t a2, CFTypeRef *a3)
{
  sqlite3 *v4;
  sqlite3 *v5;
  CFDataRef v6;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _DWORD v12[7];
  unint64_t v13;
  _QWORD v14[2];

  v14[0] = 0;
  v14[1] = 0;
  v11 = 0u;
  memset(v12, 0, sizeof(v12));
  v9 = 0u;
  v10 = 0u;
  memset(v8, 0, sizeof(v8));
  v13 = bswap64(a2);
  uuid_copy((unsigned __int8 *)v14, src);
  v4 = sub_10000F524("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  if (sub_10000F748(v4, (sqlite3_int64 *)&v13, v8, a3))
    v6 = 0;
  else
    v6 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v8, bswap32(v9) + 36);
  sub_10000F52C(v5);
  return v6;
}

uint64_t sub_100017768(CFDataRef theData, char a2)
{
  uint64_t v4;
  _QWORD block[6];
  char v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = -1;
  if (theData && CFDataGetLength(theData) != 16)
  {
    v4 = 4294966296;
    *((_DWORD *)v9 + 6) = -1000;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017834;
    block[3] = &unk_10002D400;
    v7 = a2;
    block[4] = &v8;
    block[5] = theData;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
    v4 = *((unsigned int *)v9 + 6);
  }
  _Block_object_dispose(&v8, 8);
  return v4;
}

void sub_100017834(uint64_t a1)
{
  const __CFData *v2;
  const unsigned __int8 *BytePtr;
  sqlite3 *v4;
  sqlite3 *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  char out[40];
  uuid_t dst;

  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  v2 = *(const __CFData **)(a1 + 40);
  if (v2)
  {
    BytePtr = CFDataGetBytePtr(v2);
    uuid_copy(dst, BytePtr);
    uuid_unparse(dst, out);
  }
  v4 = sub_10000F524("/private/var//keybags/backup/backup_keys_cache.sql3", 0, 0);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48))
    {
      if (v6)
        v7 = sub_10000FC10(v4, dst);
      else
        v7 = sub_10000FCE4(v4);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
    }
    else
    {
      if (v6)
        v8 = sub_10000FD70(v4, dst);
      else
        v8 = sub_10000FE4C(v4);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
      sub_10000FEF8(v5, 259200);
    }
    sub_10000F52C(v5);
    v15 = "Start";
    if (!*(_BYTE *)(a1 + 48))
      v15 = "End";
    sub_10001595C("keybagd_startstopBackup_block_invoke", CFSTR("%s backup session (volume: %s - rc: %d)"), v9, v10, v11, v12, v13, v14, (char)v15);
  }
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == -1 && *__error() == 2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t sub_1000179DC(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _QWORD block[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2000000000;
  v14 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100017AB4;
    block[3] = &unk_10002D428;
    block[6] = a2;
    block[7] = a3;
    block[8] = a4;
    block[4] = &v11;
    block[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100035870, block);
    v8 = *((unsigned int *)v12 + 6);
  }
  else
  {
    v8 = 4294966296;
    *((_DWORD *)v12 + 6) = -1000;
  }
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t sub_100017AB4(uint64_t a1)
{
  const unsigned __int8 *BytePtr;
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
  uint64_t result;
  CFIndex v17;
  const UInt8 *v18;
  _QWORD block[5];
  char out[40];
  uuid_t dst;

  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  v17 = 0;
  v18 = 0;
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_10001595C("keybagd_enablebackup_block_invoke", CFSTR("Enabling backup for volume %s"), v3, v4, v5, v6, v7, v8, (char)out);
  v15 = aks_backup_enable_volume(dst, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &v18, &v17);
  if ((_DWORD)v15)
  {
    sub_10001595C("keybagd_enablebackup_block_invoke", CFSTR("Could not enable backup for volume %s, err=%x"), v9, v10, v11, v12, v13, v14, (char)out);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100015D58;
    block[3] = &unk_10002D1D8;
    block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
    **(_QWORD **)(a1 + 64) = CFDataCreate(kCFAllocatorDefault, v18, v17);
  }
  result = sub_1000108D8(v15);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100017C08(const __CFData *a1)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = -1;
  if (CFDataGetLength(a1) == 16)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_100017CAC;
    v4[3] = &unk_10002D450;
    v4[4] = &v5;
    v4[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100035870, v4);
  }
  v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_100017CAC(uint64_t a1)
{
  const unsigned __int8 *BytePtr;
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
  uint64_t result;
  _QWORD block[5];
  char out[40];
  uuid_t dst;

  memset(dst, 0, sizeof(dst));
  memset(out, 0, 37);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 40));
  uuid_copy(dst, BytePtr);
  uuid_unparse(dst, out);
  sub_10001595C("keybagd_disablebackup_block_invoke", CFSTR("Disabling backup for volume %s"), v3, v4, v5, v6, v7, v8, (char)out);
  v15 = aks_backup_disable_volume(dst);
  if ((_DWORD)v15)
  {
    sub_10001595C("keybagd_disablebackup_block_invoke", CFSTR("Could not disable backup for volume %s, err=%x"), v9, v10, v11, v12, v13, v14, (char)out);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100015D58;
    block[3] = &unk_10002D1D8;
    block[4] = dst;
    dispatch_sync((dispatch_queue_t)qword_100035928, block);
  }
  result = sub_1000108D8(v15);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_100017DD4(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  unsigned int v10;
  uint64_t v11;
  int lock_state;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  uint64_t v21;
  char v23;
  _QWORD v24[7];
  int v25;
  BOOL v26;
  char v27;
  _QWORD v28[8];
  int v29;
  int v30;
  int v31;
  _QWORD block[4];
  int v33;
  int v34;
  _QWORD v35[5];
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;

  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = -1;
  v36 = 1;
  v10 = sub_100015C70();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2800000000;
  v35[3] = 0;
  v35[4] = 0;
  if ((a4 & 2) != 0)
    v11 = -a5;
  else
    v11 = v10;
  lock_state = aks_get_lock_state(v11, &v36);
  *((_DWORD *)v38 + 6) = lock_state;
  if (lock_state)
  {
    sub_10001595C("keybagd_stashcreate", CFSTR("get_lock_state() -> 0x%x"), v13, v14, v15, v16, v17, v18, lock_state);
    goto LABEL_25;
  }
  if ((a3 - 1) >= 2)
  {
    v34 = -1;
    if (sub_100018054(0, 0, &v34))
      v20 = 0;
    else
      v20 = v34 == 1;
    v19 = v20;
    if ((a4 & 4) == 0)
      goto LABEL_16;
  }
  else
  {
    v19 = 0;
    if ((a4 & 4) == 0)
      goto LABEL_16;
  }
  sub_10001595C("keybagd_stashcreate", CFSTR("Skipping SE KUD"), v13, v14, v15, v16, v17, v18, v23);
LABEL_16:
  if (v19)
    sub_10001595C("keybagd_stashcreate", CFSTR("WA: Preserving SE KUD since stash is committed"), v13, v14, v15, v16, v17, v18, v23);
  if ((a3 - 1) <= 1 && (a4 & 4) == 0 && (v36 & 0x2000) != 0)
  {
    sub_100016B10(v11);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_100018164;
    block[3] = &unk_10002D470;
    v33 = v11;
    dispatch_sync((dispatch_queue_t)qword_100035878, block);
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 0x40000000;
  v28[2] = sub_1000182E0;
  v28[3] = &unk_10002D498;
  v28[6] = a1;
  v28[7] = a2;
  v29 = v11;
  v30 = a3;
  v31 = a4 & 1;
  v28[4] = &v37;
  v28[5] = v35;
  dispatch_sync((dispatch_queue_t)qword_100035870, v28);
  if (!(*((_DWORD *)v38 + 6) | a4 & 4) && (v36 & 0x2000) != 0)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 0x40000000;
    v24[2] = sub_1000183B4;
    v24[3] = &unk_10002D4C0;
    v26 = (a3 - 1) < 2;
    v27 = v19;
    v25 = v11;
    v24[4] = &v37;
    v24[5] = a1;
    v24[6] = a2;
    dispatch_sync((dispatch_queue_t)qword_100035878, v24);
  }
LABEL_25:
  v21 = *((unsigned int *)v38 + 6);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v37, 8);
  return v21;
}

uint64_t sub_100018054(int a1, char a2, _DWORD *a3)
{
  int v4;
  uint64_t *v5;
  uint64_t v6;
  _QWORD v8[7];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  _QWORD v14[3];
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  if ((a2 & 2) != 0)
    v4 = -a1;
  else
    v4 = sub_100015C70();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2000000000;
  v15 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = sub_100018A84;
  v8[3] = &unk_10002D538;
  v9 = v4;
  v8[4] = v14;
  v8[5] = &v16;
  v8[6] = &v10;
  dispatch_sync((dispatch_queue_t)qword_100035870, v8);
  v5 = v17;
  v6 = *((unsigned int *)v17 + 6);
  if (a3 && !(_DWORD)v6)
  {
    *a3 = *((_DWORD *)v11 + 6);
    v6 = *((unsigned int *)v5 + 6);
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v6;
}

void sub_100018164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
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
  const UInt8 *BytePtr;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const UInt8 *v36;
  int v37;
  char v38;
  char v39;
  char v40;
  CFDataRef theData;
  int v42;
  unsigned int v43;
  uint64_t v44;
  unsigned __int8 v45;

  v45 = 0;
  v43 = 0;
  v42 = 0;
  theData = 0;
  v40 = -1;
  v44 = sub_10001C8D8(65000, a2, a3, a4, a5, a6, a7, a8);
  if (v44)
  {
    v15 = sub_10001D428((id *)&v44, (CFTypeRef *)&theData, (uint64_t)&v40, (uint64_t)&v42, (uint64_t)&v43);
    if (v15 == 0x900000000000)
    {
      if (sub_100006968(*(unsigned int *)(a1 + 32), &v45, 0, 0))
      {
        sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("KBGetSEStuff() failed"), v22, v23, v24, v25, v26, v27, v38);
      }
      else
      {
        sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("got slot = %d, gwc = %d"), v22, v23, v24, v25, v26, v27, v45);
        BytePtr = CFDataGetBytePtr(theData);
        if (BytePtr[v45] != 238)
        {
          v36 = CFDataGetBytePtr(theData);
          if ((char)v36[v45] < 0)
          {
            sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("slot is v2"), v30, v31, v32, v33, v34, v35, v39);
            v37 = sub_100006238(*(unsigned int *)(a1 + 32), 3, v43);
            if (v37)
              sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("arming of nonce failed %x"), v30, v31, v32, v33, v34, v35, v37);
          }
        }
      }
    }
    else
    {
      sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("getData() -> 0x%x:0x%x"), v16, v17, v18, v19, v20, v21, v15);
    }
    if (v44)
      sub_10001C8E4((id *)&v44, v29, v30, v31, v32, v33, v34, v35, v39);
  }
  else
  {
    sub_10001595C("keybagd_stashcreate_block_invoke", CFSTR("no SE ctx"), v9, v10, v11, v12, v13, v14, v38);
  }
  if (theData)
    CFRelease(theData);
}

void sub_1000182E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v10 = "NULL";
  if (*(_QWORD *)(a1 + 48) && *(_QWORD *)(a1 + 56))
    v10 = "SECRET";
  sub_10001595C("keybagd_stashcreate_block_invoke_2", CFSTR("passcode=%s"), a3, a4, a5, a6, a7, a8, (char)v10);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = aks_stash_create_for_bag_and_kek(*(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (*(_DWORD *)(v17 + 24))
  {
    sub_10001595C("keybagd_stashcreate_block_invoke_2", CFSTR("aks_stash_create_for_bag_and_kek failed %x"), v11, v12, v13, v14, v15, v16, *(_DWORD *)(v17 + 24));
  }
  else
  {
    *(_DWORD *)(v17 + 24) = 0;
    sub_10001595C("keybagd_stashcreate_block_invoke_2", CFSTR("aks_stash_create_for_bag_and_kek success"), v11, v12, v13, v14, v15, v16, a9);
  }
}

void sub_1000183B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *v9;
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
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  const UInt8 *BytePtr;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const UInt8 *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  char v59;
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
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const __CFString *v86;
  char v87;
  char v88;
  char v89;
  char v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int8 v94;
  char v95;
  CFDataRef theData;
  unsigned __int8 v97;
  int v98;
  unsigned int v99;
  CFDataRef v100;
  CFDataRef v101;
  uint64_t v102;

  v101 = 0;
  v102 = 0;
  v100 = 0;
  v99 = 0;
  v98 = 0;
  v97 = 0;
  theData = 0;
  v95 = -1;
  v94 = 0;
  v92 = 0;
  v93 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1;
  if (*(_BYTE *)(a1 + 60))
  {
    v9 = (const char *)&unk_100026FAF;
  }
  else if (*(_BYTE *)(a1 + 61))
  {
    v9 = "not de-";
  }
  else
  {
    v9 = "de-";
  }
  sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("%sauthorizing SE update"), a3, a4, a5, a6, a7, a8, (char)v9);
  v102 = sub_10001C52C(65000, &v94, (uint64_t)&v92, v10, v11, v12, v13, v14);
  if (!v102)
  {
    sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("no SE ctx"), v16, v17, v18, v19, v20, v21, v87);
    v59 = 0;
    LODWORD(v35) = 0;
    v58 = 0x200000000000000;
    goto LABEL_20;
  }
  if (!*(_BYTE *)(a1 + 60))
  {
    if (*(_BYTE *)(a1 + 61))
    {
      LODWORD(v35) = 0;
      goto LABEL_18;
    }
    v79 = sub_10001D1B8((id *)&v102, 0, 238, 0, (uint64_t)&v99);
    v35 = HIDWORD(v79);
    if (v79 != 0x900000000000)
    {
      sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("resetCounter() -> 0x%x:0x%x"), v51, v52, v53, v54, v55, v56, v79);
      v58 = 0;
      goto LABEL_19;
    }
    v57 = CFSTR("de-authorized SE update");
LABEL_15:
    sub_10001595C("keybagd_stashcreate_block_invoke_3", v57, v51, v52, v53, v54, v55, v56, v87);
    LODWORD(v35) = 36864;
LABEL_18:
    v58 = 0;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
LABEL_19:
    v59 = 1;
    goto LABEL_20;
  }
  if (sub_100006968(*(unsigned int *)(a1 + 56), &v97, 0, 0))
  {
    sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("KBGetSEStuff() failed"), v22, v23, v24, v25, v26, v27, v87);
    v58 = 0;
    LODWORD(v35) = 0;
    goto LABEL_19;
  }
  v28 = sub_10001D428((id *)&v102, (CFTypeRef *)&theData, (uint64_t)&v95, (uint64_t)&v98, (uint64_t)&v99);
  v35 = HIDWORD(v28);
  if (v28 != 0x900000000000)
  {
    sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("getData() -> 0x%x:0x%x"), v29, v30, v31, v32, v33, v34, v28);
    v59 = 0;
    v58 = 0x300000000000000;
    goto LABEL_20;
  }
  sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("got slot = %d, gwc = %d"), v29, v30, v31, v32, v33, v34, v97);
  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr[v97] != 238)
  {
    v43 = CFDataGetBytePtr(theData);
    if ((char)v43[v97] < 0)
    {
      sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("slot is v2"), v37, v38, v39, v40, v41, v42, v88);
      if (!sub_1000062B4(*(unsigned int *)(a1 + 56), &v101, &v100)
        && (sub_10001E2A4(3, v99, v100, v81, v82, v83, v84, v85) & 1) != 0)
      {
        goto LABEL_13;
      }
      sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("no nonce, or is out of date"), v80, v81, v82, v83, v84, v85, v87);
      if (v101)
      {
        CFRelease(v101);
        v101 = 0;
      }
      if (v100)
      {
        CFRelease(v100);
        v100 = 0;
      }
      if (sub_100006238(*(unsigned int *)(a1 + 56), 3, v99))
      {
        v58 = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -1000;
        goto LABEL_50;
      }
      if (aks_verify_password(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), 0, 0))
      {
        v86 = CFSTR("cant verify passcode");
      }
      else
      {
        if (!sub_1000062B4(*(unsigned int *)(a1 + 56), &v101, &v100))
          goto LABEL_13;
        v86 = CFSTR("cant fetch sig");
      }
LABEL_49:
      sub_10001595C("keybagd_stashcreate_block_invoke_3", v86, v44, v45, v46, v47, v48, v49, v87);
      v58 = 0;
LABEL_50:
      LODWORD(v35) = 36864;
      goto LABEL_19;
    }
  }
  sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("slot is v1"), v37, v38, v39, v40, v41, v42, v88);
  if (sub_100006968(*(unsigned int *)(a1 + 56), &v97, &v101, 0))
  {
    v86 = CFSTR("KBGetSEStuff() failed");
    goto LABEL_49;
  }
LABEL_13:
  v50 = sub_10001D1B8((id *)&v102, 1, v97, (uint64_t)v101, (uint64_t)&v99);
  v35 = HIDWORD(v50);
  if (v50 == 0x900000000000)
  {
    v57 = CFSTR("authorized SE update");
    goto LABEL_15;
  }
  sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("resetCounter() -> 0x%x:0x%x"), v51, v52, v53, v54, v55, v56, v50);
  v59 = 0;
  v58 = 0xA00000000000000;
LABEL_20:
  if (v102)
    sub_10001C8E4((id *)&v102, v15, v16, v17, v18, v19, v20, v21, v87);
  if (v100)
  {
    CFRelease(v100);
    v100 = 0;
  }
  if (v101)
  {
    CFRelease(v101);
    v101 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if ((v59 & 1) == 0)
  {
    sub_10001E21C(v35, v15, v16, v17, v18, v19, v20, v21);
    v91 = ((unint64_t)v94 << 6) | ((unint64_t)v93 << 8) | ((unint64_t)(unsigned __int16)v35 << 40) | v58 | 0x10;
    sub_100012FAC(&v91, v60, v61, v62, v63, v64, v65, v66, v87);
    sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("SE failed, trying soft recovery"), v67, v68, v69, v70, v71, v72, v89);
    if (!aks_se_recover(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
      sub_10001595C("keybagd_stashcreate_block_invoke_3", CFSTR("SE soft recovery success"), v73, v74, v75, v76, v77, v78, v90);
      sub_100006764(0, *(unsigned int *)(a1 + 56));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
}

uint64_t sub_100018864(int a1, char a2)
{
  int v2;
  uint64_t v3;
  _QWORD v5[5];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = -1;
  if ((a2 & 2) != 0)
    v2 = -a1;
  else
    v2 = sub_100015C70();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100018914;
  v5[3] = &unk_10002D4E8;
  v5[4] = &v7;
  v6 = v2;
  dispatch_sync((dispatch_queue_t)qword_100035870, v5);
  v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_100018914(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = aks_stash_commit(*(unsigned int *)(a1 + 40));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_DWORD *)(v8 + 24);
  if (v9)
  {
    sub_10001595C("keybagd_stashcommit_block_invoke", CFSTR("aks_stash_commit failed %x (handle:%d)"), v2, v3, v4, v5, v6, v7, v9);
  }
  else
  {
    *(_DWORD *)(v8 + 24) = 0;
    sub_10001595C("keybagd_stashcommit_block_invoke", CFSTR("success (handle:%d)"), v2, v3, v4, v5, v6, v7, *(_DWORD *)(a1 + 40));
  }
}

uint64_t sub_100018998()
{
  uint64_t v0;
  _QWORD block[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2000000000;
  v6 = -1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100018A2C;
  block[3] = &unk_10002D510;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100035870, block);
  v0 = *((unsigned int *)v4 + 6);
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100018A2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = aks_stash_destroy();
  sub_10001595C("keybagd_stashdestroy_block_invoke", CFSTR("aks_stash_destroy %x"), v2, v3, v4, v5, v6, v7, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void sub_100018A84(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = aks_stash_verify(*(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
  {
    sub_10001595C("keybagd_stashverify_block_invoke", CFSTR("aks_stash_verify failed %x (handle:%d)"), v3, v4, v5, v6, v7, v8, v2);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
    sub_10001595C("keybagd_stashverify_block_invoke", CFSTR("AKS STASH VERIFY success (handle:%d)"), v3, v4, v5, v6, v7, v8, *(_DWORD *)(a1 + 56));
  }
}

uint64_t sub_100018B24(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _QWORD v5[7];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = -1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000;
  v5[2] = sub_100018BC4;
  v5[3] = &unk_10002D560;
  v5[4] = &v7;
  v5[5] = a1;
  v5[6] = a2;
  v6 = a3;
  dispatch_sync((dispatch_queue_t)qword_100035870, v5);
  v3 = *((unsigned int *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_100018BC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFMutableDictionaryRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *Value;
  const void *v19;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  int v37;
  char v38;
  unsigned int v39;

  v39 = 0;
  v2 = sub_100015C70();
  if (!aks_get_system(v2, &v39))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = aks_change_secret(v39, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 56), &v39);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      goto LABEL_15;
    if (sub_100015C70())
    {
      v3 = sub_100015958();
      v4 = sub_100004A70(v3);
    }
    else
    {
      v4 = sub_100004810();
    }
    v11 = v4;
    sub_10001595C("keybagd_changegeneration_block_invoke", CFSTR("Starting transition to new system bag at handle %d"), v5, v6, v7, v8, v9, v10, v39);
    if (v11)
    {
      Value = CFDictionaryGetValue(v11, CFSTR("OpaqueStuff"));
      if (Value)
      {
        v19 = Value;
        CFRetain(Value);
        CFRelease(v11);
        sub_10001595C("keybagd_changegeneration_block_invoke", CFSTR("Got opaqueStuff from ondisk keybag"), v20, v21, v22, v23, v24, v25, v38);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sub_100005504(v39, "/private/var/", v19, 1, 0);
        CFRelease(v19);
      }
      else
      {
        CFRelease(v11);
        sub_10001595C("keybagd_changegeneration_block_invoke", CFSTR("Got opaqueStuff from ondisk keybag"), v27, v28, v29, v30, v31, v32, v38);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sub_100005504(v39, "/private/var/", 0, 1, 0);
      }
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) || !*(_DWORD *)(a1 + 56))
      {
LABEL_15:
        v35 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v36 = *(_DWORD *)(v35 + 24);
        if (v36 > -536870175)
        {
          if (!v36)
            return;
          if (v36 != -536870174)
            goto LABEL_22;
        }
        else if (v36 != -536870194)
        {
          if (v36 == -536870184)
          {
            v37 = -13;
LABEL_23:
            *(_DWORD *)(v35 + 24) = v37;
            return;
          }
LABEL_22:
          v37 = -1000;
          goto LABEL_23;
        }
        v37 = -3;
        goto LABEL_23;
      }
      v33 = v39;
      v34 = sub_100015C70();
      v26 = aks_set_system_with_passcode(v33, v34, *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48));
    }
    else
    {
      sub_10001595C("keybagd_changegeneration_block_invoke", CFSTR("Failed to load system keybag"), v12, v13, v14, v15, v16, v17, v38);
      v26 = -1;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v26;
    goto LABEL_15;
  }
}

uint64_t sub_100018DF0(uint64_t a1)
{
  uint64_t v1;
  _QWORD block[7];
  _QWORD v4[3];
  int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 2;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  v5 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_100018EA8;
  block[3] = &unk_10002D588;
  block[4] = v4;
  block[5] = &v6;
  block[6] = a1;
  dispatch_sync((dispatch_queue_t)qword_100035870, block);
  v1 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(&v6, 8);
  return v1;
}

void sub_100018EA8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  char v17;

  if (sub_100006AF8("enable-rolld-dev1", (_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24), 0))
  {
    sub_10001595C("keybagd_iskeyrolling_block_invoke", CFSTR("nvram keyroll check failed"), v10, v11, v12, v13, v14, v15, a9);
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
    *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) != 0;
    sub_10001595C("keybagd_iskeyrolling_block_invoke", CFSTR("nvram keyroll check success"), v10, v11, v12, v13, v14, v15, v17);
    v16 = (_DWORD *)a1[6];
    if (v16)
      *v16 = *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  }
}

uint64_t sub_100018F54(int a1)
{
  uint64_t v1;
  _QWORD v3[5];
  int v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2000000000;
  v8 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_100018FEC;
  v3[3] = &unk_10002D5B0;
  v4 = a1;
  v3[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100035870, v3);
  v1 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v1;
}

uint64_t sub_100018FEC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100015C70();
  if ((_DWORD)result)
  {
    v3 = *(unsigned int *)(a1 + 40);
    if (!(_DWORD)v3)
      v3 = sub_100015958();
    result = (uint64_t)sub_10000EE68(v3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void sub_10001902C()
{
  dispatch_async((dispatch_queue_t)qword_100035870, &stru_10002D5F0);
}

void sub_100019040(id a1)
{
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[4];
  __int16 v27;
  char v28;

  v27 = 0;
  memset(v26, 0, sizeof(v26));
  v24 = 0;
  v25 = 0;
  v23 = 0;
  if (sub_10001224C((uint64_t)CFSTR("com.apple.mobile.keybagd.forgotten_passcode"), v1, v2, v3, v4, v5, v6, v7))
  {
    sub_10001595C("keybagd_forgottenPasscodeEvent_block_invoke", CFSTR("event already persisted"), v8, v9, v10, v11, v12, v13, v28);
  }
  else if (!aks_get_extended_device_state(4294967293, v26)
         && !aks_memento_get_state(4294967293, &v24))
  {
    v14 = ((unint64_t)((HIDWORD(v25) >> 5) & 1) << 32) | ((unint64_t)((HIDWORD(v25) >> 1) & 1) << 33);
    if (aks_get_seconds_since_passcode_change(4294967293, &v23))
    {
      v15 = 60;
    }
    else
    {
      v15 = (v23 / 0x15180);
      if ((v23 / 0x15180) >= 0x3B)
        v15 = 59;
    }
    if (sub_100011968(CFSTR("com.apple.mobile.keybagd.forgotten_passcode"), 0, v15 | v14))
      sub_10001595C("keybagd_forgottenPasscodeEvent_block_invoke", CFSTR("analytics_persist_event failed"), v16, v17, v18, v19, v20, v21, v22);
  }
}

BOOL sub_100019194(int a1, int a2, _DWORD *a3)
{
  uint64_t v6;
  int extended_device_state;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _OWORD v16[4];
  __int16 v17;

  LODWORD(v6) = sub_100015C70();
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  if (a1 == -1)
    v6 = v6;
  else
    v6 = -a1;
  if (a2)
    extended_device_state = aks_get_extended_device_state(v6, v16);
  else
    extended_device_state = aks_get_device_state(v6, v16);
  v14 = extended_device_state;
  if (extended_device_state)
  {
    sub_10001595C("keybagd_getDeviceLockState", CFSTR("aks_get_device_state/aks_get_extended_device_state failed with %d"), v8, v9, v10, v11, v12, v13, extended_device_state);
  }
  else if (a3)
  {
    *a3 = DWORD1(v16[0]);
  }
  return v14 == 0;
}

BOOL sub_10001925C(int a1, _DWORD *a2)
{
  uint64_t v4;
  int extended_device_state;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _OWORD v14[4];
  __int16 v15;

  v15 = 0;
  memset(v14, 0, sizeof(v14));
  LODWORD(v4) = sub_100015C70();
  if (a1 == -1)
    v4 = v4;
  else
    v4 = -a1;
  extended_device_state = aks_get_extended_device_state(v4, v14);
  v12 = extended_device_state;
  if (extended_device_state)
    sub_10001595C("keybagd_getDeviceExtendedState", CFSTR("aks_get_extended_device_state failed with %d"), v6, v7, v8, v9, v10, v11, extended_device_state);
  else
    *a2 = v14[0];
  return v12 == 0;
}

uint64_t sub_100019308(const UInt8 *a1, CFIndex a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFData *v10;
  const __CFData *v11;
  CFIndex Length;
  UInt8 *BytePtr;
  size_t v14;
  _QWORD v16[6];
  _QWORD v17[3];
  char v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2000000000;
  v18 = 0;
  if (sub_1000108A4())
  {
    sub_10001595C("keybagd_SeshatEnroll", CFSTR("not enrolling in multiuser"), v4, v5, v6, v7, v8, v9, v16[0]);
  }
  else if (a1)
  {
    v10 = CFDataCreate(kCFAllocatorDefault, a1, a2);
    if (v10)
    {
      v11 = v10;
      if (CFDataGetLength(v10) >= 1)
      {
        Length = CFDataGetLength(v11);
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 0x40000000;
        v16[2] = sub_10001943C;
        v16[3] = &unk_10002D618;
        v16[4] = v17;
        v16[5] = CFDataCreateMutableCopy(0, Length, v11);
        dispatch_async((dispatch_queue_t)qword_100035870, v16);
      }
      if (CFDataGetBytePtr(v11))
      {
        BytePtr = (UInt8 *)CFDataGetBytePtr(v11);
        v14 = CFDataGetLength(v11);
        bzero(BytePtr, v14);
        CFRelease(v11);
      }
    }
  }
  _Block_object_dispose(v17, 8);
  return 0;
}

void sub_10001943C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  unint64_t v29;
  int v30;
  unsigned int v31;
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
  unint64_t v46;
  const __CFData *v47;
  const UInt8 *BytePtr;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  CFDataRef v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const __CFData *v78;
  const UInt8 *v79;
  const __CFData *v80;
  CFIndex Length;
  const __CFData *v82;
  const UInt8 *v83;
  const __CFData *v84;
  CFIndex v85;
  const UInt8 *v86;
  CFIndex v87;
  char v88;
  const UInt8 *v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const __CFData *v99;
  const __CFData *v100;
  const UInt8 *v101;
  const __CFData *v102;
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
  const __CFData *v113;
  const UInt8 *v114;
  const __CFData *v115;
  uint64_t v116;
  int v117;
  const __CFString *v118;
  __CFData *v119;
  const __CFString *v120;
  char v121;
  char v122;
  char v123;
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  _QWORD v128[2];
  uint64_t v129;
  uint64_t v130;
  CFTypeRef cf;
  CFDataRef theData;
  const __CFData *v133;
  CFRange v134;

  v133 = 0;
  cf = 0;
  theData = 0;
  v129 = 0;
  v130 = 0;
  v128[0] = 0;
  v128[1] = 0;
  if (!*(_QWORD *)(a1 + 40))
  {
    v120 = CFSTR("no passcode");
LABEL_75:
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", v120, a3, a4, a5, a6, a7, a8, v121);
    goto LABEL_76;
  }
  sub_1000064A4();
  if ((sub_10001E250() & 1) == 0)
  {
    v120 = CFSTR("Seshat is disabled");
    goto LABEL_75;
  }
  sleep(5u);
  v9 = sub_10001D740(1, (uint64_t)&stru_10002D808, &v129);
  sub_100006564(v9, 1);
  sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("Seshat preflight = %llx (%llx)"), v10, v11, v12, v13, v14, v15, v9);
  v127 = v9;
  sub_100012D40((unsigned int *)&v127, v16, v17, v18, v19, v20, v21, v22, v122);
  if ((v129 & 1) == 0)
  {
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("v1 preflight failed %llx"), v23, v24, v25, v26, v27, v28, v9);
    goto LABEL_76;
  }
  if (MGGetBoolAnswer(CFSTR("InternalBuild")))
    v29 = ((unint64_t)sub_10001D6A8() >> 11) & 1;
  else
    LOBYTE(v29) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v29;
  v30 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v31 = sub_100006FD4();
  if (v30)
  {
    if (v31 >= 2)
    {
      sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("bad user experience = %u"), v33, v34, v35, v36, v37, v38, v31);
LABEL_76:
      v55 = 0;
      goto LABEL_56;
    }
  }
  else
  {
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("ignoring recovery count (%d)"), v33, v34, v35, v36, v37, v38, v31);
  }
  v130 = sub_10001C8D8(65000, v32, v33, v34, v35, v36, v37, v38);
  if (!v130)
  {
    v120 = CFSTR("CreateSession() failed");
    goto LABEL_75;
  }
  v46 = sub_10001CC8C((id *)&v130, 0, 238, 0, (CFTypeRef *)&v133, (uint64_t)&v129 + 4);
  if (v46 != 0x900000000000)
  {
    v121 = v46;
    v120 = CFSTR("allocateSlot() -> 0x%x:0x%x");
    goto LABEL_75;
  }
  v47 = *(const __CFData **)(a1 + 40);
  if (v47)
  {
    BytePtr = CFDataGetBytePtr(v47);
    v47 = *(const __CFData **)(a1 + 40);
    if (v47)
      LODWORD(v47) = CFDataGetLength(v47);
  }
  else
  {
    BytePtr = 0;
  }
  v55 = sub_10001D610((CFDataRef)BytePtr, (int)v47, a3, a4);
  if (!v55)
  {
    v118 = CFSTR("failed to derive SE passcode");
    goto LABEL_55;
  }
  v56 = sub_10001CE00((id *)&v130, 0, (uint64_t)v55, (CFTypeRef *)&theData, (uint64_t)&v129 + 4, (uint64_t)v128);
  if (v56 != 0x900000000000)
  {
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("derive() -> 0x%x:0x%x"), v57, v58, v59, v60, v61, v62, v56);
    goto LABEL_56;
  }
  v63 = sub_10001CE00((id *)&v130, 0, (uint64_t)v55, &cf, (uint64_t)&v129 + 4, (uint64_t)v128);
  if (v63 != 0x900000000000)
  {
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("derive2() -> 0x%x:0x%x"), v64, v65, v66, v67, v68, v69, v63);
    goto LABEL_56;
  }
  if (!CFEqual(theData, cf))
  {
    v118 = CFSTR("se-sec comparisson failed");
    goto LABEL_55;
  }
  v70 = sub_10001D084((id *)&v130, 0, (uint64_t)v133, (uint64_t)&v129 + 4, v51, v52, v53, v54);
  if (v70 != 0x900000000000)
  {
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("resetCounter() -> 0x%x:0x%x"), v71, v72, v73, v74, v75, v76, v70);
    goto LABEL_56;
  }
  v77 = sub_100015C70();
  v78 = *(const __CFData **)(a1 + 40);
  if (!v78)
  {
    v83 = 0;
    v79 = 0;
LABEL_29:
    Length = 0;
    goto LABEL_30;
  }
  v79 = CFDataGetBytePtr(v78);
  v80 = *(const __CFData **)(a1 + 40);
  if (!v80)
  {
    v83 = 0;
    goto LABEL_29;
  }
  Length = CFDataGetLength(v80);
  v82 = *(const __CFData **)(a1 + 40);
  if (v82)
  {
    v83 = CFDataGetBytePtr(v82);
    v84 = *(const __CFData **)(a1 + 40);
    if (v84)
    {
      v85 = CFDataGetLength(v84);
      goto LABEL_31;
    }
  }
  else
  {
    v83 = 0;
  }
LABEL_30:
  v85 = 0;
LABEL_31:
  if (theData)
  {
    v86 = CFDataGetBytePtr(theData);
    if (theData)
    {
      v87 = CFDataGetLength(theData);
      goto LABEL_36;
    }
  }
  else
  {
    v86 = 0;
  }
  v87 = 0;
LABEL_36:
  v88 = (char)v133;
  if (v133)
  {
    v89 = CFDataGetBytePtr(v133);
    v88 = (char)v133;
    if (v133)
      v88 = CFDataGetLength(v133);
  }
  else
  {
    v89 = 0;
  }
  v124 = v88;
  v90 = aks_change_secret_se(v77, v79, Length, v83, v85, v86, v87, v89);
  sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("attempting upgrade to v2"), v91, v92, v93, v94, v95, v96, v124);
  v126 = 0;
  v98 = sub_100015C70();
  v99 = v133;
  v100 = *(const __CFData **)(a1 + 40);
  if (v100)
  {
    v101 = CFDataGetBytePtr(v100);
    v102 = *(const __CFData **)(a1 + 40);
    if (v102)
    {
      v103 = (int)CFDataGetLength(v102);
      goto LABEL_45;
    }
  }
  else
  {
    v101 = 0;
  }
  v103 = 0;
LABEL_45:
  if (sub_100005CF0(v98, 0, v99, (id *)&v130, (uint64_t)v101, v103, (unint64_t *)&v126, v97))
  {
    v104 = v126;
    sub_100006564(v126, 1);
    v125 = v104;
    sub_100012D40((unsigned int *)&v125, v105, v106, v107, v108, v109, v110, v111, v121);
  }
  if (v90)
  {
    v118 = CFSTR("aks_change_secret_se() failed");
    goto LABEL_55;
  }
  v112 = sub_100015C70();
  v113 = *(const __CFData **)(a1 + 40);
  if (!v113)
  {
    v114 = 0;
    goto LABEL_52;
  }
  v114 = CFDataGetBytePtr(v113);
  v115 = *(const __CFData **)(a1 + 40);
  if (!v115)
  {
LABEL_52:
    v116 = 0;
    goto LABEL_53;
  }
  v116 = (int)CFDataGetLength(v115);
LABEL_53:
  v117 = aks_change_secret_epilogue(v112, v114, v116);
  if (!v117)
  {
    v118 = CFSTR("success enroll");
LABEL_55:
    sub_10001595C("keybagd_SeshatEnroll_block_invoke", v118, v49, v50, v51, v52, v53, v54, v121);
    goto LABEL_56;
  }
  sub_10001595C("keybagd_SeshatEnroll_block_invoke", CFSTR("aks_change_secret_epilogue() failed %x"), v49, v50, v51, v52, v53, v54, v117);
LABEL_56:
  if (v133)
    CFRelease(v133);
  if (theData)
    CFRelease(theData);
  if (cf)
    CFRelease(cf);
  if (v55)
    CFRelease(v55);
  v119 = *(__CFData **)(a1 + 40);
  if (v119)
  {
    v134.length = CFDataGetLength(*(CFDataRef *)(a1 + 40));
    v134.location = 0;
    CFDataDeleteBytes(v119, v134);
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
  if (v130)
    sub_10001C8E4((id *)&v130, v39, v40, v41, v42, v43, v44, v45, v123);
}

uint64_t sub_1000199C0(UInt8 *bytes, CFIndex length, int a3, char a4, uint64_t a5, uint64_t a6)
{
  const __CFData *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFData *v18;
  id v19;
  id *v20;
  unint64_t v21;
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
  const UInt8 *v37;
  int v38;
  const __CFString *v39;
  char v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  const UInt8 *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const __CFData *v67;
  const UInt8 *v68;
  int v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const __CFData *v80;
  UInt8 *v81;
  size_t v82;
  const void *v83;
  uint64_t v84;
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
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const UInt8 *BytePtr;
  CFIndex v106;
  uint64_t v107;
  char v108;
  char v109;
  _QWORD block[12];
  char v111;
  char v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  CFDataRef v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  char v124;
  _QWORD v125[4];
  _QWORD v126[4];
  uint64_t v127;
  id *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  int v134;
  unint64_t v135;
  unint64_t v136;
  uint64_t v137;
  char v138;
  uint64_t v139;
  const __CFData *v140;
  char v141;
  uint64_t v142;
  CFDataRef v143;
  CFDataRef v144;

  v131 = 0;
  v132 = &v131;
  v133 = 0x2000000000;
  v134 = -536870194;
  v127 = 0;
  v128 = (id *)&v127;
  v129 = 0x2000000000;
  v130 = 0;
  v126[0] = 0;
  v126[1] = v126;
  v126[2] = 0x2000000000;
  v126[3] = 0;
  v125[0] = 0;
  v125[1] = v125;
  v125[2] = 0x2000000000;
  v125[3] = 0;
  v121 = 0;
  v122 = &v121;
  v123 = 0x2000000000;
  v124 = 0;
  v117 = 0;
  v118 = &v117;
  v119 = 0x2000000000;
  v120 = 1;
  v113 = 0;
  v114 = &v113;
  v115 = 0x2000000000;
  v116 = 0;
  v116 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  v10 = (const __CFData *)v114[3];
  if (!v10 || CFDataGetLength(v10) <= 0)
  {
    (*(void (**)(uint64_t, uint64_t))(a6 + 16))(a6, 4294967279);
    goto LABEL_33;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_10001A11C;
  block[3] = &unk_10002D640;
  v111 = a3;
  block[4] = &v117;
  block[5] = &v131;
  block[6] = &v113;
  block[7] = v126;
  block[8] = &v127;
  block[9] = v125;
  block[10] = &v121;
  block[11] = a5;
  v112 = a4;
  dispatch_sync((dispatch_queue_t)qword_100035878, block);
  (*(void (**)(uint64_t, _QWORD))(a6 + 16))(a6, *((unsigned int *)v132 + 6));
  if (*((_DWORD *)v132 + 6))
  {
    sub_10001595C("keybagd_SeshatUnlock", CFSTR("seshat unlock failed %d"), v11, v12, v13, v14, v15, v16, *((_BYTE *)v118 + 24));
    goto LABEL_33;
  }
  if (!*((_BYTE *)v118 + 24))
  {
    sub_10001595C("keybagd_SeshatUnlock", CFSTR("no reset needed"), v11, v12, v13, v14, v15, v16, v108);
    goto LABEL_33;
  }
  v17 = *((unsigned __int8 *)v122 + 24);
  v18 = (const __CFData *)v114[3];
  v143 = 0;
  v144 = 0;
  v142 = 0;
  v141 = -1;
  v139 = 0;
  v140 = 0;
  v20 = v128 + 3;
  v19 = v128[3];
  v138 = 0;
  if (!v19)
  {
    v39 = CFSTR("no session failed");
    goto LABEL_63;
  }
  if (!v18)
  {
    v39 = CFSTR("no passcode");
    goto LABEL_63;
  }
  v21 = sub_10001D428(v20, (CFTypeRef *)&v140, (uint64_t)&v141, (uint64_t)&v142, (uint64_t)&v142 + 4);
  if (v21 != 0x900000000000)
  {
    sub_10001595C("seshat_reset", CFSTR("getData() -> 0x%x:0x%x"), v23, v24, v25, v26, v27, v28, v21);
LABEL_64:
    v139 = 0x100000002;
    sub_100013500(&v139, v97, v98, v99, v100, v101, v102, v103, v108);
    goto LABEL_27;
  }
  v137 = 1000 * ((HIDWORD(v142) + 999) / 0x3E8u);
  sub_1000133B8(&v137, v22, v23, v24, v25, v26, v27, v28, v108);
  if (CFDataGetBytePtr(v140)[v17] != 238 && (char)CFDataGetBytePtr(v140)[v17] < 0)
  {
    sub_10001595C("seshat_reset", CFSTR("slot is v%d"), v29, v30, v31, v32, v33, v34, 2);
    sleep(1u);
    v86 = sub_100015C70();
    if (sub_1000062B4(v86, &v144, &v143)
      || (sub_10001E2A4(2, HIDWORD(v142), v143, v88, v13, v14, v15, v16) & 1) == 0)
    {
      sub_10001595C("seshat_reset", CFSTR("cant fetch async sig or is invalid"), v87, v88, v13, v14, v15, v16, v108);
      if (v143)
      {
        CFRelease(v143);
        v143 = 0;
      }
      if (v144)
      {
        CFRelease(v144);
        v144 = 0;
      }
      v139 = 0x100000001;
      sub_100013500(&v139, v89, v90, v91, v92, v93, v94, v95, v109);
      v96 = sub_100015C70();
      if (sub_100006238(v96, 2, HIDWORD(v142)))
        goto LABEL_64;
      v104 = sub_100015C70();
      BytePtr = CFDataGetBytePtr(v18);
      v106 = CFDataGetLength(v18);
      if (a3)
      {
        if (aks_verify_password_memento(v104, BytePtr, v106, 0, 0))
        {
          v39 = CFSTR("cant verify passcode for memento");
          goto LABEL_63;
        }
      }
      else if (aks_verify_password(v104, BytePtr, v106, 0, 0))
      {
        v39 = CFSTR("cant verify passcode");
        goto LABEL_63;
      }
      v107 = sub_100015C70();
      if (sub_1000062B4(v107, &v144, 0))
      {
        v39 = CFSTR("cant fetch sig");
        goto LABEL_63;
      }
    }
    v40 = 1;
  }
  else
  {
    sub_10001595C("seshat_reset", CFSTR("slot is v%d"), v29, v30, v31, v32, v33, v34, 1);
    v35 = sub_100015C70();
    v36 = v35;
    if (a3)
    {
      v37 = CFDataGetBytePtr(v18);
      v38 = CFDataGetLength(v18);
      if (sub_1000069E4(v36, (uint64_t)v37, v38, 0, &v144, 0))
      {
        v39 = CFSTR("KBGetSEStuffForMementoPasscode() -> failed");
LABEL_63:
        sub_10001595C("seshat_reset", v39, v11, v12, v13, v14, v15, v16, v108);
        goto LABEL_64;
      }
    }
    else if (sub_100006968(v35, &v138, &v144, 0))
    {
      v39 = CFSTR("KBGetSEStuff() failed");
      goto LABEL_63;
    }
    v40 = 0;
  }
  v41 = sub_10001D084(v20, v17, (uint64_t)v144, (uint64_t)&v142 + 4, v13, v14, v15, v16);
  if (v41 != 0x900000000000)
  {
    sub_10001595C("seshat_reset", CFSTR("resetCounter() -> 0x%x:0x%x"), v42, v43, v44, v45, v46, v47, v41);
    goto LABEL_64;
  }
  v48 = sub_10001D1B8(v20, 0, 238, 0, (uint64_t)&v142 + 4);
  v56 = HIDWORD(v48);
  if (v48 != 0x900000000000)
    sub_10001595C("seshat_reset", CFSTR("DeAuthorizeUpdate() -> 0x%x:0x%x"), v50, v51, v52, v53, v54, v55, v48);
  if ((a3 & 1) != 0)
    goto LABEL_27;
  if (((sub_10001E258() & 1) != 0 || v142 >= 0x65 && (v142 - 100) < HIDWORD(v142))
    && (v136 = ((unint64_t)(unsigned __int16)v56 << 40) | 0x500000000000018,
        sub_100012FAC(&v136, v49, v50, v51, v52, v53, v54, v55, v108),
        v57 = sub_100015C70(),
        v58 = CFDataGetBytePtr(v18),
        v59 = CFDataGetLength(v18),
        LODWORD(v57) = aks_se_recover(v57, v58, v59),
        sub_10001595C("seshat_reset", CFSTR("pre-emptive unbind from Seshat (0x%x:0x%x -> 0x%x)"), v60, v61, v62, v63, v64, v65, SBYTE4(v142)), !(_DWORD)v57))
  {
    v79 = sub_100015C70();
    sub_100006764(0, v79);
    if ((v40 & 1) == 0)
    {
LABEL_24:
      sub_10001595C("seshat_reset", CFSTR("attempting upgrade to v2"), v50, v51, v52, v53, v54, v55, v108);
      v136 = 0;
      v66 = sub_100015C70();
      v67 = v144;
      v68 = CFDataGetBytePtr(v18);
      v69 = CFDataGetLength(v18);
      if (sub_100005CF0(v66, v17, v67, v20, (uint64_t)v68, v69, &v136, v70))
      {
        v71 = v136;
        sub_100006564(v136, 1);
        v135 = v71;
        sub_100012D40((unsigned int *)&v135, v72, v73, v74, v75, v76, v77, v78, v108);
      }
    }
  }
  else if ((v40 & 1) == 0)
  {
    goto LABEL_24;
  }
LABEL_27:
  if (v144)
  {
    CFRelease(v144);
    v144 = 0;
  }
  if (v143)
  {
    CFRelease(v143);
    v143 = 0;
  }
  if (v140)
    CFRelease(v140);
LABEL_33:
  if (v128[3])
    sub_10001C8E4(v128 + 3, v49, v50, v51, v52, v53, v54, v55, v108);
  v80 = (const __CFData *)v114[3];
  if (v80)
  {
    if (CFDataGetBytePtr(v80))
    {
      v81 = (UInt8 *)CFDataGetBytePtr((CFDataRef)v114[3]);
      v82 = CFDataGetLength((CFDataRef)v114[3]);
      bzero(v81, v82);
      v83 = (const void *)v114[3];
      if (v83)
      {
        CFRelease(v83);
        v114[3] = 0;
      }
    }
  }
  v84 = *((unsigned int *)v132 + 6);
  _Block_object_dispose(&v113, 8);
  _Block_object_dispose(&v117, 8);
  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(v125, 8);
  _Block_object_dispose(v126, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  return v84;
}

void sub_10001A11C(uint64_t a1)
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
  const __CFData *v17;
  const UInt8 *v18;
  CFDataRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFDataRef v26;
  int v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  int v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  BOOL v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  const UInt8 *v47;
  const UInt8 *v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const __CFData *v57;
  const UInt8 *BytePtr;
  const __CFData *v59;
  CFIndex Length;
  const char *v61;
  uint32_t v62;
  int v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v66;
  const __CFData *v67;
  const UInt8 *v68;
  const __CFData *v69;
  CFIndex v70;
  int v71;
  uint64_t v72;
  const __CFData *v73;
  const UInt8 *v74;
  const __CFData *v75;
  CFIndex v76;
  const __CFData *v77;
  const UInt8 *v78;
  const __CFData *v79;
  CFIndex v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const UInt8 *v88;
  const __CFData *v89;
  CFIndex v90;
  const __CFData *v91;
  const UInt8 *v92;
  const __CFData *v93;
  CFIndex v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const __CFData *v103;
  const UInt8 *v104;
  const __CFData *v105;
  uint64_t v106;
  int v107;
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
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
  char v154;
  char v155;
  char v156;
  uint64_t v157;
  unint64_t v158;
  uint64_t v159;
  uint64_t v160;
  unsigned __int8 v161;
  int v162;
  int v163;
  unsigned int v164;
  CFDataRef theData;
  _BYTE buf[14];

  theData = 0;
  v163 = 1;
  v164 = 0;
  v162 = 0;
  v161 = 0;
  v159 = 0;
  v160 = 0;
  if (!*(_BYTE *)(a1 + 96))
  {
    v2 = sub_100015C70();
    if (!aks_get_lock_state(v2, &v162) && (v162 & 0x8000) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      v56 = sub_100015C70();
      v57 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v57)
      {
        BytePtr = CFDataGetBytePtr(v57);
        v59 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        if (v59)
        {
          Length = CFDataGetLength(v59);
          goto LABEL_110;
        }
      }
      else
      {
        BytePtr = 0;
      }
      Length = 0;
LABEL_110:
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = aks_unlock_device(v56, BytePtr, Length);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v153 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v153;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "aks_unlock_device() -> %d", buf, 8u);
      }
LABEL_112:
      v39 = 0;
      LODWORD(v40) = 0;
      v44 = 0;
      v42 = 0;
      goto LABEL_89;
    }
  }
  sub_1000064A4();
  sub_100010AB4(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = sub_10001C52C(9000, &v161, (uint64_t)&v159, v3, v4, v5, v6, v7);
  sub_100010ADC(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SeshatCreateSessionWithTimeout() -> %llu us", buf, 0xCu);
    }
    v17 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v17)
    {
      v18 = CFDataGetBytePtr(v17);
      v17 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v17)
        LODWORD(v17) = CFDataGetLength(v17);
    }
    else
    {
      v18 = 0;
    }
    v19 = sub_10001D610((CFDataRef)v18, (int)v17, v14, v15);
    if (v19)
    {
      v26 = v19;
      v27 = *(unsigned __int8 *)(a1 + 96);
      v28 = sub_100015C70();
      v29 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      if (v27)
      {
        if (sub_100006980(v28, v29, &v163))
        {
          v36 = CFSTR("KBGetMementoSESlot() failed");
LABEL_118:
          sub_10001595C("keybagd_SeshatUnlock_block_invoke", v36, v30, v31, v32, v33, v34, v35, v154);
          v42 = 0;
          v44 = 0;
          LODWORD(v40) = 0;
          v39 = 0;
          goto LABEL_88;
        }
      }
      else if (sub_100006968(v28, v29, 0, &v163))
      {
        v36 = CFSTR("KBGetSEStuff() failed");
        goto LABEL_118;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v37 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v37;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v163;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "got slot = %d, ver = %d", buf, 0xEu);
      }
      v38 = sub_10001CE00((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), (uint64_t)v26, (CFTypeRef *)&theData, (uint64_t)&v164, (uint64_t)&v159);
      v39 = v38;
      v40 = HIDWORD(v38);
      if ((_DWORD)v38)
        v41 = 0;
      else
        v41 = HIDWORD(v38) == 36864;
      v42 = !v41;
      v43 = *(unsigned __int8 *)(a1 + 96);
      if (!v41)
      {
        if (*(_BYTE *)(a1 + 96) || aks_se_stage_stash())
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_10001EC10(v39, v40);
          v42 = 0;
          v44 = 7;
          goto LABEL_88;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v61 = "staged SE stash";
          v62 = 2;
LABEL_54:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v61, buf, v62);
          goto LABEL_55;
        }
        goto LABEL_55;
      }
      v45 = sub_100015C70();
      v46 = (int)theData;
      if (v43)
      {
        if (theData)
        {
          v47 = CFDataGetBytePtr(theData);
          v46 = (int)theData;
          if (theData)
            v46 = CFDataGetLength(theData);
        }
        else
        {
          v47 = 0;
        }
        v49 = aks_se_set_secret_memento(v45, v47, v46);
      }
      else
      {
        if (theData)
        {
          v48 = CFDataGetBytePtr(theData);
          v46 = (int)theData;
          if (theData)
            v46 = CFDataGetLength(theData);
        }
        else
        {
          v48 = 0;
        }
        v49 = aks_se_set_secret(v45, v48, v46);
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v49;
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("aks_se_set_secret() -> %d"), v50, v51, v52, v53, v54, v55, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
        v42 = 0;
        v44 = 0;
        v39 = 0;
      }
      else
      {
        v63 = v163;
        v64 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
        if (v63 < 2)
        {
          if (!v64)
            goto LABEL_55;
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v63;
          v61 = "NOT prearming nonce %d";
          v62 = 8;
          goto LABEL_54;
        }
        if (v64)
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v63;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v164;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "prearming nonce %d,%u", buf, 0xEu);
        }
        v65 = sub_100015C70();
        if (!sub_100006238(v65, 2, v164))
        {
LABEL_55:
          if (*(_BYTE *)(a1 + 96))
          {
            v66 = sub_100015C70();
            v67 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            if (v67)
            {
              v68 = CFDataGetBytePtr(v67);
              v69 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              if (v69)
              {
                v70 = CFDataGetLength(v69);
                goto LABEL_65;
              }
            }
            else
            {
              v68 = 0;
            }
            v70 = 0;
LABEL_65:
            v77 = *(const __CFData **)(a1 + 88);
            if (v77)
            {
              v78 = CFDataGetBytePtr(v77);
              v79 = *(const __CFData **)(a1 + 88);
              if (v79)
              {
                v80 = CFDataGetLength(v79);
LABEL_70:
                v81 = aks_verify_password_memento(v66, v68, v70, v78, v80);
LABEL_85:
                *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v81;
                if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
                  sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("unlock(memento:%d, verify_only: %d) -> %d"), v82, v83, v84, v85, v86, v87, *(_BYTE *)(a1 + 96));
                v44 = 0;
                goto LABEL_88;
              }
            }
            else
            {
              v78 = 0;
            }
            v80 = 0;
            goto LABEL_70;
          }
          v71 = *(unsigned __int8 *)(a1 + 97);
          v72 = sub_100015C70();
          v73 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          if (v71)
          {
            if (v73)
            {
              v74 = CFDataGetBytePtr(v73);
              v75 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
              if (v75)
              {
                v76 = CFDataGetLength(v75);
                goto LABEL_76;
              }
            }
            else
            {
              v74 = 0;
            }
            v76 = 0;
LABEL_76:
            v91 = *(const __CFData **)(a1 + 88);
            if (v91)
            {
              v92 = CFDataGetBytePtr(v91);
              v93 = *(const __CFData **)(a1 + 88);
              if (v93)
              {
                v94 = CFDataGetLength(v93);
LABEL_81:
                v81 = aks_verify_password(v72, v74, v76, v92, v94);
                goto LABEL_85;
              }
            }
            else
            {
              v92 = 0;
            }
            v94 = 0;
            goto LABEL_81;
          }
          if (v73)
          {
            v88 = CFDataGetBytePtr(v73);
            v89 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
            if (v89)
            {
              v90 = CFDataGetLength(v89);
LABEL_84:
              v81 = aks_unlock_device(v72, v88, v90);
              goto LABEL_85;
            }
          }
          else
          {
            v88 = 0;
          }
          v90 = 0;
          goto LABEL_84;
        }
        v42 = 0;
        v44 = 0;
        v39 = 0;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1000;
      }
      LODWORD(v40) = 36864;
LABEL_88:
      CFRelease(v26);
      goto LABEL_89;
    }
    sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("failed to derive SE passcode"), v20, v21, v22, v23, v24, v25, v154);
    goto LABEL_112;
  }
  sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("SeshatCreateSessionWithTimeout() failed"), v8, v9, v10, v11, v12, v13, v154);
  v39 = 0;
  LODWORD(v40) = 0;
  v42 = 0;
  v44 = 2;
LABEL_89:
  if (theData)
    CFRelease(theData);
  if (v42)
  {
    v102 = sub_100015C70();
    v103 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v103)
    {
      v104 = CFDataGetBytePtr(v103);
      v105 = *(const __CFData **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      if (v105)
      {
        v106 = (int)CFDataGetLength(v105);
        goto LABEL_103;
      }
    }
    else
    {
      v104 = 0;
    }
    v106 = 0;
LABEL_103:
    v145 = aks_se_recover(v102, v104, v106);
    sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("stash driven unbind from Seshat (0x%x -> 0x%x)"), v146, v147, v148, v149, v150, v151, v164);
    if (!v145)
    {
      v152 = sub_100015C70();
      sub_100006764(0, v152);
    }
    return;
  }
  if ((_DWORD)v44)
  {
    v107 = v39 << 8;
    *(_QWORD *)buf = ((unint64_t)(v107 & 0xFF00 | (8 * sub_10001AA90()) | (32 * (_DWORD)v44) | ((_DWORD)v40 << 16) | 2) << 32) | 3;
    sub_100011968(CFSTR("com.apple.mobile.keybagd.seshat.report"), 0, *(uint64_t *)buf);
    sub_100013500(buf, v108, v109, v110, v111, v112, v113, v114, v154);
    sub_10001E21C(v40, v115, v116, v117, v118, v119, v120, v121);
    v158 = ((unint64_t)v160 << 8) | ((unint64_t)v161 << 6) | ((unint64_t)(unsigned __int16)v40 << 40) | (v44 << 56);
    sub_100012FAC(&v158, v122, v123, v124, v125, v126, v127, v128, v155);
    v157 = v159;
    sub_1000132A8(&v157, v129, v130, v131, v132, v133, v134, v135, v156);
    if (!*(_BYTE *)(a1 + 96))
    {
      sub_10001595C("keybagd_SeshatUnlock_block_invoke", CFSTR("Unable to unlock SE bound keybag -- requesting recovery 0x%x (0x%x)"), v136, v137, v138, v139, v140, v141, *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
      v142 = sub_100015C70();
      aks_se_fail(v142);
      v143 = sub_100015C70();
      if (!aks_get_lock_state(v143, &v162) && (v162 & 0x800) != 0)
      {
        v144 = sub_10001AA90();
        sub_100011968(CFSTR("com.apple.mobile.keybagd.seshat.report"), 0, ((unint64_t)((32 * (_DWORD)v44) | ((_DWORD)v40 << 16) | (v107 | (16 * v144)) & 0xFF10 | 2u) << 32) | 5);
      }
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536362987;
  }
  else if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *(_QWORD *)buf = 6;
    sub_100013500(buf, v95, v96, v97, v98, v99, v100, v101, v154);
  }
}

uint64_t sub_10001AA90()
{
  const __CFDictionary *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  char v12;

  v0 = sub_100011568();
  if (v0)
  {
    v7 = v0;
    v8 = (uint64_t)sub_100011060(v0);
    if (v8)
    {
      v9 = (const __CFString *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
      if (v9)
      {
        v10 = v9;
        if (CFStringCompare(v9, (CFStringRef)v8, 0))
          v8 = 2;
        else
          v8 = 1;
        CFRelease(v10);
      }
      else
      {
        v8 = 0;
      }
    }
    CFRelease(v7);
  }
  else
  {
    sub_10001595C("keybagd_has_current_build_seen_successful_se_unlocks", CFSTR("Can't load dict"), v1, v2, v3, v4, v5, v6, v12);
    return 0;
  }
  return v8;
}

uint64_t sub_10001AB30(UInt8 *bytes, CFIndex length)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFData *v8;
  const __CFData *v9;
  UInt8 *BytePtr;
  size_t v11;
  const void *v12;
  uint64_t v13;
  _QWORD v15[10];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  CFDataRef v19;
  _QWORD v20[3];
  char v21;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int v28;

  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = -536870194;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2000000000;
  v24[3] = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  v22[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  v21 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  v19 = CFDataCreate(kCFAllocatorDefault, bytes, length);
  v8 = (const __CFData *)v17[3];
  if (v8 && CFDataGetLength(v8) > 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 0x40000000;
    v15[2] = sub_10001AD14;
    v15[3] = &unk_10002D668;
    v15[4] = v23;
    v15[5] = v24;
    v15[6] = v22;
    v15[7] = &v16;
    v15[8] = v20;
    v15[9] = &v25;
    dispatch_sync((dispatch_queue_t)qword_100035878, v15);
  }
  else
  {
    sub_10001595C("keybagd_SeshatRecover", CFSTR("SE w/ empty"), v2, v3, v4, v5, v6, v7, v15[0]);
  }
  v9 = (const __CFData *)v17[3];
  if (v9)
  {
    if (CFDataGetBytePtr(v9))
    {
      BytePtr = (UInt8 *)CFDataGetBytePtr((CFDataRef)v17[3]);
      v11 = CFDataGetLength((CFDataRef)v17[3]);
      bzero(BytePtr, v11);
      v12 = (const void *)v17[3];
      if (v12)
      {
        CFRelease(v12);
        v17[3] = 0;
      }
    }
  }
  v13 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  return v13;
}

void sub_10001AD14(_QWORD *a1)
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
  const __CFData *v17;
  const UInt8 *BytePtr;
  const __CFData *v19;
  uint64_t Length;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFDataRef v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  unint64_t v37;
  uint64_t v38;
  const UInt8 *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const __CFData *v61;
  const UInt8 *v62;
  const __CFData *v63;
  CFIndex v64;
  const __CFData *v65;
  const UInt8 *v66;
  const __CFData *v67;
  CFIndex v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id *v76;
  uint64_t v77;
  char v78;
  const __CFString *v79;
  char v80;
  char v81;
  char v82;
  int v83;
  _QWORD v84[2];
  unsigned int v85;
  CFDataRef theData;

  theData = 0;
  v85 = 0;
  v84[0] = 0;
  v84[1] = 0;
  v83 = 1;
  sub_100010AB4(*(_QWORD *)(a1[4] + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sub_10001C8D8(65000, v2, v3, v4, v5, v6, v7, v8);
  sub_100010ADC(*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24), (_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  if (!*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("SeshatCreateSessionWithTimeout() failed"), v9, v10, v11, v12, v13, v14, v80);
    v49 = 0;
    v50 = 0;
    v27 = 0;
    v52 = 64;
    goto LABEL_47;
  }
  sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("SeshatCreateSessionWithTimeout() -> %llu us"), v9, v10, v11, v12, v13, v14, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v17 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (!v17)
  {
    BytePtr = 0;
    goto LABEL_6;
  }
  BytePtr = CFDataGetBytePtr(v17);
  v19 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (!v19)
  {
LABEL_6:
    Length = 0;
    goto LABEL_7;
  }
  Length = (int)CFDataGetLength(v19);
LABEL_7:
  v27 = sub_10001D610((CFDataRef)BytePtr, Length, v15, v16);
  if (v27)
  {
    v28 = sub_100015C70();
    if (!sub_100006968(v28, (_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24), 0, &v83))
    {
      sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("got slot = %d, ver = %d"), v21, v22, v23, v24, v25, v26, *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24));
      v29 = sub_10001CE00((id *)(*(_QWORD *)(a1[5] + 8) + 24), *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24), (uint64_t)v27, (CFTypeRef *)&theData, (uint64_t)&v85, (uint64_t)v84);
      v36 = v29;
      v37 = HIDWORD(v29);
      if (v29 != 0x900000000000)
      {
        sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("SE slot is not available. fail. derive() -> 0x%x:0x%x"), v30, v31, v32, v33, v34, v35, v29);
        v41 = sub_100015C70();
        aks_se_fail(v41);
        v49 = 0;
        v50 = v36 << 8;
        v51 = ((_DWORD)v37 << 16) | 2;
        v52 = 224;
        goto LABEL_33;
      }
      v38 = sub_100015C70();
      if (theData)
      {
        v39 = CFDataGetBytePtr(theData);
        if (theData)
        {
          v40 = (int)CFDataGetLength(theData);
          goto LABEL_16;
        }
      }
      else
      {
        v39 = 0;
      }
      v40 = 0;
LABEL_16:
      v51 = -1879048190;
      *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = aks_se_set_secret(v38, v39, v40);
      if (*(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24))
      {
        sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("aks_se_set_secret() -> %d"), v53, v54, v55, v56, v57, v58, *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
        goto LABEL_31;
      }
      if (v83 < 2)
      {
        sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("NOT prearming nonce %d"), v53, v54, v55, v56, v57, v58, v83);
      }
      else
      {
        sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("prearming nonce %d"), v53, v54, v55, v56, v57, v58, v83);
        v59 = sub_100015C70();
        if (sub_100006238(v59, 2, v85))
        {
          v52 = 0;
          v50 = 0;
          *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = -1000;
LABEL_32:
          v49 = 1;
          goto LABEL_33;
        }
      }
      v60 = sub_100015C70();
      v61 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
      if (v61)
      {
        v62 = CFDataGetBytePtr(v61);
        v63 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
        if (v63)
        {
          v64 = CFDataGetLength(v63);
          v65 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
          if (v65)
          {
            v66 = CFDataGetBytePtr(v65);
            v67 = *(const __CFData **)(*(_QWORD *)(a1[7] + 8) + 24);
            if (v67)
            {
              v68 = CFDataGetLength(v67);
LABEL_30:
              *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = aks_change_secret(v60, v62, v64, v66, v68, 0, 0);
              sub_10001595C("keybagd_SeshatRecover_block_invoke", CFSTR("recovery start -> 0x%x"), v69, v70, v71, v72, v73, v74, *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24));
LABEL_31:
              v52 = 0;
              v50 = 0;
              goto LABEL_32;
            }
          }
          else
          {
            v66 = 0;
          }
LABEL_29:
          v68 = 0;
          goto LABEL_30;
        }
        v66 = 0;
      }
      else
      {
        v66 = 0;
        v62 = 0;
      }
      v64 = 0;
      goto LABEL_29;
    }
    v79 = CFSTR("KBGetSEStuff() failed");
  }
  else
  {
    v79 = CFSTR("failed to derive SE passcode");
  }
  sub_10001595C("keybagd_SeshatRecover_block_invoke", v79, v21, v22, v23, v24, v25, v26, v81);
  v52 = 0;
  v50 = 0;
  v49 = 1;
LABEL_47:
  v51 = 2;
LABEL_33:
  v75 = *(_QWORD *)(a1[5] + 8);
  v77 = *(_QWORD *)(v75 + 24);
  v76 = (id *)(v75 + 24);
  if (v77)
  {
    sub_10001C8E4(v76, v42, v43, v44, v45, v46, v47, v48, v82);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 0;
  }
  if ((v49 & 1) == 0)
  {
    v78 = sub_10001AA90();
    sub_100011968(CFSTR("com.apple.mobile.keybagd.seshat.report"), 0, ((unint64_t)(v51 | v52 | v50 | (16 * (v78 & 1u))) << 32) | 5);
  }
  if (v27)
    CFRelease(v27);
  if (theData)
    CFRelease(theData);
}

uint64_t sub_10001B184(int a1)
{
  uint64_t v1;
  char v2;
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
  char v23;
  char v24;
  uint64_t v25;

  v1 = a1;
  v2 = sub_10001D694(a1);
  sub_10001595C("keybagd_SeshatDebug", CFSTR("Posting analyitcs"), v3, v4, v5, v6, v7, v8, v23);
  v25 = v1;
  sub_10001268C(&v25, v9, v10, v11, v12, v13, v14, v15, v24);
  sub_10001595C("keybagd_SeshatDebug", CFSTR("Seshat Debug changed from 0x%llx to 0x%llx"), v16, v17, v18, v19, v20, v21, v2);
  return 0;
}

void sub_10001B1F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  time_t v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  char v26;

  if (sub_100015D04())
  {
    v9 = time(0);
    sub_10001C3E8(v9);
    return;
  }
  v10 = sub_100011568();
  if (v10)
  {
    v17 = v10;
    v18 = time(0);
    if (sub_100011194(v17, v18))
    {
      v25 = CFSTR("failed to set TTR");
    }
    else
    {
      if (!sub_100011944(v17))
      {
LABEL_6:
        CFRelease(v17);
        return;
      }
      v25 = CFSTR("failed to serialize plist");
    }
    sub_10001595C("KBSeshatRequestTTR", v25, v19, v20, v21, v22, v23, v24, v26);
    goto LABEL_6;
  }
  sub_10001595C("KBSeshatRequestTTR", CFSTR("failed to get dict"), v11, v12, v13, v14, v15, v16, a9);
}

void sub_10001B2A0(char a1)
{
  if ((a1 & 1) != 0)
  {
    if ((a1 & 2) != 0)
      dispatch_sync((dispatch_queue_t)qword_100035878, &stru_10002D870);
    sub_100012340();
  }
  if ((a1 & 4) != 0)
    sub_100016D10(0, 0);
}

void sub_10001B2F4(id a1)
{
  BOOL v1;
  uint64_t v2;
  uint64_t v3;
  char *__endptr;
  char *__str;
  int v6;

  v6 = 0;
  __endptr = 0;
  __str = 0;
  if (sub_100006AF8("seshat-debug", &v6, &__str))
    v1 = 1;
  else
    v1 = __str == 0;
  if (!v1)
  {
    *__error() = 0;
    v2 = strtoll(__str, &__endptr, 16);
    if (*__str)
    {
      if (!*__endptr)
      {
        v3 = v2;
        if (*__error() != 34)
        {
          fprintf(__stdoutp, "******** setting debug to 0x%llx", v3);
          sub_10001D694(v3);
        }
      }
    }
  }
  free(__str);
}

void sub_10001B3B0(id a1)
{
  uint64_t v1;
  int lock_state;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;

  v20 = 0;
  v1 = sub_100015C70();
  lock_state = aks_get_lock_state(v1, &v20);
  v9 = v20;
  if (lock_state || (v20 & 0xA000) != 0x2000)
    goto LABEL_8;
  if ((sub_1000063AC() & 1) == 0)
  {
    v9 = v20;
LABEL_8:
    sub_10001595C("seshat_init_block_invoke_2", CFSTR("not se entangled or been unlocked or unsupported, not prewarming state: 0x%x"), v3, v4, v5, v6, v7, v8, v9);
    goto LABEL_9;
  }
  v18 = 0;
  v19 = 0;
  sub_100010AB4((uint64_t)&v19);
  v10 = sub_10001CAF4();
  sub_100010ADC(v19, &v18);
  v17 = "failure";
  if (v10)
    v17 = "success";
  sub_10001595C("seshat_init_block_invoke_2", CFSTR("SeshatPreWarm(%s) -> %llu us, state: 0x%x"), v11, v12, v13, v14, v15, v16, (char)v17);
LABEL_9:
  sub_10001B480(0);
}

void sub_10001B480(const __CFDictionary *a1)
{
  const __CFDictionary *v1;
  const __CFArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  char v11;

  if (a1)
  {
    v1 = a1;
    CFRetain(a1);
  }
  else
  {
    v1 = sub_100011568();
    if (!v1)
      return;
  }
  v2 = sub_100011440(v1);
  if (v2 && CFArrayGetCount(v2) > 13)
  {
    if (sub_1000110AC(v1))
    {
      v10 = CFSTR("health data contains failures");
    }
    else
    {
      v9 = sub_100015C70();
      v11 = aks_se_set_healthy(v9);
      v10 = CFSTR("setting healthy indicator 0x%x");
    }
  }
  else
  {
    v10 = CFSTR("not enough health data");
  }
  sub_10001595C("seshat_evaluate_health_plist", v10, v3, v4, v5, v6, v7, v8, v11);
  CFRelease(v1);
}

void sub_10001B53C(id a1, _xpc_activity_s *a2)
{
  xpc_activity_state_t state;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  int v19;
  int lock_state;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  xpc_object_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  char v44;
  char v45;
  _QWORD block[4];
  int v47;
  int v48;
  int v49;
  char v50;
  uint64_t v51;
  int v52;
  char v53;

  state = xpc_activity_get_state(a2);
  if (state == 2)
  {
    sub_10001595C("data_analytics_init_block_invoke", CFSTR("data analytics activity"), v4, v5, v6, v7, v8, v9, v44);
    v49 = 0;
    v18 = sub_100015C70();
    v19 = v18;
    lock_state = aks_get_lock_state(v18, &v49);
    if (lock_state)
    {
      sub_10001595C("data_analytics_init_block_invoke", CFSTR("get_lock_state() -> 0x%x"), v21, v22, v23, v24, v25, v26, lock_state);
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_10001B75C;
      block[3] = &unk_10002D748;
      v47 = v19;
      v48 = v49;
      dispatch_sync((dispatch_queue_t)qword_100035878, block);
      if ((v49 & 0x2000) != 0)
        sub_10001595C("data_analytics_init_block_invoke", CFSTR("Keybag is bound to SE - not collecting health data"), v29, v30, v31, v32, v33, v34, v45);
      else
        dispatch_sync((dispatch_queue_t)qword_100035878, &stru_10002D788);
      v50 = 0;
      v51 = (v49 & 2) == 0;
      if ((v49 & 2) == 0)
        HIDWORD(v51) = sub_100010B98();
      v35 = sub_100010D48(&v50);
      if (v50)
        v43 = 1;
      else
        v43 = 2;
      if (v35)
        v43 = 0;
      v52 = v43;
      sub_100012560((char *)&v51, v36, v37, v38, v39, v40, v41, v42, v45);
    }
  }
  else if (!state)
  {
    sub_10001595C("data_analytics_init_block_invoke", CFSTR("Checking in for data analytics"), v4, v5, v6, v7, v8, v9, v44);
    v10 = xpc_activity_copy_criteria(a2);
    if (v10)
    {
      xpc_release(v10);
      v17 = CFSTR("activity criteria already set");
    }
    else
    {
      v27 = xpc_dictionary_create(0, 0, 0);
      if ((sub_10001D6A8() & 0x80) != 0)
        v28 = 30;
      else
        v28 = 3600;
      xpc_dictionary_set_int64(v27, XPC_ACTIVITY_INTERVAL, v28);
      xpc_dictionary_set_string(v27, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_BOOL(v27, XPC_ACTIVITY_ALLOW_BATTERY, 1);
      xpc_activity_set_criteria(a2, v27);
      xpc_release(v27);
      v17 = CFSTR("set activity criteria");
    }
    sub_10001595C("data_analytics_init_block_invoke", v17, v11, v12, v13, v14, v15, v16, v53);
  }
}

void sub_10001B75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  int v10;
  __int16 v11;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFDictionary *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  const UInt8 *BytePtr;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const UInt8 *v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  const __CFString *v50;
  char v51;
  CFTypeRef cf;
  __int16 v53[7];
  char v54;
  CFDataRef theData;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;

  v9 = *(unsigned int *)(a1 + 32);
  v10 = *(_DWORD *)(a1 + 36);
  cf = 0;
  *(_QWORD *)v53 = 0;
  if ((v10 & 2) != 0)
  {
    sub_10001595C("report_seshat_usage", CFSTR("report: cond 1 not satisified"), a3, a4, a5, a6, a7, a8, a9);
    return;
  }
  if (sub_10001DED0())
    v11 = 16387;
  else
    v11 = 3;
  v12 = sub_100011568();
  v20 = v12;
  if (v12)
    v11 |= (sub_1000110AC(v12) != 0) << 15;
  v53[0] = v11;
  if ((v10 & 0x2000) == 0)
  {
    sub_1000129D4(v53, v13, v14, v15, v16, v17, v18, v19, v51);
    if (!v20)
      return;
    goto LABEL_28;
  }
  v21 = sub_100015C70();
  v57 = 0;
  v58 = 0;
  v56 = 0;
  theData = 0;
  v54 = -1;
  if (sub_100006968(v21, &v56, 0, 0))
  {
    v50 = CFSTR("KBGetSEStuff() failed");
LABEL_34:
    sub_10001595C("is_slot_v2", v50, v23, v24, v25, v26, v27, v28, v51);
    LOWORD(v38) = 0;
    v40 = 0;
    goto LABEL_17;
  }
  v58 = sub_10001C8D8(65000, v22, v23, v24, v25, v26, v27, v28);
  if (!v58)
  {
    v50 = CFSTR("unable to create a sesssion");
    goto LABEL_34;
  }
  v29 = sub_10001D428((id *)&v58, (CFTypeRef *)&theData, (uint64_t)&v54, (uint64_t)&v57, (uint64_t)&v57 + 4);
  if (v29 != 0x900000000000)
  {
    v51 = v29;
    v50 = CFSTR("getData() -> 0x%x:0x%x");
    goto LABEL_34;
  }
  BytePtr = CFDataGetBytePtr(theData);
  if (BytePtr[v56] == 238)
  {
    LOWORD(v38) = 0;
  }
  else
  {
    v39 = CFDataGetBytePtr(theData);
    v38 = (v39[v56] >> 5) & 4;
  }
  v40 = 1;
LABEL_17:
  if (v58)
    sub_10001C8E4((id *)&v58, v31, v32, v33, v34, v35, v36, v37, v51);
  if (theData)
    CFRelease(theData);
  if ((v40 & 1) == 0)
  {
    sub_10001595C("report_seshat_usage", CFSTR("unable to determine slot version"), v32, v33, v34, v35, v36, v37, v51);
    if (!v20)
      return;
    goto LABEL_28;
  }
  if (aks_get_configuration(v9, &cf))
  {
    LOWORD(v48) = v53[0];
  }
  else
  {
    v49 = sub_100010100((const __CFDictionary *)cf, kAKSConfigRecoveryFlags);
    v48 = v53[0] & 0xC3FF | (((v49 >> 3) & 1) << 10) & 0xFFFFC7FF | ((v49 & 1) << 11) & 0xCFFF | (((v49 >> 2) & 1) << 13) | (((v49 >> 1) & 1) << 12);
  }
  v53[0] = v48 & 0xFFC3 | v38;
  sub_100012780(v53, v41, v42, v43, v44, v45, v46, v47, v51);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v20)
LABEL_28:
    CFRelease(v20);
}

void sub_10001B9A8(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  time_t v15;
  char v16;
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
  const __CFDictionary *v36;
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
  time_t v56;
  const __CFString *v57;
  char v58;
  char v59;
  char v60;
  uint64_t v61;
  time_t v62;
  int v63;
  char v64;

  v63 = 0;
  if ((sub_1000063AC() & 1) == 0)
  {
    sub_10001595C("collect_seshat_health_data", CFSTR("unsupported"), v1, v2, v3, v4, v5, v6, v64);
    return;
  }
  v7 = sub_100011568();
  if (v7)
  {
    v8 = v7;
    v62 = (time_t)sub_100011350(v7);
    if (v62)
    {
      if ((sub_10001D6A8() & 0x80) != 0)
      {
        sub_10001595C("collect_seshat_health_data", CFSTR("skipping interval check"), v9, v10, v11, v12, v13, v14, v58);
      }
      else
      {
        v15 = time(0);
        v16 = ctime(&v62);
        sub_10001595C("collect_seshat_health_data", CFSTR("last entry ran = %s"), v17, v18, v19, v20, v21, v22, v16);
        if (v15 - 86400 < v62)
        {
          sub_10001595C("collect_seshat_health_data", CFSTR("not enough time has passed since last check (last:%zd, now:%zd)"), v23, v24, v25, v26, v27, v28, v62);
LABEL_19:
          CFRelease(v8);
          return;
        }
      }
    }
    CFRelease(v8);
    v29 = sub_10001D740(0, (uint64_t)&stru_10002D808, &v63);
    if (sub_10001E268(v29))
    {
      sub_10001595C("collect_seshat_health_data", CFSTR("not recording transient errors in health plist"), v30, v31, v32, v33, v34, v35, v58);
      return;
    }
    v36 = sub_100011568();
    if (v36)
    {
      v8 = v36;
      sub_100006564(v29, 0);
      sub_10001595C("collect_seshat_health_data", CFSTR("preflight -> %llx (%llx)"), v37, v38, v39, v40, v41, v42, v29);
      v61 = v29;
      sub_100012D40((unsigned int *)&v61, v43, v44, v45, v46, v47, v48, v49, v59);
      if (v29 && (v63 & 1) == 0)
      {
        if (sub_100011118(v8, v29))
        {
          v57 = CFSTR("failed to set fail indicator");
          goto LABEL_18;
        }
        sub_10001595C("collect_seshat_health_data", CFSTR("saved failure in plist"), v50, v51, v52, v53, v54, v55, v60);
      }
      if (sub_100011454(v8, v29))
      {
        v57 = CFSTR("cant add to data");
      }
      else
      {
        v56 = time(0);
        if (sub_1000113BC(v8, v56))
        {
          v57 = CFSTR("cant set time");
        }
        else
        {
          sub_10001B480(v8);
          if (sub_100011944(v8))
            goto LABEL_19;
          v57 = CFSTR("saved data");
        }
      }
LABEL_18:
      sub_10001595C("collect_seshat_health_data", v57, v50, v51, v52, v53, v54, v55, v60);
      goto LABEL_19;
    }
  }
}

void sub_10001BBD0(id a1)
{
  int v1;

  v1 = 0;
  if (!aks_get_lock_state(4294967293, &v1) && (v1 & 2) != 0)
    sub_100012340();
}

BOOL sub_10001BC08(id a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v10;
  char v11;
  int v12;

  v12 = 0;
  v2 = sub_100015C70();
  if (aks_get_lock_state(v2, &v12))
  {
    v10 = CFSTR("no lock state");
LABEL_7:
    sub_10001595C("seshat_preflight_condition_block_invoke", v10, v3, v4, v5, v6, v7, v8, v11);
    return 0;
  }
  if ((v12 & 0x2000) != 0)
  {
    v10 = CFSTR("can't preflight, already bound to SE");
    goto LABEL_7;
  }
  return 1;
}

void sub_10001BC68(uint64_t a1)
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
  id *v16;
  uint64_t v17;
  unint64_t v18;
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
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  const __CFString *v49;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v54;
  char v55;
  int v56[2];
  CFDataRef theData;
  CFDataRef v58;
  CFDataRef v59;

  v58 = 0;
  v59 = 0;
  *(_QWORD *)v56 = 0;
  theData = 0;
  v55 = -1;
  if (sub_100006968(*(unsigned int *)(a1 + 72), (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0, 0))
  {
LABEL_21:
    v49 = CFSTR("KBGetSEStuff() failed");
    goto LABEL_25;
  }
  sub_100010AB4(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = sub_10001C8D8(65000, v8, v9, v10, v11, v12, v13, v14);
  sub_100010ADC(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(_QWORD *)(v15 + 24);
  v16 = (id *)(v15 + 24);
  if (!v17)
  {
    v49 = CFSTR("SeshatCreateSessionWithTimeout() failed");
    goto LABEL_25;
  }
  v18 = sub_10001D428(v16, (CFTypeRef *)&theData, (uint64_t)&v55, (uint64_t)v56, (uint64_t)&v56[1]);
  if (v18 != 0x900000000000)
  {
    sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", CFSTR("getData() -> 0x%x:0x%x"), v19, v20, v21, v22, v23, v24, v18);
    goto LABEL_9;
  }
  sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", CFSTR("got slot = %d, gwc = %d"), v19, v20, v21, v22, v23, v24, *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  v54 = 1000 * ((v56[1] + 999) / 0x3E8u);
  sub_1000133B8(&v54, v25, v26, v27, v28, v29, v30, v31, v51);
  if (CFDataGetBytePtr(theData)[*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)] == 238
    || ((char)CFDataGetBytePtr(theData)[*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)] & 0x80000000) == 0)
  {
    sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", CFSTR("slot is v1"), v32, v33, v34, v35, v36, v37, v52);
    if (!sub_100006968(*(unsigned int *)(a1 + 72), (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), &v59, 0))
    {
LABEL_7:
      v38 = sub_10001D084((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), (uint64_t)v59, (uint64_t)&v56[1], v4, v5, v6, v7);
      if (v38 == 0x900000000000)
      {
        sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", CFSTR("reset SEshat"), v2, v3, v4, v5, v6, v7, v50);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_9;
      }
      v50 = v38;
      v49 = CFSTR("resetCounter() -> 0x%x:0x%x");
      goto LABEL_25;
    }
    goto LABEL_21;
  }
  sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", CFSTR("slot is v2"), v32, v33, v34, v35, v36, v37, v52);
  if (sub_1000062B4(*(unsigned int *)(a1 + 72), &v59, &v58))
  {
    v49 = CFSTR("nothing to reset with");
  }
  else
  {
    if ((sub_10001E2A4(2, v56[1], v58, v3, v4, v5, v6, v7) & 1) != 0)
      goto LABEL_7;
    v49 = CFSTR("armed nonce is out of date");
  }
LABEL_25:
  sub_10001595C("seshat_reset_count_after_wc_recovery_block_invoke", v49, v2, v3, v4, v5, v6, v7, v50);
LABEL_9:
  if (v59)
  {
    CFRelease(v59);
    v59 = 0;
  }
  if (v58)
  {
    CFRelease(v58);
    v58 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  v46 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v48 = *(_QWORD *)(v46 + 24);
  v47 = (id *)(v46 + 24);
  if (v48)
    sub_10001C8E4(v47, v39, v40, v41, v42, v43, v44, v45, v53);
}

void sub_10001BF4C(id a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v1 = sub_100011568();
  if (v1)
  {
    v2 = v1;
    v3 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
    if (v3)
    {
      v10 = v3;
      if (sub_100011074(v2, v3))
        sub_10001595C("keybagd_update_last_unlocked_build_block_invoke", CFSTR("cant set build"), v11, v12, v13, v14, v15, v16, v17);
      else
        sub_100011944(v2);
      CFRelease(v10);
    }
    else
    {
      sub_10001595C("keybagd_update_last_unlocked_build_block_invoke", CFSTR("cant query MG"), v4, v5, v6, v7, v8, v9, v17);
    }
    CFRelease(v2);
  }
}

uint64_t sub_10001C0F0(uint64_t a1)
{
  NFHWMonitor *v2;
  unsigned int v3;
  unsigned int v4;
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
  char v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;

  v32 = 0;
  v31 = 0;
  if ((byte_100035959 & 1) == 0)
  {
    v29 = 0;
    v30 = 0;
    sub_100010AB4((uint64_t)&v30);
    v2 = objc_alloc_init(NFHWMonitor);
    objc_msgSend(objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager"), "registerEventListener:", v2);
    v3 = objc_msgSend(objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager"), "getHwSupport");
    if ((v3 & 0xFFFFFFFD) == 1)
    {
      LOBYTE(v31) = -[NFHWMonitor waitForNotificationOrTimeout:](v2, "waitForNotificationOrTimeout:", a1) != 0;
      v4 = objc_msgSend(objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager"), "getHwSupport");
    }
    else
    {
      v4 = v3;
    }
    objc_msgSend(objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager"), "unregisterEventListener:", v2);

    if (v4 == 5 || v4 == 2)
    {
      byte_100035958 = 1;
    }
    else
    {
      sub_10001595C("SeshatHWAvailable", CFSTR("getHwSupport=%d, prev=%d. timedout=%d, intepreting as unsupported."), v5, v6, v7, v8, v9, v10, v4);
      byte_100035958 = 0;
      byte_100035959 = 1;
      sub_10001B1F8(v11, v12, v13, v14, v15, v16, v17, v18, v28);
    }
    sub_100010ADC(v30, &v29);
    HIDWORD(v31) = v29 / 0xF4240;
    v32 = v4;
    sub_100012470((uint64_t)&v31, v19, v20, v21, v22, v23, v24, v25, v27);
  }
  return byte_100035958;
}

uint64_t sub_10001C24C()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_10001CDC4;
  v7 = sub_10001CDD4;
  v0 = qword_100035968;
  v8 = qword_100035968;
  if (!qword_100035968)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10001E378;
    v2[3] = &unk_10002CBE8;
    v2[4] = &v3;
    sub_10001E378((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001C2F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C310()
{
  uint64_t result;

  result = sub_10001C334();
  if ((_DWORD)result)
    return sub_10001C0F0(20);
  return result;
}

BOOL sub_10001C334()
{
  _BOOL8 result;
  __int128 v1;
  uint64_t v2;

  if (byte_100035978)
    return 1;
  if (!qword_100035970)
  {
    v1 = off_10002D968;
    v2 = 0;
    qword_100035970 = _sl_dlopen(&v1, 0);
  }
  if (qword_100035970)
    result = sub_10001C24C() != 0;
  else
    result = 0;
  byte_100035978 = result;
  return result;
}

void sub_10001C3E8(time_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  time_t v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v17 = a1;
  v1 = objc_autoreleasePoolPush();
  if (sub_10001C334())
  {
    sub_10001595C("SeshatTTR", CFSTR("requesting NF TTR"), v2, v3, v4, v5, v6, v7, v15);
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = sub_10001CDC4;
    v23 = sub_10001CDD4;
    v8 = (void *)qword_100035980;
    v24 = qword_100035980;
    if (!qword_100035980)
    {
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10001E470;
      v18[3] = &unk_10002CBE8;
      v18[4] = &v19;
      sub_10001E470((uint64_t)v18);
      v8 = (void *)v20[5];
    }
    _Block_object_dispose(&v19, 8);
    v16 = ctime(&v17);
    objc_msgSend(v8, "requestTapToRadar:preferences:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SesHat session failure on %s")), CFSTR("com.apple.keybagd.ttr"));
    sub_10001595C("SeshatTTR", CFSTR("requested NF TTR"), v9, v10, v11, v12, v13, v14, v16);
  }
  objc_autoreleasePoolPop(v1);
}

void sub_10001C514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C52C(int a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  dispatch_time_t v22;
  void *v23;
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
  char v35;
  char v36;
  char v37;
  _QWORD block[7];
  timespec __rqtp;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  void *v41;
  NSObject *v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  _QWORD v52[3];
  char v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  uint64_t v59;

  sub_10001C810(1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v35);
  v17 = 0;
  v18 = 1000000 * a1;
  do
  {
    if (v17)
    {
      __rqtp = (timespec)xmmword_100029110;
      nanosleep(&__rqtp, 0);
    }
    sub_10001595C("SeshatCreateSessionWithTimeoutVerbose", CFSTR("asking for session with timeout of %lld nsec (attempt: %d)"), v11, v12, v13, v14, v15, v16, v18);
    if (a3)
    {
      *(_QWORD *)a3 = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
    if (a2)
      *a2 = 0;
    v54 = 0;
    v55 = &v54;
    v56 = 0x3052000000;
    v57 = sub_10001CDC4;
    v58 = sub_10001CDD4;
    v59 = 0;
    v52[0] = 0;
    v52[1] = v52;
    v52[2] = 0x2020000000;
    v53 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x3052000000;
    v49 = sub_10001CDC4;
    v50 = sub_10001CDD4;
    v51 = 0;
    if (sub_10001C334() && (sub_10001C0F0(20) & 1) != 0 && (qword_100035960 & 0x100) == 0)
    {
      if (a2)
        *a2 = 0;
      if (qword_100035998 != -1)
        dispatch_once(&qword_100035998, &stru_10002D980);
      v19 = dispatch_semaphore_create(0);
      dispatch_retain(v19);
      v20 = objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager");
      __rqtp.tv_sec = (__darwin_time_t)_NSConcreteStackBlock;
      __rqtp.tv_nsec = 3221225472;
      v40 = sub_10001E4EC;
      v41 = &unk_10002D9D0;
      v42 = v19;
      v43 = v52;
      v44 = &v46;
      v45 = &v54;
      v21 = objc_msgSend(v20, "startSesHatSession:", &__rqtp);
      v22 = dispatch_time(0, v18);
      dispatch_semaphore_wait(v19, v22);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001E620;
      block[3] = &unk_10002D9F8;
      block[4] = v21;
      block[5] = v52;
      block[6] = a2;
      dispatch_sync((dispatch_queue_t)qword_100035990, block);
      dispatch_release(v19);
    }
    v23 = (void *)v47[5];
    if (a3 && v23)
    {
      *(_DWORD *)(a3 + 8) = objc_msgSend((id)sub_10001CFC0(), "smallCrumbsFromError:", v47[5]);
      *(_QWORD *)a3 = objc_msgSend((id)sub_10001CFC0(), "largeCrumbsFromError:", v47[5]);
      v23 = (void *)v47[5];
    }
    if (v23)

    v24 = v55[5];
    _Block_object_dispose(&v46, 8);
    _Block_object_dispose(v52, 8);
    _Block_object_dispose(&v54, 8);
    if (v17 > 3)
      break;
    ++v17;
  }
  while (!v24);
  if (!v24)
  {
    sub_10001C810(0, v25, v11, v12, v13, v14, v15, v16, v36);
    sub_10001B1F8(v26, v27, v28, v29, v30, v31, v32, v33, v37);
  }
  return v24;
}

void sub_10001C7E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_10001C810(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
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
  char v21;
  int v22;

  if (byte_10003598C == a1)
  {
    sub_10001595C("SeshatPowerAssertion", CFSTR("not doing anything %d:%d"), a3, a4, a5, a6, a7, a8, a1);
  }
  else if (a1)
  {
    v22 = 0;
    if (IOPMAssertionDeclareSystemActivity(CFSTR("Seshat session in progress"), &dword_100035988, &v22))
      sub_10001595C("SeshatPowerAssertion", CFSTR("Unable to take power assertion."), v9, v10, v11, v12, v13, v14, v21);
    else
      byte_10003598C = 1;
  }
  else if (IOPMAssertionRelease(dword_100035988))
  {
    sub_10001595C("SeshatPowerAssertion", CFSTR("Unable to remove power assertion."), v15, v16, v17, v18, v19, v20, a9);
  }
  else
  {
    byte_10003598C = 0;
  }
}

uint64_t sub_10001C8D8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10001C52C(a1, 0, 0, a4, a5, a6, a7, a8);
}

void sub_10001C8E4(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (sub_10001C334())
  {
    v10 = sub_10001C0F0(20);
    if (a1)
    {
      if (v10)
      {
        v11 = *a1;
        if (*a1)
        {
          objc_msgSend(*a1, "endSession");

          *a1 = 0;
          sub_10001C810(0, v12, v13, v14, v15, v16, v17, v18, a9);
        }
      }
    }
  }
}

uint64_t sub_10001C940(unint64_t *a1)
{
  unint64_t v2;
  uint64_t result;
  void *v4;
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  result = sub_10001C334();
  if ((_DWORD)result)
  {
    result = sub_10001C0F0(20);
    if ((_DWORD)result)
    {
      result = (uint64_t)objc_msgSend((id)sub_10001CA30(), "embeddedSecureElement");
      if (result)
      {
        v4 = (void *)result;
        v5 = v2 & 0xFF00000000000000;
        v6 = objc_msgSend((id)result, "hwType");
        if (v6 == 3)
        {
          v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend(objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x1E9) << 51);
          v8 = (unint64_t)objc_msgSend(objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x22F;
        }
        else
        {
          if (v6 != 1)
          {
            v10 = v2 & 0xF7FFFFFFFFFFFFLL;
LABEL_13:
            *a1 = v10 | v5;
            return 1;
          }
          v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend(objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 4 > 0x102) << 51);
          v8 = (unint64_t)objc_msgSend(objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 2 > 0x48E;
        }
        v9 = v8;
        v10 = v7 | (v9 << 52);
        goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t sub_10001CA30()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_10001CDC4;
  v7 = sub_10001CDD4;
  v0 = qword_1000359A0;
  v8 = qword_1000359A0;
  if (!qword_1000359A0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10001E680;
    v2[3] = &unk_10002CBE8;
    v2[4] = &v3;
    sub_10001E680((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001CADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001CAF4()
{
  id v0;

  if (!sub_10001C334() || !sub_10001C0F0(20))
    return 0;
  v0 = objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager");
  return objc_msgSend(v0, "preWarm");
}

unint64_t sub_10001CB2C(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
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
  unint64_t v32;
  BOOL v33;
  char v34;
  __int128 v36;

  if (sub_10001C334() && sub_10001C0F0(20))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = (uint64_t)*a1;
    while (1)
    {
      if (v10)
      {
        v36 = xmmword_100029110;
        nanosleep((const timespec *)&v36, 0);
      }
      if (v10 > 2 || v11 == 7)
      {
        sub_10001595C("SeshatRetry", CFSTR("transient error, re-creating session"), v4, v5, v6, v7, v8, v9, v36);
        sub_10001C8E4(a1, v14, v15, v16, v17, v18, v19, v20, v36);
        v13 = sub_10001C52C(65000, 0, 0, v21, v22, v23, v24, v25);
        *a1 = (id)v13;
        if (!v13)
          break;
      }
      if ((qword_100035960 & 0x400) != 0 && (arc4random() & 0xF) == 0)
      {
        v12 = 0xFFFFLL;
        v11 = 7;
      }
      else
      {
        v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v13);
        v11 = v32;
        v12 = HIDWORD(v32);
      }
      if (v11)
        v33 = 0;
      else
        v33 = (_DWORD)v12 == 36864;
      v34 = !v33;
      if (v10 <= 3)
      {
        ++v10;
        if ((v34 & 1) != 0)
          continue;
      }
      return v11 | (unint64_t)(v12 << 32);
    }
    sub_10001595C("SeshatRetry", CFSTR("failed to re-create session"), v26, v27, v28, v29, v30, v31, v36);
  }
  else
  {
    v12 = 0xFFFFLL;
    v11 = 6;
  }
  return v11 | (unint64_t)(v12 << 32);
}

unint64_t sub_10001CC8C(id *a1, char a2, char a3, uint64_t a4, CFTypeRef *a5, uint64_t a6)
{
  unint64_t v6;
  void *v13;
  const void *v14;
  _QWORD v16[7];
  char v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100035960 & 1) == 0)
  {
    v13 = objc_autoreleasePoolPush();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = sub_10001CDC4;
    v23 = sub_10001CDD4;
    v24 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001CDE0;
    v16[3] = &unk_10002D898;
    v17 = a2;
    v18 = a3;
    v16[4] = &v19;
    v16[5] = a4;
    v16[6] = a6;
    v6 = sub_10001CB2C(a1, (uint64_t)v16);
    v14 = (const void *)v20[5];
    if (v14)
      *a5 = CFRetain(v14);
    _Block_object_dispose(&v19, 8);
    objc_autoreleasePoolPop(v13);
  }
  return v6;
}

void sub_10001CDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001CDC4(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_10001CDD4(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_10001CDE0(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:", *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, *(_QWORD *)(a1 + 48));
}

unint64_t sub_10001CE00(id *a1, char a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6;
  void *v13;
  const void *v14;
  _QWORD v16[8];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100035960 & 2) == 0)
  {
    v13 = objc_autoreleasePoolPush();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = sub_10001CDC4;
    v28 = sub_10001CDD4;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = sub_10001CDC4;
    v22 = sub_10001CDD4;
    v23 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10001CF9C;
    v16[3] = &unk_10002D8C0;
    v17 = a2;
    v16[6] = a3;
    v16[7] = a5;
    v16[4] = &v24;
    v16[5] = &v18;
    v6 = sub_10001CB2C(a1, (uint64_t)v16);
    v14 = (const void *)v25[5];
    if (v14)
      *a4 = CFRetain(v14);
    if (v19[5])
    {
      *(_DWORD *)(a6 + 8) = objc_msgSend((id)sub_10001CFC0(), "smallCrumbsFromError:", v19[5]);
      *(_QWORD *)a6 = objc_msgSend((id)sub_10001CFC0(), "largeCrumbsFromError:", v19[5]);
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
    objc_autoreleasePoolPop(v13);
  }
  return v6;
}

void sub_10001CF74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id sub_10001CF9C(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "derive:userHash:outData:outWriteCount:trackingError:", *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
}

uint64_t sub_10001CFC0()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = sub_10001CDC4;
  v7 = sub_10001CDD4;
  v0 = qword_1000359A8;
  v8 = qword_1000359A8;
  if (!qword_1000359A8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10001E6D4;
    v2[3] = &unk_10002CBE8;
    v2[4] = &v3;
    sub_10001E6D4((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10001D06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_10001D084(id *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  const __CFData *v11;
  __CFData *MutableCopy;
  CFIndex Length;
  void *v15;
  char v17;
  _QWORD v18[6];
  char v19;
  CFRange v20;

  v8 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100035960 & 4) == 0)
  {
    v11 = (const __CFData *)a3;
    if ((qword_100035960 & 0x2000) != 0)
    {
      sub_10001595C("SeshatResetCounter", CFSTR("corrupting reset token"), a3, a4, a5, a6, a7, a8, v17);
      Length = CFDataGetLength(v11);
      MutableCopy = CFDataCreateMutableCopy(0, Length, v11);
      v20.location = 0;
      v20.length = 4;
      CFDataReplaceBytes(MutableCopy, v20, (const UInt8 *)"0000", 4);
      v11 = MutableCopy;
    }
    else
    {
      MutableCopy = 0;
    }
    v15 = objc_autoreleasePoolPush();
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001D1A8;
    v18[3] = &unk_10002D8E0;
    v19 = a2;
    v18[4] = v11;
    v18[5] = a4;
    v8 = sub_10001CB2C(a1, (uint64_t)v18);
    objc_autoreleasePoolPop(v15);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  return v8;
}

id sub_10001D1A8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "resetCounter:userToken:outWriteCount:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

unint64_t sub_10001D1B8(id *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  void *v11;
  _QWORD v13[6];
  int v14;
  char v15;

  v5 = 0xFFFF0000000ALL;
  if (a1 && (qword_100035960 & 8) == 0 && *a1)
  {
    v11 = objc_autoreleasePoolPush();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001D280;
    v13[3] = &unk_10002D900;
    v14 = a2;
    v15 = a3;
    v13[4] = a4;
    v13[5] = a5;
    v5 = sub_10001CB2C(a1, (uint64_t)v13);
    objc_autoreleasePoolPop(v11);
  }
  return v5;
}

id sub_10001D280(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "authorizeUpdate:slotIndex:userToken:outWriteCount:", *(_DWORD *)(a1 + 48) != 0, *(unsigned __int8 *)(a1 + 52), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

unint64_t sub_10001D29C(id *a1, char a2, uint64_t a3)
{
  unint64_t v3;
  void *v7;
  _QWORD v9[5];
  char v10;

  v3 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100035960 & 0x10) == 0)
  {
    v7 = objc_autoreleasePoolPush();
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001D350;
    v9[3] = &unk_10002D920;
    v10 = a2;
    v9[4] = a3;
    v3 = sub_10001CB2C(a1, (uint64_t)v9);
    objc_autoreleasePoolPop(v7);
  }
  return v3;
}

id sub_10001D350(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "deleteSlot:outWriteCount:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

unint64_t sub_10001D360(id *a1, char a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  void *v9;
  _QWORD v11[6];
  char v12;

  v4 = 0xFFFF0000000ALL;
  if (a1 && (qword_100035960 & 0x1000) == 0 && *a1)
  {
    v9 = objc_autoreleasePoolPush();
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001D418;
    v11[3] = &unk_10002D8E0;
    v12 = a2;
    v11[4] = a3;
    v11[5] = a4;
    v4 = sub_10001CB2C(a1, (uint64_t)v11);
    objc_autoreleasePoolPop(v9);
  }
  return v4;
}

id sub_10001D418(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "upgradeKey:inputData:outWriteCount:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

unint64_t sub_10001D428(id *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  void *v11;
  const void *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v5 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (qword_100035960 & 0x20) == 0)
  {
    v11 = objc_autoreleasePoolPush();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = sub_10001CDC4;
    v19 = sub_10001CDD4;
    v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001D554;
    v14[3] = &unk_10002D948;
    v14[4] = &v15;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    v5 = sub_10001CB2C(a1, (uint64_t)v14);
    v12 = (const void *)v16[5];
    if (v12)
      *a2 = CFRetain(v12);
    _Block_object_dispose(&v15, 8);
    objc_autoreleasePoolPop(v11);
  }
  return v5;
}

void sub_10001D538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001D554(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "getData:updateKUD:outWriteLimit:outWriteCount:", *(_QWORD *)(a1[4] + 8) + 40, a1[5], a1[6], a1[7]);
}

uint64_t sub_10001D56C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v4;

  v0 = objc_autoreleasePoolPush();
  v4 = 0;
  v1 = 0xFFFFFFFFLL;
  if (objc_msgSend(objc_msgSend((id)sub_10001C24C(), "sharedHardwareManager"), "secureElementBootHistory:", &v4)&& v4)
  {
    if ((int)objc_msgSend(v4, "count") < 1)
    {
      v1 = 0;
    }
    else
    {
      v2 = 0;
      LODWORD(v1) = 0;
      do
        v1 = objc_msgSend(objc_msgSend(v4, "objectAtIndex:", v2++), "intValue") + v1;
      while (v2 < (int)objc_msgSend(v4, "count"));
    }
  }
  objc_autoreleasePoolPop(v0);
  return v1;
}

CFDataRef sub_10001D610(CFDataRef result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFDataRef v5;
  uint64_t v6;
  _OWORD v7[2];

  memset(v7, 0, sizeof(v7));
  if (result)
  {
    v5 = result;
    v6 = ccsha256_di(result, a2, a3, a4);
    ccdigest(v6, a2, v5, v7);
    return CFDataCreate(0, (const UInt8 *)v7, 32);
  }
  return result;
}

uint64_t sub_10001D694(uint64_t a1)
{
  uint64_t v1;

  v1 = qword_100035960;
  qword_100035960 = a1;
  return v1;
}

uint64_t sub_10001D6A8()
{
  return qword_100035960;
}

BOOL sub_10001D6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v10;

  v8 = qword_100035960;
  if (qword_100035960)
    sub_10001595C("SeshatIsReportingEnabled", CFSTR("not reporting aggd data, since debugging mode is enabled"), a3, a4, a5, a6, a7, a8, v10);
  return v8 == 0;
}

uint64_t sub_10001D6F4(CFDataRef theData)
{
  uint64_t v2;

  if (theData)
  {
    v2 = 0;
    while (CFDataGetBytePtr(theData)[v2] != 238)
    {
      if (++v2 == 10)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    LOBYTE(v2) = -1;
  }
  return v2;
}

uint64_t sub_10001D740(int a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFDataRef v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  unint64_t v34;
  const __CFData *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  const __CFData *v39;
  unint64_t v40;
  unsigned __int8 v41;
  const __CFData *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unsigned __int8 v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unsigned __int8 v51;
  const __CFData *v52;
  unint64_t v53;
  unint64_t v55;
  unint64_t v56;
  char v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned __int8 v62;
  id v63;
  unsigned int v64;
  unsigned int v65;
  char v66;
  CFTypeRef v67;
  CFTypeRef cf;
  const __CFData *v69;
  CFTypeRef v70;
  CFTypeRef v71;
  const __CFData *v72;

  v71 = 0;
  v72 = 0;
  v69 = 0;
  v70 = 0;
  v67 = 0;
  cf = 0;
  v66 = -1;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  v62 = 0;
  v60 = 0;
  v61 = 0;
  v11 = CFDataCreate(0, byte_100035830, 32);
  if (a1)
  {
    v12 = sub_10001D56C();
    if ((sub_10001DED0() & 1) == 0)
    {
      if (v12)
      {
        v15 = 0;
        LOBYTE(v16) = -1;
        v17 = 1;
        goto LABEL_64;
      }
    }
  }
  v18 = (void *)sub_10001C52C(65000, &v62, (uint64_t)&v60, v6, v7, v8, v9, v10);
  v63 = v18;
  if (!v18)
  {
    LOWORD(v34) = 0;
    v15 = 0;
    LOBYTE(v16) = -1;
    v36 = 0x200000000000000;
    v17 = 2;
    goto LABEL_63;
  }
  if (a2 && ((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v18) & 1) == 0)
  {
    sub_10001595C("SeshatPreflightCheck", CFSTR("unsatisfactory condition for preflight"), v19, v20, v21, v22, v23, v24, v57);
    v15 = 0;
    LOBYTE(v16) = -1;
    v17 = 14;
    goto LABEL_64;
  }
  v25 = sub_10001D428(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  v33 = v25;
  v34 = HIDWORD(v25);
  if (v25 != 0x900000000000)
  {
    if (HIDWORD(v25) == 27266)
    {
      sub_10001595C("SeshatPreflightCheck", CFSTR("no seshat applet"), v27, v28, v29, v30, v31, v32, v57);
      v37 = 13;
    }
    else if (HIDWORD(v25) == 26277)
    {
      sub_10001595C("SeshatPreflightCheck", CFSTR("restricted mode"), v27, v28, v29, v30, v31, v32, v57);
      v37 = 12;
    }
    else
    {
      sub_10001595C("SeshatPreflightCheck", CFSTR("unknown getData() -> 0x%x:0x%x"), v27, v28, v29, v30, v31, v32, v25);
      v37 = 3;
    }
    v15 = 0;
    v17 = ((_DWORD)v34 << 16) | ((unint64_t)v33 << 8) | v37;
    LOBYTE(v16) = -1;
    goto LABEL_62;
  }
  v59 = 1000 * ((v64 + 999) / 0x3E8);
  sub_1000133B8(&v59, v26, v27, v28, v29, v30, v31, v32, v57);
  v35 = v69;
  if (!v69)
  {
    v15 = 0;
    LOBYTE(v16) = -1;
LABEL_89:
    v36 = 0x400000000000000;
    v17 = 4;
    goto LABEL_103;
  }
  v16 = 0;
  v17 = 4;
  LOWORD(v34) = -28672;
  while (CFDataGetBytePtr(v35)[v16] != 238)
  {
    if (++v16 == 10)
    {
      v15 = 0;
      LOBYTE(v16) = -1;
      v36 = 0x400000000000000;
      goto LABEL_63;
    }
  }
  if (v16 > 9u)
  {
    v15 = 0;
    goto LABEL_89;
  }
  v17 = 2415919109;
  sub_10001595C("SeshatPreflightCheck", CFSTR("globalWriteCounter = %d, globalWriteCounterLimit = %d, slot = %d\n"), v14, v6, v7, v8, v9, v10, v64);
  v15 = 0;
  v36 = 0x500000000000000;
  LOWORD(v34) = -28672;
  if (v65 < 0x2711 || v64 >= v65 - 10000)
    goto LABEL_63;
  v38 = sub_10001CC8C(&v63, v16, 238, 0, (CFTypeRef *)&v72, (uint64_t)&v64);
  v34 = HIDWORD(v38);
  if ((_DWORD)v38 || v34 != 36864)
  {
    v15 = 0;
    v17 = (HIDWORD(v38) << 16) | ((unint64_t)v38 << 8) | 6;
    v36 = 0x600000000000000;
    goto LABEL_63;
  }
  v39 = v72;
  if (!v72)
  {
    sub_10001595C("SeshatPreflightCheck", CFSTR("no reset token returned"), v14, v6, v7, v8, v9, v10, v57);
    v15 = 1;
    v36 = 0x600000000000000;
    v17 = 6;
    goto LABEL_103;
  }
  CFRelease(v35);
  v69 = 0;
  v40 = sub_10001D428(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  v41 = v40;
  v34 = HIDWORD(v40);
  if ((_DWORD)v40 || v34 != 36864)
  {
    v55 = (HIDWORD(v40) << 16) | ((unint64_t)v40 << 8);
LABEL_101:
    v17 = v55 | 3;
    v15 = 1;
LABEL_62:
    v36 = 0x300000000000000;
LABEL_63:
    v58 = (((unint64_t)v62 << 6) | ((unint64_t)v61 << 8)) & 0xFF0000FFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v34 << 40) | v36 | 0x28;
    sub_100012FAC(&v58, v13, v14, v6, v7, v8, v9, v10, v57);
    goto LABEL_64;
  }
  v42 = v69;
  if (CFDataGetBytePtr(v69)[v16] != 238 && (char)CFDataGetBytePtr(v42)[v16] < 0)
  {
    v17 = ((unint64_t)v41 << 8) | 0x90000006;
    v15 = 1;
  }
  else
  {
    v43 = sub_10001CE00(&v63, v16, (uint64_t)v11, &v71, (uint64_t)&v64, (uint64_t)&v60);
    v34 = HIDWORD(v43);
    if ((_DWORD)v43 || v34 != 36864)
      goto LABEL_85;
    v44 = sub_10001D084(&v63, v16, (uint64_t)v39, (uint64_t)&v64, v7, v8, v9, v10);
    v34 = HIDWORD(v44);
    if ((_DWORD)v44 || v34 != 36864)
      goto LABEL_86;
    v43 = sub_10001CE00(&v63, v16, (uint64_t)v11, &v70, (uint64_t)&v64, (uint64_t)&v60);
    v34 = HIDWORD(v43);
    if ((_DWORD)v43 || v34 != 36864)
    {
LABEL_85:
      v17 = ((_DWORD)v34 << 16) | ((unint64_t)v43 << 8) | 7;
      v15 = 1;
      v36 = 0x700000000000000;
      goto LABEL_63;
    }
    if (CFEqual(v70, v71))
    {
      v44 = sub_10001D084(&v63, v16, (uint64_t)v39, (uint64_t)&v64, v7, v8, v9, v10);
      v34 = HIDWORD(v44);
      if (!(_DWORD)v44 && v34 == 36864)
      {
        v45 = sub_10001D1B8(&v63, 1, v16, (uint64_t)v39, (uint64_t)&v64);
        v34 = HIDWORD(v45);
        if ((_DWORD)v45 || v34 != 36864)
        {
          v56 = (HIDWORD(v45) << 16) | ((unint64_t)v45 << 8);
        }
        else
        {
          v46 = sub_10001D1B8(&v63, 0, v16, (uint64_t)v39, (uint64_t)&v64);
          v47 = v46;
          v34 = HIDWORD(v46);
          if (!(_DWORD)v46 && v34 == 36864)
          {
            if (a3)
              *a3 |= 1u;
            if (!sub_10001DF14(v64, v39, (CFDataRef *)&cf, (CFDataRef *)&v67))
            {
              v48 = sub_10001D360(&v63, v16, (uint64_t)cf, (uint64_t)&v64);
              v34 = HIDWORD(v48);
              if ((_DWORD)v48 || v34 != 36864)
              {
                v17 = (HIDWORD(v48) << 16) | ((unint64_t)v48 << 8) | 0xF;
                v15 = 1;
                v36 = 0xF00000000000000;
                goto LABEL_63;
              }
              v49 = sub_10001D084(&v63, v16, (uint64_t)v67, (uint64_t)&v64, v7, v8, v9, v10);
              v34 = HIDWORD(v49);
              if ((_DWORD)v49 || v34 != 36864)
              {
                v17 = (HIDWORD(v49) << 16) | ((unint64_t)v49 << 8) | 0x12;
                v15 = 1;
                v36 = 0x1200000000000000;
                goto LABEL_63;
              }
              if (v42)
              {
                CFRelease(v42);
                v69 = 0;
              }
              v50 = sub_10001D428(&v63, (CFTypeRef *)&v69, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
              v51 = v50;
              v34 = HIDWORD(v50);
              if (!(_DWORD)v50 && v34 == 36864)
              {
                v52 = v69;
                if (CFDataGetBytePtr(v69)[v16] == 238 || ((char)CFDataGetBytePtr(v52)[v16] & 0x80000000) == 0)
                {
                  v17 = ((unint64_t)v51 << 8) | 0x90000013;
                  v15 = 1;
                  v36 = 0x1300000000000000;
                }
                else
                {
                  if ((CFDataGetBytePtr(v52)[v16] & 0x7F) == 0)
                  {
                    if (a3)
                      *a3 |= 2u;
                    v53 = sub_10001D29C(&v63, v16, (uint64_t)&v64);
                    v34 = HIDWORD(v53);
                    if (!(_DWORD)v53 && v34 == 36864)
                    {
                      v17 = 0;
                      v15 = 0;
                      goto LABEL_64;
                    }
                    v17 = (HIDWORD(v53) << 16) | ((unint64_t)v53 << 8) | 0xB;
                    v15 = 1;
                    v36 = 0xB00000000000000;
                    goto LABEL_63;
                  }
                  v17 = ((unint64_t)v51 << 8) | 0x90000014;
                  v15 = 1;
                  v36 = 0x1400000000000000;
                }
                goto LABEL_103;
              }
              v55 = (HIDWORD(v50) << 16) | ((unint64_t)v50 << 8);
              goto LABEL_101;
            }
            v17 = ((unint64_t)v47 << 8) | 0x90000010;
            v15 = 1;
            v36 = 0x1000000000000000;
LABEL_103:
            LOWORD(v34) = -28672;
            goto LABEL_63;
          }
          v56 = (HIDWORD(v46) << 16) | ((unint64_t)v46 << 8);
        }
        v17 = v56 | 0xA;
        v15 = 1;
        v36 = 0xA00000000000000;
        goto LABEL_63;
      }
LABEL_86:
      v17 = ((_DWORD)v34 << 16) | ((unint64_t)v44 << 8) | 8;
      v15 = 1;
      v36 = 0x800000000000000;
      goto LABEL_63;
    }
    v15 = 1;
    v17 = 9;
  }
LABEL_64:
  if (v63)
  {
    if (v15)
      sub_10001D29C(&v63, v16, (uint64_t)&v64);
    sub_10001C8E4(&v63, v13, v14, v6, v7, v8, v9, v10, v57);
  }
  if (v72)
    CFRelease(v72);
  if (v71)
    CFRelease(v71);
  if (v70)
    CFRelease(v70);
  if (v69)
    CFRelease(v69);
  if (v11)
    CFRelease(v11);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v67)
    CFRelease(v67);
  return v17;
}

uint64_t sub_10001DED0()
{
  uint64_t result;
  id v1;

  result = sub_10001C334();
  if ((_DWORD)result)
  {
    result = sub_10001C0F0(20);
    if ((_DWORD)result)
    {
      v1 = objc_msgSend((id)sub_10001CA30(), "embeddedSecureElement");
      if (v1)
        LODWORD(v1) = objc_msgSend(v1, "isSeshatAvailabledInRestrictedMode");
      return v1 | ((BYTE1(qword_100035960) & 0x40) >> 6);
    }
  }
  return result;
}

uint64_t sub_10001DF14(unsigned int a1, const __CFData *a2, CFDataRef *a3, CFDataRef *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  const UInt8 *v13;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  UInt8 *v24;
  uint64_t v25;
  _BYTE *v26;
  CFDataRef v27;
  CFDataRef v28;
  _BYTE v30[7];
  char v31;
  CFIndex v32;
  _DWORD v33[2];
  int v34;
  _OWORD v35[6];
  char v36;
  _BYTE v37[40];

  v34 = 0;
  memset(v37, 0, 32);
  v8 = ccec_cp_256();
  v9 = __chkstk_darwin();
  v11 = &v30[-v10];
  LOBYTE(v33[1]) = 0;
  v33[0] = 2;
  v35[2] = xmmword_100029140;
  v35[3] = unk_100029150;
  v35[4] = xmmword_100029160;
  v35[5] = unk_100029170;
  v35[0] = xmmword_100029120;
  v35[1] = unk_100029130;
  v36 = -121;
  cczp_bitlen(v9);
  __chkstk_darwin();
  v13 = &v30[-((v12 + 24) & 0x7FFFFFFFFFFFFFF0)];
  v32 = v14;
  v15 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        v16 = ccrng(&v34);
        if (!v34)
        {
          v17 = v16;
          v18 = ccec_x963_import_priv(v8, 97, v35, v11);
          if ((_DWORD)v18)
            return 0xFFFFFFFFLL;
          *(_DWORD *)((char *)v33 + 1) = bswap32(a1);
          v22 = ccsha256_di(v18, v19, v20, v21);
          ccdigest(v22, 5, v33, v37);
          if (ccec_sign(v11, 32, v37, &v32, v13, v17))
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            v23 = (((unint64_t)(cczp_bitlen(*v11) + 7) >> 2) | 1) + 16;
            v24 = (UInt8 *)malloc_type_malloc(v23, 0xE0546DF0uLL);
            ccec_x963_export(0, v24 + 16, v11);
            *(_OWORD *)v24 = *(_OWORD *)CFDataGetBytePtr(a2);
            __chkstk_darwin();
            v26 = &v30[-v25];
            ccec_x963_import_pub(v8, 65, v24 + 16, &v30[-v25]);
            v31 = 0;
            if (ccec_verify(v26, 32, v37, v32, v13, &v31) || !v31)
            {
              puts("validation failed");
              v15 = 0xFFFFFFFFLL;
            }
            else
            {
              v27 = CFDataCreate(0, v24, v23);
              *a3 = v27;
              if (v27)
              {
                v28 = CFDataCreate(0, v13, v32);
                *a4 = v28;
                if (v28)
                  v15 = 0;
                else
                  v15 = 0xFFFFFFFFLL;
              }
              else
              {
                v15 = 0xFFFFFFFFLL;
              }
            }
            if (v24)
              free(v24);
          }
        }
      }
    }
  }
  return v15;
}

void sub_10001E21C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];

  if (a1 == 27268)
  {
    v11[1] = v8;
    v11[2] = v9;
    v11[0] = 1;
    sub_100012C28(v11, a2, a3, a4, a5, a6, a7, a8, v10);
  }
}

uint64_t sub_10001E250()
{
  return 1;
}

uint64_t sub_10001E258()
{
  return BYTE1(qword_100035960) >> 7;
}

BOOL sub_10001E268(__int16 a1)
{
  return (a1 & 0x1F) == 2 || (a1 & 0x1F) == 14 || (a1 & 0xFF00) == 1792;
}

uint64_t sub_10001E28C(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(_DWORD *)a3 = 0;
  *(_BYTE *)(a3 + 4) = 0;
  *(_BYTE *)a3 = result;
  *(_DWORD *)(a3 + 1) = bswap32(a2);
  return result;
}

const __CFData *sub_10001E2A4(char a1, unsigned int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v8;
  const UInt8 *BytePtr;
  char v13;
  _BYTE v14[5];

  if ((qword_100035960 & 0x10000) != 0)
  {
    sub_10001595C("SeshatIsNonceEquivalent", CFSTR("not eq"), (uint64_t)theData, a4, a5, a6, a7, a8, v13);
    return 0;
  }
  else
  {
    v8 = theData;
    v14[0] = a1;
    *(_DWORD *)&v14[1] = bswap32(a2);
    if (theData)
    {
      if (CFDataGetLength(theData) == 5)
      {
        BytePtr = CFDataGetBytePtr(v8);
        v8 = (const __CFData *)(*(_DWORD *)v14 == *(_DWORD *)BytePtr && v14[4] == BytePtr[4]);
      }
      else
      {
        v8 = 0;
      }
    }
    sub_10001595C("SeshatIsNonceEquivalent", CFSTR("nonce eq: %d,%u -> %d"), (uint64_t)theData, a4, a5, a6, a7, a8, a1);
  }
  return v8;
}

Class sub_10001E378(uint64_t a1)
{
  Class result;

  sub_10001E3CC();
  result = objc_getClass("NFHardwareManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001EC98();
  qword_100035968 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_10001E3CC()
{
  void *v0;
  __int128 v1;
  uint64_t v2;

  v0 = 0;
  if (!qword_100035970)
  {
    v1 = off_10002D968;
    v2 = 0;
    qword_100035970 = _sl_dlopen(&v1, &v0);
  }
  if (!qword_100035970)
    sub_10001ECFC(&v0);
  if (v0)
    free(v0);
}

Class sub_10001E470(uint64_t a1)
{
  Class result;

  sub_10001E3CC();
  result = objc_getClass("NFTapToRadar");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001ED60();
  qword_100035980 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_10001E4C4(id a1)
{
  qword_100035990 = (uint64_t)dispatch_queue_create("com.apple.mobile.keybagd.seshat.sesion-timeout", 0);
}

void sub_10001E4EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v4[7];
  __int128 v5;
  uint64_t v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001E560;
  v4[3] = &unk_10002D9A8;
  v5 = *(_OWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = a3;
  v4[5] = v3;
  v6 = *(_QWORD *)(a1 + 56);
  v4[6] = a2;
  dispatch_sync((dispatch_queue_t)qword_100035990, v4);
}

void sub_10001E560(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  char v20;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v9 + 24))
  {
    sub_10001595C("_SeshatCreateSessionWithTimeout_block_invoke_3", CFSTR("doing nothing due to poison"), a3, a4, a5, a6, a7, a8, v20);
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    if (v10)
    {
      v11 = objc_msgSend(objc_msgSend(v10, "description"), "cStringUsingEncoding:", 1);
      sub_10001595C("_SeshatCreateSessionWithTimeout_block_invoke_3", CFSTR("ERROR: %s"), v12, v13, v14, v15, v16, v17, v11);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v18 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 64);
    }
    else
    {
      *(_BYTE *)(v9 + 24) = 1;
      v18 = *(id *)(a1 + 48);
      v19 = *(_QWORD *)(a1 + 72);
    }
    *(_QWORD *)(*(_QWORD *)(v19 + 8) + 40) = v18;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  dispatch_release(*(dispatch_object_t *)(a1 + 40));
}

_QWORD *sub_10001E620(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _BYTE *v9;
  char v10;

  if (!*(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24))
  {
    v8 = result;
    sub_10001595C("_SeshatCreateSessionWithTimeout_block_invoke_4", CFSTR("signaling end of session due to failure to start"), a3, a4, a5, a6, a7, a8, v10);
    result = objc_msgSend((id)v8[4], "endSession");
    v9 = (_BYTE *)v8[6];
    *(_BYTE *)(*(_QWORD *)(v8[5] + 8) + 24) = 1;
    if (v9)
      *v9 = 1;
  }
  return result;
}

Class sub_10001E680(uint64_t a1)
{
  Class result;

  sub_10001E3CC();
  result = objc_getClass("NFSecureElement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001EDC4();
  qword_1000359A0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class sub_10001E6D4(uint64_t a1)
{
  Class result;

  sub_10001E3CC();
  result = objc_getClass("NFSeshatSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    sub_10001EE28();
  qword_1000359A8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_10001E728(id a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uintptr_t v7;
  NSObject *global_queue;
  char v9;

  if (bootstrap_check_in(bootstrap_port, "com.apple.mobile.keybagd.mach", (mach_port_t *)&dword_1000359B8))
  {
    sub_10001595C("serverPort_block_invoke", CFSTR("failed to create notification port"), v1, v2, v3, v4, v5, v6, v9);
  }
  else
  {
    v7 = dword_1000359B8;
    global_queue = dispatch_get_global_queue(0, 0);
    qword_1000359C0 = (uint64_t)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v7, 0, global_queue);
    dispatch_source_set_event_handler((dispatch_source_t)qword_1000359C0, &stru_10002DA78);
    dispatch_resume((dispatch_object_t)qword_1000359C0);
  }
}

void sub_10001E7C4(id a1)
{
  mach_msg_return_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE msg[32];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  int v13;

  v13 = 0;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  memset(msg, 0, sizeof(msg));
  v1 = mach_msg((mach_msg_header_t *)msg, 2, 0, 0x64u, dword_1000359B8, 0, 0);
  if (v1)
  {
LABEL_2:
    sub_10001595C("serverPort_block_invoke_2", CFSTR("mach_msg error: %x"), v2, v3, v4, v5, v6, v7, v1);
    return;
  }
  if (*(_DWORD *)&msg[20] == 44)
  {
    sub_10001595C("serverPort_block_invoke_2", CFSTR("aks notification for recovery completion %d"), v2, v3, v4, v5, v6, v7, msg[28]);
    sub_1000169DC(*(int *)&msg[28]);
    return;
  }
  if (*(_DWORD *)&msg[20] != 43)
  {
    if (*(_DWORD *)&msg[20] == 42)
    {
      sub_100016DF8();
      return;
    }
    goto LABEL_2;
  }
  if (!*(_DWORD *)&msg[24])
    sub_100016904(0, *(_DWORD *)&msg[28] == 0);
}

uint64_t sub_10001E8C8()
{
  uint64_t result;

  if (qword_1000359B0 != -1)
    dispatch_once(&qword_1000359B0, &stru_10002DA38);
  result = aks_register_for_notifications(dword_1000359B8, 42);
  if (!(_DWORD)result)
  {
    if (qword_1000359B0 != -1)
      dispatch_once(&qword_1000359B0, &stru_10002DA38);
    return aks_register_for_notifications(dword_1000359B8, 43);
  }
  return result;
}

void sub_10001E954()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getBKDeviceManagerClass(void)_block_invoke"), CFSTR("SpacedRepetitionManager.m"), 18, CFSTR("Unable to find class %s"), "BKDeviceManager");
  __break(1u);
}

void sub_10001E9B8(_QWORD *a1)
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *BiometricKitLibrary(void)"), CFSTR("SpacedRepetitionManager.m"), 17, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_10001EA1C()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getBKDeviceClass(void)_block_invoke"), CFSTR("SpacedRepetitionManager.m"), 19, CFSTR("Unable to find class %s"), "BKDevice");
  __break(1u);
}

void sub_10001EA80()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "_Bool localMAGetActivationState(void)"), CFSTR("misc.m"), 18, CFSTR("%s"), dlerror());
  __break(1u);
}

void sub_10001EAE4(_QWORD *a1)
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *ManagedConfigurationLibrary(void)"), CFSTR("misc.m"), 24, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_10001EB48()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getMCProfileConnectionClass(void)_block_invoke"), CFSTR("misc.m"), 25, CFSTR("Unable to find class %s"), "MCProfileConnection");
  __break(1u);
}

void sub_10001EBAC(_QWORD *a1)
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *MobileActivationLibrary(void)"), CFSTR("misc.m"), 17, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_10001EC10(int a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Can't stage SE stash; fail. derive() -> 0x%x:0x%x",
    (uint8_t *)v2,
    0xEu);
}

void sub_10001EC98()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 37, CFSTR("Unable to find class %s"), "NFHardwareManager");
  __break(1u);
}

void sub_10001ECFC(_QWORD *a1)
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *NearFieldLibrary(void)"), CFSTR("SeshatSupport.m"), 35, CFSTR("%s"), *a1);
  __break(1u);
}

void sub_10001ED60()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNFTapToRadarClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 36, CFSTR("Unable to find class %s"), "NFTapToRadar");
  __break(1u);
}

void sub_10001EDC4()
{
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNFSecureElementClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 39, CFSTR("Unable to find class %s"), "NFSecureElement");
  __break(1u);
}

void sub_10001EE28()
{
  id v0;
  uint64_t v1;

  v0 = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getNFSeshatSessionClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 38, CFSTR("Unable to find class %s"), "NFSeshatSession");
  __break(1u);
  ADClientAddValueForScalarKey(v0, v1);
}

id objc_msgSend__loadLockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadLockState");
}

id objc_msgSend__lockStateValueForKey_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lockStateValueForKey:ofType:");
}

id objc_msgSend__persistentStateQueue_cancelSpeculativeFailureCharge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistentStateQueue_cancelSpeculativeFailureCharge");
}

id objc_msgSend__persistentStateQueue_loadLockState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_persistentStateQueue_loadLockState");
}

id objc_msgSend__setLockStateValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setLockStateValue:forKey:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_availableDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "availableDevices");
}

id objc_msgSend_beginNewRepetitionPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginNewRepetitionPeriod");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_checkForVerificationEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForVerificationEpoch");
}

id objc_msgSend_commitNextVerificationEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "commitNextVerificationEpoch");
}

id objc_msgSend_continueRepetitionPeriod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "continueRepetitionPeriod");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_deviceWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithDescriptor:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfFile:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantFuture");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_dropAllUnlockTokensWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dropAllUnlockTokensWithError:");
}

id objc_msgSend_embeddedSecureElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedSecureElement");
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endSession");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_failedPasscodeAttempts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failedPasscodeAttempts");
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileDescriptor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_getHwSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHwSupport");
}

id objc_msgSend_getNextVerificationEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNextVerificationEpoch");
}

id objc_msgSend_getSpacedRepetitionTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpacedRepetitionTimeout");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleVerificationEpoch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleVerificationEpoch");
}

id objc_msgSend_hwType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwType");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUID:");
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialize");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_isPermanentlyBlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPermanentlyBlocked");
}

id objc_msgSend_isSeshatAvailabledInRestrictedMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSeshatAvailabledInRestrictedMode");
}

id objc_msgSend_isTemporarilyBlocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporarilyBlocked");
}

id objc_msgSend_isWipePending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWipePending");
}

id objc_msgSend_largeCrumbsFromError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "largeCrumbsFromError:");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_notePasscodeEntryBegan(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notePasscodeEntryBegan");
}

id objc_msgSend_notePasscodeUnlockFailed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notePasscodeUnlockFailed");
}

id objc_msgSend_notePasscodeUnlockSucceeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notePasscodeUnlockSucceeded");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLong:");
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

id objc_msgSend_readConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readConfig");
}

id objc_msgSend_registerEventListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventListener:");
}

id objc_msgSend_remoteProcessHasBooleanEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteProcessHasBooleanEntitlement:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_requestTapToRadar_preferences_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestTapToRadar:preferences:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retrievePasscodeFromFileHandle_ofLength_withbaseaddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrievePasscodeFromFileHandle:ofLength:withbaseaddress:");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_secureElementBootHistory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secureElementBootHistory:");
}

id objc_msgSend_sequenceCounter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sequenceCounter");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setupIntervals(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupIntervals");
}

id objc_msgSend_setupNextTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNextTimer");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedLockModelWithUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedLockModelWithUID:");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_smallCrumbsFromError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smallCrumbsFromError:");
}

id objc_msgSend_startSesHatSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSesHatSession:");
}

id objc_msgSend_stopSpacedRepetition(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSpacedRepetition");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeUntilUnblockedSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeUntilUnblockedSinceReferenceDate");
}

id objc_msgSend_unlockScreenTypeWithOutSimplePasscodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlockScreenTypeWithOutSimplePasscodeType:");
}

id objc_msgSend_unregisterEventListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterEventListener:");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_userDeleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userDeleted");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_waitForNotificationOrTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitForNotificationOrTimeout:");
}

id objc_msgSend_writeConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeConfig");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}
