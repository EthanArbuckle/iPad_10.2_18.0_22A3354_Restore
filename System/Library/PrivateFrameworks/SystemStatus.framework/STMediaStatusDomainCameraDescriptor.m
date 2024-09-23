@implementation STMediaStatusDomainCameraDescriptor

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[STMediaStatusDomainCameraDescriptor cameraIdentifier](self, "cameraIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("cameraIdentifier"));

  objc_msgSend(v5, "encodeBool:forKey:", -[STMediaStatusDomainCameraDescriptor isEligibleForPrivacyIndicator](self, "isEligibleForPrivacyIndicator"), CFSTR("eligibleForPrivacyIndicator"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMediaStatusDomainCameraDescriptor cameraIdentifier](self, "cameraIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke;
  v19[3] = &unk_1E91E4B00;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v19);

  v10 = -[STMediaStatusDomainCameraDescriptor isEligibleForPrivacyIndicator](self, "isEligibleForPrivacyIndicator");
  v14 = v7;
  v15 = 3221225472;
  v16 = __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke_2;
  v17 = &unk_1E91E4B28;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, &v14);
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMediaStatusDomainCameraDescriptor cameraIdentifier](self, "cameraIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  v6 = (id)objc_msgSend(v3, "appendBool:", -[STMediaStatusDomainCameraDescriptor isEligibleForPrivacyIndicator](self, "isEligibleForPrivacyIndicator"));
  v7 = objc_msgSend(v3, "hash");

  return v7;
}

- (BOOL)isEligibleForPrivacyIndicator
{
  return self->_eligibleForPrivacyIndicator;
}

- (NSString)cameraIdentifier
{
  return self->_cameraIdentifier;
}

- (STMediaStatusDomainCameraDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  STMediaStatusDomainCameraDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cameraIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("eligibleForPrivacyIndicator"));

  v7 = -[STMediaStatusDomainCameraDescriptor initWithCameraIdentifier:eligibleForPrivacyIndicator:](self, "initWithCameraIdentifier:eligibleForPrivacyIndicator:", v5, v6);
  return v7;
}

- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3
{
  id v4;
  STMediaStatusDomainCameraDescriptor *v5;

  v4 = a3;
  objc_opt_self();
  v5 = -[STMediaStatusDomainCameraDescriptor initWithCameraIdentifier:eligibleForPrivacyIndicator:](self, "initWithCameraIdentifier:eligibleForPrivacyIndicator:", v4, 1);

  return v5;
}

- (STMediaStatusDomainCameraDescriptor)initWithCameraIdentifier:(id)a3 eligibleForPrivacyIndicator:(BOOL)a4
{
  id v6;
  STMediaStatusDomainCameraDescriptor *v7;
  uint64_t v8;
  NSString *cameraIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STMediaStatusDomainCameraDescriptor;
  v7 = -[STMediaStatusDomainCameraDescriptor init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    cameraIdentifier = v7->_cameraIdentifier;
    v7->_cameraIdentifier = (NSString *)v8;

    v7->_eligibleForPrivacyIndicator = a4;
  }

  return v7;
}

- (STMediaStatusDomainCameraDescriptor)init
{
  return -[STMediaStatusDomainCameraDescriptor initWithCameraIdentifier:](self, "initWithCameraIdentifier:", 0);
}

uint64_t __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEligibleForPrivacyIndicator");
}

uint64_t __47__STMediaStatusDomainCameraDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cameraIdentifier");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraIdentifier, 0);
}

- (NSString)description
{
  return (NSString *)-[STMediaStatusDomainCameraDescriptor descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STMediaStatusDomainCameraDescriptor succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STMediaStatusDomainCameraDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STMediaStatusDomainCameraDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __87__STMediaStatusDomainCameraDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STMediaStatusDomainCameraDescriptor _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __87__STMediaStatusDomainCameraDescriptor__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cameraIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("cameraIdentifier"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isEligibleForPrivacyIndicator"), CFSTR("eligibleForPrivacyIndicator"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
