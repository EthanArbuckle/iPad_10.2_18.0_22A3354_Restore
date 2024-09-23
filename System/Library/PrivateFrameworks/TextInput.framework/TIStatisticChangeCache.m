@implementation TIStatisticChangeCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7359 != -1)
    dispatch_once(&sharedInstance_onceToken_7359, &__block_literal_global_7360);
  return (id)sharedInstance_instance_7361;
}

void __40__TIStatisticChangeCache_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_7361;
  sharedInstance_instance_7361 = v0;

}

- (TIStatisticChangeCache)init
{
  TIStatisticChangeCache *v2;
  uint64_t v3;
  NSMutableDictionary *cacheWithoutInputMode;
  uint64_t v5;
  NSMutableDictionary *cacheWithInputMode;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TIStatisticChangeCache;
  v2 = -[TIStatisticChangeCache init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cacheWithoutInputMode = v2->_cacheWithoutInputMode;
    v2->_cacheWithoutInputMode = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    cacheWithInputMode = v2->_cacheWithInputMode;
    v2->_cacheWithInputMode = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)flush
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *cacheWithoutInputMode;
  NSMutableDictionary *v26;
  NSMutableDictionary *cacheWithInputMode;
  NSMutableDictionary *obj;
  uint64_t v30;
  TIStatisticChangeCache *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v4 = self->_cacheWithoutInputMode;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_cacheWithoutInputMode, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        +[TIStatisticChange statisticChangeWithName:andValue:andInputMode:](TIStatisticChange, "statisticChangeWithName:andValue:andInputMode:", v9, v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v12);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v6);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = self->_cacheWithInputMode;
  v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v32)
  {
    v30 = *(_QWORD *)v39;
    v31 = self;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(obj);
        v33 = v13;
        v14 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v13);
        -[NSMutableDictionary objectForKey:](self->_cacheWithInputMode, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v35 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v15, "objectForKey:", v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "intValue");

              +[TIStatisticChange statisticChangeWithName:andValue:andInputMode:](TIStatisticChange, "statisticChangeWithName:andValue:andInputMode:", v20, v22, v14);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v23);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
          }
          while (v17);
        }

        v13 = v33 + 1;
        self = v31;
      }
      while (v33 + 1 != v32);
      v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v32);
  }

  v24 = (NSMutableDictionary *)objc_opt_new();
  cacheWithoutInputMode = self->_cacheWithoutInputMode;
  self->_cacheWithoutInputMode = v24;

  v26 = (NSMutableDictionary *)objc_opt_new();
  cacheWithInputMode = self->_cacheWithInputMode;
  self->_cacheWithInputMode = v26;

  return v3;
}

- (void)addValue:(int)a3 toStatisticWithName:(id)a4 andInputMode:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = *(_QWORD *)&a3;
  v12 = a4;
  v8 = a5;
  if (v8)
  {
    -[NSMutableDictionary objectForKey:](self->_cacheWithInputMode, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[NSMutableDictionary allKeys](self->_cacheWithInputMode, "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v11)
        -[NSMutableDictionary removeAllObjects](self->_cacheWithInputMode, "removeAllObjects");
      v9 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKey:](self->_cacheWithInputMode, "setObject:forKey:", v9, v8);
    }
    -[TIStatisticChangeCache addValue:toStatisticWithName:inCache:](self, "addValue:toStatisticWithName:inCache:", v6, v12, v9);

  }
  else
  {
    -[TIStatisticChangeCache addValue:toStatisticWithName:inCache:](self, "addValue:toStatisticWithName:inCache:", v6, v12, self->_cacheWithoutInputMode);
  }

}

- (void)addValue:(int)a3 toStatisticWithName:(id)a4 inCache:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9;
  if (v9)
    v6 = objc_msgSend(v9, "intValue") + v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheWithInputMode, 0);
  objc_storeStrong((id *)&self->_cacheWithoutInputMode, 0);
}

@end
