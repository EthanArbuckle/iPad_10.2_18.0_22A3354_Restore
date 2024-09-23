@implementation STStatusDomainDataChangeRecordDiffEntry

- (STStatusDomainDataDiff)diff
{
  return self->_diff;
}

- (unint64_t)entryType
{
  return 1;
}

- (id)clientKey
{
  return self->_clientKey;
}

- (STStatusDomainDataChangeRecordDiffEntry)initWithDiff:(id)a3 clientKey:(id)a4
{
  id v7;
  id v8;
  STStatusDomainDataChangeRecordDiffEntry *v9;
  STStatusDomainDataChangeRecordDiffEntry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STStatusDomainDataChangeRecordDiffEntry;
  v9 = -[STStatusDomainDataChangeRecordDiffEntry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_diff, a3);
    objc_storeStrong(&v10->_clientKey, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientKey, 0);
  objc_storeStrong((id *)&self->_diff, 0);
}

- (STStatusDomainData)data
{
  return 0;
}

- (NSString)description
{
  return (NSString *)-[STStatusDomainDataChangeRecordDiffEntry descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusDomainDataChangeRecordDiffEntry succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusDomainDataChangeRecordDiffEntry descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusDomainDataChangeRecordDiffEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v10[2] = __91__STStatusDomainDataChangeRecordDiffEntry__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusDomainDataChangeRecordDiffEntry _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __91__STStatusDomainDataChangeRecordDiffEntry__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("clientKey"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("diff"));
}

@end
