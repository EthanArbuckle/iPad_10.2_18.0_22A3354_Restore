@implementation SPUnknownBeacon

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPUnknownBeacon *v4;
  SPUnknownBeacon *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPUnknownBeacon *)a3;
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
      -[SPUnknownBeacon identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPUnknownBeacon identifier](v5, "identifier");
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

  -[SPUnknownBeacon identifier](self, "identifier");
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

  v4 = (void *)objc_opt_new();
  -[SPUnknownBeacon name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[SPUnknownBeacon identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SPUnknownBeacon beaconIdentifier](self, "beaconIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBeaconIdentifier:", v7);

  -[SPUnknownBeacon beaconLocations](self, "beaconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v4, "setBeaconLocations:", v9);

  -[SPUnknownBeacon advertisement](self, "advertisement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v4, "setAdvertisement:", v11);

  -[SPUnknownBeacon handle](self, "handle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v4, "setHandle:", v13);

  objc_msgSend(v4, "setIsIgnored:", -[SPUnknownBeacon isIgnored](self, "isIgnored"));
  objc_msgSend(v4, "setIsAppleAudioAccessory:", -[SPUnknownBeacon isAppleAudioAccessory](self, "isAppleAudioAccessory"));
  -[SPUnknownBeacon triggerDate](self, "triggerDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTriggerDate:", v14);

  -[SPUnknownBeacon ignoresUntilDate](self, "ignoresUntilDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoresUntilDate:", v15);

  -[SPUnknownBeacon type](self, "type");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setType:", v16);

  objc_msgSend(v4, "setObservationType:", -[SPUnknownBeacon observationType](self, "observationType"));
  objc_msgSend(v4, "setAlertState:", -[SPUnknownBeacon alertState](self, "alertState"));
  objc_msgSend(v4, "setCapabilities:", -[SPUnknownBeacon capabilities](self, "capabilities"));
  objc_msgSend(v4, "setConnected:", -[SPUnknownBeacon connected](self, "connected"));
  -[SPUnknownBeacon metadata](self, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setMetadata:", v18);

  -[SPUnknownBeacon productInformation](self, "productInformation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setProductInformation:", v20);

  -[SPUnknownBeacon taskInformation](self, "taskInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");
  objc_msgSend(v4, "setTaskInformation:", v22);

  objc_msgSend(v4, "setIsFindMyNetwork:", -[SPUnknownBeacon isFindMyNetwork](self, "isFindMyNetwork"));
  objc_msgSend(v4, "setIsPosh:", -[SPUnknownBeacon isPosh](self, "isPosh"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  void *v5;
  void *v6;
  id v7;

  name = self->_name;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", name, CFSTR("name"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_beaconIdentifier, CFSTR("beaconIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_beaconLocations, CFSTR("beaconLocations"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_advertisement, CFSTR("advertisement"));
  -[SPUnknownBeacon handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("handle"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_isIgnored, CFSTR("isIgnored"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isAppleAudioAccessory, CFSTR("isAppleAudioAccessory"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_triggerDate, CFSTR("triggerDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_ignoresUntilDate, CFSTR("ignoresUntilDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_observationType, CFSTR("observationType"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_alertState, CFSTR("alertState"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_capabilities);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("capabilities"));

  objc_msgSend(v7, "encodeBool:forKey:", self->_connected, CFSTR("connected"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_productInformation, CFSTR("productInformation"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_taskInformation, CFSTR("taskInformation"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isFindMyNetwork, CFSTR("isFindMyNetwork"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_isPosh, CFSTR("isPosh"));

}

- (SPUnknownBeacon)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;
  NSString *name;
  NSUUID *v7;
  NSUUID *identifier;
  NSData *v9;
  NSData *advertisement;
  NSUUID *v11;
  NSUUID *beaconIdentifier;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *beaconLocations;
  SPHandle *v19;
  SPHandle *handle;
  NSDate *v21;
  NSDate *triggerDate;
  NSDate *v23;
  NSDate *ignoresUntilDate;
  NSString *v25;
  NSString *type;
  void *v27;
  SPDiscoveredAccessoryMetadata *v28;
  SPDiscoveredAccessoryMetadata *metadata;
  SPDiscoveredAccessoryProductInformation *v30;
  SPDiscoveredAccessoryProductInformation *productInformation;
  void *v32;
  void *v33;
  void *v34;
  NSDictionary *v35;
  NSDictionary *taskInformation;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v7;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertisement"));
  v9 = (NSData *)objc_claimAutoreleasedReturnValue();
  advertisement = self->_advertisement;
  self->_advertisement = v9;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("beaconIdentifier"));
  v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  beaconIdentifier = self->_beaconIdentifier;
  self->_beaconIdentifier = v11;

  v13 = (void *)MEMORY[0x1E0C99E60];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("beaconLocations"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = v16;
  else
    v17 = (NSArray *)MEMORY[0x1E0C9AA60];
  beaconLocations = self->_beaconLocations;
  self->_beaconLocations = v17;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
  v19 = (SPHandle *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  self->_handle = v19;

  self->_isIgnored = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isIgnored"));
  self->_isAppleAudioAccessory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAppleAudioAccessory"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("triggerDate"));
  v21 = (NSDate *)objc_claimAutoreleasedReturnValue();
  triggerDate = self->_triggerDate;
  self->_triggerDate = v21;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ignoresUntilDate"));
  v23 = (NSDate *)objc_claimAutoreleasedReturnValue();
  ignoresUntilDate = self->_ignoresUntilDate;
  self->_ignoresUntilDate = v23;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  self->_type = v25;

  self->_observationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("observationType"));
  self->_alertState = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("alertState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("capabilities"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_capabilities = objc_msgSend(v27, "unsignedIntegerValue");

  self->_connected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("connected"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metadata"));
  v28 = (SPDiscoveredAccessoryMetadata *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  self->_metadata = v28;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productInformation"));
  v30 = (SPDiscoveredAccessoryProductInformation *)objc_claimAutoreleasedReturnValue();
  productInformation = self->_productInformation;
  self->_productInformation = v30;

  v32 = (void *)MEMORY[0x1E0C99E60];
  v38 = objc_opt_class();
  v39 = objc_opt_class();
  v40 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 3);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setWithArray:", v33, v38, v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("taskInformation"));
  v35 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskInformation = self->_taskInformation;
  self->_taskInformation = v35;

  self->_isFindMyNetwork = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFindMyNetwork"));
  self->_isPosh = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPosh"));

  return self;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPUnknownBeacon identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUnknownBeacon advertisement](self, "advertisement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %lu isFindMyNetwork: %i isPosh: %i>"), v4, self, v5, objc_msgSend(v6, "hash"), -[SPUnknownBeacon isFindMyNetwork](self, "isFindMyNetwork"), -[SPUnknownBeacon isPosh](self, "isPosh"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (NSArray)beaconLocations
{
  return self->_beaconLocations;
}

- (void)setBeaconLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)advertisement
{
  return self->_advertisement;
}

- (void)setAdvertisement:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)observationType
{
  return self->_observationType;
}

- (void)setObservationType:(int64_t)a3
{
  self->_observationType = a3;
}

- (int64_t)alertState
{
  return self->_alertState;
}

- (void)setAlertState:(int64_t)a3
{
  self->_alertState = a3;
}

- (unint64_t)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  self->_capabilities = a3;
}

- (BOOL)connected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)isFindMyNetwork
{
  return self->_isFindMyNetwork;
}

- (void)setIsFindMyNetwork:(BOOL)a3
{
  self->_isFindMyNetwork = a3;
}

- (BOOL)isPosh
{
  return self->_isPosh;
}

- (void)setIsPosh:(BOOL)a3
{
  self->_isPosh = a3;
}

- (SPDiscoveredAccessoryMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SPDiscoveredAccessoryProductInformation)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSUUID)beaconIdentifier
{
  return self->_beaconIdentifier;
}

- (void)setBeaconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (SPHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isIgnored
{
  return self->_isIgnored;
}

- (void)setIsIgnored:(BOOL)a3
{
  self->_isIgnored = a3;
}

- (BOOL)isAppleAudioAccessory
{
  return self->_isAppleAudioAccessory;
}

- (void)setIsAppleAudioAccessory:(BOOL)a3
{
  self->_isAppleAudioAccessory = a3;
}

- (NSDate)triggerDate
{
  return self->_triggerDate;
}

- (void)setTriggerDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDate)ignoresUntilDate
{
  return self->_ignoresUntilDate;
}

- (void)setIgnoresUntilDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoresUntilDate, 0);
  objc_storeStrong((id *)&self->_triggerDate, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_beaconIdentifier, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
  objc_storeStrong((id *)&self->_beaconLocations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
