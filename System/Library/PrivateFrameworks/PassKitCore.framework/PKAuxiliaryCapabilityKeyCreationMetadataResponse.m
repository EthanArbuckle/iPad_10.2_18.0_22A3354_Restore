@implementation PKAuxiliaryCapabilityKeyCreationMetadataResponse

- (PKAuxiliaryCapabilityKeyCreationMetadataResponse)initWithData:(id)a3
{
  PKAuxiliaryCapabilityKeyCreationMetadataResponse *v3;
  PKAuxiliaryCapabilityKeyCreationMetadataResponse *v4;
  void *v5;
  PKAuxiliaryCapabilityKeyCreationMetadataResponse *v6;
  uint64_t v7;
  NSArray *entryDicts;
  NSObject *p_super;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityKeyCreationMetadataResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      -[PKAuxiliaryCapabilityKeyCreationMetadataResponse PKArrayContaining:forKey:](v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("entries"));
      v7 = objc_claimAutoreleasedReturnValue();
      entryDicts = v4->_entryDicts;
      v4->_entryDicts = (NSArray *)v7;

      p_super = &v4->super.super.super.super;
      if (v4->_entryDicts)
      {
LABEL_9:

        return v4;
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x1CuLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
      v6 = v4;
    }

    v4 = 0;
    goto LABEL_9;
  }
  return v4;
}

- (id)entriesForCapabilities:(id)a3
{
  void *v4;
  NSArray *entryDicts;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "pk_indexDictionaryByApplyingBlock:", &__block_literal_global_98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  entryDicts = self->_entryDicts;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke_2;
  v9[3] = &unk_1E2AC5998;
  v10 = v4;
  v6 = v4;
  -[NSArray pk_arrayBySafelyApplyingBlock:](entryDicts, "pk_arrayBySafelyApplyingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry *__75__PKAuxiliaryCapabilityKeyCreationMetadataResponse_entriesForCapabilities___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(v3, "PKDictionaryForKey:", CFSTR("capability"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "PKStringForKey:", CFSTR("role"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = PKAuxiliaryCapabilityRoleFromString(v5);
    if (v7 == 2)
    {
      v8 = PKPassAuxiliaryRegistrationSignatureRequirement;
    }
    else
    {
      if (v7 != 1)
      {
LABEL_9:
        v11 = 0;
        goto LABEL_16;
      }
      v8 = PKPassAuxiliaryRegistrationDecryptionRequirement;
    }
    v10 = (void *)objc_msgSend([v8 alloc], "initWithDictionary:", v4);
    if (!v10)
      goto LABEL_9;
  }
  else
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

    if (!v10)
      goto LABEL_9;
  }
  objc_msgSend(v3, "PKDictionaryForKey:", CFSTR("metadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKPassAuxiliaryCapabilityKeyCreationMetadata createMetadataFromDictionary:forCapability:](PKPassAuxiliaryCapabilityKeyCreationMetadata, "createMetadataFromDictionary:forCapability:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v11 = -[PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry initWithCapability:metadata:]([PKAuxiliaryCapabilityKeyCreationMetadataResponseEntry alloc], "initWithCapability:metadata:", v10, v13);
  else
    v11 = 0;

LABEL_16:
  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDicts, 0);
}

@end
