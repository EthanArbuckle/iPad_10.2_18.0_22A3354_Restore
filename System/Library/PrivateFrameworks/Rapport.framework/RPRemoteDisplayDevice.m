@implementation RPRemoteDisplayDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayDevice)initWithIdentifier:(id)a3 name:(id)a4 model:(id)a5 accountID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  RPRemoteDisplayDevice *v14;
  uint64_t v15;
  NSString *idsDeviceIdentifier;
  uint64_t v17;
  NSString *name;
  uint64_t v19;
  NSString *model;
  uint64_t v21;
  NSString *accountID;
  RPRemoteDisplayDevice *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RPRemoteDisplayDevice;
  v14 = -[RPRemoteDisplayDevice init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    idsDeviceIdentifier = v14->super._idsDeviceIdentifier;
    v14->super._idsDeviceIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    name = v14->super._name;
    v14->super._name = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    model = v14->super._model;
    v14->super._model = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    accountID = v14->super._accountID;
    v14->super._accountID = (NSString *)v21;

    v23 = v14;
  }

  return v14;
}

- (RPRemoteDisplayDevice)initWithCoder:(id)a3
{
  id v4;
  RPRemoteDisplayDevice *v5;
  uint64_t v6;
  NSDictionary *cameraCapabilities;
  id v8;
  RPRemoteDisplayDevice *v9;
  objc_super v11;
  uint64_t v12;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RPRemoteDisplayDevice;
  v5 = -[RPEndpoint initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("ccap"));
    v6 = objc_claimAutoreleasedReturnValue();
    cameraCapabilities = v5->_cameraCapabilities;
    v5->_cameraCapabilities = (NSDictionary *)v6;

    v12 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_flags = v12;
    v8 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *cameraCapabilities;
  uint64_t flags;
  NSString *persistentIdentifier;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPRemoteDisplayDevice;
  -[RPEndpoint encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  cameraCapabilities = self->_cameraCapabilities;
  if (cameraCapabilities)
    objc_msgSend(v4, "encodeObject:forKey:", cameraCapabilities, CFSTR("ccap"));
  flags = self->_flags;
  if ((_DWORD)flags)
    objc_msgSend(v4, "encodeInt64:forKey:", flags, CFSTR("fl"));
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
    objc_msgSend(v4, "encodeObject:forKey:", persistentIdentifier, CFSTR("pi"));

}

- (BOOL)isEqualToDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v26.receiver = self;
    v26.super_class = (Class)RPRemoteDisplayDevice;
    v8 = -[RPEndpoint compareWithDeviceIdentifier:](&v26, sel_compareWithDeviceIdentifier_, v7);

    if ((v8 & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(v4, "idsDeviceIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v4, "idsDeviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25.receiver = self;
    v25.super_class = (Class)RPRemoteDisplayDevice;
    v12 = -[RPEndpoint compareWithDeviceIdentifier:](&v25, sel_compareWithDeviceIdentifier_, v11);

    if ((v12 & 1) != 0)
      goto LABEL_7;
  }
  objc_msgSend(v4, "verifiedIdentity");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_8;
  v14 = (void *)v13;
  objc_msgSend(v4, "verifiedIdentity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)RPRemoteDisplayDevice;
  v16 = -[RPEndpoint compareWithDeviceIdentifier:](&v24, sel_compareWithDeviceIdentifier_, v15);

  if ((v16 & 1) != 0)
  {
LABEL_7:
    v17 = 1;
  }
  else
  {
LABEL_8:
    objc_msgSend(v4, "bleDevice");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rapportIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v4, "bleDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rapportIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v23.receiver = self;
      v23.super_class = (Class)RPRemoteDisplayDevice;
      v17 = -[RPEndpoint compareWithDeviceIdentifier:](&v23, sel_compareWithDeviceIdentifier_, v21);

    }
    else
    {
      v17 = 0;
    }

  }
  return v17;
}

- (id)description
{
  return -[RPRemoteDisplayDevice descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  _BOOL4 v4;
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  id v9;
  id v10;
  id v11;
  NSString *persistentIdentifier;
  NSString *v13;
  id v14;
  NSString *name;
  NSString *v16;
  id v17;
  NSString *model;
  NSString *v19;
  id v20;
  id v21;
  NSString *sourceVersion;
  id v23;
  NSDictionary *cameraCapabilities;
  id v25;
  id v27;
  id v28;
  id v29;
  id v30;
  NSString *v32;
  objc_super v33;
  id v34;
  id v35;
  objc_super v36;
  uint64_t v37[3];
  id v38;
  uint64_t v39;
  objc_super v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;

  v4 = shouldPrintSensitiveData();
  v47 = 0;
  NSAppendPrintF();
  v5 = 0;
  v6 = self->super._accountAltDSID;
  v7 = self->super._identifier;
  v8 = self->super._idsDeviceIdentifier;
  if (-[NSString isEqual:](v8, "isEqual:", v7))
  {

    v7 = 0;
  }
  if (v6)
  {
    v46 = v5;
    formatSensitiveData((uint64_t)", AltDSID ", v4);
    v32 = v6;
    NSAppendPrintF();
    v9 = v5;

    v5 = v9;
  }
  if (v8)
  {
    v45 = v5;
    formatSensitiveData((uint64_t)", IDS ", v4);
    v32 = v8;
    NSAppendPrintF();
    v10 = v5;

    v5 = v10;
  }
  if (v7)
  {
    v44 = v5;
    formatSensitiveData((uint64_t)", ID ", v4);
    v32 = v7;
    NSAppendPrintF();
    v11 = v5;

    v5 = v11;
  }
  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
  {
    v43 = v5;
    v13 = persistentIdentifier;
    formatSensitiveData((uint64_t)", PI ", v4);
    v32 = v13;
    NSAppendPrintF();
    v14 = v5;

    v5 = v14;
  }
  name = self->super._name;
  if (name)
  {
    v42 = v5;
    v16 = name;
    formatSensitiveData((uint64_t)", Nm ", v4);
    v32 = v16;
    NSAppendPrintF();
    v17 = v5;

    v5 = v17;
  }
  model = self->super._model;
  if (model)
  {
    v41 = v5;
    v19 = model;
    formatSensitiveData((uint64_t)", Md ", v4);
    v32 = v19;
    NSAppendPrintF();
    v20 = v5;

    v5 = v20;
  }
  if (v4)
  {
    v40.receiver = self;
    v40.super_class = (Class)RPRemoteDisplayDevice;
    -[RPEndpoint operatingSystemVersion](&v40, sel_operatingSystemVersion);
    if (v39)
    {
      v38 = v5;
      v36.receiver = self;
      v36.super_class = (Class)RPRemoteDisplayDevice;
      -[RPEndpoint operatingSystemVersion](&v36, sel_operatingSystemVersion);
      RPNSOperatingSystemVersionToString(v37);
      v32 = (NSString *)objc_claimAutoreleasedReturnValue();
      NSAppendPrintF();
      v21 = v38;

      v5 = v21;
    }
    sourceVersion = self->super._sourceVersion;
    if (sourceVersion)
    {
      v35 = v5;
      v32 = sourceVersion;
      NSAppendPrintF();
      v23 = v5;

      v5 = v23;
    }
  }
  cameraCapabilities = self->_cameraCapabilities;
  if (cameraCapabilities)
  {
    v34 = v5;
    v32 = -[NSDictionary count](cameraCapabilities, "count");
    NSAppendPrintF();
    v25 = v5;

    v5 = v25;
  }
  v33.receiver = self;
  v33.super_class = (Class)RPRemoteDisplayDevice;
  if (-[RPEndpoint cameraState](&v33, sel_cameraState, v32))
  {
    NSAppendPrintF();
    v27 = v5;

    v5 = v27;
  }
  if (self->_flags)
  {
    NSAppendPrintF();
    v28 = v5;

    v5 = v28;
  }
  if (self->super._statusFlags)
  {
    NSAppendPrintF();
    v29 = v5;

    v5 = v29;
  }
  v30 = v5;

  return v30;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  unsigned int v4;
  NSString *idsDeviceIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPRemoteDisplayDevice;
  v4 = -[RPEndpoint updateWithEndpoint:](&v7, sel_updateWithEndpoint_, a3);
  idsDeviceIdentifier = self->super._idsDeviceIdentifier;
  if (idsDeviceIdentifier && !self->_persistentIdentifier)
  {
    objc_storeStrong((id *)&self->_persistentIdentifier, idsDeviceIdentifier);
    v4 |= 2u;
  }
  return v4;
}

- (NSString)persistentIdentifier
{
  NSString *persistentIdentifier;

  persistentIdentifier = self->_persistentIdentifier;
  if (persistentIdentifier)
    return persistentIdentifier;
  persistentIdentifier = self->super._idsDeviceIdentifier;
  if (persistentIdentifier)
    return persistentIdentifier;
  else
    return (NSString *)0;
}

- (void)clearCameraCapabilitiesRefetchTimer
{
  OS_dispatch_source *cameraCapabilitiesRefetchTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  cameraCapabilitiesRefetchTimer = self->_cameraCapabilitiesRefetchTimer;
  if (cameraCapabilitiesRefetchTimer)
  {
    v5 = cameraCapabilitiesRefetchTimer;
    dispatch_source_cancel(v5);
    v4 = self->_cameraCapabilitiesRefetchTimer;
    self->_cameraCapabilitiesRefetchTimer = 0;

  }
}

- (RPRemoteDisplayDevice)initWithKeychainDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  RPRemoteDisplayDevice *v36;
  objc_super v38;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("idsD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (gLogCategory_RPRemoteDisplayDevice <= 90
      && (gLogCategory_RPRemoteDisplayDevice != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_38;
  }
  v38.receiver = self;
  v38.super_class = (Class)RPRemoteDisplayDevice;
  self = -[RPRemoteDisplayDevice init](&v38, sel_init);
  if (!self)
  {
LABEL_38:
    v36 = 0;
    goto LABEL_39;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("idsD"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[RPEndpoint setIdsDeviceIdentifier:](self, "setIdsDeviceIdentifier:", v10);
  objc_msgSend(v4, "objectForKey:", CFSTR("idsD"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  -[RPRemoteDisplayDevice setPersistentIdentifier:](self, "setPersistentIdentifier:", v15);
  objc_msgSend(v4, "objectForKey:", CFSTR("nm"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v18 = v16;
  if (v17)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;
  }
  else
  {
    v19 = 0;
  }
  v20 = v19;

  -[RPEndpoint setName:](self, "setName:", v20);
  objc_msgSend(v4, "objectForKey:", CFSTR("md"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_class();
  v23 = v21;
  if (v22)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;
  }
  else
  {
    v24 = 0;
  }
  v25 = v24;

  -[RPEndpoint setModel:](self, "setModel:", v25);
  objc_msgSend(v4, "objectForKey:", CFSTR("aid"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_opt_class();
  v28 = v26;
  if (v27)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v28;
    else
      v29 = 0;
  }
  else
  {
    v29 = 0;
  }
  v30 = v29;

  -[RPEndpoint setAccountID:](self, "setAccountID:", v30);
  objc_msgSend(v4, "objectForKey:", CFSTR("altDSID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_class();
  v33 = v31;
  if (v32)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v34 = v33;
    else
      v34 = 0;
  }
  else
  {
    v34 = 0;
  }
  v35 = v34;

  -[RPEndpoint setAccountAltDSID:](self, "setAccountAltDSID:", v35);
  self = self;
  v36 = self;
LABEL_39:

  return v36;
}

- (id)keychainDictionaryRepresentation
{
  id v3;
  NSString *idsDeviceIdentifier;
  void *v5;
  NSString *name;
  void *v7;
  NSString *model;
  void *v9;
  NSString *accountID;
  void *v11;
  NSString *accountAltDSID;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  idsDeviceIdentifier = self->super._idsDeviceIdentifier;
  if (idsDeviceIdentifier)
  {
    v5 = (void *)-[NSString copy](idsDeviceIdentifier, "copy");
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("idsD"));

  }
  name = self->super._name;
  if (name)
  {
    v7 = (void *)-[NSString copy](name, "copy");
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("nm"));

  }
  model = self->super._model;
  if (model)
  {
    v9 = (void *)-[NSString copy](model, "copy");
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("md"));

  }
  accountID = self->super._accountID;
  if (accountID)
  {
    v11 = (void *)-[NSString copy](accountID, "copy");
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("aid"));

  }
  accountAltDSID = self->super._accountAltDSID;
  if (accountAltDSID)
  {
    v13 = (void *)-[NSString copy](accountAltDSID, "copy");
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("altDSID"));

  }
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (NSDictionary)cameraCapabilities
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setCameraCapabilities:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 280);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setPersistentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (OS_dispatch_source)cameraCapabilitiesRefetchTimer
{
  return self->_cameraCapabilitiesRefetchTimer;
}

- (void)setCameraCapabilitiesRefetchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_cameraCapabilitiesRefetchTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCapabilitiesRefetchTimer, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraCapabilities, 0);
}

@end
