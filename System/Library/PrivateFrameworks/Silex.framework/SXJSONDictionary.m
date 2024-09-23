@implementation SXJSONDictionary

- (SXJSONDictionary)initWithValueClassBlock:(id)a3 objectValueClassBlock:(id)a4 purgeBlock:(id)a5 andJSONObject:(id)a6 andVersion:(id)a7
{
  id v12;
  id v13;
  id v14;
  SXJSONDictionary *v15;
  id v16;
  SXJSONDictionary *v17;
  SXJSONDictionary *v18;
  void *v19;
  id v20;
  uint64_t v21;
  id objectValueClassBlock;
  uint64_t v23;
  id valueClassBlock;
  uint64_t v25;
  NSDictionary *json;
  NSMutableDictionary *v27;
  NSMutableDictionary *objects;
  uint64_t v29;
  NSArray *keys;
  SXJSONDictionary *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (SXJSONDictionary *)a6;
  v16 = a7;
  if (v12)
  {
    v37.receiver = self;
    v37.super_class = (Class)SXJSONDictionary;
    v17 = -[SXJSONObject init](&v37, sel_init);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong((id *)&v17->super._specificationVersion, a7);
      v19 = (void *)-[SXJSONDictionary mutableCopy](v15, "mutableCopy");
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __102__SXJSONDictionary_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke;
      v33[3] = &unk_24D689BD0;
      v34 = v19;
      v36 = v14;
      v35 = v16;
      v20 = v19;
      -[SXJSONDictionary enumerateKeysAndObjectsUsingBlock:](v15, "enumerateKeysAndObjectsUsingBlock:", v33);
      v21 = objc_msgSend(v13, "copy");
      objectValueClassBlock = v18->_objectValueClassBlock;
      v18->_objectValueClassBlock = (id)v21;

      v23 = objc_msgSend(v12, "copy");
      valueClassBlock = v18->_valueClassBlock;
      v18->_valueClassBlock = (id)v23;

      v25 = objc_msgSend(v20, "copy");
      json = v18->_json;
      v18->_json = (NSDictionary *)v25;

      v18->_count = -[NSDictionary count](v18->_json, "count");
      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      objects = v18->_objects;
      v18->_objects = v27;

      -[NSDictionary allKeys](v18->_json, "allKeys");
      v29 = objc_claimAutoreleasedReturnValue();
      keys = v18->_keys;
      v18->_keys = (NSArray *)v29;

    }
    self = v18;
  }
  else
  {
    v18 = v15;
  }
  v31 = v18;

  return v31;
}

void __102__SXJSONDictionary_initWithValueClassBlock_objectValueClassBlock_purgeBlock_andJSONObject_andVersion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5
    || (v7 = *(_QWORD *)(a1 + 48)) != 0
    && (*(unsigned int (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v5, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v8);
  }

}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v7;
  id *v8;
  unint64_t v10;
  unint64_t v11;

  var0 = a3->var0;
  if (self->_count - a3->var0 >= a5)
    v7 = a5;
  else
    v7 = self->_count - a3->var0;
  a3->var1 = a4;
  a3->var2 = a3->var3;
  if (v7)
  {
    v8 = a4;
    v10 = var0;
    v11 = v7;
    do
    {
      *v8++ = -[SXJSONDictionary keyAtIndex:](self, "keyAtIndex:", v10++);
      --v11;
    }
    while (v11);
  }
  a3->var0 = v7 + var0;
  return v7;
}

- (id)keyAtIndex:(unint64_t)a3
{
  void *v3;

  if (self->_count <= a3)
  {
    v3 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)allObjects
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_count)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_count);
    if (self->_count)
    {
      v4 = 0;
      do
      {
        -[NSArray objectAtIndex:](self->_keys, "objectAtIndex:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXJSONDictionary objectForKey:](self, "objectForKey:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);

        ++v4;
      }
      while (v4 < self->_count);
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

- (id)objectForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t (**objectValueClassBlock)(id, void *, _QWORD, NSString *);
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __objc2_class *v13;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableDictionary objectForKey:](self->_objects, "objectForKey:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->super._unfairLock);
    if (!v5)
    {
      -[NSDictionary objectForKey:](self->_json, "objectForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objectValueClassBlock = (uint64_t (**)(id, void *, _QWORD, NSString *))self->_objectValueClassBlock;
        if (objectValueClassBlock)
        {
          v8 = (objc_class *)objectValueClassBlock[2](objectValueClassBlock, v6, 0, self->super._specificationVersion);
        }
        else if (self->_valueClassBlock)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("type"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (objc_class *)(*((uint64_t (**)(void))self->_valueClassBlock + 2))();

        }
        else
        {
          v8 = 0;
        }
        if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
        {
          v5 = (id)objc_msgSend([v8 alloc], "initWithJSONObject:andVersion:", v6, self->super._specificationVersion);
          goto LABEL_19;
        }
        if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "purgeClassBlockForPropertyWithName:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = SXJSONDictionary;
LABEL_18:
          v5 = (id)objc_msgSend([v13 alloc], "initWithValueClassBlock:objectValueClassBlock:purgeBlock:andJSONObject:andVersion:", v11, v10, v12, v6, self->super._specificationVersion);

LABEL_19:
          if (!v5)
          {
LABEL_22:

            goto LABEL_23;
          }
LABEL_20:
          os_unfair_lock_lock_with_options();
          -[NSMutableDictionary setObject:forKey:](self->_objects, "setObject:forKey:", v5, v4);
          os_unfair_lock_unlock(&self->super._unfairLock);
          goto LABEL_22;
        }
        if (-[objc_class isSubclassOfClass:](v8, "isSubclassOfClass:", objc_opt_class()))
        {
          objc_msgSend((id)objc_opt_class(), "objectValueClassBlockForPropertyWithName:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "valueClassBlockForPropertyWithName:", v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "purgeClassBlockForPropertyWithName:", v4);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = SXJSONArray;
          goto LABEL_18;
        }
      }
      else if (v6)
      {
        v5 = v6;
        goto LABEL_20;
      }
      v5 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_23:

  return v5;
}

- (id)allKeys
{
  return self->_keys;
}

- (id)NSDictionary
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_keys;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[SXJSONDictionary objectForKey:](self, "objectForKey:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v10, v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)jsonDictionary
{
  return self->_json;
}

- (id)JSONRepresentation
{
  return self->_json;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[SXJSONDictionary allKeys](self, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXJSONDictionary allObjects](self, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", CFSTR("{"));
  if (objc_msgSend(v3, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != objc_msgSend(v3, "count") - 1)
        objc_msgSend(v5, "appendFormat:", CFSTR("%@ => %@,\n"), v7, v8);

      ++v6;
    }
    while (v6 < objc_msgSend(v3, "count"));
  }
  objc_msgSend(v5, "appendString:", CFSTR("}"));

  return v5;
}

- (id)objectValueClassBlock
{
  return self->_objectValueClassBlock;
}

- (id)valueClassBlock
{
  return self->_valueClassBlock;
}

- (NSDictionary)json
{
  return self->_json;
}

- (NSMutableDictionary)objects
{
  return self->_objects;
}

- (NSArray)keys
{
  return self->_keys;
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_json, 0);
  objc_storeStrong(&self->_valueClassBlock, 0);
  objc_storeStrong(&self->_objectValueClassBlock, 0);
}

@end
