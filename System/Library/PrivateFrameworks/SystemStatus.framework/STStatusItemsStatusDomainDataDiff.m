@implementation STStatusItemsStatusDomainDataDiff

+ (id)diffFromData:(id)a3 toData:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  STStatusItemsStatusDomainDataDiff *v15;

  v5 = (objc_class *)MEMORY[0x1E0D017D0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v7, "statusItemsAttributionListData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusItemsAttributionListData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[STListDataDiff diffFromListData:toListData:](STListDataDiff, "diffFromListData:toListData:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "visualDescriptorsByIdentifierDictionaryData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "visualDescriptorsByIdentifierDictionaryData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[STDictionaryDataDiff diffFromDictionaryData:toDictionaryData:](STDictionaryDataDiff, "diffFromDictionaryData:toDictionaryData:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[STStatusItemsStatusDomainDataDiff initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:]([STStatusItemsStatusDomainDataDiff alloc], "initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:", v8, v11, v14);
  return v15;
}

- (STStatusItemsStatusDomainDataDiff)init
{
  id v3;
  STListDataDiff *v4;
  STDictionaryDataDiff *v5;
  STStatusItemsStatusDomainDataDiff *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0D01850]);
  v4 = objc_alloc_init(STListDataDiff);
  v5 = objc_alloc_init(STDictionaryDataDiff);
  v6 = -[STStatusItemsStatusDomainDataDiff initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:](self, "initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:", v3, v4, v5);

  return v6;
}

- (STStatusItemsStatusDomainDataDiff)initWithChanges:(id)a3 statusItemsAttributionListDataDiff:(id)a4 visualDescriptorsByIdentifierDictionaryDataDiff:(id)a5
{
  id v8;
  id v9;
  id v10;
  STStatusItemsStatusDomainDataDiff *v11;
  uint64_t v12;
  BSSettings *changes;
  uint64_t v14;
  STListDataDiff *statusItemsAttributionListDataDiff;
  uint64_t v16;
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)STStatusItemsStatusDomainDataDiff;
  v11 = -[STStatusItemsStatusDomainDataDiff init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    changes = v11->_changes;
    v11->_changes = (BSSettings *)v12;

    v14 = objc_msgSend(v9, "copy");
    statusItemsAttributionListDataDiff = v11->_statusItemsAttributionListDataDiff;
    v11->_statusItemsAttributionListDataDiff = (STListDataDiff *)v14;

    v16 = objc_msgSend(v10, "copy");
    visualDescriptorsByIdentifierDictionaryDataDiff = v11->_visualDescriptorsByIdentifierDictionaryDataDiff;
    v11->_visualDescriptorsByIdentifierDictionaryDataDiff = (STDictionaryDataDiff *)v16;

  }
  return v11;
}

- (id)dataByApplyingToData:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[STStatusItemsStatusDomainDataDiff applyToMutableData:](self, "applyToMutableData:", v4);
  return v4;
}

- (void)applyToMutableData:(id)a3
{
  BSSettings *changes;
  id v6;
  STListDataDiff *v7;
  void *v8;
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  STDictionaryDataDiff *v10;
  void *v11;
  void *v12;
  BSSettings *v13;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v13 = changes;
  v6 = a3;
  -[BSSettings enumerateObjectsWithBlock:](v13, "enumerateObjectsWithBlock:", &__block_literal_global_13);
  if (self)
  {
    v7 = self->_statusItemsAttributionListDataDiff;
    objc_msgSend(v6, "statusItemsAttributionListData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STListDataDiff applyToMutableListData:](v7, "applyToMutableListData:", v8);

    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  else
  {
    objc_msgSend(v6, "statusItemsAttributionListData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "applyToMutableListData:", v12);

    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  }
  v10 = visualDescriptorsByIdentifierDictionaryDataDiff;
  objc_msgSend(v6, "visualDescriptorsByIdentifierDictionaryData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[STDictionaryDataDiff applyToMutableDictionaryData:](v10, "applyToMutableDictionaryData:", v11);
}

- (BOOL)isEmpty
{
  BSSettings *changes;
  BSSettings *v4;
  STListDataDiff *statusItemsAttributionListDataDiff;
  STListDataDiff *v6;
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  BOOL v8;

  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v4 = changes;
  if (-[BSSettings isEmpty](v4, "isEmpty"))
  {
    if (self)
      statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
    else
      statusItemsAttributionListDataDiff = 0;
    v6 = statusItemsAttributionListDataDiff;
    if (-[STListDataDiff isEmpty](v6, "isEmpty"))
    {
      if (self)
        visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
      else
        visualDescriptorsByIdentifierDictionaryDataDiff = 0;
      v8 = -[STDictionaryDataDiff isEmpty](visualDescriptorsByIdentifierDictionaryDataDiff, "isEmpty");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)diffByApplyingDiff:(id)a3
{
  id v4;
  _QWORD *v5;
  BSSettings *changes;
  BSSettings *v7;
  void *v8;
  void *v9;
  id v10;
  STListDataDiff *statusItemsAttributionListDataDiff;
  uint64_t v12;
  STListDataDiff *v13;
  void *v14;
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  uint64_t v16;
  STDictionaryDataDiff *v17;
  void *v18;
  STStatusItemsStatusDomainDataDiff *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v7 = changes;
  v8 = (void *)-[BSSettings mutableCopy](v7, "mutableCopy");
  if (v5)
    v9 = (void *)v5[1];
  else
    v9 = 0;
  v10 = v9;
  objc_msgSend(v8, "applySettings:", v10);
  if (self)
  {
    statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
    if (v5)
    {
LABEL_8:
      v12 = v5[2];
      goto LABEL_9;
    }
  }
  else
  {
    statusItemsAttributionListDataDiff = 0;
    if (v5)
      goto LABEL_8;
  }
  v12 = 0;
LABEL_9:
  v13 = statusItemsAttributionListDataDiff;
  -[STListDataDiff diffByApplyingDiff:](v13, "diffByApplyingDiff:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self)
  {
    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
    if (v5)
      goto LABEL_11;
LABEL_20:
    v16 = 0;
    goto LABEL_12;
  }
  visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  if (!v5)
    goto LABEL_20;
LABEL_11:
  v16 = v5[3];
LABEL_12:
  v17 = visualDescriptorsByIdentifierDictionaryDataDiff;
  -[STDictionaryDataDiff diffByApplyingDiff:](v17, "diffByApplyingDiff:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[STStatusItemsStatusDomainDataDiff initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:]([STStatusItemsStatusDomainDataDiff alloc], "initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:", v8, v14, v18);
LABEL_14:

  return v19;
}

- (BOOL)isOrthogonalToDiff:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (-[STStatusItemsStatusDomainDataDiff isEmpty](self, "isEmpty"))
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
  STListDataDiff *statusItemsAttributionListDataDiff;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (self)
    changes = self->_changes;
  else
    changes = 0;
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke;
  v22[3] = &unk_1E91E4AB0;
  v9 = v6;
  v23 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", changes, v22);
  if (self)
    statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
  else
    statusItemsAttributionListDataDiff = 0;
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_2;
  v20[3] = &unk_1E91E4AB0;
  v12 = v9;
  v21 = v12;
  v13 = (id)objc_msgSend(v5, "appendObject:counterpart:", statusItemsAttributionListDataDiff, v20);
  if (self)
    self = (STStatusItemsStatusDomainDataDiff *)self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_3;
  v18[3] = &unk_1E91E4AB0;
  v19 = v12;
  v14 = v12;
  v15 = (id)objc_msgSend(v5, "appendObject:counterpart:", self, v18);
  v16 = objc_msgSend(v5, "isEqual");

  return v16;
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 8);
  else
    return 0;
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 16);
  else
    return 0;
}

id __45__STStatusItemsStatusDomainDataDiff_isEqual___block_invoke_3(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return *(id *)(v1 + 24);
  else
    return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  STListDataDiff *statusItemsAttributionListDataDiff;
  id v7;
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  id v9;
  unint64_t v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:", self->_changes);
    statusItemsAttributionListDataDiff = self->_statusItemsAttributionListDataDiff;
  }
  else
  {
    v12 = (id)objc_msgSend(v3, "appendObject:", 0);
    statusItemsAttributionListDataDiff = 0;
  }
  v7 = (id)objc_msgSend(v4, "appendObject:", statusItemsAttributionListDataDiff);
  if (self)
    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  else
    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  v9 = (id)objc_msgSend(v4, "appendObject:", visualDescriptorsByIdentifierDictionaryDataDiff);
  v10 = objc_msgSend(v4, "hash");

  return v10;
}

- (NSString)description
{
  return (NSString *)-[STStatusItemsStatusDomainDataDiff descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  STDictionaryDataDiff *visualDescriptorsByIdentifierDictionaryDataDiff;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_changes, CFSTR("changes"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_statusItemsAttributionListDataDiff, CFSTR("statusItemsAttributionListDataDiff"));
    visualDescriptorsByIdentifierDictionaryDataDiff = self->_visualDescriptorsByIdentifierDictionaryDataDiff;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("changes"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("statusItemsAttributionListDataDiff"));
    visualDescriptorsByIdentifierDictionaryDataDiff = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", visualDescriptorsByIdentifierDictionaryDataDiff, CFSTR("visualDescriptorsByIdentifierDictionaryDataDiff"));

}

- (STStatusItemsStatusDomainDataDiff)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  STStatusItemsStatusDomainDataDiff *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("changes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("statusItemsAttributionListDataDiff"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("visualDescriptorsByIdentifierDictionaryDataDiff"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[STStatusItemsStatusDomainDataDiff initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:](self, "initWithChanges:statusItemsAttributionListDataDiff:visualDescriptorsByIdentifierDictionaryDataDiff:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusItemsStatusDomainDataDiff succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusItemsStatusDomainDataDiff descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusItemsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
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
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

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
    v8 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
    v16[3] = &unk_1E91E4AD8;
    v9 = v6;
    v17 = v9;
    v18 = v3;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("statusItemAttributions"), v7, v16);

    objc_msgSend(v9, "activeMultilinePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2;
    v13[3] = &unk_1E91E4AD8;
    v11 = v9;
    v14 = v11;
    v15 = v3;
    objc_msgSend(v11, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("visualDescriptors"), v10, v13);

    v3 = v11;
  }
  return v3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusItemsStatusDomainDataDiff _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

id __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), 0, 1);
}

id __85__STStatusItemsStatusDomainDataDiff__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), 0, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualDescriptorsByIdentifierDictionaryDataDiff, 0);
  objc_storeStrong((id *)&self->_statusItemsAttributionListDataDiff, 0);
  objc_storeStrong((id *)&self->_changes, 0);
}

@end
