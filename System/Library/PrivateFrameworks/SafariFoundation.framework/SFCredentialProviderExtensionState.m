@implementation SFCredentialProviderExtensionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)credentialProviderExtensionWithDisabledState
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithEnabledState:supportsIncrementalUpdates:", 0, 0);
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4
{
  return -[SFCredentialProviderExtensionState initWithEnabledState:supportsIncrementalUpdates:localizedDisplayName:credentialIdentityStoreIdentifier:providerBundleID:](self, "initWithEnabledState:supportsIncrementalUpdates:localizedDisplayName:credentialIdentityStoreIdentifier:providerBundleID:", a3, a4, 0, 0, 0);
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 providerBundleID:(id)a6
{
  id v10;
  id v11;
  SFCredentialProviderExtensionState *v12;
  SFCredentialProviderExtensionState *v13;
  uint64_t v14;
  NSString *localizedDisplayName;
  uint64_t v16;
  NSString *providerBundleID;
  SFCredentialProviderExtensionState *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFCredentialProviderExtensionState;
  v12 = -[SFCredentialProviderExtensionState init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_enabled = a3;
    v12->_supportsIncrementalUpdates = a4;
    v14 = objc_msgSend(v10, "copy");
    localizedDisplayName = v13->_localizedDisplayName;
    v13->_localizedDisplayName = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    providerBundleID = v13->_providerBundleID;
    v13->_providerBundleID = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (SFCredentialProviderExtensionState)initWithEnabledState:(BOOL)a3 supportsIncrementalUpdates:(BOOL)a4 localizedDisplayName:(id)a5 credentialIdentityStoreIdentifier:(id)a6 providerBundleID:(id)a7
{
  id v12;
  id v13;
  id v14;
  SFCredentialProviderExtensionState *v15;
  SFCredentialProviderExtensionState *v16;
  uint64_t v17;
  NSString *localizedDisplayName;
  uint64_t v19;
  SFExternalCredentialIdentityStoreIdentifier *credentialIdentityStoreIdentifier;
  uint64_t v21;
  NSString *providerBundleID;
  SFCredentialProviderExtensionState *v23;
  objc_super v25;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v25.receiver = self;
  v25.super_class = (Class)SFCredentialProviderExtensionState;
  v15 = -[SFCredentialProviderExtensionState init](&v25, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_enabled = a3;
    v15->_supportsIncrementalUpdates = a4;
    v17 = objc_msgSend(v12, "copy");
    localizedDisplayName = v16->_localizedDisplayName;
    v16->_localizedDisplayName = (NSString *)v17;

    v19 = objc_msgSend(v13, "copy");
    credentialIdentityStoreIdentifier = v16->_credentialIdentityStoreIdentifier;
    v16->_credentialIdentityStoreIdentifier = (SFExternalCredentialIdentityStoreIdentifier *)v19;

    v21 = objc_msgSend(v14, "copy");
    providerBundleID = v16->_providerBundleID;
    v16->_providerBundleID = (NSString *)v21;

    v23 = v16;
  }

  return v16;
}

- (SFCredentialProviderExtensionState)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  SFCredentialProviderExtensionState *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsIncrementalUpdates"));
  v7 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("localizedDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("credentialIdentityStoreIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("providerBundleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[SFCredentialProviderExtensionState initWithEnabledState:supportsIncrementalUpdates:localizedDisplayName:credentialIdentityStoreIdentifier:providerBundleID:](self, "initWithEnabledState:supportsIncrementalUpdates:localizedDisplayName:credentialIdentityStoreIdentifier:providerBundleID:", v5, v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 enabled;
  id v5;

  enabled = self->_enabled;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsIncrementalUpdates, CFSTR("supportsIncrementalUpdates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedDisplayName, CFSTR("localizedDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialIdentityStoreIdentifier, CFSTR("credentialIdentityStoreIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_providerBundleID, CFSTR("providerBundleID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEnabledState:supportsIncrementalUpdates:localizedDisplayName:credentialIdentityStoreIdentifier:providerBundleID:", self->_enabled, self->_supportsIncrementalUpdates, self->_localizedDisplayName, self->_credentialIdentityStoreIdentifier, self->_providerBundleID);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)supportsIncrementalUpdates
{
  return self->_supportsIncrementalUpdates;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (SFExternalCredentialIdentityStoreIdentifier)credentialIdentityStoreIdentifier
{
  return self->_credentialIdentityStoreIdentifier;
}

- (NSString)providerBundleID
{
  return self->_providerBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerBundleID, 0);
  objc_storeStrong((id *)&self->_credentialIdentityStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
