@implementation NFHardwareSecureElementInfo

- (NSString)rsaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_rsaCertificateAsData, "NF_asHexString");
}

- (NSString)ecdsaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_ecdsaCertificateAsData, "NF_asHexString");
}

- (NSString)eckaCertificate
{
  return (NSString *)-[NSData NF_asHexString](self->_eckaCertificateAsData, "NF_asHexString");
}

- (NSString)serialNumber
{
  return (NSString *)-[NSData NF_asHexString](self->_serialNumberAsData, "NF_asHexString");
}

- (NSString)systemOSSerialNumber
{
  return (NSString *)-[NSData NF_asHexString](self->_systemOSSerialNumberAsData, "NF_asHexString");
}

- (NFHardwareSecureElementInfo)initWithDictionary:(id)a3
{
  id v4;
  NFHardwareSecureElementInfo *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSNumber *compiledFWVersion;
  void *v13;
  void *v14;
  uint64_t v15;
  NSNumber *sequenceCounter;
  uint64_t v17;
  NSNumber *referenceCounter;
  void *v19;
  uint64_t v20;
  NSNumber *otherOSValid;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSNumber *migrationPackages;
  uint64_t v29;
  NSNumber *migrationInstances;
  void *v31;
  uint64_t v32;
  NSString *platformIdentifier;
  uint64_t v34;
  NSData *serialNumberAsData;
  uint64_t v36;
  NSData *systemOSSerialNumberAsData;
  uint64_t v38;
  NSData *rsaCertificateAsData;
  uint64_t v40;
  NSData *ecdsaCertificateAsData;
  uint64_t v42;
  NSData *eckaCertificateAsData;
  void *v44;
  uint64_t v45;
  NSNumber *persistentConfigID;
  uint64_t v47;
  NSData *manifestQuery;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSString *atrString;
  void *v54;
  objc_super v56;

  v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = -[NFHardwareSecureElementInfo init](&v56, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier")));
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OSVersion")));
    v5->_OSVersion = (unint64_t)objc_msgSend(v8, "unsignedIntegerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fullOSVersion")));
    v5->_fullOSVersion = (unint64_t)objc_msgSend(v9, "unsignedIntegerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firmwareVersion")));
    v5->_firmwareVersion = (unint64_t)objc_msgSend(v10, "unsignedIntegerValue");

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("compiledFWVersion")));
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hardwareVersion")));
    v5->_hardwareVersion = (unint64_t)objc_msgSend(v13, "unsignedIntegerValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceType")));
    v5->_deviceType = (unint64_t)objc_msgSend(v14, "unsignedIntegerValue");

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sequenceCounter")));
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v15;

    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("referenceCounter")));
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osid")));
    v5->_osid = (unint64_t)objc_msgSend(v19, "unsignedIntegerValue");

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherOSValid")));
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("restrictedMode")));
    v5->_restrictedMode = objc_msgSend(v22, "BOOLValue");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("osUpdateMode")));
    v5->_osUpdateMode = objc_msgSend(v23, "BOOLValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OSMode")));
    v5->_OSMode = (unint64_t)objc_msgSend(v24, "unsignedIntegerValue");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("signingKeyType")));
    v5->_signingKeyType = (unint64_t)objc_msgSend(v25, "unsignedIntegerValue");

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationState")));
    v5->_migrationState = (unint64_t)objc_msgSend(v26, "unsignedIntegerValue");

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationPackages")));
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v27;

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationInstances")));
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v29;

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("migrationContext")));
    v5->_migrationContext = (unint64_t)objc_msgSend(v31, "unsignedIntegerValue");

    v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platformIdentifier")));
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber")));
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v34;

    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("systemOSSerialNumber")));
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v36;

    v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rsaCertificate")));
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v38;

    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ecdsaCertificate")));
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v40;

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eckaCertificate")));
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v42;

    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("appletMap")));
    v5->_appletMap = (unint64_t)objc_msgSend(v44, "unsignedIntegerValue");

    v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("persistentConfigID")));
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v45;

    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("manifestQuery")));
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v47;

    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("personalisable")));
    v5->_personalisable = objc_msgSend(v49, "BOOLValue");

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportedTechnologies")));
    v5->_supportedTechnologies = (unint64_t)objc_msgSend(v50, "unsignedIntegerValue");

    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seType")));
    v5->_seType = (unint64_t)objc_msgSend(v51, "unsignedIntegerValue");

    v52 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("atrString")));
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("jcopTooOld")));
    v5->_jcopTooOld = objc_msgSend(v54, "BOOLValue");

  }
  return v5;
}

- (void)_setIsInRestrictedMode:(BOOL)a3
{
  self->_restrictedMode = a3;
}

- (void)_setIsInRestrictedPerformanceMode:(BOOL)a3
{
  self->_restrictedPerformanceMode = a3;
}

- (void)setBootHistory:(id)a3
{
  objc_storeStrong((id *)&self->_bootHistory, a3);
}

- (NSNumber)expectedSequenceCounter
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  int v13;
  NSNumber *v14;
  NSNumber *v15;
  NSNumber *v16;
  NSNumber *v17;
  NSNumber *v18;
  BOOL v19;
  NSNumber *v20;
  void *specific;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  objc_class *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  NSNumber *v38;
  NSNumber *v39;
  NSNumber *v40;
  NSNumber *v41;
  NSNumber *v42;
  NSNumber *v43;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NFTLV TLVWithData:](NFTLV, "TLVWithData:", self->_manifestQuery));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "childWithTag:", 65343));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childWithTag:", 135));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = -[NFHardwareSecureElementInfo signingKeyType](self, "signingKeyType");
    if ((id)-[NFHardwareSecureElementInfo seType](self, "seType") == (id)6
      && (id)-[NFHardwareSecureElementInfo deviceType](self, "deviceType") == (id)56)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFHardwareSecureElementInfo persistentConfigID](self, "persistentConfigID"));
      v11 = objc_msgSend(v10, "unsignedIntValue");

      if (HIBYTE(v11) == 80)
        v9 = 1;
    }
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value")));
    v13 = *(unsigned __int8 *)objc_msgSend(v12, "bytes");
    v14 = (NSNumber *)&off_1003037A0;
    if (v9 == 2)
    {
      v15 = (NSNumber *)&off_1003037A0;
      if (v13 != 210)
        v15 = 0;
      if (v13 != 200)
        v14 = v15;
      v16 = (NSNumber *)&off_1003037A0;
      v17 = (NSNumber *)&off_1003037B8;
      if (v13 != 115)
        v17 = 0;
      if (v13 != 100)
        v16 = v17;
      if (v13 <= 199)
        v14 = v16;
      v18 = (NSNumber *)&off_100303770;
      v19 = v13 == 56;
      v20 = (NSNumber *)&off_100303788;
    }
    else
    {
      v39 = (NSNumber *)&off_1003037A0;
      if (v13 != 210)
        v39 = 0;
      if (v13 != 200)
        v14 = v39;
      v40 = (NSNumber *)&off_1003037A0;
      v41 = (NSNumber *)&off_1003037B8;
      if (v13 != 115)
        v41 = 0;
      if (v13 != 100)
        v40 = v41;
      if (v13 <= 199)
        v14 = v40;
      v18 = (NSNumber *)&off_100303770;
      v19 = v13 == 56;
      v20 = (NSNumber *)&off_1003037D0;
    }
    if (!v19)
      v20 = 0;
    if (v13 != 55)
      v18 = v20;
    v42 = (NSNumber *)&off_100303758;
    v43 = (NSNumber *)&off_100303770;
    if (v13 != 54)
      v43 = 0;
    if (v13 != 44)
      v42 = v43;
    if (v13 <= 54)
      v18 = v42;
    if (v13 <= 99)
      v38 = v18;
    else
      v38 = v14;

  }
  else
  {
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    Logger = NFLogGetLogger(specific);
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSData debugDescription](self->_manifestQuery, "debugDescription"));
      v29 = 45;
      if (isMetaClass)
        v29 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", v29, ClassName, Name, 116, v28);

    }
    v30 = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    v31 = NFSharedLogGetLogger(v30);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = object_getClass(self);
      if (class_isMetaClass(v33))
        v34 = 43;
      else
        v34 = 45;
      v35 = object_getClassName(self);
      v36 = sel_getName(a2);
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSData debugDescription](self->_manifestQuery, "debugDescription"));
      *(_DWORD *)buf = 67110146;
      v46 = v34;
      v47 = 2082;
      v48 = v35;
      v49 = 2082;
      v50 = v36;
      v51 = 1024;
      v52 = 116;
      v53 = 2112;
      v54 = v37;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid manifest query %@", buf, 0x2Cu);

    }
    v38 = 0;
  }

  return v38;
}

- (NFHardwareSecureElementInfo)initWithCoder:(id)a3
{
  id v4;
  NFHardwareSecureElementInfo *v5;
  id v6;
  uint64_t v7;
  NSString *identifier;
  id v9;
  uint64_t v10;
  NSNumber *compiledFWVersion;
  id v12;
  uint64_t v13;
  NSNumber *sequenceCounter;
  id v15;
  uint64_t v16;
  NSNumber *referenceCounter;
  id v18;
  uint64_t v19;
  NSNumber *otherOSValid;
  id v21;
  uint64_t v22;
  NSNumber *migrationPackages;
  id v24;
  uint64_t v25;
  NSNumber *migrationInstances;
  id v27;
  uint64_t v28;
  NSString *platformIdentifier;
  id v30;
  uint64_t v31;
  NSData *serialNumberAsData;
  id v33;
  uint64_t v34;
  NSData *systemOSSerialNumberAsData;
  id v36;
  uint64_t v37;
  NSData *rsaCertificateAsData;
  id v39;
  uint64_t v40;
  NSData *ecdsaCertificateAsData;
  id v42;
  uint64_t v43;
  NSData *eckaCertificateAsData;
  id v45;
  uint64_t v46;
  NSNumber *persistentConfigID;
  id v48;
  uint64_t v49;
  NSData *manifestQuery;
  id v51;
  uint64_t v52;
  NSString *atrString;
  id v54;
  uint64_t v55;
  NSArray *bootHistory;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)NFHardwareSecureElementInfo;
  v5 = -[NFHardwareSecureElementInfo init](&v58, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v5->_OSVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OSVersion"));
    v5->_fullOSVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fullOSVersion"));
    v5->_firmwareVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firmwareVersion"));
    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("compiledFWVersion"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    compiledFWVersion = v5->_compiledFWVersion;
    v5->_compiledFWVersion = (NSNumber *)v10;

    v5->_hardwareVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("hardwareVersion"));
    v5->_deviceType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("sequenceCounter"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("referenceCounter"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    referenceCounter = v5->_referenceCounter;
    v5->_referenceCounter = (NSNumber *)v16;

    v5->_osid = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("osid"));
    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("otherOSValid"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    otherOSValid = v5->_otherOSValid;
    v5->_otherOSValid = (NSNumber *)v19;

    v5->_restrictedMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictedMode"));
    v5->_osUpdateMode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("osUpdateMode"));
    v5->_OSMode = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("OSMode"));
    v5->_signingKeyType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("signingKeyType"));
    v5->_migrationState = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("migrationState"));
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("migrationPackages"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    migrationPackages = v5->_migrationPackages;
    v5->_migrationPackages = (NSNumber *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("migrationInstances"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    migrationInstances = v5->_migrationInstances;
    v5->_migrationInstances = (NSNumber *)v25;

    v5->_migrationContext = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("migrationContext"));
    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("platformIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    platformIdentifier = v5->_platformIdentifier;
    v5->_platformIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("serialNumber"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    serialNumberAsData = v5->_serialNumberAsData;
    v5->_serialNumberAsData = (NSData *)v31;

    v33 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("systemOSSerialNumber"));
    v34 = objc_claimAutoreleasedReturnValue(v33);
    systemOSSerialNumberAsData = v5->_systemOSSerialNumberAsData;
    v5->_systemOSSerialNumberAsData = (NSData *)v34;

    v36 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("rsaCertificate"));
    v37 = objc_claimAutoreleasedReturnValue(v36);
    rsaCertificateAsData = v5->_rsaCertificateAsData;
    v5->_rsaCertificateAsData = (NSData *)v37;

    v39 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("ecdsaCertificate"));
    v40 = objc_claimAutoreleasedReturnValue(v39);
    ecdsaCertificateAsData = v5->_ecdsaCertificateAsData;
    v5->_ecdsaCertificateAsData = (NSData *)v40;

    v42 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("eckaCertificate"));
    v43 = objc_claimAutoreleasedReturnValue(v42);
    eckaCertificateAsData = v5->_eckaCertificateAsData;
    v5->_eckaCertificateAsData = (NSData *)v43;

    v5->_appletMap = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appletMap"));
    v45 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("persistentConfigID"));
    v46 = objc_claimAutoreleasedReturnValue(v45);
    persistentConfigID = v5->_persistentConfigID;
    v5->_persistentConfigID = (NSNumber *)v46;

    v48 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("manifestQuery"));
    v49 = objc_claimAutoreleasedReturnValue(v48);
    manifestQuery = v5->_manifestQuery;
    v5->_manifestQuery = (NSData *)v49;

    v5->_personalisable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("personalisable"));
    v5->_supportedTechnologies = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedTechnologies"));
    v5->_seType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("seType"));
    v51 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("atrString"));
    v52 = objc_claimAutoreleasedReturnValue(v51);
    atrString = v5->_atrString;
    v5->_atrString = (NSString *)v52;

    v5->_jcopTooOld = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("jcopTooOld"));
    v54 = +[NFNSCheckedDecoder coder:decodeArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfClass:forKey:", v4, objc_opt_class(NSNumber), CFSTR("bootHistory"));
    v55 = objc_claimAutoreleasedReturnValue(v54);
    bootHistory = v5->_bootHistory;
    v5->_bootHistory = (NSArray *)v55;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *identifier;
  NSNumber *compiledFWVersion;
  NSNumber *sequenceCounter;
  NSNumber *referenceCounter;
  NSNumber *otherOSValid;
  NSNumber *migrationPackages;
  NSNumber *migrationInstances;
  NSString *platformIdentifier;
  NSData *serialNumberAsData;
  NSData *systemOSSerialNumberAsData;
  void *v15;
  NSData *rsaCertificateAsData;
  NSData *ecdsaCertificateAsData;
  NSData *eckaCertificateAsData;
  NSNumber *persistentConfigID;
  NSData *manifestQuery;
  NSString *atrString;
  NSArray *bootHistory;
  id v23;

  v4 = a3;
  identifier = self->_identifier;
  v23 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    v4 = v23;
  }
  objc_msgSend(v4, "encodeInteger:forKey:", self->_OSVersion, CFSTR("OSVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_fullOSVersion, CFSTR("fullOSVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_firmwareVersion, CFSTR("firmwareVersion"));
  compiledFWVersion = self->_compiledFWVersion;
  if (compiledFWVersion)
    objc_msgSend(v23, "encodeObject:forKey:", compiledFWVersion, CFSTR("compiledFWVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_hardwareVersion, CFSTR("hardwareVersion"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  sequenceCounter = self->_sequenceCounter;
  if (sequenceCounter)
    objc_msgSend(v23, "encodeObject:forKey:", sequenceCounter, CFSTR("sequenceCounter"));
  referenceCounter = self->_referenceCounter;
  if (referenceCounter)
    objc_msgSend(v23, "encodeObject:forKey:", referenceCounter, CFSTR("referenceCounter"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_osid, CFSTR("osid"));
  otherOSValid = self->_otherOSValid;
  if (otherOSValid)
    objc_msgSend(v23, "encodeObject:forKey:", otherOSValid, CFSTR("otherOSValid"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_restrictedMode, CFSTR("restrictedMode"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_osUpdateMode, CFSTR("osUpdateMode"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_OSMode, CFSTR("OSMode"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_signingKeyType, CFSTR("signingKeyType"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_migrationState, CFSTR("migrationState"));
  migrationPackages = self->_migrationPackages;
  if (migrationPackages)
    objc_msgSend(v23, "encodeObject:forKey:", migrationPackages, CFSTR("migrationPackages"));
  migrationInstances = self->_migrationInstances;
  if (migrationInstances)
    objc_msgSend(v23, "encodeObject:forKey:", migrationInstances, CFSTR("migrationInstances"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_migrationContext, CFSTR("migrationContext"));
  platformIdentifier = self->_platformIdentifier;
  if (platformIdentifier)
    objc_msgSend(v23, "encodeObject:forKey:", platformIdentifier, CFSTR("platformIdentifier"));
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData)
    objc_msgSend(v23, "encodeObject:forKey:", serialNumberAsData, CFSTR("serialNumber"));
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  v15 = v23;
  if (systemOSSerialNumberAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", systemOSSerialNumberAsData, CFSTR("systemOSSerialNumber"));
    v15 = v23;
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", rsaCertificateAsData, CFSTR("rsaCertificate"));
    v15 = v23;
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", ecdsaCertificateAsData, CFSTR("ecdsaCertificate"));
    v15 = v23;
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    objc_msgSend(v23, "encodeObject:forKey:", eckaCertificateAsData, CFSTR("eckaCertificate"));
    v15 = v23;
  }
  objc_msgSend(v15, "encodeInteger:forKey:", self->_appletMap, CFSTR("appletMap"));
  persistentConfigID = self->_persistentConfigID;
  if (persistentConfigID)
    objc_msgSend(v23, "encodeObject:forKey:", persistentConfigID, CFSTR("persistentConfigID"));
  manifestQuery = self->_manifestQuery;
  if (manifestQuery)
    objc_msgSend(v23, "encodeObject:forKey:", manifestQuery, CFSTR("manifestQuery"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_personalisable, CFSTR("personalisable"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_supportedTechnologies, CFSTR("supportedTechnologies"));
  objc_msgSend(v23, "encodeInteger:forKey:", self->_seType, CFSTR("seType"));
  atrString = self->_atrString;
  if (atrString)
    objc_msgSend(v23, "encodeObject:forKey:", atrString, CFSTR("atrString"));
  objc_msgSend(v23, "encodeBool:forKey:", self->_jcopTooOld, CFSTR("jcopTooOld"));
  bootHistory = self->_bootHistory;
  if (bootHistory)
    objc_msgSend(v23, "encodeObject:forKey:", bootHistory, CFSTR("bootHistory"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)asDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  const __CFString *identifier;
  NSNumber *compiledFWVersion;
  NSNumber *sequenceCounter;
  NSNumber *referenceCounter;
  NSNumber *otherOSValid;
  NSNumber *migrationPackages;
  NSNumber *migrationInstances;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *platformIdentifier;
  NSData *serialNumberAsData;
  void *v26;
  NSData *systemOSSerialNumberAsData;
  void *v28;
  NSData *rsaCertificateAsData;
  void *v30;
  NSData *ecdsaCertificateAsData;
  void *v32;
  NSData *eckaCertificateAsData;
  void *v34;
  void *v35;
  NSNumber *persistentConfigID;
  void *v37;
  NSArray *bootHistory;
  id v39;
  void *v40;
  const __CFString *atrString;
  void *v42;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = v3;
  if (self->_identifier)
    identifier = (const __CFString *)self->_identifier;
  else
    identifier = &stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", identifier, CFSTR("identifier"));
  if (self->_compiledFWVersion)
    compiledFWVersion = self->_compiledFWVersion;
  else
    compiledFWVersion = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", compiledFWVersion, CFSTR("compiledFWVersion"));
  if (self->_sequenceCounter)
    sequenceCounter = self->_sequenceCounter;
  else
    sequenceCounter = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", sequenceCounter, CFSTR("sequenceCounter"));
  if (self->_referenceCounter)
    referenceCounter = self->_referenceCounter;
  else
    referenceCounter = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", referenceCounter, CFSTR("referenceCounter"));
  if (self->_otherOSValid)
    otherOSValid = self->_otherOSValid;
  else
    otherOSValid = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", otherOSValid, CFSTR("otherOSValid"));
  if (self->_migrationPackages)
    migrationPackages = self->_migrationPackages;
  else
    migrationPackages = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", migrationPackages, CFSTR("migrationPackages"));
  if (self->_migrationInstances)
    migrationInstances = self->_migrationInstances;
  else
    migrationInstances = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", migrationInstances, CFSTR("migrationInstances"));
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_OSVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("OSVersion"));

  v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%06x"), self->_fullOSVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("fullOSVersion"));

  v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_firmwareVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v14, CFSTR("firmwareVersion"));

  v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_hardwareVersion);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("hardwareVersion"));

  v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_deviceType);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, CFSTR("deviceType"));

  v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_osid);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v17, CFSTR("osid"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_restrictedMode));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v18, CFSTR("restrictedMode"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_osUpdateMode));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("osUpdateMode"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_OSMode)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v20, CFSTR("OSMode"));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_signingKeyType)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v21, CFSTR("signingKeyType"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_migrationState)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, CFSTR("migrationState"));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_migrationContext)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, CFSTR("migrationContext"));

  if (self->_platformIdentifier)
    platformIdentifier = (const __CFString *)self->_platformIdentifier;
  else
    platformIdentifier = &stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", platformIdentifier, CFSTR("platformIdentifier"));
  serialNumberAsData = self->_serialNumberAsData;
  if (serialNumberAsData)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](serialNumberAsData, "NF_asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v26, CFSTR("serialNumber"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_1002ED8A8, CFSTR("serialNumber"));
  }
  systemOSSerialNumberAsData = self->_systemOSSerialNumberAsData;
  if (systemOSSerialNumberAsData)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](systemOSSerialNumberAsData, "NF_asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v28, CFSTR("systemOSSerialNumber"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_1002ED8A8, CFSTR("systemOSSerialNumber"));
  }
  rsaCertificateAsData = self->_rsaCertificateAsData;
  if (rsaCertificateAsData)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](rsaCertificateAsData, "NF_asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v30, CFSTR("rsaCertificate"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_1002ED8A8, CFSTR("rsaCertificate"));
  }
  ecdsaCertificateAsData = self->_ecdsaCertificateAsData;
  if (ecdsaCertificateAsData)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](ecdsaCertificateAsData, "NF_asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v32, CFSTR("ecdsaCertificate"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_1002ED8A8, CFSTR("ecdsaCertificate"));
  }
  eckaCertificateAsData = self->_eckaCertificateAsData;
  if (eckaCertificateAsData)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSData NF_asHexString](eckaCertificateAsData, "NF_asHexString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v34, CFSTR("eckaCertificate"));

  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", &stru_1002ED8A8, CFSTR("eckaCertificate"));
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_appletMap)));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v35, CFSTR("appletMap"));

  if (self->_persistentConfigID)
    persistentConfigID = self->_persistentConfigID;
  else
    persistentConfigID = (NSNumber *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", persistentConfigID, CFSTR("persistentConfigID"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_personalisable));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v37, CFSTR("personalisable"));

  if (self->_bootHistory)
    bootHistory = self->_bootHistory;
  else
    bootHistory = (NSArray *)&stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", bootHistory, CFSTR("bootHistory"));
  v39 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("0x%04x"), self->_supportedTechnologies);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v39, CFSTR("supportedTechnologies"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_seType));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v40, CFSTR("seType"));

  if (self->_atrString)
    atrString = (const __CFString *)self->_atrString;
  else
    atrString = &stru_1002ED8A8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", atrString, CFSTR("atrString"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_jcopTooOld));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v42, CFSTR("jcopTooOld"));

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)OSVersion
{
  return self->_OSVersion;
}

- (unint64_t)fullOSVersion
{
  return self->_fullOSVersion;
}

- (unint64_t)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSNumber)compiledFWVersion
{
  return self->_compiledFWVersion;
}

- (unint64_t)hardwareVersion
{
  return self->_hardwareVersion;
}

- (unint64_t)deviceType
{
  return self->_deviceType;
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (NSNumber)referenceCounter
{
  return self->_referenceCounter;
}

- (unint64_t)osid
{
  return self->_osid;
}

- (NSNumber)otherOSValid
{
  return self->_otherOSValid;
}

- (BOOL)restrictedMode
{
  return self->_restrictedMode;
}

- (BOOL)restrictedPerformanceMode
{
  return self->_restrictedPerformanceMode;
}

- (BOOL)osUpdateMode
{
  return self->_osUpdateMode;
}

- (unint64_t)OSMode
{
  return self->_OSMode;
}

- (unint64_t)signingKeyType
{
  return self->_signingKeyType;
}

- (unint64_t)migrationState
{
  return self->_migrationState;
}

- (unint64_t)migrationContext
{
  return self->_migrationContext;
}

- (NSNumber)migrationPackages
{
  return self->_migrationPackages;
}

- (NSNumber)migrationInstances
{
  return self->_migrationInstances;
}

- (NSString)platformIdentifier
{
  return self->_platformIdentifier;
}

- (unint64_t)appletMap
{
  return self->_appletMap;
}

- (NSNumber)persistentConfigID
{
  return self->_persistentConfigID;
}

- (NSString)rootKeyID
{
  return self->_rootKeyID;
}

- (NSString)osKeyID
{
  return self->_osKeyID;
}

- (NSString)firmwareKeyID
{
  return self->_firmwareKeyID;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSData)manifestQuery
{
  return self->_manifestQuery;
}

- (BOOL)personalisable
{
  return self->_personalisable;
}

- (NSArray)bootHistory
{
  return self->_bootHistory;
}

- (unint64_t)supportedTechnologies
{
  return self->_supportedTechnologies;
}

- (unint64_t)seType
{
  return self->_seType;
}

- (NSString)atrString
{
  return self->_atrString;
}

- (BOOL)jcopTooOld
{
  return self->_jcopTooOld;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_atrString, 0);
  objc_storeStrong((id *)&self->_bootHistory, 0);
  objc_storeStrong((id *)&self->_manifestQuery, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_firmwareKeyID, 0);
  objc_storeStrong((id *)&self->_osKeyID, 0);
  objc_storeStrong((id *)&self->_rootKeyID, 0);
  objc_storeStrong((id *)&self->_persistentConfigID, 0);
  objc_storeStrong((id *)&self->_platformIdentifier, 0);
  objc_storeStrong((id *)&self->_migrationInstances, 0);
  objc_storeStrong((id *)&self->_migrationPackages, 0);
  objc_storeStrong((id *)&self->_otherOSValid, 0);
  objc_storeStrong((id *)&self->_referenceCounter, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_compiledFWVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_systemOSSerialNumberAsData, 0);
  objc_storeStrong((id *)&self->_serialNumberAsData, 0);
  objc_storeStrong((id *)&self->_eckaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_ecdsaCertificateAsData, 0);
  objc_storeStrong((id *)&self->_rsaCertificateAsData, 0);
}

@end
