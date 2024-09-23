@implementation SPBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (SPHandle)SPOwner
{
  return +[SPHandle handleWithEmailAddress:](SPHandle, "handleWithEmailAddress:", CFSTR("owner@localhost"));
}

- (BOOL)isEqual:(id)a3
{
  SPBeacon *v4;
  SPBeacon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPBeacon *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SPBeacon identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPBeacon identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SPBeacon identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = (void *)objc_opt_new();
  -[SPBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  -[SPBeacon groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGroupIdentifier:", v6);

  objc_msgSend(v4, "setPartIdentifier:", -[SPBeacon partIdentifier](self, "partIdentifier"));
  -[SPBeacon stableIdentifier](self, "stableIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setStableIdentifier:", v8);

  -[SPBeacon owner](self, "owner");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setOwner:", v10);

  objc_msgSend(v4, "setAccepted:", -[SPBeacon accepted](self, "accepted"));
  -[SPBeacon name](self, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setName:", v12);

  -[SPBeacon model](self, "model");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setModel:", v14);

  -[SPBeacon pairingDate](self, "pairingDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setPairingDate:", v16);

  -[SPBeacon role](self, "role");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setRole:", v18);

  -[SPBeacon lostModeInfo](self, "lostModeInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setLostModeInfo:", v20);

  -[SPBeacon shares](self, "shares");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setShares:", v22);

  -[SPBeacon taskInformation](self, "taskInformation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v4, "setTaskInformation:", v24);

  -[SPBeacon correlationIdentifier](self, "correlationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");
  objc_msgSend(v4, "setCorrelationIdentifier:", v26);

  -[SPBeacon type](self, "type");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v27, "copy");
  objc_msgSend(v4, "setType:", v28);

  objc_msgSend(v4, "setIsZeus:", -[SPBeacon isZeus](self, "isZeus"));
  -[SPBeacon systemVersion](self, "systemVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v4, "setSystemVersion:", v30);

  -[SPBeacon productUUID](self, "productUUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  objc_msgSend(v4, "setProductUUID:", v32);

  objc_msgSend(v4, "setVendorId:", -[SPBeacon vendorId](self, "vendorId"));
  objc_msgSend(v4, "setProductId:", -[SPBeacon productId](self, "productId"));
  objc_msgSend(v4, "setConnected:", -[SPBeacon connected](self, "connected"));
  -[SPBeacon connectedStateExpiryDate](self, "connectedStateExpiryDate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copy");
  objc_msgSend(v4, "setConnectedStateExpiryDate:", v34);

  objc_msgSend(v4, "setConnectionAllowed:", -[SPBeacon connectionAllowed](self, "connectionAllowed"));
  objc_msgSend(v4, "setConnectableDeviceCount:", -[SPBeacon connectableDeviceCount](self, "connectableDeviceCount"));
  -[SPBeacon separationState](self, "separationState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copy");
  objc_msgSend(v4, "setSeparationState:", v36);

  -[SPBeacon safeLocations](self, "safeLocations");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");
  objc_msgSend(v4, "setSafeLocations:", v38);

  objc_msgSend(v4, "setCanBeLeashedByHost:", -[SPBeacon canBeLeashedByHost](self, "canBeLeashedByHost"));
  objc_msgSend(v4, "setBeaconSeparationState:", -[SPBeacon beaconSeparationState](self, "beaconSeparationState"));
  objc_msgSend(v4, "setBatteryLevel:", -[SPBeacon batteryLevel](self, "batteryLevel"));
  -[SPBeacon serialNumber](self, "serialNumber");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSerialNumber:", v39);

  -[SPBeacon locationProviders](self, "locationProviders");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v40, "copy");
  objc_msgSend(v4, "setLocationProviders:", v41);

  objc_msgSend(v4, "setKeySyncLastObservedIndex:", -[SPBeacon keySyncLastObservedIndex](self, "keySyncLastObservedIndex"));
  -[SPBeacon keySyncLastIndexObservationDate](self, "keySyncLastIndexObservationDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v42, "copy");
  objc_msgSend(v4, "setKeySyncLastIndexObservationDate:", v43);

  objc_msgSend(v4, "setKeySyncWildIndexFallback:", -[SPBeacon keySyncWildIndexFallback](self, "keySyncWildIndexFallback"));
  objc_msgSend(v4, "setKeyAlignmentLastObservedIndex:", -[SPBeacon keyAlignmentLastObservedIndex](self, "keyAlignmentLastObservedIndex"));
  -[SPBeacon keyAlignmentLastIndexObservationDate](self, "keyAlignmentLastIndexObservationDate");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v44, "copy");
  objc_msgSend(v4, "setKeyAlignmentLastIndexObservationDate:", v45);

  -[SPBeacon accessoryProductInfo](self, "accessoryProductInfo");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = (void *)objc_msgSend(v46, "copy");
  objc_msgSend(v4, "setAccessoryProductInfo:", v47);

  objc_msgSend(v4, "setInternalShareType:", -[SPBeacon internalShareType](self, "internalShareType"));
  -[SPBeacon ownerBeaconIdentifier](self, "ownerBeaconIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v48, "copy");
  objc_msgSend(v4, "setOwnerBeaconIdentifier:", v49);

  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  identifier = self->_identifier;
  v11 = a3;
  objc_msgSend(v11, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_partIdentifier, CFSTR("partIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_stableIdentifier, CFSTR("stableIdentifier"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_owner, CFSTR("owner"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_accepted, CFSTR("accepted"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_pairingDate, CFSTR("pairingDate"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_lostModeInfo, CFSTR("lostModeInfo"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_shares, CFSTR("shares"));
  -[SPBeacon taskInformation](self, "taskInformation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("taskInformation"));

  -[SPBeacon correlationIdentifier](self, "correlationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("correlationIdentifier"));

  -[SPBeacon role](self, "role");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("role"));

  objc_msgSend(v11, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v11, "encodeBool:forKey:", self->_isZeus, CFSTR("isZeus"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_systemVersion, CFSTR("systemVersion"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_productUUID, CFSTR("productUUID"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_vendorId, CFSTR("vendorId"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_productId, CFSTR("productId"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon connected](self, "connected"), CFSTR("connected"));
  -[SPBeacon connectedStateExpiryDate](self, "connectedStateExpiryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("connectedStateExpiryDate"));

  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon connectionAllowed](self, "connectionAllowed"), CFSTR("connectionAllowed"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon connectableDeviceCount](self, "connectableDeviceCount"), CFSTR("connectableDeviceCount"));
  -[SPBeacon separationState](self, "separationState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("separationState"));

  -[SPBeacon safeLocations](self, "safeLocations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("safeLocations"));

  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon canBeLeashedByHost](self, "canBeLeashedByHost"), CFSTR("canBeLeashedByHost"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon beaconSeparationState](self, "beaconSeparationState"), CFSTR("beaconSeparationState"));
  objc_msgSend(v11, "encodeInteger:forKey:", -[SPBeacon batteryLevel](self, "batteryLevel"), CFSTR("batteryLevel"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_serialNumber, CFSTR("serialNumber"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_locationProviders, CFSTR("locationProviders"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_keySyncLastObservedIndex, CFSTR("keySyncLastObservedIndex"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_keySyncLastIndexObservationDate, CFSTR("keySyncLastIndexObservationDate"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_keySyncWildIndexFallback, CFSTR("keySyncWildIndexFallback"));
  objc_msgSend(v11, "encodeInt64:forKey:", self->_keyAlignmentLastObservedIndex, CFSTR("keyAlignmentLastObservedIndex"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_keyAlignmentLastIndexObservationDate, CFSTR("keyAlignmentLastIndexObservationDate"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_accessoryProductInfo, CFSTR("accessoryProductInfo"));
  objc_msgSend(v11, "encodeInteger:forKey:", self->_internalShareType, CFSTR("internalShareType"));
  objc_msgSend(v11, "encodeObject:forKey:", self->_ownerBeaconIdentifier, CFSTR("ownerBeaconIdentifier"));
  objc_msgSend(v11, "encodeBool:forKey:", -[SPBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"), CFSTR("isAppleAudioAccessory"));

}

- (SPBeacon)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSUUID *v7;
  NSUUID *groupIdentifier;
  NSString *v9;
  NSString *stableIdentifier;
  SPHandle *v11;
  SPHandle *owner;
  NSString *v13;
  NSString *name;
  NSString *v15;
  NSString *model;
  SPBeaconRole *v17;
  SPBeaconRole *role;
  void *v19;
  void *v20;
  void *v21;
  NSSet *v22;
  NSSet *shares;
  SPLostModeInfo *v24;
  SPLostModeInfo *lostModeInfo;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *v29;
  NSDictionary *taskInformation;
  NSString *v31;
  NSString *correlationIdentifier;
  NSDate *v33;
  NSDate *pairingDate;
  NSString *v35;
  NSString *type;
  NSString *v37;
  NSString *systemVersion;
  NSUUID *v39;
  NSUUID *productUUID;
  NSDate *v41;
  NSDate *connectedStateExpiryDate;
  NSString *v43;
  NSString *separationState;
  void *v45;
  void *v46;
  void *v47;
  NSSet *v48;
  NSSet *safeLocations;
  NSString *v50;
  NSString *serialNumber;
  void *v52;
  void *v53;
  void *v54;
  NSSet *v55;
  NSSet *locationProviders;
  NSDate *v57;
  NSDate *keySyncLastIndexObservationDate;
  NSDate *v59;
  NSDate *keyAlignmentLastIndexObservationDate;
  SPDiscoveredAccessoryProductInformation *v61;
  SPDiscoveredAccessoryProductInformation *accessoryProductInfo;
  NSUUID *v63;
  NSUUID *ownerBeaconIdentifier;
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[3];

  v69[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  groupIdentifier = self->_groupIdentifier;
  self->_groupIdentifier = v7;

  self->_partIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("partIdentifier"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stableIdentifier"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  stableIdentifier = self->_stableIdentifier;
  self->_stableIdentifier = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owner"));
  v11 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  owner = self->_owner;
  self->_owner = v11;

  self->_accepted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accepted"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
  v15 = (NSString *)objc_claimAutoreleasedReturnValue();
  model = self->_model;
  self->_model = v15;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("role"));
  v17 = (SPBeaconRole *)objc_claimAutoreleasedReturnValue();
  role = self->_role;
  self->_role = v17;

  v19 = (void *)MEMORY[0x1E0C99E60];
  v69[0] = objc_opt_class();
  v69[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("shares"));
  v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
  shares = self->_shares;
  self->_shares = v22;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeInfo"));
  v24 = (SPLostModeInfo *)objc_claimAutoreleasedReturnValue();
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v24;

  v26 = (void *)MEMORY[0x1E0C99E60];
  v68[0] = objc_opt_class();
  v68[1] = objc_opt_class();
  v68[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 3);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("taskInformation"));
  v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskInformation = self->_taskInformation;
  self->_taskInformation = v29;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("correlationIdentifier"));
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  correlationIdentifier = self->_correlationIdentifier;
  self->_correlationIdentifier = v31;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pairingDate"));
  v33 = (NSDate *)objc_claimAutoreleasedReturnValue();
  pairingDate = self->_pairingDate;
  self->_pairingDate = v33;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v35 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v35;

  self->_isZeus = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isZeus"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemVersion"));
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  systemVersion = self->_systemVersion;
  self->_systemVersion = v37;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productUUID"));
  v39 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  productUUID = self->_productUUID;
  self->_productUUID = v39;

  self->_vendorId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("vendorId"));
  self->_productId = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("productId"));
  self->_connected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connected"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("connectedStateExpiryDate"));
  v41 = (NSDate *)objc_claimAutoreleasedReturnValue();
  connectedStateExpiryDate = self->_connectedStateExpiryDate;
  self->_connectedStateExpiryDate = v41;

  self->_connectionAllowed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connectionAllowed"));
  self->_connectableDeviceCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("connectableDeviceCount"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("separationState"));
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  separationState = self->_separationState;
  self->_separationState = v43;

  self->_canBeLeashedByHost = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeLeashedByHost"));
  v45 = (void *)MEMORY[0x1E0C99E60];
  v67[0] = objc_opt_class();
  v67[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setWithArray:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v47, CFSTR("safeLocations"));
  v48 = (NSSet *)objc_claimAutoreleasedReturnValue();
  safeLocations = self->_safeLocations;
  self->_safeLocations = v48;

  self->_beaconSeparationState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("beaconSeparationState"));
  self->_batteryLevel = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("batteryLevel"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serialNumber"));
  v50 = (NSString *)objc_claimAutoreleasedReturnValue();
  serialNumber = self->_serialNumber;
  self->_serialNumber = v50;

  v52 = (void *)MEMORY[0x1E0C99E60];
  v66[0] = objc_opt_class();
  v66[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setWithArray:", v53, v66[0]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v54, CFSTR("locationProviders"));
  v55 = (NSSet *)objc_claimAutoreleasedReturnValue();
  locationProviders = self->_locationProviders;
  self->_locationProviders = v55;

  self->_keySyncLastObservedIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("keySyncLastObservedIndex"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keySyncLastIndexObservationDate"));
  v57 = (NSDate *)objc_claimAutoreleasedReturnValue();
  keySyncLastIndexObservationDate = self->_keySyncLastIndexObservationDate;
  self->_keySyncLastIndexObservationDate = v57;

  self->_keySyncWildIndexFallback = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("keySyncWildIndexFallback"));
  self->_keyAlignmentLastObservedIndex = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("keyAlignmentLastObservedIndex"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("keyAlignmentLastIndexObservationDate"));
  v59 = (NSDate *)objc_claimAutoreleasedReturnValue();
  keyAlignmentLastIndexObservationDate = self->_keyAlignmentLastIndexObservationDate;
  self->_keyAlignmentLastIndexObservationDate = v59;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessoryProductInfo"));
  v61 = (SPDiscoveredAccessoryProductInformation *)objc_claimAutoreleasedReturnValue();
  accessoryProductInfo = self->_accessoryProductInfo;
  self->_accessoryProductInfo = v61;

  self->_internalShareType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("internalShareType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ownerBeaconIdentifier"));
  v63 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  ownerBeaconIdentifier = self->_ownerBeaconIdentifier;
  self->_ownerBeaconIdentifier = v63;

  LOBYTE(v54) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleAudioAccessory"));
  self->_isAppleAudioAccessory = (char)v54;
  return self;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[SPBeacon groupIdentifier](self, "groupIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  if (v3)
  {
    -[SPBeacon groupIdentifier](self, "groupIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPBeacon identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p (%@) %@>"), v5, self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SPBeacon identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p %@>"), v5, self, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SPBeaconRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)shares
{
  return self->_shares;
}

- (void)setShares:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (int64_t)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(int64_t)a3
{
  self->_vendorId = a3;
}

- (int64_t)productId
{
  return self->_productId;
}

- (void)setProductId:(int64_t)a3
{
  self->_productId = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)canBeLeashedByHost
{
  return self->_canBeLeashedByHost;
}

- (void)setCanBeLeashedByHost:(BOOL)a3
{
  self->_canBeLeashedByHost = a3;
}

- (BOOL)connectionAllowed
{
  return self->_connectionAllowed;
}

- (void)setConnectionAllowed:(BOOL)a3
{
  self->_connectionAllowed = a3;
}

- (int64_t)connectableDeviceCount
{
  return self->_connectableDeviceCount;
}

- (void)setConnectableDeviceCount:(int64_t)a3
{
  self->_connectableDeviceCount = a3;
}

- (NSString)separationState
{
  return self->_separationState;
}

- (void)setSeparationState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)beaconSeparationState
{
  return self->_beaconSeparationState;
}

- (void)setBeaconSeparationState:(int64_t)a3
{
  self->_beaconSeparationState = a3;
}

- (NSSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSSet)locationProviders
{
  return self->_locationProviders;
}

- (void)setLocationProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo
{
  return self->_accessoryProductInfo;
}

- (void)setAccessoryProductInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSString)stableIdentifier
{
  return self->_stableIdentifier;
}

- (void)setStableIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSDate)pairingDate
{
  return self->_pairingDate;
}

- (void)setPairingDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)correlationIdentifier
{
  return self->_correlationIdentifier;
}

- (void)setCorrelationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSDate)connectedStateExpiryDate
{
  return self->_connectedStateExpiryDate;
}

- (void)setConnectedStateExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unint64_t)keySyncLastObservedIndex
{
  return self->_keySyncLastObservedIndex;
}

- (void)setKeySyncLastObservedIndex:(unint64_t)a3
{
  self->_keySyncLastObservedIndex = a3;
}

- (NSDate)keySyncLastIndexObservationDate
{
  return self->_keySyncLastIndexObservationDate;
}

- (void)setKeySyncLastIndexObservationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (unint64_t)keySyncWildIndexFallback
{
  return self->_keySyncWildIndexFallback;
}

- (void)setKeySyncWildIndexFallback:(unint64_t)a3
{
  self->_keySyncWildIndexFallback = a3;
}

- (unint64_t)keyAlignmentLastObservedIndex
{
  return self->_keyAlignmentLastObservedIndex;
}

- (void)setKeyAlignmentLastObservedIndex:(unint64_t)a3
{
  self->_keyAlignmentLastObservedIndex = a3;
}

- (NSDate)keyAlignmentLastIndexObservationDate
{
  return self->_keyAlignmentLastIndexObservationDate;
}

- (void)setKeyAlignmentLastIndexObservationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (int64_t)internalShareType
{
  return self->_internalShareType;
}

- (void)setInternalShareType:(int64_t)a3
{
  self->_internalShareType = a3;
}

- (NSUUID)ownerBeaconIdentifier
{
  return self->_ownerBeaconIdentifier;
}

- (void)setOwnerBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerBeaconIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAlignmentLastIndexObservationDate, 0);
  objc_storeStrong((id *)&self->_keySyncLastIndexObservationDate, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_connectedStateExpiryDate, 0);
  objc_storeStrong((id *)&self->_correlationIdentifier, 0);
  objc_storeStrong((id *)&self->_pairingDate, 0);
  objc_storeStrong((id *)&self->_stableIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_locationProviders, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_separationState, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_shares, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
