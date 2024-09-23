@implementation SBSAPreferencesDidChangeAction

- (SBSAPreferencesDidChangeAction)initWithReasons:(id)a3
{
  id v4;
  SBSAPreferencesDidChangeAction *v5;
  uint64_t v6;
  NSArray *reasons;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPreferencesDidChangeAction;
  v5 = -[SBSAPreferencesDidChangeAction init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    reasons = v5->_reasons;
    v5->_reasons = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSArray *reasons;
  id v7;
  void *v8;
  char v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reasons = self->_reasons;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__SBSAPreferencesDidChangeAction_isEqual___block_invoke;
  v11[3] = &unk_1E8EA4320;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v5, "appendObject:counterpart:", reasons, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual");

  return v9;
}

uint64_t __42__SBSAPreferencesDidChangeAction_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reasons");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_reasons);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; reasons: %@>"),
                       objc_opt_class(),
                       self,
                       self->_reasons);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithReasons:", self->_reasons);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reasons, 0);
}

@end
