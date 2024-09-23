@implementation SFAutoUnlockDevice

- (SFAutoUnlockDevice)init
{
  SFAutoUnlockDevice *v2;
  SFAutoUnlockDevice *v3;
  NSString *modelDescription;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockDevice;
  v2 = -[SFAutoUnlockDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    modelDescription = v2->_modelDescription;
    v2->_modelDescription = (NSString *)&stru_1E483B8E8;

  }
  return v3;
}

- (int64_t)type
{
  void *v3;
  void *v4;
  char v5;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  int v18;

  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsString:", CFSTR("watch"));

  if ((v5 & 1) != 0)
    return 1;
  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsString:", CFSTR("iphone"));

  if ((v9 & 1) != 0)
    return 2;
  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lowercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsString:", CFSTR("ipad"));

  if ((v12 & 1) != 0)
    return 3;
  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "containsString:", CFSTR("reality"));

  if ((v15 & 1) != 0)
    return 5;
  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lowercaseString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsString:", CFSTR("mac"));

  if (v18)
    return 4;
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  SFAutoUnlockDevice *v4;
  SFAutoUnlockDevice *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (SFAutoUnlockDevice *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SFPeerDevice uniqueID](self, "uniqueID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPeerDevice uniqueID](v5, "uniqueID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (v9 = -[SFAutoUnlockDevice bluetoothCloudPaired](self, "bluetoothCloudPaired"),
            v9 == -[SFAutoUnlockDevice bluetoothCloudPaired](v5, "bluetoothCloudPaired")))
      {
        -[SFPeerDevice name](self, "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPeerDevice name](v5, "name");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "isEqualToString:", v12);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (id)description
{
  _BOOL4 v3;
  const __CFString *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB3940];
  v3 = -[SFAutoUnlockDevice placeholder](self, "placeholder");
  v4 = &stru_1E483B8E8;
  if (v3)
    v4 = CFSTR("[PLACEHOLDER] ");
  v17 = v4;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAutoUnlockDevice bluetoothID](self, "bluetoothID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("YES");
  if (-[SFAutoUnlockDevice bluetoothCloudPaired](self, "bluetoothCloudPaired"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  -[SFPeerDevice modelIdentifier](self, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice name](self, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFAutoUnlockDevice unlockEnabled](self, "unlockEnabled"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (!-[SFAutoUnlockDevice canUnlockDevice](self, "canUnlockDevice"))
    v9 = CFSTR("NO");
  -[SFAutoUnlockDevice modelDescription](self, "modelDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@%@: %p, uniqueID:%@, bluetooth ID:%@, cloud paired:%@, modelIdentifier:%@, name:%@, unlockEnabled:%@ canUnlockDevice:%@ modelDescription:%@>"), v17, v6, self, v7, v8, v10, v11, v12, v13, v9, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (SFAutoUnlockDevice)initWithCoder:(id)a3
{
  id v4;
  SFAutoUnlockDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *modelDescription;
  void *v9;
  uint64_t v10;
  NSDictionary *results;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFAutoUnlockDevice;
  v5 = -[SFPeerDevice initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_bluetoothCloudPaired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("cloudPaired"));
    v5->_unlockEnabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("unlockEnabled"));
    v5->_canUnlockDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canUnlockDevice"));
    v5->_keyExists = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("keyExists"));
    v5->_placeholder = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("placeholder"));
    v5->_supportsApproveWithWatch = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsApproveWithWatch"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelDescription"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    modelDescription = v5->_modelDescription;
    v5->_modelDescription = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("metrics"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    results = v5->_results;
    v5->_results = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAutoUnlockDevice;
  v4 = a3;
  -[SFPeerDevice encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_bluetoothCloudPaired, CFSTR("cloudPaired"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_unlockEnabled, CFSTR("unlockEnabled"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canUnlockDevice, CFSTR("canUnlockDevice"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_keyExists, CFSTR("keyExists"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_placeholder, CFSTR("placeholder"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsApproveWithWatch, CFSTR("supportsApproveWithWatch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_modelDescription, CFSTR("modelDescription"));
  v5 = (void *)-[NSDictionary copy](self->_results, "copy");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("metrics"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)modelDescription
{
  return self->_modelDescription;
}

- (void)setModelDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)unlockEnabled
{
  return self->_unlockEnabled;
}

- (void)setUnlockEnabled:(BOOL)a3
{
  self->_unlockEnabled = a3;
}

- (BOOL)keyExists
{
  return self->_keyExists;
}

- (void)setKeyExists:(BOOL)a3
{
  self->_keyExists = a3;
}

- (BOOL)canUnlockDevice
{
  return self->_canUnlockDevice;
}

- (void)setCanUnlockDevice:(BOOL)a3
{
  self->_canUnlockDevice = a3;
}

- (BOOL)bluetoothCloudPaired
{
  return self->_bluetoothCloudPaired;
}

- (void)setBluetoothCloudPaired:(BOOL)a3
{
  self->_bluetoothCloudPaired = a3;
}

- (BOOL)supportsApproveWithWatch
{
  return self->_supportsApproveWithWatch;
}

- (void)setSupportsApproveWithWatch:(BOOL)a3
{
  self->_supportsApproveWithWatch = a3;
}

- (NSUUID)bluetoothID
{
  return self->_bluetoothID;
}

- (void)setBluetoothID:(id)a3
{
  objc_storeStrong((id *)&self->_bluetoothID, a3);
}

- (NSUUID)proxyBluetoothID
{
  return self->_proxyBluetoothID;
}

- (void)setProxyBluetoothID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)modelName
{
  return self->_modelName;
}

- (void)setModelName:(id)a3
{
  objc_storeStrong((id *)&self->_modelName, a3);
}

- (NSDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSData)hintToken
{
  return self->_hintToken;
}

- (void)setHintToken:(id)a3
{
  objc_storeStrong((id *)&self->_hintToken, a3);
}

- (BOOL)placeholder
{
  return self->_placeholder;
}

- (void)setPlaceholder:(BOOL)a3
{
  self->_placeholder = a3;
}

- (BOOL)supportsAlwaysDirect
{
  return self->_supportsAlwaysDirect;
}

- (void)setSupportsAlwaysDirect:(BOOL)a3
{
  self->_supportsAlwaysDirect = a3;
}

- (BOOL)supportsApproveIcon
{
  return self->_supportsApproveIcon;
}

- (void)setSupportsApproveIcon:(BOOL)a3
{
  self->_supportsApproveIcon = a3;
}

- (BOOL)supportsEncryption
{
  return self->_supportsEncryption;
}

- (void)setSupportsEncryption:(BOOL)a3
{
  self->_supportsEncryption = a3;
}

- (BOOL)supportsAdvertisingUnlocked
{
  return self->_supportsAdvertisingUnlocked;
}

- (void)setSupportsAdvertisingUnlocked:(BOOL)a3
{
  self->_supportsAdvertisingUnlocked = a3;
}

- (BOOL)supportsConnectionCache
{
  return self->_supportsConnectionCache;
}

- (void)setSupportsConnectionCache:(BOOL)a3
{
  self->_supportsConnectionCache = a3;
}

- (BOOL)supportsHEIC
{
  return self->_supportsHEIC;
}

- (void)setSupportsHEIC:(BOOL)a3
{
  self->_supportsHEIC = a3;
}

- (int64_t)majorOSVersion
{
  return self->_majorOSVersion;
}

- (void)setMajorOSVersion:(int64_t)a3
{
  self->_majorOSVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintToken, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_proxyBluetoothID, 0);
  objc_storeStrong((id *)&self->_bluetoothID, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
