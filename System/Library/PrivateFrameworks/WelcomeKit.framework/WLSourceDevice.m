@implementation WLSourceDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLSourceDevice)init
{
  WLSourceDevice *v2;
  WLSourceDevice *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WLSourceDevice;
  v2 = -[WLSourceDevice init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WLSourceDevice setIsSelectingDataTypeInHandshake:](v2, "setIsSelectingDataTypeInHandshake:", 0);
    -[WLSourceDevice setUseMigrationKit:](v3, "setUseMigrationKit:", 0);
    -[WLSourceDevice setApi:](v3, "setApi:", CFSTR("1"));
    -[WLSourceDevice setApiLevel:](v3, "setApiLevel:", CFSTR("?"));
    -[WLSourceDevice setBrand:](v3, "setBrand:", CFSTR("?"));
    -[WLSourceDevice setLocale:](v3, "setLocale:", CFSTR("?"));
    -[WLSourceDevice setModel:](v3, "setModel:", CFSTR("?"));
    -[WLSourceDevice setOsVersion:](v3, "setOsVersion:", CFSTR("?"));
    -[WLSourceDevice setVersion:](v3, "setVersion:", CFSTR("?"));
    -[WLSourceDevice setVersionCode:](v3, "setVersionCode:", CFSTR("?"));
  }
  return v3;
}

- (WLSourceDevice)initWithCoder:(id)a3
{
  id v4;
  WLSourceDevice *v5;
  uint64_t v6;
  NSString *ipAddress;
  uint64_t v8;
  NSString *persistentIdentifier;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *osAPIVersion;
  uint64_t v14;
  NSString *hardwareBrand;
  uint64_t v16;
  NSString *hardwareModel;
  uint64_t v18;
  NSString *hardwareDesign;
  uint64_t v20;
  NSString *hardwareMaker;
  uint64_t v22;
  NSString *clientVersion;
  uint64_t v24;
  NSString *apiLevel;
  uint64_t v26;
  NSString *brand;
  uint64_t v28;
  NSString *locale;
  uint64_t v30;
  NSString *model;
  uint64_t v32;
  NSString *osVersion;
  uint64_t v34;
  NSString *version;
  uint64_t v36;
  NSString *versionCode;

  v4 = a3;
  v5 = -[WLSourceDevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ipAddress"));
    v6 = objc_claimAutoreleasedReturnValue();
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v6;

    v5->_httpPort = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_httpPort"));
    v5->_socketPort = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_socketPort"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_persistentIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v8;

    v5->_isLocal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isLocal"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_osAPIVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    osAPIVersion = v5->_osAPIVersion;
    v5->_osAPIVersion = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareBrand"));
    v14 = objc_claimAutoreleasedReturnValue();
    hardwareBrand = v5->_hardwareBrand;
    v5->_hardwareBrand = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareModel"));
    v16 = objc_claimAutoreleasedReturnValue();
    hardwareModel = v5->_hardwareModel;
    v5->_hardwareModel = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareDesign"));
    v18 = objc_claimAutoreleasedReturnValue();
    hardwareDesign = v5->_hardwareDesign;
    v5->_hardwareDesign = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hardwareMaker"));
    v20 = objc_claimAutoreleasedReturnValue();
    hardwareMaker = v5->_hardwareMaker;
    v5->_hardwareMaker = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientVersion"));
    v22 = objc_claimAutoreleasedReturnValue();
    clientVersion = v5->_clientVersion;
    v5->_clientVersion = (NSString *)v22;

    v5->_isSelectingDataTypeInHandshake = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSelectingDataTypeInHandshake"));
    v5->_useMigrationKit = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_useMigrationKit"));
    v5->_supportsFileLength = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsFileLength"));
    v5->_canAddDisplay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canAddDisplay"));
    v5->_canAddAccessibility = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canAddAccessibility"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_apiLevel"));
    v24 = objc_claimAutoreleasedReturnValue();
    apiLevel = v5->_apiLevel;
    v5->_apiLevel = (NSString *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_brand"));
    v26 = objc_claimAutoreleasedReturnValue();
    brand = v5->_brand;
    v5->_brand = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_locale"));
    v28 = objc_claimAutoreleasedReturnValue();
    locale = v5->_locale;
    v5->_locale = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_model"));
    v30 = objc_claimAutoreleasedReturnValue();
    model = v5->_model;
    v5->_model = (NSString *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_osVersion"));
    v32 = objc_claimAutoreleasedReturnValue();
    osVersion = v5->_osVersion;
    v5->_osVersion = (NSString *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_version"));
    v34 = objc_claimAutoreleasedReturnValue();
    version = v5->_version;
    v5->_version = (NSString *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_versionCode"));
    v36 = objc_claimAutoreleasedReturnValue();
    versionCode = v5->_versionCode;
    v5->_versionCode = (NSString *)v36;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *ipAddress;
  id v5;

  ipAddress = self->_ipAddress;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ipAddress, CFSTR("_ipAddress"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_httpPort, CFSTR("_httpPort"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_socketPort, CFSTR("_socketPort"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_persistentIdentifier, CFSTR("_persistentIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocal, CFSTR("_isLocal"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osAPIVersion, CFSTR("_osAPIVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareBrand, CFSTR("_hardwareBrand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareModel, CFSTR("_hardwareModel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareDesign, CFSTR("_hardwareDesign"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardwareMaker, CFSTR("_hardwareMaker"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientVersion, CFSTR("_clientVersion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSelectingDataTypeInHandshake, CFSTR("_isSelectingDataTypeInHandshake"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_useMigrationKit, CFSTR("_useMigrationKit"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsFileLength, CFSTR("_supportsFileLength"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canAddDisplay, CFSTR("_canAddDisplay"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canAddAccessibility, CFSTR("_canAddAccessibility"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apiLevel, CFSTR("_apiLevel"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_brand, CFSTR("_brand"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("_locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("_model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_osVersion, CFSTR("_osVersion"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_version, CFSTR("_version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_versionCode, CFSTR("_versionCode"));

}

- (NSString)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (void)setIpAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unsigned)socketPort
{
  return self->_socketPort;
}

- (void)setSocketPort:(unsigned __int16)a3
{
  self->_socketPort = a3;
}

- (unsigned)httpPort
{
  return self->_httpPort;
}

- (void)setHttpPort:(unsigned __int16)a3
{
  self->_httpPort = a3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (BOOL)isSelectingDataTypeInHandshake
{
  return self->_isSelectingDataTypeInHandshake;
}

- (void)setIsSelectingDataTypeInHandshake:(BOOL)a3
{
  self->_isSelectingDataTypeInHandshake = a3;
}

- (BOOL)useMigrationKit
{
  return self->_useMigrationKit;
}

- (void)setUseMigrationKit:(BOOL)a3
{
  self->_useMigrationKit = a3;
}

- (BOOL)supportsFileLength
{
  return self->_supportsFileLength;
}

- (void)setSupportsFileLength:(BOOL)a3
{
  self->_supportsFileLength = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)osAPIVersion
{
  return self->_osAPIVersion;
}

- (void)setOsAPIVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)hardwareBrand
{
  return self->_hardwareBrand;
}

- (void)setHardwareBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)hardwareModel
{
  return self->_hardwareModel;
}

- (void)setHardwareModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)hardwareDesign
{
  return self->_hardwareDesign;
}

- (void)setHardwareDesign:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)hardwareMaker
{
  return self->_hardwareMaker;
}

- (void)setHardwareMaker:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)hardwareProduct
{
  return self->_hardwareProduct;
}

- (void)setHardwareProduct:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)canAddDisplay
{
  return self->_canAddDisplay;
}

- (void)setCanAddDisplay:(BOOL)a3
{
  self->_canAddDisplay = a3;
}

- (BOOL)canAddAccessibility
{
  return self->_canAddAccessibility;
}

- (void)setCanAddAccessibility:(BOOL)a3
{
  self->_canAddAccessibility = a3;
}

- (BOOL)canAddFiles
{
  return self->_canAddFiles;
}

- (void)setCanAddFiles:(BOOL)a3
{
  self->_canAddFiles = a3;
}

- (NSString)apiLevel
{
  return self->_apiLevel;
}

- (void)setApiLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)versionCode
{
  return self->_versionCode;
}

- (void)setVersionCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionCode, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_apiLevel, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_hardwareProduct, 0);
  objc_storeStrong((id *)&self->_hardwareMaker, 0);
  objc_storeStrong((id *)&self->_hardwareDesign, 0);
  objc_storeStrong((id *)&self->_hardwareModel, 0);
  objc_storeStrong((id *)&self->_hardwareBrand, 0);
  objc_storeStrong((id *)&self->_osAPIVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_api, 0);
}

@end
