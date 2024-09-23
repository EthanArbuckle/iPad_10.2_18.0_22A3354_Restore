@implementation WiFiAwareDeviceCapabilities

+ (id)currentDeviceCapabilities
{
  return +[WiFiP2PXPCConnection directQueryOnEndpointType:error:querying:](WiFiP2PXPCConnection, "directQueryOnEndpointType:error:querying:", 1, 0, &__block_literal_global_1);
}

uint64_t __56__WiFiAwareDeviceCapabilities_currentDeviceCapabilities__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryCurrentDeviceCapabilities:");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WiFiAwareDeviceCapabilities)initWithOperatingChannel:(id)a3 operatingClass:(id)a4 supportedCipherSuites:(id)a5 supportsDataTransfer:(BOOL)a6 supportedBands:(unsigned __int8)a7 discoveryInterfaceName:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  WiFiAwareDeviceCapabilities *v18;
  uint64_t v19;
  NSArray *supportedCipherSuites;
  uint64_t v21;
  NSNumber *operatingChannel;
  uint64_t v23;
  NSNumber *operatingClass;
  uint64_t v25;
  NSString *discoveryInterfaceName;
  objc_super v28;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v28.receiver = self;
  v28.super_class = (Class)WiFiAwareDeviceCapabilities;
  v18 = -[WiFiAwareDeviceCapabilities init](&v28, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v16, "copy");
    supportedCipherSuites = v18->_supportedCipherSuites;
    v18->_supportedCipherSuites = (NSArray *)v19;

    v18->_supportedBands = a7;
    v18->_supportsDataTransfer = a6;
    v21 = objc_msgSend(v14, "copy");
    operatingChannel = v18->_operatingChannel;
    v18->_operatingChannel = (NSNumber *)v21;

    v23 = objc_msgSend(v15, "copy");
    operatingClass = v18->_operatingClass;
    v18->_operatingClass = (NSNumber *)v23;

    v25 = objc_msgSend(v17, "copy");
    discoveryInterfaceName = v18->_discoveryInterfaceName;
    v18->_discoveryInterfaceName = (NSString *)v25;

  }
  return v18;
}

- (WiFiAwareDeviceCapabilities)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  WiFiAwareDeviceCapabilities *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  void *v24;
  void *v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDeviceCapabilities.supportedBands"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedCharValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDeviceCapabilities.operatingChannel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDeviceCapabilities.operatingClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("WiFiAwareDeviceCapabilities.supportedCipherSuites"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WiFiAwareDeviceCapabilities.discoveryInterfaceName"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("WiFiAwareDeviceCapabilities.supportsDataTransfer"));
  v15 = v14;
  if (v12)
  {
    v26 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = 0;
        v17 = 0;
        goto LABEL_7;
      }
      v23 = v6;
      v24 = v8;
      v25 = v7;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v12;
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v28;
        while (2)
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v28 != v21)
              objc_enumerationMutation(v16);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v17 = 0;
              v8 = v24;
              v7 = v25;
              goto LABEL_7;
            }
            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v20)
            continue;
          break;
        }
      }

      v8 = v24;
      v7 = v25;
      v6 = v23;
    }
    v15 = v26;
  }
  else
  {
    v16 = (id)MEMORY[0x1E0C9AA60];
  }
  self = -[WiFiAwareDeviceCapabilities initWithOperatingChannel:operatingClass:supportedCipherSuites:supportsDataTransfer:supportedBands:discoveryInterfaceName:](self, "initWithOperatingChannel:operatingClass:supportedCipherSuites:supportsDataTransfer:supportedBands:discoveryInterfaceName:", v7, v8, v16, v15, v6, v13);
  v17 = self;
LABEL_7:

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[WiFiAwareDeviceCapabilities operatingChannel](self, "operatingChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("WiFiAwareDeviceCapabilities.operatingChannel"));

  -[WiFiAwareDeviceCapabilities operatingClass](self, "operatingClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("WiFiAwareDeviceCapabilities.operatingClass"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", -[WiFiAwareDeviceCapabilities supportedBands](self, "supportedBands"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("WiFiAwareDeviceCapabilities.supportedBands"));

  -[WiFiAwareDeviceCapabilities supportedCipherSuites](self, "supportedCipherSuites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("WiFiAwareDeviceCapabilities.supportedCipherSuites"));

  -[WiFiAwareDeviceCapabilities discoveryInterfaceName](self, "discoveryInterfaceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("WiFiAwareDeviceCapabilities.discoveryInterfaceName"));

  objc_msgSend(v9, "encodeBool:forKey:", -[WiFiAwareDeviceCapabilities supportsDataTransfer](self, "supportsDataTransfer"), CFSTR("WiFiAwareDeviceCapabilities.supportsDataTransfer"));
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  WiFiAwareDeviceCapabilities *v6;
  WiFiAwareDeviceCapabilities *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  char v16;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = (WiFiAwareDeviceCapabilities *)a3;
  if (self == v6)
  {
    v7 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    -[WiFiAwareDeviceCapabilities operatingChannel](self, "operatingChannel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareDeviceCapabilities operatingChannel](v7, "operatingChannel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v9)
    {
      -[WiFiAwareDeviceCapabilities operatingChannel](self, "operatingChannel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwareDeviceCapabilities operatingChannel](v7, "operatingChannel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {

LABEL_22:
        v10 = 0;
        goto LABEL_24;
      }
      v25 = v3;
    }
    -[WiFiAwareDeviceCapabilities operatingClass](self, "operatingClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiAwareDeviceCapabilities operatingClass](v7, "operatingClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11 != v12)
    {
      -[WiFiAwareDeviceCapabilities operatingClass](self, "operatingClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwareDeviceCapabilities operatingClass](v7, "operatingClass");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "isEqual:", v3))
      {
        v16 = 1;
        goto LABEL_18;
      }
      v24 = v13;
    }
    v14 = -[WiFiAwareDeviceCapabilities supportedBands](self, "supportedBands");
    if (v14 == -[WiFiAwareDeviceCapabilities supportedBands](v7, "supportedBands")
      && (v15 = -[WiFiAwareDeviceCapabilities supportsDataTransfer](self, "supportsDataTransfer"),
          v15 == -[WiFiAwareDeviceCapabilities supportsDataTransfer](v7, "supportsDataTransfer")))
    {
      -[WiFiAwareDeviceCapabilities supportedCipherSuites](self, "supportedCipherSuites");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WiFiAwareDeviceCapabilities supportedCipherSuites](v7, "supportedCipherSuites");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v18 == (void *)v19)
      {

        v16 = 0;
      }
      else
      {
        v23 = (void *)v19;
        -[WiFiAwareDeviceCapabilities supportedCipherSuites](self, "supportedCipherSuites");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WiFiAwareDeviceCapabilities supportedCipherSuites](v7, "supportedCipherSuites");
        v22 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v21, "isEqual:", v20) ^ 1;

      }
    }
    else
    {
      v16 = 1;
    }
    v13 = v24;
    if (v11 == v12)
    {
LABEL_19:

      if (v8 != v9)
      {

      }
      if ((v16 & 1) != 0)
        goto LABEL_22;
LABEL_23:
      v10 = 1;
      goto LABEL_24;
    }
LABEL_18:

    goto LABEL_19;
  }
  v10 = 0;
  v7 = 0;
LABEL_24:

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiAwareDeviceCapabilities operatingChannel](self, "operatingChannel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAwareDeviceCapabilities operatingClass](self, "operatingClass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WiFiAwareDeviceCapabilities supportedBands](self, "supportedBands");
  -[WiFiAwareDeviceCapabilities supportedCipherSuites](self, "supportedCipherSuites");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<WiFiAwareDeviceCapabilities operatingChannel=%@, operatingClass=%@, supportedBands=%u, supportedCipherSuites=%@>"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSNumber)operatingChannel
{
  return self->_operatingChannel;
}

- (NSNumber)operatingClass
{
  return self->_operatingClass;
}

- (NSArray)supportedCipherSuites
{
  return self->_supportedCipherSuites;
}

- (unsigned)supportedBands
{
  return self->_supportedBands;
}

- (BOOL)supportsDataTransfer
{
  return self->_supportsDataTransfer;
}

- (NSString)discoveryInterfaceName
{
  return self->_discoveryInterfaceName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryInterfaceName, 0);
  objc_storeStrong((id *)&self->_supportedCipherSuites, 0);
  objc_storeStrong((id *)&self->_operatingClass, 0);
  objc_storeStrong((id *)&self->_operatingChannel, 0);
}

@end
