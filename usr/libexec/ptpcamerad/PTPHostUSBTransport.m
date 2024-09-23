@implementation PTPHostUSBTransport

- (PTPHostUSBTransport)initWithLocationID:(unsigned int)a3 delegate:(id)a4
{
  id v6;
  PTPHostUSBTransport *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *machRecvSemaphore;
  NSMutableData *v10;
  NSMutableData *eventData;
  NSMutableDictionary *v12;
  NSMutableDictionary *transactions;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *transportQueue;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTPHostUSBTransport;
  v7 = -[PTPHostUSBTransport init](&v19, "init");
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    machRecvSemaphore = v7->_machRecvSemaphore;
    v7->_machRecvSemaphore = (OS_dispatch_semaphore *)v8;

    v7->_type = 2;
    objc_storeWeak(&v7->_delegate, v6);
    v7->_locationID = a3;
    v10 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithCapacity:", 0);
    eventData = v7->_eventData;
    v7->_eventData = v10;

    v7->_eventDataBufferSize = 196608;
    v7->_writeBufferSize = 12582912;
    v7->_writeBuffer = (char *)malloc_type_malloc(0xC00000uLL, 0x18E2CD6DuLL);
    v7->_eventDataBuffer = (char *)malloc_type_malloc(v7->_eventDataBufferSize, 0x97B6AB72uLL);
    v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    transactions = v7->_transactions;
    v7->_transactions = v12;

    v14 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = dispatch_queue_create("PTPHostUSBTransportQueue", v15);
    transportQueue = v7->_transportQueue;
    v7->_transportQueue = (OS_dispatch_queue *)v16;

  }
  return v7;
}

- (void)dealloc
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  char *writeBuffer;
  char *eventDataBuffer;
  OS_dispatch_semaphore *machRecvSemaphore;
  dispatch_time_t v12;
  objc_super v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  __ICOSLogCreate();
  v3 = CFSTR("PTPTransport");
  if ((unint64_t)objc_msgSend(CFSTR("PTPTransport"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPTransport"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "dealloc locID", -[PTPHostUSBTransport locationID](self, "locationID")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v15 = -[__CFString UTF8String](v7, "UTF8String");
    v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_storeWeak(&self->_delegate, 0);
  writeBuffer = self->_writeBuffer;
  if (writeBuffer)
    free(writeBuffer);
  self->_writeBuffer = 0;
  eventDataBuffer = self->_eventDataBuffer;
  if (eventDataBuffer)
    free(eventDataBuffer);
  self->_eventDataBuffer = 0;
  machRecvSemaphore = self->_machRecvSemaphore;
  v12 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait((dispatch_semaphore_t)machRecvSemaphore, v12);
  v13.receiver = self;
  v13.super_class = (Class)PTPHostUSBTransport;
  -[PTPHostUSBTransport dealloc](&v13, "dealloc");
}

- (BOOL)startInitiator
{
  PTPHostUSBTransport *v2;
  BOOL v3;
  __CFDictionary *v4;
  void *v5;
  void *v6;
  io_object_t v7;
  io_registry_entry_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned int v15;
  void *v17;
  void *v18;
  CFMutableDictionaryRef v19;
  void *v20;
  const __CFUUID *v21;
  const __CFUUID *v22;
  uint64_t v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  NSObject *v30;
  id v31;
  CFMutableDictionaryRef v32;
  void (*v33)(CFMutableDictionaryRef, _QWORD, _QWORD, IOUSBInterfaceStruct942 ***);
  const __CFUUID *v34;
  CFUUIDBytes v35;
  IOUSBInterfaceStruct942 ***p_interfaceInterfaceRef;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  unsigned __int8 v38;
  int v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  NSObject *v46;
  id v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  __CFString *v52;
  NSObject *v53;
  id v54;
  uint64_t v55;
  __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  __CFString *v64;
  NSObject *v65;
  id v66;
  __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  __CFString *v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  id v77;
  int v78;
  __CFString *v79;
  void *v80;
  void *v81;
  void *v82;
  __CFString *v83;
  NSObject *v84;
  id v85;
  __CFString *v86;
  void *v87;
  void *v88;
  void *v89;
  __CFString *v90;
  NSObject *v91;
  id v92;
  uint64_t v93;
  void *v94;
  __CFString *v95;
  void *v96;
  void *v97;
  void *v98;
  __CFString *v99;
  NSObject *v100;
  id v101;
  IONotificationPort *v102;
  __CFDictionary *v103;
  PTPHostUSBTransport *v104;
  unsigned __int16 v105;
  char v106;
  __int16 v107;
  char v108;
  unsigned __int8 v109;
  CFMutableDictionaryRef v110;
  io_registry_entry_t parent;
  io_iterator_t existing;
  _BYTE properties[12];
  __int16 v114;
  void *v115;

  v2 = self;
  if (self->_role)
  {
    v3 = 0;
    goto LABEL_14;
  }
  existing = 0;
  v4 = IOServiceMatching("IOUSBInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v2->_locationID));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", v5, CFSTR("locationID")));
  -[__CFDictionary setObject:forKey:](v4, "setObject:forKey:", v6, CFSTR("IOPropertyMatch"));

  v3 = 0;
  if (IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing))
    goto LABEL_13;
  v103 = v4;
  v104 = v2;
  v7 = IOIteratorNext(existing);
  if (!v7)
  {
LABEL_12:
    IOObjectRelease(existing);
    v3 = 0;
    goto LABEL_13;
  }
  v8 = v7;
  while (1)
  {
    *(_QWORD *)properties = 0;
    if (!IORegistryEntryCreateCFProperties(v8, (CFMutableDictionaryRef *)properties, kCFAllocatorDefault, 0))
      break;
LABEL_11:
    IOObjectRelease(v8);
    v8 = IOIteratorNext(existing);
    if (!v8)
      goto LABEL_12;
  }
  v9 = *(void **)properties;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)properties, "objectForKey:", CFSTR("bInterfaceClass")));
  v11 = objc_msgSend(v10, "unsignedCharValue");

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("bInterfaceSubClass")));
  v13 = objc_msgSend(v12, "unsignedCharValue");

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("bInterfaceProtocol")));
  v15 = objc_msgSend(v14, "unsignedCharValue");

  if (v11 != 6 || v13 != 1 || v15 != 1)
  {

    goto LABEL_11;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("idVendor")));
  -[PTPHostUSBTransport setVendorID:](v2, "setVendorID:", objc_msgSend(v17, "unsignedShortValue"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("idProduct")));
  -[PTPHostUSBTransport setProductID:](v2, "setProductID:", objc_msgSend(v18, "unsignedShortValue"));

  parent = 0;
  if (!IORegistryEntryGetParentEntry(v8, "IOService", &parent))
  {
    if (parent)
    {
      v110 = 0;
      if (!IORegistryEntryCreateCFProperties(parent, &v110, kCFAllocatorDefault, 0))
      {
        v19 = v110;
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKey:](v110, "objectForKey:", CFSTR("USB Serial Number")));
        -[PTPHostUSBTransport setUsbSerialNumberString:](v2, "setUsbSerialNumberString:", v20);

      }
    }
  }

  IOObjectRelease(existing);
  v110 = 0;
  parent = 0;
  v21 = CFUUIDGetConstantUUIDWithBytes(0, 0x2Du, 0x97u, 0x86u, 0xC6u, 0x9Eu, 0xF3u, 0x11u, 0xD4u, 0xADu, 0x51u, 0, 0xAu, 0x27u, 5u, 0x28u, 0x61u);
  v22 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v23 = IOCreatePlugInInterfaceForService(v8, v21, v22, (IOCFPlugInInterface ***)&v110, (SInt32 *)&parent);
  if (!(_DWORD)v23)
  {
    v32 = v110;
    v33 = *(void (**)(CFMutableDictionaryRef, _QWORD, _QWORD, IOUSBInterfaceStruct942 ***))(*(_QWORD *)v110 + 8);
    v34 = CFUUIDGetConstantUUIDWithBytes(0, 0xBCu, 0xEAu, 0xADu, 0xDCu, 0x88u, 0x4Du, 0x4Fu, 0x27u, 0x83u, 0x40u, 0x36u, 0xD6u, 0x9Fu, 0xABu, 0x90u, 0xF6u);
    v35 = CFUUIDGetUUIDBytes(v34);
    p_interfaceInterfaceRef = &v2->_interfaceInterfaceRef;
    v33(v32, *(_QWORD *)&v35.byte0, *(_QWORD *)&v35.byte8, &v2->_interfaceInterfaceRef);
    IODestroyPlugInInterface((IOCFPlugInInterface **)v110);
    interfaceInterfaceRef = v2->_interfaceInterfaceRef;
    if (!interfaceInterfaceRef
      || ((unsigned int (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->USBInterfaceOpen)(interfaceInterfaceRef))
    {
      goto LABEL_25;
    }
    v109 = 0;
    if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(**p_interfaceInterfaceRef)->GetNumEndpoints)(*p_interfaceInterfaceRef, &v109))
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(**p_interfaceInterfaceRef)->USBInterfaceClose)(*p_interfaceInterfaceRef);
      goto LABEL_25;
    }
    v108 = 0;
    v107 = 0;
    v106 = 0;
    v105 = 0;
    if (!v109)
    {
LABEL_84:
      v2 = v104;
      if (((unsigned int (*)(IOUSBInterfaceStruct942 **, unsigned int *))(*v104->_interfaceInterfaceRef)->CreateInterfaceAsyncPort)(v104->_interfaceInterfaceRef, &v104->_asyncPort))
      {
        goto LABEL_90;
      }
      __ICOSLogCreate();
      v95 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v95 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "stringByAppendingString:", CFSTR("..")));

      }
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Interface Installed: %s"), "YES"));
      v98 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v99 = objc_retainAutorelease(v95);
        v100 = v98;
        v101 = -[__CFString UTF8String](v99, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v101;
        v114 = 2114;
        v115 = v97;
        _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      v102 = (IONotificationPort *)((uint64_t (*)(IOUSBInterfaceStruct942 **))(*v104->_interfaceInterfaceRef)->GetEndpointPropertiesV3)(v104->_interfaceInterfaceRef);
      v104->_notificationPort = v102;
      IONotificationPortSetDispatchQueue(v102, (dispatch_queue_t)v104->_transportQueue);
      if (-[PTPHostUSBTransport readInterruptData](v104, "readInterruptData"))
      {
LABEL_90:
        ((void (*)(IOUSBInterfaceStruct942 **))(**p_interfaceInterfaceRef)->USBInterfaceClose)(*p_interfaceInterfaceRef);
        v3 = 0;
      }
      else
      {
        v104->_role = 2;
        v3 = 1;
      }
      v4 = v103;
      goto LABEL_26;
    }
    v38 = 0;
    while (((unsigned int (*)(IOUSBInterfaceStruct942 **, _QWORD, char *, char *, __int16 *, unsigned __int16 *, char *))(**p_interfaceInterfaceRef)->GetPipeProperties)(*p_interfaceInterfaceRef, ++v38, &v108, (char *)&v107 + 1, &v107, &v105, &v106))
    {
LABEL_67:
      if (v109 <= v38)
        goto LABEL_84;
    }
    if (v108 == 1 && v107 == 2)
    {
      v104->_bulkPipeIn = v38;
      v104->_maxPacketSizeBulkIn = v105;
      __ICOSLogCreate();
      v60 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v60 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "stringByAppendingString:", CFSTR("..")));

      }
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeBulkIn: %d"), v104->_maxPacketSizeBulkIn));
      v63 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v64 = objc_retainAutorelease(v60);
        v65 = v63;
        v66 = -[__CFString UTF8String](v64, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v66;
        v114 = 2114;
        v115 = v62;
        _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      if (((unsigned int (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v104->_bulkPipeIn) != -536854449)goto LABEL_67;
      __ICOSLogCreate();
      v67 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v67 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringByAppendingString:", CFSTR("..")));

      }
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bulk In Clearing Pipe Stall")));
      v70 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v71 = objc_retainAutorelease(v67);
        v72 = v70;
        v73 = -[__CFString UTF8String](v71, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v73;
        v114 = 2114;
        v115 = v69;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      v74 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_bulkPipeIn);
      __ICOSLogCreate();
      v56 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "stringByAppendingString:", CFSTR("..")));

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bulk In Clear Reported: %0x"), v74));
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_66;
    }
    else if (v108 || v107 != 2)
    {
      if (v108 != 1 || v107 != 3)
        goto LABEL_67;
      v104->_interruptPipeIn = v38;
      v104->_maxPacketSizeInterruptIn = v105;
      v78 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v38);
      __ICOSLogCreate();
      v79 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v79 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "stringByAppendingString:", CFSTR("..")));

      }
      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeInterruptIn: %d"), v104->_maxPacketSizeInterruptIn));
      v82 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v83 = objc_retainAutorelease(v79);
        v84 = v82;
        v85 = -[__CFString UTF8String](v83, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v85;
        v114 = 2114;
        v115 = v81;
        _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      if (v78 != -536854449)
        goto LABEL_67;
      __ICOSLogCreate();
      v86 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v86 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "stringByAppendingString:", CFSTR("..")));

      }
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Interrupt Clearing Pipe Stall")));
      v89 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v90 = objc_retainAutorelease(v86);
        v91 = v89;
        v92 = -[__CFString UTF8String](v90, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v92;
        v114 = 2114;
        v115 = v88;
        _os_log_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      v93 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_interruptPipeIn);
      __ICOSLogCreate();
      v56 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "stringByAppendingString:", CFSTR("..")));

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Interrupt Clear Reported: %0x"), v93));
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_66;
    }
    else
    {
      v104->_bulkPipeOut = v38;
      v104->_maxPacketSizeBulkOut = v105;
      v40 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->GetPipeStatus)(v104->_interfaceInterfaceRef, v38);
      __ICOSLogCreate();
      v41 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByAppendingString:", CFSTR("..")));

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_maxPacketSizeBulkOut: %d"), v104->_maxPacketSizeBulkOut));
      v44 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_retainAutorelease(v41);
        v46 = v44;
        v47 = -[__CFString UTF8String](v45, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v47;
        v114 = 2114;
        v115 = v43;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      if (v40 != -536854449)
        goto LABEL_67;
      __ICOSLogCreate();
      v48 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "stringByAppendingString:", CFSTR("..")));

      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bulk Out Clearing Pipe Stall")));
      v51 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v52 = objc_retainAutorelease(v48);
        v53 = v51;
        v54 = -[__CFString UTF8String](v52, "UTF8String");
        *(_DWORD *)properties = 136446466;
        *(_QWORD *)&properties[4] = v54;
        v114 = 2114;
        v115 = v50;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

      }
      v55 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD))(*v104->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(v104->_interfaceInterfaceRef, v104->_bulkPipeOut);
      __ICOSLogCreate();
      v56 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "stringByAppendingString:", CFSTR("..")));

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Bulk In Clear Reported: %0x"), v55));
      v59 = (void *)_gICOSLog;
      if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_66;
    }
    v56 = objc_retainAutorelease(v56);
    v76 = v59;
    v77 = -[__CFString UTF8String](v56, "UTF8String");
    *(_DWORD *)properties = 136446466;
    *(_QWORD *)&properties[4] = v77;
    v114 = 2114;
    v115 = v58;
    _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

LABEL_66:
    goto LABEL_67;
  }
  v24 = v23;
  __ICOSLogCreate();
  v25 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR("..")));

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IOCreatePlugInInterfaceForService returned: %d [0x%x]\n"), v24, v24));
  v28 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v29 = objc_retainAutorelease(v25);
    v30 = v28;
    v31 = -[__CFString UTF8String](v29, "UTF8String");
    *(_DWORD *)properties = 136446466;
    *(_QWORD *)&properties[4] = v31;
    v114 = 2114;
    v115 = v27;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", properties, 0x16u);

  }
LABEL_25:
  v3 = 0;
LABEL_26:
  IOObjectRelease(v8);
LABEL_13:

LABEL_14:
  v2->_connected = v3;
  return v3;
}

- (void)stop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  IONotificationPort *notificationPort;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  __ICOSLogCreate();
  v3 = CFSTR("PTPTransport");
  if ((unint64_t)objc_msgSend(CFSTR("PTPTransport"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPTransport"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "stopping locID", -[PTPHostUSBTransport locationID](self, "locationID")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v12 = -[__CFString UTF8String](v7, "UTF8String");
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (self->_role == 2)
  {
    if (self->_bulkPipeIn)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      self->_bulkPipeIn = 0;
    }
    if (self->_bulkPipeOut)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      self->_bulkPipeOut = 0;
    }
    if (self->_interruptPipeIn)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
      ((void (*)(IOUSBInterfaceStruct942 **, _QWORD))(*self->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(self->_interfaceInterfaceRef, self->_interruptPipeIn);
      self->_interruptPipeIn = 0;
    }
    notificationPort = self->_notificationPort;
    if (notificationPort)
    {
      IONotificationPortSetDispatchQueue(notificationPort, 0);
      self->_notificationPort = 0;
    }
    interfaceInterfaceRef = self->_interfaceInterfaceRef;
    if (interfaceInterfaceRef)
    {
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->USBInterfaceClose)(interfaceInterfaceRef);
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->Release)(self->_interfaceInterfaceRef);
      self->_interfaceInterfaceRef = 0;
    }
    self->_role = 0;
    self->_connected = 0;
  }
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<PTPHostUSBTransport %p>\n  {\n    _locationID = %lu\n  }"), self, self->_locationID);
}

- (BOOL)sendCancel:(id)a3
{
  return 0;
}

- (id)sendTransaction:(id)a3 timeout:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[PTPHostUSBTransport addTransaction:](self, "addTransaction:", v6);
  v7 = objc_autoreleasePoolPush();
  if (self->_connected)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestPacket"));
    v9 = -[PTPHostUSBTransport sendRequest:](self, "sendRequest:", v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txDataPacket"));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txDataPacket"));
        -[PTPHostUSBTransport sendData:](self, "sendData:", v11);

      }
      -[PTPHostUSBTransport readResponseData:withTimeout:](self, "readResponseData:withTimeout:", v6, v4);
    }
  }
  objc_autoreleasePoolPop(v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txID"));
  -[PTPHostUSBTransport removeTransaction:](self, "removeTransaction:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "responsePacket"));
  return v13;
}

- (BOOL)sendRequest:(id)a3
{
  PTPHostUSBTransport *v3;
  void *v4;

  v3 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "contentForUSBUsingBuffer:capacity:", self->_writeBuffer, self->_writeBufferSize));
  LOBYTE(v3) = -[PTPHostUSBTransport writeBulkData:](v3, "writeBulkData:", v4);

  return (char)v3;
}

- (void)sendData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id *p_delegate;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = objc_autoreleasePoolPush();
  if (self->_connected && !self->_busy)
  {
    objc_msgSend(v13, "range");
    v6 = v5;
    objc_msgSend(v13, "setBytesTransferred:", 0);
    if (v6)
    {
      self->_busy = 1;
      -[PTPHostUSBTransport performSelector:withObject:](self, "performSelector:withObject:", "sendDataPackets:", v13);
    }
    else
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained(p_delegate);
      if (WeakRetained)
      {
        v9 = WeakRetained;
        v10 = objc_loadWeakRetained(p_delegate);
        v11 = objc_opt_respondsToSelector(v10, "sentData:");

        if ((v11 & 1) != 0)
        {
          v12 = objc_loadWeakRetained(p_delegate);
          objc_msgSend(v12, "performSelector:withObject:", "sentData:", v13);

        }
      }
    }
  }
  objc_autoreleasePoolPop(v4);

}

- (BOOL)sendEvent:(id)a3
{
  return 0;
}

- (void)cancelTransaction:(id)a3
{
  self->_canceledTransactionID = objc_msgSend(a3, "transactionID");
}

- (void)sendDataPackets:(id)a3
{
  id v4;
  unsigned int v5;
  PTPWrappedBytes *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  id v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  id v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  NSObject *v33;
  id v34;
  id WeakRetained;
  void *v36;
  id v37;
  char v38;
  id v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  __CFString *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;

  v4 = a3;
  v5 = objc_msgSend(v4, "transactionID");
  v6 = -[PTPWrappedBytes initWithBytes:capacity:]([PTPWrappedBytes alloc], "initWithBytes:capacity:", self->_writeBuffer, self->_writeBufferSize);
  objc_msgSend(v4, "range");
  if (self->_connected)
  {
    v8 = v7;
    v9 = 0;
    v47 = v7;
    while (1)
    {
      if (v5 && v5 == self->_canceledTransactionID)
        goto LABEL_31;
      v10 = objc_msgSend(v4, "copyToWrappedBytes:forTransport:", v6, 2);
      v11 = -[PTPWrappedBytes length](v6, "length");
      if (v11 != (id)self->_writeBufferSize)
        break;
      if (-[PTPHostUSBTransport writeBulkData:](self, "writeBulkData:", v6))
      {
        v9 += (uint64_t)v10;
        __ICOSLogCreate();
        if (__ICLogTypeEnabled(4))
        {
          v12 = CFSTR("HostUSB");
          if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
            v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sendDataPackets (full) - %8lld of %8lld bytes sent\n"), v9, v8));
          v15 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v16 = objc_retainAutorelease(v12);
            v17 = v15;
            v18 = v16;
            v8 = v47;
            v19 = -[__CFString UTF8String](v18, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v49 = v19;
            v50 = 2114;
            v51 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
        }
        if (self->_connected)
          continue;
      }
      goto LABEL_31;
    }
    v20 = (uint64_t)v11;
    if (v11)
    {
      if (!-[PTPHostUSBTransport writeBulkData:](self, "writeBulkData:", v6))
        goto LABEL_31;
      v9 += (uint64_t)v10;
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        v21 = CFSTR("HostUSB");
        if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sendDataPackets (short) - %8lld of %8lld bytes sent\n"), v9, v8));
        v24 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_retainAutorelease(v21);
          v26 = v24;
          v27 = -[__CFString UTF8String](v25, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v49 = v27;
          v50 = 2114;
          v51 = v23;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        v8 = v47;
      }
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v28 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("bytesCopied: %8lld, _maxPacketSizeBulkOut: %8d\n"), v10, self->_maxPacketSizeBulkOut));
      v31 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_retainAutorelease(v28);
        v33 = v31;
        v34 = -[__CFString UTF8String](v32, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v49 = v34;
        v50 = 2114;
        v51 = v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    if (v20 % self->_maxPacketSizeBulkOut)
    {
LABEL_30:
      objc_msgSend(v4, "setBytesTransferred:", v9);
      goto LABEL_31;
    }
    -[PTPWrappedBytes setLength:](v6, "setLength:", 0);
    if (-[PTPHostUSBTransport writeBulkData:](self, "writeBulkData:", v6))
    {
      __ICOSLogCreate();
      if (__ICLogTypeEnabled(4))
      {
        v40 = CFSTR("HostUSB");
        if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringByAppendingString:", CFSTR("..")));

        }
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sendDataPackets (zero) - %8lld of %8lld bytes sent\n"), v9, v8));
        v43 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v44 = objc_retainAutorelease(v40);
          v45 = v43;
          v46 = -[__CFString UTF8String](v44, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v49 = v46;
          v50 = 2114;
          v51 = v42;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
      }
      goto LABEL_30;
    }
  }
LABEL_31:
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v36 = WeakRetained;
    v37 = objc_loadWeakRetained(&self->_delegate);
    v38 = objc_opt_respondsToSelector(v37, "sentData:");

    if ((v38 & 1) != 0)
    {
      v39 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v39, "performSelector:withObject:", "sentData:", v4);

    }
  }
  self->_busy = 0;

}

- (unsigned)deviceStatus
{
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  unsigned __int8 v19;
  int v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  v21 = 0;
  v22 = 0;
  v23 = 0;
  v20 = 0;
  v19 = 0;
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v19);
  LOWORD(v21) = 26529;
  WORD2(v21) = v19;
  HIWORD(v21) = 4;
  v22 = &v20;
  v3 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, uint64_t *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, &v21);
  __ICOSLogCreate();
  v4 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", CFSTR("..")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-> ControlRequest(): 0x%08x"), v3));
  v7 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v4);
    v9 = v7;
    v10 = -[__CFString UTF8String](v8, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v25 = v10;
    v26 = 2114;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (!(_DWORD)v3)
  {
    __ICOSLogCreate();
    v11 = CFSTR("HostUSB");
    if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<- Data size: %d"), HIWORD(v21)));
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v11);
      v16 = v14;
      v17 = -[__CFString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v25 = v17;
      v26 = 2114;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  return HIWORD(v20);
}

- (unsigned)cancelRequest:(id)a3
{
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  id v18;
  unsigned __int8 v20;
  unsigned __int16 v21;
  uint64_t v22;
  int v23;
  unsigned __int16 *v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v20 = 0;
  v21 = 16385;
  v22 = objc_msgSend(a3, "unsignedIntValue");
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v20);
  WORD2(v22) = 25761;
  LOWORD(v23) = v20;
  HIWORD(v23) = 6;
  v24 = &v21;
  v4 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, char *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, (char *)&v22 + 4);
  __ICOSLogCreate();
  v5 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(*_interfaceInterfaceRef)->ControlRequest() returned = 0x%08x\n\n"), v4));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    v11 = -[__CFString UTF8String](v9, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v27 = v11;
    v28 = 2114;
    v29 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (!(_DWORD)v4)
  {
    __ICOSLogCreate();
    v12 = CFSTR("HostUSB");
    if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("returned size: %d, buffer[0]: 0x%04x, buffer[1]: 0x%04x\n, buffer[2]: 0x%04x"), HIWORD(v23), v21, (unsigned __int16)v22, WORD1(v22)));
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v12);
      v17 = v15;
      v18 = -[__CFString UTF8String](v16, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v27 = v18;
      v28 = 2114;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  return v22;
}

- (void)deviceReset
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  unsigned __int8 v18;
  _QWORD v19[3];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  memset(v19, 0, sizeof(v19));
  v18 = 0;
  ((void (*)(IOUSBInterfaceStruct942 **, unsigned __int8 *))(*self->_interfaceInterfaceRef)->GetInterfaceNumber)(self->_interfaceInterfaceRef, &v18);
  LOWORD(v19[0]) = 26145;
  WORD2(v19[0]) = v18;
  __ICOSLogCreate();
  v3 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RequestType: 0x%02x SubType: 0x%02x"), 33, 102));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v9 = -[__CFString UTF8String](v7, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v21 = v9;
    v22 = 2114;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v10 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, _QWORD *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, v19);
  __ICOSLogCreate();
  v11 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(*_interfaceInterfaceRef)->ControlRequest() returned = 0x%08x\n\n"), v10));
  v14 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_retainAutorelease(v11);
    v16 = v14;
    v17 = -[__CFString UTF8String](v15, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v21 = v17;
    v22 = 2114;
    v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (BOOL)writeBulkData:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  id v16;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  id v24;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  NSObject *v31;
  id v32;
  __CFString *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  if (self->_connected)
  {
    if ((_DWORD)v5)
    {
      v6 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, id, id, uint64_t, uint64_t))(*self->_interfaceInterfaceRef)->WritePipeTO)(self->_interfaceInterfaceRef, self->_bulkPipeOut, objc_msgSend(v4, "bytes"), v5, 5000, 60000);
    }
    else
    {
      buf[0] = 0;
      v6 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, _QWORD, uint8_t *, _QWORD, uint64_t, uint64_t))(*self->_interfaceInterfaceRef)->WritePipeTO)(self->_interfaceInterfaceRef, self->_bulkPipeOut, buf, 0, 5000, 60000);
    }
    v8 = v6;
    if ((int)v6 > -536854450)
    {
      if ((_DWORD)v6 == -536854449 || (_DWORD)v6 == -536850432)
        goto LABEL_21;
      if (!(_DWORD)v6)
      {
LABEL_41:
        v7 = (_DWORD)v8 == 0;
        goto LABEL_42;
      }
    }
    else
    {
      v9 = (v6 + 536870208);
      if (v9 <= 0x2D)
      {
        if (((1 << (v6 + 64)) & 0x280002000001) != 0)
        {
          __ICOSLogCreate();
          v10 = CFSTR("HostUSB");
          if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
          {
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

          }
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writeBulkData: (disconnected) 0x%x:0x%x"), -[PTPHostUSBTransport locationID](self, "locationID"), v8));
          v13 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v14 = objc_retainAutorelease(v10);
            v15 = v13;
            v16 = -[__CFString UTF8String](v14, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v38 = v16;
            v39 = 2114;
            v40 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          self->_connected = 0;
          goto LABEL_41;
        }
        if (v9 == 22)
        {
LABEL_21:
          __ICOSLogCreate();
          v18 = CFSTR("HostUSB");
          if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
            v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writeBulkData: (timedout) 0x%x:0x%x"), -[PTPHostUSBTransport locationID](self, "locationID"), v8));
          v21 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_retainAutorelease(v18);
            v23 = v21;
            v24 = -[__CFString UTF8String](v22, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v38 = v24;
            v39 = 2114;
            v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          if ((_DWORD)v8 == -536850432 || (_DWORD)v8 == -536854449)
          {
            __ICOSLogCreate();
            v26 = CFSTR("HostUSB");
            if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
              v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writeBulkData: (cleared pipestall) 0x%x:0x%x"), -[PTPHostUSBTransport locationID](self, "locationID"), v8));
            v29 = (void *)_gICOSLog;
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
            {
              v30 = objc_retainAutorelease(v26);
              v31 = v29;
              v32 = -[__CFString UTF8String](v30, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v38 = v32;
              v39 = 2114;
              v40 = v28;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

            }
            ((void (*)(IOUSBInterfaceStruct942 **, _QWORD))(*self->_interfaceInterfaceRef)->ClearPipeStallBothEnds)(self->_interfaceInterfaceRef, self->_bulkPipeOut);
          }
          self->_timedOut = 1;
          goto LABEL_41;
        }
      }
    }
    __ICOSLogCreate();
    v33 = CFSTR("HostUSB");
    if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writeBulkData: (general) 0x%x:0x%x"), -[PTPHostUSBTransport locationID](self, "locationID"), v8));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

    goto LABEL_41;
  }
  v7 = 0;
LABEL_42:

  return v7;
}

- (int)readInterruptData
{
  id v3;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  IOReturn (__cdecl *ReadPipeAsync)(void *, UInt8, void *, UInt32, IOAsyncCallback1, void *);
  uint64_t interruptPipeIn;
  char *eventDataBuffer;
  uint64_t eventDataBufferSize;
  id v9;
  _QWORD v11[4];
  id v12;
  id location;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000603C;
  v11[3] = &unk_100048870;
  objc_copyWeak(&v12, &location);
  v3 = objc_msgSend(v11, "copy");
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  ReadPipeAsync = (*interfaceInterfaceRef)->ReadPipeAsync;
  interruptPipeIn = self->_interruptPipeIn;
  eventDataBuffer = self->_eventDataBuffer;
  eventDataBufferSize = self->_eventDataBufferSize;
  v9 = objc_retainBlock(v3);
  LODWORD(eventDataBufferSize) = ((uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, char *, uint64_t, void (*)(void (**)(void)), id))ReadPipeAsync)(interfaceInterfaceRef, interruptPipeIn, eventDataBuffer, eventDataBufferSize, sub_100006224, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return eventDataBufferSize;
}

- (void)handleInterruptData:(unint64_t)a3
{
  unsigned int v4;
  unsigned int v5;
  _WORD *v6;
  CFIndex v7;
  PTPEventPacket *v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  id v13;
  CFIndex v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  CFRange v26;
  CFRange v27;

  if (self->_connected)
  {
    -[NSMutableData appendBytes:length:](self->_eventData, "appendBytes:length:", self->_eventDataBuffer, a3);
    v4 = -[NSMutableData length](self->_eventData, "length");
    if (v4)
    {
      v5 = v4;
      do
      {
        v6 = -[NSMutableData mutableBytes](self->_eventData, "mutableBytes");
        v7 = *(unsigned int *)v6;
        if (v5 < v7)
          break;
        if (v6[2] == 4)
        {
          v8 = -[PTPEventPacket initWithUSBBuffer:]([PTPEventPacket alloc], "initWithUSBBuffer:", v6);
          WeakRetained = objc_loadWeakRetained(&self->_delegate);
          if (WeakRetained)
          {
            v10 = WeakRetained;
            v11 = objc_loadWeakRetained(&self->_delegate);
            v12 = objc_opt_respondsToSelector(v11, "handleEvent:");

            if ((v12 & 1) != 0)
            {
              v13 = objc_loadWeakRetained(&self->_delegate);
              objc_msgSend(v13, "performSelectorOnMainThread:withObject:waitUntilDone:", "handleEvent:", v8, 0);

            }
          }

        }
        v26.location = 0;
        v26.length = v7;
        CFDataDeleteBytes((CFMutableDataRef)self->_eventData, v26);
        v14 = v5 - v7;
        if ((_DWORD)v14)
        {
          __ICOSLogCreate();
          v15 = CFSTR("HostUSB");
          if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d excess byte(s) received -- placing them in the bit bucket\n"), v14));
          v18 = (void *)_gICOSLog;
          if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
          {
            v19 = objc_retainAutorelease(v15);
            v20 = v18;
            v21 = -[__CFString UTF8String](v19, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v23 = v21;
            v24 = 2114;
            v25 = v17;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          v27.location = 0;
          v27.length = v14;
          CFDataDeleteBytes((CFMutableDataRef)self->_eventData, v27);
        }
        v5 = -[NSMutableData length](self->_eventData, "length");
      }
      while (v5);
    }
  }
}

- (int)readResponseData:(id)a3 withTimeout:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  IOReturn (__cdecl *ReadPipeAsyncTO)(void *, UInt8, void *, UInt32, UInt32, UInt32, IOAsyncCallback1, void *);
  uint64_t bulkPipeIn;
  id v22;
  uint64_t v23;
  dispatch_time_t v24;
  void *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t delta;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  NSObject *v37;
  _QWORD *v38;
  id v39;
  id location;
  _QWORD v41[3];
  char v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;

  v6 = a3;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 1;
  -[PTPHostUSBTransport setTimedOut:](self, "setTimedOut:", 0);
  v34 = v6;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "txID"));
  v7 = 1000 * a4;
  delta = 2000000000 * a4;
  while (-[PTPHostUSBTransport connected](self, "connected")
       && !-[PTPHostUSBTransport timedOut](self, "timedOut")
       && (objc_msgSend(v34, "txComplete") & 1) == 0)
  {
    v8 = dispatch_semaphore_create(0);
    objc_initWeak(&location, self);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100006B00;
    v35[3] = &unk_100048898;
    objc_copyWeak(&v39, &location);
    v36 = v33;
    v38 = v41;
    v9 = v8;
    v37 = v9;
    v10 = objc_msgSend(v35, "copy");
    v11 = objc_msgSend(v34, "bufMutableBytes");
    v12 = objc_msgSend(v34, "bufSize");
    if (!v11)
    {
      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") < 0x15)
      {
        v26 = CFSTR("HostUSB");
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingString:", CFSTR("..")));

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("buf provided is NULL")));
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_29:
        v26 = objc_retainAutorelease(v26);
        sub_10002FB54((uint64_t)-[__CFString UTF8String](v26, "UTF8String"), (uint64_t)v29, (uint64_t)buf);
      }
LABEL_30:

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);

      break;
    }
    v13 = v12;
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v14 = CFSTR("HostUSB");
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ReadPipeAsyncTO: %d bytes"), v13));
      v17 = (id)_gICOSLog;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
        *(_DWORD *)buf = 136446466;
        v44 = v18;
        v45 = 2114;
        v46 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
      }

    }
    interfaceInterfaceRef = self->_interfaceInterfaceRef;
    ReadPipeAsyncTO = (*interfaceInterfaceRef)->ReadPipeAsyncTO;
    bulkPipeIn = self->_bulkPipeIn;
    v22 = objc_retainBlock(v10);
    v23 = ((uint64_t (*)(IOUSBInterfaceStruct942 **, uint64_t, id, id, uint64_t, uint64_t, void (*)(uint64_t, int, uint64_t), id))ReadPipeAsyncTO)(interfaceInterfaceRef, bulkPipeIn, v11, v13, v7, v7, sub_100006F84, v22);

    if ((_DWORD)v23)
    {
      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") < 0x15)
      {
        v26 = CFSTR("HostUSB");
      }
      else
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingString:", CFSTR("..")));

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ReadPipeAsyncTO returned %x -- bailing"), v23));
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      goto LABEL_30;
    }
    v24 = dispatch_time(0, delta);
    if (dispatch_semaphore_wait(v9, v24))
    {
      __ICOSLogCreate();
      if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") < 0x15)
      {
        v26 = CFSTR("HostUSB");
      }
      else
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("..")));

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ReadPipeAsyncTO timed out -- bailing")));
      v30 = (id)_gICOSLog;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      goto LABEL_30;
    }

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  _Block_object_dispose(v41, 8);

  return 0;
}

- (id)getTransaction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (void)addTransaction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "txID"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

  objc_sync_exit(v4);
}

- (void)removeTransaction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport transactions](self, "transactions"));
  objc_msgSend(v5, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)handleBulkData:(unint64_t)a3 result:(int)a4 forTxID:(id)a5
{
  uint64_t v5;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  PTPOperationResponsePacket *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  unsigned int v33;
  void *v34;
  void *v35;
  unsigned int v36;

  v5 = *(_QWORD *)&a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPHostUSBTransport getTransaction:](self, "getTransaction:", a5));
  v9 = v8;
  if ((_DWORD)v5)
  {
    __ICOSLogCreate();
    v10 = CFSTR("HostUSB");
    if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Read failed: %d"), v5));
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_10002FADC();

    if (v9)
      goto LABEL_7;
  }
  else if (self->_connected && v8 != 0)
  {
    v14 = (unsigned int *)objc_msgSend(v8, "bufMutableBytes");
    v15 = objc_msgSend(v9, "bufSize");
    if (!v14 || !v15)
    {
LABEL_7:
      objc_msgSend(v9, "setTxComplete:", 1);
      goto LABEL_13;
    }
    v16 = objc_msgSend(v9, "containerType");
    v17 = objc_msgSend(v9, "containerType");
    if (a3 >= 0xC && !v17)
    {
      v18 = *v14;
      if (v18 >= 0xC && (v14[1] & 0xFFFE) == 2)
      {
        objc_msgSend(v9, "setContainerType:");
        objc_msgSend(v9, "setContainerLength:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rxDataBuffer"));
        objc_msgSend(v19, "setHeaderOffset:", 12);

      }
    }
    if (objc_msgSend(v9, "containerType"))
    {
      v20 = objc_msgSend(v9, "containerType");
      if (v20 == 3)
      {
        if (objc_msgSend(v9, "containerLength") <= a3)
        {
          if ((objc_msgSend(v9, "dataReceived") & 1) == 0
            && objc_msgSend(v9, "dataExpected"))
          {
            v14 = (unsigned int *)objc_msgSend(v9, "rxDataMutableBytes");
          }
          v24 = -[PTPOperationResponsePacket initWithUSBBuffer:]([PTPOperationResponsePacket alloc], "initWithUSBBuffer:", v14);
          objc_msgSend(v9, "setResponsePacket:", v24);
          if (!v24)
          {
            __ICOSLogCreate();
            v25 = CFSTR("HostUSB");
            if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
              v25 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingString:", CFSTR("..")));

            }
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP PTPHostUSBTransport received bad response!")));
            if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
              sub_10002FADC();

          }
        }
        goto LABEL_7;
      }
      if (v20 == 2)
      {
        if (a3 > 0xB || v16)
        {
          v21 = objc_msgSend(v9, "rxCopyDataBuffer");
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rxDataBuffer"));
          v23 = v22;
          if (v21)
            objc_msgSend(v22, "appendBytes:length:", v14, a3);
          else
            objc_msgSend(v22, "setLength:", a3);

        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rxDataBuffer"));
        v32 = objc_msgSend(v31, "length");
        v33 = objc_msgSend(v9, "containerLength");

        if (v32 == (id)v33)
        {
          if (v16 || (v36 = objc_msgSend(v9, "containerLength"), a3 != 12) || v36 <= 0xC)
          {
            objc_msgSend(v9, "setContainerType:", 0);
            objc_msgSend(v9, "setContainerLength:", 0);
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rxDataBuffer"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rxDataBuffer"));
          objc_msgSend(v34, "setLength:", (char *)objc_msgSend(v35, "length") - 12);

          objc_msgSend(v9, "setDataReceived:", 1);
        }
      }
      else
      {
        __ICOSLogCreate();
        v28 = CFSTR("HostUSB");
        if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", CFSTR("..")));

        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PTP PTPHostUSBTransport received unrecognizable packet!")));
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
          sub_10002FADC();

      }
    }
  }
LABEL_13:

}

- (void)clearPipeStall:(unsigned __int8)a3
{
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  uint64_t v5;
  __int16 v6;
  int v7;
  __int16 v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;

  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    v5 = a3;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    ((void (*)(IOUSBInterfaceStruct942 **, _QWORD, char *, __int16 *, char *, __int16 *, __int16 *))(*interfaceInterfaceRef)->GetPipeProperties)(interfaceInterfaceRef, a3, (char *)&v14 + 1, &v14, (char *)&v13 + 1, &v12, &v13);
    v7 = 258;
    if (HIBYTE(v14) == 1)
      v6 = v14 + 128;
    else
      v6 = v14;
    v8 = v6;
    v9 = 0;
    v10 = 0;
    ((void (*)(IOUSBInterfaceStruct942 **, _QWORD, int *))(*self->_interfaceInterfaceRef)->ControlRequest)(self->_interfaceInterfaceRef, 0, &v7);
    ((void (*)(IOUSBInterfaceStruct942 **, uint64_t))(*self->_interfaceInterfaceRef)->ClearPipeStall)(self->_interfaceInterfaceRef, v5);
  }
}

- (void)clearBulkInPipeStall
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  __ICOSLogCreate();
  v3 = CFSTR("HostUSB");
  if ((unint64_t)objc_msgSend(CFSTR("HostUSB"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("HostUSB"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** clearBulkInPipeStall")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v10 = 136446466;
    v11 = -[__CFString UTF8String](v7, "UTF8String");
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v10, 0x16u);

  }
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    if (self->_bulkPipeIn)
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->ClearPipeStallBothEnds)(interfaceInterfaceRef);
  }
}

- (void)abortPendingIO
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  IOUSBInterfaceStruct942 **interfaceInterfaceRef;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  __ICOSLogCreate();
  v3 = CFSTR("PTPTransport");
  if ((unint64_t)objc_msgSend(CFSTR("PTPTransport"), "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("PTPTransport"), "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%p | %16s - 0x%08X"), self, "abortPipe locID", -[PTPHostUSBTransport locationID](self, "locationID")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v11 = -[__CFString UTF8String](v7, "UTF8String");
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  interfaceInterfaceRef = self->_interfaceInterfaceRef;
  if (interfaceInterfaceRef)
  {
    if (self->_interruptPipeIn)
      ((void (*)(IOUSBInterfaceStruct942 **))(*interfaceInterfaceRef)->AbortPipe)(interfaceInterfaceRef);
    if (self->_bulkPipeIn)
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
    if (self->_bulkPipeOut)
      ((void (*)(IOUSBInterfaceStruct942 **))(*self->_interfaceInterfaceRef)->AbortPipe)(self->_interfaceInterfaceRef);
  }
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)timedOut
{
  return self->_timedOut;
}

- (void)setTimedOut:(BOOL)a3
{
  self->_timedOut = a3;
}

- (BOOL)busy
{
  return self->_busy;
}

- (void)setBusy:(BOOL)a3
{
  self->_busy = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int16)a3
{
  self->_type = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (int)connectionStatus
{
  return self->_connectionStatus;
}

- (void)setConnectionStatus:(int)a3
{
  self->_connectionStatus = a3;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (unsigned)locationID
{
  return self->_locationID;
}

- (void)setLocationID:(unsigned int)a3
{
  self->_locationID = a3;
}

- (unsigned)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(unsigned __int16)a3
{
  self->_vendorID = a3;
}

- (unsigned)productID
{
  return self->_productID;
}

- (void)setProductID:(unsigned __int16)a3
{
  self->_productID = a3;
}

- (NSString)usbSerialNumberString
{
  return self->_usbSerialNumberString;
}

- (void)setUsbSerialNumberString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (unsigned)bulkPipeIn
{
  return self->_bulkPipeIn;
}

- (void)setBulkPipeIn:(unsigned __int8)a3
{
  self->_bulkPipeIn = a3;
}

- (unsigned)bulkPipeOut
{
  return self->_bulkPipeOut;
}

- (void)setBulkPipeOut:(unsigned __int8)a3
{
  self->_bulkPipeOut = a3;
}

- (unsigned)interruptPipeIn
{
  return self->_interruptPipeIn;
}

- (void)setInterruptPipeIn:(unsigned __int8)a3
{
  self->_interruptPipeIn = a3;
}

- (int)maxPacketSizeBulkIn
{
  return self->_maxPacketSizeBulkIn;
}

- (void)setMaxPacketSizeBulkIn:(int)a3
{
  self->_maxPacketSizeBulkIn = a3;
}

- (int)maxPacketSizeBulkOut
{
  return self->_maxPacketSizeBulkOut;
}

- (void)setMaxPacketSizeBulkOut:(int)a3
{
  self->_maxPacketSizeBulkOut = a3;
}

- (int)maxPacketSizeInterruptIn
{
  return self->_maxPacketSizeInterruptIn;
}

- (void)setMaxPacketSizeInterruptIn:(int)a3
{
  self->_maxPacketSizeInterruptIn = a3;
}

- (unsigned)eventDataBufferSize
{
  return self->_eventDataBufferSize;
}

- (void)setEventDataBufferSize:(unsigned int)a3
{
  self->_eventDataBufferSize = a3;
}

- (char)eventDataBuffer
{
  return self->_eventDataBuffer;
}

- (void)setEventDataBuffer:(char *)a3
{
  self->_eventDataBuffer = a3;
}

- (NSMutableData)eventData
{
  return self->_eventData;
}

- (void)setEventData:(id)a3
{
  objc_storeStrong((id *)&self->_eventData, a3);
}

- (unsigned)writeBufferSize
{
  return self->_writeBufferSize;
}

- (void)setWriteBufferSize:(unsigned int)a3
{
  self->_writeBufferSize = a3;
}

- (char)writeBuffer
{
  return self->_writeBuffer;
}

- (void)setWriteBuffer:(char *)a3
{
  self->_writeBuffer = a3;
}

- (NSMutableDictionary)transactions
{
  return self->_transactions;
}

- (void)setTransactions:(id)a3
{
  objc_storeStrong((id *)&self->_transactions, a3);
}

- (OS_dispatch_queue)transportQueue
{
  return self->_transportQueue;
}

- (void)setTransportQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transportQueue, a3);
}

- (unsigned)canceledTransactionID
{
  return self->_canceledTransactionID;
}

- (void)setCanceledTransactionID:(unsigned int)a3
{
  self->_canceledTransactionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_transactions, 0);
  objc_storeStrong((id *)&self->_eventData, 0);
  objc_storeStrong((id *)&self->_usbSerialNumberString, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_machRecvSemaphore, 0);
}

@end
