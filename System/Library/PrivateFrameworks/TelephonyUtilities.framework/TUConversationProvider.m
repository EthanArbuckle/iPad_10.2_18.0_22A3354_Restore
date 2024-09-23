@implementation TUConversationProvider

- (OS_tcc_identity)assumedIdentity
{
  void *v2;
  void *v3;

  -[TUConversationProvider bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "tu_assumedIdentityForBundleIdentifier:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (OS_tcc_identity *)v3;
}

+ (TUConversationProvider)expanseProvider
{
  if (expanseProvider_onceToken != -1)
    dispatch_once(&expanseProvider_onceToken, &__block_literal_global_28);
  return (TUConversationProvider *)(id)expanseProvider_expanseProvider;
}

void __41__TUConversationProvider_expanseProvider__block_invoke()
{
  void *v0;
  void *v1;
  TUConversationProvider *v2;
  void *v3;
  TUConversationProviderConfiguration *v4;

  v4 = -[TUConversationProviderConfiguration initWithServiceName:]([TUConversationProviderConfiguration alloc], "initWithServiceName:", CFSTR("com.apple.private.expanse"));
  TUPreferredFaceTimeBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setBundleID:](v4, "setBundleID:", v0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E38E8FC8, &unk_1E38E8FE0, &unk_1E38E8FF8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setSupportedMediaTypes:](v4, "setSupportedMediaTypes:", v1);

  -[TUConversationProviderConfiguration setSupportsLinks:](v4, "setSupportsLinks:", 1);
  -[TUConversationProviderConfiguration setSupportsSharePlay:](v4, "setSupportsSharePlay:", 1);
  -[TUConversationProviderConfiguration setSupportsConversationHandoff:](v4, "setSupportsConversationHandoff:", 1);
  v2 = -[TUConversationProvider initWithConfiguration:]([TUConversationProvider alloc], "initWithConfiguration:", v4);
  v3 = (void *)expanseProvider_expanseProvider;
  expanseProvider_expanseProvider = (uint64_t)v2;

}

+ (TUConversationProvider)faceTimeProvider
{
  if (faceTimeProvider_onceToken != -1)
    dispatch_once(&faceTimeProvider_onceToken, &__block_literal_global_9_1);
  return (TUConversationProvider *)(id)faceTimeProvider_faceTimeProvider;
}

void __42__TUConversationProvider_faceTimeProvider__block_invoke()
{
  void *v0;
  void *v1;
  TUConversationProvider *v2;
  void *v3;
  TUConversationProviderConfiguration *v4;

  v4 = -[TUConversationProviderConfiguration initWithServiceName:]([TUConversationProviderConfiguration alloc], "initWithServiceName:", CFSTR("com.apple.telephonyutilities.callservicesd.FaceTimeProvider"));
  TUPreferredFaceTimeBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setBundleID:](v4, "setBundleID:", v0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E38E8FC8, &unk_1E38E8FE0, &unk_1E38E8FF8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setSupportedMediaTypes:](v4, "setSupportedMediaTypes:", v1);

  -[TUConversationProviderConfiguration setSupportsLinks:](v4, "setSupportsLinks:", 1);
  -[TUConversationProviderConfiguration setSupportsSharePlay:](v4, "setSupportsSharePlay:", 1);
  -[TUConversationProviderConfiguration setSupportsConversationHandoff:](v4, "setSupportsConversationHandoff:", 1);
  v2 = -[TUConversationProvider initWithConfiguration:]([TUConversationProvider alloc], "initWithConfiguration:", v4);
  v3 = (void *)faceTimeProvider_faceTimeProvider;
  faceTimeProvider_faceTimeProvider = (uint64_t)v2;

}

+ (TUConversationProvider)unknownProvider
{
  if (unknownProvider_onceToken != -1)
    dispatch_once(&unknownProvider_onceToken, &__block_literal_global_12_0);
  return (TUConversationProvider *)(id)unknownProvider_unknownProvider;
}

void __41__TUConversationProvider_unknownProvider__block_invoke()
{
  void *v0;
  void *v1;
  TUConversationProvider *v2;
  void *v3;
  TUConversationProviderConfiguration *v4;

  v4 = -[TUConversationProviderConfiguration initWithServiceName:]([TUConversationProviderConfiguration alloc], "initWithServiceName:", CFSTR("com.apple.private.unknown"));
  TUPreferredFaceTimeBundleIdentifier();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setBundleID:](v4, "setBundleID:", v0);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E38E8FC8, &unk_1E38E8FE0, &unk_1E38E8FF8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProviderConfiguration setSupportedMediaTypes:](v4, "setSupportedMediaTypes:", v1);

  -[TUConversationProviderConfiguration setSupportsLinks:](v4, "setSupportsLinks:", 1);
  -[TUConversationProviderConfiguration setSupportsSharePlay:](v4, "setSupportsSharePlay:", 1);
  -[TUConversationProviderConfiguration setSupportsConversationHandoff:](v4, "setSupportsConversationHandoff:", 1);
  v2 = -[TUConversationProvider initWithConfiguration:]([TUConversationProvider alloc], "initWithConfiguration:", v4);
  v3 = (void *)unknownProvider_unknownProvider;
  unknownProvider_unknownProvider = (uint64_t)v2;

}

- (BOOL)isDefaultProvider
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  +[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUConversationProvider isEqual:](self, "isEqual:", v3))
  {
    v4 = 1;
  }
  else
  {
    +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[TUConversationProvider isEqual:](self, "isEqual:", v5))
    {
      v4 = 1;
    }
    else
    {
      +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = -[TUConversationProvider isEqual:](self, "isEqual:", v6);

    }
  }

  return v4;
}

+ (BOOL)matchesDefaultProviderIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  +[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v3) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", v3) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v10, "isEqualToString:", v3);

    }
  }

  return v6;
}

- (TUConversationProvider)initWithConfiguration:(id)a3
{
  id v5;
  TUConversationProvider *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  NSArray *supportedMediaTypes;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TUConversationProvider;
  v6 = -[TUConversationProvider init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    objc_msgSend(v5, "supportedMediaTypes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = objc_claimAutoreleasedReturnValue();
    supportedMediaTypes = v6->_supportedMediaTypes;
    v6->_supportedMediaTypes = (NSArray *)v11;

    objc_storeStrong((id *)&v6->_providerConfiguration, a3);
  }

  return v6;
}

- (TUConversationProvider)initWithConversationProvider:(id)a3
{
  id *v4;
  TUConversationProvider *v5;
  TUConversationProvider *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)TUConversationProvider;
  v5 = -[TUConversationProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_identifier, v4[1]);
    objc_storeStrong((id *)&v6->_supportedMediaTypes, v4[2]);
    objc_storeStrong((id *)&v6->_providerConfiguration, v4[3]);
  }

  return v6;
}

- (unint64_t)defaultAVMode
{
  unint64_t v3;

  v3 = 2;
  if (!-[TUConversationProvider supportsAVMode:](self, "supportsAVMode:", 2))
    return -[TUConversationProvider supportsAVMode:](self, "supportsAVMode:", 1);
  return v3;
}

- (BOOL)supportsVideo
{
  return -[TUConversationProvider supportsAVMode:](self, "supportsAVMode:", 2);
}

- (BOOL)supportsSharePlay
{
  void *v2;
  char v3;

  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSharePlay");

  return v3;
}

- (BOOL)supportsLinks
{
  void *v2;
  char v3;

  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsLinks");

  return v3;
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pseudonymFeatureID
{
  void *v2;
  void *v3;

  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pseudonymFeatureID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUConversationProvider initWithConversationProvider:]([TUConversationProvider alloc], "initWithConversationProvider:", self);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProvider identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p identifier: %@ providerConfiguration: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationProvider *v4;
  BOOL v5;

  v4 = (TUConversationProvider *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[TUConversationProvider isEqualToConversationProvider:](self, "isEqualToConversationProvider:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[TUConversationProvider bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[TUConversationProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[TUConversationProvider pseudonymFeatureID](self, "pseudonymFeatureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqualToConversationProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  -[TUConversationProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    -[TUConversationProvider supportedMediaTypes](self, "supportedMediaTypes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "supportedMediaTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "providerConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUConversationProvider)initWithCoder:(id)a3
{
  id v4;
  TUConversationProvider *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *supportedMediaTypes;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  TUConversationProviderConfiguration *providerConfiguration;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TUConversationProvider;
  v5 = -[TUConversationProvider init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_supportedMediaTypes);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    supportedMediaTypes = v5->_supportedMediaTypes;
    v5->_supportedMediaTypes = (NSArray *)v14;

    v16 = objc_opt_class();
    NSStringFromSelector(sel_providerConfiguration);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (TUConversationProviderConfiguration *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TUConversationProvider identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUConversationProvider supportedMediaTypes](self, "supportedMediaTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_supportedMediaTypes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUConversationProvider providerConfiguration](self, "providerConfiguration");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_providerConfiguration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

+ (id)providerForIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a3;
  +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
  {
    +[TUConversationProvider faceTimeProvider](TUConversationProvider, "faceTimeProvider");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "isEqualToString:", v9);

    if (v10)
      +[TUConversationProvider expanseProvider](TUConversationProvider, "expanseProvider");
    else
      +[TUConversationProvider unknownProvider](TUConversationProvider, "unknownProvider");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v7;

  return v11;
}

- (BOOL)supportsAVMode:(unint64_t)a3
{
  return a3 <= 2 && -[TUConversationProvider supportsMediaType:](self, "supportsMediaType:", 3 - a3);
}

- (BOOL)supportsMediaType:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[TUConversationProvider supportedMediaTypes](self, "supportedMediaTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSArray)supportedMediaTypes
{
  return self->_supportedMediaTypes;
}

- (TUConversationProviderConfiguration)providerConfiguration
{
  return self->_providerConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerConfiguration, 0);
  objc_storeStrong((id *)&self->_supportedMediaTypes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
