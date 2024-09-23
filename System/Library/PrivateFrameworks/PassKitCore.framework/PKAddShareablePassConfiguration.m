@implementation PKAddShareablePassConfiguration

+ (void)configurationForPassMetadata:(NSArray *)passMetadata primaryAction:(PKAddShareablePassConfigurationPrimaryAction)action completion:(void *)completion
{
  objc_msgSend(a1, "_configurationForPassMetadata:provisioningPolicyIdentifier:primaryAction:completion:", passMetadata, 0, action, completion);
}

+ (void)_configurationForPassMetadata:(id)a3 provisioningPolicyIdentifier:(id)a4 primaryAction:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  PKAddShareablePassConfiguration *v12;
  uint64_t v13;
  PKAddShareablePassConfiguration *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  PKAddShareablePassConfiguration *v20;
  id v21;
  _QWORD v22[4];
  PKAddShareablePassConfiguration *v23;
  id v24;
  _QWORD aBlock[4];
  PKAddShareablePassConfiguration *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  PKAddShareablePassConfiguration *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a6;
  v11 = a3;
  v12 = -[PKAddShareablePassConfiguration initWithPrimaryAction:credentialsMetadata:]([PKAddShareablePassConfiguration alloc], "initWithPrimaryAction:credentialsMetadata:", a5, v11);

  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke;
  aBlock[3] = &unk_1E2AC8810;
  v28 = v10;
  v14 = v12;
  v26 = v14;
  v27 = v9;
  v15 = v9;
  v16 = v10;
  v17 = _Block_copy(aBlock);
  PKLogFacilityTypeGetObject(0x1BuLL);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v14;
    _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "Push Provisioning: Preflighting %@", buf, 0xCu);
  }

  +[PKPassLibrary sharedInstance](PKPassLibrary, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  v22[1] = 3221225472;
  v22[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_218;
  v22[3] = &unk_1E2AC4568;
  v23 = v14;
  v24 = v17;
  v20 = v14;
  v21 = v17;
  objc_msgSend(v19, "configurePushProvisioningConfigurationV2:completion:", v20, v22);

}

uint64_t __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t (*v4)(void);

  if (a3 || (a2 & 1) == 0)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v4();
}

void __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_218(uint64_t a1, void *a2, void *a3)
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
  v9[2] = __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_2;
  v9[3] = &unk_1E2AC4A20;
  v10 = v5;
  v11 = v6;
  v13 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __119__PKAddShareablePassConfiguration__configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion___block_invoke_2(uint64_t a1)
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
  objc_msgSend(*(id *)(a1 + 32), "shareablePassConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v2, "credentialsMetadata");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(v10 + 64);
    *(_QWORD *)(v10 + 64) = v9;

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

- (PKAddShareablePassConfiguration)initWithPrimaryAction:(unint64_t)a3 credentialsMetadata:(id)a4
{
  id v7;
  PKAddShareablePassConfiguration *v8;
  PKAddShareablePassConfiguration *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKAddShareablePassConfiguration;
  v8 = -[PKAddSecureElementPassConfiguration initWithType:](&v11, sel_initWithType_, 2);
  v9 = v8;
  if (v8)
  {
    v8->_primaryAction = a3;
    objc_storeStrong((id *)&v8->_credentialsMetadata, a4);
  }

  return v9;
}

- (BOOL)hasRequiredDataForProvisioning
{
  void *v3;
  int v4;
  uint64_t v5;
  BOOL v6;

  -[PKAddShareablePassConfiguration credentialsMetadata](self, "credentialsMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pk_containsObjectPassingTest:", &__block_literal_global_57);
  v5 = objc_msgSend(v3, "count");
  v6 = v5 != 0;
  if (v5 && v4)
    v6 = !self->_requiresNonceValidityChecks;

  return v6;
}

uint64_t __65__PKAddShareablePassConfiguration_hasRequiredDataForProvisioning__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;

  objc_msgSend(a2, "provisioningTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "targetDevice");
  objc_msgSend(v2, "nonce");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = v5;

  return v6;
}

- (NSArray)metadataProviders
{
  if (self->_credentialsMetadata)
    return self->_credentialsMetadata;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (PKAddIdentityDocumentConfiguration)identityDocumentConfiguration
{
  return 0;
}

- (void)_extendableDescription:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddShareablePassConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration _extendableDescription:](&v6, sel__extendableDescription_, v4);
  objc_msgSend(v4, "appendFormat:", CFSTR("credentialsMetadata: '%@'; "), self->_credentialsMetadata);
  objc_msgSend(v4, "appendFormat:", CFSTR("requiresNVC: '%d'; "), self->_requiresNonceValidityChecks);
  -[PKAddShareablePassConfiguration _primaryActionToString:](self, "_primaryActionToString:", self->_primaryAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("primaryAction: '%@'; "), v5);

}

- (id)_primaryActionToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 1)
    v3 = CFSTR("Share");
  if (a3)
    return (id)v3;
  else
    return CFSTR("Add");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKAddShareablePassConfiguration;
  v4 = -[PKAddSecureElementPassConfiguration copyWithZone:](&v8, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_credentialsMetadata, "copy");
  v6 = (void *)v4[8];
  v4[8] = v5;

  *((_BYTE *)v4 + 48) = self->_requiresNonceValidityChecks;
  v4[7] = self->_primaryAction;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKAddShareablePassConfiguration;
  v4 = a3;
  -[PKAddSecureElementPassConfiguration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_credentialsMetadata, CFSTR("credentialsMetadata"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_requiresNonceValidityChecks, CFSTR("requiresNonceValidityChecks"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_primaryAction);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("primaryAction"));

}

- (PKAddShareablePassConfiguration)initWithCoder:(id)a3
{
  id v4;
  PKAddShareablePassConfiguration *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *credentialsMetadata;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKAddShareablePassConfiguration;
  v5 = -[PKAddSecureElementPassConfiguration initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("credentialsMetadata"));
    v9 = objc_claimAutoreleasedReturnValue();
    credentialsMetadata = v5->_credentialsMetadata;
    v5->_credentialsMetadata = (NSArray *)v9;

    v5->_requiresNonceValidityChecks = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresNonceValidityChecks"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("primaryAction"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_primaryAction = objc_msgSend(v11, "unsignedIntegerValue");

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

- (PKAddShareablePassConfigurationPrimaryAction)primaryAction
{
  return self->_primaryAction;
}

- (NSArray)credentialsMetadata
{
  return self->_credentialsMetadata;
}

- (NSString)provisioningPolicyIdentifier
{
  return self->_provisioningPolicyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisioningPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialsMetadata, 0);
}

@end
