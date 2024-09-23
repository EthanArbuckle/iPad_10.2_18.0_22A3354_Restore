@implementation SFCompanionService

+ (id)serviceFromDictionary:(id)a3
{
  id v3;
  SFCompanionService *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(SFCompanionService);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ServiceName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setServiceType:](v4, "setServiceType:", v5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setDeviceID:](v4, "setDeviceID:", v6);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ServiceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setIdentifier:](v4, "setIdentifier:", v7);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DeviceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setDeviceName:](v4, "setDeviceName:", v8);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ManagerID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService setManagerID:](v4, "setManagerID:", v9);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IPAddress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFCompanionService setIpAddress:](v4, "setIpAddress:", v10);
  return v4;
}

+ (id)serviceFromAuthorData:(id)a3
{
  void *v3;
  SFCompanionService *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, &v10, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(SFCompanionService);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unique_id"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCompanionService setIdentifier:](v4, "setIdentifier:", v5);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unique_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCompanionService setServiceType:](v4, "setServiceType:", v6);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("manager_id"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCompanionService setManagerID:](v4, "setManagerID:", v7);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (SFCompanionService)initWithServiceName:(id)a3
{
  id v4;
  SFCompanionService *v5;
  SFCompanionService *v6;
  NSString *deviceID;
  NSString *deviceName;
  NSNumber *nsxpcVersion;
  uint64_t v10;
  NSString *serviceType;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *identifier;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SFCompanionService;
  v5 = -[SFCompanionService init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    deviceID = v5->_deviceID;
    v5->_deviceID = 0;

    deviceName = v6->_deviceName;
    v6->_deviceName = 0;

    nsxpcVersion = v6->_nsxpcVersion;
    v6->_nsxpcVersion = 0;

    v10 = objc_msgSend(v4, "copy");
    serviceType = v6->_serviceType;
    v6->_serviceType = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v14;

  }
  return v6;
}

- (id)messageData
{
  void *v3;
  void *v4;
  NSString *managerID;
  NSString *identifier;
  NSString *serviceType;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSString *deviceID;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  managerID = self->_managerID;
  if (managerID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", managerID, CFSTR("manager_id"));
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", identifier, CFSTR("unique_id"));
  serviceType = self->_serviceType;
  if (serviceType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", serviceType, CFSTR("client_id"));
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  if (v9)
  {
    v10 = v9;
    streams_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SFCompanionService messageData].cold.2((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", &unk_1E4890880, CFSTR("message_version"));
    deviceID = self->_deviceID;
    if (deviceID)
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", deviceID, CFSTR("bonjour_name"));
    if (v8)
      -[NSObject setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v8, CFSTR("author_data"));
    v28 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v11, 200, 0, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v28;
    if (v10)
    {
      streams_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SFCompanionService messageData].cold.1((uint64_t)v10, v20, v21, v22, v23, v24, v25, v26);

    }
  }

  return v18;
}

- (SFCompanionService)initWithCoder:(id)a3
{
  id v4;
  SFCompanionService *v5;
  uint64_t v6;
  NSString *deviceName;
  uint64_t v8;
  NSString *serviceType;
  uint64_t v10;
  NSString *deviceID;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *managerID;
  void *v16;
  uint64_t v17;
  NSString *ipAddress;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SFCompanionService;
  v5 = -[SFCompanionService init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service_name"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceType = v5->_serviceType;
    v5->_serviceType = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device_identifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    deviceID = v5->_deviceID;
    v5->_deviceID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("unique_identifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("manager_identifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    managerID = v5->_managerID;
    v5->_managerID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ip_address"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    ipAddress = v5->_ipAddress;
    v5->_ipAddress = (NSString *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *deviceName;
  id v5;

  deviceName = self->_deviceName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", deviceName, CFSTR("device_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceType, CFSTR("service_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceID, CFSTR("device_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("unique_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_managerID, CFSTR("manager_identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ipAddress, CFSTR("ip_address"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[SFCompanionService deviceID](self, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceID:", v5);

    -[SFCompanionService managerID](self, "managerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setManagerID:", v6);

    -[SFCompanionService ipAddress](self, "ipAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIpAddress:", v7);

    -[SFCompanionService deviceName](self, "deviceName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeviceName:", v8);

    -[SFCompanionService identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIdentifier:", v9);

    -[SFCompanionService serviceType](self, "serviceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setServiceType:", v10);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  SFCompanionService *v4;
  SFCompanionService *v5;
  BOOL v6;

  v4 = (SFCompanionService *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SFCompanionService isEqualToService:](self, "isEqualToService:", v5);

  return v6;
}

- (BOOL)isEqualToService:(id)a3
{
  void *v3;
  SFCompanionService *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;

  v5 = (SFCompanionService *)a3;
  if (self != v5)
  {
    -[SFCompanionService identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6
      || (-[SFCompanionService identifier](v5, "identifier"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SFCompanionService identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCompanionService identifier](v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v6)
      {

        if (!v9)
          goto LABEL_30;
      }
      else
      {

        if ((v9 & 1) == 0)
          goto LABEL_30;
      }
    }
    -[SFCompanionService serviceType](self, "serviceType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      || (-[SFCompanionService serviceType](v5, "serviceType"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SFCompanionService serviceType](self, "serviceType");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCompanionService serviceType](v5, "serviceType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v11)
      {

        if (!v14)
          goto LABEL_30;
      }
      else
      {

        if ((v14 & 1) == 0)
          goto LABEL_30;
      }
    }
    -[SFCompanionService managerID](self, "managerID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      || (-[SFCompanionService managerID](v5, "managerID"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[SFCompanionService managerID](self, "managerID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFCompanionService managerID](v5, "managerID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (v15)
      {

        if (!v18)
          goto LABEL_30;
      }
      else
      {

        if ((v18 & 1) == 0)
          goto LABEL_30;
      }
    }
    -[SFCompanionService deviceID](self, "deviceID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      -[SFCompanionService deviceID](v5, "deviceID");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
LABEL_25:
        -[SFCompanionService deviceName](self, "deviceName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23
          || (-[SFCompanionService deviceName](v5, "deviceName"),
              (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[SFCompanionService deviceName](self, "deviceName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFCompanionService deviceName](v5, "deviceName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v24, "isEqualToString:", v25) ^ 1;

          if (v23)
          {
LABEL_34:

            v10 = v26 ^ 1;
            goto LABEL_31;
          }
        }
        else
        {
          LOBYTE(v26) = 0;
        }

        goto LABEL_34;
      }
    }
    -[SFCompanionService deviceID](self, "deviceID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCompanionService deviceID](v5, "deviceID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqualToString:", v21);

    if (v19)
    {

      if (v22)
        goto LABEL_25;
    }
    else
    {

      if ((v22 & 1) != 0)
        goto LABEL_25;
    }
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
  v10 = 1;
LABEL_31:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_serviceType, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_managerID, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_deviceID, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_deviceName, "hash") - v6 + 32 * v6 + 28629151;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SFCompanionService serviceType](self, "serviceType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService deviceName](self, "deviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService managerID](self, "managerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFCompanionService identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SFCompanionService (serviceType = %@, deviceName = %@, deviceID = %@, managerID = %@, identifier = %@)"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)serviceType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)managerID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setManagerID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)ipAddress
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIpAddress:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)nsxpcVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNsxpcVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsxpcVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
  objc_storeStrong((id *)&self->_managerID, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

- (void)messageData
{
  OUTLINED_FUNCTION_6_0(&dword_1A2830000, a2, a3, "Author content serialize error = %@", a5, a6, a7, a8, 2u);
}

@end
