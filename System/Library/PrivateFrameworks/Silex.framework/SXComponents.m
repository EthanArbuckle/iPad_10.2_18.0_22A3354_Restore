@implementation SXComponents

- (SXComponents)init
{
  return -[SXComponents initWithArray:](self, "initWithArray:", 0);
}

- (SXComponents)initWithArray:(id)a3
{
  id v4;
  SXComponents *v5;
  uint64_t v6;
  NSMutableArray *components;
  uint64_t v8;
  NSMutableDictionary *componentsByIdentifier;
  uint64_t v10;
  NSMutableDictionary *childComponentsByParentIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SXComponents;
  v5 = -[SXComponents init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    components = v5->_components;
    v5->_components = (NSMutableArray *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    componentsByIdentifier = v5->_componentsByIdentifier;
    v5->_componentsByIdentifier = (NSMutableDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    childComponentsByParentIdentifier = v5->_childComponentsByParentIdentifier;
    v5->_childComponentsByParentIdentifier = (NSMutableDictionary *)v10;

    -[SXComponents addComponentsFromArray:](v5, "addComponentsFromArray:", v4);
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_components, "count");
}

- (NSArray)allComponents
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_components, "copy");
}

- (void)enumerateComponentsWithBlock:(id)a3
{
  unsigned int (**v4)(id, SXComponents *, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, SXComponents *, void *))a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)-[NSMutableArray copy](self->_components, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (v4[2](v4, self, v10))
        {
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[SXComponents componentsForContainerComponentWithIdentifier:](self, "componentsForContainerComponentWithIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "enumerateComponentsWithBlock:", v4);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (id)componentAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_components, "objectAtIndex:", a3);
}

- (unint64_t)indexOfComponent:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_components, "indexOfObject:", a3);
}

- (id)componentForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_componentsByIdentifier, "objectForKey:", a3);
}

- (id)componentsForContainerComponentWithIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_childComponentsByParentIdentifier, "objectForKey:", a3);
}

- (id)componentsForContainerComponentWithPath:(id)a3
{
  SXComponents *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SXComponents *v8;
  uint64_t v9;

  v4 = self;
  objc_msgSend(a3, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    do
    {
      -[SXComponents componentsForContainerComponentWithIdentifier:](v4, "componentsForContainerComponentWithIdentifier:", v7);
      v8 = (SXComponents *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "nextObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v9;
      v4 = v8;
    }
    while (v9);
  }
  else
  {
    v8 = v4;
  }

  return v8;
}

- (void)addComponentsFromArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SXComponents addComponent:](self, "addComponent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addComponent:(id)a3
{
  id v4;
  NSMutableDictionary *componentsByIdentifier;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    componentsByIdentifier = self->_componentsByIdentifier;
    v8 = v4;
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](componentsByIdentifier, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[SXComponents replaceComponent:withComponent:](self, "replaceComponent:withComponent:", v7, v8);
    else
      -[SXComponents insertComponent:atIndex:](self, "insertComponent:atIndex:", v8, -[SXComponents count](self, "count"));

    v4 = v8;
  }

}

- (void)insertComponent:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  NSMutableDictionary *componentsByIdentifier;
  void *v9;
  char isKindOfClass;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *childComponentsByParentIdentifier;
  void *v17;
  id v18;

  v6 = a3;
  if (v6)
  {
    v18 = v6;
    v7 = -[SXComponents count](self, "count");
    v6 = v18;
    if (v7 >= a4)
    {
      componentsByIdentifier = self->_componentsByIdentifier;
      objc_msgSend(v18, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](componentsByIdentifier, "setObject:forKey:", v18, v9);

      -[NSMutableArray insertObject:atIndex:](self->_components, "insertObject:atIndex:", v18, a4);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v6 = v18;
      if ((isKindOfClass & 1) != 0)
      {
        v11 = v18;
        v12 = objc_alloc((Class)objc_opt_class());
        objc_msgSend(v11, "components");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "NSArray");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v12, "initWithArray:", v14);

        childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
        objc_msgSend(v11, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableDictionary setObject:forKey:](childComponentsByParentIdentifier, "setObject:forKey:", v15, v17);
        v6 = v18;
      }
    }
  }

}

- (void)insertComponent:(id)a3 afterComponent:(id)a4
{
  unint64_t v6;
  id v7;

  v7 = a3;
  v6 = -[SXComponents indexOfComponent:](self, "indexOfComponent:", a4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    -[SXComponents addComponent:](self, "addComponent:", v7);
  else
    -[SXComponents insertComponent:atIndex:](self, "insertComponent:atIndex:", v7, v6 + 1);

}

- (void)replaceComponentAtIndex:(unint64_t)a3 withComponent:(id)a4
{
  id v6;

  v6 = a4;
  -[SXComponents removeComponentAtIndex:](self, "removeComponentAtIndex:", a3);
  -[SXComponents insertComponent:atIndex:](self, "insertComponent:atIndex:", v6, a3);

}

- (void)replaceComponent:(id)a3 withComponent:(id)a4
{
  id v6;

  v6 = a4;
  -[SXComponents replaceComponentAtIndex:withComponent:](self, "replaceComponentAtIndex:withComponent:", -[SXComponents indexOfComponent:](self, "indexOfComponent:", a3), v6);

}

- (void)setComponents:(id)a3
{
  id v4;

  v4 = a3;
  -[SXComponents removeAllComponents](self, "removeAllComponents");
  -[SXComponents addComponentsFromArray:](self, "addComponentsFromArray:", v4);

}

- (void)removeComponentAtIndex:(unint64_t)a3
{
  id v5;

  if (-[SXComponents count](self, "count") > a3)
  {
    -[NSMutableArray objectAtIndex:](self->_components, "objectAtIndex:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponents _removeComponent:](self, "_removeComponent:", v5);

  }
}

- (void)removeComponentWithIdentifier:(id)a3
{
  id v4;

  if (a3)
  {
    -[NSMutableDictionary objectForKey:](self->_componentsByIdentifier, "objectForKey:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SXComponents _removeComponent:](self, "_removeComponent:", v4);

  }
}

- (void)removeAllComponents
{
  -[NSMutableArray removeAllObjects](self->_components, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_componentsByIdentifier, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_childComponentsByParentIdentifier, "removeAllObjects");
}

- (void)_removeComponent:(id)a3
{
  NSMutableArray *components;
  id v5;
  NSMutableDictionary *componentsByIdentifier;
  void *v7;
  NSMutableDictionary *childComponentsByParentIdentifier;
  id v9;

  if (a3)
  {
    components = self->_components;
    v5 = a3;
    -[NSMutableArray removeObject:](components, "removeObject:", v5);
    componentsByIdentifier = self->_componentsByIdentifier;
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](componentsByIdentifier, "removeObjectForKey:", v7);

    childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
    objc_msgSend(v5, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary removeObjectForKey:](childComponentsByParentIdentifier, "removeObjectForKey:", v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  SXComponents *v4;
  uint64_t v5;
  NSMutableArray *components;
  uint64_t v7;
  NSMutableDictionary *componentsByIdentifier;
  void *v9;
  NSMutableDictionary *childComponentsByParentIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  _QWORD v15[4];
  NSMutableDictionary *v16;

  v4 = -[SXComponents initWithArray:]([SXComponents alloc], "initWithArray:", 0);
  v5 = -[NSMutableArray mutableCopy](self->_components, "mutableCopy");
  components = v4->_components;
  v4->_components = (NSMutableArray *)v5;

  v7 = -[NSMutableDictionary mutableCopy](self->_componentsByIdentifier, "mutableCopy");
  componentsByIdentifier = v4->_componentsByIdentifier;
  v4->_componentsByIdentifier = (NSMutableDictionary *)v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_childComponentsByParentIdentifier, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __29__SXComponents_copyWithZone___block_invoke;
  v15[3] = &unk_24D68A4E8;
  v11 = v9;
  v16 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](childComponentsByParentIdentifier, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v4->_childComponentsByParentIdentifier;
  v4->_childComponentsByParentIdentifier = v11;
  v13 = v11;

  return v4;
}

void __29__SXComponents_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  SXMutableComponents *v4;
  uint64_t v5;
  NSMutableArray *components;
  uint64_t v7;
  NSMutableDictionary *componentsByIdentifier;
  void *v9;
  NSMutableDictionary *childComponentsByParentIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  _QWORD v15[4];
  NSMutableDictionary *v16;

  v4 = -[SXComponents initWithArray:]([SXMutableComponents alloc], "initWithArray:", 0);
  v5 = -[NSMutableArray mutableCopy](self->_components, "mutableCopy");
  components = v4->super._components;
  v4->super._components = (NSMutableArray *)v5;

  v7 = -[NSMutableDictionary mutableCopy](self->_componentsByIdentifier, "mutableCopy");
  componentsByIdentifier = v4->super._componentsByIdentifier;
  v4->super._componentsByIdentifier = (NSMutableDictionary *)v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", -[NSMutableDictionary count](self->_childComponentsByParentIdentifier, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  childComponentsByParentIdentifier = self->_childComponentsByParentIdentifier;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __36__SXComponents_mutableCopyWithZone___block_invoke;
  v15[3] = &unk_24D68A4E8;
  v11 = v9;
  v16 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](childComponentsByParentIdentifier, "enumerateKeysAndObjectsUsingBlock:", v15);
  v12 = v4->super._childComponentsByParentIdentifier;
  v4->super._childComponentsByParentIdentifier = v11;
  v13 = v11;

  return v4;
}

void __36__SXComponents_mutableCopyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (BOOL)isEqual:(id)a3
{
  SXComponents *v4;
  char v5;

  v4 = (SXComponents *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && -[NSMutableArray isEqualToArray:](self->_components, "isEqualToArray:", v4->_components)
      && -[NSMutableDictionary isEqualToDictionary:](self->_componentsByIdentifier, "isEqualToDictionary:", v4->_componentsByIdentifier))
    {
      v5 = -[NSMutableDictionary isEqualToDictionary:](self->_childComponentsByParentIdentifier, "isEqualToDictionary:", v4->_childComponentsByParentIdentifier);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_components, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (NSMutableArray)components
{
  return self->_components;
}

- (NSMutableDictionary)componentsByIdentifier
{
  return self->_componentsByIdentifier;
}

- (NSMutableDictionary)childComponentsByParentIdentifier
{
  return self->_childComponentsByParentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childComponentsByParentIdentifier, 0);
  objc_storeStrong((id *)&self->_componentsByIdentifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
