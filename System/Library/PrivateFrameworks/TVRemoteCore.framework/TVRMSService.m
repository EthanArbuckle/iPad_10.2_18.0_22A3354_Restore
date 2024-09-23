@implementation TVRMSService

- (TVRMSService)initWithProtobuf:(id)a3
{
  id v4;
  TVRMSService *v5;
  uint64_t v6;
  NSString *displayName;
  uint64_t v8;
  NSString *networkName;
  uint64_t v10;
  NSString *hostName;
  uint64_t v12;
  NSString *homeSharingGroupKey;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TVRMSService;
  v5 = -[TVRMSService init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "displayName");
    v6 = objc_claimAutoreleasedReturnValue();
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    objc_msgSend(v4, "networkName");
    v8 = objc_claimAutoreleasedReturnValue();
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v8;

    objc_msgSend(v4, "hostName");
    v10 = objc_claimAutoreleasedReturnValue();
    hostName = v5->_hostName;
    v5->_hostName = (NSString *)v10;

    v5->_port = objc_msgSend(v4, "port");
    v5->_serviceType = (int)objc_msgSend(v4, "serviceType");
    v5->_serviceDiscoverySource = (int)objc_msgSend(v4, "serviceDiscoverySource");
    v5->_serviceLegacyFlags = (int)objc_msgSend(v4, "serviceLegacyFlags");
    objc_msgSend(v4, "homeSharingGroupKey");
    v12 = objc_claimAutoreleasedReturnValue();
    homeSharingGroupKey = v5->_homeSharingGroupKey;
    v5->_homeSharingGroupKey = (NSString *)v12;

  }
  return v5;
}

- (TVRMSService)initWithData:(id)a3
{
  id v4;
  TVRMSServiceMessage *v5;
  TVRMSService *v6;

  v4 = a3;
  v5 = -[TVRMSServiceMessage initWithData:]([TVRMSServiceMessage alloc], "initWithData:", v4);

  v6 = -[TVRMSService initWithProtobuf:](self, "initWithProtobuf:", v5);
  return v6;
}

- (id)protobuf
{
  void *v3;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setDisplayName:", self->_displayName);
  objc_msgSend(v3, "setNetworkName:", self->_networkName);
  objc_msgSend(v3, "setHostName:", self->_hostName);
  objc_msgSend(v3, "setPort:", self->_port);
  objc_msgSend(v3, "setServiceType:", LODWORD(self->_serviceType));
  objc_msgSend(v3, "setServiceDiscoverySource:", LODWORD(self->_serviceDiscoverySource));
  objc_msgSend(v3, "setServiceLegacyFlags:", LODWORD(self->_serviceLegacyFlags));
  objc_msgSend(v3, "setHomeSharingGroupKey:", self->_homeSharingGroupKey);
  return v3;
}

- (id)data
{
  void *v2;
  void *v3;

  -[TVRMSService protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] %@, type: %d, source: %d, HS key: %@, legacy flags: %d"), self->_networkName, self->_displayName, self->_serviceType, self->_serviceDiscoverySource, self->_homeSharingGroupKey, self->_serviceLegacyFlags);
}

- (BOOL)isLegacy
{
  return self->_serviceLegacyFlags != 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TVRMSService isEqualToService:](self, "isEqualToService:", v4);

  return v5;
}

- (BOOL)isEqualToService:(id)a3
{
  id v4;
  void *v5;
  int64_t serviceType;
  NSString *networkName;
  void *v8;
  NSString *hostName;
  void *v10;
  int port;
  NSString *displayName;
  NSString *v13;
  NSString *homeSharingGroupKey;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_12;
  serviceType = self->_serviceType;
  if (serviceType != objc_msgSend(v4, "serviceType"))
    goto LABEL_12;
  networkName = self->_networkName;
  objc_msgSend(v5, "networkName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(networkName) = -[NSString isEqualToString:](networkName, "isEqualToString:", v8);

  if (!(_DWORD)networkName)
    goto LABEL_12;
  hostName = self->_hostName;
  objc_msgSend(v5, "hostName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(hostName) = -[NSString isEqualToString:](hostName, "isEqualToString:", v10);

  if (!(_DWORD)hostName)
    goto LABEL_12;
  port = self->_port;
  if (port != objc_msgSend(v5, "port"))
    goto LABEL_12;
  displayName = self->_displayName;
  objc_msgSend(v5, "displayName");
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (displayName != v13)
    goto LABEL_12;
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey)
  {
LABEL_10:
    objc_msgSend(v5, "homeSharingGroupKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[NSString isEqualToString:](homeSharingGroupKey, "isEqualToString:", v16);

    if (v17)
      goto LABEL_11;
LABEL_12:
    v18 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v5, "homeSharingGroupKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    homeSharingGroupKey = self->_homeSharingGroupKey;
    goto LABEL_10;
  }
LABEL_11:
  v18 = 1;
LABEL_13:

  return v18;
}

+ (id)servicesFromProtobufs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TVRMSService *v11;
  TVRMSService *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [TVRMSService alloc];
        v12 = -[TVRMSService initWithProtobuf:](v11, "initWithProtobuf:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)protobufsFromServices:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "protobuf", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_storeStrong((id *)&self->_networkName, a3);
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_storeStrong((id *)&self->_hostName, a3);
}

- (int)port
{
  return self->_port;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (int64_t)serviceDiscoverySource
{
  return self->_serviceDiscoverySource;
}

- (void)setServiceDiscoverySource:(int64_t)a3
{
  self->_serviceDiscoverySource = a3;
}

- (int64_t)serviceLegacyFlags
{
  return self->_serviceLegacyFlags;
}

- (void)setServiceLegacyFlags:(int64_t)a3
{
  self->_serviceLegacyFlags = a3;
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
  objc_storeStrong((id *)&self->_homeSharingGroupKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
