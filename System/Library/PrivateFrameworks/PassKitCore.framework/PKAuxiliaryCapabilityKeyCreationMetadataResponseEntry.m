@implementation PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry

- (PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry)initWithCapability:(id)a3 metadata:(id)a4
{
  id v7;
  id v8;
  PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry *v9;
  PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry;
  v9 = -[PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_capability, a3);
    objc_storeStrong((id *)&v10->_metadata, a4);
  }

  return v10;
}

- (PKPassAuxiliaryRegistrationRequirement)capability
{
  return self->_capability;
}

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_capability, 0);
}

@end
