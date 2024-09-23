@implementation HAPBLEPeripheralInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAPBLEPeripheralInfo)initWithPeripheralInfo:(id)a3 advertisedProtocolVersion:(unint64_t)a4 previousProtocolVersion:(int64_t)a5 resumeSessionId:(unint64_t)a6 lastSeen:(double)a7 statusFlags:(id)a8 stateNumber:(id)a9 configNumber:(id)a10 categoryIdentifier:(id)a11 accessoryName:(id)a12
{
  id v18;
  id v19;
  HAPBLEPeripheralInfo *v20;
  HAPBLEPeripheralInfo *v21;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v18 = a11;
  v19 = a12;
  v29.receiver = self;
  v29.super_class = (Class)HAPBLEPeripheralInfo;
  v20 = -[HAPBLEPeripheralInfo init](&v29, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_peripheralUUID, a3);
    v21->_advertisedProtocolVersion = a4;
    v21->_previousProtocolVersion = a5;
    v21->_resumeSessionId = a6;
    v21->_lastSeen = a7;
    objc_storeStrong((id *)&v21->_statusFlags, a8);
    objc_storeStrong((id *)&v21->_stateNumber, a9);
    objc_storeStrong((id *)&v21->_configNumber, a10);
    objc_storeStrong((id *)&v21->_categoryIdentifier, a11);
    objc_storeStrong((id *)&v21->_accessoryName, a12);
  }

  return v21;
}

- (void)updateProtocolVersion:(unint64_t)a3
{
  if (-[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion") != a3)
  {
    -[HAPBLEPeripheralInfo setPreviousProtocolVersion:](self, "setPreviousProtocolVersion:", -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion"));
    -[HAPBLEPeripheralInfo setAdvertisedProtocolVersion:](self, "setAdvertisedProtocolVersion:", a3);
  }
}

- (void)updateResumeSessionId:(unint64_t)a3
{
  -[HAPBLEPeripheralInfo setResumeSessionId:](self, "setResumeSessionId:", a3);
}

- (void)saveBroadcastKey:(id)a3 keyUpdatedStateNumber:(id)a4 updatedTime:(double)a5
{
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey"));
  v10 = objc_msgSend(v11, "isEqualToData:", v9);

  if ((v10 & 1) == 0)
  {
    -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", v11);
    if (a5 > 0.0)
      -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", a5);
    -[HAPBLEPeripheralInfo setKeyUpdatedStateNumber:](self, "setKeyUpdatedStateNumber:", v8);
  }

}

- (void)updateBroadcastKey:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey"));
  v5 = objc_msgSend(v6, "isEqualToData:", v4);

  if ((v5 & 1) == 0)
  {
    -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", v6);
    -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", CFAbsoluteTimeGetCurrent());
  }

}

- (void)updateAccessoryName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "length");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo accessoryName](self, "accessoryName"));
  v6 = objc_msgSend(v5, "length");

  if (v4 > v6)
    -[HAPBLEPeripheralInfo setAccessoryName:](self, "setAccessoryName:", v7);

}

- (void)resetBroadcastKeyConfig
{
  -[HAPBLEPeripheralInfo setKeyUpdatedStateNumber:](self, "setKeyUpdatedStateNumber:", 0);
  -[HAPBLEPeripheralInfo setBroadcastKey:](self, "setBroadcastKey:", 0);
  -[HAPBLEPeripheralInfo setKeyUpdatedTime:](self, "setKeyUpdatedTime:", 0.0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PUUI"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion"), CFSTR("PV"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HAPBLEPeripheralInfo previousProtocolVersion](self, "previousProtocolVersion"), CFSTR("PPV"));
  objc_msgSend(v4, "encodeInt64:forKey:", -[HAPBLEPeripheralInfo resumeSessionId](self, "resumeSessionId"), CFSTR("RSI"));
  -[HAPBLEPeripheralInfo lastSeen](self, "lastSeen");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("LS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo statusFlags](self, "statusFlags"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("SF"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo stateNumber](self, "stateNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("SN"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo configNumber](self, "configNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("CF"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo categoryIdentifier](self, "categoryIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("CI"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo accessoryName](self, "accessoryName"));
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("AN"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo broadcastKey](self, "broadcastKey"));
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("BK"));

  -[HAPBLEPeripheralInfo keyUpdatedTime](self, "keyUpdatedTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("BKUT"));
  v12 = (id)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo keyUpdatedStateNumber](self, "keyUpdatedStateNumber"));
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("BKUSN"));

}

- (HAPBLEPeripheralInfo)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  HAPBLEPeripheralInfo *v6;
  id v7;
  uint64_t v8;
  NSUUID *peripheralUUID;
  double v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSNumber *statusFlags;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSNumber *stateNumber;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSNumber *configNumber;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSNumber *categoryIdentifier;
  uint64_t v27;
  id v28;
  uint64_t v29;
  NSString *accessoryName;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSData *broadcastKey;
  double v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  NSNumber *keyUpdatedStateNumber;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)HAPBLEPeripheralInfo;
  v6 = -[HAPBLEPeripheralInfo init](&v41, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("PUUI"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    peripheralUUID = v6->_peripheralUUID;
    v6->_peripheralUUID = (NSUUID *)v8;

    v6->_advertisedProtocolVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PV"));
    v6->_previousProtocolVersion = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PPV"));
    v6->_resumeSessionId = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("RSI"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("LS"));
    v6->_lastSeen = v10;
    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v11), CFSTR("SF"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    statusFlags = v6->_statusFlags;
    v6->_statusFlags = (NSNumber *)v13;

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v15), CFSTR("SN"));
    v17 = objc_claimAutoreleasedReturnValue(v16);
    stateNumber = v6->_stateNumber;
    v6->_stateNumber = (NSNumber *)v17;

    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v19), CFSTR("CF"));
    v21 = objc_claimAutoreleasedReturnValue(v20);
    configNumber = v6->_configNumber;
    v6->_configNumber = (NSNumber *)v21;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v23), CFSTR("CI"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    categoryIdentifier = v6->_categoryIdentifier;
    v6->_categoryIdentifier = (NSNumber *)v25;

    v28 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v27), CFSTR("AN"));
    v29 = objc_claimAutoreleasedReturnValue(v28);
    accessoryName = v6->_accessoryName;
    v6->_accessoryName = (NSString *)v29;

    v32 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v31), CFSTR("BK"));
    v33 = objc_claimAutoreleasedReturnValue(v32);
    broadcastKey = v6->_broadcastKey;
    v6->_broadcastKey = (NSData *)v33;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("BKUT"));
    v6->_keyUpdatedTime = v35;
    v37 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v36), CFSTR("BKUSN"));
    v38 = objc_claimAutoreleasedReturnValue(v37);
    keyUpdatedStateNumber = v6->_keyUpdatedStateNumber;
    v6->_keyUpdatedStateNumber = (NSNumber *)v38;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HAPBLEPeripheralInfo *v4;
  uint64_t v5;
  HAPBLEPeripheralInfo *v6;
  uint64_t v7;
  HAPBLEPeripheralInfo *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (HAPBLEPeripheralInfo *)a3;
  v6 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    v7 = objc_opt_class(v4, v5);
    if ((objc_opt_isKindOfClass(self, v7) & 1) != 0)
    {
      v8 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo peripheralUUID](v8, "peripheralUUID"));

      v11 = objc_msgSend(v9, "isEqual:", v10);
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v15;
  void *v16;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo peripheralUUID](self, "peripheralUUID"));
  v15 = -[HAPBLEPeripheralInfo advertisedProtocolVersion](self, "advertisedProtocolVersion");
  v3 = -[HAPBLEPeripheralInfo previousProtocolVersion](self, "previousProtocolVersion");
  v4 = -[HAPBLEPeripheralInfo resumeSessionId](self, "resumeSessionId");
  -[HAPBLEPeripheralInfo lastSeen](self, "lastSeen");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo statusFlags](self, "statusFlags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo stateNumber](self, "stateNumber"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo configNumber](self, "configNumber"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo categoryIdentifier](self, "categoryIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo accessoryName](self, "accessoryName"));
  -[HAPBLEPeripheralInfo keyUpdatedTime](self, "keyUpdatedTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBLEPeripheralInfo keyUpdatedStateNumber](self, "keyUpdatedStateNumber"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nPeripheral Info:\n\tPeripheral UUID: %@,\n\tProtocol Version: %tu,\n\tPrevious Version: %tu,\n\tResume Id: %llu,\n\tLast Seen:%@,\n\tStatus Flags: %@,\n\tState Number:%@,\n\tConfig Number: %@,\n\tCategory Id: %@,\n\tName: %@,\n\tKeyUpdatedTime: %@,\n\tKeyUpdated State Number: %@"), v16, v15, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12));

  return v13;
}

- (NSUUID)peripheralUUID
{
  return self->_peripheralUUID;
}

- (unint64_t)advertisedProtocolVersion
{
  return self->_advertisedProtocolVersion;
}

- (void)setAdvertisedProtocolVersion:(unint64_t)a3
{
  self->_advertisedProtocolVersion = a3;
}

- (unint64_t)previousProtocolVersion
{
  return self->_previousProtocolVersion;
}

- (void)setPreviousProtocolVersion:(unint64_t)a3
{
  self->_previousProtocolVersion = a3;
}

- (unint64_t)resumeSessionId
{
  return self->_resumeSessionId;
}

- (void)setResumeSessionId:(unint64_t)a3
{
  self->_resumeSessionId = a3;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (NSNumber)statusFlags
{
  return self->_statusFlags;
}

- (NSNumber)stateNumber
{
  return self->_stateNumber;
}

- (void)setStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_stateNumber, a3);
}

- (NSNumber)configNumber
{
  return self->_configNumber;
}

- (NSNumber)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryName, a3);
}

- (NSData)broadcastKey
{
  return self->_broadcastKey;
}

- (void)setBroadcastKey:(id)a3
{
  objc_storeStrong((id *)&self->_broadcastKey, a3);
}

- (double)keyUpdatedTime
{
  return self->_keyUpdatedTime;
}

- (void)setKeyUpdatedTime:(double)a3
{
  self->_keyUpdatedTime = a3;
}

- (NSNumber)keyUpdatedStateNumber
{
  return self->_keyUpdatedStateNumber;
}

- (void)setKeyUpdatedStateNumber:(id)a3
{
  objc_storeStrong((id *)&self->_keyUpdatedStateNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyUpdatedStateNumber, 0);
  objc_storeStrong((id *)&self->_broadcastKey, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_configNumber, 0);
  objc_storeStrong((id *)&self->_stateNumber, 0);
  objc_storeStrong((id *)&self->_statusFlags, 0);
  objc_storeStrong((id *)&self->_peripheralUUID, 0);
}

@end
