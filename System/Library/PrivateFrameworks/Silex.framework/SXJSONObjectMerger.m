@implementation SXJSONObjectMerger

- (SXJSONObjectMerger)initWithObjectClass:(Class)a3 exclusionKeys:(id)a4
{
  id v6;
  SXJSONObjectMergerClassProvider *v7;
  SXJSONObjectMerger *v8;

  v6 = a4;
  v7 = -[SXJSONObjectMergerClassProvider initWithObjectClass:]([SXJSONObjectMergerClassProvider alloc], "initWithObjectClass:", a3);
  v8 = -[SXJSONObjectMerger initWithClassProvider:exclusionKeys:](self, "initWithClassProvider:exclusionKeys:", v7, v6);

  return v8;
}

- (SXJSONObjectMerger)initWithClassProvider:(id)a3 exclusionKeys:(id)a4
{
  id v7;
  id v8;
  SXJSONObjectMerger *v9;
  SXJSONObjectMerger *v10;
  uint64_t v11;
  NSArray *exclusionKeys;
  uint64_t v13;
  NSMutableDictionary *transformers;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXJSONObjectMerger;
  v9 = -[SXJSONObjectMerger init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_classProvider, a3);
    v11 = objc_msgSend(v8, "copy");
    exclusionKeys = v10->_exclusionKeys;
    v10->_exclusionKeys = (NSArray *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    transformers = v10->_transformers;
    v10->_transformers = (NSMutableDictionary *)v13;

  }
  return v10;
}

- (id)mergeObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "reverseObjectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      do
      {
        -[SXJSONObjectMerger mergeDictionary:withDictionary:keyPath:](self, "mergeDictionary:withDictionary:keyPath:", v7, v9, &stru_24D68E0F8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "nextObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "JSONRepresentation");
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
        v7 = v10;
      }
      while (v12);
    }
    else
    {
      v10 = v7;
    }
    objc_msgSend(v4, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "specificationVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(objc_alloc((Class)-[SXJSONObjectMergerClassProviding classForObject:specVersion:](self->_classProvider, "classForObject:specVersion:", v10, v14)), "initWithJSONObject:andVersion:", v10, v14);
  }

  return v5;
}

- (void)addTransformer:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (v7 && objc_msgSend(v6, "length"))
    -[NSMutableDictionary setObject:forKey:](self->_transformers, "setObject:forKey:", v7, v6);

}

- (void)removeTransformerForKeyPath:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[NSMutableDictionary removeObjectForKey:](self->_transformers, "removeObjectForKey:", v4);

}

- (id)mergeDictionary:(id)a3 withDictionary:(id)a4 keyPath:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_msgSend(a3, "mutableCopy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __61__SXJSONObjectMerger_mergeDictionary_withDictionary_keyPath___block_invoke;
  v16[3] = &unk_24D689AC0;
  v16[4] = self;
  v17 = v8;
  v11 = v10;
  v18 = v11;
  v12 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);

  objc_msgSend(v11, "removeObjectsForKeys:", self->_exclusionKeys);
  v13 = v18;
  v14 = v11;

  return v14;
}

void __61__SXJSONObjectMerger_mergeDictionary_withDictionary_keyPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appendKey:keyPath:", v11, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKey:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "mergeDictionary:withDictionary:keyPath:", v7, v5, v6);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = (void *)v8;
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v11);

      goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
  }
LABEL_8:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "transformObject:otherObject:transformer:key:keyPath:dictionary:", v7, v5, v10, v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v11);
  }

}

- (void)transformObject:(id)a3 otherObject:(id)a4 transformer:(id)a5 key:(id)a6 keyPath:(id)a7 dictionary:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(v16, "transformKey:", v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transformObject:otherObject:", v18, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isEqualToString:", v24))
  {
    if (v20)
      objc_msgSend(v15, "setObject:forKey:", v20, v24);
  }
  else if (v21)
  {
    -[SXJSONObjectMerger appendKey:keyPath:](self, "appendKey:keyPath:", v19, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_transformers, "objectForKey:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      -[SXJSONObjectMerger transformObject:otherObject:transformer:key:keyPath:dictionary:](self, "transformObject:otherObject:transformer:key:keyPath:dictionary:", v21, v20, v23, v19, v22, v15);

  }
  else if (v20)
  {
    objc_msgSend(v15, "setObject:forKey:", v20, v19);
    objc_msgSend(v15, "removeObjectForKey:", v24);
  }

}

- (id)appendKey:(id)a3 keyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v7, "appendString:", v6);
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
    objc_msgSend(v7, "appendString:", CFSTR("."));
  if (objc_msgSend(v5, "length"))
    objc_msgSend(v7, "appendString:", v5);
  v8 = (void *)objc_msgSend(v7, "copy");

  return v8;
}

- (id)replaceLastKeyOfKeyPath:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v7, "count") - 1, v6);
  }
  else if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "addObject:", v6);
  }
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (SXJSONObjectMergerClassProviding)classProvider
{
  return self->_classProvider;
}

- (NSArray)exclusionKeys
{
  return self->_exclusionKeys;
}

- (NSMutableDictionary)transformers
{
  return self->_transformers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transformers, 0);
  objc_storeStrong((id *)&self->_exclusionKeys, 0);
  objc_storeStrong((id *)&self->_classProvider, 0);
}

@end
