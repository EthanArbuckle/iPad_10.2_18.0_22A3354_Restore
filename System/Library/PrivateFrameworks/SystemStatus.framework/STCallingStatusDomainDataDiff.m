@implementation STCallingStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  STCallingStatusDomainDataDiff *v9;

  v5 = a4;
  objc_msgSend(a3, "callDescriptorListData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "callDescriptorListData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[STCallingStatusDomainDataDiff initWithCallDescriptorListDataDiff:]([STCallingStatusDomainDataDiff alloc], "initWithCallDescriptorListDataDiff:", v8);
  return v9;
}

- (STCallingStatusDomainDataDiff)init
{
  STListDataDiff *v3;
  STCallingStatusDomainDataDiff *v4;

  v3 = objc_alloc_init(STListDataDiff);
  v4 = -[STCallingStatusDomainDataDiff initWithCallDescriptorListDataDiff:](self, "initWithCallDescriptorListDataDiff:", v3);

  return v4;
}

- (STCallingStatusDomainDataDiff)initWithCallDescriptorListDataDiff:(id)a3
{
  id v4;
  STCallingStatusDomainDataDiff *v5;
  uint64_t v6;
  STListDataDiff *callDescriptorListDataDiff;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STCallingStatusDomainDataDiff;
  v5 = -[STCallingStatusDomainDataDiff init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    callDescriptorListDataDiff = v5->_callDescriptorListDataDiff;
    v5->_callDescriptorListDataDiff = (STListDataDiff *)v6;

  }
  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STCallingStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  STListDataDiff *callDescriptorListDataDiff;
  STListDataDiff *v5;
  id v6;

  if (self)
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  else
    callDescriptorListDataDiff = 0;
  v5 = callDescriptorListDataDiff;
  objc_msgSend(a3, "callDescriptorListData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[STListDataDiff applyToMutableListData:](v5, "applyToMutableListData:", v6);

}

- (BOOL)isEmpty
{
  if (self)
    self = (STCallingStatusDomainDataDiff *)self->_callDescriptorListDataDiff;
  return -[STCallingStatusDomainDataDiff isEmpty](self, "isEmpty");
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  uint64_t *v5;
  uint64_t *v6;
  STListDataDiff *callDescriptorListDataDiff;
  uint64_t v8;
  STListDataDiff *v9;
  void *v10;
  STCallingStatusDomainDataDiff *v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_7;
  }
  v5 = (uint64_t *)v4;
  v6 = v5;
  if (!self)
  {
    callDescriptorListDataDiff = 0;
    if (v5)
      goto LABEL_4;
LABEL_9:
    v8 = 0;
    goto LABEL_5;
  }
  callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  if (!v5)
    goto LABEL_9;
LABEL_4:
  v8 = v5[1];
LABEL_5:
  v9 = callDescriptorListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v9, "diffByApplyingDiff:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[STCallingStatusDomainDataDiff initWithCallDescriptorListDataDiff:]([STCallingStatusDomainDataDiff alloc], "initWithCallDescriptorListDataDiff:", v10);
LABEL_7:

  return v11;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STCallingStatusDomainDataDiff isEmpty](self, "isEmpty"))
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "isEmpty");

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    self = (STCallingStatusDomainDataDiff *)self->_callDescriptorListDataDiff;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__STCallingStatusDomainDataDiff_isEqual___block_invoke;
  v10[3] = &unk_1E91E4AB0;
  v11 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v10);
  v8 = objc_msgSend(v5, "isEqual");

  return v8;
}

id __41__STCallingStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  STListDataDiff *callDescriptorListDataDiff;
  id v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  else
    callDescriptorListDataDiff = 0;
  v6 = (id)objc_msgSend(v3, "appendObject:", callDescriptorListDataDiff);
  v7 = objc_msgSend(v4, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)-[STCallingStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  STListDataDiff *callDescriptorListDataDiff;

  if (self)
    callDescriptorListDataDiff = self->_callDescriptorListDataDiff;
  else
    callDescriptorListDataDiff = 0;
  objc_msgSend(a3, "encodeObject:forKey:", callDescriptorListDataDiff, CFSTR("callDescriptorListDataDiff"));
}

- (STCallingStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  STCallingStatusDomainDataDiff *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callDescriptorListDataDiff"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[STCallingStatusDomainDataDiff initWithCallDescriptorListDataDiff:](self, "initWithCallDescriptorListDataDiff:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STCallingStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STCallingStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STCallingStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  if (a1)
  {
    v5 = a2;
    objc_msgSend(v3, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    objc_msgSend(v6, "activeMultilinePrefix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__STCallingStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v10[3] = &unk_1E91E4AD8;
    v8 = v6;
    v11 = v8;
    v12 = v3;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", 0, v7, v10);

    v3 = v8;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STCallingStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __81__STCallingStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDescriptorListDataDiff, 0);
}

@end
