@implementation STActivityAttribution

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
  -[STActivityAttribution attributedEntity](self, "attributedEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STActivityAttribution activeEntity](self, "activeEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = objc_msgSend(v3, "hash");
  return v8;
}

- (STAttributedEntity)activeEntity
{
  STAttributedEntity *activeEntity;

  activeEntity = self->_activeEntity;
  if (activeEntity)
    return activeEntity;
  -[STActivityAttribution attributedEntity](self, "attributedEntity");
  return (STAttributedEntity *)(id)objc_claimAutoreleasedReturnValue();
}

- (STAttributedEntity)attributedEntity
{
  return self->_attributedEntity;
}

uint64_t __33__STActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "attributedEntity");
}

uint64_t __33__STActivityAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeEntity");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedEntity, 0);
  objc_storeStrong((id *)&self->_activeEntity, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[STActivityAttribution attributedEntity](self, "attributedEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("attributedEntity"));

  -[STActivityAttribution activeEntity](self, "activeEntity");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activeEntity"));

}

+ (STActivityAttribution)attributionWithAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (STActivityAttribution *)(id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

- (STActivityAttribution)initWithAuditToken:(id *)a3
{
  STAttributedEntity *v5;
  __int128 v6;
  STAttributedEntity *v7;
  STActivityAttribution *v8;
  _OWORD v10[2];

  v5 = [STAttributedEntity alloc];
  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = -[STAttributedEntity initWithAuditToken:](v5, "initWithAuditToken:", v10);
  v8 = -[STActivityAttribution initWithAttributedEntity:](self, "initWithAttributedEntity:", v7);

  return v8;
}

- (STActivityAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STActivityAttribution *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attributedEntity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activeEntity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STActivityAttribution initWithAttributedEntity:activeEntity:](self, "initWithAttributedEntity:activeEntity:", v5, v6);
  return v7;
}

- (STActivityAttribution)initWithAttributedEntity:(id)a3 activeEntity:(id)a4
{
  id v6;
  id v7;
  STActivityAttribution *v8;
  uint64_t v9;
  STAttributedEntity *attributedEntity;
  uint64_t v11;
  STAttributedEntity *activeEntity;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STActivityAttribution;
  v8 = -[STActivityAttribution init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    attributedEntity = v8->_attributedEntity;
    v8->_attributedEntity = (STAttributedEntity *)v9;

    if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
    {
      v11 = objc_msgSend(v7, "copy");
      activeEntity = v8->_activeEntity;
      v8->_activeEntity = (STAttributedEntity *)v11;

    }
  }

  return v8;
}

- (STActivityAttribution)initWithAttributedEntity:(id)a3
{
  return -[STActivityAttribution initWithAttributedEntity:activeEntity:](self, "initWithAttributedEntity:activeEntity:", a3, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __73__STActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E91E4AD8;
    v10[4] = v3;
    v7 = v6;
    v11 = v7;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

    v8 = v11;
    v3 = v7;

  }
  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __73__STActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "attributedEntity");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activeEntity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v7, CFSTR("attributedEntity"));
  if (v2 != v7)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "activeEntity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v5, CFSTR("activeEntity"), 1);

  }
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
  -[STActivityAttribution attributedEntity](self, "attributedEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __33__STActivityAttribution_isEqual___block_invoke;
  v19[3] = &unk_1E91E4AB0;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v19);

  -[STActivityAttribution activeEntity](self, "activeEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7;
  v15 = 3221225472;
  v16 = __33__STActivityAttribution_isEqual___block_invoke_2;
  v17 = &unk_1E91E4AB0;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, &v14);

  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);
  return (char)v10;
}

- (NSString)description
{
  return (NSString *)-[STActivityAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (STActivityAttribution)attributionWithPID:(int)a3
{
  return (STActivityAttribution *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithPID:", *(_QWORD *)&a3);
}

- (STActivityAttribution)initWithPID:(int)a3
{
  _QWORD v4[2];
  int v5;
  int v6;
  uint64_t v7;

  v4[0] = -1;
  v4[1] = -1;
  v5 = -1;
  v6 = a3;
  v7 = -1;
  return -[STActivityAttribution initWithAuditToken:](self, "initWithAuditToken:", v4);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[STActivityAttribution attributedEntity](self, "attributedEntity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "auditToken");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }

  return result;
}

- (int)pid
{
  -[STActivityAttribution auditToken](self, "auditToken", 0, 0, 0, 0);
  return BSPIDForAuditToken();
}

- (NSString)debugDescription
{
  return (NSString *)-[STActivityAttribution debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
