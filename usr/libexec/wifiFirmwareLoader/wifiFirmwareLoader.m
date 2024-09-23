void sub_1000014D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  NSObject *v8;
  __int128 v9;
  tm *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  IONotificationPort *v17;
  NSObject *v18;
  __int128 v19;
  tm *v20;
  __CFRunLoopSource *RunLoopSource;
  const __CFDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  tm *v31;
  __int128 v32;
  tm *v33;
  __CFRunLoop *Current;
  __CFRunLoop *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  __int128 v43;
  tm *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  __int128 v52;
  tm *v53;
  __CFRunLoop *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL4 v61;
  NSObject *v63;
  __int128 v64;
  tm *v65;
  char v66;
  char v67;
  char v68;
  uint64_t v69;
  char v70;
  const char *v71;
  _QWORD block[4];
  io_iterator_t v73;
  io_iterator_t v74;
  time_t v75;
  io_iterator_t notification[2];
  char v77[16];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;

  *(_QWORD *)notification = 0;
  if (qword_100010218)
    v8 = qword_100010218;
  else
    v8 = &_os_log_default;
  sub_1000082F8(v8, "Going to discover services \n", a3, a4, a5, a6, a7, a8, v66);
  if (dword_100010220)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v83 = v9;
    v84 = v9;
    v82 = v9;
    v80 = v9;
    v81 = v9;
    v78 = v9;
    v79 = v9;
    *(_OWORD *)v77 = v9;
    v75 = 0xAAAAAAAAAAAAAAAALL;
    time(&v75);
    v10 = localtime(&v75);
    strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v77);
    dprintf(dword_100010220, "Going to discover services \n");
  }
  v17 = IONotificationPortCreate(kIOMainPortDefault);
  if (qword_100010218)
    v18 = qword_100010218;
  else
    v18 = &_os_log_default;
  if (v17)
  {
    v71 = "com.apple.driver.AppleBCMWLANCore";
    sub_1000082F8(v18, "Matching with -> Core match:'%s', Bundle ID match:'%s'\n", v11, v12, v13, v14, v15, v16, (char)"AppleBCMWLANCore");
    if (dword_100010220)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v19;
      v84 = v19;
      v82 = v19;
      v80 = v19;
      v81 = v19;
      v78 = v19;
      v79 = v19;
      *(_OWORD *)v77 = v19;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v20 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v20);
      dprintf(dword_100010220, "%s ", v77);
      dprintf(dword_100010220, "Matching with -> Core match:'%s', Bundle ID match:'%s'\n", "AppleBCMWLANCore", "com.apple.driver.AppleBCMWLANCore");
    }
    RunLoopSource = IONotificationPortGetRunLoopSource(v17);
    v22 = IOServiceNameMatching("AppleBCMWLANCore");
    if (IOServiceAddMatchingNotification(v17, "IOServiceFirstMatch", v22, (IOServiceMatchingCallback)sub_100001A90, notification, &notification[1]))
    {
      if (qword_100010218)
        v29 = qword_100010218;
      else
        v29 = &_os_log_default;
      sub_1000082F8(v29, "Failed to add matching notification\n", v23, v24, v25, v26, v27, v28, v68);
      if (dword_100010220)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v30;
        v84 = v30;
        v82 = v30;
        v80 = v30;
        v81 = v30;
        v78 = v30;
        v79 = v30;
        *(_OWORD *)v77 = v30;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v31 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Failed to add matching notification\n", v69, v71);
      }
    }
    else
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      v35 = CFRunLoopGetCurrent();
      block[0] = _NSConcreteStackBlock;
      block[1] = 0x40000000;
      block[2] = sub_1000021A8;
      block[3] = &unk_10000C3F8;
      v73 = notification[0];
      v74 = notification[1];
      CFRunLoopPerformBlock(v35, kCFRunLoopDefaultMode, block);
      if (qword_100010218)
        v42 = qword_100010218;
      else
        v42 = &_os_log_default;
      sub_1000082F8(v42, "Waiting for firmware to load\n", v36, v37, v38, v39, v40, v41, v68);
      if (dword_100010220)
      {
        *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v43;
        v84 = v43;
        v82 = v43;
        v80 = v43;
        v81 = v43;
        v78 = v43;
        v79 = v43;
        *(_OWORD *)v77 = v43;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v44 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v44);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "Waiting for firmware to load\n");
      }
      if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 300.0, 0) == kCFRunLoopRunTimedOut)
      {
        v51 = qword_100010218 ? qword_100010218 : &_os_log_default;
        sub_1000082F8(v51, "Runloop timed out\n", v45, v46, v47, v48, v49, v50, v70);
        if (dword_100010220)
        {
          *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v83 = v52;
          v84 = v52;
          v82 = v52;
          v80 = v52;
          v81 = v52;
          v78 = v52;
          v79 = v52;
          *(_OWORD *)v77 = v52;
          v75 = 0xAAAAAAAAAAAAAAAALL;
          time(&v75);
          v53 = localtime(&v75);
          strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v53);
          dprintf(dword_100010220, "%s ", v77);
          dprintf(dword_100010220, "Runloop timed out\n");
        }
      }
      v54 = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(v54, RunLoopSource, kCFRunLoopDefaultMode);
      IONotificationPortDestroy(v17);
      v61 = dword_100010118 == 2 && dword_100010114 == 1 || dword_100010190 == 2 && dword_10001018C == 1;
      HIDWORD(qword_100010100) = v61;
      if (qword_100010218)
        v63 = qword_100010218;
      else
        v63 = &_os_log_default;
      sub_1000082F8(v63, "wifiFirmwareLoaderThread exiting with %d\n", v55, v56, v57, v58, v59, v60, v61);
      if (dword_100010220)
      {
        *(_QWORD *)&v64 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v83 = v64;
        v84 = v64;
        v82 = v64;
        v80 = v64;
        v81 = v64;
        v78 = v64;
        v79 = v64;
        *(_OWORD *)v77 = v64;
        v75 = 0xAAAAAAAAAAAAAAAALL;
        time(&v75);
        v65 = localtime(&v75);
        strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v65);
        dprintf(dword_100010220, "%s ", v77);
        dprintf(dword_100010220, "wifiFirmwareLoaderThread exiting with %d\n");
      }
    }
  }
  else
  {
    sub_1000082F8(v18, "Failed to create notification port\n", v11, v12, v13, v14, v15, v16, v67);
    if (dword_100010220)
    {
      *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v83 = v32;
      v84 = v32;
      v82 = v32;
      v80 = v32;
      v81 = v32;
      v78 = v32;
      v79 = v32;
      *(_OWORD *)v77 = v32;
      v75 = 0xAAAAAAAAAAAAAAAALL;
      time(&v75);
      v33 = localtime(&v75);
      strftime(v77, 0x80uLL, "%b %d %H:%M:%S", v33);
      dprintf(dword_100010220, "%s ", v77);
      dprintf(dword_100010220, "Failed to create notification port\n");
    }
  }
}

uint64_t sub_100001A90(io_registry_entry_t *a1, io_iterator_t a2)
{
  io_registry_entry_t *v2;
  pthread_once_t *v3;
  uint64_t result;
  io_registry_entry_t v5;
  const __CFString *CFProperty;
  const __CFString *v7;
  CFTypeID TypeID;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  tm *v18;
  const __CFBoolean *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFBoolean *v26;
  NSObject *v27;
  __int128 v28;
  tm *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  __int128 v38;
  tm *v39;
  __int128 v40;
  tm *v41;
  uint64_t v42;
  char CStringPtr;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  tm *v58;
  int v59;
  const char *v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __int128 v68;
  tm *v69;
  NSObject *v70;
  __int128 v71;
  tm *v72;
  char *v73;
  CFIndex *usedBufLen;
  time_t v77;
  CFIndex v78;
  char v79[16];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CFRange v87;

  v2 = a1;
  v3 = &stru_100010000;
  while (1)
  {
    result = IOIteratorNext(a2);
    if (!(_DWORD)result)
      return result;
    v5 = result;
    __strlcpy_chk(&xmmword_100010011, "Unknown", 64, 64);
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v5, CFSTR("DriverKitDriverPlatformType"), kCFAllocatorDefault, 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      TypeID = CFStringGetTypeID();
      v9 = TypeID == CFGetTypeID(v7);
      v3 = &stru_100010000;
      if (v9)
      {
        xmmword_100010031 = 0u;
        unk_100010041 = 0u;
        xmmword_100010011 = 0u;
        unk_100010021 = 0u;
        v78 = 0;
        v87.length = CFStringGetLength(v7);
        v87.location = 0;
        if (!CFStringGetBytes(v7, v87, 0x8000100u, 0, 0, (UInt8 *)&xmmword_100010011, 64, &v78))
        {
          v16 = qword_100010218 ? qword_100010218 : &_os_log_default;
          sub_1000082F8(v16, "%s failed, no characters converted\n", v10, v11, v12, v13, v14, v15, (char)"__serviceCallback");
          if (dword_100010220)
          {
            *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v85 = v17;
            v86 = v17;
            v83 = v17;
            v84 = v17;
            v81 = v17;
            v82 = v17;
            *(_OWORD *)v79 = v17;
            v80 = v17;
            v77 = 0xAAAAAAAAAAAAAAAALL;
            time(&v77);
            v18 = localtime(&v77);
            strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v18);
            dprintf(dword_100010220, "%s ", v79);
            dprintf(dword_100010220, "%s failed, no characters converted\n", "__serviceCallback");
          }
        }
        CFRelease(v7);
      }
    }
    v19 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v5, CFSTR("DriverKitDriver"), kCFAllocatorDefault, 0);
    if (v19)
    {
      v26 = v19;
      LOBYTE(v3[1].__sig) = CFBooleanGetValue(v19) != 0;
      CFRelease(v26);
    }
    if (qword_100010218)
      v27 = qword_100010218;
    else
      v27 = &_os_log_default;
    if (LOBYTE(v3[1].__sig))
    {
      sub_1000082F8(v27, "We are using driverkit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v85 = v28;
        v86 = v28;
        v83 = v28;
        v84 = v28;
        v81 = v28;
        v82 = v28;
        *(_OWORD *)v79 = v28;
        v80 = v28;
        v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v29 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v29);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using driverkit driver\n");
      }
      v36 = (const __CFString *)IORegistryEntryCreateCFProperty(v5, CFSTR("IOUserClass"), kCFAllocatorDefault, 0);
      if (!v36)
      {
        if (qword_100010218)
          v37 = qword_100010218;
        else
          v37 = &_os_log_default;
        sub_1000082F8(v37, "Property read for %s returned NULL\n", v30, v31, v32, v33, v34, v35, (char)"IOUserClass");
        if (dword_100010220)
        {
          *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v85 = v38;
          v86 = v38;
          v83 = v38;
          v84 = v38;
          v81 = v38;
          v82 = v38;
          *(_OWORD *)v79 = v38;
          v80 = v38;
          v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v39 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v39);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "Property read for %s returned NULL\n", "IOUserClass");
        }
        goto LABEL_51;
      }
    }
    else
    {
      sub_1000082F8(v27, "We are using IOKit driver\n", v20, v21, v22, v23, v24, v25, (char)usedBufLen);
      if (dword_100010220)
      {
        *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v85 = v40;
        v86 = v40;
        v83 = v40;
        v84 = v40;
        v81 = v40;
        v82 = v40;
        *(_OWORD *)v79 = v40;
        v80 = v40;
        v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v41 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v41);
        dprintf(dword_100010220, "%s ", v79);
        dprintf(dword_100010220, "We are using IOKit driver\n");
      }
      v36 = IOObjectCopyClass(v5);
      if (!v36)
        goto LABEL_51;
    }
    if (CFStringCompare(v36, CFSTR("AppleBCMWLANCore"), 0) == kCFCompareEqualTo)
    {
      v42 = qword_100010218;
      CStringPtr = CFStringGetCStringPtr(v36, 0);
      v50 = &_os_log_default;
      if (v42)
        v50 = v42;
      sub_1000082F8(v50, "Matched class name '%s', starting ...\n", v44, v45, v46, v47, v48, v49, CStringPtr);
      if (dword_100010220)
      {
        *(_QWORD *)&v57 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v85 = v57;
        v86 = v57;
        v83 = v57;
        v84 = v57;
        v81 = v57;
        v82 = v57;
        *(_OWORD *)v79 = v57;
        v80 = v57;
        v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v58 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", v79);
        v59 = dword_100010220;
        v60 = CFStringGetCStringPtr(v36, 0);
        dprintf(v59, "Matched class name '%s', starting ...\n", v60);
      }
      if (qword_100010218)
        v61 = qword_100010218;
      else
        v61 = &_os_log_default;
      sub_1000082F8(v61, "%s()\n", v51, v52, v53, v54, v55, v56, (char)"startWiFiFirmwareLoaderService");
      if (dword_100010220)
      {
        *(_QWORD *)&v68 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v85 = v68;
        v86 = v68;
        v83 = v68;
        v84 = v68;
        v81 = v68;
        v82 = v68;
        *(_OWORD *)v79 = v68;
        v80 = v68;
        v78 = 0xAAAAAAAAAAAAAAAALL;
        time(&v78);
        v69 = localtime(&v78);
        strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v69);
        dprintf(dword_100010220, "%s ", v79);
        usedBufLen = (CFIndex *)"startWiFiFirmwareLoaderService";
        dprintf(dword_100010220, "%s()\n");
      }
      v3 = &stru_100010000;
      if ((_DWORD)qword_100010100 == 2)
      {
        if (qword_100010218)
          v70 = qword_100010218;
        else
          v70 = &_os_log_default;
        sub_1000082F8(v70, "No free interface slot, ignoring service..", v62, v63, v64, v65, v66, v67, (char)usedBufLen);
        v2 = a1;
        if (dword_100010220)
        {
          *(_QWORD *)&v71 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v71 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v85 = v71;
          v86 = v71;
          v83 = v71;
          v84 = v71;
          v81 = v71;
          v82 = v71;
          *(_OWORD *)v79 = v71;
          v80 = v71;
          v78 = 0xAAAAAAAAAAAAAAAALL;
          time(&v78);
          v72 = localtime(&v78);
          strftime(v79, 0x80uLL, "%b %d %H:%M:%S", v72);
          dprintf(dword_100010220, "%s ", v79);
          dprintf(dword_100010220, "No free interface slot, ignoring service..");
        }
      }
      else
      {
        if (qword_100010100 >= 2)
        {
          __break(0x5512u);
LABEL_55:
          __break(0x5513u);
LABEL_56:
          __break(0x5500u);
        }
        v2 = a1;
        if (120 * (unint64_t)qword_100010100 > ~(unint64_t)&unk_100010108)
          goto LABEL_55;
        v73 = (char *)&unk_100010058 + 120 * qword_100010100;
        *((_DWORD *)v73 + 48) = 1;
        *((_DWORD *)v73 + 46) = v5;
        pthread_create((pthread_t *)v73 + 22, 0, (void *(__cdecl *)(void *))sub_1000021B8, v73 + 176);
        if (__OFADD__((_DWORD)qword_100010100, 1))
          goto LABEL_56;
        LODWORD(qword_100010100) = qword_100010100 + 1;
      }
    }
    CFRelease(v36);
LABEL_51:
    if (!*v2)
      *v2 = v5;
  }
}

uint64_t sub_1000021A8(uint64_t a1)
{
  return sub_100001A90((io_registry_entry_t *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

void sub_1000021B8(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  const __CFAllocator *v3;
  const __CFString *MutableCopy;
  io_registry_entry_t v5;
  const char *CStringPtr;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UInt8 *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  UInt8 *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFDataRef v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFDataRef v34;
  CFMutableStringRef v35;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v37;
  _BOOL4 v38;
  io_registry_entry_t v39;
  __int128 v40;
  const __CFString *v41;
  const char *v42;
  const __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFTypeID TypeID;
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
  NSObject *v64;
  __int128 v65;
  tm *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  NSObject *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  tm *v83;
  NSObject *v84;
  __int128 v85;
  tm *v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const __CFString *v94;
  const __CFURL *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const __CFURL *v102;
  __CFReadStream *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __CFReadStream *v110;
  int v111;
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
  const __CFArray **v125;
  NSObject *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  tm *v134;
  CFTypeID v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  CFIndex Count;
  unsigned int v143;
  const void **v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const void **v151;
  int v152;
  CFIndex v153;
  unint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  const __CFArray **v162;
  const void **v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  NSObject *v173;
  __int128 v174;
  tm *v175;
  unint64_t v176;
  int v177;
  BOOL v178;
  unint64_t v179;
  BOOL v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  CFTypeID v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  CFTypeID v194;
  NSObject *v195;
  __int128 v196;
  tm *v197;
  _BOOL4 v198;
  NSObject *v199;
  __int128 v200;
  tm *v201;
  __int128 v202;
  tm *v203;
  NSObject *v204;
  __int128 v205;
  tm *v206;
  NSObject *v207;
  __int128 v208;
  tm *v209;
  NSObject *v210;
  __int128 v211;
  tm *v212;
  NSObject *v213;
  __int128 v214;
  tm *v215;
  NSObject *v216;
  __int128 v217;
  tm *v218;
  NSObject *v219;
  __int128 v220;
  tm *v221;
  NSObject *v222;
  __int128 v223;
  tm *v224;
  __int128 v225;
  tm *v226;
  NSObject *v227;
  __int128 v228;
  tm *v229;
  NSObject *v230;
  __int128 v231;
  tm *v232;
  NSObject *v233;
  __int128 v234;
  tm *v235;
  NSObject *v236;
  __int128 v237;
  tm *v238;
  NSObject *v239;
  __int128 v240;
  tm *v241;
  NSObject *v242;
  __int128 v243;
  tm *v244;
  __CFReadStream *v245;
  io_service_t v246;
  uint64_t Instance;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  pthread_once_t *v254;
  uint64_t v255;
  mach_port_t *v256;
  CFTypeRef v257;
  const __CFDictionary *v258;
  const __CFArray *v259;
  const __CFData *Value;
  const __CFString *v261;
  const __CFData *v262;
  CFTypeID v263;
  const __CFString *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const __CFString *v271;
  const char *v272;
  const char *v273;
  NSObject *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  __int128 v281;
  tm *v282;
  NSObject *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  __int128 v290;
  tm *v291;
  NSObject *v292;
  __int128 v293;
  tm *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  __int128 v301;
  tm *v302;
  NSObject *v303;
  __int128 v304;
  tm *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  int v312;
  io_object_t v313;
  io_registry_entry_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  NSObject *v321;
  __int128 v322;
  tm *v323;
  const __CFDictionary *v324;
  const __CFDictionary *v325;
  int v326;
  const __CFString *v327;
  __int128 v328;
  const __CFNumber *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  NSObject *v336;
  __int128 v337;
  tm *v338;
  NSObject *v339;
  __int128 v340;
  tm *v341;
  UInt8 *v342;
  UInt8 *v343;
  CFDataRef v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  CFDataRef v351;
  NSObject *v352;
  __int128 v353;
  tm *v354;
  const char *v355;
  size_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  CFStringRef v363;
  NSObject *v364;
  __int128 v365;
  tm *v366;
  _BOOL4 v367;
  NSObject *v368;
  __int128 v369;
  tm *v370;
  const __CFString *v371;
  int v372;
  double v373;
  uint64_t v374;
  char v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  NSObject *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  __int128 v389;
  tm *v390;
  int v391;
  const char *v392;
  const char *v393;
  const char *v394;
  const char *v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  IOReturn v402;
  NSObject *v403;
  __int128 v404;
  tm *v405;
  NSObject *v406;
  __int128 v407;
  tm *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  const char *v415;
  NSObject *v416;
  __int128 v417;
  tm *v418;
  const __CFArray *v419;
  const __CFDictionary *v420;
  const __CFData *v421;
  const __CFString *v422;
  const __CFData *v423;
  CFTypeID v424;
  BOOL v425;
  const __CFString *v426;
  const char *v427;
  NSObject *v428;
  __int128 v429;
  tm *v430;
  CFStringRef v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  const __CFDictionary *v438;
  const void *v439;
  int v440;
  NSObject *v441;
  __int128 v442;
  tm *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  const void *v450;
  NSObject *v451;
  __int128 v452;
  tm *v453;
  __int128 v454;
  tm *v455;
  const __CFString *v456;
  const char *v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  char v465;
  NSObject *v466;
  __int128 v467;
  tm *v468;
  const __CFArray *v469;
  const __CFDictionary *v470;
  const __CFData *v471;
  const __CFString *v472;
  const __CFData *v473;
  CFTypeID v474;
  const __CFString *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  const char *v482;
  const __CFString *v483;
  const char *v484;
  const char *v485;
  int v486;
  NSObject *v487;
  __int128 v488;
  tm *v489;
  const __CFArray *v490;
  const __CFDictionary *v491;
  const __CFData *v492;
  const __CFString *v493;
  const __CFData *v494;
  const char *v495;
  CFTypeID v496;
  const __CFString *v497;
  const __CFString *v498;
  const char *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  uint64_t v506;
  const char *v507;
  NSObject *v508;
  __int128 v509;
  tm *v510;
  const char *v511;
  CFMutableStringRef v512;
  const __CFString *v513;
  NSObject *v514;
  __int128 v515;
  tm *v516;
  const char *v517;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  NSObject *v525;
  __int128 v526;
  tm *v527;
  const char *v528;
  const __CFString *v529;
  const char *v530;
  const char *v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  NSObject *v538;
  __int128 v539;
  tm *v540;
  __int128 v541;
  const __CFArray *v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  kern_return_t v549;
  NSObject *v550;
  __int128 v551;
  tm *v552;
  const __CFArray *v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  NSObject *v560;
  __int128 v561;
  tm *v562;
  NSObject *v563;
  __int128 v564;
  tm *v565;
  uint64_t v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  NSObject *v572;
  __int128 v573;
  tm *v574;
  IOPMAssertionID v575;
  uint64_t v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  IOReturn v582;
  NSObject *v583;
  __int128 v584;
  tm *v585;
  const void *v586;
  const void *v587;
  const void *v588;
  const void *v589;
  const void *v590;
  const void *v591;
  const void *v592;
  const void *v593;
  const void *v594;
  io_object_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  uint64_t v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  kern_return_t v632;
  NSObject *v633;
  __int128 v634;
  tm *v635;
  __int128 v636;
  tm *v637;
  uint64_t v638;
  uint64_t v639;
  uint64_t v640;
  uint64_t v641;
  uint64_t v642;
  uint64_t v643;
  NSObject *v644;
  __int128 v645;
  tm *v646;
  NSObject *v647;
  __int128 v648;
  tm *v649;
  NSObject *v650;
  __int128 v651;
  tm *v652;
  NSObject *v653;
  __int128 v654;
  tm *v655;
  NSObject *v656;
  __int128 v657;
  tm *v658;
  NSObject *v659;
  __int128 v660;
  tm *v661;
  NSObject *v662;
  __int128 v663;
  tm *v664;
  char outputStruct;
  char outputStructa;
  char outputStructb;
  char outputStructc;
  char outputStructd;
  char outputStructe;
  io_registry_entry_t entry;
  const __CFURL *v672;
  const __CFString *v673;
  const __CFString *v674;
  uint64_t v675;
  uint64_t v676;
  _BOOL4 v677;
  const __CFString *v678;
  __CFReadStream *stream;
  io_registry_entry_t streama;
  const __CFAllocator *allocator;
  const char *allocatora;
  uint64_t v683;
  int v684;
  const char *v685;
  time_t valuePtr;
  time_t v687;
  CFIndex length;
  size_t size[2];
  __int128 v690;
  _BYTE v691[32];
  __int128 v692;
  __int128 v693;
  __int128 v694;
  __int128 v695;
  __int128 outputStructCnt;
  __int128 v697;
  __int128 v698;
  __int128 v699;
  __int128 v700;
  __int128 v701;
  __int128 v702;
  __int128 v703;
  __int128 v704;
  __int128 v705;
  __int128 v706;
  __int128 v707;
  __int128 v708;
  __int128 v709;
  __int128 v710;
  __int128 v711;
  char cStr[32];
  __int128 v713;
  __int128 v714;
  __int128 v715;
  __int128 v716;
  __int128 v717;
  __int128 v718;
  __int128 v719;
  __int128 v720;
  __int128 v721;
  __int128 v722;
  __int128 v723;
  __int128 v724;
  __int128 v725;
  __int128 v726;

  v1 = a1;
  *(_QWORD *)(a1 + 12) = 0x100000001;
  if (byte_100010010)
    v2 = CFSTR("/System/Library/DriverExtensions/com.apple.DriverKit-AppleBCMWLAN.dext/Firmware/");
  else
    v2 = CFSTR("/usr/share/firmware/wifi/");
  v678 = v2;
  if (qword_1000100A8)
  {
    v3 = kCFAllocatorDefault;
    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255, (CFStringRef)qword_1000100A8);
    *(_QWORD *)(v1 + 112) = MutableCopy;
    if (!MutableCopy)
      goto LABEL_15;
    v5 = *(_DWORD *)(v1 + 8);
    v725 = 0u;
    v726 = 0u;
    v723 = 0u;
    v724 = 0u;
    v721 = 0u;
    v722 = 0u;
    v719 = 0u;
    v720 = 0u;
    v717 = 0u;
    v718 = 0u;
    v715 = 0u;
    v716 = 0u;
    v713 = 0u;
    v714 = 0u;
    memset(cStr, 0, sizeof(cStr));
    size[0] = 0;
    if (!v5)
      goto LABEL_15;
    if (!CFStringGetCStringPtr(MutableCopy, 0))
      goto LABEL_15;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 112), 0);
    __strlcpy_chk(cStr, CStringPtr, 255, 256);
    if (!sub_100007E98(cStr, (off_t *)size))
      goto LABEL_15;
    if (size[0] - 0x2000 <= 0xFFFFFFFFFFFFE080)
    {
      if (qword_100010218)
        v227 = qword_100010218;
      else
        v227 = &_os_log_default;
      sub_1000082F8(v227, "msf cal file is too big or too small\n", v7, v8, v9, v10, v11, v12, outputStruct);
      if (dword_100010220)
      {
        *(_QWORD *)&v228 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v228 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v228;
        v703 = v228;
        v700 = v228;
        v701 = v228;
        v698 = v228;
        v699 = v228;
        outputStructCnt = v228;
        v697 = v228;
        length = 0xAAAAAAAAAAAAAAAALL;
        time(&length);
        v229 = localtime(&length);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v229);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "msf cal file is too big or too small\n");
      }
    }
    else
    {
      v13 = (UInt8 *)malloc_type_malloc(size[0], 0x66D2A491uLL);
      if (v13)
      {
        v20 = v13;
        length = size[0];
        if ((sub_1000085B4(cStr, v13, &length) & 1) != 0)
        {
          v27 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v20, length, kCFAllocatorNull);
          if (v27)
          {
            v34 = v27;
            IORegistryEntrySetCFProperty(v5, CFSTR("WiFiMSFCal"), v27);
            free(v20);
            CFRelease(v34);
            goto LABEL_15;
          }
          if (qword_100010218)
            v236 = qword_100010218;
          else
            v236 = &_os_log_default;
          sub_1000082F8(v236, "failed to create MSF Data Ref\n", v28, v29, v30, v31, v32, v33, outputStruct);
          if (dword_100010220)
          {
            *(_QWORD *)&v237 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v237 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v702 = v237;
            v703 = v237;
            v700 = v237;
            v701 = v237;
            v698 = v237;
            v699 = v237;
            outputStructCnt = v237;
            v697 = v237;
            v687 = 0xAAAAAAAAAAAAAAAALL;
            time(&v687);
            v238 = localtime(&v687);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v238);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "failed to create MSF Data Ref\n");
          }
        }
        else
        {
          if (qword_100010218)
            v233 = qword_100010218;
          else
            v233 = &_os_log_default;
          sub_1000082F8(v233, "copy MSF CAL failed\n", v21, v22, v23, v24, v25, v26, outputStruct);
          if (dword_100010220)
          {
            *(_QWORD *)&v234 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v234 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v702 = v234;
            v703 = v234;
            v700 = v234;
            v701 = v234;
            v698 = v234;
            v699 = v234;
            outputStructCnt = v234;
            v697 = v234;
            v687 = 0xAAAAAAAAAAAAAAAALL;
            time(&v687);
            v235 = localtime(&v687);
            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v235);
            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
            dprintf(dword_100010220, "copy MSF CAL failed\n");
          }
        }
        free(v20);
      }
      else
      {
        if (qword_100010218)
          v230 = qword_100010218;
        else
          v230 = &_os_log_default;
        sub_1000082F8(v230, "failed to alloc memory for msf cal\n", v14, v15, v16, v17, v18, v19, outputStruct);
        if (dword_100010220)
        {
          *(_QWORD *)&v231 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v231 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v702 = v231;
          v703 = v231;
          v700 = v231;
          v701 = v231;
          v698 = v231;
          v699 = v231;
          outputStructCnt = v231;
          v697 = v231;
          length = 0xAAAAAAAAAAAAAAAALL;
          time(&length);
          v232 = localtime(&length);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v232);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "failed to alloc memory for msf cal\n");
        }
      }
    }
  }
  else
  {
    *(_QWORD *)(a1 + 112) = 0;
    v3 = kCFAllocatorDefault;
  }
LABEL_15:
  if (qword_1000100A0)
    v35 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)qword_1000100A0);
  else
    v35 = 0;
  *(_QWORD *)(v1 + 104) = v35;
  CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(*(_DWORD *)(v1 + 8), CFSTR("FirmwareLoaded"), v3, 0);
  if (CFProperty)
  {
    v37 = CFProperty;
    v38 = CFBooleanGetValue(CFProperty) != 0;
    CFRelease(v37);
  }
  else
  {
    v38 = 0;
  }
  v39 = *(_DWORD *)(v1 + 8);
  length = 0;
  size[0] = 0;
  *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v725 = v40;
  v726 = v40;
  v723 = v40;
  v724 = v40;
  v721 = v40;
  v722 = v40;
  v719 = v40;
  v720 = v40;
  v717 = v40;
  v718 = v40;
  v715 = v40;
  v716 = v40;
  v713 = v40;
  v714 = v40;
  *(_OWORD *)cStr = v40;
  *(_OWORD *)&cStr[16] = v40;
  v41 = *(const __CFString **)(v1 + 104);
  allocator = v3;
  if (v41)
  {
    v42 = CFStringGetCStringPtr(v41, 0);
    __strlcpy_chk(cStr, v42, 255, 256);
    v43 = 0;
  }
  else
  {
    v44 = (const __CFString *)IORegistryEntryCreateCFProperty(v39, CFSTR("PlatformConfigFileName"), v3, 0);
    if (!v44)
    {
      if (qword_100010218)
        v239 = qword_100010218;
      else
        v239 = &_os_log_default;
      sub_1000082F8(v239, "no PlatformConfigFileName in ioreg\n", v45, v46, v47, v48, v49, v50, outputStruct);
      if (dword_100010220)
      {
        *(_QWORD *)&v240 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v240 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v240;
        v703 = v240;
        v700 = v240;
        v701 = v240;
        v698 = v240;
        v699 = v240;
        outputStructCnt = v240;
        v697 = v240;
        v687 = 0xAAAAAAAAAAAAAAAALL;
        time(&v687);
        v241 = localtime(&v687);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v241);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        v43 = 0;
        stream = 0;
        v94 = 0;
        v102 = 0;
        dprintf(dword_100010220, "no PlatformConfigFileName in ioreg\n");
        goto LABEL_173;
      }
      v43 = 0;
      goto LABEL_177;
    }
    v43 = v44;
    TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v43))
    {
      if (qword_100010218)
        v242 = qword_100010218;
      else
        v242 = &_os_log_default;
      sub_1000082F8(v242, "PlatformConfigFileName is not CFstring!\n", v52, v53, v54, v55, v56, v57, outputStruct);
      if (dword_100010220)
      {
        *(_QWORD *)&v243 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v243 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v243;
        v703 = v243;
        v700 = v243;
        v701 = v243;
        v698 = v243;
        v699 = v243;
        outputStructCnt = v243;
        v697 = v243;
        v687 = 0xAAAAAAAAAAAAAAAALL;
        time(&v687);
        v244 = localtime(&v687);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v244);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        stream = 0;
        v94 = 0;
        v102 = 0;
        dprintf(dword_100010220, "PlatformConfigFileName is not CFstring!\n");
        goto LABEL_173;
      }
      goto LABEL_177;
    }
    if (byte_100010010)
    {
      __strlcpy_chk(cStr, "/System/Library/DriverExtensions/com.apple.DriverKit-AppleBCMWLAN.dext/PlatformConfig/", 255, 256);
      __strlcat_chk(cStr, &xmmword_100010011, 255, 256);
      __strlcat_chk(cStr, "/", 255, 256);
      if (qword_100010218)
        v64 = qword_100010218;
      else
        v64 = &_os_log_default;
      sub_1000082F8(v64, "platformType:'%s' platformConfig path:'%s'\n", v58, v59, v60, v61, v62, v63, (char)&xmmword_100010011);
      if (dword_100010220)
      {
        *(_QWORD *)&v65 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v65 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v65;
        v703 = v65;
        v700 = v65;
        v701 = v65;
        v698 = v65;
        v699 = v65;
        outputStructCnt = v65;
        v697 = v65;
        v687 = 0xAAAAAAAAAAAAAAAALL;
        time(&v687);
        v66 = localtime(&v687);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v66);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "platformType:'%s' platformConfig path:'%s'\n", (const char *)&xmmword_100010011, cStr);
      }
    }
    else
    {
      __strlcpy_chk(cStr, "/usr/share/firmware/wifi/", 255, 256);
    }
    v67 = CFStringGetCStringPtr(v43, 0);
    __strlcat_chk(cStr, v67, 255, 256);
  }
  v74 = sub_100007E98(cStr, &length);
  if (qword_100010218)
    v75 = qword_100010218;
  else
    v75 = &_os_log_default;
  sub_1000082F8(v75, "config full name %s size %zu\n", v68, v69, v70, v71, v72, v73, (char)cStr);
  if (dword_100010220)
  {
    *(_QWORD *)&v82 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v82 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v702 = v82;
    v703 = v82;
    v700 = v82;
    v701 = v82;
    v698 = v82;
    v699 = v82;
    outputStructCnt = v82;
    v697 = v82;
    v687 = 0xAAAAAAAAAAAAAAAALL;
    time(&v687);
    v83 = localtime(&v687);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v83);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s size %zu\n", cStr, length);
  }
  if (!v74)
  {
LABEL_177:
    v245 = 0;
    v94 = 0;
    goto LABEL_178;
  }
  if (qword_100010218)
    v84 = qword_100010218;
  else
    v84 = &_os_log_default;
  if ((unint64_t)(length - 0x2000) <= 0xFFFFFFFFFFFFE080)
  {
    sub_1000082F8(v84, "Platform config file is too big or too small\n", v76, v77, v78, v79, v80, v81, outputStructa);
    if (dword_100010220)
    {
      *(_QWORD *)&v202 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v202 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v202;
      v703 = v202;
      v700 = v202;
      v701 = v202;
      v698 = v202;
      v699 = v202;
      outputStructCnt = v202;
      v697 = v202;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v203 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v203);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      v94 = 0;
      v102 = 0;
      dprintf(dword_100010220, "Platform config file is too big or too small\n");
LABEL_173:
      v245 = stream;
      goto LABEL_179;
    }
    goto LABEL_177;
  }
  sub_1000082F8(v84, "config full name %s\n", v76, v77, v78, v79, v80, v81, (char)cStr);
  if (dword_100010220)
  {
    *(_QWORD *)&v85 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v85 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v702 = v85;
    v703 = v85;
    v700 = v85;
    v701 = v85;
    v698 = v85;
    v699 = v85;
    outputStructCnt = v85;
    v697 = v85;
    v687 = 0xAAAAAAAAAAAAAAAALL;
    time(&v687);
    v86 = localtime(&v687);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v86);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "config full name %s\n", cStr);
  }
  v87 = CFStringCreateWithCString(0, cStr, 0);
  if (!v87)
  {
    if (qword_100010218)
      v204 = qword_100010218;
    else
      v204 = &_os_log_default;
    sub_1000082F8(v204, "fail to create CFStringRef for file w path\n", v88, v89, v90, v91, v92, v93, outputStructb);
    if (dword_100010220)
    {
      *(_QWORD *)&v205 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v205 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v205;
      v703 = v205;
      v700 = v205;
      v701 = v205;
      v698 = v205;
      v699 = v205;
      outputStructCnt = v205;
      v697 = v205;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v206 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v206);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      v94 = 0;
      v102 = 0;
      dprintf(dword_100010220, "fail to create CFStringRef for file w path\n");
      goto LABEL_173;
    }
    goto LABEL_177;
  }
  v94 = v87;
  v95 = CFURLCreateWithFileSystemPath(v3, v87, kCFURLPOSIXPathStyle, 0);
  if (!v95)
  {
    if (qword_100010218)
      v207 = qword_100010218;
    else
      v207 = &_os_log_default;
    sub_1000082F8(v207, "fail to create fileURL\n", v96, v97, v98, v99, v100, v101, outputStructb);
    if (dword_100010220)
    {
      *(_QWORD *)&v208 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v208 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v208;
      v703 = v208;
      v700 = v208;
      v701 = v208;
      v698 = v208;
      v699 = v208;
      outputStructCnt = v208;
      v697 = v208;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v209 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v209);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      v102 = 0;
      dprintf(dword_100010220, "fail to create fileURL\n");
      goto LABEL_173;
    }
    v245 = 0;
LABEL_178:
    v102 = 0;
    goto LABEL_179;
  }
  v102 = v95;
  v103 = CFReadStreamCreateWithFile(v3, v95);
  if (!v103)
  {
    if (qword_100010218)
      v210 = qword_100010218;
    else
      v210 = &_os_log_default;
    sub_1000082F8(v210, "fail to create fileStream\n", v104, v105, v106, v107, v108, v109, outputStructb);
    if (dword_100010220)
    {
      *(_QWORD *)&v211 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v211 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v211;
      v703 = v211;
      v700 = v211;
      v701 = v211;
      v698 = v211;
      v699 = v211;
      outputStructCnt = v211;
      v697 = v211;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v212 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v212);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      stream = 0;
      dprintf(dword_100010220, "fail to create fileStream\n");
      goto LABEL_173;
    }
    v245 = 0;
LABEL_179:
    LOBYTE(v152) = 0;
    v125 = 0;
    v151 = 0;
    stream = v245;
    v198 = v245 != 0;
    if (!v43)
      goto LABEL_181;
    goto LABEL_180;
  }
  v110 = v103;
  v111 = CFReadStreamOpen(v103);
  stream = v110;
  if (!v111)
  {
    if (qword_100010218)
      v213 = qword_100010218;
    else
      v213 = &_os_log_default;
    sub_1000082F8(v213, "fail to open fileStream\n", v112, v113, v114, v115, v116, v117, outputStructb);
    if (dword_100010220)
    {
      *(_QWORD *)&v214 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v214 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v214;
      v703 = v214;
      v700 = v214;
      v701 = v214;
      v698 = v214;
      v699 = v214;
      outputStructCnt = v214;
      v697 = v214;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v215 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v215);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to open fileStream\n");
    }
    goto LABEL_173;
  }
  v118 = v111;
  entry = v39;
  v125 = (const __CFArray **)CFPropertyListCreateWithStream(v3, v110, 0, 2uLL, 0, (CFErrorRef *)size);
  if (!v125)
  {
    CFReadStreamClose(v110);
LABEL_132:
    LOBYTE(v152) = 0;
    v151 = 0;
    goto LABEL_91;
  }
  if (qword_100010218)
    v126 = qword_100010218;
  else
    v126 = &_os_log_default;
  sub_1000082F8(v126, "Setting property list  errorCode:%d, status:%u\n", v119, v120, v121, v122, v123, v124, 0);
  if (dword_100010220)
  {
    *(_QWORD *)&v133 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v133 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v702 = v133;
    v703 = v133;
    v700 = v133;
    v701 = v133;
    v698 = v133;
    v699 = v133;
    outputStructCnt = v133;
    v697 = v133;
    v687 = 0xAAAAAAAAAAAAAAAALL;
    time(&v687);
    v134 = localtime(&v687);
    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v134);
    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
    dprintf(dword_100010220, "Setting property list  errorCode:%d, status:%u\n", 0, v118);
  }
  if (size[0])
  {
    if (qword_100010218)
      v216 = qword_100010218;
    else
      v216 = &_os_log_default;
    sub_1000082F8(v216, "fail to create property list\n", v127, v128, v129, v130, v131, v132, outputStructc);
    if (dword_100010220)
    {
      *(_QWORD *)&v217 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v217 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v217;
      v703 = v217;
      v700 = v217;
      v701 = v217;
      v698 = v217;
      v699 = v217;
      outputStructCnt = v217;
      v697 = v217;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v218 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v218);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to create property list\n");
    }
    goto LABEL_132;
  }
  v135 = CFDictionaryGetTypeID();
  if (v135 != CFGetTypeID(v125))
  {
    if (qword_100010218)
      v219 = qword_100010218;
    else
      v219 = &_os_log_default;
    sub_1000082F8(v219, "Propery list is not CFDictionary!\n", v136, v137, v138, v139, v140, v141, outputStructc);
    if (dword_100010220)
    {
      *(_QWORD *)&v220 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v220 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v220;
      v703 = v220;
      v700 = v220;
      v701 = v220;
      v698 = v220;
      v699 = v220;
      outputStructCnt = v220;
      v697 = v220;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v221 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v221);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }
    goto LABEL_132;
  }
  Count = CFDictionaryGetCount((CFDictionaryRef)v125);
  v143 = Count;
  if (Count != (int)Count)
    goto LABEL_627;
  v674 = v43;
  if (Count << 32 < 0)
  {
LABEL_628:
    __break(0x550Cu);
    return;
  }
  v144 = (const void **)malloc_type_malloc((8 * Count) & 0x7FFFFFFFFLL, 0x6004044C4A2DFuLL);
  if (v144)
  {
    v151 = v144;
    v672 = v102;
    v673 = v94;
    v677 = v38;
    v675 = v1;
    CFDictionaryGetKeysAndValues((CFDictionaryRef)v125, v144, 0);
    v152 = 0;
    v153 = 0;
    v683 = v143;
    v154 = ~(unint64_t)v151;
    while (v153 < CFDictionaryGetCount((CFDictionaryRef)v125))
    {
      if (v154 < 8 * v153)
      {
        __break(0x5513u);
LABEL_600:
        __break(1u);
        goto LABEL_601;
      }
      if (v153 == v683)
        goto LABEL_600;
      v161 = v152;
      v162 = v125;
      v163 = v151;
      v164 = CFStringGetCStringPtr((CFStringRef)v151[v153], 0);
      v165 = 0;
      v166 = qword_100010218;
      do
      {
        if (!strcmp(v164, off_10000C458[v165]))
          break;
        ++v165;
      }
      while (v165 != 50);
      if (v166)
        v173 = v166;
      else
        v173 = &_os_log_default;
      sub_1000082F8(v173, "%5ld: %s allow: %d\n", v167, v168, v169, v170, v171, v172, v153);
      if (dword_100010220)
      {
        *(_QWORD *)&v174 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v174 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v174;
        v703 = v174;
        v700 = v174;
        v701 = v174;
        v698 = v174;
        v699 = v174;
        outputStructCnt = v174;
        v697 = v174;
        v687 = 0xAAAAAAAAAAAAAAAALL;
        time(&v687);
        v175 = localtime(&v687);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v175);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        v176 = 0;
        v177 = dword_100010220;
        v178 = 1;
        do
        {
          if (!strcmp(v164, off_10000C458[v176]))
            break;
          v178 = v176++ < 0x31;
        }
        while (v176 != 50);
        dprintf(v177, "%5ld: %s allow: %d\n", v153, v164, v178);
      }
      v179 = 0;
      v180 = 1;
      do
      {
        if (!strcmp(v164, off_10000C458[v179]))
          break;
        v180 = v179++ < 0x31;
      }
      while (v179 != 50);
      v125 = v162;
      if (!v180)
      {
        if (qword_100010218)
          v199 = qword_100010218;
        else
          v199 = &_os_log_default;
        sub_1000082F8(v199, "key not in allowList\n", v181, v182, v183, v184, v185, v186, outputStructc);
        LOBYTE(v152) = v161;
        v151 = v163;
        if (dword_100010220)
        {
          *(_QWORD *)&v200 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v200 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v702 = v200;
          v703 = v200;
          v700 = v200;
          v701 = v200;
          v698 = v200;
          v699 = v200;
          outputStructCnt = v200;
          v697 = v200;
          v687 = 0xAAAAAAAAAAAAAAAALL;
          time(&v687);
          v201 = localtime(&v687);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v201);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "key not in allowList\n");
        }
        v43 = v674;
        v1 = v675;
        v38 = v677;
LABEL_90:
        v102 = v672;
        v94 = v673;
        goto LABEL_91;
      }
      if (!strncmp(v164, "wlan.is.fdr.cal", 0x10uLL))
        v152 = 1;
      else
        v152 = v161;
      ++v153;
      v151 = v163;
    }
    v187 = CFDictionaryGetTypeID();
    v194 = CFGetTypeID(v125);
    if (qword_100010218)
      v195 = qword_100010218;
    else
      v195 = &_os_log_default;
    v43 = v674;
    if (v187 == v194)
    {
      sub_1000082F8(v195, "%s isFdrCal %d\n", v188, v189, v190, v191, v192, v193, (char)"writePlatformConfig");
      v1 = v675;
      v38 = v677;
      if (dword_100010220)
      {
        *(_QWORD *)&v196 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v196 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v702 = v196;
        v703 = v196;
        v700 = v196;
        v701 = v196;
        v698 = v196;
        v699 = v196;
        outputStructCnt = v196;
        v697 = v196;
        v687 = 0xAAAAAAAAAAAAAAAALL;
        time(&v687);
        v197 = localtime(&v687);
        strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v197);
        dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
        dprintf(dword_100010220, "%s isFdrCal %d\n", "writePlatformConfig", v152);
      }
      IORegistryEntrySetCFProperty(entry, CFSTR("PlatformConfig"), v125);
      goto LABEL_90;
    }
    sub_1000082F8(v195, "Propery list is not CFDictionary!\n", v188, v189, v190, v191, v192, v193, outputStructc);
    v1 = v675;
    v38 = v677;
    v102 = v672;
    v94 = v673;
    if (dword_100010220)
    {
      *(_QWORD *)&v225 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v225 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v225;
      v703 = v225;
      v700 = v225;
      v701 = v225;
      v698 = v225;
      v699 = v225;
      outputStructCnt = v225;
      v697 = v225;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v226 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v226);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "Propery list is not CFDictionary!\n");
    }
  }
  else
  {
    if (qword_100010218)
      v222 = qword_100010218;
    else
      v222 = &_os_log_default;
    sub_1000082F8(v222, "fail to allocate memory for keys\n", v145, v146, v147, v148, v149, v150, outputStructc);
    if (dword_100010220)
    {
      *(_QWORD *)&v223 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v223 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v702 = v223;
      v703 = v223;
      v700 = v223;
      v701 = v223;
      v698 = v223;
      v699 = v223;
      outputStructCnt = v223;
      v697 = v223;
      v687 = 0xAAAAAAAAAAAAAAAALL;
      time(&v687);
      v224 = localtime(&v687);
      strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v224);
      dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
      dprintf(dword_100010220, "fail to allocate memory for keys\n");
    }
    LOBYTE(v152) = 0;
    v151 = 0;
  }
LABEL_91:
  CFReadStreamClose(stream);
  v198 = 1;
  if (v43)
LABEL_180:
    CFRelease(v43);
LABEL_181:
  if (v94)
    CFRelease(v94);
  if (v102)
    CFRelease(v102);
  if (v198)
    CFRelease(stream);
  if (size[0])
    CFRelease((CFTypeRef)size[0]);
  size[0] = 0;
  if (v125)
    CFRelease(v125);
  if (v151)
    free(v151);
  v246 = *(_DWORD *)(v1 + 8);
  if (!qword_100010210)
    pthread_once(&stru_100010000, (void (*)(void))sub_100007C74);
  Instance = _CFRuntimeCreateInstance(0);
  v254 = &stru_100010000;
  if (!Instance)
    goto LABEL_588;
  v255 = Instance;
  *(_QWORD *)(Instance + 20) = 0;
  v256 = (mach_port_t *)(Instance + 20);
  *(_DWORD *)(Instance + 16) = v246;
  if (IOServiceOpen(v246, mach_task_self_, 0x57694669u, (io_connect_t *)(Instance + 20))
    || IOConnectCallScalarMethod(*v256, 0, 0, 0, 0, 0))
  {
    CFRelease((CFTypeRef)v255);
LABEL_588:
    *(_QWORD *)(v1 + 24) = 0;
    goto LABEL_507;
  }
  *(_BYTE *)(v255 + 24) = 1;
  *(_QWORD *)(v1 + 24) = v255;
  v257 = IORegistryEntryCreateCFProperty(*(_DWORD *)(v255 + 16), CFSTR("RequestedFiles"), v3, 0);
  *(_QWORD *)(v1 + 32) = v257;
  if (v257)
  {
    *(_QWORD *)(v1 + 40) = IORegistryEntryCreateCFProperty(*(_DWORD *)(*(_QWORD *)(v1 + 24) + 16), CFSTR("FileExtensions"), v3, 0);
    v258 = (const __CFDictionary *)IORegistryEntryCreateCFProperty(*(_DWORD *)(*(_QWORD *)(v1 + 24) + 16), CFSTR("RequestedFilesOverride"), v3, 0);
    *(_QWORD *)(v1 + 48) = v258;
    v259 = *(const __CFArray **)(v1 + 32);
    if (v258)
    {
      Value = (const __CFData *)CFDictionaryGetValue(v258, CFSTR("wifi-fw-path"));
      v261 = (const __CFString *)*((_QWORD *)&xmmword_100010070 + 1);
      if (!*((_QWORD *)&xmmword_100010070 + 1))
      {
        v262 = Value;
        if (Value)
        {
          v263 = CFGetTypeID(Value);
          if (v263 == CFDataGetTypeID())
          {
            v264 = CFStringCreateFromExternalRepresentation(v3, v262, 0);
            goto LABEL_207;
          }
        }
        goto LABEL_206;
      }
    }
    else
    {
      v261 = (const __CFString *)*((_QWORD *)&xmmword_100010070 + 1);
      if (!*((_QWORD *)&xmmword_100010070 + 1))
      {
LABEL_206:
        v264 = sub_100008DC8(v259, CFSTR("Firmware"), dword_1000100E8, v678);
LABEL_207:
        v271 = v264;
        if (BYTE1(dword_1000100B0))
        {
          v272 = CFStringGetCStringPtr(v264, 0);
          v273 = (const char *)&unk_10000AE49;
          if (v272)
            v273 = v272;
          fprintf(__stdoutp, "Resolved to Firmware file path: \"%s\"\n", v273);
        }
        *(_QWORD *)(v1 + 64) = v271;
        if (!v271)
        {
          IOConnectCallScalarMethod(*(_DWORD *)(*(_QWORD *)(v1 + 24) + 20), 4u, 0, 0, 0, 0);
          goto LABEL_507;
        }
        if (qword_100010218)
          v274 = qword_100010218;
        else
          v274 = &_os_log_default;
        sub_1000082F8(v274, "%s: enter\n", v265, v266, v267, v268, v269, v270, (char)"handleFdr");
        if (dword_100010220)
        {
          *(_QWORD *)&v281 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v281 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v717 = v281;
          v718 = v281;
          v715 = v281;
          v716 = v281;
          v713 = v281;
          v714 = v281;
          *(_OWORD *)cStr = v281;
          *(_OWORD *)&cStr[16] = v281;
          *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&outputStructCnt);
          v282 = localtime((const time_t *)&outputStructCnt);
          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v282);
          dprintf(dword_100010220, "%s ", cStr);
          dprintf(dword_100010220, "%s: enter\n", "handleFdr");
        }
        if (!(_BYTE)v152)
        {
          if (qword_100010218)
            v292 = qword_100010218;
          else
            v292 = &_os_log_default;
          sub_1000082F8(v292, "%s: platform does not need FDR.\n", v275, v276, v277, v278, v279, v280, (char)"handleFdr");
          if (dword_100010220)
          {
            *(_QWORD *)&v293 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v293 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v293;
            v718 = v293;
            v715 = v293;
            v716 = v293;
            v713 = v293;
            v714 = v293;
            *(_OWORD *)cStr = v293;
            *(_OWORD *)&cStr[16] = v293;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v294 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v294);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s: platform does not need FDR.\n");
          }
LABEL_295:
          if (BYTE2(dword_1000100B0))
            v367 = 0;
          else
            v367 = v38;
          if (v367 && !BYTE1(dword_1000100B0))
          {
            if (qword_100010218)
              v368 = qword_100010218;
            else
              v368 = &_os_log_default;
            sub_1000082F8(v368, "Already loaded, bailing use '-r' to force load\n", v284, v285, v286, v287, v288, v289, outputStructd);
            if (dword_100010220)
            {
              *(_QWORD *)&v369 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v369 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v717 = v369;
              v718 = v369;
              v715 = v369;
              v716 = v369;
              v713 = v369;
              v714 = v369;
              *(_OWORD *)cStr = v369;
              *(_OWORD *)&cStr[16] = v369;
              *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v370 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v370);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "Already loaded, bailing use '-r' to force load\n");
            }
            fwrite("Already loaded, bailing, use '-r' to force load\n", 0x30uLL, 1uLL, __stderrp);
LABEL_306:
            *(_DWORD *)(v1 + 12) = 0;
            goto LABEL_507;
          }
          if (byte_1000101F8)
          {
            if ((qword_1000101FC - 1) > 3)
              v371 = CFSTR("PreventUserIdleSystemSleep");
            else
              v371 = off_10000C5E8[(qword_1000101FC - 1)];
            v372 = HIDWORD(qword_1000101FC);
            v373 = (double)SHIDWORD(qword_1000101FC);
            v374 = qword_100010218;
            v375 = CFStringGetCStringPtr(v371, 0);
            CFStringGetCStringPtr(CFSTR("com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware"), 0);
            CFStringGetCStringPtr(CFSTR("wifiFirmwareLoader: IOPMAssertion: Loading firmware"), 0);
            CFStringGetCStringPtr(CFSTR("TimeoutActionTurnOff"), 0);
            v382 = &_os_log_default;
            if (v374)
              v382 = v374;
            sub_1000082F8(v382, "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[%f sec] assertionID[%p] assertionLevel[0x%08x]\n", v376, v377, v378, v379, v380, v381, v375);
            if (dword_100010220)
            {
              *(_QWORD *)&v389 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v389 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v717 = v389;
              v718 = v389;
              v715 = v389;
              v716 = v389;
              v713 = v389;
              v714 = v389;
              *(_OWORD *)cStr = v389;
              *(_OWORD *)&cStr[16] = v389;
              *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v390 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v390);
              dprintf(dword_100010220, "%s ", cStr);
              v391 = dword_100010220;
              v392 = CFStringGetCStringPtr(v371, 0);
              v393 = CFStringGetCStringPtr(CFSTR("com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware"), 0);
              v394 = CFStringGetCStringPtr(CFSTR("wifiFirmwareLoader: IOPMAssertion: Loading firmware"), 0);
              v395 = CFStringGetCStringPtr(CFSTR("TimeoutActionTurnOff"), 0);
              dprintf(v391, "_createIOPMHelperCreateAssertion assertionType[%s] assertionName[%s] details[%s] reason[%s] bundle[%s] timeout[%f sec] assertionID[%p] assertionLevel[0x%08x]\n", v392, v393, v394, (const char *)&unk_10000AE49, (const char *)&unk_10000AE49, v373, v395, 0);
            }
            v3 = allocator;
            if (v372 <= 0)
            {
              v254 = &stru_100010000;
              v402 = -536870911;
            }
            else
            {
              LODWORD(size[0]) = 0;
              v402 = IOPMAssertionCreateWithDescription(v371, CFSTR("com.apple.wifiFirmwareLoader.IOPMAssertion.loading-firmware"), CFSTR("wifiFirmwareLoader: IOPMAssertion: Loading firmware"), 0, 0, v373, CFSTR("TimeoutActionTurnOff"), (IOPMAssertionID *)size);
              if (qword_100010218)
                v403 = qword_100010218;
              else
                v403 = &_os_log_default;
              sub_1000082F8(v403, "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n", v396, v397, v398, v399, v400, v401, v402);
              v254 = &stru_100010000;
              if (dword_100010220)
              {
                *(_QWORD *)&v404 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v404 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v717 = v404;
                v718 = v404;
                v715 = v404;
                v716 = v404;
                v713 = v404;
                v714 = v404;
                *(_OWORD *)cStr = v404;
                *(_OWORD *)&cStr[16] = v404;
                *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&outputStructCnt);
                v405 = localtime((const time_t *)&outputStructCnt);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v405);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "_createIOPMHelperCreateAssertion 'IOPMAssertionCreateWithDescription': return [0x%08x], id[0x%08x]\n", v402, LODWORD(size[0]));
              }
              dword_100010208 = size[0];
            }
            if (qword_100010218)
              v406 = qword_100010218;
            else
              v406 = &_os_log_default;
            sub_1000082F8(v406, "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n", v383, v384, v385, v386, v387, v388, v402);
            if (dword_100010220)
            {
              *(_QWORD *)&v407 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v407 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v717 = v407;
              v718 = v407;
              v715 = v407;
              v716 = v407;
              v713 = v407;
              v714 = v407;
              *(_OWORD *)cStr = v407;
              *(_OWORD *)&cStr[16] = v407;
              *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&outputStructCnt);
              v408 = localtime((const time_t *)&outputStructCnt);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v408);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: _createIOPMHelperCreateAssertion return[0x%08x], id[0x%08x]\n", v402, dword_100010208);
            }
          }
          v415 = CFStringGetCStringPtr(*(CFStringRef *)(v1 + 64), 0);
          if (qword_100010218)
            v416 = qword_100010218;
          else
            v416 = &_os_log_default;
          sub_1000082F8(v416, "full path firmwareName is %s\n", v409, v410, v411, v412, v413, v414, (char)v415);
          if (dword_100010220)
          {
            *(_QWORD *)&v417 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v417 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v417;
            v718 = v417;
            v715 = v417;
            v716 = v417;
            v713 = v417;
            v714 = v417;
            *(_OWORD *)cStr = v417;
            *(_OWORD *)&cStr[16] = v417;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v418 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v418);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "full path firmwareName is %s\n", v415);
          }
          if ((sub_100007E98(v415, &qword_1000100B8) & 1) == 0)
            goto LABEL_383;
          if (!sub_100008F3C(*(_QWORD *)(v1 + 32), CFSTR("Signature")))
          {
            v427 = 0;
            goto LABEL_375;
          }
          v419 = *(const __CFArray **)(v1 + 32);
          v420 = *(const __CFDictionary **)(v1 + 48);
          if (v420)
          {
            v421 = (const __CFData *)CFDictionaryGetValue(v420, CFSTR("wifi-signature-path"));
            v422 = (const __CFString *)qword_100010080;
            if (!qword_100010080)
            {
              v423 = v421;
              if (!v421)
                goto LABEL_365;
              v424 = CFGetTypeID(v421);
              v425 = v424 == CFDataGetTypeID();
              v3 = allocator;
              if (!v425)
                goto LABEL_365;
              v426 = CFStringCreateFromExternalRepresentation(allocator, v423, 0);
LABEL_366:
              v456 = v426;
              if (!v426)
              {
                *(_QWORD *)(v1 + 72) = 0;
                goto LABEL_383;
              }
              v457 = CFStringGetCStringPtr(v426, 0);
              v458 = (const char *)&unk_10000AE49;
              if (v457)
                v458 = v457;
              fprintf(__stdoutp, "Resolved to signature file path: \"%s\"\n", v458);
              *(_QWORD *)(v1 + 72) = v456;
              v427 = CFStringGetCStringPtr(v456, 0);
              v465 = sub_100007E98(v427, &qword_1000100C0);
              if (qword_100010218)
                v466 = qword_100010218;
              else
                v466 = &_os_log_default;
              sub_1000082F8(v466, "full path signatureName is %s (%zu bytes)\n", v459, v460, v461, v462, v463, v464, (char)v427);
              if (dword_100010220)
              {
                *(_QWORD *)&v467 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v467 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v717 = v467;
                v718 = v467;
                v715 = v467;
                v716 = v467;
                v713 = v467;
                v714 = v467;
                *(_OWORD *)cStr = v467;
                *(_OWORD *)&cStr[16] = v467;
                *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&outputStructCnt);
                v468 = localtime((const time_t *)&outputStructCnt);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v468);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "full path signatureName is %s (%zu bytes)\n", v427, qword_1000100C0);
              }
              if ((v465 & 1) == 0)
                goto LABEL_383;
LABEL_375:
              if (!sub_100008F3C(*(_QWORD *)(v1 + 32), CFSTR("Platcfg")))
              {
                v482 = 0;
                goto LABEL_400;
              }
              v469 = *(const __CFArray **)(v1 + 32);
              v470 = *(const __CFDictionary **)(v1 + 48);
              if (v470)
              {
                v471 = (const __CFData *)CFDictionaryGetValue(v470, CFSTR("wifi-platcfg-path"));
                v472 = (const __CFString *)*((_QWORD *)&xmmword_100010090 + 1);
                if (!*((_QWORD *)&xmmword_100010090 + 1))
                {
                  v473 = v471;
                  if (v471)
                  {
                    v474 = CFGetTypeID(v471);
                    if (v474 == CFDataGetTypeID())
                    {
                      v475 = CFStringCreateFromExternalRepresentation(v3, v473, 0);
                      goto LABEL_387;
                    }
                  }
                  goto LABEL_386;
                }
              }
              else
              {
                v472 = (const __CFString *)*((_QWORD *)&xmmword_100010090 + 1);
                if (!*((_QWORD *)&xmmword_100010090 + 1))
                {
LABEL_386:
                  v475 = sub_100008DC8(v469, CFSTR("Platcfg"), &qword_1000100E0, v678);
LABEL_387:
                  v483 = v475;
                  if (v475)
                  {
                    v484 = CFStringGetCStringPtr(v475, 0);
                    v485 = (const char *)&unk_10000AE49;
                    if (v484)
                      v485 = v484;
                    fprintf(__stdoutp, "Resolved to platcfg file path: \"%s\"\n", v485);
                    *(_QWORD *)(v1 + 96) = v483;
                    v482 = CFStringGetCStringPtr(v483, 0);
                    v486 = sub_100007E98(v482, &qword_1000100E0);
                    if (*(_QWORD *)(v1 + 96) && v486)
                      goto LABEL_395;
                  }
                  else
                  {
                    v482 = 0;
                    *(_QWORD *)(v1 + 96) = 0;
                  }
                  qword_1000100E0 = 0;
LABEL_395:
                  if (qword_100010218)
                    v487 = qword_100010218;
                  else
                    v487 = &_os_log_default;
                  sub_1000082F8(v487, "full path platcfgName is %s (%zu bytes)\n", v476, v477, v478, v479, v480, v481, (char)v482);
                  if (dword_100010220)
                  {
                    *(_QWORD *)&v488 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v488 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v717 = v488;
                    v718 = v488;
                    v715 = v488;
                    v716 = v488;
                    v713 = v488;
                    v714 = v488;
                    *(_OWORD *)cStr = v488;
                    *(_OWORD *)&cStr[16] = v488;
                    *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                    time((time_t *)&outputStructCnt);
                    v489 = localtime((const time_t *)&outputStructCnt);
                    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v489);
                    dprintf(dword_100010220, "%s ", cStr);
                    dprintf(dword_100010220, "full path platcfgName is %s (%zu bytes)\n", v482, qword_1000100E0);
                  }
LABEL_400:
                  v685 = v482;
                  v490 = *(const __CFArray **)(v1 + 32);
                  v491 = *(const __CFDictionary **)(v1 + 48);
                  if (v491)
                  {
                    v492 = (const __CFData *)CFDictionaryGetValue(v491, CFSTR("wifi-nvram-path"));
                    v493 = (const __CFString *)xmmword_100010070;
                    if (!(_QWORD)xmmword_100010070)
                    {
                      v494 = v492;
                      if (v492)
                      {
                        v495 = v427;
                        v496 = CFGetTypeID(v492);
                        v425 = v496 == CFDataGetTypeID();
                        v427 = v495;
                        if (v425)
                        {
                          v497 = CFStringCreateFromExternalRepresentation(v3, v494, 0);
                          goto LABEL_409;
                        }
                      }
                      goto LABEL_408;
                    }
                  }
                  else
                  {
                    v493 = (const __CFString *)xmmword_100010070;
                    if (!(_QWORD)xmmword_100010070)
                    {
LABEL_408:
                      v497 = sub_100008DC8(v490, CFSTR("NVRAM"), dword_1000100F0, v678);
LABEL_409:
                      v498 = v497;
                      if (BYTE1(dword_1000100B0))
                      {
                        v499 = CFStringGetCStringPtr(v497, 0);
                        v500 = (const char *)&unk_10000AE49;
                        if (v499)
                          v500 = v499;
                        fprintf(__stdoutp, "Resolved to NVRAM file path: \"%s\"\n", v500);
                      }
                      *(_QWORD *)(v1 + 56) = v498;
                      if (v498)
                      {
                        allocatora = v427;
                        v507 = CFStringGetCStringPtr(v498, 0);
                        if (qword_100010218)
                          v508 = qword_100010218;
                        else
                          v508 = &_os_log_default;
                        sub_1000082F8(v508, "full path NVRAM is %s\n", v501, v502, v503, v504, v505, v506, (char)v507);
                        if (dword_100010220)
                        {
                          *(_QWORD *)&v509 = 0xAAAAAAAAAAAAAAAALL;
                          *((_QWORD *)&v509 + 1) = 0xAAAAAAAAAAAAAAAALL;
                          v717 = v509;
                          v718 = v509;
                          v715 = v509;
                          v716 = v509;
                          v713 = v509;
                          v714 = v509;
                          *(_OWORD *)cStr = v509;
                          *(_OWORD *)&cStr[16] = v509;
                          *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                          time((time_t *)&outputStructCnt);
                          v510 = localtime((const time_t *)&outputStructCnt);
                          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v510);
                          dprintf(dword_100010220, "%s ", cStr);
                          dprintf(dword_100010220, "full path NVRAM is %s\n", v507);
                        }
                        if ((sub_100007E98(v507, &qword_1000100C8) & 1) != 0)
                        {
                          if ((_BYTE)dword_1000100B0 && !HIBYTE(dword_1000100B0))
                          {
                            v125 = (const __CFArray **)v1;
                            v511 = 0;
                            goto LABEL_451;
                          }
                          if (qword_100010088)
                          {
                            v512 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)qword_100010088);
                          }
                          else
                          {
                            if (*(_QWORD *)(v1 + 40))
                            {
                              if (qword_100010218)
                                v514 = qword_100010218;
                              else
                                v514 = &_os_log_default;
                              sub_100008454(v514, "Deprecated feature\n", 0, v249, v250, v251, v252, v253, outputStructe);
                              if (dword_100010220)
                              {
                                *(_QWORD *)&v515 = 0xAAAAAAAAAAAAAAAALL;
                                *((_QWORD *)&v515 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v717 = v515;
                                v718 = v515;
                                v715 = v515;
                                v716 = v515;
                                v713 = v515;
                                v714 = v515;
                                *(_OWORD *)cStr = v515;
                                *(_OWORD *)&cStr[16] = v515;
                                *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                time((time_t *)&outputStructCnt);
                                v516 = localtime((const time_t *)&outputStructCnt);
                                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v516);
                                dprintf(dword_100010220, "%s ", cStr);
                                dprintf(dword_100010220, "Deprecated feature\n");
                              }
                              v513 = 0;
LABEL_433:
                              if (BYTE1(dword_1000100B0))
                              {
                                if (v513)
                                  v517 = CFStringGetCStringPtr(v513, 0);
                                else
                                  v517 = 0;
                                v518 = (const char *)&unk_10000AE49;
                                if (v517)
                                  v518 = v517;
                                fprintf(__stdoutp, "Resolved to Regulatory file path: \"%s\"\n", v518);
                              }
                              v125 = (const __CFArray **)v1;
                              *(_QWORD *)(v1 + 80) = v513;
                              if (v513)
                              {
                                v511 = CFStringGetCStringPtr(v513, 0);
                                if (qword_100010218)
                                  v525 = qword_100010218;
                                else
                                  v525 = &_os_log_default;
                                sub_1000082F8(v525, "full path Regulatory is %s\n", v519, v520, v521, v522, v523, v524, (char)v511);
                                if (dword_100010220)
                                {
                                  *(_QWORD *)&v526 = 0xAAAAAAAAAAAAAAAALL;
                                  *((_QWORD *)&v526 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                  v717 = v526;
                                  v718 = v526;
                                  v715 = v526;
                                  v716 = v526;
                                  v713 = v526;
                                  v714 = v526;
                                  *(_OWORD *)cStr = v526;
                                  *(_OWORD *)&cStr[16] = v526;
                                  *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                  time((time_t *)&outputStructCnt);
                                  v527 = localtime((const time_t *)&outputStructCnt);
                                  strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v527);
                                  dprintf(dword_100010220, "%s ", cStr);
                                  dprintf(dword_100010220, "full path Regulatory is %s\n", v511);
                                }
                                if ((sub_100007E98(v511, &qword_1000100D0) & 1) == 0
                                  || (unint64_t)qword_1000100D0 >= 0x14000
                                  || (unint64_t)qword_1000100D0 <= 0x20)
                                {
                                  goto LABEL_590;
                                }
                              }
                              else
                              {
                                v511 = 0;
                                qword_1000100F8 = -1;
                              }
LABEL_451:
                              if ((_BYTE)dword_1000100B0 && !(_BYTE)word_1000100B4)
                              {
                                v528 = 0;
LABEL_473:
                                if (BYTE1(dword_1000100B0))
                                {
                                  v1 = (uint64_t)v125;
                                  *((_DWORD *)v125 + 3) = 0;
                                  goto LABEL_506;
                                }
                                v717 = 0u;
                                v718 = 0u;
                                v715 = 0u;
                                v716 = 0u;
                                v713 = 0u;
                                v714 = 0u;
                                memset(cStr, 0, sizeof(cStr));
                                if (!byte_100010010)
                                {
                                  v553 = v125[3];
                                  *(_QWORD *)&outputStructCnt = 128;
                                  v549 = IOConnectCallMethod(*((_DWORD *)v553 + 5), 2u, 0, 0, &qword_1000100B8, 0x48uLL, 0, 0, cStr, (size_t *)&outputStructCnt);
                                  if (qword_100010218)
                                    v560 = qword_100010218;
                                  else
                                    v560 = &_os_log_default;
                                  sub_1000082F8(v560, "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld signatureBuffer len %lld platcfgBuffer len %lld\n", v554, v555, v556, v557, v558, v559, v549);
                                  if (dword_100010220)
                                  {
                                    *(_QWORD *)&v561 = 0xAAAAAAAAAAAAAAAALL;
                                    *((_QWORD *)&v561 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                    v702 = v561;
                                    v703 = v561;
                                    v700 = v561;
                                    v701 = v561;
                                    v698 = v561;
                                    v699 = v561;
                                    outputStructCnt = v561;
                                    v697 = v561;
                                    size[0] = 0xAAAAAAAAAAAAAAAALL;
                                    time((time_t *)size);
                                    v562 = localtime((const time_t *)size);
                                    strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v562);
                                    dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                    dprintf(dword_100010220, "WiFiUserClientPrepareMapping return %x firmwarebuffer len %lld nvrambuffer len %lld reg len %lld signatureBuffer len %lld platcfgBuffer len %lld\n", v549, *(_QWORD *)&cStr[8], (_QWORD)v713, *((_QWORD *)&v716 + 1), (_QWORD)v714, (_QWORD)v715);
                                  }
                                  goto LABEL_504;
                                }
                                *(_QWORD *)&v541 = 0xAAAAAAAAAAAAAAAALL;
                                *((_QWORD *)&v541 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v702 = v541;
                                v703 = v541;
                                v700 = v541;
                                v701 = v541;
                                v698 = v541;
                                v699 = v541;
                                outputStructCnt = v541;
                                v697 = v541;
                                v542 = v125[3];
                                size[0] = 128;
                                v549 = IOConnectCallMethod(*((_DWORD *)v542 + 5), 2u, 0, 0, &qword_1000100B8, 0x48uLL, 0, 0, &outputStructCnt, size);
                                if (qword_100010218)
                                  v550 = qword_100010218;
                                else
                                  v550 = &_os_log_default;
                                sub_1000082F8(v550, "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature len %lld platcfg len %lld\n", v543, v544, v545, v546, v547, v548, v549);
                                if (dword_100010220)
                                {
                                  *(_QWORD *)&v551 = 0xAAAAAAAAAAAAAAAALL;
                                  *((_QWORD *)&v551 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                  v695 = v551;
                                  v693 = v551;
                                  v694 = v551;
                                  *(_OWORD *)&v691[16] = v551;
                                  v692 = v551;
                                  v690 = v551;
                                  *(_OWORD *)v691 = v551;
                                  *(_OWORD *)size = v551;
                                  length = 0xAAAAAAAAAAAAAAAALL;
                                  time(&length);
                                  v552 = localtime(&length);
                                  strftime((char *)size, 0x80uLL, "%b %d %H:%M:%S", v552);
                                  dprintf(dword_100010220, "%s ", (const char *)size);
                                  dprintf(dword_100010220, "WiFiUserClientPrepareMappingDK return %x firmware len %lld nvram len %lld reg len %lld txcap len %lld signature len %lld platcfg len %lld\n", v549, *((_QWORD *)&outputStructCnt + 1), (_QWORD)v698, *((_QWORD *)&v701 + 1), (_QWORD)v703, (_QWORD)v699, (_QWORD)v700);
                                }
                                if (*((_QWORD *)&outputStructCnt + 1))
                                {
                                  if (DWORD1(outputStructCnt))
                                    goto LABEL_627;
                                  *(_QWORD *)cStr = sub_100007D74(*((_DWORD *)v125[3] + 5), outputStructCnt, (mach_vm_size_t *)&cStr[8]);
                                  *(_DWORD *)&cStr[16] = v697;
                                }
                                if ((_QWORD)v698)
                                {
                                  if (HIDWORD(v697))
                                    goto LABEL_627;
                                  *(_QWORD *)&cStr[24] = sub_100007D74(*((_DWORD *)v125[3] + 5), DWORD2(v697), (mach_vm_size_t *)&v713);
                                }
                                if (*((_QWORD *)&v701 + 1))
                                {
                                  if (DWORD1(v701))
                                    goto LABEL_627;
                                  *(_QWORD *)&v716 = sub_100007D74(*((_DWORD *)v125[3] + 5), v701, (mach_vm_size_t *)&v716 + 1);
                                  LOBYTE(v717) = v702;
                                }
                                if ((_QWORD)v703)
                                {
                                  if (HIDWORD(v702))
                                    goto LABEL_627;
                                  *((_QWORD *)&v717 + 1) = sub_100007D74(*((_DWORD *)v125[3] + 5), DWORD2(v702), (mach_vm_size_t *)&v718);
                                  BYTE8(v718) = BYTE8(v703);
                                }
                                if (!(_QWORD)v699)
                                {
LABEL_496:
                                  if (!(_QWORD)v700)
                                  {
LABEL_504:
                                    if (!v549)
                                    {
                                      if ((sub_1000085B4(v415, *(void **)cStr, (off_t *)&cStr[8]) & 1) != 0)
                                      {
                                        if (*((_QWORD *)&v716 + 1)
                                          && (_QWORD)v716
                                          && (sub_1000085B4(v511, (void *)v716, (off_t *)&v716 + 1) & 1) == 0)
                                        {
LABEL_601:
                                          if (qword_100010218)
                                            v650 = qword_100010218;
                                          else
                                            v650 = &_os_log_default;
                                          sub_1000082F8(v650, "copy RegTable to image map fail\n", v155, v156, v157, v158, v159, v160, outputStructc);
                                          if (dword_100010220)
                                          {
                                            *(_QWORD *)&v651 = 0xAAAAAAAAAAAAAAAALL;
                                            *((_QWORD *)&v651 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                            v702 = v651;
                                            v703 = v651;
                                            v700 = v651;
                                            v701 = v651;
                                            v698 = v651;
                                            v699 = v651;
                                            outputStructCnt = v651;
                                            v697 = v651;
                                            size[0] = 0xAAAAAAAAAAAAAAAALL;
                                            time((time_t *)size);
                                            v652 = localtime((const time_t *)size);
                                            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v652);
                                            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                            dprintf(dword_100010220, "copy RegTable to image map fail\n");
                                          }
                                        }
                                        else if ((_QWORD)v718
                                               && *((_QWORD *)&v717 + 1)
                                               && (sub_1000085B4(v528, *((void **)&v717 + 1), (off_t *)&v718) & 1) == 0)
                                        {
                                          if (qword_100010218)
                                            v653 = qword_100010218;
                                          else
                                            v653 = &_os_log_default;
                                          sub_1000082F8(v653, "copy txCapTable to image map fail\n", v602, v603, v604, v605, v606, v607, outputStructc);
                                          if (dword_100010220)
                                          {
                                            *(_QWORD *)&v654 = 0xAAAAAAAAAAAAAAAALL;
                                            *((_QWORD *)&v654 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                            v702 = v654;
                                            v703 = v654;
                                            v700 = v654;
                                            v701 = v654;
                                            v698 = v654;
                                            v699 = v654;
                                            outputStructCnt = v654;
                                            v697 = v654;
                                            size[0] = 0xAAAAAAAAAAAAAAAALL;
                                            time((time_t *)size);
                                            v655 = localtime((const time_t *)size);
                                            strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v655);
                                            dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                            dprintf(dword_100010220, "copy txCapTable to image map fail\n");
                                          }
                                        }
                                        else
                                        {
                                          v1 = (uint64_t)v125;
                                          if ((_QWORD)v713
                                            && *(_QWORD *)&cStr[24]
                                            && (sub_1000085B4(v507, *(void **)&cStr[24], (off_t *)&v713) & 1) == 0)
                                          {
                                            if (qword_100010218)
                                              v656 = qword_100010218;
                                            else
                                              v656 = &_os_log_default;
                                            sub_1000082F8(v656, "copy NVRAM to image map fail\n", v608, v609, v610, v611, v612, v613, outputStructc);
                                            if (dword_100010220)
                                            {
                                              *(_QWORD *)&v657 = 0xAAAAAAAAAAAAAAAALL;
                                              *((_QWORD *)&v657 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                              v702 = v657;
                                              v703 = v657;
                                              v700 = v657;
                                              v701 = v657;
                                              v698 = v657;
                                              v699 = v657;
                                              outputStructCnt = v657;
                                              v697 = v657;
                                              size[0] = 0xAAAAAAAAAAAAAAAALL;
                                              time((time_t *)size);
                                              v658 = localtime((const time_t *)size);
                                              strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v658);
                                              dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                              dprintf(dword_100010220, "copy NVRAM to image map fail\n");
                                            }
                                          }
                                          else
                                          {
                                            v254 = &stru_100010000;
                                            if ((_QWORD)v714
                                              && *((_QWORD *)&v713 + 1)
                                              && (sub_1000085B4(allocatora, *((void **)&v713 + 1), (off_t *)&v714) & 1) == 0)
                                            {
                                              v125 = (const __CFArray **)v1;
                                              if (qword_100010218)
                                                v659 = qword_100010218;
                                              else
                                                v659 = &_os_log_default;
                                              sub_1000082F8(v659, "copy Signature to image map fail\n", v614, v615, v616, v617, v618, v619, outputStructc);
                                              if (dword_100010220)
                                              {
                                                *(_QWORD *)&v660 = 0xAAAAAAAAAAAAAAAALL;
                                                *((_QWORD *)&v660 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                v702 = v660;
                                                v703 = v660;
                                                v700 = v660;
                                                v701 = v660;
                                                v698 = v660;
                                                v699 = v660;
                                                outputStructCnt = v660;
                                                v697 = v660;
                                                size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                time((time_t *)size);
                                                v661 = localtime((const time_t *)size);
                                                strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v661);
                                                dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                dprintf(dword_100010220, "copy Signature to image map fail\n");
                                              }
                                            }
                                            else
                                            {
                                              if (!(_QWORD)v715
                                                || !*((_QWORD *)&v714 + 1)
                                                || (sub_1000085B4(v685, *((void **)&v714 + 1), (off_t *)&v715) & 1) != 0)
                                              {
                                                *(_DWORD *)&cStr[16] = dword_1000100B0;
                                                LOBYTE(v717) = HIBYTE(dword_1000100B0);
                                                BYTE8(v715) = HIBYTE(word_1000100B4);
                                                BYTE8(v718) = word_1000100B4;
                                                v632 = IOConnectCallMethod(*(_DWORD *)(*(_QWORD *)(v1 + 24) + 20), 3u, 0, 0, cStr, 0x80uLL, 0, 0, 0, 0);
                                                if (qword_100010218)
                                                  v633 = qword_100010218;
                                                else
                                                  v633 = &_os_log_default;
                                                sub_1000082F8(v633, "WiFiUserClientCompleteMapping return %x\n", v626, v627, v628, v629, v630, v631, v632);
                                                if (dword_100010220)
                                                {
                                                  *(_QWORD *)&v634 = 0xAAAAAAAAAAAAAAAALL;
                                                  *((_QWORD *)&v634 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                  v702 = v634;
                                                  v703 = v634;
                                                  v700 = v634;
                                                  v701 = v634;
                                                  v698 = v634;
                                                  v699 = v634;
                                                  outputStructCnt = v634;
                                                  v697 = v634;
                                                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                  time((time_t *)size);
                                                  v635 = localtime((const time_t *)size);
                                                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v635);
                                                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                  dprintf(dword_100010220, "WiFiUserClientCompleteMapping return %x\n", v632);
                                                }
                                                if (v632)
                                                  goto LABEL_507;
                                                goto LABEL_306;
                                              }
                                              v125 = (const __CFArray **)v1;
                                              if (qword_100010218)
                                                v662 = qword_100010218;
                                              else
                                                v662 = &_os_log_default;
                                              sub_1000082F8(v662, "copy PLatcfg to image map fail\n", v620, v621, v622, v623, v624, v625, outputStructc);
                                              if (dword_100010220)
                                              {
                                                *(_QWORD *)&v663 = 0xAAAAAAAAAAAAAAAALL;
                                                *((_QWORD *)&v663 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                                v702 = v663;
                                                v703 = v663;
                                                v700 = v663;
                                                v701 = v663;
                                                v698 = v663;
                                                v699 = v663;
                                                outputStructCnt = v663;
                                                v697 = v663;
                                                size[0] = 0xAAAAAAAAAAAAAAAALL;
                                                time((time_t *)size);
                                                v664 = localtime((const time_t *)size);
                                                strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v664);
                                                dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                                dprintf(dword_100010220, "copy PLatcfg to image map fail\n");
                                              }
                                            }
                                          }
                                        }
                                      }
                                      else
                                      {
                                        if (qword_100010218)
                                          v647 = qword_100010218;
                                        else
                                          v647 = &_os_log_default;
                                        sub_1000082F8(v647, "copy FW to image map fail\n", v596, v597, v598, v599, v600, v601, outputStructc);
                                        if (dword_100010220)
                                        {
                                          *(_QWORD *)&v648 = 0xAAAAAAAAAAAAAAAALL;
                                          *((_QWORD *)&v648 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                          v702 = v648;
                                          v703 = v648;
                                          v700 = v648;
                                          v701 = v648;
                                          v698 = v648;
                                          v699 = v648;
                                          outputStructCnt = v648;
                                          v697 = v648;
                                          size[0] = 0xAAAAAAAAAAAAAAAALL;
                                          time((time_t *)size);
                                          v649 = localtime((const time_t *)size);
                                          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v649);
                                          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                                          dprintf(dword_100010220, "copy FW to image map fail\n");
                                        }
                                      }
                                    }
                                    v1 = (uint64_t)v125;
LABEL_506:
                                    v254 = &stru_100010000;
                                    goto LABEL_507;
                                  }
                                  if (!HIDWORD(v699))
                                  {
                                    *((_QWORD *)&v714 + 1) = sub_100007D74(*((_DWORD *)v125[3] + 5), DWORD2(v699), (mach_vm_size_t *)&v715);
                                    BYTE8(v715) = BYTE8(v700);
                                    goto LABEL_504;
                                  }
                                  goto LABEL_627;
                                }
                                if (!HIDWORD(v698))
                                {
                                  *((_QWORD *)&v713 + 1) = sub_100007D74(*((_DWORD *)v125[3] + 5), DWORD2(v698), (mach_vm_size_t *)&v714);
                                  goto LABEL_496;
                                }
LABEL_627:
                                __break(0x5507u);
                                goto LABEL_628;
                              }
                              if ((_QWORD)xmmword_100010090)
                                v529 = CFStringCreateMutableCopy(v3, 255, (CFStringRef)xmmword_100010090);
                              else
                                v529 = sub_100008DC8(v125[4], CFSTR("TxCap"), cStr, v678);
                              v528 = (const char *)v529;
                              if (BYTE1(dword_1000100B0))
                              {
                                if (v529)
                                  v530 = CFStringGetCStringPtr(v529, 0);
                                else
                                  v530 = 0;
                                v531 = (const char *)&unk_10000AE49;
                                if (v530)
                                  v531 = v530;
                                fprintf(__stdoutp, "Resolved to TxCap file path: \"%s\"\n", v531);
                              }
                              v125[11] = (const __CFArray *)v528;
                              if (!v528)
                                goto LABEL_473;
                              v528 = CFStringGetCStringPtr((CFStringRef)v528, 0);
                              if (qword_100010218)
                                v538 = qword_100010218;
                              else
                                v538 = &_os_log_default;
                              sub_1000082F8(v538, "full path TxCap is %s\n", v532, v533, v534, v535, v536, v537, (char)v528);
                              if (dword_100010220)
                              {
                                *(_QWORD *)&v539 = 0xAAAAAAAAAAAAAAAALL;
                                *((_QWORD *)&v539 + 1) = 0xAAAAAAAAAAAAAAAALL;
                                v717 = v539;
                                v718 = v539;
                                v715 = v539;
                                v716 = v539;
                                v713 = v539;
                                v714 = v539;
                                *(_OWORD *)cStr = v539;
                                *(_OWORD *)&cStr[16] = v539;
                                *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
                                time((time_t *)&outputStructCnt);
                                v540 = localtime((const time_t *)&outputStructCnt);
                                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v540);
                                dprintf(dword_100010220, "%s ", cStr);
                                dprintf(dword_100010220, "full path TxCap is %s\n", v528);
                              }
                              if ((sub_100007E98(v528, &qword_1000100D8) & 1) != 0
                                && (unint64_t)qword_1000100D8 < 0x8000
                                && (unint64_t)qword_1000100D8 > 0x20)
                              {
                                goto LABEL_473;
                              }
LABEL_590:
                              v1 = (uint64_t)v125;
                              IOConnectCallScalarMethod(*((_DWORD *)v125[3] + 5), 4u, 0, 0, 0, 0);
                              goto LABEL_506;
                            }
                            v512 = sub_100008DC8(*(const __CFArray **)(v1 + 32), CFSTR("Regulatory"), &qword_1000100F8, v678);
                          }
                          v513 = v512;
                          goto LABEL_433;
                        }
                      }
LABEL_383:
                      IOConnectCallScalarMethod(*(_DWORD *)(*(_QWORD *)(v1 + 24) + 20), 4u, 0, 0, 0, 0);
                      goto LABEL_507;
                    }
                  }
                  v497 = CFStringCreateMutableCopy(v3, 255, v493);
                  goto LABEL_409;
                }
              }
              v475 = CFStringCreateMutableCopy(v3, 255, v472);
              goto LABEL_387;
            }
          }
          else
          {
            v422 = (const __CFString *)qword_100010080;
            if (!qword_100010080)
            {
LABEL_365:
              v426 = sub_100008DC8(v419, CFSTR("Signature"), &qword_1000100C0, v678);
              goto LABEL_366;
            }
          }
          v426 = CFStringCreateMutableCopy(v3, 255, v422);
          goto LABEL_366;
        }
        if (qword_100010218)
          v283 = qword_100010218;
        else
          v283 = &_os_log_default;
        if (BYTE1(dword_1000100B0))
        {
          sub_1000082F8(v283, "%s: showFilesOnly mode does not need FDR.\n", v275, v276, v277, v278, v279, v280, (char)"handleFdr");
          if (dword_100010220)
          {
            *(_QWORD *)&v290 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v290 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v290;
            v718 = v290;
            v715 = v290;
            v716 = v290;
            v713 = v290;
            v714 = v290;
            *(_OWORD *)cStr = v290;
            *(_OWORD *)&cStr[16] = v290;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v291 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v291);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s: showFilesOnly mode does not need FDR.\n");
          }
          goto LABEL_295;
        }
        sub_1000082F8(v283, "%s enter\n", v275, v276, v277, v278, v279, v280, (char)"getFDRCal");
        if (dword_100010220)
        {
          *(_QWORD *)&v301 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v301 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v717 = v301;
          v718 = v301;
          v715 = v301;
          v716 = v301;
          v713 = v301;
          v714 = v301;
          *(_OWORD *)cStr = v301;
          *(_OWORD *)&cStr[16] = v301;
          *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&outputStructCnt);
          v302 = localtime((const time_t *)&outputStructCnt);
          strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v302);
          dprintf(dword_100010220, "%s ", cStr);
          dprintf(dword_100010220, "%s enter\n", "getFDRCal");
        }
        LODWORD(v687) = 0;
        if (qword_100010218)
          v303 = qword_100010218;
        else
          v303 = &_os_log_default;
        sub_1000082F8(v303, "%s enter\n", v295, v296, v297, v298, v299, v300, (char)"findHwIdentifiersPolling");
        *(_QWORD *)&v304 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v304 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v717 = v304;
        v718 = v304;
        v715 = v304;
        v716 = v304;
        v713 = v304;
        v714 = v304;
        *(_OWORD *)cStr = v304;
        *(_OWORD *)&cStr[16] = v304;
        if (dword_100010220)
        {
          v702 = v304;
          v703 = v304;
          v700 = v304;
          v701 = v304;
          v698 = v304;
          v699 = v304;
          outputStructCnt = v304;
          v697 = v304;
          size[0] = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)size);
          v305 = localtime((const time_t *)size);
          strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v305);
          dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
          dprintf(dword_100010220, "%s enter\n", "findHwIdentifiersPolling");
        }
        streama = IORegistryGetRootEntry(kIOMainPortDefault);
        if (!streama || IORegistryCreateIterator(kIOMainPortDefault, "IOService", 0, (io_iterator_t *)&v687))
        {
          v684 = 1;
          v254 = &stru_100010000;
        }
        else
        {
          v676 = v1;
          v312 = 1;
          v684 = 1;
          while (1)
          {
            v313 = IOIteratorNext(v687);
            if (!v313)
              break;
            v314 = v313;
            strcpy(cStr, "IOPlatformExpertDevice");
            if (IOObjectConformsTo(v313, cStr))
            {
              do
              {
                if (qword_100010218)
                  v321 = qword_100010218;
                else
                  v321 = &_os_log_default;
                sub_1000082F8(v321, "%s Find HWIdentifiers...%d\n", v315, v316, v317, v318, v319, v320, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(_QWORD *)&v322 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v322 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v702 = v322;
                  v703 = v322;
                  v700 = v322;
                  v701 = v322;
                  v698 = v322;
                  v699 = v322;
                  outputStructCnt = v322;
                  v697 = v322;
                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                  time((time_t *)size);
                  v323 = localtime((const time_t *)size);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v323);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s Find HWIdentifiers...%d\n", "findHwIdentifiersPolling", v312);
                }
                v324 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v314, "IOService", CFSTR("HWIdentifiers"), v3, 1u);
                v325 = v324;
                if (v312 <= 2 && !v324)
                  usleep(0x222E0u);
                v326 = v312 + 1;
                if (__OFADD__(v312, 1))
                  __break(0x5500u);
                if (v326 > 3)
                  break;
                ++v312;
              }
              while (!v325);
              if (v325)
              {
                v327 = (const __CFString *)CFDictionaryGetValue(v325, CFSTR("P"));
                *(_QWORD *)&v328 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v328 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&v691[12] = v328;
                v690 = v328;
                *(_OWORD *)v691 = v328;
                *(_OWORD *)size = v328;
                CFStringGetCString(v327, (char *)size, 60, 0x8000100u);
                v329 = (const __CFNumber *)CFDictionaryGetValue(v325, CFSTR("C"));
                LODWORD(valuePtr) = -1431655766;
                CFNumberGetValue(v329, kCFNumberIntType, &valuePtr);
                if (qword_100010218)
                  v336 = qword_100010218;
                else
                  v336 = &_os_log_default;
                sub_1000082F8(v336, "%s HWIdentifiers: chipNumber %d platformName %s\n", v330, v331, v332, v333, v334, v335, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(_QWORD *)&v337 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v337 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v702 = v337;
                  v703 = v337;
                  v700 = v337;
                  v701 = v337;
                  v698 = v337;
                  v699 = v337;
                  outputStructCnt = v337;
                  v697 = v337;
                  length = 0xAAAAAAAAAAAAAAAALL;
                  time(&length);
                  v338 = localtime(&length);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v338);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s HWIdentifiers: chipNumber %d platformName %s\n", "findHwIdentifiersPolling", valuePtr, (const char *)size);
                }
                v684 = 0;
              }
              else
              {
                if (qword_100010218)
                  v339 = qword_100010218;
                else
                  v339 = &_os_log_default;
                sub_1000082F8(v339, "%s No %s in ioreg\n", v315, v316, v317, v318, v319, v320, (char)"findHwIdentifiersPolling");
                if (dword_100010220)
                {
                  *(_QWORD *)&v340 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v340 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v702 = v340;
                  v703 = v340;
                  v700 = v340;
                  v701 = v340;
                  v698 = v340;
                  v699 = v340;
                  outputStructCnt = v340;
                  v697 = v340;
                  size[0] = 0xAAAAAAAAAAAAAAAALL;
                  time((time_t *)size);
                  v341 = localtime((const time_t *)size);
                  strftime((char *)&outputStructCnt, 0x80uLL, "%b %d %H:%M:%S", v341);
                  dprintf(dword_100010220, "%s ", (const char *)&outputStructCnt);
                  dprintf(dword_100010220, "%s No %s in ioreg\n", "findHwIdentifiersPolling", "HWIdentifiers");
                }
              }
              IOObjectRelease(v314);
              v312 = v326;
            }
          }
          v1 = v676;
          if (v312 >= 3)
            IORegistryEntrySetCFProperty(*(_DWORD *)(v676 + 8), CFSTR("HWIdentifiersLate"), kCFBooleanTrue);
          v254 = &stru_100010000;
        }
        if ((_DWORD)v687)
          IOObjectRelease(v687);
        if (streama)
          IOObjectRelease(streama);
        if (!v684)
        {
          if (qword_100010218)
            v428 = qword_100010218;
          else
            v428 = &_os_log_default;
          sub_1000082F8(v428, "%s dataClass %s\n", v306, v307, v308, v309, v310, v311, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(_QWORD *)&v429 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v429 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v429;
            v718 = v429;
            v715 = v429;
            v716 = v429;
            v713 = v429;
            v714 = v429;
            *(_OWORD *)cStr = v429;
            *(_OWORD *)&cStr[16] = v429;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v430 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v430);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s dataClass %s\n", "getFDRCal", "BWCl");
          }
          v431 = CFStringCreateWithCString(0, "BWCl", 0);
          *(_QWORD *)&outputStructCnt = 0;
          v438 = (const __CFDictionary *)AMFDRSealingMapCopyLocalDictForClass(v431, 0, &outputStructCnt);
          v439 = (const void *)outputStructCnt;
          v440 = 1;
          if (v438 && !(_QWORD)outputStructCnt)
          {
            if (qword_100010218)
              v441 = qword_100010218;
            else
              v441 = &_os_log_default;
            sub_1000082F8(v441, "%s successful fdr\n", v432, v433, v434, v435, v436, v437, (char)"getFDRCal");
            if (dword_100010220)
            {
              *(_QWORD *)&v442 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v442 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v717 = v442;
              v718 = v442;
              v715 = v442;
              v716 = v442;
              v713 = v442;
              v714 = v442;
              *(_OWORD *)cStr = v442;
              *(_OWORD *)&cStr[16] = v442;
              size[0] = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)size);
              v443 = localtime((const time_t *)size);
              strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v443);
              dprintf(dword_100010220, "%s ", cStr);
              dprintf(dword_100010220, "%s successful fdr\n", "getFDRCal");
            }
            v450 = CFDictionaryGetValue(v438, CFSTR("WCAL"));
            if (qword_100010218)
              v451 = qword_100010218;
            else
              v451 = &_os_log_default;
            if (v450)
            {
              sub_1000082F8(v451, "%s add fdr cal\n", v444, v445, v446, v447, v448, v449, (char)"getFDRCal");
              if (dword_100010220)
              {
                *(_QWORD *)&v452 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v452 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v717 = v452;
                v718 = v452;
                v715 = v452;
                v716 = v452;
                v713 = v452;
                v714 = v452;
                *(_OWORD *)cStr = v452;
                *(_OWORD *)&cStr[16] = v452;
                size[0] = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)size);
                v453 = localtime((const time_t *)size);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v453);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "%s add fdr cal\n", "getFDRCal");
              }
              IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), CFSTR("WiFiFdrCal"), v450);
              v440 = 0;
              v3 = allocator;
            }
            else
            {
              sub_1000082F8(v451, "%s failed dict get value\n", v444, v445, v446, v447, v448, v449, (char)"getFDRCal");
              if (dword_100010220)
              {
                *(_QWORD *)&v636 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v636 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v717 = v636;
                v718 = v636;
                v715 = v636;
                v716 = v636;
                v713 = v636;
                v714 = v636;
                *(_OWORD *)cStr = v636;
                *(_OWORD *)&cStr[16] = v636;
                size[0] = 0xAAAAAAAAAAAAAAAALL;
                time((time_t *)size);
                v637 = localtime((const time_t *)size);
                strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v637);
                dprintf(dword_100010220, "%s ", cStr);
                dprintf(dword_100010220, "%s failed dict get value\n", "getFDRCal");
              }
              v440 = 1;
              v3 = allocator;
            }
            v439 = (const void *)outputStructCnt;
          }
          if (v439)
            CFRelease(v439);
          *(_QWORD *)&outputStructCnt = 0;
          if (v431)
            CFRelease(v431);
          if (v438)
            CFRelease(v438);
          CFRelease(CFSTR("WCAL"));
          if (!v440)
          {
            v355 = "fdr";
            goto LABEL_288;
          }
          if (qword_100010218)
            v644 = qword_100010218;
          else
            v644 = &_os_log_default;
          sub_1000082F8(v644, "%s failed\n", v638, v639, v640, v641, v642, v643, (char)"getFDRCal");
          if (dword_100010220)
          {
            *(_QWORD *)&v645 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v645 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v645;
            v718 = v645;
            v715 = v645;
            v716 = v645;
            v713 = v645;
            v714 = v645;
            *(_OWORD *)cStr = v645;
            *(_OWORD *)&cStr[16] = v645;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v646 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v646);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s failed\n", "getFDRCal");
          }
        }
        v725 = 0u;
        v726 = 0u;
        v723 = 0u;
        v724 = 0u;
        v721 = 0u;
        v722 = 0u;
        v719 = 0u;
        v720 = 0u;
        v717 = 0u;
        v718 = 0u;
        v715 = 0u;
        v716 = 0u;
        v713 = 0u;
        v714 = 0u;
        memset(cStr, 0, sizeof(cStr));
        length = 0;
        v710 = 0u;
        v711 = 0u;
        v708 = 0u;
        v709 = 0u;
        v706 = 0u;
        v707 = 0u;
        v704 = 0u;
        v705 = 0u;
        v702 = 0u;
        v703 = 0u;
        v700 = 0u;
        v701 = 0u;
        v698 = 0u;
        v699 = 0u;
        outputStructCnt = 0u;
        v697 = 0u;
        if (byte_100010010)
        {
LABEL_287:
          v355 = "genCal";
          goto LABEL_288;
        }
        if (!sub_100006354(v1, cStr, "cal"))
        {
          if (sub_100007E98(cStr, &length))
          {
            if ((unint64_t)(length - 0x2000) >= 0xFFFFFFFFFFFFE081)
            {
              v342 = (UInt8 *)malloc_type_malloc(length, 0xDBEE3B7BuLL);
              if (v342)
              {
                v343 = v342;
                v687 = length;
                if (sub_1000085B4(cStr, v342, &v687))
                {
                  v344 = CFDataCreateWithBytesNoCopy(v3, v343, v687, kCFAllocatorNull);
                  if (v344)
                  {
                    v351 = v344;
                    if (qword_100010218)
                      v352 = qword_100010218;
                    else
                      v352 = &_os_log_default;
                    sub_1000082F8(v352, "%s writes %s size %zu to %s\n", v345, v346, v347, v348, v349, v350, (char)"getGenericCalibrationData");
                    if (dword_100010220)
                    {
                      *(_QWORD *)&v353 = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&v353 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v695 = v353;
                      v693 = v353;
                      v694 = v353;
                      *(_OWORD *)&v691[16] = v353;
                      v692 = v353;
                      v690 = v353;
                      *(_OWORD *)v691 = v353;
                      *(_OWORD *)size = v353;
                      valuePtr = 0xAAAAAAAAAAAAAAAALL;
                      time(&valuePtr);
                      v354 = localtime(&valuePtr);
                      strftime((char *)size, 0x80uLL, "%b %d %H:%M:%S", v354);
                      dprintf(dword_100010220, "%s ", (const char *)size);
                      dprintf(dword_100010220, "%s writes %s size %zu to %s\n", "getGenericCalibrationData", cStr, length, "wifi-calibration-gen");
                    }
                    IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), CFSTR("WiFiGenericCal"), v351);
                    v3 = allocator;
                    if (!sub_100006354(v1, (char *)&outputStructCnt, "clmb"))
                    {
                      HIBYTE(dword_1000100B0) = 1;
                      qword_100010088 = (uint64_t)CFStringCreateWithCString(0, (const char *)&outputStructCnt, 0);
                      free(v343);
                      goto LABEL_287;
                    }
                  }
                }
                free(v343);
              }
            }
          }
        }
        v355 = "unavailable";
LABEL_288:
        v356 = strlen(v355);
        v363 = CFStringCreateWithBytes(v3, (const UInt8 *)v355, v356, 0x8000100u, 0);
        if (qword_100010218)
          v364 = qword_100010218;
        else
          v364 = &_os_log_default;
        if (v363)
        {
          sub_1000082F8(v364, "%s add msfSource %s\n", v357, v358, v359, v360, v361, v362, (char)"handleFdr");
          if (dword_100010220)
          {
            *(_QWORD *)&v365 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v365 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v365;
            v718 = v365;
            v715 = v365;
            v716 = v365;
            v713 = v365;
            v714 = v365;
            *(_OWORD *)cStr = v365;
            *(_OWORD *)&cStr[16] = v365;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v366 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v366);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s add msfSource %s\n", "handleFdr", v355);
          }
          IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), CFSTR("WiFiMSFSource"), v363);
        }
        else
        {
          sub_1000082F8(v364, "%s failed to create msfSourceRef\n", v357, v358, v359, v360, v361, v362, (char)"handleFdr");
          if (dword_100010220)
          {
            *(_QWORD *)&v454 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v454 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v717 = v454;
            v718 = v454;
            v715 = v454;
            v716 = v454;
            v713 = v454;
            v714 = v454;
            *(_OWORD *)cStr = v454;
            *(_OWORD *)&cStr[16] = v454;
            *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&outputStructCnt);
            v455 = localtime((const time_t *)&outputStructCnt);
            strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v455);
            dprintf(dword_100010220, "%s ", cStr);
            dprintf(dword_100010220, "%s failed to create msfSourceRef\n");
          }
        }
        goto LABEL_295;
      }
    }
    v264 = CFStringCreateMutableCopy(v3, 255, v261);
    goto LABEL_207;
  }
LABEL_507:
  if (*(_DWORD *)v254[32].__opaque)
  {
    if (dword_100010204)
    {
      if (qword_100010218)
        v563 = qword_100010218;
      else
        v563 = &_os_log_default;
      sub_1000082F8(v563, "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n", v248, v249, v250, v251, v252, v253, dword_100010204);
      if (dword_100010220)
      {
        *(_QWORD *)&v564 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v564 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v717 = v564;
        v718 = v564;
        v715 = v564;
        v716 = v564;
        v713 = v564;
        v714 = v564;
        *(_OWORD *)cStr = v564;
        *(_OWORD *)&cStr[16] = v564;
        *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v565 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v565);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - started\n", dword_100010204);
      }
      sleep(dword_100010204);
      if (qword_100010218)
        v572 = qword_100010218;
      else
        v572 = &_os_log_default;
      sub_1000082F8(v572, "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n", v566, v567, v568, v569, v570, v571, dword_100010204);
      if (dword_100010220)
      {
        *(_QWORD *)&v573 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v573 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v717 = v573;
        v718 = v573;
        v715 = v573;
        v716 = v573;
        v713 = v573;
        v714 = v573;
        *(_OWORD *)cStr = v573;
        *(_OWORD *)&cStr[16] = v573;
        *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&outputStructCnt);
        v574 = localtime((const time_t *)&outputStructCnt);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v574);
        dprintf(dword_100010220, "%s ", cStr);
        dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: delay[%u sec] - ended\n", dword_100010204);
      }
    }
    v575 = *(_DWORD *)v254[32].__opaque;
    v582 = IOPMAssertionRelease(v575);
    *(_DWORD *)v254[32].__opaque = 0;
    if (qword_100010218)
      v583 = qword_100010218;
    else
      v583 = &_os_log_default;
    sub_1000082F8(v583, "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n", v576, v577, v578, v579, v580, v581, v582);
    if (dword_100010220)
    {
      *(_QWORD *)&v584 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v584 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v717 = v584;
      v718 = v584;
      v715 = v584;
      v716 = v584;
      v713 = v584;
      v714 = v584;
      *(_OWORD *)cStr = v584;
      *(_OWORD *)&cStr[16] = v584;
      *(_QWORD *)&outputStructCnt = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&outputStructCnt);
      v585 = localtime((const time_t *)&outputStructCnt);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", v585);
      dprintf(dword_100010220, "%s ", cStr);
      dprintf(dword_100010220, "wifiFirmwareLoaderServiceThread: _releaseIOPMHelperAssertionRelease return[0x%08x], id[0x%08x], release id[0x%08x]\n", v582, v575, *(_DWORD *)v254[32].__opaque);
    }
  }
  *(_DWORD *)(v1 + 16) = 2;
  v586 = *(const void **)(v1 + 24);
  if (v586)
    CFRelease(v586);
  *(_QWORD *)(v1 + 24) = 0;
  v587 = *(const void **)(v1 + 32);
  if (v587)
    CFRelease(v587);
  *(_QWORD *)(v1 + 32) = 0;
  v588 = *(const void **)(v1 + 40);
  if (v588)
    CFRelease(v588);
  *(_QWORD *)(v1 + 40) = 0;
  v589 = *(const void **)(v1 + 48);
  if (v589)
    CFRelease(v589);
  *(_QWORD *)(v1 + 48) = 0;
  v590 = *(const void **)(v1 + 64);
  if (v590)
    CFRelease(v590);
  *(_QWORD *)(v1 + 64) = 0;
  v591 = *(const void **)(v1 + 56);
  if (v591)
    CFRelease(v591);
  *(_QWORD *)(v1 + 56) = 0;
  v592 = *(const void **)(v1 + 80);
  if (v592)
    CFRelease(v592);
  *(_QWORD *)(v1 + 80) = 0;
  v593 = *(const void **)(v1 + 88);
  if (v593)
    CFRelease(v593);
  *(_QWORD *)(v1 + 88) = 0;
  v594 = *(const void **)(v1 + 96);
  if (v594)
    CFRelease(v594);
  *(_QWORD *)(v1 + 96) = 0;
  v595 = *(_DWORD *)(v1 + 8);
  if (v595)
  {
    IOObjectRelease(v595);
    *(_DWORD *)(v1 + 8) = 0;
  }
  CFRunLoopStop((CFRunLoopRef)qword_100010060);
}

uint64_t sub_100006354(uint64_t a1, char *a2, const char *a3)
{
  CFIndex Length;
  size_t v7;
  const char *CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  tm *v18;
  int v19;
  const char *v20;
  time_t v22;
  char v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  if (!CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0))
    return 1;
  Length = CFStringGetLength(*(CFStringRef *)(a1 + 64));
  if (__OFSUB__(Length, 4))
  {
    __break(0x5515u);
LABEL_12:
    __break(0x5500u);
  }
  v7 = Length - 3;
  if (Length == 3)
    goto LABEL_12;
  CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  strlcpy(a2, CStringPtr, v7);
  strlcat(a2, "_gen.", 0xFFuLL);
  strlcat(a2, a3, 0xFFuLL);
  v9 = qword_100010218;
  CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
  v16 = &_os_log_default;
  if (v9)
    v16 = v9;
  sub_1000082F8(v16, "%s %s from FW path %s\n", v10, v11, v12, v13, v14, v15, (char)"createGenericPath");
  if (dword_100010220)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v17;
    v30 = v17;
    v27 = v17;
    v28 = v17;
    v25 = v17;
    v26 = v17;
    *(_OWORD *)v23 = v17;
    v24 = v17;
    v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    v18 = localtime(&v22);
    strftime(v23, 0x80uLL, "%b %d %H:%M:%S", v18);
    dprintf(dword_100010220, "%s ", v23);
    v19 = dword_100010220;
    v20 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 64), 0);
    dprintf(v19, "%s %s from FW path %s\n", "createGenericPath", a2, v20);
  }
  return 0;
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  tm *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  tm *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  tm *v31;
  char v32;
  int v33;
  int v34;
  const __SCPreferences *v35;
  const __SCPreferences *v36;
  const __CFNumber *Value;
  const __CFNumber *v38;
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v41;
  SInt32 IntValue;
  CFTypeID v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  tm *v58;
  NSObject *v59;
  __int128 v60;
  tm *v61;
  uint64_t v62;
  SCPreferencesRef v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const __SCPreferences *v70;
  NSObject *v71;
  __int128 v72;
  tm *v73;
  CFPropertyListRef v74;
  const void *v75;
  CFTypeID v76;
  const __CFNumber *v77;
  const __CFNumber *v78;
  CFTypeID v79;
  CFPropertyListRef v80;
  const void *v81;
  CFTypeID v82;
  const __CFNumber *v83;
  const __CFNumber *v84;
  CFTypeID v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  NSObject *v93;
  __int128 v94;
  tm *v95;
  NSObject *v96;
  char v97;
  const __CFString *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  tm *v106;
  int v107;
  int v108;
  int v109;
  const __CFString *v110;
  const char *CStringPtr;
  NSObject *v112;
  __int128 v113;
  tm *v114;
  void *v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  __int128 v124;
  tm *v125;
  int v126;
  const char *v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  tm *v144;
  int v145;
  const char *v146;
  NSObject *v147;
  __int128 v148;
  tm *v149;
  void *v150;
  char v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  NSObject *v158;
  __int128 v159;
  tm *v160;
  int v161;
  const char *v162;
  void *v163;
  char v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  NSObject *v171;
  __int128 v172;
  tm *v173;
  int v174;
  const char *v175;
  void *v176;
  char v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  NSObject *v184;
  __int128 v185;
  tm *v186;
  int v187;
  const char *v188;
  void *v189;
  char v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  NSObject *v197;
  __int128 v198;
  tm *v199;
  int v200;
  const char *v201;
  void *v202;
  char v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  NSObject *v210;
  __int128 v211;
  tm *v212;
  int v213;
  const char *v214;
  void *v215;
  char v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *v223;
  __int128 v224;
  tm *v225;
  int v226;
  const char *v227;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  char v238;
  char v239;
  char v240;
  char v241;
  char v242;
  time_t v243;
  char *errorbuf;
  char valuePtr[16];
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;

  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_10000C438);
  errorbuf = 0;
  if (sandbox_init("wifiFirmwareLoader", 1uLL, &errorbuf) == -1)
  {
    fprintf(__stderrp, "wifiFirmwareLoader sandbox_init: \"%s\", attempting default compiled profile\n", errorbuf);
    sandbox_free_error(errorbuf);
    if (qword_100010218)
      v10 = qword_100010218;
    else
      v10 = &_os_log_default;
    sub_1000082F8(v10, "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile", v4, v5, v6, v7, v8, v9, v239);
    if (dword_100010220)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v251 = v11;
      v252 = v11;
      v249 = v11;
      v250 = v11;
      v247 = v11;
      v248 = v11;
      *(_OWORD *)valuePtr = v11;
      v246 = v11;
      v243 = 0xAAAAAAAAAAAAAAAALL;
      time(&v243);
      v12 = localtime(&v243);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v12);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "Sandboxing init issue, couldn't find profile in default paths, attempting default compiled profile");
    }
    if (sandbox_init("(version 1)(deny default)(import \"system.sb\")(allow file-read-metadata (literal \"/Library/Preferences\"))(allow file-read-data (literal \"/private/var/preferences/SystemConfiguration/com.apple.wifi.plist\"))(allow file-read-data (literal \"/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist\"))(allow mach-lookup (global-name \"com.apple.system.logger\"))(allow mach-lookup (global-name \"com.apple.system.notification_center\"))(allow mach-lookup (global-name \"com.apple.corecaptured\"))(allow mach-lookup (global-name \"com.apple.PowerManagement.control\"))(allow ipc-posix-shm-read-data (ipc-posix-name \"apple.shm.notification_center\"))(allow sysctl-read)(allow iokit-open (iokit-user-client-class \"IOUserUserClient\"))(allow iokit-open (iokit-user-client-class \"AppleBCMWLANUserClient\"))(allow iokit-open (iokit-user-client-class \"AppleKeyStoreUserClient\"))(allow iokit-set-properties (iokit-property \"PlatformConfig\"))(allow iokit-set-properties (iokit-property \"WiFiMSFCal\"))(allow iokit-set-properties (iokit-property \"WiFiFdrCal\"))(allow iokit-set-properties (iokit-property \"WiFiGenericCal\"))(allow iokit-set-properties (iokit-property \"WiFiMSFSource\"))(allow iokit-set-properties (iokit-property \"HWIdentifiersLate\"))(allow file-read* (subpath \"/usr/share/firmware/wifi\"))(allow file-read* (subpath \"/usr/local/share/firmware\"))(allow file-read* (subpath \"/AppleInternal\"))(allow file-read-metadata (literal \"/usr\"))(allow file-read-metadata (regex #\"^/usr/.*$\"))(allow file-read-metadata (literal \"/var\"))(allow file-write* (literal \"/private/var/logs/wifiFirmwareLoader.log\"))(allow file-read* (literal \"/private/var/logs/wifiFirmwareLoader.log\"))(allow file-read-metadata (regex #\"^/private/var/db/timezone/.*$\"))(allow file-read-data (regex #\"^/usr/share/zoneinfo.default/.*$\"))(allow file-read-data (literal \"/Library/Preferences/SystemConfiguration/com.apple.wifiFirmwareLoader.plist\"))", 0,
           &errorbuf) == -1)
    {
      v22 = errorbuf;
      if (!errorbuf)
        v22 = (char *)&unk_10000AE49;
      fprintf(__stderrp, "wifiFirmwareLoader sandbox_init: \"%s\" \nwifiFirmwareLoader failed to run, check profile\n", v22);
      sandbox_free_error(errorbuf);
      if (qword_100010218)
        v29 = qword_100010218;
      else
        v29 = &_os_log_default;
      sub_1000082F8(v29, "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile", v23, v24, v25, v26, v27, v28, v241);
      if (dword_100010220)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v30;
        v252 = v30;
        v249 = v30;
        v250 = v30;
        v247 = v30;
        v248 = v30;
        *(_OWORD *)valuePtr = v30;
        v246 = v30;
        v243 = 0xAAAAAAAAAAAAAAAALL;
        time(&v243);
        v31 = localtime(&v243);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v31);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue failed, wifiFirmwareLoader failed to run, check profile");
      }
    }
    else
    {
      fwrite("wifiFirmwareLoader sandbox_init: Success\n", 0x29uLL, 1uLL, __stderrp);
      if (qword_100010218)
        v19 = qword_100010218;
      else
        v19 = &_os_log_default;
      sub_1000082F8(v19, "Sandboxing init issue resolved: \"Success\"", v13, v14, v15, v16, v17, v18, v240);
      if (dword_100010220)
      {
        *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v20;
        v252 = v20;
        v249 = v20;
        v250 = v20;
        v247 = v20;
        v248 = v20;
        *(_OWORD *)valuePtr = v20;
        v246 = v20;
        v243 = 0xAAAAAAAAAAAAAAAALL;
        time(&v243);
        v21 = localtime(&v243);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v21);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Sandboxing init issue resolved: \"Success\"");
      }
    }
  }
  v32 = 0;
  qword_100010100 = (uint64_t)&_mh_execute_header;
  dword_100010110 = 0;
  dword_100010118 = 0;
  dword_100010188 = 0;
  dword_100010190 = 0;
  *(_OWORD *)&qword_1000100B8 = 0u;
  *(_OWORD *)&qword_1000100C8 = 0u;
  *(_OWORD *)&qword_1000100D8 = 0u;
  dword_1000100B0 = 0;
  word_1000100B4 = 0;
  xmmword_100010070 = 0u;
  *(_OWORD *)&qword_100010080 = 0u;
  xmmword_100010090 = 0u;
  qword_1000100A0 = 0;
  while (1)
  {
    v33 = getopt(a1, a2, "fF:N:C:S:rR:T:MmP:p:");
    if (v33 < 0)
      break;
    if (v33 > 101)
    {
      if (v33 > 111)
      {
        if (v33 == 112)
        {
          if (!optarg)
          {
LABEL_55:
            puts("\nUsage:\n\n  -F <filename> [\"mfg\"]\n                    uploads firmware data from a file \n                    <filename>  specifies the path to a binary image of firmware.\n                    \"mfg\" denotes a manufacturing firmware; if given the driver will omit initial setup "
              "after writing the firmware.\n"
              "  -N <filename>     uploads nvram data from a file\n"
              "                    <filename>  specifies the path to a text file of NVRAM data\n"
              "  -S <filename>     uploads signature data from a file\n"
              "                    <filename>  specifies the path to a text file of signature data\n"
              "  -p <filename>     uploads platcfg blob data from a file\n"
              "                    <filename>  specifies the path to a binary file of platcfg blob data\n"
              "  -R <filename>     uploads regulatory table from a file\n"
              "                    <filename>  specifies the path to a text file of clmb data\n"
              "  -T <filename>     uploads tx cap table from a file\n"
              "                    <filename>  specifies the path to a text file of cap tx table\n"
              "  -P <filename>     Sets the Platform Config from a file\n"
              "                    <filename>  specifies the path to a the PlatformConfig file\n"
              "  -f                Prints the file paths for Firmware image and NVRAM file (doesn't perform an upload).\n"
              "  -r                Force to load Firmware\n"
              "  -M                Set MFG firmware flag\n"
              "  -m                Clear MFG firmware flag\n");
            return 1;
          }
          *((_QWORD *)&xmmword_100010090 + 1) = CFStringCreateWithCString(0, optarg, 0);
          HIBYTE(word_1000100B4) = 1;
        }
        else
        {
          if (v33 != 114)
            goto LABEL_55;
          BYTE2(dword_1000100B0) = 1;
        }
      }
      else if (v33 == 102)
      {
        BYTE1(dword_1000100B0) = 1;
      }
      else
      {
        if (v33 != 109)
          goto LABEL_55;
LABEL_29:
        LOBYTE(dword_1000100B0) = v33 == 77;
        v32 = 1;
      }
    }
    else
    {
      switch(v33)
      {
        case 'C':
          if (!optarg)
            goto LABEL_55;
          qword_1000100A8 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'F':
          if (!optarg)
            goto LABEL_55;
          *((_QWORD *)&xmmword_100010070 + 1) = CFStringCreateWithCString(0, optarg, 0);
          if ((v32 & 1) != 0)
            v34 = dword_1000100B0;
          else
            v34 = strcasestr(optarg, "mfg") != 0;
          LOBYTE(dword_1000100B0) = v34 != 0;
          break;
        case 'M':
          goto LABEL_29;
        case 'N':
          if (!optarg)
            goto LABEL_55;
          *(_QWORD *)&xmmword_100010070 = CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'P':
          if (!optarg)
            goto LABEL_55;
          qword_1000100A0 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'R':
          if (!optarg)
            goto LABEL_55;
          qword_100010088 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          HIBYTE(dword_1000100B0) = 1;
          break;
        case 'S':
          if (!optarg)
            goto LABEL_55;
          qword_100010080 = (uint64_t)CFStringCreateWithCString(0, optarg, 0);
          break;
        case 'T':
          if (!optarg)
            goto LABEL_55;
          *(_QWORD *)&xmmword_100010090 = CFStringCreateWithCString(0, optarg, 0);
          LOBYTE(word_1000100B4) = 1;
          break;
        default:
          goto LABEL_55;
      }
    }
  }
  v35 = SCPreferencesCreate(0, CFSTR("com.apple.wifiFirmwareLoader"), CFSTR("/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist"));
  *(_DWORD *)valuePtr = 0;
  if (v35)
  {
    v36 = v35;
    Value = (const __CFNumber *)SCPreferencesGetValue(v35, CFSTR("LoggingEnabled"));
    if (!Value)
      goto LABEL_61;
    v38 = Value;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v38))
    {
      CFNumberGetValue(v38, kCFNumberIntType, valuePtr);
      goto LABEL_61;
    }
    v41 = CFBooleanGetTypeID();
    if (v41 == CFGetTypeID(v38))
    {
      IntValue = CFEqual(v38, kCFBooleanTrue);
    }
    else
    {
      v43 = CFStringGetTypeID();
      if (v43 != CFGetTypeID(v38))
        goto LABEL_61;
      IntValue = CFStringGetIntValue((CFStringRef)v38);
    }
    *(_DWORD *)valuePtr = IntValue;
LABEL_61:
    CFRelease(v36);
    if (*(_DWORD *)valuePtr)
    {
      v50 = qword_100010218;
      if (!qword_100010218)
      {
        qword_100010218 = (uint64_t)os_log_create("com.apple.wififirmwareloaderdaemon", "wififirmwareloader");
        v238 = -92;
        dword_100010220 = open("/private/var/logs/wifiFirmwareLoader.log", 522);
        if (qword_100010218)
          v50 = qword_100010218;
        else
          v50 = &_os_log_default;
      }
      sub_1000082F8(v50, "WiFi Firmware Loader logging enabled\n", v44, v45, v46, v47, v48, v49, v238);
      if (dword_100010220)
      {
        *(_QWORD *)&v57 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v57;
        v252 = v57;
        v249 = v57;
        v250 = v57;
        v247 = v57;
        v248 = v57;
        *(_OWORD *)valuePtr = v57;
        v246 = v57;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v58 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v58);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "WiFi Firmware Loader logging enabled\n");
      }
      if (qword_100010218)
        v59 = qword_100010218;
      else
        v59 = &_os_log_default;
      sub_1000082F8(v59, "Kicking corecaptured to start logging...\n", v51, v52, v53, v54, v55, v56, v242);
      if (dword_100010220)
      {
        *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v60;
        v252 = v60;
        v249 = v60;
        v250 = v60;
        v247 = v60;
        v248 = v60;
        *(_OWORD *)valuePtr = v60;
        v246 = v60;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v61 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v61);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "Kicking corecaptured to start logging...\n");
      }
      if (&_CoreCaptureControlCreate)
        v62 = CoreCaptureControlCreate(kCFAllocatorDefault);
      else
        v62 = 0;
      if (&_CoreCaptureControlStart)
        CoreCaptureControlStart(v62);
    }
  }
  qword_1000101FC = 0xA00000002;
  dword_100010204 = 0;
  v63 = SCPreferencesCreate(0, CFSTR("com.apple.wifiFirmwareLoader"), CFSTR("/Library/Managed Preferences/mobile/com.apple.wifiFirmwareLoader.plist"));
  LODWORD(v243) = 0;
  if (v63)
  {
    v70 = v63;
    if (qword_100010218)
      v71 = qword_100010218;
    else
      v71 = &_os_log_default;
    sub_1000082F8(v71, "WiFi Firmware processing preferences\n", v64, v65, v66, v67, v68, v69, v238);
    if (dword_100010220)
    {
      *(_QWORD *)&v72 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v251 = v72;
      v252 = v72;
      v249 = v72;
      v250 = v72;
      v247 = v72;
      v248 = v72;
      *(_OWORD *)valuePtr = v72;
      v246 = v72;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      v73 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v73);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "WiFi Firmware processing preferences\n");
    }
    v74 = SCPreferencesGetValue(v70, CFSTR("assertionEnabled"));
    if (v74)
    {
      v75 = v74;
      v76 = CFBooleanGetTypeID();
      if (v76 == CFGetTypeID(v75))
        byte_1000101F8 = CFEqual(v75, kCFBooleanTrue) != 0;
    }
    v77 = (const __CFNumber *)SCPreferencesGetValue(v70, CFSTR("assertionType"));
    if (v77)
    {
      v78 = v77;
      v79 = CFNumberGetTypeID();
      if (v79 == CFGetTypeID(v78))
      {
        if (CFNumberGetValue(v78, kCFNumberIntType, &v243))
          LODWORD(qword_1000101FC) = v243;
      }
    }
    v80 = SCPreferencesGetValue(v70, CFSTR("assertionTimeout"));
    if (v80)
    {
      v81 = v80;
      v82 = CFNumberGetTypeID();
      if (v82 == CFGetTypeID(v81)
        && CFNumberGetValue((CFNumberRef)v81, kCFNumberIntType, &v243)
        && (int)v243 >= 1
        && (int)v243 <= 10)
      {
        HIDWORD(qword_1000101FC) = v243;
      }
    }
    v83 = (const __CFNumber *)SCPreferencesGetValue(v70, CFSTR("assertionReleaseDelay"));
    if (v83)
    {
      v84 = v83;
      v85 = CFNumberGetTypeID();
      if (v85 == CFGetTypeID(v84))
      {
        result = CFNumberGetValue(v84, kCFNumberIntType, &v243);
        if ((_DWORD)result)
        {
          if ((v243 & 0x80000000) == 0 && (int)v243 <= 3)
          {
            dword_100010204 = v243;
            if ((_DWORD)v243)
            {
              v92 = BYTE4(qword_1000101FC) + v243;
              if (__OFADD__(HIDWORD(qword_1000101FC), (_DWORD)v243))
              {
                __break(0x5500u);
                return result;
              }
              HIDWORD(qword_1000101FC) += v243;
              if (qword_100010218)
                v93 = qword_100010218;
              else
                v93 = &_os_log_default;
              sub_1000082F8(v93, "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n", v86, v87, v88, v89, v90, v91, v92);
              if (dword_100010220)
              {
                *(_QWORD *)&v94 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v94 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v251 = v94;
                v252 = v94;
                v249 = v94;
                v250 = v94;
                v247 = v94;
                v248 = v94;
                *(_OWORD *)valuePtr = v94;
                v246 = v94;
                errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
                time((time_t *)&errorbuf);
                v95 = localtime((const time_t *)&errorbuf);
                strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v95);
                dprintf(dword_100010220, "%s ", valuePtr);
                dprintf(dword_100010220, "WiFi Firmware processing preferences, adjusting timeout -> timeout[%u sec], adjusted[%u sec]\n", HIDWORD(qword_1000101FC), dword_100010204);
              }
            }
          }
        }
      }
    }
    v96 = qword_100010218;
    v97 = byte_1000101F8;
    if (qword_100010218)
    {
      switch((int)qword_1000101FC)
      {
        case 1:
          v98 = CFSTR("PreventUserIdleDisplaySleep");
          break;
        case 2:
          v98 = CFSTR("PreventSystemSleep");
          break;
        case 3:
          v98 = CFSTR("NoIdleSleepAssertion");
          break;
        case 4:
          v98 = CFSTR("NoDisplaySleepAssertion");
          break;
        default:
          goto LABEL_115;
      }
    }
    else if ((qword_1000101FC - 1) > 3)
    {
      v96 = &_os_log_default;
LABEL_115:
      v98 = CFSTR("PreventUserIdleSystemSleep");
    }
    else
    {
      v98 = off_10000C5E8[(qword_1000101FC - 1)];
      v96 = &_os_log_default;
    }
    CFStringGetCStringPtr(v98, 0);
    sub_1000082F8(v96, "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], assertionReleaseDelay[%u sec]\n", v99, v100, v101, v102, v103, v104, v97);
    if (dword_100010220)
    {
      *(_QWORD *)&v105 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v105 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v251 = v105;
      v252 = v105;
      v249 = v105;
      v250 = v105;
      v247 = v105;
      v248 = v105;
      *(_OWORD *)valuePtr = v105;
      v246 = v105;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      v106 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v106);
      dprintf(dword_100010220, "%s ", valuePtr);
      v107 = dword_100010220;
      v108 = byte_1000101F8;
      v109 = qword_1000101FC;
      if ((qword_1000101FC - 1) > 3)
        v110 = CFSTR("PreventUserIdleSystemSleep");
      else
        v110 = off_10000C5E8[(qword_1000101FC - 1)];
      CStringPtr = CFStringGetCStringPtr(v110, 0);
      dprintf(v107, "WiFi Firmware processing preferences using: assertionEnabled:%u, assertionType:%u mapped['%s'], timeout[%u sec], assertionReleaseDelay[%u sec]\n", v108, v109, CStringPtr, HIDWORD(qword_1000101FC), dword_100010204);
    }
    CFRelease(v70);
  }
  if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)xmmword_100010070), (int32x4_t)vceqzq_s64(*(int64x2_t *)&qword_100010088))))) & 1) != 0|| qword_1000100A0|| __PAIR128__(qword_1000100A8, 0) != *((unint64_t *)&xmmword_100010090 + 1))
  {
    if (qword_100010218)
      v112 = qword_100010218;
    else
      v112 = &_os_log_default;
    sub_1000082F8(v112, "Settings:\n", v64, v65, v66, v67, v68, v69, v238);
    if (dword_100010220)
    {
      *(_QWORD *)&v113 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v113 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v251 = v113;
      v252 = v113;
      v249 = v113;
      v250 = v113;
      v247 = v113;
      v248 = v113;
      *(_OWORD *)valuePtr = v113;
      v246 = v113;
      errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&errorbuf);
      v114 = localtime((const time_t *)&errorbuf);
      strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v114);
      dprintf(dword_100010220, "%s ", valuePtr);
      dprintf(dword_100010220, "Settings:\n");
    }
    if (qword_1000100A0 && CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0))
    {
      v115 = (void *)qword_100010218;
      v116 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
      v123 = (v115 ? v115 : &_os_log_default);
      sub_1000082F8(v123, "    pathPlatformConfig: %s\n", v117, v118, v119, v120, v121, v122, v116);
      if (dword_100010220)
      {
        *(_QWORD *)&v124 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v124 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v124;
        v252 = v124;
        v249 = v124;
        v250 = v124;
        v247 = v124;
        v248 = v124;
        *(_OWORD *)valuePtr = v124;
        v246 = v124;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v125 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v125);
        dprintf(dword_100010220, "%s ", valuePtr);
        v126 = dword_100010220;
        v127 = CFStringGetCStringPtr((CFStringRef)qword_1000100A0, 0);
        dprintf(v126, "    pathPlatformConfig: %s\n", v127);
      }
    }
    if (*((_QWORD *)&xmmword_100010070 + 1) && CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0))
    {
      v128 = qword_100010218;
      v129 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
      if (v128)
        v136 = v128;
      else
        v136 = &_os_log_default;
      sub_1000082F8(v136, "          pathFirmware: %s\n", v130, v131, v132, v133, v134, v135, v129);
      if (dword_100010220)
      {
        *(_QWORD *)&v143 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v143 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v143;
        v252 = v143;
        v249 = v143;
        v250 = v143;
        v247 = v143;
        v248 = v143;
        *(_OWORD *)valuePtr = v143;
        v246 = v143;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v144 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v144);
        dprintf(dword_100010220, "%s ", valuePtr);
        v145 = dword_100010220;
        v146 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010070 + 1), 0);
        dprintf(v145, "          pathFirmware: %s\n", v146);
      }
      if (qword_100010218)
        v147 = qword_100010218;
      else
        v147 = &_os_log_default;
      sub_1000082F8(v147, "                   mfg: %d\n", v137, v138, v139, v140, v141, v142, dword_1000100B0);
      if (dword_100010220)
      {
        *(_QWORD *)&v148 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v148 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v148;
        v252 = v148;
        v249 = v148;
        v250 = v148;
        v247 = v148;
        v248 = v148;
        *(_OWORD *)valuePtr = v148;
        v246 = v148;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v149 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v149);
        dprintf(dword_100010220, "%s ", valuePtr);
        dprintf(dword_100010220, "                   mfg: %d\n", dword_1000100B0);
      }
    }
    if ((_QWORD)xmmword_100010070 && CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0))
    {
      v150 = (void *)qword_100010218;
      v151 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
      v158 = (v150 ? v150 : &_os_log_default);
      sub_1000082F8(v158, "             pathNVRAM: %s\n", v152, v153, v154, v155, v156, v157, v151);
      if (dword_100010220)
      {
        *(_QWORD *)&v159 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v159 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v159;
        v252 = v159;
        v249 = v159;
        v250 = v159;
        v247 = v159;
        v248 = v159;
        *(_OWORD *)valuePtr = v159;
        v246 = v159;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v160 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v160);
        dprintf(dword_100010220, "%s ", valuePtr);
        v161 = dword_100010220;
        v162 = CFStringGetCStringPtr((CFStringRef)xmmword_100010070, 0);
        dprintf(v161, "             pathNVRAM: %s\n", v162);
      }
    }
    if (qword_100010080 && CFStringGetCStringPtr((CFStringRef)qword_100010080, 0))
    {
      v163 = (void *)qword_100010218;
      v164 = CFStringGetCStringPtr((CFStringRef)qword_100010080, 0);
      v171 = (v163 ? v163 : &_os_log_default);
      sub_1000082F8(v171, "             pathSignature: %s\n", v165, v166, v167, v168, v169, v170, v164);
      if (dword_100010220)
      {
        *(_QWORD *)&v172 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v172 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v172;
        v252 = v172;
        v249 = v172;
        v250 = v172;
        v247 = v172;
        v248 = v172;
        *(_OWORD *)valuePtr = v172;
        v246 = v172;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v173 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v173);
        dprintf(dword_100010220, "%s ", valuePtr);
        v174 = dword_100010220;
        v175 = CFStringGetCStringPtr((CFStringRef)qword_100010080, 0);
        dprintf(v174, "             pathSignature: %s\n", v175);
      }
    }
    if (*((_QWORD *)&xmmword_100010090 + 1) && CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0))
    {
      v176 = (void *)qword_100010218;
      v177 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0);
      v184 = (v176 ? v176 : &_os_log_default);
      sub_1000082F8(v184, "             pathPlatcfg: %s\n", v178, v179, v180, v181, v182, v183, v177);
      if (dword_100010220)
      {
        *(_QWORD *)&v185 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v185 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v185;
        v252 = v185;
        v249 = v185;
        v250 = v185;
        v247 = v185;
        v248 = v185;
        *(_OWORD *)valuePtr = v185;
        v246 = v185;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v186 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v186);
        dprintf(dword_100010220, "%s ", valuePtr);
        v187 = dword_100010220;
        v188 = CFStringGetCStringPtr(*((CFStringRef *)&xmmword_100010090 + 1), 0);
        dprintf(v187, "             pathPlatcfg: %s\n", v188);
      }
    }
    if (qword_100010088 && CFStringGetCStringPtr((CFStringRef)qword_100010088, 0))
    {
      v189 = (void *)qword_100010218;
      v190 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
      v197 = (v189 ? v189 : &_os_log_default);
      sub_1000082F8(v197, "               pathReg: %s\n", v191, v192, v193, v194, v195, v196, v190);
      if (dword_100010220)
      {
        *(_QWORD *)&v198 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v198 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v198;
        v252 = v198;
        v249 = v198;
        v250 = v198;
        v247 = v198;
        v248 = v198;
        *(_OWORD *)valuePtr = v198;
        v246 = v198;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v199 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v199);
        dprintf(dword_100010220, "%s ", valuePtr);
        v200 = dword_100010220;
        v201 = CFStringGetCStringPtr((CFStringRef)qword_100010088, 0);
        dprintf(v200, "               pathReg: %s\n", v201);
      }
    }
    if ((_QWORD)xmmword_100010090 && CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0))
    {
      v202 = (void *)qword_100010218;
      v203 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
      v210 = (v202 ? v202 : &_os_log_default);
      sub_1000082F8(v210, "             pathTxCap: %s\n", v204, v205, v206, v207, v208, v209, v203);
      if (dword_100010220)
      {
        *(_QWORD *)&v211 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v211 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v211;
        v252 = v211;
        v249 = v211;
        v250 = v211;
        v247 = v211;
        v248 = v211;
        *(_OWORD *)valuePtr = v211;
        v246 = v211;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v212 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v212);
        dprintf(dword_100010220, "%s ", valuePtr);
        v213 = dword_100010220;
        v214 = CFStringGetCStringPtr((CFStringRef)xmmword_100010090, 0);
        dprintf(v213, "             pathTxCap: %s\n", v214);
      }
    }
    if (qword_1000100A8 && CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0))
    {
      v215 = (void *)qword_100010218;
      v216 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
      v223 = (v215 ? v215 : &_os_log_default);
      sub_1000082F8(v223, "             pathMSFCal: %s\n", v217, v218, v219, v220, v221, v222, v216);
      if (dword_100010220)
      {
        *(_QWORD *)&v224 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v224 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v251 = v224;
        v252 = v224;
        v249 = v224;
        v250 = v224;
        v247 = v224;
        v248 = v224;
        *(_OWORD *)valuePtr = v224;
        v246 = v224;
        errorbuf = (char *)0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&errorbuf);
        v225 = localtime((const time_t *)&errorbuf);
        strftime(valuePtr, 0x80uLL, "%b %d %H:%M:%S", v225);
        dprintf(dword_100010220, "%s ", valuePtr);
        v226 = dword_100010220;
        v227 = CFStringGetCStringPtr((CFStringRef)qword_1000100A8, 0);
        dprintf(v226, "             pathMSFCal: %s\n", v227);
      }
    }
  }
  signal(2, (void (__cdecl *)(int))sub_1000079E4);
  signal(3, (void (__cdecl *)(int))sub_1000079E4);
  signal(15, (void (__cdecl *)(int))sub_1000079E4);
  signal(1, (void (__cdecl *)(int))sub_1000079E4);
  qword_100010060 = (uint64_t)CFRunLoopGetCurrent();
  os_transaction_create("com.apple.WiFiFirmwareLoader");
  Current = CFAbsoluteTimeGetCurrent();
  v229 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 360.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100007A10, 0);
  qword_100010068 = (uint64_t)v229;
  if (v229)
  {
    CFRunLoopAddTimer((CFRunLoopRef)qword_100010060, v229, kCFRunLoopDefaultMode);
    sub_1000014D4(v230, v231, v232, v233, v234, v235, v236, v237);
    CFRunLoopRemoveTimer((CFRunLoopRef)qword_100010060, (CFRunLoopTimerRef)qword_100010068, kCFRunLoopDefaultMode);
    sub_100007A24();
  }
  return HIDWORD(qword_100010100);
}

uint64_t sub_1000079E4(uint64_t result)
{
  if (result <= 0xF && ((1 << result) & 0x800C) != 0)
    sub_100007A24();
  return result;
}

void sub_100007A10()
{
  __CFRunLoop *Current;

  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void sub_100007A24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  tm *v8;
  char v9;
  time_t v10;
  char v11[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  signal(2, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  if (qword_100010218)
    v6 = qword_100010218;
  else
    v6 = &_os_log_default;
  sub_1000082F8(v6, "Shutting down\n", v0, v1, v2, v3, v4, v5, v9);
  if (dword_100010220)
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v7;
    v18 = v7;
    v15 = v7;
    v16 = v7;
    v13 = v7;
    v14 = v7;
    *(_OWORD *)v11 = v7;
    v12 = v7;
    v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    v8 = localtime(&v10);
    strftime(v11, 0x80uLL, "%b %d %H:%M:%S", v8);
    dprintf(dword_100010220, "%s ", v11);
    dprintf(dword_100010220, "Shutting down\n");
  }
  if ((_QWORD)xmmword_100010070)
    CFRelease((CFTypeRef)xmmword_100010070);
  *(_QWORD *)&xmmword_100010070 = 0;
  if (*((_QWORD *)&xmmword_100010070 + 1))
    CFRelease(*((CFTypeRef *)&xmmword_100010070 + 1));
  *((_QWORD *)&xmmword_100010070 + 1) = 0;
  if (qword_100010088)
    CFRelease((CFTypeRef)qword_100010088);
  qword_100010088 = 0;
  if ((_QWORD)xmmword_100010090)
    CFRelease((CFTypeRef)xmmword_100010090);
  *(_QWORD *)&xmmword_100010090 = 0;
  if (dword_100010220)
  {
    close(dword_100010220);
    dword_100010220 = 0;
  }
  if (qword_100010218)
    qword_100010218 = 0;
  exit(SHIDWORD(qword_100010100));
}

void sub_100007B8C(id a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  tm *v10;
  char v11;
  time_t v12;
  char v13[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (qword_100010218)
    v8 = qword_100010218;
  else
    v8 = &_os_log_default;
  sub_1000082F8(v8, "Woken up by IOKit matching\n", v2, v3, v4, v5, v6, v7, v11);
  if (dword_100010220)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v9;
    v20 = v9;
    v17 = v9;
    v18 = v9;
    v15 = v9;
    v16 = v9;
    *(_OWORD *)v13 = v9;
    v14 = v9;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    v10 = localtime(&v12);
    strftime(v13, 0x80uLL, "%b %d %H:%M:%S", v10);
    dprintf(dword_100010220, "%s ", v13);
    dprintf(dword_100010220, "Woken up by IOKit matching\n");
  }
}

uint64_t sub_100007C74()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass(&unk_10000C608);
  qword_100010210 = result;
  return result;
}

uint64_t sub_100007C98(uint64_t a1)
{
  mach_port_t v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 24))
  {
    v2 = *(_DWORD *)(a1 + 20);
    if (v2)
      IOConnectCallScalarMethod(v2, 1u, 0, 0, 0, 0);
  }
  result = *(unsigned int *)(a1 + 20);
  if ((_DWORD)result)
    result = IOServiceClose(result);
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

BOOL sub_100007CF0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef sub_100007D00(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, a2, CFSTR("WiFiUserClient@%p"), a1);
}

CFStringRef sub_100007D38(uint64_t a1)
{
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0, CFSTR("WiFiUserClient@%p"), a1);
}

mach_vm_address_t sub_100007D74(io_connect_t a1, uint32_t a2, mach_vm_size_t *ofSize)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  kern_return_t v10;
  NSObject *v11;
  __int128 v12;
  tm *v13;
  time_t v15;
  mach_vm_address_t atAddress;
  char v17[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  atAddress = 0xAAAAAAAAAAAAAAAALL;
  v10 = IOConnectMapMemory(a1, a2, mach_task_self_, &atAddress, ofSize, 1u);
  if (qword_100010218)
    v11 = qword_100010218;
  else
    v11 = &_os_log_default;
  sub_1000082F8(v11, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v4, v5, v6, v7, v8, v9, v10);
  if (dword_100010220)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23 = v12;
    v24 = v12;
    v21 = v12;
    v22 = v12;
    v19 = v12;
    v20 = v12;
    *(_OWORD *)v17 = v12;
    v18 = v12;
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    v13 = localtime(&v15);
    strftime(v17, 0x80uLL, "%b %d %H:%M:%S", v13);
    dprintf(dword_100010220, "%s ", v17);
    dprintf(dword_100010220, "WiFiUserClientGetMemoryDescriptorForType return %d for type %d\n", v10, a2);
  }
  return atAddress;
}

uint64_t sub_100007E98(const char *a1, off_t *a2)
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
  NSObject *v16;
  NSObject *v17;
  __int128 v18;
  tm *v19;
  NSObject *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  tm *v29;
  int v30;
  int *v31;
  const char *v32;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  __int128 v42;
  tm *v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  tm *v52;
  int *v53;
  NSObject *v54;
  __int128 v55;
  tm *v56;
  char *v57;
  char *v58;
  time_t v59;
  char v60[16];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68[1025];
  stat v69;

  memset(&v69, 0, sizeof(v69));
  bzero(v68, 0x401uLL);
  if (!a1 || !a2)
  {
    if (qword_100010218)
      v54 = qword_100010218;
    else
      v54 = &_os_log_default;
    sub_1000082F8(v54, "'%s' failed !!\n", v4, v5, v6, v7, v8, v9, (char)"getSizeFromFile");
    if (dword_100010220)
    {
      *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v66 = v55;
      v67 = v55;
      v64 = v55;
      v65 = v55;
      v62 = v55;
      v63 = v55;
      *(_OWORD *)v60 = v55;
      v61 = v55;
      v59 = 0xAAAAAAAAAAAAAAAALL;
      time(&v59);
      v56 = localtime(&v59);
      strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v56);
      dprintf(dword_100010220, "%s ", v60);
      dprintf(dword_100010220, "'%s' failed !!\n");
    }
    return 0;
  }
  realpath_DARWIN_EXTSN(a1, v68);
  v16 = &_os_log_default;
  if (qword_100010218)
    v17 = qword_100010218;
  else
    v17 = &_os_log_default;
  v58 = v68;
  sub_1000082F8(v17, "%s: path['%s'], resolved['%s']\n", v10, v11, v12, v13, v14, v15, (char)"getSizeFromFile");
  if (dword_100010220)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v66 = v18;
    v67 = v18;
    v64 = v18;
    v65 = v18;
    v62 = v18;
    v63 = v18;
    *(_OWORD *)v60 = v18;
    v61 = v18;
    v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    v19 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v19);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "getSizeFromFile", a1, v68);
  }
  if (lstat(v68, &v69))
  {
    v20 = qword_100010218;
    v21 = __error();
    if (!v20)
      v20 = &_os_log_default;
    strerror(*v21);
    sub_100008454(v20, "Error: Could not stat %s (%s)\n", v22, v23, v24, v25, v26, v27, (char)v68);
    if (!dword_100010220)
      return 0;
    *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v66 = v28;
    v67 = v28;
    v64 = v28;
    v65 = v28;
    v62 = v28;
    v63 = v28;
    *(_OWORD *)v60 = v28;
    v61 = v28;
    v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    v29 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v29);
    dprintf(dword_100010220, "%s ", v60);
    v30 = dword_100010220;
    v31 = __error();
    v57 = strerror(*v31);
    v32 = "Error: Could not stat %s (%s)\n";
    goto LABEL_13;
  }
  v34 = open(v68, 0);
  if (qword_100010218)
    v16 = qword_100010218;
  if (v34 < 0)
  {
    v44 = __error();
    strerror(*v44);
    sub_1000082F8(v16, "Could not Open file %s (%s)\n", v45, v46, v47, v48, v49, v50, (char)v68);
    if (!dword_100010220)
      return 0;
    *(_QWORD *)&v51 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v66 = v51;
    v67 = v51;
    v64 = v51;
    v65 = v51;
    v62 = v51;
    v63 = v51;
    *(_OWORD *)v60 = v51;
    v61 = v51;
    v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    v52 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v52);
    dprintf(dword_100010220, "%s ", v60);
    v30 = dword_100010220;
    v53 = __error();
    v57 = strerror(*v53);
    v32 = "Could not Open file %s (%s)\n";
LABEL_13:
    dprintf(v30, v32, v68, v57, v58);
    return 0;
  }
  v41 = v34;
  sub_1000082F8(v16, "Get size of \"%s\", size = %d bytes\n", v35, v36, v37, v38, v39, v40, (char)v68);
  if (dword_100010220)
  {
    *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v66 = v42;
    v67 = v42;
    v64 = v42;
    v65 = v42;
    v62 = v42;
    v63 = v42;
    *(_OWORD *)v60 = v42;
    v61 = v42;
    v59 = 0xAAAAAAAAAAAAAAAALL;
    time(&v59);
    v43 = localtime(&v59);
    strftime(v60, 0x80uLL, "%b %d %H:%M:%S", v43);
    dprintf(dword_100010220, "%s ", v60);
    dprintf(dword_100010220, "Get size of \"%s\", size = %d bytes\n", v68, LODWORD(v69.st_size));
  }
  *a2 = v69.st_size;
  close(v41);
  return 1;
}

void sub_1000082F8(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  unint64_t v12;
  _BYTE info[12];
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  char *v17;
  char __str[2048];

  bzero(__str, 0x800uLL);
  vsnprintf(__str, 0x800uLL, a2, &a9);
  v11 = mach_continuous_time();
  *(_QWORD *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  if (is_mul_ok(v11, *(unsigned int *)info) && *(_DWORD *)&info[4])
    v12 = v11 * *(unsigned int *)info / *(unsigned int *)&info[4];
  else
    v12 = 0;
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)info = 134218498;
    *(_QWORD *)&info[4] = v12 / 0x3B9ACA00;
    v14 = 2048;
    v15 = v12 % 0x3B9ACA00 / 0x3E8;
    v16 = 2082;
    v17 = __str;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEFAULT, "%06llu.%06llu %{public}s", info, 0x20u);
  }
}

void sub_100008454(NSObject *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v11;
  unint64_t v12;
  _BYTE info[12];
  __int16 v14;
  unint64_t v15;
  __int16 v16;
  char *v17;
  char __str[2048];

  bzero(__str, 0x800uLL);
  vsnprintf(__str, 0x800uLL, a2, &a9);
  v11 = mach_continuous_time();
  *(_QWORD *)info = 0xAAAAAAAAAAAAAAAALL;
  mach_timebase_info((mach_timebase_info_t)info);
  if (is_mul_ok(v11, *(unsigned int *)info) && *(_DWORD *)&info[4])
    v12 = v11 * *(unsigned int *)info / *(unsigned int *)&info[4];
  else
    v12 = 0;
  if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)info = 134218498;
    *(_QWORD *)&info[4] = v12 / 0x3B9ACA00;
    v14 = 2048;
    v15 = v12 % 0x3B9ACA00 / 0x3E8;
    v16 = 2082;
    v17 = __str;
    _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "%06llu.%06llu %{public}s", info, 0x20u);
  }
}

uint64_t sub_1000085B4(const char *a1, void *a2, off_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  tm *v21;
  int v22;
  int *v23;
  const char *v24;
  int v25;
  NSObject *v26;
  __int128 v27;
  tm *v28;
  uint64_t v29;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  __int128 v40;
  tm *v41;
  NSObject *v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  tm *v51;
  int v52;
  int *v53;
  int *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  tm *v63;
  int *v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  tm *v80;
  off_t st_size;
  NSObject *v82;
  __int128 v83;
  tm *v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  tm *v93;
  int *v94;
  ssize_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  NSObject *v103;
  int *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  tm *v112;
  int v113;
  int *v114;
  NSObject *v115;
  __int128 v116;
  tm *v117;
  char v118;
  char *v119;
  char *v120;
  time_t v121;
  char v122[16];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  char v130[1025];
  stat v131;

  memset(&v131, 0, sizeof(v131));
  bzero(v130, 0x401uLL);
  if (!a2 || !a3)
  {
    if (qword_100010218)
      v26 = qword_100010218;
    else
      v26 = &_os_log_default;
    sub_100008454(v26, "Error: copyDataFromFile data/datalength is null\n", v6, v7, v8, v9, v10, v11, v118);
    if (!dword_100010220)
      return 0;
    *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v128 = v27;
    v129 = v27;
    v126 = v27;
    v127 = v27;
    v124 = v27;
    v125 = v27;
    *(_OWORD *)v122 = v27;
    v123 = v27;
    v121 = 0xAAAAAAAAAAAAAAAALL;
    time(&v121);
    v28 = localtime(&v121);
    strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v28);
    dprintf(dword_100010220, "%s ", v122);
    v25 = dword_100010220;
    v24 = "Error: copyDataFromFile data/datalength is null\n";
    goto LABEL_14;
  }
  if (!lstat(a1, &v131))
  {
    v31 = realpath_DARWIN_EXTSN(a1, v130);
    v38 = qword_100010218;
    if (!v31)
    {
      v54 = __error();
      if (v38)
        v55 = v38;
      else
        v55 = &_os_log_default;
      strerror(*v54);
      sub_100008454(v55, "Error: Could not resolve path %s (%s)\n", v56, v57, v58, v59, v60, v61, (char)a1);
      if (!dword_100010220)
        return 0;
      *(_QWORD *)&v62 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v128 = v62;
      v129 = v62;
      v126 = v62;
      v127 = v62;
      v124 = v62;
      v125 = v62;
      *(_OWORD *)v122 = v62;
      v123 = v62;
      v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      v63 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v63);
      dprintf(dword_100010220, "%s ", v122);
      v22 = dword_100010220;
      v64 = __error();
      v119 = (char *)a1;
      v120 = strerror(*v64);
      v24 = "Error: Could not resolve path %s (%s)\n";
      goto LABEL_8;
    }
    if (qword_100010218)
      v39 = qword_100010218;
    else
      v39 = &_os_log_default;
    sub_1000082F8(v39, "%s: path['%s'], resolved['%s']\n", v32, v33, v34, v35, v36, v37, (char)"copyDataFromFile");
    if (dword_100010220)
    {
      *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v128 = v40;
      v129 = v40;
      v126 = v40;
      v127 = v40;
      v124 = v40;
      v125 = v40;
      *(_OWORD *)v122 = v40;
      v123 = v40;
      v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      v41 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v41);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "%s: path['%s'], resolved['%s']\n", "copyDataFromFile", a1, v130);
    }
    if (lstat(v130, &v131))
    {
      v42 = qword_100010218;
      v43 = __error();
      if (!v42)
        v42 = &_os_log_default;
      strerror(*v43);
      sub_100008454(v42, "Error: Could not stat %s (%s)\n", v44, v45, v46, v47, v48, v49, (char)v130);
      if (!dword_100010220)
        return 0;
      *(_QWORD *)&v50 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v128 = v50;
      v129 = v50;
      v126 = v50;
      v127 = v50;
      v124 = v50;
      v125 = v50;
      *(_OWORD *)v122 = v50;
      v123 = v50;
      v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      v51 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v51);
      dprintf(dword_100010220, "%s ", v122);
      v52 = dword_100010220;
      v53 = __error();
      v119 = v130;
      v120 = strerror(*v53);
      v24 = "Error: Could not stat %s (%s)\n";
LABEL_28:
      v25 = v52;
      goto LABEL_14;
    }
    v65 = open(v130, 0);
    if (qword_100010218)
      v72 = qword_100010218;
    else
      v72 = &_os_log_default;
    if (v65 < 0)
    {
      v85 = __error();
      strerror(*v85);
      sub_1000082F8(v72, "Could not Open file %s (%s)\n", v86, v87, v88, v89, v90, v91, (char)v130);
      if (!dword_100010220)
        return 0;
      *(_QWORD *)&v92 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v92 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v128 = v92;
      v129 = v92;
      v126 = v92;
      v127 = v92;
      v124 = v92;
      v125 = v92;
      *(_OWORD *)v122 = v92;
      v123 = v92;
      v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      v93 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v93);
      dprintf(dword_100010220, "%s ", v122);
      v52 = dword_100010220;
      v94 = __error();
      v119 = v130;
      v120 = strerror(*v94);
      v24 = "Could not Open file %s (%s)\n";
      goto LABEL_28;
    }
    v73 = v65;
    sub_1000082F8(v72, "Copying \"%s\", file size = %d bytes\n", v66, v67, v68, v69, v70, v71, (char)v130);
    if (dword_100010220)
    {
      *(_QWORD *)&v79 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v128 = v79;
      v129 = v79;
      v126 = v79;
      v127 = v79;
      v124 = v79;
      v125 = v79;
      *(_OWORD *)v122 = v79;
      v123 = v79;
      v121 = 0xAAAAAAAAAAAAAAAALL;
      time(&v121);
      v80 = localtime(&v121);
      strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v80);
      dprintf(dword_100010220, "%s ", v122);
      dprintf(dword_100010220, "Copying \"%s\", file size = %d bytes\n", v130, LODWORD(v131.st_size));
    }
    st_size = v131.st_size;
    if (v131.st_size > (unint64_t)*a3)
    {
      if (qword_100010218)
        v82 = qword_100010218;
      else
        v82 = &_os_log_default;
      sub_100008454(v82, "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n", v131.st_size, v74, v75, v76, v77, v78, v131.st_size);
      if (dword_100010220)
      {
        *(_QWORD *)&v83 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v83 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v128 = v83;
        v129 = v83;
        v126 = v83;
        v127 = v83;
        v124 = v83;
        v125 = v83;
        *(_OWORD *)v122 = v83;
        v123 = v83;
        v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        v84 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v84);
        dprintf(dword_100010220, "%s ", v122);
        dprintf(dword_100010220, "Error: copyDataFromFile ilestat.st_size %lld is bigger then supplied buffer %lld\n", v131.st_size, *a3);
      }
      close(v73);
      return 0;
    }
    *a3 = v131.st_size;
    v95 = read(v73, a2, st_size);
    if (v95 < 0)
    {
      v103 = qword_100010218;
      v104 = __error();
      if (!v103)
        v103 = &_os_log_default;
      strerror(*v104);
      sub_100008454(v103, "Error: read %s (%s)\n", v105, v106, v107, v108, v109, v110, (char)a1);
      if (dword_100010220)
      {
        *(_QWORD *)&v111 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v111 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v128 = v111;
        v129 = v111;
        v126 = v111;
        v127 = v111;
        v124 = v111;
        v125 = v111;
        *(_OWORD *)v122 = v111;
        v123 = v111;
        v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        v112 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v112);
        dprintf(dword_100010220, "%s ", v122);
        v113 = dword_100010220;
        v114 = __error();
        strerror(*v114);
        dprintf(v113, "Error: read %s (%s)\n");
      }
    }
    else
    {
      v102 = v95;
      if (v95 == v131.st_size)
      {
        v29 = 1;
LABEL_62:
        close(v73);
        return v29;
      }
      if (qword_100010218)
        v115 = qword_100010218;
      else
        v115 = &_os_log_default;
      sub_100008454(v115, "Error: Only read %ld of %d files\n", v96, v97, v98, v99, v100, v101, v102);
      if (dword_100010220)
      {
        *(_QWORD *)&v116 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v116 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v128 = v116;
        v129 = v116;
        v126 = v116;
        v127 = v116;
        v124 = v116;
        v125 = v116;
        *(_OWORD *)v122 = v116;
        v123 = v116;
        v121 = 0xAAAAAAAAAAAAAAAALL;
        time(&v121);
        v117 = localtime(&v121);
        strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v117);
        dprintf(dword_100010220, "%s ", v122);
        dprintf(dword_100010220, "Error: Only read %ld of %d files\n");
      }
    }
    v29 = 0;
    goto LABEL_62;
  }
  v12 = qword_100010218;
  v13 = __error();
  if (!v12)
    v12 = &_os_log_default;
  strerror(*v13);
  sub_100008454(v12, "Error: Could not stat %s (%s)\n", v14, v15, v16, v17, v18, v19, (char)a1);
  if (!dword_100010220)
    return 0;
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v128 = v20;
  v129 = v20;
  v126 = v20;
  v127 = v20;
  v124 = v20;
  v125 = v20;
  *(_OWORD *)v122 = v20;
  v123 = v20;
  v121 = 0xAAAAAAAAAAAAAAAALL;
  time(&v121);
  v21 = localtime(&v121);
  strftime(v122, 0x80uLL, "%b %d %H:%M:%S", v21);
  dprintf(dword_100010220, "%s ", v122);
  v22 = dword_100010220;
  v23 = __error();
  v119 = (char *)a1;
  v120 = strerror(*v23);
  v24 = "Error: Could not stat %s (%s)\n";
LABEL_8:
  v25 = v22;
LABEL_14:
  dprintf(v25, v24, v119, v120);
  return 0;
}

CFMutableStringRef sub_100008DC8(const __CFArray *a1, const void *a2, _DWORD *a3, const __CFString *a4)
{
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const __CFDictionary *ValueAtIndex;
  const __CFString *Value;
  CFMutableStringRef MutableCopy;
  const __CFString *v14;
  CFTypeID v15;
  CFMutableStringRef v16;
  const char *CStringPtr;
  off_t v19;

  *a3 = -1;
  if (!a1)
    return 0;
  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v9 = Count;
  v10 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
    if (!CFDictionaryGetValue(ValueAtIndex, a2))
      goto LABEL_12;
    Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, a2);
    MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 255, Value);
    if (!MutableCopy)
      goto LABEL_12;
    v14 = MutableCopy;
    v15 = CFGetTypeID(MutableCopy);
    if (v15 == CFStringGetTypeID())
    {
      v19 = 0xAAAAAAAAAAAAAAAALL;
      v16 = CFStringCreateMutableCopy(kCFAllocatorDefault, 0, a4);
      CFStringAppend(v16, v14);
      CStringPtr = CFStringGetCStringPtr(v16, 0);
      if ((sub_100007E98(CStringPtr, &v19) & 1) == 0)
      {
        CFRelease(v16);
        goto LABEL_11;
      }
      if (v16)
        break;
    }
LABEL_11:
    CFRelease(v14);
LABEL_12:
    if (v9 == ++v10)
      return 0;
  }
  CFRelease(v14);
  *a3 = v10;
  return v16;
}

BOOL sub_100008F3C(_BOOL8 result, const void *a2)
{
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  if (result)
  {
    v3 = (const __CFArray *)result;
    Count = CFArrayGetCount((CFArrayRef)result);
    v5 = Count - 1;
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v6 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
        Value = CFDictionaryGetValue(ValueAtIndex, a2);
        result = Value != 0;
        if (Value)
          break;
      }
      while (v5 != v6++);
    }
  }
  return result;
}
