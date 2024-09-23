@implementation WFIPMonitor

- (id)__wifiServiceID
{
  __CFString *v3;
  const __SCPreferences *v4;
  const __SCPreferences *v5;
  const __SCNetworkSet *v6;
  const __SCNetworkSet *v7;
  const __CFArray *v8;
  const __CFArray *ServiceOrder;
  const __CFArray *v10;
  __int128 v11;
  CFIndex v12;
  const void *ValueAtIndex;
  const void *v14;
  CFIndex v15;
  const __SCNetworkService *v16;
  const __SCNetworkService *v17;
  CFStringRef ServiceID;
  __CFString *v19;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v21;
  __CFString *BSDName;
  __CFString *v23;
  void *v24;
  int v25;
  __CFString *InterfaceType;
  int v27;
  NSObject *v28;
  os_log_type_t v29;
  os_log_type_t v30;
  NSString *v31;
  NSObject *v32;
  os_log_type_t v33;
  NSString *interfaceName;
  __int128 v36;
  const __SCNetworkSet *v37;
  const __SCPreferences *v38;
  __CFString *v39;
  CFTypeRef cf2;
  WFIPMonitor *v41;
  NSString *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;
  __int16 v49;
  NSString *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (NSString *)objc_claimAutoreleasedReturnValue();
  v41 = self;
  v4 = SCPreferencesCreateWithAuthorization((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)self->_bundleIdentifier, 0, 0);
  v5 = v4;
  if (!v4)
  {
    v8 = 0;
    v7 = 0;
LABEL_45:
    if (-[__CFString count](v3, "count", v36))
    {
      WFLogForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
      {
        interfaceName = v41->_interfaceName;
        *(_DWORD *)buf = 136315906;
        v44 = "-[WFIPMonitor __wifiServiceID]";
        v45 = 2114;
        v46 = (__CFString *)interfaceName;
        v47 = 2114;
        v48 = v3;
        v49 = 2114;
        v50 = v42;
        _os_log_impl(&dword_219FC8000, v32, v33, "%s Failed to return a service ID. None of the available SCNetworkInterfaceRefs matched the IEEE80211 type. _interfaceName: %{public}@, BSD names compared: %{public}@, types: %{public}@", buf, 0x2Au);
      }

    }
    InterfaceType = 0;
    goto LABEL_52;
  }
  v6 = SCNetworkSetCopyCurrent(v4);
  v7 = v6;
  if (!v6)
  {
    v8 = 0;
    goto LABEL_45;
  }
  v8 = SCNetworkSetCopyServices(v6);
  if (!v8)
    goto LABEL_45;
  ServiceOrder = SCNetworkSetGetServiceOrder(v7);
  if (!ServiceOrder)
    goto LABEL_45;
  v10 = ServiceOrder;
  if (CFArrayGetCount(ServiceOrder) < 1)
    goto LABEL_45;
  v37 = v7;
  v38 = v5;
  v12 = 0;
  cf2 = (CFTypeRef)*MEMORY[0x24BDF5A48];
  *(_QWORD *)&v11 = 136315906;
  v36 = v11;
  v39 = v3;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v10, v12);
    if (ValueAtIndex)
    {
      v14 = ValueAtIndex;
      if (CFArrayGetCount(v8) >= 1)
      {
        v15 = 0;
        while (1)
        {
          v16 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v15);
          if (!v16)
            goto LABEL_32;
          v17 = v16;
          if (!SCNetworkServiceGetEnabled(v16))
            goto LABEL_32;
          ServiceID = SCNetworkServiceGetServiceID(v17);
          if (!ServiceID)
            goto LABEL_32;
          v19 = (__CFString *)ServiceID;
          if (!CFEqual(ServiceID, v14))
            goto LABEL_32;
          Interface = SCNetworkServiceGetInterface(v17);
          if (!Interface)
            goto LABEL_32;
          do
          {
            v21 = Interface;
            Interface = SCNetworkInterfaceGetInterface(Interface);
          }
          while (Interface);
          BSDName = (__CFString *)SCNetworkInterfaceGetBSDName(v21);
          v23 = BSDName;
          if (BSDName)
          {
            v24 = (void *)-[__CFString copy](BSDName, "copy");
            -[__CFString addObject:](v3, "addObject:", v24);

            v25 = -[__CFString isEqualToString:](v23, "isEqualToString:", v41->_interfaceName);
          }
          else
          {
            v25 = 0;
          }
          InterfaceType = (__CFString *)SCNetworkInterfaceGetInterfaceType(v21);
          if (!InterfaceType)
            goto LABEL_33;
          -[NSString addObject:](v42, "addObject:", InterfaceType);
          v27 = CFEqual(InterfaceType, cf2) ? v25 : 0;
          if (v27 == 1)
          {
            if (-[__CFString rangeOfString:](v23, "rangeOfString:", CFSTR("en")) == 0x7FFFFFFFFFFFFFFFLL)
            {
              WFLogForCategory(0);
              v28 = objc_claimAutoreleasedReturnValue();
              v29 = OSLogForWFLogLevel(1uLL);
              InterfaceType = 0;
              if (WFCurrentLogLevel() && v28)
              {
                if (os_log_type_enabled(v28, v29))
                {
                  *(_DWORD *)buf = 136315650;
                  v44 = "-[WFIPMonitor __wifiServiceID]";
                  v45 = 2112;
                  v46 = v23;
                  v47 = 2112;
                  v48 = v19;
                  _os_log_impl(&dword_219FC8000, v28, v29, "%s: skipping non-Infra WiFi service bsdName='%@' (serviceID='%@')", buf, 0x20u);
                }
                InterfaceType = 0;
              }
              v3 = v39;
LABEL_31:

              goto LABEL_33;
            }
            InterfaceType = (__CFString *)-[__CFString copy](v19, "copy");
            if (InterfaceType)
            {
              WFLogForCategory(0);
              v28 = objc_claimAutoreleasedReturnValue();
              v30 = OSLogForWFLogLevel(1uLL);
              if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v30))
              {
                v31 = v41->_interfaceName;
                *(_DWORD *)buf = v36;
                v44 = "-[WFIPMonitor __wifiServiceID]";
                v45 = 2112;
                v46 = InterfaceType;
                v47 = 2112;
                v48 = v23;
                v49 = 2112;
                v50 = v31;
                _os_log_impl(&dword_219FC8000, v28, v30, "%s: wifi serviceID: %@, bsdName: %@, _interfaceName: %@", buf, 0x2Au);
              }
              goto LABEL_31;
            }
          }
          else
          {
LABEL_32:
            InterfaceType = 0;
          }
LABEL_33:
          if (CFArrayGetCount(v8) <= ++v15 || InterfaceType)
            goto LABEL_42;
        }
      }
    }
    InterfaceType = 0;
LABEL_42:
    ++v12;
  }
  while (CFArrayGetCount(v10) > v12 && !InterfaceType);
  v7 = v37;
  v5 = v38;
  if (!InterfaceType)
    goto LABEL_45;
LABEL_52:
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  if (v5)
    CFRelease(v5);

  return InterfaceType;
}

- (BOOL)monitorNetworkServiceID:(id)a3
{
  __CFString *v4;
  __SCDynamicStore *storeRef;
  __SCDynamicStore *v6;
  __CFString *v7;
  _WFIPMonitorObserver *v8;
  _WFIPMonitorObserver *dynamicStoreInfo;
  _WFIPMonitorObserver *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFAllocator *v13;
  __SCDynamicStore *v14;
  const __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  __CFString *NetworkServiceEntity;
  CFStringRef v19;
  CFStringRef v20;
  __CFString *v21;
  __CFString *v22;
  CFStringRef v23;
  __CFString *v24;
  __CFString *v25;
  const __CFString *v26;
  __SCDynamicStore *v27;
  const __CFArray *v28;
  NSObject *v29;
  os_log_type_t v30;
  NSObject *v31;
  os_log_type_t v32;
  NSObject *v33;
  os_log_type_t v34;
  BOOL v35;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  SCDynamicStoreContext context;
  uint8_t buf[4];
  __CFString *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  storeRef = self->_storeRef;
  if (storeRef)
  {
    SCDynamicStoreSetDispatchQueue(storeRef, 0);
    v6 = self->_storeRef;
    if (v6)
    {
      CFRelease(v6);
      self->_storeRef = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = (_WFIPMonitorObserver *)objc_opt_new();
  dynamicStoreInfo = self->_dynamicStoreInfo;
  self->_dynamicStoreInfo = v8;

  -[_WFIPMonitorObserver setIpMonitor:](self->_dynamicStoreInfo, "setIpMonitor:", self);
  v10 = self->_dynamicStoreInfo;
  context.version = 0;
  context.info = v10;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
  context.copyDescription = 0;
  if (!v4 || (v11 = WFCopyProcessIdentifier()) == 0)
  {
    v35 = 0;
    goto LABEL_29;
  }
  v12 = v11;
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, (SCDynamicStoreCallBack)__ipStoreCallback, &context);
  if (v14)
  {
    self->_storeRef = v14;
    v15 = (const __CFString *)*MEMORY[0x24BDF59A8];
    v16 = (__CFString *)SCDynamicStoreKeyCreate(v13, (CFStringRef)*MEMORY[0x24BDF59A8]);
    if (v16)
    {
      -[__CFString addObject:](v7, "addObject:", v16);
      v17 = (const __CFString *)*MEMORY[0x24BDF59B0];
      NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, (CFStringRef)*MEMORY[0x24BDF59B0], v4, (CFStringRef)*MEMORY[0x24BDF59F0]);
      if (NetworkServiceEntity
        && (-[__CFString addObject:](v7, "addObject:", NetworkServiceEntity),
            (v19 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x24BDF59F8])) != 0))
      {
        v39 = (__CFString *)v19;
        -[__CFString addObject:](v7, "addObject:", v19);
        v20 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x24BDF59D0]);
        if (v20)
        {
          v38 = (__CFString *)v20;
          -[__CFString addObject:](v7, "addObject:", v20);
          v21 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x24BDF59D8]);
          if (v21)
          {
            -[__CFString addObject:](v7, "addObject:", v21);
            v22 = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v17, v4, (CFStringRef)*MEMORY[0x24BDF5A28]);
            if (v22)
            {
              -[__CFString addObject:](v7, "addObject:", v22);
              v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v13, v15, v4, (CFStringRef)*MEMORY[0x24BDF5990]);
              v24 = (__CFString *)v23;
              if (v23)
              {
                v37 = NetworkServiceEntity;
                v25 = v16;
                v26 = v12;
                v27 = self->_storeRef;
                v43[0] = v23;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 1);
                v28 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
                LODWORD(v27) = SCDynamicStoreSetNotificationKeys(v27, (CFArrayRef)v7, v28);

                if ((_DWORD)v27)
                {
                  SCDynamicStoreSetDispatchQueue(self->_storeRef, (dispatch_queue_t)self->_queue);
                  WFLogForCategory(0);
                  v29 = objc_claimAutoreleasedReturnValue();
                  v30 = OSLogForWFLogLevel(4uLL);
                  v12 = v26;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v29 && os_log_type_enabled(v29, v30))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v4;
                    _os_log_impl(&dword_219FC8000, v29, v30, "Monitoring service ID %@", buf, 0xCu);
                  }

                  WFLogForCategory(0);
                  v31 = objc_claimAutoreleasedReturnValue();
                  v32 = OSLogForWFLogLevel(4uLL);
                  v16 = v25;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v31 && os_log_type_enabled(v31, v32))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v7;
                    _os_log_impl(&dword_219FC8000, v31, v32, "SC Keys: %@", buf, 0xCu);
                  }

                  WFLogForCategory(0);
                  v33 = objc_claimAutoreleasedReturnValue();
                  v34 = OSLogForWFLogLevel(4uLL);
                  NetworkServiceEntity = v37;
                  if ((unint64_t)WFCurrentLogLevel() >= 4 && v33 && os_log_type_enabled(v33, v34))
                  {
                    *(_DWORD *)buf = 138412290;
                    v42 = v24;
                    _os_log_impl(&dword_219FC8000, v33, v34, "SC Match Pattern: %@", buf, 0xCu);
                  }

                  v35 = 1;
                }
                else
                {
                  v35 = 0;
                  v12 = v26;
                  v16 = v25;
                  NetworkServiceEntity = v37;
                }
                goto LABEL_28;
              }
            }
            else
            {
              v24 = 0;
            }
          }
          else
          {
            v24 = 0;
            v22 = 0;
          }
        }
        else
        {
          v24 = 0;
          v22 = 0;
          v21 = 0;
          v38 = 0;
        }
      }
      else
      {
        v24 = 0;
        v22 = 0;
        v21 = 0;
        v38 = 0;
        v39 = 0;
      }
    }
    else
    {
      v24 = 0;
      v22 = 0;
      v21 = 0;
      v38 = 0;
      v39 = 0;
      NetworkServiceEntity = 0;
    }
  }
  else
  {
    v24 = 0;
    v22 = 0;
    v21 = 0;
    v38 = 0;
    v39 = 0;
    NetworkServiceEntity = 0;
    v16 = 0;
  }
  v35 = 0;
LABEL_28:
  CFRelease(v12);

LABEL_29:
  return v35;
}

- (WFIPMonitor)initWithInterfaceName:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  dispatch_queue_t v9;
  void *v10;
  CFStringRef v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFAllocator *v16;
  SCDynamicStoreRef v17;
  __CFString *NetworkServiceEntity;
  const __SCDynamicStore *v19;
  const __CFArray *v20;
  void *v21;
  void *v22;
  WFIPMonitor *v23;
  SCDynamicStoreContext context;
  objc_super v26;
  id location;

  v5 = a3;
  location = 0;
  v26.receiver = self;
  v26.super_class = (Class)WFIPMonitor;
  v6 = -[WFIPMonitor init](&v26, sel_init);
  if (!v6
    || (objc_storeWeak(&location, v6), !v5)
    || (objc_storeStrong((id *)v6 + 4, a3),
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.WiFiKit.ipmonitor-%@"), v5),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8 = 0;
LABEL_10:
    NetworkServiceEntity = 0;
    goto LABEL_11;
  }
  v8 = objc_retainAutorelease(v7);
  v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
  v10 = (void *)*((_QWORD *)v6 + 8);
  *((_QWORD *)v6 + 8) = v9;

  v11 = WFCopyProcessIdentifier();
  v12 = (void *)*((_QWORD *)v6 + 9);
  *((_QWORD *)v6 + 9) = v11;

  if (!*((_QWORD *)v6 + 9))
    goto LABEL_10;
  v13 = objc_opt_new();
  v14 = (void *)*((_QWORD *)v6 + 2);
  *((_QWORD *)v6 + 2) = v13;

  objc_msgSend(*((id *)v6 + 2), "setIpMonitor:", v6);
  v15 = (void *)*((_QWORD *)v6 + 2);
  context.version = 0;
  context.info = v15;
  context.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
  context.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
  context.copyDescription = 0;
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v17 = SCDynamicStoreCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], *((CFStringRef *)v6 + 9), (SCDynamicStoreCallBack)_netServiceCallback, &context);
  *((_QWORD *)v6 + 7) = v17;
  if (!v17)
    goto LABEL_10;
  NetworkServiceEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkServiceEntity(v16, (CFStringRef)*MEMORY[0x24BDF59A8], (CFStringRef)*MEMORY[0x24BDF5990], 0);
  v19 = (const __SCDynamicStore *)*((_QWORD *)v6 + 7);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", NetworkServiceEntity);
  v20 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = SCDynamicStoreSetNotificationKeys(v19, 0, v20);

  if (!(_DWORD)v19)
  {
LABEL_11:

    v22 = 0;
    v6 = 0;
    goto LABEL_8;
  }
  SCDynamicStoreSetDispatchQueue(*((SCDynamicStoreRef *)v6 + 7), *((dispatch_queue_t *)v6 + 8));
  objc_msgSend(v6, "__wifiServiceID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");

  objc_storeStrong((id *)v6 + 3, v22);
  objc_msgSend(v6, "monitorNetworkServiceID:", *((_QWORD *)v6 + 3));
LABEL_8:
  v23 = (WFIPMonitor *)v6;
  objc_destroyWeak(&location);

  return v23;
}

- (WFIPMonitor)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("-[WFIPMonitor init] unavailable"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)dealloc
{
  __SCDynamicStore *storeRef;
  __SCDynamicStore *networkServiceStore;
  __SCPreferences *prefsRef;
  __SCDynamicStore *v6;
  __SCDynamicStore *v7;
  objc_super v8;

  storeRef = self->_storeRef;
  if (storeRef)
  {
    SCDynamicStoreSetDispatchQueue(storeRef, 0);
    SCDynamicStoreSetNotificationKeys(self->_storeRef, 0, 0);
  }
  networkServiceStore = self->_networkServiceStore;
  if (networkServiceStore)
  {
    SCDynamicStoreSetDispatchQueue(networkServiceStore, 0);
    SCDynamicStoreSetNotificationKeys(self->_networkServiceStore, 0, 0);
  }
  prefsRef = self->_prefsRef;
  if (prefsRef)
  {
    CFRelease(prefsRef);
    self->_prefsRef = 0;
  }
  v6 = self->_storeRef;
  if (v6)
  {
    CFRelease(v6);
    self->_storeRef = 0;
  }
  v7 = self->_networkServiceStore;
  if (v7)
  {
    CFRelease(v7);
    self->_networkServiceStore = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)WFIPMonitor;
  -[WFIPMonitor dealloc](&v8, sel_dealloc);
}

- (void)_postChangesNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__WFIPMonitor__postChangesNotification___block_invoke;
  v6[3] = &unk_24DC34BE8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __40__WFIPMonitor__postChangesNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16C8];
  v5 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = CFSTR("changedKeys");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationWithName:object:userInfo:", CFSTR("WFIPMonitorStateChangedNotification"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "postNotification:", v7);
}

- (BOOL)hasValidIPAddress
{
  void *v3;

  if (-[WFIPMonitor ipv4ConfigMethod](self, "ipv4ConfigMethod") == 4)
  {
    -[WFIPMonitor ipv4Router](self, "ipv4Router");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return 1;
  }
  return -[WFIPMonitor hasValidIPv4Address](self, "hasValidIPv4Address")
      || -[WFIPMonitor hasValidIPv6Address](self, "hasValidIPv6Address");
}

- (BOOL)hasValidIPv4Address
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char valid;

  -[WFIPMonitor ipv4Addresses](self, "ipv4Addresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    -[WFIPMonitor ipv4SubnetMasks](self, "ipv4SubnetMasks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "objectAtIndex:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      valid = WFIsValidIPv4Address(v6, v7);

    }
    else
    {
      valid = 0;
    }

  }
  else
  {
    valid = 0;
  }

  return valid;
}

- (BOOL)hasValidIPv6Address
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WFIPMonitor ipv6Addresses](self, "ipv6Addresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v4);
          if ((WFIsValidIPv6Address(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)renewLease
{
  NSObject *v3;
  os_log_type_t v4;
  const __SCNetworkSet *v5;
  const __SCNetworkSet *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  os_log_type_t v19;
  int v20;
  const char *v21;
  const char *v22;
  BOOL v23;
  int v25;
  const char *v26;
  int v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  WFLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v3 && os_log_type_enabled(v3, v4))
  {
    v27 = 136315138;
    v28 = "-[WFIPMonitor renewLease]";
    _os_log_impl(&dword_219FC8000, v3, v4, "%s: renewing lease", (uint8_t *)&v27, 0xCu);
  }

  if (!-[WFIPMonitor prefsRef](self, "prefsRef"))
    return 0;
  v5 = SCNetworkSetCopyCurrent(-[WFIPMonitor prefsRef](self, "prefsRef"));
  if (!v5)
    return 0;
  v6 = v5;
  v7 = SCNetworkSetCopyServices(v5);
  if (!v7)
  {
    v23 = 0;
    v8 = v6;
    goto LABEL_24;
  }
  v8 = v7;
  Count = CFArrayGetCount(v7);
  if (!Count)
    goto LABEL_13;
  v10 = Count;
  v11 = 0;
  v12 = *MEMORY[0x24BDF5A48];
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v11);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    SCNetworkInterfaceGetInterfaceType(Interface);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v12))
    {
      SCNetworkInterfaceGetBSDName(Interface);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", self->_interfaceName);

      if ((v17 & 1) != 0)
        break;
    }

    if (v10 == ++v11)
      goto LABEL_13;
  }

  if (!Interface)
  {
LABEL_13:
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (!WFCurrentLogLevel() || !v18)
      goto LABEL_19;
    v18 = v18;
    if (!os_log_type_enabled(v18, v19))
      goto LABEL_18;
    v20 = SCError();
    v21 = SCErrorString(v20);
    v27 = 136315138;
    v28 = v21;
    v22 = "WiFi: renewLease failed. Couldn't find WiFi interface. %s";
    goto LABEL_17;
  }
  if (SCNetworkInterfaceForceConfigurationRefresh(Interface))
  {
    v23 = 1;
    goto LABEL_23;
  }
  WFLogForCategory(0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v18)
  {
    v18 = v18;
    if (!os_log_type_enabled(v18, v19))
      goto LABEL_18;
    v25 = SCError();
    v26 = SCErrorString(v25);
    v27 = 136315138;
    v28 = v26;
    v22 = "renewLease failed: %s";
LABEL_17:
    _os_log_impl(&dword_219FC8000, v18, v19, v22, (uint8_t *)&v27, 0xCu);
LABEL_18:

  }
LABEL_19:

  v23 = 0;
LABEL_23:
  CFRelease(v6);
LABEL_24:
  CFRelease(v8);
  return v23;
}

- (int64_t)ipv6ConfigMethod
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv6ConfigMethod__block_invoke;
  v5[3] = &unk_24DC352E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__WFIPMonitor_ipv6ConfigMethod__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B10]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C10]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C18]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C20]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 3;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C28]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 4;
  }
  else
  {
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C08]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v5)
      v4 = 5;
    else
      v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(v3 + 24) = v4;

}

- (int64_t)ipv4ConfigMethod
{
  NSObject *queue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv4ConfigMethod__block_invoke;
  v5[3] = &unk_24DC352E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __31__WFIPMonitor_ipv4ConfigMethod__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5AE0]);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BD0]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BF0]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 2;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BE0]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 3;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BF8]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 4;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BD8]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 5;
  }
  else if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5BE8]))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = 7;
  }
  else
  {
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDF5C00]);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (v5)
      v4 = 6;
    else
      v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  *(_QWORD *)(v3 + 24) = v4;

}

- (id)__ipv4StateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59B0], serviceID, (CFStringRef)*MEMORY[0x24BDF59F0])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__ipv4InterfaceStateConfig
{
  const __CFString *interfaceName;
  const __CFString *NetworkInterfaceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  interfaceName = (const __CFString *)self->_interfaceName;
  if (interfaceName
    && (NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59B0], interfaceName, (CFStringRef)*MEMORY[0x24BDF59F0])) != 0)
  {
    v5 = NetworkInterfaceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkInterfaceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__ipv6StateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59B0], serviceID, (CFStringRef)*MEMORY[0x24BDF59F8])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__ipv4SetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59A8], serviceID, (CFStringRef)*MEMORY[0x24BDF59F0])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__ipv6SetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59A8], serviceID, (CFStringRef)*MEMORY[0x24BDF59F8])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__dnsStateConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59B0], serviceID, (CFStringRef)*MEMORY[0x24BDF59D8])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)__dnsSetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59A8], serviceID, (CFStringRef)*MEMORY[0x24BDF59D8])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)ipv4Router
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor_ipv4Router__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor_ipv4Router__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5AF8];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5AF8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)ipv4SubnetMasks
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__WFIPMonitor_ipv4SubnetMasks__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __30__WFIPMonitor_ipv4SubnetMasks__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5B00];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B00]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)ipv4Addresses
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__WFIPMonitor_ipv4Addresses__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__WFIPMonitor_ipv4Addresses__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5AD8];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5AD8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)ipv4DHCPClientID
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__WFIPMonitor_ipv4DHCPClientID__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __31__WFIPMonitor_ipv4DHCPClientID__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv4StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5AE8];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5AE8]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)DHCPLeaseExpirationDate
{
  void *v3;
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  -[WFIPMonitor __dhcpInfo](self, "__dhcpInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    queue = self->_queue;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __38__WFIPMonitor_DHCPLeaseExpirationDate__block_invoke;
    v8[3] = &unk_24DC353A0;
    v10 = &v11;
    v9 = v3;
    dispatch_sync(queue, v8);

  }
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __38__WFIPMonitor_DHCPLeaseExpirationDate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  DHCPInfoGetLeaseExpirationTime(*(CFDictionaryRef *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)ipv6Router
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor_ipv6Router__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor_ipv6Router__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5B30];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B30]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)ipv6Addresses
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__WFIPMonitor_ipv6Addresses__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__WFIPMonitor_ipv6Addresses__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5B08];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B08]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)ipv6PrefixLengths
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__WFIPMonitor_ipv6PrefixLengths__block_invoke;
  v5[3] = &unk_24DC353A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__WFIPMonitor_ipv6PrefixLengths__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "__ipv6StateConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDF5B28];
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5B28]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v3);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (id)dnsDomainName
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8;
  v14 = __Block_byref_object_dispose__8;
  v15 = 0;
  if (-[WFIPMonitor isUsingCustomDNSSettings](self, "isUsingCustomDNSSettings"))
  {
    -[WFIPMonitor __dnsSetupConfig](self, "__dnsSetupConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A80]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __28__WFIPMonitor_dnsDomainName__block_invoke;
  v9[3] = &unk_24DC353A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __28__WFIPMonitor_dnsDomainName__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BDF5A80];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A80]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

- (id)dnsSearchDomains
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8;
  v14 = __Block_byref_object_dispose__8;
  v15 = 0;
  if (-[WFIPMonitor isUsingCustomDNSSettings](self, "isUsingCustomDNSSettings"))
  {
    -[WFIPMonitor __dnsSetupConfig](self, "__dnsSetupConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A88]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __31__WFIPMonitor_dnsSearchDomains__block_invoke;
  v9[3] = &unk_24DC353A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __31__WFIPMonitor_dnsSearchDomains__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BDF5A88];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A88]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

- (id)dnsServerAddresses
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__8;
  v14 = __Block_byref_object_dispose__8;
  v15 = 0;
  if (-[WFIPMonitor isUsingCustomDNSSettings](self, "isUsingCustomDNSSettings"))
  {
    -[WFIPMonitor __dnsSetupConfig](self, "__dnsSetupConfig");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A90]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

  }
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__WFIPMonitor_dnsServerAddresses__block_invoke;
  v9[3] = &unk_24DC353A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(queue, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __33__WFIPMonitor_dnsServerAddresses__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "__dnsStateConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x24BDF5A90];
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDF5A90]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v3);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

    }
  }
}

- (BOOL)isUsingCustomDNSSettings
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__WFIPMonitor_isUsingCustomDNSSettings__block_invoke;
  v5[3] = &unk_24DC352E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__WFIPMonitor_isUsingCustomDNSSettings__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "__dnsSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (id)httpProxyServer
{
  void *v2;
  void *v3;
  void *v4;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF5B90]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)httpProxyPort
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF5B88]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v2 = v4;
      v4 = v2;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "integerValue"));
        v2 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v2 = 0;
      }
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = v2;

  return v5;
}

- (BOOL)httpProxyIsAuthenticated
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("HTTPProxyAuthenticated"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)httpProxyUsername
{
  void *v2;
  void *v3;
  void *v4;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("HTTPProxyUsername"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)httpProxyAutoConfigured
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2
    && (objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF5BB0]),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    v6 = objc_msgSend(v4, "BOOLValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)httpProxyAutoConfigURL
{
  void *v2;
  void *v3;
  void *v4;

  -[WFIPMonitor __proxiesSetupConfig](self, "__proxiesSetupConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", *MEMORY[0x24BDF5BB8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)__proxiesSetupConfig
{
  const __CFString *serviceID;
  const __CFString *NetworkServiceEntity;
  const __CFString *v5;
  void *v6;
  const void *v7;
  void *v8;

  serviceID = (const __CFString *)self->_serviceID;
  if (serviceID
    && (NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFStringRef)*MEMORY[0x24BDF59A8], serviceID, (CFStringRef)*MEMORY[0x24BDF5A28])) != 0)
  {
    v5 = NetworkServiceEntity;
    v6 = (void *)SCDynamicStoreCopyValue(self->_storeRef, NetworkServiceEntity);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(v6, "copy");
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)isUsingCustomProxySetting
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__WFIPMonitor_isUsingCustomProxySetting__block_invoke;
  v5[3] = &unk_24DC352E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __40__WFIPMonitor_isUsingCustomProxySetting__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "__proxiesSetupConfig");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    +[WFSettingsProxy defaultProxyConfiguration](WFSettingsProxy, "defaultProxyConfiguration");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToDictionary:", v2);

    if (v3)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (BOOL)globalProxyIsEnabled
{
  const __CFString *v2;
  CFPropertyListRef v3;
  const void *v4;
  BOOL v5;

  v2 = (const __CFString *)*MEMORY[0x24BDF5A28];
  v3 = CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x24BDF5A28], CFSTR("com.apple.SystemConfiguration"));
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFPreferencesAppValueIsForced(v2, CFSTR("com.apple.SystemConfiguration")) != 0;
  CFRelease(v4);
  return v5;
}

- (id)__dhcpInfo
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__8;
  v10 = __Block_byref_object_dispose__8;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __25__WFIPMonitor___dhcpInfo__block_invoke;
  v5[3] = &unk_24DC352E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __25__WFIPMonitor___dhcpInfo__block_invoke(uint64_t a1)
{
  const __SCDynamicStore *v2;
  __CFString *v3;
  CFDictionaryRef v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (const __SCDynamicStore *)objc_msgSend(*(id *)(a1 + 32), "storeRef");
  objc_msgSend(*(id *)(a1 + 32), "serviceID");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = SCDynamicStoreCopyDHCPInfo(v2, v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    CFRelease(v4);
  }
}

- (BOOL)personalHotspotHasClients
{
  void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  BOOL v13;

  v2 = (void *)SCDynamicStoreCopyValue(self->_storeRef, CFSTR("com.apple.MobileInternetSharing"));
  if (!v2)
    return 0;
  v3 = v2;
  objc_msgSend(v2, "objectForKey:", CFSTR("Hosts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "objectForKey:", CFSTR("Type")), (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "objectForKey:", CFSTR("AirPort"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "intValue");
    else
      v10 = 0;
    objc_msgSend(v7, "objectForKey:", CFSTR("Bluetooth"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
      v10 += objc_msgSend(v11, "intValue");
    v13 = v10 != 0;

  }
  else
  {
    v13 = 0;
  }
  CFRelease(v3);

  return v13;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (__SCDynamicStore)storeRef
{
  return self->_storeRef;
}

- (void)setStoreRef:(__SCDynamicStore *)a3
{
  self->_storeRef = a3;
}

- (__SCPreferences)prefsRef
{
  return self->_prefsRef;
}

- (void)setPrefsRef:(__SCPreferences *)a3
{
  self->_prefsRef = a3;
}

- (__SCDynamicStore)networkServiceStore
{
  return self->_networkServiceStore;
}

- (void)setNetworkServiceStore:(__SCDynamicStore *)a3
{
  self->_networkServiceStore = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_dynamicStoreInfo, 0);
}

@end
