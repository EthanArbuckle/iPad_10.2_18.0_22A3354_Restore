@implementation RBMutableInheritanceCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countedNamespaces, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[RBInheritanceCollection _initWithCollection:]([RBInheritanceCollection alloc], "_initWithCollection:", self);
}

- (id)allNamespaces
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_countedNamespaces);
}

- (id)_initWithCollection:(id)a3
{
  id *v4;
  RBMutableInheritanceCollection *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *inheritancesByEnvironment;
  id v9;
  uint64_t v10;
  NSSet *inheritances;
  NSCountedSet *v12;
  NSCountedSet *countedNamespaces;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSCountedSet *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  RBMutableInheritanceCollection *v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = (id *)a3;
  v29.receiver = self;
  v29.super_class = (Class)RBMutableInheritanceCollection;
  v5 = -[RBMutableInheritanceCollection init](&v29, sel_init);
  if (v5)
  {
    v6 = v4[1];
    if (objc_msgSend(v6, "count"))
    {
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      inheritancesByEnvironment = v5->super._inheritancesByEnvironment;
      v5->super._inheritancesByEnvironment = v7;

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __54__RBMutableInheritanceCollection__initWithCollection___block_invoke;
      v27[3] = &unk_24DD46760;
      v28 = v5;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v27);

    }
    v9 = v4[2];
    if (objc_msgSend(v9, "count"))
    {
      v22 = v6;
      v10 = objc_msgSend(v9, "mutableCopy");
      inheritances = v5->super._inheritances;
      v5->super._inheritances = (NSSet *)v10;

      v12 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
      countedNamespaces = v5->_countedNamespaces;
      v5->_countedNamespaces = v12;

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = v5->_countedNamespaces;
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18), "endowmentNamespace");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSCountedSet addObject:](v19, "addObject:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
        }
        while (v16);
      }

      v6 = v22;
    }

  }
  return v5;
}

- (void)removeInheritance:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSCountedSet *countedNamespaces;
  void *v9;
  NSSet *inheritances;
  NSCountedSet *v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBInheritanceCollection.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inheritance != nil"));

    v5 = 0;
  }
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSDictionary objectForKey:](self->super._inheritancesByEnvironment, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v13);
    if (!objc_msgSend(v7, "count"))
      -[NSDictionary removeObjectForKey:](self->super._inheritancesByEnvironment, "removeObjectForKey:", v6);

  }
  -[NSSet removeObject:](self->super._inheritances, "removeObject:", v13);
  countedNamespaces = self->_countedNamespaces;
  objc_msgSend(v13, "endowmentNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet removeObject:](countedNamespaces, "removeObject:", v9);

  if (!-[NSSet count](self->super._inheritances, "count"))
  {
    inheritances = self->super._inheritances;
    self->super._inheritances = 0;

  }
  if (!-[NSCountedSet count](self->_countedNamespaces, "count"))
  {
    v11 = self->_countedNamespaces;
    self->_countedNamespaces = 0;

  }
}

void __54__RBMutableInheritanceCollection__initWithCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v4, "setObject:forKey:", v6, v5);

}

- (void)unionCollection:(id)a3
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
        -[RBMutableInheritanceCollection addInheritance:](self, "addInheritance:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addInheritance:(id)a3
{
  id v5;
  NSSet *v6;
  NSSet *inheritances;
  NSCountedSet *v8;
  NSCountedSet *countedNamespaces;
  void *v10;
  NSDictionary *inheritancesByEnvironment;
  NSDictionary *v12;
  NSDictionary *v13;
  void *v14;
  NSCountedSet *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a3;
  v18 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBInheritanceCollection.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("inheritance != nil"));

    v5 = 0;
  }
  if (!self->super._inheritances)
  {
    v6 = (NSSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    inheritances = self->super._inheritances;
    self->super._inheritances = v6;

    v5 = v18;
  }
  if (!self->_countedNamespaces)
  {
    v8 = (NSCountedSet *)objc_alloc_init(MEMORY[0x24BDD14E0]);
    countedNamespaces = self->_countedNamespaces;
    self->_countedNamespaces = v8;

    v5 = v18;
  }
  objc_msgSend(v5, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    if (!inheritancesByEnvironment)
    {
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v13 = self->super._inheritancesByEnvironment;
      self->super._inheritancesByEnvironment = v12;

      inheritancesByEnvironment = self->super._inheritancesByEnvironment;
    }
    -[NSDictionary objectForKey:](inheritancesByEnvironment, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKey:](self->super._inheritancesByEnvironment, "setObject:forKey:", v14, v10);
    }
    objc_msgSend(v14, "addObject:", v18);

  }
  -[NSSet addObject:](self->super._inheritances, "addObject:", v18);
  v15 = self->_countedNamespaces;
  objc_msgSend(v18, "endowmentNamespace");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](v15, "addObject:", v16);

}

+ (id)collectionWithInheritances:(id)a3
{
  id v4;
  RBMutableInheritanceCollection *v5;
  void *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v5 = [RBMutableInheritanceCollection alloc];
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___RBMutableInheritanceCollection;
  objc_msgSendSuper2(&v9, sel_collectionWithInheritances_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[RBMutableInheritanceCollection _initWithCollection:](v5, "_initWithCollection:", v6);
  return v7;
}

@end
