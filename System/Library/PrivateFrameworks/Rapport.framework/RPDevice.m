@implementation RPDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPDevice)init
{
  RPDevice *v2;
  RPDevice *v3;
  RPDevice *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPDevice;
  v2 = -[RPDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (RPDevice)initWithCoder:(id)a3
{
  id v4;
  RPDevice *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  RPDevice *v15;
  objc_super v17;
  uint64_t v18;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RPDevice;
  v5 = -[RPDevice init](&v17, sel_init);
  if (v5)
  {
    v18 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_activityLevel = v18;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v18 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v18;
    v10 = v9;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v11 = v10;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v12 = v11;
    if (objc_msgSend(v12, "containsValueForKey:", CFSTR("idsc")))
      v5->_idsDeviceIdentifierConflict = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("idsc"));

    v13 = v12;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v14 = v13;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v18 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_proximity = v18;
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t activityLevel;
  NSDate *activityLevelTimeStamp;
  NSString *accountID;
  NSData *bleAuthTag;
  NSString *contactID;
  uint64_t flags;
  NSString *identifier;
  NSString *idsDeviceIdentifier;
  NSString *model;
  NSString *name;
  uint64_t proximity;
  CURangingMeasurement *relativeLocation;
  id v17;

  v4 = a3;
  activityLevel = self->_activityLevel;
  v17 = v4;
  if ((_DWORD)activityLevel)
  {
    objc_msgSend(v4, "encodeInteger:forKey:", activityLevel, CFSTR("al"));
    v4 = v17;
  }
  activityLevelTimeStamp = self->_activityLevelTimeStamp;
  if (activityLevelTimeStamp)
  {
    objc_msgSend(v17, "encodeObject:forKey:", activityLevelTimeStamp, CFSTR("alts"));
    v4 = v17;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    objc_msgSend(v17, "encodeObject:forKey:", accountID, CFSTR("aid"));
    v4 = v17;
  }
  bleAuthTag = self->_bleAuthTag;
  if (bleAuthTag)
  {
    objc_msgSend(v17, "encodeObject:forKey:", bleAuthTag, CFSTR("atag"));
    v4 = v17;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    objc_msgSend(v17, "encodeObject:forKey:", contactID, CFSTR("cnid"));
    v4 = v17;
  }
  flags = self->_flags;
  if ((_DWORD)flags)
  {
    objc_msgSend(v17, "encodeInt64:forKey:", flags, CFSTR("fl"));
    v4 = v17;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v17, "encodeObject:forKey:", identifier, CFSTR("id"));
    v4 = v17;
  }
  idsDeviceIdentifier = self->_idsDeviceIdentifier;
  if (idsDeviceIdentifier)
  {
    objc_msgSend(v17, "encodeObject:forKey:", idsDeviceIdentifier, CFSTR("ids"));
    v4 = v17;
  }
  if (self->_idsDeviceIdentifierConflict)
  {
    objc_msgSend(v17, "encodeBool:forKey:", 1, CFSTR("idsc"));
    v4 = v17;
  }
  model = self->_model;
  if (model)
  {
    objc_msgSend(v17, "encodeObject:forKey:", model, CFSTR("md"));
    v4 = v17;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v17, "encodeObject:forKey:", name, CFSTR("nm"));
    v4 = v17;
  }
  proximity = self->_proximity;
  if ((_DWORD)proximity)
  {
    objc_msgSend(v17, "encodeInteger:forKey:", proximity, CFSTR("px"));
    v4 = v17;
  }
  relativeLocation = self->_relativeLocation;
  if (relativeLocation)
  {
    objc_msgSend(v17, "encodeObject:forKey:", relativeLocation, CFSTR("rl"));
    v4 = v17;
  }

}

- (id)description
{
  return -[RPDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  _BOOL4 idsDeviceIdentifierConflict;
  _BOOL4 v8;
  id v9;
  id v10;
  NSString *name;
  NSString *v12;
  id v13;
  NSString *model;
  NSString *v15;
  id v16;
  NSString *accountID;
  NSString *v18;
  id v19;
  NSString *udid;
  NSString *v21;
  id v22;
  NSString *contactID;
  NSString *v24;
  id v25;
  NSData *v26;
  id v27;
  NSData *bleAuthTag;
  id v29;
  NSData *bleDeviceAddress;
  id v31;
  id v33;
  CURangingMeasurement *relativeLocation;
  id v35;
  id v36;
  NSDate *activityLevelTimeStamp;
  id v38;
  id v39;
  id v40;
  NSData *v42;
  CURangingMeasurement *v43;
  NSDate *v44;
  NSData *v45;

  NSAppendPrintF();
  v4 = 0;
  v5 = self->_identifier;
  v6 = self->_idsDeviceIdentifier;
  idsDeviceIdentifierConflict = self->_idsDeviceIdentifierConflict;
  if (-[NSString isEqual:](v6, "isEqual:", v5))
  {

    v8 = shouldPrintSensitiveData();
    v5 = 0;
  }
  else
  {
    v8 = shouldPrintSensitiveData();
    if (v5)
    {
      formatSensitiveData((uint64_t)", ID ", v8);
      NSAppendPrintF();
      v9 = v4;

      v4 = v9;
    }
  }
  if (v6)
  {
    formatSensitiveData((uint64_t)", IDS ", v8);
    NSAppendPrintF();
    v10 = v4;

    if (idsDeviceIdentifierConflict)
    {
      NSAppendPrintF();
      v4 = v10;

    }
    else
    {
      v4 = v10;
    }
  }
  name = self->_name;
  if (name)
  {
    v12 = name;
    formatSensitiveData((uint64_t)", Nm ", v8);
    NSAppendPrintF();
    v13 = v4;

    v4 = v13;
  }
  model = self->_model;
  if (model)
  {
    v15 = model;
    formatSensitiveData((uint64_t)", Md ", v8);
    NSAppendPrintF();
    v16 = v4;

    v4 = v16;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    v18 = accountID;
    formatSensitiveData((uint64_t)", AID ", v8);
    NSAppendPrintF();
    v19 = v4;

    v4 = v19;
  }
  udid = self->_udid;
  if (udid)
  {
    v21 = udid;
    formatSensitiveData((uint64_t)", UDID ", v8);
    NSAppendPrintF();
    v22 = v4;

    v4 = v22;
  }
  contactID = self->_contactID;
  if (contactID)
  {
    v24 = contactID;
    formatSensitiveData((uint64_t)", CNID ", v8);
    NSAppendPrintF();
    v25 = v4;

    v4 = v25;
  }
  if (v8)
  {
    v26 = self->_wifiAddress;
    if (-[NSData length](v26, "length") == 6)
    {
      -[NSData bytes](objc_retainAutorelease(v26), "bytes");
      NSAppendPrintF();
      v27 = v4;

      v4 = v27;
    }
    bleAuthTag = self->_bleAuthTag;
    if (bleAuthTag)
    {
      v45 = bleAuthTag;
      NSAppendPrintF();
      v29 = v4;

      v4 = v29;
    }
    bleDeviceAddress = self->_bleDeviceAddress;
    if (bleDeviceAddress)
    {
      v42 = bleDeviceAddress;
      NSAppendPrintF();
      v31 = v4;

      v4 = v31;
    }
    if (self->_proximity)
    {
      NSAppendPrintF();
      v33 = v4;

      v4 = v33;
    }
    relativeLocation = self->_relativeLocation;
    if (relativeLocation)
    {
      v43 = relativeLocation;
      NSAppendPrintF();
      v35 = v4;

      v4 = v35;
    }
    if (self->_activityLevel)
    {
      NSAppendPrintF();
      v36 = v4;

      v4 = v36;
    }
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    if (activityLevelTimeStamp)
    {
      v44 = activityLevelTimeStamp;
      NSAppendPrintF();
      v38 = v4;

      v4 = v38;
    }

  }
  if (self->_flags)
  {
    NSAppendPrintF();
    v39 = v4;

    v4 = v39;
  }
  v40 = v4;

  return v40;
}

- (double)timeSinceLastActivityLevelChange
{
  void *v3;
  double v4;
  double v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_activityLevelTimeStamp);
  v5 = v4;

  return v5;
}

- (void)_updateTXTDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *txtDictionary;

  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "bytes");
  objc_msgSend(v4, "length");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  while (TXTRecordGetNextItem())
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", 0, 0, 4);
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", 0, 0, 4);
      if (v7)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  v8 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v5);
  txtDictionary = self->_txtDictionary;
  self->_txtDictionary = v8;

}

- (unsigned)updateWithBonjourDevice:(id)a3
{
  id v4;
  unsigned __int8 Int64Ranged;
  unsigned int v6;
  void *v7;
  void *v8;
  NSString *name;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  char v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;

  v4 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (self->_deviceActionType == Int64Ranged)
  {
    v6 = 0;
  }
  else
  {
    self->_deviceActionType = Int64Ranged;
    v6 = 2;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    name = self->_name;
    v10 = v7;
    v11 = name;
    if (v10 == v11)
    {

      goto LABEL_13;
    }
    v12 = v11;
    if (v11)
    {
      v13 = -[NSString isEqual:](v10, "isEqual:", v11);

      if ((v13 & 1) != 0)
        goto LABEL_13;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_name, v8);
    v6 = 2;
  }
LABEL_13:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = self->_name;
    v17 = v14;
    v18 = v16;
    if (v17 == v18)
    {

    }
    else
    {
      v19 = v18;
      if (v18)
      {
        v20 = -[NSString isEqual:](v17, "isEqual:", v18);

        if ((v20 & 1) != 0)
          goto LABEL_21;
      }
      else
      {

      }
      objc_storeStrong((id *)&self->_txtData, v15);
      -[RPDevice _updateTXTDictionary:](self, "_updateTXTDictionary:", v17);
      v6 = 2;
    }
  }
LABEL_21:

  return v6;
}

- (unsigned)updateWithMobileDevice:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v14;
  NSData **p_wifiAddress;
  NSData *wifiAddress;
  _BYTE v17[6];
  int v18;

  v5 = a3;
  objc_storeStrong((id *)&self->_mobileDevice, a3);
  objc_msgSend(v5, "internalModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqual:", self->_model) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_model, v7);
    v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_msgSend(v9, "isEqual:", self->_name) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_name, v9);
    v8 = 2;
  }
  if (objc_msgSend(v5, "paired"))
    v10 = 20;
  else
    v10 = 10;
  if (v10 != self->_systemPairState)
  {
    self->_systemPairState = v10;
    v8 = 2;
  }
  objc_msgSend(v5, "udid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && (objc_msgSend(v11, "isEqual:", self->_udid) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_udid, v11);
    v8 = 2;
  }
  v18 = 0;
  objc_msgSend(v5, "wifiAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    CFGetHardwareAddress();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v17, 6);

    if (v14)
    {
      wifiAddress = self->_wifiAddress;
      p_wifiAddress = &self->_wifiAddress;
      if ((objc_msgSend(v14, "isEqual:", wifiAddress) & 1) == 0)
      {
        objc_storeStrong((id *)p_wifiAddress, v14);
        v8 = 2;
      }
    }

  }
  return v8;
}

- (unsigned)updateWithSFDevice:(id)a3 changes:(unsigned int)a4
{
  char v4;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  int v12;
  NSDate *v13;
  NSDate *activityLevelTimeStamp;
  void *v15;
  void *v16;
  NSData *bleAdvertisementData;
  NSData *v18;
  NSData *v19;
  NSData *v20;
  char v21;
  void *v22;
  NSData *bleDeviceAddress;
  NSData *v24;
  NSData *v25;
  NSData *v26;
  char v27;
  void *v28;
  NSData *bleAuthTag;
  NSData *v30;
  NSData *v31;
  NSData *v32;
  char v33;
  void *v34;
  int v35;
  unsigned int flags;
  unsigned int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  void *v46;
  int v47;
  unsigned int v48;
  int v49;
  void *v50;
  NSString *model;
  NSString *v52;
  NSString *v53;
  NSString *v54;
  char v55;
  void *v56;
  NSString *name;
  NSString *v58;
  NSString *v59;
  NSString *v60;
  char v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  void *v68;
  void *v69;
  void *v70;

  v4 = a4;
  v7 = a3;
  objc_msgSend(v7, "bleDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_bleDevice, a3);
  if ((v4 & 9) == 0)
  {
    v9 = 0;
    if ((v4 & 2) == 0)
      goto LABEL_104;
    goto LABEL_94;
  }
  objc_msgSend(v8, "advertisementFields");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accountID)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "accountID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_accountID, v10);
      v9 = 2;
    }
    else
    {
      v9 = 0;
    }

  }
  objc_msgSend(v7, "bleDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "decryptedActivityLevel");
  if (v12 != 16 && self->_activityLevel != v12)
  {
    self->_activityLevel = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activityLevelTimeStamp = self->_activityLevelTimeStamp;
    self->_activityLevelTimeStamp = v13;

    v9 = 2;
  }
  objc_msgSend(v8, "advertisementData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v68 = v11;
  if (v15)
  {
    bleAdvertisementData = self->_bleAdvertisementData;
    v18 = v15;
    v19 = bleAdvertisementData;
    if (v18 == v19)
    {

      goto LABEL_21;
    }
    v20 = v19;
    if (v19)
    {
      v21 = -[NSData isEqual:](v18, "isEqual:", v19, v68);

      if ((v21 & 1) != 0)
        goto LABEL_21;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_bleAdvertisementData, v16);
    v9 |= 1u;
  }
LABEL_21:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_29;
  bleDeviceAddress = self->_bleDeviceAddress;
  v24 = v22;
  v25 = bleDeviceAddress;
  if (v24 == v25)
  {

    goto LABEL_29;
  }
  v26 = v25;
  if (!v25)
  {

    goto LABEL_28;
  }
  v27 = -[NSData isEqual:](v24, "isEqual:", v25);

  if ((v27 & 1) == 0)
  {
LABEL_28:
    objc_storeStrong((id *)&self->_bleDeviceAddress, v22);
    v9 |= 2u;
  }
LABEL_29:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
    goto LABEL_37;
  bleAuthTag = self->_bleAuthTag;
  v30 = v28;
  v31 = bleAuthTag;
  if (v30 == v31)
  {

    goto LABEL_37;
  }
  v32 = v31;
  if (!v31)
  {

    goto LABEL_36;
  }
  v33 = -[NSData isEqual:](v30, "isEqual:", v31);

  if ((v33 & 1) == 0)
  {
LABEL_36:
    objc_storeStrong((id *)&self->_bleAuthTag, v28);
    v9 |= 2u;
  }
LABEL_37:
  if (!self->_contactID)
  {
    objc_msgSend(v7, "contactIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_storeStrong((id *)&self->_contactID, v34);
      v9 |= 2u;
    }

  }
  v35 = objc_msgSend(v7, "deviceActionType", v68);
  if (v35 != self->_deviceActionType)
  {
    self->_deviceActionType = v35;
    v9 |= 2u;
  }
  flags = self->_flags;
  v37 = objc_msgSend(v7, "deviceFlags");
  v38 = (2 * (v37 & 1)) | (v37 >> 3) & 1;
  if ((v37 & 0x10) != 0)
    v39 = 36;
  else
    v39 = 4;
  if ((v37 & 0x10) != 0)
    v40 = 1536;
  else
    v40 = 512;
  if ((v37 & 0x10) != 0)
    v41 = 192;
  else
    v41 = 64;
  if ((v37 & 0x10) != 0)
    v42 = 24576;
  else
    v42 = 0x2000;
  if ((v37 & 0x10) != 0)
    v43 = 98304;
  else
    v43 = 0x8000;
  if ((v37 & 2) != 0)
    v38 |= v37 & 0x10 | 8;
  v44 = v38 | v39 & ((int)(v37 << 29) >> 31) | v40 & ((int)(v37 << 21) >> 31) | v41 & ((int)(v37 << 25) >> 31);
  v45 = (16 * v37) & 0x800 | (((v37 >> 5) & 1) << 8) | v42 & ((int)(v37 << 17) >> 31) | v43 & ((__int16)v37 >> 15) | v44;
  if ((v44 & 0x24D) == 0)
    v45 |= 0x1000u;
  if (v45 != flags)
  {
    self->_flags = v45;
    v9 |= 2u;
  }
  if (!self->_idsDeviceIdentifier)
  {
    objc_msgSend(v7, "idsIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      objc_storeStrong((id *)&self->_idsDeviceIdentifier, v46);
      v9 |= 2u;
    }

  }
  v47 = objc_msgSend(v7, "idsIdentifierConflict");
  if (self->_idsDeviceIdentifierConflict != v47)
  {
    self->_idsDeviceIdentifierConflict = v47;
    v9 |= 2u;
  }
  if (CFDictionaryGetInt64())
    v48 = 20;
  else
    v48 = 10;
  if (v48 != self->_blePairState)
  {
    self->_blePairState = v48;
    v9 |= 2u;
  }
  v49 = objc_msgSend(v7, "needsSetup");
  if (self->_needsSetup != v49)
  {
    self->_needsSetup = v49;
    v9 |= 2u;
  }
  objc_msgSend(v7, "model");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    model = self->_model;
    v52 = v50;
    v53 = model;
    if (v52 == v53)
    {

      goto LABEL_85;
    }
    v54 = v53;
    if (v53)
    {
      v55 = -[NSString isEqual:](v52, "isEqual:", v53);

      if ((v55 & 1) != 0)
        goto LABEL_85;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_model, v50);
    v9 |= 2u;
  }
LABEL_85:
  objc_msgSend(v7, "name");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
    goto LABEL_93;
  name = self->_name;
  v58 = v56;
  v59 = name;
  if (v58 == v59)
  {

    goto LABEL_93;
  }
  v60 = v59;
  if (!v59)
  {

    goto LABEL_92;
  }
  v61 = -[NSString isEqual:](v58, "isEqual:", v59);

  if ((v61 & 1) == 0)
  {
LABEL_92:
    objc_storeStrong((id *)&self->_name, v56);
    v9 |= 0x10u;
  }
LABEL_93:

  if ((v4 & 2) == 0)
    goto LABEL_104;
LABEL_94:
  v62 = objc_msgSend(v7, "distance");
  if ((unint64_t)v62 >= 0x15)
    v63 = 30;
  else
    v63 = 20;
  if (v62 >= 11)
    v64 = v63;
  else
    v64 = 10;
  if (!v62)
    v64 = 0;
  if (v64 != self->_proximity)
  {
    self->_proximity = v64;
    v9 |= 0x80u;
  }
LABEL_104:
  if ((v4 & 4) != 0)
  {
    v65 = objc_msgSend(v8, "rssi");
    if (self->_rawRSSI != v65)
    {
      self->_rawRSSI = v65;
      v9 |= 0x20u;
    }
    v66 = objc_msgSend(v8, "smoothedRSSI");
    if (self->_smoothedRSSI != v66)
    {
      self->_smoothedRSSI = v66;
      v9 |= 0x20u;
    }
  }

  return v9;
}

- (void)updateWithSystemInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  NSDictionaryGetNSUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_storeStrong((id *)&self->_pairingIdentifier, v4);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_name, v5);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_storeStrong((id *)&self->_model, v6);

}

- (void)updateWithWiFiDevice:(id)a3 changes:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "bssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong((id *)&self->_wifiBSSID, v5);
  objc_msgSend(v11, "deviceIEDeviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_storeStrong((id *)&self->_wifiDeviceIEDeviceID, v6);
  self->_wifiDeviceIEFlags = objc_msgSend(v11, "deviceIEFlags");
  objc_msgSend(v11, "deviceIEName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_storeStrong((id *)&self->_wifiDeviceIEName, v7);
  objc_msgSend(v11, "ieData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_storeStrong((id *)&self->_wifiIEData, v8);
  objc_msgSend(v11, "platformObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_storeStrong(&self->_wifiPlatformObject, v9);
  objc_msgSend(v11, "ssid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_storeStrong((id *)&self->_wifiSSID, v10);

}

- (NSString)accountID
{
  return self->_accountID;
}

- (int)activityLevel
{
  return self->_activityLevel;
}

- (NSDate)activityLevelTimeStamp
{
  return self->_activityLevelTimeStamp;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (NSString)contactID
{
  return self->_contactID;
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (BOOL)idsDeviceIdentifierConflict
{
  return self->_idsDeviceIdentifierConflict;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int)proximity
{
  return self->_proximity;
}

- (CURangingMeasurement)relativeLocation
{
  return (CURangingMeasurement *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRelativeLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (SFDevice)bleDevice
{
  return self->_bleDevice;
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (CUMobileDevice)mobileDevice
{
  return self->_mobileDevice;
}

- (void)setMobileDevice:(id)a3
{
  objc_storeStrong((id *)&self->_mobileDevice, a3);
}

- (NSData)authTag
{
  return self->_authTag;
}

- (NSData)bleAdvertisementData
{
  return self->_bleAdvertisementData;
}

- (NSData)bleDeviceAddress
{
  return self->_bleDeviceAddress;
}

- (unsigned)blePairState
{
  return self->_blePairState;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (NSUUID)identifierUUID
{
  return self->_identifierUUID;
}

- (void)setIdentifierUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
  objc_storeStrong((id *)&self->_pairedPeer, a3);
}

- (NSUUID)pairingIdentifier
{
  return self->_pairingIdentifier;
}

- (void)setPairingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int)rawRSSI
{
  return self->_rawRSSI;
}

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (unsigned)systemPairState
{
  return self->_systemPairState;
}

- (void)setSystemPairState:(unsigned int)a3
{
  self->_systemPairState = a3;
}

- (NSData)txtData
{
  return self->_txtData;
}

- (NSDictionary)txtDictionary
{
  return self->_txtDictionary;
}

- (NSString)udid
{
  return self->_udid;
}

- (void)setUdid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSData)wifiAddress
{
  return self->_wifiAddress;
}

- (void)setWifiAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSData)wifiBSSID
{
  return self->_wifiBSSID;
}

- (void)setWifiBSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSData)wifiDeviceIEDeviceID
{
  return self->_wifiDeviceIEDeviceID;
}

- (void)setWifiDeviceIEDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unsigned)wifiDeviceIEFlags
{
  return self->_wifiDeviceIEFlags;
}

- (NSData)wifiDeviceIEName
{
  return self->_wifiDeviceIEName;
}

- (void)setWifiDeviceIEName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSData)wifiIEData
{
  return self->_wifiIEData;
}

- (void)setWifiIEData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)wifiPlatformObject
{
  return self->_wifiPlatformObject;
}

- (void)setWifiPlatformObject:(id)a3
{
  objc_storeStrong(&self->_wifiPlatformObject, a3);
}

- (NSString)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong(&self->_wifiPlatformObject, 0);
  objc_storeStrong((id *)&self->_wifiIEData, 0);
  objc_storeStrong((id *)&self->_wifiDeviceIEName, 0);
  objc_storeStrong((id *)&self->_wifiDeviceIEDeviceID, 0);
  objc_storeStrong((id *)&self->_wifiBSSID, 0);
  objc_storeStrong((id *)&self->_wifiAddress, 0);
  objc_storeStrong((id *)&self->_udid, 0);
  objc_storeStrong((id *)&self->_txtDictionary, 0);
  objc_storeStrong((id *)&self->_txtData, 0);
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_identifierUUID, 0);
  objc_storeStrong((id *)&self->_bleDeviceAddress, 0);
  objc_storeStrong((id *)&self->_bleAdvertisementData, 0);
  objc_storeStrong((id *)&self->_authTag, 0);
  objc_storeStrong((id *)&self->_mobileDevice, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_relativeLocation, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
  objc_storeStrong((id *)&self->_bleAuthTag, 0);
  objc_storeStrong((id *)&self->_activityLevelTimeStamp, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end
