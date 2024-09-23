@implementation SBAppSwitcherServiceSet

- (SBAppSwitcherServiceSet)initWithServices:(id)a3 zone:(_NSZone *)a4
{
  id v6;
  SBAppSwitcherServiceSet *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *services;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBAppSwitcherServiceSet;
  v7 = -[SBAppSwitcherServiceSet init](&v12, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "services");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copyWithZone:", a4);
    services = v7->_services;
    v7->_services = (NSMutableArray *)v9;

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SBAppSwitcherServiceSet initWithServices:zone:]([SBAppSwitcherServiceSet alloc], "initWithServices:zone:", self, a3);
}

- (void)addService:(id)a3
{
  id v4;
  NSMutableArray *services;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  services = self->_services;
  v8 = v4;
  if (!services)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_services;
    self->_services = v6;

    v4 = v8;
    services = self->_services;
  }
  -[NSMutableArray addObject:](services, "addObject:", v4);

}

- (void)removeService:(id)a3
{
  -[NSMutableArray removeObject:](self->_services, "removeObject:", a3);
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_services, "count");
}

- (id)serviceAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_services, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_services, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)serviceForBundleIdentifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_services;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "bundleIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v4))
        {
          v6 = v9;

          goto LABEL_11;
        }

      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)serviceBundleIdentifiers
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_services, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_services;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "bundleIdentifier", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)appLayouts
{
  void *v2;
  void *v3;

  -[SBAppSwitcherServiceSet serviceBundleIdentifiers](self, "serviceBundleIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_mapNoNulls:", &__block_literal_global_198);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SBAppLayout *__37__SBAppSwitcherServiceSet_appLayouts__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  SBAppLayout *v3;
  void *v4;
  void *v5;
  SBAppLayout *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  +[SBDisplayItem switcherServiceDisplayItemWithServiceIdentifier:](SBDisplayItem, "switcherServiceDisplayItemWithServiceIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [SBAppLayout alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4;
  v9[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:](v3, "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v5, 1, 1, 0);

  return v6;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_services, 0);
}

@end
