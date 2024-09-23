@implementation PKPassAuxiliaryCapabilityKeyCreationMetadata

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPassAuxiliaryCapabilityKeyCreationMetadata;
  return -[PKPassAuxiliaryCapabilityKeyCreationMetadata init](&v3, sel_init);
}

- (PKPassAuxiliaryCapabilityKeyCreationMetadata)initWithDictionary:(id)a3
{
  if (a3)
    return (PKPassAuxiliaryCapabilityKeyCreationMetadata *)-[PKPassAuxiliaryCapabilityKeyCreationMetadata _init](self, "_init");

  return 0;
}

+ (id)createMetadataFromDictionary:(id)a3 forCapability:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "role");
  if (v8 == 2)
  {
    objc_msgSend(a1, "createMetadataFromDictionary:forSignatureCapabilityType:", v6, objc_msgSend(v7, "type"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8 != 1)
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_msgSend(a1, "createMetadataFromDictionary:forDecryptionCapabilityType:", v6, objc_msgSend(v7, "type"));
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

+ (id)createMetadataFromDictionary:(id)a3 forDecryptionCapabilityType:(unint64_t)a4
{
  id v5;
  uint64_t (**v6)(void);
  objc_class *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  _QWORD aBlock[5];
  uint8_t buf[4];
  objc_class *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __105__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forDecryptionCapabilityType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = a4;
  v6 = (uint64_t (**)(void))_Block_copy(aBlock);
  v7 = (objc_class *)v6[2]();
  if (!v7)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v5);
  if (!v9)
  {
    PKLogFacilityTypeGetObject(0x1CuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize %@ metadata from %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

id __105__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forDecryptionCapabilityType___block_invoke(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(a1 + 32) == 1)
  {
    objc_opt_class();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

+ (id)createMetadataFromDictionary:(id)a3 forSignatureCapabilityType:(unint64_t)a4
{
  id v5;
  uint64_t (**v6)(void);
  objc_class *v7;
  objc_class *v8;
  void *v9;
  NSObject *v10;
  _QWORD aBlock[5];
  uint8_t buf[4];
  objc_class *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __104__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forSignatureCapabilityType___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5__8__0l;
  aBlock[4] = a4;
  v6 = (uint64_t (**)(void))_Block_copy(aBlock);
  v7 = (objc_class *)v6[2]();
  if (!v7)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithDictionary:", v5);
  if (!v9)
  {
    PKLogFacilityTypeGetObject(0x1CuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to initialize %@ metadata from %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
LABEL_7:

  return v9;
}

id __104__PKPassAuxiliaryCapabilityKeyCreationMetadata_createMetadataFromDictionary_forSignatureCapabilityType___block_invoke(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 32) - 1;
  if (v1 > 6 || ((0x65u >> v1) & 1) == 0)
    return 0;
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v4;

  v4 = objc_alloc_init(PKPassAuxiliaryCapabilityKeyCreationMetadata);
  -[PKPassAuxiliaryCapabilityKeyCreationMetadata _copyInto:](self, "_copyInto:", v4);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)decryptionISO18013
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureCarConnectivityConsortium
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureFido
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureIdentityAccount
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureUnifiedAccessHydra
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureUnifiedAccessHome
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureAliroHydra
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

- (id)signatureAliroHome
{
  PKPassAuxiliaryCapabilityKeyCreationMetadata *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return v3;
}

@end
