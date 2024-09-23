@implementation TUCTCapabilitiesState

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  _BOOL8 v23;
  id v24;

  v4 = a3;
  v5 = -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus");
  NSStringFromSelector(sel_provisioningStatus);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", v5, v6);

  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_provisioningURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_provisioningPostData);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, v10);

  v11 = -[TUCTCapabilitiesState isSupported](self, "isSupported");
  NSStringFromSelector(sel_isSupported);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v11, v12);

  v13 = -[TUCTCapabilitiesState isEnabled](self, "isEnabled");
  NSStringFromSelector(sel_isEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v13, v14);

  v15 = -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable");
  NSStringFromSelector(sel_isCurrentlyAvailable);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v15, v16);

  v17 = -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled");
  NSStringFromSelector(sel_isRoamingEnabled);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v17, v18);

  v19 = -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported");
  NSStringFromSelector(sel_isRoamingSupported);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v19, v20);

  v21 = -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported");
  NSStringFromSelector(sel_isEmergencySupported);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v21, v22);

  v23 = -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable");
  NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", v23, v24);

}

- (NSURL)provisioningURL
{
  return self->_provisioningURL;
}

- (int)provisioningStatus
{
  return self->_provisioningStatus;
}

- (NSData)provisioningPostData
{
  return self->_provisioningPostData;
}

- (BOOL)isSupported
{
  return self->_supported;
}

- (BOOL)isRoamingSupported
{
  return self->_roamingSupported;
}

- (BOOL)isRoamingEnabled
{
  return self->_roamingEnabled;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEmergencySupported
{
  return self->_emergencySupported;
}

- (BOOL)isEmergencyCurrentlyAvailable
{
  return self->_emergencyCurrentlyAvailable;
}

- (BOOL)isCurrentlyAvailable
{
  return self->_currentlyAvailable;
}

- (TUCTCapabilitiesState)initWithCoder:(id)a3
{
  id v4;
  TUCTCapabilitiesState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSURL *provisioningURL;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSData *provisioningPostData;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = -[TUCTCapabilitiesState init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_provisioningStatus);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_provisioningStatus = objc_msgSend(v4, "decodeInt32ForKey:", v6);

    v7 = objc_opt_class();
    NSStringFromSelector(sel_provisioningURL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    provisioningURL = v5->_provisioningURL;
    v5->_provisioningURL = (NSURL *)v9;

    v11 = objc_opt_class();
    NSStringFromSelector(sel_provisioningPostData);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    provisioningPostData = v5->_provisioningPostData;
    v5->_provisioningPostData = (NSData *)v13;

    NSStringFromSelector(sel_isSupported);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supported = objc_msgSend(v4, "decodeBoolForKey:", v15);

    NSStringFromSelector(sel_isEnabled);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", v16);

    NSStringFromSelector(sel_isCurrentlyAvailable);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentlyAvailable = objc_msgSend(v4, "decodeBoolForKey:", v17);

    NSStringFromSelector(sel_isRoamingEnabled);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_roamingEnabled = objc_msgSend(v4, "decodeBoolForKey:", v18);

    NSStringFromSelector(sel_isRoamingSupported);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_roamingSupported = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_isEmergencySupported);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emergencySupported = objc_msgSend(v4, "decodeBoolForKey:", v20);

    NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_emergencyCurrentlyAvailable = objc_msgSend(v4, "decodeBoolForKey:", v21);

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPostData, 0);
  objc_storeStrong((id *)&self->_provisioningURL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCTCapabilityInfo)ctCapabilityInfo
{
  TUCTCapabilityInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(TUCTCapabilityInfo);
  v4 = -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus");
  if (v4 <= 3)
    -[TUCTCapabilityInfo setProvisioningStatus:](v3, "setProvisioningStatus:", v4);
  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilityInfo setProvisioningURL:](v3, "setProvisioningURL:", v5);

  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilityInfo setProvisioningPostData:](v3, "setProvisioningPostData:", v6);

  -[TUCTCapabilityInfo setCanEnable:](v3, "setCanEnable:", -[TUCTCapabilitiesState isSupported](self, "isSupported"));
  -[TUCTCapabilityInfo setEnabled:](v3, "setEnabled:", -[TUCTCapabilitiesState isEnabled](self, "isEnabled"));
  -[TUCTCapabilityInfo setCanEnableRoaming:](v3, "setCanEnableRoaming:", -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported"));
  -[TUCTCapabilityInfo setRoamingEnabled:](v3, "setRoamingEnabled:", -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"));
  return v3;
}

- (TUCTCapabilitiesState)initWithCapabilityInfo:(id)a3
{
  id v4;
  TUCTCapabilitiesState *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSURL *provisioningURL;
  void *v14;
  uint64_t v15;
  NSData *provisioningPostData;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)TUCTCapabilitiesState;
  v5 = -[TUCTCapabilitiesState init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA74C8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA74D8]) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA74D0]) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA74E0]) & 1) != 0)
    {
      v7 = 2;
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CA74E8]))
      {
LABEL_11:
        v8 = (void *)MEMORY[0x1E0C99E98];
        v9 = *MEMORY[0x1E0CA74F0];
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA74F0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA78A0]);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLWithString:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        provisioningURL = v5->_provisioningURL;
        v5->_provisioningURL = (NSURL *)v12;

        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7898]);
        v15 = objc_claimAutoreleasedReturnValue();
        provisioningPostData = v5->_provisioningPostData;
        v5->_provisioningPostData = (NSData *)v15;

        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7188]);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_supported = objc_msgSend(v17, "BOOLValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7190]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_enabled = objc_msgSend(v18, "BOOLValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7908]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_roamingSupported = objc_msgSend(v19, "BOOLValue");

        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA7910]);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_roamingEnabled = objc_msgSend(v20, "BOOLValue");

        goto LABEL_12;
      }
      v7 = 3;
    }
    v5->_provisioningStatus = v7;
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (BOOL)isProvisioningURLInvalid
{
  void *v2;
  void *v3;
  char v4;

  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("__INVALID_PROVISIONING_URL__"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)invalidateProvisioningURL
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("__INVALID_PROVISIONING_URL__"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilitiesState setProvisioningURL:](self, "setProvisioningURL:", v3);

}

- (BOOL)isEqualToCapabilitiesState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  _BOOL4 v18;

  v4 = a3;
  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "provisioningPostData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (TUObjectsAreEqualOrNil((unint64_t)v5, (uint64_t)v6)
    && (v7 = -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus"),
        v7 == objc_msgSend(v4, "provisioningStatus")))
  {
    -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "provisioningURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v8, (uint64_t)v9)
      && (v10 = -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable"),
          v10 == objc_msgSend(v4, "isCurrentlyAvailable"))
      && (v11 = -[TUCTCapabilitiesState isEnabled](self, "isEnabled"), v11 == objc_msgSend(v4, "isEnabled"))&& (v12 = -[TUCTCapabilitiesState isSupported](self, "isSupported"), v12 == objc_msgSend(v4, "isSupported"))&& (v13 = -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"), v13 == objc_msgSend(v4, "isEmergencyCurrentlyAvailable"))&& (v14 = -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"), v14 == objc_msgSend(v4, "isEmergencySupported"))&& (v15 = -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"), v15 == objc_msgSend(v4, "isRoamingEnabled")))
    {
      v18 = -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported");
      v16 = v18 ^ objc_msgSend(v4, "isRoamingSupported") ^ 1;
    }
    else
    {
      LOBYTE(v16) = 0;
    }

  }
  else
  {
    LOBYTE(v16) = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[TUCTCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:");
  v5 = objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v7;

  *(_DWORD *)(v5 + 16) = -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus");
  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  return (id)v5;
}

- (NSString)description
{
  void *v3;
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_provisioningStatus);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v4, -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus"));

  NSStringFromSelector(sel_provisioningURL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%@"), v5, v6);

  NSStringFromSelector(sel_provisioningPostData);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%p"), v7, v8);

  NSStringFromSelector(sel_isSupported);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v9, -[TUCTCapabilitiesState isSupported](self, "isSupported"));

  NSStringFromSelector(sel_isEnabled);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v10, -[TUCTCapabilitiesState isEnabled](self, "isEnabled"));

  NSStringFromSelector(sel_isCurrentlyAvailable);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v11, -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable"));

  NSStringFromSelector(sel_isRoamingSupported);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v12, -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported"));

  NSStringFromSelector(sel_isRoamingEnabled);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v13, -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"));

  NSStringFromSelector(sel_isEmergencySupported);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v14, -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"));

  NSStringFromSelector(sel_isEmergencyCurrentlyAvailable);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@=%d"), v15, -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"));

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  -[TUCTCapabilitiesState provisioningPostData](self, "provisioningPostData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[TUCTCapabilitiesState provisioningStatus](self, "provisioningStatus");
  -[TUCTCapabilitiesState provisioningURL](self, "provisioningURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  if (-[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable"))
    v8 = 1231;
  else
    v8 = 1237;
  if (-[TUCTCapabilitiesState isEnabled](self, "isEnabled"))
    v9 = 1231;
  else
    v9 = 1237;
  v10 = v7 ^ v8 ^ v9;
  if (-[TUCTCapabilitiesState isSupported](self, "isSupported"))
    v11 = 1231;
  else
    v11 = 1237;
  if (-[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"))
    v12 = 1231;
  else
    v12 = 1237;
  v13 = v11 ^ v12;
  if (-[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"))
    v14 = 1231;
  else
    v14 = 1237;
  v15 = v10 ^ v13 ^ v14;
  if (-[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"))
    v16 = 1231;
  else
    v16 = 1237;
  if (-[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported"))
    v17 = 1231;
  else
    v17 = 1237;
  v18 = v15 ^ v16 ^ v17;

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  TUCTCapabilitiesState *v4;
  BOOL v5;

  v4 = (TUCTCapabilitiesState *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUCTCapabilitiesState isEqualToCapabilitiesState:](self, "isEqualToCapabilitiesState:", v4);
  }

  return v5;
}

- (id)publiclyAccessibleCopy
{
  return -[TUCTCapabilitiesState publiclyAccessibleCopyWithZone:](self, "publiclyAccessibleCopyWithZone:", 0);
}

- (id)publiclyAccessibleCopyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupported:", -[TUCTCapabilitiesState isSupported](self, "isSupported"));
  objc_msgSend(v4, "setEnabled:", -[TUCTCapabilitiesState isEnabled](self, "isEnabled"));
  objc_msgSend(v4, "setCurrentlyAvailable:", -[TUCTCapabilitiesState isCurrentlyAvailable](self, "isCurrentlyAvailable"));
  objc_msgSend(v4, "setRoamingSupported:", -[TUCTCapabilitiesState isRoamingSupported](self, "isRoamingSupported"));
  objc_msgSend(v4, "setRoamingEnabled:", -[TUCTCapabilitiesState isRoamingEnabled](self, "isRoamingEnabled"));
  objc_msgSend(v4, "setEmergencySupported:", -[TUCTCapabilitiesState isEmergencySupported](self, "isEmergencySupported"));
  objc_msgSend(v4, "setEmergencyCurrentlyAvailable:", -[TUCTCapabilitiesState isEmergencyCurrentlyAvailable](self, "isEmergencyCurrentlyAvailable"));
  return v4;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setProvisioningStatus:(int)a3
{
  self->_provisioningStatus = a3;
}

- (void)setProvisioningURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setProvisioningURLInvalid:(BOOL)a3
{
  self->_provisioningURLInvalid = a3;
}

- (void)setProvisioningPostData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setCurrentlyAvailable:(BOOL)a3
{
  self->_currentlyAvailable = a3;
}

- (void)setRoamingSupported:(BOOL)a3
{
  self->_roamingSupported = a3;
}

- (void)setRoamingEnabled:(BOOL)a3
{
  self->_roamingEnabled = a3;
}

- (void)setEmergencySupported:(BOOL)a3
{
  self->_emergencySupported = a3;
}

- (void)setEmergencyCurrentlyAvailable:(BOOL)a3
{
  self->_emergencyCurrentlyAvailable = a3;
}

@end
