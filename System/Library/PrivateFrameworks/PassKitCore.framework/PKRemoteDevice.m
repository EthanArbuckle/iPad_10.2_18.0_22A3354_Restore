@implementation PKRemoteDevice

+ (id)preferenceComparator
{
  return (id)objc_msgSend(&__block_literal_global_752, "copy");
}

uint64_t __71__PKRemoteDevice_PKPaymentAuthorizationDataModel__preferenceComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned __int8 v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "type");
  v7 = objc_msgSend(v5, "type");
  v8 = objc_msgSend(v4, "isLocked");
  v9 = objc_msgSend(v5, "isLocked");
  if (!objc_msgSend(v4, "proximityState") && objc_msgSend(v5, "proximityState"))
    goto LABEL_10;
  if (objc_msgSend(v4, "proximityState") && !objc_msgSend(v5, "proximityState"))
    goto LABEL_26;
  if (v6 < v7)
  {
    if (v6)
      v10 = 0;
    else
      v10 = v8;
    v11 = (v10 & (v7 == 1)) == 0;
    v12 = 1;
LABEL_16:
    if (v11)
      v13 = -v12;
    else
      v13 = v12;
    goto LABEL_27;
  }
  if (v6 > v7)
  {
    if (v7)
      v14 = 0;
    else
      v14 = v9;
    v11 = (v14 & (v6 == 1)) == 0;
    v12 = -1;
    goto LABEL_16;
  }
  if (!v6)
  {
    if ((v8 ^ 1 | v9) == 1)
    {
      if ((v9 ^ 1 | v8) != 1)
      {
LABEL_10:
        v13 = -1;
        goto LABEL_27;
      }
      goto LABEL_20;
    }
LABEL_26:
    v13 = 1;
    goto LABEL_27;
  }
LABEL_20:
  objc_msgSend(v5, "lastSeen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastSeen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v15, "compare:", v16);

  if (!v13)
  {
    objc_msgSend(v4, "deviceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v17, "compare:", v18);

    if (!v13)
    {
      objc_msgSend(v4, "uniqueID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uniqueID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v19, "compare:", v20);

    }
  }
LABEL_27:

  return v13;
}

+ (id)acceptedComparatorWithPaymentSupportedQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id v16;

  v4 = a3;
  objc_msgSend(a1, "preferenceComparator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __95__PKRemoteDevice_PKPaymentAuthorizationDataModel__acceptedComparatorWithPaymentSupportedQuery___block_invoke;
  v14 = &unk_1E2AC6008;
  v15 = v4;
  v16 = v5;
  v6 = v5;
  v7 = v4;
  v8 = _Block_copy(&v11);
  v9 = (void *)objc_msgSend(v8, "copy", v11, v12, v13, v14);

  return v9;
}

uint64_t __95__PKRemoteDevice_PKPaymentAuthorizationDataModel__acceptedComparatorWithPaymentSupportedQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "remotePaymentInstruments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryPaymentApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "canProcessPayment:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v6, "remotePaymentInstruments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "primaryPaymentApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "canProcessPayment:", *(_QWORD *)(a1 + 32));
  if (!v10 || v14)
  {
    if ((v10 | v14 ^ 1) == 1)
      v15 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      v15 = 1;
  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (PKRemoteDevice)initWithIDSDevice:(id)a3
{
  id v4;
  PKRemoteDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *deviceName;
  uint64_t v9;
  NSString *uniqueID;
  void *v11;
  uint64_t v12;
  NSUUID *bluetoothUUID;
  uint64_t v14;
  NSString *modelIdentifier;
  int64_t v16;
  int64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKRemoteDevice;
  v5 = -[PKRemoteDevice init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v7;

    v9 = IDSCopyIDForDevice();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v9;

    objc_msgSend(v4, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = -[PKRemoteDevice _deviceTypeForModelIdentifier:](v5, "_deviceTypeForModelIdentifier:", v11);

    objc_msgSend(v4, "nsuuid");
    v12 = objc_claimAutoreleasedReturnValue();
    bluetoothUUID = v5->_bluetoothUUID;
    v5->_bluetoothUUID = (NSUUID *)v12;

    objc_msgSend(v4, "modelIdentifier");
    v14 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v14;

    if (v4)
    {
      objc_msgSend(v4, "operatingSystemVersion");
      v16 = v18;
    }
    else
    {
      v16 = 0;
    }
    v5->_majorOperatingSystemVersion = v16;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKRemoteDevice)initWithCoder:(id)a3
{
  id v4;
  PKRemoteDevice *v5;
  uint64_t v6;
  NSString *deviceName;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *remotePaymentInstruments;
  uint64_t v13;
  PKRemotePaymentInstrument *defaultRemotePaymentInstrument;
  uint64_t v15;
  NSString *uniqueID;
  uint64_t v17;
  NSUUID *bluetoothUUID;
  uint64_t v19;
  NSDate *lastSeen;
  uint64_t v21;
  NSString *modelIdentifier;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *supportedSetupFeatures;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)PKRemoteDevice;
  v5 = -[PKRemoteDevice init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceName"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("remotePaymentInstruments"));
    v11 = objc_claimAutoreleasedReturnValue();
    remotePaymentInstruments = v5->_remotePaymentInstruments;
    v5->_remotePaymentInstruments = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("defaultRemotePaymentInstrument"));
    v13 = objc_claimAutoreleasedReturnValue();
    defaultRemotePaymentInstrument = v5->_defaultRemotePaymentInstrument;
    v5->_defaultRemotePaymentInstrument = (PKRemotePaymentInstrument *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v15 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bluetoothUUID"));
    v17 = objc_claimAutoreleasedReturnValue();
    bluetoothUUID = v5->_bluetoothUUID;
    v5->_bluetoothUUID = (NSUUID *)v17;

    v5->_isLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isLocked"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_userDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userDisabled"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastSeen"));
    v19 = objc_claimAutoreleasedReturnValue();
    lastSeen = v5->_lastSeen;
    v5->_lastSeen = (NSDate *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelIdentifier"));
    v21 = objc_claimAutoreleasedReturnValue();
    modelIdentifier = v5->_modelIdentifier;
    v5->_modelIdentifier = (NSString *)v21;

    v5->_deviceDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("deviceDisabled"));
    v5->_proximityState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("proximityState"));
    v5->_supportsFaceID = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsFaceID"));
    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("supportedSetupFeatures"));
    v26 = objc_claimAutoreleasedReturnValue();
    supportedSetupFeatures = v5->_supportedSetupFeatures;
    v5->_supportedSetupFeatures = (NSArray *)v26;

    v5->_majorOperatingSystemVersion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("majorOperatingSystemVersion"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("deviceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remotePaymentInstruments, CFSTR("remotePaymentInstruments"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_defaultRemotePaymentInstrument, CFSTR("defaultRemotePaymentInstrument"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueID, CFSTR("uniqueID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bluetoothUUID, CFSTR("bluetoothUUID"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isLocked, CFSTR("isLocked"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userDisabled, CFSTR("userDisabled"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastSeen, CFSTR("lastSeen"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modelIdentifier, CFSTR("modelIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_deviceDisabled, CFSTR("deviceDisabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_proximityState, CFSTR("proximityState"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsFaceID, CFSTR("supportsFaceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedSetupFeatures, CFSTR("supportedSetupFeatures"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_majorOperatingSystemVersion, CFSTR("majorOperatingSystemVersion"));

}

- (unint64_t)hash
{
  NSString *deviceName;
  void *v4;
  uint64_t v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  deviceName = self->_deviceName;
  v7[0] = self->_uniqueID;
  v7[1] = deviceName;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = PKCombinedHash(17, v4);

  return self->_type - v5 + 32 * v5;
}

- (BOOL)isEqual:(id)a3
{
  PKRemoteDevice *v4;
  PKRemoteDevice *v5;
  BOOL v6;

  v4 = (PKRemoteDevice *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKRemoteDevice isEqualToRemoteDevice:](self, "isEqualToRemoteDevice:", v5);

  return v6;
}

- (BOOL)isEqualToRemoteDevice:(id)a3
{
  _QWORD *v4;
  NSString *deviceName;
  NSString *v6;
  BOOL v7;
  char v8;
  NSString *uniqueID;
  NSString *v10;

  v4 = a3;
  deviceName = self->_deviceName;
  v6 = (NSString *)v4[2];
  if (deviceName)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSString isEqual:](deviceName, "isEqual:") & 1) != 0)
      goto LABEL_9;
LABEL_7:
    v8 = 0;
    goto LABEL_13;
  }
  if (deviceName != v6)
    goto LABEL_7;
LABEL_9:
  uniqueID = self->_uniqueID;
  v10 = (NSString *)v4[9];
  if (uniqueID && v10)
    v8 = -[NSString isEqual:](uniqueID, "isEqual:");
  else
    v8 = uniqueID == v10;
LABEL_13:

  return v8;
}

- (id)description
{
  id v3;
  int64_t proximityState;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n\n*****************\nDevice Name: %@\n Device ID: %@\n"), self->_deviceName, self->_uniqueID);
  objc_msgSend(v3, "appendFormat:", CFSTR("Last seen: %@\n"), self->_lastSeen);
  proximityState = self->_proximityState;
  v5 = CFSTR("Unknown");
  if (proximityState == 1)
    v5 = CFSTR("Distant");
  if (proximityState)
    v6 = v5;
  else
    v6 = CFSTR("Nearby");
  objc_msgSend(v3, "appendFormat:", CFSTR("Proximity: %@\n"), v6);
  if (self->_isLocked)
    v7 = CFSTR("Yes");
  else
    v7 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("Locked: %@\n"), v7);
  if (self->_deviceDisabled)
    v8 = CFSTR("Yes");
  else
    v8 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("Disabled: %@\n"), v8);
  if (self->_userDisabled)
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("User disabled: %@\n"), v9);
  if (self->_supportsFaceID)
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  objc_msgSend(v3, "appendFormat:", CFSTR("Face ID available: %@\n"), v10);
  -[PKRemotePaymentInstrument displayName](self->_defaultRemotePaymentInstrument, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Default: %@\n"), v11);

  objc_msgSend(v3, "appendFormat:", CFSTR("OS Version: %ld\n"), self->_majorOperatingSystemVersion);
  objc_msgSend(v3, "appendString:", CFSTR("Payment Instruments: \n"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = self->_remotePaymentInstruments;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v16), "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v14);
  }

  objc_msgSend(v3, "appendString:", CFSTR("Setup Features: \n"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v18 = self->_supportedSetupFeatures;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v27;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v22), "description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

  v24 = (void *)objc_msgSend(v3, "copy");
  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKRemoteDevice *v5;
  uint64_t v6;
  NSString *deviceName;
  uint64_t v8;
  NSString *modelIdentifier;
  uint64_t v10;
  NSDate *lastSeen;
  uint64_t v12;
  NSArray *remotePaymentInstruments;
  PKRemotePaymentInstrument *v14;
  PKRemotePaymentInstrument *defaultRemotePaymentInstrument;
  uint64_t v16;
  NSString *uniqueID;
  uint64_t v18;
  NSUUID *bluetoothUUID;
  uint64_t v20;
  NSArray *supportedSetupFeatures;

  v5 = -[PKRemoteDevice init](+[PKRemoteDevice allocWithZone:](PKRemoteDevice, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  deviceName = v5->_deviceName;
  v5->_deviceName = (NSString *)v6;

  v5->_type = self->_type;
  v8 = -[NSString copyWithZone:](self->_modelIdentifier, "copyWithZone:", a3);
  modelIdentifier = v5->_modelIdentifier;
  v5->_modelIdentifier = (NSString *)v8;

  v10 = -[NSDate copyWithZone:](self->_lastSeen, "copyWithZone:", a3);
  lastSeen = v5->_lastSeen;
  v5->_lastSeen = (NSDate *)v10;

  v5->_proximityState = self->_proximityState;
  v5->_isLocked = self->_isLocked;
  v5->_userDisabled = self->_userDisabled;
  v5->_deviceDisabled = self->_deviceDisabled;
  v12 = -[NSArray copyWithZone:](self->_remotePaymentInstruments, "copyWithZone:", a3);
  remotePaymentInstruments = v5->_remotePaymentInstruments;
  v5->_remotePaymentInstruments = (NSArray *)v12;

  v14 = -[PKRemotePaymentInstrument copyWithZone:](self->_defaultRemotePaymentInstrument, "copyWithZone:", a3);
  defaultRemotePaymentInstrument = v5->_defaultRemotePaymentInstrument;
  v5->_defaultRemotePaymentInstrument = v14;

  v16 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  uniqueID = v5->_uniqueID;
  v5->_uniqueID = (NSString *)v16;

  v18 = -[NSUUID copyWithZone:](self->_bluetoothUUID, "copyWithZone:", a3);
  bluetoothUUID = v5->_bluetoothUUID;
  v5->_bluetoothUUID = (NSUUID *)v18;

  v5->_supportsFaceID = self->_supportsFaceID;
  v20 = -[NSArray copyWithZone:](self->_supportedSetupFeatures, "copyWithZone:", a3);
  supportedSetupFeatures = v5->_supportedSetupFeatures;
  v5->_supportedSetupFeatures = (NSArray *)v20;

  v5->_majorOperatingSystemVersion = self->_majorOperatingSystemVersion;
  return v5;
}

- (BOOL)canMakePayments
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKRemotePaymentInstrument paymentApplications](self->_defaultRemotePaymentInstrument, "paymentApplications", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "supportsInAppPayment"))
        {
          v8 = objc_msgSend(v7, "state");
          if (v8 == 1 || v8 == 15)
          {
            LOBYTE(v4) = 1;
            goto LABEL_15;
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

  if (self->_deviceDisabled)
    return 0;
  if (self->_userDisabled)
    return 0;
  return v4;
}

- (int64_t)_deviceTypeForModelIdentifier:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "lowercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "containsString:", CFSTR("watch")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("iphone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("mac")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("pad")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 5;
  }

  return v4;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_modelIdentifier, a3);
}

- (NSDate)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeen, a3);
}

- (int64_t)proximityState
{
  return self->_proximityState;
}

- (void)setProximityState:(int64_t)a3
{
  self->_proximityState = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (BOOL)userDisabled
{
  return self->_userDisabled;
}

- (void)setUserDisabled:(BOOL)a3
{
  self->_userDisabled = a3;
}

- (BOOL)deviceDisabled
{
  return self->_deviceDisabled;
}

- (void)setDeviceDisabled:(BOOL)a3
{
  self->_deviceDisabled = a3;
}

- (NSArray)remotePaymentInstruments
{
  return self->_remotePaymentInstruments;
}

- (void)setRemotePaymentInstruments:(id)a3
{
  objc_storeStrong((id *)&self->_remotePaymentInstruments, a3);
}

- (PKRemotePaymentInstrument)defaultRemotePaymentInstrument
{
  return self->_defaultRemotePaymentInstrument;
}

- (void)setDefaultRemotePaymentInstrument:(id)a3
{
  objc_storeStrong((id *)&self->_defaultRemotePaymentInstrument, a3);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSUUID)bluetoothUUID
{
  return self->_bluetoothUUID;
}

- (void)setBluetoothUUID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothUUID, a3);
}

- (BOOL)supportsFaceID
{
  return self->_supportsFaceID;
}

- (void)setSupportsFaceID:(BOOL)a3
{
  self->_supportsFaceID = a3;
}

- (NSArray)supportedSetupFeatures
{
  return self->_supportedSetupFeatures;
}

- (void)setSupportedSetupFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, a3);
}

- (int64_t)majorOperatingSystemVersion
{
  return self->_majorOperatingSystemVersion;
}

- (void)setMajorOperatingSystemVersion:(int64_t)a3
{
  self->_majorOperatingSystemVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSetupFeatures, 0);
  objc_storeStrong((id *)&self->_bluetoothUUID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_defaultRemotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_remotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_lastSeen, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (id)pk_idsDestination
{
  void *v3;
  void *v4;
  void *v5;

  -[PKRemoteDevice uniqueID](self, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKRemoteDevice deviceName](self, "deviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKIDSDestination destinationWithDeviceIdentifier:name:](PKIDSDestination, "destinationWithDeviceIdentifier:name:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
