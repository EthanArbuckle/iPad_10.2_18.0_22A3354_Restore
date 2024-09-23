@implementation STAttributedEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedExecutableDisplayName, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_website, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_executableIdentity, 0);
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executableIdentity");
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localizedExecutableDisplayName");
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "localizedDisplayName");
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSystemService");
}

uint64_t __30__STAttributedEntity_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "website");
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5 localizedDisplayName:(id)a6 localizedExecutableDisplayName:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  STExecutableIdentity *v16;
  STExecutableIdentity *executableIdentity;
  NSString *v18;
  NSString *website;
  NSString *v20;
  NSString *localizedDisplayName;
  NSString *v22;
  NSString *localizedExecutableDisplayName;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (self)
  {
    v25.receiver = self;
    v25.super_class = (Class)STAttributedEntity;
    self = -[STAttributedEntity init](&v25, sel_init);
    if (self)
    {
      v16 = (STExecutableIdentity *)objc_msgSend(v12, "copy");
      executableIdentity = self->_executableIdentity;
      self->_executableIdentity = v16;

      v18 = (NSString *)objc_msgSend(v13, "copy");
      website = self->_website;
      self->_website = v18;

      self->_systemService = a5;
      v20 = (NSString *)objc_msgSend(v14, "copy");
      localizedDisplayName = self->_localizedDisplayName;
      self->_localizedDisplayName = v20;

      v22 = (NSString *)objc_msgSend(v15, "copy");
      localizedExecutableDisplayName = self->_localizedExecutableDisplayName;
      self->_localizedExecutableDisplayName = v22;

    }
  }

  return self;
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
  _BOOL8 v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __30__STAttributedEntity_isEqual___block_invoke;
  v31[3] = &unk_1E91E4AB0;
  v8 = v4;
  v32 = v8;
  v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v31);

  -[STAttributedEntity website](self, "website");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v7;
  v29[1] = 3221225472;
  v29[2] = __30__STAttributedEntity_isEqual___block_invoke_2;
  v29[3] = &unk_1E91E4B00;
  v11 = v8;
  v30 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v29);

  v13 = -[STAttributedEntity isSystemService](self, "isSystemService");
  v27[0] = v7;
  v27[1] = 3221225472;
  v27[2] = __30__STAttributedEntity_isEqual___block_invoke_3;
  v27[3] = &unk_1E91E4B28;
  v14 = v11;
  v28 = v14;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v27);
  -[STAttributedEntity localizedDisplayName](self, "localizedDisplayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v7;
  v25[1] = 3221225472;
  v25[2] = __30__STAttributedEntity_isEqual___block_invoke_4;
  v25[3] = &unk_1E91E4B00;
  v17 = v14;
  v26 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v25);

  -[STAttributedEntity localizedExecutableDisplayName](self, "localizedExecutableDisplayName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v7;
  v23[1] = 3221225472;
  v23[2] = __30__STAttributedEntity_isEqual___block_invoke_5;
  v23[3] = &unk_1E91E4B00;
  v24 = v17;
  v20 = v17;
  v21 = (id)objc_msgSend(v5, "appendString:counterpart:", v19, v23);

  LOBYTE(v19) = objc_msgSend(v5, "isEqual");
  return (char)v19;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[STAttributedEntity website](self, "website");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[STAttributedEntity isSystemService](self, "isSystemService"));
  -[STAttributedEntity localizedDisplayName](self, "localizedDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendString:", v9);

  -[STAttributedEntity localizedExecutableDisplayName](self, "localizedExecutableDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendString:", v11);

  v13 = objc_msgSend(v3, "hash");
  return v13;
}

- (STExecutableIdentity)executableIdentity
{
  return self->_executableIdentity;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (BOOL)isSystemService
{
  return self->_systemService;
}

- (NSString)website
{
  return self->_website;
}

- (NSString)localizedExecutableDisplayName
{
  return self->_localizedExecutableDisplayName;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("executableIdentity"));

  -[STAttributedEntity website](self, "website");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("website"));

  objc_msgSend(v4, "encodeBool:forKey:", -[STAttributedEntity isSystemService](self, "isSystemService"), CFSTR("systemService"));
  -[STAttributedEntity localizedDisplayName](self, "localizedDisplayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("localizedDisplayName"));

  -[STAttributedEntity localizedExecutableDisplayName](self, "localizedExecutableDisplayName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("localizedExecutableDisplayName"));

}

- (STAttributedEntity)initWithAuditToken:(id *)a3
{
  STExecutableIdentity *v5;
  __int128 v6;
  STExecutableIdentity *v7;
  STAttributedEntity *v8;
  _OWORD v10[2];

  v5 = [STExecutableIdentity alloc];
  v6 = *(_OWORD *)&a3->var0[4];
  v10[0] = *(_OWORD *)a3->var0;
  v10[1] = v6;
  v7 = -[STExecutableIdentity initWithAuditToken:](v5, "initWithAuditToken:", v10);
  v8 = -[STAttributedEntity initWithExecutableIdentity:](self, "initWithExecutableIdentity:", v7);

  return v8;
}

- (STAttributedEntity)initWithExecutablePath:(id)a3
{
  id v4;
  STExecutableIdentity *v5;
  STAttributedEntity *v6;

  v4 = a3;
  v5 = -[STExecutableIdentity initWithExecutablePath:]([STExecutableIdentity alloc], "initWithExecutablePath:", v4);

  v6 = -[STAttributedEntity initWithExecutableIdentity:](self, "initWithExecutableIdentity:", v5);
  return v6;
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4 systemService:(BOOL)a5
{
  return -[STAttributedEntity initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:](self, "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", a3, a4, a5, 0, 0);
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3
{
  return -[STAttributedEntity initWithExecutableIdentity:website:systemService:](self, "initWithExecutableIdentity:website:systemService:", a3, 0, 0);
}

- (STAttributedEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  STAttributedEntity *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executableIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("website"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemService"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedDisplayName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedExecutableDisplayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[STAttributedEntity initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:](self, "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)bundlePath
{
  void *v2;
  void *v3;

  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundlePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STAttributedEntity descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STAttributedEntity _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  void *v12;
  char v13;

  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(a1, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", a3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__STAttributedEntity__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v10[3] = &unk_1E91E4D08;
  v7 = v6;
  v11 = v7;
  v12 = a1;
  v13 = a3;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __70__STAttributedEntity__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "executableIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("executableIdentity"));

  v5 = *(unsigned __int8 *)(a1 + 48);
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "website");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v7, CFSTR("website"), 1);
  else
    v9 = (id)objc_msgSend(v6, "appendBool:withName:", v7 != 0, CFSTR("websiteNonNil"));

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemService"), CFSTR("systemService"));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedDisplayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:withName:skipIfEmpty:", v12, CFSTR("localizedDisplayName"), 1);

  v13 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "localizedExecutableDisplayName");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:skipIfEmpty:", v14, CFSTR("localizedExecutableDisplayName"), 1);

}

+ (id)genericSystemServicesEntity
{
  STExecutableIdentity *v3;
  __int128 v4;
  STExecutableIdentity *v5;
  void *v6;
  _OWORD v8[2];

  v3 = [STExecutableIdentity alloc];
  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  v8[0] = v4;
  v8[1] = v4;
  v5 = -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:systemExecutable:](v3, "initWithAuditToken:bundlePath:executablePath:systemExecutable:", v8, 0, 0, 0);
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExecutableIdentity:systemService:", v5, 1);

  return v6;
}

- (STAttributedEntity)initWithBundlePath:(id)a3
{
  id v4;
  STExecutableIdentity *v5;
  STAttributedEntity *v6;

  v4 = a3;
  v5 = -[STExecutableIdentity initWithBundlePath:]([STExecutableIdentity alloc], "initWithBundlePath:", v4);

  v6 = -[STAttributedEntity initWithExecutableIdentity:](self, "initWithExecutableIdentity:", v5);
  return v6;
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 website:(id)a4
{
  return -[STAttributedEntity initWithExecutableIdentity:website:systemService:](self, "initWithExecutableIdentity:website:systemService:", a3, a4, 0);
}

- (STAttributedEntity)initWithExecutableIdentity:(id)a3 systemService:(BOOL)a4
{
  return -[STAttributedEntity initWithExecutableIdentity:website:systemService:](self, "initWithExecutableIdentity:website:systemService:", a3, 0, a4);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[STAttributedEntity executableIdentity](self, "executableIdentity");
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

- (NSString)executablePath
{
  void *v2;
  void *v3;

  -[STAttributedEntity executableIdentity](self, "executableIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executablePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)matchesAttributedEntity:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[STAttributedEntity website](self, "website");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "website");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((!(v5 | v6) || objc_msgSend((id)v5, "isEqualToString:", v6))
    && (v7 = -[STAttributedEntity isSystemService](self, "isSystemService"),
        v7 == objc_msgSend(v4, "isSystemService")))
  {
    -[STAttributedEntity localizedDisplayName](self, "localizedDisplayName");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedDisplayName");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 | v10 && !objc_msgSend((id)v9, "isEqualToString:", v10))
    {
      v8 = 0;
    }
    else
    {
      -[STAttributedEntity localizedExecutableDisplayName](self, "localizedExecutableDisplayName");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localizedExecutableDisplayName");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 | v12 && !objc_msgSend((id)v11, "isEqualToString:", v12))
      {
        v8 = 0;
      }
      else
      {
        -[STAttributedEntity executableIdentity](self, "executableIdentity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "executableIdentity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v13, "matchesExecutableIdentity:", v14);

      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STAttributedEntity descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STAttributedEntity debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STAttributedEntity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STAttributedEntity _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STUserIdentity)userIdentity
{
  return self->_userIdentity;
}

@end
