@implementation SFAuthenticationDevice

- (SFAuthenticationDevice)init
{
  SFAuthenticationDevice *v2;
  SFAuthenticationDevice *v3;
  NSString *modelDescription;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAuthenticationDevice;
  v2 = -[SFAuthenticationDevice init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    modelDescription = v2->_modelDescription;
    v2->_modelDescription = (NSString *)&stru_1E483B8E8;

  }
  return v3;
}

- (SFAuthenticationDevice)initWith:(id)a3
{
  id v4;
  SFAuthenticationDevice *v5;
  uint64_t v6;
  NSString *modelDescription;
  uint64_t v8;
  NSString *idsDeviceID;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SFAuthenticationDevice;
  v5 = -[SFAuthenticationDevice init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "modelDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    modelDescription = v5->_modelDescription;
    v5->_modelDescription = (NSString *)v6;

    v5->_enabledAsKey = objc_msgSend(v4, "unlockEnabled");
    v5->_enabledAsLock = objc_msgSend(v4, "canUnlockDevice");
    v5->_bluetoothCloudPaired = objc_msgSend(v4, "bluetoothCloudPaired");
    objc_msgSend(v4, "uniqueID");
    v8 = objc_claimAutoreleasedReturnValue();
    idsDeviceID = v5->_idsDeviceID;
    v5->_idsDeviceID = (NSString *)v8;

  }
  objc_msgSend(v4, "uniqueID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setUniqueID:](v5, "setUniqueID:", v10);

  objc_msgSend(v4, "modelIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setModelIdentifier:](v5, "setModelIdentifier:", v11);

  objc_msgSend(v4, "productName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setProductName:](v5, "setProductName:", v12);

  objc_msgSend(v4, "productVersion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setProductVersion:](v5, "setProductVersion:", v13);

  objc_msgSend(v4, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setName:](v5, "setName:", v14);

  objc_msgSend(v4, "deviceColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setDeviceColor:](v5, "setDeviceColor:", v15);

  objc_msgSend(v4, "enclosureColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPeerDevice setEnclosureColor:](v5, "setEnclosureColor:", v16);

  -[SFPeerDevice setDefaultPairedDevice:](v5, "setDefaultPairedDevice:", objc_msgSend(v4, "isDefaultPairedDevice"));
  -[SFPeerDevice setValidKey:](v5, "setValidKey:", objc_msgSend(v4, "validKey"));
  -[SFPeerDevice setKeyCounter:](v5, "setKeyCounter:", objc_msgSend(v4, "keyCounter"));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  SFAuthenticationDevice *v4;
  SFAuthenticationDevice *v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  char v10;
  void *v11;
  void *v12;

  v4 = (SFAuthenticationDevice *)a3;
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
      -[SFAuthenticationDevice idsDeviceID](self, "idsDeviceID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAuthenticationDevice idsDeviceID](v5, "idsDeviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (v9 = -[SFAuthenticationDevice bluetoothCloudPaired](self, "bluetoothCloudPaired"),
            v9 == -[SFAuthenticationDevice bluetoothCloudPaired](v5, "bluetoothCloudPaired")))
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

- (NSString)modelDescription
{
  return self->_modelDescription;
}

- (BOOL)enabledAsKey
{
  return self->_enabledAsKey;
}

- (BOOL)enabledAsLock
{
  return self->_enabledAsLock;
}

- (BOOL)bluetoothCloudPaired
{
  return self->_bluetoothCloudPaired;
}

- (NSString)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceID, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
}

@end
