@implementation ICDeviceInfo

- (NSString)productPlatform
{
  void *v3;
  __CFString *v4;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productPlatformOverride");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[ICDeviceInfo isWatch](self, "isWatch"))
    {
      v4 = CFSTR("watchOS");
    }
    else if (-[ICDeviceInfo isMac](self, "isMac"))
    {
      v4 = CFSTR("macOS");
    }
    else if (-[ICDeviceInfo isAppleTV](self, "isAppleTV"))
    {
      v4 = CFSTR("tvOS");
    }
    else
    {
      v4 = CFSTR("iOS");
    }
  }
  return (NSString *)v4;
}

- (BOOL)supportsMultipleITunesAccounts
{
  return -[ICDeviceInfo isAppleTV](self, "isAppleTV") || -[ICDeviceInfo isAudioAccessory](self, "isAudioAccessory");
}

- (NSString)currentLocale
{
  NSString *currentLocale;
  NSString *v4;
  NSString *v5;

  currentLocale = self->_currentLocale;
  if (!currentLocale)
  {
    v4 = (NSString *)CFPreferencesCopyValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x1E0C9B228], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v5 = self->_currentLocale;
    self->_currentLocale = v4;

    currentLocale = self->_currentLocale;
  }
  return currentLocale;
}

- (BOOL)isAppleTV
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 4;
}

+ (ICDeviceInfo)currentDeviceInfo
{
  if (currentDeviceInfo_onceToken != -1)
    dispatch_once(&currentDeviceInfo_onceToken, &__block_literal_global_12323);
  return (ICDeviceInfo *)(id)currentDeviceInfo___deviceInfo;
}

- (BOOL)isWatch
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 6;
}

- (BOOL)isMac
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 9;
}

- (int)_gestaltDeviceClass
{
  int result;
  NSObject *v4;
  uint8_t v5[16];

  result = self->_deviceClass;
  if (result == -1)
  {
    result = MGGetSInt32Answer();
    self->_deviceClass = result;
    if (result == -1)
    {
      v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "Failed to obtain device class from MobileGestalt", v5, 2u);
      }

      return self->_deviceClass;
    }
  }
  return result;
}

- (BOOL)isInternalBuild
{
  NSNumber *isInternalBuildNumber;
  NSNumber *v4;
  NSNumber *v5;

  isInternalBuildNumber = self->_isInternalBuildNumber;
  if (!isInternalBuildNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_isInternalBuildNumber;
    self->_isInternalBuildNumber = v4;

    isInternalBuildNumber = self->_isInternalBuildNumber;
  }
  return -[NSNumber BOOLValue](isInternalBuildNumber, "BOOLValue");
}

- (BOOL)isIPhone
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 1;
}

- (NSString)buildVersion
{
  NSString *buildVersion;
  NSString *v4;
  NSString *v5;

  buildVersion = self->_buildVersion;
  if (!buildVersion)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_buildVersion;
    self->_buildVersion = v4;

    buildVersion = self->_buildVersion;
  }
  return buildVersion;
}

- (NSString)deviceModel
{
  void *v3;
  NSString *v4;
  NSString *deviceModel;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceModelOverride");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  deviceModel = v4;
  if (!v4)
  {
    deviceModel = self->_deviceModel;
    if (!deviceModel)
    {
      v6 = (NSString *)MGCopyAnswer();
      v7 = self->_deviceModel;
      self->_deviceModel = v6;

      deviceModel = self->_deviceModel;
    }
  }
  v8 = deviceModel;

  return v8;
}

- (NSString)productVersion
{
  void *v3;
  NSString *v4;
  NSString *productVersion;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "productVersionOverride");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  productVersion = v4;
  if (!v4)
  {
    productVersion = self->_productVersion;
    if (!productVersion)
    {
      v6 = (void *)_CFCopySystemVersionDictionary();
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9ABB0]);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      v8 = self->_productVersion;
      self->_productVersion = v7;

      productVersion = self->_productVersion;
    }
  }
  v9 = productVersion;

  return v9;
}

- (NSString)hardwarePlatform
{
  void *v3;
  NSString *v4;
  NSString *hardwarePlatform;
  NSString *v6;
  NSString *v7;
  NSString *v8;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hardwarePlatformOverride");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  hardwarePlatform = v4;
  if (!v4)
  {
    hardwarePlatform = self->_hardwarePlatform;
    if (!hardwarePlatform)
    {
      v6 = (NSString *)MGCopyAnswer();
      v7 = self->_hardwarePlatform;
      self->_hardwarePlatform = v6;

      hardwarePlatform = self->_hardwarePlatform;
    }
  }
  v8 = hardwarePlatform;

  return v8;
}

- (unsigned)fairPlayDeviceType
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int *p_fairPlayDeviceType;
  unsigned int fairPlayDeviceType;
  int v9;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fairPlayDeviceTypeOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v4, "unsignedIntValue");
  }
  else
  {
    fairPlayDeviceType = self->_fairPlayDeviceType;
    p_fairPlayDeviceType = &self->_fairPlayDeviceType;
    v5 = fairPlayDeviceType;
    if (!fairPlayDeviceType)
    {
      v9 = 0;
      CjHbHx((uint64_t)p_fairPlayDeviceType, (uint64_t)&v9);
      v5 = *p_fairPlayDeviceType;
    }
  }

  return v5;
}

- (int)deviceClass
{
  void *v3;
  void *v4;
  int v5;
  int v6;

  +[ICDefaults standardDefaults](ICDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceClassOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "intValue");
  else
    v5 = -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass");
  v6 = v5;

  return v6;
}

- (NSString)rawDeviceModel
{
  NSString *rawDeviceModel;
  NSString *v4;
  NSString *v5;

  rawDeviceModel = self->_rawDeviceModel;
  if (!rawDeviceModel)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_rawDeviceModel;
    self->_rawDeviceModel = v4;

    rawDeviceModel = self->_rawDeviceModel;
  }
  return rawDeviceModel;
}

- (BOOL)hasWiFiCapability
{
  NSNumber *hasWiFiCapabilityValue;
  NSNumber *v4;
  NSNumber *v5;

  hasWiFiCapabilityValue = self->_hasWiFiCapabilityValue;
  if (!hasWiFiCapabilityValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hasWiFiCapabilityValue;
    self->_hasWiFiCapabilityValue = v4;

    hasWiFiCapabilityValue = self->_hasWiFiCapabilityValue;
  }
  return -[NSNumber BOOLValue](hasWiFiCapabilityValue, "BOOLValue");
}

void __33__ICDeviceInfo_currentDeviceInfo__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ICDeviceInfo _init]([ICDeviceInfo alloc], "_init");
  v1 = (void *)currentDeviceInfo___deviceInfo;
  currentDeviceInfo___deviceInfo = (uint64_t)v0;

}

- (id)_init
{
  ICDeviceInfo *v2;
  ICDeviceInfo *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *deviceNameUpdateQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICDeviceInfo;
  v2 = -[ICDeviceInfo init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_deviceClass = -1;
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.iTunesCloud.ICDeviceInfo.deviceNameUpdateQueue", v4);
    deviceNameUpdateQueue = v3->_deviceNameUpdateQueue;
    v3->_deviceNameUpdateQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (BOOL)isAudioAccessory
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 7;
}

- (BOOL)hasCellularDataCapability
{
  NSNumber *hasCellularDataCapabilityNumber;
  NSNumber *v4;
  NSNumber *v5;

  hasCellularDataCapabilityNumber = self->_hasCellularDataCapabilityNumber;
  if (!hasCellularDataCapabilityNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hasCellularDataCapabilityNumber;
    self->_hasCellularDataCapabilityNumber = v4;

    hasCellularDataCapabilityNumber = self->_hasCellularDataCapabilityNumber;
  }
  return -[NSNumber BOOLValue](hasCellularDataCapabilityNumber, "BOOLValue");
}

- (BOOL)isPhoneNumberAccessRestricted
{
  NSNumber *isPhoneNumberAccessRestrictedValue;
  NSNumber *v4;
  NSNumber *v5;

  isPhoneNumberAccessRestrictedValue = self->_isPhoneNumberAccessRestrictedValue;
  if (!isPhoneNumberAccessRestrictedValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_isPhoneNumberAccessRestrictedValue;
    self->_isPhoneNumberAccessRestrictedValue = v4;

    isPhoneNumberAccessRestrictedValue = self->_isPhoneNumberAccessRestrictedValue;
  }
  return -[NSNumber BOOLValue](isPhoneNumberAccessRestrictedValue, "BOOLValue");
}

- (BOOL)isROSDevice
{
  return 0;
}

- (BOOL)supportsSideLoadedMediaContent
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") - 1 < 3;
}

- (NSString)deviceGUID
{
  os_unfair_lock_s *p_lock;
  NSString *deviceGUID;
  NSString *v5;
  NSString *v6;
  NSString *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  deviceGUID = self->_deviceGUID;
  if (!deviceGUID)
  {
    v5 = (NSString *)MGCopyAnswer();
    v6 = self->_deviceGUID;
    self->_deviceGUID = v5;

    deviceGUID = self->_deviceGUID;
  }
  v7 = deviceGUID;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (NSString)deviceName
{
  if (deviceName_onceToken != -1)
    dispatch_once(&deviceName_onceToken, &__block_literal_global_38);
  return (NSString *)(id)deviceName_deviceName;
}

- (NSString)deviceClassName
{
  NSString *deviceClassName;
  NSString *v4;
  NSString *v5;
  __CFString *v6;

  deviceClassName = self->_deviceClassName;
  if (!deviceClassName)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_deviceClassName;
    self->_deviceClassName = v4;

    deviceClassName = self->_deviceClassName;
  }
  if (deviceClassName)
    v6 = (__CFString *)deviceClassName;
  else
    v6 = CFSTR("unknown");
  return (NSString *)v6;
}

void __26__ICDeviceInfo_deviceName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)deviceName_deviceName;
  deviceName_deviceName = v0;

  if (!deviceName_deviceName)
  {
    deviceName_deviceName = (uint64_t)CFSTR("Unknown");

  }
}

- (NSString)name
{
  NSObject *deviceNameUpdateQueue;
  id v4;
  NSObject *v6;
  _QWORD v7[6];
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if ((objc_msgSend(MEMORY[0x1E0D4D070], "hasBoolEntitlement:", CFSTR("com.apple.developer.device-information.user-assigned-device-name")) & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__12298;
    v12 = __Block_byref_object_dispose__12299;
    v13 = 0;
    deviceNameUpdateQueue = self->_deviceNameUpdateQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __20__ICDeviceInfo_name__block_invoke;
    v7[3] = &unk_1E4391568;
    v7[4] = self;
    v7[5] = buf;
    dispatch_sync(deviceNameUpdateQueue, v7);
    v4 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);

    return (NSString *)v4;
  }
  else
  {
    v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_ERROR, "User assigned name requested without entitlement. Returning generic device name.", buf, 2u);
    }

    -[ICDeviceInfo deviceName](self, "deviceName");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)dealloc
{
  atomic_flag *p_hasRegisteredForNameNotifications;
  unsigned __int8 v4;
  objc_super v5;

  p_hasRegisteredForNameNotifications = &self->_hasRegisteredForNameNotifications;
  do
    v4 = __ldaxr((unsigned __int8 *)p_hasRegisteredForNameNotifications);
  while (__stlxr(1u, (unsigned __int8 *)p_hasRegisteredForNameNotifications));
  if ((v4 & 1) != 0 && self->_nameNotificationToken)
    MGCancelNotifications();
  v5.receiver = self;
  v5.super_class = (Class)ICDeviceInfo;
  -[ICDeviceInfo dealloc](&v5, sel_dealloc);
}

- (NSString)systemReleaseType
{
  NSString *systemReleaseType;
  NSString *v4;
  NSString *v5;

  systemReleaseType = self->_systemReleaseType;
  if (!systemReleaseType)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_systemReleaseType;
    self->_systemReleaseType = v4;

    systemReleaseType = self->_systemReleaseType;
  }
  return systemReleaseType;
}

- (NSData)deviceFairPlayGUIDData
{
  NSData *deviceGUIDData;
  char *v4;
  char *v5;
  int v6;
  NSData *v7;
  NSData *v8;
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  deviceGUIDData = self->_deviceGUIDData;
  if (!deviceGUIDData)
  {
    -[ICDeviceInfo deviceGUID](self, "deviceGUID");
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      memset(v10, 0, 24);
      ICFairPlayGetHardwareInfoFromDeviceUDID(v4, (uint64_t)v10);
      if (!v6)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)v10 + 4, LODWORD(v10[0]));
        v7 = (NSData *)objc_claimAutoreleasedReturnValue();
        v8 = self->_deviceGUIDData;
        self->_deviceGUIDData = v7;

      }
    }

    deviceGUIDData = self->_deviceGUIDData;
  }
  return deviceGUIDData;
}

- (NSString)serialNumber
{
  NSString *serialNumber;
  NSString *v4;
  NSString *v5;

  serialNumber = self->_serialNumber;
  if (!serialNumber)
  {
    v4 = (NSString *)MGCopyAnswer();
    v5 = self->_serialNumber;
    self->_serialNumber = v4;

    serialNumber = self->_serialNumber;
  }
  return serialNumber;
}

- (NSString)macAddress
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  -[ICDeviceInfo macAddressData](self, "macAddressData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_retainAutorelease(v2);
    v5 = objc_msgSend(v4, "bytes");
    if (objc_msgSend(v4, "length"))
    {
      v6 = 0;
      do
        objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), *(unsigned __int8 *)(v5 + v6++));
      while (objc_msgSend(v4, "length") > v6);
    }
    v7 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v7 = 0;
  }

  return (NSString *)v7;
}

- (NSData)macAddressData
{
  int EthernetInterfacesMatchingBSDName;
  int FirstEthernetAddress;
  NSData *macAddressData;
  const char *v6;
  int v7;
  NSData *v8;
  int v10;
  __int16 v11;
  uint8_t buf[4];
  __int16 v13;
  io_iterator_t v14;

  if (!self->_macAddressData)
  {
    if (!-[ICDeviceInfo isMac](self, "isMac"))
    {
      macAddressData = (NSData *)os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (!os_log_type_enabled(&macAddressData->super, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        return self->_macAddressData;
      }
      *(_WORD *)buf = 0;
      v6 = "Getting MAC address is not supported on this platform";
LABEL_13:
      _os_log_impl(&dword_1A03E3000, &macAddressData->super, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_20;
    }
    v11 = 0;
    v10 = 0;
    v14 = 0;
    v13 = 0;
    *(_DWORD *)buf = 0;
    EthernetInterfacesMatchingBSDName = FindEthernetInterfacesMatchingBSDName(&v14, "en0");
    if (!EthernetInterfacesMatchingBSDName)
      EthernetInterfacesMatchingBSDName = GetFirstEthernetAddress(v14, 1, buf);
    IOObjectRelease(v14);
    v14 = 0;
    if (EthernetInterfacesMatchingBSDName)
    {
      FirstEthernetAddress = FindEthernetInterfacesMatchingBSDName(&v14, "en1");
      if (!FirstEthernetAddress)
        FirstEthernetAddress = GetFirstEthernetAddress(v14, 0, buf);
      IOObjectRelease(v14);
      v14 = 0;
      if (FirstEthernetAddress)
      {
        if (FindEthernetInterfacesMatchingBSDName(&v14, "en0"))
        {
          IOObjectRelease(v14);
          goto LABEL_15;
        }
        v7 = GetFirstEthernetAddress(v14, 0, buf);
        IOObjectRelease(v14);
        if (v7)
        {
LABEL_15:
          v10 = GetFirstInterfaceMACAddress_sMACAddress;
          v11 = word_1EE5A4455;
          if (GetFirstInterfaceMACAddress_sAddressIsValid != 1)
          {
            macAddressData = (NSData *)os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (!os_log_type_enabled(&macAddressData->super, OS_LOG_TYPE_DEFAULT))
              goto LABEL_20;
            *(_WORD *)buf = 0;
            v6 = "Failed to obtain device MAC address";
            goto LABEL_13;
          }
LABEL_19:
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v10, 6);
          v8 = (NSData *)objc_claimAutoreleasedReturnValue();
          macAddressData = self->_macAddressData;
          self->_macAddressData = v8;
          goto LABEL_20;
        }
      }
    }
    GetFirstInterfaceMACAddress_sAddressIsValid = 1;
    GetFirstInterfaceMACAddress_sMACAddress = *(_DWORD *)buf;
    word_1EE5A4455 = v13;
    v10 = *(_DWORD *)buf;
    v11 = v13;
    goto LABEL_19;
  }
  return self->_macAddressData;
}

- (CGSize)mainScreenSize
{
  double height;
  double width;
  void *v5;
  void *v6;
  float v7;
  float v8;
  CGSize result;

  height = self->_mainScreenSize.height;
  if (height == 0.0 || (width = self->_mainScreenSize.width, width == 0.0))
  {
    v5 = (void *)MGCopyAnswer();
    v6 = (void *)MGCopyAnswer();
    objc_msgSend(v5, "floatValue");
    self->_mainScreenSize.width = v7;
    objc_msgSend(v6, "floatValue");
    self->_mainScreenSize.height = v8;

    width = self->_mainScreenSize.width;
    height = self->_mainScreenSize.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)hasTelephonyCapability
{
  NSNumber *hasTelephonyCapabilityNumber;
  NSNumber *v4;
  NSNumber *v5;

  hasTelephonyCapabilityNumber = self->_hasTelephonyCapabilityNumber;
  if (!hasTelephonyCapabilityNumber)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hasTelephonyCapabilityNumber;
    self->_hasTelephonyCapabilityNumber = v4;

    hasTelephonyCapabilityNumber = self->_hasTelephonyCapabilityNumber;
  }
  return -[NSNumber BOOLValue](hasTelephonyCapabilityNumber, "BOOLValue");
}

- (BOOL)hasWAPICapability
{
  NSNumber *hasWAPICapabilityValue;
  NSNumber *v4;
  NSNumber *v5;

  hasWAPICapabilityValue = self->_hasWAPICapabilityValue;
  if (!hasWAPICapabilityValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_hasWAPICapabilityValue;
    self->_hasWAPICapabilityValue = v4;

    hasWAPICapabilityValue = self->_hasWAPICapabilityValue;
  }
  return -[NSNumber BOOLValue](hasWAPICapabilityValue, "BOOLValue");
}

- (BOOL)has720pCapability
{
  NSNumber *has720pCapabilityValue;
  NSNumber *v4;
  NSNumber *v5;

  has720pCapabilityValue = self->_has720pCapabilityValue;
  if (!has720pCapabilityValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_has720pCapabilityValue;
    self->_has720pCapabilityValue = v4;

    has720pCapabilityValue = self->_has720pCapabilityValue;
  }
  return -[NSNumber BOOLValue](has720pCapabilityValue, "BOOLValue");
}

- (BOOL)has1080pCapability
{
  NSNumber *has1080pCapabilityValue;
  NSNumber *v4;
  NSNumber *v5;

  has1080pCapabilityValue = self->_has1080pCapabilityValue;
  if (!has1080pCapabilityValue)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v5 = self->_has1080pCapabilityValue;
    self->_has1080pCapabilityValue = v4;

    has1080pCapabilityValue = self->_has1080pCapabilityValue;
  }
  return -[NSNumber BOOLValue](has1080pCapabilityValue, "BOOLValue");
}

- (int)screenClass
{
  NSNumber *screenClassValue;
  NSNumber *v4;
  NSNumber *v5;
  char v6;

  screenClassValue = self->_screenClassValue;
  if (!screenClassValue)
  {
    v4 = (NSNumber *)MGCopyAnswer();
    v5 = self->_screenClassValue;
    self->_screenClassValue = v4;

    v6 = objc_opt_respondsToSelector();
    screenClassValue = self->_screenClassValue;
    if ((v6 & 1) == 0)
    {
      self->_screenClassValue = (NSNumber *)&unk_1E43E66D0;

      screenClassValue = self->_screenClassValue;
    }
  }
  return -[NSNumber intValue](screenClassValue, "intValue");
}

- (BOOL)isIPad
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 3;
}

- (BOOL)isIPod
{
  return -[ICDeviceInfo _gestaltDeviceClass](self, "_gestaltDeviceClass") == 2;
}

- (BOOL)isSeedBuild
{
  return 0;
}

- (BOOL)supportsMusicStreaming
{
  NSNumber *supportsMusicStreamingValue;
  NSNumber *v4;
  NSNumber *v5;

  supportsMusicStreamingValue = self->_supportsMusicStreamingValue;
  if (!supportsMusicStreamingValue)
  {
    if (-[ICDeviceInfo isWatch](self, "isWatch"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", MGGetBoolAnswer());
      v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = (NSNumber *)MEMORY[0x1E0C9AAB0];
    }
    v5 = self->_supportsMusicStreamingValue;
    self->_supportsMusicStreamingValue = v4;

    supportsMusicStreamingValue = self->_supportsMusicStreamingValue;
  }
  return -[NSNumber BOOLValue](supportsMusicStreamingValue, "BOOLValue");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceNameUpdateQueue, 0);
  objc_storeStrong((id *)&self->_systemReleaseType, 0);
  objc_storeStrong((id *)&self->_supportsMusicStreamingValue, 0);
  objc_storeStrong((id *)&self->_isInternalBuildNumber, 0);
  objc_storeStrong((id *)&self->_screenClassValue, 0);
  objc_storeStrong((id *)&self->_isPhoneNumberAccessRestrictedValue, 0);
  objc_storeStrong((id *)&self->_has1080pCapabilityValue, 0);
  objc_storeStrong((id *)&self->_has720pCapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasWAPICapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasWiFiCapabilityValue, 0);
  objc_storeStrong((id *)&self->_hasTelephonyCapabilityNumber, 0);
  objc_storeStrong((id *)&self->_hasCellularDataCapabilityNumber, 0);
  objc_storeStrong((id *)&self->_macAddressData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceGUID, 0);
  objc_storeStrong((id *)&self->_deviceGUIDData, 0);
  objc_storeStrong((id *)&self->_currentLocale, 0);
  objc_storeStrong((id *)&self->_deviceClassName, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_hardwarePlatform, 0);
  objc_storeStrong((id *)&self->_rawDeviceModel, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
}

void __20__ICDeviceInfo_name__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned __int8 *v6;
  unsigned __int8 v7;
  uint64_t v8;
  NSObject *v9;
  __CFString *v10;
  _QWORD block[5];
  id v12;
  id location;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[14])
  {
    v3 = MGCopyAnswer();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;

    v6 = (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(1u, v6));
    v2 = *(_QWORD **)(a1 + 32);
    if ((v7 & 1) == 0)
    {
      objc_initWeak(&location, v2);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(NSObject **)(v8 + 240);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __20__ICDeviceInfo_name__block_invoke_2;
      block[3] = &unk_1E438EFD8;
      block[4] = v8;
      objc_copyWeak(&v12, &location);
      dispatch_async(v9, block);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
      v2 = *(_QWORD **)(a1 + 32);
    }
  }
  if (v2[14])
    v10 = (__CFString *)v2[14];
  else
    v10 = CFSTR("Unknown");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
}

void __20__ICDeviceInfo_name__block_invoke_2(uint64_t a1)
{
  id v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("UserAssignedDeviceName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  objc_copyWeak(&v2, (id *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = MGRegisterForUpdates();
  objc_destroyWeak(&v2);
}

void __20__ICDeviceInfo_name__block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[14];
    WeakRetained[14] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

@end
