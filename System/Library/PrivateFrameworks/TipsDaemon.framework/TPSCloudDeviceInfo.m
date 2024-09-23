@implementation TPSCloudDeviceInfo

- (TPSCloudDeviceInfo)initWithModel:(id)a3
{
  id v5;
  TPSCloudDeviceInfo *v6;
  id *p_isa;
  TPSCloudDeviceInfo *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TPSCloudDeviceInfo;
  v6 = -[TPSCloudDeviceInfo init](&v10, sel_init);
  p_isa = (id *)&v6->super.super.isa;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), !objc_msgSend(p_isa[2], "length")))
    v8 = 0;
  else
    v8 = p_isa;

  return v8;
}

- (TPSCloudDeviceInfo)initWithDictionary:(id)a3
{
  id v4;
  TPSCloudDeviceInfo *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  NSString *minOSVersion;
  uint64_t v11;
  NSString *maxOSVersion;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSCloudDeviceInfo;
  v5 = -[TPSCloudDeviceInfo init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("model"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1EA1E3770;
    objc_storeStrong((id *)&v5->_model, v8);

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("osMinVersion"));
    v9 = objc_claimAutoreleasedReturnValue();
    minOSVersion = v5->_minOSVersion;
    v5->_minOSVersion = (NSString *)v9;

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("osMaxVersion"));
    v11 = objc_claimAutoreleasedReturnValue();
    maxOSVersion = v5->_maxOSVersion;
    v5->_maxOSVersion = (NSString *)v11;

  }
  return v5;
}

- (id)debugDescription
{
  id v3;
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
  objc_super v16;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v16.receiver = self;
  v16.super_class = (Class)TPSCloudDeviceInfo;
  -[TPSSerializableObject debugDescription](&v16, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSCloudDeviceInfo model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@ = %@\n"), CFSTR("model"), v6);

  objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %d\n"), CFSTR("isPreferred"), -[TPSCloudDeviceInfo isPreferred](self, "isPreferred"));
  -[TPSCloudDeviceInfo minOSVersion](self, "minOSVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TPSCloudDeviceInfo minOSVersion](self, "minOSVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("minOSVersion"), v8);

  }
  -[TPSCloudDeviceInfo maxOSVersion](self, "maxOSVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TPSCloudDeviceInfo maxOSVersion](self, "maxOSVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("maxOSVersion"), v10);

  }
  -[TPSCloudDeviceInfo displayName](self, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TPSCloudDeviceInfo displayName](self, "displayName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("displayName"), v12);

  }
  -[TPSCloudDeviceInfo symbolIdentifier](self, "symbolIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TPSCloudDeviceInfo symbolIdentifier](self, "symbolIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("%@ = %@\n"), CFSTR("symbolIdentifier"), v14);

  }
  return v5;
}

- (BOOL)isPreferred
{
  return self->_preferred;
}

- (void)setPreferred:(BOOL)a3
{
  self->_preferred = a3;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)maxOSVersion
{
  return self->_maxOSVersion;
}

- (void)setMaxOSVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)symbolIdentifier
{
  return self->_symbolIdentifier;
}

- (void)setSymbolIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolIdentifier, 0);
  objc_storeStrong((id *)&self->_maxOSVersion, 0);
  objc_storeStrong((id *)&self->_minOSVersion, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
