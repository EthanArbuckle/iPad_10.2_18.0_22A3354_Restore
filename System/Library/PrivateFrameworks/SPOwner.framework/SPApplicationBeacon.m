@implementation SPApplicationBeacon

- (SPApplicationBeacon)initWithInternalSimpleBeacon:(id)a3
{
  id v4;
  SPApplicationBeacon *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  NSUUID *identifier;
  void *v13;
  uint64_t v14;
  NSUUID *groupIdentifier;
  uint64_t v16;
  NSString *type;
  void *v18;
  uint64_t v19;
  NSUUID *productUUID;
  void *v21;
  uint64_t v22;
  SPLostModeInfo *lostModeInfo;
  void *v24;
  uint64_t v25;
  NSDictionary *taskInformation;
  uint64_t v27;
  SPHandle *owner;
  void *v29;
  uint64_t v30;
  SPBeaconRole *role;
  void *v32;
  uint64_t v33;
  NSSet *safeLocations;
  uint64_t v35;
  SPDiscoveredAccessoryProductInformation *accessoryProductInfo;
  uint64_t v37;
  NSString *systemVersion;
  uint64_t v39;
  NSString *serialNumber;
  objc_super v42;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SPApplicationBeacon;
  v5 = -[SPApplicationBeacon init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    v8 = (void *)v7;
    if (v7)
      v9 = (__CFString *)v7;
    else
      v9 = &stru_1E5E19868;
    objc_storeStrong((id *)&v5->_name, v9);

    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v11;

    objc_msgSend(v4, "groupIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSUUID *)v14;

    objc_msgSend(v4, "type");
    v16 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v16;

    v5->_batteryLevel = objc_msgSend(v4, "batteryLevel");
    objc_msgSend(v4, "productUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "copy");
    productUUID = v5->_productUUID;
    v5->_productUUID = (NSUUID *)v19;

    v5->_partIdentifier = objc_msgSend(v4, "partIdentifier");
    objc_msgSend(v4, "lostModeInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    lostModeInfo = v5->_lostModeInfo;
    v5->_lostModeInfo = (SPLostModeInfo *)v22;

    objc_msgSend(v4, "taskInformation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "copy");
    taskInformation = v5->_taskInformation;
    v5->_taskInformation = (NSDictionary *)v25;

    objc_msgSend(v4, "owner");
    v27 = objc_claimAutoreleasedReturnValue();
    owner = v5->_owner;
    v5->_owner = (SPHandle *)v27;

    objc_msgSend(v4, "role");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "copy");
    role = v5->_role;
    v5->_role = (SPBeaconRole *)v30;

    objc_msgSend(v4, "safeLocations");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "copy");
    safeLocations = v5->_safeLocations;
    v5->_safeLocations = (NSSet *)v33;

    objc_msgSend(v4, "accessoryProductInfo");
    v35 = objc_claimAutoreleasedReturnValue();
    accessoryProductInfo = v5->_accessoryProductInfo;
    v5->_accessoryProductInfo = (SPDiscoveredAccessoryProductInformation *)v35;

    v5->_isAppleAudioAccessory = objc_msgSend(v4, "isAppleAudioAccessory");
    v5->_isZeus = objc_msgSend(v4, "isZeus");
    v5->_canBeLeashedByHost = objc_msgSend(v4, "canBeLeashedByHost");
    v5->_connected = objc_msgSend(v4, "connected");
    objc_msgSend(v4, "systemVersion");
    v37 = objc_claimAutoreleasedReturnValue();
    systemVersion = v5->_systemVersion;
    v5->_systemVersion = (NSString *)v37;

    v5->_vendorId = objc_msgSend(v4, "vendorId");
    v5->_productId = objc_msgSend(v4, "productId");
    objc_msgSend(v4, "serialNumber");
    v39 = objc_claimAutoreleasedReturnValue();
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v39;

    v5->_discoveryId = (NSString *)(id)objc_msgSend(v4, "discoveryId");
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(int64_t)a3
{
  self->_batteryLevel = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)partIdentifier
{
  return self->_partIdentifier;
}

- (void)setPartIdentifier:(int64_t)a3
{
  self->_partIdentifier = a3;
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
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

- (SPHandle)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (SPBeaconRole)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSSet)safeLocations
{
  return self->_safeLocations;
}

- (void)setSafeLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (SPDiscoveredAccessoryProductInformation)accessoryProductInfo
{
  return self->_accessoryProductInfo;
}

- (void)setAccessoryProductInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
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

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (BOOL)isZeus
{
  return self->_isZeus;
}

- (void)setIsZeus:(BOOL)a3
{
  self->_isZeus = a3;
}

- (BOOL)canBeLeashedByHost
{
  return self->_canBeLeashedByHost;
}

- (void)setCanBeLeashedByHost:(BOOL)a3
{
  self->_canBeLeashedByHost = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (NSString)discoveryId
{
  return self->_discoveryId;
}

- (void)setDiscoveryId:(id)a3
{
  self->_discoveryId = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryProductInfo, 0);
  objc_storeStrong((id *)&self->_safeLocations, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_role, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
