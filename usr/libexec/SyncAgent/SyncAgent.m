void sub_100001438(uint64_t a1)
{
  double Current;
  int v3;
  char *v4;
  int v5;
  size_t v6;
  const char *v7;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v9;
  uint64_t v10;
  CFTypeRef cf;
  size_t size;
  int v13[4];
  uint64_t v14;

  cf = 0;
  v9 = DLGetDeviceLinkConnectionContext();
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 5, CFSTR("incomingConnectionCallback called"));
  v10 = a1;
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 6, CFSTR("Checking for a running data migrator"));
  Current = CFAbsoluteTimeGetCurrent();
  v3 = 0;
  while (1)
  {
    if (!v3)
      goto LABEL_11;
    if (v3 == -1)
      break;
    if (DLShouldLog(4))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 4, CFSTR("Running DataMigrator found with pid %d. Sleeping and waiting for it to finish..."));
    sleep(1u);
LABEL_11:
    v14 = 0;
    *(_OWORD *)v13 = xmmword_100005E48;
    size = 0;
    v3 = sysctl(v13, 3u, 0, &size, 0, 0);
    if (!v3)
    {
      v4 = (char *)malloc_type_malloc(size, 0x1EB90317uLL);
      v5 = sysctl(v13, 3u, v4, &size, 0, 0);
      if (v5)
      {
        v3 = v5;
      }
      else
      {
        if (size < 0x288)
        {
LABEL_20:
          free(v4);
          v3 = -1;
          goto LABEL_21;
        }
        v6 = size / 0x288;
        v7 = v4 + 243;
        while (1)
        {
          v3 = *(_DWORD *)(v7 - 203);
          if (v3 >= 1 && !strncmp("DataMigrator", v7, 0x10uLL))
            break;
          v7 += 648;
          if (!--v6)
            goto LABEL_20;
        }
      }
      free(v4);
    }
LABEL_21:
    if (CFAbsoluteTimeGetCurrent() - Current > 60.0)
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 3, CFSTR("Waited too long for the DataMigrator to finish and it didn't, so we're giving up."));
      if (DLDisconnect(v10, CFSTR("Another instance of sync or backup/restore is currently running"), &cf))
      {
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 3, CFSTR("Could not disconnect: %@"));
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        DLKillConnection(v10, &cf);
      }
      return;
    }
  }
  if (DLShouldLog(6))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 6, CFSTR("DataMigrator isn't running, so we're ready to report back to the computer."));
  if (DLDeviceReady(v10, &cf))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "incomingConnectionCallback", 3, CFSTR("DLDeviceReady failed: %@"));
    if (cf)
      CFRelease(cf);
  }
  else
  {
    *(_QWORD *)(v9 + 56) = kCFBooleanTrue;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSync.SyncAgent.kSyncAgentSyncStarted"), 0, 0, 0);
    sub_100003F64();
  }
}

uint64_t sub_1000017C8()
{
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "connectionMadeCallback", 5, CFSTR("connectionMadeCallback called"));
  return sub_100003F64();
}

uint64_t sub_100001804()
{
  uint64_t result;

  result = DLShouldLog(5);
  if ((_DWORD)result)
    return _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "connectionFailedCallback", 5, CFSTR("connectionFailedCallback called with reason %@"));
  return result;
}

void sub_100001858()
{
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "acceptFailedCallback", 5, CFSTR("acceptFailedCallback called with reason %@"));
  exit(0);
}

id sub_1000018A4(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  const __CFDictionary *v6;
  __CFDictionary *MutableCopy;
  __CFRunLoop *Current;
  uint64_t v10;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v10 = a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "disconnectCallback", 5, CFSTR("disconnectCallback called with reason: %@"));
  }
  if (*(const CFBooleanRef *)(v5 + 48) == kCFBooleanTrue)
  {
    if (j__DLDeleteDeviceLinkConnection(a1, &cf))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "disconnectCallback", 3, CFSTR("Error %d calling DLDeleteDeviceLinkConnection: %@"));
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "disconnectCallback", 5, CFSTR("Sync Agent finished running one shot, exiting..."));
  }
  else
  {
    if (dword_10000C0D0 == 1)
    {
      v6 = (const __CFDictionary *)DLGetDeviceLinkConnectionInfo(a1);
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
      if (!sub_100003D0C(MutableCopy, dword_10000C0D0))
      {
        if (DLShouldLog(5))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "disconnectCallback", 5, CFSTR("Timed out waiting for connection from Launchd, exiting..."));
        objc_msgSend(v4, "drain", v10);
        exit(0);
      }
    }
    else
    {
      MutableCopy = 0;
    }
    if (DLWaitForConnection(a1, MutableCopy, &cf))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "disconnectCallback", 3, CFSTR("Error %d calling DLWaitForConnection: %@"));
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  sub_100003FE4(v5);
  sub_100004440();
  byte_10000C329 = 0;
  SBSSetStatusBarShowsSyncActivity(0, 600);
  return objc_msgSend(v4, "drain");
}

id sub_100001ADC(uint64_t a1)
{
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "connectionLostCallback", 5, CFSTR("connectionLostCallback called"));
  return sub_1000018A4(a1, (uint64_t)CFSTR("Lost connection"));
}

uint64_t sub_100001B30()
{
  uint64_t result;

  result = DLShouldLog(5);
  if ((_DWORD)result)
    return _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "processMessageCallback", 5, CFSTR("processMessageCallback called with message: %@"));
  return result;
}

uint64_t sub_100001B84()
{
  uint64_t result;

  result = DLShouldLog(5);
  if ((_DWORD)result)
    return _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "pingCallback", 5, CFSTR("pingCallback called with reason: %@"));
  return result;
}

id sub_100001BD8(uint64_t a1, const void *a2, NSDictionary *a3, const __CFBoolean *a4, uint64_t a5)
{
  id v10;
  uint64_t v11;
  CFIndex Count;
  uint64_t v13;
  const char *v14;
  __CFArray *Mutable;
  __CFArray *v16;
  char **v17;
  const __CFString *v18;
  size_t v19;
  char *v20;
  char *v21;
  CFIndex Length;
  char *v23;
  CFIndex v24;
  int v25;
  int v26;
  int v27;
  const __CFString *v28;
  CFIndex v29;
  char *v30;
  CFIndex v31;
  size_t v32;
  CFURLRef v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v42;
  CFTypeRef v43;
  const char *v44;
  const __CFBoolean *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CFTypeRef v52;
  CFTypeRef cf;
  stat v54;

  v10 = objc_alloc_init((Class)NSAutoreleasePool);
  v52 = 0;
  v11 = DLGetDeviceLinkConnectionContext(a1);
  v51 = 0;
  if (!a3)
    a3 = +[NSDictionary dictionary](NSDictionary, "dictionary");
  Count = CFDictionaryGetCount((CFDictionaryRef)a3);
  v13 = DLShouldLog(5);
  if ((_DWORD)v13)
  {
    v14 = "s";
    if (Count == 1)
      v14 = (const char *)&unk_100005E92;
    v45 = a4;
    v46 = a5;
    v42 = a2;
    v43 = (CFTypeRef)Count;
    v44 = v14;
    v13 = _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "processChangesCallback", 5, CFSTR("processChangesCallback called for data class %@, %d change%s, moreComing %@, info: %@"));
  }
  if (SyncPlaybackEnabled(v13))
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    v16 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(v16, a2);
    CFArrayAppendValue(Mutable, v16);
    CFRelease(v16);
    CFDictionaryApplyFunction((CFDictionaryRef)a3, (CFDictionaryApplierFunction)sub_100004264, Mutable);
    v17 = &selRef_dictionary;
    if (!qword_10000C338)
      qword_10000C338 = (uint64_t)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
    if (CFArrayGetCount(Mutable) >= 2)
      CFArrayAppendValue((CFMutableArrayRef)qword_10000C338, Mutable);
    if (kCFBooleanFalse == a4)
    {
      if (qword_10000C338 && CFArrayGetCount((CFArrayRef)qword_10000C338))
      {
        if (qword_10000C340)
        {
          CFDictionaryAddValue((CFMutableDictionaryRef)qword_10000C340, CFSTR("data class"), a2);
          CFArrayInsertValueAtIndex((CFMutableArrayRef)qword_10000C338, 0, (const void *)qword_10000C340);
        }
        v49 = qword_10000C338;
        cf = 0;
        if (DLShouldLog(5))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_saveSyncPlayback", 5, CFSTR("Saving sync playback for data class '%@'"));
        v50 = v11;
        v48 = a5;
        v18 = CFStringCreateWithFormat(0, 0, CFSTR("%@/%@"), CFSTR("/Library/Logs/MobileSync"), a2, v44, v45, v46);
        if (DLShouldLog(5))
        {
          v42 = v18;
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_createPathToNextSyncPlaybackFile", 5, CFSTR("path is: %@"));
        }
        v19 = CFStringGetLength(v18) + 24;
        v20 = (char *)malloc_type_malloc(v19, 0xB2FACFD8uLL);
        if (v20)
        {
          v21 = v20;
          Length = CFStringGetLength(v18);
          v23 = (char *)malloc_type_malloc(Length + 1, 0x40612E16uLL);
          v24 = CFStringGetLength(v18);
          if (!CFStringGetCString(v18, v23, v24 + 1, 0x600u) && DLShouldLog(3))
            _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_createPathToNextSyncPlaybackFile", 3, CFSTR("Sync playback path string conversion failed."));
          v47 = v10;
          DLEnsureDirectoryExists(v18);
          if (v18)
            CFRelease(v18);
          v25 = 0;
          memset(&v54, 0, sizeof(v54));
          do
          {
            v26 = v25 + 1;
            snprintf(v21, v19, "%s/%s.%02d.plist", v23, "SyncPlayback", v25);
            v27 = stat(v21, &v54);
            v25 = v26;
          }
          while (!v27);
          v28 = CFStringCreateWithCString(0, v21, 0x600u);
          free(v21);
          v10 = v47;
          a5 = v48;
          v17 = &selRef_dictionary;
        }
        else
        {
          if (v18)
            CFRelease(v18);
          if (DLShouldLog(3))
          {
            v42 = (const void *)v19;
            _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_createPathToNextSyncPlaybackFile", 3, CFSTR("Could not malloc %d bytes. Cowardly returning NULL"));
          }
          v28 = 0;
          a5 = v48;
        }
        v29 = CFStringGetLength(v28);
        v30 = (char *)malloc_type_malloc(v29 + 1, 0x90B9DA6DuLL);
        v31 = CFStringGetLength(v28);
        if (!CFStringGetCString(v28, v30, v31 + 1, 0x600u) && DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_saveSyncPlayback", 3, CFSTR("Sync playback file path string conversion failed"));
        if (v28)
          CFRelease(v28);
        v32 = strlen(v30);
        v33 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v30, v32, 0);
        if (!DLWritePropertyListToFile(v49, v33, &cf))
        {
          if (DLShouldLog(3))
            _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_saveSyncPlayback", 3, cf);
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
        }
        if (v33)
          CFRelease(v33);
        free(v30);
        v11 = v50;
      }
      else if (DLShouldLog(5))
      {
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "processChangesCallback", 5, CFSTR("No changes were pulled. Skipping playback save."));
      }
      v34 = v17[103];
      if (v34)
      {
        CFRelease(v34);
        v17[103] = 0;
      }
    }
    if (Mutable)
      CFRelease(Mutable);
  }
  v35 = DataSourceProcessChanges(*(_QWORD *)(v11 + 16), a3, a4, &v51, a5, &v52);
  if ((_DWORD)v35)
  {
    v38 = v35;
    if (DLShouldLog(3))
    {
      v42 = (const void *)v38;
      v43 = v52;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "processChangesCallback", 3, CFSTR("Error %d calling SADataSourceProcessChanges: %@"));
    }
    if (v52)
    {
      CFRelease(v52);
      v52 = 0;
    }
  }
  v39 = sub_1000056FC(a1, (uint64_t)a2, v51, (uint64_t)&v52, v36, v37);
  if ((_DWORD)v39)
  {
    v40 = v39;
    if (DLShouldLog(3))
    {
      v42 = (const void *)v40;
      v43 = v52;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "processChangesCallback", 3, CFSTR("Error %d calling SDRemapRecordIdentifiers: %@"));
    }
    if (v52)
    {
      CFRelease(v52);
      v52 = 0;
    }
  }
  return objc_msgSend(v10, "drain", v42, v43);
}

id sub_1000021E8(uint64_t a1, uint64_t a2, const void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  CFTypeRef v12;
  CFTypeRef cf;

  v6 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v7 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v11 = a2;
    v12 = a3;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "cancelSessionCallback", 5, CFSTR("cancelSessionCallback called for data class %@ with reason %@"));
  }
  sub_100003FE4(v7);
  v8 = DLWaitForMessage(a1, &cf);
  if ((_DWORD)v8)
  {
    v9 = v8;
    if (DLShouldLog(3))
    {
      v11 = v9;
      v12 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "cancelSessionCallback", 3, CFSTR("Error %d calling DLWaitForMessage: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  return objc_msgSend(v6, "drain", v11, v12);
}

id sub_1000022DC(uint64_t a1, const __CFString *a2, const void *a3, const void *a4, const __CFNumber *a5, const __CFDictionary *a6)
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  NSMutableDictionary *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFDictionary *v20;
  __CFDictionary *Mutable;
  uint64_t v22;
  int TetheredSyncingDisabledForDataType;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  _QWORD *v27;
  uint64_t v28;
  const __CFArray *ArrayBySeparatingStrings;
  CFIndex Count;
  const void *ValueAtIndex;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t Version;
  uint64_t v36;
  const __CFString *v37;
  uint64_t CanSyncWithVersion;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t SyncTypeAndExchangeSyncAnchors;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  __CFDictionary *v54;
  const __CFString *v55;
  int v56;
  CFStringRef v57;
  CFStringRef v58;
  uint64_t v59;
  int *v60;
  const __CFString *v61;
  __CFNotificationCenter *DarwinNotifyCenter;
  int v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  CFTypeRef v71;
  char *v72;
  char *v73;
  CFTypeRef v74;
  CFTypeRef v75;
  const __CFBoolean *v76;
  CFTypeRef v77;
  char v78;
  _QWORD v79[5];
  int valuePtr;
  CFTypeRef cf;
  CFArrayRef theArray[32];

  v12 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v13 = DLGetDeviceLinkConnectionContext(a1);
  if (objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isEphemeralMultiUser"))
  {
    if (DLShouldLog(3))
    {
      v70 = (uint64_t)a2;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("We are disabled for data class %@. Refusing to sync it."));
    }
    v16 = CFSTR("This data class is disabled for tethered syncing on the device.");
LABEL_74:
    v40 = sub_100005548(a1, (uint64_t)a2, (uint64_t)v16, (uint64_t)&cf, v14, v15);
    if ((_DWORD)v40)
    {
      v41 = v40;
      if (DLShouldLog(3))
      {
        v70 = v41;
        v71 = cf;
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("Error %d calling SDRefuseToSyncDataClassWithComputer: %@"));
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    return objc_msgSend(v12, "drain", v70, v71);
  }
  *(_QWORD *)v13 = CFRetain(a2);
  valuePtr = 0;
  if (a5)
    CFNumberGetValue(a5, kCFNumberIntType, &valuePtr);
  v17 = objc_opt_new(NSMutableDictionary);
  if (a6)
    -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", CFDictionaryGetValue(a6, CFSTR("HostVersion")), CFSTR("hostOS"));
  -[NSMutableDictionary setValue:forKey:](v17, "setValue:forKey:", a2, CFSTR("dataClass"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472;
  v79[2] = sub_1000042FC;
  v79[3] = &unk_100008430;
  v79[4] = v17;
  if (AnalyticsSendEventLazy(CFSTR("com.apple.itunes.sync"), v79))
  {
    if (!DLShouldLog(5))
      goto LABEL_15;
    v18 = CFSTR("Successfully sent analytics");
    v19 = 5;
  }
  else
  {
    if (!DLShouldLog(3))
      goto LABEL_15;
    v18 = CFSTR("Failed to send analytics");
    v19 = 3;
  }
  _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", v19, v18);
LABEL_15:
  v20 = 0;
  if (CFStringCompare(a2, CFSTR("com.apple.Calendars"), 0) == kCFCompareEqualTo)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v20 = Mutable;
    if (valuePtr <= 109)
      CFDictionarySetValue(Mutable, kShouldSendAllCalendarsOnFastSyncKey, kCFBooleanTrue);
    CFDictionarySetValue(v20, kShouldSyncCalendarColors, kCFBooleanTrue);
    CFDictionarySetValue(v20, kShouldSyncAttendeesAndOrganizers, kCFBooleanTrue);
    CFDictionarySetValue(v20, kIsEventsOnlySource, kCFBooleanTrue);
    CFDictionarySetValue(v20, kIsTetheredSync, kCFBooleanTrue);
  }
  if (CFStringCompare(a2, CFSTR("com.apple.Bookmarks"), 0) == kCFCompareEqualTo)
  {
    theArray[0] = 0;
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a2, CFSTR("."));
    Count = CFArrayGetCount(ArrayBySeparatingStrings);
    ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, Count - 1);
    v32 = CopyExternalSourcesEnabledForDataType(ValueAtIndex, theArray, &cf);
    if (ArrayBySeparatingStrings)
      CFRelease(ArrayBySeparatingStrings);
    if ((_DWORD)v32 || !theArray[0])
    {
      if ((_DWORD)v32)
      {
        if (DLShouldLog(4))
        {
          v70 = v32;
          v71 = cf;
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 4, CFSTR("Couldn't get external source state from lockdown for %@"));
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
    }
    else if (CFArrayGetCount(theArray[0]) >= 1)
    {
      if (theArray[0])
      {
        CFRelease(theArray[0]);
        theArray[0] = 0;
      }
      if (!DLShouldLog(3))
        goto LABEL_47;
      v70 = (uint64_t)a2;
      v26 = CFSTR("We are already syncing data class %@ externally. Refusing to sync it.");
      goto LABEL_46;
    }
  }
  v78 = 0;
  v22 = dataTypeForDataClassName(a2);
  TetheredSyncingDisabledForDataType = GetTetheredSyncingDisabledForDataType(v22, &v78, &cf);
  if (!TetheredSyncingDisabledForDataType && v78 == 1)
  {
    if (!DLShouldLog(3))
    {
LABEL_47:
      v33 = sub_100005548(a1, (uint64_t)a2, (uint64_t)CFSTR("This data class is disabled for tethered syncing on the device."), (uint64_t)&cf, v24, v25);
      if ((_DWORD)v33)
      {
        v34 = v33;
        if (DLShouldLog(3))
        {
          v70 = v34;
          v71 = cf;
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("Error %d calling SDRefuseToSyncDataClassWithComputer: %@"));
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
      if (v20)
        CFRelease(v20);
      return objc_msgSend(v12, "drain", v70, v71);
    }
    v70 = (uint64_t)a2;
    v26 = CFSTR("We are disabled for data class %@. Refusing to sync it.");
LABEL_46:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, v26);
    goto LABEL_47;
  }
  if (TetheredSyncingDisabledForDataType && DLShouldLog(4))
  {
    v70 = (uint64_t)a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 4, CFSTR("Couldn't get tethered data class state from lockdown for %@"));
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v27 = (_QWORD *)(v13 + 16);
  v28 = CreateDataSourceForDataClassName(a2, 0, v13 + 16, v20, &cf);
  if (v20)
    CFRelease(v20);
  if ((_DWORD)v28)
  {
    if (DLShouldLog(3))
    {
      v70 = v28;
      v71 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("Error %d calling CreateDataSourceForDataClassName: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    v16 = CFSTR("No Data Store available for data class");
    goto LABEL_74;
  }
  v77 = 0;
  v76 = kCFBooleanFalse;
  Version = DataSourceGetVersion(*v27, &v77, &cf);
  if ((_DWORD)Version)
  {
    v36 = Version;
    if (DLShouldLog(3))
    {
      v70 = v36;
      v71 = cf;
      v37 = CFSTR("Error %d calling DataSourceGetVersion: %@");
LABEL_67:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, v37);
      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if (DLShouldLog(5))
  {
    v70 = (uint64_t)a2;
    v71 = a5;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("syncDataClassWithDeviceCallback called for data class %@ with version %@"));
  }
  CanSyncWithVersion = DataSourceCanSyncWithVersion(*v27, a5, &v76, &cf);
  if ((_DWORD)CanSyncWithVersion)
  {
    v39 = CanSyncWithVersion;
    if (DLShouldLog(3))
    {
      v70 = v39;
      v71 = cf;
      v37 = CFSTR("Error %d calling DataSourceCanSyncWithVersion: %@");
      goto LABEL_67;
    }
LABEL_68:
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    v76 = kCFBooleanFalse;
    goto LABEL_71;
  }
  if (v76 == kCFBooleanFalse)
  {
LABEL_71:
    if (DLShouldLog(3))
    {
      v70 = (uint64_t)a5;
      v71 = v77;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("The sync versions do not match. Computer: %@ Device %@"));
    }
    v16 = CFSTR("Your computer's software is out of date. Please update and try again");
    goto LABEL_74;
  }
  if ((const CFBooleanRef)DataSourceShouldLockData(*v27) != kCFBooleanTrue)
  {
LABEL_82:
    theArray[0] = 0;
    v74 = 0;
    v75 = 0;
    SyncTypeAndExchangeSyncAnchors = DataSourceGetSyncTypeAndExchangeSyncAnchors(*v27, theArray, a3, a4, &v75, &v74, &cf);
    if ((_DWORD)SyncTypeAndExchangeSyncAnchors)
    {
      v44 = SyncTypeAndExchangeSyncAnchors;
      if (DLShouldLog(3))
      {
        v70 = v44;
        v71 = cf;
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("Error %d calling DataSourceGetSyncTypeAndExchangeSyncAnchors: %@"));
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v47 = sub_100005548(a1, (uint64_t)a2, (uint64_t)CFSTR("No Data Store available for data class"), (uint64_t)&cf, v45, v46);
      if (!(_DWORD)v47)
        goto LABEL_100;
      v48 = v47;
      if (!DLShouldLog(3))
      {
LABEL_98:
        v47 = (uint64_t)cf;
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
LABEL_100:
        if (SyncPlaybackEnabled(v47))
        {
          v54 = (__CFDictionary *)qword_10000C340;
          if (!qword_10000C340)
          {
            v54 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            qword_10000C340 = (uint64_t)v54;
          }
          CFDictionarySetValue(v54, CFSTR("last device anchor"), a3);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C340, CFSTR("next computer anchor"), a4);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C340, CFSTR("sync type"), theArray[0]);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_10000C340, CFSTR("data class"), a2);
        }
        if (theArray[0])
        {
          CFRelease(theArray[0]);
          theArray[0] = 0;
        }
        if (v75)
        {
          CFRelease(v75);
          v75 = 0;
        }
        if (v74)
        {
          CFRelease(v74);
          v74 = 0;
        }
        if (v77)
        {
          CFRelease(v77);
          v77 = 0;
        }
        return objc_msgSend(v12, "drain", v70, v71);
      }
      v70 = v48;
      v71 = cf;
      v49 = CFSTR("Error %d calling SDRefuseToSyncDataClassWithComputer: %@");
    }
    else
    {
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v52 = sub_1000054CC(a1, (uint64_t)a2, (uint64_t)v75, (uint64_t)v74, (uint64_t)theArray[0], (uint64_t)v77, 0, (uint64_t)&cf);
      if (!(_DWORD)v52)
      {
        *(_QWORD *)(v13 + 8) = DLCreateUUID(v52);
        v47 = DLShouldLog(5);
        if ((_DWORD)v47)
        {
          v70 = *(_QWORD *)(v13 + 8);
          v71 = a2;
          v47 = _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("Starting sync session %@ for dataclass %@"));
        }
        goto LABEL_100;
      }
      v53 = v52;
      if (!DLShouldLog(3))
        goto LABEL_98;
      v70 = v53;
      v71 = cf;
      v49 = CFSTR("Error %d calling SDSyncDataClassWithComputer: %@");
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, v49);
    goto LABEL_98;
  }
  v50 = (void *)DataSourceLockFilePath(*v27);
  if (v50)
    v51 = (const __CFString *)objc_msgSend(v50, "stringByStandardizingPath");
  else
    v51 = CFStringCreateWithFormat(0, 0, CFSTR("/tmp/%@.lock"), a2);
  v55 = v51;
  if (CFStringGetCString(v51, (char *)theArray, 256, 0x600u))
  {
    if (DLShouldLog(5))
    {
      v71 = a2;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("Getting lock fd %s for dataclass %@"));
    }
    v56 = open((const char *)theArray, 512, 438, v71);
    *(_DWORD *)(v13 + 64) = v56;
    if (v56 == -1)
    {
      v59 = *__error();
      v60 = __error();
      v72 = strerror(*v60);
      v58 = CFStringCreateWithFormat(0, 0, CFSTR("Error: Can't get lock fd for dataclass %@: (%d) %s"), a2, v59, v72);
    }
    else
    {
      if (DLShouldLog(5))
      {
        v70 = (uint64_t)a2;
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("Locking fd for %@"));
      }
      if (flock(*(_DWORD *)(v13 + 64), 6) != -1)
      {
LABEL_120:
        v57 = 0;
        goto LABEL_136;
      }
      if (*__error() == 35)
      {
        v61 = CFStringCreateWithFormat(0, 0, CFSTR("%@.LockRequest"), a2);
        if (DLShouldLog(5))
        {
          v70 = (uint64_t)a2;
          v71 = v61;
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("File for dataclass %@ is already locked, posting notification %@"));
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v61, 0, 0, 0);
        CFRelease(v61);
        v63 = 30;
        while (1)
        {
          if (DLShouldLog(5))
            _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("Sleeping for 1 second and trying to acquire lock again..."));
          sleep(1u);
          if (flock(*(_DWORD *)(v13 + 64), 6) != -1)
            goto LABEL_120;
          if (!--v63)
          {
            v58 = CFStringCreateWithFormat(0, 0, CFSTR("Timeout trying to lock fd for dataclass %@"), a2, v71);
            goto LABEL_135;
          }
        }
      }
      v64 = *__error();
      v65 = __error();
      v73 = strerror(*v65);
      v58 = CFStringCreateWithFormat(0, 0, CFSTR("Error: Can't lock fd for dataclass %@: (%d) %s"), a2, v64, v73);
    }
  }
  else
  {
    v58 = CFStringCreateWithFormat(0, 0, CFSTR("Can't get the C string for lock file name %@, dataclass %@"), v55, a2);
  }
LABEL_135:
  v57 = v58;
LABEL_136:
  if (v55)
    CFRelease(v55);
  if (!v57)
    goto LABEL_82;
  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, v57);
  v68 = sub_100005548(a1, (uint64_t)a2, (uint64_t)v57, (uint64_t)&cf, v66, v67);
  if ((_DWORD)v68)
  {
    v69 = v68;
    if (DLShouldLog(3))
    {
      v70 = v69;
      v71 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 3, CFSTR("Error %d calling SDRefuseToSyncDataClassWithComputer: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  CFRelease(v57);
  if (DLShouldLog(5))
  {
    v70 = (uint64_t)a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "syncDataClassWithDeviceCallback", 5, CFSTR("Closing lock fd for dataclass %@"));
  }
  close(*(_DWORD *)(v13 + 64));
  *(_DWORD *)(v13 + 64) = -1;
  return objc_msgSend(v12, "drain", v70, v71);
}

id sub_100002F58(_DWORD *a1, uint64_t a2)
{
  id v4;
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
  const __CFString *v17;
  uint64_t v18;
  __CFDictionary *Mutable;
  uint64_t v21;
  CFTypeRef v22;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v21 = a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "clearAllRecordsOnDeviceCallback", 5, CFSTR("clearAllRecordsOnDeviceCallback called for data class %@"));
  }
  v6 = DataSourceClearAllRecords(*(_QWORD *)(v5 + 16), &cf);
  if (!(_DWORD)v6)
  {
    v15 = sub_1000055BC((uint64_t)a1, a2, (uint64_t)&cf, v7, v8, v9);
    if (!(_DWORD)v15)
      goto LABEL_22;
    v18 = v15;
    if (!DLShouldLog(3))
      goto LABEL_20;
    v21 = v18;
    v22 = cf;
    v17 = CFSTR("Error %d calling SDDeviceWillClearAllRecords: %@");
    goto LABEL_19;
  }
  v10 = v6;
  if (DLShouldLog(3))
  {
    v21 = v10;
    v22 = cf;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "clearAllRecordsOnDeviceCallback", 3, CFSTR("Error %d calling SADataSourceClearAllRecords: %@"));
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v13 = sub_1000057E8(a1, a2, (uint64_t)CFSTR("Couldn't clear changes on device"), (uint64_t)&cf, v11, v12);
  if ((_DWORD)v13)
  {
    v14 = v13;
    if (DLShouldLog(3))
    {
      v21 = v14;
      v22 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "clearAllRecordsOnDeviceCallback", 3, CFSTR("Error %d calling SDCancelSession: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  v15 = DLWaitForMessage(a1, &cf);
  if ((_DWORD)v15)
  {
    v16 = v15;
    if (!DLShouldLog(3))
      goto LABEL_20;
    v21 = v16;
    v22 = cf;
    v17 = CFSTR("Error %d calling DLWaitForMessage: %@");
LABEL_19:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "clearAllRecordsOnDeviceCallback", 3, v17);
LABEL_20:
    v15 = (uint64_t)cf;
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
LABEL_22:
  if (SyncPlaybackEnabled(v15))
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, CFSTR("sync type"), CFSTR("SDSyncTypeReset"));
  }
  return objc_msgSend(v4, "drain", v21, v22);
}

id sub_10000318C(_DWORD *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t Changes;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Count;
  CFDictionaryRef v12;
  __CFDictionary *Mutable;
  uint64_t v15;
  CFTypeRef v16;
  CFDictionaryRef theDict;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  theDict = 0;
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v15 = a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getChangesFromDeviceCallback", 5, CFSTR("getChangesFromDeviceCallback called for data class %@"));
  }
  *(_QWORD *)(v5 + 24) = kCFBooleanFalse;
  *(_QWORD *)(v5 + 32) = kCFBooleanFalse;
  v6 = (uint64_t *)(v5 + 24);
  Changes = DataSourceGetChanges(*(v6 - 1), &theDict, v6, &cf);
  if ((_DWORD)Changes)
  {
    v8 = Changes;
    if (DLShouldLog(3))
    {
      v15 = v8;
      v16 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getChangesFromDeviceCallback", 3, CFSTR("Error %d calling SADataSourceGetChanges: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  v9 = sub_100005634(a1, a2, (uint64_t)theDict, *v6, 0, (uint64_t)&cf);
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (DLShouldLog(3))
    {
      v15 = v10;
      v16 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getChangesFromDeviceCallback", 3, CFSTR("Error %d calling SDProcessChanges: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  if (DLShouldLog(5))
  {
    Count = (CFIndex)theDict;
    if (theDict)
      Count = CFDictionaryGetCount(theDict);
    v15 = Count;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getChangesFromDeviceCallback", 5, CFSTR("getChangesFromDeviceCallback returned %d changes"));
  }
  v12 = theDict;
  if (theDict)
  {
    CFRelease(theDict);
    theDict = 0;
  }
  if (SyncPlaybackEnabled(v12))
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, CFSTR("sync type"), CFSTR("SDSyncTypeFast"));
  }
  return objc_msgSend(v4, "drain", v15, v16, theDict, cf);
}

id sub_100003390(_DWORD *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t AllRecords;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex Count;
  CFDictionaryRef v12;
  __CFDictionary *Mutable;
  uint64_t v15;
  CFTypeRef v16;
  CFDictionaryRef theDict;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  theDict = 0;
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v15 = a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getAllRecordsFromDeviceCallback", 5, CFSTR("getAllRecordsFromDeviceCallback called for data class %@"));
  }
  *(_QWORD *)(v5 + 24) = kCFBooleanFalse;
  v6 = (uint64_t *)(v5 + 24);
  v6[1] = (uint64_t)kCFBooleanTrue;
  AllRecords = DataSourceGetAllRecords(*(v6 - 1), &theDict, v6, &cf);
  if ((_DWORD)AllRecords)
  {
    v8 = AllRecords;
    if (DLShouldLog(3))
    {
      v15 = v8;
      v16 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getAllRecordsFromDeviceCallback", 3, CFSTR("Error %d calling SADataSourceGetAllRecords: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  v9 = sub_100005634(a1, a2, (uint64_t)theDict, *v6, 0, (uint64_t)&cf);
  if ((_DWORD)v9)
  {
    v10 = v9;
    if (DLShouldLog(3))
    {
      v15 = v10;
      v16 = cf;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getAllRecordsFromDeviceCallback", 3, CFSTR("Error %d calling SDProcessChanges: %@"));
    }
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  if (DLShouldLog(5))
  {
    Count = (CFIndex)theDict;
    if (theDict)
      Count = CFDictionaryGetCount(theDict);
    v15 = Count;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "getAllRecordsFromDeviceCallback", 5, CFSTR("Data source returned %d records"));
  }
  v12 = theDict;
  if (theDict)
  {
    CFRelease(theDict);
    theDict = 0;
  }
  if (SyncPlaybackEnabled(v12))
  {
    Mutable = (__CFDictionary *)qword_10000C340;
    if (!qword_10000C340)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      qword_10000C340 = (uint64_t)Mutable;
    }
    CFDictionarySetValue(Mutable, CFSTR("sync type"), CFSTR("SDSyncTypeSlow"));
  }
  return objc_msgSend(v4, "drain", v15, v16, theDict, cf);
}

id sub_1000035A4(_DWORD *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFBoolean *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  CFTypeRef v14;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  if (DLShouldLog(5))
  {
    v13 = a2;
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "acknowledgeChangesFromDeviceCallback", 5, CFSTR("acknowledgeChangesFromDeviceCallback called for data class %@"));
  }
  v9 = *(const __CFBoolean **)(v5 + 24);
  if (v9 == kCFBooleanTrue)
  {
    if (*(const __CFBoolean **)(v5 + 32) == v9)
      sub_100003390(a1, a2);
    else
      sub_10000318C(a1, a2);
  }
  else
  {
    v10 = sub_100005684((uint64_t)a1, a2, (uint64_t)&cf, v6, v7, v8);
    if ((_DWORD)v10)
    {
      v11 = v10;
      if (DLShouldLog(3))
      {
        v13 = v11;
        v14 = cf;
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "acknowledgeChangesFromDeviceCallback", 3, CFSTR("Error %d calling SDDeviceReadyToReceiveChanges: %@"));
      }
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
  }
  return objc_msgSend(v4, "drain", v13, v14);
}

id sub_1000036C4(_DWORD *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  CFTypeRef cf;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  v5 = DLGetDeviceLinkConnectionContext(a1);
  *(_QWORD *)(v5 + 40) = kCFBooleanTrue;
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 5, CFSTR("finishSessionOnDeviceCallback called for data class %@"));
  if (!DataSourceCommit(*(_QWORD *)(v5 + 16), &cf))
  {
    if (!sub_100005770((uint64_t)a1, a2, (uint64_t)&cf, v6, v7, v8))
      goto LABEL_29;
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 3, CFSTR("SDDeviceFinishedSession returned '%@'"));
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    goto LABEL_25;
  }
  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 3, CFSTR("Error %d calling DataSourceCommit: %@"));
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  v11 = sub_1000057E8(a1, a2, (uint64_t)CFSTR("Couldn't commit changes on device"), (uint64_t)&cf, v9, v10);
  if (v11)
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 3, CFSTR("Error %d calling SDCancelSession: %@"));
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  if (DLWaitForMessage(a1, &cf))
  {
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 3, CFSTR("Error %d calling DLWaitForMessage: %@"));
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  if (v11)
  {
LABEL_25:
    if (DLShouldLog(3))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "finishSessionOnDeviceCallback", 3, CFSTR("Error %d calling %s: %@"));
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
LABEL_29:
  sub_100003FE4(v5);
  return objc_msgSend(v4, "drain");
}

void sub_10000393C(uint64_t a1, const char *a2, int a3, int a4, uint64_t a5, int a6)
{
  _QWORD *v11;
  __CFDictionary *Mutable;
  CFStringRef v13;
  int v14;
  const __CFString *v15;
  const __CFString *v16;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v18;
  void *observer;
  CFTypeRef cf;

  observer = 0;
  cf = 0;
  v11 = malloc_type_calloc(0x48uLL, 1uLL, 0xAC89FB83uLL);
  *v11 = 0;
  v11[1] = 0;
  v11[3] = kCFBooleanFalse;
  v11[4] = kCFBooleanFalse;
  v11[5] = kCFBooleanFalse;
  v11[6] = kCFBooleanFalse;
  v11[7] = kCFBooleanFalse;
  *((_DWORD *)v11 + 16) = -1;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a2)
  {
    v13 = CFStringCreateWithCString(0, a2, 0x600u);
    CFDictionarySetValue(Mutable, CFSTR("DLInfoHostnameKey"), v13);
    CFRelease(v13);
  }
  if (a4)
  {
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "runSyncAgent", 5, CFSTR("Disabling inactivity timer, since --noquit specified when running SyncAgent"));
    byte_10000C328 = 1;
  }
  if (sub_100003D0C(Mutable, a6))
  {
    v14 = DLShouldLog(5);
    if (a2)
    {
      if (!v14)
        goto LABEL_18;
      v15 = CFSTR("Starting sync agent (%s) to run a%s sync with %s");
    }
    else
    {
      if (!v14)
        goto LABEL_18;
      v15 = CFSTR("Starting sync agent (%s) as daemon");
    }
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "runSyncAgent", 5, v15);
LABEL_18:
    if (sub_100004D68(a5, (uint64_t)off_10000C038, (uint64_t)v11, (uint64_t)&observer, (uint64_t)&cf))
    {
      if (!DLShouldLog(3))
      {
LABEL_22:
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        if (Mutable)
          CFRelease(Mutable);
        return;
      }
      v16 = CFSTR("Error %d creating wire connection for device: %@");
LABEL_21:
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "runSyncAgent", 3, v16);
      goto LABEL_22;
    }
    if (a3)
      v11[6] = kCFBooleanTrue;
    if (a2)
    {
      if (DLConnect(observer, Mutable, &cf))
      {
        if (!DLShouldLog(3))
          goto LABEL_22;
        v16 = CFSTR("Error %d connecting to computer: %@");
        goto LABEL_21;
      }
      if (DLDeviceReady(observer, &cf))
      {
        if (!DLShouldLog(3))
          goto LABEL_22;
        v16 = CFSTR("Error %d sending DeviceReady to computer: %@");
        goto LABEL_21;
      }
      v11[7] = kCFBooleanTrue;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSync.SyncAgent.kSyncAgentSyncStarted"), 0, 0, 0);
    }
    else if (DLWaitForConnection(observer, Mutable, &cf))
    {
      if (!DLShouldLog(3))
        goto LABEL_22;
      v16 = CFSTR("Error %d waiting for connection from computer: %@");
      goto LABEL_21;
    }
    v18 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v18, observer, (CFNotificationCallback)sub_100003EBC, CFSTR("com.apple.SyncAgent.cancel"), 0, (CFNotificationSuspensionBehavior)0);
    sub_100004440();
    CFRunLoopRun();
    CFRelease(Mutable);
    sub_100003FE4((uint64_t)v11);
    free(v11);
    return;
  }
  if (DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "runSyncAgent", 3, CFSTR("Can't get launchd/lockdown socket or setup a port"));
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t sub_100003D0C(__CFDictionary *a1, int a2)
{
  uint64_t v4;
  uint64_t result;
  CFNumberRef v6;
  uint64_t v7;
  int valuePtr;

  dword_10000C0D0 = a2;
  v4 = sub_100004304();
  if (a2 == 2)
  {
    CFDictionarySetValue(a1, CFSTR("DLInfoStreamTypeKey"), CFSTR("DLInfoStreamTypeTCP"));
    valuePtr = 6666;
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SetSocketInfo", 5, CFSTR("SyncAgent listening on port %d"));
    v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a1, CFSTR("DLInfoPortKey"), v6);
LABEL_15:
    CFRelease(v6);
    return 1;
  }
  if (a2 != 1)
  {
    if (a2)
      return 0;
    if (DLLockdownXPCCheckin("com.apple.lockdown.SyncAgent", a1))
    {
      result = DLShouldLog(6);
      if (!(_DWORD)result)
        return result;
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SetSocketInfo", 6, CFSTR("Could not check in with lockdown"));
      return 0;
    }
    return 1;
  }
  v7 = v4;
  CFDictionarySetValue(a1, CFSTR("DLInfoStreamTypeKey"), CFSTR("DLInfoStreamTypeTCP"));
  result = DLGetListenerSocketFromLaunchd(v7);
  valuePtr = result;
  if (!(_DWORD)result)
    return result;
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SetSocketInfo", 5, CFSTR("SyncAgent listening on launchd socket %d"));
  v6 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, CFSTR("DLInfoSocketKey"), v6);
  if (v6)
    goto LABEL_15;
  return 1;
}

id sub_100003EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = 0;
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "sCancelSync", 5, CFSTR("Cancel Sync notification received"));
  if (DLKillConnection(a2, &v4) && DLShouldLog(3))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "sCancelSync", 3, CFSTR("Can't kill connection to cancel sync: %@"));
  return sub_1000018A4(a2, (uint64_t)CFSTR("Cancel Sync Notification"));
}

uint64_t sub_100003F64()
{
  uint64_t result;

  SBSSetStatusBarShowsSyncActivity(1, 600);
  byte_10000C329 = 1;
  result = qword_10000C330;
  if (qword_10000C330)
  {
    CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_10000C330);
    CFRelease((CFTypeRef)qword_10000C330);
    qword_10000C330 = 0;
    result = DLShouldLog(5);
    if ((_DWORD)result)
      return _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_noteConnected", 5, CFSTR("Cleared inactivity exit timeout for Sync Agent"));
  }
  return result;
}

void sub_100003FE4(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  int v3;
  int *v4;
  CFTypeRef cf;

  cf = 0;
  if (*(const CFBooleanRef *)(a1 + 56) == kCFBooleanTrue)
  {
    *(_QWORD *)(a1 + 56) = kCFBooleanFalse;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.MobileSync.SyncAgent.kSyncAgentSyncEnded"), 0, 0, 0);
  }
  v3 = *(_DWORD *)(a1 + 64);
  if (v3 != -1)
  {
    if (flock(v3, 8) == -1 && DLShouldLog(5))
    {
      __error();
      v4 = __error();
      strerror(*v4);
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 5, CFSTR("Error: Can't unlock fd for dataclass %@: (%d) %s"));
    }
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 5, CFSTR("Closing lock fd for dataclass %@"));
    close(*(_DWORD *)(a1 + 64));
    *(_DWORD *)(a1 + 64) = -1;
  }
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  *(_QWORD *)a1 = 0;
  if (*(_QWORD *)(a1 + 16))
  {
    if (*(const CFBooleanRef *)(a1 + 40) == kCFBooleanFalse)
    {
      if (DLShouldLog(5))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 5, CFSTR("Context cleanup called before session is finished, calling rollback on data source"));
      if (DataSourceRollback(*(_QWORD *)(a1 + 16), &cf))
      {
        if (DLShouldLog(3))
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 3, CFSTR("Error %d calling DataSourceRollback: %@"));
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
    }
    else
    {
      *(_QWORD *)(a1 + 40) = kCFBooleanFalse;
    }
    if (DataSourceDeleteDataSource(*(_QWORD *)(a1 + 16), &cf))
    {
      if (DLShouldLog(3))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 3, CFSTR("Error %d calling DataSourceDeleteDataSource: %@"));
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
    *(_QWORD *)(a1 + 16) = 0;
  }
  if (*(_QWORD *)(a1 + 8))
  {
    if (DLShouldLog(5))
      _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_cleanupContext", 5, CFSTR("Finished sync session %@"));
    CFRelease(*(CFTypeRef *)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void sub_100004264(const void *a1, CFTypeRef cf, __CFArray *a3)
{
  CFTypeID v6;
  CFIndex Count;
  __CFDictionary *MutableCopy;

  v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)cf);
    MutableCopy = CFDictionaryCreateMutableCopy(0, Count + 1, (CFDictionaryRef)cf);
    CFDictionarySetValue(MutableCopy, CFSTR("SyncAgent_RecordID"), a1);
    CFArrayAppendValue(a3, MutableCopy);
    CFRelease(MutableCopy);
  }
  else
  {
    CFArrayAppendValue(a3, cf);
  }
}

uint64_t sub_1000042FC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t sub_100004304()
{
  uint64_t result;
  CFIndex AppIntegerValue;
  CFIndex v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;
  int v6;
  Boolean keyExistsAndHasValidFormat;

  result = qword_10000C0D8;
  if (qword_10000C0D8 == -1)
  {
    if (byte_10000C328 == 1)
    {
      result = 0;
      qword_10000C0D8 = 0;
      return result;
    }
    qword_10000C0D8 = 600;
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("InactivityTimeout"), CFSTR("com.apple.SyncAgent"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat != 1 || (v2 = AppIntegerValue, AppIntegerValue < 0))
    {
      v5 = qword_10000C0D8;
      v6 = DLShouldLog(5);
      if (v5)
      {
        if (v6)
        {
          v4 = CFSTR("Set inactivity timer to internal default value (%d seconds)");
          goto LABEL_16;
        }
      }
      else if (v6)
      {
        v4 = CFSTR("Inactivity timer disabled, Sync Agent will not exit after inactivity");
        goto LABEL_16;
      }
    }
    else
    {
      qword_10000C0D8 = AppIntegerValue;
      v3 = DLShouldLog(5);
      if (v2)
      {
        if (v3)
        {
          v4 = CFSTR("Setting inactivity timer to value from preferences (%d seconds)");
LABEL_16:
          _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_getInactivityTimerInterval", 5, v4);
        }
      }
      else if (v3)
      {
        v4 = CFSTR("Inactivity timer disabled in preferences, Sync Agent will not exit after inactivity");
        goto LABEL_16;
      }
    }
    return qword_10000C0D8;
  }
  return result;
}

void sub_100004440()
{
  uint64_t v0;
  uint64_t v1;
  CFAbsoluteTime Current;
  __CFRunLoop *v3;

  v0 = sub_100004304();
  if (v0)
  {
    if (dword_10000C0D0 == 1)
    {
      if (DLShouldLog(5))
        _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_setupInactivityTimer", 5, CFSTR("Running from launchd, so using kqueue timeout as inactivity timeout instead of runloop"));
    }
    else
    {
      v1 = v0;
      Current = CFAbsoluteTimeGetCurrent();
      qword_10000C330 = (uint64_t)CFRunLoopTimerCreate(0, Current + (double)v1, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000044FC, 0);
      v3 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v3, (CFRunLoopTimerRef)qword_10000C330, kCFRunLoopCommonModes);
    }
  }
}

void sub_1000044FC(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  if (byte_10000C329 == 1 && DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SyncAgentInactivityTimeoutCallback", 5, CFSTR("Ignoring Sync Agent exit timer, connected to computer"));
  if (qword_10000C330 != a1 && DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SyncAgentInactivityTimeoutCallback", 5, CFSTR("Ignoring Sync Agent exit timer for stale timer no longer being used"));
  if (DLShouldLog(5))
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncAgent/SyncAgent.m", "_SyncAgentInactivityTimeoutCallback", 5, CFSTR("SyncAgent exiting, timed out after %d seconds of inactivity"));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.SyncAgent.inactivityTimeout"), 0, 0, 0);
  exit(0);
}

uint64_t start(int a1, const char **a2)
{
  id v4;
  CFStringRef v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFStringRef v23;
  uint64_t v24;
  uint64_t result;
  CFStringRef v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  id v30;
  int v31;
  int v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  char *v36;
  int v37;
  unsigned __int8 v38;
  CFStringRef v39;
  CFStringRef v40;
  uint64_t v41;
  int v42;
  CFTypeRef cf;
  uint64_t v44;
  uint64_t v45;
  CFTypeRef v46;

  v4 = objc_alloc_init((Class)NSAutoreleasePool);
  cf = 0;
  DLSetLogDirectoryName("MobileSync");
  if (a1 < 2)
  {
    v5 = 0;
    v40 = 0;
    v6 = 0;
    v7 = 0;
    LODWORD(v8) = 0;
    LODWORD(v9) = 0;
    v10 = 0;
    v11 = 0;
    LODWORD(v35) = 0;
    v38 = 1;
    v31 = 2;
    v32 = 0;
    LODWORD(v12) = 1;
    goto LABEL_34;
  }
  v30 = v4;
  v12 = 0;
  v35 = 0;
  v36 = 0;
  v9 = 0;
  v8 = 0;
  v33 = 0;
  v34 = 0;
  v39 = 0;
  v40 = 0;
  v13 = 0;
  v37 = 0;
  v38 = 1;
  v14 = 2;
  v15 = "b:c:def:hkl:Lm:noprs:S:t:vX:Y:";
  while (2)
  {
    while (1)
    {
      v16 = getopt_long(a1, (char *const *)a2, v15, (const option *)&off_10000C0E0, 0);
      if (v16 <= 83)
        break;
      switch(v16)
      {
        case 'c':
          v26 = CFStringCreateWithCString(0, optarg, 0x8000100u);
          v42 = 0;
          v27 = dataClassNameForDataType();
          v41 = 0;
          CreateDataSourceForDataClassName(v27, 0, &v41, 0, 0);
          DataSourceGetCountOfRecords(v41, &v42, 0);
          CFPrintf(CFSTR("Data source %@ has %d records"));
          if (v26)
            CFRelease(v26);
          goto LABEL_80;
        case 'd':
          v38 = 0;
          continue;
        case 'e':
        case 'f':
        case 'g':
        case 'h':
        case 'i':
        case 'j':
        case 'l':
        case 'p':
        case 'q':
        case 'u':
          break;
        case 'k':
          v14 = 0;
          v13 = 1;
          continue;
        case 'm':
          v9 = 1;
          if (optarg)
            v33 = sub_100004CD4(optarg);
          continue;
        case 'n':
          v37 = 1;
          continue;
        case 'o':
          goto LABEL_26;
        case 'r':
          v12 = 1;
          continue;
        case 's':
          v36 = optarg;
LABEL_26:
          v12 = 1;
          v13 = 1;
          continue;
        case 't':
          continue;
        case 'v':
          v12 = 1;
          HIDWORD(v35) = 1;
          continue;
        default:
          if (v16 == 84)
          {
            SetTetheredSyncingDisabledForDatatype(kDataTypeContacts, *optarg == 116, 0);
            goto LABEL_80;
          }
          if (v16 == 88)
          {
            v28 = *optarg != 102;
            v29 = kDataTypeContacts;
            SetExternalSourceEnabledForDataType(CFSTR("MobileSync"), kDataTypeContacts, v28, 0);
            SetAccountNameEnabledForDataType(CFSTR("MobileSync account"), v29, v28, 0);
LABEL_80:
            exit(0);
          }
          return result;
      }
LABEL_32:
      LODWORD(v35) = 1;
    }
    switch(v16)
    {
      case 'C':
        v40 = CFStringCreateWithCString(0, optarg, 0x8000100u);
        continue;
      case 'D':
        v39 = CFStringCreateWithCString(0, optarg, 0x8000100u);
        continue;
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
        goto LABEL_32;
      case 'K':
        v8 = 1;
        if (optarg)
          v34 = sub_100004CD4(optarg);
        continue;
      case 'L':
        v14 = 1;
        continue;
      default:
        if (v16 == 83)
        {
          v17 = v15;
          v18 = v12;
          v19 = v13;
          v20 = v9;
          v21 = v8;
          v22 = v14;
          v23 = CFStringCreateWithCString(0, optarg, 0x8000100u);
          CopyExternalSourcesEnabledForDataType(v23, &cf, 0);
          CFPrintf(CFSTR("External sources registered for %@: %@"));
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          CopyAccountNamesEnabledForDataType(v23, &cf, 0);
          CFPrintf(CFSTR("Account names registered for %@: %@"));
          if (v23)
            CFRelease(v23);
          v14 = v22;
          v8 = v21;
          v9 = v20;
          v13 = v19;
          v12 = v18;
          v15 = v17;
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          continue;
        }
        if (v16 != -1)
          goto LABEL_32;
        v31 = v14;
        v32 = v13;
        v4 = v30;
        v5 = v39;
        v6 = v33;
        v7 = v34;
        v11 = v37;
        v10 = v36;
        if (!HIDWORD(v35))
LABEL_34:
          DLSetOutputLevel(0);
        if ((_DWORD)v35)
        {
          printf("Usage:\n%s --run [--oneshot]\n%s --sync hostname\n%s --playback filename\n", *a2, *a2, *a2);
          goto LABEL_73;
        }
        if ((_DWORD)v9)
        {
          v46 = 0;
          if (v6)
            v7 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", kCFBooleanTrue, v6, 0);
          else
            v7 = 0;
          v45 = 0;
          v24 = kDataClassCalendars;
          if (CreateDataSourceForDataClassName(kDataClassCalendars, v40, &v45, v7, &v46))
          {
            NSLog(CFSTR("Couldn't create a data source with the name %@: %@"), v40, v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          v44 = 0;
          if (CreateDataSourceForDataClassName(v24, v5, &v44, v7, &v46))
          {
            NSLog(CFSTR("Couldn't create a data source with the name %@: %@"), v40, v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceMigrateRecords(v45, v44, &v46))
          {
            NSLog(CFSTR("Couldn't migrate records: %@"), v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceDeleteDataSource(v45, &v46))
          {
            NSLog(CFSTR("Couldn't delete the source data source: %@"), v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceDeleteDataSource(v44, &v46))
          {
            NSLog(CFSTR("Couldn't delete the destination data source: %@"), v46);
            goto LABEL_69;
          }
          goto LABEL_71;
        }
        if ((_DWORD)v8)
        {
          v46 = 0;
          if (v7)
            v7 = (const __CFString *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", kCFBooleanTrue, v7, 0);
          v45 = 0;
          if (CreateDataSourceForDataClassName(kDataClassCalendars, v40, &v45, v7, &v46))
          {
            NSLog(CFSTR("Couldn't create a data source with the name %@: %@"), v40, v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceClearAllRecords(v45, &v46))
          {
            NSLog(CFSTR("Couldn't clear all records in the data source: %@"), v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceCommit(v45, &v46))
          {
            NSLog(CFSTR("Couldn't commit the data source: %@"), v46);
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
          if (DataSourceDeleteDataSource(v45, &v46))
          {
            NSLog(CFSTR("Couldn't delete the data source: %@"), v46);
LABEL_69:
            if (v46)
            {
              CFRelease(v46);
              v46 = 0;
            }
          }
LABEL_71:
          if (v7)
            CFRelease(v7);
        }
        else if ((_DWORD)v12)
        {
          sub_10000393C((uint64_t)*a2, v10, v32, v11, v38, v31);
        }
LABEL_73:
        objc_msgSend(v4, "drain");
        return 0;
    }
  }
}

const __CFString *sub_100004CD4(const char *a1)
{
  if (strncasecmp(a1, "event", 5uLL))
    return CFSTR("IsEventsOnly");
  if (!strncasecmp(a1, "todo", 4uLL) && !strncasecmp(a1, "task", 4uLL) && !strncasecmp(a1, "reminder", 8uLL))
    return 0;
  return CFSTR("IsRemindersOnly");
}

uint64_t sub_100004D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _QWORD *v11;

  v10 = a2 + 88;
  v11 = malloc_type_calloc(0x18uLL, 1uLL, 0x7B2F8120uLL);
  *v11 = v10;
  v11[1] = a2;
  return _DLCreateDeviceLinkConnectionForDevice(a1, a2, a3, v11, a4, sub_100004DE8, dword_10000C320, a5);
}

uint64_t sub_100004DE8(uint64_t a1, CFArrayRef theArray)
{
  _QWORD *v4;
  CFIndex Count;
  const __CFString *ValueAtIndex;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
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
  CFBooleanRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = *(_QWORD **)(a1 + 16);
  Count = CFArrayGetCount(theArray);
  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, 0);
  if (!ValueAtIndex)
  {
    if (!DLShouldLog(4))
      return 0xFFFFFFFFLL;
    v10 = CFSTR("_SyncHandleIncomingMessage called with NULL message!");
    v11 = 4;
LABEL_21:
    _DLLog("/Library/Caches/com.apple.xbs/Sources/Sync/SyncWireProtocol/SyncDeviceLinkConnection.c", "_SyncHandleIncomingMessage", v11, v10);
    return 0xFFFFFFFFLL;
  }
  v7 = ValueAtIndex;
  if (CFStringCompare(ValueAtIndex, CFSTR("SDMessageSyncDataClassWithDevice"), 0))
  {
    if (CFStringCompare(v7, CFSTR("SDMessageSyncDataClassWithComputer"), 0))
    {
      if (CFStringCompare(v7, CFSTR("SDMessageRefuseToSyncDataClassWithComputer"), 0))
      {
        if (CFStringCompare(v7, CFSTR("SDMessageClearAllRecordsOnDevice"), 0))
        {
          if (CFStringCompare(v7, CFSTR("SDMessageDeviceWillClearAllRecords"), 0))
          {
            if (CFStringCompare(v7, CFSTR("SDMessageGetChangesFromDevice"), 0) == kCFCompareEqualTo)
            {
              if (Count < 2)
                v29 = 0;
              else
                v29 = _DLGetParameterAtIndex(theArray, 1);
              (*(void (**)(uint64_t, uint64_t))(v4[1] + 120))(a1, v29);
              return 0;
            }
            if (CFStringCompare(v7, CFSTR("SDMessageGetAllRecordsFromDevice"), 0))
            {
              if (CFStringCompare(v7, CFSTR("SDMessageProcessChanges"), 0))
              {
                if (CFStringCompare(v7, CFSTR("SDMessageAcknowledgeChangesFromDevice"), 0))
                {
                  if (CFStringCompare(v7, CFSTR("SDMessageDeviceReadyToReceiveChanges"), 0))
                  {
                    if (CFStringCompare(v7, CFSTR("SDMessageRemapRecordIdentifiers"), 0))
                    {
                      if (CFStringCompare(v7, CFSTR("SDMessageFinishSessionOnDevice"), 0) == kCFCompareEqualTo)
                      {
                        if (Count < 2)
                          v40 = 0;
                        else
                          v40 = _DLGetParameterAtIndex(theArray, 1);
                        (*(void (**)(uint64_t, uint64_t))(v4[1] + 144))(a1, v40);
                        return 0;
                      }
                      if (CFStringCompare(v7, CFSTR("SDMessageDeviceFinishedSession"), 0))
                      {
                        if (CFStringCompare(v7, CFSTR("SDMessageCancelSession"), 0) == kCFCompareEqualTo)
                        {
                          if (Count < 2)
                          {
                            v8 = 0;
                          }
                          else
                          {
                            v8 = _DLGetParameterAtIndex(theArray, 1);
                            if (Count != 2)
                            {
                              v9 = _DLGetParameterAtIndex(theArray, 2);
LABEL_116:
                              (*(void (**)(uint64_t, uint64_t, uint64_t))(*v4 + 8))(a1, v8, v9);
                              return 0;
                            }
                          }
                          v9 = 0;
                          goto LABEL_116;
                        }
                        return 0xFFFFFFFFLL;
                      }
                      if (Count < 2)
                        v28 = 0;
                      else
                        v28 = _DLGetParameterAtIndex(theArray, 1);
                      v41 = v4[2];
                      if (!v41 || (v35 = *(void (**)(uint64_t, uint64_t))(v41 + 152)) == 0)
                      {
                        if (!DLShouldLog(3))
                          return 0xFFFFFFFFLL;
                        v10 = CFSTR("_SyncHandleIncomingMessage called with an unexpected SDMessageDeviceFinishedSession message");
                        v11 = 3;
                        goto LABEL_21;
                      }
                      goto LABEL_81;
                    }
                    if (Count < 2)
                    {
                      v38 = 0;
                    }
                    else
                    {
                      v38 = _DLGetParameterAtIndex(theArray, 1);
                      if (Count != 2)
                      {
                        v39 = _DLGetParameterAtIndex(theArray, 2);
LABEL_104:
                        (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[2] + 144))(a1, v38, v39);
                        return 0;
                      }
                    }
                    v39 = 0;
                    goto LABEL_104;
                  }
                  if (Count < 2)
                    v36 = 0;
                  else
                    v36 = _DLGetParameterAtIndex(theArray, 1);
                  v37 = v4[2];
                }
                else
                {
                  if (Count < 2)
                    v36 = 0;
                  else
                    v36 = _DLGetParameterAtIndex(theArray, 1);
                  v37 = v4[1];
                }
                (*(void (**)(uint64_t, uint64_t))(v37 + 136))(a1, v36);
                return 0;
              }
              v31 = kCFBooleanFalse;
              if (Count < 2)
              {
                v32 = 0;
              }
              else
              {
                v32 = _DLGetParameterAtIndex(theArray, 1);
                if (Count != 2)
                {
                  v33 = _DLGetParameterAtIndex(theArray, 2);
                  if ((unint64_t)Count >= 4)
                  {
                    v31 = (CFBooleanRef)_DLGetParameterAtIndexWithDefaultValue(theArray, 3, kCFBooleanFalse);
                    if (Count != 4)
                    {
                      v34 = _DLGetParameterAtIndex(theArray, 4);
LABEL_89:
                      (*(void (**)(uint64_t, uint64_t, uint64_t, CFBooleanRef, uint64_t))*v4)(a1, v32, v33, v31, v34);
                      return 0;
                    }
                  }
LABEL_88:
                  v34 = 0;
                  goto LABEL_89;
                }
              }
              v33 = 0;
              goto LABEL_88;
            }
            if (Count < 2)
              v28 = 0;
            else
              v28 = _DLGetParameterAtIndex(theArray, 1);
            v30 = v4[1];
          }
          else
          {
            if (Count < 2)
              v28 = 0;
            else
              v28 = _DLGetParameterAtIndex(theArray, 1);
            v30 = v4[2];
          }
          v35 = *(void (**)(uint64_t, uint64_t))(v30 + 128);
LABEL_81:
          v35(a1, v28);
          return 0;
        }
        if (Count < 2)
        {
          v26 = 0;
        }
        else
        {
          v26 = _DLGetParameterAtIndex(theArray, 1);
          if (Count != 2)
          {
            v27 = _DLGetParameterAtIndex(theArray, 2);
LABEL_58:
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[1] + 112))(a1, v26, v27);
            return 0;
          }
        }
        v27 = 0;
        goto LABEL_58;
      }
      if (Count < 2)
      {
        v21 = 0;
      }
      else
      {
        v21 = _DLGetParameterAtIndex(theArray, 1);
        if (Count != 2)
        {
          v22 = _DLGetParameterAtIndex(theArray, 2);
LABEL_49:
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v4[2] + 120))(a1, v21, v22);
          return 0;
        }
      }
      v22 = 0;
      goto LABEL_49;
    }
    if (Count < 2)
    {
      v17 = 0;
      v18 = 0;
      v16 = 0;
    }
    else
    {
      v16 = _DLGetParameterAtIndex(theArray, 1);
      if (Count != 2)
      {
        v23 = _DLGetParameterAtIndex(theArray, 2);
        if ((unint64_t)Count < 4)
        {
          v17 = 0;
          v18 = 0;
        }
        else
        {
          v18 = _DLGetParameterAtIndex(theArray, 3);
          if (Count != 4)
          {
            v24 = _DLGetParameterAtIndex(theArray, 4);
            if ((unint64_t)Count < 6)
            {
              v17 = 0;
            }
            else
            {
              v17 = _DLGetParameterAtIndex(theArray, 5);
              if (Count != 6)
              {
                v25 = _DLGetParameterAtIndex(theArray, 6);
                goto LABEL_40;
              }
            }
LABEL_39:
            v25 = 0;
LABEL_40:
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4[2] + 112))(a1, v16, v23, v18, v24, v17, v25);
            return 0;
          }
          v17 = 0;
        }
LABEL_38:
        v24 = 0;
        goto LABEL_39;
      }
      v17 = 0;
      v18 = 0;
    }
    v23 = 0;
    goto LABEL_38;
  }
  if (Count < 2)
  {
    v14 = 0;
    v15 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  v13 = _DLGetParameterAtIndex(theArray, 1);
  if (Count == 2)
  {
    v14 = 0;
    v15 = 0;
LABEL_30:
    v19 = 0;
    goto LABEL_31;
  }
  v15 = _DLGetParameterAtIndex(theArray, 2);
  if ((unint64_t)Count < 4)
  {
    v14 = 0;
    goto LABEL_30;
  }
  v19 = _DLGetParameterAtIndex(theArray, 3);
  if (Count == 4)
  {
    v14 = 0;
  }
  else
  {
    v14 = _DLGetParameterAtIndex(theArray, 4);
    if ((unint64_t)Count >= 6)
    {
      v20 = _DLGetParameterAtIndex(theArray, 5);
      goto LABEL_32;
    }
  }
LABEL_31:
  v20 = 0;
LABEL_32:
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v4[1] + 104))(a1, v13, v15, v19, v14, v20);
  return 0;
}

uint64_t sub_1000054CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a8, CFSTR("SDSyncDataClassWithComputer: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageSyncDataClassWithComputer"), 6, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 7;
  return 0;
}

uint64_t sub_100005548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a4, CFSTR("SDRefuseToSyncDataClassWithComputer: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageRefuseToSyncDataClassWithComputer"), 2, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 8;
  return 0;
}

uint64_t sub_1000055BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a3, CFSTR("SDDeviceWillClearAllRecords: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageDeviceWillClearAllRecords"), 1, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 10;
  return 0;
}

uint64_t sub_100005634(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _DLRequestWrite(a1, CFSTR("SDMessageProcessChanges"), 4, a4, a5, a6);
  _DLRequestRead(a1);
  *a1 = 13;
  return 0;
}

uint64_t sub_100005684(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a3, CFSTR("SDDeviceWillClearAllRecords: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageDeviceReadyToReceiveChanges"), 1, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 15;
  return 0;
}

uint64_t sub_1000056FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a4, CFSTR("SDRemapRecordIdentifiers: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageRemapRecordIdentifiers"), 2, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 16;
  return 0;
}

uint64_t sub_100005770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!*(_QWORD *)(a1 + 48))
    return DLSetStatus(4294967292, a3, CFSTR("SDDeviceFinishedSession: Computer cannot call this method"));
  _DLRequestWrite(a1, CFSTR("SDMessageDeviceFinishedSession"), 1, a4, a5, a6);
  _DLRequestRead(a1);
  *(_DWORD *)a1 = 18;
  return 0;
}

uint64_t sub_1000057E8(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _DLRequestWrite(a1, CFSTR("SDMessageCancelSession"), 2, a4, a5, a6);
  *a1 = 19;
  return 0;
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_isEphemeralMultiUser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEphemeralMultiUser");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}
