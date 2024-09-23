@implementation PSSystemConfigurationDynamicStoreWifiWatcher

+ (id)sharedInstance
{
  if (sharedInstance_cacheOnce_55 != -1)
    dispatch_once(&sharedInstance_cacheOnce_55, &__block_literal_global_56);
  return (id)sharedInstance___dynamicStoreSharedInstance;
}

void __62__PSSystemConfigurationDynamicStoreWifiWatcher_sharedInstance__block_invoke()
{
  PSSystemConfigurationDynamicStoreWifiWatcher *v0;
  void *v1;

  v0 = objc_alloc_init(PSSystemConfigurationDynamicStoreWifiWatcher);
  v1 = (void *)sharedInstance___dynamicStoreSharedInstance;
  sharedInstance___dynamicStoreSharedInstance = (uint64_t)v0;

}

+ (BOOL)wifiEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[PSSystemConfigurationDynamicStoreWifiWatcher sharedInstance](PSSystemConfigurationDynamicStoreWifiWatcher, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wifiConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("wifiPower"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)findKeysAirPortState:(id *)a3 andTetheringState:(id *)a4
{
  const __CFString *v7;
  const __CFString *v8;
  __CFString *NetworkInterfaceEntity;
  const __CFArray *v10;
  const __CFString *NetworkInterface;
  const __CFString *v12;
  CFPropertyListRef v13;
  CFTypeID v14;
  const void *v15;
  const __CFArray *Value;
  const __CFArray *v17;
  CFTypeID v18;
  int v19;
  int v20;
  CFIndex v21;
  const __CFString *ValueAtIndex;
  const __CFString *v23;
  NSObject *v24;
  __CFArray *v25;
  CFIndex Count;
  __CFString *wifiKey;
  CFPropertyListRef v28;
  void *v29;
  CFTypeID v30;
  __CFArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  const __CFString *v36;
  CFTypeID v37;
  const __CFString *v38;
  __CFString *v39;
  CFPropertyListRef v40;
  void *v41;
  __CFString *v42;
  __CFString *wifiInterface;
  CFTypeID v44;
  __CFArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t j;
  const __CFString *v51;
  CFTypeID v52;
  const __CFString *v53;
  __CFString *v54;
  CFPropertyListRef v55;
  void *v56;
  __CFString *tetheringLink;
  CFTypeID v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id *v62;
  id *v63;
  __CFArray *theArray;
  CFMutableArrayRef theArraya;
  PSSystemConfigurationDynamicStoreWifiWatcher *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  char buffer[8];
  uint64_t v80;
  uint8_t v81[16];
  _BYTE v82[40];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v7 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  v8 = (const __CFString *)*MEMORY[0x1E0CE8B58];
  NetworkInterfaceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B58]);
  if (NetworkInterfaceEntity)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", NetworkInterfaceEntity);
    v10 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    SCDynamicStoreSetNotificationKeys(self->_prefs, v10, 0);

  }
  NetworkInterface = SCDynamicStoreKeyCreateNetworkInterface(0, v7);
  if (!NetworkInterface)
    goto LABEL_33;
  v12 = NetworkInterface;
  v13 = SCDynamicStoreCopyValue(self->_prefs, NetworkInterface);
  CFRelease(v12);
  if (!v13)
    goto LABEL_33;
  v14 = CFGetTypeID(v13);
  if (v14 != CFDictionaryGetTypeID()
    || (v15 = (const void *)*MEMORY[0x1E0CE8B38],
        !CFDictionaryContainsKey((CFDictionaryRef)v13, (const void *)*MEMORY[0x1E0CE8B38]))
    || (Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v13, v15)) == 0
    || (v17 = Value, v18 = CFGetTypeID(Value), v18 != CFArrayGetTypeID()))
  {
    CFRelease(v13);
    goto LABEL_33;
  }
  v63 = a3;
  v66 = self;
  v62 = a4;
  if (CFArrayGetCount(v17))
  {
    v19 = socket(2, 2, 0);
    if (v19 == -1)
    {
      _PSLoggingFacility();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v81 = 136315138;
        *(_QWORD *)&v81[4] = "__WiFiManagerCopyAirPortInterfaces";
        _os_log_impl(&dword_1A3819000, v61, OS_LOG_TYPE_DEFAULT, "Socket creation failed at %s", v81, 0xCu);
      }

      v25 = 0;
      goto LABEL_26;
    }
    v20 = v19;
    theArray = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (theArray)
    {
      if (CFArrayGetCount(v17) >= 1)
      {
        v21 = 0;
        do
        {
          *(_OWORD *)v81 = 0u;
          memset(v82, 0, 28);
          *(_QWORD *)buffer = 0;
          v80 = 0;
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v17, v21);
          if (ValueAtIndex)
          {
            v23 = ValueAtIndex;
            CFStringGetCString(ValueAtIndex, buffer, 16, 0);
            if (buffer[0])
            {
              __strcpy_chk();
              if (!ioctl(v20, 0xC02C6938uLL, v81) && (v82[0] & 0xE0) == 0x80)
                CFArrayAppendValue(theArray, v23);
            }
            else
            {
              _PSLoggingFacility();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v78 = "__WiFiManagerCopyAirPortInterfaces";
                _os_log_impl(&dword_1A3819000, v24, OS_LOG_TYPE_DEFAULT, "%s, interfaceCName is zero length.", buf, 0xCu);
              }

            }
          }
          ++v21;
        }
        while (v21 < CFArrayGetCount(v17));
      }
      v25 = theArray;
      Count = CFArrayGetCount(theArray);
      close(v20);
      if (Count)
        goto LABEL_26;
      CFRelease(theArray);
    }
    else
    {
      close(v20);
    }
  }
  v25 = 0;
LABEL_26:
  CFRelease(v13);
  wifiKey = self->_wifiKey;
  theArraya = v25;
  if (wifiKey)
  {
    v28 = SCDynamicStoreCopyValue(self->_prefs, wifiKey);
    if (v28)
    {
      v29 = (void *)v28;
      if (v63)
      {
        v30 = CFGetTypeID(v28);
        if (v30 == CFDictionaryGetTypeID())
          *v63 = objc_retainAutorelease(v29);
      }
      CFRelease(v29);
    }
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v31 = v25;
    v32 = -[__CFArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v72;
      while (2)
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v72 != v34)
            objc_enumerationMutation(v31);
          v36 = *(const __CFString **)(*((_QWORD *)&v71 + 1) + 8 * i);
          v37 = CFGetTypeID(v36);
          if (v37 == CFStringGetTypeID() && CFStringFind(v36, CFSTR("lo"), 8uLL).location == -1)
          {
            v38 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v7, v36, v8);
            if (v38)
            {
              v39 = (__CFString *)v38;
              v40 = SCDynamicStoreCopyValue(v66->_prefs, v38);
              if (v40)
              {
                v41 = (void *)v40;
                v42 = v66->_wifiKey;
                if (v42)
                  CFRelease(v42);
                wifiInterface = v66->_wifiInterface;
                if (wifiInterface)
                  CFRelease(wifiInterface);
                v66->_wifiKey = v39;
                v66->_wifiInterface = (__CFString *)CFRetain(v36);
                if (v63)
                {
                  v44 = CFGetTypeID(v41);
                  if (v44 == CFDictionaryGetTypeID())
                    *v63 = objc_retainAutorelease(v41);
                }
                CFRelease(v41);
                goto LABEL_55;
              }
              CFRelease(v39);
            }
          }
        }
        v33 = -[__CFArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
        if (v33)
          continue;
        break;
      }
    }
LABEL_55:

    v25 = theArraya;
    self = v66;
  }
  if (self->_wifiInterface)
  {
    -[__CFArray removeObjectIdenticalTo:](v25, "removeObjectIdenticalTo:");
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v45 = v25;
    v46 = -[__CFArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v68;
      v49 = (const __CFString *)*MEMORY[0x1E0CE8B90];
      while (2)
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v68 != v48)
            objc_enumerationMutation(v45);
          v51 = *(const __CFString **)(*((_QWORD *)&v67 + 1) + 8 * j);
          v52 = CFGetTypeID(v51);
          if (v52 == CFStringGetTypeID() && CFStringFind(v51, CFSTR("lo"), 8uLL).location == -1)
          {
            v53 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, v7, v51, v49);
            if (v53)
            {
              v54 = (__CFString *)v53;
              v55 = SCDynamicStoreCopyValue(v66->_prefs, v53);
              if (v55)
              {
                v56 = (void *)v55;
                tetheringLink = v66->_tetheringLink;
                if (tetheringLink)
                  CFRelease(tetheringLink);
                v66->_tetheringLink = v54;
                if (v62)
                {
                  v58 = CFGetTypeID(v56);
                  if (v58 == CFDictionaryGetTypeID())
                    *v62 = objc_retainAutorelease(v56);
                }
                CFRelease(v56);
                goto LABEL_76;
              }
              CFRelease(v54);
            }
          }
        }
        v47 = -[__CFArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        if (v47)
          continue;
        break;
      }
    }
LABEL_76:

    v25 = theArraya;
    self = v66;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (self->_wifiKey)
  {
    objc_msgSend(v59, "addObject:");
    if (self->_tetheringLink)
      objc_msgSend(v60, "addObject:");
    SCDynamicStoreSetNotificationKeys(self->_prefs, (CFArrayRef)v60, 0);
  }

LABEL_33:
}

- (id)_wifiTetheringWithState:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CE8D98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)_wifiPowerWithState:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKey:", CFSTR("POWER"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v3, "count"))
    goto LABEL_5;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_wifiNameWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("WiFiNetworkType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "intValue") == 1)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("SSID_STR"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)wifiConfig
{
  void *v3;
  __CFString *wifiKey;
  CFPropertyListRef v5;
  id v6;
  CFTypeID v7;
  CFPropertyListRef v8;
  id v9;
  CFTypeID v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  wifiKey = self->_wifiKey;
  if (wifiKey && self->_tetheringLink)
  {
    v5 = SCDynamicStoreCopyValue(self->_prefs, wifiKey);
    v6 = (id)v5;
    if (v5)
    {
      v7 = CFGetTypeID(v5);
      if (v7 != CFDictionaryGetTypeID())
      {
        CFRelease(v6);
        v6 = 0;
      }
    }
    v8 = SCDynamicStoreCopyValue(self->_prefs, self->_tetheringLink);
    v9 = (id)v8;
    if (v8)
    {
      v10 = CFGetTypeID(v8);
      if (v10 != CFDictionaryGetTypeID())
      {
        CFRelease(v9);
        v9 = 0;
      }
    }
  }
  else
  {
    v15 = 0;
    v16 = 0;
    -[PSSystemConfigurationDynamicStoreWifiWatcher findKeysAirPortState:andTetheringState:](self, "findKeysAirPortState:andTetheringState:", &v16, &v15);
    v6 = v16;
    v9 = v15;
  }
  -[PSSystemConfigurationDynamicStoreWifiWatcher _wifiNameWithState:](self, "_wifiNameWithState:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("wifiName"));
  -[PSSystemConfigurationDynamicStoreWifiWatcher _wifiPowerWithState:](self, "_wifiPowerWithState:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("wifiPower"));
  -[PSSystemConfigurationDynamicStoreWifiWatcher _wifiTetheringWithState:](self, "_wifiTetheringWithState:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("wifiTethering"));

  return v3;
}

- (PSSystemConfigurationDynamicStoreWifiWatcher)init
{
  PSSystemConfigurationDynamicStoreWifiWatcher *v2;
  PSSystemConfigurationDynamicStoreWifiWatcher *v3;
  const __SCDynamicStore *v4;
  PSSystemConfigurationDynamicStoreWifiWatcher *v5;
  SCDynamicStoreContext v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PSSystemConfigurationDynamicStoreWifiWatcher;
  v2 = -[PSSystemConfigurationDynamicStoreWifiWatcher init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v7.version = 0;
    memset(&v7.retain, 0, 24);
    v7.info = v2;
    v4 = SCDynamicStoreCreateWithOptions(0, CFSTR("com.apple.preferences"), 0, (SCDynamicStoreCallBack)WifiStateChanged, &v7);
    v3->_prefs = v4;
    if (!v4)
    {
      v5 = 0;
      goto LABEL_6;
    }
    SCDynamicStoreSetDispatchQueue(v4, MEMORY[0x1E0C80D38]);
  }
  v5 = v3;
LABEL_6:

  return v5;
}

- (void)dealloc
{
  __SCDynamicStore *prefs;
  __CFString *wifiKey;
  __CFString *wifiInterface;
  __CFString *tetheringLink;
  objc_super v7;

  prefs = self->_prefs;
  if (prefs)
  {
    SCDynamicStoreSetDispatchQueue(prefs, 0);
    CFRelease(self->_prefs);
  }
  wifiKey = self->_wifiKey;
  if (wifiKey)
    CFRelease(wifiKey);
  wifiInterface = self->_wifiInterface;
  if (wifiInterface)
    CFRelease(wifiInterface);
  tetheringLink = self->_tetheringLink;
  if (tetheringLink)
    CFRelease(tetheringLink);
  v7.receiver = self;
  v7.super_class = (Class)PSSystemConfigurationDynamicStoreWifiWatcher;
  -[PSSystemConfigurationDynamicStoreWifiWatcher dealloc](&v7, sel_dealloc);
}

@end
