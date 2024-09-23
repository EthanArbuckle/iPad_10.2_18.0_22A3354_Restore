@implementation STStatusBarDataAdditionsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;

  v5 = (objc_class *)MEMORY[0x1E0D017D0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v7, "entryDictionaryData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "entryDictionaryData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[STDictionaryDataDiff diffFromDictionaryData:toDictionaryData:](STDictionaryDataDiff, "diffFromDictionaryData:toDictionaryData:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:]([STStatusBarDataAdditionsStatusDomainDataDiff alloc], v8, v11);
  return v12;
}

- (_QWORD)initWithChanges:(void *)a3 entryDictionaryDataDiff:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STStatusBarDataAdditionsStatusDomainDataDiff;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (STStatusBarDataAdditionsStatusDomainDataDiff)init
{
  id v3;
  STDictionaryDataDiff *v4;
  STStatusBarDataAdditionsStatusDomainDataDiff *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = objc_alloc_init(STDictionaryDataDiff);
  v5 = (STStatusBarDataAdditionsStatusDomainDataDiff *)-[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:](self, v3, v4);

  return v5;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STStatusBarDataAdditionsStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  BSSettings *changes;
  id v6;
  STDictionaryDataDiff *entryDictionaryDataDiff;
  STDictionaryDataDiff *v8;
  void *v9;
  BSSettings *v10;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v10 = changes;
  v6 = a3;
  -[BSSettings isEmpty](v10, "isEmpty");
  if (self)
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  else
    entryDictionaryDataDiff = 0;
  v8 = entryDictionaryDataDiff;
  objc_msgSend(v6, "entryDictionaryData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[STDictionaryDataDiff applyToMutableDictionaryData:](v8, "applyToMutableDictionaryData:", v9);
}

- (BOOL)isEmpty
{
  BSSettings *changes;
  BSSettings *v4;
  STDictionaryDataDiff *entryDictionaryDataDiff;
  BOOL v6;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v4 = changes;
  if (-[BSSettings isEmpty](v4, "isEmpty"))
  {
    if (self)
      entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
    else
      entryDictionaryDataDiff = 0;
    v6 = -[STDictionaryDataDiff isEmpty](entryDictionaryDataDiff, "isEmpty");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  BSSettings *changes;
  void *v7;
  void *v8;
  id v9;
  STDictionaryDataDiff *entryDictionaryDataDiff;
  uint64_t v11;
  STDictionaryDataDiff *v12;
  void *v13;
  _QWORD *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = 0;
    goto LABEL_11;
  }
  v5 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v7 = (void *)-[BSSettings mutableCopy](changes, "mutableCopy");
  if (v5)
    v8 = (void *)v5[1];
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(v7, "applySettings:", v9);
  if (!self)
  {
    entryDictionaryDataDiff = 0;
    if (v5)
      goto LABEL_8;
LABEL_15:
    v11 = 0;
    goto LABEL_9;
  }
  entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  if (!v5)
    goto LABEL_15;
LABEL_8:
  v11 = v5[2];
LABEL_9:
  v12 = entryDictionaryDataDiff;
  -[STDictionaryDataDiff diffByApplyingDiff:](v12, "diffByApplyingDiff:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:]([STStatusBarDataAdditionsStatusDomainDataDiff alloc], v7, v13);
LABEL_11:

  return v14;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STStatusBarDataAdditionsStatusDomainDataDiff isEmpty](self, "isEmpty"))
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
  BSSettings *changes;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v8 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke;
  v20[3] = &unk_1E91E4AB0;
  v9 = v6;
  v21 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", changes, v20);
  if (self)
    self = (STStatusBarDataAdditionsStatusDomainDataDiff *)self->_entryDictionaryDataDiff;
  v15 = v8;
  v16 = 3221225472;
  v17 = __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke_2;
  v18 = &unk_1E91E4AB0;
  v19 = v9;
  v11 = v9;
  v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, &v15);
  v13 = objc_msgSend(v5, "isEqual", v15, v16, v17, v18);

  return v13;
}

id __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __56__STStatusBarDataAdditionsStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STDictionaryDataDiff *entryDictionaryDataDiff;
  id v7;
  unint64_t v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_changes);
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  }
  else
  {
    v10 = (id)objc_msgSend(v3, "appendObject:", 0);
    entryDictionaryDataDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", entryDictionaryDataDiff);
  v8 = objc_msgSend(v4, "hash");

  return v8;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarDataAdditionsStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  STDictionaryDataDiff *entryDictionaryDataDiff;

  if (self)
  {
    objc_msgSend(a3, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
    entryDictionaryDataDiff = self->_entryDictionaryDataDiff;
  }
  else
  {
    objc_msgSend(a3, "encodeObject:forKey:", 0, CFSTR("changes"));
    entryDictionaryDataDiff = 0;
  }
  objc_msgSend(a3, "encodeObject:forKey:", entryDictionaryDataDiff, CFSTR("entryDictionaryDataDiff"));

}

- (STStatusBarDataAdditionsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STStatusBarDataAdditionsStatusDomainDataDiff *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entryDictionaryDataDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (STStatusBarDataAdditionsStatusDomainDataDiff *)-[STStatusBarDataAdditionsStatusDomainDataDiff initWithChanges:entryDictionaryDataDiff:](self, v5, v6);
  return v7;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarDataAdditionsStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusBarDataAdditionsStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarDataAdditionsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
    v10[2] = __96__STStatusBarDataAdditionsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
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
  return -[STStatusBarDataAdditionsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __96__STStatusBarDataAdditionsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDictionaryDataDiff, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
