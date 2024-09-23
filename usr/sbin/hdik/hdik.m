uint64_t start(int a1, char **a2)
{
  uint64_t *v4;
  __CFDictionary *Mutable;
  const char *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  char *v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v15;
  const char *v16;
  CFStringRef v17;
  CFStringRef v18;
  CFTypeID v19;
  char *v20;
  int v21;
  const __CFNumber *v22;
  size_t v23;
  uint64_t v24;
  uint64_t j;
  int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  __CFDictionary *v30;
  CFDataRef v31;
  CFDataRef v32;
  const CFBooleanRef *v33;
  const void *v34;
  CFTypeID v35;
  const __CFNumber *v36;
  CFTypeID v37;
  CFNumberRef v38;
  const __CFUUID *v39;
  const __CFUUID *v40;
  CFStringRef v41;
  const char *v42;
  int v43;
  int v44;
  int v45;
  uint64_t v46;
  const char *v47;
  size_t v48;
  CFDataRef v49;
  const __CFData *Value;
  const __CFString *v51;
  const __CFString *v52;
  const __CFURL *v53;
  const __CFURL *v54;
  const __CFString *v55;
  const __CFString *v56;
  __CFDictionary *v57;
  CFArrayRef v58;
  __CFDictionary *v59;
  const __CFDictionary *v60;
  io_service_t MatchingService;
  io_object_t v62;
  kern_return_t MatchingServices;
  const __CFDictionary *v64;
  const __CFDictionary *v65;
  io_service_t v66;
  io_object_t v67;
  uint64_t v68;
  const __CFData *Data;
  const __CFData *v70;
  io_registry_entry_t v71;
  kern_return_t v72;
  IONotificationPortRef v73;
  IONotificationPort *v74;
  const __CFDictionary *v75;
  kern_return_t v76;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoop *v79;
  __CFRunLoopSource *v80;
  uint64_t Count;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v84;
  const __CFString *v85;
  const char *v86;
  char *v87;
  const char *v88;
  char *v89;
  kern_return_t v90;
  const void *v91;
  uint64_t v93;
  uint64_t v94;
  const __CFNumber *cf;
  char *v96;
  const __CFNumber *v97;
  char *v98;
  __CFDictionary *theDict;
  void *values;
  int outputStruct;
  stat __endptr;
  stat valuePtr[7];
  CFRange v104;

  v98 = basename(*a2);
  v4 = &qword_100008000;
  if (a1 <= 1)
  {
    warnx("no image specified");
    Mutable = 0;
    goto LABEL_175;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v6 = 0;
  LODWORD(v7) = 1;
  theDict = Mutable;
  while (1)
  {
    v8 = v6;
    v6 = a2[(int)v7];
    if (!strcasecmp(v6, "-help") || !strcasecmp(v6, "-h"))
    {
      sub_1000032A0(v98);
      exit(0);
    }
    v9 = v7;
    if (!strcasecmp(v6, "-e"))
    {
      if ((_DWORD)v7 + 1 == a1 || (v42 = a2[(int)v7 + 1], *v42 == 45))
      {
        warnx("you must specify a device to eject", v93);
        goto LABEL_175;
      }
      if (geteuid())
        goto LABEL_99;
      if (!strncmp(v42, "/dev/", 5uLL))
      {
        memset(valuePtr, 0, 144);
        if (stat(v42, valuePtr))
        {
          warn("%s", v42);
          v46 = 3758097136;
          goto LABEL_163;
        }
        if ((valuePtr[0].st_mode & 0x6000) != 0)
        {
          v43 = open(v42, 0);
          if (v43 == -1)
          {
            warn("could not open %s", v42);
            v46 = 5;
            goto LABEL_163;
          }
          v44 = v43;
          v45 = ioctl(v43, 0x20006415uLL, 0);
          if (v45 == -1)
          {
            warn("could not eject %s", v42);
            v46 = 5;
            if (v44 < 0)
            {
LABEL_75:
              if (v45 != -1)
                goto LABEL_150;
LABEL_163:
              warnx("eject failed: error 0x%x = %d");
              goto LABEL_176;
            }
          }
          else
          {
            fprintf(__stdoutp, "%s ejected successfully.\n", v42);
            v46 = 0;
            if (v44 < 0)
              goto LABEL_75;
          }
          close(v44);
          goto LABEL_75;
        }
        warn("%s doesn't appear to be a device node");
      }
      else
      {
        warn("eject requires input of the form %sdiskX");
      }
      v46 = 3758097090;
      goto LABEL_163;
    }
    if (!strcasecmp(v6, "-shadow"))
    {
      warnx("-shadow option not supported", v93);
      goto LABEL_175;
    }
    if (strcasecmp(v6, "-nomount"))
      break;
    CFDictionarySetValue(Mutable, CFSTR("autodiskmount"), kCFBooleanFalse);
    v6 = v8;
LABEL_61:
    LODWORD(v7) = v7 + 1;
    if ((int)v7 >= a1)
    {
      if (!geteuid())
      {
        v39 = CFUUIDCreate(kCFAllocatorDefault);
        if (v39)
        {
          v40 = v39;
          v41 = CFUUIDCreateString(kCFAllocatorDefault, v39);
          CFRelease(v40);
        }
        else
        {
          v41 = 0;
        }
        qword_100008000 = (uint64_t)v41;
        CFDictionarySetValue(Mutable, CFSTR("hdik-unique-identifier"), v41);
        v47 = (const char *)valuePtr;
        if (!realpath_DARWIN_EXTSN(v6, (char *)valuePtr))
          v47 = v6;
        v48 = strlen(v47);
        v49 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)v47, v48);
        CFDictionarySetValue(Mutable, CFSTR("image-path"), v49);
        if (v49)
          CFRelease(v49);
        values = 0;
        Value = (const __CFData *)CFDictionaryGetValue(Mutable, CFSTR("image-path"));
        if (!Value)
        {
          v46 = 22;
          goto LABEL_157;
        }
        v51 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, Value, 0x8000100u);
        if (v51)
        {
          v52 = v51;
          v53 = CFURLCreateWithString(kCFAllocatorDefault, v51, 0);
          if (v53)
          {
            v54 = v53;
            memset(&__endptr, 0, sizeof(__endptr));
            v55 = CFURLCopyScheme(v53);
            v56 = v55;
            if (v55 && CFStringCompare(v55, CFSTR("file"), 0))
            {
              CFRelease(v52);
              v57 = 0;
              v58 = 0;
              v46 = 0;
LABEL_104:
              CFRelease(v56);
LABEL_105:
              CFRelease(v54);
              if (values)
              {
                CFRelease(values);
                values = 0;
              }
              if (v58)
                CFRelease(v58);
              if (v57)
                CFRelease(v57);
              if (!(_DWORD)v46)
              {
                __endptr.st_dev = 0;
                *(_QWORD *)&valuePtr[0].st_dev = 0;
                v60 = IOServiceMatching("IOHDIXController");
                MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v60);
                if (MatchingService)
                {
                  v62 = MatchingService;
                  goto LABEL_114;
                }
                v64 = IOServiceMatching("IOResources");
                MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v64, (io_iterator_t *)&__endptr);
                if (!MatchingServices)
                {
                  if (!IOIteratorIsValid(__endptr.st_dev))
                    IOIteratorReset(__endptr.st_dev);
                  v71 = IOIteratorNext(__endptr.st_dev);
                  if (v71)
                  {
                    v62 = v71;
                    v72 = IORegistryEntrySetCFProperty(v71, CFSTR("com.apple.AppleDiskImageController.load"), kCFBooleanTrue);
                    if (v72)
                    {
                      MatchingServices = v72;
                      goto LABEL_115;
                    }
                    *(_QWORD *)&valuePtr[0].st_dev = 5;
                    v90 = IOKitWaitQuiet(kIOMasterPortDefault, (mach_timespec_t *)valuePtr);
                    if (v90)
                      warnx("IOKit timed out waiting for driver to load: error %08x.", v90);
LABEL_114:
                    MatchingServices = 0;
LABEL_115:
                    IOObjectRelease(v62);
                    goto LABEL_117;
                  }
                  MatchingServices = -536870208;
                }
LABEL_117:
                if (__endptr.st_dev)
                  IOObjectRelease(__endptr.st_dev);
                if (MatchingServices)
                {
                  warnx("unable to load driver", v93);
                  goto LABEL_175;
                }
                LODWORD(values) = 0;
                v65 = IOServiceMatching("IOHDIXController");
                v66 = IOServiceGetMatchingService(kIOMasterPortDefault, v65);
                if (v66)
                {
                  v67 = v66;
                  memset(valuePtr, 0, 256);
                  outputStruct = 0;
                  v68 = IOServiceOpen(v66, mach_task_self_, 0, (io_connect_t *)&values);
                  if (!(_DWORD)v68)
                  {
                    Data = CFPropertyListCreateData(kCFAllocatorDefault, Mutable, kCFPropertyListXMLFormat_v1_0, 0, 0);
                    if (Data)
                    {
                      v70 = Data;
                      memset(&valuePtr[0].st_rdev, 0, 232);
                      *(_QWORD *)&valuePtr[0].st_dev = 0x1BEEFFEEDLL;
                      valuePtr[0].st_ino = (__darwin_ino64_t)CFDataGetBytePtr(Data);
                      *(_QWORD *)&valuePtr[0].st_uid = CFDataGetLength(v70);
                      *(_QWORD *)&__endptr.st_dev = 4;
                      v68 = IOConnectCallStructMethod((mach_port_t)values, 0, valuePtr, 0x100uLL, &outputStruct, (size_t *)&__endptr);
                      CFRelease(v70);
                    }
                    else
                    {
                      v68 = 4;
                    }
                  }
                  IOObjectRelease(v67);
                  if ((_DWORD)values)
                    IOServiceClose((io_connect_t)values);
                  if (!(_DWORD)v68)
                  {
                    v4[2] = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
                    valuePtr[0].st_dev = 0;
                    v73 = IONotificationPortCreate(kIOMasterPortDefault);
                    if (!v73)
                      goto LABEL_151;
                    v74 = v73;
                    v75 = IOServiceMatching("IOMedia");
                    v76 = IOServiceAddMatchingNotification(v74, "IOServiceMatched", v75, (IOServiceMatchingCallback)sub_100003364, 0, (io_iterator_t *)valuePtr);
                    if (!v76)
                    {
                      sub_100003364(0, valuePtr[0].st_dev);
                      if (!byte_100008008)
                      {
                        Current = CFRunLoopGetCurrent();
                        RunLoopSource = IONotificationPortGetRunLoopSource(v74);
                        CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
                        v79 = CFRunLoopGetCurrent();
                        v80 = IONotificationPortGetRunLoopSource(v74);
                        CFRunLoopRemoveSource(v79, v80, kCFRunLoopDefaultMode);
                      }
                    }
                    IONotificationPortDestroy(v74);
                    if (valuePtr[0].st_dev)
                      IOObjectRelease(valuePtr[0].st_dev);
                    if (v76)
                    {
LABEL_151:
                      warnx("unable to locate attached image");
                      v46 = 2;
                      goto LABEL_176;
                    }
                    Count = CFArrayGetCount((CFArrayRef)v4[2]);
                    v104.location = 0;
                    v104.length = Count;
                    CFArraySortValues((CFMutableArrayRef)v4[2], v104, (CFComparatorFunction)sub_100003564, 0);
                    if (Count >= 1)
                    {
                      for (i = 0; i != Count; ++i)
                      {
                        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v4[2], i);
                        v84 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("dev-entry"));
                        v85 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("content-hint"));
                        v86 = (const char *)sub_1000035B4(v84, 0x8000100u);
                        if (v86)
                        {
                          v87 = (char *)v86;
                          printf("%-20.20s", v86);
                          free(v87);
                        }
                        else
                        {
                          printf("%-20.20s", " ");
                        }
                        putchar(9);
                        v88 = (const char *)sub_1000035B4(v85, 0x8000100u);
                        if (v88)
                        {
                          v89 = (char *)v88;
                          printf("%-31.31s", v88);
                          free(v89);
                        }
                        else
                        {
                          printf("%-31.31s", " ");
                        }
                        putchar(9);
                        putchar(10);
                      }
                      v46 = 0;
                      Mutable = theDict;
                      goto LABEL_176;
                    }
LABEL_150:
                    v46 = 0;
                    goto LABEL_176;
                  }
                }
                else
                {
                  v68 = 3758097088;
                }
                warnx("attach failed: error 0x%x = %d", v68, v68);
                v46 = v68;
                goto LABEL_176;
              }
LABEL_157:
              warnx("couldn't construct backing store identifier");
              goto LABEL_176;
            }
            if (!CFURLGetFileSystemRepresentation(v54, 1u, (UInt8 *)valuePtr, 1024)
              || stat((const char *)valuePtr, &__endptr) < 0)
            {
              v58 = 0;
              v57 = 0;
              v46 = 2;
              goto LABEL_103;
            }
            values = (void *)CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("d%d:i%llu"), __endptr.st_dev, __endptr.st_ino);
            if (values)
            {
              v58 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1, &kCFTypeArrayCallBacks);
              if (v58)
              {
                v59 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                v57 = v59;
                if (v59)
                {
                  CFDictionarySetValue(v59, CFSTR("writeable-components"), v58);
                  CFDictionarySetValue(Mutable, CFSTR("backingstore-id"), v57);
                  v46 = 0;
                  goto LABEL_103;
                }
                goto LABEL_102;
              }
            }
            else
            {
              v58 = 0;
            }
            v57 = 0;
LABEL_102:
            v46 = 12;
LABEL_103:
            CFRelease(v52);
            if (!v56)
              goto LABEL_105;
            goto LABEL_104;
          }
          CFRelease(v52);
        }
        v46 = 12;
        goto LABEL_157;
      }
LABEL_99:
      warnx("must be run by root");
      v46 = 1;
      goto LABEL_176;
    }
  }
  if (strcasecmp(v6, "-drivekey"))
  {
    if (!strcasecmp(v6, "-encryption"))
    {
      v7 = (int)v7 + 1;
      if (v9 + 1 == a1)
      {
        warnx("missing <encryption-key+hmacsha1-key> parameter", v93);
      }
      else
      {
        v23 = strlen(a2[v7]);
        LOBYTE(values) = 0;
        if (v23 == 72)
        {
          printf("encryption-key:");
          v24 = 0;
          for (j = 0; j != 16; ++j)
          {
            v26 = sscanf(&a2[v7][v24], "%02hhx", &values);
            printf("%02x", values);
            fflush(0);
            if (v26 != 1)
            {
              Mutable = theDict;
              warnx("improper encryption-key portion of string", v94);
              goto LABEL_175;
            }
            *((_BYTE *)&__endptr.st_dev + j) = (_BYTE)values;
            v24 += 2;
          }
          putchar(10);
          printf("hmacsha1-key:");
          v27 = 0;
          v28 = 32;
          while (1)
          {
            v29 = sscanf(&a2[v7][v28], "%02hhx", &values);
            printf("%02x", values);
            if (v29 != 1)
              break;
            *((_BYTE *)&valuePtr[0].st_dev + v27++) = (_BYTE)values;
            v28 += 2;
            if (v27 == 20)
            {
              putchar(10);
              Mutable = theDict;
              CFDictionarySetValue(theDict, CFSTR("image-encrypted"), kCFBooleanTrue);
              v30 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v31 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&__endptr, 16);
              CFDictionarySetValue(v30, CFSTR("encryption-key"), v31);
              CFRelease(v31);
              v32 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)valuePtr, 20);
              CFDictionarySetValue(v30, CFSTR("hmacsha1-key"), v32);
              CFRelease(v32);
              CFDictionarySetValue(theDict, CFSTR("image-secrets"), v30);
              CFRelease(v30);
              v6 = v8;
              v4 = &qword_100008000;
              goto LABEL_61;
            }
          }
          Mutable = theDict;
          v4 = &qword_100008000;
          warnx("improper hmacsha1-key portion of string", v93);
        }
        else
        {
          warnx("<encryption-key+hmacsha1-key> must be 72 ASCII chars");
        }
      }
      goto LABEL_175;
    }
    if (*v6 == 45)
    {
      warnx("unknown option \"%s\"");
      goto LABEL_175;
    }
    if (v8)
    {
      warnx("only one image may be specified", v93);
      goto LABEL_175;
    }
    goto LABEL_61;
  }
  v7 = (int)v7 + 1;
  if (v9 + 1 == a1)
  {
    warnx("missing -drivekey parameter", v93);
    goto LABEL_175;
  }
  v10 = a2[v7];
  v11 = strchr(v10, 61);
  if (!v11 || v11 == v10 || !v11[1])
    goto LABEL_174;
  v12 = strlen(v10) + 1;
  v13 = (char *)malloc_type_malloc(v12, 0x62D022F1uLL);
  if (v13)
  {
    v14 = v13;
    strlcpy(v13, v10, v12);
    v15 = strchr(v14, 61);
    *v15 = 0;
    v16 = v15 + 1;
    v17 = CFStringCreateWithCString(kCFAllocatorDefault, v14, 0x8000100u);
    v18 = CFStringCreateWithCString(kCFAllocatorDefault, v16, 0x8000100u);
    if (CFStringCompare(v18, CFSTR("yes"), 1uLL) && CFStringCompare(v18, CFSTR("true"), 1uLL))
    {
      if (CFStringCompare(v18, CFSTR("no"), 1uLL) && CFStringCompare(v18, CFSTR("false"), 1uLL))
      {
        values = 0;
        v19 = CFGetTypeID(v18);
        if (v19 == CFStringGetTypeID())
        {
          v20 = (char *)sub_1000035B4(v18, 0x600u);
          if (v20)
          {
            *(_QWORD *)&__endptr.st_dev = 0;
            if (*v20)
            {
              v96 = v20;
              v21 = 0;
              *(_QWORD *)&valuePtr[0].st_dev = strtouq(v20, (char **)&__endptr, 0);
              v20 = v96;
              if (!**(_BYTE **)&__endptr.st_dev)
              {
                v22 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, valuePtr);
                if (v22)
                {
                  cf = v22;
                  v21 = CFNumberGetValue(v22, kCFNumberSInt64Type, &values);
                  CFRelease(cf);
                }
                else
                {
                  v21 = 0;
                }
                v20 = v96;
              }
            }
            else
            {
              v21 = 0;
            }
            free(v20);
LABEL_52:
            if (v21)
            {
              v38 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &values);
              if (v38)
              {
                v34 = v38;
LABEL_41:
                CFDictionarySetValue(theDict, v17, v34);
                CFRelease(v34);
LABEL_56:
                v4 = &qword_100008000;
                if (v17)
                  CFRelease(v17);
                if (v18)
                  CFRelease(v18);
                free(v14);
                v6 = v8;
                Mutable = theDict;
                goto LABEL_61;
              }
            }
LABEL_55:
            CFDictionarySetValue(theDict, v17, v18);
            goto LABEL_56;
          }
        }
        else
        {
          v35 = CFGetTypeID(v18);
          if (v35 != CFBooleanGetTypeID())
          {
            v37 = CFGetTypeID(v18);
            if (v37 == CFNumberGetTypeID())
            {
              v21 = CFNumberGetValue((CFNumberRef)v18, kCFNumberSInt64Type, &values);
              goto LABEL_52;
            }
            goto LABEL_55;
          }
          valuePtr[0].st_dev = CFBooleanGetValue((CFBooleanRef)v18) != 0;
          v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, valuePtr);
          if (v36)
          {
            v97 = v36;
            v21 = CFNumberGetValue(v36, kCFNumberSInt64Type, &values);
            CFRelease(v97);
            goto LABEL_52;
          }
        }
        v21 = 0;
        goto LABEL_52;
      }
      v33 = &kCFBooleanFalse;
    }
    else
    {
      v33 = &kCFBooleanTrue;
    }
    v34 = *v33;
    if (*v33)
      goto LABEL_41;
    goto LABEL_55;
  }
  Mutable = theDict;
LABEL_174:
  warnx("unable to process -drivekey parameter \"%s\"");
LABEL_175:
  v46 = 22;
LABEL_176:
  v91 = (const void *)v4[2];
  if (v91)
  {
    CFRelease(v91);
    v4[2] = 0;
  }
  if (Mutable)
    CFRelease(Mutable);
  if ((_DWORD)v46 == 22)
  {
    sub_1000032A0(v98);
    exit(1);
  }
  return v46;
}

size_t sub_1000032A0(const char *a1)
{
  fprintf(__stderrp, "Usage:\t%s [options] <image>\n", a1);
  fprintf(__stderrp, "\t%s -e <device>\n", a1);
  fprintf(__stderrp, "\t%s -help\n", a1);
  fwrite("\toptions:\n", 0xAuLL, 1uLL, __stderrp);
  fwrite("\t    -nomount\n", 0xEuLL, 1uLL, __stderrp);
  fwrite("\t    -drivekey <key>=<value>\n", 0x1DuLL, 1uLL, __stderrp);
  return fwrite("\t    -encryption <encryption-key+hmacsha1-key>\n", 0x2FuLL, 1uLL, __stderrp);
}

uint64_t sub_100003364(int a1, io_iterator_t iterator)
{
  uint64_t result;
  io_registry_entry_t v4;
  int v5;
  CFTypeRef v6;
  const void *v7;
  CFTypeID v8;
  CFTypeRef CFProperty;
  const void *v10;
  const __CFArray *v11;
  __CFDictionary *Mutable;
  CFStringRef v13;
  CFTypeRef v14;
  const void *v15;
  CFRange v16;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v4 = result;
    v5 = 0;
    do
    {
      v6 = IORegistryEntrySearchCFProperty(v4, "IOService", CFSTR("hdik-unique-identifier"), kCFAllocatorDefault, 3u);
      if (v6)
      {
        v7 = v6;
        v8 = CFGetTypeID(v6);
        if (v8 == CFStringGetTypeID() && CFEqual((CFTypeRef)qword_100008000, v7))
        {
          CFProperty = IORegistryEntryCreateCFProperty(v4, CFSTR("BSD Name"), kCFAllocatorDefault, 0);
          if (CFProperty)
          {
            v10 = CFProperty;
            v11 = (const __CFArray *)qword_100008010;
            v16.length = CFArrayGetCount((CFArrayRef)qword_100008010);
            v16.location = 0;
            if (!CFArrayContainsValue(v11, v16, v10))
            {
              Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
              v13 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("/dev/%@"), v10);
              CFDictionarySetValue(Mutable, CFSTR("dev-entry"), v13);
              if (v13)
                CFRelease(v13);
              v14 = IORegistryEntryCreateCFProperty(v4, CFSTR("Content"), kCFAllocatorDefault, 0);
              if (v14)
              {
                v15 = v14;
                CFDictionarySetValue(Mutable, CFSTR("content-hint"), v14);
                CFRelease(v15);
              }
              CFArrayAppendValue((CFMutableArrayRef)qword_100008010, Mutable);
              if (Mutable)
                CFRelease(Mutable);
            }
            CFRelease(v10);
          }
          v5 = 1;
        }
        IOObjectRelease(v4);
        CFRelease(v7);
      }
      else
      {
        IOObjectRelease(v4);
      }
      result = IOIteratorNext(iterator);
      v4 = result;
    }
    while ((_DWORD)result);
    if (v5)
      byte_100008008 = 1;
  }
  return result;
}

CFComparisonResult sub_100003564(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFString *Value;
  const __CFString *v4;

  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("dev-entry"));
  v4 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("dev-entry"));
  return CFStringCompare(Value, v4, 0);
}

void *sub_1000035B4(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length;
  CFIndex v5;
  char *v6;
  char *v7;
  size_t v8;

  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  v6 = (char *)malloc_type_malloc(v5, 0x6C7A34EFuLL);
  if (v6)
  {
    v7 = v6;
    if (CFStringGetCString(a1, v6, v5, a2))
    {
      v8 = strlen(v7) + 1;
      return reallocf(v7, v8);
    }
    free(v7);
  }
  return 0;
}
