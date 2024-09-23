@implementation STExecutableIdentity

uint64_t __32__STExecutableIdentity_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executablePath");
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundlePath");
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isSystemExecutable");
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "personaUniqueString");
}

uint64_t __32__STExecutableIdentity_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
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
  BSAuditToken *bsAuditToken;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STExecutableIdentity executablePath](self, "executablePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __32__STExecutableIdentity_isEqual___block_invoke;
  v39[3] = &unk_1E91E4B00;
  v8 = v4;
  v40 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v39);

  -[STExecutableIdentity bundlePath](self, "bundlePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __32__STExecutableIdentity_isEqual___block_invoke_2;
  v37[3] = &unk_1E91E4B00;
  v11 = v8;
  v38 = v11;
  v12 = (id)objc_msgSend(v5, "appendString:counterpart:", v10, v37);

  if (self)
    bsAuditToken = self->_bsAuditToken;
  else
    bsAuditToken = 0;
  v35[0] = v7;
  v35[1] = 3221225472;
  v35[2] = __32__STExecutableIdentity_isEqual___block_invoke_3;
  v35[3] = &unk_1E91E4AB0;
  v14 = v11;
  v36 = v14;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", bsAuditToken, v35);
  -[STExecutableIdentity bundleIdentifier](self, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v7;
  v33[1] = 3221225472;
  v33[2] = __32__STExecutableIdentity_isEqual___block_invoke_4;
  v33[3] = &unk_1E91E4B00;
  v17 = v14;
  v34 = v17;
  v18 = (id)objc_msgSend(v5, "appendString:counterpart:", v16, v33);

  -[STExecutableIdentity personaUniqueString](self, "personaUniqueString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v31[1] = 3221225472;
  v31[2] = __32__STExecutableIdentity_isEqual___block_invoke_5;
  v31[3] = &unk_1E91E4B00;
  v20 = v17;
  v32 = v20;
  v21 = (id)objc_msgSend(v5, "appendString:counterpart:", v19, v31);

  v22 = -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable");
  v26 = v7;
  v27 = 3221225472;
  v28 = __32__STExecutableIdentity_isEqual___block_invoke_6;
  v29 = &unk_1E91E4B28;
  v30 = v20;
  v23 = v20;
  v24 = (id)objc_msgSend(v5, "appendBool:counterpart:", v22, &v26);
  LOBYTE(v22) = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);

  return v22;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  BSAuditToken *bsAuditToken;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STExecutableIdentity executablePath](self, "executablePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STExecutableIdentity bundlePath](self, "bundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendString:", v6);

  if (self)
    bsAuditToken = self->_bsAuditToken;
  else
    bsAuditToken = 0;
  v9 = (id)objc_msgSend(v3, "appendObject:", bsAuditToken);
  -[STExecutableIdentity bundleIdentifier](self, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendString:", v10);

  -[STExecutableIdentity personaUniqueString](self, "personaUniqueString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendString:", v12);

  v14 = (id)objc_msgSend(v3, "appendBool:", -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable"));
  v15 = objc_msgSend(v3, "hash");

  return v15;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isSystemExecutable
{
  return self->_systemExecutable;
}

id __32__STExecutableIdentity_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 48);
  else
    return 0;
}

- (void)encodeWithCoder:(id)a3
{
  BSAuditToken *bsAuditToken;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self)
    bsAuditToken = self->_bsAuditToken;
  else
    bsAuditToken = 0;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", bsAuditToken, CFSTR("bsAuditToken"));
  -[STExecutableIdentity bundlePath](self, "bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("bundlePath"));

  -[STExecutableIdentity executablePath](self, "executablePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("executablePath"));

  -[STExecutableIdentity bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("bundleIdentifier"));

  -[STExecutableIdentity personaUniqueString](self, "personaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("personaUniqueString"));

  objc_msgSend(v9, "encodeBool:forKey:", -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable"), CFSTR("systemExecutable"));
}

- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3
{
  __int128 v3;
  _OWORD v5[2];

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", v5, 0, 0, a3, 0, 0);
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3
{
  __int128 v3;
  _OWORD v5[2];

  v3 = *(_OWORD *)&a3->var0[4];
  v5[0] = *(_OWORD *)a3->var0;
  v5[1] = v3;
  return -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", v5, 0, 0, 0, 0, 0);
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 bundleIdentifier:(id)a6 personaUniqueString:(id)a7 systemExecutable:(BOOL)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  void *v21;
  STExecutableIdentity *v22;
  _OWORD v24[2];

  v14 = (objc_class *)MEMORY[0x1E0D016E0];
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = [v14 alloc];
  v20 = *(_OWORD *)&a3->var0[4];
  v24[0] = *(_OWORD *)a3->var0;
  v24[1] = v20;
  v21 = (void *)objc_msgSend(v19, "initWithAuditToken:", v24);
  v22 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v21, v18, v17, v16, v15, a8);

  return v22;
}

- (STExecutableIdentity)initWithExecutablePath:(id)a3
{
  __int128 v3;
  _OWORD v5[2];

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", v5, 0, a3, 0, 0, 0);
}

- (STExecutableIdentity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  STExecutableIdentity *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bsAuditToken"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundlePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executablePath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personaUniqueString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("systemExecutable"));

  v11 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v5, v6, v7, v8, v9, v10);
  return v11;
}

- (id)initWithBSAuditToken:(void *)a3 bundlePath:(void *)a4 executablePath:(void *)a5 bundleIdentifier:(void *)a6 personaUniqueString:(char)a7 systemExecutable:
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)STExecutableIdentity;
    a1 = objc_msgSendSuper2(&v29, sel_init);
    if (a1)
    {
      v18 = objc_msgSend(v13, "copy");
      v19 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v18;

      v20 = objc_msgSend(v14, "copy");
      v21 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v20;

      v22 = objc_msgSend(v15, "copy");
      v23 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v22;

      v24 = objc_msgSend(v16, "copy");
      v25 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v24;

      v26 = objc_msgSend(v17, "copy");
      v27 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v26;

      *((_BYTE *)a1 + 8) = a7;
    }
  }

  return a1;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STExecutableIdentity descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STExecutableIdentity *v11;

  v4 = a3;
  -[STExecutableIdentity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__STExecutableIdentity_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E91E4AD8;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

void __62__STExecutableIdentity_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:skipIfEmpty:", v3, CFSTR("bundleIdentifier"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "personaUniqueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:skipIfEmpty:", v5, CFSTR("personaUniqueString"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundlePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:withName:skipIfEmpty:", v7, CFSTR("bundlePath"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "executablePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:skipIfEmpty:", v9, CFSTR("executablePath"), 1);

  if (objc_msgSend(*(id *)(a1 + 40), "hasAuditToken"))
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      v11 = *(_QWORD *)(v10 + 48);
    else
      v11 = 0;
    v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v11, CFSTR("auditToken"));
  }
  v13 = *(void **)(a1 + 32);
  MEMORY[0x1D17E6238](objc_msgSend(*(id *)(a1 + 40), "isSystemExecutable"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:", v14, CFSTR("isSystemExecutable"));

}

- (BOOL)hasAuditToken
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[STExecutableIdentity auditToken](self, "auditToken");
  return (v3 & v4 & v5 & v6) != -1;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *v4;

  if (self && (self = ($115C4C562B26FF47E01F9F4EA65B5887 *)*(id *)&self[1].var0[4]) != 0)
  {
    v4 = self;
    -[$115C4C562B26FF47E01F9F4EA65B5887 realToken](self, "realToken");

  }
  else
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
  }
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bsAuditToken, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_executablePath, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
}

- (STExecutableIdentity)initWithBundlePath:(id)a3
{
  __int128 v3;
  _OWORD v5[2];

  *(_QWORD *)&v3 = -1;
  *((_QWORD *)&v3 + 1) = -1;
  v5[0] = v3;
  v5[1] = v3;
  return -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", v5, a3, 0, 0, 0, 0);
}

- (STExecutableIdentity)initWithApplicationBundleIdentifier:(id)a3 personaUniqueString:(id)a4
{
  __int128 v4;
  _OWORD v6[2];

  *(_QWORD *)&v4 = -1;
  *((_QWORD *)&v4 + 1) = -1;
  v6[0] = v4;
  v6[1] = v4;
  return -[STExecutableIdentity initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, "initWithAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:", v6, 0, 0, a3, a4, 0);
}

- (STExecutableIdentity)initWithAuditToken:(id *)a3 bundlePath:(id)a4 executablePath:(id)a5 systemExecutable:(BOOL)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  void *v15;
  STExecutableIdentity *v16;
  _OWORD v18[2];

  v10 = (objc_class *)MEMORY[0x1E0D016E0];
  v11 = a5;
  v12 = a4;
  v13 = [v10 alloc];
  v14 = *(_OWORD *)&a3->var0[4];
  v18[0] = *(_OWORD *)a3->var0;
  v18[1] = v14;
  v15 = (void *)objc_msgSend(v13, "initWithAuditToken:", v18);
  v16 = (STExecutableIdentity *)-[STExecutableIdentity initWithBSAuditToken:bundlePath:executablePath:bundleIdentifier:personaUniqueString:systemExecutable:](self, v15, v12, v11, 0, 0, a6);

  return v16;
}

- (BOOL)matchesExecutableIdentity:(id)a3
{
  _QWORD *v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BSAuditToken *bsAuditToken;
  uint64_t v19;
  BSAuditToken *v20;
  void *v22;

  v4 = a3;
  v5 = -[STExecutableIdentity isSystemExecutable](self, "isSystemExecutable");
  if (v5 == objc_msgSend(v4, "isSystemExecutable"))
  {
    -[STExecutableIdentity personaUniqueString](self, "personaUniqueString");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "personaUniqueString");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8 && !objc_msgSend((id)v7, "isEqualToString:", v8))
    {
      v6 = 0;
    }
    else
    {
      -[STExecutableIdentity bundleIdentifier](self, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bundleIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9 && v10)
      {
        v6 = objc_msgSend(v9, "isEqualToString:", v10);
      }
      else
      {
        -[STExecutableIdentity executablePath](self, "executablePath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "executablePath");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12 && v13)
        {
          v6 = objc_msgSend(v12, "isEqualToString:", v13);
        }
        else
        {
          -[STExecutableIdentity bundlePath](self, "bundlePath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "bundlePath");
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15 && v16)
          {
            v6 = objc_msgSend(v15, "isEqualToString:", v16);
          }
          else
          {
            if (self)
              bsAuditToken = self->_bsAuditToken;
            else
              bsAuditToken = 0;
            v22 = v15;
            if (v4)
              v19 = v4[6];
            else
              v19 = 0;
            v20 = bsAuditToken;
            v6 = -[BSAuditToken isEqual:](v20, "isEqual:", v19);

            v15 = v22;
          }

        }
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[STExecutableIdentity descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STExecutableIdentity succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
