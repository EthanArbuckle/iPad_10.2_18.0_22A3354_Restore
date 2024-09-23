@implementation PTPRemoteCameraDeviceManager

- (PTPRemoteCameraDeviceManager)init
{
  PTPRemoteCameraDeviceManager *v2;
  PTPRemoteCameraDeviceManager *v3;
  IONotificationPortRef *p_notifyPort;
  __CFRunLoop *Main;
  __CFRunLoopSource *RunLoopSource;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PTPRemoteCameraDeviceManager;
  v2 = -[ICRemoteCameraDeviceManager initManaging:systemDaemon:](&v8, "initManaging:systemDaemon:", CFSTR("PTPCameraDevice"), 1);
  v3 = v2;
  if (v2)
  {
    p_notifyPort = &v2->_deviceMatchingInfo.notifyPort;
    v2->_deviceMatchingInfo.notifyPort = 0;
    *(_QWORD *)&v2->_deviceMatchingInfo.ptpNotifyIterator = 0;
    v2->_deviceMatchingInfo.notifyPort = IONotificationPortCreate(kIOMainPortDefault);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(*p_notifyPort);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PTPRemoteCameraDeviceManager;
  -[ICRemoteCameraDeviceManager dealloc](&v2, "dealloc");
}

- (BOOL)startUSBPTPInterfaceNotifications
{
  PTPDeviceMatchingInfo *p_deviceMatchingInfo;
  BOOL v3;
  CFMutableDictionaryRef v5;
  __CFDictionary *v6;
  kern_return_t v7;
  __CFDictionary *v8;
  io_object_t v9;
  io_object_t ptpDeathIterator;
  io_object_t ptpNotifyIterator;
  io_iterator_t v12;
  io_iterator_t notification[2];

  p_deviceMatchingInfo = &self->_deviceMatchingInfo;
  if (self->_deviceMatchingInfo.ptpNotifyIterator)
    return 1;
  *(_QWORD *)notification = 0;
  v5 = IOServiceMatching("IOUSBInterface");
  if (!v5)
    return 0;
  v6 = v5;
  -[__CFDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100050FE0, CFSTR("bInterfaceClass"));
  -[__CFDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100050FF8, CFSTR("bInterfaceSubClass"));
  -[__CFDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &off_100050FF8, CFSTR("bInterfaceProtocol"));
  v7 = IOServiceAddMatchingNotification(p_deviceMatchingInfo->notifyPort, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)sub_100026680, self, &notification[1]);

  if (v7)
  {
    v3 = 0;
    v8 = 0;
  }
  else
  {
    v8 = IOServiceMatching("IOUSBInterface");
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_100050FE0, CFSTR("bInterfaceClass"));
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_100050FF8, CFSTR("bInterfaceSubClass"));
    -[__CFDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", &off_100050FF8, CFSTR("bInterfaceProtocol"));
    if (IOServiceAddMatchingNotification(p_deviceMatchingInfo->notifyPort, "IOServiceTerminate", v8, (IOServiceMatchingCallback)sub_100026858, self, notification))
    {
      v3 = 0;
    }
    else
    {
      while (1)
      {
        v9 = IOIteratorNext(notification[0]);
        if (!v9)
          break;
        IOObjectRelease(v9);
      }
      ptpDeathIterator = p_deviceMatchingInfo->ptpDeathIterator;
      if (ptpDeathIterator)
        IOObjectRelease(ptpDeathIterator);
      p_deviceMatchingInfo->ptpDeathIterator = notification[0];
      ptpNotifyIterator = p_deviceMatchingInfo->ptpNotifyIterator;
      if (ptpNotifyIterator)
        IOObjectRelease(ptpNotifyIterator);
      v12 = notification[1];
      p_deviceMatchingInfo->ptpNotifyIterator = notification[1];
      sub_100026680(self, v12);
      -[PTPRemoteCameraDeviceManager immediateMatch](self, "immediateMatch");
      v3 = 1;
    }
  }

  return v3;
}

- (void)immediateMatch
{
  const __CFDictionary *v3;
  uint64_t MatchingServices;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  id v12;
  io_object_t v13;
  io_registry_entry_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  CFMutableDictionaryRef v25;
  uint64_t v26;
  void *v27;
  void *v28;
  CFMutableDictionaryRef properties;
  io_registry_entry_t parent;
  io_iterator_t existing;
  _BYTE buf[12];
  __int16 v33;
  void *v34;

  existing = 0;
  v3 = IOServiceMatching("IOUSBInterface");
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    v5 = MatchingServices;
    __ICOSLogCreate();
    v6 = CFSTR("usb");
    if ((unint64_t)objc_msgSend(CFSTR("usb"), "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("usb"), "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOServiceGetMatchingServices returned: %x"), v5));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v6);
      v11 = v9;
      v12 = -[__CFString UTF8String](v10, "UTF8String");
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = v12;
      v33 = 2114;
      v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  else
  {
    v13 = IOIteratorNext(existing);
    if (v13)
    {
      v14 = v13;
      do
      {
        *(_QWORD *)buf = 0;
        if (!IORegistryEntryCreateCFProperties(v14, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0))
        {
          v15 = *(void **)buf;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)buf, "objectForKey:", CFSTR("bInterfaceClass")));
          v17 = objc_msgSend(v16, "unsignedCharValue");

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("bInterfaceSubClass")));
          v19 = objc_msgSend(v18, "unsignedCharValue");

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("bInterfaceProtocol")));
          v21 = objc_msgSend(v20, "unsignedCharValue");

          if (v17 == 6 && v19 == 1 && v21 == 1)
          {
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("locationID")));
            parent = 0;
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "UUIDString"));

            if (!IORegistryEntryGetParentEntry(v14, "IOService", &parent))
            {
              if (parent)
              {
                properties = 0;
                if (!IORegistryEntryCreateCFProperties(parent, &properties, kCFAllocatorDefault, 0))
                {
                  v25 = properties;
                  v26 = objc_claimAutoreleasedReturnValue(-[PTPRemoteCameraDeviceManager uuidStringForDeviceProperties:](self, "uuidStringForDeviceProperties:", properties));

                  v24 = (void *)v26;
                }
              }
            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v22, "unsignedIntegerValue")));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("LOC:%lu"), objc_msgSend(v22, "unsignedIntegerValue")));
            -[ICRemoteCameraDeviceManager notifyClientDeviceAdded:uuidString:deviceName:](self, "notifyClientDeviceAdded:uuidString:deviceName:", v27, v24, v28);

          }
        }
        IOObjectRelease(v14);
        v14 = IOIteratorNext(existing);
      }
      while (v14);
    }
    IOObjectRelease(existing);
  }
}

- (id)uuidStringForDeviceProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  UInt8 byte15;
  UInt8 v14;
  UInt8 v15;
  UInt8 v16;
  UInt8 v17;
  UInt8 v18;
  UInt8 v19;
  UInt8 v20;
  UInt8 byte7;
  UInt8 v22;
  UInt8 v23;
  UInt8 v24;
  UInt8 v25;
  UInt8 v26;
  UInt8 v27;
  UInt8 v28;
  int v29;
  const __CFUUID *v30;
  const __CFUUID *v31;
  const __CFUUID *v32;
  const __CFUUID *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v44;
  UInt8 byte6[8];
  uint64_t v46;
  _QWORD __src[2];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("USB Serial Number")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("idVendor")));
  v6 = objc_msgSend(v5, "unsignedShortValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("idProduct")));
  v8 = objc_msgSend(v7, "unsignedShortValue");

  if (objc_msgSend(v4, "length") == (id)24 && (_DWORD)v6 == 1452)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 0, 8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", 9));
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v9, v10));

    v4 = (void *)v11;
  }
  if (!v4)
  {
    v32 = CFUUIDCreateWithBytes(kCFAllocatorDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, BYTE1(v6), (UInt8)v6, BYTE1(v8), (UInt8)v8);
    if (v32)
    {
      v33 = v32;
      v12 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v32);
      CFRelease(v33);
    }
    else
    {
      v12 = 0;
    }
    __ICOSLogCreate();
    v34 = CFSTR("UUID Gen");
    if ((unint64_t)objc_msgSend(CFSTR("UUID Gen"), "length") >= 0x15)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("UUID Gen"), "substringWithRange:", 0, 18));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR("..")));

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Device Serial Missing: %d/%d, Setting: %@"), v6, v8, v12));
    v37 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FDB8(v34, v37);

LABEL_22:
    if (v12)
      goto LABEL_28;
    goto LABEL_23;
  }
  __src[0] = 0;
  __src[1] = 0;
  v44 = 0;
  v12 = 0;
  if (!objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", __src, 16, &v44, objc_msgSend(v4, "smallestEncoding"), 1, 0, objc_msgSend(v4, "length"), 0))goto LABEL_22;
  byte15 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  byte7 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = 0;
  *(_QWORD *)byte6 = 0;
  v46 = 0;
  if (v44 >= 0x10)
    v29 = 0;
  else
    v29 = 16 - v44;
  if (v29 <= 15)
  {
    memcpy(&byte6[v29], __src, (15 - v29) + 1);
    v28 = byte6[0];
    v27 = byte6[1];
    v26 = byte6[2];
    v25 = byte6[3];
    v24 = byte6[4];
    v23 = byte6[5];
    v22 = byte6[6];
    byte7 = byte6[7];
    v20 = v46;
    v19 = BYTE1(v46);
    v18 = BYTE2(v46);
    v17 = BYTE3(v46);
    v16 = BYTE4(v46);
    v15 = BYTE5(v46);
    v14 = BYTE6(v46);
    byte15 = HIBYTE(v46);
  }
  v30 = CFUUIDCreateWithBytes(kCFAllocatorDefault, v28, v27, v26, v25, v24, v23, v22, byte7, v20, v19, v18, v17, v16, v15, v14, byte15);
  if (!v30 || (v31 = v30, v12 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v30), CFRelease(v31), !v12))
  {
LABEL_23:
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "UUIDString"));

    __ICOSLogCreate();
    v39 = CFSTR("UUID Gen");
    if ((unint64_t)objc_msgSend(CFSTR("UUID Gen"), "length") >= 0x15)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("UUID Gen"), "substringWithRange:", 0, 18));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringByAppendingString:", CFSTR("..")));

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("UUID Generation failed: %@/%d/%d, Setting: %@"), v4, v6, v8, v12));
    v42 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FDB8(v39, v42);

  }
LABEL_28:

  return v12;
}

@end
