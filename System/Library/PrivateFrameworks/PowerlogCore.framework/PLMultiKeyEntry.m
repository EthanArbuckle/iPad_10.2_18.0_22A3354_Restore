@implementation PLMultiKeyEntry

- (PLMultiKeyEntry)init
{
  PLMultiKeyEntry *v2;
  uint64_t v3;
  NSMutableDictionary *multiKeys;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLMultiKeyEntry;
  v2 = -[PLEntry init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    multiKeys = v2->_multiKeys;
    v2->_multiKeys = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PLMultiKeyEntry;
  -[PLEntry setObject:forKey:](&v10, sel_setObject_forKey_, a3, v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__PLMultiKeyEntry_setObject_forKey___block_invoke;
    v8[3] = &unk_1E6A53450;
    v8[4] = self;
    v9 = v7;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);

  }
}

void __36__PLMultiKeyEntry_setObject_forKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "multiKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "multiKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v19);

  }
  objc_msgSend(*(id *)(a1 + 32), "multiKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "multiKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "multiKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)multiKeys
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiKeys, 0);
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLMultiKeyEntry;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)keysForSubKey:(id)a3 ofSubKeyType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[PLMultiKeyEntry multiKeys](self, "multiKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)objectsForSubKey:(id)a3 ofSubKeyType:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PLMultiKeyEntry keysForSubKey:ofSubKeyType:](self, "keysForSubKey:ofSubKeyType:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[PLEntry objectForKey:](self, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)serializedForJSON
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)objc_opt_new();
  -[PLEntry dictionary](self, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__PLMultiKeyEntry_serializedForJSON__block_invoke;
  v10[3] = &unk_1E6A53478;
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v10);

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLEntry entryDate](self, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  objc_msgSend(v6, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("timestamp"));

  return v5;
}

void __36__PLMultiKeyEntry_serializedForJSON__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("__"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v11;
    }
    else
    {
      objc_msgSend(v11, "description");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v8;
  }
  if ((objc_msgSend(v5, "isNil") & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "timeIntervalSince1970");
      objc_msgSend(v9, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);
    }
  }

}

- (void)setMultiKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

@end
