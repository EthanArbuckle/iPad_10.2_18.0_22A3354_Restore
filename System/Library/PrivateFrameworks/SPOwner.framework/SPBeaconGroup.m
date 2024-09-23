@implementation SPBeaconGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SPBeaconGroup *v4;
  SPBeaconGroup *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (SPBeaconGroup *)a3;
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
      -[SPBeaconGroup identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SPBeaconGroup identifier](v5, "identifier");
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

  -[SPBeaconGroup identifier](self, "identifier");
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

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setVersion:", -[SPBeaconGroup version](self, "version"));
  -[SPBeaconGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setIdentifier:", v6);

  -[SPBeaconGroup name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setName:", v8);

  -[SPBeaconGroup beaconIdentifiers](self, "beaconIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setBeaconIdentifiers:", v10);

  -[SPBeaconGroup macAddress](self, "macAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setMacAddress:", v12);

  objc_msgSend(v4, "setIsPairingComplete:", -[SPBeaconGroup isPairingComplete](self, "isPairingComplete"));
  objc_msgSend(v4, "setIsClassicConnected:", -[SPBeaconGroup isClassicConnected](self, "isClassicConnected"));
  objc_msgSend(v4, "setIsConnected:", -[SPBeaconGroup isConnected](self, "isConnected"));
  objc_msgSend(v4, "setIsFindMyNetworkEnabled:", -[SPBeaconGroup isFindMyNetworkEnabled](self, "isFindMyNetworkEnabled"));
  objc_msgSend(v4, "setStatus:", -[SPBeaconGroup status](self, "status"));
  objc_msgSend(v4, "setClassification:", -[SPBeaconGroup classification](self, "classification"));
  -[SPBeaconGroup beaconMap](self, "beaconMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setBeaconMap:", v14);

  -[SPBeaconGroup taskInformation](self, "taskInformation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setTaskInformation:", v16);

  -[SPBeaconGroup lostModeInfo](self, "lostModeInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setLostModeInfo:", v18);

  -[SPBeaconGroup multipartStatus](self, "multipartStatus");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v4, "setMultipartStatus:", v20);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beaconIdentifiers, CFSTR("beaconIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_macAddress, CFSTR("macAddress"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isPairingComplete, CFSTR("isPairingComplete"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isClassicConnected, CFSTR("isClassicConnected"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isConnected, CFSTR("isConnected"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isFindMyNetworkEnabled, CFSTR("isFindMyNetworkEnabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_status, CFSTR("status"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_classification, CFSTR("classification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_beaconMap, CFSTR("beaconMap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_taskInformation, CFSTR("taskInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lostModeInfo, CFSTR("lostModeInfo"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_multipartStatus, CFSTR("multipartStatus"));

}

- (SPBeaconGroup)initWithCoder:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *identifier;
  NSString *v7;
  NSString *name;
  void *v9;
  void *v10;
  void *v11;
  NSSet *v12;
  NSSet *beaconIdentifiers;
  NSData *v14;
  NSData *macAddress;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *v19;
  NSDictionary *beaconMap;
  void *v21;
  void *v22;
  void *v23;
  NSDictionary *v24;
  NSDictionary *taskInformation;
  SPLostModeInfo *v26;
  SPLostModeInfo *lostModeInfo;
  void *v28;
  void *v29;
  void *v30;
  NSSet *v31;
  NSSet *multipartStatus;
  _QWORD v34[2];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  self->_identifier = v5;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  self->_name = v7;

  v9 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("beaconIdentifiers"));
  v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
  beaconIdentifiers = self->_beaconIdentifiers;
  self->_beaconIdentifiers = v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("macAddress"));
  v14 = (NSData *)objc_claimAutoreleasedReturnValue();
  macAddress = self->_macAddress;
  self->_macAddress = v14;

  self->_isPairingComplete = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPairingComplete"));
  self->_isClassicConnected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isClassicConnected"));
  self->_isConnected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isConnected"));
  self->_isFindMyNetworkEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isFindMyNetworkEnabled"));
  self->_status = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("status"));
  self->_classification = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("classification"));
  v16 = (void *)MEMORY[0x1E0C99E60];
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("beaconMap"));
  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  beaconMap = self->_beaconMap;
  self->_beaconMap = v19;

  v21 = (void *)MEMORY[0x1E0C99E60];
  v35[0] = objc_opt_class();
  v35[1] = objc_opt_class();
  v35[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("taskInformation"));
  v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  taskInformation = self->_taskInformation;
  self->_taskInformation = v24;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lostModeInfo"));
  v26 = (SPLostModeInfo *)objc_claimAutoreleasedReturnValue();
  lostModeInfo = self->_lostModeInfo;
  self->_lostModeInfo = v26;

  v28 = (void *)MEMORY[0x1E0C99E60];
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setWithArray:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("multipartStatus"));
  v31 = (NSSet *)objc_claimAutoreleasedReturnValue();

  multipartStatus = self->_multipartStatus;
  self->_multipartStatus = v31;

  return self;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[SPBeaconGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPBeaconGroup name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@ %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)beaconIdentifiers
{
  return self->_beaconIdentifiers;
}

- (void)setBeaconIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (void)setMacAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isPairingComplete
{
  return self->_isPairingComplete;
}

- (void)setIsPairingComplete:(BOOL)a3
{
  self->_isPairingComplete = a3;
}

- (BOOL)isClassicConnected
{
  return self->_isClassicConnected;
}

- (void)setIsClassicConnected:(BOOL)a3
{
  self->_isClassicConnected = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)isFindMyNetworkEnabled
{
  return self->_isFindMyNetworkEnabled;
}

- (void)setIsFindMyNetworkEnabled:(BOOL)a3
{
  self->_isFindMyNetworkEnabled = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (int64_t)classification
{
  return self->_classification;
}

- (void)setClassification:(int64_t)a3
{
  self->_classification = a3;
}

- (NSDictionary)beaconMap
{
  return self->_beaconMap;
}

- (void)setBeaconMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)taskInformation
{
  return self->_taskInformation;
}

- (void)setTaskInformation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SPLostModeInfo)lostModeInfo
{
  return self->_lostModeInfo;
}

- (void)setLostModeInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSSet)multipartStatus
{
  return self->_multipartStatus;
}

- (void)setMultipartStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multipartStatus, 0);
  objc_storeStrong((id *)&self->_lostModeInfo, 0);
  objc_storeStrong((id *)&self->_taskInformation, 0);
  objc_storeStrong((id *)&self->_beaconMap, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);
  objc_storeStrong((id *)&self->_beaconIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
