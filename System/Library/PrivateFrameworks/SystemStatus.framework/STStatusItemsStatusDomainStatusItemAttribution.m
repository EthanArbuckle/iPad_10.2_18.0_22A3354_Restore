@implementation STStatusItemsStatusDomainStatusItemAttribution

- (STStatusItemsStatusDomainStatusItemAttribution)initWithStatusItemIdentifier:(id)a3 activityAttribution:(id)a4
{
  id v6;
  id v7;
  STStatusItemsStatusDomainStatusItemAttribution *v8;
  uint64_t v9;
  NSString *statusItemIdentifier;
  uint64_t v11;
  STActivityAttribution *activityAttribution;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STStatusItemsStatusDomainStatusItemAttribution;
  v8 = -[STStatusItemsStatusDomainStatusItemAttribution init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    statusItemIdentifier = v8->_statusItemIdentifier;
    v8->_statusItemIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    activityAttribution = v8->_activityAttribution;
    v8->_activityAttribution = (STActivityAttribution *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
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
  -[STStatusItemsStatusDomainStatusItemAttribution statusItemIdentifier](self, "statusItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke;
  v19[3] = &unk_1E91E4B00;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v19);

  -[STStatusItemsStatusDomainStatusItemAttribution activityAttribution](self, "activityAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke_2;
  v17 = &unk_1E91E4AB0;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, &v14);

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

uint64_t __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "statusItemIdentifier");
}

uint64_t __58__STStatusItemsStatusDomainStatusItemAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityAttribution");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusItemsStatusDomainStatusItemAttribution statusItemIdentifier](self, "statusItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STStatusItemsStatusDomainStatusItemAttribution activityAttribution](self, "activityAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (NSString)description
{
  return (NSString *)-[STStatusItemsStatusDomainStatusItemAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STStatusItemsStatusDomainStatusItemAttribution debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusItemsStatusDomainStatusItemAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusItemsStatusDomainStatusItemAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsStatusDomainStatusItemAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusItemsStatusDomainStatusItemAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  STStatusItemsStatusDomainStatusItemAttribution *v13;

  v4 = a4;
  v6 = a3;
  -[STStatusItemsStatusDomainStatusItemAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__STStatusItemsStatusDomainStatusItemAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E91E4AD8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v11);

  v9 = v8;
  return v9;
}

void __98__STStatusItemsStatusDomainStatusItemAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "statusItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  STStatusItemIdentifierDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("statusItem"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityAttribution");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "appendObject:withName:", v7, CFSTR("activityAttribution"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[STStatusItemsStatusDomainStatusItemAttribution statusItemIdentifier](self, "statusItemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("statusItemIdentifier"));

  -[STStatusItemsStatusDomainStatusItemAttribution activityAttribution](self, "activityAttribution");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activityAttribution"));

}

- (STStatusItemsStatusDomainStatusItemAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  STStatusItemsStatusDomainStatusItemAttribution *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusItemIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityAttribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[STStatusItemsStatusDomainStatusItemAttribution initWithStatusItemIdentifier:activityAttribution:](self, "initWithStatusItemIdentifier:activityAttribution:", v5, v6);
    v8 = self;
  }

  return v8;
}

- (NSString)statusItemIdentifier
{
  return self->_statusItemIdentifier;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);
  objc_storeStrong((id *)&self->_statusItemIdentifier, 0);
}

@end
