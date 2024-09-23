@implementation _UILazyMapTable

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_keysToValues, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    (*((void (**)(void))self->_mappingBlock + 2))();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_keysToClientTables, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[NSMapTable setObject:forKey:](self->_keysToValues, "setObject:forKey:", v5, v4);
      -[NSMapTable setObject:forKey:](self->_valuesToKeys, "setObject:forKey:", v4, v5);
    }
  }

  return v5;
}

- (void)unregisterClient:(id)a3 ofObjectForKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_keysToClientTables, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "removeObject:", v10);
    if (!objc_msgSend(v8, "count"))
    {
      -[NSMapTable removeObjectForKey:](self->_keysToClientTables, "removeObjectForKey:", v6);
      -[NSMapTable objectForKey:](self->_keysToValues, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable removeObjectForKey:](self->_keysToValues, "removeObjectForKey:", v6);
      -[NSMapTable removeObjectForKey:](self->_valuesToKeys, "removeObjectForKey:", v9);

    }
  }

}

- (void)registerClient:(id)a3 ofObjectForKey:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_keysToClientTables, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 0, 1);
    -[NSMapTable setObject:forKey:](self->_keysToClientTables, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

- (BOOL)hasCachedObjectForKey:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_keysToValues, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)cachedObjectEnumerable
{
  return self->_valuesToKeys;
}

- (_UILazyMapTable)initWithMappingBlock:(id)a3
{
  id v4;
  _UILazyMapTable *v5;
  uint64_t v6;
  id mappingBlock;
  uint64_t v8;
  NSMapTable *keysToClientTables;
  uint64_t v10;
  NSMapTable *keysToValues;
  uint64_t v12;
  NSMapTable *valuesToKeys;
  _UILazyMapTable *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UILazyMapTable;
  v5 = -[_UILazyMapTable init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    mappingBlock = v5->_mappingBlock;
    v5->_mappingBlock = (id)v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    keysToClientTables = v5->_keysToClientTables;
    v5->_keysToClientTables = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    keysToValues = v5->_keysToValues;
    v5->_keysToValues = (NSMapTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    valuesToKeys = v5->_valuesToKeys;
    v5->_valuesToKeys = (NSMapTable *)v12;

    v14 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p cachedValues=%@, clients=%@>"), v5, self, self->_keysToValues, self->_keysToClientTables);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)count
{
  return -[NSMapTable count](self->_keysToValues, "count");
}

- (id)keys
{
  return NSAllMapTableKeys(self->_keysToValues);
}

- (id)cachedObjects
{
  return NSAllMapTableKeys(self->_valuesToKeys);
}

- (id)keyEnumerable
{
  return self->_keysToValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valuesToKeys, 0);
  objc_storeStrong((id *)&self->_keysToValues, 0);
  objc_storeStrong((id *)&self->_keysToClientTables, 0);
  objc_storeStrong(&self->_mappingBlock, 0);
}

@end
