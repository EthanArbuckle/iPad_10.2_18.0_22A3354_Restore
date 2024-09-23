@implementation TLKKeyValueTuple

- (void)setKey:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_key != v10)
  {
    objc_storeStrong((id *)&self->_key, a3);
    -[TLKObject observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKObject observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKObject observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setValue:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_value != v10)
  {
    objc_storeStrong((id *)&self->_value, a3);
    -[TLKObject observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKObject observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKObject observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

+ (id)tupleWithKey:(id)a3 value:(id)a4
{
  id v5;
  id v6;
  TLKKeyValueTuple *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TLKKeyValueTuple);
  -[TLKKeyValueTuple setKey:](v7, "setKey:", v6);

  -[TLKKeyValueTuple setValue:](v7, "setValue:", v5);
  return v7;
}

+ (id)tuplesForDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[TLKKeyValueTuple tupleWithKey:value:](TLKKeyValueTuple, "tupleWithKey:value:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)tuplesForKeys:(id)a3 values:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKKeyValueTuple tupleWithKey:value:](TLKKeyValueTuple, "tupleWithKey:value:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
