@implementation STStatusBarOverridesStatusDomainData

- (STStatusBarOverridesStatusDomainData)init
{
  void *v3;
  STStatusBarOverridesStatusDomainData *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[STStatusBarOverridesStatusDomainData initWithCustomOverrides:](self, "initWithCustomOverrides:", v3);

  return v4;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3
{
  id v4;
  STStatusBarOverridesStatusDomainData *v5;
  uint64_t v6;
  STStatusBarData *customOverrides;
  void *v8;
  STStatusBarOverridesStatusDomainData *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STStatusBarOverridesStatusDomainData;
  v5 = -[STStatusBarOverridesStatusDomainData init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "immutableCopy");
    v6 = objc_claimAutoreleasedReturnValue();
    customOverrides = v5->_customOverrides;
    v5->_customOverrides = (STStatusBarData *)v6;

  }
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STStatusBarOverridesStatusDomainData initWithCustomOverrides:suppressedBackgroundActivityIdentifiers:](v5, "initWithCustomOverrides:suppressedBackgroundActivityIdentifiers:", v4, v8);

  return v9;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifiers:(id)a4
{
  id v6;
  id v7;
  STListData *v8;
  void *v9;
  STListData *v10;
  STStatusBarOverridesStatusDomainData *v11;

  v6 = a4;
  v7 = a3;
  v8 = [STListData alloc];
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[STListData initWithObjects:](v8, "initWithObjects:", v9);
  v11 = -[STStatusBarOverridesStatusDomainData initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:](self, "initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:", v7, v10);

  return v11;
}

- (id)initWithData:(void *)a1
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "customOverrides");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suppressedBackgroundActivityIdentifierListData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = (id)objc_msgSend(v2, "initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:", v4, v5);
  }
  return v2;
}

- (STStatusBarOverridesStatusDomainData)initWithCustomOverrides:(id)a3 suppressedBackgroundActivityIdentifierListData:(id)a4
{
  id v6;
  void *v7;
  STStatusBarOverridesStatusDomainData *v8;

  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  v8 = (STStatusBarOverridesStatusDomainData *)-[STStatusBarOverridesStatusDomainData _initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:]((id *)&self->super.isa, v6, v7);

  return v8;
}

- (id)_initWithCustomOverrides:(void *)a3 suppressedBackgroundActivityIdentifierListData:
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  objc_super v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)STStatusBarOverridesStatusDomainData;
    a1 = (id *)objc_msgSendSuper2(&v10, sel_init);
    if (a1)
    {
      objc_msgSend(v5, "immutableCopy");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = a1[2];
      a1[2] = (id)v7;

      objc_storeStrong(a1 + 1, a3);
    }
  }

  return a1;
}

- (NSSet)suppressedBackgroundActivityIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[STListData objects](self->_suppressedBackgroundActivityIdentifierListData, "objects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STStatusBarOverridesStatusDomainData customOverrides](self, "customOverrides");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke;
  v20[3] = &unk_1E91E5E10;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v20);

  -[STStatusBarOverridesStatusDomainData suppressedBackgroundActivityIdentifierListData](self, "suppressedBackgroundActivityIdentifierListData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v16 = 3221225472;
  v17 = __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke_2;
  v18 = &unk_1E91E5E38;
  v19 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", v11, &v15);

  LOBYTE(v11) = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);
  return (char)v11;
}

uint64_t __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "customOverrides");
}

uint64_t __48__STStatusBarOverridesStatusDomainData_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "suppressedBackgroundActivityIdentifierListData");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarOverridesStatusDomainData customOverrides](self, "customOverrides");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STStatusBarOverridesStatusDomainData suppressedBackgroundActivityIdentifierListData](self, "suppressedBackgroundActivityIdentifierListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[STStatusBarOverridesStatusDomainData editedKeys](self, "editedKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  -[STStatusBarOverridesStatusDomainData editedIdentifiers](self, "editedIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:", v10);

  v12 = objc_msgSend(v3, "hash");
  return v12;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarOverridesStatusDomainData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STStatusBarOverridesStatusDomainData initWithData:](+[STMutableStatusBarOverridesStatusDomainData allocWithZone:](STMutableStatusBarOverridesStatusDomainData, "allocWithZone:", a3), self);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarOverridesStatusDomainData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusBarOverridesStatusDomainData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarOverridesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusBarOverridesStatusDomainData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customOverrides");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("customOverrides"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "editedKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("editedKeys"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "editedIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v9, CFSTR("editedIdentifiers"), 1);

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "suppressedBackgroundActivityIdentifierListData");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendArraySection:withName:multilinePrefix:skipIfEmpty:objectTransformer:", v12, CFSTR("suppressedBackgroundActivityIdentifiers"), v13, 1, &__block_literal_global_17);

}

__CFString *__88__STStatusBarOverridesStatusDomainData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1, void *a2)
{
  return STBackgroundActivityIdentifierDescription(a2);
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STStatusBarOverridesStatusDomainDataDiff diffFromData:toData:](STStatusBarOverridesStatusDomainDataDiff, "diffFromData:toData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STStatusBarOverridesStatusDomainData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STStatusBarOverridesStatusDomainData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)editedKeys
{
  return 0;
}

- (NSSet)editedIdentifiers
{
  return 0;
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
  -[STStatusBarOverridesStatusDomainData customOverrides](self, "customOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("customOverrides"));

  -[STStatusBarOverridesStatusDomainData suppressedBackgroundActivityIdentifierListData](self, "suppressedBackgroundActivityIdentifierListData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("suppressedBackgroundActivityIdentifierListData"));

}

- (STStatusBarOverridesStatusDomainData)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STStatusBarOverridesStatusDomainData *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customOverrides"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suppressedBackgroundActivityIdentifierListData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STStatusBarOverridesStatusDomainData initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:](self, "initWithCustomOverrides:suppressedBackgroundActivityIdentifierListData:", v5, v6);
  return v7;
}

- (STListData)suppressedBackgroundActivityIdentifierListData
{
  return self->_suppressedBackgroundActivityIdentifierListData;
}

- (STStatusBarData)customOverrides
{
  return self->_customOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOverrides, 0);
  objc_storeStrong((id *)&self->_suppressedBackgroundActivityIdentifierListData, 0);
}

@end
