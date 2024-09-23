@implementation GTServiceProperties

+ (id)protocolMethods:(id)a3
{
  objc_method_description *v3;
  id v4;
  id v5;
  unint64_t v6;
  const char **p_name;
  const char *v8;
  NSString *v9;
  void *v10;
  id v11;
  unsigned int outCount;

  outCount = 0;
  v3 = protocol_copyMethodDescriptionList((Protocol *)a3, 1, 1, &outCount);
  v4 = objc_alloc((Class)NSMutableArray);
  v5 = objc_msgSend(v4, "initWithCapacity:", outCount);
  if (outCount)
  {
    v6 = 0;
    p_name = &v3->name;
    do
    {
      v8 = *p_name;
      p_name += 2;
      v9 = NSStringFromSelector(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v5, "addObject:", v10);

      ++v6;
    }
    while (v6 < outCount);
  }
  free(v3);
  v11 = objc_msgSend(v5, "copy");

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTServiceProperties)initWithProtocol:(id)a3
{
  Protocol *v4;
  GTServiceProperties *v5;
  NSString *v6;
  uint64_t v7;
  NSString *protocolName;
  uint64_t v9;
  NSArray *protocolMethods;
  NSString *deviceUDID;
  objc_super v13;

  v4 = (Protocol *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GTServiceProperties;
  v5 = -[GTServiceProperties init](&v13, "init");
  if (v5)
  {
    v6 = NSStringFromProtocol(v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", v4));
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v9;

    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = 0;

    v5->_platform = GTCorePlatformGet();
    v5->_version = 0;
  }

  return v5;
}

- (GTServiceProperties)initWithCoder:(id)a3
{
  id v4;
  GTServiceProperties *v5;
  id v6;
  uint64_t v7;
  NSString *protocolName;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  id v12;
  uint64_t v13;
  NSArray *protocolMethods;
  NSArray *v15;
  uint64_t v16;
  NSArray *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  id v25;
  uint64_t v26;
  NSString *deviceUDID;
  NSString *v28;
  uint64_t v29;
  NSString *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)GTServiceProperties;
  v5 = -[GTServiceProperties init](&v36, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("protocolName"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    protocolName = v5->_protocolName;
    v5->_protocolName = (NSString *)v7;

    v9 = v5->_protocolName;
    if (v9)
    {
      v10 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
      {
        v11 = v5->_protocolName;
        v5->_protocolName = 0;

      }
    }
    v12 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString), CFSTR("protocolMethods"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    protocolMethods = v5->_protocolMethods;
    v5->_protocolMethods = (NSArray *)v13;

    v15 = v5->_protocolMethods;
    if (v15)
    {
      v16 = objc_opt_class(NSArray);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v17 = v5->_protocolMethods;
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v33;
          while (2)
          {
            for (i = 0; i != v19; i = (char *)i + 1)
            {
              if (*(_QWORD *)v33 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
              v23 = objc_opt_class(NSString);
              if ((objc_opt_isKindOfClass(v22, v23) & 1) == 0)
              {
                v24 = v5->_protocolMethods;
                v5->_protocolMethods = 0;

                goto LABEL_18;
              }
            }
            v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
            if (v19)
              continue;
            break;
          }
        }
      }
      else
      {
        v17 = v5->_protocolMethods;
        v5->_protocolMethods = 0;
      }
LABEL_18:

    }
    v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("deviceUDID"));
    v26 = objc_claimAutoreleasedReturnValue(v25);
    deviceUDID = v5->_deviceUDID;
    v5->_deviceUDID = (NSString *)v26;

    v28 = v5->_deviceUDID;
    if (v28)
    {
      v29 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v28, v29) & 1) == 0)
      {
        v30 = v5->_deviceUDID;
        v5->_deviceUDID = 0;

      }
    }
    v5->_servicePort = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("servicePort"), (_QWORD)v32);
    v5->_platform = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("platform"));
    v5->_version = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("version"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *protocolName;
  id v5;

  protocolName = self->_protocolName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", protocolName, CFSTR("protocolName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_protocolMethods, CFSTR("protocolMethods"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_servicePort, CFSTR("servicePort"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_platform, CFSTR("platform"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceUDID, CFSTR("deviceUDID"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_version, CFSTR("version"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  GTServiceProperties *v4;
  id v5;

  v4 = objc_alloc_init(GTServiceProperties);
  -[GTServiceProperties setProtocolName:](v4, "setProtocolName:", self->_protocolName);
  v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:copyItems:", self->_protocolMethods, 1);
  -[GTServiceProperties setProtocolMethods:](v4, "setProtocolMethods:", v5);

  -[GTServiceProperties setServicePort:](v4, "setServicePort:", self->_servicePort);
  -[GTServiceProperties setPlatform:](v4, "setPlatform:", self->_platform);
  -[GTServiceProperties setDeviceUDID:](v4, "setDeviceUDID:", self->_deviceUDID);
  -[GTServiceProperties setVersion:](v4, "setVersion:", self->_version);
  return v4;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: protocolName=%@ protocolMethods=%@ servicePort=%llu platform=%u deviceUDID=%@ version=%llu>"), v5, self->_protocolName, self->_protocolMethods, self->_servicePort, self->_platform, self->_deviceUDID, self->_version));

  return v6;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (void)setProtocolName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)protocolMethods
{
  return self->_protocolMethods;
}

- (void)setProtocolMethods:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)deviceUDID
{
  return self->_deviceUDID;
}

- (void)setDeviceUDID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)servicePort
{
  return self->_servicePort;
}

- (void)setServicePort:(unint64_t)a3
{
  self->_servicePort = a3;
}

- (int)platform
{
  return self->_platform;
}

- (void)setPlatform:(int)a3
{
  self->_platform = a3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_protocolMethods, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
}

@end
