@implementation STBackgroundActivitiesStatusDomainBackgroundActivityAttribution

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4 showsWhenForeground:(BOOL)a5
{
  id v8;
  id v9;
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v10;
  uint64_t v11;
  NSString *backgroundActivityIdentifier;
  uint64_t v13;
  STActivityAttribution *activityAttribution;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STBackgroundActivitiesStatusDomainBackgroundActivityAttribution;
  v10 = -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    backgroundActivityIdentifier = v10->_backgroundActivityIdentifier;
    v10->_backgroundActivityIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    activityAttribution = v10->_activityAttribution;
    v10->_activityAttribution = (STActivityAttribution *)v13;

    v10->_showsWhenForeground = a5;
  }

  return v10;
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithBackgroundActivityIdentifier:(id)a3 activityAttribution:(id)a4
{
  return -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:](self, "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", a3, a4, 0);
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
  uint64_t v13;
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
  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke;
  v21[3] = &unk_1E91E4B00;
  v8 = v4;
  v22 = v8;
  v9 = (id)objc_msgSend(v5, "appendString:counterpart:", v6, v21);

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution activityAttribution](self, "activityAttribution");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_2;
  v19[3] = &unk_1E91E4AB0;
  v11 = v8;
  v20 = v11;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

  v13 = -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution showsWhenForeground](self, "showsWhenForeground");
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_3;
  v17[3] = &unk_1E91E4B28;
  v18 = v11;
  v14 = v11;
  v15 = (id)objc_msgSend(v5, "appendBool:counterpart:", v13, v17);
  LOBYTE(v13) = objc_msgSend(v5, "isEqual");

  return v13;
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "backgroundActivityIdentifier");
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activityAttribution");
}

uint64_t __75__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showsWhenForeground");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  unint64_t v9;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendString:", v4);

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution activityAttribution](self, "activityAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  v8 = (id)objc_msgSend(v3, "appendBool:", -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution showsWhenForeground](self, "showsWhenForeground"));
  v9 = objc_msgSend(v3, "hash");

  return v9;
}

- (NSString)description
{
  return (NSString *)-[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
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
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v13;

  v4 = a4;
  v6 = a3;
  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __115__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v11[3] = &unk_1E91E4AD8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v6, v11);

  v9 = v8;
  return v9;
}

id __115__STBackgroundActivitiesStatusDomainBackgroundActivityAttribution__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "backgroundActivityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  STBackgroundActivityIdentifierDescription(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("backgroundActivity"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityAttribution");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("activityAttribution"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "showsWhenForeground"), CFSTR("showsWhenForeground"), 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution backgroundActivityIdentifier](self, "backgroundActivityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("backgroundActivityIdentifier"));

  -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution activityAttribution](self, "activityAttribution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("activityAttribution"));

  objc_msgSend(v6, "encodeBool:forKey:", -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution showsWhenForeground](self, "showsWhenForeground"), CFSTR("showsWhenForeground"));
}

- (STBackgroundActivitiesStatusDomainBackgroundActivityAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  STBackgroundActivitiesStatusDomainBackgroundActivityAttribution *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundActivityIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activityAttribution"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showsWhenForeground"));

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    self = -[STBackgroundActivitiesStatusDomainBackgroundActivityAttribution initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:](self, "initWithBackgroundActivityIdentifier:activityAttribution:showsWhenForeground:", v5, v6, v7);
    v9 = self;
  }

  return v9;
}

- (NSString)backgroundActivityIdentifier
{
  return self->_backgroundActivityIdentifier;
}

- (STActivityAttribution)activityAttribution
{
  return self->_activityAttribution;
}

- (BOOL)showsWhenForeground
{
  return self->_showsWhenForeground;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityAttribution, 0);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifier, 0);
}

@end
