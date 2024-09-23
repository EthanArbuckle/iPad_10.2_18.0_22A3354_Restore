@implementation STLocationStatusDomainDataChangeContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STLocationStatusDomainDataChangeContext initWithChangeContext:](+[STMutableLocationStatusDomainDataChangeContext allocWithZone:](STMutableLocationStatusDomainDataChangeContext, "allocWithZone:", a3), self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[STLocationStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"), CFSTR("userInitiated"));
  objc_msgSend(v4, "encodeBool:forKey:", -[STLocationStatusDomainDataChangeContext wantsProminentIndication](self, "wantsProminentIndication"), CFSTR("wantsProminentIndication"));

}

- (id)initWithChangeContext:(id)result
{
  void *v2;
  id v3;
  char v4;
  char v5;
  objc_super v6;

  if (result)
  {
    v2 = result;
    v3 = a2;
    v4 = objc_msgSend(v3, "isUserInitiated");
    v5 = objc_msgSend(v3, "wantsProminentIndication");

    v6.receiver = v2;
    v6.super_class = (Class)STLocationStatusDomainDataChangeContext;
    result = objc_msgSendSuper2(&v6, sel_init);
    if (result)
    {
      *((_BYTE *)result + 8) = v4;
      *((_BYTE *)result + 9) = v5;
    }
  }
  return result;
}

- (BOOL)wantsProminentIndication
{
  return self->_wantsProminentIndication;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (STLocationStatusDomainDataChangeContext)init
{
  return (STLocationStatusDomainDataChangeContext *)-[STLocationStatusDomainDataChangeContext initWithChangeContext:](self, 0);
}

- (STLocationStatusDomainDataChangeContext)initWithCoder:(id)a3
{
  id v4;
  char v5;
  char v6;
  STLocationStatusDomainDataChangeContext *result;
  objc_super v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsProminentIndication"));

  if (!self)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)STLocationStatusDomainDataChangeContext;
  result = -[STLocationStatusDomainDataChangeContext init](&v8, sel_init);
  if (result)
  {
    result->_userInitiated = v5;
    result->_wantsProminentIndication = v6;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
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
  v6 = -[STLocationStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated");
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke;
  v19[3] = &unk_1E91E4B28;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendBool:counterpart:", v6, v19);
  v10 = -[STLocationStatusDomainDataChangeContext wantsProminentIndication](self, "wantsProminentIndication");
  v14 = v7;
  v15 = 3221225472;
  v16 = __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke_2;
  v17 = &unk_1E91E4B28;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendBool:counterpart:", v10, &v14);
  LOBYTE(v10) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return v10;
}

uint64_t __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isUserInitiated");
}

uint64_t __51__STLocationStatusDomainDataChangeContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "wantsProminentIndication");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:", -[STLocationStatusDomainDataChangeContext isUserInitiated](self, "isUserInitiated"));
  v5 = (id)objc_msgSend(v3, "appendBool:", -[STLocationStatusDomainDataChangeContext wantsProminentIndication](self, "wantsProminentIndication"));
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (NSString)description
{
  return (NSString *)-[STLocationStatusDomainDataChangeContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STLocationStatusDomainDataChangeContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STLocationStatusDomainDataChangeContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  STLocationStatusDomainDataChangeContext *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  STLocationStatusDomainDataChangeContext *v10;

  v3 = self;
  if (self)
  {
    v4 = a3;
    -[STLocationStatusDomainDataChangeContext succinctDescriptionBuilder](v3, "succinctDescriptionBuilder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUseDebugDescription:", 0);
    objc_msgSend(v5, "setActiveMultilinePrefix:", v4);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91__STLocationStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v8[3] = &unk_1E91E4AD8;
    v6 = v5;
    v9 = v6;
    v10 = v3;
    objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

    v3 = (STLocationStatusDomainDataChangeContext *)v6;
  }
  return v3;
}

id __91__STLocationStatusDomainDataChangeContext__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isUserInitiated"), CFSTR("userInitiated"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "wantsProminentIndication"), CFSTR("wantsProminentIndication"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
