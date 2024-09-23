@implementation RCDeviceInfo

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo preferredLanguages](self, "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, CFSTR("preferredLanguages"));

  -[RCDeviceInfo deviceType](self, "deviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, CFSTR("deviceType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RCDeviceInfo utcOffset](self, "utcOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, CFSTR("utcOffsetSecs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RCDeviceInfo dstOffset](self, "dstOffset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v7, CFSTR("dstOffsetSecs"));

  -[RCDeviceInfo appVersion](self, "appVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, CFSTR("appVersion"));

  -[RCDeviceInfo osVersion](self, "osVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v9, CFSTR("osVersion"));

  -[RCDeviceInfo countryCode](self, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v10, CFSTR("countryCode"));

  -[RCDeviceInfo formatVersion](self, "formatVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v11, CFSTR("formatVersion"));

  -[RCDeviceInfo seedNumber](self, "seedNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v12, CFSTR("seedNumber"));

  -[RCDeviceInfo buildNumber](self, "buildNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v13, CFSTR("buildNumber"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  if (RCIsInternalBuild_onceToken != -1)
    dispatch_once(&RCIsInternalBuild_onceToken, &__block_literal_global_7);
  objc_msgSend(v14, "numberWithBool:", RCIsInternalBuild_internalBuild);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v15, CFSTR("isInternal"));

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (NSArray)preferredLanguages
{
  return self->_preferredLanguages;
}

- (int64_t)utcOffset
{
  return self->_utcOffset;
}

- (NSString)seedNumber
{
  return self->_seedNumber;
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (NSString)formatVersion
{
  return self->_formatVersion;
}

- (int64_t)dstOffset
{
  return self->_dstOffset;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)buildNumber
{
  return self->_buildNumber;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_seedNumber, 0);
  objc_storeStrong((id *)&self->_formatVersion, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_preferredLanguages, 0);
}

+ (id)defaultDeviceInfo
{
  void *v3;
  void *v4;

  RCAppVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "defaultDeviceInfoWithAppVersion:formatVersion:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4 seedNumber:(id)a5 buildNumber:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  RCDeviceInfo *v18;
  void *v19;
  uint64_t v20;
  double v21;
  RCDeviceInfo *v22;
  void *v24;

  v9 = (void *)MEMORY[0x1E0C99E80];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v9, "localTimeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  RCDeviceOSVersion();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  RCDeviceModelString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "countryCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = [RCDeviceInfo alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v14, "secondsFromGMT");
  objc_msgSend(v14, "daylightSavingTimeOffset");
  v22 = -[RCDeviceInfo initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:seedNumber:buildNumber:](v18, "initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:seedNumber:buildNumber:", v19, v15, v20, (uint64_t)v21, v13, v24, v17, v12, v11, v10);

  return v22;
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3 formatVersion:(id)a4
{
  return (id)objc_msgSend(a1, "defaultDeviceInfoWithAppVersion:formatVersion:seedNumber:buildNumber:", a3, a4, 0, 0);
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10 seedNumber:(id)a11 buildNumber:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  RCDeviceInfo *v25;
  uint64_t v26;
  NSArray *preferredLanguages;
  uint64_t v28;
  NSString *deviceType;
  uint64_t v30;
  NSString *appVersion;
  uint64_t v32;
  NSString *osVersion;
  uint64_t v34;
  NSString *countryCode;
  uint64_t v36;
  NSString *formatVersion;
  uint64_t v38;
  NSString *seedNumber;
  uint64_t v40;
  NSString *buildNumber;
  id v43;
  objc_super v44;

  v43 = a3;
  v18 = a4;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v24 = a12;
  v44.receiver = self;
  v44.super_class = (Class)RCDeviceInfo;
  v25 = -[RCDeviceInfo init](&v44, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v43, "copy");
    preferredLanguages = v25->_preferredLanguages;
    v25->_preferredLanguages = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    deviceType = v25->_deviceType;
    v25->_deviceType = (NSString *)v28;

    v25->_utcOffset = a5;
    v25->_dstOffset = a6;
    v30 = objc_msgSend(v19, "copy");
    appVersion = v25->_appVersion;
    v25->_appVersion = (NSString *)v30;

    v32 = objc_msgSend(v20, "copy");
    osVersion = v25->_osVersion;
    v25->_osVersion = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    countryCode = v25->_countryCode;
    v25->_countryCode = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    formatVersion = v25->_formatVersion;
    v25->_formatVersion = (NSString *)v36;

    v38 = objc_msgSend(v23, "copy");
    seedNumber = v25->_seedNumber;
    v25->_seedNumber = (NSString *)v38;

    v40 = objc_msgSend(v24, "copy");
    buildNumber = v25->_buildNumber;
    v25->_buildNumber = (NSString *)v40;

  }
  return v25;
}

+ (id)defaultDeviceInfoWithAppVersion:(id)a3
{
  return (id)objc_msgSend(a1, "defaultDeviceInfoWithAppVersion:formatVersion:", a3, 0);
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  RCDeviceInfo *v18;
  void *v19;
  void *v20;
  RCDeviceInfo *v21;

  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = [RCDeviceInfo alloc];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "countryCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[RCDeviceInfo initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:](v18, "initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:", v17, v16, a5, a6, v15, v14, v20, 0);

  return v21;
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RCDeviceInfo *v21;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a4;
  v20 = a3;
  v21 = -[RCDeviceInfo initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:]([RCDeviceInfo alloc], "initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:", v20, v19, a5, a6, v18, v17, v16, 0);

  return v21;
}

- (RCDeviceInfo)initWithPreferredLanguages:(id)a3 deviceType:(id)a4 utcOffset:(int64_t)a5 dstOffset:(int64_t)a6 appVersion:(id)a7 osVersion:(id)a8 countryCode:(id)a9 formatVersion:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  RCDeviceInfo *v23;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a4;
  v22 = a3;
  v23 = -[RCDeviceInfo initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:seedNumber:buildNumber:]([RCDeviceInfo alloc], "initWithPreferredLanguages:deviceType:utcOffset:dstOffset:appVersion:osVersion:countryCode:formatVersion:seedNumber:buildNumber:", v22, v21, a5, a6, v20, v19, v18, v17, 0, 0);

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[RCDeviceInfo preferredLanguages](self, "preferredLanguages");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredLanguages");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[RCDeviceInfo deviceType](self, "deviceType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "deviceType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9)
        && (v10 = -[RCDeviceInfo utcOffset](self, "utcOffset"), v10 == objc_msgSend(v5, "utcOffset"))
        && (v11 = -[RCDeviceInfo dstOffset](self, "dstOffset"), v11 == objc_msgSend(v5, "dstOffset")))
      {
        -[RCDeviceInfo appVersion](self, "appVersion");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appVersion");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", v13))
        {
          -[RCDeviceInfo osVersion](self, "osVersion");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "osVersion");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "isEqualToString:"))
          {
            v30 = (void *)MEMORY[0x1E0CB3940];
            v32 = v14;
            -[RCDeviceInfo formatVersion](self, "formatVersion");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "formatVersion");
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = v30;
            v29 = (void *)v16;
            v31 = (void *)v15;
            if (objc_msgSend(v17, "rc_string:isEqualToString:", v15))
            {
              v27 = (void *)MEMORY[0x1E0CB3940];
              -[RCDeviceInfo seedNumber](self, "seedNumber");
              v18 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "seedNumber");
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = v27;
              v26 = (void *)v19;
              v28 = (void *)v18;
              if (objc_msgSend(v20, "rc_string:isEqualToString:", v18))
              {
                v25 = (void *)MEMORY[0x1E0CB3940];
                -[RCDeviceInfo buildNumber](self, "buildNumber");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "buildNumber");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v25, "rc_string:isEqualToString:", v24, v21);

              }
              else
              {
                v22 = 0;
              }
              v14 = v32;

            }
            else
            {
              v22 = 0;
              v14 = v32;
            }

          }
          else
          {
            v22 = 0;
          }

        }
        else
        {
          v22 = 0;
        }

      }
      else
      {
        v22 = 0;
      }

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  void *v21;

  -[RCDeviceInfo preferredLanguages](self, "preferredLanguages");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v21, "hash");
  -[RCDeviceInfo deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RCDeviceInfo utcOffset](self, "utcOffset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[RCDeviceInfo dstOffset](self, "dstOffset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[RCDeviceInfo appVersion](self, "appVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7 ^ v9 ^ objc_msgSend(v10, "hash");
  -[RCDeviceInfo osVersion](self, "osVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[RCDeviceInfo formatVersion](self, "formatVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[RCDeviceInfo seedNumber](self, "seedNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[RCDeviceInfo buildNumber](self, "buildNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  void *v15;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_opt_class();
  -[RCDeviceInfo preferredLanguages](self, "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo deviceType](self, "deviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RCDeviceInfo utcOffset](self, "utcOffset");
  v6 = -[RCDeviceInfo dstOffset](self, "dstOffset");
  -[RCDeviceInfo appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo osVersion](self, "osVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo formatVersion](self, "formatVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo seedNumber](self, "seedNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RCDeviceInfo buildNumber](self, "buildNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("<%@: %p; preferredLanguages: %@\n deviceType: %@\n utcOffset: %ld\n dstOffset: %ld\n appVersion: %@\n osVersion: %@\n formatVersion: %@\n seedNumber: %@\n buildNumber: %@>"),
    v14,
    self,
    v3,
    v4,
    v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

@end
