@implementation PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState

- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)init
{

  return 0;
}

- (PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState)initWithCapability:(id)a3 currentVersion:(id)a4 targetVersion:(id)a5
{
  id v9;
  id v10;
  id v11;
  PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState *v12;
  PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState;
  v12 = -[PKAuxiliaryCapabilityKeyCreationMetadataRequestCapabilityState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capability, a3);
    objc_storeStrong((id *)&v13->_currentVersion, a4);
    objc_storeStrong((id *)&v13->_targetVersion, a5);
  }

  return v13;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PKPassAuxiliaryRegistrationRequirement identifier](self->_capability, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("capabilityIdentifier"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_currentVersion, CFSTR("currentVersion"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_targetVersion, CFSTR("targetVersion"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (PKPassAuxiliaryRegistrationRequirement)capability
{
  return self->_capability;
}

- (NSString)currentVersion
{
  return self->_currentVersion;
}

- (NSString)targetVersion
{
  return self->_targetVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetVersion, 0);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_capability, 0);
}

@end
