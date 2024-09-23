@implementation REKeyMultiValueMap

- (REKeyMultiValueMap)init
{
  return -[REKeyMultiValueMap initWithValuePointFunctionOptions:](self, "initWithValuePointFunctionOptions:", 0);
}

- (REKeyMultiValueMap)initWithValuePointFunctionOptions:(unint64_t)a3
{
  REKeyMultiValueMap *v4;
  uint64_t v5;
  NSMapTable *keyMap;
  uint64_t v7;
  NSMapTable *valueMap;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)REKeyMultiValueMap;
  v4 = -[REKeyMultiValueMap init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 0, a3);
    v5 = objc_claimAutoreleasedReturnValue();
    keyMap = v4->_keyMap;
    v4->_keyMap = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", a3, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    valueMap = v4->_valueMap;
    v4->_valueMap = (NSMapTable *)v7;

  }
  return v4;
}

- (unint64_t)keyCount
{
  return -[NSMapTable count](self->_keyMap, "count");
}

- (unint64_t)valueCount
{
  return -[NSMapTable count](self->_valueMap, "count");
}

- (void)addKey:(id)a3 withValues:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NSMapTable setObject:forKey:](self->_keyMap, "setObject:forKey:", v7, v6);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[NSMapTable setObject:forKey:](self->_valueMap, "setObject:forKey:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)removeKey:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable objectForKey:](self->_keyMap, "objectForKey:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[NSMapTable removeObjectForKey:](self->_valueMap, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[NSMapTable removeObjectForKey:](self->_keyMap, "removeObjectForKey:", v4);
}

- (void)insertValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[REKeyMultiValueMap valuesForKey:](self, "valuesForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[REKeyMultiValueMap removeKey:](self, "removeKey:", v6);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "addObject:", v10);
  v9 = (void *)objc_msgSend(v8, "copy");
  -[REKeyMultiValueMap addKey:withValues:](self, "addKey:withValues:", v6, v9);

}

- (void)removeValue:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[REKeyMultiValueMap valuesForKey:](self, "valuesForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[REKeyMultiValueMap removeKey:](self, "removeKey:", v10);
  objc_msgSend(v8, "removeObject:", v6);

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    -[REKeyMultiValueMap addKey:withValues:](self, "addKey:withValues:", v10, v9);

  }
}

- (void)enumerateValuesForKey:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[REKeyMultiValueMap valuesForKey:](self, "valuesForKey:", a3, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)valuesForKey:(id)a3
{
  return -[NSMapTable objectForKey:](self->_keyMap, "objectForKey:", a3);
}

- (id)keyForValue:(id)a3
{
  return -[NSMapTable objectForKey:](self->_valueMap, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMap, 0);
  objc_storeStrong((id *)&self->_keyMap, 0);
}

@end
