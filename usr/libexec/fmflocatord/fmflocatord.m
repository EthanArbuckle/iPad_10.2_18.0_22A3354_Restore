void sub_1000068B4(id a1)
{
  FMFLocatorDaemon *v1;
  void *v2;

  v1 = objc_alloc_init(FMFLocatorDaemon);
  v2 = (void *)qword_100069560;
  qword_100069560 = (uint64_t)v1;

}

NSDictionary *__cdecl sub_100006984(id a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  const __CFString *v7;
  CFDictionaryRef v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  const __CFString *v15;
  CFDictionaryRef v16;
  _BYTE v17[128];
  _QWORD v18[2];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v18[0] = CFSTR("com.apple.icloud.fmflocatord");
  v18[1] = CFSTR("com.apple.icloud.fmflocatord.notbackedup");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(const __CFString **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v8 = CFPreferencesCopyMultiple(0, v7, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
        v15 = v7;
        v16 = v8;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, (_QWORD)v11));
        objc_msgSend(v1, "addEntriesFromDictionary:", v9);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

  return (NSDictionary *)v1;
}

void sub_100007050(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "apsHandlerForEnvironment:", v3));
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Checked in APS mach handlder %@:%@", (uint8_t *)&v7, 0x16u);
  }

}

void sub_100007464(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("LocationServicesStateChangedNotification"), 0);

}

void sub_1000074A8(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("FMFLocationServicesStateChangedNotification"), 0);

}

void sub_1000074EC(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("FMFRestrictionsMayHaveChangedNotification"), 0);

}

void sub_100007530(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("DeviceNameMayHaveChangedNotification"), 0);

}

void sub_100007574(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("DeviceLocaleMayHaveChangedNotification"), 0);

}

void sub_1000075B8(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("purplebuddy.setupdone"), 0);

}

void sub_1000075FC(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("nano.devicedidpair"), 0);

}

void sub_100007640(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("nano.devicedidunpair"), 0);

}

void sub_100007740(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = a2;
  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected app state event: register.", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil userInfoFrom:](CommonUtil, "userInfoFrom:", v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", off_100068DF0, 0, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotification:", v6);

}

void sub_100007820(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v2 = a2;
  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Detected app state event: unregister.", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CommonUtil userInfoFrom:](CommonUtil, "userInfoFrom:", v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification notificationWithName:object:userInfo:](NSNotification, "notificationWithName:object:userInfo:", off_100068DF0, 0, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotification:", v6);

}

void sub_100007D34()
{
  __CFArray *Mutable;
  __CFArray *v1;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v3;
  CFStringRef NetworkInterfaceEntity;
  CFStringRef v5;
  CFStringRef v6;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v8;
  __CFRunLoop *Current;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  SCDynamicStoreContext v37;

  if (!qword_100069570)
  {
    memset(&v37, 0, sizeof(v37));
    qword_100069570 = (uint64_t)SCDynamicStoreCreate(0, CFSTR("com.apple.icloud.fmflocatord"), (SCDynamicStoreCallBack)sub_100007FCC, &v37);
    if (qword_100069570)
    {
      Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      v1 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
      CFArrayAppendValue(Mutable, NetworkGlobalEntity);
      CFRelease(NetworkGlobalEntity);
      v3 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv6);
      CFArrayAppendValue(Mutable, v3);
      CFRelease(v3);
      NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
      CFArrayAppendValue(v1, NetworkInterfaceEntity);
      CFRelease(NetworkInterfaceEntity);
      v5 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv6);
      CFArrayAppendValue(v1, v5);
      CFRelease(v5);
      v6 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
      CFArrayAppendValue(Mutable, v6);
      CFRelease(v6);
      RunLoopSource = SCDynamicStoreCreateRunLoopSource(0, (SCDynamicStoreRef)qword_100069570, 0);
      if (RunLoopSource)
      {
        v8 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v8, kCFRunLoopDefaultMode);
        if (!SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_100069570, Mutable, v1))
        {
          v10 = sub_10001C4E8();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            sub_100033754(v11, v12, v13, v14, v15, v16, v17, v18);

        }
        CFRelease(v8);
      }
      else
      {
        v28 = sub_10001C4E8();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          sub_100033724(v29, v30, v31, v32, v33, v34, v35, v36);

      }
      CFRelease(Mutable);
      CFRelease(v1);
      byte_100069578 = sub_100008168();
    }
    else
    {
      v19 = sub_10001C4E8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        sub_1000336F4(v20, v21, v22, v23, v24, v25, v26, v27);

    }
  }
}

void sub_100007FCC()
{
  CFAbsoluteTime Current;
  __CFRunLoop *v1;

  byte_100069579 = 0;
  if (qword_100069580)
  {
    CFRunLoopTimerInvalidate((CFRunLoopTimerRef)qword_100069580);
    CFRelease((CFTypeRef)qword_100069580);
    qword_100069580 = 0;
  }
  Current = CFAbsoluteTimeGetCurrent();
  qword_100069580 = (uint64_t)CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 5.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_100008058, 0);
  v1 = CFRunLoopGetCurrent();
  CFRunLoopAddTimer(v1, (CFRunLoopTimerRef)qword_100069580, kCFRunLoopDefaultMode);
}

void sub_100008058(uint64_t a1)
{
  CFNumberRef v1;
  CFNumberRef v2;
  CFDictionaryRef v3;
  const __CFDictionary *v4;
  __CFNotificationCenter *LocalCenter;
  int valuePtr;
  void *keys;
  void *values;

  if (qword_100069580 == a1)
  {
    byte_100069578 = sub_100008168();
    CFRelease((CFTypeRef)qword_100069580);
    qword_100069580 = 0;
  }
  valuePtr = byte_100069578;
  v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v1)
  {
    v2 = v1;
    values = v1;
    keys = CFSTR("IsNetworkAvailable");
    v3 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v3)
    {
      v4 = v3;
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, CFSTR("com.apple.icloud.fmflocatord.networkChanged"), 0, v4, 0);
      CFRelease(v4);
    }
    CFRelease(v2);
  }
}

uint64_t sub_100008168()
{
  uint64_t result;
  __objc2_prot_list **p_prots;
  const __CFString *NetworkInterface;
  const void *v3;
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID TypeID;
  const __CFArray *Value;
  CFTypeID v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  char v12;
  const __CFString *ValueAtIndex;
  const __CFString *v14;
  const __CFString *NetworkInterfaceEntity;
  const __CFArray *v16;
  const __CFArray *v17;

  result = 0;
  p_prots = &OBJC_PROTOCOL___NSURLSessionDelegate.prots;
  if ((byte_100069579 & 1) == 0 && qword_100069570)
  {
    NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, kSCDynamicStoreDomainState);
    if (!NetworkInterface)
      goto LABEL_22;
    v3 = NetworkInterface;
    v4 = SCDynamicStoreCopyValue((SCDynamicStoreRef)qword_100069570, NetworkInterface);
    if (!v4)
    {
      v12 = 0;
LABEL_25:
      CFRelease(v3);
      goto LABEL_26;
    }
    v5 = v4;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID != CFGetTypeID(v5))
      goto LABEL_9;
    Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v5, kSCDynamicStorePropNetInterfaces);
    if (!Value)
      goto LABEL_10;
    v8 = CFArrayGetTypeID();
    if (v8 == CFGetTypeID(Value))
      Value = CFArrayCreateCopy(0, Value);
    else
LABEL_9:
      Value = 0;
LABEL_10:
    CFRelease(v5);
    CFRelease(v3);
    if (Value)
    {
      Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        v10 = Count;
        v11 = 0;
        v12 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(Value, v11);
          if (!ValueAtIndex)
            goto LABEL_18;
          v14 = ValueAtIndex;
          if (CFStringFind(ValueAtIndex, CFSTR("lo"), 8uLL).location != -1)
            goto LABEL_18;
          NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v14, kSCEntNetIPv4);
          v16 = SCDynamicStoreCopyKeyList((SCDynamicStoreRef)qword_100069570, NetworkInterfaceEntity);
          if (!v16)
            break;
          v17 = v16;
          v12 = v12 & 1 | (CFArrayGetCount(v16) > 0);
          CFRelease(v17);
          if (NetworkInterfaceEntity)
            goto LABEL_17;
LABEL_18:
          if (v10 == ++v11)
          {
            v3 = Value;
            p_prots = (__objc2_prot_list **)(&OBJC_PROTOCOL___NSURLSessionDelegate + 16);
            goto LABEL_25;
          }
        }
        if (!NetworkInterfaceEntity)
          goto LABEL_18;
LABEL_17:
        CFRelease(NetworkInterfaceEntity);
        goto LABEL_18;
      }
      v12 = 0;
      v3 = Value;
      goto LABEL_25;
    }
LABEL_22:
    v12 = 0;
LABEL_26:
    *((_BYTE *)p_prots + 1401) = 1;
    return v12 & 1;
  }
  return result;
}

void sub_100008368(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1000085D0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("account")));

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "account"));
  v5 = v6;
  if (v6 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountDeactivated");
    v5 = v6;
  }

}

void sub_10000864C(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("account")));

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "account"));
  v5 = v6;
  if (v6 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountDidChange");
    v5 = v6;
  }

}

void sub_100008970(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locManager"));
  objc_msgSend(*(id *)(a1 + 32), "setLocManager:", 0);
  objc_msgSend(v2, "setDelegate:", 0);
  objc_msgSend(v2, "stopUpdatingLocation");

}

uint64_t sub_1000089C8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100008F38(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locManager"));
  objc_msgSend(v2, "setDelegate:", 0);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locManager"));
  objc_msgSend(v3, "stopUpdatingLocation");

  return objc_msgSend(*(id *)(a1 + 32), "setLocManager:", 0);
}

void sub_10000A10C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000A244(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_10003399C(v2);

  v3 = -[ServiceProviderMgr initSingleton]([ServiceProviderMgr alloc], "initSingleton");
  v4 = (void *)qword_100069588;
  qword_100069588 = (uint64_t)v3;

}

void sub_10000A604(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountTypeToServiceProviderType"));
  v6 = (objc_class *)objc_opt_class(v3, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_msgSend(v4, "objectForKeyedSubscript:", v8);

  v10 = objc_alloc_init(v9);
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setAccount:", v3);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountUUIDToServiceProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  else
  {
    v14 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100033A1C((uint64_t)v3, (uint64_t)v9);
  }

}

void sub_10000A710(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "start");
}

void sub_10000A7AC(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "stop");
}

void sub_10000AA14(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  objc_class *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  int v22;
  void *v23;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    objc_msgSend(v7, "removeObjectForKey:", v8);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountTypeToServiceProviderType"));
    v11 = (objc_class *)objc_opt_class(v3, v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (objc_class *)objc_msgSend(v9, "objectForKeyedSubscript:", v13);

    v15 = objc_alloc_init(v14);
    if (v15)
    {
      v6 = v15;
      -[NSObject setAccount:](v15, "setAccount:", v3);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountUUIDToServiceProvider"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v6, v17);

      v18 = sub_10001C4E8();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fm_logID](v6, "fm_logID"));
        v22 = 138412290;
        v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Created new service provider : %@", (uint8_t *)&v22, 0xCu);

      }
      -[NSObject start](v6, "start");
    }
    else
    {
      v21 = sub_10001C4E8();
      v6 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_100033A1C((uint64_t)v3, (uint64_t)v14);
    }
  }

}

void sub_10000AC10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "stop");
  v7 = sub_10001C4E8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_logID"));
    v11 = 138412290;
    v12 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing service provider : %@", (uint8_t *)&v11, 0xCu);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "accountUUIDToServiceProvider"));
  objc_msgSend(v10, "removeObjectForKey:", v6);

}

id sub_10000ADF0(id a1)
{
  return a1;
}

void sub_10000AE08(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000B0B0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10000B310(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10000B4BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_10000B8D8(id a1, BOOL a2)
{
  id v2;

  if (a2)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
    objc_msgSend(v2, "eventDidOccur:", 10);

  }
}

void sub_10000C574(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C590(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;

  v1 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_sync_enter(v1);
  if (v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "apsToken"));

    if (!v2)
    {
      v3 = sub_10001C4E8();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "serviceName"));
        v6 = 138412290;
        v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ is not functional as an APS token is not available.", (uint8_t *)&v6, 0xCu);

      }
    }
  }
  objc_sync_exit(v1);

}

void sub_10000C688(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000C9C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerDeviceWithCause:", CFSTR("AllPushTokensUpdated"));
}

void sub_10000D3E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D8D4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

  }
  else if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") <= 399)
  {
    v10 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v11 = 138412546;
    v12 = v7;
    v13 = 2048;
    v14 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Fence trigger was sent successfully with status %ld", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v8 = objc_msgSend(v3, "httpResponseStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
    v11 = 138412802;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending fence trigger: %@", (uint8_t *)&v11, 0x20u);

LABEL_6:
  }
LABEL_7:

}

void sub_10000DC1C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") > 399)
  {
LABEL_4:
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v8 = objc_msgSend(v3, "httpResponseStatus");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
      v16 = 138412802;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for fences command: %@", (uint8_t *)&v16, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = sub_10001C4E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v16 = 138412546;
    v17 = v14;
    v18 = 2048;
    v19 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: Fences command was acked successfully with status %ld", (uint8_t *)&v16, 0x16u);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v11 = *(void (**)(void))(v15 + 16);
    goto LABEL_8;
  }
LABEL_9:

}

void sub_10000E01C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v3 = objc_msgSend(v2, "isBuddyDone");

  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", *(_QWORD *)(a1 + 32), CFSTR("purplebuddy.setupdone"), 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buddyWaitTimer"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buddyWaitTimer"));
      objc_msgSend(v6, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setBuddyWaitTimer:", 0);
    }
    objc_msgSend(*(id *)(a1 + 32), "setWaitingForBuddy:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
    v9 = objc_msgSend(v7, "activeAccountsOfType:", objc_opt_class(FMFAccount, v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
    objc_msgSend(v10, "endTransaction:", CFSTR("FMFWaitingForBuddy"));

    objc_msgSend(*(id *)(a1 + 32), "performInitialSetup");
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "waitingForBuddy") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setWaitingForBuddy:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
      objc_msgSend(v11, "beginTransaction:", CFSTR("FMFWaitingForBuddy"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v12, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "buddyDidComplete:", CFSTR("purplebuddy.setupdone"), 0);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "buddyWaitTimer"));
    objc_msgSend(v13, "invalidate");

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), "_buddyCompletionCheckTimerFired:", 0, 0, 10.0));
    objc_msgSend(*(id *)(a1 + 32), "setBuddyWaitTimer:", v14);

    v15 = sub_10001C4E8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FMF is not active yet since buddy is yet to complete.", v17, 2u);
    }

  }
}

void sub_10000E2D4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  NSObject *v7;
  FMFIDSSupportProtoDeviceInformation *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v5 = a4;
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received request %@ to send paired device data", (uint8_t *)&v15, 0xCu);
  }

  v8 = objc_alloc_init(FMFIDSSupportProtoDeviceInformation);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceUDID"));
  -[FMFIDSSupportProtoDeviceInformation setUdid:](v8, "setUdid:", v10);

  v11 = objc_alloc((Class)IDSProtobuf);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFIDSSupportProtoDeviceInformation data](v8, "data"));
  v13 = objc_msgSend(v11, "initWithProtobufData:type:isResponse:", v12, 1, 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "idsManager"));
  objc_msgSend(v14, "sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:requestAcceptedHandler:responseHandler:", v13, v5, 0, 1, 0, 0, 0.0);

}

void sub_10000E890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000EC88(uint64_t a1)
{
  return +[CommonUtil stringForFourCC:](CommonUtil, "stringForFourCC:", a1);
}

void sub_100010964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001097C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001098C(uint64_t a1)
{

}

id sub_100010994(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fm_logID"));
    v5 = (void *)v4;
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(unsigned __int8 *)(a1 + 64);
    *(_DWORD *)buf = 138412802;
    if (v7)
      v8 = CFSTR("yes");
    else
      v8 = CFSTR("no");
    v19 = v4;
    v20 = 2112;
    v21 = v6;
    v22 = 2112;
    v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ - registerDeviceWithCause %@ %@", buf, 0x20u);

  }
  if (*(_BYTE *)(a1 + 64))
  {
    v9 = sub_10001C4E8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fm_logID"));
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v19 = (uint64_t)v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ Register for cause %@ is being forced", buf, 0x16u);

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Forced-%@"), *(_QWORD *)(a1 + 40)));
    else
      v14 = CFSTR("Forced");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v14);
    if (v13)

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastForcedRegisterTimePrefKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    +[FMPreferencesUtil setDate:forKey:inDomain:](FMPreferencesUtil, "setDate:forKey:inDomain:", v16, v15, CFSTR("com.apple.icloud.fmflocatord.notbackedup"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "_registerDeviceWithCause:includeKeys:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
}

void sub_100011234(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011270(uint64_t a1)
{
  objc_storeStrong((id *)&qword_1000695B8, *(id *)(a1 + 32));
}

void sub_100011280(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v5 = (void *)qword_1000695B8;
  if (qword_1000695B8 == *(_QWORD *)(a1 + 32))
  {
    qword_1000695B8 = 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v6 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

LABEL_6:
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serviceName"));
      v10 = objc_msgSend(v3, "httpResponseStatus");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
      *(_DWORD *)buf = 138412802;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during register device: %@", buf, 0x20u);

    }
    objc_msgSend(WeakRetained, "registerDidFail");
    goto LABEL_9;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") > 399)
    goto LABEL_6;
  v12 = sub_10001C4E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "serviceName"));
    *(_DWORD *)buf = 138412546;
    v19 = v14;
    v20 = 2048;
    v21 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: Register device was successful with status %ld", buf, 0x16u);

  }
  +[FMPreferencesUtil setData:forKey:inDomain:](FMPreferencesUtil, "setData:forKey:inDomain:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("com.apple.icloud.fmflocatord.notbackedup"));
  if ((objc_msgSend(*(id *)(a1 + 48), "completedStartupRegister") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 48), "setCompletedStartupRegister:", 1);
  objc_msgSend(WeakRetained, "registerDidSucceed");
  if (objc_msgSend(v3, "httpResponseStatus") == (id)200)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
    objc_msgSend(v15, "eventDidOccur:", 2);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011550;
    block[3] = &unk_100055230;
    block[4] = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  else if (objc_msgSend(v3, "httpResponseStatus") == (id)204)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
    objc_msgSend(v16, "eventDidOccur:", 3);

  }
LABEL_9:

}

id sub_100011550(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendQueueCheckRequest:", 0);
}

void sub_1000115E8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

LABEL_4:
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v8 = objc_msgSend(v3, "httpResponseStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
    *(_DWORD *)buf = 138412802;
    v13 = v7;
    v14 = 2048;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during unregister device: %@", buf, 0x20u);

    goto LABEL_6;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") > 399)
    goto LABEL_4;
  v10 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    *(_DWORD *)buf = 138412546;
    v13 = v7;
    v14 = 2048;
    v15 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Unregister device was successful with status %ld.", buf, 0x16u);
LABEL_6:

  }
LABEL_7:

  if ((objc_msgSend(v3, "willRetry") & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000117E8;
    block[3] = &unk_100055230;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

id sub_1000117E8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "account"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueId"));
    v10 = 138412546;
    v11 = v4;
    v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: Removing the account : %@", (uint8_t *)&v10, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "account"));
  objc_msgSend(v7, "removeInactiveAccount:", v8);

  return +[RealmSupport setServerContextHeaderString:](RealmSupport, "setServerContextHeaderString:", 0);
}

void sub_1000119DC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") <= 399)
  {
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v18 = 138412546;
      v19 = v12;
      v20 = 2048;
      v21 = objc_msgSend(v3, "httpResponseStatus");
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@: Queue check was successful with status %ld.", (uint8_t *)&v18, 0x16u);

    }
    if (objc_msgSend(v3, "httpResponseStatus") == (id)200)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
      v14 = v13;
      v15 = 5;
    }
    else if (objc_msgSend(v3, "httpResponseStatus") == (id)204)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
      v14 = v13;
      v15 = 6;
    }
    else
    {
      if (objc_msgSend(v3, "httpResponseStatus") != (id)210)
      {
LABEL_17:
        v16 = *(void **)(a1 + 32);
        v17 = objc_msgSend(v3, "httpResponseStatus");
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseBody"));
        objc_msgSend(v16, "handleQueueCheckResponseWithStatus:andBody:", v17, v6);
        goto LABEL_6;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
      v14 = v13;
      v15 = 7;
    }
    objc_msgSend(v13, "eventDidOccur:", v15);

    goto LABEL_17;
  }
LABEL_4:
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v8 = objc_msgSend(v3, "httpResponseStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
    v18 = 138412802;
    v19 = v7;
    v20 = 2048;
    v21 = v8;
    v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld during queue check: %@", (uint8_t *)&v18, 0x20u);

  }
LABEL_6:

}

void sub_100011E88(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

  }
  else if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") <= 399)
  {
    v10 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v10);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v11 = 138412546;
    v12 = v7;
    v13 = 2048;
    v14 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Current location was sent successfully with status %ld", (uint8_t *)&v11, 0x16u);
    goto LABEL_6;
  }
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v8 = objc_msgSend(v3, "httpResponseStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
    v11 = 138412802;
    v12 = v7;
    v13 = 2048;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending current location: %@", (uint8_t *)&v11, 0x20u);

LABEL_6:
  }
LABEL_7:

}

void sub_1000121D0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") > 399)
  {
LABEL_4:
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v8 = objc_msgSend(v3, "httpResponseStatus");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
      v16 = 138412802;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for register command: %@", (uint8_t *)&v16, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = sub_10001C4E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v16 = 138412546;
    v17 = v14;
    v18 = 2048;
    v19 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: Register command was acked successfully with status %ld", (uint8_t *)&v16, 0x16u);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v11 = *(void (**)(void))(v15 + 16);
    goto LABEL_8;
  }
LABEL_9:

}

void sub_100012568(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
  if (v4 || (uint64_t)objc_msgSend(v3, "httpResponseStatus") < 200)
  {

    goto LABEL_4;
  }
  if ((uint64_t)objc_msgSend(v3, "httpResponseStatus") > 399)
  {
LABEL_4:
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
      v8 = objc_msgSend(v3, "httpResponseStatus");
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "httpResponseError"));
      v16 = 138412802;
      v17 = v7;
      v18 = 2048;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: Error %ld sending ack for locate command: %@", (uint8_t *)&v16, 0x20u);

    }
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
    {
      v11 = *(void (**)(void))(v10 + 16);
LABEL_8:
      v11();
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v12 = sub_10001C4E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "serviceName"));
    v16 = 138412546;
    v17 = v14;
    v18 = 2048;
    v19 = objc_msgSend(v3, "httpResponseStatus");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%@: Locate command was acked successfully with status %ld", (uint8_t *)&v16, 0x16u);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
  {
    v11 = *(void (**)(void))(v15 + 16);
    goto LABEL_8;
  }
LABEL_9:

}

void sub_100012BF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100013274(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "OK button tapped. Performing action %@", (uint8_t *)&v6, 0xCu);
  }

  return +[CommonUtil handleAlertAction:](CommonUtil, "handleAlertAction:", *(_QWORD *)(a1 + 40));
}

id sub_100013328(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Cancel button tapped. Performing action %@", (uint8_t *)&v6, 0xCu);
  }

  return +[CommonUtil handleAlertAction:](CommonUtil, "handleAlertAction:", *(_QWORD *)(a1 + 40));
}

void sub_1000133DC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
  objc_msgSend(v2, "activateAlert:", *(_QWORD *)(a1 + 32));

}

void sub_100013B24(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100013D44(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100013EDC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1000141B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1000143B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Exception while trying to load FMF accounts: %@", (uint8_t *)&a9, 0xCu);

    }
    objc_end_catch();
    JUMPOUT(0x100014380);
  }
  _Unwind_Resume(exception_object);
}

void sub_10001454C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  uint8_t buf[4];
  void *v15;

  v3 = a2;
  if (objc_msgSend(v3, "appAuthTokenStatus"))
  {
    v4 = sub_10001C4E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Re-reading app auth token for account %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_fetchAppAuthToken:", v3);
  }
  if (objc_msgSend(v3, "internalAuthTokenStatus"))
  {
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "username"));
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Re-reading internal auth token for account %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "_fetchInternalAuthToken:", v3);
    v12 = CFSTR("account");
    v13 = v3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("AccountStoreUpdatedAccountNotification"), 0, v10);

  }
}

void sub_100014CE4(id a1)
{
  PowerMgr *v1;
  void *v2;
  id v3;

  v1 = objc_opt_new(PowerMgr);
  v2 = (void *)qword_1000695C0;
  qword_1000695C0 = (uint64_t)v1;

  v3 = objc_alloc_init((Class)FMConcurrentMutableDictionary);
  objc_msgSend((id)qword_1000695C0, "setAssertionsDict:", v3);

}

void sub_1000151E4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  id v13;
  id v14;
  NSObject *v15;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(a1);
    v14 = sub_10001C4E8();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Exception caught while attempting to take power assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x100015144);
  }
  _Unwind_Resume(a1);
}

void sub_100015418(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  id v11;
  id v12;
  NSObject *v13;

  if (a2 == 1)
  {
    v11 = objc_begin_catch(a1);
    v12 = sub_10001C4E8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Exception caught while attempting to release power assertion: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1000153D8);
  }
  _Unwind_Resume(a1);
}

void sub_10001567C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id sub_100015A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[StandardLocatorActions didReceiveLocation:isFinished:inProvider:forCmd:withReason:andAccuracyChange:](StandardLocatorActions, "didReceiveLocation:isFinished:inProvider:forCmd:withReason:andAccuracyChange:", a2, a3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a4);
}

id sub_100015AAC(uint64_t a1)
{
  return +[StandardLocatorActions didStopLocatingInProvider:](StandardLocatorActions, "didStopLocatingInProvider:", *(_QWORD *)(a1 + 32));
}

const __CFString *sub_100016104(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("enter");
  else
    return *(&off_100055770 + a1 - 1);
}

const __CFString *sub_10001612C(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("in");
  else
    return *(&off_100055788 + a1);
}

uint64_t sub_100016150(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(CFSTR("enter"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(CFSTR("exit"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(CFSTR("both"), "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(CFSTR("scheduled"), "isEqualToString:", v1))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_10001708C(id a1)
{
  FMFFencesMgr *v1;
  void *v2;

  v1 = objc_alloc_init(FMFFencesMgr);
  v2 = (void *)qword_1000695D8;
  qword_1000695D8 = (uint64_t)v1;

}

void sub_1000172D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100034144();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setAllFences:", a2);
  }

}

id sub_100017488(uint64_t a1)
{
  _TtC11fmflocatord19FindMyLocateSession *v2;
  void *v3;

  v2 = objc_opt_new(_TtC11fmflocatord19FindMyLocateSession);
  v3 = (void *)qword_1000695E0;
  qword_1000695E0 = (uint64_t)v2;

  return _objc_msgSend(*(id *)(a1 + 32), "setupSessionCallbacks:", qword_1000695E0);
}

id sub_1000175E0(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locMgr"));
  objc_msgSend(v2, "setDelegate:", 0);

  return _objc_msgSend(*(id *)(a1 + 32), "setLocMgr:", 0);
}

uint64_t sub_100017620(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000176D8(uint64_t a1, void *a2)
{
  id v3;
  const char *string;
  void *v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;

  v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", string));
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[FMFFencesMgr registerAlarms]_block_invoke";
    v13 = 2112;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: XPC Alarm fired with name: %@", (uint8_t *)&v11, 0x16u);
  }

  v8 = *(const char **)(a1 + 40);
  if (!strcmp(string, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "scheduler"));
    objc_msgSend(v9, "notifyDelegateThatCurrentSchedulesDidChange");

    v8 = *(const char **)(a1 + 40);
  }
  v10 = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  xpc_set_event(v8, v10, 0);

}

id sub_100017B50(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "locMgr"));
  objc_msgSend(v2, "setDelegate:", 0);

  return _objc_msgSend(*(id *)(a1 + 32), "setLocMgr:", 0);
}

void sub_100017E38(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;

  v3 = a2;
  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      v10 = 136315394;
      v11 = "-[FMFFencesMgr triggerFence:atLocation:]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fenceId"));
    v8 = sub_10001612C((unint64_t)objc_msgSend(*(id *)(a1 + 32), "lastTrigger"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 136315650;
    v11 = "-[FMFFencesMgr triggerFence:atLocation:]_block_invoke";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: triggered fence: %@ trigger: %@", (uint8_t *)&v10, 0x20u);

  }
}

void sub_100018040(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  unsigned __int8 v9;
  id v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10003421C();
  }
  else
  {
    v9 = objc_msgSend(v5, "isThisDevice");
    v10 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    v11 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if ((v9 & 1) != 0)
    {
      if (v11)
      {
        v17 = 136315138;
        v18 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: triggering over IDS since this is me device", (uint8_t *)&v17, 0xCu);
      }

      v8 = objc_claimAutoreleasedReturnValue(+[FMFSession sharedInstance](FMFSession, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fenceId"));
      v14 = sub_10001612C((unint64_t)objc_msgSend(*(id *)(a1 + 32), "lastTrigger"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      -[NSObject triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:](v8, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:", v12, v13, v15, v16, *(_QWORD *)(a1 + 40), &stru_100055860);

    }
    else if (v11)
    {
      v17 = 136315394;
      v18 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: not triggering over IDS since this is not me device: %@", (uint8_t *)&v17, 0x16u);
    }
  }

}

void sub_100018240(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;

  v2 = a2;
  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_10003421C();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[FMFFencesMgr fmf_triggerFence:atLocation:]_block_invoke";
    v8 = 2112;
    v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: error: %@", (uint8_t *)&v6, 0x16u);
  }

}

id sub_10001877C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  if ((unint64_t)objc_msgSend(v4, "length") < 4
    || (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") < 4)
  {
    v7 = 0;
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
    v7 = objc_msgSend(v5, "hasPrefix:", v6);

  }
  return v7;
}

FenceScheduleProtocol *__cdecl sub_100018948(id a1, MonitoredFence *a2)
{
  return -[MonitoredFence schedule](a2, "schedule");
}

NSDictionary *__cdecl sub_1000195C4(id a1, MonitoredFence *a2)
{
  return -[MonitoredFence dictionary](a2, "dictionary");
}

MonitoredFence *__cdecl sub_1000197BC(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  MonitoredFence *v3;

  v2 = a2;
  v3 = -[MonitoredFence initWithDictionary:]([MonitoredFence alloc], "initWithDictionary:", v2);

  return v3;
}

BOOL sub_100019954(id a1, NSString *a2, MonitoredFence *a3)
{
  MonitoredFence *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  if ((id)-[MonitoredFence triggerType](v3, "triggerType") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MonitoredFence schedule](v3, "schedule"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v6 = objc_msgSend(v4, "isCurrentAt:", v5);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

void sub_100019C60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100019C88(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  void *v4;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  objc_msgSend(WeakRetained, "setAllFences:", v4);
}

void sub_100019CF0(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNetworkAvailable:", a2);

}

void sub_10001A414(id a1)
{
  void *v1;
  id v2;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  byte_1000695F0 = objc_msgSend(v1, "BOOLForKey:", CFSTR("FMFFenceTriggerDebugAlertEnabled"));

  if (byte_1000695F0)
  {
    v2 = (id)objc_claimAutoreleasedReturnValue(+[FMSystemInfo sharedInstance](FMSystemInfo, "sharedInstance"));
    byte_1000695F0 = objc_msgSend(v2, "isInternalBuild");

  }
  else
  {
    byte_1000695F0 = 0;
  }
}

void sub_10001A62C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10001A64C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

MonitoredFence *__cdecl sub_10001A83C(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  MonitoredFence *v3;

  v2 = a2;
  v3 = -[MonitoredFence initWithDictionary:]([MonitoredFence alloc], "initWithDictionary:", v2);

  return v3;
}

void sub_10001A880(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[FMFFencesMgr sharedInstance](FMFFencesMgr, "sharedInstance"));
  objc_msgSend(v2, "setFencesToMonitor:withFenceVersion:triggerValidityDuration:andTriggerURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));

}

void sub_10001A974(id a1)
{
  PreferencesMgr *v1;
  void *v2;

  v1 = objc_alloc_init(PreferencesMgr);
  v2 = (void *)qword_100069600;
  qword_100069600 = (uint64_t)v1;

}

void sub_10001B128(id a1)
{
  id v1;
  void *v2;

  v1 = -[SystemConfig initSingleton]([SystemConfig alloc], "initSingleton");
  v2 = (void *)qword_100069610;
  qword_100069610 = (uint64_t)v1;

}

id sub_10001B2B8()
{
  return +[NSTimeZone resetSystemTimeZone](NSTimeZone, "resetSystemTimeZone");
}

void sub_10001B4E4(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("SystemConfig-deviceName", 0);
  v2 = (void *)qword_100069628;
  qword_100069628 = (uint64_t)v1;

}

uint64_t sub_10001B510(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001B520(uint64_t a1)
{

}

id sub_10001B528(uint64_t a1)
{
  void *v2;
  void **v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "deviceNameUpToDate") & 1) != 0)
  {
    v2 = (void *)qword_100069620;
    v3 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("UserAssignedDeviceName")));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v3 = (void **)&qword_100069620;
  }
  v7 = v2;
  v8 = *v3;
  *v3 = v7;

  return objc_msgSend(*(id *)(a1 + 32), "setDeviceNameUpToDate:", 1);
}

void sub_10001B764(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("DeviceClass")));
  v2 = (void *)qword_100069638;
  qword_100069638 = v1;

}

void sub_10001B8A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("UniqueDeviceID")));
  v2 = (void *)qword_100069648;
  qword_100069648 = v1;

}

void sub_10001B9B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("ProductType")));
  v2 = (void *)qword_100069660;
  qword_100069660 = v1;

}

void sub_10001BA58(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("ProductName")));
  v2 = (void *)qword_100069670;
  qword_100069670 = v1;

}

void sub_10001BB00(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferencesMgr"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overriddenOSVersion"));

  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("ProductVersion")));
  v4 = (void *)qword_100069680;
  qword_100069680 = v3;

}

void sub_10001BBE4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferencesMgr"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "overriddenBuildVersion"));

  if (!v3)
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("BuildVersion")));
  v4 = (void *)qword_100069690;
  qword_100069690 = v3;

}

void sub_10001BCEC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("DeviceColor")));
  v2 = (void *)qword_1000696A0;
  qword_1000696A0 = v1;

}

void sub_10001BD94(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("DeviceEnclosureColor")));
  v2 = (void *)qword_1000696B0;
  qword_1000696B0 = v1;

}

void sub_10001BE3C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_stringGestaltQueryForKey:", CFSTR("SerialNumber")));
  v2 = (void *)qword_1000696C0;
  qword_1000696C0 = v1;

}

id sub_10001C054(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "_BOOLGestaltQueryForKey:", CFSTR("eQd5mlz0BN0amTp/2ccMoA"));
  byte_1000696D0 = (char)result;
  return result;
}

id sub_10001C4E8()
{
  if (qword_1000696E0 != -1)
    dispatch_once(&qword_1000696E0, &stru_100055C60);
  return (id)qword_1000696E8;
}

void sub_10001C528(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmflocatord", "_");
  v2 = (void *)qword_1000696E8;
  qword_1000696E8 = (uint64_t)v1;

}

id sub_10001C558()
{
  if (qword_1000696F0 != -1)
    dispatch_once(&qword_1000696F0, &stru_100055C80);
  return (id)qword_1000696F8;
}

void sub_10001C598(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmflocatord", "Locations");
  v2 = (void *)qword_1000696F8;
  qword_1000696F8 = (uint64_t)v1;

}

id sub_10001C5C8()
{
  if (qword_100069700 != -1)
    dispatch_once(&qword_100069700, &stru_100055CA0);
  return (id)qword_100069708;
}

void sub_10001C608(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmflocatord", "Traffic");
  v2 = (void *)qword_100069708;
  qword_100069708 = (uint64_t)v1;

}

id sub_10001C638()
{
  if (qword_100069710 != -1)
    dispatch_once(&qword_100069710, &stru_100055CC0);
  return (id)qword_100069718;
}

void sub_10001C678(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmflocatord", "secureLocations");
  v2 = (void *)qword_100069718;
  qword_100069718 = (uint64_t)v1;

}

id sub_10001C6A8()
{
  if (qword_100069720 != -1)
    dispatch_once(&qword_100069720, &stru_100055CE0);
  return (id)qword_100069728;
}

void sub_10001C6E8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.icloud.fmflocatord", "Fences");
  v2 = (void *)qword_100069728;
  qword_100069728 = (uint64_t)v1;

}

void sub_10001C830(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100034D04(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = -[FMFConfig initSingleton]([FMFConfig alloc], "initSingleton");
  v11 = (void *)qword_100069730;
  qword_100069730 = (uint64_t)v10;

}

uint64_t start()
{
  void *v0;
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  v0 = objc_autoreleasePoolPush();
  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "fmflocatord has been launched", v6, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMFLocatorDaemon sharedInstance](FMFLocatorDaemon, "sharedInstance"));
  objc_msgSend(v3, "initialize");

  objc_autoreleasePoolPop(v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v4, "run");

  return 0;
}

void sub_10001CCA0(id a1)
{
  id v1;
  NSObject *v2;
  FMFAppStateObserver *v3;
  void *v4;
  uint8_t v5[16];

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMFAppStateObserver: Creating shared instance of FMFAppStateObserver", v5, 2u);
  }

  v3 = objc_alloc_init(FMFAppStateObserver);
  v4 = (void *)qword_100069748;
  qword_100069748 = (uint64_t)v3;

}

BOOL sub_10001CF54(id a1, NSString *a2)
{
  return -[NSString isEqualToString:](a2, "isEqualToString:", CFSTR("com.apple.findmy"));
}

void sub_10001D6DC(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100034DF8();

  v3 = -[AccountManager initSingleton]([AccountManager alloc], "initSingleton");
  v4 = (void *)qword_100069758;
  qword_100069758 = (uint64_t)v3;

}

void sub_10001D8F4(id a1, id a2, id a3, BOOL *a4)
{
  objc_msgSend(a3, "loadExistingAccounts");
}

void sub_10001D998(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accounts"));
  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v4);

}

void sub_10001DC14(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  if (*(void **)(a1 + 32) != a2)
  {
    v2 = *(void **)(a1 + 40);
    v3 = a2;
    v5 = objc_opt_class(v3, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueId"));

    objc_msgSend(v2, "deactivateAccountOfType:havingUniqueId:", v5, v6);
  }
}

void sub_10001DC98(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AccountListDidChangeNotification"), 0);

}

void sub_10001DCD8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100034E5C();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AccountDidUpdateNotification"), 0, *(_QWORD *)(a1 + 32));

}

void sub_10001DF00(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("account");
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AccountDidDeactivateNotificationKey"), 0, v4);

}

void sub_10001E1D0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("account");
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AccountDidDeactivateNotificationKey"), 0, v4);

}

void sub_10001E3DC(id a1, id a2, unint64_t a3, BOOL *a4)
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v4 = a2;
  if (objc_msgSend(v4, "isActive"))
  {
    v5 = sub_10001C4E8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100034E88(v4, v6);

    objc_msgSend(v4, "setIsActive:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E49C;
    block[3] = &unk_100055230;
    v8 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_10001E49C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v3 = *(_QWORD *)(a1 + 32);
  v5 = CFSTR("account");
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AccountDidDeactivateNotificationKey"), 0, v4);

}

void sub_10001E6B8(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AccountListDidChangeNotification"), 0);

}

void sub_10001E85C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isActive"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_10001EB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001EB58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10001EB68(uint64_t a1)
{

}

void sub_10001EB70(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueId"));
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_10001ED30(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100034F4C();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AccountDidUpdateNotification"), 0, *(_QWORD *)(a1 + 32));

}

void sub_10001EF2C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;

  v2 = sub_10001C4E8();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100034F78();

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("AccountDidUpdateNotification"), 0, *(_QWORD *)(a1 + 32));

}

void sub_10001F20C(id a1)
{
  id v1;
  NSObject *v2;
  id v3;
  void *v4;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100034FA4(v2);

  v3 = -[AppleAccountManager initSingleton]([AppleAccountManager alloc], "initSingleton");
  v4 = (void *)qword_100069768;
  qword_100069768 = (uint64_t)v3;

}

id sub_10001F78C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "syncFMFAccountInfo");
}

void sub_10001F85C(uint64_t a1, unint64_t a2, void *a3)
{
  __CFString *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;

  v5 = a3;
  if (a2 > 2)
    v6 = 0;
  else
    v6 = (uint64_t)*(&off_100055F08 + a2);
  v7 = sub_10001C4E8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "iCloudACAccount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "aa_personID"));
    v11 = CFSTR(" Error: ");
    v14 = 138413058;
    v15 = v10;
    v12 = &stru_100057AE0;
    v16 = 2112;
    if (!v5)
      v11 = &stru_100057AE0;
    v17 = v6;
    if (v5)
      v12 = v5;
    v18 = 2112;
    v19 = v11;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Renew account credentials for account %@ - status %@.%@%@", (uint8_t *)&v14, 0x2Au);

  }
  v13 = *(_QWORD *)(a1 + 40);
  if (v13)
    (*(void (**)(uint64_t, unint64_t, __CFString *))(v13 + 16))(v13, a2, v5);

}

uint64_t sub_10001F9D4()
{
  return _os_feature_enabled_impl("FindMy", "Fences_Migration") ^ 1;
}

void sub_100020304(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "provider"));
  objc_msgSend(v2, "registerDeviceWithCause:force:", CFSTR("RegisterCommand"), 1);
  objc_msgSend(*(id *)(a1 + 32), "_endXPCTransaction");

}

void sub_1000207AC(id a1)
{
  NSArray *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  size_t v7;
  CFURLRef v8;
  const void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v1 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("com.apple.icloud.fmflocatord")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("cookies")));

  v21 = objc_retainAutorelease(v5);
  v6 = (const char *)objc_msgSend(v21, "UTF8String");
  v7 = strlen(v6);
  v8 = CFURLCreateFromFileSystemRepresentation(kCFAllocatorDefault, (const UInt8 *)v6, v7, 1u);
  v9 = (const void *)CFHTTPCookieStorageCreateFromFile(kCFAllocatorDefault, v8, 0);
  v10 = objc_msgSend(objc_alloc((Class)NSHTTPCookieStorage), "_initWithCFHTTPCookieStorage:", v9);
  v11 = (void *)qword_100069798;
  qword_100069798 = (uint64_t)v10;

  if (v8)
    CFRelease(v8);
  if (v9)
    CFRelease(v9);
  v12 = objc_claimAutoreleasedReturnValue(+[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration"));
  v13 = (void *)qword_100069790;
  qword_100069790 = v12;

  objc_msgSend((id)qword_100069790, "setHTTPCookieStorage:", qword_100069798);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleIdentifier"));

  v16 = objc_msgSend(objc_alloc((Class)AKAppleIDSession), "initWithIdentifier:", v15);
  objc_msgSend((id)qword_100069790, "set_appleIDContext:", v16);
  v17 = qword_100069790;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v19 = objc_claimAutoreleasedReturnValue(+[FMFURLSessionFactory sessionWithConfiguration:delegate:delegateQueue:](FMFURLSessionFactory, "sessionWithConfiguration:delegate:delegateQueue:", v17, 0, v18));
  v20 = (void *)qword_100069788;
  qword_100069788 = v19;

}

void sub_100021748(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (a2)
  {
    _Block_object_dispose(&a23, 8);
    objc_begin_catch(exception_object);
    JUMPOUT(0x100021380);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100021814(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100021824(uint64_t a1)
{

}

void sub_10002182C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  NSObject *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  id v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  id v71;
  __int16 v72;
  void *v73;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "cancelled") & 1) != 0)
    goto LABEL_38;
  v11 = v8;
  v12 = sub_10001C4E8();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v62 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "fm_logID"));
    v60 = v7;
    v15 = v8;
    v16 = objc_msgSend(v11, "statusCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "domain"));
    v18 = objc_msgSend(*(id *)(a1 + 40), "code");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allHeaderFields"));
    v61 = v9;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
    *(_DWORD *)buf = 138413314;
    v65 = v14;
    v66 = 2048;
    v67 = v16;
    v8 = v15;
    v7 = v60;
    v68 = 2112;
    v69 = v17;
    v70 = 2048;
    v71 = v18;
    v72 = 2112;
    v73 = v20;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@ received response with status %ld, error %@:%ld, headers: \n%@", buf, 0x34u);

    v11 = v62;
    v9 = v61;

  }
  if (v7)
    v21 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
  else
    v21 = 0;
  v22 = sub_10001C5C8();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "fm_logID"));
    *(_DWORD *)buf = 138412546;
    v65 = v24;
    v66 = 2112;
    v67 = v21;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@ raw response body : %@", buf, 0x16u);

  }
  objc_msgSend(*v10, "setHttpResponseStatus:", objc_msgSend(v11, "statusCode"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allHeaderFields"));
  objc_msgSend(*v10, "setHttpResponseHeaders:", v25);

  objc_msgSend(*v10, "setHttpResponseError:", v9);
  if (objc_msgSend(v7, "length"))
  {
    v63 = 0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 0, &v63));
    v27 = v63;
    v28 = v27;
    if (v26 || !v27)
    {
      objc_msgSend(*v10, "setHttpResponseBody:", v26);
      if (!v26)
      {
LABEL_18:

        goto LABEL_19;
      }
      v31 = sub_10001C5C8();
      v30 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "fm_logID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
        *(_DWORD *)buf = 138412546;
        v65 = v32;
        v66 = 2112;
        v67 = v33;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%@ response body dictionary : \n%@", buf, 0x16u);

        v11 = v62;
      }
    }
    else
    {
      v29 = sub_10001C4E8();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_1000351E4((id *)(a1 + 32), (uint64_t)v28, v30);
    }

    goto LABEL_18;
  }
LABEL_19:
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "httpResponseBody"));

  if (v34)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "httpResponseBody"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("alert")));
    objc_msgSend(*v10, "setAlertFromServerResponse:", v36);

    v11 = v62;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v10, "alertFromServerResponse"));

    if (v37)
    {
      v38 = sub_10001C4E8();
      v39 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        sub_10003514C((id *)(a1 + 32));

    }
  }
  objc_msgSend(*v10, "setCurrentDataTask:", 0);
  objc_msgSend(*v10, "setIsComplete:", objc_msgSend(*v10, "responseErrorType") == 0);
  if (objc_msgSend(*v10, "responseErrorType") == (id)769)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "httpResponseHeaders"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringForCaseInsensitiveStringKey:", CFSTR("X-Apple-MMe-Host")));
    v42 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v43 = *(void **)(v42 + 40);
    *(_QWORD *)(v42 + 40) = v41;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v44 = v9;
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "requestUrl"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "host"));

      v47 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "account"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "authId"));
      +[RealmSupport setRedirectedHost:forHost:withContext:](RealmSupport, "setRedirectedHost:forHost:withContext:", v47, v46, v49);

      v50 = sub_10001C4E8();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "account"));
        v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "authId"));
        *(_DWORD *)buf = 138412802;
        v65 = v46;
        v66 = 2112;
        v67 = v52;
        v68 = 2112;
        v69 = v54;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Realm redirection from %@ to %@ for %@", buf, 0x20u);

      }
      v9 = v44;
      v11 = v62;
    }
  }
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allHeaderFields"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKey:", CFSTR("X-Apple-Ctx")));

  if (v56)
    +[RealmSupport setServerContextHeaderString:](RealmSupport, "setServerContextHeaderString:", v56);
  objc_msgSend(*(id *)(a1 + 32), "checkAndScheduleRetries");
  objc_msgSend(*(id *)(a1 + 32), "setInProgress:", 0);
  v57 = *(_QWORD *)(a1 + 56);
  if (v57)
    (*(void (**)(uint64_t, id))(v57 + 16))(v57, *v10);
  if ((objc_msgSend(*v10, "willRetry") & 1) == 0)
  {
    v58 = sub_10001C4E8();
    v59 = objc_claimAutoreleasedReturnValue(v58);
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "endXPCTransaction because no retries", buf, 2u);
    }

    objc_msgSend(*v10, "_endXPCTransaction");
  }
  objc_msgSend(*(id *)(a1 + 32), "_disablePowerAssertion");
  objc_msgSend(*(id *)(a1 + 48), "didReceiveResponseFor:", *(_QWORD *)(a1 + 32));

LABEL_38:
}

void sub_100021FF8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x100021FBCLL);
}

void sub_100022274(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 buf)
{
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;

  if (a2)
  {
    if (a2 == 2)
    {
      v12 = objc_begin_catch(a1);
      v13 = sub_10001C4E8();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fm_logID"));
        LODWORD(buf) = 138412546;
        *(_QWORD *)((char *)&buf + 4) = v15;
        WORD6(buf) = 2112;
        *(_QWORD *)((char *)&buf + 14) = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Received expection when encoding auth : %@", (uint8_t *)&buf, 0x16u);

      }
      objc_end_catch();
      JUMPOUT(0x10002220CLL);
    }
    objc_begin_catch(a1);
    JUMPOUT(0x100022210);
  }
  _Unwind_Resume(a1);
}

void sub_100023BE4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100023C58(id a1)
{
  StartupRegisterManager *v1;
  void *v2;

  v1 = objc_alloc_init(StartupRegisterManager);
  v2 = (void *)qword_1000697A8;
  qword_1000697A8 = (uint64_t)v1;

}

void sub_100023EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023ECC(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "count") != 0;

}

void sub_100024240(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("qcPendingEpoch"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infoAtStartup"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infoAtStartup", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "infoAtStartup"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));

          if (v12)
          {
            if (objc_msgSend(v12, "isEqualToNumber:", v14))
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
              objc_msgSend(v15, "removeObjectForKey:", v10);

            }
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    objc_msgSend(*(id *)(a1 + 32), "setInfoAtStartup:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_saveInfo");
  }
}

id sub_10002447C(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(*(id *)(a1 + 32), "setInfo:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "_saveInfo");
}

id sub_10002457C(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  return objc_msgSend(*(id *)(a1 + 32), "_saveInfo");
}

id sub_100024650(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "info"));
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_saveInfo");
}

void sub_1000252B0(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(a2, "mutableCopy");
  objc_msgSend(v3, "removeObjectsForKeys:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void sub_100025530(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002555C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002556C(uint64_t a1)
{

}

void sub_100025574(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  if ((objc_opt_isKindOfClass(v5, a1[7]) & 1) != 0 || (objc_opt_isKindOfClass(v5, a1[8]) & 1) != 0)
  {
    v7 = (void *)a1[4];
    v6 = (void *)a1[5];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "arrayByAddingObject:", v12));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "flattenedArrayFromObject:parentIndices:", v5, v8));
    objc_msgSend(v7, "addObjectsFromArray:", v9);
  }
  else
  {
    v10 = (void *)a1[4];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "arrayByAddingObject:", v12));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v9, v5));
    objc_msgSend(v10, "addObject:", v11);

  }
}

void sub_100025698(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrayByAddingObject:", v7));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(void **)(a1 + 32);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "flattenedArrayFromObject:parentIndices:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));

  objc_msgSend(v11, "addObjectsFromArray:", v12);
}

const __CFString *sub_100026EA4(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("scheduled");
  if (a1 == 1)
    v1 = CFSTR("exit");
  if (a1)
    return v1;
  else
    return CFSTR("enter");
}

void sub_100028DCC(id a1)
{
  FMFAutomationHelperFactory *v1;
  void *v2;

  v1 = objc_alloc_init(FMFAutomationHelperFactory);
  v2 = (void *)qword_1000697B8;
  qword_1000697B8 = (uint64_t)v1;

}

void sub_1000290DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  id v9;
  id v10;
  NSObject *v11;

  if (a2 == 1)
  {
    v9 = objc_begin_catch(exception_object);
    v10 = sub_10001C4E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Exception caught in -URLByReplacingHost: -- %@", (uint8_t *)&a9, 0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x1000290A0);
  }
  _Unwind_Resume(exception_object);
}

id *sub_100029364(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id *v5;
  unsigned __int8 *v6;
  unsigned int v7;

  if (a4)
  {
    v4 = a4;
    v5 = result;
    v6 = (unsigned __int8 *)(a2 + a3);
    do
    {
      v7 = *v6++;
      result = (id *)objc_msgSend(v5[4], "appendFormat:", CFSTR("%02lx"), v7);
      --v4;
    }
    while (v4);
  }
  return result;
}

void sub_10002945C(id a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100035600(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = -[XPCManager initSingleton]([XPCManager alloc], "initSingleton");
  v11 = (void *)qword_1000697C8;
  qword_1000697C8 = (uint64_t)v10;

}

void sub_100029D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029DB0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _QWORD v22[22];
  _QWORD v23[22];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ServiceProviderMgr sharedInstance](ServiceProviderMgr, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceProviderForAccount:", v3));

  v7 = objc_opt_class(FMFServiceProvider, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v8 = v5;
    if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class(FMFAccount, v9)))
    {
      v10 = *(void **)(a1 + 32);
      v11 = v3;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "serviceIdentifierInURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substituteStandardURLPlaceholders:withAccount:withServiceIdentifier:", CFSTR("${scheme}://${hostname}/fmipservice/${service}/${dsid}/${udid}/ackLocate"), v11, v12));

    }
    else
    {
      v13 = 0;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "UUIDString"));

    v22[0] = CFSTR("ackURL");
    v22[1] = CFSTR("cmd");
    v23[0] = v13;
    v23[1] = CFSTR("locate");
    v22[2] = CFSTR("decayFactor");
    v22[3] = CFSTR("desiredAccuracy");
    v23[2] = CFSTR("0.7");
    v23[3] = &off_10005AF80;
    v22[4] = CFSTR("distanceThresholdInMeters");
    v22[5] = CFSTR("endThreshold");
    v23[4] = &off_10005AF98;
    v23[5] = &off_10005AFB0;
    v22[6] = CFSTR("enqueueTimestamp");
    v22[7] = CFSTR("findMyiPhone");
    v23[6] = &off_10005AFC8;
    v23[7] = &off_10005AFE0;
    v22[8] = CFSTR("id");
    v22[9] = CFSTR("includeTrackingInfo");
    v23[8] = v15;
    v23[9] = &off_10005AFE0;
    v22[10] = CFSTR("locationTimeout");
    v22[11] = CFSTR("locationValidityDuration");
    v23[10] = &off_10005AFF8;
    v23[11] = &off_10005B010;
    v22[12] = CFSTR("overriddenCommandDomain");
    v22[13] = CFSTR("piggypack");
    v23[12] = CFSTR("fmf");
    v23[13] = &off_10005B028;
    v22[14] = CFSTR("pollDurationInSecs");
    v22[15] = CFSTR("pollIntervalInSecs");
    v23[14] = &off_10005B040;
    v23[15] = &off_10005B058;
    v22[16] = CFSTR("requestingUserPrsId");
    v22[17] = CFSTR("responseTimeStamp");
    v23[16] = &stru_100057AE0;
    v23[17] = &off_10005B070;
    v22[18] = CFSTR("scanDurationInSeconds");
    v22[19] = CFSTR("startThreshold");
    v23[18] = &off_10005B088;
    v23[19] = &off_10005B0A0;
    v22[20] = CFSTR("timeThresholdInSecs");
    v22[21] = CFSTR("udid");
    v23[20] = &off_10005B0B8;
    v23[21] = &stru_100057AE0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002A154;
    v18[3] = &unk_100056490;
    v19 = v8;
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 22));
    v21 = *(id *)(a1 + 40);
    v16 = v20;
    v17 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v18);

  }
}

void sub_10002A154(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "copyHandlerForCommand:params:", CFSTR("locate"), *(_QWORD *)(a1 + 40));
  if (v4)
  {
    objc_msgSend(v4, "executeCommand");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  v2 = *(_QWORD *)(a1 + 48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError fm_genericError](NSError, "fm_genericError"));
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

}

BOOL sub_10002A6D8(id a1, FenceScheduleProtocol *a2)
{
  FenceScheduleProtocol *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = -[FenceScheduleProtocol isCurrentAt:](v2, "isCurrentAt:", v3);

  return v4;
}

id sub_10002AAA4(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "nextStartOrEndDateFrom:", *(_QWORD *)(a1 + 32));
}

void sub_10002ABA0(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)sub_10002ABDC, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

void sub_10002ABDC()
{
  id v0;

  v0 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("FMFLocatorSchedulerSignificantTimeChangeNotification"), 0, 0);

}

void sub_10002B3FC(id a1)
{
  id v1;
  NSObject *v2;
  APSTokenWatcher *v3;
  void *v4;

  v1 = sub_10001C4E8();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_100035778(v2);

  v3 = objc_alloc_init(APSTokenWatcher);
  v4 = (void *)qword_1000697E0;
  qword_1000697E0 = (uint64_t)v3;

}

BOOL FMFIDSSupportProtoRequestDeviceInformationReadFrom(uint64_t a1, uint64_t a2)
{
  int v3;
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  BOOL v10;

  while (1)
  {
    v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
      return v3 == 0;
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      v3 = 1;
      return v3 == 0;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0;
        v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v3)
      v10 = 1;
    else
      v10 = (v6 & 7) == 4;
    if (v10)
      return v3 == 0;
    if ((PBReaderSkipValueWithTag(a2, v6 >> 3) & 1) == 0)
      return 0;
  }
}

uint64_t FMFIDSSupportProtoDeviceInformationReadFrom(uint64_t a1, uint64_t a2)
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  int v10;
  uint64_t String;
  uint64_t v13;
  void *v14;
  uint64_t result;

  while (*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      break;
    v4 = 0;
    v5 = 0;
    v6 = 0;
    while (1)
    {
      v7 = *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__length))
        break;
      v8 = *(_BYTE *)(*(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(_QWORD *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0)
        goto LABEL_11;
      v4 += 7;
      if (v5++ >= 9)
      {
        v6 = 0;
        v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error))
      v6 = 0;
LABEL_13:
    if (v10 || (v6 & 7) == 4)
      break;
    if ((v6 >> 3) == 1)
    {
      String = PBReaderReadString(a2);
      v13 = objc_claimAutoreleasedReturnValue(String);
      v14 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v13;

    }
    else
    {
      result = PBReaderSkipValueWithTag(a2, v6 >> 3);
      if (!(_DWORD)result)
        return result;
    }
  }
  return *(_BYTE *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10002BED4()
{
  return 0;
}

uint64_t sub_10002BEFC()
{
  return sub_10002C1A4(&OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback, (void (*)(_QWORD, _QWORD))sub_10002BF10);
}

uint64_t sub_10002BF10(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_10002BF20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = type metadata accessor for FMLFence();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v5);
  swift_retain(v3);
  v4(v6);
  swift_release(v3);
  return swift_bridgeObjectRelease(v6);
}

void sub_10002C010(uint64_t a1, uint64_t a2)
{
  Class isa;

  type metadata accessor for FMLFence();
  isa = Array._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(a2 + 16))(a2, isa);

}

uint64_t sub_10002C064(uint64_t a1, uint64_t a2)
{
  return sub_10002C2E8(a1, a2, &OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback, sub_10002C078);
}

uint64_t sub_10002C078(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void *sub_10002C088(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback, a1, 33, 0);
  return &j__swift_endAccess;
}

id sub_10002C0EC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD aBlock[5];
  uint64_t v14;
  _BYTE v15[24];

  v7 = (uint64_t *)(a1 + *a3);
  swift_beginAccess(v7, v15, 0, 0);
  v8 = *v7;
  if (!*v7)
    return 0;
  v9 = v7[1];
  aBlock[4] = v8;
  v14 = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = a4;
  aBlock[3] = a5;
  v10 = _Block_copy(aBlock);
  v11 = v14;
  swift_retain(v9);
  swift_release(v11);
  return v10;
}

uint64_t sub_10002C190()
{
  return sub_10002C1A4(&OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback, (void (*)(_QWORD, _QWORD))sub_100030304);
}

uint64_t sub_10002C1A4(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  _BYTE v7[24];

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess(v4, v7, 0, 0);
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_10002C204(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

uint64_t sub_10002C2D4(uint64_t a1, uint64_t a2)
{
  return sub_10002C2E8(a1, a2, &OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback, sub_100030308);
}

uint64_t sub_10002C2E8(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess(v8, v12, 1, 0);
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

void *sub_10002C344(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback, a1, 33, 0);
  return &j_j__swift_endAccess;
}

id sub_10002C388()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id sub_10002C3A8()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *Session;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  objc_super v18;

  v1 = sub_10002C518(&qword_100069120);
  __chkstk_darwin(v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = &v0[OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_fencesUpdateCallback];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v0[OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_networkReachabilityUpdateCallback];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_sessionHolder;
  v7 = type metadata accessor for FindMyLocateSession.SessionHolder();
  v8 = swift_allocObject(v7, 120, 15);
  v9 = v0;
  swift_defaultActor_initialize(v8);
  *(_QWORD *)(v8 + 112) = 0;
  *(_QWORD *)&v0[v6] = v8;

  Session = (objc_class *)type metadata accessor for FindMyLocateSession();
  v18.receiver = v9;
  v18.super_class = Session;
  v11 = objc_msgSendSuper2(&v18, "init");
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v3, 1, 1, v12);
  type metadata accessor for MainActor(0);
  v13 = v11;
  v14 = static MainActor.shared.getter(v13);
  v15 = (_QWORD *)swift_allocObject(&unk_1000565C8, 40, 7);
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v13;
  v16 = sub_10002CE78((uint64_t)v3, (uint64_t)&unk_100069138, (uint64_t)v15);

  swift_release(v16);
  return v13;
}

uint64_t sub_10002C518(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for FindMyLocateSession.SessionHolder()
{
  return objc_opt_self(_TtCC11fmflocatord19FindMyLocateSessionP33_8F61CF79371655F326EECF58C91716CE13SessionHolder);
}

uint64_t type metadata accessor for FindMyLocateSession()
{
  return objc_opt_self(_TtC11fmflocatord19FindMyLocateSession);
}

uint64_t sub_10002C598()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for FindMyLocateSession.SessionHolder();
  v1 = swift_allocObject(v0, 120, 15);
  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 112) = 0;
  return v1;
}

uint64_t sub_10002C5D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t updated;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4[4] = a4;
  v5 = type metadata accessor for Fence(0);
  v4[5] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[6] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[7] = swift_task_alloc(v7);
  v4[8] = swift_task_alloc(v7);
  updated = type metadata accessor for Fence.UpdateStream.Snapshot(0);
  v4[9] = updated;
  v9 = *(_QWORD *)(updated - 8);
  v4[10] = v9;
  v4[11] = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_10002C518(&qword_100069348);
  v4[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.UpdateStream.AsyncIterator(0);
  v4[13] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[14] = v12;
  v4[15] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for MainActor(0);
  v4[16] = v13;
  v4[17] = static MainActor.shared.getter(v13);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v13, &protocol witness table for MainActor);
  v4[18] = v14;
  v4[19] = v15;
  return swift_task_switch(sub_10002C6EC, v14, v15);
}

uint64_t sub_10002C6EC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10006914C);
  *(_QWORD *)(v0 + 160) = v1;
  *v1 = v0;
  v1[1] = sub_10002C740;
  return sub_10002DDD4();
}

uint64_t sub_10002C740(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 160);
  *(_QWORD *)(*v1 + 168) = a1;
  swift_task_dealloc(v3);
  return swift_task_switch(sub_10002C798, *(_QWORD *)(v2 + 144), *(_QWORD *)(v2 + 152));
}

uint64_t sub_10002C798()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t updated;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[21];
  v0[22] = Session.fenceUpdateStream()();
  v2 = swift_release(v1);
  updated = Fence.UpdateStream.makeAsyncIterator()(v2);
  v0[23] = static MainActor.shared.getter(updated);
  v4 = sub_1000302B4(&qword_100069350, (uint64_t (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator, (uint64_t)&protocol conformance descriptor for Fence.UpdateStream.AsyncIterator);
  v5 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
  v0[24] = v5;
  *v5 = v0;
  v5[1] = sub_10002C84C;
  return dispatch thunk of AsyncIteratorProtocol.next()(v0[12], v0[13], v4);
}

uint64_t sub_10002C84C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 192);
  *(_QWORD *)(*v1 + 200) = v0;
  swift_task_dealloc(v3);
  v4 = *(_QWORD *)(v2 + 184);
  if (v0)
  {
    if (v4)
    {
      ObjectType = swift_getObjectType(v4);
      v6 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, &protocol witness table for MainActor);
      v8 = v7;
    }
    else
    {
      v6 = 0;
      v8 = 0;
    }
    v11 = sub_10002CC04;
  }
  else
  {
    if (v4)
    {
      v9 = swift_getObjectType(v4);
      v6 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
      v8 = v10;
    }
    else
    {
      v6 = 0;
      v8 = 0;
    }
    v11 = sub_10002C910;
  }
  return swift_task_switch(v11, v6, v8);
}

uint64_t sub_10002C910()
{
  _QWORD *v0;

  swift_release(v0[23]);
  return swift_task_switch(sub_10002C948, v0[18], v0[19]);
}

uint64_t sub_10002C948()
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
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD);
  uint64_t v16;
  uint64_t updated;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t, unint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD);
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    v4 = *(_QWORD *)(v0 + 176);
    v5 = *(_QWORD *)(v0 + 136);
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 64);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(v6, *(_QWORD *)(v0 + 104));
    swift_release(v4);
    swift_release(v5);
    swift_task_dealloc(v6);
    swift_task_dealloc(v1);
    swift_task_dealloc(v7);
    swift_task_dealloc(v8);
    swift_task_dealloc(v9);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v11 = *(_QWORD **)(v0 + 32);
    v12 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 88), v1, v2);
    v13 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v11) + 0x68))(v12);
    if (v13)
    {
      v15 = (void (*)(_QWORD))v13;
      v16 = v14;
      updated = Fence.UpdateStream.Snapshot.fences.getter();
      v18 = updated;
      v19 = *(_QWORD *)(updated + 16);
      if (v19)
      {
        v36 = v16;
        v37 = v15;
        v20 = *(_QWORD *)(v0 + 48);
        *(_QWORD *)(v0 + 24) = &_swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)(v19);
        type metadata accessor for FMLFence();
        v35 = v18;
        v21 = v18 + ((*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80));
        v38 = *(_QWORD *)(v20 + 72);
        v22 = *(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16);
        do
        {
          v23 = *(_QWORD *)(v0 + 56);
          v24 = *(_QWORD *)(v0 + 64);
          v26 = *(_QWORD *)(v0 + 40);
          v25 = *(_QWORD *)(v0 + 48);
          v22(v24, v21, v26);
          v22(v23, v24, v26);
          v27 = sub_10003059C(v23);
          v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()(v28);
          v29 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)(v29);
          v30 = specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)(v29, v27);
          specialized ContiguousArray._endMutation()(v30);
          v21 += v38;
          --v19;
        }
        while (v19);
        v31 = *(void **)(v0 + 24);
        swift_bridgeObjectRelease(v35);
        v16 = v36;
        v15 = v37;
        v37(v31);
      }
      else
      {
        swift_bridgeObjectRelease(updated);
        v31 = &_swiftEmptyArrayStorage;
        v15(&_swiftEmptyArrayStorage);
      }
      swift_bridgeObjectRelease(v31);
      sub_10002C078((uint64_t)v15, v16);
    }
    v32 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
    *(_QWORD *)(v0 + 184) = static MainActor.shared.getter(v32);
    v33 = sub_1000302B4(&qword_100069350, (uint64_t (*)(uint64_t))&type metadata accessor for Fence.UpdateStream.AsyncIterator, (uint64_t)&protocol conformance descriptor for Fence.UpdateStream.AsyncIterator);
    v34 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of AsyncIteratorProtocol.next()[1]);
    *(_QWORD *)(v0 + 192) = v34;
    *v34 = v0;
    v34[1] = sub_10002C84C;
    return dispatch thunk of AsyncIteratorProtocol.next()(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), v33);
  }
}

uint64_t sub_10002CC04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 200);
  v1 = sub_10002C518(&qword_100069358);
  v2 = swift_dynamicCast(v1, v0 + 16, v1, &type metadata for Never, 7);
  return swift_willThrowTypedImpl(v2, &type metadata for Never, &protocol witness table for Never);
}

uint64_t sub_10002CC64()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10002CC90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_100069134);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003030C;
  return sub_10002C5D0((uint64_t)v3, v4, v5, v2);
}

unint64_t *sub_10002CCDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int64_t v6;
  unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t *v14;
  __int128 v15;
  __int128 v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  id v21;
  _OWORD v22[2];
  unint64_t v23;
  unint64_t *v24;

  v20 = type metadata accessor for Fence(0);
  v3 = *(_QWORD *)(v20 - 8);
  __chkstk_darwin(v20);
  v5 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v18[1] = v1;
    v24 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10002F348(0, v6, 0);
    v7 = v24;
    v8 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = type metadata accessor for FMLFence();
    v19 = *(_QWORD *)(v3 + 72);
    v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v10(v5, v8, v20);
      v21 = sub_10003059C((uint64_t)v5);
      v11 = sub_1000302B4(&qword_100069300, (uint64_t (*)(uint64_t))type metadata accessor for FMLFence, (uint64_t)&protocol conformance descriptor for NSObject);
      AnyHashable.init<A>(_:)(v22, &v21, v9, v11);
      v24 = v7;
      v13 = v7[2];
      v12 = v7[3];
      if (v13 >= v12 >> 1)
      {
        sub_10002F348(v12 > 1, v13 + 1, 1);
        v7 = v24;
      }
      v7[2] = v13 + 1;
      v14 = &v7[5 * v13];
      v15 = v22[0];
      v16 = v22[1];
      v14[8] = v23;
      *((_OWORD *)v14 + 2) = v15;
      *((_OWORD *)v14 + 3) = v16;
      v8 += v19;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_10002CE78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10003009C(a1, &qword_100069120);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100056920, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_100069340, v17);
}

uint64_t sub_10002CFC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10003009C(a1, &qword_100069120);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_1000568F8, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  v18 = type metadata accessor for Session(0);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v8, v19, v18, &unk_100069330, v17);
}

uint64_t sub_10002D134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = type metadata accessor for Fence.TriggerPosition(0);
  v5[7] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[8] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[9] = swift_task_alloc(v8);
  v5[10] = swift_task_alloc(v8);
  v9 = type metadata accessor for Fence.ID(0);
  v5[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v5[12] = v10;
  v5[13] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.TriggerID(0);
  v5[14] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[15] = v12;
  v5[16] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for Device(0);
  v5[17] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v5[18] = v14;
  v5[19] = swift_task_alloc((*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002D224, 0, 0);
}

uint64_t sub_10002D224()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[20] = *(_QWORD *)(v0[6] + OBJC_IVAR____TtC11fmflocatord19FindMyLocateSession_sessionHolder);
  v1 = (_QWORD *)swift_task_alloc(dword_10006914C);
  v0[21] = v1;
  *v1 = v0;
  v1[1] = sub_10002D27C;
  return sub_10002DDD4();
}

uint64_t sub_10002D27C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 168);
  v5 = *v1;
  *(_QWORD *)(*v1 + 176) = a1;
  swift_task_dealloc(v4);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to Session.activeLocationSharingDevice(cached:)[1]);
  *(_QWORD *)(v3 + 184) = v6;
  *v6 = v5;
  v6[1] = sub_10002D2F8;
  return Session.activeLocationSharingDevice(cached:)(*(_QWORD *)(v3 + 152), 1);
}

uint64_t sub_10002D2F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 184);
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_10002D80C;
  }
  else
  {
    swift_release(*(_QWORD *)(v2 + 176));
    v4 = sub_10002D364;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10002D364()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  _QWORD *v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(v0 + 144);
  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = Device.isThisDevice.getter();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) != 0)
  {
    v5 = (_QWORD *)swift_task_alloc(dword_10006914C);
    *(_QWORD *)(v0 + 200) = v5;
    *v5 = v0;
    v5[1] = sub_10002D4D4;
    return sub_10002DDD4();
  }
  else
  {
    if (qword_1000697F0 != -1)
      swift_once(&qword_1000697F0, sub_10002E9B4);
    v7 = type metadata accessor for Logger(0);
    sub_10002EA34(v7, (uint64_t)qword_1000697F8);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Not triggering over IDS since this is not me device.", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v11 = *(_QWORD *)(v0 + 128);
    v12 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 72);
    v13 = *(_QWORD *)(v0 + 80);
    swift_task_dealloc(*(_QWORD *)(v0 + 152));
    swift_task_dealloc(v11);
    swift_task_dealloc(v12);
    swift_task_dealloc(v13);
    swift_task_dealloc(v14);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_10002D4D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 200);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002D530, 0, 0);
}

uint64_t sub_10002D530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain(v2);
  sub_10002D8F4(v3, v2);
  if (v1)
  {
    v4 = *(_QWORD *)(v0 + 208);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 32);
    if (v5 < 4)
    {
      v6 = (unsigned int *)*(&off_100056958 + v5);
      v7 = *(_QWORD **)(v0 + 72);
      v8 = *(_QWORD *)(v0 + 80);
      v9 = *(_QWORD *)(v0 + 56);
      v10 = *(_QWORD *)(v0 + 64);
      v11 = *(void **)(v0 + 40);
      *v7 = v11;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v7, *v6, v9);
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(v10 + 32))(v8, v7, v9);
      v12 = async function pointer to Session.triggerFence(id:position:)[1];
      v13 = v11;
      v14 = (_QWORD *)swift_task_alloc(v12);
      *(_QWORD *)(v0 + 216) = v14;
      *v14 = v0;
      v14[1] = sub_10002D6DC;
      return Session.triggerFence(id:position:)(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    }
    v4 = *(_QWORD *)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v0 + 88);
    v19 = sub_10002EA4C();
    swift_allocError(&type metadata for Error, v19, 0, 0);
    *(_QWORD *)v20 = v5;
    *(_QWORD *)(v20 + 8) = 0;
    *(_BYTE *)(v20 + 16) = 1;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  swift_release(v4);
  v21 = *(_QWORD *)(v0 + 128);
  v22 = *(_QWORD *)(v0 + 104);
  v24 = *(_QWORD *)(v0 + 72);
  v23 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v24);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002D6DC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)();

  v2 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 208);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 216);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v8 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v7 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v9 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 224) = v0;
  swift_task_dealloc(v3);
  swift_release(v4);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (v0)
  {
    v11 = sub_10002D884;
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v2[15] + 8))(v2[16], v2[14]);
    v11 = sub_10002D7A4;
  }
  return swift_task_switch(v11, 0, 0);
}

uint64_t sub_10002D7A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002D80C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release(*(_QWORD *)(v0 + 176));
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002D884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  swift_task_dealloc(*(_QWORD *)(v0 + 152));
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002D8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v17[2];

  v4 = sub_10002C518(&qword_100069310);
  __chkstk_darwin(v4);
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for UUID(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v13 = (char *)v17 - v12;
  UUID.init(uuidString:)(a1, a2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_10003009C((uint64_t)v6, &qword_100069310);
    v14 = sub_10002EA4C();
    swift_allocError(&type metadata for Error, v14, 0, 0);
    *(_QWORD *)v15 = a1;
    *(_QWORD *)(v15 + 8) = a2;
    *(_BYTE *)(v15 + 16) = 0;
    return swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease(a2);
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    Fence.ID.init(id:)(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  }
}

uint64_t sub_10002DBD4(uint64_t a1, uint64_t a2, void *a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;

  v5[2] = a3;
  v5[3] = a5;
  v5[4] = _Block_copy(aBlock);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v12 = v11;
  v5[5] = v11;
  v13 = dword_100069144;
  v14 = a3;
  a5;
  v15 = (_QWORD *)swift_task_alloc(v13);
  v5[6] = v15;
  *v15 = v5;
  v15[1] = sub_10002DC80;
  return sub_10002D134(v10, v12, a2, (uint64_t)v14);
}

uint64_t sub_10002DC80()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = *(_QWORD *)(*v1 + 40);
  v2 = *(_QWORD *)(*v1 + 48);
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc(v2);

  swift_bridgeObjectRelease(v3);
  v7 = *(_QWORD *)(v6 + 32);
  if (v0)
  {
    v8 = (void *)_convertErrorToNSError(_:)(v0);
    swift_errorRelease(v0);
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v7 + 16))(*(_QWORD *)(v6 + 32), 0);
  }
  _Block_release(*(const void **)(v6 + 32));
  return (*(uint64_t (**)(void))(v6 + 8))();
}

unint64_t sub_10002DD60()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_10002DDB0()
{
  return 0x6C7070612E6D6F63;
}

uint64_t sub_10002DDD4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1[4] = v0;
  v1[5] = *v0;
  v2 = sub_10002C518(&qword_100069120);
  v1[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v2 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002DE38, v0, 0);
}

uint64_t sub_10002DE38()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v1 = v0[4];
  v2 = *(_QWORD *)(v1 + 112);
  v0[7] = v2;
  if (v2)
  {
    v3 = *((unsigned int *)&async function pointer to Task<>.value.getter + 1);
    swift_retain(v2);
    v4 = (_QWORD *)swift_task_alloc(v3);
    v0[8] = v4;
    v5 = type metadata accessor for Session(0);
    *v4 = v0;
    v4[1] = sub_10002DF78;
    v6 = v0 + 3;
    v7 = v2;
  }
  else
  {
    v9 = v0[5];
    v8 = v0[6];
    v10 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject(&unk_1000568D0, 40, 7);
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v9;
    v12 = sub_10002CFC4(v8, (uint64_t)&unk_100069320, (uint64_t)v11);
    v0[9] = v12;
    v13 = *(_QWORD *)(v1 + 112);
    *(_QWORD *)(v1 + 112) = v12;
    swift_retain(v12);
    swift_release(v13);
    v14 = (_QWORD *)swift_task_alloc(*((unsigned int *)&async function pointer to Task<>.value.getter + 1));
    v0[10] = v14;
    v5 = type metadata accessor for Session(0);
    *v14 = v0;
    v14[1] = sub_10002E010;
    v6 = v0 + 2;
    v7 = v12;
  }
  return Task<>.value.getter(v6, v7, v5);
}

uint64_t sub_10002DF78()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 64));
  return swift_task_switch(sub_10002DFD0, v1, 0);
}

uint64_t sub_10002DFD0()
{
  uint64_t v0;
  uint64_t v1;

  swift_release(*(_QWORD *)(v0 + 56));
  v1 = *(_QWORD *)(v0 + 24);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10002E010()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 32);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 80));
  return swift_task_switch(sub_10002E068, v1, 0);
}

uint64_t sub_10002E068()
{
  uint64_t v0;
  uint64_t v1;

  swift_release(*(_QWORD *)(v0 + 72));
  v1 = *(_QWORD *)(v0 + 16);
  swift_task_dealloc(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_10002E0A8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[2] = a1;
  v2 = type metadata accessor for ClientOrigin(0);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for RequestOrigin(0);
  v1[6] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10002E128, 0, 0);
}

uint64_t sub_10002E128()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[5];
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v0[4] + 104))(v1, enum case for ClientOrigin.other(_:), v0[3]);
  RequestOrigin.init(_:)(v1);
  v2 = type metadata accessor for Session(0);
  swift_allocObject(v2, *(unsigned int *)(v2 + 48), *(unsigned __int16 *)(v2 + 52));
  v3 = (_QWORD *)swift_task_alloc(async function pointer to Session.init(_:)[1]);
  v0[7] = v3;
  *v3 = v0;
  v3[1] = sub_10002E1BC;
  return Session.init(_:)(v0[6]);
}

uint64_t sub_10002E1BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc(v2);
  return swift_task_switch(sub_10002E218, 0, 0);
}

uint64_t sub_10002E218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 64);
  swift_task_dealloc(v1);
  swift_task_dealloc(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002E25C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 112));
  swift_defaultActor_destroy(v0);
  return swift_defaultActor_deallocate(v0);
}

uint64_t sub_10002E280()
{
  uint64_t v0;

  return v0;
}

id sub_10002E28C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FindMyLocateSession();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10002E30C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15;

  v5 = sub_10002C518(&qword_100069120);
  __chkstk_darwin(v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = v2;
  v10 = swift_retain(a2);
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_1000565F0, 56, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  v12[5] = a1;
  v12[6] = a2;
  v13 = sub_10002CE78((uint64_t)v7, (uint64_t)&unk_100069158, (uint64_t)v12);
  return swift_release(v13);
}

uint64_t sub_10002E404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[3] = a4;
  v7 = type metadata accessor for MainActor(0);
  v6[6] = v7;
  v6[7] = static MainActor.shared.getter(v7);
  return swift_task_switch(sub_10002E458, 0, 0);
}

uint64_t sub_10002E458()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10006914C);
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_10002E4AC;
  return sub_10002DDD4();
}

uint64_t sub_10002E4AC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;

  v3 = *(_QWORD *)(*v1 + 64);
  v6 = *v1;
  *(_QWORD *)(v6 + 72) = a1;
  swift_task_dealloc(v3);
  v4 = (_QWORD *)swift_task_alloc(async function pointer to Session.fences()[1]);
  *(_QWORD *)(v6 + 80) = v4;
  *v4 = v6;
  v4[1] = sub_10002E518;
  return Session.fences()();
}

uint64_t sub_10002E518(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  *(_QWORD *)(*(_QWORD *)v2 + 88) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = dispatch thunk of Actor.unownedExecutor.getter(v4[6], &protocol witness table for MainActor);
    v8 = v7;
    v9 = sub_10002E654;
  }
  else
  {
    v10 = v4[6];
    swift_release(v4[9]);
    v4[12] = a1;
    v6 = dispatch thunk of Actor.unownedExecutor.getter(v10, &protocol witness table for MainActor);
    v8 = v11;
    v9 = sub_10002E5C8;
  }
  return swift_task_switch(v9, v6, v8);
}

uint64_t sub_10002E5C8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, _QWORD);
  unint64_t *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(void (**)(uint64_t, _QWORD))(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 56));
  v3 = sub_10002CCDC(v1);
  swift_bridgeObjectRelease(v1);
  v4 = sub_10002FFA0((uint64_t)v3);
  swift_bridgeObjectRelease(v3);
  v2(v4, 0);
  swift_bridgeObjectRelease(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002E654()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(void *, uint64_t);

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(void (**)(void *, uint64_t))(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(v2);
  swift_errorRetain(v1);
  v3(&_swiftEmptySetSingleton, v1);
  swift_errorRelease(v1);
  swift_errorRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10002E808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSSet v5;
  uint64_t v6;
  id v7;

  v5.super.isa = Set._bridgeToObjectiveC()().super.isa;
  if (a2)
    v6 = _convertErrorToNSError(_:)(a2);
  else
    v6 = 0;
  v7 = (id)v6;
  (*(void (**)(uint64_t, Class))(a3 + 16))(a3, v5.super.isa);

}

unint64_t sub_10002E884(uint64_t a1, void *a2, char a3)
{
  Swift::String v5;
  Swift::String v6;
  uint64_t v7;
  Swift::String v8;
  void *object;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((a3 & 1) != 0)
  {
    _StringGuts.grow(_:)(38);
    swift_bridgeObjectRelease(0xE000000000000000);
    v12 = 0xD000000000000024;
    v13 = 0x800000010004D0A0;
    v11 = a1;
    type metadata accessor for FMFMonitoredFenceTrigger();
    v8._countAndFlagsBits = String.init<A>(describing:)(&v11, v7);
    object = v8._object;
    String.append(_:)(v8);
    swift_bridgeObjectRelease(object);
  }
  else
  {
    _StringGuts.grow(_:)(35);
    swift_bridgeObjectRelease(0xE000000000000000);
    v12 = 0xD000000000000011;
    v13 = 0x800000010004D0D0;
    v5._countAndFlagsBits = a1;
    v5._object = a2;
    String.append(_:)(v5);
    v6._object = (void *)0x800000010004D0F0;
    v6._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v6);
  }
  return v12;
}

unint64_t sub_10002E98C()
{
  uint64_t v0;

  return sub_10002E884(*(_QWORD *)v0, *(void **)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_10002E9B4()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000300D8(v0, qword_1000697F8);
  sub_10002EA34(v0, (uint64_t)qword_1000697F8);
  return Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010004D190, 0xD000000000000013, 0x8000000100049ED0);
}

uint64_t sub_10002EA34(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_10002EA4C()
{
  unint64_t result;

  result = qword_100069810[0];
  if (!qword_100069810[0])
  {
    result = swift_getWitnessTable(&unk_100049F94, &type metadata for Error);
    atomic_store(result, qword_100069810);
  }
  return result;
}

uint64_t sub_10002EA94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = v0[4];
  v3 = v0[5];
  v4 = v0[6];
  v5 = (_QWORD *)swift_task_alloc(dword_100069154);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10003030C;
  return sub_10002E404((uint64_t)v5, v6, v7, v2, v3, v4);
}

uint64_t sub_10002EAF8(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for Error(uint64_t a1)
{
  return sub_10002EB18(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_10002EB18(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s11fmflocatord5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002EAF8(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10002EAF8(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_10002EB18(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for Error(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Error(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_10002EB18(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Error(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_10002ECA8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10002ECB4(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for Error()
{
  return &type metadata for Error;
}

void type metadata accessor for FMFMonitoredFenceTrigger()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100069360)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100056948);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100069360);
  }
}

uint64_t sub_10002ED28()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10002ED4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10002E808(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_10002ED58()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 48));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002ED8C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10002EDC8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc(dword_1000692BC);
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_10003030C;
  return ((uint64_t (*)(uint64_t, uint64_t, void *, void *, void *))((char *)&dword_1000692B8 + dword_1000692B8))(v2, v3, v4, v5, v6);
}

uint64_t sub_10002EE48(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10002EEAC;
  return v6(a1);
}

uint64_t sub_10002EEAC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10002EEF8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10003030C;
  return v6();
}

uint64_t sub_10002EF50()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000692CC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10003030C;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000692C8 + dword_1000692C8))(v2, v3, v4);
}

uint64_t sub_10002EFC8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10003030C;
  return v7();
}

uint64_t sub_10002F020()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002F04C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000692DC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10003030C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000692D8 + dword_1000692D8))(a1, v4, v5, v6);
}

uint64_t sub_10002F0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10003009C(a1, &qword_100069120);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9, v12);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v15 = v14;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_100056808, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, (char *)&type metadata for () + 8, &unk_1000692F0, v17);
}

uint64_t sub_10002F21C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100030310;
  return v6(a1);
}

uint64_t sub_10002F280()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F2A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000692EC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003030C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000692E8 + dword_1000692E8))(a1, v4);
}

uint64_t sub_10002F314(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_10002F328(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10002F338(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10002F340(uint64_t a1)
{
  uint64_t v1;

  sub_10002C010(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_10002F348(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10002F364(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10002F364(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10002C518(&qword_100069308);
    v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[40 * v8])
      memmove(v13, v14, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[40 * v8] || v13 >= &v14[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10002F4E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  Swift::Int v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  __int128 v15;
  uint64_t v17;
  _BYTE v18[40];

  v3 = v2;
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 40);
  swift_bridgeObjectRetain(v6);
  v8 = AnyHashable._rawHashValue(seed:)(v7);
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    while (1)
    {
      sub_100030028(*(_QWORD *)(v6 + 48) + 40 * v10, (uint64_t)v18);
      v12 = static AnyHashable.== infix(_:_:)(v18, a2);
      sub_100030064((uint64_t)v18);
      if ((v12 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease(v6);
    sub_100030064(a2);
    sub_100030028(*(_QWORD *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease(v6);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    sub_100030028(a2, (uint64_t)v18);
    v17 = *v3;
    *v3 = 0x8000000000000000;
    sub_10002F924((uint64_t)v18, v10, isUniquelyReferenced_nonNull_native);
    v14 = *v3;
    *v3 = v17;
    swift_bridgeObjectRelease(v14);
    v15 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v15;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

Swift::Int sub_10002F65C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10002C518(&qword_1000692F8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v31 = v2;
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v8 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v3 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain(v3);
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v19 >= v11)
          goto LABEL_36;
        v20 = v8[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v11)
            goto LABEL_36;
          v20 = v8[v14];
          if (!v20)
          {
            v14 = v19 + 2;
            if (v19 + 2 >= v11)
              goto LABEL_36;
            v20 = v8[v14];
            if (!v20)
            {
              v21 = v19 + 3;
              if (v21 >= v11)
              {
LABEL_36:
                swift_release(v3);
                v2 = v31;
                v30 = 1 << *(_BYTE *)(v3 + 32);
                if (v30 > 63)
                  bzero((void *)(v3 + 56), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v30;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v20 = v8[v21];
              if (!v20)
              {
                while (1)
                {
                  v14 = v21 + 1;
                  if (__OFADD__(v21, 1))
                    goto LABEL_42;
                  if (v14 >= v11)
                    goto LABEL_36;
                  v20 = v8[v14];
                  ++v21;
                  if (v20)
                    goto LABEL_26;
                }
              }
              v14 = v21;
            }
          }
        }
LABEL_26:
        v10 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = *(_QWORD *)(v3 + 48) + 40 * v18;
      v32 = *(_OWORD *)v22;
      v33 = *(_OWORD *)(v22 + 16);
      v34 = *(_QWORD *)(v22 + 32);
      result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
      v23 = -1 << *(_BYTE *)(v6 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v12 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v23) >> 6;
        do
        {
          if (++v25 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v28 = v25 == v27;
          if (v25 == v27)
            v25 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v25);
        }
        while (v29 == -1);
        v15 = __clz(__rbit64(~v29)) + (v25 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = *(_QWORD *)(v6 + 48) + 40 * v15;
      *(_OWORD *)v16 = v32;
      *(_OWORD *)(v16 + 16) = v33;
      *(_QWORD *)(v16 + 32) = v34;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10002F924(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _BYTE v20[40];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  v9 = v7 + 1;
  if ((a3 & 1) != 0)
  {
    sub_10002F65C(v9);
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_10002FA8C();
      goto LABEL_12;
    }
    sub_10002FC58(v9);
  }
  v10 = *v3;
  result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(*v3 + 40));
  v11 = -1 << *(_BYTE *)(v10 + 32);
  a2 = result & ~v11;
  if (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v12 = ~v11;
    do
    {
      sub_100030028(*(_QWORD *)(v10 + 48) + 40 * a2, (uint64_t)v20);
      v13 = static AnyHashable.== infix(_:_:)(v20, v6);
      result = sub_100030064((uint64_t)v20);
      if ((v13 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v12;
    }
    while (((*(_QWORD *)(v10 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v14 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v15 = *(_QWORD *)(v14 + 48) + 40 * a2;
  v16 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v6;
  *(_OWORD *)(v15 + 16) = v16;
  *(_QWORD *)(v15 + 32) = *(_QWORD *)(v6 + 32);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (!v18)
  {
    *(_QWORD *)(v14 + 16) = v19;
    return result;
  }
  __break(1u);
LABEL_15:
  result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

void *sub_10002FA8C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  sub_10002C518(&qword_1000692F8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    result = (void *)sub_100030028(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10002FC58(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  _OWORD v32[2];
  uint64_t v33;

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_10002C518(&qword_1000692F8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v31 = v2;
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain(v3);
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_27;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v21 >= v11)
      goto LABEL_36;
    v22 = *(_QWORD *)(v8 + 8 * v21);
    ++v14;
    if (!v22)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_36;
      v22 = *(_QWORD *)(v8 + 8 * v14);
      if (!v22)
      {
        v14 = v21 + 2;
        if (v21 + 2 >= v11)
          goto LABEL_36;
        v22 = *(_QWORD *)(v8 + 8 * v14);
        if (!v22)
          break;
      }
    }
LABEL_26:
    v10 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v14 << 6);
LABEL_27:
    sub_100030028(*(_QWORD *)(v3 + 48) + 40 * v20, (uint64_t)v32);
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v6 + 40));
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v26);
      }
      while (v30 == -1);
      v15 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v6 + 48) + 40 * v15;
    v17 = v32[0];
    v18 = v32[1];
    *(_QWORD *)(v16 + 32) = v33;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    ++*(_QWORD *)(v6 + 16);
  }
  v23 = v21 + 3;
  if (v23 >= v11)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v22 = *(_QWORD *)(v8 + 8 * v23);
  if (v22)
  {
    v14 = v23;
    goto LABEL_26;
  }
  while (1)
  {
    v14 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v14 >= v11)
      goto LABEL_36;
    v22 = *(_QWORD *)(v8 + 8 * v14);
    ++v23;
    if (v22)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10002FEE8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_10002FF50;
  return v5(v2 + 16);
}

uint64_t sub_10002FF50()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 32));
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10002FFA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _BYTE v5[40];
  _BYTE v6[40];
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = Set.init(minimumCapacity:)(v2, &type metadata for AnyHashable, &protocol witness table for AnyHashable);
  v7 = result;
  if (v2)
  {
    v4 = a1 + 32;
    do
    {
      sub_100030028(v4, (uint64_t)v5);
      sub_10002F4E4((uint64_t)v6, (uint64_t)v5);
      sub_100030064((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_100030028(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100030064(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_10003009C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10002C518(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t *sub_1000300D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_100030118()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003013C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10006931C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10003018C;
  return sub_10002E0A8(a1);
}

uint64_t sub_10003018C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1000301D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10006932C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003018C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100069328 + dword_100069328))(a1, v4);
}

uint64_t sub_100030244(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10006933C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10003030C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100069338 + dword_100069338))(a1, v4);
}

uint64_t sub_1000302B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000302F4()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_10003037C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier + 8));
  return v1;
}

double sub_1000303C4()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude);
}

double sub_1000303E4()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude);
}

double sub_100030404()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC11fmflocatord8FMLFence_radius);
}

uint64_t sub_100030434(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return swift_unknownObjectRetain(*(_QWORD *)(v2 + OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule), a2);
}

id sub_100030444(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  objc_class *v6;
  char *v13;
  char *v14;
  objc_super v16;

  v13 = (char *)objc_allocWithZone(v6);
  v14 = &v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = a4;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = a5;
  *(double *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = a6;
  *(_QWORD *)&v13[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = a3;
  v16.receiver = v13;
  v16.super_class = v6;
  return objc_msgSendSuper2(&v16, "init");
}

id sub_1000304F0(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  char *v6;
  objc_class *ObjectType;
  char *v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType(v6);
  v14 = &v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = a4;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = a5;
  *(double *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = a6;
  *(_QWORD *)&v6[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = a3;
  v16.receiver = v6;
  v16.super_class = ObjectType;
  return objc_msgSendSuper2(&v16, "init");
}

id sub_10003059C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  uint64_t v53;
  objc_class *v54;
  char *v55;
  uint64_t *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  Class v70;
  objc_super v71;

  v2 = type metadata accessor for Fence.Schedule(0);
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v62 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v61 = (char *)&v61 - v5;
  v6 = type metadata accessor for Fence.Variant(0);
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10002C518(&qword_1000693F8);
  v10 = __chkstk_darwin(v9);
  v66 = (uint64_t)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v67 = (char *)&v61 - v12;
  v13 = type metadata accessor for Fence.MonitorRegion(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v15);
  v20 = (char *)&v61 - v19;
  __chkstk_darwin(v18);
  v22 = (char *)&v61 - v21;
  v23 = type metadata accessor for Fence.ID(0);
  v24 = __chkstk_darwin(v23);
  v26 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  Fence.id.getter(v24);
  v27 = String.init<A>(describing:)(v26, v23);
  v65 = v28;
  v29 = ((uint64_t (*)(void))Fence.region.getter)();
  v30 = Fence.MonitorRegion.center.getter(v29);
  v31 = *(uint64_t (**)(char *, uint64_t))(v14 + 8);
  v32 = v22;
  v33 = a1;
  v34 = v31(v32, v13);
  v35 = Fence.region.getter(v34);
  v36 = Fence.MonitorRegion.center.getter(v35);
  v38 = v37;
  v39 = ((uint64_t (*)(char *, uint64_t, double))v31)(v20, v13, v36);
  v40 = Fence.region.getter(v39);
  v41 = Fence.MonitorRegion.radius.getter(v40);
  v42 = v17;
  v43 = v63;
  v44 = v31(v42, v13);
  Fence.variant.getter(v44);
  v45 = v64;
  v46 = (*(uint64_t (**)(char *, uint64_t))(v43 + 88))(v8, v64);
  if (v46 == enum case for Fence.Variant.oneTime(_:) || v46 == enum case for Fence.Variant.recurring(_:))
  {
    (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v45);
    v48 = (uint64_t)v67;
    v47 = v68;
    v49 = v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v67, 1, 1, v69);
  }
  else if (v46 == enum case for Fence.Variant.scheduled(_:))
  {
    (*(void (**)(char *, uint64_t))(v43 + 96))(v8, v45);
    v48 = (uint64_t)v67;
    v47 = v68;
    v49 = v69;
    (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v67, v8, v69);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v48, 0, 1, v49);
  }
  else
  {
    v48 = (uint64_t)v67;
    v47 = v68;
    v49 = v69;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v68 + 56))(v67, 1, 1, v69);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v45);
  }
  v50 = v66;
  sub_100030A3C(v48, v66);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v50, 1, v49) == 1)
  {
    v51 = 0;
  }
  else
  {
    v52 = v61;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v61, v50, v49);
    type metadata accessor for FMLSchedule(0);
    v53 = (uint64_t)v62;
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v62, v52, v49);
    v51 = sub_100031224(v53);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v52, v49);
  }
  sub_100030A84(v48);
  v54 = v70;
  v55 = (char *)objc_allocWithZone(v70);
  v56 = (uint64_t *)&v55[OBJC_IVAR____TtC11fmflocatord8FMLFence_identifier];
  v57 = v65;
  *v56 = v27;
  v56[1] = v57;
  *(double *)&v55[OBJC_IVAR____TtC11fmflocatord8FMLFence_latitude] = v30;
  *(_QWORD *)&v55[OBJC_IVAR____TtC11fmflocatord8FMLFence_longitude] = v38;
  *(double *)&v55[OBJC_IVAR____TtC11fmflocatord8FMLFence_radius] = v41;
  *(_QWORD *)&v55[OBJC_IVAR____TtC11fmflocatord8FMLFence_schedule] = v51;
  v71.receiver = v55;
  v71.super_class = v54;
  v58 = objc_msgSendSuper2(&v71, "init");
  v59 = type metadata accessor for Fence(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 8))(v33, v59);
  return v58;
}

uint64_t sub_100030A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10002C518(&qword_1000693F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030A84(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10002C518(&qword_1000693F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100030AE0()
{
  _swift_stdlib_reportUnimplementedInitializer("fmflocatord.FMLFence", 20, "init()", 6, 0);
  __break(1u);
}

id sub_100030B38()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for FMLFence()
{
  return objc_opt_self(_TtC11fmflocatord8FMLFence);
}

uint64_t sub_100030BDC()
{
  return sub_100030F74((void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

uint64_t sub_100030C04()
{
  return sub_100030F74((void (*)(uint64_t))&Fence.Schedule.start.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

uint64_t sub_100030D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  uint64_t v15;

  v2 = type metadata accessor for Fence.DaysOfWeek(0, a2);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Fence.Schedule(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin();
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = Fence.Schedule.Matcher.schedule.getter(v8);
  Fence.Schedule.daysOfWeek.getter(v11);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v13 = Fence.DaysOfWeek.rawValue.getter(v12);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v13;
}

uint64_t sub_100030E24()
{
  return sub_100030F74((void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.hour.getter);
}

uint64_t sub_100030E4C(void *a1, uint64_t a2, void (*a3)(uint64_t), uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v7 = type metadata accessor for Fence.TimeOfDay(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.Schedule(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1;
  v16 = Fence.Schedule.Matcher.schedule.getter(v15);
  a3(v16);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v18 = a4(v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v18;
}

uint64_t sub_100030F60()
{
  return sub_100030F74((void (*)(uint64_t))&Fence.Schedule.end.getter, (uint64_t (*)(uint64_t))&Fence.TimeOfDay.minute.getter);
}

uint64_t sub_100030F74(void (*a1)(uint64_t), uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v4 = type metadata accessor for Fence.TimeOfDay(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Fence.Schedule(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin();
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = Fence.Schedule.Matcher.schedule.getter(v10);
  a1(v13);
  v14 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v15 = a2(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_100031080()
{
  return 0;
}

uint64_t sub_10003118C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = type metadata accessor for Fence.Schedule(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = Fence.Schedule.Matcher.schedule.getter(v2);
  Fence.Schedule.timeZone.getter(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

id sub_100031224(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  objc_super v16;

  v2 = v1;
  v4 = type metadata accessor for Fence.Schedule(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Fence.Schedule.Matcher(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_allocWithZone(v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v13 = v12;
  Fence.Schedule.Matcher.init(schedule:)(v7);
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))((uint64_t)v13 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v11, v8);

  v16.receiver = v13;
  v16.super_class = v2;
  v14 = objc_msgSendSuper2(&v16, "init");
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v14;
}

id sub_10003135C(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  objc_super v16;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  v5 = type metadata accessor for Fence.Schedule(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Fence.Schedule.Matcher(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v13 = v2;
  Fence.Schedule.Matcher.init(schedule:)(v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))((uint64_t)v13 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v12, v9);

  v16.receiver = v13;
  v16.super_class = ObjectType;
  v14 = objc_msgSendSuper2(&v16, "init");
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  return v14;
}

uint64_t sub_100031494()
{
  return Fence.Schedule.Matcher.doesMatchSchedule(_:)() & 1;
}

uint64_t sub_100031570()
{
  return Fence.Schedule.Matcher.nextStartOrEndDate(from:)();
}

void sub_1000316B8()
{
  _swift_stdlib_reportUnimplementedInitializer("fmflocatord.FMLSchedule", 23, "init()", 6, 0);
  __break(1u);
}

unint64_t sub_10003174C()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t inited;
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;

  v1 = type metadata accessor for TimeZone(0);
  v55 = *(_QWORD *)(v1 - 8);
  v56 = v1;
  __chkstk_darwin(v1);
  v54 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Fence.DaysOfWeek(0, v3);
  v52 = *(_QWORD *)(v4 - 8);
  v53 = v4;
  __chkstk_darwin(v4);
  v51 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Fence.TimeOfDay(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = v6;
  __chkstk_darwin(v6);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Fence.Schedule(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10002C518(&qword_100069490);
  inited = swift_initStackObject(v15, &v59);
  *(_OWORD *)(inited + 16) = xmmword_10004A030;
  v57 = 0x756F487472617473;
  v58 = 0xE900000000000072;
  v17 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 32), &v57, &type metadata for String, &protocol witness table for String);
  v49 = v0 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher;
  v18 = Fence.Schedule.Matcher.schedule.getter(v17);
  Fence.Schedule.start.getter(v18);
  v19 = *(uint64_t (**)(char *, uint64_t))(v12 + 8);
  v20 = v19(v14, v11);
  v21 = Fence.TimeOfDay.hour.getter(v20);
  v22 = *(void (**)(char *, uint64_t))(v7 + 8);
  v22(v10, v8);
  *(_QWORD *)(inited + 96) = &type metadata for UInt;
  *(_QWORD *)(inited + 72) = v21;
  v57 = 0x6E694D7472617473;
  v58 = 0xE800000000000000;
  v23 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 104), &v57, &type metadata for String, &protocol witness table for String);
  v24 = Fence.Schedule.Matcher.schedule.getter(v23);
  Fence.Schedule.start.getter(v24);
  v25 = v19(v14, v11);
  v26 = Fence.TimeOfDay.minute.getter(v25);
  v22(v10, v8);
  *(_QWORD *)(inited + 168) = &type metadata for UInt;
  *(_QWORD *)(inited + 144) = v26;
  v57 = 0x72756F48646E65;
  v58 = 0xE700000000000000;
  v27 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 176), &v57, &type metadata for String, &protocol witness table for String);
  v28 = Fence.Schedule.Matcher.schedule.getter(v27);
  Fence.Schedule.end.getter(v28);
  v50 = v11;
  v29 = v19(v14, v11);
  v30 = Fence.TimeOfDay.hour.getter(v29);
  v22(v10, v8);
  *(_QWORD *)(inited + 240) = &type metadata for UInt;
  *(_QWORD *)(inited + 216) = v30;
  v57 = 0x6E694D646E65;
  v58 = 0xE600000000000000;
  v31 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 248), &v57, &type metadata for String, &protocol witness table for String);
  v32 = Fence.Schedule.Matcher.schedule.getter(v31);
  Fence.Schedule.end.getter(v32);
  v33 = v19;
  v34 = v19(v14, v11);
  v35 = Fence.TimeOfDay.minute.getter(v34);
  v22(v10, v8);
  *(_QWORD *)(inited + 312) = &type metadata for UInt;
  *(_QWORD *)(inited + 288) = v35;
  v57 = 0x737961446E617073;
  v58 = 0xE800000000000000;
  AnyHashable.init<A>(_:)((_QWORD *)(inited + 320), &v57, &type metadata for String, &protocol witness table for String);
  *(_QWORD *)(inited + 384) = &type metadata for Int;
  *(_QWORD *)(inited + 360) = 0;
  v57 = 0x6557664F73796164;
  v58 = 0xEA00000000006B65;
  v36 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 392), &v57, &type metadata for String, &protocol witness table for String);
  v37 = Fence.Schedule.Matcher.schedule.getter(v36);
  v38 = v51;
  Fence.Schedule.daysOfWeek.getter(v37);
  v39 = v50;
  v40 = v19(v14, v50);
  LOBYTE(v35) = Fence.DaysOfWeek.rawValue.getter(v40);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v38, v53);
  *(_QWORD *)(inited + 456) = &type metadata for UInt;
  *(_QWORD *)(inited + 432) = v35;
  v57 = 0x7A5465636E6566;
  v58 = 0xE700000000000000;
  v41 = AnyHashable.init<A>(_:)((_QWORD *)(inited + 464), &v57, &type metadata for String, &protocol witness table for String);
  v42 = Fence.Schedule.Matcher.schedule.getter(v41);
  v43 = v54;
  Fence.Schedule.timeZone.getter(v42);
  v44 = v33(v14, v39);
  v45 = TimeZone.identifier.getter(v44);
  v47 = v46;
  (*(void (**)(char *, uint64_t))(v55 + 8))(v43, v56);
  *(_QWORD *)(inited + 528) = &type metadata for String;
  *(_QWORD *)(inited + 504) = v45;
  *(_QWORD *)(inited + 512) = v47;
  return sub_100031C4C(inited);
}

uint64_t sub_100031C2C(char a1)
{
  return *(_QWORD *)&aStarthoustartm[8 * a1];
}

unint64_t sub_100031C4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10002C518(&qword_100069548);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_100033338(v7, (uint64_t)v16);
    result = sub_1000331B4((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_1000331E4(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_100031DD8(uint64_t a1)
{
  objc_class *v1;
  id v3;
  Class isa;
  id v5;

  v3 = objc_allocWithZone(v1);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(a1);
  v5 = objc_msgSend(v3, "initWithDictionary:", isa);

  return v5;
}

id sub_100031E58(uint64_t a1)
{
  void *v1;
  void *v2;
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  objc_class *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  _QWORD *v64;
  uint64_t v65;
  char *v66;
  void (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  id v69;
  char *v70;
  id v71;
  char *v72;
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t ObjectType;
  objc_super v96;
  uint64_t v97;
  uint64_t v98;

  v2 = v1;
  ObjectType = swift_getObjectType(v1);
  v4 = type metadata accessor for Fence.Schedule.Matcher(0);
  v85 = *(_QWORD *)(v4 - 8);
  v86 = v4;
  __chkstk_darwin(v4);
  v84 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10002C518(&qword_100069498);
  __chkstk_darwin(v6);
  v88 = (char *)&v75 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = type metadata accessor for TimeZone(0);
  v89 = *(_QWORD *)(v87 - 8);
  __chkstk_darwin(v87);
  v83 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Fence.DaysOfWeek(0, v9);
  v90 = *(_QWORD *)(v10 - 8);
  v91 = v10;
  __chkstk_darwin(v10);
  v92 = (char *)&v75 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for Fence.TimeOfDay(0);
  v13 = *(_QWORD *)(v12 - 8);
  v93 = v12;
  v94 = v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v18 = (char *)&v75 - v17;
  v19 = type metadata accessor for Fence.Schedule(0);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = __chkstk_darwin(v19);
  v23 = (char *)&v75 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __chkstk_darwin(v21);
  v26 = (char *)&v75 - v25;
  __chkstk_darwin(v24);
  v28 = (char *)&v75 - v27;
  v29 = v2;
  v82 = sub_1000326FC(0, a1);
  v77 = v23;
  v78 = v28;
  v79 = v26;
  v80 = v20;
  v81 = v19;
  v30 = v94;
  v31 = (objc_class *)ObjectType;
  v32 = sub_1000326FC(1u, a1);
  v44 = v18;
  Fence.TimeOfDay.init(hour:minute:)(v82, v32);
  v45 = sub_1000326FC(3u, a1);
  v46 = sub_1000326FC(4u, a1);
  v47 = v16;
  Fence.TimeOfDay.init(hour:minute:)(v45, v46);
  v48 = sub_1000328C8(a1);
  v49 = v92;
  Fence.DaysOfWeek.init(rawValue:)(v48);
  v50 = sub_10003253C(a1);
  v51 = v93;
  v52 = (uint64_t)v88;
  v76 = v50;
  v82 = v53;
  TimeZone.init(identifier:)();
  v54 = v87;
  v55 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v52, 1, v87);
  if (v55 == 1)
  {
    sub_10003009C(v52, &qword_100069498);
    v56 = sub_100032EA8();
    v57 = swift_allocError(&type metadata for FMLSchedule.MappingError, v56, 0, 0);
    v58 = v82;
    *(_QWORD *)v59 = v76;
    *(_QWORD *)(v59 + 8) = v58;
    *(_BYTE *)(v59 + 16) = 0x80;
    swift_willThrow();

    swift_bridgeObjectRelease(a1);
    (*(void (**)(char *, uint64_t))(v90 + 8))(v49, v91);
    v60 = *(void (**)(char *, uint64_t))(v30 + 8);
    v60(v47, v51);
    v60(v44, v51);
    if (qword_1000699A0 != -1)
      swift_once(&qword_1000699A0, sub_100032C7C);
    v33 = type metadata accessor for Logger(0);
    sub_10002EA34(v33, (uint64_t)qword_1000699A8);
    swift_errorRetain(v57);
    v34 = swift_errorRetain(v57);
    v35 = Logger.logObject.getter(v34);
    v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc(12, -1);
      v38 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v37 = 138412290;
      swift_errorRetain(v57);
      v39 = _swift_stdlib_bridgeErrorToNSError(v57);
      v97 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v97, &v98, v37 + 4, v37 + 12);
      *v38 = v39;
      swift_errorRelease(v57);
      swift_errorRelease(v57);
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Failed to decode Fence schedule form dictionary: %@", v37, 0xCu);
      v40 = sub_10002C518(&qword_1000694A0);
      swift_arrayDestroy(v38, 1, v40);
      swift_slowDealloc(v38, -1, -1);
      swift_slowDealloc(v37, -1, -1);

      swift_errorRelease(v57);
    }
    else
    {
      swift_errorRelease(v57);
      swift_errorRelease(v57);
      swift_errorRelease(v57);

    }
    v41 = swift_getObjectType(v29);
    swift_deallocPartialClassInstance(v29, v41, *(unsigned int *)((swift_isaMask & *v29) + 0x30), *(unsigned __int16 *)((swift_isaMask & *v29) + 0x34));
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease(v82);
    v61 = v54;
    v62 = v83;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 32))(v83, v52, v61);
    swift_bridgeObjectRelease(a1);
    v63 = v78;
    Fence.Schedule.init(start:end:daysOfWeek:timeZone:)(v44, v47, v49, v62);
    v64 = v29;

    v66 = v79;
    v65 = v80;
    v67 = *(void (**)(char *, char *, uint64_t))(v80 + 16);
    v68 = v81;
    v67(v79, v63, v81);
    v69 = objc_allocWithZone(v31);
    v70 = v77;
    v67(v77, v66, v68);
    v71 = v69;
    v72 = v84;
    Fence.Schedule.Matcher.init(schedule:)(v70);
    (*(void (**)(uint64_t, char *, uint64_t))(v85 + 32))((uint64_t)v71 + OBJC_IVAR____TtC11fmflocatord11FMLSchedule_matcher, v72, v86);

    v96.receiver = v71;
    v96.super_class = v31;
    v42 = objc_msgSendSuper2(&v96, "init");
    v73 = *(void (**)(char *, uint64_t))(v65 + 8);
    v73(v66, v68);
    v73(v63, v68);
    v74 = swift_getObjectType(v64);
    swift_deallocPartialClassInstance(v64, v74, *(unsigned int *)((swift_isaMask & *v64) + 0x30), *(unsigned __int16 *)((swift_isaMask & *v64) + 0x34));
  }
  return v42;
}

uint64_t sub_10003253C(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  uint64_t v19;

  *(_QWORD *)&v15 = 0x7A5465636E6566;
  *((_QWORD *)&v15 + 1) = 0xE700000000000000;
  AnyHashable.init<A>(_:)(v17, &v15, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v2 = sub_1000331B4((uint64_t)v17), (v3 & 1) != 0))
  {
    sub_1000331F4(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)&v15);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  sub_100030064((uint64_t)v17);
  if (*((_QWORD *)&v16 + 1))
  {
    sub_1000331E4(&v15, &v18);
    sub_1000331F4((uint64_t)&v18, (uint64_t)v17);
    if ((swift_dynamicCast(&v15, v17, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
    {
      sub_100033254(&v18);
      return v15;
    }
    else
    {
      v7 = v19;
      v8 = sub_100033230(&v18, v19);
      v17[0] = swift_getDynamicType(v8, v7, 1);
      v9 = sub_10002C518(&qword_100069540);
      v10 = String.init<A>(describing:)(v17, v9);
      v12 = v11;
      v13 = sub_100032EA8();
      swift_allocError(&type metadata for FMLSchedule.MappingError, v13, 0, 0);
      *(_QWORD *)v14 = v10;
      *(_QWORD *)(v14 + 8) = v12;
      *(_BYTE *)(v14 + 16) = 70;
      swift_willThrow();
      return sub_100033254(&v18);
    }
  }
  else
  {
    sub_10003009C((uint64_t)&v15, &qword_100069538);
    v5 = sub_100032EA8();
    swift_allocError(&type metadata for FMLSchedule.MappingError, v5, 0, 0);
    *(_OWORD *)v6 = xmmword_10004A040;
    *(_BYTE *)(v6 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1000326FC(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  uint64_t v24;

  v4 = 8 * (char)a1;
  v5 = *(_QWORD *)&aStarthoustartm_0[v4];
  v6 = *(_QWORD *)&aR[v4];
  *(_QWORD *)&v20 = v5;
  *((_QWORD *)&v20 + 1) = v6;
  AnyHashable.init<A>(_:)(v22, &v20, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a2 + 16) && (v7 = sub_1000331B4((uint64_t)v22), (v8 & 1) != 0))
  {
    sub_1000331F4(*(_QWORD *)(a2 + 56) + 32 * v7, (uint64_t)&v20);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
  }
  sub_100030064((uint64_t)v22);
  if (*((_QWORD *)&v21 + 1))
  {
    sub_1000331E4(&v20, &v23);
    sub_1000331F4((uint64_t)&v23, (uint64_t)v22);
    if ((swift_dynamicCast(&v20, v22, (char *)&type metadata for Any + 8, &type metadata for UInt, 6) & 1) != 0)
    {
      BYTE8(v20) = 0;
      sub_100033254(&v23);
      return v20;
    }
    else
    {
      v12 = v24;
      v13 = sub_100033230(&v23, v24);
      v22[0] = swift_getDynamicType(v13, v12, 1);
      v14 = sub_10002C518(&qword_100069540);
      v15 = String.init<A>(describing:)(v22, v14);
      v17 = v16;
      v18 = sub_100032EA8();
      swift_allocError(&type metadata for FMLSchedule.MappingError, v18, 0, 0);
      *(_QWORD *)v19 = v15;
      *(_QWORD *)(v19 + 8) = v17;
      *(_BYTE *)(v19 + 16) = a1 | 0x40;
      swift_willThrow();
      return sub_100033254(&v23);
    }
  }
  else
  {
    sub_10003009C((uint64_t)&v20, &qword_100069538);
    v10 = sub_100032EA8();
    swift_allocError(&type metadata for FMLSchedule.MappingError, v10, 0, 0);
    *(_QWORD *)v11 = a1;
    *(_QWORD *)(v11 + 8) = 0;
    *(_BYTE *)(v11 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1000328C8(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[5];
  __int128 v18;
  uint64_t v19;

  *(_QWORD *)&v15 = 0x6557664F73796164;
  *((_QWORD *)&v15 + 1) = 0xEA00000000006B65;
  AnyHashable.init<A>(_:)(v17, &v15, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(a1 + 16) && (v2 = sub_1000331B4((uint64_t)v17), (v3 & 1) != 0))
  {
    sub_1000331F4(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)&v15);
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
  }
  sub_100030064((uint64_t)v17);
  if (*((_QWORD *)&v16 + 1))
  {
    sub_1000331E4(&v15, &v18);
    sub_1000331F4((uint64_t)&v18, (uint64_t)v17);
    if ((swift_dynamicCast(&v15, v17, (char *)&type metadata for Any + 8, &type metadata for UInt8, 6) & 1) != 0)
    {
      BYTE1(v15) = 0;
      sub_100033254(&v18);
      return v15;
    }
    else
    {
      v7 = v19;
      v8 = sub_100033230(&v18, v19);
      v17[0] = swift_getDynamicType(v8, v7, 1);
      v9 = sub_10002C518(&qword_100069540);
      v10 = String.init<A>(describing:)(v17, v9);
      v12 = v11;
      v13 = sub_100032EA8();
      swift_allocError(&type metadata for FMLSchedule.MappingError, v13, 0, 0);
      *(_QWORD *)v14 = v10;
      *(_QWORD *)(v14 + 8) = v12;
      *(_BYTE *)(v14 + 16) = 66;
      swift_willThrow();
      return sub_100033254(&v18);
    }
  }
  else
  {
    sub_10003009C((uint64_t)&v15, &qword_100069538);
    v5 = sub_100032EA8();
    swift_allocError(&type metadata for FMLSchedule.MappingError, v5, 0, 0);
    *(_OWORD *)v6 = xmmword_10004A050;
    *(_BYTE *)(v6 + 16) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_100032AD8(char *a1, char *a2)
{
  return sub_100032AE4(*a1, *a2);
}

uint64_t sub_100032AE4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aStarthoustartm[v2];
  v4 = *(_QWORD *)&aR_0[v2];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aR_0[v5];
  if (v3 == *(_QWORD *)&aStarthoustartm[v5] && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v6);
  return v8 & 1;
}

Swift::Int sub_100032B68()
{
  char *v0;

  return sub_100032BC4(0, *v0);
}

uint64_t sub_100032B74(uint64_t a1)
{
  char *v1;

  return sub_100032B7C(a1, *v1);
}

uint64_t sub_100032B7C(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aR_0[v2];
  String.hash(into:)(a1, *(_QWORD *)&aStarthoustartm[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100032BBC(uint64_t a1)
{
  char *v1;

  return sub_100032BC4(a1, *v1);
}

Swift::Int sub_100032BC4(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aR_0[v3];
  String.hash(into:)(v6, *(_QWORD *)&aStarthoustartm[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

unint64_t sub_100032C28@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_100033544(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100032C54@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100031C2C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100032C7C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000300D8(v0, qword_1000699A8);
  sub_10002EA34(v0, (uint64_t)qword_1000699A8);
  return Logger.init(subsystem:category:)(0xD00000000000001CLL, 0x800000010004D190, 0x7365636E6546, 0xE600000000000000);
}

uint64_t sub_100032CEC(uint64_t a1, void *a2, unsigned __int8 a3)
{
  Swift::String v6;
  Swift::String v7;
  Swift::String v8;
  uint64_t v9;
  Swift::String v10;
  Swift::String v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  Swift::String v15;
  Swift::String v16;

  if (a3 >> 6)
  {
    if (a3 >> 6 != 1)
    {
      _StringGuts.grow(_:)(62);
      v15._countAndFlagsBits = 0xD00000000000003BLL;
      v15._object = (void *)0x800000010004D3D0;
      String.append(_:)(v15);
      v16._countAndFlagsBits = a1;
      v16._object = a2;
      String.append(_:)(v16);
      v13 = 96;
      v14 = 0xE100000000000000;
      goto LABEL_7;
    }
    _StringGuts.grow(_:)(71);
    v6._countAndFlagsBits = 0xD00000000000002ELL;
    v6._object = (void *)0x800000010004D410;
    String.append(_:)(v6);
    v7._countAndFlagsBits = a1;
    v7._object = a2;
    String.append(_:)(v7);
    v8._object = (void *)0x800000010004D440;
    v8._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v8);
    v9 = 8 * (a3 & 0x3F);
  }
  else
  {
    _StringGuts.grow(_:)(55);
    v10._countAndFlagsBits = 0xD000000000000030;
    v10._object = (void *)0x800000010004D460;
    String.append(_:)(v10);
    v9 = 8 * (char)a1;
  }
  v11._countAndFlagsBits = *(_QWORD *)&aStarthoustartm[v9];
  v12 = *(void **)&aR_0[v9];
  v11._object = v12;
  String.append(_:)(v11);
  swift_bridgeObjectRelease(v12);
  v13 = 0x79656B2060;
  v14 = 0xE500000000000000;
LABEL_7:
  String.append(_:)(*(Swift::String *)&v13);
  return 0;
}

uint64_t sub_100032E9C()
{
  uint64_t v0;

  return sub_100032CEC(*(_QWORD *)v0, *(void **)(v0 + 8), *(_BYTE *)(v0 + 16));
}

unint64_t sub_100032EA8()
{
  unint64_t result;

  result = qword_1000699C8;
  if (!qword_1000699C8)
  {
    result = swift_getWitnessTable(&unk_10004A0D8, &type metadata for FMLSchedule.MappingError);
    atomic_store(result, (unint64_t *)&qword_1000699C8);
  }
  return result;
}

uint64_t sub_100032EEC()
{
  return type metadata accessor for FMLSchedule(0);
}

uint64_t type metadata accessor for FMLSchedule(uint64_t a1)
{
  uint64_t result;

  result = qword_1000699D0;
  if (!qword_1000699D0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FMLSchedule);
  return result;
}

uint64_t sub_100032F30(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for Fence.Schedule.Matcher(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100032FA0(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if ((a3 >> 6) - 1 <= 1)
    return swift_bridgeObjectRetain(a2);
  return result;
}

uint64_t destroy for FMLSchedule.MappingError(uint64_t a1)
{
  return sub_100032FCC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_100032FCC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if ((a3 >> 6) - 1 <= 1)
    return swift_bridgeObjectRelease(a2);
  return result;
}

uint64_t _s11fmflocatord11FMLScheduleC12MappingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100032FA0(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FMLSchedule.MappingError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100032FA0(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_100032FCC(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for FMLSchedule.MappingError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_100032FCC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FMLSchedule.MappingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x1E && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 30);
  v3 = ((*(unsigned __int8 *)(a1 + 16) >> 1) & 0x1C | (*(unsigned __int8 *)(a1 + 16) >> 6)) ^ 0x1F;
  if (v3 >= 0x1D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for FMLSchedule.MappingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1D)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 30;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x1E)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_BYTE *)(result + 16) = 8 * (((-a2 >> 2) & 7) - 8 * a2);
    }
  }
  return result;
}

uint64_t sub_100033170(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16) >> 6;
}

uint64_t sub_10003317C(uint64_t result)
{
  *(_BYTE *)(result + 16) &= 0x3Fu;
  return result;
}

uint64_t sub_10003318C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = *(_BYTE *)(result + 16) & 7 | (a2 << 6);
  return result;
}

ValueMetadata *type metadata accessor for FMLSchedule.MappingError()
{
  return &type metadata for FMLSchedule.MappingError;
}

unint64_t sub_1000331B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100033274(a1, v4);
}

_OWORD *sub_1000331E4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000331F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *sub_100033230(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100033254(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_100033274(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_100030028(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100030064((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100033338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10002C518((uint64_t *)&unk_100069550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_BYTE *initializeBufferWithCopyOfBuffer for FMLSchedule.DictionaryKey(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FMLSchedule.DictionaryKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FMLSchedule.DictionaryKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_10003346C + 4 * byte_10004A065[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1000334A0 + 4 * byte_10004A060[v4]))();
}

uint64_t sub_1000334A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000334A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000334B0);
  return result;
}

uint64_t sub_1000334BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000334C4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1000334C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000334D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000334DC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1000334E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FMLSchedule.DictionaryKey()
{
  return &type metadata for FMLSchedule.DictionaryKey;
}

unint64_t sub_100033500()
{
  unint64_t result;

  result = qword_100069B60[0];
  if (!qword_100069B60[0])
  {
    result = swift_getWitnessTable(&unk_10004A1A0, &type metadata for FMLSchedule.DictionaryKey);
    atomic_store(result, qword_100069B60);
  }
  return result;
}

unint64_t sub_100033544(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000569E8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 7)
    return 7;
  else
    return v3;
}

void sub_10003358C(NSObject *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "environment"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "Environment:\n%@", (uint8_t *)&v4, 0xCu);

}

void sub_100033640(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Bug in fmflocatord configuration. Please raise a radar with this message - %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000336B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Loading services now...", v1, 2u);
}

void sub_1000336F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "Could not register for network change notifications: SCDynamicStoreCreate failed", a5, a6, a7, a8, 0);
  sub_100008378();
}

void sub_100033724(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "Could not register for network change notifications: SCDynamicStoreCreateRunLoopSource failed", a5, a6, a7, a8, 0);
  sub_100008378();
}

void sub_100033754(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "Could not register for network change notifications: SCDynamicStoreSetNotificationKeys failed", a5, a6, a7, a8, 0);
  sub_100008378();
}

void sub_100033784(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No account for provider %@", (uint8_t *)&v4, 0xCu);

}

void sub_100033818(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "%@ deallocating...", v4, v5, v6, v7, 2u);

  sub_10000A120();
}

void sub_100033894(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "%@ BUG: Locator is not running, but we received a location", v4, v5, v6, v7, 2u);

  sub_10000A120();
}

void sub_100033910(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ deallocating...", (uint8_t *)&v4, 0xCu);

  sub_10000A120();
}

void sub_10003399C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of ServiceProviderMgr", v1, 2u);
}

void sub_1000339DC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init ServiceProviderMgr. Use 'sharedInstance'", v1, 2u);
}

void sub_100033A1C(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_opt_class(a1, a2);
  v3 = sub_10000ADF0(v2);
  sub_10000AE08((void *)&_mh_execute_header, v4, v5, "Unable to create instance of %@ (%@)", v6, v7, v8, v9, v10);

  sub_10000A120();
}

void sub_100033A94(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ already seen before. Ignoring this & sending the same ack as last time...", (uint8_t *)&v4, 0xCu);

}

void sub_100033B28(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "commandID"));
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Handling %@ with command id %@", (uint8_t *)&v6, 0x16u);

}

void sub_100033BE8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceName"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: No command handler found for commandType: %@", (uint8_t *)&v6, 0x16u);

}

void sub_100033C94(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adding current push token to all push tokens", v1, 2u);
}

void sub_100033CD4(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "description"));
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = CFSTR("com.apple.mobileme.fmf");
  v11 = 2112;
  v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@: Received APS message (topic: %@) : \n%@", (uint8_t *)&v7, 0x20u);

}

void sub_100033DA4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceName"));
  v5 = 138412290;
  v6 = v3;
  sub_1000141B8((void *)&_mh_execute_header, a2, v4, "%@: Publishing location now", (uint8_t *)&v5);

}

void sub_100033E30(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138412290;
  v4 = a1;
  sub_1000141B8((void *)&_mh_execute_header, a2, a3, "Showing alert : %@", (uint8_t *)&v3);
}

void sub_100033E9C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No credential found for FMF account: %@!", (uint8_t *)&v2, 0xCu);
}

void sub_100033F10()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015690();
  sub_10001567C((void *)&_mh_execute_header, v0, v1, "Now disabling the old assertion %@ with ID 0x%x");
  sub_1000156A8();
}

void sub_100033F70(uint64_t a1, _DWORD *a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = *a2;
  sub_10001567C((void *)&_mh_execute_header, (uint64_t)a2, a3, "Successfully created assertion %@ with ID 0x%x", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
  sub_1000156A8();
}

void sub_100033FE4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015690();
  sub_10001567C((void *)&_mh_execute_header, v0, v1, "Found existing assertion named %@ with ID 0x%x - will disable it after getting the new one");
  sub_1000156A8();
}

void sub_100034044()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015690();
  sub_10001567C((void *)&_mh_execute_header, v0, v1, "Successfully released power assertion %@ with ID 0x%x");
  sub_1000156A8();
}

void sub_1000340A4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015690();
  sub_10001567C((void *)&_mh_execute_header, v0, v1, "Disable power assertion with name: %@ and ID 0x%x");
  sub_1000156A8();
}

void sub_100034104(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "locateOverrides file found", v1, 2u);
}

void sub_100034144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001A620();
  sub_10001A64C((void *)&_mh_execute_header, v0, v1, "Fence provider get fences error: %@", v2, v3, v4, v5, v6);
  sub_1000156A8();
}

void sub_1000341A4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "%@ deallocating...", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_10003421C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10001A638();
  sub_10001A62C((void *)&_mh_execute_header, v0, v1, "%s: error: %@", (uint8_t *)v2);
  sub_1000156A8();
}

void sub_10003428C()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  v2[0] = 136315394;
  sub_10001A638();
  sub_10001A62C((void *)&_mh_execute_header, v0, v1, "%s: no fence found for region with ID %@", (uint8_t *)v2);
  sub_1000156A8();
}

void sub_1000342FC()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;

  sub_10001A65C();
  v3 = v0;
  sub_10001A62C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Could not delete fmf fences file (%@): %@", v2);
  sub_1000156A8();
}

void sub_100034368(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Removing stored FMF fences file", v1, 2u);
}

void sub_1000343A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001A620();
  sub_10001A64C((void *)&_mh_execute_header, v0, v1, "Unable to saveCreating FMF location manager for fences... data %@", v2, v3, v4, v5, v6);
  sub_1000156A8();
}

void sub_100034408()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001A620();
  sub_10001A64C((void *)&_mh_execute_header, v0, v1, "FMFFencesMgr Could not read fences from disk %@", v2, v3, v4, v5, v6);
  sub_1000156A8();
}

void sub_100034468(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fencesToMonitor"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "Read the following cached FMF fences:  %@", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_1000344E0()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10001A620();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Fences cache URL %@", v1, 0xCu);
  sub_1000156A8();
}

void sub_10003454C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Could not find a Library directory", v1, 2u);
}

void sub_10003458C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "Received didEnterRegion from CoreLocation for region: %@", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_100034604(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "Received didExitRegion from CoreLocation for region: %@", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_10003467C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  v5[0] = 136315394;
  sub_10001A638();
  sub_10001A62C((void *)&_mh_execute_header, a2, v4, "%s: CLRegionStateUnknown for %@", (uint8_t *)v5);

  sub_10000A120();
}

void sub_100034708(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "Received didDetermineState from CoreLocation for region: %@", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_100034780()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10001A620();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Monitoring did fail with error %@", v1, 0xCu);
  sub_1000156A8();
}

void sub_1000347EC(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[14];
  uint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10001A65C();
  v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Monitoring failed for region with identifier: %@ (%@)", v6, 0x16u);

}

void sub_10003488C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "Monitoring started for region: %@", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_100034904(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136315394;
  v3 = "-[CommandHandlerFences handleCommand]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v2, 0x16u);
}

void sub_10003498C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unknown type returned for type = %d", (uint8_t *)v2, 8u);
}

void sub_100034A00(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "standardLocator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fm_logID"));
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Removing standard locator %@", (uint8_t *)&v5, 0xCu);

}

void sub_100034AAC(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
}

void sub_100034B30(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "IDS identifier not available.", v1, 2u);
}

void sub_100034B70(char a1, char a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Device Cellular capable : %i Activated : %i", (uint8_t *)v3, 0xEu);
}

void sub_100034BFC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unlock since boot state is %i", (uint8_t *)v2, 8u);
}

void sub_100034C70(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ deallocating...", (uint8_t *)&v4, 0xCu);

}

void sub_100034D04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "Creating shared instance of FMFConfig", a5, a6, a7, a8, 0);
}

void sub_100034D38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "FMFConfig: initialize", a5, a6, a7, a8, 0);
}

void sub_100034D6C(int *a1, NSObject *a2)
{
  int v2;
  int v3;
  const __CFString *v4;
  __int16 v5;
  int v6;

  v2 = *a1;
  v3 = 138412546;
  v4 = CFSTR("FMFAllowed");
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching %@: %d", (uint8_t *)&v3, 0x12u);
}

void sub_100034DF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001EFBC();
  sub_100008368((void *)&_mh_execute_header, v0, v1, "Creating shared instance of AccountManager", v2, v3, v4, v5, v6);
  sub_100008378();
}

void sub_100034E24()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_10001EFBC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init AccountManager. Use 'sharedInstance'", v1, 2u);
  sub_100008378();
}

void sub_100034E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001EFBC();
  sub_100008368((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification since addAccount resulted in an existing account being updated", v2, v3, v4, v5, v6);
  sub_100008378();
}

void sub_100034E88(void *a1, NSObject *a2)
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;

  v4 = (void *)objc_opt_class(a1, a2);
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueId"));
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found an active account of type %@ with uniqueId %@. Deactivating it...", (uint8_t *)&v7, 0x16u);

}

void sub_100034F4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001EFBC();
  sub_100008368((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification from saveUpdatesToAccount", v2, v3, v4, v5, v6);
  sub_100008378();
}

void sub_100034F78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10001EFBC();
  sub_100008368((void *)&_mh_execute_header, v0, v1, "Posting kAccountDidUpdateNotification from storeUpdatedAnAccount", v2, v3, v4, v5, v6);
  sub_100008378();
}

void sub_100034FA4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of AppleAccountManager", v1, 2u);
}

void sub_100034FE4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init AppleAccountManager. Use 'sharedInstance'", v1, 2u);
}

void sub_100035024(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  sub_10001A62C((void *)&_mh_execute_header, a4, a3, "Error serializing the request body into JSON for %@ : %@", (uint8_t *)a3);

  sub_100023C10();
}

void sub_10003507C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NULL body data while sending %@", buf, 0xCu);

  sub_100023C10();
}

void sub_1000350CC(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  const __CFString *v6;

  v6 = CFSTR("(not-nil)");
  if (!a2)
    v6 = CFSTR("(nil)");
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Using authId %@ & authToken %@", buf, 0x16u);

  sub_100023C10();
}

void sub_10003514C(id *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "fm_logID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "alertFromServerResponse"));
  sub_100023BF8();
  sub_100023BE4((void *)&_mh_execute_header, v4, v5, "%@ Found alert : %@", v6, v7, v8, v9, v10);

  sub_100023BD4();
}

void sub_1000351E4(id *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "fm_logID"));
  sub_10001A620();
  v8 = 2112;
  v9 = a2;
  sub_10001A62C((void *)&_mh_execute_header, a3, v6, "Error trying to deserialize JSON response into dictionary for %@. Error :  %@", v7);

  sub_100023BD4();
}

void sub_10003527C()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_10001A620();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "unencodedAuthString is:  %@", v1, 0xCu);
}

void sub_1000352EC(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "nextRetryTime"));
  sub_100023BF8();
  sub_100023BE4((void *)&_mh_execute_header, v4, v5, "%@ An earlier retry is already scheduled for %@", v6, v7, v8, v9, v10);

  sub_100023BD4();
}

void sub_100035380(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  sub_10001A620();
  sub_10000A10C((void *)&_mh_execute_header, v2, v3, "%@ Network came up", v4, v5, v6, v7, v8);

  sub_10000A120();
}

void sub_1000353F8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Encountered a serializing error for the volatile device info : %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003546C(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fm_logID"));
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Error serializing volatile device info into JSON for %@ : %@", (uint8_t *)&v6, 0x16u);

}

void sub_100035518(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Creating digest out of %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003558C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100035600(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "Creating shared instance of XPCManager", a5, a6, a7, a8, 0);
  sub_100008378();
}

void sub_100035630(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "*** Trying to explicitly init XPCManager. Use 'sharedInstance'", v1, 2u);
  sub_100008378();
}

void sub_10003566C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100008368((void *)&_mh_execute_header, a1, a3, "XPCManager: initialize", a5, a6, a7, a8, 0);
  sub_100008378();
}

void sub_10003569C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10001A64C((void *)&_mh_execute_header, a2, a3, "%@", a5, a6, a7, a8, 2u);
}

void sub_100035704(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No credential found for aa_fmfAccount : %@", (uint8_t *)&v2, 0xCu);
}

void sub_100035778(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating shared instance of APSTokenWatcher", v1, 2u);
}

void sub_1000357B8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown APSConnection: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003582C()
{
  __assert_rtn("-[FMFIDSSupportProtoDeviceInformation writeTo:]", "FMFIDSSupportProtoDeviceInformation.m", 72, "nil != self->_udid");
}

id objc_msgSend_CLErrorAsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CLErrorAsString:");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByReplacingHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByReplacingHost:");
}

id objc_msgSend_URLSession_didBecomeInvalidWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLSession:didBecomeInvalidWithError:");
}

id objc_msgSend_URLSession_didReceiveChallenge_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLSession:didReceiveChallenge:completionHandler:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__accountFromACAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountFromACAccount:");
}

id objc_msgSend__basicAuthValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_basicAuthValue");
}

id objc_msgSend__beginXPCTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginXPCTransaction");
}

id objc_msgSend__BOOLGestaltQueryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_BOOLGestaltQueryForKey:");
}

id objc_msgSend__checkForBuddyCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForBuddyCompletion");
}

id objc_msgSend__checkForLocateParamOverrides_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForLocateParamOverrides:");
}

id objc_msgSend__clearAllInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearAllInfo");
}

id objc_msgSend__clearQCPendingEpoch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearQCPendingEpoch");
}

id objc_msgSend__consecutiveRetryCountForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_consecutiveRetryCountForType:");
}

id objc_msgSend__constructLocationDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructLocationDeviceInfo");
}

id objc_msgSend__constructNonCriticalFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructNonCriticalFullDeviceInfo");
}

id objc_msgSend__constructNonVolatileFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructNonVolatileFullDeviceInfo");
}

id objc_msgSend__constructPairedDevicesInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructPairedDevicesInfo");
}

id objc_msgSend__constructVolatileFullDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructVolatileFullDeviceInfo");
}

id objc_msgSend__currentFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentFences");
}

id objc_msgSend__currentLocationServicesState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentLocationServicesState");
}

id objc_msgSend__currentVersionIdentifiersDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_currentVersionIdentifiersDict");
}

id objc_msgSend__decayedWaitIntervalForRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_decayedWaitIntervalForRetryCount:");
}

id objc_msgSend__descriptionForEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_descriptionForEvent:");
}

id objc_msgSend__disableAssertion_withName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disableAssertion:withName:");
}

id objc_msgSend__disablePowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_disablePowerAssertion");
}

id objc_msgSend__discardLocationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_discardLocationManager");
}

id objc_msgSend__enablePowerAssertion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enablePowerAssertion");
}

id objc_msgSend__endXPCTransaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endXPCTransaction");
}

id objc_msgSend__errorForCode_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorForCode:message:");
}

id objc_msgSend__existingAccountInStore_withUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_existingAccountInStore:withUniqueId:");
}

id objc_msgSend__fencesCacheFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fencesCacheFileURL");
}

id objc_msgSend__fetchAppAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchAppAuthToken:");
}

id objc_msgSend__fetchInternalAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchInternalAuthToken:");
}

id objc_msgSend__handleGestaltError_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleGestaltError:forKey:");
}

id objc_msgSend__hasClientAccessEntitlement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hasClientAccessEntitlement");
}

id objc_msgSend__incrementRetryCountForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_incrementRetryCountForType:");
}

id objc_msgSend__informationDigestForDeviceInfoDictionary_keysToExclude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_informationDigestForDeviceInfoDictionary:keysToExclude:");
}

id objc_msgSend__initWithCFHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithCFHTTPCookieStorage:");
}

id objc_msgSend__isFMFAppRestrictionSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isFMFAppRestrictionSet");
}

id objc_msgSend__networkCameUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_networkCameUp");
}

id objc_msgSend__nextStartOrEndDateFrom_forSchedules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nextStartOrEndDateFrom:forSchedules:");
}

id objc_msgSend__nonEssentialRegisterDigestPrefKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_nonEssentialRegisterDigestPrefKey");
}

id objc_msgSend__oldVersionIdentifiersDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_oldVersionIdentifiersDict");
}

id objc_msgSend__publishResultLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_publishResultLocation:");
}

id objc_msgSend__readFencesToMonitorCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_readFencesToMonitorCache");
}

id objc_msgSend__registerDeviceWithCause_includeKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerDeviceWithCause:includeKeys:");
}

id objc_msgSend__registerDigestPrefKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerDigestPrefKey");
}

id objc_msgSend__registerForSignificantTimeChangeNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerForSignificantTimeChangeNotifications");
}

id objc_msgSend__registerIDSServices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerIDSServices");
}

id objc_msgSend__removeInfoForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeInfoForKey:");
}

id objc_msgSend__retryCountForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retryCountForType:");
}

id objc_msgSend__saveInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveInfo");
}

id objc_msgSend__saveVersionIdentifiersDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveVersionIdentifiersDict:");
}

id objc_msgSend__scheduleRetryAfterTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleRetryAfterTimeInterval:");
}

id objc_msgSend__sendStartupRegister(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendStartupRegister");
}

id objc_msgSend__setInfo_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setInfo:forKey:");
}

id objc_msgSend__stringGestaltQueryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stringGestaltQueryForKey:");
}

id objc_msgSend__tokensForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_tokensForAccount:");
}

id objc_msgSend__trigger_forRegionWithID_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trigger:forRegionWithID:atLocation:");
}

id objc_msgSend__triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_triggerFence:atLocation:");
}

id objc_msgSend__updateCL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCL");
}

id objc_msgSend__updateFencesToMonitorCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateFencesToMonitorCache");
}

id objc_msgSend__updateMonitoredFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateMonitoredFences");
}

id objc_msgSend__updateRealmPrefs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRealmPrefs");
}

id objc_msgSend_aa_fmfAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_fmfAccount");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acceptanceStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptanceStatus");
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "account");
}

id objc_msgSend_accountAddTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountAddTime");
}

id objc_msgSend_accountDeactivated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountDeactivated");
}

id objc_msgSend_accountDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountDidChange");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountStore");
}

id objc_msgSend_accountToStoreMapping(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountToStoreMapping");
}

id objc_msgSend_accountTypeToServiceProviderType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountTypeToServiceProviderType");
}

id objc_msgSend_accountUUIDToServiceProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountUUIDToServiceProvider");
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accounts");
}

id objc_msgSend_accountsList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsList");
}

id objc_msgSend_accuracyChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accuracyChange");
}

id objc_msgSend_ackDataForCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackDataForCommand");
}

id objc_msgSend_ackFencesCommand_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackFencesCommand:withCompletion:");
}

id objc_msgSend_ackLocateCommand_withStatusCode_andStatusMessage_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackLocateCommand:withStatusCode:andStatusMessage:withCompletion:");
}

id objc_msgSend_ackRegisterCommand_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ackRegisterCommand:withCompletion:");
}

id objc_msgSend_activateAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAlert:");
}

id objc_msgSend_activeAccountsOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeAccountsOfType:");
}

id objc_msgSend_addAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccount:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_additionalInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "additionalInfo");
}

id objc_msgSend_alarmStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmStream");
}

id objc_msgSend_alertActionInfoForAction_andURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertActionInfoForAction:andURL:");
}

id objc_msgSend_alertFromServerResponse(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertFromServerResponse");
}

id objc_msgSend_allAccountsOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allAccountsOfType:");
}

id objc_msgSend_allFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allFences");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowServerRequests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowServerRequests");
}

id objc_msgSend_alternateButtonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alternateButtonTitle");
}

id objc_msgSend_altitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "altitude");
}

id objc_msgSend_appAuthToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAuthToken");
}

id objc_msgSend_appAuthTokenStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appAuthTokenStatus");
}

id objc_msgSend_appServerHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appServerHost");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_applicationIsInstalled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIsInstalled:");
}

id objc_msgSend_applyPropertiesFromACAccount_includingTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyPropertiesFromACAccount:includingTokens:");
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsEnvironment");
}

id objc_msgSend_apsEnvironmentConstant(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsEnvironmentConstant");
}

id objc_msgSend_apsHandlerForEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsHandlerForEnvironment:");
}

id objc_msgSend_apsHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsHandlers");
}

id objc_msgSend_apsToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "apsToken");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assertionsDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assertionsDict");
}

id objc_msgSend_authId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authId");
}

id objc_msgSend_authInvalidError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authInvalidError");
}

id objc_msgSend_authToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authToken");
}

id objc_msgSend_authTokenType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authTokenType");
}

id objc_msgSend_authorizationStatusForBundlePath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authorizationStatusForBundlePath:");
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automationHelperBundle");
}

id objc_msgSend_automationHelperClassWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "automationHelperClassWithName:");
}

id objc_msgSend_base64EncodedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedString");
}

id objc_msgSend_batteryStats(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "batteryStats");
}

id objc_msgSend_bccOnFenceTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bccOnFenceTrigger");
}

id objc_msgSend_beginTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginTransaction:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:inDomain:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_buddyWaitTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buddyWaitTimer");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bytes");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_calculateFirstRunStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateFirstRunStatus");
}

id objc_msgSend_canRegisterWithIDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRegisterWithIDSID");
}

id objc_msgSend_canReplace_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canReplace:");
}

id objc_msgSend_canRequestBeRetriedNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRequestBeRetriedNow");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelled");
}

id objc_msgSend_cause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cause");
}

id objc_msgSend_checkAndScheduleRetries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkAndScheduleRetries");
}

id objc_msgSend_checkInAllAPSHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkInAllAPSHandlers");
}

id objc_msgSend_ckRecordName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordName");
}

id objc_msgSend_ckRecordZoneOwnerName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ckRecordZoneOwnerName");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_clearCachedHostsWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearCachedHostsWithContext:");
}

id objc_msgSend_cmdStatusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cmdStatusCode");
}

id objc_msgSend_cmdStatusMsg(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cmdStatusMsg");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_commandID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandID");
}

id objc_msgSend_commandName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandName");
}

id objc_msgSend_commandParams(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandParams");
}

id objc_msgSend_companionUDID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "companionUDID");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_completedStartupRegister(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completedStartupRegister");
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "completionHandler");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectionStatusString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionStatusString");
}

id objc_msgSend_connectionStatusString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionStatusString:");
}

id objc_msgSend_connectionStringForNRDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionStringForNRDevice:");
}

id objc_msgSend_consecutiveRetriesByType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "consecutiveRetriesByType");
}

id objc_msgSend_constantForEnvironmentString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constantForEnvironmentString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentsAtPath:");
}

id objc_msgSend_contextDict(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextDict");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyHandlerForCommand_params_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyHandlerForCommand:params:");
}

id objc_msgSend_copyInfoFromAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInfoFromAccount:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_course(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "course");
}

id objc_msgSend_createFenceProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFenceProvider");
}

id objc_msgSend_createFenceScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createFenceScheduler");
}

id objc_msgSend_createLocatorWithParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createLocatorWithParams:");
}

id objc_msgSend_createScheduleWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createScheduleWithDictionary:");
}

id objc_msgSend_credentialForAccount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForAccount:error:");
}

id objc_msgSend_credentialItemForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialItemForKey:");
}

id objc_msgSend_currentActiveAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentActiveAccount");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDataTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDataTask");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentThread");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "data");
}

id objc_msgSend_dataArchiver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataArchiver");
}

id objc_msgSend_dataForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataForKey:inDomain:");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateForKey:inDomain:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_deactivateAccountOfType_havingUniqueId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAccountOfType:havingUniqueId:");
}

id objc_msgSend_deactivateAllAccountsOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateAllAccountsOfType:");
}

id objc_msgSend_defaultButtonTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultButtonTitle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultQueue");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deinitializeProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deinitializeProvider");
}

id objc_msgSend_deinitializeRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deinitializeRequest");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteRegisterDigest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRegisterDigest");
}

id objc_msgSend_deregisterCommonNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterCommonNotifications");
}

id objc_msgSend_deregisterDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deregisterDelegate:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_desiredAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredAccuracy");
}

id objc_msgSend_devConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devConnection");
}

id objc_msgSend_devToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devToken");
}

id objc_msgSend_deviceClassString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceClassString");
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceColor");
}

id objc_msgSend_deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceEnclosureColor");
}

id objc_msgSend_deviceForNRDevice_fromIDSDevices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceForNRDevice:fromIDSDevices:");
}

id objc_msgSend_deviceInfoOverrides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceInfoOverrides");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceNameUpToDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceNameUpToDate");
}

id objc_msgSend_deviceUDID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceUDID");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:inDomain:");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_didCancelRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCancelRequest:");
}

id objc_msgSend_didDeactivateToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeactivateToken");
}

id objc_msgSend_didHandleCommandWithAckData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didHandleCommandWithAckData:");
}

id objc_msgSend_didReceiveAuthFailureForRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveAuthFailureForRequest:");
}

id objc_msgSend_didReceiveResponseFor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveResponseFor:");
}

id objc_msgSend_didUpdateToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateToken");
}

id objc_msgSend_distanceFromLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distanceFromLocation:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downloadTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithRequest:completionHandler:");
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dsid");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_endTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endTransaction:");
}

id objc_msgSend_enqueueNotification_postingStyle_coalesceMask_forModes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueNotification:postingStyle:coalesceMask:forModes:");
}

id objc_msgSend_enqueueRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueRequest:");
}

id objc_msgSend_enumerateByteRangesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateByteRangesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "environment");
}

id objc_msgSend_essentialServerInfoMissingError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "essentialServerInfoMissingError");
}

id objc_msgSend_eventDidOccur_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventDidOccur:");
}

id objc_msgSend_executeCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeCommand");
}

id objc_msgSend_fence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fence");
}

id objc_msgSend_fenceId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceId");
}

id objc_msgSend_fenceSchedulerCurrentSchedulesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceSchedulerCurrentSchedulesDidChange:");
}

id objc_msgSend_fenceTriggered_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceTriggered:atLocation:");
}

id objc_msgSend_fenceVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceVersion");
}

id objc_msgSend_fenceWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceWithID:");
}

id objc_msgSend_fencesCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesCommand");
}

id objc_msgSend_fencesToMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fencesToMonitor");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:relativeToURL:");
}

id objc_msgSend_finalLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalLocation");
}

id objc_msgSend_findMyLocateSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findMyLocateSession");
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finished");
}

id objc_msgSend_finishedTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTimer");
}

id objc_msgSend_firstDateFromDates_order_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstDateFromDates:order:");
}

id objc_msgSend_firstRetryInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstRetryInterval");
}

id objc_msgSend_flattenedArrayFromObject_parentIndices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flattenedArrayFromObject:parentIndices:");
}

id objc_msgSend_floor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floor");
}

id objc_msgSend_fm_any_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_any:");
}

id objc_msgSend_fm_epoch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_epoch");
}

id objc_msgSend_fm_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_filter:");
}

id objc_msgSend_fm_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_firstObjectPassingTest:");
}

id objc_msgSend_fm_genericError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_genericError");
}

id objc_msgSend_fm_hexString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_hexString");
}

id objc_msgSend_fm_logID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_logID");
}

id objc_msgSend_fm_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_map:");
}

id objc_msgSend_fm_nullToNil(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_nullToNil");
}

id objc_msgSend_fm_safelyMapKey_toObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fm_safelyMapKey:toObject:");
}

id objc_msgSend_fmfACAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfACAccount");
}

id objc_msgSend_fmfAccountInfoWithTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmfAccountInfoWithTokens:");
}

id objc_msgSend_fmf_triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fmf_triggerFence:atLocation:");
}

id objc_msgSend_forceTouchAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceTouchAvailable");
}

id objc_msgSend_formattedURLForTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formattedURLForTemplate:");
}

id objc_msgSend_fullDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fullDeviceInfo");
}

id objc_msgSend_getActiveLocationSharingDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getActiveLocationSharingDevice:");
}

id objc_msgSend_getAllTasksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllTasksWithCompletionHandler:");
}

id objc_msgSend_getFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFences:");
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getPairedDevices");
}

id objc_msgSend_handleAlertAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAlertAction:");
}

id objc_msgSend_handleCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCommand");
}

id objc_msgSend_handleQueueCheckResponseWithStatus_andBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleQueueCheckResponseWithStatus:andBody:");
}

id objc_msgSend_handleRequestsOfType_withHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleRequestsOfType:withHandler:");
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasAttemptedLoad");
}

id objc_msgSend_hasCellularCapability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCellularCapability");
}

id objc_msgSend_hasCompletedInitialSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasCompletedInitialSetup");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSameRelevantInfoAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSameRelevantInfoAs:");
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalAccuracy");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "host");
}

id objc_msgSend_hostportOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hostportOverride");
}

id objc_msgSend_httpRequestHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpRequestHeaders");
}

id objc_msgSend_httpResponseBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpResponseBody");
}

id objc_msgSend_httpResponseError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpResponseError");
}

id objc_msgSend_httpResponseHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpResponseHeaders");
}

id objc_msgSend_httpResponseStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "httpResponseStatus");
}

id objc_msgSend_iCloudACAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iCloudACAccount");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsDeviceID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsDeviceID");
}

id objc_msgSend_idsManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsManager");
}

id objc_msgSend_inProgress(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inProgress");
}

id objc_msgSend_inTestingMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inTestingMode");
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "info");
}

id objc_msgSend_infoAtStartup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoAtStartup");
}

id objc_msgSend_infoChangeQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoChangeQueue");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initSingleton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initSingleton");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithCenter_radius_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCenter:radius:identifier:");
}

id objc_msgSend_initWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:delegateQueue:");
}

id objc_msgSend_initWithDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDict:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEffectiveBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundle:");
}

id objc_msgSend_initWithEffectiveBundlePath_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEffectiveBundlePath:delegate:onQueue:");
}

id objc_msgSend_initWithEnvironmentName_launchOnDemandPort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:launchOnDemandPort:");
}

id objc_msgSend_initWithEnvironmentName_namedDelegatePort_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEnvironmentName:namedDelegatePort:queue:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithLocationManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocationManager:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithParams_provider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithParams:provider:");
}

id objc_msgSend_initWithProtobufData_type_isResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProtobufData:type:isResponse:");
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:");
}

id objc_msgSend_initWithProvider_andCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:andCause:");
}

id objc_msgSend_initWithProvider_andServerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:andServerContext:");
}

id objc_msgSend_initWithProvider_fencesCommand_ackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:fencesCommand:ackURL:");
}

id objc_msgSend_initWithProvider_locateCommand_ackURL_cmdStatusCode_cmdStatusMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:locateCommand:ackURL:cmdStatusCode:cmdStatusMessage:");
}

id objc_msgSend_initWithProvider_location_finalLocation_locateCommand_reason_accuracyChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:location:finalLocation:locateCommand:reason:accuracyChange:");
}

id objc_msgSend_initWithProvider_registerCommand_ackURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:registerCommand:ackURL:");
}

id objc_msgSend_initWithProvider_triggeredLocation_fence_validityDuration_triggerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithProvider:triggeredLocation:fence:validityDuration:triggerURL:");
}

id objc_msgSend_initWithServiceId_minimumVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithServiceId:minimumVersion:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_initWithTimeInterval_serviceIdentifier_target_selector_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:");
}

id objc_msgSend_initialize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initialize");
}

id objc_msgSend_initializeXPC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeXPC");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:inDomain:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_internalAuthToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalAuthToken");
}

id objc_msgSend_internalAuthTokenStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalAuthTokenStatus");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isActive");
}

id objc_msgSend_isAllowedAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAllowedAtLocation:");
}

id objc_msgSend_isBuddyDone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBuddyDone");
}

id objc_msgSend_isComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isComplete");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isCurrentAt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentAt:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToData:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFMFAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFMFAllowed");
}

id objc_msgSend_isFMFAppRemoved(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFMFAppRemoved");
}

id objc_msgSend_isFenceBeingMonitored_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFenceBeingMonitored:");
}

id objc_msgSend_isFirstRunAfterBoot(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstRunAfterBoot");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isLocationServicesEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationServicesEnabled");
}

id objc_msgSend_isLocationServicesEnabledForShareMyLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLocationServicesEnabledForShareMyLocation");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNearby");
}

id objc_msgSend_isNotifyMeFence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotifyMeFence");
}

id objc_msgSend_isNotifyOthersFence(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNotifyOthersFence");
}

id objc_msgSend_isPairedDeviceSimulationActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPairedDeviceSimulationActive");
}

id objc_msgSend_isPreviouslyHandledCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPreviouslyHandledCommand");
}

id objc_msgSend_isProviderEnabledForLocations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProviderEnabledForLocations");
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_isRecurring(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecurring");
}

id objc_msgSend_isRegionMonitoringAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRegionMonitoringAvailable");
}

id objc_msgSend_isSimulationActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSimulationActive");
}

id objc_msgSend_isThisDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isThisDevice");
}

id objc_msgSend_isValidTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isValidTrigger:");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_lastActiveDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastActiveDate");
}

id objc_msgSend_lastActiveDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastActiveDate:");
}

id objc_msgSend_lastForcedRegisterTimePrefKey(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastForcedRegisterTimePrefKey");
}

id objc_msgSend_lastLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastLocation");
}

id objc_msgSend_lastMessageDisplayedTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastMessageDisplayedTimestamp");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastOnWristDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastOnWristDate");
}

id objc_msgSend_lastOnWristTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastOnWristTime");
}

id objc_msgSend_lastPublishReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPublishReason");
}

id objc_msgSend_lastPublishedAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPublishedAccuracy");
}

id objc_msgSend_lastRetryTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastRetryTime");
}

id objc_msgSend_lastRetryType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastRetryType");
}

id objc_msgSend_lastTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTrigger");
}

id objc_msgSend_lastTriggerTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastTriggerTimestamp");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latitude");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "level");
}

id objc_msgSend_loadExistingAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadExistingAccounts");
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locManager");
}

id objc_msgSend_locMgr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locMgr");
}

id objc_msgSend_locServicesCapable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locServicesCapable");
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locale");
}

id objc_msgSend_locateCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locateCommand");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "location");
}

id objc_msgSend_locationDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationDeviceInfo");
}

id objc_msgSend_locationDeviceInfoOverrides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationDeviceInfoOverrides");
}

id objc_msgSend_locationForPublish(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationForPublish");
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationServicesEnabled");
}

id objc_msgSend_locatorRunning(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locatorRunning");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lock");
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "logState");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longitude");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_maxConsecutiveNetworkNotificationRetries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxConsecutiveNetworkNotificationRetries");
}

id objc_msgSend_maxNonNetworkRelatedRetries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxNonNetworkRelatedRetries");
}

id objc_msgSend_maxRetryInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxRetryInterval");
}

id objc_msgSend_maxTimerBasedNetworkRetries(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxTimerBasedNetworkRetries");
}

id objc_msgSend_migrateFromVersion_toVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateFromVersion:toVersion:");
}

id objc_msgSend_monitoredFences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredFences");
}

id objc_msgSend_monitoredRegions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitoredRegions");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_networkRegisterRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkRegisterRetryCount");
}

id objc_msgSend_newLocationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newLocationManager");
}

id objc_msgSend_newRequestBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRequestBody");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextObject");
}

id objc_msgSend_nextRetryTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextRetryTime");
}

id objc_msgSend_nextRetryType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextRetryType");
}

id objc_msgSend_nonEssentialRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nonEssentialRetryCount");
}

id objc_msgSend_notificationWithName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationWithName:object:userInfo:");
}

id objc_msgSend_notifyDelegateThatCurrentSchedulesDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegateThatCurrentSchedulesDidChange");
}

id objc_msgSend_nsxpcListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nsxpcListener");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:inDomain:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_overriddenBuildVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overriddenBuildVersion");
}

id objc_msgSend_overriddenOSVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overriddenOSVersion");
}

id objc_msgSend_pairedDeviceInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairedDeviceInfo");
}

id objc_msgSend_pairingIdForNRDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pairingIdForNRDevice:");
}

id objc_msgSend_parentAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parentAccount");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_performInitialSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performInitialSetup");
}

id objc_msgSend_performMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performMigration");
}

id objc_msgSend_performSelector_onThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:onThread:withObject:waitUntilDone:");
}

id objc_msgSend_performSelectorOnMainThread_withObject_waitUntilDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:");
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "platform");
}

id objc_msgSend_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_powerAssertionDisableWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerAssertionDisableWithReason:");
}

id objc_msgSend_powerAssertionEnableWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerAssertionEnableWithReason:");
}

id objc_msgSend_powerAssertionEnableWithReason_timeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerAssertionEnableWithReason:timeout:");
}

id objc_msgSend_powerAssertionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "powerAssertionName");
}

id objc_msgSend_preferencesMgr(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferencesMgr");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processInfo");
}

id objc_msgSend_prodConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prodConnection");
}

id objc_msgSend_prodToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prodToken");
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productType");
}

id objc_msgSend_productVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "productVersion");
}

id objc_msgSend_propertiesForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertiesForDataclass:");
}

id objc_msgSend_protocolSchemeOverride(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "protocolSchemeOverride");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "provider");
}

id objc_msgSend_publishReason(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishReason");
}

id objc_msgSend_publishTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishTimer");
}

id objc_msgSend_radius(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "radius");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readDictionaryAndClasses_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readDictionaryAndClasses:error:");
}

id objc_msgSend_redirectedHostForHost_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redirectedHostForHost:withContext:");
}

id objc_msgSend_refreshAuthTokens(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshAuthTokens");
}

id objc_msgSend_registerAlarms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerAlarms");
}

id objc_msgSend_registerCommand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerCommand");
}

id objc_msgSend_registerCommonNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerCommonNotifications");
}

id objc_msgSend_registerDelegate_forTopic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDelegate:forTopic:");
}

id objc_msgSend_registerDeviceContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDeviceContext");
}

id objc_msgSend_registerDeviceWithCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDeviceWithCause:");
}

id objc_msgSend_registerDeviceWithCause_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDeviceWithCause:force:");
}

id objc_msgSend_registerDidFail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDidFail");
}

id objc_msgSend_registerDidSucceed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerDidSucceed");
}

id objc_msgSend_registerQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerQueue");
}

id objc_msgSend_registeredCauses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredCauses");
}

id objc_msgSend_registrationInformationDigestIncludingKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registrationInformationDigestIncludingKeys");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeInactiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeInactiveAccount:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKey:inDomain:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:force:reason:completion:");
}

id objc_msgSend_requestAuthenticationShouldForce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthenticationShouldForce:");
}

id objc_msgSend_requestAuthenticationShouldForce_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthenticationShouldForce:completion:");
}

id objc_msgSend_requestBody(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestBody");
}

id objc_msgSend_requestHeaders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestHeaders");
}

id objc_msgSend_requestModifierLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestModifierLock");
}

id objc_msgSend_requestUrl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestUrl");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_requests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requests");
}

id objc_msgSend_responseErrorType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "responseErrorType");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeRegistrations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeRegistrations");
}

id objc_msgSend_retryIntervalDecayFactor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryIntervalDecayFactor");
}

id objc_msgSend_retryTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retryTimer");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_saveChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveChanges");
}

id objc_msgSend_saveDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveDictionary:");
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedule");
}

id objc_msgSend_scheduleAlarmStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleAlarmStream");
}

id objc_msgSend_scheduleInRunLoop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleInRunLoop:");
}

id objc_msgSend_scheduleTimerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTimerIdentifier");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduler");
}

id objc_msgSend_schedulerCurrentSchedulesDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulerCurrentSchedulesDidChange:");
}

id objc_msgSend_schedules(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedules");
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "send");
}

id objc_msgSend_sendAckWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendAckWithCompletion:");
}

id objc_msgSend_sendCurrentLocation_isFinished_forCmd_withReason_andAccuracyChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendCurrentLocation:isFinished:forCmd:withReason:andAccuracyChange:");
}

id objc_msgSend_sendMessageWithProtobuf_inResponseToRequest_withPriority_timeout_bypassingDuet_requestAcceptedHandler_responseHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageWithProtobuf:inResponseToRequest:withPriority:timeout:bypassingDuet:requestAcceptedHandler:responseHandler:");
}

id objc_msgSend_sendQueueCheckRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendQueueCheckRequest:");
}

id objc_msgSend_sendQueueCheckRequest_withReasons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendQueueCheckRequest:withReasons:");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serializedFormOfLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedFormOfLocation:");
}

id objc_msgSend_serverContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverContext");
}

id objc_msgSend_serverContextHeaderString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverContextHeaderString");
}

id objc_msgSend_serverHost(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverHost");
}

id objc_msgSend_serverProtocolScheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverProtocolScheme");
}

id objc_msgSend_serviceIdentifierInURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceIdentifierInURL");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceProviderForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serviceProviderForAccount:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAcceptanceStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptanceStatus:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountAddTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountAddTime:");
}

id objc_msgSend_setAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountStore:");
}

id objc_msgSend_setAccountToStoreMapping_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountToStoreMapping:");
}

id objc_msgSend_setAccountUUIDToServiceProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountUUIDToServiceProvider:");
}

id objc_msgSend_setAccountsList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountsList:");
}

id objc_msgSend_setAccuracyChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccuracyChange:");
}

id objc_msgSend_setAckURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAckURL:");
}

id objc_msgSend_setAdditionalInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalInfo:");
}

id objc_msgSend_setAlertFromServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlertFromServerResponse:");
}

id objc_msgSend_setAllFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllFences:");
}

id objc_msgSend_setAllHTTPHeaderFields_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllHTTPHeaderFields:");
}

id objc_msgSend_setAllowServerRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowServerRequests:");
}

id objc_msgSend_setAlternateButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateButtonAction:");
}

id objc_msgSend_setAlternateButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlternateButtonTitle:");
}

id objc_msgSend_setAppAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAuthToken:");
}

id objc_msgSend_setAppAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAuthTokenStatus:");
}

id objc_msgSend_setAppServerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppServerHost:");
}

id objc_msgSend_setApsEnvironment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsEnvironment:");
}

id objc_msgSend_setApsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsToken:");
}

id objc_msgSend_setAssertionsDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssertionsDict:");
}

id objc_msgSend_setAutomationHelperBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomationHelperBundle:");
}

id objc_msgSend_setBackedUp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackedUp:");
}

id objc_msgSend_setBuddyWaitTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuddyWaitTimer:");
}

id objc_msgSend_setCachedLocValidityDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedLocValidityDuration:");
}

id objc_msgSend_setCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelled:");
}

id objc_msgSend_setCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:");
}

id objc_msgSend_setCause_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCause:");
}

id objc_msgSend_setCkRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCkRecordName:");
}

id objc_msgSend_setCkRecordZoneOwnerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCkRecordZoneOwnerName:");
}

id objc_msgSend_setCmdStatusCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCmdStatusCode:");
}

id objc_msgSend_setCmdStatusMsg_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCmdStatusMsg:");
}

id objc_msgSend_setCommandParams_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandParams:");
}

id objc_msgSend_setCompletedStartupRegister_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletedStartupRegister:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setConsecutiveRetriesByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConsecutiveRetriesByType:");
}

id objc_msgSend_setContextDict_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextDict:");
}

id objc_msgSend_setCreateDirectories_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreateDirectories:");
}

id objc_msgSend_setCurrentActiveAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentActiveAccount:");
}

id objc_msgSend_setCurrentDataTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentDataTask:");
}

id objc_msgSend_setData_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setData:forKey:inDomain:");
}

id objc_msgSend_setDataArchiver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataArchiver:");
}

id objc_msgSend_setDataProtectionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProtectionClass:");
}

id objc_msgSend_setDate_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:forKey:inDomain:");
}

id objc_msgSend_setDecayFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDecayFactor:");
}

id objc_msgSend_setDefaultButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonAction:");
}

id objc_msgSend_setDefaultButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultButtonTitle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDevConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevConnection:");
}

id objc_msgSend_setDevToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDevToken:");
}

id objc_msgSend_setDeviceNameUpToDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceNameUpToDate:");
}

id objc_msgSend_setDictionary_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDictionary:forKey:inDomain:");
}

id objc_msgSend_setDidDeactivateToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidDeactivateToken:");
}

id objc_msgSend_setDidUpdateToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidUpdateToken:");
}

id objc_msgSend_setDismissMsgOnLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissMsgOnLock:");
}

id objc_msgSend_setDismissMsgOnUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDismissMsgOnUnlock:");
}

id objc_msgSend_setDistanceFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDistanceFilter:");
}

id objc_msgSend_setDsid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDsid:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEndThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEndThreshold:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFence:");
}

id objc_msgSend_setFenceId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceId:");
}

id objc_msgSend_setFenceVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFenceVersion:");
}

id objc_msgSend_setFencesCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesCommand:");
}

id objc_msgSend_setFencesToMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesToMonitor:");
}

id objc_msgSend_setFencesToMonitor_withFenceVersion_triggerValidityDuration_andTriggerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesToMonitor:withFenceVersion:triggerValidityDuration:andTriggerURL:");
}

id objc_msgSend_setFencesUpdateCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFencesUpdateCallback:");
}

id objc_msgSend_setFinalLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinalLocation:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setFinishedTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedTimer:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPCookieStorage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPCookieStorage:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHasAttemptedLoad_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasAttemptedLoad:");
}

id objc_msgSend_setHasCompletedInitialSetup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasCompletedInitialSetup:");
}

id objc_msgSend_setHttpResponseBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpResponseBody:");
}

id objc_msgSend_setHttpResponseError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpResponseError:");
}

id objc_msgSend_setHttpResponseHeaders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpResponseHeaders:");
}

id objc_msgSend_setHttpResponseStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHttpResponseStatus:");
}

id objc_msgSend_setIdsManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdsManager:");
}

id objc_msgSend_setInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInProgress:");
}

id objc_msgSend_setInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfo:");
}

id objc_msgSend_setInfoAtStartup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfoAtStartup:");
}

id objc_msgSend_setInfoChangeQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInfoChangeQueue:");
}

id objc_msgSend_setInternalAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalAuthToken:");
}

id objc_msgSend_setInternalAuthTokenStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInternalAuthTokenStatus:");
}

id objc_msgSend_setIsActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsActive:");
}

id objc_msgSend_setIsComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsComplete:");
}

id objc_msgSend_setIsFirstRunAfterBoot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFirstRunAfterBoot:");
}

id objc_msgSend_setLastLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastLocation:");
}

id objc_msgSend_setLastMessageDisplayedTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastMessageDisplayedTimestamp:");
}

id objc_msgSend_setLastOnWristDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastOnWristDate:");
}

id objc_msgSend_setLastPublishReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPublishReason:");
}

id objc_msgSend_setLastPublishedAccuracy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastPublishedAccuracy:");
}

id objc_msgSend_setLastRetryTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastRetryTime:");
}

id objc_msgSend_setLastTrigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTrigger:");
}

id objc_msgSend_setLastTriggerTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastTriggerTimestamp:");
}

id objc_msgSend_setLatitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatitude:");
}

id objc_msgSend_setLaunchOnRebootActivity_keepAliveActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaunchOnRebootActivity:keepAliveActivity:");
}

id objc_msgSend_setLocManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocManager:");
}

id objc_msgSend_setLocateCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocateCommand:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setLocationForPublish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationForPublish:");
}

id objc_msgSend_setLocationManagerSemaphore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocationManagerSemaphore:");
}

id objc_msgSend_setLocatorRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocatorRunning:");
}

id objc_msgSend_setLongitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLongitude:");
}

id objc_msgSend_setMinimumEarlyFireProportion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumEarlyFireProportion:");
}

id objc_msgSend_setMonitoredFences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonitoredFences:");
}

id objc_msgSend_setMsgText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMsgText:");
}

id objc_msgSend_setMsgTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMsgTitle:");
}

id objc_msgSend_setNetworkAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkAvailable:");
}

id objc_msgSend_setNetworkReachabilityUpdateCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkReachabilityUpdateCallback:");
}

id objc_msgSend_setNextRetryTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextRetryTime:");
}

id objc_msgSend_setNextRetryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNextRetryType:");
}

id objc_msgSend_setNonEssentialRetryCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNonEssentialRetryCount:");
}

id objc_msgSend_setNsxpcListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNsxpcListener:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:inDomain:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPreferencesMgr_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferencesMgr:");
}

id objc_msgSend_setProdConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProdConnection:");
}

id objc_msgSend_setProdToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProdToken:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setPublishReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublishReason:");
}

id objc_msgSend_setPublishTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublishTimer:");
}

id objc_msgSend_setRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRadius:");
}

id objc_msgSend_setReceivedLocationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReceivedLocationBlock:");
}

id objc_msgSend_setRecurring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecurring:");
}

id objc_msgSend_setRedirectedHost_forHost_withContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRedirectedHost:forHost:withContext:");
}

id objc_msgSend_setRefreshAuthTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRefreshAuthTokens:");
}

id objc_msgSend_setRegisterCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisterCommand:");
}

id objc_msgSend_setRegisterQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisterQueue:");
}

id objc_msgSend_setRegisteredCauses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegisteredCauses:");
}

id objc_msgSend_setRequestBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestBody:");
}

id objc_msgSend_setRequestModifierLock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestModifierLock:");
}

id objc_msgSend_setRequestTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestTimeout:");
}

id objc_msgSend_setRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequests:");
}

id objc_msgSend_setRetryTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRetryTimer:");
}

id objc_msgSend_setSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedule:");
}

id objc_msgSend_setSchedules_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSchedules:");
}

id objc_msgSend_setServerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerContext:");
}

id objc_msgSend_setServerContextHeaderString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerContextHeaderString:");
}

id objc_msgSend_setServerHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerHost:");
}

id objc_msgSend_setServerProtocolScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerProtocolScheme:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setShowMsgInLockScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowMsgInLockScreen:");
}

id objc_msgSend_setStandardLocator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStandardLocator:");
}

id objc_msgSend_setStartThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartThreshold:");
}

id objc_msgSend_setStartTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartTime:");
}

id objc_msgSend_setStartupComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartupComplete:");
}

id objc_msgSend_setStateCapture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateCapture:");
}

id objc_msgSend_setStateCaptureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateCaptureBlock:");
}

id objc_msgSend_setStoppedLocatorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoppedLocatorBlock:");
}

id objc_msgSend_setString_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:forKey:inDomain:");
}

id objc_msgSend_setTokenWatcherObserverToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenWatcherObserverToken:");
}

id objc_msgSend_setTotalRetriesByType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalRetriesByType:");
}

id objc_msgSend_setTriggerTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerTimestamp:");
}

id objc_msgSend_setTriggerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerType:");
}

id objc_msgSend_setTriggerURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerURL:");
}

id objc_msgSend_setTriggerValidityDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggerValidityDuration:");
}

id objc_msgSend_setTriggeredLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggeredLocation:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUdid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUdid:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValidityDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValidityDuration:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersionHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVersionHistory:");
}

id objc_msgSend_setWaitingForBuddy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWaitingForBuddy:");
}

id objc_msgSend_setWillRetry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWillRetry:");
}

id objc_msgSend_setWillSendHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWillSendHandler:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_appleIDContext:");
}

id objc_msgSend_set_currentLocationServicesState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_currentLocationServicesState:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedFactory");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldForceRegisterOnStartup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldForceRegisterOnStartup");
}

id objc_msgSend_shouldTrigger_forLocation_atDate_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldTrigger:forLocation:atDate:reason:");
}

id objc_msgSend_shouldUseCloudKitStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseCloudKitStore");
}

id objc_msgSend_shouldUseIDSTrigger(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseIDSTrigger");
}

id objc_msgSend_showAlertFromServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAlertFromServerResponse:");
}

id objc_msgSend_showAuthFailedMessage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAuthFailedMessage");
}

id objc_msgSend_showDebugFenceTriggerAlertIfNeededWithTitle_text_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showDebugFenceTriggerAlertIfNeededWithTitle:text:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speed");
}

id objc_msgSend_standardDeviceContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardDeviceContext");
}

id objc_msgSend_standardLocator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardLocator");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startGlobalManagers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startGlobalManagers");
}

id objc_msgSend_startLocator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLocator");
}

id objc_msgSend_startMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startMonitoringForRegion:");
}

id objc_msgSend_startServiceProviders(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startServiceProviders");
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTime");
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingLocation");
}

id objc_msgSend_startupComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startupComplete");
}

id objc_msgSend_stateCapture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateCapture");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopGlobalManagers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopGlobalManagers");
}

id objc_msgSend_stopLocator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopLocator");
}

id objc_msgSend_stopMonitoringForRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopMonitoringForRegion:");
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatingLocation");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByExpandingTildeInPath");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingMatchesInString:options:range:withTemplate:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringForCaseInsensitiveStringKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForCaseInsensitiveStringKey:");
}

id objc_msgSend_stringForFourCC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForFourCC:");
}

id objc_msgSend_stringForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:inDomain:");
}

id objc_msgSend_stringForLocationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForLocationType:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringValueForServer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValueForServer");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substituteStandardURLPlaceholders_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substituteStandardURLPlaceholders:");
}

id objc_msgSend_substituteStandardURLPlaceholders_withAccount_withServiceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "substituteStandardURLPlaceholders:withAccount:withServiceIdentifier:");
}

id objc_msgSend_supportsMultipleActiveAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsMultipleActiveAccounts");
}

id objc_msgSend_suspendRegistrations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendRegistrations");
}

id objc_msgSend_syncFMFAccountInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncFMFAccountInfo");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timerIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerIdentifier");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestamp");
}

id objc_msgSend_timezone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timezone");
}

id objc_msgSend_tokenList(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenList");
}

id objc_msgSend_tokenWatcherObserverToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tokenWatcherObserverToken");
}

id objc_msgSend_totalRetriesByType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalRetriesByType");
}

id objc_msgSend_totalRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalRetryCount");
}

id objc_msgSend_triggerFence_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerFence:atLocation:");
}

id objc_msgSend_triggerFenceWithID_trigger_location_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerFenceWithID:trigger:location:completionHandler:");
}

id objc_msgSend_triggerTimestamp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerTimestamp");
}

id objc_msgSend_triggerType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerType");
}

id objc_msgSend_triggerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerURL");
}

id objc_msgSend_triggerValidityDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerValidityDuration");
}

id objc_msgSend_triggerWithUUID_forFenceWithID_withStatus_forDate_triggerLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggerWithUUID:forFenceWithID:withStatus:forDate:triggerLocation:completion:");
}

id objc_msgSend_triggeredLocation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "triggeredLocation");
}

id objc_msgSend_tryToFetchAuthToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tryToFetchAuthToken");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "udid");
}

id objc_msgSend_udid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "udid:");
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingQueue");
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueId");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlock");
}

id objc_msgSend_unlockState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unlockState");
}

id objc_msgSend_unregisterDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterDevice");
}

id objc_msgSend_updateProactiveMonitorRegistration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateProactiveMonitorRegistration");
}

id objc_msgSend_updatedFenceForFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedFenceForFence:");
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "urlSession");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInfoFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfoFrom:");
}

id objc_msgSend_userTestApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userTestApplication");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "username");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uuid");
}

id objc_msgSend_validityDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validityDuration");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_verifyLaunchEventsConfiguration_withExclusions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyLaunchEventsConfiguration:withExclusions:");
}

id objc_msgSend_versionHistory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "versionHistory");
}

id objc_msgSend_verticalAccuracy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalAccuracy");
}

id objc_msgSend_waitForSpringBoard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForSpringBoard");
}

id objc_msgSend_waitingForBuddy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitingForBuddy");
}

id objc_msgSend_willRetry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willRetry");
}

id objc_msgSend_willSendHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willSendHandler");
}

id objc_msgSend_wristRegisterRetryCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wristRegisterRetryCount");
}

id objc_msgSend_wristStatusString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wristStatusString");
}

id objc_msgSend_xpcTransactionName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcTransactionName");
}
