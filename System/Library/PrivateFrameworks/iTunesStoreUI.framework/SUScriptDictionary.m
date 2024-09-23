@implementation SUScriptDictionary

- (SUScriptDictionary)init
{
  return -[SUScriptDictionary initWithDictionary:](self, "initWithDictionary:", 0);
}

- (SUScriptDictionary)initWithDictionary:(id)a3
{
  id v4;
  SUScriptDictionary *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *accessQueue;
  uint64_t v9;
  NSDictionary *dictionary;
  id v11;
  NSDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *stringKeys;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SUScriptDictionary;
  v5 = -[SUScriptDictionary init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("com.apple.iTunesStoreUI.SUScriptDictionary-%p"), v5);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v7;

    v9 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v9;

    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v5->_dictionary;
    v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "addObject:", v17);
          ++v16;
        }
        while (v14 != v16);
        v14 = -[NSDictionary countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    v18 = objc_msgSend(v11, "copy");
    stringKeys = v5->_stringKeys;
    v5->_stringKeys = (NSArray *)v18;

  }
  return v5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x24BDFA950];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is readonly"), a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "throwException:", v5);

}

- (id)valueForNotNativelySupportedKey:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__33;
  v16 = __Block_byref_object_dispose__33;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__SUScriptDictionary_valueForNotNativelySupportedKey___block_invoke;
  block[3] = &unk_24DE7CE80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __54__SUScriptDictionary_valueForNotNativelySupportedKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  SUScriptDictionary *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(*(id *)(a1[4] + 32), "objectForKey:", a1[5]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
      v8 = -[SUScriptDictionary initWithDictionary:]([SUScriptDictionary alloc], "initWithDictionary:", v15);
      v9 = *(void **)(a1[4] + 24);
      if (!v9)
      {
        v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        v11 = a1[4];
        v12 = *(void **)(v11 + 24);
        *(_QWORD *)(v11 + 24) = v10;

        v9 = *(void **)(a1[4] + 24);
      }
      objc_msgSend(v9, "setObject:forKey:", v8, a1[5]);
      v13 = *(_QWORD *)(a1[6] + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v8;

    }
  }
}

- (id)stringRepresentation
{
  NSDictionary *dictionary;
  void *v3;
  void *v4;

  dictionary = self->_dictionary;
  if (dictionary)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", dictionary, 1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v3, 4);
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (BOOL)isKeyExcludedFromWebScript:(const char *)a3
{
  return 0;
}

+ (BOOL)isSelectorExcludedFromWebScript:(SEL)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "webScriptNameForSelector:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  return (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_36, 2);
}

- (id)attributeKeys
{
  return self->_stringKeys;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_36 = (uint64_t)sel_stringRepresentation;
    *(_QWORD *)algn_255186A88 = CFSTR("toString");
    qword_255186A90 = (uint64_t)sel_valueForNotNativelySupportedKey_;
    unk_255186A98 = CFSTR("get");
  }
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_cachedNestedScriptDictionaries, 0);
  objc_storeStrong((id *)&self->_stringKeys, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
