@implementation SidecarDevice

- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5 version:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SidecarDevice *v15;
  SidecarDevice *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SidecarDevice;
  v15 = -[SidecarDevice init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_identifier, a3);
    objc_storeStrong((id *)&v16->_model, a4);
    objc_storeStrong((id *)&v16->_name, a5);
    objc_storeStrong((id *)&v16->_version, a6);
  }

  return v16;
}

- (SidecarDevice)initWithIdentifier:(id)a3 model:(id)a4 name:(id)a5
{
  return -[SidecarDevice initWithIdentifier:model:name:version:](self, "initWithIdentifier:model:name:version:", a3, a4, a5, &stru_24E5E1A30);
}

- (void)_updateFromDevice:(id)a3 generation:(unint64_t)a4
{
  void *v6;
  void *v7;
  char v8;
  NSString *v9;
  NSString *model;
  UTType *deviceType;
  void *v12;
  char v13;
  NSString *v14;
  NSString *name;
  NSString *v16;
  NSString *version;
  NSDictionary *v18;
  NSDictionary *cameraCapabilities;
  NSString *v20;
  NSString *mediaRouteIdentifier;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqual:", self->_identifier) & 1) == 0)
    __assert_rtn("-[SidecarDevice _updateFromDevice:generation:]", "SidecarDevice.m", 73, "[device.identifier isEqual:_identifier]");

  if (self->_generation != a4)
  {
    self->_generation = a4;
    objc_msgSend(v22, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", self->_model);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(v22, "model");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      model = self->_model;
      self->_model = v9;

      deviceType = self->_deviceType;
      self->_deviceType = 0;

    }
    objc_msgSend(v22, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", self->_name);

    if ((v13 & 1) == 0)
    {
      objc_msgSend(v22, "name");
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v14;

    }
    self->_status = objc_msgSend(v22, "status");
    objc_msgSend(v22, "version");
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    version = self->_version;
    self->_version = v16;

    self->_cameraState = objc_msgSend(v22, "cameraState");
    objc_msgSend(v22, "cameraCapabilities");
    v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    cameraCapabilities = self->_cameraCapabilities;
    self->_cameraCapabilities = v18;

    objc_msgSend(v22, "mediaRouteIdentifier");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    mediaRouteIdentifier = self->_mediaRouteIdentifier;
    self->_mediaRouteIdentifier = v20;

  }
}

- (BOOL)isEqual:(id)a3
{
  SidecarDevice *v4;
  SidecarDevice *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = (SidecarDevice *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else if (-[SidecarDevice isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[SidecarDevice status](v5, "status");
    if (v6 == -[SidecarDevice status](self, "status"))
    {
      -[SidecarDevice identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SidecarDevice identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[SidecarDevice model](v5, "model");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SidecarDevice model](self, "model");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
        {
          -[SidecarDevice name](v5, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SidecarDevice name](self, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[SidecarDevice version](v5, "version");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[SidecarDevice version](self, "version");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "isEqual:"))
            {
              -[SidecarDevice mediaRouteIdentifier](v5, "mediaRouteIdentifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[SidecarDevice mediaRouteIdentifier](self, "mediaRouteIdentifier");
              v17 = v13;
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v18, "isEqual:", v14);

              v13 = v17;
            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SidecarDevice identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (SidecarDevice)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  __CFString *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  __CFString *v17;
  SidecarDevice *v18;
  SidecarDevice *v19;
  SidecarDevice *v20;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  uint64_t v25;
  objc_super v26;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  decodeObject(v4, CFSTR("identifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  decodeObject(v4, CFSTR("model"), v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  decodeObject(v4, CFSTR("name"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = decodeInteger(v4, CFSTR("status"));
  decodeObject(v4, CFSTR("version"), v5);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v11 = decodeInteger(v4, CFSTR("cameraState"));
  v12 = CFSTR("cameraCapabilities");
  v13 = v4;
  if (objc_msgSend(v13, "allowsKeyedCoding"))
  {
    objc_msgSend(v13, "decodePropertyListForKey:", CFSTR("cameraCapabilities"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v13;
  }
  else
  {
    objc_msgSend(v13, "decodeObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v14 = v16;
  }

  decodeObject(v13, CFSTR("mediaRouteIdentifier"), v5);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v26.receiver = self;
  v26.super_class = (Class)SidecarDevice;
  v18 = -[SidecarDevice init](&v26, sel_init);
  v19 = v18;
  v20 = 0;
  if (v18 && v7 && v8 && v9)
  {
    objc_storeStrong((id *)&v18->_identifier, v7);
    objc_storeStrong((id *)&v19->_model, v8);
    objc_storeStrong((id *)&v19->_name, v9);
    v19->_status = v25;
    if (v10)
      v21 = v10;
    else
      v21 = &stru_24E5E1A30;
    objc_storeStrong((id *)&v19->_version, v21);
    v19->_cameraState = v11;
    if (v14)
      v22 = v14;
    else
      v22 = (void *)MEMORY[0x24BDBD1B8];
    objc_storeStrong((id *)&v19->_cameraCapabilities, v22);
    if (v17)
      v23 = v17;
    else
      v23 = &stru_24E5E1A30;
    objc_storeStrong((id *)&v19->_mediaRouteIdentifier, v23);
    v20 = v19;
  }

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  encodeObject(v5, CFSTR("identifier"), identifier);
  encodeObject(v5, CFSTR("model"), self->_model);
  encodeObject(v5, CFSTR("name"), self->_name);
  encodeInteger(v5, CFSTR("status"), self->_status);
  encodeObject(v5, CFSTR("version"), self->_version);
  encodeInteger(v5, CFSTR("cameraState"), self->_cameraState);
  encodeObject(v5, CFSTR("cameraCapabilities"), self->_cameraCapabilities);
  encodeObject(v5, CFSTR("mediaRouteIdentifier"), self->_mediaRouteIdentifier);

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[NSUUID UUIDString](self->_identifier, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringToIndex:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("IDS %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (int64_t)rapportVersion
{
  int64_t result;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  result = self->_rapportVersion;
  if (!result)
  {
    -[SidecarDevice version](self, "version");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "count");
    if (v6 < 1)
      goto LABEL_6;
    v7 = v6;
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rapportVersion += 10000 * objc_msgSend(v8, "integerValue");

    if (v7 == 1
      || (objc_msgSend(v5, "objectAtIndexedSubscript:", 1),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          self->_rapportVersion = (uint64_t)(fmax((double)objc_msgSend(v9, "integerValue"), 99.0) * 100.0
                                          + (double)self->_rapportVersion),
          v9,
          v7 <= 2))
    {
LABEL_6:
      self->_rapportVersion = (uint64_t)(double)self->_rapportVersion;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self->_rapportVersion = (uint64_t)(fmax((double)objc_msgSend(v10, "integerValue"), 99.0)
                                      + (double)self->_rapportVersion);

    }
    return self->_rapportVersion;
  }
  return result;
}

- (BOOL)hasHomeButton
{
  void *v2;
  void *v3;
  char v4;

  -[SidecarDevice deviceType](self, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.homebuttonless-device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "conformsToType:", v3);

  return v4 ^ 1;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)cameraState
{
  return self->_cameraState;
}

- (void)setCameraState:(unint64_t)a3
{
  self->_cameraState = a3;
}

- (NSDictionary)cameraCapabilities
{
  return self->_cameraCapabilities;
}

- (void)setCameraCapabilities:(id)a3
{
  NSDictionary *v4;
  NSDictionary *cameraCapabilities;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  cameraCapabilities = self->_cameraCapabilities;
  self->_cameraCapabilities = v4;

}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (void)setMediaRouteIdentifier:(id)a3
{
  NSString *v4;
  NSString *mediaRouteIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  self->_mediaRouteIdentifier = v4;

}

- (BOOL)offersAdditionalDisplay
{
  return !-[SidecarDevice isRealityDevice](self, "isRealityDevice");
}

- (UTType)deviceType
{
  UTType *deviceType;
  UTType *v4;
  UTType *v5;

  deviceType = self->_deviceType;
  if (!deviceType)
  {
    objc_msgSend(MEMORY[0x24BDF8238], "_typeWithDeviceModelCode:", self->_model);
    v4 = (UTType *)objc_claimAutoreleasedReturnValue();
    v5 = self->_deviceType;
    self->_deviceType = v4;

    deviceType = self->_deviceType;
  }
  return deviceType;
}

- (NSString)deviceTypeIdentifier
{
  void *v2;
  void *v3;

  -[SidecarDevice deviceType](self, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedDeviceType
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  -[SidecarDevice deviceType](self, "deviceType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iphone"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToType:", v3))
  {
    objc_msgSend(v3, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.ipad"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "conformsToType:", v5))
    {
      objc_msgSend(v5, "localizedDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.ipod"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.ipod"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v2, "conformsToType:", v7);

      if (v8)
        v9 = v6;
      else
        v9 = v2;
      objc_msgSend(v9, "localizedDescription");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v4;
}

- (BOOL)isRealityDevice
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[SidecarDevice deviceType](self, "deviceType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x24BDF86E0]);

  if ((v4 & 1) != 0)
    return 1;
  -[SidecarDevice model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("RealityDevice"));

  return v7;
}

- (NSURL)imageURL
{
  void *v2;
  void *v3;

  -[SidecarDevice deviceTypeIdentifier](self, "deviceTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SidecarDevice imageURLForDeviceTypeIdentifier:](SidecarDevice, "imageURLForDeviceTypeIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allDevices
{
  return (id)objc_msgSend((id)objc_opt_class(), "allDevicesByForcingFetchFromRelay:", 0);
}

+ (id)allDevicesByForcingFetchFromRelay:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  _QWORD *v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  NSObject *v28;
  void *v29;
  id v30;
  _QWORD v32[6];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD block[5];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  _BYTE v57[128];
  uint64_t v58;

  v3 = a3;
  v58 = *MEMORY[0x24BDAC8D0];
  SidecarRegisterStateNotification();
  v4 = atomic_load(&SidecarDeviceState);
  do
    v5 = __ldaxr(&allDevicesByForcingFetchFromRelay__allDevicesGeneration);
  while (__stlxr(v4, &allDevicesByForcingFetchFromRelay__allDevicesGeneration));
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__438;
  v52 = __Block_byref_object_dispose__439;
  v53 = 0;
  v6 = v5 == v4 && !v3;
  v7 = MEMORY[0x24BDAC760];
  if (!v6)
  {
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__438;
    v46 = __Block_byref_object_dispose__439;
    v47 = 0;
    SidecarQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke;
    block[3] = &unk_24E5E0F68;
    block[4] = &v42;
    dispatch_sync(v8, block);

    if (v4 || v3)
    {
      SidecarDevicesForService(CFSTR("*"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "addObject:", v15);

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
          }
          while (v12);
        }

        SidecarCoreLogSubsystem(OS_LOG_TYPE_DEFAULT);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16 && os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v10;
          _os_log_impl(&dword_220044000, v17, OS_LOG_TYPE_DEFAULT, "Forced a fetch of devices from SidecarRelay. Identifiers of devices fetched: [%@]", buf, 0xCu);
        }

      }
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDBD1A8];
    }
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v19 = (void *)v49[5];
    v49[5] = v18;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v20);
          v24 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v24, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v43[5], "objectForKeyedSubscript:", v25);
          v26 = (_QWORD *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          if (v26)
          {
            objc_msgSend(v26, "_updateFromDevice:generation:", v24, v4);
            v24 = v27;
          }
          else
          {
            v24[8] = v4;
          }
          objc_msgSend((id)v49[5], "setObject:forKeyedSubscript:", v24, v25);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v54, 16);
      }
      while (v21);
    }

    _Block_object_dispose(&v42, 8);
    v7 = MEMORY[0x24BDAC760];
  }
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__438;
  v46 = __Block_byref_object_dispose__439;
  v47 = 0;
  SidecarQueue();
  v28 = objc_claimAutoreleasedReturnValue();
  v32[0] = v7;
  v32[1] = 3221225472;
  v32[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_38;
  v32[3] = &unk_24E5E0FB8;
  v32[4] = &v48;
  v32[5] = &v42;
  dispatch_sync(v28, v32);

  v29 = (void *)v43[5];
  if (!v29)
    v29 = (void *)MEMORY[0x24BDBD1A8];
  v30 = v29;
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v30;
}

+ (id)imageURLForDeviceTypeIdentifier:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  const __CFString *v8;
  BOOL v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.homebuttonless-device"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "conformsToType:", v4);

  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iphone"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "conformsToType:", v6);

  if (v7)
  {
    v8 = CFSTR("com.apple.iphone-x");
    v9 = v5 == 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.ipad"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v3, "conformsToType:", v10);

    v8 = CFSTR("com.apple.ipad-pro");
    if (!v5)
      v8 = CFSTR("com.apple.ipad");
    v9 = v11 == 0;
  }
  if (v9)
    v12 = CFSTR("com.apple.iphone");
  else
    v12 = v8;
  SidecarCoreBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLForResource:withExtension:", v12, CFSTR("pdf"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)allDevicesByForcingFetchFromRelay__allDevicesArray, "count");
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (id)allDevicesByForcingFetchFromRelay__allDevicesArray;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        objc_msgSend(v11, "identifier", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

void __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_38(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v2)
  {
    objc_msgSend(v2, "allValues");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)allDevicesByForcingFetchFromRelay__allDevicesArray;
    allDevicesByForcingFetchFromRelay__allDevicesArray = v3;

  }
  objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", CFSTR("com.apple.iphone"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_2;
  v9[3] = &unk_24E5E0F90;
  v9[4] = v8;
  objc_msgSend((id)allDevicesByForcingFetchFromRelay__allDevicesArray, "sortedArrayUsingComparator:", v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __51__SidecarDevice_allDevicesByForcingFetchFromRelay___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  v9 = (void *)MEMORY[0x24BDF8238];
  objc_msgSend(v7, "deviceTypeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "typeWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDF8238];
  objc_msgSend(v8, "deviceTypeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "typeWithIdentifier:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v11, "conformsToType:", *(_QWORD *)(a1 + 32));
  v16 = objc_msgSend(v14, "conformsToType:", *(_QWORD *)(a1 + 32));
  if (v15)
    v17 = -1;
  else
    v17 = 1;
  if (v15 == v16)
  {
    objc_msgSend(v7, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v18, "compare:options:", v19, 705);

    if (!v17)
    {
      objc_msgSend(v7, "model");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "model");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v20, "compare:options:", v21, 65);

      if (!v17)
      {
        objc_msgSend(v7, "identifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUIDString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v23, "compare:options:", v25, 0);

      }
    }
  }

  return v17;
}

@end
