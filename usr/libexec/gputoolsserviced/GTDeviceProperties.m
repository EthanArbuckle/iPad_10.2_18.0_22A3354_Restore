@implementation GTDeviceProperties

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)hardwareUUID
{
  int v2;
  id v3;
  timespec v5;
  uuid_t v6;

  memset(v6, 0, sizeof(v6));
  v5.tv_sec = 0;
  v5.tv_nsec = 0;
  v2 = gethostuuid(v6, &v5);
  v3 = 0;
  if (!v2)
    v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v6);
  return v3;
}

+ (id)uniqueDeviceID
{
  return (id)MGCopyAnswer(CFSTR("ProvisioningUniqueDeviceID"), 0);
}

- (GTDeviceProperties)initWithXPCObject:(id)a3
{
  id v4;
  GTDeviceProperties *v5;
  const char *string;
  const char *v7;
  uint64_t v8;
  NSString *OSVersion;
  const char *v10;
  const char *v11;
  uint64_t v12;
  NSString *BuildVersion;
  const char *v14;
  const char *v15;
  uint64_t v16;
  NSString *ProductType;
  const char *v18;
  const char *v19;
  uint64_t v20;
  NSString *HWModelStr;
  const char *v22;
  const char *v23;
  uint64_t v24;
  NSString *UniqueDeviceID;
  const char *v26;
  const char *v27;
  uint64_t v28;
  NSString *Reality;
  const char *v30;
  const char *v31;
  uint64_t v32;
  NSString *CPUArchitecture;
  const char *v34;
  const char *v35;
  uint64_t v36;
  NSString *DeviceClass;
  const char *v38;
  const char *v39;
  uint64_t v40;
  NSString *MobileDeviceMinimumVersion;
  const char *v42;
  const char *v43;
  uint64_t v44;
  NSString *ProductName;
  const char *v46;
  const char *v47;
  uint64_t v48;
  NSString *ReleaseType;
  objc_super v51;

  v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)GTDeviceProperties;
  v5 = -[GTDeviceProperties init](&v51, "init");
  if (v5)
  {
    v5->_LocationID = xpc_dictionary_get_uint64(v4, "LocationID");
    string = xpc_dictionary_get_string(v4, "OSVersion");
    if (string)
      v7 = string;
    else
      v7 = "";
    v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v8;

    v10 = xpc_dictionary_get_string(v4, "BuildVersion");
    if (v10)
      v11 = v10;
    else
      v11 = "";
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v11));
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v12;

    v14 = xpc_dictionary_get_string(v4, "ProductType");
    if (v14)
      v15 = v14;
    else
      v15 = "";
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v16;

    v18 = xpc_dictionary_get_string(v4, "HWModel");
    if (v18)
      v19 = v18;
    else
      v19 = "";
    v20 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v19));
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v20;

    v22 = xpc_dictionary_get_string(v4, "UniqueDeviceID");
    if (v22)
      v23 = v22;
    else
      v23 = "";
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23));
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v24;

    v26 = xpc_dictionary_get_string(v4, "Reality");
    if (v26)
      v27 = v26;
    else
      v27 = "";
    v28 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v27));
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v28;

    v5->_RemoteXPCVersionFlags = xpc_dictionary_get_uint64(v4, "RemoteXPCVersionFlags");
    v30 = xpc_dictionary_get_string(v4, "CPUArchitecture");
    if (v30)
      v31 = v30;
    else
      v31 = "";
    v32 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31));
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v32;

    v34 = xpc_dictionary_get_string(v4, "DeviceClass");
    if (v34)
      v35 = v34;
    else
      v35 = "";
    v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v36;

    v38 = xpc_dictionary_get_string(v4, "MobileDeviceMinimumVersion");
    if (v38)
      v39 = v38;
    else
      v39 = "";
    v40 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v39));
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v40;

    v42 = xpc_dictionary_get_string(v4, "ProductName");
    if (v42)
      v43 = v42;
    else
      v43 = "";
    v44 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v43));
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v44;

    v46 = xpc_dictionary_get_string(v4, "ReleaseType");
    if (v46)
      v47 = v46;
    else
      v47 = "";
    v48 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v47));
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v48;

    v5->_AppleInternal = xpc_dictionary_get_BOOL(v4, "AppleInternal");
    v5->_DeviceSupportsLockdown = xpc_dictionary_get_BOOL(v4, "DeviceSupportsLockdown");
    v5->_EffectiveProductionStatusAp = xpc_dictionary_get_BOOL(v4, "EffectiveProductionStatusAp");
    v5->_IsUIBuild = xpc_dictionary_get_BOOL(v4, "IsUIBuild");
    v5->_OSInstallEnvironment = xpc_dictionary_get_BOOL(v4, "OSInstallEnvironment");
    v5->_StoreDemoMode = xpc_dictionary_get_BOOL(v4, "StoreDemoMode");
  }

  return v5;
}

- (GTDeviceProperties)initWithCoder:(id)a3
{
  id v4;
  GTDeviceProperties *v5;
  id v6;
  uint64_t v7;
  NSString *BuildVersion;
  id v9;
  uint64_t v10;
  NSString *HWModelStr;
  id v12;
  uint64_t v13;
  NSString *OSVersion;
  id v15;
  uint64_t v16;
  NSString *ProductType;
  id v18;
  uint64_t v19;
  NSString *UniqueDeviceID;
  id v21;
  uint64_t v22;
  NSString *Reality;
  id v24;
  uint64_t v25;
  NSString *CPUArchitecture;
  id v27;
  uint64_t v28;
  NSString *DeviceClass;
  id v30;
  uint64_t v31;
  NSString *MobileDeviceMinimumVersion;
  id v33;
  uint64_t v34;
  NSString *ProductName;
  id v36;
  uint64_t v37;
  NSString *ReleaseType;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)GTDeviceProperties;
  v5 = -[GTDeviceProperties init](&v40, "init");
  if (v5)
  {
    v5->_LocationID = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("LocationID"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("BuildVersion"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    BuildVersion = v5->_BuildVersion;
    v5->_BuildVersion = (NSString *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("HWModel"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    HWModelStr = v5->_HWModelStr;
    v5->_HWModelStr = (NSString *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("OSVersion"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    OSVersion = v5->_OSVersion;
    v5->_OSVersion = (NSString *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ProductType"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    ProductType = v5->_ProductType;
    v5->_ProductType = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("UniqueDeviceID"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    UniqueDeviceID = v5->_UniqueDeviceID;
    v5->_UniqueDeviceID = (NSString *)v19;

    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("Reality"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    Reality = v5->_Reality;
    v5->_Reality = (NSString *)v22;

    v5->_RemoteXPCVersionFlags = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("RemoteXPCVersionFlags"));
    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("CPUArchitecture"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    CPUArchitecture = v5->_CPUArchitecture;
    v5->_CPUArchitecture = (NSString *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("DeviceClass"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    DeviceClass = v5->_DeviceClass;
    v5->_DeviceClass = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("MobileDeviceMinimumVersion"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    MobileDeviceMinimumVersion = v5->_MobileDeviceMinimumVersion;
    v5->_MobileDeviceMinimumVersion = (NSString *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ProductName"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    ProductName = v5->_ProductName;
    v5->_ProductName = (NSString *)v34;

    v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("ReleaseType"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    ReleaseType = v5->_ReleaseType;
    v5->_ReleaseType = (NSString *)v37;

    v5->_AppleInternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AppleInternal"));
    v5->_DeviceSupportsLockdown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DeviceSupportsLockdown"));
    v5->_EffectiveProductionStatusAp = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EffectiveProductionStatusAp"));
    v5->_IsUIBuild = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsUIBuild"));
    v5->_OSInstallEnvironment = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OSInstallEnvironment"));
    v5->_StoreDemoMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("StoreDemoMode"));
  }

  return v5;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), self->_ProductName, self->_UniqueDeviceID);
}

- (id)initForEmbeddedSystem
{
  GTDeviceProperties *v2;
  id v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  int v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  CFArrayRef v11;
  const __CFDictionary *v12;
  GTDeviceProperties *v13;
  objc_super v15;
  size_t size;
  void *values[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;

  v15.receiver = self;
  v15.super_class = (Class)GTDeviceProperties;
  v2 = -[GTDeviceProperties init](&v15, "init");
  if (v2)
  {
    v3 = -[GTDeviceProperties setAppleInternal:](v2, "setAppleInternal:", os_variant_has_internal_content(0));
    v4 = (const __CFDictionary *)_CFCopySystemVersionDictionary(v3);
    if (v4)
    {
      v5 = v4;
      -[GTDeviceProperties setOsVersion:](v2, "setOsVersion:", CFDictionaryGetValue(v4, _kCFSystemVersionProductVersionKey));
      -[GTDeviceProperties setBuildVersion:](v2, "setBuildVersion:", CFDictionaryGetValue(v5, _kCFSystemVersionBuildVersionKey));
      -[GTDeviceProperties setProductName:](v2, "setProductName:", CFDictionaryGetValue(v5, _kCFSystemVersionProductNameKey));
      -[GTDeviceProperties setReleaseType:](v2, "setReleaseType:", CFDictionaryGetValue(v5, CFSTR("ReleaseType")));
      CFRelease(v5);
    }
    *__error() = 0;
    size = 128;
    v6 = sysctlbyname("kern.osversion", values, &size, 0, 0);
    if (!v6 || *__error() == 12)
    {
      if (size != 128 || *__error() != 12)
      {
        v8 = 0;
        v7 = values;
        if (v6)
          goto LABEL_13;
        goto LABEL_15;
      }
      if (!sysctlbyname("kern.osversion", 0, &size, 0, 0))
      {
        if (size >= 0x81)
        {
          v7 = malloc_type_malloc(size, 0x9ADD76BCuLL);
          v8 = v7;
          if (!sysctlbyname("kern.osversion", v7, &size, 0, 0))
            goto LABEL_15;
LABEL_13:
          v9 = 0;
          size = 0;
          goto LABEL_16;
        }
        v8 = 0;
        v7 = values;
LABEL_15:
        v9 = strdup((const char *)v7);
LABEL_16:
        free(v8);
        if (size)
        {
          if (!v9)
          {
LABEL_19:
            v19 = *(_OWORD *)off_100030C80;
            v20 = *(_OWORD *)off_100030C90;
            v21 = *(_OWORD *)off_100030CA0;
            v22 = CFSTR("re6Zb+zwFKJNlkQTUeT+/w");
            *(_OWORD *)values = *(_OWORD *)off_100030C60;
            v18 = *(_OWORD *)off_100030C70;
            v11 = CFArrayCreate(0, (const void **)values, 11, &kCFTypeArrayCallBacks);
            v12 = (const __CFDictionary *)MGCopyMultipleAnswers(v11, 0);
            CFRelease(v11);
            -[GTDeviceProperties setCpuArchitecture:](v2, "setCpuArchitecture:", CFDictionaryGetValue(v12, CFSTR("k7QIBwZJJOVw+Sej/8h8VA")));
            -[GTDeviceProperties setCpuArchitecture:](v2, "setCpuArchitecture:", CFDictionaryGetValue(v12, CFSTR("k7QIBwZJJOVw+Sej/8h8VA")));
            -[GTDeviceProperties setDeviceClass:](v2, "setDeviceClass:", CFDictionaryGetValue(v12, CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA")));
            -[GTDeviceProperties setDeviceSupportsLockdown:](v2, "setDeviceSupportsLockdown:", MGGetBoolAnswer(CFSTR("7ZipyD32hkjOUTl66Q8REw")));
            -[GTDeviceProperties setEffectiveProductionStatusAp:](v2, "setEffectiveProductionStatusAp:", MGGetBoolAnswer(CFSTR("AQiIpW0UeYQKnhy2da7AXg")));
            -[GTDeviceProperties setHardwareModel:](v2, "setHardwareModel:", CFDictionaryGetValue(v12, CFSTR("/YYygAofPDbhrwToVsXdeA")));
            -[GTDeviceProperties setIsUIBuild:](v2, "setIsUIBuild:", MGGetBoolAnswer(CFSTR("I32sGclpgl5VujQRJxyhKQ")));
            -[GTDeviceProperties setMobileDeviceMinimumVersion:](v2, "setMobileDeviceMinimumVersion:", CFDictionaryGetValue(v12, CFSTR("k+KTni1jrwErpcDMEnn3aw")));
            -[GTDeviceProperties setProductName:](v2, "setProductName:", CFDictionaryGetValue(v12, CFSTR("ivIu8YTDnBSrYv/SN4G8Ag")));
            -[GTDeviceProperties setProductType:](v2, "setProductType:", CFDictionaryGetValue(v12, CFSTR("h9jDsbgj7xIVeIQ8S3/X3Q")));
            -[GTDeviceProperties setReleaseType:](v2, "setReleaseType:", CFDictionaryGetValue(v12, CFSTR("9UCjT7Qfi4xLVvPAKIzTCQ")));
            -[GTDeviceProperties setUniqueDeviceID:](v2, "setUniqueDeviceID:", CFDictionaryGetValue(v12, CFSTR("re6Zb+zwFKJNlkQTUeT+/w")));
            CFRelease(v12);
            -[GTDeviceProperties setOsInstallEnvironment:](v2, "setOsInstallEnvironment:", getenv("__OSINSTALL_ENVIRONMENT") != 0);
            v13 = v2;
            goto LABEL_20;
          }
LABEL_18:
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v9));
          -[GTDeviceProperties setBuildVersion:](v2, "setBuildVersion:", v10);

          free(v9);
          goto LABEL_19;
        }
LABEL_22:
        _os_assumes_log(0);
        if (!v9)
          goto LABEL_19;
        goto LABEL_18;
      }
    }
    v9 = 0;
    goto LABEL_22;
  }
LABEL_20:

  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t LocationID;
  id v5;

  LocationID = self->_LocationID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", LocationID, CFSTR("LocationID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_BuildVersion, CFSTR("BuildVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_HWModelStr, CFSTR("HWModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_OSVersion, CFSTR("OSVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ProductType, CFSTR("ProductType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_UniqueDeviceID, CFSTR("UniqueDeviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_Reality, CFSTR("Reality"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_RemoteXPCVersionFlags, CFSTR("RemoteXPCVersionFlags"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_CPUArchitecture, CFSTR("CPUArchitecture"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_DeviceClass, CFSTR("DeviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_MobileDeviceMinimumVersion, CFSTR("MobileDeviceMinimumVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ProductName, CFSTR("ProductName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ReleaseType, CFSTR("ReleaseType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_AppleInternal, CFSTR("AppleInternal"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_DeviceSupportsLockdown, CFSTR("DeviceSupportsLockdown"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_EffectiveProductionStatusAp, CFSTR("EffectiveProductionStatusAp"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_IsUIBuild, CFSTR("IsUIBuild"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_OSInstallEnvironment, CFSTR("OSInstallEnvironment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_StoreDemoMode, CFSTR("StoreDemoMode"));

}

- (unint64_t)locationID
{
  return self->_LocationID;
}

- (void)setLocationID:(unint64_t)a3
{
  self->_LocationID = a3;
}

- (NSString)buildVersion
{
  return self->_BuildVersion;
}

- (void)setBuildVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)hardwareModel
{
  return self->_HWModelStr;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)osVersion
{
  return self->_OSVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)productType
{
  return self->_ProductType;
}

- (void)setProductType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)uniqueDeviceID
{
  return self->_UniqueDeviceID;
}

- (void)setUniqueDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)reality
{
  return self->_Reality;
}

- (void)setReality:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (unint64_t)remoteXPCVersionFlags
{
  return self->_RemoteXPCVersionFlags;
}

- (void)setRemoteXPCVersionFlags:(unint64_t)a3
{
  self->_RemoteXPCVersionFlags = a3;
}

- (NSString)cpuArchitecture
{
  return self->_CPUArchitecture;
}

- (void)setCpuArchitecture:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)deviceClass
{
  return self->_DeviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)mobileDeviceMinimumVersion
{
  return self->_MobileDeviceMinimumVersion;
}

- (void)setMobileDeviceMinimumVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)productName
{
  return self->_ProductName;
}

- (void)setProductName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)releaseType
{
  return self->_ReleaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)appleInternal
{
  return self->_AppleInternal;
}

- (void)setAppleInternal:(BOOL)a3
{
  self->_AppleInternal = a3;
}

- (BOOL)deviceSupportsLockdown
{
  return self->_DeviceSupportsLockdown;
}

- (void)setDeviceSupportsLockdown:(BOOL)a3
{
  self->_DeviceSupportsLockdown = a3;
}

- (BOOL)effectiveProductionStatusAp
{
  return self->_EffectiveProductionStatusAp;
}

- (void)setEffectiveProductionStatusAp:(BOOL)a3
{
  self->_EffectiveProductionStatusAp = a3;
}

- (BOOL)isUIBuild
{
  return self->_IsUIBuild;
}

- (void)setIsUIBuild:(BOOL)a3
{
  self->_IsUIBuild = a3;
}

- (BOOL)osInstallEnvironment
{
  return self->_OSInstallEnvironment;
}

- (void)setOsInstallEnvironment:(BOOL)a3
{
  self->_OSInstallEnvironment = a3;
}

- (BOOL)storeDemoMode
{
  return self->_StoreDemoMode;
}

- (void)setStoreDemoMode:(BOOL)a3
{
  self->_StoreDemoMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ReleaseType, 0);
  objc_storeStrong((id *)&self->_ProductName, 0);
  objc_storeStrong((id *)&self->_MobileDeviceMinimumVersion, 0);
  objc_storeStrong((id *)&self->_DeviceClass, 0);
  objc_storeStrong((id *)&self->_CPUArchitecture, 0);
  objc_storeStrong((id *)&self->_Reality, 0);
  objc_storeStrong((id *)&self->_UniqueDeviceID, 0);
  objc_storeStrong((id *)&self->_ProductType, 0);
  objc_storeStrong((id *)&self->_OSVersion, 0);
  objc_storeStrong((id *)&self->_HWModelStr, 0);
  objc_storeStrong((id *)&self->_BuildVersion, 0);
}

@end
