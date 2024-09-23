@implementation SBActivityAttribution

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:", self->_attribution);
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

uint64_t __33__SBActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activityAttribution");
}

- (id)_activityAttribution
{
  return self->_attribution;
}

- (SBActivityAttribution)initWithSTActivityAttribution:(id)a3
{
  id v4;
  SBActivityAttribution *v5;
  uint64_t v6;
  STActivityAttribution *attribution;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSString *attributionGroup;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBActivityAttribution;
  v5 = -[SBActivityAttribution init](&v20, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attribution = v5->_attribution;
    v5->_attribution = (STActivityAttribution *)v6;

    objc_msgSend(v4, "attributedEntity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundlePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 || (objc_msgSend(v8, "executablePath"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = BSPathExistsOnSystemPartition();
      objc_msgSend(v8, "localizedDisplayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SYSTEM_ATTRIBUTION_STRING"), &stru_1E8EC7EC0, CFSTR("SystemStatusServer"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", v13))
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ATTRIBUTION_STRING"), &stru_1E8EC7EC0, CFSTR("SystemStatusServer"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v11, "isEqualToString:", v15);

          if ((v16 & 1) == 0)
          {
            v17 = v11;
            v11 = v17;
LABEL_11:
            attributionGroup = v5->_attributionGroup;
            v5->_attributionGroup = (NSString *)v17;

            goto LABEL_12;
          }
        }
      }
    }
    else
    {
      objc_msgSend(v8, "localizedDisplayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "bundleIdentifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBActivityAttribution displayName](self, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("displayName"));

  -[SBActivityAttribution bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("bundleIdentifier"));

  -[SBActivityAttribution website](self, "website");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendBool:withName:", objc_msgSend(v8, "length") != 0, CFSTR("website-non-nil"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBActivityAttribution isSystemService](self, "isSystemService"), CFSTR("isSystemService"));
  return v3;
}

- (NSString)website
{
  void *v2;
  void *v3;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "website");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isSystemService
{
  void *v2;
  char v3;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemService");

  return v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)executableDisplayName
{
  void *v2;
  void *v3;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedExecutableDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)attributionGroup
{
  return self->_attributionGroup;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  STActivityAttribution *attribution;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  attribution = self->_attribution;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__SBActivityAttribution_isEqual___block_invoke;
  v10[3] = &unk_1E8EA4320;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", attribution, v10);
  LOBYTE(attribution) = objc_msgSend(v5, "isEqual");

  return (char)attribution;
}

- (NSString)activeEntityBundleIdentifier
{
  void *v2;
  void *v3;

  -[STActivityAttribution activeEntity](self->_attribution, "activeEntity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionGroup, 0);
  objc_storeStrong((id *)&self->_attribution, 0);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  void *v4;
  $115C4C562B26FF47E01F9F4EA65B5887 *result;
  void *v6;

  -[STActivityAttribution attributedEntity](self->_attribution, "attributedEntity");
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

- (BOOL)hasMatchingAttributedEntity:(id)a3
{
  return objc_msgSend(a3, "isEqual:", self->_attribution);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBActivityAttribution *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__SBActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

id __63__SBActivityAttribution_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
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

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("displayName"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("bundleIdentifier"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "website");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("website"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isSystemService"), CFSTR("isSystemService"));
}

- (int)pid
{
  return self->_pid;
}

@end
