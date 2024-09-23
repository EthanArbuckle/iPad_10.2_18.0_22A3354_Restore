@implementation STMutableSizeDict

- (STMutableSizeDict)init
{
  void *v3;
  STMutableSizeDict *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STMutableSizeDict initWithDictionary:](self, "initWithDictionary:", v3);

  return v4;
}

- (STMutableSizeDict)initWithDictionary:(id)a3
{
  id v5;
  STMutableSizeDict *v6;
  STMutableSizeDict *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STMutableSizeDict;
  v6 = -[STSizeDict initWithDictionary:](&v9, sel_initWithDictionary_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mutableDictionary, a3);

  return v7;
}

- (void)plusEquals:(id)a3
{
  void *v4;
  _QWORD v5[5];

  if (a3)
  {
    objc_msgSend(a3, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __32__STMutableSizeDict_plusEquals___block_invoke;
    v5[3] = &unk_24C75FC00;
    v5[4] = self;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
}

void __32__STMutableSizeDict_plusEquals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "plus:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v8, v7);
}

- (void)addSize:(id)a3 toKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(v10, "isZero") & 1) == 0)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableDictionary, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "plus:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableDictionary, "setObject:forKeyedSubscript:", v9, v6);

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableDictionary, "setObject:forKeyedSubscript:", v10, v6);
    }

  }
}

- (void)setSize:(id)a3 forKey:(id)a4
{
  NSMutableDictionary *mutableDictionary;

  mutableDictionary = self->_mutableDictionary;
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](mutableDictionary, "setObject:forKeyedSubscript:", a3, a4);
  else
    -[NSMutableDictionary removeObjectForKey:](mutableDictionary, "removeObjectForKey:", a4);
}

- (void)removeSmallerThan:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableDictionary, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableDictionary, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "userTotal") < a3)
          -[NSMutableDictionary removeObjectForKey:](self->_mutableDictionary, "removeObjectForKey:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (BOOL)hasKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_mutableDictionary, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableDictionary, 0);
}

@end
