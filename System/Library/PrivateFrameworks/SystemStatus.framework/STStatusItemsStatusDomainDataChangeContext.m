@implementation STStatusItemsStatusDomainDataChangeContext

- (STStatusItemsStatusDomainDataChangeContext)init
{
  STStatusItemsStatusDomainDataChangeContext *v2;
  char v3;
  objc_super v4;

  if (self)
  {
    v2 = self;
    v3 = objc_msgSend(0, "isUserInitiated");
    v4.receiver = v2;
    v4.super_class = (Class)STStatusItemsStatusDomainDataChangeContext;
    self = -[STStatusItemsStatusDomainDataChangeContext init](&v4, sel_init);
    if (self)
      self->_userInitiated = v3;
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STStatusItemsStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__STStatusItemsStatusDomainDataChangeContext_isEqual___block_invoke;
  v10[3] = &unk_1E91E4B28;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v10);
  LOBYTE(v6) = objc_msgSend(v5, "isEqual");

  return v6;
}

uint64_t __54__STStatusItemsStatusDomainDataChangeContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUserInitiated");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STStatusItemsStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (NSString)description
{
  return (NSString *)-[STStatusItemsStatusDomainDataChangeContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id result;
  id v5;
  BOOL v6;
  objc_super v7;

  result = +[STMutableStatusItemsStatusDomainDataChangeContext allocWithZone:](STMutableStatusItemsStatusDomainDataChangeContext, "allocWithZone:", a3);
  if (result)
  {
    v5 = result;
    v6 = -[STStatusItemsStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated");
    v7.receiver = v5;
    v7.super_class = (Class)STStatusItemsStatusDomainDataChangeContext;
    result = -[STStatusItemsStatusDomainDataChangeContext init](&v7, sel_init);
    if (result)
      *((_BYTE *)result + 8) = v6;
  }
  return result;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusItemsStatusDomainDataChangeContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusItemsStatusDomainDataChangeContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsStatusDomainDataChangeContext _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v9[2] = __94__STStatusItemsStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusItemsStatusDomainDataChangeContext _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __94__STStatusItemsStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInitiated"), CFSTR("userInitiated"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STStatusItemsStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"), CFSTR("userInitiated"));

}

- (STStatusItemsStatusDomainDataChangeContext)initWithCoder:(id)a3
{
  char v4;
  BOOL v5;
  STStatusItemsStatusDomainDataChangeContext *result;
  objc_super v7;

  v4 = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("userInitiated"));
  if (!self)
    return 0;
  v5 = v4;
  v7.receiver = self;
  v7.super_class = (Class)STStatusItemsStatusDomainDataChangeContext;
  result = -[STStatusItemsStatusDomainDataChangeContext init](&v7, sel_init);
  if (result)
    result->_userInitiated = v5;
  return result;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

@end
