uint64_t sub_100003E34()
{
  const char *v0;
  int v2;
  const char *v3;

  if (qword_100010398 != -1)
    dispatch_once(&qword_100010398, &stru_10000C490);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_100010390)
      v0 = "launchd";
    else
      v0 = "shell";
    v2 = 136315138;
    v3 = v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "started by %s", (uint8_t *)&v2, 0xCu);
  }
  return byte_100010390;
}

void sub_100003F18(id a1)
{
  uint64_t v1;

  v1 = 0;
  vproc_swap_integer(0, 5, 0, &v1);
  byte_100010390 = v1 != 0;
}

uint64_t sub_100003F5C()
{
  if (qword_1000103A8 != -1)
    dispatch_once(&qword_1000103A8, &stru_10000C4B0);
  return byte_1000103A0;
}

void sub_100003F9C(id a1)
{
  char has_internal_content;
  const char *v2;
  BOOL v3;
  uint8_t buf[4];
  const char *v5;

  if ((os_variant_has_internal_diagnostics("com.apple.sysdiagnose") & 1) != 0)
    has_internal_content = 1;
  else
    has_internal_content = os_variant_has_internal_content("com.apple.sysdiagnose");
  byte_1000103A0 = has_internal_content;
  v3 = 0;
  if (sub_100004128(CFSTR("customer-mode"), CFSTR("com.apple.sysdiagnose"), &v3) && v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Customer-mode enabled. Forcing external behavior.", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "To disable, run: 'sudo defaults write com.apple.sysdiagnose customer-mode -BOOL false; sudo pkill -9 sysdiagnose'",
        buf,
        2u);
    }
    byte_1000103A0 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1000103A0)
      v2 = "YES";
    else
      v2 = "NO";
    *(_DWORD *)buf = 136315138;
    v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Apple Internal: %s", buf, 0xCu);
  }
}

BOOL sub_100004128(void *a1, void *a2, BOOL *a3)
{
  __CFString *v5;
  const __CFString *v6;
  __CFString *v7;
  int AppBooleanValue;
  int v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  Boolean keyExistsAndHasValidFormat;

  v5 = a1;
  v6 = a2;
  v7 = (__CFString *)v6;
  if (v5 && v6 && a3)
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v6, &keyExistsAndHasValidFormat);
    v9 = keyExistsAndHasValidFormat;
    if (keyExistsAndHasValidFormat)
      *a3 = AppBooleanValue != 0;
    v10 = v9 != 0;
  }
  else
  {
    v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11)
      sub_1000077C4(v11, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

BOOL sub_1000041D4(const char *a1, const char *a2)
{
  size_t v4;
  size_t v5;
  size_t v6;
  size_t v7;
  const char *v8;
  const char *v9;

  v4 = strlen(a1);
  v5 = strlen(a2);
  v6 = v5;
  if (v5 >= v4)
    v7 = v4;
  else
    v7 = v5;
  if (!strncasecmp(a2, a1, v7))
    return 1;
  if (v6 <= v4)
    v8 = a1;
  else
    v8 = a2;
  if (v6 <= v4)
    v9 = a2;
  else
    v9 = a1;
  return strcasestr(v8, v9) != 0;
}

BOOL sub_100004248(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  _BYTE buffer[4096];

  v3 = a2;
  if (proc_pidpath((int)objc_msgSend(a1, "intValue"), buffer, 0x1000u) < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", buffer)));
    v5 = sub_1000041D4((const char *)objc_msgSend(v4, "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));

  }
  return v5;
}

BOOL sub_100004330(const void *a1)
{
  const void *v2;
  const void *v3;
  _BOOL8 v4;

  v2 = (const void *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = CFEqual(v2, a1) != 0;
  CFRelease(v3);
  return v4;
}

uint64_t sub_100004388()
{
  if (qword_1000103B8 != -1)
    dispatch_once(&qword_1000103B8, &stru_10000C4D0);
  return byte_1000103B0;
}

void sub_1000043C8(id a1)
{
  byte_1000103B0 = sub_100004330(CFSTR("AppleDisplay"));
}

uint64_t sub_1000043EC()
{
  _DWORD v1[2];

  if (qword_1000103C8 != -1)
    dispatch_once(&qword_1000103C8, &stru_10000C4F0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v1[0] = 67109120;
    v1[1] = byte_1000103C0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got result %d for isComputeModuleB check", (uint8_t *)v1, 8u);
  }
  return byte_1000103C0;
}

void sub_1000044B8(id a1)
{
  byte_1000103C0 = sub_1000044DC("manta-b");
}

uint64_t sub_1000044DC(const char *a1)
{
  io_iterator_t v2;
  io_object_t v3;
  kern_return_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  kern_return_t v16;
  io_registry_entry_t v18;
  kern_return_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  io_iterator_t iterator[2];
  uint8_t v27[4];
  _DWORD v28[3];
  io_name_t name;
  _BYTE v30[12];
  uint64_t v31;

  *(_QWORD *)iterator = 0;
  if (!a1)
  {
    v31 = 0;
    memset(name, 0, 80);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v20 = 3;
    else
      v20 = 2;
    *(_DWORD *)v30 = 134217984;
    *(_QWORD *)&v30[4] = 0;
    v21 = _os_log_send_and_compose_impl(v20, &v31, name, 80, &_mh_execute_header, &_os_log_default, 16);
    v22 = _os_crash_msg(v31, v21);
    sub_100007838(v22);
  }
  v2 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/");
  v3 = v2;
  iterator[1] = v2;
  if (v2)
  {
    v4 = IORegistryEntryCreateIterator(v2, "IODeviceTree", 0, iterator);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100007994(v4, v5, v6);
    }
    else
    {
      while (1)
      {
        v18 = IOIteratorNext(iterator[0]);
        if (!v18)
          break;
        memset(name, 0, sizeof(name));
        v19 = IORegistryEntryGetName(v18, name);
        if (v19)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100007954(v27, v19, v28);
        }
        else if (!strcmp(a1, name))
        {
          v15 = 1;
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7)
      sub_1000078E0(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = 0;
LABEL_9:
  if (iterator[0])
  {
    v16 = IOObjectRelease(iterator[0]);
    if (v16)
    {
      *(_QWORD *)v30 = 0;
      memset(name, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      LODWORD(v31) = 67109120;
      HIDWORD(v31) = v16;
      v24 = _os_log_send_and_compose_impl(v23, v30, name, 80, &_mh_execute_header, &_os_log_default, 16);
      v25 = _os_crash_msg(*(_QWORD *)v30, v24);
      sub_100007838(v25);
    }
  }
  if (v3 && IOObjectRelease(v3))
    sub_10000783C(v30, name);
  return v15;
}

void sub_1000047AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  sub_100004820(&a13);
  _Unwind_Resume(a1);
}

NSString *sub_1000047EC()
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sysdiagnose version %d.%d"), 3, 0);
}

uint64_t sub_100004820(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_100007A08(&v2, v3);
  }
  return result;
}

void sub_100004884(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100004894(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

void sub_1000048B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL sub_1000048C0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t start(int a1, char *const *a2)
{
  char *const *v2;
  id v5;
  id v6;
  Boolean (__cdecl **v7)(CFTypeRef, CFTypeRef);
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char *const *v30;
  char *const *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  FILE *v36;
  const char *v37;
  size_t v38;
  id v39;
  void *v40;
  NSMutableSet *v41;
  _BOOL4 v42;
  id v43;
  Boolean (__cdecl *v44)(CFTypeRef, CFTypeRef);
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSSet *v50;
  void *v51;
  const void *data;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  int v58;
  void *v59;
  id v60;
  int v61;
  char **v62;
  void *v63;
  char **v64;
  void *v65;
  void *v66;
  int v67;
  void *v69;
  _QWORD *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  const char *v75;
  id v77;
  _BOOL8 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  FILE *v86;
  id v87;
  _BOOL8 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BOOL8 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  _BOOL8 v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  id v113;
  uint64_t v114;
  void *i;
  void *v116;
  void *v117;
  void *v118;
  FILE *v119;
  id v120;
  FILE *v121;
  id v122;
  _BOOL8 v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  _BOOL4 v131;
  id v132;
  void *v133;
  uint64_t uint64;
  _BOOL8 v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  void *v144;
  _BOOL8 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  _BOOL8 v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  FILE *v162;
  id v163;
  void *v164;
  id v165;
  char *const *v166;
  void *v167;
  int v168;
  void *context;
  id v170;
  NSMutableSet *v171;
  id obj;
  id v173;
  id v174;
  _QWORD v175[4];
  id v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  id v181;
  option v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  char v197;
  char v198;
  _BYTE buf[120];
  _QWORD v200[2];
  _QWORD v201[2];

  context = objc_autoreleasePoolPush();
  if (sub_100003E34())
  {
    v154 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v154)
      sub_100007A98(v154, v155, v156, v157, v158, v159, v160, v161);
LABEL_184:
    exit(1);
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = objc_alloc_init((Class)NSMutableString);
  v7 = &CFEqual_ptr;
  v168 = a1 - 1;
  if (a1 >= 1)
  {
    v8 = a1;
    v2 = a2;
    do
    {
      v9 = (uint64_t)*v2++;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s "), v9));
      objc_msgSend(v6, "appendString:", v10);

      --v8;
    }
    while (v8);
  }
  v170 = v6;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("commandLineArgs"));
  opterr = 0;
  v193 = off_10000C5F8;
  v194 = unk_10000C608;
  v195 = xmmword_10000C618;
  v196 = unk_10000C628;
  v189 = off_10000C5B8;
  v190 = unk_10000C5C8;
  v191 = off_10000C5D8;
  v192 = unk_10000C5E8;
  v185 = off_10000C578;
  v186 = unk_10000C588;
  v187 = off_10000C598;
  v188 = unk_10000C5A8;
  v182 = off_10000C538;
  v183 = off_10000C558;
  v184 = unk_10000C568;
  v173 = objc_alloc_init((Class)NSMutableSet);
  v11 = 0;
  while (2)
  {
    while (1)
    {
      v12 = v11;
      v13 = getopt_long(a1, a2, "vhHcsbf:V:lqQnA:pPdDkFgGLXe:urRSC:x:", &v182, 0);
      if (v13 <= 15212)
        break;
      if (v13 == 15213)
      {
        if (!sub_100003F5C())
          goto LABEL_81;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        v20 = v5;
        v19 = v17;
        v18 = CFSTR("onlyRunContainersWithNames");
        goto LABEL_57;
      }
      if (v13 != 18213)
      {
        if (v13 != 20213)
        {
LABEL_78:
          fwrite("Unexpected option or insufficient arguments.", 0x2CuLL, 1uLL, __stderrp);
          fputc(10, __stderrp);
          sub_100006060();
          v58 = 64;
          goto LABEL_82;
        }
        v36 = __stderrp;
        v37 = "Platform does not support --collectAllTrusted flag";
        v38 = 50;
LABEL_80:
        fwrite(v37, v38, 1uLL, v36);
        fputc(10, __stderrp);
        goto LABEL_81;
      }
      if (!sub_100003F5C())
        goto LABEL_81;
      v16 = v5;
      v14 = &__kCFBooleanTrue;
      v15 = CFSTR("collectWifiDextCoreFiles");
LABEL_46:
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, v15);
      v11 = v12;
    }
    switch(v13)
    {
      case 'A':
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        v18 = CFSTR("archiveName");
        goto LABEL_26;
      case 'B':
      case 'E':
      case 'I':
      case 'J':
      case 'K':
      case 'M':
      case 'N':
      case 'O':
      case 'T':
      case 'U':
      case 'W':
      case 'Y':
      case 'Z':
      case '[':
      case '\\':
      case ']':
      case '^':
      case '_':
      case 'a':
      case 'e':
      case 'i':
      case 'j':
      case 'm':
      case 'o':
      case 's':
      case 't':
      case 'w':
        goto LABEL_78;
      case 'C':
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        if (objc_msgSend(CFSTR("yaa"), "isEqualToString:", v17))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Compression type: yaa", buf, 2u);
          }
          v19 = &__kCFBooleanTrue;
          v18 = CFSTR("useParallelCompression");
LABEL_56:
          v20 = v5;
LABEL_57:
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v18);
          goto LABEL_58;
        }
        if (objc_msgSend(CFSTR("tar"), "isEqualToString:", v17))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          *(_WORD *)buf = 0;
          v25 = "Compression type: tar";
          goto LABEL_62;
        }
        if (objc_msgSend(CFSTR("no-compression"), "isEqualToString:", v17))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "--compression=no-compression (functions the same as -n flag)", buf, 2u);
          }
          v19 = &__kCFBooleanFalse;
          v18 = CFSTR("shouldCreateTarBall");
          goto LABEL_56;
        }
        if (objc_msgSend(CFSTR("default"), "isEqualToString:", v17))
        {
          if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          *(_WORD *)buf = 0;
          v25 = "Default compression requested. Using tar";
LABEL_62:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v25, buf, 2u);
LABEL_58:

          v11 = v12;
          continue;
        }
        v86 = __stderrp;
        v87 = objc_retainAutorelease(v17);
        fprintf(v86, "Error: compression type '%s' not found", (const char *)objc_msgSend(v87, "UTF8String"));
        fputc(10, __stderrp);

LABEL_81:
        v58 = 69;
LABEL_82:
        v59 = v6;
LABEL_83:

        if (v58)
          exit(v58);
        if (geteuid())
        {
          fwrite("sysdiagnose must be run as root", 0x1FuLL, 1uLL, __stderrp);
          fputc(10, __stderrp);
          goto LABEL_184;
        }
        if (qword_1000103E8 != -1)
          dispatch_once(&qword_1000103E8, &stru_10000C698);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("SDRequestSourceShell"));
        if (!isatty(1))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("verbose"));
        if ((byte_1000103D0 & 1) == 0)
        {
          v60 = objc_msgSend(v5, "copy");
          v61 = sub_100003F5C();
          v62 = &off_100010368;
          if (!v61)
            v62 = &off_100010360;
          printf("%s", *v62);
          putchar(10);
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("pidOrProcess")));
          if ((sub_100006A0C(v63, CFSTR("/Applications/Mail.app/Contents/MacOS/Mail")) & 1) != 0)
          {
            v64 = &off_100010370;
            goto LABEL_96;
          }
          if (sub_100006A0C(v63, CFSTR("/Applications/Safari.app/Contents/MacOS/Safari")))
          {
            v64 = &off_100010378;
LABEL_96:
            printf("%s", *v64);
            putchar(10);
          }
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "objectForKey:", CFSTR("setNoTimeOut")));
          v66 = v65;
          if (v65 && objc_msgSend(v65, "BOOLValue"))
          {
            printf("%s", off_100010380);
            putchar(10);
          }
          printf("Press 'Enter' to continue. Ctrl+\\ to cancel.");
          putchar(10);
          if (!isatty(1))
          {
            fwrite("Triggering sysdiagnose programmatically from CLI with incorrect arguments. Exiting.", 0x53uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            exit(64);
          }
          do
            v67 = fgetc(__stdinp) << 24;
          while (v67 != 218103808 && v67 != 167772160);

        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("verbose")));

        if (v69)
        {
          v70 = 0;
        }
        else
        {
          v175[0] = _NSConcreteStackBlock;
          v175[1] = 3221225472;
          v175[2] = sub_100005D8C;
          v175[3] = &unk_10000C518;
          v176 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldCreateTarBall")));
          v71 = v176;
          v70 = objc_retainBlock(v175);

        }
        v174 = 0;
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[Libsysdiagnose sysdiagnoseWithMetadata:withError:withProgressHandler:](Libsysdiagnose, "sysdiagnoseWithMetadata:withError:withProgressHandler:", v5, &v174, v70));
        v73 = v174;
        if (v72)
        {
          v74 = objc_retainAutorelease(v72);
          printf("\nOutput available at '%s'.", (const char *)objc_msgSend(v74, "UTF8String"));
          putchar(10);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v75 = (const char *)objc_msgSend(objc_retainAutorelease(v74), "UTF8String");
            LODWORD(v182.name) = 136315138;
            *(const char **)((char *)&v182.name + 4) = v75;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nOutput available at '%s'.", (uint8_t *)&v182, 0xCu);
          }
        }
        if (v73)
        {
          v162 = __stderrp;
          v163 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedDescription")));
          fprintf(v162, "sysdiagnose error: %s", (const char *)objc_msgSend(v163, "UTF8String"));

          fputc(10, __stderrp);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            sub_100007ACC(v73);
          goto LABEL_184;
        }

        objc_autoreleasePoolPop(context);
        return 0;
      case 'D':
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldRunLogCopyTasks");
        goto LABEL_45;
      case 'F':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("shouldGetFeedbackData");
        goto LABEL_45;
      case 'G':
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldRunLogGenerationTasks");
        goto LABEL_45;
      case 'H':
        v153 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory")));
        printf("Sysdiagnoses can be found at '%s'\n", (const char *)objc_msgSend(v153, "UTF8String"));

        goto LABEL_177;
      case 'L':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("capOverrideFullLogarchive");
        goto LABEL_45;
      case 'P':
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldRunTimeSensitiveTasks");
        goto LABEL_45;
      case 'Q':
      case 'q':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("quickMode");
        goto LABEL_45;
      case 'R':
        v14 = &__kCFBooleanFalse;
        goto LABEL_40;
      case 'S':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("disableStreamTar");
        goto LABEL_45;
      case 'V':
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        v18 = CFSTR("rootPath");
LABEL_26:
        v20 = v5;
        v19 = v17;
        goto LABEL_57;
      case 'X':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("setNoTimeOut");
        goto LABEL_45;
      case 'b':
        goto LABEL_44;
      case 'c':
        if (sub_100004388())
        {
          v36 = __stderrp;
          v37 = "Platform does not support -c flag.";
          v38 = 34;
          goto LABEL_80;
        }
        v11 = 1;
        if ((sub_1000043EC() & 1) != 0)
          continue;
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("coSysdiagnose");
LABEL_45:
        v16 = v5;
        goto LABEL_46;
      case 'd':
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunTimeSensitiveTasks"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunLogGenerationTasks"));
        v21 = &__kCFBooleanTrue;
        v22 = v5;
        goto LABEL_38;
      case 'f':
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        if ((objc_msgSend(v26, "hasPrefix:", CFSTR(".")) & 1) != 0
          || (objc_msgSend(v26, "hasPrefix:", CFSTR("/")) & 1) == 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentDirectoryPath"));
          v29 = v5;
          v30 = v2;
          v31 = a2;
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingPathComponent:", v26));

          v26 = (void *)v32;
          a2 = v31;
          v2 = v30;
          v5 = v29;
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByResolvingSymlinksInPath"));
        v34 = sub_100006AEC(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("baseDirectory"));

        v11 = v12;
        v7 = &CFEqual_ptr;
        continue;
      case 'g':
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunTimeSensitiveTasks"));
        v23 = &__kCFBooleanTrue;
        v24 = v5;
        goto LABEL_37;
      case 'h':
        sub_100006060();
LABEL_177:
        exit(0);
      case 'k':
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldRemoveTemporaryDirectory");
        goto LABEL_45;
      case 'l':
        byte_1000103D0 = 1;
        continue;
      case 'n':
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldCreateTarBall");
        goto LABEL_45;
      case 'p':
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("shouldRunTimeSensitiveTasks"));
        v24 = v5;
        v23 = &__kCFBooleanFalse;
LABEL_37:
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, CFSTR("shouldRunLogGenerationTasks"));
        v22 = v5;
        v21 = &__kCFBooleanFalse;
LABEL_38:
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("shouldRunLogCopyTasks"));
        v15 = CFSTR("shouldRunOSLogArchive");
        v16 = v5;
        v14 = &__kCFBooleanFalse;
        goto LABEL_46;
      case 'r':
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunTimeSensitiveTasks"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunLogGenerationTasks"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanFalse, CFSTR("shouldRunLogCopyTasks"));
        v14 = &__kCFBooleanTrue;
LABEL_40:
        v15 = CFSTR("shouldRunOSLogArchive");
        goto LABEL_45;
      case 'u':
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("disableUIFeedback"));
        byte_1000103D0 = 1;
LABEL_44:
        v14 = &__kCFBooleanFalse;
        v15 = CFSTR("shouldDisplayTarBall");
        goto LABEL_45;
      case 'v':
        v14 = &__kCFBooleanTrue;
        v15 = CFSTR("verbose");
        goto LABEL_45;
      case 'x':
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithUTF8String:", optarg));
        objc_msgSend(v173, "addObject:", v17);
        goto LABEL_58;
      default:
        if (v13 != -1)
          goto LABEL_78;
        v39 = objc_msgSend(v173, "copy");
        if (!objc_msgSend(v39, "count"))
        {
          v77 = v39;
          goto LABEL_153;
        }
        v200[0] = CFSTR("CLI_REQUEST_TYPE");
        v200[1] = CFSTR("REQUEST_DATA");
        v201[0] = CFSTR("validateRemoteUUIDs");
        v201[1] = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v201, v200, 2));
        v41 = objc_opt_new(NSMutableSet);
        v181 = 0;
        v42 = sub_100006140(0xCu, v40, &v181);
        v43 = v181;
        v167 = v43;
        if (v42 && v43)
        {
          v171 = v41;
          v164 = v40;
          v165 = v39;
          v166 = a2;
          v44 = v7[28];
          v45 = v43;
          v46 = objc_opt_class(v44);
          v47 = objc_opt_class(NSMutableDictionary);
          v48 = objc_opt_class(NSDictionary);
          v49 = objc_opt_class(NSNumber);
          v50 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v46, v47, v48, v49, objc_opt_class(NSNull), 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
          *(_QWORD *)buf = 0;
          data = xpc_dictionary_get_data(v45, "RESPONSE_DATA", (size_t *)buf);

          if (!data)
          {
            v88 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v88)
              sub_100007BF0(v88, v89, v90, v91, v92, v93, v94, v95);

            a2 = v166;
            v7 = &CFEqual_ptr;
            goto LABEL_148;
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", data, *(_QWORD *)buf));
          if (!v53)
          {
            v96 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            a2 = v166;
            v7 = &CFEqual_ptr;
            if (v96)
              sub_100007CB4(v96, v97, v98, v99, v100, v101, v102, v103);
            v57 = 0;
LABEL_132:

            if (v57)
            {
              v179 = 0u;
              v180 = 0u;
              v177 = 0u;
              v178 = 0u;
              obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "allKeys"));
              v112 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, buf, 16);
              if (v112)
              {
                v113 = v112;
                v114 = *(_QWORD *)v178;
                do
                {
                  for (i = 0; i != v113; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v178 != v114)
                      objc_enumerationMutation(obj);
                    v116 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * (_QWORD)i);
                    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectForKey:", v116));
                    v118 = v117;
                    if (v117)
                    {
                      if (objc_msgSend(v117, "BOOLValue"))
                      {
                        -[NSMutableSet addObject:](v171, "addObject:", v116);
                      }
                      else
                      {
                        v121 = __stderrp;
                        v122 = objc_retainAutorelease(v116);
                        fprintf(v121, "Remote UUID '%s' not found", (const char *)objc_msgSend(v122, "UTF8String"));
                        fputc(10, __stderrp);
                        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                          sub_100007C6C((int)&v197, v122);
                      }
                    }
                    else
                    {
                      v119 = __stderrp;
                      v120 = objc_retainAutorelease(v116);
                      fprintf(v119, "Malformed daemon response. Remote UUID '%s' not found", (const char *)objc_msgSend(v120, "UTF8String"));
                      fputc(10, __stderrp);
                      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                        sub_100007C24((int)&v198, v120);
                    }

                  }
                  v113 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v177, buf, 16);
                }
                while (v113);
              }

              v77 = -[NSMutableSet copy](v171, "copy");
              v41 = v171;
              a2 = v166;
              v7 = &CFEqual_ptr;
LABEL_151:
              v40 = v164;
              v39 = v165;
              goto LABEL_152;
            }
LABEL_148:
            fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            v123 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v123)
              sub_100007BBC(v123, v124, v125, v126, v127, v128, v129, v130);
            v41 = v171;
            v77 = -[NSMutableSet copy](v171, "copy");
            goto LABEL_151;
          }
          *(_QWORD *)&v177 = 0;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClasses:fromData:error:", v51, v53, &v177));
          v55 = (id)v177;
          a2 = v166;
          v7 = &CFEqual_ptr;
          if (v54)
          {
            v56 = objc_opt_class(NSDictionary);
            if ((objc_opt_isKindOfClass(v54, v56) & 1) != 0)
            {
              v57 = v54;
LABEL_131:

              goto LABEL_132;
            }
            v104 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v104)
              sub_100007D68(v104, v105, v106, v107, v108, v109, v110, v111);
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_100007CE8(v55);
          }
          v57 = 0;
          goto LABEL_131;
        }
        fwrite("Malformed daemon response. Assuming provided remoteUUIDs invalid", 0x40uLL, 1uLL, __stderrp);
        fputc(10, __stderrp);
        v78 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v78)
          sub_100007BBC(v78, v79, v80, v81, v82, v83, v84, v85);
        v77 = -[NSMutableSet copy](v41, "copy");
LABEL_152:

LABEL_153:
        if (objc_msgSend(v77, "count"))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, CFSTR("remoteUUIDs"));
        v59 = v170;
        if ((v12 & 1) == 0)
          goto LABEL_168;
        *(_QWORD *)&v177 = 0;
        v131 = sub_100006140(0xCu, &off_10000CE78, &v177);
        v132 = (id)v177;
        v133 = v132;
        if (v131 && v132)
        {
          uint64 = xpc_dictionary_get_uint64(v132, "RESPONSE_DATA");
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = uint64;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "isAutomaticCoSysdiagnosePossible: received response from server '%llu'", buf, 0xCu);
          }

          if (uint64)
            goto LABEL_167;
        }
        else
        {
          v135 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v135)
            sub_100007B88(v135, v136, v137, v138, v139, v140, v141, v142);

        }
        if (!objc_msgSend(v77, "count"))
        {
          v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldCollectAllTrusted")));

          if (!v143)
          {
            fwrite("No connected devices found. Co-sysdiagnose options not available.", 0x41uLL, 1uLL, __stderrp);
            fputc(10, __stderrp);
            v145 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v145)
              sub_100007B54(v145, v146, v147, v148, v149, v150, v151, v152);
            v58 = 69;
            goto LABEL_171;
          }
        }
LABEL_167:
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("coSysdiagnoseOnly"));
LABEL_168:
        if (optind == v168)
        {
          v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[28], "stringWithCString:encoding:", a2[optind], 4));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v144, CFSTR("pidOrProcess"));

        }
        v58 = 0;
LABEL_171:

        goto LABEL_83;
    }
  }
}

size_t sub_100005D8C(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  FILE *v10;
  const char *v11;
  size_t v12;
  FILE *v13;
  const char *v14;
  size_t v15;
  uint64_t v17;
  __int128 v18;
  int v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  char __str[4];
  char v25;
  char __s[16];
  __int128 v27;
  __int128 v28;
  _BYTE v29[30];
  char v30;

  v3 = sdProgressPercent;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", sdProgressPhase));
  v9 = objc_msgSend(v8, "unsignedLongLongValue");

  switch((unint64_t)v9)
  {
    case 0uLL:
      v10 = __stdoutp;
      v11 = "\nInvalid Sysdiagnose state. Aborting.\n";
      v12 = 38;
      return fwrite(v11, v12, 1uLL, v10);
    case 1uLL:
      v13 = __stdoutp;
      v14 = "Progress:\n";
      v15 = 10;
      goto LABEL_6;
    case 3uLL:
      return fputc(10, __stdoutp);
    case 4uLL:
      v13 = __stdoutp;
      v14 = "\nCo-sysdiagnose transfer progress:\n";
      v15 = 35;
LABEL_6:
      fwrite(v14, v15, 1uLL, v13);
      goto LABEL_7;
    case 6uLL:
      v10 = __stdoutp;
      v11 = "\nCo-sysdiagnose Transfer Timed out\n";
      v12 = 35;
      return fwrite(v11, v12, 1uLL, v10);
    default:
LABEL_7:
      v30 = 0;
      v17 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)&v18 = 0x5F5F5F5F5F5F5F5FLL;
      *((_QWORD *)&v18 + 1) = 0x5F5F5F5F5F5F5F5FLL;
      *(_OWORD *)__s = v18;
      v27 = v18;
      v28 = v18;
      *(_OWORD *)v29 = v18;
      *(_OWORD *)&v29[14] = v18;
      v25 = 0;
      *(_DWORD *)__str = 0;
      v19 = strlen(__s);
      v20 = (int)(v7 * (double)v19 / 100.0);
      if ((int)v20 >= 1)
        memset(__s, 124, v20);
      snprintf(__str, 5uLL, "%02d%%", (int)v7);
      if (v19 >= 0x2D)
      {
        v21 = strlen(__str);
        if (v21 >= 4)
          v22 = 4;
        else
          v22 = v21;
        __memcpy_chk((char *)&v28 + 7, __str, v22, 40);
      }
      fprintf(__stdoutp, "\x1B[J\x1B[2K[%s]\r", __s);
      if (v7 > 99.9 && v17 != 0)
        fwrite("\nCompressing final diagnostics\n", 0x1FuLL, 1uLL, __stdoutp);
      return fflush(__stdoutp);
  }
}

uint64_t sub_100006060()
{
  const char *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  const char *v5;
  const char *v6;
  NSString *v7;
  id v8;

  v0 = getprogname();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "arguments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", 0));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent")));
  v5 = (const char *)objc_msgSend(v4, "UTF8String");

  if (sub_100003F5C())
    v6 = off_100010388;
  else
    v6 = "";
  v7 = sub_1000047EC();
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
  printf("%s\nUSAGE: %s [args] [process_name | pid]\n          -h                      Display this help.\n          -H                      Print the path to the default sysdiagnose output directory.\n          -v                      Enable verbose mode to display the container information as it executes.\n          -f results_directory    Specify the directory where results will be stored.\n          -A archive_name         Specify the name of the archive created in the results directory.\n          -V volume_path          Specify the root volume for sysdiagnose to run on.\n          -C, --compression type  Specify the compression type. It is an error to use this with the -n flag. Valid options are:\n                                  yaa: use parallel compression\n                                  tar: use tar compression\n                                  no-compression: don't compress the output. Identical to -n\n                                  default: will use the system default. Currently defaults to tar\n          -n                      Do not tar the resulting sysdiagnose directory.\n          -k                      Do not remove the temporary directory.\n          -F                      Get feedback data.\n          -S                      Disable streaming to tarball.\n          -u                      Disable UI feedback.\n"
    "          -Q,                     Skip footprint.\n"
    "          -q,                     Same as -Q\n"
    "          -b                      Do not show a Finder window upon completion.\n"
    "          -p                      Only run time-sensitive collections; disregards previous -d or -r flags.\n"
    "          -P                      Do not run time-sensitive collections.\n"
    "          -g                      Only run log generation collections; disregards previous -p or -r flags.\n"
    "          -G                      Do not run log generation collections.\n"
    "          -d                      Only run log copying collections; disregards previous -p or -r flags.\n"
    "          -D                      Do not run log copying collections.\n"
    "          -r                      Collect only log archive; disregards previous -p or -d flags.\n"
    "          -R                      Do not collect log archive.\n"
    "          [process_name | pid]    If a single process appears to be slowing down the system,\n"
    "                                  passing in the process name or ID as the argument gathers\n"
    "                                  additional process-specific diagnostic data; Specify only ONE process\n"
    "                                  at a time -- specifying multiple processes is not supported.\n"
    "%s\n"
    "DESCRIPTION:\n"
    "  %s gathers system diagnostic information helpful in investigating system performance issues.\n"
    "  A great deal of information is harvested, spanning system state and configuration. The data is stored /var/tmp dir"
    "ectory.\n"
    "  sysdiagnose needs to be run as root. To cancel an in-flight sysdiagnose triggered via command line interface, pres"
    "s Ctrl-\\.\n"
    "  %s is automatically triggered when the following key chord is pressed: Control-Option-Command-Shift-Period.\n"
    "WHAT %s COLLECTS:\n"
    "  - A spindump of the system\n"
    "  - Several seconds of top output\n"
    "  - Data about kernel zones\n"
    "  - Status of loaded kernel extensions\n"
    "  - Resident memory usage of user processes\n"
    "  - Recent system logs\n"
    "  - A System Profiler report\n"
    "  - Recent crash reports\n"
    "  - Disk usage information\n"
    "  - I/O Kit registry information\n"
    "  - Network status\n"
    "  - If a specific process is supplied as an argument, will collect:\n"
    "      - A list of malloc-allocated buffers in the process's heap\n"
    "      - Data about unreferenced malloc buffers in the process's memory\n"
    "      - Data about the virtual memory regions allocated in the process\n",
    (const char *)objc_msgSend(v8, "UTF8String"),
    v5,
    v6,
    v0,
    v0,
    v0);

  return putchar(10);
}

BOOL sub_100006140(unsigned int a1, void *a2, _QWORD *a3)
{
  id v5;
  xpc_object_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  Boolean (__cdecl **v11)(CFTypeRef, CFTypeRef);
  void *i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  const void *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  id v28;
  id v29;
  void *v30;
  FILE *v31;
  id v32;
  _xpc_connection_s *v33;
  xpc_object_t v34;
  FILE *v35;
  const char *string;
  _BOOL8 v37;
  uint64_t uint64;
  uint64_t v39;
  _QWORD *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char v48;
  _BYTE v49[128];

  v5 = a2;
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "REQUEST_TYPE", a1);
  if (v5)
  {
    v42 = a3;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v45;
      v43 = v7;
      v11 = &CFEqual_ptr;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v13));
          v15 = objc_opt_class(v11[25]);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            xpc_dictionary_set_BOOL(v6, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), (BOOL)objc_msgSend(v14, "BOOLValue"));
          }
          else
          {
            v16 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
            {
              xpc_dictionary_set_string(v6, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
            }
            else
            {
              v17 = objc_opt_class(NSDictionary);
              if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0));
                if (v18)
                {
                  v19 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
                  v20 = objc_retainAutorelease(v18);
                  v21 = objc_msgSend(v20, "bytes");
                  v22 = v20;
                  v7 = v43;
                  v23 = objc_msgSend(v22, "length");
                  v24 = v21;
                  v11 = &CFEqual_ptr;
                  xpc_dictionary_set_data(v6, v19, v24, (size_t)v23);
                }

              }
              else
              {
                v25 = objc_opt_class(NSSet);
                if ((objc_opt_isKindOfClass(v14, v25) & 1) != 0)
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, 0));
                  if (v26)
                  {
                    v27 = (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
                    v28 = objc_retainAutorelease(v26);
                    v29 = objc_msgSend(v28, "bytes");
                    v30 = v28;
                    v11 = &CFEqual_ptr;
                    xpc_dictionary_set_data(v6, v27, v29, (size_t)objc_msgSend(v30, "length"));
                  }

                  v7 = v43;
                }
                else
                {
                  v31 = __stderrp;
                  v32 = objc_retainAutorelease(v13);
                  fprintf(v31, "Undefined type in the metadata for key '%s': not including in request", (const char *)objc_msgSend(v32, "UTF8String"));
                  v11 = &CFEqual_ptr;
                  fputc(10, __stderrp);
                  v7 = v43;
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                    sub_100007E10((int)&v48, v32);
                }
              }
            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v9);
    }

    a3 = v42;
  }

  if (qword_1000103E0 != -1)
    dispatch_once(&qword_1000103E0, &stru_10000C638);
  v33 = (_xpc_connection_s *)(id)qword_1000103D8;
  v34 = xpc_connection_send_message_with_reply_sync(v33, v6);
  if (xpc_get_type(v34) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64 = (unsigned __int16)xpc_dictionary_get_uint64(v34, "RESPONSE_TYPE");
    v39 = xpc_dictionary_get_uint64(v34, "FAILURE_REASON");
    v37 = uint64 == 1 || v39 == 7;
    if (a3 && v37)
    {
      *a3 = objc_retainAutorelease(v34);
      v37 = 1;
    }
  }
  else
  {
    v35 = __stderrp;
    string = xpc_dictionary_get_string(v34, _xpc_error_key_description);
    fprintf(v35, "Received error from the daemon: %s", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100007D9C(v34, _xpc_error_key_description);
    v37 = 0;
  }

  return v37;
}

void sub_1000065EC(id a1)
{
  dispatch_queue_global_t global_queue;
  _xpc_connection_s *mach_service;
  void *v3;
  _xpc_connection_s *v4;
  NSObject *v5;

  global_queue = dispatch_get_global_queue(33, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  mach_service = xpc_connection_create_mach_service("com.apple.sysdiagnose.service.xpc", v5, 2uLL);
  xpc_connection_set_event_handler(mach_service, &stru_10000C678);
  v3 = (void *)qword_1000103D8;
  qword_1000103D8 = (uint64_t)mach_service;
  v4 = mach_service;

  xpc_connection_resume((xpc_connection_t)qword_1000103D8);
}

void sub_100006674(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  FILE *v3;
  const char *string;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = __stderrp;
    string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
    fprintf(v3, "XPC connection to daemon '%s' received error: %s.", "com.apple.sysdiagnose.service.xpc", string);
    fputc(10, __stderrp);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100007E58(v2, _xpc_error_key_description);
  }

}

void sub_10000672C(id a1)
{
  dispatch_queue_global_t global_queue;
  dispatch_source_t v2;
  void *v3;
  dispatch_source_t v4;
  void *v5;
  dispatch_source_t v6;
  void *v7;
  dispatch_source_t v8;
  void *v9;
  NSObject *queue;

  global_queue = dispatch_get_global_queue(25, 0);
  queue = objc_claimAutoreleasedReturnValue(global_queue);
  signal(2, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 2uLL, 0, queue);
  v3 = (void *)qword_1000103F0;
  qword_1000103F0 = (uint64_t)v2;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103F0, &stru_10000C6B8);
  dispatch_resume((dispatch_object_t)qword_1000103F0);
  signal(15, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(18, (void (__cdecl *)(int))1);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, queue);
  v5 = (void *)qword_100010400;
  qword_100010400 = (uint64_t)v4;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100010400, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_100010400);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x12uLL, 0, queue);
  v7 = (void *)qword_1000103F8;
  qword_1000103F8 = (uint64_t)v6;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000103F8, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_1000103F8);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 3uLL, 0, queue);
  v9 = (void *)qword_100010408;
  qword_100010408 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100010408, &stru_10000C6D8);
  dispatch_resume((dispatch_object_t)qword_100010408);

}

void sub_100006890(id a1)
{
  _BOOL8 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!sub_100006140(6u, 0, 0))
  {
    fwrite("Sysdiagnose request to daemon for user interrupt failed", 0x37uLL, 1uLL, __stderrp);
    fputc(10, __stderrp);
    v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v1)
      sub_100007EEC(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_100006904(id a1)
{
  uint8_t v1[16];
  uint8_t buf[16];

  printf("\nCleaning up can take up to a minute...");
  putchar(10);
  if (sub_100006140(4u, 0, 0))
  {
    printf("Sysdiagnose cancelled successfully.");
    putchar(10);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose cancelled successfully.", buf, 2u);
    }
    exit(0);
  }
  fwrite("Encountered error during user-initiated cancellation.", 0x35uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Encountered error during user-initiated cancellation.", v1, 2u);
  }
  exit(1);
}

id sub_100006A0C(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "intValue");
  if ((_DWORD)v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5));
    v7 = (id)sub_100004248(v6, v4);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v7 = objc_msgSend(v3, "isEqualToString:", v6);
  }
  v8 = v7;

  return v8;
}

void sub_100006AA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100006AB8(int a1, id a2)
{
  return objc_retainAutorelease(a2);
}

void sub_100006AC8(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, v4, 0xCu);
}

id sub_100006AEC(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[2];
  _BYTE v17[128];

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("/var"), CFSTR("/tmp"), CFSTR("/etc"), 0));
  v3 = v1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  v5 = v3;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v13;
    v5 = v3;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v2);
        if (objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8)))
        {
          v16[0] = CFSTR("/private");
          v16[1] = v3;
          v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
          v10 = objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v9));

          v5 = (void *)v10;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

  return v5;
}

void sub_100006D34(id a1)
{
  void *v1;

  v1 = (void *)qword_100010410;
  qword_100010410 = (uint64_t)&off_10000CEA0;

}

id sub_100006FB4()
{
  if (qword_100010420 != -1)
    dispatch_once(&qword_100010420, &stru_10000C758);
  return (id)qword_100010428;
}

BOOL sub_100006FF4(id a1, NSURL *a2, NSError *a3)
{
  NSError *v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  v4 = sub_100006FB4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100007F20(v3, v5);

  return 1;
}

void sub_100007794(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.sysdiagnose.CacheDelete", "enumerator");
  v2 = (void *)qword_100010428;
  qword_100010428 = (uint64_t)v1;

}

void sub_1000077C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004884((void *)&_mh_execute_header, &_os_log_default, a3, "%s called with invalid args", a5, a6, a7, a8, 2u);
  sub_1000048AC();
}

void sub_10000783C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000048C0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_100004894(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000078E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004884((void *)&_mh_execute_header, &_os_log_default, a3, "failed to find ioreg path: %{public}s", a5, a6, a7, a8, 2u);
  sub_1000048AC();
}

void sub_100007954(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  sub_1000048B4((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "IORegistryEntryGetName: %d", a1);
}

void sub_100007994(int a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_1000048B4((void *)&_mh_execute_header, &_os_log_default, a3, "failed to create IORegistryEntryCreateIterator: %d", (uint8_t *)v3);
}

void sub_100007A08(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000048C0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_100004894(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100007A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Error: sysdiagnose cli should not be invoked by launchd", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007ACC(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription")));
  objc_msgSend(v1, "UTF8String");
  sub_100004884((void *)&_mh_execute_header, &_os_log_default, v2, "sysdiagnose error: %s", v3, v4, v5, v6, 2u);

  sub_100006AD8();
}

void sub_100007B54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "No connected devices found. Co-sysdiagnose options not available.", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Malformed daemon response. Assuming automatic co-sysdiagnose not possible", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007BBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Malformed daemon response. Assuming provided remoteUUIDs invalid", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "xpc_dictionary_get_data returned nothing for 'RESPONSE_DATA' from daemon response for UUID dict", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007C24(int a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(sub_100006AB8(a1, a2), "UTF8String");
  *v3 = 136315138;
  *v2 = v4;
  sub_100006AC8((void *)&_mh_execute_header, &_os_log_default, v5, "Malformed daemon response. Remote UUID '%s' not found");
  sub_100006AE4();
}

void sub_100007C6C(int a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(sub_100006AB8(a1, a2), "UTF8String");
  *v3 = 136315138;
  *v2 = v4;
  sub_100006AC8((void *)&_mh_execute_header, &_os_log_default, v5, "Remote UUID '%s' not found");
  sub_100006AE4();
}

void sub_100007CB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to get NSData from raw data UUID dict", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007CE8(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription"));
  sub_100004884((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to deserialize xpc data for UUID dict: %@", v3, v4, v5, v6, 2u);

  sub_100006AD8();
}

void sub_100007D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Daemon response data for UUID dict not of type NSDictionary", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007D9C(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  xpc_dictionary_get_string(a1, a2);
  sub_100004884((void *)&_mh_execute_header, &_os_log_default, v2, "Received error from the daemon: %s", v3, v4, v5, v6, 2u);
}

void sub_100007E10(int a1, void *a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  uint64_t v5;

  v4 = objc_msgSend(sub_100006AB8(a1, a2), "UTF8String");
  *v3 = 136315138;
  *v2 = v4;
  sub_100006AC8((void *)&_mh_execute_header, &_os_log_default, v5, "Undefined type in the metadata for key '%s': not including in request");
  sub_100006AE4();
}

void sub_100007E58(void *a1, const char *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  const char *string;

  v2 = 136315394;
  v3 = "com.apple.sysdiagnose.service.xpc";
  v4 = 2080;
  string = xpc_dictionary_get_string(a1, a2);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "XPC connection to daemon '%s' received error: %s.", (uint8_t *)&v2, 0x16u);
}

void sub_100007EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006AA0((void *)&_mh_execute_header, &_os_log_default, a3, "Sysdiagnose request to daemon for user interrupt failed", a5, a6, a7, a8, 0);
  sub_100006AB0();
}

void sub_100007F20(void *a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localizedDescription")));
  v4 = 136446210;
  v5 = objc_msgSend(v3, "UTF8String");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CacheEnumerator error: %{public}s", (uint8_t *)&v4, 0xCu);

}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arguments");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
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

id objc_msgSend_currentDirectoryPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDirectoryPath");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumerators(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerators");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initCacheEnumeratorWithVolume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initCacheEnumeratorWithVolume:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSysdiagnoseFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSysdiagnoseFile:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathComponents");
}

id objc_msgSend_pathSubmission(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathSubmission");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relativePath");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipDescendants");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByResolvingSymlinksInPath");
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

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_sysdiagnoseDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseDirectory");
}

id objc_msgSend_sysdiagnoseEnumerator_WithVolume_WithFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseEnumerator:WithVolume:WithFlags:");
}

id objc_msgSend_sysdiagnoseInternalDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseInternalDirectory");
}

id objc_msgSend_sysdiagnoseWithMetadata_withError_withProgressHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sysdiagnoseWithMetadata:withError:withProgressHandler:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_validFileSubstrings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validFileSubstrings");
}
