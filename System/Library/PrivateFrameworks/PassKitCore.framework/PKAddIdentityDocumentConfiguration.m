@implementation PKAddIdentityDocumentConfiguration

- (PKAddIdentityDocumentConfiguration)initWithMetadata:(id)a3
{
  id v5;
  PKAddIdentityDocumentConfiguration *v6;
  PKAddIdentityDocumentConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v6 = -[PKAddSecureElementPassConfiguration initWithType:](&v9, sel_initWithType_, 4);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_metadata, a3);

  return v7;
}

+ (void)configurationForMetadata:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  PKAddIdentityDocumentConfiguration *v7;
  uint64_t v8;
  PKAddIdentityDocumentConfiguration *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  PKAddIdentityDocumentConfiguration *v14;
  id v15;
  _QWORD v16[4];
  PKAddIdentityDocumentConfiguration *v17;
  id v18;
  _QWORD aBlock[4];
  PKAddIdentityDocumentConfiguration *v20;
  id v21;
  uint8_t buf[4];
  PKAddIdentityDocumentConfiguration *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = -[PKAddIdentityDocumentConfiguration initWithMetadata:]([PKAddIdentityDocumentConfiguration alloc], "initWithMetadata:", v6);

  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke;
  aBlock[3] = &unk_1E2ABDF68;
  v21 = v5;
  v9 = v7;
  v20 = v9;
  v10 = v5;
  v11 = _Block_copy(aBlock);
  PKLogFacilityTypeGetObject(0x1BuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Push Provisioning: Preflighting %@", buf, 0xCu);
  }

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_195;
  v16[3] = &unk_1E2AC4568;
  v17 = v9;
  v18 = v11;
  v14 = v9;
  v15 = v11;
  objc_msgSend(v13, "configurePushProvisioningConfigurationV2:completion:", v14, v16);

}

uint64_t __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a1 + 40);
  if (a3 || (a2 & 1) == 0)
    return (*(uint64_t (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 32), 0);
}

void __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_195(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_2;
  v9[3] = &unk_1E2AC4A20;
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __74__PKAddIdentityDocumentConfiguration_configurationForMetadata_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identityDocumentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "metadata");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(v10 + 56);
    *(_QWORD *)(v10 + 56) = v9;

    *(_BYTE *)(*(_QWORD *)(a1 + 48) + 48) = objc_msgSend(v3, "requiresNonceValidityChecks");
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1, 0);
  }
  else
  {
    PKLogFacilityTypeGetObject(0x16uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_18FC92000, v4, OS_LOG_TYPE_DEFAULT, "Unable to fetch provisioning nonces with error: %@", (uint8_t *)&v12, 0xCu);
    }

    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      (*(void (**)(_QWORD, _QWORD, uint64_t))(v6 + 16))(*(_QWORD *)(a1 + 56), 0, v7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PKAddSecureElementPassErrorDomain"), 0, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v8);

    }
  }

}

- (NSArray)metadataProviders
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_metadata)
  {
    v4[0] = self->_metadata;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v2;
}

- (PKAddShareablePassConfiguration)shareablePassConfiguration
{
  return 0;
}

- (void)_extendableDescription:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration _extendableDescription:](&v5, sel__extendableDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("metadata: '%@'; "), self->_metadata);
  objc_msgSend(v4, "appendFormat:", CFSTR("requiresNVC: '%d'; "), self->_requiresNonceValidityChecks);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v4 = -[PKAddSecureElementPassConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[PKIdentityDocumentMetadata copy](self->_metadata, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  *((_BYTE *)v4 + 48) = self->_requiresNonceValidityChecks;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresNonceValidityChecks, CFSTR("requiresNonceValidityChecks"));

}

- (PKAddIdentityDocumentConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddIdentityDocumentConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  PKIdentityDocumentMetadata *metadata;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKAddIdentityDocumentConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("metadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    metadata = v5->_metadata;
    v5->_metadata = (PKIdentityDocumentMetadata *)v9;

    v5->_requiresNonceValidityChecks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresNonceValidityChecks"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)requiresNonceValidityChecks
{
  return self->_requiresNonceValidityChecks;
}

- (void)setRequiresNonceValidityChecks:(BOOL)a3
{
  self->_requiresNonceValidityChecks = a3;
}

- (PKIdentityDocumentMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
