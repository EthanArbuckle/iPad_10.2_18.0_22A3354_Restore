@implementation STSizeDict

- (STSizeDict)init
{
  STSizeDict *v2;
  uint64_t v3;
  NSDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSizeDict;
  v2 = -[STSizeDict init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    dictionary = v2->_dictionary;
    v2->_dictionary = (NSDictionary *)v3;

  }
  return v2;
}

- (STSizeDict)initWithDictionary:(id)a3
{
  id v5;
  STSizeDict *v6;
  STSizeDict *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSizeDict;
  v6 = -[STSizeDict init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dictionary, a3);

  return v7;
}

- (id)remapKeys:(id)a3 removeMissing:(BOOL)a4
{
  id v6;
  STMutableSizeDict *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = objc_alloc_init(STMutableSizeDict);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_dictionary;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (!v14 && !a4)
          v14 = v13;
        if (v14)
        {
          -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[STMutableSizeDict addSize:toKey:](v7, "addSize:toKey:", v15, v14);

        }
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v7;
}

- (STSizeVector)total
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[STSizeDict dictionary](self, "dictionary", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v8 += objc_msgSend(v11, "fixed");
        v6 += objc_msgSend(v11, "docsAndData");
        v7 += objc_msgSend(v11, "purgeable");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }

  +[STSizeVector fixed:docsAndData:purgeable:](STSizeVector, "fixed:docsAndData:purgeable:", v8, v6, v7);
  return (STSizeVector *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)plus:(id)a3
{
  id v4;
  STMutableSizeDict *v5;

  v4 = a3;
  v5 = objc_alloc_init(STMutableSizeDict);
  -[STMutableSizeDict plusEquals:](v5, "plusEquals:", self);
  -[STMutableSizeDict plusEquals:](v5, "plusEquals:", v4);

  return v5;
}

- (id)get:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[STSizeVector zero](STSizeVector, "zero");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
