@implementation STStatusDomainDataChangeRecord

- (void)addDiff:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  BSMutableIntegerMap *entriesByDomain;
  id v10;
  id v11;
  void *v12;
  STStatusDomainDataChangeRecordDiffEntry *v13;
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  BSMutableIntegerMap *v15;

  if (self)
    entriesByDomain = self->_entriesByDomain;
  else
    entriesByDomain = 0;
  v15 = entriesByDomain;
  v10 = a4;
  v11 = a3;
  -[BSMutableIntegerMap objectForKey:](v15, "objectForKey:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableIntegerMap setObject:forKey:](v15, "setObject:forKey:", v12, a5);
  }
  v13 = -[STStatusDomainDataChangeRecordDiffEntry initWithDiff:clientKey:]([STStatusDomainDataChangeRecordDiffEntry alloc], "initWithDiff:clientKey:", v11, v10);

  objc_msgSend(v12, "addObject:", v13);
  -[STStatusDomainDataChangeRecord _combineTrailingDiffEntriesIfPossible:]((uint64_t)self, v12);
  if (self)
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  else
    cachedCurrentDataByDomain = 0;
  -[BSMutableIntegerMap removeObjectForKey:](cachedCurrentDataByDomain, "removeObjectForKey:", a5);

}

- (void)setFallbackData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  id v8;
  BSMutableIntegerMap *fallbackDataByClientKeyByDomain;
  BSMutableIntegerMap *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  if (self)
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  else
    fallbackDataByClientKeyByDomain = 0;
  v10 = fallbackDataByClientKeyByDomain;
  -[BSMutableIntegerMap objectForKey:](v10, "objectForKey:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableIntegerMap setObject:forKey:](v10, "setObject:forKey:", v11, a5);
  }
  objc_msgSend(v11, "setObject:forKey:", v12, v8);

}

- (id)currentDataForDomain:(unint64_t)a3
{
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  BSMutableIntegerMap *v6;
  void *v7;
  BSMutableIntegerMap *entriesByDomain;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self)
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  else
    cachedCurrentDataByDomain = 0;
  v6 = cachedCurrentDataByDomain;
  -[BSMutableIntegerMap objectForKey:](v6, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (self)
      entriesByDomain = self->_entriesByDomain;
    else
      entriesByDomain = 0;
    -[BSMutableIntegerMap objectForKey:](entriesByDomain, "objectForKey:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "entryType"))
      {
        objc_msgSend(v10, "clientKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[STStatusDomainDataChangeRecord fallbackDataForClientKey:domain:](self, "fallbackDataForClientKey:domain:", v11, a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v17, "entryType", (_QWORD)v21))
            {
              objc_msgSend(v17, "diff");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "dataByApplyingDiff:", v18);
              v19 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v19;
            }
            else
            {
              objc_msgSend(v17, "data");
              v18 = v7;
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

      -[BSMutableIntegerMap setObject:forKey:](v6, "setObject:forKey:", v7, a3);
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (id)fallbackDataForClientKey:(id)a3 domain:(unint64_t)a4
{
  BSMutableIntegerMap *fallbackDataByClientKeyByDomain;
  id v6;
  void *v7;
  void *v8;

  if (self)
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  else
    fallbackDataByClientKeyByDomain = 0;
  v6 = a3;
  -[BSMutableIntegerMap objectForKey:](fallbackDataByClientKeyByDomain, "objectForKey:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_combineTrailingDiffEntriesIfPossible:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  STStatusDomainDataChangeRecordDiffEntry *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v3 = a2;
  if (a1)
  {
    v17 = v3;
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      while (objc_msgSend(v4, "entryType") == 1)
      {
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke;
        v21[3] = &unk_1E91E6198;
        v7 = v4;
        v22 = v7;
        v8 = v6;
        v23 = v8;
        if (objc_msgSend(v5, "bs_containsObjectPassingTest:", v21))
        {

          v4 = 0;
          break;
        }
        objc_msgSend(v7, "clientKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "diff");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "valueForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "diff");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "diffByApplyingDiff:", v12);
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = v10;
        }
        v14 = v13;
        v15 = -[STStatusDomainDataChangeRecordDiffEntry initWithDiff:clientKey:]([STStatusDomainDataChangeRecordDiffEntry alloc], "initWithDiff:clientKey:", v13, v9);
        objc_msgSend(v8, "setObject:forKey:", v15, v9);
        objc_msgSend(v5, "addObject:", v9);
        objc_msgSend(v17, "removeLastObject");
        objc_msgSend(v17, "lastObject");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v4)
          break;
      }
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke_2;
    v18[3] = &unk_1E91E61C0;
    v19 = v6;
    v20 = v17;
    v16 = v6;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v18);

    v3 = v17;
  }

}

- (BSIntegerSet)domainsWithData
{
  if (self)
    self = (STStatusDomainDataChangeRecord *)self->_entriesByDomain;
  return (BSIntegerSet *)-[STStatusDomainDataChangeRecord allKeys](self, "allKeys");
}

void __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __72__STStatusDomainDataChangeRecord__combineTrailingDiffEntriesIfPossible___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "clientKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diff");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "diff");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v9, "isOrthogonalToDiff:", v8);

    v6 = v7 ^ 1;
  }

  return v6;
}

- (STStatusDomainDataChangeRecord)init
{
  STStatusDomainDataChangeRecord *v2;
  BSMutableIntegerMap *v3;
  BSMutableIntegerMap *fallbackDataByClientKeyByDomain;
  BSMutableIntegerMap *v5;
  BSMutableIntegerMap *entriesByDomain;
  BSMutableIntegerMap *v7;
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STStatusDomainDataChangeRecord;
  v2 = -[STStatusDomainDataChangeRecord init](&v10, sel_init);
  if (v2)
  {
    v3 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    fallbackDataByClientKeyByDomain = v2->_fallbackDataByClientKeyByDomain;
    v2->_fallbackDataByClientKeyByDomain = v3;

    v5 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    entriesByDomain = v2->_entriesByDomain;
    v2->_entriesByDomain = v5;

    v7 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    cachedCurrentDataByDomain = v2->_cachedCurrentDataByDomain;
    v2->_cachedCurrentDataByDomain = v7;

  }
  return v2;
}

- (BSIntegerSet)domainsWithSignificantData
{
  id v3;
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0D017C0]);
  if (self)
    cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
  else
    cachedCurrentDataByDomain = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__STStatusDomainDataChangeRecord_domainsWithSignificantData__block_invoke;
  v9[3] = &unk_1E91E6120;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  -[BSMutableIntegerMap enumerateWithBlock:](cachedCurrentDataByDomain, "enumerateWithBlock:", v9);
  v6 = v10;
  v7 = v5;

  return (BSIntegerSet *)v7;
}

void __60__STStatusDomainDataChangeRecord_domainsWithSignificantData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  _QWORD v14[5];

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  if (!v5)
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = objc_alloc_init((Class)objc_opt_class());
      v13 = objc_msgSend(v6, "isEqual:", v12);

      if ((v13 & 1) != 0)
        return;
      goto LABEL_8;
    }
LABEL_6:

    return;
  }
  v7 = v6;
  v8 = objc_msgSend(v7, "activeDisplayModes");
  objc_msgSend(v7, "attributions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__STStatusDomainDataChangeRecord__isDataSignificant___block_invoke;
  v14[3] = &__block_descriptor_40_e51_B16__0__STLocationStatusDomainLocationAttribution_8l;
  v14[4] = v8;
  objc_msgSend(v9, "bs_filter:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "count");
  if (v11)
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "addValue:", a2);
}

- (void)setData:(id)a3 forClientKey:(id)a4 domain:(unint64_t)a5
{
  id v8;
  STStatusDomainDataChangeRecordDataEntry *v9;
  void *v10;
  BSMutableIntegerMap *v11;
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  BSMutableIntegerMap *entriesByDomain;
  id v14;

  v14 = a3;
  v8 = a4;
  if (!v14)
  {
    if (self)
      entriesByDomain = self->_entriesByDomain;
    else
      entriesByDomain = 0;
    -[BSMutableIntegerMap removeObjectForKey:](entriesByDomain, "removeObjectForKey:", a5);
    if (self)
      goto LABEL_5;
LABEL_10:
    cachedCurrentDataByDomain = 0;
    goto LABEL_6;
  }
  v9 = -[STStatusDomainDataChangeRecordDataEntry initWithData:clientKey:]([STStatusDomainDataChangeRecordDataEntry alloc], "initWithData:clientKey:", v14, v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v9, 0);
  if (self)
    v11 = self->_entriesByDomain;
  else
    v11 = 0;
  -[BSMutableIntegerMap setObject:forKey:](v11, "setObject:forKey:", v10, a5);

  if (!self)
    goto LABEL_10;
LABEL_5:
  cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
LABEL_6:
  -[BSMutableIntegerMap removeObjectForKey:](cachedCurrentDataByDomain, "removeObjectForKey:", a5);

}

- (void)removeAllEntriesForClientKey:(id)a3 domain:(unint64_t)a4
{
  id v6;
  BSMutableIntegerMap *fallbackDataByClientKeyByDomain;
  BSMutableIntegerMap *v8;
  void *v9;
  BSMutableIntegerMap *entriesByDomain;
  BSMutableIntegerMap *v11;
  void *v12;
  void *v13;
  BSMutableIntegerMap *cachedCurrentDataByDomain;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  if (self)
    fallbackDataByClientKeyByDomain = self->_fallbackDataByClientKeyByDomain;
  else
    fallbackDataByClientKeyByDomain = 0;
  v8 = fallbackDataByClientKeyByDomain;
  -[BSMutableIntegerMap objectForKey:](v8, "objectForKey:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeObjectForKey:", v6);
  if (!objc_msgSend(v9, "count"))
    -[BSMutableIntegerMap removeObjectForKey:](v8, "removeObjectForKey:", a4);
  if (self)
    entriesByDomain = self->_entriesByDomain;
  else
    entriesByDomain = 0;
  v11 = entriesByDomain;
  -[BSMutableIntegerMap objectForKey:](v11, "objectForKey:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__STStatusDomainDataChangeRecord_removeAllEntriesForClientKey_domain___block_invoke;
  v16[3] = &unk_1E91E6148;
  v15 = v6;
  v17 = v15;
  objc_msgSend(v12, "indexesOfObjectsPassingTest:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectsAtIndexes:", v13);
  if (!objc_msgSend(v12, "count"))
  {
    -[BSMutableIntegerMap removeObjectForKey:](v11, "removeObjectForKey:", a4);
    if (self)
      goto LABEL_9;
LABEL_12:
    cachedCurrentDataByDomain = 0;
    goto LABEL_10;
  }
  -[STStatusDomainDataChangeRecord _combineTrailingDiffEntriesIfPossible:]((uint64_t)self, v12);
  if (!self)
    goto LABEL_12;
LABEL_9:
  cachedCurrentDataByDomain = self->_cachedCurrentDataByDomain;
LABEL_10:
  -[BSMutableIntegerMap removeObjectForKey:](cachedCurrentDataByDomain, "removeObjectForKey:", a4);

}

uint64_t __70__STStatusDomainDataChangeRecord_removeAllEntriesForClientKey_domain___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "clientKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)enumerateEntriesByDomainUsingBlock:(id)a3
{
  id v4;
  BSMutableIntegerMap *entriesByDomain;
  BSMutableIntegerMap *v6;
  void *v7;
  void *v8;
  BSMutableIntegerMap *v9;
  id v10;
  _QWORD v11[4];
  BSMutableIntegerMap *v12;
  id v13;

  v4 = a3;
  if (self)
    entriesByDomain = self->_entriesByDomain;
  else
    entriesByDomain = 0;
  v6 = entriesByDomain;
  -[STStatusDomainDataChangeRecord domainsWithData](self, "domainsWithData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__STStatusDomainDataChangeRecord_enumerateEntriesByDomainUsingBlock___block_invoke;
  v11[3] = &unk_1E91E6170;
  v12 = v6;
  v13 = v4;
  v10 = v4;
  v9 = v6;
  objc_msgSend(v8, "enumerateWithBlock:", v11);

}

void __69__STStatusDomainDataChangeRecord_enumerateEntriesByDomainUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *a3 = 0;

}

BOOL __53__STStatusDomainDataChangeRecord__isDataSignificant___block_invoke(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & objc_msgSend(a2, "eligibleDisplayModes")) != 0;
}

- (NSString)description
{
  return (NSString *)-[STStatusDomainDataChangeRecord descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusDomainDataChangeRecord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[STStatusDomainDataChangeRecord descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusDomainDataChangeRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  if (!a1)
    return 0;
  v5 = a2;
  objc_msgSend(a1, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDebugDescription:", a3);
  objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[2];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__STStatusDomainDataChangeRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v12[3] = &unk_1E91E6208;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "enumerateWithBlock:", v12);
  objc_msgSend(v6, "activeMultilinePrefix");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendDictionarySection:withName:multilinePrefix:skipIfEmpty:", v9, CFSTR("entries"), v10, 1);

  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusDomainDataChangeRecord _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

void __82__STStatusDomainDataChangeRecord__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  STSystemStatusDescriptionForDomain(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %ld)"), a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedCurrentDataByDomain, 0);
  objc_storeStrong((id *)&self->_entriesByDomain, 0);
  objc_storeStrong((id *)&self->_fallbackDataByClientKeyByDomain, 0);
}

@end
