@implementation STStatusDomainDataChangeLog

- (id)recordForKey:(id)a3
{
  if (self)
    self = (STStatusDomainDataChangeLog *)self->_recordsByKey;
  return (id)-[STStatusDomainDataChangeLog objectForKey:](self, "objectForKey:", a3);
}

uint64_t __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:", a2);
}

void __52__STStatusDomainDataChangeLog_currentDataForDomain___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentDataForDomain:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;

}

- (id)currentDataForDomain:(unint64_t)a3
{
  NSDictionary *recordsByKey;
  NSDictionary *v6;
  NSOrderedSet *sortedRecordKeys;
  NSOrderedSet *v8;
  NSDictionary *v9;
  id v10;
  _QWORD v12[4];
  NSDictionary *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  if (self)
    recordsByKey = self->_recordsByKey;
  else
    recordsByKey = 0;
  v6 = recordsByKey;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  if (self)
    sortedRecordKeys = self->_sortedRecordKeys;
  else
    sortedRecordKeys = 0;
  v8 = sortedRecordKeys;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__STStatusDomainDataChangeLog_currentDataForDomain___block_invoke;
  v12[3] = &unk_1E91E60F8;
  v9 = v6;
  v13 = v9;
  v14 = &v16;
  v15 = a3;
  -[NSOrderedSet enumerateObjectsWithOptions:usingBlock:](v8, "enumerateObjectsWithOptions:usingBlock:", 2, v12);

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

void __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a3, "domainsWithData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke_2;
  v5[3] = &unk_1E91E60A8;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v4, "enumerateWithBlock:", v5);

}

- (BSIntegerSet)domainsWithData
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0D017C0]);
  if (self)
    self = (STStatusDomainDataChangeLog *)self->_recordsByKey;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__STStatusDomainDataChangeLog_domainsWithData__block_invoke;
  v6[3] = &unk_1E91E60D0;
  v4 = v3;
  v7 = v4;
  -[STStatusDomainDataChangeLog enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v6);

  return (BSIntegerSet *)v4;
}

- (STStatusDomainDataChangeLog)initWithRecordKeys:(id)a3
{
  id v4;
  STStatusDomainDataChangeLog *v5;
  uint64_t v6;
  NSOrderedSet *sortedRecordKeys;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  STStatusDomainDataChangeRecord *v15;
  uint64_t v16;
  NSDictionary *recordsByKey;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STStatusDomainDataChangeLog;
  v5 = -[STStatusDomainDataChangeLog init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sortedRecordKeys = v5->_sortedRecordKeys;
    v5->_sortedRecordKeys = (NSOrderedSet *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v15 = objc_alloc_init(STStatusDomainDataChangeRecord);
          objc_msgSend(v8, "setObject:forKey:", v15, v14, (_QWORD)v19);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v11);
    }

    v16 = objc_msgSend(v8, "copy");
    recordsByKey = v5->_recordsByKey;
    v5->_recordsByKey = (NSDictionary *)v16;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordsByKey, 0);
  objc_storeStrong((id *)&self->_sortedRecordKeys, 0);
}

@end
