uint64_t start(int a1, uint64_t a2)
{
  kern_return_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;
  unsigned __int8 v12;
  unsigned __int8 *v13;
  char *v14;
  kern_return_t CFProperties;
  const char *v16;
  const char *v17;
  int v18;
  int v19;
  UInt8 *v20;
  UInt8 *v21;
  ssize_t v22;
  __CFReadStream *v23;
  __CFReadStream *v24;
  uint64_t v25;
  const __CFDictionary *v26;
  const __CFDictionary *v27;
  kern_return_t v28;
  const __CFData *Data;
  const __CFData *v30;
  const UInt8 *BytePtr;
  size_t Length;
  const char *v33;
  mach_error_t v34;
  FILE *v35;
  FILE *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  mach_error_t v42;
  __uint32_t v43;
  int v44;
  FILE *v45;
  FILE *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  __uint32_t v50;
  char *v51;
  const char *v52;
  char *v53;
  const __CFString *v54;
  __CFString *v55;
  __CFData *MutableCopy;
  int v57;
  int v58;
  const __CFString *v59;
  __CFString *CFProperty;
  CFTypeID v61;
  size_t v62;
  CFIndex v63;
  CFIndex v64;
  uint64_t v65;
  size_t v66;
  CFTypeID v67;
  CFTypeID v68;
  CFIndex v69;
  size_t v70;
  size_t v71;
  const UInt8 *v72;
  CFTypeID v73;
  CFIndex v74;
  CFIndex MaximumSizeForEncoding;
  uint64_t CString;
  CFTypeID v77;
  CFTypeID TypeID;
  char *v79;
  char *v80;
  const char *v81;
  size_t v82;
  mach_error_t v83;
  uint64_t v84;
  uint64_t result;
  FILE *v86;
  char *v87;
  int v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  mach_port_t mainPort;
  stat properties[14];
  CFPropertyListFormat context[32];

  mainPort = 0;
  byte_100008000 = csr_check(16) == 0;
  v4 = IOMainPort(bootstrap_port, &mainPort);
  if (v4)
    sub_100003128(v4);
  v5 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  v6 = &byte_100008000;
  dword_100008004 = v5;
  if (!(_DWORD)v5)
    sub_100002F24(v5);
  dword_100008008 = IORegistryEntryFromPath(mainPort, "IOService:/options/options-system");
  dword_10000800C = dword_100008004;
  if (a1 >= 2)
  {
    v91 = 0;
    v92 = 0;
    v7 = a1;
    v8 = &byte_100008000;
    v88 = a1;
    v9 = 1;
    v89 = a2;
    v90 = a1;
    while (1)
    {
      v10 = *(unsigned __int8 **)(a2 + 8 * v9);
      v11 = *v10;
      if (v11 == 45)
      {
        v13 = v10 + 1;
        v12 = v10[1];
        if (v12)
        {
          while (1)
          {
            switch(v12)
            {
              case 'b':
                if (a1 != 4)
                  sub_100002094("missing arguments");
                if (v9 + 1 >= v7 || (v14 = *(char **)(a2 + 8 * (v9 + 1)), *v14 == 45))
                {
                  ++v9;
                }
                else
                {
                  v9 += 2;
                  v45 = fopen(*(const char **)(a2 + 8 * v9), "r");
                  if (!v45)
                    err(1, "Couldn't open binary file - '%s'");
                  v46 = v45;
                  v47 = getc(v45);
                  if ((_DWORD)v47 == -1)
                    goto LABEL_200;
                  v48 = v47;
                  v49 = 0;
                  do
                  {
                    if (v49 >= 2048)
                      sub_100002FF8(v47);
                    if (v48 > 0x7F)
                      v50 = __maskrune(v48, 0x40000uLL);
                    else
                      v50 = _DefaultRuneLocale.__runetype[v48] & 0x40000;
                    if (v48 == 37 || !v50)
                      v49 += sprintf((char *)properties + v49, "%%%02x", v48);
                    else
                      *((_BYTE *)&properties[0].st_dev + v49++) = v48;
                    v47 = getc(v46);
                    v48 = v47;
                  }
                  while ((_DWORD)v47 != -1);
                  if (v49 <= 0)
LABEL_200:
                    sub_100002FD8();
                  *((_BYTE *)&properties[0].st_dev + v49) = 0;
                  v42 = sub_1000021A8(v14, (const char *)properties);
                  if (v42)
                  {
LABEL_176:
                    mach_error_string(v42);
                    errx(1, "Error setting variable - '%s': %s");
                  }
                  v7 = v90;
                }
                goto LABEL_96;
              case 'c':
                *(_QWORD *)&properties[0].st_dev = 0;
                CFProperties = IORegistryEntryCreateCFProperties(dword_10000800C, (CFMutableDictionaryRef *)properties, 0, 0);
                LODWORD(context[0]) = CFProperties;
                if (CFProperties)
                  sub_100002FB8(CFProperties);
                CFDictionaryApplyFunction(*(CFDictionaryRef *)&properties[0].st_dev, (CFDictionaryApplierFunction)sub_100002DD8, context);
                CFRelease(*(CFTypeRef *)&properties[0].st_dev);
                v92 = LODWORD(context[0]);
                goto LABEL_96;
              case 'd':
                if (++v9 >= v7)
                  goto LABEL_175;
                v16 = *(const char **)(a2 + 8 * v9);
                if (*v16 == 45)
                  goto LABEL_175;
                sub_1000021A8("IONVRAM-DELETE-PROPERTY", v16);
                goto LABEL_96;
              case 'e':
              case 'g':
              case 'i':
              case 'j':
              case 'k':
              case 'l':
              case 'm':
              case 'n':
              case 'o':
              case 'q':
              case 't':
              case 'u':
              case 'v':
              case 'w':
              case 'y':
                goto LABEL_178;
              case 'f':
                if (++v9 >= v7 || (v17 = *(const char **)(a2 + 8 * v9), *v17 == 45))
                  sub_100002094("missing filename");
                if (v8[17] == 1)
                {
                  memset(properties, 0, 144);
                  context[0] = kCFPropertyListBinaryFormat_v1_0;
                  v18 = open(v17, 256, 0x8000);
                  if (v18 == -1)
                    sub_100003018();
                  v19 = v18;
                  if (fstat(v18, properties) == -1)
                    sub_100003040();
                  if (properties[0].st_size >= (uint64_t)&_mh_execute_header)
                    sub_100003068(properties[0].st_size);
                  v20 = (UInt8 *)malloc_type_malloc(properties[0].st_size, 0x389F36D7uLL);
                  if (!v20)
                    sub_10000307C(0);
                  v21 = v20;
                  v22 = read(v19, v20, properties[0].st_size);
                  if (v22 != properties[0].st_size)
                    sub_1000030CC();
                  close(v19);
                  v23 = CFReadStreamCreateWithBytesNoCopy(kCFAllocatorDefault, v21, properties[0].st_size, kCFAllocatorNull);
                  if (!v23)
                    sub_100003090(0);
                  v24 = v23;
                  v25 = CFReadStreamOpen(v23);
                  if (!(_DWORD)v25)
                    sub_1000030A4(v25);
                  v26 = (const __CFDictionary *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v24, properties[0].st_size, 0, context, 0);
                  if (!v26)
                    sub_1000030B8(0);
                  v27 = v26;
                  CFReadStreamClose(v24);
                  CFRelease(v24);
                  free(v21);
                  CFDictionaryApplyFunction(v27, (CFDictionaryApplierFunction)sub_100002624, 0);
                  CFRelease(v27);
                }
                else
                {
                  v35 = fopen(*(const char **)(a2 + 8 * v9), "r");
                  if (!v35)
                    err(1, "Couldn't open patch file - '%s'");
                  v36 = v35;
                  v37 = getc(v35);
                  if ((_DWORD)v37 != -1)
                  {
                    v38 = v37;
                    v39 = 0;
                    v40 = 0;
                    v41 = 0;
                    while (2)
                    {
                      if (v40 == 255)
                        sub_1000030F4(v37);
                      if (v39 == 2047)
                        sub_100002FF8(v37);
                      switch(v41)
                      {
                        case 0:
                          if (v38 == 10)
                          {
                            v39 = 0;
                            v40 = 0;
                            goto LABEL_56;
                          }
                          if (v38 == 35)
                          {
                            v39 = 0;
                            v40 = 0;
                            v41 = 1;
                            goto LABEL_89;
                          }
                          if (v38 > 0x7F)
                            v43 = __maskrune(v38, 0x4000uLL);
                          else
                            v43 = _DefaultRuneLocale.__runetype[v38] & 0x4000;
                          v39 = 0;
                          if (v43)
                          {
                            v40 = 0;
                            goto LABEL_88;
                          }
                          LOBYTE(context[0]) = v38;
                          v40 = 1;
                          goto LABEL_84;
                        case 1:
                          v41 = v38 != 10;
                          goto LABEL_89;
                        case 2:
                          if (v38 == 10)
                            goto LABEL_56;
                          if (v38 > 0x7F)
                          {
                            if (!__maskrune(v38, 0x4000uLL))
                              goto LABEL_83;
                          }
                          else if ((_DefaultRuneLocale.__runetype[v38] & 0x4000) == 0)
                          {
                            goto LABEL_83;
                          }
LABEL_88:
                          v41 = 2;
                          goto LABEL_89;
                        case 3:
                          if (v38 == 10)
                          {
                            *((_BYTE *)context + v40) = 0;
                            warnx("Name must be followed by white space - '%s'", (const char *)context);
LABEL_56:
                            v41 = 0;
                          }
                          else
                          {
                            if (v38 > 0x7F)
                            {
                              if (__maskrune(v38, 0x4000uLL))
                              {
LABEL_78:
                                v41 = 4;
                                goto LABEL_89;
                              }
                            }
                            else if ((_DefaultRuneLocale.__runetype[v38] & 0x4000) != 0)
                            {
                              goto LABEL_78;
                            }
LABEL_83:
                            *((_BYTE *)context + v40++) = v38;
LABEL_84:
                            v41 = 3;
                          }
LABEL_89:
                          v37 = getc(v36);
                          v38 = v37;
                          if ((_DWORD)v37 != -1)
                            continue;
                          v7 = v90;
                          if (v41)
                            sub_100003114(v37);
                          return result;
                        case 4:
                        case 6:
                          if (v38 == 10)
                            goto LABEL_55;
                          if (v38 > 0x7F)
                          {
                            if (__maskrune(v38, 0x4000uLL))
                              goto LABEL_89;
                          }
                          else if ((_DefaultRuneLocale.__runetype[v38] & 0x4000) != 0)
                          {
                            goto LABEL_89;
                          }
LABEL_76:
                          *((_BYTE *)&properties[0].st_dev + v39++) = v38;
                          v41 = 5;
                          goto LABEL_89;
                        case 5:
                          if (v38 != 10)
                            goto LABEL_76;
                          if (*((_BYTE *)properties + v39 - 1) == 92)
                          {
                            *((_BYTE *)properties + v39 - 1) = 13;
                            v41 = 6;
                            goto LABEL_89;
                          }
LABEL_55:
                          *((_BYTE *)context + v40) = 0;
                          *((_BYTE *)&properties[0].st_dev + v39) = 0;
                          v42 = sub_1000021A8((char *)context, (const char *)properties);
                          if (v42)
                            goto LABEL_176;
                          goto LABEL_56;
                        case 7:
                          goto LABEL_55;
                        default:
                          goto LABEL_89;
                      }
                    }
                  }
                }
                v8 = &byte_100008000;
                goto LABEL_96;
              case 'h':
                sub_100002094((const char *)&unk_1000035FF);
              case 'p':
                *(_QWORD *)&properties[0].st_dev = 0;
                v28 = IORegistryEntryCreateCFProperties(dword_10000800C, (CFMutableDictionaryRef *)properties, 0, 0);
                if (v28)
                  sub_100002FB8(v28);
                if (v8[17] == 1)
                {
                  Data = CFPropertyListCreateData(kCFAllocatorDefault, *(CFPropertyListRef *)&properties[0].st_dev, kCFPropertyListXMLFormat_v1_0, 0, 0);
                  if (!Data)
                    sub_100002FA4(0);
                  v30 = Data;
                  BytePtr = CFDataGetBytePtr(Data);
                  Length = CFDataGetLength(v30);
                  fwrite(BytePtr, 1uLL, Length, __stdoutp);
                  CFRelease(v30);
                  v7 = v90;
                }
                else
                {
                  CFDictionaryApplyFunction(*(CFDictionaryRef *)&properties[0].st_dev, (CFDictionaryApplierFunction)sub_1000028E4, 0);
                }
                CFRelease(*(CFTypeRef *)&properties[0].st_dev);
                goto LABEL_96;
              case 'r':
                if (++v9 >= v7 || (v33 = *(const char **)(a2 + 8 * v9), *v33 == 45))
LABEL_175:
                  sub_100002094("missing name");
                v34 = sub_1000021A8("IONVRAM-DELETEWRET-PROPERTY", v33);
                if (v34)
                {
                  mach_error_string(v34);
                  errx(1, "Error deleting variable - '%s': %s (0x%08x)");
                }
                v92 = 0;
                goto LABEL_96;
              case 's':
                byte_100008012 = 1;
                goto LABEL_96;
              case 'x':
                if (byte_100008010 == 1)
                {
                  v84 = 1;
                  fwrite("-x not supported with -X hex mode.\n", 0x23uLL, 1uLL, __stderrp);
                  return v84;
                }
                v8[17] = 1;
LABEL_96:
                v44 = *++v13;
                v12 = v44;
                if (!v44)
                  goto LABEL_160;
                break;
              case 'z':
                if (!byte_100008000)
                  sub_100002094("unsupported option -z");
                if (dword_100008008)
                {
                  fwrite("Selecting options-system node.\n", 0x1FuLL, 1uLL, __stderrp);
                  dword_10000800C = dword_100008008;
                }
                else
                {
                  fwrite("No options-system node, using options.\n", 0x27uLL, 1uLL, __stderrp);
                }
                goto LABEL_96;
              default:
                if (v12 != 88)
                {
LABEL_178:
                  strcpy((char *)properties, "no such option as --");
                  *((_BYTE *)properties + strlen((const char *)properties) - 1) = v12;
                  sub_100002094((const char *)properties);
                }
                if (v8[17] == 1)
                {
                  fwrite("-X hex mode not supported with -x XMLmode.\n", 0x2BuLL, 1uLL, __stderrp);
                  return 1;
                }
                byte_100008010 = 1;
                goto LABEL_96;
            }
          }
        }
      }
      v51 = (char *)(v10 + 1);
      ++v91;
      while (v11 <= 44)
      {
        if (v11 != 43)
        {
          if (!v11)
          {
            v57 = 0;
            v58 = 0;
            v52 = v51 - 1;
            goto LABEL_128;
          }
          goto LABEL_124;
        }
        v11 = *v51;
        if (v11 == 61)
        {
          v57 = 0;
          v58 = 1;
          goto LABEL_127;
        }
LABEL_125:
        ++v51;
      }
      if (v11 != 45)
        break;
      v11 = *v51;
      if (v11 != 61)
        goto LABEL_125;
      v58 = 0;
      v57 = 1;
LABEL_127:
      *(_WORD *)(v51 - 1) = 0;
      v52 = v51 + 1;
LABEL_128:
      v59 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v10, 0x8000100u);
      if (!v59)
        errx(1, "Error creating CFString for key %s");
      v55 = (__CFString *)v59;
      CFProperty = (__CFString *)IORegistryEntryCreateCFProperty(dword_10000800C, v59, 0, 0);
      if (!CFProperty)
        sub_100002F38();
      v54 = CFProperty;
      if (!v58)
      {
        if (!v57)
        {
          sub_1000028E4(v55, CFProperty);
          MutableCopy = 0;
          v53 = 0;
          a1 = v88;
          v7 = v90;
          goto LABEL_153;
        }
        MutableCopy = 0;
        v53 = 0;
LABEL_140:
        v73 = CFGetTypeID(v54);
        if (v73 == CFStringGetTypeID())
        {
          v74 = CFStringGetLength(v54);
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v74, 0x8000100u);
          CString = (uint64_t)malloc_type_calloc(MaximumSizeForEncoding + 1, 1uLL, 0xF484C186uLL);
          if (!CString
            || (v51 = (char *)CString,
                CString = CFStringGetCString(v54, (char *)CString, MaximumSizeForEncoding, 0x8000100u),
                v53 = v51,
                !(_DWORD)CString))
          {
            sub_100002F7C(CString);
          }
        }
        else
        {
          v77 = CFGetTypeID(v54);
          TypeID = CFDataGetTypeID();
          if (v77 != TypeID)
            sub_100002F90(TypeID);
          v51 = (char *)CFDataGetBytePtr((CFDataRef)v54);
        }
        v79 = strstr(v51, v52);
        if (!v79)
          errx(1, "substring %s not found in %s\n");
        v80 = v79;
        v81 = &v79[strlen(v52)];
        v82 = strlen(v81);
        memmove(v80, v81, v82 + 1);
        goto LABEL_150;
      }
      v61 = CFGetTypeID(CFProperty);
      if (v61 != CFStringGetTypeID())
      {
        v67 = CFGetTypeID(v54);
        v68 = CFDataGetTypeID();
        if (v67 != v68)
          sub_100002F90(v68);
        v69 = CFDataGetLength((CFDataRef)v54);
        v70 = strlen(v52);
        MutableCopy = CFDataCreateMutableCopy(kCFAllocatorDefault, v69 + v70 + 1, (CFDataRef)v54);
        v71 = strlen(v52);
        CFDataAppendBytes(MutableCopy, (const UInt8 *)v52, v71 + 1);
        v72 = CFDataGetBytePtr(MutableCopy);
        v53 = 0;
        if ((v57 & 1) == 0)
        {
          v51 = (char *)v72;
          goto LABEL_150;
        }
        goto LABEL_140;
      }
      v62 = strlen(v52);
      v63 = CFStringGetLength(v54);
      v64 = CFStringGetMaximumSizeForEncoding(v63, 0x8000100u) + v62;
      v65 = (uint64_t)malloc_type_calloc(v64 + 1, 1uLL, 0xD4BFA9DDuLL);
      if (!v65 || (v53 = (char *)v65, v65 = CFStringGetCString(v54, (char *)v65, v64, 0x8000100u), !(_DWORD)v65))
        sub_100002F68(v65);
      v66 = strlen(v53);
      strcpy(&v53[v66], v52);
      MutableCopy = 0;
      if ((v57 & 1) != 0)
        goto LABEL_140;
      v51 = v53;
LABEL_150:
      a1 = v88;
      v7 = v90;
LABEL_151:
      v83 = sub_1000021A8((char *)v10, v51);
      sub_10000217C();
      if (v83)
      {
        v86 = __stderrp;
        v87 = mach_error_string(v83);
        fprintf(v86, "Error setting variable - '%s': %s.\n", (const char *)v10, v87);
        if (v83 == -536870211)
          sub_1000026E8();
        exit(1);
      }
      if (v55)
LABEL_153:
        CFRelease(v55);
      if (v54)
        CFRelease(v54);
      v8 = &byte_100008000;
      if (v53)
        free(v53);
      a2 = v89;
      if (MutableCopy)
        CFRelease(MutableCopy);
LABEL_160:
      if (++v9 >= v7)
      {
        v6 = &byte_100008000;
        v84 = v92;
        if (!v91)
          goto LABEL_164;
        goto LABEL_166;
      }
    }
    if (v11 == 61)
    {
      v53 = 0;
      v54 = 0;
      v55 = 0;
      MutableCopy = 0;
      *(v51 - 1) = 0;
      goto LABEL_151;
    }
LABEL_124:
    v11 = *v51;
    goto LABEL_125;
  }
  v84 = 0;
LABEL_164:
  if (byte_100008012 == 1)
    sub_10000217C();
LABEL_166:
  if (a1 == 1)
    sub_100002094("no arguments specified");
  IOObjectRelease(*((_DWORD *)v6 + 1));
  if (dword_100008008)
    IOObjectRelease(dword_100008008);
  return v84;
}

void sub_100002094(const char *a1)
{
  warnx("(usage: %s)", a1);
  puts("nvram [-x|-X] [-p] [-f filename] [-d name] [-c] name[=value] ...");
  puts("\t-x         use XML format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-X         use HEX format for printing or reading variables");
  puts("\t           (must appear before -p or -f)");
  puts("\t-p         print all firmware variables");
  puts("\t-f         set firmware variables from a text file");
  puts("\t-d         delete the named variable(does not return error code)");
  puts("\t-r         delete the named variable(returns error code if any)");
  puts("\t-c         delete all variables");
  puts("\t-b         set variable using binary file. invoked with the following format: nvram -b <variable name> <binary file>");
  if (byte_100008000)
    puts("\t-z         use system-options node if available (internal builds only)");
  puts("\tname=value set named variable");
  puts("\tname       print variable");
  puts("Note that arguments and options are executed in order.");
  exit(1);
}

uint64_t sub_10000217C()
{
  if ((byte_100008012 & 1) != 0)
    return sub_1000021A8("IONVRAM-FORCESYNCNOW-PROPERTY", "IONVRAM-FORCESYNCNOW-PROPERTY");
  else
    return sub_1000021A8("IONVRAM-SYNCNOW-PROPERTY", "IONVRAM-SYNCNOW-PROPERTY");
}

uint64_t sub_1000021A8(char *cStr, const char *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeRef CFProperty;
  const void *v7;
  CFTypeID v8;
  CFDataRef v9;
  uint64_t v10;
  uint64_t v12;
  CFDataRef v13;
  uint64_t v14;
  BOOL v15;
  CFTypeID TypeID;
  _QWORD v18[4];

  v4 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v4)
    errx(1, "Error creating CFString for key %s");
  v5 = v4;
  CFProperty = IORegistryEntryCreateCFProperty(dword_10000800C, v4, 0, 0);
  if (CFProperty)
  {
    v7 = CFProperty;
    v8 = CFGetTypeID(CFProperty);
    CFRelease(v7);
    v9 = sub_100002384(v8, a2);
    if (!v9)
      errx(1, "Error creating CFTypeRef for value %s");
LABEL_4:
    v10 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v9);
    goto LABEL_5;
  }
  if (!strncmp(cStr, "IONVRAM-DELETEWRET-PROPERTY", 0x1BuLL) || !strncmp(cStr, "IONVRAM-DELETE-PROPERTY", 0x17uLL))
  {
    TypeID = CFStringGetTypeID();
    v9 = sub_100002384(TypeID, a2);
    if (!v9)
    {
      v10 = 0;
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  v18[0] = CFDataGetTypeID();
  v18[1] = CFStringGetTypeID();
  v18[2] = CFNumberGetTypeID();
  v12 = 0;
  v10 = 0;
  v18[3] = CFBooleanGetTypeID();
  do
  {
    v13 = sub_100002384(v18[v12], a2);
    if (v13)
    {
      v14 = IORegistryEntrySetCFProperty(dword_10000800C, v5, v13);
      v10 = v14;
      v15 = (_DWORD)v14 == -536870211 || (_DWORD)v14 == -536870181;
      if (v15 || (_DWORD)v14 == 0)
        break;
    }
    ++v12;
  }
  while (v12 != 4);
LABEL_5:
  CFRelease(v5);
  return v10;
}

CFDataRef sub_100002384(uint64_t a1, const char *a2)
{
  int64_t v5;
  uint64_t v6;
  const UInt8 *v7;
  CFIndex v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  __darwin_ct_rune_t v13;
  __darwin_ct_rune_t v14;
  unsigned int v15;
  __darwin_ct_rune_t v16;
  unsigned int v17;
  char v18;
  uint64_t valuePtr;

  if (CFBooleanGetTypeID() == a1)
  {
    if (!strcmp("true", a2))
    {
      return kCFBooleanTrue;
    }
    else if (!strcmp("false", a2))
    {
      return kCFBooleanFalse;
    }
    else
    {
      return 0;
    }
  }
  else if (CFNumberGetTypeID() == a1)
  {
    valuePtr = strtol(a2, 0, 0);
    return CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  }
  else if (CFStringGetTypeID() == a1)
  {
    return (CFDataRef)CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  }
  else if (CFDataGetTypeID() == a1)
  {
    v5 = strlen(a2);
    v6 = __chkstk_darwin();
    v7 = (const UInt8 *)&valuePtr - ((v6 + 16) & 0xFFFFFFFFFFFFFFF0);
    if (v6 < 1)
    {
      v8 = 0;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = a2[v9];
        if (v10 == 37)
        {
          v11 = v9 + 2;
          if (v9 + 2 > v5)
            return 0;
          v12 = v9 + 1;
          v13 = a2[v9 + 1];
          if (v13 < 0)
          {
            if (!__maskrune(v13, 0x10000uLL))
              return 0;
          }
          else if ((_DefaultRuneLocale.__runetype[v13] & 0x10000) == 0)
          {
            return 0;
          }
          v14 = a2[v11];
          if (v14 < 0)
          {
            if (!__maskrune(v14, 0x10000uLL))
              return 0;
          }
          else if ((_DefaultRuneLocale.__runetype[v14] & 0x10000) == 0)
          {
            return 0;
          }
          v15 = __toupper(a2[v12]) - 48;
          v16 = __toupper(a2[v11]);
          v17 = v16 - 48;
          v18 = 16 * v15;
          if (v15 > 9)
            v18 = 16 * v15 - 112;
          if (v17 > 9)
            LOBYTE(v17) = v16 - 55;
          LOBYTE(v10) = v17 + v18;
        }
        else
        {
          v11 = v9;
        }
        v7[v8] = v10;
        v9 = v11 + 1;
        ++v8;
      }
      while (v11 + 1 < v5);
    }
    return CFDataCreate(kCFAllocatorDefault, v7, v8);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100002624(CFStringRef propertyName, CFTypeRef property)
{
  uint64_t result;
  CFIndex Length;
  CFIndex v5;
  char *v6;
  const char *v7;
  char *v8;
  mach_error_t error_value;

  result = IORegistryEntrySetCFProperty(dword_10000800C, propertyName, property);
  if ((_DWORD)result)
  {
    error_value = result;
    Length = CFStringGetLength(propertyName);
    v5 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v6 = (char *)malloc_type_malloc(v5, 0x168D7BF0uLL);
    if (!v6 || (v7 = v6, !CFStringGetCString(propertyName, v6, v5, 0x8000100u)))
    {
      warnx("Unable to convert property name to C string");
      v7 = "<UNPRINTABLE>";
    }
    v8 = mach_error_string(error_value);
    errx(1, "Error setting variable - '%s': %s", v7, v8);
  }
  return result;
}

void sub_1000026E8()
{
  kern_return_t v0;
  int64_t Count;
  const void **v2;
  const void **v3;
  const void **v4;
  const void **v5;
  void *v6;
  void *v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  FILE *v14;
  const char *CStringPtr;
  _QWORD __compar[5];
  CFMutableDictionaryRef properties;

  properties = 0;
  v0 = IORegistryEntryCreateCFProperties(dword_100008004, &properties, 0, 0);
  if (v0)
    sub_100002FB8(v0);
  Count = CFDictionaryGetCount(properties);
  v2 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v2)
    sub_100003148();
  v3 = v2;
  v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x80040B8603338uLL);
  if (!v4)
    sub_100003148();
  v5 = v4;
  v6 = malloc_type_calloc(Count, 8uLL, 0x100004000313F17uLL);
  if (!v6)
    sub_100003148();
  v7 = v6;
  if (Count)
  {
    for (i = 0; i != Count; ++i)
      *((_QWORD *)v6 + i) = i;
  }
  CFDictionaryGetKeysAndValues(properties, v3, v5);
  __compar[0] = _NSConcreteStackBlock;
  __compar[1] = 0x40000000;
  __compar[2] = sub_100002D1C;
  __compar[3] = &unk_1000042A0;
  __compar[4] = v5;
  qsort_b(v7, Count, 8uLL, __compar);
  fwrite("key\tbytes\n", 0xAuLL, 1uLL, __stderrp);
  v9 = Count - 1;
  if (Count >= 1)
  {
    if (v9 >= 4)
      v9 = 4;
    v10 = v9 + 1;
    v11 = v7;
    do
    {
      v12 = sub_100002D6C((const __CFString *)v5[*v11]);
      if (v12)
      {
        v13 = v12;
        v14 = __stderrp;
        CStringPtr = CFStringGetCStringPtr((CFStringRef)v3[*v11], 0x8000100u);
        fprintf(v14, "%s\t%zu\n", CStringPtr, v13);
      }
      ++v11;
      --v10;
    }
    while (v10);
  }
  free(v3);
  free(v5);
  free(v7);
  CFRelease(properties);
}

void sub_1000028E4(__CFString *a1, __CFString *a2)
{
  CFDictionaryRef v2;
  CFDictionaryRef v3;
  const __CFData *Data;
  const __CFData *v5;
  const UInt8 *BytePtr;
  size_t Length;
  CFIndex v10;
  CFIndex v11;
  char *v12;
  const char *v13;
  CFTypeID v14;
  char *v15;
  char *v16;
  const char *v17;
  CFIndex v18;
  CFIndex MaximumSizeForEncoding;
  CFIndex v20;
  uint64_t v21;
  const UInt8 *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  __uint32_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int valuePtr;
  void *values;
  void *keys;
  char v34[10];

  values = a2;
  keys = a1;
  valuePtr = 0;
  if (byte_100008011 == 1)
  {
    v2 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!v2)
      sub_10000315C(0);
    v3 = v2;
    Data = CFPropertyListCreateData(kCFAllocatorDefault, v2, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data)
      sub_100003170(0);
    v5 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    Length = CFDataGetLength(v5);
    fwrite(BytePtr, 1uLL, Length, __stdoutp);
    CFRelease(v3);
    CFRelease(v5);
    return;
  }
  v10 = CFStringGetLength(a1);
  v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u) + 1;
  v12 = (char *)malloc_type_malloc(v11, 0xC1183356uLL);
  if (!v12 || (v13 = v12, !CFStringGetCString(a1, v12, v11, 0x8000100u)))
  {
    warnx("Unable to convert property name to C string");
    v13 = "<UNPRINTABLE>";
  }
  v14 = CFGetTypeID(a2);
  if (v14 == CFBooleanGetTypeID())
  {
    v15 = 0;
    if (CFBooleanGetValue((CFBooleanRef)a2))
      v16 = "true";
    else
      v16 = "false";
    goto LABEL_33;
  }
  if (v14 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr == -1)
    {
      v17 = "-1";
    }
    else
    {
      if (valuePtr > 0x3E7 || (byte_100008010 & 1) != 0)
        v17 = "0x%x";
      else
        v17 = "%d";
      v30 = valuePtr;
    }
    v16 = v34;
    __sprintf_chk(v34, 0, 0xAuLL, v17, v30);
    v15 = 0;
    goto LABEL_33;
  }
  if (v14 == CFStringGetTypeID())
  {
    v18 = CFStringGetLength(a2);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v18, 0x8000100u);
    v15 = (char *)malloc_type_malloc(MaximumSizeForEncoding + 2, 0xA7D1CC4AuLL);
    if (v15 && CFStringGetCString(a2, v15, MaximumSizeForEncoding + 1, 0x8000100u))
    {
      v16 = v15;
    }
    else
    {
      warnx("Unable to convert value to C string");
      v16 = "<UNPRINTABLE>";
    }
    goto LABEL_33;
  }
  if (v14 != CFDataGetTypeID())
  {
    v15 = 0;
    v16 = "<INVALID>";
LABEL_33:
    printf("%s\t%s\n", v13, v16);
LABEL_34:
    if (!v12)
      goto LABEL_36;
    goto LABEL_35;
  }
  v20 = CFDataGetLength((CFDataRef)a2);
  if (!v20)
  {
    v15 = 0;
    v16 = (char *)&unk_1000035FF;
    goto LABEL_33;
  }
  v21 = v20;
  v15 = (char *)malloc_type_malloc(3 * v20 + 3, 0x28818A6uLL);
  if (!v15)
    goto LABEL_34;
  v22 = CFDataGetBytePtr((CFDataRef)a2);
  if (byte_100008010 == 1)
  {
    strcpy(v15, "0x");
    v23 = 2;
  }
  else
  {
    v23 = 0;
  }
  if (v21 >= 1)
  {
    while (1)
    {
      v25 = *v22++;
      v24 = v25;
      if (byte_100008010 == 1)
        break;
      if ((char)v24 < 0)
        v27 = __maskrune(v24, 0x40000uLL);
      else
        v27 = _DefaultRuneLocale.__runetype[v24] & 0x40000;
      v28 = &v15[v23];
      if (!v27 || (char)v24 == 37)
      {
        v26 = sprintf(v28, "%%%02x");
        goto LABEL_50;
      }
      *v28 = v24;
      v29 = 1;
LABEL_51:
      v23 += v29;
      if (!--v21)
        goto LABEL_52;
    }
    v26 = sprintf(&v15[v23], "%02x");
LABEL_50:
    v29 = v26;
    goto LABEL_51;
  }
LABEL_52:
  v15[v23] = 0;
  printf("%s\t%s\n", v13, v15);
  free(v15);
  v15 = 0;
  if (v12)
LABEL_35:
    free(v12);
LABEL_36:
  if (v15)
    free(v15);
}

uint64_t sub_100002D1C(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  int v5;

  v5 = sub_100002D6C(*(const __CFString **)(*(_QWORD *)(a1 + 32) + 8 * *a3));
  return v5 - sub_100002D6C(*(const __CFString **)(*(_QWORD *)(a1 + 32) + 8 * *a2));
}

uint64_t sub_100002D6C(const __CFString *a1)
{
  CFTypeID v2;

  v2 = CFGetTypeID(a1);
  if (v2 == CFStringGetTypeID())
    return CFStringGetLength(a1);
  if (v2 == CFDataGetTypeID())
    return CFDataGetLength((CFDataRef)a1);
  return 8 * (v2 == CFNumberGetTypeID());
}

void sub_100002DD8(const __CFString *property, uint64_t a2, mach_error_t *a3)
{
  kern_return_t v5;
  mach_error_t v6;
  CFTypeID v7;
  const char *CStringPtr;
  CFIndex Length;
  CFIndex v10;
  char *v11;
  const char *v12;
  char *v13;

  v5 = IORegistryEntrySetCFProperty(dword_10000800C, CFSTR("IONVRAM-DELETE-PROPERTY"), property);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(property);
    if (v7 != CFStringGetTypeID())
      sub_100003184();
    CStringPtr = CFStringGetCStringPtr(property, 0x8000100u);
    if (CStringPtr)
    {
      v12 = CStringPtr;
      v11 = 0;
    }
    else
    {
      Length = CFStringGetLength(property);
      v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v11 = (char *)malloc_type_malloc(v10, 0x70D08A23uLL);
      if (v11 && CFStringGetCString(property, v11, v10, 0x8000100u))
      {
        v12 = v11;
      }
      else
      {
        warnx("Unable to convert property name to C string");
        v12 = "<UNPRINTABLE>";
      }
    }
    v13 = mach_error_string(v6);
    warnx("Error clearing firmware variable %s: %s", v12, v13);
    if (v11)
      free(v11);
    if (a3)
      *a3 = v6;
  }
}

void sub_100002F04(uint64_t a1, const char *a2)
{
  errx(1, a2);
}

uint64_t sub_100002F0C()
{
  return _os_assert_log(0);
}

int *sub_100002F14()
{
  return __error();
}

char *sub_100002F1C(int *a1)
{
  return strerror(*a1);
}

void sub_100002F24(uint64_t a1)
{
  sub_100002F04(a1, "nvram is not supported on this system");
}

void sub_100002F38()
{
  char *v0;

  v0 = mach_error_string(-536870160);
  sub_100002F04((uint64_t)v0, "Error getting variable - '%s': %s");
}

void sub_100002F68(uint64_t a1)
{
  sub_100002F04(a1, "allocation failed");
}

void sub_100002F7C(uint64_t a1)
{
  sub_100002F04(a1, "failed to allocate string");
}

void sub_100002F90(uint64_t a1)
{
  sub_100002F04(a1, "Unsupported named variable CFTypeID");
}

void sub_100002FA4(uint64_t a1)
{
  sub_100002F04(a1, "Error converting variables to xml");
}

void sub_100002FB8(mach_error_t a1)
{
  char *v1;

  v1 = mach_error_string(a1);
  sub_100002F04((uint64_t)v1, "Error getting the firmware variables: %s");
}

void sub_100002FD8()
{
  err(1, "Invalid file size %d", 0);
}

void sub_100002FF8(uint64_t a1)
{
  sub_100002F04(a1, "Value exceeded max length of %d");
}

void sub_100003018()
{
  int *v0;
  char *v1;

  v0 = sub_100002F14();
  v1 = sub_100002F1C(v0);
  sub_100002F04((uint64_t)v1, "Could not open %s: %s");
}

void sub_100003040()
{
  int *v0;
  char *v1;

  v0 = sub_100002F14();
  v1 = sub_100002F1C(v0);
  sub_100002F04((uint64_t)v1, "Could not fstat %s: %s");
}

void sub_100003068(uint64_t a1)
{
  sub_100002F04(a1, "too big for our purposes");
}

void sub_10000307C(uint64_t a1)
{
  sub_100002F04(a1, "Could not allocate buffer");
}

void sub_100003090(uint64_t a1)
{
  sub_100002F04(a1, "Could not create stream from serialized data");
}

void sub_1000030A4(uint64_t a1)
{
  sub_100002F04(a1, "Could not open the stream");
}

void sub_1000030B8(uint64_t a1)
{
  sub_100002F04(a1, "Error parsing XML file");
}

void sub_1000030CC()
{
  int *v0;
  char *v1;

  v0 = sub_100002F14();
  v1 = sub_100002F1C(v0);
  sub_100002F04((uint64_t)v1, "Could not read %s: %s");
}

void sub_1000030F4(uint64_t a1)
{
  sub_100002F04(a1, "Name exceeded max length of %d");
}

void sub_100003114(uint64_t a1)
{
  sub_100002F04(a1, "Last line ended abruptly");
}

void sub_100003128(mach_error_t a1)
{
  char *v1;

  v1 = mach_error_string(a1);
  sub_100002F04((uint64_t)v1, "Error getting the IOMainPort: %s");
}

void sub_100003148()
{
  uint64_t v0;

  v0 = sub_100002F0C();
  _os_crash(v0);
  __break(1u);
}

void sub_10000315C(uint64_t a1)
{
  sub_100002F04(a1, "Error creating dictionary for variable value");
}

void sub_100003170(uint64_t a1)
{
  sub_100002F04(a1, "Error creating xml plist for variable");
}

void sub_100003184()
{
  __assert_rtn("ClearOFVariable", "nvram.c", 1153, "CFGetTypeID(key) == CFStringGetTypeID()");
}
