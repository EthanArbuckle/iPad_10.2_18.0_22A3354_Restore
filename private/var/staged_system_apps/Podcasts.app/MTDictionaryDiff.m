@implementation MTDictionaryDiff

- (void)addCallback:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff callbacks](self, "callbacks"));
  v5 = objc_retainBlock(v4);

  objc_msgSend(v6, "addObject:", v5);
}

- (MTDictionaryDiff)initWithProperties:(id)a3
{
  id v5;
  MTDictionaryDiff *v6;
  NSMutableArray *v7;
  NSMutableArray *callbacks;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MTDictionaryDiff;
  v6 = -[MTDictionaryDiff init](&v10, "init");
  if (v6)
  {
    v7 = objc_opt_new(NSMutableArray);
    callbacks = v6->_callbacks;
    v6->_callbacks = v7;

    objc_storeStrong((id *)&v6->_properties, a3);
  }

  return v6;
}

- (void)setDictionary:(id)a3
{
  NSDictionary *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  NSDictionary *dictionary;
  uint64_t v20;
  NSDictionary *v21;
  MTDictionaryDiff *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v4 = (NSDictionary *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff dictionary](self, "dictionary"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v22 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff properties](self, "properties"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    v21 = v4;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, v20, v21));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v10));
        if (v11 != v12 && (objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
        {
          v13 = v5;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTDictionaryDiff callbacks](v22, "callbacks"));
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v25;
            do
            {
              for (j = 0; j != v16; j = (char *)j + 1)
              {
                if (*(_QWORD *)v25 != v17)
                  objc_enumerationMutation(v14);
                (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j) + 16))();
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v16);
          }

          v5 = v13;
          v8 = v20;
          v4 = v21;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v7);
  }

  dictionary = v22->_dictionary;
  v22->_dictionary = v4;

}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (NSSet)properties
{
  return self->_properties;
}

- (MTDictionaryDiff)init
{
  return -[MTDictionaryDiff initWithProperties:](self, "initWithProperties:", 0);
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void)setCallbacks:(id)a3
{
  objc_storeStrong((id *)&self->_callbacks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
