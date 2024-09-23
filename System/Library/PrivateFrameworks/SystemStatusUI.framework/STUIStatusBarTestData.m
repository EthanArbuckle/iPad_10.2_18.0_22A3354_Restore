@implementation STUIStatusBarTestData

+ (id)testDataWithUpdatedKeys:(id)a3 enabledKeys:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = v8;
  if (!v6)
  {
    objc_msgSend(v8, "setUpdatedKeys:", 0);
    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v9, "setEnabledKeys:", 0);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUpdatedKeys:", v10);

  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabledKeys:", v11);

LABEL_6:
  return v9;
}

+ (id)fullTestData
{
  return (id)objc_msgSend(a1, "testDataWithUpdatedKeys:enabledKeys:", 0, 0);
}

+ (id)emptyTestData
{
  return objc_alloc_init((Class)a1);
}

+ (id)dependentDataKeyForItemIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  NSStringFromClass((Class)objc_msgSend(v4, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dependentDataKeyForDisplayItemIdentifier:(id)a3
{
  void *v4;
  void *v5;

  +[STUIStatusBarItem itemIdentifierForDisplayItemIdentifier:](STUIStatusBarItem, "itemIdentifierForDisplayItemIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dependentDataKeyForItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (STUIStatusBarTestData)init
{
  STUIStatusBarTestData *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarTestData;
  v2 = -[STUIStatusBarTestData init](&v7, sel_init);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarTestData setTestEntries:](v2, "setTestEntries:", v3);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarTestData setUpdatedKeys:](v2, "setUpdatedKeys:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarTestData setEnabledKeys:](v2, "setEnabledKeys:", v5);

  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarTestData;
  v4 = -[STStatusBarData copyWithZone:](&v9, sel_copyWithZone_, a3);
  v5 = (void *)-[NSSet copy](self->_updatedKeys, "copy");
  objc_msgSend(v4, "setUpdatedKeys:", v5);

  v6 = (void *)-[NSSet copy](self->_enabledKeys, "copy");
  objc_msgSend(v4, "setEnabledKeys:", v6);

  v7 = (void *)-[NSMutableDictionary mutableCopy](self->_testEntries, "mutableCopy");
  objc_msgSend(v4, "setTestEntries:", v7);

  return v4;
}

- (BOOL)isEmpty
{
  NSSet *updatedKeys;

  if (-[NSMutableDictionary count](self->_testEntries, "count"))
  {
    LOBYTE(updatedKeys) = 0;
  }
  else
  {
    updatedKeys = self->_updatedKeys;
    if (updatedKeys)
      LOBYTE(updatedKeys) = -[NSSet count](updatedKeys, "count") == 0;
  }
  return (char)updatedKeys;
}

- (void)setDataEntry:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_testEntries, "setObject:forKeyedSubscript:", a3, a4);
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  NSSet *updatedKeys;
  NSSet *enabledKeys;
  STStatusBarDataTestEntry *v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_testEntries, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    updatedKeys = self->_updatedKeys;
    if (updatedKeys && !-[NSSet containsObject:](updatedKeys, "containsObject:", v4))
    {
      v5 = 0;
    }
    else
    {
      enabledKeys = self->_enabledKeys;
      if (enabledKeys && !-[NSSet containsObject:](enabledKeys, "containsObject:", v4))
      {
        +[STStatusBarDataTestEntry disabledEntry](STStatusBarDataTestEntry, "disabledEntry");
        v8 = (STStatusBarDataTestEntry *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = objc_alloc_init(STStatusBarDataTestEntry);
      }
      v5 = v8;
    }
  }

  return v5;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  NSSet *updatedKeys;
  NSMutableDictionary *testEntries;
  id v8;
  NSSet *v9;
  NSSet *v10;

  if (a3)
  {
    v10 = (NSSet *)a4;
    -[STUIStatusBarTestData setDataEntry:forKey:](self, "setDataEntry:forKey:", a3, v10);
    updatedKeys = v10;
  }
  else
  {
    testEntries = self->_testEntries;
    v8 = a4;
    -[NSMutableDictionary removeObjectForKey:](testEntries, "removeObjectForKey:", v8);
    v9 = (NSSet *)-[NSSet mutableCopy](self->_updatedKeys, "mutableCopy");
    -[NSSet removeObject:](v9, "removeObject:", v8);

    updatedKeys = self->_updatedKeys;
    self->_updatedKeys = v9;
  }

}

- (id)existingEntryKeys
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allKeys](self->_testEntries, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  if (self->_updatedKeys)
    objc_msgSend(v3, "unionSet:");
  return v3;
}

- (void)applyUpdate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)STUIStatusBarTestData;
  -[STUIStatusBarTestData applyUpdate:](&v23, sel_applyUpdate_, v4);
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "testEntries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __37__STUIStatusBarTestData_applyUpdate___block_invoke;
    v22[3] = &unk_1E8D62D00;
    v22[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v22);

    -[NSMutableDictionary allKeys](self->_testEntries, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v5, "valueForKey:", v14, (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_testEntries, "setObject:forKeyedSubscript:", v15, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v11);
    }

    objc_msgSend(v5, "updatedKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarTestData setUpdatedKeys:](self, "setUpdatedKeys:", v16);

    objc_msgSend(v5, "enabledKeys");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[STUIStatusBarTestData setEnabledKeys:](self, "setEnabledKeys:", v17);

  }
}

uint64_t __37__STUIStatusBarTestData_applyUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  STUIStatusBarTestData *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarTestData;
  -[STStatusBarData _descriptionBuilderWithMultilinePrefix:forDebug:](&v13, sel__descriptionBuilderWithMultilinePrefix_forDebug_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeMultilinePrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__STUIStatusBarTestData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v10[3] = &unk_1E8D62C88;
  v7 = v5;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("testing"), v6, v10);

  v8 = v7;
  return v8;
}

void __73__STUIStatusBarTestData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "updatedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v4, CFSTR("updatedKeys"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "enabledKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("enabledKeys"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "testEntries");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendDictionarySection:withName:skipIfEmpty:", v9, CFSTR("testEntries"), 1);

}

- (NSSet)updatedKeys
{
  return self->_updatedKeys;
}

- (void)setUpdatedKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSSet)enabledKeys
{
  return self->_enabledKeys;
}

- (void)setEnabledKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSMutableDictionary)testEntries
{
  return self->_testEntries;
}

- (void)setTestEntries:(id)a3
{
  objc_storeStrong((id *)&self->_testEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testEntries, 0);
  objc_storeStrong((id *)&self->_enabledKeys, 0);
  objc_storeStrong((id *)&self->_updatedKeys, 0);
}

@end
