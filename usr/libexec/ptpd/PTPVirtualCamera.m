@implementation PTPVirtualCamera

- (PTPVirtualCamera)initWithName:(id)a3 andPath:(id)a4
{
  id v7;
  id v8;
  PTPVirtualCamera *v9;
  PTPVirtualCamera *v10;
  PTPDeviceInfoDataset *v11;
  PTPDeviceInfoDataset *deviceInfoDataset;
  NSMutableDictionary *v13;
  NSMutableDictionary *storages;
  PTPStorage *photoStorage;
  PTPSecurityModel *ptpSecurityModel;
  NSMutableArray *v17;
  NSMutableArray *hostMediaSupportedFormats;
  dispatch_queue_t v19;
  OS_dispatch_queue *storageEnumerationQ;
  id v21;
  void *v22;
  PTPDeviceInfoDataset *v23;
  void *v24;
  PTPDeviceInfoDataset *v25;
  void *v26;
  PTPDeviceInfoDataset *v27;
  void *v28;
  PTPDeviceInfoDataset *v29;
  void *v30;
  PTPDeviceInfoDataset *v31;
  void *v32;
  PTPDeviceInfoDataset *v33;
  void *v34;
  PTPDeviceInfoDataset *v35;
  void *v36;
  PTPDeviceInfoDataset *v37;
  void *v38;
  PTPDeviceInfoDataset *v39;
  void *v40;
  PTPDeviceInfoDataset *v41;
  void *v42;
  PTPDeviceInfoDataset *v43;
  void *v44;
  PTPDeviceInfoDataset *v45;
  void *v46;
  PTPDeviceInfoDataset *v47;
  void *v48;
  PTPDeviceInfoDataset *v49;
  void *v50;
  id v51;
  void *v52;
  _BOOL8 v53;
  id v54;
  void *v55;
  void *v56;
  uint64_t v57;
  PTPStorage *v58;
  PTPStorage *v59;
  PTPStorage *placeholderStorage;
  objc_super v62;

  v7 = a3;
  v8 = a4;
  v62.receiver = self;
  v62.super_class = (Class)PTPVirtualCamera;
  v9 = -[PTPVirtualCamera init](&v62, "init");
  v10 = v9;
  if (v9)
  {
    dword_10005E44C = 0;
    dword_10005E450 = 0;
    dword_10005E454 = 0;
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_path, a4);
    v11 = objc_alloc_init(PTPDeviceInfoDataset);
    deviceInfoDataset = v10->_deviceInfoDataset;
    v10->_deviceInfoDataset = v11;

    v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", 0);
    storages = v10->_storages;
    v10->_storages = v13;

    byte_10005E440 = 0;
    photoStorage = v10->_photoStorage;
    v10->_photoStorage = 0;

    ptpSecurityModel = v10->_ptpSecurityModel;
    v10->_ptpSecurityModel = 0;

    v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    hostMediaSupportedFormats = v10->_hostMediaSupportedFormats;
    v10->_hostMediaSupportedFormats = v17;

    v19 = dispatch_queue_create("PTP Enumeration Queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    storageEnumerationQ = v10->_storageEnumerationQ;
    v10->_storageEnumerationQ = (OS_dispatch_queue *)v19;

    v21 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", CFSTR("/System/Library/ApplePTP/PTPDeviceInfoDataset.plist"));
    v22 = v21;
    if (v21)
    {
      v23 = v10->_deviceInfoDataset;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("StandardVersion")));
      -[PTPDeviceInfoDataset setStandardVersion:](v23, "setStandardVersion:", objc_msgSend(v24, "unsignedShortValue"));

      v25 = v10->_deviceInfoDataset;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("VendorExtensionID")));
      -[PTPDeviceInfoDataset setVendorExtensionID:](v25, "setVendorExtensionID:", objc_msgSend(v26, "unsignedIntValue"));

      v27 = v10->_deviceInfoDataset;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("VendorExtensionVersion")));
      -[PTPDeviceInfoDataset setVendorExtensionVersion:](v27, "setVendorExtensionVersion:", objc_msgSend(v28, "unsignedShortValue"));

      v29 = v10->_deviceInfoDataset;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("VendorExtensionDesc")));
      -[PTPDeviceInfoDataset setVendorExtensionDescription:](v29, "setVendorExtensionDescription:", v30);

      v31 = v10->_deviceInfoDataset;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("FunctionalMode")));
      -[PTPDeviceInfoDataset setFunctionalMode:](v31, "setFunctionalMode:", objc_msgSend(v32, "unsignedShortValue"));

      v33 = v10->_deviceInfoDataset;
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("OperationsSupported")));
      -[PTPDeviceInfoDataset setOperationsSupported:](v33, "setOperationsSupported:", v34);

      v35 = v10->_deviceInfoDataset;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("EventsSupported")));
      -[PTPDeviceInfoDataset setEventsSupported:](v35, "setEventsSupported:", v36);

      v37 = v10->_deviceInfoDataset;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("DevicePropertiesSupported")));
      -[PTPDeviceInfoDataset setDevicePropertiesSupported:](v37, "setDevicePropertiesSupported:", v38);

      v39 = v10->_deviceInfoDataset;
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("CaptureFormats")));
      -[PTPDeviceInfoDataset setCaptureFormats:](v39, "setCaptureFormats:", v40);

      v41 = v10->_deviceInfoDataset;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("ImageFormats")));
      -[PTPDeviceInfoDataset setImageFormats:](v41, "setImageFormats:", v42);

      v43 = v10->_deviceInfoDataset;
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("Manufacturer")));
      -[PTPDeviceInfoDataset setManufacturer:](v43, "setManufacturer:", v44);

      v45 = v10->_deviceInfoDataset;
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("Model")));
      -[PTPDeviceInfoDataset setModel:](v45, "setModel:", v46);

      v47 = v10->_deviceInfoDataset;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("DeviceVersion")));
      -[PTPDeviceInfoDataset setDeviceVersion:](v47, "setDeviceVersion:", v48);

      v49 = v10->_deviceInfoDataset;
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKey:", CFSTR("SerialNumber")));
      -[PTPDeviceInfoDataset setSerialNumber:](v49, "setSerialNumber:", v50);

    }
    -[PTPVirtualCamera updateUserAssignedName](v10, "updateUserAssignedName");
    -[PTPVirtualCamera updateDeviceInformation](v10, "updateDeviceInformation");
    v10->_notificationCenter = CFNotificationCenterGetDarwinNotifyCenter();
    v51 = sub_10000D990();
    v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
    v53 = objc_msgSend(v52, "cplStorageState") != 0;
    v54 = objc_msgSend(v52, "cplStorageState");
    v55 = (void *)MGCopyAnswer(CFSTR("SerialNumber"), 0);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ICPE^%d&CPLS^%lu"), v53, v54));
    if (v55)
    {
      v57 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@&ASN^%@"), v56, v55));

      v56 = (void *)v57;
    }
    -[PTPDeviceInfoDataset setVendorExtensionDescription:](v10->_deviceInfoDataset, "setVendorExtensionDescription:", v56);
    -[PTPVirtualCamera initializeMTPProperties](v10, "initializeMTPProperties");
    qword_10005E460 = -[PTPVirtualCamera transferBehaviorUserPreference](v10, "transferBehaviorUserPreference");
    v58 = [PTPStorage alloc];
    v59 = -[PTPStorage initWithParent:andOptionalID:forSessionID:](v58, "initWithParent:andOptionalID:forSessionID:", v10, dword_10005E280, 0);
    placeholderStorage = v10->_placeholderStorage;
    v10->_placeholderStorage = v59;

    objc_msgSend(v52, "setDelegate:", v10);
    -[PTPVirtualCamera startObservers](v10, "startObservers");

  }
  return v10;
}

- (void)updateUserAssignedName
{
  NSString *v3;
  NSString *userAssignedName;
  SEL v5;
  id WeakRetained;

  v3 = (NSString *)MGCopyAnswer(CFSTR("UserAssignedDeviceName"), 0);
  if (v3)
  {
    userAssignedName = self->_userAssignedName;
    self->_userAssignedName = v3;

    v5 = NSSelectorFromString(CFSTR("reportUserAssignedNameChange"));
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "performSelector:", v5);

  }
}

- (void)updateDeviceInformation
{
  uint64_t v3;
  void *v4;
  NSString *v5;
  NSString *name;
  uint64_t v7;
  const void *v8;
  PTPDeviceInfoDataset *deviceInfoDataset;
  void *v10;
  uint64_t v11;
  const void *v12;
  PTPDeviceInfoDataset *v13;
  void *v14;
  NSString *v15;
  NSString *productType;

  v3 = MGCopyAnswer(CFSTR("DeviceClass"), 0);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Apple %@"), v3);
    name = self->_name;
    self->_name = v5;

    -[PTPDeviceInfoDataset setModel:](self->_deviceInfoDataset, "setModel:", self->_name);
  }
  v7 = MGCopyAnswer(CFSTR("SerialNumber"), 0);
  if (v7)
  {
    v8 = (const void *)v7;
    deviceInfoDataset = self->_deviceInfoDataset;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v7));
    -[PTPDeviceInfoDataset setSerialNumber:](deviceInfoDataset, "setSerialNumber:", v10);

    CFRelease(v8);
  }
  v11 = MGCopyAnswer(CFSTR("ProductVersion"), 0);
  if (v11)
  {
    v12 = (const void *)v11;
    v13 = self->_deviceInfoDataset;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v11));
    -[PTPDeviceInfoDataset setDeviceVersion:](v13, "setDeviceVersion:", v14);

    CFRelease(v12);
  }
  v15 = (NSString *)MGCopyAnswer(CFSTR("ProductType"), 0);
  if (v15)
  {
    productType = self->_productType;
    self->_productType = v15;

  }
}

- (void)dealloc
{
  id v3;
  void *v4;
  PTPVirtualCamera *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  -[PTPVirtualCamera assignHostMediaCapabilities:](self, "assignHostMediaCapabilities:", 0);
  v3 = sub_10000D990();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (PTPVirtualCamera *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));

  __ICOSLogCreate();
  v6 = objc_msgSend(CFSTR("am.delegate"), "length");
  if (v5 == self)
  {
    if ((unint64_t)v6 < 0x15)
    {
      v10 = CFSTR("am.delegate");
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("am.delegate"), "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting am.delegate to nil")));
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v10);
      v18 = v16;
      *(_DWORD *)buf = 136446466;
      v21 = -[__CFString UTF8String](v17, "UTF8String");
      v22 = 2114;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(v4, "setDelegate:", 0);
  }
  else
  {
    if ((unint64_t)v6 < 0x15)
    {
      v8 = CFSTR("am.delegate");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("am.delegate"), "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("am.delegate is not owned by this object, not setting to nil")));
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v8);
      v14 = v12;
      *(_DWORD *)buf = 136446466;
      v21 = -[__CFString UTF8String](v13, "UTF8String");
      v22 = 2114;
      v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  objc_storeWeak(&self->_delegate, 0);
  -[PTPStorage setParent:](self->_photoStorage, "setParent:", 0);
  -[PTPStorage setParent:](self->_placeholderStorage, "setParent:", 0);
  -[PTPVirtualCamera removeStorages](self, "removeStorages");
  -[PTPVirtualCamera removeSecurity](self, "removeSecurity");
  -[PTPVirtualCamera stopObservers](self, "stopObservers");
  -[PTPVirtualCamera setupStorageAfterTimeout:](self, "setupStorageAfterTimeout:", &stru_100048800);

  v19.receiver = self;
  v19.super_class = (Class)PTPVirtualCamera;
  -[PTPVirtualCamera dealloc](&v19, "dealloc");
}

- (NSString)userAssignedName
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  NSString *userAssignedName;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("User Assigned: %@"), self->_userAssignedName));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v19 = -[__CFString UTF8String](v7, "UTF8String");
    v20 = 2114;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("System Defalt: %@"), self->_name));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    v15 = -[__CFString UTF8String](v13, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v19 = v15;
    v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  userAssignedName = self->_userAssignedName;
  if (!userAssignedName)
    userAssignedName = self->_name;
  return userAssignedName;
}

- (int64_t)transferBehaviorUserPreference
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.camera"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKey:", CFSTR("CAMUserPreferenceMediaTransferBehavior")));
    v5 = (void *)v4;
    if (v4 && (objc_opt_respondsToSelector(v4, "integerValue") & 1) != 0)
      v6 = objc_msgSend(v5, "integerValue");
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }
  __ICOSLogCreate();
  v7 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

  }
  v9 = "Auto";
  if (v6 == (id)1)
    v9 = "Original";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Transfer Mode: %s"), v9));
  v11 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_retainAutorelease(v7);
    v13 = v11;
    *(_DWORD *)buf = 136446466;
    v16 = -[__CFString UTF8String](v12, "UTF8String");
    v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  return (int64_t)v6;
}

- (void)initializeMTPProperties
{
  NSMutableArray *v3;
  NSMutableArray *objectDescriptionDataset;
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableArray *v16;
  void *v17;
  id v18;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  objectDescriptionDataset = self->_objectDescriptionDataset;
  self->_objectDescriptionDataset = v3;

  v5 = self->_objectDescriptionDataset;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56321, 6));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = self->_objectDescriptionDataset;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56322, 4));
  -[NSMutableArray addObject:](v7, "addObject:", v8);

  v9 = self->_objectDescriptionDataset;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56324, 8));
  -[NSMutableArray addObject:](v9, "addObject:", v10);

  v11 = self->_objectDescriptionDataset;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56327, 0xFFFFLL));
  -[NSMutableArray addObject:](v11, "addObject:", v12);

  v18 = (id)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56328, 0xFFFFLL));
  objc_msgSend(v18, "setFormFlag:", 3);
  -[NSMutableArray addObject:](self->_objectDescriptionDataset, "addObject:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56329, 0xFFFFLL));
  objc_msgSend(v13, "setFormFlag:", 3);
  -[NSMutableArray addObject:](self->_objectDescriptionDataset, "addObject:", v13);
  v14 = self->_objectDescriptionDataset;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56331, 6));
  -[NSMutableArray addObject:](v14, "addObject:", v15);

  v16 = self->_objectDescriptionDataset;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPObjectProperty objectPropertyWithPropertyCode:andDataType:](MTPObjectProperty, "objectPropertyWithPropertyCode:andDataType:", 56385, 10));
  -[NSMutableArray addObject:](v16, "addObject:", v17);

}

- (void)vendPhotoStorage
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EA0C;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)removePlaceholderStorage
{
  if (-[PTPVirtualCamera visibleStorage:](self, "visibleStorage:", self->_placeholderStorage))
  {
    -[PTPVirtualCamera sendEventRemoveStorageWithID:](self, "sendEventRemoveStorageWithID:", -[PTPStorage storageID](self->_placeholderStorage, "storageID"));
    -[PTPVirtualCamera removeStorageWithID:](self, "removeStorageWithID:", -[PTPStorage storageID](self->_placeholderStorage, "storageID"));
  }
}

- (void)preparePhotoStorage
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  PTPStorage *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  OS_dispatch_queue *storageEnumerationQ;
  PTPStorage *v19;
  OS_dispatch_queue *v20;
  _QWORD v21[5];
  _QWORD block[4];
  PTPStorage *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Prepare Photo Storage")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    v25 = -[__CFString UTF8String](v7, "UTF8String");
    v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera photoStorage](self, "photoStorage"));

  if (!v9)
  {
    if (-[PTPVirtualCamera hostSupportsGroups](self, "hostSupportsGroups"))
    {
      v10 = -[PTPStorage initWithParent:andOptionalID:forSessionID:]([PTPStorage alloc], "initWithParent:andOptionalID:forSessionID:", self, 0, -[PTPVirtualCamera currentInternalSessionID](self, "currentInternalSessionID"));
      -[PTPVirtualCamera setPhotoStorage:](self, "setPhotoStorage:", v10);
      __ICOSLogCreate();
      v11 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Group Storage Available: 0x%x \n"), -[PTPStorage storageID](v10, "storageID")));
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
      notify_post("com.apple.ptpd.photoStorageChanged");
      storageEnumerationQ = self->_storageEnumerationQ;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000EF88;
      block[3] = &unk_100048750;
      v23 = v10;
      v19 = v10;
      dispatch_async((dispatch_queue_t)storageEnumerationQ, block);

    }
    else
    {
      v20 = self->_storageEnumerationQ;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000EF90;
      v21[3] = &unk_100048750;
      v21[4] = self;
      dispatch_async((dispatch_queue_t)v20, v21);
    }
  }
}

- (void)resetPhotoStorage
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  OS_dispatch_queue *storageEnumerationQ;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  void *v14;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Reset Photo Storage")));
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
  storageEnumerationQ = self->_storageEnumerationQ;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F580;
  block[3] = &unk_100048750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)storageEnumerationQ, block);
}

- (void)handleInternalSettingsChanged
{
  -[PTPVirtualCamera setCurrentInternalSessionID:](self, "setCurrentInternalSessionID:", sub_100004C44());
  -[PTPStorage setSessionID:](self->_placeholderStorage, "setSessionID:", -[PTPVirtualCamera currentInternalSessionID](self, "currentInternalSessionID"));
  -[PTPSecurityModel setSessionID:](self->_ptpSecurityModel, "setSessionID:", -[PTPVirtualCamera currentInternalSessionID](self, "currentInternalSessionID"));
  -[PTPVirtualCamera resetPhotoStorage](self, "resetPhotoStorage");
}

- (id)photoStorageAvailable
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera photoStorage](self, "photoStorage"));

  return +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v2 != 0);
}

- (BOOL)visibleStorage:(id)a3
{
  id v4;
  NSMutableDictionary *storages;
  void *v6;
  void *v7;
  BOOL v8;

  if (!a3)
    return 0;
  v4 = objc_msgSend(a3, "storageID");
  storages = self->_storages;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v6));
  v8 = v7 != 0;

  return v8;
}

- (void)addStorage:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  NSObject *v16;
  id v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  id v24;
  NSMutableDictionary *storages;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;

  v4 = a3;
  if (-[NSMutableDictionary count](self->_storages, "count") == (id)1)
  {
    __ICOSLogCreate();
    v5 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage 0x%x is being added"), objc_msgSend(v4, "storageID")));
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v35 = -[__CFString UTF8String](v9, "UTF8String");
      v36 = 2114;
      v37 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    __ICOSLogCreate();
    v11 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Two storages cannot co-exist - should quit")));
    v14 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_retainAutorelease(v11);
      v16 = v14;
      v17 = -[__CFString UTF8String](v15, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v35 = v17;
      v36 = 2114;
      v37 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  if (v4)
  {
    __ICOSLogCreate();
    v18 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage 0x%x is being added\n"), objc_msgSend(v4, "storageID")));
    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v18);
      v23 = v21;
      v24 = -[__CFString UTF8String](v22, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v35 = v24;
      v36 = 2114;
      v37 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    storages = self->_storages;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "storageID")));
    -[NSMutableDictionary setObject:forKey:](storages, "setObject:forKey:", v4, v26);

    __ICOSLogCreate();
    v27 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("..")));

    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage count is now: %lu\n"), -[NSMutableDictionary count](self->_storages, "count")));
    v30 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_retainAutorelease(v27);
      v32 = v30;
      v33 = -[__CFString UTF8String](v31, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v35 = v33;
      v36 = 2114;
      v37 = v29;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

- (void)sendEventAddStorageWithID:(unsigned int)a3
{
  uint64_t v3;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  void *v11;
  SEL v12;
  id WeakRetained;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;

  v3 = *(_QWORD *)&a3;
  __ICOSLogCreate();
  v5 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Add Storage: 0x%x\n"), v3));
  v8 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_retainAutorelease(v5);
    v10 = v8;
    *(_DWORD *)buf = 136446466;
    v15 = -[__CFString UTF8String](v9, "UTF8String");
    v16 = 2114;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
  v12 = NSSelectorFromString(CFSTR("reportStorageAdded:"));
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "performSelector:withObject:", v12, v11);

}

- (BOOL)removeStorageWithID:(unsigned int)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSMutableDictionary *storages;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  void *v24;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageWithID:](self, "storageWithID:", *(_QWORD *)&a3));
  if (v4)
  {
    __ICOSLogCreate();
    v5 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage 0x%x is being removed"), objc_msgSend(v4, "storageID")));
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v22 = -[__CFString UTF8String](v9, "UTF8String");
      v23 = 2114;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    storages = self->_storages;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "storageID")));
    -[NSMutableDictionary removeObjectForKey:](storages, "removeObjectForKey:", v12);

    __ICOSLogCreate();
    v13 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Storage count is now: %lu"), -[NSMutableDictionary count](self->_storages, "count")));
    v16 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v13);
      v18 = v16;
      v19 = -[__CFString UTF8String](v17, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v22 = v19;
      v23 = 2114;
      v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

  return v4 != 0;
}

- (void)sendEventRemoveStorageWithID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  void *v12;
  SEL v13;
  id WeakRetained;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageWithID:](self, "storageWithID:"));

  if (v5)
  {
    __ICOSLogCreate();
    v6 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Remove Storage: 0x%x\n"), v3));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v6);
      v11 = v9;
      *(_DWORD *)buf = 136446466;
      v16 = -[__CFString UTF8String](v10, "UTF8String");
      v17 = 2114;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v13 = NSSelectorFromString(CFSTR("reportStorageDeleted:"));
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    objc_msgSend(WeakRetained, "performSelector:withObject:", v13, v12);

  }
}

- (void)removeStorages
{
  NSMutableDictionary *storages;
  id v4;
  id v5;
  uint64_t v6;
  __CFString *v7;
  void (__cdecl **v8)(CFMutableDataRef, CFRange);
  const __CFString *v9;
  os_log_t *v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  os_log_t *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  void (__cdecl **v21)(CFMutableDataRef, CFRange);
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  id v25;
  NSMutableDictionary *v26;
  PTPVirtualCamera *v27;
  id obj;
  void *v29;
  __CFString *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];

  storages = self->_storages;
  if (storages)
  {
    v27 = self;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](storages, "allValues"));
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v32;
      v7 = &stru_100048E60;
      v8 = &CFDataDeleteBytes_ptr;
      v9 = CFSTR(" Removing Storage: 0x%x");
      v10 = (os_log_t *)&_gICOSLog;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v6)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          __ICOSLogCreate();
          v30 = v7;
          if ((unint64_t)-[__CFString length](v7, "length") >= 0x15)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString substringWithRange:](v7, "substringWithRange:", 0, 18));
            v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[53], "stringWithFormat:", v9, objc_msgSend(v12, "storageID")));
          v15 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            v29 = v12;
            v16 = v10;
            v17 = v7;
            v18 = v5;
            v19 = v6;
            v20 = v9;
            v21 = v8;
            v22 = objc_retainAutorelease(v30);
            v23 = v15;
            v24 = v22;
            v8 = v21;
            v9 = v20;
            v6 = v19;
            v5 = v18;
            v7 = v17;
            v10 = v16;
            v12 = v29;
            v25 = -[__CFString UTF8String](v24, "UTF8String");
            *(_DWORD *)buf = 136446466;
            v36 = v25;
            v37 = 2114;
            v38 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

          }
          objc_msgSend(v12, "setParent:", 0);
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      }
      while (v5);
    }
    -[NSMutableDictionary removeAllObjects](v27->_storages, "removeAllObjects");
    v26 = v27->_storages;
    v27->_storages = 0;

  }
}

- (void)sendEventDeviceUnlocked
{
  SEL v3;
  id WeakRetained;

  v3 = NSSelectorFromString(CFSTR("sendEventDeviceUnlocked"));
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(WeakRetained, "performSelector:", v3);

}

- (id)overrideCapabilities
{
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  NSObject *v35;
  id v36;
  __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  __CFString *v41;
  NSObject *v42;
  id v43;
  __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  NSObject *v49;
  id v50;
  int v52;
  id v53;
  __int16 v54;
  void *v55;

  if (sub_100004BEC())
  {
    __ICOSLogCreate();
    v2 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v2 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("..")));

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Internal Setting - Capabilities Override")));
    v5 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_retainAutorelease(v2);
      v7 = v5;
      v52 = 136446466;
      v53 = -[__CFString UTF8String](v6, "UTF8String");
      v54 = 2114;
      v55 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    if (sub_100004BEC())
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_1000506D0, CFSTR("HEIC"));
      __ICOSLogCreate();
      v9 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ++ Received HEIC")));
      v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v9);
        v14 = v12;
        v15 = -[__CFString UTF8String](v13, "UTF8String");
        v52 = 136446466;
        v53 = v15;
        v54 = 2114;
        v55 = v11;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
      __ICOSLogCreate();
      v16 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   -> Adding ptp.heic")));
      v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_retainAutorelease(v16);
        v21 = v19;
        v22 = -[__CFString UTF8String](v20, "UTF8String");
        v52 = 136446466;
        v53 = v22;
        v54 = 2114;
        v55 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
    }
    if (sub_100004BEC())
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_1000506D0, CFSTR("HEICS"));
      __ICOSLogCreate();
      v23 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ++ Received HEICS")));
      v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_retainAutorelease(v23);
        v28 = v26;
        v29 = -[__CFString UTF8String](v27, "UTF8String");
        v52 = 136446466;
        v53 = v29;
        v54 = 2114;
        v55 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
      __ICOSLogCreate();
      v30 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingString:", CFSTR("..")));

      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   -> Adding ptp.heics")));
      v33 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v34 = objc_retainAutorelease(v30);
        v35 = v33;
        v36 = -[__CFString UTF8String](v34, "UTF8String");
        v52 = 136446466;
        v53 = v36;
        v54 = 2114;
        v55 = v32;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
    }
    if (sub_100004BEC())
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &off_1000506D0, CFSTR("HEVC"));
      __ICOSLogCreate();
      v37 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stringByAppendingString:", CFSTR("..")));

      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ++ Received HEVC")));
      v40 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = objc_retainAutorelease(v37);
        v42 = v40;
        v43 = -[__CFString UTF8String](v41, "UTF8String");
        v52 = 136446466;
        v53 = v43;
        v54 = 2114;
        v55 = v39;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
      __ICOSLogCreate();
      v44 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v44 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "stringByAppendingString:", CFSTR("..")));

      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   -> Adding ptp.hevc")));
      v47 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v48 = objc_retainAutorelease(v44);
        v49 = v47;
        v50 = -[__CFString UTF8String](v48, "UTF8String");
        v52 = 136446466;
        v53 = v50;
        v54 = 2114;
        v55 = v46;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v52, 0x16u);

      }
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)willOverrideCapabilities
{
  void *v3;
  PFMediaCapabilities *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera overrideCapabilities](self, "overrideCapabilities"));
  if (!v3)
    goto LABEL_9;
  v4 = objc_opt_new(PFMediaCapabilities);
  v5 = sub_10000D990();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HEIC")));
  if (v9)
  {

LABEL_5:
    v14 = _UTTypeHEIFStandard;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, PFMediaCapabilitiesOutOfBandHintsExtraSupportedContentTypesKey);

    objc_msgSend(v8, "addObjectsFromArray:", &off_100053700);
    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HEICS")));

  if (v10)
    goto LABEL_5;
LABEL_6:
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HEVC")));

  if (v12)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &off_100053718, PFMediaCapabilitiesOutOfBandHintsExtraSupportedVideoCodecsKey);
    objc_msgSend(v8, "addObjectsFromArray:", &off_100053730);
  }
  -[PFMediaCapabilities setOutOfBandHints:](v4, "setOutOfBandHints:", v7);
  objc_msgSend(v6, "setPeerMediaCapabilities:", v4);
  -[NSMutableArray addObjectsFromArray:](self->_hostMediaSupportedFormats, "addObjectsFromArray:", v8);

LABEL_9:
  return v3 != 0;
}

- (void)assignHostMediaCapabilities:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  if (!-[PTPVirtualCamera willOverrideCapabilities](self, "willOverrideCapabilities"))
  {
    if (v4)
    {
      v5 = objc_msgSend(objc_alloc((Class)PFMediaCapabilities), "initWithOpaqueRepresentation:", v4);
      if (v5)
      {
        v6 = sub_10000D990();
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        objc_msgSend(v7, "setPeerMediaCapabilities:", v5);

        v8 = CFSTR("Set");
      }
      else
      {
        v8 = CFSTR("Failed");
      }
    }
    else
    {
      v9 = sub_10000D990();
      v5 = (id)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v5, "setPeerMediaCapabilities:", 0);
      v8 = CFSTR("Cleared");
    }

    __ICOSLogCreate();
    v10 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("..")));

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("PFMediaCapabilities: %@"), v8));
    v13 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_retainAutorelease(v10);
      v15 = v13;
      *(_DWORD *)buf = 136446466;
      v17 = -[__CFString UTF8String](v14, "UTF8String");
      v18 = 2114;
      v19 = v12;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }

}

- (void)assignHostSupportedFormats:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PFMediaCapabilities *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  id v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  id v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  NSObject *v39;
  id v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  NSObject *v46;
  id v47;
  void *v48;
  unsigned __int16 *v49;
  uint64_t v50;
  uint8_t buf[4];
  id v52;
  __int16 v53;
  void *v54;

  v4 = a3;
  if (!-[PTPVirtualCamera willOverrideCapabilities](self, "willOverrideCapabilities"))
  {
    __ICOSLogCreate();
    v5 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("..")));

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Assigning Host Supported Formats")));
    v8 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_retainAutorelease(v5);
      v10 = v8;
      *(_DWORD *)buf = 136446466;
      v52 = -[__CFString UTF8String](v9, "UTF8String");
      v53 = 2114;
      v54 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v11 = objc_retainAutorelease(v4);
    v49 = (unsigned __int16 *)objc_msgSend(v11, "bytes");
    v12 = objc_retainAutorelease(v11);
    v13 = sub_100020888(&v49, (unint64_t)objc_msgSend(v12, "length") + (_QWORD)objc_msgSend(v12, "bytes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if (v14)
    {
      v15 = objc_opt_new(PFMediaCapabilities);
      v16 = sub_10000D990();
      v48 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      if ((objc_msgSend(v14, "containsObject:", &off_100050700) & 1) != 0
        || objc_msgSend(v14, "containsObject:", &off_100050718))
      {
        v50 = _UTTypeHEIFStandard;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, PFMediaCapabilitiesOutOfBandHintsExtraSupportedContentTypesKey);

        __ICOSLogCreate();
        v20 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stringByAppendingString:", CFSTR("..")));

        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ++ Received HEIC (0xB401,0xB402)")));
        v23 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_retainAutorelease(v20);
          v25 = v23;
          v26 = -[__CFString UTF8String](v24, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v52 = v26;
          v53 = 2114;
          v54 = v22;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        __ICOSLogCreate();
        v27 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByAppendingString:", CFSTR("..")));

        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   -> Adding _UTTypeHEIFStandard")));
        v30 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v31 = objc_retainAutorelease(v27);
          v32 = v30;
          v33 = -[__CFString UTF8String](v31, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v52 = v33;
          v53 = 2114;
          v54 = v29;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        objc_msgSend(v17, "addObjectsFromArray:", &off_100053748);
      }
      if (objc_msgSend(v14, "containsObject:", &off_100050730))
      {
        objc_msgSend(v18, "setObject:forKeyedSubscript:", &off_100053760, PFMediaCapabilitiesOutOfBandHintsExtraSupportedVideoCodecsKey);
        __ICOSLogCreate();
        v34 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v34 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAppendingString:", CFSTR("..")));

        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   ++ Received HEVC (0xB421)")));
        v37 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v38 = objc_retainAutorelease(v34);
          v39 = v37;
          v40 = -[__CFString UTF8String](v38, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v52 = v40;
          v53 = 2114;
          v54 = v36;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        __ICOSLogCreate();
        v41 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v41 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "stringByAppendingString:", CFSTR("..")));

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("   -> Adding kCMVideoCodecType_HEVC")));
        v44 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v45 = objc_retainAutorelease(v41);
          v46 = v44;
          v47 = -[__CFString UTF8String](v45, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v52 = v47;
          v53 = 2114;
          v54 = v43;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
        objc_msgSend(v17, "addObjectsFromArray:", &off_100053778);
      }
      -[PFMediaCapabilities setOutOfBandHints:](v15, "setOutOfBandHints:", v18);
      objc_msgSend(v48, "setPeerMediaCapabilities:", v15);
      -[NSMutableArray addObjectsFromArray:](self->_hostMediaSupportedFormats, "addObjectsFromArray:", v17);

    }
  }

}

- (void)installSecurity
{
  PTPSecurityModel *v3;
  PTPSecurityModel *ptpSecurityModel;

  if (self->_ptpSecurityModel)
    -[PTPVirtualCamera removeSecurity](self, "removeSecurity");
  v3 = objc_alloc_init(PTPSecurityModel);
  ptpSecurityModel = self->_ptpSecurityModel;
  self->_ptpSecurityModel = v3;

  -[PTPSecurityModel setDelegate:](self->_ptpSecurityModel, "setDelegate:", self);
  -[PTPSecurityModel start](self->_ptpSecurityModel, "start");
}

- (void)removeSecurity
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  PTPSecurityModel *ptpSecurityModel;
  int v10;
  id v11;
  __int16 v12;
  void *v13;

  if (self->_ptpSecurityModel)
  {
    __ICOSLogCreate();
    v3 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Removing Security")));
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
    -[PTPSecurityModel stop](self->_ptpSecurityModel, "stop");
    -[PTPSecurityModel setDelegate:](self->_ptpSecurityModel, "setDelegate:", 0);
    ptpSecurityModel = self->_ptpSecurityModel;
    self->_ptpSecurityModel = 0;

  }
}

- (void)openSession
{
  _QWORD v3[5];

  -[PTPVirtualCamera installSecurity](self, "installSecurity");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000118E8;
  v3[3] = &unk_100048750;
  v3[4] = self;
  -[PTPVirtualCamera setupStorageAfterTimeout:](self, "setupStorageAfterTimeout:", v3);
}

- (void)setupStorageAfterTimeout:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;

  v4 = (void (**)(_QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));

  if (v5)
  {
    __ICOSLogCreate();
    v6 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("..")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("==|Session Continuation|== Storages Untouched")));
    v9 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_retainAutorelease(v6);
      v11 = v9;
      v13 = 136446466;
      v14 = -[__CFString UTF8String](v10, "UTF8String");
      v15 = 2114;
      v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v13, 0x16u);

    }
    v12 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));
    dispatch_source_cancel(v12);

  }
  else
  {
    v4[2](v4);
  }

}

- (void)closeSession
{
  unsigned int v3;
  double v4;
  id v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[5];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  -[PTPVirtualCamera removeSecurity](self, "removeSecurity");
  v3 = -[PTPVirtualCamera hostIsWindows](self, "hostIsWindows");
  v4 = 3.0;
  if (v3)
    v4 = 0.0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011FD4;
  v15[3] = &unk_100048750;
  v15[4] = self;
  -[PTPVirtualCamera cleanupStorageAfterTimeout:cleanup:](self, "cleanupStorageAfterTimeout:cleanup:", v15, v4);
  v5 = sub_10000D990();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)v6;
  if (v6 && (objc_opt_respondsToSelector(v6, "ptpCloseSession") & 1) != 0)
  {
    __ICOSLogCreate();
    v8 = CFSTR("challenge");
    if ((unint64_t)objc_msgSend(CFSTR("challenge"), "length") >= 0x15)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("challenge"), "substringWithRange:", 0, 18));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("🔐 Host closed all sessions -- requesting auth challenge dismissal")));
    v11 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v8);
      v13 = v11;
      v14 = -[__CFString UTF8String](v12, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v17 = v14;
      v18 = 2114;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    objc_msgSend(v7, "performSelector:", "ptpCloseSession");
  }

}

- (void)cleanupStorageAfterTimeout:(double)a3 cleanup:(id)a4
{
  id v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  dispatch_queue_global_t global_queue;
  void *v15;
  NSObject *v16;
  dispatch_source_t v17;
  NSObject *v18;
  dispatch_time_t v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD handler[5];
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;

  v6 = a4;
  __ICOSLogCreate();
  v7 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Cleanup Storages (CloseSession)")));
  v10 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_retainAutorelease(v7);
    v12 = v10;
    *(_DWORD *)buf = 136446466;
    v27 = -[__CFString UTF8String](v11, "UTF8String");
    v28 = 2114;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));

  if (!v13)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    -[PTPVirtualCamera setStorageTimerQ:](self, "setStorageTimerQ:", v15);

    v16 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimerQ](self, "storageTimerQ"));
    v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v16);
    -[PTPVirtualCamera setStorageTimer:](self, "setStorageTimer:", v17);

    v18 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));
    v19 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v18, v19, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);

    v20 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012340;
    handler[3] = &unk_100048828;
    handler[4] = self;
    v25 = v6;
    dispatch_source_set_event_handler(v20, handler);

    v21 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000124B4;
    v23[3] = &unk_100048750;
    v23[4] = self;
    dispatch_source_set_cancel_handler(v21, v23);

    v22 = objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera storageTimer](self, "storageTimer"));
    dispatch_resume(v22);

  }
}

- (void)startObservers
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  PTPVirtualCamera *v9;
  const char *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD handler[5];
  uint8_t v18[4];
  id v19;
  __int16 v20;
  void *v21;
  _BYTE buf[24];
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  PTPVirtualCamera *v25;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Install Device Status Observers")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = -[__CFString UTF8String](v7, "UTF8String");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  if (!self->_notificationObserversInstalled)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v23 = sub_100012958;
    v24 = sub_100012968;
    v9 = self;
    v25 = v9;
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(kLockdownNotificationDeviceNameChanged), "cStringUsingEncoding:", 4);
    v11 = &_dispatch_main_q;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100012970;
    handler[3] = &unk_100048850;
    handler[4] = buf;
    notify_register_dispatch(v10, &v9->_nameChangeToken, (dispatch_queue_t)&_dispatch_main_q, handler);

    self->_notificationObserversInstalled = 1;
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
    {
      v13 = &stru_100048E60;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Observers Installed")));
    v15 = (id)_gICOSLog;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = -[__CFString UTF8String](objc_retainAutorelease(v13), "UTF8String");
      *(_DWORD *)v18 = 136446466;
      v19 = v16;
      v20 = 2114;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v18, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)provokeSecurityCheck
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Provoke Security Probe")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v9 = 136446466;
    v10 = -[__CFString UTF8String](v7, "UTF8String");
    v11 = 2114;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v9, 0x16u);

  }
  -[PTPSecurityModel handleProtectionStatusChanged:](self->_ptpSecurityModel, "handleProtectionStatusChanged:", 5);
}

- (void)stopObservers
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  __ICOSLogCreate();
  v3 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Releasing Security Model")));
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v16 = 136446466;
    v17 = -[__CFString UTF8String](v7, "UTF8String");
    v18 = 2114;
    v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (self->_notificationObserversInstalled)
  {
    __ICOSLogCreate();
    v9 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Removing Device Status Observers")));
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v9);
      v14 = v12;
      v15 = -[__CFString UTF8String](v13, "UTF8String");
      v16 = 136446466;
      v17 = v15;
      v18 = 2114;
      v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v16, 0x16u);

    }
    notify_cancel(self->_nameChangeToken);
    self->_notificationObserversInstalled = 0;
  }
}

- (id)storageWithID:(unsigned int)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_storages, "allValues"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "objectHandle", (_QWORD)v13) == a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)objectForObjectHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_storages, "allValues"));
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", v7));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cameraFolderWithObjectID:", objc_msgSend(v4, "unsignedIntValue")));
      if (v9)
        break;
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cameraFileWithObjectID:", objc_msgSend(v4, "unsignedIntValue")));
      if (v9)
        break;

      if (v6 == ++v7)
        goto LABEL_6;
    }
    v10 = (void *)v9;

  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (id)allStorages
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_storages, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_storages, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8)));
        objc_msgSend(v3, "addObject:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allStorageIDs
{
  return -[NSMutableDictionary allKeys](self->_storages, "allKeys");
}

- (id)objectHandlesInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 responseCode:(unsigned __int16 *)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  NSMutableDictionary *storages;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;

  v7 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = *(_QWORD *)&a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  *a6 = 8193;
  if ((_DWORD)v9 == -1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera allStorages](self, "allStorages"));
    v16 = objc_msgSend(v14, "count");
    if (v16)
    {
      for (i = 0; i != v16; ++i)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", i));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectHandlesForObjectFormatCode:inAssociation:", v8, v7));
        objc_msgSend(v11, "addObjectsFromArray:", v19);

      }
    }
  }
  else
  {
    storages = self->_storages;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v13));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectHandlesForObjectFormatCode:inAssociation:", v8, v7));
      objc_msgSend(v11, "addObjectsFromArray:", v15);

    }
    else
    {
      *a6 = 8200;
    }
  }

  return v11;
}

- (id)objectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  NSMutableDictionary *storages;
  void *v15;
  void *v16;
  int v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = *(_QWORD *)&a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  *a7 = 8193;
  if ((_DWORD)v11 == -1)
  {
    *a7 = 8200;
  }
  else
  {
    storages = self->_storages;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v15));

    if (v16)
      objc_msgSend(v16, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:", v13, v10, v9, v8);
    else
      *a7 = 8200;

  }
  if (!objc_msgSend(v13, "length"))
  {
    v18 = 0;
    objc_msgSend(v13, "appendBytes:length:", &v18, 4);
  }
  return v13;
}

- (id)pathObjectInfoForObjectsInStorage:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v10;
  uint64_t v11;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  PTPWrappedBytes *v25;
  NSMutableDictionary *storages;
  void *v27;
  void *v28;
  void (__cdecl **v29)(CFMutableDataRef, CFRange);
  id v31;
  off_t st_size;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  unsigned int v39;
  unsigned int v40;
  uint8_t v41[4];
  id v42;
  __int16 v43;
  void *v44;
  stat buf;

  v10 = a4;
  v11 = *(_QWORD *)&a3;
  v13 = NSTemporaryDirectory();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v14, CFSTR("ptpObjects")));

  v16 = objc_retainAutorelease(v15);
  v17 = open((const char *)objc_msgSend(v16, "fileSystemRepresentation"), 514, 33152);
  if ((_DWORD)v17 == -1)
  {

    return 0;
  }
  else
  {
    v18 = v17;
    v39 = a5;
    v40 = a6;
    __ICOSLogCreate();
    v19 = CFSTR("objectInfos");
    if ((unint64_t)objc_msgSend(CFSTR("objectInfos"), "length") >= 0x15)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objectInfos"), "substringWithRange:", 0, 18));
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stringByAppendingString:", CFSTR("..")));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Created temporary file at: %@ -- fd: %d"), v16, v18));
    v22 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v19);
      v24 = v22;
      buf.st_dev = 136446466;
      *(_QWORD *)&buf.st_mode = -[__CFString UTF8String](v23, "UTF8String");
      WORD2(buf.st_ino) = 2114;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&buf, 0x16u);

    }
    v25 = -[PTPWrappedBytes initWithFileDescriptor:capacity:]([PTPWrappedBytes alloc], "initWithFileDescriptor:capacity:", v18, 209715200);
    *a7 = 8193;
    if ((_DWORD)v11 == -1)
    {
      *a7 = 8200;
      v29 = &CFDataDeleteBytes_ptr;
    }
    else
    {
      storages = self->_storages;
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v27));

      v29 = &CFDataDeleteBytes_ptr;
      if (v28)
        objc_msgSend(v28, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:", v25, v10, v39, v40);
      else
        *a7 = 8200;

    }
    if (!-[PTPWrappedBytes length](v25, "length"))
    {
      buf.st_dev = 0;
      -[PTPWrappedBytes appendBytes:length:](v25, "appendBytes:length:", &buf, 4);
    }
    memset(&buf, 0, sizeof(buf));
    v31 = objc_retainAutorelease(v16);
    lstat((const char *)objc_msgSend(v31, "fileSystemRepresentation"), &buf);
    st_size = buf.st_size;
    __ICOSLogCreate();
    v33 = CFSTR("objectInfos");
    if ((unint64_t)objc_msgSend(CFSTR("objectInfos"), "length") >= 0x15)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objectInfos"), "substringWithRange:", 0, 18));
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29[53], "stringWithFormat:", CFSTR("Output size: %llu"), st_size));
    v36 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v37 = objc_retainAutorelease(v33);
      v38 = v36;
      *(_DWORD *)v41 = 136446466;
      v42 = -[__CFString UTF8String](v37, "UTF8String");
      v43 = 2114;
      v44 = v35;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", v41, 0x16u);

    }
    close(v18);

    return v31;
  }
}

- (id)objectInfoForNextObjectGroupInStorage:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  uint64_t v5;
  void *v7;
  void (__cdecl **v8)(CFMutableDataRef, CFRange);
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  NSObject *v21;
  id v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  NSObject *v28;
  id v29;
  NSMutableDictionary *storages;
  void *v31;
  void *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  void *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  NSObject *v60;
  id v61;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint8_t v68[128];
  uint8_t buf[4];
  id v70;
  __int16 v71;
  void *v72;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  v67 = 0;
  objc_msgSend(v7, "appendBytes:length:", &v67, 8);
  *a4 = 8193;
  __ICOSLogCreate();
  v8 = &CFDataDeleteBytes_ptr;
  if (__ICLogTypeEnabled(4))
  {
    v9 = CFSTR("0x900f");
    if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("objectInfoForObjectsInStorage")));
    v12 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_retainAutorelease(v9);
      v14 = v12;
      v8 = &CFDataDeleteBytes_ptr;
      v15 = -[__CFString UTF8String](v13, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v70 = v15;
      v71 = 2114;
      v72 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
  }
  __ICOSLogCreate();
  if ((_DWORD)v5 == -1)
  {
    v47 = CFSTR("0x900f");
    if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingString:", CFSTR("..")));

    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("couldn't find storage")));
    v50 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
      sub_100030914(v47, v50);

    *a4 = 8200;
  }
  else
  {
    if (__ICLogTypeEnabled(4))
    {
      v16 = CFSTR("0x900f");
      if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByAppendingString:", CFSTR("..")));

      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("storageID: %x"), v5));
      v19 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_retainAutorelease(v16);
        v21 = v19;
        v8 = &CFDataDeleteBytes_ptr;
        v22 = -[__CFString UTF8String](v20, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v70 = v22;
        v71 = 2114;
        v72 = v18;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    __ICOSLogCreate();
    if (__ICLogTypeEnabled(4))
    {
      v23 = CFSTR("0x900f");
      if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingString:", CFSTR("..")));

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("storages: %@"), self->_storages));
      v26 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v27 = objc_retainAutorelease(v23);
        v28 = v26;
        v8 = &CFDataDeleteBytes_ptr;
        v29 = -[__CFString UTF8String](v27, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v70 = v29;
        v71 = 2114;
        v72 = v25;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
    storages = self->_storages;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v5));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v31));

    __ICOSLogCreate();
    if (v32)
    {
      if (__ICLogTypeEnabled(4))
      {
        v33 = CFSTR("0x900f");
        if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingString:", CFSTR("..")));

        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("found storage")));
        v36 = (void *)_gICOSLog;
        if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
        {
          v37 = objc_retainAutorelease(v33);
          v38 = v36;
          v39 = -[__CFString UTF8String](v37, "UTF8String");
          *(_DWORD *)buf = 136446466;
          v70 = v39;
          v71 = 2114;
          v72 = v35;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

        }
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "dequeueGroup"));
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v64;
        do
        {
          for (i = 0; i != v42; i = (char *)i + 1)
          {
            if (*(_QWORD *)v64 != v43)
              objc_enumerationMutation(v40);
            v45 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectInfoDatasetForObjectHandle:](self, "objectInfoDatasetForObjectHandle:", objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i), "integerValue")));
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "content:", 2));
            objc_msgSend(v7, "appendData:", v46);
            ++v67;

          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
        }
        while (v42);
      }

      v8 = &CFDataDeleteBytes_ptr;
    }
    else
    {
      v51 = CFSTR("0x900f");
      if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "stringByAppendingString:", CFSTR("..")));

      }
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("invalid storage")));
      v54 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_ERROR))
        sub_100030914(v51, v54);

      *a4 = 8200;
    }

  }
  __ICOSLogCreate();
  v55 = CFSTR("0x900f");
  if ((unint64_t)objc_msgSend(CFSTR("0x900f"), "length") >= 0x15)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("0x900f"), "substringWithRange:", 0, 18));
    v55 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "stringByAppendingString:", CFSTR("..")));

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[53], "stringWithFormat:", CFSTR("Sending %llu objects"), v67));
  v58 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v59 = objc_retainAutorelease(v55);
    v60 = v58;
    v61 = -[__CFString UTF8String](v59, "UTF8String");
    *(_DWORD *)buf = 136446466;
    v70 = v61;
    v71 = 2114;
    v72 = v57;
    _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  objc_msgSend(v7, "replaceBytesInRange:withBytes:", 0, 8, &v67);
  return v7;
}

- (id)objectInfosForObjectsInGroup:(unsigned int)a3 forObjectFormatCode:(unsigned __int16)a4 inAssociation:(unsigned int)a5 withContentType:(int)a6 responseCode:(unsigned __int16 *)a7
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v13;
  NSMutableDictionary *storages;
  void *v15;
  void *v16;
  int v18;

  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = *(_QWORD *)&a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  *a7 = 8193;
  if ((_DWORD)v11 == -1)
  {
    *a7 = 8200;
  }
  else
  {
    storages = self->_storages;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v11));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v15));

    if (v16)
      objc_msgSend(v16, "appendObjectData:forObjectFormatCode:inAssociation:withContentType:", v13, v10, v9, v8);
    else
      *a7 = 8200;

  }
  if (!objc_msgSend(v13, "length"))
  {
    v18 = 0;
    objc_msgSend(v13, "appendBytes:length:", &v18, 4);
  }
  return v13;
}

- (unsigned)numDownloadableObjects
{
  int v2;
  int v3;

  v2 = sub_100004BF8();
  v3 = dword_10005E450;
  if (v2)
    v3 = 0;
  return dword_10005E44C - v3;
}

- (unsigned)numAllObjects
{
  return dword_10005E454 + dword_10005E44C;
}

- (PTPDeviceInfoDataset)deviceInfoDataset
{
  return self->_deviceInfoDataset;
}

- (BOOL)hostIsWindows
{
  SEL v3;
  id *p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v3 = NSSelectorFromString(CFSTR("usingMTP"));
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained)
    return 0;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(p_delegate);
  v8 = objc_opt_respondsToSelector(v7, v3);

  if ((v8 & 1) == 0)
    return 0;
  v9 = objc_loadWeakRetained(p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", v3));

  if (!v10)
    return 0;
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (BOOL)hostIsMacOS
{
  SEL v3;
  id *p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v3 = NSSelectorFromString(CFSTR("usingMacOS"));
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained)
    return 0;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(p_delegate);
  v8 = objc_opt_respondsToSelector(v7, v3);

  if ((v8 & 1) == 0)
    return 0;
  v9 = objc_loadWeakRetained(p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", v3));

  if (!v10)
    return 0;
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (BOOL)hostIsLegacyOS
{
  SEL v3;
  id *p_delegate;
  id WeakRetained;
  void *v6;
  id v7;
  char v8;
  id v9;
  void *v10;
  unsigned __int8 v11;

  v3 = NSSelectorFromString(CFSTR("usingLegacyOS"));
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained(p_delegate);
  if (!WeakRetained)
    return 0;
  v6 = WeakRetained;
  v7 = objc_loadWeakRetained(p_delegate);
  v8 = objc_opt_respondsToSelector(v7, v3);

  if ((v8 & 1) == 0)
    return 0;
  v9 = objc_loadWeakRetained(p_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "performSelector:", v3));

  if (!v10)
    return 0;
  v11 = objc_msgSend(v10, "BOOLValue");

  return v11;
}

- (id)devicePropDescDatasetForProperty:(unsigned __int16)a3
{
  PTPDevicePropDescDataset *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  if (a3 == 54018)
  {
    v3 = objc_alloc_init(PTPDevicePropDescDataset);
    -[PTPDevicePropDescDataset setDevicePropertyCode:](v3, "setDevicePropertyCode:", 54018);
    -[PTPDevicePropDescDataset setDataTypeCode:](v3, "setDataTypeCode:", 10);
    -[PTPDevicePropDescDataset setReadWriteAttribute:](v3, "setReadWriteAttribute:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceInfoDataset serialNumber](self->_deviceInfoDataset, "serialNumber"));
    if ((unint64_t)objc_msgSend(v8, "length") < 4)
    {
      v11 = 0;
      v10 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", (char *)objc_msgSend(v8, "length") - 4));
      v11 = v10;
      if (v10)
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataUsingEncoding:allowLossyConversion:", 1, 1));
    }
    v12 = objc_retainAutorelease(v10);
    v13 = (unsigned int *)objc_msgSend(v12, "bytes");
    if (v13)
      v14 = *v13;
    else
      v14 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14));
    -[PTPDevicePropDescDataset setFactoryDefaultValue:](v3, "setFactoryDefaultValue:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v14));
    -[PTPDevicePropDescDataset setCurrentValue:](v3, "setCurrentValue:", v16);

    -[PTPDevicePropDescDataset setFormFlag:](v3, "setFormFlag:", 0);
    goto LABEL_13;
  }
  if (a3 == 20481)
  {
    v3 = objc_alloc_init(PTPDevicePropDescDataset);
    -[PTPDevicePropDescDataset setDevicePropertyCode:](v3, "setDevicePropertyCode:", 20481);
    -[PTPDevicePropDescDataset setDataTypeCode:](v3, "setDataTypeCode:", 2);
    -[PTPDevicePropDescDataset setReadWriteAttribute:](v3, "setReadWriteAttribute:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", 50));
    -[PTPDevicePropDescDataset setFactoryDefaultValue:](v3, "setFactoryDefaultValue:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", 50));
    -[PTPDevicePropDescDataset setCurrentValue:](v3, "setCurrentValue:", v5);

    -[PTPDevicePropDescDataset setFormFlag:](v3, "setFormFlag:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", 0));
    -[PTPDevicePropDescDataset setMinimumValue:](v3, "setMinimumValue:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", 100));
    -[PTPDevicePropDescDataset setMaximumValue:](v3, "setMaximumValue:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", 10));
    -[PTPDevicePropDescDataset setStepSize:](v3, "setStepSize:", v8);
LABEL_13:

    return v3;
  }
  v3 = 0;
  return v3;
}

- (id)devicePropValueForProperty:(unsigned __int16)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3 == 54018)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPDeviceInfoDataset serialNumber](self->_deviceInfoDataset, "serialNumber"));
    if ((unint64_t)objc_msgSend(v4, "length") >= 4
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", (char *)objc_msgSend(v4, "length") - 4))) != 0)
    {
      v6 = v5;
      v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:allowLossyConversion:", 1, 1));

    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 1)));
    *(_BYTE *)objc_msgSend(v3, "mutableBytes") = 50;
  }
  return v3;
}

- (BOOL)hostSupportsGroups
{
  return self->_hostSupportsGroups;
}

- (void)setHostSupportsGroups:(BOOL)a3
{
  void *v4;
  id v5;

  self->_hostSupportsGroups = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera photoStorage](self, "photoStorage"));

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera photoStorage](self, "photoStorage"));
    objc_msgSend(v5, "setAssetGroupIndex:", 0);

  }
}

- (id)storageInfoDatasetForStorageID:(unsigned int)a3
{
  NSMutableDictionary *storages;
  void *v4;
  void *v5;
  void *v6;

  storages = self->_storages;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](storages, "objectForKey:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storageInfoDataset"));
  return v6;
}

- (id)objectInfoDatasetForObjectHandle:(unsigned int)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectInfoDataset"));
  return v6;
}

- (unsigned)orientationForObjectHandle:(unsigned int)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v4));

  v6 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "desiredOrientation");
  else
    v7 = 0;

  return v7;
}

- (id)dataSourceForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4 size:(unsigned int *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int16 v14;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v8));

  v10 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dataSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectInfoDataset"));

    *a5 = objc_msgSend(v13, "objectCompressedSize");
    v14 = 8193;
  }
  else
  {
    v12 = 0;
    v14 = 8201;
  }
  *a4 = v14;

  return v12;
}

- (id)embeddedMetadataForObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v6));

  v8 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "metadata"));
    v12 = objc_msgSend(v11, "mutableCopy");

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("{Raw}")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("filters")));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("{Raw}")));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, CFSTR("filters"));

    }
    v16 = objc_msgSend(v12, "copy");
    objc_msgSend(v10, "encodeObject:forKey:", v16, CFSTR("metadata"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "encodedData"));
    *a4 = 8193;

  }
  else
  {
    v17 = 0;
    *a4 = 8201;
  }

  return v17;
}

- (id)thumbnailForObjectHandle:(unsigned int)a3 maxPixelSize:(unsigned int)a4 responseCode:(unsigned __int16 *)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  unsigned __int16 v16;
  unint64_t v18;

  v6 = *(_QWORD *)&a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v8));

  *a5 = 8193;
  v18 = 0;
  v10 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = v9;
    if (objc_msgSend(v11, "hasThumbnail"))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "thumbnailForMaxPixelSize:compressedSize:", v6, &v18));
      v13 = objc_msgSend(v12, "length");
      if ((unint64_t)v13 > v18)
      {
        v14 = objc_retainAutorelease(v12);
        v15 = objc_msgSend(v14, "bytes");
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v15, v18));

      }
      if (objc_msgSend(v12, "length"))
      {
        v16 = 8193;
      }
      else
      {

        v12 = 0;
        v16 = 8199;
      }
    }
    else
    {
      v12 = 0;
      v16 = 8208;
    }
    *a5 = v16;

  }
  else
  {
    v12 = 0;
    *a5 = 8201;
  }

  return v12;
}

- (void)deleteObjectWithObjectHandle:(unsigned int)a3 responseCode:(unsigned __int16 *)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(_QWORD *)&a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v6));

  v8 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "plAssetHandle"));
    v11 = sub_10000D990();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      __ICOSLogCreate();
      v13 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", CFSTR("..")));

      }
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "baseName")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" ───> [DELETE: %20s ]"), objc_msgSend(v15, "UTF8String")));

      v17 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_retainAutorelease(v13);
        v19 = v17;
        *(_DWORD *)buf = 136446466;
        v24 = -[__CFString UTF8String](v18, "UTF8String");
        v25 = 2114;
        v26 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      if ((objc_msgSend(v12, "ptpDeletePhotoForAssetHandle:", v10) & 1) != 0
        || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectInfoDataset")),
            v21 = objc_msgSend(v20, "sequenceNumber"),
            v20,
            v21 == 2))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));
        if (v22)
        {
          *a4 = 8193;
          --dword_10005E44C;
          if ((uint64_t)objc_msgSend(v9, "size") >= (uint64_t)&_mh_execute_header)
            --dword_10005E450;
          objc_msgSend(v22, "deleteFile:", v9);
        }

      }
      else
      {
        *a4 = 8207;
      }
    }

  }
  else
  {
    *a4 = 8201;
  }

}

- (void)generatePTPEventsForAddedObjectHandles:(id)a3
{
  uint64_t v4;
  void *v5;
  id *p_delegate;
  SEL v7;
  id WeakRetained;
  uint64_t v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectEnumerator"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v4)
  {
    v5 = (void *)v4;
    p_delegate = &self->_delegate;
    do
    {
      v7 = NSSelectorFromString(CFSTR("reportObjectAdded:"));
      WeakRetained = objc_loadWeakRetained(p_delegate);
      objc_msgSend(WeakRetained, "performSelector:withObject:", v7, v5);

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
      v5 = (void *)v9;
    }
    while (v9);
  }

}

- (void)generatePTPEventsForDeletedObjectHandles:(id)a3
{
  uint64_t v4;
  void *v5;
  id *p_delegate;
  SEL v7;
  id WeakRetained;
  uint64_t v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectEnumerator"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
  if (v4)
  {
    v5 = (void *)v4;
    p_delegate = &self->_delegate;
    do
    {
      v7 = NSSelectorFromString(CFSTR("reportObjectDeleted:"));
      WeakRetained = objc_loadWeakRetained(p_delegate);
      objc_msgSend(WeakRetained, "performSelector:withObject:", v7, v5);

      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nextObject"));
      v5 = (void *)v9;
    }
    while (v9);
  }

}

- (void)generatePTPEventsForAddedObjectGroupInStorage:(unsigned int)a3
{
  uint64_t v3;
  SEL v5;
  void *v6;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  v5 = NSSelectorFromString(CFSTR("reportGroupAddedInStorage:"));
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v3));
  objc_msgSend(WeakRetained, "performSelector:withObject:", v5, v6);

}

- (void)processAddedFiles:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100012958;
  v25 = sub_100012968;
  v26 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100012958;
  v19 = sub_100012968;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = sub_10000D990();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015528;
    v14[3] = &unk_100048878;
    v14[4] = self;
    v14[5] = &v21;
    v14[6] = &v15;
    objc_msgSend(v6, "ptpEnumerateAssetsWithLocalIdentifiers:usingBlock:", v4, v14);
  }
  else
  {
    __ICOSLogCreate();
    if ((unint64_t)objc_msgSend(CFSTR("assetManager"), "length") < 0x15)
    {
      v9 = CFSTR("assetManager");
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("assetManager"), "substringWithRange:", 0, 18));
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("..")));

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("!invalid")));
    v11 = (id)_gICOSLog;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[__CFString UTF8String](objc_retainAutorelease(v9), "UTF8String");
      *(_DWORD *)buf = 136446466;
      v28 = v12;
      v29 = 2114;
      v30 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
    }

  }
  if (self->_hostSupportsGroups)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera photoStorage](self, "photoStorage"));
    -[PTPVirtualCamera generatePTPEventsForAddedObjectGroupInStorage:](self, "generatePTPEventsForAddedObjectGroupInStorage:", objc_msgSend(v13, "storageID"));

  }
  else
  {
    if (objc_msgSend((id)v16[5], "count"))
      -[PTPVirtualCamera generatePTPEventsForAddedObjectHandles:](self, "generatePTPEventsForAddedObjectHandles:", v16[5]);
    if (objc_msgSend((id)v22[5], "count"))
      -[PTPVirtualCamera generatePTPEventsForAddedObjectHandles:](self, "generatePTPEventsForAddedObjectHandles:", v22[5]);
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

}

- (void)processDeletedFiles:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;

  v22 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_100012958;
  v36 = sub_100012968;
  v37 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = sub_100012958;
  v30[4] = sub_100012968;
  v31 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = sub_10000D990();
  v23 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (v23)
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100015AEC;
    v29[3] = &unk_100048878;
    v29[4] = self;
    v29[5] = &v32;
    v29[6] = v30;
    objc_msgSend(v23, "ptpEnumerateAssetsWithLocalIdentifiers:usingBlock:", v22, v29);
  }
  __ICOSLogCreate();
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") < 0x15)
  {
    v5 = &stru_100048E60;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingString:", CFSTR("..")));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("deletedFiles: %@\n"), v33[5]));
  v7 = (id)_gICOSLog;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[__CFString UTF8String](objc_retainAutorelease(v5), "UTF8String");
    *(_DWORD *)buf = 136446466;
    v40 = v8;
    v41 = 2114;
    v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
  }

  v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = (id)v33[5];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        __ICOSLogCreate();
        v14 = &stru_100048E60;
        if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
          v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("file index: %d\n"), objc_msgSend(v13, "objectHandle")));
        v17 = (id)_gICOSLog;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = -[__CFString UTF8String](objc_retainAutorelease(v14), "UTF8String");
          *(_DWORD *)buf = 136446466;
          v40 = v18;
          v41 = 2114;
          v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "objectHandle")));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parent"));
        objc_msgSend(v9, "addObject:", v19);
        objc_msgSend(v20, "deleteFile:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v38, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v9, "count"))
    -[PTPVirtualCamera generatePTPEventsForDeletedObjectHandles:](self, "generatePTPEventsForDeletedObjectHandles:", v9);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(&v32, 8);

}

- (void)addedPhotoKeys:(id)a3 deletedPhotoKeys:(id)a4 changedPhotoKeys:(id)a5 changePendingPhotoKeys:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  PTPVirtualCamera *v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  __ICOSLogCreate();
  v14 = CFSTR("addedPhotoKeys");
  if ((unint64_t)objc_msgSend(CFSTR("addedPhotoKeys"), "length") >= 0x15)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("addedPhotoKeys"), "substringWithRange:", 0, 18));
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("..")));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Added:[%lu] Changed[%lu] Removed[%lu]"), objc_msgSend(v10, "count"), objc_msgSend(v12, "count"), objc_msgSend(v11, "count")));
  v17 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v18 = objc_retainAutorelease(v14);
    v19 = v17;
    *(_DWORD *)buf = 136446466;
    v31 = -[__CFString UTF8String](v18, "UTF8String");
    v32 = 2114;
    v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015E0C;
  block[3] = &unk_1000488A0;
  v25 = v10;
  v26 = self;
  v27 = v11;
  v28 = v12;
  v29 = v13;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  v23 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)libraryDidBecomeAvailable
{
  notify_post("com.apple.ptpd.photoLibraryChanged");
}

- (void)libraryDidBecomeUnavailable
{
  notify_post("com.apple.ptpd.photoLibraryChanged");
}

- (id)objectPropertiesSupportedForObjectFormatCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4
{
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  *a4 = 8193;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_objectDescriptionDataset;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11), "propertyCode", (_QWORD)v14)));
        objc_msgSend(v6, "addObject:", v12);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)objectPropValueForHandle:(unsigned int)a3 withObjectPropertyCode:(unsigned __int16)a4 responseCode:(unsigned __int16 *)a5
{
  unsigned int v6;
  uint64_t v7;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  NSObject *v34;
  id v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  NSObject *v43;
  id v44;
  NSMutableArray *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSMutableArray *v54;
  NSObject *v55;
  id v56;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  id v64;
  __int16 v65;
  void *v66;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  __ICOSLogCreate();
  v9 = &stru_100048E60;
  if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("..")));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("---> objectPropValueForHandle For Handle 0x%lx with 0x%x\n"), v7, v6));
  v12 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_retainAutorelease(v9);
    v14 = v12;
    *(_DWORD *)buf = 136446466;
    v64 = -[__CFString UTF8String](v13, "UTF8String");
    v65 = 2114;
    v66 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0));
  *a5 = 8193;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v16));

  v18 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) == 0)
  {
    v19 = objc_opt_class(PTPFolder);
    if ((objc_opt_isKindOfClass(v17, v19) & 1) == 0)
    {
      __ICOSLogCreate();
      v45 = (NSMutableArray *)&stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v45 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "stringByAppendingString:", CFSTR("..")));

      }
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown Class\n")));
      v53 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v54 = objc_retainAutorelease(v45);
        v55 = v53;
        v56 = -[NSMutableArray UTF8String](v54, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v64 = v56;
        v65 = 2114;
        v66 = v52;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      goto LABEL_36;
    }
  }
  v20 = objc_opt_class(PTPFile);
  if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
  {
    __ICOSLogCreate();
    v21 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingString:", CFSTR("..")));

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("File Class\n")));
    v24 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v25 = objc_retainAutorelease(v21);
      v26 = v24;
      v27 = -[__CFString UTF8String](v25, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v64 = v27;
      v65 = 2114;
      v66 = v23;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v28 = objc_opt_class(PTPFolder);
    if ((objc_opt_isKindOfClass(v17, v28) & 1) != 0)
    {
      __ICOSLogCreate();
      v29 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stringByAppendingString:", CFSTR("..")));

      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Folder Class\n")));
      v32 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_retainAutorelease(v29);
        v34 = v32;
        v35 = -[__CFString UTF8String](v33, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v64 = v35;
        v65 = 2114;
        v66 = v31;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      __ICOSLogCreate();
      v36 = &stru_100048E60;
      if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "stringByAppendingString:", CFSTR("..")));

      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectInfoDataset"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "filename"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Inspecting: %@\n"), v39));

      v41 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v42 = objc_retainAutorelease(v36);
        v43 = v41;
        v44 = -[__CFString UTF8String](v42, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v64 = v44;
        v65 = 2114;
        v66 = v40;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v45 = self->_objectDescriptionDataset;
      v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v47; i = (char *)i + 1)
          {
            if (*(_QWORD *)v59 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v50, "propertyCode") == v6)
              objc_msgSend(v50, "objectValue:withObject:andHandle:", v15, v17, v7);
          }
          v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        }
        while (v47);
      }
LABEL_36:

    }
  }

  return v15;
}

- (id)objectPropDescForObjectPropertyCode:(unsigned __int16)a3 responseCode:(unsigned __int16 *)a4
{
  int v4;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0, a4));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = self->_objectDescriptionDataset;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "propertyCode", (_QWORD)v14) == v4)
        {
          objc_msgSend(v12, "objectPropertyDescriptionDataset:", v6);
          goto LABEL_11;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)objectPropListForHandle:(unsigned int)a3 withObjectFormatCode:(unsigned int)a4 andPropertyCode:(unsigned int)a5 andPropertyGroup:(unsigned int)a6 andDepth:(unsigned int)a7 responseCode:(unsigned __int16 *)a8
{
  uint64_t v9;
  uint64_t v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *v29;
  id v30;
  id v31;
  int v32;
  uint64_t v33;
  void *i;
  void *v35;
  unsigned int v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;

  v9 = *(_QWORD *)&a3;
  __ICOSLogCreate();
  v11 = __ICLogTypeEnabled(4);
  if (a5 != -1)
  {
    if (!v11)
      goto LABEL_13;
    v12 = CFSTR("objPropList");
    if ((unint64_t)objc_msgSend(CFSTR("objPropList"), "length") >= 0x15)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objPropList"), "substringWithRange:", 0, 18));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", CFSTR("..")));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Building SPECIFIC - Object Handle: %d\n"), v9));
    v15 = (void *)_gICOSLog;
    if (!os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    goto LABEL_11;
  }
  if (!v11)
    goto LABEL_13;
  v12 = CFSTR("objPropList");
  if ((unint64_t)objc_msgSend(CFSTR("objPropList"), "length") >= 0x15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("objPropList"), "substringWithRange:", 0, 18));
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", CFSTR("..")));

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Building GENERAL - Object Handle: %d\n"), v9));
  v15 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
LABEL_11:
    v12 = objc_retainAutorelease(v12);
    v17 = v15;
    *(_DWORD *)buf = 136446466;
    v44 = -[__CFString UTF8String](v12, "UTF8String");
    v45 = 2114;
    v46 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
LABEL_12:

LABEL_13:
  if ((v9 + 1) > 1)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 0));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v9));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(-[PTPVirtualCamera objectForObjectHandle:](self, "objectForObjectHandle:", v26));

    v27 = objc_opt_class(PTPFile);
    if ((objc_opt_isKindOfClass(v18, v27) & 1) != 0
      || (v28 = objc_opt_class(PTPFolder), (objc_opt_isKindOfClass(v18, v28) & 1) != 0))
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v25, "appendBytes:length:", buf, 4);
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v29 = self->_objectDescriptionDataset;
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v30)
      {
        v31 = v30;
        v32 = 0;
        v33 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v39 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
            v36 = objc_msgSend(v35, "propertyCode");
            if (a5 == -1 || v36 == a5)
            {
              *(_DWORD *)buf = ++v32;
              objc_msgSend(v25, "replaceBytesInRange:withBytes:length:", 0, 4, buf, 4);
              objc_msgSend(v35, "objectPropertyListElement:withObject:andHandle:", v25, v18, v9);
            }
          }
          v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v31);
      }

    }
    else
    {
      *(_DWORD *)buf = 0;
      objc_msgSend(v25, "appendBytes:length:", buf, 4);
    }
  }
  else
  {
    __ICOSLogCreate();
    v18 = &stru_100048E60;
    if ((unint64_t)objc_msgSend(&stru_100048E60, "length") >= 0x15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_100048E60, "substringWithRange:", 0, 18));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringByAppendingString:", CFSTR("..")));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unimplemented - Object Handle: %d\n"), v9));
    v21 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_retainAutorelease(v18);
      v23 = v21;
      v24 = -[__CFString UTF8String](v22, "UTF8String");
      *(_DWORD *)buf = 136446466;
      v44 = v24;
      v45 = 2114;
      v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

    }
    v25 = 0;
  }

  return v25;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setUserAssignedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (PTPSecurityModel)ptpSecurityModel
{
  return self->_ptpSecurityModel;
}

- (void)setPtpSecurityModel:(id)a3
{
  objc_storeStrong((id *)&self->_ptpSecurityModel, a3);
}

- (void)setDeviceInfoDataset:(id)a3
{
  objc_storeStrong((id *)&self->_deviceInfoDataset, a3);
}

- (NSMutableArray)objectDescriptionDataset
{
  return self->_objectDescriptionDataset;
}

- (void)setObjectDescriptionDataset:(id)a3
{
  objc_storeStrong((id *)&self->_objectDescriptionDataset, a3);
}

- (unsigned)currentInternalSessionID
{
  return self->_currentInternalSessionID;
}

- (void)setCurrentInternalSessionID:(unsigned int)a3
{
  self->_currentInternalSessionID = a3;
}

- (NSMutableArray)hostMediaSupportedFormats
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setHostMediaSupportedFormats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSMutableDictionary)storages
{
  return self->_storages;
}

- (void)setStorages:(id)a3
{
  objc_storeStrong((id *)&self->_storages, a3);
}

- (PTPStorage)photoStorage
{
  return self->_photoStorage;
}

- (void)setPhotoStorage:(id)a3
{
  objc_storeStrong((id *)&self->_photoStorage, a3);
}

- (PTPStorage)placeholderStorage
{
  return self->_placeholderStorage;
}

- (void)setPlaceholderStorage:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderStorage, a3);
}

- (PFMediaCapabilities)mediaCapabilities
{
  return self->_mediaCapabilities;
}

- (void)setMediaCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_mediaCapabilities, a3);
}

- (OS_dispatch_queue)storageEnumerationQ
{
  return self->_storageEnumerationQ;
}

- (void)setStorageEnumerationQ:(id)a3
{
  objc_storeStrong((id *)&self->_storageEnumerationQ, a3);
}

- (OS_dispatch_queue)storageTimerQ
{
  return self->_storageTimerQ;
}

- (void)setStorageTimerQ:(id)a3
{
  objc_storeStrong((id *)&self->_storageTimerQ, a3);
}

- (OS_dispatch_source)storageTimer
{
  return self->_storageTimer;
}

- (void)setStorageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_storageTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageTimer, 0);
  objc_storeStrong((id *)&self->_storageTimerQ, 0);
  objc_storeStrong((id *)&self->_storageEnumerationQ, 0);
  objc_storeStrong((id *)&self->_mediaCapabilities, 0);
  objc_storeStrong((id *)&self->_placeholderStorage, 0);
  objc_storeStrong((id *)&self->_photoStorage, 0);
  objc_storeStrong((id *)&self->_storages, 0);
  objc_storeStrong((id *)&self->_hostMediaSupportedFormats, 0);
  objc_storeStrong((id *)&self->_objectDescriptionDataset, 0);
  objc_storeStrong((id *)&self->_deviceInfoDataset, 0);
  objc_storeStrong((id *)&self->_ptpSecurityModel, 0);
  objc_storeStrong((id *)&self->_userAssignedName, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
