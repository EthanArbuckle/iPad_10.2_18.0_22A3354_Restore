@implementation PEEditActionEventBuilder

- (PEEditActionEventBuilder)initWithBaseAction:(id)a3 assets:(id)a4
{
  id v7;
  id v8;
  PEEditActionEventBuilder *v9;
  PEEditActionEventBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionEventBuilder;
  v9 = -[PEEditActionEventBuilder init](&v12, sel_init);
  v10 = v9;
  if (v7 && v9)
  {
    objc_storeStrong((id *)&v9->_baseAction, a3);
    -[PEEditActionEventBuilder registerAction:forAssets:](v10, "registerAction:forAssets:", v10->_baseAction, v8);
  }

  return v10;
}

- (PEEditActionEventBuilder)initWithActionDescription:(id)a3 assets:(id)a4
{
  id v7;
  id v8;
  PEEditActionEventBuilder *v9;
  PEEditActionEventBuilder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PEEditActionEventBuilder;
  v9 = -[PEEditActionEventBuilder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionDescription, a3);
    -[PEEditActionEventBuilder registerActionType:forAssets:](v10, "registerActionType:forAssets:", v7, v8);
  }

  return v10;
}

- (void)registerAction:(id)a3 forAssets:(id)a4
{
  unint64_t v6;
  const __CFString *v7;
  id v8;

  v8 = a4;
  v6 = objc_msgSend(a3, "actionType") - 1;
  if (v6 > 7)
    v7 = CFSTR("Unknown");
  else
    v7 = off_24C618660[v6];
  -[PEEditActionEventBuilder registerActionType:forAssets:](self, "registerActionType:forAssets:", v7, v8);

}

- (void)registerActionType:(id)a3 forAssets:(id)a4
{
  id v6;
  id v7;
  NSDictionary *assetsMap;
  NSDictionary *v9;
  NSDictionary *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *v17;
  NSDictionary *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  assetsMap = self->_assetsMap;
  if (!assetsMap)
  {
    v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCE70]);
    v10 = self->_assetsMap;
    self->_assetsMap = v9;

    assetsMap = self->_assetsMap;
  }
  v11 = (void *)-[NSDictionary mutableCopy](assetsMap, "mutableCopy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "setObject:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16++), (_QWORD)v19);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  v17 = (NSDictionary *)objc_msgSend(v11, "copy");
  v18 = self->_assetsMap;
  self->_assetsMap = v17;

}

- (id)buildEvents
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSDictionary *assetsMap;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;

  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[NSDictionary allKeys](self->_assetsMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v7 = MEMORY[0x24BDAC760];
  assetsMap = self->_assetsMap;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__PEEditActionEventBuilder_buildEvents__block_invoke;
  v16[3] = &unk_24C618618;
  v17 = v6;
  v9 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetsMap, "enumerateKeysAndObjectsUsingBlock:", v16);
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __39__PEEditActionEventBuilder_buildEvents__block_invoke_2;
  v14[3] = &unk_24C618640;
  v14[4] = self;
  v10 = v5;
  v15 = v10;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v15;
  v12 = v10;

  return v12;
}

- (BOOL)hasError
{
  return self->_hasError;
}

- (void)setHasError:(BOOL)a3
{
  self->_hasError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsMap, 0);
  objc_storeStrong((id *)&self->_actionDescription, 0);
  objc_storeStrong((id *)&self->_baseAction, 0);
}

void __39__PEEditActionEventBuilder_buildEvents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if ((v7 & 1) == 0)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "containsObject:", v10) & 1) == 0)
    objc_msgSend(v9, "addObject:", v10);

}

void __39__PEEditActionEventBuilder_buildEvents__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  v7 = a2;
  v12 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "hasError"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("hasError"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("actionType"));
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 8);
  if (v10)
  {
    objc_msgSend(v10, "analyticsPayload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addEntriesFromDictionary:", v11);

    v9 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", *(_QWORD *)(v9 + 16), CFSTR("actionDescription"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE121B8]);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
}

@end
