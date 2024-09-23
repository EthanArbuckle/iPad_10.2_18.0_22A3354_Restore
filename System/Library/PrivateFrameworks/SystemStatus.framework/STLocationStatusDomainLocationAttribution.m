@implementation STLocationStatusDomainLocationAttribution

- (unint64_t)hash
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainLocationAttribution locationState](self, "locationState"));
  -[STLocationStatusDomainLocationAttribution activityAttribution](self, "activityAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:", v5);

  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", -[STLocationStatusDomainLocationAttribution eligibleDisplayModes](self, "eligibleDisplayModes"));
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (unint64_t)locationState
{
  return self->_locationState;
}

- (unint64_t)eligibleDisplayModes
{
  return self->_eligibleDisplayModes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);
}

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityAttribution");
}

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "locationState");
}

- (NSString)description
{
  return (NSString *)-[STLocationStatusDomainLocationAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

uint64_t __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "eligibleDisplayModes");
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainLocationAttribution locationState](self, "locationState"), CFSTR("locationState"));
  -[STLocationStatusDomainLocationAttribution activityAttribution](self, "activityAttribution");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("activityAttribution"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[STLocationStatusDomainLocationAttribution eligibleDisplayModes](self, "eligibleDisplayModes"), CFSTR("eligibleDisplayModes"));
}

- (STLocationStatusDomainLocationAttribution)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  STLocationStatusDomainLocationAttribution *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityAttribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("eligibleDisplayModes"));

  if (v6)
  {
    self = -[STLocationStatusDomainLocationAttribution initWithLocationState:activityAttribution:eligibleDisplayModes:](self, "initWithLocationState:activityAttribution:eligibleDisplayModes:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4 eligibleDisplayModes:(unint64_t)a5
{
  id v8;
  STLocationStatusDomainLocationAttribution *v9;
  STLocationStatusDomainLocationAttribution *v10;
  uint64_t v11;
  STActivityAttribution *activityAttribution;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STLocationStatusDomainLocationAttribution;
  v9 = -[STLocationStatusDomainLocationAttribution init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_locationState = a3;
    v11 = objc_msgSend(v8, "copy");
    activityAttribution = v10->_activityAttribution;
    v10->_activityAttribution = (STActivityAttribution *)v11;

    v10->_eligibleDisplayModes = a5;
  }

  return v10;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocationStatusDomainLocationAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STLocationStatusDomainLocationAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
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
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __93__STLocationStatusDomainLocationAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v9[3] = &unk_1E91E4AD8;
    v7 = v6;
    v10 = v7;
    v11 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v9);

    v3 = v7;
  }
  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __93__STLocationStatusDomainLocationAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "locationState"))
    v3 = CFSTR("receiving");
  else
    v3 = CFSTR("requesting");
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("locationState"));
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", v5, CFSTR("activityAttribution"));

  v7 = *(void **)(a1 + 32);
  STLocationStatusDomainLocationAttributionDisplayModeMaskDescription(objc_msgSend(*(id *)(a1 + 40), "eligibleDisplayModes"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("eligibleDisplayModes"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STLocationStatusDomainLocationAttribution locationState](self, "locationState");
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke;
  v21[3] = &unk_1E91E5108;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v6, v21);
  -[STLocationStatusDomainLocationAttribution activityAttribution](self, "activityAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E4AB0;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

  v13 = -[STLocationStatusDomainLocationAttribution eligibleDisplayModes](self, "eligibleDisplayModes");
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __53__STLocationStatusDomainLocationAttribution_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E5108;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendUnsignedInteger:counterpart:", v13, v17);
  LOBYTE(v13) = objc_msgSend(v5, "isEqual");

  return v13;
}

- (STLocationStatusDomainLocationAttribution)initWithLocationState:(unint64_t)a3 activityAttribution:(id)a4
{
  return -[STLocationStatusDomainLocationAttribution initWithLocationState:activityAttribution:eligibleDisplayModes:](self, "initWithLocationState:activityAttribution:eligibleDisplayModes:", a3, a4, 1);
}

- (NSString)debugDescription
{
  return (NSString *)-[STLocationStatusDomainLocationAttribution debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STLocationStatusDomainLocationAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STLocationStatusDomainLocationAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
