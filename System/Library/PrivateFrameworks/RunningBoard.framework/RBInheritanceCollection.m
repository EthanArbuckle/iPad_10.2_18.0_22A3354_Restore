@implementation RBInheritanceCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namespaces, 0);
  objc_storeStrong((id *)&self->_inheritances, 0);
  objc_storeStrong((id *)&self->_inheritancesByEnvironment, 0);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSSet countByEnumeratingWithState:objects:count:](self->_inheritances, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)_initWithCollection:(id)a3
{
  id v4;
  RBInheritanceCollection *v5;
  uint64_t v6;
  NSDictionary *inheritancesByEnvironment;
  uint64_t v8;
  NSSet *inheritances;
  void *v10;
  uint64_t v11;
  NSSet *namespaces;

  v4 = a3;
  v5 = -[RBInheritanceCollection init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", *((_QWORD *)v4 + 1), 1);
    inheritancesByEnvironment = v5->_inheritancesByEnvironment;
    v5->_inheritancesByEnvironment = (NSDictionary *)v6;

    v8 = objc_msgSend(*((id *)v4 + 2), "copy");
    inheritances = v5->_inheritances;
    v5->_inheritances = (NSSet *)v8;

    objc_msgSend(v4, "allNamespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      namespaces = v5->_namespaces;
      v5->_namespaces = (NSSet *)v11;

    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBMutableInheritanceCollection _initWithCollection:]([RBMutableInheritanceCollection alloc], "_initWithCollection:", self);
}

- (unint64_t)count
{
  return -[NSSet count](self->_inheritances, "count");
}

- (id)allInheritances
{
  return self->_inheritances;
}

- (id)allNamespaces
{
  return self->_namespaces;
}

- (id)inheritancesForEnvironment:(id)a3
{
  if (!a3)
    return 0;
  -[NSDictionary objectForKey:](self->_inheritancesByEnvironment, "objectForKey:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  RBInheritanceCollection *v4;
  RBInheritanceCollection *v5;
  NSSet *inheritances;
  const __CFSet *v7;
  char v8;
  CFIndex Count;

  v4 = (RBInheritanceCollection *)a3;
  v5 = v4;
  if (self == v4
    || (inheritances = self->_inheritances, v7 = (const __CFSet *)v4->_inheritances, inheritances == (NSSet *)v7))
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (inheritances && v7)
    {
      Count = CFSetGetCount((CFSetRef)inheritances);
      if (Count == CFSetGetCount(v7))
        v8 = -[NSSet isEqualToSet:](inheritances, "isEqualToSet:", v7);
      else
        v8 = 0;
    }
  }

  return v8;
}

+ (RBInheritanceCollection)collectionWithInheritances:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[RBInheritanceCollection _initWithInheritances:]([RBInheritanceCollection alloc], "_initWithInheritances:", v3);

  return (RBInheritanceCollection *)v4;
}

- (id)_initWithInheritances:(id)a3
{
  id v4;
  RBInheritanceCollection *v5;
  RBInheritanceCollection *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *inheritancesByEnvironment;
  uint64_t v20;
  NSSet *namespaces;
  uint64_t v22;
  NSSet *inheritances;
  id v25;
  RBInheritanceCollection *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[RBInheritanceCollection init](self, "init");
  v6 = v5;
  if (v5)
  {
    v26 = v5;
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "environment", v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v7, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v16)
            {
              objc_msgSend(MEMORY[0x24BDBCEF0], "set");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "setObject:forKey:", v16, v15);
            }
            objc_msgSend(v16, "addObject:", v14);

          }
          objc_msgSend(v14, "endowmentNamespace");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v17);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v11);
    }

    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithDictionary:copyItems:", v7, 1);
    v6 = v26;
    inheritancesByEnvironment = v26->_inheritancesByEnvironment;
    v26->_inheritancesByEnvironment = (NSDictionary *)v18;

    v20 = objc_msgSend(v8, "copy");
    namespaces = v26->_namespaces;
    v26->_namespaces = (NSSet *)v20;

    v22 = objc_msgSend(v9, "copy");
    inheritances = v26->_inheritances;
    v26->_inheritances = (NSSet *)v22;

    v4 = v25;
  }

  return v6;
}

- (id)allEnvironments
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSDictionary allKeys](self->_inheritancesByEnvironment, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  id v3;
  NSDictionary *inheritancesByEnvironment;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  inheritancesByEnvironment = self->_inheritancesByEnvironment;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__RBInheritanceCollection_description__block_invoke;
  v10[3] = &unk_24DD46760;
  v11 = v3;
  v5 = v3;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](inheritancesByEnvironment, "enumerateKeysAndObjectsUsingBlock:", v10);
  v6 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("<%@| inheritancesByEnvironment:{\n\t%@\n\t}>"), v7, v5);

  return v8;
}

void __38__RBInheritanceCollection_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(",\n\t\t"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("%@=[\n\t\t%@\n\t\t]\n\t\t"), v5, v6);

}

@end
